	.include "asm/macros.inc"
	.include "overlay_29_022EB44C.inc"

	.text

	arm_func_start GetItemToUseByIndex
GetItemToUseByIndex: ; 0x022EB44C
	stmdb sp!, {r3, lr}
	ldrb r2, [r1]
	cmp r2, #1
	blo _022EB478
	cmp r2, #0x33
	bhs _022EB478
	sub r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemAtIdx
	ldmia sp!, {r3, pc}
_022EB478:
	cmp r2, #0x80
	bne _022EB498
	ldrsh r0, [r1, #2]
	ldrsh r1, [r1, #4]
	bl GetTile
	ldr r0, [r0, #0x10]
	bl GetItemInfo
	ldmia sp!, {r3, pc}
_022EB498:
	cmp r2, #0x81
	ldreq r0, [r0, #0xb4]
	addeq r0, r0, #0x62
	ldmeqia sp!, {r3, pc}
	cmp r2, #0x90
	blo _022EB4DC
	cmp r2, #0x94
	bhs _022EB4DC
	ldr r0, _022EB4E4 ; =DUNGEON_PTR
	sub r1, r2, #0x90
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	add r0, r0, #0x62
	ldmia sp!, {r3, pc}
_022EB4DC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB4E4: .word DUNGEON_PTR
	arm_func_end GetItemToUseByIndex

	arm_func_start ov29_022EB4E8
ov29_022EB4E8: ; 0x022EB4E8
	stmdb sp!, {r3, lr}
	mov r2, #6
	mul r2, r1, r2
	add r1, r0, r2
	ldrb r1, [r1, #4]
	cmp r1, #1
	blo _022EB528
	cmp r1, #0x33
	bhs _022EB528
	sub r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl RemoveItem
	bl RemoveEmptyItemsInBagWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
_022EB528:
	cmp r1, #0x80
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #6
	add r0, r0, r2
	mov r1, #1
	bl RemoveGroundItem
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022EB4E8

	arm_func_start GetItemToUse
GetItemToUse: ; 0x022EB54C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0xb4]
	mov r3, #6
	add ip, ip, #0x4e
	mla r1, r3, r1, ip
	bl GetItemToUseByIndex
	ldmia sp!, {r3, pc}
	arm_func_end GetItemToUse

	arm_func_start ov29_022EB568
ov29_022EB568: ; 0x022EB568
	ldr r2, [r0, #0xb4]
	mov r0, #6
	mla r2, r1, r0, r2
	ldr r0, _022EB590 ; =DUNGEON_PTR
	ldrb r1, [r2, #0x4e]
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bx lr
	.align 2, 0
_022EB590: .word DUNGEON_PTR
	arm_func_end ov29_022EB568

	arm_func_start ov29_022EB594
ov29_022EB594: ; 0x022EB594
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022EB5D0
_022EB5A0: ; jump table
	b _022EB5B0 ; case 0
	b _022EB5B8 ; case 1
	b _022EB5C0 ; case 2
	b _022EB5C8 ; case 3
_022EB5B0:
	mov r0, #1
	bx lr
_022EB5B8:
	mov r0, #2
	bx lr
_022EB5C0:
	mov r0, #3
	bx lr
_022EB5C8:
	mov r0, #4
	bx lr
_022EB5D0:
	mov r0, #0
	bx lr
	arm_func_end ov29_022EB594

	arm_func_start GetItemAction
GetItemAction: ; 0x022EB5D8
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #4]
	ldr r1, _022EB604 ; =0x0000016B
	cmp r0, r1
	moveq r0, #0x35
	ldmeqia sp!, {r3, pc}
	bl GetItemCategoryVeneer
	ldr r1, _022EB608 ; =ITEM_CATEGORY_ACTIONS
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB604: .word 0x0000016B
_022EB608: .word ITEM_CATEGORY_ACTIONS
	arm_func_end GetItemAction

	arm_func_start RemoveUsedItem
RemoveUsedItem: ; 0x022EB60C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0, #0xb4]
	mov r3, #6
	add ip, ip, #0x4e
	mla r1, r3, r1, ip
	ldr r4, [r0, #0xb4]
	bl GetItemToUseByIndex
	ldrb r1, [r4, #0x4e]
	mov r5, r0
	cmp r1, #0x80
	bne _022EB648
	add r0, r4, #0x50
	mov r1, #1
	bl RemoveGroundItem
	ldmia sp!, {r3, r4, r5, pc}
_022EB648:
	ldrb r1, [r5, #1]
	cmp r1, #0
	beq _022EB658
	bl RemoveEquivItemNoHole
_022EB658:
	mov r0, r5
	bl ItemZInit
	bl RemoveEmptyItemsInBagWrapper
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RemoveUsedItem

	arm_func_start ov29_022EB668
ov29_022EB668: ; 0x022EB668
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r8, r1
	mov r1, #6
	mul r6, r8, r1
	mov sb, r0
	ldr r1, [sb, #0xb4]
	mov r7, r2
	add r1, r1, #0x4e
	add r1, r1, r6
	bl GetItemToUseByIndex
	mov r4, r0
	ldrsh r0, [r4, #4]
	ldr r5, [sb, #0xb4]
	bl IsHM
	cmp r0, #0
	bne _022EB7F8
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #5
	bne _022EB7E8
	add r0, r5, r6
	ldrb r0, [r0, #0x4e]
	cmp r0, #0x80
	bne _022EB71C
	ldrh r1, [r4]
	add r5, r5, #0x50
	add r0, r5, r6
	strh r1, [sp]
	ldrh r2, [r4, #2]
	mov r1, #1
	strh r2, [sp, #2]
	ldrh r2, [r4, #4]
	strh r2, [sp, #4]
	bl RemoveGroundItem
	ldrsh r0, [r4, #4]
	mov r3, #0xbb
	add r1, sp, #0
	sub r4, r0, #0xbc
	add r0, r5, r6
	mov r2, #1
	strh r4, [sp, #2]
	strh r3, [sp, #4]
	bl SpawnItem
	b _022EB7F8
_022EB71C:
	ldrb r1, [r4, #1]
	cmp r1, #0
	beq _022EB7C8
	ldr r0, _022EB800 ; =DUNGEON_PTR
	sub r1, r1, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	add r0, r0, #0x62
	cmp r4, r0
	bne _022EB7A4
	mov r0, r4
	bl GetEquivItemIndex
	ldrsh r1, [r4, #4]
	mov r5, r0
	mov r0, r4
	sub r1, r1, #0xbc
	strh r1, [r4, #2]
	mov r1, #0xbb
	strh r1, [r4, #4]
	bl SetItemAcquired
	cmp r5, #0
	blt _022EB7F8
	mov r0, r5
	bl GetItemAtIdx
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	b _022EB7F8
_022EB7A4:
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
	bl ov29_02347040
	b _022EB7F8
_022EB7C8:
	ldrsh r2, [r4, #4]
	mov r0, r4
	mov r1, #0xbb
	sub r2, r2, #0xbc
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl SetItemAcquired
	b _022EB7F8
_022EB7E8:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl RemoveUsedItem
_022EB7F8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022EB800: .word DUNGEON_PTR
	arm_func_end ov29_022EB668

	arm_func_start ov29_022EB804
ov29_022EB804: ; 0x022EB804
	cmp r0, #0
	ldrge r1, _022EB818 ; =ov29_0237C920
	movlt r0, #0
	ldrgeb r0, [r1, r0, lsl #3]
	bx lr
	.align 2, 0
_022EB818: .word ov29_0237C920
	arm_func_end ov29_022EB804

	arm_func_start AddDungeonSubMenuOption
AddDungeonSubMenuOption: ; 0x022EB81C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _022EB89C ; =ov29_0237C918
	ldr r2, [r2]
	cmp r2, #0xa
	ldmgeia sp!, {r4, r5, r6, pc}
	mov r5, #0
	ldr r4, _022EB8A0 ; =ov29_0237C91C
	b _022EB850
_022EB83C:
	mov r3, r5, lsl #3
	ldrh r3, [r4, r3]
	cmp r0, r3
	ldmeqia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_022EB850:
	cmp r5, r2
	blt _022EB83C
	ldr ip, _022EB89C ; =ov29_0237C918
	ldr r4, _022EB8A0 ; =ov29_0237C91C
	mov r6, r2, lsl #3
	ldr lr, [ip]
#ifdef JAPAN
	add r3, r0, #0x57
#else
	add r3, r0, #0x87
#endif
	add lr, lr, #1
	ldr r5, _022EB8A4 ; =ov29_0237C91E
	strh r0, [r4, r6]
	ldr r4, _022EB8A8 ; =ov29_0237C920
	strh r1, [r5, r6]
	mov r1, #1
	ldr r0, _022EB8AC ; =ov29_0237C922
	strb r1, [r4, r2, lsl #3]
#ifdef JAPAN
	add r1, r3, #0x2300
#else
	add r1, r3, #0x900
#endif
	strh r1, [r0, r6]
	str lr, [ip]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022EB89C: .word ov29_0237C918
_022EB8A0: .word ov29_0237C91C
_022EB8A4: .word ov29_0237C91E
_022EB8A8: .word ov29_0237C920
_022EB8AC: .word ov29_0237C922
	arm_func_end AddDungeonSubMenuOption

	arm_func_start ov29_022EB8B0
ov29_022EB8B0: ; 0x022EB8B0
	ldr r1, _022EB8EC ; =ov29_0237C918
	mov r3, #0
	ldr ip, [r1]
	ldr r2, _022EB8F0 ; =ov29_0237C91C
	b _022EB8DC
_022EB8C4:
	mov r1, r3, lsl #3
	ldrh r1, [r2, r1]
	cmp r0, r1
	moveq r0, r3
	bxeq lr
	add r3, r3, #1
_022EB8DC:
	cmp r3, ip
	blt _022EB8C4
	mvn r0, #0
	bx lr
	.align 2, 0
_022EB8EC: .word ov29_0237C918
_022EB8F0: .word ov29_0237C91C
	arm_func_end ov29_022EB8B0

	arm_func_start DisableDungeonSubMenuOption
DisableDungeonSubMenuOption: ; 0x022EB8F4
	stmdb sp!, {r3, lr}
	ldr r1, _022EB938 ; =ov29_0237C918
	mov ip, #0
	ldr lr, [r1]
	ldr r2, _022EB93C ; =ov29_0237C91C
	b _022EB92C
_022EB90C:
	mov r3, ip, lsl #3
	ldrh r1, [r2, r3]
	cmp r0, r1
	ldreq r0, _022EB940 ; =ov29_0237C920
	moveq r1, #0
	streqb r1, [r0, r3]
	ldmeqia sp!, {r3, pc}
	add ip, ip, #1
_022EB92C:
	cmp ip, lr
	blt _022EB90C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EB938: .word ov29_0237C918
_022EB93C: .word ov29_0237C91C
_022EB940: .word ov29_0237C920
	arm_func_end DisableDungeonSubMenuOption

	arm_func_start ov29_022EB944
ov29_022EB944: ; 0x022EB944
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldr r4, [r0, #0xb4]
	beq _022EB964
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_022EB964:
	ldrh r0, [r4, #0x4a]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	cmp r0, #5
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022EB944

	arm_func_start ov29_022EB9A0
ov29_022EB9A0: ; 0x022EB9A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _022EBA64 ; =ov29_0237C918
	mov r3, #0
	ldr ip, [r0]
	b _022EBA54
_022EB9B8:
	add lr, r3, #1
	mov r2, r3, lsl #3
	ldr r1, _022EBA68 ; =ov29_0237C91C
	ldr r0, _022EBA6C ; =ov29_02352074
	b _022EBA48
_022EB9CC:
	mov r4, lr, lsl #3
	ldrh r5, [r1, r2]
	ldrh r4, [r1, r4]
	add r5, r0, r5, lsl #3
	add r4, r0, r4, lsl #3
	ldr r5, [r5, #4]
	ldr r4, [r4, #4]
	cmp r5, r4
	ble _022EBA44
	add r6, sp, #0
	add r7, r1, r2
	mov r5, #4
_022EB9FC:
	ldrh r4, [r7], #2
	subs r5, r5, #1
	strh r4, [r6], #2
	bne _022EB9FC
	add r7, r1, lr, lsl #3
	add r6, r1, r2
	mov r5, #4
_022EBA18:
	ldrh r4, [r7], #2
	subs r5, r5, #1
	strh r4, [r6], #2
	bne _022EBA18
	add r7, sp, #0
	add r6, r1, lr, lsl #3
	mov r5, #4
_022EBA34:
	ldrh r4, [r7], #2
	subs r5, r5, #1
	strh r4, [r6], #2
	bne _022EBA34
_022EBA44:
	add lr, lr, #1
_022EBA48:
	cmp lr, ip
	blt _022EB9CC
	add r3, r3, #1
_022EBA54:
	cmp r3, ip
	blt _022EB9B8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022EBA64: .word ov29_0237C918
_022EBA68: .word ov29_0237C91C
_022EBA6C: .word ov29_02352074
	arm_func_end ov29_022EB9A0

	arm_func_start ov29_022EBA70
ov29_022EBA70: ; 0x022EBA70
	ldr r0, _022EBA80 ; =ov29_0237C918
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_022EBA80: .word ov29_0237C918
	arm_func_end ov29_022EBA70

	arm_func_start ov29_022EBA84
ov29_022EBA84: ; 0x022EBA84
	ldr r0, _022EBA90 ; =ov29_0237C918
	ldr r0, [r0]
	bx lr
	.align 2, 0
_022EBA90: .word ov29_0237C918
	arm_func_end ov29_022EBA84

	arm_func_start ov29_022EBA94
ov29_022EBA94: ; 0x022EBA94
	mov r2, #0x1b
	strh r2, [r0]
	mov r2, #0
	strb r2, [r0, #4]
	strb r2, [r0, #0xa]
	strb r1, [r0, #4]
	bx lr
	arm_func_end ov29_022EBA94

	arm_func_start ov29_022EBAB0
ov29_022EBAB0: ; 0x022EBAB0
	ldrb ip, [sp]
	cmp ip, #0
	cmpeq r3, #0
	ldrne r0, _022EBB48 ; =ov29_0237C96C
	movne r2, #0x80
	strneb r2, [r0]
	bne _022EBB30
	cmp r2, #0
	ldreq r2, _022EBB48 ; =ov29_0237C96C
	addeq r0, r0, #1
	streqb r0, [r2]
	beq _022EBB30
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _022EBB20
_022EBAEC: ; jump table
	b _022EBB20 ; case 0
	b _022EBB00 ; case 1
	b _022EBB08 ; case 2
	b _022EBB10 ; case 3
	b _022EBB18 ; case 4
_022EBB00:
	mov r2, #0
	b _022EBB24
_022EBB08:
	mov r2, #1
	b _022EBB24
_022EBB10:
	mov r2, #2
	b _022EBB24
_022EBB18:
	mov r2, #3
	b _022EBB24
_022EBB20:
	mov r2, #0
_022EBB24:
	ldr r0, _022EBB48 ; =ov29_0237C96C
	add r2, r2, #0x90
	strb r2, [r0]
_022EBB30:
	ldrsh r2, [r1]
	ldr r0, _022EBB48 ; =ov29_0237C96C
	strh r2, [r0, #2]
	ldrsh r1, [r1, #2]
	strh r1, [r0, #4]
	bx lr
	.align 2, 0
_022EBB48: .word ov29_0237C96C
	arm_func_end ov29_022EBAB0

	arm_func_start ov29_022EBB4C
ov29_022EBB4C: ; 0x022EBB4C
	ldr r0, _022EBB64 ; =ov29_0237C96C
	mov r1, #0
	strb r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	bx lr
	.align 2, 0
_022EBB64: .word ov29_0237C96C
	arm_func_end ov29_022EBB4C

	arm_func_start ov29_022EBB68
ov29_022EBB68: ; 0x022EBB68
	ldr r1, _022EBB88 ; =ov29_0237C96C
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	bx lr
	.align 2, 0
_022EBB88: .word ov29_0237C96C
	arm_func_end ov29_022EBB68

	arm_func_start ov29_022EBB8C
ov29_022EBB8C: ; 0x022EBB8C
	ldr r0, _022EBB94 ; =ov29_0237C96C
	bx lr
	.align 2, 0
_022EBB94: .word ov29_0237C96C
	arm_func_end ov29_022EBB8C

	arm_func_start ov29_022EBB98
ov29_022EBB98: ; 0x022EBB98
	ldr r0, _022EBBA4 ; =ov29_0237C96C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_022EBBA4: .word ov29_0237C96C
	arm_func_end ov29_022EBB98

	arm_func_start ov29_022EBBA8
ov29_022EBBA8: ; 0x022EBBA8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl SetMonsterActionFields
	ldr r0, _022EBBE4 ; =ov29_0237C96C
	mov r1, #0
	ldrh r2, [r0]
	strh r2, [r4, #4]
	ldrh r2, [r0, #2]
	strh r2, [r4, #6]
	ldrh r0, [r0, #4]
	strh r0, [r4, #8]
	strb r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0xe]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EBBE4: .word ov29_0237C96C
	arm_func_end ov29_022EBBA8

	arm_func_start ov29_022EBBE8
ov29_022EBBE8: ; 0x022EBBE8
	stmdb sp!, {r4, lr}
	mov r1, #0xc
	mov r4, r0
	bl SetMonsterActionFields
	ldr r0, _022EBC28 ; =ov29_0237C96C
	mov r1, #0
	ldrh r2, [r0]
	strh r2, [r4, #4]
	ldrh r2, [r0, #2]
	strh r2, [r4, #6]
	ldrh r0, [r0, #4]
	strh r0, [r4, #8]
	strb r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0xe]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022EBC28: .word ov29_0237C96C
	arm_func_end ov29_022EBBE8

	arm_func_start ov29_022EBC2C
ov29_022EBC2C: ; 0x022EBC2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0x1d
	mov r6, r0
	mov r4, r2
	bl SetMonsterActionFields
	strb r5, [r6, #4]
	strb r4, [r6, #0xa]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov29_022EBC2C

	arm_func_start SetActionRegularAttack
SetActionRegularAttack: ; 0x022EBC50
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x32
	mov r5, r0
	bl SetMonsterActionFields
	cmp r4, #0xff
	andne r0, r4, #7
	strneb r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetActionRegularAttack

	arm_func_start SetActionStruggle
SetActionStruggle: ; 0x022EBC74
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0x17
	mov r5, r0
	bl SetMonsterActionFields
	cmp r4, #0xff
	andne r0, r4, #7
	strneb r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetActionStruggle

	arm_func_start SetActionUseMovePlayer
SetActionUseMovePlayer: ; 0x022EBC98
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0x14
	mov r6, r0
	mov r4, r2
	bl SetMonsterActionFields
	strb r5, [r6, #4]
	strb r4, [r6, #0xa]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetActionUseMovePlayer

	arm_func_start SetActionUseMoveAi
SetActionUseMoveAi: ; 0x022EBCBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0x15
	mov r6, r0
	mov r4, r2
	bl SetMonsterActionFields
	cmp r4, #0xff
	strb r5, [r6, #4]
	andne r0, r4, #7
	strneb r0, [r6, #2]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetActionUseMoveAi

	arm_func_start ov29_022EBCE8
ov29_022EBCE8: ; 0x022EBCE8
	ldrh r1, [r0]
	cmp r1, #0x15
	ldreqb r0, [r0, #4]
	bxeq lr
	cmp r1, #0x14
	ldreqb r0, [r0, #0xa]
	mvnne r0, #0
	bx lr
	arm_func_end ov29_022EBCE8

	arm_func_start RunFractionalTurn
RunFractionalTurn: ; 0x022EBD08
#ifdef JAPAN
#define RUN_FRACTIONAL_TURN_OFFSET -0xA4
#define RUN_FRACTIONAL_TURN_OFFSET_2 -4
#else
#define RUN_FRACTIONAL_TURN_OFFSET 0
#define RUN_FRACTIONAL_TURN_OFFSET_2 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r4, r0
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	bl TrySpawnMonsterAndActivatePlusMinus
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	mov r0, r4
	bl RunLeaderTurn
	mov r4, r0
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	cmp r4, #0
	beq _022EBD60
	bl DecrementWindCounter
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
_022EBD60:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	bl GetLeader
	mov r8, r0
	bl ov29_02348FD8
	mov r5, #0
	b _022EBECC
_022EBD80:
	ldr r0, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r4, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r4
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EBEC8
	ldr r6, [r4, #0xb4]
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _022EBEC8
	bl IsFloorOver
	cmp r0, #0
	bne _022EBED4
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1, #0xc4]
	bl sub_01FFBDF4
	bl TryActivateArtificialWeatherAbilities
	mov r1, #0
	mov r0, r4
	strb r1, [r6, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl CalcSpeedStageWrapper
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	ldr r3, _022EC300 ; =FRACTIONAL_TURN_SEQUENCE
	ldr r2, [r1]
	mov r1, #0x32
	add r2, r2, #0x700
	ldrsh r2, [r2, #0x80]
	mla r1, r0, r1, r3
	mov r0, r2, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _022EBEC8
	ldrb r0, [r6, #0x152 + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmp r0, #0
	bne _022EBEC8
	ldrh r0, [r6]
	tst r0, #0x8000
	bne _022EBEC8
	tst r0, #0x4000
	bicne r0, r0, #0x4000
	strneh r0, [r6]
	bne _022EBEC8
	mov r1, #0
	mov r0, r4
	strb r1, [r6, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl TickStatusAndHealthRegen
	mov r0, r4
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EBEC8
	mov r0, r4
	bl EnemyEvolution
	mov r0, r4
	mov r1, #1
	bl TryRestoreRoostTyping
	mov sb, #0
	mov r7, sb
	mov r6, sb
	b _022EBEC0
_022EBE80:
	mov r0, r4
	mov r1, r7
	bl RunMonsterAi
	bl IsFloorOver
	cmp r0, #0
	bne _022EBEC8
	mov r0, r4
	bl ExecuteMonsterAction
	cmp r0, #0
	beq _022EBEC8
	mov r0, r6
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	bne _022EBEC8
	add sb, sb, #1
_022EBEC0:
	cmp sb, #3
	blt _022EBE80
_022EBEC8:
	add r5, r5, #1
_022EBECC:
	cmp r5, #4
	blt _022EBD80
_022EBED4:
	mov sb, #0
_022EBED8:
	mov r3, #0
	mov sl, r3
	add r2, sp, #0
_022EBEE4:
	mov r0, r3, lsl #3
	str sl, [r2, r3, lsl #3]
	add r3, r3, #1
	add r1, r2, r3, lsl #3
	add r0, r2, r0
	str r1, [r0, #4]
	cmp r3, #3
	blt _022EBEE4
	str sl, [sp, #0x18]
	str sl, [sp, #0x1c]
	add r4, sp, #0x20
	add fp, sp, #0
	mov r6, #0
_022EBF18:
	ldr r0, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r1, [r7, #0xb4]
	ldrneb r0, [r1, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EBFA8
	ldrb r0, [r1, #7]
	cmp r0, #0
	strneb r6, [r1, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	strneb r6, [r1, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bne _022EBFA8
	ldrsh r1, [r8, #6]
	ldrsh r0, [r7, #6]
	sub r0, r1, r0
	bl abs
	ldrsh r2, [r8, #4]
	ldrsh r1, [r7, #4]
	mov r5, r0
	sub r0, r2, r1
	bl abs
	cmp r0, r5
	movle r0, r5
	cmp r0, #3
	movge r0, #2
	add r2, fp, r0, lsl #3
	ldr r1, [r2, #4]
	add r0, r4, sl, lsl #3
	str r7, [r4, sl, lsl #3]
	str r1, [r0, #4]
	str r0, [r2, #4]
_022EBFA8:
	add sl, sl, #1
	cmp sl, #4
	blt _022EBF18
	mov r7, #0
	add r5, sp, #0
	mov sl, #1
	mov r6, r7
	b _022EC00C
_022EBFC8:
	ldr r4, [r5]
	cmp r4, #0
	beq _022EC008
	ldr r2, [r4, #0xb4]
	mov r0, r4
	strb sl, [r2, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	mov r1, sl
	strb r7, [r2, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl RunMonsterAi
	mov r0, r4
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, r6
	bl TryForcedLoss
	mov r0, r4
	bl EntityIsValid__022EC608
_022EC008:
	ldr r5, [r5, #4]
_022EC00C:
	cmp r5, #0
	bne _022EBFC8
	add sb, sb, #1
	cmp sb, #3
	blt _022EBED8
	bl IsFloorOver
	cmp r0, #0
	bne _022EC094
	mov r4, #0
	ldr r5, _022EC2FC ; =DUNGEON_PTR
	mov r6, r4
_022EC038:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb28 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r0, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EC088
	mov r0, r7
	bl ov29_0230FC24
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC088
	mov r0, r7
	bl EnemyEvolution
	strb r6, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
_022EC088:
	add r4, r4, #1
	cmp r4, #4
	blt _022EC038
_022EC094:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	mov sb, #0
	mov r5, sb
	mov r7, sb
	ldr r6, _022EC300 ; =FRACTIONAL_TURN_SEQUENCE
	mov fp, #0x32
	ldr r4, _022EC2FC ; =DUNGEON_PTR
	b _022EC1C0
_022EC0BC:
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb38 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r8
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC1BC
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
	ldr sl, [r8, #0xb4]
	ldr r1, [r4]
	mov r0, r8
	str r8, [r1, #0xc4]
	bl sub_01FFBDF4
	bl TryActivateArtificialWeatherAbilities
	ldrh r0, [sl]
	tst r0, #0x8000
	bne _022EC1BC
	tst r0, #0x4000
	bicne r0, r0, #0x4000
	strneh r0, [sl]
	bne _022EC1BC
	mov r0, r8
	strb r7, [sl, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl CalcSpeedStageWrapper
	ldr r2, [r4]
	mla r1, r0, fp, r6
	add r0, r2, #0x700
	ldrsh r0, [r0, #0x80]
	mov r0, r0, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _022EC1BC
	ldrb r0, [sl, #0x152 + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmp r0, #0
	bne _022EC1BC
	ldrh r1, [sl]
	mov r0, r8
	bic r1, r1, #0xc000
	strh r1, [sl]
	strb r5, [sl, #0x14f + RUN_FRACTIONAL_TURN_OFFSET_2]
	bl TickStatusAndHealthRegen
	mov r0, r8
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC1BC
	mov r0, r8
	bl EnemyEvolution
	mov r0, r8
	mov r1, #0
	bl RunMonsterAi
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
	mov r0, r8
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	bne _022EC1C8
_022EC1BC:
	add sb, sb, #1
_022EC1C0:
	cmp sb, #0x10
	blt _022EC0BC
_022EC1C8:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC23C
	mov r4, #0
	ldr r5, _022EC2FC ; =DUNGEON_PTR
	mov r6, r4
_022EC1E0:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r7, [r0, #0xb38 + RUN_FRACTIONAL_TURN_OFFSET]
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	ldrne r8, [r7, #0xb4]
	ldrneb r0, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
	cmpne r0, #0
	beq _022EC230
	mov r0, r7
	bl ov29_0230FC24
	mov r0, r7
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC230
	mov r0, r7
	bl EnemyEvolution
	strb r6, [r8, #0x14e + RUN_FRACTIONAL_TURN_OFFSET_2]
_022EC230:
	add r4, r4, #1
	cmp r4, #0x10
	blt _022EC1E0
_022EC23C:
	bl IsFloorOver
	cmp r0, #0
	bne _022EC2F4
	ldr r4, _022EC2FC ; =DUNGEON_PTR
	ldr r1, _022EC304 ; =ov29_023522B6
	ldr r0, [r4]
	add r0, r0, #0x700
	ldrsh r0, [r0, #0x80]
	add r0, r0, #1
	mov r0, r0, lsl #1
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _022EC2C4
	mov r5, #0
	b _022EC2A4
_022EC278:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb78 + RUN_FRACTIONAL_TURN_OFFSET]
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC2A0
	mov r0, #0
	bl DisplayActions
	b _022EC2AC
_022EC2A0:
	add r5, r5, #1
_022EC2A4:
	cmp r5, #0x14
	blt _022EC278
_022EC2AC:
	mov r0, #1
	mov r1, #0
	bl TryActivateWeather
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
_022EC2C4:
	ldr r1, _022EC2FC ; =DUNGEON_PTR
	ldr r0, [r1]
	add r0, r0, #0x700
	ldrsh r2, [r0, #0x80]
	add r2, r2, #1
	strh r2, [r0, #0x80]
	ldr r0, [r1]
	add r0, r0, #0x700
	ldrsh r1, [r0, #0x80]
	cmp r1, #0x18
	moveq r1, #0
	streqh r1, [r0, #0x80]
_022EC2F4:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC2FC: .word DUNGEON_PTR
_022EC300: .word FRACTIONAL_TURN_SEQUENCE
_022EC304: .word ov29_023522B6
	arm_func_end RunFractionalTurn

	arm_func_start RunLeaderTurn
RunLeaderTurn: ; 0x022EC308
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl GetLeader
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov29_02348FD8
	bl TryActivateArtificialWeatherAbilities
	mov r0, r4
	bl CalcSpeedStageWrapper
	ldr r1, _022EC600 ; =DUNGEON_PTR
	ldr r3, _022EC604 ; =FRACTIONAL_TURN_SEQUENCE
	ldr r2, [r1]
	mov r1, #0x32
	add r2, r2, #0x700
	mla r1, r0, r1, r3
	ldrsh r2, [r2, #0x80]
	mov r0, r2, lsl #1
	ldrsh r0, [r0, r1]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x14e]
#else
	ldrb r0, [r0, #0x152]
#endif
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r4
	mov r1, #1
	bl TryRestoreRoostTyping
_022EC380:
	bl GetLeader
	movs sb, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_01FFBDF4
	mov r0, #0
	bl DisplayActions
	cmp r0, #0
	bne _022EC3C8
	ldr r0, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x78b]
	cmp r0, #0
	ldreqb r0, [r1, #0x78e]
	cmpeq r0, #0
	beq _022EC3C8
	mov r0, #0xc
	bl AdvanceFrame
_022EC3C8:
	cmp sb, #0
	moveq r0, #0
	beq _022EC3E8
	ldr r0, [sb]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_022EC3E8:
	cmp r0, #0
	ldrne r0, [sb, #0xb4]
	movne r1, #0
	strneb r1, [r0, #0x101]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	cmp sl, #0
	str sb, [r2, #0xc4]
	ldr r0, [r0]
	movne sl, r1
	str r1, [r0, #0xc8]
	bne _022EC434
	mov r0, sb
	bl TickStatusAndHealthRegen
_022EC434:
	bl IsFloorOver
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov29_022E81F8
	mov r0, sb
	bl EnemyEvolution
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x11]
	bl SetLeaderAction
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x11]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	bl ExecuteMonsterAction
	bl ov29_022EF9C8
	mov r0, #0
	bl TryForcedLoss
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sb, #0xb4]
	ldrh r0, [r1]
	tst r0, #0x8000
	bicne r0, r0, #0x8000
	strneh r0, [r1]
	ldrneh r0, [r1]
	orrne r0, r0, #0x4000
	strneh r0, [r1]
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r4]
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _022EC59C
	mov r7, #0
	strb r7, [r1, #0x10]
	mov r5, r7
	mov fp, r7
	b _022EC594
_022EC500:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xad4]
#else
	ldr r6, [r0, #0xb78]
#endif
	mov r0, r6
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC590
	ldr r8, [r6, #0xb4]
	ldrh r0, [r8]
	tst r0, #0x8000
	beq _022EC590
	bl IsFloorOver
	cmp r0, #0
	bne _022EC59C
	mov r0, r6
	bl TickStatusAndHealthRegen
	mov r0, r6
	bl EntityIsValid__022EC608
	cmp r0, #0
	beq _022EC590
	mov r0, r6
	bl EnemyEvolution
	mov r0, r6
	mov r1, r5
	bl RunMonsterAi
	mov r0, r6
	bl ExecuteMonsterAction
	mov r0, fp
	bl TryForcedLoss
	ldrh r0, [r8]
	bic r0, r0, #0x8000
	strh r0, [r8]
	ldrh r0, [r8]
	orr r0, r0, #0x4000
	strh r0, [r8]
_022EC590:
	add r7, r7, #1
_022EC594:
	cmp r7, #0x14
	blt _022EC500
_022EC59C:
	bl IsFloorOver
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022EC600 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0xc8]
	cmp r0, #0
	beq _022EC5DC
	bl ChangeLeader
	ldr r0, _022EC600 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	mov sl, #1
	str r1, [r0, #0xc8]
	b _022EC380
_022EC5DC:
	ldr r0, [sb, #0xb4]
	ldrb r0, [r0, #0x101]
	cmp r0, #0
	addne r0, r1, #0x700
	movne r1, #0
	strneh r1, [r0, #0x80]
	bne _022EC380
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EC600: .word DUNGEON_PTR
_022EC604: .word FRACTIONAL_TURN_SEQUENCE
	arm_func_end RunLeaderTurn
