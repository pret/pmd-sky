	.include "asm/macros.inc"
	.include "main_02062A68.inc"

	.text

	arm_func_start CanMonsterBeUsedForMission
CanMonsterBeUsedForMission: ; 0x02062A68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl FemaleToMaleForm
	mov r4, r0
	bl HasMonsterBeenAttackedInDungeons
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl GetBaseForm
	cmp r4, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	beq _02062AB8
	mov r0, r4
	bl IsMonsterMissionAllowed
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02062AB8:
	mov r0, r4
	bl IsMonsterMissionAllowedStory
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanMonsterBeUsedForMission

	arm_func_start sub_02062AD0
sub_02062AD0: ; 0x02062AD0
	stmdb sp!, {r3, lr}
	bl GetBaseForm
	bl FemaleToMaleForm
	bl IsMonsterMissionAllowedStory
	ldmia sp!, {r3, pc}
	arm_func_end sub_02062AD0

	arm_func_start IsMonsterMissionAllowedStory
IsMonsterMissionAllowedStory: ; 0x02062AE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #9
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02062B58
	mov r2, #0
	ldr r0, _02062B60 ; =MISSION_BANNED_STORY_MONSTERS
	b _02062B18
_02062B08:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r2, r2, #1
_02062B18:
	mov r1, r2, lsl #1
	ldrsh r1, [r0, r1]
	cmp r1, #0
	bne _02062B08
	bl GetHero
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl GetPartner
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02062B58:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062B60: .word MISSION_BANNED_STORY_MONSTERS
	arm_func_end IsMonsterMissionAllowedStory

	arm_func_start IsMonsterIllegalForMissions
IsMonsterIllegalForMissions: ; 0x02062B64
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonsterValid
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _02062BB0 ; =0x00000217
	cmp r4, r0
	blt _02062B90
	cmp r4, #0x228
	ble _02062BA0
_02062B90:
	cmp r4, #0x180
	ldrne r0, _02062BB4 ; =0x00000117
	cmpne r4, r0
	bne _02062BA8
_02062BA0:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02062BA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062BB0: .word 0x00000217
_02062BB4: .word 0x00000117
	arm_func_end IsMonsterIllegalForMissions

	arm_func_start CanDungeonBeUsedForMission
CanDungeonBeUsedForMission: ; 0x02062BB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl DungeonSwapIdToIdx
	cmp r5, #0x36
	mov r4, r0
	cmpne r5, #0x68
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0x7b
	blo _02062BEC
	cmp r5, #0xa3
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_02062BEC:
	cmp r5, #0xaf
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	add r0, r5, #0xe8
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02062C1C
	mov r0, #9
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02062C1C:
	mvn r0, #0
	cmp r4, r0
	beq _02062C44
	cmp r4, #0xb4
	bge _02062C44
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_02062C44:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanDungeonBeUsedForMission

	arm_func_start sub_02062C4C
sub_02062C4C: ; 0x02062C4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	cmp sl, #0
	mov sb, r1
	mov r8, r2
	str r3, [sp]
	movle r0, #0
	ble _02062D38
	bl RandIntSafe
	mov r6, r0
	mov fp, r6
_02062C7C:
	ldrb r4, [sb, r6]
	mov r0, r4
	bl GetNbFloors
	mov r7, r0
	cmp r4, #0xae
	addne r7, r7, #1
	add r0, r7, r7, lsr #31
	mov r0, r0, asr #1
	mov r1, r7
	str r0, [sp, #8]
	bl RandRangeSafe
	mov r5, r0
	str r5, [sp, #4]
_02062CB0:
	strb r4, [sp, #0x10]
	strb r5, [sp, #0x11]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	bl IsForbiddenFloor
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #0xc]
	ldr r2, [sp]
	mov r0, r4
	mov r1, r5
	bl sub_0205E090
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #0xc]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	strneb r4, [r8]
	strneb r5, [r8, #1]
	movne r0, #1
	bne _02062D38
	add r5, r5, #1
	cmp r5, r7
	ldrge r5, [sp, #8]
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _02062CB0
	add r6, r6, #1
	cmp r6, sl
	moveq r6, #0
	cmp r6, fp
	bne _02062C7C
	mov r0, #0
_02062D38:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02062C4C

	arm_func_start sub_02062D40
sub_02062D40: ; 0x02062D40
	stmdb sp!, {r3, lr}
	bl GetMissionRank__0204FAE0
	cmp r0, #7
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02062D40

	arm_func_start GetMissionRankWithCapAndModifiers
GetMissionRankWithCapAndModifiers: ; 0x02062D5C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetMissionRank__0204FAE0
	cmp r4, #2
	cmpne r4, #3
	cmpne r4, #4
	cmpne r4, #5
	beq _02062D8C
	add r1, r4, #0xf7
	and r1, r1, #0xff
	cmp r1, #1
	bhi _02062D90
_02062D8C:
	add r0, r0, #1
_02062D90:
	cmp r0, #0xf
	movgt r0, #0xf
	ldmia sp!, {r4, pc}
	arm_func_end GetMissionRankWithCapAndModifiers

	arm_func_start GetMissionRankWithCapAndModifiersAndCap
GetMissionRankWithCapAndModifiersAndCap: ; 0x02062D9C
	stmdb sp!, {r3, lr}
	bl GetMissionRankWithCapAndModifiers
	and r0, r0, #0xff
	cmp r0, #0x10
	movhs r0, #0xf
	ldmia sp!, {r3, pc}
	arm_func_end GetMissionRankWithCapAndModifiersAndCap

	arm_func_start sub_02062DB4
sub_02062DB4: ; 0x02062DB4
	ldr r1, _02062DC0 ; =RANK_STRING_PTR_TABLE
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_02062DC0: .word RANK_STRING_PTR_TABLE
	arm_func_end sub_02062DB4

	arm_func_start sub_02062DC4
sub_02062DC4: ; 0x02062DC4
	stmdb sp!, {r3, lr}
	bl GetMissionRankWithCapAndModifiers
	ldr r1, _02062DD8 ; =MISSION_RANK_POINTS
	ldr r0, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02062DD8: .word MISSION_RANK_POINTS
	arm_func_end sub_02062DC4

	arm_func_start CanSendItem
CanSendItem: ; 0x02062DDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _02062DFC
	bl IsItemInTimeDarkness
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02062DFC:
	mov r2, #0
	ldr r0, _02062E30 ; =NO_SEND_ITEM_TABLE
	b _02062E18
_02062E08:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r2, r2, #1
_02062E18:
	mov r1, r2, lsl #1
	ldrsh r1, [r0, r1]
	cmp r1, #0
	bne _02062E08
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062E30: .word NO_SEND_ITEM_TABLE
	arm_func_end CanSendItem

	arm_func_start sub_02062E34
sub_02062E34: ; 0x02062E34
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldrnesh r4, [r0, #0xa0]
	ldreqsh r4, [r0, #0xa2]
	ldrb r0, [r0, #0xae]
	bl sub_0205BD5C
	mov r1, r0
	mov r0, r4
	bl CanSendItem
	ldmia sp!, {r4, pc}
	arm_func_end sub_02062E34

	arm_func_start InitMissionReward
InitMissionReward: ; 0x02062E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrb r1, [r5, #1]
	add r0, r5, #4
	bl GetMissionRankWithCapAndModifiersAndCap
	mov ip, #0
	str ip, [r4, #8]
	mov r3, ip
	mov r1, #6
_02062E84:
	mla r2, ip, r1, r4
	add ip, ip, #1
	strh r3, [r2, #0x14]
	cmp ip, #3
	blt _02062E84
	add r1, r0, #1
	mov r0, #0x32
	mul r0, r1, r0
	str r0, [r4, #8]
	ldrb r0, [r5, #0x16]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0206305C
_02062EB8: ; jump table
	b _02062ED4 ; case 0
	b _02062EE4 ; case 1
	b _02062F04 ; case 2
	b _02062F38 ; case 3
	b _02062FD8 ; case 4
	b _0206300C ; case 5
	b _02063038 ; case 6
_02062ED4:
	strb r3, [r4, #2]
	mov r0, #1
	str r0, [r4, #0xc]
	b _02063074
_02062EE4:
	mov r2, #1
	strb r2, [r4, #2]
	ldrsh r1, [r5, #0x18]
	mov r0, #0xa
	strh r1, [r4, #0x14]
	strh r0, [r4, #0x12]
	str r2, [r4, #0xc]
	b _02063074
_02062F04:
	mov r0, #2
	strb r0, [r4, #2]
	ldrsh r2, [r5, #0x18]
	mov r0, #1
	mov r1, #0xa
	strh r2, [r4, #0x14]
	strh r1, [r4, #0x12]
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	sub r0, r0, #2
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02062F38:
	mov r0, #3
	strb r0, [r4, #2]
	ldrsh r1, [r5, #0x18]
	mov r0, #0xa
	strh r1, [r4, #0x14]
	strh r0, [r4, #0x12]
_02062F50:
	ldrb r1, [r5, #1]
	add r0, r5, #4
	add r2, r4, #0x1a
	bl RollRandomItemReward
	ldrsh r1, [r4, #0x14]
	ldrsh r0, [r4, #0x1a]
	cmp r1, r0
	beq _02062F50
	mov r0, #0xa
	strh r0, [r4, #0x18]
	mov r0, #2
	str r0, [r4, #0xc]
	bl RandInt
	cmp r0, #0
	beq _02062FC4
_02062F8C:
	ldrb r1, [r5, #1]
	add r0, r5, #4
	add r2, r4, #0x20
	bl RollRandomItemReward
	ldrsh r1, [r4, #0x20]
	ldrsh r0, [r4, #0x14]
	cmp r0, r1
	ldrnesh r0, [r4, #0x1a]
	cmpne r0, r1
	beq _02062F8C
	mov r0, #0xa
	strh r0, [r4, #0x1e]
	mov r0, #3
	str r0, [r4, #0xc]
_02062FC4:
	ldr r1, [r4, #8]
	mvn r0, #0
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02062FD8:
	mov r0, #4
	strb r0, [r4, #2]
	ldrsh r2, [r5, #0x18]
	mov r0, #1
	mov r1, #0xa
	strh r2, [r4, #0x14]
	strh r1, [r4, #0x12]
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	sub r0, r0, #2
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_0206300C:
	mov r1, #5
	mov r0, #1
	strb r1, [r4, #2]
	strb r0, [r4, #0x22]
	ldrsh r1, [r5, #0x18]
	sub r0, r0, #2
	strh r1, [r4, #0x24]
	ldr r1, [r4, #8]
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02063038:
	mov r0, #6
	strb r0, [r4, #2]
	ldrsh r1, [r5, #0x18]
	sub r0, r0, #7
	strh r1, [r4, #0x24]
	ldr r1, [r4, #8]
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_0206305C:
	mov r0, #7
	strb r0, [r4, #2]
	ldr r1, [r4, #8]
	sub r0, r0, #8
	mul r0, r1, r0
	str r0, [r4, #8]
_02063074:
	ldrsh r1, [r5, #0xe]
	add r0, r5, #4
	strh r1, [r4]
	ldrb r1, [r5, #1]
	bl GetMissionRankWithCapAndModifiers
	ldr r1, _02063098 ; =MISSION_RANK_POINTS
	ldr r0, [r1, r0, lsl #2]
	str r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063098: .word MISSION_RANK_POINTS
	arm_func_end InitMissionReward

	arm_func_start sub_0206309C
sub_0206309C: ; 0x0206309C
	mov r0, #0xa
	bx lr
	arm_func_end sub_0206309C

	arm_func_start RollRandomItemReward
RollRandomItemReward: ; 0x020630A4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r2
	mov r5, #1
	bl GetMissionRankWithCapAndModifiers
	mov r6, r0
	mov r0, r8
	mov r1, r6
	bl RetrieveFromItemList2
	mov r4, #0
	b _020630E0
_020630D0:
	mov r0, r8
	mov r1, r6
	mov r5, r4
	bl RetrieveFromItemList2
_020630E0:
	cmp r5, #0
	bne _020630D0
	strh r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end RollRandomItemReward

	arm_func_start sub_020630F0
sub_020630F0: ; 0x020630F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	mov r1, #0
	bl GetExclusiveItem
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetExclusiveItem
	mov r4, r0
	cmp r5, #0
	cmpeq r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	streqh r4, [r6]
	beq _02063154
	cmp r4, #0
	streqh r5, [r6]
	beq _02063154
	mov r0, #2
	bl RandInt
	cmp r0, #0
	moveq r5, r4
	strh r5, [r6]
_02063154:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020630F0

	arm_func_start GenerateMissionRewards
GenerateMissionRewards: ; 0x0206315C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #6
	beq _020631D8
	cmp r0, #0xa
	beq _02063188
	cmp r0, #0xb
	beq _020631B4
	b _020631F4
_02063188:
	ldr r1, _02063230 ; =OUTLAW_MISSION_REWARD_TYPE_WEIGHTS
	add r0, sp, #0
	mov r2, #0xe
	bl MemcpySimple
	mov r0, #0
	strh r0, [sp, #0xc]
	ldrsh r2, [r4, #0x10]
	add r1, sp, #0
	mov r0, r4
	bl sub_02063240
	b _02063228
_020631B4:
	ldrb r0, [r4, #2]
	cmp r0, #1
	blo _020631D8
	cmp r0, #5
	movls r0, #6
	strlsb r0, [r4, #0x16]
	ldrlssh r0, [r4, #0xe]
	strlsh r0, [r4, #0x18]
	bls _02063228
_020631D8:
	ldrb r0, [r4, #2]
	cmp r0, #4
	moveq r1, #4
	ldreq r0, _02063234 ; =0x0000031E
	streqb r1, [r4, #0x16]
	streqh r0, [r4, #0x18]
	beq _02063228
_020631F4:
	cmp r1, #0
	add r0, sp, #0
	mov r2, #0xe
	beq _02063210
	ldr r1, _02063238 ; =DEFAULT_MISSION_REWARD_TYPE_WEIGHTS
	bl MemcpySimple
	b _02063218
_02063210:
	ldr r1, _0206323C ; =CAFE_MISSION_REWARD_TYPE_WEIGHTS
	bl MemcpySimple
_02063218:
	ldrsh r2, [r4, #0xe]
	add r1, sp, #0
	mov r0, r4
	bl sub_02063240
_02063228:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02063230: .word OUTLAW_MISSION_REWARD_TYPE_WEIGHTS
_02063234: .word 0x0000031E
_02063238: .word DEFAULT_MISSION_REWARD_TYPE_WEIGHTS
_0206323C: .word CAFE_MISSION_REWARD_TYPE_WEIGHTS
	arm_func_end GenerateMissionRewards

	arm_func_start sub_02063240
sub_02063240: ; 0x02063240
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov r0, #3
	mov r1, #0xc
	mov r2, #0
	bl IsStoryBeforePoint
	cmp r0, #0
	movne r0, #0
	strneh r0, [r6, #0xa]
	mov r0, #3
	mov r1, #6
	mov r2, #0
	bl IsStoryBeforePoint
	cmp r0, #0
	movne r0, #0
	strneh r0, [r6, #0xc]
	mov r0, #3
	mov r1, #8
	mov r2, #0
	bl IsStoryBeforePoint
	cmp r0, #0
	bne _020632B8
	ldrb r1, [r4, #1]
	add r0, r4, #4
	bl GetMissionRankWithCapAndModifiersAndCap
	cmp r0, #0xb
	bge _020632C0
_020632B8:
	mov r0, #0
	strh r0, [r6, #8]
_020632C0:
	mov r1, r6
	mov r0, #7
	bl sub_0206220C
	and r1, r0, #0xff
	strb r0, [r4, #0x16]
	cmp r1, #6
	ldreqsh r0, [r4, #0xe]
	streqh r0, [r4, #0x18]
	beq _0206338C
	cmp r1, #4
	bne _0206336C
	add r1, sp, #0
	mov r0, r5
	bl sub_020630F0
	cmp r0, #0
	bne _02063360
	mov r0, r5
	mov r1, #0
	bl GetType
	mov r6, r0
	mov r0, r5
	mov r1, #1
	bl GetType
	movs r5, r0
	beq _02063334
	mov r0, #2
	bl RandInt
	cmp r0, #0
	beq _0206334C
_02063334:
	sub r0, r6, #1
	mov r0, r0, lsl #2
	add r0, r0, #0xfb
	add r0, r0, #0x100
	strh r0, [sp]
	b _02063360
_0206334C:
	sub r0, r5, #1
	mov r0, r0, lsl #2
	add r0, r0, #0xfb
	add r0, r0, #0x100
	strh r0, [sp]
_02063360:
	ldrsh r0, [sp]
	strh r0, [r4, #0x18]
	b _0206338C
_0206336C:
	ldrb r1, [r4, #1]
	add r0, r4, #4
	add r2, r4, #0x18
	bl RollRandomItemReward
	ldrsh r1, [r4, #0x14]
	ldrsh r0, [r4, #0x18]
	cmp r1, r0
	beq _0206336C
_0206338C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02063240

	arm_func_start CheckDungeonMissionUnlockConditions
CheckDungeonMissionUnlockConditions: ; 0x02063394
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl DungeonSwapIdToIdx
	mov r5, r0
	mov r4, #0
	ldr r1, _0206341C ; =MISSION_DUNGEON_UNLOCK_TABLE
	b _0206340C
_020633B0:
	ldrb r0, [r1, r4, lsl #1]
	cmp r6, r0
	bne _02063408
	bl GetScenarioBalance
	ldr r1, _02063420 ; =_020A3CAD
	ldrb r1, [r1, r4, lsl #1]
	cmp r1, r0
	movhi r0, #1
	ldmhiia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #0
	bne _020633F8
	ldr r0, _0206341C ; =MISSION_DUNGEON_UNLOCK_TABLE
	ldrb r0, [r0, r4, lsl #1]
	bl GetMaxReachedFloor
	cmp r0, #0
	beq _02063400
_020633F8:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_02063400:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02063408:
	add r4, r4, #1
_0206340C:
	cmp r4, #3
	blt _020633B0
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206341C: .word MISSION_DUNGEON_UNLOCK_TABLE
_02063420: .word _020A3CAD
	arm_func_end CheckDungeonMissionUnlockConditions

	arm_func_start sub_02063424
sub_02063424: ; 0x02063424
	stmdb sp!, {r4, lr}
	cmp r0, #0xb
	ldreqb r0, [r1]
	mov r4, r2
	cmpeq r0, #5
	mov r0, r4
	bne _02063448
	bl GetNbFloors
	ldmia sp!, {r4, pc}
_02063448:
	bl GetNbFloors
	cmp r4, #0xae
	addne r0, r0, #1
	sub r0, r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_02063424

	arm_func_start IsAvailableItem
IsAvailableItem: ; 0x0206345C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02063498
_0206346C:
	and r0, r4, #0xff
	bl GetMaxReachedFloor
	cmp r0, #0
	beq _02063494
	mov r1, r5
	and r0, r4, #0xff
	bl IsItemAvailableInDungeonGroup
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02063494:
	add r4, r4, #1
_02063498:
	cmp r4, #0xb4
	blt _0206346C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end IsAvailableItem

	arm_func_start GetAvailableItemDeliveryList
GetAvailableItemDeliveryList: ; 0x020634A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, #0
	ldr r4, _020634F0 ; =ITEM_DELIVERY_TABLE
	mov r8, r0
	mov r5, r6
_020634BC:
	mov r0, r5, lsl #1
	ldrsh r7, [r4, r0]
	mov r0, r7
	bl IsAvailableItem
	cmp r0, #0
	movne r0, r6, lsl #1
	add r5, r5, #1
	strneh r7, [r8, r0]
	addne r6, r6, #1
	cmp r5, #0x16
	blt _020634BC
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020634F0: .word ITEM_DELIVERY_TABLE
	arm_func_end GetAvailableItemDeliveryList

	arm_func_start WriteMissionMtState
WriteMissionMtState: ; 0x020634F4
	ldr r1, _02063500 ; =RESCUE_BIN_UNPACK
	str r0, [r1]
	bx lr
	.align 2, 0
_02063500: .word RESCUE_BIN_UNPACK
	arm_func_end WriteMissionMtState

	arm_func_start ReadMissionMtStateLower
ReadMissionMtStateLower: ; 0x02063504
	ldr r0, _02063518 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_02063518: .word RESCUE_BIN_UNPACK
	arm_func_end ReadMissionMtStateLower

	arm_func_start ZeroInitMissionRewardDataStruct
ZeroInitMissionRewardDataStruct: ; 0x0206351C
	mov ip, #0
	strh ip, [r0]
	str ip, [r0, #8]
	str ip, [r0, #0xc]
	mov r3, ip
	mov r1, #6
_02063534:
	mla r2, ip, r1, r0
	add ip, ip, #1
	strh r3, [r2, #0x14]
	cmp ip, #3
	blt _02063534
	strb r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end ZeroInitMissionRewardDataStruct

	arm_func_start sub_02063560
sub_02063560: ; 0x02063560
	stmdb sp!, {r3, lr}
	ldrsh r2, [r1]
	cmp r2, #0
	beq _020635BC
	mov r2, #0x8000
	strh r2, [r0]
	ldrsh r2, [r1, #2]
	add ip, r1, #4
	add r3, r0, #0x14
	strh r2, [r0, #4]
	ldrsh lr, [r1, #2]
	mov r2, #4
	strh lr, [r0, #2]
	str ip, [r0, #8]
	str ip, [r0, #0xc]
	ldrsh r1, [r1]
	add r1, ip, r1, lsl #2
	str r1, [r0, #0x10]
_020635A8:
	ldrb r0, [ip], #1
	subs r2, r2, #1
	strb r0, [r3], #1
	bne _020635A8
	ldmia sp!, {r3, pc}
_020635BC:
	mov r1, #0
	strh r1, [r0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_02063560

	arm_func_start sub_020635C8
sub_020635C8: ; 0x020635C8
	ldr ip, _020635D4 ; =MemZero
	mov r1, #0xc
	bx ip
	.align 2, 0
_020635D4: .word MemZero
	arm_func_end sub_020635C8

	arm_func_start sub_020635D8
sub_020635D8: ; 0x020635D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	bl UnloadFile
	mov r0, r4
	mov r1, #0xc
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_020635D8

	arm_func_start sub_02063600
sub_02063600: ; 0x02063600
	ldr ip, _0206360C ; =MemZero
	mov r1, #0x18
	bx ip
	.align 2, 0
_0206360C: .word MemZero
	arm_func_end sub_02063600

	arm_func_start sub_02063610
sub_02063610: ; 0x02063610
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063610

	arm_func_start sub_02063628
sub_02063628: ; 0x02063628
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r1, #0x18
	mov r7, r0
	mov r5, r2
	bl MemZero
	mov r0, #0x18
	mul r4, r5, r0
	mov r0, r4
	mov r1, #0
	str r5, [r7, #0xc]
	bl MemAlloc
	mov r1, r4
	str r0, [r7, #8]
	bl MemZero
	mov r0, r7
	str r6, [r7, #4]
	bl sub_020636A8
	mov r0, #0x1f
	str r0, [r7, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02063628

	arm_func_start sub_0206367C
sub_0206367C: ; 0x0206367C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02063610
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl MemFree
	mov r0, r4
	mov r1, #0x18
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206367C

	arm_func_start sub_020636A8
sub_020636A8: ; 0x020636A8
	ldr r1, [r0]
	cmp r1, #0
	beq _020636F0
	ldr r1, [r1]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	bx lr
_020636C4: ; jump table
	b _020636D8 ; case 0
	b _020636E4 ; case 1
	b _020636E4 ; case 2
	b _020636E4 ; case 3
	b _020636E4 ; case 4
_020636D8:
	mov r1, #0
	strb r1, [r0, #0x14]
	bx lr
_020636E4:
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
_020636F0:
	ldr r1, [r0, #4]
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	bx lr
_02063708: ; jump table
	b _0206371C ; case 0
	b _02063728 ; case 1
	b _02063728 ; case 2
	b _02063728 ; case 3
	b _02063728 ; case 4
_0206371C:
	mov r1, #0
	strb r1, [r0, #0x14]
	bx lr
_02063728:
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020636A8

	arm_func_start sub_02063734
sub_02063734: ; 0x02063734
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	mov r4, #0x18
	b _02063764
_02063750:
	ldr r0, [r8, #8]
	ldr r1, [r7, r5, lsl #2]
	mla r0, r5, r4, r0
	bl sub_02063560
	add r5, r5, #1
_02063764:
	cmp r5, r6
	blt _02063750
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02063734

	arm_func_start sub_02063770
sub_02063770: ; 0x02063770
	ldrb r0, [r0, #0x15]
	bx lr
	arm_func_end sub_02063770

	arm_func_start sub_02063778
sub_02063778: ; 0x02063778
	mov r2, #0x18
	mul r2, r1, r2
	ldr r0, [r0, #8]
	ldrh r0, [r0, r2]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063778

	arm_func_start sub_0206379C
sub_0206379C: ; 0x0206379C
	mov r2, #0x18
	mul r2, r1, r2
	ldr r0, [r0, #8]
	ldrh r0, [r0, r2]
	tst r0, #0x8000
	beq _020637C0
	tst r0, #0x2000
	movne r0, #1
	bxne lr
_020637C0:
	mov r0, #0
	bx lr
	arm_func_end sub_0206379C

	arm_func_start sub_020637C8
sub_020637C8: ; 0x020637C8
	stmdb sp!, {r4, lr}
	ldrb ip, [sp, #8]
	mov r4, r0
	mov r0, r4
	cmp ip, #0
	addne r3, r3, r2, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bl sub_0200A29C
	mov r0, r4
	bl sub_0200A174
	ldmia sp!, {r4, pc}
	arm_func_end sub_020637C8

	arm_func_start sub_020637FC
sub_020637FC: ; 0x020637FC
	stmdb sp!, {r4, lr}
	ldrb ip, [sp, #8]
	mov r4, r0
	mov r0, r4
	cmp ip, #0
	addne r3, r3, r2, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bl CopyColorToPaletteDataRgba
	mov r0, r4
	bl MarkPaletteDataAsNeedingUpdate
	ldmia sp!, {r4, pc}
	arm_func_end sub_020637FC

	arm_func_start sub_02063830
sub_02063830: ; 0x02063830
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r3
	mov r5, r6
	ldr r7, [sp, #0x28]
	b _0206394C
_02063854:
	mov r0, sl
	mov r1, r5
	bl sub_02063778
	cmp r0, #0
	beq _02063948
	mov r0, sl
	mov r1, r5
	bl sub_0206379C
	cmp r0, #0
	bne _02063948
	ldr r1, [sl, #8]
	mov r0, #0x18
	mla r4, r5, r0, r1
	mov r0, #0
	strb r0, [sl, #0x15]
	ldrsh r0, [r4, #4]
	sub r0, r0, #1
	strh r0, [r4, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0
	bgt _020638F4
	ldrsh r0, [r4, #2]
	add r2, r4, #0x14
	strh r0, [r4, #4]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ldrhs r1, [r4, #8]
	movhs r0, #1
	strhs r1, [r4, #0xc]
	strhsb r0, [sl, #0x15]
	ldr r3, [r4, #0xc]
	mov r1, #4
	add r0, r3, #4
	str r0, [r4, #0xc]
_020638E0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020638E0
	mov r6, #1
_020638F4:
	cmp r7, #0
	cmpeq r6, #0
	beq _02063948
	ldr r0, [sl]
	cmp r0, #0
	beq _02063924
	ldrb ip, [sl, #0x14]
	mov r2, sb
	add r1, r4, #0x14
	add r3, r8, r5
	str ip, [sp]
	bl sub_020637C8
_02063924:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _02063948
	ldrb ip, [sl, #0x14]
	mov r2, sb
	add r1, r4, #0x14
	add r3, r8, r5
	str ip, [sp]
	bl sub_020637FC
_02063948:
	add r5, r5, #1
_0206394C:
	cmp r5, fp
	blt _02063854
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02063830

	arm_func_start sub_0206395C
sub_0206395C: ; 0x0206395C
	stmdb sp!, {r3, lr}
	ldr r0, _020639AC ; =0x00000668
	mov r1, #0
	bl MemAlloc
	ldr r2, _020639B0 ; =_020B0B04
	ldr r1, _020639AC ; =0x00000668
	str r0, [r2]
	bl MemZero
	ldr r0, _020639B0 ; =_020B0B04
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x664]
	ldr r0, [r0]
	add r0, r0, #0x58
	bl sub_02064AB0
	ldr r0, _020639B0 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, #0x58
	bl sub_02064ADC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020639AC: .word 0x00000668
_020639B0: .word _020B0B04
	arm_func_end sub_0206395C

	arm_func_start sub_020639B4
sub_020639B4: ; 0x020639B4
	stmdb sp!, {r4, lr}
	ldr ip, _020639E4 ; =_020B0B04
	mov r4, r0
	ldr r0, [ip]
	mov lr, r1
	mov ip, r2
	add r0, r0, r3, lsl #5
	mov r1, r4
	mov r2, lr
	mov r3, ip
	bl sub_020646CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_020639E4: .word _020B0B04
	arm_func_end sub_020639B4

	arm_func_start sub_020639E8
sub_020639E8: ; 0x020639E8
	ldr r2, _02063A04 ; =_020B0B04
	ldr ip, _02063A08 ; =sub_02064C18
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x40
	bx ip
	.align 2, 0
_02063A04: .word _020B0B04
_02063A08: .word sub_02064C18
	arm_func_end sub_020639E8

	arm_func_start sub_02063A0C
sub_02063A0C: ; 0x02063A0C
	ldr r1, _02063A1C ; =_020B0B04
	ldr r1, [r1]
	strb r0, [r1, #0x664]
	bx lr
	.align 2, 0
_02063A1C: .word _020B0B04
	arm_func_end sub_02063A0C

	arm_func_start sub_02063A20
sub_02063A20: ; 0x02063A20
	ldr r0, _02063A30 ; =_020B0B04
	ldr r0, [r0]
	ldrb r0, [r0, #0x664]
	bx lr
	.align 2, 0
_02063A30: .word _020B0B04
	arm_func_end sub_02063A20

	arm_func_start sub_02063A34
sub_02063A34: ; 0x02063A34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl sub_02063BB8
	movs r4, r0
	mov r0, #0
	bne _02063B20
	cmp r5, #1
	bne _02063A98
	mov r2, r4
	mov r1, #2
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063A98:
	cmp r5, #2
	bne _02063AE0
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #1
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063AE0:
	mov r2, r4
	mov r1, #1
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063B20:
	cmp r5, #1
	mov r2, r4
	bne _02063B68
	mov r1, #2
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063B68:
	mov r1, #1
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
_02063BA0:
	ldr r0, _02063BB4 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, r4
	strb r5, [r0, #0x660]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063BB4: .word _020B0B04
	arm_func_end sub_02063A34

	arm_func_start sub_02063BB8
sub_02063BB8: ; 0x02063BB8
	cmp r0, #0
	cmpne r0, #2
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02063BB8

	arm_func_start sub_02063BCC
sub_02063BCC: ; 0x02063BCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl sub_02063BB8
	mov r4, r0
	cmp r5, #1
	beq _02063BFC
	cmp r5, #2
	beq _02063C60
	cmp r5, #3
	beq _02063CB4
	b _02063D18
_02063BFC:
	mov r2, r4
	mov r0, #0
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r0, #0xff
	mov r1, #0
	mov r2, r4
	bl sub_020094C4
	b _02063DCC
_02063C60:
	mov r2, r4
	mov r0, #0
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	b _02063DCC
_02063CB4:
	mov r2, r4
	mov r0, #0
	mov r1, #2
	bl sub_02009454
	mov r0, #1
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r0, #0xff
	mov r1, #0
	mov r2, r4
	bl sub_020094C4
	b _02063DCC
_02063D18:
	cmp r4, #0
	mov r2, r4
	mov r0, #0
	bne _02063D74
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	b _02063DBC
_02063D74:
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
_02063DBC:
	mov r0, #0x40
	mov r1, r0
	mov r2, r4
	bl sub_020094C4
_02063DCC:
	ldr r0, _02063DE0 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, r4
	strb r5, [r0, #0x662]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063DE0: .word _020B0B04
	arm_func_end sub_02063BCC

	arm_func_start sub_02063DE4
sub_02063DE4: ; 0x02063DE4
	stmdb sp!, {r3, lr}
	ldr r0, _02063E1C ; =_020B0B04
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x58
	bl sub_02064AFC
	ldr r0, _02063E1C ; =_020B0B04
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02063E1C ; =_020B0B04
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063E1C: .word _020B0B04
	arm_func_end sub_02063DE4

	arm_func_start sub_02063E20
sub_02063E20: ; 0x02063E20
	ldr r2, _02063E3C ; =_020B0B04
	mov r3, r0
	ldr r0, [r2]
	ldr ip, _02063E40 ; =sub_02064664
	add r0, r0, r1, lsl #5
	mov r1, r3
	bx ip
	.align 2, 0
_02063E3C: .word _020B0B04
_02063E40: .word sub_02064664
	arm_func_end sub_02063E20

	arm_func_start sub_02063E44
sub_02063E44: ; 0x02063E44
	stmdb sp!, {r3, lr}
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	ldr r1, _02063E64 ; =_020B0B04
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bl sub_0206466C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063E64: .word _020B0B04
	arm_func_end sub_02063E44

	arm_func_start sub_02063E68
sub_02063E68: ; 0x02063E68
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063E68

	arm_func_start sub_02063E7C
sub_02063E7C: ; 0x02063E7C
	ldr r1, _02063E90 ; =_020B0B04
	ldr ip, _02063E94 ; =sub_020646E0
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_02063E90: .word _020B0B04
_02063E94: .word sub_020646E0
	arm_func_end sub_02063E7C

	arm_func_start sub_02063E98
sub_02063E98: ; 0x02063E98
	ldr r1, _02063EAC ; =_020B0B04
	ldr ip, _02063EB0 ; =sub_020646E8
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_02063EAC: .word _020B0B04
_02063EB0: .word sub_020646E8
	arm_func_end sub_02063E98

	arm_func_start sub_02063EB4
sub_02063EB4: ; 0x02063EB4
	stmdb sp!, {r3, lr}
	ldr r3, _02063EDC ; =_020B0B04
	mov ip, r0
	ldr r0, [r3]
	mov r3, r1
	add r0, r0, r2, lsl #5
	mov r1, ip
	mov r2, r3
	bl sub_02064758
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063EDC: .word _020B0B04
	arm_func_end sub_02063EB4

	arm_func_start sub_02063EE0
sub_02063EE0: ; 0x02063EE0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr ip, _02063F2C ; =_020B0B04
	ldrb r4, [sp, #0x18]
	ldr r5, [ip]
	mov ip, #0x60
	str r3, [sp]
	mov r3, r2
	mov r2, r1
	ldr r1, [sp, #0x1c]
	str r4, [sp, #4]
	smlabb r0, r0, ip, r5
	str r1, [sp, #8]
	ldr lr, [sp, #0x20]
	ldr r1, [r0, #0xb0]
	add r0, r5, lr, lsl #5
	bl sub_0206478C
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02063F2C: .word _020B0B04
	arm_func_end sub_02063EE0

	arm_func_start sub_02063F30
sub_02063F30: ; 0x02063F30
	stmdb sp!, {r4, r5, r6, lr}
	ldr ip, _02063F74 ; =_020B0B04
	mov r5, r1
	ldr ip, [ip]
	mov r6, r0
	mov r1, r3
	add r0, ip, #0x40
	mov r4, r2
	bl sub_02064C58
	ldr r0, _02063F74 ; =_020B0B04
	mov r1, r6
	ldr r0, [r0]
	mov r2, r5
	mov r3, r4
	add r0, r0, #0x40
	bl sub_02064CC8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02063F74: .word _020B0B04
	arm_func_end sub_02063F30

	arm_func_start sub_02063F78
sub_02063F78: ; 0x02063F78
	stmdb sp!, {r3, lr}
	ldr r3, _02063FA0 ; =_020B0B04
	mov lr, r1
	ldr ip, [r3]
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0x40
	bl sub_02064C60
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063FA0: .word _020B0B04
	arm_func_end sub_02063F78

	arm_func_start sub_02063FA4
sub_02063FA4: ; 0x02063FA4
	ldr r2, _02063FC0 ; =_020B0B04
	ldr ip, _02063FC4 ; =sub_02064C90
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x40
	bx ip
	.align 2, 0
_02063FC0: .word _020B0B04
_02063FC4: .word sub_02064C90
	arm_func_end sub_02063FA4

	arm_func_start sub_02063FC8
sub_02063FC8: ; 0x02063FC8
	stmdb sp!, {r3, lr}
	ldr r3, _02063FF0 ; =_020B0B04
	mov lr, r1
	ldr ip, [r3]
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0x58
	bl sub_02064B0C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063FF0: .word _020B0B04
	arm_func_end sub_02063FC8

	arm_func_start sub_02063FF4
sub_02063FF4: ; 0x02063FF4
	ldr r2, _0206400C ; =_020B0B04
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02064010 ; =sub_02064C0C
	add r0, r0, #0x58
	bx ip
	.align 2, 0
_0206400C: .word _020B0B04
_02064010: .word sub_02064C0C
	arm_func_end sub_02063FF4

	arm_func_start sub_02064014
sub_02064014: ; 0x02064014
	stmdb sp!, {r3, lr}
	ldr ip, _02064048 ; =_020B0B04
	mov r3, #0x60
	ldr ip, [ip]
	mov lr, r1
	smlabb r0, r0, r3, ip
	ldr r3, [r0, #0xb0]
	add r0, ip, r2, lsl #5
	ldr r1, [r3, #0xc]
	ldr r3, [r3, #8]
	mov r2, lr
	bl sub_020646F0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02064048: .word _020B0B04
	arm_func_end sub_02064014

	arm_func_start sub_0206404C
sub_0206404C: ; 0x0206404C
	ldr r2, _02064074 ; =_020B0B04
	ldr ip, _02064078 ; =sub_020648FC
	ldr r3, [r2]
	mov r2, #0x60
	smlabb r0, r0, r2, r3
	ldr r2, [r0, #0xb0]
	add r0, r3, r1, lsl #5
	ldr r1, [r2, #0x10]
	mov r2, #0x10
	bx ip
	.align 2, 0
_02064074: .word _020B0B04
_02064078: .word sub_020648FC
	arm_func_end sub_0206404C

	arm_func_start sub_0206407C
sub_0206407C: ; 0x0206407C
	ldr r2, _02064094 ; =_020B0B04
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02064098 ; =sub_02064FE4
	add r0, r0, #0x40
	bx ip
	.align 2, 0
_02064094: .word _020B0B04
_02064098: .word sub_02064FE4
	arm_func_end sub_0206407C

	arm_func_start sub_0206409C
sub_0206409C: ; 0x0206409C
	ldr r2, _020640B8 ; =_020B0B04
	mov r1, #0x60
	ldr r2, [r2]
	add r2, r2, #0x58
	smlabb r0, r0, r1, r2
	add r0, r0, #0x50
	bx lr
	.align 2, 0
_020640B8: .word _020B0B04
	arm_func_end sub_0206409C

	arm_func_start sub_020640BC
sub_020640BC: ; 0x020640BC
	ldr ip, _020640C8 ; =MemZero
	mov r1, #0x40
	bx ip
	.align 2, 0
_020640C8: .word MemZero
	arm_func_end sub_020640BC

	arm_func_start sub_020640CC
sub_020640CC: ; 0x020640CC
	strh r1, [r0]
	bx lr
	arm_func_end sub_020640CC

	arm_func_start sub_020640D4
sub_020640D4: ; 0x020640D4
	strb r1, [r0, #0x3c]
	bx lr
	arm_func_end sub_020640D4

	arm_func_start sub_020640DC
sub_020640DC: ; 0x020640DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	str r5, [r6, #0xc]
	mov r0, #1
	strb r0, [r6, #0x3d]
	mov r0, #0
	strb r0, [r6, #0x3e]
	str r0, [r6, #0x10]
	ldrsh r0, [r6]
	bl sub_0206409C
	mov r4, r0
	mov r0, r5
	bl sub_02064228
	mov r1, r0
	add r0, r6, #0x2c
	bl sub_02009498
	mov r0, r5
	bl sub_02064228
	mov r2, r0
	add r0, r6, #0x32
	add r1, r6, #0x34
	bl sub_020094E8
	mov r0, r5
	bl sub_02064228
	mov r1, r0
	add r0, r6, #0x28
	bl sub_020090F4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020641E4
	mov r0, r5
	bl sub_02063E98
	ldr r2, [r0, #4]
	mov r1, #0
	strh r2, [r6, #0x38]
	ldr r2, [r0, #8]
	strh r2, [r6, #0x3a]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #8]
	stmib r6, {r0, r1}
	bl sub_02063A20
	cmp r0, #0
	mov r0, #0
	beq _020641A0
	mov r1, r5
	bl sub_02063A34
	b _020641C8
_020641A0:
	mov r2, r0
	mov r1, #1
	bl sub_02009454
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl sub_02009454
	mov r1, r5
	mov r0, #1
	bl sub_02063A34
_020641C8:
	ldrsh r0, [r6]
	mov r1, r5
	bl sub_0206404C
	mov r1, r5
	mov r0, #0
	bl sub_02063E20
	b _02064220
_020641E4:
	mov r0, #0
	str r0, [r6, #4]
	ldr r0, [r4, #0xc]
	str r0, [r6, #8]
	ldr r1, [r6, #0x10]
	bl sub_02063FA4
	ldr r0, [r6, #8]
	bl sub_0206407C
	mov r0, #0
	mov r1, #2
	bl sub_02063E20
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x10]
	add r2, r6, #0x14
	bl sub_02063F78
_02064220:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020640DC

	arm_func_start sub_02064228
sub_02064228: ; 0x02064228
	cmp r0, #0
	cmpne r0, #2
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02064228

	arm_func_start sub_0206423C
sub_0206423C: ; 0x0206423C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0xc]
	cmp r0, #2
	beq _02064264
	bl sub_02063E98
	ldrsh r1, [r4, #0x38]
	str r1, [r0, #4]
	ldrsh r1, [r4, #0x3a]
	str r1, [r0, #8]
_02064264:
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r1, r0
	add r0, r4, #0x2c
	bl sub_0200946C
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r2, r0
	ldrsh r0, [r4, #0x32]
	ldrsh r1, [r4, #0x34]
	bl sub_020094C4
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r1, r0
	add r0, r4, #0x28
	bl sub_020090C0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206423C

	arm_func_start sub_020642A8
sub_020642A8: ; 0x020642A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _020645C0
	ldrb r1, [r5, #0x3e]
	ldr r4, [r5, #0xc]
	cmp r1, #0
	beq _020642DC
	bl sub_0206423C
	mov r0, #0
	b _02064658
_020642DC:
	ldrb r0, [r5, #0x3c]
	cmp r0, #0
	movne r0, #1
	bne _02064658
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _02064484
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0x14
	stmib sp, {r0, r4}
	mov r2, #0
	ldrsh r0, [r5]
	mov r3, r2
	add r1, r5, #0x10
	bl sub_02063EE0
	mov r6, r0
	ldr r2, [r5, #0xc]
	add r0, sp, #0xc
	mov r1, #4
	bl sub_02063EB4
	cmp r6, #0
	beq _02064464
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r5, #0x1c]
	movne r0, #0
	strne r0, [r5, #0x20]
	strne r0, [r5, #0x24]
	ldrsh r1, [sp, #0xe]
	cmp r1, #0
	beq _020643A4
	cmp r1, #0x63
	ldreq r1, _02064660 ; =0x00000C1C
	moveq r0, #0
	streq r1, [r5, #0x20]
	streq r0, [r5, #0x24]
	beq _020643A4
	cmp r1, #0
	ldr r0, _02064660 ; =0x00000C1C
	ble _02064394
	bl _s32_div_f
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	b _020643A4
_02064394:
	str r0, [r5, #0x20]
	ldrsh r1, [sp, #0xe]
	bl _s32_div_f
	str r0, [r5, #0x24]
_020643A4:
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _02064478
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x20]
	ldr r2, [r1, #0x10]
	mov r1, #0x64
	add sb, r2, #0x380
	bl _s32_div_f
	mov r8, #0
	mov r7, r0
	mov r6, r8
_020643D4:
	mov r0, r4
	bl sub_02063E7C
	add r1, r8, #0xe0
	mov r2, r1, lsl #0x10
	mov r1, sb
	mov r3, r7
	mov r2, r2, asr #0x10
	str r6, [sp]
	bl sub_0200C020
	add r8, r8, #1
	cmp r8, #0x10
	add sb, sb, #4
	blt _020643D4
	mov r0, r4
	bl sub_02063E7C
	bl MarkPaletteDataAsNeedingUpdate
	mov r1, r4
	mov r0, #3
	bl sub_02063BCC
	mov r0, r4
	bl sub_02063E68
	mov r2, r0
	mov r0, #0x50
	mov r1, r0
	bl sub_020094C4
	ldr r1, [r5, #0x20]
	ldr r0, [r5, #0x24]
	adds r1, r1, r0
	str r1, [r5, #0x20]
	movmi r0, #0
	strmi r0, [r5, #0x20]
	bmi _02064478
	ldr r0, _02064660 ; =0x00000C1C
	cmp r1, r0
	strgt r0, [r5, #0x20]
	b _02064478
_02064464:
	mov r0, r4
	bl sub_02063E44
	mov r0, #1
	strb r0, [r5, #0x3e]
	b _02064658
_02064478:
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
_02064484:
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	bne _020645AC
	ldrsh r0, [r5]
	bl sub_0206409C
	ldr r1, [r5, #0x10]
	mov r8, #0xff
	subs r2, r1, #1
	ldr r1, [r0, #8]
	movmi r2, #0
	cmp r1, #0
	beq _020645AC
	ldmia r1, {r0, r1}
	sub r0, r0, #1
	cmp r2, r0
	ldr r7, [r1, r2, lsl #2]
	bne _02064504
	ldr r1, [r7, #0x1c]
	mov r0, r4
	mov r1, r1, asr #8
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #24
	add r8, r2, r1, ror #24
	bl sub_02063E68
	rsb r1, r8, #0xff
	mov r3, r1, lsl #0x10
	mov r1, r8, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r3, asr #0x10
	bl sub_020094C4
	b _0206458C
_02064504:
	ldrsh r0, [r7, #0xc]
	add r1, r1, r2, lsl #2
	ldr r6, [r1, #4]
	cmp r0, #0
	bne _0206458C
	ldr r0, [r7, #0x1c]
	cmp r0, #0xff00
	beq _0206458C
	ldrsh r1, [r7, #8]
	ldr r0, [r5, #0x14]
	sub r0, r1, r0
	mov r0, r0, lsl #8
	mov r1, r1, lsl #8
	bl sub_02001AB0
	ldr r7, [r7, #0x1c]
	ldr r1, [r6, #0x1c]
	sub r1, r1, r7
	bl MultiplyByFixedPoint
	add r0, r0, r7
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r8, r1, r0, ror #24
	add r1, r8, r8, lsr #31
	mov r0, r4
	mov r6, r1, asr #1
	bl sub_02063E68
	rsb r1, r6, #0x80
	mov r3, r1, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r3, asr #0x10
	bl sub_020094C4
_0206458C:
	cmp r8, #0xff
	mov r1, r4
	bne _020645A4
	mov r0, #0
	bl sub_02063BCC
	b _020645AC
_020645A4:
	mov r0, #2
	bl sub_02063BCC
_020645AC:
	ldr r1, [r5, #0x14]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r5, #0x14]
	b _02064658
_020645C0:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02064654
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0206460C
	ldr r0, [r5, #0x10]
	add r2, r5, #0x14
	add r1, r0, #1
	str r1, [r5, #0x10]
	ldr r0, [r5, #8]
	bl sub_02063F78
	cmp r0, #0
	bne _0206460C
	mov r1, #0
	str r1, [r5, #0x10]
	ldr r0, [r5, #8]
	add r2, r5, #0x14
	bl sub_02063F78
_0206460C:
	ldrb r0, [r5, #0x3c]
	ldr r1, [r5, #0x10]
	cmp r0, #0
	ldr r0, [r5, #8]
	beq _02064634
	ldr r2, [r5, #0x14]
	mov r3, #1
	bl sub_02063F30
	mov r0, #1
	b _02064658
_02064634:
	ldr r2, [r5, #0x14]
	mov r3, #0
	bl sub_02063F30
	ldr r1, [r5, #0x14]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r5, #0x14]
	b _02064658
_02064654:
	mov r0, #0
_02064658:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02064660: .word 0x00000C1C
	arm_func_end sub_020642A8

	arm_func_start sub_02064664
sub_02064664: ; 0x02064664
	strh r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02064664

	arm_func_start sub_0206466C
sub_0206466C: ; 0x0206466C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, #0
	mov sb, r0
	add r5, sp, #0
	mov r4, r8
	mov r6, r8
_02064688:
	mov r7, r6
_0206468C:
	str r8, [sp, #4]
	str r7, [sp]
	ldr r0, [sb, #8]
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	add r7, r7, #1
	cmp r7, #0x40
	blt _0206468C
	add r8, r8, #1
	cmp r8, #0x20
	blt _02064688
	ldr r0, [sb, #8]
	bl sub_0200B330
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0206466C

	arm_func_start sub_020646CC
sub_020646CC: ; 0x020646CC
	stmib r0, {r1, r2}
	mov r1, #0
	str r1, [r0, #0xc]
	str r3, [r0, #0x10]
	bx lr
	arm_func_end sub_020646CC

	arm_func_start sub_020646E0
sub_020646E0: ; 0x020646E0
	ldr r0, [r0, #0x10]
	bx lr
	arm_func_end sub_020646E0

	arm_func_start sub_020646E8
sub_020646E8: ; 0x020646E8
	ldr r0, [r0, #8]
	bx lr
	arm_func_end sub_020646E8

	arm_func_start sub_020646F0
sub_020646F0: ; 0x020646F0
	ldr r0, [r0, #4]
	mov ip, #0
	add r2, r0, r2
	b _0206474C
_02064700:
	ldr r0, [r1]
	add ip, ip, #1
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	str r0, [r2, #8]
	ldr r0, [r1, #0xc]
	str r0, [r2, #0xc]
	ldr r0, [r1, #0x10]
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x14]
	str r0, [r2, #0x14]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x18]
	ldr r0, [r1, #0x1c]
	add r1, r1, #0x20
	str r0, [r2, #0x1c]
	add r2, r2, #0x20
_0206474C:
	cmp ip, r3
	bls _02064700
	bx lr
	arm_func_end sub_020646F0

	arm_func_start sub_02064758
sub_02064758: ; 0x02064758
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02064780
_02064764:
	add r3, r0, lr, lsl #1
	ldrsh ip, [r3, #0x16]
	add r3, lr, #1
	mov lr, lr, lsl #1
	mov r3, r3, lsl #0x10
	strh ip, [r1, lr]
	mov lr, r3, lsr #0x10
_02064780:
	cmp lr, r2
	blo _02064764
	ldmia sp!, {r3, pc}
	arm_func_end sub_02064758

	arm_func_start sub_0206478C
sub_0206478C: ; 0x0206478C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldrb r6, [sp, #0x3c]
	mov sl, r0
	mov r5, r1
	mov r4, r2
	str r3, [sp]
	cmp r6, #0
	beq _020647B4
	bl sub_0206466C
_020647B4:
	ldr r2, [r5, #0x14]
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _020647DC
	ldrb r0, [r2, #0xa]
	ldr r1, [r4]
	cmp r1, r0
	ldrgeb r0, [r2, #9]
	strge r0, [r4]
	b _020647F0
_020647DC:
	ldr r1, [r4]
	ldr r0, [r5]
	cmp r1, r0
	movge r0, #0
	bge _020648F0
_020647F0:
	ldr r2, [r5, #4]
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	ldr r2, [r2, r0, lsl #2]
	mov sb, #0
	ldrsh r0, [r2, #6]
	cmp r1, #0
	ldrsh r8, [r2, #4]
	str r0, [sp, #4]
	ldrnesh r0, [r2, #8]
	mov r5, sb
	add fp, r2, #0x24
	strne r0, [r1]
	ldrsh r0, [r2, #0xc]
	ldrsh r7, [sp, #0x38]
	strh r0, [sl, #0x16]
	ldrsh r0, [r2, #0xe]
	strh r0, [sl, #0x18]
	ldrsh r0, [r2, #0x10]
	strh r0, [sl, #0x1a]
	ldrsh r0, [r2, #0x12]
	strh r0, [sl, #0x1c]
	b _020648D8
_0206484C:
	cmp r7, #0x18
	bge _020648E4
	ldr r6, [sp]
	mov r4, #0
	cmp r8, #0
	ble _020648D0
	b _020648C8
_02064868:
	cmp sb, #0
	bne _02064888
	ldrh r2, [fp], #2
	tst r2, #0xf000
	ldreq r0, _020648F8 ; =0x000003FF
	andeq sb, r2, r0
	moveq r2, #0
	b _0206488C
_02064888:
	mov r2, #0
_0206488C:
	cmp sb, #0
	subne sb, sb, #1
	cmp r6, #0
	blt _020648C0
	cmp r6, #0x20
	bge _020648C0
	cmp r7, #0
	blt _020648C0
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sl, #8]
	add r1, sp, #8
	bl sub_0200B3FC
_020648C0:
	add r4, r4, #1
	add r6, r6, #1
_020648C8:
	cmp r4, r8
	blt _02064868
_020648D0:
	add r5, r5, #1
	add r7, r7, #1
_020648D8:
	ldr r0, [sp, #4]
	cmp r5, r0
	blt _0206484C
_020648E4:
	ldr r0, [sl, #8]
	bl sub_0200B330
	mov r0, #1
_020648F0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020648F8: .word 0x000003FF
	arm_func_end sub_0206478C

	arm_func_start sub_020648FC
sub_020648FC: ; 0x020648FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	beq _02064930
	mov r2, r6
	mov r3, r5
	mov r1, #0xe0
	bl FillPaletteDataRgba
	ldr r0, [r7, #0x10]
	bl MarkPaletteDataAsNeedingUpdate
_02064930:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, #0
	b _02064960
_02064944:
	add r0, r4, #0xe0
	mov r1, r0, lsl #0x10
	ldr r0, [r7, #0xc]
	mov r1, r1, lsr #0x10
	add r2, r6, r4, lsl #2
	bl sub_0200A29C
	add r4, r4, #1
_02064960:
	cmp r4, r5
	blt _02064944
	ldr r0, [r7, #0xc]
	bl sub_0200A174
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020648FC

	arm_func_start sub_02064974
sub_02064974: ; 0x02064974
	stmdb sp!, {r4, lr}
	mov r2, #0x60
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x40]
	cmp r0, #0
	beq _0206499C
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0206499C:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r4, #0x41]
	cmp r1, #2
	bne _020649CC
	bl MemFree
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	ldr r0, _020649EC ; =_020A46B0
	bl Debug_Print0
	b _020649DC
_020649CC:
	bl MemFree
	ldr r0, _020649F0 ; =_020A46D0
	mov r1, r4
	bl Debug_Print0
_020649DC:
	mov r0, r4
	mov r1, #0x60
	bl MemZero
	ldmia sp!, {r4, pc}
	.align 2, 0
_020649EC: .word _020A46B0
_020649F0: .word _020A46D0
	arm_func_end sub_02064974

	arm_func_start sub_020649F4
sub_020649F4: ; 0x020649F4
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x600
	mov lr, #1
	ldrsh r4, [r1, #2]
	ldrsh r5, [r1]
	mov ip, lr
	mov r3, #0x60
	b _02064A6C
_02064A14:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x50]
	cmp r1, #0
	bne _02064A54
	add r1, r4, #1
	add r0, r0, #0x600
	strh r1, [r0, #2]
	ldrsh r2, [r0, #2]
	ldrsh r1, [r0]
	cmp r2, r1
	movge r1, #1
	strgeh r1, [r0, #2]
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02064A54:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_02064A6C:
	cmp lr, r5
	blt _02064A14
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020649F4

	arm_func_start sub_02064A7C
sub_02064A7C: ; 0x02064A7C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r1
	ldr r1, [r0, #0x50]
	add r0, sp, #0
	bl HandleSir0TranslationVeneer
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4]
	ldr r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_02064A7C

	arm_func_start sub_02064AB0
sub_02064AB0: ; 0x02064AB0
	stmdb sp!, {r4, lr}
	ldr r1, _02064AD8 ; =0x00000608
	mov r4, r0
	bl MemZero
	add r0, r4, #0x600
	mov r1, #1
	strh r1, [r0, #2]
	strb r1, [r4, #0x604]
	strh r1, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02064AD8: .word 0x00000608
	arm_func_end sub_02064AB0

	arm_func_start sub_02064ADC
sub_02064ADC: ; 0x02064ADC
	stmdb sp!, {r4, lr}
	mov r1, #0x600
	mov r4, r0
	bl MemZero
	add r0, r4, #0x600
	mov r1, #0x10
	strh r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02064ADC

	arm_func_start sub_02064AFC
sub_02064AFC: ; 0x02064AFC
	add r0, r0, #0x600
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_02064AFC

	arm_func_start sub_02064B0C
sub_02064B0C: ; 0x02064B0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, r0
	add r0, r5, #0x600
	mov r8, r1
	ldrsh r4, [r0]
	mov r7, r2
	mov r6, r3
	mov r0, #1
	mov r1, #0x60
	b _02064B64
_02064B38:
	smlabb r3, r0, r1, r5
	ldrb r2, [r3, #0x41]
	cmp r2, #2
	ldreq r2, [r3, #0x44]
	cmpeq r8, r2
	ldreq r2, [r3, #0x48]
	cmpeq r7, r2
	beq _02064B70
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_02064B64:
	cmp r0, r4
	blt _02064B38
	mvn r0, #0
_02064B70:
	mvn r1, #0
	cmp r0, r1
	beq _02064B94
	mov r1, #0x60
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x4c]
	add r1, r1, #1
	strh r1, [r2, #0x4c]
	b _02064C04
_02064B94:
	mov r0, r5
	bl sub_020649F4
	mov r4, r0
	mov r0, #0x60
	smlabb r5, r4, r0, r5
	mov r0, #2
	strb r0, [r5, #0x41]
	str r8, [r5, #0x44]
	mov r0, r8
	mov r1, r7
	mov r3, r6
	str r7, [r5, #0x48]
	add r2, r5, #0x50
	bl DirectoryFileMngr_OpenDirectoryFile
	ldrsh r2, [r5, #0x4c]
	add r1, sp, #0
	mov r0, r5
	add r2, r2, #1
	strh r2, [r5, #0x4c]
	bl sub_02064A7C
	ldrb r1, [sp]
	cmp r1, #0
	movne r1, #0
	strne r1, [r5, #0x58]
	streq r0, [r5, #0x58]
	moveq r0, #0
	str r0, [r5, #0x5c]
	mov r0, r4
_02064C04:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02064B0C

	arm_func_start sub_02064C0C
sub_02064C0C: ; 0x02064C0C
	ldr ip, _02064C14 ; =sub_02064974
	bx ip
	.align 2, 0
_02064C14: .word sub_02064974
	arm_func_end sub_02064C0C

	arm_func_start sub_02064C18
sub_02064C18: ; 0x02064C18
	str r1, [r0, #4]
	strh r2, [r0, #8]
	bx lr
	arm_func_end sub_02064C18

	arm_func_start sub_02064C24
sub_02064C24: ; 0x02064C24
	stmdb sp!, {r4, lr}
	mov lr, r1
	ldr ip, [lr, #0x10]
	ldr r1, [lr, #0x18]
	add ip, lr, ip
	mov r4, r0
	mla r0, r1, r3, ip
	ldr r1, [r4, #4]
	mov r3, #0
	add r1, r1, r2
	ldr r2, [lr, #0x14]
	bl sub_0201E050
	ldmia sp!, {r4, pc}
	arm_func_end sub_02064C24

	arm_func_start sub_02064C58
sub_02064C58: ; 0x02064C58
	strb r1, [r0, #0x16]
	bx lr
	arm_func_end sub_02064C58

	arm_func_start sub_02064C60
sub_02064C60: ; 0x02064C60
	ldr r0, [r1, #0xc]
	cmp r2, r0
	movhs r0, #0
	bxhs lr
	ldr ip, [r1, #8]
	mov r0, #0x2c
	add r1, r1, ip
	mla r0, r2, r0, r1
	ldrsh r1, [r0, #8]
	mov r0, #1
	str r1, [r3]
	bx lr
	arm_func_end sub_02064C60

	arm_func_start sub_02064C90
sub_02064C90: ; 0x02064C90
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xc]
	cmp r2, r3
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr ip, [r1, #8]
	mov r3, #0x2c
	add ip, r1, ip
	mla r3, r2, r3, ip
	ldrsh r3, [r3, #0x18]
	mov r2, #0
	bl sub_02064C24
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02064C90

	arm_func_start sub_02064CC8
sub_02064CC8: ; 0x02064CC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r4, [r1, #0xc]
	mov sl, r0
	cmp r2, r4
	movhs r0, #0
	bhs _02064F84
	ldr r0, [r1, #0x28]
	ldr r4, _02064F8C ; =_020AFC70
	ldr r6, [r1, #8]
	ldr r5, [sl, #4]
	ldr r7, [r4]
	str r5, [sp, #0x14]
	add r5, r1, r6
	mov r4, #0x2c
	mla r4, r2, r4, r5
	ldrsh r6, [sl, #8]
	ldr r7, [r7, #0xe0]
	add r0, r1, r0
	add r6, r7, r6, lsl #9
	str r6, [sp, #0x18]
	ldrsh r8, [r4, #0x18]
	add r7, sp, #0x1c
	mov r6, #4
	add r8, r0, r8, lsl #3
_02064D2C:
	ldrh r0, [r8], #2
	subs r6, r6, #1
	strh r0, [r7], #2
	bne _02064D2C
	ldrh r0, [r1, #4]
	ldr r8, _02064F90 ; =0x00007FFF
	mov r7, #0
	bic sb, r0, #0x1800
	mov r6, #0x39
	mov r0, #0x21
	strh sb, [sp, #0x24]
	strh r8, [sp, #0x36]
	strh r8, [sp, #0x38]
	strh r8, [sp, #0x3a]
	strh r8, [sp, #0x3c]
	strh r7, [sp, #0x3e]
	strh r6, [sp, #0x12]
	strb r7, [sp, #0x42]
	strb r0, [sp, #0x40]
	ldr r0, [r1, #0xc]
	sub r0, r0, #1
	cmp r2, r0
	bne _02064DA0
	ldrh r0, [r4, #0xa]
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r1, r1, r0, ror #24
	b _02064DEC
_02064DA0:
	add r2, r2, #1
	mov r0, #0x2c
	mla r5, r2, r0, r5
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	beq _02064DEC
	ldrsh r1, [r5, #8]
	sub r0, r1, r3
	mov r0, r0, lsl #8
	mov r1, r1, lsl #8
	bl sub_02001AB0
	ldrh r5, [r5, #0xa]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r0, r0, r5
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r1, r1, r0, ror #24
_02064DEC:
	ldrsh r6, [sp, #0x20]
	and r0, r1, #0xf8
	mov r2, r0, asr #3
	mov r1, r6
	mov r0, #0x100
	strb r2, [sp, #0x41]
	ldrsh r7, [sp, #0x22]
	bl _s32_div_f
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	mov r1, r6
	mov r0, #0x100
	bl _s32_div_f
	add r0, r0, r5
	mov r2, r0, lsl #0x10
	mov r1, r7
	mov r0, #0xc0
	mov r5, r2, asr #0x10
	bl _s32_div_f
	add r2, r5, #1
	cmp r1, #0
	str r2, [sp]
	ldrsh r2, [sl, #0x14]
	movne sb, #1
	moveq sb, #0
	mov r1, r7
	mov r0, #0xc0
	ldrsh r5, [sl, #0x12]
	str r2, [sp, #4]
	mvn r8, #0
	bl _s32_div_f
	add r0, r0, sb
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add fp, r0, #1
	b _02064F2C
_02064E80:
	ldr r0, [sp, #4]
	add r1, r8, #1
	mla r2, r8, r7, r0
	mla r1, r7, r1, r0
	mov r0, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsl #0x10
	str r0, [sp, #8]
	mov r0, r1, asr #0x10
	mvn sb, #0
	str r0, [sp, #0xc]
	b _02064F14
_02064EB0:
	add r0, sb, #1
	mla r0, r6, r0, r5
	strh r0, [sp, #0x2a]
	mla r0, sb, r6, r5
	strh r0, [sp, #0x26]
	ldr r0, [sp, #8]
	ldrsh r1, [sp, #0x26]
	strh r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	ldrsh r2, [sp, #0x28]
	strh r0, [sp, #0x30]
	ldrb r0, [sp, #0x40]
	strh r2, [sp, #0x2c]
	strh r1, [sp, #0x2e]
	ldrsh r2, [sp, #0x2a]
	ldrsh r1, [sp, #0x30]
	add r0, r0, #1
	strb r0, [sp, #0x40]
	add r0, sp, #0x10
	strh r2, [sp, #0x32]
	strh r1, [sp, #0x34]
	bl EnqueueRender3dTiling
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02064F14:
	ldr r0, [sp]
	cmp sb, r0
	blt _02064EB0
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02064F2C:
	cmp r8, fp
	blt _02064E80
	ldrb r0, [sl, #0x16]
	cmp r0, #0
	bne _02064F80
	ldrsh r2, [sl, #0x12]
	ldrsh r0, [r4, #0x14]
	mov r1, r6
	add r0, r2, r0
	strh r0, [sl, #0x12]
	ldrsh r2, [sl, #0x14]
	ldrsh r0, [r4, #0x16]
	add r0, r2, r0
	strh r0, [sl, #0x14]
	ldrsh r0, [sl, #0x12]
	bl _s32_div_f
	strh r1, [sl, #0x12]
	ldrsh r0, [sl, #0x14]
	mov r1, r7
	bl _s32_div_f
	strh r1, [sl, #0x14]
_02064F80:
	mov r0, #1
_02064F84:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02064F8C: .word _020AFC70
_02064F90: .word 0x00007FFF
	arm_func_end sub_02064CC8
