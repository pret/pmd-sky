	.include "asm/macros.inc"
	.include "main_02012294.inc"

	.text

	arm_func_start sub_02012294
sub_02012294: ; 0x02012294
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	mov r8, #0
	mov r4, r0
	mov r7, r8
	mov r6, r8
	bl CountNbOfItemsInStorage
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0
	ble _02012324
	mov r0, r5, lsl #2
	mov r1, #6
	bl MemAlloc
	mov sb, r6
	mov r8, r0
	mov sl, sb
	b _0201231C
_020122E8:
	mov r0, sb
	bl sub_02010044
	mov r1, fp
	bl RecycleShopIsTradableItem
	cmp r0, #0
	moveq r1, r6, lsl #2
	addeq r0, r8, r6, lsl #2
	streqh sb, [r8, r1]
	streqb sl, [r0, #2]
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	addeq r6, r6, #1
	mov sb, r0, asr #0x10
_0201231C:
	cmp sb, r5
	blt _020122E8
_02012324:
	mov r5, #0
	bl GetNbItemsInBag
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0
	ble _0201239C
	mov r0, sb, lsl #2
	mov r1, #6
	bl MemAlloc
	mov r7, r0
	mov sl, r5
	b _02012394
_02012354:
	mov r0, sl
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	mov r1, fp
	bl RecycleShopIsTradableItem
	cmp r0, #0
	bne _02012388
	mov r0, r5, lsl #2
	add r1, r7, r5, lsl #2
	strh sl, [r7, r0]
	mov r0, #0
	strb r0, [r1, #2]
	add r5, r5, #1
_02012388:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_02012394:
	cmp sl, sb
	blt _02012354
_0201239C:
	cmp r5, #0
	beq _020123B4
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #29
	adds r0, r1, r0, ror #29
	bne _020123BC
_020123B4:
	mov sb, #0
	b _020123C0
_020123BC:
	rsb sb, r0, #8
_020123C0:
	add r0, r5, r6
	adds r0, sb, r0
	str r0, [r4, #4]
	moveq r0, #0
	streq r0, [r4]
	beq _020124B0
	mov r0, r0, lsl #3
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov sl, #0
	mov r3, #1
	b _02012418
_020123F4:
	str r3, [r0]
	mov r1, sl, lsl #2
	ldrsh r2, [r8, r1]
	add r1, r8, sl, lsl #2
	add sl, sl, #1
	strh r2, [r0, #4]
	ldrb r1, [r1, #2]
	strb r1, [r0, #7]
	add r0, r0, #8
_02012418:
	cmp sl, r6
	blt _020123F4
	mov r6, #0
	mov r3, #2
	mvn r2, #0
	mov r1, r6
	b _02012448
_02012434:
	str r3, [r0]
	strh r2, [r0, #4]
	strb r1, [r0, #7]
	add r6, r6, #1
	add r0, r0, #8
_02012448:
	cmp r6, sb
	blt _02012434
	mov r6, #0
	mov r3, r6
	b _02012480
_0201245C:
	str r3, [r0]
	mov r1, r6, lsl #2
	ldrsh r2, [r7, r1]
	add r1, r7, r6, lsl #2
	add r6, r6, #1
	strh r2, [r0, #4]
	ldrb r1, [r1, #2]
	strb r1, [r0, #7]
	add r0, r0, #8
_02012480:
	cmp r6, r5
	blt _0201245C
	mov r3, #0
	ldr r2, [r4]
	mov r1, r3
	b _020124A4
_02012498:
	strb r1, [r2, #6]
	add r3, r3, #1
	add r2, r2, #8
_020124A4:
	ldr r0, [r4, #4]
	cmp r3, r0
	blt _02012498
_020124B0:
	cmp r7, #0
	beq _020124C0
	mov r0, r7
	bl MemFree
_020124C0:
	cmp r8, #0
	beq _020124D0
	mov r0, r8
	bl MemFree
_020124D0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02012294

	arm_func_start sub_020124D8
sub_020124D8: ; 0x020124D8
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _020124F8
	ldrsh r0, [r0, #4]
	bl GetItemAtIdx
	ldrsh r0, [r0, #4]
	ldmia sp!, {r3, pc}
_020124F8:
	cmp r1, #1
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	add r1, sp, #0
	bl ConvertStorageItemAtIdxToBulkItem
	ldrsh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020124D8

	arm_func_start sub_02012518
sub_02012518: ; 0x02012518
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _02012538
	ldrsh r0, [r0, #4]
	bl GetItemAtIdx
	ldrh r0, [r0, #2]
	ldmia sp!, {r3, pc}
_02012538:
	cmp r1, #1
	ldrne r0, _02012558 ; =0x0000FFFF
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	add r1, sp, #0
	bl ConvertStorageItemAtIdxToBulkItem
	ldrh r0, [sp, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012558: .word 0x0000FFFF
	arm_func_end sub_02012518

	arm_func_start sub_0201255C
sub_0201255C: ; 0x0201255C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #8
	mov r1, #6
	bl MemAlloc
	ldr r1, [r5, #4]
	mov r4, r0
	mov r0, r1, lsl #3
	mov r1, #6
	bl MemAlloc
	str r0, [r4]
	mov ip, #0
	b _020125B4
_02012590:
	ldr r1, [r5]
	ldr r3, [r4]
	add r0, r1, ip, lsl #3
	ldr r2, [r1, ip, lsl #3]
	ldr r1, [r0, #4]
	add r0, r3, ip, lsl #3
	str r2, [r3, ip, lsl #3]
	str r1, [r0, #4]
	add ip, ip, #1
_020125B4:
	ldr r1, [r5, #4]
	cmp ip, r1
	blt _02012590
	mov r0, r4
	str r1, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201255C

	arm_func_start sub_020125CC
sub_020125CC: ; 0x020125CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	bl MemFree
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020125CC

	arm_func_start RecycleShopIsNotThrownItem
RecycleShopIsNotThrownItem: ; 0x020125FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _02012620
	mov r0, r4
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _02012628
_02012620:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02012628:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end RecycleShopIsNotThrownItem

	arm_func_start RecycleShopIsTradableItem
RecycleShopIsTradableItem: ; 0x02012630
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _02012650
	bl IsTicketItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
_02012650:
	mov r0, r4
	bl RecycleShopIsNotThrownItem
	ldmia sp!, {r4, pc}
	arm_func_end RecycleShopIsTradableItem

	arm_func_start RecycleShopCountTradableItemsInBag
RecycleShopCountTradableItemsInBag: ; 0x0201265C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _020126C4 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r1, [r1]
	mov r5, r0
	ldr r8, [r1, #0x384]
	mov sb, r4
	mov r6, r4
	mov r7, #1
_02012680:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _020126AC
	ldrsh r0, [r8, #4]
	mov r1, r5
	bl RecycleShopIsTradableItem
	cmp r0, #0
	addeq r4, r4, #1
_020126AC:
	add sb, sb, #1
	cmp sb, #0x32
	add r8, r8, #6
	blt _02012680
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020126C4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RecycleShopCountTradableItemsInBag

	arm_func_start RecycleShopCountTradableItemsInStorage
RecycleShopCountTradableItemsInStorage: ; 0x020126C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	ldr r4, _02012718 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, r0
	mov r6, r5
_020126DC:
	ldr r0, [r4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _02012704
	mov r1, r7
	bl RecycleShopIsTradableItem
	cmp r0, #0
	addeq r5, r5, #1
_02012704:
	add r6, r6, #1
	cmp r6, #0x3e8
	blt _020126DC
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02012718: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RecycleShopCountTradableItemsInStorage

	arm_func_start sub_0201271C
sub_0201271C: ; 0x0201271C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldrsh r0, [sl, #0x14]
	ldr r6, [sl]
	mov r8, #0
	str r0, [sp]
	b _02012854
_0201273C:
	add r5, r6, #0x14
	mov r4, r8, lsl #2
	ldrsh r1, [r5, r4]
	add r0, sp, #4
	bl InitBulkItem
	add r1, r6, r8, lsl #2
	add r0, sl, r8, lsl #1
	ldrsh r7, [r1, #0x16]
	ldrsh fp, [r0, #0xc]
	mov sb, #0
	b _02012780
_02012768:
	add r0, sp, #4
	bl GetEquivBulkItemIdxInStorage
	bl RemoveItemAtIdxInStorage
	cmp r0, #0
	subne r7, r7, #1
	add sb, sb, #1
_02012780:
	cmp sb, fp
	bge _02012790
	cmp r7, #0
	bgt _02012768
_02012790:
	cmp r7, #0
	ble _020127CC
	add r0, sl, r8, lsl #1
	ldrsh fp, [r0, #4]
	mov sb, #0
	b _020127BC
_020127A8:
	ldrsh r0, [sp, #4]
	bl GetFirstUnequippedItemOfType
	bl RemoveItem
	sub r7, r7, #1
	add sb, sb, #1
_020127BC:
	cmp sb, fp
	bge _020127CC
	cmp r7, #0
	bgt _020127A8
_020127CC:
	ldrsh r0, [r5, r4]
	ldr r1, _02012870 ; =0x00000578
	cmp r0, r1
	bne _02012834
	ldrsh r0, [r6]
	bl IsTicketItem
	cmp r0, #0
	beq _02012810
	mov r0, #1
	bl RecycleShopCountTradableItemsInBag
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #1
	bl RecycleShopCountTradableItemsInStorage
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
	b _02012850
_02012810:
	mov r0, #0
	bl RecycleShopCountTradableItemsInBag
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl RecycleShopCountTradableItemsInStorage
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
	b _02012850
_02012834:
	bl CountNbItemsOfTypeInBag
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	ldrsh r0, [r5, r4]
	bl CountNbItemsOfTypeInStorage
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
_02012850:
	add r8, r8, #1
_02012854:
	ldr r0, [sp]
	cmp r8, r0
	blt _0201273C
	bl RemoveEmptyItemsInBag
	bl MaybeUpdateStorage
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012870: .word 0x00000578
	arm_func_end sub_0201271C

	arm_func_start sub_02012874
sub_02012874: ; 0x02012874
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, #0
	b _020128C4
_02012884:
	ldr r0, [r5]
	add r1, r0, r4, lsl #3
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _020128C0
	ldr r0, [r1]
	cmp r0, #0
	bne _020128B0
	ldrsh r0, [r1, #4]
	bl RemoveItem
	b _020128C0
_020128B0:
	cmp r0, #1
	bne _020128C0
	ldrsh r0, [r1, #4]
	bl RemoveItemAtIdxInStorage
_020128C0:
	add r4, r4, #1
_020128C4:
	ldr r0, [r5, #4]
	cmp r4, r0
	blt _02012884
	bl RemoveEmptyItemsInBag
	bl MaybeUpdateStorage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02012874

	arm_func_start CountValidRecycleShopItems
CountValidRecycleShopItems: ; 0x020128DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	mov fp, #0x24
	ldr r5, _02012950 ; =RECYCLE_SHOP_ITEM_LIST
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r6, r7
	mov r4, fp
_02012900:
	cmp sl, #3
	beq _02012920
	mla r0, r6, r4, r5
	ldr r1, [r0, #4]
	mov r0, sl
	bl IsRecycleTradeTypeValid
	cmp r0, #0
	beq _0201293C
_02012920:
	mla r1, r6, fp, r5
	ldrb r0, [r1, #8]
	cmp r0, sb
	bhi _0201293C
	ldr r0, [r1, #0xc]
	cmp r0, r8
	addle r7, r7, #1
_0201293C:
	add r6, r6, #1
	cmp r6, #0x18
	blt _02012900
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012950: .word RECYCLE_SHOP_ITEM_LIST
	arm_func_end CountValidRecycleShopItems

	arm_func_start IsRecycleTradeTypeValid
IsRecycleTradeTypeValid: ; 0x02012954
	cmp r0, r1
	beq _0201296C
	cmp r0, #0
	bne _02012974
	cmp r1, #2
	beq _02012974
_0201296C:
	mov r0, #1
	bx lr
_02012974:
	mov r0, #0
	bx lr
	arm_func_end IsRecycleTradeTypeValid

	arm_func_start sub_0201297C
sub_0201297C: ; 0x0201297C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	smulbb r4, r1, r4
	ldr r1, _02012AA4 ; =_020988D0
	mov sl, r0
	ldr r1, [r1, r4]
	mov r0, r2
	mov r5, r3
	bl IsRecycleTradeTypeValid
	cmp r0, #0
	beq _02012A9C
	ldr r0, _02012AA8 ; =_020988D4
	ldrb r0, [r0, r4]
	cmp r0, r5
	bhi _02012A9C
	ldr r1, _02012AAC ; =_020988D8
	ldr r0, [sp, #0x28]
	ldr r1, [r1, r4]
	cmp r1, r0
	bgt _02012A9C
	ldr r0, _02012AB0 ; =RECYCLE_SHOP_ITEM_LIST
	mov sb, #0
	add r0, r0, r4
	mov r6, #1
	str r0, [sl]
	mov fp, sb
	mov r5, r6
	ldr r4, _02012AB4 ; =0x00000578
	b _02012A88
_020129F0:
	ldr r1, [sl]
	mov r7, sb, lsl #2
	add r8, r1, #0x14
	ldrsh r0, [r8, r7]
	cmp r0, #0
	beq _02012A90
	cmp r0, r4
	bne _02012A68
	ldrsh r0, [r1]
	bl IsTicketItem
	cmp r0, #0
	beq _02012A44
	mov r0, r6
	bl RecycleShopCountTradableItemsInBag
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, r5
	bl RecycleShopCountTradableItemsInStorage
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
	b _02012A84
_02012A44:
	mov r0, fp
	bl RecycleShopCountTradableItemsInBag
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl RecycleShopCountTradableItemsInStorage
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
	b _02012A84
_02012A68:
	bl CountNbItemsOfTypeInBag
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	ldrsh r0, [r8, r7]
	bl CountNbItemsOfTypeInStorage
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
_02012A84:
	add sb, sb, #1
_02012A88:
	cmp sb, #4
	blt _020129F0
_02012A90:
	strh sb, [sl, #0x14]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02012A9C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02012AA4: .word _020988D0
_02012AA8: .word _020988D4
_02012AAC: .word _020988D8
_02012AB0: .word RECYCLE_SHOP_ITEM_LIST
_02012AB4: .word 0x00000578
	arm_func_end sub_0201297C

	arm_func_start ClearCroagunkItems
ClearCroagunkItems: ; 0x02012AB8
	mov r3, #0
	ldr r0, _02012ADC ; =_022A4BD8
	mov r2, r3
_02012AC4:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #8
	blt _02012AC4
	bx lr
	.align 2, 0
_02012ADC: .word _022A4BD8
	arm_func_end ClearCroagunkItems

	arm_func_start LoadSynthBin
LoadSynthBin: ; 0x02012AE0
	stmdb sp!, {r3, lr}
	ldr r0, _02012B28 ; =_020AF6D0
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02012B2C ; =SYNTH_BIN_FILE_PTR
	ldr r1, _02012B30 ; =_02098CB4
	mov r2, #0xe
	bl LoadFileFromRom
	ldr r1, _02012B28 ; =_020AF6D0
	mov r0, #1
	ldr r2, [r1, #4]
	str r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012B28: .word _020AF6D0
_02012B2C: .word SYNTH_BIN_FILE_PTR
_02012B30: .word _02098CB4
	arm_func_end LoadSynthBin

	arm_func_start CloseSynthBin
CloseSynthBin: ; 0x02012B34
	stmdb sp!, {r3, lr}
	ldr r0, _02012B74 ; =_020AF6D0
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, pc}
	ldr r0, _02012B78 ; =SYNTH_BIN_FILE_PTR
	bl UnloadFile
	ldr r0, _02012B74 ; =_020AF6D0
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012B74: .word _020AF6D0
_02012B78: .word SYNTH_BIN_FILE_PTR
	arm_func_end CloseSynthBin

	arm_func_start GenerateCroagunkItems
GenerateCroagunkItems: ; 0x02012B7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x160
	bl GetScenarioBalance
	ldr r1, _02013098 ; =_020AF6D0
	str r0, [sp, #8]
	ldr r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	movne r7, #0
	bne _02012BB4
	mov r7, #1
	bl LoadSynthBin
_02012BB4:
	ldr r0, _0201309C ; =0x000045E0
	mov r1, #0xf
	bl MemAlloc
	mov r1, #0
	mov r4, r0
	mov r5, r1
	add r0, sp, #0x2c
_02012BD0:
	strb r5, [r0, r1]
	add r1, r1, #1
	cmp r1, #0x12
	blt _02012BD0
	ldr r0, _020130A0 ; =_02098CCC
	mov r6, r5
	bl Debug_Print0
	add r0, sp, #0x24
	bl GetPartyMembers
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, #3
	bl RandRange
	mov r8, #0
	mov fp, r0
	mov sl, r8
	b _02012C78
_02012C14:
	mov r1, sl, lsl #1
	add r0, sp, #0x24
	ldrsh r0, [r0, r1]
	bl GetTeamMember
	ldrsh r0, [r0, #4]
	mov sb, #0
	bl FemaleToMaleForm
	bl GetBaseFormCastformDeoxysCherrim
	mov r3, sb
	b _02012C58
_02012C3C:
	mov r2, r3, lsl #1
	add r1, sp, #0x1c
	ldrsh r1, [r1, r2]
	cmp r0, r1
	moveq sb, #1
	beq _02012C60
	add r3, r3, #1
_02012C58:
	cmp r3, r8
	blt _02012C3C
_02012C60:
	cmp sb, #0
	moveq r2, r8, lsl #1
	addeq r1, sp, #0x1c
	streqh r0, [r1, r2]
	addeq r8, r8, #1
	add sl, sl, #1
_02012C78:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _02012C14
	ldr r0, _020130A4 ; =_02098D24
	mov r2, #0
	mov r1, fp
	mov r3, r8
	mov sb, r8
	str r2, [sp]
	bl Debug_Print0
	add r0, r4, #0x12c
	add r0, r0, #0x800
	str r0, [sp, #0x14]
	mvn r0, #0
	str r0, [sp, #0x18]
	b _02012D28
_02012CB8:
	mov r0, r8
	bl RandInt
	str r0, [sp, #4]
	mov r1, r0, lsl #1
	add r0, sp, #0x1c
	ldrsh sl, [r0, r1]
	cmp sl, #0
	blt _02012D28
	ldr r1, [sp, #0x14]
	mov r2, #0x1c
	mla r1, r6, r2, r1
	mov r0, sl
	add r2, sp, #0x2c
	bl GetValidSynthsForSpecies
	cmp r0, #0
	addne r0, r4, r5, lsl #1
	addne r0, r0, #0x900
	strneh sl, [r0, #6]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	mov r2, r0, lsl #1
	add r0, sp, #0x1c
	sub sb, sb, #1
	addne r6, r6, #1
	addne r5, r5, #1
	strh r1, [r0, r2]
	cmp sb, #0
	ble _02012D38
_02012D28:
	cmp r5, fp
	bge _02012D38
	cmp r8, r5
	bgt _02012CB8
_02012D38:
	ldr fp, _020130A8 ; =0x00000229
	str r5, [sp, #0x10]
	mov sl, #0
	mov sb, #1
_02012D48:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl FemaleToMaleForm
	bl GetBaseFormCastformDeoxysCherrim
	mov r8, r0
	bl IsMonsterValid
	cmp r0, #0
	beq _02012D80
	mov r0, r8
	bl HasMonsterBeenAttackedInDungeons
	cmp r0, #0
	movne r0, sl, lsl #1
	strneh r8, [r4, r0]
	addne sl, sl, #1
_02012D80:
	add sb, sb, #1
	cmp sb, fp
	ble _02012D48
	b _02012E34
_02012D90:
	mov r0, sl
	mov fp, #0
	bl RandInt
	mov r8, r0
	mov r0, r8, lsl #1
	ldrsh sb, [r4, r0]
	mov r1, fp
	b _02012DCC
_02012DB0:
	add r0, r4, r1, lsl #1
	add r0, r0, #0x900
	ldrsh r0, [r0, #6]
	cmp sb, r0
	moveq fp, #1
	beq _02012DD4
	add r1, r1, #1
_02012DCC:
	cmp r1, r5
	blt _02012DB0
_02012DD4:
	cmp fp, #0
	bne _02012E10
	add r0, r4, #0x12c
	add r1, r0, #0x800
	mov r0, #0x1c
	mla r1, r6, r0, r1
	add r2, sp, #0x2c
	mov r0, sb
	bl GetValidSynthsForSpecies
	cmp r0, #0
	addne r0, r4, r5, lsl #1
	addne r0, r0, #0x900
	strneh sb, [r0, #6]
	addne r6, r6, #1
	addne r5, r5, #1
_02012E10:
	sub sl, sl, #1
	b _02012E2C
_02012E18:
	add r0, r4, r8, lsl #1
	ldrsh r0, [r0, #2]
	mov r1, r8, lsl #1
	add r8, r8, #1
	strh r0, [r4, r1]
_02012E2C:
	cmp r8, sl
	blt _02012E18
_02012E34:
	cmp r5, #0x10
	ldrlt r0, [sp, #0x10]
	sublt r0, r5, r0
	cmplt r0, sl
	blt _02012D90
	mov r8, #0
	mov sb, r8
_02012E50:
	add r0, sp, #0x2c
	ldrb r0, [r0, sb]
	cmp r0, #0
	beq _02012EB0
	ldr r0, _020130AC ; =TYPE_SPECIFIC_EXCLUSIVE_ITEMS
	and r5, sb, #0xff
	mov sl, #0
	add fp, r0, r5, lsl #3
_02012E70:
	cmp r5, #0x12
	movhs r0, #0
	addlo r0, fp, sl, lsl #1
	ldrlosh r0, [r0, #-8]
	bl GetSynthItem
	cmp r0, #0
	beq _02012EA4
	ldrh r2, [r0, #6]
	ldr r1, [sp, #8]
	cmp r2, r1
	addle r1, sp, #0x40
	strle r0, [r1, r8, lsl #2]
	addle r8, r8, #1
_02012EA4:
	add sl, sl, #1
	cmp sl, #4
	blt _02012E70
_02012EB0:
	add sb, sb, #1
	cmp sb, #0x12
	blt _02012E50
	cmp r8, #0
	ble _02012F00
	mov r0, #0x1c
	mul r5, r6, r0
	add r0, r4, #0x12c
	add sb, r0, #0x800
	mov r0, r8
	add r8, sb, r5
	bl RandInt
	add r2, sp, #0x40
	ldr r0, [r2, r0, lsl #2]
	mov r1, #1
	str r0, [r8, #8]
	str r1, [sb, r5]
	ldrh r0, [r0, #2]
	add r6, r6, #1
	str r0, [r8, #4]
_02012F00:
	cmp r6, #0
	bne _02012F40
	mov r0, r4
	bl MemFree
	cmp r7, #0
	beq _02012F1C
	bl CloseSynthBin
_02012F1C:
	mov r3, #0
	ldr r1, _020130B0 ; =_022A4BD8
	mov r0, r3
_02012F28:
	mov r2, r3, lsl #1
	add r3, r3, #1
	strh r0, [r1, r2]
	cmp r3, #8
	blt _02012F28
	b _02013090
_02012F40:
	mov r0, #4
	mov r1, #9
	bl RandRange
	mov fp, r0
	mov sb, #0
	b _02013050
_02012F58:
	mov r0, #0
	mov r3, r0
	mov r1, #0x1c
	b _02012F78
_02012F68:
	mla r2, r3, r1, r4
	ldr r2, [r2, #0x930]
	add r3, r3, #1
	add r0, r0, r2
_02012F78:
	cmp r3, r6
	blt _02012F68
	cmp r0, #0
	beq _02013058
	bl RandInt
	mov r1, #0
	add r2, r4, #0x12c
	add r8, r2, #0x800
	mov sl, r1
	mov r2, #0x1c
	b _02013048
_02012FA4:
	mla r5, sl, r2, r8
	ldr r3, [r5, #4]
	cmp r0, r3
	bhs _02013044
	ldr r8, [r5]
	mov sl, #0
	b _02013030
_02012FC0:
	add r2, r5, sl, lsl #2
	ldr r3, [r2, #8]
	ldrh r2, [r3, #2]
	add r1, r1, r2
	cmp r0, r1
	bge _0201302C
	ldrsh r8, [r3]
	mov sl, #0
	ldr r1, _020130B0 ; =_022A4BD8
	b _0201300C
_02012FE8:
	mov r0, sl, lsl #1
	ldrsh r0, [r1, r0]
	cmp r8, r0
	bne _02013008
	ldr r0, _020130B4 ; =_02098D48
	mov r1, r8
	bl Debug_Print0
	b _02013014
_02013008:
	add sl, sl, #1
_0201300C:
	cmp sl, sb
	blt _02012FE8
_02013014:
	cmp sl, sb
	movge r1, sb, lsl #1
	ldrge r0, _020130B0 ; =_022A4BD8
	addge sb, sb, #1
	strgeh r8, [r0, r1]
	b _02013038
_0201302C:
	add sl, sl, #1
_02013030:
	cmp sl, r8
	blt _02012FC0
_02013038:
	mov r0, #0
	str r0, [r5, #4]
	b _02013050
_02013044:
	add sl, sl, #1
_02013048:
	cmp sl, r6
	blt _02012FA4
_02013050:
	cmp sb, fp
	blt _02012F58
_02013058:
	mov r2, #0
	ldr r0, _020130B0 ; =_022A4BD8
	b _02013070
_02013064:
	mov r1, sb, lsl #1
	strh r2, [r0, r1]
	add sb, sb, #1
_02013070:
	cmp sb, #8
	blt _02013064
	mov r0, r4
	bl MemFree
	cmp r7, #0
	beq _0201308C
	bl CloseSynthBin
_0201308C:
	mov r0, #1
_02013090:
	add sp, sp, #0x160
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02013098: .word _020AF6D0
_0201309C: .word 0x000045E0
_020130A0: .word _02098CCC
_020130A4: .word _02098D24
_020130A8: .word 0x00000229
_020130AC: .word TYPE_SPECIFIC_EXCLUSIVE_ITEMS
_020130B0: .word _022A4BD8
_020130B4: .word _02098D48
	arm_func_end GenerateCroagunkItems

	arm_func_start GetCroagunkItemTemplates
GetCroagunkItemTemplates: ; 0x020130B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02013148 ; =_020AF6D0
	mov r7, r0
	ldr r0, [r1, #4]
	ldr r4, _0201314C ; =_022A4BD8
	cmp r0, #0
	mov r5, #0
	movne r0, #1
	moveq r0, r5
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
_020130EC:
	mov r1, r6, lsl #1
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02013130
	ldrsh r0, [r4, r1]
	bl GetSynthItem
	cmp r0, #0
	beq _02013130
	cmp r7, #0
	beq _0201312C
	add r3, r7, r5, lsl #3
	mov r2, #4
_0201311C:
	ldrh r1, [r0], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0201311C
_0201312C:
	add r5, r5, #1
_02013130:
	add r6, r6, #1
	cmp r6, #8
	blt _020130EC
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02013148: .word _020AF6D0
_0201314C: .word _022A4BD8
	arm_func_end GetCroagunkItemTemplates

	arm_func_start PopCroagunkItem
PopCroagunkItem: ; 0x02013150
	ldr r3, _0201318C ; =_022A4BD8
	mov ip, #0
	b _0201317C
_0201315C:
	mov r2, ip, lsl #1
	ldrsh r1, [r3, r2]
	cmp r0, r1
	moveq r0, #0
	streqh r0, [r3, r2]
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_0201317C:
	cmp ip, #8
	blt _0201315C
	mov r0, #0
	bx lr
	.align 2, 0
_0201318C: .word _022A4BD8
	arm_func_end PopCroagunkItem

	arm_func_start LoadCroagunkItems
LoadCroagunkItems: ; 0x02013190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForWrite
	ldr r5, _020131EC ; =_022A4BD8
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb
_020131BC:
	mov r0, r6
	mov r2, r4
	add r1, r5, r7, lsl #1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #8
	blt _020131BC
	add r0, sp, #0
	bl BitstreamDebug
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020131EC: .word _022A4BD8
	arm_func_end LoadCroagunkItems

	arm_func_start SaveCroagunkItems
SaveCroagunkItems: ; 0x020131F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl InitBitstreamForRead
	ldr r5, _0201324C ; =_022A4BD8
	mov r7, #0
	add r6, sp, #0
	mov r4, #0xb
_0201321C:
	mov r0, r6
	mov r2, r4
	add r1, r5, r7, lsl #1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #8
	blt _0201321C
	add r0, sp, #0
	bl BitstreamDebug
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201324C: .word _022A4BD8
	arm_func_end SaveCroagunkItems

	arm_func_start GetSynthItem
GetSynthItem: ; 0x02013250
	ldr r1, _020132A0 ; =_020AF6D0
	ldr r1, [r1, #4]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	bxeq lr
	ldr r1, _020132A0 ; =_020AF6D0
	ldr r1, [r1]
	b _0201328C
_0201327C:
	cmp r2, r0
	moveq r0, r1
	bxeq lr
	add r1, r1, #8
_0201328C:
	ldrsh r2, [r1]
	cmp r2, #0
	bne _0201327C
	mov r0, #0
	bx lr
	.align 2, 0
_020132A0: .word _020AF6D0
	arm_func_end GetSynthItem

	arm_func_start GetValidSynthsForSpecies
GetValidSynthsForSpecies: ; 0x020132A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl GetScenarioBalance
	mov r5, #0
	str r5, [sb]
	mov r7, r0
	mov r6, r5
	str r5, [sb, #4]
	mov r4, #1
_020132D0:
	mov r1, r6, lsl #0x10
	mov r0, sl
	mov r1, r1, asr #0x10
	bl GetExclusiveItem
	cmp r0, #0
	beq _0201332C
	bl GetSynthItem
	cmp r0, #0
	beq _0201332C
	ldrh r1, [r0, #6]
	cmp r1, r7
	bgt _0201332C
	ldr r1, [sb]
	mov r5, r4
	add r1, sb, r1, lsl #2
	str r0, [r1, #8]
	ldrh r0, [r0, #2]
	ldr r1, [sb, #4]
	add r0, r1, r0
	str r0, [sb, #4]
	ldr r0, [sb]
	add r0, r0, #1
	str r0, [sb]
_0201332C:
	add r6, r6, #1
	cmp r6, #4
	blt _020132D0
	mov r0, sl
	bl ReturnEggExclusiveItem
	cmp r0, #0
	beq _0201338C
	bl GetSynthItem
	cmp r0, #0
	beq _0201338C
	ldrh r1, [r0, #6]
	cmp r1, r7
	bgt _0201338C
	ldr r1, [sb]
	mov r5, #1
	add r1, sb, r1, lsl #2
	str r0, [r1, #8]
	ldrh r0, [r0, #2]
	ldr r1, [sb, #4]
	add r0, r1, r0
	str r0, [sb, #4]
	ldr r0, [sb]
	add r0, r0, #1
	str r0, [sb]
_0201338C:
	mov r0, sl
	mov r1, #0
	bl GetType
	cmp r0, #0
	movne r1, #1
	strneb r1, [r8, r0]
	mov r0, sl
	mov r1, #1
	bl GetType
	cmp r0, #0
	movne r1, #1
	strneb r1, [r8, r0]
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end GetValidSynthsForSpecies

	arm_func_start LoadWazaP
LoadWazaP: ; 0x020133C4
	stmdb sp!, {r3, lr}
	ldr r1, _020133E8 ; =DUNGEON_MOVE_TABLES
	mov r0, #0
	str r0, [r1, #4]
	bl OpenWaza
	ldr r0, _020133E8 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #4]
	bl SelectWaza
	ldmia sp!, {r3, pc}
	.align 2, 0
_020133E8: .word DUNGEON_MOVE_TABLES
	arm_func_end LoadWazaP

	arm_func_start LoadWazaP2
LoadWazaP2: ; 0x020133EC
	stmdb sp!, {r3, lr}
	ldr r1, _02013410 ; =DUNGEON_MOVE_TABLES
	mov r0, #1
	str r0, [r1, #4]
	bl OpenWaza
	ldr r0, _02013410 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #4]
	bl SelectWaza
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013410: .word DUNGEON_MOVE_TABLES
	arm_func_end LoadWazaP2

	arm_func_start UnloadCurrentWazaP
UnloadCurrentWazaP: ; 0x02013414
	stmdb sp!, {r4, lr}
	ldr r0, _0201344C ; =DUNGEON_MOVE_TABLES
	ldr r1, _02013450 ; =_020AF700
	ldr r0, [r0, #4]
	add r4, r1, r0, lsl #3
	mov r0, r4
	bl UnloadFile
	mov r0, r4
	bl ZInit8
	ldr r1, _0201344C ; =DUNGEON_MOVE_TABLES
	mov r0, #0
	str r0, [r1, #4]
	bl SelectWaza
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201344C: .word DUNGEON_MOVE_TABLES
_02013450: .word _020AF700
	arm_func_end UnloadCurrentWazaP

	arm_func_start GetMoveName
GetMoveName: ; 0x02013454
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	ldr ip, _02013474 ; =StringFromId
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_02013474: .word StringFromId
	arm_func_end GetMoveName

	arm_func_start FormatMoveString
FormatMoveString: ; 0x02013478
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r6, r1
	ldrb r1, [r6]
	mov r7, r0
	mov r5, r2
	tst r1, #0x20
	bne _020134A4
	ldrh r0, [r6, #2]
	tst r0, #1
	beq _020134AC
_020134A4:
	mov r0, #0x57
	b _020134B0
_020134AC:
	mov r0, #0x4d
_020134B0:
	ldrb r3, [r6, #7]
	cmp r5, #0
	ldreq r5, _02013738 ; =_02098D68
	and r4, r0, #0xff
	cmp r3, #0
	moveq r0, #0
	streqb r0, [sp, #0x10]
	beq _020134E0
	ldr r1, _0201373C ; =_02098DE4
	add r0, sp, #0x10
	mov r2, #0x56
	bl SprintfStatic__02013758
_020134E0:
	ldrb r0, [r5, #8]
	cmp r0, #0
	movne r4, #0x57
	bne _0201350C
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0201350C
	ldrh r0, [r6, #4]
	bl Is2TurnsMove
	cmp r0, #0
	movne r4, #0x57
_0201350C:
	ldr r0, [r5]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02013730
_0201351C: ; jump table
	b _02013534 ; case 0
	b _02013564 ; case 1
	b _020135C8 ; case 2
	b _0201362C ; case 3
	b _02013690 ; case 4
	b _020136F4 ; case 5
_02013534:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _02013740 ; =_02098DF4
	add r3, sp, #0x10
	mov r0, r7
	bl SprintfStatic__02013758
	b _02013730
_02013564:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #8
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_020135C8:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #8
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_0201362C:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #4
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _02013750 ; =_02098E58
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_02013690:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldrb r1, [r6]
	mov r5, r0
	mov r0, r6
	tst r1, #4
	ldrne r8, _02013744 ; =_02098E04
	ldreq r8, _02013748 ; =_02098E0C
	bl GetMaxPp
	add r1, sp, #0x10
	str r5, [sp]
	str r1, [sp, #4]
	ldrb r3, [r6, #6]
	ldr r1, _0201374C ; =_02098E14
	mov r2, r4
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r8
	bl SprintfStatic__02013758
	b _02013730
_020136F4:
	ldrh r0, [r6, #4]
#if defined(EUROPE)
	add r0, r0, #0xff0
	add r0, r0, #0x1000
#elif defined(JAPAN)
	add r0, r0, #0xb
	add r0, r0, #0x1300
#else
	add r0, r0, #0xee
	add r0, r0, #0x1f00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r4, r0
	mov r0, r6
	bl GetMaxPp
	str r0, [sp]
	ldrb r3, [r6, #6]
	ldr r1, _02013754 ; =_02098E9C
	mov r0, r7
	mov r2, r4
	bl SprintfStatic__02013758
_02013730:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02013738: .word _02098D68
_0201373C: .word _02098DE4
_02013740: .word _02098DF4
_02013744: .word _02098E04
_02013748: .word _02098E0C
_0201374C: .word _02098E14
_02013750: .word _02098E58
_02013754: .word _02098E9C
	arm_func_end FormatMoveString

	arm_func_start SprintfStatic__02013758
SprintfStatic__02013758: ; 0x02013758
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
	arm_func_end SprintfStatic__02013758

	arm_func_start FormatMoveStringMore
FormatMoveStringMore: ; 0x02013780
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	mov r0, r6
	bl GetDungeonResultString
	mov r1, r5
	mov r2, r4
	orr ip, r6, #0x10000
	add r3, r7, r6, lsl #2
	str ip, [r3, #0x10]
	bl FormatMoveString
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end FormatMoveStringMore
