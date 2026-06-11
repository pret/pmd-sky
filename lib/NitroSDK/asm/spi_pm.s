	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start PMi_Lock
PMi_Lock: ; 0x02081A00
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r1, _02081A38 ; =_022BB6AC
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	beq _02081A24
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, pc}
_02081A24:
	mov r2, #1
	str r2, [r1, #0x1c]
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081A38: .word _022BB6AC
	arm_func_end PMi_Lock

	arm_func_start PMi_WaitBusy
PMi_WaitBusy: ; 0x02081A3C
	stmdb sp!, {r4, lr}
	ldr r0, _02081A74 ; =_022BB6AC
	ldr r4, _02081A78 ; =_022BB6C8
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_02081A54:
	bl GetIrqFlag
	cmp r0, #0x80
	bne _02081A64
	bl PXIi_HandlerRecvFifoNotEmpty
_02081A64:
	ldr r0, [r4]
	cmp r0, #0
	bne _02081A54
	ldmia sp!, {r4, pc}
	.align 2, 0
_02081A74: .word _022BB6AC
_02081A78: .word _022BB6C8
	arm_func_end PMi_WaitBusy

	arm_func_start PMi_DummyCallback
PMi_DummyCallback: ; 0x02081A7C
	str r0, [r1]
	bx lr
	arm_func_end PMi_DummyCallback

	arm_func_start PMi_CallCallbackAndUnlock
PMi_CallCallbackAndUnlock: ; 0x02081A84
	stmdb sp!, {r3, lr}
	ldr r2, _02081AC0 ; =_022BB6AC
	ldr r1, [r2, #0x1c]
	ldr ip, [r2, #0x20]
	cmp r1, #0
	ldr r1, [r2, #0x24]
	movne r3, #0
	strne r3, [r2, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _02081AC0 ; =_022BB6AC
	mov r3, #0
	str r3, [r2, #0x20]
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081AC0: .word _022BB6AC
	arm_func_end PMi_CallCallbackAndUnlock

	arm_func_start PM_Init
PM_Init: ; 0x02081AC4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02081B54 ; =_022BB6AC
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	bl PXI_Init
	mov r5, #8
	mov r4, #1
_02081AF8:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _02081AF8
	ldr r1, _02081B58 ; =PMi_CommonCallback
	mov r0, #8
	bl PXI_SetFifoRecvCallback
	mov r3, #0
	ldr r0, _02081B5C ; =_022BB6F0
	mov r2, r3
_02081B24:
	mov r1, r3, lsl #3
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #5
	blt _02081B24
	ldr r0, _02081B60 ; =_022BB6D8
	bl OS_InitMutex
	ldr r1, _02081B64 ; =0x027FFC3C
	ldr r0, _02081B54 ; =_022BB6AC
	ldr r1, [r1]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02081B54: .word _022BB6AC
_02081B58: .word PMi_CommonCallback
_02081B5C: .word _022BB6F0
_02081B60: .word _022BB6D8
_02081B64: .word 0x027FFC3C
	arm_func_end PM_Init

	arm_func_start PMi_CommonCallback
PMi_CommonCallback: ; 0x02081B68
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _02081B80
	mov r0, #2
	bl PMi_CallCallbackAndUnlock
	ldmia sp!, {r3, pc}
_02081B80:
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r2, r0, lsr #0x10
	and r0, r1, #0xff
	cmp r2, #0x70
	blo _02081BD0
	cmp r2, #0x74
	bhi _02081BD0
	ldr r1, _02081C24 ; =_022BB6F4
	sub r2, r2, #0x70
	ldr r1, [r1, r2, lsl #3]
	and r0, r0, #0xff
	cmp r1, #0
	strneh r0, [r1]
	mov r1, r2, lsl #3
	ldr r0, _02081C28 ; =_022BB6F0
	mov r2, #1
	strh r2, [r0, r1]
	mov r0, #0
	b _02081C1C
_02081BD0:
	cmp r2, #0x60
	bne _02081BE8
	ldr r1, _02081C2C ; =_022BB6AC
	mov r2, #1
	str r2, [r1, #4]
	b _02081C1C
_02081BE8:
	cmp r2, #0x62
	bne _02081C00
	ldr r1, _02081C2C ; =_022BB6AC
	mov r2, #1
	str r2, [r1, #8]
	b _02081C1C
_02081C00:
	cmp r2, #0x67
	bne _02081C1C
	ldr r1, _02081C2C ; =_022BB6AC
	ldr r1, [r1, #0x28]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
_02081C1C:
	bl PMi_CallCallbackAndUnlock
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081C24: .word _022BB6F4
_02081C28: .word _022BB6F0
_02081C2C: .word _022BB6AC
	arm_func_end PMi_CommonCallback

	arm_func_start PMi_SendSleepStart
PMi_SendSleepStart: ; 0x02081C30
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02081CB8 ; =_022BB6AC
	mov r2, #0
	ldr r0, _02081CBC ; =0x03006000
	str r2, [r1, #4]
	bl PMi_SendPxiData
	ldr r0, _02081CB8 ; =_022BB6AC
_02081C64:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02081C64
	ldr ip, _02081CB8 ; =_022BB6AC
	mov r0, #0
	str r0, [ip, #4]
	mov r2, r0
	mov r1, #2
	mov r3, #1
	str r0, [ip, #8]
	bl PMi_SetLcdPower
	and r0, r5, #0xff
	orr r0, r0, #0x6100
	orr r0, r0, #0x2000000
	bl PMi_SendPxiData
	ldr r1, _02081CC0 ; =0x01010000
	mov r0, r4, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02081CB8: .word _022BB6AC
_02081CBC: .word 0x03006000
_02081CC0: .word 0x01010000
	arm_func_end PMi_SendSleepStart

	arm_func_start PM_SendUtilityCommandAsync
PM_SendUtilityCommandAsync: ; 0x02081CC4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6, lsr #0x10
	and r0, r0, #0xff
	ldr r1, _02081D1C ; =_022BB6AC
	orr r0, r0, #0x6300
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	ldr r1, _02081D20 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02081D1C: .word _022BB6AC
_02081D20: .word 0x01010000
	arm_func_end PM_SendUtilityCommandAsync

	arm_func_start PMi_ReadRegisterAsync
PMi_ReadRegisterAsync: ; 0x02081D24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _02081D84 ; =_022BB6AC
	and r0, r5, #0xff
	str r7, [r1, #0x20]
	orr r0, r0, #0x6500
	ldr r2, _02081D88 ; =_022BB6F0
	str r6, [r1, #0x24]
	mov r3, r5, lsl #3
	mov ip, #0
	ldr r1, _02081D8C ; =_022BB6F4
	strh ip, [r2, r3]
	orr r0, r0, #0x3000000
	str r4, [r1, r5, lsl #3]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02081D84: .word _022BB6AC
_02081D88: .word _022BB6F0
_02081D8C: .word _022BB6F4
	arm_func_end PMi_ReadRegisterAsync

	arm_func_start PMi_ReadRegister
PMi_ReadRegister: ; 0x02081D90
	stmdb sp!, {r3, lr}
	ldr r2, _02081DB4 ; =_02081A7C
	add r3, sp, #0
	bl PMi_ReadRegisterAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081DB4: .word PMi_DummyCallback
	arm_func_end PMi_ReadRegister

	arm_func_start PMi_WriteRegisterAsync
PMi_WriteRegisterAsync: ; 0x02081DB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r0, r7, #0xff
	ldr r1, _02081E10 ; =_022BB6AC
	orr r0, r0, #0x6400
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	ldr r1, _02081E14 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02081E10: .word _022BB6AC
_02081E14: .word 0x01010000
	arm_func_end PMi_WriteRegisterAsync

	arm_func_start PMi_WriteRegister
PMi_WriteRegister: ; 0x02081E18
	stmdb sp!, {r3, lr}
	ldr r2, _02081E3C ; =_02081A7C
	add r3, sp, #0
	bl PMi_WriteRegisterAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081E3C: .word PMi_DummyCallback
	arm_func_end PMi_WriteRegister

	arm_func_start PMi_SetLedAsync
PMi_SetLedAsync: ; 0x02081E40
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _02081E60
	cmp r0, #2
	beq _02081E70
	cmp r0, #3
	beq _02081E68
	b _02081E78
_02081E60:
	mov r0, #1
	b _02081E7C
_02081E68:
	mov r0, #2
	b _02081E7C
_02081E70:
	mov r0, #3
	b _02081E7C
_02081E78:
	mov r0, #0
_02081E7C:
	cmp r0, #0
	ldreq r0, _02081E90 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	bl PM_SendUtilityCommandAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081E90: .word 0x0000FFFF
	arm_func_end PMi_SetLedAsync

	arm_func_start PMi_SetLed
PMi_SetLed: ; 0x02081E94
	stmdb sp!, {r3, lr}
	ldr r1, _02081EB8 ; =_02081A7C
	add r2, sp, #0
	bl PMi_SetLedAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081EB8: .word PMi_DummyCallback
	arm_func_end PMi_SetLed

	arm_func_start PM_SetBackLightAsync
PM_SetBackLightAsync: ; 0x02081EBC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mov ip, #0
	bne _02081EE0
	cmp r1, #1
	moveq ip, #6
	cmp r1, #0
	moveq ip, #7
	b _02081F14
_02081EE0:
	cmp r0, #1
	bne _02081EFC
	cmp r1, #1
	moveq ip, #4
	cmp r1, #0
	moveq ip, #5
	b _02081F14
_02081EFC:
	cmp r0, #2
	bne _02081F14
	cmp r1, #1
	moveq ip, #8
	cmp r1, #0
	moveq ip, #9
_02081F14:
	cmp ip, #0
	ldreq r0, _02081F34 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	mov r0, ip
	mov r2, r3
	bl PM_SendUtilityCommandAsync
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081F34: .word 0x0000FFFF
	arm_func_end PM_SetBackLightAsync

	arm_func_start PM_SetBackLight
PM_SetBackLight: ; 0x02081F38
	stmdb sp!, {r3, lr}
	ldr r2, _02081F5C ; =_02081A7C
	add r3, sp, #0
	bl PM_SetBackLightAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02081F5C: .word PMi_DummyCallback
	arm_func_end PM_SetBackLight

	arm_func_start PM_ForceToPowerOffAsync
PM_ForceToPowerOffAsync: ; 0x02081F60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r0, _02082008 ; =0x00996A00
	mov r6, r1
	bl OS_SpinWait
	bl PM_GetLcdPower
	cmp r0, #1
	beq _02081FF0
	add r0, sp, #4
	add r1, sp, #0
	bl PM_GetBackLight
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02081FA8
	mov r0, #0
	mov r1, r0
	bl PM_SetBackLight
_02081FA8:
	ldr r0, [sp]
	cmp r0, #0
	beq _02081FC0
	mov r0, #1
	mov r1, #0
	bl PM_SetBackLight
_02081FC0:
	mov r0, #1
	bl PM_SetLcdPower
	cmp r0, #0
	bne _02081FF0
	ldr r5, _02082008 ; =0x00996A00
	mov r4, #1
_02081FD8:
	mov r0, r5
	bl OS_SpinWait
	mov r0, r4
	bl PM_SetLcdPower
	cmp r0, #0
	beq _02081FD8
_02081FF0:
	mov r1, r7
	mov r2, r6
	mov r0, #0xe
	bl PM_SendUtilityCommandAsync
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02082008: .word 0x00996A00
	arm_func_end PM_ForceToPowerOffAsync

	arm_func_start PM_ForceToPowerOff
PM_ForceToPowerOff: ; 0x0208200C
	stmdb sp!, {r3, lr}
	ldr r0, _02082030 ; =_02081A7C
	add r1, sp, #0
	bl PM_ForceToPowerOffAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082030: .word PMi_DummyCallback
	arm_func_end PM_ForceToPowerOff

	arm_func_start PMi_SetAmp
PMi_SetAmp: ; 0x02082034
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl PM_GetLcdPower
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #2
	bl PMi_WriteRegister
	ldmia sp!, {r4, pc}
	arm_func_end PMi_SetAmp

	arm_func_start PM_GetBackLight
PM_GetBackLight: ; 0x02082060
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	add r1, sp, #0
	mov r0, #0
	bl PMi_ReadRegister
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	beq _0208209C
	ldrh r1, [sp]
	tst r1, #8
	movne r1, #1
	moveq r1, #0
	str r1, [r5]
_0208209C:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r1, [sp]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PM_GetBackLight

	arm_func_start PMi_SendPxiData
PMi_SendPxiData: ; 0x020820BC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #8
	mov r4, #0
_020820CC:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020820CC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end PMi_SendPxiData

	arm_func_start sub_020820E8
sub_020820E8: ; 0x020820E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _0208230C ; =_022BB6AC
	mov sl, r0
	ldr r0, [r3, #0xc]
	mov sb, r1
	mov fp, r2
	mov r4, #0
	bl PMi_ExecuteList
	ldr r1, _02082310 ; =0x04000208
	mov r0, r4
	ldrh r8, [r1]
	strh r0, [r1]
	bl EnableIrqFlag
	str r0, [sp, #8]
	ldr r0, _02082314 ; =0x003FFFFF
	bl OS_DisableIrqMask
	str r0, [sp, #4]
	bl OS_IsTickAvailable
	cmp r0, #0
	movne r0, #8
	moveq r0, r4
	orr r0, r0, #0x40000
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl SetIrqFlag
	ldr r2, _02082310 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	tst sl, #8
	strh r0, [r2]
	beq _02082178
	ldr r0, _02082318 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	biceq sl, sl, #8
_02082178:
	tst sl, #0x10
	beq _0208218C
	bl Ctrdg_IsExisting
	cmp r0, #0
	biceq sl, sl, #0x10
_0208218C:
	mov r1, #0x4000000
	add r0, r1, #0x1000
	ldr r5, [r1]
	ldr r6, [r0]
	bl PM_GetLcdPower
	str r0, [sp]
	add r0, sp, #0x14
	add r1, sp, #0x10
	bl PM_GetBackLight
	mov r0, #2
	mov r1, #0
	bl PM_SetBackLight
	ldr r2, _0208231C ; =0x027FFC3C
	ldr r0, [r2]
	str r0, [sp, #0xc]
_020821C8:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _020821C8
	ldr r0, [r2]
	mov r2, #0x4000000
	str r0, [sp, #0xc]
	ldr r0, [r2]
	add r1, r2, #0x1000
	bic r0, r0, #0x30000
	str r0, [r2]
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	ldr r2, _0208231C ; =0x027FFC3C
_02082204:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _02082204
	ldr r0, [r2]
	str r0, [sp, #0xc]
	ldr r2, _0208231C ; =0x027FFC3C
_02082220:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _02082220
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	orr r0, sl, r0, lsl #5
	orr r0, r0, r1, lsl #6
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	orr r0, sb, fp
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
_02082254:
	mov r0, r7
	mov r1, sb
	bl PMi_SendSleepStart
	cmp r0, #0
	bne _02082254
	bl WaitForInterrupt
	tst sl, #8
	beq _02082284
	ldr r0, _02082320 ; =0x04000214
	ldr r0, [r0]
	tst r0, #0x100000
	movne r4, #1
_02082284:
	cmp r4, #0
	bne _020822C4
	ldr r0, [sp]
	cmp r0, #1
	mov r0, #1
	bne _020822B0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl PMi_SetLcdPower
	b _020822B4
_020822B0:
	bl PMi_SetLed
_020822B4:
	mov r0, #0x4000000
	str r5, [r0]
	add r0, r0, #0x1000
	str r6, [r0]
_020822C4:
	ldr r0, _02082324 ; =0x00708100
	bl OS_SpinWait
	bl EnableIrqFlag
	ldr r0, [sp, #4]
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl SetIrqFlag
	ldr r1, _02082310 ; =0x04000208
	cmp r4, #0
	ldrh r0, [r1]
	strh r8, [r1]
	beq _020822F8
	bl PM_ForceToPowerOff
_020822F8:
	ldr r0, _0208230C ; =_022BB6AC
	ldr r0, [r0, #0x18]
	bl PMi_ExecuteList
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208230C: .word _022BB6AC
_02082310: .word 0x04000208
_02082314: .word 0x003FFFFF
_02082318: .word 0x027FFC40
_0208231C: .word 0x027FFC3C
_02082320: .word 0x04000214
_02082324: .word 0x00708100
	arm_func_end sub_020820E8

	arm_func_start PMi_SetLcdPower
PMi_SetLcdPower: ; 0x02082328
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r3
	cmp r0, #0
	beq _020823B8
	cmp r0, #1
	bne _0208240C
	cmp r2, #0
	bne _0208236C
	ldr r1, _02082414 ; =0x027FFC3C
	ldr r0, _02082418 ; =_022BB6AC
	ldr r1, [r1]
	ldr r0, [r0, #0x10]
	sub r0, r1, r0
	cmp r0, #7
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_0208236C:
	cmp r5, #0
	beq _02082398
	cmp r4, #0
	beq _02082388
	mov r0, r5
	bl PMi_SetLed
	b _02082398
_02082388:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl PMi_SetLedAsync
_02082398:
	ldr r2, _0208241C ; =0x04000304
	ldr r0, _02082418 ; =_022BB6AC
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	ldr r0, [r0, #0x14]
	bl PMi_SetAmp
	b _0208240C
_020823B8:
	mov r0, #0
	bl PMi_SetAmp
	ldr r3, _0208241C ; =0x04000304
	ldr r1, _02082414 ; =0x027FFC3C
	ldrh r2, [r3]
	ldr r0, _02082418 ; =_022BB6AC
	cmp r5, #0
	bic r2, r2, #1
	strh r2, [r3]
	ldr r1, [r1]
	str r1, [r0, #0x10]
	beq _0208240C
	cmp r4, #0
	beq _020823FC
	mov r0, r5
	bl PMi_SetLed
	b _0208240C
_020823FC:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl PMi_SetLedAsync
_0208240C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02082414: .word 0x027FFC3C
_02082418: .word _022BB6AC
_0208241C: .word 0x04000304
	arm_func_end PMi_SetLcdPower

	arm_func_start PM_SetLcdPower
PM_SetLcdPower: ; 0x02082420
	ldr ip, _0208243C ; =PMi_SetLcdPower
	mov r1, #0
	cmp r0, #1
	movne r0, #0
	mov r2, r1
	mov r3, #1
	bx ip
	.align 2, 0
_0208243C: .word PMi_SetLcdPower
	arm_func_end PM_SetLcdPower

	arm_func_start PM_GetLcdPower
PM_GetLcdPower: ; 0x02082440
	ldr r0, _02082458 ; =0x04000304
	ldrh r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02082458: .word 0x04000304
	arm_func_end PM_GetLcdPower

	arm_func_start PMi_SendLedPatternCommandAsync
PMi_SendLedPatternCommandAsync: ; 0x0208245C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	and r0, r6, #0xff
	ldr r1, _020824A0 ; =_022BB6AC
	orr r0, r0, #0x6600
	str r5, [r1, #0x20]
	orr r0, r0, #0x3000000
	str r4, [r1, #0x24]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020824A0: .word _022BB6AC
	arm_func_end PMi_SendLedPatternCommandAsync

	arm_func_start PMi_SendLedPatternCommand
PMi_SendLedPatternCommand: ; 0x020824A4
	stmdb sp!, {r3, lr}
	ldr r1, _020824C8 ; =_02081A7C
	add r2, sp, #0
	bl PMi_SendLedPatternCommandAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020824C8: .word PMi_DummyCallback
	arm_func_end PMi_SendLedPatternCommand

	arm_func_start PM_GetLedPatternAsync
PM_GetLedPatternAsync: ; 0x020824CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl PMi_Lock
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, _0208250C ; =_022BB6AC
	ldr r0, _02082510 ; =0x03006700
	str r5, [r1, #0x20]
	str r4, [r1, #0x24]
	str r6, [r1, #0x28]
	bl PMi_SendPxiData
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0208250C: .word _022BB6AC
_02082510: .word 0x03006700
	arm_func_end PM_GetLedPatternAsync

	arm_func_start PM_GetLedPattern
PM_GetLedPattern: ; 0x02082514
	stmdb sp!, {r3, lr}
	ldr r1, _02082538 ; =_02081A7C
	add r2, sp, #0
	bl PM_GetLedPatternAsync
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl PMi_WaitBusy
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02082538: .word PMi_DummyCallback
	arm_func_end PM_GetLedPattern

	arm_func_start PMi_PrependList
PMi_PrependList: ; 0x0208253C
	cmp r0, #0
	ldrne r2, [r0]
	strne r2, [r1, #8]
	strne r1, [r0]
	bx lr
	arm_func_end PMi_PrependList

	arm_func_start PMi_AppendList
PMi_AppendList: ; 0x02082550
	cmp r0, #0
	bxeq lr
	ldr r2, [r0]
	cmp r2, #0
	bne _02082574
	mov r2, #0
	str r2, [r1, #8]
	str r1, [r0]
	bx lr
_02082574:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _02082590
_02082580:
	mov r2, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02082580
_02082590:
	str r0, [r1, #8]
	str r1, [r2, #8]
	bx lr
	arm_func_end PMi_AppendList

	arm_func_start PMi_DeleteList
PMi_DeleteList: ; 0x0208259C
	cmp r0, #0
	ldrne r2, [r0]
	movne r3, r2
	cmpne r2, #0
	bxeq lr
_020825B0:
	cmp r2, r1
	bne _020825D0
	cmp r2, r3
	ldreq r1, [r2, #8]
	streq r1, [r0]
	ldrne r0, [r2, #8]
	strne r0, [r3, #8]
	bx lr
_020825D0:
	mov r3, r2
	ldr r2, [r2, #8]
	cmp r2, #0
	bne _020825B0
	bx lr
	arm_func_end PMi_DeleteList

	arm_func_start PMi_ExecuteList
PMi_ExecuteList: ; 0x020825E4
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
_020825F0:
	ldr r0, [r4, #4]
	ldr r1, [r4]
	blx r1
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _020825F0
	ldmia sp!, {r4, pc}
	arm_func_end PMi_ExecuteList

	arm_func_start PM_PrependPreSleepCallback
PM_PrependPreSleepCallback: ; 0x0208260C
	ldr ip, _0208261C ; =PMi_PrependList
	mov r1, r0
	ldr r0, _02082620 ; =_022BB6B8
	bx ip
	.align 2, 0
_0208261C: .word PMi_PrependList
_02082620: .word _022BB6B8
	arm_func_end PM_PrependPreSleepCallback

	arm_func_start PM_AppendPostSleepCallback
PM_AppendPostSleepCallback: ; 0x02082624
	ldr ip, _02082634 ; =PMi_AppendList
	mov r1, r0
	ldr r0, _02082638 ; =_022BB6C4
	bx ip
	.align 2, 0
_02082634: .word PMi_AppendList
_02082638: .word _022BB6C4
	arm_func_end PM_AppendPostSleepCallback

	arm_func_start PM_DeletePreSleepCallback
PM_DeletePreSleepCallback: ; 0x0208263C
	ldr ip, _0208264C ; =PMi_DeleteList
	mov r1, r0
	ldr r0, _02082650 ; =_022BB6B8
	bx ip
	.align 2, 0
_0208264C: .word PMi_DeleteList
_02082650: .word _022BB6B8
	arm_func_end PM_DeletePreSleepCallback

	arm_func_start PM_DeletePostSleepCallback
PM_DeletePostSleepCallback: ; 0x02082654
	ldr ip, _02082664 ; =PMi_DeleteList
	mov r1, r0
	ldr r0, _02082668 ; =_022BB6C4
	bx ip
	.align 2, 0
_02082664: .word PMi_DeleteList
_02082668: .word _022BB6C4
	arm_func_end PM_DeletePostSleepCallback

