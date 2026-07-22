	.include "asm/macros.inc"
	.include "main_0206549C.inc"

	.text

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
	bl GetUnitNpcIds
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
	bl GetAdventureNpcIds
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
	ldr r2, _02065970 ; =SPECIAL_ACTORS
	sub r0, r1, #0xd
	ldrsh r1, [r2, #0xa]
	strh r1, [r5]
	b _0206595C
_0206582C:
	ldr r2, _02065970 ; =SPECIAL_ACTORS
	sub r0, r1, #0xd
	ldrsh r1, [r2, #4]
	strh r1, [r5]
	b _0206595C
_02065840:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0xc]
	cmp r0, #0
	strneh r0, [r5]
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065860:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0x10]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065880:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #0xe]
	strh r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658A0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #2]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658C0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_020658E0:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
	ldrsh r0, [r0, #8]
	strh r0, [r5]
	cmp r0, #0
	subeq r0, r1, #0xd
	streqh r0, [r6]
	mvn r0, #0
	b _0206595C
_02065900:
	ldr r0, _02065970 ; =SPECIAL_ACTORS
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
_02065970: .word SPECIAL_ACTORS
	arm_func_end sub_0206549C
