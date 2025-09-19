	.include "asm/macros.inc"
	.include "main_02000DE0.inc"

	.text

	arm_func_start InitMemAllocTable
InitMemAllocTable: ; 0x02000DE0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _02000E54 ; =DEFAULT_MEMORY_ARENA_MEMORY
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
_02000E54: .word DEFAULT_MEMORY_ARENA_MEMORY
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
