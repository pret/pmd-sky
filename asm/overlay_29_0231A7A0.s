	.include "asm/macros.inc"
	.include "overlay_29_0231A7A0.inc"

	.text

	arm_func_start ShouldUsePp
ShouldUsePp: ; 0x0231A7A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r1, #0x52
	mov r7, r0
	mov r5, r4
	mov r6, r4
	bl ExclusiveItemEffectIsActive__0231A87C
	cmp r0, #0
	mov r0, r7
	mov r1, #0x1f
	movne r4, #1
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #1
	cmp r5, #0
	beq _0231A81C
	ldr r0, _0231A870 ; =ov10_022C459C
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0231A81C
	mov r0, r7
	bl PlayExclamationPointEffect__022E4880
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231A874 ; =0x00000DF5
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r6, #1
_0231A81C:
	cmp r6, #0
	bne _0231A868
	cmp r4, #0
	beq _0231A868
	ldr r0, _0231A870 ; =ov10_022C459C
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0231A868
	mov r0, r7
	bl PlayExclamationPointEffect__022E4880
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231A878 ; =0x00000DF7
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	mov r6, #1
_0231A868:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0231A870: .word ov10_022C459C
#ifdef JAPAN
_0231A874: .word 0x00000B35
_0231A878: .word 0x00000B37
#else
_0231A874: .word 0x00000DF5
_0231A878: .word 0x00000DF7
#endif
	arm_func_end ShouldUsePp
