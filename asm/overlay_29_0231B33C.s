	.include "asm/macros.inc"
	.include "overlay_29_0231B33C.inc"

	.text

	arm_func_start ActivateStench
ActivateStench: ; 0x0231B33C
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xb4]
	bl ov29_022E60E4
	ldr r0, _0231B360 ; =ov10_022C457C
	mov r1, #2
	ldrsh r0, [r0]
#ifdef JAPAN
	strb r1, [r4, #0x103]
	strb r0, [r4, #0x104]
#else
	strb r1, [r4, #0x104]
	strb r0, [r4, #0x105]
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231B360: .word ov10_022C457C
	arm_func_end ActivateStench

	arm_func_start TryActivateSteadfast
TryActivateSteadfast: ; 0x0231B364
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0x70
	bl AbilityIsActiveVeneer
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end TryActivateSteadfast

	arm_func_start ov29_0231B39C
ov29_0231B39C: ; 0x0231B39C
	mov ip, #0
	mov r3, ip
_0231B3A4:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	strb r3, [r0, ip, lsl #2]
	add r2, r0, ip, lsl #2
	mov ip, r1, asr #0x10
	strh r3, [r2, #2]
	cmp ip, #8
	blt _0231B3A4
	strh r3, [r0, #0x20]
	bx lr
	arm_func_end ov29_0231B39C

	arm_func_start ov29_0231B3CC
ov29_0231B3CC: ; 0x0231B3CC
	ldrsh r3, [r0, #0x20]
	cmp r3, #8
	bxge lr
	mov r2, #1
	strb r2, [r0, r3, lsl #2]
	ldrsh r2, [r0, #0x20]
	add r2, r0, r2, lsl #2
	strh r1, [r2, #2]
	ldrsh r1, [r0, #0x20]
	add r1, r1, #1
	strh r1, [r0, #0x20]
	bx lr
	arm_func_end ov29_0231B3CC

	arm_func_start IsInSpawnList
IsInSpawnList: ; 0x0231B3FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r0, r1
	bl FemaleToMaleForm
	mov r4, r0
	mov r6, #0
	b _0231B44C
_0231B418:
	ldrb r0, [r5, r6, lsl #2]
	mov r1, r6, lsl #2
	cmp r0, #0
	beq _0231B440
	add r0, r5, r1
	ldrsh r0, [r0, #2]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
_0231B440:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0231B44C:
	ldrsh r0, [r5, #0x20]
	cmp r6, r0
	blt _0231B418
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end IsInSpawnList

	arm_func_start ov29_0231B460
ov29_0231B460: ; 0x0231B460
	stmdb sp!, {r3, lr}
	ldr r0, _0231B48C ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsh r1, [r0, #0xa8]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrsh r1, [r0, #0xa8]
	add r0, r2, #0x7d0
	bl ov29_0231B3CC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231B48C: .word DUNGEON_PTR
	arm_func_end ov29_0231B460

	arm_func_start ov29_0231B490
ov29_0231B490: ; 0x0231B490
	ldr r0, _0231B4A8 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	strb r1, [r0, #0xd98]
#else
	strb r1, [r0, #0xe3c]
#endif
	bx lr
	.align 2, 0
_0231B4A8: .word DUNGEON_PTR
	arm_func_end ov29_0231B490

	arm_func_start ov29_0231B4AC
ov29_0231B4AC: ; 0x0231B4AC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldreq r0, _0231B4E8 ; =DUNGEON_PTR
	ldreq r0, [r0]
	addeq r0, r0, #0x3000
#ifdef JAPAN
	ldreqb r0, [r0, #0xd98]
#else
	ldreqb r0, [r0, #0xe3c]
#endif
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0231B4E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsSkyExclusiveDungeon
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231B4E8: .word DUNGEON_PTR
	arm_func_end ov29_0231B4AC

	arm_func_start ChangeShayminForme
ChangeShayminForme: ; 0x0231B4EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	ldr r7, [r8, #0xb4]
	cmp r1, #1
	mov r6, #0
	ldrsh r0, [r7, #2]
	bne _0231B548
	bl IsShaymin
	cmp r0, #0
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r4, [r7, #2]
	ldr r0, _0231B680 ; =0x00000216
	cmp r4, r0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r1, [r7, #0xc4]
	cmp r1, #1
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r5, r0, #1
	mov r6, #1
	b _0231B570
_0231B548:
	bl IsShaymin
	cmp r0, #0
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsh r4, [r7, #2]
	ldr r0, _0231B684 ; =0x00000217
	cmp r4, r0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r5, r0, #1
_0231B570:
	ldrsh r0, [r7, #0xc]
	bl GetActiveTeamMember
	mov sb, r0
	cmp r6, #0
	beq _0231B5A0
	mov r0, r8
	mov r1, #0x2b8
	mov r2, #0
	bl ov29_022E3590
	mov r0, #0x21
	mov r1, #0x42
	bl ov29_022EA370
_0231B5A0:
	mov r0, #0
	bl ov29_022E9FD0
	mov r0, r4
	mov r1, r5
	bl SwapMonsterWanFileIndex
	strh r5, [r7, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r7, #4]
	strh r0, [sb, #0xc]
	strh r5, [r7, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r7, #4]
	ldr r4, [r8, #0xb4]
	ldrsh r0, [r4, #4]
	bl DungeonGetSpriteIndex
	strh r0, [r8, #0xa8]
	ldrb r0, [r4, #0xd8]
	cmp r0, #2
	beq _0231B5F4
	add r0, r8, #0x2c
	bl sub_0201CF80
_0231B5F4:
	mov r0, r8
	bl GetIdleAnimationId
	mov r1, r0
	mov r0, r8
	bl ov29_02304830
	mov r0, r8
	bl DetermineMonsterShadow
	mov r0, r8
	bl SetMonsterTypeAndAbility
	mov r0, #1
	bl ov29_022E9FD0
	ldr r0, _0231B684 ; =0x00000217
	cmp r5, r0
	ldreq r0, _0231B688 ; =DUNGEON_PTR
	moveq r1, #1
	ldrne r0, _0231B688 ; =DUNGEON_PTR
	movne r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
#ifdef JAPAN
	strb r1, [r0, #0xd98]
#else
	strb r1, [r0, #0xe3c]
#endif
	bl sub_020017EC
	bl ov29_022E81F8
	mov r0, #1
	mov r1, #0x42
	bl ov29_022EA370
	cmp r6, #0
	beq _0231B678
	mov r0, r8
	bl ov29_022F04F0
#ifdef JAPAN
	mov r0, #2
#else
	mov r0, #1
#endif
	bl AnimationDelayOrSomething
	mov r0, r8
	bl ov29_022F0518
_0231B678:
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0231B680: .word 0x00000216
_0231B684: .word 0x00000217
_0231B688: .word DUNGEON_PTR
	arm_func_end ChangeShayminForme

	arm_func_start ApplyItemEffect
ApplyItemEffect: ; 0x0231B68C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x5c
	movs sb, r0
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x80]
	ldr r6, [sp, #0x84]
	beq _0231B840
	cmp r1, #0
	bne _0231B840
	mov r0, r7
	ldr r5, [r7, #0xb4]
	mov r4, #0
	bl ov29_022FB9BC
	cmp r0, #0
	beq _0231B6E4
	mov r0, r8
	mov r2, r6
	add r1, r7, #4
	mov r3, r4
	bl SpawnDroppedItemWrapper
	b _0231CBA4
_0231B6E4:
	ldrb r0, [r5, #6]
	cmp r0, #0
	ldrsh r0, [r6, #4]
	beq _0231B74C
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _0231B720
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #2
	beq _0231B720
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	movne r4, #1
_0231B720:
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #4
	bne _0231B768
	ldrsh r1, [r6, #4]
	cmp r1, #0x190
	blt _0231B768
	ldr r0, _0231C6C0 ; =0x000001AB
	cmp r1, r0
	movle r4, #0
	b _0231B768
_0231B74C:
	bl GetItemCategoryVeneer
	cmp r0, #2
	beq _0231B768
	mov r0, r7
	mov r1, #2
	bl IqSkillIsEnabled
	mov r4, r0
_0231B768:
	mov r0, r7
	bl CheckVariousConditions
	cmp r0, #0
	movne r4, #0
	cmp r4, #0
	beq _0231B840
	ldrb r0, [r5, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0231B840
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0231B7B0
	bl IsBagFull
	cmp r0, #0
	bne _0231B840
_0231B7B0:
	ldrb r0, [r5, #9]
	cmp r0, #1
	bne _0231B7D4
	mov r0, r8
	mov r2, r6
	add r1, r7, #4
	mov r3, #0
	bl SpawnDroppedItemWrapper
	b _0231CBA4
_0231B7D4:
	ldr r0, _0231C6C4 ; =0x00001317
	bl ov29_022EACCC
	mov r1, r6
	mov r0, #0
	bl ov29_02344B44
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231C6C8 ; =0x00000BE6
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	ldrh r0, [r6]
	strh r0, [r5, #0x62]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x64]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x66]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0231B834
	mov r0, r5
	bl AddHeldItemToBag
_0231B834:
	mov r0, r7
	bl ov29_022F9EA0
	b _0231CBA4
_0231B840:
	cmp sb, #0
	beq _0231B860
	mov r0, r7
	mov r1, r6
	bl ov29_022E5A00
	mov r0, r8
	mov r1, r7
	bl UpdateShopkeeperModeAfterAttack
_0231B860:
	ldrb r0, [r6]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0231B8E4
	mov r1, r6
	mov r0, #0
	bl ov29_02344B44
	ldr r2, _0231C6CC ; =0x00000BE7
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	cmp sb, #0
	beq _0231B8E4
	add r1, sp, #0x21
	ldr r0, _0231C6D0 ; =ov10_022C4574
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	mov r0, r8
	bl EnemyEvolution
	b _0231CBA4
_0231B8E4:
	cmp sb, #0
	bne _0231B8F8
	mov r0, r7
	mov r1, r6
	bl ov29_022E5AE4
_0231B8F8:
	mov r0, r8
	mov r1, r6
	bl ov29_0230F9A4
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #2
	bne _0231B92C
	mov r3, #0
	mov r0, r8
	mov r1, r7
	mov r2, #5
	str r3, [sp]
	bl TryIncreaseBelly
_0231B92C:
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #5
	beq _0231B94C
	ldrsh r0, [r6, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0xa
	bne _0231B9A8
_0231B94C:
	cmp sb, #0
	beq _0231B994
	add r1, sp, #0x20
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231B994:
	ldr r2, _0231C6DC ; =0x00000BE8
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231B9A8:
	ldrsh r0, [r6, #4]
	cmp r0, #0x19c
	bgt _0231BD6C
	bge _0231CA60
	cmp r0, #0x194
	bgt _0231BD00
	bge _0231CA60
	cmp r0, #0x190
	bgt _0231BCD0
	bge _0231CA60
	cmp r0, #0xb6
	bgt _0231BCC0
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _0231CABC
_0231B9E4: ; jump table
	b _0231CABC ; case 0
	b _0231BE50 ; case 1
	b _0231BE88 ; case 2
	b _0231BEC0 ; case 3
	b _0231BEF8 ; case 4
	b _0231BF30 ; case 5
	b _0231BF68 ; case 6
	b _0231BFDC ; case 7
	b _0231BFA0 ; case 8
	b _0231C018 ; case 9
	b _0231C050 ; case 10
	b _0231CABC ; case 11
	b _0231CABC ; case 12
	b _0231CABC ; case 13
	b _0231CABC ; case 14
	b _0231CABC ; case 15
	b _0231CABC ; case 16
	b _0231CABC ; case 17
	b _0231CABC ; case 18
	b _0231CABC ; case 19
	b _0231CABC ; case 20
	b _0231CABC ; case 21
	b _0231CABC ; case 22
	b _0231CABC ; case 23
	b _0231CABC ; case 24
	b _0231CABC ; case 25
	b _0231CABC ; case 26
	b _0231CABC ; case 27
	b _0231CABC ; case 28
	b _0231CABC ; case 29
	b _0231CABC ; case 30
	b _0231CABC ; case 31
	b _0231CABC ; case 32
	b _0231CABC ; case 33
	b _0231CABC ; case 34
	b _0231CABC ; case 35
	b _0231CABC ; case 36
	b _0231CABC ; case 37
	b _0231CABC ; case 38
	b _0231CABC ; case 39
	b _0231CABC ; case 40
	b _0231CABC ; case 41
	b _0231CABC ; case 42
	b _0231CABC ; case 43
	b _0231CABC ; case 44
	b _0231CABC ; case 45
	b _0231CABC ; case 46
	b _0231CABC ; case 47
	b _0231CABC ; case 48
	b _0231CABC ; case 49
	b _0231CABC ; case 50
	b _0231CABC ; case 51
	b _0231CABC ; case 52
	b _0231CABC ; case 53
	b _0231CABC ; case 54
	b _0231CABC ; case 55
	b _0231CABC ; case 56
	b _0231CABC ; case 57
	b _0231CABC ; case 58
	b _0231CABC ; case 59
	b _0231CABC ; case 60
	b _0231CABC ; case 61
	b _0231CABC ; case 62
	b _0231CABC ; case 63
	b _0231CABC ; case 64
	b _0231CABC ; case 65
	b _0231CABC ; case 66
	b _0231CABC ; case 67
	b _0231CABC ; case 68
	b _0231C08C ; case 69
	b _0231C0A4 ; case 70
	b _0231C0CC ; case 71
	b _0231C15C ; case 72
	b _0231CABC ; case 73
	b _0231C118 ; case 74
	b _0231C210 ; case 75
	b _0231C130 ; case 76
	b _0231C0F4 ; case 77
	b _0231C248 ; case 78
	b _0231C258 ; case 79
	b _0231C144 ; case 80
	b _0231C194 ; case 81
	b _0231C184 ; case 82
	b _0231C16C ; case 83
	b _0231C1BC ; case 84
	b _0231C234 ; case 85
	b _0231C1A4 ; case 86
	b _0231C278 ; case 87
	b _0231C268 ; case 88
	b _0231C1F4 ; case 89
	b _0231C1E4 ; case 90
	b _0231C224 ; case 91
	b _0231C304 ; case 92
	b _0231C31C ; case 93
	b _0231C338 ; case 94
	b _0231C348 ; case 95
	b _0231C360 ; case 96
	b _0231C370 ; case 97
	b _0231CABC ; case 98
	b _0231C28C ; case 99
	b _0231C2A4 ; case 100
	b _0231C2BC ; case 101
	b _0231C2D4 ; case 102
	b _0231C380 ; case 103
	b _0231C6B0 ; case 104
	b _0231CABC ; case 105
	b _0231C768 ; case 106
	b _0231C7A0 ; case 107
	b _0231C2EC ; case 108
	b _0231C394 ; case 109
	b _0231C3B4 ; case 110
	b _0231C3F4 ; case 111
	b _0231C3D4 ; case 112
	b _0231C5FC ; case 113
	b _0231C61C ; case 114
	b _0231C63C ; case 115
	b _0231C7B0 ; case 116
	b _0231C7C0 ; case 117
	b _0231C7FC ; case 118
	b _0231C404 ; case 119
	b _0231C420 ; case 120
	b _0231C43C ; case 121
	b _0231C458 ; case 122
	b _0231C474 ; case 123
	b _0231C490 ; case 124
	b _0231C4AC ; case 125
	b _0231C4C8 ; case 126
	b _0231C4E4 ; case 127
	b _0231C500 ; case 128
	b _0231C51C ; case 129
	b _0231C538 ; case 130
	b _0231C554 ; case 131
	b _0231C570 ; case 132
	b _0231C58C ; case 133
	b _0231C5A8 ; case 134
	b _0231C5C4 ; case 135
	b _0231C5E0 ; case 136
	b _0231C80C ; case 137
	b _0231CABC ; case 138
	b _0231CABC ; case 139
	b _0231CABC ; case 140
	b _0231CABC ; case 141
	b _0231CABC ; case 142
	b _0231CABC ; case 143
	b _0231CABC ; case 144
	b _0231CABC ; case 145
	b _0231CABC ; case 146
	b _0231CABC ; case 147
	b _0231CABC ; case 148
	b _0231CABC ; case 149
	b _0231CABC ; case 150
	b _0231CABC ; case 151
	b _0231CABC ; case 152
	b _0231CABC ; case 153
	b _0231CABC ; case 154
	b _0231CABC ; case 155
	b _0231CABC ; case 156
	b _0231CABC ; case 157
	b _0231CABC ; case 158
	b _0231CABC ; case 159
	b _0231CABC ; case 160
	b _0231CABC ; case 161
	b _0231CABC ; case 162
	b _0231CABC ; case 163
	b _0231CABC ; case 164
	b _0231CABC ; case 165
	b _0231CABC ; case 166
	b _0231C81C ; case 167
	b _0231C82C ; case 168
	b _0231C844 ; case 169
	b _0231C8B0 ; case 170
	b _0231C91C ; case 171
	b _0231C988 ; case 172
	b _0231CABC ; case 173
	b _0231CABC ; case 174
	b _0231CABC ; case 175
	b _0231CABC ; case 176
	b _0231CABC ; case 177
	b _0231CABC ; case 178
	b _0231CA50 ; case 179
	b _0231C9F4 ; case 180
	b _0231CABC ; case 181
	b _0231C65C ; case 182
_0231BCC0:
	ldr r1, _0231C6E0 ; =0x0000016B
	cmp r0, r1
	beq _0231CB14
	b _0231CABC
_0231BCD0:
	ldr r1, _0231C6E4 ; =0x00000192
	cmp r0, r1
	bgt _0231BCF0
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BCF0:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BD00:
	cmp r0, #0x198
	bgt _0231BD3C
	bge _0231CA60
	ldr r1, _0231C6E8 ; =0x00000196
	cmp r0, r1
	bgt _0231BD2C
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BD2C:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BD3C:
	ldr r1, _0231C6EC ; =0x0000019A
	cmp r0, r1
	bgt _0231BD5C
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BD5C:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BD6C:
	cmp r0, #0x1a4
	bgt _0231BDE4
	bge _0231CA60
	cmp r0, #0x1a0
	bgt _0231BDB4
	bge _0231CA60
	ldr r1, _0231C6F0 ; =0x0000019E
	cmp r0, r1
	bgt _0231BDA4
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BDA4:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BDB4:
	ldr r1, _0231C6F4 ; =0x000001A2
	cmp r0, r1
	bgt _0231BDD4
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BDD4:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BDE4:
	cmp r0, #0x1a8
	bgt _0231BE20
	bge _0231CA60
	ldr r1, _0231C6F8 ; =0x000001A6
	cmp r0, r1
	bgt _0231BE10
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BE10:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BE20:
	ldr r1, _0231C6FC ; =0x000001AA
	cmp r0, r1
	bgt _0231BE40
	bge _0231CA60
	sub r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BE40:
	add r1, r1, #1
	cmp r0, r1
	beq _0231CA60
	b _0231CABC
_0231BE50:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x52
	bl InitMove
	ldr r0, _0231C704 ; =STICK_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #1
	add r2, sp, #0x52
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BE88:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x4a
	bl InitMove
	ldr r0, _0231C708 ; =IRON_THORN_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #2
	add r2, sp, #0x4a
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BEC0:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x42
	bl InitMove
	ldr r0, _0231C70C ; =SILVER_SPIKE_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #3
	add r2, sp, #0x42
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BEF8:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x3a
	bl InitMove
	ldr r0, _0231C710 ; =GOLD_FANG_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #4
	add r2, sp, #0x3a
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BF30:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x32
	bl InitMove
	ldr r0, _0231C714 ; =CACNEA_SPIKE_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #5
	add r2, sp, #0x32
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BF68:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x2a
	bl InitMove
	ldr r0, _0231C718 ; =CORSOLA_TWIG_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #6
	add r2, sp, #0x2a
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231BFA0:
	mov r4, #0
	str r4, [sp]
	ldr r0, _0231C71C ; =GEO_PEBBLE_DAMAGE
	ldr r1, _0231C720 ; =0x0000024F
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231BFDC:
	mov r4, #0
	str r4, [sp]
	ldr r0, _0231C724 ; =GRAVELEROCK_DAMAGE
	ldr r1, _0231C720 ; =0x0000024F
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C018:
	ldr r1, _0231C700 ; =0x00000195
	add r0, sp, #0x22
	bl InitMove
	ldr r0, _0231C728 ; =GOLD_THORN_POWER
	mov r4, #0x100
	ldrsh r3, [r0]
	str r4, [sp]
	mov r4, #9
	add r2, sp, #0x22
	mov r0, r8
	mov r1, r7
	str r4, [sp, #4]
	bl DealDamageProjectile
	b _0231CB14
_0231C050:
	mov r4, #0
	str r4, [sp]
	ldr r0, _0231C72C ; =RARE_FOSSIL_DAMAGE
	ldr r1, _0231C720 ; =0x0000024F
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C08C:
	mov r0, r8
	mov r1, r7
	mov r3, sl
	mov r2, #1
	bl EndNegativeStatusConditionWrapper
	b _0231CB14
_0231C0A4:
	ldr r1, _0231C730 ; =ORAN_BERRY_HP_RESTORATION
	ldr r0, _0231C734 ; =ORAN_BERRY_FULL_HP_BOOST
	ldrsh r2, [r1]
	ldrsh r3, [r0]
	mov r4, #1
	mov r0, r8
	mov r1, r7
	str r4, [sp]
	bl TryIncreaseHp
	b _0231CB14
_0231C0CC:
	ldr r1, _0231C738 ; =SITRUS_BERRY_HP_RESTORATION
	ldr r0, _0231C73C ; =SITRUS_BERRY_FULL_HP_BOOST
	ldrsh r2, [r1]
	ldrsh r3, [r0]
	mov r4, #1
	mov r0, r8
	mov r1, r7
	str r4, [sp]
	bl TryIncreaseHp
	b _0231CB14
_0231C0F4:
	ldr r0, _0231C740 ; =LIFE_SEED_HP_BOOST
	mov r4, #1
	ldrsh r3, [r0]
	mov r0, r8
	mov r1, r7
	mov r2, #0
	str r4, [sp]
	bl TryIncreaseHp
	b _0231CB14
_0231C118:
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictBlinkerStatus
	b _0231CB14
_0231C130:
	mov r0, r8
	mov r1, r7
	mov r2, #0
	bl TryInflictCrossEyedStatus
	b _0231CB14
_0231C144:
	mov r0, r8
	mov r1, r7
	mov r2, #0
	mov r3, #1
	bl BoostSpeedOneStage
	b _0231CB14
_0231C15C:
	mov r0, r8
	mov r1, r7
	bl TryInflictEyedropStatus
	b _0231CB14
_0231C16C:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	mov r3, #0
	bl TryInflictConfusedStatus
	b _0231CB14
_0231C184:
	mov r0, r8
	mov r1, r7
	bl ApplyCheriBerryEffect
	b _0231CB14
_0231C194:
	mov r0, r8
	mov r1, r7
	bl ApplyPechaBerryEffect
	b _0231CB14
_0231C1A4:
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryWarp
	b _0231CB14
_0231C1BC:
	ldr r1, _0231C744 ; =SLEEP_TURN_RANGE
	mov r0, r7
	mov r2, #1
	bl CalcStatusDuration
	mov r2, r0
	mov r0, r8
	mov r1, r7
	mov r3, #1
	bl TryInflictSleepStatus
	b _0231CB14
_0231C1E4:
	mov r0, r8
	mov r1, r7
	bl TryInflictSleeplessStatus
	b _0231CB14
_0231C1F4:
	mov r2, #1
	mov r0, r8
	mov r1, r7
	mov r3, r2
	str r2, [sp]
	bl LevelUpItemEffect
	b _0231CB14
_0231C210:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	bl TryDecreaseLevel
	b _0231CB14
_0231C224:
	mov r0, r8
	mov r1, r7
	bl TryInflictPetrifiedStatus
	b _0231CB14
_0231C234:
	ldr r2, _0231C748 ; =0x00000BE9
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C248:
	mov r0, r8
	mov r1, r7
	bl ApplyRawstBerryEffect
	b _0231CB14
_0231C258:
	mov r0, r8
	mov r1, r7
	bl ApplyHungerSeedEffect
	b _0231CB14
_0231C268:
	mov r0, r8
	mov r1, r7
	bl ApplyGinsengEffect
	b _0231CB14
_0231C278:
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl ApplyBlastSeedEffect
	b _0231CB14
_0231C28C:
	ldr r2, _0231C74C ; =0x000003E7
	mov r0, r8
	mov r1, r7
	mov r3, #0
	bl RestoreAllMovePP
	b _0231CB14
_0231C2A4:
	ldr r1, _0231C750 ; =PROTEIN_STAT_BOOST
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl ApplyProteinEffect
	b _0231CB14
_0231C2BC:
	ldr r1, _0231C754 ; =CALCIUM_STAT_BOOST
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl ApplyCalciumEffect
	b _0231CB14
_0231C2D4:
	ldr r1, _0231C758 ; =IRON_STAT_BOOST
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl ApplyIronEffect
	b _0231CB14
_0231C2EC:
	ldr r1, _0231C75C ; =ZINC_STAT_BOOST
	mov r0, r8
	ldrsh r2, [r1]
	mov r1, r7
	bl ApplyZincEffect
	b _0231CB14
_0231C304:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
	b _0231CB14
_0231C31C:
	mov r3, #1
	mov r0, r8
	mov r1, r7
	mov r2, #5
	str r3, [sp]
	bl LevelUpItemEffect
	b _0231CB14
_0231C338:
	mov r0, r8
	mov r1, r7
	bl ApplyVileSeedEffect
	b _0231CB14
_0231C348:
	mov r0, r8
	mov r1, r7
	mov r2, #4
	mov r3, #0
	bl TryWarp
	b _0231CB14
_0231C360:
	mov r0, r8
	mov r1, r7
	bl ApplyViolentSeedEffect
	b _0231CB14
_0231C370:
	mov r0, r8
	mov r1, r7
	bl TryInflictInvisibleStatus
	b _0231CB14
_0231C380:
	mov r0, r7
	mov r1, #0xa
	mov r2, #0
	bl BoostIQ
	b _0231CB14
_0231C394:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	mov r2, #0x32
	mov r3, #5
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C3B4:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	mov r2, #0x64
	mov r3, #0xa
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C3D4:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	rsb r2, r4, #0x3e8
	mov r3, #0xa
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C3F4:
	mov r0, r8
	mov r1, r7
	bl ApplyGrimyFoodEffect
	b _0231CB14
_0231C404:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #1
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C420:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #2
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C43C:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #3
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C458:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #4
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C474:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #5
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C490:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #6
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C4AC:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #7
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C4C8:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #8
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C4E4:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #9
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C500:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xa
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C51C:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xb
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C538:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xc
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C554:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xd
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C570:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xe
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C58C:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xf
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C5A8:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0x10
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C5C4:
	ldr r1, _0231C760 ; =GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0x11
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C5E0:
	ldr r1, _0231C764 ; =WONDER_GUMMI_STAT_BOOST
	mov r0, r8
	ldrsh r3, [r1]
	mov r1, r7
	mov r2, #0xff
	bl ApplyGummiBoostsDungeonMode
	b _0231CB14
_0231C5FC:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	mov r2, #0x32
	mov r3, #5
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C61C:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	mov r2, #0xa
	mov r3, #0
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C63C:
	mov r4, #1
	mov r0, r8
	mov r1, r7
	rsb r2, r4, #0x3e8
	mov r3, #0x32
	str r4, [sp]
	bl TryIncreaseBelly
	b _0231CB14
_0231C65C:
	cmp sb, #0
	beq _0231C6A4
	add r1, sp, #0x1f
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C6A4:
	mov r0, r8
	bl ApplyKeyEffect
	b _0231CB14
_0231C6B0:
	mov r0, r8
	mov r1, r7
	bl TryInflictDropeyeStatus
	b _0231CB14
	.align 2, 0
#ifdef JAPAN
#define APPLY_ITEM_EFFECT_OFFSET -0x2C1
#else
#define APPLY_ITEM_EFFECT_OFFSET 0
#endif
_0231C6C0: .word 0x000001AB
_0231C6C4: .word 0x00001317
_0231C6C8: .word 0x00000BE6 + APPLY_ITEM_EFFECT_OFFSET
_0231C6CC: .word 0x00000BE7 + APPLY_ITEM_EFFECT_OFFSET
_0231C6D0: .word ov10_022C4574
_0231C6D4: .word 0x00000256
_0231C6D8: .word ov10_022C4558
_0231C6DC: .word 0x00000BE8 + APPLY_ITEM_EFFECT_OFFSET
_0231C6E0: .word 0x0000016B
_0231C6E4: .word 0x00000192
_0231C6E8: .word 0x00000196
_0231C6EC: .word 0x0000019A
_0231C6F0: .word 0x0000019E
_0231C6F4: .word 0x000001A2
_0231C6F8: .word 0x000001A6
_0231C6FC: .word 0x000001AA
_0231C700: .word 0x00000195
_0231C704: .word STICK_POWER
_0231C708: .word IRON_THORN_POWER
_0231C70C: .word SILVER_SPIKE_POWER
_0231C710: .word GOLD_FANG_POWER
_0231C714: .word CACNEA_SPIKE_POWER
_0231C718: .word CORSOLA_TWIG_POWER
_0231C71C: .word GEO_PEBBLE_DAMAGE
_0231C720: .word 0x0000024F
_0231C724: .word GRAVELEROCK_DAMAGE
_0231C728: .word GOLD_THORN_POWER
_0231C72C: .word RARE_FOSSIL_DAMAGE
_0231C730: .word ORAN_BERRY_HP_RESTORATION
_0231C734: .word ORAN_BERRY_FULL_HP_BOOST
_0231C738: .word SITRUS_BERRY_HP_RESTORATION
_0231C73C: .word SITRUS_BERRY_FULL_HP_BOOST
_0231C740: .word LIFE_SEED_HP_BOOST
_0231C744: .word SLEEP_TURN_RANGE
_0231C748: .word 0x00000BE9 + APPLY_ITEM_EFFECT_OFFSET
_0231C74C: .word 0x000003E7
_0231C750: .word PROTEIN_STAT_BOOST
_0231C754: .word CALCIUM_STAT_BOOST
_0231C758: .word IRON_STAT_BOOST
_0231C75C: .word ZINC_STAT_BOOST
_0231C760: .word GUMMI_STAT_BOOST
_0231C764: .word WONDER_GUMMI_STAT_BOOST
_0231C768:
	mov r0, r8
	mov r1, r7
	bl TryInflictSlipStatus
	cmp r0, #0
	bne _0231CB14
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CBAC ; =0x00000C75
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C7A0:
	mov r0, r8
	mov r1, r7
	bl ApplyViaSeedEffect
	b _0231CB14
_0231C7B0:
	mov r0, r8
	mov r1, r7
	bl ApplyMixElixirEffect
	b _0231CB14
_0231C7C0:
	mov r4, #0
	str r4, [sp]
	ldr r0, _0231CBB0 ; =OREN_BERRY_DAMAGE
	str r4, [sp, #4]
	mov r1, #0x270
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrsh r2, [r0]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C7FC:
	mov r0, r8
	mov r1, r7
	bl ApplyDoughSeedEffect
	b _0231CB14
_0231C80C:
	mov r0, r8
	mov r1, r7
	bl ApplyGravelyrockEffect
	b _0231CB14
_0231C81C:
	mov r0, r8
	mov r1, r7
	bl ApplyGonePebbleEffect
	b _0231CB14
_0231C82C:
	mov r2, #0
	mov r0, r8
	mov r1, r7
	mov r3, r2
	bl TryInflictBlinkerStatus
	b _0231CB14
_0231C844:
	cmp sb, #0
	beq _0231C88C
	add r1, sp, #0x1e
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C88C:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CBB4 ; =0x00000C67
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C8B0:
	cmp sb, #0
	beq _0231C8F8
	add r1, sp, #0x1d
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C8F8:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CBB4 ; =0x00000C67
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C91C:
	cmp sb, #0
	beq _0231C964
	add r1, sp, #0x1c
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C964:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CBB4 ; =0x00000C67
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C988:
	cmp sb, #0
	beq _0231C9D0
	add r1, sp, #0x1b
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231C9D0:
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r2, _0231CBB4 ; =0x00000C67
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231C9F4:
	cmp sb, #0
	beq _0231CA3C
	add r1, sp, #0x1a
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231CA3C:
	ldr r2, _0231CBB8 ; =0x00000C76
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231CA50:
	mov r0, r8
	mov r1, r7
	bl ApplyGracideaEffect
	b _0231CB14
_0231CA60:
	cmp sb, #0
	beq _0231CAA8
	add r1, sp, #0x19
	ldr r0, _0231CBBC ; =ov10_022C44EC
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231CAA8:
	ldr r2, _0231C6DC ; =0x00000BE8
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
	b _0231CB14
_0231CABC:
	cmp sb, #0
	beq _0231CB04
	add r1, sp, #0x18
	ldr r0, _0231C6D8 ; =ov10_022C4558
	str r1, [sp]
	mov r4, #0
	ldrsh r2, [r0]
	ldr r1, _0231C6D4 ; =0x00000256
	str r4, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, r8
	mov r1, r7
	mov r3, #1
	str r4, [sp, #0x14]
	bl CalcDamageFixedNoCategory
	b _0231CB14
_0231CB04:
	ldr r2, _0231C6DC ; =0x00000BE8
	mov r0, r8
	mov r1, r7
	bl LogMessageByIdWithPopupCheckUserTarget
_0231CB14:
	mov r0, r7
	bl EntityIsValid__0231CBC8
	cmp r0, #0
	beq _0231CB9C
	ldr r1, [r7, #0xb4]
	ldrsh r4, [r6, #4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _0231CB48
#ifdef JAPAN
	add r0, r1, #0x224
#else
	add r0, r1, #0x228
#endif
	mov r1, #0x5d
	bl ExclusiveItemEffectFlagTest
_0231CB48:
	cmp r0, #0
	beq _0231CB9C
	ldr r0, _0231CBC0 ; =APPLES_AND_BERRIES_ITEM_IDS
	b _0231CB90
_0231CB58:
	cmp r4, r1
	bne _0231CB8C
	mov r0, #0xa
	bl ov29_0234BA54
	ldr r0, _0231CBC4 ; =ov10_022C4864
	mov r4, #1
	ldr r2, [r0]
	mov r0, r8
	mov r1, r7
	mov r3, #0
	str r4, [sp]
	bl TryIncreaseHp
	b _0231CB9C
_0231CB8C:
	add r0, r0, #2
_0231CB90:
	ldrsh r1, [r0]
	cmp r1, #0
	bne _0231CB58
_0231CB9C:
#ifdef EUROPE
	mov r0, #1
	bl ov29_022FB920
#endif
	mov r0, r8
	bl EnemyEvolution
_0231CBA4:
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0231CBAC: .word 0x00000C75 + APPLY_ITEM_EFFECT_OFFSET
_0231CBB0: .word OREN_BERRY_DAMAGE
_0231CBB4: .word 0x00000C67 + APPLY_ITEM_EFFECT_OFFSET
_0231CBB8: .word 0x00000C76 + APPLY_ITEM_EFFECT_OFFSET
_0231CBBC: .word ov10_022C44EC
_0231CBC0: .word APPLES_AND_BERRIES_ITEM_IDS
_0231CBC4: .word ov10_022C4864
	arm_func_end ApplyItemEffect
