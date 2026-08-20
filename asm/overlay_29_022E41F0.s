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

	arm_func_start ov29_022E4338
ov29_022E4338: ; 0x022E4338
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4384 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4384 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4384: .word 0x000001A9
	arm_func_end ov29_022E4338

	arm_func_start ov29_022E4388
ov29_022E4388: ; 0x022E4388
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E43D4 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E43D4: .word 0x0000013A
	arm_func_end ov29_022E4388

	arm_func_start ov29_022E43D8
ov29_022E43D8: ; 0x022E43D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4424 ; =0x0000013A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4424: .word 0x0000013A
	arm_func_end ov29_022E43D8

	arm_func_start ov29_022E4428
ov29_022E4428: ; 0x022E4428
	bx lr
	arm_func_end ov29_022E4428

	arm_func_start ov29_022E442C
ov29_022E442C: ; 0x022E442C
	bx lr
	arm_func_end ov29_022E442C

	arm_func_start ov29_022E4430
ov29_022E4430: ; 0x022E4430
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E447C ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E447C ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E447C: .word 0x00000171
	arm_func_end ov29_022E4430

	arm_func_start ov29_022E4480
ov29_022E4480: ; 0x022E4480
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #7
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #7
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4480

	arm_func_start PlaySpeedUpEffect
PlaySpeedUpEffect: ; 0x022E44CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4518 ; =0x0000018B
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4518 ; =0x0000018B
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4518: .word 0x0000018B
	arm_func_end PlaySpeedUpEffect

	arm_func_start PlaySpeedDownEffect
PlaySpeedDownEffect: ; 0x022E451C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4568 ; =0x0000018A
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x188
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4568: .word 0x0000018A
	arm_func_end PlaySpeedDownEffect

	arm_func_start ov29_022E456C
ov29_022E456C: ; 0x022E456C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #5
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #5
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E456C
