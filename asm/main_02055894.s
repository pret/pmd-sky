	.include "asm/macros.inc"
	.include "main_02055894.inc"

	.text

	arm_func_start sub_02055894
sub_02055894: ; 0x02055894
	ldr r1, _020558EC ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0
	ldr r2, [r1]
	ldr r1, _020558F0 ; =0x0000022B
	b _020558DC
_020558A8:
	cmp r2, r0
	bne _020558D4
	ldrb r0, [r2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020558E4
	mov r0, r3, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
_020558D4:
	add r3, r3, #1
	add r2, r2, #0x44
_020558DC:
	cmp r3, r1
	blt _020558A8
_020558E4:
	mvn r0, #0
	bx lr
	.align 2, 0
_020558EC: .word TEAM_MEMBER_TABLE_PTR
_020558F0: .word 0x0000022B
	arm_func_end sub_02055894

	arm_func_start GetFirstMatchingMemberIdx
GetFirstMatchingMemberIdx: ; 0x020558F4
	stmdb sp!, {r4, lr}
	ldr r1, _0205595C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #5
	ldr r1, [r1]
	mov r3, #0
	add lr, r1, #0x154
	mov ip, #1
	ldr r1, _02055960 ; =0x0000022B
	b _0205594C
_02055918:
	ldrb r2, [lr]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02055944
	ldrsh r2, [lr, #4]
	cmp r2, r0
	moveq r0, r4, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, pc}
_02055944:
	add r4, r4, #1
	add lr, lr, #0x44
_0205594C:
	cmp r4, r1
	blt _02055918
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205595C: .word TEAM_MEMBER_TABLE_PTR
_02055960: .word 0x0000022B
	arm_func_end GetFirstMatchingMemberIdx

	arm_func_start GetFirstEmptyMemberIdx
GetFirstEmptyMemberIdx: ; 0x02055964
	stmdb sp!, {r3, lr}
	ldr r1, _020559CC ; =TEAM_MEMBER_TABLE_PTR
	cmp r0, #0x214
	ldr r0, [r1]
	ldreq lr, _020559D0 ; =0x0000022B
	add r3, r0, #0x154
	ldrne r0, _020559D4 ; =_022B5788
	mov ip, #5
	ldrne lr, [r0]
	mov r0, #0
	mov r1, #1
	b _020559BC
_02055994:
	ldrb r2, [r3]
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	add ip, ip, #1
	add r3, r3, #0x44
_020559BC:
	cmp ip, lr
	blt _02055994
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020559CC: .word TEAM_MEMBER_TABLE_PTR
_020559D0: .word 0x0000022B
_020559D4: .word _022B5788
	arm_func_end GetFirstEmptyMemberIdx

	arm_func_start sub_020559D8
sub_020559D8: ; 0x020559D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02055B18 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr lr, [r1]
	mov r8, r0
	mov r2, r4
	mov r3, #1
	mvn r1, #0
_020559F8:
	ldrb r0, [lr]
	add lr, lr, #0x44
	tst r0, #1
	movne r0, r3
	moveq r0, r2
	tst r0, #0xff
	mov r0, r4, lsl #1
	strneh r4, [r8, r0]
	add r4, r4, #1
	streqh r1, [r8, r0]
	cmp r4, #5
	blt _020559F8
	mov r2, #0
	mov r3, #1
	ldr r0, _02055B1C ; =0x0000022B
	b _02055B0C
_02055A38:
	ldrb r1, [lr]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	bne _02055AFC
	mvn ip, #0
	mov r0, r4, lsl #1
	mov r7, lr
	mov r6, r4
	strh ip, [r8, r0]
	add lr, lr, #0x44
	add r4, r4, #1
	add sb, ip, #0x22c
	b _02055AD4
_02055A74:
	ldrb r0, [lr]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02055AC4
	mov r5, r7
	mov fp, lr
	add r7, r7, #0x44
	mov sl, #4
_02055A9C:
	ldmia fp!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs sl, sl, #1
	bne _02055A9C
	ldr r0, [fp]
	str r0, [r5]
	mov r0, r4, lsl #1
	strh r6, [r8, r0]
	add r6, r6, #1
	b _02055ACC
_02055AC4:
	mov r0, r4, lsl #1
	strh ip, [r8, r0]
_02055ACC:
	add r4, r4, #1
	add lr, lr, #0x44
_02055AD4:
	cmp r4, sb
	blt _02055A74
	mov r1, #0
	ldr r0, _02055B1C ; =0x0000022B
	b _02055AF0
_02055AE8:
	strb r1, [r7], #0x44
	add r6, r6, #1
_02055AF0:
	cmp r6, r0
	blt _02055AE8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02055AFC:
	mov r1, r4, lsl #1
	strh r4, [r8, r1]
	add r4, r4, #1
	add lr, lr, #0x44
_02055B0C:
	cmp r4, r0
	blt _02055A38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02055B18: .word TEAM_MEMBER_TABLE_PTR
_02055B1C: .word 0x0000022B
	arm_func_end sub_020559D8

	arm_func_start sub_02055B20
sub_02055B20: ; 0x02055B20
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02055B74 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	smulbb r4, r0, r1
	cmp r0, #5
	ldr r5, [r2]
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, r4]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_020564B0
	cmp r0, #0
	mov r0, #0
	streqb r0, [r5, r4]
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02055B74: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02055B20

	arm_func_start sub_02055B78
sub_02055B78: ; 0x02055B78
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x58
	ldr r4, _02055CC4 ; =TEAM_MEMBER_TABLE_PTR
	mov lr, #1
	mov r6, r1
	mov r7, r0
	mov ip, #0
	ldr r4, [r4]
	mov r1, #0x44
	mov r0, r6
	mov r5, r3
	strb lr, [sp, #0x14]
	strb r2, [sp, #0x16]
	strb ip, [sp, #0x17]
	strb lr, [sp, #0x15]
	smlabb r4, r7, r1, r4
	bl GetBaseHp
	strh r0, [sp, #0x1e]
	mov r0, r6
	mov r1, #0
	bl GetBaseOffensiveStat
	strb r0, [sp, #0x20]
	mov r0, r6
	mov r1, #1
	bl GetBaseOffensiveStat
	strb r0, [sp, #0x21]
	mov r0, r6
	mov r1, #0
	bl GetBaseDefensiveStat
	strb r0, [sp, #0x22]
	mov r0, r6
	mov r1, #1
	bl GetBaseDefensiveStat
	strb r0, [sp, #0x23]
	mov r0, #0
	mov r2, #1
	strb r0, [sp, #0x1a]
	strb r0, [sp, #0x1b]
	add r0, sp, #0x28
	mov r1, r6
	strh r2, [sp, #0x1c]
	bl EnableAllLearnableIqSkills
	mov r2, #0
	add r0, sp, #0x36
	mov r1, r6
	strh r6, [sp, #0x18]
	str r2, [sp, #0x24]
	strb r2, [sp, #0x34]
	bl sub_02053F10
	cmp r5, #0
	beq _02055C58
	add r0, sp, #0x4e
	mov r1, r5
	mov r2, #0xa
	bl StrncpySimple
	b _02055C74
_02055C58:
	add r0, sp, #0
	mov r1, r6
	bl GetNameRaw
	add r0, sp, #0x4e
	add r1, sp, #0
	mov r2, #0xa
	bl StrncpyName
_02055C74:
	add r6, sp, #0x14
	mov r5, #4
_02055C7C:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _02055C7C
	ldr r0, [r6]
	cmp r7, #0
	str r0, [r4]
	cmpne r7, #2
	mov r0, r7
	bne _02055CAC
	bl TryAddMonsterToActiveTeam
	b _02055CB0
_02055CAC:
	bl sub_02056554
_02055CB0:
	ldr r0, _02055CC8 ; =_020A3350
	mov r1, r7
	bl Debug_Print0
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02055CC4: .word TEAM_MEMBER_TABLE_PTR
_02055CC8: .word _020A3350
	arm_func_end sub_02055B78

	arm_func_start sub_02055CCC
sub_02055CCC: ; 0x02055CCC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldrsh r0, [r5, #4]
	bl GetFirstEmptyMemberIdx
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	beq _02055D38
	ldr r1, _02055D40 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x44
	ldr r1, [r1]
	mov r6, r5
	smlabb lr, r4, r0, r1
	mov ip, #4
_02055D04:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02055D04
	ldr r0, [r6]
	str r0, [lr]
	ldrsh r0, [r5, #4]
	bl SetPokemonJoined
	ldrsh r0, [r5, #4]
	cmp r0, #0x214
	ldreq r1, _02055D44 ; =0x0000022B
	ldreq r0, _02055D48 ; =_022B5788
	streq r1, [r0]
_02055D38:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02055D40: .word TEAM_MEMBER_TABLE_PTR
_02055D44: .word 0x0000022B
_02055D48: .word _022B5788
	arm_func_end sub_02055CCC

	arm_func_start sub_02055D4C
sub_02055D4C: ; 0x02055D4C
	stmdb sp!, {r3, lr}
	bl sub_02055CCC
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _02055D78 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02055D78: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02055D4C

	arm_func_start sub_02055D7C
sub_02055D7C: ; 0x02055D7C
	stmdb sp!, {r3, r4, r5, lr}
	mvn r2, #0
	mov r5, r1
	cmp r0, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _02055DCC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	mov r4, r5
	smlabb lr, r0, r1, r2
	mov ip, #4
_02055DA8:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02055DA8
	ldr r0, [r4]
	str r0, [lr]
	ldrsh r0, [r5, #4]
	bl SetPokemonJoined
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02055DCC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02055D7C

	arm_func_start sub_02055DD0
sub_02055DD0: ; 0x02055DD0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x4c
	ldrb ip, [sp, #0x58]
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	add r0, sp, #8
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl sub_02052CF4
	add r0, sp, #8
	bl sub_02055D4C
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
	arm_func_end sub_02055DD0

	arm_func_start sub_02055E14
sub_02055E14: ; 0x02055E14
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, r1
	ldrb r1, [r3]
	mov r4, r0
	add r0, r3, #0x14
	and r1, r1, #1
	strh r1, [r4]
	ldrb r1, [r3, #1]
	add r6, r4, #0x18
	add r5, r3, #0x22
	strb r1, [r4, #4]
	ldrb r1, [r3, #2]
	add lr, r4, #0x2a
	mov ip, #0xc
	strb r1, [r4, #5]
	ldrb r1, [r3, #3]
	strb r1, [r4, #6]
	ldrsh r1, [r3, #4]
	strh r1, [r4, #8]
	ldrb r1, [r3, #6]
	strb r1, [r4, #0xa]
	ldrb r1, [r3, #7]
	strb r1, [r4, #0xb]
	ldrsh r1, [r3, #8]
	strh r1, [r4, #0xc]
	ldrsh r1, [r3, #0xa]
	strh r1, [r4, #0xe]
	ldrb r1, [r3, #0xc]
	strb r1, [r4, #0x10]
	ldrb r1, [r3, #0xd]
	strb r1, [r4, #0x11]
	ldrb r1, [r3, #0xe]
	strb r1, [r4, #0x12]
	ldrb r1, [r3, #0xf]
	strb r1, [r4, #0x13]
	ldmia r0, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	ldr r0, [r3, #0x10]
	str r0, [r4, #0x14]
	ldrb r0, [r3, #0x20]
	strb r0, [r4, #0x24]
_02055EB8:
	ldrh r0, [r5], #2
	subs ip, ip, #1
	strh r0, [lr], #2
	bne _02055EB8
	add r0, r4, #0x42
	add r1, r3, #0x3a
	mov r2, #0xa
	bl StrncpySimple
	mov r2, #0
	mov r1, r2
_02055EE0:
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #2]
	cmp r2, #2
	blt _02055EE0
	strb r1, [r4, #0x25]
	strh r1, [r4, #0x26]
	strh r1, [r4, #0x28]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02055E14

	arm_func_start sub_02055F04
sub_02055F04: ; 0x02055F04
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, r1
	ldrh r1, [r3]
	mov ip, r0
	add r0, r3, #0x18
	and r1, r1, #1
	strb r1, [ip]
	ldrb r1, [r3, #4]
	add r6, ip, #0x14
	add r5, r3, #0x2a
	strb r1, [ip, #1]
	ldrb r1, [r3, #5]
	add r4, ip, #0x22
	mov lr, #0xc
	strb r1, [ip, #2]
	ldrb r1, [r3, #6]
	strb r1, [ip, #3]
	ldrsh r1, [r3, #8]
	strh r1, [ip, #4]
	ldrb r1, [r3, #0xa]
	strb r1, [ip, #6]
	ldrb r1, [r3, #0xb]
	strb r1, [ip, #7]
	ldrsh r1, [r3, #0xc]
	strh r1, [ip, #8]
	ldrsh r1, [r3, #0xe]
	strh r1, [ip, #0xa]
	ldrb r1, [r3, #0x10]
	strb r1, [ip, #0xc]
	ldrb r1, [r3, #0x11]
	strb r1, [ip, #0xd]
	ldrb r1, [r3, #0x12]
	strb r1, [ip, #0xe]
	ldrb r1, [r3, #0x13]
	strb r1, [ip, #0xf]
	ldmia r0, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	ldr r0, [r3, #0x14]
	str r0, [ip, #0x10]
	ldrb r0, [r3, #0x24]
	strb r0, [ip, #0x20]
_02055FA8:
	ldrh r0, [r5], #2
	subs lr, lr, #1
	strh r0, [r4], #2
	bne _02055FA8
	add r0, ip, #0x3a
	add r1, r3, #0x42
	mov r2, #0xa
	bl StrncpySimple
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02055F04

	arm_func_start sub_02055FCC
sub_02055FCC: ; 0x02055FCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsValidTeamMember
	cmp r0, #0
	beq _02056068
	mov r0, r4
	bl GetItemMoveId16
	mov r4, r0
	mov r0, r5
	bl GetTeamMember
	mov lr, #0
	mov r3, lr
	mov ip, #1
	mov r2, #6
	b _02056040
_0205600C:
	smlabb r5, lr, r2, r0
	ldrb r1, [r5, #0x22]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	beq _02056034
	ldrh r1, [r5, #0x24]
	cmp r4, r1
	beq _02056048
_02056034:
	add r1, lr, #1
	mov r1, r1, lsl #0x10
	mov lr, r1, asr #0x10
_02056040:
	cmp lr, #4
	blt _0205600C
_02056048:
	cmp lr, #4
	blt _02056068
	ldrsh r1, [r0, #4]
	mov r0, r4
	bl sub_02053D1C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02056068:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02055FCC

	arm_func_start IsMonsterNotNicknamed
IsMonsterNotNicknamed: ; 0x02056070
	ldr ip, _02056080 ; =StrcmpMonsterName
	ldrsh r1, [r0, #4]
	add r0, r0, #0x3a
	bx ip
	.align 2, 0
_02056080: .word StrcmpMonsterName
	arm_func_end IsMonsterNotNicknamed

	arm_func_start GetRecoloredGroundMonsterName
GetRecoloredGroundMonsterName: ; 0x02056084
	ldr ip, _02056090 ; =RecolorNameString
	add r1, r1, #0x3a
	bx ip
	.align 2, 0
_02056090: .word RecolorNameString
	arm_func_end GetRecoloredGroundMonsterName

	arm_func_start sub_02056094
sub_02056094: ; 0x02056094
	ldr ip, _020560A0 ; =RecolorTeamMemberNameString
	add r1, r1, #0x3a
	bx ip
	.align 2, 0
_020560A0: .word RecolorTeamMemberNameString
	arm_func_end sub_02056094

	arm_func_start sub_020560A4
sub_020560A4: ; 0x020560A4
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_020560A4

	arm_func_start sub_020560B8
sub_020560B8: ; 0x020560B8
	ldr ip, _020560C4 ; =SetActiveTeam
	mov r0, #0
	bx ip
	.align 2, 0
_020560C4: .word SetActiveTeam
	arm_func_end sub_020560B8

	arm_func_start RemoveActiveMembersFromAllTeams
RemoveActiveMembersFromAllTeams: ; 0x020560C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov lr, #0
	ldr r7, _02056154 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, lr
	mvn r0, #0
	mov r2, lr
	mov r4, #0x68
	mov r6, #0x1a0
_020560E8:
	mul ip, lr, r6
	mov r3, r2
_020560F0:
	ldr r5, [r7]
	add r5, ip, r5
	mla r5, r3, r4, r5
	add r5, r5, #0x9000
	strb r1, [r5, #0x36c]
	ldr r5, [r7]
	add r5, r5, lr, lsl #3
	add r5, r5, r3, lsl #1
	add r5, r5, #0x9800
	add r3, r3, #1
	strh r0, [r5, #0x56]
	cmp r3, #4
	blt _020560F0
	ldr r3, [r7]
	add r3, r3, lr, lsl #1
	add r3, r3, #0x9800
	strh r0, [r3, #0x50]
	ldr r3, [r7]
	add r3, r3, lr
	add r3, r3, #0x9000
	add lr, lr, #1
	strb r1, [r3, #0x874]
	cmp lr, #3
	blt _020560E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02056154: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RemoveActiveMembersFromAllTeams

	arm_func_start RemoveActiveMembersFromSpecialEpisodeTeam
RemoveActiveMembersFromSpecialEpisodeTeam: ; 0x02056158
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _020561BC ; =TEAM_MEMBER_TABLE_PTR
	mov r0, lr
	mvn ip, #0
	mov r1, #0x68
_02056170:
	ldr r2, [r3]
	mla r2, lr, r1, r2
	add r2, r2, #0x9000
	strb r0, [r2, #0x50c]
	ldr r2, [r3]
	add r2, r2, lr, lsl #1
	add r2, r2, #0x9800
	add lr, lr, #1
	strh ip, [r2, #0x5e]
	cmp lr, #4
	blt _02056170
	ldr r2, _020561BC ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r2]
	add r1, r1, #0x9800
	strh ip, [r1, #0x52]
	ldr r1, [r2]
	add r1, r1, #0x9000
	strb r0, [r1, #0x875]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020561BC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RemoveActiveMembersFromSpecialEpisodeTeam

	arm_func_start RemoveActiveMembersFromRescueTeam
RemoveActiveMembersFromRescueTeam: ; 0x020561C0
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _02056224 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, lr
	mvn ip, #0
	mov r1, #0x68
_020561D8:
	ldr r2, [r3]
	mla r2, lr, r1, r2
	add r2, r2, #0x9000
	strb r0, [r2, #0x6ac]
	ldr r2, [r3]
	add r2, r2, lr, lsl #1
	add r2, r2, #0x9800
	add lr, lr, #1
	strh ip, [r2, #0x66]
	cmp lr, #4
	blt _020561D8
	ldr r2, _02056224 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r2]
	add r1, r1, #0x9800
	strh ip, [r1, #0x54]
	ldr r1, [r2]
	add r1, r1, #0x9000
	strb r0, [r1, #0x876]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02056224: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RemoveActiveMembersFromRescueTeam

	arm_func_start sub_02056228
sub_02056228: ; 0x02056228
	ldr r1, _0205625C ; =0x000055AA
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	ldr r1, _02056260 ; =0x00005AA5
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205625C: .word 0x000055AA
_02056260: .word 0x00005AA5
	arm_func_end sub_02056228

	arm_func_start CheckTeamMemberIdx
CheckTeamMemberIdx: ; 0x02056264
	ldr r1, _0205628C ; =0x000055AA
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	ldr r1, _02056290 ; =0x00005AA5
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205628C: .word 0x000055AA
_02056290: .word 0x00005AA5
	arm_func_end CheckTeamMemberIdx

	arm_func_start IsMonsterIdInNormalRange
IsMonsterIdInNormalRange: ; 0x02056294
	cmp r0, #0
	blt _020562AC
	ldr r1, _020562B4 ; =0x0000022B
	cmp r0, r1
	movlt r0, #1
	bxlt lr
_020562AC:
	mov r0, #0
	bx lr
	.align 2, 0
_020562B4: .word 0x0000022B
	arm_func_end IsMonsterIdInNormalRange

	arm_func_start sub_020562B8
sub_020562B8: ; 0x020562B8
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_020562B8

	arm_func_start SetActiveTeam
SetActiveTeam: ; 0x020562CC
	ldr r3, _02056314 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x1a0
	ldr r1, [r3]
	add r1, r1, #0x9000
	strb r0, [r1, #0x877]
	ldr ip, [r3]
	add r1, ip, #0x36c
	add r1, r1, #0x9000
	mla r2, r0, r2, r1
	add r1, ip, #0x9000
	str r2, [r1, #0x84c]
	ldr r2, [r3]
	add r1, r2, #0x56
	add r1, r1, #0x9800
	add r1, r1, r0, lsl #3
	add r0, r2, #0x9000
	str r1, [r0, #0x870]
	bx lr
	.align 2, 0
_02056314: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end SetActiveTeam

	arm_func_start sub_02056318
sub_02056318: ; 0x02056318
	ldr r1, _02056338 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	add r1, r2, r1
	add r1, r1, #0x9000
	strb r0, [r1, #0x874]
	bx lr
	.align 2, 0
_02056338: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056318

	arm_func_start sub_0205633C
sub_0205633C: ; 0x0205633C
	ldr r0, _0205635C ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r1, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r1, r0
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x874]
	bx lr
	.align 2, 0
_0205635C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205633C

	arm_func_start sub_02056360
sub_02056360: ; 0x02056360
	ldr r0, _02056388 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r1, [r0, #0x874]
	cmp r1, #0
	ldreqb r0, [r0, #0x875]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02056388: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056360

	arm_func_start GetActiveTeamMember
GetActiveTeamMember: ; 0x0205638C
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r1, _020563B8 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r1, [r1]
	add r1, r1, #0x9000
	ldr r1, [r1, #0x84c]
	smlabb r0, r0, r2, r1
	bx lr
	.align 2, 0
_020563B8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetActiveTeamMember

	arm_func_start GetActiveRosterIndex
GetActiveRosterIndex: ; 0x020563BC
	mvn r1, #0
	cmp r0, r1
	beq _02056404
	ldr r1, _0205640C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr r1, [r1]
	add r1, r1, #0x9000
	b _020563FC
_020563DC:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	bxeq lr
	add ip, ip, #1
_020563FC:
	cmp ip, #4
	blt _020563DC
_02056404:
	mvn r0, #0
	bx lr
	.align 2, 0
_0205640C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetActiveRosterIndex

	arm_func_start sub_02056410
sub_02056410: ; 0x02056410
	mvn r1, #0
	cmp r0, r1
	beq _02056454
	ldr r1, _0205645C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr r1, [r1]
	add r1, r1, #0x9000
	b _0205644C
_02056430:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_0205644C:
	cmp ip, #4
	blt _02056430
_02056454:
	mov r0, #0
	bx lr
	.align 2, 0
_0205645C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056410

	arm_func_start sub_02056460
sub_02056460: ; 0x02056460
	mvn r2, #0
	cmp r0, r2
	beq _020564A4
	ldr r2, _020564AC ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0
	ldr r2, [r2]
	add r2, r2, r1, lsl #3
	b _0205649C
_02056480:
	add r1, r2, r3, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r3, r3, #1
_0205649C:
	cmp r3, #4
	blt _02056480
_020564A4:
	mov r0, #0
	bx lr
	.align 2, 0
_020564AC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056460
