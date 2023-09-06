	.include "asm/macros.inc"
	.include "overlay_29_0230F02C.inc"

	.text

	arm_func_start ov29_0230F02C
ov29_0230F02C: ; 0x0230F02C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _0230F138 ; =0x023536FC
	mov r6, #0
	mov sl, r0
	mov fp, r1
	mov sb, r2
	mov r8, r3
	str r6, [r4]
_0230F04C:
	ldr r0, _0230F13C ; =0x02353538
	ldr r0, [r0]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	mov r0, r7
	bl EntityIsValid__0230F008
	cmp r0, #0
	cmpne sl, r7
	beq _0230F128
	mov r0, sl
	mov r1, r7
	bl CanSeeTarget
	cmp r0, #0
	beq _0230F128
	mov r0, sl
	mov r1, r7
	mov r2, #0
	mov r3, #1
	bl ov29_0230175C
	cmp r0, #1
	bne _0230F128
	ldrsh r1, [r7, #6]
	ldrsh r0, [sl, #6]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [r7, #4]
	ldrsh r1, [sl, #4]
	mov r5, r0
	sub r0, r2, r1
	bl abs
	cmp r0, r5
	movle r0, r5
	cmp r0, #0xa
	bgt _0230F128
	cmp r8, #0
	bne _0230F0FC
	mov r0, r7
	mov r1, fp
	mov r2, #1
	bl ov29_0231E05C
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230F128
_0230F0FC:
	ldr r0, [r4]
	ldrsh r1, [r7, #4]
	mov r0, r0, lsl #2
	strh r1, [sb, r0]
	ldr r0, [r4]
	ldrsh r1, [r7, #6]
	add r0, sb, r0, lsl #2
	strh r1, [r0, #2]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0230F128:
	add r6, r6, #1
	cmp r6, #0x14
	blt _0230F04C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230F138: .word 0x023536FC
_0230F13C: .word 0x02353538
	arm_func_end ov29_0230F02C

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
	ldr r0, _0230F63C ; =0x02353538
	ldr r0, [r0]
	ldrb sb, [r0, #0x75b]
	cmp sb, #0
	beq _0230F36C
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0230F36C
	ldr r0, _0230F640 ; =0x020AF6B8
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
	mov r0, r8
	mov r1, #0xc60
	bl LogMessageByIdWithPopup
	b _0230F624
_0230F4A0:
	ldr r1, _0230F648 ; =0x00000C61
	mov r0, r8
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
	mov r0, r8
	mov r1, #0xc60
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
	ldr r1, _0230F648 ; =0x00000C61
	mov r0, r8
	bl LogMessageByIdWithPopup
	mov r0, r4
	mov r1, r5
	bl ov29_02348ECC
_0230F624:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230F62C: .word 0x00000C5E
_0230F630: .word 0x00001305
_0230F634: .word 0x00001308
_0230F638: .word 0x00000C5F
_0230F63C: .word 0x02353538
_0230F640: .word 0x020AF6B8
_0230F644: .word 0x00001304
_0230F648: .word 0x00000C61
_0230F64C: .word 0x00000C62
_0230F650: .word 0x00000C63
	arm_func_end TryNonLeaderItemPickUp

	arm_func_start ov29_0230F654
ov29_0230F654: ; 0x0230F654
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
	bl sub_0201116C
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
	arm_func_end ov29_0230F654

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
	bl sub_0201116C
	ldr r1, [r4, #0x18c]
	add r0, r4, #0x100
	orr r1, r1, r5
	str r1, [r4, #0x18c]
	ldrsh r1, [sp, #8]
	strh r1, [r0, #0x90]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_0230F728

	arm_func_start ExclusiveItemOffenseBoost
ExclusiveItemOffenseBoost: ; 0x0230F778
	ldr r0, [r0, #0xb4]
	add r0, r0, r1
	ldrb r0, [r0, #0x224]
	bx lr
	arm_func_end ExclusiveItemOffenseBoost

	arm_func_start ExclusiveItemDefenseBoost
ExclusiveItemDefenseBoost: ; 0x0230F788
	ldr r0, [r0, #0xb4]
	add r0, r0, r1
	ldrb r0, [r0, #0x226]
	bx lr
	arm_func_end ExclusiveItemDefenseBoost

	arm_func_start TeamMemberHasItemActive
TeamMemberHasItemActive: ; 0x0230F798
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	ldr r4, _0230F80C ; =0x02353538
	mov sb, r0
	mov r8, r1
	mov r5, r6
_0230F7B0:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
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
_0230F80C: .word 0x02353538
	arm_func_end TeamMemberHasItemActive

	arm_func_start ItemIsActive__0230F810
ItemIsActive__0230F810: ; 0x0230F810
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__0230F810

	arm_func_start TeamMemberHasExclusiveItemEffectActive
TeamMemberHasExclusiveItemEffectActive: ; 0x0230F840
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r6, #0
	ldr r5, _0230F8A8 ; =0x02353538
	b _0230F898
_0230F854:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28]
	mov r0, r7
	bl EntityIsValid__0230F008
	cmp r0, #0
	beq _0230F88C
	mov r0, r7
	mov r1, r4
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0230F88C:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0230F898:
	cmp r6, #4
	blt _0230F854
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230F8A8: .word 0x02353538
	arm_func_end TeamMemberHasExclusiveItemEffectActive

	arm_func_start ExclusiveItemEffectIsActive__0230F8AC
ExclusiveItemEffectIsActive__0230F8AC: ; 0x0230F8AC
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0xb4]
	ldrb r0, [r2, #6]
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x228
	bl ExclusiveItemEffectFlagTest
	ldmia sp!, {r3, pc}
	arm_func_end ExclusiveItemEffectIsActive__0230F8AC

	arm_func_start ov29_0230F8D0
ov29_0230F8D0: ; 0x0230F8D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	bl EntityIsValid__0230F008
	cmp r0, #0
	moveq r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r8, #0xb4]
	mov r5, #0
	ldrb r6, [r0, #0x4c]
	ldr r4, _0230F97C ; =0x0235171C
	b _0230F96C
_0230F900:
	mov r1, r6, lsl #2
	add r0, r4, r6, lsl #2
	ldrsh ip, [r8, #4]
	ldrsh r3, [r4, r1]
	ldrsh r2, [r8, #6]
	ldrsh r1, [r0, #2]
	add r0, ip, r3
	add r1, r2, r1
	bl GetTile
	ldr sb, [r0, #0xc]
	cmp sb, #0
	beq _0230F958
	mov r0, sb
	bl IsMonster__0230F980
	cmp r0, #0
	beq _0230F958
	mov r0, sb
	mov r1, r7
	bl ItemIsActive__0230F810
	cmp r0, #0
	movne r0, r6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0230F958:
	add r0, r6, #1
	and r0, r0, #0xff
	add r1, r5, #1
	and r6, r0, #7
	and r5, r1, #0xff
_0230F96C:
	cmp r5, #8
	blo _0230F900
	mov r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230F97C: .word 0x0235171C
	arm_func_end ov29_0230F8D0

	arm_func_start IsMonster__0230F980
IsMonster__0230F980: ; 0x0230F980
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__0230F980

	arm_func_start ov29_0230F9A4
ov29_0230F9A4: ; 0x0230F9A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMonster__0230F980
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_0234908C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0230F9A4

	arm_func_start TrySpawnEnemyItemDrop
TrySpawnEnemyItemDrop: ; 0x0230F9D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _0230FB28 ; =0x02353538
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	ldrb r0, [r0, #0x748]
	bl TreasureBoxDropsEnabled
	cmp r0, #0
	ldrne r4, [r5, #0xb4]
	ldrneb r0, [r4, #6]
	cmpne r0, #0
	beq _0230FB20
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #1
	bne _0230FA54
	mov r0, r6
	mov r1, #0x43
	bl IqSkillIsEnabled
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
	mov r0, r6
	mov r1, #0x56
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	addne r0, r7, #1
	movne r0, r0, lsl #0x10
	movne r7, r0, asr #0x10
_0230FA54:
	ldrsh r1, [r4, #2]
	add r0, sp, #0
	mov r2, r7
	bl TryGenerateUnownStoneDrop
	cmp r0, #0
	beq _0230FA84
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FA84:
	mov r0, r6
	mov r1, #0x75
	bl AbilityIsActiveVeneer
	mov r2, r0
	add r0, sp, #0
	mov r1, r5
	mov r3, r7
	bl ov29_023460DC
	cmp r0, #0
	beq _0230FAC4
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
	b _0230FB20
_0230FAC4:
	mov r0, r6
	bl IsMonster__0230F980
	cmp r0, #0
	beq _0230FB20
	mov r0, r6
	mov r1, #0x62
	bl ExclusiveItemEffectIsActive__0230F8AC
	cmp r0, #0
	beq _0230FB20
	ldr r0, _0230FB2C ; =0x022C4650
	ldrsh r0, [r0]
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _0230FB20
	add r0, sp, #0
	mov r1, #0xb7
	mov r2, #2
	bl GenerateStandardItem
	add r2, sp, #0
	mov r0, r5
	add r1, r5, #4
	mov r3, #1
	bl SpawnDroppedItemWrapper
_0230FB20:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230FB28: .word 0x02353538
_0230FB2C: .word 0x022C4650
	arm_func_end TrySpawnEnemyItemDrop

	arm_func_start ov29_0230FB30
ov29_0230FB30: ; 0x0230FB30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230FB88 ; =0x023529A8
	mov r5, r0
	ldrh r2, [r1]
	add r0, sp, #0
	strh r2, [sp]
	ldrh r1, [r1, #2]
	strh r1, [sp, #2]
	bl ov29_02347184
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0230FB8C ; =0x00000F62
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FB88: .word 0x023529A8
_0230FB8C: .word 0x00000F62
	arm_func_end ov29_0230FB30

	arm_func_start TickNoSlipCap
TickNoSlipCap: ; 0x0230FB90
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _0230FBB8
	mov r0, r5
	mov r1, #0xd
	bl HasHeldItem
_0230FBB8:
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r4, [r5, #0xb4]
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x107]
	add r1, r0, #1
	and r0, r1, #0xff
	cmp r0, #0x14
	strb r1, [r4, #0x107]
	movhs r0, #0x13
	strhsb r0, [r4, #0x107]
	mov r0, #0x64
	bl DungeonRandInt
	ldrb r2, [r4, #0x107]
	ldr r1, _0230FC20 ; =0x022C4BE4
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	cmp r0, r1
	ldmgeia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl ov29_0230FB30
	mov r0, #0
	strb r0, [r4, #0x107]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230FC20: .word 0x022C4BE4
	arm_func_end TickNoSlipCap

	arm_func_start ov29_0230FC24
ov29_0230FC24: ; 0x0230FC24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x34
	movs r5, r0
	beq _02310FF4
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r4, [r5, #0xb4]
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0x150]
	bl ov29_022FB718
	bl ov29_0234B294
	mov r0, r5
	bl TryWeatherFormChange
	mov r0, r5
	mov r1, #0x1d
	bl ItemIsActive__02311034
	cmp r0, #0
	beq _0230FD0C
	ldrb r0, [r4, #0x17c]
	add r1, r0, #1
	and r0, r1, #0xff
	cmp r0, #0x14
	strb r1, [r4, #0x17c]
	movhs r0, #0x13
	strhsb r0, [r4, #0x17c]
	mov r0, #0x64
	bl DungeonRandInt
	ldrb r2, [r4, #0x17c]
	ldr r1, _02310A6C ; =0x022C4BBC
	mov r2, r2, lsl #1
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bge _0230FD0C
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0x17c]
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r2, #0
	mov r0, r5
	mov r1, r5
	mov r3, r2
	bl TryWarp
	mov r0, r5
	bl ov29_022F42F8
_0230FD0C:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0231013C
	mov r0, r5
	mov r1, #0x1e
	mov r7, #0xa
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, r7
	moveq r2, #0
	mov r0, r5
	mov r1, #0x26
	sub r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x10
	sub r7, r7, r2
	bl IqSkillIsEnabled
	cmp r0, #0
	mov r0, r5
	mov r1, #0x22
	subne r7, r7, #1
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x11
	add r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x32
	add r7, r7, r2
	bl ItemIsActive__02311034
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	mov r1, #0x59
	add r7, r7, r2
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	adds r7, r7, r0
	movmi r7, #0
	ldr r3, _02310A70 ; =0x0000199A
	cmp r7, #0x13
	mov r6, #0
	ldr r2, _02310A74 ; =0x022C4FC4
	movgt r7, #0x13
	add r0, sp, #0x2c
	add r1, sp, #0x24
	str r6, [sp, #0x24]
	str r3, [sp, #0x28]
	add r2, r2, r7, lsl #3
	bl MultiplyFixedPoint64
	ldrb r2, [r4, #0x15d]
	cmp r2, #1
	ldrhi r0, _02310A78 ; =0x022C4A5C
	ldrhi r1, [sp, #0x30]
	ldrhi r0, [r0, r2, lsl #2]
	addhi r0, r1, r0, lsl #16
	strhi r0, [sp, #0x30]
	mov r0, #0
	strb r0, [r4, #0x15d]
	add r0, r4, #0x100
	ldrh r2, [r0, #0x46]
	ldrh r1, [r0, #0x48]
	add r0, sp, #0x2c
	strh r2, [sp, #0x20]
	strh r1, [sp, #0x22]
	bl BinToDecFixedPoint
	strh r0, [sp, #0x14]
	mov r0, r0, lsr #0x10
	add r1, r4, #0x100
	strh r0, [sp, #0x16]
	ldrh r0, [r1, #0x46]
	sub r3, sp, #4
	ldrh r2, [sp, #0x14]
	strh r0, [r3]
	ldrh r0, [r1, #0x48]
	ldrh r1, [sp, #0x16]
	strh r0, [r3, #2]
	ldr r0, [r3]
	strh r2, [r3]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl SubFixedPoint
	strh r0, [sp, #0x10]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0x12]
	ldrh r1, [sp, #0x10]
	add r0, r4, #0x100
	ldrh r3, [sp, #0x12]
	strh r1, [r0, #0x46]
	ldrh r2, [sp, #0x20]
	strh r3, [r0, #0x48]
	sub r0, sp, #4
	ldrh r1, [sp, #0x22]
	strh r2, [r0]
	mov r6, #0
	strh r1, [r0, #2]
	ldr r0, [r0]
	mov r7, #1
	bl CeilFixedPoint
	cmp r0, #0x14
	blt _0230FEFC
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0x14
	ldrlt r6, _02310A7C ; =0x00000DE6
_0230FEFC:
	ldrh r1, [sp, #0x20]
	ldrh r0, [sp, #0x22]
	sub r2, sp, #4
	strh r1, [r2]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	blt _0230FF48
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0xa
	ldrlt r6, _02310A80 ; =0x00000DE7
_0230FF48:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _0230FF98
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp, #0xc]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xe]
	ldrh r2, [sp, #0xc]
	add r0, r4, #0x100
	ldrh r1, [sp, #0xe]
	strh r2, [r0, #0x46]
	strh r1, [r0, #0x48]
_0230FF98:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bge _0230FFE8
	mov r0, #0
	bl sub_02050FF8
	strh r0, [sp, #8]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #0xa]
	ldrh r2, [sp, #8]
	add r0, r4, #0x100
	ldrh r1, [sp, #0xa]
	strh r2, [r0, #0x46]
	strh r1, [r0, #0x48]
_0230FFE8:
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	bne _023100D8
	bl ov29_022F2FE4
	mov r0, r5
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r0, _02310A84 ; =0x02353538
	ldr r1, [r0]
	ldrb r0, [r1, #0x799]
	cmp r0, #0xa
	addlo r0, r0, #1
	strlob r0, [r1, #0x799]
	ldr r0, _02310A84 ; =0x02353538
	mov r1, r5
	ldr r0, [r0]
	ldrb r0, [r0, #0x799]
	cmp r0, #1
	ldreq r6, _02310A88 ; =0x00000DE8
	cmp r0, #2
	ldreq r6, _02310A8C ; =0x00000DE9
	moveq r7, #0
	cmp r0, #3
	mov r0, r5
	ldreq r6, _02310A90 ; =0x00000DEA
	moveq r7, #0
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #1
	mov r2, #0xe
	mov r3, #0x250
	bl ApplyDamageAndEffectsWrapper
	mov r0, #1
	strb r0, [r4, #0x150]
	add r0, r4, #0x100
	ldrh r1, [r0, #0x46]
	sub r2, sp, #4
	strh r1, [r2]
	ldrh r0, [r0, #0x48]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl CeilFixedPoint
	cmp r0, #0
	movne r6, #0
	b _023100E8
_023100D8:
	ldr r0, _02310A84 ; =0x02353538
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x799]
_023100E8:
	cmp r6, #0
	beq _0231013C
	cmp r7, #0
	beq _02310124
	ldr r0, _02310A84 ; =0x02353538
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _02310124
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310124
	ldr r0, _02310A94 ; =0x00001303
	bl ov29_022EACCC
_02310124:
	mov r0, r5
	mov r1, r6
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x1e
	mov r1, #0x32
	bl ov29_022EA370
_0231013C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r0, _02310A84 ; =0x02353538
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd5a]
	cmp r0, #0
	bne _0231037C
	mov r0, r5
	bl GetApparentWeather
	cmp r0, #5
	mov r0, r5
	bne _023101FC
	mov r1, #0x77
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0x4d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #6
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	ldr r0, _02310A9C ; =0x022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x12
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_023101FC:
	bl GetApparentWeather
	cmp r0, #2
	mov r0, r5
	bne _02310298
	mov r1, #0x1d
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #9
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0xd
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	mov r0, r5
	mov r1, #0x11
	bl MonsterIsType
	cmp r0, #0
	bne _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	ldr r0, _02310A9C ; =0x022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x12
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_02310298:
	bl GetApparentWeather
	cmp r0, #1
	bne _02310360
	mov r0, r5
	mov r1, #0x5a
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310304
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	mov r0, #2
	mov r1, #0x5a
	bl ov29_0234B084
	ldr r0, _02310A9C ; =0x022C46EC
	mov r2, #0x19
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x278
	bl ApplyDamageAndEffectsWrapper
	b _02310360
_02310304:
	mov r0, r5
	mov r1, #0x55
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310360
	ldr r3, _02310A98 ; =0x00000DBD
	mov r6, #9
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r6, [sp]
	bl ExclusiveItemEffectIsActiveWithLogging
	cmp r0, #0
	bne _02310360
	mov r0, #2
	mov r1, #0x55
	bl ov29_0234B084
	ldr r0, _02310A9C ; =0x022C46EC
	ldr r3, _02310AA0 ; =0x0000025F
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #0x1a
	bl ApplyDamageAndEffectsWrapper
_02310360:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_0231037C:
	mov r0, #0x64
	bl DungeonRandInt
	mov r6, r0
	mov r0, r5
	mov r1, #0x21
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023103F8
	ldr r0, _02310AA4 ; =0x022C46A0
	ldrsh r0, [r0]
	cmp r6, r0
	bge _023103F8
	mov r0, r5
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	beq _023103F8
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	mov r2, #1
	mov r3, #0
	bl EndNegativeStatusConditionWrapper
_023103F8:
	mov r0, r5
	mov r1, #0x51
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310474
	mov r0, r5
	bl GetApparentWeather
	cmp r0, #4
	bne _02310474
	mov r0, r5
	mov r1, #0
	bl MonsterHasNegativeStatus
	cmp r0, #0
	ldrneb r0, [r4, #0xc4]
	cmpne r0, #3
	beq _02310474
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r3, #0
	mov r0, r5
	mov r1, r5
	mov r2, #1
	str r3, [sp]
	bl EndNegativeStatusCondition
_02310474:
	mov r0, r5
	mov r1, #0xb
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023104C0
	ldrb r1, [r4, #0x11f]
	ldr r0, _02310AA8 ; =0x022C466C
	add r2, r1, #1
	ldrsh r0, [r0]
	and r1, r2, #0xff
	strb r2, [r4, #0x11f]
	cmp r1, r0
	blt _023104C0
	mov r3, #0
	mov r0, r5
	mov r1, r5
	mov r2, #0x7f
	strb r3, [r4, #0x11f]
	bl BoostSpeedOneStage
_023104C0:
	ldrb r0, [r4, #0xbd]
	cmp r0, #4
	bne _023104F8
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	bl ov29_022E53F0
_023104F8:
	ldrb r0, [r4, #0xbf]
	cmp r0, #1
	bne _02310590
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310574
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AAC ; =0x022C4610
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xc1]
	bl ov29_02307BDC
	ldr r0, _02310AB0 ; =0x022C44D4
	mov r2, #1
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x248
	bl ApplyDamageAndEffectsWrapper
_02310574:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310590:
	bl GravityIsActive
	cmp r0, #0
	beq _023105DC
	mov r0, r5
	bl IsFloating
	cmp r0, #0
	beq _023105C0
	mov r0, r5
	mov r1, r5
	bl EndMagnetRiseStatus
	mov r0, r5
	bl EnsureCanStandCurrentTile
_023105C0:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_023105DC:
	mov r0, r5
	mov r1, #0x69
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _02310614
	mov r0, r5
	bl TryActivateBadDreams
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310614:
	mov r0, r5
	bl GetTileAtEntity
	bl ov29_02337E2C
	cmp r0, #0
	bne _023106A4
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02310AB4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	ldrsh r0, [r4, #0x10]
	cmp r0, r1
	bge _0231067C
	mov r0, r5
	mov r1, #0x64
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _0231067C
	ldr r0, _02310AB8 ; =0x022C4664
	mov r3, #0
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	str r3, [sp]
	bl TryIncreaseHp
_0231067C:
	mov r0, r5
	mov r1, #0x65
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _023106A4
	mov r2, #1
	mov r0, r5
	mov r1, r5
	mov r3, r2
	bl EndNegativeStatusConditionWrapper
_023106A4:
	mov r0, r5
	mov r1, #0x5c
	bl ExclusiveItemEffectIsActive__02311064
	cmp r0, #0
	beq _02310754
	mov sl, #0
	ldr r6, _02310A84 ; =0x02353538
	mov sb, sl
	mov r7, #1
_023106C8:
	ldr r0, [r6]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310718
	ldr r0, [r8, #0xb4]
	ldrb r0, [r0, #0xbf]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02310718
	mov r0, r8
	bl ov29_022E543C
	mov r0, r8
	mov r1, r8
	bl EndBurnClassStatus
	mov sl, r7
_02310718:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _023106C8
	cmp sl, #0
	beq _02310754
	ldr r0, _02310ABC ; =0x022C464C
	mov r6, #1
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02310754:
	ldrb r0, [r4, #0xbf]
	cmp r0, #2
	bne _02310830
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310810
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r4, #0xbf]
	cmpeq r0, #2
	bne _02310FF4
	ldr r1, _02310AC0 ; =0x022C46A8
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xc1]
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #0x72
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023107F8
	ldr r0, _02310AC4 ; =0x022C44D8
	mov r6, #1
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
	b _02310810
_023107F8:
	ldr r0, _02310AC4 ; =0x022C44D8
	mov r2, #3
	ldrsh r1, [r0]
	mov r0, r5
	rsb r3, r2, #0x24c
	bl ApplyDamageAndEffectsWrapper
_02310810:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _0231092C
	b _02310FF4
_02310830:
	cmp r0, #3
	bne _0231092C
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xc1]
	ldrb r0, [r4, #0xc1]
	cmp r0, #0
	bne _02310910
	ldrb r6, [r4, #0xc2]
	cmp r6, #0x1d
	addlo r0, r6, #1
	strlob r0, [r4, #0xc2]
	ldr r0, _02310AC8 ; =0x022C4414
	cmp r6, #0x1d
	ldrsh r0, [r0]
	movge r6, #0x1d
	cmp r6, #0
	strb r0, [r4, #0xc1]
	mov r0, #0
	movlt r6, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r4, #0xbf]
	cmpeq r0, #3
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r0, r5
	mov r1, #0x72
	bl AbilityIsActiveVeneer
	cmp r0, #0
	beq _023108F4
	ldr r0, _02310ACC ; =0x022C4C9C
	mov r1, r6, lsl #1
	ldrsh r2, [r0, r1]
	mov r6, #1
	mov r0, r5
	mov r1, r5
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
	b _02310910
_023108F4:
	ldr r0, _02310ACC ; =0x022C4C9C
	mov r1, r6, lsl #1
	ldrsh r1, [r0, r1]
	mov r2, #3
	mov r0, r5
	rsb r3, r2, #0x24c
	bl ApplyDamageAndEffectsWrapper
_02310910:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_0231092C:
	ldrb r0, [r4, #0xc4]
	cmp r0, #7
	bne _023109D4
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _023109B4
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AD0 ; =0x022C4454
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xcd]
	bl ov29_02307BDC
	ldr r1, [r4, #0xc8]
	mov r0, r5
	bl ov29_022E42E8
	ldr r1, _02310AD4 ; =0x022C446C
	mov r0, r5
	ldrsh r1, [r1]
	mov r2, #2
	mov r3, #0x248
	bl ApplyDamageAndEffectsWrapper
_023109B4:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _02310B6C
	b _02310FF4
_023109D4:
	cmp r0, #4
	bne _02310AF8
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _02310A4C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AD8 ; =0x022C45F0
	mov r0, r5
	ldrsh r2, [r1]
	mov r1, r5
	strb r2, [r4, #0xcd]
	bl ov29_02307BDC
	ldr r0, _02310ADC ; =0x022C45D0
	ldr r3, _02310AE0 ; =0x0000024A
	ldrsh r1, [r0]
	mov r0, r5
	mov r2, #5
	bl ApplyDamageAndEffectsWrapper
_02310A4C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	beq _02310B6C
	b _02310FF4
	.align 2, 0
_02310A6C: .word 0x022C4BBC
_02310A70: .word 0x0000199A
_02310A74: .word 0x022C4FC4
_02310A78: .word 0x022C4A5C
_02310A7C: .word 0x00000DE6
_02310A80: .word 0x00000DE7
_02310A84: .word 0x02353538
_02310A88: .word 0x00000DE8
_02310A8C: .word 0x00000DE9
_02310A90: .word 0x00000DEA
_02310A94: .word 0x00001303
_02310A98: .word 0x00000DBD
_02310A9C: .word 0x022C46EC
_02310AA0: .word 0x0000025F
_02310AA4: .word 0x022C46A0
_02310AA8: .word 0x022C466C
_02310AAC: .word 0x022C4610
_02310AB0: .word 0x022C44D4
_02310AB4: .word 0x000003E7
_02310AB8: .word 0x022C4664
_02310ABC: .word 0x022C464C
_02310AC0: .word 0x022C46A8
_02310AC4: .word 0x022C44D8
_02310AC8: .word 0x022C4414
_02310ACC: .word 0x022C4C9C
_02310AD0: .word 0x022C4454
_02310AD4: .word 0x022C446C
_02310AD8: .word 0x022C45F0
_02310ADC: .word 0x022C45D0
_02310AE0: .word 0x0000024A
_02310AE4: .word 0x022C45E8
_02310AE8: .word 0x022C4590
_02310AEC: .word 0x022C44BC
_02310AF0: .word 0x022C46AC
_02310AF4: .word 0x022C4588
_02310AF8:
	cmp r0, #5
	bne _02310B6C
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xcd]
	ldrb r0, [r4, #0xcd]
	cmp r0, #0
	bne _02310B6C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldr r1, _02310AE4 ; =0x022C45E8
	ldr r0, _02310AE8 ; =0x022C4590
	ldrsh r3, [r1]
	ldrsh r2, [r0]
	mov r0, r5
	mov r1, r5
	strb r3, [r4, #0xcd]
	mov r6, #1
	mov r3, #0
	str r6, [sp]
	bl TryIncreaseHp
_02310B6C:
	ldrb r0, [r4, #0xd8]
	cmp r0, #1
	bne _02310C28
	ldrb r0, [r4, #0xdc]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xdc]
	ldrb r0, [r4, #0xdc]
	cmp r0, #0
	bne _02310C0C
	ldrsh r2, [r4, #0x12]
	ldrsh r1, [r4, #0x16]
	ldr r0, _02310AB4 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	ldr r1, _02310AEC ; =0x022C44BC
	movs r6, r0, asr #2
	ldrsh r1, [r1]
	mov r0, #0
	addeq r6, r6, #1
	strb r1, [r4, #0xdc]
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	arm_func_end ov29_0230FC24

	arm_func_start ov29_02310BDC
ov29_02310BDC: ; 0x02310BDC
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r2, #7
	mov r0, r5
	mov r1, r6
	add r3, r2, #0x244
	bl ApplyDamageAndEffectsWrapper
_02310C0C:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	arm_func_end ov29_02310BDC

	arm_func_start ov29_02310C18
ov29_02310C18: ; 0x02310C18
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310C28:
	ldrb r0, [r4, #0xe0]
	cmp r0, #1
	bne _02310DE0
	ldrb r0, [r4, #0xea]
	cmp r0, #0
	subne r0, r0, #1
	strneb r0, [r4, #0xea]
	ldrb r0, [r4, #0xea]
	cmp r0, #0
	bne _02310DC4
	ldr r0, _02310A84 ; =0x02353538
	ldrb r2, [r4, #0xe8]
	ldr r0, [r0]
	ldr r1, _02310AF0 ; =0x022C46AC
	add r0, r0, r2, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb78]
	ldrsh r1, [r1]
	ldr r0, _02310AF4 ; =0x022C4588
	cmp r7, #0
	ldrsh r6, [r0]
	strb r1, [r4, #0xea]
	moveq r0, #0
	streqb r0, [r4, #0xe0]
	beq _02310DC4
	ldr r0, [r7, #0xb4]
	ldr r1, [r4, #0xe4]
	ldr r0, [r0, #0xb0]
	cmp r1, r0
	movne r0, #0
	strneb r0, [r4, #0xe0]
	bne _02310DC4
	cmp r7, r5
	beq _02310CF0
	cmp r7, #0
	moveq r0, #0
	beq _02310CD0
	ldr r0, [r7]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_02310CD0:
	cmp r0, #0
	beq _02310CF0
	mov r0, r7
	mov r1, #0x53
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r8, #0
	bne _02310D00
_02310CF0:
	mov r0, r5
	mov r1, #0x3a
	bl AbilityIsActiveVeneer
	mov r8, r0
_02310D00:
	mov r0, r5
	bl ov29_022EC62C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	mov r0, r7
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldrb r0, [r4, #0xc4]
	cmp r0, #1
	beq _02310DC4
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	mov r0, r5
	mov r1, r6
	mov r2, #9
	mov r3, #0x24c
	bl ApplyDamageAndEffectsWrapper
	cmp r8, #0
	beq _02310D94
	mov r0, r7
	mov r1, r7
	bl ov29_02307BDC
	mov r2, #0xd
	mov r0, r7
	mov r1, r6
	add r3, r2, #0x22c
	bl ApplyDamageAndEffectsWrapper
	b _02310DC4
_02310D94:
	mov r0, r5
	mov r1, #0x73
	bl AbilityIsActiveVeneer
	cmp r0, #0
	bne _02310DC4
	mov r8, #1
	mov r0, r7
	mov r1, r7
	mov r2, r6
	mov r3, #0
	str r8, [sp]
	bl TryIncreaseHp
_02310DC4:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310DE0:
	ldrb r0, [r4, #0x106]
	cmp r0, #0
	beq _02310E9C
	add r0, r4, #6
	add r0, r0, #0x100
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0x106]
	cmp r0, #0
	bne _02310E9C
	mov r0, #0
	bl DisplayActions
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02310FFC ; =0x00000DEB
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r5
	bl ov29_02307BDC
	ldrb r0, [r4, #0xd5]
	cmp r0, #7
	bne _02310E6C
	ldr r1, _02311000 ; =0x00000DEC
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
	b _02310E80
_02310E6C:
	mov r2, #0xb
	ldr r1, _02311004 ; =0x0000270F
	mov r0, r5
	rsb r3, r2, #0x258
	bl ApplyDamageAndEffectsWrapper
_02310E80:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
_02310E9C:
	ldrb r0, [r4, #0xd2]
	cmp r0, #1
	bne _02310F70
	add r0, r4, #0xd3
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0xd3]
	cmp r0, #0
	bne _02310F70
	mov r1, #0
	mov r0, r5
	strb r1, [r4, #0xd2]
	bl ov29_02300818
	cmp r0, #0
	bne _02310F70
	mov r0, r5
	mov r1, #0
	bl ov29_02300DCC
	cmp r0, #0
	bne _02310F70
	mov r0, r5
	bl ov29_02300CB0
	cmp r0, #0
	bne _02310F70
	mov r0, #0
	bl DisplayActions
	ldrh r0, [r4, #0xac]
	cmp r0, #0
	ldreq r0, _02311008 ; =0x00000165
	streqh r0, [r4, #0xac]
	ldrh r1, [r4, #0xac]
	add r0, sp, #0x18
	bl InitMove
	mov r1, #0
	ldrb r0, [sp, #0x18]
	add r6, sp, #0x18
	mov r2, r1
	orr r0, r0, #0x10
	strb r0, [sp, #0x18]
	mov r0, r5
	mov r3, r1
	stmia sp, {r1, r6}
	bl ov29_02322374
	mov r1, #0
	mov r0, r5
	strh r1, [r4, #0xac]
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, #0
	str r0, [r4, #0xb8]
_02310F70:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	ldrb r0, [r4, #0xd2]
	cmp r0, #0xc
	bne _02310FD0
	add r0, r4, #0xd3
	bl TickStatusTurnCounter
	ldrb r0, [r4, #0xd3]
	cmp r0, #0
	bne _02310FD0
	mov r0, #0
	strb r0, [r4, #0xd2]
	mov r1, r5
	mov r2, r0
	strb r0, [r4, #0x154]
	bl SubstitutePlaceholderStringTags
	ldr r1, _0231100C ; =0x00000CBA
	mov r0, r5
	bl LogMessageByIdWithPopupCheckUser
_02310FD0:
	mov r0, r5
	bl EntityIsValid__02311010
	cmp r0, #0
	beq _02310FF4
	bl IsFloorOver
	cmp r0, #0
	bne _02310FF4
	mov r0, r5
	bl TickNoSlipCap
_02310FF4:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02310FFC: .word 0x00000DEB
_02311000: .word 0x00000DEC
_02311004: .word 0x0000270F
_02311008: .word 0x00000165
_0231100C: .word 0x00000CBA
	arm_func_end ov29_02310C18
