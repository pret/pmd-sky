	.include "asm/macros.inc"
	.include "include/os_reset.inc"

	.text

	arm_func_start OS_InitReset
OS_InitReset: ; 0x0207B87C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0207B8C8 ; =_022B99D0
	ldrh r1, [r0, #2]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0, #2]
	bl PXI_Init
	mov r5, #0xc
	mov r4, #1
_0207B8A4:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _0207B8A4
	ldr r1, _0207B8CC ; =sub_0207B8D0
	mov r0, #0xc
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0207B8C8: .word _022B99D0
_0207B8CC: .word sub_0207B8D0
	arm_func_end OS_InitReset

	arm_func_start sub_0207B8D0 ; OSi_CommonCallback
sub_0207B8D0: ; 0x0207B8D0
	stmdb sp!, {r3, lr}
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	cmp r0, #0x10
	bne _0207B8F8
	ldr r0, _0207B900 ; =_022B99D0
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, pc}
_0207B8F8:
	bl WaitForever2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207B900: .word _022B99D0
	arm_func_end sub_0207B8D0

	arm_func_start sub_0207B904 ; Osi_SendToPxi
sub_0207B904: ; 0x0207B904
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0, lsl #8
	mov r5, #0xc
	mov r4, #0
_0207B914:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _0207B914
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0207B904

	arm_func_start sub_0207B930 ; OS_ResetSystem
sub_0207B930: ; 0x0207B930
	stmdb sp!, {r4, lr}
	ldr r1, _0207B9C0 ; =0x027FFC40
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _0207B958
	bl WaitForever2
_0207B958:
	bl OS_GetLockID
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02083434
	ldr r0, _0207B9C4 ; =0x00000000
	bl MI_StopDma
	ldr r0, _0207B9C8 ; =0x00000001
	bl MI_StopDma
	ldr r0, _0207B9CC ; =0x00000002
	bl MI_StopDma
	ldr r0, _0207B9D0 ; =0x00000003
	bl MI_StopDma
	ldr r0, _0207B9D4 ; =0x00040000
	bl OS_SetIrqMask
	ldr r0, _0207B9D8 ; =0xFFFBFFFF
	bl OS_ResetRequestIrqMask
	ldr r1, _0207B9DC ; =0x027FFC20
	ldr r0, _0207B9E0 ; =0x00000010
	str r4, [r1]
	bl sub_0207B904
	ldr r0, _0207B9E4 ; =0x027E3F80
	ldr r1, _0207B9E8 ; =0x00000800
	sub r0, r0, r1
	mov sp, r0
	bl sub_01FF97CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_0207B9C0: .word 0x027FFC40
_0207B9C4: .word 0x00000000
_0207B9C8: .word 0x00000001
_0207B9CC: .word 0x00000002
_0207B9D0: .word 0x00000003
_0207B9D4: .word 0x00040000
_0207B9D8: .word 0xFFFBFFFF
_0207B9DC: .word 0x027FFC20
_0207B9E0: .word 0x00000010
_0207B9E4: .word 0x027E3F80
_0207B9E8: .word 0x00000800
	arm_func_end sub_0207B930

