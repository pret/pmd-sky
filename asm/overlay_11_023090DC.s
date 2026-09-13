	.include "asm/macros.inc"
	.include "overlay_11_023090DC.inc"

#ifdef JAPAN
#define OV11_02309084_OFFSET -0x20
#else
#define OV11_02309084_OFFSET 0
#endif

	.text

	arm_func_start ov11_023090DC
ov11_023090DC: ; 0x023090DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #0x1b
	addls pc, pc, r0, lsl #2
	b _02309D74
_023090FC: ; jump table
	b _0230916C ; case 0
	b _0230955C ; case 1
	b _02309518 ; case 2
	b _02309724 ; case 3
	b _023097EC ; case 4
	b _0230984C ; case 5
	b _0230987C ; case 6
	b _023098A8 ; case 7
	b _023098E4 ; case 8
	b _023099B0 ; case 9
	b _023099CC ; case 10
	b _023099F8 ; case 11
	b _02309A2C ; case 12
	b _02309A68 ; case 13
	b _02309A8C ; case 14
	b _02309AB4 ; case 15
	b _02309AD0 ; case 16
	b _02309B40 ; case 17
	b _02309B5C ; case 18
	b _02309BA4 ; case 19
	b _02309C04 ; case 20
	b _02309CA4 ; case 21
	b _02309CE0 ; case 22
	b _02309CF8 ; case 23
	b _02309D20 ; case 24
	b _02309D38 ; case 25
	b _02309D54 ; case 26
	b _02309D6C ; case 27
_0230916C:
	ldr r5, [r3, #0x114 + OV11_02309084_OFFSET]
	mov r0, #0
	str r0, [sp, #4]
	ldr r8, [sp, #4]
	add r4, r3, #0x11c + OV11_02309084_OFFSET
	mov r2, r8
#ifdef JAPAN
	str r2, [sp, #8]
	ldrsh r2, [r3, #0xf8]
#else
	add r3, r3, #0x100
	str r2, [sp, #8]
	ldrsh r2, [r3, #0x18]
#endif
	mov r0, r4
	mov r1, r5
	str r2, [sp, #0x10]
	ldr r2, _02309D84 ; =0x00401833
	add r7, r4, #0x38
	str r2, [sp, #0x14]
	bl ov11_02309EE4
	mov r2, #0
	mov r1, r2
	b _023091C4
_023091B8:
	add r0, r4, r2
	strb r1, [r0, #0x70]
	add r2, r2, #1
_023091C4:
	ldr r0, [r4, #0x30]
	cmp r2, r0
	blt _023091B8
	cmp r5, #2
	bne _023092FC
	mov sl, #0
	b _023092F0
_023091E0:
	ldr r0, [sp, #0x10]
	add fp, r4, sl, lsl #3
	bl GetItemMoveId16
	ldr r1, [r4, sl, lsl #3]
	mov r6, r0
	cmp r1, #1
	bne _02309258
	ldrsh r0, [fp, #4]
	bl GetTeamMember
	ldrsh r1, [r0, #4]
	mov sb, #0
	mov r3, sb
	str r1, [sp, #0xc]
	mov fp, #1
	mov r1, #6
	b _0230924C
_02309220:
	mla ip, sb, r1, r0
	ldrb r2, [ip, #0x22]
	tst r2, #1
	movne r2, fp
	moveq r2, r3
	tst r2, #0xff
	beq _02309248
	ldrh r2, [ip, #0x24]
	cmp r6, r2
	beq _023092B8
_02309248:
	add sb, sb, #1
_0230924C:
	cmp sb, #4
	blt _02309220
	b _023092B8
_02309258:
	cmp r1, #2
	bne _023092B8
	ldrsh r0, [fp, #4]
	bl GetActiveTeamMember
	ldrsh r1, [r0, #0xc]
	mov sb, #0
	mov r2, sb
	str r1, [sp, #0xc]
	mov r3, #1
	b _023092B0
_02309280:
	add r1, r0, sb, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _023092AC
	add r1, r0, sb, lsl #3
	ldrh r1, [r1, #0x20]
	cmp r6, r1
	beq _023092B8
_023092AC:
	add sb, sb, #1
_023092B0:
	cmp sb, #4
	blt _02309280
_023092B8:
	ldr r1, [sp, #0xc]
	mov r0, r6
	bl sub_02053D1C
	cmp r0, #0
	beq _023092E0
	cmp sb, #4
	addlt r0, r4, sl
	movlt r1, #3
	strltb r1, [r0, #0x70]
	b _023092EC
_023092E0:
	add r0, r4, sl
	mov r1, #3
	strb r1, [r0, #0x70]
_023092EC:
	add sl, sl, #1
_023092F0:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _023091E0
_023092FC:
	mov sl, #0
	add r6, r4, #0x76
	add fp, sp, #0x5c
	b _02309450
_0230930C:
	add sb, r4, sl, lsl #3
	ldr r0, [r4, sl, lsl #3]
	cmp r0, #1
	bne _0230935C
	ldrsh r0, [sb, #4]
	bl GetTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x20000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #4]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x3a
	add r0, sp, #0x1a
	mov r2, #0
	bl RecolorNameString
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
	b _023093A0
_0230935C:
	cmp r0, #2
	bne _023093A0
	ldrsh r0, [sb, #4]
	bl GetActiveTeamMember
	ldrsh r1, [sb, #4]
	mov sb, r0
	orr r0, r1, #0x30000
	str r0, [sp, #0x5c]
	ldrsh r0, [sb, #0xc]
	bl GetDexNumber
	str r0, [sp, #0x80]
	add r1, sb, #0x5e
	add r0, sp, #0x1a
	mov r2, #0
	bl RecolorNameString
	add r0, sp, #0x1a
	str r0, [sp, #0x94]
_023093A0:
	cmp r5, #1
	mov r1, #0x100
	mov r3, #0
	bne _023093C8
	ldr r2, _02309D88 ; =ov11_02322E58
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093C8:
	cmp r5, #2
	bne _02309408
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	mov sb, r8, lsl #8
	tst r0, #2
	str fp, [sp]
	beq _023093F8
	ldr r2, _02309D8C ; =ov11_02322E7C
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_023093F8:
	ldr r2, _02309D88 ; =ov11_02322E58
	add r0, r6, r8, lsl #8
	bl PreprocessString
	b _0230941C
_02309408:
	ldr r2, _02309D90 ; =ov11_02322EA0
	add r0, r6, r8, lsl #8
	str fp, [sp]
	mov sb, r8, lsl #8
	bl PreprocessString
_0230941C:
	add r0, r4, sl
	ldrb r0, [r0, #0x70]
	add r8, r8, #1
	cmp r0, #0
	ldreq r0, [sp, #4]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [sp, #4]
	add r0, r6, sb
	stmia r7, {r0, sl}
	streq sl, [sp, #8]
	add r7, r7, #8
	add sl, sl, #1
_02309450:
	ldr r0, [r4, #0x30]
	cmp sl, r0
	blt _0230930C
	mov r3, #0
	str r3, [r7]
	sub r0, r3, #1
	str r0, [r7, #4]
	ldr r0, [sp, #8]
	ldr r1, _02309D80 ; =ov11_02324D90
	str r0, [r4, #0x34]
	ldr r0, [r1]
	mov r2, #0x10
	str r2, [r0, #0x88 + OV11_02309084_OFFSET]
	ldr r0, [r1]
	str r3, [r0, #0x7c + OV11_02309084_OFFSET]
	ldr r3, [r1]
	ldr r0, [r3, #0x114 + OV11_02309084_OFFSET]
	cmp r0, #1
	ldreq r0, _02309D94 ; =0x000002F2
	streqh r0, [r3, #0x84 + OV11_02309084_OFFSET]
	beq _023094E0
	cmp r0, #2
	ldrne r0, _02309D98 ; =0x00000A3A
	strneh r0, [r3, #0x84 + OV11_02309084_OFFSET]
	bne _023094E0
	ldr r2, _02309D94 ; =0x000002F2
	ldr r0, [sp, #0x14]
	strh r2, [r3, #0x84 + OV11_02309084_OFFSET]
	orr r0, r0, #0x200
	ldr r2, [r1]
	str r0, [sp, #0x14]
	add r0, r2, #0x18c + OV11_02309084_OFFSET
	str r0, [r2, #0xdc + OV11_02309084_OFFSET]
	ldr r1, [r1]
	ldr r0, [r1, #0x150 + OV11_02309084_OFFSET]
	str r0, [r1, #0x7c + OV11_02309084_OFFSET]
_023094E0:
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r0, _02309D9C ; =ov11_02322DD0
	ldr r3, [r1]
	ldr r1, [sp, #0x14]
	add r2, r3, #0x7c + OV11_02309084_OFFSET
	add r3, r3, #0x154 + OV11_02309084_OFFSET
	bl CreateParentMenu
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3, #4]
	ldr r0, [r1]
	str r2, [r0]
	b _02309D74
_02309518:
	ldrsb r0, [r3, #4]
	bl sub_02028354
	cmp r0, #3
	bne _02309538
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202810C
_02309538:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ResumeParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230955C:
	add r1, sp, #0x18
	mov r0, #0
	ldr r5, [r3, #0x114 + OV11_02309084_OFFSET]
	bl GetPressedButtons
	ldrh r0, [sp, #0x18]
	tst r0, #8
	beq _02309584
	cmp r5, #0
	moveq r0, #1
	beq _02309588
_02309584:
	mov r0, #0
_02309588:
	cmp r0, #0
	beq _023095E0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r4, [r0]
	ldrsb r0, [r4, #4]
	bl GetWindowIdSelectedItemOnPage
	add r0, r4, r0, lsl #3
	ldr r1, [r0, #0x158 + OV11_02309084_OFFSET]
	ldr r0, _02309D80 ; =ov11_02324D90
	str r1, [r4, #0x10]
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202B030
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023095E0:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult__0202AEA4
	cmp r0, #0
	blt _02309704
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r1, [r1]
	add r2, r1, #0x11c + OV11_02309084_OFFSET
	ldr r1, [r2, r0, lsl #3]
	add r5, r2, r0, lsl #3
	cmp r1, #1
	bne _02309644
	ldrsh r0, [r5, #4]
	bl GetTeamMember
	ldrsh r4, [r0, #4]
	b _02309658
_02309644:
	cmp r1, #2
	bne _02309658
	ldrsh r0, [r5, #4]
	bl GetActiveTeamMember
	ldrsh r4, [r0, #0xc]
_02309658:
	mov r0, r5
	bl ov11_0230A044
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r5, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x114 + OV11_02309084_OFFSET]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #0x1a
	strls r0, [r1]
	bls _02309D74
	bl GetGameMode
	cmp r0, #5
	beq _023096D0
	cmp r4, #0x140
	bne _023096D0
	mov r0, r5
	mov r1, r4
	bl StrcmpMonsterName
	cmp r0, #0
	beq _023096D0
	ldr r0, _02309DA0 ; =ov11_02322DE0
	ldr r3, _02309DA4 ; =ov11_02322E28
	mov r1, #0x13
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
	b _023096F0
_023096D0:
	ldr r0, _02309DA0 ; =ov11_02322DE0
	ldr r3, _02309DA8 ; =ov11_02322E00
	mov r1, #0x13
	mov r2, #0
	bl CreateParentMenuFromStringIds
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strb r0, [r1, #5]
_023096F0:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309704:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r3, #0x1a
	ldr r2, [r0]
	sub r1, r3, #0x1b
	str r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #0x10]
	b _02309D74
_02309724:
	ldrsb r0, [r3, #5]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl GetSimpleMenuResult__0202AEA4
	mvn r1, #0
	cmp r0, r1
	beq _023097C8
	ldr r1, _02309D80 ; =ov11_02324D90
	cmp r0, #3
	ldr r2, [r1]
	str r0, [r2, #0x14]
	addls pc, pc, r0, lsl #2
	b _023097B4
_02309768: ; jump table
	b _02309778 ; case 0
	b _02309788 ; case 1
	b _02309798 ; case 2
	b _023097A8 ; case 3
_02309778:
	ldr r0, [r1]
	mov r1, #4
	str r1, [r0]
	b _023097B4
_02309788:
	ldr r0, [r1]
	mov r1, #7
	str r1, [r0]
	b _023097B4
_02309798:
	ldr r0, [r1]
	mov r1, #0xc
	str r1, [r0]
	b _023097B4
_023097A8:
	ldr r0, [r1]
	mov r1, #0xe
	str r1, [r0]
_023097B4:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202812C
	b _023097D8
_023097C8:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
_023097D8:
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseParentMenu
	b _02309D74
_023097EC:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	ldrsh r0, [r4, #4]
	bl GetActiveTeamMember
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r5, #1
	ldrsh r0, [r4, #4]
	moveq r5, #0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0xac
	and r2, r5, #0xff
	bl CreateMonsterSummaryFromTeamMember
	add r0, sp, #0xac
	mov r1, #3
	bl sub_0203F150
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #5
	ldr r3, [r1]
	strb r0, [r3, #9]
	ldr r0, [r1]
	str r2, [r0]
_0230984C:
	bl sub_0203F398
	cmp r0, #1
	bne _02309D74
	bl sub_0203F974
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x18]
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_0230987C:
	ldr r1, [r3, #0x18]
	sub r0, r1, #1
	str r0, [r3, #0x18]
	cmp r1, #0
	bne _02309D74
	bl sub_0203F990
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023098A8:
	ldr r0, [r3, #0x10]
#ifdef JAPAN
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
#else
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20]
#endif
	bl sub_0203FBD4
	mov r1, #0
	mov r2, r1
	mov r0, #9
	bl sub_0204018C
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #8
	ldr r3, [r1]
	strb r0, [r3, #0xa]
	ldr r0, [r1]
	str r2, [r0]
_023098E4:
	bl sub_020407EC
	cmp r0, #1
	bne _02309934
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r0, r1, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20 + OV11_02309084_OFFSET]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309934:
	cmp r0, #2
	cmpne r0, #7
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	add r1, r1, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	bl sub_0203FD38
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0x20
	add r0, r0, #0x1e
	bl MemcpySimple
	bl sub_02041094
	ldr r1, _02309D80 ; =ov11_02324D90
	ldr r1, [r1]
	strh r0, [r1, #0x1c]
	ldrsh r0, [r4, #4]
	bl sub_0203FDEC
	bl sub_020407C0
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseAdvancedTextBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099B0:
	ldrsb r0, [r3, #0xa]
	bl sub_020307EC
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_023099CC:
	ldrsh r2, [r3, #0x1c]
	add r0, r3, #0x1e
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r2, #0xb
	ldr r3, [r1]
	strb r0, [r3, #0xb]
	ldr r0, [r1]
	str r2, [r0]
_023099F8:
	bl sub_02041A18
	cmp r0, #1
	bne _02309D74
	bl sub_02041A00
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl CloseScrollBox
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A2C:
	ldr r0, [r3, #0x10]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x100
	ldrsh r0, [r0, #0x20 + OV11_02309084_OFFSET]
	bl GetActiveTeamMember
	mov r1, r0
	ldrsh r0, [r1, #0xc]
	ldrsh r2, [r1, #6]
	add r1, r1, #0x4c
	mov r3, #0
	bl PrintIqSkillsMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0]
_02309A68:
	bl sub_02041B7C
	cmp r0, #1
	bne _02309D74
	bl sub_020420F4
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309A8C:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xf
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309AB4:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x10
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309AD0:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r0, r1, r0, lsl #3
	bl ov11_0230A044
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	mov r2, #0xa
	add r0, r0, #0x3e
	bl StrncpySimpleNoPad
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r1, [r0]
#ifdef JAPAN
	add r0, r1, #0x48
#else
	add r0, r1, #0x52
#endif
	add r1, r1, #0x3e
	bl StrcpySimple
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
#ifdef JAPAN
	add r3, r3, #0x48
#else
	add r3, r3, #0x52
#endif
	bl ShowKeyboard
	bl ov11_02310BDC
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309B40:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x12
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309B5C:
	bl GetKeyboardStatus
	cmp r0, #3
	bne _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x18]
	bl GetKeyboardStringResult
	ldr r2, _02309D80 ; =ov11_02324D90
	mov r1, r0
	ldr r0, [r2]
	add r0, r0, #0x3e
	bl StrcpySimple
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x13
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309BA4:
	bl sub_02037468
	cmp r0, #0
	beq _02309D74
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r3, [r0]
	ldr r2, [r3, #0x18]
	sub r1, r2, #1
	str r1, [r3, #0x18]
	cmp r2, #0
	bgt _02309D74
	ldr r1, [r0]
	mov r2, #0xa
#ifdef JAPAN
	add r0, r1, #0x52
#else
	add r0, r1, #0x66
#endif
	add r1, r1, #0x3e
	bl StrncpySimpleNoPadSafe
	ldr r0, _02309D80 ; =ov11_02324D90
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x52
#else
	add r0, r0, #0x66
#endif
	bl sub_0203909C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x14
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309C04:
	ldr r0, [r3, #0x10]
	add r1, r3, #0x11c + OV11_02309084_OFFSET
	add r4, r1, r0, lsl #3
	mov r0, r4
	bl ov11_0230A044
	mov r5, r0
	bl sub_0203931C
	mvn r1, #0
	cmp r0, r1
	beq _02309D74
	cmp r0, #0
	beq _02309C4C
	cmp r0, #1
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0x15
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309C4C:
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, r5
	ldr r1, [r1]
	mov r2, #0xa
	add r1, r1, #0x3e
	bl StrncpySimple
	ldr r0, [r4]
	cmp r0, #2
	bne _02309C90
	ldrsh r0, [r4, #4]
	bl sub_02058794
_02309C90:
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x16
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CA4:
	bl sub_02039218
	cmp r0, #0
	beq _02309D74
	ldr r1, _02309D80 ; =ov11_02324D90
	mov r0, #2
	ldr r3, [r1]
	mov r2, #0
	add r1, r3, #0x3e
#ifdef JAPAN
	add r3, r3, #0x48
#else
	add r3, r3, #0x52
#endif
	bl ShowKeyboard
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x12
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CE0:
	bl ov11_0230D92C
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309CF8:
	bl ov11_0230D220
	cmp r0, #0
	bne _02309D74
	bl sub_02039218
	cmp r0, #0
	ldrne r0, _02309D80 ; =ov11_02324D90
	movne r1, #0x18
	ldrne r0, [r0]
	strne r1, [r0]
	b _02309D74
_02309D20:
	bl ov11_0230D000
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x19
	ldr r0, [r0]
	str r1, [r0]
	b _02309D74
_02309D38:
	bl ov11_0230D220
	cmp r0, #0
	ldreq r0, _02309D80 ; =ov11_02324D90
	moveq r1, #0
	ldreq r0, [r0]
	streq r1, [r0]
	b _02309D74
_02309D54:
	ldrsb r0, [r3, #4]
	bl CloseParentMenu
	ldr r0, _02309D80 ; =ov11_02324D90
	mov r1, #0x1b
	ldr r0, [r0]
	str r1, [r0]
_02309D6C:
	mov r0, #1
	b _02309D78
_02309D74:
	mov r0, #0
_02309D78:
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02309D80: .word ov11_02324D90
_02309D84: .word 0x00401833
_02309D88: .word ov11_02322E58
_02309D8C: .word ov11_02322E7C
_02309D90: .word ov11_02322EA0
#ifdef JAPAN
_02309D94: .word 0x00002FF2
_02309D98: .word 0x00000875
#else
_02309D94: .word 0x000002F2
_02309D98: .word 0x00000A3A
#endif
_02309D9C: .word ov11_02322DD0
_02309DA0: .word ov11_02322DE0
_02309DA4: .word ov11_02322E28
_02309DA8: .word ov11_02322E00
	arm_func_end ov11_023090DC

	arm_func_start ov11_02309DAC
ov11_02309DAC: ; 0x02309DAC
	ldr r1, _02309DF4 ; =ov11_02324D90
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
#ifdef JAPAN
	add r3, r1, #0xfc
#else
	add r3, r1, #0x11c
#endif
	ldr r1, [r3, r2, lsl #3]
	add r2, r3, r2, lsl #3
	cmp r1, #1
	moveq r1, #0
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bxeq lr
	cmp r1, #2
	moveq r1, #1
	streq r1, [r0]
	ldreqsh r1, [r2, #4]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_02309DF4: .word ov11_02324D90
	arm_func_end ov11_02309DAC

	arm_func_start ov11_02309DF8
ov11_02309DF8: ; 0x02309DF8
	stmdb sp!, {r3, lr}
	ldr r0, _02309E20 ; =ov11_02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02309E20 ; =ov11_02324D90
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02309E20: .word ov11_02324D90
	arm_func_end ov11_02309DF8

	arm_func_start ov11_02309E24
ov11_02309E24: ; 0x02309E24
	ldr r0, _02309E44 ; =ov11_02324D90
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0x10]
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	mvneq r0, #0
	bx lr
	.align 2, 0
_02309E44: .word ov11_02324D90
	arm_func_end ov11_02309E24

	arm_func_start ov11_02309E48
ov11_02309E48: ; 0x02309E48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #0x34
	mov r1, #0
	mov r5, #1
	bl MemAlloc
	mov r1, #2
	mov r4, r0
	bl ov11_02309EE4
	mov r6, #0
	b _02309EBC
_02309E74:
	ldr r0, [r4, r6, lsl #3]
	add r1, r4, r6, lsl #3
	cmp r0, #1
	bne _02309E9C
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_02055FCC
	cmp r0, #0
	bne _02309EC8
	b _02309EB8
_02309E9C:
	cmp r0, #2
	bne _02309EB8
	ldrsh r0, [r1, #4]
	mov r1, r7
	bl sub_020586F0
	cmp r0, #0
	bne _02309EC8
_02309EB8:
	add r6, r6, #1
_02309EBC:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	blt _02309E74
_02309EC8:
	ldr r0, [r4, #0x30]
	cmp r6, r0
	mov r0, r4
	moveq r5, #0
	bl MemFree
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_02309E48

	arm_func_start ov11_02309EE4
ov11_02309EE4: ; 0x02309EE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov sl, r0
	mov r5, r1
	mov r1, r4
	str r4, [sl, #0x30]
	mov r0, r4
_02309F00:
	str r0, [sl, r1, lsl #3]
	add r1, r1, #1
	cmp r1, #6
	blt _02309F00
	bl sub_0204E210
	mvn r1, #0
	cmp r0, r1
	bne _02309F2C
	bl sub_0205633C
	cmp r0, #0
	moveq r4, #1
_02309F2C:
	cmp r4, #0
	beq _02309FD4
	sub r0, r5, #1
	cmp r0, #1
	bhi _02309FD4
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _0230A03C ; =ov11_02322DC8
	mov fp, #2
	ldrhi sb, _0230A040 ; =ov11_02322DF0
	mov r5, #1
	mvn r4, #0
	b _02309FB8
_02309F60:
	ldrsh r0, [sb], #2
	bl GetActorMatchingStorageId
	ldr r1, [sl, #0x30]
	mov r7, r0
	cmp r7, r4
	add r8, sl, r1, lsl #3
	beq _02309FB8
	bl GetActiveRosterIndex
	mov r6, r0
	cmp r6, r4
	streq r5, [r8]
	streqh r7, [r8, #4]
	beq _02309FAC
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	streq fp, [r8]
	streqh r6, [r8, #4]
_02309FAC:
	ldr r0, [sl, #0x30]
	add r0, r0, #1
	str r0, [sl, #0x30]
_02309FB8:
	ldrsh r0, [sb]
	cmp r0, r4
	beq _0230A034
	ldr r0, [sl, #0x30]
	cmp r0, #6
	blt _02309F60
	b _0230A034
_02309FD4:
	mov r7, #0
	mov r8, sl
	mov r5, r7
	mov r6, #1
	mov r4, #2
_02309FE8:
	mov r0, r7
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0230A020
	str r4, [r8]
	strh r7, [r8, #4]
	ldr r0, [sl, #0x30]
	add r8, r8, #8
	add r0, r0, #1
	str r0, [sl, #0x30]
_0230A020:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _02309FE8
_0230A034:
	ldr r0, [sl, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230A03C: .word ov11_02322DC8
_0230A040: .word ov11_02322DF0
	arm_func_end ov11_02309EE4

	arm_func_start ov11_0230A044
ov11_0230A044: ; 0x0230A044
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	bne _0230A064
	ldrsh r0, [r0, #4]
	bl GetTeamMember
	add r0, r0, #0x3a
	ldmia sp!, {r3, pc}
_0230A064:
	cmp r1, #2
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl GetActiveTeamMember
	add r0, r0, #0x5e
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230A044

	arm_func_start ov11_0230A07C
ov11_0230A07C: ; 0x0230A07C
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0CC ; =ov11_02322ECC
	bl InitMenu
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230A0D0 ; =ov11_02324D94
	mov r3, #0
	str r0, [r1]
	str r3, [r0, #4]
	ldr r0, [r1]
	sub r2, r3, #2
	str r3, [r0, #8]
	ldr r0, [r1]
	strb r2, [r0]
	ldr r0, [r1]
	strb r2, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0CC: .word ov11_02322ECC
_0230A0D0: .word ov11_02324D94
	arm_func_end ov11_0230A07C

	arm_func_start ov11_0230A0D4
ov11_0230A0D4: ; 0x0230A0D4
	stmdb sp!, {r3, lr}
	ldr r0, _0230A0FC ; =ov11_02324D94
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230A0FC ; =ov11_02324D94
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230A0FC: .word ov11_02324D94
	arm_func_end ov11_0230A0D4

	arm_func_start ov11_0230A100
ov11_0230A100: ; 0x0230A100
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x138
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0230A2A4
_0230A120: ; jump table
	b _0230A13C ; case 0
	b _0230A184 ; case 1
	b _0230A13C ; case 2
	b _0230A1F4 ; case 3
	b _0230A258 ; case 4
	b _0230A298 ; case 5
	b _0230A298 ; case 6
_0230A13C:
	ldr lr, [r2, #4]
	ldr ip, _0230A2B4 ; =0x00003FB8
	mov r4, #0x10
	ldr r0, _0230A2B8 ; =ov11_02322EAC
	ldr r1, _0230A2BC ; =0x00401833
	ldr r3, _0230A2C0 ; =ov11_02322EDC
	add r2, sp, #0xa0
	str lr, [sp, #0xa0]
	strh ip, [sp, #0xa8]
	str r4, [sp, #0xac]
	bl CreateParentMenuFromStringIds
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A184:
	ldrsb r0, [r2]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl GetSimpleMenuResult__0202AEA4
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0]
	bl CloseParentMenu
	ldr r0, _0230A2B0 ; =ov11_02324D94
	mvn r2, #1
	ldr r1, [r0]
	cmp r4, #0
	strb r2, [r1]
	ldrlt r0, [r0]
	movlt r1, #6
	strlt r1, [r0, #8]
	blt _0230A2A4
	ldr r2, [r0]
	mov r1, #3
	str r4, [r2, #4]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A1F4:
	mov r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, [r2, #4]
	ldr r0, _0230A2C0 ; =ov11_02322EDC
	mov r1, r1, lsl #3
	ldrh r1, [r0, r1]
	mov r4, #8
	ldr r0, _0230A2C4 ; =ov11_02322EBC
	strh r1, [sp, #0x10]
	ldr r2, [r2, #4]
	ldr r1, _0230A2C8 ; =0x00009833
	str r2, [sp, #8]
	str r4, [sp]
	mov r4, #1
	ldr r3, _0230A2CC ; =ov11_0230A2D0
	add r2, sp, #8
	str r4, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _0230A2B0 ; =ov11_02324D94
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _0230A2A4
_0230A258:
	ldrsb r0, [r2, #1]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _0230A2A4
	ldr r0, _0230A2B0 ; =ov11_02324D94
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAdvancedTextBox
	ldr r0, _0230A2B0 ; =ov11_02324D94
	mvn r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #1]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _0230A2A4
_0230A298:
	bl ov11_02301174
	mov r0, #4
	b _0230A2A8
_0230A2A4:
	mov r0, #1
_0230A2A8:
	add sp, sp, #0x138
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230A2B0: .word ov11_02324D94
#if defined(EUROPE)
_0230A2B4: .word 0x00003FBA
#elif defined(JAPAN)
_0230A2B4: .word 0x000049BB
#else
_0230A2B4: .word 0x00003FB8
#endif
_0230A2B8: .word ov11_02322EAC
_0230A2BC: .word 0x00401833
_0230A2C0: .word ov11_02322EDC
_0230A2C4: .word ov11_02322EBC
_0230A2C8: .word 0x00009833
_0230A2CC: .word ov11_0230A2D0
	arm_func_end ov11_0230A100

	arm_func_start ov11_0230A2D0
ov11_0230A2D0: ; 0x0230A2D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowIdPageStart
	mov r4, r0
	ldr r0, _0230A318 ; =ov11_02322EDC
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	mov r0, r5
	bl SetWindowTitle
#if defined(EUROPE)
	add r0, r4, #0xc3
	add r0, r0, #0x3f00
#elif defined(JAPAN)
	add r0, r4, #0x1c4
	add r0, r0, #0x4800
#else
	add r0, r4, #0xc1
	add r0, r0, #0x3f00
#endif
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r3, r1, lsr #0x10
	mov r1, #4
	mov r2, #0x10
	bl AppendStandardStringToMission
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230A318: .word ov11_02322EDC
	arm_func_end ov11_0230A2D0

	arm_func_start ov11_0230A31C
ov11_0230A31C: ; 0x0230A31C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x148
	mov r1, #8
	bl MemAlloc
	ldr r2, _0230A38C ; =ov11_02324D98
	mov r1, #0x148
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0230A38C ; =ov11_02324D98
	mov ip, #4
	ldr r4, [r0, #4]
	stmib r4, {r5, r6}
	add lr, r4, #0xc
_0230A358:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230A358
	ldr r1, [r6]
	mvn r0, #1
	str r1, [lr]
	strb r0, [r4, #0x74]
	strb r0, [r4, #0x78]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x144]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230A38C: .word ov11_02324D98
	arm_func_end ov11_0230A31C

	arm_func_start ov11_0230A390
ov11_0230A390: ; 0x0230A390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1b4
	ldr r0, _0230AD0C ; =ov11_02324D98
	ldr sb, [r0, #4]
	ldr r0, [sb]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0230AD00
_0230A3B0: ; jump table
	b _0230A3EC ; case 0
	b _0230A41C ; case 1
	b _0230A4B8 ; case 2
	b _0230A510 ; case 3
	b _0230A68C ; case 4
	b _0230A68C ; case 5
	b _0230A6C8 ; case 6
	b _0230A6E4 ; case 7
	b _0230A750 ; case 8
	b _0230A844 ; case 9
	b _0230A958 ; case 10
	b _0230A98C ; case 11
	b _0230A9D0 ; case 12
	b _0230AB1C ; case 13
	b _0230ACE4 ; case 14
_0230A3EC:
	ldr r0, [sb, #8]
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	bhs _0230A410
	ldr r0, [sb, #4]
	cmp r0, #0
	ble _0230A410
	mov r0, #1
	bl sub_02017C50
_0230A410:
	mov r0, #1
	str r0, [sb]
	b _0230AD00
_0230A41C:
	ldr r5, [sb, #8]
	ldrb r2, [r5, #1]
	cmp r2, #0x64
	bhs _0230A440
	ldrb r1, [sb, #0xd]
	ldr r0, [sb, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _0230A44C
_0230A440:
	mov r0, #0xd
	str r0, [sb]
	b _0230AD00
_0230A44C:
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r5
	bl sub_020546E8
	add r0, sp, #0x164
	bl InitPreprocessorArgs
	mov r0, r5
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r4
	mov r1, r5
	bl sub_02056094
	str r4, [sp, #0x19c]
	ldrb r2, [r5, #1]
	ldr r1, _0230AD10 ; =0x000004A6
	mov r0, #0x1c
	str r2, [sp, #0x188]
	add r2, sp, #0x164
	bl sub_02046BE8
	mov r0, r4
	bl MemFree
	mov r0, #2
	str r0, [sb]
	b _0230AD00
_0230A4B8:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	bne _0230AD00
#ifdef JAPAN
	ldr r0, [sb, #8]
	ldr r3, _0230C2B4 ; =0x000003E7
	ldrsh r1, [r0, #4]
	ldrb r2, [r0, #1]
	add r0, sb, #0x54
#else
	ldr r3, [sb, #8]
	add r0, sb, #0x54
	ldrsh r1, [r3, #4]
	ldrb r2, [r3, #1]
	ldrsh r3, [r3, #8]
#endif
	bl sub_02053A0C
	strh r0, [sb, #0x50]
	mov r0, #0
	strh r0, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	cmp r0, #0
	movne r0, #3
	strne r0, [sb]
	moveq r0, #1
	streq r0, [sb]
	b _0230AD00
_0230A510:
	ldrh r1, [sb, #0x52]
	ldrh r0, [sb, #0x50]
	ldr r4, [sb, #8]
	mov r8, #0
	cmp r1, r0
	movhs r0, #1
	sub r5, r8, #1
	strhs r0, [sb]
	bhs _0230AD00
	mov sl, r8
	add r2, sb, r1, lsl #1
	mov r6, r8
	mov r7, #1
	mov r0, #6
	b _0230A58C
_0230A54C:
	mla r3, sl, r0, r4
	ldrb r1, [r3, #0x22]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _0230A580
	ldrh r3, [r3, #0x24]
	ldrh r1, [r2, #0x54]
	cmp r3, r1
	bne _0230A588
	mov r8, #1
	b _0230A594
_0230A580:
	cmp r5, #0
	movlt r5, sl
_0230A588:
	add sl, sl, #1
_0230A58C:
	cmp sl, #4
	blt _0230A54C
_0230A594:
	cmp r8, #0
	ldrneh r0, [sb, #0x52]
	addne r0, r0, #1
	strneh r0, [sb, #0x52]
	bne _0230AD00
	add r0, sp, #0x114
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	mov r0, r4
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl sub_02056094
	str r6, [sp, #0x14c]
	cmp r5, #0
	blt _0230A644
	ldrh r1, [sb, #0x52]
	add r2, r4, #0x22
	mov r0, #6
	add r1, sb, r1, lsl #1
	mla r0, r5, r0, r2
	ldrh r1, [r1, #0x54]
	bl GetInfoMoveGround
	ldrh r2, [sb, #0x52]
	ldr r0, _0230AD14 ; =0x0000131B
	mov r1, #0x100
	add r2, sb, r2, lsl #1
	ldrh r2, [r2, #0x54]
	str r2, [sp, #0x124]
	bl sub_02017C74
	ldr r1, _0230AD18 ; =0x000004A8
	add r2, sp, #0x114
	mov r0, #0x1c
	bl sub_02046BE8
	ldrh r1, [sb, #0x52]
	mov r0, #4
	add r1, r1, #1
	strh r1, [sb, #0x52]
	b _0230A67C
_0230A644:
	ldrsh r2, [r4, #4]
	ldr r0, _0230AD1C ; =0xFFFFFE5E
	ldr r1, _0230AD20 ; =0x000004A9
#ifdef JAPAN
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	addls r1, r1, #1
#else
	add r2, r2, r0
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #3
	rsbls r1, r0, #0x308
#endif
	add r2, sp, #0x114
	mov r0, #0x1c
	bl sub_02046BE8
	mov r0, #5
_0230A67C:
	str r0, [sb]
	mov r0, r6
	bl MemFree
	b _0230AD00
_0230A68C:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	bne _0230AD00
	ldr r0, [sb]
	cmp r0, #5
	moveq r0, #0
	streqh r0, [sb, #0x76]
	moveq r0, #6
	streq r0, [sb]
	movne r0, #1
	strne r0, [sb]
	b _0230AD00
_0230A6C8:
	bl sub_02046D20
	mov r0, #7
	str r0, [sb]
	bl sub_020037A4
	add r0, r0, #0xa
	str r0, [sb, #0x144]
	b _0230AD00
_0230A6E4:
	bl sub_020037A4
	ldr r1, [sb, #0x144]
	cmp r1, r0
	bge _0230AD00
	ldr r1, _0230AD0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x74]
	cmp r1, r0
	bne _0230A744
	ldrh r0, [r4, #0x52]
	add r0, r4, r0, lsl #1
	ldrh r0, [r0, #0x54]
	bl sub_0203FD14
	ldr r0, [r4, #8]
	bl sub_02055894
	bl sub_0203FA64
	mov r1, #0
	mov r2, r1
	mov r0, #3
	bl sub_0204018C
	strb r0, [r4, #0x74]
	ldrsh r0, [r4, #0x76]
	bl sub_020410A4
_0230A744:
	mov r0, #8
	str r0, [sb]
	b _0230AD00
_0230A750:
	bl sub_020407EC
	cmp r0, #1
	beq _0230AD00
	cmp r0, #7
	bne _0230A7A4
	bl sub_02041094
	strh r0, [sb, #0x76]
	bl sub_0203FD38
	mov r1, r0
	add r0, sb, #0x7a
	mov r2, #0x20
	bl MemcpySimple
	ldrh r1, [sb, #0x52]
	add r0, sb, #0x9a
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl InitMove
	bl ov11_0230ADCC
	mov r0, #0xa
	str r0, [sb]
	b _0230AD00
_0230A7A4:
	cmp r0, #2
	bne _0230AD00
	bl sub_02041094
	strh r0, [sb, #0x76]
	add r0, sb, #0xa4
	mov r1, #0x98
	bl MemZero
	mov r2, #0
	mov r1, r2
_0230A7C8:
	add r0, sb, r2
	add r2, r2, #1
	strb r1, [r0, #0x13c]
	cmp r2, #5
	blt _0230A7C8
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	bge _0230A7F4
	bl sub_02041364
	cmp r0, #0
	bne _0230A7FC
_0230A7F4:
	mov r0, #3
	strb r0, [sb, #0x13d]
_0230A7FC:
	ldr r0, _0230AD0C ; =ov11_02324D98
	ldr r1, _0230AD24 ; =ov11_02322F5C
	ldrsb r3, [r0]
	add r2, sb, #0x13c
	ldr r0, _0230AD28 ; =ov11_02322F58
	ldr r3, [r1, r3, lsl #3]
	mov r1, #0
	str r3, [sb, #0xa4]
	str r2, [sb, #0x104]
	stmia sp, {r0, r1}
	ldr r0, _0230AD2C ; =ov11_02322F30
	ldr r2, _0230AD30 ; =0x00000233
	add r3, sb, #0xa4
	str r1, [sp, #8]
	bl sub_02046A20
	mov r0, #9
	str r0, [sb]
	b _0230AD00
_0230A844:
	bl ov11_0230AD94
	mov r4, r0
	bl sub_02046BA0
	ldr r1, _0230AD0C ; =ov11_02324D98
	cmp r4, #6
	strb r0, [r1]
	bne _0230A870
	bl sub_020416FC
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A870:
	cmp r4, #1
	bne _0230A8F8
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	bge _0230A890
	bl sub_02041364
	cmp r0, #0
	bne _0230A898
_0230A890:
	ldr r4, _0230AD34 ; =0x000004AC
	b _0230A89C
_0230A898:
	ldr r4, _0230AD38 ; =0x000004AB
_0230A89C:
	add r0, sp, #0xc4
	bl InitPreprocessorArgs
	ldrsh r0, [sb, #0x76]
	bl sub_02041154
	str r0, [sp, #0xd4]
	bl ov11_0230ADCC
	add r0, sb, #0xa4
	mov r1, #0x98
	bl MemZero
	mov r0, #5
	str r0, [sb, #0xa4]
	ldr r1, _0230AD3C ; =ov11_02322F40
	add r0, sp, #0xc4
	stmia sp, {r1, r4}
	str r0, [sp, #8]
	mov r0, #0
	mov r1, r0
	mov r2, #0x33
	add r3, sb, #0xa4
	bl sub_02046A20
	mov r0, #0xc
	str r0, [sb]
	b _0230AD00
_0230A8F8:
	cmp r4, #2
	bne _0230A918
	ldrsh r0, [sb, #0x76]
	bl sub_02041394
	bl ov11_0230ADCC
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A918:
	cmp r4, #3
	bne _0230AD00
	bl sub_0203FD38
	mov r1, r0
	add r0, sb, #0x7a
	mov r2, #0x20
	bl MemcpySimple
	ldrh r1, [sb, #0x52]
	add r0, sb, #0x9a
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl InitMove
	bl ov11_0230ADCC
	mov r0, #0xa
	str r0, [sb]
	b _0230AD00
_0230A958:
	ldrsb r1, [sb, #0x78]
	mvn r0, #1
	cmp r1, r0
	bne _0230A980
	ldrsh r2, [sb, #0x76]
	add r0, sb, #0x7a
	mov r1, #5
	mov r3, #1
	bl sub_020417A8
	strb r0, [sb, #0x78]
_0230A980:
	mov r0, #0xb
	str r0, [sb]
	b _0230AD00
_0230A98C:
	bl sub_02041A18
	cmp r0, #1
	bne _0230AD00
	ldr r1, _0230AD0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x78]
	cmp r1, r0
	beq _0230A9C4
	bl sub_02041A00
	ldrsb r0, [r4, #0x78]
	bl CloseScrollBox
	mvn r0, #1
	strb r0, [r4, #0x78]
_0230A9C4:
	mov r0, #6
	str r0, [sb]
	b _0230AD00
_0230A9D0:
	bl ov11_0230AD94
	cmp r0, #4
	bne _0230AB08
	ldrsh r0, [sb, #0x76]
	cmp r0, #4
	blt _0230AA00
	ldrh r1, [sb, #0x52]
	mov r0, #1
	add r1, r1, #1
	strh r1, [sb, #0x52]
	str r0, [sb]
	b _0230AAFC
_0230AA00:
	ldr r7, [sb, #8]
	mvn r5, #0
	bl sub_02041484
	bl sub_0203FD38
	mov r6, r0
	mov r8, #0
	add r4, r7, #0x22
	mov fp, #6
_0230AA20:
	mul sl, r8, fp
	add r0, r4, sl
	add r1, r6, r8, lsl #3
	bl DungeonMoveToGroundMove
	cmp r5, #0
	bge _0230AA54
	add r0, r7, sl
	ldrb r0, [r0, #0x22]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r5, r8
_0230AA54:
	add r8, r8, #1
	cmp r8, #4
	blt _0230AA20
	add r0, sp, #0x74
	bl InitPreprocessorArgs
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, r7
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r4
	mov r1, r7
	bl sub_02056094
	add r1, r7, #0x22
	mov r0, #6
	str r4, [sp, #0xac]
	mla r0, r5, r0, r1
	ldrh r1, [sb, #0x52]
	add r1, sb, r1, lsl #1
	ldrh r1, [r1, #0x54]
	bl GetInfoMoveGround
	ldrh r2, [sb, #0x52]
	ldr r0, _0230AD14 ; =0x0000131B
	mov r1, #0x100
	add r2, sb, r2, lsl #1
	ldrh r2, [r2, #0x54]
	str r2, [sp, #0x84]
	bl sub_02017C74
	ldr r1, _0230AD18 ; =0x000004A8
	mov r0, #0x1c
	add r2, sp, #0x74
	bl sub_02046BE8
	ldrh r2, [sb, #0x52]
	mov r0, r4
	mov r1, #4
	add r2, r2, #1
	strh r2, [sb, #0x52]
	str r1, [sb]
	bl MemFree
_0230AAFC:
	mov r0, #0
	bl sub_020410A4
	b _0230AD00
_0230AB08:
	sub r0, r0, #5
	cmp r0, #1
	movls r0, #6
	strls r0, [sb]
	b _0230AD00
_0230AB1C:
	mov r0, #0x400
	mov r1, #0xf
	ldr r6, [sb, #8]
	mov r7, #0
	bl MemAlloc
	mov r4, r0
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	str r0, [sp, #0xc]
	mov r0, #0x100
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r0, r7
	strb r0, [r4]
	mov r0, r6
	bl sub_02055894
	bl sub_020564B0
	mov r2, r0
	mov r0, r5
	mov r1, r6
	bl sub_02056094
	add r0, sp, #0x24
	bl InitPreprocessorArgs
	mov r8, r7
	ldrb r1, [r6, #0xc]
	ldrb r0, [sb, #0x18]
	ldrsh r3, [r6, #0xa]
	ldrsh r2, [sb, #0x16]
	sub r0, r1, r0
	str r0, [sp, #0x14]
	sub r2, r3, r2
	str r2, [sp, #0x10]
	ldrb r1, [r6, #0xe]
	ldrb r0, [sb, #0x1a]
	ldrb r3, [r6, #0xd]
	ldrb r2, [sb, #0x19]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	sub r2, r3, r2
	ldrb r1, [r6, #0xf]
	ldrb r0, [sb, #0x1b]
	str r2, [sp, #0x18]
	mov sl, r8
	sub r0, r1, r0
	str r0, [sp, #0x20]
_0230ABD8:
	add r0, sp, #0x10
	ldr fp, [r0, sl, lsl #2]
	cmp fp, #0
	ble _0230AC58
	cmp r7, #0
	beq _0230AC10
	cmp r8, #3
	beq _0230AC04
	ldr r1, _0230AD40 ; =ov11_02322F80
	mov r0, r4
	bl strcat
_0230AC04:
	ldr r1, _0230AD44 ; =ov11_02322F84
	mov r0, r4
	bl strcat
_0230AC10:
	add r0, sp, #0x24
	ldr r2, _0230AD48 ; =ov11_02322F24
	mov r3, sl, lsl #1
	ldrh r2, [r2, r3]
	str r5, [sp, #0x5c]
	add r0, r0, sl, lsl #2
	str fp, [r0, #0x24]
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	ldr r1, [sp, #0xc]
	mov r0, r4
	bl strcat
	mov r7, #1
	add r8, r8, #1
_0230AC58:
	add sl, sl, #1
	cmp sl, #5
	blt _0230ABD8
	ldr r1, _0230AD44 ; =ov11_02322F84
	mov r0, r4
	bl strcat
	cmp r7, #0
	beq _0230AC8C
	add r2, sp, #0x24
	mov r1, r4
	mov r0, #0x1c
	bl sub_02046C30
	b _0230ACB4
_0230AC8C:
	ldrb r1, [r6, #1]
	ldrb r0, [sb, #0xd]
	cmp r1, r0
	bne _0230ACB4
	ldr r1, _0230AD4C ; =0x000004A7
	add r2, sp, #0x24
	mov r0, #0x1c
	str r5, [sp, #0x5c]
	bl sub_02046BE8
	mov r7, #1
_0230ACB4:
	mov r0, r4
	bl MemFree
	ldr r0, [sp, #0xc]
	bl MemFree
	mov r0, r5
	bl MemFree
	cmp r7, #0
	movne r0, #0xe
	strne r0, [sb]
	bne _0230AD00
	mov r0, #1
	b _0230AD04
_0230ACE4:
	bl sub_02046C78
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
	cmp r0, #6
	moveq r0, #1
	beq _0230AD04
_0230AD00:
	mov r0, #0
_0230AD04:
	add sp, sp, #0x1b4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV11_0230A390_OFFSET 0x3725
#else
#define OV11_0230A390_OFFSET 0
#endif
_0230AD0C: .word ov11_02324D98
_0230AD10: .word 0x000004A6 + OV11_0230A390_OFFSET
#ifdef JAPAN
_0230C2B4: .word 0x000003E7
#endif
_0230AD14: .word 0x0000131B
_0230AD18: .word 0x000004A8 + OV11_0230A390_OFFSET
_0230AD1C: .word 0xFFFFFE5E
_0230AD20: .word 0x000004A9 + OV11_0230A390_OFFSET
_0230AD24: .word ov11_02322F5C
_0230AD28: .word ov11_02322F58
_0230AD2C: .word ov11_02322F30
_0230AD30: .word 0x00000233
_0230AD34: .word 0x000004AC + OV11_0230A390_OFFSET
_0230AD38: .word 0x000004AB + OV11_0230A390_OFFSET
_0230AD3C: .word ov11_02322F40
_0230AD40: .word ov11_02322F80
_0230AD44: .word ov11_02322F84
_0230AD48: .word ov11_02322F24
_0230AD4C: .word 0x000004A7 + OV11_0230A390_OFFSET
	arm_func_end ov11_0230A390

	arm_func_start ov11_0230AD50
ov11_0230AD50: ; 0x0230AD50
	stmdb sp!, {r3, lr}
	ldr r0, _0230AD78 ; =ov11_02324D98
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0230AD78 ; =ov11_02324D98
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AD78: .word ov11_02324D98
	arm_func_end ov11_0230AD50

	arm_func_start IsGroundMonsterAtMaxLevel
IsGroundMonsterAtMaxLevel: ; 0x0230AD7C
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsGroundMonsterAtMaxLevel

	arm_func_start ov11_0230AD94
ov11_0230AD94: ; 0x0230AD94
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r2, #0
	cmp r0, r2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #6
	ldmeqia sp!, {r3, pc}
	sub r1, r2, #2
	cmp r0, r1
	moveq r0, #6
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230AD94

	arm_func_start ov11_0230ADCC
ov11_0230ADCC: ; 0x0230ADCC
	stmdb sp!, {r4, lr}
	ldr r1, _0230AE0C ; =ov11_02324D98
	mvn r0, #1
	ldr r4, [r1, #4]
	ldrsb r1, [r4, #0x74]
	cmp r1, r0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl sub_02055894
	bl sub_0203FD80
	bl sub_020407C0
	ldrsb r0, [r4, #0x74]
	bl CloseAdvancedTextBox
	mvn r0, #1
	strb r0, [r4, #0x74]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230AE0C: .word ov11_02324D98
	arm_func_end ov11_0230ADCC

	arm_func_start ov11_0230AE10
ov11_0230AE10: ; 0x0230AE10
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #0
	cmpne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r2, _0230AE78 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	mov r1, #0x10
	str r0, [r2]
	bl MemZero
	ldr r0, _0230AE78 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldmia r5, {r1, r2}
	ldr r4, [r0]
	str r1, [r4]
	add r0, r4, #0xc
	add r1, r4, #0xe
	str r2, [r4, #4]
	bl ov11_0230C050
	ldr r1, _0230AE7C ; =ov11_02322F98
	ldr r2, _0230AE80 ; =GetExclusiveItemRequirements
	add r0, r4, #8
	bl sub_0204707C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230AE78: .word EXCLUSIVE_ITEM_REQUIREMENTS_PTR
_0230AE7C: .word ov11_02322F98
_0230AE80: .word GetExclusiveItemRequirements
	arm_func_end ov11_0230AE10

	arm_func_start ov11_0230AE84
ov11_0230AE84: ; 0x0230AE84
	stmdb sp!, {r3, lr}
	ldr r0, _0230AECC ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #8]
	cmpne r0, #0
	beq _0230AEC4
	bl sub_020470D0
	ldr r0, _0230AECC ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_02047148
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_0230AEC4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AECC: .word EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	arm_func_end ov11_0230AE84

	arm_func_start ov11_0230AED0
ov11_0230AED0: ; 0x0230AED0
	stmdb sp!, {r3, lr}
	ldr r0, _0230AF08 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #8
	bl sub_02047150
	ldr r0, _0230AF08 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230AF08 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230AF08: .word EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	arm_func_end ov11_0230AED0

	arm_func_start ov11_0230AF0C
ov11_0230AF0C: ; 0x0230AF0C
	ldr r1, _0230AF30 ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	ldr r2, [r0]
	ldr r3, [r1]
	ldr r1, [r0, #4]
	ldr ip, _0230AF34 ; =sub_02047188
	str r2, [r3]
	add r0, r3, #8
	str r1, [r3, #4]
	bx ip
	.align 2, 0
_0230AF30: .word EXCLUSIVE_ITEM_REQUIREMENTS_PTR
_0230AF34: .word sub_02047188
	arm_func_end ov11_0230AF0C

	arm_func_start GetExclusiveItemRequirements
GetExclusiveItemRequirements: ; 0x0230AF38
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x15c
	ldr r1, _0230B1DC ; =EXCLUSIVE_ITEM_REQUIREMENTS_PTR
	mov r7, r0
	ldr r6, [r1]
	add r0, sp, #0xa
	ldrsh r8, [r6, #4]
	mov r2, #0
	mov r3, #1
	add r1, sp, #4
	strh r8, [sp, #8]
	strh r2, [sp, #6]
	strb r3, [sp, #4]
	mov sb, #0x10
	bl MaybeGetColoredFormattedItemName
	add r0, sp, #0x10c
	bl InitPreprocessorArgs
	mov r0, r7
	mov r1, #0x18
	mov r2, sb
	add r3, sp, #0xa
	bl DrawTextInWindow
	mov r0, r8
	bl ov11_0230C068
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230AFF8
_0230AFA4: ; jump table
	b _0230AFB4 ; case 0
	b _0230AFB4 ; case 1
	b _0230AFCC ; case 2
	b _0230AFE4 ; case 3
_0230AFB4:
	ldr r3, _0230B1E0 ; =SWAP_SHOP_ONE_STAR_STR
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
	b _0230AFF8
_0230AFCC:
	ldr r3, _0230B1E4 ; =SWAP_SHOP_TWO_STAR_STR
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
	b _0230AFF8
_0230AFE4:
	ldr r3, _0230B1E8 ; =SWAP_SHOP_THREE_STAR_STR
	mov r0, r7
	mov r1, #0x6c
	mov r2, sb
	bl DrawTextInWindow
_0230AFF8:
	ldr r0, [r6]
	cmp r0, #0
	bne _0230B144
	ldr r3, _0230B1EC ; =0x000004B2
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x28
	mov r4, #0
	bl AppendStandardStringToMission
	ldr r3, _0230B1F0 ; =0x000004B3
	mov r0, r7
	mov r1, #0x7a
	mov r2, #0x28
	bl AppendStandardStringToMission
	mov r0, r8
	add sb, sb, #0x30
	bl GetExclusiveItemType
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0230B0E0
_0230B048: ; jump table
	b _0230B0E0 ; case 0
	b _0230B0E0 ; case 1
	b _0230B0E0 ; case 2
	b _0230B074 ; case 3
	b _0230B088 ; case 4
	b _0230B0E0 ; case 5
	b _0230B0E0 ; case 6
	b _0230B074 ; case 7
	b _0230B088 ; case 8
	b _0230B0E0 ; case 9
	b _0230B09C ; case 10
_0230B074:
	sub r0, r8, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r4, #2
	b _0230B0E0
_0230B088:
	sub r0, r8, #3
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	mov r4, #3
	b _0230B0E0
_0230B09C:
	sub r0, r8, #0x1bc
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #7
	ldrls r5, _0230B1F4 ; =0x000002FE
	movls r4, #3
	bls _0230B0E0
	sub r0, r8, #0x1c4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	ldrls r5, _0230B1F8 ; =0x00000336
	movls r4, #3
_0230B0E0:
	mov sl, #0
	add fp, sp, #0x10c
	b _0230B138
_0230B0EC:
	mov r0, r5
	str r5, [sp, #0x11c]
	bl CountNbItemsOfTypeInBag
	mov r8, r0
	mov r0, r5
	bl CountNbItemsOfTypeInStorage
	add r0, r8, r0
	str r0, [sp, #0x130]
	ldr r3, _0230B1FC ; =0x000004B5
	mov r0, r7
	mov r1, #0x18
	mov r2, sb
	str fp, [sp]
	bl sub_020262E0
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	add sb, sb, #0xc
	mov r5, r0, asr #0x10
	add sl, sl, #1
_0230B138:
	cmp sl, r4
	blt _0230B0EC
	b _0230B184
_0230B144:
	cmp r0, #1
	bne _0230B184
	ldr r3, _0230B1EC ; =0x000004B2
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x28
	bl AppendStandardStringToMission
	ldrh r0, [r6, #6]
	ldr r3, _0230B200 ; =0x000004B4
	add r4, sp, #0x10c
	str r0, [sp, #0x130]
	mov r0, r7
	mov r1, #0x18
	mov r2, #0x40
	str r4, [sp]
	bl sub_020262E0
_0230B184:
	ldrh r0, [r6, #0xc]
	add r1, sp, #0x10c
	ldr r3, _0230B204 ; =0x000004B6
	str r0, [sp, #0x130]
	str r1, [sp]
	mov r0, r7
	mov r1, #0x1c
	mov r2, #0x7e
	bl sub_020262E0
	ldrh r0, [r6, #0xe]
	ldr r3, _0230B208 ; =0x000004B7
	add r4, sp, #0x10c
	str r0, [sp, #0x130]
	mov r0, r7
	mov r1, #0x1c
	mov r2, #0x8a
	str r4, [sp]
	bl sub_020262E0
	mov r0, r7
	bl UpdateWindow
	add sp, sp, #0x15c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET 0x3528
#else
#define GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET 0
#endif
_0230B1DC: .word EXCLUSIVE_ITEM_REQUIREMENTS_PTR
_0230B1E0: .word SWAP_SHOP_ONE_STAR_STR
_0230B1E4: .word SWAP_SHOP_TWO_STAR_STR
_0230B1E8: .word SWAP_SHOP_THREE_STAR_STR
_0230B1EC: .word 0x000004B2 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B1F0: .word 0x000004B3 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B1F4: .word 0x000002FE
_0230B1F8: .word 0x00000336
_0230B1FC: .word 0x000004B5 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B200: .word 0x000004B4 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B204: .word 0x000004B6 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
_0230B208: .word 0x000004B7 + GET_EXCLUSIVE_ITEM_REQUIREMENTS_OFFSET
	arm_func_end GetExclusiveItemRequirements

	arm_func_start SwapShopInventoryManager
SwapShopInventoryManager: ; 0x0230B20C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r2, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r4, r0
	ldr r0, [r2, #4]
	mov r8, r1
	cmp r0, #0
	ldr r5, _0230B668 ; =0x00401A33
	mov r6, #0
	ldr r7, _0230B66C ; =ov11_0230BD5C
	bne _0230B24C
	ldr r0, _0230B670 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	str r0, [r1, #4]
_0230B24C:
	ldr r0, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	str r4, [r0]
	bl ov11_0230BF98
	bl LoadSynthBin
	ldr sb, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r2, #0
	ldr r3, [sb, #4]
	mov r1, #0x10
	add r3, r3, #0x4000
	strb r0, [r3, #0x6c4]
	ldr r0, [sb, #4]
	cmp r4, #3
	add r0, r0, #0x4000
	str r2, [r0, #0x6c8]
	ldr r0, [sb, #4]
	add r0, r0, #0x4000
	str r2, [r0, #0x6cc]
	ldr r0, [sb, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x638]
	addls pc, pc, r4, lsl #2
	b _0230B474
_0230B2A8: ; jump table
	b _0230B2B8 ; case 0
	b _0230B2EC ; case 1
	b _0230B308 ; case 2
	b _0230B428 ; case 3
_0230B2B8:
	bl ov11_0230C3CC
	bl ov11_0230C61C
	mov r0, sb
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	add r0, r0, #0x4500
	bl GetCroagunkItemTemplates
	mov r0, sb
	ldr r0, [r0, #4]
	ldr r1, _0230B674 ; =0x000003A6
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B2EC:
	bl ov11_0230C4D4
	mov r0, sb
	ldr r0, [r0, #4]
	ldr r1, _0230B678 ; =0x000003A7
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B308:
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02011420
	mov sb, #0
	mov sl, sb
	str r0, [sp, #0x14]
	mov fp, sb
	b _0230B370
_0230B328:
	ldr r1, [r1]
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	bl GetExclusiveItemType
	cmp r0, #1
	blt _0230B348
	cmp r0, #4
	ble _0230B36C
_0230B348:
	ldr r1, [sp, #0x14]
	mov r0, sb, lsl #0x10
	ldr r2, [r1]
	mov r1, sl, lsl #1
	ldrh r2, [r2, r1]
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add sb, sb, #1
_0230B36C:
	add sl, sl, #1
_0230B370:
	ldr r1, [sp, #0x14]
	ldr r0, [r1, #4]
	cmp sl, r0
	blt _0230B328
	mov sl, #0
	mov fp, sl
	b _0230B3D4
_0230B38C:
	ldr r1, [r0]
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	bl GetExclusiveItemType
	cmp r0, #1
	blt _0230B3D0
	cmp r0, #4
	bgt _0230B3D0
	ldr r1, [sp, #0x14]
	mov r0, sb, lsl #0x10
	ldr r2, [r1]
	mov r1, sl, lsl #1
	ldrh r2, [r2, r1]
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add sb, sb, #1
_0230B3D0:
	add sl, sl, #1
_0230B3D4:
	ldr r0, [sp, #0x14]
	ldr r2, [r0, #4]
	cmp sl, r2
	blt _0230B38C
	ldr r1, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	add r0, sp, #0x14
	ldr r1, [r1, #4]
	add r1, r1, #0x4600
	strh r2, [r1, #0x26]
	bl SwapShopFreeDoublePointer
	ldr r1, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, r8, lsl #0x10
	ldr r2, [r1, #4]
	mov r3, r0, asr #0x10
	add r0, r2, #0x4000
	str r3, [r0, #0x63c]
	ldr r0, [r1, #4]
#ifdef JAPAN
	ldr r1, _0230CC20_JP ; =0x000032B2
#else
	mov r1, #0x3a8
#endif
	add r0, r0, #0x4600
	strh r1, [r0, #0x34]
	b _0230B474
_0230B428:
	add r1, sp, #0xc
	add r2, sp, #0xe
	mov r0, #1
	bl ov11_0230C1D0
	mov r3, sb
	ldr r1, [r3, #4]
	ldr r7, _0230B67C ; =0x0000032F
	add r1, r1, #0x4600
	strh r0, [r1, #0x26]
	ldr r0, [r3, #4]
	ldr r2, _0230B680 ; =0x80040004
	add r0, r0, #0x4600
	strh r7, [r0, #0x34]
	ldr r0, [r3, #4]
	ldr r6, _0230B684 ; =ov11_0230B78C
	add r0, r0, #0x4600
	ldr r7, _0230B688 ; =ov11_0230BE34
	strh r8, [r0, #0x28]
	orr r5, r5, r2
_0230B474:
	cmp r4, #0
	bne _0230B5A8
	ldr r0, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #6
	ldrsh r2, [r0]
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	smulbb r8, r2, r1
	add sb, r0, #0x1400
	ldrh r0, [sb, r8]
	add sl, sb, r8
	bl ov11_0230C9EC
	ldr r1, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	str r0, [sp, #0x18]
	ldrh r0, [r1]
	bl ov11_0230C970
	strh r0, [sp, #0x1c]
	ldrh r0, [sb, r8]
	cmp r0, #1
	movne r0, #0
	strneh r0, [sp, #0x1e]
	bne _0230B4E8
	ldr r0, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	ldrh r1, [sl, #2]
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #3
	add r0, r0, #0x4500
	ldrh r0, [r0, #0xea]
	strh r0, [sp, #0x1e]
_0230B4E8:
	add r0, sp, #0x18
	bl ov11_0230AE10
	ldr r0, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	add r1, sp, #0x12
	ldr r2, [r0, #4]
	ldrsh r8, [r0]
	add r3, r2, #0x4600
	add r2, sp, #0x10
	mov r0, #0
	strh r8, [r3, #0xd0]
	bl ov11_0230C1D0
	ldr fp, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	ldrh r2, [sp, #0x12]
	ldr r0, [fp, #4]
	ldrh r1, [sp, #0x10]
	add r0, r0, #0x4600
	ldrh r8, [r0, #0x26]
	add sb, r2, r1
	mov sl, #0
	b _0230B5A0
_0230B538:
	mov r0, sl, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r2, [fp, #4]
	mov r0, #6
	mla r0, r1, r0, r2
	add r0, r0, #0x1400
	ldrh r0, [r0, #0xe6]
	bl ov11_0230C9EC
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bne _0230B59C
	ldr r0, [fp, #4]
	mov r1, #6
	mla r1, sl, r1, r0
	add r1, r1, #0x1400
	ldrh r1, [r1, #0xe8]
	add r1, r0, r1, lsl #3
	add r1, r1, #0x4500
	ldrh r1, [r1, #0xea]
	cmp r1, sb
	addgt r0, r0, sl
	addgt r1, r0, #0x1000
	movgt r0, #2
	strgtb r0, [r1, #0xb8]
_0230B59C:
	add sl, sl, #1
_0230B5A0:
	cmp sl, r8
	blt _0230B538
_0230B5A8:
	ldr r8, _0230B664 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, r5
	ldr sb, [r8, #4]
	mov r3, r7
	add r2, sb, #0x4600
	ldrh r2, [r2, #0x26]
	ldr r0, _0230B68C ; =ov11_02322FE4
	mov r5, #8
	str r2, [sb, #4]
	ldr r2, [r8, #4]
	ldrsh r7, [r8]
	add r2, r2, #0x4000
	str r7, [r2, #0x62c]
	ldr sb, [r8, #4]
	add r2, sb, #0xb8
	add r7, r2, #0x1000
	add r2, sb, #0x4000
	str r7, [r2, #0x68c]
	ldr r2, [r8, #4]
	str r6, [sp]
	ldr r6, [r2, #4]
	add r2, r2, #0x22c
	str r6, [sp, #4]
	add r2, r2, #0x4400
	str r5, [sp, #8]
	bl CreateCollectionMenu
	mov r2, r8
	ldr r1, [r2, #4]
	cmp r4, #3
	add r1, r1, #0x1000
	strb r0, [r1, #0x4e4]
	bne _0230B65C
	ldr r0, [r2, #4]
	mov r1, #1
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1C8
	mov r0, r8
	ldr r0, [r0, #4]
	ldr r1, _0230B690 ; =ov11_0230BF38
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1A4
	bl ov11_0230CAA4
	bl ov11_0230C9F8
_0230B65C:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230B664: .word SWAP_SHOP_INVENTORY_PTRS
_0230B668: .word 0x00401A33
_0230B66C: .word ov11_0230BD5C
_0230B670: .word 0x000046D4
#ifdef JAPAN
_0230B674: .word 0x000032B0
_0230B678: .word 0x000032B1
_0230CC20_JP: .word 0x000032B2
_0230B67C: .word 0x000031F4
#else
_0230B674: .word 0x000003A6
_0230B678: .word 0x000003A7
_0230B67C: .word 0x0000032F
#endif
_0230B680: .word 0x80040004
_0230B684: .word ov11_0230B78C
_0230B688: .word ov11_0230BE34
_0230B68C: .word ov11_02322FE4
_0230B690: .word ov11_0230BF38
	arm_func_end SwapShopInventoryManager

	arm_func_start ov11_0230B694
ov11_0230B694: ; 0x0230B694
	stmdb sp!, {r4, lr}
	ldr r0, _0230B71C ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230B6BC
	ldr r0, _0230B720 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B71C ; =SWAP_SHOP_INVENTORY_PTRS
	str r0, [r1, #4]
_0230B6BC:
	bl LoadSynthBin
	mov r4, r0
	bl ov11_0230BF98
	bl ov11_0230C3CC
	bl ov11_0230C61C
	mov r0, #0
	bl GetCroagunkItemTemplates
	ldr r1, _0230B71C ; =SWAP_SHOP_INVENTORY_PTRS
	cmp r4, #0
	ldr r1, [r1, #4]
	add r1, r1, #0x4600
	ldrh r1, [r1, #0x26]
	add r4, r1, r0
	beq _0230B6F8
	bl CloseSynthBin
_0230B6F8:
	ldr r0, _0230B71C ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	bl MemFree
	ldr r1, _0230B71C ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, #0
	str r0, [r1, #4]
	cmp r4, #0
	movne r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230B71C: .word SWAP_SHOP_INVENTORY_PTRS
_0230B720: .word 0x000046D4
	arm_func_end ov11_0230B694

	arm_func_start ov11_0230B724
ov11_0230B724: ; 0x0230B724
	stmdb sp!, {r4, lr}
	ldr r0, _0230B784 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230B74C
	ldr r0, _0230B788 ; =0x000046D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0230B784 ; =SWAP_SHOP_INVENTORY_PTRS
	str r0, [r1, #4]
_0230B74C:
	bl ov11_0230BF98
	bl ov11_0230C4D4
	ldr r0, _0230B784 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r1, r0, #0x4600
	ldrh r4, [r1, #0x26]
	bl MemFree
	ldr r0, _0230B784 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	str r1, [r0, #4]
	cmp r4, #0
	movne r1, #1
	and r0, r1, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230B784: .word SWAP_SHOP_INVENTORY_PTRS
_0230B788: .word 0x000046D4
	arm_func_end ov11_0230B724

	arm_func_start ov11_0230B78C
ov11_0230B78C: ; 0x0230B78C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230B870 ; =SWAP_SHOP_INVENTORY_PTRS
	tst r0, #0x400
	ldr r4, [r1, #4]
	beq _0230B868
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl GetWindowIdSelectedMenuItemIdx
	add r1, r4, #0xe6
	add r2, r1, #0x1400
	mov r1, #6
	mla r5, r0, r1, r2
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0230B7E8
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r1, #0
	strb r1, [r5, #4]
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D07C
	b _0230B83C
_0230B7E8:
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r0, r1
	bge _0230B834
	mov r0, #6
	bl PlaySeVolumeWrapper
	mov r0, #1
	strb r0, [r5, #4]
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r1, r0
	bne _0230B83C
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl sub_0202D07C
	b _0230B83C
_0230B834:
	mov r0, #2
	bl PlaySeVolumeWrapper
_0230B83C:
	ldr r0, _0230B870 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	beq _0230B860
	add r0, r1, #0x2c8
	add r0, r0, #0x4400
	bl sub_02047188
_0230B860:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230B868:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230B870: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B78C

	arm_func_start ov11_0230B874
ov11_0230B874: ; 0x0230B874
	stmdb sp!, {r3, lr}
	ldr r1, _0230B8BC ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, #0
	ldr ip, [r1, #4]
	mov r3, r0
	add r1, ip, #0x4600
	ldrh lr, [r1, #0x26]
	mov r1, #6
	b _0230B8B0
_0230B898:
	mla r2, r3, r1, ip
	add r2, r2, #0x1000
	ldrb r2, [r2, #0x4ea]
	add r3, r3, #1
	cmp r2, #0
	addne r0, r0, #1
_0230B8B0:
	cmp r3, lr
	blt _0230B898
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B8BC: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B874

	arm_func_start ov11_0230B8C0
ov11_0230B8C0: ; 0x0230B8C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0230B910 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r4, r0
	ldr r0, [r1, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	mov r5, r0
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	bl ov11_0230C970
	ldr r1, _0230B910 ; =SWAP_SHOP_INVENTORY_PTRS
	strh r0, [r4]
	ldr r0, [r1, #4]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh r0, [r0, #0xee]
	strh r0, [r4, #2]
	ldrsh r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230B910: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B8C0

	arm_func_start ov11_0230B914
ov11_0230B914: ; 0x0230B914
	stmdb sp!, {r3, lr}
	ldr r0, _0230B954 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	ldr r1, _0230B954 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, r0, lsl #0x10
	ldr r2, [r1, #4]
	mov r1, r0, lsr #0x10
	mov r0, #6
	mla r0, r1, r0, r2
	add r0, r0, #0x1400
	ldrh r0, [r0, #0xe6]
	bl ov11_0230C9EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B954: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B914

	arm_func_start ov11_0230B958
ov11_0230B958: ; 0x0230B958
	stmdb sp!, {r3, lr}
	ldr r0, _0230B9B8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	ldr r2, _0230B9B8 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	ldr ip, [r2, #4]
	mov r1, #6
	mla r2, r3, r1, ip
	add r2, r2, #0x1400
	ldrh r2, [r2, #0xe6]
	cmp r2, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mla r1, r0, r1, ip
	add r0, r1, #0x1400
	ldrh r0, [r0, #0xe8]
	add r0, ip, r0, lsl #3
	add r0, r0, #0x4500
	ldrh r0, [r0, #0xea]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230B9B8: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B958

	arm_func_start ov11_0230B9BC
ov11_0230B9BC: ; 0x0230B9BC
	stmdb sp!, {r3, lr}
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_0230AED0
	bl ov11_0230CAE4
	bl ov11_0230CA38
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0x6c4]
	cmp r0, #0
	beq _0230B9F8
	bl CloseSynthBin
_0230B9F8:
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	cmp r0, r1
	beq _0230BA44
	bl sub_0202D0EC
	ldr r1, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	strh r0, [r1]
	ldr r0, [r1, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202836C
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl CloseCollectionMenu
_0230BA44:
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230BA60 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BA60: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230B9BC

	arm_func_start ov11_0230BA64
ov11_0230BA64: ; 0x0230BA64
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r0, _0230BB18 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r4, [r0, #4]
	cmp r4, #0
	moveq r0, #0
	beq _0230BB10
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202D0EC
	mov r5, r0
	bl ov11_0230AE84
	cmp r0, #0
	addne r0, r4, #0x4600
	ldrneh r0, [r0, #0xd0]
	cmpne r0, r5
	beq _0230BAD8
	bl ov11_0230B914
	mov r1, r5, lsl #0x10
	str r0, [sp]
	mov r0, r1, lsr #0x10
	bl ov11_0230C970
	strh r0, [sp, #4]
	bl ov11_0230B958
	strh r0, [sp, #6]
	add r0, sp, #0
	bl ov11_0230AF0C
	add r0, r4, #0x4600
	strh r5, [r0, #0xd0]
_0230BAD8:
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _0230BB0C
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202C75C
	mvn r1, #0
	cmp r0, r1
	moveq r0, #2
	movne r0, #3
	b _0230BB10
_0230BB0C:
	mov r0, #0
_0230BB10:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230BB18: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230BA64

	arm_func_start ov11_0230BB1C
ov11_0230BB1C: ; 0x0230BB1C
	stmdb sp!, {r3, lr}
	ldr r0, _0230BB94 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202D0EC
	ldr r1, _0230BB94 ; =SWAP_SHOP_INVENTORY_PTRS
	strh r0, [r1]
	bl ov11_0230CA38
	bl ov11_0230CAE4
	ldr r0, _0230BB94 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl sub_0202836C
	ldr r0, _0230BB94 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl CloseCollectionMenu
	ldr r0, _0230BB94 ; =SWAP_SHOP_INVENTORY_PTRS
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x1000
	strb r1, [r0, #0x4e4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BB94: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230BB1C

	arm_func_start ov11_0230BB98
ov11_0230BB98: ; 0x0230BB98
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r0, _0230BCD8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _0230BCD0
	add r0, r2, #0x1400
	ldrsb r1, [r0, #0xe4]
	mvn r0, #1
	cmp r1, r0
	bne _0230BCD0
	ldr r0, [r2]
	ldr r1, _0230BCDC ; =0x00401833
	ldr r3, _0230BCE0 ; =ov11_0230BD5C
	cmp r0, #3
	mov r5, #0
	addls pc, pc, r0, lsl #2
	b _0230BC00
_0230BBE0: ; jump table
	b _0230BC00 ; case 0
	b _0230BC00 ; case 1
	b _0230BC00 ; case 2
	b _0230BBF0 ; case 3
_0230BBF0:
	ldr r0, _0230BCE4 ; =0x80040004
	ldr r5, _0230BCE8 ; =ov11_0230B78C
	ldr r3, _0230BCEC ; =ov11_0230BE34
	orr r1, r1, r0
_0230BC00:
	ldr ip, _0230BCD8 ; =SWAP_SHOP_INVENTORY_PTRS
	add r2, r2, #0x4000
	ldrsh r4, [ip]
	ldr r0, _0230BCF0 ; =ov11_02322FE4
	mov lr, #8
	str r4, [r2, #0x62c]
	ldr r2, [ip, #4]
	str r5, [sp]
	ldr ip, [r2, #4]
	add r2, r2, #0x22c
	add r2, r2, #0x4400
	stmib sp, {ip, lr}
	bl CreateCollectionMenu
	ldr r2, _0230BCD8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r2, #4]
	add r1, r1, #0x1000
	strb r0, [r1, #0x4e4]
	ldr r1, [r2, #4]
	ldr r0, [r1]
	cmp r0, #3
	bne _0230BCD0
	add r0, r1, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl SetCollectionMenuField0x1C8
	ldr r0, _0230BCD8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, _0230BCF4 ; =ov11_0230BF38
	ldr r0, [r0, #4]
	add r0, r0, #0x1400
	ldrsb r0, [r0, #0xe4]
	bl SetCollectionMenuField0x1A4
	bl ov11_0230CAA4
	bl ov11_0230C9F8
	ldr r0, _0230BCD8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r4, [r0, #4]
	ldr r0, [r4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230BCD0
_0230BC9C: ; jump table
	b _0230BCD0 ; case 0
	b _0230BCD0 ; case 1
	b _0230BCD0 ; case 2
	b _0230BCAC ; case 3
_0230BCAC:
	bl ov11_0230B874
	add r1, r4, #0x4600
	ldrh r1, [r1, #0x28]
	cmp r1, r0
	bne _0230BCD0
	add r0, r4, #0x1400
	ldrsb r0, [r0, #0xe4]
	mov r1, #1
	bl sub_0202D07C
_0230BCD0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230BCD8: .word SWAP_SHOP_INVENTORY_PTRS
_0230BCDC: .word 0x00401833
_0230BCE0: .word ov11_0230BD5C
_0230BCE4: .word 0x80040004
_0230BCE8: .word ov11_0230B78C
_0230BCEC: .word ov11_0230BE34
_0230BCF0: .word ov11_02322FE4
_0230BCF4: .word ov11_0230BF38
	arm_func_end ov11_0230BB98

	arm_func_start ov11_0230BCF8
ov11_0230BCF8: ; 0x0230BCF8
	stmdb sp!, {r3, lr}
	ldr r0, _0230BD24 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202C620
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BD24: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230BCF8

	arm_func_start ov11_0230BD28
ov11_0230BD28: ; 0x0230BD28
	stmdb sp!, {r3, lr}
	ldr r0, _0230BD58 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	cmp r0, #0
	addne r0, r0, #0x1400
	ldrnesb r0, [r0, #0xe4]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl IsCollectionMenuState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BD58: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230BD28

	arm_func_start ov11_0230BD5C
ov11_0230BD5C: ; 0x0230BD5C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r5, r1
	mov r1, r5, lsl #0x10
	mov r6, r0
	mov r0, r1, lsr #0x10
	mov r4, r2
	bl ov11_0230C970
	ldr r1, _0230BE28 ; =SWAP_SHOP_INVENTORY_PTRS
	strh r0, [sp, #4]
	ldr r3, [r1, #4]
	mov r1, #1
	add r0, r3, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh r2, [r0, #0xee]
	add r0, r3, r5
	add r0, r0, #0x1000
	strh r2, [sp, #2]
	strb r1, [sp]
	ldrb r0, [r0, #0xb8]
	add r1, sp, #0
	mov r2, #0
	tst r0, #2
	beq _0230BDEC
	add r0, sp, #6
	bl MaybeGetUncoloredFormattedItemName
	ldr r1, _0230BE2C ; =SWAP_SHOP_RED_TEXT_TAG_STR
	mov r0, r6
	bl strcpy
	add r1, sp, #6
	mov r0, r6
	bl strcat
	ldr r1, _0230BE30 ; =SWAP_SHOP_UNCENTER_TEXT_TAG_STR
	mov r0, r6
	bl strcat
	b _0230BDF4
_0230BDEC:
	mov r0, r6
	bl MaybeGetColoredFormattedItemName
_0230BDF4:
	ldr r1, _0230BE28 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, #6
	ldr r1, [r1, #4]
	mla r0, r5, r0, r1
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x4ea]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r6
	str r1, [r4]
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230BE28: .word SWAP_SHOP_INVENTORY_PTRS
_0230BE2C: .word SWAP_SHOP_RED_TEXT_TAG_STR
_0230BE30: .word SWAP_SHOP_UNCENTER_TEXT_TAG_STR
	arm_func_end ov11_0230BD5C

	arm_func_start ov11_0230BE34
ov11_0230BE34: ; 0x0230BE34
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _0230BF28 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r5, r1
	mov r1, r5, lsl #0x10
	mov r6, r0
	mov r0, r1, lsr #0x10
	ldr r3, [r3, #4]
	mov r1, #6
	mla r1, r0, r1, r3
	add r1, r1, #0x1400
	ldrh r1, [r1, #0xe6]
	mov r4, r2
	cmp r1, #4
	moveq r0, #0
	beq _0230BF20
	bl ov11_0230C970
	ldr r1, _0230BF28 ; =SWAP_SHOP_INVENTORY_PTRS
	strh r0, [sp, #4]
	ldr r0, [r1, #4]
	add r1, sp, #0
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	ldrh ip, [r0, #0xee]
	mov r3, #1
	mov r0, r6
	mov r2, #0
	strh ip, [sp, #2]
	strb r3, [sp]
	bl MaybeGetColoredFormattedItemName
	ldrsh r0, [sp, #4]
	bl ov11_0230C068
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0230BEE8
_0230BEC0: ; jump table
	b _0230BED0 ; case 0
	b _0230BED0 ; case 1
	b _0230BED8 ; case 2
	b _0230BEE0 ; case 3
_0230BED0:
	ldr r1, _0230BF2C ; =SWAP_SHOP_CLUMSET_ONE_STAR_STR
	b _0230BEEC
_0230BED8:
	ldr r1, _0230BF30 ; =SWAP_SHOP_CLUMSET_TWO_STAR_STR
	b _0230BEEC
_0230BEE0:
	ldr r1, _0230BF34 ; =SWAP_SHOP_CLUMSET_THREE_STAR_STR
	b _0230BEEC
_0230BEE8:
	mov r1, #0
_0230BEEC:
	mov r0, r6
	bl strcat
	ldr r1, _0230BF28 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r0, #6
	ldr r1, [r1, #4]
	mla r0, r5, r0, r1
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x4ea]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r0, r6
	str r1, [r4]
_0230BF20:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230BF28: .word SWAP_SHOP_INVENTORY_PTRS
_0230BF2C: .word SWAP_SHOP_CLUMSET_ONE_STAR_STR
_0230BF30: .word SWAP_SHOP_CLUMSET_TWO_STAR_STR
_0230BF34: .word SWAP_SHOP_CLUMSET_THREE_STAR_STR
	arm_func_end ov11_0230BE34

	arm_func_start ov11_0230BF38
ov11_0230BF38: ; 0x0230BF38
	stmdb sp!, {r3, lr}
	ldr r3, _0230BF8C ; =SWAP_SHOP_INVENTORY_PTRS
	mov r2, r2, lsl #0x10
	ldr ip, [r3, #4]
	mov r3, r2, lsr #0x10
	mov r2, #6
	mla r2, r3, r2, ip
	add r2, r2, #0x1400
	ldrh r2, [r2, #0xe6]
	mov r3, r0
	cmp r2, #2
	ldreq r0, _0230BF90 ; =0x0000032F
	streqh r0, [r1, #0x1c]
	beq _0230BF7C
	cmp r2, #3
	ldreq r0, _0230BF94 ; =0x00004623
	streqh r0, [r1, #0x1c]
_0230BF7C:
	mov r0, r1
	mov r1, r3
	bl sub_0202A03C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230BF8C: .word SWAP_SHOP_INVENTORY_PTRS
#if defined(EUROPE)
_0230BF90: .word 0x0000032F
_0230BF94: .word 0x00004642
#elif defined(JAPAN)
_0230BF90: .word 0x000031F4
_0230BF94: .word 0x00001CDF
#else
_0230BF90: .word 0x0000032F
_0230BF94: .word 0x00004623
#endif
	arm_func_end ov11_0230BF38

	arm_func_start ov11_0230BF98
ov11_0230BF98: ; 0x0230BF98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r3, _0230C048 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r2, _0230C04C ; =0x0000042C
	mov r0, r4
_0230BFAC:
	ldr r1, [r3, #4]
	add r1, r1, r4, lsl #2
	str r0, [r1, #8]
	ldr r1, [r3, #4]
	add r1, r1, r4
	add r1, r1, #0x1000
	add r4, r4, #1
	strb r0, [r1, #0xb8]
	cmp r4, r2
	blt _0230BFAC
	ldr r2, _0230C048 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r5, #0
_0230BFDC:
	ldr r1, [r2, #4]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x3e00
	strh r5, [r1, #0x16]
	ldr r1, [r2, #4]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x3600
	add r0, r0, #1
	strh r5, [r1, #0x46]
	cmp r0, #0x3e8
	blt _0230BFDC
	ldr r7, _0230C048 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r6, _0230C04C ; =0x0000042C
	mov r4, #0
_0230C014:
	ldr r1, [r7, #4]
	mov r0, r5, lsl #0x10
	add r1, r1, r5, lsl #1
	add r3, r1, #0x2d00
	mov r1, r4
	mov r2, r4
	mov r0, r0, lsr #0x10
	strh r4, [r3, #0xee]
	bl ov11_0230C924
	add r5, r5, #1
	cmp r5, r6
	blt _0230C014
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0230C048: .word SWAP_SHOP_INVENTORY_PTRS
_0230C04C: .word 0x0000042C
	arm_func_end ov11_0230BF98

	arm_func_start ov11_0230C050
ov11_0230C050: ; 0x0230C050
	ldr ip, _0230C064 ; =ov11_0230C1D0
	mov r2, r1
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_0230C064: .word ov11_0230C1D0
	arm_func_end ov11_0230C050

	arm_func_start ov11_0230C068
ov11_0230C068: ; 0x0230C068
	cmp r0, #0x1bc
	blt _0230C080
	ldr r1, _0230C0FC ; =0x000001C3
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C080:
	cmp r0, #0x1c4
	blt _0230C098
	ldr r1, _0230C100 ; =0x000001C7
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C098:
	cmp r0, #0x1c8
	blt _0230C0B0
	ldr r1, _0230C104 ; =0x000001D7
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0B0:
	cmp r0, #0x1d8
	blt _0230C0C8
	ldr r1, _0230C108 ; =0x000001F9
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0C8:
	ldr r1, _0230C10C ; =0x000003F6
	cmp r0, r1
	blt _0230C0E4
	ldr r1, _0230C110 ; =0x00000547
	cmp r0, r1
	movle r0, #3
	bxle lr
_0230C0E4:
	ldr r1, _0230C114 ; =0xFFFFFE06
	add r0, r0, r1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	bx lr
	.align 2, 0
_0230C0FC: .word 0x000001C3
_0230C100: .word 0x000001C7
_0230C104: .word 0x000001D7
_0230C108: .word 0x000001F9
_0230C10C: .word 0x000003F6
_0230C110: .word 0x00000547
_0230C114: .word 0xFFFFFE06
	arm_func_end ov11_0230C068

	arm_func_start ov11_0230C118
ov11_0230C118: ; 0x0230C118
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r6, _0230C1CC ; =SWAP_SHOP_INVENTORY_PTRS
	mov lr, #0
	ldr r7, [r6, #4]
	mov r4, lr
	add r6, r7, #0xe6
	add ip, r6, #0x1400
	add r6, r7, #0x4600
	mov r5, lr
	mov r7, #6
	b _0230C1AC
_0230C144:
	mla sb, r5, r7, ip
	ldrb r8, [sb, #4]
	cmp r8, #0
	beq _0230C1A8
	ldrh r8, [sb]
	cmp r8, #2
	beq _0230C16C
	cmp r8, #3
	beq _0230C18C
	b _0230C1A8
_0230C16C:
	cmp r1, #0
	ldrneh sb, [sb, #2]
	movne r8, lr, lsl #1
	strneh sb, [r1, r8]
	add r8, lr, #1
	mov lr, r8, lsl #0x10
	mov lr, lr, lsr #0x10
	b _0230C1A8
_0230C18C:
	cmp r3, #0
	movne r8, r4, lsl #1
	ldrneh sb, [sb, #2]
	add r4, r4, #1
	mov r4, r4, lsl #0x10
	strneh sb, [r3, r8]
	mov r4, r4, lsr #0x10
_0230C1A8:
	add r5, r5, #1
_0230C1AC:
	ldrh r8, [r6, #0x26]
	cmp r5, r8
	blt _0230C144
	cmp r0, #0
	strneh lr, [r0]
	cmp r2, #0
	strneh r4, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230C1CC: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C118

	arm_func_start ov11_0230C1D0
ov11_0230C1D0: ; 0x0230C1D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GetCurrentBagCapacity
	mov fp, r0
	bl sub_0200FD48
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov sl, r8
	cmp r5, #0
	beq _0230C288
	b _0230C278
_0230C208:
	ldr r0, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r0]
	mov r0, #6
	mul r0, sl, r0
	ldr r1, [r1, #0x384]
	add r2, r1, r0
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230C274
	ldrsh r1, [r2, #4]
	cmp r1, #0x1bc
	blt _0230C274
	ldr r0, _0230C3C8 ; =0x00000547
	cmp r1, r0
	bgt _0230C274
	cmp r6, #0
	beq _0230C270
	mov r0, r8, lsl #0x10
	mov r2, sl, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #2
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
_0230C270:
	add r8, r8, #1
_0230C274:
	add sl, sl, #1
_0230C278:
	cmp sl, fp
	blt _0230C208
	mov sl, r8
	strh r8, [r5]
_0230C288:
	cmp r4, #0
	beq _0230C3BC
	ldr r0, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r2, [r0]
	ldr r0, _0230C3C8 ; =0x00000547
	b _0230C2CC
_0230C2A4:
	add r1, r2, r5, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0
	beq _0230C2D4
	cmp r1, #0x1bc
	blt _0230C2C8
	cmp r1, r0
	ble _0230C2D4
_0230C2C8:
	add r5, r5, #1
_0230C2CC:
	cmp r5, r7
	blt _0230C2A4
_0230C2D4:
	cmp r5, r7
	bge _0230C31C
	add r0, r2, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _0230C31C
	tst r8, #7
	cmpne r6, #0
	beq _0230C31C
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #4
	mov r2, #0
	bl ov11_0230C924
	add r8, r8, #1
	add r0, r8, #7
	bic sl, r0, #7
_0230C31C:
	ldr fp, _0230C3C4 ; =BAG_ITEMS_PTR_MIRROR
	b _0230C37C
_0230C324:
	ldr r0, [fp]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _0230C384
	cmp r1, #0x1bc
	blt _0230C378
	ldr r0, _0230C3C8 ; =0x00000547
	cmp r1, r0
	bgt _0230C378
	cmp r6, #0
	beq _0230C374
	add r0, sl, sb
	mov r0, r0, lsl #0x10
	mov r2, r5, lsl #0x10
	mov r1, #3
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
_0230C374:
	add sb, sb, #1
_0230C378:
	add r5, r5, #1
_0230C37C:
	cmp r5, r7
	blt _0230C324
_0230C384:
	strh sb, [r4]
	cmp r8, #0
	ble _0230C3B8
	tst sb, #7
	cmpne r6, #0
	beq _0230C3B8
	add r0, sl, sb
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #4
	mov r2, #0
	bl ov11_0230C924
	add sb, sb, #1
_0230C3B8:
	add sl, sl, sb
_0230C3BC:
	mov r0, sl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C3C4: .word BAG_ITEMS_PTR_MIRROR
_0230C3C8: .word 0x00000547
	arm_func_end ov11_0230C1D0

	arm_func_start ov11_0230C3CC
ov11_0230C3CC: ; 0x0230C3CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetCurrentBagCapacity
	mov r7, r0
	bl sub_0200FD48
	mov sb, #0
	mov r8, r0
	mov sl, sb
	mov fp, #1
	ldr r6, _0230C4C8 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #6
	ldr r4, _0230C4CC ; =0x000003F5
	b _0230C450
_0230C3FC:
	mul r1, sl, r5
	ldr r0, [r6]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _0230C44C
	ldrsh r0, [r1, #4]
	cmp r0, r4, lsr #1
	blt _0230C44C
	cmp r0, r4
	bgt _0230C44C
	ldrh r1, [r1, #2]
	mov r2, sb
	bl ov11_0230C5A0
	cmp r0, #0
	addne sb, sb, #1
_0230C44C:
	add sl, sl, #1
_0230C450:
	cmp sl, r7
	blt _0230C3FC
	mov r4, #0
	ldr r6, _0230C4C8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r5, _0230C4CC ; =0x000003F5
	b _0230C4AC
_0230C468:
	ldr r0, [r6]
	add r1, r0, r4, lsl #1
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _0230C4B4
	cmp r0, r5, lsr #1
	blt _0230C4A8
	cmp r0, r5
	bgt _0230C4A8
	add r1, r1, #0xb00
	ldrh r1, [r1, #0x5a]
	mov r2, sb
	bl ov11_0230C5A0
	cmp r0, #0
	addne sb, sb, #1
_0230C4A8:
	add r4, r4, #1
_0230C4AC:
	cmp r4, r8
	blt _0230C468
_0230C4B4:
	ldr r0, _0230C4D0 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh sb, [r0, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C4C8: .word BAG_ITEMS_PTR_MIRROR
_0230C4CC: .word 0x000003F5
_0230C4D0: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C3CC

	arm_func_start ov11_0230C4D4
ov11_0230C4D4: ; 0x0230C4D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl GetCurrentBagCapacity
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov r4, #6
	ldr r6, _0230C594 ; =BAG_ITEMS_PTR_MIRROR
	ldr r5, _0230C598 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr fp, _0230C59C ; =0x0000018F
	b _0230C578
_0230C4FC:
	mul sl, sb, r4
	ldr r0, [r6]
	ldr r1, [r0, #0x384]
	ldrb r0, [r1, sl]
	add r1, r1, sl
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0230C574
	ldrsh r0, [r1, #4]
	cmp r0, #0x16c
	blt _0230C574
	cmp r0, fp
	bgt _0230C574
	mov r0, r8, lsl #0x10
	mov r2, sb, lsl #0x10
	mov r1, #2
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	bl ov11_0230C924
	ldr r1, [r6]
	ldr r0, [r5, #4]
	ldr r1, [r1, #0x384]
	add r0, r0, r8, lsl #1
	add r1, r1, sl
	ldrh r1, [r1, #2]
	add r0, r0, #0x2d00
	add r8, r8, #1
	strh r1, [r0, #0xee]
_0230C574:
	add sb, sb, #1
_0230C578:
	cmp sb, r7
	blt _0230C4FC
	ldr r0, _0230C598 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh r8, [r0, #0x26]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0230C594: .word BAG_ITEMS_PTR_MIRROR
_0230C598: .word SWAP_SHOP_INVENTORY_PTRS
_0230C59C: .word 0x0000018F
	arm_func_end ov11_0230C4D4

	arm_func_start ov11_0230C5A0
ov11_0230C5A0: ; 0x0230C5A0
	stmdb sp!, {r4, lr}
	cmp r2, #0
	beq _0230C5EC
	ldr r3, _0230C618 ; =SWAP_SHOP_INVENTORY_PTRS
	mov lr, #0
	ldr r4, [r3, #4]
	b _0230C5E4
_0230C5BC:
	add ip, r4, lr, lsl #1
	add r3, ip, #0x3600
	ldrh r3, [r3, #0x46]
	cmp r0, r3
	addeq r3, ip, #0x3e00
	ldreqh r3, [r3, #0x16]
	cmpeq r1, r3
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add lr, lr, #1
_0230C5E4:
	cmp lr, r2
	blt _0230C5BC
_0230C5EC:
	ldr ip, _0230C618 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r3, [ip, #4]
	add r3, r3, r2, lsl #1
	add r3, r3, #0x3600
	strh r0, [r3, #0x46]
	ldr r3, [ip, #4]
	mov r0, #1
	add r2, r3, r2, lsl #1
	add r2, r2, #0x3e00
	strh r1, [r2, #0x16]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230C618: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C5A0

	arm_func_start ov11_0230C61C
ov11_0230C61C: ; 0x0230C61C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0230C8DC ; =0x000001FA
	mov r5, #0
_0230C628:
	ldr r0, _0230C8E0 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr lr, [r0, #4]
	add r0, lr, #0x4600
	ldrh ip, [r0, #0x28]
	cmp ip, #0
	moveq r0, #0
	beq _0230C6C0
	mov r0, r4, lsl #0x10
	mov r3, #0
	mov r2, r0, asr #0x10
	add r1, r2, #1
	add r0, r2, #2
	mov r7, r3
	mov r8, r3
	mov sb, r3
	b _0230C698
_0230C668:
	add r6, lr, r3, lsl #1
	add r6, r6, #0x3600
	ldrh r6, [r6, #0x46]
	cmp r2, r6
	moveq r2, sb
	beq _0230C694
	cmp r1, r6
	moveq r1, r8
	beq _0230C694
	cmp r0, r6
	moveq r0, r7
_0230C694:
	add r3, r3, #1
_0230C698:
	cmp r3, ip
	blt _0230C668
	cmp r2, #0
	cmpeq r1, #0
	bne _0230C6BC
	cmp r0, #0
	moveq r0, #2
	movne r0, #1
	b _0230C6C0
_0230C6BC:
	mov r0, #0
_0230C6C0:
	cmp r0, #1
	beq _0230C834
	cmp r0, #2
	bne _0230C86C
	add r0, lr, r5, lsl #1
	ldr r2, _0230C8E4 ; =0x000002FE
	add r0, r0, #0x2d00
	mov r1, #0
	strh r1, [r0, #0xee]
	cmp r4, r2
	bne _0230C7AC
	mov r0, r5, lsl #0x10
	ldr r2, _0230C8E8 ; =0x000001BD
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	ldr r2, _0230C8EC ; =0x000001BE
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	ldr r2, _0230C8F0 ; =0x000001BF
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	mov r2, #0x1c0
	bl ov11_0230C924
	add r0, r5, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8F4 ; =0x000001C1
	bl ov11_0230C924
	add r0, r5, #5
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8F8 ; =0x000001C2
	bl ov11_0230C924
	add r0, r5, #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	ldr r2, _0230C8FC ; =0x000001C3
	bl ov11_0230C924
	add r0, r5, #7
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add r5, r5, #8
	mov r1, #0
	mov r2, #0x1bc
	bl ov11_0230C924
	b _0230C834
_0230C7AC:
	add r0, r2, #0x38
	cmp r4, r0
	bne _0230C818
	mov r0, r5, lsl #0x10
	ldr r2, _0230C900 ; =0x000001C5
	mov r0, r0, lsr #0x10
	bl ov11_0230C924
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	ldr r2, _0230C904 ; =0x000001C6
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	ldr r2, _0230C908 ; =0x000001C7
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	add r0, r5, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	mov r2, #0x1c4
	add r5, r5, #4
	bl ov11_0230C924
	b _0230C834
_0230C818:
	add r2, r4, #3
	mov r0, r5, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	add r5, r5, #1
	bl ov11_0230C924
_0230C834:
	add r1, r4, #2
	mov r0, r5, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, r1, lsr #0x10
	mov r1, #0
	bl ov11_0230C924
	ldr r0, _0230C8E0 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x2d00
	strh r1, [r0, #0xee]
	add r5, r5, #1
_0230C86C:
	ldr r0, _0230C90C ; =0x000003F6
	add r4, r4, #4
	cmp r4, r0
	blt _0230C628
	ldr r0, _0230C8E0 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0xe6
	add r0, r0, #0x4500
	bl GetCroagunkItemTemplates
	mov r6, r0
	mov r7, #0
	mov r4, #1
	b _0230C8C0
_0230C8A0:
	mov r0, r5, lsl #0x10
	mov r2, r7, lsl #0x10
	mov r1, r4
	mov r0, r0, lsr #0x10
	mov r2, r2, lsr #0x10
	add r5, r5, #1
	bl ov11_0230C924
	add r7, r7, #1
_0230C8C0:
	cmp r7, r6
	blt _0230C8A0
	ldr r0, _0230C8E0 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r0, [r0, #4]
	add r0, r0, #0x4600
	strh r5, [r0, #0x26]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0230C8DC: .word 0x000001FA
_0230C8E0: .word SWAP_SHOP_INVENTORY_PTRS
_0230C8E4: .word 0x000002FE
_0230C8E8: .word 0x000001BD
_0230C8EC: .word 0x000001BE
_0230C8F0: .word 0x000001BF
_0230C8F4: .word 0x000001C1
_0230C8F8: .word 0x000001C2
_0230C8FC: .word 0x000001C3
_0230C900: .word 0x000001C5
_0230C904: .word 0x000001C6
_0230C908: .word 0x000001C7
_0230C90C: .word 0x000003F6
	arm_func_end ov11_0230C61C

	arm_func_start ov11_0230C910
ov11_0230C910: ; 0x0230C910
	ldr r0, _0230C920 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_0230C920: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C910

	arm_func_start ov11_0230C924
ov11_0230C924: ; 0x0230C924
	stmdb sp!, {r3, lr}
	mov r3, #6
	mul lr, r0, r3
	ldr r3, _0230C96C ; =SWAP_SHOP_INVENTORY_PTRS
	mov ip, #0
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1400
	strh r1, [r0, #0xe6]
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1400
	strh r2, [r0, #0xe8]
	ldr r0, [r3, #4]
	add r0, r0, lr
	add r0, r0, #0x1000
	strb ip, [r0, #0x4ea]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230C96C: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C924

	arm_func_start ov11_0230C970
ov11_0230C970: ; 0x0230C970
	stmdb sp!, {r3, lr}
	mov r1, #6
	ldr r2, _0230C9E8 ; =SWAP_SHOP_INVENTORY_PTRS
	mul r1, r0, r1
	ldr r3, [r2, #4]
	add r0, r3, #0xe6
	add r2, r0, #0x1400
	ldrh r0, [r2, r1]
	add r1, r2, r1
	cmp r0, #1
	beq _0230C9B0
	cmp r0, #2
	beq _0230C9C4
	cmp r0, #3
	beq _0230C9D4
	b _0230C9E0
_0230C9B0:
	ldrh r0, [r1, #2]
	add r0, r3, r0, lsl #3
	add r0, r0, #0x4500
	ldrsh r0, [r0, #0xe6]
	ldmia sp!, {r3, pc}
_0230C9C4:
	ldrsh r0, [r1, #2]
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	ldmia sp!, {r3, pc}
_0230C9D4:
	ldrsh r0, [r1, #2]
	bl sub_02010044
	ldmia sp!, {r3, pc}
_0230C9E0:
	ldrsh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230C9E8: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230C970

	arm_func_start ov11_0230C9EC
ov11_0230C9EC: ; 0x0230C9EC
	cmp r0, #4
	moveq r0, #4
	bx lr
	arm_func_end ov11_0230C9EC

	arm_func_start ov11_0230C9F8
ov11_0230C9F8: ; 0x0230C9F8
	stmdb sp!, {r3, lr}
	ldr r0, _0230CA2C ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6cc]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r1, #0x2cc
	ldr r1, _0230CA30 ; =ov11_02322FF4
	ldr r2, _0230CA34 ; =ov11_0230CA7C
	add r0, r0, #0x4400
	bl sub_0204707C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CA2C: .word SWAP_SHOP_INVENTORY_PTRS
_0230CA30: .word ov11_02322FF4
_0230CA34: .word ov11_0230CA7C
	arm_func_end ov11_0230C9F8

	arm_func_start ov11_0230CA38
ov11_0230CA38: ; 0x0230CA38
	stmdb sp!, {r3, lr}
	ldr r0, _0230CA78 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6cc]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x2cc
	add r0, r0, #0x4400
	bl sub_02047150
	ldr r0, _0230CA78 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x6cc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CA78: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230CA38

	arm_func_start ov11_0230CA7C
ov11_0230CA7C: ; 0x0230CA7C
	stmdb sp!, {r4, lr}
	ldr r3, _0230CAA0 ; =0x000003A9
	mov r4, r0
	mov r1, #6
	mov r2, #2
	bl AppendStandardStringToMission
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0230CAA0: .word 0x000032B3
#else
_0230CAA0: .word 0x000003A9
#endif
	arm_func_end ov11_0230CA7C

	arm_func_start ov11_0230CAA4
ov11_0230CAA4: ; 0x0230CAA4
	stmdb sp!, {r3, lr}
	ldr r0, _0230CAD8 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r1, #0x2c8
	ldr r1, _0230CADC ; =ov11_02322FD4
	ldr r2, _0230CAE0 ; =ov11_0230CB28
	add r0, r0, #0x4400
	bl sub_0204707C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CAD8: .word SWAP_SHOP_INVENTORY_PTRS
_0230CADC: .word ov11_02322FD4
_0230CAE0: .word ov11_0230CB28
	arm_func_end ov11_0230CAA4

	arm_func_start ov11_0230CAE4
ov11_0230CAE4: ; 0x0230CAE4
	stmdb sp!, {r3, lr}
	ldr r0, _0230CB24 ; =SWAP_SHOP_INVENTORY_PTRS
	ldr r1, [r0, #4]
	add r0, r1, #0x4000
	ldr r0, [r0, #0x6c8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x2c8
	add r0, r0, #0x4400
	bl sub_02047150
	ldr r0, _0230CB24 ; =SWAP_SHOP_INVENTORY_PTRS
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x4000
	str r1, [r0, #0x6c8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CB24: .word SWAP_SHOP_INVENTORY_PTRS
	arm_func_end ov11_0230CAE4

	arm_func_start ov11_0230CB28
ov11_0230CB28: ; 0x0230CB28
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	bl ov11_0230B874
	ldr r1, _0230CB84 ; =SWAP_SHOP_INVENTORY_PTRS
	str r0, [sp, #0x28]
	ldr r0, [r1, #4]
#ifdef JAPAN
	add r2, sp, #4
	add r0, r0, #0x4600
	ldrh r1, [r0, #0x28]
	ldr r3, _0230E130 ; =0x000032B4
	mov r0, r4
	str r1, [sp, #0x2c]
	str r2, [sp]
	mov r1, #6
	mov r2, #2
#else
	mov r2, #2
	add r0, r0, #0x4600
	ldrh r3, [r0, #0x28]
	add r1, sp, #4
	mov r0, r4
	str r3, [sp, #0x2c]
	str r1, [sp]
	add r3, r2, #0x3a8
	mov r1, #6
#endif
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0230CB84: .word SWAP_SHOP_INVENTORY_PTRS
#ifdef JAPAN
_0230E130: .word 0x000032B4
#endif
	arm_func_end ov11_0230CB28
