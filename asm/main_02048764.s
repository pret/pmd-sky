	.include "asm/macros.inc"
	.include "main_02048764.inc"

	.text

	arm_func_start sub_02048764
sub_02048764: ; 0x02048764
	stmdb sp!, {r4, lr}
	ldr lr, _02048790 ; =DEFAULT_HERO_ID
	mov r4, r0
	mov ip, #3
_02048774:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02048774
	ldmia lr, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	ldmia sp!, {r4, pc}
	.align 2, 0
_02048790: .word DEFAULT_HERO_ID
	arm_func_end sub_02048764

	arm_func_start sub_02048794
sub_02048794: ; 0x02048794
	stmdb sp!, {r4, lr}
	ldr lr, _020487C0 ; =DEFAULT_HERO_ID
	mov r4, r0
	mov ip, #3
_020487A4:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _020487A4
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldmia sp!, {r4, pc}
	.align 2, 0
_020487C0: .word DEFAULT_HERO_ID
	arm_func_end sub_02048794

	arm_func_start InitMainTeamAfterQuiz
InitMainTeamAfterQuiz: ; 0x020487C4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	mov r4, #0
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _020487FC
	ldr r1, _020489F8 ; =0x00000232
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _020489FC ; =_020AFF00
	add r1, sp, #0
	mov r2, #0xa
	bl StrncpyName
_020487FC:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	bne _02048828
	ldr r1, _02048A00 ; =0x00000233
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r0, _02048A04 ; =_020AFF14
	add r1, sp, #0
	mov r2, #0xa
	bl StrncpyName
_02048828:
	bl GetHeroMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02048898
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldr r3, _020489FC ; =_020AFF00
	ldrsh r1, [r0, #4]
	mov r0, #0
	mov r2, #0xd6
	bl sub_02055B78
	bl GetHero
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r4, r0
	ldrsh r2, [r1, #4]
	mov r0, #0
	mov r1, #0x3e
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x3f
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	mov r0, r4
	mov r1, #5
	mov r2, #0
	bl ApplyLevelUpBoostsToGroundMonster
	mov r0, r4
	bl sub_02053568
	mov r4, #1
_02048898:
	bl GetPartnerMemberIdx
	mvn r1, #0
	cmp r0, r1
	bne _02048908
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldr r3, _02048A04 ; =_020AFF14
	ldrsh r1, [r0, #6]
	mov r0, #1
	mov r2, #0xd7
	bl sub_02055B78
	bl GetPartner
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r4, r0
	ldrsh r2, [r1, #6]
	mov r0, #0
	mov r1, #0x40
	bl SaveScriptVariableValue
	add r1, r4, #0x3a
	mov r0, #0x41
	mov r2, #0xa
	bl SaveScriptVariableValueBytes
	mov r0, r4
	mov r1, #5
	mov r2, #0
	bl ApplyLevelUpBoostsToGroundMonster
	mov r0, r4
	bl sub_02053568
	mov r4, #1
_02048908:
	cmp r4, #0
	beq _02048914
	bl SetTeamSetupHeroAndPartnerOnly
_02048914:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrsh r0, [r0, #4]
	cmp r0, #0
	beq _02048940
	bl GetMonsterGenderVeneer
	cmp r0, #2
	moveq r2, #5
	movne r2, #4
	mov r0, #0
	mov r1, #0x42
	bl SaveScriptVariableValue
_02048940:
	ldr r0, _020489F4 ; =NOTIFY_NOTE
	ldrsh r1, [r0, #6]
	cmp r1, #0
	beq _02048980
	ldr r0, _02048A08 ; =PARTNER_TALK_KIND_TABLE
	b _02048964
_02048958:
	cmp r1, r2
	beq _02048970
	add r0, r0, #8
_02048964:
	ldrsh r2, [r0, #4]
	cmp r2, #0
	bne _02048958
_02048970:
	ldr r2, [r0]
	mov r0, #0
	mov r1, #0x43
	bl SaveScriptVariableValue
_02048980:
	ldr r1, _020489F4 ; =NOTIFY_NOTE
	mov r0, #0
	ldr r2, [r1, #0x30]
	mov r1, #0x45
	bl SaveScriptVariableValue
	mov r0, #1
	bl sub_02048C0C
	bl sub_02048C3C
	mvn r1, #0
	cmp r0, r1
	bne _020489B4
	bl Rand32Bit
	bl sub_02048C4C
_020489B4:
	bl GetGameMode
	cmp r0, #1
	bhi _020489CC
	mov r0, #2
	bl SetBothScreensWindowsColor
	b _020489EC
_020489CC:
	mov r0, #0
	mov r1, #0x42
	bl LoadScriptVariableValue
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl SetBothScreensWindowsColor
_020489EC:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020489F4: .word NOTIFY_NOTE
#ifdef JAPAN
_020489F8: .word 0x000004C3
_020489FC: .word _020AFF00
_02048A00: .word 0x000004C4
#else
_020489F8: .word 0x00000232
_020489FC: .word _020AFF00
_02048A00: .word 0x00000233
#endif
_02048A04: .word _020AFF14
_02048A08: .word PARTNER_TALK_KIND_TABLE
	arm_func_end InitMainTeamAfterQuiz

	arm_func_start InitSpecialEpisodePartners
InitSpecialEpisodePartners: ; 0x02048A0C
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02048A6C
_02048A20: ; jump table
	b _02048A6C ; case 0
	b _02048A34 ; case 1
	b _02048A6C ; case 2
	b _02048A44 ; case 3
	b _02048A60 ; case 4
_02048A34:
	ldr r1, _02048A74 ; =_020A28A8
	mov r0, #3
	bl AssignSpecialEpisodePc
	b _02048A6C
_02048A44:
	ldr r1, _02048A78 ; =_020A2858
	mov r0, #3
	bl AssignSpecialEpisodePc
	ldr r1, _02048A7C ; =_020A281C
	mov r0, #4
	bl AssignSpecialEpisodePc
	b _02048A6C
_02048A60:
	ldr r1, _02048A80 ; =_020A286C
	mov r0, #3
	bl AssignSpecialEpisodePc
_02048A6C:
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048A74: .word _020A28A8
_02048A78: .word _020A2858
_02048A7C: .word _020A281C
_02048A80: .word _020A286C
	arm_func_end InitSpecialEpisodePartners

	arm_func_start InitSpecialEpisodeExtraPartner
InitSpecialEpisodeExtraPartner: ; 0x02048A84
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02048AB8
_02048A98: ; jump table
	b _02048AB8 ; case 0
	b _02048AB8 ; case 1
	b _02048AB8 ; case 2
	b _02048AB8 ; case 3
	b _02048AAC ; case 4
_02048AAC:
	ldr r1, _02048AC0 ; =SPECIAL_EPISODE_MAIN_CHARACTERS
	mov r0, #4
	bl AssignSpecialEpisodePc
_02048AB8:
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048AC0: .word SPECIAL_EPISODE_MAIN_CHARACTERS
	arm_func_end InitSpecialEpisodeExtraPartner

	arm_func_start AssignSpecialEpisodePc
AssignSpecialEpisodePc: ; 0x02048AC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrsh r1, [r5]
	ldrb r2, [r5, #2]
	mov r4, r0
	mov r3, #0
	bl sub_02055B78
	mov r0, r4
	bl GetTeamMember
	ldrsh r1, [r5, #0xe]
	ldrb r2, [r5, #0xc]
	mov r4, r0
	bl ApplyLevelUpBoostsToGroundMonster
	ldrsh r0, [r5, #0x12]
	cmp r0, #0
	strneh r0, [r4, #0xa]
	ldrsh r2, [r5, #0x10]
	add r0, r4, #0x14
	strh r2, [r4, #8]
	ldrsh r1, [r4, #4]
	bl EnableAllLearnableIqSkills
	ldrh r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0xc]
	add r1, r5, #4
	cmp r0, #0
	add r0, r4, #0x22
	beq _02048B40
	bl LearnMoves
	ldmia sp!, {r3, r4, r5, pc}
_02048B40:
	bl GetInfoGroundMoveset
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AssignSpecialEpisodePc
