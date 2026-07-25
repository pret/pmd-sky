	.include "asm/macros.inc"
	.include "include/os_interrupt.inc"

	.text

    arm_func_start OS_InitIrqTable
OS_InitIrqTable: ; 0x02078A80
	ldr r0, _02078A94 ; =DTCM_BSS
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	bx lr
	.align 2, 0
_02078A94: .word DTCM_BSS
	arm_func_end OS_InitIrqTable

	arm_func_start OS_SetIrqFunction
OS_SetIrqFunction: ; 0x02078A98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #0
	mov r2, #0xc
	ldr r4, _02078B18 ; =OS_IRQTable
	ldr r6, _02078B1C ; =_022B95E4
	mov r7, r8
	mov lr, r8
	mov ip, #1
	mov r3, r2
_02078ABC:
	tst r0, #1
	beq _02078B04
	mov sb, r7
	cmp r8, #8
	blt _02078AE0
	cmp r8, #0xb
	suble r5, r8, #8
	mlale sb, r5, r3, r6
	ble _02078AFC
_02078AE0:
	cmp r8, #3
	blt _02078AF8
	cmp r8, #6
	addle r5, r8, #1
	mlale sb, r5, r2, r6
	ble _02078AFC
_02078AF8:
	str r1, [r4, r8, lsl #2]
_02078AFC:
	cmp sb, #0
	stmneia sb, {r1, ip, lr}
_02078B04:
	add r8, r8, #1
	cmp r8, #0x16
	mov r0, r0, lsr #1
	blt _02078ABC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02078B18: .word OS_IRQTable
_02078B1C: .word _022B95E4
	arm_func_end OS_SetIrqFunction

	arm_func_start OS_GetIrqFunction
OS_GetIrqFunction: ; 0x02078B20
	ldr r2, _02078BA4 ; =OS_IRQTable
	mov r1, #0
_02078B28:
	tst r0, #1
	beq _02078B88
	cmp r1, #8
	blt _02078B58
	cmp r1, #0xb
	bgt _02078B58
	sub r1, r1, #8
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B58:
	cmp r1, #3
	blt _02078B80
	cmp r1, #6
	bgt _02078B80
	add r1, r1, #1
	mov r0, #0xc
	mul r2, r1, r0
	ldr r0, _02078BA8 ; =_022B95E4
	ldr r0, [r0, r2]
	bx lr
_02078B80:
	ldr r0, [r2]
	bx lr
_02078B88:
	add r1, r1, #1
	cmp r1, #0x16
	mov r0, r0, lsr #1
	add r2, r2, #4
	blt _02078B28
	mov r0, #0
	bx lr
	.align 2, 0
_02078BA4: .word OS_IRQTable
_02078BA8: .word _022B95E4
	arm_func_end OS_GetIrqFunction

	arm_func_start OSi_EnterDmaCallback
OSi_EnterDmaCallback: ; 0x02078BAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0xc
	mul r6, r0, r3
	ldr ip, _02078BE8 ; =_022B95E4
	add r4, r0, #8
	mov r5, #1
	mov r0, r5, lsl r4
	ldr r3, _02078BEC ; =_022B95EC
	str r1, [ip, r6]
	str r2, [r3, r6]
	bl OS_EnableIrqMask
	and r1, r0, r5, lsl r4
	ldr r0, _02078BF0 ; =_022B95E8
	str r1, [r0, r6]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078BE8: .word _022B95E4
_02078BEC: .word _022B95EC
_02078BF0: .word _022B95E8
	arm_func_end OSi_EnterDmaCallback

	arm_func_start OSi_EnterTimerCallback
OSi_EnterTimerCallback: ; 0x02078BF4
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _02078C30 ; =_022B9614
	add r0, r0, #3
	mov r3, #1
	mov r0, r3, lsl r0
	ldr r3, _02078C34 ; =_022B961C
	str r1, [ip, r4]
	str r2, [r3, r4]
	bl OS_EnableIrqMask
	ldr r0, _02078C38 ; =_022B9618
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02078C30: .word _022B9614
_02078C34: .word _022B961C
_02078C38: .word _022B9618
	arm_func_end OSi_EnterTimerCallback

	arm_func_start OS_SetIrqMask
OS_SetIrqMask: ; 0x02078C3C
	ldr r3, _02078C64 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C64: .word 0x04000208
	arm_func_end OS_SetIrqMask

	arm_func_start OS_EnableIrqMask
OS_EnableIrqMask: ; 0x02078C68
	ldr r3, _02078C94 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #8]
	orr r0, r1, r0
	str r0, [r3, #8]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078C94: .word 0x04000208
	arm_func_end OS_EnableIrqMask

	arm_func_start OS_DisableIrqMask
OS_DisableIrqMask: ; 0x02078C98
	ldr ip, _02078CC4 ; =0x04000208
	mov r2, #0
	ldrh r3, [ip]
	mvn r1, r0
	strh r2, [ip]
	ldr r0, [ip, #8]
	and r1, r0, r1
	str r1, [ip, #8]
	ldrh r1, [ip]
	strh r3, [ip]
	bx lr
	.align 2, 0
_02078CC4: .word 0x04000208
	arm_func_end OS_DisableIrqMask

	arm_func_start OS_ResetRequestIrqMask
OS_ResetRequestIrqMask: ; 0x02078CC8
	ldr r3, _02078CF0 ; =0x04000208
	mov r1, #0
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r1, [r3, #0xc]
	str r0, [r3, #0xc]
	ldrh r0, [r3]
	mov r0, r1
	strh r2, [r3]
	bx lr
	.align 2, 0
_02078CF0: .word 0x04000208
	arm_func_end OS_ResetRequestIrqMask

	arm_func_start OS_SetIrqStackChecker
OS_SetIrqStackChecker: ; 0x02078CF4
	ldr ip, _02078D18 ; =OS_IRQTable
	ldr r3, _02078D1C ; =0xFDDB597D
	add r0, ip, #0x3000
	ldr r2, _02078D20 ; =0x7BF9DD5B
	ldr r1, _02078D24 ; =0x00000800
	str r3, [r0, #0xf7c]
	add r0, ip, #0x3f80
	str r2, [r0, -r1]
	bx lr
	.align 2, 0
_02078D18: .word OS_IRQTable
_02078D1C: .word 0xFDDB597D
_02078D20: .word 0x7BF9DD5B
_02078D24: .word 0x00000800
	arm_func_end OS_SetIrqStackChecker

