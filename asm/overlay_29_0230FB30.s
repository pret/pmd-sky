	.include "asm/macros.inc"
	.include "overlay_29_0230FB30.inc"

	.text

	arm_func_start ov29_0230FB30
ov29_0230FB30: ; 0x0230FB30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230FB88 ; =ov29_023529A8
	mov r5, r0
	ldrh r2, [r1]
	add r0, sp, #0
	strh r2, [sp]
	ldrh r1, [r1, #2]
	strh r1, [sp, #2]
	bl ov29_02347184
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0230FB8C ; =0x00000F62
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FB88: .word ov29_023529A8
#ifdef JAPAN
_0230FB8C: .word 0x000009B6
#else
_0230FB8C: .word 0x00000F62
#endif
	arm_func_end ov29_0230FB30
