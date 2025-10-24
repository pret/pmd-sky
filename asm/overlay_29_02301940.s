	.include "asm/macros.inc"
	.include "overlay_29_02301940.inc"

	.text

	arm_func_start SafeguardIsActive
SafeguardIsActive: ; 0x02301940
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r3, [r4, #0xb4]
	mov r5, r0
	ldrb r0, [r3, #0xd5]
	cmp r0, #2
	bne _02301988
	cmp r2, #0
	beq _02301980
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02301990 ; =0x00000C36
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_02301980:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02301988:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_02301990: .word 0x00000975
#else
_02301990: .word 0x00000C36
#endif
	arm_func_end SafeguardIsActive

	arm_func_start LeafGuardIsActive
LeafGuardIsActive: ; 0x02301994
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetApparentWeather
	cmp r0, #1
	bne _02301A00
	mov r0, r6
	mov r1, r5
	mov r2, #0x7b
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__02301A0C
	cmp r0, #0
	beq _02301A00
	cmp r4, #0
	beq _023019F8
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _02301A08 ; =0x00000C37
	mov r0, r6
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUserTarget
_023019F8:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02301A00:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
_02301A08: .word 0x00000976
#else
_02301A08: .word 0x00000C37
#endif
	arm_func_end LeafGuardIsActive
