	.include "asm/macros.inc"
	.include "main_0205297C.inc"

	.text

	arm_func_start CanEvolve
CanEvolve: ; 0x0205297C
	ldr r2, _020529A4 ; =MONSTER_DATA_TABLE_PTR
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
_020529A4: .word MONSTER_DATA_TABLE_PTR
	arm_func_end CanEvolve

	arm_func_start GetMonsterPreEvolution
GetMonsterPreEvolution: ; 0x020529A8
	ldr r2, _020529C0 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #8]
	bx lr
	.align 2, 0
_020529C0: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetMonsterPreEvolution

	arm_func_start GetBaseOffensiveStat
GetBaseOffensiveStat: ; 0x020529C4
	ldr r3, _020529E0 ; =MONSTER_DATA_TABLE_PTR
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x24]
	bx lr
	.align 2, 0
_020529E0: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetBaseOffensiveStat

	arm_func_start GetBaseDefensiveStat
GetBaseDefensiveStat: ; 0x020529E4
	ldr r3, _02052A00 ; =MONSTER_DATA_TABLE_PTR
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x26]
	bx lr
	.align 2, 0
_02052A00: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetBaseDefensiveStat

	arm_func_start GetType
GetType: ; 0x02052A04
	ldr r3, _02052A20 ; =MONSTER_DATA_TABLE_PTR
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_02052A20: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetType

	arm_func_start GetAbility
GetAbility: ; 0x02052A24
	ldr r3, _02052A40 ; =MONSTER_DATA_TABLE_PTR
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r0, r0, r2, r3
	add r0, r0, r1
	ldrb r0, [r0, #0x18]
	bx lr
	.align 2, 0
_02052A40: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetAbility

	arm_func_start GetRecruitRate2
GetRecruitRate2: ; 0x02052A44
	ldr r2, _02052A5C ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x22]
	bx lr
	.align 2, 0
_02052A5C: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetRecruitRate2

	arm_func_start GetRecruitRate1
GetRecruitRate1: ; 0x02052A60
	ldr r2, _02052A78 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x1e]
	bx lr
	.align 2, 0
_02052A78: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetRecruitRate1

	arm_func_start GetExp
GetExp: ; 0x02052A7C
	stmdb sp!, {r4, lr}
	ldr r2, _02052AAC ; =MONSTER_DATA_TABLE_PTR
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
_02052AAC: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetExp

	arm_func_start GetEvoParameters
GetEvoParameters: ; 0x02052AB0
	ldr r3, _02052ADC ; =MONSTER_DATA_TABLE_PTR
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
_02052ADC: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetEvoParameters

	arm_func_start GetTreasureBoxChances
GetTreasureBoxChances: ; 0x02052AE0
	stmdb sp!, {r4, lr}
	mov r2, #0x44
	smulbb r4, r0, r2
	ldr r2, _02052B24 ; =MONSTER_DATA_TABLE_PTR
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
_02052B24: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetTreasureBoxChances

	arm_func_start GetIqGroup
GetIqGroup: ; 0x02052B28
	ldr r2, _02052B40 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x17]
	bx lr
	.align 2, 0
_02052B40: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetIqGroup

	arm_func_start GetSpawnThreshold
GetSpawnThreshold: ; 0x02052B44
	ldr r2, _02052B5C ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r0, [r0, #0x31]
	bx lr
	.align 2, 0
_02052B5C: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetSpawnThreshold

	arm_func_start NeedsItemToSpawn
NeedsItemToSpawn: ; 0x02052B60
	ldr r2, _02052B88 ; =MONSTER_DATA_TABLE_PTR
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
_02052B88: .word MONSTER_DATA_TABLE_PTR
	arm_func_end NeedsItemToSpawn

	arm_func_start GetExclusiveItem
GetExclusiveItem: ; 0x02052B8C
	ldr r2, _02052BB4 ; =MONSTER_DATA_TABLE_PTR
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
_02052BB4: .word MONSTER_DATA_TABLE_PTR
	arm_func_end GetExclusiveItem

	arm_func_start GetFamilyIndex
GetFamilyIndex: ; 0x02052BB8
	ldr r2, _02052BD0 ; =MONSTER_DATA_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrsh r0, [r0, #0x32]
	bx lr
	.align 2, 0
_02052BD0: .word MONSTER_DATA_TABLE_PTR
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
