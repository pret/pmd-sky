	.include "asm/macros.inc"
	.include "overlay_29_022F52B0.inc"

	.text

	arm_func_start ov29_022F52B0
ov29_022F52B0: ; 0x022F52B0
	ldr ip, _022F52B8 ; =ov29_02343D30
	bx ip
	.align 2, 0
_022F52B8: .word ov29_02343D30
	arm_func_end ov29_022F52B0

	arm_func_start ov29_022F52BC
ov29_022F52BC: ; 0x022F52BC
	ldr ip, _022F52C8 ; =UseSingleUseItem
	mov r1, r0
	bx ip
	.align 2, 0
_022F52C8: .word UseSingleUseItem
	arm_func_end ov29_022F52BC

	arm_func_start UseSingleUseItemWrapper
UseSingleUseItemWrapper: ; 0x022F52CC
	ldr r2, [r0, #0xb4]
	ldr r1, _022F52F0 ; =DUNGEON_PTR
	ldrb r2, [r2, #0x54]
	ldr r1, [r1]
	ldr ip, _022F52F4 ; =UseSingleUseItem
	add r1, r1, r2, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28]
	bx ip
	.align 2, 0
_022F52F0: .word DUNGEON_PTR
_022F52F4: .word UseSingleUseItem
	arm_func_end UseSingleUseItemWrapper

	arm_func_start UseSingleUseItem
UseSingleUseItem: ; 0x022F52F8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r8, r1
	mov sb, r0
	mov r0, r8
	ldr r5, [r8, #0xb4]
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	beq _022F5334
	mov r0, r8
	bl LogItemBlockedByEmbargo
	mov r0, #0x14
	mov r1, #9
	bl ov29_022EA370
	b _022F54B0
_022F5334:
	mov r0, sb
	bl ov29_022F3B8C
	mov r0, sb
	mov r1, #0
	mov r2, #8
	bl GetItemToUse
	mov r4, r0
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	bl ov29_0234B034
	mov r2, r5
	mov r1, #0
	str r1, [sp]
	mov r3, r1
	bl ov29_0230040C
	mov r0, r8
	mov r1, r4
	bl CanMonsterUseItem
	cmp r0, #0
	beq _022F54B0
	mov r0, r4
	bl ov29_022EB378
	mov r1, r0
	mov r0, r8
	bl LogMessageByIdWithPopupCheckUser
	ldrh r2, [r4]
	mov r0, sb
	mov r1, #0
	strh r2, [sp, #8]
	ldrh r3, [r4, #2]
	mov r2, #0x66
	strh r3, [sp, #0xa]
	ldrh r3, [r4, #4]
	strh r3, [sp, #0xc]
	bl RemoveUsedItem
	mov r0, #0x1e
	mov r1, #0x11
	bl ov29_022EA370
	mov r0, #0
	str r8, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r8
	bl ApplyItemEffect
	mov r0, r8
	bl EntityIsValid__022F528C
	cmp r0, #0
	ldrne r0, [r8, #0xb4]
	ldrneb r0, [r0, #7]
	cmpne r0, #0
	beq _022F5498
	mov r0, r8
	mov r1, #0x33
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022F5498
	ldrsh r0, [sp, #0xc]
	bl ov29_02347000
	cmp r0, #0
	beq _022F5498
	mov r7, #0
	ldr r4, _022F54B8 ; =DUNGEON_PTR
	add r6, sp, #8
	mov r5, r7
_022F5440:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
	ldr sl, [r0, #0xb28]
	cmp sl, r8
	beq _022F5484
	mov r0, sl
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F5484
	str sl, [sp]
	mov r0, r5
	mov r1, r5
	mov r2, r5
	mov r3, r8
	str r6, [sp, #4]
	bl ApplyItemEffect
_022F5484:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _022F5440
_022F5498:
	ldr r1, _022F54B8 ; =DUNGEON_PTR
	mov r0, sb
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc4]
	bl TryTriggerMonsterHouse
_022F54B0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F54B8: .word DUNGEON_PTR
	arm_func_end UseSingleUseItem

	arm_func_start UseThrowableItem
UseThrowableItem: ; 0x022F54BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	mov sb, r0
	ldr r8, [sb, #0xb4]
	bl ov29_022F3B8C
	mov r0, sb
	mov r1, #0
	mov r2, #9
	bl GetItemToUse
	mov r4, r0
	mov r0, sb
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	beq _022F550C
	mov r0, sb
	bl LogItemBlockedByEmbargo
	mov r0, #0x14
	mov r1, #9
	bl ov29_022EA370
	b _022F5978
_022F550C:
	ldrb r0, [r8, #0x4e]
	cmp r0, #0x81
	bne _022F5558
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F5558
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _022F5980 ; =0x00000BAE
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x14
	mov r1, #0x4c
	bl ov29_022EA370
	b _022F5978
_022F5558:
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _022F5578
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _022F55B8
_022F5578:
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _022F55B8
	mov r1, r4
	mov r0, #0
	bl ov29_02344B44
	ldr r1, _022F5980 ; =0x00000BAE
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x14
	mov r1, #0x4c
	bl ov29_022EA370
	b _022F5978
_022F55B8:
	mov r0, sb
	mov r1, #1
	bl ShouldMonsterRunAwayVariation
	cmp r0, #0
	beq _022F55E8
	ldr r1, _022F5984 ; =0x00000BBE
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	mov r0, #0x14
	mov r1, #0x4c
	bl ov29_022EA370
	b _022F5978
_022F55E8:
	ldrh r0, [r4]
	mov r2, #0
	add r1, sp, #0xc
	strh r0, [sp, #0xc]
	ldrh r5, [r4, #2]
	ldrb r3, [sp, #0xc]
	mov r0, sb
	strh r5, [sp, #0xe]
	ldrh r5, [r4, #4]
	bic r3, r3, #0x10
	strh r5, [sp, #0x10]
	strb r3, [sp, #0xc]
	strb r2, [sp, #0xd]
	bl ov29_0230F9A4
	ldrb r0, [r8, #0x4e]
	cmp r0, #0x80
	bne _022F563C
	add r0, r8, #0x50
	mov r1, #1
	mov r4, #0
	bl RemoveGroundItem
_022F563C:
	ldrsh r0, [sp, #0x10]
	mov r5, #1
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _022F5660
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _022F566C
_022F5660:
	ldrh r0, [sp, #0xe]
	cmp r0, #1
	movhi r5, #0
_022F566C:
	cmp r5, #0
	ldrb r0, [r8, #0x4e]
	beq _022F56A8
	cmp r0, #0x80
	beq _022F56F4
	mov r0, r4
	bl ov29_02346FB8
	cmp r0, #0
	blt _022F5698
	mov r0, r4
	bl RemoveEquivItemNoHole
_022F5698:
	mov r0, r4
	bl ItemZInit
	bl RemoveEmptyItemsInBagWrapper
	b _022F56F4
_022F56A8:
	cmp r0, #0x80
	bne _022F56D0
	ldrh r2, [sp, #0xe]
	add r1, sp, #0xc
	add r0, r8, #0x50
	sub r3, r2, #1
	mov r2, #1
	strh r3, [sp, #0xe]
	bl SpawnItem
	b _022F56F4
_022F56D0:
	mov r0, r4
	bl ov29_02346FB8
	cmp r0, #0
	blt _022F56E8
	mov r0, r4
	bl DecrementStackItem
_022F56E8:
	ldrh r0, [r4, #2]
	sub r0, r0, #1
	strh r0, [r4, #2]
_022F56F4:
	mov r0, sb
	mov r1, #0x30
	bl ItemIsActive__022F5994
	cmp r0, #0
	beq _022F5714
	mov r0, #8
	bl DungeonRandInt
	strb r0, [r8, #0x4c]
_022F5714:
	mov r0, sb
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	beq _022F577C
	ldr r1, _022F5988 ; =0x00000103
	mov r0, sb
	ldrb r7, [r8, #0x4c]
	bl ov29_022E56A0
	mov r6, #0
	mov r5, r6
	mov r4, #2
	mov sl, #0x15
_022F5744:
	sub r0, r7, #1
	and r7, r0, #7
	mov r0, sb
	mov r1, r5
	mov r2, r7
	bl ChangeMonsterAnimation
	mov r0, r4
	mov r1, sl
	bl ov29_022EA370
	add r6, r6, #1
	cmp r6, #8
	blt _022F5744
	mov r0, #4
	strb r0, [r8, #0x179]
_022F577C:
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _022F579C
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _022F57A4
_022F579C:
	mov r0, #1
	strh r0, [sp, #0xe]
_022F57A4:
	add r1, sp, #0xc
	mov r0, #0
	bl ov29_02344B70
	bl ov29_0234B034
	mov r1, #0
	mov r2, r8
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	cmp r0, #0
	bne _022F57E8
	mov r0, sb
	mov r1, #0xbc0
	bl LogMessageByIdWithPopupCheckUser
	b _022F57F4
_022F57E8:
	ldr r1, _022F598C ; =0x00000BBF
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
_022F57F4:
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	mov r1, r0
	mov r0, sb
	bl ov29_022E5728
	mov r0, sb
	mov r1, #0x2e
	bl ItemIsActive__022F5994
	cmp r0, #0
	movne r0, #1
	strneb r0, [sp, #9]
	moveq r0, #0
	streqb r0, [sp, #9]
	ldrb r0, [r8, #0xee]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022F5880
_022F5838: ; jump table
	b _022F5848 ; case 0
	b _022F585C ; case 1
	b _022F5870 ; case 2
	b _022F5880 ; case 3
_022F5848:
	mov r1, #0
	mov r0, #0xa
	strb r1, [sp, #8]
	strh r0, [sp, #0xa]
	b _022F5880
_022F585C:
	mov r1, #0
	mov r0, #0x63
	strb r1, [sp, #8]
	strh r0, [sp, #0xa]
	b _022F5880
_022F5870:
	mov r1, #1
	mov r0, #0x63
	strb r1, [sp, #8]
	strh r0, [sp, #0xa]
_022F5880:
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #6]
	cmp r0, #0
	movne r0, #0
	bne _022F58A0
	add r0, r1, #0x228
	mov r1, #0x24
	bl ExclusiveItemEffectFlagTest
_022F58A0:
	cmp r0, #0
	movne r1, #0
	movne r0, #0x63
	strneb r1, [sp, #8]
	strneh r0, [sp, #0xa]
	mov r0, sb
	mov r1, #0x16
	bl ItemIsActive__022F5994
	cmp r0, #0
	bne _022F58DC
	mov r0, sb
	mov r1, #0x42
	bl IqSkillIsEnabled
	cmp r0, #0
	beq _022F58EC
_022F58DC:
	mov r1, #1
	mov r0, #0x63
	strb r1, [sp, #8]
	strh r0, [sp, #0xa]
_022F58EC:
	ldrsh r0, [sp, #0x10]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _022F5928
	add r0, sp, #4
	mov r1, sb
	bl ov29_022E9A9C
	add r4, sp, #8
	add r1, sp, #0xc
	add r3, sp, #4
	mov r0, sb
	add r2, sb, #4
	str r4, [sp]
	bl ov29_02347BC8
	b _022F5944
_022F5928:
	add r0, sp, #8
	str r0, [sp]
	ldrb r3, [r8, #0x4c]
	add r1, sp, #0xc
	mov r0, sb
	add r2, sb, #4
	bl ov29_02347518
_022F5944:
	mov r0, sb
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F5978
	ldrb r1, [r8, #0x4c]
	mov r0, sb
	bl ov29_02304A48
	ldr r1, _022F5990 ; =DUNGEON_PTR
	mov r0, sb
	ldr r1, [r1]
	add r1, r1, #0x4000
	ldrb r1, [r1, #0xc4]
	bl TryTriggerMonsterHouse
_022F5978:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F5980: .word 0x00000BAE
_022F5984: .word 0x00000BBE
_022F5988: .word 0x00000103
_022F598C: .word 0x00000BBF
_022F5990: .word DUNGEON_PTR
	arm_func_end UseThrowableItem

	arm_func_start ItemIsActive__022F5994
ItemIsActive__022F5994: ; 0x022F5994
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x6f
	mov r5, r0
	bl AbilityIsActiveVeneer
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl HasHeldItem
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ItemIsActive__022F5994

	arm_func_start ov29_022F59C4
ov29_022F59C4: ; 0x022F59C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022F87C0
	movs r1, r0
	moveq r1, #0
	beq _022F59FC
	ldr r0, [r1]
	cmp r0, #1
	movne r1, #0
	bne _022F59FC
	ldr r0, [r4, #0xb4]
	ldrb r0, [r0, #6]
	cmp r0, #0
	movne r1, #0
_022F59FC:
	mov r0, r4
	mvn r2, #0
	bl ov29_022F5A40
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022F59C4

	arm_func_start ov29_022F5A0C
ov29_022F5A0C: ; 0x022F5A0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	ldr r1, _022F5A3C ; =DUNGEON_PTR
	ldrb r3, [r4, #4]
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28]
	bl ov29_022F5A40
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5A3C: .word DUNGEON_PTR
	arm_func_end ov29_022F5A0C

	arm_func_start ov29_022F5A40
ov29_022F5A40: ; 0x022F5A40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov r6, r0
	movs sl, r1
	mov r5, r2
	ldr r8, [r6, #0xb4]
	bne _022F5A70
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5A70:
	bl ov29_023009CC
	cmp r0, #0
	bne _022F5A90
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5A90:
	ldr r0, [sl, #0xb4]
	ldrb r0, [r0, #0xbc]
	bl IsSecretBazaarNpcBehavior
	movs r4, r0
	bne _022F5ADC
	mov r0, r6
	mov r1, sl
	mov r2, #1
	mov r3, #0
	bl ov29_0230175C
	cmp r0, #1
	beq _022F5D84
	mov r0, sl
	mov r1, r6
	mov r2, #1
	mov r3, #0
	bl ov29_0230175C
	cmp r0, #1
	beq _022F5D84
_022F5ADC:
	ldr sb, [sl, #0xb4]
	bl ov29_0234B034
	mov r1, #0
	mov r2, sb
	mov r3, r1
	str r1, [sp]
	bl ov29_0230040C
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	mov r1, #1
	mov r2, sb
	mov r3, #7
	bl ov29_0230040C
	mov r0, #3
	bl ov29_02348C64
	mov r0, r6
	mov r1, sl
	bl ov29_02307BDC
	mov r0, sl
	bl ov29_023009CC
	cmp r0, #0
	beq _022F5B4C
	mov r0, sl
	mov r1, #1
	bl ov29_02300818
	cmp r0, #0
	beq _022F5B78
_022F5B4C:
	add r0, r6, #4
	add r1, sl, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r6
	bl ov29_02304AFC
	ldr r1, _022F5DA0 ; =0x00000BC2
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5B78:
	add r0, r6, #4
	add r1, sl, #4
	bl GetDirectionTowardsPosition
	mov r1, r0
	mov r0, r6
	bl ov29_02304AFC
	cmp r5, #0
	blt _022F5BA8
	mov r0, sl
	mov r1, r5
	bl ov29_02304AFC
	b _022F5BB8
_022F5BA8:
	ldrb r1, [r8, #0x4c]
	mov r0, sl
	add r1, r1, #4
	bl ov29_02304AFC
_022F5BB8:
	cmp r4, #0
	beq _022F5BD0
	mov r0, r6
	mov r1, sl
	bl ov29_02344544
	b _022F5D94
_022F5BD0:
	ldrb r0, [sb, #9]
	cmp r0, #1
	bne _022F5BE4
	bl ov29_022F6748
	b _022F5D94
_022F5BE4:
	ldrb r0, [sb, #0xbc]
	cmp r0, #7
	bne _022F5C3C
	ldr r0, _022F5DA4 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022F5C18
	ldr r1, _022F5DA8 ; =0x00000BC3
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022F5D94
_022F5C18:
	bl GetMissionDestination
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	mov r0, sl
	beq _022F5C34
	bl ov29_0234A5E4
	b _022F5D94
_022F5C34:
	bl ov29_0234A2D4
	b _022F5D94
_022F5C3C:
	ldrsh r2, [sb, #0x12]
	ldrsh r1, [sb, #0x16]
	ldr r0, _022F5DAC ; =0x000003E7
	add r1, r2, r1
	cmp r1, r0
	movgt r1, r0
	mov r0, r1, lsl #3
	mov r1, #0xa
	bl _s32_div_f
	ldrsh r1, [sb, #0x10]
	cmp r1, r0
	movge r4, #0
	bge _022F5C84
	mov r0, sl
	bl HasLowHealth
	cmp r0, #0
	moveq r4, #1
	movne r4, #2
_022F5C84:
	bl sub_02025888
	ldrb r1, [sb, #0x48]
	mov r5, r0
	cmp r1, #0xd6
	bne _022F5CA4
	ldr r1, _022F5DB0 ; =0x0000025E
	bl GetStringFromFileVeneer
	b _022F5D3C
_022F5CA4:
	mov r0, sl
	mov r6, #0x14
	bl ov29_0231AE3C
	str r0, [sp, #4]
	ldr r0, _022F5DB4 ; =0x000004D3
	sub fp, r0, #0x1b
_022F5CBC:
	mov r0, sb
	bl GetPersonalityIndex
	mov r7, r0
	cmp r7, fp
	ldrne r0, _022F5DB4 ; =0x000004D3
	cmpne r7, r0
	moveq r2, #0
	beq _022F5CE8
	ldrb r0, [r8, #0x48]
	bl ov29_0234CFA0
	mov r2, r0
_022F5CE8:
	mov r0, r7
	mov r1, r4
	bl GetTalkLine
	mov r1, r0
	mov r0, r5
	bl GetStringFromFileVeneer
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _022F5D3C
	ldr r1, _022F5DB8 ; =ov29_02352750
	mov r0, r5
	bl sub_02020880
	cmp r0, #0
	beq _022F5D3C
	subs r6, r6, #1
	bne _022F5D34
	ldr r1, _022F5DBC ; =ov29_02352758
	mov r0, r5
	bl strcpy
_022F5D34:
	cmp r6, #0
	bne _022F5CBC
_022F5D3C:
	ldrb r0, [sb, #0x48]
	cmp r0, #0xd7
	bne _022F5D5C
	mov r0, sl
	bl HasLowHealth
	cmp r0, #0
	movne r2, #2
	bne _022F5D60
_022F5D5C:
	mov r2, #0
_022F5D60:
	ldrsh r1, [sb, #4]
	add r0, sp, #8
	bl InitPortraitDungeon
	add r1, sp, #8
	mov r0, sl
	mov r2, r5
	mov r3, #1
	bl ov29_0234D304
	b _022F5D94
_022F5D84:
	ldr r1, _022F5D9C ; =0x00000BC1
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022F5D94:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F5D9C: .word 0x00000BC1
_022F5DA0: .word 0x00000BC2
_022F5DA4: .word DUNGEON_PTR
_022F5DA8: .word 0x00000BC3
_022F5DAC: .word 0x000003E7
_022F5DB0: .word 0x0000025E
_022F5DB4: .word 0x000004D3
_022F5DB8: .word ov29_02352750
_022F5DBC: .word ov29_02352758
	arm_func_end ov29_022F5A40

	arm_func_start ov29_022F5DC0
ov29_022F5DC0: ; 0x022F5DC0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetLeader
	ldr r1, _022F5DF0 ; =DUNGEON_PTR
	ldrb r3, [r4, #4]
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb28]
	bl ov29_022F5DF4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5DF0: .word DUNGEON_PTR
	arm_func_end ov29_022F5DC0

	arm_func_start ov29_022F5DF4
ov29_022F5DF4: ; 0x022F5DF4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	movs r7, r1
	ldr r4, [r7, #0xb4]
	mov r0, #0
	bne _022F5E1C
	ldr r1, _022F5F0C ; =0x00000BC4
	mov r2, #1
	bl DisplayMessage2
	b _022F5F04
_022F5E1C:
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldrsh r0, [r4, #0xc]
	ldr r5, _022F5F10 ; =0x00000BC5
	cmp r0, #0
	add r6, r5, #4
	blt _022F5E84
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov r4, r0
	ldrsh r0, [r4, #8]
	bl CheckTeamMemberIdxVeneer
	cmp r0, #0
	addne r5, r5, #3
	addne r6, r5, #3
	bne _022F5E84
	ldrsh r0, [r4, #8]
	bl IsMonsterIdInNormalRangeVeneer
	cmp r0, #0
	beq _022F5E84
	bl IsMarowakTrainingMaze
	cmp r0, #0
	addne r5, r5, #2
	ldr r6, _022F5F14 ; =0x00000BCA
	addeq r5, r5, #1
_022F5E84:
	mov r2, #1
	mov r1, r5
	mov r3, r2
	mov r0, #0
	str r2, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _022F5F04
	mov r0, #0
	bl ov29_0233A248
	mov r0, #0
	bl sub_02024FB8
	mov r1, r0
	add r0, sp, #4
	mov r2, #0x40
	bl strncpy
	mov r0, r7
	bl ov29_022E690C
	mov r0, r7
	mov r1, #0x25c
	mov r2, #0
	bl HandleFaint
#ifndef EUROPE
	bl UpdateMapSurveyorFlag
#endif
	bl ov29_022E8104
	bl ov29_022E81F8
	mov r0, #0
	add r1, sp, #4
	bl ov29_0234B0B4
	mov r1, r6
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_022F5F04:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F5F0C: .word 0x00000BC4
_022F5F10: .word 0x00000BC5
_022F5F14: .word 0x00000BCA
	arm_func_end ov29_022F5DF4

	arm_func_start ov29_022F5F18
ov29_022F5F18: ; 0x022F5F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov sb, r0
	mov r7, #0
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F5F88
	ldr r0, _022F6050 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda]
	bl AreMovesEnabled
	cmp r0, #0
	bne _022F5F60
	ldr r1, _022F6054 ; =0x00000DFD
	mov r0, sb
	bl LogMessageByIdWithPopupCheckUser
	b _022F6048
_022F5F60:
	ldr r4, [sb, #0xb4]
	mov r1, r7
	mov r0, sb
	strb r1, [r4, #0x23f]
	bl ShouldUsePp
	cmp r0, #0
	movne r7, #1
	strneb r7, [r4, #0x23f]
	mov r0, #0
	strb r0, [r4, #0x23e]
_022F5F88:
	mov r6, #0
	mov r4, #1
	mov r5, r6
	mov sl, r4
	b _022F5FD8
_022F5F9C:
	ldr r8, [sb, #0xb4]
	mov r0, sb
	str r5, [sp]
	ldrb r1, [r8, #0x54]
	mov r2, r4
	mov r3, r5
	bl ov29_0232145C
	bl IsFloorOver
	cmp r0, #0
	ldreqb r0, [r8, #0x23e]
	cmpeq r0, #0
	ldreqb r0, [r8, #0x163]
	cmpeq r0, #0
	bne _022F5FEC
	add r6, r6, #1
_022F5FD8:
	mov r0, sb
	mov r1, sl
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _022F5F9C
_022F5FEC:
	mov r0, sb
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6014
	cmp r7, #0
	moveq r1, #1
	movne r1, #0
	mov r0, sb
	and r1, r1, #0xff
	bl UpdateMovePp
_022F6014:
	bl IsFloorOver
	cmp r0, #0
	bne _022F6048
	mov r0, sb
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6040
	ldr r1, [sb, #0xb4]
	mov r0, sb
	ldrb r1, [r1, #0x54]
	bl ov29_022FA574
_022F6040:
	mov r0, sb
	bl TryActivateTruant
_022F6048:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F6050: .word DUNGEON_PTR
_022F6054: .word 0x00000DFD
	arm_func_end ov29_022F5F18

	arm_func_start ov29_022F6058
ov29_022F6058: ; 0x022F6058
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	ldr r7, [sl, #0xb4]
	ldr r2, _022F61F8 ; =ov29_0237CA80
	mov r3, #0
	add r0, sp, #0xc
	str r3, [r2]
	mov sb, r1
	bl InitMove
	ldrb r0, [r7, #0xd0]
	cmp r0, #1
	bne _022F60AC
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022F61FC ; =0x00000BCC
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F61F0
_022F60AC:
	ldrb r0, [r7, #0xbf]
	cmp r0, #4
	bne _022F60D8
	mov r0, #0
	mov r1, sl
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, _022F6200 ; =0x00000BCD
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
	b _022F61F0
_022F60D8:
	mov r6, #0
	cmp sb, #0x160
	moveq r8, #1
	movne r8, #0
	strb r6, [r7, #0x163]
	mov fp, r6
	mov r5, #0xa
	add r4, sp, #0xc
	b _022F6154
_022F60FC:
	mov r0, sl
	bl ov29_022F3B8C
	str fp, [r7, #0x18c]
	ldrb r1, [sp, #0xc]
	strb r5, [sp, #0x12]
	mov r0, sl
	orr r1, r1, #0xc
	strb r1, [sp, #0xc]
	str fp, [sp]
	mov r1, r8
	mov r2, fp
	mov r3, fp
	str r4, [sp, #4]
	bl ov29_02322374
	mov r0, sl
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F6168
	ldrb r0, [r7, #0x163]
	cmp r0, #0
	bne _022F6168
	add r6, r6, #1
_022F6154:
	mov r0, sl
	mov r1, #1
	bl GetNumberOfAttacks
	cmp r6, r0
	blt _022F60FC
_022F6168:
	mov r0, sl
	bl EntityIsValid__022F528C
	cmp r0, #0
	beq _022F61F0
	cmp sb, #0x160
	ldreq r0, _022F61F8 ; =ov29_0237CA80
	ldreq r0, [r0]
	cmpeq r0, #0
	bne _022F6198
	ldr r1, _022F6204 ; =0x00000BCE
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_022F6198:
	ldrb r0, [r7, #7]
	cmp r0, #0
	cmpne sb, #0x160
	beq _022F61E8
	ldrb r1, [r7, #0x4c]
	ldr r0, _022F6208 ; =DIRECTIONS_XY
	ldrsh r3, [sl, #4]
	mov r1, r1, lsl #2
	ldrsh r2, [r0, r1]
	ldr r1, _022F620C ; =ov29_0235171E
	add r0, sp, #8
	add r2, r3, r2
	strh r2, [sp, #8]
	ldrb r2, [r7, #0x4c]
	ldrsh r3, [sl, #6]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	strh r1, [sp, #0xa]
	bl ov29_02338430
_022F61E8:
	mov r0, sl
	bl EnemyEvolution
_022F61F0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F61F8: .word ov29_0237CA80
_022F61FC: .word 0x00000BCC
_022F6200: .word 0x00000BCD
_022F6204: .word 0x00000BCE
_022F6208: .word DIRECTIONS_XY
_022F620C: .word ov29_0235171E
	arm_func_end ov29_022F6058

	arm_func_start ov29_022F6210
ov29_022F6210: ; 0x022F6210
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	bl EntityIsValid__022F62A8
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, #0
	ldr r7, _022F62A4 ; =DUNGEON_PTR
	b _022F6294
_022F6234:
	ldr r0, [r7]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb38]
	mov r0, r5
	bl EntityIsValid__022F62A8
	cmp r0, #0
	beq _022F6288
	ldr r0, [r5, #0xb4]
	ldrb r0, [r0, #9]
	cmp r0, #1
	bne _022F6288
	mov r0, r5
	bl ov29_023009CC
	cmp r0, #0
	beq _022F6288
	ldrb r1, [r6, #0x25]
	ldrb r0, [r5, #0x25]
	cmp r1, r0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_022F6288:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_022F6294:
	cmp r4, #0x10
	blt _022F6234
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F62A4: .word DUNGEON_PTR
	arm_func_end ov29_022F6210
