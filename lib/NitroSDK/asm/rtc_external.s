	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Rtc_Init
Rtc_Init: ; 0x0208266C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020826D0 ; =_022BB718
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x28]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	bl PXI_Init
	mov r5, #5
	mov r4, #1
_020826AC:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020826AC
	ldr r1, _020826D4 ; =RtcCommonCallback
	mov r0, #5
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020826D0: .word _022BB718
_020826D4: .word RtcCommonCallback
	arm_func_end Rtc_Init

	arm_func_start Rtc_GetDateAsync
Rtc_GetDateAsync: ; 0x020826D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EnableIrqFlag
	ldr r1, _02082744 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _02082708
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02082708:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _02082744 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawDateAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02082744: .word _022BB718
	arm_func_end Rtc_GetDateAsync

	arm_func_start Rtc_GetDate
Rtc_GetDate: ; 0x02082748
	stmdb sp!, {r3, lr}
	ldr r1, _02082778 ; =RtcGetResultCallback
	mov r2, #0
	bl Rtc_GetDateAsync
	ldr r1, _0208277C ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _0208276C
	bl RtcWaitBusy
_0208276C:
	ldr r0, _0208277C ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082778: .word RtcGetResultCallback
_0208277C: .word _022BB718
	arm_func_end Rtc_GetDate

	arm_func_start Rtc_GetTimeAsync
Rtc_GetTimeAsync: ; 0x02082780
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EnableIrqFlag
	ldr r1, _020827F0 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _020827B0
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020827B0:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _020827F0 ; =_022BB718
	mov r1, #1
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawTimeAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020827F0: .word _022BB718
	arm_func_end Rtc_GetTimeAsync

	arm_func_start Rtc_GetTime
Rtc_GetTime: ; 0x020827F4
	stmdb sp!, {r3, lr}
	ldr r1, _02082824 ; =RtcGetResultCallback
	mov r2, #0
	bl Rtc_GetTimeAsync
	ldr r1, _02082828 ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _02082818
	bl RtcWaitBusy
_02082818:
	ldr r0, _02082828 ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082824: .word RtcGetResultCallback
_02082828: .word _022BB718
	arm_func_end Rtc_GetTime

	arm_func_start Rtc_GetDateTimeAsync
Rtc_GetDateTimeAsync: ; 0x0208282C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EnableIrqFlag
	ldr r1, _020828A4 ; =_022BB718
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _02082860
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02082860:
	mov r2, #1
	str r2, [r1, #0xc]
	bl SetIrqFlag
	ldr r0, _020828A4 ; =_022BB718
	mov r1, #2
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r7, [r0, #0x14]
	str r6, [r0, #0x18]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl Rtci_ReadRawDateTimeAsync
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020828A4: .word _022BB718
	arm_func_end Rtc_GetDateTimeAsync

	arm_func_start Rtc_GetDateTime
Rtc_GetDateTime: ; 0x020828A8
	stmdb sp!, {r3, lr}
	ldr r2, _020828D8 ; =RtcGetResultCallback
	mov r3, #0
	bl Rtc_GetDateTimeAsync
	ldr r1, _020828DC ; =_022BB718
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _020828CC
	bl RtcWaitBusy
_020828CC:
	ldr r0, _020828DC ; =_022BB718
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020828D8: .word RtcGetResultCallback
_020828DC: .word _022BB718
	arm_func_end Rtc_GetDateTime

	arm_func_start RtcCommonCallback
RtcCommonCallback: ; 0x020828E0
	stmdb sp!, {r3, r4, r5, lr}
	cmp r2, #0
	beq _0208293C
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0x24]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x24]
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02082E20 ; =_022BB718
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, #6
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
_0208293C:
	and r0, r1, #0x7f00
	mov r0, r0, lsr #8
	and r0, r0, #0xff
	cmp r0, #0x30
	and r2, r1, #0xff
	bne _0208296C
	ldr r0, _02082E20 ; =_022BB718
	ldr r0, [r0, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	blx r0
	ldmia sp!, {r3, r4, r5, pc}
_0208296C:
	cmp r2, #0
	bne _02082D90
	ldr r0, _02082E20 ; =_022BB718
	mov r4, #0
	ldr r1, [r0, #0x20]
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _02082D7C
_0208298C: ; jump table
	b _020829CC ; case 0
	b _02082A28 ; case 1
	b _02082A78 ; case 2
	b _02082DD8 ; case 3
	b _02082DD8 ; case 4
	b _02082DD8 ; case 5
	b _02082B20 ; case 6
	b _02082B50 ; case 7
	b _02082B74 ; case 8
	b _02082C1C ; case 9
	b _02082CD0 ; case 10
	b _02082DD8 ; case 11
	b _02082DD8 ; case 12
	b _02082DD8 ; case 13
	b _02082DD8 ; case 14
	b _02082DD8 ; case 15
_020829CC:
	ldr r1, _02082E24 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r0, r5
	bl Rtc_GetDayOfWeek
	str r0, [r5, #0xc]
	b _02082DD8
_02082A28:
	ldr r1, _02082E28 ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	b _02082DD8
_02082A78:
	ldr r1, _02082E24 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	and r0, r0, #0xff
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl RtcBcd2Hex
	ldr r1, _02082E24 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r0, r5
	bl Rtc_GetDayOfWeek
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #0xc]
	ldr r0, [r1]
	ldr r1, _02082E20 ; =_022BB718
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	ldr r5, [r1, #0x18]
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	b _02082DD8
_02082B20:
	ldr r1, _02082E2C ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	bne _02082B48
	mov r0, #1
	str r0, [r2]
	b _02082DD8
_02082B48:
	str r4, [r2]
	b _02082DD8
_02082B50:
	ldr r1, _02082E2C ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	movne r0, #1
	strne r0, [r2]
	streq r4, [r2]
	b _02082DD8
_02082B74:
	ldr r1, _02082E28 ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x12
	mov r0, r0, lsr #0x1a
	bl RtcBcd2Hex
	ldr r1, _02082E28 ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl RtcBcd2Hex
	str r0, [r5, #8]
	mov r1, r4
	ldr r0, _02082E28 ; =0x027FFDEC
	str r1, [r5, #0xc]
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #1
	strne r0, [r5, #0xc]
	ldr r0, _02082E28 ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #2
	strne r0, [r5, #0xc]
	ldr r0, _02082E28 ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	beq _02082DD8
	ldr r0, [r5, #0xc]
	add r0, r0, #4
	str r0, [r5, #0xc]
	b _02082DD8
_02082C1C:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _02082CC8
	ldr r1, [r0, #0x14]
	ldr r2, _02082E2C ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _02082C88
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1c
	cmp r1, #4
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	orr r0, r0, #4
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082C88:
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1c
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082CC8:
	str r4, [r0, #0x24]
	b _02082DD8
_02082CD0:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _02082D74
	ldr r1, [r0, #0x14]
	ldr r2, _02082E2C ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _02082D34
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	bne _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	orr r0, r0, #0x40
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082D34:
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	beq _02082DD8
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	bl Rtci_WriteRawStatus2Async
	cmp r0, #0
	bne _02082DD8
	ldr r0, _02082E20 ; =_022BB718
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _02082DD8
_02082D74:
	str r4, [r0, #0x24]
	b _02082DD8
_02082D7C:
	ldr r0, _02082E20 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x24]
	mov r4, #4
	b _02082DD8
_02082D90:
	ldr r0, _02082E20 ; =_022BB718
	mov r1, #0
	str r1, [r0, #0x24]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _02082DD4
_02082DA8: ; jump table
	b _02082DD4 ; case 0
	b _02082DBC ; case 1
	b _02082DC4 ; case 2
	b _02082DCC ; case 3
	b _02082DD4 ; case 4
_02082DBC:
	mov r4, #4
	b _02082DD8
_02082DC4:
	mov r4, #5
	b _02082DD8
_02082DCC:
	mov r4, #1
	b _02082DD8
_02082DD4:
	mov r4, #6
_02082DD8:
	ldr r0, _02082E20 ; =_022BB718
	ldr r1, [r0, #0x24]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02082E20 ; =_022BB718
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, r4
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02082E20: .word _022BB718
_02082E24: .word 0x027FFDE8
_02082E28: .word 0x027FFDEC
_02082E2C: .word 0x027FFDEA
	arm_func_end RtcCommonCallback

	arm_func_start RtcBcd2Hex
RtcBcd2Hex: ; 0x02082E30
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #0
	mov r2, ip
	mov r3, ip
_02082E40:
	mov r1, r0, lsr r3
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	add r2, r2, #1
	cmp r2, #8
	add r3, r3, #4
	blt _02082E40
	mov r5, #0
	mov r4, r5
	mov lr, #1
	mov r2, #0xa
_02082E74:
	mov r1, r0, lsr r4
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r5, r5, #1
	mov lr, r1
	cmp r5, #8
	add r4, r4, #4
	blt _02082E74
	mov r0, ip
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RtcBcd2Hex

	arm_func_start RtcGetResultCallback
RtcGetResultCallback: ; 0x02082EA0
	ldr r1, _02082EAC ; =_022BB718
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_02082EAC: .word _022BB718
	arm_func_end RtcGetResultCallback

	arm_func_start RtcWaitBusy
RtcWaitBusy: ; 0x02082EB0
	ldr ip, _02082EC4 ; =_022BB724
_02082EB4:
	ldr r0, [ip]
	cmp r0, #1
	beq _02082EB4
	bx lr
	.align 2, 0
_02082EC4: .word _022BB724
	arm_func_end RtcWaitBusy

