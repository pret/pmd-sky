	.include "asm/macros.inc"
	.include "main_0205EDA4.inc"

	.text

	arm_func_start DungeonRequestsDone
DungeonRequestsDone: ; 0x0205EDA4
	stmdb sp!, {r4, lr}
	ldr r2, _0205EE0C ; =MISSION_DELIVER_LIST_PTR
	mov ip, #0
	ldr r2, [r2, #0x18]
	mov lr, ip
	add r3, r2, #0x100
_0205EDBC:
	mov r2, lr, lsl #0x18
	add r4, r3, r2, asr #19
	ldrb r2, [r4, #4]
	cmp r2, r0
	bne _0205EDF8
	cmp r1, #0
	beq _0205EDE4
	ldrb r2, [r4, #1]
	cmp r2, #0xc
	beq _0205EDF8
_0205EDE4:
	ldrb r2, [r4]
	add r2, r2, #0xfb
	and r2, r2, #0xff
	cmp r2, #3
	addls ip, ip, #1
_0205EDF8:
	add lr, lr, #1
	cmp lr, #8
	blt _0205EDBC
	mov r0, ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205EE0C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DungeonRequestsDone

	arm_func_start DungeonRequestsDoneWrapper
DungeonRequestsDoneWrapper: ; 0x0205EE10
	ldr ip, _0205EE1C ; =DungeonRequestsDone
	mov r1, #0
	bx ip
	.align 2, 0
_0205EE1C: .word DungeonRequestsDone
	arm_func_end DungeonRequestsDoneWrapper

	arm_func_start AnyDungeonRequestsDone
AnyDungeonRequestsDone: ; 0x0205EE20
	stmdb sp!, {r3, lr}
	mov r1, #1
	bl DungeonRequestsDone
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end AnyDungeonRequestsDone

	arm_func_start sub_0205EE40
sub_0205EE40: ; 0x0205EE40
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	str r0, [sp]
	mov sl, r1
	mov sb, r2
	bl GetMaxMembersAllowed
	cmp r0, #1
	bne _0205EE80
	bl GetAppointedLeaderMemberIdx
	strh r0, [sp, #4]
	ldrsh r0, [sp, #4]
	cmp r0, #0
	movlt r0, #1
	blt _0205EFFC
	mov r4, #1
	b _0205EE98
_0205EE80:
	add r0, sp, #4
	bl GetPartyMembers
	mov r4, r0
	cmp r4, #1
	movlt r0, #1
	blt _0205EFFC
_0205EE98:
	mov r5, #0
	strh r5, [sl]
	strh r5, [sb]
_0205EEA4:
	ldr r1, _0205F004 ; =MISSION_DELIVER_LIST_PTR
	mov r0, r5, lsl #0x18
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r2, r1, r0, asr #19
	ldrb r1, [r2, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldreqb r0, [r2]
	cmpeq r0, #5
	bne _0205EFD8
	ldrb r0, [r2, #0x1a]
	cmp r0, #0
	bne _0205EF54
	ldrh r8, [r2, #0x1c]
	cmp r8, #0
	beq _0205EFD8
	mov r6, #0
	add fp, sp, #4
	b _0205EF40
_0205EEF4:
	mov r0, r6, lsl #1
	ldrsh r2, [fp, r0]
	ldr r0, _0205F008 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0
	ldr r3, [r0]
	mov r0, #0x44
	smlabb r7, r2, r0, r3
	ldrsh r0, [r7, #4]
	bl GetType
	cmp r8, r0
	beq _0205EF34
	ldrsh r0, [r7, #4]
	mov r1, #1
	bl GetType
	cmp r8, r0
	bne _0205EF3C
_0205EF34:
	mov r8, #0
	b _0205EF48
_0205EF3C:
	add r6, r6, #1
_0205EF40:
	cmp r6, r4
	blt _0205EEF4
_0205EF48:
	cmp r8, #0
	strneh r8, [sl]
	b _0205EFD8
_0205EF54:
	cmp r0, #1
	bne _0205EFD8
	ldrsh r6, [r2, #0x1c]
	mov r0, r6
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	mov r7, r0
	bl FemaleToMaleForm
	mov fp, r0
	mov r0, r7
	bl GetSecondFormIfValid
	mov r7, r0
	cmp r6, #0
	beq _0205EFD8
	mov r8, #0
	b _0205EFC8
_0205EF90:
	mov r1, r8, lsl #1
	add r0, sp, #4
	ldrsh r1, [r0, r1]
	ldr r0, _0205F008 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	mov r0, #0x44
	smlabb r0, r1, r0, r2
	ldrsh r0, [r0, #4]
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	cmp r0, fp
	cmpne r0, r7
	moveq r6, #0
	beq _0205EFD0
	add r8, r8, #1
_0205EFC8:
	cmp r8, r4
	blt _0205EF90
_0205EFD0:
	cmp r6, #0
	strneh r6, [sb]
_0205EFD8:
	add r5, r5, #1
	cmp r5, #8
	blt _0205EEA4
	ldrh r0, [sl]
	cmp r0, #0
	ldreqsh r0, [sb]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
_0205EFFC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205F004: .word MISSION_DELIVER_LIST_PTR
_0205F008: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205EE40

	arm_func_start sub_0205F00C
sub_0205F00C: ; 0x0205F00C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0205F0B4 ; =MISSION_DELIVER_LIST_PTR
	mov ip, #0
	ldr r2, [r2, #0x18]
	add r3, r2, #0x100
	b _0205F0A0
_0205F028:
	mov r2, ip, lsl #0x18
	add r4, r3, r2, asr #19
	ldrb r2, [r4, #4]
	cmp r2, r0
	ldreqb r2, [r4]
	cmpeq r2, #5
	bne _0205F09C
	ldrb r2, [r4, #1]
	cmp r2, #2
	cmpne r2, #3
	cmpne r2, #4
	cmpne r2, #5
	beq _0205F06C
	cmp r2, #0xa
	ldreqb r2, [r4, #2]
	cmpeq r2, #4
	bne _0205F09C
_0205F06C:
	mov r2, #0xfa
	mov r0, #1
	strb r2, [sp, #4]
	strb r0, [sp, #5]
	mov r2, #0
	str r2, [sp]
	mov r0, r1
	ldrsh r1, [r4, #0xe]
	add r3, sp, #4
	bl sub_02052E2C
	mov r0, r4
	b _0205F0AC
_0205F09C:
	add ip, ip, #1
_0205F0A0:
	cmp ip, #8
	blt _0205F028
	mov r0, #0
_0205F0AC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205F0B4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F00C

	arm_func_start AddMissionToJobList
AddMissionToJobList: ; 0x0205F0B8
	ldr r2, _0205F0D0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F0D4 ; =sub_0205E3F8
	ldr r2, [r2, #0x18]
	mov r1, #8
	add r2, r2, #0x100
	bx ip
	.align 2, 0
_0205F0D0: .word MISSION_DELIVER_LIST_PTR
_0205F0D4: .word sub_0205E3F8
	arm_func_end AddMissionToJobList

	arm_func_start GetAcceptedMission
GetAcceptedMission: ; 0x0205F0D8
	ldr r1, _0205F0EC ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205F0EC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetAcceptedMission

	arm_func_start IsAcceptedMissionSlotEmpty
IsAcceptedMissionSlotEmpty: ; 0x0205F0F0
	ldr r1, _0205F114 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x100]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205F114: .word MISSION_DELIVER_LIST_PTR
	arm_func_end IsAcceptedMissionSlotEmpty

	arm_func_start WasMissionCompletedToday
WasMissionCompletedToday: ; 0x0205F118
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r3, #0
	mov r5, r1
	strb r3, [r6]
	ldrsh r0, [r5, #0xe]
	mov r4, r2
	strh r0, [r6, #2]
	strh r3, [r6, #4]
	ldrb r0, [r5, #1]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _0205F29C
_0205F14C: ; jump table
	b _0205F204 ; case 0
	b _0205F218 ; case 1
	b _0205F218 ; case 2
	b _0205F204 ; case 3
	b _0205F1DC ; case 4
	b _0205F204 ; case 5
	b _0205F180 ; case 6
	b _0205F204 ; case 7
	b _0205F218 ; case 8
	b _0205F234 ; case 9
	b _0205F218 ; case 10
	b _0205F260 ; case 11
	b _0205F27C ; case 12
_0205F180:
	ldrb r0, [r5, #2]
	cmp r0, #4
	ldrb r0, [r5]
	bne _0205F1B8
	add r0, r0, #0xfb
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F1B8:
	cmp r0, #5
	cmpne r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F1DC:
	ldrb r0, [r5]
	cmp r0, #5
	cmpne r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F204:
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F218:
	ldrsh r0, [r5, #0x10]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F234:
	ldrsh r0, [r5, #0x10]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F260:
	ldrsh r0, [r5, #0xe]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F27C:
	ldrb r0, [r5]
	cmp r0, #8
#ifdef JAPAN
	moveq r0, #1
	streqb r0, [r6]
#else
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInTreasureBoxes
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
#endif
_0205F29C:
	cmp r4, #0xff
	ldrneb r0, [r5, #4]
	cmpne r0, r4
	movne r0, #0
	strneb r0, [r6]
	ldrb r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end WasMissionCompletedToday

	arm_func_start sub_0205F2B8
sub_0205F2B8: ; 0x0205F2B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_0205F2D0: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	ldmia sp!, {r4, pc} ; case 1
	ldmia sp!, {r4, pc} ; case 2
	ldmia sp!, {r4, pc} ; case 3
	b _0205F360 ; case 4
	ldmia sp!, {r4, pc} ; case 5
	b _0205F304 ; case 6
	ldmia sp!, {r4, pc} ; case 7
	ldmia sp!, {r4, pc} ; case 8
	b _0205F388 ; case 9
	ldmia sp!, {r4, pc} ; case 10
	ldmia sp!, {r4, pc} ; case 11
	ldmia sp!, {r4, pc} ; case 12
_0205F304:
	ldrb r0, [r4, #2]
	cmp r0, #4
	ldrb r0, [r4]
	bne _0205F33C
	add r0, r0, #0xfb
	and r0, r0, #0xff
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F33C:
	cmp r0, #5
	cmpne r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F360:
	ldrb r0, [r4]
	cmp r0, #5
	cmpne r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F388:
	ldrb r0, [r4]
	cmp r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205F2B8

	arm_func_start GetMissionByTypeAndDungeon
GetMissionByTypeAndDungeon: ; 0x0205F3AC
	stmdb sp!, {r4, lr}
	ldr ip, _0205F460 ; =MISSION_DELIVER_LIST_PTR
	ldr r4, [ip, #0x18]
	add r4, r4, #0x100
	b _0205F450
_0205F3C0:
	mov ip, r0, lsl #0x18
	add lr, r4, ip, asr #19
	cmp r3, #0xff
	ldrneb ip, [lr, #4]
	cmpne ip, r3
	bne _0205F44C
	ldrb ip, [lr, #1]
	cmp ip, r1
	bne _0205F44C
	cmp ip, #0xc
	addls pc, pc, ip, lsl #2
	b _0205F44C
_0205F3F0: ; jump table
	b _0205F440 ; case 0
	b _0205F440 ; case 1
	b _0205F440 ; case 2
	b _0205F440 ; case 3
	b _0205F440 ; case 4
	b _0205F440 ; case 5
	b _0205F424 ; case 6
	b _0205F440 ; case 7
	b _0205F440 ; case 8
	b _0205F424 ; case 9
	b _0205F424 ; case 10
	b _0205F424 ; case 11
	b _0205F424 ; case 12
_0205F424:
	ldrb lr, [lr, #2]
	ldrb ip, [r2]
	cmp lr, ip
	bne _0205F44C
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0205F440:
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0205F44C:
	add r0, r0, #1
_0205F450:
	cmp r0, #8
	blt _0205F3C0
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205F460: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetMissionByTypeAndDungeon

	arm_func_start sub_0205F464
sub_0205F464: ; 0x0205F464
	stmdb sp!, {r3, lr}
	mov ip, r1
	mov r3, r2
	mov r1, r0
	mov r2, ip
	mov r0, #0
	bl GetMissionByTypeAndDungeon
	cmp r0, #0
	ldrge r1, _0205F4A0 ; =MISSION_DELIVER_LIST_PTR
	movlt r0, #0
	ldrge r1, [r1, #0x18]
	movge r0, r0, lsl #0x18
	addge r1, r1, #0x100
	addge r0, r1, r0, asr #19
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F4A0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F464

	arm_func_start CheckAcceptedMissionByTypeAndDungeon
CheckAcceptedMissionByTypeAndDungeon: ; 0x0205F4A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r7, _0205F500 ; =MISSION_DELIVER_LIST_PTR
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0
_0205F4BC:
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl GetMissionByTypeAndDungeon
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, [r7, #0x18]
	mov r1, r0, lsl #0x18
	add r2, r2, #0x100
	mov r1, r1, asr #0x18
	ldrb r1, [r2, r1, lsl #5]
	add r0, r0, #1
	cmp r1, #5
	bne _0205F4BC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205F500: .word MISSION_DELIVER_LIST_PTR
	arm_func_end CheckAcceptedMissionByTypeAndDungeon

	arm_func_start sub_0205F504
sub_0205F504: ; 0x0205F504
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	mov r4, #0
	ldr r0, [r5, #0x18]
	add r6, r0, #0x100
_0205F518:
	ldrb r0, [r6]
	cmp r0, #6
	cmpne r0, #7
	cmpne r0, #8
	bne _0205F540
	ldr r1, [r5, #0x18]
	mov r0, r4, lsl #0x18
	add r1, r1, #0x100
	add r0, r1, r0, asr #19
	bl ClearMissionData
_0205F540:
	add r4, r4, #1
	cmp r4, #8
	add r6, r6, #0x20
	blt _0205F518
	ldr r1, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	mov r0, #8
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	bl sub_0205E48C
	ldr r0, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205F584 ; =sub_0205F5C8
	ldr r1, [r0, #0x18]
	mov r0, #8
	add r1, r1, #0x100
	bl sub_0205E50C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205F580: .word MISSION_DELIVER_LIST_PTR
_0205F584: .word sub_0205F5C8
	arm_func_end sub_0205F504

	arm_func_start sub_0205F588
sub_0205F588: ; 0x0205F588
	ldr r1, _0205F5A0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F5A4 ; =ClearMissionData
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_0205F5A0: .word MISSION_DELIVER_LIST_PTR
_0205F5A4: .word ClearMissionData
	arm_func_end sub_0205F588

	arm_func_start sub_0205F5A8
sub_0205F5A8: ; 0x0205F5A8
	ldr r1, _0205F5C0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F5C4 ; =sub_0205E48C
	ldr r1, [r1, #0x18]
	mov r0, #8
	add r1, r1, #0x100
	bx ip
	.align 2, 0
_0205F5C0: .word MISSION_DELIVER_LIST_PTR
_0205F5C4: .word sub_0205E48C
	arm_func_end sub_0205F5A8

	arm_func_start sub_0205F5C8
sub_0205F5C8: ; 0x0205F5C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r2, [r5, #1]
	mov r4, r1
	cmp r2, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	beq _0205F5F8
	cmp r2, #6
	ldreqb r0, [r5, #2]
	cmpeq r0, #4
	bne _0205F62C
_0205F5F8:
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F62C:
	ldrb r1, [r4, #1]
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	beq _0205F650
	cmp r1, #6
	ldreqb r0, [r4, #2]
	cmpeq r0, #4
	bne _0205F684
_0205F650:
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F684:
	cmp r2, #8
	cmpne r2, #5
	cmpne r2, #0xe
	bne _0205F6B0
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F6B0:
	cmp r1, #8
	cmpne r1, #5
	cmpne r1, #0xe
	bne _0205F6DC
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F6DC:
	ldrb r1, [r4, #4]
	ldrb r0, [r5, #4]
	mov r2, #1
	cmp r0, r1
	bhi _0205F708
	bne _0205F704
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	bhi _0205F708
_0205F704:
	mov r2, #0
_0205F708:
	and r0, r2, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205F5C8

	arm_func_start sub_0205F710
sub_0205F710: ; 0x0205F710
	ldr r0, _0205F72C ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F730 ; =sub_0205E50C
	ldr r1, [r0, #0x18]
	ldr r2, _0205F734 ; =sub_0205F5C8
	mov r0, #8
	add r1, r1, #0x100
	bx ip
	.align 2, 0
_0205F72C: .word MISSION_DELIVER_LIST_PTR
_0205F730: .word sub_0205E50C
_0205F734: .word sub_0205F5C8
	arm_func_end sub_0205F710

	arm_func_start GetAllPossibleMonsters
GetAllPossibleMonsters: ; 0x0205F738
	cmp r0, #0
	ldrne r1, _0205F754 ; =MISSION_DELIVER_LIST_PTR
	ldrne r1, [r1, #0x10]
	strne r1, [r0]
	ldr r0, _0205F754 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0205F754: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetAllPossibleMonsters

	arm_func_start GenerateAllPossibleMonstersList
GenerateAllPossibleMonstersList: ; 0x0205F758
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0x430
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r4, #0
	mov r6, #1
_0205F774:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	movne r0, r4, lsl #1
	strneh r6, [r5, r0]
	add r6, r6, #1
	addne r4, r4, #1
	cmp r6, #0x218
	blt _0205F774
	cmp r4, #0
	ldrne r0, _0205F7C0 ; =MISSION_DELIVER_LIST_PTR
	strne r5, [r0, #0x10]
	strne r4, [r0, #0x14]
	bne _0205F7B8
	mov r0, r5
	bl MemFree
_0205F7B8:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205F7C0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleMonstersList

	arm_func_start DeleteAllPossibleMonstersList
DeleteAllPossibleMonstersList: ; 0x0205F7C4
	stmdb sp!, {r3, lr}
	ldr r0, _0205F7F0 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F7F0 ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F7F0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleMonstersList

	arm_func_start GenerateAllPossibleDungeonsList
GenerateAllPossibleDungeonsList: ; 0x0205F7F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xb4
	mov r0, #0xb4
	mov r1, #0xf
	bl MemAlloc
	mov r5, #0
	mov r4, r0
	mov r1, r5
	mov r8, r5
	add r0, sp, #0
_0205F81C:
	strb r8, [r0, r1]
	add r1, r1, #1
	cmp r1, #0xb4
	blt _0205F81C
	mov r7, #1
	add r6, sp, #0
_0205F834:
	and r0, r8, #0xff
	bl CanDungeonBeUsedForMission
	cmp r0, #0
	strneb r7, [r6, r8]
	add r8, r8, #1
	cmp r8, #0xb4
	blt _0205F834
	mov r2, #0
	add r1, sp, #0
_0205F858:
	ldrb r0, [r1, r2]
	cmp r0, #0
	strneb r2, [r4, r5]
	add r2, r2, #1
	addne r5, r5, #1
	cmp r2, #0xb4
	blt _0205F858
	cmp r5, #0
	ldrne r0, _0205F89C ; =MISSION_DELIVER_LIST_PTR
	strne r4, [r0, #8]
	strne r5, [r0, #0xc]
	bne _0205F890
	mov r0, r4
	bl MemFree
_0205F890:
	mov r0, r5
	add sp, sp, #0xb4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205F89C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleDungeonsList

	arm_func_start DeleteAllPossibleDungeonsList
DeleteAllPossibleDungeonsList: ; 0x0205F8A0
	stmdb sp!, {r3, lr}
	ldr r0, _0205F8CC ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F8CC ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F8CC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleDungeonsList

	arm_func_start GenerateAllPossibleDeliverList
GenerateAllPossibleDeliverList: ; 0x0205F8D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x2d8
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	bl GetAvailableItemDeliveryList
	movs r5, r0
	ldrne r0, _0205F908 ; =MISSION_DELIVER_LIST_PTR
	stmneia r0, {r4, r5}
	bne _0205F900
	mov r0, r4
	bl MemFree
_0205F900:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205F908: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleDeliverList

	arm_func_start DeleteAllPossibleDeliverList
DeleteAllPossibleDeliverList: ; 0x0205F90C
	stmdb sp!, {r3, lr}
	ldr r0, _0205F938 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F938 ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F938: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleDeliverList

	arm_func_start sub_0205F93C
sub_0205F93C: ; 0x0205F93C
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #1]
	mov r3, #0
	add r3, r3, r2, lsl #11
	add r3, r3, r1
	ldrb r2, [r0, #4]
	ldrb r1, [r0, #5]
	add r2, r3, r2
	add ip, r2, r1
	ldr r3, [r0, #8]
	ldrb r2, [r0, #0xc]
	add ip, ip, r3, lsl #8
	ldrsh r3, [r0, #0xe]
	add ip, ip, r2, lsl #13
	ldrb r1, [r0, #0x16]
	add ip, ip, r3, lsl #12
	ldrsh r2, [r0, #0x10]
	ldrsh r3, [r0, #0x12]
	cmp r1, #5
	add ip, ip, r2, lsl #16
	ldrsh r2, [r0, #0x14]
	add r3, ip, r3, lsl #4
	add r2, r3, r2, lsl #24
	add r2, r2, r1, lsl #2
	ldrneh r1, [r0, #0x18]
	addne r2, r2, r1, lsl #1
	ldrb r1, [r0, #0x1a]
	ldrh r0, [r0, #0x1c]
	add r1, r2, r1, lsl #21
	add r0, r1, r0, lsl #22
	bx lr
	arm_func_end sub_0205F93C

	arm_func_start ClearMissionData
ClearMissionData: ; 0x0205F9B8
	mov r2, #0
	strb r2, [r0]
	mov r1, #0xff
	strb r1, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #0x16]
	bx lr
	arm_func_end ClearMissionData

	arm_func_start sub_0205F9D4
sub_0205F9D4: ; 0x0205F9D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0205FA34 ; =MISSION_DELIVER_LIST_PTR
	mov r5, r0
	ldr r4, [r1, #0x18]
	mov lr, #0xf
	mov r3, #0xc
_0205F9EC:
	mla r1, lr, r3, r4
	add r0, r1, #0x334
	sub lr, lr, #1
	add ip, r1, #0x340
	ldmia r0, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	cmp lr, #0
	bgt _0205F9EC
	ldr r2, [r5, #4]
	ldr r1, [r5, #8]
	mov r0, r5
	str r2, [r4, #0x340]
	str r1, [r4, #0x344]
	bl sub_0205F93C
	ldr r1, _0205FA34 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	str r0, [r1, #0x348]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205FA34: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F9D4

	arm_func_start sub_0205FA38
sub_0205FA38: ; 0x0205FA38
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_0205F93C
	ldr r2, _0205FAAC ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	ldr r2, [r2, #0x18]
	add r5, r2, #0x340
	mov r2, #0xc
	b _0205FA9C
_0205FA5C:
	mul lr, r1, r2
	ldrb ip, [r5, lr]
	ldrb r3, [r4, #4]
	add lr, r5, lr
	cmp ip, r3
	ldreqb ip, [lr, #1]
	ldreqb r3, [r4, #5]
	cmpeq ip, r3
	ldreq ip, [lr, #4]
	ldreq r3, [r4, #8]
	cmpeq ip, r3
	ldreq r3, [lr, #8]
	cmpeq r3, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r1, r1, #1
_0205FA9C:
	cmp r1, #0x10
	blt _0205FA5C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205FAAC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FA38

	arm_func_start sub_0205FAB0
sub_0205FAB0: ; 0x0205FAB0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForWrite
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FADC:
	ldr r1, [r4, #0x18]
	mov r0, r6
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FADC
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FB0C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x100
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FB0C
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FB40:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x200
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FB40
	ldr r1, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x300
	bl sub_0205FD88
	ldr r1, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x320
	bl sub_0205FD88
	ldr sl, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	mov r8, #0
	add r6, sp, #0
	mov r5, #0x20
	mov r4, #0x18
	mov sb, #0xc
_0205FBAC:
	mul r7, r8, sb
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x348
	mov r2, r5
	add r1, r1, r7
	bl CopyBitsFrom
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x344
	mov r2, r4
	add r1, r1, r7
	bl CopyBitsFrom
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x340
	add r1, r1, r7
	bl Copy16BitsFrom
	add r8, r8, #1
	cmp r8, #0x10
	blt _0205FBAC
	add r0, sp, #0
	bl BitstreamDebug
	bl Rand16Bit
	bl WriteMissionMtState
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205FC1C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FAB0

	arm_func_start sub_0205FC20
sub_0205FC20: ; 0x0205FC20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForRead
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FC4C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FC4C
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FC7C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x100
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FC7C
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FCB0:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x200
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FCB0
	ldr r1, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x300
	bl sub_0205FE80
	ldr r1, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x320
	bl sub_0205FE80
	ldr sl, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	mov r8, #0
	add r6, sp, #0
	mov r5, #0x20
	mov r4, #0x18
	mov sb, #0xc
_0205FD1C:
	mul r7, r8, sb
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x348
	mov r2, r5
	add r1, r1, r7
	bl CopyBitsTo
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x344
	mov r2, r4
	add r1, r1, r7
	bl CopyBitsTo
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x340
	add r1, r1, r7
	bl Copy16BitsTo
	add r8, r8, #1
	cmp r8, #0x10
	blt _0205FD1C
	add r0, sp, #0
	bl BitstreamDebug
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205FD84: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FC20

	arm_func_start sub_0205FD88
sub_0205FD88: ; 0x0205FD88
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x12
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x16
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x18
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, r4, #0x1c
	mov r2, #0xb
	cmp r0, #0
	movne r3, #1
	moveq r3, #0
	mov r0, r5
	strb r3, [r4, #0x1a]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	bl Copy16BitsFrom
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205FD88

	arm_func_start sub_0205FE80
sub_0205FE80: ; 0x0205FE80
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #0xff
	mov r3, #0
	mov r5, r0
	mov r4, r1
	mov r2, #4
	strb ip, [sp, #1]
	strb r3, [sp]
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x12
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x16
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x18
	mov r2, #0xb
	bl CopyBitsTo
	ldrb r0, [r4, #0x1a]
	mov r2, #1
	cmp r0, #1
	addeq r1, sp, #1
	addne r1, sp, #0
	mov r0, r5
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	bl Copy16BitsTo
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205FE80

	arm_func_start GetMissionSpecificFixedRoom
GetMissionSpecificFixedRoom: ; 0x0205FF80
	stmdb sp!, {r3, lr}
	cmp r0, #3
	mov r2, #0
	bne _0205FFA8
	cmp r1, #1
	moveq r2, #0xa5
	beq _02060070
	cmp r1, #2
	moveq r2, #0x6f
	b _02060070
_0205FFA8:
	cmp r0, #0xa
	bne _0205FFCC
	cmp r1, #6
	bne _02060070
	ldr r0, _02060078 ; =OUTLAW_HIDEOUT_FIXED_ROOM_IDS
	sub r1, r2, #1
	bl SelectRandomFixedRoomInRange
	mov r2, r0
	b _02060070
_0205FFCC:
	cmp r0, #0xb
	bne _02060034
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02060070
_0205FFE0: ; jump table
	b _0205FFF8 ; case 0
	b _0206000C ; case 1
	b _02060014 ; case 2
	b _0206001C ; case 3
	b _02060024 ; case 4
	b _0206002C ; case 5
_0205FFF8:
	ldr r0, _0206007C ; =CHALLENGE_NORMAL_FIXED_ROOM_IDS
	sub r1, r2, #1
	bl SelectRandomFixedRoomInRange
	mov r2, r0
	b _02060070
_0206000C:
	mov r2, #0x91
	b _02060070
_02060014:
	mov r2, #0x92
	b _02060070
_0206001C:
	mov r2, #0x93
	b _02060070
_02060024:
	mov r2, #0x94
	b _02060070
_0206002C:
	mov r2, #0x95
	b _02060070
_02060034:
	cmp r0, #0xc
	bne _02060070
	mov r0, #9
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02060060
	ldr r0, _02060080 ; =TREASURE_MEMO_FIXED_ROOM_IDS
	mov r1, #0xf
	bl SelectRandomFixedRoomInRange
	mov r2, r0
	b _02060070
_02060060:
	ldr r0, _02060080 ; =TREASURE_MEMO_FIXED_ROOM_IDS
	mvn r1, #0
	bl SelectRandomFixedRoomInRange
	mov r2, r0
_02060070:
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02060078: .word OUTLAW_HIDEOUT_FIXED_ROOM_IDS
_0206007C: .word CHALLENGE_NORMAL_FIXED_ROOM_IDS
_02060080: .word TREASURE_MEMO_FIXED_ROOM_IDS
	arm_func_end GetMissionSpecificFixedRoom

	arm_func_start SelectRandomFixedRoomInRange
SelectRandomFixedRoomInRange: ; 0x02060084
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r2, r5
	mov r4, #0
	b _0206009C
_02060098:
	add r4, r4, #1
_0206009C:
	ldrb r0, [r2], #1
	cmp r0, #0
	bne _02060098
	cmp r1, #0
	blt _020600B8
	cmp r4, r1
	movgt r4, r1
_020600B8:
	bl Rand16Bit
	mov r1, r4
	bl _s32_div_f
	ldrb r0, [r5, r1]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SelectRandomFixedRoomInRange

	arm_func_start ReadRescueBinFile
ReadRescueBinFile: ; 0x020600CC
	stmdb sp!, {r3, lr}
	ldr r0, _02060144 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0, #0x24]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02060148 ; =_020B0AFC
	ldr r1, _0206014C ; =_020A462C
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, _02060144 ; =RESCUE_BIN_UNPACK
	ldr r2, [r0, #0x24]
	ldr r1, [r2]
	add r1, r2, r1
	str r1, [r0, #4]
	ldr r1, [r2, #4]
	add r1, r2, r1
	str r1, [r0, #0x14]
	ldr r1, [r2, #8]
	add r1, r2, r1
	str r1, [r0, #0x10]
	ldr r1, [r2, #0xc]
	add r1, r2, r1
	str r1, [r0, #8]
	ldr r1, [r2, #0x10]
	add r1, r2, r1
	str r1, [r0, #0x18]
	ldr r1, [r2, #0x14]
	add r1, r2, r1
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02060144: .word RESCUE_BIN_UNPACK
_02060148: .word _020B0AFC
_0206014C: .word _020A462C
	arm_func_end ReadRescueBinFile

	arm_func_start GenerateMissionDetailsStruct
GenerateMissionDetailsStruct: ; 0x02060150
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	strne r5, [r4, #0x5c]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	add r1, r4, #0x18
	bl InitMissionReward
	mov r0, r5
	mov r1, r4
	bl sub_02060274
	mov r1, r5
	bl MatchMissionTemplateToMission
	str r0, [r4, #0x60]
	add r0, r5, #4
	str r0, [r4, #8]
	mov r1, #0
	str r1, [r4, #0xc]
	ldrsh r0, [r5, #0xe]
	strh r0, [r4, #0x10]
	ldrsh r0, [r5, #0x10]
	strh r0, [r4, #0x12]
	ldrsh r0, [r5, #0x12]
	strh r0, [r4, #0x14]
	ldrsh r0, [r5, #0x14]
	strh r0, [r4, #0x16]
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	streqb r1, [r4, #0x49]
	ldreqh r0, [r5, #0x1c]
	streqb r0, [r4, #0x4c]
	beq _020601EC
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r4, #0x49]
	ldreqsh r0, [r5, #0x1c]
	streqh r0, [r4, #0x4a]
_020601EC:
	ldrb r0, [r5]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02060258
_020601FC: ; jump table
	b _02060258 ; case 0
	b _02060220 ; case 1
	b _02060220 ; case 2
	b _02060220 ; case 3
	b _02060220 ; case 4
	b _02060244 ; case 5
	b _02060230 ; case 6
	b _02060244 ; case 7
	b _02060244 ; case 8
_02060220:
	mov r0, #1
	strb r0, [r4, #0x47]
	strb r0, [r4, #0x48]
	b _02060264
_02060230:
	mov r0, #0
	strb r0, [r4, #0x47]
	mov r0, #3
	strb r0, [r4, #0x48]
	b _02060264
_02060244:
	mov r0, #3
	strb r0, [r4, #0x47]
	mov r0, #2
	strb r0, [r4, #0x48]
	b _02060264
_02060258:
	mov r0, #0
	strb r0, [r4, #0x47]
	strb r0, [r4, #0x48]
_02060264:
	str r5, [r4, #0x5c]
	mov r0, #0
	str r0, [r4, #0x64]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GenerateMissionDetailsStruct

	arm_func_start sub_02060274
sub_02060274: ; 0x02060274
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0xe
	addls pc, pc, r3, lsl #2
	b _02060634
_02060288: ; jump table
	b _020602C4 ; case 0
	b _020602DC ; case 1
	b _02060344 ; case 2
	b _02060388 ; case 3
	b _020603DC ; case 4
	b _02060404 ; case 5
	b _02060420 ; case 6
	b _02060480 ; case 7
	b _0206050C ; case 8
	b _02060494 ; case 9
	b _02060528 ; case 10
	b _0206058C ; case 11
	b _020605EC ; case 12
	b _02060634 ; case 13
	b _02060608 ; case 14
_020602C4:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #3
	strb r0, [r1, #0x46]
	b _02060634
_020602DC:
	ldrb r0, [r0, #2]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02060338
_020602EC: ; jump table
	b _020602FC ; case 0
	b _02060310 ; case 1
	b _02060324 ; case 2
	b _02060324 ; case 3
_020602FC:
	mov r0, #4
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #1
	b _02060338
_02060310:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #5
	b _02060338
_02060324:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #4
	strb r0, [r1, #0x45]
	mov r2, #5
_02060338:
	mov r0, #4
	strb r0, [r1, #0x46]
	b _02060634
_02060344:
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0206036C
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0x44]
	moveq r0, #4
	streqb r0, [r1, #0x45]
	moveq r2, #5
	b _0206037C
_0206036C:
	mov r0, #4
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #1
_0206037C:
	mov r0, #5
	strb r0, [r1, #0x46]
	b _02060634
_02060388:
	ldrb r0, [r0, #2]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020603CC
_02060398: ; jump table
	b _020603A8 ; case 0
	b _020603BC ; case 1
	b _020603BC ; case 2
	b _020603BC ; case 3
_020603A8:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #8
	strb r0, [r1, #0x45]
	b _020603CC
_020603BC:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
_020603CC:
	mov r0, #6
	strb r0, [r1, #0x46]
	mov r2, #1
	b _02060634
_020603DC:
	ldrb r0, [r0, #2]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x44]
	moveq r0, #5
	streqb r0, [r1, #0x45]
	mov r0, #7
	moveq r2, #3
	strb r0, [r1, #0x46]
	b _02060634
_02060404:
	mov r0, #5
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r0, #8
	strb r0, [r1, #0x46]
	b _02060634
_02060420:
	ldrb r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02060474
_02060430: ; jump table
	b _02060444 ; case 0
	b _02060454 ; case 1
	b _02060444 ; case 2
	b _02060444 ; case 3
	b _02060468 ; case 4
_02060444:
	mov r0, #2
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	b _02060474
_02060454:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #2
	strb r0, [r1, #0x45]
	b _02060474
_02060468:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
_02060474:
	mov r2, #1
	strb r2, [r1, #0x46]
	b _02060634
_02060480:
	mov r0, #2
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	strb r0, [r1, #0x46]
	b _02060634
_02060494:
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _020604B4
	cmp r0, #1
	beq _020604D0
	cmp r0, #2
	beq _020604EC
	b _02060504
_020604B4:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #5
	strb r0, [r1, #0x45]
	mov r0, #0xa
	strb r0, [r1, #0x46]
	b _02060504
_020604D0:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #6
	strb r0, [r1, #0x45]
	mov r0, #0xb
	strb r0, [r1, #0x46]
	b _02060504
_020604EC:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #5
	strb r0, [r1, #0x45]
	mov r0, #0xb
	strb r0, [r1, #0x46]
_02060504:
	mov r2, #1
	b _02060634
_0206050C:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #4
	strb r0, [r1, #0x45]
	mov r0, #0xc
	strb r0, [r1, #0x46]
	b _02060634
_02060528:
	ldrb r0, [r0, #2]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02060580
_02060538: ; jump table
	b _02060558 ; case 0
	b _02060558 ; case 1
	b _02060558 ; case 2
	b _02060558 ; case 3
	b _02060558 ; case 4
	b _02060558 ; case 5
	b _0206056C ; case 6
	b _02060558 ; case 7
_02060558:
	mov r2, #4
	strb r2, [r1, #0x44]
	mov r0, #1
	strb r0, [r1, #0x45]
	b _02060580
_0206056C:
	mov r0, #4
	strb r0, [r1, #0x44]
	mov r0, #1
	strb r0, [r1, #0x45]
	mov r2, #6
_02060580:
	mov r0, #0xd
	strb r0, [r1, #0x46]
	b _02060634
_0206058C:
	ldrb r0, [r0, #2]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _020605E0
_0206059C: ; jump table
	b _020605B4 ; case 0
	b _020605CC ; case 1
	b _020605CC ; case 2
	b _020605CC ; case 3
	b _020605CC ; case 4
	b _020605CC ; case 5
_020605B4:
	mov r0, #3
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r2, #6
	b _020605E0
_020605CC:
	mov r0, #3
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r2, #4
_020605E0:
	mov r0, #0xe
	strb r0, [r1, #0x46]
	b _02060634
_020605EC:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #0xf
	strb r0, [r1, #0x46]
	mov r2, #7
	b _02060634
_02060608:
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _02060630
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #9
	strb r0, [r1, #0x46]
	mov r0, #7
	strb r0, [r1, #0x1a]
_02060630:
	mov r2, #7
_02060634:
	mov r0, r2
	bx lr
	arm_func_end sub_02060274

	arm_func_start sub_0206063C
sub_0206063C: ; 0x0206063C
	ldrb r2, [r0, #0x20]
	ldrb r0, [r1, #1]
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0206063C

	arm_func_start sub_02060658
sub_02060658: ; 0x02060658
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	cmp r3, r2
	ldreqb r2, [r0, #0x21]
	ldreqb r0, [r1, #2]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02060658

	arm_func_start sub_02060680
sub_02060680: ; 0x02060680
	stmdb sp!, {r3, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov ip, #0
	mov lr, ip
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _020606C4
	ldrh r2, [r0, #2]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, ip
	tst r2, #0xff
	movne lr, #1
_020606C4:
	cmp lr, #0
	beq _020606DC
	ldrsh r2, [r0, #6]
	ldrsh r0, [r1, #0x14]
	cmp r2, r0
	moveq ip, #1
_020606DC:
	and r0, ip, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02060680

	arm_func_start sub_020606E4
sub_020606E4: ; 0x020606E4
	stmdb sp!, {r4, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov r4, #0
	mov ip, r4
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _02060728
	ldrh r2, [r0, #0xe]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, r4
	tst r2, #0xff
	movne ip, #1
_02060728:
	cmp ip, #0
	beq _02060744
	ldrsh r0, [r0, #0x12]
	ldrsh r1, [r1, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_02060744:
	and r0, r4, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end sub_020606E4

	arm_func_start sub_0206074C
sub_0206074C: ; 0x0206074C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldrb r1, [r7, #0x20]
	ldrb r0, [r6, #1]
	mov r4, #0
	mov r5, r4
	cmp r1, r0
	ldreqb r1, [r7, #0x21]
	ldreqb r0, [r6, #2]
	mov r2, r4
	mov r3, r4
	cmpeq r1, r0
	bne _020607A0
	ldrh r0, [r7, #0xe]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, r4
	tst r0, #0xff
	movne r3, #1
_020607A0:
	cmp r3, #0
	beq _020607C4
	ldrh r0, [r7, #0x14]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r2, #1
_020607C4:
	cmp r2, #0
	beq _020607E0
	ldrsh r0, [r7, #0x12]
	ldrsh r1, [r6, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r5, #1
_020607E0:
	cmp r5, #0
	beq _020607FC
	ldrsh r0, [r7, #0x18]
	ldrsh r1, [r6, #0x10]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_020607FC:
	and r0, r4, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206074C

	arm_func_start ValidateNormalChallengeMission
ValidateNormalChallengeMission: ; 0x02060804
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldrb r1, [r8, #0x20]
	ldrb r0, [r7, #1]
	mov r4, #0
	mov r5, r4
	cmp r1, r0
	ldreqb r1, [r8, #0x21]
	ldreqb r0, [r7, #2]
	mov r6, r4
	mov r2, r4
	mov r3, r4
	mov ip, r4
	cmpeq r1, r0
	bne _02060860
	ldrh r0, [r8, #0xe]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, r4
	tst r0, #0xff
	movne ip, #1
_02060860:
	cmp ip, #0
	beq _02060884
	ldrh r0, [r8, #0x14]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r3, #1
_02060884:
	cmp r3, #0
	beq _020608A8
	ldrh r0, [r8, #0x1a]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r2, #1
_020608A8:
	cmp r2, #0
	beq _020608C4
	ldrsh r0, [r8, #0x12]
	ldrsh r1, [r7, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r6, #1
_020608C4:
	cmp r6, #0
	beq _020608E0
	ldrsh r0, [r8, #0x18]
	ldrsh r1, [r7, #0x10]
	bl DexNumbersEqual
	cmp r0, #0
	movne r5, #1
_020608E0:
	cmp r5, #0
	beq _020608FC
	ldrsh r0, [r8, #0x1e]
	ldrsh r1, [r7, #0x12]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_020608FC:
	and r0, r4, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ValidateNormalChallengeMission

	arm_func_start ValidateLegendaryChallengeMission
ValidateLegendaryChallengeMission: ; 0x02060904
	stmdb sp!, {r3, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov ip, #0
	mov lr, ip
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _02060948
	ldrh r2, [r0, #8]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, ip
	tst r2, #0xff
	movne lr, #1
_02060948:
	cmp lr, #0
	beq _02060964
	ldrh r2, [r0, #0xc]
	ldrb r0, [r1, #4]
	and r1, r2, #0xff
	cmp r1, r0
	moveq ip, #1
_02060964:
	and r0, ip, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ValidateLegendaryChallengeMission

	arm_func_start MatchMissionTemplateToMission
MatchMissionTemplateToMission: ; 0x0206096C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _020609E0 ; =MISSION_VALIDATION_FUNCTION_LIST
	mov r8, r0
	mov r7, r1
	ldr r5, [r2, r8, lsl #2]
	mov r4, #0
	mov sb, #0x22
	ldr sl, _020609E4 ; =RESCUE_BIN_UNPACK
	b _020609BC
_02060990:
	mul r6, r4, sb
	ldr r0, [sl, #0x18]
	mov r1, r7
	add r0, r0, r6
	blx r5
	cmp r0, #0
	ldrne r0, _020609E4 ; =RESCUE_BIN_UNPACK
	ldrne r0, [r0, #0x18]
	addne r0, r0, r6
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add r4, r4, #1
_020609BC:
	cmp r4, #0x258
	blt _02060990
	cmp r8, #3
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, r7
	mov r0, #1
	bl MatchMissionTemplateToMission
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020609E0: .word MISSION_VALIDATION_FUNCTION_LIST
_020609E4: .word RESCUE_BIN_UNPACK
	arm_func_end MatchMissionTemplateToMission

	arm_func_start SprintfStatic__020609E8
SprintfStatic__020609E8: ; 0x020609E8
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
	arm_func_end SprintfStatic__020609E8

	arm_func_start AppendMissionTitle
AppendMissionTitle: ; 0x02060A10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r6, r0
	add r0, sp, #4
	mov r7, r3
	mov r5, r1
	mov r4, r2
	bl sub_020022C4
	ldr r3, [r7, #8]
	ldr r1, _02060AEC ; =_020A4644
	ldrb r0, [r3]
	ldr r2, [r3, #4]
	ldrb r3, [r3, #1]
	add r2, r2, r0
	mov r0, r6
	add r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [r7, #0x60]
	ldrh sl, [r2]
	bl strcat
	ldr fp, _02060AF0 ; =0x00000FFF
	ldr sb, _02060AF4 ; =MISSION_STRING_IDS
	add r7, fp, #0xf000
	ldr r8, _02060AF8 ; =RESCUE_BIN_UNPACK
	b _02060AD4
_02060A74:
	and r0, sl, fp
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldr r2, [r8, #4]
	mov r1, r0, lsl #2
	ldrh r1, [r2, r1]
	add sl, r2, r0, lsl #2
	add r0, sp, #4
	bl sub_020022D0
	ldrh r2, [sl, #2]
	mov r1, #0x100
	mov r3, #0
	add sl, r2, r0
	mov r2, sl, lsl #1
	ldrh r2, [sb, r2]
	mov r0, r5
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, r6
	mov r1, r5
	bl strcat
	ldr r1, [r8, #0x14]
	mov r0, sl, lsl #1
	ldrh sl, [r1, r0]
_02060AD4:
	cmp sl, r7
	beq _02060AE4
	tst sl, #0x1000
	beq _02060A74
_02060AE4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02060AEC: .word _020A4644
_02060AF0: .word 0x00000FFF
_02060AF4: .word MISSION_STRING_IDS
_02060AF8: .word RESCUE_BIN_UNPACK
	arm_func_end AppendMissionTitle

	arm_func_start FormatMissionHeader
FormatMissionHeader: ; 0x02060AFC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x80
	mov r6, r0
	mov r5, r1
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	ldr r1, _02060DF4 ; =_020A4654
	mov r0, r6
	bl strcpy
	ldr r1, _02060DF8 ; =_020A4664
	mov r0, r6
	ldrb r7, [r5, #0x47]
	bl strcat
	ldr r1, _02060DFC ; =REMOTE_STRING_PTR_TABLE
	mov r0, r4
	ldr r1, [r1, r7, lsl #2]
	bl SprintfStatic__020609E8
	mov r0, r6
	mov r1, r4
	bl strcat
	add r0, sp, #0x30
	bl InitPreprocessorArgs
	ldrb r0, [r5, #0x44]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02060D18
_02060B6C: ; jump table
	b _02060B88 ; case 0
	b _02060C48 ; case 1
	b _02060C60 ; case 2
	b _02060C80 ; case 3
	b _02060CA0 ; case 4
	b _02060CC0 ; case 5
	b _02060CE4 ; case 6
_02060B88:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #4
	bne _02060BAC
	ldr r1, _02060E00 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02060BC4
_02060BAC:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [r5, #0xc]
	add r0, sp, #4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02060BC4:
	add r0, sp, #4
	str r0, [sp, #0x68]
	ldr r0, [r5, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02060C10
_02060BE0: ; jump table
	b _02060C10 ; case 0
	b _02060C10 ; case 1
	b _02060C10 ; case 2
	b _02060C10 ; case 3
	b _02060C10 ; case 4
	b _02060C00 ; case 5
	b _02060C08 ; case 6
	b _02060C00 ; case 7
_02060C00:
	ldr r2, _02060E04 ; =0x000038CB
	b _02060C14
_02060C08:
	ldr r2, _02060E08 ; =0x000038CC
	b _02060C14
_02060C10:
	ldr r2, _02060E0C ; =0x000038CA
_02060C14:
	add ip, sp, #0x30
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str ip, [sp]
	bl PreprocessStringFromId
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	b _02060D18
_02060C48:
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	bl AppendMissionTitle
	b _02060D18
_02060C60:
	ldrsh ip, [r5, #0x16]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x40]
	bl AppendMissionTitle
	b _02060D18
_02060C80:
	ldrsh ip, [r5, #0x10]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x30]
	bl AppendMissionTitle
	b _02060D18
_02060CA0:
	ldrsh ip, [r5, #0x12]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x30]
	bl AppendMissionTitle
	b _02060D18
_02060CC0:
	ldr r0, [r5, #8]
	add r2, sp, #0x30
	ldrb ip, [r0]
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x40]
	bl AppendMissionTitle
	b _02060D18
_02060CE4:
	ldr r1, [r5, #0x54]
	mov r0, r4
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
_02060D18:
	ldr r1, _02060E14 ; =_020A4674
	mov r0, r6
	bl strcat
	mov r0, r5
	mov r1, r4
	mov r2, #0x100
	bl AppendMissionDungeonLocation
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	ldr r1, [r5, #0x5c]
	cmp r1, #0
	beq _02060D9C
	ldrb r0, [r1, #1]
	cmp r0, #0xe
	bne _02060D9C
	ldr r2, _02060E18 ; =0x00003C2A
	add r5, sp, #0x30
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	ldr r1, _02060E1C ; =_020A4678
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	b _02060DE4
_02060D9C:
	ldrb r0, [r5, #0x46]
	cmp r0, #0
	bne _02060DB8
	ldr r0, [r5, #8]
	mov r1, #0
	bl GetMissionRankWithCapAndModifiersAndCap
	b _02060DC4
_02060DB8:
	ldrb r1, [r1, #1]
	ldr r0, [r5, #8]
	bl GetMissionRankWithCapAndModifiersAndCap
_02060DC4:
	ldr r2, _02060E20 ; =RANK_STRING_PTR_TABLE
	ldr r1, _02060E1C ; =_020A4678
	ldr r5, [r2, r0, lsl #2]
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r5
	bl strcat
_02060DE4:
	mov r0, r4
	bl MemFree
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02060AFC_OFFSET 2
#elif defined(JAPAN)
#define SUB_02060AFC_OFFSET -0x3C2
#else
#define SUB_02060AFC_OFFSET 0
#endif
_02060DF4: .word _020A4654
_02060DF8: .word _020A4664
_02060DFC: .word REMOTE_STRING_PTR_TABLE
_02060E00: .word 0x000038C9 + SUB_02060AFC_OFFSET
_02060E04: .word 0x000038CB + SUB_02060AFC_OFFSET
_02060E08: .word 0x000038CC + SUB_02060AFC_OFFSET
_02060E0C: .word 0x000038CA + SUB_02060AFC_OFFSET
_02060E10: .word _020A4644
_02060E14: .word _020A4674
_02060E18: .word 0x00003C2A + SUB_02060AFC_OFFSET
_02060E1C: .word _020A4678
_02060E20: .word RANK_STRING_PTR_TABLE
	arm_func_end FormatMissionHeader

	arm_func_start FormatSpecialEpisodeMissionHeader
FormatSpecialEpisodeMissionHeader: ; 0x02060E24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	ldr r1, _02060EA0 ; =_020A4654
	mov r0, r5
	bl strcpy
	ldr r1, _02060EA4 ; =_020A4664
	mov r0, r5
	bl strcat
	ldr r1, _02060EA8 ; =REMOTE_STRING_PTR_TABLE
	mov r0, r4
	ldr r1, [r1, #8]
	bl SprintfStatic__020609E8
	mov r0, r5
	mov r1, r4
	bl strcat
	ldr r1, _02060EAC ; =_020A4644
	mov r0, r5
	bl strcat
	mov r0, r4
	ldr r1, _02060EB0 ; =0x00003C4D
	bl GetStringFromFileVeneer
	mov r0, r5
	mov r1, r4
	bl strcat
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02060EA0: .word _020A4654
_02060EA4: .word _020A4664
_02060EA8: .word REMOTE_STRING_PTR_TABLE
_02060EAC: .word _020A4644
#if defined(EUROPE)
_02060EB0: .word 0x00003C4F
#elif defined(JAPAN)
_02060EB0: .word 0x0000388B
#else
_02060EB0: .word 0x00003C4D
#endif
	arm_func_end FormatSpecialEpisodeMissionHeader

	arm_func_start AppendMissionSummary
AppendMissionSummary: ; 0x02060EB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r8, [sp, #0x34]
	mov r7, r0
	add r0, sp, #4
	mov r6, r1
	mov r5, r2
	mov fp, r3
	ldr r4, [sp, #0x30]
	bl sub_020022C4
	ldr r3, [r8, #8]
	mov r0, #0
	ldrb r1, [r3]
	ldr r2, [r3, #4]
	ldrb r3, [r3, #1]
	add r1, r2, r1
	ldr sb, _02060FCC ; =RESCUE_BIN_UNPACK
	add r1, r3, r1
	str r1, [sp, #4]
	ldr r1, [r8, #0x60]
	ldrh r1, [r1]
	strb r0, [r7]
	ldr r0, _02060FD0 ; =0x00000FFF
	add r8, r0, #0xf000
	b _02060FA8
_02060F18:
	ldr r0, _02060FD0 ; =0x00000FFF
	ldr r2, [sb, #4]
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	tst r1, #0x1000
	mov r1, r0, lsl #2
	add sl, r2, r0, lsl #2
	ldrh r1, [r2, r1]
	add r0, sp, #4
	bne _02060F60
	bl sub_020022D0
	ldrh r2, [sl, #2]
	ldr r1, [sb, #0x14]
	add r0, r2, r0
	mov r0, r0, lsl #1
	ldrh r1, [r1, r0]
	b _02060FA8
_02060F60:
	bl sub_020022D0
	ldrh r2, [sl, #2]
	mov r1, #0x12c
	mov r3, #0
	add sl, r2, r0
	ldr r2, _02060FD4 ; =MISSION_STRING_IDS
	mov ip, sl, lsl #1
	ldrh r2, [r2, ip]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, r7
	mov r1, r6
	mov r2, #0x400
	bl strncat
	ldr r1, [sb, #0x14]
	mov r0, sl, lsl #1
	ldrh r1, [r1, r0]
_02060FA8:
	cmp r1, r8
	bne _02060F18
	mov r0, fp
	mov r2, r5
	mov r3, r7
	mov r1, #4
	bl DrawTextInWindow
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02060FCC: .word RESCUE_BIN_UNPACK
_02060FD0: .word 0x00000FFF
_02060FD4: .word MISSION_STRING_IDS
	arm_func_end AppendMissionSummary

	arm_func_start MakeMissionDetails
MakeMissionDetails: ; 0x02060FD8
#ifdef JAPAN
#define SUB_02060FD8_ARG #0x3e
#else
#define SUB_02060FD8_ARG #0x42
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14c
	mov sb, r0
	mov r8, r1
	mov r0, #0x12c
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	ldr r1, [sb, #0x64]
	mov r5, r0
	cmp r1, #0
	mov r7, #0
	beq _02061110
	ldr r1, [sb, #0x54]
	cmp r1, #0
	ldrneh r2, [r1]
	cmpne r2, #0
	bne _020610E8
	ldr r0, [sb, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #0x32
	bne _02061050
	ldr r1, _02061BD0 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02061068
_02061050:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [sb, #0xc]
	add r0, sp, #0x32
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02061068:
	add r0, sp, #0x32
	str r0, [sp, #0x134]
	ldr r0, [sb, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020610B4
_02061084: ; jump table
	b _020610B4 ; case 0
	b _020610B4 ; case 1
	b _020610B4 ; case 2
	b _020610B4 ; case 3
	b _020610B4 ; case 4
	b _020610A4 ; case 5
	b _020610AC ; case 6
	b _020610A4 ; case 7
_020610A4:
	ldr r2, _02061BD4 ; =0x000038CB
	b _020610B8
_020610AC:
	ldr r2, _02061BD8 ; =0x000038CC
	b _020610B8
_020610B4:
	ldr r2, _02061BDC ; =0x000038CA
_020610B8:
	add r6, sp, #0xfc
	mov r0, r5
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	mov r0, r8
	mov r3, r5
	mov r1, #4
	mov r2, #0
	bl DrawTextInWindow
	b _02061124
_020610E8:
#ifndef JAPAN
	mov r3, r7
#endif
	mov r2, #0x12
	bl sub_0202568C
	mov r2, r7
	strb r2, [r0]
	mov r0, r8
	mov r3, r5
	mov r1, #4
	bl DrawTextInWindow
	b _02061124
_02061110:
	ldr r3, _02061BE0 ; =0x00003C1E
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl AppendStandardStringToMission
_02061124:
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x45]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _020613D4
_0206113C: ; jump table
	b _02061164 ; case 0
	b _020611C0 ; case 1
	b _020611E4 ; case 2
	b _02061210 ; case 3
	b _0206123C ; case 4
	b _02061268 ; case 5
	b _0206129C ; case 6
	b _020612EC ; case 7
	b _0206131C ; case 8
	b _02061370 ; case 9
_02061164:
	ldr r0, [sb, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020611A8
_02061178: ; jump table
	b _020611A8 ; case 0
	b _020611A8 ; case 1
	b _020611A8 ; case 2
	b _020611A8 ; case 3
	b _020611A8 ; case 4
	b _02061198 ; case 5
	b _020611A0 ; case 6
	b _02061198 ; case 7
_02061198:
	ldr r3, _02061BE4 ; =0x000038CE
	b _020611AC
_020611A0:
	ldr r3, _02061BE8 ; =0x000038CF
	b _020611AC
_020611A8:
	ldr r3, _02061BEC ; =0x000038CD
_020611AC:
	mov r0, r8
	mov r1, #4
	mov r2, #0x11
	bl AppendStandardStringToMission
	b _020613D4
_020611C0:
	add r1, sp, #0xfc
	str r1, [sp]
	mov r0, r5
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_020611E4:
	ldrsh r2, [sb, #0x16]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0x10c]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061210:
	ldrsh r2, [sb, #0x10]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0xfc]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206123C:
	ldrsh r2, [sb, #0x12]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0xfc]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061268:
	ldrsh r1, [sb, #0x12]
	add r2, sp, #0xfc
	mov r0, r5
	str r1, [sp, #0xfc]
	ldrsh r6, [sb, #0x16]
	mov r1, r4
	mov r3, r8
	str r6, [sp, #0x10c]
	str r2, [sp]
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206129C:
	ldrsh r0, [sb, #0x16]
	str r0, [sp, #0x10c]
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [sb, #8]
	mov r3, r8
	ldrneb r1, [r0, #1]
	ldreqb r0, [r0, #1]
	mov r2, #0x11
	rsbeq r1, r0, #0
	str r1, [sp, #0x120]
	add r0, sp, #0xfc
	str r0, [sp]
	mov r0, r5
	mov r1, r4
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_020612EC:
	ldr r0, [sb, #8]
	add r2, sp, #0xfc
	ldrb r3, [r0]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x10c]
	str r2, [sp]
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206131C:
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	str r0, [sp, #0x10c]
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [sb, #8]
	mov r3, r8
	ldrneb r1, [r0, #1]
	ldreqb r0, [r0, #1]
	mov r2, #0x11
	rsbeq r1, r0, #0
	str r1, [sp, #0x120]
	add r0, sp, #0xfc
	str r0, [sp]
	mov r0, r5
	mov r1, r4
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061370:
	ldr r1, [sb, #0x58]
	mov r0, r5
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	mov r0, r8
	mov r3, r5
	mov r1, #4
	mov r2, #0x11
	bl DrawTextInWindow
	ldr r1, [sb, #0x58]
	mov r0, r5
	add r1, r1, #0x24
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	mov r0, r8
	mov r1, #4
	mov r2, #0x1e
	mov r3, r5
	bl DrawTextInWindow
_020613D4:
	ldrb r1, [sb, #0x46]
	cmp r1, #0xf
	beq _02061518
	ldr r0, [sb, #0x64]
#ifdef JAPAN
	mov r6, #0x3e
#endif
	cmp r0, #0
	beq _02061418
	ldrb r0, [r0]
	cmp r0, #7
	cmpne r0, #5
	bne _02061418
#ifdef JAPAN
	mov sl, #0x2d
	ldr r3, _02061BF0 ; =0x00003C21
	mov r0, r8
	mov r2, sl
#else
	mov r6, #0x2d
	ldr r3, _02061BF0 ; =0x00003C21
	mov r0, r8
	mov r2, r6
#endif
	mov r1, #4
	bl AppendStandardStringToMission
	b _0206144C
_02061418:
	cmp r1, #0xe
#ifdef JAPAN
	mov sl, #0x2d
#else
	mov r6, #0x2d
#endif
	mov r1, #4
	bne _0206143C
	ldr r3, _02061BF4 ; =0x00003C20
	mov r0, r8
#ifdef JAPAN
	mov r2, sl
	bl AppendStandardStringToMission
	add r6, r6, #0x10
#else
	mov r2, r6
	bl AppendStandardStringToMission
#endif
	b _0206144C
_0206143C:
	ldr r3, _02061BF8 ; =0x00003C1F
	mov r0, r8
#ifdef JAPAN
	mov r2, sl
#else
	mov r2, r6
#endif
	bl AppendStandardStringToMission
_0206144C:
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	bne _020614BC
	ldr r0, [sb, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #8
	bne _0206147C
	ldr r1, _02061BD0 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02061494
_0206147C:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [sb, #0xc]
	add r0, sp, #8
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02061494:
	ldr r1, _02061BFC ; =_020A4688
	add r2, sp, #8
	mov r0, r4
	bl SprintfStatic__020609E8
	mov r0, r8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
	mov r3, r4
#else
	mov r2, r6
	mov r3, r4
	mov r1, #0x42
#endif
	bl DrawTextInWindow
	b _02061518
_020614BC:
	ldr r0, [sb, #0x5c]
	cmp r0, #0
	beq _020614EC
	ldrb r0, [r0, #1]
	cmp r0, #0xe
	bne _020614EC
	ldr r3, _02061C00 ; =0x00003C37
	mov r0, r8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
#else
	mov r2, r6
	mov r1, #0x42
#endif
	bl AppendStandardStringToMission
	b _02061518
_020614EC:
	ldrsh r0, [sb, #0x10]
	bl GetNameString
	mov r2, r0
	ldr r1, _02061C04 ; =_020A4698
	mov r0, r4
	bl SprintfStatic__020609E8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
	mov r0, r8
#else
	mov r2, r6
	mov r0, r8
	mov r1, #0x42
#endif
	mov r3, r4
	bl DrawTextInWindow
_02061518:
	ldrb r2, [sb, #0x48]
	ldr r1, _02061C08 ; =MISSION_MENU_STRING_IDS_1
	mov r0, r5
	mov r2, r2, lsl #1
	ldrh r1, [r1, r2]
	bl GetStringFromFileVeneer
	ldrb r0, [sb, #0x48]
	mov r3, r5
	mov r2, #0x2d
	add r0, r0, #0xfc
	and r0, r0, #0xff
	cmp r0, #2
#ifdef JAPAN
	movls r1, #0x56
#else
	movls r1, #0x43
#endif
	movhi r1, #0x40
	mov r0, r8
	add r1, r1, #0x6c
	bl DrawTextInWindow
	ldr r3, _02061C0C ; =_020A46A8
	mov r0, r8
	mov r1, #0x6c
	mov r2, #1
	bl DrawTextInWindow
	ldr r3, _02061C10 ; =0x00003C22
	mov r0, r8
	mov r1, #4
	mov r2, #0x3a
	bl AppendStandardStringToMission
	ldrb r2, [sb, #0x46]
	ldrsh r6, [sb, #0x16]
	mov r0, r4
	cmp r2, #0xe
	ldreqsh r3, [sb, #0x10]
	mov r1, #0x12c
	ldrnesh r3, [sb, #0x12]
	str r6, [sp]
	bl AppendMissionObjective
	mov r0, r8
	mov r3, r4
	mov r1, SUB_02060FD8_ARG
	mov r2, #0x3a
	bl DrawTextInWindow
	add r7, r7, #0x47
	ldr r3, _02061C14 ; =0x00003C23
	mov r0, r8
	mov r1, #4
	mov r2, r7
	bl AppendStandardStringToMission
	mov r0, sb
	mov r1, r4
	mov r2, #0x100
	bl AppendMissionDungeonLocation
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r2, r7
	mov r3, r4
	bl DrawTextInWindow
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	beq _020616C8
	add r7, r7, #0xd
	ldr r3, _02061C18 ; =0x00003C24
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl AppendStandardStringToMission
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x49]
	cmp r0, #0
	bne _02061670
	ldrb r0, [sb, #0x4c]
	cmp r0, #0
	beq _02061660
	ldr r2, _02061C1C ; =0x00003C26
	str r0, [sp, #0x10c]
	add r6, sp, #0xfc
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	b _020616B4
_02061660:
	ldr r1, _02061C20 ; =0x00003C25
	mov r0, r4
	bl GetStringFromFileVeneer
	b _020616B4
_02061670:
	cmp r0, #1
	bne _020616B4
	ldrsh r0, [sb, #0x4a]
	cmp r0, #0
	beq _020616A8
	ldr r2, _02061C24 ; =0x00003C27
	str r0, [sp, #0xfc]
	add r6, sp, #0xfc
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	b _020616B4
_020616A8:
	ldr r1, _02061C20 ; =0x00003C25
	mov r0, r4
	bl GetStringFromFileVeneer
_020616B4:
	mov r0, r8
	mov r2, r7
	mov r3, r4
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
_020616C8:
	ldr r1, [sb, #0x5c]
	cmp r1, #0
	beq _02061710
	ldrb r0, [r1, #1]
	cmp r0, #0xe
	bne _02061710
	add r7, r7, #0xd
	ldr r3, _02061C28 ; =0x00003C28
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl AppendStandardStringToMission
	ldr r3, _02061C2C ; =0x00003C2A
	mov r0, r8
	mov r2, r7
	mov r1, SUB_02060FD8_ARG
	bl AppendStandardStringToMission
	b _020617D4
_02061710:
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	bne _02061740
	ldr r0, [sb, #8]
	mov r1, #0
	bl GetMissionRankWithCapAndModifiersAndCap
	mov sl, r0
	ldr r0, [sb, #8]
	mov r1, #0
	bl GetMissionRankWithCapAndModifiers
	ldr r1, _02061C30 ; =MISSION_RANK_POINTS
	b _02061764
_02061740:
	ldrb r1, [r1, #1]
	ldr r0, [sb, #8]
	bl GetMissionRankWithCapAndModifiersAndCap
	ldr r1, [sb, #0x5c]
	mov sl, r0
	ldrb r1, [r1, #1]
	ldr r0, [sb, #8]
	bl GetMissionRankWithCapAndModifiers
	ldr r1, _02061C30 ; =MISSION_RANK_POINTS
_02061764:
	add r7, r7, #0xd
	ldr r6, [r1, r0, lsl #2]
	ldr r3, _02061C28 ; =0x00003C28
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl AppendStandardStringToMission
	ldr r1, _02061C34 ; =RANK_STRING_PTR_TABLE
	mov r0, r8
	ldr r3, [r1, sl, lsl #2]
	mov r2, r7
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	str r6, [sp, #0x120]
	add r1, sp, #0xfc
	str r1, [sp]
	ldr r2, _02061C38 ; =0x00003C29
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r8
#ifdef JAPAN
	mov r1, #0x52
#else
	mov r1, #0x56
#endif
	mov r2, r7
	mov r3, r4
	bl DrawTextInWindow
_020617D4:
	ldr r1, [sb, #0x64]
	cmp r1, #0
	bne _02061AAC
	ldrb r0, [sb, #0x46]
	cmp r0, #0xf
	beq _02061AAC
	cmp r0, #0xe
	add r6, r7, #0xd
	mov r1, #4
	bne _02061810
	ldr r3, _02061C3C ; =0x00003C2C
	mov r0, r8
	mov r2, r6
	bl AppendStandardStringToMission
	b _02061820
_02061810:
	ldr r3, _02061C40 ; =0x00003C2B
	mov r0, r8
	mov r2, r6
	bl AppendStandardStringToMission
_02061820:
	ldrb r1, [sb, #0x1a]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02061A88
_02061830: ; jump table
	b _02061850 ; case 0
	b _020618A0 ; case 1
	b _020618F0 ; case 2
	b _02061940 ; case 3
	b _02061990 ; case 4
	b _020619E0 ; case 5
	b _02061A0C ; case 6
	b _02061A5C ; case 7
_02061850:
	ldr r1, [sb, #0x20]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xd0]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020618A0:
	ldr r1, [sb, #0x20]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xd0]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020618F0:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061940:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061990:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020619E0:
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	mov r1, r1, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061A0C:
	ldrsh r1, [sb, #0x3c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xac]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061A5C:
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	mov r1, r1, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061A88:
	ldr r1, _02061C48 ; =0x000038DF
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061AAC:
	cmp r1, #0
	beq _02061BA4
	ldrb r0, [r1]
	cmp r0, #7
	cmpne r0, #5
	bne _02061BA4
	add r0, sp, #0x5c
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x1a]
	cmp r0, #2
	bne _02061B48
	ldr r3, _02061C4C ; =0x00003C2D
	mov r0, r8
	add r2, r7, #0xd
	mov r1, #4
	bl AppendStandardStringToMission
	mov r6, #0
	ldr r2, _02061C50 ; =_020A3CBC
	mov r0, r5
	add r1, sb, #0x28
	mov r3, #1
	str r6, [sp]
	bl MaybeGetFormattedItemName
	ldr r0, _02061C54 ; =0x00003C2E
	str r5, [sp, #0x94]
	bl StringFromId
	add r1, sp, #0x5c
	mov r2, r0
	str r1, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	add r2, r7, #0xd
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061B48:
	cmp r0, #6
	bne _02061BA4
	ldr r3, _02061C58 ; =0x00003C2F
	mov r0, r8
	add r2, r7, #0xd
	mov r1, #4
	bl AppendStandardStringToMission
	ldrsh r1, [sb, #0x3c]
	ldr r0, _02061C5C ; =0x00003C30
	str r1, [sp, #0x5c]
	bl StringFromId
	add r1, sp, #0x5c
	mov r2, r0
	str r1, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	add r2, r7, #0xd
	mov r3, r4
	bl DrawTextInWindow
_02061BA4:
	ldrb r1, [sb, #0x45]
	ldr r2, [sb, #0x5c]
	mov r0, r8
	add r3, r7, #0x1a
	bl PrintWonderMailSkyCode
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl MemFree
	add sp, sp, #0x14c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02060FD8_OFFSET 2
#elif defined(JAPAN)
#define SUB_02060FD8_OFFSET -0x3C2
#else
#define SUB_02060FD8_OFFSET 0
#endif
_02061BD0: .word 0x000038C9 + SUB_02060FD8_OFFSET
_02061BD4: .word 0x000038CB + SUB_02060FD8_OFFSET
_02061BD8: .word 0x000038CC + SUB_02060FD8_OFFSET
_02061BDC: .word 0x000038CA + SUB_02060FD8_OFFSET
_02061BE0: .word 0x00003C1E + SUB_02060FD8_OFFSET
_02061BE4: .word 0x000038CE + SUB_02060FD8_OFFSET
_02061BE8: .word 0x000038CF + SUB_02060FD8_OFFSET
_02061BEC: .word 0x000038CD + SUB_02060FD8_OFFSET
_02061BF0: .word 0x00003C21 + SUB_02060FD8_OFFSET
_02061BF4: .word 0x00003C20 + SUB_02060FD8_OFFSET
_02061BF8: .word 0x00003C1F + SUB_02060FD8_OFFSET
_02061BFC: .word _020A4688
_02061C00: .word 0x00003C37 + SUB_02060FD8_OFFSET
_02061C04: .word _020A4698
_02061C08: .word MISSION_MENU_STRING_IDS_1
_02061C0C: .word _020A46A8
_02061C10: .word 0x00003C22 + SUB_02060FD8_OFFSET
_02061C14: .word 0x00003C23 + SUB_02060FD8_OFFSET
_02061C18: .word 0x00003C24 + SUB_02060FD8_OFFSET
_02061C1C: .word 0x00003C26 + SUB_02060FD8_OFFSET
_02061C20: .word 0x00003C25 + SUB_02060FD8_OFFSET
_02061C24: .word 0x00003C27 + SUB_02060FD8_OFFSET
_02061C28: .word 0x00003C28 + SUB_02060FD8_OFFSET
_02061C2C: .word 0x00003C2A + SUB_02060FD8_OFFSET
_02061C30: .word MISSION_RANK_POINTS
_02061C34: .word RANK_STRING_PTR_TABLE
_02061C38: .word 0x00003C29 + SUB_02060FD8_OFFSET
_02061C3C: .word 0x00003C2C + SUB_02060FD8_OFFSET
_02061C40: .word 0x00003C2B + SUB_02060FD8_OFFSET
_02061C44: .word MISSION_MENU_STRING_IDS_2
_02061C48: .word 0x000038DF + SUB_02060FD8_OFFSET
_02061C4C: .word 0x00003C2D + SUB_02060FD8_OFFSET
_02061C50: .word _020A3CBC
_02061C54: .word 0x00003C2E + SUB_02060FD8_OFFSET
_02061C58: .word 0x00003C2F + SUB_02060FD8_OFFSET
_02061C5C: .word 0x00003C30 + SUB_02060FD8_OFFSET
	arm_func_end MakeMissionDetails

	arm_func_start MakeSpecialEpisodeMissionDetails
MakeSpecialEpisodeMissionDetails: ; 0x02061C60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02061CBC ; =0x00003C1E
	mov r4, r1
	mov r1, #4
	mov r2, #0
	mov r5, r0
	bl AppendStandardStringToMission
	ldr r3, _02061CC0 ; =_020A46A8
	mov r0, r5
	mov r1, #0x6c
	mov r2, #1
	bl DrawTextInWindow
	ldr r3, _02061CC4 ; =0x00003C4E
	mov r0, r5
	mov r1, #4
	mov r2, #0x11
	bl AppendStandardStringToMission
	mov r0, r5
	mov r2, r4
	mov r1, #1
	mov r3, #0x7b
	bl PrintWonderMailSkyCode
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02061C60_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061C60_OFFSET -0x3C2
#else
#define SUB_02061C60_OFFSET 0
#endif
_02061CBC: .word 0x00003C1E + SUB_02061C60_OFFSET
_02061CC0: .word _020A46A8
_02061CC4: .word 0x00003C4E + SUB_02061C60_OFFSET
	arm_func_end MakeSpecialEpisodeMissionDetails

	arm_func_start PrintWonderMailSkyCode
PrintWonderMailSkyCode: ; 0x02061CC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r4, r2
	cmp r1, #9
	cmpne r1, #0
	mov sl, r0
	mov sb, r3
	cmpne r4, #0
	beq _02061DB8
	ldrb r1, [r4]
	cmp r1, #4
	bne _02061DB8
	ldr r3, _02061DC4 ; =0x00003C31
	mov r2, sb
	mov r1, #4
	bl AppendStandardStringToMission
	add r0, sp, #4
	mov r1, r4
	add sb, sb, #0xd
	bl MissionToWonderMailPassword
	mov r7, #0
	mov fp, #0x44
	add r6, sp, #4
	mov r4, #0xb
	b _02061DB0
_02061D2C:
	beq _02061DB8
	cmp r7, #5
	movlt r8, fp
	blt _02061D60
	cmp r7, #0xc
	movlt r8, #0x43
	blt _02061D60
	cmp r7, #0x16
	movlt r8, #0x44
	blt _02061D60
	cmp r7, #0x1d
	movlt r8, #0x43
	movge r8, #0x44
_02061D60:
	ldrb r0, [r6, r7]
	bl sub_020251F0
	mov r5, r0
	mov r0, r7
	mov r1, #0x11
	bl _s32_div_f
	mul r2, r1, r4
	and r0, r8, #0xff
	str r0, [sp]
	add r1, r2, #0x13
	mov r3, r5
	mov r0, sl
	mov r2, sb
	bl sub_020264F8
	add r0, r7, #1
	mov r1, #0x11
	bl _s32_div_f
	cmp r1, #0
	addeq sb, sb, #0xd
	add r7, r7, #1
_02061DB0:
	cmp r7, #0x22
	blt _02061D2C
_02061DB8:
	mov r0, sb
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
_02061DC4: .word 0x00003C33
#elif defined(JAPAN)
_02061DC4: .word 0x0000386F
#else
_02061DC4: .word 0x00003C31
#endif
	arm_func_end PrintWonderMailSkyCode

	arm_func_start AppendMissionObjective
AppendMissionObjective: ; 0x02061DC8
#if defined(EUROPE)
#define SUB_02061DC8_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061DC8_WORD_OFFSET -0x3C2
#else
#define SUB_02061DC8_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r5, r0
	add r0, sp, #4
	mov r7, r2
	mov r4, r1
	mov r6, r3
	bl InitPreprocessorArgs
	cmp r7, #0xf
	addls pc, pc, r7, lsl #2
	b _02061EE4
_02061DF4: ; jump table
	b _02061E34 ; case 0
	b _02061E4C ; case 1
	b _02061E3C ; case 2
	b _02061E5C ; case 3
	b _02061EAC ; case 4
	b _02061E8C ; case 5
	b _02061E68 ; case 6
	b _02061E74 ; case 7
	b _02061E80 ; case 8
	b _02061EE4 ; case 9
	b _02061E98 ; case 10
	b _02061EA4 ; case 11
	b _02061EB8 ; case 12
	b _02061EC4 ; case 13
	b _02061ED0 ; case 14
	b _02061EDC ; case 15
_02061E34:
	ldr r2, _02061F08 ; =0x00003C38
	b _02061EE8
_02061E3C:
	ldrsh r0, [sp, #0x68]
	ldr r2, _02061F0C ; =0x00003C3A
	str r0, [sp, #0x14]
	b _02061EE8
_02061E4C:
	ldrsh r0, [sp, #0x68]
	ldr r2, _02061F10 ; =0x00003C39
	str r0, [sp, #0x14]
	b _02061EE8
_02061E5C:
	str r6, [sp, #4]
	ldr r2, _02061F14 ; =0x00003C3B
	b _02061EE8
_02061E68:
	str r6, [sp, #4]
#ifdef EUROPE
	mov r2, #0x3c40
#else
	ldr r2, _02061F18 ; =0x00003C3E
#endif
	b _02061EE8
_02061E74:
	str r6, [sp, #4]
	ldr r2, _02061F1C ; =0x00003C3F
	b _02061EE8
_02061E80:
	str r6, [sp, #4]
#ifdef NORTH_AMERICA
	mov r2, #0x3c40
#else
	ldr r2, _02062298 ; =0x00003C42
#endif
	b _02061EE8
_02061E8C:
	str r6, [sp, #4]
	ldr r2, _02061F20 ; =0x00003C3D
	b _02061EE8
_02061E98:
	str r6, [sp, #4]
#ifdef JAPAN
	mov r2, #0x3880
#else
	ldr r2, _02061F24 ; =0x00003C42
#endif
	b _02061EE8
_02061EA4:
	ldr r2, _02061F28 ; =0x00003C43
	b _02061EE8
_02061EAC:
	str r6, [sp, #4]
	ldr r2, _02061F2C ; =0x00003C3C
	b _02061EE8
_02061EB8:
	str r6, [sp, #4]
	ldr r2, _02061F30 ; =0x00003C41
	b _02061EE8
_02061EC4:
	str r6, [sp, #4]
	ldr r2, _02061F34 ; =0x00003C44
	b _02061EE8
_02061ED0:
	str r6, [sp, #4]
	ldr r2, _02061F38 ; =0x00003C45
	b _02061EE8
_02061EDC:
	ldr r2, _02061F3C ; =0x00003C47
	b _02061EE8
_02061EE4:
	ldr r2, _02061F40 ; =0x00003C46
_02061EE8:
	add ip, sp, #4
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl PreprocessStringFromId
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02061F08: .word 0x00003C38 + SUB_02061DC8_WORD_OFFSET
_02061F0C: .word 0x00003C3A + SUB_02061DC8_WORD_OFFSET
_02061F10: .word 0x00003C39 + SUB_02061DC8_WORD_OFFSET
_02061F14: .word 0x00003C3B + SUB_02061DC8_WORD_OFFSET
#ifndef EUROPE
_02061F18: .word 0x00003C3E + SUB_02061DC8_WORD_OFFSET
#endif
_02061F1C: .word 0x00003C3F + SUB_02061DC8_WORD_OFFSET
#if defined(EUROPE)
_02062298: .word 0x00003C42
#elif defined(JAPAN)
_02062298: .word 0x0000387E
#endif
_02061F20: .word 0x00003C3D + SUB_02061DC8_WORD_OFFSET
#ifndef JAPAN
_02061F24: .word 0x00003C42 + SUB_02061DC8_WORD_OFFSET
#endif
_02061F28: .word 0x00003C43 + SUB_02061DC8_WORD_OFFSET
_02061F2C: .word 0x00003C3C + SUB_02061DC8_WORD_OFFSET
_02061F30: .word 0x00003C41 + SUB_02061DC8_WORD_OFFSET
_02061F34: .word 0x00003C44 + SUB_02061DC8_WORD_OFFSET
_02061F38: .word 0x00003C45 + SUB_02061DC8_WORD_OFFSET
_02061F3C: .word 0x00003C47 + SUB_02061DC8_WORD_OFFSET
_02061F40: .word 0x00003C46 + SUB_02061DC8_WORD_OFFSET
	arm_func_end AppendMissionObjective

	arm_func_start sub_02061F44
sub_02061F44: ; 0x02061F44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x6c
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r1, sp, #4
	mov r0, r4
	bl sub_02060274
	ldrb r2, [sp, #0x4a]
	ldrsh ip, [r4, #0x14]
	mov r0, r6
	cmp r2, #0xe
	ldreqsh r3, [r4, #0xe]
	mov r1, r5
	ldrnesh r3, [r4, #0x10]
	str ip, [sp]
	bl AppendMissionObjective
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02061F44

	arm_func_start sub_02061F90
sub_02061F90: ; 0x02061F90
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r1, sp, #0
	mov r0, r4
	bl sub_02060274
	add ip, r4, #4
	mov r3, #0
	add r0, sp, #0
	mov r1, r6
	mov r2, r5
	str ip, [sp, #8]
	str r3, [sp, #0x64]
	str r4, [sp, #0x5c]
	bl AppendMissionDungeonLocation
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02061F90

	arm_func_start AppendMissionDungeonLocation
AppendMissionDungeonLocation: ; 0x02061FDC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r7, r0
	ldr r0, [r7, #8]
	mov r6, r1
	ldrb r0, [r0]
	mov r5, r2
	bl DungeonSwapIdToIdx
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, [r7, #0x64]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #7
	cmpne r0, #5
	beq _0206205C
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #0
	bne _0206205C
	ldr r0, [r7, #8]
	ldr r2, _020621FC ; =0x00003C35
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_0206205C:
	ldrb r0, [r7, #0x46]
	cmp r0, #0xf
	bne _020620AC
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [r7, #8]
	ldr r2, _02062200 ; =0x00003C34
	ldrneb r0, [r0, #1]
	add r4, sp, #4
	mov r1, r5
	ldreqb r0, [r0, #1]
	mov r3, #0
	rsbeq r0, r0, #0
	str r0, [sp, #0x28]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_020620AC:
	ldr r1, [r7, #0x5c]
	cmp r1, #0
	beq _020620F8
	ldrb r0, [r1, #1]
	cmp r0, #0xb
	ldreqb r0, [r1, #2]
	cmpeq r0, #5
	bne _020620F8
	ldr r0, [r7, #8]
	ldr r2, _02062204 ; =0x00003C36
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_020620F8:
	cmp r1, #0
	beq _02062150
	ldrb r0, [r1, #1]
	cmp r0, #6
	ldreqb r0, [r1, #2]
	cmpeq r0, #4
	beq _02062150
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #0
	bne _02062150
	ldr r0, [r7, #8]
	ldr r2, _020621FC ; =0x00003C35
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_02062150:
	ldrb r0, [r7, #0x46]
	mov r1, #0x20000
	cmp r0, #0xc
	beq _020621A0
	ldr r2, [r7, #0x5c]
	cmp r2, #0
	beq _020621A4
	ldrb r3, [r2, #1]
	cmp r3, #0xe
	beq _020621A0
	cmp r3, #6
	ldreqb r0, [r2, #2]
	cmpeq r0, #4
	beq _020621A0
	cmp r3, #3
	ldreqb r0, [r2, #2]
	cmpeq r0, #3
	beq _020621A0
	cmp r3, #5
	bne _020621A4
_020621A0:
	mov r1, #0
_020621A4:
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	orr r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [r7, #8]
	ldr r2, _02062208 ; =0x00003C32
	ldrneb r0, [r0, #1]
	add r4, sp, #4
	mov r1, r5
	ldreqb r0, [r0, #1]
	mov r3, #0
	rsbeq r0, r0, #0
	str r0, [sp, #0x28]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
_020621F4:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02061FDC_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061FDC_OFFSET -0x3C2
#else
#define SUB_02061FDC_OFFSET 0
#endif
_020621FC: .word 0x00003C35 + SUB_02061FDC_OFFSET
_02062200: .word 0x00003C34 + SUB_02061FDC_OFFSET
_02062204: .word 0x00003C36 + SUB_02061FDC_OFFSET
_02062208: .word 0x00003C32 + SUB_02061FDC_OFFSET
	arm_func_end AppendMissionDungeonLocation

	arm_func_start sub_0206220C
sub_0206220C: ; 0x0206220C
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r0, #0
	mov r2, r1
	mov r3, r0
	b _02062234
_02062224:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	add r3, r3, #1
	add r0, r0, r1
_02062234:
	cmp r3, ip
	blo _02062224
	mov r1, ip
	bl RandomizeMissionCategory
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206220C

	arm_func_start RandomizeMissionCategory
RandomizeMissionCategory: ; 0x02062248
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r1
	mov r5, r2
	bl RandIntSafe
	mov r2, r4
	b _02062280
_02062264:
	mov r1, r2, lsl #1
	ldrh r1, [r5, r1]
	add r4, r4, r1
	cmp r0, r4
	movlo r0, r2
	ldmloia sp!, {r4, r5, r6, pc}
	add r2, r2, #1
_02062280:
	cmp r2, r6
	blo _02062264
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end RandomizeMissionCategory

	arm_func_start SumValidMissionCategoryWeights
SumValidMissionCategoryWeights: ; 0x02062290
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	mov r0, #0x4e
	mov r1, #0xf
	mov r6, #0
	bl MemAlloc
	mov r7, r0
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _02062524
_020622B8: ; jump table
	b _020622C8 ; case 0
	b _02062360 ; case 1
	b _020623F8 ; case 2
	b _02062490 ; case 3
_020622C8:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =RESCUE_BIN_UNPACK
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_020622E8:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _0206233C
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _0206233C
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _02062324
	mov r0, fp
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0206233C
_02062324:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #4
	ldrh r1, [r1, r0]
	mov r0, sl, lsl #1
	strh r1, [r7, r0]
	b _02062344
_0206233C:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_02062344:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _020622E8
	b _02062524
_02062360:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =RESCUE_BIN_UNPACK
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_02062380:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _020623D4
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _020623D4
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _020623BC
	mov r0, fp
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _020623D4
_020623BC:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #2]
	strh r1, [r7, r0]
	b _020623DC
_020623D4:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_020623DC:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _02062380
	b _02062524
_020623F8:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =RESCUE_BIN_UNPACK
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_02062418:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _0206246C
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _0206246C
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _02062454
	mov r0, fp
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _0206246C
_02062454:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #4]
	strh r1, [r7, r0]
	b _02062474
_0206246C:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_02062474:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _02062418
	b _02062524
_02062490:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =RESCUE_BIN_UNPACK
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_020624B0:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _02062504
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _02062504
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _020624EC
	mov r0, fp
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	beq _02062504
_020624EC:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #6]
	strh r1, [r7, r0]
	b _0206250C
_02062504:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_0206250C:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _020624B0
_02062524:
	ldr r0, _02062544 ; =RESCUE_BIN_UNPACK
	cmp r6, #0
	str r6, [r0, #0x20]
	str r7, [r0, #0x1c]
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02062544: .word RESCUE_BIN_UNPACK
	arm_func_end SumValidMissionCategoryWeights

	arm_func_start sub_02062548
sub_02062548: ; 0x02062548
	stmdb sp!, {r3, lr}
	ldr r0, _02062574 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02062574 ; =RESCUE_BIN_UNPACK
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02062574: .word RESCUE_BIN_UNPACK
	arm_func_end sub_02062548

	arm_func_start GetRandomMissionTemplate
GetRandomMissionTemplate: ; 0x02062578
	stmdb sp!, {r4, lr}
	ldr r2, _02062768 ; =RESCUE_BIN_UNPACK
	mov r1, #0x258
	ldr r0, [r2, #0x20]
	ldr r2, [r2, #0x1c]
	bl RandomizeMissionCategory
	movs r4, r0
	bmi _02062760
	ldr r0, _02062768 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0, #0xc]
	add r0, r0, r4, lsl #4
	ldrh r0, [r0, #0xc]
	bl RandInt
	ldr r2, _02062768 ; =RESCUE_BIN_UNPACK
	mov r1, #0x22
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #0x18]
	add r3, r3, r4, lsl #4
	ldrh r3, [r3, #0xe]
	add r0, r3, r0
	mla r4, r0, r1, r2
	ldrb r0, [r4, #0x20]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _02062750
_020625DC: ; jump table
	b _02062750 ; case 0
	b _02062750 ; case 1
	b _02062750 ; case 2
	b _02062660 ; case 3
	b _02062750 ; case 4
	b _02062750 ; case 5
	b _02062618 ; case 6
	b _02062750 ; case 7
	b _02062750 ; case 8
	b _02062750 ; case 9
	b _02062750 ; case 10
	b _02062684 ; case 11
	b _02062750 ; case 12
	b _02062750 ; case 13
	b _020626F4 ; case 14
_02062618:
	ldrb r0, [r4, #0x21]
	cmp r0, #2
	bne _02062638
	mov r0, #6
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	moveq r0, #0
	beq _02062754
_02062638:
	ldrb r0, [r4, #0x21]
	cmp r0, #4
	bne _02062750
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl CheckDungeonMissionUnlockConditions
	cmp r0, #0
	beq _02062750
	mov r0, #0
	b _02062754
_02062660:
	ldrb r0, [r4, #0x21]
	cmp r0, #2
	bne _02062750
	mov r0, #9
	bl GetResolvedPerformanceProgressFlag
	cmp r0, #0
	bne _02062750
	mov r0, #0
	b _02062754
_02062684:
	ldrb r0, [r4, #0x21]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02062750
_02062694: ; jump table
	b _02062750 ; case 0
	b _020626C0 ; case 1
	b _020626C0 ; case 2
	b _020626C0 ; case 3
	b _020626C0 ; case 4
	b _020626AC ; case 5
_020626AC:
	mov r0, #0
	bl IsSpecialEpisodeBeaten
	cmp r0, #0
	moveq r0, #0
	beq _02062754
_020626C0:
	ldrsh r0, [r4, #0x12]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	movne r0, #0
	bne _02062754
	ldrb r0, [r4, #0x20]
	add r1, r4, #0x21
	bl AlreadyHasSimilarMission
	cmp r0, #0
	beq _02062750
	mov r0, #0
	b _02062754
_020626F4:
	ldrb r0, [r4, #0x21]
	cmp r0, #1
	bne _02062750
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #3
	moveq r0, #0
	beq _02062754
	ldrb r0, [r4, #0x20]
	add r1, r4, #0x21
	bl AlreadyHasSimilarMission
	cmp r0, #0
	beq _02062750
	ldrh r0, [r4, #0xc]
	mvn r1, #0
	mov r2, #0
	and r0, r0, #0xff
	bl sub_0205E090
	cmp r0, #0
	movne r0, #0
	bne _02062754
_02062750:
	mov r0, #1
_02062754:
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r4, pc}
_02062760:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062768: .word RESCUE_BIN_UNPACK
	arm_func_end GetRandomMissionTemplate

	arm_func_start sub_0206276C
sub_0206276C: ; 0x0206276C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _020627F0 ; =RESCUE_BIN_UNPACK
	mov ip, #0
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x18]
	mov r6, #0x22
	b _020627E0
_02062788:
	add lr, r4, ip, lsl #4
	ldrh r7, [lr, #0xe]
	mla r8, r7, r6, r5
	ldrb r7, [r8, #0x20]
	cmp r7, r0
	ldreqb r8, [r8, #0x21]
	ldreqb r7, [r1]
	cmpeq r8, r7
	bne _020627DC
	cmp r2, #0
	ldrneb r0, [lr, #8]
	ldr r1, [sp, #0x18]
	strneb r0, [r2]
	cmp r3, #0
	ldrneb r0, [lr, #9]
	strne r0, [r3]
	cmp r1, #0
	ldrneh r0, [lr, #0xa]
	strne r0, [r1]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020627DC:
	add ip, ip, #1
_020627E0:
	cmp ip, #0x27
	blt _02062788
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020627F0: .word RESCUE_BIN_UNPACK
	arm_func_end sub_0206276C

	arm_func_start sub_020627F4
sub_020627F4: ; 0x020627F4
	ldr r0, _02062800 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_02062800: .word RESCUE_BIN_UNPACK
	arm_func_end sub_020627F4

	arm_func_start LoadMissionTemplates
LoadMissionTemplates: ; 0x02062804
	ldr r0, _02062810 ; =RESCUE_BIN_UNPACK
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02062810: .word RESCUE_BIN_UNPACK
	arm_func_end LoadMissionTemplates

	arm_func_start sub_02062814
sub_02062814: ; 0x02062814
	cmp r0, #0
	ldrne r1, _02062828 ; =MISSION_DUNGEON_UNLOCK_TABLE
	strne r1, [r0]
	mov r0, #3
	bx lr
	.align 2, 0
_02062828: .word MISSION_DUNGEON_UNLOCK_TABLE
	arm_func_end sub_02062814

	arm_func_start sub_0206282C
sub_0206282C: ; 0x0206282C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, #0
	ldr r4, _020628FC ; =MISSION_DUNGEON_UNLOCK_TABLE
	mov sb, r0
	mov r8, r5
_02062840:
	ldrb r0, [r4, r8, lsl #1]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	bne _020628E8
	bl GetScenarioBalance
	add r1, r4, r8, lsl #1
	ldrb r1, [r1, #1]
	mov r2, r8, lsl #1
	cmp r1, r0
	bhi _020628E8
	ldrb r0, [r4, r2]
	bl GetMaxReachedFloor
	cmp r0, #0
	bne _020628E8
	ldrb r0, [r4, r8, lsl #1]
	cmp r0, #0x5b
	beq _020628E8
	mov r7, #1
	mov r6, #0
	b _020628C8
_02062894:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0, #1]
	cmp r1, #3
	ldreqb r1, [r0, #2]
	cmpeq r1, #3
	ldreqb r1, [r0, #4]
	ldreqb r0, [r4, r8, lsl #1]
	cmpeq r1, r0
	moveq r7, #0
	beq _020628D0
	add r6, r6, #1
_020628C8:
	cmp r6, #8
	blt _02062894
_020628D0:
	cmp r7, #0
	beq _020628E8
	cmp sb, #0
	ldrneb r0, [r4, r8, lsl #1]
	strneb r0, [sb, r5]
	add r5, r5, #1
_020628E8:
	add r8, r8, #1
	cmp r8, #3
	blt _02062840
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020628FC: .word MISSION_DUNGEON_UNLOCK_TABLE
	arm_func_end sub_0206282C

	arm_func_start sub_02062900
sub_02062900: ; 0x02062900
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r6, r0
	mov r4, r2
	ldr r1, _02062940 ; =_020A3CA0
	add r0, sp, #0
	mov r2, #6
	bl MemcpySimple
	add r3, sp, #0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02062944
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02062940: .word _020A3CA0
	arm_func_end sub_02062900

	arm_func_start sub_02062944
sub_02062944: ; 0x02062944
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x12
	mov r8, r1
	mov r5, r2
	mov r4, r3
	bl RandIntSafe
	mov r0, r0, lsl #0x10
	cmp sb, #0
	mov r6, r0, lsr #0x10
	mov r7, #0
	beq _02062984
	mov r0, sb
	bl RandIntSafe
	mov r0, r0, lsl #1
	ldrsh r7, [r8, r0]
_02062984:
	bl GetRank
	cmp r0, #3
	movhs r0, #1
	movlo r0, #0
	tst r0, #0xff
	cmpne r6, #0
	moveq r0, #0
	streqh r0, [r4, #2]
	bl GetRank
	cmp r0, #4
	movhs r0, #1
	movlo r0, #0
	tst r0, #0xff
	cmpne r7, #0
	moveq r0, #0
	streqh r0, [r4, #4]
	mov r1, r4
	mov r0, #3
	bl sub_0206220C
	cmp r0, #0
	beq _020629F4
	cmp r0, #1
	beq _02062A04
	cmp r0, #2
	moveq r0, #1
	streqb r0, [r5]
	streqh r7, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020629F4:
	mov r0, #0
	strb r0, [r5]
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02062A04:
	mov r0, #0
	strb r0, [r5]
	strh r6, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02062944

	arm_func_start IsMonsterMissionAllowed
IsMonsterMissionAllowed: ; 0x02062A14
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl GetBaseForm
	bl FemaleToMaleForm
	ldr r1, _02062A54 ; =MISSION_BANNED_MONSTERS
	b _02062A3C
_02062A2C:
	cmp r0, r2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
_02062A3C:
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	cmp r2, #0
	bne _02062A2C
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062A54: .word MISSION_BANNED_MONSTERS
	arm_func_end IsMonsterMissionAllowed

	arm_func_start CanMonsterBeUsedForMissionWrapper
CanMonsterBeUsedForMissionWrapper: ; 0x02062A58
	ldr ip, _02062A64 ; =CanMonsterBeUsedForMission
	mov r1, #1
	bx ip
	.align 2, 0
_02062A64: .word CanMonsterBeUsedForMission
	arm_func_end CanMonsterBeUsedForMissionWrapper

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

	arm_func_start sub_02064F94
sub_02064F94: ; 0x02064F94
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	ldr r4, _02064FE0 ; =_020AFC70
	b _02064FD4
_02064FB0:
	ldr r0, [r4]
	mov r3, r5, lsl #0x10
	ldrsh r2, [r8, #8]
	mov r1, r7
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r5, r5, #1
	add r7, r7, #4
_02064FD4:
	cmp r5, r6
	blt _02064FB0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02064FE0: .word _020AFC70
	arm_func_end sub_02064F94

	arm_func_start sub_02064FE4
sub_02064FE4: ; 0x02064FE4
	ldr r3, [r1, #0x20]
	ldr ip, _02064FF8 ; =sub_02064F94
	ldr r2, [r1, #0x24]
	add r1, r1, r3
	bx ip
	.align 2, 0
_02064FF8: .word sub_02064F94
	arm_func_end sub_02064FE4

	arm_func_start sub_02064FFC
sub_02064FFC: ; 0x02064FFC
	mov r1, #0xc
	smulbb r1, r0, r1
	ldr r0, _02065010 ; =_020A5490
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02065010: .word _020A5490
	arm_func_end sub_02064FFC

	arm_func_start sub_02065014
sub_02065014: ; 0x02065014
	mvn r1, #0
	cmp r0, r1
	beq _02065044
	mov r1, #0xc
	smulbb r1, r0, r1
	ldr r0, _0206504C ; =EVENTS
	ldrsh r0, [r0, r1]
	cmp r0, #5
	cmpne r0, #6
	cmpne r0, #8
	moveq r0, #0
	bxeq lr
_02065044:
	mov r0, #1
	bx lr
	.align 2, 0
_0206504C: .word EVENTS
	arm_func_end sub_02065014

	arm_func_start sub_02065050
sub_02065050: ; 0x02065050
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldrsh r0, [r5]
	mvn r4, #0
	cmp r0, #0x2e
	ldreq r0, _02065494 ; =SPECIAL_ACTORS
	ldreqsh r0, [r0, #0x18]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x2f
	ldreq r0, _02065494 ; =SPECIAL_ACTORS
	ldreqsh r0, [r0, #0x16]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x30
	ldreq r0, _02065494 ; =SPECIAL_ACTORS
	ldreqsh r0, [r0, #0x14]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x31
	ldreq r0, _02065494 ; =SPECIAL_ACTORS
	ldreqsh r0, [r0, #0x12]
	streqh r0, [r5]
_020650B0:
	ldrsh r2, [r5]
	mvn r0, #0
	cmp r2, r0
	beq _0206548C
	mov r0, #0xc
	smulbb r1, r2, r0
	ldr r0, _02065498 ; =ENTITIES
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _020651AC
	cmp r2, #0
	bne _020651A4
	mov r0, #0
	mov r1, #0x34
	bl LoadScriptVariableValue
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02065198
_020650F8: ; jump table
	b _0206511C ; case 0
	b _02065128 ; case 1
	b _02065198 ; case 2
	b _02065134 ; case 3
	b _02065180 ; case 4
	b _02065180 ; case 5
	b _02065180 ; case 6
	b _02065180 ; case 7
	b _02065180 ; case 8
_0206511C:
	mov r0, #1
	strh r0, [r5]
	b _020651A4
_02065128:
	mov r0, #2
	strh r0, [r5]
	b _020651A4
_02065134:
	bl GetAppointedLeaderMemberIdx
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r0, #1
	streqh r0, [r5]
	beq _020651A4
	bl GetMainCharacter1MemberIdx
	cmp r4, r0
	moveq r0, #1
	streqh r0, [r5]
	beq _020651A4
	bl GetMainCharacter2MemberIdx
	cmp r4, r0
	moveq r0, #2
	streqh r0, [r5]
	movne r0, #4
	strneh r0, [r5]
	b _020651A4
_02065180:
	mov r0, #0
	mov r1, #0x34
	bl LoadScriptVariableValue
	add r0, r0, #1
	strh r0, [r5]
	b _020651A4
_02065198:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_020651A4:
	mov r4, #0
	b _02065488
_020651AC:
	cmp r0, #2
	bne _02065330
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	mov r4, r0
	mov r0, #0
	mov r1, #0x36
	bl LoadScriptVariableValue
	ldrsh r2, [r5]
	sub r1, r2, #0xa
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _020652D0
	cmp r2, #0xa
	bne _02065204
	cmp r4, #0
	moveq r4, r0
	b _02065210
_02065204:
	cmp r4, #0
	moveq r0, #0
	mov r4, r0
_02065210:
	cmp r4, #0xa
	addls pc, pc, r4, lsl #2
	b _020652C4
_0206521C: ; jump table
	b _020652C4 ; case 0
	b _02065248 ; case 1
	b _02065254 ; case 2
	b _020652C4 ; case 3
	b _02065260 ; case 4
	b _020652AC ; case 5
	b _020652AC ; case 6
	b _020652AC ; case 7
	b _020652AC ; case 8
	b _020652AC ; case 9
	b _020652B8 ; case 10
_02065248:
	mov r0, #0xc
	strh r0, [r5]
	b _020652D0
_02065254:
	mov r0, #0xd
	strh r0, [r5]
	b _020652D0
_02065260:
	bl GetAppointedLeaderMemberIdx
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0xc
	streqh r0, [r5]
	beq _020652D0
	bl GetMainCharacter1MemberIdx
	cmp r4, r0
	moveq r0, #0xc
	streqh r0, [r5]
	beq _020652D0
	bl GetMainCharacter2MemberIdx
	cmp r4, r0
	moveq r0, #0xd
	streqh r0, [r5]
	movne r0, #0xf
	strneh r0, [r5]
	b _020652D0
_020652AC:
	add r0, r4, #0xb
	strh r0, [r5]
	b _020652D0
_020652B8:
	mov r0, #0x15
	strh r0, [r5]
	b _020652D0
_020652C4:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_020652D0:
	ldrsh r0, [r5]
	sub r0, r0, #0xc
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02065324
_020652E4: ; jump table
	b _0206530C ; case 0
	b _02065314 ; case 1
	b _02065324 ; case 2
	b _0206531C ; case 3
	b _02065324 ; case 4
	b _02065324 ; case 5
	b _02065324 ; case 6
	b _02065324 ; case 7
	b _02065324 ; case 8
	b _0206531C ; case 9
_0206530C:
	mov r4, #2
	b _02065488
_02065314:
	mov r4, #1
	b _02065488
_0206531C:
	mov r4, #2
	b _02065488
_02065324:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_02065330:
	cmp r0, #3
	bne _02065420
	cmp r2, #0x16
	blt _020653A8
	cmp r2, #0x19
	bgt _020653A8
	mov r0, #0xd
	sub r4, r2, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0206536C
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _0206548C
_0206536C:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065390
	ldrsh r0, [r5]
	cmp r0, #0x17
	bgt _02065414
	mvn r0, #0
	b _0206548C
_02065390:
	add r0, sp, #8
	bl GetUnitNpcIds
	cmp r4, r0
	bge _02065414
	mvn r0, #0
	b _0206548C
_020653A8:
	cmp r2, #0x1a
	blt _02065414
	cmp r2, #0x1d
	bgt _02065414
	mov r0, #0xd
	sub r4, r2, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _020653DC
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _0206548C
_020653DC:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065400
	ldrsh r0, [r5]
	cmp r0, #0x1c
	bgt _02065414
	mvn r0, #0
	b _0206548C
_02065400:
	add r0, sp, #0
	bl GetAdventureNpcIds
	cmp r4, r0
	mvnlt r0, #0
	blt _0206548C
_02065414:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_02065420:
	bl GetAppointedLeaderMemberIdx
	ldrsh r1, [r5]
	mov r6, r0
	cmp r1, #0x3f
	bne _02065488
	mvn r1, #0
	cmp r6, r1
	moveq r0, #0x3c
	streqh r0, [r5]
	beq _02065488
	bl sub_02055410
	cmp r0, #0
	movne r0, #0x3c
	strneh r0, [r5]
	bne _02065488
	mov r0, r6
	bl sub_02055474
	cmp r0, #0
	movne r0, #0x3d
	strneh r0, [r5]
	bne _02065488
	mov r0, r6
	bl sub_020554D8
	cmp r0, #0
	movne r0, #0x3e
	strneh r0, [r5]
_02065488:
	mov r0, r4
_0206548C:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02065494: .word SPECIAL_ACTORS
_02065498: .word ENTITIES
	arm_func_end sub_02065050

	arm_func_start sub_0206549C
sub_0206549C: ; 0x0206549C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r1
	bl sub_02065050
	mov r4, r0
	mov r0, #0
	strh r0, [r5]
	ldrsh lr, [r6]
	sub r1, r0, #1
	cmp lr, r1
	subeq r0, r0, #1
	beq _0206595C
	mov r1, #0xc
	smulbb r3, lr, r1
	ldr ip, _02065964 ; =ENTITIES
	ldrsh r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #3
	bne _020656B4
	cmp lr, #0x16
	blt _020655BC
	cmp lr, #0x19
	bgt _020655BC
	mov r0, #0xd
	sub r4, lr, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065540
	bl ov11_022E96E4
	cmp r0, #0
	beq _02065540
	ldr r0, _02065968 ; =ARM9_UNKNOWN_TABLE__NA_20A68BC
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065540:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065580
	ldrsh r0, [r6]
	cmp r0, #0x16
	moveq r0, #0x5f
	streqh r0, [r5]
	subeq r0, r0, #0x60
	beq _0206595C
	cmp r0, #0x17
	bne _020656A8
	mov r0, #0x22
	strh r0, [r5]
	sub r0, r0, #0x23
	b _0206595C
_02065580:
	add r0, sp, #8
	bl GetUnitNpcIds
	cmp r4, r0
	bge _020656A8
	ldr r0, _0206596C ; =TEAM_MEMBER_TABLE_PTR
	add r1, sp, #8
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	ldr r3, [r0]
	mov r1, #0x44
	sub r0, r1, #0x45
	smlabb r1, r2, r1, r3
	ldrsh r1, [r1, #4]
	strh r1, [r5]
	b _0206595C
_020655BC:
	cmp lr, #0x1a
	blt _020656A8
	cmp lr, #0x1d
	bgt _020656A8
	mov r0, #0xd
	sub r4, lr, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065610
	bl ov11_022E96E4
	cmp r0, #0
	beq _02065610
	ldr r0, _02065968 ; =ARM9_UNKNOWN_TABLE__NA_20A68BC
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065610:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _0206566C
	ldrsh r0, [r6]
	cmp r0, #0x1a
	bne _02065640
	bl GetPartner
	ldrsh r1, [r0, #4]
	mvn r0, #0
	strh r1, [r5]
	b _0206595C
_02065640:
	cmp r0, #0x1b
	moveq r0, #0x5f
	streqh r0, [r5]
	subeq r0, r0, #0x60
	beq _0206595C
	cmp r0, #0x1c
	bne _020656A8
	mov r0, #0x22
	strh r0, [r5]
	sub r0, r0, #0x23
	b _0206595C
_0206566C:
	add r0, sp, #0
	bl GetAdventureNpcIds
	cmp r4, r0
	bge _020656A8
	ldr r0, _0206596C ; =TEAM_MEMBER_TABLE_PTR
	add r1, sp, #0
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	ldr r3, [r0]
	mov r1, #0x44
	sub r0, r1, #0x45
	smlabb r1, r2, r1, r3
	ldrsh r1, [r1, #4]
	strh r1, [r5]
	b _0206595C
_020656A8:
	mvn r0, #0
	strh r0, [r6]
	b _0206595C
_020656B4:
	cmp lr, #0x35
	bgt _02065734
	bge _020658A0
	cmp lr, #0x32
	bgt _02065718
	bge _02065860
	cmp lr, #0xf
	addls pc, pc, lr, lsl #2
	b _02065948
_020656D8: ; jump table
	b _02065948 ; case 0
	b _02065798 ; case 1
	b _020657A8 ; case 2
	b _020657B8 ; case 3
	b _020657C8 ; case 4
	b _02065948 ; case 5
	b _02065948 ; case 6
	b _02065948 ; case 7
	b _02065948 ; case 8
	b _02065948 ; case 9
	b _02065948 ; case 10
	b _02065948 ; case 11
	b _02065798 ; case 12
	b _020657A8 ; case 13
	b _020657B8 ; case 14
	b _020657C8 ; case 15
_02065718:
	cmp lr, #0x33
	bgt _02065728
	beq _02065880
	b _02065948
_02065728:
	cmp lr, #0x34
	beq _02065920
	b _02065948
_02065734:
	cmp lr, #0x37
	bgt _0206574C
	bge _020658E0
	cmp lr, #0x36
	beq _020658C0
	b _02065948
_0206574C:
	cmp lr, #0x38
	bgt _0206575C
	beq _02065900
	b _02065948
_0206575C:
	sub r2, lr, #0x39
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _02065948
_0206576C: ; jump table
	b _02065840 ; case 0
	b _02065818 ; case 1
	b _0206582C ; case 2
	b _02065798 ; case 3
	b _020657A8 ; case 4
	b _020657B8 ; case 5
	b _020657C8 ; case 6
	b _020657D8 ; case 7
	b _020657E8 ; case 8
	b _020657F8 ; case 9
	b _02065808 ; case 10
_02065798:
	bl GetMainCharacter1
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657A8:
	bl GetMainCharacter2
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657B8:
	bl GetMainCharacter3
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657C8:
	bl sub_02056914
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657D8:
	bl GetHero
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657E8:
	bl GetPartner
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657F8:
	mov r1, #0x3e
	bl LoadScriptVariableValue
	strh r0, [r5]
	b _02065958
_02065808:
	mov r1, #0x40
	bl LoadScriptVariableValue
	strh r0, [r5]
	b _02065958
_02065818:
	ldr r2, _02065970 ; =SPECIAL_ACTORS
	sub r0, r1, #0xd
	ldrsh r1, [r2, #0xa]
	strh r1, [r5]
	b _0206595C
_0206582C:
	ldr r2, _02065970 ; =SPECIAL_ACTORS
	sub r0, r1, #0xd
	ldrsh r1, [r2, #4]
	strh r1, [r5]
	b _0206595C
_02065840:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0xc]
	cmp r0, #0
	strneh r0, [r5]
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065860:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0x10]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065880:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0xe]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658A0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #2]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658C0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658E0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #8]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065900:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #6]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065920:
	mov r0, #0
	mov r1, #0x44
	bl LoadScriptVariableValue
	strh r0, [r5]
	ldrsh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065948:
	ldrsh r0, [r5]
	cmp r0, #0
	ldreqsh r0, [r3, #2]
	streqh r0, [r5]
_02065958:
	mov r0, r4
_0206595C:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02065964: .word ENTITIES
_02065968: .word ARM9_UNKNOWN_TABLE__NA_20A68BC
_0206596C: .word TEAM_MEMBER_TABLE_PTR
_02065970: .word SPECIAL_ACTORS
	arm_func_end sub_0206549C

	arm_func_start GetScriptEntityMonsterId
GetScriptEntityMonsterId: ; 0x02065974
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end GetScriptEntityMonsterId

	arm_func_start GetActorMatchingStorageId
GetActorMatchingStorageId: ; 0x02065998
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r0, sp, #0x18
	bl sub_02065050
	ldrsh r1, [sp, #0x18]
	cmp r1, #1
	cmpne r1, #0xc
	cmpne r1, #0x3c
	bne _020659C8
	bl GetMainCharacter1MemberIdx
	b _02065B04
_020659C8:
	cmp r1, #2
	cmpne r1, #0xd
	cmpne r1, #0x3d
	bne _020659E0
	bl GetMainCharacter2MemberIdx
	b _02065B04
_020659E0:
	cmp r1, #3
	cmpne r1, #0xe
	cmpne r1, #0x3e
	bne _020659F8
	bl GetMainCharacter3MemberIdx
	b _02065B04
_020659F8:
	cmp r1, #4
	cmpne r1, #0xf
	cmpne r1, #0x3f
	bne _02065A10
	bl GetAppointedLeaderMemberIdx
	b _02065B04
_02065A10:
	cmp r1, #0x40
	bne _02065A20
	bl GetHeroMemberIdx
	b _02065B04
_02065A20:
	cmp r1, #0x41
	bne _02065A30
	bl GetPartnerMemberIdx
	b _02065B04
_02065A30:
	cmp r1, #0x16
	blt _02065A84
	cmp r1, #0x19
	bgt _02065A84
	mov r0, #0xd
	sub r4, r1, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065A64
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065A64:
	add r0, sp, #8
	bl GetUnitNpcIds
	cmp r4, r0
	bge _02065B00
	add r0, sp, #8
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065A84:
	cmp r1, #0x1a
	blt _02065AD8
	cmp r1, #0x1d
	bgt _02065AD8
	mov r0, #0xd
	sub r4, r1, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065AB8
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065AB8:
	add r0, sp, #0
	bl GetAdventureNpcIds
	cmp r4, r0
	bge _02065B00
	add r0, sp, #0
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065AD8:
	cmp r1, #0x1e
	blt _02065AE8
	cmp r1, #0x2d
	ble _02065B00
_02065AE8:
	cmp r1, #0x99
	bne _02065B00
	mov r0, #0x214
	mov r1, #0
	bl GetRecruitMentryIdBySpecies
	b _02065B04
_02065B00:
	mvn r0, #0
_02065B04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end GetActorMatchingStorageId

	arm_func_start sub_02065B14
sub_02065B14: ; 0x02065B14
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r2, _02065B38 ; =ENTITIES
	mov r1, #0xc
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #8]
	bx lr
	.align 2, 0
_02065B38: .word ENTITIES
	arm_func_end sub_02065B14
