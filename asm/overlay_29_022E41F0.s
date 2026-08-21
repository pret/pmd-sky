	.include "asm/macros.inc"
	.include "overlay_29_022E41F0.inc"

	.text

	arm_func_start ov29_022E41F0
ov29_022E41F0: ; 0x022E41F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E423C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E423C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E423C: .word 0x000001A7
	arm_func_end ov29_022E41F0

	arm_func_start PlayParalysisEffect
PlayParalysisEffect: ; 0x022E4240
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E428C ; =0x000001A7
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E428C ; =0x000001A7
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E428C: .word 0x000001A7
	arm_func_end PlayParalysisEffect

	arm_func_start ov29_022E4290
ov29_022E4290: ; 0x022E4290
	bx lr
	arm_func_end ov29_022E4290

	arm_func_start ov29_022E4294
ov29_022E4294: ; 0x022E4294
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x4c
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x4c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4294

	arm_func_start ov29_022E42E0
ov29_022E42E0: ; 0x022E42E0
	bx lr
	arm_func_end ov29_022E42E0

	arm_func_start ov29_022E42E4
ov29_022E42E4: ; 0x022E42E4
	bx lr
	arm_func_end ov29_022E42E4

	arm_func_start PlayEffectAnimationEntityStandard
PlayEffectAnimationEntityStandard: ; 0x022E42E8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r5
	mov r1, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PlayEffectAnimationEntityStandard
