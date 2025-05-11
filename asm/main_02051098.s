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
	ldr r0, _02052390 ; =MONSTER_DATA_TABLE_PTR
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
_02052390: .word MONSTER_DATA_TABLE_PTR
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
	ldr r2, _020524F4 ; =MONSTER_DATA_TABLE_PTR
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
_020524F4: .word MONSTER_DATA_TABLE_PTR
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
	ldr r2, _02052704 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02052704: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSpriteIndex__020526EC

	arm_func_start GetSpriteIndex__02052708
GetSpriteIndex__02052708: ; 0x02052708
	ldr r2, _02052720 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02052720: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSpriteIndex__02052708

	arm_func_start GetSpriteIndex__02052724
GetSpriteIndex__02052724: ; 0x02052724
	ldr r2, _0205273C ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0205273C: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSpriteIndex__02052724

	arm_func_start GetDexNumber
GetDexNumber: ; 0x02052740
	ldr r2, _02052758 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #4]
	bx lr
	.align 2, 0
_02052758: .word MONSTER_DATA_TABLE_PTR
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
	ldr r2, _020527C0 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x12]
	bx lr
	.align 2, 0
_020527C0: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetMonsterGender

	arm_func_start GetBodySize
GetBodySize: ; 0x020527C4
	ldr r2, _020527DC ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x13]
	bx lr
	.align 2, 0
_020527DC: .word MONSTER_DATA_TABLE_PTR
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
	ldr r2, _02052854 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x2e]
	bx lr
	.align 2, 0
_02052854: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetShadowSize

	arm_func_start GetSpeedStatus
GetSpeedStatus: ; 0x02052858
	ldr r2, _02052870 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #6]
	bx lr
	.align 2, 0
_02052870: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSpeedStatus
