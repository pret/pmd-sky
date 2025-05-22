	.include "asm/macros.inc"
	.include "overlay_29_022F7388.inc"

	.text

	arm_func_start DungeonGetSpriteIndex
DungeonGetSpriteIndex: ; 0x022F7388
#ifdef JAPAN
	ldr r1, _022F73A0 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x19800
	ldrsh r0, [r0, #0x70]
#else
	ldr r2, _022F73A0 ; =DUNGEON_PTR
	ldr r1, _022F73A4 ; =0x00019914
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, r1]
#endif
	bx lr
	.align 2, 0
_022F73A0: .word DUNGEON_PTR
#ifndef JAPAN
_022F73A4: .word 0x00019914
#endif
	arm_func_end DungeonGetSpriteIndex

	arm_func_start JoinedAtRangeCheck2Veneer
JoinedAtRangeCheck2Veneer: ; 0x022F73A8
	ldr ip, _022F73B0 ; =JoinedAtRangeCheck2
	bx ip
	.align 2, 0
_022F73B0: .word JoinedAtRangeCheck2
	arm_func_end JoinedAtRangeCheck2Veneer

	arm_func_start FloorNumberIsEven
FloorNumberIsEven: ; 0x022F73B4
	ldr r0, _022F73E8 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x748]
	cmp r0, #0x5b
	ldreqb r0, [r1, #0x749]
	cmpeq r0, #0xa
	moveq r0, #0
	bxeq lr
	ldrb r0, [r1, #0x749]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_022F73E8: .word DUNGEON_PTR
	arm_func_end FloorNumberIsEven

	arm_func_start GetKecleonIdToSpawnByFloor
GetKecleonIdToSpawnByFloor: ; 0x022F73EC
	stmdb sp!, {r3, lr}
	bl FloorNumberIsEven
	cmp r0, #0
	ldrne r0, _022F7404 ; =0x000003D7
	ldreq r0, _022F7408 ; =0x0000017F
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7404: .word 0x000003D7
_022F7408: .word 0x0000017F
	arm_func_end GetKecleonIdToSpawnByFloor

	arm_func_start StoreSpriteFileIndexBothGenders
StoreSpriteFileIndexBothGenders: ; 0x022F740C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022F74D0 ; =DUNGEON_PTR
	mov r7, r0
	ldr r2, [r2]
	mov r6, r1
#ifdef JAPAN
	add r1, r2, #0x870
	add r5, r1, #0x19000
#else
	add r1, r2, #0x114
	add r5, r1, #0x19800
#endif
	bl GetSpriteIndex__020526EC
	mov r4, r0
	mov r1, r7, lsl #1
	mov r0, r7
	strh r6, [r5, r1]
	bl GetMonsterGender
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0x258
	bge _022F7490
	add r6, r7, #0x258
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpriteIndex__020526EC
	cmp r4, r0
	moveq r0, r7, lsl #1
	ldreqsh r1, [r5, r0]
	moveq r0, r6, lsl #1
	streqh r1, [r5, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022F7490:
	sub r6, r7, #0x258
	mov r1, r6, lsl #0x10
	mov r0, r7
	mov r1, r1, asr #0x10
	bl GendersEqualNotGenderless
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetSpriteIndex__020526EC
	cmp r4, r0
	moveq r0, r7, lsl #1
	ldreqsh r1, [r5, r0]
	moveq r0, r6, lsl #1
	streqh r1, [r5, r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F74D0: .word DUNGEON_PTR
	arm_func_end StoreSpriteFileIndexBothGenders

	arm_func_start LoadMonsterSpriteInner
LoadMonsterSpriteInner: ; 0x022F74D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _022F75C4 ; =DUNGEON_PTR
	mov r6, r0
#ifdef JAPAN
	ldr r1, [r1]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x19800
	ldrsh r1, [r1, #0x70]
#else
	ldr r2, [r1]
	ldr r1, _022F75C8 ; =0x00019914
	add r2, r2, r6, lsl #1
	ldrsh r1, [r2, r1]
#endif
	cmp r1, #0
	bne _022F75BC
	bl GetSpriteIndex__020526EC
	mov r4, r0
	mov r0, r6
	bl IsShaymin
	cmp r0, #0
	beq _022F756C
	mov r0, r6
	bl IsShaymin
	cmp r0, #0
	mov r0, r6
	movne r5, #0
	bl GetSpriteFileSize
	mov r1, #0
	bl MemAlloc
	ldr r2, _022F75CC ; =ov29_0237C9B0
	mov r1, #1
	str r0, [r2, r5, lsl #2]
	str r1, [sp]
	ldr r0, _022F75D0 ; =WAN_TABLE
	ldr r3, [r2, r5, lsl #2]
	ldr r0, [r0]
	mov r2, r4
	mov r1, #0
	bl LoadWanTableEntryFromPackUseProvidedMemory
	mov r1, r0
	mov r0, r6
	bl StoreSpriteFileIndexBothGenders
	b _022F7598
_022F756C:
	mov r1, #1
	ldr r0, _022F75D0 ; =WAN_TABLE
	str r1, [sp]
	mov r1, #0
	ldr r0, [r0]
	mov r2, r4
	mov r3, r1
	bl LoadWanTableEntryFromPack
	mov r1, r0
	mov r0, r6
	bl StoreSpriteFileIndexBothGenders
_022F7598:
	mov r1, r4
	mov r0, #0
	bl DirectoryFileMngr_GetDirectoryFileSize
	ldr r1, _022F75C4 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x2c000
#ifdef JAPAN
	ldr r2, [r1, #0xa68]
	add r0, r2, r0
	str r0, [r1, #0xa68]
#else
	ldr r2, [r1, #0xb0c]
	add r0, r2, r0
	str r0, [r1, #0xb0c]
#endif
_022F75BC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F75C4: .word DUNGEON_PTR
#ifndef JAPAN
_022F75C8: .word 0x00019914
#endif
_022F75CC: .word ov29_0237C9B0
_022F75D0: .word WAN_TABLE
	arm_func_end LoadMonsterSpriteInner

	arm_func_start SwapMonsterWanFileIndex
SwapMonsterWanFileIndex: ; 0x022F75D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _022F764C ; =DUNGEON_PTR
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
#ifdef JAPAN
	add r1, r1, #0x870
	mov r0, r5
	add r4, r1, #0x19000
#else
	add r1, r1, #0x114
	mov r0, r5
	add r4, r1, #0x19800
#endif
	bl GetSpriteIndex__020526EC
	mov r1, #1
	str r1, [sp]
	mov r1, r6, lsl #1
	ldr r2, _022F7650 ; =WAN_TABLE
	mov r3, r0
	ldrsh r1, [r4, r1]
	ldr r0, [r2]
	mov r2, #0
	bl ReplaceWanFromBinFile
	mov r1, r0
	mov r0, r5
	bl StoreSpriteFileIndexBothGenders
	mov r3, r6, lsl #1
	ldrsh r2, [r4, r3]
	mov r1, r5, lsl #1
	mov r0, #0
	strh r2, [r4, r1]
	strh r0, [r4, r3]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F764C: .word DUNGEON_PTR
_022F7650: .word WAN_TABLE
	arm_func_end SwapMonsterWanFileIndex

	arm_func_start LoadMonsterSprite
LoadMonsterSprite: ; 0x022F7654
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _022F769C
	ldr r0, _022F7748 ; =0xFFFFFE5E
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	bhi _022F769C
	ldr r0, _022F774C ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x3d00
	ldrsh r0, [r0, #0x96]
#else
	add r0, r0, #0x3e00
	ldrsh r0, [r0, #0x3a]
#endif
	bl LoadMonsterSpriteInner
	ldmia sp!, {r4, pc}
_022F769C:
	mov r0, r4
	bl LoadMonsterSpriteInner
	ldr r1, _022F7750 ; =0x0000017B
	cmp r4, r1
	cmpne r4, #0x17c
	addne r0, r1, #2
	cmpne r4, r0
	addne r0, r1, #3
	cmpne r4, r0
	beq _022F76E4
	ldr r0, _022F7754 ; =0xFFFFFC2D
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	bhi _022F7704
_022F76E4:
	ldr r0, _022F7750 ; =0x0000017B
	bl LoadMonsterSpriteInner
	mov r0, #0x17c
	bl LoadMonsterSpriteInner
	ldr r0, _022F7758 ; =0x0000017D
	bl LoadMonsterSpriteInner
	ldr r0, _022F775C ; =0x0000017E
	bl LoadMonsterSpriteInner
_022F7704:
	cmp r4, #0x1cc
	ldrne r0, _022F7760 ; =0x000001CD
	cmpne r4, r0
	beq _022F7734
	ldr r0, _022F7764 ; =0xFFFFFBDC
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
_022F7734:
	mov r0, #0x1cc
	bl LoadMonsterSpriteInner
	ldr r0, _022F7760 ; =0x000001CD
	bl LoadMonsterSpriteInner
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7748: .word 0xFFFFFE5E
_022F774C: .word DUNGEON_PTR
_022F7750: .word 0x0000017B
_022F7754: .word 0xFFFFFC2D
_022F7758: .word 0x0000017D
_022F775C: .word 0x0000017E
_022F7760: .word 0x000001CD
_022F7764: .word 0xFFFFFBDC
	arm_func_end LoadMonsterSprite

	arm_func_start DeleteMonsterSpriteFile
DeleteMonsterSpriteFile: ; 0x022F7768
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022F77F4 ; =DUNGEON_PTR
	mov r5, r0
#ifdef JAPAN
	ldr r0, [r1]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x19800
	ldrsh r1, [r0, #0x70]
#else
	ldr r1, [r1]
	ldr r0, _022F77F8 ; =0x00019914
	add r1, r1, r5, lsl #1
	ldrsh r1, [r1, r0]
#endif
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022F77FC ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
#ifdef JAPAN
	ldr r1, _022F77F4 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r1]
	mov r0, r5
	add r1, r1, r5, lsl #1
	add r1, r1, #0x19800
	strh r2, [r1, #0x70]
#else
	ldr r0, _022F77F4 ; =DUNGEON_PTR
	ldr r1, _022F77F8 ; =0x00019914
	ldr r2, [r0]
	mov r3, #0
	add r2, r2, r5, lsl #1
	mov r0, r5
	strh r3, [r2, r1]
#endif
	bl IsShaymin
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl IsShaymin
	cmp r0, #0
	ldr r0, _022F7800 ; =ov29_0237C9B0
	movne r4, #0
	ldr r0, [r0, r4, lsl #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl MemFree
	ldr r0, _022F7800 ; =ov29_0237C9B0
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F77F4: .word DUNGEON_PTR
#ifndef JAPAN
_022F77F8: .word 0x00019914
#endif
_022F77FC: .word WAN_TABLE
_022F7800: .word ov29_0237C9B0
	arm_func_end DeleteMonsterSpriteFile

	arm_func_start DeleteAllMonsterSpriteFiles
DeleteAllMonsterSpriteFiles: ; 0x022F7804
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F7830 ; =0x00000483
	mov r5, #0
_022F7810:
	mov r0, r5
	bl DeleteMonsterSpriteFile
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov r5, r0, asr #0x10
	bgt _022F7810
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7830: .word 0x00000483
	arm_func_end DeleteAllMonsterSpriteFiles

	arm_func_start ov29_022F7834
ov29_022F7834: ; 0x022F7834
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, #0
	mov r5, r0
	mov r8, r4
	mov r6, r4
	mov r7, #1
_022F784C:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	addne r4, r4, #1
	cmp r8, #4
	blt _022F784C
	cmp r4, #4
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r7, #0
	mov r8, r7
	mov r4, r7
	mov r6, #1
_022F78A8:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r6
	moveq r1, r4
	tst r1, #0xff
	beq _022F78D4
	ldrsh r0, [r0, #0xc]
	bl GetBodySize
	add r7, r7, r0
_022F78D4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022F78A8
	ldrsh r0, [r5, #4]
	bl GetBodySize
	add r0, r7, r0
	cmp r0, #6
	movgt r0, #1
	movle r0, #0
	tst r0, #0xff
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov29_022F7834

	arm_func_start ov29_022F7910
ov29_022F7910: ; 0x022F7910
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	mov sl, r0
	ldrb r0, [sl]
	mov r5, #0
	tst r0, #1
	movne r0, #1
	moveq r0, r5
	tst r0, #0xff
	ldrnesh r0, [sl, #4]
	cmpne r0, #0
	moveq r0, #0
	beq _022F7BCC
	ldrb r0, [sl, #2]
	cmp r0, #0xfa
	movne r0, #0
	bne _022F7BCC
	b _022F7AA4
_022F7958:
	mov r0, sl
	bl ov29_022F7834
	cmp r0, #0
	beq _022F7AA0
	ldrsh r1, [sl, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022F7BD4 ; =0x00000C0D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov sb, #0
	mov r7, sb
	bl StoryRestrictionsEnabled
	cmp r0, #0
	movne sb, #1
	mov r8, #0
	mov fp, #1
	add r4, sp, #0x44
_022F79A4:
	mov r0, r8
	bl GetActiveTeamMember
	mov r6, r0
	ldrb r0, [r6]
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _022F7A14
	ldrb r0, [r6, #1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _022F7A14
	cmp sb, #0
	beq _022F7A0C
	ldrb r0, [r6, #3]
	cmp r0, #0xd6
	moveq r1, #1
	movne r1, #0
	tst r1, #0xff
	bne _022F7A14
	bl JoinedAtRangeCheck2
	cmp r0, #0
	bne _022F7A14
_022F7A0C:
	str r6, [r4, r7, lsl #2]
	add r7, r7, #1
_022F7A14:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022F79A4
	cmp r7, #0
	beq _022F7AAC
	add r0, sp, #0x44
	mov r1, r7
	bl ov29_0234EF24
	movs r4, r0
	beq _022F7AA4
	add r0, sp, #4
	mov r1, r4
	bl sub_020585B4
	add r1, sp, #4
	mov r0, #1
	bl ov29_0234B0B4
	mov r0, #0
	mov r3, #1
	ldr r1, _022F7BD8 ; =0x00000C0E
	mov r2, r0
	str r3, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _022F7AA4
	ldr r1, _022F7BDC ; =0x00000C0F
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldrsh r0, [r4, #8]
	bl sub_020566C4
	mov r0, #0
	strb r0, [r4]
	b _022F7AA4
_022F7AA0:
	mov r5, #1
_022F7AA4:
	cmp r5, #0
	beq _022F7958
_022F7AAC:
	cmp r5, #0
	bne _022F7AD8
	ldrsh r1, [sl, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022F7BE0 ; =0x00000C0C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #0
	b _022F7BCC
_022F7AD8:
	mov r4, #0
	mov r6, r4
	mov r7, #1
	b _022F7BA4
_022F7AE8:
	mov r0, r4
	bl GetActiveTeamMember
	mov r5, r0
	ldrb r0, [r5]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	bne _022F7B98
	ldr r2, _022F7BE4 ; =0x000055AA
	mov r0, r5
	mov r1, sl
	mov r3, r4
	bl sub_02053250
	ldr r0, _022F7BE8 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, r4, lsl #1
	ldr r0, [r0]
	mvn r3, #0
	add r0, r0, #0x9000
	ldr r2, [r0, #0x870]
	ldr r0, _022F7BEC ; =IQ_SKILLS
	strh r3, [r2, r1]
	ldrb r2, [r5]
	ldr r1, [r0, #0x20]
	orr r0, r2, #1
	strb r0, [r5]
	ldrsh r0, [r5, #6]
	cmp r0, r1
	bge _022F7B70
	strh r1, [r5, #6]
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #6]
	add r0, r5, #0x4c
	bl EnableAllLearnableIqSkills
_022F7B70:
	ldrb r1, [r5]
	add r0, r5, #0x3e
	orr r1, r1, #2
	strb r1, [r5]
	strh r4, [r5, #0xa]
	bl ItemZInit
	ldrsh r1, [sl, #4]
	mov r0, #0
	bl ov29_0234B06C
	b _022F7BAC
_022F7B98:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_022F7BA4:
	cmp r4, #4
	blt _022F7AE8
_022F7BAC:
	ldrsh r1, [sl, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022F7BF0 ; =0x00000C12
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	mov r0, #1
_022F7BCC:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV29_022F7910_OFFSET -0x2C1
#else
#define OV29_022F7910_OFFSET 0
#endif
_022F7BD4: .word 0x00000C0D + OV29_022F7910_OFFSET
_022F7BD8: .word 0x00000C0E + OV29_022F7910_OFFSET
_022F7BDC: .word 0x00000C0F + OV29_022F7910_OFFSET
_022F7BE0: .word 0x00000C0C + OV29_022F7910_OFFSET
_022F7BE4: .word 0x000055AA
_022F7BE8: .word TEAM_MEMBER_TABLE_PTR
_022F7BEC: .word IQ_SKILLS
_022F7BF0: .word 0x00000C12 + OV29_022F7910_OFFSET
	arm_func_end ov29_022F7910

	arm_func_start ov29_022F7BF4
ov29_022F7BF4: ; 0x022F7BF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldrb r0, [r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrnesh r0, [r6, #4]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _022F7E18 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsRecruitingAllowed
	cmp r0, #0
	ldrne r0, _022F7E18 ; =DUNGEON_PTR
	ldrne r0, [r0]
	ldrneb r0, [r0, #0x759]
	cmpne r0, #0
	bne _022F7C7C
	ldrb r0, [r6, #2]
	cmp r0, #0xd9
	blo _022F7C5C
	cmp r0, #0xe4
	blo _022F7C7C
_022F7C5C:
	ldrsh r1, [r6, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022F7E1C ; =0x00000C0B
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F7E10
_022F7C7C:
	mov r0, r6
	bl ov29_022F7834
	cmp r0, #0
	beq _022F7CD4
	ldrsh r1, [r6, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldrb r0, [r6, #2]
	cmp r0, #0xd9
	blo _022F7CC0
	cmp r0, #0xe4
	bhs _022F7CC0
#ifdef JAPAN
	ldr r1, _022F93E0 ; =0x0000094F
	mov r0, #0
#else
	mov r0, #0
	mov r1, #0xc10
#endif
	mov r2, #1
	bl DisplayMessage2
	b _022F7E10
_022F7CC0:
	ldr r1, _022F7E20 ; =0x00000C0A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F7E10
_022F7CD4:
	mov r4, #0
	mov r7, r4
	mov r8, #1
	b _022F7DC4
_022F7CE4:
	mov r0, r4
	bl GetActiveTeamMember
	mov r5, r0
	ldrb r0, [r5]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	bne _022F7DB8
	ldr r2, _022F7E24 ; =0x000055AA
	mov r0, r5
	mov r1, r6
	mov r3, r4
	bl sub_02053250
	ldr r0, _022F7E28 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, r4, lsl #1
	ldr r0, [r0]
	mvn r3, #0
	add r0, r0, #0x9000
	ldr r2, [r0, #0x870]
	ldr r0, _022F7E2C ; =IQ_SKILLS
	strh r3, [r2, r1]
	ldrb r2, [r5]
	ldr r1, [r0, #0x20]
	orr r0, r2, #1
	strb r0, [r5]
	ldrsh r0, [r5, #6]
	cmp r0, r1
	bge _022F7D6C
	strh r1, [r5, #6]
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #6]
	add r0, r5, #0x4c
	bl EnableAllLearnableIqSkills
_022F7D6C:
	ldrb r1, [r5]
	add r0, r5, #0x3e
	orr r1, r1, #2
	strb r1, [r5]
	strh r4, [r5, #0xa]
	bl ItemZInit
	ldrsh r1, [r6, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldrb r0, [r6, #2]
	cmp r0, #0xd9
	blo _022F7DA4
	cmp r0, #0xe4
	blo _022F7E10
_022F7DA4:
#ifdef JAPAN
	mov r0, #0
	mov r1, #0x950
#else
	ldr r1, _022F7E30 ; =0x00000C11
	mov r0, #0
#endif
	mov r2, #1
	bl DisplayMessage2
	b _022F7E10
_022F7DB8:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_022F7DC4:
	cmp r4, #4
	blt _022F7CE4
	ldrsh r1, [r6, #4]
	mov r0, #0
	bl ov29_0234B06C
	ldrb r0, [r6, #2]
	cmp r0, #0xd9
	blo _022F7E00
	cmp r0, #0xe4
	bhs _022F7E00
#ifdef JAPAN
	ldr r1, _022F93E0 ; =0x0000094F
	mov r0, #0
#else
	mov r0, #0
	mov r1, #0xc10
#endif
	mov r2, #1
	bl DisplayMessage2
	b _022F7E10
_022F7E00:
	ldr r1, _022F7E20 ; =0x00000C0A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022F7E10:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F7E18: .word DUNGEON_PTR
#ifdef JAPAN
_022F7E1C: .word 0x0000094A
_022F93E0: .word 0x0000094F
_022F7E20: .word 0x00000949
#else
_022F7E1C: .word 0x00000C0B
_022F7E20: .word 0x00000C0A
#endif
_022F7E24: .word 0x000055AA
_022F7E28: .word TEAM_MEMBER_TABLE_PTR
_022F7E2C: .word IQ_SKILLS
#ifndef JAPAN
_022F7E30: .word 0x00000C11
#endif
	arm_func_end ov29_022F7BF4

	arm_func_start ov29_022F7E34
ov29_022F7E34: ; 0x022F7E34
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, #0
	mov r6, r8
	mov r7, #1
	mov r4, r8
	mov r5, r8
_022F7E4C:
	mov r0, r8
	bl GetActiveTeamMember
	mov sb, r0
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _022F7E94
	ldrsh r0, [sb, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	strneb r5, [sb]
	bne _022F7E94
	ldrsh r0, [sb, #8]
	bl sub_02056228
	cmp r0, #0
	strneb r4, [sb]
_022F7E94:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022F7E4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_022F7E34

	arm_func_start ov29_022F7EAC
ov29_022F7EAC: ; 0x022F7EAC
	stmdb sp!, {r3, r4, r5, lr}
	bl GetLeader
	ldr r1, _022F7F04 ; =DUNGEON_PTR
	mov r2, #0
	ldr r5, [r1]
	movs r4, r0
	strb r2, [r5, #0x78b]
	strb r2, [r5, #0x78c]
	strb r2, [r5, #0x78e]
	str r2, [r5, #0xcc]
	ldmeqia sp!, {r3, r4, r5, pc}
	bl GetTileAtEntity
	ldrh r0, [r0]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	strb r0, [r5, #0x7c8]
	and r1, r0, #0xff
	add r0, r4, #4
	strb r1, [r5, #0x7c9]
	bl DiscoverMinimap
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7F04: .word DUNGEON_PTR
	arm_func_end ov29_022F7EAC

	arm_func_start ov29_022F7F08
ov29_022F7F08: ; 0x022F7F08
	stmdb sp!, {r3, lr}
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _022F7F28
	bl GetForcedLossReason
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_022F7F28:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F7F08

#ifdef EUROPE
	arm_func_start EuFaintCheck
EuFaintCheck: ; 0x022F88E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _022F8900
	mov r0, #1
	bl ov29_0234B010
_022F8900:
	cmp r4, #0
	bne _022F892C
	bl UpdateMapSurveyorFlag
	cmp r0, #0
	beq _022F892C
	bl GetMinimapDataE447
	cmp r0, #0
	beq _022F892C
	mov r0, #1
	bl ov29_02339F88
	bl UpdateMinimap
_022F892C:
	bl ov29_022E8104
	bl ov29_022E81F8
	ldmia sp!, {r4, pc}
	arm_func_end EuFaintCheck
#endif

	arm_func_start HandleFaint
HandleFaint: ; 0x022F7F30
#ifdef JAPAN
#define HANDLE_FAINT_OFFSET -0xA4
#else
#define HANDLE_FAINT_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xbc
	mov sl, r0
#ifdef EUROPE
	ldr r7, [sl, #0xb4]
	mov r8, r2
	mov sb, r1
#else
	mov r8, r2
	mov sb, r1
	ldr r7, [sl, #0xb4]
#endif
	bl GetTileAtEntity
	mov r4, r0
	cmp r8, #0
#ifdef EUROPE
	ldrb r5, [r7, #6]
#endif
	bne _022F7F64
	add r0, sp, #4
	bl ov29_022E2470
	add r8, sp, #4
_022F7F64:
	ldr r0, [r4, #0xc]
	cmp r0, sl
	moveq r0, #0
	streq r0, [r4, #0xc]
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl DrawMinimapTile
#ifdef EUROPE
	mov r4, #0
	mov fp, r4
_022F7F8C:
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
#else
	mov r5, #0
	ldr fp, _022F85D0 ; =DUNGEON_PTR
	mov r4, r5
_022F7F8C:
	ldr r0, [fp]
	add r0, r0, r5, lsl #2
#endif
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78 + HANDLE_FAINT_OFFSET]
	cmp r6, #0
	beq _022F7FC4
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F7FC4
	ldr r1, [r6, #0xb4]
	ldr r0, [r1, #0x84]
	cmp r0, sl
#ifdef EUROPE
	streq fp, [r1, #0x84]
_022F7FC4:
	add r4, r4, #1
	cmp r4, #0x14
#else
	streq r4, [r1, #0x84]
_022F7FC4:
	add r5, r5, #1
	cmp r5, #0x14
#endif
	blt _022F7F8C
	ldrb r0, [r7, #0xd8]
	cmp r0, #2
	ldreq r0, _022F85D0 ; =DUNGEON_PTR
	moveq r1, #0
	ldreq r0, [r0]
	addeq r0, r0, #0x3000
	streqb r1, [r0, #0xe38 + HANDLE_FAINT_OFFSET]
	ldrb r0, [r7, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022F8008
	ldr r0, [r7, #0xb4]
	bl FreeOtherWrappedMonsters
_022F8008:
	mov r0, sl
	bl ov29_023159D4
	mov r1, #0
	strb r1, [sl, #0x22]
	ldr r0, _022F85D4 ; =LEADER_PTR
	strb r1, [sl, #0x20]
	str r1, [r0]
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _022F8098
	ldrb r0, [r7, #0x48]
	bl JoinedAtRangeCheck2
	cmp r0, #0
	beq _022F8098
	bl StoryRestrictionsEnabled
	cmp r0, #0
	beq _022F8098
	mov r0, #1
	bl SetForcedLossReason
	mov r2, #0
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	strh r2, [r7, #0x10]
	ldr r0, [r0]
	mov r1, sl
	add r0, r0, #0x248
	add r0, r0, #0x400
	bl ov29_022E2A78
	ldr r0, _022F85D0 ; =DUNGEON_PTR
#ifdef EUROPE
	mov r1, #0
#endif
	ldr r0, [r0]
	ldrb r0, [r0, #0x75f]
	cmp r0, #0
	moveq r0, #1
#ifdef JAPAN
	streqb r0, [r7, #0x161]
#else
	streqb r0, [r7, #0x165]
#endif
#ifdef EUROPE
	mov r0, r5
	bl EuFaintCheck
#else
	bl ov29_022E8104
	bl ov29_022E81F8
#endif
	b _022F85C8
_022F8098:
	ldrb r0, [r7, #7]
	cmp r0, #0
	beq _022F83B4
	mov r0, #0
	bl ov29_0234B1A4
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75f]
	cmp r0, #0
	bne _022F80F4
	bl GetForcedLossReason
	cmp r0, #1
	mov r0, #1
	streqb r0, [sl, #0x20]
#ifdef JAPAN
	strneb r0, [r7, #0x161]
#else
	strneb r0, [r7, #0x165]
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, #0x3c
	mov r1, #0x49
	bl ov29_022EA370
	mov r0, #0
	mov r1, r0
	bl OpenMessageLog
_022F80F4:
#ifdef EUROPE
	ldr r2, _022F85D0 ; =ov29_0235353
	ldr r3, [r2]
	ldrb r0, [r3, #0xa]
#else
	ldr r1, _022F85D0 ; =DUNGEON_PTR
	ldr r2, [r1]
	ldrb r0, [r2, #0xa]
#endif
	cmp r0, #0
	bne _022F825C
	mov r4, #0
	bl IsOutlawOrChallengeRequestFloor
	cmp r0, #0
	bne _022F8234
	bl GetForcedLossReason
	cmp r0, #4
	beq _022F8234
	ldr r0, _022F85D0 ; =DUNGEON_PTR
#ifdef EUROPE
	ldr r0, [r0]
	ldrb r1, [r0, #0x790]
	cmp r1, #0
	bne _022F8234
	ldr r2, _022F85D8 ; =0x0000025B
	cmp sb, r2
	addne r1, r2, #6
	cmpne sb, r1
	addne r1, r2, #0xb
	cmpne sb, r1
	addne r1, r2, #2
	cmpne sb, r1
	beq _022F8234
	add r1, r0, #0x4000
	ldrb r1, [r1, #0xca]
	cmp r1, #0
	bne _022F8234
	add r0, r0, #0x700
	ldrsb r1, [r0, #0x9b]
	cmp r1, #0
#else
	ldr r2, [r0]
	ldrb r0, [r2, #0x790]
	cmp r0, #0
	bne _022F8234
	ldr r1, _022F85D8 ; =0x0000025B
	cmp sb, r1
	addne r0, r1, #6
	cmpne sb, r0
	addne r0, r1, #0xb
	cmpne sb, r0
	addne r0, r1, #2
	cmpne sb, r0
	beq _022F8234
	add r0, r2, #0x4000
	ldrb r0, [r0, #0xca + HANDLE_FAINT_OFFSET]
	cmp r0, #0
	bne _022F8234
	add r0, r2, #0x700
#ifdef JAPAN
	ldrsb r1, [r0, #0x9b]
	cmp r1, #0
#else
	ldrsb r2, [r0, #0x9b]
	cmp r2, #0
#endif
#endif
	blt _022F8234
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	cmpne r0, #2
	beq _022F8234
#ifdef NORTH_AMERICA
	cmp r2, #0
#else
	cmp r1, #0
#endif
	ble _022F8220
	mov r0, r4
	mov r3, #1
	ldr r1, _022F85DC ; =0x00000C13
	mov r2, r0
	str r3, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _022F8208
	ldr r1, _022F85E0 ; =0x00000C14
	mov r0, r4
	mov r2, #1
	bl DisplayMessage
#ifdef EUROPE
	ldr r2, _022F85D0 ; =DUNGEON_PTR
	mov r1, #1
	ldr r3, [r2]
	mov r0, r5
	strb r1, [r3, #8]
	ldr r3, [r2]
	strb r1, [r3, #0xa]
	ldr r3, [r2]
	strb r1, [r3, #0x758]
	ldr r3, [r2]
	add r2, r3, #0x700
	ldrsb r2, [r2, #0x9b]
	sub r2, r2, #1
	strb r2, [r3, #0x79b]
	bl EuFaintCheck
#else
	ldr r1, _022F85D0 ; =DUNGEON_PTR
	mov r0, #1
	ldr r2, [r1]
	strb r0, [r2, #8]
	ldr r2, [r1]
	strb r0, [r2, #0xa]
	ldr r2, [r1]
	strb r0, [r2, #0x758]
	ldr r2, [r1]
	add r1, r2, #0x700
	ldrsb r1, [r1, #0x9b]
	sub r1, r1, #1
	strb r1, [r2, #0x79b]
	bl ov29_0234B010
	bl ov29_022E8104
	bl ov29_022E81F8
#endif
	b _022F85C8
_022F8208:
	cmp r0, #2
	bne _022F8240
	mov r0, r7
	bl ov29_022F7F08
	mov r4, r0
	b _022F8240
_022F8220:
#if defined(EUROPE)
	rsb r1, r2, #0xe70
#elif defined(JAPAN)
	ldr r1, _022F9BA4 ; =0x00000954
#else
	rsb r1, r1, #0xe70
#endif
	mov r0, r4
	mov r2, #1
	bl DisplayMessage2
	b _022F8240
_022F8234:
	mov r0, r7
	bl ov29_022F7F08
	mov r4, r0
_022F8240:
	mov r0, #1
	bl ov29_0234B010
	cmp r4, #0
	beq _022F8284
	mov r0, sl
	bl ov29_022E68BC
	b _022F8284
_022F825C:
#ifdef EUROPE
	mov r1, #1
	strb r1, [r3, #8]
	ldr r3, [r2]
	mov r0, r5
	strb r1, [r3, #0xa]
	ldr r2, [r2]
	strb r1, [r2, #0x758]
	bl EuFaintCheck
#else
	mov r0, #1
	strb r0, [r2, #8]
	ldr r2, [r1]
	strb r0, [r2, #0xa]
	ldr r1, [r1]
	strb r0, [r1, #0x758]
	bl ov29_0234B010
	bl ov29_022E8104
	bl ov29_022E81F8
#endif
	b _022F85C8
_022F8284:
	ldr r0, _022F85E4 ; =0x00000266
	cmp sb, r0
	bne _022F82B4
	ldr r1, _022F85D0 ; =DUNGEON_PTR
	mov r0, sb
	ldr r2, [r1]
	mov r1, r8
	add r3, r2, #0x248
	mov r2, sl
	add r3, r3, #0x400
	bl ov29_022ECDE4
	b _022F82C8
_022F82B4:
	mov r0, sb
	mov r1, r8
	mov r2, sl
	mov r3, #0
	bl ov29_022ECDE4
_022F82C8:
	ldr r0, _022F85E8 ; =0x0000025E
	cmp sb, r0
	bne _022F83B4
#ifdef EUROPE
	mov r6, #0
	mov r4, r6
	ldr fp, _022F85D0 ; =DUNGEON_PTR
	b _022F8328
_022F82E4:
	ldr r0, [fp]
#else
	mov r5, #0
	mov r4, r5
	ldr r6, _022F85D0 ; =DUNGEON_PTR
	b _022F8328
_022F82E4:
	ldr r0, [r6]
#endif
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28 + HANDLE_FAINT_OFFSET]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F8324
#ifdef EUROPE
	ldr r6, [r8, #0xb4]
	ldrsh r0, [r6, #0x10]
	cmp r0, #0
	bne _022F8324
	ldrb r0, [r6, #0x48]
#else
	ldr r5, [r8, #0xb4]
	ldrsh r0, [r5, #0x10]
	cmp r0, #0
	bne _022F8324
	ldrb r0, [r5, #0x48]
#endif
	bl JoinedAtRangeCheck2
	cmp r0, #0
	bne _022F8330
_022F8324:
	add r4, r4, #1
_022F8328:
	cmp r4, #4
	blt _022F82E4
_022F8330:
#ifdef EUROPE
	cmp r6, #0
	beq _022F83B4
	ldrsh r0, [r6, #0xc]
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r6, #0xc]
	mov r1, r6
#else
	cmp r5, #0
	beq _022F83B4
	ldrsh r0, [r5, #0xc]
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r5, #0xc]
	mov r1, r5
#endif
	bl ov29_022FE048
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _022F83A8
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	bne _022F83A8
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	beq _022F83A8
#ifdef EUROPE
	ldrsh r0, [r6, #0xc]
#else
	ldrsh r0, [r5, #0xc]
#endif
	mvn r1, #0
	bl RevertGiratinaAndShaymin
	ldrsh r0, [r4, #8]
	mov r1, r4
	bl sub_0205349C
_022F83A8:
	ldrb r0, [r4]
	orr r0, r0, #8
	strb r0, [r4]
_022F83B4:
	mov r0, sl
	mov r1, #1
	bl ov29_022E1C0C
	ldrb r0, [r7, #6]
	cmp r0, #0
	ldrne r0, _022F85D8 ; =0x0000025B
	cmpne sb, r0
	beq _022F83F4
	ldrb r0, [r7, #0xbc]
	bl ov29_022EFAE8
	cmp r0, #0
	beq _022F83F4
	mov r0, #1
	bl SetMissionTargetEnemyDefeated
	mov r0, #1
	bl ov29_02349688
_022F83F4:
	ldrb r0, [r7, #0x48]
	cmp r0, #0xfa
	bne _022F8428
	mov r0, #2
	bl SetForcedLossReason
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	mov r1, sl
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x248
	add r0, r0, #0x400
	bl ov29_022E2A78
	b _022F8460
_022F8428:
	cmp r0, #0xe3
	beq _022F8460
	bl JoinedAtRangeCheck
	cmp r0, #0
	beq _022F8460
	mov r0, #3
	bl SetForcedLossReason
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	mov r1, sl
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x248
	add r0, r0, #0x400
	bl ov29_022E2A78
_022F8460:
	bl GetLeader
	cmp r0, #0
	ldrne r0, _022F85D8 ; =0x0000025B
	cmpne sb, r0
	beq _022F84AC
	ldrb r0, [r7, #7]
	cmp r0, #0
	bne _022F84AC
	bl GetForcedLossReason
	cmp r0, #0
	bne _022F84AC
	ldr r0, _022F85EC ; =0x00000233
	ldrb r1, [r7, #0xbc]
	cmp sb, r0
	moveq r2, #1
	movne r2, #0
	mov r0, sl
	and r2, r2, #0xff
	bl ov29_022EF7C4
_022F84AC:
	ldrb r0, [r7, #6]
	cmp r0, #0
	bne _022F8594
	ldrsh r0, [r7, #0xc]
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r7, #0xc]
	mov r1, r7
	bl ov29_022FE048
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _022F856C
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	bne _022F8528
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	beq _022F8528
	ldrsh r0, [r7, #0xc]
	mvn r1, #0
	bl RevertGiratinaAndShaymin
	ldrsh r0, [r4, #8]
	mov r1, r4
	bl sub_0205349C
_022F8528:
	ldrb r0, [r7, #7]
#ifdef EUROPE
	mov r6, #0
	cmp r0, #0
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	movne r6, #1
#else
	mov r5, #0
	cmp r0, #0
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	movne r5, #1
#endif
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _022F855C
	ldrb r0, [r7, #0x48]
	bl JoinedAtRangeCheck2
	cmp r0, #0
#ifdef EUROPE
	movne r6, #1
_022F855C:
	cmp r6, #0
#else
	movne r5, #1
_022F855C:
	cmp r5, #0
#endif
	bne _022F856C
	ldrsh r0, [r4, #8]
	bl sub_020566C4
_022F856C:
	ldrb r0, [r7, #7]
	cmp r0, #0
	ldrneb r0, [r4]
	orrne r0, r0, #8
	strneb r0, [r4]
	bne _022F8594
	add r0, r7, #0x62
	bl RemoveHolderForItemInBag
	mov r0, #0
	strb r0, [r4]
_022F8594:
	ldr r0, [r7, #0xb0]
	bl ov29_022DDB68
	ldr r0, _022F85D0 ; =DUNGEON_PTR
	ldr r1, _022F85D4 ; =LEADER_PTR
	mov r2, #0
	ldr r0, [r0]
	str r2, [r1]
	mov r1, #1
	strb r1, [r0, #0xe]
	str r2, [sl]
	bl PopulateActiveMonsterPtrs
#ifdef EUROPE
	mov r0, r5
	mov r1, #0
	bl EuFaintCheck
#else
	bl ov29_022E8104
	bl ov29_022E81F8
#endif
_022F85C8:
	add sp, sp, #0xbc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F85D0: .word DUNGEON_PTR
_022F85D4: .word LEADER_PTR
_022F85D8: .word 0x0000025B
#ifdef JAPAN
_022F85DC: .word 0x00000952
_022F85E0: .word 0x00000953
_022F9BA4: .word 0x00000954
#else
_022F85DC: .word 0x00000C13
_022F85E0: .word 0x00000C14
#endif
_022F85E4: .word 0x00000266
_022F85E8: .word 0x0000025E
_022F85EC: .word 0x00000233
	arm_func_end HandleFaint

	arm_func_start MoveMonsterToPos
MoveMonsterToPos: ; 0x022F85F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r0, r8
	mov r1, r7
	mov r6, r3
	bl GetTileSafe
	ldr r5, [sb, #0xb4]
	mov r4, r0
	ldrb r0, [r5, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022F8634
	ldr r0, [r5, #0xb4]
	bl FreeOtherWrappedMonsters
_022F8634:
	ldrb r0, [r5, #0xc4]
	cmp r0, #7
	cmpne r0, #5
	cmpne r0, #2
	bne _022F8658
	mov r0, sb
	mov r1, sb
	mov r2, #1
	bl EndFrozenClassStatus
_022F8658:
	ldrsh r1, [sb, #4]
	cmp r8, r1
	ldreqsh r0, [sb, #6]
	cmpeq r7, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r1, #0
	ldrgesh r2, [sb, #6]
	cmpge r2, #0
	blt _022F8690
	mov r0, sb
	bl ov29_02337EC0
	ldrsh r0, [sb, #4]
	ldrsh r1, [sb, #6]
	bl DrawMinimapTile
_022F8690:
	ldrsh r2, [sb, #4]
	mov r0, r8, lsl #0x10
	mov r1, r7, lsl #0x10
	strh r2, [sb, #8]
	ldrsh r2, [sb, #6]
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	strh r2, [sb, #0xa]
	strh r0, [sb, #4]
	strh r1, [sb, #6]
	ldrb r2, [r5, #7]
	cmp r2, #0
	beq _022F86C8
	bl ov29_02338F24
_022F86C8:
	str sb, [r4, #0xc]
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022F86FC
	mov r0, r8, lsl #0x10
	mov r1, r7, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov29_02338F24
	ldr r0, _022F87BC ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
_022F86FC:
	mov r0, r8
	mov r1, r7
	bl DrawMinimapTile
	cmp r6, #0
	beq _022F871C
	cmp r6, #1
	beq _022F8768
	b _022F87A8
_022F871C:
	ldrh r0, [r5, #0x72]
	strh r0, [r5, #0x76]
	ldrh r0, [r5, #0x74]
	strh r0, [r5, #0x78]
	ldrh r0, [r5, #0x6e]
	strh r0, [r5, #0x72]
	ldrh r0, [r5, #0x70]
	strh r0, [r5, #0x74]
	ldrh r0, [r5, #0x6a]
	strh r0, [r5, #0x6e]
	ldrh r0, [r5, #0x6c]
	strh r0, [r5, #0x70]
	ldrb r0, [r5, #0xef]
	cmp r0, #1
	ldrneh r0, [sb, #8]
	strneh r0, [r5, #0x6a]
	ldrneh r0, [sb, #0xa]
	strneh r0, [r5, #0x6c]
	b _022F87A8
_022F8768:
	ldrh r0, [sb, #4]
	strh r0, [r5, #0x6a]
	ldrh r0, [sb, #6]
	strh r0, [r5, #0x6c]
	ldrh r0, [r5, #0x6a]
	strh r0, [r5, #0x6e]
	ldrh r0, [r5, #0x6c]
	strh r0, [r5, #0x70]
	ldrh r0, [r5, #0x6e]
	strh r0, [r5, #0x72]
	ldrh r0, [r5, #0x70]
	strh r0, [r5, #0x74]
	ldrh r0, [r5, #0x72]
	strh r0, [r5, #0x76]
	ldrh r0, [r5, #0x74]
	strh r0, [r5, #0x78]
_022F87A8:
	ldrb r1, [r4, #7]
	mov r0, sb
	strb r1, [sb, #0x25]
	bl DetermineMonsterShadow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F87BC: .word DUNGEON_PTR
	arm_func_end MoveMonsterToPos

	arm_func_start ov29_022F87C0
ov29_022F87C0: ; 0x022F87C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r5, [r4, #0xb4]
	ldrb r1, [r5, #0x4c]
	bl CanAttackInDirection
	cmp r0, #0
	beq _022F8820
	ldrb r2, [r5, #0x4c]
	ldr r1, _022F8828 ; =DIRECTIONS_XY
	ldr r0, _022F882C ; =DIRECTIONS_XY + 2
	mov ip, r2, lsl #2
	ldrsh lr, [r4, #4]
	ldrsh r3, [r1, ip]
	ldrsh r2, [r4, #6]
	ldrsh r1, [r0, ip]
	add r0, lr, r3
	add r1, r2, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _022F8820
	ldr r1, [r0]
	cmp r1, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_022F8820:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8828: .word DIRECTIONS_XY
_022F882C: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022F87C0

	arm_func_start ov29_022F8830
ov29_022F8830: ; 0x022F8830
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r5, [r4, #0xb4]
	ldr r0, _022F88B8 ; =DIRECTIONS_XY
	ldrb r2, [r5, #0x4c]
	ldrsh r3, [r4, #4]
	ldr r1, _022F88BC ; =DIRECTIONS_XY + 2
	mov r2, r2, lsl #2
	ldrsh r0, [r0, r2]
	add r0, r3, r0
	strh r0, [sp]
	ldrb r2, [r5, #0x4c]
	ldrsh r3, [r4, #6]
	ldrsh r0, [sp]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #2]
	ldrsh r1, [sp, #2]
	bl GetTile
	mov r5, r0
	add r1, sp, #0
	mov r0, r4
	bl ov29_022FFB90
	cmp r0, #0
	bne _022F88B0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _022F88B0
	ldr r1, [r0]
	cmp r1, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_022F88B0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F88B8: .word DIRECTIONS_XY
_022F88BC: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022F8830

	arm_func_start ov29_022F88C0
ov29_022F88C0: ; 0x022F88C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldr r0, _022F89A4 ; =DIRECTIONS_XY
	ldrb r2, [r4, #0x4c]
	ldrsh r3, [r5, #4]
	ldr r1, _022F89A8 ; =DIRECTIONS_XY + 2
	mov r2, r2, lsl #2
	ldrsh r0, [r0, r2]
	add r0, r3, r0
	strh r0, [sp]
	ldrb r2, [r4, #0x4c]
	ldrsh r3, [r5, #6]
	ldrsh r0, [sp]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #2]
	ldrsh r1, [sp, #2]
	bl GetTile
	add r1, sp, #0
	mov r0, r5
	bl ov29_022FFB90
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x4c]
	ldr r0, _022F89A4 ; =DIRECTIONS_XY
	ldrsh r2, [r5, #4]
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	ldr r1, _022F89A8 ; =DIRECTIONS_XY + 2
	add r0, r2, r0, lsl #1
	strh r0, [sp]
	ldrb r2, [r4, #0x4c]
	ldrsh r3, [r5, #6]
	ldrsh r0, [sp]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1, lsl #1
	strh r1, [sp, #2]
	ldrsh r1, [sp, #2]
	bl GetTile
	mov r4, r0
	add r1, sp, #0
	mov r0, r5
	bl ov29_022FFB90
	cmp r0, #0
	bne _022F899C
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _022F899C
	ldr r1, [r0]
	cmp r1, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_022F899C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F89A4: .word DIRECTIONS_XY
_022F89A8: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022F88C0

	arm_func_start ov29_022F89AC
ov29_022F89AC: ; 0x022F89AC
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl ov29_022F8FF8
	ldrsh r0, [sp]
	ldrsh r1, [sp, #2]
	bl GetTile
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F89AC

	arm_func_start CreateMonsterSummaryFromMonster
CreateMonsterSummaryFromMonster: ; 0x022F89CC
#ifdef JAPAN
#define CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET -4
#else
#define CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r5, [r6, #0xb4]
	mov r7, r0
	mov r1, r5
	add r0, r7, #2
	bl GetMonsterName
	ldrsh r1, [r5, #2]
	ldr r0, _022F8FF0 ; =0x000003E7
	mov r3, #0
	strh r1, [r7]
	ldrsh r1, [r5, #0x10]
	str r1, [r7, #0x24]
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	str r1, [r7, #0x28]
	ldrb r0, [r5, #0xa]
	str r0, [r7, #0x2c]
	ldr r0, [r5, #0x20]
	str r0, [r7, #0x30]
_022F8A28:
	add r2, r5, r3
	ldrb r0, [r2, #0x1a]
	add r1, r7, r3
	add r3, r3, #1
	strb r0, [r1, #0x34]
	ldrb r0, [r2, #0x1c]
	cmp r3, #2
	strb r0, [r1, #0x36]
	ldrb r0, [r2, #0x5e]
	strb r0, [r1, #0x16]
	ldrb r0, [r2, #0x60]
	strb r0, [r1, #0x18]
	blt _022F8A28
	ldrb r0, [r5, #7]
	mov r1, #0
	strb r0, [r7, #0x38]
	strb r1, [r7, #0x39]
	strb r1, [r7, #0x3a]
	strb r1, [r7, #0x3b]
	strb r1, [r7, #0x3c]
	ldrb r0, [r5, #0xd8]
	cmp r0, #4
	moveq r0, #1
	streqb r0, [r7, #0x45]
	strneb r1, [r7, #0x45]
	mov r0, r6
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	str r0, [sp]
	ldrsh r1, [r5, #2]
	ldrsh r3, [r5, #0xe]
	mov r0, r7
	add r2, r5, #0x62
	bl GetStatBoostsForMonsterSummary
	ldrb r2, [r5, #0xa8]
	mov r1, #0
	add r0, r5, #0x90
	strb r2, [r7, #0x54]
	ldrh r2, [r5, #0x62]
	add r4, r7, #0x48
	ldr r3, _022F8FF4 ; =DUNGEON_PTR
	strh r2, [r7, #0x1c]
	ldrh r2, [r5, #0x64]
	strh r2, [r7, #0x1e]
	ldrh r2, [r5, #0x66]
	strh r2, [r7, #0x20]
	ldrsh r2, [r5, #0xe]
	strh r2, [r7, #0x3e]
	ldrb r2, [r5, #0x48]
	strb r2, [r7, #0x1a]
	ldrb r2, [r5, #0x49]
	strb r2, [r7, #0x1b]
	strb r1, [r7, #0x42]
	strb r1, [r7, #0x43]
	ldmia r0, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	ldr r0, [r3]
	ldrb r0, [r0, #0x75a]
	cmp r0, #0
	moveq r0, #3
	beq _022F8B24
	mov r0, r5
	bl ov29_022F9B8C
_022F8B24:
	strb r0, [r7, #0x44]
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _022F8FF0 ; =0x000003E7
	mov r4, #0
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	ldrsh r1, [r5, #0x10]
	sub r2, sp, #4
	cmp r1, r0, asr #2
	movle r0, #6
	strleb r0, [r7, #0x58]
	ldr r0, _022F8FF4 ; =DUNGEON_PTR
	addle r4, r4, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x78d]
	cmp r0, #0
	addne r0, r7, r4
	movne r1, #0xb
	strneb r1, [r0, #0x58]
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46 + CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET]
	addne r4, r4, #1
	strh r1, [r2]
	ldrh r0, [r0, #0x48 + CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _022F8BC4
	ldrb r0, [r5, #7]
	cmp r0, #0
	movne r1, #0x13
	add r0, r7, r4
	moveq r1, #0x42
	strb r1, [r0, #0x58]
	add r4, r4, #1
_022F8BC4:
	ldr r0, [r6, #0xb4]
	ldr r0, [r0, #0x110 + CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET]
	cmp r0, #1
	addgt r0, r7, r4
	movgt r1, #0x1b
	strgtb r1, [r0, #0x58]
	ldr r0, [r6, #0xb4]
	addgt r4, r4, #1
	ldr r0, [r0, #0x110 + CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET]
	cmp r0, #1
	addlt r0, r7, r4
	movlt r1, #0x29
	strltb r1, [r0, #0x58]
	ldr r0, [r5, #0x34]
	addlt r4, r4, #1
	cmp r0, #0x100
	ldrge r0, [r5, #0x38]
	cmpge r0, #0x100
	ldrge r0, [r5, #0x3c]
	cmpge r0, #0x100
	ldrge r0, [r5, #0x40]
	cmpge r0, #0x100
	ldrgesh r0, [r5, #0x24]
	cmpge r0, #0xa
	ldrgesh r0, [r5, #0x26]
	cmpge r0, #0xa
	ldrgesh r0, [r5, #0x28]
	cmpge r0, #0xa
	ldrgesh r0, [r5, #0x2a]
	cmpge r0, #0xa
	ldrgesh r0, [r5, #0x2c]
	cmpge r0, #0xa
	ldrgesh r0, [r5, #0x2e]
	cmpge r0, #0xa
	addlt r0, r7, r4
	movlt r1, #0x3b
	strltb r1, [r0, #0x58]
	ldr r0, [r5, #0x34]
	addlt r4, r4, #1
	cmp r0, #0x100
	ldrle r0, [r5, #0x38]
	cmple r0, #0x100
	ldrle r0, [r5, #0x3c]
	cmple r0, #0x100
	ldrle r0, [r5, #0x40]
	cmple r0, #0x100
	ldrlesh r0, [r5, #0x24]
	cmple r0, #0xa
	ldrlesh r0, [r5, #0x26]
	cmple r0, #0xa
	ldrlesh r0, [r5, #0x28]
	cmple r0, #0xa
	ldrlesh r0, [r5, #0x2a]
	cmple r0, #0xa
	ldrlesh r0, [r5, #0x2c]
	cmple r0, #0xa
	ldrlesh r0, [r5, #0x2e]
	cmple r0, #0xa
	addgt r0, r7, r4
	movgt r1, #0x45
	strgtb r1, [r0, #0x58]
	ldrb r1, [r5, #0xbd]
	addgt r4, r4, #1
	cmp r1, #0
	beq _022F8CD8
	cmp r4, #0x1e
	addlt r0, r7, r4
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8CD8:
	ldrb r1, [r5, #0xbf]
	cmp r1, #0
	beq _022F8CF8
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #6
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8CF8:
	ldrb r1, [r5, #0xc4]
	cmp r1, #0
	beq _022F8D18
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0xb
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8D18:
	ldrb r1, [r5, #0xd0]
	cmp r1, #0
	beq _022F8D38
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x13
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8D38:
	ldrb r1, [r5, #0xd2]
	cmp r1, #0
	beq _022F8D58
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x1b
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8D58:
	ldrb r1, [r5, #0xd5]
	cmp r1, #0
	beq _022F8D78
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x29
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8D78:
	ldrb r1, [r5, #0xd8]
	cmp r1, #0
	beq _022F8D98
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x3b
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8D98:
	ldrb r1, [r5, #0xe0]
	cmp r1, #0
	beq _022F8DB8
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x42
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8DB8:
	ldrb r1, [r5, #0xec]
	cmp r1, #0
	beq _022F8DD8
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x45
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8DD8:
	ldrb r1, [r5, #0xee]
	cmp r1, #0
	beq _022F8DF8
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x4a
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8DF8:
	ldrb r1, [r5, #0xef]
	cmp r1, #0
	beq _022F8E18
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x4d
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8E18:
	ldrb r1, [r5, #0xf1]
	cmp r1, #0
	beq _022F8E38
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x52
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8E38:
	ldrb r1, [r5, #0xf3]
	cmp r1, #0
	beq _022F8E58
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x57
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8E58:
	ldrb r1, [r5, #0xf5]
	cmp r1, #0
	beq _022F8E78
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x59
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8E78:
	ldrb r1, [r5, #0xf7]
	cmp r1, #0
	beq _022F8E98
	cmp r4, #0x1e
	addlt r0, r7, r4
	addlt r1, r1, #0x5b
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8E98:
	ldrb r0, [r5, #0x11e + CREATE_MONSTER_SUMMARY_FROM_MONSTER_OFFSET]
	cmp r0, #0
	beq _022F8EB8
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x5d
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8EB8:
	ldrb r0, [r5, #0xf9]
	cmp r0, #0
	beq _022F8ED8
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x5e
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8ED8:
	ldrb r0, [r5, #0xfa]
	cmp r0, #0
	beq _022F8EF8
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x5f
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8EF8:
	ldrb r0, [r5, #0xfd]
	cmp r0, #0
	beq _022F8F18
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x60
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8F18:
	ldrb r0, [r5, #0xfe]
	cmp r0, #0
	beq _022F8F38
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x61
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8F38:
	mov r0, r6
	bl ShouldMonsterRunAway
	cmp r0, #0
	beq _022F8F5C
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x62
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8F5C:
#ifdef JAPAN
	ldrb r0, [r5, #0x105]
#else
	ldrb r0, [r5, #0x106]
#endif
	cmp r0, #0
	beq _022F8F7C
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x63
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8F7C:
	mov r0, r6
	mov r1, #0
	bl GetNumberOfAttacks
	cmp r0, #2
	blt _022F8FA4
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x64
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8FA4:
	ldrb r0, [r5, #0xfb]
	cmp r0, #0
	beq _022F8FC4
	cmp r4, #0x1e
	addlt r0, r7, r4
	movlt r1, #0x65
	strltb r1, [r0, #0x58]
	addlt r4, r4, #1
_022F8FC4:
	mov r1, #0
	b _022F8FD8
_022F8FCC:
	add r0, r7, r4
	strb r1, [r0, #0x58]
	add r4, r4, #1
_022F8FD8:
	cmp r4, #0x1e
	blt _022F8FCC
	add r0, r7, r4
	mov r1, #0
	strb r1, [r0, #0x58]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F8FF0: .word 0x000003E7
_022F8FF4: .word DUNGEON_PTR
	arm_func_end CreateMonsterSummaryFromMonster

	arm_func_start ov29_022F8FF8
ov29_022F8FF8: ; 0x022F8FF8
	stmdb sp!, {r4, lr}
	ldr r2, [r1, #0xb4]
	ldr ip, _022F9050 ; =DIRECTIONS_XY
	ldrb lr, [r2, #0x4c]
	ldrsh r4, [r1, #4]
	ldr r3, _022F9054 ; =DIRECTIONS_XY + 2
	mov lr, lr, lsl #2
	ldrsh ip, [ip, lr]
	add r4, r4, ip
	strh r4, [r0]
	ldrb ip, [r2, #0x4c]
	ldrsh lr, [r1, #6]
	mov r1, ip, lsl #2
	ldrsh r1, [r3, r1]
	add r1, lr, r1
	strh r1, [r0, #2]
	ldrb r0, [r2, #0x4c]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9050: .word DIRECTIONS_XY
_022F9054: .word DIRECTIONS_XY + 2
	arm_func_end ov29_022F8FF8

	arm_func_start ov29_022F9058
ov29_022F9058: ; 0x022F9058
#ifdef JAPAN
#define OV29_022F9058_OFFSET -4
#else
#define OV29_022F9058_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r4, [r1, #0xb4]
	mov r5, r0
	ldrsh r0, [r4, #2]
	strh r0, [r5]
	ldrh r0, [r1, #4]
	strh r0, [r5, #2]
	ldrh r0, [r1, #6]
	strh r0, [r5, #4]
	ldrb r0, [r4, #0x100]
	cmp r0, #0
	ldrnesh r0, [r4, #0x14]
	ldreqsh r0, [r4, #0x12]
	strh r0, [r5, #6]
	ldrb r1, [r4, #0xa]
	add r0, sp, #0
	strh r1, [r5, #0xc]
	ldrsh r1, [r4, #2]
	ldrb r2, [r4, #0xa]
	bl GetLvlUpEntry
	ldr r0, [sp]
	add r3, r4, #0x124 + OV29_022F9058_OFFSET
	str r0, [r5, #0x10]
	ldrb r0, [r4, #0x1a]
	add r2, r5, #0x22
	mov r1, #0x11
	strb r0, [r5, #8]
	ldrb r0, [r4, #0x1b]
	strb r0, [r5, #9]
	ldrb r0, [r4, #0x1c]
	strb r0, [r5, #0xa]
	ldrb r0, [r4, #0x1d]
	strb r0, [r5, #0xb]
	ldrh r0, [r4, #0x62]
	strh r0, [r5, #0x1c]
	ldrh r0, [r4, #0x64]
	strh r0, [r5, #0x1e]
	ldrh r0, [r4, #0x66]
	strh r0, [r5, #0x20]
_022F90F8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F90F8
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46 + OV29_022F9058_OFFSET]
	strh r1, [r5, #0x14]
	ldrh r1, [r0, #0x48 + OV29_022F9058_OFFSET]
	strh r1, [r5, #0x16]
	ldrh r1, [r0, #0x4a + OV29_022F9058_OFFSET]
	strh r1, [r5, #0x18]
	ldrh r0, [r0, #0x4c + OV29_022F9058_OFFSET]
	strh r0, [r5, #0x1a]
	ldrh r0, [r4, #0x44]
	strh r0, [r5, #0x44]
	ldrh r0, [r4, #0x46]
	strh r0, [r5, #0x46]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_022F9058

	arm_func_start UpdateAiTargetPos
UpdateAiTargetPos: ; 0x022F9144
	stmdb sp!, {r3, lr}
	ldr lr, [r0, #0xb4]
	ldr r2, _022F918C ; =DIRECTIONS_XY
	ldrb r3, [lr, #0x4c]
	ldrsh ip, [r0, #4]
	add r1, lr, #0x100
	mov r3, r3, lsl #2
	ldrsh r3, [r2, r3]
	ldr r2, _022F9190 ; =DIRECTIONS_XY + 2
	add r3, ip, r3
#ifdef JAPAN
	strh r3, [r1, #0x7a]
#else
	strh r3, [r1, #0x7e]
#endif
	ldrb r3, [lr, #0x4c]
	ldrsh ip, [r0, #6]
	mov r0, r3, lsl #2
	ldrsh r0, [r2, r0]
	add r0, ip, r0
#ifdef JAPAN
	strh r0, [r1, #0x7c]
#else
	strh r0, [r1, #0x80]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F918C: .word DIRECTIONS_XY
_022F9190: .word DIRECTIONS_XY + 2
	arm_func_end UpdateAiTargetPos

	arm_func_start SetMonsterTypeAndAbility
SetMonsterTypeAndAbility: ; 0x022F9194
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r1, #0x25
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F91D8
	mov r0, r5
	bl GetApparentWeather
	mov r1, #6
	mul r2, r0, r1
	ldr r1, _022F9234 ; =CASTFORM_WEATHER_ATTRIBUTE_TABLE
	mov r0, #0
	ldrb r1, [r1, r2]
	strb r1, [r4, #0x5e]
	strb r0, [r4, #0x5f]
	b _022F91FC
_022F91D8:
	mov r5, #0
_022F91DC:
	ldrsh r0, [r4, #2]
	mov r1, r5
	bl GetType
	add r1, r4, r5
	add r5, r5, #1
	strb r0, [r1, #0x5e]
	cmp r5, #2
	blt _022F91DC
_022F91FC:
	mov r5, #0
_022F9200:
	ldrsh r0, [r4, #2]
	mov r1, r5
	bl GetAbility
	add r1, r4, r5
	add r5, r5, #1
	strb r0, [r1, #0x60]
	cmp r5, #2
	blt _022F9200
	ldr r0, _022F9238 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xe]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F9234: .word CASTFORM_WEATHER_ATTRIBUTE_TABLE
_022F9238: .word DUNGEON_PTR
	arm_func_end SetMonsterTypeAndAbility

	arm_func_start TryActivateSlowStart
TryActivateSlowStart: ; 0x022F923C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov r7, #1
	ldr r5, _022F92D0 ; =0x00000C17
	ldr r4, _022F92D4 ; =DUNGEON_PTR
	mov r6, sb
	mov fp, r7
	mov r8, #0x5e
_022F925C:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xad4]
#else
	ldr sl, [r0, #0xb78]
#endif
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F92C0
	mov r0, sl
	mov r1, r8
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F92C0
	mov r0, r7
	mov r1, sl
	mov r2, r6
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	mov r1, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, sl
	mov r1, sl
	mov r2, fp
	mov r3, #0
	bl LowerSpeed
_022F92C0:
	add sb, sb, #1
	cmp sb, #0x14
	blt _022F925C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_022F92D0: .word 0x00000956
#else
_022F92D0: .word 0x00000C17
#endif
_022F92D4: .word DUNGEON_PTR
	arm_func_end TryActivateSlowStart

	arm_func_start TryActivateArtificialWeatherAbilities
TryActivateArtificialWeatherAbilities: ; 0x022F92D8
#ifdef JAPAN
#define TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET -0xA4
#else
#define TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl IsSecretFloor
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _022F9404 ; =DUNGEON_PTR
	ldr r1, [r4]
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	strb sb, [r1, #0xe]
	ldr r0, [r4]
	mov r5, #1
	add r0, r0, #0xc000
	strb sb, [r0, #0xd5d + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
	mov r6, r5
	mov r7, r5
	mov r8, r5
	mov fp, r5
_022F9324:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb78 + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F93F4
	mov r0, sl
	mov r1, #4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r8, [r0, #0xae]
#else
	addne r0, r0, #0xcd00
	strneh r8, [r0, #0x52]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x1c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r7, [r0, #0xaa]
#else
	addne r0, r0, #0xcd00
	strneh r7, [r0, #0x4e]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x31
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r6, [r0, #0xa8]
#else
	addne r0, r0, #0xcd00
	strneh r6, [r0, #0x4c]
#endif
	bne _022F93C0
	mov r0, sl
	mov r1, #0x78
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
#ifdef JAPAN
	addne r0, r0, #0xcc00
	strneh r5, [r0, #0xb0]
#else
	addne r0, r0, #0xcd00
	strneh r5, [r0, #0x54]
#endif
_022F93C0:
	mov r0, sl
	mov r1, #8
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _022F93E8
	mov r0, sl
	mov r1, #0x2d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F93F4
_022F93E8:
	ldr r0, [r4]
	add r0, r0, #0xc000
	strb fp, [r0, #0xd5d + TRY_ACTIVATE_ARTIFICIAL_WEATHER_ABILITIES_OFFSET]
_022F93F4:
	add sb, sb, #1
	cmp sb, #0x14
	blt _022F9324
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9404: .word DUNGEON_PTR
	arm_func_end TryActivateArtificialWeatherAbilities

	arm_func_start GetMonsterApparentId
GetMonsterApparentId: ; 0x022F9408
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _022F94A8
	ldr r2, _022F94E0 ; =0x0000017B
	cmp r1, r2
	blt _022F945C
	add r2, r2, #3
	cmp r1, r2
	bgt _022F945C
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldreq r0, _022F94E0 ; =0x0000017B
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetApparentWeather
	mov r1, #6
	mul r1, r0, r1
	ldr r0, _022F94E4 ; =ov10_022C4C6E
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
_022F945C:
	ldr r0, _022F94E8 ; =0x000003D3
	cmp r1, r0
	blt _022F94D8
	add r0, r0, #3
	cmp r1, r0
	bgt _022F94D8
	mov r0, r4
	mov r1, #0x25
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldreq r0, _022F94E8 ; =0x000003D3
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetApparentWeather
	mov r1, #6
	mul r1, r0, r1
	ldr r0, _022F94EC ; =ov10_022C4C70
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
_022F94A8:
	ldr r0, _022F94E0 ; =0x0000017B
	cmp r1, r0
	blt _022F94C0
	add r2, r0, #3
	cmp r1, r2
	ldmleia sp!, {r4, pc}
_022F94C0:
	ldr r0, _022F94E8 ; =0x000003D3
	cmp r1, r0
	blt _022F94D8
	add r2, r0, #3
	cmp r1, r2
	ldmleia sp!, {r4, pc}
_022F94D8:
	mov r0, r1
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F94E0: .word 0x0000017B
_022F94E4: .word ov10_022C4C6E
_022F94E8: .word 0x000003D3
_022F94EC: .word ov10_022C4C70
	arm_func_end GetMonsterApparentId

	arm_func_start TryActivateTraceAndColorChange
TryActivateTraceAndColorChange: ; 0x022F94F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne sb, r8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r5, [sb, #0xb4]
	ldr r6, [r8, #0xb4]
	ldrb r0, [r5, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r6, #0x60]
	mvn r4, #0
	cmp r0, #0x28
	ldrb r0, [r6, #0x61]
	moveq r4, #0
	cmp r0, #0x28
	moveq r4, #1
	cmp r4, #0
	blt _022F95FC
	ldrb r1, [r5, #0x60]
	ldrb r2, [r5, #0x61]
	mov r0, #0
	cmp r1, #0
	strneb r1, [sp]
	addne r0, r0, #1
	cmp r2, #0
	addne r1, sp, #0
	strneb r2, [r1, r0]
	addne r0, r0, #1
	cmp r0, #0
	mvneq r0, #0
	beq _022F95A0
	cmp r0, #1
	moveq r0, #0
	beq _022F95A0
	bl DungeonRandInt
_022F95A0:
	cmp r0, #0
	blt _022F95FC
	add r1, sp, #0
	ldrb r3, [r1, r0]
	ldr r1, _022F96BC ; =DUNGEON_PTR
	add r2, r6, r4
	strb r3, [r2, #0x60]
	mov r0, #0
	ldr r3, [r1]
	mov r4, #1
	mov r1, r8
	mov r2, r0
	strb r4, [r3, #0xe]
	bl SubstitutePlaceholderStringTags
	ldr r2, _022F96C0 ; =0x00000C18
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	bl ov29_022E6260
	mov r0, sb
	mov r1, r8
	bl TryEndStatusWithAbility
_022F95FC:
#ifdef JAPAN
	ldrb r0, [r6, #0x160]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r3, #0
#else
	ldrb r0, [r6, #0x164]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
#endif
	mov r0, sb
	mov r1, r8
	mov r2, #0x3b
#ifdef JAPAN
	strb r3, [r6, #0x160]
#else
	mov r3, #1
	strb r4, [r6, #0x164]
#endif
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r7
	bl GetMoveTypeForMonster
	ldrh r1, [r7, #4]
	mov r4, r0
	cmp r1, #0x1f
	bne _022F9658
	mov r0, sb
	bl GetApparentWeather
	ldr r1, _022F96C4 ; =WEATHER_BALL_TYPE_TABLE
	ldrb r4, [r1, r0]
_022F9658:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	mov r1, r4
	bl MonsterIsType
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	strb r4, [r6, #0x5e]
	strb r0, [r6, #0x5f]
	mov r3, #1
	mov r1, r8
	mov r2, r0
	strb r3, [r6, #0xff]
	bl SubstitutePlaceholderStringTags
	ldrb r1, [r6, #0x5e]
	mov r0, #0
	bl ov29_0234B084
	ldr r2, _022F96C8 ; =0x00000C19
	mov r0, sb
	mov r1, r8
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, r8
	bl ov29_022E647C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F96BC: .word DUNGEON_PTR
#ifdef JAPAN
_022F96C0: .word 0x00000957
_022F96C4: .word WEATHER_BALL_TYPE_TABLE
_022F96C8: .word 0x00000958
#else
_022F96C0: .word 0x00000C18
_022F96C4: .word WEATHER_BALL_TYPE_TABLE
_022F96C8: .word 0x00000C19
#endif
	arm_func_end TryActivateTraceAndColorChange

	arm_func_start DefenderAbilityIsActive__022F96CC
DefenderAbilityIsActive__022F96CC: ; 0x022F96CC
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
	beq _022F9710
	bl IsMonster__022F9720
	cmp r0, #0
#ifdef JAPAN
	beq _022F9710
	mov r0, r6
#else
	cmpne r4, #0
	beq _022F9710
	mov r0, r7
#endif
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
#ifdef JAPAN
	ldmneia sp!, {r4, r5, r6, pc}
_022F9710:
	mov r0, r5
	mov r1, r4
	bl AbilityIsActiveVeneer
	ldmia sp!, {r4, r5, r6, pc}
#else
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022F9710:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	arm_func_end DefenderAbilityIsActive__022F96CC
