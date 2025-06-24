	.include "asm/macros.inc"
	.include "overlay_29_0230F840.inc"

	.text

	arm_func_start TeamMemberHasExclusiveItemEffectActive
TeamMemberHasExclusiveItemEffectActive: ; 0x0230F840
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, #0
	ldr r5, _0230F8A8 ; =DUNGEON_PTR
	b _0230F898
_0230F854:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValid__0230F008
	cmp r0, #0
	beq _0230F88C
	mov r0, r7
	mov r1, r4
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0230F88C:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230F898:
	cmp r6, #4
	blt _0230F854
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230F8A8: .word DUNGEON_PTR
	arm_func_end TeamMemberHasExclusiveItemEffectActive
