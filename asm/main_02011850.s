	.include "asm/macros.inc"
	.include "main_02011850.inc"

	.text

	arm_func_start ApplyGravelyrockBoostToGroundMonster
ApplyGravelyrockBoostToGroundMonster: ; 0x02011850
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldrsh r4, [r6, #8]
	bl IsMonsterAffectedByGravelyrockGroundMode
	cmp r0, #0
	beq _02011884
	add r0, r6, #8
	mov r1, #0xa
	bl ModifyIqStat
	cmp r5, #0
	movne r0, #0xa
	b _0201188C
_02011884:
	cmp r5, #0
	movne r0, #0
_0201188C:
	strne r0, [r5]
	ldrsh r0, [r6, #8]
	sub r0, r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ApplyGravelyrockBoostToGroundMonster

	arm_func_start ApplyGummiBoostsGroundMode
ApplyGummiBoostsGroundMode: ; 0x0201189C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrsh r0, [sp, #0x28]
	mov r4, #0
	ldr r6, [sp, #0x30]
	sub r5, r4, #1
	strh r5, [r6]
	mov sb, r1
	mov r8, r2
	mov r7, r3
	sub fp, r0, #0x77
	strh r4, [r6, #2]
	bl IsGummi
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsh r0, [sp, #0x28]
	cmp r0, #0x88
	bne _020118FC
	ldr r1, _02011AA0 ; =WONDER_GUMMI_IQ_GAIN
	ldr r0, _02011AA4 ; =WONDER_GUMMI_STAT_BOOST
	ldrsh r1, [r1]
	ldrsh r5, [r0]
	add r4, r4, r1
	b _02011950
_020118FC:
	ldrsh r0, [sl]
	ldr r2, _02011AA8 ; =GUMMI_STAT_BOOST
	mov r1, r4
	ldrsh r5, [r2]
	bl GetType
	str r0, [sp]
	ldrsh r0, [sl]
	mov r1, #1
	bl GetType
	add sl, fp, #1
	ldr fp, _02011AAC ; =IQ_GUMMI_GAIN_TABLE
	ldr r1, [sp]
	mov r2, #0x24
	mla r3, r1, r2, fp
	mla r1, r0, r2, fp
	mov sl, sl, lsl #1
	ldrsh r2, [sl, r3]
	ldrsh r0, [sl, r1]
	cmp r2, r0
	addgt r4, r4, r2
	addle r4, r4, r0
_02011950:
	ldrsh r1, [sb]
	add r0, r1, r4
	strh r0, [sb]
	ldrsh r0, [sb]
	cmp r0, #1
	sub r2, r0, r1
	movlt r0, #1
	strlth r0, [sb]
	ldrsh r1, [sb]
	ldr r0, _02011AB0 ; =0x000003E7
	cmp r1, r0
	strgth r0, [sb]
	cmp r2, #9
	movge r1, #0
	bge _020119A4
	cmp r2, #5
	movge r1, #1
	bge _020119A4
	cmp r2, #3
	movge r1, #2
	movlt r1, #3
_020119A4:
	ldrb r0, [sp, #0x2c]
	strh r1, [r6]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r1, #0
	bne _020119D4
	mov r0, #0x10
	bl RandIntSafe
	cmp r0, #0xa
	moveq r0, #0xf
	streqh r0, [r6, #2]
	beq _020119EC
_020119D4:
	mov r0, #4
	bl RandIntSafe
	ldr r1, _02011AB4 ; =_0209889C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	strh r0, [r6, #2]
_020119EC:
	ldrh r1, [r6, #2]
	tst r1, #1
	beq _02011A18
	ldrb r0, [r8]
	cmp r0, #0xff
	bichs r0, r1, #1
	strhsh r0, [r6, #2]
	bhs _02011A18
	mov r0, r8
	mov r1, r5
	bl ModifyOffensiveStat
_02011A18:
	ldrh r1, [r6, #2]
	tst r1, #2
	beq _02011A44
	ldrb r0, [r8, #1]
	cmp r0, #0xff
	bichs r0, r1, #2
	strhsh r0, [r6, #2]
	bhs _02011A44
	mov r1, r5
	add r0, r8, #1
	bl ModifyOffensiveStat
_02011A44:
	ldrh r1, [r6, #2]
	tst r1, #4
	beq _02011A70
	ldrb r0, [r7]
	cmp r0, #0xff
	bichs r0, r1, #4
	strhsh r0, [r6, #2]
	bhs _02011A70
	mov r0, r7
	mov r1, r5
	bl ModifyDefensiveStat
_02011A70:
	ldrh r1, [r6, #2]
	tst r1, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [r7, #1]
	cmp r0, #0xff
	bichs r0, r1, #8
	strhsh r0, [r6, #2]
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, r5
	add r0, r7, #1
	bl ModifyDefensiveStat
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011AA0: .word WONDER_GUMMI_IQ_GAIN
_02011AA4: .word WONDER_GUMMI_STAT_BOOST
_02011AA8: .word GUMMI_STAT_BOOST
_02011AAC: .word IQ_GUMMI_GAIN_TABLE
_02011AB0: .word 0x000003E7
_02011AB4: .word _0209889C
	arm_func_end ApplyGummiBoostsGroundMode

	arm_func_start WipeRecycleShopRecords
WipeRecycleShopRecords: ; 0x02011AB8
	stmdb sp!, {r3, lr}
	ldr ip, _02011B38 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [ip]
	mov r2, r0
	add r1, r1, #0x1000
	strb r0, [r1, #0x3aa]
	ldr r1, [ip]
	sub lr, r0, #1
	add r1, r1, #0x1000
	str r0, [r1, #0x3ac]
	ldr r3, [ip]
	mov r1, #0x6d
	add r3, r3, #0x1300
	strh r0, [r3, #0xb0]
	ldr r3, [ip]
	add r3, r3, #0x1300
	strh lr, [r3, #0xb2]
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6b
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6c
	bl SaveScriptVariableValue
	mov r0, #0
	mov r2, r0
	mov r1, #0x6a
	bl SaveScriptVariableValue
	ldmia sp!, {r3, pc}
	.align 2, 0
_02011B38: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end WipeRecycleShopRecords

	arm_func_start sub_02011B3C
sub_02011B3C: ; 0x02011B3C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sl, r0
	mov r8, r1
	mov r7, r2
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov sb, r0
	mov r0, sl
	mov r1, r8
	mov r2, r7
	bl CountValidRecycleShopItems
	movs r1, r0
	str r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb]
	beq _02011CE8
	mov r0, #0x18
	mul r0, r1, r0
	mov r1, #6
	bl MemAlloc
	str r0, [sb]
	ldr r2, [sb, #4]
	mov r1, #0x18
	mul r1, r2, r1
	bl MemZero
	mov r5, #0
	mov r6, r5
	mov r4, #0x18
	b _02011BF8
_02011BB8:
	str r7, [sp]
	ldr r0, [sb]
	mov r1, r6
	mla r0, r5, r4, r0
	mov r2, sl
	mov r3, r8
	bl sub_0201297C
	cmp r0, #0
	beq _02011BEC
	ldr r0, [sb, #4]
	add r5, r5, #1
	cmp r5, r0
	beq _02011C00
_02011BEC:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_02011BF8:
	cmp r6, #0x18
	blt _02011BB8
_02011C00:
	mov r8, #0
	b _02011CDC
_02011C08:
	mov r0, #0x18
	mul sl, r8, r0
	ldr r0, [sb]
	mvn r6, #0
	ldr r0, [r0, sl]
	ldrsh r0, [r0]
	bl sub_0200D1F0
	mov fp, r0
	add r7, r8, #1
	b _02011C68
_02011C30:
	mov r0, #0x18
	mul r4, r7, r0
	ldr r5, [sb]
	ldr r0, [r5, r4]
	ldrsh r0, [r0]
	bl sub_0200D1F0
	cmp fp, r0
	ble _02011C64
	ldr r0, [r5, r4]
	mov r6, r7
	ldrsh r0, [r0]
	bl sub_0200D1F0
	mov fp, r0
_02011C64:
	add r7, r7, #1
_02011C68:
	ldr r0, [sb, #4]
	cmp r7, r0
	blt _02011C30
	mvn r0, #0
	cmp r6, r0
	beq _02011CD8
	ldr r4, [sb]
	mov r0, #0x18
	add fp, r4, sl
	mul r5, r6, r0
	add r7, sp, #4
	mov sl, fp
	mov r6, r7
	ldmia sl!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1}
	stmia r7, {r0, r1}
	add r4, r4, r5
	ldmia r4!, {r0, r1, r2, r3}
	stmia fp!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia fp, {r0, r1}
	ldr r4, [sb]
	ldmia r6!, {r0, r1, r2, r3}
	add r4, r4, r5
	stmia r4!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r4, {r0, r1}
_02011CD8:
	add r8, r8, #1
_02011CDC:
	ldr r0, [sb, #4]
	cmp r8, r0
	blt _02011C08
_02011CE8:
	mov r0, sb
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02011B3C

	arm_func_start sub_02011CF4
sub_02011CF4: ; 0x02011CF4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	cmp r0, #2
	bne _02011D90
	ldr r0, _02011D98 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r5, [r0, #0xb2]
	cmp r5, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov r4, r0
	mov r1, #1
	mov r0, #0x18
	smulbb r0, r1, r0
	str r1, [r4, #4]
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #0x18
	mul r1, r2, r1
	bl MemZero
	str r6, [sp]
	ldr r0, [r4]
	mov r1, r5
	mov r3, r7
	mov r2, #2
	bl sub_0201297C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02011D90:
	bl sub_02011B3C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011D98: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011CF4

	arm_func_start sub_02011D9C
sub_02011D9C: ; 0x02011D9C
	ldr ip, _02011DB0 ; =sub_02011B3C
	mov r1, r0
	ldr r2, _02011DB4 ; =0x000F423F
	mov r0, #1
	bx ip
	.align 2, 0
_02011DB0: .word sub_02011B3C
_02011DB4: .word 0x000F423F
	arm_func_end sub_02011D9C

	arm_func_start FreeRecycleOfferItems
FreeRecycleOfferItems: ; 0x02011DB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	cmp r0, #0
	beq _02011DDC
	bl MemFree
_02011DDC:
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end FreeRecycleOfferItems
