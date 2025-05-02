	.include "asm/macros.inc"
	.include "main_02051098.inc"

	.text

	arm_func_start sub_02051098
sub_02051098: ; 0x02051098
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0x10
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0x10
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051098

	arm_func_start sub_020510C0
sub_020510C0: ; 0x020510C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0x10
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0x10
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020510C0

	arm_func_start sub_020510E8
sub_020510E8: ; 0x020510E8
	ldr r3, _02051128 ; =_020AFF88
	mov ip, #1
	str r0, [r3]
	ldr r0, _0205112C ; =0x6C078965
	b _02051114
_020510FC:
	add r1, r3, ip, lsl #2
	ldr r1, [r1, #-4]
	eor r1, r1, r1, lsr #30
	mla r2, r1, r0, ip
	str r2, [r3, ip, lsl #2]
	add ip, ip, #1
_02051114:
	cmp ip, #0x270
	blt _020510FC
	ldr r0, _02051130 ; =_020AFF7C
	str ip, [r0]
	bx lr
	.align 2, 0
_02051128: .word _020AFF88
_0205112C: .word 0x6C078965
_02051130: .word _020AFF7C
	arm_func_end sub_020510E8

	arm_func_start sub_02051134
sub_02051134: ; 0x02051134
	stmdb sp!, {r4, lr}
	ldr r0, _0205126C ; =_020AFF7C
	ldr r1, [r0]
	cmp r1, #0x270
	blt _02051230
	ldr r0, _02051270 ; =0x00000271
	cmp r1, r0
	bne _0205115C
	add r0, r0, #0x1300
	bl sub_020510E8
_0205115C:
	ldr ip, _02051274 ; =_020AFF88
	ldr r2, _02051278 ; =_020AFF80
	mov r0, #0
_02051168:
	add r3, ip, r0, lsl #2
	ldr r4, [ip, r0, lsl #2]
	ldr r1, [r3, #4]
	and r4, r4, #0x80000000
	bic r1, r1, #0x80000000
	orr r4, r4, r1
	and r1, r4, #1
	ldr r3, [r3, #0x634]
	ldr r1, [r2, r1, lsl #2]
	eor r3, r3, r4, lsr #1
	eor r1, r3, r1
	str r1, [ip, r0, lsl #2]
	add r0, r0, #1
	cmp r0, #0xe3
	blt _02051168
	ldr r4, _02051274 ; =_020AFF88
	ldr r3, _02051278 ; =_020AFF80
	ldr r1, _0205127C ; =0x0000026F
	b _020511E8
_020511B4:
	add ip, r4, r0, lsl #2
	ldr lr, [r4, r0, lsl #2]
	ldr r2, [ip, #4]
	and lr, lr, #0x80000000
	bic r2, r2, #0x80000000
	orr lr, lr, r2
	and r2, lr, #1
	ldr ip, [ip, #-0x38c]
	ldr r2, [r3, r2, lsl #2]
	eor ip, ip, lr, lsr #1
	eor r2, ip, r2
	str r2, [r4, r0, lsl #2]
	add r0, r0, #1
_020511E8:
	cmp r0, r1
	blt _020511B4
	ldr r1, _02051274 ; =_020AFF88
	ldr r0, _02051278 ; =_020AFF80
	ldr r3, [r1, #0x9bc]
	ldr r2, [r1]
	and r3, r3, #0x80000000
	bic r2, r2, #0x80000000
	orr ip, r3, r2
	and r2, ip, #1
	ldr r3, [r1, #0x630]
	ldr r0, [r0, r2, lsl #2]
	eor r2, r3, ip, lsr #1
	eor r2, r2, r0
	ldr r0, _0205126C ; =_020AFF7C
	str r2, [r1, #0x9bc]
	mov r1, #0
	str r1, [r0]
_02051230:
	ldr r1, _0205126C ; =_020AFF7C
	ldr r2, _02051274 ; =_020AFF88
	ldr r3, [r1]
	ldr r0, _02051280 ; =0x9D2C5680
	ldr r2, [r2, r3, lsl #2]
	add ip, r3, #1
	eor r3, r2, r2, lsr #11
	and r2, r0, r3, lsl #7
	ldr r0, _02051284 ; =0xEFC60000
	eor r2, r3, r2
	and r0, r0, r2, lsl #15
	eor r0, r2, r0
	str ip, [r1]
	eor r0, r0, r0, lsr #18
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205126C: .word _020AFF7C
_02051270: .word 0x00000271
_02051274: .word _020AFF88
_02051278: .word _020AFF80
_0205127C: .word 0x0000026F
_02051280: .word 0x9D2C5680
_02051284: .word 0xEFC60000
	arm_func_end sub_02051134

	arm_func_start DungeonGoesUp
DungeonGoesUp: ; 0x02051288
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512AC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020512AC: .word DUNGEON_RESTRICTIONS
	arm_func_end DungeonGoesUp

	arm_func_start GetTurnLimit
GetTurnLimit: ; 0x020512B0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512C4 ; =_020A0C6C
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_020512C4: .word _020A0C6C
	arm_func_end GetTurnLimit

	arm_func_start DoesNotSaveWhenEntering
DoesNotSaveWhenEntering: ; 0x020512C8
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020512EC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020512EC: .word DUNGEON_RESTRICTIONS
	arm_func_end DoesNotSaveWhenEntering

	arm_func_start TreasureBoxDropsEnabled
TreasureBoxDropsEnabled: ; 0x020512F0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051314 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x400
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051314: .word DUNGEON_RESTRICTIONS
	arm_func_end TreasureBoxDropsEnabled

	arm_func_start IsLevelResetDungeon
IsLevelResetDungeon: ; 0x02051318
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205133C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205133C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsLevelResetDungeon

	arm_func_start GetMaxItemsAllowed
GetMaxItemsAllowed: ; 0x02051340
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051354 ; =_020A0C69
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051354: .word _020A0C69
	arm_func_end GetMaxItemsAllowed

	arm_func_start IsMoneyAllowed
IsMoneyAllowed: ; 0x02051358
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205137C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205137C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsMoneyAllowed

	arm_func_start GetMaxRescueAttempts
GetMaxRescueAttempts: ; 0x02051380
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051394 ; =_020A0C68
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02051394: .word _020A0C68
	arm_func_end GetMaxRescueAttempts

	arm_func_start IsRecruitingAllowed
IsRecruitingAllowed: ; 0x02051398
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020513BC ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020513BC: .word DUNGEON_RESTRICTIONS
	arm_func_end IsRecruitingAllowed

	arm_func_start GetLeaderChangeFlag
GetLeaderChangeFlag: ; 0x020513C0
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020513E4 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020513E4: .word DUNGEON_RESTRICTIONS
	arm_func_end GetLeaderChangeFlag

	arm_func_start GetRandomMovementChance
GetRandomMovementChance: ; 0x020513E8
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _020513FC ; =_020A0C6E
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_020513FC: .word _020A0C6E
	arm_func_end GetRandomMovementChance

	arm_func_start CanEnemyEvolve
CanEnemyEvolve: ; 0x02051400
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051424 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051424: .word DUNGEON_RESTRICTIONS
	arm_func_end CanEnemyEvolve

	arm_func_start GetMaxMembersAllowed
GetMaxMembersAllowed: ; 0x02051428
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205143C ; =_020A0C6A
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_0205143C: .word _020A0C6A
	arm_func_end GetMaxMembersAllowed

	arm_func_start IsIqEnabled
IsIqEnabled: ; 0x02051440
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051464 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051464: .word DUNGEON_RESTRICTIONS
	arm_func_end IsIqEnabled

	arm_func_start IsTrapInvisibleWhenAttacking
IsTrapInvisibleWhenAttacking: ; 0x02051468
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _0205148C ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #0x200
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205148C: .word DUNGEON_RESTRICTIONS
	arm_func_end IsTrapInvisibleWhenAttacking

	arm_func_start JoinedAtRangeCheck
JoinedAtRangeCheck: ; 0x02051490
	cmp r0, #0xd9
	blo _020514A4
	cmp r0, #0xe4
	movlo r0, #1
	blo _020514A8
_020514A4:
	mov r0, #0
_020514A8:
	and r0, r0, #0xff
	bx lr
	arm_func_end JoinedAtRangeCheck

	arm_func_start IsDojoDungeon
IsDojoDungeon: ; 0x020514B0
	cmp r0, #0xb4
	blo _020514C4
	cmp r0, #0xd3
	movls r0, #1
	bxls lr
_020514C4:
	mov r0, #0
	bx lr
	arm_func_end IsDojoDungeon

	arm_func_start IsFutureDungeon
IsFutureDungeon: ; 0x020514CC
	cmp r0, #0x1b
	blo _020514E0
	cmp r0, #0x21
	movls r0, #1
	bxls lr
_020514E0:
	mov r0, #0
	bx lr
	arm_func_end IsFutureDungeon

	arm_func_start IsSpecialEpisodeDungeon
IsSpecialEpisodeDungeon: ; 0x020514E8
	cmp r0, #0x7b
	blo _020514FC
	cmp r0, #0xa4
	movls r0, #1
	bxls lr
_020514FC:
	mov r0, #0
	bx lr
	arm_func_end IsSpecialEpisodeDungeon

	arm_func_start RetrieveFromItemList1
RetrieveFromItemList1: ; 0x02051504
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, _02051564 ; =0x0000270F
	mov r6, r1
	bl RandIntSafe
	mov r4, r0
	ldr r0, _02051564 ; =0x0000270F
	bl RandIntSafe
	mov r5, r0
	ldrb r0, [r7]
	cmp r0, #0xb4
	cmphs r0, #0xd3
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbFloorsPlusOne
	ldrb r1, [r7, #1]
	cmp r1, r0
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl GetItemIdFromList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02051564: .word 0x0000270F
	arm_func_end RetrieveFromItemList1

	arm_func_start IsForbiddenFloor
IsForbiddenFloor: ; 0x02051568
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl DungeonFloorToGroupFloor
	ldrb ip, [sp]
	ldrb lr, [sp, #1]
	ldr r1, _020515C0 ; =MISSION_FLOORS_FORBIDDEN
	mov r3, #0
_02051588:
	ldrb r0, [r1, r3, lsl #1]
	mov r2, r3, lsl #1
	cmp r0, #0x64
	beq _020515B8
	cmp ip, r0
	addeq r0, r1, r2
	ldreqb r0, [r0, #1]
	cmpeq lr, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	add r3, r3, #1
	b _02051588
_020515B8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020515C0: .word MISSION_FLOORS_FORBIDDEN
	arm_func_end IsForbiddenFloor

	arm_func_start sub_020515C4
sub_020515C4: ; 0x020515C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020515C4

	arm_func_start Copy16BitsFrom
Copy16BitsFrom: ; 0x020515EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strb r3, [r4]
	mov r5, r0
	mov r2, #8
	strb r3, [r4, #1]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #8
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Copy16BitsFrom

	arm_func_start sub_02051620
sub_02051620: ; 0x02051620
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051620

	arm_func_start sub_02051648
sub_02051648: ; 0x02051648
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r3, #0
	strb r3, [r4]
	mov r5, r0
	mov r2, #7
	strb r3, [r4, #1]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051648

	arm_func_start RetrieveFromItemList2
RetrieveFromItemList2: ; 0x0205167C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, _020516D8 ; =0x0000270F
	mov r6, r1
	bl RandIntSafe
	mov r5, r0
	ldr r0, _020516D8 ; =0x0000270F
	bl RandIntSafe
	mov r4, r0
	ldrb r0, [r7]
	cmp r0, #0xb4
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbFloorsPlusOne
	ldrb r1, [r7, #1]
	cmp r1, r0
	movhs r0, #0x55
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GetItemIdFromList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020516D8: .word 0x0000270F
	arm_func_end RetrieveFromItemList2

	arm_func_start IsInvalidForMission
IsInvalidForMission: ; 0x020516DC
	cmp r0, #0xb4
	movhs r0, #1
	bxhs lr
	mov r2, #0
	ldr r1, _02051718 ; =_020A1864
	b _02051704
_020516F4:
	cmp r3, r0
	moveq r0, #1
	bxeq lr
	add r2, r2, #1
_02051704:
	ldrb r3, [r1, r2]
	cmp r3, #0xb4
	bne _020516F4
	mov r0, #0
	bx lr
	.align 2, 0
_02051718: .word _020A1864
	arm_func_end IsInvalidForMission

	arm_func_start IsExpEnabledInDungeon
IsExpEnabledInDungeon: ; 0x0205171C
	mov r1, #0xc
	mul r1, r0, r1
	ldr r0, _02051740 ; =DUNGEON_RESTRICTIONS
	ldr r0, [r0, r1]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02051740: .word DUNGEON_RESTRICTIONS
	arm_func_end IsExpEnabledInDungeon

	arm_func_start IsSkyExclusiveDungeon
IsSkyExclusiveDungeon: ; 0x02051744
	cmp r0, #0x67
	blo _02051758
	cmp r0, #0xb0
	movls r0, #1
	bxls lr
_02051758:
	mov r0, #0
	bx lr
	arm_func_end IsSkyExclusiveDungeon

	arm_func_start JoinedAtRangeCheck2
JoinedAtRangeCheck2: ; 0x02051760
	cmp r0, #0xd7
	beq _02051778
	cmp r0, #0xec
	blo _02051780
	cmp r0, #0xf0
	bhi _02051780
_02051778:
	mov r0, #1
	bx lr
_02051780:
	mov r0, #0
	bx lr
	arm_func_end JoinedAtRangeCheck2

	arm_func_start sub_02051788
sub_02051788: ; 0x02051788
	ldr r1, _02051794 ; =_020A20B1
	ldrb r0, [r1, r0, lsl #1]
	bx lr
	.align 2, 0
_02051794: .word _020A20B1
	arm_func_end sub_02051788

	arm_func_start sub_02051798
sub_02051798: ; 0x02051798
	mov ip, #0
	ldr r2, _020517D0 ; =ARM9_UNKNOWN_TABLE__NA_20A20B0
	b _020517C0
_020517A4:
	add r1, r2, ip, lsl #1
	ldrb r1, [r1, #1]
	mov r3, ip, lsl #1
	cmp r0, r1
	ldreqb r0, [r2, r3]
	bxeq lr
	add ip, ip, #1
_020517C0:
	cmp ip, #0x100
	blt _020517A4
	mov r0, #0xff
	bx lr
	.align 2, 0
_020517D0: .word ARM9_UNKNOWN_TABLE__NA_20A20B0
	arm_func_end sub_02051798

	arm_func_start GetBagCapacity
GetBagCapacity: ; 0x020517D4
	ldr r1, _020517E0 ; =BAG_CAPACITY_TABLE
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020517E0: .word BAG_CAPACITY_TABLE
	arm_func_end GetBagCapacity

	arm_func_start GetBagCapacitySpecialEpisode
GetBagCapacitySpecialEpisode: ; 0x020517E4
	ldr r1, _020517F0 ; =BAG_CAPACITY_TABLE_SPECIAL_EPISODES
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020517F0: .word BAG_CAPACITY_TABLE_SPECIAL_EPISODES
	arm_func_end GetBagCapacitySpecialEpisode

	arm_func_start GetRankUpEntry
GetRankUpEntry: ; 0x020517F4
	ldr r1, _02051800 ; =RANK_UP_TABLE
	add r0, r1, r0, lsl #4
	bx lr
	.align 2, 0
_02051800: .word RANK_UP_TABLE
	arm_func_end GetRankUpEntry

	arm_func_start sub_02051804
sub_02051804: ; 0x02051804
	stmdb sp!, {r4, lr}
	add ip, r0, #0x100
	ldrsh r4, [ip, #0x40]
	mov ip, #0x14
	ldr lr, [sp, #8]
	smlabb r4, r4, ip, r0
	cmp lr, #1
	moveq r1, #0
	stmeqia r4, {r1, r2}
	streq r1, [r4, #8]
	strne r3, [r4]
	strne r2, [r4, #4]
	strne r1, [r4, #8]
	ldrneh r1, [sp, #0xc]
	str lr, [r4, #0xc]
	add r0, r0, #0x100
	str r1, [r4, #0x10]
	ldrsh r1, [r0, #0x40]
	add r1, r1, #1
	strh r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02051804

	arm_func_start sub_02051858
sub_02051858: ; 0x02051858
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x1c
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	str r0, [r7, #8]
	str r6, [r7, #0xc]
	mov r0, #1
	strb r0, [r7, #0x16]
	str r5, [r7]
	str r4, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02051858

	arm_func_start sub_02051894
sub_02051894: ; 0x02051894
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl MemFree
	mov r0, #0
	strb r0, [r4, #0x16]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02051894

	arm_func_start sub_020518BC
sub_020518BC: ; 0x020518BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	cmp r2, #0
	mov r0, #0
	bne _02051934
	cmp r1, #1
	bne _02051904
	ldr r1, _020519B0 ; =0x06018000
	ldr r2, _020519B4 ; =0x0400001C
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x9000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051904:
	cmp r1, #0
	bne _02051990
	ldr r1, _020519B8 ; =0x06010000
	ldr r2, _020519BC ; =0x04000018
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x2000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051934:
	cmp r1, #1
	bne _02051964
	ldr r1, _020519C0 ; =0x06218000
	ldr r2, _020519C4 ; =0x0400101C
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x9000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
	b _02051990
_02051964:
	cmp r1, #0
	bne _02051990
	ldr r1, _020519C8 ; =0x06210000
	ldr r2, _020519CC ; =0x04001018
	str r1, [r4, #0x10]
	str r0, [sp]
	ldr r0, [r4, #8]
	sub r3, r1, #0x2000
	mov r1, #1
	bl sub_0200B2C4
	mov r0, #1
_02051990:
	cmp r0, #0
	beq _020519A8
	ldr r0, [r4, #8]
	bl sub_0200B3D4
	ldr r0, [r4, #8]
	bl sub_0200B330
_020519A8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020519B0: .word 0x06018000
_020519B4: .word 0x0400001C
_020519B8: .word 0x06010000
_020519BC: .word 0x04000018
_020519C0: .word 0x06218000
_020519C4: .word 0x0400101C
_020519C8: .word 0x06210000
_020519CC: .word 0x04001018
	arm_func_end sub_020518BC

	arm_func_start sub_020519D0
sub_020519D0: ; 0x020519D0
	stmdb sp!, {r3, lr}
	mov r0, #0x21c
	mov r1, #0
	bl MemAlloc
	ldr r2, _02051B3C ; =_020B09B0
	mov r1, #0x21c
	str r0, [r2]
	bl MemZero
	mov r1, #0
	ldr r0, _02051B3C ; =_020B09B0
	str r1, [sp]
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x1a4
	mov r3, #0x5000000
	bl sub_0200A124
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x100
	str r2, [sp]
	add r0, r1, #0x1cc
	add r1, r1, #0x1a4
	bl sub_0200A478
	mov r1, #0
	str r1, [sp]
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0x100
	ldr r0, [r0]
	ldr r3, _02051B40 ; =0x05000400
	add r0, r0, #0x1b8
	bl sub_0200A124
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r3, #0x100
	str r2, [sp]
	add r0, r1, #0x1f4
	add r1, r1, #0x1b8
	bl sub_0200A478
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #0
	ldr r0, [r0]
	mov r3, r2
	add r1, r0, #0x1cc
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #1
	ldr r1, [r0]
	mov r3, #0
	add r0, r1, #0x18
	add r1, r1, #0x1cc
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x18
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	ldr r1, [r0]
	add r0, r1, #0x30
	add r1, r1, #0x1f4
	mov r2, #0
	mov r3, #1
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r2, #1
	ldr r1, [r0]
	mov r3, r2
	add r0, r1, #0x48
	add r1, r1, #0x1f4
	bl sub_02051858
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x30
	bl sub_020518BC
	ldr r0, _02051B3C ; =_020B09B0
	mov r1, #1
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x48
	bl sub_020518BC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051B3C: .word _020B09B0
_02051B40: .word 0x05000400
	arm_func_end sub_020519D0

	arm_func_start sub_02051B44
sub_02051B44: ; 0x02051B44
	stmdb sp!, {r3, lr}
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x18
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x30
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x48
	bl sub_02051894
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl sub_0200B314
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	bl sub_0200A4C4
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1f4
	bl sub_0200A4C4
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1a4
	bl sub_0200A158
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1b8
	bl sub_0200A158
	ldr r0, _02051C20 ; =_020B09B0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02051C20 ; =_020B09B0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051C20: .word _020B09B0
	arm_func_end sub_02051B44

	arm_func_start sub_02051C24
sub_02051C24: ; 0x02051C24
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl sub_0200B340
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	bl sub_0200A510
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1f4
	bl sub_0200A510
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1a4
	bl sub_0200A184
	ldr r0, _02051D64 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1b8
	bl sub_0200A184
	ldr r0, _02051D64 ; =_020B09B0
	mov r6, #0
	ldr r0, [r0]
	mov r8, r6
	add r4, r0, #0x60
	add r0, r4, #0x100
	ldrsh r5, [r0, #0x40]
	mov r7, #0x14
	b _02051D3C
_02051CE4:
	smlabb r2, r6, r7, r4
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _02051D20
	ldr r1, [r2, #0xc]
	cmp r1, #0
	bne _02051D10
	ldr r1, [r2, #8]
	ldr r2, [r2]
	bl ArrayCopy32
	b _02051D30
_02051D10:
	cmp r1, #1
	bne _02051D30
	bl MemFree
	b _02051D30
_02051D20:
	ldr r1, [r2, #8]
	ldr r2, [r2]
	mov r0, r8
	bl ArrayFill32
_02051D30:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02051D3C:
	cmp r6, r5
	blt _02051CE4
	ldr r0, _02051D64 ; =_020B09B0
	mov r2, #0
	ldr r1, [r0]
	mov r0, #8
	add r1, r1, #0x100
	strh r2, [r1, #0xa0]
	bl sub_020030FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02051D64: .word _020B09B0
	arm_func_end sub_02051C24

	arm_func_start sub_02051D68
sub_02051D68: ; 0x02051D68
	ldr r2, _02051D84 ; =_020B09B0
	mov r1, #0x28
	ldr r2, [r2]
	ldr ip, _02051D88 ; =sub_0200A504
	add r2, r2, #0x1cc
	mla r0, r1, r0, r2
	bx ip
	.align 2, 0
_02051D84: .word _020B09B0
_02051D88: .word sub_0200A504
	arm_func_end sub_02051D68

	arm_func_start sub_02051D8C
sub_02051D8C: ; 0x02051D8C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02051DCC ; =_020B09B0
	str r1, [sp, #4]
	ldr ip, [ip]
	ldr lr, [sp, #0x10]
	mov r1, #0x30
	mla ip, lr, r1, ip
	mov r1, #0x18
	mla r1, r3, r1, ip
	str r0, [sp]
	ldr r0, [r1, #8]
	add r1, sp, #0
	bl sub_0200B3FC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051DCC: .word _020B09B0
	arm_func_end sub_02051D8C

	arm_func_start sub_02051DD0
sub_02051DD0: ; 0x02051DD0
	stmdb sp!, {r3, lr}
	ldr r3, _02051DF8 ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bl sub_0200B3D4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051DF8: .word _020B09B0
	arm_func_end sub_02051DD0

	arm_func_start sub_02051DFC
sub_02051DFC: ; 0x02051DFC
	ldr r3, _02051E1C ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_02051E1C: .word _020B09B0
	arm_func_end sub_02051DFC

	arm_func_start sub_02051E20
sub_02051E20: ; 0x02051E20
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02051E5C ; =_020B09B0
	str r1, [sp, #4]
	ldr ip, [ip]
	mov r1, #0x30
	mla ip, r3, r1, ip
	mov r1, #0x18
	mla r1, r2, r1, ip
	str r0, [sp]
	ldr r0, [r1, #8]
	add r1, sp, #0
	bl sub_0200B3C0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051E5C: .word _020B09B0
	arm_func_end sub_02051E20

	arm_func_start sub_02051E60
sub_02051E60: ; 0x02051E60
	stmdb sp!, {r3, lr}
	ldr r3, _02051E88 ; =_020B09B0
	mov r2, #0x30
	ldr ip, [r3]
	mov r3, #0x18
	mla r2, r1, r2, ip
	mla r1, r0, r3, r2
	ldr r0, [r1, #8]
	bl sub_0200B330
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051E88: .word _020B09B0
	arm_func_end sub_02051E60

	arm_func_start GetBgRegionArea
GetBgRegionArea: ; 0x02051E8C
	stmdb sp!, {r3, lr}
	ldr ip, _02051EB4 ; =_020B09B0
	mov r3, #0x30
	ldr lr, [ip]
	mov ip, #0x18
	mla r3, r2, r3, lr
	mla r2, r1, ip, r3
	ldr r1, [r2, #0x10]
	add r0, r1, r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051EB4: .word _020B09B0
	arm_func_end GetBgRegionArea

	arm_func_start sub_02051EB8
sub_02051EB8: ; 0x02051EB8
	ldr r2, _02051ED0 ; =_020B09B0
	mov r1, #0x14
	ldr r2, [r2]
	add r2, r2, #0x1a4
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02051ED0: .word _020B09B0
	arm_func_end sub_02051EB8

	arm_func_start sub_02051ED4
sub_02051ED4: ; 0x02051ED4
	ldr r2, _02051EEC ; =_020B09B0
	mov r1, #0x28
	ldr r2, [r2]
	add r2, r2, #0x1cc
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02051EEC: .word _020B09B0
	arm_func_end sub_02051ED4

	arm_func_start sub_02051EF0
sub_02051EF0: ; 0x02051EF0
	stmdb sp!, {r3, lr}
	cmp r3, #0
	beq _02051F4C
	ldrb lr, [r0]
	mov ip, #0xff
	ldrb lr, [r3, lr, lsl #2]
	mul lr, r2, lr
	mov lr, lr, lsr #8
	strb lr, [sp]
	ldrb lr, [r0, #1]
	add lr, r3, lr, lsl #2
	ldrb lr, [lr, #1]
	mul lr, r2, lr
	mov lr, lr, lsr #8
	strb lr, [sp, #1]
	ldrb r0, [r0, #2]
	add r0, r3, r0, lsl #2
	ldrb r0, [r0, #2]
	mul r0, r2, r0
	mov r0, r0, lsr #8
	strb r0, [sp, #2]
	strb ip, [sp, #3]
	b _02051F84
_02051F4C:
	ldrb ip, [r0]
	mov r3, #0xff
	mul lr, ip, r2
	mov ip, lr, lsr #8
	strb ip, [sp]
	ldrb ip, [r0, #1]
	mul lr, ip, r2
	mov ip, lr, lsr #8
	strb ip, [sp, #1]
	ldrb r0, [r0, #2]
	mul r2, r0, r2
	mov r0, r2, lsr #8
	strb r0, [sp, #2]
	strb r3, [sp, #3]
_02051F84:
	ldr r0, _02051FB0 ; =_020B09B0
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	ldr r2, [sp, #8]
	add r3, r0, #0x1cc
	mov r0, #0x28
	mla r0, r2, r0, r3
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051FB0: .word _020B09B0
	arm_func_end sub_02051EF0

	arm_func_start sub_02051FB4
sub_02051FB4: ; 0x02051FB4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	str r3, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr ip, _02051FEC ; =_020B09B0
	mov r3, r2
	mov r2, r1
	ldr ip, [ip]
	mov r1, r0
	add r0, ip, #0x60
	bl sub_02051804
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02051FEC: .word _020B09B0
	arm_func_end sub_02051FB4

	arm_func_start sub_02051FF0
sub_02051FF0: ; 0x02051FF0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r3, r0
	mov r5, r1
	add r0, sp, #0
	mov r1, r3
	bl LoadFileFromRom
	ldr r0, [sp]
	bl GetAtSize
	mov r4, r0
	cmp r4, #0
	ldrle r0, [sp]
	strle r0, [r5]
	ldrle r4, [sp, #4]
	ble _02052054
	mov r1, #0
	bl MemAlloc
	mov r1, r4
	ldr r2, [sp]
	mov r4, r0
	bl DecompressAtNormalVeneer
	str r4, [r5]
	add r0, sp, #0
	ldr r4, [r4, #0xc]
	bl UnloadFile
_02052054:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02051FF0

	arm_func_start sub_02052060
sub_02052060: ; 0x02052060
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r4, _020522E4 ; =_020B09B0
	mov sl, r1
	ldr r7, [sp, #0x54]
	ldr r4, [r4]
	mov r1, #0x30
	mla r4, r7, r1, r4
	ldr fp, [sp, #0x50]
	mov r1, #0x18
	mla r4, fp, r1, r4
	mov sb, r2
	add r1, sp, #0x28
	mov r2, #0xf
	mov r8, r3
	ldr r5, [r4, #0x10]
	bl sub_02051FF0
	mov r3, r0
	ldr r4, [sp, #0x28]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _020522E4 ; =_020B09B0
	ldr r2, [r4, #8]
	ldr r0, [r0]
	add r1, r5, sl
	add r2, r4, r2
	add r0, r0, #0x60
	bl sub_02051804
	mov r0, #1
	str r0, [sp]
	mov r1, #0
	ldr r0, _020522E4 ; =_020B09B0
	str r1, [sp, #4]
	ldr r0, [r0]
	mov r2, r4
	mov r3, r1
	add r0, r0, #0x60
	bl sub_02051804
	ldr r1, [sp, #0x28]
	rsb r0, sb, #0x20
	mov r0, r0, lsl #0x10
	ldr r1, [r1, #0x10]
	str r0, [sp, #0x18]
	add r0, r4, r1
	str r0, [sp, #0xc]
	mov r5, #0
	b _020521CC
_02052120:
	mov r6, #0
	mov r0, r6
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r1, sb, lsl #0x10
	add r0, r0, sb, lsl #6
	str r0, [sp, #0x10]
	mov r0, r1, asr #0x10
	str r0, [sp, #0x14]
_02052144:
	ldr r0, [sp, #0x10]
	mov r1, r6, lsl #1
	ldrh r1, [r1, r0]
	ldr r2, _020522E8 ; =0x00000FFF
	mov r0, r6, lsl #0x10
	and r2, r1, r2
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #4
	mov r2, r2, lsr #0x10
	add r1, r8, r1, lsr #16
	add r2, r2, sl, lsr #5
	mov r1, r1, lsl #0x1c
	mov r2, r2, lsl #0x10
	mov r1, r1, lsr #0x10
	orr r1, r1, r2, lsr #16
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r1, [sp, #0x14]
	mov r0, r0, asr #0x10
	str r7, [sp]
	mov r3, fp
	bl sub_02051D8C
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #8]
	cmp r0, #0x20
	blo _02052144
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	add sb, sb, #1
_020521CC:
	ldr r0, [sp, #0x18]
	cmp r5, r0, lsr #16
	blo _02052120
	mov r0, fp
	mov r1, r7
	bl sub_02051E60
	ldr r0, [sp, #0x28]
	ldr r3, _020522EC ; =ARM9_UNKNOWN_PTR__NA_20A2C84
	ldr r0, [r0]
	add r2, sp, #0x1c
	add r5, r4, r0
	mov r4, #0
	mov r1, #4
_02052200:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052200
	mov r0, #0x28
	mul r6, r7, r0
	b _020522B0
_0205221C:
	add r3, sp, #0x1c
	add r2, sp, #0x20
	mov r1, #4
_02052228:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052228
	ldrb r0, [r5]
	add r3, sp, #0x20
	add r2, sp, #0x24
	strb r0, [sp, #0x20]
	ldrb r0, [r5, #1]
	mov r1, #4
	strb r0, [sp, #0x21]
	ldrb r0, [r5, #2]
	strb r0, [sp, #0x22]
	ldrb r0, [r5, #3]
	strb r0, [sp, #0x23]
_02052264:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02052264
	add r0, r4, r8, lsl #4
	cmp r0, #0x100
	bge _020522C8
	ldr r1, _020522E4 ; =_020B09B0
	mov r0, r0, lsl #0x10
	ldr r1, [r1]
	mov r0, r0, asr #0x10
	add r3, r1, #0x1cc
	mov r1, r0, lsl #0x10
	add r2, sp, #0x24
	add r0, r3, r6
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	add r4, r4, #1
	add r5, r5, #4
_020522B0:
	ldr r0, [sp, #0x28]
	ldr r1, [r0, #4]
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r4, r0, asr #2
	blt _0205221C
_020522C8:
	ldr r0, _020522E4 ; =_020B09B0
	ldr r0, [r0]
	add r0, r0, #0x1cc
	add r0, r0, r6
	bl sub_0200A504
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020522E4: .word _020B09B0
_020522E8: .word 0x00000FFF
_020522EC: .word ARM9_UNKNOWN_PTR__NA_20A2C84
	arm_func_end sub_02052060

	arm_func_start sub_020522F0
sub_020522F0: ; 0x020522F0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_02051FF0
	str r0, [r4, #8]
	ldr r1, [r4]
	ldr r0, [r1, #8]
	add r0, r1, r0
	str r0, [r4, #4]
	ldr r0, [r4]
	ldr r0, [r0, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020522F0

	arm_func_start sub_02052334
sub_02052334: ; 0x02052334
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02052334

	arm_func_start LoadMonsterMd
LoadMonsterMd: ; 0x02052358
	stmdb sp!, {r3, lr}
	ldr r0, _02052388 ; =_020B09C0
	ldr r1, _0205238C ; =_020A31B8
	mov r2, #0
	bl LoadFileFromRom
	bl LoadM2nAndN2m
	ldr r0, _02052390 ; =_020B09B4
	ldr r1, [r0, #0xc]
#ifdef EUROPE
	str r1, [r0, #8]
#else
	str r1, [r0, #4]
#endif
	add r1, r1, #8
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052388: .word _020B09C0
_0205238C: .word _020A31B8
_02052390: .word _020B09B4
	arm_func_end LoadMonsterMd

	arm_func_start GetNameRaw
GetNameRaw: ; 0x02052394
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	mov r2, #0x14
	bl strncpy
	ldmia sp!, {r4, pc}
	arm_func_end GetNameRaw

	arm_func_start GetName
GetName: ; 0x020523D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r1, #0x258
	mov r4, r2
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r2, r4
	ldr r1, _02052414 ; =_020A31D4
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02052414: .word _020A31D4
	arm_func_end GetName

	arm_func_start SprintfStatic__02052418
SprintfStatic__02052418: ; 0x02052418
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02052418

	arm_func_start GetNameWithGender
GetNameWithGender: ; 0x02052440
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
#endif
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r1, #0x258
	mov r4, r2
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldr r2, _020524F4 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	mov r3, r0
	smlabb r0, r5, r1, r2
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	cmpne r5, #0x1d
	cmpne r5, #0x20
	bne _020524B0
	ldr r1, _020524F8 ; =_020A31D4
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
#ifdef JAPAN
	ldmia sp!, {r4, r5, r6, pc}
#else
	b _020524EC
#endif
_020524B0:
	cmp r0, #2
	bne _020524D4
	ldr r1, _020524FC ; =_020A31E4
#ifdef JAPAN
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
	ldmia sp!, {r4, r5, r6, pc}
_020524D4:
	ldr r1, _02052838_JP ; =_020A45C8_JP
	mov r0, r6
	mov r2, r4
	bl SprintfStatic__02052418
	ldmia sp!, {r4, r5, r6, pc}
#else
	mov r5, #0xbe
	mov r0, r6
	mov r2, r4
	str r5, [sp]
	bl SprintfStatic__02052418
	b _020524EC
_020524D4:
	ldr r1, _020524FC ; =_020A31E4
	mov r5, #0xbd
	mov r0, r6
	mov r2, r4
	str r5, [sp]
	bl SprintfStatic__02052418
_020524EC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
#endif
	.align 2, 0
_020524F4: .word _020B09B4
_020524F8: .word _020A31D4
_020524FC: .word _020A31E4
#ifdef JAPAN
_02052838_JP: .word _020A45C8_JP
#endif
	arm_func_end GetNameWithGender

	arm_func_start GetSpeciesString
GetSpeciesString: ; 0x02052500
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl GetBaseForm
	cmp r0, #0xc9
	bne _02052684
	cmp r4, #0xca
	moveq r4, #1
	beq _02052660
	cmp r4, #0xcb
	moveq r4, #2
	beq _02052660
	cmp r4, #0xcc
	moveq r4, #3
	beq _02052660
	cmp r4, #0xcd
	moveq r4, #4
	beq _02052660
	cmp r4, #0xce
	moveq r4, #5
	beq _02052660
	cmp r4, #0xcf
	moveq r4, #6
	beq _02052660
	cmp r4, #0xd0
	moveq r4, #7
	beq _02052660
	cmp r4, #0xd1
	moveq r4, #8
	beq _02052660
	cmp r4, #0xd2
	moveq r4, #9
	beq _02052660
	cmp r4, #0xd3
	moveq r4, #0xa
	beq _02052660
	cmp r4, #0xd4
	moveq r4, #0xb
	beq _02052660
	cmp r4, #0xd5
	moveq r4, #0xc
	beq _02052660
	cmp r4, #0xd6
	moveq r4, #0xd
	beq _02052660
	cmp r4, #0xd7
	moveq r4, #0xe
	beq _02052660
	cmp r4, #0xd8
	moveq r4, #0xf
	beq _02052660
	cmp r4, #0xd9
	moveq r4, #0x10
	beq _02052660
	cmp r4, #0xda
	moveq r4, #0x11
	beq _02052660
	cmp r4, #0xdb
	moveq r4, #0x12
	beq _02052660
	cmp r4, #0xdc
	moveq r4, #0x13
	beq _02052660
	cmp r4, #0xdd
	moveq r4, #0x14
	beq _02052660
	cmp r4, #0xde
	moveq r4, #0x15
	beq _02052660
	cmp r4, #0xdf
	moveq r4, #0x16
	beq _02052660
	cmp r4, #0xe0
	moveq r4, #0x17
	beq _02052660
	cmp r4, #0xe1
	moveq r4, #0x18
	beq _02052660
	cmp r4, #0xe2
	moveq r4, #0x19
	beq _02052660
	cmp r4, #0xe3
	moveq r4, #0x1a
	beq _02052660
	cmp r4, #0xe4
	moveq r4, #0x1b
	movne r4, #0
_02052660:
	ldr r0, _020526B8 ; =0x000022E8
	bl StringFromId
	ldr r1, _020526BC ; =UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE
	mov r2, r0
	ldr r3, [r1, r4, lsl #2]
	ldr r1, _020526C0 ; =_020A31F4
	mov r0, r5
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
_02052684:
	mov r0, r4
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _020526C4 ; =_020A31FC
	mov r0, r5
	bl SprintfStatic__02052418
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
_020526B8: .word 0x000022EA
#elif defined(JAPAN)
_020526B8: .word 0x00001659
#else
_020526B8: .word 0x000022E8
#endif
_020526BC: .word UNOWN_SPECIES_ADDITIONAL_CHAR_PTR_TABLE
_020526C0: .word _020A31F4
_020526C4: .word _020A31FC
	arm_func_end GetSpeciesString

	arm_func_start GetNameString
GetNameString: ; 0x020526C8
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x21
	add r0, r0, #0x2200
#elif defined(JAPAN)
	add r0, r1, #0x590
	add r0, r0, #0x1000
#else
	add r0, r1, #0x1f
	add r0, r0, #0x2200
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldmia sp!, {r3, pc}
	arm_func_end GetNameString

	arm_func_start GetSpriteIndex__020526EC
GetSpriteIndex__020526EC: ; 0x020526EC
	ldr r2, _02052704 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02052704: .word _020B09B4
	arm_func_end GetSpriteIndex__020526EC

	arm_func_start GetSpriteIndex__02052708
GetSpriteIndex__02052708: ; 0x02052708
	ldr r2, _02052720 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02052720: .word _020B09B4
	arm_func_end GetSpriteIndex__02052708

	arm_func_start GetSpriteIndex__02052724
GetSpriteIndex__02052724: ; 0x02052724
	ldr r2, _0205273C ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0205273C: .word _020B09B4
	arm_func_end GetSpriteIndex__02052724

	arm_func_start GetDexNumber
GetDexNumber: ; 0x02052740
	ldr r2, _02052758 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #4]
	bx lr
	.align 2, 0
_02052758: .word _020B09B4
	arm_func_end GetDexNumber

	arm_func_start GetCategoryString
GetCategoryString: ; 0x0205275C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl AllocateTemp1024ByteBufferFromPool
	mov r4, r0
	mov r0, r5
	mov r1, #0x258
	bl _s32_div_f
#if defined(EUROPE)
	add r0, r1, #0x79
	add r0, r0, #0x2400
#elif defined(JAPAN)
	add r0, r1, #0x1a40
#else
	add r0, r1, #0x77
	add r0, r0, #0x2400
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _020527A4 ; =_020A3200
	mov r0, r4
	bl SprintfStatic__02052418
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020527A4: .word _020A3200
	arm_func_end GetCategoryString

	arm_func_start GetMonsterGender
GetMonsterGender: ; 0x020527A8
	ldr r2, _020527C0 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x12]
	bx lr
	.align 2, 0
_020527C0: .word _020B09B4
	arm_func_end GetMonsterGender

	arm_func_start GetBodySize
GetBodySize: ; 0x020527C4
	ldr r2, _020527DC ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x13]
	bx lr
	.align 2, 0
_020527DC: .word _020B09B4
	arm_func_end GetBodySize

	arm_func_start GetSpriteSize
GetSpriteSize: ; 0x020527E0
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	ldr r2, _02052818 ; =MONSTER_SPRITE_DATA
	mov r0, r0, asr #0x10
	ldrb r0, [r2, r0, lsl #1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #6
	movls r0, #6
	ldrhib r0, [r2, r1, lsl #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052818: .word MONSTER_SPRITE_DATA
	arm_func_end GetSpriteSize

	arm_func_start GetSpriteFileSize
GetSpriteFileSize: ; 0x0205281C
	stmdb sp!, {r3, lr}
	mov r1, #0x258
	bl _s32_div_f
	ldr r0, _02052838 ; =_020A2D09
	ldrb r0, [r0, r1, lsl #1]
	mov r0, r0, lsl #9
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052838: .word _020A2D09
	arm_func_end GetSpriteFileSize

	arm_func_start GetShadowSize
GetShadowSize: ; 0x0205283C
	ldr r2, _02052854 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x2e]
	bx lr
	.align 2, 0
_02052854: .word _020B09B4
	arm_func_end GetShadowSize

	arm_func_start GetSpeedStatus
GetSpeedStatus: ; 0x02052858
	ldr r2, _02052870 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #6]
	bx lr
	.align 2, 0
_02052870: .word _020B09B4
	arm_func_end GetSpeedStatus

	arm_func_start GetMobilityType
GetMobilityType: ; 0x02052874
	ldr r2, _0205288C ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x16]
	bx lr
	.align 2, 0
_0205288C: .word _020B09B4
	arm_func_end GetMobilityType

	arm_func_start GetRegenSpeed
GetRegenSpeed: ; 0x02052890
	ldr r2, _020528B0 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x30]
	mov r0, r0, lsl #1
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020528B0: .word _020B09B4
	arm_func_end GetRegenSpeed

	arm_func_start GetCanMoveFlag
GetCanMoveFlag: ; 0x020528B4
	ldr r2, _020528DC ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x1a]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020528DC: .word _020B09B4
	arm_func_end GetCanMoveFlag

	arm_func_start GetChanceAsleep
GetChanceAsleep: ; 0x020528E0
	ldr r2, _020528F8 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x2f]
	bx lr
	.align 2, 0
_020528F8: .word _020B09B4
	arm_func_end GetChanceAsleep

	arm_func_start GetWeightMultiplier
GetWeightMultiplier: ; 0x020528FC
	ldr r2, _02052914 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x28]
	bx lr
	.align 2, 0
_02052914: .word _020B09B4
	arm_func_end GetWeightMultiplier

	arm_func_start GetSize
GetSize: ; 0x02052918
	ldr r2, _02052930 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x2a]
	bx lr
	.align 2, 0
_02052930: .word _020B09B4
	arm_func_end GetSize

	arm_func_start GetBaseHp
GetBaseHp: ; 0x02052934
	ldr r2, _0205294C ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x20]
	bx lr
	.align 2, 0
_0205294C: .word _020B09B4
	arm_func_end GetBaseHp

	arm_func_start CanThrowItems
CanThrowItems: ; 0x02052950
	ldr r2, _02052978 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x1a]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02052978: .word _020B09B4
	arm_func_end CanThrowItems

	arm_func_start CanEvolve
CanEvolve: ; 0x0205297C
	ldr r2, _020529A4 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x1a]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020529A4: .word _020B09B4
	arm_func_end CanEvolve

	arm_func_start GetMonsterPreEvolution
GetMonsterPreEvolution: ; 0x020529A8
	ldr r2, _020529C0 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #8]
	bx lr
	.align 2, 0
_020529C0: .word _020B09B4
	arm_func_end GetMonsterPreEvolution

	arm_func_start GetBaseOffensiveStat
GetBaseOffensiveStat: ; 0x020529C4
	ldr r3, _020529E0 ; =_020B09B4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x24]
	bx lr
	.align 2, 0
_020529E0: .word _020B09B4
	arm_func_end GetBaseOffensiveStat

	arm_func_start GetBaseDefensiveStat
GetBaseDefensiveStat: ; 0x020529E4
	ldr r3, _02052A00 ; =_020B09B4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x26]
	bx lr
	.align 2, 0
_02052A00: .word _020B09B4
	arm_func_end GetBaseDefensiveStat

	arm_func_start GetType
GetType: ; 0x02052A04
	ldr r3, _02052A20 ; =_020B09B4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_02052A20: .word _020B09B4
	arm_func_end GetType

	arm_func_start GetAbility
GetAbility: ; 0x02052A24
	ldr r3, _02052A40 ; =_020B09B4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x18]
	bx lr
	.align 2, 0
_02052A40: .word _020B09B4
	arm_func_end GetAbility

	arm_func_start GetRecruitRate2
GetRecruitRate2: ; 0x02052A44
	ldr r2, _02052A5C ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x22]
	bx lr
	.align 2, 0
_02052A5C: .word _020B09B4
	arm_func_end GetRecruitRate2

	arm_func_start GetRecruitRate1
GetRecruitRate1: ; 0x02052A60
	ldr r2, _02052A78 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x1e]
	bx lr
	.align 2, 0
_02052A78: .word _020B09B4
	arm_func_end GetRecruitRate1

	arm_func_start GetExp
GetExp: ; 0x02052A7C
	stmdb sp!, {r4, lr}
	ldr r2, _02052AAC ; =_020B09B4
	sub r3, r1, #1
	ldr r2, [r2]
	mov r1, #0x44
	smlabb r0, r0, r1, r2
	ldrsh r4, [r0, #0x1c]
	mov r1, #0xa
	mul r0, r4, r3
	bl _s32_div_f
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02052AAC: .word _020B09B4
	arm_func_end GetExp

	arm_func_start GetEvoParameters
GetEvoParameters: ; 0x02052AB0
	ldr r3, _02052ADC ; =_020B09B4
	mov r2, #0x44
	ldr ip, [r3]
	mov r3, #4
	smlabb r1, r1, r2, ip
	add r2, r1, #8
_02052AC8:
	ldrh r1, [r2], #2
	subs r3, r3, #1
	strh r1, [r0], #2
	bne _02052AC8
	bx lr
	.align 2, 0
_02052ADC: .word _020B09B4
	arm_func_end GetEvoParameters

	arm_func_start GetTreasureBoxChances
GetTreasureBoxChances: ; 0x02052AE0
	stmdb sp!, {r4, lr}
	mov r2, #0x44
	smulbb r4, r0, r2
	ldr r2, _02052B24 ; =_020B09B4
	mov lr, #0
_02052AF4:
	ldr r3, [r2]
	add r0, lr, #1
	add r3, r4, r3
	add r3, r3, lr, lsl #1
	ldrsh r3, [r3, #0x3c]
	mov r0, r0, lsl #0x10
	mov ip, lr, lsl #1
	mov lr, r0, asr #0x10
	strh r3, [r1, ip]
	cmp lr, #4
	blt _02052AF4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02052B24: .word _020B09B4
	arm_func_end GetTreasureBoxChances

	arm_func_start GetIqGroup
GetIqGroup: ; 0x02052B28
	ldr r2, _02052B40 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x17]
	bx lr
	.align 2, 0
_02052B40: .word _020B09B4
	arm_func_end GetIqGroup

	arm_func_start GetSpawnThreshold
GetSpawnThreshold: ; 0x02052B44
	ldr r2, _02052B5C ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x31]
	bx lr
	.align 2, 0
_02052B5C: .word _020B09B4
	arm_func_end GetSpawnThreshold

	arm_func_start NeedsItemToSpawn
NeedsItemToSpawn: ; 0x02052B60
	ldr r2, _02052B88 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x1a]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02052B88: .word _020B09B4
	arm_func_end NeedsItemToSpawn

	arm_func_start GetExclusiveItem
GetExclusiveItem: ; 0x02052B8C
	ldr r2, _02052BB4 ; =_020B09B4
	mov r3, r1, lsr #0x1f
	ldr ip, [r2]
	mov r2, #0x44
	rsb r1, r3, r1, lsl #30
	smlabb r2, r0, r2, ip
	add r0, r3, r1, ror #30
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0x34]
	bx lr
	.align 2, 0
_02052BB4: .word _020B09B4
	arm_func_end GetExclusiveItem

	arm_func_start GetFamilyIndex
GetFamilyIndex: ; 0x02052BB8
	ldr r2, _02052BD0 ; =_020B09B4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x32]
	bx lr
	.align 2, 0
_02052BD0: .word _020B09B4
	arm_func_end GetFamilyIndex

	arm_func_start LoadM2nAndN2m
LoadM2nAndN2m: ; 0x02052BD4
	stmdb sp!, {r3, lr}
#ifdef EUROPE
	sub sp, sp, #0x100
#endif
	ldr r0, _02052C2C ; =_020B09C8
	bl PointsToZero
	cmp r0, #0
	beq _02052C00
#ifdef EUROPE
	bl GetLanguage
	mov r2, r0
	ldr r1, _02052FA8 ; =_020B12F4_EU
	add r0, sp, #0
	ldr r2, [r1, r2, lsl #2]
	ldr r1, _02052FAC ; =_020A3210
	bl SprintfStatic__02052418
#endif
	ldr r0, _02052C2C ; =_020B09C8
	bl ZInit8
	ldr r0, _02052C2C ; =_020B09C8
#ifdef EUROPE
	add r1, sp, #0
#else
	ldr r1, _02052C30 ; =_020A3210
#endif
	mov r2, #0
	bl LoadFileFromRom
_02052C00:
	ldr r0, _02052C34 ; =_020B09D0
	bl PointsToZero
	cmp r0, #0
#ifdef EUROPE
	beq _02052F9C
	bl GetLanguage
	mov r2, r0
	ldr r1, _02052FB4 ; =_020B1308_EU
	add r0, sp, #0
	ldr r2, [r1, r2, lsl #2]
	ldr r1, _02052FAC ; =_020A3210
	bl SprintfStatic__02052418
#else
	ldmeqia sp!, {r3, pc}
#endif
	ldr r0, _02052C34 ; =_020B09D0
	bl ZInit8
	ldr r0, _02052C34 ; =_020B09D0
#ifdef EUROPE
	add r1, sp, #0
#else
	ldr r1, _02052C38 ; =_020A322C
#endif
	mov r2, #0
	bl LoadFileFromRom
#ifdef EUROPE
_02052F9C:
	add sp, sp, #0x100
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052C2C: .word _020B09C8
#ifdef EUROPE
_02052FA8: .word _020B12F4_EU
_02052FAC: .word _020A3210
#else
_02052C30: .word _020A3210
#endif
_02052C34: .word _020B09D0
#ifdef EUROPE
_02052FB4: .word _020B1308_EU
#else
_02052C38: .word _020A322C
#endif
	arm_func_end LoadM2nAndN2m

	arm_func_start sub_02052C3C
sub_02052C3C: ; 0x02052C3C
	stmdb sp!, {r3, lr}
	ldr r1, _02052C68 ; =TEAM_MEMBER_TABLE
	ldr r0, _02052C6C ; =TEAM_MEMBER_TABLE_PTR
	str r1, [r0]
	bl LoadMonsterMd
	ldr r0, _02052C70 ; =LEVEL_UP_DATA_MONSTER_ID
	mov r1, #0
	strh r1, [r0]
	bl sub_020550DC
	bl sub_020560B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052C68: .word TEAM_MEMBER_TABLE
_02052C6C: .word TEAM_MEMBER_TABLE_PTR
_02052C70: .word LEVEL_UP_DATA_MONSTER_ID
	arm_func_end sub_02052C3C

	arm_func_start sub_02052C74
sub_02052C74: ; 0x02052C74
	stmdb sp!, {r3, lr}
	bl sub_020550E0
	bl RemoveActiveMembersFromAllTeams
	ldr r2, _02052CD4 ; =TEAM_MEMBER_TABLE_PTR
	mov lr, #0
	ldr r0, [r2]
	mov r3, lr
	add r0, r0, #0x9000
	str lr, [r0, #0x878]
	str lr, [r0, #0x87c]
	mov r0, #0x44
_02052CA0:
	mul ip, lr, r0
	ldr r1, [r2]
	add lr, lr, #1
	add r1, r1, ip
	add r1, r1, #0x9800
	strh r3, [r1, #0x9c]
	ldr r1, [r2]
	cmp lr, #4
	add r1, r1, ip
	add r1, r1, #0x9000
	strb r3, [r1, #0x898]
	blt _02052CA0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02052CD4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02052C74

	arm_func_start sub_02052CD8
sub_02052CD8: ; 0x02052CD8
	stmdb sp!, {r3, lr}
	bl sub_02055118
	bl RemoveActiveMembersFromSpecialEpisodeTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_02052CD8

	arm_func_start sub_02052CE8
sub_02052CE8: ; 0x02052CE8
	ldr ip, _02052CF0 ; =RemoveActiveMembersFromRescueTeam
	bx ip
	.align 2, 0
_02052CF0: .word RemoveActiveMembersFromRescueTeam
	arm_func_end sub_02052CE8

	arm_func_start sub_02052CF4
sub_02052CF4: ; 0x02052CF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	mov r4, #1
	mov r7, r1
	strb r4, [r8]
	mov r0, r7
	strb r4, [r8, #1]
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x38]
	bl GetBaseHp
	strh r0, [r8, #0xa]
	mov r0, r7
	mov r1, #0
	bl GetBaseOffensiveStat
	strb r0, [r8, #0xc]
	mov r0, r7
	mov r1, #1
	bl GetBaseOffensiveStat
	strb r0, [r8, #0xd]
	mov r0, r7
	mov r1, #0
	bl GetBaseDefensiveStat
	strb r0, [r8, #0xe]
	mov r0, r7
	mov r1, #1
	bl GetBaseDefensiveStat
	strb r0, [r8, #0xf]
	strh r7, [r8, #4]
	mov r3, #0
	str r3, [r8, #0x10]
	strb r3, [r8, #0x20]
	mov r0, #1
	strh r0, [r8, #8]
	ldrb r2, [r5]
	add r0, r8, #0x14
	mov r1, r7
	strb r2, [r8, #2]
	ldrb r2, [r5, #1]
	strb r2, [r8, #3]
	strb r3, [r8, #6]
	strb r3, [r8, #7]
	ldrsh r2, [r8, #8]
	bl EnableAllLearnableIqSkills
	cmp r4, #0
	beq _02052DDC
	mov r3, #0
	add r1, sp, #0
_02052DB8:
	mov r2, r3, lsl #1
	ldrh r0, [r4, r2]
	add r3, r3, #1
	cmp r3, #4
	strh r0, [r1, r2]
	blt _02052DB8
	add r0, r8, #0x22
	bl GetInfoGroundMoveset
	b _02052DEC
_02052DDC:
	ldrb r2, [sp, #0x3c]
	mov r1, r7
	add r0, r8, #0x22
	bl sub_02053F10
_02052DEC:
	cmp r6, #0
	bne _02052E14
	add r0, sp, #8
	mov r1, r7
	bl GetNameRaw
	add r1, sp, #8
	add r0, r8, #0x3a
	mov r2, #0xa
	bl StrncpyName
	b _02052E24
_02052E14:
	mov r1, r6
	add r0, r8, #0x3a
	mov r2, #0xa
	bl StrncpySimple
_02052E24:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02052CF4

	arm_func_start sub_02052E2C
sub_02052E2C: ; 0x02052E2C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_02052CF4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02052E2C

	arm_func_start GuestMonsterToGroundMonster
GuestMonsterToGroundMonster: ; 0x02052E50
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	strb r0, [r5]
	ldrsh r1, [r4, #0x12]
	mov r2, #0
	add r0, r5, #0x14
	strb r1, [r5, #1]
	ldrsh r1, [r4, #0x10]
	strh r1, [r5, #0xa]
	ldrsh r1, [r4, #0x16]
	strb r1, [r5, #0xc]
	ldrsh r1, [r4, #0x18]
	strb r1, [r5, #0xd]
	ldrsh r1, [r4, #0x1a]
	strb r1, [r5, #0xe]
	ldrsh r1, [r4, #0x1c]
	strb r1, [r5, #0xf]
	ldrsh r1, [r4, #4]
	strh r1, [r5, #4]
	ldr r1, [r4, #0x20]
	str r1, [r5, #0x10]
	strb r2, [r5, #0x20]
	ldrsh r1, [r4, #0x14]
	strh r1, [r5, #8]
	ldrb r1, [r4, #6]
	strb r1, [r5, #2]
	ldrb r1, [r4, #7]
	strb r1, [r5, #3]
	strb r2, [r5, #6]
	strb r2, [r5, #7]
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #8]
	bl EnableAllLearnableIqSkills
	add r0, r5, #0x22
	add r1, r4, #8
	bl GetInfoGroundMoveset
	ldr r1, [r4]
	add r0, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GuestMonsterToGroundMonster

	arm_func_start SetBaseStatsMovesGroundMonster
SetBaseStatsMovesGroundMonster: ; 0x02052EFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	strb r0, [r4, #1]
	ldrsh r0, [r4, #4]
	bl GetBaseHp
	strh r0, [r4, #0xa]
	ldrsh r0, [r4, #4]
	mov r1, #0
	bl GetBaseOffensiveStat
	strb r0, [r4, #0xc]
	ldrsh r0, [r4, #4]
	mov r1, #1
	bl GetBaseOffensiveStat
	strb r0, [r4, #0xd]
	ldrsh r0, [r4, #4]
	mov r1, #0
	bl GetBaseDefensiveStat
	strb r0, [r4, #0xe]
	ldrsh r0, [r4, #4]
	mov r1, #1
	bl GetBaseDefensiveStat
	strb r0, [r4, #0xf]
	mov r0, #0
	str r0, [r4, #0x10]
	strb r0, [r4, #0x20]
	mov r2, #1
	strh r2, [r4, #8]
	ldrsh r1, [r4, #4]
	add r0, r4, #0x14
	bl EnableAllLearnableIqSkills
	ldrsh r1, [r4, #4]
	add r0, r4, #0x22
	mov r2, #0
	bl sub_02053F10
	ldmia sp!, {r4, pc}
	arm_func_end SetBaseStatsMovesGroundMonster

	arm_func_start sub_02052F8C
sub_02052F8C: ; 0x02052F8C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #1
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_02052CF4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_02052F8C

	arm_func_start StrcmpMonsterName
StrcmpMonsterName: ; 0x02052FB0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r0, r1
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	add r1, sp, #0
	mov r0, r4
	mov r2, #0xa
	bl StrncmpSimple
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end StrcmpMonsterName

	arm_func_start sub_02052FF8
sub_02052FF8: ; 0x02052FF8
	stmdb sp!, {r3, lr}
	ldr r2, _02053034 ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0x44
	ldr ip, [r2]
	mov r2, #0xa
	smlabb r0, r0, r3, ip
	smlabb r1, r1, r3, ip
	add r0, r0, #0x3a
	add r1, r1, #0x3a
	bl sub_01FF8F28
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02053034: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02052FF8

	arm_func_start sub_02053038
sub_02053038: ; 0x02053038
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov ip, r1
	mov lr, r0
	cmp ip, #0xd
	blo _020530BC
	ldr r6, _020530CC ; =_020A328C
	add r5, sp, #0
	mov r4, #4
_0205305C:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0205305C
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	mov r3, #0
	add r1, sp, #0
	b _020530AC
_02053080:
	mov r2, r3, lsl #3
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _020530B4
	cmp lr, r0
	addeq r0, r1, r2
	ldreq r0, [r0, #4]
	cmpeq ip, r0
	moveq r0, #1
	beq _020530C4
	add r3, r3, #1
_020530AC:
	cmp r3, #0xa
	blt _02053080
_020530B4:
	mov r0, #0
	b _020530C4
_020530BC:
	ldr r0, _020530D0 ; =_020A327C
	ldrb r0, [r0, ip]
_020530C4:
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020530CC: .word _020A328C
_020530D0: .word _020A327C
	arm_func_end sub_02053038

	arm_func_start sub_020530D4
sub_020530D4: ; 0x020530D4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r4, r0
	ldrb r5, [r4]
	mov r0, #0x44
	ldr ip, _02053170 ; =TEAM_MEMBER_TABLE_PTR
	tst r5, #1
	smulbb r6, r1, r0
	movne r0, #1
	moveq r0, #0
	mov r3, r2
	ldr r7, [ip]
	tst r0, #0xff
	beq _02053158
	ldrh r5, [r4, #0x3e]
	ldrh lr, [r4, #0x40]
	ldrh ip, [r4, #0x42]
	mov r0, r4
	mov r2, r1
	strh r5, [sp]
	add r1, r7, r6
	strh lr, [sp, #2]
	strh ip, [sp, #4]
	ldrb r5, [r4]
	bl sub_02053250
	ldrh r2, [sp]
	ldrh r1, [sp, #2]
	ldrh r0, [sp, #4]
	strh r2, [r4, #0x3e]
	strh r1, [r4, #0x40]
	strh r0, [r4, #0x42]
	strb r5, [r4]
	b _02053168
_02053158:
	mov r0, r4
	mov r2, r1
	add r1, r7, r6
	bl sub_02053250
_02053168:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02053170: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020530D4

	arm_func_start sub_02053174
sub_02053174: ; 0x02053174
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldrb r6, [r5]
	mov r0, #0x44
	ldr r4, _02053220 ; =TEAM_MEMBER_TABLE_PTR
	tst r6, #1
	smulbb r8, r1, r0
	movne r0, #1
	moveq r0, #0
	mov ip, r2
	ldr sb, [r4]
	tst r0, #0xff
	beq _02053200
	ldrh r7, [r5, #0x3e]
	ldrh r6, [r5, #0x40]
	ldrh lr, [r5, #0x42]
	ldrb r4, [r5]
	mov r0, r5
	mov r2, r1
	str r3, [sp]
	mov r3, ip
	strh r7, [sp, #4]
	add r1, sb, r8
	strh r6, [sp, #6]
	strh lr, [sp, #8]
	bl sub_02053374
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	ldrh r0, [sp, #8]
	strh r2, [r5, #0x3e]
	strh r1, [r5, #0x40]
	strh r0, [r5, #0x42]
	strb r4, [r5]
	b _02053218
_02053200:
	str r3, [sp]
	mov r0, r5
	mov r2, r1
	mov r3, ip
	add r1, sb, r8
	bl sub_02053374
_02053218:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02053220: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02053174

	arm_func_start sub_02053224
sub_02053224: ; 0x02053224
	stmdb sp!, {r3, lr}
	ldr r3, _0205324C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, r1
	ldr r3, [r3]
	mov r1, #0x44
	smlabb r1, ip, r1, r3
	mov r3, r2
	mov r2, ip
	bl sub_02053250
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205324C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02053224

	arm_func_start sub_02053250
sub_02053250: ; 0x02053250
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	ldrb r1, [r5]
	mov r6, r0
	add r0, r5, #0x14
	strb r1, [r6]
	ldrb r1, [r5, #1]
	add r3, r6, #0x4c
	mov r4, r2
	strb r1, [r6, #2]
	ldrsh r1, [r5, #8]
	strh r1, [r6, #6]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	add r0, r6, #0x5a
	bl ShuffleHiddenPower
	ldrb r1, [r5, #2]
	mov r0, r4
	strb r1, [r6, #3]
	ldrb r1, [r5, #3]
	strb r1, [r6, #4]
	bl sub_020564B0
	strb r0, [r6, #1]
	strh r4, [r6, #8]
	ldrsh r0, [r5, #4]
	mov r3, #0
	strh r0, [r6, #0xc]
	ldrb r0, [r5, #0x20]
	strb r0, [r6, #0x58]
	ldrsh r0, [r5, #0xa]
	strh r0, [r6, #0x10]
	strh r0, [r6, #0xe]
_020532D4:
	add r2, r5, r3
	ldrb r0, [r2, #0xc]
	add r1, r6, r3
	add r3, r3, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r2, #0xe]
	cmp r3, #2
	strb r0, [r1, #0x14]
	blt _020532D4
	ldr r2, [r5, #0x10]
	add r0, r6, #0x1c
	add r1, r5, #0x22
	str r2, [r6, #0x18]
	bl GroundToDungeonMoveset
	add r0, r6, #0x5e
	add r1, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	add r0, r6, #0x3e
	bl ItemZInit
	mov r0, #0x64
	bl sub_02050FF8
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	mov r0, #0x64
	strh r2, [r6, #0x44]
	strh r1, [r6, #0x46]
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r1, [sp]
	ldrh r0, [sp, #2]
	strh r1, [r6, #0x48]
	strh r0, [r6, #0x4a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02053250

	arm_func_start sub_02053374
sub_02053374: ; 0x02053374
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	ldrb r1, [r5]
	mov r6, r0
	add r0, r5, #0x14
	strb r1, [r6]
	ldrb r1, [r5, #1]
	add r3, r6, #0x4c
	mov r4, r2
	strb r1, [r6, #2]
	ldrsh r1, [r5, #8]
	strh r1, [r6, #6]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	add r0, r6, #0x5a
	bl ShuffleHiddenPower
	ldrb r2, [r5, #2]
	ldrb r1, [sp, #0x18]
	mov r0, r4
	strb r2, [r6, #3]
	ldrb r2, [r5, #3]
	strb r2, [r6, #4]
	bl sub_02056504
	strb r0, [r6, #1]
	strh r4, [r6, #8]
	ldrsh r0, [r5, #4]
	mov r3, #0
	strh r0, [r6, #0xc]
	ldrb r0, [r5, #0x20]
	strb r0, [r6, #0x58]
	ldrsh r0, [r5, #0xa]
	strh r0, [r6, #0x10]
	strh r0, [r6, #0xe]
_020533FC:
	add r2, r5, r3
	ldrb r0, [r2, #0xc]
	add r1, r6, r3
	add r3, r3, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r2, #0xe]
	cmp r3, #2
	strb r0, [r1, #0x14]
	blt _020533FC
	ldr r2, [r5, #0x10]
	add r0, r6, #0x1c
	add r1, r5, #0x22
	str r2, [r6, #0x18]
	bl GroundToDungeonMoveset
	add r0, r6, #0x5e
	add r1, r5, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	add r0, r6, #0x3e
	bl ItemZInit
	mov r0, #0x64
	bl sub_02050FF8
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r2, [sp, #4]
	ldrh r1, [sp, #6]
	mov r0, #0x64
	strh r2, [r6, #0x44]
	strh r1, [r6, #0x46]
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r1, [sp]
	ldrh r0, [sp, #2]
	strh r1, [r6, #0x48]
	strh r0, [r6, #0x4a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02053374

	arm_func_start sub_0205349C
sub_0205349C: ; 0x0205349C
	ldr r3, _020534B4 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _020534B8 ; =sub_020534BC
	ldr r3, [r3]
	mov r2, #0x44
	smlabb r0, r0, r2, r3
	bx ip
	.align 2, 0
_020534B4: .word TEAM_MEMBER_TABLE_PTR
_020534B8: .word sub_020534BC
	arm_func_end sub_0205349C

	arm_func_start sub_020534BC
sub_020534BC: ; 0x020534BC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrb r1, [r4]
	mov r5, r0
	add r0, r4, #0x4c
	strb r1, [r5]
	ldrb r1, [r4, #2]
	add ip, r5, #0x14
	mov r3, #0
	strb r1, [r5, #1]
	ldrsh r1, [r4, #6]
	strh r1, [r5, #8]
	ldmia r0, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrb r0, [r4, #3]
	strb r0, [r5, #2]
	ldrb r0, [r4, #4]
	strb r0, [r5, #3]
	ldrsh r0, [r4, #0xc]
	strh r0, [r5, #4]
	ldrb r0, [r4, #0x58]
	strb r0, [r5, #0x20]
	ldrsh r0, [r4, #0x10]
	strh r0, [r5, #0xa]
_0205351C:
	add r2, r4, r3
	ldrb r0, [r2, #0x12]
	add r1, r5, r3
	add r3, r3, #1
	strb r0, [r1, #0xc]
	ldrb r0, [r2, #0x14]
	cmp r3, #2
	strb r0, [r1, #0xe]
	blt _0205351C
	ldr r2, [r4, #0x18]
	add r0, r5, #0x22
	add r1, r4, #0x1c
	str r2, [r5, #0x10]
	bl DungeonToGroundMoveset
	add r0, r5, #0x3a
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020534BC

	arm_func_start sub_02053568
sub_02053568: ; 0x02053568
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, _0205361C ; =_020A3258
	b _0205358C
_02053578:
	ldrsh r1, [r5, #4]
	bl DexNumbersEqual
	cmp r0, #0
	bne _02053598
	add r4, r4, #4
_0205358C:
	ldrsh r0, [r4]
	cmp r0, #0
	bne _02053578
_02053598:
	ldrsh r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r5, #0x22
	bl GetNbMoves
	cmp r0, #4
	bne _02053604
	ldrsh r0, [r4]
	cmp r0, #0x148
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _02053620 ; =0x0000013B
	add r0, r5, #0x22
	bl GetMovesetIdx__02013CAC
	mvn r1, #0
	cmp r0, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #6
	mul r2, r0, r1
	add r3, r5, #0x22
	mov r0, #0
	strb r0, [r3, r2]
	ldrh r1, [r4, #2]
	add r0, r3, r2
	bl GetInfoMoveGround
	ldr r0, _02053624 ; =_020A32D4
	bl Debug_Print0
	ldmia sp!, {r3, r4, r5, pc}
_02053604:
	add r2, r5, #0x22
	mov r1, #6
	mla r0, r1, r0, r2
	ldrh r1, [r4, #2]
	bl GetInfoMoveGround
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205361C: .word _020A3258
_02053620: .word 0x0000013B
_02053624: .word _020A32D4
	arm_func_end sub_02053568

	arm_func_start sub_02053628
sub_02053628: ; 0x02053628
	b _0205364C
_0205362C:
	ldrsh r2, [r0, #4]
	cmp r3, r2
	ldreqb r3, [r1, #2]
	ldreqb r2, [r0, #2]
	cmpeq r3, r2
	addeq r0, r1, #4
	bxeq lr
	add r1, r1, #6
	arm_func_end sub_02053628
_0205364C:
	ldrsh r3, [r1]
	cmp r3, #0
	bne _0205362C
	mov r0, #0
	bx lr

	arm_func_start sub_02053660
sub_02053660: ; 0x02053660
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r4, r2
	mov r5, r1
	mov r6, r0
	cmpne r5, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	mov sb, r1
	add r0, sp, #0
_02053688:
	strb sb, [r0, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _02053688
	b _0205375C
_0205369C:
	mov r1, r8
	add r0, r6, #0x22
	bl GetMovesetIdx__02013CAC
	mvn r1, #0
	cmp r0, r1
	bne _02053758
	add r0, r6, #0x22
	bl GetNbMoves
	mov r7, r0
	cmp r7, #4
	bne _02053738
	mov r7, #0
	mov sb, r7
	add r1, sp, #0
_020536D4:
	ldrb r0, [r1, sb]
	add sb, sb, #1
	cmp r0, #0
	addeq r7, r7, #1
	cmp sb, #4
	blt _020536D4
	cmp r7, #0
	beq _02053774
	bl Rand16Bit
	mov r1, r7
	bl _s32_div_f
	mov r7, r1
	mov r0, #6
	mul ip, r7, r0
	add r0, r6, #0x22
	mov r1, r8
	add r2, r6, ip
	mov r3, #0
	add r0, r0, ip
	strb r3, [r2, #0x22]
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r7]
	b _02053758
_02053738:
	add r1, r6, #0x22
	mov r0, #6
	mla r0, r7, r0, r1
	mov r1, r8
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r7]
_02053758:
	add sb, sb, #1
_0205375C:
	cmp sb, r4
	bge _02053774
	mov r0, sb, lsl #1
	ldrh r8, [r5, r0]
	cmp r8, #0
	bne _0205369C
_02053774:
	mov r0, #0
	mov r3, r0
	add r2, sp, #0
_02053780:
	ldrb r1, [r2, r3]
	add r3, r3, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r3, #4
	blt _02053780
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02053660

	arm_func_start GetLvlUpEntry
GetLvlUpEntry: ; 0x0205379C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r1
	mov r5, r0
	mov r0, r6
	mov r1, #0x258
	mov r4, r2
	bl _s32_div_f
	ldr r0, _02053844 ; =LEVEL_UP_DATA_MONSTER_ID
	ldrsh r0, [r0]
	cmp r0, r1
	beq _02053820
	mov r0, r6
	mov r1, #0x258
	bl _s32_div_f
	sub r0, r1, #1
	ldr r2, _02053844 ; =LEVEL_UP_DATA_MONSTER_ID
	mov r0, r0, lsl #0x10
	strh r1, [r2]
	mov r1, r0, lsr #0x10
	add r2, sp, #4
	mov r0, #5
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r2, [sp]
	ldr r0, _02053848 ; =LEVEL_UP_DATA_DECOMPRESS_BUFFER
	mov r1, #0
	bl DecompressAtNormalVeneer
	add r0, sp, #4
	bl UnloadFile
_02053820:
	subs r4, r4, #1
	ldr r1, _02053848 ; =LEVEL_UP_DATA_DECOMPRESS_BUFFER
	movmi r4, #0
	mov r0, #0xc
	mla r0, r4, r0, r1
	ldmia r0, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02053844: .word LEVEL_UP_DATA_MONSTER_ID
_02053848: .word LEVEL_UP_DATA_DECOMPRESS_BUFFER
	arm_func_end GetLvlUpEntry

	arm_func_start GetEncodedHalfword
GetEncodedHalfword: ; 0x0205384C
	ldrb ip, [r0]
	add r2, r0, #1
	mov r0, r2
	tst ip, #0x80
	addne r0, r2, #1
	ldrneb r2, [r2]
	moveq r2, ip
	moveq ip, #0
	and r3, r2, #0x7f
	mov r2, ip, lsl #0x19
	orr r2, r3, r2, lsr #18
	strh r2, [r1]
	bx lr
	arm_func_end GetEncodedHalfword

	arm_func_start sub_02053880
sub_02053880: ; 0x02053880
	cmp r0, #0xee
	mov r3, #1
	bne _0205389C
	ldr r2, _020538F0 ; =_020A18C0
	ldrsh r2, [r2]
	cmp r1, r2
	movlt r3, #0
_0205389C:
	cmp r0, #0xef
	bne _020538B4
	ldr r2, _020538F4 ; =_020A189C
	ldrsh r2, [r2]
	cmp r1, r2
	movlt r3, #0
_020538B4:
	cmp r0, #0x110
	bne _020538CC
	ldr r2, _020538F8 ; =_020A1884
	ldrsh r2, [r2]
	cmp r1, r2
	movlt r3, #0
_020538CC:
	ldr r2, _020538FC ; =0x0000021A
	cmp r0, r2
	bne _020538E8
	ldr r0, _02053900 ; =_020A1880
	ldrsh r0, [r0]
	cmp r1, r0
	movlt r3, #0
_020538E8:
	mov r0, r3
	bx lr
	.align 2, 0
_020538F0: .word _020A18C0
_020538F4: .word _020A189C
_020538F8: .word _020A1884
_020538FC: .word 0x0000021A
_02053900: .word _020A1880
	arm_func_end sub_02053880

	arm_func_start sub_02053904
sub_02053904: ; 0x02053904
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02053A08 ; =0x00000229
	ldr r8, [sp, #0x28]
	mov sl, r0
	mov sb, r2
	mov fp, r3
	mov r6, #0
	cmp r1, r4
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r1, #0
	moveq r0, r6
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0
	beq _0205394C
	ldrsh r5, [sp, #0x2c]
	cmp r5, #0
	bgt _02053950
_0205394C:
	mov r5, #0
_02053950:
	mov r0, r1
	bl GetMovesetLevelUpPtr
	mov r4, r0
	b _020539F4
_02053960:
	mov r0, r4
	add r1, sp, #0
	bl GetEncodedHalfword
	ldrb r1, [r0]
	add r4, r0, #1
	cmp r1, sb
	bgt _02053A00
	bne _020539F4
	ldrh r0, [sp]
	mov r1, fp
	mov r7, #1
	bl sub_02053880
	cmp r0, #0
	moveq r7, #0
	cmp r5, #0
	ble _020539D8
	mov r2, #0
	ldrh r0, [sp]
	b _020539C8
_020539AC:
	mov r1, r2, lsl #1
	ldrh r1, [r8, r1]
	cmp r0, r1
	beq _020539D0
	add r1, r2, #1
	mov r1, r1, lsl #0x10
	mov r2, r1, asr #0x10
_020539C8:
	cmp r2, r5
	blt _020539AC
_020539D0:
	cmp r2, r5
	bne _020539F4
_020539D8:
	cmp r7, #0
	beq _020539F4
	cmp r6, #0x10
	ldrlth r1, [sp]
	movlt r0, r6, lsl #1
	addlt r6, r6, #1
	strlth r1, [sl, r0]
_020539F4:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02053960
_02053A00:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02053A08: .word 0x00000229
	arm_func_end sub_02053904

	arm_func_start sub_02053A0C
sub_02053A0C: ; 0x02053A0C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r0, r1
	mov r5, r2
	mov r4, r3
	bl FemaleToMaleForm
	mov ip, #0
	mov r1, r0
	str ip, [sp]
	mov r0, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp, #4]
	bl sub_02053904
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02053A0C

	arm_func_start sub_02053A50
sub_02053A50: ; 0x02053A50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, r3
	ldr r7, [sp, #0x2c]
	mov sb, r1
	mov r8, r2
	mov r5, #0
	bl FemaleToMaleForm
	mov r4, r0
	bl sub_02053B38
	cmp r0, #0
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x28]
	cmp r0, #1
	bne _02053B30
	mov r0, r4
	bl GetMovesetEggPtr
	mov r4, r0
	mov fp, #1
	b _02053B24
_02053AA4:
	mov r0, r4
	add r1, sp, #0
	mov r6, fp
	bl GetEncodedHalfword
	mov r4, r0
	ldrh r0, [sp]
	mov r1, r7
	bl sub_02053880
	cmp r0, #0
	moveq r6, #0
	cmp r6, #0
	beq _02053B24
	mov r2, #0
	mov r3, r2
	ldrh r0, [sp]
	b _02053B04
_02053AE4:
	mov r1, r3, lsl #1
	ldrh r1, [sb, r1]
	cmp r0, r1
	moveq r2, #1
	beq _02053B0C
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02053B04:
	cmp r3, r8
	blt _02053AE4
_02053B0C:
	cmp r2, #0
	bne _02053B24
	cmp r5, #0x10
	movlt r1, r5, lsl #1
	strlth r0, [sl, r1]
	addlt r5, r5, #1
_02053B24:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02053AA4
_02053B30:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02053A50

	arm_func_start sub_02053B38
sub_02053B38: ; 0x02053B38
	cmp r0, #0
	ble _02053B4C
	ldr r1, _02053B5C ; =0x00000229
	cmp r0, r1
	blt _02053B54
_02053B4C:
	mov r0, #1
	bx lr
_02053B54:
	mov r0, #0
	bx lr
	.align 2, 0
_02053B5C: .word 0x00000229
	arm_func_end sub_02053B38

	arm_func_start sub_02053B60
sub_02053B60: ; 0x02053B60
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x48
	mov r8, r0
	mov r0, r1
	mov r7, r2
	mov r6, r3
	bl FemaleToMaleForm
	mov r4, r0
	bl sub_02053B38
	cmp r0, #0
	movne r0, #0
	bne _02053C98
	mov r0, r4
	bl FemaleToMaleForm
	mov r5, #0
	mov r1, r0
	str r5, [sp]
	mov r0, r8
	mov r2, r7
	mov r3, r6
	str r5, [sp, #4]
	bl sub_02053904
	mov r5, r0
	cmp r5, #4
	bge _02053C68
	mov r3, #0
	add r0, sp, #0x28
	b _02053BE0
_02053BD0:
	mov r2, r3, lsl #1
	ldrh r1, [r8, r2]
	add r3, r3, #1
	strh r1, [r0, r2]
_02053BE0:
	cmp r3, r5
	blt _02053BD0
	mov r2, r5, lsl #0x10
	str r7, [sp]
	add r0, sp, #8
	add r1, sp, #0x28
	mov r3, r4
	mov r2, r2, asr #0x10
	str r6, [sp, #4]
	bl sub_02053A50
	mov r6, r0
	cmp r6, #0
	ble _02053C68
	add r4, sp, #8
	b _02053C60
_02053C1C:
	mov r0, r6
	bl RandIntSafe
	mov r1, r0, lsl #1
	ldrh r2, [r4, r1]
	mov r1, r5, lsl #1
	add r3, r0, #1
	strh r2, [r8, r1]
	b _02053C50
_02053C3C:
	mov r0, r3, lsl #1
	ldrh r1, [r4, r0]
	add r0, r4, r3, lsl #1
	add r3, r3, #1
	strh r1, [r0, #-2]
_02053C50:
	cmp r3, r6
	blt _02053C3C
	sub r6, r6, #1
	add r5, r5, #1
_02053C60:
	cmp r5, #4
	blt _02053C1C
_02053C68:
	mov r0, r5, lsl #0x10
	mov r1, r0, asr #0x10
	mov r2, #0
	b _02053C8C
_02053C78:
	add r0, r1, #1
	mov r1, r1, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r8, r1]
	mov r1, r0, asr #0x10
_02053C8C:
	cmp r1, #4
	blt _02053C78
	mov r0, r5
_02053C98:
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02053B60

	arm_func_start sub_02053CA0
sub_02053CA0: ; 0x02053CA0
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr lr, _02053D18 ; =FORBIDDEN_FORGOT_MOVE_LIST
	b _02053CFC
_02053CB0:
	cmp ip, r2
	ldreqb ip, [lr, #2]
	cmpeq r3, ip
	bne _02053CF8
	mov r2, #1
	cmp r1, #1
	suble r2, r1, #1
	mov r4, #0
	b _02053CDC
_02053CD4:
	strh r1, [r0], #2
	add r4, r4, #1
_02053CDC:
	cmp r4, r2
	bge _02053D08
	add r1, lr, r4, lsl #1
	ldrh r1, [r1, #4]
	cmp r1, #0
	bne _02053CD4
	b _02053D08
_02053CF8:
	add lr, lr, #6
_02053CFC:
	ldrsh ip, [lr]
	cmp ip, #0
	bne _02053CB0
_02053D08:
	mov r1, #0
	strh r1, [r0]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02053D18: .word FORBIDDEN_FORGOT_MOVE_LIST
	arm_func_end sub_02053CA0

	arm_func_start sub_02053D1C
sub_02053D1C: ; 0x02053D1C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _02053DCC ; =0x00000229
	mov r6, r1
	mov r4, r0
	cmp r6, r2
	moveq r0, #0
	beq _02053DC4
	cmp r6, #0
	moveq r0, #0
	beq _02053DC4
	cmp r4, #0x160
	moveq r0, #0
	beq _02053DC4
	mov r0, r6
	bl GetMovesetLevelUpPtr
	add r5, sp, #2
	b _02053D80
_02053D64:
	mov r1, r5
	bl GetEncodedHalfword
	ldrh r1, [sp, #2]
	add r0, r0, #1
	cmp r4, r1
	moveq r0, #1
	beq _02053DC4
_02053D80:
	ldrb r1, [r0]
	cmp r1, #0
	bne _02053D64
	mov r0, r6
	bl GetMovesetHmTmPtr
	add r5, sp, #0
	b _02053DB4
_02053D9C:
	mov r1, r5
	bl GetEncodedHalfword
	ldrh r1, [sp]
	cmp r1, r4
	moveq r0, #1
	beq _02053DC4
_02053DB4:
	ldrb r1, [r0]
	cmp r1, #0
	bne _02053D9C
	mov r0, #0
_02053DC4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02053DCC: .word 0x00000229
	arm_func_end sub_02053D1C

	arm_func_start GetEvoFamily
GetEvoFamily: ; 0x02053DD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r2, _02053E84 ; =_020A3248
	ldrsh r3, [r0, #4]
	ldr r4, [r2, #8]
	ldr r2, [r2, #0xc]
	mov r7, r1
	strh r3, [r7]
	ldrb r1, [r0, #1]
	str r2, [sp, #4]
	str r4, [sp]
	strb r1, [r7, #2]
	ldrb r5, [r0, #6]
	mov r3, #0
	ldrsh r2, [r0, #4]
	cmp r5, #0
	ldrneb r1, [r0, #7]
	add r4, r3, #1
	add r8, sp, #0
	cmpne r1, #0
	strne r1, [sp]
	ldreqb r0, [r0, #7]
	strne r5, [sp, #4]
	streq r5, [sp]
	streq r0, [sp, #4]
	mov r5, #0
	b _02053E70
_02053E3C:
	ldr r6, [r8, r5, lsl #2]
	cmp r6, #0
	beq _02053E78
	mov r0, r2
	bl GetMonsterPreEvolution
	movs r2, r0
	beq _02053E78
	mov r1, r4, lsl #2
	add r0, r7, r4, lsl #2
	strh r2, [r7, r1]
	strb r6, [r0, #2]
	add r4, r4, #1
	add r5, r5, #1
_02053E70:
	cmp r5, #2
	blt _02053E3C
_02053E78:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02053E84: .word _020A3248
	arm_func_end GetEvoFamily

	arm_func_start GetEvolutions
GetEvolutions: ; 0x02053E88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r3
	mov r5, #0
	mov r6, #1
_02053EA4:
	mov r0, r6, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetMonsterPreEvolution
	cmp sl, r0
	bne _02053EF4
	cmp r8, #0
	bne _02053EE0
	mov r0, sl
	bl GetSpriteSize
	mov r4, r0
	mov r0, r7
	bl GetSpriteSize
	cmp r4, r0
	bne _02053EF4
_02053EE0:
	cmp fp, #0
	cmpeq r7, #0x140
	movne r0, r5, lsl #1
	strneh r7, [sb, r0]
	addne r5, r5, #1
_02053EF4:
	ldr r0, _02053F0C ; =0x00000483
	add r6, r6, #1
	cmp r6, r0
	blt _02053EA4
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02053F0C: .word 0x00000483
	arm_func_end GetEvolutions

	arm_func_start sub_02053F10
sub_02053F10: ; 0x02053F10
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r5, r0
	cmp r2, #0
	beq _02053F38
	mov r2, #1
	add r0, sp, #8
	rsb r3, r2, #0x3e8
	bl sub_02053B60
	b _02053F60
_02053F38:
	mov r0, r1
	bl FemaleToMaleForm
	mov r4, #0
	mov r2, #1
	mov r1, r0
	str r4, [sp]
	add r0, sp, #8
	rsb r3, r2, #0x3e8
	str r4, [sp, #4]
	bl sub_02053904
_02053F60:
	mov r8, r0
	cmp r8, #0
	moveq r0, #0x198
	streqh r0, [sp, #8]
	moveq r8, #1
	mov r4, #0
	add r7, sp, #8
	mov r6, #6
	b _02053F98
_02053F84:
	mla r0, r4, r6, r5
	mov r1, r4, lsl #1
	ldrh r1, [r7, r1]
	bl GetInfoMoveGround
	add r4, r4, #1
_02053F98:
	cmp r4, r8
	blt _02053F84
	mov r2, #0
	mov r0, #6
	b _02053FB8
_02053FAC:
	mul r1, r4, r0
	strb r2, [r5, r1]
	add r4, r4, #1
_02053FB8:
	cmp r4, #4
	blt _02053FAC
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02053F10

	arm_func_start ShuffleHiddenPower
ShuffleHiddenPower: ; 0x02053FC8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #0xa
	bl RandIntSafe
	ldr r1, _02054020 ; =HIDDEN_POWER_BASE_POWER_TABLE
	mov r5, #0
	ldr r0, [r1, r0, lsl #2]
	mov r4, #0x12
	strh r0, [r6]
	b _02054008
_02053FF0:
	mov r0, r4
	bl RandIntSafe
	strb r0, [r6, #2]
	tst r0, #0xff
	bne _02054010
	add r5, r5, #1
_02054008:
	cmp r5, #0x64
	blt _02053FF0
_02054010:
	cmp r5, #0x64
	moveq r0, #2
	streqb r0, [r6, #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02054020: .word HIDDEN_POWER_BASE_POWER_TABLE
	arm_func_end ShuffleHiddenPower

	arm_func_start GetBaseForm
GetBaseForm: ; 0x02054024
	cmp r0, #0x17c
	ldreq r0, _02054244 ; =0x0000017B
	bxeq lr
	ldr r3, _02054248 ; =0x0000017D
	cmp r0, r3
	subeq r0, r3, #2
	bxeq lr
	add r1, r3, #1
	cmp r0, r1
	subeq r0, r3, #2
	bxeq lr
	cmp r0, #0x3d4
	rsbeq r0, r3, #0x550
	bxeq lr
	add r1, r3, #0x258
	cmp r0, r1
	rsbeq r0, r3, #0x550
	bxeq lr
	ldr r2, _0205424C ; =0x000003D6
	cmp r0, r2
	subeq r0, r2, #3
	bxeq lr
	cmp r0, #0xca
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xcb
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xcc
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xcd
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xce
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xcf
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd0
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd1
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd2
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd3
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd4
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd5
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd6
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd7
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd8
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xd9
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xda
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xdb
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xdc
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xdd
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xde
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xdf
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xe0
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xe1
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xe2
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xe3
	moveq r0, #0xc9
	bxeq lr
	cmp r0, #0xe4
	moveq r0, #0xc9
	bxeq lr
	add r1, r3, #0x26
	cmp r0, r1
	subeq r0, r2, #0x234
	bxeq lr
	cmp r0, #0x1a4
	subeq r0, r2, #0x234
	bxeq lr
	add r1, r3, #0x28
	cmp r0, r1
	subeq r0, r2, #0x234
	bxeq lr
	cmp r0, #0x1cc
	moveq r0, #0x1cc
	bxeq lr
	add r1, r3, #0x50
	cmp r0, r1
	moveq r0, #0x1cc
	bxeq lr
	add r1, r2, #0x4e
	cmp r0, r1
	moveq r0, r1
	bxeq lr
	add r1, r2, #0x4f
	cmp r0, r1
	addeq r0, r2, #0x4e
	bxeq lr
	add r1, r3, #0x9a
	cmp r0, r1
	subeq r0, r2, #0x1c0
	bxeq lr
	cmp r0, #0x218
	addeq r0, r3, #0x94
	bx lr
	.align 2, 0
_02054244: .word 0x0000017B
_02054248: .word 0x0000017D
_0205424C: .word 0x000003D6
	arm_func_end GetBaseForm

	arm_func_start GetBaseFormBurmyWormadamShellosGastrodonCherrim
GetBaseFormBurmyWormadamShellosGastrodonCherrim: ; 0x02054250
	ldr r2, _02054390 ; =0x000001BF
	cmp r0, r2
	moveq r0, r2
	bxeq lr
	cmp r0, #0x1c0
	moveq r0, r2
	bxeq lr
	add r1, r2, #2
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	add r1, r2, #0x258
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	ldr r1, _02054394 ; =0x00000418
	cmp r0, r1
	moveq r0, r2
	bxeq lr
	add r3, r1, #1
	cmp r0, r3
	moveq r0, r2
	bxeq lr
	add r3, r2, #3
	cmp r0, r3
	moveq r0, r3
	bxeq lr
	add r3, r2, #4
	cmp r0, r3
	addeq r0, r2, #3
	bxeq lr
	cmp r0, #0x1c4
	addeq r0, r2, #3
	bxeq lr
	add r3, r2, #0xf
	cmp r0, r3
	moveq r0, r3
	bxeq lr
	add r3, r2, #0x10
	cmp r0, r3
	addeq r0, r2, #0xf
	bxeq lr
	add r3, r1, #0xe
	cmp r0, r3
	addeq r0, r2, #0xf
	bxeq lr
	add r3, r1, #0xf
	cmp r0, r3
	addeq r0, r2, #0xf
	bxeq lr
	cmp r0, #0x1d0
	moveq r0, #0x1d0
	bxeq lr
	add r3, r2, #0x12
	cmp r0, r3
	moveq r0, #0x1d0
	bxeq lr
	add r3, r1, #0x10
	cmp r0, r3
	moveq r0, #0x1d0
	bxeq lr
	add r3, r1, #0x11
	cmp r0, r3
	moveq r0, #0x1d0
	bxeq lr
	cmp r0, #0x1cc
	moveq r0, #0x1cc
	bxeq lr
	add r2, r2, #0xe
	cmp r0, r2
	moveq r0, #0x1cc
	bxeq lr
	add r2, r1, #0xc
	cmp r0, r2
	moveq r0, r2
	bxeq lr
	add r2, r1, #0xd
	cmp r0, r2
	addeq r0, r1, #0xc
	bx lr
	.align 2, 0
_02054390: .word 0x000001BF
_02054394: .word 0x00000418
	arm_func_end GetBaseFormBurmyWormadamShellosGastrodonCherrim

	arm_func_start GetBaseFormCastformCherrimDeoxys
GetBaseFormCastformCherrimDeoxys: ; 0x02054398
	cmp r0, #0x17c
	ldreq r0, _02054458 ; =0x0000017B
	bxeq lr
	ldr r3, _0205445C ; =0x0000017D
	cmp r0, r3
	subeq r0, r3, #2
	bxeq lr
	add r1, r3, #1
	cmp r0, r1
	subeq r0, r3, #2
	bxeq lr
	cmp r0, #0x3d4
	rsbeq r0, r3, #0x550
	bxeq lr
	add r1, r3, #0x258
	cmp r0, r1
	rsbeq r0, r3, #0x550
	bxeq lr
	ldr r2, _02054460 ; =0x000003D6
	cmp r0, r2
	subeq r0, r2, #3
	bxeq lr
	cmp r0, #0x1cc
	moveq r0, #0x1cc
	bxeq lr
	add r1, r3, #0x50
	cmp r0, r1
	moveq r0, #0x1cc
	bxeq lr
	add r1, r2, #0x4e
	cmp r0, r1
	moveq r0, r1
	bxeq lr
	add r1, r2, #0x4f
	cmp r0, r1
	addeq r0, r2, #0x4e
	bxeq lr
	add r1, r3, #0x26
	cmp r0, r1
	subeq r0, r2, #0x234
	bxeq lr
	cmp r0, #0x1a4
	subeq r0, r2, #0x234
	bxeq lr
	add r1, r3, #0x28
	cmp r0, r1
	subeq r0, r2, #0x234
	bx lr
	.align 2, 0
_02054458: .word 0x0000017B
_0205445C: .word 0x0000017D
_02054460: .word 0x000003D6
	arm_func_end GetBaseFormCastformCherrimDeoxys

	arm_func_start GetAllBaseForms
GetAllBaseForms: ; 0x02054464
	stmdb sp!, {r3, lr}
	bl GetBaseForm
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	ldmia sp!, {r3, pc}
	arm_func_end GetAllBaseForms

	arm_func_start GetDexNumberVeneer
GetDexNumberVeneer: ; 0x02054474
	ldr ip, _0205447C ; =GetDexNumber
	bx ip
	.align 2, 0
_0205447C: .word GetDexNumber
	arm_func_end GetDexNumberVeneer

	arm_func_start GetMonsterIdFromSpawnEntry
GetMonsterIdFromSpawnEntry: ; 0x02054480
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #6]
	ldr r1, _0205449C ; =0x00000483
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205449C: .word 0x00000483
	arm_func_end GetMonsterIdFromSpawnEntry

	arm_func_start SetMonsterId
SetMonsterId: ; 0x020544A0
	strh r1, [r0, #6]
	bx lr
	arm_func_end SetMonsterId

	arm_func_start SetMonsterLevelAndId
SetMonsterLevelAndId: ; 0x020544A8
	mov r1, r1, lsl #9
	strh r1, [r0]
	strh r2, [r0, #6]
	bx lr
	arm_func_end SetMonsterLevelAndId

	arm_func_start GetMonsterLevelFromSpawnEntry
GetMonsterLevelFromSpawnEntry: ; 0x020544B8
	ldrh r0, [r0]
	mov r0, r0, asr #9
	and r0, r0, #0x7f
	bx lr
	arm_func_end GetMonsterLevelFromSpawnEntry

	arm_func_start ApplyLevelUpBoostsToGroundMonster
ApplyLevelUpBoostsToGroundMonster: ; 0x020544C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	ldrb r0, [sl]
	mov sb, r1
	mov fp, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020546DC
	ldrb r0, [sl, #1]
	add r6, r0, #1
	b _020546D4
_02054500:
	mov r0, sl
	bl sub_020546E8
	ldrsh r0, [sl, #4]
	bl FemaleToMaleForm
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, r0
	ldrb r2, [sl, #1]
	ldr r3, _020546E4 ; =0x000003E7
	add r0, sp, #0x2a
	bl sub_02053904
	str r0, [sp, #8]
	cmp r0, #0
	beq _020546D0
	mov r8, #0
	add r5, sl, #0x22
	add r4, sp, #0xc
	b _020546C4
_0205454C:
	mov r1, #0
	mov r3, r8, lsl #1
	add r2, sp, #0x2a
	mov r0, r1
	ldrh r3, [r2, r3]
	b _02054598
_02054564:
	mov r2, #6
	mla r7, r0, r2, sl
	ldrb r2, [r7, #0x22]
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	beq _02054594
	ldrh r2, [r7, #0x24]
	cmp r2, r3
	moveq r1, #1
	beq _020545A0
_02054594:
	add r0, r0, #1
_02054598:
	cmp r0, #4
	blt _02054564
_020545A0:
	cmp r1, #0
	bne _020546C0
	mov r7, #0
	b _020545F0
_020545B0:
	mov r0, #6
	mul r1, r7, r0
	add r0, sl, r1
	ldrb r0, [r0, #0x22]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _020545EC
	add r0, r5, r1
	mov r2, r8, lsl #1
	add r1, sp, #0x2a
	ldrh r1, [r1, r2]
	bl GetInfoMoveGround
	b _020545F8
_020545EC:
	add r7, r7, #1
_020545F0:
	cmp r7, #4
	blt _020545B0
_020545F8:
	cmp fp, #0
	beq _020546C0
	cmp r7, #4
	bne _020546C0
	mov r1, r8, lsl #1
	add r0, sp, #0x2a
	mov r7, #0
	ldrh r1, [r0, r1]
	mov r3, r7
_0205461C:
	mov r0, #6
	mul lr, r3, r0
	add ip, sl, lr
	ldrb r0, [ip, #0x22]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02054660
	add r2, r4, lr
	ldrh r0, [ip, #0x22]
	add r7, r7, #1
	strh r0, [r4, lr]
	ldrh r0, [ip, #0x24]
	strh r0, [r2, #2]
	ldrh r0, [ip, #0x26]
	strh r0, [r2, #4]
_02054660:
	add r3, r3, #1
	cmp r3, #4
	blt _0205461C
	mov r0, #6
	mla r0, r3, r0, r4
	bl GetInfoMoveGround
	mov r0, r4
	add r1, r7, #1
	bl sub_02015090
	mov r1, #0
	b _020546B8
_0205468C:
	mov r0, #6
	mul r2, r1, r0
	add r0, sl, r2
	add r3, r4, r2
	ldrh r2, [r4, r2]
	add r1, r1, #1
	strh r2, [r0, #0x22]
	ldrh r2, [r3, #2]
	strh r2, [r0, #0x24]
	ldrh r2, [r3, #4]
	strh r2, [r0, #0x26]
_020546B8:
	cmp r1, r7
	blt _0205468C
_020546C0:
	add r8, r8, #1
_020546C4:
	ldr r0, [sp, #8]
	cmp r8, r0
	blt _0205454C
_020546D0:
	add r6, r6, #1
_020546D4:
	cmp r6, sb
	ble _02054500
_020546DC:
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020546E4: .word 0x000003E7
	arm_func_end ApplyLevelUpBoostsToGroundMonster

	arm_func_start sub_020546E8
sub_020546E8: ; 0x020546E8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldrb r2, [r4, #1]
	ldrsh r1, [r4, #4]
	add r0, sp, #0
	add r2, r2, #1
	bl GetLvlUpEntry
	ldrb r1, [r4, #1]
	add r0, r4, #0xa
	add r1, r1, #1
	strb r1, [r4, #1]
	ldr r1, [sp]
	str r1, [r4, #0x10]
	ldrh r1, [sp, #4]
	bl sub_02054FB8
	ldrb r1, [sp, #6]
	add r0, r4, #0xc
	bl sub_02054FEC
	ldrb r1, [sp, #7]
	add r0, r4, #0xd
	bl sub_02054FEC
	ldrb r1, [sp, #8]
	add r0, r4, #0xe
	bl sub_02055020
	ldrb r1, [sp, #9]
	add r0, r4, #0xf
	bl sub_02055020
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020546E8

	arm_func_start GetMonsterGenderVeneer
GetMonsterGenderVeneer: ; 0x02054760
	ldr ip, _02054768 ; =GetMonsterGender
	bx ip
	.align 2, 0
_02054768: .word GetMonsterGender
	arm_func_end GetMonsterGenderVeneer

	arm_func_start IsMonsterValid
IsMonsterValid: ; 0x0205476C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ble _02054798
	ldr r1, _020547C0 ; =0x00000229
	cmp r0, r1
	blt _0205478C
	cmp r0, #0x258
	ble _02054798
_0205478C:
	ldr r1, _020547C4 ; =0x00000481
	cmp r0, r1
	blt _020547A0
_02054798:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020547A0:
	cmp r0, #0x258
	blt _020547B8
	bl GetMonsterGender
	cmp r0, #2
	movne r0, #0
	ldmneia sp!, {r3, pc}
_020547B8:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020547C0: .word 0x00000229
_020547C4: .word 0x00000481
	arm_func_end IsMonsterValid

	arm_func_start sub_020547C8
sub_020547C8: ; 0x020547C8
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_020547C8

	arm_func_start sub_020547D8
sub_020547D8: ; 0x020547D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020547D8

	arm_func_start sub_02054804
sub_02054804: ; 0x02054804
	stmdb sp!, {r3, lr}
	ldr r2, _02054820 ; =_020A3248
	mov r1, #0
	ldr r2, [r2, #4]
	str r2, [sp]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02054820: .word _020A3248
	arm_func_end sub_02054804

	arm_func_start sub_02054824
sub_02054824: ; 0x02054824
	stmdb sp!, {r3, lr}
	ldr r2, _02054840 ; =_020A3248
	mov r1, #1
	ldr r2, [r2]
	str r2, [sp]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02054840: .word _020A3248
	arm_func_end sub_02054824

	arm_func_start sub_02054844
sub_02054844: ; 0x02054844
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xd0
	mov r3, #0
	mov sb, r0
	mov r8, r1
	mov r6, r3
	add r2, sp, #0x80
_02054860:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	str r6, [r2, r3, lsl #3]
	add r1, r2, r3, lsl #3
	mov r3, r0, asr #0x10
	str r6, [r1, #4]
	cmp r3, #0xa
	blt _02054860
	ldr fp, _02054A50 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, r6
	add r5, sp, #0x80
	mov r4, #1
_02054890:
	mov r0, r7
	bl IsValidTeamMember
	cmp r0, #0
	beq _0205493C
	cmp r8, #0
	beq _020548C4
	ldr r1, [fp]
	mov r0, #0x44
	smlabb r0, r7, r0, r1
	ldrsh r0, [r0, #4]
	bl IsShaymin
	cmp r0, #0
	bne _0205493C
_020548C4:
	ldr r2, [fp]
	mov r0, #0x44
	smlabb r0, r7, r0, r2
	ldrsh r0, [r0, #4]
	mov r1, #1
	bl GetKeyM2NSwitch
	mov r1, r0, asr #5
	add r1, r0, r1, lsr #26
	mov lr, r1, asr #6
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #26
	add r0, r2, r0, ror #26
	mov r1, #0
	add r2, r5, lr, lsl #3
	mov r1, r1, lsl r0
	rsb sl, r0, #0x20
	orr r1, r1, r4, lsr sl
	sub sl, r0, #0x20
	ldr ip, [r5, lr, lsl #3]
	ldr r3, [r2, #4]
	orr r1, r1, r4, lsl sl
	orr r1, r3, r1
	orr r0, ip, r4, lsl r0
	stmia r2, {r0, r1}
	ldr r0, [r5, lr, lsl #3]
	cmp r3, r1
	cmpeq ip, r0
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	movne r6, r0, asr #0x10
_0205493C:
	add r0, r7, #1
	mov r1, r0, lsl #0x10
	ldr r0, _02054A54 ; =0x0000022B
	mov r7, r1, asr #0x10
	cmp r0, r1, asr #16
	bgt _02054890
	strh r6, [sb]
	mov r0, r6, lsl #1
	mov r1, #0
	bl MemAlloc
	str r0, [sb, #4]
	ldr r0, _02054A58 ; =_020A32F8
	bl Debug_Print0
	mov r8, #0
	mov sl, r8
	mov r7, #1
	mov r5, r8
	add fp, sp, #0x80
	mov r4, r8
	b _02054A40
_0205498C:
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #26
	add r2, r1, r0, ror #26
	mov r0, sl, asr #5
	add r0, sl, r0, lsr #26
	mov r1, r0, asr #6
	add r0, fp, r1, lsl #3
	ldr r1, [fp, r1, lsl #3]
	mov r3, r5, lsl r2
	rsb ip, r2, #0x20
	and r1, r1, r7, lsl r2
	orr r3, r3, r7, lsr ip
	sub r2, r2, #0x20
	ldr r0, [r0, #4]
	orr r3, r3, r7, lsl r2
	and r2, r3, r0
	mov r0, #0
	cmp r2, r0
	cmpeq r1, r4
	beq _02054A34
	mov r0, sl
	mov r1, r7
	bl GetKeyN2MSwitch
	ldr r1, [sb, #4]
	mov r2, r8, lsl #1
	strh r0, [r1, r2]
	ldr r1, [sb, #4]
	add r0, sp, #0
	ldrsh r1, [r1, r2]
	bl GetNameRaw
	ldr r3, [sb, #4]
	mov r2, r8, lsl #1
	ldrsh r2, [r3, r2]
	ldr r0, _02054A5C ; =_020A3330
	mov r1, r8
	add r3, sp, #0
	bl Debug_Print0
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	cmp r6, r0, asr #16
	mov r8, r0, asr #0x10
	ble _02054A48
_02054A34:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_02054A40:
	cmp sl, #0x280
	blt _0205498C
_02054A48:
	add sp, sp, #0xd0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02054A50: .word TEAM_MEMBER_TABLE_PTR
_02054A54: .word 0x0000022B
_02054A58: .word _020A32F8
_02054A5C: .word _020A3330
	arm_func_end sub_02054844

	arm_func_start SprintfStatic__02054A60
SprintfStatic__02054A60: ; 0x02054A60
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__02054A60

	arm_func_start IsUnown
IsUnown: ; 0x02054A88
	cmp r0, #0xc9
	blt _02054A9C
	cmp r0, #0xe4
	movle r0, #1
	bxle lr
_02054A9C:
	mov r0, #0
	bx lr
	arm_func_end IsUnown

	arm_func_start IsShaymin
IsShaymin: ; 0x02054AA4
	ldr r1, _02054AD0 ; =0xFFFFFDEA
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02054AD0: .word 0xFFFFFDEA
	arm_func_end IsShaymin

	arm_func_start IsCastform
IsCastform: ; 0x02054AD4
	ldr r2, _02054B24 ; =0x0000017B
	cmp r0, r2
	cmpne r0, #0x17c
	addne r1, r2, #2
	cmpne r0, r1
	addne r1, r2, #3
	cmpne r0, r1
	beq _02054B14
	ldr r1, _02054B28 ; =0xFFFFFC2D
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	bhi _02054B1C
_02054B14:
	mov r0, #1
	bx lr
_02054B1C:
	mov r0, #0
	bx lr
	.align 2, 0
_02054B24: .word 0x0000017B
_02054B28: .word 0xFFFFFC2D
	arm_func_end IsCastform

	arm_func_start IsCherrim
IsCherrim: ; 0x02054B2C
	cmp r0, #0x1cc
	ldrne r1, _02054B6C ; =0x000001CD
	cmpne r0, r1
	beq _02054B5C
	ldr r1, _02054B70 ; =0xFFFFFBDC
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _02054B64
_02054B5C:
	mov r0, #1
	bx lr
_02054B64:
	mov r0, #0
	bx lr
	.align 2, 0
_02054B6C: .word 0x000001CD
_02054B70: .word 0xFFFFFBDC
	arm_func_end IsCherrim

; https://decomp.me/scratch/IvDKt
	arm_func_start IsDeoxys
IsDeoxys: ; 0x02054B74
	ldr r1, _02054BA0 ; =0xFFFFFE5E
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02054BA0: .word 0xFFFFFE5E
	arm_func_end IsDeoxys
