	.include "asm/macros.inc"
	.include "overlay_29_022F7388.inc"

	.text

	arm_func_start DungeonGetSpriteIndex
DungeonGetSpriteIndex: ; 0x022F7388
	ldr r2, _022F73A0 ; =ov29_02353538
	ldr r1, _022F73A4 ; =0x00019914
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_022F73A0: .word ov29_02353538
_022F73A4: .word 0x00019914
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
	ldr r0, _022F73E8 ; =ov29_02353538
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
_022F73E8: .word ov29_02353538
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
	ldr r2, _022F74D0 ; =ov29_02353538
	mov r7, r0
	ldr r2, [r2]
	mov r6, r1
	add r1, r2, #0x114
	add r5, r1, #0x19800
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
_022F74D0: .word ov29_02353538
	arm_func_end StoreSpriteFileIndexBothGenders

	arm_func_start LoadMonsterSpriteInner
LoadMonsterSpriteInner: ; 0x022F74D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _022F75C4 ; =ov29_02353538
	mov r6, r0
	ldr r2, [r1]
	ldr r1, _022F75C8 ; =0x00019914
	add r2, r2, r6, lsl #1
	ldrsh r1, [r2, r1]
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
	bl GetFileLengthInPackWithPackNb
	ldr r1, _022F75C4 ; =ov29_02353538
	ldr r1, [r1]
	add r1, r1, #0x2c000
	ldr r2, [r1, #0xb0c]
	add r0, r2, r0
	str r0, [r1, #0xb0c]
_022F75BC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F75C4: .word ov29_02353538
_022F75C8: .word 0x00019914
_022F75CC: .word ov29_0237C9B0
_022F75D0: .word WAN_TABLE
	arm_func_end LoadMonsterSpriteInner

	arm_func_start SwapMonsterWanFileIndex
SwapMonsterWanFileIndex: ; 0x022F75D4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _022F764C ; =ov29_02353538
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r1, r1, #0x114
	mov r0, r5
	add r4, r1, #0x19800
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
_022F764C: .word ov29_02353538
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
	ldr r0, _022F774C ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x3e00
	ldrsh r0, [r0, #0x3a]
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
_022F774C: .word ov29_02353538
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
	ldr r1, _022F77F4 ; =ov29_02353538
	mov r5, r0
	ldr r1, [r1]
	ldr r0, _022F77F8 ; =0x00019914
	add r1, r1, r5, lsl #1
	ldrsh r1, [r1, r0]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _022F77FC ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _022F77F4 ; =ov29_02353538
	ldr r1, _022F77F8 ; =0x00019914
	ldr r2, [r0]
	mov r3, #0
	add r2, r2, r5, lsl #1
	mov r0, r5
	strh r3, [r2, r1]
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
_022F77F4: .word ov29_02353538
_022F77F8: .word 0x00019914
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
_022F7BD4: .word 0x00000C0D
_022F7BD8: .word 0x00000C0E
_022F7BDC: .word 0x00000C0F
_022F7BE0: .word 0x00000C0C
_022F7BE4: .word 0x000055AA
_022F7BE8: .word TEAM_MEMBER_TABLE_PTR
_022F7BEC: .word IQ_SKILLS
_022F7BF0: .word 0x00000C12
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
	ldr r0, _022F7E18 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsRecruitingAllowed
	cmp r0, #0
	ldrne r0, _022F7E18 ; =ov29_02353538
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
	mov r0, #0
	mov r1, #0xc10
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
	ldr r1, _022F7E30 ; =0x00000C11
	mov r0, #0
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
	mov r0, #0
	mov r1, #0xc10
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
_022F7E18: .word ov29_02353538
_022F7E1C: .word 0x00000C0B
_022F7E20: .word 0x00000C0A
_022F7E24: .word 0x000055AA
_022F7E28: .word TEAM_MEMBER_TABLE_PTR
_022F7E2C: .word IQ_SKILLS
_022F7E30: .word 0x00000C11
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
	bl sub_02056264
	cmp r0, #0
	strneb r5, [sb]
	bne _022F7E94
	ldrsh r0, [sb, #8]
	bl CheckTeamMemberIdx
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
	ldr r1, _022F7F04 ; =ov29_02353538
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
_022F7F04: .word ov29_02353538
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

	arm_func_start HandleFaint
HandleFaint: ; 0x022F7F30
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xbc
	mov sl, r0
	mov r8, r2
	mov sb, r1
	ldr r7, [sl, #0xb4]
	bl GetTileAtEntity
	mov r4, r0
	cmp r8, #0
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
	mov r5, #0
	ldr fp, _022F85D0 ; =ov29_02353538
	mov r4, r5
_022F7F8C:
	ldr r0, [fp]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78]
	cmp r6, #0
	beq _022F7FC4
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F7FC4
	ldr r1, [r6, #0xb4]
	ldr r0, [r1, #0x84]
	cmp r0, sl
	streq r4, [r1, #0x84]
_022F7FC4:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022F7F8C
	ldrb r0, [r7, #0xd8]
	cmp r0, #2
	ldreq r0, _022F85D0 ; =ov29_02353538
	moveq r1, #0
	ldreq r0, [r0]
	addeq r0, r0, #0x3000
	streqb r1, [r0, #0xe38]
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
	ldr r0, _022F85D4 ; =ov29_0235355C
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
	ldr r0, _022F85D0 ; =ov29_02353538
	strh r2, [r7, #0x10]
	ldr r0, [r0]
	mov r1, sl
	add r0, r0, #0x248
	add r0, r0, #0x400
	bl ov29_022E2A78
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x75f]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r7, #0x165]
	bl ov29_022E8104
	bl ov29_022E81F8
	b _022F85C8
_022F8098:
	ldrb r0, [r7, #7]
	cmp r0, #0
	beq _022F83B4
	mov r0, #0
	bl ov29_0234B1A4
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x75f]
	cmp r0, #0
	bne _022F80F4
	bl GetForcedLossReason
	cmp r0, #1
	mov r0, #1
	streqb r0, [sl, #0x20]
	strneb r0, [r7, #0x165]
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, #0x3c
	mov r1, #0x49
	bl ov29_022EA370
	mov r0, #0
	mov r1, r0
	bl OpenMessageLog
_022F80F4:
	ldr r1, _022F85D0 ; =ov29_02353538
	ldr r2, [r1]
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	bne _022F825C
	mov r4, #0
	bl IsOutlawOrChallengeRequestFloor
	cmp r0, #0
	bne _022F8234
	bl GetForcedLossReason
	cmp r0, #4
	beq _022F8234
	ldr r0, _022F85D0 ; =ov29_02353538
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
	ldrb r0, [r0, #0xca]
	cmp r0, #0
	bne _022F8234
	add r0, r2, #0x700
	ldrsb r2, [r0, #0x9b]
	cmp r2, #0
	blt _022F8234
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	cmpne r0, #2
	beq _022F8234
	cmp r2, #0
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
	ldr r1, _022F85D0 ; =ov29_02353538
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
	b _022F85C8
_022F8208:
	cmp r0, #2
	bne _022F8240
	mov r0, r7
	bl ov29_022F7F08
	mov r4, r0
	b _022F8240
_022F8220:
	rsb r1, r1, #0xe70
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
	mov r0, #1
	strb r0, [r2, #8]
	ldr r2, [r1]
	strb r0, [r2, #0xa]
	ldr r1, [r1]
	strb r0, [r1, #0x758]
	bl ov29_0234B010
	bl ov29_022E8104
	bl ov29_022E81F8
	b _022F85C8
_022F8284:
	ldr r0, _022F85E4 ; =0x00000266
	cmp sb, r0
	bne _022F82B4
	ldr r1, _022F85D0 ; =ov29_02353538
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
	mov r5, #0
	mov r4, r5
	ldr r6, _022F85D0 ; =ov29_02353538
	b _022F8328
_022F82E4:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F8324
	ldr r5, [r8, #0xb4]
	ldrsh r0, [r5, #0x10]
	cmp r0, #0
	bne _022F8324
	ldrb r0, [r5, #0x48]
	bl JoinedAtRangeCheck2
	cmp r0, #0
	bne _022F8330
_022F8324:
	add r4, r4, #1
_022F8328:
	cmp r4, #4
	blt _022F82E4
_022F8330:
	cmp r5, #0
	beq _022F83B4
	ldrsh r0, [r5, #0xc]
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r5, #0xc]
	mov r1, r5
	bl ov29_022FE048
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _022F83A8
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	bne _022F83A8
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	beq _022F83A8
	ldrsh r0, [r5, #0xc]
	mvn r1, #0
	bl sub_02058674
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
	ldr r0, _022F85D0 ; =ov29_02353538
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
	ldr r0, _022F85D0 ; =ov29_02353538
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
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	bne _022F8528
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	beq _022F8528
	ldrsh r0, [r7, #0xc]
	mvn r1, #0
	bl sub_02058674
	ldrsh r0, [r4, #8]
	mov r1, r4
	bl sub_0205349C
_022F8528:
	ldrb r0, [r7, #7]
	mov r5, #0
	cmp r0, #0
	ldr r0, _022F85D0 ; =ov29_02353538
	movne r5, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _022F855C
	ldrb r0, [r7, #0x48]
	bl JoinedAtRangeCheck2
	cmp r0, #0
	movne r5, #1
_022F855C:
	cmp r5, #0
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
	bl sub_0200FB54
	mov r0, #0
	strb r0, [r4]
_022F8594:
	ldr r0, [r7, #0xb0]
	bl ov29_022DDB68
	ldr r0, _022F85D0 ; =ov29_02353538
	ldr r1, _022F85D4 ; =ov29_0235355C
	mov r2, #0
	ldr r0, [r0]
	str r2, [r1]
	mov r1, #1
	strb r1, [r0, #0xe]
	str r2, [sl]
	bl ov29_022E2978
	bl ov29_022E8104
	bl ov29_022E81F8
_022F85C8:
	add sp, sp, #0xbc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F85D0: .word ov29_02353538
_022F85D4: .word ov29_0235355C
_022F85D8: .word 0x0000025B
_022F85DC: .word 0x00000C13
_022F85E0: .word 0x00000C14
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
	ldr r0, _022F87BC ; =ov29_02353538
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
	bl ov29_02304BAC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F87BC: .word ov29_02353538
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
	ldr r0, _022F882C ; =ov29_0235171E
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
_022F882C: .word ov29_0235171E
	arm_func_end ov29_022F87C0

	arm_func_start ov29_022F8830
ov29_022F8830: ; 0x022F8830
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r5, [r4, #0xb4]
	ldr r0, _022F88B8 ; =DIRECTIONS_XY
	ldrb r2, [r5, #0x4c]
	ldrsh r3, [r4, #4]
	ldr r1, _022F88BC ; =ov29_0235171E
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
_022F88BC: .word ov29_0235171E
	arm_func_end ov29_022F8830

	arm_func_start ov29_022F88C0
ov29_022F88C0: ; 0x022F88C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	ldr r0, _022F89A4 ; =DIRECTIONS_XY
	ldrb r2, [r4, #0x4c]
	ldrsh r3, [r5, #4]
	ldr r1, _022F89A8 ; =ov29_0235171E
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
	ldr r1, _022F89A8 ; =ov29_0235171E
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
_022F89A8: .word ov29_0235171E
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

	arm_func_start ov29_022F89CC
ov29_022F89CC: ; 0x022F89CC
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
	bl sub_0205A450
	ldrb r2, [r5, #0xa8]
	mov r1, #0
	add r0, r5, #0x90
	strb r2, [r7, #0x54]
	ldrh r2, [r5, #0x62]
	add r4, r7, #0x48
	ldr r3, _022F8FF4 ; =ov29_02353538
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
	ldr r0, _022F8FF4 ; =ov29_02353538
	addle r4, r4, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x78d]
	cmp r0, #0
	addne r0, r7, r4
	movne r1, #0xb
	strneb r1, [r0, #0x58]
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46]
	addne r4, r4, #1
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
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
	ldr r0, [r0, #0x110]
	cmp r0, #1
	addgt r0, r7, r4
	movgt r1, #0x1b
	strgtb r1, [r0, #0x58]
	ldr r0, [r6, #0xb4]
	addgt r4, r4, #1
	ldr r0, [r0, #0x110]
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
	ldrb r0, [r5, #0x11e]
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
	ldrb r0, [r5, #0x106]
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
_022F8FF4: .word ov29_02353538
	arm_func_end ov29_022F89CC

	arm_func_start ov29_022F8FF8
ov29_022F8FF8: ; 0x022F8FF8
	stmdb sp!, {r4, lr}
	ldr r2, [r1, #0xb4]
	ldr ip, _022F9050 ; =DIRECTIONS_XY
	ldrb lr, [r2, #0x4c]
	ldrsh r4, [r1, #4]
	ldr r3, _022F9054 ; =ov29_0235171E
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
_022F9054: .word ov29_0235171E
	arm_func_end ov29_022F8FF8

	arm_func_start ov29_022F9058
ov29_022F9058: ; 0x022F9058
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
	add r3, r4, #0x124
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
	ldrh r1, [r0, #0x46]
	strh r1, [r5, #0x14]
	ldrh r1, [r0, #0x48]
	strh r1, [r5, #0x16]
	ldrh r1, [r0, #0x4a]
	strh r1, [r5, #0x18]
	ldrh r0, [r0, #0x4c]
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
	ldr r2, _022F9190 ; =ov29_0235171E
	add r3, ip, r3
	strh r3, [r1, #0x7e]
	ldrb r3, [lr, #0x4c]
	ldrsh ip, [r0, #6]
	mov r0, r3, lsl #2
	ldrsh r0, [r2, r0]
	add r0, ip, r0
	strh r0, [r1, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F918C: .word DIRECTIONS_XY
_022F9190: .word ov29_0235171E
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
	ldr r0, _022F9238 ; =ov29_02353538
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xe]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F9234: .word CASTFORM_WEATHER_ATTRIBUTE_TABLE
_022F9238: .word ov29_02353538
	arm_func_end SetMonsterTypeAndAbility

	arm_func_start TryActivateSlowStart
TryActivateSlowStart: ; 0x022F923C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov r7, #1
	ldr r5, _022F92D0 ; =0x00000C17
	ldr r4, _022F92D4 ; =ov29_02353538
	mov r6, sb
	mov fp, r7
	mov r8, #0x5e
_022F925C:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb78]
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
_022F92D0: .word 0x00000C17
_022F92D4: .word ov29_02353538
	arm_func_end TryActivateSlowStart

	arm_func_start TryActivateArtificialWeatherAbilities
TryActivateArtificialWeatherAbilities: ; 0x022F92D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl IsSecretFloor
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _022F9404 ; =ov29_02353538
	ldr r1, [r4]
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	strb sb, [r1, #0xe]
	ldr r0, [r4]
	mov r5, #1
	add r0, r0, #0xc000
	strb sb, [r0, #0xd5d]
	mov r6, r5
	mov r7, r5
	mov r8, r5
	mov fp, r5
_022F9324:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb78]
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F93F4
	mov r0, sl
	mov r1, #4
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, #0xcd00
	strneh r8, [r0, #0x52]
	bne _022F93C0
	mov r0, sl
	mov r1, #0x1c
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, #0xcd00
	strneh r7, [r0, #0x4e]
	bne _022F93C0
	mov r0, sl
	mov r1, #0x31
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, #0xcd00
	strneh r6, [r0, #0x4c]
	bne _022F93C0
	mov r0, sl
	mov r1, #0x78
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldrne r0, [r4]
	addne r0, r0, #0xcd00
	strneh r5, [r0, #0x54]
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
	strb fp, [r0, #0xd5d]
_022F93F4:
	add sb, sb, #1
	cmp sb, #0x14
	blt _022F9324
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9404: .word ov29_02353538
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
	ldr r1, _022F96BC ; =ov29_02353538
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
	ldrb r0, [r6, #0x164]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0
	mov r0, sb
	mov r1, r8
	mov r2, #0x3b
	mov r3, #1
	strb r4, [r6, #0x164]
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
_022F96BC: .word ov29_02353538
_022F96C0: .word 0x00000C18
_022F96C4: .word WEATHER_BALL_TYPE_TABLE
_022F96C8: .word 0x00000C19
	arm_func_end TryActivateTraceAndColorChange

	arm_func_start DefenderAbilityIsActive__022F96CC
DefenderAbilityIsActive__022F96CC: ; 0x022F96CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r7, r6
	beq _022F9710
	bl IsMonster__022F9720
	cmp r0, #0
	cmpne r4, #0
	beq _022F9710
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022F9710:
	mov r0, r6
	mov r1, r5
	bl AbilityIsActiveVeneer
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DefenderAbilityIsActive__022F96CC

	arm_func_start IsMonster__022F9720
IsMonster__022F9720: ; 0x022F9720
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__022F9720

	arm_func_start TryActivateConversion2
TryActivateConversion2: ; 0x022F9744
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne r7, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r6, #0xb4]
	mov r0, r6
	bl Conversion2IsActive
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r4
	bl GetMoveTypeForMonster
	bl GetConversion2ConvertToType
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov29_02307CE0
	mov r0, r6
	strb r4, [r5, #0x5e]
	mov r1, #0
	strb r1, [r5, #0x5f]
	bl ov29_022E4160
	mov r0, #0
	mov r1, r6
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl ov29_0234B084
	mov r0, r7
	mov r1, r6
	ldr r2, _022F97EC ; =0x00000C16
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F97EC: .word 0x00000C16
	arm_func_end TryActivateConversion2

	arm_func_start TryActivateTruant
TryActivateTruant: ; 0x022F97F0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F9838
	mov r0, r4
	mov r1, #0x2a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _022F9838
	mov r2, #0
	str r2, [sp]
	mov r0, r4
	mov r1, r4
	mov r3, #1
	str r2, [sp, #4]
	bl TryInflictPausedStatus
_022F9838:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end TryActivateTruant

	arm_func_start ov29_022F9840
ov29_022F9840: ; 0x022F9840
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5]
	cmp r0, #1
	bne _022F987C
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	moveq r0, #1
	movne r0, r4
	and r4, r0, #0xff
_022F987C:
	bl sub_0204AEF0
	cmp r0, #0
	moveq r4, #0
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	mov r0, r5
	mov r2, r1
	bl TryPointCameraToMonster
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022F9840

	arm_func_start TryPointCameraToMonster
TryPointCameraToMonster: ; 0x022F98B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022F9968 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldr r0, [r0, #0x22c]
	cmp r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	beq _022F9928
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r7, #0x34
	ldr r5, _022F9968 ; =ov29_02353538
	b _022F9918
_022F9910:
	mov r0, r7
	bl AdvanceFrame
_022F9918:
	ldr r0, [r5]
	ldrsh r0, [r0, #0x1c]
	cmp r0, #0x3c
	blt _022F9910
_022F9928:
	mov r0, #4
	mov r1, #0x44
	bl ov29_022EA370
	mov r0, r6
	mov r1, r4
	bl PointCameraToMonster
	cmp r4, #0
	beq _022F9950
	add r0, r6, #4
	bl DiscoverMinimap
_022F9950:
	ldr r0, _022F9968 ; =ov29_02353538
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #0x1c]
	bl ov29_022E81F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F9968: .word ov29_02353538
	arm_func_end TryPointCameraToMonster

	arm_func_start ov29_022F996C
ov29_022F996C: ; 0x022F996C
	bx lr
	arm_func_end ov29_022F996C

	arm_func_start ov29_022F9970
ov29_022F9970: ; 0x022F9970
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _022F99E8 ; =ov29_02353538
	b _022F99DC
_022F9980:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb78]
	mov r0, r5
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F99D8
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #3
	bne _022F99D8
	ldr r1, _022F99E8 ; =ov29_02353538
	ldr r0, [r1]
	add r0, r0, #0x19000
	str r5, [r0, #0x904]
	ldr r2, [r5, #0xb4]
	ldr r0, [r1]
	ldr r1, [r2, #0xb0]
	add r0, r0, #0x19000
	str r1, [r0, #0x90c]
	ldmia sp!, {r4, r5, r6, pc}
_022F99D8:
	add r4, r4, #1
_022F99DC:
	cmp r4, #0x14
	blt _022F9980
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F99E8: .word ov29_02353538
	arm_func_end ov29_022F9970

	arm_func_start ov29_022F99EC
ov29_022F99EC: ; 0x022F99EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x40
	mov r4, #0
	ldr r6, _022F9A70 ; =ov29_02353538
	mov r5, r4
	add r7, sp, #0
_022F9A04:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F9A40
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r0, #0xb
	blo _022F9A40
	cmp r0, #0xe
	strls r8, [r7, r4, lsl #2]
	addls r4, r4, #1
_022F9A40:
	add r5, r5, #1
	cmp r5, #0x10
	blt _022F9A04
	cmp r4, #0
	movle r0, #0
	ble _022F9A68
	mov r0, r4
	bl DungeonRandInt
	add r1, sp, #0
	ldr r0, [r1, r0, lsl #2]
_022F9A68:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F9A70: .word ov29_02353538
	arm_func_end ov29_022F99EC

	arm_func_start RestorePpAllMovesSetFlags
RestorePpAllMovesSetFlags: ; 0x022F9A74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, [r0, #0xb4]
	mov r7, #0
	add r6, r0, #0x124
	mov r4, r7
	mov r5, #1
_022F9A8C:
	ldrb r0, [r6, r7, lsl #3]
	add r8, r6, r7, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022F9AE4
	ldrh r1, [r8, #2]
	mov r0, r8
	bic r1, r1, #8
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	bic r1, r1, #0x10
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	bic r1, r1, #0x40
	strh r1, [r8, #2]
	ldrh r1, [r8, #2]
	orr r1, r1, #4
	strh r1, [r8, #2]
	bl GetMaxPpWrapper
	strb r0, [r8, #6]
_022F9AE4:
	add r7, r7, #1
	cmp r7, #4
	blt _022F9A8C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end RestorePpAllMovesSetFlags

	arm_func_start ov29_022F9AF4
ov29_022F9AF4: ; 0x022F9AF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r1, [sb, #0xb4]
	mov r5, #0
	ldrb r8, [r1, #6]
	bl ov29_022F87C0
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mvn r7, #0
	mov r4, r7
_022F9B20:
	mov r6, r4
_022F9B24:
	ldrsh r0, [sb, #4]
	ldrsh r1, [sb, #6]
	add r0, r0, r6
	add r1, r1, r7
	bl GetTileSafe
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _022F9B60
	ldr r0, [r1]
	cmp r0, #1
	bne _022F9B60
	ldr r0, [r1, #0xb4]
	ldrb r0, [r0, #6]
	cmp r8, r0
	addne r5, r5, #1
_022F9B60:
	add r6, r6, #1
	cmp r6, #1
	ble _022F9B24
	add r7, r7, #1
	cmp r7, #1
	ble _022F9B20
	cmp r5, #2
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_022F9AF4

	arm_func_start ov29_022F9B8C
ov29_022F9B8C: ; 0x022F9B8C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r2, #0
	mov r1, #1
	mov r4, r0
	strb r2, [sp, #4]
	strb r1, [sp, #5]
	str r2, [sp]
	ldrsh r1, [r4, #2]
	add r0, sp, #8
	add r3, sp, #4
	bl sub_02052E2C
	ldrsh r0, [r4, #2]
	mov r1, #0
	mov r2, #6
	strh r0, [sp, #0xc]
	ldrb r0, [r4, #0xa]
	strb r0, [sp, #9]
	ldrsh r0, [r4, #0xe]
	strh r0, [sp, #0x10]
	ldrb r0, [r4, #0x1a]
	strb r0, [sp, #0x14]
	ldrb r0, [r4, #0x1c]
	strb r0, [sp, #0x16]
	ldrb r0, [r4, #0x48]
	strb r0, [sp, #0xa]
	ldrb r0, [r4, #0x49]
	strb r0, [sp, #0xb]
	add r0, sp, #8
_022F9C00:
	mla lr, r1, r2, r0
	add r3, r4, r1, lsl #3
	ldrb ip, [r3, #0x124]
	add r3, r3, #0x100
	add r1, r1, #1
	strb ip, [lr, #0x22]
	ldrh r3, [r3, #0x28]
	cmp r1, #4
	strh r3, [lr, #0x24]
	blt _022F9C00
	bl GetMonsterEvoStatus
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov29_022F9B8C

	arm_func_start CheckTeamMemberIdxVeneer
CheckTeamMemberIdxVeneer: ; 0x022F9C34
	ldr ip, _022F9C3C ; =CheckTeamMemberIdx
	bx ip
	.align 2, 0
_022F9C3C: .word CheckTeamMemberIdx
	arm_func_end CheckTeamMemberIdxVeneer

	arm_func_start ov29_022F9C40
ov29_022F9C40: ; 0x022F9C40
	ldr ip, _022F9C48 ; =sub_02056264
	bx ip
	.align 2, 0
_022F9C48: .word sub_02056264
	arm_func_end ov29_022F9C40

	arm_func_start ov29_022F9C4C
ov29_022F9C4C: ; 0x022F9C4C
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrsh r0, [r0, #0xc]
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl sub_02056264
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022F9C4C

	arm_func_start IsMonsterIdInNormalRangeVeneer
IsMonsterIdInNormalRangeVeneer: ; 0x022F9C68
	ldr ip, _022F9C70 ; =IsMonsterIdInNormalRange
	bx ip
	.align 2, 0
_022F9C70: .word IsMonsterIdInNormalRange
	arm_func_end IsMonsterIdInNormalRangeVeneer

	arm_func_start ov29_022F9C74
ov29_022F9C74: ; 0x022F9C74
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022F9E80
	ldr r5, [r6, #0xb4]
	ldrb r0, [r5, #0x103]
	cmp r0, #0
	beq _022F9E78
	mov r0, r6
	bl GetTileAtEntity
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #2
	bne _022F9D50
	ldr r0, _022F9E88 ; =ov29_02353538
	ldr r1, _022F9E8C ; =SECONDARY_TERRAIN_TYPES
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _022F9D34
	ldrb r0, [r5, #0xc4]
	cmp r0, #1
	bne _022F9CF0
	mov r0, r6
	mov r1, r6
	mov r2, #1
	bl EndFrozenClassStatus
_022F9CF0:
	ldrsh r0, [r5, #2]
	bl GetMobilityType
	cmp r0, #4
	ldrnesh r1, [r5, #2]
	ldrne r0, _022F9E90 ; =0x00000115
	cmpne r1, r0
	cmpne r1, #0x92
	ldrneb r0, [r5, #0xbf]
	cmpne r0, #1
	beq _022F9E78
	mov r3, #0
	mov r0, r6
	mov r1, r6
	mov r2, #1
	str r3, [sp]
	bl TryInflictBurnStatus
	b _022F9E78
_022F9D34:
	ldrb r0, [r5, #0xbf]
	cmp r0, #1
	bne _022F9E78
	mov r0, r6
	mov r1, r6
	bl EndBurnClassStatus
	b _022F9E78
_022F9D50:
	cmp r0, #0
	bne _022F9E78
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _022F9E78
	add r0, r5, #0x100
	ldrh r1, [r0, #0x48]
	ldrh r4, [r0, #0x46]
	sub r3, sp, #4
	strh r1, [sp, #0xa]
	mov r0, r1
	strh r4, [r3]
	strh r0, [r3, #2]
	ldr r1, _022F9E94 ; =BELLY_DRAIN_IN_WALLS_INT
	ldr r0, [r3]
	ldrh r2, [r1]
	strh r4, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r1, [sp, #4]
	add r0, r5, #0x100
	ldrh r3, [sp, #6]
	strh r1, [r0, #0x46]
	ldrh r2, [sp, #8]
	strh r3, [r0, #0x48]
	sub r0, sp, #4
	ldrh r1, [sp, #0xa]
	strh r2, [r0]
	mov r4, #0
	strh r1, [r0, #2]
	ldr r0, [r0]
	bl CeilFixedPoint
	cmp r0, #0x14
	blt _022F9E18
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0x14
	ldrlt r4, _022F9E98 ; =0x00000C1A
_022F9E18:
	ldrh r1, [sp, #8]
	ldrh r0, [sp, #0xa]
	sub r2, sp, #4
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	blt _022F9E64
	add r0, r5, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	ldrlt r4, _022F9E9C ; =0x00000C1B
_022F9E64:
	cmp r4, #0
	beq _022F9E78
	mov r0, r6
	mov r1, r4
	bl LogMessageByIdWithPopupCheckUser
_022F9E78:
	mov r0, #0
	strb r0, [r5, #0x103]
_022F9E80:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F9E88: .word ov29_02353538
_022F9E8C: .word SECONDARY_TERRAIN_TYPES
_022F9E90: .word 0x00000115
_022F9E94: .word BELLY_DRAIN_IN_WALLS_INT
_022F9E98: .word 0x00000C1A
_022F9E9C: .word 0x00000C1B
	arm_func_end ov29_022F9C74

	arm_func_start ov29_022F9EA0
ov29_022F9EA0: ; 0x022F9EA0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r1, #0x6f
	ldr r4, [r5, #0xb4]
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _022F9FEC
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _022F9FBC
	mov r0, r5
	mov r1, #0x11
	bl HasHeldItem
	cmp r0, #0
	bne _022F9EF4
	mov r0, r5
	mov r1, #0x32
	bl HasHeldItem
	cmp r0, #0
	beq _022F9F60
_022F9EF4:
	mov r0, #0xa
	bl sub_02050FF8
	add r1, r4, #0x100
	ldrh r2, [r1, #0x46]
	sub r3, sp, #4
	strh r0, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #0x48]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	strh r1, [r3, #2]
	ldrh r2, [sp, #8]
	ldr r0, [r3]
	ldrh r1, [sp, #0xa]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r2, [sp, #4]
	add r0, r4, #0x100
	ldrh r1, [sp, #6]
	strh r2, [r0, #0x46]
	strh r1, [r0, #0x48]
	b _022F9F9C
_022F9F60:
	mov r0, r5
	mov r1, #0x22
	bl HasHeldItem
	cmp r0, #0
	beq _022F9F9C
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r2, [sp]
	add r0, r4, #0x100
	ldrh r1, [sp, #2]
	strh r2, [r0, #0x46]
	strh r1, [r0, #0x48]
_022F9F9C:
	ldr r0, _022FA028 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x78d]
	cmp r0, #0
	beq _022F9FEC
	mov r0, r5
	bl UpdateStatusIconFlags
	b _022F9FEC
_022F9FBC:
	ldrsh r1, [r4, #0x66]
	ldrsh r0, [r4, #0x68]
	cmp r0, r1
	beq _022F9FEC
	cmp r1, #0x18
	cmpne r0, #0x18
	cmpne r1, #0xe
	cmpne r0, #0xe
	bne _022F9FEC
	mov r0, #1
	bl UpdateCamera
	bl UpdateMinimap
_022F9FEC:
	ldrsh r1, [r4, #0x68]
	ldrsh r0, [r4, #0x66]
	cmp r1, r0
	beq _022FA000
	bl ov29_02307DD0
_022FA000:
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrnesh r0, [r4, #0x66]
	moveq r0, #0
	strh r0, [r4, #0x68]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022FA028: .word ov29_02353538
	arm_func_end ov29_022F9EA0

	arm_func_start ov29_022FA02C
ov29_022FA02C: ; 0x022FA02C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov sl, r0
	mov r3, r1
	ldrsh r1, [sl, #2]
	mov sb, r2
	add r0, sp, #4
	mov r2, r3
	bl GetLearnableIqSkills
	mov r6, r0
	ldrsh r1, [sl, #2]
	ldrsh r2, [sl, #0xe]
	add r0, sp, #0x49
	bl GetLearnableIqSkills
	mov r7, r0
	bl ov29_0234B034
	mov r1, #0
	mov r2, sl
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	mov r8, #1
	add r5, sp, #4
	mov r4, r8
	mov fp, #0
_022FA090:
	mov r1, #0
	mov r2, r1
	mov r3, r1
	b _022FA0B4
_022FA0A0:
	ldrb r0, [r5, r3]
	cmp r0, r8
	moveq r1, r4
	beq _022FA0BC
	add r3, r3, #1
_022FA0B4:
	cmp r3, r6
	blt _022FA0A0
_022FA0BC:
	mov r3, fp
	b _022FA0DC
_022FA0C4:
	add r0, r5, r3
	ldrb r0, [r0, #0x45]
	cmp r8, r0
	moveq r2, #1
	beq _022FA0E4
	add r3, r3, #1
_022FA0DC:
	cmp r3, r7
	blt _022FA0C4
_022FA0E4:
	cmp r1, r2
	beq _022FA12C
	add r0, sl, #0x90
	and r1, r8, #0xff
	bl EnableIqSkill
	add r0, sl, #0x9c
	and r1, r8, #0xff
	bl EnableIqSkill
	cmp sb, #0
	bne _022FA12C
	mov r0, #4
	bl sub_02017C50
	mov r0, #0
	and r1, r8, #0xff
	bl ov29_0234B084
	ldr r1, _022FA140 ; =0x00000C1C
	mov r0, #0
	bl LogMessageByIdWithPopup
_022FA12C:
	add r8, r8, #1
	cmp r8, #0x45
	blt _022FA090
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA140: .word 0x00000C1C
	arm_func_end ov29_022FA02C

	arm_func_start BoostIQ
BoostIQ: ; 0x022FA144
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r5, [r7, #0xb4]
	ldr r0, _022FA1CC ; =0x000003E7
	ldrsh r4, [r5, #0xe]
	mov r6, r2
	add r1, r4, r1
	strh r1, [r5, #0xe]
	ldrsh r1, [r5, #0xe]
	cmp r1, r0
	strgth r0, [r5, #0xe]
	cmp r6, #0
	bne _022FA1B0
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r5, #0xe]
	cmp r4, r0
	bne _022FA1A4
	ldr r1, _022FA1D0 ; =0x00000C27
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
	b _022FA1B0
_022FA1A4:
	ldr r1, _022FA1D4 ; =0x00000C26
	mov r0, r7
	bl LogMessageByIdWithPopupCheckUser
_022FA1B0:
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl ov29_022FA02C
	mov r0, r7
	bl ov29_023021F0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FA1CC: .word 0x000003E7
_022FA1D0: .word 0x00000C27
_022FA1D4: .word 0x00000C26
	arm_func_end BoostIQ

	arm_func_start ov29_022FA1D8
ov29_022FA1D8: ; 0x022FA1D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0xb4]
	mov r5, r1
	ldrb r1, [r4, #7]
	cmp r1, #0
	beq _022FA210
	ldrsh r1, [r6, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0x7e]
	ldrsh r1, [r6, #6]
	add r1, r1, #1
	strh r1, [r0, #0x80]
	b _022FA27C
_022FA210:
	ldrb r1, [r4, #0x16a]
	cmp r1, #0xff
	beq _022FA274
	ldrsh r1, [r4, #2]
	add r0, r4, #0x4a
	bl SetActionPassTurnOrWalk
	ldrb r2, [r4, #0x16a]
	ldr r1, _022FA2E8 ; =DIRECTIONS_XY
	add r0, r4, #0x100
	strb r2, [r4, #0x4c]
	mov r2, r2, lsl #2
	ldrsh r3, [r1, r2]
	ldrsh ip, [r6, #4]
	ldr r2, _022FA2EC ; =ov29_0235171E
	mov r1, #0xff
	add r3, ip, r3
	strh r3, [r0, #0x7e]
	ldrb r3, [r4, #0x4c]
	ldrsh ip, [r6, #6]
	mov r3, r3, lsl #2
	ldrsh r2, [r2, r3]
	add r2, ip, r2
	strh r2, [r0, #0x80]
	strb r1, [r4, #0x16a]
	b _022FA27C
_022FA274:
	mov r1, r2
	bl AiMovement
_022FA27C:
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x7e]
	cmp r1, #0
	ldreqsh r0, [r0, #0x80]
	cmpeq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, #1
	bl ov29_02300818
	cmp r0, #0
	beq _022FA2B8
	mov r0, r6
	bl ov29_02300CB0
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_022FA2B8:
	add r1, r4, #0x7e
	add r0, r6, #4
	add r1, r1, #0x100
	bl GetDirectionTowardsPosition
	mov r1, r0
	and r0, r1, #7
	strb r0, [r4, #0x4c]
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl ov29_02304A48
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA2E8: .word DIRECTIONS_XY
_022FA2EC: .word ov29_0235171E
	arm_func_end ov29_022FA1D8

	arm_func_start ov29_022FA2F0
ov29_022FA2F0: ; 0x022FA2F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr sb, _022FA35C ; =ov29_02353538
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
_022FA308:
	ldr r0, [sb]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r4, [r0, #0xb78]
	mov r0, r4
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA34C
	cmp r7, #0
	ldrne r0, [r4, #0xb4]
	ldrneb r0, [r0, #0xbc]
	cmpne r0, #7
	bne _022FA34C
	mov r0, r4
	mov r1, r8
	mov r2, r6
	bl ov29_022FA1D8
_022FA34C:
	add r5, r5, #1
	cmp r5, #0x14
	blt _022FA308
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FA35C: .word ov29_02353538
	arm_func_end ov29_022FA2F0

	arm_func_start ov29_022FA360
ov29_022FA360: ; 0x022FA360
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0xb4]
	and r1, r5, #7
	mov r0, r6
	strb r1, [r4, #0x4c]
	bl GetSleepAnimationId
	mov r1, r0
	ldrb r2, [r4, #0x4c]
	mov r0, r6
	bl ov29_023049A8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022FA360

	arm_func_start ov29_022FA3A0
ov29_022FA3A0: ; 0x022FA3A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r4
	add r0, r5, #4
	bl GetDirectionTowardsPosition
	and r1, r0, #0xff
	mov r0, r5
	bl ov29_022FA360
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FA3A0

	arm_func_start ov29_022FA3D4
ov29_022FA3D4: ; 0x022FA3D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022FA414 ; =ov29_02353538
	mov r4, r0
	ldr r0, [r1]
	mov r6, #0
	add r0, r0, #0x328
	add r5, r0, #0x12800
_022FA3F0:
	ldr r0, [r5, r6, lsl #2]
	mov r1, r4
	bl ov29_022FA3A0
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _022FA3F0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FA414: .word ov29_02353538
	arm_func_end ov29_022FA3D4

	arm_func_start ov29_022FA418
ov29_022FA418: ; 0x022FA418
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022EF938
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FA418

	arm_func_start ShouldMonsterHeadToStairs
ShouldMonsterHeadToStairs: ; 0x022FA430
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	bl GetStairsRoom
	mov r5, r0
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r5, r0
	bne _022FA514
	ldr r1, _022FA51C ; =ov29_02353538
	add r0, sl, #4
	ldr r1, [r1]
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
	bl GetChebyshevDistance
	ldr r7, _022FA520 ; =0x00002710
	ldr r4, _022FA51C ; =ov29_02353538
	mov r6, r0
	mov r8, #0
_022FA480:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr sb, [r0, #0xb78]
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA4E8
	mov r0, sl
	mov r1, sb
	bl ov29_023018AC
	cmp r0, #1
	bne _022FA4E8
	ldrsh r0, [sb, #4]
	ldrsh r1, [sb, #6]
	bl GetTile
	ldrb r0, [r0, #7]
	cmp r5, r0
	bne _022FA4E8
	ldr r1, [r4]
	add r0, sb, #4
	add r1, r1, #0xe4
	add r1, r1, #0xcc00
	bl GetChebyshevDistance
	cmp r0, r7
	movlt r7, r0
_022FA4E8:
	add r8, r8, #1
	cmp r8, #0x14
	blt _022FA480
	ldr r0, _022FA520 ; =0x00002710
	cmp r7, r0
	beq _022FA50C
	beq _022FA514
	cmp r7, r6
	ble _022FA514
_022FA50C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022FA514:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FA51C: .word ov29_02353538
_022FA520: .word 0x00002710
	arm_func_end ShouldMonsterHeadToStairs

	arm_func_start ov29_022FA524
ov29_022FA524: ; 0x022FA524
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022FA570 ; =ov29_02353538
	mov r5, #0
_022FA530:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb78]
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
_022FA570: .word ov29_02353538
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
	add r0, r0, #0x124
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
_022FA5E4: .word 0x00000C1D
_022FA5E8: .word 0x00000C1E
_022FA5EC: .word 0x00000C1F
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
	ldr r0, _022FA644 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe39]
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
_022FA644: .word ov29_02353538
	arm_func_end MewSpawnCheck

	arm_func_start ov29_022FA648
ov29_022FA648: ; 0x022FA648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov r6, #1
	mov fp, r6
	mov r5, r7
_022FA65C:
	ldr r0, _022FA74C ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FA730
	ldr sl, [r8, #0xb4]
	ldrb r1, [sl, #7]
	ldrsh r0, [sl, #0xc]
	cmp r1, #0
	beq _022FA6C4
	strb r6, [sl, #0x165]
	bl ov29_022E8104
	bl ov29_022E81F8
	bl ov29_022E0A04
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
	bl ov29_022E0A04
	cmp r0, #0
	movne sb, #1
	bne _022FA70C
	ldrsh r0, [r4, #8]
	bl sub_02056264
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
	strb fp, [sl, #0x165]
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
_022FA74C: .word ov29_02353538
	arm_func_end ov29_022FA648

	arm_func_start ov29_022FA750
ov29_022FA750: ; 0x022FA750
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	ldr r4, _022FA7D8 ; =ov29_02353538
	mov r5, r6
_022FA760:
	ldr r0, [r4]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
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
	ldr sl, [r0, #0xb78]
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
_022FA7D8: .word ov29_02353538
	arm_func_end ov29_022FA750

	arm_func_start TryEndStatusWithAbility
TryEndStatusWithAbility: ; 0x022FA7DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r2, #0x16
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
	bl DefenderAbilityIsActive__022F96CC
	cmp r0, #0
	bne _022FA8F0
	mov r0, r6
	mov r1, r5
	mov r2, #0x49
	mov r3, #1
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
	mov r3, #1
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
	mov r3, #1
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
	ldr ip, [r0, #0xb4]
	mov r3, #0
_022FAA0C:
	add r2, ip, r3, lsl #3
	ldrb r0, [r2, #0x124]
	add r3, r3, #1
	cmp r3, #4
	bic r0, r0, #0x10
	strb r0, [r2, #0x124]
	blt _022FAA0C
	ldrb r0, [ip, #0x144]
	bic r0, r0, #0x10
	strb r0, [ip, #0x144]
	ldrh r0, [r1, #4]
	cmp r0, #0x160
	ldreqb r0, [ip, #0x144]
	orreq r0, r0, #0x10
	streqb r0, [ip, #0x144]
	ldrneb r0, [r1]
	orrne r0, r0, #0x10
	strneb r0, [r1]
	bx lr
	arm_func_end ov29_022FAA04

	arm_func_start ov29_022FAA58
ov29_022FAA58: ; 0x022FAA58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _022FAC90 ; =ov29_02353538
	mov sl, r0
	ldr r0, [r1]
	mov r6, #0
	add r0, r0, #0x328
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
	add fp, sb, #0x124
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
	add r1, sb, #0x124
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
	bl ov29_0234B084
	mov r0, r5
	mov r1, #0xc20
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
	add r5, r6, #0x124
	b _022FABFC
_022FABD8:
	add r0, r5, r7, lsl #3
	bl GetMaxPp
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x12a]
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
	bl ov29_0230F654
	mov r0, #1
	add r1, sp, #0xc
	bl ov29_02344B44
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
_022FAC90: .word ov29_02353538
_022FAC94: .word 0x00000C23
	arm_func_end ov29_022FAA58

	arm_func_start ExclusiveItemEffectIsActive__022FAC98
ExclusiveItemEffectIsActive__022FAC98: ; 0x022FAC98
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__022FAC98

	arm_func_start ov29_022FACBC
ov29_022FACBC: ; 0x022FACBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r1, _022FAD44 ; =ov29_02353538
	mov sb, r0
	ldr r0, [r1]
	mov r8, #0
	add r0, r0, #0x328
	ldr r5, _022FAD48 ; =0x000003E7
	add r7, r0, #0x12800
	mov r4, r8
	mov r6, #0x48
_022FACE8:
	ldr sl, [r7, r8, lsl #2]
	mov r0, sl
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAD28
	mov r0, sl
	mov r1, r6
	bl ExclusiveItemEffectIsActive__022FAC98
	cmp r0, #0
	beq _022FAD28
	mov r0, sl
	mov r1, sl
	mov r2, r5
	mov r3, r4
	str sb, [sp]
	bl TryIncreaseHp
_022FAD28:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FACE8
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FAD44: .word ov29_02353538
_022FAD48: .word 0x000003E7
	arm_func_end ov29_022FACBC

	arm_func_start ov29_022FAD4C
ov29_022FAD4C: ; 0x022FAD4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022FAF00 ; =ov29_02353538
	mov r8, #0
	ldr r1, [r1]
	sub r3, r8, #1
	add r2, r1, #0xcc00
	ldrsh r4, [r2, #0xe4]
	add r1, r1, #0x328
	add r5, r1, #0x12800
	cmp r4, r3
	ldreqsh r1, [r2, #0xe6]
	mov sb, r0
	moveq r0, r3
	cmpeq r1, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r7, #0
	mov r4, #0x1a
	b _022FADE4
_022FAD94:
	ldr r6, [r5, r7, lsl #2]
	mov r0, r6
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FADD8
	ldr r0, [r6, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xd9
	blo _022FADC0
	cmp r0, #0xe4
	blo _022FADD8
_022FADC0:
	mov r0, r6
	mov r1, r4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r8, #1
	bne _022FADEC
_022FADD8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FADE4:
	cmp r7, #4
	blt _022FAD94
_022FADEC:
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFloorType
	cmp r0, #0
	bne _022FAEEC
	cmp sb, #0
	bne _022FAE14
	ldr r1, _022FAF04 ; =0x00000C21
	mov r0, r6
	bl LogMessageByIdWithPopupCheckUser
_022FAE14:
	bl GetLeader
	mov r5, r0
	add r0, sp, #0
	add r1, sp, #2
	mov r4, #0
	bl GetStairsSpawnPosition
	ldrsh r1, [sp]
	ldrsh r3, [r5, #4]
	ldrsh r2, [sp, #2]
	cmp r3, r1
	ldreqsh r0, [r5, #6]
	cmpeq r0, r2
	cmp r3, r1
	bne _022FAE58
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movlt r4, #0
_022FAE58:
	cmp r3, r1
	ldrltsh r0, [r5, #6]
	cmplt r0, r2
	movlt r4, #1
	cmp r3, r1
	bge _022FAE7C
	ldrsh r0, [r5, #6]
	cmp r0, r2
	moveq r4, #2
_022FAE7C:
	cmp r3, r1
	bge _022FAE90
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movgt r4, #3
_022FAE90:
	cmp r3, r1
	bne _022FAEA4
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movgt r4, #4
_022FAEA4:
	cmp r3, r1
	ldrgtsh r0, [r5, #6]
	cmpgt r0, r2
	movgt r4, #5
	cmp r3, r1
	ble _022FAEC8
	ldrsh r0, [r5, #6]
	cmp r0, r2
	moveq r4, #6
_022FAEC8:
	cmp r3, r1
	ble _022FAEDC
	ldrsh r0, [r5, #6]
	cmp r0, r2
	movlt r4, #7
_022FAEDC:
	mov r0, r5
	mov r1, r4
	bl ov29_022E6928
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FAEEC:
	bl GetFloorType
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GetFloorType
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FAF00: .word ov29_02353538
_022FAF04: .word 0x00000C21
	arm_func_end ov29_022FAD4C

	arm_func_start ov29_022FAF08
ov29_022FAF08: ; 0x022FAF08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022FAFC8 ; =ov29_02353538
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	add r0, r0, #0x328
	add r8, r0, #0x12800
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, r5
	mov r7, #0x36
	b _022FAF74
_022FAF3C:
	ldr r4, [r8, sb, lsl #2]
	mov r0, r4
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FAF68
	mov r0, r4
	mov r1, r7
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r5, #1
	bne _022FAF7C
_022FAF68:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022FAF74:
	cmp sb, #4
	blt _022FAF3C
_022FAF7C:
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _022FAFC8 ; =ov29_02353538
	ldr r0, _022FAFCC ; =0x00012AF8
	ldr r1, [r1]
	ldrsh r1, [r1, r0]
	cmp r1, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, _022FAFD0 ; =0x00000C22
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x78
	mov r1, #0xa
	bl ov29_022EA370
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FAFC8: .word ov29_02353538
_022FAFCC: .word 0x00012AF8
_022FAFD0: .word 0x00000C22
	arm_func_end ov29_022FAF08

	arm_func_start ov29_022FAFD4
ov29_022FAFD4: ; 0x022FAFD4
	stmdb sp!, {r3, lr}
	mov r2, #1
	mov r3, #0
	bl ov29_0230175C
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FAFD4

	arm_func_start GetTeamMemberWithIqSkill
GetTeamMemberWithIqSkill: ; 0x022FAFF8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _022FB060 ; =ov29_02353538
	mov r4, #0
	ldr r1, [r1]
	mov r5, r0
	add r0, r1, #0x328
	mov r7, r4
	add r6, r0, #0x12800
	b _022FB050
_022FB01C:
	ldr r0, [r6, r7, lsl #2]
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FB044
	ldr r0, [r6, r7, lsl #2]
	mov r1, r5
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r4, [r6, r7, lsl #2]
	bne _022FB058
_022FB044:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB050:
	cmp r7, #4
	blt _022FB01C
_022FB058:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FB060: .word ov29_02353538
	arm_func_end GetTeamMemberWithIqSkill

	arm_func_start TeamMemberHasEnabledIqSkill
TeamMemberHasEnabledIqSkill: ; 0x022FB064
	stmdb sp!, {r3, lr}
	bl GetTeamMemberWithIqSkill
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end TeamMemberHasEnabledIqSkill

	arm_func_start TeamLeaderIqSkillIsEnabled
TeamLeaderIqSkillIsEnabled: ; 0x022FB080
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	mov r1, r4
	bl IqSkillIsEnabled
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end TeamLeaderIqSkillIsEnabled

	arm_func_start CountMovesOutOfPp
CountMovesOutOfPp: ; 0x022FB0A8
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov r0, #0
	mov lr, r0
	mov r2, r0
	mov r3, #1
_022FB0C0:
	add r1, ip, lr, lsl #3
	ldrb r1, [r1, #0x124]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _022FB0F4
	add r1, ip, lr, lsl #3
	ldrb r1, [r1, #0x12a]
	cmp r1, #0
	addeq r0, r0, #1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
_022FB0F4:
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
	cmp lr, #4
	blt _022FB0C0
	ldmia sp!, {r3, pc}
	arm_func_end CountMovesOutOfPp

	arm_func_start HasSuperEffectiveMoveAgainstUser
HasSuperEffectiveMoveAgainstUser: ; 0x022FB10C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldr r6, [sb, #0xb4]
	mov r7, #0
	mov sl, r0
	mov r8, r2
	add r4, r6, #0x124
	mov fp, r7
	mov r5, #1
	b _022FB198
_022FB134:
	add r0, r6, r7, lsl #3
	ldrb r0, [r0, #0x124]
	tst r0, #1
	movne r0, r5
	moveq r0, fp
	tst r0, #0xff
	beq _022FB18C
	cmp r8, #0
	beq _022FB168
	add r0, r4, r7, lsl #3
	bl HasMaxGinsengBoost99
	cmp r0, #0
	beq _022FB18C
_022FB168:
	add r0, r4, r7, lsl #3
	bl GetMoveType
	mov r2, r0
	mov r0, sb
	mov r1, sl
	bl GetTypeMatchupBothTypes
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022FB18C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB198:
	cmp r7, #4
	blt _022FB134
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end HasSuperEffectiveMoveAgainstUser

	arm_func_start ov29_022FB1A8
ov29_022FB1A8: ; 0x022FB1A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r6, [r0, #0xb4]
	mov r4, r7
	mov r5, #1
	b _022FB204
_022FB1C0:
	add r0, r6, r7, lsl #3
	ldrb r0, [r0, #0x124]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB1F8
	add r0, r6, r7, lsl #3
	add r0, r0, #0x100
	ldrh r0, [r0, #0x28]
	bl IsOneHitKoMove
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_022FB1F8:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_022FB204:
	cmp r7, #4
	blt _022FB1C0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_022FB1A8

	arm_func_start TryEatItem
TryEatItem: ; 0x022FB214
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	mov sl, r0
	mov sb, r1
	mov r5, #0
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FB244
	mov r0, sb
	bl EntityIsValid__022F7364
	cmp r0, #0
	bne _022FB24C
_022FB244:
	mov r0, #0
	b _022FB508
_022FB24C:
	ldr r4, [sb, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrsh r0, [r4, #0x66]
	beq _022FB31C
	cmp r0, #0
	beq _022FB504
	ldrsh r0, [r4, #0x66]
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB504
	mov r0, sl
	add r1, r4, #0x62
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, r5
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r5
	bl SubstitutePlaceholderStringTags
	add r1, r4, #0x62
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _022FB510 ; =0x00000C24
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrh r2, [r4, #0x62]
	mov r0, sl
	add r1, r4, #0x62
	strh r2, [sp, #8]
	ldrh r2, [r4, #0x64]
	strh r2, [sp, #0xa]
	ldrh r2, [r4, #0x66]
	strh r2, [sp, #0xc]
	bl ov29_0230F9A4
	add r0, r4, #0x62
	bl ItemZInit
	mov r0, r5
	str sl, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r3, sb
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r5, #1
	b _022FB504
_022FB31C:
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB3D4
	mov r0, sl
	add r1, r4, #0x62
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, r5
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, r5
	bl SubstitutePlaceholderStringTags
	add r1, r4, #0x62
	mov r0, #1
	bl ov29_02344B44
	ldr r2, _022FB510 ; =0x00000C24
	mov r0, sl
	mov r1, sb
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrh r2, [r4, #0x62]
	mov r0, sl
	add r1, r4, #0x62
	strh r2, [sp, #8]
	ldrh r2, [r4, #0x64]
	strh r2, [sp, #0xa]
	ldrh r2, [r4, #0x66]
	strh r2, [sp, #0xc]
	bl ov29_0230F9A4
	add r0, r4, #0x62
	bl RemoveEquivItem
	add r0, r4, #0x62
	bl ItemZInit
	mov r0, r5
	str sl, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r3, sb
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r5, #1
	b _022FB504
_022FB3D4:
	bl GetNbItemsInBag
	mov r7, r0
	mov r6, r5
	add r4, sp, #0xe
	b _022FB3F8
_022FB3E8:
	mov r0, r7
	bl RandInt
	strb r0, [r4, r6]
	add r6, r6, #1
_022FB3F8:
	cmp r6, r7
	blt _022FB3E8
	add r0, sp, #0xe
	mov r1, #0
	add r0, r0, r7
	b _022FB418
_022FB410:
	strb r1, [r0, r1]
	add r1, r1, #1
_022FB418:
	cmp r1, r7
	blt _022FB410
	mov r8, #0
	add r4, sp, #0xe
	ldr fp, _022FB514 ; =BAG_ITEMS_PTR_MIRROR
	b _022FB4FC
_022FB430:
	ldrb r1, [r4, r8]
	ldr r3, [fp]
	mov r0, #6
	smulbb r2, r1, r0
	ldr r1, [r3, #0x384]
	ldrb r0, [r1, r2]
	add r6, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022FB4F8
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _022FB4F8
	ldrsh r0, [r6, #4]
	bl ShouldTryEatItem
	cmp r0, #0
	beq _022FB4F8
	mov r0, sl
	mov r1, r6
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022FB504
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sb
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r1, r6
	mov r0, #1
	bl ov29_02344B44
	mov r0, sl
	mov r1, sb
	ldr r2, _022FB518 ; =0x00000C25
	bl LogMessageByIdWithPopupCheckUserTarget
	str sl, [sp]
	mov r3, sb
	str r6, [sp, #4]
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl ApplyItemEffect
	mov r0, r6
	bl RemoveEquivItem
	mov r5, #1
	b _022FB504
_022FB4F8:
	add r8, r8, #1
_022FB4FC:
	cmp r8, r7, lsl #1
	blt _022FB430
_022FB504:
	mov r0, r5
_022FB508:
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FB510: .word 0x00000C24
_022FB514: .word BAG_ITEMS_PTR_MIRROR
_022FB518: .word 0x00000C25
	arm_func_end TryEatItem

	arm_func_start ov29_022FB51C
ov29_022FB51C: ; 0x022FB51C
	stmdb sp!, {r3, lr}
	bl GetScenarioBalance
	cmp r0, #2
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FB51C

	arm_func_start ov29_022FB538
ov29_022FB538: ; 0x022FB538
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r5, [r6, #0xb4]
	mov r4, #0
	ldr r7, _022FB5E8 ; =ov29_02353538
	strb r4, [r5, #0x10c]
	ldr r0, [r7]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xe38]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	b _022FB5DC
_022FB574:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	cmpne r8, r6
	beq _022FB5D8
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xd8]
	cmp r0, #2
	bne _022FB5D8
	mov r0, r6
	mov r1, r8
	bl CanSeeTarget
	cmp r0, #0
	beq _022FB5D8
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xd9]
	cmp r0, #0
	movne r0, #2
	moveq r0, #1
	strb r0, [r5, #0x10c]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022FB5D8:
	add r4, r4, #1
_022FB5DC:
	cmp r4, #0x14
	blt _022FB574
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FB5E8: .word ov29_02353538
	arm_func_end ov29_022FB538

	arm_func_start CheckSpawnThreshold
CheckSpawnThreshold: ; 0x022FB5EC
	stmdb sp!, {r4, lr}
	bl GetSpawnThreshold
	mov r4, r0
	bl GetScenarioBalanceVeneer
	cmp r4, r0
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end CheckSpawnThreshold

	arm_func_start HasLowHealth
HasLowHealth: ; 0x022FB610
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r3, [r4, #0xb4]
	ldr r0, _022FB674 ; =0x000003E7
	ldrsh r2, [r3, #0x12]
	ldrsh r1, [r3, #0x16]
	add r2, r2, r1
	cmp r2, r0
	movgt r2, r0
	mov r0, r2, asr #1
	ldrsh r1, [r3, #0x10]
	add r0, r2, r0, lsr #30
	cmp r1, r0, asr #2
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FB674: .word 0x000003E7
	arm_func_end HasLowHealth

	arm_func_start AreEntitiesAdjacent
AreEntitiesAdjacent: ; 0x022FB678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	ldr r4, _022FB6E0 ; =DIRECTIONS_XY
	b _022FB6D0
_022FB690:
	mov r1, r5, lsl #2
	add r0, r4, r5, lsl #2
	ldrsh r3, [r4, r1]
	ldrsh ip, [r7, #4]
	ldrsh r1, [r0, #2]
	ldrsh r2, [r7, #6]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr r0, [r0, #0xc]
	cmp r0, r6
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022FB6D0:
	cmp r5, #8
	blt _022FB690
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FB6E0: .word DIRECTIONS_XY
	arm_func_end AreEntitiesAdjacent

	arm_func_start ov29_022FB6E4
ov29_022FB6E4: ; 0x022FB6E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xd6
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022FB6E4

	arm_func_start ov29_022FB718
ov29_022FB718: ; 0x022FB718
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, [sl, #0xb4]
	mov r1, #0
	mov r0, sl
	strh r1, [sb, #0x16]
	bl Conversion2IsActive
	mov r6, r0
	mov r0, sl
	mov r1, #0x38
	ldr r4, [sl, #0xb4]
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrne r0, _022FB834 ; =_020A1870
	mov r8, #0
	ldrnesh r1, [r4, #0x16]
	ldrnesh r0, [r0]
	add r5, r4, #0x124
	mov fp, r8
	addne r0, r1, r0
	strneh r0, [r4, #0x16]
	mov r4, #1
_022FB77C:
	ldrb r0, [r5, r8, lsl #3]
	add r7, r5, r8, lsl #3
	tst r0, #1
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	beq _022FB7C0
	ldrh r2, [r7, #2]
	mov r0, sl
	mov r1, #0x39
	bic r2, r2, #0x100
	strh r2, [r7, #2]
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneh r0, [r7, #2]
	orrne r0, r0, #0x100
	strneh r0, [r7, #2]
_022FB7C0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FB77C
	mov r0, sl
	bl ov29_02348100
	cmp r6, #2
	bne _022FB7FC
	mov r0, sl
	bl Conversion2IsActive
	cmp r0, #0
	bne _022FB7FC
	mov r0, sl
	bl ov29_02307CE0
_022FB7FC:
	ldrsh r1, [sb, #0x12]
	ldrsh r0, [sb, #0x16]
	ldr r2, _022FB838 ; =0x000003E7
	add r1, r1, r0
	cmp r1, r2
	ldrsh r0, [sb, #0x10]
	movle r2, r1
	cmp r0, r2
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022FB838 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [sb, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FB834: .word _020A1870
_022FB838: .word 0x000003E7
	arm_func_end ov29_022FB718

	arm_func_start ov29_022FB83C
ov29_022FB83C: ; 0x022FB83C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	bl EntityIsValid__022F7364
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r8, [sl, #0xb4]
	mov r7, #0
	add r6, r8, #0x124
	mov r4, r7
	mov r5, #1
_022FB868:
	ldrb r0, [r6, r7, lsl #3]
	mov r1, r7, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB88C
	add r0, r6, r1
	bl GetMoveBasePp
_022FB88C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FB868
	mov r0, sl
	bl ov29_022FB718
	cmp sb, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrsh r2, [r8, #0x12]
	ldrsh r1, [r8, #0x16]
	ldr r0, _022FB91C ; =0x000003E7
	mov sb, #0
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r8, #0x10]
	add r6, r8, #0x124
	mov r4, sb
	mov r5, #1
_022FB8DC:
	ldrb r0, [r6, sb, lsl #3]
	add r7, r6, sb, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _022FB904
	mov r0, r7
	bl GetMaxPp
	strb r0, [r7, #6]
_022FB904:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _022FB8DC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FB91C: .word 0x000003E7
	arm_func_end ov29_022FB83C

	arm_func_start ov29_022FB920
ov29_022FB920: ; 0x022FB920
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022FB980 ; =ov29_02353538
	mov r5, #0
_022FB92C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	bl ov29_022FB718
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _022FB92C
	mov r0, #0x41
	bl TeamMemberHasEnabledIqSkill
	cmp r0, #0
	ldrne r0, _022FB980 ; =ov29_02353538
	movne r1, #1
	ldreq r0, _022FB980 ; =ov29_02353538
	moveq r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x241]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FB980: .word ov29_02353538
	arm_func_end ov29_022FB920

	arm_func_start ov29_022FB984
ov29_022FB984: ; 0x022FB984
	mov r0, #0
	bx lr
	arm_func_end ov29_022FB984

	arm_func_start ov29_022FB98C
ov29_022FB98C: ; 0x022FB98C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r2, #1
	ldr r0, _022FB9B8 ; =0x0000270F
	mov r4, r1
	sub r3, r2, #2
	bl ov29_022EA718
	mov r0, r5
	mov r1, r4
	bl ov29_022E576C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FB9B8: .word 0x0000270F
	arm_func_end ov29_022FB98C

	arm_func_start ov29_022FB9BC
ov29_022FB9BC: ; 0x022FB9BC
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FB9BC

	arm_func_start ov29_022FB9E0
ov29_022FB9E0: ; 0x022FB9E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBA4C
	ldr r1, [r5, #0xb4]
	mov r0, #0
	add ip, r1, #0x124
	mov r2, r0
	mov r3, #1
	b _022FBA44
_022FBA10:
	ldrb r1, [ip, r0, lsl #3]
	add lr, ip, r0, lsl #3
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _022FBA38
	ldrh r1, [lr, #4]
	cmp r1, r4
	ldmeqia sp!, {r3, r4, r5, pc}
_022FBA38:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022FBA44:
	cmp r0, #4
	blt _022FBA10
_022FBA4C:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022FB9E0

	arm_func_start ov29_022FBA54
ov29_022FBA54: ; 0x022FBA54
	stmdb sp!, {r3, lr}
	bl ov29_022FB9E0
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022FBA54

	arm_func_start ov29_022FBA70
ov29_022FBA70: ; 0x022FBA70
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBAAC
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #0x48]
	cmp r0, #0xfa
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #0xd9
	blo _022FBAAC
	cmp r0, #0xe4
	movlo r0, #1
	ldmloia sp!, {r4, pc}
_022FBAAC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022FBA70

	arm_func_start ov29_022FBAB4
ov29_022FBAB4: ; 0x022FBAB4
	ldr r2, [r0, #0xb4]
	cmp r2, #0
	addne r0, r2, #0x100
	movne r1, #0
	strneh r1, [r0, #0x92]
	strne r1, [r2, #0x18c]
	bx lr
	arm_func_end ov29_022FBAB4

	arm_func_start IsSpecialStoryAlly
IsSpecialStoryAlly: ; 0x022FBAD0
	ldrb r0, [r0, #0x48]
	cmp r0, #0xd9
	blo _022FBAE8
	cmp r0, #0xe4
	movlo r0, #1
	bxlo lr
_022FBAE8:
	mov r0, #0
	bx lr
	arm_func_end IsSpecialStoryAlly

	arm_func_start IsExperienceLocked
IsExperienceLocked: ; 0x022FBAF0
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x48]
	cmp r1, #0xfa
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl IsSpecialStoryAlly
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsExperienceLocked

	arm_func_start ov29_022FBB1C
ov29_022FBB1C: ; 0x022FBB1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	ldr r4, _022FBBE4 ; =ov29_02353538
	ldr sl, _022FBBE8 ; =0x00019914
	mov r7, #0
	add r6, sp, #0
	mov r5, #3
_022FBB38:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb78]
	mov r0, r8
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBBD0
	ldr sb, [r8, #0xb4]
	ldr r2, [r4]
	ldrsh r1, [sb, #4]
	add r0, r8, #0x2c
	add r1, r2, r1, lsl #1
	ldrsh r1, [r1, sl]
	strh r1, [r8, #0xa8]
	bl sub_0201C0CC
	ldrsh r1, [r8, #0xa8]
	add r0, r8, #0x2c
	bl SetSpriteIdForAnimationControl
	mov r0, r8
	bl GetSleepAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	ldrh r0, [r8, #4]
	mov r2, r6
	mov r3, r5
	strh r0, [sp]
	ldrh r0, [r8, #6]
	strh r0, [sp, #2]
	ldr r0, [sb, #0xb0]
	ldrsh r1, [sb, #4]
	bl ov29_022DDA54
	ldrsh r0, [r8, #4]
	ldrsh r1, [r8, #6]
	bl GetTileSafe
	ldrb r0, [r0, #7]
	strb r0, [r8, #0x25]
_022FBBD0:
	add r7, r7, #1
	cmp r7, #0x14
	blt _022FBB38
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FBBE4: .word ov29_02353538
_022FBBE8: .word 0x00019914
	arm_func_end ov29_022FBB1C

	arm_func_start ov29_022FBBEC
ov29_022FBBEC: ; 0x022FBBEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, #0
	ldr r6, _022FBC48 ; =ov29_02353538
	b _022FBC38
_022FBC00:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBC34
	ldr r0, [r7, #0xb4]
	ldrb r0, [r0, #0xbc]
	cmp r5, r0
	moveq r0, r7
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022FBC34:
	add r4, r4, #1
_022FBC38:
	cmp r4, #0x14
	blt _022FBC00
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FBC48: .word ov29_02353538
	arm_func_end ov29_022FBBEC

	arm_func_start ov29_022FBC4C
ov29_022FBC4C: ; 0x022FBC4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r4, _022FBC90 ; =ov29_02353538
	b _022FBC80
_022FBC5C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	bl EntityIsValid__022F7364
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r5, r5, #1
_022FBC80:
	cmp r5, #4
	blt _022FBC5C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FBC90: .word ov29_02353538
	arm_func_end ov29_022FBC4C

	arm_func_start ov29_022FBC94
ov29_022FBC94: ; 0x022FBC94
	stmdb sp!, {r4, r5, r6, lr}
	bl GetBodySize
	ldr r6, _022FBD04 ; =ov29_02353538
	mov r4, r0
	mov r5, #0
_022FBCA8:
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	bl EntityIsValid__022F7364
	cmp r0, #0
	beq _022FBCE4
	ldr r0, [r6]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	ldr r0, [r0, #0xb4]
	ldrsh r0, [r0, #2]
	bl GetBodySize
	add r4, r4, r0
_022FBCE4:
	add r5, r5, #1
	cmp r5, #4
	blt _022FBCA8
	cmp r4, #6
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FBD04: .word ov29_02353538
	arm_func_end ov29_022FBC94

	arm_func_start ov29_022FBD08
ov29_022FBD08: ; 0x022FBD08
	ldr r0, _022FBD20 ; =ov29_02353538
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0xe1c]
	bx lr
	.align 2, 0
_022FBD20: .word ov29_02353538
	arm_func_end ov29_022FBD08

	arm_func_start ov29_022FBD24
ov29_022FBD24: ; 0x022FBD24
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _022FBD7C ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x1cc
	add r3, r0, #0x3c00
	ldr r2, [r3, #0x50]
	cmp r2, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xb4]
	mov r0, #1
	ldr r1, [r1, #0xb0]
	str r1, [r3, r2, lsl #2]
	ldr r1, [r3, #0x50]
	add r1, r1, #1
	str r1, [r3, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBD7C: .word ov29_02353538
	arm_func_end ov29_022FBD24

	arm_func_start ov29_022FBD80
ov29_022FBD80: ; 0x022FBD80
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonster__022F9720
	cmp r0, #0
	beq _022FBDD4
	ldr r0, _022FBDDC ; =ov29_02353538
	ldr r1, [r4, #0xb4]
	ldr r0, [r0]
	ldr r2, [r1, #0xb0]
	add r0, r0, #0x1cc
	add r1, r0, #0x3c00
	ldr ip, [r1, #0x50]
	mov r3, #0
	b _022FBDCC
_022FBDB8:
	ldr r0, [r1, r3, lsl #2]
	cmp r2, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r3, r3, #1
_022FBDCC:
	cmp r3, ip
	blt _022FBDB8
_022FBDD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022FBDDC: .word ov29_02353538
	arm_func_end ov29_022FBD80

	arm_func_start ov29_022FBDE0
ov29_022FBDE0: ; 0x022FBDE0
	ldr ip, _022FBDEC ; =ov29_022EFAE8
	ldrb r0, [r0, #0xbc]
	bx ip
	.align 2, 0
_022FBDEC: .word ov29_022EFAE8
	arm_func_end ov29_022FBDE0

	arm_func_start ov29_022FBDF0
ov29_022FBDF0: ; 0x022FBDF0
	ldr r0, [r0, #0xb4]
	ldr ip, _022FBE00 ; =IsSecretBazaarNpcBehavior
	ldrb r0, [r0, #0xbc]
	bx ip
	.align 2, 0
_022FBE00: .word IsSecretBazaarNpcBehavior
	arm_func_end ov29_022FBDF0

	arm_func_start ov29_022FBE04
ov29_022FBE04: ; 0x022FBE04
	stmdb sp!, {r3, lr}
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _022FBE4C
	ldr r0, _022FBE54 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl GetTurnLimit
	ldr r1, _022FBE54 ; =ov29_02353538
	ldr r1, [r1]
	add r1, r1, #0x700
	ldrsh r1, [r1, #0x84]
	cmp r1, r0
	bne _022FBE4C
	bl IsFullFloorFixedRoom
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_022FBE4C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBE54: .word ov29_02353538
	arm_func_end ov29_022FBE04

	arm_func_start InitOtherMonsterData
InitOtherMonsterData: ; 0x022FBE58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr ip, [r4, #0xb4]
	mov r6, #1
	strb r6, [ip, #0x100]
	ldrsh r5, [ip, #0x12]
	ldrsh r3, [ip, #0x16]
	ldr r7, _022FBF04 ; =FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	mov r0, #0xc
	add r5, r5, r3
	smlabb r3, r1, r0, r7
	rsb lr, r6, #0x3e8
	cmp r5, lr
	movgt r5, lr
	strh r5, [ip, #0x14]
	mov r0, #0
	strh r0, [ip, #0x16]
	strh r0, [ip, #0x18]
	ldrsh r5, [r3, #2]
	add lr, ip, #0x100
	add r0, ip, #0x90
	strh r5, [ip, #0x12]
	ldrsh r5, [r3, #2]
	strh r5, [ip, #0x10]
	ldrb r5, [r3, #6]
	strb r5, [ip, #0x1a]
	ldrb r5, [r3, #7]
	strb r5, [ip, #0x1b]
	ldrb r5, [r3, #8]
	strb r5, [ip, #0x1c]
	ldrb r3, [r3, #9]
	strb r3, [ip, #0x1d]
	strh r1, [lr, #0x68]
	strb r2, [ip, #0x16a]
	ldrsh r1, [ip, #2]
	ldrsh r2, [ip, #0xe]
	bl EnableAllLearnableIqSkills
	mov r0, r4
	bl ov29_023021F0
	mov r0, r4
	mov r1, #1
	bl ov29_022FB83C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FBF04: .word FIXED_ROOM_MONSTER_SPAWN_STATS_TABLE
	arm_func_end InitOtherMonsterData

	arm_func_start ov29_022FBF08
ov29_022FBF08: ; 0x022FBF08
	stmdb sp!, {r3, lr}
	ldr r0, _022FBF2C ; =ov29_02353538
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r3, pc}
	bl LoadWazaP2
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBF2C: .word ov29_02353538
	arm_func_end ov29_022FBF08

	arm_func_start ov29_022FBF30
ov29_022FBF30: ; 0x022FBF30
	stmdb sp!, {r3, lr}
	ldr r0, _022FBF54 ; =ov29_02353538
	ldr r0, [r0]
	ldr r0, [r0, #0x7cc]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r3, pc}
	bl UnloadCurrentWazaP
	ldmia sp!, {r3, pc}
	.align 2, 0
_022FBF54: .word ov29_02353538
	arm_func_end ov29_022FBF30

	arm_func_start InitEnemySpawnStats
InitEnemySpawnStats: ; 0x022FBF58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x218
	ldr r1, _022FC230 ; =ov29_02353538
	mov r0, #0
	ldr r1, [r1]
	add r1, r1, #0xf4
	add r5, r1, #0x3400
	bl DungeonRngSetSecondary
	bl ov29_022FBF08
	add r0, sp, #0x16
	mov r1, #0
	bl ov29_022E7BE8
	mov r4, r0
	mov r6, #0
	b _022FC028
_022FBF94:
	add r0, sp, #0x16
	add r7, r0, r6, lsl #3
	mov r0, r7
	bl GetMonsterIdFromSpawnEntry
	strh r0, [r5]
	mov r0, r7
	bl GetMonsterLevelFromSpawnEntry
	strh r0, [r5, #2]
	ldrsh r1, [r5]
	ldrsh r2, [r5, #2]
	add r0, r5, #4
	bl GetMonsterMoves
	ldrh r0, [r5, #4]
	cmp r0, #0
	moveq r0, #0x170
	streqh r0, [r5, #4]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetMaxHpAtLevel
	strh r0, [r5, #0xc]
	mov r7, #0
_022FBFE8:
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r7
	add r8, r5, r7
	bl GetOffensiveStatAtLevel
	strb r0, [r8, #0xe]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r7
	bl GetDefensiveStatAtLevel
	add r7, r7, #1
	strb r0, [r8, #0x10]
	cmp r7, #2
	blt _022FBFE8
	add r5, r5, #0x12
	add r6, r6, #1
_022FC028:
	cmp r6, r4
	blt _022FBF94
	mov r0, #0
	b _022FC040
_022FC038:
	strh r0, [r5], #0x12
	add r6, r6, #1
_022FC040:
	cmp r6, #0x40
	blt _022FC038
	cmp r4, #0x40
	bge _022FC0A8
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	bne _022FC0A8
	bl IsDestinationFloorWithMonster
	cmp r0, #0
	beq _022FC0A8
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	bne _022FC088
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022FC0A8
_022FC088:
	add r0, sp, #8
	bl GetOutlawSpawnData
	add r0, sp, #0x16
	ldrsh r1, [sp, #0xc]
	ldrsh r2, [sp, #8]
	add r0, r0, r4, lsl #3
	bl SetMonsterLevelAndId
	add r4, r4, #1
_022FC0A8:
	cmp r4, #0x40
	bge _022FC0E0
	ldr r0, _022FC230 ; =ov29_02353538
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsh r1, [r0, #0xa8]
	cmp r1, #0
	beq _022FC0E0
	ldrb r1, [r2, #0x7aa]
	ldrsh r2, [r0, #0xa8]
	add r3, sp, #0x16
	add r0, r3, r4, lsl #3
	bl SetMonsterLevelAndId
	add r4, r4, #1
_022FC0E0:
	mov r2, #0
	ldr r1, _022FC230 ; =ov29_02353538
	mov sl, r2
_022FC0EC:
	ldr r0, [r1]
	add r0, r0, r2
	add r0, r0, #0x3000
	add r2, r2, #1
	strb sl, [r0, #0xb74]
	cmp r2, #0x258
	blt _022FC0EC
	mvn r0, #0
	mov r5, #1
	str r0, [sp]
	b _022FC1E8
_022FC118:
	ldr r6, [sp]
	mov r8, #0
	mov r7, r6
	b _022FC194
_022FC128:
	add r0, sp, #0x16
	add sb, r0, r8, lsl #3
	mov r0, sb
	bl GetMonsterIdFromSpawnEntry
	mov fp, r0
	mov r0, sb
	bl GetMonsterLevelFromSpawnEntry
	str r0, [sp, #4]
	mov r0, fp
	mov r1, #0x258
	bl __divsi3
	ldr r0, _022FC230 ; =ov29_02353538
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	mov sb, r1, asr #0x10
	add r0, r0, r1, asr #16
	add r0, r0, #0x3000
	ldrb r0, [r0, #0xb74]
	cmp r0, #0
	bne _022FC190
	ldr r1, [sp, #4]
	mov r0, sb
	bl GetExp
	cmp r7, r0
	movlt r7, r0
	movlt r6, sb
_022FC190:
	add r8, r8, #1
_022FC194:
	cmp r8, r4
	blt _022FC128
	cmp r6, #0
	blt _022FC1F0
	cmp r5, #0x100
	ble _022FC1C8
	ldr r0, _022FC230 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, r6
	add r1, r0, #0x3000
	mov r0, #1
	strb r0, [r1, #0xb74]
	b _022FC1E4
_022FC1C8:
	ldr r0, _022FC230 ; =ov29_02353538
	rsb r1, r5, #0x100
	ldr r0, [r0]
	add r5, r5, #2
	add r0, r0, r6
	add r0, r0, #0x3000
	strb r1, [r0, #0xb74]
_022FC1E4:
	add sl, sl, #1
_022FC1E8:
	cmp sl, r4
	blt _022FC118
_022FC1F0:
	ldr r1, _022FC230 ; =ov29_02353538
	mov r4, #0
	mov r2, #1
_022FC1FC:
	ldr r0, [r1]
	add r0, r0, r4
	add r0, r0, #0x3000
	ldrb r3, [r0, #0xb74]
	add r4, r4, #1
	cmp r3, #0
	streqb r2, [r0, #0xb74]
	cmp r4, #0x258
	blt _022FC1FC
	bl ov29_022FBF30
	bl DungeonRngSetPrimary
	add sp, sp, #0x218
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC230: .word ov29_02353538
	arm_func_end InitEnemySpawnStats

	arm_func_start InitEnemyStatsAndMoves
InitEnemyStatsAndMoves: ; 0x022FC234
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldrsh r0, [sp, #0x30]
	mov sb, r1
	mov r1, #0x258
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x34]
	bl __divsi3
	mov r0, r1, lsl #0x10
	ldr r2, _022FC464 ; =ov29_02353538
	mov r4, r0, asr #0x10
	ldr r1, [r2]
	mov fp, #0
	add r0, r1, #0xf4
	add r5, r0, #0x3400
	mov r3, r5
	mov r0, #0x12
	b _022FC314
_022FC284:
	mul r2, fp, r0
	ldrsh r1, [r3, r2]
	add r5, r3, r2
	cmp r1, #0
	beq _022FC31C
	cmp r1, r4
	ldreqsh r1, [r5, #2]
	cmpeq r1, r6
	bne _022FC310
	mov r1, r4
	mov r2, r6
	add r0, r5, #4
	bl GetMonsterMoves
	mov r4, #0
_022FC2BC:
	add r0, r5, r4, lsl #1
	ldrh r1, [r0, #4]
	add r0, sl, r4, lsl #3
	bl InitMoveCheckId
	add r4, r4, #1
	cmp r4, #4
	blt _022FC2BC
	ldrsh r0, [r5, #0xc]
	mov r2, #0
	strh r0, [sb]
_022FC2E4:
	add r1, r5, r2
	ldrb r0, [r1, #0xe]
	strb r0, [r8, r2]
	ldrb r0, [r1, #0x10]
	strb r0, [r7, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC2E4
	mov r0, #0
	strb r0, [sl, #0x20]
	b _022FC45C
_022FC310:
	add fp, fp, #1
_022FC314:
	cmp fp, #0x40
	blt _022FC284
_022FC31C:
	cmp fp, #0x40
	bne _022FC3A4
	add r0, sp, #0
	mov r1, r4
	mov r2, r6
	bl GetMonsterMoves
	mov r5, #0
	add fp, sp, #0
_022FC33C:
	mov r0, r5, lsl #1
	ldrh r1, [fp, r0]
	add r0, sl, r5, lsl #3
	bl InitMoveCheckId
	add r5, r5, #1
	cmp r5, #4
	blt _022FC33C
	mov r0, r4
	mov r1, r6
	bl GetMaxHpAtLevel
	strh r0, [sb]
	mov r5, #0
_022FC36C:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl GetOffensiveStatAtLevel
	strb r0, [r8, r5]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl GetDefensiveStatAtLevel
	strb r0, [r7, r5]
	add r5, r5, #1
	cmp r5, #2
	blt _022FC36C
	b _022FC454
_022FC3A4:
	strh r4, [r5]
	mov r1, r4
	mov r2, r6
	strh r6, [r5, #2]
	add r0, r5, #4
	bl GetMonsterMoves
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetMaxHpAtLevel
	strh r0, [r5, #0xc]
	mov r6, #0
_022FC3D0:
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r6
	add r4, r5, r6
	bl GetOffensiveStatAtLevel
	strb r0, [r4, #0xe]
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	mov r2, r6
	bl GetDefensiveStatAtLevel
	add r6, r6, #1
	strb r0, [r4, #0x10]
	cmp r6, #2
	blt _022FC3D0
	mov r4, #0
_022FC40C:
	add r0, r5, r4, lsl #1
	ldrh r1, [r0, #4]
	add r0, sl, r4, lsl #3
	bl InitMoveCheckId
	add r4, r4, #1
	cmp r4, #4
	blt _022FC40C
	ldrsh r0, [r5, #0xc]
	mov r2, #0
	strh r0, [sb]
_022FC434:
	add r1, r5, r2
	ldrb r0, [r1, #0xe]
	strb r0, [r8, r2]
	ldrb r0, [r1, #0x10]
	strb r0, [r7, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC434
_022FC454:
	mov r0, #0
	strb r0, [sl, #0x20]
_022FC45C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC464: .word ov29_02353538
	arm_func_end InitEnemyStatsAndMoves

	arm_func_start ov29_022FC468
ov29_022FC468: ; 0x022FC468
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, [sp, #0x24]
	mov sb, r0
	cmp r4, #0xb
	mov r0, #0
	cmp r4, #0xc
	moveq r0, #1
	cmp r4, #0xd
	moveq r0, #2
	cmp r4, #0xe
	moveq r0, #3
	mov r8, r1
	mov r7, r2
	mov r6, r3
	ldr r5, [sp, #0x20]
	bl GetExplorerMazeMonster
	mov r4, r0
	mov r0, sb
	add r1, r4, #0x22
	bl GroundToDungeonMoveset
	ldrsh r0, [r4, #0xa]
	mov r2, #0
	strh r0, [r8]
_022FC4C4:
	add r1, r4, r2
	ldrb r0, [r1, #0xc]
	strb r0, [r7, r2]
	ldrb r0, [r1, #0xe]
	strb r0, [r6, r2]
	add r2, r2, #1
	cmp r2, #2
	blt _022FC4C4
	ldrsh r1, [r4, #8]
	ldr r0, _022FC508 ; =IQ_SKILLS
	ldr r0, [r0, #0x20]
	strh r1, [r5]
	cmp r1, r0
	strlth r0, [r5]
	mov r0, #0
	strb r0, [sb, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FC508: .word IQ_SKILLS
	arm_func_end ov29_022FC468

	arm_func_start SpawnTeam
SpawnTeam: ; 0x022FC50C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	mov sl, r0
	mov r0, #0
	bl DungeonRngSetSecondary
	ldr r0, _022FC98C ; =ov29_02353538
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe0]
	ldrsh r1, [r1, #0xe2]
	bl GetTile
	ldrb fp, [r0, #7]
	mov r4, #0
_022FC540:
	mov r0, r4
	bl GetActiveTeamMember
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	strh r4, [r0, #0xa]
	mov r4, r1, asr #0x10
	cmp r4, #4
	blt _022FC540
	mov r7, #0
	mov r6, #1
	mov r8, r7
	mov r5, r7
	mov sb, r6
	add r4, sp, #0x34
_022FC578:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r2, r6
	moveq r2, r5
	tst r2, #0xff
	beq _022FC5B0
	tst r1, #2
	movne r1, sb
	moveq r1, #0
	tst r1, #0xff
	strne r0, [r4, r7, lsl #2]
	addne r7, r7, #1
_022FC5B0:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FC578
	mov r1, #0
	add r0, sp, #0x34
	b _022FC5D8
_022FC5D0:
	str r1, [r0, r7, lsl #2]
	add r7, r7, #1
_022FC5D8:
	cmp r7, #4
	blt _022FC5D0
	mov r8, #0
	mov r7, r8
	mov r3, r8
	mov r4, #1
	mov r2, r8
	add r5, sp, #0x34
	add r1, sp, #0x24
_022FC5FC:
	ldr r6, [r5, r7, lsl #2]
	cmp r6, #0
	beq _022FC628
	ldrb r0, [r6, #1]
	cmp r0, #0
	movne r0, r4
	moveq r0, r3
	tst r0, #0xff
	strne r6, [r1, r8, lsl #2]
	strne r2, [r5, r7, lsl #2]
	addne r8, r8, #1
_022FC628:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FC5FC
	ldr r0, _022FC98C ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	bne _022FC698
	mov r7, #0
	mov r4, r7
	add r5, sp, #0x34
	add sb, sp, #0x24
_022FC660:
	ldr r6, [r5, r7, lsl #2]
	cmp r6, #0
	beq _022FC684
	ldrb r0, [r6, #3]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	strne r6, [sb, r8, lsl #2]
	strne r4, [r5, r7, lsl #2]
	addne r8, r8, #1
_022FC684:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022FC660
_022FC698:
	mov r4, #0
	mov r2, r4
	add r1, sp, #0x24
	add r3, sp, #0x34
_022FC6A8:
	ldr r0, [r3, r4, lsl #2]
	cmp r0, #0
	strne r0, [r1, r8, lsl #2]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	strne r2, [r3, r4, lsl #2]
	mov r4, r0, asr #0x10
	addne r8, r8, #1
	cmp r4, #4
	blt _022FC6A8
	mov r1, #0
	add r0, sp, #0x24
	b _022FC6E4
_022FC6DC:
	str r1, [r0, r8, lsl #2]
	add r8, r8, #1
_022FC6E4:
	cmp r8, #4
	blt _022FC6DC
	mov sb, #0
_022FC6F0:
	add r0, sp, #0x24
	ldr r5, [r0, sb, lsl #2]
	mov r6, #0
	cmp r5, #0
	beq _022FC8BC
	ldrsh r1, [r5, #0xc]
	sub r0, r1, #0x17c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FC990 ; =0x0000017B
	strlsh r0, [r5, #0xc]
	bls _022FC74C
	sub r0, r1, #0x3d4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FC994 ; =0x000003D3
	strlsh r0, [r5, #0xc]
_022FC74C:
	mov r4, #0
_022FC750:
	ldr r0, _022FC998 ; =ov29_02351E28
	mov r1, r4, lsl #2
	ldrh r1, [r0, r1]
	add r0, r0, r4, lsl #2
	ldrh r0, [r0, #2]
	strh r1, [sp, #0x1e]
	ldrsh r8, [sp, #0x1e]
	strh r0, [sp, #0x20]
	cmp r8, #0x63
	beq _022FC808
	ldr r0, _022FC98C ; =ov29_02353538
	ldrsh r7, [sp, #0x20]
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe2]
	ldrsh r2, [r0, #0xe0]
	add r1, r7, r1
	add r0, r8, r2
	bl GetTile
	mov r1, r0
	ldrb r0, [r1, #7]
	cmp r0, fp
	bne _022FC800
	ldrsh r0, [r5, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FC800
	ldr r0, _022FC98C ; =ov29_02353538
	mov r1, #0
	ldr r2, [r0]
	mov r0, #1
	str r1, [sp]
	stmib sp, {r0, r1, sl}
	str r1, [sp, #0x10]
	add r0, r2, #0xcc00
	ldrsh r1, [r0, #0xe0]
	ldrsh r2, [r0, #0xe2]
	ldrsh r0, [r5, #0xc]
	mov r3, r5
	add r1, r8, r1
	add r2, r7, r2
	bl InitTeamMember
	mov r6, #1
	b _022FC808
_022FC800:
	add r4, r4, #1
	b _022FC750
_022FC808:
	cmp r6, #0
	bne _022FC8BC
	ldr r8, _022FC998 ; =ov29_02351E28
	mov r7, #0
_022FC818:
	mov r0, r7, lsl #2
	ldrh r1, [r8, r0]
	add r0, r8, r7, lsl #2
	ldrh r0, [r0, #2]
	strh r1, [sp, #0x14]
	ldrsh r6, [sp, #0x14]
	strh r0, [sp, #0x16]
	cmp r6, #0x63
	beq _022FC8BC
	ldr r0, _022FC98C ; =ov29_02353538
	ldrsh r4, [sp, #0x16]
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r1, [r0, #0xe2]
	ldrsh r2, [r0, #0xe0]
	add r1, r4, r1
	add r0, r6, r2
	bl GetTile
	mov r1, r0
	ldrsh r0, [r5, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FC8B4
	ldr r0, _022FC98C ; =ov29_02353538
	mov r1, #0
	ldr r2, [r0]
	mov r0, #1
	str r1, [sp]
	stmib sp, {r0, r1, sl}
	str r1, [sp, #0x10]
	add r0, r2, #0xcc00
	ldrsh r1, [r0, #0xe0]
	ldrsh r2, [r0, #0xe2]
	ldrsh r0, [r5, #0xc]
	mov r3, r5
	add r1, r6, r1
	add r2, r4, r2
	bl InitTeamMember
	b _022FC8BC
_022FC8B4:
	add r7, r7, #1
	b _022FC818
_022FC8BC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _022FC6F0
	bl ov29_022FCD04
	mov r2, #0
	mov r8, r2
	add r1, sp, #0x18
_022FC8E0:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	strb r8, [r1, r2]
	mov r2, r0, asr #0x10
	cmp r2, #5
	blt _022FC8E0
	ldr r4, _022FC98C ; =ov29_02353538
	mov r6, #0
	mov r7, #1
	add r5, sp, #0x18
_022FC908:
	ldr r0, [r4]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	bl EntityIsValid__022FC99C
	cmp r0, #0
	beq _022FC964
	ldr r0, [r4]
	add r1, r8, r8, lsl #3
	add r0, r0, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1, lsl #6]
	add r2, r2, r1, lsl #6
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	ldrneb r1, [r2, #1]
	cmpne r1, #0
	addne r0, r8, #1
	andne r0, r0, #0xff
	strneb r0, [r5, r1]
	strneb r0, [r2, #1]
_022FC964:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _022FC908
	add r0, sp, #0x18
	bl sub_0200F9B4
	bl DungeonRngSetPrimary
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FC98C: .word ov29_02353538
_022FC990: .word 0x0000017B
_022FC994: .word 0x000003D3
_022FC998: .word ov29_02351E28
	arm_func_end SpawnTeam
