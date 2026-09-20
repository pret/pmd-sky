	.include "asm/macros.inc"
	.include "overlay_29_022E465C.inc"

	.text

	arm_func_start ov29_022E465C
ov29_022E465C: ; 0x022E465C
	bx lr
	arm_func_end ov29_022E465C

	arm_func_start ov29_022E4660
ov29_022E4660: ; 0x022E4660
	bx lr
	arm_func_end ov29_022E4660

	arm_func_start ov29_022E4664
ov29_022E4664: ; 0x022E4664
	bx lr
	arm_func_end ov29_022E4664

	arm_func_start ov29_022E4668
ov29_022E4668: ; 0x022E4668
	bx lr
	arm_func_end ov29_022E4668

	arm_func_start ov29_022E466C
ov29_022E466C: ; 0x022E466C
	bx lr
	arm_func_end ov29_022E466C

	arm_func_start ov29_022E4670
ov29_022E4670: ; 0x022E4670
	bx lr
	arm_func_end ov29_022E4670

	arm_func_start ov29_022E4674
ov29_022E4674: ; 0x022E4674
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x21
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x21
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E4674
