	.include "asm/macros.inc"
	.include "main_02058F24.inc"

	.text

	arm_func_start GetNextIqSkill
GetNextIqSkill: ; 0x02058F24
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	bl GetIqGroup
	ldr r2, _02058F9C ; =IQ_GROUP_SKILLS
	mov r1, #0x19
	mla lr, r0, r1, r2
	mov r0, #0
	mov r1, r0
	mov r3, r0
	ldr r2, _02058FA0 ; =IQ_SKILLS
	b _02058F90
_02058F50:
	ldrb ip, [lr], #1
	cmp ip, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp ip, #0
	beq _02058F8C
	ldr r5, [r2, ip, lsl #2]
	cmp r5, r4
	ble _02058F8C
	cmp r1, #0
	beq _02058F80
	cmp r5, r1
	bge _02058F8C
_02058F80:
	mov r1, r5, lsl #0x10
	mov r0, ip
	mov r1, r1, asr #0x10
_02058F8C:
	add r3, r3, #1
_02058F90:
	cmp r3, #0x19
	blt _02058F50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02058F9C: .word IQ_GROUP_SKILLS
_02058FA0: .word IQ_SKILLS
	arm_func_end GetNextIqSkill

	arm_func_start sub_02058FA4
sub_02058FA4: ; 0x02058FA4
	ldr r0, _02058FC8 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r0, r0, #0x9800
	ldrsh r0, [r0, #0x9c]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02058FC8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058FA4

	arm_func_start sub_02058FCC
sub_02058FCC: ; 0x02058FCC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r3, _0205905C ; =TEAM_MEMBER_TABLE_PTR
	ldrsb r2, [r5]
	ldr r0, [r3]
	add r1, r5, #2
	add r0, r0, #0x9000
	strb r2, [r0, #0x880]
	ldr r0, [r3]
	ldrb r4, [r5, #1]
	add r0, r0, #0x9000
	mov r2, #0x14
	strb r4, [r0, #0x881]
	ldr r0, [r3]
	add r0, r0, #0x82
	add r0, r0, #0x9800
	bl StrncpySimple
	add r8, r5, #0x18
	ldr r7, _0205905C ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	mov r5, #0x44
	mov r6, #0x4c
_02059028:
	ldr r0, [r7]
	mla r1, r4, r6, r8
	add r0, r0, #0x98
	add r0, r0, #0x9800
	mla r0, r4, r5, r0
	bl sub_02055F04
	add r4, r4, #1
	cmp r4, #4
	blt _02059028
	mov r0, #0xbe
	mov r1, #1
	bl sub_0204D018
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205905C: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02058FCC

	arm_func_start GetExplorerMazeTeamName
GetExplorerMazeTeamName: ; 0x02059060
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020590B8 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x1880
	add r4, r0, #0x8000
	bl sub_02058FA4
	cmp r0, #0
	beq _020590A8
	bl GetLanguageType
	ldrsb r1, [r4]
	cmp r1, r0
	bne _020590A8
	mov r0, r5
	add r1, r4, #2
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
	ldmia sp!, {r3, r4, r5, pc}
_020590A8:
	ldr r1, _020590BC ; =0x00000235
	mov r0, r5
	bl GetStringFromFileVeneer
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020590B8: .word TEAM_MEMBER_TABLE_PTR
#ifdef JAPAN
_020590BC: .word 0x000004C6
#else
_020590BC: .word 0x00000235
#endif
	arm_func_end GetExplorerMazeTeamName

	arm_func_start sub_020590C0
sub_020590C0: ; 0x020590C0
	ldr r0, _020590D8 ; =TEAM_MEMBER_TABLE_PTR
	ldr r0, [r0]
	add r1, r0, #0x9000
	ldr r0, [r1, #0x878]
	ldr r1, [r1, #0x87c]
	bx lr
	.align 2, 0
_020590D8: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020590C0

	arm_func_start sub_020590DC
sub_020590DC: ; 0x020590DC
	ldr r2, _020590F4 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r2]
	add r2, r2, #0x9000
	str r0, [r2, #0x878]
	str r1, [r2, #0x87c]
	bx lr
	.align 2, 0
_020590F4: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_020590DC

	arm_func_start GetExplorerMazeMonster
GetExplorerMazeMonster: ; 0x020590F8
	ldr r1, _02059114 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x44
	ldr r1, [r1]
	add r1, r1, #0x98
	add r1, r1, #0x9800
	smlabb r0, r0, r2, r1
	bx lr
	.align 2, 0
_02059114: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end GetExplorerMazeMonster

	arm_func_start WriteMonsterInfoToSave
WriteMonsterInfoToSave: ; 0x02059118
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r6, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	ldr r5, _02059220 ; =0x0000022B
	mov r8, #0
	add r7, sp, #0
	mov r4, #0x44
_02059148:
	ldr r1, [r6]
	mov r0, r7
	mla r1, r8, r4, r1
	bl WriteMonsterToSave
	add r8, r8, #1
	cmp r8, r5
	blt _02059148
	ldr r1, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x40
	add r1, r1, #0x78
	add r1, r1, #0x9800
	bl CopyBitsTo
	ldr r1, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x1880
	add r1, r1, #0x8000
	bl CopyBitsTo
	ldr r1, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x81
	add r1, r1, #0x9800
	bl CopyBitsTo
	ldr r1, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x50
	add r1, r1, #0x82
	add r1, r1, #0x9800
	bl CopyBitsTo
	ldr r5, _0205921C ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0
	add r6, sp, #0
	mov r4, #0x44
_020591E4:
	ldr r1, [r5]
	mov r0, r6
	add r1, r1, #0x98
	add r1, r1, #0x9800
	mla r1, r7, r4, r1
	bl WriteMonsterToSave
	add r7, r7, #1
	cmp r7, #4
	blt _020591E4
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205921C: .word TEAM_MEMBER_TABLE_PTR
_02059220: .word 0x0000022B
	arm_func_end WriteMonsterInfoToSave

	arm_func_start ReadMonsterInfoFromSave
ReadMonsterInfoFromSave: ; 0x02059224
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	ldr r6, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	ldr r5, _02059330 ; =0x0000022B
	mov r8, #0
	add r7, sp, #0
	mov r4, #0x44
_02059254:
	ldr r1, [r6]
	mov r0, r7
	mla r1, r8, r4, r1
	bl ReadMonsterFromSave
	add r8, r8, #1
	cmp r8, r5
	blt _02059254
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x40
	add r1, r1, #0x78
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x1880
	add r1, r1, #0x8000
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #0x81
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r1, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x50
	add r1, r1, #0x82
	add r1, r1, #0x9800
	bl CopyBitsFrom
	ldr r5, _0205932C ; =TEAM_MEMBER_TABLE_PTR
	mov r7, #0
	add r6, sp, #0
	mov r4, #0x44
_020592F0:
	ldr r1, [r5]
	mov r0, r6
	add r1, r1, #0x98
	add r1, r1, #0x9800
	mla r1, r7, r4, r1
	bl ReadMonsterFromSave
	add r7, r7, #1
	cmp r7, #4
	blt _020592F0
	add r0, sp, #0
	bl sub_020509BC
	bl sub_0205523C
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205932C: .word TEAM_MEMBER_TABLE_PTR
_02059330: .word 0x0000022B
	arm_func_end ReadMonsterInfoFromSave

	arm_func_start WriteMonsterToSave
WriteMonsterToSave: ; 0x02059334
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #1
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	bl sub_020515C4
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #8
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xd
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xf
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x45
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x20
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x22
	bl CopyMovesetTo
	mov r0, r5
	add r1, r4, #0x3a
	mov r2, #0x50
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WriteMonsterToSave

	arm_func_start ReadMonsterFromSave
ReadMonsterFromSave: ; 0x02059444
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #0x44
	bl memset
	mov r0, r5
	mov r1, r4
	mov r2, #1
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	bl Copy16BitsFrom
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #8
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xd
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xf
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x45
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x20
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x22
	bl CopyMovesetFrom
	mov r0, r5
	add r1, r4, #0x3a
	mov r2, #0x50
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadMonsterFromSave

	arm_func_start sub_0205956C
sub_0205956C: ; 0x0205956C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _020597A4 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, r1
	ldr r1, [r2]
	mov r2, #1
	add r1, r1, #0x74
	add r1, r1, #0x9800
	add r1, r1, r5
	mov sl, r0
	bl CopyBitsTo
	ldr r1, _020597A4 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, sl
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x850
	add r1, r1, #0x9000
	add r1, r1, r5, lsl #1
	bl CopyBitsTo
	ldr r6, _020597A4 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	mov r7, #0x10
_020595C0:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0x56
	add r1, r1, #0x9800
	add r1, r1, r5, lsl #3
	mov r2, r7
	add r1, r1, r4, lsl #1
	bl CopyBitsTo
	add r4, r4, #1
	cmp r4, #4
	blt _020595C0
	mov r0, #0x1a0
	mul r8, r5, r0
	ldr fp, _020597A8 ; =_020A3498
	ldr r5, _020597A4 ; =TEAM_MEMBER_TABLE_PTR
	mov sb, #0
	mov r6, #4
	mov r4, #0x68
_02059608:
	ldr r1, [r5]
	mov r0, sl
	add r1, r1, #0x36c
	add r1, r1, #0x9000
	add r1, r1, r8
	mla r7, sb, r4, r1
	mov r1, r7
	mov r2, r6
	bl CopyBitsTo
	ldrb r0, [r7, #1]
	mov r2, #1
	cmp r0, #0
	movne r1, fp
	ldreq r1, _020597AC ; =_020A3499
	mov r0, sl
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #2
	mov r2, #7
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #3
	bl sub_020515C4
	mov r0, sl
	add r1, r7, #6
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #8
	mov r2, #0x10
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0xa
	mov r2, #0x10
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0xc
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0xe
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x10
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x12
	mov r2, #8
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x13
	mov r2, #8
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x14
	mov r2, #8
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x15
	mov r2, #8
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x18
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x1c
	bl sub_02014B74
	mov r0, sl
	add r1, r7, #0x3e
	bl sub_0200DF74
	mov r0, sl
	add r1, r7, #0x44
	bl sub_020510C0
	mov r0, sl
	add r1, r7, #0x48
	bl sub_020510C0
	mov r0, sl
	add r1, r7, #0x4c
	mov r2, #0x45
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x58
	mov r2, #4
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x5a
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, sl
	add r1, r7, #0x5c
	mov r2, #5
	bl CopyBitsTo
	add r1, r7, #0x5e
	mov r0, sl
	mov r2, #0x50
	bl CopyBitsTo
	add sb, sb, #1
	cmp sb, #4
	blt _02059608
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020597A4: .word TEAM_MEMBER_TABLE_PTR
_020597A8: .word _020A3498
_020597AC: .word _020A3499
	arm_func_end sub_0205956C

	arm_func_start sub_020597B0
sub_020597B0: ; 0x020597B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	mov r3, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r3
	bl sub_02050990
	add r0, sp, #8
	mov r1, #0
	bl sub_0205956C
	add r0, sp, #8
	mov r1, #1
	bl sub_0205956C
	add r0, sp, #8
	mov r1, #2
	bl sub_0205956C
	add r0, sp, #8
	bl sub_020509BC
	ldr r1, _02059820 ; =_020A3498
	add r0, sp, #0
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0xc]
	str r2, [sp, #4]
	str r1, [sp]
	bl sub_020584F8
	ldr r0, [sp, #0x10]
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02059820: .word _020A3498
	arm_func_end sub_020597B0

	arm_func_start sub_02059824
sub_02059824: ; 0x02059824
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02059A70 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, r1
	ldr r1, [r2]
	mov r2, #1
	add r1, r1, #0x74
	add r1, r1, #0x9800
	add r1, r1, r5
	mov sl, r0
	bl CopyBitsFrom
	ldr r1, _02059A70 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, sl
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x850
	add r1, r1, #0x9000
	add r1, r1, r5, lsl #1
	bl CopyBitsFrom
	ldr r6, _02059A70 ; =TEAM_MEMBER_TABLE_PTR
	mov r4, #0
	mov r7, #0x10
_02059878:
	ldr r1, [r6]
	mov r0, sl
	add r1, r1, #0x56
	add r1, r1, #0x9800
	add r1, r1, r5, lsl #3
	mov r2, r7
	add r1, r1, r4, lsl #1
	bl CopyBitsFrom
	add r4, r4, #1
	cmp r4, #4
	blt _02059878
	mov r0, #0x1a0
	mul r8, r5, r0
	mov sb, #0
	ldr r4, _02059A70 ; =TEAM_MEMBER_TABLE_PTR
	mov r5, sb
	mov r6, #1
	mov fp, #0x68
_020598C0:
	ldr r0, [r4]
	mov r1, #0
	add r0, r0, #0x36c
	add r0, r0, #0x9000
	add r0, r0, r8
	mla r7, sb, fp, r0
	mov r0, r7
	mov r2, #0x68
	bl memset
	mov r0, sl
	mov r1, r7
	mov r2, #4
	bl CopyBitsFrom
	mov r0, sl
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, r7, #2
	mov r2, #7
	tst r0, #1
	strneb r6, [r7, #1]
	mov r0, sl
	streqb r5, [r7, #1]
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #3
	bl Copy16BitsFrom
	mov r0, sl
	add r1, r7, #6
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #8
	mov r2, #0x10
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0xa
	mov r2, #0x10
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0xc
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0xe
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x10
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x12
	mov r2, #8
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x13
	mov r2, #8
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x14
	mov r2, #8
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x15
	mov r2, #8
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x18
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x1c
	bl sub_02014C20
	mov r0, sl
	add r1, r7, #0x3e
	bl sub_0200DF2C
	mov r0, sl
	add r1, r7, #0x44
	bl sub_02051098
	mov r0, sl
	add r1, r7, #0x48
	bl sub_02051098
	mov r0, sl
	add r1, r7, #0x4c
	mov r2, #0x45
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x58
	mov r2, #4
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x5a
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, sl
	add r1, r7, #0x5c
	mov r2, #5
	bl CopyBitsFrom
	add r1, r7, #0x5e
	mov r0, sl
	mov r2, #0x50
	bl CopyBitsFrom
	add sb, sb, #1
	cmp sb, #4
	blt _020598C0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02059A70: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_02059824

	arm_func_start sub_02059A74
sub_02059A74: ; 0x02059A74
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	mov r3, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r3
	bl sub_02050974
	add r0, sp, #8
	mov r1, #0
	bl sub_02059824
	add r0, sp, #8
	mov r1, #1
	bl sub_02059824
	add r0, sp, #8
	mov r1, #2
	bl sub_02059824
	add r0, sp, #8
	bl sub_020509BC
	ldr r1, _02059AE4 ; =_020A3498
	add r0, sp, #0
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r2, [sp, #4]
	str r1, [sp]
	bl sub_020584F8
	ldr r0, [sp, #0x10]
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02059AE4: .word _020A3498
	arm_func_end sub_02059A74

	arm_func_start sub_02059AE8
sub_02059AE8: ; 0x02059AE8
	ldr ip, _02059AF4 ; =CopyBitsFrom
	mov r2, #7
	bx ip
	.align 2, 0
_02059AF4: .word CopyBitsFrom
	arm_func_end sub_02059AE8

	arm_func_start sub_02059AF8
sub_02059AF8: ; 0x02059AF8
	ldr ip, _02059B04 ; =CopyBitsTo
	mov r2, #7
	bx ip
	.align 2, 0
_02059B04: .word CopyBitsTo
	arm_func_end sub_02059AF8

	arm_func_start sub_02059B08
sub_02059B08: ; 0x02059B08
	ldr ip, _02059B14 ; =GetPerformanceFlagWithChecks
	mov r0, #0xa
	bx ip
	.align 2, 0
_02059B14: .word GetPerformanceFlagWithChecks
	arm_func_end sub_02059B08

	arm_func_start GetEvolutionPossibilities
GetEvolutionPossibilities: ; 0x02059B18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r0
	ldrsh r6, [sb, #4]
	mov r8, r1
	mov r5, #0
	strh r5, [r8, #6]
	ldrsh r0, [sb, #4]
	cmp r6, #0x258
	ldrlt r4, _0205A1DC ; =0x0000022A
	movlt r7, #1
	ldr r2, _0205A1E0 ; =0x000001BF
	ldrge r7, _0205A1E4 ; =0x00000259
	ldrge r4, _0205A1E8 ; =0x00000483
	cmp r0, r2
	blt _02059B64
	add r1, r2, #2
	cmp r0, r1
	movle r6, r2
_02059B64:
	ldr r2, _0205A1EC ; =0x00000417
	cmp r0, r2
	blt _02059B84
	add r1, r2, #2
	cmp r0, r1
	ldrle r4, _0205A1DC ; =0x0000022A
	suble r6, r2, #0x258
	movle r7, #1
_02059B84:
	ldr r1, _0205A1F0 ; =0x000003E1
	ldr r2, _0205A1F4 ; =0x000001CE
	cmp r0, r1
	subeq r6, r1, #0x258
	ldreq r4, _0205A1DC ; =0x0000022A
	ldr r1, _0205A1F8 ; =0x0000041E
	moveq r7, #1
	cmp r0, r1
	subeq r6, r1, #0x258
	subeq r4, r1, #0x1f4
	moveq r7, #1
	cmp r0, r2
	blt _02059BC4
	add r1, r2, #1
	cmp r0, r1
	movle r6, r2
_02059BC4:
	ldr r2, _0205A1FC ; =0x00000426
	cmp r0, r2
	blt _02059BDC
	add r1, r2, #1
	cmp r0, r1
	movle r6, r2
_02059BDC:
	mov r2, #0
	mov r1, r2
_02059BE4:
	add r0, r8, r2, lsl #1
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x2a]
	add r2, r2, #1
	strh r1, [r0, #0xa]
	cmp r2, #8
	blt _02059BE4
	strh r1, [r8, #8]
	ldrsh r0, [sb, #4]
	ldr r1, _0205A1F8 ; =0x0000041E
	cmp r0, r1
	bne _02059C2C
	bl CanEvolve
	cmp r0, #0
	bne _02059C44
	mov r0, #4
	strh r0, [r8, #6]
	b _0205A1D4
_02059C2C:
	mov r0, r6
	bl CanEvolve
	cmp r0, #0
	moveq r0, #4
	streqh r0, [r8, #6]
	beq _0205A1D4
_02059C44:
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x34c
	str r0, [sp, #0x24]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb fp, r0, #0x5a0
	sub r0, r0, #0x258
	str r0, [sp]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x390
	str r0, [sp, #8]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb sl, r0, #0x5a0
	ldr r0, _0205A200 ; =0xFFFFFE3E
	add r0, r0, #0x390
	str r0, [sp, #4]
	ldr r0, _0205A1F0 ; =0x000003E1
	add r0, r0, #0x45
	str r0, [sp, #0xc]
	ldr r0, _0205A1F0 ; =0x000003E1
	sub r0, r0, #0x220
	str r0, [sp, #0x20]
	ldr r0, _0205A1F0 ; =0x000003E1
	rsb r0, r0, #0x5a0
	str r0, [sp, #0x1c]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	sub r0, r0, #0x264
	str r0, [sp, #0x18]
	ldr r0, _0205A204 ; =0xFFFFFBE9
	sub r0, r0, #0x11
	str r0, [sp, #0x14]
	ldr r0, _0205A200 ; =0xFFFFFE3E
	sub r0, r0, #0xc
	str r0, [sp, #0x10]
	b _02059E1C
_02059CCC:
	mov r1, r7, lsl #0x10
	add r0, sp, #0x28
	mov r1, r1, asr #0x10
	bl GetEvoParameters
	ldrh r0, [sp, #0x2a]
	cmp r0, #0
	beq _02059E18
	ldrsh r0, [sp, #0x28]
	cmp r6, r0
	bne _02059E18
	cmp r6, sl
	bgt _02059D14
	cmp r6, fp
	bge _02059D8C
	ldr r0, [sp]
	cmp r6, r0
	beq _02059DD8
	b _02059E0C
_02059D14:
	ldr r0, [sp, #4]
	cmp r6, r0
	bgt _02059D30
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _02059D40
	b _02059E0C
_02059D30:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	beq _02059D64
	b _02059E0C
_02059D40:
	ldrsh r2, [sb, #4]
	ldr r0, [sp, #0x10]
	sub r1, r7, #0x1d0
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	addeq r5, r5, #1
	b _02059E18
_02059D64:
	ldr r0, [sp, #0x14]
	ldrsh r2, [sb, #4]
	add r1, r7, r0
	ldr r0, [sp, #0x18]
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	addeq r5, r5, #1
	b _02059E18
_02059D8C:
	ldr r0, _0205A200 ; =0xFFFFFE3E
	ldrsh r2, [sb, #4]
	add r1, r7, r0
	ldr r0, _0205A204 ; =0xFFFFFBE9
	add r0, r2, r0
	cmp r0, r1
	addeq r0, r8, r5, lsl #1
	streqh r7, [r0, #0xa]
	ldrsh r1, [sb, #4]
	ldr r0, [sp, #0x1c]
	addeq r5, r5, #1
	cmp r1, r0
	blt _02059E18
	ldr r0, [sp, #0x20]
	cmp r1, r0
	addle r0, r8, r5, lsl #1
	strleh r7, [r0, #0xa]
	addle r5, r5, #1
	b _02059E18
_02059DD8:
	ldrsh r1, [sb, #4]
	ldr r0, _0205A1F0 ; =0x000003E1
	cmp r1, r0
	ldreq r0, [sp, #0x24]
	cmpeq r7, r0
	addeq r0, r8, r5, lsl #1
	addeq r1, r7, #0x258
	addeq r5, r5, #1
	streqh r1, [r0, #0xa]
	addne r0, r8, r5, lsl #1
	strneh r7, [r0, #0xa]
	addne r5, r5, #1
	b _02059E18
_02059E0C:
	add r0, r8, r5, lsl #1
	strh r7, [r0, #0xa]
	add r5, r5, #1
_02059E18:
	add r7, r7, #1
_02059E1C:
	cmp r7, r4
	blt _02059CCC
	cmp r5, #0
	moveq r0, #4
	streqh r0, [r8, #6]
	beq _0205A1D4
	mov r7, #0
	b _0205A1CC
_02059E3C:
	add r0, r8, r7, lsl #1
	ldrsh sl, [r0, #0xa]
	add r0, sp, #0x28
	mov r1, sl
	bl GetEvoParameters
	ldrh r0, [sp, #0x2a]
	mov r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02059F44
_02059E64: ; jump table
	b _02059F44 ; case 0
	b _02059E78 ; case 1
	b _02059E98 ; case 2
	b _02059EB8 ; case 3
	b _02059EE4 ; case 4
_02059E78:
	ldrb r1, [sb, #1]
	ldrsh r0, [sp, #0x2c]
	cmp r1, r0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #2
	strlth r0, [r8, #6]
	b _02059F44
_02059E98:
	ldrsh r1, [sb, #8]
	ldrsh r0, [sp, #0x2c]
	cmp r1, r0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #0x10
	strlth r0, [r8, #6]
	b _02059F44
_02059EB8:
	ldrsh r0, [sp, #0x2c]
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	ldrgesh r1, [sp, #0x2c]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x1a]
	b _02059F44
_02059EE4:
	ldrsh r0, [sp, #0x2c]
	mov r1, #0x258
	mov r6, r4
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r4
	bl IsMonsterOnTeam
	cmp r0, #0
	ldrsh r0, [sp, #0x2c]
	mov r1, #0x258
	addne r6, r6, #1
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	add r0, r0, #0x258
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, #0
	bl IsMonsterOnTeam
	cmp r0, #0
	addne r6, r6, #1
	cmp r6, #0
	moveq r4, #1
_02059F44:
	ldrh r0, [sp, #0x2e]
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0205A1A8
_02059F54: ; jump table
	b _0205A1A8 ; case 0
	b _0205A08C ; case 1
	b _0205A0B8 ; case 2
	b _0205A0CC ; case 3
	b _0205A0E0 ; case 4
	b _0205A0F4 ; case 5
	b _0205A120 ; case 6
	b _0205A16C ; case 7
	b _0205A14C ; case 8
	b _0205A15C ; case 9
	b _0205A18C ; case 10
	b _0205A19C ; case 11
	b _02059F94 ; case 12
	b _02059FD0 ; case 13
	b _0205A00C ; case 14
	b _0205A04C ; case 15
_02059F94:
	mov r6, #0
	mov r4, #1
	mov r1, r6
	mov r0, #6
_02059FA4:
	mla r3, r6, r0, sb
	ldrb r2, [r3, #0x22]
	tst r2, #1
	beq _02059FC0
	ldrh r2, [r3, #0x24]
	cmp r2, #0x5d
	moveq r4, r1
_02059FC0:
	add r6, r6, #1
	cmp r6, #4
	blt _02059FA4
	b _0205A1A8
_02059FD0:
	mov r6, #0
	mov r4, #1
	mov r1, r6
	mov r0, #6
_02059FE0:
	mla r3, r6, r0, sb
	ldrb r2, [r3, #0x22]
	tst r2, #1
	beq _02059FFC
	ldrh r2, [r3, #0x24]
	cmp r2, #0x69
	moveq r4, r1
_02059FFC:
	add r6, r6, #1
	cmp r6, #4
	blt _02059FE0
	b _0205A1A8
_0205A00C:
	mov r0, #0
	ldr r1, _0205A208 ; =0x000001E7
	mov r4, #1
	mov r3, r0
	mov r2, #6
_0205A020:
	mla fp, r0, r2, sb
	ldrb r6, [fp, #0x22]
	tst r6, #1
	beq _0205A03C
	ldrh r6, [fp, #0x24]
	cmp r6, r1
	moveq r4, r3
_0205A03C:
	add r0, r0, #1
	cmp r0, #4
	blt _0205A020
	b _0205A1A8
_0205A04C:
	mov r0, #0
	ldr r1, _0205A20C ; =0x00000147
	mov r4, #1
	mov r3, r0
	mov r2, #6
_0205A060:
	mla fp, r0, r2, sb
	ldrb r6, [fp, #0x22]
	tst r6, #1
	beq _0205A07C
	ldrh r6, [fp, #0x24]
	cmp r6, r1
	moveq r4, r3
_0205A07C:
	add r0, r0, #1
	cmp r0, #4
	blt _0205A060
	b _0205A1A8
_0205A08C:
	mov r0, #0x97
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x97
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A0B8:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movls r4, #1
	b _0205A1A8
_0205A0CC:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movhs r4, #1
	b _0205A1A8
_0205A0E0:
	ldrb r1, [sb, #0xc]
	ldrb r0, [sb, #0xe]
	cmp r1, r0
	movne r4, #1
	b _0205A1A8
_0205A0F4:
	mov r0, #0x37
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x37
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A120:
	mov r0, #0x38
	bl FindItemInInventory
	cmp r0, #0
	ldrlth r0, [r8, #6]
	movge r1, #0x38
	movlt r4, #1
	orrlt r0, r0, #8
	strlth r0, [r8, #6]
	addge r0, r8, r7, lsl #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A14C:
	ldrb r0, [r8, #4]
	tst r0, #1
	movne r4, #1
	b _0205A1A8
_0205A15C:
	ldrb r0, [r8, #4]
	tst r0, #1
	moveq r4, #1
	b _0205A1A8
_0205A16C:
	mov r0, #0x36
	bl FindItemInInventory
	cmp r0, #0
	addge r0, r8, r7, lsl #1
	movge r1, #0x36
	movlt r4, #1
	strgeh r1, [r0, #0x2a]
	b _0205A1A8
_0205A18C:
	ldrsh r0, [sb, #4]
	cmp r0, #0x258
	movge r4, #1
	b _0205A1A8
_0205A19C:
	ldrsh r0, [sb, #4]
	cmp r0, #0x258
	movlt r4, #1
_0205A1A8:
	cmp r4, #0
	ldreqh r0, [r8, #6]
	movne r1, #0
	orreq r0, r0, #1
	streqh r0, [r8, #6]
	addne r0, r8, r7, lsl #1
	streqh sl, [r8, #8]
	strneh r1, [r0, #0xa]
	add r7, r7, #1
_0205A1CC:
	cmp r7, r5
	blt _02059E3C
_0205A1D4:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205A1DC: .word 0x0000022A
_0205A1E0: .word 0x000001BF
_0205A1E4: .word 0x00000259
_0205A1E8: .word 0x00000483
_0205A1EC: .word 0x00000417
_0205A1F0: .word 0x000003E1
_0205A1F4: .word 0x000001CE
_0205A1F8: .word 0x0000041E
_0205A1FC: .word 0x00000426
_0205A200: .word 0xFFFFFE3E
_0205A204: .word 0xFFFFFBE9
_0205A208: .word 0x000001E7
_0205A20C: .word 0x00000147
	arm_func_end GetEvolutionPossibilities

	arm_func_start GetMonsterEvoStatus
GetMonsterEvoStatus: ; 0x0205A210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x3c
	add r1, sp, #0
	mov r4, r0
	bl GetEvolutionPossibilities
	ldrh r0, [sp, #6]
	tst r0, #1
	beq _0205A274
	ldrb r0, [r4, #2]
	cmp r0, #0xd6
	moveq r1, #1
	movne r1, #0
	tst r1, #0xff
	bne _0205A254
	bl JoinedAtRangeCheck2
	cmp r0, #0
	beq _0205A26C
_0205A254:
	mov r0, #0xa
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _0205A280
_0205A26C:
	mov r0, #1
	b _0205A280
_0205A274:
	tst r0, #4
	movne r0, #2
	moveq r0, #0
_0205A280:
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, pc}
	arm_func_end GetMonsterEvoStatus

	arm_func_start sub_0205A288
sub_0205A288: ; 0x0205A288
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mvn r2, #0
	mov r6, r0
	strh r2, [sp]
	ldrsh r0, [r6]
	mov r5, r1
	bl GetTeamMember
	add lr, sp, #4
	mov r4, r0
	mov ip, #4
_0205A2B4:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205A2B4
	ldr r3, [r4]
	add r1, sp, #4
	mov r0, r6
	mov r2, r5
	str r3, [lr]
	bl sub_0205A340
	ldr r0, _0205A33C ; =0x0000013F
	cmp r5, r0
	addne r0, r0, #0x258
	cmpne r5, r0
	bne _0205A330
	mov r0, #0x140
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x3e
	mov r2, #0xa
	bl StrncpyName
	add r0, sp, #0
	add r1, sp, #4
	mov r2, #0x140
	bl sub_0205A340
	ldrsh r1, [sp]
	mvn r0, #0
	cmp r1, r0
	beq _0205A330
	mov r0, #0x140
	bl SetPokemonJoined
_0205A330:
	mov r0, #1
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205A33C: .word 0x0000013F
	arm_func_end sub_0205A288

	arm_func_start sub_0205A340
sub_0205A340: ; 0x0205A340
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x90
	add ip, sp, #0x4c
	mov r6, r0
	mov lr, r1
	mov r5, r2
	mov r4, #4
_0205A35C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0205A35C
	ldr r1, [lr]
	add r0, sp, #0x40
	str r1, [ip]
	ldrb r2, [sp, #0x4d]
	mov r1, r5
	ldrsh r4, [sp, #0x50]
	bl GetLvlUpEntry
	ldrb r0, [sp, #0x52]
	ldr r1, [sp, #0x40]
	strh r5, [sp, #0x50]
	cmp r0, #0
	ldreqb r0, [sp, #0x4d]
	str r1, [sp, #0x5c]
	streqb r0, [sp, #0x52]
	beq _0205A3B8
	ldrb r0, [sp, #0x53]
	cmp r0, #0
	ldreqb r0, [sp, #0x4d]
	streqb r0, [sp, #0x53]
_0205A3B8:
	mov r0, r4
	bl GetNameString
	mov r1, r0
	add r0, sp, #0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	add r0, sp, #0
	add r1, sp, #0x86
	mov r2, #0xa
	bl StrncmpSimple
	cmp r0, #0
	bne _0205A3FC
	mov r0, r5
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x86
	mov r2, #0xa
	bl StrncpyName
_0205A3FC:
	ldrsh r0, [r6]
	mvn r1, #0
	cmp r0, r1
	beq _0205A418
	add r1, sp, #0x4c
	bl sub_02055D7C
	b _0205A424
_0205A418:
	add r0, sp, #0x4c
	bl sub_02055CCC
	strh r0, [r6]
_0205A424:
	ldrsh r0, [r6]
	add sp, sp, #0x90
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0205A340

	arm_func_start CopyTacticString
CopyTacticString: ; 0x0205A430
	ldr r2, _0205A448 ; =TACTIC_NAME_STRING_IDS
	mov r1, r1, lsl #1
	ldrh r1, [r2, r1]
	ldr ip, _0205A44C ; =CopyNStringFromId
#ifdef JAPAN
	mov r2, #0x28
#else
	mov r2, #0x40
#endif
	bx ip
	.align 2, 0
_0205A448: .word TACTIC_NAME_STRING_IDS
_0205A44C: .word CopyNStringFromId
	arm_func_end CopyTacticString

	arm_func_start GetStatBoostsForMonsterSummary
GetStatBoostsForMonsterSummary: ; 0x0205A450
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldrb ip, [sp, #0x18]
	mov r4, r0
	add r0, sp, #4
	str ip, [sp]
	bl sub_0205B120
	ldrb r1, [r4, #0x39]
	ldrsh r0, [sp, #6]
	add r0, r1, r0
	strb r0, [r4, #0x39]
	ldrb r1, [r4, #0x3a]
	ldrsh r0, [sp, #8]
	add r0, r1, r0
	strb r0, [r4, #0x3a]
	ldrb r1, [r4, #0x3b]
	ldrsh r0, [sp, #0xa]
	add r0, r1, r0
	strb r0, [r4, #0x3b]
	ldrb r1, [r4, #0x3c]
	ldrsh r0, [sp, #0xc]
	add r0, r1, r0
	strb r0, [r4, #0x3c]
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end GetStatBoostsForMonsterSummary

	arm_func_start sub_0205A4B4
sub_0205A4B4: ; 0x0205A4B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x184
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, #5
	mov r7, #0x10
	addls pc, pc, r0, lsl #2
	b _0205AD98
_0205A4D8: ; jump table
	b _0205AD98 ; case 0
	b _0205A9D4 ; case 1
	b _0205A4F0 ; case 2
	b _0205A900 ; case 3
	b _0205AAC8 ; case 4
	b _0205AC0C ; case 5
_0205A4F0:
	ldr r0, [r6, #0x2c]
	ldr r2, _0205ADA0 ; =0x00000951
	str r0, [sp, #0x90]
	ldr r1, [r6, #0x30]
	add r5, sp, #0x6c
	str r1, [sp, #0x94]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, r7
	bl DrawTextInWindow
	mov r3, r5
	str r3, [sp]
	ldr r2, _0205ADA4 ; =0x00000952
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x1c
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldr r2, [r6, #0x2c]
	cmp r2, #0x64
	bge _0205A5B8
	ldrsh r1, [r6]
	add r0, sp, #0x18
	add r2, r2, #1
	bl GetLvlUpEntry
	ldr r1, [sp, #0x18]
	ldr r0, [r6, #0x30]
	ldr r2, _0205ADA8 ; =0x00000953
	sub r0, r1, r0
	str r0, [sp, #0x90]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x28
	bl DrawTextInWindow
_0205A5B8:
	ldr r0, [r6, #0x24]
	ldr r2, _0205ADAC ; =0x00000954
	str r0, [sp, #0x90]
	ldr r1, [r6, #0x28]
	add r5, sp, #0x6c
	str r1, [sp, #0x94]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x36
	bl DrawTextInWindow
	mov r3, r5
	str r3, [sp]
	ldr r2, _0205ADB0 ; =0x00000955
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldrb r1, [r6, #0x34]
	ldr r2, _0205ADB4 ; =0x00000957
	add r5, sp, #0x6c
	str r1, [sp, #0x90]
	ldrb r0, [r6, #0x39]
	mov r3, #0
	cmp r0, #0
	addne r0, r1, r0
	strne r0, [sp, #0x90]
	addne r2, r2, #1
	add r0, sp, #0xbc
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
	ldrb r2, [r6, #0x3b]
	ldrb r1, [r6, #0x36]
	add r0, sp, #0xbc
	cmp r2, #0
	mov r3, #0
	beq _0205A6BC
	add r1, r1, r2
	str r1, [sp, #0x90]
	ldr r2, _0205ADB8 ; =0x0000095C
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
	b _0205A6E4
_0205A6BC:
	ldr r2, _0205ADBC ; =0x0000095B
	str r1, [sp, #0x90]
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x42
	bl DrawTextInWindow
_0205A6E4:
	ldr r2, _0205ADC0 ; =0x00000956
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	ldrb r1, [r6, #0x35]
	ldr r2, _0205ADC4 ; =0x00000959
	add r5, sp, #0x6c
	str r1, [sp, #0x90]
	ldrb r0, [r6, #0x3a]
	mov r3, #0
	cmp r0, #0
	addne r0, r1, r0
	strne r0, [sp, #0x90]
	addne r2, r2, #1
	add r0, sp, #0xbc
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	ldrb r2, [r6, #0x3c]
	ldrb r1, [r6, #0x37]
	add r0, sp, #0xbc
	cmp r2, #0
	mov r3, #0
	beq _0205A7A8
	add r1, r1, r2
	str r1, [sp, #0x90]
	ldr r2, _0205ADC8 ; =0x0000095E
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
	b _0205A7D0
_0205A7A8:
	ldr r2, _0205ADCC ; =0x0000095D
	str r1, [sp, #0x90]
	mov r1, #0xc8
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x4e
	bl DrawTextInWindow
_0205A7D0:
	ldrb r0, [r6, #0x1c]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0205A820
	bl AllocateTemp1024ByteBufferFromPool
	ldr r2, _0205ADD0 ; =_020A34B8
	add r1, r6, #0x1c
	mov r7, r0
	bl sub_0200D670
#ifdef JAPAN
	ldr r2, _0205B0D0 ; =0x00002330
#endif
	add r5, sp, #0x6c
	str r7, [sp, #0xa4]
	add r0, sp, #0xbc
	mov r1, #0xc8
#ifndef JAPAN
	mov r2, #0x960
#endif
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	b _0205A83C
_0205A820:
	ldr r2, _0205ADD4 ; =0x0000095F
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
_0205A83C:
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x5a
	bl DrawTextInWindow
	ldrsh r0, [r6, #0x3e]
	mov r1, #0xa
	str r0, [sp, #0x90]
	ldrsh r0, [r6, #0x3e]
	bl _s32_div_f
	movs r1, r0
	movmi r1, #0
	cmp r1, #0x63
	ldr r0, _0205ADD8 ; =_020A34D2
	movge r1, #0x63
	bl sub_0205B39C
	str r0, [sp, #0xa4]
	add r5, sp, #0x6c
	ldr r2, _0205ADDC ; =0x00000961
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x68
	bl DrawTextInWindow
	ldrb r0, [r6, #0x38]
	cmp r0, #0
	bne _0205AD98
	bl AllocateTemp1024ByteBufferFromPool
	ldrb r1, [r6, #0x54]
	mov r6, r0
	bl sub_02058C30
	str r6, [sp, #0xa4]
	ldr r2, _0205ADE0 ; =0x00000962
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x74
	bl DrawTextInWindow
	b _0205AD98
_0205A900:
	ldr r3, _0205ADE4 ; =0x00000972
	mov r0, r4
	mov r2, r7
	mov r1, #4
	bl sub_02026268
	ldrb r0, [r6, #0x16]
	bl GetTypeStringId
	mov r3, r0
	mov r0, r4
	mov r1, #0x38
	mov r2, r7
	bl sub_02026268
	ldrb r0, [r6, #0x17]
	cmp r0, #0
	beq _0205A954
	bl GetTypeStringId
	mov r3, r0
	mov r0, r4
	mov r1, #0x68
	mov r2, r7
	bl sub_02026268
_0205A954:
	ldr r3, _0205ADE8 ; =0x00000973
	mov r0, r4
	mov r1, #4
	mov r2, #0x1c
	bl sub_02026268
	ldrb r0, [r6, #0x18]
	bl GetAbilityDescStringId
	bl StringFromId
	mov r1, #0
	str r1, [sp]
	mov r1, #0xb
	str r1, [sp, #4]
	mov r3, r0
	mov r0, r4
	mov r1, #4
	mov r2, #0x28
	bl sub_02026358
	ldrb r0, [r6, #0x19]
	cmp r0, #0
	beq _0205AD98
	bl GetAbilityDescStringId
	bl StringFromId
	mov r1, #0
	mov r3, r0
	mov r0, r4
	str r1, [sp]
	mov r4, #0xb
	mov r1, #4
	mov r2, #0x49
	str r4, [sp, #4]
	bl sub_02026358
	b _0205AD98
_0205A9D4:
	ldrsh r0, [r6, #0x56]
	mov fp, #0
	mov r1, fp
	sub r8, r0, #1
	sub r7, r7, #0xc
	mov sl, fp
_0205A9EC:
	add r0, r5, r1, lsl #2
	add r1, r1, #1
	str sl, [r0, #0xc]
	cmp r1, #0xa
	blt _0205A9EC
	b _0205AAA0
_0205AA04:
	cmp r8, #0
	cmpge r7, #0x10
	blt _0205AA94
	cmp r8, #0x1e
	bge _0205AAA8
	add sb, r6, r8
	ldrb r0, [sb, #0x58]
	cmp r0, #0
	beq _0205AA94
	mov fp, #1
	bl AllocateTemp1024ByteBufferFromPool
	ldrb r1, [sb, #0x58]
	str r0, [sp, #8]
	mov r2, #0x50
	mov r3, r1, lsl #1
	ldr r1, _0205ADEC ; =STATUS_NAME_STRING_IDS
	ldrh r1, [r1, r3]
	bl CopyNStringFromId
	ldr r0, [sp, #8]
	ldr r2, _0205ADF0 ; =_020A34FC
	str r0, [sp, #0xa8]
	add r0, sp, #0x6c
	str r0, [sp]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessString
	mov r0, r4
	mov r1, #0xc
	mov r2, r7
	add r3, sp, #0xbc
	bl DrawTextInWindow
	cmp sl, #1
	ldrgeb r1, [sb, #0x58]
	addge r0, r5, sl, lsl #2
	strge r1, [r0, #8]
_0205AA94:
	add sl, sl, #1
	add r8, r8, #1
	add r7, r7, #0xc
_0205AAA0:
	cmp sl, #0xa
	blt _0205AA04
_0205AAA8:
	cmp fp, #0
	bne _0205AD98
	ldr r3, _0205ADF4 ; =0x00000968
	mov r0, r4
	mov r1, #0xc
	mov r2, #0x10
	bl sub_02026268
	b _0205AD98
_0205AAC8:
	ldrsh r1, [r6]
	ldrsh r2, [r6, #0x3e]
	add r0, sp, #0x24
	bl GetLearnableIqSkills
	ldrsh r0, [r6, #0x40]
	mov r1, #0
	mov sb, r1
	sub r8, r0, #1
_0205AAE8:
	strb sb, [r5, r1]
	add r1, r1, #1
	cmp r1, #9
	blt _0205AAE8
	mov sl, sb
	sub r7, r7, #0xc
	add fp, sp, #0x24
	b _0205ABE4
_0205AB08:
	cmp r8, #0
	blt _0205ABD8
	cmp r8, #0x45
	bge _0205ABEC
	ldrb r0, [fp, r8]
	cmp r0, #0
	beq _0205ABD8
	mov sb, #1
	bl AllocateTemp1024ByteBufferFromPool
	str r0, [sp, #0xc]
	ldrb r0, [fp, r8]
	bl GetIqSkillStringId
	mov r1, r0
	ldr r0, [sp, #0xc]
	mov r2, #0x50
	bl CopyNStringFromId
	ldr r0, [sp, #0xc]
	ldrb r1, [fp, r8]
	str r0, [sp, #0xa8]
	add r0, r6, #0x48
	bl IqSkillFlagTest
	cmp r0, #0
	beq _0205AB80
	bl AllocateTemp1024ByteBufferFromPool
	ldr r1, _0205ADF8 ; =_020A3514
	str r0, [sp, #0x10]
	bl strcpy
	ldr r0, [sp, #0x10]
	str r0, [sp, #0xa4]
	b _0205AB98
_0205AB80:
	bl AllocateTemp1024ByteBufferFromPool
	ldr r1, _0205ADFC ; =_020A351C
	str r0, [sp, #0x14]
	bl strcpy
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xa4]
_0205AB98:
	cmp sl, #1
	ldrgeb r1, [fp, r8]
	addge r0, r5, sl
	ldr r2, _0205AE00 ; =_020A3524
	strgeb r1, [r0, #-1]
	add r0, sp, #0x6c
	str r0, [sp]
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessString
	mov r0, r4
	mov r1, #0xc
	mov r2, r7
	add r3, sp, #0xbc
	bl DrawTextInWindow
_0205ABD8:
	add sl, sl, #1
	add r8, r8, #1
	add r7, r7, #0xc
_0205ABE4:
	cmp sl, #0xa
	blt _0205AB08
_0205ABEC:
	cmp sb, #0
	bne _0205AD98
	ldr r3, _0205AE04 ; =0x00000969
	mov r0, r4
	mov r1, #0xc
	mov r2, #0x20
	bl sub_02026268
	b _0205AD98
_0205AC0C:
	bl AllocateTemp1024ByteBufferFromPool
	ldrsh r1, [r6]
	mov r5, r0
	bl GetNameRaw
	str r5, [sp, #0xa4]
	ldrsh r0, [r6]
	str r0, [sp, #0x90]
	ldrsh r0, [r6]
	bl GetMonsterGenderVeneer
	cmp r0, #1
	beq _0205AC48
	cmp r0, #2
	beq _0205AC50
	cmp r0, #3
	b _0205AC58
_0205AC48:
	ldr r2, _0205AE08 ; =0x00000963
	b _0205AC5C
_0205AC50:
	ldr r2, _0205AE0C ; =0x00000964
	b _0205AC5C
_0205AC58:
	ldr r2, _0205AE10 ; =0x00000965
_0205AC5C:
	add r5, sp, #0x6c
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
	mov r2, #0x10
	bl DrawTextInWindow
	ldr r3, _0205AE14 ; =0x00000967
	mov r0, r4
	mov r1, #4
	mov r2, #0x1f
	bl sub_02026268
	ldrb r2, [r6, #0x1a]
	mov r1, r5
	add r0, sp, #0xbc
	str r2, [sp, #0x7c]
	str r1, [sp]
	ldr r2, _0205AE18 ; =0x0000096B
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x2b
	add r3, sp, #0xbc
	bl DrawTextInWindow
	bl AllocateTemp1024ByteBufferFromPool
	mov r5, r0
	ldrsh r0, [r6]
	bl GetCategoryString
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, #0x44
	strb r0, [r5, #4]
	str r5, [sp, #0xa4]
	add r1, sp, #0x6c
	str r1, [sp]
	ldr r2, _0205AE1C ; =0x00000966
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #4
	mov r2, #0x3a
	add r3, sp, #0xbc
	bl DrawTextInWindow
	ldrsh r0, [r6]
	bl GetBodySize
	mov r1, r0
	ldr r0, _0205AE20 ; =_020A34C4
	bl sub_0205B39C
	str r0, [sp, #0xa4]
	add r1, sp, #0x6c
	str r1, [sp]
	ldr r2, _0205AE24 ; =0x0000096A
	add r0, sp, #0xbc
	mov r1, #0xc8
	mov r3, #0
	bl PreprocessStringFromId
	add r3, sp, #0xbc
	mov r0, r4
	mov r1, #4
#ifdef JAPAN
	mov r2, #0x49
#else
	mov r2, #0x58
#endif
	bl DrawTextInWindow
	ldrb r2, [r6, #0x44]
	mov r0, r4
	mov r1, #4
#ifdef JAPAN
	add r2, r2, #0x33c
	add r2, r2, #0x2000
#else
	add r2, r2, #0x16c
	add r2, r2, #0x800
#endif
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
#ifdef JAPAN
	mov r2, #0x58
#else
	mov r2, #0x67
#endif
	bl sub_02026268
_0205AD98:
	add sp, sp, #0x184
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_0205A4B4_OFFSET 0x19D0
#else
#define SUB_0205A4B4_OFFSET 0
#endif
_0205ADA0: .word 0x00000951 + SUB_0205A4B4_OFFSET
_0205ADA4: .word 0x00000952 + SUB_0205A4B4_OFFSET
_0205ADA8: .word 0x00000953 + SUB_0205A4B4_OFFSET
_0205ADAC: .word 0x00000954 + SUB_0205A4B4_OFFSET
_0205ADB0: .word 0x00000955 + SUB_0205A4B4_OFFSET
_0205ADB4: .word 0x00000957 + SUB_0205A4B4_OFFSET
_0205ADB8: .word 0x0000095C + SUB_0205A4B4_OFFSET
_0205ADBC: .word 0x0000095B + SUB_0205A4B4_OFFSET
_0205ADC0: .word 0x00000956 + SUB_0205A4B4_OFFSET
_0205ADC4: .word 0x00000959 + SUB_0205A4B4_OFFSET
_0205ADC8: .word 0x0000095E + SUB_0205A4B4_OFFSET
_0205ADCC: .word 0x0000095D + SUB_0205A4B4_OFFSET
_0205ADD0: .word _020A34B8
#ifdef JAPAN
_0205B0D0: .word 0x00002330
#endif
_0205ADD4: .word 0x0000095F + SUB_0205A4B4_OFFSET
_0205ADD8: .word _020A34D2
_0205ADDC: .word 0x00000961 + SUB_0205A4B4_OFFSET
_0205ADE0: .word 0x00000962 + SUB_0205A4B4_OFFSET
_0205ADE4: .word 0x00000972 + SUB_0205A4B4_OFFSET
_0205ADE8: .word 0x00000973 + SUB_0205A4B4_OFFSET
_0205ADEC: .word STATUS_NAME_STRING_IDS
_0205ADF0: .word _020A34FC
_0205ADF4: .word 0x00000968 + SUB_0205A4B4_OFFSET
_0205ADF8: .word _020A3514
_0205ADFC: .word _020A351C
_0205AE00: .word _020A3524
_0205AE04: .word 0x00000969 + SUB_0205A4B4_OFFSET
_0205AE08: .word 0x00000963 + SUB_0205A4B4_OFFSET
_0205AE0C: .word 0x00000964 + SUB_0205A4B4_OFFSET
_0205AE10: .word 0x00000965 + SUB_0205A4B4_OFFSET
_0205AE14: .word 0x00000967 + SUB_0205A4B4_OFFSET
_0205AE18: .word 0x0000096B + SUB_0205A4B4_OFFSET
_0205AE1C: .word 0x00000966 + SUB_0205A4B4_OFFSET
_0205AE20: .word _020A34C4
_0205AE24: .word 0x0000096A + SUB_0205A4B4_OFFSET
	arm_func_end sub_0205A4B4

	arm_func_start CreateMonsterSummaryFromTeamMember
CreateMonsterSummaryFromTeamMember: ; 0x0205AE28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	mov sb, r0
	ldrsh r0, [r8, #8]
	mov r7, r2
	bl GetTeamMember
	mov r4, r0
	mov r1, r4
	add r0, sb, #2
	mov r2, #0x4e
	bl sub_02056084
	ldrsh r0, [r8, #0xc]
	mov r5, #0
	strh r0, [sb]
	ldrsh r0, [r8, #0xe]
	str r0, [sb, #0x24]
	ldrsh r0, [r8, #0xe]
	str r0, [sb, #0x28]
	ldrb r0, [r8, #2]
	str r0, [sb, #0x2c]
	ldr r0, [r8, #0x18]
	str r0, [sb, #0x30]
_0205AE84:
	add r2, r8, r5
	ldrb r0, [r2, #0x12]
	add r6, sb, r5
	mov r1, r5
	strb r0, [r6, #0x34]
	ldrb r0, [r2, #0x14]
	strb r0, [r6, #0x36]
	ldrsh r0, [r8, #0xc]
	bl GetType
	strb r0, [r6, #0x16]
	ldrsh r0, [r8, #0xc]
	mov r1, r5
	bl GetAbility
	add r5, r5, #1
	strb r0, [r6, #0x18]
	cmp r5, #2
	blt _0205AE84
	strb r7, [sb, #0x38]
	mov r0, #0
	strb r0, [sb, #0x39]
	strb r0, [sb, #0x3a]
	strb r0, [sb, #0x3b]
	strb r0, [sb, #0x3c]
	strb r0, [sb, #0x45]
	ldrb r1, [r8, #0x58]
	add r0, r8, #0x4c
	add r3, sb, #0x48
	strb r1, [sb, #0x54]
	ldrh r1, [r8, #0x3e]
	strh r1, [sb, #0x1c]
	ldrh r1, [r8, #0x40]
	strh r1, [sb, #0x1e]
	ldrh r1, [r8, #0x42]
	strh r1, [sb, #0x20]
	ldrsh r1, [r8, #6]
	strh r1, [sb, #0x3e]
	ldrb r1, [r8, #3]
	strb r1, [sb, #0x1a]
	ldrb r1, [r8, #4]
	strb r1, [sb, #0x1b]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	bl sub_0205B354
	str r0, [sp]
	ldrsh r1, [sb]
	ldrsh r3, [sb, #0x3e]
	add r0, sp, #4
	add r2, r8, #0x3e
	bl sub_0205B120
	ldrb r2, [sb, #0x39]
	ldrsh r1, [sp, #6]
	ldr r0, _0205B004 ; =0x000003E7
	add r1, r2, r1
	strb r1, [sb, #0x39]
	ldrb r2, [sb, #0x3a]
	ldrsh r1, [sp, #8]
	add r1, r2, r1
	strb r1, [sb, #0x3a]
	ldrb r2, [sb, #0x3b]
	ldrsh r1, [sp, #0xa]
	add r1, r2, r1
	strb r1, [sb, #0x3b]
	ldrb r2, [sb, #0x3c]
	ldrsh r1, [sp, #0xc]
	add r1, r2, r1
	strb r1, [sb, #0x3c]
	ldrsh r1, [sp, #4]
	ldr r2, [sb, #0x24]
	add r1, r2, r1
	str r1, [sb, #0x24]
	cmp r1, r0
	strgt r0, [sb, #0x24]
	ldr r1, [sb, #0x24]
	mov r0, #6
	str r1, [sb, #0x28]
	ldrb r1, [r4, #6]
	strb r1, [sb, #0x42]
	ldrb r1, [r4, #7]
	strb r1, [sb, #0x43]
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	moveq r0, #3
	beq _0205AFDC
	mov r0, r4
	bl GetMonsterEvoStatus
_0205AFDC:
	mov r2, #0
	strb r0, [sb, #0x44]
	mov r1, r2
_0205AFE8:
	add r0, sb, r2
	add r2, r2, #1
	strb r1, [r0, #0x58]
	cmp r2, #0x1f
	blt _0205AFE8
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0205B004: .word 0x000003E7
	arm_func_end CreateMonsterSummaryFromTeamMember

	arm_func_start sub_0205B008
sub_0205B008: ; 0x0205B008
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_02055894
	mov r1, r0
	mov r0, r4
	bl sub_0205B028
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205B008

	arm_func_start sub_0205B028
sub_0205B028: ; 0x0205B028
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	bne _0205B078
	add r0, sp, #0
	mov r1, r5
	mov r2, #0
	bl sub_02053224
	mov r0, r5
	bl sub_020564B0
	mov r2, r0
	add r1, sp, #0
	mov r0, r6
	bl CreateMonsterSummaryFromTeamMember
	b _0205B098
_0205B078:
	bl GetActiveTeamMember
	mov r4, r0
	mov r0, r5
	bl sub_020564B0
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl CreateMonsterSummaryFromTeamMember
_0205B098:
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0205B028

	arm_func_start sub_0205B0A0
sub_0205B0A0: ; 0x0205B0A0
	ldr ip, _0205B0B0 ; =sub_0205B39C
	mov r1, r0
	ldr r0, _0205B0B4 ; =_020A34D2
	bx ip
	.align 2, 0
_0205B0B0: .word sub_0205B39C
_0205B0B4: .word _020A34D2
	arm_func_end sub_0205B0A0

	arm_func_start sub_0205B0B8
sub_0205B0B8: ; 0x0205B0B8
	stmdb sp!, {r3, lr}
	ldrsh r1, [r0, #0x56]
	mov r2, #0x10
	mov lr, #0
	mov r3, lr
	sub ip, r1, #1
	sub r2, r2, #0xc
	b _0205B110
_0205B0D8:
	cmp ip, #0
	cmpge r2, #0x10
	blt _0205B104
	cmp ip, #0x1e
	bge _0205B118
	add r1, r0, ip
	ldrb r1, [r1, #0x58]
	cmp r1, #0
	beq _0205B104
	cmp r3, #1
	addge lr, lr, #1
_0205B104:
	add r3, r3, #1
	add ip, ip, #1
	add r2, r2, #0xc
_0205B110:
	cmp r3, #0xa
	blt _0205B0D8
_0205B118:
	mov r0, lr
	ldmia sp!, {r3, pc}
	arm_func_end sub_0205B0B8

	arm_func_start sub_0205B120
sub_0205B120: ; 0x0205B120
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, #0
	strh r6, [r5]
	strh r6, [r5, #2]
	strh r6, [r5, #4]
	mov r4, r2
	strh r6, [r5, #6]
	add r0, sp, #0
	mov r7, r1
	mov r2, r3
	strh r6, [r5, #8]
	bl EnableAllLearnableIqSkills
	mov r0, r7
	mov r1, r6
	bl GetType
	mov r6, r0
	mov r0, r7
	mov r1, #1
	bl GetType
	mov r3, r0
	mov r1, r7
	mov r2, r6
	add r0, sp, #0xc
	bl sub_02011220
	add r0, sp, #0xc
	bl GetHpBoostFromExclusiveItems
	ldrsh r2, [r5]
	ldrb r1, [sp, #0x38]
	add r0, r2, r0
	strh r0, [r5]
	cmp r1, #0
	ldrsh r1, [r5, #2]
	ldrb r0, [sp, #0xc]
	add r0, r1, r0
	strh r0, [r5, #2]
	ldrsh r1, [r5, #4]
	ldrb r0, [sp, #0xd]
	add r0, r1, r0
	strh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	ldrb r0, [sp, #0xe]
	add r0, r1, r0
	strh r0, [r5, #6]
	ldrsh r1, [r5, #8]
	ldrb r0, [sp, #0xf]
	add r0, r1, r0
	strh r0, [r5, #8]
	bne _0205B30C
	cmp r4, #0
	beq _0205B30C
	ldrb r0, [r4]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0205B30C
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0205B30C
	ldrsh r0, [r4, #4]
	cmp r0, #0x1a
	ldreq r0, _0205B338 ; =POWER_BAND_STAT_BOOST
	ldreqsh r1, [r5, #2]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #2]
	ldrsh r0, [r4, #4]
	cmp r0, #0x32
	ldreq r0, _0205B33C ; =MUNCH_BELT_STAT_BOOST
	ldreqsh r1, [r5, #2]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #2]
	ldrsh r0, [r4, #4]
	cmp r0, #0x28
	ldreq r0, _0205B340 ; =SPECIAL_BAND_STAT_BOOST
	ldreqsh r1, [r5, #4]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0x32
	ldreq r0, _0205B33C ; =MUNCH_BELT_STAT_BOOST
	ldreqsh r1, [r5, #4]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0x25
	ldreq r0, _0205B344 ; =DEF_SCARF_STAT_BOOST
	ldreqsh r1, [r5, #6]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #6]
	ldrsh r0, [r4, #4]
	cmp r0, #0x29
	ldreq r0, _0205B348 ; =ZINC_BAND_STAT_BOOST
	ldreqsh r1, [r5, #8]
	ldreqsh r0, [r0]
	addeq r0, r1, r0
	streqh r0, [r5, #8]
	ldrsh r0, [r4, #4]
	bl IsAuraBow
	cmp r0, #0
	beq _0205B30C
	ldr r0, _0205B34C ; =AURA_BOW_STAT_BOOST
	ldrsh r1, [r5, #2]
	ldrsh r2, [r0]
	add r0, r1, r2
	strh r0, [r5, #2]
	ldrsh r0, [r5, #4]
	add r0, r0, r2
	strh r0, [r5, #4]
	ldrsh r0, [r5, #6]
	add r0, r0, r2
	strh r0, [r5, #6]
	ldrsh r0, [r5, #8]
	add r0, r0, r2
	strh r0, [r5, #8]
_0205B30C:
	add r0, sp, #0
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r0, #0
	ldrne r0, _0205B350 ; =_020A1870
	ldrnesh r1, [r5]
	ldrnesh r0, [r0]
	addne r0, r1, r0
	strneh r0, [r5]
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0205B338: .word POWER_BAND_STAT_BOOST
_0205B33C: .word MUNCH_BELT_STAT_BOOST
_0205B340: .word SPECIAL_BAND_STAT_BOOST
_0205B344: .word DEF_SCARF_STAT_BOOST
_0205B348: .word ZINC_BAND_STAT_BOOST
_0205B34C: .word AURA_BOW_STAT_BOOST
_0205B350: .word _020A1870
	arm_func_end sub_0205B120

	arm_func_start sub_0205B354
sub_0205B354: ; 0x0205B354
	ldrb r1, [r0, #0x45]
	cmp r1, #0
	movne r0, #0
	bxne lr
	mov r2, #0
	b _0205B38C
_0205B36C:
	add r1, r0, r2
	ldrb r1, [r1, #0x18]
	cmp r1, #0x6f
	moveq r0, #1
	bxeq lr
	add r1, r2, #1
	mov r1, r1, lsl #0x10
	mov r2, r1, asr #0x10
_0205B38C:
	cmp r2, #2
	blt _0205B36C
	mov r0, #0
	bx lr
	arm_func_end sub_0205B354

	arm_func_start sub_0205B39C
sub_0205B39C: ; 0x0205B39C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, r1
	bl AllocateTemp1024ByteBufferFromPool
	mov r7, r0
	b _0205B3C0
_0205B3B4:
	cmp r5, r0
	bge _0205B3CC
	add r4, r4, #2
_0205B3C0:
	ldrsb r0, [r4]
	cmp r0, #0
	bge _0205B3B4
_0205B3CC:
	mov r6, #0
	strb r6, [r7]
	ldrsb r0, [r4, #1]
	cmp r0, #0
	beq _0205B420
	ldr r5, _0205B434 ; =_020A353C
	b _0205B3F8
_0205B3E8:
	mov r0, r7
	mov r1, r5
	bl strcat
	add r6, r6, #1
_0205B3F8:
	ldrsb r1, [r4, #1]
	add r0, r1, r1, lsr #31
	cmp r6, r0, asr #1
	blt _0205B3E8
	tst r1, #1
	beq _0205B42C
	ldr r1, _0205B438 ; =_020A3544
	mov r0, r7
	bl strcat
	b _0205B42C
_0205B420:
	ldr r1, _0205B43C ; =_020A354C
	mov r0, r7
	bl strcat
_0205B42C:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205B434: .word _020A353C
_0205B438: .word _020A3544
_0205B43C: .word _020A354C
	arm_func_end sub_0205B39C

	arm_func_start sub_0205B440
sub_0205B440: ; 0x0205B440
	ldr r0, _0205B448 ; =_020A3550
	bx lr
	.align 2, 0
_0205B448: .word _020A3550
	arm_func_end sub_0205B440

	arm_func_start sub_0205B44C
sub_0205B44C: ; 0x0205B44C
	ldr r1, _0205B468 ; =_022B5910
	ldr r0, _0205B46C ; =_020B0A54
	ldr r2, _0205B470 ; =_022B57C0
	str r1, [r0]
	ldr r1, _0205B474 ; =_022B580C
	stmib r0, {r1, r2}
	bx lr
	.align 2, 0
_0205B468: .word _022B5910
_0205B46C: .word _020B0A54
_0205B470: .word _022B57C0
_0205B474: .word _022B580C
	arm_func_end sub_0205B44C

	arm_func_start sub_0205B478
sub_0205B478: ; 0x0205B478
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl sub_0204A198
	ldrb r1, [sp, #3]
	ldr r0, _0205B54C ; =_020B0A54
	ldrb r2, [sp, #2]
	mov r1, r1, lsl #0x10
	ldrb r3, [sp, #4]
	orr r1, r1, r2, lsl #24
	ldrb r2, [sp, #5]
	orr r1, r1, r3, lsl #8
	ldr r0, [r0]
	orr ip, r2, r1
	ldr r3, _0205B550 ; =_022B57BC
	mov r1, #0
	mov r2, #0x1600
	str ip, [r3]
	bl MemsetSimple
	ldr r0, _0205B54C ; =_020B0A54
	mov r1, #0
	ldr r0, [r0, #8]
	mov r2, #0x4c
	bl MemsetSimple
	mov lr, #0
	ldr r2, _0205B54C ; =_020B0A54
	mov r0, lr
	mov r1, #0xb0
_0205B4E8:
	mul ip, lr, r1
	ldr r3, [r2]
	add lr, lr, #1
	strb r0, [r3, ip]
	ldr r3, [r2]
	cmp lr, #0x20
	add r3, r3, ip
	strh r0, [r3, #0xa2]
	blt _0205B4E8
	ldr r1, _0205B54C ; =_020B0A54
	mov ip, #0
	ldr r2, [r1, #4]
	mvn r3, #0
	str r0, [r2]
_0205B520:
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #3
	str ip, [r2, #4]
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #3
	add r0, r0, #1
	str r3, [r2, #8]
	cmp r0, #0x20
	blt _0205B520
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205B54C: .word _020B0A54
_0205B550: .word _022B57BC
	arm_func_end sub_0205B478

	arm_func_start sub_0205B554
sub_0205B554: ; 0x0205B554
	ldr ip, _0205B55C ; =sub_0205B560
	bx ip
	.align 2, 0
_0205B55C: .word sub_0205B560
	arm_func_end sub_0205B554

	arm_func_start sub_0205B560
sub_0205B560: ; 0x0205B560
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r2, [r0, #4]
	ldreq r0, [r1, #4]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0205B560

	arm_func_start sub_0205B584
sub_0205B584: ; 0x0205B584
	stmdb sp!, {r4, lr}
	ldr r1, _0205B5A4 ; =_022B57BC
	mov r4, r0
	ldr r0, [r1]
	str r0, [r4]
	bl sub_02048C3C
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205B5A4: .word _022B57BC
	arm_func_end sub_0205B584

	arm_func_start sub_0205B5A8
sub_0205B5A8: ; 0x0205B5A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc4
	ldr lr, _0205B688 ; =_020A3678
	add ip, sp, #0x14
	mov r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0xb
_0205B5CC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0205B5CC
	strb r8, [sp, #0x18]
	strb r7, [sp, #0x19]
	bl GetLanguageType
	strb r0, [sp, #0x30]
	mov r0, #2
	strb r6, [sp, #0xc0]
	bl RandInt
	orr r0, r0, #2
	strb r0, [sp, #0xc2]
	bl sub_02063504
	mov r5, r0
	bl Rand16Bit
	orr r0, r0, r5, lsl #16
	bl sub_020510E8
	strb r4, [sp, #0x14]
	bl sub_02051134
	str r0, [sp, #0x2c]
	bl sub_02051134
	str r0, [sp, #0xbc]
	bl sub_02051134
	bic r0, r0, #0xff000000
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xbc]
	bl sub_020634F4
	ldr r1, _0205B68C ; =0x000038C9
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r0, sp, #0x31
	add r1, sp, #0
#ifdef JAPAN
	bl sub_02025304_JP
#else
	bl StrcpyName
#endif
	cmp r4, #1
	bne _0205B668
	add r0, sp, #0x18
	bl sub_0205BAB0
	b _0205B680
_0205B668:
	cmp r4, #5
	add r0, sp, #0x14
	bne _0205B67C
	bl sub_0205B738
	b _0205B680
_0205B67C:
	bl sub_0205B6EC
_0205B680:
	add sp, sp, #0xc4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205B688: .word _020A3678
#if defined(EUROPE)
_0205B68C: .word 0x000038CB
#elif defined(JAPAN)
_0205B68C: .word 0x00003507
#else
_0205B68C: .word 0x000038C9
#endif
	arm_func_end sub_0205B5A8

	arm_func_start sub_0205B690
sub_0205B690: ; 0x0205B690
	ldr r1, _0205B6C8 ; =_020B0A54
	mov r0, #2
	ldr r3, [r1]
	mov r1, #0xb0
	b _0205B6B8
_0205B6A4:
	mul r2, r0, r1
	ldrb r2, [r3, r2]
	cmp r2, #0
	bxeq lr
	add r0, r0, #1
_0205B6B8:
	cmp r0, #0x20
	blt _0205B6A4
	mvn r0, #0
	bx lr
	.align 2, 0
_0205B6C8: .word _020B0A54
	arm_func_end sub_0205B690

	arm_func_start sub_0205B6CC
sub_0205B6CC: ; 0x0205B6CC
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0xc]
	cmp r1, #0
	cmpeq r0, #2
	mov r0, #0
	movhs r0, #1
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0205B6CC

	arm_func_start sub_0205B6EC
sub_0205B6EC: ; 0x0205B6EC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0205B690
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _0205B734 ; =_020B0A54
	mov r1, #0xb0
	ldr r2, [r2]
	mov ip, #0xb
	mla lr, r0, r1, r2
_0205B71C:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205B71C
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205B734: .word _020B0A54
	arm_func_end sub_0205B6EC

	arm_func_start sub_0205B738
sub_0205B738: ; 0x0205B738
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0205B778 ; =_020B0A54
	mov r5, r0
	ldr r1, [r1]
	mov r4, #0
	ldrb r0, [r1, #0xb0]
	add lr, r1, #0xb0
	mov ip, #0xb
	cmp r0, #0
	movne r4, #1
_0205B760:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205B760
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205B778: .word _020B0A54
	arm_func_end sub_0205B738

	arm_func_start sub_0205B77C
sub_0205B77C: ; 0x0205B77C
	ldr r2, _0205B790 ; =_020B0A54
	mov r1, #0xb0
	ldr r2, [r2]
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_0205B790: .word _020B0A54
	arm_func_end sub_0205B77C

	arm_func_start sub_0205B794
sub_0205B794: ; 0x0205B794
	stmdb sp!, {r4, lr}
	ldr r3, _0205B7C4 ; =_020B0A54
	mov r2, #0xb0
	ldr r3, [r3]
	mov r4, r0
	mla lr, r1, r2, r3
	mov ip, #0xb
_0205B7B0:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205B7B0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205B7C4: .word _020B0A54
	arm_func_end sub_0205B794

	arm_func_start sub_0205B7C8
sub_0205B7C8: ; 0x0205B7C8
	stmdb sp!, {r4, lr}
	mov r2, #0xb0
	mul r4, r0, r2
	ldr r0, _0205B808 ; =_020B0A54
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	bl MemsetSimple
	ldr r0, _0205B808 ; =_020B0A54
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, r4]
	ldr r0, [r0]
	add r0, r0, r4
	strh r2, [r0, #0xa2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205B808: .word _020B0A54
	arm_func_end sub_0205B7C8

	arm_func_start sub_0205B80C
sub_0205B80C: ; 0x0205B80C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, #0
	ldr r7, _0205B88C ; =_020B0A54
	mov r8, sl
	mov sb, #1
	mov r4, #0xb0
	mov r6, sl
	mov r5, #2
_0205B82C:
	mov r0, sl, lsl #0x18
	ldr r1, [r7]
	mov r0, r0, asr #0x18
	mla r2, r0, r4, r1
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0xc]
	cmp r0, r6
	cmpeq r1, r5
	movhs r0, sb
	movlo r0, r8
	tst r0, #0xff
	ldrneb r0, [r2, #0xad]
	cmpne r0, #0
	ldrneb r0, [r2]
	cmpne r0, #1
	cmpne r0, #7
	beq _0205B87C
	mov r0, sl, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B7C8
_0205B87C:
	add sl, sl, #1
	cmp sl, #0x20
	blt _0205B82C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205B88C: .word _020B0A54
	arm_func_end sub_0205B80C

	arm_func_start sub_0205B890
sub_0205B890: ; 0x0205B890
	ldr r1, _0205B8C8 ; =_020B0A54
	ldr r2, [r0]
	ldr r3, [r1, #4]
	ldr r0, [r0, #4]
	ldr r1, [r3]
	add r1, r3, r1, lsl #3
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r3]
	cmp r0, #0x1f
	addlt r0, r0, #1
	movge r0, #0
	str r0, [r3]
	bx lr
	.align 2, 0
_0205B8C8: .word _020B0A54
	arm_func_end sub_0205B890

	arm_func_start sub_0205B8CC
sub_0205B8CC: ; 0x0205B8CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	ldr r4, _0205B914 ; =_020B0A54
	b _0205B904
_0205B8E0:
	ldr r0, [r4, #4]
	mov r1, r6
	add r0, r0, #4
	add r0, r0, r5, lsl #3
	bl sub_0205B560
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_0205B904:
	cmp r5, #0x20
	blt _0205B8E0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205B914: .word _020B0A54
	arm_func_end sub_0205B8CC

	arm_func_start sub_0205B918
sub_0205B918: ; 0x0205B918
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r8, _0205B978 ; =_020B0A54
	mov r7, #0xb0
	b _0205B968
_0205B934:
	mul r1, r4, r7
	ldr r2, [r8]
	ldrb r0, [r2, r1]
	add r2, r2, r1
	cmp r6, r0
	bne _0205B964
	mov r1, r5
	add r0, r2, #0x14
	bl sub_0205B560
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0205B964:
	add r4, r4, #1
_0205B968:
	cmp r4, #0x20
	blt _0205B934
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205B978: .word _020B0A54
	arm_func_end sub_0205B918

	arm_func_start GetSosMailCount
GetSosMailCount: ; 0x0205B97C
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldr r1, _0205B9C4 ; =_020B0A54
	mov r3, #0
	movne lr, #2
	ldr ip, [r1]
	moveq lr, r3
	mov r1, #0xb0
	b _0205B9B4
_0205B9A0:
	mul r2, lr, r1
	ldrb r2, [ip, r2]
	add lr, lr, #1
	cmp r0, r2
	addeq r3, r3, #1
_0205B9B4:
	cmp lr, #0x20
	blt _0205B9A0
	mov r0, r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205B9C4: .word _020B0A54
	arm_func_end GetSosMailCount

	arm_func_start sub_0205B9C8
sub_0205B9C8: ; 0x0205B9C8
	ldr r1, _0205BA08 ; =_020B0A54
	cmp r0, #0
	ldr r3, [r1]
	mov r0, #0
	movne ip, #2
	moveq ip, r0
	mov r1, #0xb0
	b _0205B9FC
_0205B9E8:
	mul r2, ip, r1
	ldrb r2, [r3, r2]
	add ip, ip, #1
	cmp r2, #0
	addne r0, r0, #1
_0205B9FC:
	cmp ip, #0x20
	blt _0205B9E8
	bx lr
	.align 2, 0
_0205BA08: .word _020B0A54
	arm_func_end sub_0205B9C8

	arm_func_start sub_0205BA0C
sub_0205BA0C: ; 0x0205BA0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r8, _0205BA6C ; =_020B0A54
	mov r7, #0xb0
	b _0205BA5C
_0205BA28:
	mul r1, r4, r7
	ldr r2, [r8]
	ldrb r0, [r2, r1]
	add r2, r2, r1
	cmp r6, r0
	bne _0205BA58
	mov r1, r5
	add r0, r2, #0x14
	bl sub_0205B560
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0205BA58:
	add r4, r4, #1
_0205BA5C:
	cmp r4, #0x20
	blt _0205BA28
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205BA6C: .word _020B0A54
	arm_func_end sub_0205BA0C

	arm_func_start sub_0205BA70
sub_0205BA70: ; 0x0205BA70
	ldr r1, _0205BAAC ; =_020B0A54
	mov r3, #0
	ldr ip, [r1]
	mov r1, #0xb0
	b _0205BA9C
_0205BA84:
	mul r2, r3, r1
	ldrb r2, [ip, r2]
	cmp r0, r2
	moveq r0, r3
	bxeq lr
	add r3, r3, #1
_0205BA9C:
	cmp r3, #0x20
	blt _0205BA84
	mvn r0, #0
	bx lr
	.align 2, 0
_0205BAAC: .word _020B0A54
	arm_func_end sub_0205BA70

	arm_func_start sub_0205BAB0
sub_0205BAB0: ; 0x0205BAB0
	stmdb sp!, {r4, lr}
	ldr r1, _0205BB74 ; =_020B0A54
	mov r4, #1
	ldr r3, [r1]
	mov r2, #0
	strb r4, [r3]
	ldr r3, [r1]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r3, #4]
	str r0, [r3, #8]
	str r2, [r3, #0xc]
	str r2, [r3, #0x10]
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl sub_02051134
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	str r0, [r1, #0x18]
	bl sub_020634F4
	ldr r1, _0205BB78 ; =_022B57BC
	ldr r0, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl GetLanguageType
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r2, [r1]
	strb r0, [r2, #0x1c]
	ldr r0, [r1]
	add r0, r0, #0x1d
	bl GetMainTeamNameWithCheck
	ldr r0, _0205BB74 ; =_020B0A54
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetMaxRescueAttempts
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	strb r0, [r1, #0xac]
	mov r0, #2
	bl RandInt
	ldr r1, _0205BB74 ; =_020B0A54
	orr r2, r0, #2
	ldr r0, [r1]
	strb r2, [r0, #0xae]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205BB74: .word _020B0A54
_0205BB78: .word _022B57BC
	arm_func_end sub_0205BAB0

	arm_func_start sub_0205BB7C
sub_0205BB7C: ; 0x0205BB7C
	ldr r3, _0205BBA0 ; =_020B0A54
	mov r2, #0xb0
	ldr r3, [r3]
	mla r3, r1, r2, r3
	ldr r2, [r3, #4]
	ldr r1, [r3, #8]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0205BBA0: .word _020B0A54
	arm_func_end sub_0205BB7C

	arm_func_start sub_0205BBA4
sub_0205BBA4: ; 0x0205BBA4
	ldr r1, _0205BBF8 ; =_020B0A54
	ldr r3, [r1]
	ldrb r1, [r3]
	cmp r1, #1
	bne _0205BBF0
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0xc]
	cmp r1, #0
	mov r1, #0
	cmpeq r2, #2
	movhs r1, #1
	tst r1, #0xff
	beq _0205BBF0
	cmp r0, #0
	addne r1, r3, #0xc
	ldmneia r1, {r2, r3}
	stmneia r0, {r2, r3}
	mov r0, #1
	bx lr
_0205BBF0:
	mov r0, #0
	bx lr
	.align 2, 0
_0205BBF8: .word _020B0A54
	arm_func_end sub_0205BBA4

	arm_func_start sub_0205BBFC
sub_0205BBFC: ; 0x0205BBFC
	stmdb sp!, {r4, lr}
	ldr r1, _0205BC2C ; =_020B0A54
	mov r4, r0
	ldr lr, [r1, #8]
	mov ip, #4
_0205BC10:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0205BC10
	ldr r0, [lr]
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205BC2C: .word _020B0A54
	arm_func_end sub_0205BBFC

	arm_func_start sub_0205BC30
sub_0205BC30: ; 0x0205BC30
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	bne _0205BC58
	ldr r0, _0205BC90 ; =_020B0A54
	mov r1, #0
	ldr r0, [r0, #8]
	mov r2, #0x44
	bl MemsetSimple
	ldmia sp!, {r4, pc}
_0205BC58:
	ldr r2, _0205BC90 ; =_020B0A54
	mov r1, r0
	ldr r0, [r2, #8]
	bl sub_02055F04
	cmp r4, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _0205BC90 ; =_020B0A54
	ldr r0, [r0, #8]
	ldrb r0, [r0, #2]
	bl sub_02051788
	ldr r1, _0205BC90 ; =_020B0A54
	ldr r1, [r1, #8]
	strb r0, [r1, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205BC90: .word _020B0A54
	arm_func_end sub_0205BC30

	arm_func_start sub_0205BC94
sub_0205BC94: ; 0x0205BC94
	ldr r1, _0205BCC0 ; =_020B0A54
	mov r2, #1
	ldr r3, [r1, #8]
	ldrh r1, [r3, #0x44]
	strh r1, [r0]
	ldrh r1, [r3, #0x46]
	strh r1, [r0, #2]
	ldrh r1, [r3, #0x48]
	strh r1, [r0, #4]
	strb r2, [r0]
	bx lr
	.align 2, 0
_0205BCC0: .word _020B0A54
	arm_func_end sub_0205BC94

	arm_func_start sub_0205BCC4
sub_0205BCC4: ; 0x0205BCC4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0205BCEC
	ldr r0, _0205BD10 ; =_020B0A54
	mov r1, #0
	ldr r0, [r0, #8]
	mov r2, #6
	add r0, r0, #0x44
	bl MemsetSimple
	ldmia sp!, {r3, pc}
_0205BCEC:
	ldr r1, _0205BD10 ; =_020B0A54
	ldrh r2, [r0]
	ldr r3, [r1, #8]
	strh r2, [r3, #0x44]
	ldrh r1, [r0, #2]
	strh r1, [r3, #0x46]
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x48]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205BD10: .word _020B0A54
	arm_func_end sub_0205BCC4

	arm_func_start sub_0205BD14
sub_0205BD14: ; 0x0205BD14
	stmdb sp!, {r4, lr}
	ldr r3, _0205BD3C ; =_020B0A54
	mov r2, #0xb0
	ldr r3, [r3]
	mov r4, r0
	mla r0, r1, r2, r3
	ldrb r0, [r0, #0xae]
	bl sub_0205BD40
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205BD3C: .word _020B0A54
	arm_func_end sub_0205BD14

	arm_func_start sub_0205BD40
sub_0205BD40: ; 0x0205BD40
	tst r0, #2
	movne r0, #0
	bxne lr
	tst r0, #1
	movne r0, #2
	moveq r0, #1
	bx lr
	arm_func_end sub_0205BD40

	arm_func_start sub_0205BD5C
sub_0205BD5C: ; 0x0205BD5C
	stmdb sp!, {r3, lr}
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0205BD5C

	arm_func_start sub_0205BD78
sub_0205BD78: ; 0x0205BD78
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl RandInt
	orr r0, r0, #2
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_0205BD78

	arm_func_start sub_0205BD90
sub_0205BD90: ; 0x0205BD90
	and r0, r0, #1
	orr r0, r0, #2
	bx lr
	arm_func_end sub_0205BD90

	arm_func_start sub_0205BD9C
sub_0205BD9C: ; 0x0205BD9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	ldr r1, _0205BFA8 ; =_022B57BC
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsFrom
	ldr r5, _0205BFAC ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb0
_0205BDD8:
	ldr r1, [r5]
	mov r0, r6
	mla r1, r7, r4, r1
	bl sub_0205C19C
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205BDD8
	ldr r0, _0205BFAC ; =_020B0A54
	mov r1, #0
	ldr r4, [r0, #8]
	mov r2, #0x44
	mov r0, r4
	bl memset
	add r0, sp, #0
	mov r1, r4
	mov r2, #4
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #2
	bl Copy16BitsFrom
	add r0, sp, #0
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #6
	bl sub_02059AE8
	add r0, sp, #0
	add r1, r4, #7
	bl sub_02059AE8
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0xa
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0xa
	mov r2, #0xa
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0xd
	mov r2, #8
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0xe
	mov r2, #8
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0xf
	mov r2, #8
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0x10
	mov r2, #0x18
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0x14
	mov r2, #0x45
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0x20
	mov r2, #4
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0x22
	bl CopyMovesetFrom
	add r0, sp, #0
	add r1, r4, #0x3a
	mov r2, #0x50
	bl CopyBitsFrom
	ldr r0, _0205BFAC ; =_020B0A54
	mov r1, #0
	ldr r4, [r0, #8]
	mov r2, #6
	add r0, r4, #0x44
	bl memset
	add r0, sp, #0
	add r1, r4, #0x46
	mov r2, #0xb
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, r4, #0x48
	mov r2, #0xb
	bl CopyBitsFrom
	ldr r1, _0205BFAC ; =_020B0A54
	add r0, sp, #0
	ldr r1, [r1, #4]
	mov r2, #0x20
	bl CopyBitsFrom
	ldr r4, _0205BFAC ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r5, #0x40
_0205BF68:
	ldr r1, [r4, #4]
	mov r0, r6
	add r1, r1, #4
	mov r2, r5
	add r1, r1, r7, lsl #3
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205BF68
	add r0, sp, #0
	bl sub_020509BC
	bl Rand16Bit
	bl sub_020634F4
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205BFA8: .word _022B57BC
_0205BFAC: .word _020B0A54
	arm_func_end sub_0205BD9C

	arm_func_start sub_0205BFB0
sub_0205BFB0: ; 0x0205BFB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	ldr r1, _0205C194 ; =_022B57BC
	add r0, sp, #0
	mov r2, #0x20
	bl CopyBitsTo
	ldr r5, _0205C198 ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb0
_0205BFEC:
	ldr r1, [r5]
	mov r0, r6
	mla r1, r7, r4, r1
	bl sub_0205C440
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205BFEC
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r4, [r1, #8]
	mov r2, #4
	mov r1, r4
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #1
	mov r2, #7
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #2
	bl sub_020515C4
	add r0, sp, #0
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #6
	bl sub_02059AF8
	add r0, sp, #0
	add r1, r4, #7
	bl sub_02059AF8
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0xa
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xa
	mov r2, #0xa
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xd
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xe
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0xf
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x10
	mov r2, #0x18
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x14
	mov r2, #0x45
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x20
	mov r2, #4
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x22
	bl CopyMovesetTo
	add r0, sp, #0
	add r1, r4, #0x3a
	mov r2, #0x50
	bl CopyBitsTo
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r4, [r1, #8]
	mov r2, #0xb
	add r1, r4, #0x46
	bl CopyBitsTo
	add r0, sp, #0
	add r1, r4, #0x48
	mov r2, #0xb
	bl CopyBitsTo
	ldr r1, _0205C198 ; =_020B0A54
	add r0, sp, #0
	ldr r1, [r1, #4]
	mov r2, #0x20
	bl CopyBitsTo
	ldr r4, _0205C198 ; =_020B0A54
	mov r7, #0
	add r6, sp, #0
	mov r5, #0x40
_0205C15C:
	ldr r1, [r4, #4]
	mov r0, r6
	add r1, r1, #4
	mov r2, r5
	add r1, r1, r7, lsl #3
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x20
	blt _0205C15C
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205C194: .word _022B57BC
_0205C198: .word _020B0A54
	arm_func_end sub_0205BFB0

	arm_func_start sub_0205C19C
sub_0205C19C: ; 0x0205C19C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	bl Copy16BitsFrom
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #0x40
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x32
	mov r2, #0x120
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x56
	mov r2, #0x240
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xac
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, r4, #0xae
	mov r2, #2
	cmp r0, #0
	movne r3, #1
	moveq r3, #0
	mov r0, r5
	strb r3, [r4, #0xad]
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205C19C

	arm_func_start sub_0205C2A4
sub_0205C2A4: ; 0x0205C2A4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	bl sub_02051648
	ldrb r0, [r4]
	cmp r0, #1
	movne r0, #0
	strne r0, [r4, #8]
	bne _0205C2EC
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsFrom
_0205C2EC:
	mov r3, #0
	str r3, [r4, #0xc]
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	str r3, [r4, #0x10]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsFrom
	ldrb r0, [r4]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r4, #0xa0]
	streqh r0, [r4, #0xa2]
	beq _0205C360
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xa
	bl CopyBitsFrom
_0205C360:
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsFrom
	ldrb r0, [r4, #4]
	bl GetMaxRescueAttempts
	strb r0, [r4, #0xac]
	mov r2, #1
	add r1, sp, #0
	mov r0, r5
	strb r2, [r4, #0xad]
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, sp, #0
	cmp r0, #0
	moveq r2, #0
	movne r2, #1
	strb r2, [r4, #0xae]
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	cmp r0, #1
	moveq r1, #2
	ldrb r0, [r4, #0xae]
	movne r1, #0
	orr r0, r0, r1
	strb r0, [r4, #0xae]
	ldrb r0, [r4]
	cmp r0, #1
	beq _0205C438
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _0205C438
	add r1, sp, #4
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	add r1, sp, #2
	mov r0, r5
	mov r2, #1
	bl CopyBitsFrom
	ldrh r1, [r4, #0xa0]
	ldrh r0, [sp, #4]
	orr r0, r1, r0, lsl #10
	strh r0, [r4, #0xa0]
	ldrsh r1, [r4, #0xa2]
	ldrsh r0, [sp, #2]
	orr r0, r1, r0, lsl #10
	strh r0, [r4, #0xa2]
_0205C438:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205C2A4

	arm_func_start sub_0205C440
sub_0205C440: ; 0x0205C440
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	bl sub_020515C4
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #0x40
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x32
	mov r2, #0x120
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x56
	mov r2, #0x240
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xac
	mov r2, #8
	bl CopyBitsTo
	ldrb r0, [r4, #0xad]
	mov r2, #1
	cmp r0, #1
	ldreq r1, _0205C540 ; =_020A3673
	mov r0, r5
	ldrne r1, _0205C544 ; =_020A3670
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xae
	mov r2, #2
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205C540: .word _020A3673
_0205C544: .word _020A3670
	arm_func_end sub_0205C440

	arm_func_start sub_0205C548
sub_0205C548: ; 0x0205C548
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	bl sub_02051620
	ldrb r0, [r4]
	cmp r0, #1
	bne _0205C584
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsTo
_0205C584:
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0x40
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1d
	mov r2, #0x50
	bl CopyBitsTo
	ldrb r0, [r4]
	cmp r0, #1
	beq _0205C5E0
	mov r0, r5
	add r1, r4, #0xa0
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xa2
	mov r2, #0xa
	bl CopyBitsTo
_0205C5E0:
	mov r0, r5
	add r1, r4, #0xa4
	mov r2, #0x40
	bl CopyBitsTo
	ldrb r0, [r4, #0xae]
	mov r2, #1
	tst r0, #1
	ldreq r1, _0205C680 ; =_020A3671
	mov r0, r5
	ldrne r1, _0205C684 ; =_020A3672
	bl CopyBitsTo
	ldr r1, _0205C684 ; =_020A3672
	mov r0, r5
	mov r2, #1
	bl CopyBitsTo
	ldrb r0, [r4]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r2, [r4, #0xa0]
	add r1, sp, #2
	mov r0, r5
	mov r2, r2, asr #0xa
	strh r2, [sp, #2]
	ldrsh r3, [r4, #0xa2]
	mov r2, #1
	mov r3, r3, asr #0xa
	strh r3, [sp]
	bl CopyBitsTo
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205C680: .word _020A3671
_0205C684: .word _020A3672
	arm_func_end sub_0205C548

	arm_func_start sub_0205C688
sub_0205C688: ; 0x0205C688
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	bne _0205C6C4
	mov r0, r4
	bl sub_02054F18
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_0205C6C4:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205C688

	arm_func_start sub_0205C6CC
sub_0205C6CC: ; 0x0205C6CC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0205BD40
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	mov r0, r4
	bne _0205C6F8
	bl IsMovesetValidInTimeDarkness
	ldmia sp!, {r4, pc}
_0205C6F8:
	bl IsMovesetValid
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205C6CC

	arm_func_start sub_0205C700
sub_0205C700: ; 0x0205C700
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl sub_0205C688
	cmp r0, #0
	beq _0205C72C
	mov r0, r5
	mov r1, r4
	bl sub_0205C6CC
	cmp r0, #0
	bne _0205C734
_0205C72C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205C734:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205C700

	arm_func_start sub_0205C73C
sub_0205C73C: ; 0x0205C73C
	ldr r1, _0205C750 ; =_022B6F10
	ldr r0, _0205C754 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205C758 ; =sub_020600CC
	str r1, [r0, #0x18]
	bx ip
	.align 2, 0
_0205C750: .word _022B6F10
_0205C754: .word MISSION_DELIVER_LIST_PTR
_0205C758: .word sub_020600CC
	arm_func_end sub_0205C73C

	arm_func_start sub_0205C75C
sub_0205C75C: ; 0x0205C75C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	mov r5, #0
_0205C768:
	ldr r1, [r4, #0x18]
	mov r0, r5, lsl #0x18
	add r0, r1, r0, asr #19
	bl ClearMissionData
	add r5, r5, #1
	cmp r5, #8
	blt _0205C768
	ldr r4, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	mov r5, #0
_0205C78C:
	ldr r1, [r4, #0x18]
	mov r0, r5, lsl #0x18
	add r1, r1, #0x100
	add r0, r1, r0, asr #19
	bl ClearMissionData
	add r5, r5, #1
	cmp r5, #8
	blt _0205C78C
	ldr r4, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	mov r5, #0
_0205C7B4:
	ldr r1, [r4, #0x18]
	mov r0, r5, lsl #0x18
	add r1, r1, #0x200
	add r0, r1, r0, asr #19
	bl ClearMissionData
	add r5, r5, #1
	cmp r5, #8
	blt _0205C7B4
	ldr r0, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x18]
	add r0, r0, #0x300
	bl ClearMissionData
	ldr r0, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x18]
	add r0, r0, #0x320
	bl ClearMissionData
	mov r0, #0
	ldr r2, _0205C850 ; =MISSION_DELIVER_LIST_PTR
	mov lr, #0xff
	mov ip, #1
	mov r4, r0
	mov r1, #0xc
_0205C80C:
	mul r5, r0, r1
	ldr r3, [r2, #0x18]
	add r0, r0, #1
	add r3, r3, r5
	strb lr, [r3, #0x340]
	ldr r3, [r2, #0x18]
	cmp r0, #0x10
	add r3, r3, r5
	strb ip, [r3, #0x341]
	ldr r3, [r2, #0x18]
	add r3, r3, r5
	str r4, [r3, #0x344]
	ldr r3, [r2, #0x18]
	add r3, r3, r5
	str r4, [r3, #0x348]
	blt _0205C80C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205C850: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205C75C

	arm_func_start IsMissionSuspendedAndValid
IsMissionSuspendedAndValid: ; 0x0205C854
	stmdb sp!, {r3, lr}
	ldrb r1, [r0]
	cmp r1, #4
	movne r0, #0
	ldmneia sp!, {r3, pc}
	bl IsMissionValid
	ldmia sp!, {r3, pc}
	arm_func_end IsMissionSuspendedAndValid

	arm_func_start sub_0205C870
sub_0205C870: ; 0x0205C870
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0205C8D8
_0205C87C: ; jump table
	b _0205C898 ; case 0
	b _0205C898 ; case 1
	b _0205C898 ; case 2
	b _0205C898 ; case 3
	b _0205C898 ; case 4
	b _0205C8B4 ; case 5
	b _0205C8BC ; case 6
_0205C898:
	ldrsh r1, [r1]
	ldrsh r0, [r2]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
_0205C8B4:
	mov r0, #1
	bx lr
_0205C8BC:
	ldrsh r1, [r1]
	ldrsh r0, [r2]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
_0205C8D8:
	mov r0, #0
	bx lr
	arm_func_end sub_0205C870

	arm_func_start sub_0205C8E0
sub_0205C8E0: ; 0x0205C8E0
	ldrb ip, [r0]
	ldrb r2, [r1]
	cmp ip, r2
	movne r0, #0
	bxne lr
	cmp ip, #0
	bne _0205C910
	ldrh r3, [r0, #2]
	ldrh r2, [r1, #2]
	cmp r3, r2
	movne r0, #0
	bxne lr
_0205C910:
	cmp ip, #1
	bne _0205C92C
	ldrsh r2, [r0, #2]
	ldrsh r0, [r1, #2]
	cmp r2, r0
	movne r0, #0
	bxne lr
_0205C92C:
	mov r0, #1
	bx lr
	arm_func_end sub_0205C8E0

	arm_func_start AreMissionsEquivalent
AreMissionsEquivalent: ; 0x0205C934
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrb r1, [r5, #1]
	ldrb r0, [r4, #1]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #2]
	ldrb r0, [r4, #2]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #8]
	ldr r0, [r4, #8]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #0xe]
	ldrsh r0, [r4, #0xe]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #0x10]
	ldrsh r0, [r4, #0x10]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #0x12]
	ldrsh r0, [r4, #0x12]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r1, [r5, #0x14]
	ldrsh r0, [r4, #0x14]
	cmp r1, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0x16]
	ldrb r1, [r4, #0x16]
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r1, r5, #0x18
	add r2, r4, #0x18
	bl sub_0205C870
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r5, #0x1a
	add r1, r4, #0x1a
	bl sub_0205C8E0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AreMissionsEquivalent

	arm_func_start IsMissionValid
IsMissionValid: ; 0x0205CA40
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrb r1, [r4, #1]
	cmp r1, #0xd
	blo _0205CA6C
	cmp r1, #0xe
	beq _0205CA6C
	ldr r0, _0205CF10 ; =_020A3728
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CA6C:
	cmp r1, #7
	bne _0205CA94
	ldrb r0, [r4, #4]
	bl GetMaxItemsAllowed
	cmp r0, #0
	bne _0205CA94
	ldr r0, _0205CF14 ; =_020A373C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CA94:
	ldrb r2, [r4, #2]
	ldrb r1, [r4, #1]
	cmp r2, #0
	moveq r0, #1
	beq _0205CBC0
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	b _0205CBB0
_0205CAB4: ; jump table
	b _0205CBB0 ; case 0
	b _0205CAF0 ; case 1
	b _0205CB04 ; case 2
	b _0205CB18 ; case 3
	b _0205CB2C ; case 4
	b _0205CBB0 ; case 5
	b _0205CB40 ; case 6
	b _0205CBB0 ; case 7
	b _0205CBB0 ; case 8
	b _0205CB7C ; case 9
	b _0205CB54 ; case 10
	b _0205CB68 ; case 11
	b _0205CBB0 ; case 12
	b _0205CBB0 ; case 13
	b _0205CB90 ; case 14
_0205CAF0:
	cmp r2, #4
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB04:
	cmp r2, #2
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB18:
	cmp r2, #4
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB2C:
	cmp r2, #1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB40:
	cmp r2, #5
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB54:
	cmp r2, #8
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB68:
	cmp r2, #6
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB7C:
	cmp r2, #3
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CB90:
	cmp r2, #2
	moveq r0, #0
	beq _0205CBC0
	cmp r2, #3
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
	b _0205CBC0
_0205CBB0:
	cmp r2, #1
	movlo r0, #1
	movhs r0, #0
	and r0, r0, #0xff
_0205CBC0:
	cmp r0, #0
	bne _0205CBD8
	ldr r0, _0205CF18 ; =_020A3764
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CBD8:
	mov r0, r1
	add r1, r4, #2
	add r2, r4, #4
	bl sub_0205CF58
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0xe]
	add r1, r4, #2
	mov r3, #1
	bl sub_0205D008
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0x10]
	add r1, r4, #2
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl sub_0205E1E8
	cmp r0, #0
	ldrnesh r2, [r4, #0xe]
	ldrnesh r1, [r4, #0x10]
	cmpne r1, r2
	beq _0205CC60
	ldr r0, _0205CF1C ; =_020A377C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CC60:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	ldreqb r1, [r4, #2]
	cmpeq r1, #0
	beq _0205CC84
	cmp r0, #0xa
	ldreqb r1, [r4, #2]
	cmpeq r1, #6
	bne _0205CCA4
_0205CC84:
	ldrsh r2, [r4, #0x12]
	add r1, r4, #2
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	bne _0205CCC0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCA4:
	ldrsh r1, [r4, #0x12]
	cmp r1, #0
	beq _0205CCC0
	ldr r0, _0205CF20 ; =_020A37A0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCC0:
	ldrb r0, [r4, #1]
	ldrsh r2, [r4, #0x14]
	add r1, r4, #2
	bl sub_0205D11C
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r4, #0x16]
	cmp r1, #7
	bne _0205CCF8
	ldr r0, _0205CF24 ; =_020A37D0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CCF8:
	cmp r1, #8
	blo _0205CD10
	ldr r0, _0205CF24 ; =_020A37D0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD10:
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0205CE1C
_0205CD1C: ; jump table
	b _0205CE24 ; case 0
	b _0205CD38 ; case 1
	b _0205CD38 ; case 2
	b _0205CD38 ; case 3
	b _0205CD38 ; case 4
	b _0205CE24 ; case 5
	b _0205CD9C ; case 6
_0205CD38:
	ldrsh r1, [r4, #0x18]
	cmp r1, #0
	bne _0205CD54
	ldr r0, _0205CF28 ; =_020A37E8
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD54:
	mov r0, r1
	bl IsItemValidVeneer
	cmp r0, #0
	bne _0205CD78
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF28 ; =_020A37E8
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD78:
	ldrsh r0, [r4, #0x18]
	bl IsStorableItem
	cmp r0, #0
	bne _0205CE24
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF2C ; =_020A3808
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CD9C:
	ldrsh r1, [r4, #0xe]
	cmp r1, #0
	bne _0205CDB8
	ldr r0, _0205CF30 ; =_020A3830
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDB8:
	ldr r0, _0205CF34 ; =0x00000483
	cmp r1, r0
	blt _0205CDD4
	ldr r0, _0205CF38 ; =_020A3854
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDD4:
	ldrsh r0, [r4, #0x18]
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0205CDF8
	ldrsh r1, [r4, #0x18]
	ldr r0, _0205CF3C ; =_020A387C
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CDF8:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	beq _0205CE24
	ldrsh r0, [r4, #0x18]
	bl IsMonsterMissionAllowed
	cmp r0, #0
	bne _0205CE24
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE1C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE24:
	ldrb r1, [r4, #0x1a]
	cmp r1, #2
	blo _0205CE40
	ldr r0, _0205CF40 ; =_020A38B4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE40:
	cmp r1, #0
	bne _0205CE68
	ldrh r2, [r4, #0x1c]
	cmp r2, #0x12
	blo _0205CE68
	ldr r0, _0205CF44 ; =_020A38D0
	mov r1, r2
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE68:
	cmp r1, #1
	bne _0205CF08
	ldrsh r0, [r4, #0x1c]
	ldr r1, _0205CF34 ; =0x00000483
	cmp r0, r1
	blt _0205CE90
	ldr r0, _0205CF48 ; =_020A38F0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CE90:
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0205CEB0
	ldrsh r1, [r4, #0x1c]
	ldr r0, _0205CF4C ; =_020A3918
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CEB0:
	ldrsh r5, [r4, #0x1c]
	mov r0, r5
	bl GetBaseForm
	cmp r5, r0
	beq _0205CED8
	ldr r0, _0205CF50 ; =_020A3954
	mov r1, r5
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CED8:
	ldrb r0, [r4, #1]
	cmp r0, #0xe
	beq _0205CF08
	mov r0, r5
	bl IsMonsterMissionAllowed
	cmp r0, #0
	bne _0205CF08
	ldrsh r1, [r4, #0x1c]
	ldr r0, _0205CF54 ; =_020A3984
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205CF08:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205CF10: .word _020A3728
_0205CF14: .word _020A373C
_0205CF18: .word _020A3764
_0205CF1C: .word _020A377C
_0205CF20: .word _020A37A0
_0205CF24: .word _020A37D0
_0205CF28: .word _020A37E8
_0205CF2C: .word _020A3808
_0205CF30: .word _020A3830
_0205CF34: .word 0x00000483
_0205CF38: .word _020A3854
_0205CF3C: .word _020A387C
_0205CF40: .word _020A38B4
_0205CF44: .word _020A38D0
_0205CF48: .word _020A38F0
_0205CF4C: .word _020A3918
_0205CF50: .word _020A3954
_0205CF54: .word _020A3984
	arm_func_end IsMissionValid

	arm_func_start sub_0205CF58
sub_0205CF58: ; 0x0205CF58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	cmp r7, #6
	ldreqb r0, [r6]
	mov r5, r2
	cmpeq r0, #4
	beq _0205CFF4
	cmp r7, #0xe
	beq _0205CFF4
	ldrb r0, [r5]
	bl IsInvalidForMission
	cmp r0, #0
	beq _0205CFA4
	ldrb r1, [r5]
	ldr r0, _0205CFFC ; =_020A39C0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0205CFA4:
	ldrb r4, [r5, #1]
	ldrb r2, [r5]
	mov r0, r7
	mov r1, r6
	bl sub_02063424
	cmp r4, r0
	ble _0205CFD4
	ldr r0, _0205D000 ; =_020A39D4
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0205CFD4:
	mov r0, r5
	bl IsForbiddenFloor
	cmp r0, #0
	beq _0205CFF4
	ldr r0, _0205D004 ; =_020A39F0
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0205CFF4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205CFFC: .word _020A39C0
_0205D000: .word _020A39D4
_0205D004: .word _020A39F0
	arm_func_end sub_0205CF58

	arm_func_start sub_0205D008
sub_0205D008: ; 0x0205D008
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r3
	mov r6, r0
	mov r5, r2
	beq _0205D034
	cmp r5, #0
	bne _0205D034
	ldr r0, _0205D104 ; =_020A3A08
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0205D034:
	ldr r0, _0205D108 ; =0x00000483
	cmp r5, r0
	blt _0205D050
	ldr r0, _0205D10C ; =_020A3A24
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0205D050:
	mov r0, r5
	bl GetBaseForm
	cmp r5, r0
	beq _0205D074
	ldr r0, _0205D110 ; =_020A3A44
	mov r1, r5
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0205D074:
	mov r0, r5
	bl IsMonsterIllegalForMissions
	cmp r0, #0
	beq _0205D098
	ldr r0, _0205D114 ; =_020A3A6C
	mov r1, r5
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0205D098:
	cmp r4, #0
	beq _0205D0C4
	add r0, r6, #0xfe
	and r0, r0, #0xff
	cmp r0, #3
	bhi _0205D0C4
	mov r0, r5
	bl GetBodySize
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_0205D0C4:
	cmp r4, #0
	cmpne r6, #0xa
	cmpne r6, #0xe
	cmpne r6, #0xb
	beq _0205D0FC
	mov r0, r5
	bl IsMonsterMissionAllowed
	cmp r0, #0
	bne _0205D0FC
	ldr r0, _0205D118 ; =_020A3AA0
	mov r1, r5
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0205D0FC:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205D104: .word _020A3A08
_0205D108: .word 0x00000483
_0205D10C: .word _020A3A24
_0205D110: .word _020A3A44
_0205D114: .word _020A3A6C
_0205D118: .word _020A3AA0
	arm_func_end sub_0205D008

	arm_func_start sub_0205D11C
sub_0205D11C: ; 0x0205D11C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r2
	mov r5, r0
	bne _0205D140
	ldr r0, _0205D1E8 ; =_020A3AD4
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205D140:
	mov r0, r4
	bl IsValidTargetItem
	cmp r0, #0
	beq _0205D164
	ldr r0, _0205D1E8 ; =_020A3AD4
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205D164:
	mov r0, r4
	bl IsItemValidVeneer
	cmp r0, #0
	bne _0205D188
	ldr r0, _0205D1E8 ; =_020A3AD4
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205D188:
	mov r0, r4
	bl IsThrownItem
	cmp r0, #0
	beq _0205D1C0
	cmp r5, #4
	bne _0205D1C0
	cmp r4, #0xa
	cmpne r4, #9
	beq _0205D1C0
	ldr r0, _0205D1EC ; =_020A3AF4
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0205D1C0:
	mov r0, r4
	bl IsStorableItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _0205D1F0 ; =_020A3B18
	mov r1, r4
	bl Debug_Print0
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205D1E8: .word _020A3AD4
_0205D1EC: .word _020A3AF4
_0205D1F0: .word _020A3B18
	arm_func_end sub_0205D11C

	arm_func_start sub_0205D1F4
sub_0205D1F4: ; 0x0205D1F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMissionValid
	cmp r0, #0
	beq _0205D214
	ldrb r0, [r4]
	cmp r0, #9
	blo _0205D21C
_0205D214:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0205D21C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205D1F4

	arm_func_start GenerateMission
GenerateMission: ; 0x0205D224
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sb, r0
	add r0, sp, #0x10
	mov r8, r1
	bl GetAllPossibleMonsters
	str r0, [sp]
	cmp r0, #0
	bne _0205D258
	mov r0, r8
	bl ClearMissionData
	mov r0, #2
	b _0205DF9C
_0205D258:
	mov r0, #4
	strb r0, [r8]
	ldrb r0, [sb, #0x20]
	strb r0, [r8, #1]
	ldrb r0, [sb, #0x21]
	strb r0, [r8, #2]
	ldrh r0, [sb, #8]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0205D414
_0205D280: ; jump table
	b _0205D298 ; case 0
	b _0205D298 ; case 1
	b _0205D414 ; case 2
	b _0205D414 ; case 3
	b _0205D414 ; case 4
	b _0205D338 ; case 5
_0205D298:
	ldrh r0, [sb, #0xc]
	and r1, r0, #0xff
	strb r0, [sp, #4]
	strb r1, [sp, #5]
	ldrh r0, [sb, #8]
	cmp r0, #0
	bne _0205D2C8
	and r0, r1, #0xff
	bl CanDungeonBeUsedForMission
	cmp r0, #0
	moveq r5, #1
	beq _0205D51C
_0205D2C8:
	mov r0, r8
	bl sub_0205E258
	mov r3, r0
	add r1, sp, #4
	add r2, sp, #5
	mov r0, #1
	bl sub_02062C4C
	cmp r0, #0
	bne _0205D304
	mov r0, r8
	bl sub_0205E258
	cmp r0, #0
	movne r5, #1
	moveq r5, #2
	b _0205D51C
_0205D304:
	ldrb r0, [sb, #0x20]
	add r2, sp, #5
	add r1, sb, #0x21
	bl sub_0205CF58
	cmp r0, #0
	moveq r5, #1
	beq _0205D51C
	ldrb r0, [sp, #5]
	mov r5, #0
	strb r0, [r8, #4]
	ldrb r0, [sp, #6]
	strb r0, [r8, #5]
	b _0205D51C
_0205D338:
	add r0, sp, #0xc
	bl sub_02062814
	ldrb r1, [sb, #0x20]
	cmp r1, #3
	ldreqb r1, [sb, #0x21]
	cmpeq r1, #3
	movne r5, #1
	bne _0205D51C
	mov r1, #0xf
	bl MemAlloc
	mov r7, r0
	bl sub_0206282C
	movs r5, r0
	bne _0205D380
	mov r0, r7
	bl MemFree
	mov r5, #1
	b _0205D51C
_0205D380:
	mov r0, r8
	bl sub_0205E258
	mov r3, r0
	add r2, sp, #5
	mov r0, r5
	mov r1, r7
	bl sub_02062C4C
	mov r6, r0
	ldrb r0, [r8, #1]
	ldrb r2, [sp, #5]
	add r1, r8, #2
	bl sub_02063424
	strb r0, [sp, #6]
	add r5, sp, #5
	b _0205D3D8
_0205D3BC:
	mov r0, r5
	bl IsForbiddenFloor
	cmp r0, #0
	beq _0205D3E4
	ldrb r0, [sp, #6]
	sub r0, r0, #1
	strb r0, [sp, #6]
_0205D3D8:
	ldrb r0, [sp, #6]
	cmp r0, #0
	bne _0205D3BC
_0205D3E4:
	mov r0, r7
	bl MemFree
	cmp r6, #0
	ldrneb r0, [sp, #6]
	cmpne r0, #0
	beq _0205D518
	ldrb r0, [sp, #5]
	mov r5, #0
	strb r0, [r8, #4]
	ldrb r0, [sp, #6]
	strb r0, [r8, #5]
	b _0205D51C
_0205D414:
	ldr r0, _0205DFA4 ; =MISSION_DELIVER_LIST_PTR
	mov r5, #1
	ldr r6, [r0, #0xc]
	ldr r7, [r0, #8]
	cmp r6, #0
	moveq r5, #2
	beq _0205D51C
	mov r0, r8
	bl sub_0205E258
	mov r3, r0
	add r2, sp, #5
	mov r0, r6
	mov r1, r7
	bl sub_02062C4C
	cmp r0, #0
	bne _0205D468
	mov r0, r8
	bl sub_0205E258
	cmp r0, #0
	moveq r5, #2
	b _0205D51C
_0205D468:
	ldrb r0, [r8, #1]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0205D4F8
_0205D478: ; jump table
	b _0205D4F8 ; case 0
	b _0205D4F8 ; case 1
	b _0205D4A4 ; case 2
	b _0205D4A4 ; case 3
	b _0205D4A4 ; case 4
	b _0205D4A4 ; case 5
	b _0205D4C8 ; case 6
	b _0205D4B8 ; case 7
	b _0205D4F8 ; case 8
	b _0205D4F8 ; case 9
	b _0205D4DC ; case 10
_0205D4A4:
	ldrb r0, [sp, #5]
	bl GetMaxMembersAllowed
	cmp r0, #4
	movlt r5, #0
	b _0205D4F8
_0205D4B8:
	ldrb r0, [sp, #5]
	bl GetMaxItemsAllowed
	cmp r0, #0
	moveq r5, #0
_0205D4C8:
	add r0, sp, #5
	bl sub_02062D40
	cmp r0, #0
	moveq r5, #0
	b _0205D4F8
_0205D4DC:
	ldrb r0, [r8, #2]
	cmp r0, #4
	bne _0205D4F8
	ldrb r0, [sp, #5]
	bl GetMaxMembersAllowed
	cmp r0, #4
	movlt r5, #0
_0205D4F8:
	cmp r5, #0
	beq _0205D518
	ldrb r0, [sp, #5]
	mov r5, #0
	strb r0, [r8, #4]
	ldrb r0, [sp, #6]
	strb r0, [r8, #5]
	b _0205D51C
_0205D518:
	mov r5, #1
_0205D51C:
	cmp r5, #0
	beq _0205D534
	mov r0, r8
	bl ClearMissionData
	mov r0, r5
	b _0205DF9C
_0205D534:
	bl sub_02051134
	bic r0, r0, #0xff000000
	str r0, [r8, #8]
	mov r0, #0
	str r0, [sp, #8]
	ldrh r0, [sb, #0xe]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0205D7E4
_0205D558: ; jump table
	b _0205D56C ; case 0
	b _0205D56C ; case 1
	b _0205D62C ; case 2
	b _0205D6F8 ; case 3
	b _0205D77C ; case 4
_0205D56C:
	ldrsh r5, [sb, #0x12]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r5
	mov r3, #1
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	ldrb r0, [sb, #0x20]
	cmp r0, #0xb
	ldreqb r0, [sb, #0x21]
	cmpeq r0, #0
	bne _0205D5F0
	ldr r0, _0205DFA8 ; =0x000001EA
	cmp r5, r0
	addne r0, r0, #0x258
	cmpne r5, r0
	movne r1, #1
	moveq r1, #0
	mov r0, r5
	and r1, r1, #0xff
	bl CanMonsterBeUsedForMission
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	strh r5, [r8, #0xe]
	ldrh r0, [sb, #0x18]
	mov r4, #0
	strh r0, [r8, #0x10]
	ldrh r0, [sb, #0x1e]
	strh r0, [r8, #0x12]
	b _0205DB40
_0205D5F0:
	ldrh r0, [sb, #0xe]
	cmp r0, #0
	mov r0, r5
	bne _0205D614
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	bne _0205D624
	mov r4, #1
	b _0205DB40
_0205D614:
	bl sub_02062AD0
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
_0205D624:
	strh r5, [r8, #0xe]
	b _0205D7E4
_0205D62C:
	add r0, sp, #8
	add r1, sb, #0xe
	bl sub_0205DFAC
	movs r4, r0
	bne _0205D658
	ldr r0, [sp, #8]
	bl MemFree
	mov r0, #0
	str r0, [sp, #8]
	mov r4, #1
	b _0205DB40
_0205D658:
	bl RandInt
	mov r1, r0, lsl #1
	ldr r2, [sp, #8]
	ldrb r0, [sb, #0x20]
	ldrsh r5, [r2, r1]
	add r1, sb, #0x21
	mov r3, #1
	mov r2, r5
	bl sub_0205D008
	cmp r0, #0
	bne _0205D69C
	ldr r0, [sp, #8]
	bl MemFree
	mov r0, #0
	str r0, [sp, #8]
	mov r4, #1
	b _0205DB40
_0205D69C:
	ldrh r1, [sb, #0xe]
	ldrh r0, [sb, #0x14]
	cmp r1, r0
	ldreqh r1, [sb, #0x10]
	ldreqh r0, [sb, #0x16]
	cmpeq r1, r0
	ldreqh r1, [sb, #0x12]
	ldreqh r0, [sb, #0x18]
	cmpeq r1, r0
	beq _0205D6D8
	ldr r0, [sp, #8]
	mov r4, #0
	bl MemFree
	mov r0, r4
	str r0, [sp, #8]
_0205D6D8:
	strh r5, [r8, #0xe]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205D7E4
	ldrsh r0, [r8, #0xe]
	bl GetSecondFormIfValid
	strh r0, [r8, #0xe]
	b _0205D7E4
_0205D6F8:
	ldrh r4, [sb, #0x10]
	bl sub_020627F4
	ldrh r1, [sb, #0x12]
	add r1, r0, r1, lsl #1
	mov r0, r4
	str r1, [sp, #8]
	bl RandInt
	mov r1, r0, lsl #1
	ldr r2, [sp, #8]
	ldrb r0, [sb, #0x20]
	ldrsh r4, [r2, r1]
	add r1, sb, #0x21
	mov r3, #1
	mov r2, r4
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	mov r0, r4
	bl sub_02062AD0
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	strh r4, [r8, #0xe]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205D770
	ldrsh r0, [r8, #0xe]
	bl GetSecondFormIfValid
	strh r0, [r8, #0xe]
_0205D770:
	mov r4, #0
	str r4, [sp, #8]
	b _0205D7E4
_0205D77C:
	add r0, sp, #8
	bl GetAllPossibleMonsters
	cmp r0, #0
	moveq r4, #2
	beq _0205DB40
	bl RandIntSafe
	mov r1, r0, lsl #1
	ldr r2, [sp, #8]
	ldrb r0, [sb, #0x20]
	ldrsh r4, [r2, r1]
	add r1, sb, #0x21
	mov r3, #1
	mov r2, r4
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	strh r4, [r8, #0xe]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205D7DC
	ldrsh r0, [r8, #0xe]
	bl GetSecondFormIfValid
	strh r0, [r8, #0xe]
_0205D7DC:
	mov r4, #0
	str r4, [sp, #8]
_0205D7E4:
	mov r0, r8
	bl sub_0205E1E8
	cmp r0, #0
	beq _0205D820
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0205D80C
	bl MemFree
	mov r0, #0
	str r0, [sp, #8]
_0205D80C:
	ldrsh r0, [r8, #0xe]
	mov r4, #0
	strh r0, [r8, #0x10]
	strh r4, [r8, #0x12]
	b _0205DB40
_0205D820:
	ldrb r1, [r8, #1]
	cmp r1, #0xa
	ldreqb r0, [r8, #2]
	cmpeq r0, #6
	beq _0205D844
	cmp r1, #0xb
	ldreqb r0, [r8, #2]
	cmpeq r0, #0
	bne _0205D84C
_0205D844:
	mov sl, #2
	b _0205D858
_0205D84C:
	mov r0, #0
	strh r0, [r8, #0x12]
	mov sl, #1
_0205D858:
	mov r6, #0
	add fp, sb, #0x14
	b _0205DB34
_0205D864:
	mov r0, #6
	mul r1, r6, r0
	add r5, sb, r1
	ldrh r0, [r5, #0x14]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0205DB30
_0205D880: ; jump table
	b _0205D89C ; case 0
	b _0205D89C ; case 1
	b _0205D938 ; case 2
	b _0205DA30 ; case 3
	b _0205DAC0 ; case 4
	b _0205DB30 ; case 5
	b _0205DAC0 ; case 6
_0205D89C:
	ldrsh r7, [r5, #0x18]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r7
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	ldrb r0, [sb, #0x20]
	cmp r0, #0xa
	ldreqb r0, [sb, #0x21]
	cmpeq r0, #6
	bne _0205D8F8
	mov r0, r7
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	strneh r7, [r8, #0x10]
	ldrneh r0, [sb, #0x1e]
	moveq r4, #1
	movne r4, #0
	strneh r0, [r8, #0x12]
	b _0205DB40
_0205D8F8:
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	mov r0, r7
	bne _0205D91C
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	bne _0205D92C
	mov r4, #1
	b _0205DB40
_0205D91C:
	bl sub_02062AD0
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
_0205D92C:
	add r0, r8, r6, lsl #1
	strh r7, [r0, #0x10]
	b _0205DB30
_0205D938:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0205D970
	add r1, fp, r1
	add r0, sp, #8
	bl sub_0205DFAC
	movs r4, r0
	bne _0205D970
	ldr r0, [sp, #8]
	bl MemFree
	mov r0, #0
	str r0, [sp, #8]
	mov r4, #1
	b _0205DB40
_0205D970:
	mov r0, r4
	bl RandInt
	ldr r1, [sp, #8]
	mov r0, r0, lsl #1
	ldrsh r5, [r1, r0]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r5
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	bne _0205D9B8
	ldr r0, [sp, #8]
	bl MemFree
	mov r0, #0
	str r0, [sp, #8]
	mov r4, #1
	b _0205DB40
_0205D9B8:
	add r0, r6, #1
	cmp r0, sl
	bge _0205D9F4
	mov r0, #6
	mla r0, r6, r0, sb
	ldrh r2, [r0, #0x14]
	ldrh r1, [r0, #0x1a]
	cmp r2, r1
	ldreqh r2, [r0, #0x16]
	ldreqh r1, [r0, #0x1c]
	cmpeq r2, r1
	ldreqh r1, [r0, #0x18]
	ldreqh r0, [r0, #0x1e]
	cmpeq r1, r0
	beq _0205DA08
_0205D9F4:
	ldr r0, [sp, #8]
	mov r4, #0
	bl MemFree
	mov r0, r4
	str r0, [sp, #8]
_0205DA08:
	add r1, r8, r6, lsl #1
	strh r5, [r1, #0x10]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205DB30
	ldrsh r0, [r1, #0x10]
	bl GetSecondFormIfValid
	add r1, r8, r6, lsl #1
	strh r0, [r1, #0x10]
	b _0205DB30
_0205DA30:
	ldrh r4, [r5, #0x16]
	bl sub_020627F4
	ldrh r1, [r5, #0x18]
	add r0, r0, r1, lsl #1
	str r0, [sp, #8]
	mov r0, r4
	bl RandInt
	ldr r1, [sp, #8]
	mov r0, r0, lsl #1
	ldrsh r4, [r1, r0]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r4
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	mov r0, r4
	bl sub_02062AD0
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	add r1, r8, r6, lsl #1
	strh r4, [r1, #0x10]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205DAB0
	ldrsh r0, [r1, #0x10]
	bl GetSecondFormIfValid
	add r1, r8, r6, lsl #1
	strh r0, [r1, #0x10]
_0205DAB0:
	mov r0, #0
	str r0, [sp, #8]
	mov r4, r0
	b _0205DB30
_0205DAC0:
	add r0, sp, #8
	bl GetAllPossibleMonsters
	cmp r0, #0
	moveq r4, #2
	beq _0205DB40
	bl RandIntSafe
	ldr r1, [sp, #8]
	mov r0, r0, lsl #1
	ldrsh r5, [r1, r0]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r5
	mov r3, #0
	bl sub_0205D008
	cmp r0, #0
	moveq r4, #1
	beq _0205DB40
	add r1, r8, r6, lsl #1
	strh r5, [r1, #0x10]
	ldrb r0, [r8, #5]
	tst r0, #1
	bne _0205DB28
	ldrsh r0, [r1, #0x10]
	bl GetSecondFormIfValid
	add r1, r8, r6, lsl #1
	strh r0, [r1, #0x10]
_0205DB28:
	mov r0, #0
	str r0, [sp, #8]
_0205DB30:
	add r6, r6, #1
_0205DB34:
	cmp r6, sl
	blt _0205D864
	mov r4, #0
_0205DB40:
	cmp r4, #0
	beq _0205DB58
	mov r0, r8
	bl ClearMissionData
	mov r0, r4
	b _0205DF9C
_0205DB58:
	ldrh r0, [sb, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0205DD34
_0205DB68: ; jump table
	b _0205DB7C ; case 0
	b _0205DB7C ; case 1
	b _0205DBC4 ; case 2
	b _0205DC74 ; case 3
	b _0205DCB8 ; case 4
_0205DB7C:
	ldrsh r4, [sb, #6]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r4
	bl sub_0205D11C
	cmp r0, #0
	moveq r4, #1
	beq _0205DD38
	ldrh r0, [sb, #2]
	cmp r0, #0
	bne _0205DBBC
	mov r0, r4
	bl IsAvailableItem
	cmp r0, #0
	moveq r4, #1
	beq _0205DD38
_0205DBBC:
	strh r4, [r8, #0x14]
	b _0205DD34
_0205DBC4:
	ldrh r7, [sb, #4]
	ldrh sl, [sb, #6]
	mov r5, #0
	bl sub_02062804
	mov fp, r0
	mov r0, r7, lsl #1
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r6, r5
	add sl, fp, sl, lsl #1
	b _0205DC18
_0205DBF4:
	mov r0, r6, lsl #1
	ldrsh fp, [r0, sl]
	mov r0, fp
	bl IsAvailableItem
	cmp r0, #0
	movne r0, r5, lsl #1
	strneh fp, [r4, r0]
	addne r5, r5, #1
	add r6, r6, #1
_0205DC18:
	cmp r6, r7
	blt _0205DBF4
	cmp r5, #0
	bne _0205DC38
	mov r0, r4
	bl MemFree
	mov r4, #1
	b _0205DD38
_0205DC38:
	mov r0, r5
	bl RandIntSafe
	mov r1, r0, lsl #1
	mov r0, r4
	ldrsh r4, [r4, r1]
	bl MemFree
	ldrb r0, [sb, #0x20]
	mov r2, r4
	add r1, sb, #0x21
	bl sub_0205D11C
	cmp r0, #0
	moveq r4, #1
	beq _0205DD38
	strh r4, [r8, #0x14]
	b _0205DD34
_0205DC74:
	ldrh r5, [sb, #4]
	ldrh r4, [sb, #6]
	bl sub_02062804
	add r4, r0, r4, lsl #1
	mov r0, r5
	bl RandIntSafe
	mov r0, r0, lsl #1
	ldrsh r4, [r4, r0]
	ldrb r0, [sb, #0x20]
	add r1, sb, #0x21
	mov r2, r4
	bl sub_0205D11C
	cmp r0, #0
	moveq r4, #1
	beq _0205DD38
	strh r4, [r8, #0x14]
	b _0205DD34
_0205DCB8:
	ldr r1, _0205DFA4 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r1, #4]
	ldr r4, [r1]
	cmp r0, #0
	moveq r0, #0x46
	beq _0205DCDC
	bl RandIntSafe
	mov r0, r0, lsl #1
	ldrsh r0, [r4, r0]
_0205DCDC:
	strh r0, [r8, #0x14]
	ldrsh r0, [r8, #0x14]
	cmp r0, #0
	bne _0205DD34
	ldrb r0, [r8, #1]
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #1
	movls r4, #1
	bls _0205DD38
_0205DD04:
	ldrb r1, [r8, #1]
	add r0, r8, #4
	add r2, r8, #0x14
	bl sub_020630A4
	ldrsh r0, [r8, #0x14]
	bl IsThrownItem
	cmp r0, #0
	bne _0205DD04
	ldrsh r0, [r8, #0x14]
	bl IsStorableItem
	cmp r0, #0
	beq _0205DD04
_0205DD34:
	mov r4, #0
_0205DD38:
	cmp r4, #0
	beq _0205DD50
	mov r0, r8
	bl ClearMissionData
	mov r0, r4
	b _0205DF9C
_0205DD50:
	ldrb r0, [r8, #4]
	cmp r0, #0x26
	cmpne r0, #0x29
	beq _0205DD70
	ldrb r0, [r8, #4]
	bl GetMaxMembersAllowed
	cmp r0, #4
	bge _0205DD80
_0205DD70:
	mov r0, #0
	strb r0, [r8, #0x1a]
	strh r0, [r8, #0x1c]
	b _0205DD98
_0205DD80:
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add r2, r8, #0x1a
	bl sub_02062900
_0205DD98:
	mov r4, #0
	strb r4, [r8, #0xc]
	ldrb r0, [r8, #1]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0205DF84
_0205DDB0: ; jump table
	b _0205DF84 ; case 0
	b _0205DF84 ; case 1
	b _0205DF84 ; case 2
	b _0205DDEC ; case 3
	b _0205DF84 ; case 4
	b _0205DF84 ; case 5
	b _0205DE20 ; case 6
	b _0205DF84 ; case 7
	b _0205DF84 ; case 8
	b _0205DE7C ; case 9
	b _0205DE98 ; case 10
	b _0205DED4 ; case 11
	b _0205DF48 ; case 12
	b _0205DF84 ; case 13
	b _0205DF64 ; case 14
_0205DDEC:
	ldrb r1, [r8, #2]
	cmp r1, #1
	beq _0205DE08
	cmp r1, #2
	beq _0205DE14
	cmp r1, #3
	b _0205DF84
_0205DE08:
	bl sub_0205FF80
	strb r0, [r8, #0xc]
	b _0205DF84
_0205DE14:
	bl sub_0205FF80
	strb r0, [r8, #0xc]
	b _0205DF84
_0205DE20:
	ldrb r0, [r8, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0205DF84
_0205DE30: ; jump table
	b _0205DF84 ; case 0
	b _0205DF84 ; case 1
	b _0205DF84 ; case 2
	b _0205DF84 ; case 3
	b _0205DE44 ; case 4
_0205DE44:
	ldrb r6, [r8, #4]
	ldrb r0, [r8, #1]
	add r1, r8, #2
	mov r2, r6
	bl sub_02063424
	mov r5, r0
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl sub_0205E090
	cmp r0, #0
	movne r4, #1
	streqb r5, [r8, #5]
	b _0205DF84
_0205DE7C:
	ldrsh r0, [r8, #0x14]
	cmp r0, #0x49
	ldrnesh r1, [r8, #0xe]
	ldrnesh r0, [r8, #0x10]
	cmpne r1, r0
	moveq r4, #1
	b _0205DF84
_0205DE98:
	ldrb r1, [r8, #2]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0205DF84
_0205DEA8: ; jump table
	b _0205DF84 ; case 0
	b _0205DF84 ; case 1
	b _0205DF84 ; case 2
	b _0205DF84 ; case 3
	b _0205DF84 ; case 4
	b _0205DF84 ; case 5
	b _0205DEC8 ; case 6
	b _0205DF84 ; case 7
_0205DEC8:
	bl sub_0205FF80
	strb r0, [r8, #0xc]
	b _0205DF84
_0205DED4:
	ldrb r0, [r8, #2]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0205DF34
_0205DEE4: ; jump table
	b _0205DF34 ; case 0
	b _0205DF34 ; case 1
	b _0205DF34 ; case 2
	b _0205DF34 ; case 3
	b _0205DF34 ; case 4
	b _0205DEFC ; case 5
_0205DEFC:
	ldrb r6, [r8, #4]
	ldrb r0, [r8, #1]
	add r1, r8, #2
	mov r2, r6
	bl sub_02063424
	mov r5, r0
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl sub_0205E090
	cmp r0, #0
	movne r4, #1
	bne _0205DF84
	strb r5, [r8, #5]
_0205DF34:
	ldrb r0, [r8, #1]
	ldrb r1, [r8, #2]
	bl sub_0205FF80
	strb r0, [r8, #0xc]
	b _0205DF84
_0205DF48:
	ldrb r1, [r8, #2]
	bl sub_0205FF80
	strb r0, [r8, #0xc]
	mov r0, r4
	strb r0, [r8, #0x1a]
	strh r0, [r8, #0x1c]
	b _0205DF84
_0205DF64:
	ldrb r0, [r8, #2]
	cmp r0, #1
	beq _0205DF7C
	cmp r0, #2
	moveq r4, #1
	b _0205DF84
_0205DF7C:
	strb r4, [r8, #0x1a]
	strh r4, [r8, #0x1c]
_0205DF84:
	cmp r4, #0
	moveq r0, #0
	beq _0205DF9C
	mov r0, r8
	bl ClearMissionData
	mov r0, r4
_0205DF9C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205DFA4: .word MISSION_DELIVER_LIST_PTR
_0205DFA8: .word 0x000001EA
	arm_func_end GenerateMission

	arm_func_start sub_0205DFAC
sub_0205DFAC: ; 0x0205DFAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrh r6, [r1, #2]
	ldrh r8, [r1, #4]
	mov sl, r0
	mov r7, #0
	bl sub_020627F4
	mov r4, r0
	mov r0, r6, lsl #1
	mov r1, #0xf
	bl MemAlloc
	mov sb, r0
	mov r5, r7
	add r4, r4, r8, lsl #1
	b _0205E008
_0205DFE4:
	mov r0, r5, lsl #1
	ldrsh r8, [r0, r4]
	mov r0, r8
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	movne r0, r7, lsl #1
	strneh r8, [sb, r0]
	addne r7, r7, #1
	add r5, r5, #1
_0205E008:
	cmp r5, r6
	blt _0205DFE4
	mov r0, r7
	str sb, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0205DFAC

	arm_func_start sub_0205E01C
sub_0205E01C: ; 0x0205E01C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrb ip, [r7]
	mov r6, r1
	mov r5, r2
	cmp ip, #0
	mov r4, r3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	blt _0205E05C
	bl sub_0205E258
	cmp r0, #0
	beq _0205E070
	cmp r4, #1
	bne _0205E070
_0205E05C:
	ldrb r0, [r7, #4]
	cmp r0, r6
	bne _0205E088
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0205E070:
	ldrb r0, [r7, #4]
	cmp r0, r6
	ldreqb r0, [r7, #5]
	cmpeq r0, r5
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0205E088:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0205E01C

	arm_func_start sub_0205E090
sub_0205E090: ; 0x0205E090
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E0D4
_0205E0AC:
	ldr r0, [r7, #0x18]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E0D4:
	cmp r8, #8
	blt _0205E0AC
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E114
_0205E0E8:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x100
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E114:
	cmp r8, #8
	blt _0205E0E8
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E154
_0205E128:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x200
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E154:
	cmp r8, #8
	blt _0205E128
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E194
_0205E168:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x300
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E194:
	cmp r8, #1
	blt _0205E168
	mov r8, #0
	ldr r7, _0205E1E4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E1D4
_0205E1A8:
	ldr r0, [r7, #0x18]
	mov r1, r6
	add r0, r0, #0x320
	mov r2, r5
	mov r3, r4
	add r0, r0, r8, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	add r8, r8, #1
_0205E1D4:
	cmp r8, #1
	blt _0205E1A8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205E1E4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E090

	arm_func_start sub_0205E1E8
sub_0205E1E8: ; 0x0205E1E8
	stmdb sp!, {r3, lr}
	ldrb lr, [r0, #1]
	mov r3, #0
	mov ip, #1
	add r1, lr, #0xff
	and r2, r1, #0xff
	cmp r2, #0xd
	bhi _0205E214
	ldr r1, _0205E234 ; =0x00002383
	tst r1, ip, lsl r2
	movne ip, r3
_0205E214:
	cmp ip, #0
	beq _0205E22C
	cmp lr, #0xb
	ldreqb r0, [r0, #2]
	cmpeq r0, #0
	movne r3, #1
_0205E22C:
	and r0, r3, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205E234: .word 0x00002383
	arm_func_end sub_0205E1E8

	arm_func_start IsMissionTypeSpecialEpisode
IsMissionTypeSpecialEpisode: ; 0x0205E238
	ldrb r1, [r0, #1]
	cmp r1, #0xe
	ldreqb r0, [r0, #2]
	cmpeq r0, #2
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMissionTypeSpecialEpisode

	arm_func_start sub_0205E258
sub_0205E258: ; 0x0205E258
	ldrb r2, [r0, #1]
	mov r3, #1
	add r1, r2, #0xfe
	and r1, r1, #0xff
	cmp r1, #3
	bls _0205E280
	cmp r2, #0xa
	ldreqb r0, [r0, #2]
	cmpeq r0, #4
	movne r3, #0
_0205E280:
	and r0, r3, #0xff
	bx lr
	arm_func_end sub_0205E258

	arm_func_start sub_0205E288
sub_0205E288: ; 0x0205E288
	ldrb r3, [r0]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	ldrb r3, [r0, #1]
	cmp r3, r1
	ldreqb r1, [r0, #2]
	ldreqb r0, [r2]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0205E288

	arm_func_start sub_0205E2B8
sub_0205E2B8: ; 0x0205E2B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, #0
	ldr r6, _0205E3F4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E2F4
_0205E2D0:
	ldr r0, [r6, #0x18]
	mov r1, r5
	mov r2, r4
	add r0, r0, r7, lsl #5
	bl sub_0205E288
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r7, r7, #1
_0205E2F4:
	cmp r7, #8
	blt _0205E2D0
	mov r7, #0
	ldr r6, _0205E3F4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E330
_0205E308:
	ldr r0, [r6, #0x18]
	mov r1, r5
	add r0, r0, #0x100
	mov r2, r4
	add r0, r0, r7, lsl #5
	bl sub_0205E288
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r7, r7, #1
_0205E330:
	cmp r7, #8
	blt _0205E308
	mov r7, #0
	ldr r6, _0205E3F4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E36C
_0205E344:
	ldr r0, [r6, #0x18]
	mov r1, r5
	add r0, r0, #0x200
	mov r2, r4
	add r0, r0, r7, lsl #5
	bl sub_0205E288
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r7, r7, #1
_0205E36C:
	cmp r7, #8
	blt _0205E344
	mov r7, #0
	ldr r6, _0205E3F4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E3A8
_0205E380:
	ldr r0, [r6, #0x18]
	mov r1, r5
	add r0, r0, #0x300
	mov r2, r4
	add r0, r0, r7, lsl #5
	bl sub_0205E288
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r7, r7, #1
_0205E3A8:
	cmp r7, #1
	blt _0205E380
	mov r7, #0
	ldr r6, _0205E3F4 ; =MISSION_DELIVER_LIST_PTR
	b _0205E3E4
_0205E3BC:
	ldr r0, [r6, #0x18]
	mov r1, r5
	add r0, r0, #0x320
	mov r2, r4
	add r0, r0, r7, lsl #5
	bl sub_0205E288
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r7, r7, #1
_0205E3E4:
	cmp r7, #1
	blt _0205E3BC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205E3F4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E2B8

	arm_func_start sub_0205E3F8
sub_0205E3F8: ; 0x0205E3F8
	stmdb sp!, {r3, lr}
	mov lr, r0
	mov ip, #0
	b _0205E438
_0205E408:
	ldrb r0, [r2, ip, lsl #5]
	mov r3, ip, lsl #5
	cmp r0, #0
	bne _0205E434
	add ip, r2, r3
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r0, #0
	ldmia sp!, {r3, pc}
_0205E434:
	add ip, ip, #1
_0205E438:
	cmp ip, r1
	blt _0205E408
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_0205E3F8

	arm_func_start sub_0205E448
sub_0205E448: ; 0x0205E448
	stmdb sp!, {r4, lr}
	mov lr, #0
	mov r4, lr
	mov r2, lr
	mov r3, #1
	b _0205E47C
_0205E460:
	ldrb ip, [r1, r4, lsl #5]
	add r4, r4, #1
	cmp ip, #0
	moveq ip, r3
	movne ip, r2
	tst ip, #0xff
	addeq lr, lr, #1
_0205E47C:
	cmp r4, r0
	blt _0205E460
	mov r0, lr
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205E448

	arm_func_start sub_0205E48C
sub_0205E48C: ; 0x0205E48C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, r0
	mov r6, r1
	mov r5, r4
	b _0205E4B4
_0205E4A4:
	ldrb r0, [r6, r4, lsl #5]
	cmp r0, #0
	bne _0205E4BC
	add r4, r4, #1
_0205E4B4:
	cmp r4, r7
	blt _0205E4A4
_0205E4BC:
	cmp r4, r7
	beq _0205E4F0
	cmp r4, r5
	ble _0205E4E4
	add lr, r6, r4, lsl #5
	add ip, r6, r5, lsl #5
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
_0205E4E4:
	add r4, r4, #1
	add r5, r5, #1
	b _0205E4B4
_0205E4F0:
	mov r0, #0
	b _0205E500
_0205E4F8:
	strb r0, [r6, r5, lsl #5]
	add r5, r5, #1
_0205E500:
	cmp r5, r7
	blt _0205E4F8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0205E48C

	arm_func_start sub_0205E50C
sub_0205E50C: ; 0x0205E50C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov r8, r0
	mov r7, r1
	mov fp, r2
	mov r5, #0
	b _0205E5BC
_0205E528:
	add r6, r5, #1
	mov r4, r5, lsl #5
	b _0205E5B0
_0205E534:
	ldrb r0, [r7, r6, lsl #5]
	mov r1, r6, lsl #5
	cmp r0, #0
	beq _0205E5AC
	ldrb r0, [r7, r4]
	cmp r0, #0
	beq _0205E564
	add r0, r7, r4
	add r1, r7, r1
	blx fp
	cmp r0, #0
	beq _0205E5AC
_0205E564:
	add sb, sp, #0
	add ip, r7, r4
	mov sl, sb
	ldmia ip!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia ip, {r0, r1, r2, r3}
	stmia sb, {r0, r1, r2, r3}
	add sb, r7, r6, lsl #5
	mov ip, sb
	add lr, r7, r4
	ldmia sb!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia sb, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
_0205E5AC:
	add r6, r6, #1
_0205E5B0:
	cmp r6, r8
	blt _0205E534
	add r5, r5, #1
_0205E5BC:
	sub r0, r8, #1
	cmp r5, r0
	blt _0205E528
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0205E50C

	arm_func_start GenerateDailyMissions
GenerateDailyMissions: ; 0x0205E5D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #4
	mov r1, #8
	bl RandRangeSafe
	mov r7, r0
	mov r0, #4
	mov r1, #8
	bl RandRangeSafe
	mov r8, r0
	mov r0, #3
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, #0
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r3, r2
_0205E610:
	ldr r1, [r0, #0x18]
	strb r3, [r1, r2, lsl #5]
	add r2, r2, #1
	cmp r2, #8
	blt _0205E610
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r2, #0
_0205E62C:
	ldr r1, [r0, #0x18]
	add r1, r1, r3, lsl #5
	add r3, r3, #1
	strb r2, [r1, #0x200]
	cmp r3, #8
	blt _0205E62C
	ldr r0, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r0, #0x18]
	strb r2, [r1, #0x300]
	ldr r0, [r0, #0x18]
	strb r2, [r0, #0x320]
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl GenerateAllPossibleMonstersList
	bl GenerateAllPossibleDungeonsList
	bl GenerateAllPossibleDeliverList
	mov r0, #3
	bl sub_02062290
	cmp r0, #0
	beq _0205E70C
	mov sl, #0
	mov r6, #0x1e
	mov fp, sl
	mov r5, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E704
_0205E6A0:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x320
	add sb, r0, sl, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E6DC
	mov r1, sb
	bl GenerateMission
	cmp r0, #0
	bne _0205E6DC
	mov r0, sb
	mov r1, fp
	bl sub_0206315C
	mov r0, #0
_0205E6DC:
	cmp r0, #2
	beq _0205E70C
	cmp r0, #1
	bne _0205E6FC
	sub r6, r6, #1
	cmp r6, #0
	ble _0205E70C
	b _0205E704
_0205E6FC:
	mov r6, #0x1e
	add sl, sl, #1
_0205E704:
	cmp sl, #0
	ble _0205E6A0
_0205E70C:
	bl sub_02062548
	mov r0, #2
	bl sub_02062290
	cmp r0, #0
	beq _0205E7AC
	mov fp, #1
	mov sb, #0
	mov sl, #0x1e
	mov r5, fp
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E7A4
_0205E738:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x300
	add r6, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E77C
	mov r1, r6
	bl GenerateMission
	cmp r0, #0
	bne _0205E77C
	mov r0, r6
	mov r1, fp
	bl sub_0206315C
	mov r0, r6
	bl sub_0205EB5C
	mov r0, #0
_0205E77C:
	cmp r0, #2
	beq _0205E7AC
	cmp r0, #1
	bne _0205E79C
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E7AC
	b _0205E7A4
_0205E79C:
	mov sl, #0x1e
	add sb, sb, #1
_0205E7A4:
	cmp sb, #0
	ble _0205E738
_0205E7AC:
	bl sub_02062548
	mov r0, #0
	bl sub_02062290
	cmp r0, #0
	beq _0205E840
	mov sb, #0
	mov sl, #0x1e
	mov fp, sb
	mov r5, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E838
_0205E7D8:
	ldr r0, [r4, #0x18]
	add r6, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r5
	beq _0205E810
	mov r1, r6
	bl GenerateMission
	cmp r0, #0
	bne _0205E810
	mov r0, r6
	mov r1, fp
	bl sub_0206315C
	mov r0, #0
_0205E810:
	cmp r0, #2
	beq _0205E840
	cmp r0, #1
	bne _0205E830
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E840
	b _0205E838
_0205E830:
	mov sl, #0x1e
	add sb, sb, #1
_0205E838:
	cmp sb, r7
	ble _0205E7D8
_0205E840:
	bl sub_02062548
	mov r0, #1
	bl sub_02062290
	cmp r0, #0
	beq _0205E8DC
	mov sb, #0
	mov sl, #0x1e
	mov r5, sb
	mov fp, sb
	mov r6, #1
	ldr r4, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	b _0205E8D4
_0205E870:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x200
	add r7, r0, sb, lsl #5
	bl sub_02062578
	cmp r0, #0
	moveq r0, r6
	beq _0205E8AC
	mov r1, r7
	bl GenerateMission
	cmp r0, #0
	bne _0205E8AC
	mov r0, r7
	mov r1, r5
	bl sub_0206315C
	mov r0, fp
_0205E8AC:
	cmp r0, #2
	beq _0205E8DC
	cmp r0, #1
	bne _0205E8CC
	sub sl, sl, #1
	cmp sl, #0
	ble _0205E8DC
	b _0205E8D4
_0205E8CC:
	mov sl, #0x1e
	add sb, sb, #1
_0205E8D4:
	cmp sb, r8
	ble _0205E870
_0205E8DC:
	bl sub_02062548
	bl DeleteAllPossibleMonstersList
	bl DeleteAllPossibleDungeonsList
	bl DeleteAllPossibleDeliverList
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	mov r0, #8
	ldr r1, [r1, #0x18]
	bl sub_0205E48C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205E94C ; =sub_0205E9A8
	ldr r1, [r1, #0x18]
	bl sub_0205E50C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x200
	bl sub_0205E48C
	mov r0, #8
	ldr r1, _0205E948 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205E950 ; =sub_0205EB28
	ldr r1, [r1, #0x18]
	add r1, r1, #0x200
	bl sub_0205E50C
	bl sub_02051134
	bl sub_020634F4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205E948: .word MISSION_DELIVER_LIST_PTR
_0205E94C: .word sub_0205E9A8
_0205E950: .word sub_0205EB28
	arm_func_end GenerateDailyMissions

	arm_func_start sub_0205E954
sub_0205E954: ; 0x0205E954
	ldr r1, _0205E968 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205E96C ; =sub_0205E448
	mov r0, #8
	ldr r1, [r1, #0x18]
	bx ip
	.align 2, 0
_0205E968: .word MISSION_DELIVER_LIST_PTR
_0205E96C: .word sub_0205E448
	arm_func_end sub_0205E954

	arm_func_start sub_0205E970
sub_0205E970: ; 0x0205E970
	ldr r1, _0205E980 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205E980: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E970

	arm_func_start sub_0205E984
sub_0205E984: ; 0x0205E984
	ldr r1, _0205E9A4 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	ldrb r0, [r1, r0, lsl #5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205E9A4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205E984

	arm_func_start sub_0205E9A8
sub_0205E9A8: ; 0x0205E9A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r2, [r5, #1]
	mov r4, r1
	cmp r2, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	bne _0205E9FC
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205E9FC:
	ldrb r1, [r4, #1]
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	bne _0205EA44
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA44:
	cmp r2, #8
	cmpne r2, #5
	bne _0205EA6C
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA6C:
	cmp r1, #8
	cmpne r1, #5
	bne _0205EA94
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205EA94:
	ldrb r1, [r4, #4]
	ldrb r0, [r5, #4]
	mov r2, #1
	cmp r0, r1
	bhi _0205EAC0
	bne _0205EABC
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	bhi _0205EAC0
_0205EABC:
	mov r2, #0
_0205EAC0:
	and r0, r2, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205E9A8

	arm_func_start sub_0205EAC8
sub_0205EAC8: ; 0x0205EAC8
	ldr r1, _0205EAE0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205EAE4 ; =sub_0205E448
	ldr r1, [r1, #0x18]
	mov r0, #8
	add r1, r1, #0x200
	bx ip
	.align 2, 0
_0205EAE0: .word MISSION_DELIVER_LIST_PTR
_0205EAE4: .word sub_0205E448
	arm_func_end sub_0205EAC8

	arm_func_start sub_0205EAE8
sub_0205EAE8: ; 0x0205EAE8
	ldr r1, _0205EAFC ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x200
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205EAFC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EAE8

	arm_func_start sub_0205EB00
sub_0205EB00: ; 0x0205EB00
	ldr r1, _0205EB24 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x200]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EB24: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EB00

	arm_func_start sub_0205EB28
sub_0205EB28: ; 0x0205EB28
	ldrb r3, [r1, #4]
	ldrb r2, [r0, #4]
	mov ip, #1
	cmp r2, r3
	bhi _0205EB54
	bne _0205EB50
	ldrb r2, [r0, #5]
	ldrb r0, [r1, #5]
	cmp r2, r0
	bhi _0205EB54
_0205EB50:
	mov ip, #0
_0205EB54:
	and r0, ip, #0xff
	bx lr
	arm_func_end sub_0205EB28

	arm_func_start sub_0205EB5C
sub_0205EB5C: ; 0x0205EB5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	cmpne r0, #0xe
	bne _0205EBCC
	mov r1, #0
	add r0, sp, #0
	str r1, [sp]
	bl GetAllPossibleMonsters
	mov r5, r0
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, pc}
_0205EB90:
	mov r0, r5
	bl RandInt
	ldrb r1, [r4, #1]
	ldr r2, [sp]
	mov r0, r0, lsl #1
	cmp r1, #0xb
	ldrsh r0, [r2, r0]
	ldreqsh r1, [r4, #0xe]
	cmpeq r1, r0
	bne _0205EBC4
	cmp r5, #1
	ldmleia sp!, {r3, r4, r5, pc}
	b _0205EB90
_0205EBC4:
	bl sub_02065B94
	ldmia sp!, {r3, r4, r5, pc}
_0205EBCC:
	ldrsh r0, [r4, #0xe]
	bl sub_02065B94
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205EB5C

	arm_func_start sub_0205EBD8
sub_0205EBD8: ; 0x0205EBD8
	ldr r1, _0205EBEC ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x300
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205EBEC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EBD8

	arm_func_start sub_0205EBF0
sub_0205EBF0: ; 0x0205EBF0
	ldr r1, _0205EC14 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x300]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EC14: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EBF0

	arm_func_start sub_0205EC18
sub_0205EC18: ; 0x0205EC18
	ldr r1, _0205EC30 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205EC34 ; =ClearMissionData
	ldr r1, [r1, #0x18]
	add r1, r1, #0x300
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_0205EC30: .word MISSION_DELIVER_LIST_PTR
_0205EC34: .word ClearMissionData
	arm_func_end sub_0205EC18

	arm_func_start sub_0205EC38
sub_0205EC38: ; 0x0205EC38
	ldr r1, _0205EC4C ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x320
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205EC4C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EC38

	arm_func_start sub_0205EC50
sub_0205EC50: ; 0x0205EC50
	ldr r1, _0205EC74 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x320]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205EC74: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205EC50

	arm_func_start sub_0205EC78
sub_0205EC78: ; 0x0205EC78
	ldr r1, _0205EC90 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205EC94 ; =ClearMissionData
	ldr r1, [r1, #0x18]
	add r1, r1, #0x320
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_0205EC90: .word MISSION_DELIVER_LIST_PTR
_0205EC94: .word ClearMissionData
	arm_func_end sub_0205EC78

	arm_func_start AlreadyHaveMission
AlreadyHaveMission: ; 0x0205EC98
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	ldr r4, _0205ECF0 ; =MISSION_DELIVER_LIST_PTR
	b _0205ECE0
_0205ECAC:
	ldr r0, [r4, #0x18]
	mov r1, r5, lsl #5
	add r2, r0, #0x100
	ldrb r0, [r2, r5, lsl #5]
	cmp r0, #0
	beq _0205ECDC
	mov r0, r6
	add r1, r2, r1
	bl AreMissionsEquivalent
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
_0205ECDC:
	add r5, r5, #1
_0205ECE0:
	cmp r5, #8
	blt _0205ECAC
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205ECF0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end AlreadyHaveMission

	arm_func_start sub_0205ECF4
sub_0205ECF4: ; 0x0205ECF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldrb r5, [r4, #4]
	ldrb r6, [r4, #5]
	mov r7, #0
	bl IsMissionSuspendedAndValid
	cmp r0, #0
	moveq r0, r7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl sub_0205E258
	cmp r0, #0
	movne r7, #1
	mov r4, #0
	ldr r8, _0205ED80 ; =MISSION_DELIVER_LIST_PTR
	b _0205ED70
_0205ED34:
	ldr r1, [r8, #0x18]
	add r0, r1, r4, lsl #5
	ldrb r0, [r0, #0x100]
	cmp r0, #5
	bne _0205ED6C
	add r0, r1, #0x100
	mov r1, r5
	mov r2, r6
	mov r3, r7
	add r0, r0, r4, lsl #5
	bl sub_0205E01C
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0205ED6C:
	add r4, r4, #1
_0205ED70:
	cmp r4, #8
	blt _0205ED34
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205ED80: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205ECF4

	arm_func_start CountJobListMissions
CountJobListMissions: ; 0x0205ED84
	ldr r1, _0205ED9C ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205EDA0 ; =sub_0205E448
	ldr r1, [r1, #0x18]
	mov r0, #8
	add r1, r1, #0x100
	bx ip
	.align 2, 0
_0205ED9C: .word MISSION_DELIVER_LIST_PTR
_0205EDA0: .word sub_0205E448
	arm_func_end CountJobListMissions

	arm_func_start DungeonRequestsDone
DungeonRequestsDone: ; 0x0205EDA4
	stmdb sp!, {r4, lr}
	ldr r2, _0205EE0C ; =MISSION_DELIVER_LIST_PTR
	mov ip, #0
	ldr r2, [r2, #0x18]
	mov lr, ip
	add r3, r2, #0x100
_0205EDBC:
	mov r2, lr, lsl #0x18
	add r4, r3, r2, asr #19
	ldrb r2, [r4, #4]
	cmp r2, r0
	bne _0205EDF8
	cmp r1, #0
	beq _0205EDE4
	ldrb r2, [r4, #1]
	cmp r2, #0xc
	beq _0205EDF8
_0205EDE4:
	ldrb r2, [r4]
	add r2, r2, #0xfb
	and r2, r2, #0xff
	cmp r2, #3
	addls ip, ip, #1
_0205EDF8:
	add lr, lr, #1
	cmp lr, #8
	blt _0205EDBC
	mov r0, ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205EE0C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DungeonRequestsDone

	arm_func_start DungeonRequestsDoneWrapper
DungeonRequestsDoneWrapper: ; 0x0205EE10
	ldr ip, _0205EE1C ; =DungeonRequestsDone
	mov r1, #0
	bx ip
	.align 2, 0
_0205EE1C: .word DungeonRequestsDone
	arm_func_end DungeonRequestsDoneWrapper

	arm_func_start AnyDungeonRequestsDone
AnyDungeonRequestsDone: ; 0x0205EE20
	stmdb sp!, {r3, lr}
	mov r1, #1
	bl DungeonRequestsDone
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end AnyDungeonRequestsDone

	arm_func_start sub_0205EE40
sub_0205EE40: ; 0x0205EE40
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	str r0, [sp]
	mov sl, r1
	mov sb, r2
	bl GetMaxMembersAllowed
	cmp r0, #1
	bne _0205EE80
	bl sub_020568A4
	strh r0, [sp, #4]
	ldrsh r0, [sp, #4]
	cmp r0, #0
	movlt r0, #1
	blt _0205EFFC
	mov r4, #1
	b _0205EE98
_0205EE80:
	add r0, sp, #4
	bl GetPartyMembers
	mov r4, r0
	cmp r4, #1
	movlt r0, #1
	blt _0205EFFC
_0205EE98:
	mov r5, #0
	strh r5, [sl]
	strh r5, [sb]
_0205EEA4:
	ldr r1, _0205F004 ; =MISSION_DELIVER_LIST_PTR
	mov r0, r5, lsl #0x18
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r2, r1, r0, asr #19
	ldrb r1, [r2, #4]
	ldr r0, [sp]
	cmp r1, r0
	ldreqb r0, [r2]
	cmpeq r0, #5
	bne _0205EFD8
	ldrb r0, [r2, #0x1a]
	cmp r0, #0
	bne _0205EF54
	ldrh r8, [r2, #0x1c]
	cmp r8, #0
	beq _0205EFD8
	mov r6, #0
	add fp, sp, #4
	b _0205EF40
_0205EEF4:
	mov r0, r6, lsl #1
	ldrsh r2, [fp, r0]
	ldr r0, _0205F008 ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0
	ldr r3, [r0]
	mov r0, #0x44
	smlabb r7, r2, r0, r3
	ldrsh r0, [r7, #4]
	bl GetType
	cmp r8, r0
	beq _0205EF34
	ldrsh r0, [r7, #4]
	mov r1, #1
	bl GetType
	cmp r8, r0
	bne _0205EF3C
_0205EF34:
	mov r8, #0
	b _0205EF48
_0205EF3C:
	add r6, r6, #1
_0205EF40:
	cmp r6, r4
	blt _0205EEF4
_0205EF48:
	cmp r8, #0
	strneh r8, [sl]
	b _0205EFD8
_0205EF54:
	cmp r0, #1
	bne _0205EFD8
	ldrsh r6, [r2, #0x1c]
	mov r0, r6
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	mov r7, r0
	bl FemaleToMaleForm
	mov fp, r0
	mov r0, r7
	bl GetSecondFormIfValid
	mov r7, r0
	cmp r6, #0
	beq _0205EFD8
	mov r8, #0
	b _0205EFC8
_0205EF90:
	mov r1, r8, lsl #1
	add r0, sp, #4
	ldrsh r1, [r0, r1]
	ldr r0, _0205F008 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	mov r0, #0x44
	smlabb r0, r1, r0, r2
	ldrsh r0, [r0, #4]
	bl GetBaseFormBurmyWormadamShellosGastrodonCherrim
	cmp r0, fp
	cmpne r0, r7
	moveq r6, #0
	beq _0205EFD0
	add r8, r8, #1
_0205EFC8:
	cmp r8, r4
	blt _0205EF90
_0205EFD0:
	cmp r6, #0
	strneh r6, [sb]
_0205EFD8:
	add r5, r5, #1
	cmp r5, #8
	blt _0205EEA4
	ldrh r0, [sl]
	cmp r0, #0
	ldreqsh r0, [sb]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
_0205EFFC:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0205F004: .word MISSION_DELIVER_LIST_PTR
_0205F008: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end sub_0205EE40

	arm_func_start sub_0205F00C
sub_0205F00C: ; 0x0205F00C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0205F0B4 ; =MISSION_DELIVER_LIST_PTR
	mov ip, #0
	ldr r2, [r2, #0x18]
	add r3, r2, #0x100
	b _0205F0A0
_0205F028:
	mov r2, ip, lsl #0x18
	add r4, r3, r2, asr #19
	ldrb r2, [r4, #4]
	cmp r2, r0
	ldreqb r2, [r4]
	cmpeq r2, #5
	bne _0205F09C
	ldrb r2, [r4, #1]
	cmp r2, #2
	cmpne r2, #3
	cmpne r2, #4
	cmpne r2, #5
	beq _0205F06C
	cmp r2, #0xa
	ldreqb r2, [r4, #2]
	cmpeq r2, #4
	bne _0205F09C
_0205F06C:
	mov r2, #0xfa
	mov r0, #1
	strb r2, [sp, #4]
	strb r0, [sp, #5]
	mov r2, #0
	str r2, [sp]
	mov r0, r1
	ldrsh r1, [r4, #0xe]
	add r3, sp, #4
	bl sub_02052E2C
	mov r0, r4
	b _0205F0AC
_0205F09C:
	add ip, ip, #1
_0205F0A0:
	cmp ip, #8
	blt _0205F028
	mov r0, #0
_0205F0AC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205F0B4: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F00C

	arm_func_start AddMissionToJobList
AddMissionToJobList: ; 0x0205F0B8
	ldr r2, _0205F0D0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F0D4 ; =sub_0205E3F8
	ldr r2, [r2, #0x18]
	mov r1, #8
	add r2, r2, #0x100
	bx ip
	.align 2, 0
_0205F0D0: .word MISSION_DELIVER_LIST_PTR
_0205F0D4: .word sub_0205E3F8
	arm_func_end AddMissionToJobList

	arm_func_start GetAcceptedMission
GetAcceptedMission: ; 0x0205F0D8
	ldr r1, _0205F0EC ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r0, r1, r0, lsl #5
	bx lr
	.align 2, 0
_0205F0EC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetAcceptedMission

	arm_func_start sub_0205F0F0
sub_0205F0F0: ; 0x0205F0F0
	ldr r1, _0205F114 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	add r0, r1, r0, lsl #5
	ldrb r0, [r0, #0x100]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0205F114: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F0F0

	arm_func_start sub_0205F118
sub_0205F118: ; 0x0205F118
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r3, #0
	mov r5, r1
	strb r3, [r6]
	ldrsh r0, [r5, #0xe]
	mov r4, r2
	strh r0, [r6, #2]
	strh r3, [r6, #4]
	ldrb r0, [r5, #1]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _0205F29C
_0205F14C: ; jump table
	b _0205F204 ; case 0
	b _0205F218 ; case 1
	b _0205F218 ; case 2
	b _0205F204 ; case 3
	b _0205F1DC ; case 4
	b _0205F204 ; case 5
	b _0205F180 ; case 6
	b _0205F204 ; case 7
	b _0205F218 ; case 8
	b _0205F234 ; case 9
	b _0205F218 ; case 10
	b _0205F260 ; case 11
	b _0205F27C ; case 12
_0205F180:
	ldrb r0, [r5, #2]
	cmp r0, #4
	ldrb r0, [r5]
	bne _0205F1B8
	add r0, r0, #0xfb
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F1B8:
	cmp r0, #5
	cmpne r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F1DC:
	ldrb r0, [r5]
	cmp r0, #5
	cmpne r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F204:
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F218:
	ldrsh r0, [r5, #0x10]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F234:
	ldrsh r0, [r5, #0x10]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
	b _0205F29C
_0205F260:
	ldrsh r0, [r5, #0xe]
	strh r0, [r6, #4]
	ldrb r0, [r5]
	cmp r0, #8
	moveq r0, #1
	streqb r0, [r6]
	b _0205F29C
_0205F27C:
	ldrb r0, [r5]
	cmp r0, #8
#ifdef JAPAN
	moveq r0, #1
	streqb r0, [r6]
#else
	bne _0205F29C
	ldrsh r0, [r5, #0x14]
	bl IsItemInTreasureBoxes
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6]
#endif
_0205F29C:
	cmp r4, #0xff
	ldrneb r0, [r5, #4]
	cmpne r0, r4
	movne r0, #0
	strneb r0, [r6]
	ldrb r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0205F118

	arm_func_start sub_0205F2B8
sub_0205F2B8: ; 0x0205F2B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_0205F2D0: ; jump table
	ldmia sp!, {r4, pc} ; case 0
	ldmia sp!, {r4, pc} ; case 1
	ldmia sp!, {r4, pc} ; case 2
	ldmia sp!, {r4, pc} ; case 3
	b _0205F360 ; case 4
	ldmia sp!, {r4, pc} ; case 5
	b _0205F304 ; case 6
	ldmia sp!, {r4, pc} ; case 7
	ldmia sp!, {r4, pc} ; case 8
	b _0205F388 ; case 9
	ldmia sp!, {r4, pc} ; case 10
	ldmia sp!, {r4, pc} ; case 11
	ldmia sp!, {r4, pc} ; case 12
_0205F304:
	ldrb r0, [r4, #2]
	cmp r0, #4
	ldrb r0, [r4]
	bne _0205F33C
	add r0, r0, #0xfb
	and r0, r0, #0xff
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F33C:
	cmp r0, #5
	cmpne r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F360:
	ldrb r0, [r4]
	cmp r0, #5
	cmpne r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl IsItemInBag
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
_0205F388:
	ldrb r0, [r4]
	cmp r0, #8
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x14]
	bl RemoveFirstUnequippedItemOfType
	cmp r0, #0
	movne r0, #8
	strneb r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0205F2B8

	arm_func_start GetMissionByTypeAndDungeon
GetMissionByTypeAndDungeon: ; 0x0205F3AC
	stmdb sp!, {r4, lr}
	ldr ip, _0205F460 ; =MISSION_DELIVER_LIST_PTR
	ldr r4, [ip, #0x18]
	add r4, r4, #0x100
	b _0205F450
_0205F3C0:
	mov ip, r0, lsl #0x18
	add lr, r4, ip, asr #19
	cmp r3, #0xff
	ldrneb ip, [lr, #4]
	cmpne ip, r3
	bne _0205F44C
	ldrb ip, [lr, #1]
	cmp ip, r1
	bne _0205F44C
	cmp ip, #0xc
	addls pc, pc, ip, lsl #2
	b _0205F44C
_0205F3F0: ; jump table
	b _0205F440 ; case 0
	b _0205F440 ; case 1
	b _0205F440 ; case 2
	b _0205F440 ; case 3
	b _0205F440 ; case 4
	b _0205F440 ; case 5
	b _0205F424 ; case 6
	b _0205F440 ; case 7
	b _0205F440 ; case 8
	b _0205F424 ; case 9
	b _0205F424 ; case 10
	b _0205F424 ; case 11
	b _0205F424 ; case 12
_0205F424:
	ldrb lr, [lr, #2]
	ldrb ip, [r2]
	cmp lr, ip
	bne _0205F44C
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0205F440:
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	ldmia sp!, {r4, pc}
_0205F44C:
	add r0, r0, #1
_0205F450:
	cmp r0, #8
	blt _0205F3C0
	mvn r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205F460: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetMissionByTypeAndDungeon

	arm_func_start sub_0205F464
sub_0205F464: ; 0x0205F464
	stmdb sp!, {r3, lr}
	mov ip, r1
	mov r3, r2
	mov r1, r0
	mov r2, ip
	mov r0, #0
	bl GetMissionByTypeAndDungeon
	cmp r0, #0
	ldrge r1, _0205F4A0 ; =MISSION_DELIVER_LIST_PTR
	movlt r0, #0
	ldrge r1, [r1, #0x18]
	movge r0, r0, lsl #0x18
	addge r1, r1, #0x100
	addge r0, r1, r0, asr #19
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F4A0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F464

	arm_func_start CheckAcceptedMissionByTypeAndDungeon
CheckAcceptedMissionByTypeAndDungeon: ; 0x0205F4A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r7, _0205F500 ; =MISSION_DELIVER_LIST_PTR
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0
_0205F4BC:
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl GetMissionByTypeAndDungeon
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, [r7, #0x18]
	mov r1, r0, lsl #0x18
	add r2, r2, #0x100
	mov r1, r1, asr #0x18
	ldrb r1, [r2, r1, lsl #5]
	add r0, r0, #1
	cmp r1, #5
	bne _0205F4BC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0205F500: .word MISSION_DELIVER_LIST_PTR
	arm_func_end CheckAcceptedMissionByTypeAndDungeon

	arm_func_start sub_0205F504
sub_0205F504: ; 0x0205F504
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	mov r4, #0
	ldr r0, [r5, #0x18]
	add r6, r0, #0x100
_0205F518:
	ldrb r0, [r6]
	cmp r0, #6
	cmpne r0, #7
	cmpne r0, #8
	bne _0205F540
	ldr r1, [r5, #0x18]
	mov r0, r4, lsl #0x18
	add r1, r1, #0x100
	add r0, r1, r0, asr #19
	bl ClearMissionData
_0205F540:
	add r4, r4, #1
	cmp r4, #8
	add r6, r6, #0x20
	blt _0205F518
	ldr r1, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	mov r0, #8
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	bl sub_0205E48C
	ldr r0, _0205F580 ; =MISSION_DELIVER_LIST_PTR
	ldr r2, _0205F584 ; =sub_0205F5C8
	ldr r1, [r0, #0x18]
	mov r0, #8
	add r1, r1, #0x100
	bl sub_0205E50C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205F580: .word MISSION_DELIVER_LIST_PTR
_0205F584: .word sub_0205F5C8
	arm_func_end sub_0205F504

	arm_func_start sub_0205F588
sub_0205F588: ; 0x0205F588
	ldr r1, _0205F5A0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F5A4 ; =ClearMissionData
	ldr r1, [r1, #0x18]
	add r1, r1, #0x100
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_0205F5A0: .word MISSION_DELIVER_LIST_PTR
_0205F5A4: .word ClearMissionData
	arm_func_end sub_0205F588

	arm_func_start sub_0205F5A8
sub_0205F5A8: ; 0x0205F5A8
	ldr r1, _0205F5C0 ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F5C4 ; =sub_0205E48C
	ldr r1, [r1, #0x18]
	mov r0, #8
	add r1, r1, #0x100
	bx ip
	.align 2, 0
_0205F5C0: .word MISSION_DELIVER_LIST_PTR
_0205F5C4: .word sub_0205E48C
	arm_func_end sub_0205F5A8

	arm_func_start sub_0205F5C8
sub_0205F5C8: ; 0x0205F5C8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r2, [r5, #1]
	mov r4, r1
	cmp r2, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	beq _0205F5F8
	cmp r2, #6
	ldreqb r0, [r5, #2]
	cmpeq r0, #4
	bne _0205F62C
_0205F5F8:
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F62C:
	ldrb r1, [r4, #1]
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	beq _0205F650
	cmp r1, #6
	ldreqb r0, [r4, #2]
	cmpeq r0, #4
	bne _0205F684
_0205F650:
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F684:
	cmp r2, #8
	cmpne r2, #5
	cmpne r2, #0xe
	bne _0205F6B0
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F6B0:
	cmp r1, #8
	cmpne r1, #5
	cmpne r1, #0xe
	bne _0205F6DC
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	movhi r0, #1
	movls r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_0205F6DC:
	ldrb r1, [r4, #4]
	ldrb r0, [r5, #4]
	mov r2, #1
	cmp r0, r1
	bhi _0205F708
	bne _0205F704
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	bhi _0205F708
_0205F704:
	mov r2, #0
_0205F708:
	and r0, r2, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205F5C8

	arm_func_start sub_0205F710
sub_0205F710: ; 0x0205F710
	ldr r0, _0205F72C ; =MISSION_DELIVER_LIST_PTR
	ldr ip, _0205F730 ; =sub_0205E50C
	ldr r1, [r0, #0x18]
	ldr r2, _0205F734 ; =sub_0205F5C8
	mov r0, #8
	add r1, r1, #0x100
	bx ip
	.align 2, 0
_0205F72C: .word MISSION_DELIVER_LIST_PTR
_0205F730: .word sub_0205E50C
_0205F734: .word sub_0205F5C8
	arm_func_end sub_0205F710

	arm_func_start GetAllPossibleMonsters
GetAllPossibleMonsters: ; 0x0205F738
	cmp r0, #0
	ldrne r1, _0205F754 ; =MISSION_DELIVER_LIST_PTR
	ldrne r1, [r1, #0x10]
	strne r1, [r0]
	ldr r0, _0205F754 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0205F754: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GetAllPossibleMonsters

	arm_func_start GenerateAllPossibleMonstersList
GenerateAllPossibleMonstersList: ; 0x0205F758
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0x430
	mov r1, #0xf
	bl MemAlloc
	mov r5, r0
	mov r4, #0
	mov r6, #1
_0205F774:
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	bl CanMonsterBeUsedForMissionWrapper
	cmp r0, #0
	movne r0, r4, lsl #1
	strneh r6, [r5, r0]
	add r6, r6, #1
	addne r4, r4, #1
	cmp r6, #0x218
	blt _0205F774
	cmp r4, #0
	ldrne r0, _0205F7C0 ; =MISSION_DELIVER_LIST_PTR
	strne r5, [r0, #0x10]
	strne r4, [r0, #0x14]
	bne _0205F7B8
	mov r0, r5
	bl MemFree
_0205F7B8:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205F7C0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleMonstersList

	arm_func_start DeleteAllPossibleMonstersList
DeleteAllPossibleMonstersList: ; 0x0205F7C4
	stmdb sp!, {r3, lr}
	ldr r0, _0205F7F0 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F7F0 ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F7F0: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleMonstersList

	arm_func_start GenerateAllPossibleDungeonsList
GenerateAllPossibleDungeonsList: ; 0x0205F7F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xb4
	mov r0, #0xb4
	mov r1, #0xf
	bl MemAlloc
	mov r5, #0
	mov r4, r0
	mov r1, r5
	mov r8, r5
	add r0, sp, #0
_0205F81C:
	strb r8, [r0, r1]
	add r1, r1, #1
	cmp r1, #0xb4
	blt _0205F81C
	mov r7, #1
	add r6, sp, #0
_0205F834:
	and r0, r8, #0xff
	bl CanDungeonBeUsedForMission
	cmp r0, #0
	strneb r7, [r6, r8]
	add r8, r8, #1
	cmp r8, #0xb4
	blt _0205F834
	mov r2, #0
	add r1, sp, #0
_0205F858:
	ldrb r0, [r1, r2]
	cmp r0, #0
	strneb r2, [r4, r5]
	add r2, r2, #1
	addne r5, r5, #1
	cmp r2, #0xb4
	blt _0205F858
	cmp r5, #0
	ldrne r0, _0205F89C ; =MISSION_DELIVER_LIST_PTR
	strne r4, [r0, #8]
	strne r5, [r0, #0xc]
	bne _0205F890
	mov r0, r4
	bl MemFree
_0205F890:
	mov r0, r5
	add sp, sp, #0xb4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205F89C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleDungeonsList

	arm_func_start DeleteAllPossibleDungeonsList
DeleteAllPossibleDungeonsList: ; 0x0205F8A0
	stmdb sp!, {r3, lr}
	ldr r0, _0205F8CC ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F8CC ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F8CC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleDungeonsList

	arm_func_start GenerateAllPossibleDeliverList
GenerateAllPossibleDeliverList: ; 0x0205F8D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x2d8
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	bl GetAvailableItemDeliveryList
	movs r5, r0
	ldrne r0, _0205F908 ; =MISSION_DELIVER_LIST_PTR
	stmneia r0, {r4, r5}
	bne _0205F900
	mov r0, r4
	bl MemFree
_0205F900:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205F908: .word MISSION_DELIVER_LIST_PTR
	arm_func_end GenerateAllPossibleDeliverList

	arm_func_start DeleteAllPossibleDeliverList
DeleteAllPossibleDeliverList: ; 0x0205F90C
	stmdb sp!, {r3, lr}
	ldr r0, _0205F938 ; =MISSION_DELIVER_LIST_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0205F938 ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205F938: .word MISSION_DELIVER_LIST_PTR
	arm_func_end DeleteAllPossibleDeliverList

	arm_func_start sub_0205F93C
sub_0205F93C: ; 0x0205F93C
	ldrb r2, [r0, #2]
	ldrb r1, [r0, #1]
	mov r3, #0
	add r3, r3, r2, lsl #11
	add r3, r3, r1
	ldrb r2, [r0, #4]
	ldrb r1, [r0, #5]
	add r2, r3, r2
	add ip, r2, r1
	ldr r3, [r0, #8]
	ldrb r2, [r0, #0xc]
	add ip, ip, r3, lsl #8
	ldrsh r3, [r0, #0xe]
	add ip, ip, r2, lsl #13
	ldrb r1, [r0, #0x16]
	add ip, ip, r3, lsl #12
	ldrsh r2, [r0, #0x10]
	ldrsh r3, [r0, #0x12]
	cmp r1, #5
	add ip, ip, r2, lsl #16
	ldrsh r2, [r0, #0x14]
	add r3, ip, r3, lsl #4
	add r2, r3, r2, lsl #24
	add r2, r2, r1, lsl #2
	ldrneh r1, [r0, #0x18]
	addne r2, r2, r1, lsl #1
	ldrb r1, [r0, #0x1a]
	ldrh r0, [r0, #0x1c]
	add r1, r2, r1, lsl #21
	add r0, r1, r0, lsl #22
	bx lr
	arm_func_end sub_0205F93C

	arm_func_start ClearMissionData
ClearMissionData: ; 0x0205F9B8
	mov r2, #0
	strb r2, [r0]
	mov r1, #0xff
	strb r1, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #0x16]
	bx lr
	arm_func_end ClearMissionData

	arm_func_start sub_0205F9D4
sub_0205F9D4: ; 0x0205F9D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0205FA34 ; =MISSION_DELIVER_LIST_PTR
	mov r5, r0
	ldr r4, [r1, #0x18]
	mov lr, #0xf
	mov r3, #0xc
_0205F9EC:
	mla r1, lr, r3, r4
	add r0, r1, #0x334
	sub lr, lr, #1
	add ip, r1, #0x340
	ldmia r0, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	cmp lr, #0
	bgt _0205F9EC
	ldr r2, [r5, #4]
	ldr r1, [r5, #8]
	mov r0, r5
	str r2, [r4, #0x340]
	str r1, [r4, #0x344]
	bl sub_0205F93C
	ldr r1, _0205FA34 ; =MISSION_DELIVER_LIST_PTR
	ldr r1, [r1, #0x18]
	str r0, [r1, #0x348]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205FA34: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205F9D4

	arm_func_start sub_0205FA38
sub_0205FA38: ; 0x0205FA38
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_0205F93C
	ldr r2, _0205FAAC ; =MISSION_DELIVER_LIST_PTR
	mov r1, #0
	ldr r2, [r2, #0x18]
	add r5, r2, #0x340
	mov r2, #0xc
	b _0205FA9C
_0205FA5C:
	mul lr, r1, r2
	ldrb ip, [r5, lr]
	ldrb r3, [r4, #4]
	add lr, r5, lr
	cmp ip, r3
	ldreqb ip, [lr, #1]
	ldreqb r3, [r4, #5]
	cmpeq ip, r3
	ldreq ip, [lr, #4]
	ldreq r3, [r4, #8]
	cmpeq ip, r3
	ldreq r3, [lr, #8]
	cmpeq r3, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r1, r1, #1
_0205FA9C:
	cmp r1, #0x10
	blt _0205FA5C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0205FAAC: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FA38

	arm_func_start sub_0205FAB0
sub_0205FAB0: ; 0x0205FAB0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FADC:
	ldr r1, [r4, #0x18]
	mov r0, r6
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FADC
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FB0C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x100
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FB0C
	mov r7, #0
	ldr r4, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FB40:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x200
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FD88
	add r7, r7, #1
	cmp r7, #8
	blt _0205FB40
	ldr r1, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x300
	bl sub_0205FD88
	ldr r1, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x320
	bl sub_0205FD88
	ldr sl, _0205FC1C ; =MISSION_DELIVER_LIST_PTR
	mov r8, #0
	add r6, sp, #0
	mov r5, #0x20
	mov r4, #0x18
	mov sb, #0xc
_0205FBAC:
	mul r7, r8, sb
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x348
	mov r2, r5
	add r1, r1, r7
	bl CopyBitsFrom
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x344
	mov r2, r4
	add r1, r1, r7
	bl CopyBitsFrom
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x340
	add r1, r1, r7
	bl Copy16BitsFrom
	add r8, r8, #1
	cmp r8, #0x10
	blt _0205FBAC
	add r0, sp, #0
	bl sub_020509BC
	bl Rand16Bit
	bl sub_020634F4
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205FC1C: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FAB0

	arm_func_start sub_0205FC20
sub_0205FC20: ; 0x0205FC20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FC4C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FC4C
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FC7C:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x100
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FC7C
	mov r7, #0
	ldr r4, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r6, sp, #0
	mov r5, r7
_0205FCB0:
	ldr r1, [r4, #0x18]
	mov r0, r6
	add r1, r1, #0x200
	mov r2, r5
	add r1, r1, r7, lsl #5
	bl sub_0205FE80
	add r7, r7, #1
	cmp r7, #8
	blt _0205FCB0
	ldr r1, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x300
	bl sub_0205FE80
	ldr r1, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	mov r2, #0
	add r1, r1, #0x320
	bl sub_0205FE80
	ldr sl, _0205FD84 ; =MISSION_DELIVER_LIST_PTR
	mov r8, #0
	add r6, sp, #0
	mov r5, #0x20
	mov r4, #0x18
	mov sb, #0xc
_0205FD1C:
	mul r7, r8, sb
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x348
	mov r2, r5
	add r1, r1, r7
	bl CopyBitsTo
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x344
	mov r2, r4
	add r1, r1, r7
	bl CopyBitsTo
	ldr r1, [sl, #0x18]
	mov r0, r6
	add r1, r1, #0x340
	add r1, r1, r7
	bl sub_020515C4
	add r8, r8, #1
	cmp r8, #0x10
	blt _0205FD1C
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205FD84: .word MISSION_DELIVER_LIST_PTR
	arm_func_end sub_0205FC20

	arm_func_start sub_0205FD88
sub_0205FD88: ; 0x0205FD88
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x12
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x16
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #0x18
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, sp, #0
	mov r2, #1
	bl CopyBitsFrom
	ldrb r0, [sp]
	add r1, r4, #0x1c
	mov r2, #0xb
	cmp r0, #0
	movne r3, #1
	moveq r3, #0
	mov r0, r5
	strb r3, [r4, #0x1a]
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	bl Copy16BitsFrom
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205FD88

	arm_func_start sub_0205FE80
sub_0205FE80: ; 0x0205FE80
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #0xff
	mov r3, #0
	mov r5, r0
	mov r4, r1
	mov r2, #4
	strb ip, [sp, #1]
	strb r3, [sp]
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0xe
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x10
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x12
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x14
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x16
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x18
	mov r2, #0xb
	bl CopyBitsTo
	ldrb r0, [r4, #0x1a]
	mov r2, #1
	cmp r0, #1
	addeq r1, sp, #1
	addne r1, sp, #0
	mov r0, r5
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #0x1c
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #8
	mov r2, #0x18
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	bl sub_020515C4
	mov r0, r5
	add r1, r4, #0xc
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0205FE80

	arm_func_start sub_0205FF80
sub_0205FF80: ; 0x0205FF80
	stmdb sp!, {r3, lr}
	cmp r0, #3
	mov r2, #0
	bne _0205FFA8
	cmp r1, #1
	moveq r2, #0xa5
	beq _02060070
	cmp r1, #2
	moveq r2, #0x6f
	b _02060070
_0205FFA8:
	cmp r0, #0xa
	bne _0205FFCC
	cmp r1, #6
	bne _02060070
	ldr r0, _02060078 ; =_020A18FC
	sub r1, r2, #1
	bl sub_02060084
	mov r2, r0
	b _02060070
_0205FFCC:
	cmp r0, #0xb
	bne _02060034
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02060070
_0205FFE0: ; jump table
	b _0205FFF8 ; case 0
	b _0206000C ; case 1
	b _02060014 ; case 2
	b _0206001C ; case 3
	b _02060024 ; case 4
	b _0206002C ; case 5
_0205FFF8:
	ldr r0, _0206007C ; =_020A1904
	sub r1, r2, #1
	bl sub_02060084
	mov r2, r0
	b _02060070
_0206000C:
	mov r2, #0x91
	b _02060070
_02060014:
	mov r2, #0x92
	b _02060070
_0206001C:
	mov r2, #0x93
	b _02060070
_02060024:
	mov r2, #0x94
	b _02060070
_0206002C:
	mov r2, #0x95
	b _02060070
_02060034:
	cmp r0, #0xc
	bne _02060070
	mov r0, #9
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02060060
	ldr r0, _02060080 ; =_020A1958
	mov r1, #0xf
	bl sub_02060084
	mov r2, r0
	b _02060070
_02060060:
	ldr r0, _02060080 ; =_020A1958
	mvn r1, #0
	bl sub_02060084
	mov r2, r0
_02060070:
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02060078: .word _020A18FC
_0206007C: .word _020A1904
_02060080: .word _020A1958
	arm_func_end sub_0205FF80

	arm_func_start sub_02060084
sub_02060084: ; 0x02060084
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r2, r5
	mov r4, #0
	b _0206009C
_02060098:
	add r4, r4, #1
_0206009C:
	ldrb r0, [r2], #1
	cmp r0, #0
	bne _02060098
	cmp r1, #0
	blt _020600B8
	cmp r4, r1
	movgt r4, r1
_020600B8:
	bl Rand16Bit
	mov r1, r4
	bl _s32_div_f
	ldrb r0, [r5, r1]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02060084

	arm_func_start sub_020600CC
sub_020600CC: ; 0x020600CC
	stmdb sp!, {r3, lr}
	ldr r0, _02060144 ; =_020B0AD8
	ldr r0, [r0, #0x24]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02060148 ; =_020B0AFC
	ldr r1, _0206014C ; =_020A462C
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, _02060144 ; =_020B0AD8
	ldr r2, [r0, #0x24]
	ldr r1, [r2]
	add r1, r2, r1
	str r1, [r0, #4]
	ldr r1, [r2, #4]
	add r1, r2, r1
	str r1, [r0, #0x14]
	ldr r1, [r2, #8]
	add r1, r2, r1
	str r1, [r0, #0x10]
	ldr r1, [r2, #0xc]
	add r1, r2, r1
	str r1, [r0, #8]
	ldr r1, [r2, #0x10]
	add r1, r2, r1
	str r1, [r0, #0x18]
	ldr r1, [r2, #0x14]
	add r1, r2, r1
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02060144: .word _020B0AD8
_02060148: .word _020B0AFC
_0206014C: .word _020A462C
	arm_func_end sub_020600CC

	arm_func_start GenerateMissionDetailsStruct
GenerateMissionDetailsStruct: ; 0x02060150
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	strne r5, [r4, #0x5c]
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	add r1, r4, #0x18
	bl sub_02062E5C
	mov r0, r5
	mov r1, r4
	bl sub_02060274
	mov r1, r5
	bl sub_0206096C
	str r0, [r4, #0x60]
	add r0, r5, #4
	str r0, [r4, #8]
	mov r1, #0
	str r1, [r4, #0xc]
	ldrsh r0, [r5, #0xe]
	strh r0, [r4, #0x10]
	ldrsh r0, [r5, #0x10]
	strh r0, [r4, #0x12]
	ldrsh r0, [r5, #0x12]
	strh r0, [r4, #0x14]
	ldrsh r0, [r5, #0x14]
	strh r0, [r4, #0x16]
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	streqb r1, [r4, #0x49]
	ldreqh r0, [r5, #0x1c]
	streqb r0, [r4, #0x4c]
	beq _020601EC
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r4, #0x49]
	ldreqsh r0, [r5, #0x1c]
	streqh r0, [r4, #0x4a]
_020601EC:
	ldrb r0, [r5]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02060258
_020601FC: ; jump table
	b _02060258 ; case 0
	b _02060220 ; case 1
	b _02060220 ; case 2
	b _02060220 ; case 3
	b _02060220 ; case 4
	b _02060244 ; case 5
	b _02060230 ; case 6
	b _02060244 ; case 7
	b _02060244 ; case 8
_02060220:
	mov r0, #1
	strb r0, [r4, #0x47]
	strb r0, [r4, #0x48]
	b _02060264
_02060230:
	mov r0, #0
	strb r0, [r4, #0x47]
	mov r0, #3
	strb r0, [r4, #0x48]
	b _02060264
_02060244:
	mov r0, #3
	strb r0, [r4, #0x47]
	mov r0, #2
	strb r0, [r4, #0x48]
	b _02060264
_02060258:
	mov r0, #0
	strb r0, [r4, #0x47]
	strb r0, [r4, #0x48]
_02060264:
	str r5, [r4, #0x5c]
	mov r0, #0
	str r0, [r4, #0x64]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GenerateMissionDetailsStruct

	arm_func_start sub_02060274
sub_02060274: ; 0x02060274
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0xe
	addls pc, pc, r3, lsl #2
	b _02060634
_02060288: ; jump table
	b _020602C4 ; case 0
	b _020602DC ; case 1
	b _02060344 ; case 2
	b _02060388 ; case 3
	b _020603DC ; case 4
	b _02060404 ; case 5
	b _02060420 ; case 6
	b _02060480 ; case 7
	b _0206050C ; case 8
	b _02060494 ; case 9
	b _02060528 ; case 10
	b _0206058C ; case 11
	b _020605EC ; case 12
	b _02060634 ; case 13
	b _02060608 ; case 14
_020602C4:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #3
	strb r0, [r1, #0x46]
	b _02060634
_020602DC:
	ldrb r0, [r0, #2]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02060338
_020602EC: ; jump table
	b _020602FC ; case 0
	b _02060310 ; case 1
	b _02060324 ; case 2
	b _02060324 ; case 3
_020602FC:
	mov r0, #4
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #1
	b _02060338
_02060310:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #5
	b _02060338
_02060324:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #4
	strb r0, [r1, #0x45]
	mov r2, #5
_02060338:
	mov r0, #4
	strb r0, [r1, #0x46]
	b _02060634
_02060344:
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0206036C
	cmp r0, #1
	moveq r0, #1
	streqb r0, [r1, #0x44]
	moveq r0, #4
	streqb r0, [r1, #0x45]
	moveq r2, #5
	b _0206037C
_0206036C:
	mov r0, #4
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r2, #1
_0206037C:
	mov r0, #5
	strb r0, [r1, #0x46]
	b _02060634
_02060388:
	ldrb r0, [r0, #2]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020603CC
_02060398: ; jump table
	b _020603A8 ; case 0
	b _020603BC ; case 1
	b _020603BC ; case 2
	b _020603BC ; case 3
_020603A8:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #8
	strb r0, [r1, #0x45]
	b _020603CC
_020603BC:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
_020603CC:
	mov r0, #6
	strb r0, [r1, #0x46]
	mov r2, #1
	b _02060634
_020603DC:
	ldrb r0, [r0, #2]
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r1, #0x44]
	moveq r0, #5
	streqb r0, [r1, #0x45]
	mov r0, #7
	moveq r2, #3
	strb r0, [r1, #0x46]
	b _02060634
_02060404:
	mov r0, #5
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r0, #8
	strb r0, [r1, #0x46]
	b _02060634
_02060420:
	ldrb r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02060474
_02060430: ; jump table
	b _02060444 ; case 0
	b _02060454 ; case 1
	b _02060444 ; case 2
	b _02060444 ; case 3
	b _02060468 ; case 4
_02060444:
	mov r0, #2
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	b _02060474
_02060454:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #2
	strb r0, [r1, #0x45]
	b _02060474
_02060468:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
_02060474:
	mov r2, #1
	strb r2, [r1, #0x46]
	b _02060634
_02060480:
	mov r0, #2
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	strb r0, [r1, #0x46]
	b _02060634
_02060494:
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _020604B4
	cmp r0, #1
	beq _020604D0
	cmp r0, #2
	beq _020604EC
	b _02060504
_020604B4:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #5
	strb r0, [r1, #0x45]
	mov r0, #0xa
	strb r0, [r1, #0x46]
	b _02060504
_020604D0:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #6
	strb r0, [r1, #0x45]
	mov r0, #0xb
	strb r0, [r1, #0x46]
	b _02060504
_020604EC:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #5
	strb r0, [r1, #0x45]
	mov r0, #0xb
	strb r0, [r1, #0x46]
_02060504:
	mov r2, #1
	b _02060634
_0206050C:
	mov r0, #1
	strb r0, [r1, #0x44]
	mov r0, #4
	strb r0, [r1, #0x45]
	mov r0, #0xc
	strb r0, [r1, #0x46]
	b _02060634
_02060528:
	ldrb r0, [r0, #2]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02060580
_02060538: ; jump table
	b _02060558 ; case 0
	b _02060558 ; case 1
	b _02060558 ; case 2
	b _02060558 ; case 3
	b _02060558 ; case 4
	b _02060558 ; case 5
	b _0206056C ; case 6
	b _02060558 ; case 7
_02060558:
	mov r2, #4
	strb r2, [r1, #0x44]
	mov r0, #1
	strb r0, [r1, #0x45]
	b _02060580
_0206056C:
	mov r0, #4
	strb r0, [r1, #0x44]
	mov r0, #1
	strb r0, [r1, #0x45]
	mov r2, #6
_02060580:
	mov r0, #0xd
	strb r0, [r1, #0x46]
	b _02060634
_0206058C:
	ldrb r0, [r0, #2]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _020605E0
_0206059C: ; jump table
	b _020605B4 ; case 0
	b _020605CC ; case 1
	b _020605CC ; case 2
	b _020605CC ; case 3
	b _020605CC ; case 4
	b _020605CC ; case 5
_020605B4:
	mov r0, #3
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r2, #6
	b _020605E0
_020605CC:
	mov r0, #3
	strb r0, [r1, #0x44]
	mov r0, #7
	strb r0, [r1, #0x45]
	mov r2, #4
_020605E0:
	mov r0, #0xe
	strb r0, [r1, #0x46]
	b _02060634
_020605EC:
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #0xf
	strb r0, [r1, #0x46]
	mov r2, #7
	b _02060634
_02060608:
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _02060630
	mov r0, #1
	strb r0, [r1, #0x44]
	strb r0, [r1, #0x45]
	mov r0, #9
	strb r0, [r1, #0x46]
	mov r0, #7
	strb r0, [r1, #0x1a]
_02060630:
	mov r2, #7
_02060634:
	mov r0, r2
	bx lr
	arm_func_end sub_02060274

	arm_func_start sub_0206063C
sub_0206063C: ; 0x0206063C
	ldrb r2, [r0, #0x20]
	ldrb r0, [r1, #1]
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0206063C

	arm_func_start sub_02060658
sub_02060658: ; 0x02060658
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	cmp r3, r2
	ldreqb r2, [r0, #0x21]
	ldreqb r0, [r1, #2]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02060658

	arm_func_start sub_02060680
sub_02060680: ; 0x02060680
	stmdb sp!, {r3, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov ip, #0
	mov lr, ip
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _020606C4
	ldrh r2, [r0, #2]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, ip
	tst r2, #0xff
	movne lr, #1
_020606C4:
	cmp lr, #0
	beq _020606DC
	ldrsh r2, [r0, #6]
	ldrsh r0, [r1, #0x14]
	cmp r2, r0
	moveq ip, #1
_020606DC:
	and r0, ip, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02060680

	arm_func_start sub_020606E4
sub_020606E4: ; 0x020606E4
	stmdb sp!, {r4, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov r4, #0
	mov ip, r4
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _02060728
	ldrh r2, [r0, #0xe]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, r4
	tst r2, #0xff
	movne ip, #1
_02060728:
	cmp ip, #0
	beq _02060744
	ldrsh r0, [r0, #0x12]
	ldrsh r1, [r1, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_02060744:
	and r0, r4, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end sub_020606E4

	arm_func_start sub_0206074C
sub_0206074C: ; 0x0206074C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldrb r1, [r7, #0x20]
	ldrb r0, [r6, #1]
	mov r4, #0
	mov r5, r4
	cmp r1, r0
	ldreqb r1, [r7, #0x21]
	ldreqb r0, [r6, #2]
	mov r2, r4
	mov r3, r4
	cmpeq r1, r0
	bne _020607A0
	ldrh r0, [r7, #0xe]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, r4
	tst r0, #0xff
	movne r3, #1
_020607A0:
	cmp r3, #0
	beq _020607C4
	ldrh r0, [r7, #0x14]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r2, #1
_020607C4:
	cmp r2, #0
	beq _020607E0
	ldrsh r0, [r7, #0x12]
	ldrsh r1, [r6, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r5, #1
_020607E0:
	cmp r5, #0
	beq _020607FC
	ldrsh r0, [r7, #0x18]
	ldrsh r1, [r6, #0x10]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_020607FC:
	and r0, r4, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206074C

	arm_func_start ValidateNormalChallengeMission
ValidateNormalChallengeMission: ; 0x02060804
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldrb r1, [r8, #0x20]
	ldrb r0, [r7, #1]
	mov r4, #0
	mov r5, r4
	cmp r1, r0
	ldreqb r1, [r8, #0x21]
	ldreqb r0, [r7, #2]
	mov r6, r4
	mov r2, r4
	mov r3, r4
	mov ip, r4
	cmpeq r1, r0
	bne _02060860
	ldrh r0, [r8, #0xe]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, r4
	tst r0, #0xff
	movne ip, #1
_02060860:
	cmp ip, #0
	beq _02060884
	ldrh r0, [r8, #0x14]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r3, #1
_02060884:
	cmp r3, #0
	beq _020608A8
	ldrh r0, [r8, #0x1a]
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	movne r2, #1
_020608A8:
	cmp r2, #0
	beq _020608C4
	ldrsh r0, [r8, #0x12]
	ldrsh r1, [r7, #0xe]
	bl DexNumbersEqual
	cmp r0, #0
	movne r6, #1
_020608C4:
	cmp r6, #0
	beq _020608E0
	ldrsh r0, [r8, #0x18]
	ldrsh r1, [r7, #0x10]
	bl DexNumbersEqual
	cmp r0, #0
	movne r5, #1
_020608E0:
	cmp r5, #0
	beq _020608FC
	ldrsh r0, [r8, #0x1e]
	ldrsh r1, [r7, #0x12]
	bl DexNumbersEqual
	cmp r0, #0
	movne r4, #1
_020608FC:
	and r0, r4, #0xff
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ValidateNormalChallengeMission

	arm_func_start ValidateLegendaryChallengeMission
ValidateLegendaryChallengeMission: ; 0x02060904
	stmdb sp!, {r3, lr}
	ldrb r3, [r0, #0x20]
	ldrb r2, [r1, #1]
	mov ip, #0
	mov lr, ip
	cmp r3, r2
	ldreqb r3, [r0, #0x21]
	ldreqb r2, [r1, #2]
	cmpeq r3, r2
	bne _02060948
	ldrh r2, [r0, #8]
	cmp r2, #0
	cmpne r2, #1
	moveq r2, #1
	movne r2, ip
	tst r2, #0xff
	movne lr, #1
_02060948:
	cmp lr, #0
	beq _02060964
	ldrh r2, [r0, #0xc]
	ldrb r0, [r1, #4]
	and r1, r2, #0xff
	cmp r1, r0
	moveq ip, #1
_02060964:
	and r0, ip, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ValidateLegendaryChallengeMission

	arm_func_start sub_0206096C
sub_0206096C: ; 0x0206096C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _020609E0 ; =MISSION_VALIDATION_FUNCTION_LIST
	mov r8, r0
	mov r7, r1
	ldr r5, [r2, r8, lsl #2]
	mov r4, #0
	mov sb, #0x22
	ldr sl, _020609E4 ; =_020B0AD8
	b _020609BC
_02060990:
	mul r6, r4, sb
	ldr r0, [sl, #0x18]
	mov r1, r7
	add r0, r0, r6
	blx r5
	cmp r0, #0
	ldrne r0, _020609E4 ; =_020B0AD8
	ldrne r0, [r0, #0x18]
	addne r0, r0, r6
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add r4, r4, #1
_020609BC:
	cmp r4, #0x258
	blt _02060990
	cmp r8, #3
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, r7
	mov r0, #1
	bl sub_0206096C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020609E0: .word MISSION_VALIDATION_FUNCTION_LIST
_020609E4: .word _020B0AD8
	arm_func_end sub_0206096C

	arm_func_start SprintfStatic__020609E8
SprintfStatic__020609E8: ; 0x020609E8
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
	arm_func_end SprintfStatic__020609E8

	arm_func_start AppendMissionTitle
AppendMissionTitle: ; 0x02060A10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r6, r0
	add r0, sp, #4
	mov r7, r3
	mov r5, r1
	mov r4, r2
	bl sub_020022C4
	ldr r3, [r7, #8]
	ldr r1, _02060AEC ; =_020A4644
	ldrb r0, [r3]
	ldr r2, [r3, #4]
	ldrb r3, [r3, #1]
	add r2, r2, r0
	mov r0, r6
	add r2, r3, r2
	str r2, [sp, #4]
	ldr r2, [r7, #0x60]
	ldrh sl, [r2]
	bl strcat
	ldr fp, _02060AF0 ; =0x00000FFF
	ldr sb, _02060AF4 ; =MISSION_STRING_IDS
	add r7, fp, #0xf000
	ldr r8, _02060AF8 ; =_020B0AD8
	b _02060AD4
_02060A74:
	and r0, sl, fp
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldr r2, [r8, #4]
	mov r1, r0, lsl #2
	ldrh r1, [r2, r1]
	add sl, r2, r0, lsl #2
	add r0, sp, #4
	bl sub_020022D0
	ldrh r2, [sl, #2]
	mov r1, #0x100
	mov r3, #0
	add sl, r2, r0
	mov r2, sl, lsl #1
	ldrh r2, [sb, r2]
	mov r0, r5
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, r6
	mov r1, r5
	bl strcat
	ldr r1, [r8, #0x14]
	mov r0, sl, lsl #1
	ldrh sl, [r1, r0]
_02060AD4:
	cmp sl, r7
	beq _02060AE4
	tst sl, #0x1000
	beq _02060A74
_02060AE4:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02060AEC: .word _020A4644
_02060AF0: .word 0x00000FFF
_02060AF4: .word MISSION_STRING_IDS
_02060AF8: .word _020B0AD8
	arm_func_end AppendMissionTitle

	arm_func_start sub_02060AFC
sub_02060AFC: ; 0x02060AFC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x80
	mov r6, r0
	mov r5, r1
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	ldr r1, _02060DF4 ; =_020A4654
	mov r0, r6
	bl strcpy
	ldr r1, _02060DF8 ; =_020A4664
	mov r0, r6
	ldrb r7, [r5, #0x47]
	bl strcat
	ldr r1, _02060DFC ; =REMOTE_STRING_PTR_TABLE
	mov r0, r4
	ldr r1, [r1, r7, lsl #2]
	bl SprintfStatic__020609E8
	mov r0, r6
	mov r1, r4
	bl strcat
	add r0, sp, #0x30
	bl InitPreprocessorArgs
	ldrb r0, [r5, #0x44]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02060D18
_02060B6C: ; jump table
	b _02060B88 ; case 0
	b _02060C48 ; case 1
	b _02060C60 ; case 2
	b _02060C80 ; case 3
	b _02060CA0 ; case 4
	b _02060CC0 ; case 5
	b _02060CE4 ; case 6
_02060B88:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #4
	bne _02060BAC
	ldr r1, _02060E00 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02060BC4
_02060BAC:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [r5, #0xc]
	add r0, sp, #4
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02060BC4:
	add r0, sp, #4
	str r0, [sp, #0x68]
	ldr r0, [r5, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02060C10
_02060BE0: ; jump table
	b _02060C10 ; case 0
	b _02060C10 ; case 1
	b _02060C10 ; case 2
	b _02060C10 ; case 3
	b _02060C10 ; case 4
	b _02060C00 ; case 5
	b _02060C08 ; case 6
	b _02060C00 ; case 7
_02060C00:
	ldr r2, _02060E04 ; =0x000038CB
	b _02060C14
_02060C08:
	ldr r2, _02060E08 ; =0x000038CC
	b _02060C14
_02060C10:
	ldr r2, _02060E0C ; =0x000038CA
_02060C14:
	add ip, sp, #0x30
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str ip, [sp]
	bl PreprocessStringFromId
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	b _02060D18
_02060C48:
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	bl AppendMissionTitle
	b _02060D18
_02060C60:
	ldrsh ip, [r5, #0x16]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x40]
	bl AppendMissionTitle
	b _02060D18
_02060C80:
	ldrsh ip, [r5, #0x10]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x30]
	bl AppendMissionTitle
	b _02060D18
_02060CA0:
	ldrsh ip, [r5, #0x12]
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x30]
	bl AppendMissionTitle
	b _02060D18
_02060CC0:
	ldr r0, [r5, #8]
	add r2, sp, #0x30
	ldrb ip, [r0]
	mov r0, r6
	mov r1, r4
	mov r3, r5
	str ip, [sp, #0x40]
	bl AppendMissionTitle
	b _02060D18
_02060CE4:
	ldr r1, [r5, #0x54]
	mov r0, r4
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
_02060D18:
	ldr r1, _02060E14 ; =_020A4674
	mov r0, r6
	bl strcat
	mov r0, r5
	mov r1, r4
	mov r2, #0x100
	bl sub_02061FDC
	ldr r1, _02060E10 ; =_020A4644
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	ldr r1, [r5, #0x5c]
	cmp r1, #0
	beq _02060D9C
	ldrb r0, [r1, #1]
	cmp r0, #0xe
	bne _02060D9C
	ldr r2, _02060E18 ; =0x00003C2A
	add r5, sp, #0x30
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessStringFromId
	ldr r1, _02060E1C ; =_020A4678
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r4
	bl strcat
	b _02060DE4
_02060D9C:
	ldrb r0, [r5, #0x46]
	cmp r0, #0
	bne _02060DB8
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_02062D9C
	b _02060DC4
_02060DB8:
	ldrb r1, [r1, #1]
	ldr r0, [r5, #8]
	bl sub_02062D9C
_02060DC4:
	ldr r2, _02060E20 ; =RANK_STRING_PTR_TABLE
	ldr r1, _02060E1C ; =_020A4678
	ldr r5, [r2, r0, lsl #2]
	mov r0, r6
	bl strcat
	mov r0, r6
	mov r1, r5
	bl strcat
_02060DE4:
	mov r0, r4
	bl MemFree
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02060AFC_OFFSET 2
#elif defined(JAPAN)
#define SUB_02060AFC_OFFSET -0x3C2
#else
#define SUB_02060AFC_OFFSET 0
#endif
_02060DF4: .word _020A4654
_02060DF8: .word _020A4664
_02060DFC: .word REMOTE_STRING_PTR_TABLE
_02060E00: .word 0x000038C9 + SUB_02060AFC_OFFSET
_02060E04: .word 0x000038CB + SUB_02060AFC_OFFSET
_02060E08: .word 0x000038CC + SUB_02060AFC_OFFSET
_02060E0C: .word 0x000038CA + SUB_02060AFC_OFFSET
_02060E10: .word _020A4644
_02060E14: .word _020A4674
_02060E18: .word 0x00003C2A + SUB_02060AFC_OFFSET
_02060E1C: .word _020A4678
_02060E20: .word RANK_STRING_PTR_TABLE
	arm_func_end sub_02060AFC

	arm_func_start sub_02060E24
sub_02060E24: ; 0x02060E24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	ldr r1, _02060EA0 ; =_020A4654
	mov r0, r5
	bl strcpy
	ldr r1, _02060EA4 ; =_020A4664
	mov r0, r5
	bl strcat
	ldr r1, _02060EA8 ; =REMOTE_STRING_PTR_TABLE
	mov r0, r4
	ldr r1, [r1, #8]
	bl SprintfStatic__020609E8
	mov r0, r5
	mov r1, r4
	bl strcat
	ldr r1, _02060EAC ; =_020A4644
	mov r0, r5
	bl strcat
	mov r0, r4
	ldr r1, _02060EB0 ; =0x00003C4D
	bl GetStringFromFileVeneer
	mov r0, r5
	mov r1, r4
	bl strcat
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02060EA0: .word _020A4654
_02060EA4: .word _020A4664
_02060EA8: .word REMOTE_STRING_PTR_TABLE
_02060EAC: .word _020A4644
#if defined(EUROPE)
_02060EB0: .word 0x00003C4F
#elif defined(JAPAN)
_02060EB0: .word 0x0000388B
#else
_02060EB0: .word 0x00003C4D
#endif
	arm_func_end sub_02060E24

	arm_func_start AppendMissionSummary
AppendMissionSummary: ; 0x02060EB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r8, [sp, #0x34]
	mov r7, r0
	add r0, sp, #4
	mov r6, r1
	mov r5, r2
	mov fp, r3
	ldr r4, [sp, #0x30]
	bl sub_020022C4
	ldr r3, [r8, #8]
	mov r0, #0
	ldrb r1, [r3]
	ldr r2, [r3, #4]
	ldrb r3, [r3, #1]
	add r1, r2, r1
	ldr sb, _02060FCC ; =_020B0AD8
	add r1, r3, r1
	str r1, [sp, #4]
	ldr r1, [r8, #0x60]
	ldrh r1, [r1]
	strb r0, [r7]
	ldr r0, _02060FD0 ; =0x00000FFF
	add r8, r0, #0xf000
	b _02060FA8
_02060F18:
	ldr r0, _02060FD0 ; =0x00000FFF
	ldr r2, [sb, #4]
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	tst r1, #0x1000
	mov r1, r0, lsl #2
	add sl, r2, r0, lsl #2
	ldrh r1, [r2, r1]
	add r0, sp, #4
	bne _02060F60
	bl sub_020022D0
	ldrh r2, [sl, #2]
	ldr r1, [sb, #0x14]
	add r0, r2, r0
	mov r0, r0, lsl #1
	ldrh r1, [r1, r0]
	b _02060FA8
_02060F60:
	bl sub_020022D0
	ldrh r2, [sl, #2]
	mov r1, #0x12c
	mov r3, #0
	add sl, r2, r0
	ldr r2, _02060FD4 ; =MISSION_STRING_IDS
	mov ip, sl, lsl #1
	ldrh r2, [r2, ip]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
	mov r0, r7
	mov r1, r6
	mov r2, #0x400
	bl strncat
	ldr r1, [sb, #0x14]
	mov r0, sl, lsl #1
	ldrh r1, [r1, r0]
_02060FA8:
	cmp r1, r8
	bne _02060F18
	mov r0, fp
	mov r2, r5
	mov r3, r7
	mov r1, #4
	bl DrawTextInWindow
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02060FCC: .word _020B0AD8
_02060FD0: .word 0x00000FFF
_02060FD4: .word MISSION_STRING_IDS
	arm_func_end AppendMissionSummary

	arm_func_start sub_02060FD8
sub_02060FD8: ; 0x02060FD8
#ifdef JAPAN
#define SUB_02060FD8_ARG #0x3e
#else
#define SUB_02060FD8_ARG #0x42
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14c
	mov sb, r0
	mov r8, r1
	mov r0, #0x12c
	mov r1, #0xf
	bl MemAlloc
	mov r4, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	ldr r1, [sb, #0x64]
	mov r5, r0
	cmp r1, #0
	mov r7, #0
	beq _02061110
	ldr r1, [sb, #0x54]
	cmp r1, #0
	ldrneh r2, [r1]
	cmpne r2, #0
	bne _020610E8
	ldr r0, [sb, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #0x32
	bne _02061050
	ldr r1, _02061BD0 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02061068
_02061050:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [sb, #0xc]
	add r0, sp, #0x32
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02061068:
	add r0, sp, #0x32
	str r0, [sp, #0x134]
	ldr r0, [sb, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020610B4
_02061084: ; jump table
	b _020610B4 ; case 0
	b _020610B4 ; case 1
	b _020610B4 ; case 2
	b _020610B4 ; case 3
	b _020610B4 ; case 4
	b _020610A4 ; case 5
	b _020610AC ; case 6
	b _020610A4 ; case 7
_020610A4:
	ldr r2, _02061BD4 ; =0x000038CB
	b _020610B8
_020610AC:
	ldr r2, _02061BD8 ; =0x000038CC
	b _020610B8
_020610B4:
	ldr r2, _02061BDC ; =0x000038CA
_020610B8:
	add r6, sp, #0xfc
	mov r0, r5
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	mov r0, r8
	mov r3, r5
	mov r1, #4
	mov r2, #0
	bl DrawTextInWindow
	b _02061124
_020610E8:
#ifndef JAPAN
	mov r3, r7
#endif
	mov r2, #0x12
	bl sub_0202568C
	mov r2, r7
	strb r2, [r0]
	mov r0, r8
	mov r3, r5
	mov r1, #4
	bl DrawTextInWindow
	b _02061124
_02061110:
	ldr r3, _02061BE0 ; =0x00003C1E
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl sub_02026268
_02061124:
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x45]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _020613D4
_0206113C: ; jump table
	b _02061164 ; case 0
	b _020611C0 ; case 1
	b _020611E4 ; case 2
	b _02061210 ; case 3
	b _0206123C ; case 4
	b _02061268 ; case 5
	b _0206129C ; case 6
	b _020612EC ; case 7
	b _0206131C ; case 8
	b _02061370 ; case 9
_02061164:
	ldr r0, [sb, #0x64]
	ldrb r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020611A8
_02061178: ; jump table
	b _020611A8 ; case 0
	b _020611A8 ; case 1
	b _020611A8 ; case 2
	b _020611A8 ; case 3
	b _020611A8 ; case 4
	b _02061198 ; case 5
	b _020611A0 ; case 6
	b _02061198 ; case 7
_02061198:
	ldr r3, _02061BE4 ; =0x000038CE
	b _020611AC
_020611A0:
	ldr r3, _02061BE8 ; =0x000038CF
	b _020611AC
_020611A8:
	ldr r3, _02061BEC ; =0x000038CD
_020611AC:
	mov r0, r8
	mov r1, #4
	mov r2, #0x11
	bl sub_02026268
	b _020613D4
_020611C0:
	add r1, sp, #0xfc
	str r1, [sp]
	mov r0, r5
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_020611E4:
	ldrsh r2, [sb, #0x16]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0x10c]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061210:
	ldrsh r2, [sb, #0x10]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0xfc]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206123C:
	ldrsh r2, [sb, #0x12]
	add r1, sp, #0xfc
	mov r0, r5
	str r2, [sp, #0xfc]
	str r1, [sp]
	mov r1, r4
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061268:
	ldrsh r1, [sb, #0x12]
	add r2, sp, #0xfc
	mov r0, r5
	str r1, [sp, #0xfc]
	ldrsh r6, [sb, #0x16]
	mov r1, r4
	mov r3, r8
	str r6, [sp, #0x10c]
	str r2, [sp]
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206129C:
	ldrsh r0, [sb, #0x16]
	str r0, [sp, #0x10c]
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [sb, #8]
	mov r3, r8
	ldrneb r1, [r0, #1]
	ldreqb r0, [r0, #1]
	mov r2, #0x11
	rsbeq r1, r0, #0
	str r1, [sp, #0x120]
	add r0, sp, #0xfc
	str r0, [sp]
	mov r0, r5
	mov r1, r4
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_020612EC:
	ldr r0, [sb, #8]
	add r2, sp, #0xfc
	ldrb r3, [r0]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x10c]
	str r2, [sp]
	mov r3, r8
	mov r2, #0x11
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_0206131C:
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	str r0, [sp, #0x10c]
	ldr r0, [sb, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [sb, #8]
	mov r3, r8
	ldrneb r1, [r0, #1]
	ldreqb r0, [r0, #1]
	mov r2, #0x11
	rsbeq r1, r0, #0
	str r1, [sp, #0x120]
	add r0, sp, #0xfc
	str r0, [sp]
	mov r0, r5
	mov r1, r4
	str sb, [sp, #4]
	bl AppendMissionSummary
	b _020613D4
_02061370:
	ldr r1, [sb, #0x58]
	mov r0, r5
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	mov r0, r8
	mov r3, r5
	mov r1, #4
	mov r2, #0x11
	bl DrawTextInWindow
	ldr r1, [sb, #0x58]
	mov r0, r5
	add r1, r1, #0x24
	mov r2, #0x12
#ifndef JAPAN
	mov r3, #0
#endif
	bl sub_0202568C
	mov r1, #0
	strb r1, [r0]
	mov r0, r8
	mov r1, #4
	mov r2, #0x1e
	mov r3, r5
	bl DrawTextInWindow
_020613D4:
	ldrb r1, [sb, #0x46]
	cmp r1, #0xf
	beq _02061518
	ldr r0, [sb, #0x64]
#ifdef JAPAN
	mov r6, #0x3e
#endif
	cmp r0, #0
	beq _02061418
	ldrb r0, [r0]
	cmp r0, #7
	cmpne r0, #5
	bne _02061418
#ifdef JAPAN
	mov sl, #0x2d
	ldr r3, _02061BF0 ; =0x00003C21
	mov r0, r8
	mov r2, sl
#else
	mov r6, #0x2d
	ldr r3, _02061BF0 ; =0x00003C21
	mov r0, r8
	mov r2, r6
#endif
	mov r1, #4
	bl sub_02026268
	b _0206144C
_02061418:
	cmp r1, #0xe
#ifdef JAPAN
	mov sl, #0x2d
#else
	mov r6, #0x2d
#endif
	mov r1, #4
	bne _0206143C
	ldr r3, _02061BF4 ; =0x00003C20
	mov r0, r8
#ifdef JAPAN
	mov r2, sl
	bl sub_02026268
	add r6, r6, #0x10
#else
	mov r2, r6
	bl sub_02026268
#endif
	b _0206144C
_0206143C:
	ldr r3, _02061BF8 ; =0x00003C1F
	mov r0, r8
#ifdef JAPAN
	mov r2, sl
#else
	mov r2, r6
#endif
	bl sub_02026268
_0206144C:
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	bne _020614BC
	ldr r0, [sb, #0xc]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #0
	add r0, sp, #8
	bne _0206147C
	ldr r1, _02061BD0 ; =0x000038C9
	bl GetStringFromFileVeneer
	b _02061494
_0206147C:
	mov r1, #0x2a
	bl MemZero
	ldr r1, [sb, #0xc]
	add r0, sp, #8
#ifdef JAPAN
	mov r2, #5
#else
	mov r2, #0xa
#endif
	bl StrncpySimpleNoPadSafe
_02061494:
	ldr r1, _02061BFC ; =_020A4688
	add r2, sp, #8
	mov r0, r4
	bl SprintfStatic__020609E8
	mov r0, r8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
	mov r3, r4
#else
	mov r2, r6
	mov r3, r4
	mov r1, #0x42
#endif
	bl DrawTextInWindow
	b _02061518
_020614BC:
	ldr r0, [sb, #0x5c]
	cmp r0, #0
	beq _020614EC
	ldrb r0, [r0, #1]
	cmp r0, #0xe
	bne _020614EC
	ldr r3, _02061C00 ; =0x00003C37
	mov r0, r8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
#else
	mov r2, r6
	mov r1, #0x42
#endif
	bl sub_02026268
	b _02061518
_020614EC:
	ldrsh r0, [sb, #0x10]
	bl GetNameString
	mov r2, r0
	ldr r1, _02061C04 ; =_020A4698
	mov r0, r4
	bl SprintfStatic__020609E8
#ifdef JAPAN
	mov r1, r6
	mov r2, sl
	mov r0, r8
#else
	mov r2, r6
	mov r0, r8
	mov r1, #0x42
#endif
	mov r3, r4
	bl DrawTextInWindow
_02061518:
	ldrb r2, [sb, #0x48]
	ldr r1, _02061C08 ; =MISSION_MENU_STRING_IDS_1
	mov r0, r5
	mov r2, r2, lsl #1
	ldrh r1, [r1, r2]
	bl GetStringFromFileVeneer
	ldrb r0, [sb, #0x48]
	mov r3, r5
	mov r2, #0x2d
	add r0, r0, #0xfc
	and r0, r0, #0xff
	cmp r0, #2
#ifdef JAPAN
	movls r1, #0x56
#else
	movls r1, #0x43
#endif
	movhi r1, #0x40
	mov r0, r8
	add r1, r1, #0x6c
	bl DrawTextInWindow
	ldr r3, _02061C0C ; =_020A46A8
	mov r0, r8
	mov r1, #0x6c
	mov r2, #1
	bl DrawTextInWindow
	ldr r3, _02061C10 ; =0x00003C22
	mov r0, r8
	mov r1, #4
	mov r2, #0x3a
	bl sub_02026268
	ldrb r2, [sb, #0x46]
	ldrsh r6, [sb, #0x16]
	mov r0, r4
	cmp r2, #0xe
	ldreqsh r3, [sb, #0x10]
	mov r1, #0x12c
	ldrnesh r3, [sb, #0x12]
	str r6, [sp]
	bl sub_02061DC8
	mov r0, r8
	mov r3, r4
	mov r1, SUB_02060FD8_ARG
	mov r2, #0x3a
	bl DrawTextInWindow
	add r7, r7, #0x47
	ldr r3, _02061C14 ; =0x00003C23
	mov r0, r8
	mov r1, #4
	mov r2, r7
	bl sub_02026268
	mov r0, sb
	mov r1, r4
	mov r2, #0x100
	bl sub_02061FDC
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r2, r7
	mov r3, r4
	bl DrawTextInWindow
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	beq _020616C8
	add r7, r7, #0xd
	ldr r3, _02061C18 ; =0x00003C24
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl sub_02026268
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x49]
	cmp r0, #0
	bne _02061670
	ldrb r0, [sb, #0x4c]
	cmp r0, #0
	beq _02061660
	ldr r2, _02061C1C ; =0x00003C26
	str r0, [sp, #0x10c]
	add r6, sp, #0xfc
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	b _020616B4
_02061660:
	ldr r1, _02061C20 ; =0x00003C25
	mov r0, r4
	bl GetStringFromFileVeneer
	b _020616B4
_02061670:
	cmp r0, #1
	bne _020616B4
	ldrsh r0, [sb, #0x4a]
	cmp r0, #0
	beq _020616A8
	ldr r2, _02061C24 ; =0x00003C27
	str r0, [sp, #0xfc]
	add r6, sp, #0xfc
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	str r6, [sp]
	bl PreprocessStringFromId
	b _020616B4
_020616A8:
	ldr r1, _02061C20 ; =0x00003C25
	mov r0, r4
	bl GetStringFromFileVeneer
_020616B4:
	mov r0, r8
	mov r2, r7
	mov r3, r4
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
_020616C8:
	ldr r1, [sb, #0x5c]
	cmp r1, #0
	beq _02061710
	ldrb r0, [r1, #1]
	cmp r0, #0xe
	bne _02061710
	add r7, r7, #0xd
	ldr r3, _02061C28 ; =0x00003C28
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl sub_02026268
	ldr r3, _02061C2C ; =0x00003C2A
	mov r0, r8
	mov r2, r7
	mov r1, SUB_02060FD8_ARG
	bl sub_02026268
	b _020617D4
_02061710:
	ldrb r0, [sb, #0x46]
	cmp r0, #0
	bne _02061740
	ldr r0, [sb, #8]
	mov r1, #0
	bl sub_02062D9C
	mov sl, r0
	ldr r0, [sb, #8]
	mov r1, #0
	bl sub_02062D5C
	ldr r1, _02061C30 ; =MISSION_RANK_POINTS
	b _02061764
_02061740:
	ldrb r1, [r1, #1]
	ldr r0, [sb, #8]
	bl sub_02062D9C
	ldr r1, [sb, #0x5c]
	mov sl, r0
	ldrb r1, [r1, #1]
	ldr r0, [sb, #8]
	bl sub_02062D5C
	ldr r1, _02061C30 ; =MISSION_RANK_POINTS
_02061764:
	add r7, r7, #0xd
	ldr r6, [r1, r0, lsl #2]
	ldr r3, _02061C28 ; =0x00003C28
	mov r0, r8
	mov r2, r7
	mov r1, #4
	bl sub_02026268
	ldr r1, _02061C34 ; =RANK_STRING_PTR_TABLE
	mov r0, r8
	ldr r3, [r1, sl, lsl #2]
	mov r2, r7
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	add r0, sp, #0xfc
	bl InitPreprocessorArgs
	str r6, [sp, #0x120]
	add r1, sp, #0xfc
	str r1, [sp]
	ldr r2, _02061C38 ; =0x00003C29
	mov r0, r4
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r8
#ifdef JAPAN
	mov r1, #0x52
#else
	mov r1, #0x56
#endif
	mov r2, r7
	mov r3, r4
	bl DrawTextInWindow
_020617D4:
	ldr r1, [sb, #0x64]
	cmp r1, #0
	bne _02061AAC
	ldrb r0, [sb, #0x46]
	cmp r0, #0xf
	beq _02061AAC
	cmp r0, #0xe
	add r6, r7, #0xd
	mov r1, #4
	bne _02061810
	ldr r3, _02061C3C ; =0x00003C2C
	mov r0, r8
	mov r2, r6
	bl sub_02026268
	b _02061820
_02061810:
	ldr r3, _02061C40 ; =0x00003C2B
	mov r0, r8
	mov r2, r6
	bl sub_02026268
_02061820:
	ldrb r1, [sb, #0x1a]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02061A88
_02061830: ; jump table
	b _02061850 ; case 0
	b _020618A0 ; case 1
	b _020618F0 ; case 2
	b _02061940 ; case 3
	b _02061990 ; case 4
	b _020619E0 ; case 5
	b _02061A0C ; case 6
	b _02061A5C ; case 7
_02061850:
	ldr r1, [sb, #0x20]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xd0]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020618A0:
	ldr r1, [sb, #0x20]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xd0]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020618F0:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061940:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061990:
	ldrsh r1, [sb, #0x2c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xbc]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_020619E0:
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	mov r1, r1, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061A0C:
	ldrsh r1, [sb, #0x3c]
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	str r1, [sp, #0xac]
	ldrb r1, [sb, #0x1a]
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bl StringFromId
	add r3, sp, #0xac
	mov r2, r0
	str r3, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r2, r6
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061A5C:
	ldr r0, _02061C44 ; =MISSION_MENU_STRING_IDS_2
	mov r1, r1, lsl #1
	ldrh r1, [r0, r1]
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061A88:
	ldr r1, _02061C48 ; =0x000038DF
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r8
	mov r2, r6
	mov r3, r5
	mov r1, SUB_02060FD8_ARG
	bl DrawTextInWindow
	b _02061BA4
_02061AAC:
	cmp r1, #0
	beq _02061BA4
	ldrb r0, [r1]
	cmp r0, #7
	cmpne r0, #5
	bne _02061BA4
	add r0, sp, #0x5c
	bl InitPreprocessorArgs
	ldrb r0, [sb, #0x1a]
	cmp r0, #2
	bne _02061B48
	ldr r3, _02061C4C ; =0x00003C2D
	mov r0, r8
	add r2, r7, #0xd
	mov r1, #4
	bl sub_02026268
	mov r6, #0
	ldr r2, _02061C50 ; =_020A3CBC
	mov r0, r5
	add r1, sb, #0x28
	mov r3, #1
	str r6, [sp]
	bl sub_0200D310
	ldr r0, _02061C54 ; =0x00003C2E
	str r5, [sp, #0x94]
	bl StringFromId
	add r1, sp, #0x5c
	mov r2, r0
	str r1, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	add r2, r7, #0xd
	mov r3, r4
	bl DrawTextInWindow
	b _02061BA4
_02061B48:
	cmp r0, #6
	bne _02061BA4
	ldr r3, _02061C58 ; =0x00003C2F
	mov r0, r8
	add r2, r7, #0xd
	mov r1, #4
	bl sub_02026268
	ldrsh r1, [sb, #0x3c]
	ldr r0, _02061C5C ; =0x00003C30
	str r1, [sp, #0x5c]
	bl StringFromId
	add r1, sp, #0x5c
	mov r2, r0
	str r1, [sp]
	mov r0, r4
	mov r1, #0x12c
	mov r3, #4
	bl PreprocessString
	mov r0, r8
	mov r1, SUB_02060FD8_ARG
	add r2, r7, #0xd
	mov r3, r4
	bl DrawTextInWindow
_02061BA4:
	ldrb r1, [sb, #0x45]
	ldr r2, [sb, #0x5c]
	mov r0, r8
	add r3, r7, #0x1a
	bl sub_02061CC8
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl MemFree
	add sp, sp, #0x14c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02060FD8_OFFSET 2
#elif defined(JAPAN)
#define SUB_02060FD8_OFFSET -0x3C2
#else
#define SUB_02060FD8_OFFSET 0
#endif
_02061BD0: .word 0x000038C9 + SUB_02060FD8_OFFSET
_02061BD4: .word 0x000038CB + SUB_02060FD8_OFFSET
_02061BD8: .word 0x000038CC + SUB_02060FD8_OFFSET
_02061BDC: .word 0x000038CA + SUB_02060FD8_OFFSET
_02061BE0: .word 0x00003C1E + SUB_02060FD8_OFFSET
_02061BE4: .word 0x000038CE + SUB_02060FD8_OFFSET
_02061BE8: .word 0x000038CF + SUB_02060FD8_OFFSET
_02061BEC: .word 0x000038CD + SUB_02060FD8_OFFSET
_02061BF0: .word 0x00003C21 + SUB_02060FD8_OFFSET
_02061BF4: .word 0x00003C20 + SUB_02060FD8_OFFSET
_02061BF8: .word 0x00003C1F + SUB_02060FD8_OFFSET
_02061BFC: .word _020A4688
_02061C00: .word 0x00003C37 + SUB_02060FD8_OFFSET
_02061C04: .word _020A4698
_02061C08: .word MISSION_MENU_STRING_IDS_1
_02061C0C: .word _020A46A8
_02061C10: .word 0x00003C22 + SUB_02060FD8_OFFSET
_02061C14: .word 0x00003C23 + SUB_02060FD8_OFFSET
_02061C18: .word 0x00003C24 + SUB_02060FD8_OFFSET
_02061C1C: .word 0x00003C26 + SUB_02060FD8_OFFSET
_02061C20: .word 0x00003C25 + SUB_02060FD8_OFFSET
_02061C24: .word 0x00003C27 + SUB_02060FD8_OFFSET
_02061C28: .word 0x00003C28 + SUB_02060FD8_OFFSET
_02061C2C: .word 0x00003C2A + SUB_02060FD8_OFFSET
_02061C30: .word MISSION_RANK_POINTS
_02061C34: .word RANK_STRING_PTR_TABLE
_02061C38: .word 0x00003C29 + SUB_02060FD8_OFFSET
_02061C3C: .word 0x00003C2C + SUB_02060FD8_OFFSET
_02061C40: .word 0x00003C2B + SUB_02060FD8_OFFSET
_02061C44: .word MISSION_MENU_STRING_IDS_2
_02061C48: .word 0x000038DF + SUB_02060FD8_OFFSET
_02061C4C: .word 0x00003C2D + SUB_02060FD8_OFFSET
_02061C50: .word _020A3CBC
_02061C54: .word 0x00003C2E + SUB_02060FD8_OFFSET
_02061C58: .word 0x00003C2F + SUB_02060FD8_OFFSET
_02061C5C: .word 0x00003C30 + SUB_02060FD8_OFFSET
	arm_func_end sub_02060FD8

	arm_func_start sub_02061C60
sub_02061C60: ; 0x02061C60
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02061CBC ; =0x00003C1E
	mov r4, r1
	mov r1, #4
	mov r2, #0
	mov r5, r0
	bl sub_02026268
	ldr r3, _02061CC0 ; =_020A46A8
	mov r0, r5
	mov r1, #0x6c
	mov r2, #1
	bl DrawTextInWindow
	ldr r3, _02061CC4 ; =0x00003C4E
	mov r0, r5
	mov r1, #4
	mov r2, #0x11
	bl sub_02026268
	mov r0, r5
	mov r2, r4
	mov r1, #1
	mov r3, #0x7b
	bl sub_02061CC8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02061C60_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061C60_OFFSET -0x3C2
#else
#define SUB_02061C60_OFFSET 0
#endif
_02061CBC: .word 0x00003C1E + SUB_02061C60_OFFSET
_02061CC0: .word _020A46A8
_02061CC4: .word 0x00003C4E + SUB_02061C60_OFFSET
	arm_func_end sub_02061C60

	arm_func_start sub_02061CC8
sub_02061CC8: ; 0x02061CC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r4, r2
	cmp r1, #9
	cmpne r1, #0
	mov sl, r0
	mov sb, r3
	cmpne r4, #0
	beq _02061DB8
	ldrb r1, [r4]
	cmp r1, #4
	bne _02061DB8
	ldr r3, _02061DC4 ; =0x00003C31
	mov r2, sb
	mov r1, #4
	bl sub_02026268
	add r0, sp, #4
	mov r1, r4
	add sb, sb, #0xd
	bl MissionToWonderMailPassword
	mov r7, #0
	mov fp, #0x44
	add r6, sp, #4
	mov r4, #0xb
	b _02061DB0
_02061D2C:
	beq _02061DB8
	cmp r7, #5
	movlt r8, fp
	blt _02061D60
	cmp r7, #0xc
	movlt r8, #0x43
	blt _02061D60
	cmp r7, #0x16
	movlt r8, #0x44
	blt _02061D60
	cmp r7, #0x1d
	movlt r8, #0x43
	movge r8, #0x44
_02061D60:
	ldrb r0, [r6, r7]
	bl sub_020251F0
	mov r5, r0
	mov r0, r7
	mov r1, #0x11
	bl _s32_div_f
	mul r2, r1, r4
	and r0, r8, #0xff
	str r0, [sp]
	add r1, r2, #0x13
	mov r3, r5
	mov r0, sl
	mov r2, sb
	bl sub_020264F8
	add r0, r7, #1
	mov r1, #0x11
	bl _s32_div_f
	cmp r1, #0
	addeq sb, sb, #0xd
	add r7, r7, #1
_02061DB0:
	cmp r7, #0x22
	blt _02061D2C
_02061DB8:
	mov r0, sb
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
_02061DC4: .word 0x00003C33
#elif defined(JAPAN)
_02061DC4: .word 0x0000386F
#else
_02061DC4: .word 0x00003C31
#endif
	arm_func_end sub_02061CC8

	arm_func_start sub_02061DC8
sub_02061DC8: ; 0x02061DC8
#if defined(EUROPE)
#define SUB_02061DC8_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061DC8_WORD_OFFSET -0x3C2
#else
#define SUB_02061DC8_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r5, r0
	add r0, sp, #4
	mov r7, r2
	mov r4, r1
	mov r6, r3
	bl InitPreprocessorArgs
	cmp r7, #0xf
	addls pc, pc, r7, lsl #2
	b _02061EE4
_02061DF4: ; jump table
	b _02061E34 ; case 0
	b _02061E4C ; case 1
	b _02061E3C ; case 2
	b _02061E5C ; case 3
	b _02061EAC ; case 4
	b _02061E8C ; case 5
	b _02061E68 ; case 6
	b _02061E74 ; case 7
	b _02061E80 ; case 8
	b _02061EE4 ; case 9
	b _02061E98 ; case 10
	b _02061EA4 ; case 11
	b _02061EB8 ; case 12
	b _02061EC4 ; case 13
	b _02061ED0 ; case 14
	b _02061EDC ; case 15
_02061E34:
	ldr r2, _02061F08 ; =0x00003C38
	b _02061EE8
_02061E3C:
	ldrsh r0, [sp, #0x68]
	ldr r2, _02061F0C ; =0x00003C3A
	str r0, [sp, #0x14]
	b _02061EE8
_02061E4C:
	ldrsh r0, [sp, #0x68]
	ldr r2, _02061F10 ; =0x00003C39
	str r0, [sp, #0x14]
	b _02061EE8
_02061E5C:
	str r6, [sp, #4]
	ldr r2, _02061F14 ; =0x00003C3B
	b _02061EE8
_02061E68:
	str r6, [sp, #4]
#ifdef EUROPE
	mov r2, #0x3c40
#else
	ldr r2, _02061F18 ; =0x00003C3E
#endif
	b _02061EE8
_02061E74:
	str r6, [sp, #4]
	ldr r2, _02061F1C ; =0x00003C3F
	b _02061EE8
_02061E80:
	str r6, [sp, #4]
#ifdef NORTH_AMERICA
	mov r2, #0x3c40
#else
	ldr r2, _02062298 ; =0x00003C42
#endif
	b _02061EE8
_02061E8C:
	str r6, [sp, #4]
	ldr r2, _02061F20 ; =0x00003C3D
	b _02061EE8
_02061E98:
	str r6, [sp, #4]
#ifdef JAPAN
	mov r2, #0x3880
#else
	ldr r2, _02061F24 ; =0x00003C42
#endif
	b _02061EE8
_02061EA4:
	ldr r2, _02061F28 ; =0x00003C43
	b _02061EE8
_02061EAC:
	str r6, [sp, #4]
	ldr r2, _02061F2C ; =0x00003C3C
	b _02061EE8
_02061EB8:
	str r6, [sp, #4]
	ldr r2, _02061F30 ; =0x00003C41
	b _02061EE8
_02061EC4:
	str r6, [sp, #4]
	ldr r2, _02061F34 ; =0x00003C44
	b _02061EE8
_02061ED0:
	str r6, [sp, #4]
	ldr r2, _02061F38 ; =0x00003C45
	b _02061EE8
_02061EDC:
	ldr r2, _02061F3C ; =0x00003C47
	b _02061EE8
_02061EE4:
	ldr r2, _02061F40 ; =0x00003C46
_02061EE8:
	add ip, sp, #4
	mov r0, r5
	mov r1, r4
	mov r3, #0
	str ip, [sp]
	bl PreprocessStringFromId
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02061F08: .word 0x00003C38 + SUB_02061DC8_WORD_OFFSET
_02061F0C: .word 0x00003C3A + SUB_02061DC8_WORD_OFFSET
_02061F10: .word 0x00003C39 + SUB_02061DC8_WORD_OFFSET
_02061F14: .word 0x00003C3B + SUB_02061DC8_WORD_OFFSET
#ifndef EUROPE
_02061F18: .word 0x00003C3E + SUB_02061DC8_WORD_OFFSET
#endif
_02061F1C: .word 0x00003C3F + SUB_02061DC8_WORD_OFFSET
#if defined(EUROPE)
_02062298: .word 0x00003C42
#elif defined(JAPAN)
_02062298: .word 0x0000387E
#endif
_02061F20: .word 0x00003C3D + SUB_02061DC8_WORD_OFFSET
#ifndef JAPAN
_02061F24: .word 0x00003C42 + SUB_02061DC8_WORD_OFFSET
#endif
_02061F28: .word 0x00003C43 + SUB_02061DC8_WORD_OFFSET
_02061F2C: .word 0x00003C3C + SUB_02061DC8_WORD_OFFSET
_02061F30: .word 0x00003C41 + SUB_02061DC8_WORD_OFFSET
_02061F34: .word 0x00003C44 + SUB_02061DC8_WORD_OFFSET
_02061F38: .word 0x00003C45 + SUB_02061DC8_WORD_OFFSET
_02061F3C: .word 0x00003C47 + SUB_02061DC8_WORD_OFFSET
_02061F40: .word 0x00003C46 + SUB_02061DC8_WORD_OFFSET
	arm_func_end sub_02061DC8

	arm_func_start sub_02061F44
sub_02061F44: ; 0x02061F44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x6c
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r1, sp, #4
	mov r0, r4
	bl sub_02060274
	ldrb r2, [sp, #0x4a]
	ldrsh ip, [r4, #0x14]
	mov r0, r6
	cmp r2, #0xe
	ldreqsh r3, [r4, #0xe]
	mov r1, r5
	ldrnesh r3, [r4, #0x10]
	str ip, [sp]
	bl sub_02061DC8
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02061F44

	arm_func_start sub_02061F90
sub_02061F90: ; 0x02061F90
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r1, sp, #0
	mov r0, r4
	bl sub_02060274
	add ip, r4, #4
	mov r3, #0
	add r0, sp, #0
	mov r1, r6
	mov r2, r5
	str ip, [sp, #8]
	str r3, [sp, #0x64]
	str r4, [sp, #0x5c]
	bl sub_02061FDC
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02061F90

	arm_func_start sub_02061FDC
sub_02061FDC: ; 0x02061FDC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x54
	mov r7, r0
	ldr r0, [r7, #8]
	mov r6, r1
	ldrb r0, [r0]
	mov r5, r2
	bl DungeonSwapIdToIdx
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	ldr r0, [r7, #0x64]
	cmp r0, #0
	ldrneb r0, [r0]
	cmpne r0, #7
	cmpne r0, #5
	beq _0206205C
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #0
	bne _0206205C
	ldr r0, [r7, #8]
	ldr r2, _020621FC ; =0x00003C35
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_0206205C:
	ldrb r0, [r7, #0x46]
	cmp r0, #0xf
	bne _020620AC
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [r7, #8]
	ldr r2, _02062200 ; =0x00003C34
	ldrneb r0, [r0, #1]
	add r4, sp, #4
	mov r1, r5
	ldreqb r0, [r0, #1]
	mov r3, #0
	rsbeq r0, r0, #0
	str r0, [sp, #0x28]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_020620AC:
	ldr r1, [r7, #0x5c]
	cmp r1, #0
	beq _020620F8
	ldrb r0, [r1, #1]
	cmp r0, #0xb
	ldreqb r0, [r1, #2]
	cmpeq r0, #5
	bne _020620F8
	ldr r0, [r7, #8]
	ldr r2, _02062204 ; =0x00003C36
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_020620F8:
	cmp r1, #0
	beq _02062150
	ldrb r0, [r1, #1]
	cmp r0, #6
	ldreqb r0, [r1, #2]
	cmpeq r0, #4
	beq _02062150
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #0
	bne _02062150
	ldr r0, [r7, #8]
	ldr r2, _020621FC ; =0x00003C35
	ldrb r1, [r0]
	add r4, sp, #4
	mov r0, r6
	str r1, [sp, #0x14]
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessStringFromId
	b _020621F4
_02062150:
	ldrb r0, [r7, #0x46]
	mov r1, #0x20000
	cmp r0, #0xc
	beq _020621A0
	ldr r2, [r7, #0x5c]
	cmp r2, #0
	beq _020621A4
	ldrb r3, [r2, #1]
	cmp r3, #0xe
	beq _020621A0
	cmp r3, #6
	ldreqb r0, [r2, #2]
	cmpeq r0, #4
	beq _020621A0
	cmp r3, #3
	ldreqb r0, [r2, #2]
	cmpeq r0, #3
	beq _020621A0
	cmp r3, #5
	bne _020621A4
_020621A0:
	mov r1, #0
_020621A4:
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	orr r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #8]
	ldrb r0, [r0]
	bl DungeonGoesUp
	cmp r0, #0
	ldr r0, [r7, #8]
	ldr r2, _02062208 ; =0x00003C32
	ldrneb r0, [r0, #1]
	add r4, sp, #4
	mov r1, r5
	ldreqb r0, [r0, #1]
	mov r3, #0
	rsbeq r0, r0, #0
	str r0, [sp, #0x28]
	mov r0, r6
	str r4, [sp]
	bl PreprocessStringFromId
_020621F4:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02061FDC_OFFSET 2
#elif defined(JAPAN)
#define SUB_02061FDC_OFFSET -0x3C2
#else
#define SUB_02061FDC_OFFSET 0
#endif
_020621FC: .word 0x00003C35 + SUB_02061FDC_OFFSET
_02062200: .word 0x00003C34 + SUB_02061FDC_OFFSET
_02062204: .word 0x00003C36 + SUB_02061FDC_OFFSET
_02062208: .word 0x00003C32 + SUB_02061FDC_OFFSET
	arm_func_end sub_02061FDC

	arm_func_start sub_0206220C
sub_0206220C: ; 0x0206220C
	stmdb sp!, {r3, lr}
	mov ip, r0
	mov r0, #0
	mov r2, r1
	mov r3, r0
	b _02062234
_02062224:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	add r3, r3, #1
	add r0, r0, r1
_02062234:
	cmp r3, ip
	blo _02062224
	mov r1, ip
	bl sub_02062248
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206220C

	arm_func_start sub_02062248
sub_02062248: ; 0x02062248
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r1
	mov r5, r2
	bl RandIntSafe
	mov r2, r4
	b _02062280
_02062264:
	mov r1, r2, lsl #1
	ldrh r1, [r5, r1]
	add r4, r4, r1
	cmp r0, r4
	movlo r0, r2
	ldmloia sp!, {r4, r5, r6, pc}
	add r2, r2, #1
_02062280:
	cmp r2, r6
	blo _02062264
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02062248

	arm_func_start sub_02062290
sub_02062290: ; 0x02062290
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	mov r0, #0x4e
	mov r1, #0xf
	mov r6, #0
	bl MemAlloc
	mov r7, r0
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _02062524
_020622B8: ; jump table
	b _020622C8 ; case 0
	b _02062360 ; case 1
	b _020623F8 ; case 2
	b _02062490 ; case 3
_020622C8:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =_020B0AD8
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_020622E8:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _0206233C
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _0206233C
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _02062324
	mov r0, fp
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0206233C
_02062324:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #4
	ldrh r1, [r1, r0]
	mov r0, sl, lsl #1
	strh r1, [r7, r0]
	b _02062344
_0206233C:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_02062344:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _020622E8
	b _02062524
_02062360:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =_020B0AD8
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_02062380:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _020623D4
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _020623D4
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _020623BC
	mov r0, fp
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _020623D4
_020623BC:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #2]
	strh r1, [r7, r0]
	b _020623DC
_020623D4:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_020623DC:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _02062380
	b _02062524
_020623F8:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =_020B0AD8
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_02062418:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _0206246C
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _0206246C
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _02062454
	mov r0, fp
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0206246C
_02062454:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #4]
	strh r1, [r7, r0]
	b _02062474
_0206246C:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_02062474:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _02062418
	b _02062524
_02062490:
	bl GetRank
	mov r8, r0
	bl GetScenarioBalance
	ldr r4, _02062544 ; =_020B0AD8
	mov sb, r0
	mov sl, r6
	mov fp, #0x16
	mov r5, r6
_020624B0:
	ldr r0, [r4, #0xc]
	add r1, r0, sl, lsl #4
	ldrb r0, [r1, #8]
	cmp r8, r0
	blo _02062504
	ldrb r0, [r1, #9]
	cmp sb, r0
	blt _02062504
	ldrh r0, [r1, #0xa]
	cmp r0, #0
	beq _020624EC
	mov r0, fp
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02062504
_020624EC:
	ldr r1, [r4, #0xc]
	mov r0, sl, lsl #1
	add r1, r1, sl, lsl #4
	ldrh r1, [r1, #6]
	strh r1, [r7, r0]
	b _0206250C
_02062504:
	mov r0, sl, lsl #1
	strh r5, [r7, r0]
_0206250C:
	mov r0, sl, lsl #1
	ldrh r0, [r7, r0]
	add sl, sl, #1
	cmp sl, #0x27
	add r6, r6, r0
	blt _020624B0
_02062524:
	ldr r0, _02062544 ; =_020B0AD8
	cmp r6, #0
	str r6, [r0, #0x20]
	str r7, [r0, #0x1c]
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02062544: .word _020B0AD8
	arm_func_end sub_02062290

	arm_func_start sub_02062548
sub_02062548: ; 0x02062548
	stmdb sp!, {r3, lr}
	ldr r0, _02062574 ; =_020B0AD8
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02062574 ; =_020B0AD8
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02062574: .word _020B0AD8
	arm_func_end sub_02062548

	arm_func_start sub_02062578
sub_02062578: ; 0x02062578
	stmdb sp!, {r4, lr}
	ldr r2, _02062768 ; =_020B0AD8
	mov r1, #0x258
	ldr r0, [r2, #0x20]
	ldr r2, [r2, #0x1c]
	bl sub_02062248
	movs r4, r0
	bmi _02062760
	ldr r0, _02062768 ; =_020B0AD8
	ldr r0, [r0, #0xc]
	add r0, r0, r4, lsl #4
	ldrh r0, [r0, #0xc]
	bl RandInt
	ldr r2, _02062768 ; =_020B0AD8
	mov r1, #0x22
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #0x18]
	add r3, r3, r4, lsl #4
	ldrh r3, [r3, #0xe]
	add r0, r3, r0
	mla r4, r0, r1, r2
	ldrb r0, [r4, #0x20]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _02062750
_020625DC: ; jump table
	b _02062750 ; case 0
	b _02062750 ; case 1
	b _02062750 ; case 2
	b _02062660 ; case 3
	b _02062750 ; case 4
	b _02062750 ; case 5
	b _02062618 ; case 6
	b _02062750 ; case 7
	b _02062750 ; case 8
	b _02062750 ; case 9
	b _02062750 ; case 10
	b _02062684 ; case 11
	b _02062750 ; case 12
	b _02062750 ; case 13
	b _020626F4 ; case 14
_02062618:
	ldrb r0, [r4, #0x21]
	cmp r0, #2
	bne _02062638
	mov r0, #6
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	moveq r0, #0
	beq _02062754
_02062638:
	ldrb r0, [r4, #0x21]
	cmp r0, #4
	bne _02062750
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl sub_02063394
	cmp r0, #0
	beq _02062750
	mov r0, #0
	b _02062754
_02062660:
	ldrb r0, [r4, #0x21]
	cmp r0, #2
	bne _02062750
	mov r0, #9
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02062750
	mov r0, #0
	b _02062754
_02062684:
	ldrb r0, [r4, #0x21]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02062750
_02062694: ; jump table
	b _02062750 ; case 0
	b _020626C0 ; case 1
	b _020626C0 ; case 2
	b _020626C0 ; case 3
	b _020626C0 ; case 4
	b _020626AC ; case 5
_020626AC:
	mov r0, #0
	bl sub_0204CA1C
	cmp r0, #0
	moveq r0, #0
	beq _02062754
_020626C0:
	ldrsh r0, [r4, #0x12]
	bl GetFirstMatchingMemberIdx
	mvn r1, #0
	cmp r0, r1
	movne r0, #0
	bne _02062754
	ldrb r0, [r4, #0x20]
	add r1, r4, #0x21
	bl sub_0205E2B8
	cmp r0, #0
	beq _02062750
	mov r0, #0
	b _02062754
_020626F4:
	ldrb r0, [r4, #0x21]
	cmp r0, #1
	bne _02062750
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #3
	moveq r0, #0
	beq _02062754
	ldrb r0, [r4, #0x20]
	add r1, r4, #0x21
	bl sub_0205E2B8
	cmp r0, #0
	beq _02062750
	ldrh r0, [r4, #0xc]
	mvn r1, #0
	mov r2, #0
	and r0, r0, #0xff
	bl sub_0205E090
	cmp r0, #0
	movne r0, #0
	bne _02062754
_02062750:
	mov r0, #1
_02062754:
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r4, pc}
_02062760:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062768: .word _020B0AD8
	arm_func_end sub_02062578

	arm_func_start sub_0206276C
sub_0206276C: ; 0x0206276C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _020627F0 ; =_020B0AD8
	mov ip, #0
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x18]
	mov r6, #0x22
	b _020627E0
_02062788:
	add lr, r4, ip, lsl #4
	ldrh r7, [lr, #0xe]
	mla r8, r7, r6, r5
	ldrb r7, [r8, #0x20]
	cmp r7, r0
	ldreqb r8, [r8, #0x21]
	ldreqb r7, [r1]
	cmpeq r8, r7
	bne _020627DC
	cmp r2, #0
	ldrneb r0, [lr, #8]
	ldr r1, [sp, #0x18]
	strneb r0, [r2]
	cmp r3, #0
	ldrneb r0, [lr, #9]
	strne r0, [r3]
	cmp r1, #0
	ldrneh r0, [lr, #0xa]
	strne r0, [r1]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020627DC:
	add ip, ip, #1
_020627E0:
	cmp ip, #0x27
	blt _02062788
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020627F0: .word _020B0AD8
	arm_func_end sub_0206276C

	arm_func_start sub_020627F4
sub_020627F4: ; 0x020627F4
	ldr r0, _02062800 ; =_020B0AD8
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_02062800: .word _020B0AD8
	arm_func_end sub_020627F4

	arm_func_start sub_02062804
sub_02062804: ; 0x02062804
	ldr r0, _02062810 ; =_020B0AD8
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
_02062810: .word _020B0AD8
	arm_func_end sub_02062804

	arm_func_start sub_02062814
sub_02062814: ; 0x02062814
	cmp r0, #0
	ldrne r1, _02062828 ; =MISSION_DUNGEON_UNLOCK_TABLE
	strne r1, [r0]
	mov r0, #3
	bx lr
	.align 2, 0
_02062828: .word MISSION_DUNGEON_UNLOCK_TABLE
	arm_func_end sub_02062814

	arm_func_start sub_0206282C
sub_0206282C: ; 0x0206282C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, #0
	ldr r4, _020628FC ; =MISSION_DUNGEON_UNLOCK_TABLE
	mov sb, r0
	mov r8, r5
_02062840:
	ldrb r0, [r4, r8, lsl #1]
	bl DungeonSwapIdToIdx
	bl GetDungeonMode
	cmp r0, #0
	bne _020628E8
	bl GetScenarioBalance
	add r1, r4, r8, lsl #1
	ldrb r1, [r1, #1]
	mov r2, r8, lsl #1
	cmp r1, r0
	bhi _020628E8
	ldrb r0, [r4, r2]
	bl GetMaxReachedFloor
	cmp r0, #0
	bne _020628E8
	ldrb r0, [r4, r8, lsl #1]
	cmp r0, #0x5b
	beq _020628E8
	mov r7, #1
	mov r6, #0
	b _020628C8
_02062894:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r1, [r0, #1]
	cmp r1, #3
	ldreqb r1, [r0, #2]
	cmpeq r1, #3
	ldreqb r1, [r0, #4]
	ldreqb r0, [r4, r8, lsl #1]
	cmpeq r1, r0
	moveq r7, #0
	beq _020628D0
	add r6, r6, #1
_020628C8:
	cmp r6, #8
	blt _02062894
_020628D0:
	cmp r7, #0
	beq _020628E8
	cmp sb, #0
	ldrneb r0, [r4, r8, lsl #1]
	strneb r0, [sb, r5]
	add r5, r5, #1
_020628E8:
	add r8, r8, #1
	cmp r8, #3
	blt _02062840
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020628FC: .word MISSION_DUNGEON_UNLOCK_TABLE
	arm_func_end sub_0206282C

	arm_func_start sub_02062900
sub_02062900: ; 0x02062900
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r6, r0
	mov r4, r2
	ldr r1, _02062940 ; =_020A3CA0
	add r0, sp, #0
	mov r2, #6
	bl MemcpySimple
	add r3, sp, #0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02062944
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02062940: .word _020A3CA0
	arm_func_end sub_02062900

	arm_func_start sub_02062944
sub_02062944: ; 0x02062944
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x12
	mov r8, r1
	mov r5, r2
	mov r4, r3
	bl RandIntSafe
	mov r0, r0, lsl #0x10
	cmp sb, #0
	mov r6, r0, lsr #0x10
	mov r7, #0
	beq _02062984
	mov r0, sb
	bl RandIntSafe
	mov r0, r0, lsl #1
	ldrsh r7, [r8, r0]
_02062984:
	bl GetRank
	cmp r0, #3
	movhs r0, #1
	movlo r0, #0
	tst r0, #0xff
	cmpne r6, #0
	moveq r0, #0
	streqh r0, [r4, #2]
	bl GetRank
	cmp r0, #4
	movhs r0, #1
	movlo r0, #0
	tst r0, #0xff
	cmpne r7, #0
	moveq r0, #0
	streqh r0, [r4, #4]
	mov r1, r4
	mov r0, #3
	bl sub_0206220C
	cmp r0, #0
	beq _020629F4
	cmp r0, #1
	beq _02062A04
	cmp r0, #2
	moveq r0, #1
	streqb r0, [r5]
	streqh r7, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020629F4:
	mov r0, #0
	strb r0, [r5]
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02062A04:
	mov r0, #0
	strb r0, [r5]
	strh r6, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02062944

	arm_func_start IsMonsterMissionAllowed
IsMonsterMissionAllowed: ; 0x02062A14
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl GetBaseForm
	bl FemaleToMaleForm
	ldr r1, _02062A54 ; =MISSION_BANNED_MONSTERS
	b _02062A3C
_02062A2C:
	cmp r0, r2
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
_02062A3C:
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	cmp r2, #0
	bne _02062A2C
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062A54: .word MISSION_BANNED_MONSTERS
	arm_func_end IsMonsterMissionAllowed

	arm_func_start CanMonsterBeUsedForMissionWrapper
CanMonsterBeUsedForMissionWrapper: ; 0x02062A58
	ldr ip, _02062A64 ; =CanMonsterBeUsedForMission
	mov r1, #1
	bx ip
	.align 2, 0
_02062A64: .word CanMonsterBeUsedForMission
	arm_func_end CanMonsterBeUsedForMissionWrapper

	arm_func_start CanMonsterBeUsedForMission
CanMonsterBeUsedForMission: ; 0x02062A68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl FemaleToMaleForm
	mov r4, r0
	bl HasMonsterBeenAttackedInDungeons
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl GetBaseForm
	cmp r4, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	beq _02062AB8
	mov r0, r4
	bl IsMonsterMissionAllowed
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02062AB8:
	mov r0, r4
	bl IsMonsterMissionAllowedStory
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanMonsterBeUsedForMission

	arm_func_start sub_02062AD0
sub_02062AD0: ; 0x02062AD0
	stmdb sp!, {r3, lr}
	bl GetBaseForm
	bl FemaleToMaleForm
	bl IsMonsterMissionAllowedStory
	ldmia sp!, {r3, pc}
	arm_func_end sub_02062AD0

	arm_func_start IsMonsterMissionAllowedStory
IsMonsterMissionAllowedStory: ; 0x02062AE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #9
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02062B58
	mov r2, #0
	ldr r0, _02062B60 ; =MISSION_BANNED_STORY_MONSTERS
	b _02062B18
_02062B08:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r2, r2, #1
_02062B18:
	mov r1, r2, lsl #1
	ldrsh r1, [r0, r1]
	cmp r1, #0
	bne _02062B08
	bl GetHero
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl GetPartner
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02062B58:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062B60: .word MISSION_BANNED_STORY_MONSTERS
	arm_func_end IsMonsterMissionAllowedStory

	arm_func_start IsMonsterIllegalForMissions
IsMonsterIllegalForMissions: ; 0x02062B64
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsMonsterValid
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _02062BB0 ; =0x00000217
	cmp r4, r0
	blt _02062B90
	cmp r4, #0x228
	ble _02062BA0
_02062B90:
	cmp r4, #0x180
	ldrne r0, _02062BB4 ; =0x00000117
	cmpne r4, r0
	bne _02062BA8
_02062BA0:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02062BA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062BB0: .word 0x00000217
_02062BB4: .word 0x00000117
	arm_func_end IsMonsterIllegalForMissions

	arm_func_start CanDungeonBeUsedForMission
CanDungeonBeUsedForMission: ; 0x02062BB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl DungeonSwapIdToIdx
	cmp r5, #0x36
	mov r4, r0
	cmpne r5, #0x68
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0x7b
	blo _02062BEC
	cmp r5, #0xa3
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_02062BEC:
	cmp r5, #0xaf
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	add r0, r5, #0xe8
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02062C1C
	mov r0, #9
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_02062C1C:
	mvn r0, #0
	cmp r4, r0
	beq _02062C44
	cmp r4, #0xb4
	bge _02062C44
	mov r0, r4
	bl GetDungeonMode
	cmp r0, #3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_02062C44:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CanDungeonBeUsedForMission

	arm_func_start sub_02062C4C
sub_02062C4C: ; 0x02062C4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	cmp sl, #0
	mov sb, r1
	mov r8, r2
	str r3, [sp]
	movle r0, #0
	ble _02062D38
	bl RandIntSafe
	mov r6, r0
	mov fp, r6
_02062C7C:
	ldrb r4, [sb, r6]
	mov r0, r4
	bl GetNbFloors
	mov r7, r0
	cmp r4, #0xae
	addne r7, r7, #1
	add r0, r7, r7, lsr #31
	mov r0, r0, asr #1
	mov r1, r7
	str r0, [sp, #8]
	bl RandRangeSafe
	mov r5, r0
	str r5, [sp, #4]
_02062CB0:
	strb r4, [sp, #0x10]
	strb r5, [sp, #0x11]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	bl IsForbiddenFloor
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #0xc]
	ldr r2, [sp]
	mov r0, r4
	mov r1, r5
	bl sub_0205E090
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #0xc]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	strneb r4, [r8]
	strneb r5, [r8, #1]
	movne r0, #1
	bne _02062D38
	add r5, r5, #1
	cmp r5, r7
	ldrge r5, [sp, #8]
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _02062CB0
	add r6, r6, #1
	cmp r6, sl
	moveq r6, #0
	cmp r6, fp
	bne _02062C7C
	mov r0, #0
_02062D38:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02062C4C

	arm_func_start sub_02062D40
sub_02062D40: ; 0x02062D40
	stmdb sp!, {r3, lr}
	bl sub_0204F7A8
	cmp r0, #7
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02062D40

	arm_func_start sub_02062D5C
sub_02062D5C: ; 0x02062D5C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0204F7A8
	cmp r4, #2
	cmpne r4, #3
	cmpne r4, #4
	cmpne r4, #5
	beq _02062D8C
	add r1, r4, #0xf7
	and r1, r1, #0xff
	cmp r1, #1
	bhi _02062D90
_02062D8C:
	add r0, r0, #1
_02062D90:
	cmp r0, #0xf
	movgt r0, #0xf
	ldmia sp!, {r4, pc}
	arm_func_end sub_02062D5C

	arm_func_start sub_02062D9C
sub_02062D9C: ; 0x02062D9C
	stmdb sp!, {r3, lr}
	bl sub_02062D5C
	and r0, r0, #0xff
	cmp r0, #0x10
	movhs r0, #0xf
	ldmia sp!, {r3, pc}
	arm_func_end sub_02062D9C

	arm_func_start sub_02062DB4
sub_02062DB4: ; 0x02062DB4
	ldr r1, _02062DC0 ; =RANK_STRING_PTR_TABLE
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_02062DC0: .word RANK_STRING_PTR_TABLE
	arm_func_end sub_02062DB4

	arm_func_start sub_02062DC4
sub_02062DC4: ; 0x02062DC4
	stmdb sp!, {r3, lr}
	bl sub_02062D5C
	ldr r1, _02062DD8 ; =MISSION_RANK_POINTS
	ldr r0, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02062DD8: .word MISSION_RANK_POINTS
	arm_func_end sub_02062DC4

	arm_func_start CanSendItem
CanSendItem: ; 0x02062DDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _02062DFC
	bl IsItemInTimeDarkness
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02062DFC:
	mov r2, #0
	ldr r0, _02062E30 ; =NO_SEND_ITEM_TABLE
	b _02062E18
_02062E08:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r2, r2, #1
_02062E18:
	mov r1, r2, lsl #1
	ldrsh r1, [r0, r1]
	cmp r1, #0
	bne _02062E08
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02062E30: .word NO_SEND_ITEM_TABLE
	arm_func_end CanSendItem

	arm_func_start sub_02062E34
sub_02062E34: ; 0x02062E34
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldrnesh r4, [r0, #0xa0]
	ldreqsh r4, [r0, #0xa2]
	ldrb r0, [r0, #0xae]
	bl sub_0205BD5C
	mov r1, r0
	mov r0, r4
	bl CanSendItem
	ldmia sp!, {r4, pc}
	arm_func_end sub_02062E34

	arm_func_start sub_02062E5C
sub_02062E5C: ; 0x02062E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldrb r1, [r5, #1]
	add r0, r5, #4
	bl sub_02062D9C
	mov ip, #0
	str ip, [r4, #8]
	mov r3, ip
	mov r1, #6
_02062E84:
	mla r2, ip, r1, r4
	add ip, ip, #1
	strh r3, [r2, #0x14]
	cmp ip, #3
	blt _02062E84
	add r1, r0, #1
	mov r0, #0x32
	mul r0, r1, r0
	str r0, [r4, #8]
	ldrb r0, [r5, #0x16]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0206305C
_02062EB8: ; jump table
	b _02062ED4 ; case 0
	b _02062EE4 ; case 1
	b _02062F04 ; case 2
	b _02062F38 ; case 3
	b _02062FD8 ; case 4
	b _0206300C ; case 5
	b _02063038 ; case 6
_02062ED4:
	strb r3, [r4, #2]
	mov r0, #1
	str r0, [r4, #0xc]
	b _02063074
_02062EE4:
	mov r2, #1
	strb r2, [r4, #2]
	ldrsh r1, [r5, #0x18]
	mov r0, #0xa
	strh r1, [r4, #0x14]
	strh r0, [r4, #0x12]
	str r2, [r4, #0xc]
	b _02063074
_02062F04:
	mov r0, #2
	strb r0, [r4, #2]
	ldrsh r2, [r5, #0x18]
	mov r0, #1
	mov r1, #0xa
	strh r2, [r4, #0x14]
	strh r1, [r4, #0x12]
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	sub r0, r0, #2
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02062F38:
	mov r0, #3
	strb r0, [r4, #2]
	ldrsh r1, [r5, #0x18]
	mov r0, #0xa
	strh r1, [r4, #0x14]
	strh r0, [r4, #0x12]
_02062F50:
	ldrb r1, [r5, #1]
	add r0, r5, #4
	add r2, r4, #0x1a
	bl sub_020630A4
	ldrsh r1, [r4, #0x14]
	ldrsh r0, [r4, #0x1a]
	cmp r1, r0
	beq _02062F50
	mov r0, #0xa
	strh r0, [r4, #0x18]
	mov r0, #2
	str r0, [r4, #0xc]
	bl RandInt
	cmp r0, #0
	beq _02062FC4
_02062F8C:
	ldrb r1, [r5, #1]
	add r0, r5, #4
	add r2, r4, #0x20
	bl sub_020630A4
	ldrsh r1, [r4, #0x20]
	ldrsh r0, [r4, #0x14]
	cmp r0, r1
	ldrnesh r0, [r4, #0x1a]
	cmpne r0, r1
	beq _02062F8C
	mov r0, #0xa
	strh r0, [r4, #0x1e]
	mov r0, #3
	str r0, [r4, #0xc]
_02062FC4:
	ldr r1, [r4, #8]
	mvn r0, #0
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02062FD8:
	mov r0, #4
	strb r0, [r4, #2]
	ldrsh r2, [r5, #0x18]
	mov r0, #1
	mov r1, #0xa
	strh r2, [r4, #0x14]
	strh r1, [r4, #0x12]
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	sub r0, r0, #2
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_0206300C:
	mov r1, #5
	mov r0, #1
	strb r1, [r4, #2]
	strb r0, [r4, #0x22]
	ldrsh r1, [r5, #0x18]
	sub r0, r0, #2
	strh r1, [r4, #0x24]
	ldr r1, [r4, #8]
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_02063038:
	mov r0, #6
	strb r0, [r4, #2]
	ldrsh r1, [r5, #0x18]
	sub r0, r0, #7
	strh r1, [r4, #0x24]
	ldr r1, [r4, #8]
	mul r0, r1, r0
	str r0, [r4, #8]
	b _02063074
_0206305C:
	mov r0, #7
	strb r0, [r4, #2]
	ldr r1, [r4, #8]
	sub r0, r0, #8
	mul r0, r1, r0
	str r0, [r4, #8]
_02063074:
	ldrsh r1, [r5, #0xe]
	add r0, r5, #4
	strh r1, [r4]
	ldrb r1, [r5, #1]
	bl sub_02062D5C
	ldr r1, _02063098 ; =MISSION_RANK_POINTS
	ldr r0, [r1, r0, lsl #2]
	str r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063098: .word MISSION_RANK_POINTS
	arm_func_end sub_02062E5C

	arm_func_start sub_0206309C
sub_0206309C: ; 0x0206309C
	mov r0, #0xa
	bx lr
	arm_func_end sub_0206309C

	arm_func_start sub_020630A4
sub_020630A4: ; 0x020630A4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r2
	mov r5, #1
	bl sub_02062D5C
	mov r6, r0
	mov r0, r8
	mov r1, r6
	bl RetrieveFromItemList2
	mov r4, #0
	b _020630E0
_020630D0:
	mov r0, r8
	mov r1, r6
	mov r5, r4
	bl RetrieveFromItemList2
_020630E0:
	cmp r5, #0
	bne _020630D0
	strh r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020630A4

	arm_func_start sub_020630F0
sub_020630F0: ; 0x020630F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	mov r1, #0
	bl GetExclusiveItem
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetExclusiveItem
	mov r4, r0
	cmp r5, #0
	cmpeq r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	streqh r4, [r6]
	beq _02063154
	cmp r4, #0
	streqh r5, [r6]
	beq _02063154
	mov r0, #2
	bl RandInt
	cmp r0, #0
	moveq r5, r4
	strh r5, [r6]
_02063154:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020630F0

	arm_func_start sub_0206315C
sub_0206315C: ; 0x0206315C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldrb r0, [r4, #1]
	cmp r0, #6
	beq _020631D8
	cmp r0, #0xa
	beq _02063188
	cmp r0, #0xb
	beq _020631B4
	b _020631F4
_02063188:
	ldr r1, _02063230 ; =OUTLAW_MISSION_REWARD_TYPE_WEIGHTS
	add r0, sp, #0
	mov r2, #0xe
	bl MemcpySimple
	mov r0, #0
	strh r0, [sp, #0xc]
	ldrsh r2, [r4, #0x10]
	add r1, sp, #0
	mov r0, r4
	bl sub_02063240
	b _02063228
_020631B4:
	ldrb r0, [r4, #2]
	cmp r0, #1
	blo _020631D8
	cmp r0, #5
	movls r0, #6
	strlsb r0, [r4, #0x16]
	ldrlssh r0, [r4, #0xe]
	strlsh r0, [r4, #0x18]
	bls _02063228
_020631D8:
	ldrb r0, [r4, #2]
	cmp r0, #4
	moveq r1, #4
	ldreq r0, _02063234 ; =0x0000031E
	streqb r1, [r4, #0x16]
	streqh r0, [r4, #0x18]
	beq _02063228
_020631F4:
	cmp r1, #0
	add r0, sp, #0
	mov r2, #0xe
	beq _02063210
	ldr r1, _02063238 ; =DEFAULT_MISSION_REWARD_TYPE_WEIGHTS
	bl MemcpySimple
	b _02063218
_02063210:
	ldr r1, _0206323C ; =CAFE_MISSION_REWARD_TYPE_WEIGHTS
	bl MemcpySimple
_02063218:
	ldrsh r2, [r4, #0xe]
	add r1, sp, #0
	mov r0, r4
	bl sub_02063240
_02063228:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02063230: .word OUTLAW_MISSION_REWARD_TYPE_WEIGHTS
_02063234: .word 0x0000031E
_02063238: .word DEFAULT_MISSION_REWARD_TYPE_WEIGHTS
_0206323C: .word CAFE_MISSION_REWARD_TYPE_WEIGHTS
	arm_func_end sub_0206315C

	arm_func_start sub_02063240
sub_02063240: ; 0x02063240
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov r0, #3
	mov r1, #0xc
	mov r2, #0
	bl sub_0204C6C8
	cmp r0, #0
	movne r0, #0
	strneh r0, [r6, #0xa]
	mov r0, #3
	mov r1, #6
	mov r2, #0
	bl sub_0204C6C8
	cmp r0, #0
	movne r0, #0
	strneh r0, [r6, #0xc]
	mov r0, #3
	mov r1, #8
	mov r2, #0
	bl sub_0204C6C8
	cmp r0, #0
	bne _020632B8
	ldrb r1, [r4, #1]
	add r0, r4, #4
	bl sub_02062D9C
	cmp r0, #0xb
	bge _020632C0
_020632B8:
	mov r0, #0
	strh r0, [r6, #8]
_020632C0:
	mov r1, r6
	mov r0, #7
	bl sub_0206220C
	and r1, r0, #0xff
	strb r0, [r4, #0x16]
	cmp r1, #6
	ldreqsh r0, [r4, #0xe]
	streqh r0, [r4, #0x18]
	beq _0206338C
	cmp r1, #4
	bne _0206336C
	add r1, sp, #0
	mov r0, r5
	bl sub_020630F0
	cmp r0, #0
	bne _02063360
	mov r0, r5
	mov r1, #0
	bl GetType
	mov r6, r0
	mov r0, r5
	mov r1, #1
	bl GetType
	movs r5, r0
	beq _02063334
	mov r0, #2
	bl RandInt
	cmp r0, #0
	beq _0206334C
_02063334:
	sub r0, r6, #1
	mov r0, r0, lsl #2
	add r0, r0, #0xfb
	add r0, r0, #0x100
	strh r0, [sp]
	b _02063360
_0206334C:
	sub r0, r5, #1
	mov r0, r0, lsl #2
	add r0, r0, #0xfb
	add r0, r0, #0x100
	strh r0, [sp]
_02063360:
	ldrsh r0, [sp]
	strh r0, [r4, #0x18]
	b _0206338C
_0206336C:
	ldrb r1, [r4, #1]
	add r0, r4, #4
	add r2, r4, #0x18
	bl sub_020630A4
	ldrsh r1, [r4, #0x14]
	ldrsh r0, [r4, #0x18]
	cmp r1, r0
	beq _0206336C
_0206338C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_02063240

	arm_func_start sub_02063394
sub_02063394: ; 0x02063394
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl DungeonSwapIdToIdx
	mov r5, r0
	mov r4, #0
	ldr r1, _0206341C ; =MISSION_DUNGEON_UNLOCK_TABLE
	b _0206340C
_020633B0:
	ldrb r0, [r1, r4, lsl #1]
	cmp r6, r0
	bne _02063408
	bl GetScenarioBalance
	ldr r1, _02063420 ; =_020A3CAD
	ldrb r1, [r1, r4, lsl #1]
	cmp r1, r0
	movhi r0, #1
	ldmhiia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #0
	bne _020633F8
	ldr r0, _0206341C ; =MISSION_DUNGEON_UNLOCK_TABLE
	ldrb r0, [r0, r4, lsl #1]
	bl GetMaxReachedFloor
	cmp r0, #0
	beq _02063400
_020633F8:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_02063400:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02063408:
	add r4, r4, #1
_0206340C:
	cmp r4, #3
	blt _020633B0
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206341C: .word MISSION_DUNGEON_UNLOCK_TABLE
_02063420: .word _020A3CAD
	arm_func_end sub_02063394

	arm_func_start sub_02063424
sub_02063424: ; 0x02063424
	stmdb sp!, {r4, lr}
	cmp r0, #0xb
	ldreqb r0, [r1]
	mov r4, r2
	cmpeq r0, #5
	mov r0, r4
	bne _02063448
	bl GetNbFloors
	ldmia sp!, {r4, pc}
_02063448:
	bl GetNbFloors
	cmp r4, #0xae
	addne r0, r0, #1
	sub r0, r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_02063424

	arm_func_start IsAvailableItem
IsAvailableItem: ; 0x0206345C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _02063498
_0206346C:
	and r0, r4, #0xff
	bl GetMaxReachedFloor
	cmp r0, #0
	beq _02063494
	mov r1, r5
	and r0, r4, #0xff
	bl IsItemAvailableInDungeonGroup
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_02063494:
	add r4, r4, #1
_02063498:
	cmp r4, #0xb4
	blt _0206346C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end IsAvailableItem

	arm_func_start GetAvailableItemDeliveryList
GetAvailableItemDeliveryList: ; 0x020634A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, #0
	ldr r4, _020634F0 ; =ITEM_DELIVERY_TABLE
	mov r8, r0
	mov r5, r6
_020634BC:
	mov r0, r5, lsl #1
	ldrsh r7, [r4, r0]
	mov r0, r7
	bl IsAvailableItem
	cmp r0, #0
	movne r0, r6, lsl #1
	add r5, r5, #1
	strneh r7, [r8, r0]
	addne r6, r6, #1
	cmp r5, #0x16
	blt _020634BC
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020634F0: .word ITEM_DELIVERY_TABLE
	arm_func_end GetAvailableItemDeliveryList

	arm_func_start sub_020634F4
sub_020634F4: ; 0x020634F4
	ldr r1, _02063500 ; =_020B0AD8
	str r0, [r1]
	bx lr
	.align 2, 0
_02063500: .word _020B0AD8
	arm_func_end sub_020634F4

	arm_func_start sub_02063504
sub_02063504: ; 0x02063504
	ldr r0, _02063518 ; =_020B0AD8
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_02063518: .word _020B0AD8
	arm_func_end sub_02063504

	arm_func_start sub_0206351C
sub_0206351C: ; 0x0206351C
	mov ip, #0
	strh ip, [r0]
	str ip, [r0, #8]
	str ip, [r0, #0xc]
	mov r3, ip
	mov r1, #6
_02063534:
	mla r2, ip, r1, r0
	add ip, ip, #1
	strh r3, [r2, #0x14]
	cmp ip, #3
	blt _02063534
	strb r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0206351C

	arm_func_start sub_02063560
sub_02063560: ; 0x02063560
	stmdb sp!, {r3, lr}
	ldrsh r2, [r1]
	cmp r2, #0
	beq _020635BC
	mov r2, #0x8000
	strh r2, [r0]
	ldrsh r2, [r1, #2]
	add ip, r1, #4
	add r3, r0, #0x14
	strh r2, [r0, #4]
	ldrsh lr, [r1, #2]
	mov r2, #4
	strh lr, [r0, #2]
	str ip, [r0, #8]
	str ip, [r0, #0xc]
	ldrsh r1, [r1]
	add r1, ip, r1, lsl #2
	str r1, [r0, #0x10]
_020635A8:
	ldrb r0, [ip], #1
	subs r2, r2, #1
	strb r0, [r3], #1
	bne _020635A8
	ldmia sp!, {r3, pc}
_020635BC:
	mov r1, #0
	strh r1, [r0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_02063560

	arm_func_start sub_020635C8
sub_020635C8: ; 0x020635C8
	ldr ip, _020635D4 ; =MemZero
	mov r1, #0xc
	bx ip
	.align 2, 0
_020635D4: .word MemZero
	arm_func_end sub_020635C8

	arm_func_start sub_020635D8
sub_020635D8: ; 0x020635D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	bl UnloadFile
	mov r0, r4
	mov r1, #0xc
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_020635D8

	arm_func_start sub_02063600
sub_02063600: ; 0x02063600
	ldr ip, _0206360C ; =MemZero
	mov r1, #0x18
	bx ip
	.align 2, 0
_0206360C: .word MemZero
	arm_func_end sub_02063600

	arm_func_start sub_02063610
sub_02063610: ; 0x02063610
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063610

	arm_func_start sub_02063628
sub_02063628: ; 0x02063628
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r1, #0x18
	mov r7, r0
	mov r5, r2
	bl MemZero
	mov r0, #0x18
	mul r4, r5, r0
	mov r0, r4
	mov r1, #0
	str r5, [r7, #0xc]
	bl MemAlloc
	mov r1, r4
	str r0, [r7, #8]
	bl MemZero
	mov r0, r7
	str r6, [r7, #4]
	bl sub_020636A8
	mov r0, #0x1f
	str r0, [r7, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02063628

	arm_func_start sub_0206367C
sub_0206367C: ; 0x0206367C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02063610
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	bl MemFree
	mov r0, r4
	mov r1, #0x18
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206367C

	arm_func_start sub_020636A8
sub_020636A8: ; 0x020636A8
	ldr r1, [r0]
	cmp r1, #0
	beq _020636F0
	ldr r1, [r1]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	bx lr
_020636C4: ; jump table
	b _020636D8 ; case 0
	b _020636E4 ; case 1
	b _020636E4 ; case 2
	b _020636E4 ; case 3
	b _020636E4 ; case 4
_020636D8:
	mov r1, #0
	strb r1, [r0, #0x14]
	bx lr
_020636E4:
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
_020636F0:
	ldr r1, [r0, #4]
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	bx lr
_02063708: ; jump table
	b _0206371C ; case 0
	b _02063728 ; case 1
	b _02063728 ; case 2
	b _02063728 ; case 3
	b _02063728 ; case 4
_0206371C:
	mov r1, #0
	strb r1, [r0, #0x14]
	bx lr
_02063728:
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020636A8

	arm_func_start sub_02063734
sub_02063734: ; 0x02063734
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	mov r4, #0x18
	b _02063764
_02063750:
	ldr r0, [r8, #8]
	ldr r1, [r7, r5, lsl #2]
	mla r0, r5, r4, r0
	bl sub_02063560
	add r5, r5, #1
_02063764:
	cmp r5, r6
	blt _02063750
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02063734

	arm_func_start sub_02063770
sub_02063770: ; 0x02063770
	ldrb r0, [r0, #0x15]
	bx lr
	arm_func_end sub_02063770

	arm_func_start sub_02063778
sub_02063778: ; 0x02063778
	mov r2, #0x18
	mul r2, r1, r2
	ldr r0, [r0, #8]
	ldrh r0, [r0, r2]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063778

	arm_func_start sub_0206379C
sub_0206379C: ; 0x0206379C
	mov r2, #0x18
	mul r2, r1, r2
	ldr r0, [r0, #8]
	ldrh r0, [r0, r2]
	tst r0, #0x8000
	beq _020637C0
	tst r0, #0x2000
	movne r0, #1
	bxne lr
_020637C0:
	mov r0, #0
	bx lr
	arm_func_end sub_0206379C

	arm_func_start sub_020637C8
sub_020637C8: ; 0x020637C8
	stmdb sp!, {r4, lr}
	ldrb ip, [sp, #8]
	mov r4, r0
	mov r0, r4
	cmp ip, #0
	addne r3, r3, r2, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bl sub_0200A29C
	mov r0, r4
	bl sub_0200A174
	ldmia sp!, {r4, pc}
	arm_func_end sub_020637C8

	arm_func_start sub_020637FC
sub_020637FC: ; 0x020637FC
	stmdb sp!, {r4, lr}
	ldrb ip, [sp, #8]
	mov r4, r0
	mov r0, r4
	cmp ip, #0
	addne r3, r3, r2, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bl sub_0200A590
	mov r0, r4
	bl sub_0200A504
	ldmia sp!, {r4, pc}
	arm_func_end sub_020637FC

	arm_func_start sub_02063830
sub_02063830: ; 0x02063830
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r3
	mov r5, r6
	ldr r7, [sp, #0x28]
	b _0206394C
_02063854:
	mov r0, sl
	mov r1, r5
	bl sub_02063778
	cmp r0, #0
	beq _02063948
	mov r0, sl
	mov r1, r5
	bl sub_0206379C
	cmp r0, #0
	bne _02063948
	ldr r1, [sl, #8]
	mov r0, #0x18
	mla r4, r5, r0, r1
	mov r0, #0
	strb r0, [sl, #0x15]
	ldrsh r0, [r4, #4]
	sub r0, r0, #1
	strh r0, [r4, #4]
	ldrsh r0, [r4, #4]
	cmp r0, #0
	bgt _020638F4
	ldrsh r0, [r4, #2]
	add r2, r4, #0x14
	strh r0, [r4, #4]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	ldrhs r1, [r4, #8]
	movhs r0, #1
	strhs r1, [r4, #0xc]
	strhsb r0, [sl, #0x15]
	ldr r3, [r4, #0xc]
	mov r1, #4
	add r0, r3, #4
	str r0, [r4, #0xc]
_020638E0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020638E0
	mov r6, #1
_020638F4:
	cmp r7, #0
	cmpeq r6, #0
	beq _02063948
	ldr r0, [sl]
	cmp r0, #0
	beq _02063924
	ldrb ip, [sl, #0x14]
	mov r2, sb
	add r1, r4, #0x14
	add r3, r8, r5
	str ip, [sp]
	bl sub_020637C8
_02063924:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _02063948
	ldrb ip, [sl, #0x14]
	mov r2, sb
	add r1, r4, #0x14
	add r3, r8, r5
	str ip, [sp]
	bl sub_020637FC
_02063948:
	add r5, r5, #1
_0206394C:
	cmp r5, fp
	blt _02063854
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02063830

	arm_func_start sub_0206395C
sub_0206395C: ; 0x0206395C
	stmdb sp!, {r3, lr}
	ldr r0, _020639AC ; =0x00000668
	mov r1, #0
	bl MemAlloc
	ldr r2, _020639B0 ; =_020B0B04
	ldr r1, _020639AC ; =0x00000668
	str r0, [r2]
	bl MemZero
	ldr r0, _020639B0 ; =_020B0B04
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x664]
	ldr r0, [r0]
	add r0, r0, #0x58
	bl sub_02064AB0
	ldr r0, _020639B0 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, #0x58
	bl sub_02064ADC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020639AC: .word 0x00000668
_020639B0: .word _020B0B04
	arm_func_end sub_0206395C

	arm_func_start sub_020639B4
sub_020639B4: ; 0x020639B4
	stmdb sp!, {r4, lr}
	ldr ip, _020639E4 ; =_020B0B04
	mov r4, r0
	ldr r0, [ip]
	mov lr, r1
	mov ip, r2
	add r0, r0, r3, lsl #5
	mov r1, r4
	mov r2, lr
	mov r3, ip
	bl sub_020646CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_020639E4: .word _020B0B04
	arm_func_end sub_020639B4

	arm_func_start sub_020639E8
sub_020639E8: ; 0x020639E8
	ldr r2, _02063A04 ; =_020B0B04
	ldr ip, _02063A08 ; =sub_02064C18
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x40
	bx ip
	.align 2, 0
_02063A04: .word _020B0B04
_02063A08: .word sub_02064C18
	arm_func_end sub_020639E8

	arm_func_start sub_02063A0C
sub_02063A0C: ; 0x02063A0C
	ldr r1, _02063A1C ; =_020B0B04
	ldr r1, [r1]
	strb r0, [r1, #0x664]
	bx lr
	.align 2, 0
_02063A1C: .word _020B0B04
	arm_func_end sub_02063A0C

	arm_func_start sub_02063A20
sub_02063A20: ; 0x02063A20
	ldr r0, _02063A30 ; =_020B0B04
	ldr r0, [r0]
	ldrb r0, [r0, #0x664]
	bx lr
	.align 2, 0
_02063A30: .word _020B0B04
	arm_func_end sub_02063A20

	arm_func_start sub_02063A34
sub_02063A34: ; 0x02063A34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl sub_02063BB8
	movs r4, r0
	mov r0, #0
	bne _02063B20
	cmp r5, #1
	bne _02063A98
	mov r2, r4
	mov r1, #2
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063A98:
	cmp r5, #2
	bne _02063AE0
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #1
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063AE0:
	mov r2, r4
	mov r1, #1
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063B20:
	cmp r5, #1
	mov r2, r4
	bne _02063B68
	mov r1, #2
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	b _02063BA0
_02063B68:
	mov r1, #1
	bl sub_020090A0
	mov r2, r4
	mov r0, #1
	mov r1, #0
	bl sub_020090A0
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
	mov r0, #3
	mov r1, r0
	mov r2, r4
	bl sub_020090A0
_02063BA0:
	ldr r0, _02063BB4 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, r4
	strb r5, [r0, #0x660]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063BB4: .word _020B0B04
	arm_func_end sub_02063A34

	arm_func_start sub_02063BB8
sub_02063BB8: ; 0x02063BB8
	cmp r0, #0
	cmpne r0, #2
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02063BB8

	arm_func_start sub_02063BCC
sub_02063BCC: ; 0x02063BCC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl sub_02063BB8
	mov r4, r0
	cmp r5, #1
	beq _02063BFC
	cmp r5, #2
	beq _02063C60
	cmp r5, #3
	beq _02063CB4
	b _02063D18
_02063BFC:
	mov r2, r4
	mov r0, #0
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r0, #0xff
	mov r1, #0
	mov r2, r4
	bl sub_020094C4
	b _02063DCC
_02063C60:
	mov r2, r4
	mov r0, #0
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	b _02063DCC
_02063CB4:
	mov r2, r4
	mov r0, #0
	mov r1, #2
	bl sub_02009454
	mov r0, #1
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r0, #0xff
	mov r1, #0
	mov r2, r4
	bl sub_020094C4
	b _02063DCC
_02063D18:
	cmp r4, #0
	mov r2, r4
	mov r0, #0
	bne _02063D74
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	b _02063DBC
_02063D74:
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #1
	mov r1, #2
	bl sub_02009454
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
_02063DBC:
	mov r0, #0x40
	mov r1, r0
	mov r2, r4
	bl sub_020094C4
_02063DCC:
	ldr r0, _02063DE0 ; =_020B0B04
	ldr r0, [r0]
	add r0, r0, r4
	strb r5, [r0, #0x662]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02063DE0: .word _020B0B04
	arm_func_end sub_02063BCC

	arm_func_start sub_02063DE4
sub_02063DE4: ; 0x02063DE4
	stmdb sp!, {r3, lr}
	ldr r0, _02063E1C ; =_020B0B04
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x58
	bl sub_02064AFC
	ldr r0, _02063E1C ; =_020B0B04
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02063E1C ; =_020B0B04
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063E1C: .word _020B0B04
	arm_func_end sub_02063DE4

	arm_func_start sub_02063E20
sub_02063E20: ; 0x02063E20
	ldr r2, _02063E3C ; =_020B0B04
	mov r3, r0
	ldr r0, [r2]
	ldr ip, _02063E40 ; =sub_02064664
	add r0, r0, r1, lsl #5
	mov r1, r3
	bx ip
	.align 2, 0
_02063E3C: .word _020B0B04
_02063E40: .word sub_02064664
	arm_func_end sub_02063E20

	arm_func_start sub_02063E44
sub_02063E44: ; 0x02063E44
	stmdb sp!, {r3, lr}
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	ldr r1, _02063E64 ; =_020B0B04
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bl sub_0206466C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063E64: .word _020B0B04
	arm_func_end sub_02063E44

	arm_func_start sub_02063E68
sub_02063E68: ; 0x02063E68
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02063E68

	arm_func_start sub_02063E7C
sub_02063E7C: ; 0x02063E7C
	ldr r1, _02063E90 ; =_020B0B04
	ldr ip, _02063E94 ; =sub_020646E0
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_02063E90: .word _020B0B04
_02063E94: .word sub_020646E0
	arm_func_end sub_02063E7C

	arm_func_start sub_02063E98
sub_02063E98: ; 0x02063E98
	ldr r1, _02063EAC ; =_020B0B04
	ldr ip, _02063EB0 ; =sub_020646E8
	ldr r1, [r1]
	add r0, r1, r0, lsl #5
	bx ip
	.align 2, 0
_02063EAC: .word _020B0B04
_02063EB0: .word sub_020646E8
	arm_func_end sub_02063E98

	arm_func_start sub_02063EB4
sub_02063EB4: ; 0x02063EB4
	stmdb sp!, {r3, lr}
	ldr r3, _02063EDC ; =_020B0B04
	mov ip, r0
	ldr r0, [r3]
	mov r3, r1
	add r0, r0, r2, lsl #5
	mov r1, ip
	mov r2, r3
	bl sub_02064758
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063EDC: .word _020B0B04
	arm_func_end sub_02063EB4

	arm_func_start sub_02063EE0
sub_02063EE0: ; 0x02063EE0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	ldr ip, _02063F2C ; =_020B0B04
	ldrb r4, [sp, #0x18]
	ldr r5, [ip]
	mov ip, #0x60
	str r3, [sp]
	mov r3, r2
	mov r2, r1
	ldr r1, [sp, #0x1c]
	str r4, [sp, #4]
	smlabb r0, r0, ip, r5
	str r1, [sp, #8]
	ldr lr, [sp, #0x20]
	ldr r1, [r0, #0xb0]
	add r0, r5, lr, lsl #5
	bl sub_0206478C
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02063F2C: .word _020B0B04
	arm_func_end sub_02063EE0

	arm_func_start sub_02063F30
sub_02063F30: ; 0x02063F30
	stmdb sp!, {r4, r5, r6, lr}
	ldr ip, _02063F74 ; =_020B0B04
	mov r5, r1
	ldr ip, [ip]
	mov r6, r0
	mov r1, r3
	add r0, ip, #0x40
	mov r4, r2
	bl sub_02064C58
	ldr r0, _02063F74 ; =_020B0B04
	mov r1, r6
	ldr r0, [r0]
	mov r2, r5
	mov r3, r4
	add r0, r0, #0x40
	bl sub_02064CC8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02063F74: .word _020B0B04
	arm_func_end sub_02063F30

	arm_func_start sub_02063F78
sub_02063F78: ; 0x02063F78
	stmdb sp!, {r3, lr}
	ldr r3, _02063FA0 ; =_020B0B04
	mov lr, r1
	ldr ip, [r3]
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0x40
	bl sub_02064C60
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063FA0: .word _020B0B04
	arm_func_end sub_02063F78

	arm_func_start sub_02063FA4
sub_02063FA4: ; 0x02063FA4
	ldr r2, _02063FC0 ; =_020B0B04
	ldr ip, _02063FC4 ; =sub_02064C90
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x40
	bx ip
	.align 2, 0
_02063FC0: .word _020B0B04
_02063FC4: .word sub_02064C90
	arm_func_end sub_02063FA4

	arm_func_start sub_02063FC8
sub_02063FC8: ; 0x02063FC8
	stmdb sp!, {r3, lr}
	ldr r3, _02063FF0 ; =_020B0B04
	mov lr, r1
	ldr ip, [r3]
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0x58
	bl sub_02064B0C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02063FF0: .word _020B0B04
	arm_func_end sub_02063FC8

	arm_func_start sub_02063FF4
sub_02063FF4: ; 0x02063FF4
	ldr r2, _0206400C ; =_020B0B04
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02064010 ; =sub_02064C0C
	add r0, r0, #0x58
	bx ip
	.align 2, 0
_0206400C: .word _020B0B04
_02064010: .word sub_02064C0C
	arm_func_end sub_02063FF4

	arm_func_start sub_02064014
sub_02064014: ; 0x02064014
	stmdb sp!, {r3, lr}
	ldr ip, _02064048 ; =_020B0B04
	mov r3, #0x60
	ldr ip, [ip]
	mov lr, r1
	smlabb r0, r0, r3, ip
	ldr r3, [r0, #0xb0]
	add r0, ip, r2, lsl #5
	ldr r1, [r3, #0xc]
	ldr r3, [r3, #8]
	mov r2, lr
	bl sub_020646F0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02064048: .word _020B0B04
	arm_func_end sub_02064014

	arm_func_start sub_0206404C
sub_0206404C: ; 0x0206404C
	ldr r2, _02064074 ; =_020B0B04
	ldr ip, _02064078 ; =sub_020648FC
	ldr r3, [r2]
	mov r2, #0x60
	smlabb r0, r0, r2, r3
	ldr r2, [r0, #0xb0]
	add r0, r3, r1, lsl #5
	ldr r1, [r2, #0x10]
	mov r2, #0x10
	bx ip
	.align 2, 0
_02064074: .word _020B0B04
_02064078: .word sub_020648FC
	arm_func_end sub_0206404C

	arm_func_start sub_0206407C
sub_0206407C: ; 0x0206407C
	ldr r2, _02064094 ; =_020B0B04
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02064098 ; =sub_02064FE4
	add r0, r0, #0x40
	bx ip
	.align 2, 0
_02064094: .word _020B0B04
_02064098: .word sub_02064FE4
	arm_func_end sub_0206407C

	arm_func_start sub_0206409C
sub_0206409C: ; 0x0206409C
	ldr r2, _020640B8 ; =_020B0B04
	mov r1, #0x60
	ldr r2, [r2]
	add r2, r2, #0x58
	smlabb r0, r0, r1, r2
	add r0, r0, #0x50
	bx lr
	.align 2, 0
_020640B8: .word _020B0B04
	arm_func_end sub_0206409C

	arm_func_start sub_020640BC
sub_020640BC: ; 0x020640BC
	ldr ip, _020640C8 ; =MemZero
	mov r1, #0x40
	bx ip
	.align 2, 0
_020640C8: .word MemZero
	arm_func_end sub_020640BC

	arm_func_start sub_020640CC
sub_020640CC: ; 0x020640CC
	strh r1, [r0]
	bx lr
	arm_func_end sub_020640CC

	arm_func_start sub_020640D4
sub_020640D4: ; 0x020640D4
	strb r1, [r0, #0x3c]
	bx lr
	arm_func_end sub_020640D4

	arm_func_start sub_020640DC
sub_020640DC: ; 0x020640DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	str r5, [r6, #0xc]
	mov r0, #1
	strb r0, [r6, #0x3d]
	mov r0, #0
	strb r0, [r6, #0x3e]
	str r0, [r6, #0x10]
	ldrsh r0, [r6]
	bl sub_0206409C
	mov r4, r0
	mov r0, r5
	bl sub_02064228
	mov r1, r0
	add r0, r6, #0x2c
	bl sub_02009498
	mov r0, r5
	bl sub_02064228
	mov r2, r0
	add r0, r6, #0x32
	add r1, r6, #0x34
	bl sub_020094E8
	mov r0, r5
	bl sub_02064228
	mov r1, r0
	add r0, r6, #0x28
	bl sub_020090F4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020641E4
	mov r0, r5
	bl sub_02063E98
	ldr r2, [r0, #4]
	mov r1, #0
	strh r2, [r6, #0x38]
	ldr r2, [r0, #8]
	strh r2, [r6, #0x3a]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #8]
	stmib r6, {r0, r1}
	bl sub_02063A20
	cmp r0, #0
	mov r0, #0
	beq _020641A0
	mov r1, r5
	bl sub_02063A34
	b _020641C8
_020641A0:
	mov r2, r0
	mov r1, #1
	bl sub_02009454
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl sub_02009454
	mov r1, r5
	mov r0, #1
	bl sub_02063A34
_020641C8:
	ldrsh r0, [r6]
	mov r1, r5
	bl sub_0206404C
	mov r1, r5
	mov r0, #0
	bl sub_02063E20
	b _02064220
_020641E4:
	mov r0, #0
	str r0, [r6, #4]
	ldr r0, [r4, #0xc]
	str r0, [r6, #8]
	ldr r1, [r6, #0x10]
	bl sub_02063FA4
	ldr r0, [r6, #8]
	bl sub_0206407C
	mov r0, #0
	mov r1, #2
	bl sub_02063E20
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x10]
	add r2, r6, #0x14
	bl sub_02063F78
_02064220:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020640DC

	arm_func_start sub_02064228
sub_02064228: ; 0x02064228
	cmp r0, #0
	cmpne r0, #2
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02064228

	arm_func_start sub_0206423C
sub_0206423C: ; 0x0206423C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0xc]
	cmp r0, #2
	beq _02064264
	bl sub_02063E98
	ldrsh r1, [r4, #0x38]
	str r1, [r0, #4]
	ldrsh r1, [r4, #0x3a]
	str r1, [r0, #8]
_02064264:
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r1, r0
	add r0, r4, #0x2c
	bl sub_0200946C
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r2, r0
	ldrsh r0, [r4, #0x32]
	ldrsh r1, [r4, #0x34]
	bl sub_020094C4
	ldr r0, [r4, #0xc]
	bl sub_02064228
	mov r1, r0
	add r0, r4, #0x28
	bl sub_020090C0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206423C

	arm_func_start sub_020642A8
sub_020642A8: ; 0x020642A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _020645C0
	ldrb r1, [r5, #0x3e]
	ldr r4, [r5, #0xc]
	cmp r1, #0
	beq _020642DC
	bl sub_0206423C
	mov r0, #0
	b _02064658
_020642DC:
	ldrb r0, [r5, #0x3c]
	cmp r0, #0
	movne r0, #1
	bne _02064658
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _02064484
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0x14
	stmib sp, {r0, r4}
	mov r2, #0
	ldrsh r0, [r5]
	mov r3, r2
	add r1, r5, #0x10
	bl sub_02063EE0
	mov r6, r0
	ldr r2, [r5, #0xc]
	add r0, sp, #0xc
	mov r1, #4
	bl sub_02063EB4
	cmp r6, #0
	beq _02064464
	ldrsh r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r5, #0x1c]
	movne r0, #0
	strne r0, [r5, #0x20]
	strne r0, [r5, #0x24]
	ldrsh r1, [sp, #0xe]
	cmp r1, #0
	beq _020643A4
	cmp r1, #0x63
	ldreq r1, _02064660 ; =0x00000C1C
	moveq r0, #0
	streq r1, [r5, #0x20]
	streq r0, [r5, #0x24]
	beq _020643A4
	cmp r1, #0
	ldr r0, _02064660 ; =0x00000C1C
	ble _02064394
	bl _s32_div_f
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	b _020643A4
_02064394:
	str r0, [r5, #0x20]
	ldrsh r1, [sp, #0xe]
	bl _s32_div_f
	str r0, [r5, #0x24]
_020643A4:
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _02064478
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x20]
	ldr r2, [r1, #0x10]
	mov r1, #0x64
	add sb, r2, #0x380
	bl _s32_div_f
	mov r8, #0
	mov r7, r0
	mov r6, r8
_020643D4:
	mov r0, r4
	bl sub_02063E7C
	add r1, r8, #0xe0
	mov r2, r1, lsl #0x10
	mov r1, sb
	mov r3, r7
	mov r2, r2, asr #0x10
	str r6, [sp]
	bl sub_0200C020
	add r8, r8, #1
	cmp r8, #0x10
	add sb, sb, #4
	blt _020643D4
	mov r0, r4
	bl sub_02063E7C
	bl sub_0200A504
	mov r1, r4
	mov r0, #3
	bl sub_02063BCC
	mov r0, r4
	bl sub_02063E68
	mov r2, r0
	mov r0, #0x50
	mov r1, r0
	bl sub_020094C4
	ldr r1, [r5, #0x20]
	ldr r0, [r5, #0x24]
	adds r1, r1, r0
	str r1, [r5, #0x20]
	movmi r0, #0
	strmi r0, [r5, #0x20]
	bmi _02064478
	ldr r0, _02064660 ; =0x00000C1C
	cmp r1, r0
	strgt r0, [r5, #0x20]
	b _02064478
_02064464:
	mov r0, r4
	bl sub_02063E44
	mov r0, #1
	strb r0, [r5, #0x3e]
	b _02064658
_02064478:
	ldr r0, [r5, #0x10]
	add r0, r0, #1
	str r0, [r5, #0x10]
_02064484:
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	bne _020645AC
	ldrsh r0, [r5]
	bl sub_0206409C
	ldr r1, [r5, #0x10]
	mov r8, #0xff
	subs r2, r1, #1
	ldr r1, [r0, #8]
	movmi r2, #0
	cmp r1, #0
	beq _020645AC
	ldmia r1, {r0, r1}
	sub r0, r0, #1
	cmp r2, r0
	ldr r7, [r1, r2, lsl #2]
	bne _02064504
	ldr r1, [r7, #0x1c]
	mov r0, r4
	mov r1, r1, asr #8
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #24
	add r8, r2, r1, ror #24
	bl sub_02063E68
	rsb r1, r8, #0xff
	mov r3, r1, lsl #0x10
	mov r1, r8, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r3, asr #0x10
	bl sub_020094C4
	b _0206458C
_02064504:
	ldrsh r0, [r7, #0xc]
	add r1, r1, r2, lsl #2
	ldr r6, [r1, #4]
	cmp r0, #0
	bne _0206458C
	ldr r0, [r7, #0x1c]
	cmp r0, #0xff00
	beq _0206458C
	ldrsh r1, [r7, #8]
	ldr r0, [r5, #0x14]
	sub r0, r1, r0
	mov r0, r0, lsl #8
	mov r1, r1, lsl #8
	bl sub_02001AB0
	ldr r7, [r7, #0x1c]
	ldr r1, [r6, #0x1c]
	sub r1, r1, r7
	bl MultiplyByFixedPoint
	add r0, r0, r7
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r8, r1, r0, ror #24
	add r1, r8, r8, lsr #31
	mov r0, r4
	mov r6, r1, asr #1
	bl sub_02063E68
	rsb r1, r6, #0x80
	mov r3, r1, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r2, r0
	mov r0, r1, asr #0x10
	mov r1, r3, asr #0x10
	bl sub_020094C4
_0206458C:
	cmp r8, #0xff
	mov r1, r4
	bne _020645A4
	mov r0, #0
	bl sub_02063BCC
	b _020645AC
_020645A4:
	mov r0, #2
	bl sub_02063BCC
_020645AC:
	ldr r1, [r5, #0x14]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r5, #0x14]
	b _02064658
_020645C0:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02064654
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0206460C
	ldr r0, [r5, #0x10]
	add r2, r5, #0x14
	add r1, r0, #1
	str r1, [r5, #0x10]
	ldr r0, [r5, #8]
	bl sub_02063F78
	cmp r0, #0
	bne _0206460C
	mov r1, #0
	str r1, [r5, #0x10]
	ldr r0, [r5, #8]
	add r2, r5, #0x14
	bl sub_02063F78
_0206460C:
	ldrb r0, [r5, #0x3c]
	ldr r1, [r5, #0x10]
	cmp r0, #0
	ldr r0, [r5, #8]
	beq _02064634
	ldr r2, [r5, #0x14]
	mov r3, #1
	bl sub_02063F30
	mov r0, #1
	b _02064658
_02064634:
	ldr r2, [r5, #0x14]
	mov r3, #0
	bl sub_02063F30
	ldr r1, [r5, #0x14]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r5, #0x14]
	b _02064658
_02064654:
	mov r0, #0
_02064658:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02064660: .word 0x00000C1C
	arm_func_end sub_020642A8

	arm_func_start sub_02064664
sub_02064664: ; 0x02064664
	strh r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02064664

	arm_func_start sub_0206466C
sub_0206466C: ; 0x0206466C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, #0
	mov sb, r0
	add r5, sp, #0
	mov r4, r8
	mov r6, r8
_02064688:
	mov r7, r6
_0206468C:
	str r8, [sp, #4]
	str r7, [sp]
	ldr r0, [sb, #8]
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	add r7, r7, #1
	cmp r7, #0x40
	blt _0206468C
	add r8, r8, #1
	cmp r8, #0x20
	blt _02064688
	ldr r0, [sb, #8]
	bl sub_0200B330
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0206466C

	arm_func_start sub_020646CC
sub_020646CC: ; 0x020646CC
	stmib r0, {r1, r2}
	mov r1, #0
	str r1, [r0, #0xc]
	str r3, [r0, #0x10]
	bx lr
	arm_func_end sub_020646CC

	arm_func_start sub_020646E0
sub_020646E0: ; 0x020646E0
	ldr r0, [r0, #0x10]
	bx lr
	arm_func_end sub_020646E0

	arm_func_start sub_020646E8
sub_020646E8: ; 0x020646E8
	ldr r0, [r0, #8]
	bx lr
	arm_func_end sub_020646E8

	arm_func_start sub_020646F0
sub_020646F0: ; 0x020646F0
	ldr r0, [r0, #4]
	mov ip, #0
	add r2, r0, r2
	b _0206474C
_02064700:
	ldr r0, [r1]
	add ip, ip, #1
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	str r0, [r2, #8]
	ldr r0, [r1, #0xc]
	str r0, [r2, #0xc]
	ldr r0, [r1, #0x10]
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x14]
	str r0, [r2, #0x14]
	ldr r0, [r1, #0x18]
	str r0, [r2, #0x18]
	ldr r0, [r1, #0x1c]
	add r1, r1, #0x20
	str r0, [r2, #0x1c]
	add r2, r2, #0x20
_0206474C:
	cmp ip, r3
	bls _02064700
	bx lr
	arm_func_end sub_020646F0

	arm_func_start sub_02064758
sub_02064758: ; 0x02064758
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02064780
_02064764:
	add r3, r0, lr, lsl #1
	ldrsh ip, [r3, #0x16]
	add r3, lr, #1
	mov lr, lr, lsl #1
	mov r3, r3, lsl #0x10
	strh ip, [r1, lr]
	mov lr, r3, lsr #0x10
_02064780:
	cmp lr, r2
	blo _02064764
	ldmia sp!, {r3, pc}
	arm_func_end sub_02064758

	arm_func_start sub_0206478C
sub_0206478C: ; 0x0206478C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldrb r6, [sp, #0x3c]
	mov sl, r0
	mov r5, r1
	mov r4, r2
	str r3, [sp]
	cmp r6, #0
	beq _020647B4
	bl sub_0206466C
_020647B4:
	ldr r2, [r5, #0x14]
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _020647DC
	ldrb r0, [r2, #0xa]
	ldr r1, [r4]
	cmp r1, r0
	ldrgeb r0, [r2, #9]
	strge r0, [r4]
	b _020647F0
_020647DC:
	ldr r1, [r4]
	ldr r0, [r5]
	cmp r1, r0
	movge r0, #0
	bge _020648F0
_020647F0:
	ldr r2, [r5, #4]
	ldr r0, [r4]
	ldr r1, [sp, #0x40]
	ldr r2, [r2, r0, lsl #2]
	mov sb, #0
	ldrsh r0, [r2, #6]
	cmp r1, #0
	ldrsh r8, [r2, #4]
	str r0, [sp, #4]
	ldrnesh r0, [r2, #8]
	mov r5, sb
	add fp, r2, #0x24
	strne r0, [r1]
	ldrsh r0, [r2, #0xc]
	ldrsh r7, [sp, #0x38]
	strh r0, [sl, #0x16]
	ldrsh r0, [r2, #0xe]
	strh r0, [sl, #0x18]
	ldrsh r0, [r2, #0x10]
	strh r0, [sl, #0x1a]
	ldrsh r0, [r2, #0x12]
	strh r0, [sl, #0x1c]
	b _020648D8
_0206484C:
	cmp r7, #0x18
	bge _020648E4
	ldr r6, [sp]
	mov r4, #0
	cmp r8, #0
	ble _020648D0
	b _020648C8
_02064868:
	cmp sb, #0
	bne _02064888
	ldrh r2, [fp], #2
	tst r2, #0xf000
	ldreq r0, _020648F8 ; =0x000003FF
	andeq sb, r2, r0
	moveq r2, #0
	b _0206488C
_02064888:
	mov r2, #0
_0206488C:
	cmp sb, #0
	subne sb, sb, #1
	cmp r6, #0
	blt _020648C0
	cmp r6, #0x20
	bge _020648C0
	cmp r7, #0
	blt _020648C0
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sl, #8]
	add r1, sp, #8
	bl sub_0200B3FC
_020648C0:
	add r4, r4, #1
	add r6, r6, #1
_020648C8:
	cmp r4, r8
	blt _02064868
_020648D0:
	add r5, r5, #1
	add r7, r7, #1
_020648D8:
	ldr r0, [sp, #4]
	cmp r5, r0
	blt _0206484C
_020648E4:
	ldr r0, [sl, #8]
	bl sub_0200B330
	mov r0, #1
_020648F0:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020648F8: .word 0x000003FF
	arm_func_end sub_0206478C

	arm_func_start sub_020648FC
sub_020648FC: ; 0x020648FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #0x10]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	beq _02064930
	mov r2, r6
	mov r3, r5
	mov r1, #0xe0
	bl sub_0200A5B0
	ldr r0, [r7, #0x10]
	bl sub_0200A504
_02064930:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, #0
	b _02064960
_02064944:
	add r0, r4, #0xe0
	mov r1, r0, lsl #0x10
	ldr r0, [r7, #0xc]
	mov r1, r1, lsr #0x10
	add r2, r6, r4, lsl #2
	bl sub_0200A29C
	add r4, r4, #1
_02064960:
	cmp r4, r5
	blt _02064944
	ldr r0, [r7, #0xc]
	bl sub_0200A174
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020648FC

	arm_func_start sub_02064974
sub_02064974: ; 0x02064974
	stmdb sp!, {r4, lr}
	mov r2, #0x60
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x40]
	cmp r0, #0
	beq _0206499C
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0206499C:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r4, #0x41]
	cmp r1, #2
	bne _020649CC
	bl MemFree
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	ldr r0, _020649EC ; =_020A46B0
	bl Debug_Print0
	b _020649DC
_020649CC:
	bl MemFree
	ldr r0, _020649F0 ; =_020A46D0
	mov r1, r4
	bl Debug_Print0
_020649DC:
	mov r0, r4
	mov r1, #0x60
	bl MemZero
	ldmia sp!, {r4, pc}
	.align 2, 0
_020649EC: .word _020A46B0
_020649F0: .word _020A46D0
	arm_func_end sub_02064974

	arm_func_start sub_020649F4
sub_020649F4: ; 0x020649F4
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x600
	mov lr, #1
	ldrsh r4, [r1, #2]
	ldrsh r5, [r1]
	mov ip, lr
	mov r3, #0x60
	b _02064A6C
_02064A14:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x50]
	cmp r1, #0
	bne _02064A54
	add r1, r4, #1
	add r0, r0, #0x600
	strh r1, [r0, #2]
	ldrsh r2, [r0, #2]
	ldrsh r1, [r0]
	cmp r2, r1
	movge r1, #1
	strgeh r1, [r0, #2]
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02064A54:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_02064A6C:
	cmp lr, r5
	blt _02064A14
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020649F4

	arm_func_start sub_02064A7C
sub_02064A7C: ; 0x02064A7C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r1
	ldr r1, [r0, #0x50]
	add r0, sp, #0
	bl HandleSir0TranslationVeneer
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r4]
	ldr r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_02064A7C

	arm_func_start sub_02064AB0
sub_02064AB0: ; 0x02064AB0
	stmdb sp!, {r4, lr}
	ldr r1, _02064AD8 ; =0x00000608
	mov r4, r0
	bl MemZero
	add r0, r4, #0x600
	mov r1, #1
	strh r1, [r0, #2]
	strb r1, [r4, #0x604]
	strh r1, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02064AD8: .word 0x00000608
	arm_func_end sub_02064AB0

	arm_func_start sub_02064ADC
sub_02064ADC: ; 0x02064ADC
	stmdb sp!, {r4, lr}
	mov r1, #0x600
	mov r4, r0
	bl MemZero
	add r0, r4, #0x600
	mov r1, #0x10
	strh r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02064ADC

	arm_func_start sub_02064AFC
sub_02064AFC: ; 0x02064AFC
	add r0, r0, #0x600
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_02064AFC

	arm_func_start sub_02064B0C
sub_02064B0C: ; 0x02064B0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, r0
	add r0, r5, #0x600
	mov r8, r1
	ldrsh r4, [r0]
	mov r7, r2
	mov r6, r3
	mov r0, #1
	mov r1, #0x60
	b _02064B64
_02064B38:
	smlabb r3, r0, r1, r5
	ldrb r2, [r3, #0x41]
	cmp r2, #2
	ldreq r2, [r3, #0x44]
	cmpeq r8, r2
	ldreq r2, [r3, #0x48]
	cmpeq r7, r2
	beq _02064B70
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_02064B64:
	cmp r0, r4
	blt _02064B38
	mvn r0, #0
_02064B70:
	mvn r1, #0
	cmp r0, r1
	beq _02064B94
	mov r1, #0x60
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x4c]
	add r1, r1, #1
	strh r1, [r2, #0x4c]
	b _02064C04
_02064B94:
	mov r0, r5
	bl sub_020649F4
	mov r4, r0
	mov r0, #0x60
	smlabb r5, r4, r0, r5
	mov r0, #2
	strb r0, [r5, #0x41]
	str r8, [r5, #0x44]
	mov r0, r8
	mov r1, r7
	mov r3, r6
	str r7, [r5, #0x48]
	add r2, r5, #0x50
	bl DirectoryFileMngr_OpenDirectoryFile
	ldrsh r2, [r5, #0x4c]
	add r1, sp, #0
	mov r0, r5
	add r2, r2, #1
	strh r2, [r5, #0x4c]
	bl sub_02064A7C
	ldrb r1, [sp]
	cmp r1, #0
	movne r1, #0
	strne r1, [r5, #0x58]
	streq r0, [r5, #0x58]
	moveq r0, #0
	str r0, [r5, #0x5c]
	mov r0, r4
_02064C04:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02064B0C

	arm_func_start sub_02064C0C
sub_02064C0C: ; 0x02064C0C
	ldr ip, _02064C14 ; =sub_02064974
	bx ip
	.align 2, 0
_02064C14: .word sub_02064974
	arm_func_end sub_02064C0C

	arm_func_start sub_02064C18
sub_02064C18: ; 0x02064C18
	str r1, [r0, #4]
	strh r2, [r0, #8]
	bx lr
	arm_func_end sub_02064C18

	arm_func_start sub_02064C24
sub_02064C24: ; 0x02064C24
	stmdb sp!, {r4, lr}
	mov lr, r1
	ldr ip, [lr, #0x10]
	ldr r1, [lr, #0x18]
	add ip, lr, ip
	mov r4, r0
	mla r0, r1, r3, ip
	ldr r1, [r4, #4]
	mov r3, #0
	add r1, r1, r2
	ldr r2, [lr, #0x14]
	bl sub_0201E050
	ldmia sp!, {r4, pc}
	arm_func_end sub_02064C24

	arm_func_start sub_02064C58
sub_02064C58: ; 0x02064C58
	strb r1, [r0, #0x16]
	bx lr
	arm_func_end sub_02064C58

	arm_func_start sub_02064C60
sub_02064C60: ; 0x02064C60
	ldr r0, [r1, #0xc]
	cmp r2, r0
	movhs r0, #0
	bxhs lr
	ldr ip, [r1, #8]
	mov r0, #0x2c
	add r1, r1, ip
	mla r0, r2, r0, r1
	ldrsh r1, [r0, #8]
	mov r0, #1
	str r1, [r3]
	bx lr
	arm_func_end sub_02064C60

	arm_func_start sub_02064C90
sub_02064C90: ; 0x02064C90
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #0xc]
	cmp r2, r3
	movhs r0, #0
	ldmhsia sp!, {r3, pc}
	ldr ip, [r1, #8]
	mov r3, #0x2c
	add ip, r1, ip
	mla r3, r2, r3, ip
	ldrsh r3, [r3, #0x18]
	mov r2, #0
	bl sub_02064C24
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02064C90

	arm_func_start sub_02064CC8
sub_02064CC8: ; 0x02064CC8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r4, [r1, #0xc]
	mov sl, r0
	cmp r2, r4
	movhs r0, #0
	bhs _02064F84
	ldr r0, [r1, #0x28]
	ldr r4, _02064F8C ; =_020AFC70
	ldr r6, [r1, #8]
	ldr r5, [sl, #4]
	ldr r7, [r4]
	str r5, [sp, #0x14]
	add r5, r1, r6
	mov r4, #0x2c
	mla r4, r2, r4, r5
	ldrsh r6, [sl, #8]
	ldr r7, [r7, #0xe0]
	add r0, r1, r0
	add r6, r7, r6, lsl #9
	str r6, [sp, #0x18]
	ldrsh r8, [r4, #0x18]
	add r7, sp, #0x1c
	mov r6, #4
	add r8, r0, r8, lsl #3
_02064D2C:
	ldrh r0, [r8], #2
	subs r6, r6, #1
	strh r0, [r7], #2
	bne _02064D2C
	ldrh r0, [r1, #4]
	ldr r8, _02064F90 ; =0x00007FFF
	mov r7, #0
	bic sb, r0, #0x1800
	mov r6, #0x39
	mov r0, #0x21
	strh sb, [sp, #0x24]
	strh r8, [sp, #0x36]
	strh r8, [sp, #0x38]
	strh r8, [sp, #0x3a]
	strh r8, [sp, #0x3c]
	strh r7, [sp, #0x3e]
	strh r6, [sp, #0x12]
	strb r7, [sp, #0x42]
	strb r0, [sp, #0x40]
	ldr r0, [r1, #0xc]
	sub r0, r0, #1
	cmp r2, r0
	bne _02064DA0
	ldrh r0, [r4, #0xa]
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r1, r1, r0, ror #24
	b _02064DEC
_02064DA0:
	add r2, r2, #1
	mov r0, #0x2c
	mla r5, r2, r0, r5
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	beq _02064DEC
	ldrsh r1, [r5, #8]
	sub r0, r1, r3
	mov r0, r0, lsl #8
	mov r1, r1, lsl #8
	bl sub_02001AB0
	ldrh r5, [r5, #0xa]
	mov r1, r7
	bl MultiplyByFixedPoint
	add r0, r0, r5
	mov r0, r0, asr #8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #24
	add r1, r1, r0, ror #24
_02064DEC:
	ldrsh r6, [sp, #0x20]
	and r0, r1, #0xf8
	mov r2, r0, asr #3
	mov r1, r6
	mov r0, #0x100
	strb r2, [sp, #0x41]
	ldrsh r7, [sp, #0x22]
	bl _s32_div_f
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	mov r1, r6
	mov r0, #0x100
	bl _s32_div_f
	add r0, r0, r5
	mov r2, r0, lsl #0x10
	mov r1, r7
	mov r0, #0xc0
	mov r5, r2, asr #0x10
	bl _s32_div_f
	add r2, r5, #1
	cmp r1, #0
	str r2, [sp]
	ldrsh r2, [sl, #0x14]
	movne sb, #1
	moveq sb, #0
	mov r1, r7
	mov r0, #0xc0
	ldrsh r5, [sl, #0x12]
	str r2, [sp, #4]
	mvn r8, #0
	bl _s32_div_f
	add r0, r0, sb
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add fp, r0, #1
	b _02064F2C
_02064E80:
	ldr r0, [sp, #4]
	add r1, r8, #1
	mla r2, r8, r7, r0
	mla r1, r7, r1, r0
	mov r0, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsl #0x10
	str r0, [sp, #8]
	mov r0, r1, asr #0x10
	mvn sb, #0
	str r0, [sp, #0xc]
	b _02064F14
_02064EB0:
	add r0, sb, #1
	mla r0, r6, r0, r5
	strh r0, [sp, #0x2a]
	mla r0, sb, r6, r5
	strh r0, [sp, #0x26]
	ldr r0, [sp, #8]
	ldrsh r1, [sp, #0x26]
	strh r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	ldrsh r2, [sp, #0x28]
	strh r0, [sp, #0x30]
	ldrb r0, [sp, #0x40]
	strh r2, [sp, #0x2c]
	strh r1, [sp, #0x2e]
	ldrsh r2, [sp, #0x2a]
	ldrsh r1, [sp, #0x30]
	add r0, r0, #1
	strb r0, [sp, #0x40]
	add r0, sp, #0x10
	strh r2, [sp, #0x32]
	strh r1, [sp, #0x34]
	bl EnqueueRender3dTiling
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
_02064F14:
	ldr r0, [sp]
	cmp sb, r0
	blt _02064EB0
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02064F2C:
	cmp r8, fp
	blt _02064E80
	ldrb r0, [sl, #0x16]
	cmp r0, #0
	bne _02064F80
	ldrsh r2, [sl, #0x12]
	ldrsh r0, [r4, #0x14]
	mov r1, r6
	add r0, r2, r0
	strh r0, [sl, #0x12]
	ldrsh r2, [sl, #0x14]
	ldrsh r0, [r4, #0x16]
	add r0, r2, r0
	strh r0, [sl, #0x14]
	ldrsh r0, [sl, #0x12]
	bl _s32_div_f
	strh r1, [sl, #0x12]
	ldrsh r0, [sl, #0x14]
	mov r1, r7
	bl _s32_div_f
	strh r1, [sl, #0x14]
_02064F80:
	mov r0, #1
_02064F84:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02064F8C: .word _020AFC70
_02064F90: .word 0x00007FFF
	arm_func_end sub_02064CC8

	arm_func_start sub_02064F94
sub_02064F94: ; 0x02064F94
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	ldr r4, _02064FE0 ; =_020AFC70
	b _02064FD4
_02064FB0:
	ldr r0, [r4]
	mov r3, r5, lsl #0x10
	ldrsh r2, [r8, #8]
	mov r1, r7
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r5, r5, #1
	add r7, r7, #4
_02064FD4:
	cmp r5, r6
	blt _02064FB0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02064FE0: .word _020AFC70
	arm_func_end sub_02064F94

	arm_func_start sub_02064FE4
sub_02064FE4: ; 0x02064FE4
	ldr r3, [r1, #0x20]
	ldr ip, _02064FF8 ; =sub_02064F94
	ldr r2, [r1, #0x24]
	add r1, r1, r3
	bx ip
	.align 2, 0
_02064FF8: .word sub_02064F94
	arm_func_end sub_02064FE4

	arm_func_start sub_02064FFC
sub_02064FFC: ; 0x02064FFC
	mov r1, #0xc
	smulbb r1, r0, r1
	ldr r0, _02065010 ; =_020A5490
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02065010: .word _020A5490
	arm_func_end sub_02064FFC

	arm_func_start sub_02065014
sub_02065014: ; 0x02065014
	mvn r1, #0
	cmp r0, r1
	beq _02065044
	mov r1, #0xc
	smulbb r1, r0, r1
	ldr r0, _0206504C ; =EVENTS
	ldrsh r0, [r0, r1]
	cmp r0, #5
	cmpne r0, #6
	cmpne r0, #8
	moveq r0, #0
	bxeq lr
_02065044:
	mov r0, #1
	bx lr
	.align 2, 0
_0206504C: .word EVENTS
	arm_func_end sub_02065014

	arm_func_start sub_02065050
sub_02065050: ; 0x02065050
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldrsh r0, [r5]
	mvn r4, #0
	cmp r0, #0x2e
	ldreq r0, _02065494 ; =_020B0B08
	ldreqsh r0, [r0, #0x18]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x2f
	ldreq r0, _02065494 ; =_020B0B08
	ldreqsh r0, [r0, #0x16]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x30
	ldreq r0, _02065494 ; =_020B0B08
	ldreqsh r0, [r0, #0x14]
	streqh r0, [r5]
	beq _020650B0
	cmp r0, #0x31
	ldreq r0, _02065494 ; =_020B0B08
	ldreqsh r0, [r0, #0x12]
	streqh r0, [r5]
_020650B0:
	ldrsh r2, [r5]
	mvn r0, #0
	cmp r2, r0
	beq _0206548C
	mov r0, #0xc
	smulbb r1, r2, r0
	ldr r0, _02065498 ; =ENTITIES
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _020651AC
	cmp r2, #0
	bne _020651A4
	mov r0, #0
	mov r1, #0x34
	bl LoadScriptVariableValue
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02065198
_020650F8: ; jump table
	b _0206511C ; case 0
	b _02065128 ; case 1
	b _02065198 ; case 2
	b _02065134 ; case 3
	b _02065180 ; case 4
	b _02065180 ; case 5
	b _02065180 ; case 6
	b _02065180 ; case 7
	b _02065180 ; case 8
_0206511C:
	mov r0, #1
	strh r0, [r5]
	b _020651A4
_02065128:
	mov r0, #2
	strh r0, [r5]
	b _020651A4
_02065134:
	bl sub_020568A4
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r0, #1
	streqh r0, [r5]
	beq _020651A4
	bl GetMainCharacter1MemberIdx
	cmp r4, r0
	moveq r0, #1
	streqh r0, [r5]
	beq _020651A4
	bl GetMainCharacter2MemberIdx
	cmp r4, r0
	moveq r0, #2
	streqh r0, [r5]
	movne r0, #4
	strneh r0, [r5]
	b _020651A4
_02065180:
	mov r0, #0
	mov r1, #0x34
	bl LoadScriptVariableValue
	add r0, r0, #1
	strh r0, [r5]
	b _020651A4
_02065198:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_020651A4:
	mov r4, #0
	b _02065488
_020651AC:
	cmp r0, #2
	bne _02065330
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	mov r4, r0
	mov r0, #0
	mov r1, #0x36
	bl LoadScriptVariableValue
	ldrsh r2, [r5]
	sub r1, r2, #0xa
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	bhi _020652D0
	cmp r2, #0xa
	bne _02065204
	cmp r4, #0
	moveq r4, r0
	b _02065210
_02065204:
	cmp r4, #0
	moveq r0, #0
	mov r4, r0
_02065210:
	cmp r4, #0xa
	addls pc, pc, r4, lsl #2
	b _020652C4
_0206521C: ; jump table
	b _020652C4 ; case 0
	b _02065248 ; case 1
	b _02065254 ; case 2
	b _020652C4 ; case 3
	b _02065260 ; case 4
	b _020652AC ; case 5
	b _020652AC ; case 6
	b _020652AC ; case 7
	b _020652AC ; case 8
	b _020652AC ; case 9
	b _020652B8 ; case 10
_02065248:
	mov r0, #0xc
	strh r0, [r5]
	b _020652D0
_02065254:
	mov r0, #0xd
	strh r0, [r5]
	b _020652D0
_02065260:
	bl sub_020568A4
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r0, #0xc
	streqh r0, [r5]
	beq _020652D0
	bl GetMainCharacter1MemberIdx
	cmp r4, r0
	moveq r0, #0xc
	streqh r0, [r5]
	beq _020652D0
	bl GetMainCharacter2MemberIdx
	cmp r4, r0
	moveq r0, #0xd
	streqh r0, [r5]
	movne r0, #0xf
	strneh r0, [r5]
	b _020652D0
_020652AC:
	add r0, r4, #0xb
	strh r0, [r5]
	b _020652D0
_020652B8:
	mov r0, #0x15
	strh r0, [r5]
	b _020652D0
_020652C4:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_020652D0:
	ldrsh r0, [r5]
	sub r0, r0, #0xc
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02065324
_020652E4: ; jump table
	b _0206530C ; case 0
	b _02065314 ; case 1
	b _02065324 ; case 2
	b _0206531C ; case 3
	b _02065324 ; case 4
	b _02065324 ; case 5
	b _02065324 ; case 6
	b _02065324 ; case 7
	b _02065324 ; case 8
	b _0206531C ; case 9
_0206530C:
	mov r4, #2
	b _02065488
_02065314:
	mov r4, #1
	b _02065488
_0206531C:
	mov r4, #2
	b _02065488
_02065324:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_02065330:
	cmp r0, #3
	bne _02065420
	cmp r2, #0x16
	blt _020653A8
	cmp r2, #0x19
	bgt _020653A8
	mov r0, #0xd
	sub r4, r2, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0206536C
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _0206548C
_0206536C:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065390
	ldrsh r0, [r5]
	cmp r0, #0x17
	bgt _02065414
	mvn r0, #0
	b _0206548C
_02065390:
	add r0, sp, #8
	bl sub_02056E04
	cmp r4, r0
	bge _02065414
	mvn r0, #0
	b _0206548C
_020653A8:
	cmp r2, #0x1a
	blt _02065414
	cmp r2, #0x1d
	bgt _02065414
	mov r0, #0xd
	sub r4, r2, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _020653DC
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _0206548C
_020653DC:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065400
	ldrsh r0, [r5]
	cmp r0, #0x1c
	bgt _02065414
	mvn r0, #0
	b _0206548C
_02065400:
	add r0, sp, #0
	bl sub_02056D70
	cmp r4, r0
	mvnlt r0, #0
	blt _0206548C
_02065414:
	mvn r0, #0
	strh r0, [r5]
	b _0206548C
_02065420:
	bl sub_020568A4
	ldrsh r1, [r5]
	mov r6, r0
	cmp r1, #0x3f
	bne _02065488
	mvn r1, #0
	cmp r6, r1
	moveq r0, #0x3c
	streqh r0, [r5]
	beq _02065488
	bl sub_02055410
	cmp r0, #0
	movne r0, #0x3c
	strneh r0, [r5]
	bne _02065488
	mov r0, r6
	bl sub_02055474
	cmp r0, #0
	movne r0, #0x3d
	strneh r0, [r5]
	bne _02065488
	mov r0, r6
	bl sub_020554D8
	cmp r0, #0
	movne r0, #0x3e
	strneh r0, [r5]
_02065488:
	mov r0, r4
_0206548C:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02065494: .word _020B0B08
_02065498: .word ENTITIES
	arm_func_end sub_02065050

	arm_func_start sub_0206549C
sub_0206549C: ; 0x0206549C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r1
	bl sub_02065050
	mov r4, r0
	mov r0, #0
	strh r0, [r5]
	ldrsh lr, [r6]
	sub r1, r0, #1
	cmp lr, r1
	subeq r0, r0, #1
	beq _0206595C
	mov r1, #0xc
	smulbb r3, lr, r1
	ldr ip, _02065964 ; =ENTITIES
	ldrsh r2, [ip, r3]
	add r3, ip, r3
	cmp r2, #3
	bne _020656B4
	cmp lr, #0x16
	blt _020655BC
	cmp lr, #0x19
	bgt _020655BC
	mov r0, #0xd
	sub r4, lr, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065540
	bl ov11_022E96E4
	cmp r0, #0
	beq _02065540
	ldr r0, _02065968 ; =ARM9_UNKNOWN_TABLE__NA_20A68BC
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065540:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _02065580
	ldrsh r0, [r6]
	cmp r0, #0x16
	moveq r0, #0x5f
	streqh r0, [r5]
	subeq r0, r0, #0x60
	beq _0206595C
	cmp r0, #0x17
	bne _020656A8
	mov r0, #0x22
	strh r0, [r5]
	sub r0, r0, #0x23
	b _0206595C
_02065580:
	add r0, sp, #8
	bl sub_02056E04
	cmp r4, r0
	bge _020656A8
	ldr r0, _0206596C ; =TEAM_MEMBER_TABLE_PTR
	add r1, sp, #8
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	ldr r3, [r0]
	mov r1, #0x44
	sub r0, r1, #0x45
	smlabb r1, r2, r1, r3
	ldrsh r1, [r1, #4]
	strh r1, [r5]
	b _0206595C
_020655BC:
	cmp lr, #0x1a
	blt _020656A8
	cmp lr, #0x1d
	bgt _020656A8
	mov r0, #0xd
	sub r4, lr, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065610
	bl ov11_022E96E4
	cmp r0, #0
	beq _02065610
	ldr r0, _02065968 ; =ARM9_UNKNOWN_TABLE__NA_20A68BC
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065610:
	mov r0, #5
	bl Debug_GetDebugFlag
	cmp r0, #0
	beq _0206566C
	ldrsh r0, [r6]
	cmp r0, #0x1a
	bne _02065640
	bl GetPartner
	ldrsh r1, [r0, #4]
	mvn r0, #0
	strh r1, [r5]
	b _0206595C
_02065640:
	cmp r0, #0x1b
	moveq r0, #0x5f
	streqh r0, [r5]
	subeq r0, r0, #0x60
	beq _0206595C
	cmp r0, #0x1c
	bne _020656A8
	mov r0, #0x22
	strh r0, [r5]
	sub r0, r0, #0x23
	b _0206595C
_0206566C:
	add r0, sp, #0
	bl sub_02056D70
	cmp r4, r0
	bge _020656A8
	ldr r0, _0206596C ; =TEAM_MEMBER_TABLE_PTR
	add r1, sp, #0
	mov r2, r4, lsl #1
	ldrsh r2, [r1, r2]
	ldr r3, [r0]
	mov r1, #0x44
	sub r0, r1, #0x45
	smlabb r1, r2, r1, r3
	ldrsh r1, [r1, #4]
	strh r1, [r5]
	b _0206595C
_020656A8:
	mvn r0, #0
	strh r0, [r6]
	b _0206595C
_020656B4:
	cmp lr, #0x35
	bgt _02065734
	bge _020658A0
	cmp lr, #0x32
	bgt _02065718
	bge _02065860
	cmp lr, #0xf
	addls pc, pc, lr, lsl #2
	b _02065948
_020656D8: ; jump table
	b _02065948 ; case 0
	b _02065798 ; case 1
	b _020657A8 ; case 2
	b _020657B8 ; case 3
	b _020657C8 ; case 4
	b _02065948 ; case 5
	b _02065948 ; case 6
	b _02065948 ; case 7
	b _02065948 ; case 8
	b _02065948 ; case 9
	b _02065948 ; case 10
	b _02065948 ; case 11
	b _02065798 ; case 12
	b _020657A8 ; case 13
	b _020657B8 ; case 14
	b _020657C8 ; case 15
_02065718:
	cmp lr, #0x33
	bgt _02065728
	beq _02065880
	b _02065948
_02065728:
	cmp lr, #0x34
	beq _02065920
	b _02065948
_02065734:
	cmp lr, #0x37
	bgt _0206574C
	bge _020658E0
	cmp lr, #0x36
	beq _020658C0
	b _02065948
_0206574C:
	cmp lr, #0x38
	bgt _0206575C
	beq _02065900
	b _02065948
_0206575C:
	sub r2, lr, #0x39
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _02065948
_0206576C: ; jump table
	b _02065840 ; case 0
	b _02065818 ; case 1
	b _0206582C ; case 2
	b _02065798 ; case 3
	b _020657A8 ; case 4
	b _020657B8 ; case 5
	b _020657C8 ; case 6
	b _020657D8 ; case 7
	b _020657E8 ; case 8
	b _020657F8 ; case 9
	b _02065808 ; case 10
_02065798:
	bl GetMainCharacter1
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657A8:
	bl GetMainCharacter2
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657B8:
	bl GetMainCharacter3
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657C8:
	bl sub_02056914
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657D8:
	bl GetHero
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657E8:
	bl GetPartner
	ldrsh r0, [r0, #4]
	strh r0, [r5]
	b _02065958
_020657F8:
	mov r1, #0x3e
	bl LoadScriptVariableValue
	strh r0, [r5]
	b _02065958
_02065808:
	mov r1, #0x40
	bl LoadScriptVariableValue
	strh r0, [r5]
	b _02065958
_02065818:
	ldr r2, _02065970 ; =_020B0B08
	sub r0, r1, #0xd
	ldrsh r1, [r2, #0xa]
	strh r1, [r5]
	b _0206595C
_0206582C:
	ldr r2, _02065970 ; =_020B0B08
	sub r0, r1, #0xd
	ldrsh r1, [r2, #4]
	strh r1, [r5]
	b _0206595C
_02065840:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #0xc]
	cmp r0, #0
	strneh r0, [r5]
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065860:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #0x10]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065880:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #0xe]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658A0:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #2]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658C0:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658E0:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #8]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065900:
	ldr r0, _02065970 ; =_020B0B08
	ldrsh r0, [r0, #6]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065920:
	mov r0, #0
	mov r1, #0x44
	bl LoadScriptVariableValue
	strh r0, [r5]
	ldrsh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065948:
	ldrsh r0, [r5]
	cmp r0, #0
	ldreqsh r0, [r3, #2]
	streqh r0, [r5]
_02065958:
	mov r0, r4
_0206595C:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02065964: .word ENTITIES
_02065968: .word ARM9_UNKNOWN_TABLE__NA_20A68BC
_0206596C: .word TEAM_MEMBER_TABLE_PTR
_02065970: .word _020B0B08
	arm_func_end sub_0206549C

	arm_func_start sub_02065974
sub_02065974: ; 0x02065974
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_02065974

	arm_func_start GetActorMatchingStorageId
GetActorMatchingStorageId: ; 0x02065998
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r0, sp, #0x18
	bl sub_02065050
	ldrsh r1, [sp, #0x18]
	cmp r1, #1
	cmpne r1, #0xc
	cmpne r1, #0x3c
	bne _020659C8
	bl GetMainCharacter1MemberIdx
	b _02065B04
_020659C8:
	cmp r1, #2
	cmpne r1, #0xd
	cmpne r1, #0x3d
	bne _020659E0
	bl GetMainCharacter2MemberIdx
	b _02065B04
_020659E0:
	cmp r1, #3
	cmpne r1, #0xe
	cmpne r1, #0x3e
	bne _020659F8
	bl GetMainCharacter3MemberIdx
	b _02065B04
_020659F8:
	cmp r1, #4
	cmpne r1, #0xf
	cmpne r1, #0x3f
	bne _02065A10
	bl sub_020568A4
	b _02065B04
_02065A10:
	cmp r1, #0x40
	bne _02065A20
	bl GetHeroMemberIdx
	b _02065B04
_02065A20:
	cmp r1, #0x41
	bne _02065A30
	bl GetPartnerMemberIdx
	b _02065B04
_02065A30:
	cmp r1, #0x16
	blt _02065A84
	cmp r1, #0x19
	bgt _02065A84
	mov r0, #0xd
	sub r4, r1, #0x16
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065A64
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065A64:
	add r0, sp, #8
	bl sub_02056E04
	cmp r4, r0
	bge _02065B00
	add r0, sp, #8
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065A84:
	cmp r1, #0x1a
	blt _02065AD8
	cmp r1, #0x1d
	bgt _02065AD8
	mov r0, #0xd
	sub r4, r1, #0x1a
	bl OverlayIsLoaded
	cmp r0, #0
	beq _02065AB8
	bl ov11_022E96E4
	cmp r0, #0
	mvnne r0, #0
	bne _02065B04
_02065AB8:
	add r0, sp, #0
	bl sub_02056D70
	cmp r4, r0
	bge _02065B00
	add r0, sp, #0
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	b _02065B04
_02065AD8:
	cmp r1, #0x1e
	blt _02065AE8
	cmp r1, #0x2d
	ble _02065B00
_02065AE8:
	cmp r1, #0x99
	bne _02065B00
	mov r0, #0x214
	mov r1, #0
	bl sub_020555D0
	b _02065B04
_02065B00:
	mvn r0, #0
_02065B04:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end GetActorMatchingStorageId

	arm_func_start sub_02065B14
sub_02065B14: ; 0x02065B14
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	ldr r2, _02065B38 ; =ENTITIES
	mov r1, #0xc
	smlabb r0, r0, r1, r2
	ldrh r0, [r0, #8]
	bx lr
	.align 2, 0
_02065B38: .word ENTITIES
	arm_func_end sub_02065B14

	arm_func_start SetActorTalkMainAndActorTalkSub
SetActorTalkMainAndActorTalkSub: ; 0x02065B3C
	ldr r2, _02065B4C ; =_020B0B08
	strh r0, [r2, #0x18]
	strh r1, [r2, #0x16]
	bx lr
	.align 2, 0
_02065B4C: .word _020B0B08
	arm_func_end SetActorTalkMainAndActorTalkSub

	arm_func_start SetActorTalkMain
SetActorTalkMain: ; 0x02065B50
	ldr r1, _02065B5C ; =_020B0B08
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_02065B5C: .word _020B0B08
	arm_func_end SetActorTalkMain

	arm_func_start SetActorTalkSub
SetActorTalkSub: ; 0x02065B60
	ldr r1, _02065B6C ; =_020B0B08
	strh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_02065B6C: .word _020B0B08
	arm_func_end SetActorTalkSub

	arm_func_start sub_02065B70
sub_02065B70: ; 0x02065B70
	ldr r1, _02065B7C ; =_020B0B08
	strh r0, [r1, #0x14]
	bx lr
	.align 2, 0
_02065B7C: .word _020B0B08
	arm_func_end sub_02065B70

	arm_func_start sub_02065B80
sub_02065B80: ; 0x02065B80
	ldr r2, _02065B90 ; =_020B0B08
	strh r0, [r2, #0x10]
	strh r1, [r2, #0xe]
	bx lr
	.align 2, 0
_02065B90: .word _020B0B08
	arm_func_end sub_02065B80

	arm_func_start sub_02065B94
sub_02065B94: ; 0x02065B94
	ldr ip, _02065BA8 ; =SaveScriptVariableValue
	mov r2, r0
	mov r0, #0
	mov r1, #0x44
	bx ip
	.align 2, 0
_02065BA8: .word SaveScriptVariableValue
	arm_func_end sub_02065B94

	arm_func_start sub_02065BAC
sub_02065BAC: ; 0x02065BAC
	ldr ip, _02065BC4 ; =_020B0B08
	strh r0, [ip, #2]
	strh r1, [ip]
	strh r2, [ip, #8]
	strh r3, [ip, #6]
	bx lr
	.align 2, 0
_02065BC4: .word _020B0B08
	arm_func_end sub_02065BAC

	arm_func_start sub_02065BC8
sub_02065BC8: ; 0x02065BC8
	ldr r1, _02065BD4 ; =_020B0B08
	strh r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02065BD4: .word _020B0B08
	arm_func_end sub_02065BC8

	arm_func_start sub_02065BD8
sub_02065BD8: ; 0x02065BD8
	ldr ip, _02065BE8 ; =StrncpySimple
	mov r2, r1
	ldr r1, _02065BEC ; =_022B7310
	bx ip
	.align 2, 0
_02065BE8: .word StrncpySimple
_02065BEC: .word _022B7310
	arm_func_end sub_02065BD8

	arm_func_start sub_02065BF0
sub_02065BF0: ; 0x02065BF0
	ldr ip, _02065C00 ; =StrncpySimpleNoPadSafe
	ldr r1, _02065C04 ; =_022B7310
	mov r2, #0xa
	bx ip
	.align 2, 0
_02065C00: .word StrncpySimpleNoPadSafe
_02065C04: .word _022B7310
	arm_func_end sub_02065BF0

	arm_func_start sub_02065C08
sub_02065C08: ; 0x02065C08
	ldr ip, _02065C44 ; =_022B7310
	mov r3, #0
	b _02065C20
_02065C14:
	ldrb r2, [r0], #1
	add r3, r3, #1
	strb r2, [ip], #1
_02065C20:
	cmp r3, r1
	blt _02065C14
	mov r0, #0
	b _02065C38
_02065C30:
	strb r0, [ip], #1
	add r3, r3, #1
_02065C38:
	cmp r3, #0x10
	blt _02065C30
	bx lr
	.align 2, 0
_02065C44: .word _022B7310
	arm_func_end sub_02065C08

	arm_func_start RandomizeDemoActors
RandomizeDemoActors: ; 0x02065C48
	stmdb sp!, {r3, lr}
	mov r0, #0x12
	bl RandInt
	ldr r2, _02065C78 ; =DEMO_TEAMS
	mov r3, r0, lsl #2
	ldr r1, _02065C7C ; =_020A68CA
	ldrsh r2, [r2, r3]
	ldr r0, _02065C80 ; =_020B0B08
	ldrsh r1, [r1, r3]
	strh r2, [r0, #0xa]
	strh r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02065C78: .word DEMO_TEAMS
_02065C7C: .word _020A68CA
_02065C80: .word _020B0B08
	arm_func_end RandomizeDemoActors

	arm_func_start sub_02065C84
sub_02065C84: ; 0x02065C84
	mov r2, #0
	ldr r1, _02065CAC ; =_022B7320
	mov r0, r2
_02065C90:
	strh r0, [r1]
	add r2, r2, #1
	strh r0, [r1, #2]
	cmp r2, #4
	add r1, r1, #4
	blt _02065C90
	bx lr
	.align 2, 0
_02065CAC: .word _022B7320
	arm_func_end sub_02065C84

	arm_func_start sub_02065CB0
sub_02065CB0: ; 0x02065CB0
	bx lr
	arm_func_end sub_02065CB0

	arm_func_start sub_02065CB4
sub_02065CB4: ; 0x02065CB4
	ldrh r2, [r1]
	ldr r3, _02065CD4 ; =_022B7320
	mov ip, r0, lsl #2
	strh r2, [r3, ip]
	ldrh r1, [r1, #2]
	add r0, r3, r0, lsl #2
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02065CD4: .word _022B7320
	arm_func_end sub_02065CB4

	arm_func_start sub_02065CD8
sub_02065CD8: ; 0x02065CD8
	ldr r2, _02065CF0 ; =_022B7320
	mov r3, r0
	mov r0, r1
	ldr ip, _02065CF4 ; =BulkItemToItem
	add r1, r2, r3, lsl #2
	bx ip
	.align 2, 0
_02065CF0: .word _022B7320
_02065CF4: .word BulkItemToItem
	arm_func_end sub_02065CD8

	arm_func_start ItemAtTableIdx
ItemAtTableIdx: ; 0x02065CF8
	ldr r3, _02065D18 ; =_022B7320
	mov r2, r0, lsl #2
	ldrh r2, [r3, r2]
	add r0, r3, r0, lsl #2
	strh r2, [r1]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_02065D18: .word _022B7320
	arm_func_end ItemAtTableIdx

	arm_func_start MainLoop
MainLoop: ; 0x02065D1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	bl sub_020024A0
	mov r7, r0
	mov r8, #1
	bl sub_02065C84
	bl sub_020205E4
	bl LoadTblTalk
	bl sub_0201DD90
	bl sub_0201BB3C
	bl sub_0201D7A8
	ldr r0, _02066374 ; =WAN_TABLE
	mov r1, #0x80
	ldr r0, [r0]
	bl InitWanTable
	bl sub_0201F208
	bl DirectoryFileMngr_ExtractAllDirectoryFiles
	bl sub_0204AB18
	bl InitKaomadoStream
	bl sub_02025AD8
	bl sub_02026E78
	bl sub_020346C0
	mov r0, #0
	bl sub_0204B018
	mov r0, #2
	bl SetBothScreensWindowsColor
	bl sub_0204A1A4
	bl sub_02048420
	bl KeyWaitInit
	add r0, sp, #4
	bl ReadSaveHeader
#ifdef EUROPE
	mov r4, r0
	bl sub_020205F8
	cmp r4, #1
#else
	cmp r0, #1
#endif
	bne _02065DF0
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, r8
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #4
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065DF0:
	cmp r7, #0
	cmpne r7, #5
	mov r0, #2
	bne _02065E2C
	mov r4, #1
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #2
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	b _02065E54
_02065E2C:
	mov r4, #0
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #1
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065E54:
	bl SetAdventureLogStructLocation
	bl sub_0204F9B8
	bl GlobalProgressAlloc
	bl sub_02052C3C
	bl LoadWazaP
	bl sub_0200CA8C
	bl sub_0205C73C
	bl sub_0205B44C
	bl KeyWaitInit
	bl InitScriptVariableValues
	cmp r4, #0
	beq _02065EE0
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #3
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
	mov r0, #0
	mov r1, #0x5c
	bl ZinitScriptVariable
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xd
	bl LoadOverlay
	mov r0, #0
	bl ov11_022E82CC
	mov r0, #0xd
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065EE0:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #4
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	bl sub_02048430
	mov r4, #0xf
	mov r5, #2
	mov sl, #4
	mov fp, r4
	mov r6, #0
_02065F20:
	mov r0, r6
	bl sub_0204B018
	bl sub_02048624
	cmp r8, #0
	beq _02065FE0
	bl NoteLoadBase
	movs sb, r0
	beq _02065FCC
	cmp sb, #1
	bne _02065F70
	mov r0, r5
	bl LoadOverlay
	mov r0, r4
	bl LoadOverlay
	mov r0, sl
	bl ExplorersOfSkyMain
	mov r0, fp
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065F70:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #3
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	bl sub_02048454
	cmp sb, #5
	beq _02065FCC
	mov r0, #2
	bl LoadOverlay
	mov r0, #0xf
	bl LoadOverlay
	mov r0, #6
	bl ExplorersOfSkyMain
	mov r0, #0xf
	bl UnloadOverlay
	mov r0, #2
	bl UnloadOverlay
_02065FCC:
	add r0, sp, #0
	bl sub_0204AF98
	ldrb r0, [sp]
	bl sub_02027180
	bl sub_020205F8
_02065FE0:
	sub r0, r7, #6
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _020660B0
_02065FF0: ; jump table
	b _02066030 ; case 0
	b _02066040 ; case 1
	b _02066038 ; case 2
	b _02066048 ; case 3
	b _02066050 ; case 4
	b _02066058 ; case 5
	b _02066060 ; case 6
	b _02066068 ; case 7
	b _02066070 ; case 8
	b _02066078 ; case 9
	b _02066080 ; case 10
	b _02066088 ; case 11
	b _02066090 ; case 12
	b _02066098 ; case 13
	b _020660A0 ; case 14
	b _020660A8 ; case 15
_02066030:
	mov sb, #4
	b _020660FC
_02066038:
	mov sb, #6
	b _020660FC
_02066040:
	mov sb, #5
	b _020660FC
_02066048:
	mov sb, #7
	b _020660FC
_02066050:
	mov sb, #9
	b _020660FC
_02066058:
	mov sb, #0xa
	b _020660FC
_02066060:
	mov sb, #0xb
	b _020660FC
_02066068:
	mov sb, #0xc
	b _020660FC
_02066070:
	mov sb, #0xd
	b _020660FC
_02066078:
	mov sb, #0xe
	b _020660FC
_02066080:
	mov sb, #0xf
	b _020660FC
_02066088:
	mov sb, #0x10
	b _020660FC
_02066090:
	mov sb, #0x10
	b _020660FC
_02066098:
	mov sb, #0x12
	b _020660FC
_020660A0:
	mov sb, #0x13
	b _020660FC
_020660A8:
	mov sb, #0x14
	b _020660FC
_020660B0:
	cmp r7, #2
	moveq r7, #1
	beq _020660C8
	cmp r7, #3
	moveq r7, #2
	movne r7, #0
_020660C8:
	mov r0, #0
	bl sub_0204B018
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, r7
	bl ov00_022BE0C8
	mov sb, r0
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
_020660FC:
	cmp sb, #6
	mov r7, #1
	bne _02066134
	mov r0, r7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne sb, #0xa
	bne _02066134
	mov r0, #7
	mov r1, #0
	bl GetSosMailCount
	cmp r0, #0
	movne sb, #9
_02066134:
	bl GetSpecialEpisodeType
	mov r1, r0
	ldr r0, _02066378 ; =_020A9208
	bl Debug_Print0
	sub r0, sb, #4
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02065F20
_02066154: ; jump table
	b _0206617C ; case 0
	b _020661B0 ; case 1
	b _020661FC ; case 2
	b _0206622C ; case 3
	b _02065F20 ; case 4
	b _0206625C ; case 5
	b _0206628C ; case 6
	b _020662BC ; case 7
	b _02066300 ; case 8
	b _02066330 ; case 9
_0206617C:
	mov r0, #2
	bl sub_0204B018
	bl sub_020484C0
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #0
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020661B0:
	bl sub_0204C918
	bl SetSpecialEpisodeType
	mov r0, #3
	bl sub_0204B018
	bl sub_02048644
	bl InitSpecialEpisodeHero
	mov r0, #2
	mov r1, #0x36
	mov r2, #0
	bl SetScenarioScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #0
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020661FC:
	mov r0, #2
	bl sub_0204B018
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206622C:
	mov r0, #3
	bl sub_0204B018
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206625C:
	mov r0, #2
	bl sub_0204B018
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #2
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_0206628C:
	mov r0, #2
	bl sub_0204B018
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #3
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_020662BC:
	mov r0, #4
	bl sub_0204B018
	bl sub_02048644
	bl sub_020485C4
	mov r0, #2
	mov r1, #0x33
	mov r2, #0
	bl SetScenarioScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_02066300:
	mov r0, #4
	bl sub_0204B018
	bl sub_02048644
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
_02066330:
	mov r0, #5
	bl sub_0204B018
	bl sub_02048644
	bl sub_020485D8
	mov r0, #2
	mov r1, #0x34
	mov r2, #0
	bl SetScenarioScriptVar
	mov r0, #2
	bl LoadOverlay
	mov r0, #1
	bl MainGame
	mov r8, r0
	mov r0, #2
	bl UnloadOverlay
	bl sub_0204872C
	b _02065F20
	.align 2, 0
_02066374: .word WAN_TABLE
_02066378: .word _020A9208
	arm_func_end MainLoop

	arm_func_start sub_0206637C
sub_0206637C: ; 0x0206637C
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0206639C
	mov r0, #3
	bl ov00_022BE0C8
	ldmia sp!, {r3, pc}
_0206639C:
	mov r0, #1
	bl LoadOverlay
	mov r0, #4
	bl LoadOverlay
	mov r0, #3
	bl ov00_022BE0C8
	mov r0, #4
	bl UnloadOverlay
	mov r0, #1
	bl UnloadOverlay
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206637C

	arm_func_start sub_020663C8
sub_020663C8: ; 0x020663C8
	stmdb sp!, {r3, lr}
	ldrsb ip, [sp, #8]
	str ip, [sp]
	bl sub_02046A9C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020663C8

	arm_func_start sub_020663DC
sub_020663DC: ; 0x020663DC
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	mov ip, #0
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end sub_020663DC

	arm_func_start sub_02066408
sub_02066408: ; 0x02066408
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [sp, #0x10]
	ldrh lr, [sp, #0x14]
	str ip, [sp]
	ldr ip, [sp, #0x18]
	str lr, [sp, #4]
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end sub_02066408

	arm_func_start sub_02066434
sub_02066434: ; 0x02066434
	stmdb sp!, {r3, lr}
	bl sub_02046B04
	mvn r1, #1
	cmp r0, r1
	moveq r0, #0x1f
	ldmeqia sp!, {r3, pc}
	add r1, r1, #1
	cmp r0, r1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02066434

	arm_func_start sub_0206645C
sub_0206645C: ; 0x0206645C
	ldr ip, _02066464 ; =sub_02046BA0
	bx ip
	.align 2, 0
_02066464: .word sub_02046BA0
	arm_func_end sub_0206645C

	arm_func_start sub_02066468
sub_02066468: ; 0x02066468
	ldr ip, _02066474 ; =sub_02046BE8
	mov r2, #0
	bx ip
	.align 2, 0
_02066474: .word sub_02046BE8
	arm_func_end sub_02066468

	arm_func_start sub_02066478
sub_02066478: ; 0x02066478
	ldr ip, _02066484 ; =sub_02046C30
	mov r2, #0
	bx ip
	.align 2, 0
_02066484: .word sub_02046C30
	arm_func_end sub_02066478

	arm_func_start sub_02066488
sub_02066488: ; 0x02066488
	ldr ip, _02066490 ; =sub_02046BE8
	bx ip
	.align 2, 0
_02066490: .word sub_02046BE8
	arm_func_end sub_02066488

	arm_func_start sub_02066494
sub_02066494: ; 0x02066494
	stmdb sp!, {r3, lr}
	bl sub_02046C78
	cmp r0, #0
	movne r0, #0x1f
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02066494

	arm_func_start sub_020664AC
sub_020664AC: ; 0x020664AC
	ldr ip, _020664B4 ; =sub_02046D20
	bx ip
	.align 2, 0
_020664B4: .word sub_02046D20
	arm_func_end sub_020664AC

	arm_func_start sub_020664B8
sub_020664B8: ; 0x020664B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020676AC
	ldr r2, _0206650C ; =_020B0B24
	mov r3, #0
	mov r0, #0xa8
	mov r1, #8
	strb r3, [r2]
	bl MemAlloc
	ldr r2, _0206650C ; =_020B0B24
	mov r1, #0xa8
	str r0, [r2, #4]
	bl MemZero
	ldr r1, _0206650C ; =_020B0B24
	mov r2, #0
	ldr r3, [r1, #4]
	mov r0, #1
	str r4, [r3, #8]
	ldr r1, [r1, #4]
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206650C: .word _020B0B24
	arm_func_end sub_020664B8

	arm_func_start sub_02066510
sub_02066510: ; 0x02066510
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r0, _02066874 ; =_020B0B24
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02066868
_02066530: ; jump table
	b _02066544 ; case 0
	b _02066640 ; case 1
	b _02066700 ; case 2
	b _02066708 ; case 3
	b _02066724 ; case 4
_02066544:
	mov r2, #0
	add r1, r1, #0xa4
	mov r0, r2
_02066550:
	strb r0, [r1, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _02066550
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0x98
	ldr r0, [r0, #4]
	add r0, r0, #0xc
	bl MemZero
	ldr r0, _02066874 ; =_020B0B24
	ldr r2, [r0, #4]
	add r1, r2, #0xa4
	str r1, [r2, #0x6c]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020665B4
	ldr r4, _02066878 ; =JOB_MENU_ITEMS_1
	bl sub_0205E954
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	streqb r1, [r0, #0xa4]
	b _020665D8
_020665B4:
	cmp r0, #1
	bne _020665D8
	ldr r4, _0206687C ; =JOB_MENU_ITEMS_2
	bl sub_0205EAC8
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	streqb r1, [r0, #0xa4]
_020665D8:
	bl CountJobListMissions
	cmp r0, #0
	ldreq r0, _02066874 ; =_020B0B24
	moveq r1, #3
	ldreq r0, [r0, #4]
	ldr r3, _02066874 ; =_020B0B24
	streqb r1, [r0, #0xa5]
	ldrsb r2, [r3]
	ldr ip, [r3, #4]
	mov r1, #0
	add r2, r4, r2, lsl #3
	ldr lr, [r2, #4]
	ldr r0, _02066880 ; =JOB_WINDOW_PARAMS_1
	str lr, [ip, #0xc]
	str r4, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r3, #4]
	ldr r2, _02066884 ; =0x00000233
	add r3, r3, #0xc
	bl sub_02046A20
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_02066640:
	bl sub_02046B04
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	moveq r4, #4
	beq _02066674
	sub r0, r1, #1
	cmp r4, r0
	moveq r4, #4
	beq _02066674
	add r0, r1, #1
	cmp r4, r0
	moveq r4, #0
_02066674:
	bl sub_02046BA0
	ldr r1, _02066874 ; =_020B0B24
	cmp r4, #1
	strb r0, [r1]
	bne _020666A4
	ldr r0, [r1, #4]
	mov r2, #0xa
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666A4:
	cmp r4, #2
	bne _020666C8
	ldr r0, [r1, #4]
	mov r2, #0xb
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666C8:
	cmp r4, #3
	bne _020666EC
	ldr r0, [r1, #4]
	mov r2, #0xe
	str r2, [r0, #4]
	ldr r0, [r1, #4]
	mov r1, #3
	str r1, [r0]
	b _02066868
_020666EC:
	cmp r4, #4
	ldreq r0, [r1, #4]
	moveq r1, #2
	streq r1, [r0]
	b _02066868
_02066700:
	mov r0, #1
	b _0206686C
_02066708:
	ldr r0, [r1, #4]
	bl sub_020668B4
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_02066724:
	bl sub_02066A44
	movs r4, r0
	beq _02066868
	bl sub_02067664
	add r0, r4, #1
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _02066868
_02066744: ; jump table
	b _02066858 ; case 0
	b _02066868 ; case 1
	b _020667A4 ; case 2
	b _02066868 ; case 3
	b _020667B8 ; case 4
	b _020667C0 ; case 5
	b _020667C8 ; case 6
	b _020667D0 ; case 7
	b _020667D8 ; case 8
	b _020667E0 ; case 9
	b _020667E8 ; case 10
	b _020667F0 ; case 11
	b _020667F8 ; case 12
	b _02066800 ; case 13
	b _02066808 ; case 14
	b _02066810 ; case 15
	b _02066818 ; case 16
	b _02066820 ; case 17
	b _02066828 ; case 18
	b _02066830 ; case 19
	b _02066838 ; case 20
	b _02066840 ; case 21
	b _02066848 ; case 22
	b _02066850 ; case 23
_020667A4:
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0]
	b _02066868
_020667B8:
	mov r0, #2
	b _0206686C
_020667C0:
	mov r0, #3
	b _0206686C
_020667C8:
	mov r0, #4
	b _0206686C
_020667D0:
	mov r0, #5
	b _0206686C
_020667D8:
	mov r0, #6
	b _0206686C
_020667E0:
	mov r0, #7
	b _0206686C
_020667E8:
	mov r0, #8
	b _0206686C
_020667F0:
	mov r0, #9
	b _0206686C
_020667F8:
	mov r0, #0xa
	b _0206686C
_02066800:
	mov r0, #0xb
	b _0206686C
_02066808:
	mov r0, #0xc
	b _0206686C
_02066810:
	mov r0, #0xd
	b _0206686C
_02066818:
	mov r0, #0xe
	b _0206686C
_02066820:
	mov r0, #0xf
	b _0206686C
_02066828:
	mov r0, #0x10
	b _0206686C
_02066830:
	mov r0, #0x11
	b _0206686C
_02066838:
	mov r0, #0x12
	b _0206686C
_02066840:
	mov r0, #0x13
	b _0206686C
_02066848:
	mov r0, #0x14
	b _0206686C
_02066850:
	mov r0, #0x15
	b _0206686C
_02066858:
	ldr r0, _02066874 ; =_020B0B24
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0]
_02066868:
	mov r0, #0
_0206686C:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02066874: .word _020B0B24
_02066878: .word JOB_MENU_ITEMS_1
_0206687C: .word JOB_MENU_ITEMS_2
_02066880: .word JOB_WINDOW_PARAMS_1
_02066884: .word 0x00000233
	arm_func_end sub_02066510

	arm_func_start sub_02066888
sub_02066888: ; 0x02066888
	stmdb sp!, {r3, lr}
	ldr r0, _020668B0 ; =_020B0B24
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _020668B0 ; =_020B0B24
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020668B0: .word _020B0B24
	arm_func_end sub_02066888

	arm_func_start sub_020668B4
sub_020668B4: ; 0x020668B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	sub r0, r5, #0x13
	cmp r0, #2
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
	ldr r0, _02066988 ; =0x00000EF8
	mov r1, #8
	bl MemAlloc
	ldr r2, _0206698C ; =_020B0B2C
	ldr r1, _02066988 ; =0x00000EF8
	str r0, [r2, #0x14]
	bl MemZero
	ldr r0, _0206698C ; =_020B0B2C
	mov r2, #0
	ldr r4, [r0, #0x14]
	mov r1, r2
_020668F8:
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #0x4c]
	cmp r2, #0x20
	blt _020668F8
	ldr r0, _0206698C ; =_020B0B2C
	ldr r0, [r0, #0x14]
	str r5, [r0, #4]
	str r1, [r4, #8]
	str r1, [r4, #0xef0]
	bl sub_020686F4
	mov r2, #0
	str r2, [r4, #0x74]
	sub r1, r2, #1
	str r1, [r4, #0x78]
	cmp r0, #0
	bne _0206695C
	bl sub_020692B4
	ldr r0, _0206698C ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r1, _0206698C ; =_020B0B2C
	mov r0, #0
	str r0, [r1, #0x14]
	ldmia sp!, {r3, r4, r5, pc}
_0206695C:
	sub r0, r2, #2
	strb r0, [r4, #0x7d]
	bl sub_020692FC
	mvn r1, #1
	ldr r0, _0206698C ; =_020B0B2C
	strb r1, [r4, #0xd85]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02066988: .word 0x00000EF8
_0206698C: .word _020B0B2C
	arm_func_end sub_020668B4

	arm_func_start sub_02066990
sub_02066990: ; 0x02066990
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r0, _02066A3C ; =0x00000EF8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	ldr r2, _02066A40 ; =_020B0B2C
	ldr r1, _02066A3C ; =0x00000EF8
	str r0, [r2, #0x14]
	bl MemZero
	ldr r0, _02066A40 ; =_020B0B2C
	mov r1, #0
	ldr r4, [r0, #0x14]
	str r8, [r4, #4]
	str r7, [r4, #0x74]
	str r6, [r4, #0x6c]
	str r5, [r4, #0x78]
	str r1, [r4, #8]
	str r1, [r4, #0xef0]
	bl sub_020686F4
	cmp r0, #0
	bne _02066A10
	bl sub_020692B4
	ldr r0, _02066A40 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r1, _02066A40 ; =_020B0B2C
	mov r0, #0
	str r0, [r1, #0x14]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02066A10:
	mvn r0, #1
	strb r0, [r4, #0x7d]
	bl sub_020692FC
	mvn r1, #1
	ldr r0, _02066A40 ; =_020B0B2C
	strb r1, [r4, #0xd85]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02066A3C: .word 0x00000EF8
_02066A40: .word _020B0B2C
	arm_func_end sub_02066990

	arm_func_start sub_02066A44
sub_02066A44: ; 0x02066A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r6, [r0, #0x14]
	ldr r0, [r6]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02067494
_02066A64: ; jump table
	b _02066A80 ; case 0
	b _02066B08 ; case 1
	b _02066DA4 ; case 2
	b _02066DAC ; case 3
	b _020672F4 ; case 4
	b _02067374 ; case 5
	b _02067474 ; case 6
_02066A80:
	bl sub_020691B8
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #1
	ldr r1, [r0, #0x14]
	str r2, [r1]
	ldr r1, [r6, #0xee4]
	cmp r1, #0
	bne _02066AF4
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	sub r0, r0, #0xa
	cmp r0, #3
	bhi _02066AC8
	add r0, r1, #0x2e4
	ldr r1, _020674A4 ; =_020A92A8
	ldr r2, _020674A8 ; =sub_020696E8
	add r0, r0, #0xc00
	bl sub_0204707C
_02066AC8:
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	cmp r0, #0xe
	bne _02067494
	add r0, r1, #0x2e4
	ldr r1, _020674A4 ; =_020A92A8
	ldr r2, _020674AC ; =sub_02069750
	add r0, r0, #0xc00
	bl sub_0204707C
	b _02067494
_02066AF4:
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047188
	b _02067494
_02066B08:
	ldrsb r0, [r6, #0x7d]
	bl sub_0202C748
	ldr r1, [r6, #0xef0]
	mov r4, r0
	cmp r1, #0
	strneb r4, [r1]
	ldrsb r0, [r6, #0x7d]
	bl IsCollectionMenuActive
	cmp r0, #0
	bne _02066D68
	ldrsb r0, [r6, #0x7d]
	bl sub_0202C75C
	movs r5, r0
	bpl _02066BAC
	mov r2, #0
	mov r1, r2
	b _02066B58
_02066B4C:
	add r0, r6, r2
	strb r1, [r0, #0x4c]
	add r2, r2, #1
_02066B58:
	ldr r0, [r6, #0x6c]
	cmp r2, r0
	blt _02066B4C
	mvn r0, #0
	str r0, [r6, #8]
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	sub r0, r0, #0xa
	cmp r0, #3
	bhi _02066BA4
	bl sub_0205F5A8
	bl sub_0205F710
_02066BA4:
	mvn r0, #0
	b _02067498
_02066BAC:
	bl sub_020674E8
	cmp r0, #0
	beq _02066BE8
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	sub r0, r0, #0x12
	cmp r0, #1
	bhi _02066D68
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02066D68
_02066BE8:
	ldr r3, [r6, #8]
	cmp r3, r5
	bne _02066D64
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r2, [r1, #4]
	cmp r2, #0xe
	cmpne r2, #0xf
	cmpne r2, #0x11
	moveq r0, #2
	streq r0, [r1]
	beq _02066D68
	sub r1, r2, #0xa
	cmp r1, #3
	bhi _02066CF4
	bl CountJobListMissions
	cmp r0, #8
	bge _02066CEC
	ldr r1, _020674A0 ; =_020B0B2C
	mov r0, #0
	ldr r1, [r1, #0x14]
	ldr r1, [r1, #4]
	sub r1, r1, #0xa
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02066CCC
_02066C50: ; jump table
	b _02066C60 ; case 0
	b _02066C7C ; case 1
	b _02066C98 ; case 2
	b _02066CB4 ; case 3
_02066C60:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	b _02066CCC
_02066C7C:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	b _02066CCC
_02066C98:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	b _02066CCC
_02066CB4:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
_02066CCC:
	bl AddMissionToJobList
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047188
_02066CEC:
	bl sub_020691B8
	b _02066D68
_02066CF4:
	cmp r2, #0x10
	bne _02066D04
	bl sub_020691B8
	b _02066D68
_02066D04:
	sub r1, r2, #0x12
	cmp r1, #1
	bhi _02066D30
	add r1, r6, r3
	mov r2, #1
	strb r2, [r1, #0x4c]
	ldr r0, [r0, #0x14]
	mov r1, #2
	str r1, [r0]
	bl sub_020692B4
	b _02066D68
_02066D30:
	cmp r2, #9
	cmpne r2, #0x14
	cmpne r2, #4
	bne _02066D58
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #2
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02066D68
_02066D58:
	bl sub_020692B4
	mov r0, #1
	b _02067498
_02066D64:
	bl sub_020691B8
_02066D68:
	bl sub_020698B8
	cmp r0, #0
	beq _02066D90
	cmp r4, #0
	blt _02066D90
	ldr r0, [r6, #8]
	cmp r0, r4
	beq _02066D90
	str r4, [r6, #8]
	bl sub_0206937C
_02066D90:
	ldr r0, [r6, #0xee4]
	cmp r0, #0
	beq _02067494
	bl sub_020470D0
	b _02067494
_02066DA4:
	bl sub_02067708
	b _02067494
_02066DAC:
	bl sub_02046B04
	bl sub_02068308
	ldr r1, [r6, #0xef4]
	mov r4, r0
	cmp r1, #0
	beq _02066DD0
	bl sub_02046BA0
	ldr r1, [r6, #0xef4]
	strb r0, [r1]
_02066DD0:
	cmp r4, #1
	bne _02066E00
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #9
	bne _02066DF4
	bl sub_0206955C
	bl sub_02046D20
_02066DF4:
	bl sub_020692B4
	mov r0, #1
	b _02067498
_02066E00:
	cmp r4, #2
	bne _02066EDC
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #0xa
	bne _02066E3C
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	bl AddMissionToJobList
	b _02066EC0
_02066E3C:
	cmp r0, #0xb
	bne _02066E64
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	bl AddMissionToJobList
	b _02066EC0
_02066E64:
	cmp r0, #0xc
	bne _02066E8C
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	bl AddMissionToJobList
	b _02066EC0
_02066E8C:
	cmp r0, #0xd
	bne _02066EB4
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	bl AddMissionToJobList
	b _02066EC0
_02066EB4:
	cmp r0, #0x14
	moveq r0, #1
	beq _02067498
_02066EC0:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066EDC:
	cmp r4, #3
	bne _02066EF4
	bl sub_02067C8C
	cmp r0, #0
	beq _02067494
	b _02067498
_02066EF4:
	cmp r4, #4
	bne _02066F44
	bl sub_02046BB4
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, #4
	strb r1, [r0]
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066F44:
	cmp r4, #5
	bne _02067020
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	cmp r0, #0x11
	bne _02066F84
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	mov r0, #1
	b _02067498
_02066F84:
	cmp r0, #0x12
	moveq r0, #1
	beq _02067498
	cmp r0, #0xe
	bne _02066FB4
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #4
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02066FB4:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	bl CountJobListMissions
	cmp r0, #0
	bne _02066FFC
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	mvn r0, #0
	b _02067498
_02066FFC:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #0
	ldr r1, [r0, #0x14]
	mov r0, #1
	str r2, [r1]
	strb r0, [r6, #0xd84]
	b _02067494
_02067020:
	cmp r4, #6
	bne _020670F4
	ldr r3, [r6, #0x70]
	mov r1, #1
	add r0, r6, r3
	strb r1, [r0, #0x4c]
	add r2, r3, #1
	ldr r1, [r6, #0x6c]
	b _0206705C
_02067044:
	add r0, r6, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r6, #0x70]
	bne _02067064
	add r2, r2, #1
_0206705C:
	cmp r2, r1
	blt _02067044
_02067064:
	ldr r0, [r6, #0x70]
	cmp r0, r3
	bne _020670A0
	bl sub_020674E8
	cmp r0, #0
	bne _02067098
	bl sub_02046D20
	mov r1, #0
	ldr r0, _020674A0 ; =_020B0B2C
	str r1, [r6, #8]
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067098:
	mov r0, #2
	b _02067498
_020670A0:
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, _020674B0 ; =_020A937C
	ldrsb r3, [r0, #0xd]
	ldr r0, _020674B4 ; =_020B0B39
	ldr r2, _020674B8 ; =JOB_MENU_ITEMS_11
	ldr r1, [r1, r3, lsl #3]
	add r3, r6, #0x248
	str r1, [r6, #0xe48]
	str r0, [r6, #0xef4]
	mov r0, #0
	ldr r1, _020674BC ; =0x00003878
	str r2, [sp]
	str r1, [sp, #4]
	ldr r2, _020674C0 ; =0x00000233
	mov r1, r0
	add r3, r3, #0xc00
	str r0, [sp, #8]
	bl sub_02046A20
	b _02067494
_020670F4:
	sub r0, r4, #7
	cmp r0, #1
	bhi _02067494
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #4]
	cmp r0, #0x11
	bne _02067134
	bl sub_02046D20
	ldr r1, [r6, #8]
	ldr r0, _020674A0 ; =_020B0B2C
	str r1, [r6, #0xd88]
	ldr r0, [r0, #0x14]
	mov r1, #0
	str r1, [r0]
	b _02067494
_02067134:
	cmp r0, #0x13
	bne _02067210
	ldr r3, [r6, #0x70]
	mov r1, #0
	add r0, r6, r3
	strb r1, [r0, #0x4c]
	mov r2, r3
	ldr r1, [r6, #0x6c]
	b _02067170
_02067158:
	add r0, r6, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r6, #0x70]
	bne _02067178
	add r2, r2, #1
_02067170:
	cmp r2, r1
	blt _02067158
_02067178:
	ldr r0, [r6, #0x70]
	cmp r0, r3
	bne _020671BC
	bl sub_020674E8
	cmp r0, #0
	bne _020671B4
	bl sub_02046D20
	mov r0, #0
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020671B4:
	mov r0, #2
	b _02067498
_020671BC:
	str r0, [r6, #8]
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r1, _020674B0 ; =_020A937C
	ldrsb r3, [r0, #0xd]
	ldr r0, _020674B4 ; =_020B0B39
	ldr r2, _020674B8 ; =JOB_MENU_ITEMS_11
	ldr r1, [r1, r3, lsl #3]
	add r3, r6, #0x248
	str r1, [r6, #0xe48]
	str r0, [r6, #0xef4]
	mov r0, #0
	ldr r1, _020674BC ; =0x00003878
	str r2, [sp]
	str r1, [sp, #4]
	ldr r2, _020674C0 ; =0x00000233
	mov r1, r0
	add r3, r3, #0xc00
	str r0, [sp, #8]
	bl sub_02046A20
	b _02067494
_02067210:
	cmp r0, #9
	bne _02067234
	bl sub_0206955C
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067234:
	cmp r0, #4
	bne _02067254
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067254:
	cmp r0, #0x12
	bne _02067298
	mov r2, #0
	mov r1, r2
	b _02067274
_02067268:
	add r0, r6, r2
	strb r1, [r0, #0x4c]
	add r2, r2, #1
_02067274:
	ldr r0, [r6, #0x6c]
	cmp r2, r0
	blt _02067268
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067298:
	cmp r0, #0x14
	bne _020672B8
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020672B8:
	cmp r0, #0xe
	bne _020672E8
	bl sub_02046BB4
	cmp r4, #7
	bne _020672D4
	mov r0, #0
	bl PlaySeVolumeWrapper
_020672D4:
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_020672E8:
	mov r0, #0
	str r0, [r1]
	b _02067494
_020672F4:
	mov r0, #0
	ldr r5, _020674C4 ; =_020A9268
	bl sub_02046D2C
	str r0, [r6, #0xee8]
	mov r0, #0
	bl sub_020474A0
	str r0, [r6, #0xeec]
	bl sub_020469BC
	bl sub_02068338
	ldr r0, _020674A0 ; =_020B0B2C
	add r3, r6, #0x248
	ldr r0, [r0, #0x14]
	mov r1, #0
	ldr r0, [r0, #4]
	ldr r2, _020674C0 ; =0x00000233
	cmp r0, #0xe
	moveq r0, #7
	streq r0, [r6, #0xe48]
	moveq r0, #0
	streq r0, [r6, #0xef4]
	ldreq r4, _020674C8 ; =JOB_MENU_ITEMS_4
	mov r0, r5
	str r4, [sp]
	str r1, [sp, #4]
	add r3, r3, #0xc00
	str r1, [sp, #8]
	bl sub_02046A20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #5
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067374:
	bl sub_02046B04
	bl sub_02068308
	ldr r1, [r6, #0xef4]
	mov r4, r0
	cmp r1, #0
	beq _02067398
	bl sub_02046BA0
	ldr r1, [r6, #0xef4]
	strb r0, [r1]
_02067398:
	cmp r4, #5
	bne _02067430
	bl sub_020469E8
	ldr r0, [r6, #0xee8]
	bl sub_02046D2C
	ldr r0, [r6, #0xeec]
	bl sub_020474A0
	mov r0, #0
	str r0, [r6, #0xee8]
	str r0, [r6, #0xeec]
	bl sub_02046BB4
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	bl CountJobListMissions
	cmp r0, #0
	bne _0206740C
	bl sub_020692B4
	ldr r0, _020674A0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	mvn r0, #0
	b _02067498
_0206740C:
	bl sub_020686F4
	bl sub_0206937C
	ldr r0, _020674A0 ; =_020B0B2C
	mov r2, #0
	ldr r1, [r0, #0x14]
	mov r0, #1
	str r2, [r1]
	strb r0, [r6, #0xd84]
	b _02067494
_02067430:
	sub r0, r4, #7
	cmp r0, #1
	bhi _02067494
	bl sub_020469E8
	ldr r0, [r6, #0xee8]
	bl sub_02046D2C
	ldr r0, [r6, #0xeec]
	bl sub_020474A0
	mov r0, #0
	str r0, [r6, #0xee8]
	str r0, [r6, #0xeec]
	bl sub_02046BB4
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
	b _02067494
_02067474:
	bl sub_02046C78
	cmp r0, #0
	beq _02067494
	bl sub_02046D20
	ldr r0, _020674A0 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	str r1, [r0]
_02067494:
	mov r0, #0
_02067498:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020674A0: .word _020B0B2C
_020674A4: .word _020A92A8
_020674A8: .word sub_020696E8
_020674AC: .word sub_02069750
_020674B0: .word _020A937C
_020674B4: .word _020B0B39
_020674B8: .word JOB_MENU_ITEMS_11
#if defined(EUROPE)
_020674BC: .word 0x0000387A
#elif defined(JAPAN)
_020674BC: .word 0x000034B6
#else
_020674BC: .word 0x00003878
#endif
_020674C0: .word 0x00000233
_020674C4: .word _020A9268
_020674C8: .word JOB_MENU_ITEMS_4
	arm_func_end sub_02066A44

	arm_func_start sub_020674CC
sub_020674CC: ; 0x020674CC
	ldr r0, _020674E4 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r0, [r1, #8]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	bx lr
	.align 2, 0
_020674E4: .word _020B0B2C
	arm_func_end sub_020674CC

	arm_func_start sub_020674E8
sub_020674E8: ; 0x020674E8
	ldr r0, _02067520 ; =_020B0B2C
	mov ip, #0
	ldr r2, [r0, #0x14]
	mov r0, ip
	ldr r3, [r2, #0x6c]
	b _02067514
_02067500:
	add r1, r2, ip
	ldrb r1, [r1, #0x4c]
	add ip, ip, #1
	cmp r1, #0
	addne r0, r0, #1
_02067514:
	cmp ip, r3
	blt _02067500
	bx lr
	.align 2, 0
_02067520: .word _020B0B2C
	arm_func_end sub_020674E8

	arm_func_start sub_02067524
sub_02067524: ; 0x02067524
	stmdb sp!, {r4, lr}
	mov lr, #0
	mov r4, lr
	ldr r2, _02067580 ; =_020B0B2C
	b _02067568
_02067538:
	cmp lr, r1
	movge r0, #0
	ldmgeia sp!, {r4, pc}
	add r3, ip, r4
	ldrb r3, [r3, #0x4c]
	cmp r3, #0
	addne r3, ip, r4, lsl #1
	ldrnesh ip, [r3, #0xc]
	movne r3, lr, lsl #1
	addne lr, lr, #1
	strneh ip, [r0, r3]
	add r4, r4, #1
_02067568:
	ldr ip, [r2, #0x14]
	ldr r3, [ip, #0x6c]
	cmp r4, r3
	blt _02067538
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02067580: .word _020B0B2C
	arm_func_end sub_02067524

	arm_func_start sub_02067584
sub_02067584: ; 0x02067584
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _02067658
_02067598: ; jump table
	b _020675E8 ; case 0
	b _020675E8 ; case 1
	b _020675E8 ; case 2
	b _020675E8 ; case 3
	b _020675E8 ; case 4
	b _020675E8 ; case 5
	b _020675E8 ; case 6
	b _020675E8 ; case 7
	b _02067658 ; case 8
	b _020675E8 ; case 9
	b _020675E8 ; case 10
	b _020675E8 ; case 11
	b _020675E8 ; case 12
	b _020675E8 ; case 13
	b _02067638 ; case 14
	b _02067638 ; case 15
	b _02067638 ; case 16
	b _02067604 ; case 17
	b _020675E8 ; case 18
	b _02067650 ; case 19
_020675E8:
	add r1, sp, #0
	bl sub_02068390
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067604:
	bl sub_0204E210
	cmp r0, #1
	bne _02067638
	bl CountJobListMissions
	mov r4, r0
	bl GetAdventureLogDungeonFloor
	ldrb r0, [r0]
	bl DungeonRequestsDoneWrapper
	subs r0, r4, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067638:
	bl CountJobListMissions
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _0206765C
_02067650:
	mov r0, #0
	b _0206765C
_02067658:
	mov r0, #1
_0206765C:
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	arm_func_end sub_02067584

	arm_func_start sub_02067664
sub_02067664: ; 0x02067664
	stmdb sp!, {r3, lr}
	ldr r0, _020676A8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	bl sub_02069904
	bl sub_020692B4
	ldr r0, _020676A8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	bl MemFree
	ldr r0, _020676A8 ; =_020B0B2C
	mov r1, #0
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020676A8: .word _020B0B2C
	arm_func_end sub_02067664

	arm_func_start sub_020676AC
sub_020676AC: ; 0x020676AC
	ldr r0, _02067704 ; =_020B0B2C
	mov r1, #0
	strb r1, [r0, #0x10]
	strb r1, [r0, #0xe]
	strb r1, [r0, #9]
	strb r1, [r0, #8]
	strb r1, [r0, #6]
	strb r1, [r0, #0xb]
	strb r1, [r0, #4]
	strb r1, [r0, #0xd]
	strb r1, [r0, #7]
	strb r1, [r0, #3]
	strb r1, [r0, #2]
	strb r1, [r0, #5]
	strb r1, [r0, #1]
	strb r1, [r0]
	strb r1, [r0, #0x13]
	strb r1, [r0, #0x12]
	strb r1, [r0, #0x11]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xf]
	bx lr
	.align 2, 0
_02067704: .word _020B0B2C
	arm_func_end sub_020676AC

	arm_func_start sub_02067708
sub_02067708: ; 0x02067708
#if defined(EUROPE)
#define SUB_02067708_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02067708_WORD_OFFSET -0x3C2
#else
#define SUB_02067708_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x5c
	ldr r1, _02067C00 ; =_020B0B2C
	mov r6, #0
	add r0, sp, #0xc
	mov sb, r6
	ldr r4, [r1, #0x14]
	ldr r7, _02067C04 ; =_020A9298
	ldr r8, _02067C08 ; =0x00000233
	bl InitPreprocessorArgs
	bl sub_02068338
	ldr r1, _02067C00 ; =_020B0B2C
	ldr r0, [r1, #0x14]
	ldr r2, [r0, #4]
	sub r2, r2, #4
	cmp r2, #0x10
	addls pc, pc, r2, lsl #2
	b _02067BC4
_02067750: ; jump table
	b _02067AF8 ; case 0
	b _02067BC4 ; case 1
	b _02067BC4 ; case 2
	b _02067BC4 ; case 3
	b _02067BC4 ; case 4
	b _02067A80 ; case 5
	b _02067794 ; case 6
	b _020677F0 ; case 7
	b _0206784C ; case 8
	b _020678A8 ; case 9
	b _02067904 ; case 10
	b _020679E0 ; case 11
	b _02067BC4 ; case 12
	b _02067A50 ; case 13
	b _02067B20 ; case 14
	b _02067B3C ; case 15
	b _02067BA0 ; case 16
_02067794:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020677C4
	bl CountJobListMissions
	cmp r0, #8
	blt _020677CC
_020677C4:
	mov r0, #3
	strb r0, [r4, #0xee0]
_020677CC:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #0x10]
	ldr r0, _02067C10 ; =_020B0B3C
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020677F0:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	bl AlreadyHaveMission
	cmp r0, #0
	bne _02067820
	bl CountJobListMissions
	cmp r0, #8
	blt _02067828
_02067820:
	mov r0, #3
	strb r0, [r4, #0xee0]
_02067828:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #0xe]
	ldr r0, _02067C18 ; =_020B0B3A
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_0206784C:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	bl AlreadyHaveMission
	cmp r0, #0
	bne _0206787C
	bl CountJobListMissions
	cmp r0, #8
	blt _02067884
_0206787C:
	mov r0, #3
	strb r0, [r4, #0xee0]
_02067884:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #9]
	ldr r0, _02067C1C ; =_020B0B35
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020678A8:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020678D8
	bl CountJobListMissions
	cmp r0, #8
	blt _020678E0
_020678D8:
	mov r0, #3
	strb r0, [r4, #0xee0]
_020678E0:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C0C ; =_020A9364
	ldrsb r2, [r0, #8]
	ldr r0, _02067C20 ; =_020B0B34
	ldr r5, _02067C14 ; =JOB_MENU_ITEMS_10
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067904:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r5, r0
	ldrb r0, [r5, #4]
	bl DungeonSwapIdToIdx
	ldrb r0, [r5]
	orr r8, r8, #0x400000
	orr r8, r8, #0x80000000
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0206798C
_02067940: ; jump table
	b _0206798C ; case 0
	b _02067954 ; case 1
	b _02067954 ; case 2
	b _02067954 ; case 3
	b _02067954 ; case 4
_02067954:
	mov r0, r5
	bl sub_0205ECF4
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4, #0xee0]
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C24 ; =_020A9394
	ldrsb r2, [r0, #6]
	ldr r0, _02067C28 ; =_020B0B32
	ldr r5, _02067C2C ; =JOB_MENU_ITEMS_12
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_0206798C:
	ldrb r1, [r5, #1]
	cmp r1, #3
	ldreqb r0, [r5, #2]
	cmpeq r0, #3
	moveq r0, #3
	streqb r0, [r4, #0xee0]
	beq _020679BC
	cmp r1, #6
	ldreqb r0, [r5, #2]
	cmpeq r0, #4
	moveq r0, #3
	streqb r0, [r4, #0xee0]
_020679BC:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C30 ; =_020A93B4
	ldrsb r2, [r0, #6]
	ldr r0, _02067C28 ; =_020B0B32
	ldr r5, _02067C34 ; =JOB_MENU_ITEMS_13
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_020679E0:
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r0, [r0]
	cmp r0, #4
	beq _02067A2C
	ldr r0, [r4, #8]
	add r0, r4, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldrb r0, [r0]
	cmp r0, #1
	movne r0, #3
	strneb r0, [r4, #0xee0]
_02067A2C:
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C38 ; =_020A92EC
	ldrsb r2, [r0, #0xb]
	ldr r0, _02067C3C ; =_020B0B37
	ldr r5, _02067C40 ; =JOB_MENU_ITEMS_5
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067A50:
	ldr r5, _02067C44 ; =JOB_MENU_ITEMS_7
	ldr r6, _02067C48 ; =0x000037B0
	mov r7, sb
	bl sub_020692B4
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C4C ; =_020A931C
	ldrsb r2, [r0, #4]
	ldr r0, _02067C50 ; =_020B0B30
	ldr r1, [r1, r2, lsl #3]
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067A80:
	sub r1, r8, #0x100
	str r1, [sp, #0xc]
	add r1, r0, #0xd00
	mov r7, r6
	ldrsb r2, [r1, #0x85]
	sub r1, r7, #2
	ldr r5, _02067C54 ; =JOB_MENU_ITEMS_3
	cmp r2, r1
	ldreq r0, [r0, #4]
	ldr r6, _02067C58 ; =0x0000380C
	mov sb, #0x1000
	cmpeq r0, #9
	bne _02067AE4
	mov r0, r7
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _02067C00 ; =_020B0B2C
	ldr r1, _02067C5C ; =_020A9278
	ldr r3, [r2, #0x14]
	strb r0, [r3, #0xd85]
	ldr r0, [r2, #0x14]
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0x85]
	bl ShowPortraitInPortraitBox
_02067AE4:
	ldr r1, [r5, #0xc]
	mov r0, #0
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
	b _02067BC4
_02067AF8:
	ldrsb r2, [r1, #0xc]
	ldr r1, _02067C60 ; =_020A9304
	ldr r0, _02067C64 ; =_020B0B38
	ldr r1, [r1, r2, lsl #3]
	ldr r5, _02067C68 ; =JOB_MENU_ITEMS_6
	str r1, [r4, #0xe48]
	str r0, [r4, #0xef4]
#ifdef NORTH_AMERICA
	rsb r6, r8, #0x3a40
#else
	ldr r6, _02067FF0 ; =0x0000380F
#endif
	mov r7, sb
	b _02067BC4
_02067B20:
	mov r0, #7
	mov r7, r6
	str r0, [r4, #0xe48]
	str r7, [r4, #0xef4]
	ldr r5, _02067C6C ; =JOB_MENU_ITEMS_9
	ldr r6, _02067C70 ; =0x000038BF
	b _02067BC4
_02067B3C:
	ldr r1, [r4, #0x6c]
	ldr r5, _02067C74 ; =JOB_MENU_ITEMS_11
	ldr r6, _02067C78 ; =0x00003878
	mov r2, sb
	b _02067B68
_02067B50:
	add r0, r4, r2
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	strne r2, [r4, #0x70]
	bne _02067B70
	add r2, r2, #1
_02067B68:
	cmp r2, r1
	blt _02067B50
_02067B70:
	ldr r0, [r4, #0x70]
	mov r7, #0
	str r0, [r4, #8]
	bl sub_0206937C
	ldr r0, _02067C00 ; =_020B0B2C
	ldr r1, _02067C7C ; =_020B0B39
	ldrsb r0, [r0, #0xd]
	add r0, r5, r0, lsl #3
	ldr r0, [r0, #4]
	str r0, [r4, #0xe48]
	str r1, [r4, #0xef4]
	b _02067BC4
_02067BA0:
	ldrsb r2, [r1, #7]
	ldr r1, _02067C80 ; =_020A9334
	ldr r0, _02067C84 ; =_020B0B33
	ldr r1, [r1, r2, lsl #3]
	ldr r5, _02067C88 ; =JOB_MENU_ITEMS_8
	str r1, [r4, #0xe48]
#ifdef NORTH_AMERICA
	add r6, r8, #0x3580
#else
	ldr r6, _02068014 ; =0x000037B5
#endif
	str r0, [r4, #0xef4]
	mov r7, sb
_02067BC4:
	add r3, r4, #0x248
	stmia sp, {r5, r6}
	add r4, sp, #0xc
	mov r0, r7
	mov r1, sb
	mov r2, r8
	add r3, r3, #0xc00
	str r4, [sp, #8]
	bl sub_02046A20
	ldr r0, _02067C00 ; =_020B0B2C
	mov r1, #3
	ldr r0, [r0, #0x14]
	str r1, [r0]
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02067C00: .word _020B0B2C
_02067C04: .word _020A9298
_02067C08: .word 0x00000233
_02067C0C: .word _020A9364
_02067C10: .word _020B0B3C
_02067C14: .word JOB_MENU_ITEMS_10
_02067C18: .word _020B0B3A
_02067C1C: .word _020B0B35
_02067C20: .word _020B0B34
_02067C24: .word _020A9394
_02067C28: .word _020B0B32
_02067C2C: .word JOB_MENU_ITEMS_12
_02067C30: .word _020A93B4
_02067C34: .word JOB_MENU_ITEMS_13
_02067C38: .word _020A92EC
_02067C3C: .word _020B0B37
_02067C40: .word JOB_MENU_ITEMS_5
_02067C44: .word JOB_MENU_ITEMS_7
#ifdef JAPAN
_02067C48: .word 0x00003432
#else
_02067C48: .word 0x000037B0 + SUB_02067708_WORD_OFFSET
#endif
_02067C4C: .word _020A931C
_02067C50: .word _020B0B30
_02067C54: .word JOB_MENU_ITEMS_3
_02067C58: .word 0x0000380C + SUB_02067708_WORD_OFFSET
_02067C5C: .word _020A9278
_02067C60: .word _020A9304
_02067C64: .word _020B0B38
_02067C68: .word JOB_MENU_ITEMS_6
#if defined(EUROPE)
_02067FF0: .word 0x0000380F
#elif defined(JAPAN)
_02067FF0: .word 0x0000344B
#endif
_02067C6C: .word JOB_MENU_ITEMS_9
_02067C70: .word 0x000038BF + SUB_02067708_WORD_OFFSET
_02067C74: .word JOB_MENU_ITEMS_11
_02067C78: .word 0x00003878 + SUB_02067708_WORD_OFFSET
_02067C7C: .word _020B0B39
_02067C80: .word _020A9334
_02067C84: .word _020B0B33
_02067C88: .word JOB_MENU_ITEMS_8
#ifdef EUROPE
_02068014: .word 0x000037B5
#elif defined(JAPAN)
_02068014: .word 0x00003435
#endif
	arm_func_end sub_02067708

	arm_func_start sub_02067C8C
sub_02067C8C: ; 0x02067C8C
#if defined(EUROPE)
#define SUB_02067C8C_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_02067C8C_WORD_OFFSET -0x3C2
#else
#define SUB_02067C8C_WORD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x60
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r6, [r0, #0x14]
	bl sub_02046BB4
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r4, r0
	ldrb r0, [r4, #4]
	bl DungeonSwapIdToIdx
	mov r5, r0
	add r0, sp, #8
	str r0, [sp]
	ldrb r0, [r4, #1]
	add r1, r4, #2
	add r2, sp, #4
	add r3, sp, #0xc
	bl sub_0206276C
	ldrb r1, [r4, #1]
	cmp r1, #0xe
	ldreqb r0, [r4, #2]
	cmpeq r0, #1
	bne _02067E70
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _02067D3C
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _02067D3C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02067D7C
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _02067D7C
_02067D3C:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682E4 ; =0x0000381F
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067D7C:
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #3
	bne _02067DCC
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682E8 ; =0x00003820
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067DCC:
	ldrb r0, [r4, #4]
	mov r4, #0
	sub r0, r0, #0x49
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02067E4C
_02067DE4: ; jump table
	b _02067E30 ; case 0
	b _02067E4C ; case 1
	b _02067E28 ; case 2
	b _02067E4C ; case 3
	b _02067E18 ; case 4
	b _02067E4C ; case 5
	b _02067E20 ; case 6
	b _02067E4C ; case 7
	b _02067E38 ; case 8
	b _02067E4C ; case 9
	b _02067E48 ; case 10
	b _02067E4C ; case 11
	b _02067E40 ; case 12
_02067E18:
	mov r4, #3
	b _02067E4C
_02067E20:
	mov r4, #4
	b _02067E4C
_02067E28:
	mov r4, #5
	b _02067E4C
_02067E30:
	mov r4, #6
	b _02067E4C
_02067E38:
	mov r4, #7
	b _02067E4C
_02067E40:
	mov r4, #8
	b _02067E4C
_02067E48:
	mov r4, #9
_02067E4C:
	ldr r0, [r6, #8]
	add r0, r6, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F588
	bl sub_0205F5A8
	mov r0, r4
	b _020682D8
_02067E70:
	cmp r1, #3
	ldreqb r0, [r4, #2]
	cmpeq r0, #3
	bne _02067FE0
	ldrb r0, [r4, #4]
	bl sub_02063394
	cmp r0, #1
	bne _02067ED0
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef NORTH_AMERICA
	mov r0, #0x1c
	rsb r1, r0, #0x3840
#else
	ldr r1, _02068678 ; =0x00003826
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067ED0:
	cmp r0, #0
	beq _02067F28
	add r0, sp, #0x10
	bl InitPreprocessorArgs
	ldrb r0, [r4, #4]
	str r0, [sp, #0x20]
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682EC ; =0x00003825
	add r2, sp, #0x10
	mov r0, #0x1c
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02067F28:
	mov r0, r5
	mov r1, #3
	bl sub_0204D018
	mov r0, #5
	strb r0, [r4]
	ldrb r0, [r4, #4]
	sub r0, r0, #0x57
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02067FE0
_02067F50: ; jump table
	b _02067F80 ; case 0
	b _02067F88 ; case 1
	b _02067F90 ; case 2
	b _02067F98 ; case 3
	b _02067FA0 ; case 4
	b _02067FA8 ; case 5
	b _02067FB0 ; case 6
	b _02067FB8 ; case 7
	b _02067FC0 ; case 8
	b _02067FC8 ; case 9
	b _02067FD0 ; case 10
	b _02067FD8 ; case 11
_02067F80:
	mov r0, #0xa
	b _020682D8
_02067F88:
	mov r0, #0xb
	b _020682D8
_02067F90:
	mov r0, #0xc
	b _020682D8
_02067F98:
	mov r0, #0xd
	b _020682D8
_02067FA0:
	mov r0, #0xe
	b _020682D8
_02067FA8:
	mov r0, #0xf
	b _020682D8
_02067FB0:
	mov r0, #0x10
	b _020682D8
_02067FB8:
	mov r0, #0x11
	b _020682D8
_02067FC0:
	mov r0, #0x12
	b _020682D8
_02067FC8:
	mov r0, #0x13
	b _020682D8
_02067FD0:
	mov r0, #0x14
	b _020682D8
_02067FD8:
	mov r0, #0x15
	b _020682D8
_02067FE0:
	ldrb r0, [r4, #1]
	cmp r0, #0xb
	bne _02068158
	ldrb r1, [r4, #2]
	cmp r1, #1
	blo _02068158
	cmp r1, #5
	bhi _02068158
	add r1, r4, #2
	mov r2, #0xff
	bl CheckAcceptedMissionByTypeAndDungeon
	cmp r0, #0
	beq _02068054
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682F0 ; =0x00003821
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02068054:
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _02068090
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _02068090
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _020680D0
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	bne _020680D0
_02068090:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef EUROPE
	mov r0, #0x1c
	rsb r1, r0, #0x3840
#else
	ldr r1, _020682F4 ; =0x00003822
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020680D0:
	ldrb r0, [r4, #2]
	cmp r0, #5
	bne _02068158
	mov r0, #0
	bl sub_0204CA1C
	cmp r0, #0
	bne _0206812C
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _020682F8 ; =0x00003823
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_0206812C:
	mov r0, r5
	bl GetDungeonMode
	cmp r0, #3
	beq _02068158
	mov r0, r5
	mov r1, #3
	bl sub_0204D018
	mov r0, #5
	strb r0, [r4]
	mov r0, #0x16
	b _020682D8
_02068158:
	ldrb r1, [r4, #1]
	cmp r1, #6
	ldreqb r0, [r4, #2]
	cmpeq r0, #4
	bne _02068260
	ldrb r0, [r4, #4]
	bl sub_02063394
	mov r6, r0
	bl GetRank
	ldrb r1, [sp, #4]
	cmp r1, r0
	bhi _020681BC
	bl GetScenarioBalance
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bgt _020681BC
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _020681B4
	mov r0, #0x16
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _020681BC
_020681B4:
	cmp r6, #1
	bne _020681FC
_020681BC:
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
#ifdef JAPAN
	mov r0, #0x1c
	rsb r1, r0, #0x3480
#else
	ldr r1, _020682FC ; =0x00003826
	mov r0, #0x1c
#endif
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020681FC:
	cmp r6, #0
	beq _02068244
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _02068300 ; =0x00003827
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_02068244:
	mov r2, #5
	mov r0, r5
	mov r1, #3
	strb r2, [r4]
	bl sub_0204D018
	mov r0, #0xe
	b _020682D8
_02068260:
	cmp r1, #0xc
	beq _020682B8
	ldrb r0, [r4, #4]
	bl CanDungeonBeUsedForMission
	cmp r0, #0
	bne _020682B8
	bl sub_020692B4
	ldr r0, _020682E0 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, #0x2e4
	add r0, r0, #0xc00
	bl sub_02047150
	ldr r1, _02068304 ; =0x00003828
	mov r0, #0x1c
	mov r2, #0
	bl sub_02046BE8
	ldr r0, _020682E0 ; =_020B0B2C
	mov r2, #6
	ldr r1, [r0, #0x14]
	mov r0, #0
	str r2, [r1]
	b _020682D8
_020682B8:
	mov r0, #5
	strb r0, [r4]
	bl sub_020686F4
	bl sub_0206937C
	ldr r1, _020682E0 ; =_020B0B2C
	mov r0, #0
	ldr r1, [r1, #0x14]
	str r0, [r1]
_020682D8:
	add sp, sp, #0x60
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020682E0: .word _020B0B2C
_020682E4: .word 0x0000381F + SUB_02067C8C_WORD_OFFSET
_020682E8: .word 0x00003820 + SUB_02067C8C_WORD_OFFSET
#if defined(EUROPE)
_02068678: .word 0x00003826
#elif defined(JAPAN)
_02068678: .word 0x00003462
#endif
_020682EC: .word 0x00003825 + SUB_02067C8C_WORD_OFFSET
_020682F0: .word 0x00003821 + SUB_02067C8C_WORD_OFFSET
#ifndef EUROPE
_020682F4: .word 0x00003822 + SUB_02067C8C_WORD_OFFSET
#endif
_020682F8: .word 0x00003823 + SUB_02067C8C_WORD_OFFSET
#ifndef JAPAN
_020682FC: .word 0x00003826 + SUB_02067C8C_WORD_OFFSET
#endif
_02068300: .word 0x00003827 + SUB_02067C8C_WORD_OFFSET
_02068304: .word 0x00003828 + SUB_02067C8C_WORD_OFFSET
	arm_func_end sub_02067C8C

	arm_func_start sub_02068308
sub_02068308: ; 0x02068308
	mvn r2, #1
	cmp r0, r2
	moveq r0, #8
	bxeq lr
	sub r1, r2, #1
	cmp r0, r1
	moveq r0, #8
	bxeq lr
	add r1, r2, #1
	cmp r0, r1
	moveq r0, #0
	bx lr
	arm_func_end sub_02068308

	arm_func_start sub_02068338
sub_02068338: ; 0x02068338
	stmdb sp!, {r3, lr}
	ldr r0, _0206838C ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	add r2, r0, #0xee0
	mov r0, r1
_02068350:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _02068350
	ldr r0, _0206838C ; =_020B0B2C
	mov r1, #0x98
	ldr r0, [r0, #0x14]
	add r0, r0, #0x248
	add r0, r0, #0xc00
	bl MemZero
	ldr r0, _0206838C ; =_020B0B2C
	ldr r1, [r0, #0x14]
	add r0, r1, #0xee0
	str r0, [r1, #0xea8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206838C: .word _020B0B2C
	arm_func_end sub_02068338

	arm_func_start sub_02068390
sub_02068390: ; 0x02068390
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	cmp r0, #0x12
	mov r4, #0
	addls pc, pc, r0, lsl #2
	b _020686E4
_020683AC: ; jump table
	b _020683F8 ; case 0
	b _02068468 ; case 1
	b _020684A0 ; case 2
	b _02068510 ; case 3
	b _020684D8 ; case 4
	b _02068548 ; case 5
	b _02068430 ; case 6
	b _02068580 ; case 7
	b _020686E4 ; case 8
	b _020684A0 ; case 9
	b _020685B8 ; case 10
	b _020685E8 ; case 11
	b _02068618 ; case 12
	b _02068634 ; case 13
	b _02068650 ; case 14
	b _020686E4 ; case 15
	b _020686E4 ; case 16
	b _020686E4 ; case 17
	b _02068680 ; case 18
_020683F8:
	ldr r1, _020686F0 ; =_020B0A54
	mov ip, r4
	mov r0, #0xb0
_02068404:
	mul r2, ip, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #0
	movne r2, r4, lsl #1
	strneh ip, [r5, r2]
	add ip, ip, #1
	addne r4, r4, #1
	cmp ip, #0x20
	blt _02068404
	b _020686E4
_02068430:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206843C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #6
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206843C
	b _020686E4
_02068468:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_02068474:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #1
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _02068474
	b _020686E4
_020684A0:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_020684AC:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #2
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _020684AC
	b _020686E4
_020684D8:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_020684E4:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #4
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _020684E4
	b _020686E4
_02068510:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206851C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #3
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206851C
	b _020686E4
_02068548:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_02068554:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #5
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _02068554
	b _020686E4
_02068580:
	ldr r1, _020686F0 ; =_020B0A54
	mov r6, r4
	mov r0, #0xb0
_0206858C:
	mul r2, r6, r0
	ldr r3, [r1]
	ldrb r2, [r3, r2]
	cmp r2, #7
	moveq r2, r4, lsl #1
	streqh r6, [r5, r2]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #0x20
	blt _0206858C
	b _020686E4
_020685B8:
	mov r6, r4
_020685BC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E984
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020685BC
	b _020686E4
_020685E8:
	mov r6, r4
_020685EC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EB00
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020685EC
	b _020686E4
_02068618:
	mov r0, r4
	bl sub_0205EBF0
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r5]
	addeq r4, r4, #1
	b _020686E4
_02068634:
	mov r0, r4
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r5]
	addeq r4, r4, #1
	b _020686E4
_02068650:
	mov r6, r4
_02068654:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F0F0
	cmp r0, #0
	moveq r0, r4, lsl #1
	streqh r6, [r5, r0]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _02068654
	b _020686E4
_02068680:
	sub r0, r4, #1
	strb r0, [sp]
	bl sub_0204E210
	cmp r0, #2
	bne _020686A8
	add r0, sp, #0
	bl sub_0204F1B4
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [sp]
_020686A8:
	ldrsb ip, [sp]
	ldr r1, _020686F0 ; =_020B0A54
	mov lr, #2
	mov r0, #0xb0
_020686B8:
	cmp ip, lr
	mulne r2, lr, r0
	ldrne r3, [r1]
	ldrneb r2, [r3, r2]
	cmpne r2, #0
	movne r2, r4, lsl #1
	strneh lr, [r5, r2]
	add lr, lr, #1
	addne r4, r4, #1
	cmp lr, #0x20
	blt _020686B8
_020686E4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020686F0: .word _020B0A54
	arm_func_end sub_02068390

	arm_func_start sub_020686F4
sub_020686F4: ; 0x020686F4
#if defined(EUROPE)
#define SUB_020686F4_WORD_OFFSET 2
#elif defined(JAPAN)
#define SUB_020686F4_WORD_OFFSET -0x3C2
#else
#define SUB_020686F4_WORD_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	ldr r0, _02068E14 ; =_020B0B2C
	mov r4, #0
	ldr r7, [r0, #0x14]
	ldr r5, [r7, #4]
	cmp r5, #0x15
	addls pc, pc, r5, lsl #2
	b _02068E08
_02068718: ; jump table
	b _02068770 ; case 0
	b _02068770 ; case 1
	b _02068770 ; case 2
	b _02068770 ; case 3
	b _02068770 ; case 4
	b _02068770 ; case 5
	b _02068770 ; case 6
	b _02068770 ; case 7
	b _02068770 ; case 8
	b _02068770 ; case 9
	b _020688D0 ; case 10
	b _02068960 ; case 11
	b _020689F0 ; case 12
	b _02068A6C ; case 13
	b _02068AE8 ; case 14
	b _02068AE8 ; case 15
	b _02068AE8 ; case 16
	b _02068AE8 ; case 17
	b _02068770 ; case 18
	b _02068C48 ; case 19
	b _02068CA4 ; case 20
	b _02068D00 ; case 21
_02068770:
	add r1, r7, #0x188
	mov r0, r5
	add r4, r1, #0xc00
	bl sub_02067584
	cmp r0, #0
	movne r4, #0
	bne _02068E08
	ldr r0, _02068E14 ; =_020B0B2C
	add r1, r7, #0xc
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	bl sub_02068390
	str r0, [r7, #0x6c]
	mov r0, #0
	bl sub_0205B77C
	bl sub_02068E7C
	mov r1, #0
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	cmp r5, #9
	bgt _02068800
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020688C0
_020687D8: ; jump table
	b _020688C0 ; case 0
	b _020688C0 ; case 1
	b _02068838 ; case 2
	b _0206880C ; case 3
	b _0206880C ; case 4
	b _0206882C ; case 5
	b _020688C0 ; case 6
	b _020688C0 ; case 7
	b _020688C0 ; case 8
	b _02068838 ; case 9
_02068800:
	cmp r5, #0x12
	beq _02068858
	b _020688C0
_0206880C:
	ldr r0, _02068E14 ; =_020B0B2C
	ldr r1, _02068E1C ; =_020B0B2E
	ldrsb r2, [r0, #2]
	ldr r0, _02068E20 ; =0x00003815
	str r2, [r7, #8]
	str r1, [r7, #0xef0]
	strh r0, [r4, #8]
	b _020688C8
_0206882C:
	ldr r0, _02068E24 ; =0x00003817
	strh r0, [r4, #8]
	b _020688C8
_02068838:
	ldr r1, _02068E28 ; =0x00003816
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r4, #8]
	ldrsb r1, [r0, #5]
	ldr r0, _02068E2C ; =_020B0B31
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
	b _020688C8
_02068858:
	ldr r1, _02068E30 ; =0x00003818
	ldr r0, _02068E34 ; =sub_02069598
	strh r1, [r4, #8]
	str r0, [r7, #0xe40]
	mov r1, #1
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r7, #0x7c]
	ldrsb r1, [r0, #1]
	ldr r0, _02068E38 ; =_020B0B2D
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
	b _020688A4
_02068888:
	bl sub_020693EC
	ldrb r0, [r0]
	cmp r0, #0
	bne _020688B0
	ldr r0, [r7, #8]
	sub r0, r0, #1
	str r0, [r7, #8]
_020688A4:
	ldr r0, [r7, #8]
	cmp r0, #0
	bgt _02068888
_020688B0:
	ldr r1, [r7, #8]
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r0, #1]
	b _020688C8
_020688C0:
	ldr r0, _02068E3C ; =0x00003F1E
	strh r0, [r4, #8]
_020688C8:
	mov r4, #1
	b _02068E08
_020688D0:
	add r0, r7, #0x188
	mov r6, r4
	add r5, r0, #0xc00
_020688DC:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E984
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r6, [r0, #0xc]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _020688DC
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205E970
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E44 ; =0x00003819
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0x12]
	ldr r0, _02068E48 ; =_020B0B3E
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068960:
	add r0, r7, #0x188
	mov r6, r4
	add r5, r0, #0xc00
_0206896C:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EB00
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r6, [r0, #0xc]
	add r6, r6, #1
	addeq r4, r4, #1
	cmp r6, #8
	blt _0206896C
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EAE8
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E4C ; =0x0000381A
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0x11]
	ldr r0, _02068E50 ; =_020B0B3D
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_020689F0:
	add r1, r7, #0x188
	mov r0, r4
	add r5, r1, #0xc00
	bl sub_0205EBF0
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r7, #0xc]
	addeq r4, r4, #1
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EBD8
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E54 ; =0x0000381B
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0xa]
	ldr r0, _02068E58 ; =_020B0B36
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068A6C:
	add r1, r7, #0x188
	mov r0, r4
	add r5, r1, #0xc00
	bl sub_0205EC50
	cmp r0, #0
	moveq r0, r4
	streqh r0, [r7, #0xc]
	addeq r4, r4, #1
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl sub_0205EC38
	ldr r1, _02068E40 ; =sub_02069074
	mov r2, #0
	bl sub_020690D8
	ldr r1, _02068E5C ; =0x0000381C
	ldr r0, _02068E14 ; =_020B0B2C
	strh r1, [r5, #8]
	ldrsb r2, [r0, #0xf]
	ldr r0, _02068E60 ; =_020B0B3B
	mov r1, #0
	str r2, [r7, #8]
	str r0, [r7, #0xef0]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068AE8:
	add r0, r7, #0x188
	cmp r5, #0x11
	add r8, r0, #0xc00
	bne _02068B74
	bl sub_0204E210
	cmp r0, #1
	bne _02068B74
	mov r6, r4
_02068B08:
	mov r0, r6, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r1, r6, lsl #0x18
	mov r5, r0
	mov r0, r1, asr #0x18
	bl sub_0205F0F0
	cmp r0, #0
	bne _02068B64
	bl GetAdventureLogDungeonFloor
	ldrb r1, [r5, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _02068B58
	ldrb r0, [r5]
	cmp r0, #5
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	beq _02068B64
_02068B58:
	add r0, r7, r4, lsl #1
	strh r6, [r0, #0xc]
	add r4, r4, #1
_02068B64:
	add r6, r6, #1
	cmp r6, #8
	blt _02068B08
	b _02068BA0
_02068B74:
	mov r5, #0
_02068B78:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205F0F0
	cmp r0, #0
	addeq r0, r7, r4, lsl #1
	streqh r5, [r0, #0xc]
	add r5, r5, #1
	addeq r4, r4, #1
	cmp r5, #8
	blt _02068B78
_02068BA0:
	str r4, [r7, #0x6c]
	cmp r4, #0
	moveq r4, #0
	beq _02068E08
	mov r0, #0
	bl GetAcceptedMission
	mov r1, #0
	mov r2, #1
	bl sub_020690D8
	ldr r0, _02068E14 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldr r1, [r1, #4]
	cmp r1, #0xe
	bne _02068BF4
	ldr r2, _02068E64 ; =0x0000381D
	ldr r1, _02068E68 ; =_020B0B2C
	strh r2, [r8, #8]
	ldrsb r0, [r0]
	str r0, [r7, #8]
	str r1, [r7, #0xef0]
	b _02068C18
_02068BF4:
#ifdef EUROPE
	sub r0, r1, #0xf
	cmp r0, #2
	bhi _02068C18
	cmp r1, #0x11
	ldreq r1, _02068E64 ; =0x0000381F
	ldr r0, _02068E14 ; =_020B0B2C
	ldrne r1, _02068E6C ; =0x00003820
	strh r1, [r8, #8]
	ldrsb r1, [r0, #0x13]
	ldr r0, _02068E70 ; =_020B0B3F
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
#else
	sub r1, r1, #0xf
	cmp r1, #2
	bhi _02068C18
	ldr r2, _02068E6C ; =0x0000381E
	ldr r1, _02068E70 ; =_020B0B3F
	strh r2, [r8, #8]
	ldrsb r0, [r0, #0x13]
	str r0, [r7, #8]
	str r1, [r7, #0xef0]
#endif
_02068C18:
	ldr r1, [r7, #0x6c]
	ldr r0, [r7, #8]
	mov r4, #1
	cmp r0, r1
	subge r0, r1, #1
	strge r0, [r7, #8]
	mov r1, #0
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	b _02068E08
_02068C48:
	add r0, r7, #0x188
	add r5, r0, #0xc00
	ldr r0, [r7, #0x74]
	mov r2, r4
	b _02068C70
_02068C5C:
	add r1, r7, r4, lsl #1
	strh r4, [r1, #0xc]
	add r1, r7, r4
	strb r2, [r1, #0x4c]
	add r4, r4, #1
_02068C70:
	ldr r1, [r7, #0x6c]
	cmp r4, r1
	blt _02068C5C
	bl sub_02068E7C
	ldr r0, _02068E28 ; =0x00003816
	ldr r1, _02068E34 ; =sub_02069598
	strh r0, [r5, #8]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	mov r4, #1
	strb r4, [r7, #0x7c]
	b _02068E08
_02068CA4:
	add r0, r7, #0x188
	add r5, r0, #0xc00
	b _02068CBC
_02068CB0:
	add r0, r7, r4, lsl #1
	strh r4, [r0, #0xc]
	add r4, r4, #1
_02068CBC:
	ldr r0, [r7, #0x6c]
	cmp r4, r0
	blt _02068CB0
	bl sub_0206901C
	ldr r0, [r7, #0x74]
	ldr r1, _02068E74 ; =sub_020690A4
	mov r2, #0
	bl sub_020690D8
	ldr r0, _02068E6C ; =0x0000381E
	mov r1, #0
	strh r0, [r5, #8]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	strb r1, [r7, #0x7c]
	mov r4, #1
	b _02068E08
_02068D00:
	add r0, r7, #0x188
	add r6, r0, #0xc00
	b _02068D18
_02068D0C:
	add r0, r7, r4, lsl #1
	strh r4, [r0, #0xc]
	add r4, r4, #1
_02068D18:
	ldr r0, [r7, #0x6c]
	cmp r4, r0
	blt _02068D0C
	mov r8, #0
	str r8, [r7, #0x80]
	add r5, sp, #0
	add r4, sp, #0x47
	add fp, sp, #0x48
	mov sb, #0x68
	b _02068DB0
_02068D40:
	add r0, r7, r8, lsl #1
	ldrsh r0, [r0, #0xc]
	ldr r2, [r7, #0x74]
	mov r1, r5
	add sl, r2, r0, lsl #5
	mov r0, sl
	bl GenerateMissionDetailsStruct
	mov r0, sl
	mov r1, r4
	mov r2, fp
	mov r3, #0
	bl sub_02069958
	str sl, [sp, #0x5c]
	ldr r1, [r7, #0x80]
	add sl, sp, #0
	mla r0, r1, sb, r7
	add lr, r0, #0x84
	mov ip, #6
_02068D88:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02068D88
	ldmia sl, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, [r7, #0x80]
	add r8, r8, #1
	add r0, r0, #1
	str r0, [r7, #0x80]
_02068DB0:
	ldr r0, [r7, #0x6c]
	cmp r8, r0
	blt _02068D40
	bl sub_0206901C
	mov r1, #0
	ldr r0, _02068E6C ; =0x0000381E
	str r1, [r6]
	strh r0, [r6, #8]
	mov r0, #0x10
	str r0, [r6, #0xc]
	mov r0, #0x1a
	str r0, [r6, #4]
	ldr r0, _02068E18 ; =sub_02069660
	str r1, [r7, #0xe40]
	str r0, [r7, #0xe44]
	ldr r0, _02068E14 ; =_020B0B2C
	strb r1, [r7, #0x7c]
	ldrsb r1, [r0, #3]
	ldr r0, _02068E78 ; =_020B0B2F
	mov r4, #1
	str r1, [r7, #8]
	str r0, [r7, #0xef0]
_02068E08:
	mov r0, r4
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02068E14: .word _020B0B2C
_02068E18: .word sub_02069660
_02068E1C: .word _020B0B2E
_02068E20: .word 0x00003815 + SUB_020686F4_WORD_OFFSET
_02068E24: .word 0x00003817 + SUB_020686F4_WORD_OFFSET
_02068E28: .word 0x00003816 + SUB_020686F4_WORD_OFFSET
_02068E2C: .word _020B0B31
_02068E30: .word 0x00003818 + SUB_020686F4_WORD_OFFSET
_02068E34: .word sub_02069598
_02068E38: .word _020B0B2D
#ifdef JAPAN
_02068E3C: .word 0x000038A2
#else
_02068E3C: .word 0x00003F1E + SUB_020686F4_WORD_OFFSET
#endif
_02068E40: .word sub_02069074
_02068E44: .word 0x00003819 + SUB_020686F4_WORD_OFFSET
_02068E48: .word _020B0B3E
_02068E4C: .word 0x0000381A + SUB_020686F4_WORD_OFFSET
_02068E50: .word _020B0B3D
_02068E54: .word 0x0000381B + SUB_020686F4_WORD_OFFSET
_02068E58: .word _020B0B36
_02068E5C: .word 0x0000381C + SUB_020686F4_WORD_OFFSET
_02068E60: .word _020B0B3B
_02068E64: .word 0x0000381D + SUB_020686F4_WORD_OFFSET
_02068E68: .word _020B0B2C
_02068E6C: .word 0x0000381E + SUB_020686F4_WORD_OFFSET
_02068E70: .word _020B0B3F
_02068E74: .word sub_020690A4
_02068E78: .word _020B0B2F
	arm_func_end sub_020686F4

	arm_func_start sub_02068E7C
sub_02068E7C: ; 0x02068E7C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x68
	ldr r1, _02069018 ; =_020B0B2C
	mov r8, r0
	ldr r7, [r1, #0x14]
	add r4, r7, #0x188
	bl sub_0206901C
	mov r5, #0
	str r5, [r7, #0xd88]
	mov r0, #0x10
	str r0, [r4, #0xc0c]
	str r5, [r7, #0x80]
	b _02068FF4
_02068EB0:
	add r0, r7, r5, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r2, #0
	mov r1, #7
	mov r0, r0, lsl #0x18
	mov r3, r0, asr #0x18
	mov r0, #0xb0
	mla r6, r3, r0, r8
	add r0, r6, #4
	strb r2, [sp, #0x46]
	strb r2, [sp, #0x48]
	str r0, [sp, #8]
	strh r2, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r2, [sp, #0x16]
	strb r1, [sp, #0x1a]
	str r2, [sp, #0x5c]
	str r6, [sp, #0x64]
	bl GetLanguageType
	ldrsb r1, [r6, #0x1c]
	cmp r1, r0
	movne r0, #0
	strne r0, [sp, #0xc]
	strne r0, [sp, #0x54]
	strne r0, [sp, #0x58]
	bne _02068F34
	add r2, r6, #0x1d
	add r1, r6, #0x32
	add r0, r6, #0x56
	str r2, [sp, #0xc]
	str r1, [sp, #0x54]
	str r0, [sp, #0x58]
_02068F34:
	ldr r0, [sp, #0x54]
	mov r1, #1
	cmp r0, #0
	ldrneh r0, [r0]
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r1, #0
	moveq r1, #6
	ldrb r0, [r6]
	strb r1, [sp, #0x44]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02068FAC
_02068F6C: ; jump table
	b _02068FAC ; case 0
	b _02068FA0 ; case 1
	b _02068FA0 ; case 2
	b _02068FAC ; case 3
	b _02068F88 ; case 4
	b _02068F94 ; case 5
	b _02068F94 ; case 6
_02068F88:
	mov r0, #3
	strb r0, [sp, #0x47]
	b _02068FB4
_02068F94:
	mov r0, #4
	strb r0, [sp, #0x47]
	b _02068FB4
_02068FA0:
	mov r0, #1
	strb r0, [sp, #0x47]
	b _02068FB4
_02068FAC:
	mov r0, #2
	strb r0, [sp, #0x47]
_02068FB4:
	ldr r1, [r7, #0x80]
	mov r0, #0x68
	mla r0, r1, r0, r7
	add lr, sp, #0
	add ip, r0, #0x84
	mov r6, #6
_02068FCC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02068FCC
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	ldr r0, [r7, #0x80]
	add r5, r5, #1
	add r0, r0, #1
	str r0, [r7, #0x80]
_02068FF4:
	ldr r0, [r7, #0x6c]
	cmp r5, r0
	blt _02068EB0
	mov r0, #0x10
	str r0, [r4, #0xc0c]
	mov r0, #0x1a
	str r0, [r4, #0xc04]
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02069018: .word _020B0B2C
	arm_func_end sub_02068E7C

	arm_func_start sub_0206901C
sub_0206901C: ; 0x0206901C
	stmdb sp!, {r3, lr}
	ldr r0, _02069070 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	add r2, r0, #0xe20
	mov r0, r1
_02069034:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #0x20
	blt _02069034
	ldr r0, _02069070 ; =_020B0B2C
	mov r1, #0x98
	ldr r0, [r0, #0x14]
	add r0, r0, #0x188
	add r0, r0, #0xc00
	bl MemZero
	ldr r0, _02069070 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	add r0, r1, #0xe20
	str r0, [r1, #0xde8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069070: .word _020B0B2C
	arm_func_end sub_0206901C

	arm_func_start sub_02069074
sub_02069074: ; 0x02069074
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl AlreadyHaveMission
	cmp r0, #0
	movne r0, #3
	strneb r0, [r4]
	bl CountJobListMissions
	cmp r0, #8
	ldrgeb r0, [r4]
	orrge r0, r0, #1
	strgeb r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02069074

	arm_func_start sub_020690A4
sub_020690A4: ; 0x020690A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl AlreadyHaveMission
	cmp r0, #0
	bne _020690CC
	mov r0, r5
	bl sub_0205FA38
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020690CC:
	mov r0, #3
	strb r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020690A4

	arm_func_start sub_020690D8
sub_020690D8: ; 0x020690D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	ldr r3, _020691B4 ; =_020B0B2C
	mov sb, r0
	ldr r6, [r3, #0x14]
	mov r8, r1
	mov r7, r2
	bl sub_0206901C
	mov r5, #0
	str r5, [r6, #0x80]
	add r4, r6, #0xe20
	mov fp, #0x68
	b _02069188
_0206910C:
	add r0, r6, r5, lsl #1
	ldrsh r0, [r0, #0xc]
	add r1, sp, #0
	add sl, sb, r0, lsl #5
	mov r0, sl
	bl GenerateMissionDetailsStruct
	mov r0, sl
	add r1, sp, #0x47
	add r2, sp, #0x48
	mov r3, r7
	bl sub_02069958
	cmp r8, #0
	beq _0206914C
	mov r0, sl
	add r1, r4, r5
	blx r8
_0206914C:
	ldr r1, [r6, #0x80]
	add sl, sp, #0
	mla r0, r1, fp, r6
	add lr, r0, #0x84
	mov ip, #6
_02069160:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02069160
	ldmia sl, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, [r6, #0x80]
	add r5, r5, #1
	add r0, r0, #1
	str r0, [r6, #0x80]
_02069188:
	ldr r0, [r6, #0x6c]
	cmp r5, r0
	blt _0206910C
	mov r0, #0
	str r0, [r6, #0xd88]
	mov r0, #0x10
	str r0, [r6, #0xd94]
	mov r0, #0x1a
	str r0, [r6, #0xd8c]
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020691B4: .word _020B0B2C
	arm_func_end sub_020690D8

	arm_func_start sub_020691B8
sub_020691B8: ; 0x020691B8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r2, _020692A8 ; =_020B0B2C
	mvn r1, #1
	ldr ip, [r2, #0x14]
	ldrsb r0, [ip, #0x7d]
	cmp r0, r1
	bne _0206926C
	ldr r0, [ip, #8]
	mov r3, #4
	str r0, [ip, #0xd88]
	ldr lr, [r2, #0x14]
	ldr r0, _020692AC ; =_020A9288
	ldr r1, [lr, #0xe40]
	add r2, lr, #0x188
	str r1, [sp]
	ldr ip, [lr, #0x80]
	ldr r1, _020692B0 ; =0x00441E33
	str ip, [sp, #4]
	str r3, [sp, #8]
	ldr r3, [lr, #0xe44]
	add r2, r2, #0xc00
	bl CreateCollectionMenu
	ldr r3, _020692A8 ; =_020B0B2C
	mov r1, #0
	ldr ip, [r3, #0x14]
	mov r2, #0xc
	strb r0, [ip, #0x7d]
	ldr r0, [r3, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl sub_0202C6F0
	ldr r0, _020692A8 ; =_020B0B2C
	mov r1, #1
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl SetCollectionMenuField0x1B2
	ldr r0, _020692A8 ; =_020B0B2C
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #0x7c]
	cmp r0, #0
	bne _02069290
	ldrsb r0, [r1, #0x7d]
	mov r1, #1
	bl sub_0202D07C
	b _02069290
_0206926C:
	ldrb r1, [ip, #0xd84]
	cmp r1, #0
	beq _0206928C
	ldr r1, [ip, #0x80]
	mov r2, #4
	mov r3, #0
	bl sub_0202C654
	b _02069290
_0206928C:
	bl sub_0202C620
_02069290:
	ldr r0, _020692A8 ; =_020B0B2C
	mov r1, #0
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0xd84]
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020692A8: .word _020B0B2C
_020692AC: .word _020A9288
_020692B0: .word 0x00441E33
	arm_func_end sub_020691B8

	arm_func_start sub_020692B4
sub_020692B4: ; 0x020692B4
	stmdb sp!, {r3, lr}
	ldr r0, _020692F8 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _020692F8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldrsb r0, [r0, #0x7d]
	bl CloseCollectionMenu
	ldr r0, _020692F8 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0x7d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020692F8: .word _020B0B2C
	arm_func_end sub_020692B4

	arm_func_start sub_020692FC
sub_020692FC: ; 0x020692FC
	stmdb sp!, {r3, lr}
	ldr r0, _02069378 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #4]
	sub r0, r1, #0xe
	cmp r0, #3
	bhi _02069328
	bl sub_02069444
	mov r1, #1
	bl CreateJobSummary
	ldmia sp!, {r3, pc}
_02069328:
	cmp r1, #0xa
	cmpne r1, #0xb
	cmpne r1, #0xc
	cmpne r1, #0xd
	beq _02069348
	sub r0, r1, #0x14
	cmp r0, #1
	bhi _02069358
_02069348:
	bl sub_02069444
	mov r1, #0
	bl CreateJobSummary
	ldmia sp!, {r3, pc}
_02069358:
	cmp r1, #0x13
	bne _0206936C
	bl sub_0206941C
	bl sub_02069790
	ldmia sp!, {r3, pc}
_0206936C:
	bl sub_020693EC
	bl sub_02069790
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069378: .word _020B0B2C
	arm_func_end sub_020692FC

	arm_func_start sub_0206937C
sub_0206937C: ; 0x0206937C
	stmdb sp!, {r3, lr}
	ldr r0, _020693E8 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	ldr r1, [r0, #4]
	cmp r1, #0xa
	cmpne r1, #0xb
	cmpne r1, #0xc
	cmpne r1, #0xd
	cmpne r1, #0xe
	cmpne r1, #0xf
	cmpne r1, #0x10
	cmpne r1, #0x11
	beq _020693BC
	sub r0, r1, #0x14
	cmp r0, #1
	bhi _020693C8
_020693BC:
	bl sub_02069444
	bl sub_02069894
	ldmia sp!, {r3, pc}
_020693C8:
	cmp r1, #0x13
	bne _020693DC
	bl sub_0206941C
	bl sub_02069870
	ldmia sp!, {r3, pc}
_020693DC:
	bl sub_020693EC
	bl sub_02069870
	ldmia sp!, {r3, pc}
	.align 2, 0
_020693E8: .word _020B0B2C
	arm_func_end sub_0206937C

	arm_func_start sub_020693EC
sub_020693EC: ; 0x020693EC
	ldr r1, _02069414 ; =_020B0B2C
	ldr r0, _02069418 ; =_020B0A54
	ldr r3, [r1, #0x14]
	ldr r2, [r0]
	ldr r1, [r3, #8]
	mov r0, #0xb0
	add r1, r3, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	smlabb r0, r1, r0, r2
	bx lr
	.align 2, 0
_02069414: .word _020B0B2C
_02069418: .word _020B0A54
	arm_func_end sub_020693EC

	arm_func_start sub_0206941C
sub_0206941C: ; 0x0206941C
	ldr r1, _02069440 ; =_020B0B2C
	mov r0, #0xb0
	ldr r3, [r1, #0x14]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0x74]
	add r1, r3, r1, lsl #1
	ldrsh r1, [r1, #0xc]
	smlabb r0, r1, r0, r2
	bx lr
	.align 2, 0
_02069440: .word _020B0B2C
	arm_func_end sub_0206941C

	arm_func_start sub_02069444
sub_02069444: ; 0x02069444
	stmdb sp!, {r3, lr}
	ldr r0, _02069558 ; =_020B0B2C
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #4]
	sub r0, r0, #0xa
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _02069550
_02069464: ; jump table
	b _02069494 ; case 0
	b _020694B0 ; case 1
	b _020694CC ; case 2
	b _020694E8 ; case 3
	b _02069504 ; case 4
	b _02069504 ; case 5
	b _02069504 ; case 6
	b _02069504 ; case 7
	b _02069550 ; case 8
	b _02069550 ; case 9
	b _02069520 ; case 10
	b _02069538 ; case 11
_02069494:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205E970
	ldmia sp!, {r3, pc}
_020694B0:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EAE8
	ldmia sp!, {r3, pc}
_020694CC:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EBD8
	ldmia sp!, {r3, pc}
_020694E8:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205EC38
	ldmia sp!, {r3, pc}
_02069504:
	ldr r0, [r2, #8]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	ldmia sp!, {r3, pc}
_02069520:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0x74]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0, lsl #5
	ldmia sp!, {r3, pc}
_02069538:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0x74]
	add r0, r2, r0, lsl #1
	ldrsh r0, [r0, #0xc]
	add r0, r1, r0, lsl #5
	ldmia sp!, {r3, pc}
_02069550:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069558: .word _020B0B2C
	arm_func_end sub_02069444

	arm_func_start sub_0206955C
sub_0206955C: ; 0x0206955C
	stmdb sp!, {r3, lr}
	ldr r0, _02069594 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	add r0, r0, #0xd00
	ldrsb r0, [r0, #0x85]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClosePortraitBox
	ldr r0, _02069594 ; =_020B0B2C
	mvn r1, #1
	ldr r0, [r0, #0x14]
	strb r1, [r0, #0xd85]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069594: .word _020B0B2C
	arm_func_end sub_0206955C

	arm_func_start sub_02069598
sub_02069598: ; 0x02069598
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0206965C ; =_020B0B2C
	tst r0, #0x400
	ldr r5, [r1, #0x14]
	beq _02069654
	ldrsb r0, [r5, #0x7d]
	ldr r6, [r5, #8]
	bl sub_0202C748
	ldr r1, [r5, #8]
	cmp r1, r0
	bne _0206964C
	add r4, r5, #0x4c
	ldrb r0, [r4, r6]
	cmp r0, #0
	beq _02069600
	mov r0, #6
	bl PlaySeVolumeWrapper
	mov r0, #0
	strb r0, [r4, r6]
	bl sub_020674E8
	cmp r0, #0
	bne _02069644
	ldrsb r0, [r5, #0x7d]
	mov r1, #0
	bl sub_0202D07C
	b _02069644
_02069600:
	ldr r0, [r5, #0x78]
	cmp r0, #0
	blt _0206961C
	bl sub_020674E8
	ldr r1, [r5, #0x78]
	cmp r0, r1
	bhs _0206963C
_0206961C:
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldrsb r0, [r5, #0x7d]
	mov r1, #1
	bl sub_0202D07C
	mov r0, #1
	strb r0, [r4, r6]
	b _02069644
_0206963C:
	mov r0, #2
	bl PlaySeVolumeWrapper
_02069644:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_0206964C:
	mov r0, #3
	bl PlaySeVolumeWrapper
_02069654:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206965C: .word _020B0B2C
	arm_func_end sub_02069598

	arm_func_start sub_02069660
sub_02069660: ; 0x02069660
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020696E4 ; =_020B0B2C
	mov r5, r0
	ldr r0, [r3, #0x14]
	add r0, r0, r1
	ldrb r0, [r0, #0x4c]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r2]
	mov r0, #0x68
	mul r4, r1, r0
	ldr r0, _020696E4 ; =_020B0B2C
	ldr r0, [r0, #0x14]
	add r0, r0, r4
	ldr r0, [r0, #0xe0]
	cmp r0, #0
	beq _020696C4
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _020696C4
	mov r0, r5
	bl sub_02060E24
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020696C4:
	ldr r1, _020696E4 ; =_020B0B2C
	mov r0, r5
	ldr r1, [r1, #0x14]
	add r1, r1, #0x84
	add r1, r1, r4
	bl sub_02060AFC
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020696E4: .word _020B0B2C
	arm_func_end sub_02069660

	arm_func_start sub_020696E8
sub_020696E8: ; 0x020696E8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x154
	mov r4, r0
	add r0, sp, #0x104
	bl InitPreprocessorArgs
	bl CountJobListMissions
	str r0, [sp, #0x128]
	mov r0, #8
	str r0, [sp, #0x12c]
	add r3, sp, #0x104
	str r3, [sp]
	ldr r2, _0206974C ; =0x00003813
	add r0, sp, #4
	mov r1, #0x100
	mov r3, #0
	bl PreprocessStringFromId
	mov r0, r4
	mov r1, #0
	mov r2, #3
	add r3, sp, #4
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x154
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0206974C: .word 0x00003815
#elif defined(JAPAN)
_0206974C: .word 0x00003451
#else
_0206974C: .word 0x00003813
#endif
	arm_func_end sub_020696E8

	arm_func_start sub_02069750
sub_02069750: ; 0x02069750
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x100
	ldr r1, _0206978C ; =0x00003814
	mov r4, r0
	add r0, sp, #0
	bl GetStringFromFileVeneer
	add r3, sp, #0
	mov r0, r4
	mov r1, #0
	mov r2, #3
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x100
	ldmia sp!, {r4, pc}
	.align 2, 0
#if defined(EUROPE)
_0206978C: .word 0x00003816
#elif defined(JAPAN)
_0206978C: .word 0x00003452
#else
_0206978C: .word 0x00003814
#endif
	arm_func_end sub_02069750

	arm_func_start sub_02069790
sub_02069790: ; 0x02069790
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _020697F4 ; =_020B0B44
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r0, _020697F4 ; =_020B0B44
	mov ip, #0
	ldr r2, [r0]
	ldr r1, _020697F8 ; =JOB_WINDOW_PARAMS_2
	str r4, [r2]
	ldr r3, [r0]
	ldr r2, _020697FC ; =sub_02069AEC
	strh ip, [r3, #8]
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0204707C
	ldr r0, _020697F4 ; =_020B0B44
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020697F4: .word _020B0B44
_020697F8: .word JOB_WINDOW_PARAMS_2
_020697FC: .word sub_02069AEC
	arm_func_end sub_02069790

	arm_func_start CreateJobSummary
CreateJobSummary: ; 0x02069800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _02069864 ; =_020B0B44
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r0, _02069864 ; =_020B0B44
	mov ip, #0
	ldr r2, [r0]
	ldr r1, _02069868 ; =JOB_WINDOW_PARAMS_2
	str r5, [r2, #4]
	ldr r3, [r0]
	ldr r2, _0206986C ; =sub_02069CC0
	strh ip, [r3, #8]
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0204707C
	ldr r0, _02069864 ; =_020B0B44
	ldr r0, [r0]
	strb r4, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02069864: .word _020B0B44
_02069868: .word JOB_WINDOW_PARAMS_2
_0206986C: .word sub_02069CC0
	arm_func_end CreateJobSummary

	arm_func_start sub_02069870
sub_02069870: ; 0x02069870
	ldr r1, _0206988C ; =_020B0B44
	ldr ip, _02069890 ; =sub_02047188
	ldr r2, [r1]
	str r0, [r2]
	ldr r0, [r1]
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_0206988C: .word _020B0B44
_02069890: .word sub_02047188
	arm_func_end sub_02069870

	arm_func_start sub_02069894
sub_02069894: ; 0x02069894
	ldr r1, _020698B0 ; =_020B0B44
	ldr ip, _020698B4 ; =sub_02047188
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_020698B0: .word _020B0B44
_020698B4: .word sub_02047188
	arm_func_end sub_02069894

	arm_func_start sub_020698B8
sub_020698B8: ; 0x020698B8
	stmdb sp!, {r3, lr}
	ldr r0, _02069900 ; =_020B0B44
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	beq _020698F8
	bl sub_020470D0
	ldr r0, _02069900 ; =_020B0B44
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02047148
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_020698F8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069900: .word _020B0B44
	arm_func_end sub_020698B8

	arm_func_start sub_02069904
sub_02069904: ; 0x02069904
	stmdb sp!, {r3, lr}
	ldr r0, _0206993C ; =_020B0B44
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0xc
	bl sub_02047150
	ldr r0, _0206993C ; =_020B0B44
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0206993C ; =_020B0B44
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206993C: .word _020B0B44
	arm_func_end sub_02069904

	arm_func_start sub_02069940
sub_02069940: ; 0x02069940
	ldr r1, _02069954 ; =_020B0B44
	ldr r1, [r1]
	cmp r1, #0
	strneh r0, [r1, #8]
	bx lr
	.align 2, 0
_02069954: .word _020B0B44
	arm_func_end sub_02069940

	arm_func_start sub_02069958
sub_02069958: ; 0x02069958
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0
	b _02069AD0
_02069974:
	mov r0, r5, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02069ACC
	ldrb r1, [sb, #1]
	ldrb r0, [r4, #1]
	cmp r1, r0
	ldreqb r1, [sb, #2]
	ldreqb r0, [r4, #2]
	cmpeq r1, r0
	ldreqb r1, [sb, #4]
	ldreqb r0, [r4, #4]
	cmpeq r1, r0
	ldreqb r1, [sb, #5]
	ldreqb r0, [r4, #5]
	cmpeq r1, r0
	ldreq r1, [sb, #8]
	ldreq r0, [r4, #8]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0xe]
	ldreqsh r0, [r4, #0xe]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x10]
	ldreqsh r0, [r4, #0x10]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x12]
	ldreqsh r0, [r4, #0x12]
	cmpeq r1, r0
	ldreqsh r1, [sb, #0x14]
	ldreqsh r0, [r4, #0x14]
	cmpeq r1, r0
	ldreqb r0, [sb, #0x16]
	ldreqb r1, [r4, #0x16]
	cmpeq r0, r1
	bne _02069ACC
	add r1, sb, #0x18
	add r2, r4, #0x18
	bl sub_0205C870
	cmp r0, #0
	beq _02069ACC
	add r0, sb, #0x1a
	add r1, r4, #0x1a
	bl sub_0205C8E0
	cmp r0, #0
	beq _02069ACC
	ldrb r0, [r4]
	sub r0, r0, #4
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02069AA4
_02069A48: ; jump table
	b _02069A5C ; case 0
	b _02069A6C ; case 1
	b _02069A88 ; case 2
	b _02069A6C ; case 3
	b _02069A6C ; case 4
_02069A5C:
	mov r0, #1
	strb r0, [r8]
	strb r0, [r7]
	b _02069ABC
_02069A6C:
	cmp r6, #0
	movne r0, #3
	moveq r0, #1
	strb r0, [r8]
	mov r0, #2
	strb r0, [r7]
	b _02069ABC
_02069A88:
	cmp r6, #0
	movne r0, #0
	moveq r0, #1
	strb r0, [r8]
	mov r0, #3
	strb r0, [r7]
	b _02069ABC
_02069AA4:
	cmp r6, #0
	movne r0, #0
	moveq r0, #1
	strb r0, [r8]
	mov r0, #0
	strb r0, [r7]
_02069ABC:
	cmp r6, #0
	moveq r0, #0
	streqb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02069ACC:
	add r5, r5, #1
_02069AD0:
	cmp r5, #8
	blt _02069974
	mov r0, #2
	strb r0, [r8]
	mov r0, #0
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02069958

	arm_func_start sub_02069AEC
sub_02069AEC: ; 0x02069AEC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x68
	ldr r1, _02069CBC ; =_020B0B44
	mov r2, #0
	ldr r1, [r1]
	mov r5, r0
	ldr r4, [r1]
	add r0, r4, #4
	strb r2, [sp, #0x46]
	strh r2, [sp, #0x10]
	strh r2, [sp, #0x12]
	strh r2, [sp, #0x14]
	strh r2, [sp, #0x16]
	str r2, [sp, #0x5c]
	str r4, [sp, #0x64]
	str r0, [sp, #8]
	ldrsh r0, [r4, #0xa2]
	cmp r0, #0
	moveq r0, #7
	streqb r0, [sp, #0x1a]
	beq _02069B60
	mov r0, #2
	strb r0, [sp, #0x1a]
	ldrh r0, [r4, #0x9e]
	strh r0, [sp, #0x28]
	ldrh r0, [r4, #0xa0]
	strh r0, [sp, #0x2a]
	ldrh r0, [r4, #0xa2]
	strh r0, [sp, #0x2c]
_02069B60:
	bl GetLanguageType
	ldrsb r1, [r4, #0x1c]
	cmp r1, r0
	movne r0, #0
	strne r0, [sp, #0xc]
	strne r0, [sp, #0x54]
	strne r0, [sp, #0x58]
	bne _02069B98
	add r2, r4, #0x1d
	add r1, r4, #0x32
	add r0, r4, #0x56
	str r2, [sp, #0xc]
	str r1, [sp, #0x54]
	str r0, [sp, #0x58]
_02069B98:
	ldrb r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02069C00
_02069BA8: ; jump table
	b _02069C00 ; case 0
	b _02069C00 ; case 1
	b _02069C00 ; case 2
	b _02069C00 ; case 3
	b _02069C00 ; case 4
	b _02069BC8 ; case 5
	b _02069BF4 ; case 6
	b _02069BC8 ; case 7
_02069BC8:
	ldr r0, _02069CBC ; =_020B0B44
	ldr r1, [r0]
	ldrsh r0, [r1, #8]
	cmp r0, #0
	movne r0, #6
	strneb r0, [sp, #0x1a]
	ldrnesh r0, [r1, #8]
	strneh r0, [sp, #0x3c]
	mov r0, #0
	strb r0, [sp, #0x48]
	b _02069C50
_02069BF4:
	mov r0, #0
	strb r0, [sp, #0x48]
	b _02069C50
_02069C00:
	ldrb r0, [r4, #0xae]
	bl sub_0205BD40
	cmp r0, #0
	beq _02069C24
	cmp r0, #1
	beq _02069C30
	cmp r0, #2
	beq _02069C3C
	b _02069C48
_02069C24:
	mov r0, #6
	strb r0, [sp, #0x48]
	b _02069C50
_02069C30:
	mov r0, #4
	strb r0, [sp, #0x48]
	b _02069C50
_02069C3C:
	mov r0, #5
	strb r0, [sp, #0x48]
	b _02069C50
_02069C48:
	mov r0, #0
	strb r0, [sp, #0x48]
_02069C50:
	ldr r0, [sp, #0x54]
	mov r1, #1
	cmp r0, #0
	ldrneh r0, [r0]
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r1, #0
	moveq r1, #6
	ldr r0, [sp, #0x58]
	strb r1, [sp, #0x44]
	cmp r0, #0
	ldrneh r0, [r0]
	mov r1, #1
	cmpne r0, #0
	movne r1, #0
	cmp r1, #0
	movne r2, #0
	moveq r2, #9
	add r0, sp, #0
	mov r1, r5
	strb r2, [sp, #0x45]
	bl sub_02060FD8
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02069CBC: .word _020B0B44
	arm_func_end sub_02069AEC

	arm_func_start sub_02069CC0
sub_02069CC0: ; 0x02069CC0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	ldr r1, _02069D3C ; =_020B0B44
	mov r6, r0
	ldr r0, [r1]
	ldr r4, [r0, #4]
	ldrb r5, [r0, #0x10]
	mov r0, r4
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _02069CFC
	mov r0, r6
	mov r1, r4
	bl sub_02061C60
	b _02069D2C
_02069CFC:
	add r1, sp, #0
	mov r0, r4
	bl GenerateMissionDetailsStruct
	add r1, sp, #0x47
	add r2, sp, #0x48
	mov r0, r4
	mov r3, r5
	bl sub_02069958
	add r0, sp, #0
	mov r1, r6
	str r4, [sp, #0x5c]
	bl sub_02060FD8
_02069D2C:
	mov r0, r6
	bl UpdateWindow
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02069D3C: .word _020B0B44
	arm_func_end sub_02069CC0

	arm_func_start sub_02069D40
sub_02069D40: ; 0x02069D40
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xc4
	mov r1, #8
	bl MemAlloc
	ldr r2, _02069D90 ; =_020B0B48
	mov r1, #0xc4
	str r0, [r2]
	bl MemZero
	ldr r0, _02069D90 ; =_020B0B48
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	strh r4, [r1, #0xc0]
	ldr r1, [r0]
	add r0, r1, #0x37
	bic r0, r0, #0x1f
	str r0, [r1, #0x14]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02069D90: .word _020B0B48
	arm_func_end sub_02069D40

	arm_func_start sub_02069D94
sub_02069D94: ; 0x02069D94
	stmdb sp!, {r3, lr}
	ldr r0, _02069DBC ; =_020B0B48
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02069DBC ; =_020B0B48
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02069DBC: .word _020B0B48
	arm_func_end sub_02069D94

	arm_func_start sub_02069DC0
sub_02069DC0: ; 0x02069DC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20c
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r5, [r0]
	ldr r1, [r5]
	cmp r1, #0x3000
	bgt _02069E30
	bge _0206A388
	ldr r0, _0206A5E4 ; =0x00001001
	cmp r1, r0
	bgt _02069E10
	cmp r1, #0x1000
	blt _02069E04
	beq _0206A0AC
	cmp r1, r0
	beq _0206A104
	b _0206A5D4
_02069E04:
	cmp r1, #0
	beq _02069E84
	b _0206A5D4
_02069E10:
	cmp r1, #0x2000
	bgt _02069E20
	beq _0206A464
	b _0206A5D4
_02069E20:
	add r0, r0, #0x1000
	cmp r1, r0
	beq _0206A490
	b _0206A5D4
_02069E30:
	cmp r1, #0x4000
	bgt _02069E4C
	bge _0206A4A4
	ldr r0, _0206A5E8 ; =0x00003001
	cmp r1, r0
	beq _0206A3A0
	b _0206A5D4
_02069E4C:
	ldr r0, _0206A5EC ; =0x00004004
	cmp r1, r0
	bgt _02069E78
	sub r0, r0, #3
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _0206A5D4
_02069E68: ; jump table
	b _0206A4F8 ; case 0
	b _0206A4C4 ; case 1
	b _0206A584 ; case 2
	b _0206A5B0 ; case 3
_02069E78:
	cmp r1, #0x8000
	beq _0206A5C4
	b _0206A5D4
_02069E84:
	add r4, r5, #0x58
	add r5, r5, #0x90
	bl ov03_0233CAA8
	cmp r0, #1
	bne _02069F90
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strne r0, [r1, #0xc]
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	mov r0, r5
	mov r1, #0x18
	bl MemZero
	ldr r1, _0206A5E0 ; =_020B0B48
	mov r2, #0x18
	ldr r0, [r1]
	mov r6, #0x38
	str r2, [r0, #0xa8]
	ldr r0, [r1]
	ldr r3, _0206A5F0 ; =sub_0206A628
	str r5, [r0, #0xac]
	ldr r2, [r1]
	mov r0, #0
	str r6, [r2, #0xb0]
	ldr r2, [r1]
	mov r8, #1
	str r4, [r2, #0xb4]
	ldr r2, [r1]
	mov r7, #9
	str r3, [r2, #0xb8]
	ldr r2, [r1]
	mov r3, #0x12
	strb r0, [r2, #0xbc]
	ldr r6, [r1]
	mov r2, #0x11
	strb r8, [r6, #0x10]
	ldr r6, [r1]
	ldr r6, [r6, #0x14]
	strb r7, [r6]
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	strb r0, [r1, #1]
	strb r3, [r4]
	strb r2, [r5]
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r1, [r5, #2]
	add r0, r5, #4
	strb r1, [r4, #2]
	bl GetMainTeamNameWithCheck
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _02069F6C
	add r0, r5, #4
	bl SetQuestionMarks
_02069F6C:
	add r0, r5, #4
	mov r1, #0x14
	bl ov01_02337B3C
	ldr r1, _0206A5E0 ; =_020B0B48
	strb r0, [r5, #3]
	ldr r0, [r1]
	mov r1, #0x1000
	str r1, [r0]
	b _0206A5D4
_02069F90:
	bl ov03_0233CAA8
	cmp r0, #0
	bne _0206A5D4
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0xc]
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	mov r0, r5
	mov r1, #0x18
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	ldrsh r0, [r0, #0xc0]
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sl, r0
	add sb, r4, #0x18
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1, r2, r3}
	ldr ip, _0206A5E0 ; =_020B0B48
	stmia sb, {r0, r1, r2, r3}
	ldr r0, [ip]
	mov r8, #0x38
	str r8, [r0, #0xa8]
	ldr r0, [ip]
	mov r7, #0x18
	str r4, [r0, #0xac]
	ldr r0, [ip]
	ldr r6, _0206A5F4 ; =_02337B68
	str r7, [r0, #0xb0]
	ldr r0, [ip]
	mov lr, #0
	str r5, [r0, #0xb4]
	ldr r0, [ip]
	mov fp, #9
	str r6, [r0, #0xb8]
	ldr r0, [ip]
	strb lr, [r0, #0xbc]
	ldr r0, [ip]
	strb lr, [r0, #0x10]
	ldr r0, [ip]
	ldr r0, [r0, #0x14]
	strb fp, [r0]
	ldr r0, [ip]
	ldr r0, [r0, #0x14]
	strb lr, [r0, #1]
	mov r0, #0x12
	strb r0, [r4]
	mov r0, #0x11
	strb r0, [r5]
	bl GetLanguageType
	strb r0, [r5, #2]
	ldrsb r1, [r5, #2]
	add r0, r4, #4
	strb r1, [r4, #2]
	bl GetMainTeamNameWithCheck
	add r0, r4, #4
	mov r1, #0x34
	bl ov01_02337B3C
	strb r0, [r4, #3]
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x1000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A0AC:
	add r0, r5, #0xa8
	mov r4, #1
	str r0, [sp, #0xac]
	str r4, [sp, #0xa8]
	ldr r1, [r5, #0xc]
	add r0, sp, #0xa8
	str r1, [sp, #0xb8]
	ldrb r3, [r5, #0x10]
	mov r2, #0x20
	mov r1, #0
	strb r3, [sp, #0xbc]
	ldr r3, [r5, #0x14]
	str r3, [sp, #0xc0]
	strh r2, [sp, #0xc4]
	strb r1, [sp, #0xc6]
	str r4, [sp, #0xc8]
	bl ov01_02337BA0
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5E4 ; =0x00001001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A104:
	bl ov01_02337E0C
	movs r4, r0
	beq _0206A5D4
	bl ov01_02337C54
	cmp r4, #0xe
	addls pc, pc, r4, lsl #2
	b _0206A5D4
_0206A120: ; jump table
	b _0206A5D4 ; case 0
	b _0206A380 ; case 1
	b _0206A5D4 ; case 2
	b _0206A5D4 ; case 3
	b _0206A15C ; case 4
	b _0206A380 ; case 5
	b _0206A380 ; case 6
	b _0206A380 ; case 7
	b _0206A380 ; case 8
	b _0206A380 ; case 9
	b _0206A380 ; case 10
	b _0206A380 ; case 11
	b _0206A380 ; case 12
	b _0206A380 ; case 13
	b _0206A380 ; case 14
_0206A15C:
	bl ov03_0233CAA8
	cmp r0, #1
	bne _0206A300
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	beq _0206A244
	mov r0, #2
	bl IsSpecialEpisodeOpen
	cmp r0, #0
	beq _0206A1B0
	ldr r1, _0206A5F8 ; =0x000037A8
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5FC ; =0x00002001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A1B0:
	add r0, sp, #0x1bc
	bl InitPreprocessorArgs
	mov r0, #2
	mov r1, #1
	bl sub_0204C978
	add r0, sp, #0x7e
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0x7e
	bne _0206A1FC
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A204
_0206A1FC:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A204:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0x7e
	add r2, sp, #0x1bc
	mov r0, #0x1c
	str r3, [sp, #0x1f4]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A244:
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl AddMissionToJobList
	cmp r0, #0
	bne _0206A2EC
	bl sub_0205F5A8
	bl sub_0205F710
	add r0, sp, #0x16c
	bl InitPreprocessorArgs
	add r0, sp, #0x54
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0x54
	bne _0206A2A4
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A2AC
_0206A2A4:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A2AC:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0x54
	add r2, sp, #0x16c
	mov r0, #0x1c
	str r3, [sp, #0x1a4]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A2EC:
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x3000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A300:
	bl ov03_0233CAA8
	cmp r0, #0
	bne _0206A5D4
	add r0, sp, #0x11c
	bl InitPreprocessorArgs
	add r0, sp, #0x2a
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x92]
	cmp r1, r0
	add r0, sp, #0x2a
	bne _0206A34C
	add r1, r4, #0x94
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A354
_0206A34C:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A354:
	ldr r1, _0206A608 ; =0x00003793
	add r3, sp, #0x2a
	add r2, sp, #0x11c
	mov r0, #0x1c
	str r3, [sp, #0x154]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A380:
	mov r0, #1
	b _0206A5D8
_0206A388:
	bl ov03_0233CAD8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5E8 ; =0x00003001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A3A0:
	bl ov03_0233CB3C
	cmp r0, #2
	bne _0206A450
	bl ov03_0233CB10
	add r0, sp, #0xcc
	bl InitPreprocessorArgs
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl AddMissionToJobList
	bl sub_0205F5A8
	bl sub_0205F710
	add r0, sp, #0
	mov r1, #0x2a
	bl MemZero
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r4, [r0]
	bl GetLanguageType
	ldrsb r1, [r4, #0x5a]
	cmp r1, r0
	add r0, sp, #0
	bne _0206A408
	add r1, r4, #0x5c
	mov r2, #0x14
	bl StrncpySimpleNoPadSafe
	b _0206A410
_0206A408:
	ldr r1, _0206A600 ; =0x000038C9
	bl GetStringFromFileVeneer
_0206A410:
	ldr r1, _0206A604 ; =0x0000379F
	add r3, sp, #0
	add r2, sp, #0xcc
	mov r0, #0x1c
	str r3, [sp, #0x104]
	bl ov03_0233CDD8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x70
	bl CreateJobSummary
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x2000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A450:
	cmp r0, #1
	bne _0206A5D4
	bl ov03_0233CB10
	mov r0, #1
	b _0206A5D8
_0206A464:
	bl ov03_0233CDE4
	mov r4, r0
	bl sub_020698B8
	cmp r4, #0x12
	bne _0206A5D4
	bl sub_02069904
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x4000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A490:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #1
	b _0206A5D8
_0206A4A4:
	ldr r1, _0206A60C ; =0x0000023B
	mov r0, #0
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A610 ; =0x00004002
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A4C4:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #0xe0
	mov r1, #0x88
	mov r2, #1
	bl sub_02029F88
	bl sub_02003B94
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A614 ; =0x00004001
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A4F8:
	mov r0, #3
	bl NoteSaveBase
	mov r4, r0
	bl sub_02003BC8
	bl sub_02029FBC
	cmp r4, #0
	bne _0206A558
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r0, [r0]
	add r0, r0, #0x70
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	mov r0, #0x1c
	beq _0206A53C
	ldr r1, _0206A618 ; =0x0000379E
	bl ov03_0233CDC8
	b _0206A544
_0206A53C:
#ifdef JAPAN
	ldr r1, _0206A90C ; =0x000004CD
#else
	mov r1, #0x23c
#endif
	bl ov03_0233CDC8
_0206A544:
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A61C ; =0x00004003
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A558:
	cmp r4, #1
	moveq r0, #3
	beq _0206A5D8
	ldr r1, _0206A620 ; =0x00000239
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	ldr r1, _0206A5EC ; =0x00004004
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A584:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	ldr r1, _0206A624 ; =0x000037A0
	mov r0, #0x1c
	bl ov03_0233CDC8
	ldr r0, _0206A5E0 ; =_020B0B48
	mov r1, #0x8000
	ldr r0, [r0]
	str r1, [r0]
	b _0206A5D4
_0206A5B0:
	bl ov03_0233CDE4
	cmp r0, #0x12
	bne _0206A5D4
	mov r0, #1
	b _0206A5D8
_0206A5C4:
	bl ov03_0233CDE4
	cmp r0, #0x12
	moveq r0, #2
	beq _0206A5D8
_0206A5D4:
	mov r0, #0
_0206A5D8:
	add sp, sp, #0x20c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define SUB_02069DC0_OFFSET 2
#elif defined(JAPAN)
#define SUB_02069DC0_OFFSET -0x37E
#else
#define SUB_02069DC0_OFFSET 0
#endif
_0206A5E0: .word _020B0B48
_0206A5E4: .word 0x00001001
_0206A5E8: .word 0x00003001
_0206A5EC: .word 0x00004004
_0206A5F0: .word sub_0206A628
_0206A5F4: .word ov01_02337B68
_0206A5F8: .word 0x000037A8 + SUB_02069DC0_OFFSET
_0206A5FC: .word 0x00002001
#ifdef JAPAN
_0206A600: .word 0x00003507
#else
_0206A600: .word 0x000038C9 + SUB_02069DC0_OFFSET
#endif
_0206A604: .word 0x0000379F + SUB_02069DC0_OFFSET
_0206A608: .word 0x00003793 + SUB_02069DC0_OFFSET
#ifdef JAPAN
_0206A60C: .word 0x000004CC
#else
_0206A60C: .word 0x0000023B
#endif
_0206A610: .word 0x00004002
_0206A614: .word 0x00004001
_0206A618: .word 0x0000379E + SUB_02069DC0_OFFSET
#ifdef JAPAN
_0206A90C: .word 0x000004CD
_0206A61C: .word 0x00004003
_0206A620: .word 0x000004CA
#else
_0206A61C: .word 0x00004003
_0206A620: .word 0x00000239
#endif
_0206A624: .word 0x000037A0 + SUB_02069DC0_OFFSET
	arm_func_end sub_02069DC0

	arm_func_start sub_0206A628
sub_0206A628: ; 0x0206A628
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov03_0233CAA8
	cmp r0, #1
	bne _0206A70C
	add r0, r4, #4
	mov r1, #0x34
	bl ov01_02337B3C
	ldrb r1, [r4, #3]
	cmp r0, r1
	movne r0, #3
	ldmneia sp!, {r4, pc}
	ldrb r0, [r4]
	cmp r0, #0x12
	movne r0, #2
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl IsMissionTypeSpecialEpisode
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl sub_0205D1F4
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x2c]
	mov r1, #1
	bl CanSendItem
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #0x2e]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0206A6E4
_0206A6B8: ; jump table
	b _0206A6E4 ; case 0
	b _0206A6CC ; case 1
	b _0206A6CC ; case 2
	b _0206A6CC ; case 3
	b _0206A6CC ; case 4
_0206A6CC:
	ldrsh r0, [r4, #0x30]
	mov r1, #1
	bl CanSendItem
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
_0206A6E4:
	add r0, r4, #0x18
	bl AlreadyHaveMission
	cmp r0, #0
	movne r0, #4
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x18
	bl sub_0205FA38
	cmp r0, #0
	movne r0, #4
	ldmneia sp!, {r4, pc}
_0206A70C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206A628

	arm_func_start DungeonSwapIdToIdx
DungeonSwapIdToIdx: ; 0x0206A714
	mov ip, #0
	ldr r3, _0206A74C ; =DUNGEON_SWAP_ID_TABLE
	b _0206A73C
_0206A720:
	mov r1, ip, lsl #0x10
	ldrb r2, [r3, r1, asr #16]
	mov r1, r1, asr #0x10
	cmp r2, r0
	moveq r0, r1
	bxeq lr
	add ip, ip, #1
_0206A73C:
	cmp ip, #0xd5
	blt _0206A720
	mvn r0, #0
	bx lr
	.align 2, 0
_0206A74C: .word DUNGEON_SWAP_ID_TABLE
	arm_func_end DungeonSwapIdToIdx

	arm_func_start DungeonSwapIdxToId
DungeonSwapIdxToId: ; 0x0206A750
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0206A768 ; =DUNGEON_SWAP_ID_TABLE
	moveq r0, #0xff
	ldrneb r0, [r1, r0]
	bx lr
	.align 2, 0
_0206A768: .word DUNGEON_SWAP_ID_TABLE
	arm_func_end DungeonSwapIdxToId

	arm_func_start GetDungeonModeSpecial
GetDungeonModeSpecial: ; 0x0206A76C
	stmdb sp!, {r3, lr}
	cmp r0, #0xd6
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xb4
	blt _0206A790
	cmp r0, #0xd3
	movle r0, #3
	ldmleia sp!, {r3, pc}
_0206A790:
	cmp r0, #0xd7
	moveq r0, #2
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xd8
	moveq r0, #3
	ldmeqia sp!, {r3, pc}
	bl GetDungeonMode
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	sub r0, r0, #2
	cmp r0, #1
	movls r0, #2
	movhi r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end GetDungeonModeSpecial

	arm_func_start sub_0206A7CC
sub_0206A7CC: ; 0x0206A7CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x3e8
	bne _0206A7F4
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	b _0206A82C
_0206A7F4:
	ldr r0, _0206A848 ; =0x000003E9
	cmp r4, r0
	bne _0206A82C
	bl sub_0204E6FC
	cmp r0, #2
	bne _0206A814
	bl sub_0204E780
	b _0206A818
_0206A814:
	bl sub_0204E770
_0206A818:
	cmp r0, #0xff
	addne r0, r0, #1
	mvneq r4, #0
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
_0206A82C:
	cmp r4, #0xd1
	bne _0206A840
	bl GetExecuteSpecialEpisodeType
	cmp r0, #4
	moveq r4, #0xd2
_0206A840:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206A848: .word 0x000003E9
	arm_func_end sub_0206A7CC

	arm_func_start sub_0206A84C
sub_0206A84C: ; 0x0206A84C
	cmp r0, #0xb4
	addlo r0, r0, #1
	movlo r0, r0, lsl #0x10
	movlo r0, r0, asr #0x10
	bxlo lr
	blo _0206A870
	cmp r0, #0xd3
	movls r0, #0xb8
	bxls lr
_0206A870:
	mvn r0, #0
	bx lr
	arm_func_end sub_0206A84C

	arm_func_start sub_0206A878
sub_0206A878: ; 0x0206A878
	stmdb sp!, {r3, lr}
	bl sub_0206A7CC
	mvn r1, #0
	cmp r0, r1
	ldrne r1, _0206A89C ; =MAP_MARKER_PLACEMENTS
	movne r0, r0, lsl #3
	ldrnesh r1, [r1, r0]
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206A89C: .word MAP_MARKER_PLACEMENTS
	arm_func_end sub_0206A878

	arm_func_start sub_0206A8A0
sub_0206A8A0: ; 0x0206A8A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	bl sub_0206A7CC
	mov r5, r0
	mov r0, r4
	bl sub_0206A7CC
	mvn r1, #0
	cmp r5, r1
	mov r4, r0
	ldrne r0, _0206A908 ; =_020A94D2
	movne r2, r5, lsl #3
	ldrnesh r0, [r0, r2]
	cmpne r0, r1
	movne r5, r0
	mvn r0, #0
	cmp r4, r0
	ldrne r1, _0206A908 ; =_020A94D2
	movne r2, r4, lsl #3
	ldrnesh r1, [r1, r2]
	cmpne r1, r0
	movne r4, r1
	cmp r5, r4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206A908: .word _020A94D2
	arm_func_end sub_0206A8A0

	arm_func_start sub_0206A90C
sub_0206A90C: ; 0x0206A90C
#ifdef EUROPE
#define SUB_0206A90C_WORD_OFFSET 2
#else
#define SUB_0206A90C_WORD_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	bl sub_0206A7CC
	mvn r1, #0
	cmp r0, r1
#ifdef JAPAN
	moveq r0, #0x47
	ldmeqia sp!, {r3, pc}
	cmp r0, #0
	moveq r0, #0x40
#else
	ldreq r0, _0206A964 ; =0x0000403A
	ldmeqia sp!, {r3, pc}
	cmp r0, #0
	ldreq r0, _0206A968 ; =0x00004033
#endif
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	blt _0206A950
	cmp r0, #0xb4
	bgt _0206A950
	sub r0, r0, #1
	and r0, r0, #0xff
	bl sub_02024934
	ldmia sp!, {r3, pc}
_0206A950:
#ifdef JAPAN
	sub r0, r0, #0x74
#else
	add r0, r0, #0x7f + SUB_0206A90C_WORD_OFFSET
	add r0, r0, #0x3f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifndef JAPAN
_0206A964: .word 0x0000403A + SUB_0206A90C_WORD_OFFSET
_0206A968: .word 0x00004033 + SUB_0206A90C_WORD_OFFSET
#endif
	arm_func_end sub_0206A90C

	arm_func_start sub_0206A96C
sub_0206A96C: ; 0x0206A96C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl sub_0206A7CC
	mvn r2, #0
	cmp r0, r2
	moveq r0, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0206A9D8 ; =MAP_MARKER_PLACEMENTS
	cmp r5, r2
	add r3, r1, r0, lsl #3
	ldrnesh r1, [r3]
	cmpne r1, r5
	movne r0, r2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r2, [r3, #2]
	cmp r2, r0
	mvnne r1, #0
	cmpne r2, r1
	ldrne r1, _0206A9D8 ; =MAP_MARKER_PLACEMENTS
	movne r0, r2
	addne r3, r1, r2, lsl #3
	ldrsh r1, [r3, #4]
	str r1, [r4]
	ldrsh r1, [r3, #6]
	str r1, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206A9D8: .word MAP_MARKER_PLACEMENTS
	arm_func_end sub_0206A96C

	arm_func_start sub_0206A9DC
sub_0206A9DC: ; 0x0206A9DC
	stmdb sp!, {r4, lr}
	bl GetExecuteSpecialEpisodeType
	mov r4, r0
	cmp r4, #4
	bne _0206AA24
	mov r0, #0x3e8
	bl sub_0206A7CC
	ldr r1, _0206AA34 ; =MAP_MARKER_PLACEMENTS
	mov r0, r0, lsl #3
	ldrsh r0, [r1, r0]
	ldr r1, _0206AA38 ; =0xFFFFFED2
	add r1, r0, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #1
	ldmlsia sp!, {r4, pc}
_0206AA24:
	ldr r0, _0206AA3C ; =_020A94C6
	mov r1, r4, lsl #1
	ldrsh r0, [r0, r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206AA34: .word MAP_MARKER_PLACEMENTS
#if defined(EUROPE)
_0206AA38: .word 0xFFFFFEC6
#elif defined(JAPAN)
_0206AA38: .word 0xFFFFFECD
#else
_0206AA38: .word 0xFFFFFED2
#endif
_0206AA3C: .word _020A94C6
	arm_func_end sub_0206A9DC

	arm_func_start sub_0206AA40
sub_0206AA40: ; 0x0206AA40
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	ldr r1, _0206AA58 ; =_020A94BC
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206AA58: .word _020A94BC
	arm_func_end sub_0206AA40

	arm_func_start sub_0206AA5C
sub_0206AA5C: ; 0x0206AA5C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov r0, #0x40
	mov r1, #1
	bl MemAlloc
	ldr r2, _0206AB90 ; =_020B0B4C
	mov r1, #0x40
	str r0, [r2, #8]
	bl MemZero
	ldr r0, _0206AB90 ; =_020B0B4C
	mov r1, #0x20
	ldr r4, [r0, #8]
	add r0, r4, #4
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x20]
	ldr r0, _0206AB90 ; =_020B0B4C
	strh r1, [r4, #0x1c]
	ldr r1, [r0, #8]
	str r5, [r1]
	ldr r2, [r0, #8]
	ldr r0, [r2]
	cmp r0, #1
	bne _0206AB3C
	ldr r0, _0206AB94 ; =0x00001F64
	mov r1, #6
	add r4, r2, #4
	bl MemAlloc
	ldr r1, _0206AB94 ; =0x00001F64
	mov r5, r0
	bl MemZero
	mov r8, #0x58
	mov sl, #0
	mvn r7, #0
	mov r6, r8
_0206AAE8:
	mul sb, sl, r6
	mov r1, r8
	add r0, r5, sb
	bl MemZero
	add sl, sl, #1
	strh r7, [r5, sb]
	cmp sl, #0x50
	blt _0206AAE8
	add r0, r5, #0x1000
	ldr r2, _0206AB90 ; =_020B0B4C
	str r4, [r0, #0xf5c]
	ldr r0, [r2, #8]
	mov r1, #5
	str r5, [r0, #0x28]
	ldr r0, [r2, #8]
	add r0, r0, #4
	bl sub_0206BBE0
	ldr r1, _0206AB90 ; =_020B0B4C
	ldr r1, [r1, #8]
	str r0, [r1, #0x24]
	b _0206AB5C
_0206AB3C:
	cmp r0, #2
	bne _0206AB5C
	add r0, r2, #4
	mov r1, #4
	bl sub_0206BBE0
	ldr r1, _0206AB90 ; =_020B0B4C
	ldr r1, [r1, #8]
	str r0, [r1, #0x24]
_0206AB5C:
	ldr r1, _0206AB90 ; =_020B0B4C
	mov r3, #0
	ldr r2, [r1, #8]
	mov r0, #0x80
	str r3, [r2, #0x2c]
	ldr r2, [r1, #8]
	strb r3, [r2, #0x30]
	ldr r2, [r1, #8]
	str r3, [r2, #0x34]
	ldr r1, [r1, #8]
	strb r3, [r1, #0x31]
	bl ov10_022C2340
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0206AB90: .word _020B0B4C
_0206AB94: .word 0x00001F64
	arm_func_end sub_0206AA5C

	arm_func_start sub_0206AB98
sub_0206AB98: ; 0x0206AB98
	ldr r0, _0206ABAC ; =_020B0B4C
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x30]
	bx lr
	.align 2, 0
_0206ABAC: .word _020B0B4C
	arm_func_end sub_0206AB98

	arm_func_start sub_0206ABB0
sub_0206ABB0: ; 0x0206ABB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r0, _0206AD28 ; =_020B0B4C
	ldr r4, [r0, #8]
	cmp r4, #0
	ldrneb r0, [r4, #0x30]
	cmpne r0, #0
	beq _0206AD1C
	ldr r0, [r4]
	ldr r1, _0206AD2C ; =_020B0B5C
	cmp r0, #1
	movne r5, #1
	moveq r5, #0
	ldr r1, [r1, r5, lsl #3]
	add r0, sp, #8
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD30 ; =_020B0B60
	mov r1, #0
	ldr r0, [r0, r5, lsl #3]
	bl sub_0201DF38
	str r0, [r4, #0x14]
	mov r2, #0
	ldr r1, [r4, #0x20]
	add r0, sp, #8
	mov r3, r2
	bl sub_0201E12C
	add r0, sp, #8
	bl DelayWteFree
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	str r1, [r4, #0x18]
	ldr r2, [r4, #0x20]
	ldr r1, _0206AD34 ; =_020A9F34
	add r2, r2, #0x8000
	str r2, [r4, #0x20]
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD38 ; =_020A9F48
	mov r1, #0
	bl sub_0201DF38
	str r0, [r4, #4]
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0x10
	bl DelayWteFree
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	str r1, [r4, #8]
	ldr r2, [r4, #0x20]
	ldr r1, _0206AD3C ; =_020A9F5C
	add r2, r2, #0x2000
	str r2, [r4, #0x20]
	mov r2, #6
	bl LoadWteFromRom
	ldr r0, _0206AD40 ; =_020A9F70
	mov r1, #0
	bl sub_0201DF38
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x20]
	add r0, sp, #0x10
	mov r2, #2
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0x10
	bl DelayWteFree
	ldr r0, [r4, #0x20]
	mov r2, #0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x20]
	ldr r0, _0206AD44 ; =WAN_TABLE
	add r1, r1, #0x4000
	str r1, [r4, #0x20]
	ldr r0, [r0]
	ldr r1, _0206AD48 ; =_020A9F84
	bl LoadWanTableEntry
	strh r0, [r4, #0x1c]
	mov r3, #1
	str r3, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldrsh r0, [r4, #0x1c]
	mov r1, #0x2c0
	bl sub_0201D9C8
	ldr r0, _0206AD28 ; =_020B0B4C
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x30]
_0206AD1C:
	mov r0, #1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0206AD28: .word _020B0B4C
_0206AD2C: .word _020B0B5C
_0206AD30: .word _020B0B60
_0206AD34: .word _020A9F34
_0206AD38: .word _020A9F48
_0206AD3C: .word _020A9F5C
_0206AD40: .word _020A9F70
_0206AD44: .word WAN_TABLE
_0206AD48: .word _020A9F84
	arm_func_end sub_0206ABB0

	arm_func_start sub_0206AD4C
sub_0206AD4C: ; 0x0206AD4C
	ldr r0, _0206AD7C ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0206AD74
	ldrb r0, [r0, #0x31]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
_0206AD74:
	mov r0, #0
	bx lr
	.align 2, 0
_0206AD7C: .word _020B0B4C
	arm_func_end sub_0206AD4C

	arm_func_start sub_0206AD80
sub_0206AD80: ; 0x0206AD80
	ldr r0, _0206AD9C ; =_020B0B4C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r0, [r1, #0x34]
	addne r0, r0, #1
	strne r0, [r1, #0x34]
	bx lr
	.align 2, 0
_0206AD9C: .word _020B0B4C
	arm_func_end sub_0206AD80

	arm_func_start sub_0206ADA0
sub_0206ADA0: ; 0x0206ADA0
	ldr r1, _0206ADB4 ; =_020B0B4C
	ldr r1, [r1, #8]
	cmp r1, #0
	strne r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0206ADB4: .word _020B0B4C
	arm_func_end sub_0206ADA0

	arm_func_start sub_0206ADB8
sub_0206ADB8: ; 0x0206ADB8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	moveq r0, #0
	beq _0206B9B4
	bl ov10_022C23EC
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r8, [r0, #8]
	ldrb r0, [r8, #0x30]
	cmp r0, #0
	bne _0206B9B0
	ldr r0, [r8, #0x2c]
	cmp r0, #0
	beq _0206AE00
	cmp r0, #1
	b _0206B99C
_0206AE00:
	ldr r0, [r8, #0x38]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x38]
	bgt _0206B99C
	ldr r0, [r8]
	cmp r0, #1
	bne _0206B678
	ldr r7, [r8, #0x24]
	ldr sb, [r8, #0x28]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _0206AE48
	cmp r0, #1
	beq _0206AF78
	cmp r0, #2
	beq _0206B1D4
	b _0206B670
_0206AE48:
	ldr r1, [r7, #0x2d4]
	mov r0, #0xc0
	ldr fp, [r7, #0x2d8]
	mov r6, #0
	bl _s32_div_f
	mov sb, r0, lsl #8
	mov r0, #0x14000
	rsb r0, r0, #0
	str r0, [sp, #0x2c]
	b _0206AF50
_0206AE70:
	mul r0, r6, sb
	ands r5, r6, #1
	movne r4, #0x14000
	ldr r1, _0206B9BC ; =_020B0B4C
	ldreq r4, [sp, #0x2c]
	str r0, [sp, #0x18]
	ldr r1, [r1, #4]
	rsb r0, r4, #0
	bl _s32_div_f
	str r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	mov r0, #0x58
	mul sl, r6, r0
	mov r0, r6, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r7]
	ldr r3, [sp, #0x18]
	mov r1, fp
	add r0, r0, sl
	mov r2, r4
	bl sub_0206BC3C
	cmp r5, #0
	movne r0, #0
	moveq r0, #0x10000
	add r2, r4, r0
	ldr r5, [r7, #4]
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r5, sl
	mov r1, fp
	bl sub_0206BD04
	ldrsh r0, [r5, sl]
	bl sub_0201F324
	ldrsh r1, [r0, #0x1a]
	add r6, r6, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r0, #8]
	mov r1, #0
	strh r1, [r0, #0xa]
_0206AF50:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206AE70
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	add r0, r0, #1
	str r0, [r7, #0xc]
	b _0206B670
_0206AF78:
	mov r4, #0
	mov fp, #0x58
	b _0206B04C
_0206AF84:
	mul r5, r4, fp
	ldr r6, [r7]
	add sl, r6, r5
	ldr r1, [sl, #8]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sl, #8]
	ldr r1, [sl, #0xc]
	ldr r0, [sl, #0x1c]
	add r0, r1, r0
	str r0, [sl, #0xc]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
	ldr r6, [r7, #4]
	add sl, r6, r5
	ldr r1, [sl, #8]
	ldr r0, [sl, #0x18]
	add r0, r1, r0
	str r0, [sl, #8]
	ldr r1, [sl, #0xc]
	ldr r0, [sl, #0x1c]
	add r0, r1, r0
	str r0, [sl, #0xc]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r6, r5]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	add r4, r4, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B04C:
	ldr r0, [r7, #0x2d4]
	cmp r4, r0
	blt _0206AF84
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0206B0E0
	mov r6, #0
	mov fp, r6
	b _0206B0D0
_0206B070:
	mov r0, #0x58
	mul r4, r6, r0
	ldr r5, [r7]
	ldrsh r0, [r5, r4]
	add sl, r5, r4
	bl sub_0201F324
	str fp, [sl, #8]
	str fp, [sl, #0x18]
	str fp, [sl, #0x1c]
	ldrsh r0, [r5, r4]
	bl sub_0201F324
	ldr r2, [sl, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r5, r4]
	bl sub_0201F324
	ldr r2, [sl, #0xc]
	add r6, r6, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B0D0:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206B070
	b _0206B0E8
_0206B0E0:
	sub r0, r0, #1
	str r0, [r7, #8]
_0206B0E8:
	ldr r0, [r7, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x11000
	ble _0206B670
	add r0, sb, #0x1000
	ldr r5, [r0, #0xf5c]
	mov r1, #0x8000
	str r1, [r0, #0xb8c]
	mov r1, #0x6000
	str r1, [r0, #0xb90]
	bl sub_0201F36C
	add r1, sb, #0x1b00
	strh r0, [r1, #0x84]
	ldrsh r0, [r1, #0x84]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	mov r1, #0x80
	strh r1, [r4, #0x2a]
	add r3, sb, #0x1000
	ldr sl, [r3, #0xb8c]
	mov r6, #2
	mov r1, sl, asr #7
	add r1, sl, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4]
	ldr r3, [r3, #0xb90]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4, #2]
	str r6, [sp]
	str r2, [sp, #4]
	ldr r1, [r5, #8]
	ldr r3, [r5, #0xc]
	bl sub_0201E7D8
	ldrsh r0, [r4, #0x1a]
	mov r5, #0
	mov r1, #0x28
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	strh r0, [r4, #8]
	ldrsh r2, [r4, #0x1c]
	add r3, sb, #0x1000
	mov r0, #0x1000
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r4, #0xa]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	str r1, [r3, #0xbd4]
	bl _s32_div_f
	add r1, sb, #0x1b00
	strh r0, [r1, #0xcc]
	ldr r0, [r7, #0xc]
	add r0, r0, #1
	str r0, [r7, #0xc]
	b _0206B670
_0206B1D4:
	add r0, sb, #0x1b00
	ldrsh r3, [r0, #0x84]
	add r0, sb, #0x1000
	add r1, sb, #0x384
	mvn r2, #0
	cmp r3, r2
	add r6, r1, #0x1800
	ldr r7, [r0, #0xf5c]
	beq _0206B2D4
	ldrsh r0, [r6]
	bl sub_0201F324
	ldr r1, [r6, #4]
	mov r5, r0
	cmp r1, #2
	ldrh r4, [r5, #0x10]
	bge _0206B298
	ldr r0, [r6, #0x4c]
	add r1, r0, #1
	str r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _0206B298
	ldr r0, [r6, #4]
	add r0, r0, #1
	str r0, [r6, #4]
	cmp r0, #2
	bne _0206B278
	ldr r1, [r6, #0x50]
	mov r0, #0xc00
	bl _s32_div_f
	strh r0, [r6, #0x48]
	add r0, sb, #0x1000
	mov r1, #1
	str r1, [r0, #0xbf0]
	mov r1, #8
	str r1, [r0, #0xbe8]
	ldr r1, [r0, #0xbec]
	str r1, [r0, #0xbe0]
	ldr r1, [r0, #0xbf0]
	str r1, [r0, #0xbe4]
	b _0206B290
_0206B278:
	cmp r0, #1
	bne _0206B290
	ldr r1, [r6, #0x50]
	mov r0, #0xc00
	bl _s32_div_f
	strh r0, [r6, #0x48]
_0206B290:
	mov r0, #0
	str r0, [r6, #0x4c]
_0206B298:
	ldrsh r0, [r6, #0x48]
	ldr r1, [r6, #4]
	cmp r1, #1
	subeq r4, r4, r0
	beq _0206B2C8
	cmp r1, #2
	add r4, r4, r0
	bne _0206B2C8
	add r0, r0, #0x20
	cmp r4, #0x4000
	strh r0, [r6, #0x48]
	movge r4, #0x4000
_0206B2C8:
	strh r4, [r5, #0x10]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
_0206B2D4:
	add r0, sb, #0x1000
	ldr r1, [r0, #0xbf4]
	cmp r1, #0
	beq _0206B2F0
	cmp r1, #1
	beq _0206B3C4
	b _0206B670
_0206B2F0:
	mov r5, #0
	mov r2, #1
	str r5, [r0, #0xbdc]
	mov r1, #0x10
	str r2, [r0, #0xbe0]
	str r1, [r0, #0xbec]
	str r1, [r0, #0xbe8]
	mov r1, #8
	str r1, [r0, #0xbf0]
	rsb r1, r2, #0x3e8
	str r1, [r0, #0xbe4]
	ldr r4, [r0, #0xf5c]
	add r0, sb, #0x3f8
	add fp, r0, #0x1800
_0206B328:
	mov r0, #0x7c
	mla r6, r5, r0, fp
	mov r0, r6
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r4, #0x18]
	mov r0, r6
	bl SetSpriteIdForAnimationControl
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xc
	mul r1, r5, r0
	ldr r0, _0206B9C0 ; =_020A9EE0
	mov r2, #0
	add sl, r0, r1
	ldr r1, [r0, r1]
	mov r0, r6
	mov r3, #0x2c0
	bl SetAnimationForAnimationControl
	ldr r1, [sl, #4]
	mov r0, r6
	strh r1, [r6, #0x1c]
	ldr r2, [sl, #8]
	mov r1, #0
	strh r2, [r6, #0x1e]
	bl sub_0201D12C
	add r5, r5, #1
	cmp r5, #7
	blt _0206B328
	add r0, sb, #0x1000
	mov r1, #1
	strb r1, [r0, #0xf60]
	ldr r1, [r0, #0xbf4]
	add r1, r1, #1
	str r1, [r0, #0xbf4]
_0206B3C4:
	add r0, sb, #0x1000
	ldr r2, [r0, #0xbe0]
	add r1, r2, #1
	str r1, [r0, #0xbe0]
	ldr r0, [r0, #0xbec]
	cmp r2, r0
	ble _0206B54C
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r4, r0, #3
	ldr r0, _0206B9C4 ; =0x000001FF
	mov r5, #0
	add r0, r0, #0xe00
	str r0, [sp, #0x34]
	b _0206B51C
_0206B408:
	bl Rand16Bit
	bl Rand16Bit
	ldr r1, _0206B9BC ; =_020B0B4C
	ldr r2, [r1, #0xc]
	ldr r1, _0206B9C4 ; =0x000001FF
	and r0, r0, r1
	add r0, r2, r0
	str r0, [sp, #0x14]
	bl Rand16Bit
	ldr r1, _0206B9BC ; =_020B0B4C
	and r0, r0, #0xf
	ldr r1, [r1]
	add fp, r1, r0
	bl Rand16Bit
	ldr r1, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	bl _s32_div_f
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	bl Rand16Bit
	mov r1, #0xd0
	bl _s32_div_f
	add sl, r1, #0x10
	bl Rand16Bit
	str sl, [sp]
	str r6, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #0x34]
	mov r2, #0x8000
	and sl, r0, r1
	mov r0, sb
	mov r1, r7
	mov r3, #0x6000
	bl sub_0206BDF4
	movs r6, r0
	beq _0206B510
	ldrsh r0, [r6]
	bl sub_0201F324
	ldrsh r2, [r0, #0x1a]
	mov r1, r6
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r0, #8]
	ldrsh r2, [r0, #0x1c]
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	strh r2, [r0, #0xa]
	mov r2, #0x800
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldr r0, _0206B9C8 ; =sub_0206BFA8
	bl ov10_022C2450
	mov r0, #0x8000
	str r0, [r6, #0x30]
	mov r0, #0x6000
	str r0, [r6, #0x34]
	mov r0, #0
	str r0, [r6, #0x24]
	str sl, [r6, #0x20]
	ldr r0, [sp, #0x14]
	str fp, [r6, #0x38]
	str r0, [r6, #0x3c]
_0206B510:
	cmp r6, #0
	beq _0206B524
	add r5, r5, #1
_0206B51C:
	cmp r5, r4
	blt _0206B408
_0206B524:
	bl Rand16Bit
	add r2, sb, #0x1000
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	ldr r3, [r2, #0xbe8]
	add r0, r1, r0, ror #29
	add r0, r3, r0
	str r0, [r2, #0xbec]
	mov r0, #0
	str r0, [r2, #0xbe0]
_0206B54C:
	add r0, sb, #0x1000
	ldr r1, [r0, #0xbe4]
	add r1, r1, #1
	str r1, [r0, #0xbe4]
	ldr r0, [r0, #0xbf0]
	cmp r1, r0
	ble _0206B670
	bl Rand16Bit
	ldr r1, _0206B9CC ; =0x00000FFF
	mov r4, #0
	and r0, r0, r1
	mov r5, r0, lsl #0x10
	sub fp, r1, #0xe00
_0206B580:
	bl Rand16Bit
	ldr r1, [r7]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	bl _s32_div_f
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	bl Rand16Bit
	mov r1, #0xd0
	bl _s32_div_f
	add sl, r1, #0x10
	bl Rand16Bit
	str sl, [sp]
	and sl, r0, fp
	str r6, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r0, sb
	mov r1, r7
	mov r2, #0x8000
	mov r3, #0x6000
	bl sub_0206BDF4
	movs r6, r0
	beq _0206B658
	ldrsh r0, [r6]
	bl sub_0201F324
	mov r1, #0
	strh r1, [r0, #0x12]
	mov r2, r1
	ldr r1, _0206B9D0 ; =0x00005555
	strh r2, [r0, #0x10]
	mul r1, r4, r1
	add r0, r1, r5, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x20]
	mov r0, r4, lsl #1
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x20]
	bl sub_02001980
	add r1, sl, #0x300
	bl MultiplyByFixedPoint
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x20]
	bl sub_020018D0
	add r1, sl, #0x300
	rsb r0, r0, #0
	bl MultiplyByFixedPoint
	str r0, [r6, #0x1c]
	ldr r0, _0206B9D4 ; =sub_0206BEAC
	mov r1, r6
	bl ov10_022C2450
_0206B658:
	add r4, r4, #1
	cmp r4, #3
	blt _0206B580
	add r0, sb, #0x1000
	mov r1, #0
	str r1, [r0, #0xbe4]
_0206B670:
	mov r4, #0
	b _0206B990
_0206B678:
	cmp r0, #2
	bne _0206B990
	ldr r5, [r8, #0x24]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0206B6A4
	cmp r0, #1
	beq _0206B838
	cmp r0, #2
	beq _0206B984
	b _0206B98C
_0206B6A4:
	ldr r0, _0206B9D8 ; =_020A9E80
	add r4, sp, #0x3c
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [r5, #0x2d8]
	mov r6, #0
	str r0, [sp, #0x20]
	mov r0, #0x14000
	rsb r0, r0, #0
	str r0, [sp, #0x30]
	mov r0, r0, asr #0x11
	str r0, [sp, #0x38]
	b _0206B810
_0206B6D8:
	add r0, sp, #0x3c
	ldr r0, [r0, r6, lsl #2]
	tst r6, #1
	mov r0, r0, lsl #8
	add r0, r0, #0x800
	movne sb, #0x2000
	moveq sb, #0
	str r0, [sp, #0x24]
	cmp r6, #2
	movlt r0, #1
	movge r0, #0
	ands r4, r0, #0xff
	ldreq r0, [sp, #0x38]
	ldr r1, _0206B9BC ; =_020B0B4C
	muleq r0, sb, r0
	moveq sb, r0
	cmp r4, #0
	ldrne sl, [sp, #0x30]
	ldr r1, [r1, #4]
	moveq sl, #0x14000
	rsb r0, sl, #0
	bl _s32_div_f
	str r0, [sp, #0x28]
	mov r0, #0x58
	mul r7, r6, r0
	mov r0, r6, lsl #0x10
	mov r1, r0, asr #0x10
	ldr fp, [r5]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x24]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	add r0, fp, r7
	add r2, sl, sb
	bl sub_0206BC3C
	ldrsh r0, [fp, r7]
	bl sub_0201F324
	ldrsh r1, [r0, #0x1c]
	cmp r1, #0x28
	moveq r3, #3
	beq _0206B7A4
	cmp r1, #0x20
	moveq r3, #2
	movne r3, #1
_0206B7A4:
	cmp r4, #0
	movne r0, #0x10000
	moveq r0, #0
	add r0, sl, r0
	add r2, r0, sb
	ldr r4, [r5, #4]
	ldr r0, [sp, #0x28]
	add r1, r1, r1, lsr #31
	str r0, [sp]
	mov r0, r3, lsl #0x10
	mov sb, r0, asr #0x10
	ldr r0, [sp, #0x24]
	mov r1, r1, asr #1
	add r3, r0, r1, lsl #8
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	str sb, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	add r0, r4, r7
	bl sub_0206BD04
	ldrsh r0, [r4, r7]
	bl sub_0201F324
	add r6, r6, #1
_0206B810:
	ldr r0, [r5, #0x2d4]
	cmp r6, r0
	blt _0206B6D8
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r0, [r0, #4]
	str r0, [r5, #8]
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _0206B98C
_0206B838:
	mov sb, #0
	mov r6, #1
	mov fp, sb
	b _0206B95C
_0206B848:
	mov r0, #0x58
	mul sl, sb, r0
	ldr r0, [r5]
	add r4, r0, sl
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0206B8F8
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	ble _0206B8A0
	ldr r0, [r4, #8]
	cmp r0, #0
	stmgeib r4, {r6, fp}
	bge _0206B8C0
_0206B8A0:
	cmp r1, #0
	bge _0206B8C0
	ldr r0, [r4, #8]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4, #8]
	movle r0, #1
	strle r0, [r4, #4]
_0206B8C0:
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r2, [r4, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r2, [r4, #0xc]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B8F8:
	ldr r4, [r5, #4]
	add r7, r4, sl
	ldr r1, [r7, #8]
	ldr r0, [r7, #0x18]
	add r0, r1, r0
	str r0, [r7, #8]
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x1c]
	add r0, r1, r0
	str r0, [r7, #0xc]
	ldrsh r0, [r4, sl]
	bl sub_0201F324
	ldr r2, [r7, #8]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
	ldrsh r0, [r4, sl]
	bl sub_0201F324
	ldr r2, [r7, #0xc]
	add sb, sb, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0, #2]
_0206B95C:
	ldr r0, [r5, #0x2d4]
	cmp sb, r0
	blt _0206B848
	ldr r0, [r5, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x11000
	ldrgt r0, [r5, #0xc]
	addgt r0, r0, #1
	strgt r0, [r5, #0xc]
	b _0206B98C
_0206B984:
	mov r4, #1
	b _0206B990
_0206B98C:
	mov r4, #0
_0206B990:
	cmp r4, #0
	movne r0, #1
	strneb r0, [r8, #0x31]
_0206B99C:
	ldr r0, _0206B9BC ; =_020B0B4C
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x3c]
	add r0, r0, #1
	str r0, [r1, #0x3c]
_0206B9B0:
	mov r0, #1
_0206B9B4:
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0206B9BC: .word _020B0B4C
_0206B9C0: .word _020A9EE0
_0206B9C4: .word 0x000001FF
_0206B9C8: .word sub_0206BFA8
_0206B9CC: .word 0x00000FFF
_0206B9D0: .word 0x00005555
_0206B9D4: .word sub_0206BEAC
_0206B9D8: .word _020A9E80
	arm_func_end sub_0206ADB8

	arm_func_start sub_0206B9DC
sub_0206B9DC: ; 0x0206B9DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0206BA58 ; =_020B0B4C
	ldr r1, [r0, #8]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r1, #0x30]
	cmp r0, #0
	bne _0206BA50
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _0206BA14
	cmp r0, #1
	b _0206BA50
_0206BA14:
	ldr r1, [r1, #0x28]
	cmp r1, #0
	addne r0, r1, #0x1000
	ldrneb r0, [r0, #0xf60]
	cmpne r0, #0
	beq _0206BA50
	add r0, r1, #0x3f8
	mov r6, #0
	add r5, r0, #0x1800
	mov r4, #0x7c
_0206BA3C:
	mla r0, r6, r4, r5
	bl sub_0201CF5C
	add r6, r6, #1
	cmp r6, #7
	blt _0206BA3C
_0206BA50:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0206BA58: .word _020B0B4C
	arm_func_end sub_0206B9DC

	arm_func_start sub_0206BA5C
sub_0206BA5C: ; 0x0206BA5C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r0, [r0, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl ov10_022C23B0
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r5, [r0, #8]
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r7, [r5, #0x24]
	cmp r7, #0
	beq _0206BAE8
	mov r6, #0
	mov r4, #0x58
	b _0206BABC
_0206BA9C:
	mul r8, r6, r4
	ldr r0, [r7]
	add r0, r0, r8
	bl sub_0206BB94
	ldr r0, [r7, #4]
	add r0, r0, r8
	bl sub_0206BB94
	add r6, r6, #1
_0206BABC:
	ldr r0, [r7, #0x2d4]
	cmp r6, r0
	blt _0206BA9C
	ldr r0, [r7]
	bl MemFree
	ldr r0, [r7, #4]
	bl MemFree
	ldr r0, [r5, #0x24]
	bl MemFree
	mov r0, #0
	str r0, [r5, #0x24]
_0206BAE8:
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r5, [r0, #8]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _0206BB3C
	mov r6, #0
	mov r4, #0x58
_0206BB04:
	ldr r0, [r5, #0x28]
	mla r0, r6, r4, r0
	bl sub_0206BB94
	add r6, r6, #1
	cmp r6, #0x50
	blt _0206BB04
	ldr r0, [r5, #0x28]
	add r0, r0, #0x384
	add r0, r0, #0x1800
	bl sub_0206BB94
	ldr r0, [r5, #0x28]
	bl MemFree
	mov r0, #0
	str r0, [r5, #0x28]
_0206BB3C:
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r4, [r0, #8]
	add r0, r4, #0x14
	bl sub_0201E020
	add r0, r4, #4
	bl sub_0201E020
	add r0, r4, #0xc
	bl sub_0201E020
	ldr r0, _0206BB90 ; =WAN_TABLE
	ldrsh r1, [r4, #0x1c]
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _0206BB8C ; =_020B0B4C
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _0206BB8C ; =_020B0B4C
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0201F248
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0206BB8C: .word _020B0B4C
_0206BB90: .word WAN_TABLE
	arm_func_end sub_0206BA5C

	arm_func_start sub_0206BB94
sub_0206BB94: ; 0x0206BB94
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4]
	mvn r0, #0
	cmp r1, r0
	ldmeqia sp!, {r4, pc}
	cmp r1, #0
	bne _0206BBBC
	ldr r0, _0206BBDC ; =_020A9F98
	bl Debug_Print0
_0206BBBC:
	ldrsh r0, [r4]
	bl sub_0201F2AC
	mov r0, r4
	mov r1, #0x58
	bl MemZero
	mvn r0, #0
	strh r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206BBDC: .word _020A9F98
	arm_func_end sub_0206BB94

	arm_func_start sub_0206BBE0
sub_0206BBE0: ; 0x0206BBE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0x2dc
	mov r1, #6
	bl MemAlloc
	mov r1, #0x2dc
	mov r4, r0
	bl MemZero
	mov r0, #0x58
	mul r5, r6, r0
	mov r0, r5
	str r7, [r4, #0x2d8]
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov r0, r5
	mov r1, #6
	bl MemAlloc
	str r0, [r4, #4]
	mov r0, r4
	str r6, [r4, #0x2d4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BBE0

	arm_func_start sub_0206BC3C
sub_0206BC3C: ; 0x0206BC3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r1, #0x58
	mov r5, r0
	mov r7, r2
	mov r6, r3
	bl MemZero
	mvn r0, #0
	strh r0, [r5]
	bl sub_0201F36C
	strh r0, [r5]
	ldrsh r1, [r5]
	mvn r0, #0
	cmp r1, r0
	beq _0206BCF8
	str r7, [r5, #8]
	ldr r1, [sp, #0x20]
	str r6, [r5, #0xc]
	ldr r0, [sp, #0x24]
	str r1, [r5, #0x18]
	str r0, [r5, #0x1c]
	ldrsh r0, [r5]
	bl sub_0201F324
	mov r1, #0
	ldr r2, [sp, #0x28]
	strb r1, [r0, #0x3c]
	strh r2, [r0, #0x2a]
	ldr ip, [r5, #8]
	ldrsh r3, [sp, #0x30]
	mov r2, ip, asr #7
	add r2, ip, r2, lsr #24
	mov r2, r2, asr #8
	strh r2, [r0]
	ldr r5, [r5, #0xc]
	mov r3, r3, lsl #0x14
	mov r2, r5, asr #7
	add r2, r5, r2, lsr #24
	mov r2, r2, asr #8
	strh r2, [r0, #2]
	str r1, [sp]
	mov r1, r3, asr #0x10
	str r1, [sp, #4]
	ldrsh r2, [sp, #0x2c]
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0x14]
	bl sub_0201E7D8
_0206BCF8:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BC3C

	arm_func_start sub_0206BD04
sub_0206BD04: ; 0x0206BD04
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r1, #0x58
	mov r6, r0
	mov r7, r2
	mov r4, r3
	bl MemZero
	mvn r0, #0
	strh r0, [r6]
	bl sub_0201F36C
	strh r0, [r6]
	ldrsh r1, [r6]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	beq _0206BDEC
	str r7, [r6, #8]
	ldr r1, [sp, #0x20]
	str r4, [r6, #0xc]
	ldr r0, [sp, #0x24]
	str r1, [r6, #0x18]
	str r0, [r6, #0x1c]
	ldrsh r0, [r6]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	ldr r1, [sp, #0x28]
	ldrsh r2, [sp, #0x30]
	strh r1, [r4, #0x2a]
	ldr r3, [r6, #8]
	mov r2, r2, lsl #0x14
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4]
	ldr r3, [r6, #0xc]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r4, #2]
	mov r1, #1
	str r1, [sp]
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	ldrsh r2, [sp, #0x2c]
	ldmia r5, {r1, r3}
	bl sub_0201E7D8
	ldrsh r1, [r4, #0x1a]
	mov r0, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r4, #8]
	ldrsh r1, [r4, #0x1c]
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	strh r1, [r4, #0xa]
_0206BDEC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0206BD04

	arm_func_start sub_0206BDF4
sub_0206BDF4: ; 0x0206BDF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov ip, #0
	mov r4, r0
	mov r8, ip
	mov r0, ip
	mov r5, #0x58
	mvn r6, #0
	b _0206BE48
_0206BE18:
	cmp ip, #0x50
	movge ip, r0
	mul r7, ip, r5
	ldrsh r7, [r4, r7]
	cmp r7, r6
	beq _0206BE54
	add r7, r8, #1
	add lr, ip, #1
	mov ip, r7, lsl #0x10
	mov lr, lr, lsl #0x10
	mov r8, ip, asr #0x10
	mov ip, lr, asr #0x10
_0206BE48:
	cmp r8, #0x50
	blt _0206BE18
	mvn ip, #0
_0206BE54:
	cmp ip, #0
	movlt r0, #0
	blt _0206BEA4
	mov r0, #0x58
	mla r6, ip, r0, r4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r5, [sp, #0x30]
	ldrsh r0, [sp, #0x34]
	str r5, [sp, #8]
	ldrsh r5, [sp, #0x38]
	str r0, [sp, #0xc]
	mov r0, r6
	str r5, [sp, #0x10]
	bl sub_0206BD04
	cmp r0, #0
	moveq r0, #0
	movne r0, r6
	strne r4, [r6, #0x54]
_0206BEA4:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0206BDF4

	arm_func_start sub_0206BEAC
sub_0206BEAC: ; 0x0206BEAC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	ldrsh r0, [r4]
	bl sub_0201F324
	ldr r1, [r4, #0x40]
	mov r5, r0
	cmp r1, #0
	ble _0206BEEC
	ldrsh r0, [r4]
	mov r1, #0
	bl sub_0201F348
	ldr r0, [r4, #0x40]
	sub r0, r0, #1
	str r0, [r4, #0x40]
	ldmia sp!, {r4, r5, r6, pc}
_0206BEEC:
	ldrh r0, [r5, #0x10]
	cmp r0, #0x1000
	beq _0206BF10
	add r0, r0, #0x100
	cmp r0, #0x1000
	movge r0, #0x1000
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x10]
_0206BF10:
	ldrsh r0, [r4]
	mov r1, #1
	bl sub_0201F348
	ldr r2, [r4, #8]
	ldr r1, [r4, #0x18]
	mvn r0, #0x3f
	add r1, r2, r1
	str r1, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	add r1, r2, r1
	str r1, [r4, #0xc]
	ldrsh r1, [r5]
	cmp r1, r0
	blt _0206BF68
	cmp r1, #0x140
	bgt _0206BF68
	ldrsh r1, [r5, #2]
	cmp r1, r0
	blt _0206BF68
	cmp r1, #0x100
	ble _0206BF7C
_0206BF68:
	mov r0, r4
	bl sub_0206BB94
	mov r0, r6
	bl ov10_022C24DC
	ldmia sp!, {r4, r5, r6, pc}
_0206BF7C:
	ldr r1, [r4, #8]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5]
	ldr r1, [r4, #0xc]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5, #2]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0206BEAC

	arm_func_start sub_0206BFA8
sub_0206BFA8: ; 0x0206BFA8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	ldrsh r0, [r4]
	bl sub_0201F324
	mov r5, r0
	ldr r0, [r4, #0x20]
	bl sub_02001980
	ldr r1, [r4, #0x24]
	bl MultiplyByFixedPoint
	ldr r1, [r4, #0x30]
	add r7, r1, r0
	ldr r0, [r4, #0x20]
	bl sub_020018D0
	ldr r1, [r4, #0x24]
	rsb r0, r0, #0
	bl MultiplyByFixedPoint
	ldr r2, [r4, #0x34]
	ldr r1, _0206C0D4 ; =0x00000FFF
	add r0, r2, r0
	str r7, [r4, #8]
	str r0, [r4, #0xc]
	ldr r2, [r4, #0x20]
	ldr r0, [r4, #0x38]
	add r2, r2, r0
	and r0, r2, r1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x24]
	ldrh r0, [r5, #0x10]
	cmp r0, #0x1000
	addlo r0, r0, #0x80
	strloh r0, [r5, #0x10]
	ldrloh r0, [r5, #0x12]
	addlo r0, r0, #0x80
	strloh r0, [r5, #0x12]
	ldr r1, [r4, #0x3c]
	mvn r0, #0x3f
	add r1, r1, #8
	str r1, [r4, #0x3c]
	ldrsh r1, [r5]
	cmp r1, r0
	blt _0206C078
	cmp r1, #0x140
	bgt _0206C078
	ldrsh r1, [r5, #2]
	cmp r1, r0
	blt _0206C078
	cmp r1, #0x140
	ble _0206C08C
_0206C078:
	mov r0, r4
	bl sub_0206BB94
	mov r0, r6
	bl ov10_022C24DC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0206C08C:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ldr r0, [r4, #0x20]
	movlt r0, r0, lsl #4
	movge r0, r0, lsl #4
	rsbge r0, r0, #0x10000
	strh r0, [r5, #0x28]
	ldr r1, [r4, #8]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5]
	ldr r1, [r4, #0xc]
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0206C0D4: .word 0x00000FFF
	arm_func_end sub_0206BFA8

	arm_func_start sub_0206C0D8
sub_0206C0D8: ; 0x0206C0D8
	ldr r1, _0206C0E8 ; =_020B0B6C
	ldrsh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C0E8: .word _020B0B6C
	arm_func_end sub_0206C0D8

	arm_func_start sub_0206C0EC
sub_0206C0EC: ; 0x0206C0EC
	ldr r1, _0206C0F8 ; =_020B0B6C
	strh r0, [r1]
	bx lr
	.align 2, 0
_0206C0F8: .word _020B0B6C
	arm_func_end sub_0206C0EC

	arm_func_start sub_0206C0FC
sub_0206C0FC: ; 0x0206C0FC
	ldr r1, _0206C10C ; =_020B0B70
	ldrsh r1, [r1, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C10C: .word _020B0B70
	arm_func_end sub_0206C0FC

	arm_func_start sub_0206C110
sub_0206C110: ; 0x0206C110
	ldr r1, _0206C11C ; =_020B0B70
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0206C11C: .word _020B0B70
	arm_func_end sub_0206C110

	arm_func_start sub_0206C120
sub_0206C120: ; 0x0206C120
	ldr r1, _0206C130 ; =_020B0B70
	ldrsh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0206C130: .word _020B0B70
	arm_func_end sub_0206C120

	arm_func_start sub_0206C134
sub_0206C134: ; 0x0206C134
	ldr r1, _0206C140 ; =_020B0B70
	strh r0, [r1]
	bx lr
	.align 2, 0
_0206C140: .word _020B0B70
	arm_func_end sub_0206C134

	arm_func_start sub_0206C144
sub_0206C144: ; 0x0206C144
	ldr r3, _0206C160 ; =_020B0B74
	mov r2, #8
_0206C14C:
	ldrb r1, [r3], #1
	subs r2, r2, #1
	strb r1, [r0], #1
	bne _0206C14C
	bx lr
	.align 2, 0
_0206C160: .word _020B0B74
	arm_func_end sub_0206C144

	arm_func_start sub_0206C164
sub_0206C164: ; 0x0206C164
	ldr r3, _0206C180 ; =_020B0B74
	mov r2, #8
_0206C16C:
	ldrb r1, [r0], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _0206C16C
	bx lr
	.align 2, 0
_0206C180: .word _020B0B74
	arm_func_end sub_0206C164

	arm_func_start sub_0206C184
sub_0206C184: ; 0x0206C184
	ldr ip, _0206C198 ; =sub_0207A7EC
	mov r0, #0
	mov r2, r1
	sub r1, r0, #1
	bx ip
	.align 2, 0
_0206C198: .word sub_0207A7EC
	arm_func_end sub_0206C184

	arm_func_start sub_0206C19C
sub_0206C19C: ; 0x0206C19C
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r0, #0
	mov r2, r4
	sub r1, r0, #1
	bl sub_0207A8F4
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206C19C

	arm_func_start sub_0206C1BC
sub_0206C1BC: ; 0x0206C1BC
	bx lr
	arm_func_end sub_0206C1BC

	arm_func_start DseDriver_LoadDefaultSettings
DseDriver_LoadDefaultSettings: ; 0x0206C1C0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C248 ; =DRIVER_WORK
	mov r2, #1
	movs r4, r0
	strb r2, [r1, #0x3d]
	subeq r0, r2, #0x100
	ldmeqia sp!, {r4, pc}
	mov r1, #0x40
	bl DseMem_Clear
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r1, #8
	strb r1, [r4, #0x10]
	strb r0, [r4, #0x11]
	strh r0, [r4, #0x14]
	mov r1, #0xf
	strh r1, [r4, #0x16]
	mov r1, #0x14
	strb r1, [r4, #0x12]
	mov r1, #4
	strh r1, [r4, #0x18]
	ldr r2, _0206C24C ; =_0206C184
	strh r1, [r4, #0x1a]
	ldr r1, _0206C250 ; =_0206C19C
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	ldr r1, _0206C254 ; =sub_0206C1BC
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	str r1, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C248: .word DRIVER_WORK
_0206C24C: .word sub_0206C184
_0206C250: .word sub_0206C19C
_0206C254: .word sub_0206C1BC
	arm_func_end DseDriver_LoadDefaultSettings

	arm_func_start DseDriver_IsSettingsValid
DseDriver_IsSettingsValid: ; 0x0206C258
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	bne _0206C27C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C27C:
	tst r4, #3
	beq _0206C29C
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_0206C29C:
	ldr r0, [r4, #8]
	mov r5, #0
	cmp r0, #0
	beq _0206C2B4
	tst r0, #0xf
	beq _0206C2B8
_0206C2B4:
	orr r5, r5, #4
_0206C2B8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0206C2CC
	tst r0, #0xf
	beq _0206C2D0
_0206C2CC:
	orr r5, r5, #8
_0206C2D0:
	ldrb r0, [r4, #0x11]
	ldrb r1, [r4, #0x10]
	cmp r0, #0
	cmpne r0, #1
	orrne r5, r5, #0x100
	cmp r1, #4
	ldrb r0, [r4, #0x12]
	orrlo r5, r5, #0x200
	cmp r0, r1
	ldrsh r1, [r4, #0x14]
	orrls r5, r5, #0x400
	ldrsh r0, [r4, #0x16]
	cmp r1, #0
	orrne r5, r5, #0x4000
	cmp r0, #0x10
	orrge r5, r5, #0x8000
	cmp r1, r0
	orrgt r5, r5, #0xc000
	cmp r5, #0
	beq _0206C330
	mov r1, r5
	mvn r0, #0x17
	mov r2, #0
	bl Dse_SetError
_0206C330:
	mov r0, r5
	str r5, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DseDriver_IsSettingsValid

	arm_func_start DseDriver_ConfigureHeap
DseDriver_ConfigureHeap: ; 0x0206C33C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strne r1, [r0, #8]
	strne r2, [r0, #0xc]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end DseDriver_ConfigureHeap

	arm_func_start sub_0206C36C
sub_0206C36C: ; 0x0206C36C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	strneb r1, [r0, #0x11]
	strneb r2, [r0, #0x10]
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C36C

	arm_func_start sub_0206C39C
sub_0206C39C: ; 0x0206C39C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0206C3C0
	mov r1, #0
	mov r2, r1
	mvn r0, #0x17
	bl Dse_SetError
	mvn r0, #0x17
	ldmia sp!, {r3, pc}
_0206C3C0:
	cmp r1, #0
	movlt r1, #0
	cmp r2, #0
	strh r1, [r0, #0x14]
	movlt r2, #0xf
	strh r2, [r0, #0x16]
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0206C39C

	arm_func_start DseDriver_Init
DseDriver_Init: ; 0x0206C3E0
	stmdb sp!, {r4, lr}
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r1, [r1]
	cmp r1, #1
	bne _0206C410
	mov r1, #0
	mov r2, r1
	mvn r0, #0xbf
	bl Dse_SetError
	mvn r0, #0xbf
	ldmia sp!, {r4, pc}
_0206C410:
	bl DseDriver_IsSettingsValid
	movs r1, r0
	beq _0206C430
	mvn r0, #0x1d
	mov r2, #0
	bl Dse_SetError
	mvn r0, #0x1d
	ldmia sp!, {r4, pc}
_0206C430:
	bl sub_0207AD54
	mov r0, #0
	mov r1, r0
	bl sub_0207AEF4
	bl sub_0207AFF0
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r3, #0
	strh r3, [r0, #2]
	str r3, [r0, #4]
	str r3, [r0, #0x10]
	mov r2, #0xff
	mov r1, #1
	strb r2, [r0, #0x3c]
	strb r1, [r0, #0x3d]
	rsb r1, r1, #0x1000
	strh r1, [r0, #0x3e]
	str r3, [r0, #0x2c]
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	ldreq r2, _0206C5FC ; =0x00002710
	moveq r1, #0x64
	ldrne r2, _0206C600 ; =0x0000414B
	movne r1, #0x3c
	strh r2, [r0, #0x28]
	str r1, [r0, #0x30]
	ldr r2, _0206C604 ; =0x00BC614E
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	ldr r0, _0206C608 ; =_022B8330
	str r2, [r1, #0x34]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #0xdd8]
	bl sub_0206C814
	ldr r1, _0206C5F8 ; =DRIVER_WORK
	mov r0, #1
	strb r0, [r1, #0x38]
	mov r3, #2
	ldr r2, _0206C60C ; =_020B1290
	ldr r0, _0206C608 ; =_022B8330
	strb r3, [r1, #0x39]
	str r2, [r0, #0xed4]
	mov r2, #0
	str r2, [r1, #0x71c]
	str r2, [r1, #0x720]
	str r2, [r1, #0x724]
	str r2, [r1, #0x728]
	ldrb r1, [r4, #0x10]
	ldr ip, _0206C610 ; =DRIVER_WORK
	mov r3, r2
	strb r1, [r0, #0xd10]
_0206C4F4:
	add r2, r2, #1
	strb r3, [ip, #0x674]
	cmp r2, #0x80
	add ip, ip, #1
	blt _0206C4F4
	ldr ip, _0206C5F8 ; =DRIVER_WORK
	mov r0, #0x64
	strb r0, [ip, #0x67b]
	mov r0, #0x7f
	strb r0, [ip, #0x67f]
	mov r0, #0x40
	strb r0, [ip, #0x67e]
	add r0, r4, #0x28
	ldr lr, _0206C614 ; =_022B734C
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldrsh ip, [ip, #0x28]
	ldr r1, _0206C608 ; =_022B8330
	mov r2, #1
	str r3, [r1, #0xec8]
	str r2, [r1, #0xecc]
	str r3, [r1, #0xebc]
	ldr r0, _0206C618 ; =_022B9130
	str r3, [r1, #0xec0]
	sub r2, r2, #2
	strh r2, [r0, #0xc4]
	strh ip, [r0, #0xc6]
	strb r3, [r1, #0xed0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r4, #0x1c
	bl DseMem_Init
	ldrsh r0, [r4, #0x16]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl DseVoice_ResetHW
	bl DseVoice_ResetAll
	bl sub_02070124
	bl sub_02075600
	bl sub_020729A4
	ldr r1, _0206C61C ; =_022B7331
	mov r2, #1
	mov r0, #0x7f
_0206C5A4:
	add r2, r2, #1
	strb r0, [r1, #0x40]
	cmp r2, #0x10
	add r1, r1, #1
	blt _0206C5A4
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #0x40]
	bl DseDriver_StartMainThread
	ldrb r0, [r4, #0x12]
	bl DseSwd_SysInit
	ldr r0, _0206C5F8 ; =DRIVER_WORK
	mov r1, #1
	strb r1, [r0]
	mov r1, #0
	strb r1, [r0, #1]
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	bl DseSe_SysReset
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C5F8: .word DRIVER_WORK
_0206C5FC: .word 0x00002710
_0206C600: .word 0x0000414B
_0206C604: .word 0x00BC614E
_0206C608: .word _022B8330
_0206C60C: .word _020B1290
_0206C610: .word DRIVER_WORK
_0206C614: .word _022B734C
_0206C618: .word _022B9130
_0206C61C: .word _022B7331
	arm_func_end DseDriver_Init

	arm_func_start sub_0206C620
sub_0206C620: ; 0x0206C620
	stmdb sp!, {r3, lr}
	ldr r0, _0206C684 ; =DRIVER_WORK
	ldrsb r0, [r0]
	cmp r0, #0
	mvneq r0, #0xc0
	ldmeqia sp!, {r3, pc}
	bl DseSwd_SysQuit
	mov r0, #0
	bl sub_0206C7F4
	bl sub_020756E8
	bl sub_02070158
	bl sub_02070148
	bl sub_02070EA0
	bl DseVoice_ResetAll
	bl DseMem_Quit
	bl sub_0206C814
	ldr r1, _0206C684 ; =DRIVER_WORK
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	str r0, [r1, #0x2c]
	str r0, [r1, #4]
	str r0, [r1, #0x10]
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C684: .word DRIVER_WORK
	arm_func_end sub_0206C620

	arm_func_start sub_0206C688
sub_0206C688: ; 0x0206C688
	stmdb sp!, {r3, lr}
	ldr r0, _0206C6B8 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	ldrnesb r0, [r0, #1]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C6B8: .word DRIVER_WORK
	arm_func_end sub_0206C688

	arm_func_start sub_0206C6BC
sub_0206C6BC: ; 0x0206C6BC
	stmdb sp!, {r3, lr}
	ldr r0, _0206C750 ; =DRIVER_WORK
	ldrsb r1, [r0]
	cmp r1, #0
	bne _0206C6E8
	mov r1, #0
	mov r2, r1
	mvn r0, #0xc0
	bl Dse_SetError
	mvn r0, #0xc0
	ldmia sp!, {r3, pc}
_0206C6E8:
	ldrsb r1, [r0, #1]
	cmp r1, #1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r0, #1]
	bl sub_02070F4C
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x664]
	bl DseSequence_PauseList
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #0
	ldr r0, [r0, #0x668]
	bl DseSequence_PauseList
	mov r0, #0
	bl sub_0206F6FC
	mov r0, #0
	bl sub_02070188
	mov r0, #0
	bl DseVoice_ResetHW
	ldr r0, _0206C750 ; =DRIVER_WORK
	mov r1, #2
	strb r1, [r0, #0x38]
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C750: .word DRIVER_WORK
	arm_func_end sub_0206C6BC

	arm_func_start sub_0206C754
sub_0206C754: ; 0x0206C754
	stmdb sp!, {r4, lr}
	ldr r1, _0206C7F0 ; =DRIVER_WORK
	mov r4, r0
	ldrsb r0, [r1, #1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r1, #0x38]
	ldrh r0, [r1, #0x3e]
	mov r1, r4
	tst r0, #0xf
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r2, #0
	mov r2, r2, lsl #0x18
	ldr r0, [r0, #0x664]
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	ldrh r0, [r0, #0x3e]
	tst r0, #0xf0
	movne r1, #1
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	moveq r1, #0
	mov r2, r1, lsl #0x18
	ldr r0, [r0, #0x668]
	mov r1, r4
	mov r2, r2, asr #0x18
	bl sub_0206DC78
	mov r0, r4
	bl sub_0206F774
	mov r0, r4
	bl sub_020701B0
	ldr r0, _0206C7F0 ; =DRIVER_WORK
	mov r1, #0
	strb r1, [r0, #1]
	bl DseDriver_StartTickTimer
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0206C7F0: .word DRIVER_WORK
	arm_func_end sub_0206C754

	arm_func_start sub_0206C7F4
sub_0206C7F4: ; 0x0206C7F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl DseBgm_StopAll
	mov r0, r4
	bl DseSe_StopAll
	mov r0, r4
	bl sub_0206F9A4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0206C7F4

	arm_func_start sub_0206C814
sub_0206C814: ; 0x0206C814
	ldr r1, _0206C848 ; =DRIVER_WORK
	mov r2, #0
	str r2, [r1, #0x654]
	str r2, [r1, #0x658]
	ldr r0, _0206C84C ; =_022B8330
	str r2, [r1, #0x65c]
	str r2, [r0, #0xddc]
	str r2, [r1, #0x660]
	str r2, [r1, #0x664]
	str r2, [r1, #0x668]
	ldr ip, _0206C850 ; =DseBgm_SysSetupNoteList
	str r2, [r1, #0x66c]
	bx ip
	.align 2, 0
_0206C848: .word DRIVER_WORK
_0206C84C: .word _022B8330
_0206C850: .word DseBgm_SysSetupNoteList
	arm_func_end sub_0206C814

	arm_func_start Dse_SetError
Dse_SetError: ; 0x0206C854
	stmdb sp!, {r3, lr}
	ldr r3, _0206C880 ; =DRIVER_WORK
	stmib r3, {r0, r1, r2}
	ldr ip, [r3, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C884 ; =_022B7334
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C880: .word DRIVER_WORK
_0206C884: .word _022B7334
	arm_func_end Dse_SetError

	arm_func_start Dse_SetError2
Dse_SetError2: ; 0x0206C888
	stmdb sp!, {r3, lr}
	ldr r3, _0206C8BC ; =DRIVER_WORK
	str r0, [r3, #0x10]
	str r1, [r3, #0x14]
	str r2, [r3, #0x18]
	ldr ip, [r3, #0x20]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	ldr r2, _0206C8C0 ; =_022B7340
	mov r3, r1
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0206C8BC: .word DRIVER_WORK
_0206C8C0: .word _022B7340
	arm_func_end Dse_SetError2

	arm_func_start DseUtil_ByteSwap32
DseUtil_ByteSwap32: ; 0x0206C8C4
	mov r3, r0, lsr #0x18
	mov r2, r0, lsr #8
	mov r1, r0, lsl #8
	mov r0, r0, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	and r1, r1, #0xff0000
	orr r1, r2, r1
	and r0, r0, #0xff000000
	orr r0, r1, r0
	bx lr
	arm_func_end DseUtil_ByteSwap32

	arm_func_start DseUtil_GetRandomNumber
DseUtil_GetRandomNumber: ; 0x0206C8F4
	ldr r1, _0206C914 ; =DRIVER_WORK
	ldr r0, _0206C918 ; =0x00007FFF
	ldr r2, [r1, #0x34]
	eor r2, r2, r2, lsl #17
	eor r2, r2, r2, asr #15
	str r2, [r1, #0x34]
	and r0, r2, r0
	bx lr
	.align 2, 0
_0206C914: .word DRIVER_WORK
_0206C918: .word 0x00007FFF
	arm_func_end DseUtil_GetRandomNumber

	arm_func_start DseMem_Init
DseMem_Init: ; 0x0206C91C
	mov ip, r1
	tst r0, #0xf
	bicne r0, r0, #0xf
	ldr r1, _0206C980 ; =DRIVER_WORK
	addne r0, r0, #0x10
	subne ip, ip, #0x10
	add r3, r0, ip
	str r0, [r1, #0x6f4]
	str r3, [r1, #0x6f8]
	str ip, [r1, #0x6fc]
	ldr r3, _0206C984 ; =0x74647373
	mov r1, #0x82
	str r3, [r0]
	strb r1, [r0, #4]
	mov r3, #0
	strb r3, [r0, #5]
	add r1, r0, #0x10
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	strb r3, [r0, #6]
	ldr r3, _0206C988 ; =_022B7A30
	ldmia r2, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, ip
	bx lr
	.align 2, 0
_0206C980: .word DRIVER_WORK
_0206C984: .word 0x74647373
_0206C988: .word _022B7A30
	arm_func_end DseMem_Init
