	.include "asm/macros.inc"
	.include "overlay_29_022EE36C.inc"

	.text

	arm_func_start ApplyMudTrapEffect
ApplyMudTrapEffect: ; 0x022EE36C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	movs r4, r1
	mov r5, r0
	beq _022EE424
	mov r0, #0x64
	bl DungeonRandInt
	cmp r0, #0x19
	mov ip, #1
	mov r3, #3
	bge _022EE3B8
	ldr r0, _022EE42C ; =ATK_STAT_IDX
	str ip, [sp]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerOffensiveStat
	b _022EE424
_022EE3B8:
	cmp r0, #0x32
	bge _022EE3E0
	ldr r0, _022EE430 ; =SPATK_STAT_IDX
	str ip, [sp]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerOffensiveStat
	b _022EE424
_022EE3E0:
	cmp r0, #0x4b
	bge _022EE408
	ldr r0, _022EE42C ; =ATK_STAT_IDX
	str ip, [sp]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerDefensiveStat
	b _022EE424
_022EE408:
	ldr r0, _022EE430 ; =SPATK_STAT_IDX
	str ip, [sp]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	str ip, [sp, #4]
	bl LowerDefensiveStat
_022EE424:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EE42C: .word ATK_STAT_IDX
_022EE430: .word SPATK_STAT_IDX
	arm_func_end ApplyMudTrapEffect

	arm_func_start ApplyStickyTrapEffect
ApplyStickyTrapEffect: ; 0x022EE434
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xcc
	mov sb, r1
	mov sl, r0
	mov r0, sb
	mov r1, #0x15
	ldr r7, [sb, #0xb4]
	bl ItemIsActive__022EE318
	cmp r0, #0
	beq _022EE470
#ifdef JAPAN
	ldr r2, _022EFC78 ; =0x00000BA2
	mov r0, sl
	mov r1, sb
#else
	mov r0, sl
	mov r1, sb
	mov r2, #0xe60
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EE610
_022EE470:
	ldrb r0, [r7, #7]
	mvn r4, #0
	mov r5, #0
	cmp r0, #0
	beq _022EE508
	ldr fp, _022EE618 ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r5
_022EE48C:
	mov r0, #6
	mul r8, r6, r0
	ldr r0, [fp]
	ldr r0, [r0, #0x384]
	add r1, r0, r8
	ldrb r0, [r0, r8]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022EE4FC
	ldrsh r0, [r1, #4]
	bl IsNotMoney
	cmp r0, #0
	beq _022EE4FC
	ldr r0, [fp]
	ldr r0, [r0, #0x384]
	add r1, r0, r8
	ldrb r0, [r0, r8]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldreqb r0, [r1, #1]
	cmpeq r0, #0
	addeq r0, sp, #0
	streq r1, [r0, r5, lsl #2]
	addeq r5, r5, #1
_022EE4FC:
	add r6, r6, #1
	cmp r6, #0x32
	blt _022EE48C
_022EE508:
	ldrb r0, [r7, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022EE558
	ldrsh r0, [r7, #0x66]
	bl IsNotMoney
	cmp r0, #0
	beq _022EE558
	ldrb r0, [r7, #0x62]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addeq r0, sp, #0
	addeq r1, r7, #0x62
	moveq r4, r5
	streq r1, [r0, r5, lsl #2]
	addeq r5, r5, #1
_022EE558:
	cmp r5, #0
	bne _022EE574
	ldr r2, _022EE61C ; =0x00000E5F
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EE610
_022EE574:
	mov r0, r5
	bl DungeonRandInt
	mov r5, r0
	add r1, sp, #0
	ldr r1, [r1, r5, lsl #2]
	mov r0, #0
	bl ov29_02344B44
	add r0, sp, #0
	ldr r1, [r0, r5, lsl #2]
	ldrb r0, [r1]
	orr r0, r0, #8
	strb r0, [r1]
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _022EE5E8
	cmp r5, r4
	bne _022EE5C4
	mov r1, #8
	bl SetFlagsForHeldItemInBag
	b _022EE5E8
_022EE5C4:
#ifdef JAPAN
	sub r2, r0, #1
	mov r0, #0x23c
	ldr r1, _022EE620 ; =DUNGEON_PTR
	mul r3, r2, r0
	ldr r0, [r1]
	add r0, r0, #0x56
	add r1, r0, #0x800
	ldrb r0, [r1, r3]
	orr r0, r0, #8
	strb r0, [r1, r3]
#else
	ldr r1, _022EE620 ; =DUNGEON_PTR
	sub r0, r0, #1
	ldr r2, [r1]
	add r1, r0, r0, lsl #3
	add r0, r2, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1, lsl #6]
	orr r0, r0, #8
	strb r0, [r2, r1, lsl #6]
#endif
_022EE5E8:
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	ldr r1, _022EE624 ; =0x00000309
	mov r0, sb
	bl ov29_022E56A0
#ifdef JAPAN
	mov r0, sl
	mov r1, sb
	mov r2, #0xba0
#else
	ldr r2, _022EE628 ; =0x00000E5E
	mov r0, sl
	mov r1, sb
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	bl ov29_022E8104
	bl ov29_022E81F8
_022EE610:
	add sp, sp, #0xcc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022EFC78: .word 0x00000BA2
_022EE618: .word BAG_ITEMS_PTR_MIRROR
_022EE61C: .word 0x00000BA1
_022EE620: .word DUNGEON_PTR
_022EE624: .word 0x00000309
#else
_022EE618: .word BAG_ITEMS_PTR_MIRROR
_022EE61C: .word 0x00000E5F
_022EE620: .word DUNGEON_PTR
_022EE624: .word 0x00000309
_022EE628: .word 0x00000E5E
#endif
	arm_func_end ApplyStickyTrapEffect

	arm_func_start ApplyGrimyTrapEffect
ApplyGrimyTrapEffect: ; 0x022EE62C
#ifdef JAPAN
#define APPLY_GRIMY_TRAP_EFFECT_OFFSET 4
#else
#define APPLY_GRIMY_TRAP_EFFECT_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xd8
	movs sl, r1
	mov fp, r0
	mov r5, #0
	beq _022EE800
	ldr r2, [sl, #0xb4]
	sub r0, r5, #1
	ldrb r1, [r2, #7]
	mov r4, r5
	str r0, [sp, #4]
	cmp r1, #0
	beq _022EE6C0
	ldr r0, _022EE808 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, r5
	ldr r6, [r0]
	mov lr, r5
	ldr r3, [r6, #0x384]
	mov r0, #1
	add sb, sp, #8
	mov r8, #6
_022EE680:
	mul r7, r1, r8
	ldrb ip, [r3, r7]
	tst ip, #1
	movne ip, r0
	moveq ip, lr
	tst ip, #0xff
	beq _022EE6B4
	ldr ip, [r6, #0x384]
	add ip, ip, r7
	ldrb r7, [ip, #1]
	cmp r7, #0
	streq ip, [sb, r4, lsl #2]
	addeq r4, r4, #1
_022EE6B4:
	add r1, r1, #1
	cmp r1, #0x32
	blt _022EE680
_022EE6C0:
	ldrb r0, [r2, #0x62]
	mov sb, #0
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, sp, #8
	addne r1, r2, #0x62
	strne r1, [r0, r4, lsl #2]
	ldr r0, _022EE80C ; =ov10_022C4434
	strne r4, [sp, #4]
	ldrsh r0, [r0]
	addne r4, r4, #1
	str r0, [sp]
	b _022EE7B0
_022EE6FC:
	add r0, sp, #8
	ldr r7, [r0, sb, lsl #2]
	ldrsh r0, [r7, #4]
	bl GetItemCategoryVeneer
	cmp r0, #3
	bne _022EE7AC
	ldrsh r0, [r7, #4]
	cmp r0, #0x6f
	beq _022EE7AC
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, [sp]
	cmp r0, r1
	bge _022EE7AC
	add r0, sp, #8
	ldr r8, [r0, sb, lsl #2]
	mov r1, #0x6f
	ldrb r6, [r8, #1]
	mov r0, r8
	mov r2, #2
	add r5, r5, #1
	bl GenerateStandardItem
	cmp r6, #0
	beq _022EE7AC
	ldr r0, [sp, #4]
	strb r6, [r7, #1]
	cmp sb, r0
	bne _022EE77C
	add r0, sp, #8
	ldr r0, [r0, sb, lsl #2]
	bl TransmuteHeldItemInBag
	b _022EE7AC
_022EE77C:
	ldr r0, _022EE810 ; =DUNGEON_PTR
	ldrb r2, [r8, #1]
	ldr r3, [r0]
#ifdef JAPAN
	mov r0, #0x23c
	mla r0, r2, r0, r3
	ldrh r1, [r8]
#else
	ldrh r1, [r8]
	add r0, r2, r2, lsl #3
	add r0, r3, r0, lsl #6
#endif
	add r0, r0, #0x600
	strh r1, [r0, #0x16 + APPLY_GRIMY_TRAP_EFFECT_OFFSET]
	ldrh r1, [r8, #2]
	strh r1, [r0, #0x18 + APPLY_GRIMY_TRAP_EFFECT_OFFSET]
	ldrh r1, [r8, #4]
	strh r1, [r0, #0x1a + APPLY_GRIMY_TRAP_EFFECT_OFFSET]
_022EE7AC:
	add sb, sb, #1
_022EE7B0:
	cmp sb, r4
	blt _022EE6FC
	cmp r5, #0
	bne _022EE7D4
	ldr r2, _022EE814 ; =0x00000E63
	mov r0, fp
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EE800
_022EE7D4:
	cmp r5, #1
	bne _022EE7F0
	ldr r2, _022EE818 ; =0x00000E61
	mov r0, fp
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EE800
_022EE7F0:
	ldr r2, _022EE81C ; =0x00000E62
	mov r0, fp
	mov r1, sl
	bl LogMessageByIdWithPopupCheckUserTarget
_022EE800:
	add sp, sp, #0xd8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE808: .word BAG_ITEMS_PTR_MIRROR
_022EE80C: .word ov10_022C4434
_022EE810: .word DUNGEON_PTR
#ifdef JAPAN
_022EE814: .word 0x00000BA5
_022EE818: .word 0x00000BA3
_022EE81C: .word 0x00000BA4
#else
_022EE814: .word 0x00000E63
_022EE818: .word 0x00000E61
_022EE81C: .word 0x00000E62
#endif
	arm_func_end ApplyGrimyTrapEffect

	arm_func_start ApplyPitfallTrapEffect
ApplyPitfallTrapEffect: ; 0x022EE820
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
#ifdef JAPAN
	movs r6, r1
	mov r7, r0
	mov r5, r2
#else
	movs r7, r1
	mov r8, r0
	mov r6, r2
	mov r5, r3
#endif
	mov r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _022EE980 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreLateGameTrapsEnabled
	cmp r0, #0
	bne _022EE868
	ldr r1, _022EE984 ; =0x00000E64
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022EE868:
#ifdef JAPAN
	mov r0, r6
	ldr r8, [r6, #0xb4]
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _022EE8AC
	mov r0, r5
	mov r1, #0x20
	bl ov29_022EF478
	mov r0, r6
#else
	cmp r5, #0
	ldr r5, [r7, #0xb4]
	bne _022EE8AC
	mov r0, r7
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _022EE8AC
	mov r0, r6
	mov r1, #0x20
	bl ov29_022EF478
	mov r0, r7
#endif
	mov r1, #0x308
	mov r4, #1
	bl ov29_022E56A0
	mov r0, #0x1e
	mov r1, #0x48
	bl ov29_022EA370
_022EE8AC:
#ifdef JAPAN
	ldrb r0, [r8, #7]
#else
	ldrb r0, [r5, #7]
#endif
	cmp r0, #0
	beq _022EE91C
	bl GetFloorType
	cmp r0, #2
	beq _022EE90C
	mov r2, #1
#ifdef JAPAN
	strb r2, [r8, #0x16e]
	mov r0, #0x28
	mov r1, #0x4b
	strb r2, [r8, #0x170]
	bl ov29_022EA370
	ldr r1, _022EE988 ; =ov10_022C44E4
	mov r0, r6
#else
	strb r2, [r5, #0x172]
	mov r0, #0x28
	mov r1, #0x4b
	strb r2, [r5, #0x174]
	bl ov29_022EA370
	ldr r1, _022EE988 ; =ov10_022C44E4
	mov r0, r7
#endif
	ldrsh r1, [r1]
	mov r2, #0x11
	mov r3, #0x254
	bl ApplyDamageAndEffectsWrapper
	ldr r0, _022EE980 ; =DUNGEON_PTR
	mov r1, #2
	ldr r0, [r0]
	mov r4, #0
	strb r1, [r0, #6]
	b _022EE968
_022EE90C:
	ldr r1, _022EE98C ; =0x00000E66
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl LogMessageByIdWithPopupCheckUser
	b _022EE968
_022EE91C:
	mov r0, #0
#ifdef JAPAN
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r8, #6]
#else
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r5, #6]
#endif
	cmp r0, #0
	beq _022EE94C
	ldr r2, _022EE990 ; =0x00000E65
#ifdef JAPAN
	mov r0, r7
	mov r1, r6
#else
	mov r0, r8
	mov r1, r7
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EE958
_022EE94C:
	ldr r1, _022EE990 ; =0x00000E65
#ifdef JAPAN
	mov r0, r7
	bl LogMessageByIdWithPopup
_022EE958:
	mov r0, r6
	mov r2, r7
#else
	mov r0, r8
	bl LogMessageByIdWithPopup
_022EE958:
	mov r0, r7
	mov r2, r8
#endif
	mov r1, #0x254
	bl HandleFaint
_022EE968:
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
#ifdef JAPAN
	mov r0, r5
#else
	mov r0, r6
#endif
	mov r1, #5
	bl ov29_022EF478
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
#define APPLY_PITFALL_TRAP_EFFECT_OFFSET -0x2BE
#else
#define APPLY_PITFALL_TRAP_EFFECT_OFFSET 0
#endif
_022EE980: .word DUNGEON_PTR
_022EE984: .word 0x00000E64 + APPLY_PITFALL_TRAP_EFFECT_OFFSET
_022EE988: .word ov10_022C44E4
_022EE98C: .word 0x00000E66 + APPLY_PITFALL_TRAP_EFFECT_OFFSET
_022EE990: .word 0x00000E65 + APPLY_PITFALL_TRAP_EFFECT_OFFSET
	arm_func_end ApplyPitfallTrapEffect

	arm_func_start ApplySummonTrapEffect
ApplySummonTrapEffect: ; 0x022EE994
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #3
	mov r5, r1
	bl DungeonRandInt
	ldr r1, _022EEA20 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreLateGameTrapsEnabled
	cmp r0, #0
	bne _022EE9D8
	ldr r1, _022EEA24 ; =0x00000E68
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022EE9D8:
	mov r0, r6
	mov r1, r5
	add r2, r4, #2
	bl ov29_022EF4B4
	mov r4, r0
	ldr r1, _022EEA28 ; =0x0000030F
	mov r0, r5
	bl ov29_022E56D4
	cmp r4, #0
	bne _022EEA10
	ldr r1, _022EEA24 ; =0x00000E68
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
_022EEA10:
	ldr r1, _022EEA2C ; =0x00000E67
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EEA20: .word DUNGEON_PTR
#ifdef JAPAN
_022EEA24: .word 0x00000BAA
_022EEA28: .word 0x0000030F
_022EEA2C: .word 0x00000BA9
#else
_022EEA24: .word 0x00000E68
_022EEA28: .word 0x0000030F
_022EEA2C: .word 0x00000E67
#endif
	arm_func_end ApplySummonTrapEffect

	arm_func_start ApplyPpZeroTrapEffect
ApplyPpZeroTrapEffect: ; 0x022EEA30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	movs r4, r1
	mov r5, r0
	mov r8, #0
	beq _022EEB08
	ldr r1, [r4, #0xb4]
	mov r0, r8
#ifdef JAPAN
	add lr, r1, #0x120
#else
	add lr, r1, #0x124
#endif
	mov r7, r8
	mov r6, r8
	mov ip, #1
	add r2, sp, #0x10
	add r1, sp, #0
_022EEA68:
	ldrb r3, [lr, r7, lsl #3]
	add sb, lr, r7, lsl #3
	tst r3, #1
	movne r3, ip
	moveq r3, r6
	tst r3, #0xff
	ldrneb r3, [sb, #6]
	cmpne r3, #0
	strne r7, [r1, r0, lsl #2]
	strne sb, [r2, r0, lsl #2]
	add r7, r7, #1
	addne r0, r0, #1
	cmp r7, #4
	blt _022EEA68
	cmp r0, #0
	beq _022EEADC
	bl DungeonRandInt
	mov r6, r0
	add r1, sp, #0x10
	ldr r1, [r1, r6, lsl #2]
	mov r0, #0
	strb r0, [r1, #6]
	ldrh r1, [r1, #4]
	bl ov29_0234B084
	add r1, sp, #0
	ldr r1, [r1, r6, lsl #2]
	mov r0, r4
	bl ov29_022FA574
	mov r8, #1
_022EEADC:
	cmp r8, #0
	beq _022EEAF8
	ldr r2, _022EEB10 ; =0x00000E69
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
	b _022EEB08
_022EEAF8:
	ldr r2, _022EEB14 ; =0x00000E6A
	mov r0, r5
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUserTarget
_022EEB08:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_022EEB10: .word 0x00000BAB
_022EEB14: .word 0x00000BAC
#else
_022EEB10: .word 0x00000E69
_022EEB14: .word 0x00000E6A
#endif
	arm_func_end ApplyPpZeroTrapEffect

	arm_func_start ApplyPokemonTrapEffect
ApplyPokemonTrapEffect: ; 0x022EEB18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	mov r4, r1
	mov r7, #0
	bl GetVisibilityRange
	ldr r1, _022EED1C ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	bl AreLateGameTrapsEnabled
	cmp r0, #0
	bne _022EEB60
	ldr r1, _022EED20 ; =0x00000E6B
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022EED14
_022EEB60:
	ldrsh r0, [r4]
	ldrsh r1, [r4, #2]
	bl GetTile
	ldrb r2, [r0, #7]
	cmp r2, #0xff
	bne _022EEB94
	ldrsh r1, [r4]
	ldrsh r0, [r4, #2]
	sub fp, r1, r5
	sub sb, r0, r5
	add r4, r1, r5
	add r5, r0, r5
	b _022EECE8
_022EEB94:
	ldr r0, _022EED1C ; =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r0, r2, r1, r0
	ldrsh r3, [r0, #2]
	ldrsh r2, [r0, #4]
	ldrsh r1, [r0, #6]
	ldrsh r0, [r0, #8]
	sub fp, r3, #1
	sub sb, r2, #1
	add r4, r1, #1
	add r5, r0, #1
	b _022EECE8
_022EEBD0:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	mov r6, fp
	str r0, [sp]
	b _022EECDC
_022EEBE4:
	mov r0, r6
	mov r1, sb
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _022EECD8
	ldr r1, [r0]
	cmp r1, #3
	bne _022EECD8
	bl GetItemInfo
	ldrb r0, [r0]
	tst r0, #2
	bne _022EECD8
	bl GetKecleonIdToSpawnByFloor
	strh r0, [sp, #4]
	mov r8, #0
	b _022EEC68
_022EEC28:
	ldr r0, _022EED1C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022EEC44
	bl GetKecleonIdToSpawnByFloor
	b _022EEC4C
_022EEC44:
	mov r0, #0
	bl GetMonsterIdToSpawn
_022EEC4C:
	strh r0, [sp, #4]
	ldrsh r0, [sp, #4]
	mov r1, #0
	bl MewSpawnCheck
	cmp r0, #0
	bne _022EEC70
	add r8, r8, #1
_022EEC68:
	cmp r8, #0x64
	blt _022EEC28
_022EEC70:
	ldrsh r0, [sp, #4]
	mov r1, #0
	bl MewSpawnCheck
	cmp r0, #0
	beq _022EECCC
	mov r0, #0
	strh r0, [sp, #0xc]
	strb r0, [sp, #6]
	ldr r0, [sp]
	mov r1, #1
	strh r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #8]
	strb r0, [sp, #0x12]
	add r0, sp, #4
	strh r6, [sp, #0xe]
	bl SpawnMonster
	cmp r0, #0
	beq _022EECCC
	add r0, sp, #0xe
	mov r1, #0
	bl RemoveGroundItem
	add r7, r7, #1
_022EECCC:
	mov r0, r6
	mov r1, sb
	bl DrawMinimapTile
_022EECD8:
	add r6, r6, #1
_022EECDC:
	cmp r6, r4
	ble _022EEBE4
	add sb, sb, #1
_022EECE8:
	cmp sb, r5
	ble _022EEBD0
	cmp r7, #0
	beq _022EED08
	ldr r1, _022EED24 ; =0x00000E6C
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022EED14
_022EED08:
	ldr r1, _022EED28 ; =0x00000E6D
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_022EED14:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EED1C: .word DUNGEON_PTR
#ifdef JAPAN
_022EED20: .word 0x00000BAD
_022EED24: .word 0x00000BAE
_022EED28: .word 0x00000BAF
#else
_022EED20: .word 0x00000E6B
_022EED24: .word 0x00000E6C
_022EED28: .word 0x00000E6D
#endif
	arm_func_end ApplyPokemonTrapEffect

	arm_func_start ApplyTripTrapEffect
ApplyTripTrapEffect: ; 0x022EED2C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	movs r5, r1
	mov r6, r0
	beq _022EEE38
	mov r0, r5
	mov r1, #6
	mov r2, #8
	bl ChangeMonsterAnimation
	mov r0, #0x10
	mov r1, #0x55
	bl ov29_022EA370
	mov r0, r5
	mov r1, #8
	bl ov29_02304A48
	mov r0, r5
	mov r1, #0x2c
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _022EEE38
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022EEE38
	ldrh r0, [r4, #0x62]
	strh r0, [sp, #0x10]
	ldrh r0, [r4, #0x64]
	strh r0, [sp, #0x12]
	ldrh r0, [r4, #0x66]
	strh r0, [sp, #0x14]
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _022EEDC4
	ldrb r0, [r4, #0x63]
	bl RemoveHeldItemNoHole
_022EEDC4:
	mov r0, #0
	strb r0, [r4, #0x62]
	bl RemoveEmptyItemsInBagWrapper
	ldr r1, _022EEE40 ; =0x0000130F
	mov r0, r5
	bl ov29_022E56A0
	ldrb r1, [r4, #0x4c]
	ldr r0, _022EEE44 ; =DIRECTIONS_XY
	ldrsh r3, [r5, #4]
	mov r1, r1, lsl #0x1d
	mov r4, r1, lsr #0x1b
	ldrsh r2, [r0, r4]
	ldr r1, _022EEE48 ; =DIRECTIONS_XY + 2
	mov r0, r6
	add r2, r3, r2
	strh r2, [sp, #0xc]
	ldrsh r2, [r1, r4]
	ldrsh r3, [r5, #6]
	mov r4, #1
	ldr r1, _022EEE4C ; =DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	add r2, r3, r2
	strh r2, [sp, #0xe]
	str r4, [sp]
	str r1, [sp, #4]
	add r2, sp, #0xc
	add r3, sp, #0x10
	add r1, r5, #4
	str r4, [sp, #8]
	bl ov29_02346344
_022EEE38:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EEE40: .word 0x0000130F
_022EEE44: .word DIRECTIONS_XY
_022EEE48: .word DIRECTIONS_XY + 2
_022EEE4C: .word DISPLACEMENTS_WITHIN_2_SMALLEST_FIRST
	arm_func_end ApplyTripTrapEffect

	arm_func_start ApplyStealthRockTrapEffect
ApplyStealthRockTrapEffect: ; 0x022EEE50
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r1
	mov r6, r0
	ldmeqia sp!, {r4, r5, r6, pc}
#else
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	ldmeqia sp!, {r3, r4, r5, pc}
#endif
	mov r0, r4
	mov r1, #0xd
	ldr r5, [r4, #0xb4]
	bl HasTypeAffectedByGravity
	cmp r0, #0
	bne _022EEEBC
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _022EEEDC ; =0x000003E7
	add r2, r2, r1
	ldr r1, _022EEEE0 ; =ov10_022C4770
	cmp r2, r0
	movgt r2, r0
	ldr r1, [r1]
	mov r0, r2, lsl #8
	bl MultiplyByFixedPoint
	bl sub_02001888
	mov r1, r0
	ldr r3, _022EEEE4 ; =0x0000026D
	mov r0, r4
	mov r1, r1, asr #8
	mov r2, #0x16
	bl ApplyDamageAndEffectsWrapper
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
_022EEEBC:
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, r6
	mov r1, #0xbb0
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmia sp!, {r3, r4, r5, pc}
_022EEEBC:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022EEEE8 ; =0x00000E6E
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
#endif
	.align 2, 0
_022EEEDC: .word 0x000003E7
_022EEEE0: .word ov10_022C4770
_022EEEE4: .word 0x0000026D
#ifndef JAPAN
_022EEEE8: .word 0x00000E6E
#endif
	arm_func_end ApplyStealthRockTrapEffect

#ifndef JAPAN
	arm_func_start ApplyToxicSpikesTrapEffect
ApplyToxicSpikesTrapEffect: ; 0x022EEEEC
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _022EEF3C ; =ov10_022C45CC
	mov r0, r4
	ldrsh r1, [r1]
	mov r2, #0x15
	mov r3, #0x26c
	bl ApplyDamageAndEffectsWrapper
	mov r0, r4
	bl ov29_022FBD80
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #1
	mov r3, #0
	bl TryInflictPoisonedStatus
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022EEF3C: .word ov10_022C45CC
	arm_func_end ApplyToxicSpikesTrapEffect
#endif

	arm_func_start ApplyRandomTrapEffect
ApplyRandomTrapEffect: ; 0x022EEF40
#ifdef JAPAN
#define APPLY_RANDOM_TRAP_EFFECT_OFFSET -4
#else
#define APPLY_RANDOM_TRAP_EFFECT_OFFSET 0
#endif
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#endif
	sub sp, sp, #0x64 + APPLY_RANDOM_TRAP_EFFECT_OFFSET
	movs sb, r2
	str r0, [sp, #0xc + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	mov sl, r1
	str r3, [sp, #0x10 + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	ldr r8, [sp, #0x88]
	beq _022EF064
	bl ov29_022E7A8C
	ldr r1, _022EF06C ; =ov10_022C4B18
	mov r4, r0
	ldrb r0, [r1, r4]
	cmp r0, #0
	bne _022EEFB0
	mov r0, sl
	mov r1, r8
	mov r2, r4
	bl ov29_022E58B0
	str r8, [sp]
#ifndef JAPAN
	str r4, [sp, #4]
	mov r4, #1
#endif
	ldr r0, [sp, #0xc + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	ldr r3, [sp, #0x10 + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	mov r1, sl
	mov r2, sb
	str r4, [sp, #8 + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	bl ApplyTrapEffect
	b _022EF064
_022EEFB0:
	ldr r0, [sb, #0xb4]
	mov r5, #0
	ldrb fp, [r0, #6]
	str sb, [sp, #0x14 + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	add r7, r5, #1
_022EEFC4:
	ldr r0, _022EF070 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022EE348
	cmp r0, #0
	cmpne sb, r6
	beq _022EF004
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #6]
	cmp fp, r0
	addeq r0, sp, #0x14 + APPLY_RANDOM_TRAP_EFFECT_OFFSET
	streq r6, [r0, r7, lsl #2]
	addeq r7, r7, #1
_022EF004:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022EEFC4
	mov sb, #0
	add r5, sp, #0x14 + APPLY_RANDOM_TRAP_EFFECT_OFFSET
	mov fp, #1
	b _022EF05C
_022EF020:
	ldr r6, [r5, sb, lsl #2]
	mov r2, r4
	mov r0, r6
	add r1, r6, #4
	bl ov29_022E58B0
	str r8, [sp]
	ldr r0, [sp, #0xc + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	ldr r3, [sp, #0x10 + APPLY_RANDOM_TRAP_EFFECT_OFFSET]
	mov r2, r6
	mov r1, sl
#ifdef JAPAN
	str r4, [sp, #4]
	bl ApplyTrapEffect
	mov r0, fp
#else
	stmib sp, {r4, fp}
	bl ApplyTrapEffect
	mov r0, #1
#endif
	bl AnimationDelayOrSomething
	add sb, sb, #1
_022EF05C:
	cmp sb, r7
	blt _022EF020
_022EF064:
	add sp, sp, #0x64 + APPLY_RANDOM_TRAP_EFFECT_OFFSET
#ifdef JAPAN
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_022EF06C: .word ov10_022C4B18
_022EF070: .word DUNGEON_PTR
	arm_func_end ApplyRandomTrapEffect

	arm_func_start ApplyGrudgeTrapEffect
ApplyGrudgeTrapEffect: ; 0x022EF074
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
#ifdef JAPAN
	mov r6, r0
#else
	mov sl, r0
#endif
	mov r0, #3
	mov r4, r1
	bl DungeonRandInt
	mov r2, r0
#ifdef JAPAN
	mov r0, r6
#else
	mov r0, sl
#endif
	mov r1, r4
	add r2, r2, #2
	bl ov29_022EF4B4
	cmp r0, #0
	ble _022EF0B0
	ldr r1, _022EF148 ; =0x0000030F
	mov r0, r4
	bl ov29_022E56D4
_022EF0B0:
#ifdef JAPAN
	mov r4, #0
	ldr r7, _022EF14C ; =DUNGEON_PTR
	mov r5, r4
	mov r8, #1
	mov sb, r4
_022F06BC:
	ldr r0, [r7]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xa94]
	mov r0, sl
	bl EntityIsValid__022EE348
	cmp r0, #0
	beq _022F06F4
	mov r0, sl
	mov r1, sl
	mov r2, sb
	bl TryInflictGrudgeStatus
	cmp r0, #0
	movne r4, r8
_022F06F4:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022F06BC
	cmp r4, #0
	ldrne r0, _022F0728 ; =0x00000BB1
	ldreq r0, _022F072C ; =0x00000BB2
	mov r1, r0, lsl #0x10
	mov r0, r6
#else
	mov r7, #0
	ldr r4, _022EF14C ; =DUNGEON_PTR
	mov r8, r7
	mov r5, #1
	mov r6, r7
_022EF0C4:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb38]
	mov r0, sb
	bl EntityIsValid__022EE348
	cmp r0, #0
	ldrne r0, [sb, #0xb4]
	ldrneb r1, [r0, #9]
	cmpne r1, #1
	ldrneb r1, [r0, #0xbc]
	cmpne r1, #7
	beq _022EF11C
	bl IsExperienceLocked
	cmp r0, #0
	bne _022EF11C
	mov r0, sb
	mov r1, sb
	mov r2, r6
	bl TryInflictGrudgeStatus
	cmp r0, #0
	movne r7, r5
_022EF11C:
	add r8, r8, #1
	cmp r8, #0x10
	blt _022EF0C4
	cmp r7, #0
	ldrne r0, _022EF150 ; =0x00000E6F
	moveq r0, #0xe70
	mov r1, r0, lsl #0x10
	mov r0, sl
#endif
	mov r1, r1, lsr #0x10
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022EF148: .word 0x0000030F
_022EF14C: .word DUNGEON_PTR
#ifdef JAPAN
_022F0728: .word 0x00000BB1
_022F072C: .word 0x00000BB2
#else
_022EF150: .word 0x00000E6F
#endif
	arm_func_end ApplyGrudgeTrapEffect

	arm_func_start ApplyTrapEffect
ApplyTrapEffect: ; 0x022EF154
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldrb ip, [sp, #0x24]
	ldr lr, [sp, #0x20]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	cmp ip, #0x20
	mov r4, #0
	addls pc, pc, ip, lsl #2
	b _022EF454
_022EF180: ; jump table
	b _022EF454 ; case 0
	b _022EF204 ; case 1
	b _022EF214 ; case 2
	b _022EF224 ; case 3
	b _022EF234 ; case 4
	b _022EF248 ; case 5
	b _022EF260 ; case 6
	b _022EF280 ; case 7
	b _022EF2A4 ; case 8
	b _022EF2C4 ; case 9
	b _022EF2F4 ; case 10
	b _022EF314 ; case 11
	b _022EF328 ; case 12
	b _022EF348 ; case 13
	b _022EF368 ; case 14
	b _022EF388 ; case 15
	b _022EF398 ; case 16
	b _022EF3BC ; case 17
	b _022EF3D0 ; case 18
	b _022EF3E4 ; case 19
	b _022EF408 ; case 20
	b _022EF418 ; case 21
	b _022EF428 ; case 22
	b _022EF438 ; case 23
	b _022EF444 ; case 24
	b _022EF454 ; case 25
	b _022EF454 ; case 26
	b _022EF454 ; case 27
	b _022EF454 ; case 28
	b _022EF454 ; case 29
	b _022EF454 ; case 30
	b _022EF454 ; case 31
	b _022EF248 ; case 32
_022EF204:
	mov r0, r6
	mov r1, r5
	bl ApplyMudTrapEffect
	b _022EF454
_022EF214:
	mov r0, r6
	mov r1, r5
	bl ApplyStickyTrapEffect
	b _022EF454
_022EF224:
	mov r0, r6
	mov r1, r5
	bl ApplyGrimyTrapEffect
	b _022EF454
_022EF234:
	mov r0, r6
	mov r1, lr
	bl ApplySummonTrapEffect
	mov r4, #1
	b _022EF454
_022EF248:
#ifdef JAPAN
	mov r0, r6
	mov r1, r5
	mov r2, r3
#else
	mov r2, r3
	ldrb r3, [sp, #0x28]
	mov r0, r6
	mov r1, r5
#endif
	bl ApplyPitfallTrapEffect
	b _022EF454
_022EF260:
	cmp r5, #0
	beq _022EF454
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, r4
	bl TryWarp
	b _022EF454
_022EF280:
	cmp r5, #0
	beq _022EF454
	mov r0, #8
	bl DungeonRandInt
	mov r2, r0
	mov r0, r7
	mov r1, r5
	bl TryBlowAway
	b _022EF454
_022EF2A4:
	cmp r5, #0
	beq _022EF454
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #1
	bl TryInflictConfusedStatus
	b _022EF454
_022EF2C4:
	cmp r5, #0
	beq _022EF454
	ldr r1, _022EF460 ; =SLEEP_TURN_RANGE
	mov r0, r5
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, #1
	bl TryInflictSleepStatus
	b _022EF454
_022EF2F4:
	cmp r5, #0
	beq _022EF454
	mov r2, #1
	mov r0, r6
	mov r1, r5
	mov r3, r2
	bl LowerSpeed
	b _022EF454
_022EF314:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl TrySealMove
	b _022EF454
_022EF328:
	cmp r5, #0
	beq _022EF454
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #1
	bl TryInflictPoisonedStatus
	b _022EF454
_022EF348:
	ldr ip, _022EF464 ; =0x00000251
	mov r0, r6
	mov r1, r5
	add r2, r5, #4
	mov r3, #1
	stmia sp, {r4, ip}
	bl TryExplosion
	b _022EF454
_022EF368:
	ldr ip, _022EF464 ; =0x00000251
	mov r0, r6
	mov r1, r5
	add r2, r5, #4
	mov r3, #2
	stmia sp, {r4, ip}
	bl TryExplosion
	b _022EF454
_022EF388:
	mov r0, r6
	mov r1, r5
	bl ApplyPpZeroTrapEffect
	b _022EF454
_022EF398:
	cmp r5, #0
	beq _022EF454
	ldr r0, _022EF468 ; =ov10_022C45C8
	ldr r3, _022EF46C ; =0x00000252
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0xf
	bl ApplyDamageAndEffectsWrapper
	b _022EF454
_022EF3BC:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl TryResetStatChanges
	b _022EF454
_022EF3D0:
	mov r0, r6
	mov r1, lr
	bl ApplyPokemonTrapEffect
	mov r4, #1
	b _022EF454
_022EF3E4:
	cmp r5, #0
	beq _022EF454
	ldr r0, _022EF470 ; =ov10_022C4418
	ldr r3, _022EF474 ; =0x00000245
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0xa
	bl ApplyDamageAndEffectsWrapper
	b _022EF454
_022EF408:
	mov r0, r6
	mov r1, r5
	bl ApplyStealthRockTrapEffect
	b _022EF454
_022EF418:
#ifdef JAPAN
	cmp r5, #0
	beq _022EF454
	ldr r1, _022F0A78 ; =0x022C5CB4
	mov r0, r5
	ldrsh r1, [r1]
	mov r2, #0x15
	mov r3, #0x26c
	bl ApplyDamageAndEffectsWrapper
	mov r0, r6
	mov r1, r5
	mov r2, #1
	mov r3, r4
	bl TryInflictPoisonedStatus
#else
	mov r0, r6
	mov r1, r5
	bl ApplyToxicSpikesTrapEffect
#endif
	b _022EF454
_022EF428:
	mov r0, r6
	mov r1, r5
	bl ApplyTripTrapEffect
	b _022EF454
_022EF438:
	str lr, [sp]
	bl ApplyRandomTrapEffect
	b _022EF454
_022EF444:
	mov r0, r6
	mov r1, lr
	bl ApplyGrudgeTrapEffect
	mov r4, #1
_022EF454:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022EF460: .word SLEEP_TURN_RANGE
_022EF464: .word 0x00000251
_022EF468: .word ov10_022C45C8
_022EF46C: .word 0x00000252
_022EF470: .word ov10_022C4418
_022EF474: .word 0x00000245
#ifdef JAPAN
_022F0A78: .word ov10_022C45CC
#endif
	arm_func_end ApplyTrapEffect

	arm_func_start ov29_022EF478
ov29_022EF478: ; 0x022EF478
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0x10]
	mov r5, r1
	mov r0, r4
	bl EntityIsValid__022EE348
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #2
	bne _022EF4AC
	mov r0, r4
	bl GetTrapInfo
	strb r5, [r0]
_022EF4AC:
	bl UpdateTrapsVisibility
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022EF478

	arm_func_start ov29_022EF4B4
ov29_022EF4B4: ; 0x022EF4B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r0, #8
	mov sl, r1
	mov sb, r2
	bl DungeonRandInt
	mov r8, r0
	ldr r0, _022EF5D0 ; =0x0000017B
	mov r7, #0
	mov r6, r7
	add r5, r0, #2
	add r4, r0, #3
	b _022EF5BC
_022EF4E8:
	mov r0, #0
	bl GetMonsterIdToSpawn
	mov fp, r0
	bl FemaleToMaleForm
	ldr r1, _022EF5D0 ; =0x0000017B
	cmp r0, r1
	cmpne r0, #0x17c
	cmpne r0, r5
	cmpne r0, r4
	beq _022EF52C
	sub r0, r0, #0x1cc
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _022EF534
_022EF52C:
	mov r0, #1
	b _022EF538
_022EF534:
	mov r0, #0
_022EF538:
	cmp r0, #0
	bne _022EF5B8
	strh fp, [sp]
	ldrsh r0, [sp]
	mov r1, #0
	and r8, r8, #7
	bl MewSpawnCheck
	cmp r0, #0
	beq _022EF5B4
	ldr r1, _022EF5D4 ; =DIRECTIONS_XY
	mov r0, #0
	mov r2, r8, lsl #2
	ldrsh r3, [r1, r2]
	strh r0, [sp, #8]
	strb r0, [sp, #2]
	ldrsh r0, [sl]
	add r1, r1, r8, lsl #2
	ldrsh r2, [r1, #2]
	add r0, r0, r3
	strh r0, [sp, #0xa]
	ldrsh r3, [sl, #2]
	add r0, sp, #0
	mov r1, #1
	add r2, r3, r2
	strh r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #4]
	strb r2, [sp, #0xe]
	bl SpawnMonster
	cmp r0, #0
	addne r7, r7, #1
_022EF5B4:
	add r8, r8, #1
_022EF5B8:
	add r6, r6, #1
_022EF5BC:
	cmp r6, sb
	blt _022EF4E8
	mov r0, r7
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EF5D0: .word 0x0000017B
_022EF5D4: .word DIRECTIONS_XY
	arm_func_end ov29_022EF4B4

	arm_func_start RevealTrapsNearby
RevealTrapsNearby: ; 0x022EF5D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, #0
	bl GetVisibilityRange
	ldrb r7, [r8, #0x25]
	mov r6, r0
	cmp r7, #0xff
	beq _022EF608
	mov r0, r8
	bl HasDropeyeStatus
	cmp r0, #0
	beq _022EF65C
_022EF608:
	ldrsh r0, [r8, #6]
	sub r4, r0, r6
	b _022EF648
_022EF614:
	ldrsh r0, [r8, #4]
	sub r7, r0, r6
	b _022EF634
_022EF620:
	mov r0, r7
	mov r1, r4
	bl ov29_022EF700
	orr r5, r5, r0
	add r7, r7, #1
_022EF634:
	ldrsh r0, [r8, #4]
	add r0, r0, r6
	cmp r7, r0
	ble _022EF620
	add r4, r4, #1
_022EF648:
	ldrsh r0, [r8, #6]
	add r0, r0, r6
	cmp r4, r0
	ble _022EF614
	b _022EF6C4
_022EF65C:
	ldr r0, _022EF6F4 ; =DUNGEON_PTR
	mov r1, #0x1c
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x244
#else
	add r0, r0, #0x2e8
#endif
	add r0, r0, #0xec00
	mla r4, r7, r1, r0
	ldrsh r0, [r4, #4]
	sub r6, r0, #1
	b _022EF6B4
_022EF680:
	ldrsh r0, [r4, #2]
	sub r7, r0, #1
	b _022EF6A0
_022EF68C:
	mov r0, r7
	mov r1, r6
	bl ov29_022EF700
	orr r5, r5, r0
	add r7, r7, #1
_022EF6A0:
	ldrsh r0, [r4, #6]
	add r0, r0, #1
	cmp r7, r0
	ble _022EF68C
	add r6, r6, #1
_022EF6B4:
	ldrsh r0, [r4, #8]
	add r0, r0, #1
	cmp r6, r0
	ble _022EF680
_022EF6C4:
	cmp r5, #0
	beq _022EF6E4
	ldr r1, _022EF6F8 ; =0x00000E02
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	bl UpdateMinimap
	bl UpdateTrapsVisibility
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022EF6E4:
	ldr r1, _022EF6FC ; =0x00000E03
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022EF6F4: .word DUNGEON_PTR
#ifdef JAPAN
_022EF6F8: .word 0x00000B43
_022EF6FC: .word 0x00000B44
#else
_022EF6F8: .word 0x00000E02
_022EF6FC: .word 0x00000E03
#endif
	arm_func_end RevealTrapsNearby

	arm_func_start ov29_022EF700
ov29_022EF700: ; 0x022EF700
	stmdb sp!, {r3, lr}
	bl GetTile
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _022EF730
	ldr r0, [r1]
	cmp r0, #2
	ldreqb r0, [r1, #0x20]
	cmpeq r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x20]
	ldmeqia sp!, {r3, pc}
_022EF730:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022EF700

	arm_func_start ov29_022EF738
ov29_022EF738: ; 0x022EF738
#ifdef JAPAN
#define OV29_022EF738_OFFSET -0xA4
#else
#define OV29_022EF738_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	beq _022EF780
	ldr r0, _022EF798 ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _022EF79C ; =ov10_022C6C7A
	add r0, r0, #0x4000
	ldrb r3, [r0, #0xda + OV29_022EF738_OFFSET]
	smulbb r1, r3, r1
	ldrb r1, [r2, r1]
	cmp r1, #0
	movne r1, #2
	strneb r1, [r0, #0xca + OV29_022EF738_OFFSET]
	moveq r1, #1
	streqb r1, [r0, #0xca + OV29_022EF738_OFFSET]
	ldmia sp!, {r3, pc}
_022EF780:
	ldr r0, _022EF798 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xca + OV29_022EF738_OFFSET]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EF798: .word DUNGEON_PTR
_022EF79C: .word ov10_022C6C7A
	arm_func_end ov29_022EF738
