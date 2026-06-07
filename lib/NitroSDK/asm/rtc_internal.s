	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Rtci_ReadRawDateTimeAsync
Rtci_ReadRawDateTimeAsync: ; 0x02082EC8
	ldr ip, _02082ED4 ; =RtcSendPxiCommand
	mov r0, #0x10
	bx ip
	.align 2, 0
_02082ED4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawDateTimeAsync

	arm_func_start Rtci_ReadRawDateAsync
Rtci_ReadRawDateAsync: ; 0x02082ED8
	ldr ip, _02082EE4 ; =RtcSendPxiCommand
	mov r0, #0x11
	bx ip
	.align 2, 0
_02082EE4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawDateAsync

	arm_func_start Rtci_ReadRawTimeAsync
Rtci_ReadRawTimeAsync: ; 0x02082EE8
	ldr ip, _02082EF4 ; =RtcSendPxiCommand
	mov r0, #0x12
	bx ip
	.align 2, 0
_02082EF4: .word RtcSendPxiCommand
	arm_func_end Rtci_ReadRawTimeAsync

	arm_func_start Rtci_WriteRawStatus2Async
Rtci_WriteRawStatus2Async: ; 0x02082EF8
	ldr ip, _02082F04 ; =RtcSendPxiCommand
	mov r0, #0x27
	bx ip
	.align 2, 0
_02082F04: .word RtcSendPxiCommand
	arm_func_end Rtci_WriteRawStatus2Async

	arm_func_start RtcSendPxiCommand
RtcSendPxiCommand: ; 0x02082F08
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #8
	and r1, r0, #0x7f00
	mov r0, #5
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end RtcSendPxiCommand

