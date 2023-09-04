	.include "asm/macros.inc"
	.include "main.inc"

	.text

	arm_func_start NitroMain
NitroMain: ; 0x02000C6C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	bl sub_0207A36C
	mov r0, #0x12
	bl sub_020833F8
	ldr r0, _02000DD0 ; =sub_020024D4
	bl sub_020845D8
	bl sub_0207AD54
	bl sub_02076070
	mvn r0, #0
	bl sub_0207F3BC
	bl sub_0207A220
	bl sub_0207A30C
	mov r0, #0
	bl sub_0207A524
	mov r4, r0
	mov r0, #0
	bl sub_0207A538
	mov r2, r4
	mov r1, r0
	ldr r0, _02000DD4 ; =0x02092448
	bl DebugPrint0__0200C1FC
	mov r0, #0
	bl sub_0207A524
	mov r4, r0
	mov r0, #0
	bl sub_0207A538
	cmp r0, r4
	bhs _02000D44
	mov r0, #0
	bl sub_0207A524
	mov r4, r0
	mov r0, #0
	bl sub_0207A538
	mov r1, r0
	mov r2, r4
	mov r0, #0
	mov r3, #1
	bl sub_0207A98C
	mov r1, r0
	mov r0, #0
	bl sub_0207A6EC
	mov r0, #0
	bl sub_0207A524
	mov r4, r0
	mov r0, #0
	bl sub_0207A538
	mov r2, r4
	mov r1, r0
	mov r0, #0
	bl sub_0207AA34
	mov r1, r0
	mov r0, #0
	bl sub_0207A95C
_02000D44:
	ldr r2, _02000DD8 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl ClearIrqFlag
	bl sub_02008DAC
	add r0, sp, #0
	bl sub_0207B9EC
	ldrb r1, [sp, #2]
	ldrb r0, [sp, #3]
	ldrb r3, [sp]
	ldrb r2, [sp, #1]
	smulbb r0, r1, r0
	mla r0, r3, r2, r0
	ldrb r2, [sp, #4]
	ldrb r1, [sp, #5]
	mla r0, r2, r1, r0
	bl sub_02002228
	bl sub_020024E4
	bl sub_020028AC
	bl sub_0200294C
	bl sub_02002A98
	bl sub_02002C2C
	bl sub_02002F0C
	bl InitMemAllocTableVeneer
	bl sub_0200C0D4
	bl sub_02002FB8
	ldr r0, _02000DDC ; =0x02092460
	bl sub_020082F4
	bl sub_0204A5D0
	bl sub_02003ECC
	bl TaskProcBoot
	bl sub_02079C14
_02000DC8:
	bl WaitForInterrupt
	b _02000DC8
	.align 2, 0
_02000DD0: .word sub_020024D4
_02000DD4: .word 0x02092448
_02000DD8: .word 0x04000208
_02000DDC: .word 0x02092460
	arm_func_end NitroMain

	arm_func_start InitMemAllocTable
InitMemAllocTable: ; 0x02000DE0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _02000E54 ; =0x020B4BC0
	ldr r3, _02000E58 ; =0x001E6400
	ldr r0, _02000E5C ; =0x02090B70
	mov r2, r1
	str r1, [sp]
	str r3, [sp, #4]
	bl DebugPrint0__0200C1FC
	ldr ip, _02000E60 ; =0x020B3380
	mov lr, #0
	ldr r0, _02000E64 ; =0x020B3384
	ldr r2, _02000E68 ; =0x020B33C0
	add r1, sp, #0
	mov r3, #0x100
	str lr, [ip]
	bl InitMemArena
	ldr r0, _02000E6C ; =0x020AEF08
	bl sub_02002C40
	ldr r0, _02000E6C ; =0x020AEF08
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02000E6C ; =0x020AEF08
	bl sub_02002E98
	mov r0, #0
	mov r1, r0
	bl SetMemAllocatorParams
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02000E54: .word 0x020B4BC0
_02000E58: .word 0x001E6400
_02000E5C: .word 0x02090B70
_02000E60: .word 0x020B3380
_02000E64: .word 0x020B3384
_02000E68: .word 0x020B33C0
_02000E6C: .word 0x020AEF08
	arm_func_end InitMemAllocTable

	arm_func_start SetMemAllocatorParams
SetMemAllocatorParams: ; 0x02000E70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02000EB0 ; =0x020AEF08
	mov r4, r1
	bl sub_02002CB4
	cmp r5, #0
	ldreq r5, _02000EB4 ; =GetAllocArenaDefault
	ldr r0, _02000EB8 ; =0x020AEF00
	cmp r4, #0
	str r5, [r0]
	ldreq r4, _02000EBC ; =GetFreeArenaDefault
	ldr r1, _02000EB8 ; =0x020AEF00
	ldr r0, _02000EB0 ; =0x020AEF08
	str r4, [r1, #4]
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02000EB0: .word 0x020AEF08
_02000EB4: .word GetAllocArenaDefault
_02000EB8: .word 0x020AEF00
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
	ldr ip, _02000F3C ; =0x020B3380
	ldr r6, [r1, #4]
	ldr r5, [ip]
	ldr lr, _02000F40 ; =0x020B33A0
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
_02000F3C: .word 0x020B3380
_02000F40: .word 0x020B33A0
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
	ldr r1, _02001168 ; =0x02090B40
	add r0, sp, #0
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x18]
	str r2, [sp, #4]
	str r1, [sp]
	ldr r2, [sl, #0xc]
	ldr r3, [sl, #0x10]
	ldr r1, _0200116C ; =0x02090BA0
	bl FatalError
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
_02001168: .word 0x02090B40
_0200116C: .word 0x02090BA0
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
	ldr r0, _0200126C ; =0x020AEF08
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl sub_02002CB4
	ldr r1, _02001270 ; =0x020AEF00
	mov r0, r5
	ldr r2, [r1]
	mov r1, r6
	blx r2
	movs r5, r0
	ldreq r5, _02001274 ; =0x020B3384
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
	ldr r0, _0200126C ; =0x020AEF08
	str r5, [r4, #4]
	bl sub_02002E98
	mov r0, r4
	b _02001264
_02001238:
	ldr r0, _0200126C ; =0x020AEF08
	bl sub_02002E98
	ldr r1, _02001278 ; =0x02090B40
	add r0, sp, #4
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _0200127C ; =0x02090BC8
	mov r2, r4
	str ip, [sp, #4]
	str r3, [sp, #8]
	bl FatalError
_02001264:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0200126C: .word 0x020AEF08
_02001270: .word 0x020AEF00
_02001274: .word 0x020B3384
_02001278: .word 0x02090B40
_0200127C: .word 0x02090BC8
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
	ldr r0, _02001388 ; =0x020B3380
	mov ip, #0
	mov r3, ip
	ldr lr, [r0]
	ldr r2, _0200138C ; =0x020B33A0
	b _02001368
_02001320:
	ldr r0, [r2, r3, lsl #2]
	cmp r0, r1
	bne _02001364
	ldr r0, _02001388 ; =0x020B3380
	ldr r2, [r0]
	sub ip, r2, #1
	str ip, [r0]
	ldr r2, _0200138C ; =0x020B33A0
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
_02001388: .word 0x020B3380
_0200138C: .word 0x020B33A0
	arm_func_end sub_020012D8

	arm_func_start MemLocateSet
MemLocateSet: ; 0x02001390
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov r4, r0
	ldr r0, _0200161C ; =0x020AEF08
	mov r5, r1
	orr r7, r2, #0x100
	bl sub_02002CB4
	ldr r1, _02001620 ; =0x020AEF00
	mov r0, r4
	ldr r2, [r1]
	mov r1, r7
	blx r2
	movs r4, r0
	mov r0, r7, asr #8
	orr r8, r0, #1
	and r0, r8, #2
	ldreq r4, _02001624 ; =0x020B3384
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
	ldr r1, _0200162C ; =0x02090B40
	add r0, sp, #0x18
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x10]
	str r2, [sp, #0x1c]
	str r1, [sp, #0x18]
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	ldr r1, _02001630 ; =0x02090BA0
	bl FatalError
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
	ldr r0, _0200161C ; =0x020AEF08
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
	ldr r0, _0200161C ; =0x020AEF08
	bl sub_02002E98
	b _02001610
_020015DC:
	ldr r0, _0200161C ; =0x020AEF08
	bl sub_02002E98
	ldr r1, _0200162C ; =0x02090B40
	add r0, sp, #0x10
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, _02001634 ; =0x02090BFC
	mov r2, r4
	mov r3, r5
	stmia sp, {r8, sb}
	bl FatalError
_02001610:
	mov r0, r6
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200161C: .word 0x020AEF08
_02001620: .word 0x020AEF00
_02001624: .word 0x020B3384
_02001628: .word 0x001E6401
_0200162C: .word 0x02090B40
_02001630: .word 0x02090BA0
_02001634: .word 0x02090BFC
	arm_func_end MemLocateSet

	arm_func_start MemLocateUnset
MemLocateUnset: ; 0x02001638
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r0, _020017A8 ; =0x020AEF08
	mov r6, r1
	bl sub_02002CB4
	ldr r1, _020017AC ; =0x020AEF00
	mov r0, r7
	ldr r2, [r1, #4]
	mov r1, r6
	blx r2
	movs r7, r0
	ldreq r7, _020017B0 ; =0x020B3384
	cmp r6, #0
	bne _0200167C
	ldr r0, _020017A8 ; =0x020AEF08
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
	ldr r0, _020017A8 ; =0x020AEF08
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200178C:
	add r5, r5, #1
	add r4, r4, #0x18
_02001794:
	cmp r5, r1
	blt _0200168C
	ldr r0, _020017A8 ; =0x020AEF08
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020017A8: .word 0x020AEF08
_020017AC: .word 0x020AEF00
_020017B0: .word 0x020B3384
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
	ldr r0, _02001804 ; =0x020AEF08
	bl sub_02002CB4
	ldr r0, _02001804 ; =0x020AEF08
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02001804: .word 0x020AEF08
	arm_func_end sub_020017EC

	arm_func_start sub_02001808
sub_02001808: ; 0x02001808
	stmdb sp!, {r4, lr}
	ldr r0, _0200187C ; =0x020AEF08
	bl sub_02002CB4
	ldr r0, _02001880 ; =0x020AEF00
	mov r4, #0
	ldr r2, [r0]
	ldr r0, _02001884 ; =0x020B3384
	mov r1, r4
	blx r2
	cmp r0, #0
	ldreq r0, _02001884 ; =0x020B3384
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
	ldr r0, _0200187C ; =0x020AEF08
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200187C: .word 0x020AEF08
_02001880: .word 0x020AEF00
_02001884: .word 0x020B3384
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
	ldr r0, _02001978 ; =0x02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	bx lr
_0200191C:
	ldr r1, _0200197C ; =0x000003FF
	ldr r2, _02001978 ; =0x02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	bx lr
_02001938:
	mov r1, r0, lsl #0x16
	ldr r0, _02001978 ; =0x02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	rsb r0, r0, #0
	bx lr
_02001950:
	ldr r1, _0200197C ; =0x000003FF
	ldr r2, _02001978 ; =0x02090C48
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
_02001978: .word 0x02090C48
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
	ldr r2, _02001A2C ; =0x02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	bx lr
_020019D4:
	mov r1, r0, lsl #0x16
	ldr r0, _02001A2C ; =0x02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	rsb r0, r0, #0
	bx lr
_020019EC:
	ldr r1, _02001A28 ; =0x000003FF
	ldr r2, _02001A2C ; =0x02090C48
	and r0, r0, r1
	sub r0, r1, r0
	mov r0, r0, lsl #1
	ldrsh r0, [r2, r0]
	rsb r0, r0, #0
	bx lr
_02001A0C:
	mov r1, r0, lsl #0x16
	ldr r0, _02001A2C ; =0x02090C48
	mov r1, r1, lsr #0x15
	ldrsh r0, [r0, r1]
	bx lr
_02001A20:
	mov r0, #0
	bx lr
	.align 2, 0
_02001A28: .word 0x000003FF
_02001A2C: .word 0x02090C48
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
	ldr r2, _02002224 ; =0x02091448
	mov r1, r1, lsl #1
	ldrsh r2, [r2, r1]
	mov r1, #0
	mov r2, r2, lsl #4
	stmia r0, {r1, r2}
	bx lr
	.align 2, 0
_02002220: .word 0x000007FF
_02002224: .word 0x02091448
	arm_func_end ClampedLn

	arm_func_start sub_02002228
sub_02002228: ; 0x02002228
	bx lr
	arm_func_end sub_02002228

	arm_func_start GetRngSeed
GetRngSeed: ; 0x0200222C
	ldr r0, _02002238 ; =0x020AEF2C
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_02002238: .word 0x020AEF2C
	arm_func_end GetRngSeed

	arm_func_start SetRngSeed
SetRngSeed: ; 0x0200223C
	ldr r1, _02002248 ; =0x020AEF2C
	strh r0, [r1]
	bx lr
	.align 2, 0
_02002248: .word 0x020AEF2C
	arm_func_end SetRngSeed

	arm_func_start Rand16Bit
Rand16Bit: ; 0x0200224C
	ldr r1, _02002270 ; =0x020AEF2C
	mov r0, #0x6d
	ldrh r2, [r1]
	mul r0, r2, r0
	add r0, r0, #0xfd
	add r0, r0, #0x300
	strh r0, [r1]
	ldrh r0, [r1]
	bx lr
	.align 2, 0
_02002270: .word 0x020AEF2C
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
	bl sub_0207621C
	ldr r3, _02002498 ; =0x04001000
	ldr r0, _0200249C ; =0x02092464
	ldr r2, [r3]
	mov r1, r4
	bic r2, r2, #0x10000
	str r2, [r3]
	bl DebugPrint0__0200C1FC
	mov r0, r4
	bl sub_0207B930
	bl sub_02079C14
_02002490:
	bl WaitForInterrupt
	b _02002490
	.align 2, 0
_02002498: .word 0x04001000
_0200249C: .word 0x02092464
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
	ldr r0, _0200256C ; =0x0229AFCC
	bl sub_0207A030
	ldr r0, _0200256C ; =0x0229AFCC
	bl sub_0207A048
	mov r1, #0
	ldr r0, _02002570 ; =0x0229AFE4
	mov r2, r1
_02002504:
	add r1, r1, #1
	cmp r1, #8
	str r2, [r0], #4
	blt _02002504
	ldr r1, _02002574 ; =0x0229AFC0
	ldr r0, _0200256C ; =0x0229AFCC
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0207A0CC
	ldr r1, _02002578 ; =0x022B966C
	ldr r0, _0200257C ; =0x0229B004
	ldr r1, [r1, #4]
	mov r2, #0
	stmia r0, {r1, r2}
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	mov r1, #7
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	bl sub_020026E4
	ldr r0, _02002578 ; =0x022B966C
	mov r1, #7
	ldr r0, [r0, #4]
	bl sub_02079A64
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200256C: .word 0x0229AFCC
_02002570: .word 0x0229AFE4
_02002574: .word 0x0229AFC0
_02002578: .word 0x022B966C
_0200257C: .word 0x0229B004
	arm_func_end sub_020024E4

	arm_func_start sub_02002580
sub_02002580: ; 0x02002580
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020025E8 ; =0x022B966C
	ldr r0, _020025EC ; =0x0229AFCC
	ldr r4, [r1, #4]
	bl sub_0207A048
	ldr r0, _020025F0 ; =0x0229AFC0
	mov r1, #0
	ldr r3, [r0]
	ldr r2, _020025F4 ; =0x0229AFE4
	b _020025CC
_020025A8:
	ldr r5, [r2]
	ldr r0, [r5]
	cmp r0, r4
	bne _020025C4
	ldr r0, _020025EC ; =0x0229AFCC
	bl sub_0207A0CC
	b _020025E0
_020025C4:
	add r1, r1, #1
	add r2, r2, #4
_020025CC:
	cmp r1, r3
	blt _020025A8
	ldr r0, _020025EC ; =0x0229AFCC
	bl sub_0207A0CC
	mov r5, #0
_020025E0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020025E8: .word 0x022B966C
_020025EC: .word 0x0229AFCC
_020025F0: .word 0x0229AFC0
_020025F4: .word 0x0229AFE4
	arm_func_end sub_02002580

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
	ldr r2, _02002658 ; =0x022B966C
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
_02002658: .word 0x022B966C
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
	ldr r0, _020026AC ; =0x022B966C
	ldr r5, [r0, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _020026B0 ; =0x0229AFCC
	bl sub_0207A048
	ldr r0, _020026B4 ; =0x020AEF30
	str r5, [r0]
	str r4, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026AC: .word 0x022B966C
_020026B0: .word 0x0229AFCC
_020026B4: .word 0x020AEF30
	arm_func_end sub_02002670

	arm_func_start sub_020026B8
sub_020026B8: ; 0x020026B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020026DC ; =0x020AEF30
	ldr r0, _020026E0 ; =0x0229AFCC
	ldmia r1, {r4, r5}
	bl sub_0207A0CC
	mov r0, r4
	mov r1, r5
	bl sub_02079A64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026DC: .word 0x020AEF30
_020026E0: .word 0x0229AFCC
	arm_func_end sub_020026B8

	arm_func_start sub_020026E4
sub_020026E4: ; 0x020026E4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002768 ; =0x022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _0200276C ; =0x0229AFCC
	bl sub_0207A048
	ldr r0, _02002770 ; =0x0229AFC0
	ldr r3, [r0]
	cmp r3, #8
	bge _02002750
	add r1, r3, #1
	ldr r2, _02002774 ; =0x0229AFE4
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
	ldr r0, _0200276C ; =0x0229AFCC
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002768: .word 0x022B966C
_0200276C: .word 0x0229AFCC
_02002770: .word 0x0229AFC0
_02002774: .word 0x0229AFE4
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
	bl sub_02079560
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
	ldr r1, _02002854 ; =0x022B966C
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
_02002854: .word 0x022B966C
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
	ldr r0, _020028F4 ; =0x0229B0E0
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
_020028F4: .word 0x0229B0E0
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
	ldr r0, _0200299C ; =0x0229B0E8
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
_0200299C: .word 0x0229B0E8
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
	ldr r1, _02002A40 ; =0x022B966C
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
_02002A40: .word 0x022B966C
	arm_func_end sub_020029B8

	arm_func_start sub_02002A44
sub_02002A44: ; 0x02002A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002A94 ; =0x022B966C
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
_02002A94: .word 0x022B966C
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
	ldr r0, _02002B1C ; =0x0229B0F0
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
_02002B1C: .word 0x0229B0F0
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
	ldr r1, _02002BCC ; =0x022B966C
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
_02002BCC: .word 0x022B966C
	arm_func_end sub_02002B7C

	arm_func_start sub_02002BD0
sub_02002BD0: ; 0x02002BD0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002C28 ; =0x022B966C
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
_02002C28: .word 0x022B966C
	arm_func_end sub_02002BD0

	arm_func_start sub_02002C2C
sub_02002C2C: ; 0x02002C2C
	ldr ip, _02002C38 ; =sub_0207A030
	ldr r0, _02002C3C ; =0x0229B0F8
	bx ip
	.align 2, 0
_02002C38: .word sub_0207A030
_02002C3C: .word 0x0229B0F8
	arm_func_end sub_02002C2C

	arm_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002CA4 ; =0x022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _02002CA8 ; =0x0229B0F8
	bl sub_0207A048
	mov r0, r6
	bl sub_020028B0
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #0
	str r0, [r6, #0x20]
	str r0, [r6, #0x1c]
	ldr r0, _02002CA8 ; =0x0229B0F8
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002CA4: .word 0x022B966C
_02002CA8: .word 0x0229B0F8
	arm_func_end sub_02002C40

	arm_func_start sub_02002CAC
sub_02002CAC: ; 0x02002CAC
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02002CAC

	arm_func_start sub_02002CB4
sub_02002CB4: ; 0x02002CB4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002D10 ; =0x022B966C
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
_02002D10: .word 0x022B966C
	arm_func_end sub_02002CB4

	arm_func_start sub_02002D14
sub_02002D14: ; 0x02002D14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02002D7C ; =0x022B966C
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
_02002D7C: .word 0x022B966C
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
	ldr r1, _02002E94 ; =0x022B966C
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
_02002E94: .word 0x022B966C
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
	ldr r0, _02002F30 ; =0x020AEF58
	bl sub_02002C40
	ldr r0, _02002F30 ; =0x020AEF58
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02002F30 ; =0x020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02002F30: .word 0x020AEF58
	arm_func_end sub_02002F0C

	arm_func_start sub_02002F34
sub_02002F34: ; 0x02002F34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02002F78 ; =0x020AEF58
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
	ldr r0, _02002F78 ; =0x020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002F78: .word 0x020AEF58
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
	ldr r0, _02003024 ; =0x0229B110
	mov r6, #0
	strh r6, [r0]
	cmp r6, #6
	ldr r5, _02003028 ; =0x0229B114
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
	bl sub_0207902C
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
_02003024: .word 0x0229B110
_02003028: .word 0x0229B114
	arm_func_end sub_02002FB8

	arm_func_start sub_0200302C
sub_0200302C: ; 0x0200302C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	movs r8, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl sub_02002580
	mov r7, r0
	mov r6, #0
	ldr r5, _020030C4 ; =0x0229B114
	mov r4, #1
	ldr sl, _020030C8 ; =0x0229B110
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
_020030C4: .word 0x0229B114
_020030C8: .word 0x0229B110
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
	ldr r6, _020031B8 ; =0x0229B114
	mov fp, #1
	ldr r5, _020031BC ; =0x0229B110
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
_020031B8: .word 0x0229B114
_020031BC: .word 0x0229B110
	arm_func_end sub_020030FC

	arm_func_start sub_020031C0
sub_020031C0: ; 0x020031C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02002580
	mov r5, #0
	mov lr, r5
	cmp r5, #6
	ldr ip, _02003218 ; =0x0229B114
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
_02003218: .word 0x0229B114
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
	ldr r0, _020035CC ; =0x020AF000
	bl sub_02002950
	ldr r0, _020035D0 ; =0x020AF028
	bl sub_02002950
	ldr r0, _020035D4 ; =0x020AF050
	bl sub_02002950
	ldr r0, _020035D8 ; =0x020AEFDC
	bl sub_02002C40
	bl sub_02006D4C
	bl sub_02017D20
	ldr r2, _020035DC ; =0x0229B248
	ldr r1, _020035E0 ; =0x020AEF7C
	ldr r0, _020035E4 ; =0x020AF078
	str r2, [r1, #0x3c]
	ldr r1, _020035E8 ; =0x020AEFB4
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035E4 ; =0x020AF078
	bl sub_020027E8
	bl sub_0207B370
	ldr r0, _020035EC ; =0x0229B220
	bl sub_0207B4A4
	mov r1, #0
	str r1, [sp]
	ldr r0, _020035EC ; =0x0229B220
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
	bl sub_020761E8
	ldr r0, _020035F8 ; =0x020AF154
	ldr r1, _020035E0 ; =0x020AEF7C
	ldr r2, _020035FC ; =0x0229F248
	str r0, [r1, #0x24]
	str r2, [r1, #0x50]
	ldr r1, _02003600 ; =0x020AEFC8
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035F8 ; =0x020AF154
	bl sub_020027E8
	bl sub_02002580
	ldr r2, _020035E0 ; =0x020AEF7C
	mov r1, #0xf
	str r0, [r2, #0x34]
	bl sub_020027F8
	ldr r0, _020035E0 ; =0x020AEF7C
	mov r1, #2
	ldr r0, [r0, #0x34]
	bl sub_02002858
	mov sl, #0
	ldr r1, _020035E0 ; =0x020AEF7C
	ldr r0, _02003604 ; =0x020924D8
	strb sl, [r1, #5]
	bl DebugPrint0__0200C1FC
	mov r8, #1
	ldr r4, _020035E0 ; =0x020AEF7C
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
	ldr r0, _020035D4 ; =0x020AF050
	bl sub_02002A44
_02003460:
	cmp sl, #0
	beq _020034A8
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrneb r0, [r4]
	cmpne r0, #0
	beq _020034C8
	ldr r0, _020035CC ; =0x020AF000
	strb r8, [r4, #3]
	bl sub_020029A0
	ldr r0, _020035D0 ; =0x020AF028
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
	ldr r0, _020035D0 ; =0x020AF028
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
_020035CC: .word 0x020AF000
_020035D0: .word 0x020AF028
_020035D4: .word 0x020AF050
_020035D8: .word 0x020AEFDC
_020035DC: .word 0x0229B248
_020035E0: .word 0x020AEF7C
_020035E4: .word 0x020AF078
_020035E8: .word 0x020AEFB4
_020035EC: .word 0x0229B220
_020035F0: .word sub_02003754
_020035F4: .word sub_02003704
_020035F8: .word 0x020AF154
_020035FC: .word 0x0229F248
_02003600: .word 0x020AEFC8
_02003604: .word 0x020924D8
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
	ldr fp, _020036FC ; =0x020AF050
	ldr r4, _02003700 ; =0x020AEF7C
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
	bl KeyWaitInit__02006DA4
_020036EC:
	mov r0, fp
	bl sub_020029B8
	bl sub_0201849C
	b _02003648
	.align 2, 0
_020036FC: .word 0x020AF050
_02003700: .word 0x020AEF7C
	arm_func_end sub_02003620

	arm_func_start sub_02003704
sub_02003704: ; 0x02003704
	stmdb sp!, {r3, lr}
	ldr r0, _0200374C ; =0x027E0000
	ldr r1, _02003750 ; =0x020AEF7C
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
_0200374C: .word 0x027E0000
_02003750: .word 0x020AEF7C
	arm_func_end sub_02003704

	arm_func_start sub_02003754
sub_02003754: ; 0x02003754
	ldr r1, _02003774 ; =0x020AEF7C
	ldr r0, _02003778 ; =0x020AF078
	ldr r2, [r1, #0x1c]
	ldr ip, _0200377C ; =sub_02079940
	add r2, r2, #1
	ldr r0, [r0]
	str r2, [r1, #0x1c]
	bx ip
	.align 2, 0
_02003774: .word 0x020AEF7C
_02003778: .word 0x020AF078
_0200377C: .word sub_02079940
	arm_func_end sub_02003754

	arm_func_start sub_02003780
sub_02003780: ; 0x02003780
	stmdb sp!, {r3, lr}
	bl sub_02005EAC
	ldr r0, _020037A0 ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0]
	bl sub_02065D1C
	bl WaitForever
	ldmia sp!, {r3, pc}
	.align 2, 0
_020037A0: .word 0x020AEF7C
	arm_func_end sub_02003780

	arm_func_start sub_020037A4
sub_020037A4: ; 0x020037A4
	ldr r0, _020037B0 ; =0x020AEF7C
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_020037B0: .word 0x020AEF7C
	arm_func_end sub_020037A4

	arm_func_start GetTime
GetTime: ; 0x020037B4
	stmdb sp!, {r3, r4, r5, lr}
	bl DisableAllInterrupts
	ldr r0, _02003818 ; =0x020AEF7C
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
	bl IntToFloat
	mov r4, r0
	mov r0, r5
	bl IntToFloat
	mov r1, r0
	ldr r0, _02003820 ; =0x3B792FB2
	bl MultiplyFloat
	mov r1, r0
	mov r0, r4
	bl AddFloat
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02003818: .word 0x020AEF7C
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
	ldr r0, _020038CC ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0, #2]
	ldr r4, [r0, #0x10]
	str r5, [r0, #0x10]
	bl sub_020026B8
	cmp r5, #0
	bne _02003898
	cmp r4, #0
	beq _020038BC
	ldr r1, _020038CC ; =0x020AEF7C
	mov r2, #0
	ldr r0, _020038D0 ; =0x020AF028
	strb r2, [r1, #3]
	bl sub_020029A0
	b _020038BC
_02003898:
	cmp r4, #0
	bne _020038BC
	ldr r1, _020038CC ; =0x020AEF7C
	mov r2, #1
	ldr r0, _020038D0 ; =0x020AF028
	strb r2, [r1]
	bl sub_020029A0
	ldr r0, _020038D4 ; =0x020AF000
	bl sub_02002A44
_020038BC:
	add r0, sp, #0
	bl sub_0200265C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020038CC: .word 0x020AEF7C
_020038D0: .word 0x020AF028
_020038D4: .word 0x020AF000
	arm_func_end sub_0200383C

	arm_func_start sub_020038D8
sub_020038D8: ; 0x020038D8
	ldr r0, _020038E4 ; =0x020AEF7C
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_020038E4: .word 0x020AEF7C
	arm_func_end sub_020038D8

	arm_func_start sub_020038E8
sub_020038E8: ; 0x020038E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _02003988 ; =0x020AEF7C
	ldr r4, [r0, #0x18]
	bl sub_020026B8
	cmp r4, #0
	beq _02003944
	ldr r0, _02003988 ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0]
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _02003938
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	bl sub_02079940
_02003938:
	ldr r0, _0200398C ; =0x020AF000
	bl sub_02002A44
	b _02003950
_02003944:
	ldr r0, _02003988 ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #7]
_02003950:
	ldr r1, _02003988 ; =0x020AEF7C
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	add r2, r2, #1
	str r2, [r1, #0x2c]
	bl sub_0200265C
	ldr r0, _02003988 ; =0x020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _02003980
	mov r0, #0
	bl sub_020025F8
_02003980:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003988: .word 0x020AEF7C
_0200398C: .word 0x020AF000
	arm_func_end sub_020038E8

	arm_func_start sub_02003990
sub_02003990: ; 0x02003990
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020039DC ; =0x020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _020039D4
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _020039DC ; =0x020AEF7C
	mov r2, #0
	strb r2, [r1, #3]
	ldr r0, _020039E0 ; =0x020AF000
	strb r2, [r1, #6]
	bl sub_020029A0
	add r0, sp, #0
	bl sub_0200265C
_020039D4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020039DC: .word 0x020AEF7C
_020039E0: .word 0x020AF000
	arm_func_end sub_02003990

	arm_func_start sub_020039E4
sub_020039E4: ; 0x020039E4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02003A34 ; =0x020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02003A2C
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003A34 ; =0x020AEF7C
	mov r2, #0
	ldr r0, _02003A38 ; =0x020AF028
	strb r2, [r1, #6]
	bl sub_020029A0
	ldr r0, _02003A3C ; =0x020AF000
	bl sub_02002A44
	add r0, sp, #0
	bl sub_0200265C
_02003A2C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003A34: .word 0x020AEF7C
_02003A38: .word 0x020AF028
_02003A3C: .word 0x020AF000
	arm_func_end sub_020039E4

	arm_func_start sub_02003A40
sub_02003A40: ; 0x02003A40
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003AAC ; =0x020AEF7C
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
	ldr r0, _02003AAC ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #9]
_02003A90:
	ldr r1, _02003AAC ; =0x020AEF7C
	add r0, sp, #0
	ldrb r4, [r1]
	bl sub_0200265C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003AAC: .word 0x020AEF7C
	arm_func_end sub_02003A40

	arm_func_start sub_02003AB0
sub_02003AB0: ; 0x02003AB0
	stmdb sp!, {r3, lr}
	ldr r0, _02003AC8 ; =0x020AF050
	bl sub_02002A44
	ldr r0, _02003ACC ; =0x020AEF7C
	ldr r0, [r0, #0x28]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003AC8: .word 0x020AF050
_02003ACC: .word 0x020AEF7C
	arm_func_end sub_02003AB0

	arm_func_start sub_02003AD0
sub_02003AD0: ; 0x02003AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02003B50 ; =0x020AEF7C
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
	ldr r0, _02003B54 ; =0x020AF050
	bl sub_02002A44
	ldr r0, _02003B50 ; =0x020AEF7C
	ldr r0, [r0, #0x28]
_02003B10:
	ldr r0, _02003B50 ; =0x020AEF7C
	mov r2, #1
	strb r2, [r0, #5]
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003B30
	strb r2, [r0, #0xf]
	bl sub_020081C8
_02003B30:
	bl DisableAllInterrupts
	ldr r0, _02003B58 ; =0x0229B220
	bl sub_0207B584
	mov r0, #1
	mov r1, #0
	bl sub_02078A98
	bl EnableAllInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003B50: .word 0x020AEF7C
_02003B54: .word 0x020AF050
_02003B58: .word 0x0229B220
	arm_func_end sub_02003AD0

	arm_func_start sub_02003B5C
sub_02003B5C: ; 0x02003B5C
	ldr r0, _02003B8C ; =0x020AEF7C
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
_02003B8C: .word 0x020AEF7C
_02003B90: .word 0x027FFFA8
	arm_func_end sub_02003B5C

	arm_func_start sub_02003B94
sub_02003B94: ; 0x02003B94
	ldr r0, _02003BA8 ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BA8: .word 0x020AEF7C
	arm_func_end sub_02003B94

	arm_func_start sub_02003BAC
sub_02003BAC: ; 0x02003BAC
	ldr r0, _02003BC4 ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BC4: .word 0x020AEF7C
	arm_func_end sub_02003BAC

	arm_func_start sub_02003BC8
sub_02003BC8: ; 0x02003BC8
	stmdb sp!, {r3, lr}
	bl SoundResume
	ldr r0, _02003BE8 ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003BE8: .word 0x020AEF7C
	arm_func_end sub_02003BC8

	arm_func_start sub_02003BEC
sub_02003BEC: ; 0x02003BEC
	ldr r0, _02003BF8 ; =0x020AEF7C
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_02003BF8: .word 0x020AEF7C
	arm_func_end sub_02003BEC

	arm_func_start sub_02003BFC
sub_02003BFC: ; 0x02003BFC
	stmdb sp!, {r3, lr}
	ldr r0, _02003CB4 ; =0x020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003CAC
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003C5C
	bl sub_02003B5C
	cmp r0, #0
	bne _02003C54
	ldr r0, _02003CB8 ; =0x020924E8
	bl DebugPrint0__0200C1FC
	ldr r0, _02003CBC ; =0x0229B21C
	ldrh r0, [r0, #2]
	bl sub_02017DF4
	ldr r0, _02003CBC ; =0x0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003CB4 ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
_02003C54:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003C5C:
	bl sub_02003B5C
	cmp r0, #0
	beq _02003CAC
	ldr r0, _02003CC0 ; =0x020924F8
	bl DebugPrint0__0200C1FC
	bl sub_02017DB4
	ldr r1, _02003CBC ; =0x0229B21C
	strh r0, [r1, #2]
	bl sub_02017FF0
	ldr r1, _02003CBC ; =0x0229B21C
	strh r0, [r1]
	bl sub_02017EE8
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldr r1, _02003CB4 ; =0x020AEF7C
	mov r0, #1
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
_02003CAC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003CB4: .word 0x020AEF7C
_02003CB8: .word 0x020924E8
_02003CBC: .word 0x0229B21C
_02003CC0: .word 0x020924F8
	arm_func_end sub_02003BFC

	arm_func_start SoundResume
SoundResume: ; 0x02003CC4
	stmdb sp!, {r3, lr}
	ldr r0, _02003D20 ; =0x020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003D18
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003D18
	ldr r0, _02003D24 ; =0x020924E8
	bl DebugPrint0__0200C1FC
	ldr r0, _02003D28 ; =0x0229B21C
	ldrh r0, [r0, #2]
	bl sub_02017DF4
	ldr r0, _02003D28 ; =0x0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003D20 ; =0x020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003D18:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003D20: .word 0x020AEF7C
_02003D24: .word 0x020924E8
_02003D28: .word 0x0229B21C
	arm_func_end SoundResume

	arm_func_start CardPullOutWithStatus
CardPullOutWithStatus: ; 0x02003D2C
	stmdb sp!, {r4, lr}
	ldr r1, _02003D68 ; =0x020AEF7C
	mov r4, r0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _02003D6C ; =0x02092508
	mov r1, r4
	bl DebugPrint0__0200C1FC
	cmp r4, #0
	beq _02003D5C
	bl sub_020081DC
_02003D5C:
	mov r0, #0
	bl sub_020025F8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003D68: .word 0x020AEF7C
_02003D6C: .word 0x02092508
	arm_func_end CardPullOutWithStatus

	arm_func_start CardPullOut
CardPullOut: ; 0x02003D70
	stmdb sp!, {r3, lr}
	ldr r0, _02003D8C ; =0x0209251C
	bl DebugPrint0__0200C1FC
	ldr r0, _02003D90 ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0, #0xd]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003D8C: .word 0x0209251C
_02003D90: .word 0x020AEF7C
	arm_func_end CardPullOut

	arm_func_start CardBackupError
CardBackupError: ; 0x02003D94
	stmdb sp!, {r3, lr}
	ldr r0, _02003DB0 ; =0x0209252C
	bl DebugPrint0__0200C1FC
	ldr r0, _02003DB4 ; =0x020AEF7C
	mov r1, #1
	strb r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003DB0: .word 0x0209252C
_02003DB4: .word 0x020AEF7C
	arm_func_end CardBackupError

	arm_func_start HaltProcessDisp
HaltProcessDisp: ; 0x02003DB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl sub_02002580
	ldr r1, _02003EBC ; =0x020AF078
	cmp r0, r1
	moveq r1, #1
	movne r1, #0
	ldr r0, _02003EC0 ; =0x020AEF7C
	and r2, r1, #0xff
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003E28
	mov r1, #1
	strb r1, [r0, #0xf]
	cmp r2, #0
	beq _02003E24
	mov r6, #0
	ldr r5, _02003EC4 ; =0x020AF050
	b _02003E14
_02003E04:
	mov r0, r6
	bl sub_02079888
	mov r0, r5
	bl sub_020029B8
_02003E14:
	bl sub_020081F0
	cmp r0, #0
	beq _02003E04
	b _02003E28
_02003E24:
	bl sub_020081C8
_02003E28:
	mov r0, #1
	bl sub_02002824
	bl sub_020184A8
	ldr r0, _02003EC8 ; =0x02092540
	mov r1, r4
	bl DebugPrint0__0200C1FC
	cmp r4, #2
	bne _02003E9C
	mov r0, #1
	bl sub_0200B76C
	mov r7, #0
	mov r6, #1
	ldr r5, _02003EC0 ; =0x020AEF7C
	b _02003E7C
_02003E60:
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _02003E84
	mov r0, r6
	mov r1, r6
	bl sub_02078900
	add r7, r7, #1
_02003E7C:
	cmp r7, #0x12c
	blt _02003E60
_02003E84:
	ldr r0, _02003EC0 ; =0x020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _02003E9C
	mov r0, #0
	bl sub_02002448
_02003E9C:
	cmp r4, #1
	beq _02003EAC
	mov r0, #0
	bl sub_0200B76C
_02003EAC:
	bl sub_020845F8
	mov r0, #0
	bl sub_020025F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02003EBC: .word 0x020AF078
_02003EC0: .word 0x020AEF7C
_02003EC4: .word 0x020AF050
_02003EC8: .word 0x02092540
	arm_func_end HaltProcessDisp

	arm_func_start sub_02003ECC
sub_02003ECC: ; 0x02003ECC
	bx lr
	arm_func_end sub_02003ECC

	arm_func_start OverlayIsLoaded
OverlayIsLoaded: ; 0x02003ED0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	cmp r0, #0x24
	addls pc, pc, r0, lsl #2
	b _02004078
_02003EE4: ; jump table
	b _02003F78 ; case 0
	b _02003F80 ; case 1
	b _02003F80 ; case 2
	b _02003F80 ; case 3
	b _02003F9C ; case 4
	b _02003F9C ; case 5
	b _02003FC8 ; case 6
	b _02003FC8 ; case 7
	b _02003FC8 ; case 8
	b _02003FC8 ; case 9
	b _02003FC8 ; case 10
	b _02003FC8 ; case 11
	b _02003FC8 ; case 12
	b _02003FF4 ; case 13
	b _02003FF4 ; case 14
	b _02003FF4 ; case 15
	b _02004020 ; case 16
	b _02004020 ; case 17
	b _02004020 ; case 18
	b _02004020 ; case 19
	b _02004020 ; case 20
	b _02004020 ; case 21
	b _02004020 ; case 22
	b _02004020 ; case 23
	b _02004020 ; case 24
	b _02004020 ; case 25
	b _02004020 ; case 26
	b _02004020 ; case 27
	b _02004020 ; case 28
	b _02004020 ; case 29
	b _02004020 ; case 30
	b _02004020 ; case 31
	b _02004020 ; case 32
	b _0200404C ; case 33
	b _0200404C ; case 34
	b _0200404C ; case 35
	b _0200404C ; case 36
_02003F78:
	mov r0, #1
	b _02004098
_02003F80:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r1, [r1, #8]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003F9C:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r2, [r1, #8]
	cmp r2, #1
	movne r0, #0
	bne _02004098
	ldr r1, [r1, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003FC8:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r2, [r1, #4]
	cmp r2, #4
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02003FF4:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r2, [r1, #8]
	cmp r2, #2
	movne r0, #0
	bne _02004098
	ldr r1, [r1, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02004020:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r2, [r1, #4]
	cmp r2, #0xd
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_0200404C:
	ldr r1, _020040A0 ; =0x020AF230
	ldr r2, [r1, #4]
	cmp r2, #0xe
	movne r0, #0
	bne _02004098
	ldr r1, [r1]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02004098
_02004078:
	ldr r1, _020040A4 ; =0x02092558
	add r0, sp, #0
	ldr r2, [r1, #0x14]
	ldr r3, [r1, #0x10]
	ldr r1, _020040A8 ; =0x0209258C
	str r3, [sp]
	str r2, [sp, #4]
	bl FatalError
_02004098:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020040A0: .word 0x020AF230
_020040A4: .word 0x02092558
_020040A8: .word 0x0209258C
	arm_func_end OverlayIsLoaded

	arm_func_start LoadOverlay
LoadOverlay: ; 0x020040AC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	mov r4, r0
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _020041A4
_020040C4: ; jump table
	b _02004158 ; case 0
	b _0200415C ; case 1
	b _0200415C ; case 2
	b _0200415C ; case 3
	b _02004168 ; case 4
	b _02004168 ; case 5
	b _02004174 ; case 6
	b _02004174 ; case 7
	b _02004174 ; case 8
	b _02004174 ; case 9
	b _02004174 ; case 10
	b _02004174 ; case 11
	b _02004174 ; case 12
	b _02004180 ; case 13
	b _02004180 ; case 14
	b _02004180 ; case 15
	b _0200418C ; case 16
	b _0200418C ; case 17
	b _0200418C ; case 18
	b _0200418C ; case 19
	b _0200418C ; case 20
	b _0200418C ; case 21
	b _0200418C ; case 22
	b _0200418C ; case 23
	b _0200418C ; case 24
	b _0200418C ; case 25
	b _0200418C ; case 26
	b _0200418C ; case 27
	b _0200418C ; case 28
	b _0200418C ; case 29
	b _0200418C ; case 30
	b _0200418C ; case 31
	b _0200418C ; case 32
	b _02004198 ; case 33
	b _02004198 ; case 34
	b _02004198 ; case 35
	b _02004198 ; case 36
_02004158:
	b _020047C4
_0200415C:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0, #8]
	b _020041C4
_02004168:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0, #4]
	b _020041C4
_02004174:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0]
	b _020041C4
_02004180:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0, #4]
	b _020041C4
_0200418C:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0]
	b _020041C4
_02004198:
	ldr r0, _020047CC ; =0x020AF230
	str r4, [r0]
	b _020041C4
_020041A4:
	ldr r1, _020047D0 ; =0x02092558
	add r0, sp, #8
	ldr r2, [r1, #0x1c]
	ldr r3, [r1, #0x18]
	ldr r1, _020047D4 ; =0x020925A0
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl FatalError
_020041C4:
	bl DataTransferInit
	bl sub_0207A324
	bl sub_0207A270
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004780
_020041DC: ; jump table
	b _02004780 ; case 0
	b _02004270 ; case 1
	b _02004294 ; case 2
	b _020042B8 ; case 3
	b _020042DC ; case 4
	b _02004300 ; case 5
	b _02004324 ; case 6
	b _02004348 ; case 7
	b _0200436C ; case 8
	b _02004390 ; case 9
	b _020043B4 ; case 10
	b _020043D8 ; case 11
	b _020043FC ; case 12
	b _02004420 ; case 13
	b _02004444 ; case 14
	b _02004468 ; case 15
	b _0200448C ; case 16
	b _020044B0 ; case 17
	b _020044D4 ; case 18
	b _020044F8 ; case 19
	b _0200451C ; case 20
	b _02004540 ; case 21
	b _02004564 ; case 22
	b _02004588 ; case 23
	b _020045AC ; case 24
	b _020045D0 ; case 25
	b _020045F4 ; case 26
	b _02004618 ; case 27
	b _0200463C ; case 28
	b _02004660 ; case 29
	b _02004684 ; case 30
	b _020046A8 ; case 31
	b _020046CC ; case 32
	b _020046F0 ; case 33
	b _02004714 ; case 34
	b _02004738 ; case 35
	b _0200475C ; case 36
_02004270:
	ldr r2, _020047D8 ; =0x00000000
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004294:
	ldr r2, _020047DC ; =0x0000000A
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042B8:
	ldr r2, _020047E0 ; =0x00000023
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020042DC:
	ldr r2, _020047E4 ; =0x00000001
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004300:
	ldr r2, _020047E8 ; =0x00000002
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004324:
	ldr r2, _020047EC ; =0x00000003
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004348:
	ldr r2, _020047F0 ; =0x00000006
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200436C:
	ldr r2, _020047F4 ; =0x00000004
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004390:
	ldr r2, _020047F8 ; =0x00000005
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043B4:
	ldr r2, _020047FC ; =0x00000007
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043D8:
	ldr r2, _02004800 ; =0x00000008
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020043FC:
	ldr r2, _02004804 ; =0x00000009
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004420:
	ldr r2, _02004808 ; =0x0000000B
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004444:
	ldr r2, _0200480C ; =0x0000001D
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004468:
	ldr r2, _02004810 ; =0x00000022
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200448C:
	ldr r2, _02004814 ; =0x0000000C
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044B0:
	ldr r2, _02004818 ; =0x0000000D
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044D4:
	ldr r2, _0200481C ; =0x0000000E
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020044F8:
	ldr r2, _02004820 ; =0x0000000F
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200451C:
	ldr r2, _02004824 ; =0x00000010
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004540:
	ldr r2, _02004828 ; =0x00000011
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004564:
	ldr r2, _0200482C ; =0x00000012
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004588:
	ldr r2, _02004830 ; =0x00000013
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045AC:
	ldr r2, _02004834 ; =0x00000014
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045D0:
	ldr r2, _02004838 ; =0x00000015
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020045F4:
	ldr r2, _0200483C ; =0x00000016
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004618:
	ldr r2, _02004840 ; =0x00000017
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200463C:
	ldr r2, _02004844 ; =0x00000018
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004660:
	ldr r2, _02004848 ; =0x00000019
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004684:
	ldr r2, _0200484C ; =0x0000001A
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046A8:
	ldr r2, _02004850 ; =0x0000001B
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046CC:
	ldr r2, _02004854 ; =0x0000001C
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_020046F0:
	ldr r2, _02004858 ; =0x0000001E
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004714:
	ldr r2, _0200485C ; =0x0000001F
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004738:
	ldr r2, _02004860 ; =0x00000020
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_0200475C:
	ldr r2, _02004864 ; =0x00000021
	add r0, sp, #0x10
	mov r1, #0
	bl sub_0207FC9C
	cmp r0, #0
	bne _020047A0
	mov r0, #1
	bl CardPullOutWithStatus
	b _020047A0
_02004780:
	ldr r1, _020047D0 ; =0x02092558
	add r0, sp, #0
	ldr r2, [r1, #0xc]
	ldr r3, [r1, #8]
	ldr r1, _020047D4 ; =0x020925A0
	str r3, [sp]
	str r2, [sp, #4]
	bl FatalError
_020047A0:
	add r0, sp, #0x10
	bl sub_0207FD98
	cmp r0, #0
	bne _020047B8
	mov r0, #1
	bl CardPullOutWithStatus
_020047B8:
	add r0, sp, #0x10
	bl sub_0207FEBC
	bl DataTransferStop
_020047C4:
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020047CC: .word 0x020AF230
_020047D0: .word 0x02092558
_020047D4: .word 0x020925A0
_020047D8: .word 0x00000000
_020047DC: .word 0x0000000A
_020047E0: .word 0x00000023
_020047E4: .word 0x00000001
_020047E8: .word 0x00000002
_020047EC: .word 0x00000003
_020047F0: .word 0x00000006
_020047F4: .word 0x00000004
_020047F8: .word 0x00000005
_020047FC: .word 0x00000007
_02004800: .word 0x00000008
_02004804: .word 0x00000009
_02004808: .word 0x0000000B
_0200480C: .word 0x0000001D
_02004810: .word 0x00000022
_02004814: .word 0x0000000C
_02004818: .word 0x0000000D
_0200481C: .word 0x0000000E
_02004820: .word 0x0000000F
_02004824: .word 0x00000010
_02004828: .word 0x00000011
_0200482C: .word 0x00000012
_02004830: .word 0x00000013
_02004834: .word 0x00000014
_02004838: .word 0x00000015
_0200483C: .word 0x00000016
_02004840: .word 0x00000017
_02004844: .word 0x00000018
_02004848: .word 0x00000019
_0200484C: .word 0x0000001A
_02004850: .word 0x0000001B
_02004854: .word 0x0000001C
_02004858: .word 0x0000001E
_0200485C: .word 0x0000001F
_02004860: .word 0x00000020
_02004864: .word 0x00000021
	arm_func_end LoadOverlay

	arm_func_start UnloadOverlay
UnloadOverlay: ; 0x02004868
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004968
_02004880: ; jump table
	b _02004914 ; case 0
	b _02004918 ; case 1
	b _02004918 ; case 2
	b _02004918 ; case 3
	b _02004928 ; case 4
	b _02004928 ; case 5
	b _02004938 ; case 6
	b _02004938 ; case 7
	b _02004938 ; case 8
	b _02004938 ; case 9
	b _02004938 ; case 10
	b _02004938 ; case 11
	b _02004938 ; case 12
	b _02004928 ; case 13
	b _02004928 ; case 14
	b _02004928 ; case 15
	b _02004948 ; case 16
	b _02004948 ; case 17
	b _02004948 ; case 18
	b _02004948 ; case 19
	b _02004948 ; case 20
	b _02004948 ; case 21
	b _02004948 ; case 22
	b _02004948 ; case 23
	b _02004948 ; case 24
	b _02004948 ; case 25
	b _02004948 ; case 26
	b _02004948 ; case 27
	b _02004948 ; case 28
	b _02004948 ; case 29
	b _02004948 ; case 30
	b _02004948 ; case 31
	b _02004948 ; case 32
	b _02004958 ; case 33
	b _02004958 ; case 34
	b _02004958 ; case 35
	b _02004958 ; case 36
_02004914:
	b _02004ED0
_02004918:
	ldr r0, _02004ED8 ; =0x020AF230
	mov r1, #0
	str r1, [r0, #8]
	b _02004988
_02004928:
	ldr r0, _02004ED8 ; =0x020AF230
	mov r1, #0
	str r1, [r0, #4]
	b _02004988
_02004938:
	ldr r0, _02004ED8 ; =0x020AF230
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004948:
	ldr r0, _02004ED8 ; =0x020AF230
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004958:
	ldr r0, _02004ED8 ; =0x020AF230
	mov r1, #0
	str r1, [r0]
	b _02004988
_02004968:
	ldr r1, _02004EDC ; =0x02092558
	add r0, sp, #8
	ldr r2, [r1, #0x24]
	ldr r3, [r1, #0x20]
	ldr r1, _02004EE0 ; =0x020925B4
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl FatalError
_02004988:
	bl DataTransferInit
	cmp r4, #0x24
	addls pc, pc, r4, lsl #2
	b _02004EAC
_02004998: ; jump table
	b _02004EAC ; case 0
	b _02004A2C ; case 1
	b _02004A4C ; case 2
	b _02004A6C ; case 3
	b _02004A8C ; case 4
	b _02004AAC ; case 5
	b _02004ACC ; case 6
	b _02004AEC ; case 7
	b _02004B0C ; case 8
	b _02004B2C ; case 9
	b _02004B4C ; case 10
	b _02004B6C ; case 11
	b _02004B8C ; case 12
	b _02004BAC ; case 13
	b _02004BCC ; case 14
	b _02004BEC ; case 15
	b _02004C0C ; case 16
	b _02004C2C ; case 17
	b _02004C4C ; case 18
	b _02004C6C ; case 19
	b _02004C8C ; case 20
	b _02004CAC ; case 21
	b _02004CCC ; case 22
	b _02004CEC ; case 23
	b _02004D0C ; case 24
	b _02004D2C ; case 25
	b _02004D4C ; case 26
	b _02004D6C ; case 27
	b _02004D8C ; case 28
	b _02004DAC ; case 29
	b _02004DCC ; case 30
	b _02004DEC ; case 31
	b _02004E0C ; case 32
	b _02004E2C ; case 33
	b _02004E4C ; case 34
	b _02004E6C ; case 35
	b _02004E8C ; case 36
_02004A2C:
	ldr r1, _02004EE4 ; =0x00000000
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A4C:
	ldr r1, _02004EE8 ; =0x0000000A
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A6C:
	ldr r1, _02004EEC ; =0x00000023
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004A8C:
	ldr r1, _02004EF0 ; =0x00000001
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AAC:
	ldr r1, _02004EF4 ; =0x00000002
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004ACC:
	ldr r1, _02004EF8 ; =0x00000003
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004AEC:
	ldr r1, _02004EFC ; =0x00000006
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B0C:
	ldr r1, _02004F00 ; =0x00000004
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B2C:
	ldr r1, _02004F04 ; =0x00000005
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B4C:
	ldr r1, _02004F08 ; =0x00000007
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B6C:
	ldr r1, _02004F0C ; =0x00000008
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004B8C:
	ldr r1, _02004F10 ; =0x00000009
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BAC:
	ldr r1, _02004F14 ; =0x0000000B
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BCC:
	ldr r1, _02004F18 ; =0x0000001D
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004BEC:
	ldr r1, _02004F1C ; =0x00000022
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C0C:
	ldr r1, _02004F20 ; =0x0000000C
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C2C:
	ldr r1, _02004F24 ; =0x0000000D
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C4C:
	ldr r1, _02004F28 ; =0x0000000E
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C6C:
	ldr r1, _02004F2C ; =0x0000000F
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004C8C:
	ldr r1, _02004F30 ; =0x00000010
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CAC:
	ldr r1, _02004F34 ; =0x00000011
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CCC:
	ldr r1, _02004F38 ; =0x00000012
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004CEC:
	ldr r1, _02004F3C ; =0x00000013
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D0C:
	ldr r1, _02004F40 ; =0x00000014
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D2C:
	ldr r1, _02004F44 ; =0x00000015
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D4C:
	ldr r1, _02004F48 ; =0x00000016
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D6C:
	ldr r1, _02004F4C ; =0x00000017
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004D8C:
	ldr r1, _02004F50 ; =0x00000018
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DAC:
	ldr r1, _02004F54 ; =0x00000019
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DCC:
	ldr r1, _02004F58 ; =0x0000001A
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004DEC:
	ldr r1, _02004F5C ; =0x0000001B
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E0C:
	ldr r1, _02004F60 ; =0x0000001C
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E2C:
	ldr r1, _02004F64 ; =0x0000001E
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E4C:
	ldr r1, _02004F68 ; =0x0000001F
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E6C:
	ldr r1, _02004F6C ; =0x00000020
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004E8C:
	ldr r1, _02004F70 ; =0x00000021
	mov r0, #0
	bl sub_020800B0
	cmp r0, #0
	bne _02004ECC
	mov r0, #1
	bl CardPullOutWithStatus
	b _02004ECC
_02004EAC:
	ldr r1, _02004EDC ; =0x02092558
	add r0, sp, #0
	ldr r2, [r1, #4]
	ldr r3, [r1]
	ldr r1, _02004EE0 ; =0x020925B4
	str r3, [sp]
	str r2, [sp, #4]
	bl FatalError
_02004ECC:
	bl DataTransferStop
_02004ED0:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02004ED8: .word 0x020AF230
_02004EDC: .word 0x02092558
_02004EE0: .word 0x020925B4
_02004EE4: .word 0x00000000
_02004EE8: .word 0x0000000A
_02004EEC: .word 0x00000023
_02004EF0: .word 0x00000001
_02004EF4: .word 0x00000002
_02004EF8: .word 0x00000003
_02004EFC: .word 0x00000006
_02004F00: .word 0x00000004
_02004F04: .word 0x00000005
_02004F08: .word 0x00000007
_02004F0C: .word 0x00000008
_02004F10: .word 0x00000009
_02004F14: .word 0x0000000B
_02004F18: .word 0x0000001D
_02004F1C: .word 0x00000022
_02004F20: .word 0x0000000C
_02004F24: .word 0x0000000D
_02004F28: .word 0x0000000E
_02004F2C: .word 0x0000000F
_02004F30: .word 0x00000010
_02004F34: .word 0x00000011
_02004F38: .word 0x00000012
_02004F3C: .word 0x00000013
_02004F40: .word 0x00000014
_02004F44: .word 0x00000015
_02004F48: .word 0x00000016
_02004F4C: .word 0x00000017
_02004F50: .word 0x00000018
_02004F54: .word 0x00000019
_02004F58: .word 0x0000001A
_02004F5C: .word 0x0000001B
_02004F60: .word 0x0000001C
_02004F64: .word 0x0000001E
_02004F68: .word 0x0000001F
_02004F6C: .word 0x00000020
_02004F70: .word 0x00000021
	arm_func_end UnloadOverlay

	arm_func_start sub_02004F74
sub_02004F74: ; 0x02004F74
	ldr ip, _02004F7C ; =sub_0207BA08
	bx ip
	.align 2, 0
_02004F7C: .word sub_0207BA08
	arm_func_end sub_02004F74

	arm_func_start sub_02004F80
sub_02004F80: ; 0x02004F80
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02004FC8 ; =0xEDB88320
	mov r5, r0
	bl sub_020850B4
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_02085180
	mov r4, r0
	mov r0, r5
	bl MemFree
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02004FC8: .word 0xEDB88320
	arm_func_end sub_02004F80

	arm_func_start sub_02004FCC
sub_02004FCC: ; 0x02004FCC
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	ldrb ip, [r1]
	and r1, r2, #0xf8
	and r2, r3, #0xf8
	mov r1, r1, lsl #2
	and r3, ip, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r3, asr #3
	strh r1, [r0]
	bx lr
	arm_func_end sub_02004FCC

	arm_func_start sub_02004FF8
sub_02004FF8: ; 0x02004FF8
	ldrh r2, [r1]
	tst r2, #1
	movne r3, #7
	moveq r3, #0
	mov r1, r2, lsl #0x1b
	orr r1, r3, r1, lsr #24
	tst r2, #0x20
	movne r3, #7
	strb r1, [r0]
	moveq r3, #0
	and r1, r2, #0x3e0
	orr r1, r3, r1, asr #2
	tst r2, #0x400
	movne r3, #7
	strb r1, [r0, #1]
	moveq r3, #0
	and r1, r2, #0x7c00
	orr r1, r3, r1, asr #7
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #3]
	bx lr
	arm_func_end sub_02004FF8

	arm_func_start EuclideanNorm__02005050
EuclideanNorm__02005050: ; 0x02005050
	stmdb sp!, {r4, r5, r6, lr}
	ldmia r0, {r5, r6}
	mov r0, r5
	bl IntToFloat
	mov r4, r0
	mov r0, r5
	bl IntToFloat
	mov r1, r0
	mov r0, r4
	bl MultiplyFloat
	mov r5, r0
	mov r0, r6
	bl IntToFloat
	mov r4, r0
	mov r0, r6
	bl IntToFloat
	mov r1, r0
	mov r0, r4
	bl MultiplyFloat
	mov r1, r0
	mov r0, r5
	bl AddFloat
	bl Sqrtf
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EuclideanNorm__02005050

	arm_func_start EuclideanNorm__020050B0
EuclideanNorm__020050B0: ; 0x020050B0
	stmdb sp!, {r4, r5, r6, lr}
	ldmia r0, {r5, r6}
	mov r0, r5
	bl IntToFloat
	mov r4, r0
	mov r0, r5
	bl IntToFloat
	mov r1, r0
	mov r0, r4
	bl MultiplyFloat
	mov r5, r0
	mov r0, r6
	bl IntToFloat
	mov r4, r0
	mov r0, r6
	bl IntToFloat
	mov r1, r0
	mov r0, r4
	bl MultiplyFloat
	mov r1, r0
	mov r0, r5
	bl AddFloat
	bl Sqrtf
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EuclideanNorm__020050B0

	arm_func_start ClampComponentAbs
ClampComponentAbs: ; 0x02005110
	ldr r3, [r0]
	cmp r3, r1
	strgt r1, [r0]
	bgt _0200512C
	rsb r2, r1, #0
	cmp r3, r2
	strlt r2, [r0]
_0200512C:
	ldr r2, [r0, #4]
	cmp r2, r1
	strgt r1, [r0, #4]
	bxgt lr
	rsb r1, r1, #0
	cmp r2, r1
	strlt r1, [r0, #4]
	bx lr
	arm_func_end ClampComponentAbs

	arm_func_start sub_0200514C
sub_0200514C: ; 0x0200514C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r2
	ldr r4, [sp, #0x18]
	ldr r2, [r6]
	mov r7, r1
	mul r1, r2, r4
	mov r5, r3
	ldr r2, [r7]
	mov r8, r0
	mla r0, r2, r5, r1
	add r1, r5, r4
	bl DivideInt
	str r0, [r8]
	ldr r0, [r6, #4]
	ldr r2, [r7, #4]
	mul r1, r0, r4
	mla r0, r2, r5, r1
	add r1, r5, r4
	bl DivideInt
	str r0, [r8, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200514C

	arm_func_start sub_020051A0
sub_020051A0: ; 0x020051A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _0200533C
_020051B4: ; jump table
	b _0200533C ; case 0
	b _02005204 ; case 1
	b _0200521C ; case 2
	b _02005234 ; case 3
	b _0200524C ; case 4
	b _02005264 ; case 5
	b _0200527C ; case 6
	b _020052DC ; case 7
	b _02005304 ; case 8
	b _0200531C ; case 9
	b _0200533C ; case 10
	b _0200533C ; case 11
	b _02005330 ; case 12
	b _02005330 ; case 13
	b _02005330 ; case 14
	b _02005330 ; case 15
	b _02005330 ; case 16
	b _02005330 ; case 17
	b _02005330 ; case 18
	b _02005330 ; case 19
_02005204:
	cmp r4, #0
	addge r0, r4, #7
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200521C:
	cmp r4, #0
	addge r0, r4, #1
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_02005234:
	cmp r4, #0
	addge r0, r4, #6
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200524C:
	cmp r4, #0
	addge r0, r4, #2
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_02005264:
	cmp r4, #0
	addge r0, r4, #4
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r4, r0, asr #0x18
	b _0200533C
_0200527C:
	tst r4, #1
	beq _020052B0
	mov r0, #2
	bl RandInt
	mov r0, r0, lsl #1
	add r0, r0, #7
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_020052B0:
	mov r0, #3
	bl RandInt
	mov r0, r0, lsl #1
	add r0, r0, #6
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_020052DC:
	mov r0, #3
	bl RandInt
	add r0, r0, #7
	add r0, r4, r0
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_02005304:
	mov r0, #8
	bl RandInt
	bic r0, r0, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_0200531C:
	mov r0, #8
	bl RandInt
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	b _0200533C
_02005330:
	sub r0, r1, #0xc
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
_0200533C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020051A0

	arm_func_start sub_02005344
sub_02005344: ; 0x02005344
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, r4
	ldmeqia sp!, {r4, pc}
	cmp r2, #0x13
	addls pc, pc, r2, lsl #2
	ldmia sp!, {r4, pc}
_02005360: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	b _020053B0 ; case 1
	b _020053C8 ; case 2
	b _020053E0 ; case 3
	b _020053F8 ; case 4
	ldmia sp!, {r4, pc} ; case 5
	ldmia sp!, {r4, pc} ; case 6
	ldmia sp!, {r4, pc} ; case 7
	ldmia sp!, {r4, pc} ; case 8
	ldmia sp!, {r4, pc} ; case 9
	b _02005414 ; case 10
	b _02005410 ; case 11
	b _02005420 ; case 12
	b _02005420 ; case 13
	b _02005420 ; case 14
	b _02005420 ; case 15
	b _02005420 ; case 16
	b _02005420 ; case 17
	b _02005420 ; case 18
	b _02005420 ; case 19
_020053B0:
	cmp r0, #0
	addge r0, r0, #7
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053C8:
	cmp r0, #0
	addge r0, r0, #1
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053E0:
	cmp r0, #0
	addge r0, r0, #6
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_020053F8:
	cmp r0, #0
	addge r0, r0, #2
	andge r0, r0, #7
	movge r0, r0, lsl #0x18
	movge r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_02005410:
	bl sub_02005430
_02005414:
	mov r1, r4
	bl sub_02005430
	ldmia sp!, {r4, pc}
_02005420:
	sub r0, r2, #0xc
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
	arm_func_end sub_02005344

	arm_func_start sub_02005430
sub_02005430: ; 0x02005430
	mvn r2, #0
	cmp r1, r2
	bxeq lr
	add r1, r1, #8
	sub r1, r1, r0
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	adds r1, r2, r1, ror #29
	bxeq lr
	cmp r1, #4
	bge _02005478
	add r0, r0, #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_02005478:
	add r0, r0, #7
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	arm_func_end sub_02005430

	arm_func_start sub_02005494
sub_02005494: ; 0x02005494
	ldr ip, _020054BC ; =0x020925F8
	add r3, r0, #1
	ldr r0, [ip, r3, lsl #3]
	add ip, ip, r3, lsl #3
	mul r3, r0, r2
	str r3, [r1]
	ldr r0, [ip, #4]
	mul r2, r0, r2
	str r2, [r1, #4]
	bx lr
	.align 2, 0
_020054BC: .word 0x020925F8
	arm_func_end sub_02005494

	arm_func_start sub_020054C0
sub_020054C0: ; 0x020054C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020055C4 ; =0x020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x20]
	ldr r1, [r1, #0x24]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl Abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl Abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005550
	cmp r5, #0
	bge _02005530
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #5
	b _020055BC
_02005530:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #7
	b _020055BC
_02005550:
	ble _0200559C
	cmp r5, #0
	bge _0200557C
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #3
	b _020055BC
_0200557C:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020055BC
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #1
	b _020055BC
_0200559C:
	cmp r5, #0
	movlt r0, #4
	blt _020055BC
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_020055BC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020055C4: .word 0x020925C8
	arm_func_end sub_020054C0

	arm_func_start sub_020055C8
sub_020055C8: ; 0x020055C8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020056CC ; =0x020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x18]
	ldr r1, [r1, #0x1c]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl Abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl Abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005658
	cmp r5, #0
	bge _02005638
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #5
	b _020056C4
_02005638:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #6
	movle r0, #7
	b _020056C4
_02005658:
	ble _020056A4
	cmp r5, #0
	bge _02005684
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #4
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #3
	b _020056C4
_02005684:
	ldr r1, [sp]
	cmp r0, r1, lsl #1
	movgt r0, #0
	bgt _020056C4
	cmp r1, r0, lsl #1
	movgt r0, #2
	movle r0, #1
	b _020056C4
_020056A4:
	cmp r5, #0
	movlt r0, #4
	blt _020056C4
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_020056C4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020056CC: .word 0x020925C8
	arm_func_end sub_020055C8

	arm_func_start sub_020056D0
sub_020056D0: ; 0x020056D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _020057A4 ; =0x020925C8
	mov r5, r0
	ldr r4, [r5]
	ldr r2, [r1, #0x28]
	ldr r1, [r1, #0x2c]
	mov r0, r4
	str r2, [sp]
	str r1, [sp, #4]
	bl Abs
	ldr r5, [r5, #4]
	str r0, [sp]
	mov r0, r5
	bl Abs
	str r0, [sp, #4]
	cmp r4, #0
	bge _02005748
	cmp r5, #0
	bge _02005734
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #4
	movle r0, #6
	b _0200579C
_02005734:
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #0
	movle r0, #6
	b _0200579C
_02005748:
	ble _0200577C
	cmp r5, #0
	bge _02005768
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #4
	movle r0, #2
	b _0200579C
_02005768:
	ldr r1, [sp]
	cmp r0, r1
	movgt r0, #0
	movle r0, #2
	b _0200579C
_0200577C:
	cmp r5, #0
	movlt r0, #4
	blt _0200579C
	movle r0, #1
	movgt r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	rsb r0, r0, #0
_0200579C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020057A4: .word 0x020925C8
	arm_func_end sub_020056D0

	arm_func_start sub_020057A8
sub_020057A8: ; 0x020057A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _020058A4 ; =0x020925C8
	ldr lr, [ip, #4]
	ldr ip, [ip]
	str lr, [sp, #4]
	str ip, [sp]
	ldr lr, [r2]
	ldr ip, [r0]
	subs ip, lr, ip
	str ip, [sp]
	ldr r2, [r2, #4]
	ldr r0, [r0, #4]
	sub r0, r2, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	ldr r0, [r3]
	bmi _02005814
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	subs r0, ip, r0
	str r0, [sp]
	movmi r0, #0
	strmi r0, [sp]
	b _02005838
_02005814:
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	add r0, ip, r0
	str r0, [sp]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp]
_02005838:
	ldr r0, [sp, #4]
	ldr r2, [r1, #4]
	cmp r0, #0
	ldr r1, [r3, #4]
	blt _02005870
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #4]
	movmi r0, #0
	strmi r0, [sp, #4]
	b _02005894
_02005870:
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	add r0, r0, r1
	str r0, [sp, #4]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp, #4]
_02005894:
	add r0, sp, #0
	bl sub_020056D0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020058A4: .word 0x020925C8
	arm_func_end sub_020057A8

	arm_func_start sub_020058A8
sub_020058A8: ; 0x020058A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _020059A4 ; =0x020925C8
	ldr lr, [ip, #0xc]
	ldr ip, [ip, #8]
	str lr, [sp, #4]
	str ip, [sp]
	ldr lr, [r2]
	ldr ip, [r0]
	subs ip, lr, ip
	str ip, [sp]
	ldr r2, [r2, #4]
	ldr r0, [r0, #4]
	sub r0, r2, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	ldr r0, [r3]
	bmi _02005914
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	subs r0, ip, r0
	str r0, [sp]
	movmi r0, #0
	strmi r0, [sp]
	b _02005938
_02005914:
	add r0, r2, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	sub r0, r0, #1
	add r0, ip, r0
	str r0, [sp]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp]
_02005938:
	ldr r0, [sp, #4]
	ldr r2, [r1, #4]
	cmp r0, #0
	ldr r1, [r3, #4]
	blt _02005970
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #4]
	movmi r0, #0
	strmi r0, [sp, #4]
	b _02005994
_02005970:
	add r1, r2, r1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	sub r1, r1, #1
	add r0, r0, r1
	str r0, [sp, #4]
	cmp r0, #0
	movgt r0, #0
	strgt r0, [sp, #4]
_02005994:
	add r0, sp, #0
	bl sub_020055C8
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020059A4: .word 0x020925C8
	arm_func_end sub_020058A8

	arm_func_start sub_020059A8
sub_020059A8: ; 0x020059A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xac
	ldr r0, _02005A8C ; =0x020AF240
	bl sub_02002C40
	ldr r0, _02005A8C ; =0x020AF240
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02005A8C ; =0x020AF240
	bl sub_02002E98
	ldr r8, _02005A90 ; =0x022A3248
	ldr r7, _02005A94 ; =0x02092670
	ldr r6, _02005A98 ; =0x020926C0
	add r5, sp, #0
	mov sb, #0
	mov r4, #0xa
_020059E4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _020059E4
	ldmia r6, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	mov r5, #0
	mov r6, #1
	mov r4, r5
_02005A08:
	ldrb r0, [r7, #8]
	strh sb, [r8]
	cmp r0, #0
	beq _02005A2C
	mov r1, r6
	mov r2, r5
	add r0, r8, #4
	bl sub_02002A9C
	b _02005A50
_02005A2C:
	add sl, sp, #0
	add lr, r8, #4
	mov ip, #0xa
_02005A38:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02005A38
	ldmia sl, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
_02005A50:
	strh r4, [r8, #0xb0]
	str r4, [r8, #0xb8]
	ldr r1, [r7, #0x10]
	mov r0, sb
	str r4, [r8, #0xb4]
	bl sub_02005A9C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	add r8, r8, #0xbc
	add r7, r7, #0x14
	blt _02005A08
	add sp, sp, #0xac
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02005A8C: .word 0x020AF240
_02005A90: .word 0x022A3248
_02005A94: .word 0x02092670
_02005A98: .word 0x020926C0
	arm_func_end sub_020059A8

	arm_func_start sub_02005A9C
sub_02005A9C: ; 0x02005A9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02005B0C ; =0x02092670
	mov r4, r0
	mov r0, #0x14
	mla r0, r4, r0, r2
	ldrh r0, [r0, #4]
	ldr r3, _02005B10 ; =0x022A3248
	mov r2, #0xbc
	mla r6, r4, r2, r3
	mov r8, r1
	cmp r0, #0
	mov r7, #0
	beq _02005B04
	bl sub_020031C0
	mov r5, r0
	bl sub_0200302C
	mov r0, r4
	bl sub_02005D30
	ldr r0, _02005B14 ; =0x020AF240
	bl sub_02002CB4
	ldr r7, [r6, #0xb8]
	ldr r0, _02005B14 ; =0x020AF240
	str r8, [r6, #0xb8]
	bl sub_02002E98
	mov r0, r5
	bl sub_020030FC
_02005B04:
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02005B0C: .word 0x02092670
_02005B10: .word 0x022A3248
_02005B14: .word 0x020AF240
	arm_func_end sub_02005A9C

	arm_func_start sub_02005B18
sub_02005B18: ; 0x02005B18
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	ldrsh ip, [r6]
	ldrh r5, [r6, #2]
	ldr r3, _02005D04 ; =0x022A3248
	mov r0, #0xbc
	ldr r2, _02005D08 ; =0x02092670
	mov r1, #0x14
	mla r4, ip, r0, r3
	tst r5, #0x400
	orrne r0, r5, #0x200
	movne r0, r0, lsl #0x10
	mla r1, ip, r1, r2
	movne r5, r0, lsr #0x10
	bne _02005B6C
	tst r5, #0x800
	ldreq r0, [r1, #0xc]
	orreq r0, r5, r0
	moveq r0, r0, lsl #0x10
	moveq r5, r0, lsr #0x10
_02005B6C:
	ldrh r0, [r1, #6]
	bl sub_020031C0
	ldrsh r0, [r6]
	bl sub_02005D30
	ldr r0, _02005D0C ; =0x020AF240
	bl sub_02002CB4
	ldr r0, _02005D10 ; =0x020AF23C
	ldr r1, [r0]
	add r2, r1, #1
	str r2, [r4, #0xb4]
	strh r5, [r4, #0xb0]
	ldrh r1, [r4, #0xb0]
	str r2, [r0]
	and r0, r1, #0xff
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02005CE0
_02005BB0: ; jump table
	b _02005BD0 ; case 0
	b _02005BF4 ; case 1
	b _02005C18 ; case 2
	b _02005C3C ; case 3
	b _02005C60 ; case 4
	b _02005C8C ; case 5
	b _02005CB8 ; case 6
	b _02005CE0 ; case 7
_02005BD0:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BFA4
	b _02005CE0
_02005BF4:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	b _02005CE0
_02005C18:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207C03C
	b _02005CE0
_02005C3C:
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BF04
	b _02005CE0
_02005C60:
	bl sub_020783D0
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl sub_02078470
	b _02005CE0
_02005C8C:
	bl sub_020784B8
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl sub_02078500
	b _02005CE0
_02005CB8:
	bl sub_02078544
	ldr r0, [r4, #0xb8]
	ldr r0, [r0]
	stmia sp, {r0, r4}
	ldrsh r0, [r6]
	ldr r1, [r6, #8]
	ldr r2, [r6, #0xc]
	ldr r3, [r6, #4]
	bl sub_0207BE6C
	bl sub_0207855C
_02005CE0:
	ldr r0, _02005D0C ; =0x020AF240
	bl sub_02002E98
	ldrh r0, [r4, #0xb0]
	tst r0, #0x100
	beq _02005CFC
	ldrsh r0, [r4]
	bl sub_02005D30
_02005CFC:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02005D04: .word 0x022A3248
_02005D08: .word 0x02092670
_02005D0C: .word 0x020AF240
_02005D10: .word 0x020AF23C
	arm_func_end sub_02005B18

	arm_func_start sub_02005D14
sub_02005D14: ; 0x02005D14
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #0xb0]
	tst r1, #0x200
	ldmeqia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02002B38
	ldmia sp!, {r3, pc}
	arm_func_end sub_02005D14

	arm_func_start sub_02005D30
sub_02005D30: ; 0x02005D30
	stmdb sp!, {r4, lr}
	ldr r1, _02005D88 ; =0x02092670
	mov r4, r0
	mov r0, #0x14
	mla r0, r4, r0, r1
	ldrh r0, [r0, #6]
	bl sub_020031C0
	ldr r1, _02005D8C ; =0x022A3248
	mov r0, #0xbc
	mla r0, r4, r0, r1
	ldr r0, [r0, #0xb8]
	cmp r0, #0
	beq _02005D74
	ldr r1, [r0, #8]
	mov r0, r4
	blx r1
	ldmia sp!, {r4, pc}
_02005D74:
	mov r0, r4
	bl sub_0207C0DC
	cmp r0, #0
	bne _02005D74
	ldmia sp!, {r4, pc}
	.align 2, 0
_02005D88: .word 0x02092670
_02005D8C: .word 0x022A3248
	arm_func_end sub_02005D30

	arm_func_start sub_02005D90
sub_02005D90: ; 0x02005D90
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02005DDC ; =0x022A3248
	mov r5, r0
	mov r0, #0xbc
	smlabb r4, r5, r0, r1
	ldrh r0, [r4, #0xb0]
	tst r0, #0x200
	beq _02005DC8
	add r0, r4, #4
	bl sub_02002B7C
	ldrh r0, [r4, #0xb0]
	bic r0, r0, #0x200
	strh r0, [r4, #0xb0]
	ldmia sp!, {r3, r4, r5, pc}
_02005DC8:
	mov r0, r5
	bl sub_0207C0DC
	cmp r0, #0
	bne _02005DC8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02005DDC: .word 0x022A3248
	arm_func_end sub_02005D90

	arm_func_start sub_02005DE0
sub_02005DE0: ; 0x02005DE0
	stmdb sp!, {r3, lr}
	ldr r2, _02005E0C ; =0x022A3248
	mov r1, #0xbc
	smlabb r1, r0, r1, r2
	ldrh r1, [r1, #0xb0]
	tst r1, #0x200
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl sub_0207C0DC
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02005E0C: .word 0x022A3248
	arm_func_end sub_02005DE0

	arm_func_start sub_02005E10
sub_02005E10: ; 0x02005E10
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr ip, [sp, #0x18]
	strh r0, [sp]
	add r0, sp, #0
	strh r1, [sp, #2]
	str ip, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	bl sub_02005B18
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end sub_02005E10

	arm_func_start sub_02005E40
sub_02005E40: ; 0x02005E40
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02005EA4 ; =0x020AF264
	bl sub_02002C40
	ldr r0, _02005EA4 ; =0x020AF264
	mov r1, #8
	bl sub_02002CAC
	mov r8, #0
	ldr r7, _02005EA8 ; =0x022A353C
	mov r6, r8
	mov r5, r8
	mov r4, #0xc
	b _02005E8C
_02005E70:
	mla r0, r8, r4, r7
	mov r1, r6
	bl sub_02005F14
	mov r0, r8
	mov r1, r5
	bl sub_02005F30
	add r8, r8, #1
_02005E8C:
	cmp r8, #2
	blt _02005E70
	ldr r0, _02005EA4 ; =0x020AF264
	bl sub_02002E98
	bl sub_02006030
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02005EA4: .word 0x020AF264
_02005EA8: .word 0x022A353C
	arm_func_end sub_02005E40

	arm_func_start sub_02005EAC
sub_02005EAC: ; 0x02005EAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _02005F10 ; =0x022A3554
	mov r7, #0
	cmp r7, #2
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, r7
	mov r4, r7
	b _02005F04
_02005ECC:
	strh r5, [r6, #0x1e]
	ldrh r1, [r6, #0x1e]
	mov r0, r7
	strh r1, [r6, #0x12]
	bl sub_02006220
	strh r4, [r6, #0x3c]
	ldrh r1, [r6, #0x3c]
	mov r0, r7
	strh r1, [r6, #0x2c]
	bl sub_020062C8
	mov r0, r7
	bl sub_020063A0
	add r7, r7, #1
	add r6, r6, #0x44
_02005F04:
	cmp r7, #2
	blt _02005ECC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02005F10: .word 0x022A3554
	arm_func_end sub_02005EAC

	arm_func_start sub_02005F14
sub_02005F14: ; 0x02005F14
	mov r2, #0
	stmia r0, {r1, r2}
	ldr r1, _02005F2C ; =0x00002FFF
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_02005F2C: .word 0x00002FFF
	arm_func_end sub_02005F14

	arm_func_start sub_02005F30
sub_02005F30: ; 0x02005F30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02005F80 ; =0x022A3554
	mov r5, r0
	mov r0, #0x44
	mla r4, r5, r0, r2
	mov r0, r4
	bl sub_02005F14
	mov r1, #0
	strh r1, [r4, #0x1e]
	mov r0, r5
	strh r1, [r4, #0x12]
	bl sub_02006220
	mov r1, #0
	strh r1, [r4, #0x3c]
	mov r0, r5
	strh r1, [r4, #0x2c]
	bl sub_020062C8
	mov r0, r5
	bl sub_020063A0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02005F80: .word 0x022A3554
	arm_func_end sub_02005F30

	arm_func_start sub_02005F84
sub_02005F84: ; 0x02005F84
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200601C ; =0x022A353C
	movs r5, r0
	mov r0, #0xc
	mla r4, r5, r0, r1
	movne r6, #0
	bne _02005FCC
	ldr r1, _02006020 ; =0x04000130
	ldr r0, _02006024 ; =0x027FFFA8
	ldrh r3, [r1]
	ldrh r2, [r0]
	ldr r0, _02006028 ; =0x00002FFF
	ldr r1, _0200602C ; =0x022A3538
	orr r2, r3, r2
	eor r2, r2, r0
	and r0, r2, r0
	strh r0, [r1]
	mov r6, #2
_02005FCC:
	ldr r0, [r4]
	cmp r6, r0
	beq _02005FF0
	mov r0, r4
	mov r1, r6
	bl sub_02005F14
	mov r0, r5
	mov r1, r6
	bl sub_02005F30
_02005FF0:
	ldr r1, _0200602C ; =0x022A3538
	mov r0, r6
	ldrh r2, [r1]
	strh r2, [r4, #8]
	ldrh r1, [r4, #0xa]
	and r1, r1, r2
	strh r1, [r4, #0xa]
	ldr r1, [r4, #4]
	add r1, r1, #1
	str r1, [r4, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200601C: .word 0x022A353C
_02006020: .word 0x04000130
_02006024: .word 0x027FFFA8
_02006028: .word 0x00002FFF
_0200602C: .word 0x022A3538
	arm_func_end sub_02005F84

	arm_func_start sub_02006030
sub_02006030: ; 0x02006030
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200608C ; =0x020AF264
	bl sub_02002CB4
	mov r7, #0
	ldr r5, _02006090 ; =0x022A353C
	ldr r6, _02006094 ; =0x022A3554
	mov r4, r7
_0200604C:
	mov r0, r7
	bl sub_02005F84
	cmp r0, #0
	streq r4, [r6]
	beq _0200606C
	cmp r0, #1
	ldmneia r5, {r0, r1, r2}
	stmneia r6, {r0, r1, r2}
_0200606C:
	add r7, r7, #1
	cmp r7, #2
	add r5, r5, #0xc
	add r6, r6, #0x44
	blt _0200604C
	ldr r0, _0200608C ; =0x020AF264
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200608C: .word 0x020AF264
_02006090: .word 0x022A353C
_02006094: .word 0x022A3554
	arm_func_end sub_02006030

	arm_func_start sub_02006098
sub_02006098: ; 0x02006098
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020061D8 ; =0x020AF264
	bl sub_02002CB4
	mov r6, #0
	ldr r4, _020061DC ; =0x022A353C
	ldr r5, _020061E0 ; =0x022A3554
	ldr sb, _020061E4 ; =0x00002FFF
	ldr r7, _020061E8 ; =0x00000F0F
	mov lr, #1
	mov ip, r6
	mov r3, r6
	mov r8, r6
_020060C8:
	ldmia r4, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	ldr r0, [r4]
	cmp r0, #0
	beq _020061B8
	ldrh r1, [r5, #0x14]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #8]
	strh r0, [r5, #0x12]
	strb lr, [r5, #0x10]
	ldrh r0, [r5, #0xa]
	ldrh r1, [r5, #0x20]
	orr r0, r0, #0xf0
	and r0, r1, r0
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #8]
	strh r0, [r5, #0x1e]
	strb lr, [r5, #0x1c]
	ldrh r1, [r5, #0x2e]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #8]
	and r0, r0, r7
	strh r0, [r5, #0x2c]
	strb lr, [r5, #0x24]
	ldrh r1, [r5, #0x3e]
	ldrh r0, [r5, #0xa]
	and r0, r1, r0
	strh r0, [r5, #0x3e]
	ldrh r0, [r5, #8]
	and r0, r0, #0xf0
	strh r0, [r5, #0x3c]
	strb lr, [r5, #0x34]
	ldrh r0, [r5, #0x2c]
	cmp r0, #0
	streqb ip, [r5, #0x25]
	streq ip, [r5, #0x28]
	beq _02006184
	ldrb r0, [r5, #0x25]
	cmp r0, #0
	ldreq r1, [r5, #0x28]
	ldreq r0, [r4, #4]
	subeq r0, r1, r0
	streq r0, [r5, #0x28]
_02006184:
	ldrh r0, [r5, #0x3c]
	cmp r0, #0
	streqb r3, [r5, #0x35]
	streq r3, [r5, #0x38]
	beq _020061B0
	ldrb r0, [r5, #0x35]
	cmp r0, #0
	ldreq r1, [r5, #0x38]
	ldreq r0, [r4, #4]
	subeq r0, r1, r0
	streq r0, [r5, #0x38]
_020061B0:
	strh sb, [r4, #0xa]
	str r8, [r4, #4]
_020061B8:
	add r6, r6, #1
	cmp r6, #2
	add r4, r4, #0xc
	add r5, r5, #0x44
	blt _020060C8
	ldr r0, _020061D8 ; =0x020AF264
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020061D8: .word 0x020AF264
_020061DC: .word 0x022A353C
_020061E0: .word 0x022A3554
_020061E4: .word 0x00002FFF
_020061E8: .word 0x00000F0F
	arm_func_end sub_02006098

	arm_func_start GetHeldButtons
GetHeldButtons: ; 0x020061EC
	mov r2, #0x44
	mul r2, r0, r2
	ldr r3, _0200621C ; =0x022A3554
	add r0, r3, r2
	ldrh r0, [r0, #8]
	strh r0, [r1]
	ldr r0, [r3, r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200621C: .word 0x022A3554
	arm_func_end GetHeldButtons

	arm_func_start sub_02006220
sub_02006220: ; 0x02006220
	ldr r2, _02006258 ; =0x022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	str r0, [r2, #0xc]
	strb r1, [r2, #0x1c]
	strb r1, [r2, #0x10]
	strh r1, [r2, #0x22]
	strh r1, [r2, #0x16]
	ldrh r0, [r2, #0x12]
	strh r0, [r2, #0x14]
	ldrh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	bx lr
	.align 2, 0
_02006258: .word 0x022A3554
	arm_func_end sub_02006220

	arm_func_start GetPressedButtons
GetPressedButtons: ; 0x0200625C
	ldr r3, _020062C0 ; =0x022A3554
	mov r2, #0x44
	mla ip, r0, r2, r3
	ldrb r0, [ip, #0x10]
	cmp r0, #0
	beq _020062A0
	mov r0, #0
	strb r0, [ip, #0x10]
	ldrh r3, [ip, #0x12]
	ldrh r2, [ip, #0x14]
	ldr r0, _020062C4 ; =0x00002FFF
	and r2, r3, r2
	eor r0, r2, r0
	and r0, r3, r0
	strh r0, [ip, #0x16]
	ldrh r0, [ip, #0x12]
	strh r0, [ip, #0x14]
_020062A0:
	ldrh r0, [ip, #0x16]
	strh r0, [r1]
	ldr r0, [ip]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020062C0: .word 0x022A3554
_020062C4: .word 0x00002FFF
	arm_func_end GetPressedButtons

	arm_func_start sub_020062C8
sub_020062C8: ; 0x020062C8
	ldr r2, _020062F8 ; =0x022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	strb r1, [r2, #0x24]
	mov r0, #1
	strb r0, [r2, #0x25]
	str r0, [r2, #0x28]
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	strh r1, [r2, #0x30]
	bx lr
	.align 2, 0
_020062F8: .word 0x022A3554
	arm_func_end sub_020062C8

	arm_func_start sub_020062FC
sub_020062FC: ; 0x020062FC
	stmdb sp!, {r3, lr}
	ldr r3, _02006398 ; =0x022A3554
	mov r2, #0x44
	mla r2, r0, r2, r3
	ldrb r0, [r2, #0x24]
	cmp r0, #0
	beq _02006378
	mov lr, #0
	strb lr, [r2, #0x24]
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x30]
	ldrh ip, [r2, #0x2e]
	cmp ip, #0
	beq _02006368
	ldr r0, _0200639C ; =0x00002FFF
	ldrh r3, [r2, #0x2c]
	eor r0, ip, r0
	tst r0, r3
	movne r0, #0x1e
	strne r0, [r2, #0x28]
	bne _02006370
	ldr r0, [r2, #0x28]
	cmp r0, #0
	movle r0, #6
	strle r0, [r2, #0x28]
	strgth lr, [r2, #0x30]
	b _02006370
_02006368:
	mov r0, #0x1e
	str r0, [r2, #0x28]
_02006370:
	ldrh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
_02006378:
	ldrh r0, [r2, #0x30]
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006398: .word 0x022A3554
_0200639C: .word 0x00002FFF
	arm_func_end sub_020062FC

	arm_func_start sub_020063A0
sub_020063A0: ; 0x020063A0
	ldr r2, _020063D0 ; =0x022A3554
	mov r1, #0x44
	mla r2, r0, r1, r2
	mov r1, #0
	strb r1, [r2, #0x34]
	mov r0, #1
	strb r0, [r2, #0x35]
	str r0, [r2, #0x38]
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	strh r1, [r2, #0x40]
	bx lr
	.align 2, 0
_020063D0: .word 0x022A3554
	arm_func_end sub_020063A0

	arm_func_start sub_020063D4
sub_020063D4: ; 0x020063D4
	ldr r2, _020063F0 ; =0x022A3554
	mov r1, #0x44
	mla r1, r0, r1, r2
	mov r0, #1
	strb r0, [r1, #0x35]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020063F0: .word 0x022A3554
	arm_func_end sub_020063D4

	arm_func_start sub_020063F4
sub_020063F4: ; 0x020063F4
	stmdb sp!, {r3, lr}
	ldr r3, _02006490 ; =0x022A3554
	mov r2, #0x44
	mla r2, r0, r2, r3
	ldrb r0, [r2, #0x34]
	cmp r0, #0
	beq _02006470
	mov lr, #0
	strb lr, [r2, #0x34]
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x40]
	ldrh ip, [r2, #0x3e]
	cmp ip, #0
	beq _02006460
	ldr r0, _02006494 ; =0x00002FFF
	ldrh r3, [r2, #0x3c]
	eor r0, ip, r0
	tst r0, r3
	movne r0, #6
	strne r0, [r2, #0x38]
	bne _02006468
	ldr r0, [r2, #0x38]
	cmp r0, #0
	movle r0, #6
	strle r0, [r2, #0x38]
	strgth lr, [r2, #0x40]
	b _02006468
_02006460:
	mov r0, #0x1e
	str r0, [r2, #0x38]
_02006468:
	ldrh r0, [r2, #0x3c]
	strh r0, [r2, #0x3e]
_02006470:
	ldrh r0, [r2, #0x40]
	strh r0, [r1]
	ldr r0, [r2]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006490: .word 0x022A3554
_02006494: .word 0x00002FFF
	arm_func_end sub_020063F4

	arm_func_start sub_02006498
sub_02006498: ; 0x02006498
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r6, r0
	bl GetPressedButtons
	ldrh r2, [r5]
	ldr r1, _02006500 ; =0x00000F0F
	mov r4, r0
	and r0, r2, r1
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #0
	beq _020064D8
	mov r0, r6
	bl sub_020063A0
	b _020064F4
_020064D8:
	add r1, sp, #0
	mov r0, r6
	bl sub_020063F4
	ldrh r1, [r5]
	ldrh r0, [sp]
	orr r0, r1, r0
	strh r0, [r5]
_020064F4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02006500: .word 0x00000F0F
	arm_func_end sub_02006498

	arm_func_start sub_02006504
sub_02006504: ; 0x02006504
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	bl sub_020811EC
	add r0, sp, #0
	bl sub_02081264
	cmp r0, #0
	beq _02006528
	add r0, sp, #0
	bl sub_020812F8
_02006528:
	ldr r0, _0200655C ; =0x020AF288
	bl sub_02002C40
	ldr r0, _0200655C ; =0x020AF288
	mov r1, #8
	bl sub_02002CAC
	bl sub_02006564
	ldr r0, _02006560 ; =0x022A35E8
	bl sub_02006B54
	ldr r0, _0200655C ; =0x020AF288
	bl sub_02002E98
	bl sub_020065AC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200655C: .word 0x020AF288
_02006560: .word 0x022A35E8
	arm_func_end sub_02006504

	arm_func_start sub_02006564
sub_02006564: ; 0x02006564
	ldr r0, _020065A4 ; =0x022A35DC
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r2, #0
	strb r2, [r0, #8]
	ldr r3, _020065A8 ; =0x022A3614
	mov r0, r2
_02006584:
	str r1, [r3]
	str r1, [r3, #4]
	add r2, r2, #1
	strb r0, [r3, #8]
	cmp r2, #4
	add r3, r3, #0xc
	blt _02006584
	bx lr
	.align 2, 0
_020065A4: .word 0x022A35DC
_020065A8: .word 0x022A3614
	arm_func_end sub_02006564

	arm_func_start sub_020065AC
sub_020065AC: ; 0x020065AC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	bl sub_02081420
	add r0, sp, #0x20
	bl sub_02081500
	cmp r0, #0
	bne _02006B34
	ldr r0, _02006B3C ; =0x020AF288
	bl sub_02002CB4
	ldr ip, _02006B40 ; =0x022A362C
	mov lr, #2
_020065D8:
	add r3, ip, #0xc
	ldmia ip, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	subs lr, lr, #1
	sub ip, ip, #0xc
	bpl _020065D8
	ldrh r1, [sp, #0x26]
	ldr r0, _02006B44 ; =0x022A35DC
	tst r1, #1
	mvnne r2, #0
	ldreqh r2, [sp, #0x20]
	tst r1, #2
	ldrh r1, [sp, #0x24]
	str r2, [r0, #0x38]
	mvnne r2, #0
	ldreqh r2, [sp, #0x22]
	ldr r0, _02006B44 ; =0x022A35DC
	cmp r1, #1
	str r2, [r0, #0x3c]
	moveq r1, #1
	movne r1, #0
	ldr r0, _02006B44 ; =0x022A35DC
	tst r1, #0xff
	strb r1, [r0, #0x40]
	ldreqb r1, [r0, #0x4c]
	cmpeq r1, #0
	beq _020066FC
	ldr r0, _02006B48 ; =0x022A3614
	add r3, sp, #0x34
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r4, #1
	ldr lr, _02006B4C ; =0x022A3620
	mov r2, r4
	mov r3, #0
	mov r0, r4
	b _020066B4
_0200666C:
	ldrb r1, [lr, #8]
	cmp r1, #0
	beq _020066AC
	ldr r1, [sp, #0x34]
	mov ip, r3
	cmp r1, #0
	ldrlt r1, [lr]
	movlt ip, r2
	strlt r1, [sp, #0x34]
	ldr r1, [sp, #0x38]
	cmp r1, #0
	ldrlt r1, [lr, #4]
	movlt ip, r0
	strlt r1, [sp, #0x38]
	cmp ip, #0
	beq _020066BC
_020066AC:
	add r4, r4, #1
	add lr, lr, #0xc
_020066B4:
	cmp r4, #4
	blt _0200666C
_020066BC:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ldrge r0, [sp, #0x38]
	cmpge r0, #0
	addge r0, sp, #0x34
	ldrge r3, _02006B50 ; =0x022A35DC
	ldmgeia r0, {r0, r1, r2}
	stmgeia r3, {r0, r1, r2}
	bge _02006710
	ldr r0, _02006B44 ; =0x022A35DC
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r1, #0
	strb r1, [r0, #8]
	b _02006710
_020066FC:
	mvn r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	mov r1, #0
	strb r1, [r0, #8]
_02006710:
	ldr r0, _02006B50 ; =0x022A35DC
	add r3, sp, #0x28
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r3, [sp, #0x28]
	ldr r0, _02006B44 ; =0x022A35DC
	ldr r2, [sp, #0x2c]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldrh r1, [r0, #0xe]
	tst r1, #1
	beq _02006760
	ldrb r1, [sp, #0x30]
	cmp r1, #0
	strne r3, [r0, #0x20]
	strne r2, [r0, #0x24]
	movne r1, #1
	strneh r1, [r0, #0xe]
	moveq r1, #4
	b _0200677C
_02006760:
	ldrb r1, [sp, #0x30]
	cmp r1, #0
	strne r3, [r0, #0x20]
	strne r2, [r0, #0x24]
	movne r1, #3
	strneh r1, [r0, #0xe]
	moveq r1, #0
_0200677C:
	streqh r1, [r0, #0xe]
	ldr r1, _02006B44 ; =0x022A35DC
	ldrh ip, [r1, #0xc]
	cmp ip, #6
	addls pc, pc, ip, lsl #2
	b _02006B2C
_02006794: ; jump table
	b _020067B0 ; case 0
	b _020067FC ; case 1
	b _020068B0 ; case 2
	b _02006988 ; case 3
	b _02006A84 ; case 4
	b _02006A84 ; case 5
	b _02006AF8 ; case 6
_020067B0:
	ldrh lr, [r1, #0xe]
	mov r0, #0
	tst lr, #1
	streq r0, [r1, #0x10]
	ldreq r0, [r1, #0x14]
	addeq r0, r0, #1
	streq r0, [r1, #0x14]
	beq _02006B2C
	mov ip, #1
	str ip, [r1, #0x10]
	str r0, [r1, #0x14]
	ldr r3, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	orr r0, lr, #0x40
	str r3, [r1, #0x28]
	str r2, [r1, #0x2c]
	strh r0, [r1, #0xe]
	strh ip, [r1, #0xc]
	b _02006B2C
_020067FC:
	ldrh r3, [r1, #0xe]
	mov r0, #0
	tst r3, #1
	beq _02006890
	ldr r2, [r1, #0x10]
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	orr r0, r3, #0x40
	strh r0, [r1, #0xe]
	cmp r2, #0xc
	ble _02006B2C
	ldr r3, [sp, #0x28]
	ldr r0, [r1, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r1, [r1, #0x2c]
	sub r0, r3, r0
	sub r1, r2, r1
	str r0, [sp]
	str r1, [sp, #4]
	bl Abs
	cmp r0, #8
	bge _02006874
	ldr r0, [sp, #4]
	bl Abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =0x022A35DC
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x400
	strlth r1, [r0, #0xe]
_02006874:
	ldr r0, _02006B44 ; =0x022A35DC
	mov r1, #4
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x2000
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006890:
	str r0, [r1, #0x10]
	mov r0, #1
	str r0, [r1, #0x14]
	orr r0, r3, #8
	strh r0, [r1, #0xe]
	mov r0, #2
	strh r0, [r1, #0xc]
	b _02006B2C
_020068B0:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006960
	ldr lr, [sp, #0x28]
	ldr r0, [r1, #0x28]
	ldr ip, [sp, #0x2c]
	ldr r3, [r1, #0x2c]
	mov r2, #1
	sub r0, lr, r0
	sub r3, ip, r3
	str r2, [r1, #0x10]
	mov r2, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r2, [r1, #0x14]
	bl Abs
	cmp r0, #8
	bge _02006934
	ldr r0, [sp, #0xc]
	bl Abs
	cmp r0, #8
	bge _02006934
	ldr r0, _02006B44 ; =0x022A35DC
	mov r1, #3
	ldr r3, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	str r3, [r0, #0x30]
	str r2, [r0, #0x34]
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x80
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006934:
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r0, _02006B44 ; =0x022A35DC
	mov r1, #1
	str r3, [r0, #0x28]
	str r2, [r0, #0x2c]
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x40
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006960:
	mov r2, #0
	str r2, [r1, #0x10]
	ldr r0, [r1, #0x14]
	add r0, r0, #1
	str r0, [r1, #0x14]
	cmp r0, #0xc
	orrgt r0, r3, #0x10
	strgth r0, [r1, #0xe]
	strgth r2, [r1, #0xc]
	b _02006B2C
_02006988:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006A1C
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	orr r0, r3, #0x80
	strh r0, [r1, #0xe]
	cmp r2, #0xc
	ble _02006B2C
	ldr r3, [sp, #0x28]
	ldr r0, [r1, #0x30]
	ldr r2, [sp, #0x2c]
	ldr r1, [r1, #0x34]
	sub r0, r3, r0
	sub r1, r2, r1
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	bl Abs
	cmp r0, #8
	bge _02006A00
	ldr r0, [sp, #0x14]
	bl Abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =0x022A35DC
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x800
	strlth r1, [r0, #0xe]
_02006A00:
	ldr r0, _02006B44 ; =0x022A35DC
	mov r1, #5
	ldrh r2, [r0, #0xe]
	orr r2, r2, #0x4000
	strh r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	b _02006B2C
_02006A1C:
	ldr lr, [r1, #0x20]
	ldr r0, [r1, #0x28]
	ldr ip, [r1, #0x24]
	ldr r3, [r1, #0x2c]
	mov r2, #0
	sub r0, lr, r0
	sub r3, ip, r3
	str r2, [r1, #0x10]
	mov r2, #1
	str r0, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r2, [r1, #0x14]
	bl Abs
	cmp r0, #8
	bge _02006A74
	ldr r0, [sp, #0x1c]
	bl Abs
	cmp r0, #8
	ldrlt r0, _02006B44 ; =0x022A35DC
	ldrlth r1, [r0, #0xe]
	orrlt r1, r1, #0x20
	strlth r1, [r0, #0xe]
_02006A74:
	ldr r0, _02006B44 ; =0x022A35DC
	mov r1, #0
	strh r1, [r0, #0xc]
	b _02006B2C
_02006A84:
	ldrh r3, [r1, #0xe]
	tst r3, #1
	beq _02006AE0
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
	cmp ip, #4
	orreq r0, r3, #0x140
	orrne r0, r3, #0x280
	strh r0, [r1, #0xe]
	ldr r0, _02006B44 ; =0x022A35DC
	ldr r1, [r0, #0x10]
	cmp r1, #0x3c
	ldrgth r1, [r0, #0xe]
	orrgt r1, r1, #0x1000
	strgth r1, [r0, #0xe]
	bgt _02006B2C
	ldreqh r1, [r0, #0xe]
	orreq r1, r1, #0x9000
	streqh r1, [r0, #0xe]
	b _02006B2C
_02006AE0:
	mov r2, #0
	str r2, [r1, #0x10]
	mov r0, #1
	str r0, [r1, #0x14]
	strh r2, [r1, #0xc]
	b _02006B2C
_02006AF8:
	ldrh r0, [r1, #0xe]
	tst r0, #1
	moveq r2, #0
	streq r2, [r1, #0x10]
	moveq r0, #1
	streq r0, [r1, #0x14]
	streqh r2, [r1, #0xc]
	beq _02006B2C
	ldr r2, [r1, #0x10]
	mov r0, #0
	add r2, r2, #1
	str r2, [r1, #0x10]
	str r0, [r1, #0x14]
_02006B2C:
	ldr r0, _02006B3C ; =0x020AF288
	bl sub_02002E98
_02006B34:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02006B3C: .word 0x020AF288
_02006B40: .word 0x022A362C
_02006B44: .word 0x022A35DC
_02006B48: .word 0x022A3614
_02006B4C: .word 0x022A3620
_02006B50: .word 0x022A35DC
	arm_func_end sub_020065AC

	arm_func_start sub_02006B54
sub_02006B54: ; 0x02006B54
	mov r1, #6
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_02006B54

	arm_func_start sub_02006B70
sub_02006B70: ; 0x02006B70
	stmdb sp!, {r3, lr}
	ldr r0, _02006B90 ; =0x020AF288
	bl sub_02002CB4
	ldr r0, _02006B94 ; =0x022A35E8
	bl sub_02006B54
	ldr r0, _02006B90 ; =0x020AF288
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006B90: .word 0x020AF288
_02006B94: .word 0x022A35E8
	arm_func_end sub_02006B70

	arm_func_start sub_02006B98
sub_02006B98: ; 0x02006B98
	stmdb sp!, {r3, lr}
	ldr r0, _02006BEC ; =0x020AF288
	bl sub_02002CB4
	ldr r0, _02006BF0 ; =0x022A35DC
	ldrb r1, [r0, #8]
	cmp r1, #0
	beq _02006BD8
	mov r2, #4
	ldr r1, _02006BF4 ; =0x00001101
	strh r2, [r0, #0xc]
	strh r1, [r0, #0xe]
	mov r1, #0x3d
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0x14]
	b _02006BE0
_02006BD8:
	ldr r0, _02006BF8 ; =0x022A35E8
	bl sub_02006B54
_02006BE0:
	ldr r0, _02006BEC ; =0x020AF288
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006BEC: .word 0x020AF288
_02006BF0: .word 0x022A35DC
_02006BF4: .word 0x00001101
_02006BF8: .word 0x022A35E8
	arm_func_end sub_02006B98

	arm_func_start sub_02006BFC
sub_02006BFC: ; 0x02006BFC
	mov r1, #0
	strh r1, [r0]
	sub r1, r1, #1
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02006BFC

	arm_func_start GetReleasedStylus
GetReleasedStylus: ; 0x02006C1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02006C84 ; =0x020AF288
	bl sub_02002CB4
	ldr r1, _02006C88 ; =0x022A35DC
	ldr r0, _02006C84 ; =0x020AF288
	ldrh r2, [r1, #0xe]
	strh r2, [r4]
	ldr r3, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	str r3, [r4, #4]
	str r2, [r4, #8]
	ldr r3, [r1, #0x20]
	ldr r2, [r1, #0x24]
	str r3, [r4, #0xc]
	str r2, [r4, #0x10]
	ldr r3, [r1, #0x28]
	ldr r2, [r1, #0x2c]
	str r3, [r4, #0x14]
	str r2, [r4, #0x18]
	ldr r2, [r1, #0x30]
	ldr r1, [r1, #0x34]
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02006C84: .word 0x020AF288
_02006C88: .word 0x022A35DC
	arm_func_end GetReleasedStylus

	arm_func_start sub_02006C8C
sub_02006C8C: ; 0x02006C8C
	ldrh ip, [r0]
	ldr r3, _02006D44 ; =0x00001CFA
	and ip, r1, ip
	tst ip, r3
	beq _02006CE8
	cmp r2, #0
	moveq r0, #1
	bxeq lr
	ldr r3, [r0, #0x14]
	ldr r1, [r2, #8]
	cmp r3, r1
	blt _02006CE8
	ldr r1, [r2, #0xc]
	cmp r3, r1
	bgt _02006CE8
	ldr r3, [r0, #0x18]
	ldr r1, [r2]
	cmp r3, r1
	blt _02006CE8
	ldr r1, [r2, #4]
	cmp r3, r1
	movle r0, #1
	bxle lr
_02006CE8:
	ldr r1, _02006D48 ; =0x00000301
	tst ip, r1
	beq _02006D3C
	cmp r2, #0
	moveq r0, #1
	bxeq lr
	ldr r3, [r0, #0xc]
	ldr r1, [r2, #8]
	cmp r3, r1
	blt _02006D3C
	ldr r1, [r2, #0xc]
	cmp r3, r1
	bgt _02006D3C
	ldr r1, [r0, #0x10]
	ldr r0, [r2]
	cmp r1, r0
	blt _02006D3C
	ldr r0, [r2, #4]
	cmp r1, r0
	movle r0, #1
	bxle lr
_02006D3C:
	mov r0, #0
	bx lr
	.align 2, 0
_02006D44: .word 0x00001CFA
_02006D48: .word 0x00000301
	arm_func_end sub_02006C8C

	arm_func_start sub_02006D4C
sub_02006D4C: ; 0x02006D4C
	stmdb sp!, {r3, lr}
	ldr r0, _02006D9C ; =0x022A3644
	mov r3, #0
	strb r3, [r0, #2]
	strb r3, [r0, #1]
	strb r3, [r0]
	str r3, [r0, #0x10]
	str r3, [r0, #0xc]
	mov r1, #1
	strb r1, [r0, #9]
	ldr r1, _02006DA0 ; =0x022A3644
	mov r2, r3
_02006D7C:
	add r0, r1, r3
	add r3, r3, #1
	strb r2, [r0, #3]
	cmp r3, #6
	blt _02006D7C
	bl sub_02005E40
	bl sub_02006504
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006D9C: .word 0x022A3644
_02006DA0: .word 0x022A3644
	arm_func_end sub_02006D4C

	arm_func_start KeyWaitInit__02006DA4
KeyWaitInit__02006DA4: ; 0x02006DA4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	bl sub_02006B70
	ldmia sp!, {r3, pc}
	arm_func_end KeyWaitInit__02006DA4

	arm_func_start sub_02006DC8
sub_02006DC8: ; 0x02006DC8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	bl sub_02006B98
	ldmia sp!, {r3, pc}
	arm_func_end sub_02006DC8

	arm_func_start sub_02006DEC
sub_02006DEC: ; 0x02006DEC
	stmdb sp!, {r3, lr}
	bl sub_02006030
	bl sub_020065AC
	ldr r0, _02006E10 ; =0x020AF2AC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02006E10: .word 0x020AF2AC
	arm_func_end sub_02006DEC

	arm_func_start sub_02006E14
sub_02006E14: ; 0x02006E14
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r1, sp, #0
	mov r0, #0
	bl GetHeldButtons
	movs r3, #0
	mov r4, r3
	bne _02006E8C
	mov r2, #4
	ldr r1, _02006EBC ; =0x022A3644
	b _02006E6C
_02006E40:
	add r0, r1, r2
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02006E68
	ldr r0, _02006EC0 ; =0x022A3644
	mov r4, r2
	ldr r0, [r0, #0x10]
	cmp r0, r2
	movne r3, #1
	b _02006E74
_02006E68:
	add r2, r2, #1
_02006E6C:
	cmp r2, #5
	ble _02006E40
_02006E74:
	cmp r4, #0
	bne _02006E8C
	ldr r0, _02006EC0 ; =0x022A3644
	ldr r0, [r0, #0x10]
	cmp r0, #0
	movne r3, #1
_02006E8C:
	cmp r3, #0
	beq _02006EAC
	mov r0, #0
	bl sub_02006220
	mov r0, #0
	bl sub_020062C8
	mov r0, #0
	bl sub_020063A0
_02006EAC:
	ldr r0, _02006EC0 ; =0x022A3644
	str r4, [r0, #0x10]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02006EBC: .word 0x022A3644
_02006EC0: .word 0x022A3644
	arm_func_end sub_02006E14

	arm_func_start sub_02006EC4
sub_02006EC4: ; 0x02006EC4
	ldr r1, _02006ED0 ; =0x020AF2AC
	str r0, [r1]
	bx lr
	.align 2, 0
_02006ED0: .word 0x020AF2AC
	arm_func_end sub_02006EC4

	arm_func_start sub_02006ED4
sub_02006ED4: ; 0x02006ED4
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	stmib r0, {r1, r2}
	strb r2, [r0, #0xc]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
	bx lr
	arm_func_end sub_02006ED4

	arm_func_start sub_02006EF8
sub_02006EF8: ; 0x02006EF8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	bl sub_0208266C
	add r0, sp, #0x20
	bl sub_02006F68
	add r0, sp, #0x20
	add r1, sp, #0
	ldr r4, _02006F34 ; =0x0209277C
	bl sub_02006FB8
	ldr r0, _02006F38 ; =0x0209278C
	add r2, sp, #0
	mov r1, r4
	bl DebugPrint0__0200C1FC
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02006F34: .word 0x0209277C
_02006F38: .word 0x0209278C
	arm_func_end sub_02006EF8

	arm_func_start sub_02006F3C
sub_02006F3C: ; 0x02006F3C
	str r1, [r0, #0x18]
	str r2, [r0, #0x14]
	ldr r1, [sp]
	str r3, [r0, #0x10]
	str r1, [r0, #0xc]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	stmib r0, {r1, r2}
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_02006F3C

	arm_func_start sub_02006F68
sub_02006F68: ; 0x02006F68
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x28
	mov r4, r0
	add r0, sp, #0x18
	add r1, sp, #0xc
	bl sub_020828A8
	ldr r1, [sp, #0xc]
	mov r0, r4
	str r1, [sp]
	ldr r1, [sp, #0x10]
	str r1, [sp, #4]
	ldr r1, [sp, #0x14]
	str r1, [sp, #8]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r1, r1, #0x7d0
	bl sub_02006F3C
	add sp, sp, #0x28
	ldmia sp!, {r4, pc}
	arm_func_end sub_02006F68

	arm_func_start sub_02006FB8
sub_02006FB8: ; 0x02006FB8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r3, r0
	ldr r2, [r3, #0x10]
	mov r0, r1
	str r2, [sp]
	ldr r2, [r3, #0xc]
	ldr r1, _02007000 ; =0x02092798
	str r2, [sp, #4]
	ldr r2, [r3, #8]
	str r2, [sp, #8]
	ldr r2, [r3, #4]
	str r2, [sp, #0xc]
	ldr r2, [r3, #0x18]
	ldr r3, [r3, #0x14]
	bl Sprintf
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02007000: .word 0x02092798
	arm_func_end sub_02006FB8

	arm_func_start sub_02007004
sub_02007004: ; 0x02007004
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	beq _02007060
	mov r1, #0x3a
	bl sub_02002368
	movs r4, r0
	beq _02007044
	sub r5, r4, r6
	ldr r0, _02007074 ; =0x020AF2B8
	mov r1, r6
	mov r2, r5
	bl Strncpy
	ldr r0, _02007074 ; =0x020AF2B8
	mov r1, #0
	strb r1, [r0, r5]
	add r6, r4, #1
_02007044:
	ldrsb r0, [r6]
	cmp r0, #0
	beq _02007060
	ldr r0, _02007078 ; =0x020AF2C4
	ldr r1, _0200707C ; =0x020927B8
	mov r2, r6
	bl Sprintf
_02007060:
	ldr r0, _02007080 ; =0x020927BC
	ldr r1, _02007074 ; =0x020AF2B8
	ldr r2, _02007078 ; =0x020AF2C4
	bl DebugPrint0__0200C1FC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02007074: .word 0x020AF2B8
_02007078: .word 0x020AF2C4
_0200707C: .word 0x020927B8
_02007080: .word 0x020927BC
	arm_func_end sub_02007004

	arm_func_start sub_02007084
sub_02007084: ; 0x02007084
	ldr r0, _0200708C ; =0x020AF2B8
	bx lr
	.align 2, 0
_0200708C: .word 0x020AF2B8
	arm_func_end sub_02007084

	arm_func_start sub_02007090
sub_02007090: ; 0x02007090
	ldr r0, _02007098 ; =0x020AF2C4
	bx lr
	.align 2, 0
_02007098: .word 0x020AF2C4
	arm_func_end sub_02007090

	arm_func_start sub_0200709C
sub_0200709C: ; 0x0200709C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r2
	mov r8, r0
	mov r7, r1
	mov r0, r6
	mov r1, #0x3a
	bl sub_02002368
	cmp r0, #0
	addne r4, r0, #1
	subne r5, r0, r6
	bne _020070D8
	mov r0, r6
	bl Strlen
	mov r5, r0
	add r4, r6, r5
_020070D8:
	sub r0, r5, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0x30
	blt _020070FC
	cmp r0, #0x39
	suble r0, r0, #0x30
	strle r0, [r7]
	suble r5, r5, #1
	ble _02007104
_020070FC:
	mov r0, #0
	str r0, [r7]
_02007104:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl Strncpy
	mov r1, #0
	mov r0, r4
	strb r1, [r8, r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200709C

	arm_func_start sub_02007124
sub_02007124: ; 0x02007124
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x100
	mov r4, r1
	mov sl, r0
	mov r0, r4
	mov r1, #0x3a
	bl sub_02002368
	cmp r0, #0
	add r0, sp, #0x80
	bne _02007160
	ldr r1, _0200724C ; =0x020927E4
	ldr r2, _02007250 ; =0x020AF2B8
	mov r3, r4
	bl Sprintf
	b _02007168
_02007160:
	mov r1, r4
	bl Strcpy
_02007168:
	add r0, sp, #0x80
	mov r1, #0x3a
	bl sub_02002368
	add r0, sp, #0x80
	bl sub_02007544
	add r2, sp, #0x80
	add r0, sl, #0xc
	add r1, sl, #4
	bl sub_0200709C
	mov r8, r0
	add r0, sl, #0xc
	bl sub_0200746C
	ldr r0, [r0]
	mov r1, r8
	str r0, [sl]
	add r0, sl, #0x6c
	bl Strcpy
	mov sb, #0
	strb sb, [sl, #0x5c]
	add r4, sl, #0x1c
	mov r6, sb
	add r7, sp, #0
	mov r5, #0xa
_020071C4:
	mov r1, r7
_020071C8:
	ldrsb r0, [r8]
	cmp r0, #0
	cmpne r0, #0x2f
	cmpne r0, #0x2e
	addne r8, r8, #1
	strneb r0, [r1], #1
	bne _020071C8
	strb r6, [r1]
	ldrsb r0, [r8]
	cmp r0, #0
	bne _02007204
	add r1, sp, #0
	add r0, sl, #0x5c
	bl Strcat
	b _02007240
_02007204:
	cmp r0, #0x2e
	bne _02007220
	mov r1, r7
	mov r2, r5
	add r0, sl, #0x5c
	bl sub_020023A8
	b _02007238
_02007220:
	cmp r0, #0x2f
	bne _02007238
	add r0, r4, sb, lsl #4
	mov r1, r7
	add sb, sb, #1
	bl Strcpy
_02007238:
	add r8, r8, #1
	b _020071C4
_02007240:
	str sb, [sl, #8]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0200724C: .word 0x020927E4
_02007250: .word 0x020AF2B8
	arm_func_end sub_02007124

	arm_func_start sub_02007254
sub_02007254: ; 0x02007254
	add r3, r0, #0x5c
	mov ip, #0
	b _02007278
_02007260:
	ldrsb r2, [r3]
	cmp r2, #0x20
	beq _02007280
	add r3, r3, #1
	strb r2, [r1], #1
	add ip, ip, #1
_02007278:
	cmp ip, #0xa
	blt _02007260
_02007280:
	ldrsb r2, [r0, #0x66]
	add r3, r0, #0x66
	cmp r2, #0
	beq _020072C0
	mov r0, #0x2e
	strb r0, [r1], #1
	mov r2, #0
	b _020072B8
_020072A0:
	ldrsb r0, [r3]
	cmp r0, #0x20
	beq _020072C0
	add r3, r3, #1
	strb r0, [r1], #1
	add r2, r2, #1
_020072B8:
	cmp r2, #5
	blt _020072A0
_020072C0:
	mov r0, #0
	strb r0, [r1]
	bx lr
	arm_func_end sub_02007254

	arm_func_start sub_020072CC
sub_020072CC: ; 0x020072CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #8]
	mov r7, r1
	cmp r0, #0
	ble _0200732C
	mov r0, r7
	add r1, r8, #0x1c
	bl Strcpy
	mov r6, #1
	add r4, r8, #0x1c
	ldr r5, _02007338 ; =0x020927EC
	b _0200731C
_02007300:
	mov r0, r7
	mov r1, r5
	bl Strcat
	mov r0, r7
	add r1, r4, r6, lsl #4
	bl Strcat
	add r6, r6, #1
_0200731C:
	ldr r0, [r8, #8]
	cmp r6, r0
	blt _02007300
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200732C:
	mov r0, #0
	strb r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007338: .word 0x020927EC
	arm_func_end sub_020072CC

	arm_func_start sub_0200733C
sub_0200733C: ; 0x0200733C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl sub_020072CC
	mov r0, r4
	bl Strlen
	mov r1, r0
	cmp r0, #0
	movgt r1, #0x2f
	strgtb r1, [r4, r0]
	addgt r1, r0, #1
	movgt r0, #0
	strgtb r0, [r4, r1]
	mov r0, r5
	add r1, r4, r1
	bl sub_02007254
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200733C

	arm_func_start sub_02007380
sub_02007380: ; 0x02007380
	bx lr
	arm_func_end sub_02007380

	arm_func_start sub_02007384
sub_02007384: ; 0x02007384
	stmdb sp!, {r3, lr}
	ldr r1, _020073A8 ; =0x020AF344
	mov r2, #0
	ldr r0, _020073AC ; =0x022A3670
	str r2, [r1]
	bl sub_0200844C
	ldr r0, _020073B0 ; =0x022A3658
	bl sub_0200846C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020073A8: .word 0x020AF344
_020073AC: .word 0x022A3670
_020073B0: .word 0x022A3658
	arm_func_end sub_02007384

	arm_func_start sub_020073B4
sub_020073B4: ; 0x020073B4
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	str r1, [r0, #0x14]
	sub r1, r1, #1
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_020073B4

	arm_func_start sub_020073D8
sub_020073D8: ; 0x020073D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r6, _02007464 ; =0x020AF354
	bl sub_02007084
	mov r1, r0
	add r0, sp, #0
	bl sub_020074DC
	mov r7, r0
	mov r5, #0xa
	ldr r4, _02007468 ; =0x02092844
	mov r8, #0
	b _02007450
_02007408:
	ldr r2, [r0, #4]
	mov r0, r5
	mov r1, r4
	bl DebugPrint
	ldr r2, [r6]
	ldr r0, [r7]
	ldr r1, [r2]
	cmp r1, r0
	bne _02007440
	bl sub_02007090
	ldr r1, [r6]
	ldr r1, [r1, #0xc]
	blx r1
	b _0200744C
_02007440:
	ldr r1, [r2, #0xc]
	mov r0, r8
	blx r1
_0200744C:
	add r6, r6, #4
_02007450:
	ldr r0, [r6]
	cmp r0, #0
	bne _02007408
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007464: .word 0x020AF354
_02007468: .word 0x02092844
	arm_func_end sub_020073D8

	arm_func_start sub_0200746C
sub_0200746C: ; 0x0200746C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, _020074B0 ; =0x020AF354
	b _02007498
_0200747C:
	ldr r1, [r5, #8]
	mov r0, r6
	bl Strcmp
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, pc}
	add r4, r4, #4
_02007498:
	ldr r5, [r4]
	cmp r5, #0
	bne _0200747C
	ldr r0, _020074B4 ; =0x020AF354
	ldr r0, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020074B0: .word 0x020AF354
_020074B4: .word 0x020AF354
	arm_func_end sub_0200746C

	arm_func_start sub_020074B8
sub_020074B8: ; 0x020074B8
	cmp r0, #0
	ldreq r0, _020074D4 ; =0x020AF354
	ldreq r0, [r0]
	ldrne r1, [r0]
	ldrne r0, _020074D8 ; =0x020AF354
	ldrne r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_020074D4: .word 0x020AF354
_020074D8: .word 0x020AF354
	arm_func_end sub_020074B8

	arm_func_start sub_020074DC
sub_020074DC: ; 0x020074DC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_0200709C
	ldr r5, _0200753C ; =0x020AF354
	add r4, sp, #0
	b _02007520
_02007504:
	ldr r1, [r6, #8]
	mov r0, r4
	bl Strcmp
	cmp r0, #0
	moveq r0, r6
	beq _02007534
	add r5, r5, #4
_02007520:
	ldr r6, [r5]
	cmp r6, #0
	bne _02007504
	ldr r0, _02007540 ; =0x020AF354
	ldr r0, [r0]
_02007534:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200753C: .word 0x020AF354
_02007540: .word 0x020AF354
	arm_func_end sub_020074DC

	arm_func_start sub_02007544
sub_02007544: ; 0x02007544
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02007570
	mov r0, r4
	blx r1
_02007570:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_02007544

	arm_func_start sub_02007578
sub_02007578: ; 0x02007578
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x90
	mov r4, r0
	add r0, sp, #4
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r2, [r0, #0x14]
	add r0, sp, #4
	mov r1, r4
	blx r2
	add sp, sp, #0x90
	ldmia sp!, {r4, pc}
	arm_func_end sub_02007578

	arm_func_start sub_020075B0
sub_020075B0: ; 0x020075B0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x90
	mov r4, r0
	add r0, sp, #4
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r4
	bl sub_020074DC
	ldr r2, [r0, #0x3c]
	add r0, sp, #4
	mov r1, r4
	blx r2
	add sp, sp, #0x90
	ldmia sp!, {r4, pc}
	arm_func_end sub_020075B0

	arm_func_start sub_020075E8
sub_020075E8: ; 0x020075E8
	ldr ip, _020075F0 ; =sub_02006ED4
	bx ip
	.align 2, 0
_020075F0: .word sub_02006ED4
	arm_func_end sub_020075E8

	arm_func_start sub_020075F4
sub_020075F4: ; 0x020075F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl DataTransferInit
	mov r0, #2
	str r0, [r5]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020075F4

	arm_func_start sub_02007624
sub_02007624: ; 0x02007624
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov r0, #0
	mov ip, r1
	str r0, [lr]
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	bl DataTransferStop
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02007624

	arm_func_start sub_02007654
sub_02007654: ; 0x02007654
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r6, r2
	mov r5, r0
	mov r4, r1
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r6
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x18]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02007654

	arm_func_start sub_020076E4
sub_020076E4: ; 0x020076E4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r6, r2
	mov r5, r0
	mov r4, r1
	bl sub_02006ED4
	add r0, sp, #0
	mov r1, r6
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x1c]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020076E4

	arm_func_start sub_02007774
sub_02007774: ; 0x02007774
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	ldr r1, [r0, #0x20]
	mov r0, r5
	blx r1
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	str r0, [r5]
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02007774

	arm_func_start sub_020077B8
sub_020077B8: ; 0x020077B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	mov r1, #0
	str r1, [r5, #0x14]
	mov r1, #1
	mov lr, r5
	mov ip, r4
	str r1, [r5, #0x18]
	mov r6, r0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r1, [r6, #0x24]
	mov r0, r5
	blx r1
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020077B8

	arm_func_start sub_0200781C
sub_0200781C: ; 0x0200781C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020074B8
	mov r1, #0
	mov lr, r5
	mov ip, r4
	str r1, [r5, #0x18]
	mov r6, r0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r1, [r6, #0x28]
	mov r0, r5
	blx r1
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200781C

	arm_func_start sub_02007878
sub_02007878: ; 0x02007878
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	bl sub_020074B8
	add r1, r7, #3
	bic r1, r1, #3
	mov r4, r0
	cmp r7, r1
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r5, #0
	mov fp, #0x40000
	b _0200792C
_020078B4:
	ldrb r0, [sb, #0xc]
	cmp r0, #0
	mvnne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r6, #0x40000
	movlt sl, r6
	movge sl, fp
	bl sub_0207A270
	ldr r3, [r4, #0x2c]
	mov r0, sb
	mov r1, r7
	mov r2, sl
	blx r3
	movs sl, r0
	mvnmi r0, #0
	ldmmiia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sb, #0x14]
	mov lr, sb
	add r0, r0, sl
	str r0, [sb, #0x14]
	mov ip, r8
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	cmp sl, #0x40000
	add r5, r5, sl
	sub r6, r6, sl
	add r7, r7, sl
	blt _02007934
_0200792C:
	cmp r6, #0
	bgt _020078B4
_02007934:
	ldrb r0, [sb, #0xc]
	cmp r0, #0
	mvnne r0, #0
	moveq r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02007878

	arm_func_start sub_02007948
sub_02007948: ; 0x02007948
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0
	mov lr, r7
	mov ip, r6
	str r0, [r7, #0x14]
	mov r5, r2
	mov r4, r3
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr sb, [sp, #0x20]
	ldr r8, [sp, #0x24]
	b _020079C8
_02007988:
	cmp r4, r8
	movlt r3, r4
	movge r3, r8
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_02007878
	cmp r0, #0
	mvnlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp sb, #0
	add r5, r5, r0
	sub r4, r4, r0
	beq _020079C8
	mov r0, sb
	bl sub_02002B50
_020079C8:
	cmp r4, #0
	bgt _02007988
	ldr r0, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02007948

	arm_func_start sub_020079D8
sub_020079D8: ; 0x020079D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r3, _02007A6C ; =0x020927FC
	mov r6, r2
	ldr r4, [r3, #0x2c]
	ldr ip, [r3, #0x28]
	ldr r2, [sp, #0x20]
	add r3, sp, #0
	mov r8, r0
	mov r7, r1
	str ip, [sp]
	str r4, [sp, #4]
	bl sub_020076E4
	cmp r0, #0
	beq _02007A60
	ldr r5, [r8, #0x10]
	mov r0, r8
	mov r1, r7
	bl sub_020077B8
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl sub_02007878
	mov r4, r0
	mov r0, r8
	mov r1, r7
	bl sub_0200781C
	mov r0, r8
	mov r1, r7
	bl sub_02007774
	cmp r5, r4
	moveq r0, r4
	beq _02007A64
_02007A60:
	mvn r0, #0
_02007A64:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007A6C: .word 0x020927FC
	arm_func_end sub_020079D8

	arm_func_start sub_02007A70
sub_02007A70: ; 0x02007A70
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r6, _02007B10 ; =0x020927FC
	mov r5, r2
	ldr ip, [r6, #0x24]
	ldr lr, [r6, #0x20]
	mov r4, r3
	ldr r2, [sp, #0x20]
	add r3, sp, #0
	mov r7, r0
	mov r6, r1
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_020076E4
	cmp r0, #0
	beq _02007B04
	ldr r8, [r7, #0x10]
	mov r0, r7
	cmp r4, r8
	movle r8, r4
	mov r1, r6
	bl sub_020077B8
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r8
	bl sub_02007878
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_0200781C
	mov r0, r7
	mov r1, r6
	bl sub_02007774
	cmp r8, r4
	moveq r0, r4
	beq _02007B08
_02007B04:
	mvn r0, #0
_02007B08:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02007B10: .word 0x020927FC
	arm_func_end sub_02007A70

	arm_func_start sub_02007B14
sub_02007B14: ; 0x02007B14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r3, _02007BC8 ; =0x020927FC
	mov r4, r2
	ldr ip, [r3, #0x1c]
	ldr lr, [r3, #0x18]
	ldr r2, [sp, #0x28]
	add r3, sp, #8
	mov r6, r0
	mov r5, r1
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	bl sub_020076E4
	cmp r0, #0
	beq _02007BBC
	ldr r0, [sp, #0x2c]
	ldr r7, [r6, #0x10]
	cmp r0, #0
	beq _02007B64
	bl sub_02002B50
_02007B64:
	mov r0, r6
	mov r1, r5
	bl sub_020077B8
	ldr r0, [sp, #0x2c]
	ldr ip, [sp, #0x30]
	str r0, [sp]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, r7
	str ip, [sp, #4]
	bl sub_02007948
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_0200781C
	mov r0, r6
	mov r1, r5
	bl sub_02007774
	cmp r7, r4
	moveq r0, r4
	beq _02007BC0
_02007BBC:
	mvn r0, #0
_02007BC0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02007BC8: .word 0x020927FC
	arm_func_end sub_02007B14

	arm_func_start sub_02007BCC
sub_02007BCC: ; 0x02007BCC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r4, _02007C9C ; =0x020927FC
	mov r5, r2
	ldr r8, [r4, #0x34]
	ldr r4, [r4, #0x30]
	add r6, sp, #0
	mov r2, r3
	mov r3, r6
	str r4, [sp]
	mov r7, r0
	mov r6, r1
	str r8, [sp, #4]
	mov r4, #0
	bl sub_020076E4
	cmp r0, #0
	beq _02007C90
	ldr sl, [r7, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r1, sl
	str sl, [r5, #4]
	bl MemLocateSet
	mov sb, r0
	mov r0, r7
	mov r1, r6
	str sb, [r5]
	bl sub_020077B8
	ldr r2, [r5]
	mov r0, r7
	mov r1, r6
	mov r3, sl
	bl sub_02007878
	mov r8, r0
	mov r0, r7
	mov r1, r6
	bl sub_0200781C
	mov r0, r7
	mov r1, r6
	bl sub_02007774
	cmp sl, r8
	moveq r4, #1
	beq _02007C90
	mov r0, sb
	bl MemFree
	mov r0, r4
	str r0, [r5]
	sub r0, r0, #1
	str r0, [r5, #4]
_02007C90:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02007C9C: .word 0x020927FC
	arm_func_end sub_02007BCC

	arm_func_start sub_02007CA0
sub_02007CA0: ; 0x02007CA0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	ldr r4, _02007D90 ; =0x020927FC
	mov r7, r2
	ldr r6, [r4, #4]
	ldr r4, [r4]
	add r5, sp, #8
	mov r2, r3
	str r4, [sp, #8]
	mov r3, r5
	mov sb, r0
	mov r8, r1
	str r6, [sp, #0xc]
	mov r4, #0
	bl sub_020076E4
	cmp r0, #0
	beq _02007D84
	ldr r5, [sb, #0x10]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	mov r1, r5
	str r5, [r7, #4]
	bl MemLocateSet
	mov r6, r0
	ldr r0, [sp, #0x38]
	str r6, [r7]
	cmp r0, #0
	beq _02007D14
	bl sub_02002B50
_02007D14:
	mov r0, sb
	mov r1, r8
	bl sub_020077B8
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [r7]
	mov r0, sb
	mov r1, r8
	mov r3, r5
	bl sub_02007948
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl sub_0200781C
	mov r0, sb
	mov r1, r8
	bl sub_02007774
	cmp r5, sl
	moveq r4, #1
	beq _02007D84
	mov r0, r6
	bl MemFree
	mov r0, #0
	str r0, [r7]
	sub r0, r0, #1
	str r0, [r7, #4]
_02007D84:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02007D90: .word 0x020927FC
	arm_func_end sub_02007CA0

	arm_func_start sub_02007D94
sub_02007D94: ; 0x02007D94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xec
	mov r7, r0
	mov r6, r1
	add r0, sp, #0
	mov r1, r2
	mov r5, r3
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r4, r0
	ldr r1, [r4]
	mov r0, #0
	str r1, [r7]
	ldr r1, [sp, #4]
	mov lr, r7
	str r1, [r7, #4]
	str r0, [r7, #8]
	mov ip, r6
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	bl sub_0207A270
	ldr r4, [r4, #0x34]
	ldr r3, [sp, #0x100]
	mov r2, r5
	mov r0, r7
	add r1, sp, #0
	blx r4
	mov r4, r0
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	ldmia r7, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	mov r0, r4
	add sp, sp, #0xec
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_02007D94

	arm_func_start sub_02007E2C
sub_02007E2C: ; 0x02007E2C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xec
	mov r5, r0
	mov r4, r1
	add r0, sp, #0
	mov r1, r2
	bl sub_02007124
	add r0, sp, #0xc
	bl sub_0200746C
	mov r6, r0
	ldr r1, [r6]
	mov r0, #0
	str r1, [r5]
	ldr r1, [sp, #4]
	mov lr, r5
	str r1, [r5, #4]
	str r0, [r5, #8]
	mov ip, r4
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldr r2, [r6, #0x38]
	mov r0, r5
	add r1, sp, #0
	blx r2
	mov ip, r0
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	mov r0, ip
	add sp, sp, #0xec
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02007E2C

	arm_func_start sub_02007EB4
sub_02007EB4: ; 0x02007EB4
	bx lr
	arm_func_end sub_02007EB4

	arm_func_start sub_02007EB8
sub_02007EB8: ; 0x02007EB8
	mov r0, #1
	bx lr
	arm_func_end sub_02007EB8

	arm_func_start sub_02007EC0
sub_02007EC0: ; 0x02007EC0
	stmdb sp!, {r3, lr}
	ldr r0, _02007ED8 ; =0x020AF368
	bl sub_02002C40
	ldr r0, _02007ED8 ; =0x020AF368
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02007ED8: .word 0x020AF368
	arm_func_end sub_02007EC0

	arm_func_start sub_02007EDC
sub_02007EDC: ; 0x02007EDC
	stmdb sp!, {r4, lr}
	ldr r0, _02007F08 ; =0x020AF368
	bl sub_02002CB4
	bl sub_020845E8
	and r4, r0, #0xff
	ldr r0, _02007F08 ; =0x020AF368
	bl sub_02002E98
	cmp r4, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02007F08: .word 0x020AF368
	arm_func_end sub_02007EDC

	arm_func_start sub_02007F0C
sub_02007F0C: ; 0x02007F0C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, _02007FC8 ; =0x020AF368
	mov r4, r1
	bl sub_02002CB4
	add r0, r5, #0x40
	bl FileInit
	add r1, sp, #0
	mov r0, r4
	bl sub_0200733C
	add r1, sp, #0
	add r0, r5, #0x40
	bl sub_0207F6C4
	cmp r0, #0
	bne _02007F64
	mov r0, #1
	bl CardPullOutWithStatus
	ldr r0, _02007FC8 ; =0x020AF368
	bl sub_02002E98
	mov r0, #0
	b _02007FC0
_02007F64:
	add r0, r5, #0x1c
	bl sub_020073B4
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r2, [r5, #0x68]
	ldr r1, [r5, #0x64]
	add r0, r5, #0x20
	sub r1, r2, r1
	str r1, [r5, #0x30]
	ldr r3, [r5, #0x6c]
	ldr r2, [r5, #0x64]
	add r1, r4, #0x5c
	sub r2, r3, r2
	str r2, [r5, #0x34]
	bl Strcpy
	mov r2, #0
	str r2, [r5, #0x88]
	ldr r1, [r5, #0x30]
	ldr r0, _02007FC8 ; =0x020AF368
	str r1, [r5, #0x10]
	str r2, [r5, #0x14]
	bl sub_02002E98
	mov r0, #1
_02007FC0:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02007FC8: .word 0x020AF368
	arm_func_end sub_02007F0C

	arm_func_start sub_02007FCC
sub_02007FCC: ; 0x02007FCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, _0200807C ; =0x020AF368
	mov r4, r1
	bl sub_02002CB4
	add r0, r5, #0x40
	bl FileInit
	add r1, sp, #0
	mov r0, r4
	bl sub_0200733C
	mov r6, #1
	add r7, sp, #0
_02008000:
	mov r1, r7
	add r0, r5, #0x40
	bl sub_0207F6C4
	cmp r0, #0
	bne _02008020
	mov r0, r6
	bl CardPullOutWithStatus
	b _02008000
_02008020:
	add r0, r5, #0x1c
	bl sub_020073B4
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r2, [r5, #0x68]
	ldr r1, [r5, #0x64]
	add r0, r5, #0x20
	sub r1, r2, r1
	str r1, [r5, #0x30]
	ldr r3, [r5, #0x6c]
	ldr r2, [r5, #0x64]
	add r1, r4, #0x5c
	sub r2, r3, r2
	str r2, [r5, #0x34]
	bl Strcpy
	mov r2, #0
	str r2, [r5, #0x88]
	ldr r1, [r5, #0x30]
	mov r0, #1
	str r1, [r5, #0x10]
	str r2, [r5, #0x14]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200807C: .word 0x020AF368
	arm_func_end sub_02007FCC

	arm_func_start sub_02008080
sub_02008080: ; 0x02008080
	stmdb sp!, {r3, lr}
	add r0, r0, #0x40
	bl sub_0207F70C
	cmp r0, #0
	bne _0200809C
	mov r0, #1
	bl CardPullOutWithStatus
_0200809C:
	ldr r0, _020080AC ; =0x020AF368
	bl sub_02002E98
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020080AC: .word 0x020AF368
	arm_func_end sub_02008080

	arm_func_start sub_020080B0
sub_020080B0: ; 0x020080B0
	mov r0, #1
	bx lr
	arm_func_end sub_020080B0

	arm_func_start sub_020080B8
sub_020080B8: ; 0x020080B8
	mov r0, #1
	bx lr
	arm_func_end sub_020080B8

	arm_func_start sub_020080C0
sub_020080C0: ; 0x020080C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldr r3, [r4, #0x30]
	ldr r0, [r4, #0x88]
	mov r7, r2
	sub r0, r3, r0, lsl #11
	cmp r7, r0
	mov r8, r1
	movgt r7, r0
	mov r6, #0
	mov r5, #1
	b _02008114
_020080F0:
	add r0, r4, #0x40
	add r1, r8, r6
	sub r2, r7, r6
	bl sub_0207F818
	cmp r0, #0
	addge r6, r6, r0
	bge _02008114
	mov r0, r5
	bl CardPullOutWithStatus
_02008114:
	cmp r7, r6
	bgt _020080F0
	mov r0, r6, asr #0xa
	ldr r1, [r4, #0x88]
	add r0, r6, r0, lsr #21
	add r1, r1, r0, asr #11
	mov r0, r6
	str r1, [r4, #0x88]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020080C0

	arm_func_start sub_02008138
sub_02008138: ; 0x02008138
	stmdb sp!, {r3, lr}
	str r1, [r0, #0x88]
	add r0, r0, #0x40
	mov r1, r1, lsl #0xb
	mov r2, #0
	bl sub_0207F828
	cmp r0, #0
	bne _02008160
	mov r0, #1
	bl CardPullOutWithStatus
_02008160:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008138

	arm_func_start DataTransferInit
DataTransferInit: ; 0x02008168
	stmdb sp!, {r3, lr}
	ldr r0, _0200818C ; =0x020AF368
	bl sub_02002CB4
	bl sub_02002580
	mov r1, #0x13
	bl sub_020027F8
	ldr r1, _02008190 ; =0x020AF360
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200818C: .word 0x020AF368
_02008190: .word 0x020AF360
	arm_func_end DataTransferInit

	arm_func_start DataTransferStop
DataTransferStop: ; 0x02008194
	stmdb sp!, {r4, lr}
	ldr r1, _020081C0 ; =0x020AF360
	ldr r0, _020081C4 ; =0x020AF368
	ldr r4, [r1, #4]
	mov r2, #0
	str r2, [r1, #4]
	bl sub_02002E98
	bl sub_02002580
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020081C0: .word 0x020AF360
_020081C4: .word 0x020AF368
	arm_func_end DataTransferStop

	arm_func_start sub_020081C8
sub_020081C8: ; 0x020081C8
	ldr ip, _020081D4 ; =sub_02002CB4
	ldr r0, _020081D8 ; =0x020AF368
	bx ip
	.align 2, 0
_020081D4: .word sub_02002CB4
_020081D8: .word 0x020AF368
	arm_func_end sub_020081C8

	arm_func_start sub_020081DC
sub_020081DC: ; 0x020081DC
	ldr ip, _020081E8 ; =sub_02002E98
	ldr r0, _020081EC ; =0x020AF368
	bx ip
	.align 2, 0
_020081E8: .word sub_02002E98
_020081EC: .word 0x020AF368
	arm_func_end sub_020081DC

	arm_func_start sub_020081F0
sub_020081F0: ; 0x020081F0
	ldr ip, _020081FC ; =sub_02002E10
	ldr r0, _02008200 ; =0x020AF368
	bx ip
	.align 2, 0
_020081FC: .word sub_02002E10
_02008200: .word 0x020AF368
	arm_func_end sub_020081F0

	arm_func_start FileInitVeneer
FileInitVeneer: ; 0x02008204
	ldr ip, _0200820C ; =FileInit
	bx ip
	.align 2, 0
_0200820C: .word FileInit
	arm_func_end FileInitVeneer

	arm_func_start FileOpen
FileOpen: ; 0x02008210
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #1
_02008220:
	mov r0, r6
	mov r1, r5
	bl sub_0207F6C4
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r4
	bl CardPullOutWithStatus
	b _02008220
	arm_func_end FileOpen

	arm_func_start sub_02008240
sub_02008240: ; 0x02008240
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008240

	arm_func_start FileGetSize
FileGetSize: ; 0x02008244
	ldr r1, [r0, #0x28]
	ldr r0, [r0, #0x24]
	sub r0, r1, r0
	bx lr
	arm_func_end FileGetSize

	arm_func_start FileRead
FileRead: ; 0x02008254
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	mov r4, #1
	b _02008298
_02008270:
	mov r0, r8
	mov r1, r7
	sub r2, r6, r5
	bl sub_0207F818
	cmp r0, #0
	addge r5, r5, r0
	addge r7, r7, r0
	bge _02008298
	mov r0, r4
	bl CardPullOutWithStatus
_02008298:
	cmp r6, r5
	bgt _02008270
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FileRead

	arm_func_start FileSeek
FileSeek: ; 0x020082A8
	stmdb sp!, {r3, lr}
	bl sub_0207F828
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl CardPullOutWithStatus
	ldmia sp!, {r3, pc}
	arm_func_end FileSeek

	arm_func_start FileClose
FileClose: ; 0x020082C4
	stmdb sp!, {r3, lr}
	bl sub_0207F70C
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl CardPullOutWithStatus
	ldmia sp!, {r3, pc}
	arm_func_end FileClose

	arm_func_start sub_020082E0
sub_020082E0: ; 0x020082E0
	ldr r0, _020082F0 ; =0x020AF360
	mov r1, #2
	str r1, [r0]
	bx lr
	.align 2, 0
_020082F0: .word 0x020AF360
	arm_func_end sub_020082E0

	arm_func_start sub_020082F4
sub_020082F4: ; 0x020082F4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, _02008410 ; =0x022A369C
	mov r1, #8
	bl sub_02002F34
	ldr r0, _02008414 ; =0x020AF3E4
	bl sub_02002C40
	ldr r0, _02008414 ; =0x020AF3E4
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _02008414 ; =0x020AF3E4
	bl sub_02002E98
	mov r1, #8
	ldr r0, _02008418 ; =0x020AF490
	mov r2, r1
	bl sub_02002A9C
	ldr r0, _0200841C ; =0x020AF53C
	mov r1, #8
	mov r2, #0
	bl sub_02002A9C
	ldr r0, _02008420 ; =0x020AF42C
	bl sub_02002950
	ldr r0, _02008424 ; =0x020AF408
	bl sub_02002C40
	ldr r0, _02008428 ; =0x020AF5E8
	mov r1, #1
	mov r2, #0
	bl sub_02002A9C
	mov r0, #0x800
	sub r1, r0, #0xf3
	bl MemAlloc
	mov r6, r0
	ldr r0, _0200842C ; =0x022A3698
	mov r7, #0
	ldr r4, _02008430 ; =0x02092978
	str r6, [r0]
	mov r5, r7
_02008388:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	mov r3, r4
	bl sub_02008980
	add r7, r7, #1
	cmp r7, #8
	add r6, r6, #0x100
	blt _02008388
	mov r0, r8
	bl sub_02007004
	bl sub_02006EF8
	bl sub_02007380
	bl sub_02007384
	ldr r0, _02008434 ; =0x0209297C
	bl DebugPrint0__0200C1FC
	bl sub_020073D8
	ldr r0, _02008438 ; =0x0209299C
	bl DebugPrint0__0200C1FC
	ldr r0, _0200843C ; =0x020AF3D0
	ldr r1, _02008440 ; =0x0000070D
	ldr r0, [r0, #8]
	bl MemAlloc
	ldr r2, _0200843C ; =0x020AF3D0
	ldr r1, _02008444 ; =0x020AF3D0
	str r0, [r2, #4]
	ldr r0, _02008448 ; =0x022A36C4
	mov r2, #0
	bl sub_02002778
	ldr r0, _02008424 ; =0x020AF408
	bl sub_02002E98
	ldr r0, _02008448 ; =0x022A36C4
	bl sub_020027E8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02008410: .word 0x022A369C
_02008414: .word 0x020AF3E4
_02008418: .word 0x020AF490
_0200841C: .word 0x020AF53C
_02008420: .word 0x020AF42C
_02008424: .word 0x020AF408
_02008428: .word 0x020AF5E8
_0200842C: .word 0x022A3698
_02008430: .word 0x02092978
_02008434: .word 0x0209297C
_02008438: .word 0x0209299C
_0200843C: .word 0x020AF3D0
_02008440: .word 0x0000070D
_02008444: .word 0x020AF3D0
_02008448: .word 0x022A36C4
	arm_func_end sub_020082F4

	arm_func_start sub_0200844C
sub_0200844C: ; 0x0200844C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02006ED4
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200844C

	arm_func_start sub_0200846C
sub_0200846C: ; 0x0200846C
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	stmib r0, {r1, r2}
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r1, #4
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_0200846C

	arm_func_start sub_02008490
sub_02008490: ; 0x02008490
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xb0
	ldr r0, _02008928 ; =0x020AF408
	bl sub_02002CB4
	ldr r0, _0200892C ; =0x02092908
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_020084B4:
	ldr r0, _02008930 ; =0x022A369C
	add r1, sp, #0x20
	mov r2, #1
	bl sub_02002F98
	ldr r0, _02008934 ; =0x020AF3E4
	bl sub_02002CB4
	ldr r1, [sp, #0x20]
	ldr r0, [r1]
	cmp r0, #1
	beq _020088F8
	ldr sb, [r1, #4]
	mov r1, #5
	add r0, sp, #0x24
	str r1, [sb, #0x24]
	bl sub_020075E8
	mov r6, #0
	add r1, sp, #0x24
	ldr r0, _02008934 ; =0x020AF3E4
	str r1, [sb, #0x1c]
	mov r7, r6
	mov r8, r6
	bl sub_02002E98
	ldr r0, [sb, #0x20]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _02008894
_0200851C: ; jump table
	b _02008894 ; case 0
	b _02008894 ; case 1
	b _02008558 ; case 2
	b _020085BC ; case 3
	b _020085E0 ; case 4
	b _02008670 ; case 5
	b _0200868C ; case 6
	b _020086DC ; case 7
	b _02008724 ; case 8
	b _0200876C ; case 9
	b _020087B4 ; case 10
	b _020087F0 ; case 11
	b _02008834 ; case 12
	b _02008860 ; case 13
	b _02008880 ; case 14
_02008558:
	add r0, sp, #0x24
	mov r1, sb
	bl sub_020075F4
	movs r6, r0
	beq _02008894
	mov r1, r7
	ldr r0, _02008928 ; =0x020AF408
	str r1, [sb, #0x24]
	bl sub_02002E98
	ldr r0, [sp, #0x20]
	bl sub_02008B78
	ldr r0, _02008938 ; =0x020AF5E8
	bl sub_02002B7C
	add r0, sp, #0x24
	mov r1, sb
	bl sub_02007624
	cmp r0, #0
	beq _020085B4
	mov r1, r7
	str r1, [sb, #0x1c]
	ldr r0, _02008938 ; =0x020AF5E8
	str r1, [sb, #0x24]
	bl sub_02002B20
_020085B4:
	mov sb, #0
	b _02008894
_020085BC:
	ldr r1, [sp, #0x20]
	mov r0, sb
	ldr r2, [r1, #0x10]
	ldr r3, [r1, #0xc]
	add r1, r1, #0x28
	mov r8, #1
	blx r3
	mov r6, r0
	b _02008894
_020085E0:
	ldr r5, [sp, #0x10]
	ldr r4, [sp, #0x14]
	add sl, sp, #0x18
	add fp, sp, #0x24
_020085F0:
	ldr r2, [sp, #0x20]
	mov r0, fp
	mov r1, sb
	mov r3, sl
	add r2, r2, #0x28
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	bl sub_020076E4
	movs r6, r0
	beq _020085F0
	cmp r6, #0
	beq _02008894
	mov r1, #0
	ldr r0, _02008928 ; =0x020AF408
	str r1, [sb, #0x24]
	bl sub_02002E98
	ldr r0, [sp, #0x20]
	bl sub_02008B78
	ldr r0, _02008938 ; =0x020AF5E8
	bl sub_02002B7C
	add r0, sp, #0x24
	mov r1, sb
	bl sub_02007774
	cmp r0, #0
	beq _02008668
	mov r1, #0
	str r1, [sb, #0x1c]
	ldr r0, _02008938 ; =0x020AF5E8
	str r1, [sb, #0x24]
	bl sub_02002B20
_02008668:
	mov sb, #0
	b _02008894
_02008670:
	ldr r0, [sp, #0x20]
	ldr r4, [r0, #0x10]
	add r0, r0, #0x28
	bl sub_02007578
	str r0, [r4]
	mov r6, #1
	b _02008894
_0200868C:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	mov r1, sb
	add r2, r3, #0x28
	ldr r4, [r3, #0x10]
	bl sub_02007654
	cmp r0, #0
	beq _020086C4
	ldr r1, [sb]
	mov r0, r6
	str r1, [r4]
	ldr r1, [sb, #0x10]
	str r1, [r4, #0xc]
	b _020086D0
_020086C4:
	mov r0, r4
	bl sub_0200846C
	mov r0, #2
_020086D0:
	str r0, [r4, #0x14]
	mov r6, #1
	b _02008894
_020086DC:
	mov r4, r6
	mov r5, #1
	add r7, sp, #0x24
_020086E8:
	ldr r3, [sp, #0x20]
	mov r0, r7
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	mov r1, sb
	bl sub_02007A70
	cmp r0, #0
	movge r0, r5
	movlt r0, r4
	ands r6, r0, #0xff
	beq _020086E8
	ldrb r7, [sp, #0x30]
	b _02008894
_02008724:
	mov r4, r6
	mov r5, #1
	add r7, sp, #0x24
_02008730:
	ldr r3, [sp, #0x20]
	mov r0, r7
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	mov r1, sb
	bl sub_020079D8
	cmp r0, #0
	movge r0, r5
	movlt r0, r4
	ands r6, r0, #0xff
	beq _02008730
	ldrb r7, [sp, #0x30]
	b _02008894
_0200876C:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0x1c]
	mov r1, sb
	str r2, [sp, #4]
	ldr r2, [r3, #0x18]
	str r2, [sp, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	bl sub_02007B14
	cmp r0, #0
	movge r0, #1
	movlt r0, r6
	and r6, r0, #0xff
	ldrb r7, [sp, #0x30]
	b _02008894
_020087B4:
	add r4, sp, #0x24
_020087B8:
	ldr r2, [sp, #0x20]
	mov r0, r4
	ldr r1, [r2, #0x20]
	add r3, r2, #0x28
	str r1, [sp]
	ldr r1, [r2, #0x24]
	str r1, [sp, #4]
	ldr r1, [r2, #4]
	ldr r2, [r2, #0x10]
	bl sub_02007BCC
	movs r6, r0
	beq _020087B8
	ldrb r7, [sp, #0x30]
	b _02008894
_020087F0:
	ldr r2, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r2, #0x20]
	add r3, r2, #0x28
	str r1, [sp]
	ldr r1, [r2, #0x24]
	str r1, [sp, #4]
	ldr r1, [r2, #0x1c]
	str r1, [sp, #8]
	ldr r1, [r2, #0x14]
	str r1, [sp, #0xc]
	ldr r1, [r2, #4]
	ldr r2, [r2, #0x10]
	bl sub_02007CA0
	mov r6, r0
	ldrb r7, [sp, #0x30]
	b _02008894
_02008834:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r3, #0x14]
	add r2, r3, #0x28
	str r1, [sp]
	ldr r1, [r3, #4]
	ldr r3, [r3, #0x10]
	bl sub_02007D94
	mov r6, r0
	mov r8, #1
	b _02008894
_02008860:
	ldr r2, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r2, #4]
	add r2, r2, #0x28
	bl sub_02007E2C
	mov r6, r0
	mov r8, #1
	b _02008894
_02008880:
	ldr r0, [sp, #0x20]
	add r0, r0, #0x28
	bl sub_020075B0
	mov r6, r0
	mov r8, #1
_02008894:
	ldr r0, _02008934 ; =0x020AF3E4
	bl sub_02002CB4
	cmp sb, #0
	beq _020088DC
	mov r0, #0
	str r0, [sb, #0x1c]
	cmp r7, #0
	movne r0, #1
	strne r0, [sb, #0x24]
	bne _020088DC
	cmp r6, #0
	strne r0, [sb, #0x24]
	bne _020088DC
	cmp r8, #0
	movne r0, #2
	strne r0, [sb, #0x24]
	moveq r0, #3
	streq r0, [sb, #0x24]
_020088DC:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _020088F0
	bl sub_02002B50
_020088F0:
	ldr r0, [sp, #0x20]
	bl sub_02008B78
_020088F8:
	mov r1, #0
	ldr r0, [sp, #0x20]
	ldr r3, _0200893C ; =0x02092978
	mov r2, r1
	bl sub_02008980
	ldr r0, _02008934 ; =0x020AF3E4
	bl sub_02002E98
	ldr r0, _02008940 ; =0x020AF42C
	bl sub_020029B8
	ldr r0, _02008944 ; =0x020AF490
	bl sub_02002B20
	b _020084B4
	.align 2, 0
_02008928: .word 0x020AF408
_0200892C: .word 0x02092908
_02008930: .word 0x022A369C
_02008934: .word 0x020AF3E4
_02008938: .word 0x020AF5E8
_0200893C: .word 0x02092978
_02008940: .word 0x020AF42C
_02008944: .word 0x020AF490
	arm_func_end sub_02008490

	arm_func_start sub_02008948
sub_02008948: ; 0x02008948
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0200897C ; =0x020AF3E4
	bl sub_02002CB4
	ldr r0, [r4, #0x24]
	cmp r0, #4
	cmpne r0, #5
	moveq r4, #1
	ldr r0, _0200897C ; =0x020AF3E4
	movne r4, #0
	bl sub_02002E98
	and r0, r4, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200897C: .word 0x020AF3E4
	arm_func_end sub_02008948

	arm_func_start sub_02008980
sub_02008980: ; 0x02008980
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r2, [r4]
	cmp r3, #0
	str r1, [r4, #4]
	moveq r0, #0
	streqb r0, [r4, #0x28]
	beq _020089AC
	mov r1, r3
	add r0, r4, #0x28
	bl Strcpy
_020089AC:
	mov r0, #0
	strb r0, [r4, #9]
	strb r0, [r4, #8]
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02008980

	arm_func_start sub_020089D8
sub_020089D8: ; 0x020089D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, _02008A78 ; =0x020AF3E4
	ldr r1, _02008A7C ; =0x020AF490
	bl sub_02002D80
	cmp r0, #0
	bne _02008A00
	ldr r0, _02008A78 ; =0x020AF3E4
	ldr r1, _02008A7C ; =0x020AF490
	bl sub_02002D14
_02008A00:
	ldr r0, _02008A80 ; =0x022A3698
	mov r3, #0
	ldr r5, [r0]
	mov r0, r3
	mov r1, #1
	b _02008A60
_02008A18:
	ldr r2, [r5]
	cmp r2, #0
	moveq r2, r1
	movne r2, r0
	tst r2, #0xff
	beq _02008A58
	mov lr, r5
	mov ip, #0x10
_02008A38:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02008A38
	ldr r0, _02008A78 ; =0x020AF3E4
	bl sub_02002E98
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02008A58:
	add r3, r3, #1
	add r5, r5, #0x100
_02008A60:
	cmp r3, #8
	blt _02008A18
	ldr r0, _02008A78 ; =0x020AF3E4
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02008A78: .word 0x020AF3E4
_02008A7C: .word 0x020AF490
_02008A80: .word 0x022A3698
	arm_func_end sub_020089D8

	arm_func_start sub_02008A84
sub_02008A84: ; 0x02008A84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldr r4, [r5, #4]
	mov r0, r4
	bl sub_02008948
	cmp r0, #0
	bne _02008B00
	ldr r1, [r5]
	mov r0, r5
	str r1, [r4, #0x20]
	mov r1, #4
	str r1, [r4, #0x24]
	bl sub_020089D8
	mov r1, r0
	mov r2, #1
	ldr r0, _02008B64 ; =0x022A369C
	strb r2, [r1, #8]
	bl sub_02002F7C
	ldr r6, _02008B68 ; =0x020AF53C
_02008AD4:
	mov r0, r6
	bl sub_02002B7C
	ldr r3, [r4, #0x24]
	cmp r3, #4
	bne _02008AF4
	mov r0, r6
	bl sub_02002B20
	b _02008AD4
_02008AF4:
	cmp r3, #2
	bhi _02008B04
	b _02008B5C
_02008B00:
	mov r3, #5
_02008B04:
	ldr r0, _02008B6C ; =0x02092908
	ldr r2, _02008B70 ; =0x020AF454
	ldr r1, [r0, #0x24]
	ldr r0, [r0, #0x20]
	str r1, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr ip, [r5]
	ldr r1, _02008B74 ; =0x020929B8
	stmia sp, {r3, ip}
	ldr r3, [r4, #0x20]
	add r0, sp, #0x1c
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r4, [r5, #0xc]
	add r3, r5, #0x28
	str r4, [sp, #0x10]
	ldr r4, [r5, #0x10]
	str r4, [sp, #0x14]
	ldr r4, [r5, #0x14]
	str r4, [sp, #0x18]
	ldr r2, [r2, ip, lsl #2]
	bl FatalError
_02008B5C:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02008B64: .word 0x022A369C
_02008B68: .word 0x020AF53C
_02008B6C: .word 0x02092908
_02008B70: .word 0x020AF454
_02008B74: .word 0x020929B8
	arm_func_end sub_02008A84

	arm_func_start sub_02008B78
sub_02008B78: ; 0x02008B78
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #8]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #8]
	ldr r0, _02008BA4 ; =0x020AF53C
	bl sub_02002B20
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02008BA4: .word 0x020AF53C
	arm_func_end sub_02008B78

	arm_func_start sub_02008BA8
sub_02008BA8: ; 0x02008BA8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x40
	mov r2, r0
	add r0, sp, #0
	add r1, sp, #0x28
	bl sub_02008C68
	cmp r0, #0
	ldrne r0, [sp, #0x34]
	mvneq r0, #0
	add sp, sp, #0x40
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008BA8

	arm_func_start UnloadFile
UnloadFile: ; 0x02008BD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadFile

	arm_func_start sub_02008BF4
sub_02008BF4: ; 0x02008BF4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008CC4
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008BF4

	arm_func_start sub_02008C18
sub_02008C18: ; 0x02008C18
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008D10
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008C18

	arm_func_start LoadFileFromRom__02008C3C
LoadFileFromRom__02008C3C: ; 0x02008C3C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov lr, r0
	mov ip, r1
	mov r3, r2
	add r0, sp, #0
	mov r1, lr
	mov r2, ip
	bl sub_02008D60
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end LoadFileFromRom__02008C3C

	arm_func_start sub_02008C68
sub_02008C68: ; 0x02008C68
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #6
	bl sub_02008980
	mov r0, r5
	str r5, [sp, #0x10]
	bl sub_0200846C
	add r0, sp, #0
	bl sub_02008A84
	ldr r0, [r5, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008C68

	arm_func_start sub_02008CC4
sub_02008CC4: ; 0x02008CC4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	mvn r1, #0
	add r0, sp, #0
	str r5, [sp, #0xc]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008CC4

	arm_func_start sub_02008D10
sub_02008D10: ; 0x02008D10
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	ldr r1, [r5]
	add r0, sp, #0
	str r1, [sp, #0xc]
	ldr r1, [r5, #4]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008D10

	arm_func_start sub_02008D60
sub_02008D60: ; 0x02008D60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x100
	mov r7, r0
	mov r5, r2
	mov r6, r1
	mov r4, r3
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r7
	mov r3, r5
	mov r2, #0xa
	bl sub_02008980
	add r0, sp, #0
	str r6, [sp, #0x10]
	str r4, [sp, #0x24]
	bl sub_02008A84
	ldr r0, [r7, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02008D60

	arm_func_start sub_02008DAC
sub_02008DAC: ; 0x02008DAC
	stmdb sp!, {r4, lr}
	ldr r1, _02008EAC ; =0x020AF694
	mov r3, #0xff
	ldr r0, _02008EB0 ; =0x020B2B98
	mov r2, #3
	strb r3, [r1]
	str r2, [r0]
	bl sub_02076074
	ldr r2, _02008EB4 ; =0x04000304
	ldr r0, _02008EB8 ; =0xFFFFFDF1
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	bl sub_020777C4
	bl sub_0207793C
	bl sub_0207621C
	ldr r1, _02008EBC ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl sub_0200961C
	ldr r0, _02008EC0 ; =0x000001FF
	bl sub_02076E90
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl sub_0207C358
	bl sub_0207735C
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0xc0
	ldr r1, _02008EC4 ; =0x07000400
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0
	ldr r1, _02008EC8 ; =0x05000400
	mov r2, #0x400
	bl sub_0207C358
	mov r1, #0x100
	ldr r0, _02008ECC ; =0x022A37A0
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02009648
	mov r2, #0
	ldr r0, _02008ECC ; =0x022A37A0
	mov r1, #0x100
	str r2, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02008F88
	mov r4, #1
_02008E98:
	mov r0, r4
	bl sub_02082420
	cmp r0, #0
	beq _02008E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008EAC: .word 0x020AF694
_02008EB0: .word 0x020B2B98
_02008EB4: .word 0x04000304
_02008EB8: .word 0xFFFFFDF1
_02008EBC: .word 0x04001000
_02008EC0: .word 0x000001FF
_02008EC4: .word 0x07000400
_02008EC8: .word 0x05000400
_02008ECC: .word 0x022A37A0
	arm_func_end sub_02008DAC

	arm_func_start sub_02008ED0
sub_02008ED0: ; 0x02008ED0
	stmdb sp!, {r4, lr}
	ldr r1, _02008F30 ; =0x020AF694
	mov r4, r0
	ldrb r1, [r1]
	cmp r1, r4
	ldmeqia sp!, {r4, pc}
	ldr r0, _02008F34 ; =0x02092AB8
	mov r2, r4
	bl DebugPrint0__0200C1FC
	cmp r4, #0
	beq _02008F0C
	cmp r4, #0xff
	bne _02008F24
	bl sub_0200961C
	b _02008F24
_02008F0C:
	bl sub_02009648
	bl sub_02076258
	ldr r1, _02008F38 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
_02008F24:
	ldr r0, _02008F30 ; =0x020AF694
	strb r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008F30: .word 0x020AF694
_02008F34: .word 0x02092AB8
_02008F38: .word 0x04001000
	arm_func_end sub_02008ED0

	arm_func_start sub_02008F3C
sub_02008F3C: ; 0x02008F3C
	ldr r2, _02008F48 ; =0x022A37A4
	str r1, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_02008F48: .word 0x022A37A4
	arm_func_end sub_02008F3C

	arm_func_start sub_02008F4C
sub_02008F4C: ; 0x02008F4C
	ldr r1, _02008F60 ; =0x022A37A4
	ldr r0, [r1, r0, lsl #2]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
	.align 2, 0
_02008F60: .word 0x022A37A4
	arm_func_end sub_02008F4C

	arm_func_start sub_02008F64
sub_02008F64: ; 0x02008F64
	ldr r2, _02008F80 ; =0x022A37A0
	add r0, r1, r0, lsl #2
	ldr r3, [r2]
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [r2]
	bx lr
	.align 2, 0
_02008F80: .word 0x022A37A0
	arm_func_end sub_02008F64

	arm_func_start sub_02008F84
sub_02008F84: ; 0x02008F84
	bx lr
	arm_func_end sub_02008F84

	arm_func_start sub_02008F88
sub_02008F88: ; 0x02008F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0
	bl sub_02009DCC
	mov r0, #1
	bl sub_02009DCC
	mov r0, #0
	bl sub_02009D48
	mov r0, #1
	bl sub_02009D48
	mov r0, #0
	bl sub_02009F9C
	mov r0, #1
	bl sub_02009F9C
	mov r0, #0
	bl sub_02009E70
	mov r0, #1
	bl sub_02009E70
	ldr r1, _02009080 ; =0x022A37A0
	ldr r0, _02009084 ; =0x0400006C
	ldr r2, [r1, #4]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl sub_02076324
	ldr r1, _02009080 ; =0x022A37A0
	ldr r0, _02009088 ; =0x0400106C
	ldr r2, [r1, #8]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl sub_02076324
	ldr r0, _02009080 ; =0x022A37A0
	ldr sb, [r0]
	cmp sb, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sl, #0
	ldr r8, _0200908C ; =0x02092A18
	mov fp, #2
	ldr r7, _02009090 ; =0x02092A38
	ldr r6, _02009094 ; =0x02092A58
	ldr r5, _02009098 ; =0x02092A78
	ldr r4, _0200909C ; =0x02092A98
	b _02009068
_02009034:
	tst sb, #1
	beq _02009060
	ldr r0, [r8, sl, lsl #2]
	mov r1, fp
	bl MemZero16
	ldr r0, [r7, sl, lsl #2]
	ldr r1, [r6, sl, lsl #2]
	bl MemZero32
	ldr r0, [r5, sl, lsl #2]
	ldr r1, [r4, sl, lsl #2]
	bl MemZero32
_02009060:
	mov sb, sb, asr #1
	add sl, sl, #1
_02009068:
	cmp sb, #0
	bne _02009034
	ldr r0, _02009080 ; =0x022A37A0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02009080: .word 0x022A37A0
_02009084: .word 0x0400006C
_02009088: .word 0x0400106C
_0200908C: .word 0x02092A18
_02009090: .word 0x02092A38
_02009094: .word 0x02092A58
_02009098: .word 0x02092A78
_0200909C: .word 0x02092A98
	arm_func_end sub_02008F88

	arm_func_start sub_020090A0
sub_020090A0: ; 0x020090A0
	mov r3, r1, lsr #0x1f
	ldr ip, _020090BC ; =0x022A37CC
	rsb r1, r3, r1, lsl #30
	add r3, r3, r1, ror #30
	add r1, ip, r2, lsl #4
	str r3, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020090BC: .word 0x022A37CC
	arm_func_end sub_020090A0

	arm_func_start sub_020090C0
sub_020090C0: ; 0x020090C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_020090D0:
	ldrb r1, [r6, r4]
	mov r0, r4
	mov r2, r5
	bl sub_020090A0
	add r0, r4, #1
	and r4, r0, #0xff
	cmp r4, #4
	blo _020090D0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020090C0

	arm_func_start sub_020090F4
sub_020090F4: ; 0x020090F4
	ldr r2, _0200911C ; =0x022A37CC
	mov ip, #0
	add r3, r2, r1, lsl #4
_02009100:
	ldr r2, [r3, ip, lsl #2]
	add r1, ip, #1
	strb r2, [r0, ip]
	and ip, r1, #0xff
	cmp ip, #4
	blo _02009100
	bx lr
	.align 2, 0
_0200911C: .word 0x022A37CC
	arm_func_end sub_020090F4

	arm_func_start sub_02009120
sub_02009120: ; 0x02009120
	cmp r0, #0
	bne _02009150
	ldr r2, _02009184 ; =0x022A37CC
	mov r3, #1
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =0x022A37D0
	mov r3, #0
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =0x022A37D4
	mov r3, #2
	ldr r1, _02009190 ; =0x022A37D8
	b _02009174
_02009150:
	ldr r2, _02009184 ; =0x022A37CC
	mov r3, #0
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =0x022A37D0
	mov r3, #1
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =0x022A37D4
	ldr r1, _02009190 ; =0x022A37D8
	mov r3, #2
_02009174:
	str r3, [r2, r0, lsl #4]
	mov r2, #3
	str r2, [r1, r0, lsl #4]
	bx lr
	.align 2, 0
_02009184: .word 0x022A37CC
_02009188: .word 0x022A37D0
_0200918C: .word 0x022A37D4
_02009190: .word 0x022A37D8
	arm_func_end sub_02009120

	arm_func_start sub_02009194
sub_02009194: ; 0x02009194
	ldr r2, _020091AC ; =0x022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091AC: .word 0x022A37AC
	arm_func_end sub_02009194

	arm_func_start sub_020091B0
sub_020091B0: ; 0x020091B0
	ldr r2, _020091C8 ; =0x022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #0
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091C8: .word 0x022A37AC
	arm_func_end sub_020091B0

	arm_func_start sub_020091CC
sub_020091CC: ; 0x020091CC
	ldr r1, _020091F4 ; =0x022A37AC
	add r0, r0, r0, lsl #2
	add r2, r1, r0
	mov r1, #0
	mov r0, r1
_020091E0:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #5
	blt _020091E0
	bx lr
	.align 2, 0
_020091F4: .word 0x022A37AC
	arm_func_end sub_020091CC

	arm_func_start sub_020091F8
sub_020091F8: ; 0x020091F8
	stmdb sp!, {r3, lr}
	mov ip, #0x1b
	mul lr, r3, ip
	ldr ip, _02009220 ; =0x022A37EC
	ldr r3, _02009224 ; =0x022A37ED
	strb r0, [ip, lr]
	ldr r0, _02009228 ; =0x022A37EE
	strb r1, [r3, lr]
	strb r2, [r0, lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009220: .word 0x022A37EC
_02009224: .word 0x022A37ED
_02009228: .word 0x022A37EE
	arm_func_end sub_020091F8

	arm_func_start sub_0200922C
sub_0200922C: ; 0x0200922C
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009278 ; =0x022A37F3
	smulbb r4, r4, ip
	ldr ip, _0200927C ; =0x022A37F4
	strb r0, [lr, r4]
	ldr lr, _02009280 ; =0x022A37F5
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _02009284 ; =0x022A37F6
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009288 ; =0x022A37F7
	strb r3, [r0, r4]
	ldr r0, _0200928C ; =0x022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009278: .word 0x022A37F3
_0200927C: .word 0x022A37F4
_02009280: .word 0x022A37F5
_02009284: .word 0x022A37F6
_02009288: .word 0x022A37F7
_0200928C: .word 0x022A37EF
	arm_func_end sub_0200922C

	arm_func_start sub_02009290
sub_02009290: ; 0x02009290
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020092DC ; =0x022A37F8
	smulbb r4, r4, ip
	ldr ip, _020092E0 ; =0x022A37F9
	strb r0, [lr, r4]
	ldr lr, _020092E4 ; =0x022A37FA
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020092E8 ; =0x022A37FB
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020092EC ; =0x022A37FC
	strb r3, [r0, r4]
	ldr r0, _020092F0 ; =0x022A37F0
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020092DC: .word 0x022A37F8
_020092E0: .word 0x022A37F9
_020092E4: .word 0x022A37FA
_020092E8: .word 0x022A37FB
_020092EC: .word 0x022A37FC
_020092F0: .word 0x022A37F0
	arm_func_end sub_02009290

	arm_func_start sub_020092F4
sub_020092F4: ; 0x020092F4
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009340 ; =0x022A3802
	smulbb r4, r4, ip
	ldr ip, _02009344 ; =0x022A3803
	strb r0, [lr, r4]
	ldr lr, _02009348 ; =0x022A3804
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _0200934C ; =0x022A3805
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009350 ; =0x022A3806
	strb r3, [r0, r4]
	ldr r0, _02009354 ; =0x022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009340: .word 0x022A3802
_02009344: .word 0x022A3803
_02009348: .word 0x022A3804
_0200934C: .word 0x022A3805
_02009350: .word 0x022A3806
_02009354: .word 0x022A37EF
	arm_func_end sub_020092F4

	arm_func_start sub_02009358
sub_02009358: ; 0x02009358
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020093A4 ; =0x022A37FD
	smulbb r4, r4, ip
	ldr ip, _020093A8 ; =0x022A37FE
	strb r0, [lr, r4]
	ldr lr, _020093AC ; =0x022A37FF
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020093B0 ; =0x022A3800
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020093B4 ; =0x022A3801
	strb r3, [r0, r4]
	ldr r0, _020093B8 ; =0x022A37F1
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020093A4: .word 0x022A37FD
_020093A8: .word 0x022A37FE
_020093AC: .word 0x022A37FF
_020093B0: .word 0x022A3800
_020093B4: .word 0x022A3801
_020093B8: .word 0x022A37F1
	arm_func_end sub_02009358

	arm_func_start sub_020093BC
sub_020093BC: ; 0x020093BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r4
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	stmib sp, {r0, r4}
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020093BC

	arm_func_start sub_02009454
sub_02009454: ; 0x02009454
	ldr ip, _02009468 ; =0x022A37B6
	mov r3, #0xa
	mla r3, r2, r3, ip
	strb r1, [r0, r3]
	bx lr
	.align 2, 0
_02009468: .word 0x022A37B6
	arm_func_end sub_02009454

	arm_func_start sub_0200946C
sub_0200946C: ; 0x0200946C
	ldr r3, _02009494 ; =0x022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_0200947C:
	ldrb r1, [r0, r2]
	strb r1, [r3, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _0200947C
	bx lr
	.align 2, 0
_02009494: .word 0x022A37B6
	arm_func_end sub_0200946C

	arm_func_start sub_02009498
sub_02009498: ; 0x02009498
	ldr r3, _020094C0 ; =0x022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_020094A8:
	ldrb r1, [r3, r2]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _020094A8
	bx lr
	.align 2, 0
_020094C0: .word 0x022A37B6
	arm_func_end sub_02009498

	arm_func_start sub_020094C4
sub_020094C4: ; 0x020094C4
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _020094E0 ; =0x022A37BC
	ldr r2, _020094E4 ; =0x022A37BE
	strh r0, [r3, ip]
	strh r1, [r2, ip]
	bx lr
	.align 2, 0
_020094E0: .word 0x022A37BC
_020094E4: .word 0x022A37BE
	arm_func_end sub_020094C4

	arm_func_start sub_020094E8
sub_020094E8: ; 0x020094E8
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _0200950C ; =0x022A37BC
	ldr r2, _02009510 ; =0x022A37BE
	ldrsh r3, [r3, ip]
	strh r3, [r0]
	ldrsh r0, [r2, ip]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200950C: .word 0x022A37BC
_02009510: .word 0x022A37BE
	arm_func_end sub_020094E8

	arm_func_start sub_02009514
sub_02009514: ; 0x02009514
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x40
	mov r1, r0
	mov r2, r4
	bl sub_020094C4
	mov r0, #0xa
	mul r3, r4, r0
	cmp r4, #0
	bne _02009568
	ldr r0, _02009598 ; =0x022A37B6
	mov r2, #1
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =0x022A37B7
	mov r2, #2
	strb r2, [r1, r3]
	ldr r0, _020095A0 ; =0x022A37B8
	ldr r1, _020095A4 ; =0x022A37B9
	strb r2, [r0, r3]
	ldr r0, _020095A8 ; =0x022A37BA
	b _0200958C
_02009568:
	ldr r0, _02009598 ; =0x022A37B6
	mov r2, #2
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =0x022A37B7
	ldr r0, _020095A0 ; =0x022A37B8
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldr r1, _020095A4 ; =0x022A37B9
	ldr r0, _020095A8 ; =0x022A37BA
_0200958C:
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009598: .word 0x022A37B6
_0200959C: .word 0x022A37B7
_020095A0: .word 0x022A37B8
_020095A4: .word 0x022A37B9
_020095A8: .word 0x022A37BA
	arm_func_end sub_02009514

	arm_func_start sub_020095AC
sub_020095AC: ; 0x020095AC
	ldr r2, _020095C4 ; =0x04001008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095C4: .word 0x04001008
	arm_func_end sub_020095AC

	arm_func_start sub_020095C8
sub_020095C8: ; 0x020095C8
	ldr r2, _020095E0 ; =0x0400100A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095E0: .word 0x0400100A
	arm_func_end sub_020095C8

	arm_func_start sub_020095E4
sub_020095E4: ; 0x020095E4
	ldr r2, _020095FC ; =0x0400100C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095FC: .word 0x0400100C
	arm_func_end sub_020095E4

	arm_func_start sub_02009600
sub_02009600: ; 0x02009600
	ldr r2, _02009618 ; =0x0400100E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009618: .word 0x0400100E
	arm_func_end sub_02009600

	arm_func_start sub_0200961C
sub_0200961C: ; 0x0200961C
	stmdb sp!, {r3, lr}
	bl sub_0207729C
	bl sub_020772B0
	bl sub_020772C4
	bl sub_020772E8
	bl sub_0207730C
	bl sub_02077320
	bl sub_02077370
	bl sub_02077384
	bl sub_02077398
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200961C

	arm_func_start sub_02009648
sub_02009648: ; 0x02009648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r0, #1
	bl sub_02076464
	mov r0, #2
	bl sub_020766F4
	mov r0, #0x10
	bl sub_02076844
	mov r0, #0x40
	bl sub_02076944
	mov r0, #8
	bl sub_020769F0
	mov r0, #0x20
	bl sub_02076BC8
	mov r0, #1
	mov r1, #0
	mov r2, r0
	bl sub_020762A0
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _02009B78 ; =0x00005C10
	bic r1, r1, #0x1f00
	orr r1, r1, #0x1f00
	str r1, [r2]
	add r3, r0, #0x208
	ldr r1, [r2]
	mov r0, #0x1c
	bic r1, r1, #0x38000000
	str r1, [r2]
	ldr r4, [r2]
	mov r1, #0
	bic r4, r4, #0x7000000
	str r4, [r2]
	ldrh r4, [r2, #0xa]
	and r4, r4, #0x43
	orr r4, r4, #0x1b80
	strh r4, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	bic r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009B98
	mov r0, #0x1c
	mov r1, #0
	bl sub_02009BC0
	mov r0, #0
	mov r1, r0
	bl sub_02009BE8
	mov r0, #0xc
	mov r1, #0
	bl sub_02009C10
	mov r3, #8
	str r3, [sp]
	ldr r0, _02009B7C ; =0x04000050
	mov r1, #1
	mov r2, #0x3e
	bl sub_020776E8
	ldr ip, _02009B80 ; =0x04000040
	mov lr, #0
	strh lr, [ip]
	strh lr, [ip, #4]
	strh lr, [ip, #2]
	strh lr, [ip, #6]
	sub r4, ip, #0x36
	ldrh r0, [r4]
	sub r3, ip, #0x38
	sub r2, ip, #0x34
	bic r0, r0, #3
	strh r0, [r4]
	ldrh r0, [r3]
	sub r1, ip, #0x32
	mov r6, #0x4000000
	bic r0, r0, #3
	orr r0, r0, #1
	strh r0, [r3]
	ldrh r7, [r2]
	ldr r5, _02009B84 ; =0xFFCFFFEF
	mov r0, #4
	bic r7, r7, #3
	orr r7, r7, #2
	strh r7, [r2]
	ldrh r7, [r1]
	bic r7, r7, #3
	orr r7, r7, #3
	strh r7, [r1]
	str lr, [ip, #-0x2c]
	str lr, [ip, #-0x28]
	str lr, [ip, #-0x24]
	ldrh r7, [r3]
	bic r7, r7, #0x40
	strh r7, [r3]
	ldrh r3, [r4]
	bic r3, r3, #0x40
	strh r3, [r4]
	ldrh r3, [r2]
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r2, [r1]
	bic r2, r2, #0x40
	strh r2, [r1]
	ldr r1, [r6]
	and r1, r1, r5
	orr r1, r1, #0x10
	orr r1, r1, #0x200000
	str r1, [r6]
	bl sub_02076EB0
	mov r0, #0x100
	bl sub_02076F58
	mov r0, #0x80
	bl sub_02076FC8
	mov r0, #0
	bl sub_02076308
	ldr r2, _02009B88 ; =0x04001000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, #0x1f00
	str r0, [r2]
	ldrh r0, [r2, #8]
	and r0, r0, #0x43
	orr r0, r0, #0x1a80
	strh r0, [r2, #8]
	ldrh r3, [r2, #0xa]
	ldr r1, _02009B78 ; =0x00005C10
	mov r0, #0x1e
	and r3, r3, #0x43
	orr r3, r3, #0x38c
	orr r3, r3, #0x1800
	strh r3, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	add r3, r1, #0x208
	mov r1, #1
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	orr r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009CA8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009CD0
	mov r0, #0
	mov r1, r0
	bl sub_02009CF8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009D20
	ldr ip, _02009B8C ; =0x04001050
	mov r1, #0
	strh r1, [ip]
	strh r1, [ip, #-0x10]
	strh r1, [ip, #-0xc]
	strh r1, [ip, #-0xe]
	strh r1, [ip, #-0xa]
	sub r3, ip, #0x48
	ldrh r4, [r3]
	sub r0, ip, #0x46
	sub r2, ip, #0x44
	bic r4, r4, #3
	strh r4, [r3]
	ldrh r5, [r0]
	sub r4, ip, #0x42
	bic r5, r5, #3
	orr r5, r5, #1
	strh r5, [r0]
	ldrh r5, [r2]
	bic r5, r5, #3
	orr r5, r5, #2
	strh r5, [r2]
	ldrh r5, [r4]
	bic r5, r5, #3
	orr r5, r5, #3
	strh r5, [r4]
	str r1, [ip, #-0x40]
	str r1, [ip, #-0x3c]
	str r1, [ip, #-0x38]
	str r1, [ip, #-0x34]
	ldrh r5, [r3]
	ldr r6, _02009B90 ; =0xFFFFCFFD
	ldr lr, _02009B94 ; =0x04000304
	bic r5, r5, #0x40
	strh r5, [r3]
	ldrh r3, [r0]
	sub r7, ip, #0x50
	ldr r5, _02009B84 ; =0xFFCFFFEF
	bic r3, r3, #0x40
	strh r3, [r0]
	ldrh r3, [r2]
	sub ip, lr, #0x2a4
	mov r0, r6, lsr #0x16
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r8, [r4]
	mov r2, r6, lsr #0x11
	mov r3, #0x3f
	bic r8, r8, #0x40
	strh r8, [r4]
	ldr r4, [r7]
	and r4, r4, r5
	orr r4, r4, #0x10
	orr r4, r4, #0x200000
	str r4, [r7]
	ldrh r4, [lr]
	bic r4, r4, #0x8000
	strh r4, [lr]
	ldrh r4, [ip]
	and r4, r4, r6
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #0x10
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #8
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #4
	strh r4, [ip]
	strh r1, [lr, #0x3c]
	str r1, [sp]
	bl sub_02077A8C
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	str r0, [sp, #8]
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009358
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #1
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02009B78: .word 0x00005C10
_02009B7C: .word 0x04000050
_02009B80: .word 0x04000040
_02009B84: .word 0xFFCFFFEF
_02009B88: .word 0x04001000
_02009B8C: .word 0x04001050
_02009B90: .word 0xFFFFCFFD
_02009B94: .word 0x04000304
	arm_func_end sub_02009648

	arm_func_start sub_02009B98
sub_02009B98: ; 0x02009B98
	ldr r2, _02009BBC ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009BBC ; =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BBC: .word 0x04000048
	arm_func_end sub_02009B98

	arm_func_start sub_02009BC0
sub_02009BC0: ; 0x02009BC0
	ldr r2, _02009BE4 ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009BE4 ; =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BE4: .word 0x04000048
	arm_func_end sub_02009BC0

	arm_func_start sub_02009BE8
sub_02009BE8: ; 0x02009BE8
	ldr r2, _02009C0C ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009C0C ; =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C0C: .word 0x0400004A
	arm_func_end sub_02009BE8

	arm_func_start sub_02009C10
sub_02009C10: ; 0x02009C10
	ldr r2, _02009C34 ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009C34 ; =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C34: .word 0x0400004A
	arm_func_end sub_02009C10

	arm_func_start sub_02009C38
sub_02009C38: ; 0x02009C38
	ldr r2, _02009C50 ; =0x0400000A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C50: .word 0x0400000A
	arm_func_end sub_02009C38

	arm_func_start sub_02009C54
sub_02009C54: ; 0x02009C54
	ldr r2, _02009C6C ; =0x04000008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C6C: .word 0x04000008
	arm_func_end sub_02009C54

	arm_func_start sub_02009C70
sub_02009C70: ; 0x02009C70
	ldr r2, _02009C88 ; =0x0400000C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C88: .word 0x0400000C
	arm_func_end sub_02009C70

	arm_func_start sub_02009C8C
sub_02009C8C: ; 0x02009C8C
	ldr r2, _02009CA4 ; =0x0400000E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009CA4: .word 0x0400000E
	arm_func_end sub_02009C8C

	arm_func_start sub_02009CA8
sub_02009CA8: ; 0x02009CA8
	ldr r2, _02009CCC ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009CCC ; =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CCC: .word 0x04001048
	arm_func_end sub_02009CA8

	arm_func_start sub_02009CD0
sub_02009CD0: ; 0x02009CD0
	ldr r2, _02009CF4 ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009CF4 ; =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CF4: .word 0x04001048
	arm_func_end sub_02009CD0

	arm_func_start sub_02009CF8
sub_02009CF8: ; 0x02009CF8
	ldr r2, _02009D1C ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009D1C ; =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D1C: .word 0x0400104A
	arm_func_end sub_02009CF8

	arm_func_start sub_02009D20
sub_02009D20: ; 0x02009D20
	ldr r2, _02009D44 ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009D44 ; =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D44: .word 0x0400104A
	arm_func_end sub_02009D20

	arm_func_start sub_02009D48
sub_02009D48: ; 0x02009D48
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02009D88
	ldr r0, _02009DBC ; =0x022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C54
	ldr r0, _02009DC0 ; =0x022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C38
	ldr r0, _02009DC4 ; =0x022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C70
	ldr r0, _02009DC8 ; =0x022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C8C
	ldmia sp!, {r4, pc}
_02009D88:
	ldr r0, _02009DBC ; =0x022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095AC
	ldr r0, _02009DC0 ; =0x022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095C8
	ldr r0, _02009DC4 ; =0x022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095E4
	ldr r0, _02009DC8 ; =0x022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009600
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009DBC: .word 0x022A37CC
_02009DC0: .word 0x022A37D0
_02009DC4: .word 0x022A37D4
_02009DC8: .word 0x022A37D8
	arm_func_end sub_02009D48

	arm_func_start sub_02009DCC
sub_02009DCC: ; 0x02009DCC
	ldr r1, _02009E58 ; =0x022A37AC
	add r3, r0, r0, lsl #2
	ldrb r2, [r1, r3]
	mov r1, #0x1f
	cmp r2, #0
	ldr r2, _02009E5C ; =0x022A37AD
	bicne r1, r1, #1
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E60 ; =0x022A37AE
	bicne r1, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E64 ; =0x022A37AF
	bicne r1, r1, #4
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E68 ; =0x022A37B0
	bicne r1, r1, #8
	ldrb r2, [r2, r3]
	cmp r2, #0
	bicne r1, r1, #0x10
	cmp r0, #0
	ldrne r2, _02009E6C ; =0x04001000
	ldrne r0, [r2]
	bicne r0, r0, #0x1f00
	orrne r0, r0, r1, lsl #8
	strne r0, [r2]
	bxne lr
	mov r2, #0x4000000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, r1, lsl #8
	str r0, [r2]
	bx lr
	.align 2, 0
_02009E58: .word 0x022A37AC
_02009E5C: .word 0x022A37AD
_02009E60: .word 0x022A37AE
_02009E64: .word 0x022A37AF
_02009E68: .word 0x022A37B0
_02009E6C: .word 0x04001000
	arm_func_end sub_02009DCC

	arm_func_start sub_02009E70
sub_02009E70: ; 0x02009E70
	stmdb sp!, {r3, lr}
	mov r1, #0xa
	mul r3, r0, r1
	ldr r2, _02009F78 ; =0x022A37B6
	mov r1, #0
	ldrb ip, [r2, r3]
	mov r2, #0x20
	cmp ip, #1
	orreq r1, r1, #1
	beq _02009EA0
	cmp ip, #2
	orreq r2, r2, #1
_02009EA0:
	ldr ip, _02009F7C ; =0x022A37B7
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #2
	beq _02009EBC
	cmp ip, #2
	orreq r2, r2, #2
_02009EBC:
	ldr ip, _02009F80 ; =0x022A37B8
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #4
	beq _02009ED8
	cmp ip, #2
	orreq r2, r2, #4
_02009ED8:
	ldr ip, _02009F84 ; =0x022A37B9
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #8
	beq _02009EF4
	cmp ip, #2
	orreq r2, r2, #8
_02009EF4:
	ldr ip, _02009F88 ; =0x022A37BA
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #0x10
	beq _02009F10
	cmp ip, #2
	orreq r2, r2, #0x10
_02009F10:
	cmp r0, #0
	bne _02009F48
	ldr r0, _02009F8C ; =0x022A37BE
	ldr ip, _02009F90 ; =0x022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F94 ; =0x04000050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl sub_020776E8
	ldmia sp!, {r3, pc}
_02009F48:
	ldr r0, _02009F8C ; =0x022A37BE
	ldr ip, _02009F90 ; =0x022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F98 ; =0x04001050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl sub_020776E8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009F78: .word 0x022A37B6
_02009F7C: .word 0x022A37B7
_02009F80: .word 0x022A37B8
_02009F84: .word 0x022A37B9
_02009F88: .word 0x022A37BA
_02009F8C: .word 0x022A37BE
_02009F90: .word 0x022A37BC
_02009F94: .word 0x04000050
_02009F98: .word 0x04001050
	arm_func_end sub_02009E70

	arm_func_start sub_02009F9C
sub_02009F9C: ; 0x02009F9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0x1b
	mul r4, r0, r1
	ldr r3, _0200A100 ; =0x022A37EC
	mov r2, #0
	ldrb r1, [r3, r4]
	add lr, r3, r4
	mov r3, #0
	cmp r1, #0
	ldr r1, _0200A104 ; =0x022A37ED
	orrne r2, r2, #1
	ldrb r1, [r1, r4]
	mov r5, r3
	mov r6, r3
	cmp r1, #0
	ldr r1, _0200A108 ; =0x022A37EE
	orrne r2, r2, #2
	ldrb r1, [r1, r4]
	mov ip, r3
	cmp r1, #0
	ldr r1, _0200A10C ; =0x02092A04
	orrne r2, r2, #4
_02009FF4:
	add r7, lr, ip
	ldrb r8, [r7, #7]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r3, r3, r8
	ldrb r8, [r7, #0xc]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r3, r3, r8
	ldrb r8, [r7, #0x16]
	ldrb r7, [r7, #0x11]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r6, r6, r8
	cmp r7, #0
	ldrne r7, [r1, ip, lsl #2]
	orrne r5, r5, r7
	add r7, ip, #1
	and ip, r7, #0xff
	cmp ip, #5
	blo _02009FF4
	cmp r0, #0
	bne _0200A0A8
	mov r7, #0x4000000
	ldr r1, [r7]
	ldr r0, _0200A110 ; =0x022A37EF
	bic r1, r1, #0xe000
	orr r1, r1, r2, lsl #13
	str r1, [r7]
	ldrb r1, [r0, r4]
	mov r0, r3
	bl sub_02009B98
	ldr r1, _0200A114 ; =0x022A37F0
	mov r0, #0
	ldrb r1, [r1, r4]
	bl sub_02009BC0
	ldr r1, _0200A118 ; =0x022A37F1
	mov r0, r5
	ldrb r1, [r1, r4]
	bl sub_02009BE8
	ldr r1, _0200A11C ; =0x022A37F2
	mov r0, r6
	ldrb r1, [r1, r4]
	bl sub_02009C10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A0A8:
	ldr ip, _0200A120 ; =0x04001000
	ldr r1, _0200A110 ; =0x022A37EF
	ldr r7, [ip]
	mov r0, r3
	bic r3, r7, #0xe000
	orr r2, r3, r2, lsl #13
	str r2, [ip]
	ldrb r1, [r1, r4]
	bl sub_02009CA8
	ldr r1, _0200A114 ; =0x022A37F0
	mov r0, #0
	ldrb r1, [r1, r4]
	bl sub_02009CD0
	ldr r1, _0200A118 ; =0x022A37F1
	mov r0, r5
	ldrb r1, [r1, r4]
	bl sub_02009CF8
	ldr r1, _0200A11C ; =0x022A37F2
	mov r0, r6
	ldrb r1, [r1, r4]
	bl sub_02009D20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200A100: .word 0x022A37EC
_0200A104: .word 0x022A37ED
_0200A108: .word 0x022A37EE
_0200A10C: .word 0x02092A04
_0200A110: .word 0x022A37EF
_0200A114: .word 0x022A37F0
_0200A118: .word 0x022A37F1
_0200A11C: .word 0x022A37F2
_0200A120: .word 0x04001000
	arm_func_end sub_02009F9C

	arm_func_start sub_0200A124
sub_0200A124: ; 0x0200A124
	stmdb sp!, {r4, lr}
	mov r4, r0
	stmia r4, {r1, r2}
	mov r0, #0
	strb r0, [r4, #8]
	ldr r1, [sp, #8]
	str r3, [r4, #0xc]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r4, #0x10]
	mov r0, r4
	bl sub_0200A274
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A124

	arm_func_start sub_0200A158
sub_0200A158: ; 0x0200A158
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A158

	arm_func_start sub_0200A174
sub_0200A174: ; 0x0200A174
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A174

	arm_func_start sub_0200A180
sub_0200A180: ; 0x0200A180
	bx lr
	arm_func_end sub_0200A180

	arm_func_start sub_0200A184
sub_0200A184: ; 0x0200A184
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x10]
	ldr r1, [r6, #4]
	mov r0, r4
	mov r1, r1, lsl #1
	ldr r5, [r6, #0xc]
	bl sub_0207A2DC
	ldr r0, [r6]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0200A1D4
_0200A1C0: ; jump table
	b _0200A1D4 ; case 0
	b _0200A1EC ; case 1
	b _0200A20C ; case 2
	b _0200A22C ; case 3
	b _0200A24C ; case 4
_0200A1D4:
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	b _0200A268
_0200A1EC:
	bl sub_020783D0
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl sub_02078470
	b _0200A268
_0200A20C:
	bl sub_020784B8
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl sub_02078500
	b _0200A268
_0200A22C:
	bl sub_02078544
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl sub_0207855C
	b _0200A268
_0200A24C:
	bl sub_0207859C
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl sub_020785B4
_0200A268:
	mov r0, #0
	strb r0, [r6, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A184

	arm_func_start sub_0200A274
sub_0200A274: ; 0x0200A274
	mov r3, #0
	ldr ip, [r0, #0x10]
	mov r2, r3
	b _0200A28C
_0200A284:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A28C:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A284
	bx lr
	arm_func_end sub_0200A274

	arm_func_start sub_0200A29C
sub_0200A29C: ; 0x0200A29C
	ldr r0, [r0, #0x10]
	ldr ip, _0200A2B0 ; =sub_02004FCC
	add r0, r0, r1, lsl #1
	mov r1, r2
	bx ip
	.align 2, 0
_0200A2B0: .word sub_02004FCC
	arm_func_end sub_0200A29C

	arm_func_start sub_0200A2B4
sub_0200A2B4: ; 0x0200A2B4
	ldr r3, [r0, #0x10]
	ldr ip, _0200A2C8 ; =sub_02004FF8
	mov r0, r1
	add r1, r3, r2, lsl #1
	bx ip
	.align 2, 0
_0200A2C8: .word sub_02004FF8
	arm_func_end sub_0200A2B4

	arm_func_start sub_0200A2CC
sub_0200A2CC: ; 0x0200A2CC
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A2CC

	arm_func_start sub_0200A2F4
sub_0200A2F4: ; 0x0200A2F4
	mov r1, #0
_0200A2F8:
	ldr r2, [r0, #0x24]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	cmp r2, #0
	movne r0, r2
	bne _0200A2F8
	bx lr
	arm_func_end sub_0200A2F4
_0200A314:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	beq _0200A330
	cmp r2, r1
	bxeq lr
	mov r0, r2
	b _0200A314
_0200A330:
	str r1, [r0, #0x24]
	str r0, [r1, #0x20]
	mov r0, #0
	str r0, [r1, #0x24]
	bx lr
_0200A344:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	bxeq lr
	cmp r2, r1
	movne r0, r2
	bne _0200A344
	ldr r2, [r1, #0x24]
	str r2, [r0, #0x24]
	cmp r2, #0
	strne r0, [r2, #0x20]
	mov r0, #0
	str r0, [r1, #0x20]
	str r0, [r1, #0x24]
	bx lr

	arm_func_start sub_0200A37C
sub_0200A37C: ; 0x0200A37C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r4, [r0, #0x24]
	b _0200A39C
_0200A38C:
	mov r0, r4
	mov r1, r5
	bl sub_0200A618
	ldr r4, [r4, #0x24]
_0200A39C:
	cmp r4, #0
	bne _0200A38C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A37C

	arm_func_start sub_0200A3A8
sub_0200A3A8: ; 0x0200A3A8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A3D0
_0200A3BC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A64C
	ldr r4, [r4, #0x24]
_0200A3D0:
	cmp r4, #0
	bne _0200A3BC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3A8

	arm_func_start sub_0200A3DC
sub_0200A3DC: ; 0x0200A3DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A404
_0200A3F0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A688
	ldr r4, [r4, #0x24]
_0200A404:
	cmp r4, #0
	bne _0200A3F0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3DC

	arm_func_start sub_0200A410
sub_0200A410: ; 0x0200A410
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A438
_0200A424:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A6C4
	ldr r4, [r4, #0x24]
_0200A438:
	cmp r4, #0
	bne _0200A424
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A410

	arm_func_start sub_0200A444
sub_0200A444: ; 0x0200A444
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A46C
_0200A458:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A700
	ldr r4, [r4, #0x24]
_0200A46C:
	cmp r4, #0
	bne _0200A458
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A444

	arm_func_start sub_0200A478
sub_0200A478: ; 0x0200A478
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	str r5, [r6]
	ldr r1, [sp, #0x10]
	str r3, [r6, #4]
	mov r0, r3, lsl #2
	mov r4, r2
	bl MemAlloc
	str r0, [r6, #0x18]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, r0, r4, lsl #1
	str r0, [r6, #0x1c]
	str r1, [r6, #0x20]
	mov r0, r6
	str r1, [r6, #0x24]
	bl sub_0200A544
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A478

	arm_func_start sub_0200A4C4
sub_0200A4C4: ; 0x0200A4C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	cmp r1, #0
	strne r2, [r1, #0x24]
	cmp r2, #0
	strne r1, [r2, #0x20]
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A4C4

	arm_func_start sub_0200A504
sub_0200A504: ; 0x0200A504
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A504

	arm_func_start sub_0200A510
sub_0200A510: ; 0x0200A510
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4, #8]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	strb r0, [r4, #8]
	ldr r0, [r4]
	mov r1, #1
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A510

	arm_func_start sub_0200A544
sub_0200A544: ; 0x0200A544
	mov ip, #0
	ldr r3, [r0, #0x18]
	mov r2, ip
	b _0200A56C
_0200A554:
	mov r1, r3
	strb r2, [r3], #4
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	add ip, ip, #1
_0200A56C:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200A554
	ldr r2, _0200A58C ; =sub_0200A73C
	mov r1, #1
	str r2, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A58C: .word sub_0200A73C
	arm_func_end sub_0200A544

	arm_func_start sub_0200A590
sub_0200A590: ; 0x0200A590
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r1, r0, r1, lsl #2
_0200A59C:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A59C
	bx lr
	arm_func_end sub_0200A590

	arm_func_start sub_0200A5B0
sub_0200A5B0: ; 0x0200A5B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x18]
	mov lr, #0
	add ip, r0, r1, lsl #2
	b _0200A5EC
_0200A5C4:
	mov r4, r2
	mov r5, ip
	add r2, r2, #4
	add ip, ip, #4
	mov r1, #4
_0200A5D8:
	ldrb r0, [r4], #1
	subs r1, r1, #1
	strb r0, [r5], #1
	bne _0200A5D8
	add lr, lr, #1
_0200A5EC:
	cmp lr, r3
	blt _0200A5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A5B0

	arm_func_start sub_0200A5F8
sub_0200A5F8: ; 0x0200A5F8
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r2, r0, r2, lsl #2
_0200A604:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A604
	bx lr
	arm_func_end sub_0200A5F8

	arm_func_start sub_0200A618
sub_0200A618: ; 0x0200A618
	strh r1, [r0, #0xa]
	mov r2, #0
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	ldr r1, _0200A648 ; =sub_0200A78C
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A648: .word sub_0200A78C
	arm_func_end sub_0200A618

	arm_func_start sub_0200A64C
sub_0200A64C: ; 0x0200A64C
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A658:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A658
	mov r2, #0
	ldr r1, _0200A684 ; =sub_0200A9E4
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A684: .word sub_0200A9E4
	arm_func_end sub_0200A64C

	arm_func_start sub_0200A688
sub_0200A688: ; 0x0200A688
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A694:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A694
	mov r2, #0
	ldr r1, _0200A6C0 ; =sub_0200ACB0
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6C0: .word sub_0200ACB0
	arm_func_end sub_0200A688

	arm_func_start sub_0200A6C4
sub_0200A6C4: ; 0x0200A6C4
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A6D0:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A6D0
	mov r2, #0
	ldr r1, _0200A6FC ; =sub_0200AE38
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6FC: .word sub_0200AE38
	arm_func_end sub_0200A6C4

	arm_func_start sub_0200A700
sub_0200A700: ; 0x0200A700
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A70C:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A70C
	mov r2, #0
	ldr r1, _0200A738 ; =sub_0200B0AC
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A738: .word sub_0200B0AC
	arm_func_end sub_0200A700

	arm_func_start sub_0200A73C
sub_0200A73C: ; 0x0200A73C
	stmdb sp!, {r4, lr}
	ldr ip, [r0, #0x18]
	ldr lr, [r0, #0x1c]
	mov r4, #0
	b _0200A77C
_0200A750:
	ldrb r1, [ip, #1]
	ldrb r2, [ip, #2]
	ldrb r3, [ip], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r3, r3, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r3, asr #3
	strh r1, [lr], #2
	add r4, r4, #1
_0200A77C:
	ldr r1, [r0, #4]
	cmp r4, r1
	blt _0200A750
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A73C

	arm_func_start sub_0200A78C
sub_0200A78C: ; 0x0200A78C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r2, [r0, #0xa]
	ldr r1, [r0]
	ldr r3, [r0, #0x18]
	cmp r2, #0x100
	ldr r1, [r1]
	ldr ip, [r0, #0x1c]
	blo _0200A7F0
	mov r5, #0
	b _0200A7E0
_0200A7B4:
	ldrb r1, [r3, #1]
	ldrb r2, [r3, #2]
	ldrb r4, [r3], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r4, r4, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add r5, r5, #1
_0200A7E0:
	ldr r1, [r0, #4]
	cmp r5, r1
	blt _0200A7B4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A7F0:
	cmp r2, #0
	bne _0200A898
	cmp r1, #2
	bne _0200A874
	mov lr, #0
	mov r1, lr
	mov r2, lr
	b _0200A864
_0200A810:
	mov r4, r2
_0200A814:
	add r4, r4, #1
	cmp r4, #0xf0
	strh r1, [ip], #2
	add lr, lr, #1
	blt _0200A814
	mov r4, r1
_0200A82C:
	ldrb r5, [r3, #1]
	ldrb r6, [r3, #2]
	ldrb r7, [r3], #4
	and r5, r5, #0xf8
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	add r4, r4, #1
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	cmp r4, #0x10
	strh r5, [ip], #2
	add lr, lr, #1
	blt _0200A82C
_0200A864:
	ldr r4, [r0, #4]
	cmp lr, r4
	blt _0200A810
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A874:
	mov r3, #0
	mov r2, r3
	b _0200A888
_0200A880:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A888:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A880
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A898:
	cmp r1, #2
	mov lr, #0
	bne _0200A9D4
	b _0200A95C
_0200A8A8:
	mov r4, #0
_0200A8AC:
	ldrb r1, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	mul r7, r1, r2
	mul r8, r5, r2
	mul r1, r6, r2
	mov r5, r7, asr #7
	add r7, r7, r5, lsr #24
	mov r6, r8, asr #7
	mov r5, r1, asr #7
	add r1, r1, r5, lsr #24
	add r6, r8, r6, lsr #24
	mov r1, r1, lsl #8
	add r4, r4, #1
	mov r7, r7, lsl #8
	mov r5, r6, lsl #8
	mov r6, r7, lsr #0x10
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r1, lsr #0x10
	mov r1, r5, lsl #2
	and r6, r7, #0xf8
	and r5, r8, #0xf8
	orr r1, r1, r6, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [ip], #2
	cmp r4, #0xf0
	add lr, lr, #1
	blt _0200A8AC
	mov r1, #0
_0200A924:
	ldrb r4, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	and r4, r4, #0xf8
	and r5, r5, #0xf8
	mov r4, r4, lsl #2
	add r1, r1, #1
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	cmp r1, #0x10
	strh r4, [ip], #2
	add lr, lr, #1
	blt _0200A924
_0200A95C:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A8A8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A96C:
	ldrb r1, [r3, #1]
	ldrb r4, [r3, #2]
	ldrb r5, [r3], #4
	mul r6, r1, r2
	mul r7, r4, r2
	mul r1, r5, r2
	mov r4, r6, asr #7
	add r6, r6, r4, lsr #24
	mov r5, r7, asr #7
	mov r4, r1, asr #7
	add r1, r1, r4, lsr #24
	add r5, r7, r5, lsr #24
	mov r1, r1, lsl #8
	mov r6, r6, lsl #8
	mov r4, r5, lsl #8
	mov r5, r6, lsr #0x10
	mov r6, r4, lsr #0x10
	and r4, r5, #0xf8
	mov r7, r1, lsr #0x10
	mov r1, r4, lsl #2
	and r5, r6, #0xf8
	and r4, r7, #0xf8
	orr r1, r1, r5, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add lr, lr, #1
_0200A9D4:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A96C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200A78C

	arm_func_start sub_0200A9E4
sub_0200A9E4: ; 0x0200A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, [r0]
	ldrh r5, [r0, #0xa]
	ldr r1, [r1]
	add r4, sp, #0
	add r6, r0, #0xc
	mov r3, #4
_0200AA00:
	ldrb r2, [r6], #1
	subs r3, r3, #1
	strb r2, [r4], #1
	bne _0200AA00
	cmp r5, #0x100
	ldr r2, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AA64
	mov r6, #0
	b _0200AA54
_0200AA28:
	ldrb r1, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r5, [r2], #4
	and r1, r1, #0xf8
	and r3, r3, #0xf8
	mov r1, r1, lsl #2
	and r5, r5, #0xf8
	orr r1, r1, r3, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [r4], #2
	add r6, r6, #1
_0200AA54:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AA28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AA64:
	cmp r5, #0
	bne _0200AB38
	ldrb r3, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r3, r3, #0xf8
	and r5, r5, #0xf8
	mov r3, r3, lsl #2
	and r6, r6, #0xf8
	orr r3, r3, r5, lsl #7
	orr r3, r3, r6, asr #3
	mov r3, r3, lsl #0x10
	cmp r1, #2
	mov r5, r3, lsr #0x10
	bne _0200AB18
	mov r6, #0
	mov r3, r6
	mov r1, r6
	b _0200AB08
_0200AAB0:
	mov r7, r3
_0200AAB4:
	add r7, r7, #1
	cmp r7, #0xf0
	strh r5, [r4], #2
	add r2, r2, #4
	add r6, r6, #1
	blt _0200AAB4
	mov r7, r1
_0200AAD0:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb sl, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	add r7, r7, #1
	and sl, sl, #0xf8
	orr r8, r8, sb, lsl #7
	orr r8, r8, sl, asr #3
	cmp r7, #0x10
	strh r8, [r4], #2
	add r6, r6, #1
	blt _0200AAD0
_0200AB08:
	ldr r7, [r0, #4]
	cmp r6, r7
	blt _0200AAB0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB18:
	mov r2, #0
	b _0200AB28
_0200AB20:
	strh r5, [r4], #2
	add r2, r2, #1
_0200AB28:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AB20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB38:
	rsb r3, r5, #0x100
	mov r3, r3, lsl #0x10
	ldrb r8, [sp]
	mov sb, r3, lsr #0x10
	ldrb r7, [sp, #1]
	ldrb r6, [sp, #2]
	mul r3, r8, sb
	mul ip, r7, sb
	mul lr, r6, sb
	cmp r1, #2
	bne _0200AC30
	mov r6, #0
	b _0200AC20
_0200AB6C:
	mov r7, #0
_0200AB70:
	ldrb r1, [r2, #1]
	ldrb fp, [r2, #2]
	ldrb sb, [r2], #4
	mla sl, r1, r5, ip
	mla r8, fp, r5, lr
	mla r1, sb, r5, r3
	mov sb, sl, asr #7
	add sb, sl, sb, lsr #24
	mov fp, r8, asr #7
	add r8, r8, fp, lsr #24
	mov sl, r1, asr #7
	mov sb, sb, lsl #8
	add r1, r1, sl, lsr #24
	mov r8, r8, lsl #8
	mov r1, r1, lsl #8
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	mov sb, sb, lsr #0x10
	mov sl, r8, lsr #0x10
	and r8, sb, #0xf8
	and sb, sl, #0xf8
	mov r8, r8, lsl #2
	and r1, r1, #0xf8
	orr r8, r8, sb, lsl #7
	orr r1, r8, r1, asr #3
	strh r1, [r4], #2
	cmp r7, #0xf0
	add r6, r6, #1
	blt _0200AB70
	mov r7, #0
_0200ABE8:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb r1, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	and sl, r1, #0xf8
	orr r1, r8, sb, lsl #7
	add r7, r7, #1
	orr r1, r1, sl, asr #3
	cmp r7, #0x10
	strh r1, [r4], #2
	add r6, r6, #1
	blt _0200ABE8
_0200AC20:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AB6C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AC30:
	mov r7, #0
	b _0200ACA0
_0200AC38:
	ldrb r1, [r2, #1]
	ldrb r6, [r2, #2]
	ldrb r8, [r2], #4
	mla sl, r1, r5, ip
	mla r1, r6, r5, lr
	mla r6, r8, r5, r3
	mov r8, sl, asr #7
	add sl, sl, r8, lsr #24
	mov sb, r1, asr #7
	mov r8, r6, asr #7
	add sb, r1, sb, lsr #24
	add r1, r6, r8, lsr #24
	mov sl, sl, lsl #8
	mov r6, sb, lsl #8
	mov r8, sl, lsr #0x10
	mov r1, r1, lsl #8
	mov sb, r6, lsr #0x10
	and r6, r8, #0xf8
	mov sl, r1, lsr #0x10
	mov r1, r6, lsl #2
	and r8, sb, #0xf8
	and r6, sl, #0xf8
	orr r1, r1, r8, lsl #7
	orr r1, r1, r6, asr #3
	strh r1, [r4], #2
	add r7, r7, #1
_0200ACA0:
	ldr r1, [r0, #4]
	cmp r7, r1
	blt _0200AC38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200A9E4

	arm_func_start sub_0200ACB0
sub_0200ACB0: ; 0x0200ACB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r1, [r0]
	ldrh r2, [r0, #0xa]
	ldr r1, [r1]
	add r5, sp, #0
	add r6, r0, #0xc
	mov r4, #4
_0200ACD0:
	ldrb r3, [r6], #1
	subs r4, r4, #1
	strb r3, [r5], #1
	bne _0200ACD0
	cmp r2, #0x100
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AD20
	ldrb r2, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r2, r2, #0xf8
	and r5, r5, #0xf8
	mov r2, r2, lsl #2
	and r6, r6, #0xf8
	orr r2, r2, r5, lsl #7
	orr r2, r2, r6, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	b _0200AD94
_0200AD20:
	cmp r2, #0
	moveq ip, #0
	beq _0200AD94
	ldrb r5, [sp, #1]
	ldrb r7, [sp, #2]
	ldrb ip, [sp]
	mul r6, r5, r2
	mul r8, r7, r2
	mul r7, ip, r2
	mov r2, r6, asr #7
	mov r5, r8, asr #7
	add ip, r6, r2, lsr #24
	mov r2, r7, asr #7
	add r5, r8, r5, lsr #24
	mov ip, ip, lsl #8
	add r2, r7, r2, lsr #24
	mov r5, r5, lsl #8
	mov r6, ip, lsr #0x10
	mov r2, r2, lsl #8
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r2, lsr #0x10
	and r6, r7, #0xf8
	mov r2, r5, lsl #2
	and r5, r8, #0xf8
	orr r2, r2, r6, lsl #7
	orr r2, r2, r5, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
_0200AD94:
	cmp r1, #2
	bne _0200AE14
	mov lr, #0
	mov r2, lr
	mov r1, lr
	b _0200AE04
_0200ADAC:
	mov r5, r2
_0200ADB0:
	add r5, r5, #1
	cmp r5, #0xf0
	strh ip, [r4], #2
	add r3, r3, #4
	add lr, lr, #1
	blt _0200ADB0
	mov r5, r1
_0200ADCC:
	ldrb r6, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r8, [r3], #4
	and r6, r6, #0xf8
	and r7, r7, #0xf8
	mov r6, r6, lsl #2
	add r5, r5, #1
	and r8, r8, #0xf8
	orr r6, r6, r7, lsl #7
	orr r6, r6, r8, asr #3
	cmp r5, #0x10
	strh r6, [r4], #2
	add lr, lr, #1
	blt _0200ADCC
_0200AE04:
	ldr r5, [r0, #4]
	cmp lr, r5
	blt _0200ADAC
	b _0200AE30
_0200AE14:
	mov r2, #0
	b _0200AE24
_0200AE1C:
	strh ip, [r4], #2
	add r2, r2, #1
_0200AE24:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AE1C
_0200AE30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200ACB0

	arm_func_start sub_0200AE38
sub_0200AE38: ; 0x0200AE38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r1, [sl]
	ldrh r0, [sl, #0xa]
	ldr fp, [r1]
	add r3, sp, #0x14
	add r4, sl, #0xc
	mov r2, #4
_0200AE5C:
	ldrb r1, [r4], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _0200AE5C
	cmp r0, #0x100
	ldr r4, [sl, #0x18]
	ldr r5, [sl, #0x1c]
	blo _0200AEC0
	mov r3, #0
	b _0200AEB0
_0200AE84:
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r4], #4
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	and r2, r2, #0xf8
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [r5], #2
	add r3, r3, #1
_0200AEB0:
	ldr r0, [sl, #4]
	cmp r3, r0
	blt _0200AE84
	b _0200B0A4
_0200AEC0:
	ldrb sb, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	ldrb r3, [sp, #0x16]
	rsb r6, sb, #0xff
	mul r8, r6, r0
	rsb r2, r7, #0xff
	mov ip, r8, asr #7
	add r8, r8, ip, lsr #24
	add r8, sb, r8, asr #8
	rsb r1, r3, #0xff
	mul r6, r2, r0
	mul r2, r1, r0
	mov r0, r6, asr #7
	mov r1, r2, asr #7
	add r0, r6, r0, lsr #24
	add r1, r2, r1, lsr #24
	add r6, r7, r0, asr #8
	add r2, r3, r1, asr #8
	mov r0, r8, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r2, r2, lsl #0x10
	cmp fp, #2
	mov r8, r0, lsr #0x10
	mov r6, r1, lsr #0x10
	mov r7, r2, lsr #0x10
	mov sb, #0
	bne _0200B098
	b _0200B004
_0200AF30:
	mov fp, #0
_0200AF34:
	ldrb r2, [r4]
	str r5, [sp]
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl DivideInt
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r7
	bl DivideInt
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r6
	bl DivideInt
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add sb, sb, #1
	blt _0200AF34
	mov r1, #0
_0200AFCC:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r5], #2
	add sb, sb, #1
	blt _0200AFCC
_0200B004:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200AF30
	b _0200B0A4
_0200B014:
	ldrb r2, [r4]
	mov fp, r5
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl DivideInt
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r7
	bl DivideInt
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r6
	bl DivideInt
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add sb, sb, #1
_0200B098:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200B014
_0200B0A4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200AE38

	arm_func_start sub_0200B0AC
sub_0200B0AC: ; 0x0200B0AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r0, [sl]
	ldrh r3, [sl, #0xa]
	ldr r2, [r0]
	add r4, sp, #0x14
	add r5, sl, #0xc
	mov r1, #4
_0200B0D0:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r4], #1
	bne _0200B0D0
	ldrb r0, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	cmp r3, #0x100
	movhs r3, #0x100
	ldrb r5, [sp, #0x16]
	mul r1, r0, r3
	mul r0, r7, r3
	mul r8, r5, r3
	mov r3, r1, asr #7
	mov r5, r0, asr #7
	add r1, r1, r3, lsr #24
	add r3, r0, r5, lsr #24
	mov r0, r1, lsl #8
	mov r7, r8, asr #7
	add r5, r8, r7, lsr #24
	mov r1, r3, lsl #8
	mov r3, r5, lsl #8
	ldr r4, [sl, #0x18]
	ldr r6, [sl, #0x1c]
	cmp r2, #2
	mov sb, r0, lsr #0x10
	mov r7, r1, lsr #0x10
	mov r8, r3, lsr #0x10
	mov r5, #0
	bne _0200B2B0
	b _0200B21C
_0200B148:
	mov fp, #0
_0200B14C:
	ldrb r2, [r4]
	str r6, [sp]
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl DivideInt
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r8
	bl DivideInt
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r7
	bl DivideInt
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add r5, r5, #1
	blt _0200B14C
	mov r1, #0
_0200B1E4:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r6], #2
	add r5, r5, #1
	blt _0200B1E4
_0200B21C:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B148
	b _0200B2BC
_0200B22C:
	ldrb r2, [r4]
	mov fp, r6
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl DivideInt
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r8
	bl DivideInt
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r7
	bl DivideInt
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add r5, r5, #1
_0200B2B0:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B22C
_0200B2BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200B0AC

	arm_func_start sub_0200B2C4
sub_0200B2C4: ; 0x0200B2C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	strb r1, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	str r3, [r4, #0x10]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r2, [r4, #0xc]
	ldrb r2, [r4]
	ldr r0, _0200B310 ; =0x02092AD8
	ldr r1, [sp, #8]
	ldr r0, [r0, r2, lsl #2]
	str r0, [r4, #0x14]
	bl MemAlloc
	str r0, [r4, #0x18]
	mov r0, r4
	bl sub_0200B3D4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B310: .word 0x02092AD8
	arm_func_end sub_0200B2C4

	arm_func_start sub_0200B314
sub_0200B314: ; 0x0200B314
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B314

	arm_func_start sub_0200B330
sub_0200B330: ; 0x0200B330
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	arm_func_end sub_0200B330

	arm_func_start sub_0200B33C
sub_0200B33C: ; 0x0200B33C
	bx lr
	arm_func_end sub_0200B33C

	arm_func_start sub_0200B340
sub_0200B340: ; 0x0200B340
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _0200B3BC ; =0x000001FF
	ldmib r4, {r1, r2}
	and r1, r1, r0
	mov r2, r2, lsl #0x17
	ldr r0, [r4, #0xc]
	orr r1, r1, r2, lsr #7
	str r1, [r0]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200B3B4
	ldr r5, [r4, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	ldr r6, [r4, #0x10]
	bl sub_0207A2DC
	ldr ip, [r4, #0x14]
	mov r2, r6
	mov r3, r5
	mov r0, #3
	mov r1, #1
	str ip, [sp]
	bl sub_02005E10
	mov r0, #3
	bl sub_02005D30
	mov r0, #0
	strb r0, [r4, #1]
_0200B3B4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200B3BC: .word 0x000001FF
	arm_func_end sub_0200B340

	arm_func_start sub_0200B3C0
sub_0200B3C0: ; 0x0200B3C0
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0200B3C0

	arm_func_start sub_0200B3D4
sub_0200B3D4: ; 0x0200B3D4
	mov r3, #0
	ldr ip, [r0, #0x18]
	mov r2, r3
	b _0200B3EC
_0200B3E4:
	strh r2, [ip], #2
	add r3, r3, #1
_0200B3EC:
	ldr r1, [r0, #0x14]
	cmp r3, r1, lsr #1
	blo _0200B3E4
	bx lr
	arm_func_end sub_0200B3D4

	arm_func_start sub_0200B3FC
sub_0200B3FC: ; 0x0200B3FC
	ldrb r3, [r0]
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	bx lr
_0200B40C: ; jump table
	b _0200B41C ; case 0
	b _0200B438 ; case 1
	b _0200B470 ; case 2
	b _0200B48C ; case 3
_0200B41C:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B438:
	ldr ip, [r1]
	ldr r3, [r0, #0x18]
	cmp ip, #0x20
	ldrlt r0, [r1, #4]
	movlt r1, ip, lsl #1
	addlt r0, r3, r0, lsl #6
	strlth r2, [r1, r0]
	bxlt lr
	ldr r0, [r1, #4]
	add r0, r3, r0, lsl #6
	add r0, r0, ip, lsl #1
	add r0, r0, #0x700
	strh r2, [r0, #0xc0]
	bx lr
_0200B470:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B48C:
	ldr ip, [r1, #4]
	cmp ip, #0x40
	bge _0200B4C4
	ldr r1, [r1]
	ldr r0, [r0, #0x18]
	cmp r1, #0x20
	movlt r1, r1, lsl #1
	addlt r0, r0, ip, lsl #6
	strlth r2, [r1, r0]
	addge r0, r0, ip, lsl #6
	addge r0, r0, r1, lsl #1
	addge r0, r0, #0x700
	strgeh r2, [r0, #0xc0]
	bx lr
_0200B4C4:
	ldr r3, [r1]
	ldr r1, [r0, #0x18]
	cmp r3, #0x20
	subge r0, ip, #0x20
	addge r0, r1, r0, lsl #6
	addge r0, r0, r3, lsl #1
	addge r0, r0, #0x1700
	strgeh r2, [r0, #0xc0]
	bxge lr
	sub r0, ip, #0x20
	add r0, r1, r0, lsl #6
	add r0, r0, r3, lsl #1
	add r0, r0, #0x1000
	strh r2, [r0]
	bx lr
	arm_func_end sub_0200B3FC

	arm_func_start sub_0200B500
sub_0200B500: ; 0x0200B500
	ldr r0, [r0, #0x18]
	bx lr
	arm_func_end sub_0200B500

	arm_func_start sub_0200B508
sub_0200B508: ; 0x0200B508
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	str r2, [r5, #4]
	mov r0, #0
	strb r0, [r5, #0x14]
	str r3, [r5, #0x18]
	cmp r2, #0
	strle r0, [r5, #0xc]
	ble _0200B550
	ldr r1, [sp, #0x10]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r5, #0xc]
	ldr r1, [sp, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
_0200B550:
	ldr r1, [sp, #0x10]
	str r0, [r5, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
	str r0, [r5, #0x1c]
	mov r0, r5
	bl sub_0200B67C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B508

	arm_func_start sub_0200B570
sub_0200B570: ; 0x0200B570
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
	arm_func_end sub_0200B570

	arm_func_start sub_0200B57C
sub_0200B57C: ; 0x0200B57C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0, #8]
	cmp ip, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr r3, [r0]
	ldr r2, [r0, #0x1c]
	sub r1, r3, #1
	add lr, r2, r1, lsl #3
	sub r3, r3, ip
	ldr r4, [r0, #0xc]
	mov r2, #0x200
	mov r1, #0
	b _0200B5C4
_0200B5B0:
	strh r2, [lr]
	strh r1, [lr, #2]
	strh r1, [lr, #4]
	sub lr, lr, #8
	sub r3, r3, #1
_0200B5C4:
	cmp r3, #0
	bgt _0200B5B0
	ldr r5, [r0, #4]
	mvn r3, #0
	b _0200B61C
_0200B5D8:
	ldrsh ip, [r4]
	strh r3, [r4], #2
	b _0200B610
_0200B5E4:
	ldr r2, [r0, #0x10]
	mov r1, ip, lsl #3
	ldrh r1, [r2, r1]
	add r2, r2, ip, lsl #3
	strh r1, [lr]
	ldrh r1, [r2, #2]
	strh r1, [lr, #2]
	ldrh r1, [r2, #4]
	strh r1, [lr, #4]
	ldrsh ip, [r2, #6]
	sub lr, lr, #8
_0200B610:
	cmp ip, #0
	bge _0200B5E4
	sub r5, r5, #1
_0200B61C:
	cmp r5, #0
	bgt _0200B5D8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B57C

	arm_func_start sub_0200B630
sub_0200B630: ; 0x0200B630
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x1c]
	ldr r1, [r6]
	mov r0, r4
	mov r1, r1, lsl #3
	ldr r5, [r6, #0x18]
	bl sub_0207A2DC
	ldr r2, [r6]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #3
	bl Memcpy32
	mov r0, #0
	strb r0, [r6, #0x14]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200B630

	arm_func_start sub_0200B67C
sub_0200B67C: ; 0x0200B67C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x1c]
	mov lr, #0
	str lr, [r0, #8]
	mov r3, #0x200
	mov r2, lr
	b _0200B6B0
_0200B698:
	strh r3, [ip]
	strh r2, [ip, #2]
	strh r2, [ip, #4]
	strh r2, [ip, #6]
	add ip, ip, #8
	add lr, lr, #1
_0200B6B0:
	ldr r1, [r0]
	cmp lr, r1
	blt _0200B698
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmleia sp!, {r3, pc}
	ldr r3, [r0, #0xc]
	mov ip, #0
	mvn r2, #0
	b _0200B6E0
_0200B6D8:
	strh r2, [r3], #2
	add ip, ip, #1
_0200B6E0:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200B6D8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200B67C

	arm_func_start sub_0200B6F0
sub_0200B6F0: ; 0x0200B6F0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r3, [r0]
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
	cmp r2, #0
	movlt r2, #0
	blt _0200B71C
	ldr r3, [r0, #4]
	cmp r2, r3
	subge r2, r3, #1
_0200B71C:
	ldrh r3, [r1]
	ldr lr, [r0, #0x10]
	mov ip, r4, lsl #3
	strh r3, [lr, ip]
	ldrh ip, [r1, #2]
	add lr, lr, r4, lsl #3
	mov r3, r2, lsl #1
	strh ip, [lr, #2]
	ldrh r1, [r1, #4]
	strh r1, [lr, #4]
	ldr r1, [r0, #0xc]
	ldrsh r1, [r1, r3]
	strh r1, [lr, #6]
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	strh r2, [r0, r3]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B6F0

	arm_func_start sub_0200B768
sub_0200B768: ; 0x0200B768
	bx lr
	arm_func_end sub_0200B768

	arm_func_start sub_0200B76C
sub_0200B76C: ; 0x0200B76C
	stmdb sp!, {r4, lr}
	bl sub_0207621C
	ldr r2, _0200B874 ; =0x04001000
	mov r0, #3
	ldr r1, [r2]
	bic r1, r1, #0x10000
	str r1, [r2]
	bl sub_0207C164
	bl sub_0207729C
	bl sub_020772B0
	bl sub_020772C4
	bl sub_020772E8
	bl sub_0207730C
	bl sub_02077320
	bl sub_02077370
	bl sub_02077384
	bl sub_02077398
	ldr r0, _0200B878 ; =0x000001FF
	bl sub_02076E90
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl sub_0207C358
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0xc0
	ldr r1, _0200B87C ; =0x07000400
	mov r2, #0x400
	bl sub_0207C358
	mov r0, #0
	ldr r1, _0200B880 ; =0x05000400
	mov r2, #0x400
	bl sub_0207C358
	bl sub_02019304
	mov r4, r0
	ldr r1, _0200B884 ; =0x02092AE8
	mov r2, #0xc000
	bl MemcpySimple
	mov r2, r4
	ldr r0, _0200B888 ; =0x06806000
	mov r1, #0xc000
	bl DecompressAtFromMemoryPointer
	mov r0, #2
	mov r1, #0
	mov r2, r1
	bl sub_020762A0
	mov r0, #0
	bl sub_02076308
	ldr r0, _0200B88C ; =0x0400006C
	mov r1, #0
	bl sub_02076324
	ldr r0, _0200B890 ; =0x0400106C
	mov r1, #0
	bl sub_02076324
	bl sub_02076258
	ldr r1, _0200B874 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B874: .word 0x04001000
_0200B878: .word 0x000001FF
_0200B87C: .word 0x07000400
_0200B880: .word 0x05000400
_0200B884: .word 0x02092AE8
_0200B888: .word 0x06806000
_0200B88C: .word 0x0400006C
_0200B890: .word 0x0400106C
	arm_func_end sub_0200B76C

	arm_func_start sub_0200B894
sub_0200B894: ; 0x0200B894
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x1c
	bl sub_0200A2CC
	mov r0, r5
	mov r1, r4
	bl sub_0200B8D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B894

	arm_func_start sub_0200B8B8
sub_0200B8B8: ; 0x0200B8B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	bl sub_0200B8D4
	add r0, r4, #0x1c
	bl sub_0200A2F4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B8B8

	arm_func_start sub_0200B8D4
sub_0200B8D4: ; 0x0200B8D4
	ldr r2, _0200B904 ; =0x02094AE8
	mov r1, r1, lsl #1
	mov r3, #0
	ldrsh r1, [r2, r1]
	str r3, [r0]
	mov r2, #1
	str r2, [r0, #4]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x14]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	bx lr
	.align 2, 0
_0200B904: .word 0x02094AE8
	arm_func_end sub_0200B8D4

	arm_func_start sub_0200B908
sub_0200B908: ; 0x0200B908
	ldr ip, _0200B914 ; =_0200A314
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B914: .word _0200A314
	arm_func_end sub_0200B908

	arm_func_start sub_0200B918
sub_0200B918: ; 0x0200B918
	ldr ip, _0200B924 ; =_0200A344
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B924: .word _0200A344
	arm_func_end sub_0200B918

	arm_func_start sub_0200B928
sub_0200B928: ; 0x0200B928
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200B958
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200B958:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #2
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #3
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200B928

	arm_func_start sub_0200B990
sub_0200B990: ; 0x0200B990
	ldr r3, _0200BA00 ; =0x02094AE8
	mov ip, r1, lsl #1
	ldrsh r3, [r3, ip]
	cmp r2, #0
	strh r3, [r0, #0x10]
	ldrnesh r3, [r0, #0x10]
	ldrnesh ip, [r0, #0x14]
	cmpne ip, r3
	bne _0200B9D4
	ldrsh r3, [r0, #0x10]
	mov r2, #1
	mov r1, #0
	strh r3, [r0, #0x14]
	str r2, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
_0200B9D4:
	cmp r2, #0
	movlt r2, #0x1e
	cmp r3, #0
	sublt r3, ip, r3
	subge r3, r3, ip
	strh r3, [r0, #0x12]
	ldr r3, _0200BA04 ; =0x02094AF0
	ldr r1, [r3, r1, lsl #2]
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0200BA00: .word 0x02094AE8
_0200BA04: .word 0x02094AF0
	arm_func_end sub_0200B990

	arm_func_start sub_0200BA08
sub_0200BA08: ; 0x0200BA08
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0200BB58
_0200BA20: ; jump table
	b _0200BB50 ; case 0
	b _0200BB40 ; case 1
	b _0200BA38 ; case 2
	b _0200BA80 ; case 3
	b _0200BAC8 ; case 4
	b _0200BB04 ; case 5
_0200BA38:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BA78
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl DivideInt
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
	strh r0, [r4, #0x14]
_0200BA78:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BA80:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BAC0
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl DivideInt
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
	strh r0, [r4, #0x14]
_0200BAC0:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BAC8:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BAF8
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl DivideInt
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
_0200BAF8:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB04:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BB34
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl DivideInt
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
_0200BB34:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB40:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB50:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0200BB58:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BA08

	arm_func_start sub_0200BB60
sub_0200BB60: ; 0x0200BB60
	ldr ip, _0200BB70 ; =sub_0200B928
	mov r2, #1
	str r2, [r0]
	bx ip
	.align 2, 0
_0200BB70: .word sub_0200B928
	arm_func_end sub_0200BB60

	arm_func_start sub_0200BB74
sub_0200BB74: ; 0x0200BB74
	ldr ip, _0200BB84 ; =sub_0200B990
	mov r3, #1
	str r3, [r0]
	bx ip
	.align 2, 0
_0200BB84: .word sub_0200B990
	arm_func_end sub_0200BB74

	arm_func_start sub_0200BB88
sub_0200BB88: ; 0x0200BB88
	mov r2, #1
	str r2, [r0]
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200BBC0
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200BBC0:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #4
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #5
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200BB88

	arm_func_start sub_0200BBF8
sub_0200BBF8: ; 0x0200BBF8
	mov ip, #1
	cmp r1, #0
	movlt r1, #0x1e
	str ip, [r0]
	cmp r2, r3
	movgt ip, #3
	strgt ip, [r0, #4]
	subgt ip, r2, r3
	strgth ip, [r0, #0x12]
	bgt _0200BC40
	movlt ip, #2
	strlt ip, [r0, #4]
	sublt ip, r3, r2
	strlth ip, [r0, #0x12]
	movge ip, #1
	strge ip, [r0, #4]
	movge ip, #0
	strgeh ip, [r0, #0x12]
_0200BC40:
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strh r2, [r0, #0x14]
	strh r3, [r0, #0x10]
	bx lr
	arm_func_end sub_0200BBF8

	arm_func_start sub_0200BC54
sub_0200BC54: ; 0x0200BC54
	ldr ip, _0200BC5C ; =sub_0200BA08
	bx ip
	.align 2, 0
_0200BC5C: .word sub_0200BA08
	arm_func_end sub_0200BC54

	arm_func_start sub_0200BC60
sub_0200BC60: ; 0x0200BC60
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BC70:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BC70
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BCA4
	mov r1, #2
	bl sub_0200B990
	ldmia sp!, {r4, pc}
_0200BCA4:
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BC60

	arm_func_start sub_0200BCB0
sub_0200BCB0: ; 0x0200BCB0
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BCC0:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BCC0
	cmp r1, #1
	bne _0200BCE4
	mov r1, #1
	bl sub_0200B990
	ldmia sp!, {r4, pc}
_0200BCE4:
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BD08
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
_0200BD08:
	mov r1, #2
	bl sub_0200B990
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BCB0

	arm_func_start sub_0200BD14
sub_0200BD14: ; 0x0200BD14
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0200BD14

	arm_func_start sub_0200BD2C
sub_0200BD2C: ; 0x0200BD2C
	ldrsh r1, [r0, #0x10]
	mvn r0, #0xff
	cmp r1, r0
	moveq r0, #1
	bxeq lr
	cmp r1, #0x100
	moveq r0, #2
	movne r0, #0
	bx lr
	arm_func_end sub_0200BD2C

	arm_func_start sub_0200BD50
sub_0200BD50: ; 0x0200BD50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, [r4, #4]
	cmpeq r0, #0
	beq _0200C000
	mov r0, r4
	bl sub_0200BA08
	cmp r0, #0
	beq _0200BF90
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BD90: ; jump table
	b _0200C000 ; case 0
	b _0200BDC0 ; case 1
	b _0200BDDC ; case 2
	b _0200BDFC ; case 3
	b _0200BE10 ; case 4
	b _0200BE30 ; case 5
	b _0200BE44 ; case 6
	b _0200BEB0 ; case 7
	b _0200BE44 ; case 8
	b _0200BEB0 ; case 9
	b _0200BF10 ; case 10
	b _0200BF54 ; case 11
_0200BDC0:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A37C
	b _0200C000
_0200BDDC:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BDFC:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A3DC
	b _0200C000
_0200BE10:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BE30:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A444
	b _0200C000
_0200BE44:
	cmp r0, #6
	beq _0200BE58
	cmp r0, #8
	beq _0200BE74
	b _0200BE90
_0200BE58:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BE90
_0200BE74:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BE90:
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BEB0:
	cmp r0, #7
	beq _0200BEC4
	cmp r0, #9
	beq _0200BEE0
	b _0200BEFC
_0200BEC4:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BEFC
_0200BEE0:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BEFC:
	ldrh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	bl sub_0200A444
	b _0200C000
_0200BF10:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	add r3, r1, r1, lsl #1
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, asr #2
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF54:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r3, r1, #0x100
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF90:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0200C000
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BFAC: ; jump table
	b _0200C000 ; case 0
	b _0200C000 ; case 1
	b _0200BFDC ; case 2
	b _0200BFF0 ; case 3
	b _0200BFDC ; case 4
	b _0200BFF0 ; case 5
	b _0200BFDC ; case 6
	b _0200BFF0 ; case 7
	b _0200BFDC ; case 8
	b _0200BFF0 ; case 9
	b _0200BFDC ; case 10
	b _0200BFF0 ; case 11
_0200BFDC:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0x100
	movge r0, #0
	strge r0, [r4]
	b _0200C000
_0200BFF0:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4]
_0200C000:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200BD50

	arm_func_start sub_0200C008
sub_0200C008: ; 0x0200C008
	ldr ip, _0200C01C ; =sub_0200A29C
	mov r3, r2, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bx ip
	.align 2, 0
_0200C01C: .word sub_0200A29C
	arm_func_end sub_0200C008

	arm_func_start sub_0200C020
sub_0200C020: ; 0x0200C020
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x10]
	cmp ip, #0
	beq _0200C084
	ldrb lr, [r1]
	mov r4, #0xff
	ldrb lr, [ip, lr, lsl #2]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp]
	ldrb lr, [r1, #1]
	add lr, ip, lr, lsl #2
	ldrb lr, [lr, #1]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp, #1]
	ldrb r1, [r1, #2]
	add r1, ip, r1, lsl #2
	ldrb r1, [r1, #2]
	mul r1, r3, r1
	mov r1, r1, lsr #5
	strb r1, [sp, #2]
	strb r4, [sp, #3]
	b _0200C0BC
_0200C084:
	ldrb r4, [r1]
	mov ip, #0xff
	mul lr, r4, r3
	mov r4, lr, lsr #5
	strb r4, [sp]
	ldrb lr, [r1, #1]
	mul r4, lr, r3
	mov r4, r4, lsr #5
	strb r4, [sp, #1]
	ldrb r1, [r1, #2]
	mul r3, r1, r3
	mov r1, r3, lsr #5
	strb r1, [sp, #2]
	strb ip, [sp, #3]
_0200C0BC:
	mov r1, r2, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200C020

	arm_func_start sub_0200C0D4
sub_0200C0D4: ; 0x0200C0D4
	stmdb sp!, {r3, lr}
	bl sub_0200C11C
	bl sub_0200C168
	bl sub_0200C24C
	bl sub_0200C250
	bl sub_0200C254
	bl sub_0200C258
	bl sub_0200C230
	ldr r0, _0200C108 ; =0x020AF698
	mov r1, #1
	str r1, [r0]
	bl sub_0200C10C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200C108: .word 0x020AF698
	arm_func_end sub_0200C0D4

	arm_func_start sub_0200C10C
sub_0200C10C: ; 0x0200C10C
	bx lr
	arm_func_end sub_0200C10C

	arm_func_start GetDebugFlag1
GetDebugFlag1: ; 0x0200C110
	mov r0, #0
	bx lr
	arm_func_end GetDebugFlag1

	arm_func_start SetDebugFlag1
SetDebugFlag1: ; 0x0200C118
	bx lr
	arm_func_end SetDebugFlag1

	arm_func_start sub_0200C11C
sub_0200C11C: ; 0x0200C11C
	bx lr
	arm_func_end sub_0200C11C

	arm_func_start AppendProgPos
AppendProgPos: ; 0x0200C120
	stmdb sp!, {r3, lr}
	mov ip, r1
	cmp r2, #0
	ldreq r2, _0200C15C ; =0x02094AFC
	cmp ip, #0
	beq _0200C150
	ldr r3, [ip, #4]
	ldr r1, _0200C160 ; =0x02094B00
	str r3, [sp]
	ldr r3, [ip]
	bl Sprintf
	ldmia sp!, {r3, pc}
_0200C150:
	ldr r1, _0200C164 ; =0x02094B1C
	bl Sprintf
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200C15C: .word 0x02094AFC
_0200C160: .word 0x02094B00
_0200C164: .word 0x02094B1C
	arm_func_end AppendProgPos

	arm_func_start sub_0200C168
sub_0200C168: ; 0x0200C168
	bx lr
	arm_func_end sub_0200C168

	arm_func_start DebugPrintTrace
DebugPrintTrace: ; 0x0200C16C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x100
	mov r2, r0
	cmp r1, #0
	add r0, sp, #0
	beq _0200C1A0
	cmp r2, #0
	beq _0200C194
	bl AppendProgPos
	b _0200C1BC
_0200C194:
	ldr r2, _0200C1C4 ; =0x02094B34
	bl AppendProgPos
	b _0200C1BC
_0200C1A0:
	cmp r2, #0
	beq _0200C1B4
	mov r1, r2
	bl Strcpy
	b _0200C1BC
_0200C1B4:
	ldr r1, _0200C1C4 ; =0x02094B34
	bl Strcpy
_0200C1BC:
	add sp, sp, #0x100
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200C1C4: .word 0x02094B34
	arm_func_end DebugPrintTrace

	arm_func_start DebugPrint0__0200C1C8
DebugPrint0__0200C1C8: ; 0x0200C1C8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x100
	add r0, sp, #0x108
	bic r2, r0, #3
	ldr r1, [sp, #0x108]
	add r0, sp, #0
	add r2, r2, #4
	bl Vsprintf
	add sp, sp, #0x100
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end DebugPrint0__0200C1C8

	arm_func_start DebugPrint0__0200C1FC
DebugPrint0__0200C1FC: ; 0x0200C1FC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x100
	add r0, sp, #0x108
	bic r2, r0, #3
	ldr r1, [sp, #0x108]
	add r0, sp, #0
	add r2, r2, #4
	bl Vsprintf
	add sp, sp, #0x100
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end DebugPrint0__0200C1FC

	arm_func_start sub_0200C230
sub_0200C230: ; 0x0200C230
	bx lr
	arm_func_end sub_0200C230

	arm_func_start GetDebugFlag2
GetDebugFlag2: ; 0x0200C234
	mov r0, #0
	bx lr
	arm_func_end GetDebugFlag2

	arm_func_start SetDebugFlag2
SetDebugFlag2: ; 0x0200C23C
	bx lr
	arm_func_end SetDebugFlag2

	arm_func_start DebugPrint
DebugPrint: ; 0x0200C240
	stmdb sp!, {r0, r1, r2, r3}
	add sp, sp, #0x10
	bx lr
	arm_func_end DebugPrint

	arm_func_start sub_0200C24C
sub_0200C24C: ; 0x0200C24C
	bx lr
	arm_func_end sub_0200C24C

	arm_func_start sub_0200C250
sub_0200C250: ; 0x0200C250
	bx lr
	arm_func_end sub_0200C250

	arm_func_start sub_0200C254
sub_0200C254: ; 0x0200C254
	bx lr
	arm_func_end sub_0200C254

	arm_func_start sub_0200C258
sub_0200C258: ; 0x0200C258
	bx lr
	arm_func_end sub_0200C258

	arm_func_start FatalError
FatalError: ; 0x0200C25C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x100
	mov r1, r0
	ldr r0, _0200C2CC ; =0x02094B40
	bl DebugPrintTrace
	ldr r1, [sp, #0x10c]
	add r0, sp, #0
	cmp r1, #0
	beq _0200C2A4
	add r2, sp, #0x10c
	bic r2, r2, #3
	add r2, r2, #4
	bl Vsprintf
	ldr r1, _0200C2D0 ; =0x02094B54
	add r0, sp, #0
	bl Strcat
	b _0200C2AC
_0200C2A4:
	ldr r1, _0200C2D4 ; =0x02094B58
	bl Strcpy
_0200C2AC:
	ldr r0, _0200C2D8 ; =0x02094B60
	add r1, sp, #0
	bl DebugPrint0__0200C1C8
	bl WaitForever
	add sp, sp, #0x100
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0200C2CC: .word 0x02094B40
_0200C2D0: .word 0x02094B54
_0200C2D4: .word 0x02094B58
_0200C2D8: .word 0x02094B60
	arm_func_end FatalError
