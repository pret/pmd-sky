	.include "asm/macros.inc"
	.include "main_0200E864.inc"

	.text

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
