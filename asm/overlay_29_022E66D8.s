	.include "asm/macros.inc"
	.include "overlay_29_022E66D8.inc"

	.text

	arm_func_start ov29_022E66D8
ov29_022E66D8: ; 0x022E66D8
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
	arm_func_end ov29_022E66D8

	arm_func_start ov29_022E6724
ov29_022E6724: ; 0x022E6724
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x1b4
	bl GetEffectAnimationField0x19
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x1b4
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6724
