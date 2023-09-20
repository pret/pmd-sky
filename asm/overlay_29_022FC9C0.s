	.include "asm/macros.inc"
	.include "overlay_29_022FC9C0.inc"

	.text

	arm_func_start ov29_022FC9C0
ov29_022FC9C0: ; 0x022FC9C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r0, #0
	bl DungeonRngSetSecondary
	mov sl, #0
	mov r8, #1
	mov sb, sl
	mov r7, sl
	mov r5, sl
	mov r6, r8
	ldr r4, _022FCCF0 ; =0x000055AA
	b _022FCA44
_022FC9F0:
	mov r0, sb
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r2, r8
	moveq r2, r7
	tst r2, #0xff
	beq _022FCA38
	tst r1, #2
	movne r1, r6
	moveq r1, r5
	tst r1, #0xff
	beq _022FCA38
	ldrsh r1, [r0, #8]
	cmp r1, r4
	streq r0, [sp, #0x18]
	addeq sl, sl, #1
	beq _022FCA4C
_022FCA38:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_022FCA44:
	cmp sb, #4
	blt _022FC9F0
_022FCA4C:
	mov r1, #0
	add r0, sp, #0x18
	b _022FCA60
_022FCA58:
	str r1, [r0, sl, lsl #2]
	add sl, sl, #1
_022FCA60:
	cmp sl, #4
	blt _022FCA58
	ldr r0, _022FCCF4 ; =ov29_0235355C
	mov r1, #0
	str r1, [r0]
	bl GetLeader
	mov r4, r0
	bl EntityIsValid__022FC99C
	cmp r0, #0
	ldreq r0, _022FCCF8 ; =ov29_02353538
	ldrnesh sb, [r4, #4]
	ldreq r0, [r0]
	ldrnesh r8, [r4, #6]
	addeq r0, r0, #0xcc00
	ldreqsh sb, [r0, #0xe0]
	ldreqsh r8, [r0, #0xe2]
	mov r0, sb
	mov r1, r8
	bl GetTile
	ldrb r4, [r0, #7]
	mov sl, #0
_022FCAB4:
	add r0, sp, #0x18
	ldr r6, [r0, sl, lsl #2]
	mov r7, #0
	cmp r6, #0
	beq _022FCCD0
	ldrb r0, [r6]
	tst r0, #1
	movne r1, #1
	moveq r1, r7
	tst r1, #0xff
	beq _022FCCD0
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022FCCD0
	ldrsh r1, [r6, #8]
	ldr r0, _022FCCF0 ; =0x000055AA
	cmp r1, r0
	bne _022FCCD0
	ldr r0, _022FCCFC ; =0x00005AA5
	ldr fp, _022FCD00 ; =ov29_02351E28
	mov r5, #0
	strh r0, [r6, #8]
_022FCB14:
	mov r0, r5, lsl #2
	ldrh r0, [fp, r0]
	add r1, fp, r5, lsl #2
	ldrh r1, [r1, #2]
	strh r0, [sp, #0x14]
	ldrsh r0, [sp, #0x14]
	strh r1, [sp, #0x16]
	cmp r0, #0x63
	beq _022FCBAC
	ldrsh r1, [sp, #0x16]
	add r0, r0, sb
	add r1, r1, r8
	bl GetTile
	mov r1, r0
	ldrb r0, [r1, #7]
	cmp r0, r4
	bne _022FCBA4
	ldrsh r0, [r6, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FCBA4
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	stmib sp, {r0, r1}
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrsh r1, [sp, #0x14]
	ldrsh r2, [sp, #0x16]
	ldrsh r0, [r6, #0xc]
	mov r3, r6
	add r1, r1, sb
	add r2, r2, r8
	bl InitTeamMember
	mov r7, #1
	b _022FCBAC
_022FCBA4:
	add r5, r5, #1
	b _022FCB14
_022FCBAC:
	cmp r7, #0
	bne _022FCC48
	ldr fp, _022FCD00 ; =ov29_02351E28
	mov r5, #0
_022FCBBC:
	mov r0, r5, lsl #2
	ldrh r0, [fp, r0]
	add r1, fp, r5, lsl #2
	ldrh r1, [r1, #2]
	strh r0, [sp, #0x14]
	ldrsh r0, [sp, #0x14]
	strh r1, [sp, #0x16]
	cmp r0, #0x63
	beq _022FCC48
	ldrsh r1, [sp, #0x16]
	add r0, r0, sb
	add r1, r1, r8
	bl GetTile
	mov r1, r0
	ldrsh r0, [r6, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FCC40
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	stmib sp, {r0, r1}
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrsh r1, [sp, #0x14]
	ldrsh r2, [sp, #0x16]
	ldrsh r0, [r6, #0xc]
	mov r3, r6
	add r1, r1, sb
	add r2, r2, r8
	bl InitTeamMember
	mov r7, #1
	b _022FCC48
_022FCC40:
	add r5, r5, #1
	b _022FCBBC
_022FCC48:
	cmp r7, #0
	bne _022FCCD0
	mov r7, #0
	add r5, sp, #0x14
	mov fp, r7
	b _022FCCC8
_022FCC60:
	mov r0, r5
	mov r1, fp
	bl ov29_022E9628
	cmp r0, #0
	beq _022FCCC4
	ldrsh r0, [sp, #0x14]
	ldrsh r1, [sp, #0x16]
	bl GetTile
	mov r1, r0
	ldrsh r0, [r6, #0xc]
	bl IsInvalidSpawnTile
	cmp r0, #0
	bne _022FCCC4
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	stmib sp, {r0, r1}
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrsh r0, [r6, #0xc]
	ldrsh r1, [sp, #0x14]
	ldrsh r2, [sp, #0x16]
	mov r3, r6
	bl InitTeamMember
	b _022FCCD0
_022FCCC4:
	add r7, r7, #1
_022FCCC8:
	cmp r7, #0x64
	blt _022FCC60
_022FCCD0:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
	cmp sl, #4
	blt _022FCAB4
	bl DungeonRngSetPrimary
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FCCF0: .word 0x000055AA
_022FCCF4: .word ov29_0235355C
_022FCCF8: .word ov29_02353538
_022FCCFC: .word 0x00005AA5
_022FCD00: .word ov29_02351E28
	arm_func_end ov29_022FC9C0

	arm_func_start ov29_022FCD04
ov29_022FCD04: ; 0x022FCD04
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _022FCD70 ; =ov29_02353538
	b _022FCD64
_022FCD14:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, r6
	bl EntityIsValid__022FC99C
	cmp r0, #0
	ldrne r0, [r6, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	beq _022FCD60
	mov r0, r6
	bl ov29_022E2DFC
	ldrh r1, [r6, #4]
	ldr r0, _022FCD74 ; =ov29_0237C690
	strh r1, [r0]
	ldrh r1, [r6, #6]
	strh r1, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
_022FCD60:
	add r5, r5, #1
_022FCD64:
	cmp r5, #4
	blt _022FCD14
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022FCD70: .word ov29_02353538
_022FCD74: .word ov29_0237C690
	arm_func_end ov29_022FCD04

	arm_func_start SpawnInitialMonsters
SpawnInitialMonsters: ; 0x022FCD78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	add r0, sp, #0x24
	mov r1, #0xe
	bl MemZero
	mov r0, #0
	strb r0, [sp, #0x2c]
	mov r7, #1
	bl IsDestinationFloorWithFixedRoom
	cmp r0, #0
	bne _022FCE00
	bl IsDestinationFloorWithMonster
	cmp r0, #0
	beq _022FCE00
	mov r0, #0xa
	bl IsCurrentMissionType
	cmp r0, #0
	bne _022FCDD0
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022FCDDC
_022FCDD0:
	add r0, sp, #0x24
	bl GetOutlawSpawnData
	b _022FCE34
_022FCDDC:
	bl GetMissionDestination
	ldrsh r2, [r0, #0xc]
	mov r0, r7
	mov r1, #7
	strh r2, [sp, #0x24]
	strb r1, [sp, #0x26]
	strh r0, [sp, #0x28]
	strb r0, [sp, #0x2a]
	b _022FCE34
_022FCE00:
	ldr r0, _022FD080 ; =ov29_02353538
	ldr r2, [r0]
	add r0, r2, #0x700
	ldrsh r0, [r0, #0xa8]
	cmp r0, #0
	moveq r7, #0
	beq _022FCE34
	mov r1, #0
	strb r1, [sp, #0x26]
	strh r0, [sp, #0x24]
	ldrb r0, [r2, #0x7aa]
	strh r0, [sp, #0x28]
	strb r1, [sp, #0x2a]
_022FCE34:
	ldr r0, _022FD080 ; =ov29_02353538
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x38
	add r1, r1, #0x3000
	strb r2, [r1, #0xe39]
	bl DungeonRandInt
	mov r6, r0
	mov r0, #0x20
	bl DungeonRandInt
	mov sl, r0
	mov r0, #0
	bl DungeonRngSetSecondary
	bl ov29_022FBF08
	mov sb, #0
	mov fp, sb
_022FCE74:
	add sl, sl, #1
	cmp sl, #0x20
	moveq sl, #0
	mov r0, sl, lsl #0x10
	mov r5, #0
	mov r4, r0, asr #0x10
_022FCE8C:
	add r6, r6, #1
	cmp r6, #0x38
	moveq r6, #0
	mov r0, r6
	mov r1, sl
	bl GetTile
	ldrh r0, [r0, #2]
	tst r0, #8
	beq _022FCF48
	cmp sb, #0
	mov r8, #0
	add sb, sb, #1
	bne _022FCED0
	cmp r7, #0
	beq _022FCF48
	mov r8, #1
	b _022FCEE8
_022FCED0:
	mov r0, r8
	bl GetMonsterIdToSpawn
	strh r0, [sp, #0x14]
	mov r0, r8
	strh r0, [sp, #0x1c]
	strb r0, [sp, #0x16]
_022FCEE8:
	mov r0, #0
	str r0, [sp, #0x18]
	strb r0, [sp, #0x22]
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r8, #0
	strh r4, [sp, #0x20]
	strh r0, [sp, #0x1e]
	cmpne r7, #0
	beq _022FCF28
	strh r0, [sp, #0x2e]
	mov r0, #1
	strb r0, [sp, #0x2c]
	strh r4, [sp, #0x30]
	mov r7, #0
	b _022FCF48
_022FCF28:
	ldrsh r0, [sp, #0x14]
	mov r1, #1
	bl MewSpawnCheck
	cmp r0, #0
	beq _022FCF48
	add r0, sp, #0x14
	mov r1, #0
	bl SpawnMonster
_022FCF48:
	add r5, r5, #1
	cmp r5, #0x38
	blt _022FCE8C
	add fp, fp, #1
	cmp fp, #0x20
	blt _022FCE74
	bl DungeonRngSetPrimary
	mov r0, #0
	bl DungeonRngSetSecondary
	ldrb r0, [sp, #0x2c]
	cmp r0, #0
	beq _022FD060
	ldrsh r3, [sp, #0x24]
	ldrb r2, [sp, #0x26]
	ldrsh r1, [sp, #0x28]
	ldrb r0, [sp, #0x2b]
	strh r3, [sp, #4]
	strb r2, [sp, #6]
	strh r1, [sp, #0xc]
	cmp r0, #0
	beq _022FD020
	bl IsOutlawMonsterHouseFloor
	cmp r0, #0
	bne _022FCFB4
	bl IsDestinationFloorWithFleeingOutlaw
	cmp r0, #0
	beq _022FCFEC
_022FCFB4:
	ldr r1, _022FD080 ; =ov29_02353538
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0xce0
	add r1, r1, #0xc000
	bl FindFarthestUnoccupiedTileWithin2
	cmp r0, #0
	ldrnesh r1, [sp]
	ldrnesh r0, [sp, #2]
	moveq r7, #1
	strneh r1, [sp, #0x2e]
	strneh r0, [sp, #0x30]
	b _022FD020
_022FCFEC:
	ldr r1, _022FD080 ; =ov29_02353538
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0xce0
	add r1, r1, #0xc000
	bl FindClosestUnoccupiedTileWithin2
	cmp r0, #0
	ldrnesh r1, [sp]
	ldrnesh r0, [sp, #2]
	moveq r7, #1
	strneh r1, [sp, #0x2e]
	strneh r0, [sp, #0x30]
_022FD020:
	cmp r7, #0
	bne _022FD060
	ldrsh r3, [sp, #0x2e]
	ldrsh r2, [sp, #0x30]
	mov r1, #0
	add r0, sp, #4
	str r1, [sp, #8]
	strb r1, [sp, #0x12]
	strh r3, [sp, #0xe]
	strh r2, [sp, #0x10]
	bl SpawnMonster
	cmp r0, #0
	bne _022FD060
	ldrb r0, [sp, #0x2a]
	cmp r0, #0
	movne r7, #1
_022FD060:
	cmp r7, #0
	beq _022FD070
	mov r0, #1
	bl SetTargetMonsterNotFoundFlag
_022FD070:
	bl ov29_022FBF30
	bl DungeonRngSetPrimary
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FD080: .word ov29_02353538
	arm_func_end SpawnInitialMonsters

	arm_func_start SpawnMonster
SpawnMonster: ; 0x022FD084
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	ldrsh r0, [r7, #0xa]
	ldrsh r1, [r7, #0xc]
	bl GetTile
	mov r1, r0
	ldrsh r0, [r7]
	bl IsInvalidSpawnTile
	cmp r0, #0
	movne r0, #0
	bne _022FD2F8
	ldrsh r0, [r7]
	bl CreateEnemyEntity
	movs r4, r0
	mov r0, #0
	beq _022FD2F8
	ldr r3, _022FD300 ; =ov29_0237C690
	mov r1, r4
	mov r2, r7
	bl InitMonster
	ldr r5, [r4, #0xb4]
	mov r0, #1
	strb r0, [r5, #6]
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, _022FD304 ; =ov29_02353538
	ldr r1, _022FD308 ; =0x0002CB08
	ldr r2, [r0]
	mov r0, r4
	ldrsh r1, [r2, r1]
	strh r1, [r5, #0xe]
	bl ov29_023021F0
	ldrb r0, [r7, #2]
	bl ov29_022EFAE8
	cmp r0, #0
	beq _022FD154
	mov r0, #9
	bl IsCurrentMissionType
	cmp r0, #0
	beq _022FD150
	mov r0, #0x49
	strb r0, [r5, #0x62]
	mov r0, #1
	strh r0, [r5, #0x64]
	bl GetItemToRetrieve
	strh r0, [r5, #0x66]
	mov r0, #0
	strb r0, [r5, #0x63]
	b _022FD154
_022FD150:
	bl IsDestinationFloorWithFleeingOutlaw
_022FD154:
	ldrb ip, [r7, #2]
	add r0, ip, #0xf5
	and r0, r0, #0xff
	cmp r0, #3
	bhi _022FD194
	add r0, r5, #0xe
	str r0, [sp]
	add r0, r5, #0x124
	add r1, r5, #0x12
	add r2, r5, #0x1a
	add r3, r5, #0x1c
	str ip, [sp, #4]
	bl ov29_022FC468
	mov r0, r4
	bl ov29_023021F0
	b _022FD1F0
_022FD194:
	ldrsh r2, [r5, #2]
	add r0, r5, #0x124
	add r1, r5, #0x12
	str r2, [sp]
	ldrb ip, [r5, #0xa]
	add r2, r5, #0x1a
	add r3, r5, #0x1c
	str ip, [sp, #4]
	bl InitEnemyStatsAndMoves
	ldrb r1, [r5, #6]
	cmp r1, #0
	beq _022FD1D0
	ldrb r0, [r7, #2]
	cmp r0, #0xa
	beq _022FD1E8
_022FD1D0:
	cmp r1, #0
	beq _022FD1F0
	ldrb r0, [r7, #2]
	bl IsSecretBazaarNpcBehavior
	cmp r0, #0
	beq _022FD1F0
_022FD1E8:
	mov r0, #1
	strb r0, [r5, #8]
_022FD1F0:
	ldrb r0, [r7, #2]
	bl ov29_022EFAE8
	cmp r0, #0
	beq _022FD224
	ldr r0, _022FD30C ; =ov10_022C45A4
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r0]
	ldr r0, _022FD310 ; =0x000003E7
	add r1, r2, r1
	strh r1, [r5, #0x12]
	ldrsh r1, [r5, #0x12]
	cmp r1, r0
	strgth r0, [r5, #0x12]
_022FD224:
	ldr r0, _022FD304 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0x67
	bne _022FD278
	ldr r1, _022FD314 ; =ov10_022C489C
	add r0, r5, #0x1a
	ldrb r1, [r1]
	bl sub_02054FEC
	ldr r1, _022FD314 ; =ov10_022C489C
	add r0, r5, #0x1b
	ldrb r1, [r1, #1]
	bl sub_02054FEC
	ldr r1, _022FD314 ; =ov10_022C489C
	add r0, r5, #0x1c
	ldrb r1, [r1, #2]
	bl sub_02055020
	ldr r1, _022FD314 ; =ov10_022C489C
	add r0, r5, #0x1d
	ldrb r1, [r1, #3]
	bl sub_02055020
_022FD278:
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _022FD310 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r5, #0x10]
	ldr r1, [r7, #4]
	mov r0, r4
	str r1, [r5, #0x120]
	mov r1, #1
	bl ov29_022FB83C
	ldrb r0, [r7, #2]
	cmp r0, #0
	cmpeq r6, #0
	ldreqb r0, [r7, #0xe]
	cmpeq r0, #0
	bne _022FD2F4
	mov r0, #0x64
	bl DungeonRandInt
	mov r5, r0
	ldrsh r0, [r7]
	bl GetChanceAsleep
	cmp r0, r5
	ble _022FD2F4
	mov r0, r4
	mov r1, #0x7f
	bl InflictSleepStatusSingle
	mov r0, r4
	mov r1, #8
	bl ov29_02304A48
_022FD2F4:
	mov r0, r4
_022FD2F8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FD300: .word ov29_0237C690
_022FD304: .word ov29_02353538
_022FD308: .word 0x0002CB08
_022FD30C: .word ov10_022C45A4
_022FD310: .word 0x000003E7
_022FD314: .word ov10_022C489C
	arm_func_end SpawnMonster

	arm_func_start ov29_022FD318
ov29_022FD318: ; 0x022FD318
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov29_022FBC4C
	cmp r0, #0
	moveq r0, #0
	beq _022FD3AC
	cmp r4, #0
	bne _022FD36C
	mov r0, r6
	mov r1, r5
	bl GetTile
	mov r1, r0
	mov r0, r7
	bl IsInvalidSpawnTile
	cmp r0, #0
	movne r0, #0
	bne _022FD3AC
_022FD36C:
	mov r1, r7
	mov r0, #0
	bl GetMonsterApparentId
	bl DungeonGetSpriteIndex
	mov r4, r0
	mov r0, #1
	bl ov29_022DEA10
	str r0, [sp]
	add r0, sp, #8
	mov r2, r7
	mov r3, r4
	add r1, sp, #4
	bl ov29_022E1C84
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
_022FD3AC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov29_022FD318

	arm_func_start InitTeamMember
InitTeamMember: ; 0x022FD3B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	mov r5, r3
	ldrb r3, [r5, #1]
	mov r7, r0
	ldr r4, [sp, #0x38]
	cmp r3, #0
	movne r0, #1
	moveq r0, #0
	and r6, r0, #0xff
	cmp r4, #0
	movne r0, #0
	strne r0, [r4]
	mov r0, r7
	mov sl, r1
	mov sb, r2
	bl GetBaseForm
	ldr r1, _022FD77C ; =0x000001A2
	cmp r0, r1
	bne _022FD420
	ldrb r0, [sp, #0x3c]
	cmp r0, #0
	ldrne r0, _022FD780 ; =ov29_02353538
	ldrne r0, [r0]
	addne r0, r0, #0x3e00
	ldrnesh r7, [r0, #0x3a]
	moveq r7, r1
_022FD420:
	ldrb r0, [sp, #0x48]
	mov r1, sl
	mov r2, sb
	cmp r0, #0
	movne r3, #1
	moveq r3, #0
	mov r0, r7
	and r3, r3, #0xff
	bl ov29_022FD318
	cmp r0, #0
	moveq r0, #0
	beq _022FD774
	mov r0, r7
	bl ov29_022E1D2C
	ldr r1, _022FD784 ; =ov29_0237C9C0
	strh r7, [sp, #4]
	ldrb r3, [r1]
	ldr r2, _022FD788 ; =DIRECTIONS_XY
	ldr r1, _022FD78C ; =ov29_0235171E
	mov r3, r3, lsl #2
	ldrsh r2, [r2, r3]
	ldrsh r1, [r1, r3]
	mov r7, r0
	strh sl, [sp, #0xe]
	strh sb, [sp, #0x10]
	ldrb r8, [r5, #2]
	mov r3, #0
	add r2, sl, r2
	add r1, sb, r1
	strh r2, [sp]
	strh r1, [sp, #2]
	strb r3, [sp, #6]
	str r3, [sp, #8]
	strb r3, [sp, #0x12]
	cmp r6, #0
	addne r3, sp, #0
	ldreq r3, _022FD790 ; =ov29_0237C690
	add r2, sp, #4
	mov r1, r7
	mov r0, #1
	strh r8, [sp, #0xc]
	bl InitMonster
	ldr r8, [r7, #0xb4]
	mov r2, #0
	strb r2, [r8, #6]
	strb r2, [r8, #8]
	strb r2, [r8, #9]
	ldrb r1, [sp, #0x40]
	strb r6, [r8, #7]
	ldr r0, _022FD794 ; =ov29_0235355C
	strb r1, [r8, #0x102]
	str r2, [r0]
	cmp r6, #0
	ldrne r0, _022FD790 ; =ov29_0237C690
	mov r3, #0
	strneh sl, [r0]
	strneh sb, [r0, #2]
	ldrsh r0, [r5, #0xe]
	strh r0, [r8, #0x10]
	ldrsh r0, [r5, #0x10]
	strh r0, [r8, #0x12]
	strh r3, [r8, #0x16]
	ldr r0, [r5, #0x18]
	str r0, [r8, #0x20]
_022FD520:
	add r2, r5, r3
	ldrb r0, [r2, #0x12]
	add r1, r8, r3
	add r3, r3, #1
	strb r0, [r1, #0x1a]
	ldrb r0, [r2, #0x14]
	cmp r3, #2
	strb r0, [r1, #0x1c]
	blt _022FD520
	add r3, r5, #0x1c
	add r2, r8, #0x124
	mov r1, #0x11
_022FD550:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022FD550
	mov r2, #0
	add r1, r8, #0x124
	mov sb, r2
	mov sl, #1
_022FD570:
	ldrb r3, [r1, r2, lsl #3]
	mov r0, r2, lsl #3
	add r2, r2, #1
	tst r3, #1
	movne r3, sl
	moveq r3, sb
	tst r3, #0xff
	ldrneb r3, [r1, r0]
	bicne r6, r3, #0x10
	andne r3, r6, #0xff
	bicne r3, r3, #0x20
	strneb r3, [r1, r0]
	cmp r2, #4
	blt _022FD570
	ldrb r1, [r8, #0x144]
	add r0, r5, #0x4c
	add sb, r8, #0x90
	bic r2, r1, #0x10
	and r1, r2, #0xff
	bic r1, r1, #0x20
	strb r1, [r8, #0x144]
	ldrb r1, [r5, #2]
	add r3, r8, #0x100
	mov r6, #0
	strb r1, [r8, #0xa]
	ldrsh r1, [r5, #6]
	strh r1, [r8, #0xe]
	ldrb r1, [r5, #0x58]
	strb r1, [r8, #0xa8]
	ldmia r0, {r0, r1, r2}
	stmia sb, {r0, r1, r2}
	ldrh r1, [r5, #0x5a]
	mov r0, r7
	strh r1, [r8, #0x44]
	ldrh r1, [r5, #0x5c]
	strh r1, [r8, #0x46]
	ldrb r1, [r5, #3]
	strb r1, [r8, #0x48]
	ldrb r1, [r5, #4]
	strb r1, [r8, #0x49]
	ldrh r1, [r5, #0x44]
	strh r1, [r3, #0x46]
	ldrh r1, [r5, #0x46]
	strh r1, [r3, #0x48]
	ldrh r1, [r5, #0x48]
	strh r1, [r3, #0x4a]
	ldrh r1, [r5, #0x4a]
	strh r1, [r3, #0x4c]
	ldrsh r1, [r5, #0xa]
	strh r1, [r8, #0xc]
	ldrh r1, [r5, #0x3e]
	strh r1, [r8, #0x62]
	ldrh r1, [r5, #0x40]
	strh r1, [r8, #0x64]
	ldrh r1, [r5, #0x42]
	strh r1, [r8, #0x66]
	strb r6, [r8, #0xfc]
	strb r6, [r8, #0x103]
	strb r6, [r8, #0x23c]
	strb r6, [r8, #0x23d]
	strh r6, [r8, #0x68]
	bl ov29_023021F0
	ldrb r1, [sp, #0x44]
	mov r0, r7
	bl ov29_022FB83C
	bl GetCurrentBagCapacity
	cmp r0, #1
	beq _022FD760
	bl IsCurrentFixedRoomBossFight
	cmp r0, #0
	bne _022FD760
	mov r0, r7
	bl ov29_022FBA70
	cmp r0, #0
	bne _022FD760
	ldrb r0, [r8, #0x60]
	cmp r0, #0x47
	ldrneb r0, [r8, #0x61]
	cmpne r0, #0x47
	bne _022FD760
	ldr r2, [r7, #0xb4]
	ldr r0, _022FD798 ; =ov10_022C4520
	ldrb r1, [r2, #6]
	ldrsh r5, [r0]
	cmp r1, #0
	movne r0, #0
	bne _022FD6D8
	add r0, r2, #0x228
	mov r1, #0x61
	bl ExclusiveItemEffectFlagTest
_022FD6D8:
	cmp r0, #0
	beq _022FD6FC
	ldr r1, _022FD79C ; =ov10_022C4858
	mov r0, r5, lsl #8
	ldr r1, [r1]
	bl MultiplyByFixedPoint
	mov r1, r0, asr #7
	add r0, r0, r1, lsr #24
	mov r5, r0, asr #8
_022FD6FC:
	mov r0, r5
	bl DungeonRandOutcome__022EAB20
	cmp r0, #0
	beq _022FD760
	ldrb r0, [r8, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _022FD760
	bl IsBagFull
	cmp r0, #0
	bne _022FD760
	mov r0, #0
	bl GetItemIdToSpawn
	mov r1, r0
	cmp r1, #0xb7
	beq _022FD760
	add r0, r8, #0x62
	mov r2, #0
	bl InitStandardItem
	mov r0, r8
	bl AddHeldItemToBag
	mov r0, #1
	strb r0, [r8, #0xfc]
_022FD760:
	mov r0, r7
	bl ov29_022F9EA0
	cmp r4, #0
	strne r7, [r4]
	mov r0, #1
_022FD774:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022FD77C: .word 0x000001A2
_022FD780: .word ov29_02353538
_022FD784: .word ov29_0237C9C0
_022FD788: .word DIRECTIONS_XY
_022FD78C: .word ov29_0235171E
_022FD790: .word ov29_0237C690
_022FD794: .word ov29_0235355C
_022FD798: .word ov10_022C4520
_022FD79C: .word ov10_022C4858
	arm_func_end InitTeamMember

	arm_func_start ov29_022FD7A0
ov29_022FD7A0: ; 0x022FD7A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x20
	mov r7, r0
	mov r6, r1
	ldrb r1, [r7, #0xaa]
	mov r0, r6
	mov r4, #0
	bl ov29_022E1AAC
	mov sb, r0
	mov r0, r7
	bl ov29_022E1AD4
	ldr r5, [r7, #0xb4]
	mov r8, r0
	ldr r0, [r5, #0xb0]
	bl ov29_022DDB68
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _022FD864
	cmp sb, r8
	ble _022FD864
	mov r1, r6
	mov r0, r4
	bl GetMonsterApparentId
	mov r8, r0
	bl DungeonGetSpriteIndex
	mov r4, r0
	mov r0, r7
	mov r1, #1
	bl ov29_022E1C0C
	mov r0, #1
	bl ov29_022E1F34
	mov r3, r4
	ldrb r4, [r7, #0xaa]
	mov r2, r8
	add r0, sp, #0xc
	add r1, sp, #8
	str r4, [sp]
	bl ov29_022E2018
	cmp r0, #0
	bne _022FD860
	ldrb r2, [r7, #0xaa]
	add r0, sp, #0xc
	add r1, sp, #8
	str r2, [sp]
	ldr r2, [r7, #0xb4]
	ldrsh r3, [r7, #0xa8]
	ldrsh r2, [r2, #4]
	bl ov29_022E2018
_022FD860:
	mov r4, #1
_022FD864:
	mov r0, #0
	strh r6, [sp, #0x10]
	strh r0, [sp, #0x18]
	strb r0, [sp, #0x12]
	ldrh r2, [r7, #4]
	mov r1, r6
	strh r2, [sp, #0x1a]
	ldrh r2, [r7, #6]
	strh r2, [sp, #0x1c]
	str r0, [sp, #0x14]
	bl GetMonsterApparentId
	mov r1, #0
	strb r1, [r7, #0x22]
	ldr r1, [r7, #0xb4]
	strh r0, [r1, #4]
	ldr r1, [r7, #0xb4]
	strh r6, [r1, #2]
	bl DungeonGetSpriteIndex
	strh r0, [r7, #0xa8]
	cmp r4, #0
	beq _022FD904
	ldr r0, [sp, #0xc]
	add r0, r0, #0x62
	strh r0, [r7, #0xac]
	ldr r1, [sp, #0xc]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17a]
	ldr r1, [sp, #8]
	ldr r0, [r7, #0xb4]
	strb r1, [r0, #0x17b]
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _022FD904
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022E1EC4
_022FD904:
	mov r0, #7
	strb r0, [r7, #0xae]
	mov r1, #0
	strb r1, [r7, #0xb0]
	mov r0, #0xff
	strb r0, [r7, #0xaf]
	mov r0, #1
	strb r0, [r7, #0xb1]
	strb r0, [r7, #0xb3]
	strb r1, [r7, #0x28]
	str r1, [r7, #0x1c]
	ldrb r0, [r5, #0xc4]
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _022FD94C
	ldr r0, [r5, #0xb4]
	bl FreeOtherWrappedMonsters
_022FD94C:
	ldrb r0, [r5, #6]
	add r2, sp, #0x10
	mov r1, r7
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	mov r3, #0
	bl InitMonster
	ldrsh r2, [r5, #2]
	add r0, r5, #0x124
	add r1, r5, #0x12
	str r2, [sp]
	ldrb r4, [r5, #0xa]
	add r2, r5, #0x1a
	add r3, r5, #0x1c
	str r4, [sp, #4]
	bl InitEnemyStatsAndMoves
	ldrsh r2, [r5, #0x12]
	ldrsh r1, [r5, #0x16]
	ldr r0, _022FD9D0 ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	strh r1, [r5, #0x10]
	mov r1, #0
	mov r0, r7
	strb r1, [r5, #9]
	bl ov29_022E6644
	mov r0, r7
	bl UpdateStatusIconFlags
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FD9D0: .word 0x000003E7
	arm_func_end ov29_022FD7A0

	arm_func_start InitMonster
InitMonster: ; 0x022FD9D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r4, _022FDDB0 ; =ov29_02353538
	mov r7, r1
	ldr r4, [r4]
	mov r1, #1
	strb r1, [r4, #0xe]
	ldr r4, [r7, #0xb4]
	mov r8, r0
	mov r6, r2
	mov r0, r4
	mov r5, r3
	bl SubInitMonster
	mov r0, #0
	ldrb r2, [r6, #2]
	mov r3, #1
	sub r1, r0, #1
	strb r2, [r4, #0xbc]
	strb r3, [r7, #0x20]
	strb r0, [r7, #0x22]
	sub r0, r0, #2
	strh r1, [r7, #8]
	strh r1, [r7, #0xa]
	strh r0, [r7, #4]
	strh r0, [r7, #6]
	mov r0, r7
	ldrsh r1, [r6, #0xa]
	ldrsh r2, [r6, #0xc]
	bl MoveMonsterToPos
	mov r0, r7
	mov r1, #0
	bl UpdateEntityPixelPos
	cmp r8, #0
	bne _022FDAD4
	ldrsh r1, [r6]
	ldr r0, _022FDDB4 ; =0x0000017F
	cmp r1, r0
	addne r0, r0, #0x258
	cmpne r1, r0
	bne _022FDAAC
	ldr r0, _022FDDB0 ; =ov29_02353538
	ldr r1, [r0]
	ldrb r0, [r1, #0x790]
	cmp r0, #0
	bne _022FDAAC
	add r0, r1, #0x4000
	ldrb r0, [r0, #0xc6]
	cmp r0, #0
	beq _022FDAAC
	ldrb r0, [r6, #2]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r4, #9]
	beq _022FDAB4
_022FDAAC:
	mov r0, #0
	strb r0, [r4, #9]
_022FDAB4:
	ldrsh r0, [r4, #2]
	bl GetBaseForm
	cmp r0, #0x97
	ldreq r0, _022FDDB0 ; =ov29_02353538
	moveq r1, #1
	ldreq r0, [r0]
	addeq r0, r0, #0x3000
	streqb r1, [r0, #0xe39]
_022FDAD4:
	ldr r1, _022FDDB0 ; =ov29_02353538
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r0, [r0, #0xe2c]
	str r0, [r4, #0xb0]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r1, [r0, #0xe2c]
	add r1, r1, #1
	str r1, [r0, #0xe2c]
	str r2, [r4, #0xb4]
	ldrsh r0, [r6, #8]
	cmp r0, #0
	bne _022FDB18
	ldrsh r0, [r6]
	bl GetMonsterLevelToSpawn
_022FDB18:
	strb r0, [r4, #0xa]
	ldr r0, [r6, #4]
	mov r2, #1
	str r0, [r4, #0x120]
	strh r2, [r4, #0xe]
	ldrsh r1, [r4, #2]
	add r0, r4, #0x90
	bl sub_02058EB0
	add r0, r4, #0x44
	bl ShuffleHiddenPower
	mov r1, #1
	strh r1, [r4, #0x12]
	mov r0, #0x64
	strh r1, [r4, #0x10]
	bl sub_02050FF8
	strh r0, [sp, #4]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #6]
	ldrh r0, [sp, #4]
	add r1, r4, #0x100
	ldrh r2, [sp, #6]
	strh r0, [r1, #0x46]
	mov r0, #0x64
	strh r2, [r1, #0x48]
	bl sub_02050FF8
	strh r0, [sp]
	mov r0, r0, lsr #0x10
	strh r0, [sp, #2]
	ldrh r2, [sp]
	add r0, r4, #0x100
	ldrh r1, [sp, #2]
	strh r2, [r0, #0x4a]
	cmp r5, #0
	strh r1, [r0, #0x4c]
	ldrneh r1, [r5]
	strneh r1, [r0, #0x7e]
	ldrneh r1, [r5, #2]
	moveq r1, #0
	streqh r1, [r0, #0x7e]
	strh r1, [r0, #0x80]
	mov r3, #0
	strh r3, [r4]
	strb r3, [r4, #0x14e]
	strb r3, [r4, #0x14f]
	add r0, r4, #0x200
	strh r3, [r0, #0xc]
	strh r3, [r0, #0xe]
	strb r3, [r4, #0x7c]
	ldrh r2, [r7, #4]
	mov r0, r4
	mov r1, #1
	strh r2, [r4, #0x8c]
	ldrh r2, [r7, #6]
	strh r2, [r4, #0x8e]
	str r3, [r4, #0x84]
	str r3, [r4, #0x88]
	strh r3, [r4, #0x80]
	strb r3, [r4, #0x10b]
	str r3, [r4, #0x188]
	strb r3, [r4, #0x10c]
	strb r3, [r4, #0x23c]
	strb r3, [r4, #0x23d]
	strb r3, [r4, #0x23f]
	bl SubInitMonster
	add r0, r4, #0x62
	bl ItemZInit
	mov r2, #0
	strh r2, [r4, #0x68]
	str r2, [r4, #0x218]
	str r2, [r4, #0x21c]
	mov r0, #0xff
	strb r0, [r4, #0x177]
	strb r0, [r4, #0x178]
	str r2, [r4, #0x214]
	strb r2, [r4, #0x151]
	strb r2, [r4, #0x150]
	strb r2, [r4, #0x179]
	add r0, r4, #0x200
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strb r2, [r4, #0x152]
	strb r2, [r4, #0x153]
	add r0, r4, #0x100
	strh r2, [r0, #0x92]
	str r2, [r4, #0x18c]
	strb r2, [r4, #0x105]
	strb r2, [r4, #0x104]
	strb r2, [r4, #0x109]
	strb r2, [r4, #0x155]
	mov r1, #1
	strb r1, [r4, #0x156]
	strh r2, [r0, #0x58]
	strh r2, [r0, #0x5a]
	strb r2, [r4, #0x15c]
	strb r2, [r4, #0x15d]
	strb r2, [r4, #0x15e]
	strb r2, [r4, #0x15f]
	strb r2, [r4, #0x17c]
	strb r2, [r4, #0x106]
	strb r2, [r4, #0x107]
	mov r0, #0x63
	strb r0, [r4, #0x10a]
	strb r2, [r4, #0x162]
	strb r2, [r4, #0x163]
	strb r2, [r4, #0x164]
	strb r2, [r4, #0x165]
	strb r2, [r4, #0x170]
	mov r0, r7
	strb r2, [r4, #0x171]
	bl CalcSpeedStageWrapper
	mov r0, #1
	strb r0, [r4, #0x160]
	mov r0, #0
	strb r0, [r4, #0x172]
	strb r0, [r4, #0x174]
	strb r0, [r4, #0x173]
	strb r0, [r4, #0x175]
	strb r0, [r4, #0x176]
	ldrsh r1, [r4, #4]
	cmp r1, #0x32
	ldrne r0, _022FDDB8 ; =0x0000028A
	cmpne r1, r0
	cmpne r1, #0x33
	addne r0, r0, #1
	cmpne r1, r0
	moveq r0, #0
	streqb r0, [r4, #0x160]
	ldr r1, _022FDDBC ; =ov29_0235276C
	ldr r0, _022FDDB0 ; =ov29_02353538
	ldrh r3, [r1]
	ldr r0, [r0]
	add r2, sp, #8
	strh r3, [sp, #8]
	ldrh r1, [r1, #2]
	add r0, r0, #0x1a000
	strh r1, [sp, #0xa]
	ldrsh r1, [r7, #4]
	strh r1, [sp, #8]
	ldrsh r1, [r7, #6]
	strh r1, [sp, #0xa]
	ldrb r3, [r0, #0x23c]
	ldrsh r1, [r4, #4]
	ldr r0, [r4, #0xb0]
	bl ov29_022DDA54
	mov r0, r7
	bl ov29_023021F0
	mov r1, #0
	mov r0, r7
	mov r2, r1
	bl ov29_022FA1D8
	mov r1, #0
	strh r1, [r4, #0xac]
	str r1, [r4, #0x18c]
	add r0, r4, #0x100
	strh r1, [r0, #0x90]
	strb r1, [r4, #0x166]
	strb r1, [r4, #0x167]
	strb r1, [r4, #0x221]
	strh r1, [r0, #0x68]
	mov r2, #0xff
	add r0, r4, #0x224
	mov r1, #0x18
	strb r2, [r4, #0x16a]
	bl MemZero
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FDDB0: .word ov29_02353538
_022FDDB4: .word 0x0000017F
_022FDDB8: .word 0x0000028A
_022FDDBC: .word ov29_0235276C
	arm_func_end InitMonster

	arm_func_start SubInitMonster
SubInitMonster: ; 0x022FDDC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r2, #0
	strb r2, [sl, #0xbd]
	strb r2, [sl, #0xbe]
	strb r2, [sl, #0xbf]
	strb r2, [sl, #0xc0]
	strb r2, [sl, #0xc1]
	strb r2, [sl, #0xc2]
	strb r2, [sl, #0xc4]
	strb r2, [sl, #0xcc]
	strb r2, [sl, #0xcd]
	mov r0, #0x22
	str r0, [sl, #0xc8]
	strb r2, [sl, #0xd0]
	strb r2, [sl, #0xd1]
	strb r2, [sl, #0xd2]
	strb r2, [sl, #0xd5]
	strb r2, [sl, #0xd6]
	strb r2, [sl, #0xd8]
	strb r2, [sl, #0xdb]
	strb r2, [sl, #0xdc]
	strb r2, [sl, #0xe0]
	strb r2, [sl, #0xe9]
	strb r2, [sl, #0xea]
	strb r2, [sl, #0xec]
	strb r2, [sl, #0xed]
	strb r2, [sl, #0xee]
	strb r2, [sl, #0xef]
	strb r2, [sl, #0xf0]
	strb r2, [sl, #0xf1]
	strb r2, [sl, #0xf2]
	strb r2, [sl, #0xf3]
	strb r2, [sl, #0xf4]
	strb r2, [sl, #0xf5]
	strb r2, [sl, #0xf6]
	strb r2, [sl, #0xf7]
	strb r2, [sl, #0xf8]
	strb r2, [sl, #0xf9]
	strb r2, [sl, #0xfa]
	strb r2, [sl, #0xfb]
	mov r0, #0xff
	strb r0, [sl, #0x177]
	mov sb, r1
	strb r0, [sl, #0x178]
	mov r6, r2
_022FDE78:
	add r0, sl, r2
	strb r6, [r0, #0x114]
	add r2, r2, #1
	strb r6, [r0, #0x119]
	cmp r2, #5
	blt _022FDE78
	mov r8, r6
	mov r5, #1
	mov fp, #0xa
	mov r4, #0x100
_022FDEA0:
	ldrsh r0, [sl, #2]
	mov r1, r8
	add r7, sl, r8
	bl GetAbility
	and r1, r0, #0xff
	cmp r1, #0x25
	strb r0, [r7, #0x60]
	moveq r6, #1
	cmp sb, #0
	strneb r5, [r7, #0x1a]
	strneb r5, [r7, #0x1c]
	add r1, sl, r8, lsl #1
	strh fp, [r1, #0x24]
	strh fp, [r1, #0x28]
	add r0, sl, r8, lsl #2
	strh fp, [r1, #0x2c]
	str r4, [r0, #0x34]
	add r8, r8, #1
	str r4, [r0, #0x3c]
	cmp r8, #2
	blt _022FDEA0
	cmp r6, #0
	beq _022FDF24
	mov r0, #0
	bl GetApparentWeather
	mov r1, #6
	mul r2, r0, r1
	ldr r1, _022FDF9C ; =CASTFORM_WEATHER_ATTRIBUTE_TABLE
	mov r0, #0
	ldrb r1, [r1, r2]
	strb r1, [sl, #0x5e]
	strb r0, [sl, #0x5f]
	b _022FDF48
_022FDF24:
	mov r4, #0
_022FDF28:
	ldrsh r0, [sl, #2]
	mov r1, r4
	bl GetType
	add r1, sl, r4
	add r4, r4, #1
	strb r0, [r1, #0x5e]
	cmp r4, #2
	blt _022FDF28
_022FDF48:
	mov r2, #0
	strb r2, [sl, #0xaa]
	strb r2, [sl, #0xab]
	ldr r0, _022FDFA0 ; =ov29_02353538
	strb r2, [sl, #0xa9]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0xe]
	strh r2, [sl, #0x30]
	strb r2, [sl, #0x11e]
	strb r2, [sl, #0x106]
	strb r2, [sl, #0x11f]
	strb r2, [sl, #0xfd]
	strb r2, [sl, #0x108]
	strb r2, [sl, #0xfe]
	strb r2, [sl, #0xff]
	strb r2, [sl, #0x100]
	mov r0, sl
	strb r2, [sl, #0x10b]
	bl ov29_02307DC0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FDF9C: .word CASTFORM_WEATHER_ATTRIBUTE_TABLE
_022FDFA0: .word ov29_02353538
	arm_func_end SubInitMonster

	arm_func_start ov29_022FDFA4
ov29_022FDFA4: ; 0x022FDFA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, #0
	mov r4, r7
	mov r5, #1
	mov r6, r7
_022FDFB8:
	ldr r0, _022FE044 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl EntityIsValid__022FC99C
	cmp r0, #0
	ldrne r1, [r8, #0xb4]
	mvnne r0, #0
	ldrnesh r3, [r1, #0xc]
	cmpne r3, r0
	beq _022FE034
	mov r8, r6
_022FDFF0:
	add r0, r1, r8, lsl #3
	ldrb r0, [r0, #0x124]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	addne r0, r1, r8, lsl #3
	addne r0, r0, #0x100
	ldrneh r2, [r0, #0x26]
	add r8, r8, #1
	bicne r2, r2, #1
	strneh r2, [r0, #0x26]
	cmp r8, #4
	blt _022FDFF0
	mov r0, r3, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov29_022FE048
_022FE034:
	add r7, r7, #1
	cmp r7, #4
	blt _022FDFB8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022FE044: .word ov29_02353538
	arm_func_end ov29_022FDFA4

	arm_func_start ov29_022FE048
ov29_022FE048: ; 0x022FE048
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	bl GetActiveTeamMember
	ldrsh r1, [r4, #0x10]
	mov r3, r0
	mov r5, #0
	strh r1, [r3, #0xe]
	ldrsh r0, [r4, #0x12]
	strh r0, [r3, #0x10]
	ldr r0, [r4, #0x20]
	str r0, [r3, #0x18]
_022FE074:
	add r2, r4, r5
	ldrb r0, [r2, #0x1a]
	add r1, r3, r5
	add r5, r5, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r2, #0x1c]
	cmp r5, #2
	strb r0, [r1, #0x14]
	blt _022FE074
	ldrsh r1, [r4, #4]
	sub r0, r1, #0x17c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FE188 ; =0x0000017B
	strlsh r0, [r3, #0xc]
	bls _022FE0E0
	sub r0, r1, #0x3d4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	ldrls r0, _022FE18C ; =0x000003D3
	strlsh r0, [r3, #0xc]
_022FE0E0:
	add r5, r4, #0x124
	add r2, r3, #0x1c
	mov r1, #0x11
_022FE0EC:
	ldrh r0, [r5], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022FE0EC
	ldrb r1, [r4, #0xa]
	add r0, r4, #0x90
	add r5, r3, #0x4c
	strb r1, [r3, #2]
	ldrsh r1, [r4, #0xe]
	add ip, r4, #0x100
	ldr lr, _022FE190 ; =0x000055AA
	strh r1, [r3, #6]
	ldmia r0, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
	ldrb r0, [r4, #0xa8]
	strb r0, [r3, #0x58]
	ldrh r0, [r4, #0x44]
	strh r0, [r3, #0x5a]
	ldrh r0, [r4, #0x46]
	strh r0, [r3, #0x5c]
	ldrh r0, [ip, #0x46]
	strh r0, [r3, #0x44]
	ldrh r0, [ip, #0x48]
	strh r0, [r3, #0x46]
	ldrh r0, [ip, #0x4a]
	strh r0, [r3, #0x48]
	ldrh r0, [ip, #0x4c]
	strh r0, [r3, #0x4a]
	ldrh r0, [r4, #0x62]
	strh r0, [r3, #0x3e]
	ldrh r0, [r4, #0x64]
	strh r0, [r3, #0x40]
	ldrh r0, [r4, #0x66]
	strh r0, [r3, #0x42]
	ldrsh r0, [r3, #8]
	cmp r0, lr
	ldreq r0, _022FE194 ; =0x00005AA5
	streqh r0, [r3, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FE188: .word 0x0000017B
_022FE18C: .word 0x000003D3
_022FE190: .word 0x000055AA
_022FE194: .word 0x00005AA5
	arm_func_end ov29_022FE048

	arm_func_start MarkShopkeeperSpawn
MarkShopkeeperSpawn: ; 0x022FE198
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _022FE248 ; =ov29_02353538
	mov r6, #0
	ldr r4, [ip]
	mov lr, #6
	add ip, r4, #0x5e0
	ldr r7, [ip, #0x30]
	b _022FE1E8
_022FE1B8:
	mla r5, r6, lr, ip
	ldrb r4, [r5, #3]
	cmp r4, #0
	beq _022FE1E4
	ldrb r4, [r5, #4]
	cmp r0, r4
	ldreqb r4, [r5, #5]
	cmpeq r1, r4
	streqh r2, [r5]
	streqb r3, [r5, #2]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022FE1E4:
	add r6, r6, #1
_022FE1E8:
	cmp r6, r7
	blt _022FE1B8
	cmp r7, #8
	ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
	mov lr, #6
	mla r4, r7, lr, ip
	mov r5, #1
	strb r5, [r4, #3]
	ldr r5, [ip, #0x30]
	mla r4, r5, lr, ip
	strb r0, [r4, #4]
	ldr r4, [ip, #0x30]
	mla r0, r4, lr, ip
	strb r1, [r0, #5]
	ldr r0, [ip, #0x30]
	mul r1, r0, lr
	strh r2, [ip, r1]
	ldr r1, [ip, #0x30]
	mla r0, r1, lr, ip
	strb r3, [r0, #2]
	ldr r0, [ip, #0x30]
	add r0, r0, #1
	str r0, [ip, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022FE248: .word ov29_02353538
	arm_func_end MarkShopkeeperSpawn

	arm_func_start SpawnShopkeepers
SpawnShopkeepers: ; 0x022FE24C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _022FE2E0 ; =ov29_02353538
	ldr r0, [r0]
	add r6, r0, #0x5e0
	bl ov29_022FBF08
	mov r5, #0
	mov r4, r5
	add sb, sp, #0
	mov r8, #1
	mov r7, #6
	b _022FE2C8
_022FE27C:
	mla r3, r5, r7, r6
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _022FE2C4
	ldrsh r2, [r3]
	mov r0, sb
	mov r1, r8
	strh r2, [sp]
	strh r4, [sp, #8]
	ldrb r2, [r3, #4]
	strh r2, [sp, #0xa]
	ldrb r2, [r3, #5]
	strh r2, [sp, #0xc]
	ldrb r2, [r3, #2]
	strb r2, [sp, #2]
	str r4, [sp, #4]
	strb r4, [sp, #0xe]
	bl SpawnMonster
_022FE2C4:
	add r5, r5, #1
_022FE2C8:
	ldr r0, [r6, #0x30]
	cmp r5, r0
	blt _022FE27C
	bl ov29_022FBF30
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FE2E0: .word ov29_02353538
	arm_func_end SpawnShopkeepers

	arm_func_start ov29_022FE2E4
ov29_022FE2E4: ; 0x022FE2E4
	ldr r0, _022FE2F8 ; =ov29_02353538
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x610]
	bx lr
	.align 2, 0
_022FE2F8: .word ov29_02353538
	arm_func_end ov29_022FE2E4

	arm_func_start GetMaxHpAtLevel
GetMaxHpAtLevel: ; 0x022FE2FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	bl GetBaseHp
	mov r6, r0
	mov r5, #2
	add r4, sp, #0
	b _022FE33C
_022FE320:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GetLvlUpEntry
	ldrh r0, [sp, #4]
	add r5, r5, #1
	add r6, r6, r0
_022FE33C:
	cmp r5, r7
	ble _022FE320
	mov r0, r6
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end GetMaxHpAtLevel

	arm_func_start GetOffensiveStatAtLevel
GetOffensiveStatAtLevel: ; 0x022FE350
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r7, r2
	mov r4, r1
	mov r1, r7
	mov r5, r0
	bl GetBaseOffensiveStat
	add r6, sp, #0
	add sb, r6, r7
	mov r8, r0
	mov r7, #2
	b _022FE39C
_022FE380:
	mov r0, r6
	mov r1, r5
	mov r2, r7
	bl GetLvlUpEntry
	ldrb r0, [sb, #6]
	add r7, r7, #1
	add r8, r8, r0
_022FE39C:
	cmp r7, r4
	ble _022FE380
	cmp r8, #0xff
	movgt r8, #0xff
	mov r0, r8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end GetOffensiveStatAtLevel

	arm_func_start GetDefensiveStatAtLevel
GetDefensiveStatAtLevel: ; 0x022FE3B8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r7, r2
	mov r4, r1
	mov r1, r7
	mov r5, r0
	bl GetBaseDefensiveStat
	add r6, sp, #0
	add sb, r6, r7
	mov r8, r0
	mov r7, #2
	b _022FE404
_022FE3E8:
	mov r0, r6
	mov r1, r5
	mov r2, r7
	bl GetLvlUpEntry
	ldrb r0, [sb, #8]
	add r7, r7, #1
	add r8, r8, r0
_022FE404:
	cmp r7, r4
	ble _022FE3E8
	cmp r8, #0xff
	movgt r8, #0xff
	mov r0, r8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end GetDefensiveStatAtLevel

	arm_func_start GetOutlawSpawnData
GetOutlawSpawnData: ; 0x022FE420
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _022FE4A0 ; =ov29_02353538
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x348
	add r0, r0, #0x400
	bl GetMissionRank
	mov r5, r0
	bl GetMissionDestination
	ldrsh r2, [r0, #0xe]
	ldr r0, _022FE4A4 ; =OUTLAW_LEVEL_TABLE
	mov r1, r5, lsl #1
	ldrsh r1, [r0, r1]
	strh r2, [r4]
	mov r0, #1
	strh r1, [r4, #4]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	bl IsDestinationFloorWithHiddenOutlaw
	cmp r0, #0
	movne r0, #2
	strneb r0, [r4, #2]
	movne r0, #0
	strneb r0, [r4, #7]
	ldmneia sp!, {r3, r4, r5, pc}
	bl IsDestinationFloorWithFleeingOutlaw
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4, #2]
	moveq r0, #1
	streqb r0, [r4, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022FE4A0: .word ov29_02353538
_022FE4A4: .word OUTLAW_LEVEL_TABLE
	arm_func_end GetOutlawSpawnData

	arm_func_start ov29_022FE4A8
ov29_022FE4A8: ; 0x022FE4A8
	ldr r0, _022FE4B8 ; =ov29_0237C9C0
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_022FE4B8: .word ov29_0237C9C0
	arm_func_end ov29_022FE4A8

	arm_func_start ExecuteMonsterAction
ExecuteMonsterAction: ; 0x022FE4BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #1
	bl AnimationDelayOrSomething
	bl ov29_022FBD08
	mov r0, #1
	bl ov29_0234B024
	ldr r6, [sb, #0xb4]
	mov r1, #0
	strb r1, [r6, #0x109]
	ldr r0, _022FED70 ; =ov29_02353538
	strb r1, [r6, #0xfc]
	ldr r1, [r0]
	ldr r0, _022FED74 ; =ov10_022C4F3C
	str sb, [r1, #0xc4]
	ldrh r2, [r6, #0x4a]
	ldrb r0, [r0, r2, lsl #1]
	cmp r0, #0
	beq _022FE538
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FE528
	ldr r1, _022FED78 ; =ov10_022C4F3D
	mov r0, sb
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_022F3890
	b _022FE538
_022FE528:
	ldr r1, _022FED78 ; =ov10_022C4F3D
	mov r0, sb
	ldrb r1, [r1, r2, lsl #1]
	bl ov29_023085DC
_022FE538:
	mov r0, sb
	mov r1, #0
	bl ov29_02300DCC
	cmp r0, #0
	beq _022FE568
	mov r0, sb
	mov r1, #1
	bl ov29_0232461C
	cmp r0, #0
	beq _022FE568
	mov r0, sb
	bl ov29_02318D58
_022FE568:
	mov r4, #0
	add r3, r6, #0x124
	mov r1, r4
	mov r2, #1
_022FE578:
	ldrb r0, [r3, r4, lsl #3]
	add r5, r3, r4, lsl #3
	add r4, r4, #1
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	ldrneh r0, [r5, #2]
	bicne r0, r0, #4
	strneh r0, [r5, #2]
	cmp r4, #4
	blt _022FE578
	bl ov29_022E81F8
	mov r0, sb
	mov r1, #0
	bl ov29_022EB944
	cmp r0, #0
	bne _022FE638
	mov r0, sb
	bl DisplayActions
	cmp r0, #0
	beq _022FE608
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _022FED7C ; =ov29_0237C9C0
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FE608:
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _022FE61C
	mov r0, #0xa
	bl ov29_0234BA54
_022FE61C:
	ldrb r0, [r6, #0x23c]
	cmp r0, #0
	bne _022FE630
	mov r0, sb
	bl ov29_022F9840
_022FE630:
	mov r0, #0xa
	bl AdvanceFrame
_022FE638:
	mov r0, #0
	strb r0, [r6, #0x23c]
	ldrh r0, [r6, #0x4a]
	mov r4, #0
	ldr r1, _022FED80 ; =ov29_0237CA6C
	cmp r0, #1
	cmpne r0, #0
	cmpne r0, #4
	cmpne r0, #2
	movne r0, #1
	strneb r0, [r6, #0x152]
	strb r4, [r6, #0x154]
	ldr r0, _022FED84 ; =ov29_0237CA68
	strb r4, [r1]
	strb r4, [r0]
	mov r1, #1
	strb r1, [r6, #0x103]
	ldrh r0, [r6, #0x4a]
	cmp r0, #0x42
	addls pc, pc, r0, lsl #2
	b _022FEBAC
_022FE68C: ; jump table
	b _022FEBAC ; case 0
	b _022FEBAC ; case 1
	b _022FE798 ; case 2
	b _022FEBAC ; case 3
	b _022FEBAC ; case 4
	b _022FEBAC ; case 5
	b _022FEBAC ; case 6
	b _022FEBAC ; case 7
	b _022FEAA4 ; case 8
	b _022FEA30 ; case 9
	b _022FEAB0 ; case 10
	b _022FEAC8 ; case 11
	b _022FEBAC ; case 12
	b _022FEA08 ; case 13
	b _022FEA08 ; case 14
	b _022FEBAC ; case 15
	b _022FEA20 ; case 16
	b _022FEBAC ; case 17
	b _022FEA08 ; case 18
	b _022FEB0C ; case 19
	b _022FEB18 ; case 20
	b _022FE99C ; case 21
	b _022FEBAC ; case 22
	b _022FEB24 ; case 23
	b _022FEBAC ; case 24
	b _022FEBAC ; case 25
	b _022FEBAC ; case 26
	b _022FEBAC ; case 27
	b _022FEBAC ; case 28
	b _022FEBAC ; case 29
	b _022FEBAC ; case 30
	b _022FEBAC ; case 31
	b _022FEBAC ; case 32
	b _022FEBAC ; case 33
	b _022FEBAC ; case 34
	b _022FEB68 ; case 35
	b _022FEB74 ; case 36
	b _022FEB44 ; case 37
	b _022FE9A8 ; case 38
	b _022FEAC8 ; case 39
	b _022FEBAC ; case 40
	b _022FEBAC ; case 41
	b _022FEBAC ; case 42
	b _022FEBAC ; case 43
	b _022FEA28 ; case 44
	b _022FEBAC ; case 45
	b _022FEBAC ; case 46
	b _022FEBAC ; case 47
	b _022FEBAC ; case 48
	b _022FEA14 ; case 49
	b _022FEB34 ; case 50
	b _022FEBAC ; case 51
	b _022FEBAC ; case 52
	b _022FEBAC ; case 53
	b _022FEA3C ; case 54
	b _022FEA48 ; case 55
	b _022FEA60 ; case 56
	b _022FEB80 ; case 57
	b _022FEABC ; case 58
	b _022FEA84 ; case 59
	b _022FEA6C ; case 60
	b _022FEA78 ; case 61
	b _022FEA54 ; case 62
	b _022FEB5C ; case 63
	b _022FEBAC ; case 64
	b _022FEAC8 ; case 65
	b _022FEBA0 ; case 66
_022FE798:
	ldrb r0, [r6, #0xc4]
	cmp r0, #2
	cmpne r0, #7
	beq _022FE7B8
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #2
	bhi _022FE818
_022FE7B8:
	mov r0, #0
	strh r0, [r6, #0x4a]
	mov r0, #1
	strb r0, [r6, #0x151]
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FEBB4
	ldr r0, _022FED70 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FE7F4
	mov r0, #0x56
	bl AdvanceFrame
_022FE7F4:
	ldr r1, _022FED70 ; =ov29_02353538
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE818:
	ldrb r1, [r6, #0x4c]
	ldrh r3, [r6]
	ldr r2, _022FED88 ; =DIRECTIONS_XY
	mov r8, r1, lsl #2
	ldr r0, _022FED8C ; =ov29_0235171E
	ldrsh ip, [sb, #4]
	ldrsh r7, [r2, r8]
	ldrsh r5, [sb, #6]
	ldrsh r2, [r0, r8]
	add r0, ip, r7
	mov r0, r0, lsl #0x10
	add r2, r5, r2
	mov r2, r2, lsl #0x10
	mov r5, r4
	tst r3, #0x8000
	mov r7, r0, asr #0x10
	mov r8, r2, asr #0x10
	bne _022FE870
	mov r0, sb
	bl ov29_02300E78
	cmp r0, #0
	moveq r5, #1
_022FE870:
	cmp r5, #0
	beq _022FE8D8
	mov r0, #0
	strh r0, [r6, #0x4a]
	mov r0, #1
	strb r0, [r6, #0x151]
	ldrb r0, [r6, #7]
	cmp r0, #0
	beq _022FEBB4
	ldr r0, _022FED70 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #0xd8]
	cmp r0, #0
	blt _022FE8B4
	mov r0, #0x56
	bl AdvanceFrame
_022FE8B4:
	ldr r1, _022FED70 ; =ov29_02353538
	mvn r2, #0
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE8D8:
	ldrsh r2, [sb, #4]
	mov r0, sb
	mov r1, r7
	strh r2, [sp]
	ldrsh r4, [sb, #6]
	mov r2, r8
	mov r3, #0
	strh r4, [sp, #2]
	bl MoveMonsterToPos
	ldrb r1, [r6, #0x4c]
	add r2, sp, #0
	mov r0, sb
	bl ov29_02304D20
	mov r0, sb
	mov r1, #0xd
	bl IqSkillIsEnabled
	cmp r0, #0
	ldrneb r0, [r6, #0xef]
	cmpne r0, #3
	beq _022FE95C
	mov r0, sb
	mov r1, #0x6f
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	bne _022FE94C
	mov r0, sb
	mov r1, #0x10
	bl HasHeldItem
_022FE94C:
	cmp r0, #0
	bne _022FE95C
	add r0, sb, #4
	bl ov29_02337CCC
_022FE95C:
	ldrb r0, [r6, #7]
	mov r4, #1
	cmp r0, #0
	beq _022FEBB4
	ldrb r0, [r6, #0xd0]
	cmp r0, #2
	bne _022FEBB4
	ldr r1, _022FED70 ; =ov29_02353538
	sub r2, r4, #2
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xd8]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r2, [r0, #0xda]
	b _022FEBB4
_022FE99C:
	mov r0, sb
	bl ov29_0231A8A0
	b _022FEBB4
_022FE9A8:
	bl ov29_022E5D68
	ldr r0, _022FED70 ; =ov29_02353538
	mov r2, #1
	ldr r0, [r0]
	ldr r1, _022FED7C ; =ov29_0237C9C0
	strb r2, [r0, #6]
	ldrb r2, [r6, #0x4c]
	add r0, sb, #4
	strb r2, [r1]
	bl ov29_02338708
	cmp r0, #0
	beq _022FEBB4
	bl ov29_02338850
	cmp r0, #1
	bne _022FE9F0
	mov r0, #1
	bl ov29_02338898
	b _022FEBB4
_022FE9F0:
	bl ov29_02338850
	cmp r0, #2
	bne _022FEBB4
	mov r0, #2
	bl ov29_02338898
	b _022FEBB4
_022FEA08:
	mov r0, sb
	bl UseSingleUseItemWrapper
	b _022FEBB4
_022FEA14:
	mov r0, sb
	bl ov29_0231A9F8
	b _022FEBB4
_022FEA20:
	strh r1, [r6, #0x4a]
	b _022FEBB4
_022FEA28:
	strh r1, [r6, #0x4a]
	b _022FEBB4
_022FEA30:
	mov r0, sb
	bl ov29_022F4350
	b _022FEBB4
_022FEA3C:
	mov r0, sb
	bl ov29_022F45CC
	b _022FEBB4
_022FEA48:
	mov r0, sb
	bl ov29_022F48D8
	b _022FEBB4
_022FEA54:
	mov r0, sb
	bl ov29_022F49E0
	b _022FEBB4
_022FEA60:
	mov r0, sb
	bl ov29_022F4BDC
	b _022FEBB4
_022FEA6C:
	mov r0, sb
	bl ov29_022F4370
	b _022FEBB4
_022FEA78:
	mov r0, sb
	bl ov29_022F44F0
	b _022FEBB4
_022FEA84:
	ldr r0, _022FED70 ; =ov29_02353538
	ldrb r1, [r6, #0x4e]
	ldr r2, [r0]
	add r0, r2, r1, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28]
	str r0, [r2, #0xc8]
	b _022FEBB4
_022FEAA4:
	mov r0, sb
	bl ov29_022F4BF8
	b _022FEBB4
_022FEAB0:
	mov r0, sb
	bl ov29_022F4DAC
	b _022FEBB4
_022FEABC:
	mov r0, sb
	bl ov29_022F505C
	b _022FEBB4
_022FEAC8:
	mov r0, r6
	bl ov29_02302368
	cmp r0, #0
	beq _022FEAEC
	mov r0, sb
	bl ov29_022F996C
	mov r0, sb
	bl UseThrowableItem
	b _022FEBB4
_022FEAEC:
	mov r0, r4
	mov r1, sb
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r0, sb
	mov r1, #0xdf0
	bl LogMessageByIdWithPopupCheckUser
	b _022FEBB4
_022FEB0C:
	mov r0, sb
	bl ov29_022F59C4
	b _022FEBB4
_022FEB18:
	mov r0, sb
	bl ov29_022F5F18
	b _022FEBB4
_022FEB24:
	mov r0, sb
	mov r1, #0x160
	bl ov29_022F6058
	b _022FEBB4
_022FEB34:
	mov r0, sb
	rsb r1, r1, #0x164
	bl ov29_022F6058
	b _022FEBB4
_022FEB44:
	mov r0, sb
	mov r2, r4
	mov r3, r4
	add r1, sb, #4
	bl TryTriggerTrap
	b _022FEBB4
_022FEB5C:
	mov r0, sb
	bl ov29_0230F158
	b _022FEBB4
_022FEB68:
	mov r0, sb
	bl ov29_0230F140
	b _022FEBB4
_022FEB74:
	mov r0, sb
	bl ov29_0230F14C
	b _022FEBB4
_022FEB80:
	mov r0, r4
	mov r1, sb
	mov r2, r4
	bl SubstitutePlaceholderStringTags
	ldr r1, _022FED90 ; =0x00000DF1
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _022FEBB4
_022FEBA0:
	mov r0, sb
	bl ov29_022F52B0
	b _022FEBB4
_022FEBAC:
	mov r0, #1
	strh r0, [r6, #0x4a]
_022FEBB4:
	mov r0, sb
	bl TrySpawnTrapperTrap
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, [sb, #0xb4]
	ldrb r0, [r2, #0x154]
	cmp r0, #0
	bne _022FEBF0
	mov r1, #0
	mov r0, sb
	strb r1, [r2, #0x154]
	bl ov29_02318D58
_022FEBF0:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl ov29_022EF9BC
	ldrb r0, [r6, #0x155]
	cmp r0, #0
	beq _022FEC88
	mov ip, #0
	mov r5, #1
	mov r8, ip
	strb ip, [r6, #0x155]
	add r7, r6, #0x124
	mov r3, ip
	mov r1, ip
	mov r0, r5
_022FEC3C:
	ldrb r2, [r7, r8, lsl #3]
	add lr, r7, r8, lsl #3
	tst r2, #1
	movne r2, r5
	moveq r2, r3
	tst r2, #0xff
	beq _022FEC68
	ldrb r2, [lr]
	tst r2, #0x10
	movne ip, r0
	strneb r1, [lr, #6]
_022FEC68:
	add r8, r8, #1
	cmp r8, #4
	blt _022FEC3C
	cmp ip, #0
	beq _022FEC88
	ldr r1, _022FED94 ; =0x00000DF2
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
_022FEC88:
	bl TryActivateFlashFireOnAllMonsters
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FECB4
	bl ov29_022FEFC8
	bl ov29_022FEDBC
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FECB4:
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl ov29_022EC85C
	cmp r0, #0
	bne _022FECD8
	bl ov29_02346888
_022FECD8:
	mov r0, #0
	bl ov29_022E3A58
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrb r0, [r6, #0x14e]
	cmp r0, #0
	cmpeq r4, #0
	bne _022FED68
	mov r0, sb
	add r1, sb, #4
	bl ov29_022FFC9C
	cmp r0, #0
	beq _022FED58
	ldr r0, [r6, #0x110]
	cmp r0, #1
	ble _022FED50
	mov r0, #0
	bl DisplayActions
	mov r0, sb
	bl EntityIsValid__022FED98
	cmp r0, #0
	beq _022FED48
	bl IsFloorOver
	cmp r0, #0
	beq _022FED50
_022FED48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022FED50:
	mov r0, sb
	bl EnsureCanStandCurrentTile
_022FED58:
	mov r0, sb
	bl ov29_0230FC24
	mov r0, sb
	bl EnemyEvolution
_022FED68:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022FED70: .word ov29_02353538
_022FED74: .word ov10_022C4F3C
_022FED78: .word ov10_022C4F3D
_022FED7C: .word ov29_0237C9C0
_022FED80: .word ov29_0237CA6C
_022FED84: .word ov29_0237CA68
_022FED88: .word DIRECTIONS_XY
_022FED8C: .word ov29_0235171E
_022FED90: .word 0x00000DF1
_022FED94: .word 0x00000DF2
	arm_func_end ExecuteMonsterAction
