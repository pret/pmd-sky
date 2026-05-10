	.include "asm/macros.inc"
	.include "include/os_timer.inc"

	.text

    arm_func_start OSi_SetTimer
OSi_SetTimer: ; 0x0207AF64
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_GetTick
	ldr r3, _0207AFE0 ; =0x04000106
	mov r2, #0
	strh r2, [r3]
	ldr ip, [r4, #0xc]
	ldr r3, [r4, #0x10]
	subs r5, ip, r0
	sbc r4, r3, r1
	ldr r1, _0207AFE4 ; =OSi_AlarmHandler
	mov r0, #1
	bl sub_02078BF4
	subs r0, r5, #0
	mov r3, #0
	sbcs r0, r4, #0
	ldrlt r3, _0207AFE8 ; =0x0000FFFE
	blt _0207AFC4
	subs r0, r5, #0x10000
	sbcs r0, r4, r3
	bge _0207AFC4
	mvn r0, r5
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
_0207AFC4:
	ldr r2, _0207AFEC ; =0x04000104
	mov r1, #0xc1
	strh r3, [r2]
	mov r0, #0x10
	strh r1, [r2, #2]
	bl OS_EnableIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207AFE0: .word 0x04000106
_0207AFE4: .word OSi_AlarmHandler
_0207AFE8: .word 0x0000FFFE
_0207AFEC: .word 0x04000104
	arm_func_end OSi_SetTimer

	arm_func_start OS_InitAlarm
OS_InitAlarm: ; 0x0207AFF0
	stmdb sp!, {r3, lr}
	ldr r1, _0207B02C ; =OSi_UseAlarm
	ldrh r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strh r0, [r1]
	bl OSi_SetTimerReserved
	ldr r1, _0207B02C ; =OSi_UseAlarm
	mov r2, #0
	str r2, [r1, #4]
	mov r0, #0x10
	str r2, [r1, #8]
	bl OS_DisableIrqMask
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B02C: .word OSi_UseAlarm
	arm_func_end OS_InitAlarm

	arm_func_start OS_IsAlarmAvailable
OS_IsAlarmAvailable: ; 0x0207B030
	ldr r0, _0207B03C ; =OSi_UseAlarm
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0207B03C: .word OSi_UseAlarm
	arm_func_end OS_IsAlarmAvailable 

	arm_func_start OS_CreateAlarm
OS_CreateAlarm: ; 0x0207B040
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	bx lr
	arm_func_end OS_CreateAlarm

	arm_func_start OS_InsertAlarm
OS_InsertAlarm: ; 0x0207B050
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0x20]
	ldr r3, [r8, #0x1c]
	cmp r0, #0
	mov r7, r1
	mov r6, r2
	cmpeq r3, #0
	beq _0207B0C4
	bl OS_GetTick
	ldr r6, [r8, #0x28]
	ldr r7, [r8, #0x24]
	cmp r6, r1
	cmpeq r7, r0
	bhs _0207B0C4
	ldr r5, [r8, #0x1c]
	ldr r4, [r8, #0x20]
	subs r0, r0, r7
	mov r2, r5
	mov r3, r4
	sbc r1, r1, r6
	bl _ll_udiv
	adds r2, r0, #1
	adc r0, r1, #0
	umull r3, r1, r5, r2
	mla r1, r5, r0, r1
	mla r1, r4, r2, r1
	adds r7, r7, r3
	adc r6, r6, r1
_0207B0C4:
	str r7, [r8, #0xc]
	ldr r0, _0207B178 ; =OSi_UseAlarm
	str r6, [r8, #0x10]
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0207B140
	mov r2, #0
	mov r1, r2
_0207B0E4:
	ldr r3, [r5, #0xc]
	ldr r0, [r5, #0x10]
	subs r4, r7, r3
	sbc r3, r6, r0
	subs r0, r4, r1
	sbcs r0, r3, r2
	bge _0207B134
	ldr r0, [r5, #0x14]
	str r0, [r8, #0x14]
	str r8, [r5, #0x14]
	str r5, [r8, #0x18]
	ldr r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, _0207B178 ; =OSi_UseAlarm
	mov r0, r8
	str r8, [r1, #4]
	bl OSi_SetTimer
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0207B134:
	ldr r5, [r5, #0x18]
	cmp r5, #0
	bne _0207B0E4
_0207B140:
	ldr r1, _0207B178 ; =OSi_UseAlarm
	mov r0, #0
	str r0, [r8, #0x18]
	ldr r0, [r1, #8]
	str r8, [r1, #8]
	str r0, [r8, #0x14]
	cmp r0, #0
	strne r8, [r0, #0x18]
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	str r8, [r1, #8]
	mov r0, r8
	str r8, [r1, #4]
	bl OSi_SetTimer
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0207B178: .word OSi_UseAlarm
	arm_func_end OS_InsertAlarm

	arm_func_start OS_SetAlarm
OS_SetAlarm: ; 0x0207B17C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	mov r7, r3
	beq _0207B1A0
	ldr r0, [r6]
	cmp r0, #0
	beq _0207B1A4
_0207B1A0:
	bl WaitForever2
_0207B1A4:
	bl EnableIrqFlag
	mov r1, #0
	str r1, [r6, #0x1c]
	str r1, [r6, #0x20]
	str r7, [r6]
	ldr r1, [sp, #0x18]
	mov r7, r0
	str r1, [r6, #4]
	bl OS_GetTick
	adds r3, r5, r0
	adc r2, r4, r1
	mov r0, r6
	mov r1, r3
	bl OS_InsertAlarm
	mov r0, r7
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_SetAlarm

	arm_func_start sub_0207B1E8
sub_0207B1E8: ; 0x0207B1E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	bne _0207B20C
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
_0207B20C:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	ldrne r1, [r5, #0x14]
	strne r1, [r0, #0x14]
	bne _0207B22C
	ldr r2, [r5, #0x14]
	ldr r1, _0207B26C ; =OSi_UseAlarm
	str r2, [r1, #8]
_0207B22C:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	strne r0, [r1, #0x18]
	bne _0207B250
	ldr r1, _0207B26C ; =OSi_UseAlarm
	cmp r0, #0
	str r0, [r1, #4]
	beq _0207B250
	bl OSi_SetTimer
_0207B250:
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #0x1c]
	mov r0, r4
	str r1, [r5, #0x20]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B26C: .word OSi_UseAlarm
	arm_func_end sub_0207B1E8

	arm_func_start OSi_AlarmHandler
OSi_AlarmHandler: ; 0x0207B270
	stmdb sp!, {r0, lr}
	bl OSi_ArrangeTimer
	ldmia sp!, {r0, lr}
	bx lr
	arm_func_end OSi_AlarmHandler

	arm_func_start OSi_ArrangeTimer
OSi_ArrangeTimer: ; 0x0207B280
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0207B364 ; =0x04000106
	mov r2, #0
	mov r0, #0x10
	strh r2, [r1]
	bl OS_DisableIrqMask
	ldr r0, _0207B368 ; =OS_IRQTable
	add r0, r0, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #0x10
	str r1, [r0, #0xff8]
	bl OS_GetTick
	ldr r2, _0207B36C ; =OSi_UseAlarm
	ldr r4, [r2, #4]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0x10]
	ldr ip, [r4, #0xc]
	cmp r1, r3
	cmpeq r0, ip
	bhs _0207B2E0
	mov r0, r4
	bl OSi_SetTimer
	ldmia sp!, {r3, r4, r5, pc}
_0207B2E0:
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r1, [r2, #4]
	cmp r1, #0
	streq r0, [r2, #8]
	strne r0, [r1, #0x14]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	ldr r5, [r4]
	mov r0, #0
	cmpeq r1, #0
	streq r0, [r4]
	cmp r5, #0
	beq _0207B324
	ldr r0, [r4, #4]
	blx r5
_0207B324:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	cmp r0, #0
	cmpeq r1, #0
	mov r1, #0
	beq _0207B34C
	mov r0, r4
	mov r2, r1
	str r5, [r4]
	bl OS_InsertAlarm
_0207B34C:
	ldr r0, _0207B36C ; =OSi_UseAlarm
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl OSi_SetTimer
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B364: .word 0x04000106
_0207B368: .word OS_IRQTable
_0207B36C: .word OSi_UseAlarm
	arm_func_end OSi_ArrangeTimer


