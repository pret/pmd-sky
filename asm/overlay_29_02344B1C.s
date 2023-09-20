	.include "asm/macros.inc"
	.include "overlay_29_02344B1C.inc"

	.text

	arm_func_start ov29_02344B1C
ov29_02344B1C: ; 0x02344B1C
	ldr r0, _02344B2C ; =ov29_023537B0
	mov r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_02344B2C: .word ov29_023537B0
	arm_func_end ov29_02344B1C

	arm_func_start ov29_02344B30
ov29_02344B30: ; 0x02344B30
	ldr r0, _02344B40 ; =ov29_023537B0
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_02344B40: .word ov29_023537B0
	arm_func_end ov29_02344B30

	arm_func_start ov29_02344B44
ov29_02344B44: ; 0x02344B44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	orr r1, r5, #0x40000
	bl ov29_0234B084
	ldr r2, _02344B6C ; =ov29_023531BC
	mov r0, r5
	mov r1, r4
	bl sub_02024FE8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02344B6C: .word ov29_023531BC
	arm_func_end ov29_02344B44

	arm_func_start ov29_02344B70
ov29_02344B70: ; 0x02344B70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	orr r1, r5, #0x40000
	bl ov29_0234B084
	ldr r2, _02344B98 ; =ov29_023531A4
	mov r0, r5
	mov r1, r4
	bl sub_02024FE8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02344B98: .word ov29_023531A4
	arm_func_end ov29_02344B70

	arm_func_start ov29_02344B9C
ov29_02344B9C: ; 0x02344B9C
	ldr ip, _02344BA4 ; =ov29_0234B084
	bx ip
	.align 2, 0
_02344BA4: .word ov29_0234B084
	arm_func_end ov29_02344B9C

	arm_func_start ov29_02344BA8
ov29_02344BA8: ; 0x02344BA8
	stmdb sp!, {r3, lr}
	add r3, r0, r1, lsl #2
	orr ip, r1, #0x40000
	mov r0, r1
	mov r1, r2
	ldr r2, _02344BCC ; =ov29_023531BC
	str ip, [r3, #0x10]
	bl sub_02024FE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02344BCC: .word ov29_023531BC
	arm_func_end ov29_02344BA8

	arm_func_start GenerateStandardItem
GenerateStandardItem: ; 0x02344BD0
	ldr ip, _02344BE0 ; =GenerateItem
	mov r3, r2
	mov r2, #0
	bx ip
	.align 2, 0
_02344BE0: .word GenerateItem
	arm_func_end GenerateStandardItem

	arm_func_start GenerateCleanItem
GenerateCleanItem: ; 0x02344BE4
	ldr ip, _02344BF4 ; =GenerateItem
	mov r2, #0
	mov r3, #2
	bx ip
	.align 2, 0
_02344BF4: .word GenerateItem
	arm_func_end GenerateCleanItem

	arm_func_start ov29_02344BF8
ov29_02344BF8: ; 0x02344BF8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x48
	ldr r3, _02344C48 ; =ov29_023531CC
	add r2, sp, #0
	mov r4, r0
	mov r1, #0x24
_02344C10:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02344C10
	bl DungeonRand16Bit
	mov r1, #0xc
	bl __divsi3
	add r2, sp, #0
	mov r0, #6
	smlabb r0, r1, r0, r2
	mov r1, r4, lsl #1
	ldrsh r0, [r1, r0]
	add sp, sp, #0x48
	ldmia sp!, {r4, pc}
	.align 2, 0
_02344C48: .word ov29_023531CC
	arm_func_end ov29_02344BF8

	arm_func_start ov29_02344C4C
ov29_02344C4C: ; 0x02344C4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sb, #0
	str sb, [sp, #8]
	mov r8, sb
	bl IsDestinationFloorWithItem
	cmp r0, #0
	ldr r1, _02344E7C ; =ov29_02353538
	ldr r0, _02344E80 ; =0x0002C9E8
	ldr r1, [r1]
	movne sb, #1
	ldrsh r0, [r1, r0]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #8]
	mov r0, #0x38
	bl DungeonRandInt
	mov r6, r0
	mov r0, #0x20
	bl DungeonRandInt
	ldr r1, _02344E7C ; =ov29_02353538
	mov r5, #0
	ldr r1, [r1]
	ldr r2, _02344E84 ; =ov29_023531A0
	add r1, r1, #0x3f00
	strh r5, [r1, #0xc0]
	ldrh r3, [r2]
	ldrh r1, [r2, #2]
	mov r7, r0
	strh r3, [sp, #0x10]
	strh r1, [sp, #0x12]
_02344CC8:
	add r7, r7, #1
	cmp r7, #0x20
	moveq r7, #0
	mov r0, r7, lsl #0x10
	mov r0, r0, asr #0x10
	mov r4, #0
	str r0, [sp, #0xc]
_02344CE4:
	add r6, r6, #1
	cmp r6, #0x38
	mov r0, #0
	moveq r6, #0
	str r0, [sp, #4]
	mov r0, r6
	mov r1, r7
	bl GetTile
	ldrh r1, [r0]
	tst r1, #0x200
	bne _02344E40
	ldrh r1, [r0, #2]
	tst r1, #2
	beq _02344E40
	ldr r1, [sp, #0xc]
	strh r6, [sp, #0x1a]
	strh r1, [sp, #0x1c]
	ldrh r0, [r0]
	tst r0, #0x20
	movne r0, #1
	strne r0, [sp]
	movne sl, r0
	bne _02344D80
	tst r0, #3
	moveq r0, #0
	streq r0, [sp]
	moveq sl, #3
	beq _02344D80
	tst r0, #0x40
	mov r0, #0
	strne r0, [sp]
	movne sl, #2
	bne _02344D80
	cmp sb, #0
	cmpeq r8, #0
	str r0, [sp]
	mov sl, r0
	addeq r8, r8, #1
	beq _02344E40
_02344D80:
	cmp sl, #0
	bne _02344DB0
	cmp sb, #0
	beq _02344DB0
	cmp r8, #0
	bne _02344DB0
	bl GetItemToRetrieve
	mov fp, r0
	mov r0, #2
	mov sb, #0
	str r0, [sp, #4]
	b _02344DEC
_02344DB0:
	cmp sl, #0
	bne _02344DE0
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02344DE0
	ldr r0, _02344E7C ; =ov29_02353538
	ldr r1, [r0]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _02344E80 ; =0x0002C9E8
	ldrsh fp, [r1, r0]
	b _02344DEC
_02344DE0:
	mov r0, sl
	bl GetItemIdToSpawn
	mov fp, r0
_02344DEC:
	mov r0, fp
	bl IsShoppableItem
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	ldr r3, [sp, #4]
	mov r1, fp
	add r0, sp, #0x14
	mov r2, #0
	bl GenerateItem
	ldr r0, [sp]
	add r1, sp, #0x14
	cmp r0, #0
	ldrneb r0, [sp, #0x14]
	mov r2, #1
	orrne r0, r0, #2
	strneb r0, [sp, #0x14]
	add r0, sp, #0x1a
	bl SpawnItem
	cmp sl, #0
	addeq r8, r8, #1
_02344E40:
	add r4, r4, #1
	cmp r4, #0x38
	blt _02344CE4
	add r5, r5, #1
	cmp r5, #0x20
	blt _02344CC8
	ldr r0, _02344E7C ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x3f00
	ldrsh r2, [r0, #0xc0]
	ldrsh r1, [r0, #0xc2]
	add r1, r2, r1
	strh r1, [r0, #0xc0]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02344E7C: .word ov29_02353538
_02344E80: .word 0x0002C9E8
_02344E84: .word ov29_023531A0
	arm_func_end ov29_02344C4C

	arm_func_start ov29_02344E88
ov29_02344E88: ; 0x02344E88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, #2
	bl DungeonRngSetSecondary
	ldrsh r0, [r4]
	ldrsh r1, [r4, #2]
	bl DungeonRandRange
	mov r8, r0
	cmp r8, #0
	ble _02344FF8
	mov r4, #0
	mov r1, r4
	mov r0, #0x1c00
	bl MemAlloc
	mov sl, r0
	mov sb, r4
	mov r6, r4
_02344ED0:
	mov r0, sb, lsl #0x10
	mov r7, r6
	mov r5, r0, asr #0x10
_02344EDC:
	mov r0, r7
	mov r1, sb
	bl GetTile
	ldrb r1, [r0, #7]
	cmp r1, #0xff
	beq _02344F2C
	ldrh r1, [r0]
	tst r1, #0x200
	bne _02344F2C
	tst r1, #1
	beq _02344F2C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r1, r4, lsl #2
	addeq r0, sl, r4, lsl #2
	streqh r7, [sl, r1]
	streqh r5, [r0, #2]
	addeq r4, r4, #1
_02344F2C:
	add r7, r7, #1
	cmp r7, #0x38
	blt _02344EDC
	add sb, sb, #1
	cmp sb, #0x20
	blt _02344ED0
	sub r6, r4, #1
	mov r5, #0
	b _02344F9C
_02344F50:
	mov r0, r4
	bl DungeonRandInt
	mov fp, r5, lsl #2
	add r1, sl, r5, lsl #2
	mov sb, r0, lsl #2
	ldrh r7, [sl, fp]
	ldrh r3, [r1, #2]
	ldrh r2, [sl, sb]
	strh r7, [sp]
	strh r3, [sp, #2]
	strh r2, [sl, fp]
	add r7, sl, r0, lsl #2
	ldrh r3, [r7, #2]
	ldrh r2, [sp]
	ldrh r0, [sp, #2]
	strh r3, [r1, #2]
	strh r2, [sl, sb]
	strh r0, [r7, #2]
	add r5, r5, #1
_02344F9C:
	cmp r5, r6
	blt _02344F50
	mov sb, #0
	add r7, sp, #4
	mov r6, #0xb7
	mov r5, sb
	mov r4, #2
	mov fp, #1
	b _02344FE8
_02344FC0:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl GenerateItem
	mov r1, r7
	mov r2, fp
	add r0, sl, sb, lsl #2
	bl SpawnItem
	add sb, sb, #1
_02344FE8:
	cmp sb, r8
	blt _02344FC0
	mov r0, sl
	bl MemFree
_02344FF8:
	bl DungeonRngSetPrimary
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02344E88

	arm_func_start ov29_02345004
ov29_02345004: ; 0x02345004
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5]
	mov r4, #0
	tst r0, #0x80
	bicne r0, r0, #0x80
	strneb r0, [r5]
	mov r0, r5
	movne r4, #1
	bl AddItemToBagNoHeld
	cmp r0, #0
	beq _02345050
	cmp r4, #0
	ldrneb r0, [r5]
	orrne r0, r0, #0x80
	strneb r0, [r5]
	bl ov29_022FB920
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02345050:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02345004

	arm_func_start TryLeaderItemPickUp
TryLeaderItemPickUp: ; 0x02345058
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x198
	mov sl, r0
	mov sb, r1
	bl GetLeader
	mov r4, r0
	ldrsh r0, [sl]
	ldrsh r1, [sl, #2]
	ldr r7, [r4, #0xb4]
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02345508
	ldr r1, [r0]
	cmp r1, #3
	bne _02345508
	bl GetItemInfo
	ldrb r1, [r7, #0x4e]
	mov r5, r0
	mov r0, r4
	cmp r1, #0
	bne _02345108
	mov r1, r5
	mov r2, sb
	bl ov29_02348DD8
	cmp r0, #0
	bne _02345508
	cmp sb, #0
	beq _02345508
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02345514 ; =0x00000BD2
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02345508
_02345108:
	mov r1, #1
	bl ShouldMonsterRunAwayVariation
	cmp r0, #0
	beq _0234515C
	cmp sb, #0
	beq _02345508
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02345518 ; =0x00000BD3
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02345508
_0234515C:
	ldrsh r0, [r5, #4]
	bl GetItemCategoryVeneer
	cmp r0, #6
	bne _023451EC
	mov r0, r4
	mov r1, #0x1b
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r5]
	orrne r0, r0, #0x20
	strneb r0, [r5]
	mov r0, r5
	bl sub_0200D8AC
	mov r6, r0
	ldr r0, _0234551C ; =0x00001308
	bl ov29_022EACCC
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, r6
	bl AddMoneyCarried
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r0, #0
	mov r1, r5
	bl sub_02024FE8
	mov r0, sl
	mov r1, #1
	bl RemoveGroundItem
	ldr r1, _02345520 ; =0x00000BD6
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	ldrsh r0, [r5, #4]
	bl ov29_0234CCB4
	b _02345508
_023451EC:
	ldr r0, _02345524 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x75b]
	cmp r0, #0
	beq _02345238
	mov r8, #0
	add r6, sp, #0
	add fp, sp, #0xcc
_0234520C:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	str r0, [r6, r8, lsl #2]
	str r8, [fp, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #0x32
	blt _0234520C
	bl GetCurrentBagCapacity
	mov r6, r0
	b _0234524C
_02345238:
	add r1, r7, #0x62
	mvn r0, #0
	str r1, [sp]
	str r0, [sp, #0xcc]
	mov r6, #1
_0234524C:
	ldrsh ip, [r5, #4]
	cmp ip, #0xb
	bge _02345378
	ldrb r0, [r5]
	tst r0, #2
	bne _02345378
	mvn r8, #0
	mov fp, r8
	mov lr, #0
	and r0, r0, #8
	b _023452D8
_02345278:
	add r1, sp, #0
	ldr r1, [r1, lr, lsl #2]
	ldrb r1, [r1]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _023452D4
	add r1, sp, #0
	ldr r3, [r1, lr, lsl #2]
	ldrb r2, [r3]
	tst r2, #2
	ldreqsh r1, [r3, #4]
	cmpeq ip, r1
	andeq r1, r2, #8
	cmpeq r0, r1
	bne _023452D4
	ldrh r1, [r3, #2]
	cmp r1, #0x63
	beq _023452D4
	cmp fp, r1
	movlt fp, r1
	movlt r8, lr
_023452D4:
	add lr, lr, #1
_023452D8:
	cmp lr, r6
	blt _02345278
	mvn r0, #0
	cmp r8, r0
	beq _02345378
	add r1, sp, #0
	ldr r2, [r1, r8, lsl #2]
	ldrh r0, [r5, #2]
	ldrh r1, [r2, #2]
	add r0, r1, r0
	cmp r0, #0x63
	movge r0, #0x63
	strh r0, [r2, #2]
	bl ov29_02347040
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, sl
	mov r1, #1
	bl RemoveGroundItem
	ldr r0, _02345528 ; =0x00001304
	bl ov29_022EACCC
	add r0, sp, #0xcc
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bge _02345360
	ldr r1, _0234552C ; =0x00000BD4
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _0234536C
_02345360:
	ldr r1, _02345530 ; =0x00000BD5
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
_0234536C:
	ldrsh r0, [r5, #4]
	bl ov29_0234CCB4
	b _02345508
_02345378:
	mov r8, #0
	add r3, sp, #0
	mov r0, r8
	mov r1, #1
	b _023453AC
_0234538C:
	ldr r2, [r3, r8, lsl #2]
	ldrb r2, [r2]
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	beq _023453B4
	add r8, r8, #1
_023453AC:
	cmp r8, r6
	blt _0234538C
_023453B4:
	mov r0, r4
	mov r1, r5
	mov r2, sb
	bl ov29_02348DD8
	cmp r0, #0
	bne _02345508
	cmp r8, r6
	bne _02345418
	cmp sb, #0
	beq _02345508
	mov r0, #0
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02345514 ; =0x00000BD2
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02345508
_02345418:
	ldr r0, _02345528 ; =0x00001304
	bl ov29_022EACCC
	add r0, sp, #0xcc
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bge _02345480
	ldrh r2, [r5]
	mov r0, #0
	mov r1, #0x40000
	strh r2, [r7, #0x62]
	ldrh r2, [r5, #2]
	strh r2, [r7, #0x64]
	ldrh r2, [r5, #4]
	strh r2, [r7, #0x66]
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, sl
	mov r1, #1
	bl RemoveGroundItem
	ldr r1, _0234552C ; =0x00000BD4
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02345500
_02345480:
	mov r0, r5
	bl ov29_02348D3C
	mov r6, r0
	mov r0, r5
	bl ov29_02345004
	cmp r0, #0
	mov r0, #0
	beq _023454BC
	mov r1, r4
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _02345534 ; =0x00000BD7
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02345500
_023454BC:
	mov r1, #0x40000
	bl ov29_0234B084
	ldr r2, _02345510 ; =ov29_023531BC
	mov r1, r5
	mov r0, #0
	bl sub_02024FE8
	mov r0, sl
	mov r1, #1
	bl RemoveGroundItem
	ldr r1, _02345530 ; =0x00000BD5
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	mov r0, r5
	mov r1, r6
	bl ov29_02348ECC
	cmp r0, #0
	bne _02345508
_02345500:
	ldrsh r0, [r5, #4]
	bl ov29_0234CCB4
_02345508:
	add sp, sp, #0x198
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02345510: .word ov29_023531BC
_02345514: .word 0x00000BD2
_02345518: .word 0x00000BD3
_0234551C: .word 0x00001308
_02345520: .word 0x00000BD6
_02345524: .word ov29_02353538
_02345528: .word 0x00001304
_0234552C: .word 0x00000BD4
_02345530: .word 0x00000BD5
_02345534: .word 0x00000BD7
	arm_func_end TryLeaderItemPickUp

	arm_func_start SpawnItem
SpawnItem: ; 0x02345538
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl SpawnItemEntity
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r6]
	ldr r1, [r4, #0xb4]
	strh r0, [r1]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldr r1, [r4, #0xb4]
	ldrb r0, [r1]
	bic r0, r0, #0x10
	strb r0, [r1]
	ldr r1, [r4, #0xb4]
	ldrb r0, [r1]
	bic r0, r0, #0x20
	strb r0, [r1]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _023455A8
	mov r0, r6
	bl RemoveEquivItemNoHole
_023455A8:
	mov r0, #1
	strb r0, [r4, #0x20]
	ldrsh r0, [r7]
	ldrsh r1, [r7, #2]
	bl GetTileSafe
	ldr r1, _02345690 ; =ov29_023537B0
	str r4, [r0, #0x10]
	ldrb r1, [r1]
	cmp r1, #0
	bne _0234563C
	ldrh r0, [r0]
	tst r0, #0x20
	beq _0234563C
	ldrsh r0, [r6, #4]
	bl IsShoppableItem
	cmp r0, #0
	beq _0234563C
	ldrb r0, [r6]
	tst r0, #2
	beq _02345620
	cmp r5, #0
	beq _0234563C
	mov r0, r6
	bl GetActualBuyPrice
	ldr r1, _02345694 ; =ov29_02353538
	ldr r2, [r1]
	ldr r1, [r2, #0x7bc]
	add r0, r1, r0
	str r0, [r2, #0x7bc]
	b _0234563C
_02345620:
	mov r0, r6
	bl GetActualSellPrice
	ldr r1, _02345694 ; =ov29_02353538
	ldr r2, [r1]
	ldr r1, [r2, #0x7c0]
	add r0, r1, r0
	str r0, [r2, #0x7c0]
_0234563C:
	mov r4, #0
	ldr r5, _02345694 ; =ov29_02353538
	mov r6, r4
_02345648:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xbc8]
	bl EntityIsValid__02345698
	cmp r0, #0
	addne r4, r6, #1
	add r6, r6, #1
	cmp r6, #0x40
	blt _02345648
	ldr r0, _02345694 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x3f00
	strh r4, [r0, #0xc0]
	bl RemoveEmptyItemsInBag
	bl ov29_022FB920
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02345690: .word ov29_023537B0
_02345694: .word ov29_02353538
	arm_func_end SpawnItem
