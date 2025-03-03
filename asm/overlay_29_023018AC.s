	.include "asm/macros.inc"
	.include "overlay_29_023018AC.inc"

	.text

	arm_func_start ov29_023018AC
ov29_023018AC: ; 0x023018AC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0xb4]
	ldr r5, [r1, #0xb4]
	ldrb r0, [r4, #0xbc]
	cmp r0, #7
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
#ifndef JAPAN
	cmpne r0, #3
#endif
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0xbc]
	cmp r0, #7
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #9]
	cmp r0, #0
#ifndef JAPAN
	cmpne r0, #3
#endif
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #6]
	ldrb r0, [r5, #6]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
#ifdef JAPAN
	and r0, r0, #0xff
#endif
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_023018AC

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

	arm_func_start DefenderAbilityIsActive__02301A0C
DefenderAbilityIsActive__02301A0C: ; 0x02301A0C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	cmp r6, r5
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
#endif
	beq _02301A50
	bl IsMonster__02301A60
	cmp r0, #0
#ifdef JAPAN
	beq _02301A50
	mov r0, r6
#else
	cmpne r4, #0
	beq _02301A50
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActive
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_02301A50:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActive
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02301A50:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActive
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__02301A0C
