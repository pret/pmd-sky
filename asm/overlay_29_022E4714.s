	.include "asm/macros.inc"
	.include "overlay_29_022E4714.inc"

	.text

	arm_func_start ov29_022E4714
ov29_022E4714: ; 0x022E4714
	bx lr
	arm_func_end ov29_022E4714

	arm_func_start ov29_022E4718
ov29_022E4718: ; 0x022E4718
	bx lr
	arm_func_end ov29_022E4718

	arm_func_start ov29_022E471C
ov29_022E471C: ; 0x022E471C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4768 ; =0x00000131
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4768 ; =0x00000131
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4768: .word 0x00000131
	arm_func_end ov29_022E471C

	arm_func_start ov29_022E476C
ov29_022E476C: ; 0x022E476C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x30
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x30
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E476C

	arm_func_start ov29_022E47B8
ov29_022E47B8: ; 0x022E47B8
	bx lr
	arm_func_end ov29_022E47B8

	arm_func_start ov29_022E47BC
ov29_022E47BC: ; 0x022E47BC
	bx lr
	arm_func_end ov29_022E47BC

	arm_func_start ov29_022E47C0
ov29_022E47C0: ; 0x022E47C0
	bx lr
	arm_func_end ov29_022E47C0

	arm_func_start ov29_022E47C4
ov29_022E47C4: ; 0x022E47C4
	bx lr
	arm_func_end ov29_022E47C4

	arm_func_start ov29_022E47C8
ov29_022E47C8: ; 0x022E47C8
	bx lr
	arm_func_end ov29_022E47C8

	arm_func_start ov29_022E47CC
ov29_022E47CC: ; 0x022E47CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r1
	mov r1, #0xe
	mov r4, r0
	bl MonsterIsType
	cmp r0, #0
	beq _022E4828
	mov r0, r5
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, r5
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	b _022E4860
_022E4828:
	mov r0, #0xe
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xe
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
_022E4860:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022E47CC

	arm_func_start ov29_022E4868
ov29_022E4868: ; 0x022E4868
	bx lr
	arm_func_end ov29_022E4868

	arm_func_start ov29_022E486C
ov29_022E486C: ; 0x022E486C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x41
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x41
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E486C

	arm_func_start ov29_022E48B8
ov29_022E48B8: ; 0x022E48B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4910 ; =0x0000011E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x11c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r4
	mov r1, #0x20c
	bl PlaySeByIdIfShouldDisplayEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4910: .word 0x0000011E
	arm_func_end ov29_022E48B8

	arm_func_start ov29_022E4914
ov29_022E4914: ; 0x022E4914
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4960 ; =0x000001AE
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x1ac
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4960: .word 0x000001AE
	arm_func_end ov29_022E4914

	arm_func_start ShowPpRestoreEffect
ShowPpRestoreEffect: ; 0x022E4964
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E49B0 ; =0x000001B1
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E49B0 ; =0x000001B1
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E49B0: .word 0x000001B1
	arm_func_end ShowPpRestoreEffect

	arm_func_start ov29_022E49B4
ov29_022E49B4: ; 0x022E49B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A00 ; =0x000001A9
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4A00 ; =0x000001A9
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A00: .word 0x000001A9
	arm_func_end ov29_022E49B4

	arm_func_start ov29_022E4A04
ov29_022E4A04: ; 0x022E4A04
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4A50 ; =0x00000192
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4A50: .word 0x00000192
	arm_func_end ov29_022E4A04

	arm_func_start ov29_022E4A54
ov29_022E4A54: ; 0x022E4A54
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4AA0 ; =0x0000018E
	bl GetEffectAnimationField0x19
	mov r2, r0
	mov ip, #0
	mov r1, #2
	stmia sp, {r1, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	and r3, r2, #0xff
	mov r0, r4
	add r1, r1, #0x18c
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4AA0: .word 0x0000018E
	arm_func_end ov29_022E4A54

	arm_func_start ov29_022E4AA4
ov29_022E4AA4: ; 0x022E4AA4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x190
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x190
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AA4

	arm_func_start ov29_022E4AF0
ov29_022E4AF0: ; 0x022E4AF0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x15
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x15
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4AF0

	arm_func_start ov29_022E4B3C
ov29_022E4B3C: ; 0x022E4B3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, _022E4B88 ; =0x00000171
	bl GetEffectAnimationField0x19
	mov r2, r0
	and r3, r2, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	ldr r1, _022E4B88 ; =0x00000171
	mov r0, r4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022E4B88: .word 0x00000171
	arm_func_end ov29_022E4B3C
