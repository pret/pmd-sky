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

