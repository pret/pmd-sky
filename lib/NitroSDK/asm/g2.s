	.include "asm/macros.inc"
	.include "include/g2.inc"

	.text

    arm_func_start G2x_SetBlendAlpha_
G2x_SetBlendAlpha_: ; 0x020776E8
	ldr ip, [sp]
	orr r1, r1, #0x40
	orr r2, r1, r2, lsl #8
	orr r1, r3, ip, lsl #8
	orr r1, r2, r1, lsl #16
	str r1, [r0]
	bx lr
	arm_func_end G2x_SetBlendAlpha_

	arm_func_start G2x_SetBlendBrightness_
G2x_SetBlendBrightness_: ; 0x02077704
	cmp r2, #0
	orrge r1, r1, #0x80
	strgeh r1, [r0]
	strgeh r2, [r0, #4]
	bxge lr
	orr r1, r1, #0xc0
	strh r1, [r0]
	rsb r1, r2, #0
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_SetBlendBrightness_

	arm_func_start G2x_ChangeBlendBrightness_
G2x_ChangeBlendBrightness_: ; 0x0207772C
	ldrh r3, [r0]
	cmp r1, #0
	and r2, r3, #0xc0
	bge _02077758
	cmp r2, #0x80
	biceq r2, r3, #0xc0
	orreq r2, r2, #0xc0
	streqh r2, [r0]
	rsb r1, r1, #0
	strh r1, [r0, #4]
	bx lr
_02077758:
	cmp r2, #0xc0
	biceq r2, r3, #0xc0
	orreq r2, r2, #0x80
	streqh r2, [r0]
	strh r1, [r0, #4]
	bx lr
	arm_func_end G2x_ChangeBlendBrightness_

	arm_func_start G3_LoadMtx44
G3_LoadMtx44: ; 0x02077770
	ldr r1, _02077784 ; =0x04000400
	mov r2, #0x16
	ldr ip, _02077788 ; =GX_SendFifo64B
	str r2, [r1]
	bx ip
	.align 2, 0
_02077784: .word 0x04000400
_02077788: .word GX_SendFifo64B
	arm_func_end G3_LoadMtx44

	arm_func_start G3_LoadMtx43
G3_LoadMtx43: ; 0x0207778C
	ldr r1, _020777A0 ; =0x04000400
	mov r2, #0x17
	ldr ip, _020777A4 ; =GeomGxFifoSendMtx4x3
	str r2, [r1]
	bx ip
	.align 2, 0
_020777A0: .word 0x04000400
_020777A4: .word GeomGxFifoSendMtx4x3
	arm_func_end G3_LoadMtx43

	arm_func_start G3_MultMtx43
G3_MultMtx43: ; 0x020777A8
	ldr r1, _020777BC ; =0x04000400
	mov r2, #0x19
	ldr ip, _020777C0 ; =GeomGxFifoSendMtx4x3
	str r2, [r1]
	bx ip
	.align 2, 0
_020777BC: .word 0x04000400
_020777C0: .word GeomGxFifoSendMtx4x3
	arm_func_end G3_MultMtx43

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
	bl sub_0207BDA8
	ldr r0, _02077B44 ; =GXi_DmaId
	ldr r1, _02077B4C ; =0x04000360
	ldr r0, [r0]
	mov r2, #0
	mov r3, #0x60
	bl sub_0207BC4C
	b _02077B20
_02077B04:
	mov r0, #0
	mov r2, #0x10
	bl ArrayFill32
	ldr r1, _02077B4C ; =0x04000360
	mov r0, #0
	mov r2, #0x60
	bl ArrayFill32
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

	arm_func_start GX_LoadBGPltt
GX_LoadBGPltt: ; 0x02077CF8
	stmdb sp!, {r4, lr}
	ldr r3, _02077D48 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077D34
	cmp r3, #0x1c
	bls _02077D34
	mov r1, r4
	add r2, lr, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r4, pc}
_02077D34:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077D48: .word GXi_DmaId
	arm_func_end GX_LoadBGPltt

	arm_func_start GXS_LoadBGPltt
GXS_LoadBGPltt: ; 0x02077D4C
	stmdb sp!, {r3, lr}
	ldr r3, _02077DA0 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077D88
	cmp r3, #0x1c
	bls _02077D88
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077D88:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DA0: .word GXi_DmaId
	arm_func_end GXS_LoadBGPltt

	arm_func_start GX_LoadOBJPltt
GX_LoadOBJPltt: ; 0x02077DA4
	stmdb sp!, {r3, lr}
	ldr r3, _02077DF8 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077DE0
	cmp r3, #0x1c
	bls _02077DE0
	add r2, r1, #0x200
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077DE0:
	add r1, r1, #0x200
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DF8: .word GXi_DmaId
	arm_func_end GX_LoadOBJPltt

	arm_func_start GXS_LoadOBJPltt
GXS_LoadOBJPltt: ; 0x02077DFC
	stmdb sp!, {r3, lr}
	ldr r3, _02077E50 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077E38
	cmp r3, #0x1c
	bls _02077E38
	add r2, r1, #0x600
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077E38:
	add r1, r1, #0x600
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl ArrayCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077E50: .word GXi_DmaId
	arm_func_end GXS_LoadOBJPltt

	arm_func_start GX_LoadOAM
GX_LoadOAM: ; 0x02077E54
	stmdb sp!, {r4, lr}
	ldr r3, _02077EA4 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077E90
	cmp r3, #0x30
	bls _02077E90
	mov r1, r4
	add r2, lr, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077E90:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x7000000
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077EA4: .word GXi_DmaId
	arm_func_end GX_LoadOAM

	arm_func_start GXS_LoadOAM
GXS_LoadOAM: ; 0x02077EA8
	stmdb sp!, {r3, lr}
	ldr r3, _02077EFC ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077EE4
	cmp r3, #0x30
	bls _02077EE4
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r3, pc}
_02077EE4:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x7000000
	bl ArrayCopy32
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077EFC: .word GXi_DmaId
	arm_func_end GXS_LoadOAM

	arm_func_start GX_LoadOBJ
GX_LoadOBJ: ; 0x02077F00
	stmdb sp!, {r4, lr}
	ldr r3, _02077F54 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6400000
	beq _02077F40
	cmp r3, #0x30
	bls _02077F40
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F40:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077F54: .word GXi_DmaId
	arm_func_end GX_LoadOBJ

	arm_func_start GXS_LoadOBJ
GXS_LoadOBJ: ; 0x02077F58
	stmdb sp!, {r4, lr}
	ldr r3, _02077FAC ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6600000
	beq _02077F98
	cmp r3, #0x30
	bls _02077F98
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F98:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl ArrayCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077FAC: .word GXi_DmaId
	arm_func_end GXS_LoadOBJ

	arm_func_start GX_LoadBG0Scr
GX_LoadBG0Scr: ; 0x02077FB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0ScrPtr
	ldr r1, _0207800C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02077FF8
	cmp r4, #0x1c
	bls _02077FF8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02077FF8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207800C: .word GXi_DmaId
	arm_func_end GX_LoadBG0Scr

	arm_func_start GX_LoadBG1Scr
GX_LoadBG1Scr: ; 0x02078010
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1ScrPtr
	ldr r1, _0207806C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078058
	cmp r4, #0x1c
	bls _02078058
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078058:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207806C: .word GXi_DmaId
	arm_func_end GX_LoadBG1Scr

	arm_func_start GXS_LoadBG1Scr
GXS_LoadBG1Scr: ; 0x02078070
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1ScrPtr
	ldr r1, _020780CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020780B8
	cmp r4, #0x1c
	bls _020780B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020780B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020780CC: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Scr

	arm_func_start GX_LoadBG2Scr
GX_LoadBG2Scr: ; 0x020780D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2ScrPtr
	ldr r1, _0207812C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078118
	cmp r4, #0x1c
	bls _02078118
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078118:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207812C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Scr

	arm_func_start GX_LoadBG3Scr
GX_LoadBG3Scr: ; 0x02078130
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3ScrPtr
	ldr r1, _0207818C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078178
	cmp r4, #0x1c
	bls _02078178
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078178:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207818C: .word GXi_DmaId
	arm_func_end GX_LoadBG3Scr

	arm_func_start GX_LoadBG0Char
GX_LoadBG0Char: ; 0x02078190
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG0CharPtr
	ldr r1, _020781EC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020781D8
	cmp r4, #0x30
	bls _020781D8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020781D8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020781EC: .word GXi_DmaId
	arm_func_end GX_LoadBG0Char

	arm_func_start GXS_LoadBG0Char
GXS_LoadBG0Char: ; 0x020781F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0CharPtr
	ldr r1, _0207824C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078238
	cmp r4, #0x30
	bls _02078238
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078238:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207824C: .word GXi_DmaId
	arm_func_end GXS_LoadBG0Char

	arm_func_start GX_LoadBG1Char
GX_LoadBG1Char: ; 0x02078250
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1CharPtr
	ldr r1, _020782AC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078298
	cmp r4, #0x30
	bls _02078298
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078298:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020782AC: .word GXi_DmaId
	arm_func_end GX_LoadBG1Char

	arm_func_start GXS_LoadBG1Char
GXS_LoadBG1Char: ; 0x020782B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1CharPtr
	ldr r1, _0207830C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020782F8
	cmp r4, #0x30
	bls _020782F8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020782F8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207830C: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Char

	arm_func_start GX_LoadBG2Char
GX_LoadBG2Char: ; 0x02078310
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2CharPtr
	ldr r1, _0207836C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078358
	cmp r4, #0x30
	bls _02078358
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078358:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207836C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Char

	arm_func_start GX_LoadBG3Char
GX_LoadBG3Char: ; 0x02078370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3CharPtr
	ldr r1, _020783CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020783B8
	cmp r4, #0x30
	bls _020783B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020783B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl ArrayCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020783CC: .word GXi_DmaId
	arm_func_end GX_LoadBG3Char

	arm_func_start GX_BeginLoadBGExtPltt
GX_BeginLoadBGExtPltt: ; 0x020783D0
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForBGExtPltt
	ldr r1, _02078460 ; =sSubBGExtPltt
	cmp r0, #0x20
	str r0, [r1, #0x14]
	bgt _02078404
	cmp r0, #0x20
	bge _02078448
	cmp r0, #0
	ldmleia sp!, {r3, pc}
	cmp r0, #0x10
	beq _02078420
	ldmia sp!, {r3, pc}
_02078404:
	cmp r0, #0x40
	bgt _02078414
	beq _02078434
	ldmia sp!, {r3, pc}
_02078414:
	cmp r0, #0x60
	beq _02078448
	ldmia sp!, {r3, pc}
_02078420:
	ldr r2, _02078464 ; =0x06880000
	mov r0, #0
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078434:
	ldr r2, _02078468 ; =0x06894000
	mov r0, #0x4000
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078448:
	ldr r2, _0207846C ; =0x06890000
	ldr r0, _02078460 ; =sSubBGExtPltt
	mov r1, #0
	str r2, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078460: .word sSubBGExtPltt
_02078464: .word 0x06880000
_02078468: .word 0x06894000
_0207846C: .word 0x06890000
	arm_func_end GX_BeginLoadBGExtPltt

	arm_func_start GX_EndLoadBGExtPltt
GX_EndLoadBGExtPltt: ; 0x02078470
	stmdb sp!, {r3, lr}
	ldr r0, _020784B0 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207848C
	bl sub_0207C0FC
_0207848C:
	ldr r0, _020784B4 ; =sSubBGExtPltt
	ldr r0, [r0, #0x14]
	bl GX_SetBankForBGExtPltt
	ldr r0, _020784B4 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784B0: .word GXi_DmaId
_020784B4: .word sSubBGExtPltt
	arm_func_end GX_EndLoadBGExtPltt

	arm_func_start GX_BeginLoadOBJExtPltt
GX_BeginLoadOBJExtPltt: ; 0x020784B8
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForOBJExtPltt
	ldr r1, _020784F4 ; =sSubBGExtPltt
	cmp r0, #0
	str r0, [r1, #8]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x20
	beq _020784E8
	cmp r0, #0x40
	ldreq r0, _020784F8 ; =0x06894000
	streq r0, [r1, #4]
	ldmia sp!, {r3, pc}
_020784E8:
	ldr r0, _020784FC ; =0x06890000
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784F4: .word sSubBGExtPltt
_020784F8: .word 0x06894000
_020784FC: .word 0x06890000
	arm_func_end GX_BeginLoadOBJExtPltt

	arm_func_start GX_EndLoadOBJExtPltt
GX_EndLoadOBJExtPltt: ; 0x02078500
	stmdb sp!, {r3, lr}
	ldr r0, _0207853C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207851C
	bl sub_0207C0FC
_0207851C:
	ldr r0, _02078540 ; =sSubBGExtPltt
	ldr r0, [r0, #8]
	bl GX_SetBankForOBJExtPltt
	ldr r0, _02078540 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207853C: .word GXi_DmaId
_02078540: .word sSubBGExtPltt
	arm_func_end GX_EndLoadOBJExtPltt

	arm_func_start GXS_BeginLoadBGExtPltt
GXS_BeginLoadBGExtPltt: ; 0x02078544
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubBGExtPltt
	ldr r1, _02078558 ; =sSubBGExtPltt
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078558: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadBGExtPltt

	arm_func_start GXS_EndLoadBGExtPltt
GXS_EndLoadBGExtPltt: ; 0x0207855C
	stmdb sp!, {r3, lr}
	ldr r0, _02078594 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078578
	bl sub_0207C0FC
_02078578:
	ldr r0, _02078598 ; =sSubBGExtPltt
	ldr r0, [r0]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, _02078598 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078594: .word GXi_DmaId
_02078598: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadBGExtPltt

	arm_func_start GXS_BeginLoadOBJExtPltt
GXS_BeginLoadOBJExtPltt: ; 0x0207859C
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubOBJExtPltt
	ldr r1, _020785B0 ; =sSubBGExtPltt
	str r0, [r1, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785B0: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadOBJExtPltt

	arm_func_start GXS_EndLoadOBJExtPltt
GXS_EndLoadOBJExtPltt: ; 0x020785B4
	stmdb sp!, {r3, lr}
	ldr r0, _020785EC ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020785D0
	bl sub_0207C0FC
_020785D0:
	ldr r0, _020785F0 ; =sSubBGExtPltt
	ldr r0, [r0, #0x18]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, _020785F0 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785EC: .word GXi_DmaId
_020785F0: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadOBJExtPltt

	arm_func_start GX_BeginLoadTex
GX_BeginLoadTex: ; 0x020785F4
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTex
	mov r1, #6
	mul lr, r0, r1
	ldr r2, _02078640 ; =sTexStartAddrTable
	ldr r1, _02078644 ; =sTexStartAddrTable + 2
	ldrh ip, [r2, lr]
	ldr r2, _02078648 ; =sTexStartAddrTable + 4
	ldrh r3, [r1, lr]
	ldr r1, _0207864C ; =sClrImg
	ldrh r2, [r2, lr]
	str r0, [r1, #0x14]
	mov r0, ip, lsl #0xc
	str r0, [r1, #4]
	mov r0, r3, lsl #0xc
	str r0, [r1, #0x18]
	mov r0, r2, lsl #0xc
	str r0, [r1, #0x1c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078640: .word sTexStartAddrTable
_02078644: .word sTexStartAddrTable + 2
_02078648: .word sTexStartAddrTable + 4
_0207864C: .word sClrImg
	arm_func_end GX_BeginLoadTex

	arm_func_start GX_LoadTex
GX_LoadTex: ; 0x02078650
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02078788 ; =sClrImg
	mov r7, r0
	ldr r4, [r3, #0x18]
	mov ip, r1
	cmp r4, #0
	ldreq r0, [r3, #4]
	mov r6, r2
	addeq r2, r0, ip
	beq _0207873C
	ldr r2, [r3, #0x1c]
	add r0, ip, r6
	cmp r0, r2
	ldrlo r0, [r3, #4]
	addlo r2, r0, ip
	blo _0207873C
	cmp ip, r2
	addhs r0, r4, ip
	subhs r2, r0, r2
	bhs _0207873C
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	sub r5, r2, ip
	cmp r0, r1
	ldr lr, [r3, #4]
	beq _020786DC
	cmp r5, #0x30
	bls _020786DC
	mov r1, r7
	mov r3, r5
	add r2, lr, ip
	bl sub_0207BCCC
	b _020786EC
_020786DC:
	mov r0, r7
	mov r2, r5
	add r1, lr, ip
	bl ArrayCopy32
_020786EC:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078724
	mov ip, #0
	str ip, [sp]
	mov r2, r4
	add r1, r7, r5
	sub r3, r6, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078724:
	mov r1, r4
	add r0, r7, r5
	sub r2, r6, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207873C:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078770
	mov r4, #0
	str r4, [sp]
	mov r1, r7
	mov r3, r6
	str r4, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078770:
	mov r1, r2
	mov r0, r7
	mov r2, r6
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02078788: .word sClrImg
_0207878C: .word GXi_DmaId
	arm_func_end GX_LoadTex

	arm_func_start GX_EndLoadTex
GX_EndLoadTex: ; 0x02078790
	stmdb sp!, {r3, lr}
	ldr r0, _020787D4 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020787AC
	bl sub_0207C0FC
_020787AC:
	ldr r0, _020787D8 ; =sClrImg
	ldr r0, [r0, #0x14]
	bl GX_SetBankForTex
	ldr r0, _020787D8 ; =sClrImg
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020787D4: .word GXi_DmaId
_020787D8: .word sClrImg
	arm_func_end GX_EndLoadTex

	arm_func_start GX_BeginLoadTexPltt
GX_BeginLoadTexPltt: ; 0x020787DC
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTexPltt
	mov r3, r0, asr #4
	ldr r1, _02078808 ; =sClrImg
	ldr r2, _0207880C ; =sTexPlttStartAddrTable
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	str r0, [r1, #0xc]
	mov r0, r2, lsl #0xc
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078808: .word sClrImg
_0207880C: .word sTexPlttStartAddrTable
	arm_func_end GX_BeginLoadTexPltt

	arm_func_start GX_LoadTexPltt
GX_LoadTexPltt: ; 0x02078810
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _02078874 ; =GXi_DmaId
	ldr lr, _02078878 ; =sClrImg
	ldr r4, [r3]
	mvn ip, #0
	mov r6, r0
	mov r5, r1
	mov r3, r2
	cmp r4, ip
	ldr lr, [lr, #8]
	beq _02078864
	mov ip, #0
	str ip, [sp]
	mov r0, r4
	mov r1, r6
	add r2, lr, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_02078864:
	add r1, lr, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078874: .word GXi_DmaId
_02078878: .word sClrImg
	arm_func_end GX_LoadTexPltt

	arm_func_start GX_EndLoadTexPltt
GX_EndLoadTexPltt: ; 0x0207887C
	stmdb sp!, {r3, lr}
	ldr r0, _020788B8 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078898
	bl sub_0207C0FC
_02078898:
	ldr r0, _020788BC ; =sClrImg
	ldr r0, [r0, #0xc]
	bl GX_SetBankForTexPltt
	ldr r0, _020788BC ; =sClrImg
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020788B8: .word GXi_DmaId
_020788BC: .word sClrImg
	arm_func_end GX_EndLoadTexPltt

	arm_func_start GeomGxFifoSendMtx4x3
GeomGxFifoSendMtx4x3: ; 0x020788C0
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1, {r2, r3, ip}
	bx lr
	arm_func_end GeomGxFifoSendMtx4x3

	arm_func_start GX_SendFifo64B
GX_SendFifo64B: ; 0x020788E4
	stmdb sp!, {r4, r5, r6, r7, r8}
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, ip}
	stmia r1, {r2, r3, r4, r5, r6, r7, r8, ip}
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, ip}
	stmia r1, {r2, r3, r4, r5, r6, r7, r8, ip}
	ldmia sp!, {r4, r5, r6, r7, r8}
	bx lr
	arm_func_end GX_SendFifo64B

