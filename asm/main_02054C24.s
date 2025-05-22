	.include "asm/macros.inc"
	.include "main_02054C24.inc"

	.text

	arm_func_start GetBaseFormCastformDeoxysCherrim
GetBaseFormCastformDeoxysCherrim: ; 0x02054C24
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsDeoxys
	cmp r0, #0
	ldrne r0, _02054CCC ; =0x000001A2
	ldmneia sp!, {r4, pc}
	ldr r1, _02054CD0 ; =0xFFFFFE85
	add r0, r4, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	rsbls r0, r1, #0
	ldmlsia sp!, {r4, pc}
	sub r0, r1, #0x258
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	rsbls r0, r1, #0x258
	ldmlsia sp!, {r4, pc}
	sub r0, r4, #0x1cc
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	movls r0, #0x1cc
	ldmlsia sp!, {r4, pc}
	ldr r0, _02054CD4 ; =0xFFFFFBDC
	add r1, r4, r0
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	rsbls r4, r0, #0
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02054CCC: .word 0x000001A2
_02054CD0: .word 0xFFFFFE85
_02054CD4: .word 0xFFFFFBDC
	arm_func_end GetBaseFormCastformDeoxysCherrim

	arm_func_start BaseFormsEqual
BaseFormsEqual: ; 0x02054CD8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	bl FemaleToMaleForm
	mov r5, r0
	mov r0, r4
	bl FemaleToMaleForm
	mov r4, r0
	mov r0, r5
	bl GetBaseFormCastformDeoxysCherrim
	mov r5, r0
	mov r0, r4
	bl GetBaseFormCastformDeoxysCherrim
	mov r6, r0
	cmp r5, r6
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl IsUnown
	cmp r0, #0
	beq _02054D3C
	mov r0, r6
	bl IsUnown
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_02054D3C:
	mov r0, r5
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	mov r4, r0
	mov r0, r6
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	ldr r1, _02054DB8 ; =0x000001BF
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	ldr r1, _02054DBC ; =0x000001C2
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	ldr r1, _02054DC0 ; =0x000001CE
	cmp r4, r1
	cmpeq r0, r1
	beq _02054D8C
	cmp r4, #0x1d0
	cmpeq r0, #0x1d0
	bne _02054D94
_02054D8C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02054D94:
	mov r0, r5
	bl GetDexNumber
	mov r4, r0
	mov r0, r6
	bl GetDexNumber
	cmp r4, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02054DB8: .word 0x000001BF
_02054DBC: .word 0x000001C2
_02054DC0: .word 0x000001CE
	arm_func_end BaseFormsEqual

	arm_func_start DexNumbersEqual
DexNumbersEqual: ; 0x02054DC4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	bl FemaleToMaleForm
	mov r5, r0
	mov r0, r4
	bl FemaleToMaleForm
	mov r4, r0
	mov r0, r5
	bl GetBaseFormCastformDeoxysCherrim
	mov r5, r0
	mov r0, r4
	bl GetBaseFormCastformDeoxysCherrim
	mov r6, r0
	cmp r5, r6
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl IsUnown
	cmp r0, #0
	beq _02054E28
	mov r0, r6
	bl IsUnown
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_02054E28:
	mov r0, r5
	bl GetDexNumber
	mov r4, r0
	mov r0, r6
	bl GetDexNumber
	cmp r4, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DexNumbersEqual

	arm_func_start GendersEqual
GendersEqual: ; 0x02054E4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetMonsterGender
	mov r4, r0
	mov r0, r5
	bl GetMonsterGender
	cmp r4, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GendersEqual

	arm_func_start GendersEqualNotGenderless
GendersEqualNotGenderless: ; 0x02054E78
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl GetMonsterGender
	cmp r0, #3
	beq _02054EC0
	mov r0, r5
	bl GetMonsterGender
	cmp r0, #3
	beq _02054EC0
	mov r0, r4
	bl GetMonsterGender
	mov r4, r0
	mov r0, r5
	bl GetMonsterGender
	cmp r4, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_02054EC0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GendersEqualNotGenderless

	arm_func_start GendersNotEqualNotGenderless
GendersNotEqualNotGenderless: ; 0x02054EC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl GetMonsterGender
	cmp r0, #3
	beq _02054F10
	mov r0, r5
	bl GetMonsterGender
	cmp r0, #3
	beq _02054F10
	mov r0, r4
	bl GetMonsterGender
	mov r4, r0
	mov r0, r5
	bl GetMonsterGender
	cmp r4, r0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02054F10:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GendersNotEqualNotGenderless

	arm_func_start sub_02054F18
sub_02054F18: ; 0x02054F18
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add r0, r0, #0xea
	add r0, r0, #0xfd00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02054F18

	arm_func_start sub_02054F44
sub_02054F44: ; 0x02054F44
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
	arm_func_end sub_02054F44

	arm_func_start sub_02054FA0
sub_02054FA0: ; 0x02054FA0
	ldr ip, _02054FB4 ; =sub_02054F44
	cmp r2, #0
	movne r2, #0x59
	moveq r2, #0x46
	bx ip
	.align 2, 0
_02054FB4: .word sub_02054F44
	arm_func_end sub_02054FA0

	arm_func_start sub_02054FB8
sub_02054FB8: ; 0x02054FB8
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
	arm_func_end sub_02054FB8

	arm_func_start sub_02054FEC
sub_02054FEC: ; 0x02054FEC
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
	arm_func_end sub_02054FEC

	arm_func_start sub_02055020
sub_02055020: ; 0x02055020
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
	arm_func_end sub_02055020

	arm_func_start sub_02055054
sub_02055054: ; 0x02055054
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
	arm_func_end sub_02055054

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

	arm_func_start sub_020555D0
sub_020555D0: ; 0x020555D0
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
	arm_func_end sub_020555D0

	arm_func_start GetHeroMemberIdx
GetHeroMemberIdx: ; 0x02055650
	ldr r0, _02055678 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #0
	mvneq r0, #0
	bx lr
	.align 2, 0
_02055678: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetHeroMemberIdx

	arm_func_start GetPartnerMemberIdx
GetPartnerMemberIdx: ; 0x0205567C
	ldr r0, _020556A4 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x44]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #1
	mvneq r0, #0
	bx lr
	.align 2, 0
_020556A4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetPartnerMemberIdx

	arm_func_start GetMainCharacter1MemberIdx
GetMainCharacter1MemberIdx: ; 0x020556A8
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	moveq r0, #2
	ldr r2, _020556E8 ; =TEAM_MEMBER_TABLE_PTR
	movne r0, #0
	mov r1, #0x44
	smulbb r1, r0, r1
	ldr r2, [r2]
	ldrb r1, [r2, r1]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	mvneq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020556E8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter1MemberIdx

	arm_func_start GetMainCharacter2MemberIdx
GetMainCharacter2MemberIdx: ; 0x020556EC
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	moveq r0, #3
	ldr r2, _0205572C ; =TEAM_MEMBER_TABLE_PTR
	movne r0, #1
	mov r1, #0x44
	smulbb r1, r0, r1
	ldr r2, [r2]
	ldrb r1, [r2, r1]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	mvneq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205572C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter2MemberIdx

	arm_func_start GetMainCharacter3MemberIdx
GetMainCharacter3MemberIdx: ; 0x02055730
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0205576C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x110]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #4
	mvneq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205576C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter3MemberIdx

	arm_func_start GetHero
GetHero: ; 0x02055770
	ldr r0, _02055794 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	bx lr
	.align 2, 0
_02055794: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetHero

	arm_func_start GetPartner
GetPartner: ; 0x02055798
	ldr r0, _020557C0 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x44]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, r1, #0x44
	moveq r0, #0
	bx lr
	.align 2, 0
_020557C0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetPartner

	arm_func_start GetMainCharacter1
GetMainCharacter1: ; 0x020557C4
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	moveq r2, #2
	ldr r1, _02055808 ; =TEAM_MEMBER_TABLE_PTR
	movne r2, #0
	mov r0, #0x44
	smulbb r2, r2, r0
	ldr r1, [r1]
	ldrb r0, [r1, r2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, r1, r2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02055808: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter1

	arm_func_start GetMainCharacter2
GetMainCharacter2: ; 0x0205580C
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	moveq r2, #3
	ldr r1, _02055850 ; =TEAM_MEMBER_TABLE_PTR
	movne r2, #1
	mov r0, #0x44
	smulbb r2, r2, r0
	ldr r1, [r1]
	ldrb r0, [r1, r2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, r1, r2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02055850: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter2

	arm_func_start GetMainCharacter3
GetMainCharacter3: ; 0x02055854
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02055890 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x110]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r0, r1, #0x110
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02055890: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetMainCharacter3

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

	arm_func_start sub_02056084
sub_02056084: ; 0x02056084
	ldr ip, _02056090 ; =sub_02054F44
	add r1, r1, #0x3a
	bx ip
	.align 2, 0
_02056090: .word sub_02054F44
	arm_func_end sub_02056084

	arm_func_start sub_02056094
sub_02056094: ; 0x02056094
	ldr ip, _020560A0 ; =sub_02054FA0
	add r1, r1, #0x3a
	bx ip
	.align 2, 0
_020560A0: .word sub_02054FA0
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

	arm_func_start sub_020564B0
sub_020564B0: ; 0x020564B0
	mvn r3, #0
	cmp r0, r3
	beq _020564F8
	ldr r1, _02056500 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, [r1]
	add r1, ip, #0x9000
	ldrb r2, [r1, #0x877]
	add r2, ip, r2, lsl #1
	add r2, r2, #0x9800
	ldrsh ip, [r2, #0x50]
	cmp ip, r3
	beq _020564F8
	ldr r2, [r1, #0x870]
	mov r1, ip, lsl #1
	ldrsh r1, [r2, r1]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
_020564F8:
	mov r0, #0
	bx lr
	.align 2, 0
_02056500: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020564B0

	arm_func_start sub_02056504
sub_02056504: ; 0x02056504
	mvn r3, #0
	cmp r0, r3
	beq _02056548
	ldr r2, _02056550 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, [r2]
	add r2, ip, r1, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x50]
	cmp r2, r3
	beq _02056548
	add r1, ip, r1, lsl #3
	add r1, r1, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #1
	bxeq lr
_02056548:
	mov r0, #0
	bx lr
	.align 2, 0
_02056550: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056504

	arm_func_start sub_02056554
sub_02056554: ; 0x02056554
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _020565E8
	ldr r1, _020565F0 ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r1]
	add r1, lr, #0x9000
	b _02056598
_02056578:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, pc}
	add ip, ip, #1
_02056598:
	cmp ip, #4
	blt _02056578
	mov r4, #0
	add r1, lr, #0x9000
	mvn r2, #0
	b _020565E0
_020565B0:
	ldr r3, [r1, #0x870]
	mov ip, r4, lsl #1
	ldrsh r3, [r3, ip]
	cmp r3, r2
	bne _020565DC
	add r1, lr, #0x9000
	ldr r2, [r1, #0x870]
	mov r1, r4, lsl #0x10
	strh r0, [r2, ip]
	mov r0, r1, asr #0x10
	ldmia sp!, {r4, pc}
_020565DC:
	add r4, r4, #1
_020565E0:
	cmp r4, #4
	blt _020565B0
_020565E8:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020565F0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056554

	arm_func_start sub_020565F4
sub_020565F4: ; 0x020565F4
	stmdb sp!, {r4, lr}
	mvn r2, #0
	cmp r0, r2
	beq _0205668C
	ldr r2, _02056694 ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r2]
	add r3, lr, r1, lsl #3
	b _02056638
_02056618:
	add r2, r3, ip, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x56]
	cmp r0, r2
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r4, pc}
	add ip, ip, #1
_02056638:
	cmp ip, #4
	blt _02056618
	mov r4, #0
	add ip, lr, r1, lsl #3
	mvn r3, #0
	b _02056684
_02056650:
	add r2, ip, r4, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x56]
	cmp r2, r3
	bne _02056680
	add r1, lr, r1, lsl #3
	add r1, r1, r4, lsl #1
	add r1, r1, #0x9800
	mov r2, r4, lsl #0x10
	strh r0, [r1, #0x56]
	mov r0, r2, asr #0x10
	ldmia sp!, {r4, pc}
_02056680:
	add r4, r4, #1
_02056684:
	cmp r4, #4
	blt _02056650
_0205668C:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02056694: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020565F4

	arm_func_start sub_02056698
sub_02056698: ; 0x02056698
	mvn r2, #0
	cmp r1, r2
	bxeq lr
	ldr r2, _020566C0 ; =TEAM_MEMBER_TABLE_PTR
	mov r3, r0, lsl #1
	ldr r0, [r2]
	add r0, r0, #0x9000
	ldr r0, [r0, #0x870]
	strh r1, [r0, r3]
	bx lr
	.align 2, 0
_020566C0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056698

	arm_func_start sub_020566C4
sub_020566C4: ; 0x020566C4
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02056748
	ldr r2, _02056750 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0
	ldr lr, [r2]
	add r2, lr, #0x9000
	b _02056740
_020566E8:
	ldr r3, [r2, #0x870]
	mov ip, r1, lsl #1
	ldrsh r3, [r3, ip]
	cmp r0, r3
	bne _0205673C
	add r0, lr, #0x9000
	ldr r2, [r0, #0x870]
	mvn r3, #0
	ldr r0, _02056750 ; =TEAM_MEMBER_TABLE_PTR
	strh r3, [r2, ip]
	ldr r2, [r0]
	add r0, r2, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x9800
	ldrsh r2, [r0, #0x50]
	cmp r1, r2
	streqh r3, [r0, #0x50]
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
_0205673C:
	add r1, r1, #1
_02056740:
	cmp r1, #4
	blt _020566E8
_02056748:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02056750: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020566C4

	arm_func_start TryAddMonsterToActiveTeam
TryAddMonsterToActiveTeam: ; 0x02056754
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02056824
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	mov ip, #0
	ldr lr, [r1]
	add r1, lr, #0x9000
	b _020567B8
_02056778:
	ldr r3, [r1, #0x870]
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r0, r2
	bne _020567B4
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	mov r0, ip, lsl #0x10
	ldr r2, [r1]
	mov r0, r0, asr #0x10
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	add r1, r2, r1, lsl #1
	add r1, r1, #0x9800
	strh r0, [r1, #0x50]
	ldmia sp!, {r4, pc}
_020567B4:
	add ip, ip, #1
_020567B8:
	cmp ip, #4
	blt _02056778
	mov r4, #0
	add r1, lr, #0x9000
	mvn r2, #0
	b _0205681C
_020567D0:
	ldr r3, [r1, #0x870]
	mov ip, r4, lsl #1
	ldrsh r3, [r3, ip]
	cmp r3, r2
	bne _02056818
	add r1, lr, #0x9000
	ldr r2, [r1, #0x870]
	ldr r1, _0205682C ; =TEAM_MEMBER_TABLE_PTR
	strh r0, [r2, ip]
	ldr r2, [r1]
	mov r0, r4, lsl #0x10
	add r1, r2, #0x9000
	ldrb r1, [r1, #0x877]
	mov r0, r0, asr #0x10
	add r1, r2, r1, lsl #1
	add r1, r1, #0x9800
	strh r0, [r1, #0x50]
	ldmia sp!, {r4, pc}
_02056818:
	add r4, r4, #1
_0205681C:
	cmp r4, #4
	blt _020567D0
_02056824:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205682C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end TryAddMonsterToActiveTeam

	arm_func_start sub_02056830
sub_02056830: ; 0x02056830
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r6, r7
	mov r4, r7
	mov r5, #1
_02056844:
	mov r0, r6
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	addeq r7, r7, #1
	cmp r6, #4
	blt _02056844
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02056830

	arm_func_start sub_02056880
sub_02056880: ; 0x02056880
	ldr r0, _020568A0 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r1, #0x9000
	ldrb r0, [r0, #0x877]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x9800
	ldrsh r0, [r0, #0x50]
	bx lr
	.align 2, 0
_020568A0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056880

	arm_func_start sub_020568A4
sub_020568A4: ; 0x020568A4
	ldr r1, _020568D8 ; =TEAM_MEMBER_TABLE_PTR
	mvn r0, #0
	ldr r3, [r1]
	add r1, r3, #0x9000
	ldrb r2, [r1, #0x877]
	add r2, r3, r2, lsl #1
	add r2, r2, #0x9800
	ldrsh r2, [r2, #0x50]
	cmp r2, r0
	ldrne r1, [r1, #0x870]
	movne r0, r2, lsl #1
	ldrnesh r0, [r1, r0]
	bx lr
	.align 2, 0
_020568D8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020568A4

	arm_func_start sub_020568DC
sub_020568DC: ; 0x020568DC
	ldr r1, _02056910 ; =TEAM_MEMBER_TABLE_PTR
	mvn r3, #0
	ldr r2, [r1]
	add r1, r2, r0, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x50]
	cmp r1, r3
	addne r0, r2, r0, lsl #3
	addne r0, r0, r1, lsl #1
	addne r0, r0, #0x9800
	ldrnesh r3, [r0, #0x56]
	mov r0, r3
	bx lr
	.align 2, 0
_02056910: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020568DC

	arm_func_start sub_02056914
sub_02056914: ; 0x02056914
	ldr r0, _0205695C ; =TEAM_MEMBER_TABLE_PTR
	mvn r2, #0
	ldr ip, [r0]
	add r0, ip, #0x9000
	ldrb r1, [r0, #0x877]
	add r1, ip, r1, lsl #1
	add r1, r1, #0x9800
	ldrsh r3, [r1, #0x50]
	cmp r3, r2
	ldrne r1, [r0, #0x870]
	movne r0, r3, lsl #1
	ldrnesh r1, [r1, r0]
	cmpne r1, r2
	moveq r0, #0
	bxeq lr
	mov r0, #0x44
	smlabb r0, r1, r0, ip
	bx lr
	.align 2, 0
_0205695C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056914

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
	bl sub_020568A4
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
	bl sub_020568A4
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

	arm_func_start sub_02056D70
sub_02056D70: ; 0x02056D70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	movs sl, r0
	ldr r0, _02056E00 ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #0
	ldr r0, [r0]
	mov sb, #0
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
	addeq sl, sp, #0
	mov r4, r6
	mov r5, #1
_02056DA0:
	ldrb r0, [r7]
	tst r0, #2
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02056DE4
	ldrsh r8, [r7, #8]
	mov r0, r8
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02056DE4
	mov r0, r8
	bl sub_020564B0
	cmp r0, #0
	moveq r0, sb, lsl #1
	streqh r8, [sl, r0]
	addeq sb, sb, #1
_02056DE4:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x68
	blt _02056DA0
	mov r0, sb
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056E00: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056D70

	arm_func_start sub_02056E04
sub_02056E04: ; 0x02056E04
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	movs sl, r0
	ldr r0, _02056EB4 ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #0
	ldr r0, [r0]
	mov sb, #0
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
	addeq sl, sp, #0
	mov r4, r6
	mov r5, #1
_02056E34:
	ldrb r0, [r7]
	tst r0, #2
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02056E98
	ldrsh r8, [r7, #8]
	mov r0, r8
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02056E98
	mov r0, r8
	bl sub_02055410
	cmp r0, #0
	bne _02056E98
	mov r0, r8
	bl sub_02055474
	cmp r0, #0
	bne _02056E98
	mov r0, r8
	bl sub_020554D8
	cmp r0, #0
	moveq r0, sb, lsl #1
	streqh r8, [sl, r0]
	addeq sb, sb, #1
_02056E98:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x68
	blt _02056E34
	mov r0, sb
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056EB4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056E04

	arm_func_start sub_02056EB8
sub_02056EB8: ; 0x02056EB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02056F5C ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	add r0, r1, #0x9000
	ldr r4, [r0, #0x84c]
	mov r6, r5
	mov r7, r5
	mov sb, r5
	mov sl, #1
_02056EE4:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sl
	moveq r0, sb
	tst r0, #0xff
	beq _02056F1C
	ldrsh r0, [r4, #8]
	bl sub_02056410
	cmp r0, #0
	beq _02056F1C
	ldrsh r0, [r4, #0xc]
	bl GetBodySize
	add r6, r6, r0
	add r5, r5, #1
_02056F1C:
	add r7, r7, #1
	cmp r7, #4
	add r4, r4, #0x68
	blt _02056EE4
	cmp r5, #4
	movge r0, #0
	ldmgeia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r8, #0
	beq _02056F4C
	mov r0, r8
	bl GetBodySize
	add r6, r6, r0
_02056F4C:
	cmp r6, #6
	movgt r0, #0
	movle r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02056F5C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056EB8

	arm_func_start sub_02056F60
sub_02056F60: ; 0x02056F60
	stmdb sp!, {r3, lr}
	mvn r1, #0
	cmp r0, r1
	beq _02057000
	ldr r1, _0205700C ; =TEAM_MEMBER_TABLE_PTR
	ldr r3, [r1]
	add r1, r3, #0x9000
	ldrb r1, [r1, #0x877]
	cmp r1, #0
	bne _02056FB8
	mov r2, #0
	b _02056FAC
_02056F90:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x5e]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, r2, #1
_02056FAC:
	cmp r2, #4
	blt _02056F90
	b _02056FEC
_02056FB8:
	cmp r1, #1
	bne _02056FEC
	mov r2, #0
	b _02056FE4
_02056FC8:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x9800
	ldrsh r1, [r1, #0x56]
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, r2, #1
_02056FE4:
	cmp r2, #4
	blt _02056FC8
_02056FEC:
	mov r1, #0x44
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #4]
	bl sub_02056EB8
	ldmia sp!, {r3, pc}
_02057000:
	mov r0, #0
	bl sub_02056EB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205700C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02056F60

	arm_func_start sub_02057010
sub_02057010: ; 0x02057010
	ldr r1, _02057028 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _0205702C ; =sub_02057030
	ldr r1, [r1]
	add r1, r1, #0x9000
	ldrb r1, [r1, #0x877]
	bx ip
	.align 2, 0
_02057028: .word TEAM_MEMBER_TABLE_PTR
_0205702C: .word sub_02057030
	arm_func_end sub_02057010

	arm_func_start sub_02057030
sub_02057030: ; 0x02057030
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r0, sb
	bl sub_020568DC
	mov r4, r0
	cmp sl, #0
	mvn r0, #0
	addeq sl, sp, #0
	mov r8, #0
	cmp r4, r0
	beq _0205707C
	mov r0, r4
	bl IsValidTeamMember
	cmp r0, #0
	strneh r4, [sl]
	addne r8, r8, #1
	mvneq r4, #0
_0205707C:
	mov r7, #0
	mvn fp, #0
_02057084:
	ldr r0, _0205717C ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	add r0, r2, sb, lsl #3
	add r0, r0, r7, lsl #1
	add r0, r0, #0x9800
	ldrsh r5, [r0, #0x56]
	cmp r5, fp
	cmpne r4, r5
	beq _020570F8
	mov r1, #0x44
	mov r0, r5
	smlabb r6, r5, r1, r2
	bl sub_02055410
	cmp r0, #0
	bne _020570EC
	mov r0, r5
	bl sub_02055474
	cmp r0, #0
	bne _020570EC
	mov r0, r5
	bl sub_020554D8
	cmp r0, #0
	bne _020570EC
	ldrsh r0, [r6, #4]
	cmp r0, #0x214
	bne _020570F8
_020570EC:
	mov r0, r8, lsl #1
	strh r5, [sl, r0]
	add r8, r8, #1
_020570F8:
	add r7, r7, #1
	cmp r7, #4
	blt _02057084
	mov r0, #0
	ldr r3, _0205717C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	mvn r2, #0
_02057114:
	ldr r1, [r3]
	add r1, r1, sb, lsl #3
	add r1, r1, r0, lsl #1
	add r1, r1, #0x9800
	ldrsh r6, [r1, #0x56]
	cmp r6, r2
	beq _02057164
	mov r5, r4
	b _0205714C
_02057138:
	mov r1, r5, lsl #1
	ldrsh r1, [sl, r1]
	cmp r6, r1
	beq _02057154
	add r5, r5, #1
_0205714C:
	cmp r5, r8
	blt _02057138
_02057154:
	cmp r5, r8
	movge r1, r8, lsl #1
	strgeh r6, [sl, r1]
	addge r8, r8, #1
_02057164:
	add r0, r0, #1
	cmp r0, #4
	blt _02057114
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205717C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057030

	arm_func_start sub_02057180
sub_02057180: ; 0x02057180
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	sub sp, sp, #0x400
	add r0, sp, #0
	bl sub_020559D8
	mov r8, #0
	ldr fp, _020572E0 ; =_020A3398
	ldr r5, _020572E4 ; =TEAM_MEMBER_TABLE_PTR
	add r6, sp, #0
	mov r7, r8
	mvn r4, #0
_020571AC:
	mov sb, r7
_020571B0:
	ldr r0, [r5]
	add r0, r0, r8, lsl #3
	add r0, r0, sb, lsl #1
	add r0, r0, #0x9800
	ldrsh sl, [r0, #0x56]
	cmp sl, r4
	beq _02057200
	mov r0, sl, lsl #1
	ldrsh r3, [r6, r0]
	mov r0, fp
	mov r1, r8
	mov r2, sl
	bl Debug_Print0
	ldr r0, [r5]
	mov r1, sl, lsl #1
	add r0, r0, r8, lsl #3
	add r0, r0, sb, lsl #1
	ldrsh r1, [r6, r1]
	add r0, r0, #0x9800
	strh r1, [r0, #0x56]
_02057200:
	add sb, sb, #1
	cmp sb, #4
	blt _020571B0
	add r8, r8, #1
	cmp r8, #3
	blt _020571AC
	mov sb, #0
_0205721C:
	ldr r0, _020572E4 ; =TEAM_MEMBER_TABLE_PTR
	mov sl, #0
	ldr r0, [r0]
	mov r1, #0x1a0
	add r0, r0, #0x36c
	add r0, r0, #0x9000
	mla r8, sb, r1, r0
	mov fp, #1
	add r7, sp, #0
	mov r5, sl
	mov r6, sl
	mvn r4, #0
_0205724C:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, fp
	moveq r0, #0
	tst r0, #0xff
	beq _020572B0
	ldrsh r2, [r8, #8]
	ldr r0, _020572E8 ; =_020A33B8
	mov r1, sb
	mov r3, r2, lsl #1
	ldrsh r3, [r7, r3]
	bl Debug_Print0
	ldrsh r0, [r8, #8]
	mov r1, r0, lsl #1
	ldrsh r1, [r7, r1]
	cmp r1, r4
	streqb r6, [r8]
	beq _020572B0
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	ldrnesh r0, [r8, #8]
	movne r0, r0, lsl #1
	ldrnesh r0, [r7, r0]
	strneh r0, [r8, #8]
	streqb r5, [r8]
_020572B0:
	add sl, sl, #1
	cmp sl, #4
	add r8, r8, #0x68
	blt _0205724C
	and r0, sb, #0xff
	bl sub_02057464
	add sb, sb, #1
	cmp sb, #3
	blt _0205721C
	add sp, sp, #0x58
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020572E0: .word _020A3398
_020572E4: .word TEAM_MEMBER_TABLE_PTR
_020572E8: .word _020A33B8
	arm_func_end sub_02057180

	arm_func_start sub_020572EC
sub_020572EC: ; 0x020572EC
	ldr r0, _02057304 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _02057308 ; =sub_0205730C
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_02057304: .word TEAM_MEMBER_TABLE_PTR
_02057308: .word sub_0205730C
	arm_func_end sub_020572EC

	arm_func_start sub_0205730C
sub_0205730C: ; 0x0205730C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _0205739C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, r0
	ldr r0, [r1]
	mov r8, #0
	add r0, r0, #0x36c
	mov r1, #0x1a0
	add r0, r0, #0x9000
	mla r7, r4, r1, r0
	mov r5, r8
	mov r6, #1
_02057338:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _02057388
	ldrsh r0, [r7, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057388
	ldrsh r0, [r7, #8]
	bl IsValidTeamMember
	cmp r0, #0
	beq _02057388
	ldrsh r1, [r7, #8]
	mov r2, r8, lsl #0x10
	mov r0, r7
	mov r3, r4
	mov r2, r2, asr #0x10
	bl sub_02053174
_02057388:
	add r8, r8, #1
	cmp r8, #4
	add r7, r7, #0x68
	blt _02057338
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205739C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205730C

	arm_func_start sub_020573A0
sub_020573A0: ; 0x020573A0
	ldr r0, _020573B8 ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _020573BC ; =sub_020573C0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_020573B8: .word TEAM_MEMBER_TABLE_PTR
_020573BC: .word sub_020573C0
	arm_func_end sub_020573A0

	arm_func_start sub_020573C0
sub_020573C0: ; 0x020573C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02057440 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r1, [r1]
	mov r2, #0x1a0
	add r1, r1, #0x36c
	add r1, r1, #0x9000
	mla r7, r0, r2, r1
	mov r5, r4
	mov r6, #1
_020573E8:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _0205742C
	ldrsh r0, [r7, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _0205742C
	ldrsh r0, [r7, #8]
	bl IsValidTeamMember
	cmp r0, #0
	beq _0205742C
	ldrsh r0, [r7, #8]
	mov r1, r7
	bl sub_0205349C
_0205742C:
	add r4, r4, #1
	cmp r4, #4
	add r7, r7, #0x68
	blt _020573E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057440: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020573C0

	arm_func_start sub_02057444
sub_02057444: ; 0x02057444
	ldr r0, _0205745C ; =TEAM_MEMBER_TABLE_PTR
	ldr ip, _02057460 ; =sub_02057464
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bx ip
	.align 2, 0
_0205745C: .word TEAM_MEMBER_TABLE_PTR
_02057460: .word sub_02057464
	arm_func_end sub_02057444

	arm_func_start sub_02057464
sub_02057464: ; 0x02057464
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x8c
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	mov sl, #0
	ldr r2, [r1]
	mov r5, r0
	add r0, r2, r5, lsl #1
	add r0, r0, #0x9800
	ldrsh r1, [r0, #0x50]
	mvn r4, #0
	mov fp, sl
	cmp r1, r4
	addne r0, r2, r5, lsl #3
	addne r0, r0, r1, lsl #1
	addne r0, r0, #0x9800
	ldrnesh r4, [r0, #0x56]
	add r0, r2, #0x36c
	add r1, r0, #0x9000
	mov r0, #0x1a0
	mla sb, r5, r0, r1
	mov r6, #1
	add r7, sp, #0x1c
	mvn r8, #0
_020574C0:
	ldrb r0, [sb]
	mov r1, sl, lsl #1
	strh r8, [r7, r1]
	tst r0, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _02057514
	ldrsh r0, [sb, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057514
	ldrsh r0, [sb, #8]
	bl IsValidTeamMember
	cmp r0, #0
	ldrnesh r1, [sb, #8]
	movne r0, sl, lsl #1
	strneh r1, [r7, r0]
	bne _02057514
	ldrsh r0, [sb, #8]
	bl sub_020566C4
_02057514:
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #0x68
	blt _020574C0
	add r0, sp, #0x14
	mov r1, r5
	bl sub_02057030
	str r0, [sp, #0xc]
	ldr r0, _020577B8 ; =_020A33D4
	ldr r2, [sp, #0xc]
	mov r1, r5
	bl Debug_Print0
	mov r0, #0x1a0
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0
	mul r2, r5, r0
	ldr r1, [r1]
	mov sl, r7
	add r0, r1, #0x36c
	add r0, r0, #0x9000
	add r8, r0, r2
	add r0, r1, r2
	str r0, [sp, #8]
	b _0205767C
_02057574:
	add r0, sp, #0x14
	mov r1, sl, lsl #1
	ldrsh r0, [r0, r1]
	mov sb, r8
	mov r6, #0
	str r0, [sp]
	mov r0, r0
	cmp r4, r0
	moveq r0, sl, lsl #0x10
	moveq r7, r0, asr #0x10
	add r2, sp, #0x1c
	b _020575C0
_020575A4:
	mov r0, r6, lsl #1
	ldrsh r1, [r2, r0]
	ldr r0, [sp]
	cmp r1, r0
	beq _020575C8
	add r6, r6, #1
	add sb, sb, #0x68
_020575C0:
	cmp r6, #4
	blt _020575A4
_020575C8:
	cmp r6, #4
	bge _02057678
	cmp sl, r6
	beq _02057678
	ldr r0, [sp, #8]
	mov r1, #0x68
	mla r0, sl, r1, r0
	str r0, [sp, #4]
	add r0, r0, #0x36c
	add ip, sp, #0x24
	add lr, r0, #0x9000
	mov fp, #6
_020575F8:
	subs fp, fp, #1
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	bne _020575F8
	ldr r0, [sp, #4]
	add r2, r0, #0x36c
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	mov ip, sb
	add fp, r2, #0x9000
	mov lr, #6
_02057624:
	ldmia ip!, {r0, r1, r2, r3}
	stmia fp!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _02057624
	ldmia ip, {r0, r1}
	stmia fp, {r0, r1}
	add fp, sp, #0x24
	mov ip, #6
_02057644:
	ldmia fp!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02057644
	add r3, sp, #0x1c
	mov ip, sl, lsl #1
	ldrsh r2, [r3, ip]
	mov r6, r6, lsl #1
	ldmia fp, {r0, r1}
	stmia sb, {r0, r1}
	ldr r0, [sp]
	strh r2, [r3, r6]
	strh r0, [r3, ip]
_02057678:
	add sl, sl, #1
_0205767C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _02057574
	mov r1, #0
	mov sl, r1
	add r0, sp, #0x10
_02057694:
	strb sl, [r0, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _02057694
	add sb, sp, #0x14
	add r6, sp, #0x1c
	add r4, sp, #0x10
	mov fp, #1
	b _0205774C
_020576B8:
	ldr r0, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	mov r0, sl, lsl #1
	add r1, r1, r5, lsl #3
	add r1, r1, sl, lsl #1
	ldrsh r3, [sb, r0]
	add r1, r1, #0x9800
	ldrsh r2, [r6, r0]
	strh r3, [r1, #0x56]
	ldrsh r1, [sb, r0]
	cmp r2, r1
	beq _020576FC
	mov r0, r8
	mov r2, sl, lsl #0x10
	mov r2, r2, asr #0x10
	bl sub_020530D4
	b _02057724
_020576FC:
	ldrb r0, [r8, #0x3e]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r1, sl, #1
	ldrneb r0, [r8, #0x3f]
	andne r1, r1, #0xff
	strneb r1, [r4, r0]
	strneb r1, [r8, #0x3f]
_02057724:
	strh sl, [r8, #0xa]
	ldrb r0, [r8]
	cmp r7, sl
	add sl, sl, #1
	orr r0, r0, #2
	strb r0, [r8]
	streqb fp, [r8, #1]
	movne r0, #0
	strneb r0, [r8, #1]
	add r8, r8, #0x68
_0205774C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _020576B8
	mvn r3, #0
	mov r2, #0
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	b _02057784
_02057768:
	ldr r0, [r1]
	add r0, r0, r5, lsl #3
	add r0, r0, sl, lsl #1
	add r0, r0, #0x9800
	strh r3, [r0, #0x56]
	strb r2, [r8], #0x68
	add sl, sl, #1
_02057784:
	cmp sl, #4
	blt _02057768
	ldr r1, _020577B4 ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0x10
	ldr r2, [r1]
	mov r1, r5
	add r2, r2, r5, lsl #1
	add r2, r2, #0x9800
	strh r7, [r2, #0x50]
	bl sub_0200FA0C
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020577B4: .word TEAM_MEMBER_TABLE_PTR
_020577B8: .word _020A33D4
	arm_func_end sub_02057464

	arm_func_start sub_020577BC
sub_020577BC: ; 0x020577BC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	ldr r0, _02057A24 ; =_020A340C
	bl Debug_Print0
	cmp sl, #0xff
	beq _02057904
	mov r0, sl
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _020578E0
	ldr r4, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, _02057A2C ; =_020A336C
	ldr r3, [r4]
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r0, r3, #0x9000
	ldr r8, [r0, #0x84c]
	strb r2, [sp, #4]
	strb r1, [sp, #5]
	mov sb, #0
	and r7, r2, #0xff
	and r6, r1, #0xff
	add r5, sp, #0x1c
	mov fp, #0x44
_02057820:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020578D0
	strb r7, [sp, #6]
	strb r6, [sp, #7]
	mov r0, #0
	str r0, [sp]
	ldrsh r1, [r8, #8]
	ldr ip, [r4]
	add r0, sp, #8
	smlabb r1, r1, fp, ip
	ldrsh r1, [r1, #4]
	mov r2, #0
	add r3, sp, #6
	bl sub_02052E2C
	ldrb r0, [sp, #9]
	add r3, r8, #0x4c
	strb r0, [r8, #2]
	ldrsh r0, [sp, #0x10]
	strh r0, [r8, #6]
	ldrsh r0, [sp, #0x12]
	strh r0, [r8, #0xe]
	ldrsh r0, [sp, #0x12]
	strh r0, [r8, #0x10]
	ldrb r0, [sp, #0x14]
	strb r0, [r8, #0x12]
	ldrb r0, [sp, #0x15]
	strb r0, [r8, #0x13]
	ldrb r0, [sp, #0x16]
	strb r0, [r8, #0x14]
	ldrb r0, [sp, #0x17]
	strb r0, [r8, #0x15]
	ldr r0, [sp, #0x18]
	str r0, [r8, #0x18]
	ldmia r5, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldrb r2, [sp, #0x28]
	add r0, r8, #0x1c
	add r1, sp, #0x2a
	strb r2, [r8, #0x58]
	bl GroundToDungeonMoveset
_020578D0:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057820
_020578E0:
	ldr r0, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, sb, lsl #1
	ldr r1, [r0]
	ldr r0, _02057A30 ; =_020A343C
	add r1, r1, #0x9000
	ldr r3, [r1, #0x870]
	mov r1, sb
	ldrsh r2, [r3, r2]
	bl Debug_Print0
_02057904:
	ldr r0, _02057A34 ; =_020A344C
	bl Debug_Print0
	mov r0, sl
	bl GetMaxMembersAllowed
	mov r8, #0
	ldr r1, _02057A28 ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #1
	ldr r1, [r1]
	mov r7, r0
	add r0, r1, #0x9000
	ldr sl, [r0, #0x84c]
	mov sb, r8
	mov fp, sl
	mov r5, r8
	mov r3, r8
	mov r4, r6
	mov r0, r8
	mov r1, r6
	b _020579A4
_02057950:
	ldrb r2, [fp]
	tst r2, #1
	movne ip, r6
	moveq ip, r5
	tst ip, #0xff
	beq _0205799C
	tst r2, #2
	movne r2, r4
	moveq r2, r3
	tst r2, #0xff
	beq _0205799C
	ldrb r2, [fp, #1]
	cmp r2, #0
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	movne r0, sb, lsl #0x10
	movne r8, r0, asr #0x10
	bne _020579AC
_0205799C:
	add sb, sb, #1
	add fp, fp, #0x68
_020579A4:
	cmp sb, #4
	blt _02057950
_020579AC:
	mov sb, #0
	mov r6, #1
	mov fp, sb
	mov r5, r6
	mov r4, sb
_020579C0:
	ldrb r0, [sl]
	tst r0, #1
	movne r1, r5
	moveq r1, fp
	tst r1, #0xff
	beq _02057A08
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	cmpne r8, sb
	beq _02057A08
	cmp r6, r7
	addlt r6, r6, #1
	blt _02057A08
	strb r4, [sl]
	ldrsh r0, [sl, #8]
	bl sub_020566C4
_02057A08:
	add sb, sb, #1
	cmp sb, #4
	add sl, sl, #0x68
	blt _020579C0
	bl sub_02058064
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02057A24: .word _020A340C
_02057A28: .word TEAM_MEMBER_TABLE_PTR
_02057A2C: .word _020A336C
_02057A30: .word _020A343C
_02057A34: .word _020A344C
	arm_func_end sub_020577BC

	arm_func_start sub_02057A38
sub_02057A38: ; 0x02057A38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mvn r0, #0
	cmp r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020568A4
	ldr r1, _02057AC0 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r1, [r1]
	mov r4, r6, lsl #1
	add r1, r1, #0x9000
	ldr r5, [r1, #0x870]
	ldr r3, [r1, #0x84c]
	ldrsh r4, [r5, r4]
	sub r1, r2, #0x69
	mla r5, r6, r2, r3
	mov r7, r0
	cmp r4, r1
	beq _02057AB4
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl sub_020530D4
	strh r6, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, r7
	orr r0, r0, #2
	strb r0, [r5]
	moveq r0, #1
	streqb r0, [r5, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02057AB4:
	mov r0, #0
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057AC0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057A38

	arm_func_start sub_02057AC4
sub_02057AC4: ; 0x02057AC4
	stmdb sp!, {r4, lr}
	mov r4, #0
_02057ACC:
	mov r0, r4
	bl sub_02057A38
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	blt _02057ACC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02057AC4

	arm_func_start sub_02057AEC
sub_02057AEC: ; 0x02057AEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl IsLevelResetDungeon
	cmp r4, #0xff
	moveq sl, #0
	beq _02057B10
	mov r0, r4
	bl IsLevelResetDungeon
	mov sl, r0
_02057B10:
	bl GetGameMode
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	and r7, r0, #0xff
	bl sub_02057C40
	bl RemoveActiveMembersFromMainTeam
	mov sb, #0
	ldr r0, _02057C3C ; =TEAM_MEMBER_TABLE_PTR
	mov r6, #1
	ldr r0, [r0]
	mov r5, sb
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov fp, sb
	mov r4, r6
_02057B50:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _02057C14
	ldrsh r0, [r8, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	bne _02057C14
	ldrsh r0, [r8, #0xc]
	bl GetBaseFormCastformCherrimDeoxys
	strh r0, [r8, #0xc]
	ldrsh r0, [r8, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02057C14
	ldrb r0, [r8, #1]
	cmp r0, #0
	movne r0, r4
	moveq r0, fp
	tst r0, #0xff
	ldrsh r0, [r8, #8]
	beq _02057BB8
	bl TryAddMonsterToActiveTeam
	b _02057BBC
_02057BB8:
	bl sub_02056554
_02057BBC:
	cmp sl, #0
	beq _02057BE8
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058138
	mov r2, sb, lsl #0x10
	ldrsh r1, [r8, #8]
	mov r0, r8
	mov r2, r2, asr #0x10
	bl sub_020530D4
	b _02057C14
_02057BE8:
	cmp r7, #0
	beq _02057C00
	ldrsh r0, [r8, #8]
	mov r1, r8
	bl sub_0205349C
	b _02057C14
_02057C00:
	ldrsh r1, [r8, #8]
	mov r2, sb, lsl #0x10
	mov r0, r8
	mov r2, r2, asr #0x10
	bl sub_020530D4
_02057C14:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057B50
	ldr r0, _02057C3C ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldrb r0, [r0, #0x877]
	bl sub_02057464
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02057C3C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057AEC

	arm_func_start sub_02057C40
sub_02057C40: ; 0x02057C40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02057CE4 ; =TEAM_MEMBER_TABLE_PTR
	mov sb, #0
	ldr r0, [r0]
	mov r7, #1
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov r6, sb
	mov r4, sb
	mov r5, r7
_02057C68:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02057CC8
	ldrb r0, [r8, #0x3e]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02057CC8
	ldrb r0, [r8, #0x3e]
	bic r0, r0, #8
	strb r0, [r8, #0x3e]
	ldrsh r0, [r8, #0x42]
	cmp r0, #0xb7
	bne _02057CC8
	add r0, r8, #0x3e
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058138
_02057CC8:
	add sb, sb, #1
	cmp sb, #4
	add r8, r8, #0x68
	blt _02057C68
	bl CleanStickyItemsInBag
	bl RemovePokeItemsInBag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02057CE4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057C40

	arm_func_start sub_02057CE8
sub_02057CE8: ; 0x02057CE8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
_02057D00:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02057D40
	ldrb r1, [r0, #0x3e]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	tst r1, #0xff
	ldrneb r1, [r0, #0x3e]
	bicne r1, r1, #8
	strneb r1, [r0, #0x3e]
_02057D40:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02057D00
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02057CE8

	arm_func_start RefillTeam
RefillTeam: ; 0x02057D58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _02057DF8 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldr r4, [r0, #0x84c]
_02057D70:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02057DE4
	ldrsh r1, [r4, #0x10]
	mov r0, r4
	strh r1, [r4, #0xe]
	bl sub_02058810
	mov r6, #0
	add r7, r4, #0x1c
	mov r8, r6
	mov sb, #1
_02057DA8:
	add r0, r4, r6, lsl #3
	ldrb r0, [r0, #0x1c]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _02057DD4
	add r0, r7, r6, lsl #3
	bl GetMaxPp
	add r1, r4, r6, lsl #3
	strb r0, [r1, #0x22]
_02057DD4:
	add r6, r6, #1
	cmp r6, #4
	blt _02057DA8
	strh r5, [r4, #0xa]
_02057DE4:
	add r5, r5, #1
	cmp r5, #4
	add r4, r4, #0x68
	blt _02057D70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02057DF8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end RefillTeam

#ifndef JAPAN
	arm_func_start sub_02057DFC
sub_02057DFC: ; 0x02057DFC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02057E8C ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0
	ldr r1, [r1]
	mov ip, #1
	add r1, r1, #0x9000
	ldr r6, [r1, #0x84c]
	mov r3, r0
	mov r4, r0
	mov r5, ip
	mov lr, r0
_02057E28:
	ldrb r1, [r6]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	tst r1, #0xff
	beq _02057E78
	mov r7, lr
_02057E44:
	add r1, r6, r7, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	addne r2, r6, r7, lsl #3
	ldrneb r1, [r2, #0x1c]
	add r7, r7, #1
	andne r1, r1, #0xf
	strneb r1, [r2, #0x1c]
	cmp r7, #4
	blt _02057E44
_02057E78:
	add r0, r0, #1
	cmp r0, #4
	add r6, r6, #0x68
	blt _02057E28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02057E8C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057DFC
#endif

	arm_func_start sub_02057E90
sub_02057E90: ; 0x02057E90
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _02057EF0 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r0, [r0]
	mov r6, r4
	add r0, r0, #0x9000
	ldr r8, [r0, #0x84c]
	mov r7, #1
	mov r5, r4
_02057EB4:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02057EDC
	ldrsh r0, [r8, #8]
	bl CheckTeamMemberIdx
	cmp r0, #0
	strneb r5, [r8]
_02057EDC:
	add r4, r4, #1
	cmp r4, #4
	add r8, r8, #0x68
	blt _02057EB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02057EF0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057E90

	arm_func_start sub_02057EF4
sub_02057EF4: ; 0x02057EF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _02058060 ; =TEAM_MEMBER_TABLE_PTR
	mov r8, #0
	ldr r0, [r0]
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
_02057F0C:
	ldrb r0, [r7]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	bne _02057F38
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205804C
_02057F38:
	ldrsh sb, [r7, #8]
	ldrsh r1, [r7, #0x10]
	mov r0, r7
	strh r1, [r7, #0xe]
	bl sub_02058810
	mov sl, #0
	add r5, r7, #0x1c
	mov fp, sl
	mov r6, #1
	mov r4, sl
_02057F60:
	add r0, r7, sl, lsl #3
	ldrb r0, [r0, #0x1c]
	tst r0, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _02057F90
	add r0, r5, sl, lsl #3
	bl GetMaxPp
	add r1, r7, sl, lsl #3
	strb r0, [r1, #0x22]
	strh r4, [r1, #0x1e]
_02057F90:
	add sl, sl, #1
	cmp sl, #4
	blt _02057F60
	strh r8, [r7, #0xa]
	ldrb r1, [r7]
	mov r0, sb
	bic r2, r1, #8
	and r1, r2, #0xff
	orr r1, r1, #1
	strb r1, [r7]
	bl CheckTeamMemberIdx
	cmp r0, #0
	mov r0, sb
	mov r1, #0
	bne _02058048
	bl sub_02056460
	cmp r0, #0
	beq _02057FE4
	mov r0, sb
	mov r1, #0
	bl sub_020565F4
_02057FE4:
	mov r0, sb
	mov r1, #2
	bl sub_02056460
	cmp r0, #0
	beq _02058004
	mov r0, sb
	mov r1, #2
	bl sub_020565F4
_02058004:
	mov r0, sb
	mov r1, #0
	bl sub_02056504
	cmp r0, #0
	beq _02058024
	mov r0, sb
	mov r1, #0
	bl sub_020565F4
_02058024:
	mov r0, sb
	mov r1, #2
	bl sub_02056504
	cmp r0, #0
	beq _0205804C
	mov r0, sb
	mov r1, #2
	bl sub_020565F4
	b _0205804C
_02058048:
	bl sub_020565F4
_0205804C:
	add r8, r8, #1
	cmp r8, #4
	add r7, r7, #0x68
	blt _02057F0C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02058060: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02057EF4

	arm_func_start sub_02058064
sub_02058064: ; 0x02058064
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020580C0 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	add r0, r0, #0x9000
	ldr r7, [r0, #0x84c]
	mov r6, #1
_02058084:
	ldrb r0, [r7]
	tst r0, #1
	movne r0, r6
	moveq r0, r5
	tst r0, #0xff
	beq _020580A4
	add r0, r7, #0x5a
	bl ShuffleHiddenPower
_020580A4:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	add r7, r7, #0x68
	blt _02058084
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020580C0: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058064

	arm_func_start sub_020580C4
sub_020580C4: ; 0x020580C4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02058134 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, #0
	ldr r1, [r1]
	add r2, r5, #1
	add r1, r1, #0x9000
	ldr r4, [r1, #0x84c]
	and r6, r2, #0xff
	strb r5, [r0]
	mov ip, r5
	mov lr, #1
	mov r3, r5
_020580F4:
	ldrb r1, [r4]
	add r4, r4, #0x68
	tst r1, #1
	movne r1, lr
	moveq r1, ip
	tst r1, #0xff
	addeq r1, r0, r5
	streqb r3, [r1, #1]
	addne r1, r0, r5
	addne r2, r6, #1
	strneb r6, [r1, #1]
	add r5, r5, #1
	andne r6, r2, #0xff
	cmp r5, #4
	blt _020580F4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02058134: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020580C4

	arm_func_start sub_02058138
sub_02058138: ; 0x02058138
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _020581EC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x68
	ldr r2, [r2]
	smulbb r1, r0, r1
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r3, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _020581E0
	ldrb r1, [r3, #0x3e]
	tst r1, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r3, #0x3f]
	cmpne r0, #0
	beq _020581E0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _020581E0
	ldrh r1, [r3, #0x3e]
	add r0, r3, #0x3e
	strh r1, [sp]
	ldrh r2, [r3, #0x40]
	ldrb r1, [sp]
	strh r2, [sp, #2]
	ldrh r2, [r3, #0x42]
	bic r1, r1, #0x10
	strh r2, [sp, #4]
	strb r1, [sp]
	bl ItemZInit
	add r0, sp, #0
	bl RemoveHolderForItemInBag
	b _020581E4
_020581E0:
	mov r0, #0
_020581E4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020581EC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058138

	arm_func_start ClearItem
ClearItem: ; 0x020581F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _020582DC ; =TEAM_MEMBER_TABLE_PTR
	cmp r0, #0
	ldr r2, [r2]
	add r2, r2, #0x9000
	ldr r2, [r2, #0x84c]
	beq _020582D0
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
	mov r3, r8
	mov ip, r7
	b _020582C8
_02058230:
	ldrb lr, [r2]
	tst lr, #1
	movne sb, r7
	moveq sb, r6
	tst sb, #0xff
	beq _020582C0
	ldrb sb, [r2, #0x3e]
	tst sb, #1
	movne lr, r5
	moveq lr, r4
	tst lr, #0xff
	beq _020582C0
	ldrb lr, [r2, #0x3f]
	cmp lr, r0
	bne _020582C0
	cmp r1, #0
	beq _02058288
	tst sb, #8
	movne sb, ip
	moveq sb, r3
	tst sb, #0xff
	bne _020582C0
_02058288:
	ldrh r1, [r2, #0x3e]
	add r0, r2, #0x3e
	strh r1, [sp]
	ldrh r3, [r2, #0x40]
	ldrb r1, [sp]
	strh r3, [sp, #2]
	ldrh r2, [r2, #0x42]
	bic r1, r1, #0x10
	strh r2, [sp, #4]
	strb r1, [sp]
	bl ItemZInit
	add r0, sp, #0
	bl RemoveHolderForItemInBag
	b _020582D4
_020582C0:
	add r8, r8, #1
	add r2, r2, #0x68
_020582C8:
	cmp r8, #4
	blt _02058230
_020582D0:
	mov r0, #0
_020582D4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020582DC: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ClearItem

	arm_func_start sub_020582E0
sub_020582E0: ; 0x020582E0
	ldr ip, _020582EC ; =ClearItem
	mov r1, #1
	bx ip
	.align 2, 0
_020582EC: .word ClearItem
	arm_func_end sub_020582E0

	arm_func_start sub_020582F0
sub_020582F0: ; 0x020582F0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr r3, _0205845C ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x68
	ldr r3, [r3]
	smulbb r2, r0, r2
	add r0, r3, #0x9000
	ldr r3, [r0, #0x84c]
	mov r5, r1
	ldrb r0, [r3, r2]
	add r4, r3, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02058450
	mov r0, r5
	bl GetItemAtIdx
	ldrb r2, [r4, #0x3e]
	mov r1, r0
	tst r2, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02058404
	ldrb r0, [r4, #0x3f]
	cmp r0, #0
	bne _02058374
	tst r2, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02058448
_02058374:
	ldrh r2, [r4, #0x3e]
	add r0, sp, #6
	strh r2, [sp, #6]
	ldrh r3, [r4, #0x40]
	ldrb r2, [sp, #6]
	strh r3, [sp, #8]
	ldrh ip, [r4, #0x42]
	bic r3, r2, #0x10
	strh ip, [sp, #0xa]
	ldrh r2, [r1]
	strh r2, [sp]
	ldrh ip, [r1, #2]
	ldrb r2, [sp]
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	bic r1, r2, #0x10
	strh ip, [sp, #4]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	strb r2, [sp, #1]
	strb r1, [sp]
	strb r3, [sp, #6]
	bl RemoveHolderForItemInBag
	ldrh r2, [sp]
	add r1, sp, #0
	mov r0, r5
	strh r2, [r4, #0x3e]
	ldrh r2, [sp, #2]
	strh r2, [r4, #0x40]
	ldrh r2, [sp, #4]
	strh r2, [r4, #0x42]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	and r2, r2, #0xff
	bl SetHolderForItemInBag
	b _02058448
_02058404:
	ldrh r2, [r1]
	mov r0, r5
	strh r2, [r4, #0x3e]
	ldrh r2, [r1, #2]
	strh r2, [r4, #0x40]
	ldrh r2, [r1, #4]
	strh r2, [r4, #0x42]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	strb r2, [r4, #0x3f]
	ldrb r2, [r4, #0x3e]
	bic r2, r2, #0x10
	strb r2, [r4, #0x3e]
	ldrsh r2, [r4, #0xa]
	add r2, r2, #1
	and r2, r2, #0xff
	bl SetHolderForItemInBag
_02058448:
	mov r0, #1
	b _02058454
_02058450:
	mov r0, #0
_02058454:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0205845C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020582F0

	arm_func_start sub_02058460
sub_02058460: ; 0x02058460
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, r0
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020584F4 ; =TEAM_MEMBER_TABLE_PTR
	sub r1, r1, #1
	mov ip, r1, lsl #0x10
	ldr r1, [r0]
	mov r0, #0
	add r1, r1, #0x9000
	mov r4, r0
	mov r5, #1
	mov r3, #0x68
	b _020584E4
_0205849C:
	smulbb r6, r0, r3
	ldr r7, [r1, #0x84c]
	ldrb lr, [r7, r6]
	add r6, r7, r6
	tst lr, #1
	movne r7, r5
	moveq r7, r4
	tst r7, #0xff
	beq _020584D8
	ldrsh lr, [r6, #0xa]
	cmp lr, ip, asr #16
	bne _020584D8
	mov r1, r2
	bl sub_020582F0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020584D8:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_020584E4:
	cmp r0, #4
	blt _0205849C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020584F4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058460

	arm_func_start sub_020584F8
sub_020584F8: ; 0x020584F8
	bx lr
	arm_func_end sub_020584F8

	arm_func_start sub_020584FC
sub_020584FC: ; 0x020584FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	ldrb r0, [r1, #1]
	add r1, r1, #0x5e
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r4
	and r2, r2, #0xff
	bl sub_02054FA0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020584FC

	arm_func_start sub_02058534
sub_02058534: ; 0x02058534
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	cmp r4, #0x44
	bne _02058578
	ldrb r0, [r1, #1]
	add r1, r1, #0x5e
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	mov r0, r5
	and r2, r2, #0xff
	bl sub_02054FA0
	ldmia sp!, {r3, r4, r5, pc}
_02058578:
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x5e
	bl sub_02054F44
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02058534

	arm_func_start sub_0205858C
sub_0205858C: ; 0x0205858C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetActiveTeamMember
	mov r1, r0
	mov r0, r4
	add r1, r1, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205858C

	arm_func_start sub_020585B4
sub_020585B4: ; 0x020585B4
	ldrb r2, [r1, #1]
	ldr ip, _020585D4 ; =sub_02054FA0
	add r1, r1, #0x5e
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	and r2, r2, #0xff
	bx ip
	.align 2, 0
_020585D4: .word sub_02054FA0
	arm_func_end sub_020585B4

	arm_func_start ChangeGiratinaFormIfSkyDungeon
ChangeGiratinaFormIfSkyDungeon: ; 0x020585D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl IsSkyExclusiveDungeon
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0
	ldr r4, _02058640 ; =0x00000211
	mov r6, r8
	mov r7, #1
	mov r5, #0x218
_020585FC:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02058628
	ldrsh r1, [r0, #0xc]
	cmp r1, r4
	streqh r5, [r0, #0xc]
_02058628:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _020585FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02058640: .word 0x00000211
	arm_func_end ChangeGiratinaFormIfSkyDungeon

	arm_func_start sub_02058644
sub_02058644: ; 0x02058644
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_02058650:
	mov r0, r4
	mov r1, r5
	bl RevertGiratinaAndShaymin
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #4
	blt _02058650
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02058644

	arm_func_start RevertGiratinaAndShaymin
RevertGiratinaAndShaymin: ; 0x02058674
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_02056228
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl GetActiveTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	tst r4, #2
	beq _020586C8
	ldrsh r1, [r0, #0xc]
	cmp r1, #0x218
	ldreq r1, _020586E8 ; =0x00000211
	streqh r1, [r0, #0xc]
	ldmeqia sp!, {r3, r4, r5, pc}
_020586C8:
	tst r4, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r2, [r0, #0xc]
	ldr r1, _020586EC ; =0x00000217
	cmp r2, r1
	subeq r1, r1, #1
	streqh r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020586E8: .word 0x00000211
_020586EC: .word 0x00000217
	arm_func_end RevertGiratinaAndShaymin

	arm_func_start sub_020586F0
sub_020586F0: ; 0x020586F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetActiveTeamMember
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205878C
	mov r0, r5
	bl GetItemMoveId16
	mov ip, #0
	mov r2, ip
	mov r3, #1
	b _02058768
_02058730:
	add r1, r4, ip, lsl #3
	ldrb r1, [r1, #0x1c]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _0205875C
	add r1, r4, ip, lsl #3
	ldrh r1, [r1, #0x20]
	cmp r0, r1
	beq _02058770
_0205875C:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	mov ip, r1, asr #0x10
_02058768:
	cmp ip, #4
	blt _02058730
_02058770:
	cmp ip, #4
	blt _0205878C
	ldrsh r1, [r4, #0xc]
	bl sub_02053D1C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_0205878C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020586F0

	arm_func_start sub_02058794
sub_02058794: ; 0x02058794
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0204E584
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r4, #8]
	bl GetTeamMember
	mov r1, r4
	bl sub_020534BC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02058794

	arm_func_start sub_020587C8
sub_020587C8: ; 0x020587C8
	stmdb sp!, {r3, lr}
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
	bl RefillTeam
	ldmia sp!, {r3, pc}
	arm_func_end sub_020587C8

	arm_func_start sub_020587E0
sub_020587E0: ; 0x020587E0
	stmdb sp!, {r4, lr}
	mov r4, r0
#ifndef JAPAN
	bl sub_02057DFC
#endif
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
	bl RefillTeam
	mov r0, r4
	bl sub_02057AEC
	mov r0, #0
	bl sub_02056318
	ldmia sp!, {r4, pc}
	arm_func_end sub_020587E0

	arm_func_start sub_02058810
sub_02058810: ; 0x02058810
	mov r2, #0x64
	strh r2, [r0, #0x48]
	mov r1, #0
	strh r2, [r0, #0x44]
	strh r1, [r0, #0x4a]
	strh r1, [r0, #0x46]
	bx lr
	arm_func_end sub_02058810

	arm_func_start sub_0205882C
sub_0205882C: ; 0x0205882C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x30
	ldr r1, _02058AA4 ; =0x000003E3
	mov r4, r0
	mov r3, #0
	add r2, sp, #0x14
	mov r0, #4
	str r3, [sp, #0x1c]
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #0x14]
	add r0, sp, #0x1c
	bl HandleSir0Translation
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl sub_02058ABC
	mov r0, r4, lsl #0x10
	ldr r5, [sp, #0x1c]
	mov r0, r0, asr #0x10
	mov r1, #0
	bl sub_02058ABC
	add r1, r5, #4
	mov r2, #0x40
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl sub_02058ABC
	add r1, r5, #0x24
	mov r2, #0x80
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, r4, #2
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl sub_02058ABC
	add r1, r5, #0x64
	mov r2, #0x100
	mov r3, #9
	bl CopyAndInterleaveWrapper
	add r0, sp, #0x14
	bl UnloadFile
	mov lr, #0
_020588E4:
	ldr r3, _02058AA8 ; =_020A3468
	ldr r5, _02058AAC ; =_022B578C
	add r2, r3, lr, lsl #4
	ldr r1, [r2, #8]
	ldr r0, _02058AB0 ; =0x000003FF
	add r1, r4, r1
	add r7, r5, lr, lsl #4
	mov sb, #0x400
	ldr r3, [r3, lr, lsl #4]
	and r8, r1, r0
	ldr r2, [r2, #4]
	mov r1, r3, lsl #0x1e
	mov r5, #0
	mov r0, r2, lsl #0x1e
	rsb sb, sb, #0
	mov r2, r5
	mov r3, #1
_02058928:
	mov ip, r5, lsl #3
	ldrh sl, [r7, ip]
	add r6, r7, r5, lsl #3
	cmp r5, #1
	bic sl, sl, #0x100
	strh sl, [r7, ip]
	ldrh sl, [r7, ip]
	add r5, r5, #1
	bic sl, sl, #0x200
	strh sl, [r7, ip]
	ldrh sl, [r6]
	moveq ip, r3
	movne ip, r2
	bic sl, sl, #0xc00
	strh sl, [r6]
	ldrh sl, [r6]
	mov ip, ip, lsl #0x1e
	cmp r5, #2
	orr sl, sl, ip, lsr #20
	strh sl, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0x1000
	strh ip, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0x2000
	strh ip, [r6]
	ldrh ip, [r6]
	orr ip, ip, #0x2000
	strh ip, [r6]
	ldrh ip, [r6]
	bic ip, ip, #0xc000
	strh ip, [r6]
	ldrh ip, [r6]
	orr ip, ip, r1, lsr #16
	strh ip, [r6]
	ldrh ip, [r6, #2]
	bic ip, ip, #0x3e00
	strh ip, [r6, #2]
	ldrh ip, [r6, #2]
	bic ip, ip, #0xc000
	strh ip, [r6, #2]
	ldrh ip, [r6, #2]
	orr ip, ip, r0, lsr #16
	strh ip, [r6, #2]
	ldrh ip, [r6, #4]
	and ip, ip, sb
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	orr ip, ip, r8
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	bic ip, ip, #0xc00
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	orr ip, ip, #0xc00
	strh ip, [r6, #4]
	ldrh ip, [r6, #4]
	bic ip, ip, #0xf000
	strh ip, [r6, #4]
	ldrh ip, [r6, #6]
	bic ip, ip, #1
	strh ip, [r6, #6]
	ldrh ip, [r6, #6]
	bic ip, ip, #2
	strh ip, [r6, #6]
	blt _02058928
	add lr, lr, #1
	cmp lr, #3
	blt _020588E4
	ldr r1, _02058AB4 ; =0x000003E5
	add r2, sp, #0xc
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp, #0xc]
	add r0, sp, #8
	bl HandleSir0Translation
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x20
	mov r2, #1
	mov r3, #0x20
	bl sub_0201F598
	ldr r0, _02058AB8 ; =_020AFC4C
	add r1, sp, #0x20
	ldr r0, [r0]
	mov r2, #0
	bl sub_0201B43C
	add r0, sp, #0xc
	bl UnloadFile
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02058AA4: .word 0x000003E3
_02058AA8: .word _020A3468
_02058AAC: .word _022B578C
_02058AB0: .word 0x000003FF
_02058AB4: .word 0x000003E5
_02058AB8: .word _020AFC4C
	arm_func_end sub_0205882C

	arm_func_start sub_02058ABC
sub_02058ABC: ; 0x02058ABC
	ldr r3, _02058AF4 ; =_020AFC4C
	mov r2, #0x70
	ldr ip, [r3]
	ldr r3, _02058AF8 ; =_020AFC28
	mla r2, r1, r2, ip
	ldrh r1, [r2, #0xc]
	ldr ip, [r2, #0x64]
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #30
	add r1, r2, r1, ror #30
	mov r1, r1, lsl #1
	ldrsh r1, [r3, r1]
	smlabb r0, r0, r1, ip
	bx lr
	.align 2, 0
_02058AF4: .word _020AFC4C
_02058AF8: .word _020AFC28
	arm_func_end sub_02058ABC

	arm_func_start sub_02058AFC
sub_02058AFC: ; 0x02058AFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	cmp r0, #0x32
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmpne r0, #0x33
	beq _02058B38
	ldr r1, _02058C08 ; =0xFFFFFD76
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _02058B40
_02058B38:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02058B40:
	bl GetShadowSize
	ldrb r1, [sp, #0x24]
	mov r7, #0x200
	ldrsh lr, [r6]
	cmp r1, #0
	ldr r1, _02058C0C ; =_022B578C
	movne r2, #1
	moveq r2, #0
	add r1, r1, r0, lsl #4
	add r1, r1, r2, lsl #3
	ldr sb, _02058C10 ; =_020A3450
	ldrh r8, [r1, #2]
	ldrsh ip, [r5, #0x24]
	ldrsh r3, [r6, #2]
	ldrsh r2, [r5, #0x26]
	rsb r7, r7, #0
	and r5, r8, r7
	strh r5, [r1, #2]
	ldr r0, [sb, r0, lsl #2]
	add r5, lr, ip
	add r0, r5, r0
	ldrh r5, [r1, #2]
	and r0, r0, r7, lsr #23
	add r2, r3, r2
	orr r0, r5, r0
	strh r0, [r1, #2]
	sub r0, r2, #2
	sub r2, r0, #2
	mov r3, r2, lsl #0x14
	ldrh r5, [r1, #6]
	ldr r0, _02058C14 ; =0xFFFF000F
	ldr r2, [sp, #0x20]
	and r0, r5, r0
	strh r0, [r1, #6]
	ldrh r5, [r1, #6]
	ldr r0, _02058C18 ; =_020AFC4C
	orr r3, r5, r3, lsr #16
	strh r3, [r1, #6]
	ldrh r5, [r1, #4]
	mov r3, r2, lsl #0x1e
	ldr r0, [r0]
	bic r2, r5, #0xc00
	strh r2, [r1, #4]
	ldrh r5, [r1, #4]
	mov r2, r4
	orr r3, r5, r3, lsr #20
	strh r3, [r1, #4]
	bl sub_0201B9F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02058C08: .word 0xFFFFFD76
_02058C0C: .word _022B578C
_02058C10: .word _020A3450
_02058C14: .word 0xFFFF000F
_02058C18: .word _020AFC4C
	arm_func_end sub_02058AFC

	arm_func_start GetIqSkillStringId
GetIqSkillStringId: ; 0x02058C1C
#if defined(EUROPE)
	add r0, r0, #0xe7
	add r0, r0, #0x2600
#elif defined(JAPAN)
	add r0, r0, #0x13
	add r0, r0, #0x3f00
#else
	add r0, r0, #0xe5
	add r0, r0, #0x2600
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end GetIqSkillStringId

	arm_func_start sub_02058C30
sub_02058C30: ; 0x02058C30
	ldr ip, _02058C38 ; =CopyTacticString
	bx ip
	.align 2, 0
_02058C38: .word CopyTacticString
	arm_func_end sub_02058C30

	arm_func_start DoesTacticFollowLeader
DoesTacticFollowLeader: ; 0x02058C3C
	ldr r1, _02058C48 ; =_020A190C
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02058C48: .word _020A190C
	arm_func_end DoesTacticFollowLeader

	arm_func_start GetUnlockedTactics
GetUnlockedTactics: ; 0x02058C4C
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r3, _02058C98 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov ip, lr
_02058C5C:
	mov r2, ip, lsl #1
	ldrsh r2, [r3, r2]
	cmp r2, r1
	strleb ip, [r0, lr]
	add ip, ip, #1
	addle lr, lr, #1
	cmp ip, #0xc
	blt _02058C5C
	mov r1, #0xb
	b _02058C8C
_02058C84:
	strb r1, [r0, lr]
	add lr, lr, #1
_02058C8C:
	cmp lr, #0xc
	blt _02058C84
	ldmia sp!, {r3, pc}
	.align 2, 0
_02058C98: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTactics

	arm_func_start GetUnlockedTacticFlags
GetUnlockedTacticFlags: ; 0x02058C9C
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr lr, _02058CD4 ; =TACTICS_UNLOCK_LEVEL_TABLE
	mov r2, r4
	mov r3, #1
_02058CB0:
	mov ip, r4, lsl #1
	ldrsh ip, [lr, ip]
	cmp ip, r1
	strleb r3, [r0, r4]
	strgtb r2, [r0, r4]
	add r4, r4, #1
	cmp r4, #0xc
	blt _02058CB0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02058CD4: .word TACTICS_UNLOCK_LEVEL_TABLE
	arm_func_end GetUnlockedTacticFlags

	arm_func_start CanLearnIqSkill
CanLearnIqSkill: ; 0x02058CD8
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldr r2, _02058D00 ; =IQ_SKILLS
	ldr r1, [r2, r1, lsl #2]
	cmp r1, r0
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02058D00: .word IQ_SKILLS
	arm_func_end CanLearnIqSkill

	arm_func_start GetLearnableIqSkills
GetLearnableIqSkills: ; 0x02058D04
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r5, r6
	ldr r4, _02058DA0 ; =IQ_GROUP_SKILLS
	mov fp, #0x19
	b _02058D74
_02058D28:
	mov r0, sb
	bl GetIqGroup
	mla r1, r0, fp, r4
	and r0, r5, #0xff
	ldrb r7, [r0, r1]
	cmp r7, #0xff
	beq _02058D7C
	cmp r7, #0x18
	bne _02058D58
	mov r0, #3
	bl GetPerformanceFlagWithChecks
	b _02058D64
_02058D58:
	mov r0, r8
	mov r1, r7
	bl CanLearnIqSkill
_02058D64:
	cmp r0, #0
	strneb r7, [sl, r6]
	addne r6, r6, #1
	add r5, r5, #1
_02058D74:
	cmp r5, #0x19
	blt _02058D28
_02058D7C:
	mov r1, r6
	mov r0, #0
	b _02058D90
_02058D88:
	strb r0, [sl, r1]
	add r1, r1, #1
_02058D90:
	cmp r1, #0x45
	blt _02058D88
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02058DA0: .word IQ_GROUP_SKILLS
	arm_func_end GetLearnableIqSkills

	arm_func_start DisableIqSkill
DisableIqSkill: ; 0x02058DA4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl IqSkillFlagTest
	cmp r0, #0
	beq _02058DE4
	mov r0, r5, asr #4
	add r0, r5, r0, lsr #27
	mov r2, r0, asr #5
	sub r0, r5, r2, lsl #5
	mov r1, #1
	mvn r0, r1, lsl r0
	ldr r1, [r4, r2, lsl #2]
	and r0, r1, r0
	str r0, [r4, r2, lsl #2]
	ldmia sp!, {r3, r4, r5, pc}
_02058DE4:
	mov r0, r4
	mov r1, r5
	bl EnableIqSkill
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DisableIqSkill

	arm_func_start EnableIqSkill
EnableIqSkill: ; 0x02058DF4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02058E64 ; =IQ_SKILL_RESTRICTIONS
	mov r3, r1, lsl #1
	ldrsh ip, [r2, r3]
	mov r3, #0
	mov r4, #1
_02058E0C:
	mov r5, r3, lsl #1
	ldrsh r5, [r2, r5]
	cmp ip, r5
	bne _02058E3C
	mov lr, r3, asr #4
	add lr, r3, lr, lsr #27
	mov r6, lr, asr #5
	sub lr, r3, r6, lsl #5
	mvn lr, r4, lsl lr
	ldr r5, [r0, r6, lsl #2]
	and r5, r5, lr
	str r5, [r0, r6, lsl #2]
_02058E3C:
	add r3, r3, #1
	cmp r3, #0x45
	blt _02058E0C
	mov ip, r1, lsr #5
	ldr r3, [r0, ip, lsl #2]
	sub r1, r1, ip, lsl #5
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, ip, lsl #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02058E64: .word IQ_SKILL_RESTRICTIONS
	arm_func_end EnableIqSkill

	arm_func_start GetSpeciesIqSkill
GetSpeciesIqSkill: ; 0x02058E68
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetIqGroup
	ldr r2, _02058E88 ; =IQ_GROUP_SKILLS
	mov r1, #0x19
	mla r1, r0, r1, r2
	ldrb r0, [r4, r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02058E88: .word IQ_GROUP_SKILLS
	arm_func_end GetSpeciesIqSkill

	arm_func_start DisableAllIqSkills
DisableAllIqSkills: ; 0x02058E8C
	mov r3, #0
	mov r2, r3
_02058E94:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	str r2, [r0, r3, lsl #2]
	mov r3, r1, asr #0x10
	cmp r3, #3
	blt _02058E94
	bx lr
	arm_func_end DisableAllIqSkills

	arm_func_start EnableAllLearnableIqSkills
EnableAllLearnableIqSkills: ; 0x02058EB0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov r6, r0
	add r0, sp, #0
	bl GetLearnableIqSkills
	mov r0, r6
	bl DisableAllIqSkills
	mov r5, #0
	add r4, sp, #0
	b _02058EF4
_02058ED8:
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02058EFC
	ldrb r1, [r4, r5]
	mov r0, r6
	bl EnableIqSkill
	add r5, r5, #1
_02058EF4:
	cmp r5, #0x45
	blt _02058ED8
_02058EFC:
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EnableAllLearnableIqSkills
