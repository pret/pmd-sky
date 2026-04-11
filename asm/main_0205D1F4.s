	.include "asm/macros.inc"
	.include "main_0205D1F4.inc"

	.text

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
