	.include "asm/macros.inc"
	.include "include/g3x.inc"

	.text

    arm_func_start G3X_Init
G3X_Init: ; 0x020777C4
	stmdb sp!, {r3, lr}
	bl G3X_ClearFifo
	ldr r1, _020778B0 ; =0x04000504
	mov r0, #0
	str r0, [r1]
_020777D8:
	ldr r0, [r1, #0xfc]
	tst r0, #0x8000000
	bne _020777D8
	ldr r0, _020778B4 ; =0x04000060
	mov r2, #0
	strh r2, [r0]
	str r2, [r1, #0xfc]
	str r2, [r0, #-0x50]
	ldrh ip, [r0]
	ldr r2, _020778B8 ; =0xFFFFCFFD
	ldr r3, _020778BC ; =0x0000CFFB
	orr ip, ip, #0x2000
	strh ip, [r0]
	ldrh ip, [r0]
	orr ip, ip, #0x1000
	strh ip, [r0]
	ldrh ip, [r0]
	and r2, ip, r2
	strh r2, [r0]
	ldrh r2, [r0]
	bic r2, r2, #0x3000
	orr r2, r2, #0x10
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r2, r3
	strh r2, [r0]
	ldr r0, [r1, #0xfc]
	orr r0, r0, #0x8000
	str r0, [r1, #0xfc]
	ldr r0, [r1, #0xfc]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x80000000
	str r0, [r1, #0xfc]
	bl G3X_InitMtxStack
	ldr r1, _020778C0 ; =0x04000350
	mov r2, #0
	ldr r0, _020778C4 ; =0x00007FFF
	str r2, [r1]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	str r2, [r1, #8]
	strh r2, [r1, #0xc]
	sub r1, r1, #0x348
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	bl G3X_InitTable
	ldr r2, _020778C8 ; =0x001F0080
	ldr r1, _020778CC ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020778B0: .word 0x04000504
_020778B4: .word 0x04000060
_020778B8: .word 0xFFFFCFFD
_020778BC: .word 0x0000CFFB
_020778C0: .word 0x04000350
_020778C4: .word 0x00007FFF
_020778C8: .word 0x001F0080
_020778CC: .word 0x040004A4
	arm_func_end G3X_Init

	arm_func_start G3X_Reset
G3X_Reset: ; 0x020778D0
	stmdb sp!, {r3, lr}
	ldr r2, _0207792C ; =0x04000600
_020778D8:
	ldr r0, [r2]
	tst r0, #0x8000000
	bne _020778D8
	ldr r0, [r2]
	ldr r1, _02077930 ; =0x04000060
	orr r0, r0, #0x8000
	str r0, [r2]
	ldrh r0, [r1]
	orr r0, r0, #0x2000
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x1000
	strh r0, [r1]
	bl G3X_ResetMtxStack
	ldr r2, _02077934 ; =0x001F0080
	ldr r1, _02077938 ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207792C: .word 0x04000600
_02077930: .word 0x04000060
_02077934: .word 0x001F0080
_02077938: .word 0x040004A4
	arm_func_end G3X_Reset

	arm_func_start G3X_ClearFifo
G3X_ClearFifo: ; 0x0207793C
	stmdb sp!, {r3, lr}
	ldr r0, _0207795C ; =0x04000400
	bl GXi_NopClearFifo128_
	ldr r1, _02077960 ; =0x04000600
_0207794C:
	ldr r0, [r1]
	tst r0, #0x8000000
	bne _0207794C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207795C: .word 0x04000400
_02077960: .word 0x04000600
	arm_func_end G3X_ClearFifo

	arm_func_start G3X_InitMtxStack
G3X_InitMtxStack: ; 0x02077964
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _020779F0 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_02077980:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _02077980
	add r4, sp, #0
_02077994:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _02077994
	ldr r1, _020779F4 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	mov r2, #0
	cmp r0, #0
	strne r0, [r1, #8]
	ldr r1, _020779F8 ; =0x04000454
	mov r0, #2
	str r2, [r1]
	str r0, [r1, #-0x14]
	ldr r0, [sp, #4]
	str r0, [r1, #-0xc]
	str r2, [r1]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020779F0: .word 0x04000600
_020779F4: .word 0x04000440
_020779F8: .word 0x04000454
	arm_func_end G3X_InitMtxStack

	arm_func_start G3X_ResetMtxStack
G3X_ResetMtxStack: ; 0x020779FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _02077A84 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_02077A18:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _02077A18
	add r4, sp, #0
_02077A2C:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _02077A2C
	ldr r1, _02077A88 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	ldr r2, _02077A88 ; =0x04000440
	cmp r0, #0
	strne r0, [r1, #8]
	mov r0, #2
	str r0, [r2]
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [r2, #8]
	str r0, [r2, #0x14]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077A84: .word 0x04000600
_02077A88: .word 0x04000440
	arm_func_end G3X_ResetMtxStack

	arm_func_start G3X_SetClearColor
G3X_SetClearColor: ; 0x02077A8C
	ldr ip, [sp]
	orr r0, r0, r1, lsl #16
	orr r1, r0, r3, lsl #24
	cmp ip, #0
	ldr r0, _02077AB0 ; =0x04000350
	orrne r1, r1, #0x8000
	str r1, [r0]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_02077AB0: .word 0x04000350
	arm_func_end G3X_SetClearColor

	arm_func_start G3X_InitTable
G3X_InitTable: ; 0x02077AB4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02077B44 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	ldr r1, _02077B48 ; =0x04000330
	beq _02077B04
	mov r2, #0
	str r2, [sp]
	mov r3, #0x10
	str r2, [sp, #4]
	bl MI_DmaFill32Async
	ldr r0, _02077B44 ; =GXi_DmaId
	ldr r1, _02077B4C ; =0x04000360
	ldr r0, [r0]
	mov r2, #0
	mov r3, #0x60
	bl MI_DmaFill32
	b _02077B20
_02077B04:
	mov r0, #0
	mov r2, #0x10
	bl MTi_CpuClear32
	ldr r1, _02077B4C ; =0x04000360
	mov r0, #0
	mov r2, #0x60
	bl MTi_CpuClear32
_02077B20:
	mov r2, #0
	ldr r0, _02077B50 ; =0x040004D0
	mov r1, r2
_02077B2C:
	add r2, r2, #1
	str r1, [r0]
	cmp r2, #0x20
	blt _02077B2C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077B44: .word GXi_DmaId
_02077B48: .word 0x04000330
_02077B4C: .word 0x04000360
_02077B50: .word 0x040004D0
	arm_func_end G3X_InitTable

	arm_func_start G3X_GetMtxStackLevelPV
G3X_GetMtxStackLevelPV: ; 0x02077B54
	ldr r2, _02077B80 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x1f00
	mov r1, r1, lsr #8
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_02077B80: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPV

	arm_func_start G3X_GetMtxStackLevelPJ
G3X_GetMtxStackLevelPJ: ; 0x02077B84
	ldr r2, _02077BB0 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x2000
	mov r1, r1, lsr #0xd
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_02077BB0: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPJ

	arm_func_start GXi_NopClearFifo128_
GXi_NopClearFifo128_: ; 0x02077BB4
	mov r1, #0
	mov r2, #0
	mov r3, #0
	mov ip, #0
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	bx lr
	arm_func_end GXi_NopClearFifo128_

	arm_func_start G3i_OrthoW_
G3i_OrthoW_: ; 0x02077C48
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x50
	ldr ip, [sp, #0x58]
	ldr lr, [sp, #0x5c]
	str ip, [sp]
	ldr r4, [sp, #0x68]
	ldr ip, [sp, #0x60]
	str lr, [sp, #4]
	cmp r4, #0
	addeq r4, sp, #0x10
	str ip, [sp, #8]
	str r4, [sp, #0xc]
	bl MTX_OrthoW
	ldr r0, [sp, #0x64]
	cmp r0, #0
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, pc}
	ldr r1, _02077CA8 ; =0x04000440
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx44
	add sp, sp, #0x50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077CA8: .word 0x04000440
	arm_func_end G3i_OrthoW_

	arm_func_start G3i_LookAt_
G3i_LookAt_: ; 0x02077CAC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x40]
	mov r5, r3
	cmp r4, #0
	addeq r4, sp, #0
	mov r3, r4
	bl MTX_LookAt
	cmp r5, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _02077CF4 ; =0x04000440
	mov r2, #2
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx43
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02077CF4: .word 0x04000440
	arm_func_end G3i_LookAt_
