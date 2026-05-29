	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

	arm_func_start Snd_GetPlayerStatus
Snd_GetPlayerStatus: ; 0x0207D444
	stmdb sp!, {r3, lr}
	ldr r0, _0207D46C ; =SNDi_SharedWork
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #4
	bl DC_InvalidateRange
	ldr r0, _0207D46C ; =SNDi_SharedWork
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D46C: .word SNDi_SharedWork
	arm_func_end Snd_GetPlayerStatus

	arm_func_start Snd_GetChannelStatus
Snd_GetChannelStatus: ; 0x0207D470
	stmdb sp!, {r3, lr}
	ldr r0, _0207D498 ; =SNDi_SharedWork
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #8
	bl DC_InvalidateRange
	ldr r0, _0207D498 ; =SNDi_SharedWork
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D498: .word SNDi_SharedWork
	arm_func_end Snd_GetChannelStatus

	arm_func_start Sndi_GetFinishedCommandTag
Sndi_GetFinishedCommandTag: ; 0x0207D49C
	stmdb sp!, {r3, lr}
	ldr r0, _0207D4C0 ; =SNDi_SharedWork
	mov r1, #4
	ldr r0, [r0]
	bl DC_InvalidateRange
	ldr r0, _0207D4C0 ; =SNDi_SharedWork
	ldr r0, [r0]
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207D4C0: .word SNDi_SharedWork
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

