	.include "asm/macros.inc"
	.include "itcm.inc"

	.section .itcm,4,1,4

	arm_func_start CopyAndInterleave
CopyAndInterleave: ; 0x01FF8000
	stmdb sp!, {r0, r1, r2, r3, r4, r5, r6, r7, lr}
	and r3, r3, #0xf
	mov r6, #0
	cmp r6, r2
	bge _01FF80AC
_01FF8014:
	ldrh r4, [r1]
	and r4, r4, #0xf
	cmp r4, #0
	beq _01FF802C
	mov r7, r3, lsl #4
	orr r4, r4, r7
_01FF802C:
	mov r5, r4
	ldrh r4, [r1]
	and r4, r4, #0xf0
	cmp r4, #0
	beq _01FF8048
	mov r7, r3, lsl #8
	orr r4, r4, r7
_01FF8048:
	mov r4, r4, lsl #4
	orr r5, r5, r4
	strh r5, [r0]
	add r0, r0, #2
	ldrh r4, [r1]
	and r4, r4, #0xf00
	cmp r4, #0
	beq _01FF8070
	mov r7, r3, lsl #0xc
	orr r4, r4, r7
_01FF8070:
	mov r5, r4, lsr #8
	ldrh r4, [r1]
	and r4, r4, #0xf000
	mov r4, r4, lsr #4
	cmp r4, #0
	beq _01FF8090
	mov r7, r3, lsl #0xc
	orr r4, r4, r7
_01FF8090:
	orr r5, r5, r4
	strh r5, [r0]
	add r0, r0, #2
	add r6, r6, #2
	add r1, r1, #2
	cmp r6, r2
	blt _01FF8014
_01FF80AC:
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, pc}
	arm_func_end CopyAndInterleave

	arm_func_start CopyAndInterleave0
CopyAndInterleave0: ; 0x01FF80B0
	stmdb sp!, {r0, r1, r2, r3, r4, r5, r6, r7, lr}
	and r3, r3, #0xf
	mov r6, #0
	cmp r6, r2
	bge _01FF811C
_01FF80C4:
	ldrh r4, [r1]
	and r4, r4, #0xf
	mov r5, r4
	ldrh r4, [r1]
	and r4, r4, #0xf0
	mov r4, r4, lsl #4
	orr r5, r5, r4
	strh r5, [r0]
	add r0, r0, #2
	ldrh r4, [r1]
	and r4, r4, #0xf00
	mov r5, r4, lsr #8
	ldrh r4, [r1]
	and r4, r4, #0xf000
	mov r4, r4, lsr #4
	orr r5, r5, r4
	strh r5, [r0]
	add r0, r0, #2
	add r6, r6, #2
	add r1, r1, #2
	cmp r6, r2
	blt _01FF80C4
_01FF811C:
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, pc}
	arm_func_end CopyAndInterleave0
RENDER_3D_FUNCTIONS:
	.word Render3dRectangle
	.word Render3dQuadrilateral
	.word Render3dTiling
	.word Render3dTexture

	arm_func_start Render3dSetTextureParams
Render3dSetTextureParams: ; 0x01FF8130
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r2, _01FF81B8 ; =RENDER_3D
	mov r4, r1
	ldr r1, [r2, #8]
	cmp r1, r4
	beq _01FF81B0
	ldrh r3, [r0]
	ldr r2, _01FF81BC ; =_02099734
	mov r1, #0
	mov r3, r3, lsl #0x13
	mov r3, r3, lsr #0x1e
	ldr r3, [r2, r3, lsl #2]
	mov r2, #1
	str r3, [sp]
	stmib sp, {r1, r2, r4}
	ldrh r0, [r0]
	ldr r5, _01FF81C0 ; =_02099744
	ldr r2, _01FF81C4 ; =_02099764
	mov r3, r0, lsl #0x1d
	mov ip, r0, lsl #0x15
	mov lr, r3, lsr #0x1d
	mov r0, r0, lsl #0x1a
	mov r6, ip, lsr #0x1d
	mov ip, r0, lsr #0x1d
	ldr r3, _01FF81C8 ; =_02099784
	ldr r0, [r5, r6, lsl #2]
	ldr r2, [r2, lr, lsl #2]
	ldr r3, [r3, ip, lsl #2]
	bl GeomSetTexImageParam
	ldr r0, _01FF81B8 ; =RENDER_3D
	str r4, [r0, #8]
_01FF81B0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_01FF81B8: .word RENDER_3D
_01FF81BC: .word _02099734
_01FF81C0: .word _02099744
_01FF81C4: .word _02099764
_01FF81C8: .word _02099784
	arm_func_end Render3dSetTextureParams

	arm_func_start Render3dSetPaletteBase
Render3dSetPaletteBase: ; 0x01FF81CC
	ldr r2, _01FF8218 ; =RENDER_3D
	ldr r2, [r2, #4]
	cmp r2, r1
	bxeq lr
	ldrh r2, [r0]
	ldr r0, _01FF821C ; =_02099744
	mov r2, r2, lsl #0x15
	mov r2, r2, lsr #0x1d
	ldr r0, [r0, r2, lsl #2]
	ldr r2, _01FF8220 ; =0x040004AC
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	rsb r0, r0, #4
	mov r3, r1, lsr r0
	ldr r0, _01FF8218 ; =RENDER_3D
	str r3, [r2]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_01FF8218: .word RENDER_3D
_01FF821C: .word _02099744
_01FF8220: .word 0x040004AC
	arm_func_end Render3dSetPaletteBase

	arm_func_start Render3dRectangle
Render3dRectangle: ; 0x01FF8224
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	mov r4, r0
	ldrb r0, [r4, #0x23]
	cmp r0, #0
	beq _01FF8460
	ldrh r0, [r4, #0x18]
	mov r2, #0
	ldr r3, _01FF8468 ; =TRIG_TABLE
	mov r0, r0, asr #4
	mov r0, r0, lsl #1
	add r5, r0, #1
	mov r0, r0, lsl #1
	ldrsh r1, [r3, r0]
	mov r0, r5, lsl #1
	ldrsh r3, [r3, r0]
	rsb r0, r1, #0
	str r1, [sp, #0x14]
	str r3, [sp, #0x10]
	str r2, [sp, #0x18]
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #4]
	mov r0, r0, lsl #0xc
	str r0, [sp, #0x34]
	ldrsh r0, [r4, #6]
	mov r0, r0, lsl #0xc
	str r0, [sp, #0x38]
	ldrh r0, [r4, #2]
	add r0, r0, #1
	mov r0, r0, lsl #0xc
	rsb r0, r0, #0
	str r0, [sp, #0x3c]
	ldrb r0, [r4, #0x22]
	ldrb r1, [r4, #0x23]
	bl GeomSetPolygonAttributes
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r0, _01FF846C ; =RENDER_3D
	mvn r2, #0
	str r2, [r0, #8]
	ldr r1, _01FF8470 ; =0x04000444
	mov r2, #0
	add r0, sp, #0x10
	str r2, [r1]
	bl G3_MultMtx43
	ldrh r0, [r4, #0x14]
	ldrh r2, [r4, #0x16]
	ldr r1, _01FF8474 ; =0x0400046C
	mov r0, r0, lsl #6
	str r0, [r1]
	mov r0, r2, lsl #6
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	ldrb r0, [r4, #0x24]
	ldr r6, _01FF8478 ; =0x04000500
	mov r5, #0
	cmp r0, #0
	ldreqh r0, [r4, #0x1a]
	streq r0, [r1, #0x14]
	mov r0, #2
	str r0, [r6]
	ldrsh r2, [r4, #0xc]
	ldrb r0, [r4, #0x24]
	ldrsh r1, [r4, #0xe]
	sub r3, r5, r2, lsl #12
	cmp r0, #0
	sub ip, r5, r1, lsl #12
	ldrsh r2, [r4, #8]
	ldrsh r1, [r4, #0xa]
	ldrneh r0, [r4, #0x1a]
	mov lr, r3, asr #6
	mov r5, ip, asr #6
	strne r0, [r6, #-0x80]
	mov r0, r5, lsl #0x10
	mov lr, lr, lsl #0x10
	mov r0, r0, asr #0x10
	mov r5, lr, asr #0x10
	mov lr, r5, lsl #0x10
	add r3, r3, r2, lsl #12
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov lr, lr, lsr #0x10
	ldr r5, _01FF847C ; =0x0400048C
	orr r6, lr, r0, lsl #16
	str r6, [r5]
	mov r2, #0x1000
	str r2, [r5]
	ldrb r2, [r4, #0x24]
	mov r3, r3, asr #6
	add r1, ip, r1, lsl #12
	cmp r2, #0
	ldrneh r2, [r4, #0x1c]
	mov r1, r1, asr #6
	strne r2, [r5, #-0xc]
	mov r2, r3, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	ldr r3, _01FF847C ; =0x0400048C
	orr r0, r2, r0, lsl #16
	str r0, [r3]
	mov r0, #0x1000
	str r0, [r3]
	ldrb r0, [r4, #0x24]
	cmp r0, #0
	ldrneh r0, [r4, #0x1e]
	strne r0, [r3, #-0xc]
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	ldr r1, _01FF847C ; =0x0400048C
	orr r0, lr, r3, lsl #16
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	ldrb r0, [r4, #0x24]
	cmp r0, #0
	ldrneh r0, [r4, #0x20]
	strne r0, [r1, #-0xc]
	ldr r1, _01FF847C ; =0x0400048C
	orr r0, r2, r3, lsl #16
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x78]
	mov r0, #1
	str r0, [r1, #-0x44]
_01FF8460:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_01FF8468: .word TRIG_TABLE
_01FF846C: .word RENDER_3D
_01FF8470: .word 0x04000444
_01FF8474: .word 0x0400046C
_01FF8478: .word 0x04000500
_01FF847C: .word 0x0400048C
	arm_func_end Render3dRectangle

	arm_func_start GeomSetPolygonAttributes
GeomSetPolygonAttributes: ; 0x01FF8480
	mov r0, r0, lsl #0x18
	orr r2, r0, #0xc0
	ldr r0, _01FF8498 ; =0x040004A4
	orr r1, r2, r1, lsl #16
	str r1, [r0]
	bx lr
	.align 2, 0
_01FF8498: .word 0x040004A4
	arm_func_end GeomSetPolygonAttributes

	arm_func_start Render3dQuadrilateral
Render3dQuadrilateral: ; 0x01FF849C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x48
	mov r4, r0
	ldrb r0, [r4, #0x23]
	cmp r0, #0
	beq _01FF8708
	ldr r0, _01FF8710 ; =_02099724
	mov r3, #0x1000
	ldr ip, [r0, #4]
	ldr lr, [r0]
	mov r2, #0
	mov r0, ip, lsl #0xc
	mov r1, lr, lsl #0xc
	str r0, [sp, #0x40]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x20]
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	ldrh r1, [r4, #2]
	mov r0, #0x10
	str lr, [sp, #0x10]
	add r1, r1, #1
	mov r1, r1, lsl #0xc
	rsb r1, r1, #0
	str r1, [sp, #0x44]
	ldrb r1, [r4, #0x23]
	str ip, [sp, #0x14]
	bl GeomSetPolygonAttributes
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r1, _01FF8714 ; =RENDER_3D
	mvn r3, #0
	str r3, [r1, #8]
	ldr r2, _01FF8718 ; =0x04000444
	mov r1, #0
	add r0, sp, #0x18
	str r1, [r2]
	bl G3_MultMtx43
	ldr r1, _01FF871C ; =0x0400046C
	mov r0, #0x40000
	str r0, [r1]
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	ldrb r0, [r4, #0x24]
	ldr r3, _01FF8720 ; =0x04000500
	ldr lr, _01FF8724 ; =0x0400048C
	cmp r0, #0
	ldreqh r0, [r4, #0x1a]
	streq r0, [r1, #0x14]
	mov r0, #2
	str r0, [r3]
	ldrb r2, [r4, #0x24]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	cmp r2, #0
	ldrneh r2, [r4, #0x1a]
	strne r2, [r3, #-0x80]
	mov r2, #0
	str r2, [lr]
	mov r2, #0x1000
	str r2, [lr]
	ldrb r2, [r4, #0x24]
	ldrsh ip, [r4, #8]
	ldrsh r3, [r4, #0xa]
	cmp r2, #0
	ldrneh r2, [r4, #0x1c]
	mov ip, ip, lsl #0xc
	mov r3, r3, lsl #0xc
	sub ip, ip, r1, lsl #12
	sub r3, r3, r0, lsl #12
	mov ip, ip, asr #6
	mov r3, r3, asr #6
	strne r2, [lr, #-0xc]
	mov r2, r3, lsl #0x10
	mov r3, r2, asr #0x10
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, lsr #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	ldr lr, _01FF8724 ; =0x0400048C
	orr r2, r3, r2, lsr #16
	str r2, [lr]
	mov r2, #0x1000
	str r2, [lr]
	ldrsh r3, [r4, #0xe]
	ldrb r2, [r4, #0x24]
	ldrsh ip, [r4, #0xc]
	mov r3, r3, lsl #0xc
	cmp r2, #0
	ldrneh r2, [r4, #0x1e]
	sub r3, r3, r0, lsl #12
	mov ip, ip, lsl #0xc
	sub ip, ip, r1, lsl #12
	strne r2, [lr, #-0xc]
	mov r3, r3, asr #6
	mov r2, r3, lsl #0x10
	mov r3, r2, asr #0x10
	mov ip, ip, asr #6
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, lsr #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	ldr lr, _01FF8724 ; =0x0400048C
	orr r2, r3, r2, lsr #16
	str r2, [lr]
	mov r2, #0x1000
	str r2, [lr]
	ldrsh ip, [r4, #0x10]
	ldrsh r3, [r4, #0x12]
	ldrb r2, [r4, #0x24]
	mov ip, ip, lsl #0xc
	mov r3, r3, lsl #0xc
	sub r1, ip, r1, lsl #12
	cmp r2, #0
	sub r0, r3, r0, lsl #12
	mov r2, r1, asr #6
	mov r1, r0, asr #6
	ldrneh r0, [r4, #0x20]
	strne r0, [lr, #-0xc]
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsr #0x10
	mov r2, r1, lsl #0x10
	mov r0, r0, lsl #0x10
	ldr r1, _01FF8724 ; =0x0400048C
	orr r0, r2, r0, lsr #16
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x78]
	mov r0, #1
	str r0, [r1, #-0x44]
_01FF8708:
	add sp, sp, #0x48
	ldmia sp!, {r4, pc}
	.align 2, 0
_01FF8710: .word _02099724
_01FF8714: .word RENDER_3D
_01FF8718: .word 0x04000444
_01FF871C: .word 0x0400046C
_01FF8720: .word 0x04000500
_01FF8724: .word 0x0400048C
	arm_func_end Render3dQuadrilateral

	arm_func_start Render3dTiling
Render3dTiling: ; 0x01FF8728
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	ldrb r0, [sl, #0x31]
	cmp r0, #0
	beq _01FF89EC
	ldr r0, _01FF89F4 ; =_02099724
	ldr r1, [sl, #4]
	ldr r3, [r0, #8]
	ldr r2, [r0, #0xc]
	add r0, sl, #0x14
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	bl Render3dSetTextureParams
	ldr r1, [sl, #8]
	add r0, sl, #0x14
	bl Render3dSetPaletteBase
	ldrsh r7, [sl, #0xc]
	ldrsh r0, [sl, #0x10]
	ldrsh r6, [sl, #0xe]
	ldrsh r4, [sl, #0x12]
	add r5, r7, r0
	mov r0, r7, lsl #0xc
	str r0, [sp, #0x10]
	mov r0, r6, lsl #0xc
	ldrsh r1, [sl, #0x1a]
	ldrsh r2, [sl, #0x18]
	mov fp, r5, lsl #0xc
	add r4, r6, r4
	str r0, [sp, #0xc]
	mov r0, r4, lsl #0xc
	str r0, [sp, #8]
	mov r0, r1, lsl #0xc
	ldrsh r1, [sl, #0x20]
	mov r5, r2, lsl #0xc
	ldrsh r2, [sl, #0x1c]
	str r0, [sp, #4]
	ldrsh r0, [sl, #0x1e]
	mov r7, r1, lsl #0xc
	ldrsh r1, [sl, #0x24]
	ldrsh r3, [sl, #0x16]
	mov r6, r2, lsl #0xc
	ldrsh r2, [sl, #0x22]
	mov r0, r0, lsl #0xc
	str r0, [sp]
	mov r0, #0x1000
	mov sb, r1, lsl #0xc
	ldr r1, [sp, #0x14]
	mov r8, r2, lsl #0xc
	mov r2, #0
	mov r1, r1, lsl #0xc
	str r0, [sp, #0x1c]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x18]
	str r2, [sp, #0x20]
	mov r0, r0, lsl #0xc
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	str r2, [sp, #0x38]
	str r2, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r0, [sp, #0x44]
	ldrh r0, [sl, #2]
	mov r4, r3, lsl #0xc
	add r0, r0, #1
	mov r0, r0, lsl #0xc
	rsb r0, r0, #0
	str r0, [sp, #0x48]
	ldrb r0, [sl, #0x30]
	ldrb r1, [sl, #0x31]
	bl GeomSetPolygonAttributes
	ldr r1, _01FF89F8 ; =0x04000444
	mov r2, #0
	add r0, sp, #0x1c
	str r2, [r1]
	bl G3_MultMtx43
	ldr r1, _01FF89FC ; =0x0400046C
	mov r0, #0x40000
	str r0, [r1]
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	ldrb r0, [sl, #0x32]
	mov r2, r5, lsl #0xa
	cmp r0, #0
	ldreqh r0, [sl, #0x26]
	streq r0, [r1, #0x14]
	ldr r1, _01FF8A00 ; =0x04000500
	mov r0, #1
	str r0, [r1]
	ldrb r0, [sl, #0x32]
	cmp r0, #0
	ldrneh r0, [sl, #0x26]
	strne r0, [r1, #-0x80]
	ldr r0, [sp, #0xc]
	mov r1, r0, lsl #8
	ldr r0, [sp, #0x10]
	mov r3, r1, asr #0x10
	mov r0, r0, lsl #8
	mov r0, r0, asr #0x10
	mov r1, r2, asr #0x10
	mov r2, r3, lsl #0x10
	mov r5, r0, lsl #0x10
	mov r0, r4, lsl #0xa
	mov r3, r1, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, r3, lsr #0x10
	mov r3, r2, lsr #0x10
	mov r4, r5, lsr #0x10
	ldr r2, _01FF8A04 ; =0x04000488
	mov r1, r1, lsl #0x10
	mov r0, r0, lsl #0x10
	orr r0, r0, r1, lsr #16
	orr r1, r4, r3, lsl #16
	str r1, [r2]
	str r0, [r2, #4]
	mov r0, #0x1000
	str r0, [r2, #4]
	ldrb r0, [sl, #0x32]
	mov r1, r6, lsl #0xa
	mov r1, r1, asr #0x10
	cmp r0, #0
	ldrneh r0, [sl, #0x28]
	strne r0, [r2, #-8]
	mov r0, fp, lsl #8
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	ldr r0, [sp, #4]
	ldr r2, _01FF8A04 ; =0x04000488
	mov r0, r0, lsl #0xa
	orr r3, r5, r3, lsl #16
	str r3, [r2]
	mov r0, r0, asr #0x10
	mov r2, #0x1000
	bl GeomSetVertexCoord16
	ldrb r0, [sl, #0x32]
	ldr r2, _01FF8A04 ; =0x04000488
	cmp r0, #0
	ldrneh r1, [sl, #0x2c]
	ldrne r0, _01FF8A08 ; =0x04000480
	strne r1, [r0]
	ldr r0, [sp, #8]
	mov r1, sb, lsl #0xa
	mov r0, r0, lsl #8
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	mov r0, r8, lsl #0xa
	orr r3, r5, r6, lsl #16
	str r3, [r2]
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	mov r2, #0x1000
	bl GeomSetVertexCoord16
	ldrb r0, [sl, #0x32]
	ldr r3, _01FF8A04 ; =0x04000488
	orr r4, r4, r6, lsl #16
	cmp r0, #0
	ldrneh r1, [sl, #0x2a]
	ldrne r0, _01FF8A08 ; =0x04000480
	mov r2, #0x1000
	strne r1, [r0]
	ldr r0, [sp]
	mov r1, r7, lsl #0xa
	mov r0, r0, lsl #0xa
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	str r4, [r3]
	bl GeomSetVertexCoord16
	ldr r1, _01FF8A0C ; =0x04000504
	mov r0, #0
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #-0xbc]
_01FF89EC:
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF89F4: .word _02099724
_01FF89F8: .word 0x04000444
_01FF89FC: .word 0x0400046C
_01FF8A00: .word 0x04000500
_01FF8A04: .word 0x04000488
_01FF8A08: .word 0x04000480
_01FF8A0C: .word 0x04000504
	arm_func_end Render3dTiling

	arm_func_start Render3dTextureInternal
Render3dTextureInternal: ; 0x01FF8A10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r8, r0
	ldrh r0, [r8, #0x24]
	ldr r5, _01FF8C1C ; =TRIG_TABLE
	ldrsh r4, [r8, #0xc]
	mov r0, r0, asr #4
	mov r0, r0, lsl #1
	add r1, r0, #1
	mov r0, r0, lsl #1
	mov r6, r1, lsl #1
	ldrsh r1, [r5, r0]
	ldrsh r3, [r8, #0xe]
	ldrsh sb, [r8, #0x10]
	ldrsh r7, [r8, #0x12]
	mov r2, #0
	ldrsh r5, [r5, r6]
	rsb r0, r1, #0
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	str r2, [sp, #8]
	str r2, [sp, #0x14]
	add r0, r3, r7
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x20]
	str r5, [sp]
	str r5, [sp, #0x10]
	ldrsh r5, [r8, #0x16]
	add r1, r4, sb
	mov r7, r0, lsl #0xc
	mov r5, r5, lsl #0xc
	str r5, [sp, #0x24]
	ldrsh r6, [r8, #0x18]
	mov r5, r3, lsl #0xc
	mov r4, r4, lsl #0xc
	mov r3, r6, lsl #0xc
	str r3, [sp, #0x28]
	ldrh r3, [r8, #2]
	mov r6, r1, lsl #0xc
	add r0, r3, #1
	mov r0, r0, lsl #0xc
	rsb r0, r0, #0
	str r0, [sp, #0x2c]
	ldrb r0, [r8, #0x26]
	ldrb r1, [r8, #0x27]
	bl GeomSetPolygonAttributes
	ldr r1, _01FF8C20 ; =0x04000444
	mov r2, #0
	add r0, sp, #0
	str r2, [r1]
	bl G3_MultMtx43
	ldrh r0, [r8, #0x1e]
	ldrh r1, [r8, #0x20]
	ldr r3, _01FF8C24 ; =0x0400046C
	mov r0, r0, lsl #6
	str r0, [r3]
	mov r0, r1, lsl #6
	str r0, [r3]
	mov r2, #0x1000
	str r2, [r3]
	ldrh sb, [r8, #0x22]
	mov r1, #1
	mov r0, #0
	str sb, [r3, #0x14]
	str r1, [r3, #0x94]
	ldrsh sb, [r8, #0x1a]
	ldrsh r8, [r8, #0x1c]
	sub fp, r0, sb, lsl #12
	sub sl, r0, r8, lsl #12
	mov r8, fp, asr #6
	mov sb, r5, lsl #8
	mov ip, r4, lsl #8
	mov sb, sb, asr #0x10
	mov lr, ip, asr #0x10
	mov ip, sl, lsl #0xa
	mov sb, sb, lsl #0x10
	mov sb, sb, lsr #0x10
	mov lr, lr, lsl #0x10
	mov lr, lr, lsr #0x10
	mov ip, ip, asr #0x10
	mov ip, ip, lsl #0x10
	mov ip, ip, lsr #0x10
	mov r8, r8, lsl #0x10
	mov r8, r8, asr #0x10
	mov r8, r8, lsl #0x10
	mov r8, r8, lsr #0x10
	sub r4, r6, r4
	add r4, fp, r4
	mov r6, r6, lsl #8
	orr fp, lr, sb, lsl #16
	str fp, [r3, #0x1c]
	mov fp, r6, asr #0x10
	mov r6, r4, lsl #0xa
	orr r4, r8, ip, lsl #16
	str r4, [r3, #0x20]
	mov r4, fp, lsl #0x10
	mov r6, r6, asr #0x10
	sub r5, r7, r5
	mov r4, r4, lsr #0x10
	mov r6, r6, lsl #0x10
	add r5, sl, r5
	mov r7, r7, lsl #8
	mov r6, r6, lsr #0x10
	mov sl, r7, asr #0x10
	mov r7, r5, lsl #0xa
	mov r5, sl, lsl #0x10
	mov r5, r5, lsr #0x10
	mov r7, r7, asr #0x10
	mov r7, r7, lsl #0x10
	mov r7, r7, lsr #0x10
	str r2, [r3, #0x20]
	orr sb, r4, sb, lsl #16
	str sb, [r3, #0x1c]
	orr sb, r6, ip, lsl #16
	str sb, [r3, #0x20]
	str r2, [r3, #0x20]
	orr r4, r4, r5, lsl #16
	str r4, [r3, #0x1c]
	orr r4, r6, r7, lsl #16
	str r4, [r3, #0x20]
	str r2, [r3, #0x20]
	orr r4, lr, r5, lsl #16
	str r4, [r3, #0x1c]
	orr r4, r8, r7, lsl #16
	str r4, [r3, #0x20]
	str r2, [r3, #0x20]
	str r0, [r3, #0x98]
	str r1, [r3, #-0x24]
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF8C1C: .word TRIG_TABLE
_01FF8C20: .word 0x04000444
_01FF8C24: .word 0x0400046C
	arm_func_end Render3dTextureInternal

	arm_func_start Render3dTexture
Render3dTexture: ; 0x01FF8C28
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x27]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #4]
	add r0, r4, #0x14
	bl Render3dSetTextureParams
	ldr r1, [r4, #8]
	add r0, r4, #0x14
	bl Render3dSetPaletteBase
	mov r0, r4
	bl Render3dTextureInternal
	ldmia sp!, {r4, pc}
	arm_func_end Render3dTexture

	arm_func_start Render3dTextureNoSetup
Render3dTextureNoSetup: ; 0x01FF8C60
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x27]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	bl Render3dTextureInternal
	ldmia sp!, {r3, pc}
	arm_func_end Render3dTextureNoSetup

	arm_func_start NewRender3dElement
NewRender3dElement: ; 0x01FF8C78
	ldr r0, _01FF8CA8 ; =RENDER_3D
	ldrsh r2, [r0]
	ldrsh r1, [r0, #2]
	cmp r2, r1
	movge r0, #0
	bxge lr
	add r1, r2, #1
	strh r1, [r0]
	ldr r1, [r0, #0x40]
	mov r0, #0x34
	smlabb r0, r2, r0, r1
	bx lr
	.align 2, 0
_01FF8CA8: .word RENDER_3D
	arm_func_end NewRender3dElement

	arm_func_start EnqueueRender3dTexture
EnqueueRender3dTexture: ; 0x01FF8CAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl NewRender3dElement
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0x28
	bl MemcpyFast
	mov r0, #3
	strh r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end EnqueueRender3dTexture

	arm_func_start EnqueueRender3dTiling
EnqueueRender3dTiling: ; 0x01FF8CDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl NewRender3dElement
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0x34
	bl MemcpyFast
	mov r0, #2
	strh r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end EnqueueRender3dTiling

	arm_func_start NewRender3dRectangle
NewRender3dRectangle: ; 0x01FF8D0C
	stmdb sp!, {r4, lr}
	bl NewRender3dElement
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	mov r2, #0x26
	bl MemsetFast
	mov r1, #0
	mov r0, r4
	strh r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NewRender3dRectangle

	arm_func_start NewRender3dQuadrilateral
NewRender3dQuadrilateral: ; 0x01FF8D3C
	stmdb sp!, {r4, lr}
	bl NewRender3dElement
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	mov r2, #0x26
	bl MemsetFast
	mov r1, #1
	mov r0, r4
	strh r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NewRender3dQuadrilateral

	arm_func_start NewRender3dTexture
NewRender3dTexture: ; 0x01FF8D6C
	stmdb sp!, {r4, lr}
	bl NewRender3dElement
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	mov r2, #0x28
	bl MemsetFast
	mov r1, #3
	mov r0, r4
	strh r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NewRender3dTexture

	arm_func_start NewRender3dTiling
NewRender3dTiling: ; 0x01FF8D9C
	stmdb sp!, {r4, lr}
	bl NewRender3dElement
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	mov r2, #0x34
	bl MemsetFast
	mov r1, #2
	mov r0, r4
	strh r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NewRender3dTiling

	arm_func_start Render3dProcessQueue
Render3dProcessQueue: ; 0x01FF8DCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x200
	ldr r0, _01FF8EFC ; =RENDER_3D
	ldrsh r4, [r0]
	cmp r4, #0
	beq _01FF8EF4
	cmp r4, #0
	ldr r3, [r0, #0x40]
	mov r2, #0
	ble _01FF8E18
	add r1, sp, #0
	b _01FF8E10
_01FF8DFC:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	str r3, [r1, r2, lsl #2]
	mov r2, r0, asr #0x10
	add r3, r3, #0x34
_01FF8E10:
	cmp r2, r4
	blt _01FF8DFC
_01FF8E18:
	mov r2, #0
	add r1, sp, #0
	b _01FF8E34
_01FF8E24:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	str r2, [r1, r4, lsl #2]
	mov r4, r0, asr #0x10
_01FF8E34:
	cmp r4, #0x80
	blt _01FF8E24
	ldr r0, _01FF8EFC ; =RENDER_3D
	mov r5, #0
	ldrsh r7, [r0]
	add r4, sp, #0
	sub r6, r7, #1
	b _01FF8E98
_01FF8E54:
	mov ip, r5
	b _01FF8E84
_01FF8E5C:
	ldr r3, [r4, ip, lsl #2]
	ldr r2, [r4, r5, lsl #2]
	ldrh r0, [r3, #2]
	ldrh r1, [r2, #2]
	cmp r1, r0
	add r0, ip, #1
	strlo r3, [r4, r5, lsl #2]
	mov r0, r0, lsl #0x10
	strlo r2, [r4, ip, lsl #2]
	mov ip, r0, asr #0x10
_01FF8E84:
	cmp ip, r7
	blt _01FF8E5C
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_01FF8E98:
	cmp r5, r6
	blt _01FF8E54
	mov r6, #0
	add r5, sp, #0
	ldr r4, _01FF8F00 ; =RENDER_3D_FUNCTIONS
	ldr r7, _01FF8EFC ; =RENDER_3D
	b _01FF8EDC
_01FF8EB4:
	ldr r0, [r5, r6, lsl #2]
	ldrh r1, [r0]
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #30
	add r1, r2, r1, ror #30
	ldr r1, [r4, r1, lsl #2]
	blx r1
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_01FF8EDC:
	ldrsh r0, [r7]
	cmp r6, r0
	blt _01FF8EB4
	ldr r0, _01FF8EFC ; =RENDER_3D
	mov r1, #0
	strh r1, [r0]
_01FF8EF4:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF8EFC: .word RENDER_3D
_01FF8F00: .word RENDER_3D_FUNCTIONS
	arm_func_end Render3dProcessQueue

	arm_func_start sub_01FF8F04
sub_01FF8F04: ; 0x01FF8F04
	ldr r1, _01FF8F20 ; =0x040004AC
	mov r2, #0
	ldr r0, _01FF8F24 ; =RENDER_3D
	str r2, [r1]
	sub r1, r2, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_01FF8F20: .word 0x040004AC
_01FF8F24: .word RENDER_3D
	arm_func_end sub_01FF8F04

	arm_func_start sub_01FF8F28
sub_01FF8F28: ; 0x01FF8F28
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	ldr lr, _01FF8FAC ; =0x0209A138
	mov r4, #0
_01FF8F34:
	cmp r4, #0
	ldrb r5, [r0, r4]
	ldreqb r6, [r1, r4]
	beq _01FF8F70
	add r3, r0, r4
	cmp r5, #0xff
	ldreqb r3, [r3, #-1]
	ldrb r6, [r1, r4]
	addeq r3, lr, r3, lsl #1
	ldreqb r5, [r3, #1]
	add r3, r1, r4
	cmp r6, #0xff
	ldreqb r3, [r3, #-1]
	addeq r3, lr, r3, lsl #1
	ldreqb r6, [r3, #1]
_01FF8F70:
	ldrb ip, [lr, r5, lsl #1]
	ldrb r3, [lr, r6, lsl #1]
	add r4, r4, #1
	cmp ip, r3
	beq _01FF8F90
	mvnlo r0, #0
	movhs r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_01FF8F90:
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, r2
	blt _01FF8F34
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_01FF8FAC: .word _02099E44
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	str sl, [sp]
	mov r6, sl
	mov r7, sl
	mov r8, sl
	mov sb, sl
_01FF8F44:
	ldr r3, [sp]
	ldrb r4, [r1, sl]
	ldrb r5, [r0, r3]
	add r3, r3, #1
	str r3, [sp]
	ldr r3, _01FF9054 ; =_02099E44
	mov fp, r5, lsl #1
	ldrh fp, [r3, fp]
	mov r4, r4, lsl #1
	ldrh r3, [r3, r4]
	and r4, fp, #0xff00
	mov r4, r4, lsl #0x10
	and ip, r3, #0xff00
	mov r4, r4, lsr #0x10
	mov ip, ip, lsl #0x10
	add sl, sl, #1
	cmp r4, ip, lsr #16
	beq _01FF8F98
	mvnlo r0, #0
	movhs r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FF8F98:
	cmp r6, #0
	bne _01FF9004
	and lr, r3, #0xf
	and r4, fp, #0xf
	ldr r3, _01FF9058 ; =0x0000FFFE
	mov fp, r4, lsl #0x10
	mov ip, lr, lsl #0x10
	and fp, r3, fp, lsr #16
	and r3, r3, ip, lsr #16
	cmp fp, r3
	beq _01FF8FDC
	cmp r4, lr
	movlo r3, #1
	movhs r3, #0
	and r8, r3, #0xff
	mov r6, #1
	b _01FF9004
_01FF8FDC:
	cmp r7, #0
	bne _01FF9004
	and fp, lr, #1
	and r3, r4, #1
	cmp r3, fp
	beq _01FF9004
	movlt r3, #1
	movge r3, #0
	and sb, r3, #0xff
	mov r7, #1
_01FF9004:
	cmp r5, #0
	beq _01FF901C
	ldr r3, [sp]
	cmp r3, r2
	cmplt sl, r2
	blt _01FF8F44
_01FF901C:
	cmp r6, #0
	beq _01FF9034
	cmp r8, #0
	mvnne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FF9034:
	cmp r7, #0
	beq _01FF904C
	cmp sb, #0
	mvnne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FF904C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9054: .word _02099E44
_01FF9058: .word 0x0000FFFE
#endif
	arm_func_end sub_01FF8F28

	arm_func_start sub_01FF905C
sub_01FF905C: ; 0x01FF905C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r4, r3
	bl sub_0202796C_JP
	cmp sb, #0
	mov r6, r0
	cmpge r8, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r8, asr #2
	add r5, r8, r0, lsr #29
	mov r0, sl
	mov r7, r5, asr #3
	bl GetWindow
	ldrb r1, [r0, #6]
	mov r0, sb, asr #2
	mov r2, r8, lsr #0x1f
	mul r1, r7, r1
	add r0, sb, r0, lsr #29
	add r3, r1, r0, asr #3
	rsb r1, r2, r8, lsl #29
	mov r0, sl
	add r3, r6, r3, lsl #6
	add r1, r2, r1, ror #29
	add r6, r3, r1, lsl #3
	bl GetWindow
	ldrb r0, [r0, #7]
	cmp r0, r5, asr #3
	cmpgt r4, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #29
	add r1, r1, r0, ror #29
	ldr r2, _01FF912C ; =0x0209B488
	mov r0, #0x18
	mla r2, r1, r0, r2
	ldr ip, [sp, #0x20]
	mov r1, #8
	mov r0, #0
	b _01FF9120
_01FF9054:
	mov r8, r4
	cmp r4, #8
	movge r8, r1
	mov r5, r0
	mov r3, r0
	mov r7, r0
	b _01FF9084
_01FF9070:
	mov r3, r3, lsl #8
	orr r3, r3, r5, lsr #24
	orr r3, r3, ip, asr #31
	orr r5, ip, r5, lsl #8
	add r7, r7, #1
_01FF9084:
	cmp r7, r8
	blt _01FF9070
	cmp r3, #0
	cmpeq r5, #0
	beq _01FF9118
	ldr r7, [r2, #4]
	ldr r8, [r2, #0x10]
	and sb, r3, r7
	ldr r7, [r2]
	mov sl, sb, lsl r8
	and sb, r5, r7
	rsb r7, r8, #0x20
	ldr lr, [r6]
	orr sl, sl, sb, lsr r7
	sub r7, r8, #0x20
	orr lr, lr, sb, lsl r8
	ldr r8, [r6, #4]
	orr sl, sl, sb, lsl r7
	str lr, [r6]
	orr r7, r8, sl
	str r7, [r6, #4]
	ldr r7, [r2, #0x14]
	ldr sb, [r2, #8]
	ldr r8, [r2, #0xc]
	and r5, r5, sb
	mov sb, r5, lsr r7
	and r5, r3, r8
	rsb r3, r7, #0x20
	ldr r8, [r6, #0x44]
	orr sb, sb, r5, lsl r3
	sub r3, r7, #0x20
	orr r7, r8, r5, lsr r7
	orr sb, sb, r5, lsr r3
	ldr r3, [r6, #0x40]
	orr r3, r3, sb
	str r3, [r6, #0x40]
	str r7, [r6, #0x44]
_01FF9118:
	add r6, r6, #0x40
	sub r4, r4, #8
_01FF9120:
	cmp r4, #0
	bgt _01FF9054
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_01FF912C: .word 0x0209B488
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sp, #0x20]
	mov r6, r1
	mov r5, r2
	mov r8, r3
	bl GetWindow
	mov r7, r0
	mov r0, sb
	bl sub_0202760C
	cmp r5, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r1, [r7, #7]
	cmp r5, r1, lsl #3
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r3, [r7, #6]
	cmp r6, #0
	add r1, r6, r8
	mov r2, r3, lsl #3
	bge _01FF90B8
	cmp r1, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r6, #0
_01FF90B8:
	cmp r1, r2
	blt _01FF90CC
	cmp r6, r2
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r1, r2, #1
_01FF90CC:
	mov r2, r5, asr #2
	add r2, r5, r2, lsr #29
	mov r2, r2, asr #3
	mul ip, r2, r3
	mov r3, r5, lsr #0x1f
	rsb r2, r3, r5, lsl #29
	add r2, r3, r2, ror #29
	add r2, r2, ip, lsl #3
	add r5, r0, r2, lsl #3
	and r4, r4, #0xff
	b _01FF911C
_01FF90F8:
	mov r2, r6, lsr #0x1f
	rsb r0, r2, r6, lsl #29
	mov r3, r6, asr #2
	add r3, r6, r3, lsr #29
	add r0, r2, r0, ror #29
	mov r2, r3, asr #3
	add r0, r5, r0
	strb r4, [r0, r2, lsl #6]
	add r6, r6, #1
_01FF911C:
	cmp r6, r1
	ble _01FF90F8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
#endif
	arm_func_end sub_01FF905C

#ifdef JAPAN
	arm_func_start sub_01FF9130_JP
sub_01FF9130_JP: ; 0x01FF9130
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	mov r4, r5
	mov r6, r5
	mov r8, r5
	mov r7, #0xff
	mov r3, r5
	mov r2, r5
_01FF9150:
	and ip, r6, r1
	and lr, r7, r0
	cmp ip, r3
	cmpeq lr, r2
	orreq r4, r4, r6
	moveq r6, r6, lsl #8
	movne r6, r6, lsl #8
	add r8, r8, #1
	orreq r5, r5, r7
	orr r6, r6, r7, lsr #24
	mov r7, r7, lsl #8
	cmp r8, #8
	blt _01FF9150
	mov r0, r5
	mov r1, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_01FF9130_JP
#endif

	arm_func_start sub_01FF9128
sub_01FF9128: ; 0x01FF9128
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r1, #0xe0
	mul r3, r0, r1
	ldr r1, _01FF9290 ; =WINDOW_LIST
	add r1, r1, r3
	str r1, [sp]
	ldrb r1, [r1, #7]
	str r1, [sp, #0x10]
	cmp r1, #1
	blo _01FF9288
	ldr r1, _01FF9294 ; =_022A88FC
	ldr r2, _01FF9298 ; =_022A88F0
	ldr r1, [r1, r3]
	ldr r8, [r2, r3]
	add sl, r1, #8
	mov r6, #0
	b _01FF9274
_01FF9170:
	ldr r1, [sp, #0x10]
	mov sb, r8
	sub r1, r1, #1
	mov r7, #0
	str r1, [sp, #0xc]
	b _01FF9200
_01FF9188:
	add r4, sb, #8
	ldmia r4, {r2, r3}
	add r1, sb, #0x10
	stmia sb, {r2, r3}
	ldmia r1, {r2, r3}
	str r1, [sp, #4]
	add r1, sb, sl, lsl #3
	stmia r4, {r2, r3}
	str r1, [sp, #8]
	add r5, sb, #0x18
	ldr r1, [sp, #4]
	ldmia r5, {r2, r3}
	stmia r1, {r2, r3}
	add r4, sb, #0x20
	ldmia r4, {r2, r3}
	stmia r5, {r2, r3}
	add lr, sb, #0x28
	ldmia lr, {r2, r3}
	stmia r4, {r2, r3}
	add ip, sb, #0x30
	ldmia ip, {r2, r3}
	add fp, sb, #0x38
	stmia lr, {r2, r3}
	ldmia fp, {r2, r3}
	stmia ip, {r2, r3}
	ldr r1, [sp, #8]
	add sb, sb, sl, lsl #3
	ldmia r1, {r2, r3}
	stmia fp, {r2, r3}
	add r7, r7, #1
_01FF9200:
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blt _01FF9188
	add r4, sb, #8
	ldmia r4, {r2, r3}
	stmia sb, {r2, r3}
	add r1, sb, #0x10
	ldmia r1, {r2, r3}
	stmia r4, {r2, r3}
	add ip, sb, #0x18
	ldmia ip, {r2, r3}
	stmia r1, {r2, r3}
	add fp, sb, #0x20
	add r7, sb, #0x28
	add r5, sb, #0x30
	add r4, sb, #0x38
	mov r1, #0
	add r8, r8, #0x40
	add r6, r6, #1
	ldmia fp, {r2, r3}
	stmia ip, {r2, r3}
	ldmia r7, {r2, r3}
	stmia fp, {r2, r3}
	ldmia r5, {r2, r3}
	stmia r7, {r2, r3}
	ldmia r4, {r2, r3}
	stmia r5, {r2, r3}
	str r1, [sb, #0x38]
	str r1, [sb, #0x3c]
_01FF9274:
	ldr r1, [sp]
	ldrb r1, [r1, #6]
	cmp r6, r1
	blt _01FF9170
	bl UpdateWindow
_01FF9288:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9290: .word WINDOW_LIST
_01FF9294: .word _022A88FC
_01FF9298: .word _022A88F0
	arm_func_end sub_01FF9128

	arm_func_start sub_01FF929C
sub_01FF929C: ; 0x01FF929C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov r1, #0xe0
	mul r4, r0, r1
	ldr r1, _01FF9428 ; =WINDOW_LIST
	add r1, r1, r4
	str r1, [sp, #8]
	ldrb r1, [r1, #7]
	str r1, [sp, #4]
	cmp r1, #1
	blo _01FF9420
	ldr r1, _01FF942C ; =_022A88FC
	ldr r3, _01FF9430 ; =_022A88F0
	ldr r2, [r1, r4]
	ldr r8, [r3, r4]
	add r1, r2, #8
	str r1, [sp]
	add fp, r2, #9
	mov r6, #0
	b _01FF940C
_01FF92EC:
	ldr r1, [sp, #4]
	mov sb, r8
	sub r1, r1, #1
	mov r7, #0
	str r1, [sp, #0x18]
	b _01FF9398
_01FF9304:
	add r1, sb, #0x10
	ldmia r1, {r2, r3}
	stmia sb, {r2, r3}
	ldr r2, [sp]
	str r1, [sp, #0x1c]
	add r1, sb, #8
	str r1, [sp, #0xc]
	add r2, sb, r2, lsl #3
	str r2, [sp, #0x10]
	add r2, sb, fp, lsl #3
	str r2, [sp, #0x14]
	ldr r2, [sp]
	ldr sl, [sp, #0xc]
	add r5, sb, #0x18
	add r4, sb, #0x20
	add lr, sb, #0x28
	add ip, sb, #0x30
	add r1, sb, #0x38
	add sb, sb, r2, lsl #3
	ldmia r5, {r2, r3}
	stmia sl, {r2, r3}
	ldr sl, [sp, #0x1c]
	ldmia r4, {r2, r3}
	stmia sl, {r2, r3}
	ldmia lr, {r2, r3}
	stmia r5, {r2, r3}
	ldmia ip, {r2, r3}
	stmia r4, {r2, r3}
	ldmia r1, {r2, r3}
	stmia lr, {r2, r3}
	ldr r2, [sp, #0x10]
	add r7, r7, #1
	ldmia r2, {r2, r3}
	stmia ip, {r2, r3}
	ldr r2, [sp, #0x14]
	ldmia r2, {r2, r3}
	stmia r1, {r2, r3}
_01FF9398:
	ldr r1, [sp, #0x18]
	cmp r7, r1
	blt _01FF9304
	add ip, sb, #0x10
	ldmia ip, {r2, r3}
	stmia sb, {r2, r3}
	add sl, sb, #0x18
	add r1, sb, #8
	ldmia sl, {r2, r3}
	stmia r1, {r2, r3}
	add r7, sb, #0x20
	add r5, sb, #0x28
	add r4, sb, #0x30
	add r1, sb, #0x38
	mov lr, #0
	add r8, r8, #0x40
	add r6, r6, #1
	ldmia r7, {r2, r3}
	stmia ip, {r2, r3}
	ldmia r5, {r2, r3}
	stmia sl, {r2, r3}
	ldmia r4, {r2, r3}
	stmia r7, {r2, r3}
	ldmia r1, {r2, r3}
	stmia r5, {r2, r3}
	str lr, [sb, #0x30]
	str lr, [sb, #0x34]
	str lr, [sb, #0x38]
	str lr, [sb, #0x3c]
_01FF940C:
	ldr r1, [sp, #8]
	ldrb r1, [r1, #6]
	cmp r6, r1
	blt _01FF92EC
	bl UpdateWindow
_01FF9420:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9428: .word WINDOW_LIST
_01FF942C: .word _022A88FC
_01FF9430: .word _022A88F0
	arm_func_end sub_01FF929C

	arm_func_start GetKeyN2MSwitch
GetKeyN2MSwitch: ; 0x01FF9434
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _01FF9464 ; =_020A2CF8
	add r3, sp, #0
#ifdef EUROPE
	ldr ip, [r2, #8]
	ldr r2, [r2, #0xc]
#else
	ldr ip, [r2]
	ldr r2, [r2, #4]
#endif
	str ip, [sp]
	str r2, [sp, #4]
	ldr r1, [r3, r1, lsl #2]
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF9464: .word _020A2CF8
	arm_func_end GetKeyN2MSwitch

	arm_func_start GetKeyN2M
GetKeyN2M: ; 0x01FF9468
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	movge r0, r0, asr #0x10
	cmp r0, #0
	blt _01FF948C
	ldr r1, _01FF94CC ; =0x0000022B
	cmp r0, r1
	blt _01FF9494
_01FF948C:
	mov r0, #0
	bx lr
_01FF9494:
	ldr r2, _01FF94D0 ; =MONSTER_DATA_TABLE_PTR
	mov r3, r0, lsl #0x1f
	ldr r2, [r2, #0x14]
	mov r0, r0, asr #1
	ldr ip, [r2, r0, lsl #2]
	mov r2, r3, lsr #0x1b
	add r0, r1, #0x1d4
	and r2, r0, ip, asr r2
	sub r0, r1, #1
	cmp r2, r0
	movgt r0, #0
	movle r0, r2, lsl #0x10
	movle r0, r0, asr #0x10
	bx lr
	.align 2, 0
_01FF94CC: .word 0x0000022B
_01FF94D0: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetKeyN2M

	arm_func_start GetKeyN2MBaseForm
GetKeyN2MBaseForm: ; 0x01FF94D4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	blt _01FF94EC
	ldr r1, _01FF9508 ; =0x0000022B
	cmp r0, r1
	blt _01FF94F4
_01FF94EC:
	mov r0, #0
	ldmia sp!, {r3, pc}
_01FF94F4:
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetKeyN2M
	bl GetAllBaseForms
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF9508: .word 0x0000022B
	arm_func_end GetKeyN2MBaseForm

	arm_func_start GetKeyM2NSwitch
GetKeyM2NSwitch: ; 0x01FF950C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _01FF953C ; =_020A2CF8
	add r3, sp, #0
#ifdef EUROPE
	ldr ip, [r2]
	ldr r2, [r2, #4]
#else
	ldr ip, [r2, #8]
	ldr r2, [r2, #0xc]
#endif
	str ip, [sp]
	str r2, [sp, #4]
	ldr r1, [r3, r1, lsl #2]
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF953C: .word _020A2CF8
	arm_func_end GetKeyM2NSwitch

	arm_func_start GetKeyM2N
GetKeyM2N: ; 0x01FF9540
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	movge r0, r0, asr #0x10
	cmp r0, #0
	blt _01FF9564
	ldr r1, _01FF95A0 ; =0x00000483
	cmp r0, r1
	blt _01FF9568
_01FF9564:
	mov r0, #0
_01FF9568:
	ldr r1, _01FF95A4 ; =MONSTER_DATA_TABLE_PTR
	mov r2, r0, lsl #0x1f
	ldr r3, [r1, #0x1c]
	mov r1, r0, asr #1
	ldr r3, [r3, r1, lsl #2]
	ldr r0, _01FF95A8 ; =0x000003FF
	mov r1, r2, lsr #0x1b
	and r1, r0, r3, asr r1
	sub r0, r0, #0x1d4
	cmp r1, r0
	movge r0, #0
	movlt r0, r1, lsl #0x10
	movlt r0, r0, asr #0x10
	bx lr
	.align 2, 0
_01FF95A0: .word 0x00000483
_01FF95A4: .word MONSTER_DATA_TABLE_PTR
_01FF95A8: .word 0x000003FF
	arm_func_end GetKeyM2N

	arm_func_start GetKeyM2NBaseForm
GetKeyM2NBaseForm: ; 0x01FF95AC
	stmdb sp!, {r3, lr}
	cmp r0, #0x258
	subge r0, r0, #0x258
	movge r0, r0, lsl #0x10
	movge r0, r0, asr #0x10
	cmp r0, #0
	blt _01FF95D4
	ldr r1, _01FF95E4 ; =0x00000483
	cmp r0, r1
	blt _01FF95D8
_01FF95D4:
	mov r0, #0
_01FF95D8:
	bl GetAllBaseForms
	bl GetKeyM2N
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF95E4: .word 0x00000483
	arm_func_end GetKeyM2NBaseForm

	arm_func_start HardwareInterrupt
HardwareInterrupt: ; 0x01FF95E8
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	beq _01FF9604
	b _01FF9608
_01FF9604:
	ldmia sp!, {pc}
_01FF9608:
	ldmia ip, {r1, r2}
	ands r1, r1, r2
	beq _01FF9618
	b _01FF961C
_01FF9618:
	ldmia sp!, {pc}
_01FF961C:
	mov r3, #0x80000000
_01FF9620:
	clz r0, r1
	bics r1, r1, r3, lsr r0
	bne _01FF9620
	mov r1, r3, lsr r0
	str r1, [ip, #4]
	rsbs r0, r0, #0x1f
	ldr r1, _01FF9648 ; =OS_IRQTable
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _01FF964C ; =ReturnFromInterrupt
	bx r0
	.align 2, 0
_01FF9648: .word OS_IRQTable
_01FF964C: .word ReturnFromInterrupt
	arm_func_end HardwareInterrupt

	arm_func_start ReturnFromInterrupt
ReturnFromInterrupt: ; 0x01FF9650
	ldr ip, _01FF97BC ; =DTCM_BSS
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _01FF96A0
_01FF9668:
	str r2, [ip, #0x64]
	str r3, [ip, #0x78]
	str r3, [ip, #0x7c]
	ldr r0, [ip, #0x80]
	str r3, [ip, #0x80]
	mov ip, r0
	cmp ip, #0
	bne _01FF9668
	ldr ip, _01FF97BC ; =DTCM_BSS
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _01FF97C0 ; =_022B966C
	mov r1, #1
	strh r1, [ip]
_01FF96A0:
	ldr ip, _01FF97C0 ; =_022B966C
	ldrh r1, [ip]
	cmp r1, #0
	beq _01FF96B4
	b _01FF96B8
_01FF96B4:
	ldr pc, [sp], #4
_01FF96B8:
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_01FF96D0:
	cmp r1, #0
	bne _01FF96DC
	b _01FF96E0
_01FF96DC:
	ldrh r0, [r1, #0x64]
_01FF96E0:
	bne _01FF96E8
	b _01FF96EC
_01FF96E8:
	cmp r0, #1
_01FF96EC:
	bne _01FF96F4
	b _01FF96F8
_01FF96F4:
	ldr r1, [r1, #0x68]
_01FF96F8:
	bne _01FF96D0
	cmp r1, #0
	bne _01FF9710
_01FF9704:
	mov r3, #0x92
	msr cpsr_c, r3
	ldr pc, [sp], #4
_01FF9710:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _01FF9704
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _01FF9738
	stmdb sp!, {r0, r1, ip}
	mov lr, pc
	bx r3
_01FF9734:
	.byte 0x03, 0x10, 0xBD, 0xE8
_01FF9738:
	str r1, [ip, #4]
	mrs r2, spsr
	str r2, [r0, #0]!
	stmdb sp!, {r0, r1}
	add r0, r0, #0
	add r0, r0, #0x48
	ldr r1, _01FF97C4 ; =sub_02080EF0
	blx r1
	ldmia sp!, {r0, r1}
	ldmib sp!, {r2, r3}
	stmib r0!, {r2, r3}
	ldmib sp!, {r2, r3, ip, lr}
	stmib r0!, {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	stmib r0!, {lr}
	mov r3, #0xd3
	msr cpsr_c, r3
	stmib r0!, {sp}
	stmdb sp!, {r1}
	add r0, r1, #0
	add r0, r0, #0x48
	ldr r1, _01FF97C8 ; =sub_02080F30
	blx r1
	ldmia sp!, {r1}
	ldr sp, [r1, #0x44]
	mov r3, #0xd2
	msr cpsr_c, r3
	ldr r2, [r1, #0]!
	msr spsr_fc, r2
	ldr lr, [r1, #0x40]
	ldmib r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	stmda sp!, {r0, r1, r2, r3, ip, lr}
	ldmia sp!, {pc}
	.align 2, 0
_01FF97BC: .word DTCM_BSS
_01FF97C0: .word _022B966C
_01FF97C4: .word sub_02080EF0
_01FF97C8: .word sub_02080F30
	arm_func_end ReturnFromInterrupt

	arm_func_start sub_01FF97CC
sub_01FF97CC: ; 0x01FF97CC
	stmdb sp!, {r3, lr}
	ldr r0, _01FF97F8 ; =_022B99D0
_01FF97D4:
	ldrh r1, [r0]
	cmp r1, #0
	beq _01FF97D4
	ldr r0, _01FF97FC ; =0x04000208
	mov r1, #0
	strh r1, [r0]
	bl sub_01FF98E8
	bl sub_01FF9800
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF97F8: .word _022B99D0
_01FF97FC: .word 0x04000208
	arm_func_end sub_01FF97CC

	arm_func_start sub_01FF9800
sub_01FF9800: ; 0x01FF9800
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _01FF98AC ; =OS_IRQTable
	add r1, r1, #0x3fc0
	add r1, r1, #0x3c
	mov r0, #0
	str r0, [r1]
	ldr r1, _01FF98B0 ; =0x04000180
_01FF9820:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _01FF9820
	mov r0, #0x100
	strh r0, [r1]
	mov r0, #0
	ldr r3, _01FF98B4 ; =0x027FFD9C
	ldr r4, [r3]
	ldr r1, _01FF98B8 ; =0x027FFD80
	mov r2, #0x80
	bl sub_01FF98CC
	str r4, [r3]
	ldr r1, _01FF98BC ; =0x027FFF80
	mov r2, #0x18
	bl sub_01FF98CC
	ldr r1, _01FF98C0 ; =0x027FFF98
	strh r0, [r1]
	ldr r1, _01FF98C4 ; =0x027FFF9C
	mov r2, #0x64
	bl sub_01FF98CC
	ldr r1, _01FF98B0 ; =0x04000180
_01FF9878:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	beq _01FF9878
	mov r0, #0
	strh r0, [r1]
	ldr r3, _01FF98C8 ; =0x027FFE00
	ldr ip, [r3, #0x24]
	mov lr, ip
	ldr fp, _01FF98BC ; =0x027FFF80
	ldmia fp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl}
	mov fp, #0
	bx ip
	.align 2, 0
_01FF98AC: .word OS_IRQTable
_01FF98B0: .word 0x04000180
_01FF98B4: .word 0x027FFD9C
_01FF98B8: .word 0x027FFD80
_01FF98BC: .word 0x027FFF80
_01FF98C0: .word 0x027FFF98
_01FF98C4: .word 0x027FFF9C
_01FF98C8: .word 0x027FFE00
	arm_func_end sub_01FF9800

	arm_func_start sub_01FF98CC
sub_01FF98CC: ; 0x01FF98CC
	add ip, r1, r2
_01FF98D0:
	cmp r1, ip
	blt _01FF98DC
	b _01FF98E0
_01FF98DC:
	stmia r1!, {r0}
_01FF98E0:
	blt _01FF98D0
	bx lr
	arm_func_end sub_01FF98CC

	arm_func_start sub_01FF98E8
sub_01FF98E8: ; 0x01FF98E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FF9988 ; =0x027FFC2C
	ldr r4, [r1]
	cmp r4, #0x8000
	blo _01FF990C
	mov r0, r4
	add r1, r1, #0x1d4
	mov r2, #0x160
	bl sub_01FF9990
_01FF990C:
	ldr r0, _01FF998C ; =0x027FFE20
	ldr r5, [r0]
	ldr r6, [r0, #8]
	ldr r7, [r0, #0xc]
	ldr r8, [r0, #0x10]
	ldr sb, [r0, #0x18]
	ldr sl, [r0, #0x1c]
	bl EnableIrqFlag
	mov fp, r0
	bl sub_0207A244
	bl sub_0207A238
	mov r0, fp
	bl SetIrqFlag
	bl sub_0207A324
	bl sub_0207A300
	add r5, r5, r4
	cmp r5, #0x8000
	bhs _01FF9964
	rsb r0, r5, #0x8000
	add r6, r6, r0
	sub r7, r7, r0
	mov r5, #0x8000
_01FF9964:
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl sub_01FF9990
	mov r1, sb
	mov r2, sl
	add r0, r8, r4
	bl sub_01FF9990
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9988: .word 0x027FFC2C
_01FF998C: .word 0x027FFE20
	arm_func_end sub_01FF98E8

	arm_func_start sub_01FF9990
sub_01FF9990: ; 0x01FF9990
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _01FF9A54 ; =0x027FFE60
	ldr r3, _01FF9A58 ; =0x000001FF
	ldr r5, [r4]
	and r4, r0, r3
	bic r3, r5, #0x7000000
	ldr r5, _01FF9A5C ; =0x040001A4
	orr r3, r3, #0xa1000000
	rsb ip, r4, #0
_01FF99B4:
	ldr r4, [r5]
	tst r4, #0x80000000
	bne _01FF99B4
	ldr r7, _01FF9A60 ; =0x040001A1
	mov r4, #0x80
	strb r4, [r7]
	cmp ip, r2
	add r0, r0, ip
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r4, _01FF9A64 ; =0x04100010
	mov sb, r0, lsr #8
	mov r6, #0xb7
	mov r5, #0
_01FF99E8:
	strb r6, [r7, #7]
	mov lr, r0, lsr #0x18
	strb lr, [r7, #8]
	mov lr, r0, lsr #0x10
	strb lr, [r7, #9]
	strb sb, [r7, #0xa]
	strb r0, [r7, #0xb]
	strb r5, [r7, #0xc]
	strb r5, [r7, #0xd]
	strb r5, [r7, #0xe]
	str r3, [r7, #3]
_01FF9A14:
	ldr r8, [r7, #3]
	tst r8, #0x800000
	beq _01FF9A38
	cmp ip, #0
	ldr lr, [r4]
	blt _01FF9A34
	cmp ip, r2
	strlt lr, [r1, ip]
_01FF9A34:
	add ip, ip, #4
_01FF9A38:
	tst r8, #0x80000000
	bne _01FF9A14
	cmp ip, r2
	add sb, sb, #2
	add r0, r0, #0x200
	blt _01FF99E8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_01FF9A54: .word 0x027FFE60
_01FF9A58: .word 0x000001FF
_01FF9A5C: .word 0x040001A4
_01FF9A60: .word 0x040001A1
_01FF9A64: .word 0x04100010
	arm_func_end sub_01FF9990

	arm_func_start InitDmaTransfer_Standard
InitDmaTransfer_Standard: ; 0x01FF9A68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EnableIrqFlag
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r1, r1, #0x4000000
	str r5, [r1, #4]
	str r4, [r1, #8]
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end InitDmaTransfer_Standard

	arm_func_start sub_01FF9AA8
sub_01FF9AA8: ; 0x01FF9AA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl EnableIrqFlag
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r3, r1, #0x4000000
	str r5, [r3, #4]
	ldr r2, _01FF9B10 ; =0x040000B0
	str r4, [r3, #8]
	ldr r1, [r2]
	cmp r7, #0
	ldr r1, [r2]
	bne _01FF9B08
	mov r2, #0
	str r2, [r3]
	ldr r1, _01FF9B14 ; =0x81400001
	str r2, [r3, #4]
	str r1, [r3, #8]
_01FF9B08:
	bl SetIrqFlag
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF9B10: .word 0x040000B0
_01FF9B14: .word 0x81400001
	arm_func_end sub_01FF9AA8

	arm_func_start sub_01FF9B18
sub_01FF9B18: ; 0x01FF9B18
	mov ip, #0xc
	mul ip, r0, ip
	add r0, ip, #0xb0
	add ip, ip, #0x4000000
	str r1, [ip, #0xb0]
	add r0, r0, #0x4000000
	str r2, [r0, #4]
	str r3, [r0, #8]
	bx lr
	arm_func_end sub_01FF9B18

	arm_func_start sub_01FF9B3C
sub_01FF9B3C: ; 0x01FF9B3C
	stmdb sp!, {r3, lr}
	mov ip, #0xc
	mul lr, r0, ip
	add ip, lr, #0xb0
	add lr, lr, #0x4000000
	str r1, [lr, #0xb0]
	add ip, ip, #0x4000000
	str r2, [ip, #4]
	ldr r2, _01FF9B98 ; =0x040000B0
	str r3, [ip, #8]
	ldr r1, [r2]
	cmp r0, #0
	ldr r0, [r2]
	bne _01FF9B88
	mov r1, #0
	str r1, [ip]
	ldr r0, _01FF9B9C ; =0x81400001
	str r1, [ip, #4]
	str r0, [ip, #8]
_01FF9B88:
	ldr r1, _01FF9B98 ; =0x040000B0
	ldr r0, [r1]
	ldr r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF9B98: .word 0x040000B0
_01FF9B9C: .word 0x81400001
	arm_func_end sub_01FF9B3C

	arm_func_start sub_01FF9BA0
sub_01FF9BA0: ; 0x01FF9BA0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x10]
	ldrh lr, [r0, #0xa]
	cmp r1, #0
	ldr r2, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	beq _01FF9CFC
	mov ip, #0
_01FF9BC0:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r6, [r2], #4
	add r4, r1, r4, lsl #2
	add r5, r1, r5, lsl #2
	ldrb r4, [r4, #1]
	ldrb r5, [r5, #2]
	ldrb r6, [r1, r6, lsl #2]
	mul r4, lr, r4
	mul r5, lr, r5
	mul r6, lr, r6
	mov r4, r4, lsr #8
	mov r7, r6, lsr #8
	mov r5, r5, lsr #8
	and r6, r5, #0xff
	and r4, r4, #0xff
	and r5, r4, #0xf8
	and r7, r7, #0xff
	mov r4, ip, lsl #1
	add ip, ip, #1
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	cmp ip, #0xe0
	blt _01FF9BC0
	b _01FF9C64
_01FF9C34:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r7, [r2], #4
	and r4, r4, #0xf8
	and r6, r5, #0xf8
	mov r5, r4, lsl #2
	mov r4, ip, lsl #1
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	add ip, ip, #1
_01FF9C64:
	cmp ip, #0xf0
	blt _01FF9C34
	b _01FF9CD8
_01FF9C70:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r6, [r2], #4
	add r4, r1, r4, lsl #2
	add r5, r1, r5, lsl #2
	ldrb r4, [r4, #1]
	ldrb r5, [r5, #2]
	ldrb r6, [r1, r6, lsl #2]
	mul r4, lr, r4
	mul r5, lr, r5
	mul r6, lr, r6
	mov r4, r4, lsr #8
	mov r7, r6, lsr #8
	mov r5, r5, lsr #8
	and r6, r5, #0xff
	and r4, r4, #0xff
	and r5, r4, #0xf8
	and r7, r7, #0xff
	mov r4, ip, lsl #1
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	add ip, ip, #1
_01FF9CD8:
	ldr r4, [r0, #4]
	cmp ip, r4
	blt _01FF9C70
	ldr r1, _01FF9E10 ; =ov29_02353530
	mov r0, r3
	ldr r1, [r1]
	add r1, r1, #0x4c
	bl Rgb8ToRgb5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_01FF9CFC:
	mov r0, #0
_01FF9D00:
	ldrb r1, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r7, [r2], #4
	mul r4, r1, lr
	mul r6, r5, lr
	mov r1, r4, lsr #8
	mul r5, r7, lr
	mov r4, r6, lsr #8
	mov r6, r5, lsr #8
	and r5, r4, #0xff
	and r1, r1, #0xff
	and r4, r1, #0xf8
	and r6, r6, #0xff
	mov r1, r0, lsl #1
	add r0, r0, #1
	and r5, r5, #0xf8
	mov r4, r4, lsl #2
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	strh r4, [r3, r1]
	cmp r0, #0xe0
	blt _01FF9D00
	b _01FF9D90
_01FF9D60:
	ldrb r1, [r2, #1]
	ldrb r4, [r2, #2]
	ldrb r6, [r2], #4
	and r1, r1, #0xf8
	and r5, r4, #0xf8
	mov r4, r1, lsl #2
	mov r1, r0, lsl #1
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	strh r4, [r3, r1]
	add r0, r0, #1
_01FF9D90:
	cmp r0, #0xf0
	blt _01FF9D60
	b _01FF9DF0
_01FF9D9C:
	ldrb r1, [r2, #1]
	ldrb r4, [r2, #2]
	ldrb r6, [r2], #4
	mul ip, r1, lr
	mul r5, r4, lr
	mov r1, ip, lsr #8
	mov r4, r5, lsr #8
	mul r7, r6, lr
	and r1, r1, #0xff
	and ip, r1, #0xf8
	mov r5, r7, lsr #8
	and r4, r4, #0xff
	and r5, r5, #0xff
	mov r1, r0, lsl #1
	and r4, r4, #0xf8
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r4, ip, r4, lsl #7
	orr r4, r4, r5, asr #3
	strh r4, [r3, r1]
	add r0, r0, #1
_01FF9DF0:
	cmp r0, #0xf0
	blt _01FF9D9C
	ldr r1, _01FF9E10 ; =ov29_02353530
	mov r0, r3
	ldr r1, [r1]
	add r1, r1, #0x4c
	bl Rgb8ToRgb5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF9E10: .word ov29_02353530
	arm_func_end sub_01FF9BA0

	arm_func_start sub_01FF9E14
sub_01FF9E14: ; 0x01FF9E14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FF9F7C ; =ov29_02353530
	ldr r4, [r0, #0x10]
	ldr r1, [r1]
	cmp r4, #0
	add sb, r1, #0x51
	ldrh sl, [r0, #0xa]
	ldr r5, [r0, #0x18]
	ldr r6, [r0, #0x1c]
	mov r7, #0
	beq _01FF9EE8
	ldr r8, [r0, #4]
	mov fp, r7
	b _01FF9EDC
_01FF9E4C:
	ldrb r0, [sb, r7, asr #4]
	cmp r0, #0
	ldrneb r0, [r5]
	ldrneb r2, [r5, #1]
	ldrneb r3, [r5, #2]
	bne _01FF9EA8
	ldrb r1, [r5, #1]
	ldrb r0, [r5, #2]
	ldrb r2, [r5]
	add r1, r4, r1, lsl #2
	add r0, r4, r0, lsl #2
	ldrb r2, [r4, r2, lsl #2]
	ldrb r1, [r1, #1]
	ldrb r0, [r0, #2]
	mul r2, sl, r2
	mul r1, sl, r1
	mul r0, sl, r0
	mov r3, r2, lsr #8
	mov r2, r1, lsr #8
	mov r1, r0, lsr #8
	and r0, r3, #0xff
	and r2, r2, #0xff
	and r3, r1, #0xff
_01FF9EA8:
	and r1, r2, #0xf8
	and r2, r3, #0xf8
	mov r1, r1, lsl #2
	and r3, r0, #0xf8
	orr r0, r1, r2, lsl #7
	mov r1, fp
	orr r3, r0, r3, asr #3
	mov r2, r7, lsl #1
	and r0, r7, #0xff
	strh r3, [r6, r2]
	bl sub_0201BD50
	add r5, r5, #4
	add r7, r7, #1
_01FF9EDC:
	cmp r7, r8
	blt _01FF9E4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FF9EE8:
	ldr r4, [r0, #4]
	mov r8, r7
	b _01FF9F70
_01FF9EF4:
	ldrb r0, [sb, r7, asr #4]
	cmp r0, #0
	ldrneb r3, [r5]
	ldrneb r1, [r5, #1]
	ldrneb r2, [r5, #2]
	bne _01FF9F3C
	ldrb r2, [r5]
	ldrb r1, [r5, #1]
	ldrb r0, [r5, #2]
	mul r3, r2, sl
	mul r2, r1, sl
	mul r1, r0, sl
	mov r3, r3, lsr #8
	mov r2, r2, lsr #8
	mov r0, r1, lsr #8
	and r3, r3, #0xff
	and r1, r2, #0xff
	and r2, r0, #0xff
_01FF9F3C:
	and r0, r1, #0xf8
	and r1, r2, #0xf8
	mov r0, r0, lsl #2
	and r2, r3, #0xf8
	orr r0, r0, r1, lsl #7
	mov r1, r8
	orr r3, r0, r2, asr #3
	mov r2, r7, lsl #1
	and r0, r7, #0xff
	strh r3, [r6, r2]
	bl sub_0201BD50
	add r5, r5, #4
	add r7, r7, #1
_01FF9F70:
	cmp r7, r4
	blt _01FF9EF4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9F7C: .word ov29_02353530
	arm_func_end sub_01FF9E14

	arm_func_start sub_01FF9F80
sub_01FF9F80: ; 0x01FF9F80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FFA38C ; =ov29_02353530
	ldr r4, [r0, #0x10]
	ldr r1, [r1]
	cmp r4, #0
	add sb, r1, #0x51
	ldrh sl, [r0, #0xa]
	ldr r5, [r0, #0x18]
	ldr r6, [r0, #0x1c]
	beq _01FFA290
	mov r8, #0
_01FF9FAC:
	and r0, r8, #0xff
	add fp, sb, r8
	mov r7, #0
	str r0, [sp]
_01FF9FBC:
	ldrb r0, [fp, #0x10]
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	cmp r0, #0
	ldrneb r0, [r2, #1]
	ldrneb r3, [r5, r1, lsl #2]
	ldrneb r2, [r2, #2]
	bne _01FFA020
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	ldrb r0, [r0, #1]
	ldrb r3, [r4, r2, lsl #2]
	add r2, r4, ip, lsl #2
	ldrb r2, [r2, #2]
	mul r0, sl, r0
	mul r3, sl, r3
	mul r2, sl, r2
	mov r3, r3, lsr #8
	mov r0, r0, lsr #8
	mov r2, r2, lsr #8
	and r3, r3, #0xff
	and r0, r0, #0xff
	and r2, r2, #0xff
_01FFA020:
	and r0, r0, #0xf8
	and r2, r2, #0xf8
	mov r0, r0, lsl #2
	orr r2, r0, r2, lsl #7
	and r3, r3, #0xf8
	orr r3, r2, r3, asr #3
	mov r1, r1, lsl #1
	strh r3, [r6, r1]
	ldr r0, [sp]
	mov r2, #0
	and r1, r7, #0xff
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0x10
	blt _01FF9FBC
	mov r7, #0x10
	and fp, r8, #0xff
_01FFA064:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	add ip, r4, r3, lsl #2
	ldrb r3, [r0, #1]
	ldrb r0, [ip, #2]
	ldrb ip, [r4, r2, lsl #2]
	mul r2, sl, r3
	mul r3, sl, r0
	mul r0, sl, ip
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov r0, r0, lsr #8
	and r2, r2, #0xf8
	and r3, r3, #0xff
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	mov r0, fp
	mov r2, #0
	and r1, r7, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0x20
	blt _01FFA064
	mov r7, #0xc0
	and fp, r8, #0xff
_01FFA0F4:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	add ip, r4, r3, lsl #2
	ldrb r3, [r0, #1]
	ldrb r0, [ip, #2]
	ldrb ip, [r4, r2, lsl #2]
	mul r2, sl, r3
	mul r3, sl, r0
	mul r0, sl, ip
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov r0, r0, lsr #8
	and r2, r2, #0xf8
	and r3, r3, #0xff
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	mov r0, fp
	mov r2, #0
	and r1, r7, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0xf0
	blt _01FFA0F4
	mov r7, #0xf0
	mov r1, r7
	and r0, r8, #0xff
	mov r2, #0
	bl sub_0201BD80
_01FFA190:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb fp, [r5, r1, lsl #2]
	mul r2, sl, r0
	mul r3, sl, r3
	mul r0, sl, fp
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov fp, r0, lsr #8
	and r3, r3, #0xff
	and r0, r2, #0xf8
	and fp, fp, #0xff
	add r7, r7, #1
	and r2, r3, #0xf8
	mov r0, r0, lsl #2
	and r3, fp, #0xf8
	orr r0, r0, r2, lsl #7
	orr r2, r0, r3, asr #3
	mov r0, r1, lsl #1
	strh r2, [r6, r0]
	cmp r7, #0x100
	blt _01FFA190
	add r8, r8, #1
	cmp r8, #0x10
	blt _01FF9FAC
	mov r7, #0xb0
	mov r8, #0
_01FFA208:
	add r1, r5, r7, lsl #2
	ldrb r0, [r1, #1]
	ldrb r1, [r1, #2]
	ldrb r2, [r5, r7, lsl #2]
	add r0, r4, r0, lsl #2
	add r1, r4, r1, lsl #2
	ldrb r0, [r0, #1]
	ldrb r1, [r1, #2]
	ldrb r2, [r4, r2, lsl #2]
	mul r0, sl, r0
	mul r1, sl, r1
	mul r2, sl, r2
	mov r0, r0, lsr #8
	mov r1, r1, lsr #8
	and r0, r0, #0xff
	mov r2, r2, lsr #8
	and r1, r1, #0xff
	and r0, r0, #0xf8
	and r2, r2, #0xff
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	and r3, r2, #0xf8
	orr r1, r0, r1, lsl #7
	mov r0, r8
	mov r2, r8
	orr sb, r1, r3, asr #3
	mov r3, r7, lsl #1
	and r1, r7, #0xff
	strh sb, [r6, r3]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0xc0
	blt _01FFA208
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFA290:
	mov r7, #0
_01FFA294:
	add r0, sb, r7
	ldrb r0, [r0, #0x10]
	mov r8, #0
	and r4, r7, #0xff
	cmp r0, #0
	beq _01FFA304
	mov fp, r8
_01FFA2B0:
	add r1, r8, r7, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	and r3, r0, #0xf8
	and r0, ip, #0xf8
	mov ip, r3, lsl #2
	and r3, r2, #0xf8
	orr ip, ip, r0, lsl #7
	mov r0, r4
	mov r2, fp
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	and r1, r8, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r8, r8, #1
	cmp r8, #0xf0
	blt _01FFA2B0
	b _01FFA37C
_01FFA304:
	mov fp, r8
_01FFA308:
	add r1, r8, r7, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	mul r3, sl, r0
	mul r0, sl, ip
	mul ip, sl, r2
	mov r2, r3, lsr #8
	mov r3, r0, lsr #8
	and r2, r2, #0xff
	mov r0, ip, lsr #8
	and r3, r3, #0xff
	and r2, r2, #0xf8
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	mov r0, r4
	mov r2, fp
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	and r1, r8, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r8, r8, #1
	cmp r8, #0xf0
	blt _01FFA308
_01FFA37C:
	add r7, r7, #1
	cmp r7, #0x10
	blt _01FFA294
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FFA38C: .word ov29_02353530
	arm_func_end sub_01FF9F80
