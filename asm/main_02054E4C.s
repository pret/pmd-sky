	.include "asm/macros.inc"
	.include "main_02054E4C.inc"

	.text

	arm_func_start RecolorNameString
RecolorNameString: ; 0x02054F44
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r4, r2
	add r0, sp, #0
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	cmp r4, #0
	bne _02054F7C
	ldr r1, _02054F98 ; =_020A333C
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__02054A60
	b _02054F90
_02054F7C:
	ldr r1, _02054F9C ; =_020A3340
	add r3, sp, #0
	mov r0, r5
	mov r2, r4
	bl SprintfStatic__02054A60
_02054F90:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02054F98: .word _020A333C
_02054F9C: .word _020A3340
	arm_func_end RecolorNameString

	arm_func_start RecolorTeamMemberNameString
RecolorTeamMemberNameString: ; 0x02054FA0
	ldr ip, _02054FB4 ; =RecolorNameString
	cmp r2, #0
	movne r2, #0x59
	moveq r2, #0x46
	bx ip
	.align 2, 0
_02054FB4: .word RecolorNameString
	arm_func_end RecolorTeamMemberNameString

	arm_func_start ModifyHpStat
ModifyHpStat: ; 0x02054FB8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrsh r3, [r4]
	mov r2, #1
	add r0, sp, #0
	str r3, [sp]
	rsb r3, r2, #0x3e8
	bl sub_02055088
	ldr r1, [sp]
	strh r1, [r4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ModifyHpStat

	arm_func_start ModifyOffensiveStat
ModifyOffensiveStat: ; 0x02054FEC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r3, [r4]
	add r0, sp, #0
	mov r2, #1
	str r3, [sp]
	mov r3, #0xff
	bl sub_02055088
	ldr r1, [sp]
	strb r1, [r4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ModifyOffensiveStat

	arm_func_start ModifyDefensiveStat
ModifyDefensiveStat: ; 0x02055020
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrb r3, [r4]
	add r0, sp, #0
	mov r2, #1
	str r3, [sp]
	mov r3, #0xff
	bl sub_02055088
	ldr r1, [sp]
	strb r1, [r4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ModifyDefensiveStat

	arm_func_start ModifyIqStat
ModifyIqStat: ; 0x02055054
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldrsh r3, [r4]
	mov r2, #1
	add r0, sp, #0
	str r3, [sp]
	rsb r3, r2, #0x3e8
	bl sub_02055088
	ldr r1, [sp]
	strh r1, [r4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ModifyIqStat

	arm_func_start sub_02055088
sub_02055088: ; 0x02055088
	cmp r1, #0
	ble _020550B4
	ldr r2, [r0]
	cmp r2, r3
	moveq r0, #0
	bxeq lr
	add r1, r2, r1
	str r1, [r0]
	cmp r1, r3
	strgt r3, [r0]
	b _020550D4
_020550B4:
	ldr r3, [r0]
	cmp r3, r2
	moveq r0, #0
	bxeq lr
	add r1, r3, r1
	str r1, [r0]
	cmp r1, r2
	strlt r2, [r0]
_020550D4:
	mov r0, #1
	bx lr
	arm_func_end sub_02055088

	arm_func_start sub_020550DC
sub_020550DC: ; 0x020550DC
	bx lr
	arm_func_end sub_020550DC

	arm_func_start sub_020550E0
sub_020550E0: ; 0x020550E0
	ldr r0, _0205510C ; =TEAM_MEMBER_TABLE_PTR
	mov r3, #0
	ldr r2, [r0]
	ldr r0, _02055110 ; =0x0000022B
	mov r1, r3
_020550F4:
	add r3, r3, #1
	cmp r3, r0
	strb r1, [r2], #0x44
	blt _020550F4
	ldr ip, _02055114 ; =sub_0205523C
	bx ip
	.align 2, 0
_0205510C: .word TEAM_MEMBER_TABLE_PTR
_02055110: .word 0x0000022B
_02055114: .word sub_0205523C
	arm_func_end sub_020550E0

	arm_func_start sub_02055118
sub_02055118: ; 0x02055118
	ldr r0, _02055140 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0
	ldr r1, [r0]
	ldr ip, _02055144 ; =sub_0205523C
	strb r2, [r1, #0x88]
	ldr r1, [r0]
	strb r2, [r1, #0xcc]
	ldr r0, [r0]
	strb r2, [r0, #0x110]
	bx ip
	.align 2, 0
_02055140: .word TEAM_MEMBER_TABLE_PTR
_02055144: .word sub_0205523C
	arm_func_end sub_02055118

	arm_func_start IsMonsterOnTeam
IsMonsterOnTeam: ; 0x02055148
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	bl GetGameMode
	cmp r0, #3
#ifdef JAPAN
	mov r6, #1
	bne _020554FC
#else
	bne _020551C0
#endif
	ldr r0, _02055230 ; =TEAM_MEMBER_TABLE_PTR
	mov r8, #0
	ldr r7, [r0]
	mov r5, r8
#ifndef JAPAN
	mov r6, #1
#endif
	ldr r4, _02055234 ; =_020B0A4C
	b _020551B8
_0205517C:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _020551B0
	ldrsh r0, [r7, #4]
	ldr r2, [r4, sb, lsl #2]
	mov r1, sl
	blx r2
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020551B0:
	add r8, r8, #1
	add r7, r7, #0x44
_020551B8:
	cmp r8, #2
	blt _0205517C
#ifdef JAPAN
	b _020551C0
_020554FC:
	ldr r0, _02055230 ; =_020B0A48
	mov r8, #2
	ldr r0, [r0]
	mov r5, #0
	add r7, r0, #0x88
	ldr r4, _02055234 ; =_020B0A4C
	b _02055554
_02055518:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0205554C
	ldrsh r0, [r7, #4]
	ldr r2, [r4, sb, lsl #2]
	mov r1, sl
	blx r2
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0205554C:
	add r8, r8, #1
	add r7, r7, #0x44
_02055554:
	cmp r8, #5
	blt _02055518
#endif
_020551C0:
	ldr r0, _02055230 ; =TEAM_MEMBER_TABLE_PTR
	mov r8, #5
	ldr r0, [r0]
	mov fp, #0
	add r7, r0, #0x154
	mov r6, #1
	ldr r5, _02055234 ; =_020B0A4C
	ldr r4, _02055238 ; =0x0000022B
	b _02055220
_020551E4:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _02055218
	ldrsh r0, [r7, #4]
	ldr r2, [r5, sb, lsl #2]
	mov r1, sl
	blx r2
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02055218:
	add r8, r8, #1
	add r7, r7, #0x44
_02055220:
	cmp r8, r4
	blt _020551E4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02055230: .word TEAM_MEMBER_TABLE_PTR
_02055234: .word _020B0A4C
_02055238: .word 0x0000022B
	arm_func_end IsMonsterOnTeam

	arm_func_start sub_0205523C
sub_0205523C: ; 0x0205523C
	stmdb sp!, {r3, lr}
	mov r0, #0x214
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrne r1, _02055268 ; =0x0000022B
	ldrne r0, _0205526C ; =_022B5788
	ldreq r1, _02055270 ; =0x0000022A
	ldreq r0, _0205526C ; =_022B5788
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02055268: .word 0x0000022B
_0205526C: .word _022B5788
_02055270: .word 0x0000022A
	arm_func_end sub_0205523C

	arm_func_start GetNbRecruited
GetNbRecruited: ; 0x02055274
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02055384 ; =0x00000906
	mov r4, r0
	bl MemZero
	bl GetGameMode
	cmp r0, #3
	mov r3, #1
	bne _020552E0
	ldr r0, _02055388 ; =TEAM_MEMBER_TABLE_PTR
	mov lr, #0
	ldr ip, [r0]
	mov r2, lr
_020552A4:
	ldrb r0, [ip]
	add lr, lr, #1
	tst r0, #1
	movne r0, r3
	moveq r0, r2
	tst r0, #0xff
	ldrnesh r0, [ip, #4]
	add ip, ip, #0x44
	movne r1, r0, lsl #1
	ldrnesh r0, [r4, r1]
	addne r0, r0, #1
	strneh r0, [r4, r1]
	cmp lr, #2
	blt _020552A4
	b _0205532C
_020552E0:
	ldr r0, _02055388 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #2
	ldr r0, [r0]
	mov r2, #0
	add ip, r0, #0x88
_020552F4:
	ldrb r0, [ip]
	add r5, r5, #1
	tst r0, #1
	movne r0, r3
	moveq r0, r2
	tst r0, #0xff
	ldrnesh r0, [ip, #4]
	add ip, ip, #0x44
	movne r1, r0, lsl #1
	ldrnesh r0, [r4, r1]
	addne r0, r0, #1
	strneh r0, [r4, r1]
	cmp r5, #5
	blt _020552F4
_0205532C:
	ldr r0, _02055388 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #5
	ldr r0, [r0]
	mov r3, #0
	add lr, r0, #0x154
	ldr r0, _0205538C ; =0x0000022B
	mov ip, #1
_02055348:
	ldrb r1, [lr]
	add r5, r5, #1
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	ldrnesh r1, [lr, #4]
	add lr, lr, #0x44
	movne r2, r1, lsl #1
	ldrnesh r1, [r4, r2]
	addne r1, r1, #1
	strneh r1, [r4, r2]
	cmp r5, r0
	blt _02055348
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02055384: .word 0x00000906
_02055388: .word TEAM_MEMBER_TABLE_PTR
_0205538C: .word 0x0000022B
	arm_func_end GetNbRecruited

	arm_func_start IsValidTeamMember
IsValidTeamMember: ; 0x02055390
	stmdb sp!, {r4, lr}
	ldr r1, _0205540C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02055404
	cmp r4, #5
	bge _020553FC
	bl GetGameMode
	cmp r0, #3
	bne _020553EC
	cmp r4, #2
	cmpne r4, #3
	cmpne r4, #4
	beq _020553FC
	mov r0, #0
	ldmia sp!, {r4, pc}
_020553EC:
	cmp r4, #0
	cmpne r4, #1
	movne r0, #0
	ldmneia sp!, {r4, pc}
_020553FC:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02055404:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205540C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end IsValidTeamMember

	arm_func_start sub_02055410
sub_02055410: ; 0x02055410
	stmdb sp!, {r4, lr}
	ldr r1, _02055470 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02055468
	bl GetGameMode
	cmp r0, #3
	bne _0205545C
	cmp r4, #2
	bne _02055468
	mov r0, #1
	ldmia sp!, {r4, pc}
_0205545C:
	cmp r4, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02055468:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02055470: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02055410

	arm_func_start sub_02055474
sub_02055474: ; 0x02055474
	stmdb sp!, {r4, lr}
	ldr r1, _020554D4 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020554CC
	bl GetGameMode
	cmp r0, #3
	bne _020554C0
	cmp r4, #3
	bne _020554CC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020554C0:
	cmp r4, #1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_020554CC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020554D4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02055474

	arm_func_start sub_020554D8
sub_020554D8: ; 0x020554D8
	stmdb sp!, {r4, lr}
	ldr r1, _02055524 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205551C
	bl GetGameMode
	cmp r0, #3
	cmpeq r4, #4
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0205551C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02055524: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020554D8

	arm_func_start IsMainCharacter
IsMainCharacter: ; 0x02055528
	stmdb sp!, {r4, lr}
	ldr r1, _020555A4 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mov r0, #0x44
	smulbb r0, r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205559C
	cmp r4, #5
	bge _0205559C
	bl GetGameMode
	cmp r0, #3
	bne _02055584
	cmp r4, #2
	cmpne r4, #3
	cmpne r4, #4
	beq _02055594
	mov r0, #0
	ldmia sp!, {r4, pc}
_02055584:
	cmp r4, #0
	cmpne r4, #1
	movne r0, #0
	ldmneia sp!, {r4, pc}
_02055594:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0205559C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020555A4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end IsMainCharacter

	arm_func_start GetTeamMember
GetTeamMember: ; 0x020555A8
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r2, _020555CC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	bx lr
	.align 2, 0
_020555CC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetTeamMember

	arm_func_start GetRecruitMentryIdBySpecies
GetRecruitMentryIdBySpecies: ; 0x020555D0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02055648 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r2, [r2]
	mov r6, #5
	add r4, r2, #0x154
	mov ip, r5
	mov lr, #1
	ldr r2, _0205564C ; =0x0000022B
	b _02055638
_020555F8:
	ldrb r3, [r4]
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _02055630
	ldrsh r3, [r4, #4]
	cmp r3, r0
	bne _02055630
	cmp r5, r1
	moveq r0, r6, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_02055630:
	add r6, r6, #1
	add r4, r4, #0x44
_02055638:
	cmp r6, r2
	blt _020555F8
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02055648: .word TEAM_MEMBER_TABLE_PTR
_0205564C: .word 0x0000022B
	arm_func_end GetRecruitMentryIdBySpecies
