	.include "asm/macros.inc"
	.include "main_0201E3AC.inc"

	.text

	arm_func_start sub_0201E3AC
sub_0201E3AC: ; 0x0201E3AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrsh r4, [sp, #0x20]
	mov r7, r3
	mov sl, r0
	add r6, r4, r7, lsl #8
	mov sb, r1
	mov r8, r2
	mov r5, #0
	mov r4, #1
	b _0201E3FC
_0201E3D4:
	ldr r1, [sl, #0x18]
	add r0, r5, r6
	add r0, r1, r0, lsl #1
	add r1, sb, r5, lsl #2
	bl Rgb8ToRgb5
	add r0, r5, #1
	ldr r1, [sl, #0x1c]
	mov r0, r0, lsl #0x10
	strb r4, [r7, r1]
	mov r5, r0, asr #0x10
_0201E3FC:
	cmp r5, r8
	blt _0201E3D4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0201E3AC

	arm_func_start sub_0201E408
sub_0201E408: ; 0x0201E408
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, r2
	ldrsh r2, [r1, #6]
	ldr r1, [r1]
	bl sub_0201E3AC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201E408

	arm_func_start sub_0201E424
sub_0201E424: ; 0x0201E424
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r6, r0
	mov r4, #1
	mov r8, #0x200
	mov r7, r5
	b _0201E480
_0201E444:
	ldr r0, [r6, #0x1c]
	ldrb r0, [r0, r5]
	cmp r0, #0
	beq _0201E47C
	str r4, [sp]
	ldr r1, [r6, #0x18]
	ldr r2, [r6, #0x14]
	ldr r0, [r6]
	mov r3, r8
	add r1, r1, r5, lsl #9
	add r2, r2, r5, lsl #9
	bl PlanCopyTextureToTextureVram
	ldr r0, [r6, #0x1c]
	strb r7, [r0, r5]
_0201E47C:
	add r5, r5, #1
_0201E480:
	ldr r0, [r6, #8]
	cmp r5, r0
	blt _0201E444
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0201E424

	arm_func_start GeomSetTexImageParam
GeomSetTexImageParam: ; 0x0201E494
	ldr ip, [sp, #0xc]
	mov r0, r0, lsl #0x1a
	orr r0, r0, ip, lsr #3
	orr r0, r0, r1, lsl #30
	orr r0, r0, r2, lsl #20
	ldr r1, [sp]
	orr r0, r0, r3, lsl #23
	ldr r2, [sp, #4]
	orr r0, r0, r1, lsl #16
	ldr r3, [sp, #8]
	orr r1, r0, r2, lsl #18
	ldr r0, _0201E4D0 ; =0x040004A8
	orr r1, r1, r3, lsl #29
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E4D0: .word 0x040004A8
	arm_func_end GeomSetTexImageParam

	arm_func_start GeomSetVertexCoord16
GeomSetVertexCoord16: ; 0x0201E4D4
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r1, lsl #0x10
	mov r1, r2, lsl #0x10
	ldr r2, _0201E500 ; =0x0400048C
	orr r0, r3, r0, lsr #16
	str r0, [r2]
	mov r0, r1, lsr #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0201E500: .word 0x0400048C
	arm_func_end GeomSetVertexCoord16

	arm_func_start InitRender3dData
InitRender3dData: ; 0x0201E504
	stmdb sp!, {r3, lr}
	ldr r0, _0201E540 ; =RENDER_3D
	ldr r0, [r0, #0x40]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x1a00
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201E540 ; =RENDER_3D
	mov r2, #0
	str r0, [r1, #0x40]
	strh r2, [r1]
	mov r0, #0x80
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E540: .word RENDER_3D
	arm_func_end InitRender3dData

	arm_func_start sub_0201E544
sub_0201E544: ; 0x0201E544
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
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
	ldr r0, _0201E5A4 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r2, _0201E5A8 ; =0x3F1F00C0
	ldr r1, _0201E5AC ; =0x040004A4
	ldr r0, _0201E5A4 ; =RENDER_3D
	str r2, [r1]
	mov r1, #0
	strh r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E5A4: .word RENDER_3D
_0201E5A8: .word 0x3F1F00C0
_0201E5AC: .word 0x040004A4
	arm_func_end sub_0201E544

	arm_func_start sub_0201E5B0
sub_0201E5B0: ; 0x0201E5B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	bl Render3dProcessQueue
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
	ldr r0, _0201E608 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r1, _0201E60C ; =0x3F1F00C0
	ldr r0, _0201E610 ; =0x040004A4
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E608: .word RENDER_3D
_0201E60C: .word 0x3F1F00C0
_0201E610: .word 0x040004A4
	arm_func_end sub_0201E5B0

	arm_func_start sub_0201E614
sub_0201E614: ; 0x0201E614
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0xbc
	bl MemZero
	bl InitRender3dData
	mov r0, r4
	bl sub_0201E634
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E614

	arm_func_start sub_0201E634
sub_0201E634: ; 0x0201E634
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r2, #0
	str r2, [r4, #0xa0]
	mov r0, #0x100000
	str r0, [r4, #0xa4]
	ldr r0, _0201E70C ; =0x007FFFFF
	str r2, [r4, #0xa8]
	mov r1, #0xc0000
	str r1, [r4, #0xac]
	mov r1, #0x1000
	str r1, [r4, #0xb0]
	str r0, [r4, #0xb4]
	str r2, [r4]
	str r2, [r4, #4]
	str r1, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	mov r0, r0, lsl #0xc
	str r0, [r4, #0x20]
	str r2, [r4, #0x24]
	str r1, [r4, #0x28]
	ldr r1, _0201E710 ; =0xBFFF0000
	ldr r0, _0201E714 ; =0x04000580
	str r2, [r4, #0x2c]
	str r1, [r0]
	ldr r0, [r4, #0xb0]
	mov r1, #0x400000
	str r0, [sp]
	ldr r2, [r4, #0xb4]
	mov r0, #1
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xa8]
	ldr r1, [r4, #0xac]
	ldr r2, [r4, #0xa0]
	ldr r3, [r4, #0xa4]
	bl G3i_OrthoW_
	ldr r1, _0201E718 ; =0x0400044C
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	add ip, r4, #0x30
	add r1, r4, #0x24
	add r2, r4, #0x18
	mov r3, #1
	str ip, [sp]
	bl G3i_LookAt_
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E70C: .word 0x007FFFFF
_0201E710: .word 0xBFFF0000
_0201E714: .word 0x04000580
_0201E718: .word 0x0400044C
	arm_func_end sub_0201E634

	arm_func_start GeomSwapBuffers
GeomSwapBuffers: ; 0x0201E71C
	ldr r0, _0201E72C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E72C: .word 0x04000540
	arm_func_end GeomSwapBuffers

	arm_func_start InitRender3dElement64
InitRender3dElement64: ; 0x0201E730
	stmdb sp!, {r4, lr}
	mov r1, #0x40
	mov r4, r0
	bl MemZero
	mov r0, #0xff
	strb r0, [r4, #0x2c]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2f]
	mov r0, #0x1000
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	mov r0, #0x40
	strh r0, [r4, #0x2a]
	mov r0, #0
	strb r0, [r4, #0x3e]
	ldmia sp!, {r4, pc}
	arm_func_end InitRender3dElement64

	arm_func_start sub_0201E774
sub_0201E774: ; 0x0201E774
	stmdb sp!, {r4, lr}
	ldrh ip, [r1, #0xc]
	mov r4, r0
	mov r0, r3
	strh ip, [r4, #0x14]
	ldrsh r3, [r1, #0x10]
	strh r3, [r4, #0x16]
	ldrsh r3, [r1, #0x12]
	strh r3, [r4, #0x18]
	ldrsh r3, [r1, #0x14]
	strh r3, [r4, #0x1a]
	ldrsh r3, [r1, #0x16]
	ldrsh r1, [sp, #8]
	strh r3, [r4, #0x1c]
	str r2, [r4, #0x20]
	bl GetPaletteBaseAddress__0201E858
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E774

	arm_func_start GetPaletteBaseAddress__0201E858
GetPaletteBaseAddress__0201E858: ; 0x0201E7BC
	ldr r2, _0201E7D4 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_0201E7D4: .word _020AFC70
	arm_func_end GetPaletteBaseAddress__0201E858

	arm_func_start sub_0201E7D8
sub_0201E7D8: ; 0x0201E7D8
	stmdb sp!, {r4, lr}
	ldr ip, [r1]
	mov r4, r0
	ldrh lr, [ip, #8]
	mov ip, r2, lsl #3
	ldrsh r0, [sp, #8]
	strh lr, [r4, #0x14]
	ldr lr, [r1, #4]
	ldrsh ip, [lr, ip]
	strh ip, [r4, #0x16]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #2]
	strh ip, [r4, #0x18]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #4]
	strh ip, [r4, #0x1a]
	ldr ip, [r1, #4]
	ldrsh r1, [sp, #0xc]
	add r2, ip, r2, lsl #3
	ldrsh r2, [r2, #6]
	strh r2, [r4, #0x1c]
	str r3, [r4, #0x20]
	bl GetPaletteBaseAddress__0201E858
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E7D8

	arm_func_start Render3d64Texture0x7
Render3d64Texture0x7: ; 0x0201E844
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl NewRender3dTexture
	ldrsh r1, [r4]
	mov r5, #0
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb r6, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r6, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
_0201E8F0:
	mov r1, #0x18
	mul r6, r5, r1
	mov r1, r6, lsl #0x10
	mov ip, r1, asr #0x10
	mov r1, #0x1f
	mov r3, #0x18
	and r7, r5, #1
	mov lr, #0
	mov r2, r1
	mov sb, r3
_0201E918:
	mul r8, lr, sb
	ldrsh sl, [r4]
	tst lr, #1
	add sl, sl, r8
	strh sl, [r0, #0x16]
	ldrsh sl, [r4, #2]
	add sl, sl, r6
	strh sl, [r0, #0x18]
	strh r8, [r0, #0xc]
	strh ip, [r0, #0xe]
	strh r3, [r0, #0x10]
	strh r3, [r0, #0x12]
	beq _0201E988
	cmp r7, #0
	streqh r2, [r0, #0x22]
	beq _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
	b _0201E9C0
_0201E988:
	cmp r7, #0
	strneh r1, [r0, #0x22]
	bne _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
_0201E9C0:
	add r8, lr, #1
	mov r8, r8, lsl #0x10
	mov lr, r8, asr #0x10
	cmp lr, #0xa
	blt _0201E918
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	cmp r5, #8
	blt _0201E8F0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64Texture0x7

	arm_func_start Render3d64WindowFrame
Render3d64WindowFrame: ; 0x0201E9EC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	add r5, sp, #0xc
	mov r6, sl
	mov r4, #4
_0201EA04:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0201EA04
	mov r0, #5
	strb r0, [sp, #0x48]
	ldrsh r1, [sl, #4]
	ldrsh r2, [sl, #6]
	cmp r1, #0x10
	addle r0, r1, r1, lsr #31
	movgt r3, #8
	movle r0, r0, lsl #0xf
	movle r3, r0, asr #0x10
	cmp r2, #0x10
	addle r0, r2, r2, lsr #31
	movgt r6, #8
	movle r0, r0, lsl #0xf
	movle r6, r0, asr #0x10
	ldrsh r0, [sl]
	str r0, [sp]
	ldrsh r8, [sl, #2]
	ldr r4, [sp]
	add r0, sp, #0xc
	add r4, r4, r3
	add r5, r8, r6
	mov r4, r4, lsl #0x10
	mov r7, r5, lsl #0x10
	mov r5, r4, asr #0x10
	mov r4, r7, asr #0x10
	ldr r7, [sp]
	add sb, r8, r2
	strh r7, [sp, #0xc]
	ldr r7, [sp]
	mov r2, sb, lsl #0x10
	add fp, r7, r1
	sub r1, fp, r3
	mov r3, r1, lsl #0x10
	sub r1, sb, r6
	mov r7, r1, lsl #0x10
	mov r1, fp, lsl #0x10
	mov r6, r3, asr #0x10
	strh r8, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh ip, [sl, #0x16]
	mov r1, r1, asr #0x10
	mov r3, #8
	strh ip, [sp, #0x22]
	ldrsh ip, [sl, #0x18]
	mov r7, r7, asr #0x10
	str r1, [sp, #8]
	strh ip, [sp, #0x24]
	strh r3, [sp, #0x26]
	strh r3, [sp, #0x28]
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r6, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	mov r1, #8
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh fp, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	mov r1, #8
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	strh r4, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r7, [sp, #0x12]
	strh r0, [sp, #0xc]
	ldrsh r0, [sl, #0x16]
	strh r0, [sp, #0x22]
	ldrsh r0, [sl, #0x18]
	add r0, r0, #8
	strh r0, [sp, #0x24]
	mov r1, #8
	add r0, sp, #0xc
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r4, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	strh r7, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #8
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	mov r1, #8
	strh r0, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh sb, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r6, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #8
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r7, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	ldr r0, [sp, #4]
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64WindowFrame

	arm_func_start EnqueueRender3d64Tiling
EnqueueRender3d64Tiling: ; 0x0201EC9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dTiling
	ldrsh r2, [r4]
	mov r1, #0
	strh r2, [r0, #0x16]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x18]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x1a]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x1c]
	ldrsh r2, [r4]
	strh r2, [r0, #0x1e]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x20]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x22]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x24]
_0201ECEC:
	ldrb r3, [r4, #0x2e]
	ldrb r2, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r2, #0xf8
	mov r2, ip, lsl #0x17
	mov ip, r3, lsl #2
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	and lr, lr, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, lr, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ECEC
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201ED74:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201ED74
	ldmia sp!, {r4, pc}
	arm_func_end EnqueueRender3d64Tiling

	arm_func_start Render3d64Tiling
Render3d64Tiling: ; 0x0201ED88
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl NewRender3dTiling
	mov r1, #0
_0201ED98:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #0x16]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #0x18]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ED98
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201EE3C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201EE3C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Tiling

	arm_func_start Render3d64Quadrilateral
Render3d64Quadrilateral: ; 0x0201EE50
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl NewRender3dQuadrilateral
	mov r1, #0
_0201EE60:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #4]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #6]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x1a]
	cmp r1, #4
	blt _0201EE60
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Quadrilateral

	arm_func_start Render3d64RectangleMulticolor
Render3d64RectangleMulticolor: ; 0x0201EEF0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dRectangle
	ldrh r1, [r4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	tst r1, #0xff
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	beq _0201F034
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldrb r2, [r4, #0x32]
	ldrb r1, [r4, #0x31]
	ldrb ip, [r4, #0x30]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x36]
	ldrb r1, [r4, #0x35]
	ldrb ip, [r4, #0x34]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1e]
	ldrb r2, [r4, #0x3a]
	ldrb r1, [r4, #0x39]
	ldrb r4, [r4, #0x38]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
_0201F034:
	ldrb r4, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64RectangleMulticolor

	arm_func_start Render3d64Rectangle
Render3d64Rectangle: ; 0x0201F05C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dRectangle
	ldrh r1, [r4]
	mov r2, #0
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r3, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r1, #0xf8
	mov r1, ip, lsl #0x17
	mov r3, r3, lsl #2
	and ip, lr, #0xf8
	orr r1, r3, r1, lsr #16
	orr r1, r1, ip, asr #3
	strh r1, [r0, #0x1a]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	strb r2, [r0, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Rectangle

	arm_func_start Render3d64Nothing
Render3d64Nothing: ; 0x0201F108
	bx lr
	arm_func_end Render3d64Nothing

	arm_func_start Render3d64Texture
Render3d64Texture: ; 0x0201F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NewRender3dTexture
	ldrsh r1, [r4]
	add ip, r4, #0x16
	add r3, r0, #0xc
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	mov r2, #4
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
_0201F144:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0201F144
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Texture

	arm_func_start Render3dElement64
Render3dElement64: ; 0x0201F1D4
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x3d]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldrb r1, [r0, #0x2f]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r0, #0x3c]
	ldr r1, _0201F204 ; =RENDER_3D_FUNCTIONS_64
	ldr r1, [r1, r2, lsl #2]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F204: .word RENDER_3D_FUNCTIONS_64
	arm_func_end Render3dElement64

	arm_func_start sub_0201F208
sub_0201F208: ; 0x0201F208
	stmdb sp!, {r3, lr}
	ldr r0, _0201F240 ; =0x00001544
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201F244 ; =_020AFCE4
	ldr r1, _0201F240 ; =0x00001544
	str r0, [r2]
	bl MemZero
	ldr r0, _0201F244 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F240: .word 0x00001544
_0201F244: .word _020AFCE4
	arm_func_end sub_0201F208

	arm_func_start sub_0201F248
sub_0201F248: ; 0x0201F248
	ldr r1, _0201F29C ; =_020AFCE4
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0x542]
	ldr r3, [r1]
	mov r1, #0x44
	b _0201F284
_0201F268:
	smlabb r0, r2, r1, r3
	ldrb r0, [r0, #0x40]
	cmp r0, #0
	bxeq lr
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_0201F284:
	cmp r2, #0x50
	blt _0201F268
	add r0, r3, #0x1000
	mov r1, #1
	strb r1, [r0, #0x542]
	bx lr
	.align 2, 0
_0201F29C: .word _020AFCE4
	arm_func_end sub_0201F248

	arm_func_start sub_0201F2A0
sub_0201F2A0: ; 0x0201F2A0
	ldr ip, _0201F2A8 ; =Render3dElement64
	bx ip
	.align 2, 0
_0201F2A8: .word Render3dElement64
	arm_func_end sub_0201F2A0

	arm_func_start sub_0201F2AC
sub_0201F2AC: ; 0x0201F2AC
	stmdb sp!, {r4, lr}
	ldr r2, _0201F2E0 ; =_020AFCE4
	mov r1, #0x44
	smulbb r4, r0, r1
	ldr r0, [r2]
	add r0, r0, r4
	bl InitRender3dElement64
	ldr r0, _0201F2E0 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	strb r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F2E0: .word _020AFCE4
	arm_func_end sub_0201F2AC

	arm_func_start sub_0201F2E4
sub_0201F2E4: ; 0x0201F2E4
	stmdb sp!, {r4, lr}
	mov r4, #0
_0201F2EC:
	mov r0, r4
	bl sub_0201F2AC
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	blt _0201F2EC
	ldr r0, _0201F320 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F320: .word _020AFCE4
	arm_func_end sub_0201F2E4

	arm_func_start sub_0201F324
sub_0201F324: ; 0x0201F324
	ldr r2, _0201F344 ; =_020AFCE4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r1, [r0, #0x40]
	cmp r1, #0
	moveq r0, #0
	bx lr
	.align 2, 0
_0201F344: .word _020AFCE4
	arm_func_end sub_0201F324

	arm_func_start sub_0201F348
sub_0201F348: ; 0x0201F348
	ldr r3, _0201F368 ; =_020AFCE4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldrb r0, [r2, #0x40]
	cmp r0, #0
	strneb r1, [r2, #0x41]
	bx lr
	.align 2, 0
_0201F368: .word _020AFCE4
	arm_func_end sub_0201F348

	arm_func_start sub_0201F36C
sub_0201F36C: ; 0x0201F36C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F460 ; =_020AFCE4
	mov ip, #0
	ldr lr, [r0]
	mov r5, ip
	add r0, lr, #0x1500
	ldrsh r4, [r0, #0x40]
	mov r2, #0x44
	b _0201F3F8
_0201F390:
	cmp r4, #0x50
	movge r4, r5
	smlabb r3, r4, r2, lr
	ldrb r0, [r3, #0x40]
	cmp r0, #0
	bne _0201F3E0
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #1
	strb r0, [r3, #0x40]
	ldr r0, [r1]
	add r2, r4, #1
	add r0, r0, #0x1500
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x1500
	ldrsh r1, [r0, #0x40]
	cmp r1, #0x50
	movge r1, #0
	strgeh r1, [r0, #0x40]
	b _0201F410
_0201F3E0:
	add r0, ip, #1
	add r1, r4, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov ip, r0, asr #0x10
	mov r4, r1, asr #0x10
_0201F3F8:
	cmp ip, #0x50
	blt _0201F390
	mov r1, #1
	add r0, lr, #0x1000
	strb r1, [r0, #0x542]
	sub r4, r1, #2
_0201F410:
	mvn r0, #0
	cmp r4, r0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #0x44
	smulbb r5, r4, r0
	ldr r0, [r1]
	add r0, r0, r5
	bl InitRender3dElement64
	ldr r1, _0201F460 ; =_020AFCE4
	mov r3, #1
	ldr r2, [r1]
	mov r0, r4
	add r2, r2, r5
	strb r3, [r2, #0x40]
	ldr r1, [r1]
	add r1, r1, r5
	strb r3, [r1, #0x41]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F460: .word _020AFCE4
	arm_func_end sub_0201F36C

	arm_func_start sub_0201F464
sub_0201F464: ; 0x0201F464
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F4B0 ; =_020AFCE4
	mov r4, #0
	ldr r5, [r0]
_0201F474:
	ldrb r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r0, [r5, #0x41]
	cmpne r0, #0
	beq _0201F490
	mov r0, r5
	bl Render3dElement64
_0201F490:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	add r5, r5, #0x44
	blt _0201F474
	bl sub_0201F248
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F4B0: .word _020AFCE4
	arm_func_end sub_0201F464

	arm_func_start HandleSir0Translation
HandleSir0Translation: ; 0x0201F4B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrb r2, [r4]
	mov r5, r0
	mov r0, #0
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x30
	bne _0201F500
	mov r1, #0x4f
	mov r0, r4
	strb r1, [r4, #3]
	bl ConvertPointersSir0
	mov r0, #1
	b _0201F520
_0201F500:
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x4f
	moveq r0, #2
_0201F520:
	cmp r0, #0
	ldrne r1, [r4, #4]
	strne r1, [r5]
	streq r4, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end HandleSir0Translation

	arm_func_start ConvertPointersSir0
ConvertPointersSir0: ; 0x0201F534
	stmdb sp!, {r4, r5}
	ldr r1, [r0, #8]
	mov r3, r0
	add r1, r1, r0
_0201F544:
	mov r2, #0
_0201F548:
	ldrb r4, [r1]
	add r1, r1, #1
	mov r2, r2, lsl #7
	and r5, r4, #0x7f
	orr r2, r2, r5
	and r5, r4, #0x80
	cmp r5, #0
	bne _0201F548
	cmp r2, #0
	beq _0201F584
	add r3, r3, r2
	ldr r2, [r3]
	add r2, r2, r0
	str r2, [r3]
	b _0201F544
_0201F584:
	ldmia sp!, {r4, r5}
	bx lr
	arm_func_end ConvertPointersSir0

	arm_func_start HandleSir0TranslationVeneer
HandleSir0TranslationVeneer: ; 0x0201F58C
	ldr ip, _0201F594 ; =HandleSir0Translation
	bx ip
	.align 2, 0
_0201F594: .word HandleSir0Translation
	arm_func_end HandleSir0TranslationVeneer

	arm_func_start FillPaletteInitInfo
FillPaletteInitInfo: ; 0x0201F598
	str r1, [r0]
	strh r2, [r0, #4]
	ldrsh r1, [sp]
	strh r3, [r0, #6]
	ldrb r2, [sp, #4]
	strh r1, [r0, #8]
	mov r1, #0
	strb r2, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	arm_func_end FillPaletteInitInfo

	arm_func_start DecompressAtNormalVeneer
DecompressAtNormalVeneer: ; 0x0201F5C0
	ldr ip, _0201F5C8 ; =DecompressAtNormal
	bx ip
	.align 2, 0
_0201F5C8: .word DecompressAtNormal
	arm_func_end DecompressAtNormalVeneer

	arm_func_start DecompressAtNormal
DecompressAtNormal: ; 0x0201F5CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldrb r5, [r2]
	mov ip, #0
	ldrb r4, [r2, #5]
	cmp r5, #0x50
	ldreqb r6, [r2, #1]
	ldrb r3, [r2, #6]
	mov lr, ip
	cmpeq r6, #0x4b
	ldreqb r6, [r2, #2]
	add r3, r4, r3, lsl #8
	mov r4, #8
	cmpeq r6, #0x44
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F644
	ldrb r7, [r2, #0x10]
	ldrb r6, [r2, #0x11]
	ldrb r8, [r2, #0x12]
	ldrb r5, [r2, #0x13]
	add r6, r7, r6, lsl #8
	add r6, r6, r8, lsl #16
	add r5, r6, r5, lsl #24
	cmp r1, #0
	cmpne r1, r5
	movne r0, ip
	bne _0201FA08
	mov r5, #0x14
	b _0201F6B4
_0201F644:
	cmp r5, #0x41
	ldreqb r6, [r2, #1]
	cmpeq r6, #0x54
	ldreqb r6, [r2, #2]
	cmpeq r6, #0x34
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F688
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r1, #0
	add r5, r6, r5, lsl #8
	cmpne r1, r5
	movne r0, #0
	bne _0201FA08
	mov r5, #0x12
	b _0201F6B4
_0201F688:
	cmp r5, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x33
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	moveq r5, #0x10
	beq _0201F6B4
	mov r0, #0
	b _0201FA08
_0201F6B4:
	ldrb r6, [r2, #4]
	cmp r6, #0x4e
	bne _0201F6E8
	mov r4, #0
	b _0201F6D8
_0201F6C8:
	add r1, r2, r4
	ldrb r1, [r1, #7]
	strb r1, [r0, r4]
	add r4, r4, #1
_0201F6D8:
	cmp r4, r3
	blt _0201F6C8
	mov r0, r4
	b _0201FA08
_0201F6E8:
	ldrb r6, [r2, #7]
	ldrb sb, [r2, #8]
	ldrb r8, [r2, #9]
	add r6, r6, #3
	str r6, [sp, #0x18]
	add r6, sb, #3
	str r6, [sp, #0x14]
	add r6, r8, #3
	ldrb r7, [r2, #0xa]
	str r6, [sp, #0x10]
	ldrb sl, [r2, #0xb]
	add r6, r7, #3
	str r6, [sp, #0xc]
	add r6, sl, #3
	ldrb r7, [r2, #0xf]
	ldrb fp, [r2, #0xc]
	str r6, [sp, #8]
	ldrb r8, [r2, #0xe]
	add r6, fp, #3
	str r6, [sp, #4]
	ldrb r6, [r2, #0xd]
	add fp, r8, #3
	add sl, r7, #3
	add r6, r6, #3
	str r6, [sp]
	b _0201F9FC
_0201F750:
	cmp r1, #0
	beq _0201F764
	cmp ip, r1
	movge r0, #0
	bge _0201FA08
_0201F764:
	cmp r4, #8
	ldreqb lr, [r2, r5]
	addeq r5, r5, #1
	moveq r4, #0
	tst lr, #0x80
	bne _0201F9E4
	ldrb r8, [r2, r5]
	ldr sb, [sp, #0x18]
	add r7, r2, r5
	and r6, r8, #0xf0
	mov r6, r6, asr #4
	add r6, r6, #3
	cmp r6, sb
	ldr sb, [sp, #0x14]
	moveq r6, #0x1f
	cmp r6, sb
	ldr sb, [sp, #0x10]
	moveq r6, #0x1e
	cmp r6, sb
	ldr sb, [sp, #0xc]
	moveq r6, #0x1d
	cmp r6, sb
	ldr sb, [sp, #8]
	moveq r6, #0x1c
	cmp r6, sb
	ldr sb, [sp, #4]
	moveq r6, #0x1b
	cmp r6, sb
	ldr sb, [sp]
	moveq r6, #0x1a
	cmp r6, sb
	moveq r6, #0x19
	cmp r6, fp
	moveq r6, #0x18
	cmp r6, sl
	moveq r6, #0x17
	sub sb, r6, #0x17
	and r8, r8, #0xf
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201F9A8
_0201F808: ; jump table
	b _0201F97C ; case 0
	b _0201F950 ; case 1
	b _0201F924 ; case 2
	b _0201F8FC ; case 3
	b _0201F8D0 ; case 4
	b _0201F8A4 ; case 5
	b _0201F878 ; case 6
	b _0201F850 ; case 7
	b _0201F82C ; case 8
_0201F82C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	and r6, r8, #0xf
	orr r6, r6, r6, lsl #4
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F850:
	add r5, r5, #1
	add r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F878:
	add r5, r5, #1
	add r6, r0, ip
	sub r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8A4:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	sub r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8D0:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	sub r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8FC:
	add r5, r5, #1
	sub r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F924:
	add r5, r5, #1
	add r6, r0, ip
	add r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F950:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	add r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F97C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	add r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F9A8:
	ldrb sb, [r7, #1]
	sub r7, ip, #0x1000
	add r5, r5, #2
	add r8, sb, r8, lsl #8
	add sb, r8, r7
	mov r8, #0
	b _0201F9D8
_0201F9C4:
	ldrb r7, [r0, sb]
	add sb, sb, #1
	add r8, r8, #1
	strb r7, [r0, ip]
	add ip, ip, #1
_0201F9D8:
	cmp r8, r6
	blt _0201F9C4
	b _0201F9F4
_0201F9E4:
	ldrb r6, [r2, r5]
	add r5, r5, #1
	strb r6, [r0, ip]
	add ip, ip, #1
_0201F9F4:
	add r4, r4, #1
	mov lr, lr, lsl #1
_0201F9FC:
	cmp r5, r3
	blt _0201F750
	mov r0, ip
_0201FA08:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtNormal

	arm_func_start DecompressAtHalf
DecompressAtHalf: ; 0x0201FA10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldrb r4, [r2]
	ldrb r6, [r2, #5]
	ldrb r5, [r2, #6]
	cmp r4, #0x50
	mov ip, #0
	add sl, r6, r5, lsl #8
	ldreqb r5, [r2, #1]
	str ip, [sp, #0x30]
	mov lr, #8
	cmpeq r5, #0x4b
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x44
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FA88
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	ldrb r7, [r2, #0x12]
	ldrb r4, [r2, #0x13]
	add r5, r6, r5, lsl #8
	add r5, r5, r7, lsl #16
	add r4, r5, r4, lsl #24
	cmp r1, #0
	cmpne r1, r4
	movne r0, ip
	bne _0201FF44
	mov r8, #0x14
	b _0201FB18
_0201FA88:
	cmp r4, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x34
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FAEC
	ldrb r4, [r2, #4]
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r4, #0x4e
	add r4, r6, r5, lsl #8
	bne _0201FAD4
	cmp r1, #0
	cmpne r1, sl
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FAD4:
	cmp r1, #0
	cmpne r1, r4
	movne r0, #0
	bne _0201FF44
	mov r8, #0x12
	b _0201FB18
_0201FAEC:
	cmp r4, #0x41
	ldreqb r4, [r2, #1]
	cmpeq r4, #0x54
	ldreqb r4, [r2, #2]
	cmpeq r4, #0x33
	ldreqb r4, [r2, #3]
	cmpeq r4, #0x50
	moveq r8, #0x10
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FB18:
	ldrb r4, [r2, #4]
	cmp r4, #0x4e
	bne _0201FB78
	mov r5, #0
	b _0201FB68
_0201FB2C:
	add r6, r2, r5
	ldrb r4, [r6, #7]
	add r1, r0, r5, lsl #1
	ands r4, r4, #0xf
	strb r4, [r0, r5, lsl #1]
	orrne r4, r4, r3
	strneb r4, [r1]
	ldrb r4, [r6, #7]
	add r5, r5, #1
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	strb r4, [r1, #1]
	ands r4, r4, #0xff
	orrne r4, r4, r3
	strneb r4, [r1, #1]
_0201FB68:
	cmp r5, sl
	blt _0201FB2C
	mov r0, r5
	b _0201FF44
_0201FB78:
	ldrb r4, [r2, #7]
	ldrb r7, [r2, #8]
	ldrb r6, [r2, #9]
	add r4, r4, #3
	str r4, [sp, #0x24]
	add r4, r7, #3
	str r4, [sp, #0x20]
	add r4, r6, #3
	ldrb r5, [r2, #0xa]
	str r4, [sp, #0x1c]
	ldrb sb, [r2, #0xb]
	add r4, r5, #3
	str r4, [sp, #0x18]
	add r4, sb, #3
	str r4, [sp, #0x14]
	ldrb r4, [r2, #0xc]
	ldrb r6, [r2, #0xd]
	ldrb r5, [r2, #0xe]
	add r4, r4, #3
	str r4, [sp, #0x10]
	add r4, r6, #3
	str r4, [sp, #0xc]
	add r4, r5, #3
	str r4, [sp, #8]
	ldrb r4, [r2, #0xf]
	mov r1, r1, lsl #1
	add r4, r4, #3
	str r4, [sp, #4]
	b _0201FF38
_0201FBEC:
	cmp r1, #0
	beq _0201FC00
	cmp ip, r1
	movge r0, #0
	bge _0201FF44
_0201FC00:
	cmp lr, #8
	ldreqb r4, [r2, r8]
	addeq r8, r8, #1
	moveq lr, #0
	streq r4, [sp, #0x30]
	ldr r4, [sp, #0x30]
	tst r4, #0x80
	bne _0201FEEC
	add r4, r2, r8
	str r4, [sp]
	ldrb r4, [r2, r8]
	ldr sb, [sp, #0x24]
	str r4, [sp, #0x28]
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x28]
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	ands fp, r5, #0xf
	add r6, r6, #1
	sub r7, r7, #1
	mov r5, fp
	add r4, r4, #3
	and r6, r6, #0xf
	orrne r5, fp, r3
	cmp r6, #0
	and r7, r7, #0xf
	orrne r6, r6, r3
	cmp r7, #0
	orrne r7, r7, r3
	cmp r4, sb
	ldr sb, [sp, #0x20]
	moveq r4, #0x1f
	cmp r4, sb
	ldr sb, [sp, #0x1c]
	moveq r4, #0x1e
	cmp r4, sb
	ldr sb, [sp, #0x18]
	moveq r4, #0x1d
	cmp r4, sb
	ldr sb, [sp, #0x14]
	moveq r4, #0x1c
	cmp r4, sb
	ldr sb, [sp, #0x10]
	moveq r4, #0x1b
	cmp r4, sb
	ldr sb, [sp, #0xc]
	moveq r4, #0x1a
	cmp r4, sb
	ldr sb, [sp, #8]
	moveq r4, #0x19
	cmp r4, sb
	ldr sb, [sp, #4]
	moveq r4, #0x18
	cmp r4, sb
	moveq r4, #0x17
	sub sb, r4, #0x17
	str sb, [sp, #0x2c]
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201FEAC
_0201FCF4: ; jump table
	b _0201FE80 ; case 0
	b _0201FE54 ; case 1
	b _0201FE28 ; case 2
	b _0201FDFC ; case 3
	b _0201FDC8 ; case 4
	b _0201FD9C ; case 5
	b _0201FD70 ; case 6
	b _0201FD44 ; case 7
	b _0201FD18 ; case 8
_0201FD18:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD44:
	and r4, r6, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FD70:
	strb r7, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD9C:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r7, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FDC8:
	orr r5, fp, r3
	add r8, r8, #1
	and r4, r5, #0xff
	sub r6, r5, #1
	strb r4, [r0, ip]
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FDFC:
	and r4, r7, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FE28:
	strb r6, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE54:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r6, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE80:
	and r4, r5, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FEAC:
	ldr r5, [sp]
	add r8, r8, #2
	ldrb r6, [r5, #1]
	sub r5, ip, #0x2000
	add r6, r6, fp, lsl #8
	add r7, r5, r6, lsl #1
	mov r6, #0
	b _0201FEE0
_0201FECC:
	ldrb r5, [r0, r7]
	add r7, r7, #1
	add r6, r6, #1
	strb r5, [r0, ip]
	add ip, ip, #1
_0201FEE0:
	cmp r6, r4, lsl #1
	blt _0201FECC
	b _0201FF28
_0201FEEC:
	ldrb r5, [r2, r8]
	add r4, r0, ip
	ands r5, r5, #0xf
	strb r5, [r0, ip]
	orrne r5, r5, r3
	strneb r5, [r4]
	ldrb r5, [r2, r8]
	add ip, ip, #2
	add r8, r8, #1
	and r5, r5, #0xf0
	mov r5, r5, asr #4
	strb r5, [r4, #1]
	ands r5, r5, #0xff
	orrne r5, r5, r3
	strneb r5, [r4, #1]
_0201FF28:
	ldr r4, [sp, #0x30]
	add lr, lr, #1
	mov r4, r4, lsl #1
	str r4, [sp, #0x30]
_0201FF38:
	cmp r8, sl
	blt _0201FBEC
	mov r0, ip
_0201FF44:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtHalf

	arm_func_start DecompressAtFromMemoryPointerVeneer
DecompressAtFromMemoryPointerVeneer: ; 0x0201FF4C
	ldr ip, _0201FF54 ; =DecompressAtFromMemoryPointer
	bx ip
	.align 2, 0
_0201FF54: .word DecompressAtFromMemoryPointer
	arm_func_end DecompressAtFromMemoryPointerVeneer

	arm_func_start DecompressAtFromMemoryPointer
DecompressAtFromMemoryPointer: ; 0x0201FF58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r5, r2
	ldrb r4, [r5, #5]
	ldrb r3, [r5, #6]
	ldr r2, _0202046C ; =_022A5038
	mov r7, #0
	str r0, [r2]
	str r0, [r2, #0xc]
	str r7, [r2, #4]
	str r7, [r2, #8]
	ldrb r0, [r5]
	mov r6, r1
	add r1, r4, r3, lsl #8
	cmp r0, #0x50
	str r1, [sp, #0x28]
	ldreqb r1, [r5, #1]
	str r7, [sp, #0x24]
	mov sl, #8
	cmpeq r1, #0x4b
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _0201FFF0
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	ldrb r2, [r5, #0x12]
	ldrb r3, [r5, #0x13]
	add r0, r1, r0, lsl #8
	add r0, r0, r2, lsl #16
	add r0, r0, r3, lsl #24
	cmp r6, #0
	cmpne r6, r0
	movne r0, r7
	bne _02020464
	mov r4, #0x14
	b _02020060
_0201FFF0:
	cmp r0, #0x41
	ldreqb r1, [r5, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _02020034
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	cmp r6, #0
	add r0, r1, r0, lsl #8
	cmpne r6, r0
	movne r0, #0
	bne _02020464
	mov r4, #0x12
	b _02020060
_02020034:
	cmp r0, #0x41
	ldreqb r0, [r5, #1]
	cmpeq r0, #0x54
	ldreqb r0, [r5, #2]
	cmpeq r0, #0x33
	ldreqb r0, [r5, #3]
	cmpeq r0, #0x50
	moveq r4, #0x10
	beq _02020060
	mov r0, #0
	b _02020464
_02020060:
	ldrb r0, [r5, #4]
	cmp r0, #0x4e
	bne _0202009C
	mov r4, #0
	b _02020084
_02020074:
	add r0, r5, r4
	ldrb r0, [r0, #7]
	bl WriteByteFromMemoryPointer
	add r4, r4, #1
_02020084:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _02020074
	bl sub_020204CC
	mov r0, r4
	b _02020464
_0202009C:
	ldrb r0, [r5, #7]
	ldrb fp, [r5, #8]
	ldrb sb, [r5, #9]
	add r0, r0, #3
	str r0, [sp, #0x20]
	add r0, fp, #3
	str r0, [sp, #0x1c]
	add r0, sb, #3
	ldrb r8, [r5, #0xa]
	str r0, [sp, #0x18]
	ldrb r3, [r5, #0xb]
	add r0, r8, #3
	str r0, [sp, #0x14]
	add r0, r3, #3
	ldrb r2, [r5, #0xc]
	str r0, [sp, #0x10]
	ldrb r1, [r5, #0xd]
	add r0, r2, #3
	str r0, [sp, #0xc]
	add r0, r1, #3
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	ldrb r1, [r5, #0xf]
	add r0, r0, #3
	str r0, [sp, #4]
	add r0, r1, #3
	str r0, [sp]
	b _02020450
_0202010C:
	cmp r6, #0
	beq _02020120
	cmp r7, r6
	movge r0, #0
	bge _02020464
_02020120:
	cmp sl, #8
	ldreqb r0, [r5, r4]
	addeq r4, r4, #1
	moveq sl, #0
	streq r0, [sp, #0x24]
	ldr r0, [sp, #0x24]
	tst r0, #0x80
	bne _02020430
	ldrb r2, [r5, r4]
	add r0, r5, r4
	and r1, r2, #0xf0
	mov r1, r1, asr #4
	add r8, r1, #3
	ldr r1, [sp, #0x20]
	and sb, r2, #0xf
	cmp r8, r1
	ldr r1, [sp, #0x1c]
	moveq r8, #0x1f
	cmp r8, r1
	ldr r1, [sp, #0x18]
	moveq r8, #0x1e
	cmp r8, r1
	ldr r1, [sp, #0x14]
	moveq r8, #0x1d
	cmp r8, r1
	ldr r1, [sp, #0x10]
	moveq r8, #0x1c
	cmp r8, r1
	ldr r1, [sp, #0xc]
	moveq r8, #0x1b
	cmp r8, r1
	ldr r1, [sp, #8]
	moveq r8, #0x1a
	cmp r8, r1
	ldr r1, [sp, #4]
	moveq r8, #0x19
	cmp r8, r1
	ldr r1, [sp]
	moveq r8, #0x18
	cmp r8, r1
	moveq r8, #0x17
	sub r1, r8, #0x17
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _02020398
_020201D4: ; jump table
	b _02020368 ; case 0
	b _02020338 ; case 1
	b _02020308 ; case 2
	b _020202DC ; case 3
	b _020202AC ; case 4
	b _0202027C ; case 5
	b _0202024C ; case 6
	b _02020220 ; case 7
	b _020201F8 ; case 8
_020201F8:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020220:
	add r4, r4, #1
	add r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202024C:
	add r4, r4, #1
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202027C:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	sub r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202AC:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202DC:
	add r4, r4, #1
	sub r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020308:
	add r4, r4, #1
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020338:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020368:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020398:
	ldrb r1, [r0, #1]
	sub r0, r7, #0x1000
	add r4, r4, #2
	add r1, r1, sb, lsl #8
	add sb, r1, r0
	mov fp, #0
	b _02020424
_020203B4:
	ldr r0, _0202046C ; =_022A5038
	ldr r1, [r0, #0xc]
	mov r0, sb, asr #1
	add r0, sb, r0, lsr #30
	mov r0, r0, asr #2
	ldr r1, [r1, r0, lsl #2]
	and r0, sb, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020203EC
_020203DC: ; jump table
	b _020203EC ; case 0
	b _020203F4 ; case 1
	b _02020400 ; case 2
	b _0202040C ; case 3
_020203EC:
	and r0, r1, #0xff
	b _02020414
_020203F4:
	mov r0, r1, lsr #8
	and r0, r0, #0xff
	b _02020414
_02020400:
	mov r0, r1, lsr #0x10
	and r0, r0, #0xff
	b _02020414
_0202040C:
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
_02020414:
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add sb, sb, #1
	add fp, fp, #1
_02020424:
	cmp fp, r8
	blt _020203B4
	b _02020440
_02020430:
	ldrb r0, [r5, r4]
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add r4, r4, #1
_02020440:
	ldr r0, [sp, #0x24]
	add sl, sl, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x24]
_02020450:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _0202010C
	bl sub_020204CC
	mov r0, r7
_02020464:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202046C: .word _022A5038
	arm_func_end DecompressAtFromMemoryPointer

	arm_func_start WriteByteFromMemoryPointer
WriteByteFromMemoryPointer: ; 0x02020470
	ldr r1, _020204C4 ; =_022A5038
	ldr r2, _020204C8 ; =_020997A4
	ldr r3, [r1, #8]
	ldr ip, [r1, #4]
	ldr r2, [r2, r3, lsl #2]
	orr r2, ip, r0, lsl r2
	str r2, [r1, #4]
	ldr r0, [r1]
	str r2, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	cmp r0, #4
	bxne lr
	ldr r2, [r1]
	mov r0, #0
	add r2, r2, #4
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020204C4: .word _022A5038
_020204C8: .word _020997A4
	arm_func_end WriteByteFromMemoryPointer

	arm_func_start sub_020204CC
sub_020204CC: ; 0x020204CC
	ldr r0, _020204E8 ; =_022A5038
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r1, [r0, #4]
	ldrne r0, [r0]
	strne r1, [r0]
	bx lr
	.align 2, 0
_020204E8: .word _022A5038
	arm_func_end sub_020204CC

	arm_func_start GetAtSize
GetAtSize: ; 0x020204EC
	ldrb r2, [r0]
	cmp r2, #0x50
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x4b
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	bne _02020530
	ldrb r2, [r0, #0x10]
	ldrb r1, [r0, #0x11]
	ldrb r3, [r0, #0x12]
	ldrb ip, [r0, #0x13]
	add r0, r2, r1, lsl #8
	add r0, r0, r3, lsl #16
	add r0, r0, ip, lsl #24
	bx lr
_02020530:
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	ldreqb r1, [r0, #0x10]
	ldreqb r0, [r0, #0x11]
	addeq r0, r1, r0, lsl #8
	bxeq lr
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r0, [r0, #2]
	cmpeq r0, #0x33
	moveq r0, #0
	movne r0, #0
	bx lr
	arm_func_end GetAtSize

	arm_func_start sub_0202057C
sub_0202057C: ; 0x0202057C
	stmdb sp!, {lr}
	sub sp, sp, #0x54
	add r0, sp, #0
	bl GetDsFirmwareUserSettingsVeneer
	ldrsb r0, [sp]
	bl sub_020205C0
#ifdef EUROPE
	bl sub_0202059C
#endif
	add sp, sp, #0x54
	ldmia sp!, {pc}
	arm_func_end sub_0202057C

	arm_func_start sub_0202059C
sub_0202059C: ; 0x0202059C
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	ldr r0, _02020684 ; =_02099C04_EU
	ldrsb r1, [r1]
	mov r2, r4
	bl Debug_Print0
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	mov r0, r4
	strb r4, [r1]
	bl sub_020206C0_EU
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	strb r0, [r1, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02020680: .word LANGUAGE_INFO_DATA
_02020684: .word _02099C04_EU
#else
	bx lr
#endif
	arm_func_end sub_0202059C

	arm_func_start GetLanguageType
GetLanguageType: ; 0x020205A0
	ldr r0, _020205AC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0, #1]
	bx lr
	.align 2, 0
_020205AC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguageType

#ifdef EUROPE
	arm_func_start sub_02020698_EU
sub_02020698_EU: ; 0x02020698
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02020698_EU
#endif

	arm_func_start GetLanguage
GetLanguage: ; 0x020205B0
	ldr r0, _020205BC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0]
	bx lr
	.align 2, 0
_020205BC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguage

#ifdef EUROPE
	arm_func_start sub_020206C0_EU
sub_020206C0_EU: ; 0x020206C0
	cmp r0, #0
	blt _020206D8_EU
	cmp r0, #5
	ldrlt r1, _020206E0_EU ; =_02099BF0_EU
	ldrltsb r0, [r1, r0]
	bxlt lr
_020206D8_EU:
	mvn r0, #0
	bx lr
	.align 2, 0
_020206E0_EU: .word _02099BF0_EU
	arm_func_end sub_020206C0_EU
#endif

	arm_func_start sub_020205C0
sub_020205C0: ; 0x020205C0
	cmp r0, #0
	blt _020205D8
	cmp r0, #9
	ldrlt r1, _020205E0 ; =_020997B4
	ldrltsb r0, [r1, r0]
	bxlt lr
_020205D8:
	mvn r0, #0
	bx lr
	.align 2, 0
_020205E0: .word _020997B4
	arm_func_end sub_020205C0

	arm_func_start sub_020205E4
sub_020205E4: ; 0x020205E4
	stmdb sp!, {r3, lr}
	bl sub_0202057C
	bl sub_020257FC
	bl sub_02023610
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205E4

	arm_func_start sub_020205F8
sub_020205F8: ; 0x020205F8
	stmdb sp!, {r3, lr}
	bl sub_0200B768
	bl LoadStringFile
#ifndef JAPAN
	bl sub_0202088C
#endif
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205F8

	arm_func_start sub_0202060C
sub_0202060C: ; 0x0202060C
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0x61
	blo _0202062C
	cmp r0, #0x66
	subls r0, r0, #0x57
	bxls lr
_0202062C:
	cmp r0, #0x41
	blo _02020640
	cmp r0, #0x46
	subls r0, r0, #0x37
	bxls lr
_02020640:
	cmp r0, #0x30
	blo _02020654
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
_02020654:
	mov r0, #0
	bx lr
	arm_func_end sub_0202060C

	arm_func_start sub_0202065C
sub_0202065C: ; 0x0202065C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r6, [r4]
	ldrb r0, [r6]
	cmp r0, #0x7e
	bne _020206C8
	ldrb r0, [r6, #1]
	bl sub_0202060C
	movs r5, r0
	addmi r0, r6, #1
	strmi r0, [r4]
	movmi r0, #0
	ldmmiia sp!, {r4, r5, r6, pc}
	ldrb r0, [r6, #2]
	bl sub_0202060C
	cmp r0, #0
	addlt r1, r6, #2
	movlt r0, r5, lsl #0x10
	strlt r1, [r4]
	movlt r0, r0, lsr #0x10
	ldmltia sp!, {r4, r5, r6, pc}
	add r0, r0, r5, lsl #4
	add r1, r6, #3
	mov r0, r0, lsl #0x10
	str r1, [r4]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, pc}
_020206C8:
	cmp r0, #0x81
	blo _020206D8
	cmp r0, #0x84
	bls _020206E0
_020206D8:
	cmp r0, #0x87
	bne _020206F0
_020206E0:
	ldrb r1, [r6, #1]!
	orr r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_020206F0:
	add r1, r6, #1
	str r1, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0202065C

	arm_func_start sub_020206FC
sub_020206FC: ; 0x020206FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	ldr r5, [sb]
	mov sl, r0
	ldrb r0, [r5]
	mov r8, r2
	ldr r4, [sl]
	cmp r0, #0x7e
	bne _020207F0
	ldrb r0, [r5, #1]
	mov r6, #0
	bl sub_0202060C
	movs r7, r0
	bpl _02020754
	ldrb r2, [r5]
	add r1, r4, #1
	add r0, r5, #1
	strb r2, [r4]
	str r1, [sl]
	str r0, [sb]
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020754:
	add r0, r4, #1
	cmp r0, r8
	ldrb r0, [r5, #2]
	moveq r6, #1
	bl sub_0202060C
	cmp r0, #0
	bge _020207A4
	cmp r6, #0
	bne _02020790
	ldrb r1, [r5]
	add r0, r4, #2
	strb r1, [r4]
	ldrb r1, [r5, #1]
	strb r1, [r4, #1]
	str r0, [sl]
_02020790:
	add r1, r5, #2
	mov r0, r7, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207A4:
	add r1, r4, #2
	cmp r1, r8
	moveq r6, #1
	cmp r6, #0
	bne _020207D8
	ldrb r2, [r5]
	add r1, r4, #3
	strb r2, [r4]
	ldrb r2, [r5, #1]
	strb r2, [r4, #1]
	ldrb r2, [r5, #2]
	strb r2, [r4, #2]
	str r1, [sl]
_020207D8:
	add r0, r0, r7, lsl #4
	add r1, r5, #3
	mov r0, r0, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207F0:
	cmp r0, #0x81
	blo _02020800
	cmp r0, #0x84
	bls _02020808
_02020800:
	cmp r0, #0x87
	bne _02020850
_02020808:
	ldrb r2, [r5, #1]
	add r1, r4, #1
	cmp r1, r8
	orr r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	addeq r1, r5, #2
	mov r0, r0, lsr #0x10
	streq r1, [sb]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r3, [r5]
	add r2, r5, #2
	add r1, r4, #2
	strb r3, [r4]
	ldrb r3, [r5, #1]
	strb r3, [r4, #1]
	str r2, [sb]
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020850:
	strb r0, [r4]
	add r1, r5, #1
	str r1, [sb]
	add r1, r4, #1
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020206FC

	arm_func_start sub_02020868
sub_02020868: ; 0x02020868
	b _02020870
_0202086C:
	add r0, r0, #1
_02020870:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0202086C
	bx lr
	arm_func_end sub_02020868

	arm_func_start sub_02020880
sub_02020880: ; 0x02020880
	ldr ip, _02020888 ; =strstr
	bx ip
	.align 2, 0
_02020888: .word strstr
	arm_func_end sub_02020880

#ifndef JAPAN
	arm_func_start sub_0202088C
sub_0202088C: ; 0x0202088C
#ifdef EUROPE
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _020209E0 ; =_020B05B0_EU
	mov r2, r0, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _020209E4 ; =_020B05AC_EU
	cmp r0, #2
	strh r2, [r1]
	strh r2, [r1, #2]
	moveq r0, #0x2e
	streqh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020209E0: .word _020B05B0_EU
_020209E4: .word _020B05AC_EU
#else
	bx lr
#endif
	arm_func_end sub_0202088C
#endif

	arm_func_start sub_02020890
sub_02020890: ; 0x02020890
	cmp r1, #0
	beq _020208C0
	ldr ip, [r0]
_0202089C:
	cmp ip, r2
	moveq r0, #0
	streqb r0, [r2, #-1]
	bxeq lr
	ldrb r3, [r1], #1
	cmp r3, #0
	strneb r3, [ip], #1
	bne _0202089C
	str ip, [r0]
_020208C0:
	mov r0, #1
	bx lr
	arm_func_end sub_02020890

	arm_func_start StrcmpTag
StrcmpTag: ; 0x020208C8
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _020208F0
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_020208F0:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq StrcmpTag
	mov r0, #0
	bx lr
	arm_func_end StrcmpTag

	arm_func_start AtoiTag
AtoiTag: ; 0x0202090C
	mov r3, #0
	mov r1, #0xa
_02020914:
	ldrb r2, [r0], #1
	cmp r2, #0
	cmpne r2, #0x3a
	cmpne r2, #0x5d
	moveq r0, r3
	bxeq lr
	cmp r2, #0x30
	blo _02020914
	cmp r2, #0x39
	mlals r2, r3, r1, r2
	subls r3, r2, #0x30
	b _02020914
	arm_func_end AtoiTag

	arm_func_start sub_02020944
sub_02020944: ; 0x02020944
	bx lr
	arm_func_end sub_02020944

	arm_func_start sub_02020948
sub_02020948: ; 0x02020948
	stmdb sp!, {r4, lr}
	ldrb r4, [r0]
	cmp r4, #0x41
	blo _02020A24
	cmp r4, #0x5a
	bhi _02020A24
	add r0, r0, #1
	bl AtoiTag
	mov r0, r0, lsl #0x10
	cmp r4, #0x49
	mov r0, r0, asr #0x10
	bgt _0202099C
	cmp r4, #0x48
	blt _02020990
	beq _020209DC
	cmp r4, #0x49
	beq _02020A0C
	b _02020A1C
_02020990:
	cmp r4, #0x42
	ldmeqia sp!, {r4, pc}
	b _02020A1C
_0202099C:
	cmp r4, #0x52
	bgt _020209AC
	beq _020209EC
	b _02020A1C
_020209AC:
	cmp r4, #0x54
	bgt _02020A1C
	cmp r4, #0x53
	blt _02020A1C
	beq _020209CC
	cmp r4, #0x54
	beq _020209FC
	b _02020A1C
_020209CC:
	add r0, r0, #0x21
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209DC:
	add r0, r0, #0x29
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209EC:
	add r0, r0, #0x32
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209FC:
	add r0, r0, #0x3c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A0C:
	add r0, r0, #0x43
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A1C:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02020A24:
	cmp r4, #0x30
	blo _02020A44
	cmp r4, #0x39
	bhi _02020A44
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A44:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020948

	arm_func_start sub_02020A4C
sub_02020A4C: ; 0x02020A4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetLanguageType
	cmp r0, #3
	ldreq r4, _02020A94 ; =_0209995C
	ldrne r4, _02020A98 ; =_0209990C
	b _02020A80
_02020A68:
	mov r0, r5
	bl StrcmpTag
	cmp r0, #0
	ldrneh r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	add r4, r4, #8
_02020A80:
	ldr r1, [r4]
	cmp r1, #0
	bne _02020A68
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02020A94: .word _0209995C
_02020A98: .word _0209990C
	arm_func_end sub_02020A4C

	arm_func_start sub_02020A9C
sub_02020A9C: ; 0x02020A9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov lr, r4
	mov ip, #5
_02020AB4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02020AB4
	ldr r0, [r6]
	str r0, [lr]
	str r5, [r4, #0x54]
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _02020AE8
	ldr r0, [r4, #0x54]
	add r1, r4, #8
	blx r2
_02020AE8:
	mov r0, #0
	str r0, [r4, #0x58]
	mov r0, #0x78
	mov r1, #0x3c
	str r0, [r4, #0x6c]
	mov r0, r4
	str r1, [r4, #0x70]
	sub r1, r1, #0x3d
	str r1, [r4, #0x74]
	bl sub_02020B14
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02020A9C

	arm_func_start sub_02020B14
sub_02020B14: ; 0x02020B14
	mov r3, #0
	str r3, [r0, #0x5c]
	strb r3, [r0, #0x9d]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	mov r2, r3
_02020B34:
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #0x99]
	cmp r3, #4
	blt _02020B34
	bx lr
	arm_func_end sub_02020B14

	arm_func_start sub_02020B4C
sub_02020B4C: ; 0x02020B4C
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02020B4C

	arm_func_start sub_02020B60
sub_02020B60: ; 0x02020B60
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	bx lr
	arm_func_end sub_02020B60

	arm_func_start sub_02020B74
sub_02020B74: ; 0x02020B74
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	and r1, r1, #0xff
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B74

	arm_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	strb r1, [r2, #0x9c]
	ldrb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B94

	arm_func_start sub_02020BB8
sub_02020BB8: ; 0x02020BB8
	str r1, [r0, #0x6c]
	str r2, [r0, #0x70]
	bx lr
	arm_func_end sub_02020BB8

	arm_func_start sub_02020BC4
sub_02020BC4: ; 0x02020BC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	tst r1, #0x400
	movne r0, #1
	moveq r0, #0
	strh r1, [r4, #0x60]
	strb r0, [r4, #0x62]
	tst r1, #2
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C50
	tst r1, #4
	beq _02020C14
	mov r0, #3
	str r0, [r4, #0x5c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
	b _02020C50
_02020C14:
	ldr r0, [r4, #0x5c]
	cmp r0, #1
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C40
	ldr r1, [r4, #0x6c]
	mov r0, #0xc
	str r1, [r4, #0x7c]
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
_02020C40:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
_02020C50:
	str r2, [r4, #0x88]
	str r2, [r4, #0x84]
	mov r1, #0
	strh r1, [r4, #0x8c]
	str r1, [r4, #0xa4]
	strb r1, [r4, #0xa8]
	add r2, r4, #0xac
	mov r0, r1
_02020C70:
	add r1, r1, #1
	cmp r1, #4
	strb r0, [r2], #0x18
	blt _02020C70
	mov r1, #0x44
	strb r1, [r4, #0x98]
	str r0, [r4, #0xa0]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r0, #4
	moveq r0, #1
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x68]
	mov r0, #0
	str r0, [r4, #0x78]
	str r0, [r4, #0x7c]
	str r0, [r4, #0x80]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020BC4

	arm_func_start sub_02020CCC
sub_02020CCC: ; 0x02020CCC
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bne _02020CF4
	ldr r2, [r0, #0x6c]
	mov r1, #0xb
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
_02020CF4:
	cmp r1, #0x10
	bxeq lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xe
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020CCC

	arm_func_start sub_02020D18
sub_02020D18: ; 0x02020D18
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bxne lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xd
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020D18

	arm_func_start sub_02020D40
sub_02020D40: ; 0x02020D40
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	moveq r1, #2
	streq r1, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D40

	arm_func_start sub_02020D54
sub_02020D54: ; 0x02020D54
	ldr r0, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D54

	arm_func_start sub_02020D5C
sub_02020D5C: ; 0x02020D5C
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #2
	cmpne r0, #0x10
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02020D5C

	arm_func_start sub_02020D7C
sub_02020D7C: ; 0x02020D7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, #0
	mov ip, #0x18
	b _02020DB8
_02020D94:
	mla r0, r4, ip, r7
	mov r5, r6
	add lr, r0, #0xac
	ldmia lr!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia r5, {r0, r1}
	add r6, r6, #0x18
	add r4, r4, #1
_02020DB8:
	ldr r0, [r7, #0xa4]
	cmp r4, r0
	blt _02020D94
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02020D7C

	arm_func_start AnalyzeText
AnalyzeText: ; 0x02020DC8
#ifdef EUROPE
#define ANALYZE_TEXT_STACK_OFFSET 8
#define ANALYZE_TEXT_LOAD_OFFSET -0x10
#else
#define ANALYZE_TEXT_STACK_OFFSET 0
#define ANALYZE_TEXT_LOAD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	mov r4, r0
	ldr r0, [r4, #0x78]
	add r0, r0, #1
	str r0, [r4, #0x78]
	ldr r0, [r4, #0x5c]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _02021EC4
_02020DF0: ; jump table
	b _02021EC4 ; case 0
	b _02021EC4 ; case 1
	b _02021EC4 ; case 2
	b _02020E34 ; case 3
	b _02020EC4 ; case 4
	b _02020E4C ; case 5
	b _02020E4C ; case 6
	b _02021C90 ; case 7
	b _02021CE4 ; case 8
	b _02021CE4 ; case 9
	b _02021CE4 ; case 10
	b _02021CE4 ; case 11
	b _02021CE4 ; case 12
	b _02021CE4 ; case 13
	b _02021E90 ; case 14
	b _02021E9C ; case 15
	b _02021EC4 ; case 16
_02020E34:
	ldrh r0, [r4, #0x60]
	tst r0, #0x8000
	bne _02020E4C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x28]
	blx r1
_02020E4C:
	ldr r1, [r4, #0x5c]
	sub r0, r1, #5
	cmp r0, #1
	bhi _02020EBC
	cmp r1, #5
	bne _02020E74
	ldrh r0, [r4, #0x60]
	tst r0, #0x1000
	beq _02020E74
	bl sub_02017CEC
_02020E74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02020EA8
	tst r0, #0x800
	beq _02020EA8
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x18]
	blx r1
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x62]
	movne r0, #0
	strne r0, [r4, #0x7c]
_02020EA8:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	cmp r0, #0
	bgt _02021EC4
_02020EBC:
	mov r0, #4
	str r0, [r4, #0x5c]
_02020EC4:
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	mov r0, #0
	str r0, [r4, #0x7c]
	b _02021BFC
_02020EE4:
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	strh r0, [r4, #0x8c]
	cmp r0, #0x5b
	bne _02021AB4
	ldr r0, [r4, #0x88]
	ldrb r5, [r0]
	strh r5, [r4, #0x8c]
	cmp r5, #0x5b
	bne _02021A70
	ldr r0, [r4, #0x88]
	mov r6, #1
	add r0, r0, #1
	str r0, [r4, #0x88]
	str r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	add r0, sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET
_02020F24:
	ldr r1, [r4, #0x88]
	mov r2, r1
	add r1, r1, #1
	str r1, [r4, #0x88]
	ldrb r1, [r2]
	cmp r1, #0x5d
	beq _02020F54
	cmp r1, #0x3a
	ldreq r1, [r4, #0x88]
	streq r1, [r0, r6, lsl #2]
	addeq r6, r6, #1
	b _02020F24
_02020F54:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldrb r7, [r0]
	cmp r7, #0x41
	blo _02021A38
	cmp r7, #0x5a
	bhi _02021A38
	sub r1, r7, #0x42
	cmp r1, #0x15
	addls pc, pc, r1, lsl #2
	b _02021A10
_02020F7C: ; jump table
	b _02020FD4 ; case 0
	b _02021040 ; case 1
	b _02021A10 ; case 2
	b _02021A10 ; case 3
	b _0202134C ; case 4
#ifdef EUROPE
	b _0202155C ; case 5
#else
	b _02021A10 ; case 5
#endif
	b _020212F0 ; case 6
	b _02021A10 ; case 7
	b _02021A10 ; case 8
	b _02021404 ; case 9
	b _0202145C ; case 10
	b _02021694 ; case 11
	b _02021A10 ; case 12
	b _02021A10 ; case 13
	b _020217C4 ; case 14
	b _02021A10 ; case 15
	b _02021868 ; case 16
	b _020218D8 ; case 17
	b _02021A10 ; case 18
	b _02021A10 ; case 19
	b _02021A10 ; case 20
	b _020219AC ; case 21
_02020FD4:
	ldr r1, _02021ED0 ; =_020999AC
	bl StrcmpTag
	cmp r0, #0
	beq _02021018
	ldr r1, [r4, #8]
	ldr r3, [r4, #0x94]
	ldr r2, [r4, #0x14]
	ldr r0, [r4, #0x54]
	ldr r5, [r4, #0x48]
	add r2, r3, r2
	sub r3, r1, #4
	mov r1, #2
	blx r5
	ldr r0, [r4, #0x94]
	add r0, r0, #3
	str r0, [r4, #0x94]
	b _02021AA0
_02021018:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xe8]
	ldr r0, [r0, #0xe4]
	str r1, [sp, #0x6c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_02021040:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EDC ; =_020999C8
	bl StrcmpTag
	cmp r0, #0
	beq _02021104
	cmp r6, #2
	bne _02021098
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	ldrne r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	strneb r1, [r4, #0x99]
	ldrneb r0, [r0]
	strneb r0, [r4, #0x9c]
	bne _020210F0
	ldrb r0, [r4, #0x98]
	strb r0, [r4, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
	b _020210F0
_02021098:
	cmp r6, #3
	bne _020210F0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r2, [r4, #0x9c]
	cmp r2, #0
	cmpne r0, #3
	beq _020210D0
	add r1, r4, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	strb r2, [r1, #0x99]
	ldrb r0, [r0]
	strb r0, [r4, #0x9c]
	b _020210F0
_020210D0:
	ldrb r1, [r4, #0x98]
	add r0, r4, r0
	strb r1, [r0, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
_020210F0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_02021104:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE0 ; =_020999CC
	bl StrcmpTag
	cmp r0, #0
	beq _020211C4
	cmp r6, #1
	bne _02021158
	ldrb r0, [r4, #0x9c]
	cmp r0, #0
	ldrneb r1, [r4, #0x99]
	movne r0, #0
	strneb r1, [r4, #0x9c]
	strneb r0, [r4, #0x99]
	bne _020211B0
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreqb r0, [r4, #0x99]
	streqb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0x99]
	b _020211B0
_02021158:
	cmp r6, #2
	bne _020211B0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	cmpne r0, #3
	beq _02021190
	add r2, r4, r0
	ldrb r1, [r2, #0x99]
	mov r0, #0
	strb r1, [r4, #0x9c]
	strb r0, [r2, #0x99]
	b _020211B0
_02021190:
	ldrb r1, [r4, #0xa8]
	cmp r1, #0
	addeq r1, r4, r0
	ldreqb r1, [r1, #0x99]
	add r0, r4, r0
	streqb r1, [r4, #0x98]
	mov r1, #0
	strb r1, [r0, #0x99]
_020211B0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020211C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE4 ; =_020999D0
	bl StrcmpTag
	cmp r0, #0
	beq _02021200
	ldr r0, [r4, #0x88]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	bl sub_02022118
	ldr r1, [r4, #8]
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x90]
	b _02021AA0
_02021200:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE8 ; =_020999D4
	bl StrcmpTag
	cmp r0, #0
	beq _02021278
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r0, [r4, #0x94]
	str r1, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	strb r1, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021260
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021260:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021278:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EEC ; =_020999D8
	bl StrcmpTag
	cmp r0, #0
	beq _0202129C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x90]
	b _02021AA0
_0202129C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF0 ; =_020999E4
	bl StrcmpTag
	cmp r0, #0
	beq _020212C8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_020212C8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xf8 - ANALYZE_TEXT_STACK_OFFSET]
	ldr r0, [r0, #0xf4 - ANALYZE_TEXT_STACK_OFFSET]
	str r1, [sp, #0x64 + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_020212F0:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF4 ; =_020999F0
	bl StrcmpTag
	cmp r0, #0
	beq _02021324
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x94]
	add r0, r0, r0, lsr #31
	add r0, r1, r0, asr #1
	str r0, [r4, #0x94]
	b _02021AA0
_02021324:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x100]
	ldr r0, [r0, #0xfc]
	str r1, [sp, #0x5c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_0202134C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF8 ; =_020999F4
	bl StrcmpTag
	cmp r0, #0
	beq _020213A8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020A4C
	movs r3, r0
	beq _020213F4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _020213F4
_020213A8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EFC ; =_020999F8
	bl StrcmpTag
	cmp r0, #0
	beq _020213CC
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x58]
	b _020213F4
_020213CC:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x108]
	ldr r0, [r0, #0x104]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x58]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_0202155C:
	ldr r1, _020220C4 ; =_02099E64_EU
	bl StrcmpTag
	cmp r0, #0
	beq _02021598
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021598:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x78]
	ldr r1, [r0, #0x90]
	ldr r0, [r0, #0x8c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_02021404:
	ldr r0, [sp, #0x78]
#else
	ldr r1, [r0, #0xa0]
	ldr r0, [r0, #0x9c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_02021404:
#endif
	ldr r1, _02021F00 ; =_020999FC
	bl StrcmpTag
	cmp r0, #0
	beq _02021434
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	mov r0, #8
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	b _02021AA4
_02021434:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x98 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x94 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x48
	bl Debug_FatalError
_0202145C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F04 ; =_02099A00
	bl StrcmpTag
	cmp r0, #0
	beq _020214E8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0xa4]
	mov r1, #0x18
	mul r3, r2, r1
	add r2, r4, #0xac
	mov r1, #1
	strb r1, [r2, r3]
	add r3, r2, r3
	strh r0, [r3, #2]
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r2, [r4, #0x94]
	ldr r1, [r4, #0x90]
	sub r0, r0, #1
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	ldr r1, [r3, #0xc]
	stmib r3, {r1, r2}
	str r0, [r3, #0x14]
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	bne _02021AA0
	ldrb r0, [r4, #0x98]
	mov r1, #0x54
	strb r0, [r4, #0xa8]
	strb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020214E8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F08 ; =_02099A04
	bl StrcmpTag
	cmp r0, #0
	beq _02021588
	ldr r3, [r4, #0xa4]
	add r1, r4, #0xac
	mov r0, #0x18
	mla r2, r3, r0, r1
	add r0, r3, #1
	str r0, [r4, #0xa4]
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	str r1, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r2, #0xc]
	sub r0, r0, #1
	str r0, [r2, #0xc]
	ldr r0, [r4, #0x14]
	ldr r1, [r2, #0x10]
	sub r0, r0, #1
	add r0, r1, r0
	str r0, [r2, #0x10]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	beq _0202156C
	strb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0xa8]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
_0202156C:
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021588:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F0C ; =_02099A08
	bl StrcmpTag
	cmp r0, #0
	beq _0202166C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r6, r0
	ldr r0, _02021F10 ; =_020997E4
	mov r1, r5, lsl #1
	mov r7, #0
	ldrh sb, [r0, r1]
	mov r5, r7
	b _02021654
_020215CC:
	ldr r1, [r4, #0x38]
	mov r0, sb
	mov r8, r5
	blx r1
	ldr r2, [r4, #0x90]
	ldr r1, [r4, #8]
	add r0, r2, r0
	cmp r0, r1
	ble _02021608
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
_02021608:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021630
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r8, [r4, #0x40]
	mov r3, sb
	blx r8
	mov r8, r0
_02021630:
	ldr r0, [r4, #0x90]
	add r7, r7, #1
	add r0, r0, r8
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
_02021654:
	cmp r7, r6
	blt _020215CC
	ldr r0, [r4, #0x90]
	add r0, r0, #1
	str r0, [r4, #0x90]
	b _02021AA0
_0202166C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x90 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x8c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x40
	bl Debug_FatalError
_02021694:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F14 ; =_02099A10
	bl StrcmpTag
	cmp r0, #0
	beq _020216F8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020948
	mov r3, r0
	mvn r0, #0
	cmp r3, r0
	beq _02021AA0
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x44]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021AA0
_020216F8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F18 ; =_02099A14
	bl StrcmpTag
	cmp r0, #0
	beq _02021728
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0x90]
	mov r1, #6
	mla r1, r0, r1, r2
	str r1, [r4, #0x90]
	b _02021AA0
_02021728:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F1C ; =_02099A18
	bl StrcmpTag
	cmp r0, #0
	beq _02021764
#ifdef EUROPE
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1, #2]
#else
	ldr r0, [r4, #0x54]
#endif
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
#ifndef EUROPE
	mov r3, #0x2c
#endif
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021764:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F20 ; =_02099A1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202179C
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C50
	b _02021AA0
_0202179C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x88 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x84 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x38]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x38
	bl Debug_FatalError
_020217C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F24 ; =_02099A24
	bl StrcmpTag
	cmp r0, #0
	beq _02021840
	ldr r1, [r4, #0xc]
	mov r0, #0
	str r1, [r4, #0x94]
	str r0, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021828
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021828:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021840:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x80 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x7c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x34]
	str r0, [sp, #0x30]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x30
	bl Debug_FatalError
_02021868:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F28 ; =_02099A28
	bl StrcmpTag
	cmp r0, #0
	beq _020218B0
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020218B0:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x78 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x74 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x28
	bl Debug_FatalError
_020218D8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F2C ; =_02099A2C
	bl StrcmpTag
	cmp r0, #0
	beq _02021904
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_02021904:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F30 ; =_02099A30
	bl StrcmpTag
	cmp r0, #0
	movne r0, #0x400
	strne r0, [r4, #0x80]
	bne _02021AA0
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F34 ; =_02099A34
	bl StrcmpTag
	cmp r0, #0
	beq _0202194C
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	b _02021AA0
_0202194C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F38 ; =_02099A38
	bl StrcmpTag
	cmp r0, #0
	beq _02021984
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl PlaySeByIdVolumeWrapper
	b _02021AA0
_02021984:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x70 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x6c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x24]
	str r0, [sp, #0x20]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x20
	bl Debug_FatalError
_020219AC:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F3C ; =_02099A40
	bl StrcmpTag
	cmp r0, #0
	beq _020219E8
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x7c]
	mov r0, #6
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020219E8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x68 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x64 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x18
	bl Debug_FatalError
_02021A10:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x3c]
#else
	ldr r1, [r0, #0x60]
	ldr r0, [r0, #0x5c]
#endif
	str r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x10
	bl Debug_FatalError
_02021A38:
	cmp r7, #0x61
	blo _02021A48
	cmp r7, #0x7a
	bls _02021AA0
_02021A48:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x58 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x54 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #8
	bl Debug_FatalError
_02021A70:
	cmp r5, #0x5b
	beq _02021AA0
	ldr r1, _02021ED4 ; =_020997E4
	add r0, sp, #0
#ifdef EUROPE
	ldr r2, [r1, #0x98]
	ldr r1, [r1, #0x94]
#else
	ldr r2, [r1, #0x48]
	ldr r1, [r1, #0x44]
#endif
	str r2, [sp, #4]
	str r1, [sp]
	ldr r2, [r4, #0x88]
	ldr r3, [r4, #0x84]
	ldr r1, _02021F40 ; =_02099A44
	bl Debug_FatalError
_02021AA0:
	mov r0, #0
_02021AA4:
	cmp r0, #0
	beq _02021BC4
	ldr r1, [r4, #0x5c]
	b _02021C10
_02021AB4:
	cmp r0, #0
	moveq r1, #7
	streq r1, [r4, #0x5c]
	beq _02021C10
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021B0C
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r1, #7
	strne r1, [r4, #0x5c]
	bne _02021C10
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	b _02021BC4
_02021B0C:
	ldr r7, [r4, #0x88]
	add r0, r4, #0x88
	bl sub_0202065C
	strh r0, [r4, #0x8c]
	ldr r0, [r4, #0x10]
	ldrh r6, [r4, #0x8c]
	cmp r0, #0
	bne _02021B50
	ldr r8, [r4, #0x90]
	cmp r6, #0x7f
	addeq r5, r8, #6
	beq _02021B58
	ldr r1, [r4, #0x38]
	mov r0, r6
	blx r1
	add r5, r8, r0
	b _02021B58
_02021B50:
	ldr r8, [r4, #0x90]
	add r5, r8, r0
_02021B58:
	ldr r0, [r4, #8]
	cmp r5, r0
	ble _02021B84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	str r7, [r4, #0x88]
	b _02021BC4
_02021B84:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021BA8
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x94]
	ldr r7, [r4, #0x40]
	mov r1, r8
	mov r3, r6
	blx r7
_02021BA8:
	str r5, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021BFC
_02021BC4:
	ldrh r0, [r4, #0x60]
	tst r0, #0x400
	bne _02021BFC
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021BFC
	mov r0, #0
	str r0, [r4, #0xa0]
	mov r0, #1
	mov r1, #9
	strb r0, [r4, #0x9d]
	str r1, [r4, #0x5c]
	b _02021C10
_02021BFC:
	ldr r0, [r4, #0x80]
	cmp r0, #0
	bgt _02020EE4
	mov r1, #5
	str r1, [r4, #0x5c]
_02021C10:
	sub r0, r1, #7
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02021C74
_02021C20: ; jump table
	b _02021C54 ; case 0
	b _02021C48 ; case 1
	b _02021C3C ; case 2
	b _02021C74 ; case 3
	b _02021C74 ; case 4
	b _02021C3C ; case 5
	b _02021C3C ; case 6
_02021C3C:
	ldr r0, [r4, #0x6c]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C48:
	ldr r0, [r4, #0x70]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C54:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021C6C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
_02021C6C:
	mov r0, #7
	b _02021EC8
_02021C74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021EC4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
	b _02021EC4
_02021C90:
	ldrh r0, [r4, #0x60]
	tst r0, #0x10
	beq _02021CCC
	mov r0, #0xa
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r1, [r4, #0x74]
	cmp r1, #0
	ldrge r0, [r4, #0x78]
	subge r0, r1, r0
	strge r0, [r4, #0x7c]
	ldrlt r0, [r4, #0x6c]
	strlt r0, [r4, #0x7c]
	b _02021EC4
_02021CCC:
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021CE4:
	ldrh r1, [r4, #0x60]
	mov r5, #0
	tst r1, #8
	bne _02021D08
	cmp r0, #0xb
	cmpne r0, #0xc
	cmpne r0, #0xd
	movne r5, #1
	bne _02021D60
_02021D08:
	tst r1, #0x20
	beq _02021D24
	ldr r0, [r4, #0x7c]
	subs r0, r0, #1
	str r0, [r4, #0x7c]
	movmi r5, #1
	b _02021D60
_02021D24:
	ldrb r0, [r4, #0x9d]
	cmp r0, #0
	beq _02021D50
	mov r0, #0
	strb r0, [r4, #0x9d]
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	b _02021D60
_02021D50:
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x1c]
	blx r1
	mov r5, r0
_02021D60:
	cmp r5, #0
	bne _02021DB0
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02021EC4
	ldr r0, [r4, #0x5c]
	cmp r0, #8
	bne _02021D98
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r3, [r4, #0x50]
	blx r3
	b _02021EC4
_02021D98:
	mvn r1, #0
	ldr r0, [r4, #0x54]
	ldr r3, [r4, #0x50]
	mov r2, r1
	blx r3
	b _02021EC4
_02021DB0:
	ldr r2, [r4, #0x88]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x4c]
	ldrb r5, [r2]
	blx r1
	ldr r0, [r4, #0x5c]
	cmp r0, #0xb
	moveq r0, #0x10
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xc
	moveq r0, #3
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xd
	moveq r0, #2
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r5, #0
	cmpne r0, #0xa
	bne _02021E20
	ldrh r0, [r4, #0x60]
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021E20:
	cmp r0, #9
	bne _02021E84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021E78
	ldr r0, [r4, #4]
	str r0, [r4, #0x94]
	ldr r0, [r4, #0xa0]
	cmp r0, #0
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02021EC4
	mov r0, #0xf
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x7c]
	b _02021EC4
_02021E78:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E84:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E90:
	mov r0, #0x10
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E9C:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	blx r1
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	movle r0, #4
	strle r0, [r4, #0x5c]
_02021EC4:
	ldr r0, [r4, #0x5c]
_02021EC8:
	add sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02021ED0: .word _020999AC
_02021ED4: .word _020997E4
_02021ED8: .word _020999B0
_02021EDC: .word _020999C8
_02021EE0: .word _020999CC
_02021EE4: .word _020999D0
_02021EE8: .word _020999D4
_02021EEC: .word _020999D8
_02021EF0: .word _020999E4
_02021EF4: .word _020999F0
_02021EF8: .word _020999F4
_02021EFC: .word _020999F8
#ifdef EUROPE
_020220C4: .word _02099E64_EU
_020220C8: .word _020B05AC_EU
#endif
_02021F00: .word _020999FC
_02021F04: .word _02099A00
_02021F08: .word _02099A04
_02021F0C: .word _02099A08
_02021F10: .word _020997E4
_02021F14: .word _02099A10
_02021F18: .word _02099A14
_02021F1C: .word _02099A18
_02021F20: .word _02099A1C
_02021F24: .word _02099A24
_02021F28: .word _02099A28
_02021F2C: .word _02099A2C
_02021F30: .word _02099A30
_02021F34: .word _02099A34
_02021F38: .word _02099A38
_02021F3C: .word _02099A40
_02021F40: .word _02099A44
	arm_func_end AnalyzeText

	arm_func_start sub_02021F44
sub_02021F44: ; 0x02021F44
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r0, #0
	ldr r6, _02022020 ; =_02099A24
	ldr r5, _02022024 ; =_020999D4
	ldr r4, _02022028 ; =_02099A00
	str r0, [sb]
	add r7, sp, #0x20
_02021F68:
	mov r0, r7
	bl sub_0202065C
	cmp r0, #0
	beq _02022010
	cmp r0, #0x5b
	bne _02021F68
	ldr r8, [sp, #0x20]
	add r1, r8, #1
	str r1, [sp, #0x20]
_02021F8C:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02021F8C
	mov r0, r8
	mov r1, r6
	bl StrcmpTag
	cmp r0, #0
	bne _02021FCC
	mov r0, r8
	mov r1, r5
	bl StrcmpTag
	cmp r0, #0
	beq _02021FF0
_02021FCC:
	ldr r0, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x20]
	addeq r0, r0, #1
	streq r0, [sp, #0x20]
	ldr r0, [sp, #0x20]
	b _02022014
_02021FF0:
	mov r0, r8
	mov r1, r4
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sb]
	addne r0, r0, #1
	strne r0, [sb]
	b _02021F68
_02022010:
	mov r0, #0
_02022014:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022020: .word _02099A24
_02022024: .word _020999D4
_02022028: .word _02099A00
	arm_func_end sub_02021F44

	arm_func_start sub_0202202C
sub_0202202C: ; 0x0202202C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, [r1, #0x14]
	str r0, [sp]
_02022040:
	add r0, sp, #0
	ldr r4, [sp]
	bl sub_0202065C
	cmp r0, #0
	beq _020220F4
	cmp r0, #0x5b
	bne _020220DC
	ldr r4, [sp]
	add r1, r4, #1
	str r1, [sp]
_02022068:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022068
	ldr r1, _02022110 ; =_02099A04
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _020220F4
	ldr r1, _02022114 ; =_02099A00
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _02022040
	ldr r2, [sp, #0x10]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x10]
	strb r0, [r2]
_020220BC:
	ldr r1, [sp, #0x10]
	add r0, r1, #1
	str r0, [sp, #0x10]
	ldrb r0, [r4], #1
	strb r0, [r1]
	cmp r0, #0x5d
	bne _020220BC
	b _02022040
_020220DC:
	add r0, sp, #0x10
	add r1, sp, #0
	mov r2, #0
	str r4, [sp]
	bl sub_020206FC
	b _02022040
_020220F4:
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022110: .word _02099A04
_02022114: .word _02099A00
	arm_func_end sub_0202202C

	arm_func_start sub_02022118
sub_02022118: ; 0x02022118
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r1
	mov r7, r2
	mov r4, #0
_0202212C:
	add r0, sp, #0x18
	bl sub_0202065C
	cmp r0, #0
	cmpne r0, #0xd
	cmpne r0, #0xa
	cmpne r0, #0x1b
	beq _020223B4
	cmp r0, #0x5b
	bne _020223A8
	ldr r6, [sp, #0x18]
	ldr r1, _020223C4 ; =_02099A10
	add r2, r6, #1
	mov r0, r6
	str r2, [sp, #0x18]
	mov r5, #0
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D4 ; =_02099A18
	mov r0, r6
	bl StrcmpTag
#ifdef EUROPE
	cmp r0, #0
	bne _020221D8
	ldr r1, _020225D0 ; =_02099E64_EU
	mov r0, r6
	bl StrcmpTag
#endif
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D8 ; =_02099A08
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022324
_020221D8:
	ldr r1, [sp, #0x18]
_020221DC:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _02022214
	mov r5, r1
_020221F8:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _020221F8
	b _0202221C
_02022214:
	cmp r0, #0x5d
	bne _020221DC
_0202221C:
	ldr r1, _020223C4 ; =_02099A10
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022250
	mov r0, r5
	bl sub_02020948
	mvn r1, #0
	cmp r0, r1
	beq _0202212C
	blx r7
	add r4, r4, r0
	b _0202212C
_02022250:
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022280
	mov r0, r5
	bl sub_02020A4C
	cmp r0, #0
	beq _0202212C
	blx r8
	add r4, r4, r0
	b _0202212C
_02022280:
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222A4
	mov r0, r5
	bl AtoiTag
	add r4, r4, r0
	b _0202212C
_020222A4:
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222CC
	mov r0, r5
	bl AtoiTag
	mov r1, #6
	mla r4, r0, r1, r4
	b _0202212C
_020222CC:
	ldr r1, _020223D4 ; =_02099A18
#ifdef EUROPE
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	ldr r1, _020225D0 ; =_02099A08
#endif
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	mov r6, r5
_020222E8:
	ldrb r0, [r6], #1
	cmp r0, #0x3a
	bne _020222E8
	mov r0, r5
	bl AtoiTag
	mov r5, r0
	mov r0, r6
	bl AtoiTag
	ldr r1, _020223DC ; =_020997E4
	mov r2, r5, lsl #1
	mov r5, r0
	ldrh r0, [r1, r2]
	blx r8
	mla r4, r5, r0, r4
	b _0202212C
_02022324:
	ldr r1, [sp, #0x18]
_02022328:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022328
	ldrb r0, [r6]
	cmp r0, #0x41
	blo _0202212C
	cmp r0, #0x5a
	bhi _0202212C
	ldr r1, _020223E0 ; =_02099A24
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E4 ; =_020999D4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E8 ; =_02099A28
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223EC ; =_020999F0
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	b _0202212C
_020223A8:
	blx r8
	add r4, r4, r0
	b _0202212C
_020223B4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020223C4: .word _02099A10
_020223C8: .word _020999F4
_020223CC: .word _02099A2C
_020223D0: .word _02099A14
_020223D4: .word _02099A18
#ifdef EUROPE
_020225D0: .word _02099E64_EU
#endif
_020223D8: .word _02099A08
_020223DC: .word _020997E4
_020223E0: .word _02099A24
_020223E4: .word _020999D4
_020223E8: .word _02099A28
_020223EC: .word _020999F0
	arm_func_end sub_02022118

; https://decomp.me/scratch/Qhonx
	arm_func_start PreprocessString
PreprocessString: ; 0x020223F0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c8
	sub sp, sp, #0x400
	ldr sl, [sp, #0x5f0]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, r0
	str r0, [sp, #0xc]
	and r0, r3, #0x40
	mov sb, r1
	str r0, [sp, #8]
	and r0, r3, #0x100
	ldr r8, [sp, #0x600]
	add r4, sl, sb
	and fp, r3, #0x2000
	str r0, [sp, #4]
_02022434:
	ldr r1, [sp, #0x5f0]
	cmp r1, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r0, [sp, #0x5f8]
	ldrb r5, [r0]
	cmp r5, #0
	moveq r0, #0
	streqb r0, [r1]
	ldreq r0, [sp, #0x5f0]
	subeq r0, r0, sl
	beq _0202357C
	cmp r5, #0xd
	cmpne r5, #0xa
	bne _02022490
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _02022554
_02022490:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0202251C
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	cmp fp, #0
	beq _02022554
	ldr r1, [r8, #0x4c]
	add r0, sp, #0x1c8
	bl sub_02023B68
	movs r6, r0
	beq _02022554
	ldr r1, _0202346C ; =_02099A5C
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	add r0, sp, #0x5f0
	mov r1, r6
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	ldr r1, _02023470 ; =_02099A64
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	bne _02022554
	mov r0, sb
	b _0202357C
_0202251C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02022554
	mov r0, #0
	cmp fp, #0
	str r0, [sp, #0xc]
	beq _02022554
	ldr r1, _02023474 ; =_02099A70
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
_02022554:
	cmp r5, #0x5b
	bne _02023454
	ldr r5, [sp, #0x5f8]
	mov r7, #0
	add r0, r5, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r5, #1]
	cmp r2, #0x61
	blo _0202332C
	cmp r2, #0x7a
	bhi _0202332C
	str r0, [sp, #0xb4]
	mov r6, #1
	add r1, sp, #0xb4
_0202258C:
	mov r2, r0
	add r0, r0, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r2]
	cmp r2, #0x5d
	beq _020225B4
	cmp r2, #0x3a
	streq r0, [r1, r6, lsl #2]
	addeq r6, r6, #1
	b _0202258C
_020225B4:
	ldr r0, [sp, #0xb4]
	ldrb r1, [r0]
	sub r1, r1, #0x61
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _020232C8
_020225CC: ; jump table
	b _02022628 ; case 0
	b _020226BC ; case 1
	b _0202274C ; case 2
	b _02022838 ; case 3
	b _02022908 ; case 4
	b _02022994 ; case 5
	b _020229F0 ; case 6
	b _02022AD8 ; case 7
	b _02022B28 ; case 8
	b _020232C8 ; case 9
	b _02022B8C ; case 10
	b _020232C8 ; case 11
	b _02022C64 ; case 12
	b _02022BE4 ; case 13
	b _020232C8 ; case 14
	b _02022D5C ; case 15
	b _020232C8 ; case 16
	b _02022E30 ; case 17
	b _02022EC0 ; case 18
	b _02022FA0 ; case 19
	b _020232C8 ; case 20
	b _0202313C ; case 21
	b _0202323C ; case 22
_02022628:
	ldr r1, _02023478 ; =_02099A74
	bl StrcmpTag
	cmp r0, #0
	beq _02022658
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_0202494C
	mov r7, r0
	b _020232F0
_02022658:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202347C ; =_02099A7C
	bl StrcmpTag
	cmp r0, #0
	beq _02022694
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022694:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd8]
	ldr ip, [r1, #0xd4]
#else
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#endif
	str r2, [sp, #0xb0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xac
	mov r2, r5
	str ip, [sp, #0xac]
	bl Debug_FatalError
_020226BC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023488 ; =_02099A84
	bl StrcmpTag
	cmp r0, #0
	beq _020226F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl BankQuantityToString
	mov r7, r0
	b _020232F0
_020226F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202348C ; =_02099A8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022724
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl MoneyQuantityToString__02023B58
	mov r7, r0
	b _020232F0
_02022724:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xb8]
	ldr ip, [r1, #0xb4]
	str r2, [sp, #0xa8]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xa4
	mov r2, r5
	str ip, [sp, #0xa4]
	bl Debug_FatalError
_0202274C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023490 ; =_02099A98
	bl StrcmpTag
	cmp r0, #0
	beq _02022774
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_020240B0
	mov r7, r0
	b _020232F0
_02022774:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023494 ; =_02099AA0
	bl StrcmpTag
	cmp r0, #0
	beq _020227A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024C18
	mov r7, r0
	b _020232F0
_020227A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023498 ; =_02099AA4
	bl StrcmpTag
	cmp r0, #0
	beq _020227D0
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024114
	mov r7, r0
	b _020232F0
_020227D0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202349C ; =_02099AAC
	bl StrcmpTag
	cmp r0, #0
	beq _020227F8
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024178
	mov r7, r0
	b _020232F0
_020227F8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A0 ; =_02099AB8
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, _020234A4 ; =_02099AC0
	bne _020232F0
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xc8]
	ldr ip, [r1, #0xc4]
	str r2, [sp, #0xa0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x9c
	mov r2, r5
	str ip, [sp, #0x9c]
	bl Debug_FatalError
_02022838:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A8 ; =_02099AC8
	bl StrcmpTag
	cmp r0, #0
	beq _02022870
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234AC ; =_02099AD0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022870:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B0 ; =_02099AD4
	bl StrcmpTag
	cmp r0, #0
	beq _020228A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234B4 ; =_02099AE0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020228A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B8 ; =_02099AF0
	bl StrcmpTag
	cmp r0, #0
	beq _020228E0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020245D0
	mov r7, r0
	b _020232F0
_020228E0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xf8]
	ldr ip, [r1, #0xf4]
#else
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#endif
	str r2, [sp, #0x98]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x94
	mov r2, r5
	str ip, [sp, #0x94]
	bl Debug_FatalError
_02022908:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234BC ; =_02099AF8
	bl StrcmpTag
	cmp r0, #0
	beq _02022938
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_02024E34
	mov r7, r0
	b _020232F0
_02022938:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C0 ; =_02099B04
	bl StrcmpTag
	cmp r0, #0
	beq _0202296C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl ExpQuantityToString
	mov r7, r0
	b _020232F0
_0202296C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x110]
	ldr ip, [r1, #0x10c]
#else
	ldr r2, [r1, #0x108]
	ldr ip, [r1, #0x104]
#endif
	str r2, [sp, #0x90]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x8c
	mov r2, r5
	str ip, [sp, #0x8c]
	bl Debug_FatalError
_02022994:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C4 ; =_02099B10
	bl StrcmpTag
	cmp r0, #0
	beq _020229C8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02024598
	mov r7, r0
	b _020232F0
_020229C8:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#else
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#endif
	str r2, [sp, #0x88]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x84
	mov r2, r5
	str ip, [sp, #0x84]
	bl Debug_FatalError
_020229F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C8 ; =_02099B18
	bl StrcmpTag
	cmp r0, #0
	beq _02022A14
	add r0, sp, #0x1c8
	bl GetBagNameString
	mov r7, r0
	b _020232F0
_02022A14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234CC ; =_02099B24
	bl StrcmpTag
	cmp r0, #0
	beq _02022A48
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D7C
	mov r7, r0
	b _020232F0
_02022A48:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D0 ; =_02099B2C
	bl StrcmpTag
	cmp r0, #0
	beq _02022A7C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238D0
	mov r7, r0
	b _020232F0
_02022A7C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D4 ; =_02099B34
	bl StrcmpTag
	cmp r0, #0
	beq _02022AB0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl MoneyQuantityToString__02023B30
	mov r7, r0
	b _020232F0
_02022AB0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#else
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#endif
	str r2, [sp, #0x80]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x7c
	mov r2, r5
	str ip, [sp, #0x7c]
	bl Debug_FatalError
_02022AD8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D8 ; =_02099B40
	bl StrcmpTag
	cmp r0, #0
	beq _02022B00
	add r0, sp, #0x1c8
	mov r1, #0x3c
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022B00:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#else
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#endif
	str r2, [sp, #0x78]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x74
	mov r2, r5
	str ip, [sp, #0x74]
	bl Debug_FatalError
_02022B28:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234DC ; =_02099B48
	bl StrcmpTag
	cmp r0, #0
	beq _02022B64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r3, r8, r0, lsl #2
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r0, sp, #0x1c8
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022B64:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x24]
	str r2, [sp, #0x70]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x6c
	mov r2, r5
	str ip, [sp, #0x6c]
	bl Debug_FatalError
_02022B8C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E0 ; =_02099B50
	bl StrcmpTag
	cmp r0, #0
	beq _02022BBC
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023920
	mov r7, r0
	b _020232F0
_02022BBC:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#else
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x3c]
#endif
	str r2, [sp, #0x68]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x64
	mov r2, r5
	str ip, [sp, #0x64]
	bl Debug_FatalError
_02022BE4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E4 ; =_02099B58
	bl StrcmpTag
	cmp r0, #0
	beq _02022C14
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023B68
	mov r7, r0
	b _020232F0
_02022C14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E8 ; =_02099B60
	bl StrcmpTag
	cmp r0, #0
	beq _02022C3C
	add r0, sp, #0x1c8
	mov r1, #2
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02022C3C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#else
	ldr r2, [r1, #0xa8]
	ldr ip, [r1, #0xa4]
#endif
	str r2, [sp, #0x60]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x5c
	mov r2, r5
	str ip, [sp, #0x5c]
	bl Debug_FatalError
_02022C64:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234EC ; =_02099B6C
	bl StrcmpTag
	cmp r0, #0
	beq _02022C9C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020242F8
	mov r7, r0
	b _020232F0
_02022C9C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F0 ; =_02099B74
	bl StrcmpTag
	cmp r0, #0
	beq _02022CD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234F4 ; =_02099B7C
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022CD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F8 ; =_02099B8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D04
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringAccuracy
	mov r7, r0
	b _020232F0
_02022D04:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234FC ; =_02099B9C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D34
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringPower
	mov r7, r0
	b _020232F0
_02022D34:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd0]
	ldr ip, [r1, #0xcc]
#else
	ldr r2, [r1, #0xc0]
	ldr ip, [r1, #0xbc]
#endif
	str r2, [sp, #0x58]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x54
	mov r2, r5
	str ip, [sp, #0x54]
	bl Debug_FatalError
_02022D5C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023500 ; =_02099BA8
	bl StrcmpTag
	cmp r0, #0
	beq _02022D84
	add r0, sp, #0x1c8
	mov r1, #0x3d
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022D84:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023504 ; =_02099BB0
	bl StrcmpTag
	cmp r0, #0
	beq _02022DAC
	add r0, sp, #0x1c8
	mov r1, #0x3e
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DAC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023508 ; =_02099BBC
	bl StrcmpTag
	cmp r0, #0
	beq _02022DD4
	add r0, sp, #0x1c8
	mov r1, #0x3f
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202350C ; =_02099BC4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E08
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024A68
	mov r7, r0
	b _020232F0
_02022E08:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x118]
	ldr ip, [r1, #0x114]
#else
	ldr r2, [r1, #0xf0]
	ldr ip, [r1, #0xec]
#endif
	str r2, [sp, #0x50]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x4c
	mov r2, r5
	str ip, [sp, #0x4c]
	bl Debug_FatalError
_02022E30:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023510 ; =_02099BCC
	bl StrcmpTag
	cmp r0, #0
	beq _02022E64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl GetRankString
	mov r7, r0
	b _020232F0
_02022E64:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023514 ; =_02099BD4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E98
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B48
	mov r7, r0
	b _020232F0
_02022E98:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#else
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#endif
	str r2, [sp, #0x48]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x44
	mov r2, r5
	str ip, [sp, #0x44]
	bl Debug_FatalError
_02022EC0:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023518 ; =_02099BDC
	bl StrcmpTag
	cmp r0, #0
	beq _02022EF8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r2, #0
	orr r1, r0, #0x50000
	add r0, sp, #0x1c8
	mov r3, r2
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022EF8:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202351C ; =_02099BE4
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, [r8, #0x38]
	bne _020232F0
	ldr r0, [sp, #0xb4]
	ldr r1, _02023520 ; =_02099BEC
	bl StrcmpTag
	cmp r0, #0
	beq _02022F40
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r7, [r0, #0x38]
	b _020232F0
_02022F40:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023524 ; =_02099BF4
	bl StrcmpTag
	cmp r0, #0
	beq _02022F78
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _02023528 ; =_02099BFC
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022F78:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x2c]
	str r2, [sp, #0x40]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x3c
	mov r2, r5
	str ip, [sp, #0x3c]
	bl Debug_FatalError
_02022FA0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202352C ; =_02099C0C
	bl StrcmpTag
	cmp r0, #0
	beq _02022FD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B94
	mov r7, r0
	b _020232F0
_02022FD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023530 ; =_02099C14
	bl StrcmpTag
	cmp r0, #0
	beq _02023008
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_020244F4
	mov r7, r0
	b _020232F0
_02023008:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023534 ; =_02099C1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202303C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D48
	mov r7, r0
	b _020232F0
_0202303C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023538 ; =_02099C24
	bl StrcmpTag
	cmp r0, #0
	beq _02023094
	cmp r6, #1
	bne _0202306C
	add r0, sp, #0x1c8
	mov r1, #0
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_0202306C:
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02023094:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202353C ; =_02099C2C
	bl StrcmpTag
	cmp r0, #0
	beq _02023114
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r5, [r0, #0x24]
	mov r1, #0xe10
	mov r0, r5
	bl _u32_div_f
	mov r6, r0
	mov r0, r5
	mov r1, #0xe10
	bl _u32_div_f
	mov r5, r1
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	mov r7, r0
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	str r1, [sp]
	ldr r1, _02023540 ; =_02099C34
	mov r2, r6
	mov r3, r7
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02023114:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa0]
	ldr r2, [r0, #0x9c]
#else
	ldr r1, [r0, #0xb0]
	ldr r2, [r0, #0xac]
#endif
	str r1, [sp, #0x38]
	str r2, [sp, #0x34]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x34
	mov r2, r5
	bl Debug_FatalError
_0202313C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023544 ; =_02099C44
	bl StrcmpTag
	cmp r0, #0
	beq _02023180
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	mov r2, r0
	ldr r1, [r1, #0x24]
	add r0, sp, #0x1c8
	bl sub_0202372C
	mov r7, r0
	b _020232F0
_02023180:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023548 ; =_02099C4C
	bl StrcmpTag
	cmp r0, #0
	beq _020231D8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	ldr r3, [r1, #0x24]
	mov r2, r0
	ldr r1, _0202354C ; =_02099C54
	add r0, sp, #0xc8
	bl SprintfStatic__02023590
	ldr r1, _02023550 ; =_02099C5C
	add r0, sp, #0x1c8
	add r2, sp, #0xc8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020231D8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023554 ; =_02099C68
	bl StrcmpTag
	cmp r0, #0
	beq _02023214
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02023214:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xc0]
	ldr r2, [r0, #0xbc]
#else
	ldr r1, [r0, #0xd0]
	ldr r2, [r0, #0xcc]
#endif
	str r1, [sp, #0x30]
	str r2, [sp, #0x2c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x2c
	mov r2, r5
	bl Debug_FatalError
_0202323C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023558 ; =_02099C70
	bl StrcmpTag
	cmp r0, #0
	beq _0202326C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02024AA8
	mov r7, r0
	b _020232F0
_0202326C:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202355C ; =_02099C78
	bl StrcmpTag
	cmp r0, #0
	beq _020232A0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024BD8
	mov r7, r0
	b _020232F0
_020232A0:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r1, [r0, #0x38]
	ldr r2, [r0, #0x34]
	str r1, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x24
	mov r2, r5
	bl Debug_FatalError
_020232C8:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa8]
	ldr r2, [r0, #0xa4]
#else
	ldr r1, [r0, #0xd8]
	ldr r2, [r0, #0xd4]
#endif
	str r1, [sp, #0x20]
	str r2, [sp, #0x1c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x1c
	mov r2, r5
	bl Debug_FatalError
_020232F0:
	cmp r7, #0
	beq _02022434
_020232F8:
	ldr r2, [sp, #0x5f0]
	cmp r2, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldrb r1, [r7], #1
	cmp r1, #0
	beq _02022434
	add r0, r2, #1
	str r0, [sp, #0x5f0]
	strb r1, [r2]
	b _020232F8
_0202332C:
	cmp r2, #0x41
	blo _0202342C
	cmp r2, #0x5a
	bhi _0202342C
	ldr r1, _02023560 ; =_02099A24
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	bne _02023364
	ldr r1, _02023564 ; =_020999D4
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _02023390
_02023364:
	ldr r0, [sp, #0x5f8]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x5f8]
	addeq r0, r0, #1
	streq r0, [sp, #0x5f8]
	mov r0, #1
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	b _020233D8
_02023390:
	ldr r1, _02023568 ; =_02099A28
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _020233BC
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _020233D8
_020233BC:
	ldr r1, _0202356C ; =_02099A04
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sp, #4]
	cmpne r0, #0
	bne _02023574
_020233D8:
	ldr r2, [sp, #0x5f0]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x5f0]
	strb r0, [r2]
_020233EC:
	ldr r3, [sp, #0x5f0]
	cmp r3, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r2, [sp, #0x5f8]
	add r0, r3, #1
	add r1, r2, #1
	str r1, [sp, #0x5f8]
	ldrb r1, [r2]
	str r0, [sp, #0x5f0]
	strb r1, [r3]
	cmp r1, #0x5d
	beq _02022434
	b _020233EC
_0202342C:
	ldr r1, _02023480 ; =_020997E4
	add r0, sp, #0x14
#ifdef EUROPE
	ldr r3, [r1, #0xb0]
	ldr r1, [r1, #0xac]
#else
	ldr r3, [r1, #0x110]
	ldr r1, [r1, #0x10c]
#endif
	str r3, [sp, #0x18]
	str r1, [sp, #0x14]
	ldr r1, _02023570 ; =_02099C84
	mov r3, r2
	str r5, [sp]
	bl Debug_FatalError
_02023454:
	add r1, sp, #0x500
	add r0, sp, #0x5f0
	add r1, r1, #0xf8
	mov r2, r4
	bl sub_020206FC
	b _02022434
	.align 2, 0
_0202346C: .word _02099A5C
_02023470: .word _02099A64
_02023474: .word _02099A70
_02023478: .word _02099A74
_0202347C: .word _02099A7C
_02023480: .word _020997E4
_02023484: .word _020999B0
_02023488: .word _02099A84
_0202348C: .word _02099A8C
_02023490: .word _02099A98
_02023494: .word _02099AA0
_02023498: .word _02099AA4
_0202349C: .word _02099AAC
_020234A0: .word _02099AB8
_020234A4: .word _02099AC0
_020234A8: .word _02099AC8
_020234AC: .word _02099AD0
_020234B0: .word _02099AD4
_020234B4: .word _02099AE0
_020234B8: .word _02099AF0
_020234BC: .word _02099AF8
_020234C0: .word _02099B04
_020234C4: .word _02099B10
_020234C8: .word _02099B18
_020234CC: .word _02099B24
_020234D0: .word _02099B2C
_020234D4: .word _02099B34
_020234D8: .word _02099B40
_020234DC: .word _02099B48
_020234E0: .word _02099B50
_020234E4: .word _02099B58
_020234E8: .word _02099B60
_020234EC: .word _02099B6C
_020234F0: .word _02099B74
_020234F4: .word _02099B7C
_020234F8: .word _02099B8C
_020234FC: .word _02099B9C
_02023500: .word _02099BA8
_02023504: .word _02099BB0
_02023508: .word _02099BBC
_0202350C: .word _02099BC4
_02023510: .word _02099BCC
_02023514: .word _02099BD4
_02023518: .word _02099BDC
_0202351C: .word _02099BE4
_02023520: .word _02099BEC
_02023524: .word _02099BF4
_02023528: .word _02099BFC
_0202352C: .word _02099C0C
_02023530: .word _02099C14
_02023534: .word _02099C1C
_02023538: .word _02099C24
_0202353C: .word _02099C2C
_02023540: .word _02099C34
_02023544: .word _02099C44
_02023548: .word _02099C4C
_0202354C: .word _02099C54
_02023550: .word _02099C5C
_02023554: .word _02099C68
_02023558: .word _02099C70
_0202355C: .word _02099C78
_02023560: .word _02099A24
_02023564: .word _020999D4
_02023568: .word _02099A28
_0202356C: .word _02099A04
_02023570: .word _02099C84
_02023574:
	ldr r0, [sp, #0x5f0]
	sub r0, r0, sl
_0202357C:
	add sp, sp, #0x1c8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end PreprocessString

	arm_func_start SprintfStatic__02023590
SprintfStatic__02023590: ; 0x02023590
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02023590

	arm_func_start PreprocessStringFromId
PreprocessStringFromId: ; 0x020235B8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r2
	mov r5, r1
	mov r4, r3
	bl StringFromId
	ldr ip, [sp, #0x18]
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, r4
	str ip, [sp]
	bl PreprocessString
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end PreprocessStringFromId

	arm_func_start StrcmpTagVeneer
StrcmpTagVeneer: ; 0x020235F8
	ldr ip, _02023600 ; =StrcmpTag
	bx ip
	.align 2, 0
_02023600: .word StrcmpTag
	arm_func_end StrcmpTagVeneer

	arm_func_start AtoiTagVeneer
AtoiTagVeneer: ; 0x02023604
	ldr ip, _0202360C ; =AtoiTag
	bx ip
	.align 2, 0
_0202360C: .word AtoiTag
	arm_func_end AtoiTagVeneer

#ifdef EUROPE
	arm_func_start sub_0202380C_EU
sub_0202380C_EU: ; 0x0202380C
	ldr ip, _02023814 ; =sub_02020A4C
	bx ip
	.align 2, 0
_02023814: .word sub_02020A4C
	arm_func_end sub_0202380C_EU
#endif

	arm_func_start sub_02023610
sub_02023610: ; 0x02023610
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#ifdef EUROPE
	bl GetLanguageType
	cmp r0, #5
	moveq r1, #1
	ldr r0, _02023864 ; =_020B05BC_EU
	movne r1, #0
#endif
	ldr r6, _02023644 ; =_022A5048
	ldr r5, _02023648 ; =_02099CA0
	mov r7, #0
#ifdef EUROPE
	strb r1, [r0]
#endif
	mov r4, #1
_02023624:
	mov r2, r4
	add r0, r6, r7, lsl #2
	add r1, r5, r7
	bl StrncpySimpleNoPadSafe
	add r7, r7, #1
	cmp r7, #3
	blt _02023624
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_02023864: .word _020B05BC_EU
#endif
_02023644: .word _022A5048
_02023648: .word _02099CA0
	arm_func_end sub_02023610

	arm_func_start sub_0202364C
sub_0202364C: ; 0x02023610
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _02023674
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_02023674:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq sub_0202364C
	mov r0, #0
	bx lr
	arm_func_end sub_0202364C

	arm_func_start InitPreprocessorArgs
InitPreprocessorArgs: ; 0x02023690
	mov r1, #0x60000
	str r1, [r0, #0x4c]
	mov r1, #0
	mov r3, r1
_020236A0:
	str r3, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #4
	blt _020236A0
	mov r2, #0
_020236B4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x10]
	cmp r3, #5
	blt _020236B4
	mov r3, #0
_020236CC:
	add r1, r0, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x24]
	cmp r2, #5
	blt _020236CC
	mov r2, #0
_020236E4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x38]
	cmp r3, #5
	blt _020236E4
	bx lr
	arm_func_end InitPreprocessorArgs

	arm_func_start CopyOrInitPreprocessorArgs
CopyOrInitPreprocessorArgs: ; 0x020236FC
	stmdb sp!, {r4, lr}
	movs lr, r1
	mov r4, r0
	beq _02023724
	mov ip, #5
_02023710:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02023710
	ldmia sp!, {r4, pc}
_02023724:
	bl InitPreprocessorArgs
	ldmia sp!, {r4, pc}
	arm_func_end CopyOrInitPreprocessorArgs

	arm_func_start sub_0202372C
sub_0202372C: ; 0x0202372C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _02023784 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r2, r0
	cmp r2, r4
	movgt r4, r2
	ldr r1, _02023788 ; =_02099D10
	add r3, sp, #0
	mov r0, r5
	sub r2, r4, r2
	bl SprintfStatic__0202378C
	mov r0, r5
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef EUROPE
_02023784: .word _0209A230_EU
#else
_02023784: .word _02099D0C
#endif
_02023788: .word _02099D10
	arm_func_end sub_0202372C

	arm_func_start SprintfStatic__0202378C
SprintfStatic__0202378C: ; 0x0202378C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0202378C

	arm_func_start QuantityToString
QuantityToString: ; 0x020237B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x100
#ifdef EUROPE
	mov r4, r1
	mov r8, r0
	mov r7, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r4
	mov r6, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r7, #0
	ble _02023A38
	cmp r5, r7
	movgt r7, r5
	sub r0, r7, #1
	mov r1, #3
	bl _s32_div_f
_02023A38:
	ldr r1, _02023B14 ; =_020B05BC_EU
	ldrb r1, [r1]
	cmp r1, #0
	beq _02023A50
	cmp r5, #4
	movle r4, #0
_02023A50:
	cmp r4, #0
	ble _02023AD0
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov lr, #0
	add sl, sb, r4, lsl #2
	mov ip, lr
	strb lr, [sl, #1]
	mov r3, #0x5d
	mov r2, #0x50
	mov fp, #0x5b
	b _02023AC8
_02023A84:
	cmp lr, #3
	blt _02023AB8
	strb r3, [sl]
	cmp r6, #0
	movne r1, #0x47
	strb r2, [sl, #-1]
	moveq r1, #0x4d
	strb r1, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023AD0
	mov lr, #0
_02023AB8:
	ldrb r1, [sb], #-1
	add lr, lr, #1
	add ip, ip, #1
	strb r1, [sl], #-1
_02023AC8:
	cmp ip, r5
	blt _02023A84
_02023AD0:
	cmp r7, #0
	ble _02023AF8
	sub r1, r7, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r8
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _02023B04
_02023AF8:
	add r1, sp, #0
	mov r0, r8
	bl strcpy
_02023B04:
	mov r0, r8
#else
	mov r3, r1
	mov r7, r0
	mov r6, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r6, #0
	ble _02023810
	cmp r5, r6
	movgt r6, r5
	sub r0, r6, #1
	mov r1, #3
	bl _s32_div_f
_02023810:
	cmp r4, #0
	ble _02023888
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov r8, #0
	add sl, sb, r4, lsl #2
	mov lr, r8
	strb r8, [sl, #1]
	mov ip, #0x5d
	mov r3, #0x50
	mov r2, #0x4d
	mov fp, #0x5b
	b _02023880
_02023848:
	cmp r8, #3
	blt _02023870
	strb ip, [sl]
	strb r3, [sl, #-1]
	strb r2, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023888
	mov r8, #0
_02023870:
	ldrb r1, [sb], #-1
	add r8, r8, #1
	add lr, lr, #1
	strb r1, [sl], #-1
_02023880:
	cmp lr, r5
	blt _02023848
_02023888:
	cmp r6, #0
	ble _020238B0
	sub r1, r6, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r7
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _020238BC
_020238B0:
	add r1, sp, #0
	mov r0, r7
	bl strcpy
_020238BC:
	mov r0, r7
#endif
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef EUROPE
_020238C8: .word _0209A230_EU
_02023B14: .word _020B05BC_EU
#else
_020238C8: .word _02099D0C
#endif
_020238CC: .word _02099D10
	arm_func_end QuantityToString

	arm_func_start sub_020238D0
sub_020238D0: ; 0x020238D0
	ldr ip, _020238DC ; =QuantityToString
	mov r2, #5
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238DC: .word QuantityToString
	arm_func_end sub_020238D0

	arm_func_start MoneyQuantityToString__02023B30
MoneyQuantityToString__02023B30: ; 0x020238E0
	ldr ip, _020238EC ; =QuantityToString
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238EC: .word QuantityToString
	arm_func_end MoneyQuantityToString__02023B30

	arm_func_start BankQuantityToString
BankQuantityToString: ; 0x020238F0
	ldr ip, _020238FC ; =QuantityToString
	mov r2, #7
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238FC: .word QuantityToString
	arm_func_end BankQuantityToString

	arm_func_start MoneyQuantityToString__02023B58
MoneyQuantityToString__02023B58: ; 0x02023900
	ldr ip, _0202390C ; =QuantityToString
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_0202390C: .word QuantityToString
	arm_func_end MoneyQuantityToString__02023B58

	arm_func_start ExpQuantityToString
ExpQuantityToString: ; 0x02023910
	ldr ip, _0202391C ; =QuantityToString
	mov r2, #0
#ifdef EUROPE
	mov r3, r2
#endif
	bx ip
	.align 2, 0
_0202391C: .word QuantityToString
	arm_func_end ExpQuantityToString

	arm_func_start sub_02023920
sub_02023920: ; 0x02023920
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x40000
	mov r4, r2, lsr #0x10
	bgt _02023978
	cmp r1, #0x40000
	bge _02023B44
	cmp r1, #0x10000
	bgt _0202395C
	bge _02023A30
	cmp r1, #0
	beq _020239AC
	b _02023B44
_0202395C:
	cmp r1, #0x20000
	bgt _0202396C
	beq _02023A40
	b _02023B44
_0202396C:
	cmp r1, #0x30000
	beq _02023A8C
	b _02023B44
_02023978:
	cmp r1, #0x70000
	bgt _02023990
	bge _02023B3C
	cmp r1, #0x60000
	beq _02023B34
	b _02023B44
_02023990:
	cmp r1, #0x80000
	bgt _020239A0
	beq _020239D0
	b _02023B44
_020239A0:
	cmp r1, #0x90000
	beq _02023AE0
	b _02023B44
_020239AC:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020239D0:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGender
	cmp r0, #1
	beq _02023A0C
	cmp r0, #2
	beq _02023A1C
	b _02023A28
_02023A0C:
	ldr r1, _02023B50 ; =_022A5048
	mov r0, r5
	bl strcat
	b _02023A28
_02023A1C:
	ldr r1, _02023B54 ; =_022A504C
	mov r0, r5
	bl strcat
_02023A28:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A30:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r3, r4, r5, pc}
_02023A40:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A8C:
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #0xc]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023AE0:
	mov r0, #0x44
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mul r2, r4, r0
	ldr r0, [r1]
	add r0, r0, #0x98
	add r1, r0, #0x9800
	ldrb r0, [r1, r2]
	add r1, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B5C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023B34:
	ldr r0, _02023B60 ; =_02099D3C
	ldmia sp!, {r3, r4, r5, pc}
_02023B3C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02023B44:
	ldr r0, _02023B64 ; =_02099D50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023B4C: .word _02099D1C
_02023B50: .word _022A5048
_02023B54: .word _022A504C
_02023B58: .word TEAM_MEMBER_TABLE_PTR
_02023B5C: .word _02099D2C
_02023B60: .word _02099D3C
_02023B64: .word _02099D50
	arm_func_end sub_02023920

	arm_func_start sub_02023B68
sub_02023B68: ; 0x02023B68
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x30000
	mov r4, r2, lsr #0x10
	bgt _02023BB4
	cmp r1, #0x30000
	bge _02023C90
	cmp r1, #0x10000
	bgt _02023BA8
	bge _02023C08
	cmp r1, #0
	beq _02023BE4
	b _02023D40
_02023BA8:
	cmp r1, #0x20000
	beq _02023C18
	b _02023D40
_02023BB4:
	cmp r1, #0x50000
	bgt _02023BC8
	bge _02023D14
	cmp r1, #0x40000
	b _02023D40
_02023BC8:
	cmp r1, #0x60000
	bgt _02023BD8
	beq _02023D30
	b _02023D40
_02023BD8:
	cmp r1, #0x70000
	beq _02023D38
	b _02023D40
_02023BE4:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023D4C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02023D44
_02023C08:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	b _02023D44
_02023C18:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0
	beq _02023C7C
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023C88
_02023C7C:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023C88:
	mov r0, r5
	b _02023D44
_02023C90:
	ldr r1, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrb r0, [r4, #1]
	add r2, sp, #0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D00
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023D0C
_02023D00:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023D0C:
	mov r0, r5
	b _02023D44
_02023D14:
	mov r0, r4
	bl GetSize0x80Buffer
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02023D44
_02023D30:
	ldr r0, _02023D5C ; =_02099D3C
	b _02023D44
_02023D38:
	mov r0, #0
	b _02023D44
_02023D40:
	ldr r0, _02023D60 ; =_02099D50
_02023D44:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023D4C: .word _02099D2C
_02023D50: .word TEAM_MEMBER_TABLE_PTR
_02023D54: .word _02099D54
_02023D58: .word _02099D64
_02023D5C: .word _02099D3C
_02023D60: .word _02099D50
	arm_func_end sub_02023B68

	arm_func_start sub_02023D64
sub_02023D64: ; 0x02023D64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023DAC
	ldrsh r0, [sp]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023DBC ; =_02099D1C
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
_02023DAC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023DBC: .word _02099D1C
	arm_func_end sub_02023D64

	arm_func_start sub_02023DC0
sub_02023DC0: ; 0x02023DC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x84
	mov r4, r0
	add r0, sp, #0x94
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023F98
	ldrsh r0, [sp, #0x94]
	cmp r0, #0x39
	bne _02023E18
	add r0, sp, #0x42
	bl sub_02065BF0
	ldr r1, _02023FA8 ; =_02099D64
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02023F98
_02023E18:
	cmp r0, #0x42
	bne _02023E44
	add r1, sp, #2
	mov r0, #0x3f
	mov r2, #0xa
	bl LoadScriptVariableValueString
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E44:
	cmp r0, #0x43
	bne _02023E70
	add r1, sp, #2
	mov r0, #0x41
	mov r2, #0xa
	bl LoadScriptVariableValueString
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E70:
	bl GetActorMatchingStorageId
	mov r5, r0
	mvn r1, #0
	cmp r5, r1
	beq _02023F2C
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02023EB0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023ECC
_02023EB0:
	mov r0, r5
	bl GetTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
_02023ECC:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023EF4
	cmp r0, #0xa
	bge _02023EF4
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023EF4:
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0x42
	beq _02023F18
	ldr r1, _02023FAC ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023F18:
	ldr r1, _02023FA8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F24:
	mov r0, r4
	b _02023F98
_02023F2C:
	ldrsh r0, [sp, #0x94]
	bl sub_02065B14
	movs r1, r0
	beq _02023F48
	add r0, sp, #0x42
	bl GetStringFromFileVeneer
	b _02023F5C
_02023F48:
	ldrsh r0, [sp]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x42
	bl strcpy
_02023F5C:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023F84
	cmp r0, #0xa
	bge _02023F84
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F94
_02023F84:
	ldr r1, _02023FB0 ; =_02099D2C
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F94:
	mov r0, r4
_02023F98:
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023FA8: .word _02099D64
_02023FAC: .word _02099D54
_02023FB0: .word _02099D2C
	arm_func_end sub_02023DC0

	arm_func_start sub_02023FB4
sub_02023FB4: ; 0x02023FB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x8c
	mov r4, r0
	add r0, sp, #0xa4
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02024094
	ldrsh r0, [sp, #0xa4]
	bl GetActorMatchingStorageId
	mov r5, r0
	bl GetTeamMember
	movs r6, r0
	beq _02024014
	add r0, sp, #0x4c
	add r1, r6, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0x4c
	str r0, [sp, #8]
	b _02024020
_02024014:
	ldrsh r0, [sp]
	bl GetNameString
	str r0, [sp, #8]
_02024020:
	add r3, sp, #0xc
	add r0, sp, #4
	add r1, sp, #8
	add r2, sp, #0x4c
	str r3, [sp, #4]
	bl sub_020206FC
	ldr r0, [sp, #4]
	mov r1, #0
	strb r1, [r0]
	cmp r6, #0
	beq _02024080
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0xc
	beq _02024070
	ldr r1, _020240A4 ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024070:
	ldr r1, _020240A8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024080:
	ldr r1, _020240AC ; =_02099D2C
	add r2, sp, #0xc
	mov r0, r4
	bl SprintfStatic__0202378C
_02024090:
	mov r0, r4
_02024094:
	add sp, sp, #0x8c
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020240A4: .word _02099D54
_020240A8: .word _02099D64
_020240AC: .word _02099D2C
	arm_func_end sub_02023FB4

	arm_func_start sub_020240B0
sub_020240B0: ; 0x020240B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _0202410C ; =ENTITIES
	mov r6, #0
	ldr r4, _02024110 ; =0x00000182
	b _020240FC
_020240CC:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020240F4
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020240F4:
	add r6, r6, #1
	add r5, r5, #0xc
_020240FC:
	cmp r6, r4
	blt _020240CC
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202410C: .word ENTITIES
_02024110: .word 0x00000182
	arm_func_end sub_020240B0

	arm_func_start sub_02024114
sub_02024114: ; 0x02024114
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02024170 ; =ENTITIES
	mov r6, #0
	ldr r4, _02024174 ; =0x00000182
	b _02024160
_02024130:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _02024158
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02024158:
	add r6, r6, #1
	add r5, r5, #0xc
_02024160:
	cmp r6, r4
	blt _02024130
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02024170: .word ENTITIES
_02024174: .word 0x00000182
	arm_func_end sub_02024114

	arm_func_start sub_02024178
sub_02024178: ; 0x02024178
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _020241D4 ; =ENTITIES
	mov r6, #0
	ldr r4, _020241D8 ; =0x00000182
	b _020241C4
_02024194:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020241BC
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023FB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020241BC:
	add r6, r6, #1
	add r5, r5, #0xc
_020241C4:
	cmp r6, r4
	blt _02024194
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020241D4: .word ENTITIES
_020241D8: .word 0x00000182
	arm_func_end sub_02024178

	arm_func_start sub_020241DC
sub_020241DC: ; 0x020241DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov ip, r1, lsl #0x10
	and lr, r1, #0x70000
	mov r4, r0
	cmp lr, #0x20000
	mov r5, ip, lsr #0x10
	bgt _02024220
	cmp lr, #0x20000
	bge _020242E0
	cmp lr, #0
	bgt _02024214
	beq _02024240
	b _020242E0
_02024214:
	cmp lr, #0x10000
	beq _0202426C
	b _020242E0
_02024220:
	cmp lr, #0x40000
	bgt _02024234
	bge _0202429C
	cmp lr, #0x30000
	b _020242E0
_02024234:
	cmp lr, #0x50000
	beq _020242AC
	b _020242E0
_02024240:
	tst r1, #0x80000
	movne r2, #1
	moveq r2, #0
	mov r1, r5, lsl #0x10
	and r3, r2, #0xff
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, #1
	bl GetItemNameFormatted
	mov r0, r4
	b _020242E4
_0202426C:
	strh r2, [sp, #0xc]
	mov ip, #0
	strb r3, [sp, #0xa]
	ldr r2, _020242EC ; =_02099CAC
	add r1, sp, #0xa
	strb ip, [sp, #0xb]
	strh r5, [sp, #0xe]
	mov r3, #1
	str ip, [sp]
	bl MaybeGetFormattedItemName
	mov r0, r4
	b _020242E4
_0202429C:
	mov r1, r5
	bl sub_0202507C
	mov r0, r4
	b _020242E4
_020242AC:
	mov r0, r5, lsl #0x10
	add r1, sp, #4
	mov r0, r0, asr #0x10
	bl sub_02065CD8
	mov ip, #0
	ldr r2, _020242F0 ; =_02099CB8
	add r1, sp, #4
	mov r0, r4
	mov r3, #1
	str ip, [sp]
	bl MaybeGetFormattedItemName
	mov r0, r4
	b _020242E4
_020242E0:
	ldr r0, _020242F4 ; =_02099D50
_020242E4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020242EC: .word _02099CAC
_020242F0: .word _02099CB8
_020242F4: .word _02099D50
	arm_func_end sub_020241DC

	arm_func_start sub_020242F8
sub_020242F8: ; 0x020242F8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r0, r2, lsr #0x10
	ands r1, r1, #0x30000
	beq _0202431C
	cmp r1, #0x10000
	beq _02024338
	b _02024350
_0202431C:
	bl GetMoveName
	mov r2, r0
	ldr r1, _02024358 ; =_02099D74
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024338:
	bl GetDungeonResultString
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024350:
	ldr r0, _0202435C ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024358: .word _02099D74
_0202435C: .word _02099D50
	arm_func_end sub_020242F8

	arm_func_start SetStringAccuracy
SetStringAccuracy: ; 0x02024360
#if defined(EUROPE)
#define SET_STRING_ACCURACY_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_ACCURACY_OFFSET 0x17FD
#else
#define SET_STRING_ACCURACY_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02024410 ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _02024408
	ldr r0, _02024414 ; =0x000029C1
	cmp r1, r0
	bhs _02024408
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveActualAccuracy
	mov r6, #1
	mov r3, #0
	ldr r2, _02024418 ; =MOVE_ACCURACY_STARS_TABLE
	b _020243B8
_020243A4:
	ldr r1, [r2, r3, lsl #2]
	cmp r0, r1
	blt _020243C0
	add r6, r6, #1
	add r3, r3, #1
_020243B8:
	cmp r3, #8
	blt _020243A4
_020243C0:
	cmp r6, #8
	ble _020243D8
	ldr r1, _0202441C ; =0x000027A0
	mov r0, r4
	bl GetStringFromFileVeneer
	b _02024400
_020243D8:
	mov r7, #0
	strb r7, [r4]
	ldr r5, _02024420 ; =_02099D84
	b _020243F8
_020243E8:
	mov r0, r4
	mov r1, r5
	bl strcat
	add r7, r7, #1
_020243F8:
	cmp r7, r6
	blt _020243E8
_02024400:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02024408:
	ldr r0, _02024424 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02024410: .word 0x000027A2 + SET_STRING_ACCURACY_OFFSET
_02024414: .word 0x000029C1 + SET_STRING_ACCURACY_OFFSET
_02024418: .word MOVE_ACCURACY_STARS_TABLE
_0202441C: .word 0x000027A0 + SET_STRING_ACCURACY_OFFSET
_02024420: .word _02099D84
_02024424: .word _02099D50
	arm_func_end SetStringAccuracy

	arm_func_start SetStringPower
SetStringPower: ; 0x02024428
#if defined(EUROPE)
#define SET_STRING_POWER_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_POWER_OFFSET 0x17FD
#else
#define SET_STRING_POWER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020244DC ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _020244D4
	ldr r0, _020244E0 ; =0x000029C1
	cmp r1, r0
	bhs _020244D4
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveBasePowerFromId
	mov r3, #0
	mov r5, r3
	ldr r2, _020244E4 ; =MOVE_POWER_STARS_TABLE
	b _02024480
_0202446C:
	ldr r1, [r2, r5, lsl #2]
	cmp r0, r1
	blt _02024488
	add r3, r3, #1
	add r5, r5, #1
_02024480:
	cmp r5, #6
	blt _0202446C
_02024488:
	cmp r3, #0
	bne _020244A0
	ldr r1, _020244E8 ; =0x000027A1
	mov r0, r4
	bl GetStringFromFileVeneer
	b _020244CC
_020244A0:
	mov r7, #0
	strb r7, [r4]
	add r5, r3, #2
	ldr r6, _020244EC ; =_02099D84
	b _020244C4
_020244B4:
	mov r0, r4
	mov r1, r6
	bl strcat
	add r7, r7, #1
_020244C4:
	cmp r7, r5
	blt _020244B4
_020244CC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020244D4:
	ldr r0, _020244F0 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020244DC: .word 0x000027A2 + SET_STRING_POWER_OFFSET
_020244E0: .word 0x000029C1 + SET_STRING_POWER_OFFSET
_020244E4: .word MOVE_POWER_STARS_TABLE
_020244E8: .word 0x000027A1 + SET_STRING_POWER_OFFSET
_020244EC: .word _02099D84
_020244F0: .word _02099D50
	arm_func_end SetStringPower

	arm_func_start sub_020244F4
sub_020244F4: ; 0x020244F4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r5, r0
	mov r4, r2, lsr #0x10
	ands r0, r1, #0x70000
	beq _0202451C
	cmp r0, #0x10000
	beq _02024564
	b _02024580
_0202451C:
#if defined(EUROPE)
	add r0, r1, #0xc3
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r1, #0x46
	add r0, r0, #0x4700
#else
	add r0, r1, #0xc1
	add r0, r0, #0x3400
#endif
	mov r1, r0, lsl #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	bl CopyStringFromId
	cmp r4, #0x11
	add r2, sp, #0
	bne _02024550
	ldr r1, _0202458C ; =_02099D8C
	mov r0, r5
	bl SprintfStatic__0202378C
	b _0202455C
_02024550:
	ldr r1, _02024590 ; =_02099D90
	mov r0, r5
	bl SprintfStatic__0202378C
_0202455C:
	mov r0, r5
	b _02024584
_02024564:
	mov r0, r4
	bl GetSize0x80Buffer2
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02024584
_02024580:
	ldr r0, _02024594 ; =_02099D50
_02024584:
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202458C: .word _02099D8C
_02024590: .word _02099D90
_02024594: .word _02099D50
	arm_func_end sub_020244F4

	arm_func_start sub_02024598
sub_02024598: ; 0x02024598
#ifdef EUROPE
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bmi _02024828
	bl GetLanguage
	mov r2, r0
	ldr r1, _0202484C ; =_020B05D4_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	mov r2, r4
	bl SprintfStatic__0202378C
	b _02024844
_02024828:
	bl GetLanguage
	mov r2, r0
	ldr r1, _02024850 ; =_020B05D8_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	rsb r2, r4, #0
	bl SprintfStatic__0202378C
_02024844:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202484C: .word _020B05D4_EU
_02024850: .word _020B05D8_EU
#else
	stmdb sp!, {r4, lr}
	movs r2, r1
	mov r4, r0
	bmi _020245B4
	ldr r1, _020245C8 ; =_02099DA0
	bl SprintfStatic__0202378C
	b _020245C0
_020245B4:
	ldr r1, _020245CC ; =_02099DB0
	rsb r2, r2, #0
	bl SprintfStatic__0202378C
_020245C0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020245C8: .word _02099DA0
_020245CC: .word _02099DB0
#endif
	arm_func_end sub_02024598

#ifdef EUROPE
	arm_func_start sub_02024854_EU
sub_02024854_EU: ; 0x02024854
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	ldr ip, [sp, #0x50]
	mov r6, r0
	mov r5, r1
	mov r4, r3
	cmp ip, #2
	bgt _02024884
	ldr r1, _020248DC ; =_02099DC0
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_02024884:
	and r0, r2, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r0, sp, #0
	beq _020248B8
	mov r1, r4
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_020248B8:
	rsb r1, r4, #0
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
_020248D4:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020248DC: .word _02099DC0
_020248E0: .word _0209A2D4_EU
	arm_func_end sub_02024854_EU
#endif

	arm_func_start sub_020245D0
sub_020245D0: ; 0x020245D0
#ifdef EUROPE
#define SUB_020245D0_STACK_OFFSET 4
#else
#define SUB_020245D0_STACK_OFFSET 0
#endif
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, r7, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#endif
	sub sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
	mov r3, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r7, r0
	mov r6, r2
	cmp r1, #0x20000
	mov r4, r3, lsr #0x10
	bgt _02024618
	cmp r1, #0x20000
	bge _020246A8
	cmp r1, #0
	bgt _0202460C
	beq _02024634
	b _02024918
_0202460C:
	cmp r1, #0x10000
	beq _02024744
	b _02024918
_02024618:
	cmp r1, #0x30000
	bgt _02024628
	beq _02024668
	b _02024918
_02024628:
	cmp r1, #0x40000
	beq _020248E4
	b _02024918
_02024634:
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024668:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_020246A8:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	cmp r6, #0
	mvnlt r0, #0
	mullt r0, r6, r0
	movlt r6, r0
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _02024704
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _0202473C
_02024704:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _0202472C
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _0202473C
_0202472C:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_0202473C:
#endif
	mov r0, r7
	b _0202491C
_02024744:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #1
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	mov r1, #0
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
_02024780:
	ldrb r2, [r3, r1]
	cmp r2, #0
	beq _02024888
	strb r2, [r0, r1]
	cmp r2, #0xa
	bne _02024880
	add r1, r1, #1
	mov r2, #0x5b
	strb r2, [r0, r1]
	add r2, r1, #1
	mov r3, #0x43
	strb r3, [r0, r2]
	add r2, r1, #2
	mov r3, #0x4c
	strb r3, [r0, r2]
	add r2, r1, #3
	mov r3, #0x55
	strb r3, [r0, r2]
	add r2, r1, #4
	mov r3, #0x4d
	strb r3, [r0, r2]
	add r2, r1, #5
	mov r3, #0x5f
	strb r3, [r0, r2]
	add r2, r1, #6
	mov r3, #0x53
	strb r3, [r0, r2]
	add r2, r1, #7
	mov r3, #0x45
	strb r3, [r0, r2]
	add r2, r1, #8
	mov r3, #0x54
	strb r3, [r0, r2]
	add r2, r1, #9
	mov r3, #0x3a
	strb r3, [r0, r2]
	add r2, r1, #0xa
	mov r3, #0x38
	strb r3, [r0, r2]
	add r2, r1, #0xb
	mov r3, #0x30
	strb r3, [r0, r2]
	add r2, r1, #0xc
	mov r3, #0x5d
	strb r3, [r0, r2]
	add ip, r1, #0xd
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
_02024840:
	ldrb r2, [r3, r1]
	add r1, r1, #1
	strb r2, [r0, ip]
	cmp r2, #0
	add ip, ip, #1
	bne _02024840
	mov r3, #0
	add r2, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	b _02024874
_02024868:
	ldrb r1, [r2, r3]
	strb r1, [r0, r3]
	add r3, r3, #1
_02024874:
	cmp r3, ip
	bne _02024868
	b _02024888
_02024880:
	add r1, r1, #1
	b _02024780
_02024888:
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _020248A4
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _020248DC
_020248A4:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _020248CC
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _020248DC
_020248CC:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_020248DC:
#endif
	mov r0, r7
	b _0202491C
_020248E4:
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024918:
	ldr r0, _02024930 ; =_02099D50
_0202491C:
	add sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
#ifdef EUROPE
	ldmia sp!, {r4, r5, r6, r7, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02024924: .word _02099DC0
#ifndef EUROPE
_02024928: .word _02099DD0
_0202492C: .word _02099DEC
#endif
_02024930: .word _02099D50
	arm_func_end sub_020245D0

	arm_func_start sub_02024934
sub_02024934: ; 0x02024934
	ldr ip, _02024948 ; =sub_0204F6F8
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bx ip
	.align 2, 0
_02024948: .word sub_0204F6F8
	arm_func_end sub_02024934

	arm_func_start sub_0202494C
sub_0202494C: ; 0x0202494C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	and r5, r1, #0xf0000
	mov r6, r0
	cmp r5, #0x20000
	mov r4, r2, lsr #0x10
	bgt _02024990
	cmp r5, #0x20000
	bge _020249F8
	cmp r5, #0
	bgt _02024984
	beq _020249F8
	b _02024A4C
_02024984:
	cmp r5, #0x10000
	beq _020249B0
	b _02024A4C
_02024990:
	cmp r5, #0x40000
	bgt _020249A8
	bge _020249B0
	cmp r5, #0x30000
	beq _020249B0
	b _02024A4C
_020249A8:
	cmp r5, #0x50000
	bne _02024A4C
_020249B0:
	cmp r5, #0x40000
	mov r0, #0
	bne _020249D0
	mov r2, r0
	mov r1, #0x25
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249D0:
	cmp r5, #0x50000
	bne _020249EC
	mov r1, #0x25
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249EC:
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r4, r0
_020249F8:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0206A90C
	mov r1, r0
	add r0, sp, #0
	bl GetStringFromFileVeneer
	cmp r5, #0x30000
	cmpne r5, #0x20000
	ldrne r0, _02024A58 ; =0x00000133
	add r2, sp, #0
	cmpne r4, r0
	bne _02024A38
	ldr r1, _02024A5C ; =_02099D8C
	mov r0, r6
	bl SprintfStatic__0202378C
	b _02024A44
_02024A38:
	ldr r1, _02024A60 ; =_02099DC0
	mov r0, r6
	bl SprintfStatic__0202378C
_02024A44:
	mov r0, r6
	b _02024A50
_02024A4C:
	ldr r0, _02024A64 ; =_02099D50
_02024A50:
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02024A58: .word 0x00000133
_02024A5C: .word _02099D8C
_02024A60: .word _02099DC0
_02024A64: .word _02099D50
	arm_func_end sub_0202494C

	arm_func_start sub_02024A68
sub_02024A68: ; 0x02024A68
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024A9C
#ifdef JAPAN
	add r1, r1, #0xc9
	add r1, r1, #0x200
#else
	add r1, r1, #0x79
	add r1, r1, #0xa00
#endif
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024A9C:
	ldr r0, _02024AA4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AA4: .word _02099D50
	arm_func_end sub_02024A68

	arm_func_start sub_02024AA8
sub_02024AA8: ; 0x02024AA8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024AE8
#ifdef JAPAN
	add r0, r0, #0xf5
	add r0, r0, #0x3e00
#else
	add r0, r0, #0x4d
	add r0, r0, #0xa00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024AE8:
	ldr r0, _02024AF0 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AF0: .word _02099D50
	arm_func_end sub_02024AA8

	arm_func_start GetRankString
GetRankString: ; 0x02024AF4
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B38
#ifdef JAPAN
	add r0, r0, #0x7f
	add r0, r0, #0x300
#else
	add r0, r0, #0x77
	add r0, r0, #0x100
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _02024B40 ; =_02099E08
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B38:
	ldr r0, _02024B44 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B40: .word _02099E08
_02024B44: .word _02099D50
	arm_func_end GetRankString

	arm_func_start sub_02024B48
sub_02024B48: ; 0x02024B48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B88
#if defined(EUROPE)
	add r0, r0, #0x71
	add r0, r0, #0x2700
#elif defined(JAPAN)
	add r0, r0, #0x79
	add r0, r0, #0x4900
#else
	add r0, r0, #0x6f
	add r0, r0, #0x2700
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B88:
	ldr r0, _02024B90 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B90: .word _02099D50
	arm_func_end sub_02024B48

	arm_func_start sub_02024B94
sub_02024B94: ; 0x02024B94
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024BCC
	and r0, r0, #0xff
	bl GetTypeStringId
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024BCC:
	ldr r0, _02024BD4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024BD4: .word _02099D50
	arm_func_end sub_02024B94

	arm_func_start sub_02024BD8
sub_02024BD8: ; 0x02024BD8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024C0C
	and r0, r0, #0xff
	bl GetIqSkillStringId
	mov r1, r0
	mov r0, r4
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024C0C:
	ldr r0, _02024C14 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C14: .word _02099D50
	arm_func_end sub_02024BD8

	arm_func_start sub_02024C18
sub_02024C18: ; 0x02024C18
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024C58
	add r0, sp, #0
	and r1, r1, #0xff
	bl GetAbilityString
	ldr r1, _02024C64 ; =_02099D8C
	add r2, sp, #0
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02024C5C
_02024C58:
	ldr r0, _02024C68 ; =_02099D50
_02024C5C:
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C64: .word _02099D8C
_02024C68: .word _02099D50
	arm_func_end sub_02024C18

	arm_func_start GetCurrentTeamNameString
GetCurrentTeamNameString: ; 0x02024C6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r4, r1
	mov r5, r0
	bl GetExecuteSpecialEpisodeType
	cmp r4, #2
	bne _02024C98
	mvn r1, #0
	cmp r0, r1
	moveq r4, #0
	movne r4, #1
_02024C98:
	cmp r4, #0
	beq _02024CAC
	cmp r4, #1
	beq _02024CFC
	b _02024D2C
_02024CAC:
	mvn r1, #0
	cmp r0, r1
	bne _02024CC8
	mov r0, #1
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02024CE8
_02024CC8:
	add r0, sp, #0
	bl GetMainTeamName
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024CE8:
	ldr r1, _02024D3C ; =0x00000237
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r5
	b _02024D30
_02024CFC:
	cmp r0, #3
	ldrne r0, _02024D40 ; =_02099D50
	bne _02024D30
	ldr r1, _02024D44 ; =0x00000236
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024D2C:
	ldr r0, _02024D40 ; =_02099D50
_02024D30:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02024D38: .word _02099E08
#ifdef JAPAN
_02024D3C: .word 0x000004C8
_02024D40: .word _02099D50
_02024D44: .word 0x000004C7
#else
_02024D3C: .word 0x00000237
_02024D40: .word _02099D50
_02024D44: .word 0x00000236
#endif
	arm_func_end GetCurrentTeamNameString

	arm_func_start sub_02024D48
sub_02024D48: ; 0x02024D48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024D70
	and r1, r1, #0xff
	bl sub_02058C30
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024D70:
	ldr r0, _02024D78 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024D78: .word _02099D50
	arm_func_end sub_02024D48

#ifdef EUROPE
	arm_func_start sub_02025010_EU
sub_02025010_EU: ; 0x02025010
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetLanguage
	ldr r2, _02025040 ; =_020B05C0_EU
	ldr r1, _02025044 ; =_0209A2F4_EU
	ldr r2, [r2, r0, lsl #2]
	mov r0, r5
	mov r3, r4
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025040: .word _020B05C0_EU
_02025044: .word _0209A2F4_EU
	arm_func_end sub_02025010_EU
#endif

	arm_func_start sub_02024D7C
sub_02024D7C: ; 0x02024D7C
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r2, r2, lsr #0x10
	ands r0, r1, #0xf0000
	beq _02024DD4
	cmp r0, #0x10000
	bne _02024DEC
	mov r0, r2, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGenderVeneer
	cmp r0, #1
	beq _02024DC0
	cmp r0, #2
	beq _02024DC8
	cmp r0, #3
	b _02024DD0
_02024DC0:
	mov r2, #0
	b _02024DD4
_02024DC8:
	mov r2, #1
	b _02024DD4
_02024DD0:
	mov r2, #2
_02024DD4:
	ldr r1, _02024DF4 ; =_022A5048
	mov r0, r4
	add r1, r1, r2, lsl #2
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024DEC:
	ldr r0, _02024DF8 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024DF4: .word _022A5048
_02024DF8: .word _02099D50
	arm_func_end sub_02024D7C

	arm_func_start GetBagNameString
GetBagNameString: ; 0x02024DFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetCurrentBagCapacity
	cmp r0, #2
	ldrlt r0, _02024E2C ; =0x000008E1
	ldrge r0, _02024E30 ; =0x000008E2
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02024E2C: .word 0x00001D39
_02024E30: .word 0x00001D3A
#else
_02024E2C: .word 0x000008E1
_02024E30: .word 0x000008E2
#endif
	arm_func_end GetBagNameString

	arm_func_start sub_02024E34
sub_02024E34: ; 0x02024E34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	sub sp, sp, #0x400
	mov sl, r0
	ldr r0, _02024F94 ; =0x000001B1
	mov r4, r1
	bl StringFromId
	str r0, [sp]
	ldr r0, _02024F98 ; =0x000001B2
	bl StringFromId
	ldr r1, _02024F9C ; =0x000029D1
	mov fp, r0
	cmp r4, r1
	blo _02024E94
	ldr r0, _02024FA0 ; =0x00002F49
	cmp r4, r0
	bhs _02024E94
	rsb r0, r1, #0
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemMoveId16
	mov r5, r0
	b _02024E98
_02024E94:
	mov r5, #0
_02024E98:
	mov r0, sl
#ifdef JAPAN
	mov r1, #0x3b8
#else
	mov r1, #0x1b0
#endif
	bl GetStringFromFileVeneer
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
	cmp r5, #0
	beq _02024F78
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _02024FA8 ; =_02099CA4
	mvn r4, #0
	ldrhi sb, _02024FAC ; =_02099CC4
	b _02024F6C
_02024ED0:
	ldrsh r6, [sb], #2
	mov r0, r6
	bl GetActorMatchingStorageId
	mov r7, r0
	cmp r6, #0x16
	bne _02024EF4
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
_02024EF4:
	cmp r7, r4
	beq _02024F6C
	mov r0, r7
	bl GetTeamMember
	ldrsh r8, [r0, #4]
	bl sub_0204E530
	cmp r0, #0
	bne _02024F2C
	mov r0, r7
	bl GetActiveRosterIndex
	cmp r0, r4
	beq _02024F2C
	bl GetActiveTeamMember
	ldrsh r8, [r0, #0xc]
_02024F2C:
	add r0, sp, #4
	mov r1, r6
	bl sub_02023DC0
	mov r0, r5
	mov r1, r8
	bl sub_02053D1C
	cmp r0, #0
	ldrne r3, [sp]
	ldr r1, _02024FB0 ; =_02099E20
	moveq r3, fp
	add r0, sp, #0x44
	add r2, sp, #4
	bl SprintfStatic__0202378C
	mov r0, sl
	add r1, sp, #0x44
	bl strcat
_02024F6C:
	ldrsh r0, [sb]
	cmp r0, r4
	bne _02024ED0
_02024F78:
	ldr r1, _02024FB4 ; =_02099E40
	mov r0, sl
	bl strcat
	mov r0, sl
	add sp, sp, #0x44
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02024F94: .word 0x000003B9
_02024F98: .word 0x000003BA
#else
_02024F94: .word 0x000001B1
_02024F98: .word 0x000001B2
#endif
#if defined(EUROPE)
_02024F9C: .word 0x000029D3
_02024FA0: .word 0x00002F4B
#elif defined(JAPAN)
_02024F9C: .word 0x000041CE
_02024FA0: .word 0x00004746
#else
_02024F9C: .word 0x000029D1
_02024FA0: .word 0x00002F49
#endif
_02024FA4: .word _02099E18
_02024FA8: .word _02099CA4
_02024FAC: .word _02099CC4
_02024FB0: .word _02099E20
_02024FB4: .word _02099E40
	arm_func_end sub_02024E34

	arm_func_start GetSize0x80Buffer
GetSize0x80Buffer: ; 0x02024FB8
	ldr r1, _02024FC4 ; =_022A5468
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FC4: .word _022A5468
	arm_func_end GetSize0x80Buffer

	arm_func_start GetSize0x80Buffer2
GetSize0x80Buffer2: ; 0x02024FC8
	ldr r1, _02024FD4 ; =_022A5068
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FD4: .word _022A5068
	arm_func_end GetSize0x80Buffer2

	arm_func_start GetDungeonResultString
GetDungeonResultString: ; 0x02024FD8
	ldr r1, _02024FE4 ; =_022A5268
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FE4: .word _022A5268
	arm_func_end GetDungeonResultString

	arm_func_start SubstitutePlaceholderItemTags
SubstitutePlaceholderItemTags: ; 0x02024FE8
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	beq _02025030
	mov r3, #0x14
	mul r3, r0, r3
	ldr lr, _02025070 ; =_022A596A
	ldrh r0, [r1]
	ldr ip, _02025074 ; =_022A5969
	add r4, lr, r3
	strh r0, [lr, r3]
	ldrh lr, [r1, #2]
	mov r0, #1
	add r5, ip, r3
	strh lr, [r4, #2]
	ldrh r1, [r1, #4]
	strh r1, [r4, #4]
	strb r0, [ip, r3]
	b _02025048
_02025030:
	mov r1, #0x14
	mul r3, r0, r1
	ldr r1, _02025074 ; =_022A5969
	mov r0, #0
	strb r0, [r1, r3]
	add r5, r1, r3
_02025048:
	cmp r2, #0
	moveq r0, #0
	beq _02025068
	ldr ip, _02025078 ; =_022A5970
	ldmia r2, {r0, r1, r2}
	add r3, ip, r3
	stmia r3, {r0, r1, r2}
	mov r0, #1
_02025068:
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025070: .word _022A596A
_02025074: .word _022A5969
_02025078: .word _022A5970
	arm_func_end SubstitutePlaceholderItemTags

	arm_func_start sub_0202507C
sub_0202507C: ; 0x0202507C
	stmdb sp!, {r3, lr}
	mov r2, #0x14
	mul r3, r1, r2
	ldr r1, _020250D8 ; =_022A5969
	ldrb r1, [r1, r3]
	cmp r1, #0
	beq _020250BC
	ldr r1, _020250DC ; =_022A596A
	ldr r2, _020250E0 ; =_022A5970
	mov ip, #0
	add r1, r1, r3
	add r2, r2, r3
	mov r3, #1
	str ip, [sp]
	bl MaybeGetFormattedItemName
	ldmia sp!, {r3, pc}
_020250BC:
	ldr r1, _020250DC ; =_022A596A
	mov r2, #0
	add r1, r1, r3
	mov r3, #1
	str r2, [sp]
	bl MaybeGetFormattedItemName
	ldmia sp!, {r3, pc}
	.align 2, 0
_020250D8: .word _022A5969
_020250DC: .word _022A596A
_020250E0: .word _022A5970
	arm_func_end sub_0202507C
