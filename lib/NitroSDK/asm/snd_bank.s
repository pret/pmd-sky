	.include "asm/macros.inc"
	.include "include/nitro.inc"

	.text

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

