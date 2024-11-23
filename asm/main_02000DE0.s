	.include "asm/macros.inc"
	.include "main_02000DE0.inc"

	.text

	arm_func_start InitMemAllocTable
InitMemAllocTable: ; 0x02000DE0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _02000E54 ; =_020B4BC0
	ldr r3, _02000E58 ; =0x001E6400
	ldr r0, _02000E5C ; =_02090B70
	mov r2, r1
	str r1, [sp]
	str r3, [sp, #4]
	bl Debug_Print0
	ldr ip, _02000E60 ; =_020B3380
	mov lr, #0
	ldr r0, _02000E64 ; =_020B3384
	ldr r2, _02000E68 ; =_020B33C0
	add r1, sp, #0
	mov r3, #0x100
	str lr, [ip]
	bl InitMemArena
	ldr r0, _02000E6C ; =_020AEF08
	bl sub_02002C40
	ldr r0, _02000E6C ; =_020AEF08
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02000E6C ; =_020AEF08
	bl sub_02002E98
	mov r0, #0
	mov r1, r0
	bl SetMemAllocatorParams
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02000E54: .word _020B4BC0
_02000E58: .word 0x001E6400
_02000E5C: .word _02090B70
_02000E60: .word _020B3380
_02000E64: .word _020B3384
_02000E68: .word _020B33C0
_02000E6C: .word _020AEF08
	arm_func_end InitMemAllocTable

	arm_func_start SetMemAllocatorParams
SetMemAllocatorParams: ; 0x02000E70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02000EB0 ; =_020AEF08
	mov r4, r1
	bl sub_02002CB4
	cmp r5, #0
	ldreq r5, _02000EB4 ; =GetAllocArenaDefault
	ldr r0, _02000EB8 ; =MEMORY_ALLOCATION_ARENA_GETTERS
	cmp r4, #0
	str r5, [r0]
	ldreq r4, _02000EBC ; =GetFreeArenaDefault
	ldr r1, _02000EB8 ; =MEMORY_ALLOCATION_ARENA_GETTERS
	ldr r0, _02000EB0 ; =_020AEF08
	str r4, [r1, #4]
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02000EB0: .word _020AEF08
_02000EB4: .word GetAllocArenaDefault
_02000EB8: .word MEMORY_ALLOCATION_ARENA_GETTERS
_02000EBC: .word GetFreeArenaDefault
	arm_func_end SetMemAllocatorParams

	arm_func_start GetAllocArenaDefault
GetAllocArenaDefault: ; 0x02000EC0
	bx lr
	arm_func_end GetAllocArenaDefault

	arm_func_start GetFreeArenaDefault
GetFreeArenaDefault: ; 0x02000EC4
	bx lr
	arm_func_end GetFreeArenaDefault

	arm_func_start InitMemArena
InitMemArena: ; 0x02000EC8
	stmdb sp!, {r4, r5, r6, lr}
	ldr ip, _02000F3C ; =_020B3380
	ldr r6, [r1, #4]
	ldr r5, [ip]
	ldr lr, _02000F40 ; =_020B33A0
	add r4, r5, #1
	str r4, [ip]
	str r0, [lr, r5, lsl #2]
	ldr r1, [r1]
	bic r4, r6, #3
	str r1, [r0, #0x14]
	str r4, [r0, #0x18]
	mov r1, #2
	str r1, [r0]
	mov ip, #0
	str ip, [r0, #4]
	str r2, [r0, #8]
	mov r1, #1
	str r1, [r0, #0xc]
	str r3, [r0, #0x10]
	ldr r1, [r0, #8]
	str ip, [r1]
	str ip, [r1, #4]
	ldr r0, [r0, #0x14]
	str r0, [r1, #0xc]
	str r4, [r1, #0x10]
	str ip, [r1, #0x14]
	str ip, [r1, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02000F3C: .word _020B3380
_02000F40: .word _020B33A0
	arm_func_end InitMemArena

	arm_func_start MemAllocFlagsToBlockType
MemAllocFlagsToBlockType: ; 0x02000F44
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	tst r0, #8
	movne r0, #4
	bxne lr
	and r0, r0, #7
	cmp r0, #7
	moveq r0, #1
	bxeq lr
	cmp r0, #1
	moveq r0, #2
	bxeq lr
	cmp r0, #3
	moveq r0, #3
	movne r0, #5
	bx lr
	arm_func_end MemAllocFlagsToBlockType

	arm_func_start FindAvailableMemBlock
FindAvailableMemBlock: ; 0x02000F88
	stmdb sp!, {r3, lr}
	tst r1, #4
	beq _02001008
	ldr r1, [r0, #0xc]
	ldr r3, [r0, #8]
	sub r0, r1, #1
	mov r1, #0x18
	mla r3, r0, r1, r3
	b _02000FD0
_02000FAC:
	ldr r1, [r3, #4]
	tst r1, #1
	bne _02000FC8
	ldr r1, [r3, #0x10]
	cmp r1, r2
	blt _02000FFC
	ldmia sp!, {r3, pc}
_02000FC8:
	sub r0, r0, #1
	sub r3, r3, #0x18
_02000FD0:
	cmp r0, #0
	bge _02000FAC
	b _02000FFC
_02000FDC:
	ldr r1, [r3, #4]
	tst r1, #1
	bne _02000FF4
	ldr r1, [r3, #0x10]
	cmp r1, r2
	ldmgeia sp!, {r3, pc}
_02000FF4:
	sub r0, r0, #1
	sub r3, r3, #0x18
_02000FFC:
	cmp r0, #0
	bge _02000FDC
	b _02001064
_02001008:
	ldr r3, [r0, #0xc]
	ldr r1, [r0, #8]
	subs ip, r3, #1
	mov r0, #0x18
	mla lr, ip, r0, r1
	ldr r3, _0200106C ; =0x001E6401
	mvn r0, #0
	ldmmiia sp!, {r3, pc}
	b _02001058
_0200102C:
	ldr r1, [lr, #4]
	tst r1, #1
	bne _02001050
	ldr r1, [lr, #0x10]
	cmp r1, r2
	blt _02001050
	cmp r1, r3
	movlt r0, ip
	movlt r3, r1
_02001050:
	sub ip, ip, #1
	sub lr, lr, #0x18
_02001058:
	cmp ip, #0
	bge _0200102C
	ldmia sp!, {r3, pc}
_02001064:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200106C: .word 0x001E6401
	arm_func_end FindAvailableMemBlock

	arm_func_start SplitMemBlock
SplitMemBlock: ; 0x02001070
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r5, [sl, #8]
	mov sb, r1
	mov r0, #0x18
	mla r4, sb, r0, r5
	mov fp, r3
	add r3, fp, #3
	ldr r1, [r4, #0x10]
	bic r7, r3, #3
	mov r8, r2
	cmp r1, r7
	ble _02001148
	ldr r6, [sl, #0xc]
	mla r5, r6, r0, r5
	cmp r6, sb
	ble _020010E4
	b _020010DC
_020010BC:
	sub lr, r5, #0x18
	mov ip, r5
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	sub r6, r6, #1
	sub r5, r5, #0x18
_020010DC:
	cmp r6, sb
	bgt _020010BC
_020010E4:
	ldr r0, [sl, #0xc]
	add r1, r0, #1
	str r1, [sl, #0xc]
	ldr r0, [sl, #0x10]
	cmp r1, r0
	ble _02001124
	ldr r1, _02001168 ; =_02090B40
	add r0, sp, #0
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x18]
	str r2, [sp, #4]
	str r1, [sp]
	ldr r2, [sl, #0xc]
	ldr r3, [sl, #0x10]
	ldr r1, _0200116C ; =_02090BA0
	bl Debug_FatalError
_02001124:
	ldr r0, [r4, #0x10]
	sub r1, r0, r7
	str r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	add r4, r4, #0x18
	add r0, r0, r1
	str r0, [r4, #0xc]
	str r7, [r4, #0x10]
	str fp, [r4, #0x14]
_02001148:
	mov r0, r8
	bl MemAllocFlagsToBlockType
	stmia r4, {r0, r8}
	ldr r1, [sp, #0x30]
	mov r0, r4
	str r1, [r4, #8]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02001168: .word _02090B40
_0200116C: .word _02090BA0
	arm_func_end SplitMemBlock

	arm_func_start MemAlloc
MemAlloc: ; 0x02001170
	ldr ip, _02001184 ; =MemLocateSet
	mov r2, r1
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_02001184: .word MemLocateSet
	arm_func_end MemAlloc

	arm_func_start MemFree
MemFree: ; 0x02001188
	ldr ip, _02001198 ; =MemLocateUnset
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_02001198: .word MemLocateUnset
	arm_func_end MemFree

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

	arm_func_start RoundUpDiv256
RoundUpDiv256: ; 0x02001894
	tst r0, #0xff
	addne r0, r0, #0x100
	mov r0, r0, asr #8
	bx lr
	arm_func_end RoundUpDiv256

	arm_func_start sub_020018A4
sub_020018A4: ; 0x020018A4
	and r2, r1, #0
	and r3, r0, #0xff
	cmp r2, #0
	cmpeq r3, #0
	mov r2, #0
	beq _020018C4
	adds r0, r0, #0x100
	adc r1, r1, r2
_020018C4:
	mov r0, r0, lsr #8
	orr r0, r0, r1, lsl #24
	bx lr
	arm_func_end sub_020018A4

	arm_func_start sub_020018D0
sub_020018D0: ; 0x020018D0
	and r1, r0, #0xc00
	cmp r1, #0x400
	bgt _020018EC
	bge _0200191C
	cmp r1, #0
	beq _02001908
	b _02001970
_020018EC:
	cmp r1, #0x800
	bgt _020018FC
	beq _02001938
	b _02001970
_020018FC:
	cmp r1, #0xc00
	beq _02001950
	b _02001970
_02001908:
	mov r1, r0, lsl #0x16
	ldr r0, _02001978 ; =_02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	bx lr
_0200191C:
	ldr r1, _0200197C ; =0x000003FF
	ldr r2, _02001978 ; =_02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	bx lr
_02001938:
	mov r1, r0, lsl #0x16
	ldr r0, _02001978 ; =_02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	rsb r0, r0, #0
	bx lr
_02001950:
	ldr r1, _0200197C ; =0x000003FF
	ldr r2, _02001978 ; =_02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	rsb r0, r0, #0
	bx lr
_02001970:
	mov r0, #0
	bx lr
	.align 2, 0
_02001978: .word _02090C48
_0200197C: .word 0x000003FF
	arm_func_end sub_020018D0

	arm_func_start sub_02001980
sub_02001980: ; 0x02001980
	and r1, r0, #0xc00
	cmp r1, #0x400
	bgt _0200199C
	bge _020019D4
	cmp r1, #0
	beq _020019B8
	b _02001A20
_0200199C:
	cmp r1, #0x800
	bgt _020019AC
	beq _020019EC
	b _02001A20
_020019AC:
	cmp r1, #0xc00
	beq _02001A0C
	b _02001A20
_020019B8:
	ldr r1, _02001A28 ; =0x000003FF
	ldr r2, _02001A2C ; =_02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	bx lr
_020019D4:
	mov r1, r0, lsl #0x16
	ldr r0, _02001A2C ; =_02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	rsb r0, r0, #0
	bx lr
_020019EC:
	ldr r1, _02001A28 ; =0x000003FF
	ldr r2, _02001A2C ; =_02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	rsb r0, r0, #0
	bx lr
_02001A0C:
	mov r1, r0, lsl #0x16
	ldr r0, _02001A2C ; =_02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	bx lr
_02001A20:
	mov r0, #0
	bx lr
	.align 2, 0
_02001A28: .word 0x000003FF
_02001A2C: .word _02090C48
	arm_func_end sub_02001980

	arm_func_start UFixedPoint64CmpLt
UFixedPoint64CmpLt: ; 0x02001A30
	cmp r0, r2
	movlo r0, #1
	bxlo lr
	movhi r0, #0
	bxhi lr
	cmp r1, r3
	movlo r0, #1
	movhs r0, #0
	bx lr
	arm_func_end UFixedPoint64CmpLt

	arm_func_start MultiplyByFixedPoint
MultiplyByFixedPoint: ; 0x02001A54
	stmdb sp!, {r3, r4, r5, lr}
	tst r0, #0x80000000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x80000000
	and r4, r2, #0xff
	movne r2, #1
	moveq r2, #0
	cmp r0, #0
	and r5, r2, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	rsbne r0, r0, #0
	cmp r5, #0
	rsbne r1, r1, #0
	bl UMultiplyByFixedPoint
	cmp r4, r5
	rsbne r0, r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end MultiplyByFixedPoint

	arm_func_start sub_02001AB0
sub_02001AB0: ; 0x02001AB0
	stmdb sp!, {r3, r4, r5, lr}
	tst r0, #0x80000000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x80000000
	and r4, r2, #0xff
	movne r2, #1
	moveq r2, #0
	cmp r1, #0
	and r5, r2, #0xff
	mvneq r0, #0x80000000
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	rsbne r0, r0, #0
	cmp r5, #0
	rsbne r1, r1, #0
	bl sub_02001BB4
	cmp r4, r5
	rsbne r0, r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02001AB0

	arm_func_start UMultiplyByFixedPoint
UMultiplyByFixedPoint: ; 0x02001B0C
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	mov r2, r3
	mov ip, r3
	mov lr, r3
	mov r4, r3
_02001B3C:
	mov r5, lr
	tst r1, #1
	beq _02001B58
	add lr, lr, r0
	add ip, ip, r3
	cmp r5, lr
	addhi ip, ip, #1
_02001B58:
	mov r1, r1, lsr #1
	tst r2, #1
	orrne r1, r1, #0x80000000
	mov r2, r2, lsr #1
	tst r0, #0x80000000
	mov r3, r3, lsl #1
	mov r0, r0, lsl #1
	add r4, r4, #1
	orrne r3, r3, #1
	bic r2, r2, #0x80000000
	cmp r4, #0x40
	bic r0, r0, #1
	blt _02001B3C
	mov r0, lr, lsr #8
	tst lr, #0x80
	movne r1, #1
	bic r0, r0, #0xff000000
	moveq r1, #0
	orr lr, r0, ip, lsl #24
	tst r1, #0xff
	addne lr, lr, #1
	mov r0, lr
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UMultiplyByFixedPoint

	arm_func_start sub_02001BB4
sub_02001BB4: ; 0x02001BB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r1
	mvneq r0, #0x80000000
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r1, r0, asr #0x18
	mov r0, r0, lsl #8
	mov r4, r8
	mov r5, r8
	mov sb, r8
	and r6, r1, #0xff
	bic r7, r0, #0xff
	mov fp, r8
_02001BF4:
	mov r0, r5, lsl #1
	tst r5, #0x80000000
	mov r4, r4, lsl #1
	orrne r4, r4, #1
	bic r5, r0, #1
	tst r6, #0x80000000
	orrne r5, r5, #1
	mov r3, r7, lsl #1
	tst r7, #0x80000000
	mov r6, r6, lsl #1
	bic r7, r3, #1
	mov r0, r4
	mov r1, r5
	mov r2, fp
	mov r3, sl
	orrne r6, r6, #1
	bl UFixedPoint64CmpLt
	cmp r0, #0
	bne _02001C58
	mov r0, r5
	sub r5, r5, sl
	cmp r0, r5
	mov r1, #1
	sublo r4, r4, #1
	b _02001C5C
_02001C58:
	mov r1, #0
_02001C5C:
	mov r0, r8, lsl #1
	bic r8, r0, #1
	cmp r1, #0
	add sb, sb, #1
	orrne r8, r8, #1
	cmp sb, #0x40
	blt _02001BF4
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02001BB4

	arm_func_start IntToFixedPoint64
IntToFixedPoint64: ; 0x02001C80
	mov r2, #0x10000
	rsb r2, r2, #0
	and r3, r1, r2
	mov r3, r3, lsr #0x10
	str r3, [r0]
	mov r3, r1, lsl #0x10
	str r3, [r0, #4]
	tst r1, #0x8000
	ldrne r1, [r0]
	orrne r1, r1, r2
	strne r1, [r0]
	bx lr
	arm_func_end IntToFixedPoint64

	arm_func_start FixedPoint64ToInt
FixedPoint64ToInt: ; 0x02001CB0
	ldmia r0, {r1, r2}
	mov r0, #0x10000
	rsb r0, r0, #0
	mov r1, r1, lsl #0x10
	and r0, r2, r0
	orr r0, r1, r0, lsr #16
	tst r2, #0x8000
	addne r0, r0, #1
	bx lr
	arm_func_end FixedPoint64ToInt

	arm_func_start FixedPoint32To64
FixedPoint32To64: ; 0x02001CD4
	mov r2, r1, asr #0x18
	mov r3, r1, lsl #8
	tst r2, #0x80
	mvnne r1, #0x7f
	orrne r1, r2, r1
	stmia r0, {r2, r3}
	andeq r1, r2, #0x7f
	str r1, [r0]
	bx lr
	arm_func_end FixedPoint32To64

	arm_func_start NegateFixedPoint64
NegateFixedPoint64: ; 0x02001CF8
	ldr r2, [r0]
	mvn r1, #0
	eor r2, r2, r1
	str r2, [r0]
	ldr r2, [r0, #4]
	eor r2, r2, r1
	adds r1, r2, #1
	str r1, [r0, #4]
	ldreq r1, [r0]
	addeq r1, r1, #1
	streq r1, [r0]
	bx lr
	arm_func_end NegateFixedPoint64

	arm_func_start FixedPoint64IsZero
FixedPoint64IsZero: ; 0x02001D28
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	bxne lr
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end FixedPoint64IsZero

	arm_func_start FixedPoint64IsNegative
FixedPoint64IsNegative: ; 0x02001D50
	ldr r0, [r0]
	tst r0, #0x80000000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end FixedPoint64IsNegative

	arm_func_start FixedPoint64CmpLt
FixedPoint64CmpLt: ; 0x02001D68
	stmdb sp!, {r3, lr}
	mov ip, r1
	ldr r2, [ip]
	mov lr, r0
	tst r2, #0x80000000
	movne r1, #2
	ldr r0, [lr]
	moveq r1, #0
	tst r0, #0x80000000
	movne r3, #1
	moveq r3, #0
	orr r1, r3, r1
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02001DB4
_02001DA4: ; jump table
	b _02001DB4 ; case 0
	b _02001DC4 ; case 1
	b _02001DCC ; case 2
	b _02001DD4 ; case 3
_02001DB4:
	ldr r1, [lr, #4]
	ldr r3, [ip, #4]
	bl UFixedPoint64CmpLt
	ldmia sp!, {r3, pc}
_02001DC4:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02001DCC:
	mov r0, #0
	ldmia sp!, {r3, pc}
_02001DD4:
	ldr r1, [lr, #4]
	ldr r3, [ip, #4]
	bl UFixedPoint64CmpLt
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end FixedPoint64CmpLt

	arm_func_start MultiplyFixedPoint64
MultiplyFixedPoint64: ; 0x02001DF4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, [r1]
	mov r4, r0
	str r3, [sp, #0x10]
	ldr r1, [r1, #4]
	add r0, sp, #0x10
	str r1, [sp, #0x14]
	ldr r1, [r2]
	str r1, [sp, #8]
	ldr r1, [r2, #4]
	str r1, [sp, #0xc]
	bl FixedPoint64IsNegative
	mov r5, r0
	add r0, sp, #8
	bl FixedPoint64IsNegative
	mov r6, r0
	add r0, sp, #0x10
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001EC0
	add r0, sp, #8
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001EC0
	cmp r5, #0
	beq _02001E80
	add r0, sp, #0x10
	bl NegateFixedPoint64
_02001E80:
	cmp r6, #0
	beq _02001E90
	add r0, sp, #8
	bl NegateFixedPoint64
_02001E90:
	add r0, sp, #0
	add r1, sp, #0x10
	add r2, sp, #8
	bl UMultiplyFixedPoint64
	cmp r5, r6
	beq _02001EB0
	add r0, sp, #0
	bl NegateFixedPoint64
_02001EB0:
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	str r0, [r4, #4]
_02001EC0:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MultiplyFixedPoint64

	arm_func_start DivideFixedPoint64
DivideFixedPoint64: ; 0x02001EC8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, [r1]
	mov r4, r0
	str r3, [sp, #0x10]
	ldr r1, [r1, #4]
	add r0, sp, #0x10
	str r1, [sp, #0x14]
	ldr r1, [r2]
	str r1, [sp, #8]
	ldr r1, [r2, #4]
	str r1, [sp, #0xc]
	bl FixedPoint64IsNegative
	mov r5, r0
	add r0, sp, #8
	bl FixedPoint64IsNegative
	mov r6, r0
	add r0, sp, #8
	bl FixedPoint64IsZero
	cmp r0, #0
	mvnne r0, #0x80000000
	strne r0, [r4]
	subne r0, r0, #0x80000000
	strne r0, [r4, #4]
	bne _02001F98
	add r0, sp, #0x10
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	bne _02001F98
	cmp r5, #0
	beq _02001F58
	add r0, sp, #0x10
	bl NegateFixedPoint64
_02001F58:
	cmp r6, #0
	beq _02001F68
	add r0, sp, #8
	bl NegateFixedPoint64
_02001F68:
	add r0, sp, #0
	add r1, sp, #0x10
	add r2, sp, #8
	bl UDivideFixedPoint64
	cmp r5, r6
	beq _02001F88
	add r0, sp, #0
	bl NegateFixedPoint64
_02001F88:
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	str r0, [r4, #4]
_02001F98:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DivideFixedPoint64

	arm_func_start UMultiplyFixedPoint64
UMultiplyFixedPoint64: ; 0x02001FA0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	mov r0, r6
	mov r5, r2
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [r4]
	strne r0, [r4, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov lr, #0
	ldmia r6, {r1, r2}
	ldmia r5, {r3, ip}
	mov r5, lr
	mov r6, lr
_02001FFC:
	mov r0, r5
	tst ip, #1
	beq _02002018
	add r5, r5, r2
	add lr, lr, r1
	cmp r0, r5
	addhi lr, lr, #1
_02002018:
	mov r0, r3, lsr #1
	tst r3, #1
	mov ip, ip, lsr #1
	bic r3, r0, #0x80000000
	orrne ip, ip, #0x80000000
	mov r1, r1, lsl #1
	tst r2, #0x80000000
	mov r0, r2, lsl #1
	add r6, r6, #1
	orrne r1, r1, #1
	cmp r6, #0x40
	bic r2, r0, #1
	blt _02001FFC
	mov r0, r5, lsr #0x10
	mov r0, r0, lsl #0x10
	tst r5, #0x8000
	mov r1, lr, lsl #0x10
	movne r2, #1
	orr r5, r1, r0, lsr #16
	mov r0, lr, lsr #0x10
	moveq r2, #0
	mov r0, r0, lsl #0x10
	tst r2, #0xff
	addne r5, r5, #1
	mov r0, r0, lsr #0x10
	stmia r4, {r0, r5}
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UMultiplyFixedPoint64

	arm_func_start UDivideFixedPoint64
UDivideFixedPoint64: ; 0x02002084
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, r2
	mov sl, r0
	mov r0, r4
	mov r5, r1
	bl FixedPoint64IsZero
	cmp r0, #0
	mvnne r0, #0x80000000
	strne r0, [sl]
	subne r0, r0, #0x80000000
	strne r0, [sl, #4]
	bne _020021C0
	mov r0, r5
	bl FixedPoint64IsZero
	cmp r0, #0
	movne r0, #0
	strne r0, [sl]
	strne r0, [sl, #4]
	bne _020021C0
	ldr r2, [r5, #4]
	mov r0, #0x10000
	mov r1, r2, lsr #0x10
	mov r8, #0
	ldr r3, [r5]
	rsb r0, r0, #0
	and r2, r0, r2, lsl #16
	and r3, r0, r3, lsl #16
	ldr r0, [r4]
	mov r1, r1, lsl #0x10
	ldr fp, [r4, #4]
	str r0, [sp, #4]
	mov sb, r8
	mov r4, r8
	mov r5, r8
	str r8, [sp]
	orr r6, r3, r1, lsr #16
	orr r7, r2, #0x8000
_0200211C:
	mov r0, r5, lsl #1
	tst r5, #0x80000000
	mov r4, r4, lsl #1
	orrne r4, r4, #1
	bic r5, r0, #1
	tst r6, #0x80000000
	orrne r5, r5, #1
	mov r1, r7, lsl #1
	tst r7, #0x80000000
	mov r6, r6, lsl #1
	bic r7, r1, #1
	ldr r2, [sp, #4]
	mov r0, r4
	mov r1, r5
	mov r3, fp
	orrne r6, r6, #1
	bl UFixedPoint64CmpLt
	cmp r0, #0
	bne _02002188
	mov r0, r5
	sub r5, r5, fp
	cmp r0, r5
	ldr r0, [sp, #4]
	mov r1, #1
	sub r4, r4, r0
	sublo r4, r4, #1
	b _0200218C
_02002188:
	mov r1, #0
_0200218C:
	mov r0, sb, lsl #1
	tst sb, #0x80000000
	bic sb, r0, #1
	ldr r0, [sp]
	mov r8, r8, lsl #1
	add r0, r0, #1
	orrne r8, r8, #1
	cmp r1, #0
	orrne sb, sb, #1
	str r0, [sp]
	cmp r0, #0x40
	blt _0200211C
	stmia sl, {r8, sb}
_020021C0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end UDivideFixedPoint64

	arm_func_start AddFixedPoint64
AddFixedPoint64: ; 0x020021C8
	stmdb sp!, {r3, lr}
	ldr ip, [r1, #4]
	ldr lr, [r1]
	ldr r1, [r2]
	ldr r3, [r2, #4]
	add r1, lr, r1
	add r2, ip, r3
	cmp r2, ip
	addlo r1, r1, #1
	stmia r0, {r1, r2}
	ldmia sp!, {r3, pc}
	arm_func_end AddFixedPoint64

	arm_func_start ClampedLn
ClampedLn: ; 0x020021F4
	cmp r1, #1
	movlt r1, #1
	cmp r1, #0x800
	ldrge r1, _02002220 ; =0x000007FF
	ldr r2, _02002224 ; =NATURAL_LOG_VALUE_TABLE
	mov r1, r1, lsl #1
	ldrsh r2, [r2, r1]
	mov r1, #0
	mov r2, r2, lsl #4
	stmia r0, {r1, r2}
	bx lr
	.align 2, 0
_02002220: .word 0x000007FF
_02002224: .word NATURAL_LOG_VALUE_TABLE
	arm_func_end ClampedLn

	arm_func_start sub_02002228
sub_02002228: ; 0x02002228
	bx lr
	arm_func_end sub_02002228

	arm_func_start GetRngSeed
GetRngSeed: ; 0x0200222C
	ldr r0, _02002238 ; =PRNG_SEQUENCE_NUM
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02002238: .word PRNG_SEQUENCE_NUM
	arm_func_end GetRngSeed

	arm_func_start SetRngSeed
SetRngSeed: ; 0x0200223C
	ldr r1, _02002248 ; =PRNG_SEQUENCE_NUM
	strh r0, [r1]
	bx lr
	.align 2, 0
_02002248: .word PRNG_SEQUENCE_NUM
	arm_func_end SetRngSeed

	arm_func_start Rand16Bit
Rand16Bit: ; 0x0200224C
	ldr r1, _02002270 ; =PRNG_SEQUENCE_NUM
	mov r0, #0x6d
	ldrh r2, [r1]
	mul r0, r2, r0
	add r0, r0, #0xfd
	add r0, r0, #0x300
	strh r0, [r1]
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_02002270: .word PRNG_SEQUENCE_NUM
	arm_func_end Rand16Bit

	arm_func_start RandInt
RandInt: ; 0x02002274
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Rand16Bit
	mul r0, r4, r0
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end RandInt

	arm_func_start RandRange
RandRange: ; 0x0200228C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Rand16Bit
	sub r1, r4, r5
	mul r0, r1, r0
	add r0, r5, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RandRange

	arm_func_start Rand32Bit
Rand32Bit: ; 0x020022AC
	stmdb sp!, {r4, lr}
	bl Rand16Bit
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	ldmia sp!, {r4, pc}
	arm_func_end Rand32Bit

	arm_func_start sub_020022C4
sub_020022C4: ; 0x020022C4
	mov r1, #1
	str r1, [r0]
	bx lr
	arm_func_end sub_020022C4

	arm_func_start sub_020022D0
sub_020022D0: ; 0x020022D0
	ldr r3, [r0]
	ldr r2, _020022F4 ; =0x5D588B65
	mul r2, r3, r2
	add r3, r2, #1
	mov r2, r3, lsr #0x10
	mul r1, r2, r1
	str r3, [r0]
	mov r0, r1, lsr #0x10
	bx lr
	.align 2, 0
_020022F4: .word 0x5D588B65
	arm_func_end sub_020022D0

	arm_func_start RandIntSafe
RandIntSafe: ; 0x020022F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mul r0, r1, r4
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end RandIntSafe

	arm_func_start RandRangeSafe
RandRangeSafe: ; 0x02002318
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	bge _0200234C
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r4, r5
	mul r0, r1, r0
	add r0, r5, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
_0200234C:
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r5, r4
	mul r0, r1, r0
	add r0, r4, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RandRangeSafe

	arm_func_start sub_02002368
sub_02002368: ; 0x02002368
	b _02002378
_0200236C:
	cmp r2, r1
	bxeq lr
	add r0, r0, #1
	arm_func_end sub_02002368
_02002378:
	ldrsb r2, [r0]
	cmp r2, #0
	bne _0200236C
	mov r0, #0
	bx lr

	arm_func_start sub_0200238C
sub_0200238C: ; 0x0200238C
	cmp r0, #0x41
	bxlt lr
	cmp r0, #0x5a
	addle r0, r0, #0x20
	movle r0, r0, lsl #0x18
	movle r0, r0, asr #0x18
	bx lr
	arm_func_end sub_0200238C

	arm_func_start sub_020023A8
sub_020023A8: ; 0x020023A8
	mov ip, #0
	b _020023E4
_020023B0:
	ldrsb r3, [r1]
	cmp r3, #0
	bne _020023D8
	mov r1, #0x20
	b _020023CC
_020023C4:
	strb r1, [r0], #1
	add ip, ip, #1
_020023CC:
	cmp ip, r2
	blt _020023C4
	b _020023EC
_020023D8:
	add r1, r1, #1
	strb r3, [r0], #1
	add ip, ip, #1
_020023E4:
	cmp ip, r2
	blt _020023B0
_020023EC:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end sub_020023A8

	arm_func_start sub_020023F8
sub_020023F8: ; 0x020023F8
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02002428
_02002404:
	ldrsb ip, [r0], #1
	ldrsb r3, [r1], #1
	cmp r3, ip
	movne r0, #0
	ldmneia sp!, {r3, pc}
	cmp ip, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_02002428:
	cmp lr, r2
	blt _02002404
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020023F8

	arm_func_start WaitForever
WaitForever: ; 0x02002438
	stmdb sp!, {r3, lr}
	bl sub_02079C14
_02002440:
	bl WaitForInterrupt
	b _02002440
	arm_func_end WaitForever

	arm_func_start sub_02002448
sub_02002448: ; 0x02002448
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AD0
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl sub_02079C14
	bl GX_DispOff
	ldr r3, _02002498 ; =0x04001000
	ldr r0, _0200249C ; =_02092464
	ldr r2, [r3]
	mov r1, r4
	bic r2, r2, #0x10000
	str r2, [r3]
	bl Debug_Print0
	mov r0, r4
	bl sub_0207B930
	bl sub_02079C14
_02002490:
	bl WaitForInterrupt
	b _02002490
	.align 2, 0
_02002498: .word 0x04001000
_0200249C: .word _02092464
	arm_func_end sub_02002448

	arm_func_start sub_020024A0
sub_020024A0: ; 0x020024A0
	ldr r0, _020024AC ; =0x027FFC20
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020024AC: .word 0x027FFC20
	arm_func_end sub_020024A0

	arm_func_start sub_020024B0
sub_020024B0: ; 0x020024B0
	ldr ip, _020024BC ; =sub_020845D8
	mov r0, #0
	bx ip
	.align 2, 0
_020024BC: .word sub_020845D8
	arm_func_end sub_020024B0

	arm_func_start sub_020024C0
sub_020024C0: ; 0x020024C0
	ldr ip, _020024CC ; =sub_020845D8
	ldr r0, _020024D0 ; =sub_020024D4
	bx ip
	.align 2, 0
_020024CC: .word sub_020845D8
_020024D0: .word sub_020024D4
	arm_func_end sub_020024C0

	arm_func_start sub_020024D4
sub_020024D4: ; 0x020024D4
	stmdb sp!, {r3, lr}
	bl CardPullOut
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020024D4

	arm_func_start sub_020024E4
sub_020024E4: ; 0x020024E4
	stmdb sp!, {r3, lr}
	ldr r0, _0200256C ; =_0229AFCC
	bl sub_0207A030
	ldr r0, _0200256C ; =_0229AFCC
	bl sub_0207A048
	mov r1, #0
	ldr r0, _02002570 ; =_0229AFE4
	mov r2, r1
_02002504:
	add r1, r1, #1
	cmp r1, #8
	str r2, [r0], #4
	blt _02002504
	ldr r1, _02002574 ; =_0229AFC0
	ldr r0, _0200256C ; =_0229AFCC
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0207A0CC
	ldr r1, _02002578 ; =_022B966C
	ldr r0, _0200257C ; =_0229B004
	ldr r1, [r1, #4]
	mov r2, #0
	stmia r0, {r1, r2}
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	mov r1, #7
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	bl sub_020026E4
	ldr r0, _02002578 ; =_022B966C
	mov r1, #7
	ldr r0, [r0, #4]
	bl sub_02079A64
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200256C: .word _0229AFCC
_02002570: .word _0229AFE4
_02002574: .word _0229AFC0
_02002578: .word _022B966C
_0200257C: .word _0229B004
	arm_func_end sub_020024E4

	arm_func_start sub_02002580
sub_02002580: ; 0x02002580
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020025E8 ; =_022B966C
	ldr r0, _020025EC ; =_0229AFCC
	ldr r4, [r1, #4]
	bl sub_0207A048
	ldr r0, _020025F0 ; =_0229AFC0
	mov r1, #0
	ldr r3, [r0]
	ldr r2, _020025F4 ; =_0229AFE4
	b _020025CC
_020025A8:
	ldr r5, [r2]
	ldr r0, [r5]
	cmp r0, r4
	bne _020025C4
	ldr r0, _020025EC ; =_0229AFCC
	bl sub_0207A0CC
	b _020025E0
_020025C4:
	add r1, r1, #1
	add r2, r2, #4
_020025CC:
	cmp r1, r3
	blt _020025A8
	ldr r0, _020025EC ; =_0229AFCC
	bl sub_0207A0CC
	mov r5, #0
_020025E0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020025E8: .word _022B966C
_020025EC: .word _0229AFCC
_020025F0: .word _0229AFC0
_020025F4: .word _0229AFE4
	arm_func_end sub_02002580

; https://decomp.me/scratch/mYHOs
	arm_func_start sub_020025F8
sub_020025F8: ; 0x020025F8
	stmdb sp!, {r4, lr}
	cmp r0, #0
	beq _02002614
	ldr r0, [r0]
	mov r1, #0
	bl sub_02079844
	ldmia sp!, {r4, pc}
_02002614:
	mov r4, #0
_02002618:
	mov r0, r4
	bl sub_02079888
	b _02002618
	arm_func_end sub_020025F8

	arm_func_start sub_02002624
sub_02002624: ; 0x02002624
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002624

	arm_func_start sub_02002628
sub_02002628: ; 0x02002628
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02002658 ; =_022B966C
	mov r5, r0
	ldr r0, [r2, #4]
	mov r4, r1
	str r0, [r5]
	bl sub_02079B0C
	str r0, [r5, #4]
	ldr r0, [r5]
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002658: .word _022B966C
	arm_func_end sub_02002628

	arm_func_start sub_0200265C
sub_0200265C: ; 0x0200265C
	ldr ip, _0200266C ; =sub_02079A64
	mov r1, r0
	ldmia r1, {r0, r1}
	bx ip
	.align 2, 0
_0200266C: .word sub_02079A64
	arm_func_end sub_0200265C

	arm_func_start sub_02002670
sub_02002670: ; 0x02002670
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020026AC ; =_022B966C
	ldr r5, [r0, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _020026B0 ; =_0229AFCC
	bl sub_0207A048
	ldr r0, _020026B4 ; =_020AEF30
	str r5, [r0]
	str r4, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026AC: .word _022B966C
_020026B0: .word _0229AFCC
_020026B4: .word _020AEF30
	arm_func_end sub_02002670

	arm_func_start sub_020026B8
sub_020026B8: ; 0x020026B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020026DC ; =_020AEF30
	ldr r0, _020026E0 ; =_0229AFCC
	ldmia r1, {r4, r5}
	bl sub_0207A0CC
	mov r0, r4
	mov r1, r5
	bl sub_02079A64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026DC: .word _020AEF30
_020026E0: .word _0229AFCC
	arm_func_end sub_020026B8

	arm_func_start sub_020026E4
sub_020026E4: ; 0x020026E4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002768 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _0200276C ; =_0229AFCC
	bl sub_0207A048
	ldr r0, _02002770 ; =_0229AFC0
	ldr r3, [r0]
	cmp r3, #8
	bge _02002750
	add r1, r3, #1
	ldr r2, _02002774 ; =_0229AFE4
	str r1, [r0]
	ldr r1, [r0]
	str r6, [r2, r3, lsl #2]
	str r1, [r0, #4]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	cmp r2, r1
	ldrgt r1, [r0, #4]
	strgt r1, [r0, #8]
_02002750:
	ldr r0, _0200276C ; =_0229AFCC
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002768: .word _022B966C
_0200276C: .word _0229AFCC
_02002770: .word _0229AFC0
_02002774: .word _0229AFE4
	arm_func_end sub_020026E4

	arm_func_start sub_02002778
sub_02002778: ; 0x02002778
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r0
	mov ip, r1
	add r0, r4, #0x1c
	mov r5, ip
	str r0, [r4]
	mov r6, r2
	ldmia r5!, {r0, r1, r2, r3}
	add lr, r4, #4
	stmia lr!, {r0, r1, r2, r3}
	ldr r0, [r5]
	mov r2, r6
	str r0, [lr]
	str r6, [r4, #0x18]
	ldr r1, [ip, #8]
	str r1, [sp]
	ldr r0, [ip, #0xc]
	bic r3, r1, #7
	str r0, [sp, #4]
	ldmia ip, {r1, lr}
	ldr r0, [r4]
	add r3, lr, r3
	bl StartThread
	mov r0, r4
	bl sub_020026E4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02002778

	arm_func_start sub_020027E8
sub_020027E8: ; 0x020027E8
	ldr ip, _020027F4 ; =sub_02079940
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020027F4: .word sub_02079940
	arm_func_end sub_020027E8

	arm_func_start sub_020027F8
sub_020027F8: ; 0x020027F8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6]
	mov r5, r1
	bl sub_02079B0C
	mov r4, r0
	ldr r0, [r6]
	mov r1, r5
	bl sub_02079A64
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020027F8

	arm_func_start sub_02002824
sub_02002824: ; 0x02002824
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002854 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, r6
	bl sub_02079A64
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002854: .word _022B966C
	arm_func_end sub_02002824

	arm_func_start sub_02002858
sub_02002858: ; 0x02002858
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02002858

	arm_func_start sub_02002860
sub_02002860: ; 0x02002860
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	ldrne r0, [r0, #0x14]
	moveq r0, #0
	bx lr
	arm_func_end sub_02002860

	arm_func_start sub_02002878
sub_02002878: ; 0x02002878
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02002580
	cmp r0, #0
	beq _020028A4
	ldr r0, [r0, #0x14]
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_020028A4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002878

	arm_func_start sub_020028AC
sub_020028AC: ; 0x020028AC
	bx lr
	arm_func_end sub_020028AC

	arm_func_start sub_020028B0
sub_020028B0: ; 0x020028B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0207A030
	mov r0, r4
	bl sub_0207A048
	bl sub_02002670
	ldr r0, _020028F4 ; =_0229B0E0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020028F4: .word _0229B0E0
	arm_func_end sub_020028B0

	arm_func_start sub_020028F8
sub_020028F8: ; 0x020028F8
	ldr ip, _02002900 ; =sub_0207A0CC
	bx ip
	.align 2, 0
_02002900: .word sub_0207A0CC
	arm_func_end sub_020028F8

	arm_func_start sub_02002904
sub_02002904: ; 0x02002904
	ldr ip, _0200290C ; =sub_0207A048
	bx ip
	.align 2, 0
_0200290C: .word sub_0207A048
	arm_func_end sub_02002904

	arm_func_start sub_02002910
sub_02002910: ; 0x02002910
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0207A164
	tst r0, #0xff
	beq _02002944
	ldr r0, [r4, #0xc]
	cmp r0, #1
	movle r0, #1
	ldmleia sp!, {r4, pc}
	mov r0, r4
	bl sub_0207A0CC
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
	bl sub_02079DB8
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
	ldr ip, _020029B4 ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #8
	bx ip
	.align 2, 0
_020029B4: .word sub_02079DE0
	arm_func_end sub_020029A0

	arm_func_start sub_020029B8
sub_020029B8: ; 0x020029B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02002A40 ; =_022B966C
	mov r4, r0
	ldr sb, [r1, #4]
	mov r7, #0
	mov r0, sb
	bl sub_02079B0C
	mov r8, r0
	mov r0, sb
	mov r1, #7
	bl sub_02079A64
	mov r5, r7
	b _020029F0
_020029EC:
	add r7, r7, #1
_020029F0:
	mov r1, r5
	mov r2, r5
	add r0, r4, #8
	bl sub_02079DE0
	cmp r0, #0
	bne _020029EC
	add r6, sp, #0
	mov r5, #0
_02002A10:
	mov r1, r6
	mov r2, r5
	add r0, r4, #8
	bl sub_02079E74
	cmp r0, #0
	subne r7, r7, #1
	bne _02002A10
	mov r0, sb
	mov r1, r8
	bl sub_02079A64
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02002A40: .word _022B966C
	arm_func_end sub_020029B8

	arm_func_start sub_02002A44
sub_02002A44: ; 0x02002A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002A94 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r6, #8
	mov r2, #1
	bl sub_02079E74
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002A94: .word _022B966C
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
	bl sub_02079DB8
	mov r5, #0
	mov r4, r5
	b _02002AE0
_02002ACC:
	mov r1, r4
	mov r2, r4
	add r0, r6, #0x84
	bl sub_02079DE0
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
	ldr ip, _02002B34 ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B34: .word sub_02079DE0
	arm_func_end sub_02002B20

	arm_func_start sub_02002B38
sub_02002B38: ; 0x02002B38
	ldr ip, _02002B4C ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B4C: .word sub_02079DE0
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
	bl sub_02079DE0
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002B50

	arm_func_start sub_02002B7C
sub_02002B7C: ; 0x02002B7C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002BCC ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r6, #0x84
	mov r2, #1
	bl sub_02079E74
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002BCC: .word _022B966C
	arm_func_end sub_02002B7C

	arm_func_start sub_02002BD0
sub_02002BD0: ; 0x02002BD0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002C28 ; =_022B966C
	mov r5, r0
	ldr r6, [r1, #4]
	mov r0, r6
	bl sub_02079B0C
	mov r4, r0
	mov r0, r6
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r5, #0x84
	mov r2, #0
	bl sub_02079E74
	and r5, r0, #0xff
	mov r0, r6
	mov r1, r4
	bl sub_02079A64
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002C28: .word _022B966C
	arm_func_end sub_02002BD0

	arm_func_start sub_02002C2C
sub_02002C2C: ; 0x02002C2C
	ldr ip, _02002C38 ; =sub_0207A030
	ldr r0, _02002C3C ; =_0229B0F8
	bx ip
	.align 2, 0
_02002C38: .word sub_0207A030
_02002C3C: .word _0229B0F8
	arm_func_end sub_02002C2C

	arm_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002CA4 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _02002CA8 ; =_0229B0F8
	bl sub_0207A048
	mov r0, r6
	bl sub_020028B0
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #0
	str r0, [r6, #0x20]
	str r0, [r6, #0x1c]
	ldr r0, _02002CA8 ; =_0229B0F8
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002CA4: .word _022B966C
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
	ldr r1, _02002D10 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002CF4
	cmp r1, r4
	movhs r4, #0
	bhs _02002CF8
	mov r0, r5
	bl sub_02079A64
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
_02002D10: .word _022B966C
	arm_func_end sub_02002CB4

	arm_func_start sub_02002D14
sub_02002D14: ; 0x02002D14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02002D7C ; =_022B966C
	mov r7, r0
	ldr r5, [r2, #4]
	mov r6, r1
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r7, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002D58
	cmp r1, r4
	movhs r4, #0
	bhs _02002D5C
	mov r0, r5
	bl sub_02079A64
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
_02002D7C: .word _022B966C
	arm_func_end sub_02002D14

	arm_func_start sub_02002D80
sub_02002D80: ; 0x02002D80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl sub_02002580
	mov r4, r0
	ldr r0, [r4]
	bl sub_02079B0C
	ldr r1, [r7, #0x20]
	mov r5, r0
	cmp r1, #0
	beq _02002DC4
	cmp r1, r5
	movhs r5, #0
	bhs _02002DC8
	ldr r0, [r4]
	bl sub_02079A64
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
	ldr r1, _02002E94 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002E50
	cmp r1, r4
	movhs r4, #0
	bhs _02002E54
	mov r0, r5
	bl sub_02079A64
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
	bl sub_02079A64
_02002E8C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002E94: .word _022B966C
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
	bl sub_02079DB8
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
	bl sub_02079DE0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002F7C

	arm_func_start sub_02002F98
sub_02002F98: ; 0x02002F98
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	bl sub_02079E74
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
	bl sub_02083434
	b _020030B0
_020030A8:
	ldrh r0, [r5, #0x28]
	bl sub_0208346C
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
	bl sub_02083450
	b _02003168
_02003160:
	ldrh r0, [r6, #0x28]
	bl sub_0208347C
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

	arm_func_start ZInit8
ZInit8: ; 0x02003228
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	arm_func_end ZInit8

	arm_func_start PointsToZero
PointsToZero: ; 0x02003238
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end PointsToZero

	arm_func_start MemZero
MemZero: ; 0x02003250
	mov r2, #0
	b _02003260
_02003258:
	sub r1, r1, #1
	strb r2, [r0], #1
_02003260:
	cmp r1, #0
	bgt _02003258
	bx lr
	arm_func_end MemZero

	arm_func_start MemZero16
MemZero16: ; 0x0200326C
	mov r2, #0
	b _0200327C
_02003274:
	sub r1, r1, #2
	strh r2, [r0], #2
_0200327C:
	cmp r1, #0
	bgt _02003274
	bx lr
	arm_func_end MemZero16

	arm_func_start MemZero32
MemZero32: ; 0x02003288
	mov r2, #0
	b _02003298
_02003290:
	sub r1, r1, #4
	str r2, [r0], #4
_02003298:
	cmp r1, #0
	bgt _02003290
	bx lr
	arm_func_end MemZero32

	arm_func_start MemsetSimple
MemsetSimple: ; 0x020032A4
	b _020032B0
_020032A8:
	sub r2, r2, #1
	strb r1, [r0], #1
	arm_func_end MemsetSimple
_020032B0:
	cmp r2, #0
	bgt _020032A8
	bx lr

	arm_func_start Memset32
Memset32: ; 0x020032BC
	b _020032C8
_020032C0:
	sub r2, r2, #4
	str r1, [r0], #4
_020032C8:
	cmp r2, #0
	bgt _020032C0
	bx lr
	arm_func_end Memset32

	arm_func_start MemcpySimple
MemcpySimple: ; 0x020032D4
	b _020032E4
_020032D8:
	ldrb r3, [r1], #1
	sub r2, r2, #1
	strb r3, [r0], #1
	arm_func_end MemcpySimple
_020032E4:
	cmp r2, #0
	bgt _020032D8
	bx lr

; https://decomp.me/scratch/qcRwD
	arm_func_start Memcpy16
Memcpy16: ; 0x020032F0
	b _02003300
_020032F4:
	ldrh r3, [r1], #2
	sub r2, r2, #2
	strh r3, [r0], #2
	arm_func_end Memcpy16
_02003300:
	cmp r2, #0
	bgt _020032F4
	bx lr

; https://decomp.me/scratch/edLa8
	arm_func_start Memcpy32
Memcpy32: ; 0x0200330C
	b _0200331C
_02003310:
	ldr r3, [r1], #4
	sub r2, r2, #4
	str r3, [r0], #4
	arm_func_end Memcpy32
_0200331C:
	cmp r2, #0
	bgt _02003310
	bx lr

	arm_func_start TaskProcBoot
TaskProcBoot: ; 0x02003328
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r0, _020035CC ; =_020AF000
	bl sub_02002950
	ldr r0, _020035D0 ; =_020AF028
	bl sub_02002950
	ldr r0, _020035D4 ; =_020AF050
	bl sub_02002950
	ldr r0, _020035D8 ; =_020AEFDC
	bl sub_02002C40
	bl sub_02006D4C
	bl sub_02017D20
	ldr r2, _020035DC ; =_0229B248
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r0, _020035E4 ; =_020AF078
	str r2, [r1, #0x3c]
	ldr r1, _020035E8 ; =_020AEFB4
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035E4 ; =_020AF078
	bl sub_020027E8
	bl sub_0207B370
	ldr r0, _020035EC ; =_0229B220
	bl sub_0207B4A4
	mov r1, #0
	str r1, [sp]
	ldr r0, _020035EC ; =_0229B220
	mov r2, #0x64
	ldr r3, _020035F0 ; =sub_02003754
	bl sub_0207B4B8
	mov r0, #1
	ldr r1, _020035F4 ; =sub_02003704
	bl sub_02078A98
	mov r0, #1
	bl sub_02078C68
	bl EnableAllInterrupts
	mov r0, #1
	bl GX_VBlankIntr
	ldr r0, _020035F8 ; =_020AF154
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r2, _020035FC ; =_0229F248
	str r0, [r1, #0x24]
	str r2, [r1, #0x50]
	ldr r1, _02003600 ; =_020AEFC8
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035F8 ; =_020AF154
	bl sub_020027E8
	bl sub_02002580
	ldr r2, _020035E0 ; =_020AEF7C
	mov r1, #0xf
	str r0, [r2, #0x34]
	bl sub_020027F8
	ldr r0, _020035E0 ; =_020AEF7C
	mov r1, #2
	ldr r0, [r0, #0x34]
	bl sub_02002858
	mov sl, #0
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r0, _02003604 ; =_020924D8
	strb sl, [r1, #5]
	bl Debug_Print0
	mov r8, #1
	ldr r4, _020035E0 ; =_020AEF7C
	mov r6, sl
	mov sb, sl
	mov r7, r8
	mov r5, sl
	mov fp, r8
_0200343C:
	add r0, sp, #4
	mov r1, #0xb
	bl sub_02002628
	ldrb r0, [r4, #7]
	cmp r0, #0
	strneb sb, [r4, #7]
	bne _02003460
	ldr r0, _020035D4 ; =_020AF050
	bl sub_02002A44
_02003460:
	cmp sl, #0
	beq _020034A8
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrneb r0, [r4]
	cmpne r0, #0
	beq _020034C8
	ldr r0, _020035CC ; =_020AF000
	strb r8, [r4, #3]
	bl sub_020029A0
	ldr r0, _020035D0 ; =_020AF028
	bl sub_02002A44
	bl sub_02002670
	ldr r0, [r4, #0x10]
	cmp r0, #0
	moveq sl, #0
	bl sub_020026B8
	b _020034C8
_020034A8:
	bl sub_02002670
	ldr sl, [r4, #0x10]
	bl sub_020026B8
	cmp sl, #0
	beq _020034C8
	ldr r0, _020035D0 ; =_020AF028
	strb r7, [r4, #3]
	bl sub_02002A44
_020034C8:
	add r0, sp, #4
	bl sub_0200265C
	bl sub_02002670
	ldr r0, [r4, #0x10]
	cmp r0, #0
	movne sl, r0
	cmp sl, #0
	beq _02003518
	ldrb r0, [r4, #3]
	cmp r0, #0
	strneb r6, [r4]
	str sl, [r4, #0x18]
	bl sub_020026B8
	ldr r0, [r4, #0x30]
	add r0, r0, #1
	str r0, [r4, #0x30]
	bl sub_02006098
	blx sl
	strb r0, [r4, #6]
	b _02003530
_02003518:
	bl sub_020026B8
	bl sub_02003A40
	bl sub_02002670
	str r5, [r4, #0x18]
	strb fp, [r4, #6]
	bl sub_020026B8
_02003530:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _02003544
	mov r0, #0
	bl sub_020025F8
_02003544:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0200343C
	bl sub_02003B5C
	cmp r0, #0
	beq _020035A8
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02003584
	mov r0, #0
	mov r1, #0
	strb r0, [r4, #0xb]
	mov r0, #0xc
	mov r2, r1
	bl sub_020820E8
	b _0200343C
_02003584:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0200343C
	mov r0, #0
	bl sub_02082420
	cmp r0, #0
	movne r0, #1
	strne r0, [r4, #0x14]
	b _0200343C
_020035A8:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0200343C
	mov r0, #1
	bl sub_02082420
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x14]
	b _0200343C
	.align 2, 0
_020035CC: .word _020AF000
_020035D0: .word _020AF028
_020035D4: .word _020AF050
_020035D8: .word _020AEFDC
_020035DC: .word _0229B248
_020035E0: .word _020AEF7C
_020035E4: .word _020AF078
_020035E8: .word _020AEFB4
_020035EC: .word _0229B220
_020035F0: .word sub_02003754
_020035F4: .word sub_02003704
_020035F8: .word _020AF154
_020035FC: .word _0229F248
_02003600: .word _020AEFC8
_02003604: .word _020924D8
	arm_func_end TaskProcBoot

	arm_func_start EnableAllInterrupts
EnableAllInterrupts: ; 0x02003608
	ldr r2, _0200361C ; =0x04000208
	mov r1, #1
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_0200361C: .word 0x04000208
	arm_func_end EnableAllInterrupts

	arm_func_start sub_02003620
sub_02003620: ; 0x02003620
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r7, #0
	ldr fp, _020036FC ; =_020AF050
	ldr r4, _02003700 ; =_020AEF7C
	add r6, sp, #0
	add r5, sp, #4
	mov r8, #1
	mov sb, r7
	mov sl, r7
_02003648:
	mov r0, sl
	bl sub_02079888
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _02003674
	mov r0, sb
	bl HaltProcessDisp
	b _02003688
_02003674:
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _02003688
	mov r0, r8
	bl HaltProcessDisp
_02003688:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _020036AC
	bl sub_02003B5C
	cmp r0, #0
	beq _020036AC
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _020036E8
_020036AC:
	bl sub_02006DEC
	bl Rand16Bit
	mov r0, r7
	mov r1, r6
	bl GetHeldButtons
	mov r0, r5
	bl GetReleasedStylus
	ldrh r0, [sp]
	cmp r0, #0
	bne _020036E0
	ldrh r0, [sp, #4]
	tst r0, #1
	beq _020036EC
_020036E0:
	bl Rand16Bit
	b _020036EC
_020036E8:
	bl KeyWaitInit
_020036EC:
	mov r0, fp
	bl sub_020029B8
	bl sub_0201849C
	b _02003648
	.align 2, 0
_020036FC: .word _020AF050
_02003700: .word _020AEF7C
	arm_func_end sub_02003620

	arm_func_start sub_02003704
sub_02003704: ; 0x02003704
	stmdb sp!, {r3, lr}
	ldr r0, _0200374C ; =OS_IRQTable
	ldr r1, _02003750 ; =_020AEF7C
	add r0, r0, #0x3000
	ldr r2, [r0, #0xff8]
	orr r2, r2, #1
	str r2, [r0, #0xff8]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _02003744
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	bl sub_02079940
_02003744:
	bl sub_020082E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200374C: .word OS_IRQTable
_02003750: .word _020AEF7C
	arm_func_end sub_02003704

	arm_func_start sub_02003754
sub_02003754: ; 0x02003754
	ldr r1, _02003774 ; =_020AEF7C
	ldr r0, _02003778 ; =_020AF078
	ldr r2, [r1, #0x1c]
	ldr ip, _0200377C ; =sub_02079940
	add r2, r2, #1
	ldr r0, [r0]
	str r2, [r1, #0x1c]
	bx ip
	.align 2, 0
_02003774: .word _020AEF7C
_02003778: .word _020AF078
_0200377C: .word sub_02079940
	arm_func_end sub_02003754

	arm_func_start sub_02003780
sub_02003780: ; 0x02003780
	stmdb sp!, {r3, lr}
	bl sub_02005EAC
	ldr r0, _020037A0 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0]
	bl MainLoop
	bl WaitForever
	ldmia sp!, {r3, pc}
	.align 2, 0
_020037A0: .word _020AEF7C
	arm_func_end sub_02003780

	arm_func_start sub_020037A4
sub_020037A4: ; 0x020037A4
	ldr r0, _020037B0 ; =_020AEF7C
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_020037B0: .word _020AEF7C
	arm_func_end sub_020037A4

	arm_func_start GetTime
GetTime: ; 0x020037B4
	stmdb sp!, {r3, r4, r5, lr}
	bl DisableAllInterrupts
	ldr r0, _02003818 ; =_020AEF7C
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _020037D8
	bl EnableAllInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020037D8:
	ldr r1, _0200381C ; =0x04000006
	ldr r4, [r0, #0x1c]
	ldrh r5, [r1]
	bl EnableAllInterrupts
	mov r0, r4
	bl _fflt
	mov r4, r0
	mov r0, r5
	bl _fflt
	mov r1, r0
	ldr r0, _02003820 ; =0x3B792FB2
	bl _fmul
	mov r1, r0
	mov r0, r4
	bl _fadd
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02003818: .word _020AEF7C
_0200381C: .word 0x04000006
_02003820: .word 0x3B792FB2
	arm_func_end GetTime

	arm_func_start DisableAllInterrupts
DisableAllInterrupts: ; 0x02003824
	ldr r2, _02003838 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_02003838: .word 0x04000208
	arm_func_end DisableAllInterrupts

	arm_func_start sub_0200383C
sub_0200383C: ; 0x0200383C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _020038CC ; =_020AEF7C
	mov r1, #1
	strb r1, [r0, #2]
	ldr r4, [r0, #0x10]
	str r5, [r0, #0x10]
	bl sub_020026B8
	cmp r5, #0
	bne _02003898
	cmp r4, #0
	beq _020038BC
	ldr r1, _020038CC ; =_020AEF7C
	mov r2, #0
	ldr r0, _020038D0 ; =_020AF028
	strb r2, [r1, #3]
	bl sub_020029A0
	b _020038BC
_02003898:
	cmp r4, #0
	bne _020038BC
	ldr r1, _020038CC ; =_020AEF7C
	mov r2, #1
	ldr r0, _020038D0 ; =_020AF028
	strb r2, [r1]
	bl sub_020029A0
	ldr r0, _020038D4 ; =_020AF000
	bl sub_02002A44
_020038BC:
	add r0, sp, #0
	bl sub_0200265C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020038CC: .word _020AEF7C
_020038D0: .word _020AF028
_020038D4: .word _020AF000
	arm_func_end sub_0200383C

	arm_func_start sub_020038D8
sub_020038D8: ; 0x020038D8
	ldr r0, _020038E4 ; =_020AEF7C
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_020038E4: .word _020AEF7C
	arm_func_end sub_020038D8

	arm_func_start sub_020038E8
sub_020038E8: ; 0x020038E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _02003988 ; =_020AEF7C
	ldr r4, [r0, #0x18]
	bl sub_020026B8
	cmp r4, #0
	beq _02003944
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0]
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _02003938
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	bl sub_02079940
_02003938:
	ldr r0, _0200398C ; =_020AF000
	bl sub_02002A44
	b _02003950
_02003944:
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #7]
_02003950:
	ldr r1, _02003988 ; =_020AEF7C
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	add r2, r2, #1
	str r2, [r1, #0x2c]
	bl sub_0200265C
	ldr r0, _02003988 ; =_020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _02003980
	mov r0, #0
	bl sub_020025F8
_02003980:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003988: .word _020AEF7C
_0200398C: .word _020AF000
	arm_func_end sub_020038E8

	arm_func_start sub_02003990
sub_02003990: ; 0x02003990
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020039DC ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _020039D4
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _020039DC ; =_020AEF7C
	mov r2, #0
	strb r2, [r1, #3]
	ldr r0, _020039E0 ; =_020AF000
	strb r2, [r1, #6]
	bl sub_020029A0
	add r0, sp, #0
	bl sub_0200265C
_020039D4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020039DC: .word _020AEF7C
_020039E0: .word _020AF000
	arm_func_end sub_02003990

	arm_func_start sub_020039E4
sub_020039E4: ; 0x020039E4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02003A34 ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02003A2C
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003A34 ; =_020AEF7C
	mov r2, #0
	ldr r0, _02003A38 ; =_020AF028
	strb r2, [r1, #6]
	bl sub_020029A0
	ldr r0, _02003A3C ; =_020AF000
	bl sub_02002A44
	add r0, sp, #0
	bl sub_0200265C
_02003A2C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003A34: .word _020AEF7C
_02003A38: .word _020AF028
_02003A3C: .word _020AF000
	arm_func_end sub_020039E4

	arm_func_start sub_02003A40
sub_02003A40: ; 0x02003A40
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003AAC ; =_020AEF7C
	mov r2, #1
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	mov r0, #0
	beq _02003A7C
	strb r0, [r1, #0xa]
	strb r2, [r1, #7]
	bl sub_02079888
	b _02003A90
_02003A7C:
	strb r2, [r1, #9]
	bl sub_02079888
	ldr r0, _02003AAC ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #9]
_02003A90:
	ldr r1, _02003AAC ; =_020AEF7C
	add r0, sp, #0
	ldrb r4, [r1]
	bl sub_0200265C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003AAC: .word _020AEF7C
	arm_func_end sub_02003A40

	arm_func_start sub_02003AB0
sub_02003AB0: ; 0x02003AB0
	stmdb sp!, {r3, lr}
	ldr r0, _02003AC8 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003ACC ; =_020AEF7C
	ldr r0, [r0, #0x28]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003AC8: .word _020AF050
_02003ACC: .word _020AEF7C
	arm_func_end sub_02003AB0

	arm_func_start sub_02003AD0
sub_02003AD0: ; 0x02003AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02003B50 ; =_020AEF7C
	ldrb r0, [r0, #5]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl sub_02002580
	bl sub_02002860
	cmp r0, #0
	beq _02003B10
	ldr r0, _02003B54 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003B50 ; =_020AEF7C
	ldr r0, [r0, #0x28]
_02003B10:
	ldr r0, _02003B50 ; =_020AEF7C
	mov r2, #1
	strb r2, [r0, #5]
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003B30
	strb r2, [r0, #0xf]
	bl sub_020081C8
_02003B30:
	bl DisableAllInterrupts
	ldr r0, _02003B58 ; =_0229B220
	bl sub_0207B584
	mov r0, #1
	mov r1, #0
	bl sub_02078A98
	bl EnableAllInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003B50: .word _020AEF7C
_02003B54: .word _020AF050
_02003B58: .word _0229B220
	arm_func_end sub_02003AD0

	arm_func_start sub_02003B5C
sub_02003B5C: ; 0x02003B5C
	ldr r0, _02003B8C ; =_020AEF7C
	mov r1, #1
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _02003B84
	ldr r0, _02003B90 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	moveq r1, #0
_02003B84:
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_02003B8C: .word _020AEF7C
_02003B90: .word 0x027FFFA8
	arm_func_end sub_02003B5C

	arm_func_start sub_02003B94
sub_02003B94: ; 0x02003B94
	ldr r0, _02003BA8 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BA8: .word _020AEF7C
	arm_func_end sub_02003B94

	arm_func_start sub_02003BAC
sub_02003BAC: ; 0x02003BAC
	ldr r0, _02003BC4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BC4: .word _020AEF7C
	arm_func_end sub_02003BAC

	arm_func_start sub_02003BC8
sub_02003BC8: ; 0x02003BC8
	stmdb sp!, {r3, lr}
	bl SoundResume
	ldr r0, _02003BE8 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003BE8: .word _020AEF7C
	arm_func_end sub_02003BC8

	arm_func_start sub_02003BEC
sub_02003BEC: ; 0x02003BEC
	ldr r0, _02003BF8 ; =_020AEF7C
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_02003BF8: .word _020AEF7C
	arm_func_end sub_02003BEC

	arm_func_start sub_02003BFC
sub_02003BFC: ; 0x02003BFC
	stmdb sp!, {r3, lr}
	ldr r0, _02003CB4 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003CAC
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003C5C
	bl sub_02003B5C
	cmp r0, #0
	bne _02003C54
	ldr r0, _02003CB8 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003CB4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
_02003C54:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003C5C:
	bl sub_02003B5C
	cmp r0, #0
	beq _02003CAC
	ldr r0, _02003CC0 ; =_020924F8
	bl Debug_Print0
	bl sub_02017DB4
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1, #2]
	bl sub_02017FF0
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1]
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldr r1, _02003CB4 ; =_020AEF7C
	mov r0, #1
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
_02003CAC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003CB4: .word _020AEF7C
_02003CB8: .word _020924E8
_02003CBC: .word _0229B21C
_02003CC0: .word _020924F8
	arm_func_end sub_02003BFC

	arm_func_start SoundResume
SoundResume: ; 0x02003CC4
	stmdb sp!, {r3, lr}
	ldr r0, _02003D20 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003D18
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003D18
	ldr r0, _02003D24 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003D20 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003D18:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003D20: .word _020AEF7C
_02003D24: .word _020924E8
_02003D28: .word _0229B21C
	arm_func_end SoundResume
