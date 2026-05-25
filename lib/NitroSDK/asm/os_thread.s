	.include "asm/macros.inc"
	.include "include/os_thread.inc"

	.text

    arm_func_start IncrementThreadCount
IncrementThreadCount: ; 0x02079150
	ldr r1, _02079164 ; =THREAD_INFO_STRUCT
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_02079164: .word THREAD_INFO_STRUCT
	arm_func_end IncrementThreadCount

	arm_func_start OSi_InsertLinkToQueue
OSi_InsertLinkToQueue: ; 0x02079168
	ldr ip, [r0]
	b _0207917C
_02079170:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x80]
_0207917C:
	cmp ip, #0
	beq _02079194
	ldr r3, [ip, #0x70]
	ldr r2, [r1, #0x70]
	cmp r3, r2
	bls _02079170
_02079194:
	cmp ip, #0
	bne _020791C0
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	mov r2, #0
	str r2, [r1, #0x80]
	str r1, [r0, #4]
	bx lr
_020791C0:
	ldr r2, [ip, #0x7c]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	str ip, [r1, #0x80]
	str r1, [ip, #0x7c]
	bx lr
	arm_func_end OSi_InsertLinkToQueue

	arm_func_start OSi_RemoveLinkFromQueue
OSi_RemoveLinkFromQueue: ; 0x020791E0
	ldr r2, [r0]
	cmp r2, #0
	beq _0207920C
	ldr r1, [r2, #0x80]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x7c]
	moveq r1, #0
	streq r1, [r0, #4]
	streq r1, [r2, #0x78]
_0207920C:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveLinkFromQueue

	arm_func_start OSi_RemoveSpecifiedLinkFromQueue
OSi_RemoveSpecifiedLinkFromQueue: ; 0x02079214
	ldr ip, [r0]
	mov r2, ip
	cmp ip, #0
	beq _02079260
_02079224:
	cmp r2, r1
	ldr r3, [r2, #0x80]
	bne _02079254
	cmp ip, r2
	ldr ip, [r2, #0x7c]
	streq r3, [r0]
	strne r3, [ip, #0x80]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x7c]
	b _02079260
_02079254:
	mov r2, r3
	cmp r3, #0
	bne _02079224
_02079260:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveSpecifiedLinkFromQueue

	arm_func_start OSi_RemoveMutexLinkFromQueue
OSi_RemoveMutexLinkFromQueue: ; 0x02079268
	ldr r2, [r0]
	cmp r2, #0
	beq _02079290
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_02079290:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveMutexLinkFromQueue

	arm_func_start InsertThreadIntoList
InsertThreadIntoList: ; 0x02079298
	stmdb sp!, {r3, lr}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _020792B8
_020792B0:
	mov ip, r3
	ldr r3, [r3, #0x68]
_020792B8:
	cmp r3, #0
	beq _020792D0
	ldr r2, [r3, #0x70]
	ldr r1, [r0, #0x70]
	cmp r2, r1
	blo _020792B0
_020792D0:
	cmp ip, #0
	ldrne r1, [ip, #0x68]
	strne r1, [r0, #0x68]
	strne r0, [ip, #0x68]
	ldmneia sp!, {r3, pc}
	ldr r1, _020792F4 ; =THREAD_INFO_STRUCT
	str lr, [r0, #0x68]
	str r0, [r1, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020792F4: .word THREAD_INFO_STRUCT
	arm_func_end InsertThreadIntoList

	arm_func_start OSi_RemoveThreadFromList
OSi_RemoveThreadFromList: ; 0x020792F8
	ldr r1, _0207933C ; =THREAD_INFO_STRUCT
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _02079310
_02079308:
	mov r2, r1
	ldr r1, [r1, #0x68]
_02079310:
	cmp r1, #0
	cmpne r1, r0
	bne _02079308
	cmp r2, #0
	ldrne r0, [r0, #0x68]
	strne r0, [r2, #0x68]
	bxne lr
	ldr r1, [r0, #0x68]
	ldr r0, _0207933C ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_0207933C: .word THREAD_INFO_STRUCT
	arm_func_end OSi_RemoveThreadFromList

	arm_func_start OS_RescheduleThread
OS_RescheduleThread: ; 0x02079340
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r0, #0x26]
	ldr r4, _02079404 ; =_022B966C
	cmp r0, #0
	bne _02079370
	bl GetProcessorMode
	cmp r0, #0x12
	bne _0207937C
_02079370:
	mov r0, #1
	strh r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
_0207937C:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl OS_SelectThread
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r6, #0x64]
	cmp r0, #2
	beq _020793B8
	mov r0, r6
	bl OS_SaveContext
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_020793B8:
	ldr r0, _02079400 ; =THREAD_INFO_STRUCT
	ldr r2, [r0]
	cmp r2, #0
	beq _020793D4
	mov r0, r6
	mov r1, r5
	blx r2
_020793D4:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _020793EC
	mov r0, r6
	mov r1, r5
	blx r2
_020793EC:
	ldr r1, _02079400 ; =THREAD_INFO_STRUCT
	mov r0, r5
	str r5, [r1, #0x28]
	bl OS_LoadContext
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02079400: .word THREAD_INFO_STRUCT
_02079404: .word _022B966C
	arm_func_end OS_RescheduleThread

	arm_func_start OS_InitThread
OS_InitThread: ; 0x02079408
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	ldr r1, [r0, #0xc]
	cmp r1, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r1, _0207951C ; =_022B9670
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	mov r1, #0x10
	str r1, [r0, #0x164]
	mov r3, #0
	str r3, [r0, #0x160]
	str r2, [r0, #0x158]
	str r3, [r0, #0x15c]
	ldr r2, _02079520 ; =0x00000000
	ldr r1, _02079524 ; =_022B973C
	str r3, [r0, #0x168]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _02079528 ; =SDK_SECTION_ARENA_DTCM_START
	ble _0207947C
	ldr r1, _0207952C ; =OS_IRQTable
	ldr r0, _02079530 ; =0x00000800
	add r1, r1, #0x3f80
	sub r0, r1, r0
_0207947C:
	ldr r1, _0207952C ; =OS_IRQTable
	sub ip, r0, r2
	add r2, r1, #0x3f80
	ldr r0, _02079530 ; =0x00000800
	ldr r1, _02079518 ; =THREAD_INFO_STRUCT
	sub r3, r2, r0
	str r3, [r1, #0x188]
	str ip, [r1, #0x184]
	mov r0, #0
	ldr r2, _02079534 ; =0xFDDB597D
	str r0, [r1, #0x18c]
	str r2, [r3, #-4]
	ldr r2, [r1, #0x184]
	ldr ip, _02079538 ; =0x7BF9DD5B
	ldr r3, _0207953C ; =_022B966C
	str ip, [r2]
	str r0, [r1, #0x194]
	str r0, [r1, #0x190]
	strh r0, [r1, #0x24]
	ldr r2, _02079540 ; =0x027FFFA0
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl OS_SetSwitchThreadCallback
	mov r2, #0xc8
	str r2, [sp]
	mov ip, #0x1f
	ldr r0, _02079544 ; =_022B967C
	ldr r1, _02079548 ; =_02079C04
	ldr r3, _0207954C ; =_022B98C4
	mov r2, #0
	str ip, [sp, #4]
	bl StartThread
	ldr r0, _02079518 ; =THREAD_INFO_STRUCT
	mov r1, #0x20
	str r1, [r0, #0xa4]
	mov r1, #1
	str r1, [r0, #0x98]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079518: .word THREAD_INFO_STRUCT
_0207951C: .word _022B9670
_02079520: .word 0x00000000
_02079524: .word _022B973C
_02079528: .word SDK_SECTION_ARENA_DTCM_START
_0207952C: .word OS_IRQTable
_02079530: .word 0x00000800
_02079534: .word 0xFDDB597D
_02079538: .word 0x7BF9DD5B
_0207953C: .word _022B966C
_02079540: .word 0x027FFFA0
_02079544: .word _022B967C
_02079548: .word OSi_IdleThreadProc
_0207954C: .word _022B98C4
	arm_func_end OS_InitThread

	arm_func_start OS_IsThreadAvailable
OS_IsThreadAvailable: ; 0x02079550
	ldr r0, _0207955C ; =_022B9654
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0207955C: .word _022B9654
	arm_func_end OS_IsThreadAvailable

	arm_func_start StartThread
StartThread: ; 0x02079560
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl EnableIrqFlag
	mov r4, r0
	bl IncrementThreadCount
	ldr r2, [sp, #0x1c]
	mov r1, #0
	str r2, [r8, #0x70]
	str r0, [r8, #0x6c]
	str r1, [r8, #0x64]
	mov r0, r8
	str r1, [r8, #0x74]
	bl InsertThreadIntoList
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x94]
	sub r5, r6, r0
	sub r2, r6, #4
	mov ip, #0
	str r5, [r8, #0x90]
	str ip, [r8, #0x98]
	ldr r6, _02079650 ; =0xFDDB597D
	ldr r0, [r8, #0x94]
	ldr r3, _02079654 ; =0x7BF9DD5B
	str r6, [r0, #-4]
	ldr r0, [r8, #0x90]
	str r3, [r0]
	str ip, [r8, #0xa0]
	mov r0, r8
	str ip, [r8, #0x9c]
	bl InitThread
	ldr r2, _02079658 ; =ThreadExit
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl MTi_CpuClear32
	mov r1, #0
	str r1, [r8, #0x84]
	str r1, [r8, #0x88]
	mov r0, r8
	str r1, [r8, #0x8c]
	bl OS_SetThreadDestructor
	mov r0, #0
	str r0, [r8, #0x78]
	str r0, [r8, #0x80]
	add r1, r8, #0xa4
	mov r2, #0xc
	str r0, [r8, #0x7c]
	bl MTi_CpuClear32
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0xb0]
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079650: .word 0xFDDB597D
_02079654: .word 0x7BF9DD5B
_02079658: .word ThreadExit
	arm_func_end StartThread

	arm_func_start ThreadExit
ThreadExit: ; 0x0207965C
	stmdb sp!, {r3, lr}
	bl EnableIrqFlag
	ldr r0, _02079678 ; =THREAD_INFO_STRUCT
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl OSi_ExitThread_ArgSpecified
	ldmia sp!, {r3, pc}
	.align 2, 0
_02079678: .word THREAD_INFO_STRUCT
	arm_func_end ThreadExit

	arm_func_start OSi_ExitThread_ArgSpecified
OSi_ExitThread_ArgSpecified: ; 0x0207967C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020796D0 ; =THREAD_INFO_STRUCT
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _020796C4
	ldr r1, _020796D4 ; =OSi_ExitThread
	bl InitThread
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x64]
	bl OS_LoadContext
	ldmia sp!, {r3, r4, r5, pc}
_020796C4:
	mov r0, r4
	bl OSi_ExitThread
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020796D0: .word THREAD_INFO_STRUCT
_020796D4: .word OSi_ExitThread
	arm_func_end OSi_ExitThread_ArgSpecified

	arm_func_start OSi_ExitThread
OSi_ExitThread: ; 0x020796D8
	stmdb sp!, {r3, lr}
	ldr r1, _0207970C ; =THREAD_INFO_STRUCT
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _02079704
	mov r1, #0
	str r1, [r3, #0xb4]
	blx r2
	bl EnableIrqFlag
_02079704:
	bl OSi_ExitThread_Destroy
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207970C: .word THREAD_INFO_STRUCT
	arm_func_end OSi_ExitThread

	arm_func_start OSi_ExitThread_Destroy
OSi_ExitThread_Destroy: ; 0x02079710
	stmdb sp!, {r4, lr}
	ldr r0, _02079768 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl OS_DisableScheduler
	mov r0, r4
	bl OSi_UnlockAllMutex
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _02079740
	mov r1, r4
	bl OSi_RemoveSpecifiedLinkFromQueue
_02079740:
	mov r0, r4
	bl OSi_RemoveThreadFromList
	mov r1, #2
	add r0, r4, #0x9c
	str r1, [r4, #0x64]
	bl OS_WakeupThread
	bl OS_EnableScheduler
	bl sub_02079990
	bl WaitForever2
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079768: .word THREAD_INFO_STRUCT
	arm_func_end OSi_ExitThread_Destroy

	arm_func_start OS_DestroyThread
OS_DestroyThread: ; 0x0207976C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _020797E4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #0x28]
	cmp r0, r5
	bne _02079790
	bl OSi_ExitThread_Destroy
_02079790:
	bl OS_DisableScheduler
	mov r0, r5
	bl OSi_UnlockAllMutex
	mov r0, r5
	bl OSi_CancelThreadAlarmForSleep
	ldr r0, [r5, #0x78]
	cmp r0, #0
	beq _020797B8
	mov r1, r5
	bl OSi_RemoveSpecifiedLinkFromQueue
_020797B8:
	mov r0, r5
	bl OSi_RemoveThreadFromList
	mov r1, #2
	add r0, r5, #0x9c
	str r1, [r5, #0x64]
	bl OS_WakeupThread
	bl OS_EnableScheduler
	mov r0, r4
	bl SetIrqFlag
	bl sub_02079990
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020797E4: .word THREAD_INFO_STRUCT
	arm_func_end OS_DestroyThread

	arm_func_start OSi_CancelThreadAlarmForSleep
OSi_CancelThreadAlarmForSleep: ; 0x020797E8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl OS_CancelAlarm
	ldmia sp!, {r3, pc}
	arm_func_end OSi_CancelThreadAlarmForSleep

	arm_func_start OS_JoinThread
OS_JoinThread: ; 0x02079800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5, #0x64]
	mov r4, r0
	cmp r1, #2
	beq _02079824
	add r0, r5, #0x9c
	bl OS_SleepThread
_02079824:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_JoinThread

	arm_func_start OS_IsThreadTerminated
OS_IsThreadTerminated: ; 0x02079830
	ldr r0, [r0, #0x64]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end OS_IsThreadTerminated

	arm_func_start OS_SleepThreadDirect
OS_SleepThreadDirect: ; 0x02079844
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	bl EnableIrqFlag
	mov r4, r0
	cmp r5, #0
	beq _02079870
	mov r0, r5
	mov r1, r6
	str r5, [r6, #0x78]
	bl OSi_InsertLinkToQueue
_02079870:
	mov r0, #0
	str r0, [r6, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end OS_SleepThreadDirect

	arm_func_start OS_SleepThread
OS_SleepThread: ; 0x02079888
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl EnableIrqFlag
	ldr r1, _020798D4 ; =THREAD_INFO_STRUCT
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _020798BC
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x78]
	bl OSi_InsertLinkToQueue
_020798BC:
	mov r0, #0
	str r0, [r5, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020798D4: .word THREAD_INFO_STRUCT
	arm_func_end OS_SleepThread

	arm_func_start OS_WakeupThread
OS_WakeupThread: ; 0x020798D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl EnableIrqFlag
	ldr r1, [r7]
	mov r6, r0
	cmp r1, #0
	beq _02079934
	beq _02079924
	mov r5, #1
	mov r4, #0
_02079900:
	mov r0, r7
	bl OSi_RemoveLinkFromQueue
	str r5, [r0, #0x64]
	str r4, [r0, #0x78]
	str r4, [r0, #0x80]
	str r4, [r0, #0x7c]
	ldr r0, [r7]
	cmp r0, #0
	bne _02079900
_02079924:
	mov r0, #0
	str r0, [r7, #4]
	str r0, [r7]
	bl OS_RescheduleThread
_02079934:
	mov r0, r6
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_WakeupThread

	arm_func_start OS_WakeupThreadDirect
OS_WakeupThreadDirect: ; 0x02079940
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x64]
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_WakeupThreadDirect

	arm_func_start OS_SelectThread
OS_SelectThread: ; 0x02079968
	ldr r0, _0207998C ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #0x2c]
	b _02079978
_02079974:
	ldr r0, [r0, #0x68]
_02079978:
	cmp r0, #0
	ldrne r1, [r0, #0x64]
	cmpne r1, #1
	bne _02079974
	bx lr
	.align 2, 0
_0207998C: .word THREAD_INFO_STRUCT
	arm_func_end OS_SelectThread

	arm_func_start sub_02079990
sub_02079990: ; 0x02079990
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	mov r4, r0
	bl OS_RescheduleThread
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r4, pc}
	arm_func_end sub_02079990

	arm_func_start OS_YieldThread
OS_YieldThread: ; 0x020799AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	mov r4, #0
	mov r5, r4
	mov r6, r4
	ldr r8, [r0, #0x28]
	bl EnableIrqFlag
	ldr r1, _02079A60 ; =THREAD_INFO_STRUCT
	mov r7, r0
	ldr r1, [r1, #0x2c]
	mov r0, r4
	cmp r1, #0
	beq _02079A0C
	ldr r2, [r8, #0x70]
_020799E4:
	cmp r1, r8
	moveq r4, r0
	ldr r0, [r1, #0x70]
	cmp r2, r0
	moveq r5, r1
	mov r0, r1
	ldr r1, [r1, #0x68]
	addeq r6, r6, #1
	cmp r1, #0
	bne _020799E4
_02079A0C:
	cmp r6, #1
	ble _02079A1C
	cmp r5, r8
	bne _02079A28
_02079A1C:
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079A28:
	cmp r4, #0
	ldrne r0, [r8, #0x68]
	strne r0, [r4, #0x68]
	bne _02079A44
	ldr r1, [r8, #0x68]
	ldr r0, _02079A60 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079A44:
	ldr r0, [r5, #0x68]
	str r0, [r8, #0x68]
	str r8, [r5, #0x68]
	bl OS_RescheduleThread
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079A60: .word THREAD_INFO_STRUCT
	arm_func_end OS_YieldThread

	arm_func_start OS_SetThreadPriority
OS_SetThreadPriority: ; 0x02079A64
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02079B04 ; =THREAD_INFO_STRUCT
	mov r7, r0
	mov r6, r1
	ldr r8, [r2, #0x2c]
	mov r4, #0
	bl EnableIrqFlag
	mov r5, r0
	b _02079A90
_02079A88:
	mov r4, r8
	ldr r8, [r8, #0x68]
_02079A90:
	cmp r8, #0
	cmpne r8, r7
	bne _02079A88
	cmp r8, #0
	ldrne r0, _02079B08 ; =_022B967C
	cmpne r8, r0
	bne _02079ABC
	mov r0, r5
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02079ABC:
	ldr r0, [r8, #0x70]
	cmp r0, r6
	beq _02079AF4
	cmp r4, #0
	ldrne r0, [r7, #0x68]
	strne r0, [r4, #0x68]
	bne _02079AE4
	ldr r1, [r7, #0x68]
	ldr r0, _02079B04 ; =THREAD_INFO_STRUCT
	str r1, [r0, #0x2c]
_02079AE4:
	mov r0, r7
	str r6, [r7, #0x70]
	bl InsertThreadIntoList
	bl OS_RescheduleThread
_02079AF4:
	mov r0, r5
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02079B04: .word THREAD_INFO_STRUCT
_02079B08: .word _022B967C
	arm_func_end OS_SetThreadPriority

	arm_func_start OS_GetThreadPriority
OS_GetThreadPriority: ; 0x02079B0C
	ldr r0, [r0, #0x70]
	bx lr
	arm_func_end OS_GetThreadPriority

	arm_func_start OS_Sleep
OS_Sleep: ; 0x02079B14
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r4, r0
	add r0, sp, #8
	bl OS_CreateAlarm
	ldr r0, _02079BB0 ; =THREAD_INFO_STRUCT
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl EnableIrqFlag
	ldr r1, _02079BB4 ; =0x000082EA
	mov r2, #0
	umull r5, r3, r4, r1
	mla r3, r4, r2, r3
	mla r3, r2, r1, r3
	mov r1, r5, lsr #6
	mov r4, r0
	ldr r5, [sp, #4]
	add r0, sp, #8
	add r2, sp, #4
	str r0, [r5, #0xb0]
	str r2, [sp]
	mov r2, r3, lsr #6
	orr r1, r1, r3, lsl #26
	ldr r3, _02079BB8 ; =OSi_SleepAlarmCallback
	bl OS_SetAlarm
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02079BA0
	mov r5, #0
_02079B8C:
	mov r0, r5
	bl OS_SleepThread
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02079B8C
_02079BA0:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02079BB0: .word THREAD_INFO_STRUCT
_02079BB4: .word 0x000082EA
_02079BB8: .word OSi_SleepAlarmCallback
	arm_func_end OS_Sleep

	arm_func_start OSi_SleepAlarmCallback
OSi_SleepAlarmCallback: ; 0x02079BBC
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _02079BD8 ; =OS_WakeupThreadDirect
	mov r0, r2
	str r1, [r2, #0xb0]
	bx ip
	.align 2, 0
_02079BD8: .word OS_WakeupThreadDirect
	arm_func_end OSi_SleepAlarmCallback

	arm_func_start OS_SetSwitchThreadCallback
OS_SetSwitchThreadCallback: ; 0x02079BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02079C00 ; =THREAD_INFO_STRUCT
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02079C00: .word THREAD_INFO_STRUCT
	arm_func_end OS_SetSwitchThreadCallback

	arm_func_start OSi_IdleThreadProc
OSi_IdleThreadProc: ; 0x02079C04
	stmdb sp!, {r3, lr}
	bl ClearIrqFlag
_02079C0C:
	bl WaitForInterrupt
	b _02079C0C
	arm_func_end OSi_IdleThreadProc

	arm_func_start OS_DisableScheduler
OS_DisableScheduler: ; 0x02079C14
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r2, _02079C44 ; =THREAD_INFO_STRUCT
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	movlo r4, r3
	strlo r1, [r2, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C44: .word THREAD_INFO_STRUCT
	arm_func_end OS_DisableScheduler

	arm_func_start OS_EnableScheduler
OS_EnableScheduler: ; 0x02079C48
	stmdb sp!, {r4, lr}
	bl EnableIrqFlag
	ldr r1, _02079C78 ; =THREAD_INFO_STRUCT
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	movne r4, r3
	strne r2, [r1, #4]
	bl SetIrqFlag
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02079C78: .word THREAD_INFO_STRUCT
	arm_func_end OS_EnableScheduler

	arm_func_start OS_SetThreadDestructor
OS_SetThreadDestructor: ; 0x02079C7C
	str r1, [r0, #0xb4]
	bx lr
	arm_func_end OS_SetThreadDestructor

	arm_func_start InitThread
InitThread: ; 0x02079C84
	add r1, r1, #4
	str r1, [r0, #0x40]
	str r2, [r0, #0x44]
	sub r2, r2, #0x40
	tst r2, #4
	bne _02079CA0
	b _02079CA4
_02079CA0:
	sub r2, r2, #4
_02079CA4:
	str r2, [r0, #0x38]
	ands r1, r1, #1
	bne _02079CB4
	b _02079CB8
_02079CB4:
	mov r1, #0x3f
_02079CB8:
	beq _02079CC0
	b _02079CC4
_02079CC0:
	mov r1, #0x1f
_02079CC4:
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitThread

	arm_func_start OS_SaveContext
OS_SaveContext: ; 0x02079D08
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D50 ; =CP_SaveContext
	blx r1
	ldmia sp!, {r0, lr}
	add r1, r0, #0
	mrs r2, cpsr
	str r2, [r1], #4
	mov r0, #0xd3
	msr cpsr_c, r0
	str sp, [r1, #0x40]
	msr cpsr_c, r2
	mov r0, #1
	stmia r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr}
	add r0, pc, #0x8 ; =_02079D50
	str r0, [r1, #0x3c]
	mov r0, #0
	bx lr
	.align 2, 0
_02079D50: .word CP_SaveContext
	arm_func_end OS_SaveContext

	arm_func_start OS_LoadContext
OS_LoadContext: ; 0x02079D54
	stmdb sp!, {r0, lr}
	add r0, r0, #0x48
	ldr r1, _02079D94 ; =CPi_RestoreContext
	blx r1
	ldmia sp!, {r0, lr}
	mrs r1, cpsr
	bic r1, r1, #0x1f
	orr r1, r1, #0xd3
	msr cpsr_c, r1
	ldr r1, [r0], #4
	msr spsr_fsxc, r1
	ldr sp, [r0, #0x40]
	ldr lr, [r0, #0x3c]
	ldmia r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	subs pc, lr, #4
	.align 2, 0
_02079D94: .word CPi_RestoreContext
	arm_func_end OS_LoadContext

	arm_func_start OS_IsRunOnEmulator
OS_IsRunOnEmulator: ; 0x02079D98
	mov r0, #0
	bx lr
	arm_func_end OS_IsRunOnEmulator

	arm_func_start OS_GetConsoleType
OS_GetConsoleType: ; 0x02079DA0
	ldr r0, _02079DB0 ; =0x82000001
	ldr r1, _02079DB4 ; =_020B2BAC
	str r0, [r1]
	bx lr
	.align 2, 0
_02079DB0: .word 0x82000001
_02079DB4: .word _020B2BAC
	arm_func_end OS_GetConsoleType

	arm_func_start OS_InitMessageQueue
OS_InitMessageQueue: ; 0x02079DB8
	mov r3, #0
	str r3, [r0, #4]
	str r3, [r0]
	str r3, [r0, #0xc]
	str r3, [r0, #8]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	bx lr
	arm_func_end OS_InitMessageQueue

	arm_func_start OS_SendMessage
OS_SendMessage: ; 0x02079DE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	mov r6, r0
	cmp r1, r2
	bgt _02079E3C
	and r7, r7, #1
_02079E0C:
	cmp r7, #0
	bne _02079E24
	mov r0, r6
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079E24:
	mov r0, r5
	bl OS_SleepThread
	ldr r2, [r5, #0x1c]
	ldr r1, [r5, #0x14]
	cmp r1, r2
	ble _02079E0C
_02079E3C:
	ldr r0, [r5, #0x18]
	add r0, r0, r2
	bl _s32_div_f
	ldr r2, [r5, #0x10]
	add r0, r5, #8
	str r4, [r2, r1, lsl #2]
	ldr r1, [r5, #0x1c]
	add r1, r1, #1
	str r1, [r5, #0x1c]
	bl OS_WakeupThread
	mov r0, r6
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_SendMessage

	arm_func_start OS_ReceiveMessage
OS_ReceiveMessage: ; 0x02079E74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _02079EC8
	and r7, r7, #1
_02079E9C:
	cmp r7, #0
	bne _02079EB4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079EB4:
	add r0, r6, #8
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079E9C
_02079EC8:
	cmp r5, #0
	beq _02079EE0
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_02079EE0:
	ldr r0, [r6, #0x18]
	ldr r1, [r6, #0x14]
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r1, [r6, #0x1c]
	mov r0, r6
	sub r1, r1, #1
	str r1, [r6, #0x1c]
	bl OS_WakeupThread
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_ReceiveMessage

	arm_func_start OS_JamMessage
OS_JamMessage: ; 0x02079F18
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x14]
	ldr r2, [r6, #0x1c]
	mov r4, r0
	cmp r1, r2
	bgt _02079F74
	and r7, r7, #1
_02079F44:
	cmp r7, #0
	bne _02079F5C
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079F5C:
	mov r0, r6
	bl OS_SleepThread
	ldr r1, [r6, #0x14]
	ldr r0, [r6, #0x1c]
	cmp r1, r0
	ble _02079F44
_02079F74:
	ldr r0, [r6, #0x18]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r1, [r6, #0x18]
	ldr r0, [r6, #0x10]
	str r5, [r0, r1, lsl #2]
	ldr r1, [r6, #0x1c]
	add r0, r6, #8
	add r1, r1, #1
	str r1, [r6, #0x1c]
	bl OS_WakeupThread
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_JamMessage

	arm_func_start OS_ReadMessage
OS_ReadMessage: ; 0x02079FB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r7, r2
	bl EnableIrqFlag
	ldr r1, [r6, #0x1c]
	mov r4, r0
	cmp r1, #0
	bne _0207A008
	and r7, r7, #1
_02079FDC:
	cmp r7, #0
	bne _02079FF4
	mov r0, r4
	bl SetIrqFlag
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02079FF4:
	add r0, r6, #8
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _02079FDC
_0207A008:
	cmp r5, #0
	beq _0207A020
	ldr r1, [r6, #0x10]
	ldr r0, [r6, #0x18]
	ldr r0, [r1, r0, lsl #2]
	str r0, [r5]
_0207A020:
	mov r0, r4
	bl SetIrqFlag
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_ReadMessage

	arm_func_start OS_InitMutex
OS_InitMutex: ; 0x0207A030
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end OS_InitMutex

	arm_func_start OS_LockMutex
OS_LockMutex: ; 0x0207A048
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A0C8 ; =_022B966C
	mov r4, r0
	ldr r7, [r1, #4]
	mov r6, #0
_0207A064:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0207A090
	str r7, [r5, #8]
	ldr r1, [r5, #0xc]
	mov r0, r7
	add r2, r1, #1
	mov r1, r5
	str r2, [r5, #0xc]
	bl OSi_EnqueueTail
	b _0207A0BC
_0207A090:
	cmp r0, r7
	bne _0207A0A8
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0207A0BC
_0207A0A8:
	mov r0, r5
	str r5, [r7, #0x84]
	bl OS_SleepThread
	str r6, [r7, #0x84]
	b _0207A064
_0207A0BC:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0207A0C8: .word _022B966C
	arm_func_end OS_LockMutex

	arm_func_start OS_UnlockMutex
OS_UnlockMutex: ; 0x0207A0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _0207A124 ; =_022B966C
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0207A118
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	bne _0207A118
	mov r1, r5
	bl OSi_DequeueItem
	mov r1, #0
	mov r0, r5
	str r1, [r5, #8]
	bl OS_WakeupThread
_0207A118:
	mov r0, r4
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207A124: .word _022B966C
	arm_func_end OS_UnlockMutex

	arm_func_start OSi_UnlockAllMutex
OSi_UnlockAllMutex: ; 0x0207A128
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x88]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
_0207A140:
	add r0, r5, #0x88
	bl OSi_RemoveMutexLinkFromQueue
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	bl OS_WakeupThread
	ldr r0, [r5, #0x88]
	cmp r0, #0
	bne _0207A140
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OSi_UnlockAllMutex

	arm_func_start OS_TryLockMutex
OS_TryLockMutex: ; 0x0207A164
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r2, [r5, #8]
	ldr r1, _0207A1D4 ; =_022B966C
	mov r4, r0
	cmp r2, #0
	ldr r0, [r1, #4]
	bne _0207A1A8
	str r0, [r5, #8]
	ldr r2, [r5, #0xc]
	mov r1, r5
	add r2, r2, #1
	str r2, [r5, #0xc]
	bl OSi_EnqueueTail
	mov r6, #1
	b _0207A1C4
_0207A1A8:
	cmp r2, r0
	movne r6, #0
	bne _0207A1C4
	ldr r0, [r5, #0xc]
	mov r6, #1
	add r0, r0, #1
	str r0, [r5, #0xc]
_0207A1C4:
	mov r0, r4
	bl SetIrqFlag
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207A1D4: .word _022B966C
	arm_func_end OS_TryLockMutex

	arm_func_start OSi_EnqueueTail
OSi_EnqueueTail: ; 0x0207A1D8
	ldr r2, [r0, #0x8c]
	cmp r2, #0
	streq r1, [r0, #0x88]
	strne r1, [r2, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0
	str r2, [r1, #0x10]
	str r1, [r0, #0x8c]
	bx lr
	arm_func_end OSi_EnqueueTail

	arm_func_start OSi_DequeueItem
OSi_DequeueItem: ; 0x0207A1FC
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x14]
	cmp r2, #0
	streq r1, [r0, #0x8c]
	strne r1, [r2, #0x14]
	cmp r1, #0
	streq r2, [r0, #0x88]
	strne r2, [r1, #0x10]
	bx lr
	arm_func_end OSi_DequeueItem

	arm_func_start DC_Enable
DC_Enable: ; 0x0207A220
	mrc p15, 0, r1, c1, c0, 0
	and r0, r1, #4
	mov r0, r0, lsr #2
	orr r1, r1, #4
	mcr p15, 0, r1, c1, c0, 0
	bx lr
	arm_func_end DC_Enable

