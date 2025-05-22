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

	arm_func_start ExclusiveItemEffectIsActive__0231A87C
ExclusiveItemEffectIsActive__0231A87C: ; 0x0231A87C
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
#ifdef JAPAN
	add r0, r2, #0x224
#else
	add r0, r2, #0x228
#endif
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__0231A87C

	arm_func_start ov29_0231A8A0
ov29_0231A8A0: ; 0x0231A8A0
#ifdef JAPAN
#define OV29_0231A8A0_OFFSET -4
#else
#define OV29_0231A8A0_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sb, r0
	mov r7, #0
	bl IsMonster__0231A9D4
	cmp r0, #0
	beq _0231A910
	ldr r0, _0231A9CC ; =DUNGEON_PTR
	ldr r4, [sb, #0xb4]
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreMovesEnabled
	cmp r0, #0
	bne _0231A8EC
	ldr r1, _0231A9D0 ; =0x00000DFD
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _0231A9C4
_0231A8EC:
	mov r1, r7
	mov r0, sb
	strb r1, [r4, #0x23f + OV29_0231A8A0_OFFSET]
	bl ShouldUsePp
	cmp r0, #0
	movne r7, #1
	strneb r7, [r4, #0x23f + OV29_0231A8A0_OFFSET]
	mov r0, #0
	strb r0, [r4, #0x23e + OV29_0231A8A0_OFFSET]
_0231A910:
	mov r6, #0
	mov r4, #1
	mov r5, r6
	mov sl, r4
	b _0231A970
_0231A924:
	ldr r8, [sb, #0xb4]
	mov r0, sb
	str r5, [sp]
	ldrb r1, [r8, #0x4e]
	mov r2, r4
	mov r3, r5
	bl ov29_0232145C
	mov r0, sb
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _0231A984
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r8, #0x23e + OV29_0231A8A0_OFFSET]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x163 + OV29_0231A8A0_OFFSET]
	cmpeq r0, #0
	bne _0231A984
	add r6, r6, #1
_0231A970:
	mov r0, sb
	mov r1, sl
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _0231A924
_0231A984:
	mov r0, sb
	bl EntityIsValid__02319F8C
	cmp r0, #0
	beq _0231A9BC
	cmp r7, #0
	moveq r1, #1
	movne r1, #0
	ldr r4, [sb, #0xb4]
	mov r0, sb
	and r1, r1, #0xff
	bl UpdateMovePp
	ldrb r1, [r4, #0x4e]
	mov r0, sb
	bl ov29_022FA574
_0231A9BC:
	mov r0, sb
	bl TryActivateTruant
_0231A9C4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231A9CC: .word DUNGEON_PTR
#ifdef JAPAN
_0231A9D0: .word 0x00000B3D
#else
_0231A9D0: .word 0x00000DFD
#endif
	arm_func_end ov29_0231A8A0
