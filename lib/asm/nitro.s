	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

	arm_func_start Snd_GetPlayerStatus
Snd_GetPlayerStatus: ; 0x0207D444
	stmdb sp!, {r3, lr}
	ldr r0, _0207D46C ; =_022BB560
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #4
	bl DC_InvalidateRange
	ldr r0, _0207D46C ; =_022BB560
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D46C: .word _022BB560
	arm_func_end Snd_GetPlayerStatus

	arm_func_start Snd_GetChannelStatus
Snd_GetChannelStatus: ; 0x0207D470
	stmdb sp!, {r3, lr}
	ldr r0, _0207D498 ; =_022BB560
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #8
	bl DC_InvalidateRange
	ldr r0, _0207D498 ; =_022BB560
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D498: .word _022BB560
	arm_func_end Snd_GetChannelStatus

	arm_func_start Sndi_GetFinishedCommandTag
Sndi_GetFinishedCommandTag: ; 0x0207D49C
	stmdb sp!, {r3, lr}
	ldr r0, _0207D4C0 ; =_022BB560
	mov r1, #4
	ldr r0, [r0]
	bl DC_InvalidateRange
	ldr r0, _0207D4C0 ; =_022BB560
	ldr r0, [r0]
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D4C0: .word _022BB560
	arm_func_end Sndi_GetFinishedCommandTag

	arm_func_start Sndi_InitSharedWork
Sndi_InitSharedWork: ; 0x0207D4C4
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
	bl DC_FlushRange
	ldmia sp!, {r4, pc}
	arm_func_end Sndi_InitSharedWork

	arm_func_start Snd_CalcChannelVolume
Snd_CalcChannelVolume: ; 0x0207D540
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
	arm_func_end Snd_CalcChannelVolume

	arm_func_start Snd_AssignWaveArc
Snd_AssignWaveArc: ; 0x0207D5B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl Sndi_LockMutex
	add r3, r6, r5, lsl #3
	ldr r2, [r3, #0x18]
	cmp r2, #0
	beq _0207D640
	cmp r4, r2
	bne _0207D5E4
	bl Sndi_UnlockMutex
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
	bl DC_StoreRange
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
	bl DC_StoreRange
_0207D640:
	add r0, r6, #0x18
	ldr r1, [r4, #0x18]
	add r0, r0, r5, lsl #3
	str r0, [r4, #0x18]
	add r0, r6, r5, lsl #3
	str r1, [r0, #0x1c]
	str r4, [r0, #0x18]
	bl Sndi_UnlockMutex
	mov r0, r6
	mov r1, #0x3c
	bl DC_StoreRange
	mov r0, r4
	mov r1, #0x3c
	bl DC_StoreRange
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Snd_AssignWaveArc

	arm_func_start Snd_DestroyBank
Snd_DestroyBank: ; 0x0207D67C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl Sndi_LockMutex
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
	bl DC_StoreRange
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
	bl DC_StoreRange
_0207D6FC:
	add r6, r6, #1
	cmp r6, #4
	add r5, r5, #8
	blt _0207D698
	bl Sndi_UnlockMutex
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end Snd_DestroyBank

	arm_func_start Snd_DestroyWaveArc
Snd_DestroyWaveArc: ; 0x0207D714
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	bl Sndi_LockMutex
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
	bl DC_StoreRange
	mov r0, r6
	cmp r6, #0
	bne _0207D734
_0207D754:
	bl Sndi_UnlockMutex
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Snd_DestroyWaveArc

	arm_func_start Snd_GetFirstInstDataPos
Snd_GetFirstInstDataPos: ; 0x0207D75C
	sub sp, sp, #8
	mov r1, #0
	str r1, [r0]
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	arm_func_end Snd_GetFirstInstDataPos

	arm_func_start Snd_GetNextInstData
Snd_GetNextInstData: ; 0x0207D77C
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
	arm_func_end Snd_GetNextInstData

	arm_func_start Snd_GetWaveDataCount
Snd_GetWaveDataCount: ; 0x0207D92C
	ldr r0, [r0, #0x38]
	bx lr
	arm_func_end Snd_GetWaveDataCount

	arm_func_start Snd_SetWaveDataAddress
Snd_SetWaveDataAddress: ; 0x0207D934
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl Sndi_LockMutex
	add r0, r6, #0x3c
	add r2, r6, r5, lsl #2
	add r0, r0, r5, lsl #2
	mov r1, #4
	str r4, [r2, #0x3c]
	bl DC_StoreRange
	bl Sndi_UnlockMutex
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end Snd_SetWaveDataAddress

	arm_func_start Snd_GetWaveDataAddress
Snd_GetWaveDataAddress: ; 0x0207D968
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl Sndi_LockMutex
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
	bl Sndi_UnlockMutex
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Snd_GetWaveDataAddress

	arm_func_start PXI_Init
PXI_Init: ; 0x0207D9A4
	ldr ip, _0207D9AC ; =PXI_InitFifo
	bx ip
	.align 2, 0
_0207D9AC: .word PXI_InitFifo
	arm_func_end PXI_Init

	arm_func_start PXI_InitFifo
PXI_InitFifo: ; 0x0207D9B0
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
	bl OS_ResetRequestIrqMask
	ldr r1, _0207DAA8 ; =PXIi_HandlerRecvFifoNotEmpty
	mov r0, #0x40000
	bl OS_SetIrqFunction
	mov r0, #0x40000
	bl OS_EnableIrqMask
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
_0207DAA8: .word PXIi_HandlerRecvFifoNotEmpty
_0207DAAC: .word 0x04000180
	arm_func_end PXI_InitFifo

	arm_func_start PXI_SetFifoRecvCallback
PXI_SetFifoRecvCallback: ; 0x0207DAB0
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
	arm_func_end PXI_SetFifoRecvCallback

	arm_func_start PXI_IsCallbackReady
PXI_IsCallbackReady: ; 0x0207DAFC
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
	arm_func_end PXI_IsCallbackReady

	arm_func_start PXI_SendWordByFifo
PXI_SendWordByFifo: ; 0x0207DB20
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
	arm_func_end PXI_SendWordByFifo

	arm_func_start PXIi_HandlerRecvFifoNotEmpty
PXIi_HandlerRecvFifoNotEmpty: ; 0x0207DBA8
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
	arm_func_end PXIi_HandlerRecvFifoNotEmpty
