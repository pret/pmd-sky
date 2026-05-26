	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

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

