	.include "asm/macros.inc"
	.include "overlay_29_0234921C.inc"

	.text

	arm_func_start IsCurrentMissionType
IsCurrentMissionType: ; 0x0234921C
	ldr r1, _0234924C ; =DUNGEON_PTR
	ldr r2, [r1]
	ldrb r1, [r2, #0x760]
	cmp r1, #0
	beq _0234923C
	ldrb r1, [r2, #0x761]
	cmp r1, r0
	beq _02349244
_0234923C:
	mov r0, #0
	bx lr
_02349244:
	mov r0, #1
	bx lr
	.align 2, 0
_0234924C: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionType

	arm_func_start IsCurrentMissionTypeExact
IsCurrentMissionTypeExact: ; 0x02349250
	ldr r2, _02349288 ; =DUNGEON_PTR
	ldr r3, [r2]
	ldrb r2, [r3, #0x760]
	cmp r2, #0
	beq _02349278
	ldrb r2, [r3, #0x761]
	cmp r2, r0
	ldreqb r0, [r3, #0x762]
	cmpeq r0, r1
	beq _02349280
_02349278:
	mov r0, #0
	bx lr
_02349280:
	mov r0, #1
	bx lr
	.align 2, 0
_02349288: .word DUNGEON_PTR
	arm_func_end IsCurrentMissionTypeExact

	arm_func_start IsOutlawMonsterHouseFloor
IsOutlawMonsterHouseFloor: ; 0x0234928C
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	mov r1, #7
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsOutlawMonsterHouseFloor

	arm_func_start IsGoldenChamber
IsGoldenChamber: ; 0x023492B0
	stmdb sp!, {r3, lr}
	mov r0, #3
	mov r1, #2
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsGoldenChamber

	arm_func_start IsLegendaryChallengeFloor
IsLegendaryChallengeFloor: ; 0x023492D4
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349308
	ldr r0, _02349310 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x762]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	ldmlsia sp!, {r3, pc}
_02349308:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349310: .word DUNGEON_PTR
	arm_func_end IsLegendaryChallengeFloor

	arm_func_start IsJirachiChallengeFloor
IsJirachiChallengeFloor: ; 0x02349314
	stmdb sp!, {r3, lr}
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349340
	ldr r0, _02349348 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x762]
	cmp r0, #5
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_02349340:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349348: .word DUNGEON_PTR
	arm_func_end IsJirachiChallengeFloor

	arm_func_start IsDestinationFloorWithMonster
IsDestinationFloorWithMonster: ; 0x0234934C
	stmdb sp!, {r3, lr}
	ldr r0, _02349374 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x760
	bl FloorHasMissionMonster
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_02349374: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithMonster

	arm_func_start ov29_02349378
ov29_02349378: ; 0x02349378
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _023493F4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	mov r4, #0
	mov r5, r4
	cmp r0, #0
	beq _023493E0
	bl GetSpriteFileSize
	add r4, r4, r0
	b _023493E0
_023493BC:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _023493D4
	bl GetSpriteFileSize
	add r4, r4, r0
_023493D4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_023493E0:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _023493BC
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023493F4: .word DUNGEON_PTR
	arm_func_end ov29_02349378

	arm_func_start LoadMissionMonsterSprites
LoadMissionMonsterSprites: ; 0x023493F8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0234946C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r6, r0, #0x760
	mov r0, r6
	bl FloorHasMissionMonster
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0xc]
	cmp r0, #0
	beq _0234942C
	mov r1, #1
	bl LoadMonsterSprite
_0234942C:
	mov r5, #0
	mov r4, #1
	b _0234945C
_02349438:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xe]
	cmp r0, #0
	beq _02349450
	mov r1, r4
	bl LoadMonsterSprite
_02349450:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_0234945C:
	ldrsh r0, [r6, #0x14]
	cmp r5, r0
	blt _02349438
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234946C: .word DUNGEON_PTR
	arm_func_end LoadMissionMonsterSprites

	arm_func_start MissionTargetEnemyIsDefeated
MissionTargetEnemyIsDefeated: ; 0x02349470
	ldr r0, _0234948C ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldrneb r0, [r1, #0x77b]
	moveq r0, #0
	bx lr
	.align 2, 0
_0234948C: .word DUNGEON_PTR
	arm_func_end MissionTargetEnemyIsDefeated

	arm_func_start SetMissionTargetEnemyDefeated
SetMissionTargetEnemyDefeated: ; 0x02349490
	ldr r1, _023494A0 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x77b]
	bx lr
	.align 2, 0
_023494A0: .word DUNGEON_PTR
	arm_func_end SetMissionTargetEnemyDefeated

	arm_func_start IsDestinationFloorWithFixedRoom
IsDestinationFloorWithFixedRoom: ; 0x023494A4
	ldr r0, _023494C8 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	cmp r0, #0
	ldrneb r0, [r1, #0x776]
	cmpne r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_023494C8: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithFixedRoom

	arm_func_start GetItemToRetrieve
GetItemToRetrieve: ; 0x023494CC
	ldr r0, _023494EC ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r1, r1, #0x760
	cmp r0, #0
	ldrnesh r0, [r1, #4]
	moveq r0, #0
	bx lr
	.align 2, 0
_023494EC: .word DUNGEON_PTR
	arm_func_end GetItemToRetrieve

	arm_func_start GetItemToDeliver
GetItemToDeliver: ; 0x023494F0
	stmdb sp!, {r4, lr}
	ldr r1, _02349518 ; =DUNGEON_PTR
	mov r0, #7
	ldr r1, [r1]
	add r4, r1, #0x760
	bl IsCurrentMissionType
	cmp r0, #0
	ldrnesh r0, [r4, #6]
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349518: .word DUNGEON_PTR
	arm_func_end GetItemToDeliver

	arm_func_start GetSpecialTargetItem
GetSpecialTargetItem: ; 0x0234951C
	stmdb sp!, {r4, lr}
	ldr r1, _02349560 ; =DUNGEON_PTR
	mov r0, #3
	ldr r2, [r1]
	mov r1, #1
	add r4, r2, #0x760
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349550
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	beq _02349558
_02349550:
	ldrsh r0, [r4, #8]
	ldmia sp!, {r4, pc}
_02349558:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02349560: .word DUNGEON_PTR
	arm_func_end GetSpecialTargetItem

	arm_func_start IsDestinationFloorWithItem
IsDestinationFloorWithItem: ; 0x02349564
	stmdb sp!, {r4, lr}
	ldr r0, _023495C0 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x760]
	add r4, r1, #0x760
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	mov r0, #7
	bl IsCurrentMissionType
	cmp r0, #0
	bne _023495B0
	ldrsh r0, [r4, #4]
	cmp r0, #0
	bne _023495B8
_023495B0:
	mov r0, #0
	ldmia sp!, {r4, pc}
_023495B8:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_023495C0: .word DUNGEON_PTR
	arm_func_end IsDestinationFloorWithItem

	arm_func_start IsDestinationFloorWithHiddenOutlaw
IsDestinationFloorWithHiddenOutlaw: ; 0x023495C4
	stmdb sp!, {r3, lr}
	mov r0, #9
	mov r1, #1
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsDestinationFloorWithHiddenOutlaw

	arm_func_start IsDestinationFloorWithFleeingOutlaw
IsDestinationFloorWithFleeingOutlaw: ; 0x023495E8
	stmdb sp!, {r3, lr}
	mov r0, #0xa
	mov r1, #5
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _02349618
	mov r0, #9
	mov r1, #2
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_02349618:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end IsDestinationFloorWithFleeingOutlaw

	arm_func_start GetMissionTargetEnemy
GetMissionTargetEnemy: ; 0x02349620
	ldr r0, _02349634 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bx lr
	.align 2, 0
_02349634: .word DUNGEON_PTR
	arm_func_end GetMissionTargetEnemy

	arm_func_start GetMissionEnemyMinionGroup
GetMissionEnemyMinionGroup: ; 0x02349638
	ldr r1, _02349654 ; =DUNGEON_PTR
	add r0, r0, #1
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x6e]
	bx lr
	.align 2, 0
_02349654: .word DUNGEON_PTR
	arm_func_end GetMissionEnemyMinionGroup

	arm_func_start ov29_02349658
ov29_02349658: ; 0x02349658
	ldr r0, _02349684 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1]
	ldr r1, [r0]
	strb r2, [r1, #1]
	ldr r1, [r0]
	strb r2, [r1, #2]
	ldr r0, [r0]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_02349684: .word DUNGEON_PTR
	arm_func_end ov29_02349658

	arm_func_start ov29_02349688
ov29_02349688: ; 0x02349688
	ldr r1, _02349698 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02349698: .word DUNGEON_PTR
	arm_func_end ov29_02349688

	arm_func_start ov29_0234969C
ov29_0234969C: ; 0x0234969C
	ldr r1, _023496AC ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_023496AC: .word DUNGEON_PTR
	arm_func_end ov29_0234969C

	arm_func_start ov29_023496B0
ov29_023496B0: ; 0x023496B0
	ldr r0, _023496C0 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_023496C0: .word DUNGEON_PTR
	arm_func_end ov29_023496B0

	arm_func_start SetTargetMonsterNotFoundFlag
SetTargetMonsterNotFoundFlag: ; 0x023496C4
	ldr r1, _023496D4 ; =DUNGEON_PTR
	ldr r1, [r1]
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_023496D4: .word DUNGEON_PTR
	arm_func_end SetTargetMonsterNotFoundFlag

	arm_func_start GetTargetMonsterNotFoundFlag
GetTargetMonsterNotFoundFlag: ; 0x023496D8
	ldr r0, _023496E8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_023496E8: .word DUNGEON_PTR
	arm_func_end GetTargetMonsterNotFoundFlag

	arm_func_start ClearMissionDestinationInfo
ClearMissionDestinationInfo: ; 0x023496EC
	mov ip, #0
	strb ip, [r0]
	strb ip, [r0, #0x18]
	strb ip, [r0, #0x17]
	strb ip, [r0, #0x1a]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	strb ip, [r0, #0x16]
	strh ip, [r0, #0xa]
	strb ip, [r0, #0x1b]
	strb ip, [r0, #0x1c]
	strh ip, [r0, #0xc]
	mov r3, ip
_02349724:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	add r2, r0, ip, lsl #1
	mov ip, r1, asr #0x10
	strh r3, [r2, #0xe]
	cmp ip, #3
	blt _02349724
	strh r3, [r0, #0x14]
	bx lr
	arm_func_end ClearMissionDestinationInfo

	arm_func_start FloorHasMissionMonster
FloorHasMissionMonster: ; 0x02349748
	ldrb r1, [r0]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrb r0, [r0, #1]
	cmp r0, #7
	cmpne r0, #0
	cmpne r0, #2
	cmpne r0, #1
	beq _02349780
	add r0, r0, #0xf8
	and r0, r0, #0xff
	cmp r0, #3
	bhi _02349788
_02349780:
	mov r0, #1
	bx lr
_02349788:
	mov r0, #0
	bx lr
	arm_func_end FloorHasMissionMonster

#ifndef JAPAN
	arm_func_start GetMissionIfActiveOnFloor
GetMissionIfActiveOnFloor: ; 0x02349790
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	ldreqb r2, [r4]
	ldreqb r1, [r0, #4]
	cmpeq r2, r1
	ldreqb r2, [r4, #1]
	ldreqb r1, [r0, #5]
	cmpeq r2, r1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetMissionIfActiveOnFloor
#endif

	arm_func_start ov29_023497C8
ov29_023497C8: ; 0x023497C8
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r4, ip
	b _02349804
_023497D8:
	mov r3, r4, lsl #1
	ldrsh lr, [r1, r3]
	cmp lr, #0
	addne r3, ip, #1
	addne ip, r0, ip, lsl #1
	movne r3, r3, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r3, asr #0x10
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_02349804:
	cmp r4, #2
	cmplt ip, r2
	blt _023497D8
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_023497C8

	arm_func_start ov29_02349818
ov29_02349818: ; 0x02349818
	stmdb sp!, {r4, lr}
	mov r4, #0
	add ip, r4, #1
	mov ip, ip, lsl #0x10
	strh r1, [r0, #0xe]
	cmp r2, #0
	mov ip, ip, asr #0x10
	beq _02349874
	b _02349868
_0234983C:
	mov r1, r4, lsl #1
	ldrsh lr, [r2, r1]
	cmp lr, #0
	addne r1, ip, #1
	addne ip, r0, ip, lsl #1
	movne r1, r1, lsl #0x10
	strneh lr, [ip, #0xe]
	movne ip, r1, asr #0x10
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
_02349868:
	cmp r4, #2
	cmplt ip, r3
	blt _0234983C
_02349874:
	strh ip, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02349818
