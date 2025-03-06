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
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
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
#ifdef JAPAN
	ldr sl, [r0, #0xa84]
#else
	ldr sl, [r0, #0xb28]
#endif
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
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
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
#ifdef JAPAN
	strb r0, [r8, #0x175]
#else
	strb r0, [r8, #0x179]
#endif
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
#ifdef JAPAN
	ldr r1, _022F6F84 ; =0x000008FF
	mov r0, sb
#else
	mov r0, sb
	mov r1, #0xbc0
#endif
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
#ifdef JAPAN
	add r0, r1, #0x224
#else
	add r0, r1, #0x228
#endif
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
#ifdef JAPAN
	ldrb r1, [r1, #0x20]
#else
	ldrb r1, [r1, #0xc4]
#endif
	bl TryTriggerMonsterHouse
_022F5978:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
#ifdef JAPAN
#define USE_THROWABLE_ITEM_OFFSET -0x2C1
#else
#define USE_THROWABLE_ITEM_OFFSET 0
#endif
_022F5980: .word 0x00000BAE + USE_THROWABLE_ITEM_OFFSET
_022F5984: .word 0x00000BBE + USE_THROWABLE_ITEM_OFFSET
_022F5988: .word 0x00000103
#ifdef JAPAN
_022F6F84: .word 0x000008FF
#endif
_022F598C: .word 0x00000BBF + USE_THROWABLE_ITEM_OFFSET
_022F5990: .word DUNGEON_PTR
	arm_func_end UseThrowableItem
