	.include "asm/macros.inc"
	.include "include/os_thread.inc"

	.text

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

