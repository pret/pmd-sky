	.include "asm/macros.inc"
	.include "overlay_29_022E6798.inc"

	.text

	arm_func_start ov29_022E6798
ov29_022E6798: ; 0x022E6798
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0x18
	bl GetEffectAnimationWanOffset
	mov r1, r0
	and r3, r1, #0xff
	mov r0, #2
	mov ip, #0
	stmia sp, {r0, ip}
	sub r0, ip, #1
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0x18
	mov r2, #1
	str ip, [sp, #0xc]
	bl PlayEffectAnimationEntity
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022E6798

	arm_func_start ov29_022E67E4
ov29_022E67E4: ; 0x022E67E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r4, r2
	mov r5, #0x200
	bl ShouldDisplayEntityAdvanced
	cmp r0, #0
	beq _022E68AC
	mov r0, r7
	bl GetEffectAnimationWanOffset
	mov r3, r0
	mov r0, #2
	mov r2, #0
	stmia sp, {r0, r2}
	sub r0, r2, #1
	str r0, [sp, #8]
	mov r0, r6
	mov r1, r7
	and r3, r3, #0xff
	str r2, [sp, #0xc]
	bl PlayEffectAnimationEntity
	mov r0, r4
	mov r1, #0x42
	bl ov29_022EA370
	mov r4, #0x42
	ldr sb, _022E68B4 ; =DUNGEON_PTR
	ldr r7, _022E68B8 ; =0x0001A226
	mvn r8, #7
	b _022E6894
_022E6860:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6, #0x1c]
	add r2, r0, r5
	str r2, [r6, #0x1c]
	ldr r0, [sb]
	ldr r1, [r6, #0x10]
	ldrsh r0, [r0, r7]
	sub r1, r1, r2
	add r5, r5, #0x100
	rsb r0, r0, r1, asr #8
	cmp r0, r8
	blt _022E68A0
_022E6894:
	ldr r0, [r6, #0x1c]
	cmp r0, #0xc800
	blt _022E6860
_022E68A0:
	mov r0, #0
	strb r0, [r6, #0x20]
	bl AnimationDelayOrSomething
_022E68AC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022E68B4: .word DUNGEON_PTR
#ifdef JAPAN
_022E68B8: .word 0x0001A182
#else
_022E68B8: .word 0x0001A226
#endif
	arm_func_end ov29_022E67E4
