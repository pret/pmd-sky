	.include "asm/macros.inc"
	.include "main_0200E828.inc"

	.text

	arm_func_start EnsureValidItem
EnsureValidItem: ; 0x0200E828
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0
	ble _0200E844
	ldr r1, _0200E860 ; =0x00000578
	cmp r4, r1
	blt _0200E84C
_0200E844:
	mov r0, #0x55
	ldmia sp!, {r4, pc}
_0200E84C:
	bl IsItemValid
	cmp r0, #0
	moveq r4, #0x55
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200E860: .word 0x00000578
	arm_func_end EnsureValidItem

	arm_func_start GetItemName
GetItemName: ; 0x0200E864
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
#if defined(EUROPE)
	add r0, r0, #0x278
	add r0, r0, #0x1800
#elif defined(JAPAN)
	add r0, r0, #0x93
	add r0, r0, #0xd00
#else
	add r0, r0, #0x76
	add r0, r0, #0x1a00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	ldmia sp!, {r3, pc}
	arm_func_end GetItemName

	arm_func_start GetItemNameFormatted
GetItemNameFormatted: ; 0x0200E884
#ifdef EUROPE
#define GET_ITEM_NAME_FORMATTED_SPRINTF SprintfStatic__0200E808_EU
#else
#define GET_ITEM_NAME_FORMATTED_SPRINTF SprintfStatic__0200E990
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl EnsureValidItem
#if defined(EUROPE)
	add r0, r0, #0x278
	add r0, r0, #0x1800
#elif defined(JAPAN)
	add r0, r0, #0x93
	add r0, r0, #0xd00
#else
	add r0, r0, #0x76
	add r0, r0, #0x1a00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r4, r0
	mov r0, r7
	bl EnsureValidItem
	ldr r1, _0200E97C ; =ITEM_DATA_TABLE_PTRS
	cmp r5, #0
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r1, [r0, #4]
	bne _0200E8E8
	add r0, r1, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0200E914
_0200E8E8:
	cmp r6, #0
	beq _0200E904
	ldr r1, _0200E980 ; =_0209808C
	mov r0, r8
	mov r2, r4
	bl GET_ITEM_NAME_FORMATTED_SPRINTF
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200E904:
	mov r0, r8
	mov r1, r4
	bl strcpy
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200E914:
	cmp r1, #0xf
	bne _0200E94C
	cmp r6, #0
	beq _0200E938
	ldr r1, _0200E984 ; =_0209809C
	mov r0, r8
	mov r2, r4
	bl GET_ITEM_NAME_FORMATTED_SPRINTF
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200E938:
	ldr r1, _0200E988 ; =_020980AC
	mov r0, r8
	mov r2, r4
	bl GET_ITEM_NAME_FORMATTED_SPRINTF
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200E94C:
	cmp r6, #0
	beq _0200E968
	ldr r1, _0200E98C ; =_020980B0
	mov r0, r8
	mov r2, r4
	bl GET_ITEM_NAME_FORMATTED_SPRINTF
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200E968:
	ldr r1, _0200E988 ; =_020980AC
	mov r0, r8
	mov r2, r4
	bl GET_ITEM_NAME_FORMATTED_SPRINTF
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200E97C: .word ITEM_DATA_TABLE_PTRS
_0200E980: .word _0209808C
_0200E984: .word _0209809C
_0200E988: .word _020980AC
_0200E98C: .word _020980B0
	arm_func_end GetItemNameFormatted

#ifndef EUROPE
	arm_func_start SprintfStatic__0200E990
SprintfStatic__0200E990: ; 0x0200E990
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
	arm_func_end SprintfStatic__0200E990
#endif

	arm_func_start GetItemBuyPrice
GetItemBuyPrice: ; 0x0200E9B8
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200E9D4 ; =ITEM_DATA_TABLE_PTRS
	mov r0, r0, lsl #4
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	ldrh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E9D4: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemBuyPrice

	arm_func_start GetItemSellPrice
GetItemSellPrice: ; 0x0200E9D8
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200E9F4 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E9F4: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemSellPrice

	arm_func_start GetItemSpriteId
GetItemSpriteId: ; 0x0200E9F8
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200EA14 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #5]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EA14: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemSpriteId

	arm_func_start GetItemPaletteId
GetItemPaletteId: ; 0x0200EA18
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200EA34 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EA34: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemPaletteId

	arm_func_start GetItemActionName
GetItemActionName: ; 0x0200EA38
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200EA54 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xd]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EA54: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemActionName

	arm_func_start GetThrownItemQuantityLimit
GetThrownItemQuantityLimit: ; 0x0200EA58
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl EnsureValidItem
	ldr r1, _0200EA7C ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	add r0, r0, r4
	ldrb r0, [r0, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200EA7C: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetThrownItemQuantityLimit

	arm_func_start GetItemMoveId
GetItemMoveId: ; 0x0200EA80
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200EA9C ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrsh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EA9C: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemMoveId

	arm_func_start TestItemAiFlag
TestItemAiFlag: ; 0x0200EAA0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _0200EAD4
	bl EnsureValidItem
	ldr r1, _0200EB2C ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xe]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0200EAD4:
	cmp r1, #1
	bne _0200EB04
	bl EnsureValidItem
	ldr r1, _0200EB2C ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xe]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0200EB04:
	bl EnsureValidItem
	ldr r1, _0200EB2C ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xe]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EB2C: .word ITEM_DATA_TABLE_PTRS
	arm_func_end TestItemAiFlag

	arm_func_start IsItemInTimeDarkness
IsItemInTimeDarkness: ; 0x0200EB30
	ldr r1, _0200EB54 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xe]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200EB54: .word ITEM_DATA_TABLE_PTRS
	arm_func_end IsItemInTimeDarkness

	arm_func_start IsItemValidVeneer
IsItemValidVeneer: ; 0x0200EB58
	ldr ip, _0200EB60 ; =IsItemValid
	bx ip
	.align 2, 0
_0200EB60: .word IsItemValid
	arm_func_end IsItemValidVeneer

	arm_func_start sub_0200EB64
sub_0200EB64: ; 0x0200EB64
	ldr r1, _0200EB88 ; =ITEM_DATA_TABLE_PTRS
	mov r2, r0, lsl #0x1f
	ldr r1, [r1, #8]
	mov r0, r0, asr #1
	ldr r3, [r1, r0, lsl #2]
	ldr r0, _0200EB8C ; =0x000007FF
	mov r1, r2, lsr #0x1b
	and r0, r0, r3, asr r1
	bx lr
	.align 2, 0
_0200EB88: .word ITEM_DATA_TABLE_PTRS
_0200EB8C: .word 0x000007FF
	arm_func_end sub_0200EB64

	arm_func_start sub_0200EB90
sub_0200EB90: ; 0x0200EB90
	mov ip, #0
	ldr r2, _0200EBC8 ; =ARM9_UNKNOWN_TABLE__NA_2097FF8
	b _0200EBB8
_0200EB9C:
	add r1, r2, ip, lsl #2
	ldrsh r1, [r1, #2]
	mov r3, ip, lsl #2
	cmp r0, r1
	ldreqsh r0, [r2, r3]
	bxeq lr
	add ip, ip, #1
_0200EBB8:
	cmp ip, #0x10
	blt _0200EB9C
	mov r0, #0
	bx lr
	.align 2, 0
_0200EBC8: .word ARM9_UNKNOWN_TABLE__NA_2097FF8
	arm_func_end sub_0200EB90

	arm_func_start SetActiveInventoryToMain
SetActiveInventoryToMain: ; 0x0200EBCC
	ldr ip, _0200EBD8 ; =SetActiveInventory
	mov r0, #0
	bx ip
	.align 2, 0
_0200EBD8: .word SetActiveInventory
	arm_func_end SetActiveInventoryToMain

	arm_func_start AllInventoriesZInit
AllInventoriesZInit: ; 0x0200EBDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	ldr r6, _0200EC44 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, sl
	mov fp, sl
	mov r4, #6
	mov r5, #0x12c
_0200EBF8:
	mul sb, sl, r5
	mov r8, fp
_0200EC00:
	ldr r0, [r6]
	add r0, r0, sb
	mla r0, r8, r4, r0
	bl ItemZInit
	add r8, r8, #1
	cmp r8, #0x32
	blt _0200EC00
	ldr r0, [r6]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x1000
	add sl, sl, #1
	str r7, [r0, #0x394]
	cmp sl, #3
	blt _0200EBF8
	mov r0, r7
	bl SetActiveInventory
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200EC44: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AllInventoriesZInit

	arm_func_start SpecialEpisodeInventoryZInit
SpecialEpisodeInventoryZInit: ; 0x0200EC48
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0200EC8C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, #0
	mov r4, #6
_0200EC58:
	ldr r0, [r5]
	add r0, r0, #0x12c
	mla r0, r6, r4, r0
	bl ItemZInit
	add r6, r6, #1
	cmp r6, #0x32
	blt _0200EC58
	ldr r0, _0200EC8C ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1000
	str r1, [r0, #0x398]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200EC8C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SpecialEpisodeInventoryZInit

	arm_func_start RescueInventoryZInit
RescueInventoryZInit: ; 0x0200EC90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0200ECD4 ; =BAG_ITEMS_PTR_MIRROR
	mov r6, #0
	mov r4, #6
_0200ECA0:
	ldr r0, [r5]
	add r0, r0, #0x258
	mla r0, r6, r4, r0
	bl ItemZInit
	add r6, r6, #1
	cmp r6, #0x32
	blt _0200ECA0
	ldr r0, _0200ECD4 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1000
	str r1, [r0, #0x39c]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200ECD4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RescueInventoryZInit

	arm_func_start SetActiveInventory
SetActiveInventory: ; 0x0200ECD8
	ldr r2, _0200ECF8 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x12c
	ldr r3, [r2]
	strb r0, [r3, #0x388]
	ldr r2, [r2]
	mla r1, r0, r1, r2
	str r1, [r2, #0x384]
	bx lr
	.align 2, 0
_0200ECF8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetActiveInventory
