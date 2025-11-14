	.include "asm/macros.inc"
	.include "overlay_29_022FA524.inc"

	.text

	arm_func_start ov29_022FA524
ov29_022FA524: ; 0x022FA524
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022FA570 ; =DUNGEON_PTR
	mov r5, #0
_022FA530:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA560
	ldr r1, [r6, #0xb4]
	mov r0, r6
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_022FA560:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FA530
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA570: .word DUNGEON_PTR
	arm_func_end ov29_022FA524

	arm_func_start ov29_022FA574
ov29_022FA574: ; 0x022FA574
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	mov r1, r4
#ifdef JAPAN
	add r0, r0, #0x120
#else
	add r0, r0, #0x124
#endif
	bl sub_0201405C
	cmp r0, #0
	bne _022FA5B4
	ldr r1, _022FA5E4 ; =0x00000C1D
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_022FA5B4:
	cmp r0, #1
	bne _022FA5CC
	ldr r1, _022FA5E8 ; =0x00000C1E
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
_022FA5CC:
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _022FA5EC ; =0x00000C1F
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_022FA5E4: .word 0x0000095C
_022FA5E8: .word 0x0000095D
_022FA5EC: .word 0x0000095E
#else
_022FA5E4: .word 0x00000C1D
_022FA5E8: .word 0x00000C1E
_022FA5EC: .word 0x00000C1F
#endif
	arm_func_end ov29_022FA574

	arm_func_start MewSpawnCheck
MewSpawnCheck: ; 0x022FA5F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl CanMonsterSpawn
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0x97
	bne _022FA63C
	ldr r0, _022FA644 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	ldrb r0, [r0, #0xd95]
#else
	ldrb r0, [r0, #0xe39]
#endif
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_022FA63C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FA644: .word DUNGEON_PTR
	arm_func_end MewSpawnCheck

	arm_func_start ov29_022FA648
ov29_022FA648: ; 0x022FA648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov r6, #1
	mov fp, r6
	mov r5, r7
_022FA65C:
	ldr r0, _022FA74C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa84]
#else
	ldr r8, [r0, #0xb28]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA730
	ldr sl, [r8, #0xb4]
	ldrb r1, [sl, #7]
	ldrsh r0, [sl, #0xc]
	cmp r1, #0
	beq _022FA6C4
#ifdef JAPAN
	strb r6, [sl, #0x161]
#else
	strb r6, [sl, #0x165]
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	bl GetSuccessfulExitTracker
	cmp r0, #1
	mov r0, r8
	bne _022FA6B8
	bl ov29_022E68D8
	b _022FA6BC
_022FA6B8:
	bl ov29_022E68BC
_022FA6BC:
	strb r5, [r8, #0x20]
	b _022FA730
_022FA6C4:
	cmp r0, #0
	blt _022FA730
	mov sb, #0
	bl GetActiveTeamMember
	mov r4, r0
	bl GetSuccessfulExitTracker
	cmp r0, #0
	movne sb, #1
	bne _022FA70C
	ldrsh r0, [r4, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	movne sb, #1
	bne _022FA70C
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	movne sb, #1
_022FA70C:
	cmp sb, #0
	beq _022FA730
#ifdef JAPAN
	strb fp, [sl, #0x161]
#else
	strb fp, [sl, #0x165]
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, r8
	bl ov29_022E68BC
	mov r0, #0
	strb r0, [r8, #0x20]
_022FA730:
	add r7, r7, #1
	cmp r7, #4
	blt _022FA65C
	mov r0, #0x1e
	mov r1, #0x4a
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA74C: .word DUNGEON_PTR
	arm_func_end ov29_022FA648

	arm_func_start ov29_022FA750
ov29_022FA750: ; 0x022FA750
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	ldr r4, _022FA7D8 ; =DUNGEON_PTR
	mov r5, r6
_022FA760:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xad4]
#else
	ldr r8, [r0, #0xb78]
#endif
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA7C8
	ldr sb, [r8, #0xb4]
	mov r7, r5
_022FA788:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xad4]
#else
	ldr sl, [r0, #0xb78]
#endif
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne r8, sl
	beq _022FA7BC
	ldrh r1, [sb, #0x80]
	ldrh r0, [sl, #0x26]
	cmp r1, r0
	streq sl, [sb, #0x84]
_022FA7BC:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022FA788
_022FA7C8:
	add r6, r6, #1
	cmp r6, #0x14
	blt _022FA760
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FA7D8: .word DUNGEON_PTR
	arm_func_end ov29_022FA750

	arm_func_start TryEndStatusWithAbility
TryEndStatusWithAbility: ; 0x022FA7DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r2, #0x16
#ifndef JAPAN
	mov r3, #1
#endif
	mov r6, r0
	ldr r4, [r5, #0xb4]
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA81C
	ldrb r0, [r4, #0xbf]
	cmp r0, #4
	bne _022FA81C
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA81C:
	mov r0, r6
	mov r1, r5
	mov r2, #0x40
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA850
	ldrb r0, [r4, #0xd0]
	cmp r0, #2
	bne _022FA850
	mov r0, r6
	mov r1, r5
	bl EndCringeClassStatus
_022FA850:
	mov r0, r6
	mov r1, r5
	mov r2, #0x42
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA884
	ldrb r0, [r4, #0xbf]
	cmp r0, #1
	bne _022FA884
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA884:
	mov r0, r6
	mov r1, r5
	mov r2, #0x29
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA8B8
	ldrb r0, [r4, #0xd0]
	cmp r0, #7
	bne _022FA8B8
	mov r0, r6
	mov r1, r5
	bl EndCringeClassStatus
_022FA8B8:
	mov r0, r6
	mov r1, r5
	mov r2, #0x36
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	bne _022FA8F0
	mov r0, r6
	mov r1, r5
	mov r2, #0x49
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA924
_022FA8F0:
	mov r0, r5
	bl IsMonsterSleeping
	cmp r0, #0
	bne _022FA90C
	ldrb r0, [r4, #0xbd]
	cmp r0, #4
	bne _022FA924
_022FA90C:
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, #0
	str r3, [sp]
	bl EndSleepClassStatus
_022FA924:
	mov r0, r6
	mov r1, r5
	mov r2, #0x41
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA95C
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	bne _022FA95C
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndFrozenClassStatus
_022FA95C:
	mov r0, r6
	mov r1, r5
	mov r2, #0x45
#ifndef JAPAN
	mov r3, #1
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	beq _022FA998
	ldrb r0, [r4, #0xbf]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022FA998
	mov r0, r6
	mov r1, r5
	bl EndBurnClassStatus
_022FA998:
	mov r0, r5
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022FA9CC
	mov r0, #0
	strb r0, [r4, #0xff]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0xc
	bne _022FA9CC
	mov r0, r6
	mov r1, r5
	bl EndReflectClassStatus
_022FA9CC:
	mov r0, r5
	mov r1, #0x2b
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022FA9FC
	ldrb r0, [r4, #0xc4]
	cmp r0, #2
	bne _022FA9FC
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl EndFrozenClassStatus
_022FA9FC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end TryEndStatusWithAbility

	arm_func_start ov29_022FAA04
ov29_022FAA04: ; 0x022FAA04
#ifdef JAPAN
#define OV29_022FAA04_OFFSET -4
#else
#define OV29_022FAA04_OFFSET 0
#endif
	ldr ip, [r0, #0xb4]
	mov r3, #0
_022FAA0C:
	add r2, ip, r3, lsl #3
	ldrb r0, [r2, #0x124 + OV29_022FAA04_OFFSET]
	add r3, r3, #1
	cmp r3, #4
	bic r0, r0, #0x10
	strb r0, [r2, #0x124 + OV29_022FAA04_OFFSET]
	blt _022FAA0C
	ldrb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	bic r0, r0, #0x10
	strb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	ldrh r0, [r1, #4]
	cmp r0, #0x160
	ldreqb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	orreq r0, r0, #0x10
	streqb r0, [ip, #0x144 + OV29_022FAA04_OFFSET]
	ldrneb r0, [r1]
	orrne r0, r0, #0x10
	strneb r0, [r1]
	bx lr
	arm_func_end ov29_022FAA04

	arm_func_start ov29_022FAA58
ov29_022FAA58: ; 0x022FAA58
#ifdef JAPAN
#define OV29_022FAA58_OFFSET -4
#else
#define OV29_022FAA58_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _022FAC90 ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r1]
	mov r6, #0
#ifdef JAPAN
	add r0, r0, #0x284
#else
	add r0, r0, #0x328
#endif
	add r4, r0, #0x12800
_022FAA78:
	ldr r5, [r4, r6, lsl #2]
	mov r0, r5
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAB98
	mov r0, r5
	mov r1, #0x37
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022FAB98
	ldr sb, [r5, #0xb4]
	mov r8, #0
	mov r7, r8
	add fp, sb, #0x124 + OV29_022FAA58_OFFSET
_022FAAB0:
	ldrb r1, [fp, r7, lsl #3]
	add r0, fp, r7, lsl #3
	str r0, [sp]
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022FAB00
	ldr r0, [sp]
	bl GetMaxPpWrapper
	ldr r1, [sp]
	ldrb r1, [r1, #6]
	cmp r1, r0
	beq _022FAB00
	add r0, r8, #1
	mov r1, r0, lsl #0x10
	mov r2, r8, lsl #1
	add r0, sp, #4
	strh r7, [r0, r2]
	mov r8, r1, asr #0x10
_022FAB00:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FAAB0
	cmp r8, #0
	ble _022FAB4C
	mov r0, r8
	bl DungeonRandInt
	mov r0, r0, lsl #0x10
	add r1, sp, #4
	mov r0, r0, asr #0xf
	ldrsh r0, [r1, r0]
	add r1, sb, #0x124 + OV29_022FAA58_OFFSET
	add r1, r1, r0, lsl #3
	ldrb r0, [r1, #6]
	add r0, r0, #1
	strb r0, [r1, #6]
	b _022FAB54
_022FAB4C:
	mov r0, #0
	b _022FAB58
_022FAB54:
	mov r0, #1
_022FAB58:
	cmp r0, #0
	beq _022FAB98
	mov r0, r5
	bl ShowPpRestoreEffect
	cmp sl, #0
	bne _022FAB98
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, #1
	mov r1, #0x37
	bl SetPreprocessorArgsIdVal
#ifdef JAPAN
	ldr r1, _022FC21C ; =0x0000095F
	mov r0, r5
#else
	mov r0, r5
	mov r1, #0xc20
#endif
	bl LogMessageByIdWithPopupCheckUser
_022FAB98:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _022FAA78
	mov r8, #0
	mov fp, r8
_022FABB4:
	ldr sb, [r4, r8, lsl #2]
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAC74
	ldr r6, [sb, #0xb4]
	mov r7, fp
	add r5, r6, #0x124 + OV29_022FAA58_OFFSET
	b _022FABFC
_022FABD8:
	add r0, r5, r7, lsl #3
	bl GetMaxPp
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x12a + OV29_022FAA58_OFFSET]
	cmp r1, r0
	blt _022FAC04
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FABFC:
	cmp r7, #4
	blt _022FABD8
_022FAC04:
	cmp r7, #4
	beq _022FAC74
	mov r0, sb
	mov r1, #0x47
	bl ExclusiveItemEffectIsActive__022FAC98
	cmp r0, #0
	beq _022FAC74
	mov r0, #0
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, #0x47
	add r2, sp, #0xc
	bl GetExclusiveItemWithEffectFromBag
	mov r0, #1
	add r1, sp, #0xc
	bl PrepareItemForPrinting__02345728
	cmp sl, #0
	bne _022FAC60
	ldr r1, _022FAC94 ; =0x00000C23
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
_022FAC60:
	mov r0, sb
	mov r1, sb
	mov r2, #1
	mov r3, sl
	bl RestoreAllMovePP
_022FAC74:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FABB4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FAC90: .word DUNGEON_PTR
#ifdef JAPAN
_022FC21C: .word 0x0000095F
_022FAC94: .word 0x00000962
#else
_022FAC94: .word 0x00000C23
#endif
	arm_func_end ov29_022FAA58
