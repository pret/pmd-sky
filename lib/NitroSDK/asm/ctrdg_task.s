	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Ctrdgi_InitTaskThread
Ctrdgi_InitTaskThread: ; 0x02084DA4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	bl EnableIrqFlag
	ldr r1, _02084E20 ; =_022BC228
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _02084E10
	add r0, r5, #0xc4
	str r5, [r1]
	bl Ctrdgi_InitTaskInfo
	ldr r0, _02084E24 ; =_022BC22C
	bl Ctrdgi_InitTaskInfo
	mov r0, #0
	str r0, [r5, #0xc0]
	mov r2, #0x400
	ldr r1, _02084E28 ; =Ctrdgi_TaskThread
	ldr r3, _02084E2C ; =_022BC650
	mov r0, r5
	str r2, [sp]
	mov r2, #0x14
	str r2, [sp, #4]
	mov r2, r5
	bl OS_CreateThread
	mov r0, r5
	bl OS_WakeupThreadDirect
_02084E10:
	mov r0, r4
	bl SetIrqFlag
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02084E20: .word _022BC228
_02084E24: .word _022BC22C
_02084E28: .word Ctrdgi_TaskThread
_02084E2C: .word _022BC650
	arm_func_end Ctrdgi_InitTaskThread

	arm_func_start Ctrdgi_InitTaskInfo
Ctrdgi_InitTaskInfo: ; 0x02084E30
	ldr ip, _02084E40 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x24
	bx ip
	.align 2, 0
_02084E40: .word MI_CpuFill8
	arm_func_end Ctrdgi_InitTaskInfo

	arm_func_start Ctrdgi_TaskThread
Ctrdgi_TaskThread: ; 0x02084E44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r4, #0
	mov r8, r0
	add r6, sp, #0
	mov sl, r4
	mov sb, r4
	mov r5, r4
	mov fp, #0x24
_02084E68:
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl MI_CpuFill8
	bl EnableIrqFlag
	ldr r1, [r8, #0xc0]
	mov r7, r0
	cmp r1, #0
	bne _02084EA0
_02084E8C:
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r8, #0xc0]
	cmp r0, #0
	beq _02084E8C
_02084EA0:
	ldr lr, [r8, #0xc0]
	add ip, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r1, [lr]
	mov r0, r7
	str r1, [ip]
	bl SetIrqFlag
	ldr r1, [sp]
	cmp r1, #0
	beq _02084EE0
	mov r0, r6
	blx r1
	str r0, [sp, #8]
_02084EE0:
	bl EnableIrqFlag
	ldr r2, [sp, #4]
	ldr r1, _02084F30 ; =_022BC228
	mov r7, r0
	strb sl, [r1, #0x26]
	cmp r2, #0
	beq _02084F04
	mov r0, r6
	blx r2
_02084F04:
	ldr r0, _02084F30 ; =_022BC228
	ldr r0, [r0]
	cmp r0, #0
	beq _02084F24
	mov r0, r7
	str sb, [r8, #0xc0]
	bl SetIrqFlag
	b _02084E68
_02084F24:
	bl OS_ExitThread
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02084F30: .word _022BC228
	arm_func_end Ctrdgi_TaskThread

