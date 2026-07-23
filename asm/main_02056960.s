	.include "asm/macros.inc"
	.include "main_02056960.inc"

	.text

	arm_func_start RemoveActiveMembersFromMainTeam
RemoveActiveMembersFromMainTeam: ; 0x02056960
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	ldr r2, _020569C8 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, r0
	mvn ip, #0
	mov r3, #1
_02056978:
	ldr r1, [r2]
	mov lr, r5, lsl #1
	add r1, r1, #0x9000
	ldr r4, [r1, #0x870]
	add r5, r5, #1
	ldrsh r1, [r4, lr]
	cmp r1, ip
	movne r0, r3
	strneh ip, [r4, lr]
	cmp r5, #4
	blt _02056978
	ldr r1, _020569C8 ; =TEAM_MEMBER_TABLE_PTR
	mvn r2, #0
	ldr r3, [r1]
	add r1, r3, #0x9000
	ldrb r1, [r1, #0x877]
	add r1, r3, r1, lsl #1
	add r1, r1, #0x9800
	strh r2, [r1, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020569C8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RemoveActiveMembersFromMainTeam

	arm_func_start SetTeamSetupHeroAndPartnerOnly
SetTeamSetupHeroAndPartnerOnly: ; 0x020569CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetMainCharacter1MemberIdx
	mov r5, r0
	bl GetMainCharacter2MemberIdx
	mov r6, r0
	bl GetMainCharacter3MemberIdx
#ifdef JAPAN
	mov sl, #0
	ldr r1, _02056AAC ; =TEAM_MEMBER_TABLE_PTR
	mov r7, r0
	ldr r0, [r1]
	mov fp, sl
	add r0, r0, #0x9000
	ldr sb, [r0, #0x84c]
#else
	mov r8, #0
	ldr r1, _02056AAC ; =TEAM_MEMBER_TABLE_PTR
	mov r7, r0
	ldr r1, [r1]
	mov sl, r8
	add r0, r1, #0x9000
	ldr sb, [r0, #0x84c]
	mov fp, r8
#endif
	mov r4, #1
_02056A08:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	ldrnesh r0, [sb, #8]
	cmpne r0, r5
	cmpne r0, r6
	cmpne r0, r7
	beq _02056A40
	mov r0, sl, lsl #0x10
	mov r0, r0, asr #0x10
	mov r8, #1
	bl sub_02058138
_02056A40:
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #0x68
	blt _02056A08
	bl RemoveActiveMembersFromMainTeam
	mvn r0, #0
	cmp r5, r0
	beq _02056A68
	mov r0, r5
	bl TryAddMonsterToActiveTeam
_02056A68:
	mvn r0, #0
	cmp r6, r0
	beq _02056A7C
	mov r0, r6
	bl sub_02056554
_02056A7C:
	mvn r0, #0
	cmp r7, r0
	beq _02056A90
	mov r0, r7
	bl sub_02056554
_02056A90:
	ldr r0, _02056AAC ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02056AAC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end SetTeamSetupHeroAndPartnerOnly

	arm_func_start SetTeamSetupHeroOnly
SetTeamSetupHeroOnly: ; 0x02056AB0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bl GetAppointedLeaderMemberIdx
	ldr r1, _02056B54 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, r0
#ifdef JAPAN
	ldr r0, [r1]
	mov sl, #0
	add r0, r0, #0x9000
	mov r6, #1
	ldr sb, [r0, #0x84c]
	mov r5, sl
#else
	mov r8, #0
	ldr r1, [r1]
	mov r6, #1
	add r0, r1, #0x9000
	ldr sb, [r0, #0x84c]
	mov sl, r8
	mov r5, r8
#endif
	mov r4, r6
_02056AE0:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	ldrnesh r0, [sb, #8]
	cmpne r0, r7
	beq _02056B10
	mov r0, sl, lsl #0x10
	mov r0, r0, asr #0x10
	mov r8, r4
	bl sub_02058138
_02056B10:
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #0x68
	blt _02056AE0
	bl RemoveActiveMembersFromMainTeam
	mvn r0, #0
	cmp r7, r0
	beq _02056B38
	mov r0, r7
	bl TryAddMonsterToActiveTeam
_02056B38:
	ldr r0, _02056B54 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056B54: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end SetTeamSetupHeroOnly

	arm_func_start sub_02056B58
sub_02056B58: ; 0x02056B58
	stmdb sp!, {r3, lr}
	ldr r2, _02056BD0 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, [r2]
	add r0, ip, #0x9000
	ldrb r3, [r0, #0x877]
	cmp r3, #2
	ldmneia sp!, {r3, pc}
	add r0, ip, #0x9800
	ldrsh r1, [r0, #0x50]
	add r0, ip, r3, lsl #1
	add r0, r0, #0x9800
	strh r1, [r0, #0x50]
	mov lr, #0
_02056B8C:
	ldr r1, [r2]
	mov ip, lr, lsl #1
	add r0, r1, lr, lsl #1
	add r0, r0, #0x9800
	add r1, r1, #0x9000
	ldrsh r3, [r0, #0x56]
	ldr r0, [r1, #0x870]
	add lr, lr, #1
	strh r3, [r0, ip]
	cmp lr, #4
	blt _02056B8C
	ldr r0, _02056BD0 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	ldmia sp!, {r3, pc}
	.align 2, 0
_02056BD0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056B58

	arm_func_start sub_02056BD4
sub_02056BD4: ; 0x02056BD4
	stmdb sp!, {r3, lr}
	ldr r0, _02056C1C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	bl RemoveActiveMembersFromMainTeam
	bl GetHeroMemberIdx
	bl TryAddMonsterToActiveTeam
	bl GetPartnerMemberIdx
	bl sub_02056554
	ldr r0, _02056C1C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	ldmia sp!, {r3, pc}
	.align 2, 0
_02056C1C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056BD4

	arm_func_start GetPartyMembers
GetPartyMembers: ; 0x02056C20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, r0
	bl GetAppointedLeaderMemberIdx
	mov r6, r0
	bl GetMainCharacter1MemberIdx
	mov r7, r0
	bl GetMainCharacter2MemberIdx
	mov r8, r0
	bl GetMainCharacter3MemberIdx
	mov sb, r0
	cmp r5, #0
	mvn r0, #0
	addeq r5, sp, #0
	cmp r6, r0
	mov r4, #0
	mvn r0, #0
	strneh r6, [r5]
	addne r4, r4, #1
	cmp r7, r0
	beq _02056C90
	mov r0, r7
	bl sub_02056410
	cmp r0, #0
	cmpne r7, r6
	movne r0, r4, lsl #1
	strneh r7, [r5, r0]
	addne r4, r4, #1
_02056C90:
	mvn r0, #0
	cmp r8, r0
	beq _02056CB8
	mov r0, r8
	bl sub_02056410
	cmp r0, #0
	cmpne r8, r6
	movne r0, r4, lsl #1
	strneh r8, [r5, r0]
	addne r4, r4, #1
_02056CB8:
	mvn r0, #0
	cmp sb, r0
	beq _02056CE0
	mov r0, sb
	bl sub_02056410
	cmp r0, #0
	cmpne sb, r6
	movne r0, r4, lsl #1
	strneh sb, [r5, r0]
	addne r4, r4, #1
_02056CE0:
	ldr r0, _02056D6C ; =TEAM_MEMBER_TABLE_PTR
	mov r8, #0
	ldr r0, [r0]
	mov r6, r8
	add r0, r0, #0x9000
	ldr sb, [r0, #0x84c]
	mov r7, #1
	b _02056D58
_02056D00:
	ldrb r0, [sb]
	tst r0, #2
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02056D50
	ldrsh sl, [sb, #8]
	mov r0, sl
	bl sub_020564B0
	cmp r0, #0
	bne _02056D50
	mov r0, sl
	bl IsMainCharacter
	cmp r0, #0
	bne _02056D50
	mov r0, r4, lsl #1
	add r4, r4, #1
	strh sl, [r5, r0]
	cmp r4, #4
	bge _02056D60
_02056D50:
	add r8, r8, #1
	add sb, sb, #0x68
_02056D58:
	cmp r8, #4
	blt _02056D00
_02056D60:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056D6C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetPartyMembers
