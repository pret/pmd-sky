	.include "asm/macros.inc"
	.include "main_020484C0.inc"

	.text

	arm_func_start sub_020484C0
sub_020484C0: ; 0x020484C0
	stmdb sp!, {r3, lr}
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	bl sub_02048C5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020484C0

	arm_func_start InitSpecialEpisodeHero
InitSpecialEpisodeHero: ; 0x020484E8
	stmdb sp!, {r4, lr}
	bl GetSpecialEpisodeType
	mov r4, r0
	bl sub_02052CD8
	bl sub_0200CAD4
	bl sub_0204CDB8
	mov r0, r4
	mov r1, #1
	bl SetSpecialEpisodeOpenOld
	cmp r4, #4
	addls pc, pc, r4, lsl #2
	b _02048578
_02048518: ; jump table
	b _0204852C ; case 0
	b _0204853C ; case 1
	b _0204854C ; case 2
	b _0204855C ; case 3
	b _0204856C ; case 4
_0204852C:
	ldr r1, _020485AC ; =_020A2830
	mov r0, #2
	bl AssignSpecialEpisodePc
	b _02048578
_0204853C:
	ldr r1, _020485B0 ; =_020A2808
	mov r0, #2
	bl AssignSpecialEpisodePc
	b _02048578
_0204854C:
	ldr r1, _020485B4 ; =_020A2844
	mov r0, #2
	bl AssignSpecialEpisodePc
	b _02048578
_0204855C:
	ldr r1, _020485B8 ; =_020A2880
	mov r0, #2
	bl AssignSpecialEpisodePc
	b _02048578
_0204856C:
	ldr r1, _020485BC ; =_020A2894
	mov r0, #2
	bl AssignSpecialEpisodePc
_02048578:
	mov r0, #2
	bl GetTeamMember
	mov r4, r0
	mov r0, #2
	bl GetTeamMember
	ldr r1, _020485C0 ; =FORBIDDEN_FORGOT_MOVE_LIST
	bl sub_02053628
	mov r1, r0
	mov r0, r4
	mov r2, #1
	bl sub_02053660
	bl SetTeamSetupHeroAndPartnerOnly
	ldmia sp!, {r4, pc}
	.align 2, 0
_020485AC: .word _020A2830
_020485B0: .word _020A2808
_020485B4: .word _020A2844
_020485B8: .word _020A2880
_020485BC: .word _020A2894
_020485C0: .word FORBIDDEN_FORGOT_MOVE_LIST
	arm_func_end InitSpecialEpisodeHero

	arm_func_start sub_020485C4
sub_020485C4: ; 0x020485C4
	stmdb sp!, {r3, lr}
	bl sub_02052CE8
	bl sub_0200CAE4
	bl sub_02056B58
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485C4

	arm_func_start sub_020485D8
sub_020485D8: ; 0x020485D8
	stmdb sp!, {r3, lr}
	bl sub_02052CE8
	bl sub_0200CAE4
	bl sub_02056BD4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485D8

	arm_func_start sub_020485EC
sub_020485EC: ; 0x020485EC
	stmdb sp!, {r3, lr}
	bl sub_0206637C
	mov r0, #0
	bl sub_02048C0C
	mvn r0, #0
	bl sub_02048C4C
	bl sub_0204F9B8
	bl sub_02048B48
	bl sub_02048C5C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020485EC

	arm_func_start sub_02048614
sub_02048614: ; 0x02048614
	stmdb sp!, {r3, lr}
	bl sub_02048B48
	bl InitMainTeamAfterQuiz
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048614

	arm_func_start sub_02048624
sub_02048624: ; 0x02048624
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048624

	arm_func_start sub_02048644
sub_02048644: ; 0x02048644
	stmdb sp!, {r4, lr}
	bl GetGameMode
	mov r4, r0
	bl EventFlagResume
	cmp r4, #4
	bne _02048678
	mov r0, #2
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #2
	bl SetActiveTeam
	b _020486D8
_02048678:
	cmp r4, #5
	bne _0204869C
	mov r0, #2
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #2
	bl SetActiveTeam
	b _020486D8
_0204869C:
	cmp r4, #3
	bne _020486C0
	mov r0, #1
	bl SetActiveInventory
	mov r0, #1
	bl SetActiveKecleonShop
	mov r0, #1
	bl SetActiveTeam
	b _020486D8
_020486C0:
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
_020486D8:
	cmp r4, #3
	bne _020486EC
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
_020486EC:
	bl GetHeroMemberIdx
	mvn r1, #0
	cmp r0, r1
	beq _02048720
	mov r0, #0
	mov r1, #0x42
	bl LoadScriptVariableValue
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
_02048720:
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r4, pc}
	arm_func_end sub_02048644

	arm_func_start sub_0204872C
sub_0204872C: ; 0x0204872C
	stmdb sp!, {r3, lr}
	bl EventFlagBackup
	mov r0, #2
	bl SetBothScreensWindowsColor
	mov r0, #0
	bl SetActiveInventory
	mov r0, #0
	bl SetActiveKecleonShop
	mov r0, #0
	bl SetActiveTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_0204872C
