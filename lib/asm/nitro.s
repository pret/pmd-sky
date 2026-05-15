	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

    arm_func_start Snd_StopSeq
Snd_StopSeq: ; 0x0207C7DC
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #1
	str r2, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_StopSeq

	arm_func_start Snd_PrepareSeq
Snd_PrepareSeq: ; 0x0207C7FC
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_PrepareSeq

	arm_func_start Snd_StartPreparedSeq
Snd_StartPreparedSeq: ; 0x0207C824
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #3
	str r2, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_StartPreparedSeq

	arm_func_start Snd_SetPlayerTempoRatio
Snd_SetPlayerTempoRatio: ; 0x0207C844
	ldr ip, _0207C858 ; =Sndi_SetPlayerParam
	mov r2, r1
	mov r1, #6
	mov r3, #2
	bx ip
	.align 2, 0
_0207C858: .word Sndi_SetPlayerParam
	arm_func_end Snd_SetPlayerTempoRatio

	arm_func_start Snd_SetPlayerVolume
Snd_SetPlayerVolume: ; 0x0207C85C
	ldr ip, _0207C870 ; =Sndi_SetPlayerParam
	mov r2, r1
	mov r1, #4
	mov r3, #1
	bx ip
	.align 2, 0
_0207C870: .word Sndi_SetPlayerParam
	arm_func_end Snd_SetPlayerVolume

	arm_func_start Snd_SetTrackPan
Snd_SetTrackPan: ; 0x0207C874
	stmdb sp!, {r3, lr}
	mov r3, r2
	mov ip, #2
	mov r2, #0xc
	str ip, [sp]
	bl Sndi_SetTrackParam
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetTrackPan

	arm_func_start Snd_SetTrackAllocatableChannel
Snd_SetTrackAllocatableChannel: ; 0x0207C890
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #9
	str ip, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetTrackAllocatableChannel

	arm_func_start Snd_StartTimer
Snd_StartTimer: ; 0x0207C8B8
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0xc
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_StartTimer

	arm_func_start Snd_StopTimer
Snd_StopTimer: ; 0x0207C8E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	mov r5, r7
	mov r4, #0
	b _0207C918
_0207C900:
	tst r5, #1
	beq _0207C910
	mov r0, r4
	bl Sndi_IncAlarmId
_0207C910:
	add r4, r4, #1
	mov r5, r5, lsr #1
_0207C918:
	cmp r4, #8
	bge _0207C928
	cmp r5, #0
	bne _0207C900
_0207C928:
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, #0xd
	str r6, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Snd_StopTimer

	arm_func_start Snd_SetupCapture
Snd_SetupCapture: ; 0x0207C944
	stmdb sp!, {r3, lr}
	mov r1, r1, lsl #0x1e
	orr r0, r1, r0, lsl #31
	ldr ip, [sp, #8]
	mov r1, r2
	orr r0, r0, ip, lsl #29
	ldr r2, [sp, #0xc]
	mov lr, #0
	orr r0, r0, r2, lsl #28
	ldr ip, [sp, #0x10]
	mov r2, r3
	orr r3, r0, ip, lsl #27
	mov r0, #0x11
	str lr, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetupCapture

	arm_func_start Snd_SetupAlarm
Snd_SetupAlarm: ; 0x0207C984
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r2
	mov r5, r1
	ldr r2, [sp, #0x18]
	mov r6, r0
	mov r1, r3
	bl Sndi_SetAlarmHandler
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	mov r0, #0x12
	bl PushCommand_impl
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end Snd_SetupAlarm

	arm_func_start Snd_LockChannel
Snd_LockChannel: ; 0x0207C9C4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1a
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_LockChannel

	arm_func_start Snd_UnlockChannel
Snd_UnlockChannel: ; 0x0207C9E4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1b
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_UnlockChannel

	arm_func_start Snd_SetChannelTimer
Snd_SetChannelTimer: ; 0x0207CA04
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x13
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetChannelTimer

	arm_func_start Snd_SetChannelVolume
Snd_SetChannelVolume: ; 0x0207CA24
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #0x14
	str ip, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetChannelVolume

	arm_func_start Snd_SetChannelPan
Snd_SetChannelPan: ; 0x0207CA4C
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x15
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetChannelPan

	arm_func_start Snd_SetupChannelPcm
Snd_SetupChannelPcm: ; 0x0207CA6C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [sp, #0x1c]
	mov r1, r1, lsl #0x18
	orr r4, r1, r3, lsl #26
	ldr r5, [sp, #0x24]
	mov r1, ip, lsl #0x16
	ldr r3, [sp, #0x18]
	ldr ip, [sp, #0x10]
	orr r4, r4, r5, lsl #16
	orr r4, ip, r4
	ldr lr, [sp, #0x20]
	orr r3, r1, r3, lsl #24
	ldr ip, [sp, #0x14]
	orr r1, r0, lr, lsl #16
	orr r3, ip, r3
	mov r0, #0xe
	str r4, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Snd_SetupChannelPcm

	arm_func_start Snd_SetupChannelPsg
Snd_SetupChannelPsg: ; 0x0207CAB8
	stmdb sp!, {r3, lr}
	ldr lr, [sp, #8]
	ldr ip, [sp, #0xc]
	str r1, [sp]
	orr r2, r2, r3, lsl #8
	mov r1, r0
	orr r3, ip, lr, lsl #8
	mov r0, #0xf
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetupChannelPsg

	arm_func_start Snd_SetupChannelNoise
Snd_SetupChannelNoise: ; 0x0207CAE0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x10]
	mov r4, r1
	mov lr, #0
	mov r1, r0
	orr r2, r4, r2, lsl #8
	orr r3, ip, r3, lsl #8
	mov r0, #0x10
	str lr, [sp]
	bl PushCommand_impl
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end Snd_SetupChannelNoise

	arm_func_start Snd_InvalidateSeqData
Snd_InvalidateSeqData: ; 0x0207CB14
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1f
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_InvalidateSeqData

	arm_func_start Snd_InvalidateBankData
Snd_InvalidateBankData: ; 0x0207CB34
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x20
	str r3, [sp]
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_InvalidateBankData

	arm_func_start Snd_SetOutputSelector
Snd_SetOutputSelector: ; 0x0207CB54
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0x19
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Snd_SetOutputSelector

	arm_func_start Sndi_SetPlayerParam
Sndi_SetPlayerParam: ; 0x0207CB7C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #6
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Sndi_SetPlayerParam

	arm_func_start Sndi_SetTrackParam
Sndi_SetTrackParam: ; 0x0207CBA4
	stmdb sp!, {r3, lr}
	ldr ip, [sp, #8]
	mov lr, r2
	str r3, [sp]
	mov r2, r1
	orr r1, r0, ip, lsl #24
	mov r3, lr
	mov r0, #7
	bl PushCommand_impl
	ldmia sp!, {r3, pc}
	arm_func_end Sndi_SetTrackParam

	arm_func_start PushCommand_impl
PushCommand_impl: ; 0x0207CBCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #1
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl Snd_AllocCommand
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r7, [r0, #4]
	str r6, [r0, #8]
	str r5, [r0, #0xc]
	ldr r1, [sp, #0x18]
	str r4, [r0, #0x10]
	str r1, [r0, #0x14]
	bl Snd_PushCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end PushCommand_impl

	arm_func_start SND_Init
SND_Init: ; 0x0207CC10
	stmdb sp!, {r3, lr}
	ldr r1, _0207CC40 ; =_022B99EC
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0207CC44 ; =_022B99F0
	mov r2, #1
	str r2, [r1]
	bl OS_InitMutex
	bl SND_CommandInit
	bl Snd_AlarmInit
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207CC40: .word _022B99EC
_0207CC44: .word _022B99F0
	arm_func_end SND_Init

	arm_func_start Sndi_LockMutex
Sndi_LockMutex: ; 0x0207CC48
	ldr ip, _0207CC54 ; =OS_LockMutex
	ldr r0, _0207CC58 ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC54: .word OS_LockMutex
_0207CC58: .word _022B99F0
	arm_func_end Sndi_LockMutex

	arm_func_start Sndi_UnlockMutex
Sndi_UnlockMutex: ; 0x0207CC5C
	ldr ip, _0207CC68 ; =OS_UnlockMutex
	ldr r0, _0207CC6C ; =_022B99F0
	bx ip
	.align 2, 0
_0207CC68: .word OS_UnlockMutex
_0207CC6C: .word _022B99F0
	arm_func_end Sndi_UnlockMutex

	arm_func_start SND_CommandInit
SND_CommandInit: ; 0x0207CC70
	stmdb sp!, {r4, lr}
	bl InitPxi
	ldr lr, _0207CD2C ; =_022B9D00
	ldr r0, _0207CD30 ; =_022B9A20
	mov r4, #0
	str lr, [r0]
	mov r0, #0x18
	mov r1, r0
	b _0207CCA8
_0207CC94:
	add r3, r4, #1
	mul r2, r4, r1
	mla ip, r3, r0, lr
	mov r4, r3
	str ip, [lr, r2]
_0207CCA8:
	cmp r4, #0xff
	blt _0207CC94
	ldr r0, _0207CD34 ; =_022BAA20
	mov r3, #0
	str r3, [r0, #0xac8]
	ldr r1, _0207CD38 ; =_022BB4E8
	ldr r2, _0207CD30 ; =_022B9A20
	mov r0, #1
	str r1, [r2, #0x10]
	str r3, [r2, #8]
	str r3, [r2, #0xc]
	str r3, [r2, #0x1c]
	str r3, [r2, #0x14]
	str r3, [r2, #0x18]
	str r0, [r2, #0x20]
	ldr r0, _0207CD3C ; =_022B9A80
	ldr r1, _0207CD40 ; =_022BB560
	str r3, [r2, #4]
	str r0, [r1]
	bl Sndi_InitSharedWork
	mov r0, #1
	bl Snd_AllocCommand
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0x1d
	ldr r1, _0207CD40 ; =_022BB560
	str r2, [r0, #4]
	ldr r1, [r1]
	str r1, [r0, #8]
	bl Snd_PushCommand
	mov r0, #1
	bl Snd_FlushCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207CD2C: .word _022B9D00
_0207CD30: .word _022B9A20
_0207CD34: .word _022BAA20
_0207CD38: .word _022BB4E8
_0207CD3C: .word _022B9A80
_0207CD40: .word _022BB560
	arm_func_end SND_CommandInit

	arm_func_start Snd_RecvCommandReply
Snd_RecvCommandReply: ; 0x0207CD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r4, r0
	tst r5, #1
	beq _0207CDA0
	bl Sndi_GetFinishedCommandTag
	ldr r5, _0207CE4C ; =_022B9A20
	ldr r1, [r5, #4]
	cmp r1, r0
	bne _0207CDC4
	mov r6, #0x64
_0207CD74:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	bl OS_SpinWait
	bl EnableIrqFlag
	mov r4, r0
	bl Sndi_GetFinishedCommandTag
	ldr r1, [r5, #4]
	cmp r1, r0
	beq _0207CD74
	b _0207CDC4
_0207CDA0:
	bl Sndi_GetFinishedCommandTag
	ldr r1, _0207CE4C ; =_022B9A20
	ldr r1, [r1, #4]
	cmp r1, r0
	bne _0207CDC4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0207CDC4:
	ldr r0, _0207CE4C ; =_022B9A20
	ldr r2, _0207CE50 ; =_022B9A44
	ldr r3, [r0, #0x14]
	add r1, r3, #1
	ldr r5, [r2, r3, lsl #2]
	str r1, [r0, #0x14]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x14]
	ldr r0, [r5]
	mov r2, r5
	cmp r0, #0
	beq _0207CE08
_0207CDF8:
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0
	bne _0207CDF8
_0207CE08:
	ldr r0, _0207CE4C ; =_022B9A20
	ldr r1, [r0, #0x10]
	cmp r1, #0
	strne r5, [r1]
	streq r5, [r0]
	ldr r1, _0207CE4C ; =_022B9A20
	mov r0, r4
	str r2, [r1, #0x10]
	ldr r2, [r1, #0x1c]
	sub r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	bl SetIrqFlag
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207CE4C: .word _022B9A20
_0207CE50: .word _022B9A44
	arm_func_end Snd_RecvCommandReply

	arm_func_start Snd_AllocCommand
Snd_AllocCommand: ; 0x0207CE54
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsCommandAvailable
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl AllocCommand
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	tst r4, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl Snd_CountWaitingCommand
	cmp r0, #0
	ble _0207CEB4
	mov r4, #0
_0207CE94:
	mov r0, r4
	bl Snd_RecvCommandReply
	cmp r0, #0
	bne _0207CE94
	bl AllocCommand
	cmp r0, #0
	beq _0207CEBC
	ldmia sp!, {r4, pc}
_0207CEB4:
	mov r0, #1
	bl Snd_FlushCommand
_0207CEBC:
	bl RequestCommandProc
	mov r4, #1
_0207CEC4:
	mov r0, r4
	bl Snd_RecvCommandReply
	bl AllocCommand
	cmp r0, #0
	beq _0207CEC4
	ldmia sp!, {r4, pc}
	arm_func_end Snd_AllocCommand

	arm_func_start Snd_PushCommand
Snd_PushCommand: ; 0x0207CEDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207CF10 ; =_022B9A20
	ldr r2, [r1, #0xc]
	cmp r2, #0
	streq r4, [r1, #8]
	strne r4, [r2]
	str r4, [r1, #0xc]
	mov r1, #0
	str r1, [r4]
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207CF10: .word _022B9A20
	arm_func_end Snd_PushCommand

	arm_func_start Snd_FlushCommand
Snd_FlushCommand: ; 0x0207CF14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl EnableIrqFlag
	ldr r4, _0207D0C4 ; =_022B9A20
	mov sb, r0
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _0207CF40
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF40:
	ldr r1, [r4, #0x1c]
	cmp r1, #8
	blt _0207CF98
	tst sl, #1
	bne _0207CF60
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF60:
	mov r5, #1
_0207CF64:
	mov r0, r5
	bl Snd_RecvCommandReply
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _0207CF64
	ldr r0, _0207D0C4 ; =_022B9A20
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0207CF98
	mov r0, sb
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CF98:
	ldr r0, _0207D0C8 ; =_022B9D00
	mov r1, #0x1800
	bl DC_FlushRange
	ldr r1, _0207D0C4 ; =_022B9A20
	mov r0, #7
	ldr r1, [r1, #8]
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	bge _0207D058
	tst sl, #1
	bne _0207CFD8
	mov r0, sb
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207CFD8:
	mov fp, #0
	mov r5, #7
	mov r8, fp
	ldr r7, _0207D0C8 ; =_022B9D00
	mov r6, #0x1800
	ldr r4, _0207D0C4 ; =_022B9A20
	b _0207D034
_0207CFF4:
	mov r0, sb
	bl SetIrqFlag
	mov r0, r8
	bl Snd_RecvCommandReply
	bl EnableIrqFlag
	mov sb, r0
	mov r0, r7
	mov r1, r6
	bl DC_FlushRange
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0207D034
	mov r0, sb
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207D034:
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _0207CFF4
	ldr r1, [r4, #8]
	mov r0, r5
	mov r2, fp
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _0207CFF4
_0207D058:
	ldr r0, _0207D0C4 ; =_022B9A20
	ldr r2, _0207D0CC ; =_022B9A44
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #8]
	add r1, r3, #1
	str r4, [r2, r3, lsl #2]
	str r1, [r0, #0x18]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x18]
	ldr r1, _0207D0C4 ; =_022B9A20
	mov r0, #0
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r2, [r1, #0x1c]
	mov r0, sb
	add r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #0x20]
	add r2, r2, #1
	str r2, [r1, #0x20]
	bl SetIrqFlag
	tst sl, #2
	beq _0207D0BC
	bl RequestCommandProc
_0207D0BC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207D0C4: .word _022B9A20
_0207D0C8: .word _022B9D00
_0207D0CC: .word _022B9A44
	arm_func_end Snd_FlushCommand

	arm_func_start Snd_WaitForCommandProc
Snd_WaitForCommandProc: ; 0x0207D0D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl Snd_IsFinishedCommandTag
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207D0E8:
	mov r0, r4
	bl Snd_RecvCommandReply
	cmp r0, #0
	bne _0207D0E8
	mov r0, r5
	bl Snd_IsFinishedCommandTag
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl RequestCommandProc
	mov r0, r5
	bl Snd_IsFinishedCommandTag
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #1
_0207D120:
	mov r0, r4
	bl Snd_RecvCommandReply
	mov r0, r5
	bl Snd_IsFinishedCommandTag
	cmp r0, #0
	beq _0207D120
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Snd_WaitForCommandProc

	arm_func_start Snd_GetCurrentCommandTag
Snd_GetCurrentCommandTag: ; 0x0207D13C
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D164 ; =_022B9A20
	ldr r2, [r1, #8]
	cmp r2, #0
	ldreq r4, [r1, #4]
	ldrne r4, [r1, #0x20]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D164: .word _022B9A20
	arm_func_end Snd_GetCurrentCommandTag

	arm_func_start Snd_IsFinishedCommandTag
Snd_IsFinishedCommandTag: ; 0x0207D168
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EnableIrqFlag
	ldr r1, _0207D1B4 ; =_022B9A20
	ldr r1, [r1, #4]
	cmp r4, r1
	bls _0207D198
	sub r1, r4, r1
	cmp r1, #0x80000000
	movlo r4, #0
	movhs r4, #1
	b _0207D1A8
_0207D198:
	sub r1, r1, r4
	cmp r1, #0x80000000
	movlo r4, #1
	movhs r4, #0
_0207D1A8:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D1B4: .word _022B9A20
	arm_func_end Snd_IsFinishedCommandTag

	arm_func_start Snd_CountFreeCommand
Snd_CountFreeCommand: ; 0x0207D1B8
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D1F0 ; =_022B9A20
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _0207D1E4
_0207D1D4:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _0207D1D4
_0207D1E4:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D1F0: .word _022B9A20
	arm_func_end Snd_CountFreeCommand

	arm_func_start Snd_CountReservedCommand
Snd_CountReservedCommand: ; 0x0207D1F4
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D22C ; =_022B9A20
	mov r4, #0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _0207D220
_0207D210:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _0207D210
_0207D220:
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D22C: .word _022B9A20
	arm_func_end Snd_CountReservedCommand

	arm_func_start Snd_CountWaitingCommand
Snd_CountWaitingCommand: ; 0x0207D230
	stmdb sp!, {r4, lr}
	bl Snd_CountFreeCommand
	mov r4, r0
	bl Snd_CountReservedCommand
	rsb r1, r4, #0x100
	sub r0, r1, r0
	ldmia sp!, {r4, pc}
	arm_func_end Snd_CountWaitingCommand

	arm_func_start PxiFifoCallback
PxiFifoCallback: ; 0x0207D24C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl EnableIrqFlag
	mov r4, r0
	mov r0, r5
	bl Sndi_CallAlarmHandler
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PxiFifoCallback

	arm_func_start InitPxi
InitPxi: ; 0x0207D270
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0207D2CC ; =PxiFifoCallback
	mov r0, #7
	bl PXI_SetFifoRecvCallback
	bl IsCommandAvailable
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #7
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r6, #0x64
	mov r5, #7
	mov r4, #1
_0207D2AC:
	mov r0, r6
	bl OS_SpinWait
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _0207D2AC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207D2CC: .word PxiFifoCallback
	arm_func_end InitPxi

	arm_func_start RequestCommandProc
RequestCommandProc: ; 0x0207D2D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #7
	mov r4, #0
_0207D2DC:
	mov r0, r5
	mov r1, r4
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _0207D2DC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RequestCommandProc

	arm_func_start AllocCommand
AllocCommand: ; 0x0207D2F8
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _0207D33C ; =_022B9A20
	ldr r4, [r1]
	cmp r4, #0
	bne _0207D31C
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, pc}
_0207D31C:
	ldr r2, [r4]
	str r2, [r1]
	cmp r2, #0
	moveq r2, #0
	streq r2, [r1, #0x10]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D33C: .word _022B9A20
	arm_func_end AllocCommand

	arm_func_start IsCommandAvailable
IsCommandAvailable: ; 0x0207D340
	stmdb sp!, {r4, lr}
	bl OS_IsRunOnEmulator
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl EnableIrqFlag
	ldr r1, _0207D37C ; =0x04FFF200
	mov r2, #0x10
	str r2, [r1]
	ldr r4, [r1]
	bl SetIrqFlag
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207D37C: .word 0x04FFF200
	arm_func_end IsCommandAvailable

	arm_func_start Snd_AlarmInit
Snd_AlarmInit: ; 0x0207D380
	mov r1, #0
	ldr r2, _0207D3AC ; =_022BB500
	mov r0, r1
_0207D38C:
	str r0, [r2]
	str r0, [r2, #4]
	add r1, r1, #1
	strb r0, [r2, #8]
	cmp r1, #8
	add r2, r2, #0xc
	blt _0207D38C
	bx lr
	.align 2, 0
_0207D3AC: .word _022BB500
	arm_func_end Snd_AlarmInit

	arm_func_start Sndi_IncAlarmId
Sndi_IncAlarmId: ; 0x0207D3B0
	ldr r2, _0207D3CC ; =_022BB500
	mov r1, #0xc
	mla r1, r0, r1, r2
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_0207D3CC: .word _022BB500
	arm_func_end Sndi_IncAlarmId

	arm_func_start Sndi_SetAlarmHandler
Sndi_SetAlarmHandler: ; 0x0207D3D0
	mov r3, #0xc
	mul r3, r0, r3
	ldr r0, _0207D3FC ; =_022BB500
	str r1, [r0, r3]
	add r1, r0, r3
	str r2, [r1, #4]
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0207D3FC: .word _022BB500
	arm_func_end Sndi_SetAlarmHandler

	arm_func_start Sndi_CallAlarmHandler
Sndi_CallAlarmHandler: ; 0x0207D400
	stmdb sp!, {r3, lr}
	ldr r3, _0207D440 ; =_022BB500
	and r2, r0, #0xff
	mov r1, #0xc
	mla r3, r2, r1, r3
	mov r1, r0, asr #8
	ldrb r0, [r3, #8]
	and r1, r1, #0xff
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	ldr r1, [r3]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r3, #4]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D440: .word _022BB500
	arm_func_end Sndi_CallAlarmHandler

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

	arm_func_start FSi_ReleaseCommand
FSi_ReleaseCommand: ; 0x0207DCC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r6, r0
	ldr r0, [r5, #4]
	cmp r1, #0
	strne r0, [r1, #4]
	cmp r0, #0
	strne r1, [r0]
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	ldr r1, [r5, #0xc]
	add r0, r5, #0x18
	bic r1, r1, #0x4f
	str r1, [r5, #0xc]
	str r4, [r5, #0x14]
	bl OS_WakeupThread
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FSi_ReleaseCommand

	arm_func_start FSi_TranslateCommand
FSi_TranslateCommand: ; 0x0207DD1C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0xc]
	ldr r5, [r8, #8]
	mov r7, r1
	mov r1, #1
	tst r0, #4
	mov r6, r1, lsl r7
	moveq r1, #0
	ldr r0, [r5, #0x1c]
	cmp r1, #0
	orrne r0, r0, #0x200
	orreq r0, r0, #0x100
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x58]
	tst r0, r6
	beq _0207DDC4
	ldr r2, [r5, #0x54]
	mov r0, r8
	mov r1, r7
	blx r2
	mov r4, r0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _0207DDC8
_0207DD80: ; jump table
	b _0207DDA4 ; case 0
	b _0207DDA4 ; case 1
	b _0207DDC8 ; case 2
	b _0207DDC8 ; case 3
	b _0207DDA4 ; case 4
	b _0207DDC8 ; case 5
	b _0207DDC8 ; case 6
	b _0207DDC8 ; case 7
	b _0207DDAC ; case 8
_0207DDA4:
	str r4, [r8, #0x14]
	b _0207DDC8
_0207DDAC:
	ldr r1, [r5, #0x58]
	mvn r0, r6
	and r0, r1, r0
	str r0, [r5, #0x58]
	mov r4, #7
	b _0207DDC8
_0207DDC4:
	mov r4, #7
_0207DDC8:
	cmp r4, #7
	bne _0207DDE4
	ldr r1, _0207DEA8 ; =_020AEBF8
	mov r0, r8
	ldr r1, [r1, r7, lsl #2]
	blx r1
	mov r4, r0
_0207DDE4:
	cmp r4, #6
	bne _0207DE5C
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DEA0
	bl EnableIrqFlag
	ldr r1, [r5, #0x1c]
	mov r7, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DE4C
	mov r4, #0
	mov r6, #1
_0207DE2C:
	add r0, r5, #0xc
	bl OS_SleepThread
	ldr r0, [r5, #0x1c]
	tst r0, #0x200
	movne r0, r6
	moveq r0, r4
	cmp r0, #0
	bne _0207DE2C
_0207DE4C:
	mov r0, r7
	ldr r4, [r8, #0x14]
	bl SetIrqFlag
	b _0207DEA0
_0207DE5C:
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _0207DE90
	ldr r1, [r5, #0x1c]
	mov r0, r8
	bic r2, r1, #0x100
	mov r1, r4
	str r2, [r5, #0x1c]
	bl FSi_ReleaseCommand
	b _0207DEA0
_0207DE90:
	ldr r0, [r5, #0x1c]
	bic r0, r0, #0x200
	str r0, [r5, #0x1c]
	str r4, [r8, #0x14]
_0207DEA0:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207DEA8: .word _020AEBF8
	arm_func_end FSi_TranslateCommand

	arm_func_start FSi_StrNiCmp
FSi_StrNiCmp: ; 0x0207DEAC
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	bls _0207DEF4
_0207DEBC:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	sub ip, ip, #0x41
	cmp ip, #0x19
	sub r3, r3, #0x41
	addls ip, ip, #0x20
	cmp r3, #0x19
	addls r3, r3, #0x20
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blo _0207DEBC
_0207DEF4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FSi_StrNiCmp

	arm_func_start FSi_ReadTable
FSi_ReadTable: ; 0x0207DEFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldr r4, [r7]
	mov r6, r2
	ldr r2, [r4, #0x1c]
	mov r0, r4
	orr r2, r2, #0x200
	str r2, [r4, #0x1c]
	ldr r2, [r7, #4]
	ldr r5, [r4, #0x50]
	mov r3, r6
	blx r5
	cmp r0, #0
	cmpne r0, #1
	beq _0207DF44
	cmp r0, #6
	beq _0207DF54
	b _0207DFAC
_0207DF44:
	ldr r1, [r4, #0x1c]
	bic r1, r1, #0x200
	str r1, [r4, #0x1c]
	b _0207DFAC
_0207DF54:
	bl EnableIrqFlag
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0207DF9C
	mov r8, #0
	mov sb, #1
_0207DF7C:
	add r0, r4, #0xc
	bl OS_SleepThread
	ldr r0, [r4, #0x1c]
	tst r0, #0x200
	movne r0, sb
	moveq r0, r8
	cmp r0, #0
	bne _0207DF7C
_0207DF9C:
	mov r0, r5
	bl SetIrqFlag
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x14]
_0207DFAC:
	ldr r1, [r7, #4]
	add r1, r1, r6
	str r1, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FSi_ReadTable

	arm_func_start FSi_SeekDirDirect
FSi_SeekDirDirect: ; 0x0207DFBC
	ldr r3, [r0, #0xc]
	mov r2, #0
	orr r3, r3, #4
	str r3, [r0, #0xc]
	ldr r3, [r0, #8]
	ldr ip, _0207DFEC ; =FSi_TranslateCommand
	str r3, [r0, #0x30]
	str r2, [r0, #0x38]
	strh r2, [r0, #0x36]
	strh r1, [r0, #0x34]
	mov r1, #2
	bx ip
	.align 2, 0
_0207DFEC: .word FSi_TranslateCommand
	arm_func_end FSi_SeekDirDirect

	arm_func_start FSi_ReadFileCommand
FSi_ReadFileCommand: ; 0x0207DFF0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x48]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end FSi_ReadFileCommand

	arm_func_start FSi_WriteFileCommand
FSi_WriteFileCommand: ; 0x0207E01C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x4c]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end FSi_WriteFileCommand

	arm_func_start FSi_SeekDirCommand
FSi_SeekDirCommand: ; 0x0207E048
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r4, [r6, #8]
	add r5, r6, #0x30
	str r4, [sp]
	ldrh r1, [r5, #4]
	ldr r2, [r4, #0x34]
	add r0, sp, #0
	add r3, r2, r1, lsl #3
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl FSi_ReadTable
	movs r3, r0
	bne _0207E0D0
	add ip, r6, #0x20
	ldmia r5, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrh r0, [r5, #6]
	cmp r0, #0
	ldreq r0, [r5, #8]
	cmpeq r0, #0
	bne _0207E0C0
	ldrh r0, [sp, #0xc]
	strh r0, [r6, #0x26]
	ldr r1, [r4, #0x34]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r6, #0x28]
_0207E0C0:
	ldrh r1, [sp, #0xe]
	ldr r0, _0207E0DC ; =0x00000FFF
	and r0, r1, r0
	str r0, [r6, #0x2c]
_0207E0D0:
	mov r0, r3
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207E0DC: .word 0x00000FFF
	arm_func_end FSi_SeekDirCommand

	arm_func_start FSi_ReadDirCommand
FSi_ReadDirCommand: ; 0x0207E0E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r4, [r5, #0x30]
	ldr r1, [r5, #8]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r3, [r5, #0x28]
	add r1, sp, #0
	mov r2, #1
	str r3, [sp, #8]
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldrb r1, [sp]
	and r2, r1, #0x7f
	mov r1, r1, asr #7
	str r2, [r4, #0x10]
	and r1, r1, #1
	str r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	cmp r2, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _0207E180
	add r0, sp, #4
	add r1, r4, #0x14
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, [r4, #0x10]
	mov r2, #0
	add r1, r4, r1
	strb r2, [r1, #0x14]
	b _0207E18C
_0207E180:
	ldr r1, [sp, #8]
	add r1, r1, r2
	str r1, [sp, #8]
_0207E18C:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _0207E1DC
	add r0, sp, #4
	add r1, sp, #2
	mov r2, #2
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r2, [r5, #8]
	ldr r1, _0207E208 ; =0x00000FFF
	str r2, [r4]
	ldrh r3, [sp, #2]
	mov r2, #0
	and r1, r3, r1
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	str r2, [r4, #8]
	b _0207E1F8
_0207E1DC:
	ldr r1, [r5, #8]
	str r1, [r4]
	ldrh r1, [r5, #0x26]
	str r1, [r4, #4]
	ldrh r1, [r5, #0x26]
	add r1, r1, #1
	strh r1, [r5, #0x26]
_0207E1F8:
	ldr r1, [sp, #8]
	str r1, [r5, #0x28]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0207E208: .word 0x00000FFF
	arm_func_end FSi_ReadDirCommand

	arm_func_start FSi_FindPathCommand
FSi_FindPathCommand: ; 0x0207E20C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x94
	mov sb, r0
	ldr r5, [sb, #0x3c]
	mov r1, #2
	ldr r6, [sb, #0x40]
	bl FSi_TranslateCommand
	ldrb r3, [r5]
	cmp r3, #0
	beq _0207E3C4
_0207E234:
	mov r8, #0
	mov r0, #1
	mov r1, r8
	b _0207E248
_0207E244:
	add r8, r8, #1
_0207E248:
	ldrb r7, [r5, r8]
	mov r2, r1
	cmp r7, #0
	cmpne r7, #0x2f
	cmpne r7, #0x5c
	movne r2, r0
	cmp r2, #0
	bne _0207E244
	cmp r7, #0
	cmpeq r6, #0
	movne r7, #1
	cmp r8, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r3, #0x2e
	bne _0207E2DC
	cmp r8, #1
	addeq r5, r5, #1
	beq _0207E3A8
	ldrb r0, [r5, #1]
	cmp r8, #2
	moveq r1, #1
	movne r1, #0
	cmp r0, #0x2e
	moveq r0, #1
	movne r0, #0
	tst r1, r0
	beq _0207E2DC
	ldrh r0, [sb, #0x24]
	cmp r0, #0
	beq _0207E2D4
	ldr r1, [sb, #0x2c]
	mov r0, sb
	bl FSi_SeekDirDirect
_0207E2D4:
	add r5, r5, #2
	b _0207E3A8
_0207E2DC:
	cmp r8, #0x7f
	addgt sp, sp, #0x94
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0
	mov r0, #0
	str r1, [sb, #0x30]
	str r0, [sb, #0x34]
	add sl, sp, #0x14
	mov r4, #3
_0207E304:
	mov r0, sb
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [sp, #0xc]
	cmp r7, r0
	ldreq r0, [sp, #0x10]
	cmpeq r8, r0
	bne _0207E304
	mov r0, r5
	mov r1, sl
	mov r2, r8
	bl FSi_StrNiCmp
	cmp r0, #0
	bne _0207E304
	cmp r7, #0
	beq _0207E378
	add r0, sp, #0
	add r3, sb, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	mov r1, #2
	add r5, r5, r8
	bl FSi_TranslateCommand
	b _0207E3A8
_0207E378:
	cmp r6, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, sp, #0x94
	str r2, [r3]
	mov r0, #0
	str r1, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_0207E3A8:
	ldrb r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldrb r3, [r5, r0]!
	cmp r3, #0
	bne _0207E234
_0207E3C4:
	cmp r6, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	add r0, sb, #0x20
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #0
	add sp, sp, #0x94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end FSi_FindPathCommand

	arm_func_start FSi_GetPathCommand
FSi_GetPathCommand: ; 0x0207E3F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe0
	mov sl, r0
	ldr r1, [sl, #8]
	add r0, sp, #4
	str r1, [sp]
	bl FileInit
	ldr r0, [sl, #8]
	str r0, [sp, #0xc]
	ldr r0, [sl, #0xc]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldrneh sb, [sl, #0x24]
	movne r6, #0x10000
	bne _0207E4D4
	ldrh r0, [sl, #0x38]
	ldr r6, [sl, #0x20]
	cmp r0, #0
	ldrneh sb, [sl, #0x3a]
	bne _0207E4D4
	mov r7, #0
	mov r8, r7
	mov sb, #0x10000
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E460:
	mov r0, r5
	mov r1, r7
	bl FSi_SeekDirDirect
	mov r2, #1
	cmp r7, #0
	mov r0, r5
	mov r1, #3
	ldreq r8, [sp, #0x30]
	str fp, [sp, #0x34]
	str r2, [sp, #0x38]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E4C0
_0207E494:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	ldreqh sb, [sp, #0x28]
	beq _0207E4C0
	mov r0, r5
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E494
_0207E4C0:
	cmp sb, #0x10000
	bne _0207E4D4
	add r7, r7, #1
	cmp r7, r8
	blo _0207E460
_0207E4D4:
	cmp sb, #0x10000
	bne _0207E4F0
	mov r0, #0
	strh r0, [sl, #0x38]
	add sp, sp, #0xe0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0207E4F0:
	ldrh r0, [sl, #0x38]
	cmp r0, #0
	bne _0207E5D4
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0]
	cmp r0, #0xff
	addls r8, r1, #1
	bls _0207E520
	cmp r0, #0xff00
	addls r8, r1, #2
	addhi r8, r1, #3
_0207E520:
	cmp r6, #0x10000
	ldrne r0, [sp, #0x5c]
	add r8, r8, #2
	addne r8, r8, r0
	mov r7, sb
	cmp sb, #0
	beq _0207E5C8
	add r0, sp, #4
	mov r1, sb
	bl FSi_SeekDirDirect
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_0207E554:
	ldr r1, [sp, #0x30]
	mov r0, r5
	bl FSi_SeekDirDirect
	mov r1, #1
	str r1, [sp, #0x38]
	mov r0, r5
	mov r1, #3
	str fp, [sp, #0x34]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E5BC
_0207E580:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E5A8
	ldrh r0, [sp, #0x50]
	cmp r0, r7
	bne _0207E5A8
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	add r8, r8, r0
	b _0207E5BC
_0207E5A8:
	mov r0, r5
	mov r1, r4
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E580
_0207E5BC:
	ldrh r7, [sp, #0x28]
	cmp r7, #0
	bne _0207E554
_0207E5C8:
	add r0, r8, #1
	strh r0, [sl, #0x38]
	strh sb, [sl, #0x3a]
_0207E5D4:
	ldr r5, [sl, #0x30]
	cmp r5, #0
	addeq sp, sp, #0xe0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r4, [sl, #0x38]
	ldr r0, [sl, #0x34]
	cmp r0, r4
	addlo sp, sp, #0xe0
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp]
	mov r7, #0
	ldr r0, [r0]
	cmp r0, #0xff
	movls r8, #1
	bls _0207E624
	cmp r0, #0xff00
	movls r8, #2
	movhi r8, #3
_0207E624:
	ldr r0, [sp]
	mov r1, r5
	mov r2, r8
	bl MI_CpuCopy8
	add r1, r7, r8
	ldr r0, _0207E798 ; =_020B2BB0
	add r1, r5, r1
	mov r2, #2
	bl MI_CpuCopy8
	add r0, sp, #4
	mov r1, sb
	bl FSi_SeekDirDirect
	cmp r6, #0x10000
	beq _0207E6D4
	add r3, sp, #0x4c
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E6B0
	add r8, sp, #4
	mov r7, #3
_0207E688:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	beq _0207E6B0
	mov r0, r8
	mov r1, r7
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E688
_0207E6B0:
	ldr r0, [sp, #0x5c]
	add r1, r5, r4
	add r6, r0, #1
	add r0, sp, #0x60
	mov r2, r6
	sub r1, r1, r6
	bl MI_CpuCopy8
	sub r4, r4, r6
	b _0207E6E4
_0207E6D4:
	add r0, r5, r4
	mov r1, #0
	strb r1, [r0, #-1]
	sub r4, r4, #1
_0207E6E4:
	cmp sb, #0
	beq _0207E78C
	add sl, sp, #4
	mov r6, #3
	add r8, sp, #0x4c
	mov r7, #0
	mov fp, #0x2f
_0207E700:
	ldr r1, [sp, #0x30]
	mov r0, sl
	bl FSi_SeekDirDirect
	add r1, r5, r4
	str r8, [sp, #0x34]
	str r7, [sp, #0x38]
	strb fp, [r1, #-1]
	mov r0, sl
	mov r1, #3
	sub r4, r4, #1
	bl FSi_TranslateCommand
	cmp r0, #0
	bne _0207E780
_0207E734:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _0207E76C
	ldrh r0, [sp, #0x50]
	cmp r0, sb
	bne _0207E76C
	ldr sb, [sp, #0x5c]
	add r1, r5, r4
	add r0, sp, #0x60
	mov r2, sb
	sub r1, r1, sb
	bl MI_CpuCopy8
	sub r4, r4, sb
	b _0207E780
_0207E76C:
	mov r0, sl
	mov r1, r6
	bl FSi_TranslateCommand
	cmp r0, #0
	beq _0207E734
_0207E780:
	ldrh sb, [sp, #0x28]
	cmp sb, #0
	bne _0207E700
_0207E78C:
	mov r0, #0
	add sp, sp, #0xe0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0207E798: .word _020B2BB0
	arm_func_end FSi_GetPathCommand

	arm_func_start FSi_OpenFileFastCommand
FSi_OpenFileFastCommand: ; 0x0207E79C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r1, [r5, #8]
	ldr r4, [r5, #0x34]
	ldr r0, [r1, #0x30]
	mov r2, r4, lsl #3
	cmp r0, r4, lsl #3
	addls sp, sp, #0x10
	movls r0, #1
	ldmlsia sp!, {r3, r4, r5, pc}
	str r1, [sp]
	ldr r1, [r1, #0x2c]
	add r0, sp, #0
	add r3, r1, r2
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl FSi_ReadTable
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #8]
	mov r0, r5
	str r1, [r5, #0x30]
	ldr r2, [sp, #0xc]
	mov r1, #7
	str r2, [r5, #0x34]
	str r4, [r5, #0x38]
	bl FSi_TranslateCommand
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end FSi_OpenFileFastCommand

