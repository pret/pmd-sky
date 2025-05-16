	.include "asm/macros.inc"
	.include "overlay_29_0230F02C.inc"

	.text

	arm_func_start ov29_0230F140
ov29_0230F140: ; 0x0230F140
	ldr ip, _0230F148 ; =ov29_022F52BC
	bx ip
	.align 2, 0
_0230F148: .word ov29_022F52BC
	arm_func_end ov29_0230F140

	arm_func_start ov29_0230F14C
ov29_0230F14C: ; 0x0230F14C
	ldr ip, _0230F154 ; =UseThrowableItem
	bx ip
	.align 2, 0
_0230F154: .word UseThrowableItem
	arm_func_end ov29_0230F14C

	arm_func_start ov29_0230F158
ov29_0230F158: ; 0x0230F158
	ldr ip, _0230F160 ; =TryNonLeaderItemPickUp
	bx ip
	.align 2, 0
_0230F160: .word TryNonLeaderItemPickUp
	arm_func_end ov29_0230F158

	arm_func_start TryNonLeaderItemPickUp
TryNonLeaderItemPickUp: ; 0x0230F164
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x198
	mov r8, r0
	ldr r6, [r8, #0xb4]
	bl GetTileAtEntity
	mov r5, r0
	ldr r4, [r5, #0x10]
	cmp r4, #0
	beq _0230F624
	bl IsFloorOver
	cmp r0, #0
	bne _0230F624
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _0230F624
	ldrb r0, [r6, #9]
	cmp r0, #1
	beq _0230F624
	mov r0, r6
	bl IsExperienceLocked
	cmp r0, #0
	bne _0230F624
	ldrb r0, [r6, #0xbc]
	cmp r0, #7
	beq _0230F624
	ldr r6, [r8, #0xb4]
	mov r0, r4
	mov r7, #1
	bl GetItemInfo
	ldrb r1, [r6, #6]
	mov r4, r0
	cmp r1, #0
	beq _0230F204
	bl ov29_02348D00
	cmp r0, #0
	bne _0230F624
_0230F204:
	ldrb r0, [r4]
	tst r0, #2
	bne _0230F228
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230F22C
	ldrh r0, [r5]
	tst r0, #0x20
	beq _0230F22C
_0230F228:
	mov r7, #0
_0230F22C:
	cmp r7, #0
	beq _0230F624
	mov r0, r8
	mov r1, #1
	bl ShouldMonsterRunAwayVariation
	cmp r0, #0
	beq _0230F274
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	mov r0, #0
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0230F62C ; =0x00000C5E
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F274:
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230F300
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #6
	bne _0230F300
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _0230F2A8
	ldr r0, _0230F630 ; =0x00001305
	bl ov29_022EACCC
	b _0230F2B0
_0230F2A8:
	ldr r0, _0230F634 ; =0x00001308
	bl ov29_022EACCC
_0230F2B0:
	mov r0, r8
	mov r1, #0x1b
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r4]
	orrne r0, r0, #0x20
	strneb r0, [r4]
	mov r0, r4
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	add r0, r8, #4
	mov r1, #1
	bl RemoveGroundItem
	ldr r1, _0230F638 ; =0x00000C5F
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F300:
	ldr r0, _0230F63C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb sb, [r0, #0x75b]
	cmp sb, #0
	beq _0230F36C
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230F36C
	ldr r0, _0230F640 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r0, [r0]
	add r2, sp, #0
	ldr r7, [r0, #0x384]
	add r1, sp, #0xcc
	mov r0, #6
_0230F33C:
	mla r3, r5, r0, r7
	str r3, [r2, r5, lsl #2]
	str r5, [r1, r5, lsl #2]
	add r5, r5, #1
	cmp r5, #0x32
	blt _0230F33C
	add r1, r6, #0x62
	mvn r0, #0
	str r1, [sp, #0xc8]
	str r0, [sp, #0x194]
	mov r5, #0x33
	b _0230F380
_0230F36C:
	add r1, r6, #0x62
	mvn r0, #0
	str r1, [sp]
	str r0, [sp, #0xcc]
	mov r5, #1
_0230F380:
	ldrsh lr, [r4, #4]
	cmp lr, #0xb
	bge _0230F4B0
	ldrb r0, [r4]
	tst r0, #2
	bne _0230F4B0
	mvn r7, #0
	mov ip, r7
	mov sl, #0
	and r0, r0, #8
	add fp, sp, #0
	b _0230F408
_0230F3B0:
	ldr r1, [fp, sl, lsl #2]
	ldrb r1, [r1]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0230F404
	ldr r3, [fp, sl, lsl #2]
	ldrb r2, [r3]
	tst r2, #2
	ldreqsh r1, [r3, #4]
	cmpeq lr, r1
	andeq r1, r2, #8
	cmpeq r0, r1
	bne _0230F404
	ldrh r1, [r3, #2]
	cmp r1, #0x63
	beq _0230F404
	cmp ip, r1
	movlt ip, r1
	movlt r7, sl
_0230F404:
	add sl, sl, #1
_0230F408:
	cmp sl, r5
	blt _0230F3B0
	mvn r0, #0
	cmp r7, r0
	beq _0230F4B0
	add r1, sp, #0
	ldr r2, [r1, r7, lsl #2]
	ldrh r0, [r4, #2]
	ldrh r1, [r2, #2]
	add r0, r1, r0
	cmp r0, #0x63
	movge r0, #0x63
	strh r0, [r2, #2]
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r2]
	orrne r0, r0, #8
	strneb r0, [r2]
	bl ov29_02347040
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	add r0, r8, #4
	mov r1, #1
	bl RemoveGroundItem
	ldr r0, _0230F644 ; =0x00001304
	bl ov29_022EACCC
	add r0, sp, #0xcc
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	bge _0230F4A0
#ifdef JAPAN
	ldr r1, _02310B84 ; =0x0000099F
	mov r0, r8
#else
	mov r0, r8
	mov r1, #0xc60
#endif
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F4A0:
#ifdef JAPAN
	mov r0, r8
	mov r1, #0x9a0
#else
	ldr r1, _0230F648 ; =0x00000C61
	mov r0, r8
#endif
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F4B0:
	cmp sb, #0
	beq _0230F4CC
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230F4CC
	bl GetCurrentBagCapacity
	mov r5, r0
_0230F4CC:
	mov r7, #0
	add r3, sp, #0
	mov r0, r7
	mov r1, #1
	b _0230F500
_0230F4E0:
	ldr r2, [r3, r7, lsl #2]
	ldrb r2, [r2]
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	beq _0230F508
	add r7, r7, #1
_0230F500:
	cmp r7, r5
	blt _0230F4E0
_0230F508:
	mov r0, r8
	mov r1, r4
	mov r2, #1
	bl ov29_02348DD8
	cmp r0, #0
	bne _0230F624
	cmp r7, r5
	bne _0230F544
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _0230F64C ; =0x00000C62
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F544:
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _0230F55C
	ldr r0, _0230F630 ; =0x00001305
	bl ov29_022EACCC
	b _0230F564
_0230F55C:
	ldr r0, _0230F644 ; =0x00001304
	bl ov29_022EACCC
_0230F564:
	add r0, sp, #0xcc
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	bge _0230F5BC
	ldrh r1, [r4]
	mov r0, r8
	strh r1, [r6, #0x62]
	ldrh r1, [r4, #2]
	strh r1, [r6, #0x64]
	ldrh r1, [r4, #4]
	strh r1, [r6, #0x66]
	bl ov29_022F9EA0
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	add r0, r8, #4
	mov r1, #1
	bl RemoveGroundItem
#ifdef JAPAN
	ldr r1, _02310B84 ; =0x0000099F
	mov r0, r8
#else
	mov r0, r8
	mov r1, #0xc60
#endif
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F5BC:
	mov r0, r4
	bl ov29_02348D3C
	mov r5, r0
	mov r0, r4
	bl ov29_02345004
	cmp r0, #0
	mov r0, #0
	beq _0230F5F8
	mov r1, r8
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0230F650 ; =0x00000C63
	mov r0, r8
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F5F8:
	mov r1, r4
	bl ov29_02344B44
	add r0, r8, #4
	mov r1, #1
	bl RemoveGroundItem
#ifdef JAPAN
	mov r0, r8
	mov r1, #0x9a0
#else
	ldr r1, _0230F648 ; =0x00000C61
	mov r0, r8
#endif
	bl LogMessageByIdWithPopup
	mov r0, r4
	mov r1, r5
	bl ov29_02348ECC
_0230F624:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define TRY_NON_LEADER_ITEM_PICK_UP_OFFSET -0x2C1
#else
#define TRY_NON_LEADER_ITEM_PICK_UP_OFFSET 0
#endif
_0230F62C: .word 0x00000C5E + TRY_NON_LEADER_ITEM_PICK_UP_OFFSET
_0230F630: .word 0x00001305
_0230F634: .word 0x00001308
_0230F638: .word 0x00000C5F + TRY_NON_LEADER_ITEM_PICK_UP_OFFSET
_0230F63C: .word DUNGEON_PTR
_0230F640: .word BAG_ITEMS_PTR_MIRROR
_0230F644: .word 0x00001304
#ifdef JAPAN
_02310B84: .word 0x0000099F
#else
_0230F648: .word 0x00000C61
#endif
_0230F64C: .word 0x00000C62 + TRY_NON_LEADER_ITEM_PICK_UP_OFFSET
_0230F650: .word 0x00000C63 + TRY_NON_LEADER_ITEM_PICK_UP_OFFSET
	arm_func_end TryNonLeaderItemPickUp

	arm_func_start GetExclusiveItemWithEffectFromBag
GetExclusiveItemWithEffectFromBag: ; 0x0230F654
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl EntityIsValid__0230F008
	cmp r0, #0
	moveq r0, #0
	beq _0230F6C0
	ldr r3, [r6, #0xb4]
	add r0, sp, #4
	ldrb r2, [r3, #0x5f]
	mov r1, r5
	str r2, [sp]
	ldrsh r2, [r3, #4]
	ldrb r3, [r3, #0x5e]
	bl GetExclusiveItemForMonsterFromBag
	cmp r0, #0
	moveq r0, #0
	beq _0230F6C0
	ldrh r1, [sp, #4]
	mov r0, #1
	strh r1, [r4]
	ldrh r1, [sp, #6]
	strh r1, [r4, #2]
	ldrh r1, [sp, #8]
	strh r1, [r4, #4]
_0230F6C0:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end GetExclusiveItemWithEffectFromBag

	arm_func_start AuraBowIsActive
AuraBowIsActive: ; 0x0230F6C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xb4]
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230F710
	ldrsh r0, [r4, #0x66]
	bl IsAuraBow
	cmp r0, #0
	bne _0230F718
_0230F710:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0230F718:
	ldrsh r1, [r4, #0x66]
	mov r0, r5
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AuraBowIsActive

	arm_func_start ov29_0230F728
ov29_0230F728: ; 0x0230F728
#ifdef JAPAN
#define OV29_0230F728_OFFSET -4
#else
#define OV29_0230F728_OFFSET 0
#endif
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr ip, [r1, #0xb4]
	ldr r4, [r0, #0xb4]
	ldrb r0, [ip, #0x5f]
	mov r5, r3
	mov r1, r2
	str r0, [sp]
	ldrsh r2, [ip, #4]
	ldrb r3, [ip, #0x5e]
	add r0, sp, #4
	bl GetExclusiveItemForMonsterFromBag
	ldr r1, [r4, #0x18c + OV29_0230F728_OFFSET]
	add r0, r4, #0x100
	orr r1, r1, r5
	str r1, [r4, #0x18c + OV29_0230F728_OFFSET]
	ldrsh r1, [sp, #8]
	strh r1, [r0, #0x90 + OV29_0230F728_OFFSET]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_0230F728

	arm_func_start ExclusiveItemOffenseBoost
ExclusiveItemOffenseBoost: ; 0x0230F778
	ldr r0, [r0, #0xb4]
	add r0, r0, r1
#ifdef JAPAN
	ldrb r0, [r0, #0x220]
#else
	ldrb r0, [r0, #0x224]
#endif
	bx lr
	arm_func_end ExclusiveItemOffenseBoost

	arm_func_start ExclusiveItemDefenseBoost
ExclusiveItemDefenseBoost: ; 0x0230F788
	ldr r0, [r0, #0xb4]
	add r0, r0, r1
#ifdef JAPAN
	ldrb r0, [r0, #0x222]
#else
	ldrb r0, [r0, #0x226]
#endif
	bx lr
	arm_func_end ExclusiveItemDefenseBoost

	arm_func_start TeamMemberHasItemActive
TeamMemberHasItemActive: ; 0x0230F798
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	ldr r4, _0230F80C ; =DUNGEON_PTR
	mov sb, r0
	mov r8, r1
	mov r5, r6
_0230F7B0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl EntityIsValid__0230F008
	cmp r0, #0
	beq _0230F7F0
	mov r0, r7
	mov r1, r8
	bl ItemIsActive__0230F810
	cmp r0, #0
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	strne r7, [sb, r6, lsl #2]
	movne r6, r0, asr #0x10
_0230F7F0:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _0230F7B0
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230F80C: .word DUNGEON_PTR
	arm_func_end TeamMemberHasItemActive
