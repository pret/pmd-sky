	.include "asm/macros.inc"
	.include "main_0200CAFC.inc"

	.text

	arm_func_start GetItemMoveId16
GetItemMoveId16: ; 0x0200CAFC
	stmdb sp!, {r3, lr}
	bl GetItemMoveId
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end GetItemMoveId16

	arm_func_start IsThrownItem
IsThrownItem: ; 0x0200CB10
	stmdb sp!, {r3, lr}
	bl GetItemCategory
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsThrownItem

	arm_func_start IsNotMoney
IsNotMoney: ; 0x0200CB2C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0xb7
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsNotMoney

	arm_func_start IsEdible
IsEdible: ; 0x0200CB4C
	stmdb sp!, {r3, lr}
	bl GetItemCategory
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsEdible

	arm_func_start IsHM
IsHM: ; 0x0200CB70
	ldr r2, _0200CBF0 ; =0x0000011D
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	add r1, r2, #1
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r2, #2
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x120
	moveq r0, #1
	bxeq lr
	add r1, r2, #5
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r2, #6
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x124
	moveq r0, #1
	bxeq lr
	add r1, r2, #4
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200CBF0: .word 0x0000011D
	arm_func_end IsHM

	arm_func_start IsGummi
IsGummi: ; 0x0200CBF4
	cmp r0, #0x77
	movlt r0, #0
	bxlt lr
	cmp r0, #0x88
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsGummi

	arm_func_start IsAuraBow
IsAuraBow: ; 0x0200CC14
	cmp r0, #0x1ac
	blt _0200CC2C
	ldr r1, _0200CC34 ; =0x000001BB
	cmp r0, r1
	movle r0, #1
	bxle lr
_0200CC2C:
	mov r0, #0
	bx lr
	.align 2, 0
_0200CC34: .word 0x000001BB
	arm_func_end IsAuraBow

	arm_func_start IsLosableItem
IsLosableItem: ; 0x0200CC38
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200CC7C
	ldrsh r0, [r4, #4]
	bl IsAuraBow
	cmp r0, #0
	beq _0200CC74
	ldrb r0, [r4]
	tst r0, #2
	beq _0200CC7C
_0200CC74:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200CC7C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsLosableItem

	arm_func_start IsTreasureBox
IsTreasureBox: ; 0x0200CC84
	stmdb sp!, {r3, lr}
	bl GetItemCategory
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTreasureBox

	arm_func_start IsStorableItem
IsStorableItem: ; 0x0200CCA8
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0xb7
	moveq r0, #0
	bxeq lr
	cmp r0, #0xbb
	moveq r0, #0
	bxeq lr
	cmp r0, #0xb2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsStorableItem

	arm_func_start IsShoppableItem
IsShoppableItem: ; 0x0200CCE0
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xb7
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #9
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x39
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x3a
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x73
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x88
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xb9
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xad
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xae
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xa
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0xb0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	cmp r4, #0x5d
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl GetItemSellPrice
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl GetItemBuyPrice
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsShoppableItem

	arm_func_start IsValidTargetItem
IsValidTargetItem: ; 0x0200CDAC
	cmp r0, #0x16c
	movge r0, #1
	bxge lr
	mov ip, #0
	ldr r2, _0200CDF0 ; =_020A18BC
	ldr r1, _0200CDF4 ; =0x00000578
	b _0200CDD8
_0200CDC8:
	cmp r0, r3
	moveq r0, #1
	bxeq lr
	add ip, ip, #1
_0200CDD8:
	mov r3, ip, lsl #1
	ldrsh r3, [r2, r3]
	cmp r3, r1
	bne _0200CDC8
	mov r0, #0
	bx lr
	.align 2, 0
_0200CDF0: .word _020A18BC
_0200CDF4: .word 0x00000578
	arm_func_end IsValidTargetItem

	arm_func_start IsItemUsableNow
IsItemUsableNow: ; 0x0200CDF8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4]
	tst r0, #2
	beq _0200CE6C
	ldrsh r0, [r4, #4]
	bl GetItemCategory
	cmp r0, #5
	ldrnesh r0, [r4, #4]
	cmpne r0, #0x47
	cmpne r0, #0x4d
	cmpne r0, #0x58
	cmpne r0, #0x59
	cmpne r0, #0x5d
	cmpne r0, #0x64
	cmpne r0, #0x65
	cmpne r0, #0x66
	cmpne r0, #0x67
	cmpne r0, #0x6c
	beq _0200CE64
	sub r0, r0, #0x77
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0x11
	bhi _0200CE6C
_0200CE64:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0200CE6C:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end IsItemUsableNow

	arm_func_start IsTicketItem
IsTicketItem: ; 0x0200CE74
	sub r0, r0, #0xa9
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsTicketItem

	arm_func_start InitItem
InitItem: ; 0x0200CE9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	beq _0200CF44
	mov r0, #1
	strb r0, [r7]
	mov r0, r6
	strh r6, [r7, #4]
	mov r1, #0
	strb r1, [r7, #1]
	bl IsThrownItem
	cmp r0, #0
	mov r0, r6
	beq _0200CF04
	mov r1, #1
	bl GetThrownItemQuantityLimit
	mov r5, r0
	mov r0, r6
	mov r1, #0
	bl GetThrownItemQuantityLimit
	mov r1, r5
	bl RandRangeSafe
	strh r0, [r7, #2]
	b _0200CF30
_0200CF04:
	bl GetItemCategory
	cmp r0, #6
	moveq r0, #1
	streqh r0, [r7, #2]
	beq _0200CF30
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	strlsh r5, [r7, #2]
	movhi r0, #0
	strhih r0, [r7, #2]
_0200CF30:
	cmp r4, #0
	ldrneb r0, [r7]
	orrne r0, r0, #8
	strneb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0200CF44:
	mov r0, #0
	strb r0, [r7]
	strh r6, [r7, #4]
	strh r0, [r7, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end InitItem

	arm_func_start InitStandardItem
InitStandardItem: ; 0x0200CF58
	ldr ip, _0200CF68 ; =InitItem
	mov r3, r2
	mov r2, #0
	bx ip
	.align 2, 0
_0200CF68: .word InitItem
	arm_func_end InitStandardItem

	arm_func_start sub_0200CF6C
sub_0200CF6C: ; 0x0200CF6C
	ldr ip, _0200CF74 ; =InitItem
	bx ip
	.align 2, 0
_0200CF74: .word InitItem
	arm_func_end sub_0200CF6C

	arm_func_start InitBulkItem
InitBulkItem: ; 0x0200CF78
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r1
	mov r6, r0
	strh r5, [r6]
	beq _0200CFE4
	mov r0, r5
	bl IsThrownItem
	cmp r0, #0
	mov r0, r5
	beq _0200CFC8
	mov r1, #1
	bl GetThrownItemQuantityLimit
	mov r4, r0
	mov r0, r5
	mov r1, #0
	bl GetThrownItemQuantityLimit
	mov r1, r4
	bl RandRangeSafe
	strh r0, [r6, #2]
	ldmia sp!, {r4, r5, r6, pc}
_0200CFC8:
	bl GetItemCategory
	cmp r0, #6
	moveq r0, #1
	streqh r0, [r6, #2]
	movne r0, #0
	strneh r0, [r6, #2]
	ldmia sp!, {r4, r5, r6, pc}
_0200CFE4:
	mov r0, #0
	strh r0, [r6, #2]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end InitBulkItem

	arm_func_start BulkItemToItem
BulkItemToItem: ; 0x0200CFF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrsh r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _0200D098
	mov r0, #1
	strb r0, [r5]
	ldrsh r1, [r4]
	mov r0, #0
	strh r1, [r5, #4]
	strb r0, [r5, #1]
	ldrsh r0, [r5, #4]
	bl IsThrownItem
	cmp r0, #0
	ldrneh r0, [r4, #2]
	strneh r0, [r5, #2]
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #4]
	bl GetItemCategory
	cmp r0, #0xe
	bgt _0200D078
	subs r1, r0, #6
	addpl pc, pc, r1, lsl #2
	b _0200D08C
_0200D054: ; jump table
	b _0200D080 ; case 0
	b _0200D08C ; case 1
	b _0200D08C ; case 2
	b _0200D08C ; case 3
	b _0200D08C ; case 4
	b _0200D08C ; case 5
	b _0200D080 ; case 6
	b _0200D080 ; case 7
	b _0200D080 ; case 8
_0200D078:
	cmp r0, #0xbb
	bne _0200D08C
_0200D080:
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
_0200D08C:
	mov r0, #0
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
_0200D098:
	bl ItemZInit
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end BulkItemToItem

	arm_func_start ItemToBulkItem
ItemToBulkItem: ; 0x0200D0A0
	ldrb r2, [r1]
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	ldrnesh r2, [r1, #4]
	strneh r2, [r0]
	ldrneh r1, [r1, #2]
	moveq r1, #0
	streqh r1, [r0]
	strh r1, [r0, #2]
	bx lr
	arm_func_end ItemToBulkItem

	arm_func_start GetDisplayedBuyPrice
GetDisplayedBuyPrice: ; 0x0200D0D0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4, #4]
	cmp r1, #0xb7
	bne _0200D0EC
	bl sub_0200D8AC
	ldmia sp!, {r4, pc}
_0200D0EC:
	mov r0, r1
	bl IsThrownItem
	cmp r0, #0
	ldrsh r0, [r4, #4]
	beq _0200D110
	bl GetItemBuyPrice
	ldrh r1, [r4, #2]
	mul r0, r1, r0
	ldmia sp!, {r4, pc}
_0200D110:
	bl GetItemBuyPrice
	ldmia sp!, {r4, pc}
	arm_func_end GetDisplayedBuyPrice

	arm_func_start GetDisplayedSellPrice
GetDisplayedSellPrice: ; 0x0200D118
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r1, [r4, #4]
	cmp r1, #0xb7
	bne _0200D134
	bl sub_0200D8AC
	ldmia sp!, {r4, pc}
_0200D134:
	mov r0, r1
	bl IsThrownItem
	cmp r0, #0
	ldrsh r0, [r4, #4]
	beq _0200D158
	bl GetItemSellPrice
	ldrh r1, [r4, #2]
	mul r0, r1, r0
	ldmia sp!, {r4, pc}
_0200D158:
	bl GetItemSellPrice
	ldmia sp!, {r4, pc}
	arm_func_end GetDisplayedSellPrice

	arm_func_start GetActualBuyPrice
GetActualBuyPrice: ; 0x0200D160
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsShoppableItem
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #4]
	bl IsThrownItem
	cmp r0, #0
	ldrsh r0, [r4, #4]
	beq _0200D1A0
	bl GetItemBuyPrice
	ldrh r1, [r4, #2]
	mul r0, r1, r0
	ldmia sp!, {r4, pc}
_0200D1A0:
	bl GetItemBuyPrice
	ldmia sp!, {r4, pc}
	arm_func_end GetActualBuyPrice

	arm_func_start GetActualSellPrice
GetActualSellPrice: ; 0x0200D1A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl IsShoppableItem
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #4]
	bl IsThrownItem
	cmp r0, #0
	ldrsh r0, [r4, #4]
	beq _0200D1E8
	bl GetItemSellPrice
	ldrh r1, [r4, #2]
	mul r0, r1, r0
	ldmia sp!, {r4, pc}
_0200D1E8:
	bl GetItemSellPrice
	ldmia sp!, {r4, pc}
	arm_func_end GetActualSellPrice

	arm_func_start sub_0200D1F0
sub_0200D1F0: ; 0x0200D1F0
	ldr ip, _0200D1F8 ; =sub_0200EB64
	bx ip
	.align 2, 0
_0200D1F8: .word sub_0200EB64
	arm_func_end sub_0200D1F0

	arm_func_start sub_0200D1FC
sub_0200D1FC: ; 0x0200D1FC
	ldr ip, _0200D204 ; =GetItemPaletteId
	bx ip
	.align 2, 0
_0200D204: .word GetItemPaletteId
	arm_func_end sub_0200D1FC

	arm_func_start sub_0200D208
sub_0200D208: ; 0x0200D208
	ldr ip, _0200D210 ; =GetItemActionName
	bx ip
	.align 2, 0
_0200D210: .word GetItemActionName
	arm_func_end sub_0200D208

	arm_func_start sub_0200D214
sub_0200D214: ; 0x0200D214
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetItemName
	mov r1, r0
	add r0, sp, #6
	mov r2, #0x50
	bl strncpy
	mov r2, #0
	mov r1, r5
	add r0, sp, #0
	mov r3, r2
	bl InitItem
	mov r1, #1
	strh r1, [sp, #2]
	mov r0, r6
	mov r3, r4
	add r1, sp, #6
	add r2, sp, #0
	bl sub_0200D688
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200D214

	arm_func_start FindItemInInventory
FindItemInInventory: ; 0x0200D278
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200D30C ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r6, [r1]
	mov r3, r5
	mov ip, #1
	mov r1, #6
	b _0200D2D0
_0200D298:
	mul lr, r5, r1
	ldr r4, [r6, #0x384]
	ldrb r2, [r4, lr]
	add r4, r4, lr
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _0200D2CC
	ldrsh r2, [r4, #4]
	cmp r0, r2
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, pc}
_0200D2CC:
	add r5, r5, #1
_0200D2D0:
	cmp r5, #0x32
	blt _0200D298
	mov r2, #0
	b _0200D2FC
_0200D2E0:
	add r1, r6, r2, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r0, r1
	addeq r0, r2, #0x8000
	ldmeqia sp!, {r4, r5, r6, pc}
	add r2, r2, #1
_0200D2FC:
	cmp r2, #0x3e8
	blt _0200D2E0
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200D30C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end FindItemInInventory

	arm_func_start sub_0200D310
sub_0200D310: ; 0x0200D310
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa0
	mov sb, r1
	mov sl, r0
	ldrsh r0, [sb, #4]
	mov r8, r2
	mov r7, r3
	mov r4, #0
	bl GetItemCategory
	mov r5, r4
	mov r6, r0
	cmp r8, #0
	ldrneb r0, [r8, #8]
	mov fp, r5
	cmpne r0, #0
	ldrsh r0, [sb, #4]
	movne r4, #1
	bl GetItemName
	mov r2, r0
	cmp r6, #0
	bne _0200D3B4
	cmp r4, #0
	add r0, sp, #0x50
	beq _0200D394
	cmp r7, #0
	ldrh r3, [sb, #2]
	beq _0200D388
	ldr r1, _0200D60C ; =_02097F34
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D388:
	ldr r1, _0200D610 ; =_02097F50
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D394:
	cmp r7, #0
	beq _0200D3A8
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3A8:
	ldr r1, _0200D618 ; =_02097F68
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3B4:
	cmp r6, #1
	bne _0200D40C
	cmp r4, #0
	add r0, sp, #0x50
	beq _0200D3EC
	cmp r7, #0
	ldrh r3, [sb, #2]
	beq _0200D3E0
	ldr r1, _0200D60C ; =_02097F34
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3E0:
	ldr r1, _0200D610 ; =_02097F50
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3EC:
	cmp r7, #0
	beq _0200D400
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D400:
	ldr r1, _0200D618 ; =_02097F68
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D40C:
	add r0, r6, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0200D440
	cmp r7, #0
	add r0, sp, #0x50
	beq _0200D434
	ldr r1, _0200D61C ; =_02097F6C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D434:
	mov r1, r2
	bl strcpy
	b _0200D4F8
_0200D440:
	ldrsh r0, [sb, #4]
	cmp r0, #0xb7
	bne _0200D4AC
	mov r0, sb
	bl sub_0200D8AC
	mov r1, r0
	add r0, sp, #0
	bl sub_020238E0
	cmp r7, #0
	add r0, sp, #0x50
	add r2, sp, #0
	beq _0200D47C
	ldr r1, _0200D620 ; =_02097F7C
	bl SprintfStatic__0200D634
	b _0200D484
_0200D47C:
	ldr r1, _0200D624 ; =_02097F90
	bl SprintfStatic__0200D634
_0200D484:
	cmp r7, #0
	add r0, sp, #0x50
	add r2, sp, #0
	beq _0200D4A0
	ldr r1, _0200D620 ; =_02097F7C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4A0:
	ldr r1, _0200D624 ; =_02097F90
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4AC:
	cmp r6, #0xf
	add r0, sp, #0x50
	bne _0200D4D8
	cmp r7, #0
	beq _0200D4CC
	ldr r1, _0200D628 ; =_02097F9C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4CC:
	mov r1, r2
	bl strcpy
	b _0200D4F8
_0200D4D8:
	cmp r7, #0
	beq _0200D4EC
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4EC:
	mov r1, r2
	mov r2, #0x50
	bl strncpy
_0200D4F8:
	ldrb r0, [sb]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200D538
	ldr r1, _0200D62C ; =_02097FAC
	add r2, sp, #0x50
	mov r0, sl
	bl SprintfStatic__0200D634
	add r0, sp, #0x50
	mov r1, sl
	mov r2, #0x50
	bl strncpy
	mov fp, #1
	b _0200D564
_0200D538:
	ldrb r0, [sp, #0xc8]
	cmp r0, #0
	beq _0200D564
	ldr r1, _0200D630 ; =_02097FB8
	add r2, sp, #0x50
	mov r0, sl
	bl SprintfStatic__0200D634
	add r0, sp, #0x50
	mov r1, sl
	mov r2, #0x50
	bl strncpy
_0200D564:
	cmp r8, #0
	bne _0200D580
	add r1, sp, #0x50
	mov r0, sl
	mov r2, #0x50
	bl strncpy
	b _0200D600
_0200D580:
	ldrb r0, [r8, #4]
	cmp r0, #0
	beq _0200D5AC
	ldrb r0, [sb]
	tst r0, #0x10
	beq _0200D5AC
	cmp fp, #0
	movne r0, #0x35
	strneb r0, [sp, #0x54]
	moveq r0, #0x32
	streqb r0, [sp, #0x54]
_0200D5AC:
	ldr r0, [r8]
	add r1, sp, #0x50
	cmp r0, #1
	cmpne r0, #3
	bne _0200D5F0
	ldrb r0, [sb]
	tst r0, #2
	mov r0, sl
	beq _0200D5E4
	mov r2, sb
	mov r3, r8
	bl sub_0200D688
	mov r5, #1
	b _0200D600
_0200D5E4:
	mov r2, #0x50
	bl strncpy
	b _0200D600
_0200D5F0:
	mov r0, sl
	mov r2, sb
	mov r3, r8
	bl sub_0200D688
_0200D600:
	mov r0, r5
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200D60C: .word _02097F34
_0200D610: .word _02097F50
_0200D614: .word _02097F58
_0200D618: .word _02097F68
_0200D61C: .word _02097F6C
_0200D620: .word _02097F7C
_0200D624: .word _02097F90
_0200D628: .word _02097F9C
_0200D62C: .word _02097FAC
_0200D630: .word _02097FB8
	arm_func_end sub_0200D310

	arm_func_start SprintfStatic__0200D634
SprintfStatic__0200D634: ; 0x0200D634
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
	arm_func_end SprintfStatic__0200D634

	arm_func_start sub_0200D65C
sub_0200D65C: ; 0x0200D65C
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200D65C

	arm_func_start sub_0200D670
sub_0200D670: ; 0x0200D670
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200D670

	arm_func_start sub_0200D688
sub_0200D688: ; 0x0200D688
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	movs r4, r3
	mov r6, r0
	mov r5, r1
	bne _0200D6AC
	mov r2, #0x50
	bl strncpy
	b _0200D75C
_0200D6AC:
	ldr r0, [r4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0200D6E8
_0200D6BC: ; jump table
	b _0200D6E8 ; case 0
	b _0200D6D0 ; case 1
	b _0200D6D0 ; case 2
	b _0200D6DC ; case 3
	b _0200D6DC ; case 4
_0200D6D0:
	mov r0, r2
	bl GetDisplayedBuyPrice
	b _0200D6EC
_0200D6DC:
	mov r0, r2
	bl GetDisplayedSellPrice
	b _0200D6EC
_0200D6E8:
	mov r0, #0
_0200D6EC:
	cmp r0, #0
	bne _0200D708
	mov r0, r6
	mov r1, r5
	mov r2, #0x50
	bl strncpy
	b _0200D75C
_0200D708:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	add r1, sp, #4
	beq _0200D740
	mov r2, #1
	bl sub_0200D76C
	add r0, sp, #4
	str r0, [sp]
	ldrsh r3, [r4, #6]
	ldr r1, _0200D764 ; =_02097FC4
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0200D634
	b _0200D75C
_0200D740:
	mov r2, #0
	bl sub_0200D76C
	ldr r1, _0200D768 ; =_02097FE4
	add r3, sp, #4
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0200D634
_0200D75C:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200D764: .word _02097FC4
_0200D768: .word _02097FE4
	arm_func_end sub_0200D688

	arm_func_start sub_0200D76C
sub_0200D76C: ; 0x0200D76C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r3, #4]
	mov ip, lr
	mov r3, lr
_0200D784:
	ldr r5, _0200D818 ; =_02094D0C
	mov r6, #0
	ldr r5, [r5, r3, lsl #2]
	b _0200D79C
_0200D794:
	sub r0, r0, r5
	add r6, r6, #1
_0200D79C:
	cmp r0, r5
	bge _0200D794
	cmp r6, #9
	movgt r6, #9
	cmp r6, #0
	beq _0200D7D8
	ldrb r5, [r4, r6, lsl #1]
	add r6, r4, r6, lsl #1
	add ip, ip, #1
	strb r5, [r1]
	ldrb r5, [r6, #1]
	mov lr, #1
	strb r5, [r1, #1]
	add r1, r1, #2
	b _0200D80C
_0200D7D8:
	cmp lr, #0
	beq _0200D800
	ldrb r5, [r4, r6, lsl #1]
	add r6, r4, r6, lsl #1
	add ip, ip, #1
	strb r5, [r1]
	ldrb r5, [r6, #1]
	strb r5, [r1, #1]
	add r1, r1, #2
	b _0200D80C
_0200D800:
	cmp r2, #0
	movne r5, #0x7f
	strneb r5, [r1], #1
_0200D80C:
	add r3, r3, #1
	cmp r3, #5
	blt _0200D784
	ldr r2, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r2, [r2, #4]
	ldrb r4, [r2, r0, lsl #1]
	add r2, r2, r0, lsl #1
	add r0, ip, #1
	strb r4, [r1]
	ldrb r2, [r2, #1]
	strb r2, [r1, #1]
	strb r3, [r1, #2]
	ldmia sp!, {r4, r5, r6, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr lr, [r3, #4]
	ldr r8, _0200D818 ; =_02094D0C
	mov r3, ip
	mov sl, ip
	mov r7, #9
	mov r4, #0x7f
	mov r6, #1
	mov sb, ip
_0200D798:
	mov r5, sb
	ldr fp, [r8, sl, lsl #2]
	b _0200D7AC
_0200D7A4:
	sub r0, r0, fp
	add r5, r5, #1
_0200D7AC:
	cmp r0, fp
	bge _0200D7A4
	cmp r5, #9
	movgt r5, r7
	cmp r5, #0
	ldrneb r5, [lr, r5]
	movne ip, r6
	addne r3, r3, #1
	strneb r5, [r1], #1
	bne _0200D7F0
	cmp ip, #0
	ldrneb r5, [lr, r5]
	addne r3, r3, #1
	strneb r5, [r1], #1
	bne _0200D7F0
	cmp r2, #0
	strneb r4, [r1], #1
_0200D7F0:
	add sl, sl, #1
	cmp sl, #5
	blt _0200D798
	ldrb ip, [lr, r0]
	mov r2, #0
	add r0, r3, #1
	strb ip, [r1]
	strb r2, [r1, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_0200D814: .word BAG_ITEMS_PTR_MIRROR
_0200D818: .word _02094D0C
	arm_func_end sub_0200D76C

	arm_func_start ItemZInit
ItemZInit: ; 0x0200D81C
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strb r1, [r0]
	strb r1, [r0, #1]
	bx lr
	arm_func_end ItemZInit

	arm_func_start AreItemsEquivalent
AreItemsEquivalent: ; 0x0200D834
	ldrb ip, [r0]
	ldrb r3, [r1]
	and ip, ip, r2
	and r2, r3, r2
	cmp ip, r2
	movne r0, #0
	bxne lr
	ldrb r3, [r0, #1]
	ldrb r2, [r1, #1]
	cmp r3, r2
	movne r0, #0
	bxne lr
	ldrh r3, [r0, #2]
	ldrh r2, [r1, #2]
	cmp r3, r2
	movne r0, #0
	bxne lr
	ldrsh r2, [r0, #4]
	ldrsh r0, [r1, #4]
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end AreItemsEquivalent

	arm_func_start sub_0200D894
sub_0200D894: ; 0x0200D894
	mov r1, #0
	strb r1, [r0, #1]
	ldrb r1, [r0]
	bic r1, r1, #0x18
	strb r1, [r0]
	bx lr
	arm_func_end sub_0200D894

	arm_func_start sub_0200D8AC
sub_0200D8AC: ; 0x0200D8AC
	stmdb sp!, {r3, lr}
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	ldr r0, _0200D8DC ; =MONEY_QUANTITY_TABLE
	tst r1, #0x20
	ldr r0, [r0, r2, lsl #2]
	ldmeqia sp!, {r3, pc}
	ldr r1, _0200D8E0 ; =0x00000133
	mov r0, r0, lsl #8
	bl MultiplyByFixedPoint
	mov r0, r0, asr #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200D8DC: .word MONEY_QUANTITY_TABLE
_0200D8E0: .word 0x00000133
	arm_func_end sub_0200D8AC

	arm_func_start sub_0200D8E4
sub_0200D8E4: ; 0x0200D8E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl GetItemCategory
	cmp r0, #0xf
	bne _0200D950
	mov r5, #0
	ldr r4, _0200D958 ; =_02094D20
	b _0200D940
_0200D904:
	mov r0, r7
	bl GetExclusiveItemType
	cmp r6, r0
	bne _0200D93C
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	mov r0, r7
	bl GetExclusiveItemType
	add r1, r4, r5, lsl #2
	ldrsh r1, [r1, #2]
	cmp r1, r0
	moveq r0, r7
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0200D93C:
	add r5, r5, #1
_0200D940:
	mov r0, r5, lsl #2
	ldrsh r6, [r4, r0]
	cmp r6, #0
	bne _0200D904
_0200D950:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200D958: .word _02094D20
	arm_func_end sub_0200D8E4

	arm_func_start WriteItemsToSave
WriteItemsToSave: ; 0x0200D95C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
	mov r8, #0
	ldr r6, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	mov fp, r8
	mov r4, #6
	mov r5, #0x12c
_0200D98C:
	mul sl, r8, r5
	mov r7, fp
_0200D994:
	ldr r1, [r6]
	add r0, sp, #0
	add r1, r1, sl
	mla sb, r7, r4, r1
	mov r1, sb
	mov r2, #8
	bl CopyBitsTo
	add r0, sp, #0
	add r1, sb, #2
	mov r2, #0xb
	bl CopyBitsTo
	add r0, sp, #0
	add r1, sb, #4
	mov r2, #0xb
	bl CopyBitsTo
	add r1, sb, #1
	add r0, sp, #0
	mov r2, #3
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x32
	blt _0200D994
	add r8, r8, #1
	cmp r8, #3
	blt _0200D98C
	ldr r4, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0xb
_0200DA08:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x8a
	add r1, r1, #0x300
	mov r2, r5
	add r1, r1, r7, lsl #1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x3e8
	blt _0200DA08
	ldr r4, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0xb
_0200DA40:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x5a
	add r1, r1, #0xb00
	mov r2, r5
	add r1, r1, r7, lsl #1
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #0x3e8
	blt _0200DA40
	mov sb, #0
	mov r5, #0xb
	ldr r4, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r6, sp, #0
	mov fp, r5
	mov r7, sb
_0200DA80:
	mov sl, r7
_0200DA84:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x330
	add r1, r1, #0x1000
	add r1, r1, sb, lsl #5
	add r8, r1, sl, lsl #2
	mov r1, r8
	mov r2, r5
	bl CopyBitsTo
	add r1, r8, #2
	mov r0, r6
	mov r2, fp
	bl CopyBitsTo
	add sl, sl, #1
	cmp sl, #8
	blt _0200DA84
	mov sl, #0
_0200DAC8:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x374
	add r1, r1, #0x1000
	add r1, r1, sb, lsl #4
	add r8, r1, sl, lsl #2
	mov r1, r8
	mov r2, #0xb
	bl CopyBitsTo
	add r1, r8, #2
	mov r0, r6
	mov r2, #0xb
	bl CopyBitsTo
	add sl, sl, #1
	cmp sl, #4
	blt _0200DAC8
	add sb, sb, #1
	cmp sb, #2
	blt _0200DA80
	ldr r4, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0x18
_0200DB24:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x394
	add r1, r1, #0x1000
	mov r2, r5
	add r1, r1, r7, lsl #2
	bl CopyBitsTo
	add r7, r7, #1
	cmp r7, #3
	blt _0200DB24
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x18
	add r1, r1, #0x3a0
	add r1, r1, #0x1000
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0xc
	add r1, r1, #0x3a4
	add r1, r1, #0x1000
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0xc
	add r1, r1, #0xa6
	add r1, r1, #0x1300
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0x3a8
	add r1, r1, #0x1000
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0xaa
	add r1, r1, #0x1300
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x3ac
	add r1, r1, #0x1000
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x3b0
	add r1, r1, #0x1000
	bl CopyBitsTo
	ldr r1, _0200DC40 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0xb2
	add r1, r1, #0x1300
	bl CopyBitsTo
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200DC40: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end WriteItemsToSave

	arm_func_start ReadItemsFromSave
ReadItemsFromSave: ; 0x0200DC44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
	mov r8, #0
	ldr r6, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	mov fp, r8
	mov r4, #6
	mov r5, #0x12c
_0200DC74:
	mul sl, r8, r5
	mov r7, fp
_0200DC7C:
	ldr r1, [r6]
	add r0, sp, #0
	add r1, r1, sl
	mla sb, r7, r4, r1
	mov r1, sb
	mov r2, #8
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, sb, #2
	mov r2, #0xb
	bl CopyBitsFrom
	add r0, sp, #0
	add r1, sb, #4
	mov r2, #0xb
	bl CopyBitsFrom
	add r1, sb, #1
	add r0, sp, #0
	mov r2, #3
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x32
	blt _0200DC7C
	add r8, r8, #1
	cmp r8, #3
	blt _0200DC74
	ldr r4, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0xb
_0200DCF0:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x8a
	add r1, r1, #0x300
	mov r2, r5
	add r1, r1, r7, lsl #1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x3e8
	blt _0200DCF0
	ldr r4, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0xb
_0200DD28:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x5a
	add r1, r1, #0xb00
	mov r2, r5
	add r1, r1, r7, lsl #1
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #0x3e8
	blt _0200DD28
	mov sb, #0
	mov r5, #0xb
	ldr r4, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r6, sp, #0
	mov fp, r5
	mov r7, sb
_0200DD68:
	mov sl, r7
_0200DD6C:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x330
	add r1, r1, #0x1000
	add r1, r1, sb, lsl #5
	add r8, r1, sl, lsl #2
	mov r1, r8
	mov r2, r5
	bl CopyBitsFrom
	add r1, r8, #2
	mov r0, r6
	mov r2, fp
	bl CopyBitsFrom
	add sl, sl, #1
	cmp sl, #8
	blt _0200DD6C
	mov sl, #0
_0200DDB0:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x374
	add r1, r1, #0x1000
	add r1, r1, sb, lsl #4
	add r8, r1, sl, lsl #2
	mov r1, r8
	mov r2, #0xb
	bl CopyBitsFrom
	add r1, r8, #2
	mov r0, r6
	mov r2, #0xb
	bl CopyBitsFrom
	add sl, sl, #1
	cmp sl, #4
	blt _0200DDB0
	add sb, sb, #1
	cmp sb, #2
	blt _0200DD68
	ldr r4, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	add r6, sp, #0
	mov r5, #0x18
_0200DE0C:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, #0x394
	add r1, r1, #0x1000
	mov r2, r5
	add r1, r1, r7, lsl #2
	bl CopyBitsFrom
	add r7, r7, #1
	cmp r7, #3
	blt _0200DE0C
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x18
	add r1, r1, #0x3a0
	add r1, r1, #0x1000
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0xc
	add r1, r1, #0x3a4
	add r1, r1, #0x1000
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0xc
	add r1, r1, #0xa6
	add r1, r1, #0x1300
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0x3a8
	add r1, r1, #0x1000
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0xaa
	add r1, r1, #0x1300
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x3ac
	add r1, r1, #0x1000
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x3b0
	add r1, r1, #0x1000
	bl CopyBitsFrom
	ldr r1, _0200DF28 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0xb2
	add r1, r1, #0x1300
	bl CopyBitsFrom
	add r0, sp, #0
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200DF28: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ReadItemsFromSave

	arm_func_start sub_0200DF2C
sub_0200DF2C: ; 0x0200DF2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #8
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #1
	mov r2, #3
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200DF2C

	arm_func_start sub_0200DF74
sub_0200DF74: ; 0x0200DF74
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #8
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xb
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #1
	mov r2, #3
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200DF74

	arm_func_start sub_0200DFBC
sub_0200DFBC: ; 0x0200DFBC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200DFBC

	arm_func_start sub_0200DFE4
sub_0200DFE4: ; 0x0200DFE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200DFE4

	arm_func_start IsItemAvailableInDungeonGroup
IsItemAvailableInDungeonGroup: ; 0x0200E00C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetDungeonGroup
	cmp r0, #0x64
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	ldr r2, _0200E050 ; =AVAILABLE_ITEMS_IN_GROUP_TABLE
	mov r1, r4, asr #2
	add r0, r2, r0, lsl #7
	add r1, r4, r1, lsr #29
	ldrb r0, [r0, r1, asr #3]
	and r1, r4, #7
	mov r2, #1
	tst r0, r2, lsl r1
	moveq r2, #0
	and r0, r2, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200E050: .word AVAILABLE_ITEMS_IN_GROUP_TABLE
	arm_func_end IsItemAvailableInDungeonGroup

	arm_func_start GetItemIdFromList
GetItemIdFromList: ; 0x0200E054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	mov r5, r1
	mov r0, #0x2f8
	mov r1, #0
	mov r4, r2
	bl MemAlloc
	mov r8, r0
	mov r0, #0x2f8
	mov r1, #0
	bl MemAlloc
	cmp r6, #0
	mov r7, r0
	ldreq r0, _0200E1F0 ; =ITEM_TABLES_PTRS_1
	subne r1, r6, #1
	ldreq r2, [r0]
	ldrne r0, _0200E1F0 ; =ITEM_TABLES_PTRS_1
	ldr r3, _0200E1F4 ; =0xFFFF8AD0
	ldrne r2, [r0, r1, lsl #2]
	mov r0, #0
	mov r1, r0
	mov ip, r0
	rsb r6, r3, #0
	b _0200E0F8
_0200E0B4:
	mov sb, r0, lsl #1
	ldrh lr, [r2, sb]
	cmp lr, r6
	blo _0200E0E8
	add lr, lr, r3
	b _0200E0DC
_0200E0CC:
	mov sb, r1, lsl #1
	strh ip, [r8, sb]
	add r1, r1, #1
	sub lr, lr, #1
_0200E0DC:
	cmp lr, #0
	bne _0200E0CC
	b _0200E0F4
_0200E0E8:
	mov sb, r1, lsl #1
	strh lr, [r8, sb]
	add r1, r1, #1
_0200E0F4:
	add r0, r0, #1
_0200E0F8:
	cmp r1, #0x17c
	blt _0200E0B4
	mov r2, #0
	mov r3, r2
_0200E108:
	mov r1, r2, lsl #1
	ldrh r0, [r8, r1]
	add r3, r3, #1
	cmp r3, #0x10
	strh r0, [r7, r1]
	add r2, r2, #1
	blt _0200E108
	mov r3, #0
_0200E128:
	mov r0, r2, lsl #1
	ldrh r1, [r8, r0]
	add r0, r7, r3, lsl #1
	add r3, r3, #1
	strh r1, [r0, #0x20]
	cmp r3, #0x16c
	add r2, r2, #1
	blt _0200E128
	mov r6, #0x10
	mov r1, #0
	b _0200E174
_0200E154:
	mov r0, r1, lsl #1
	ldrsh r0, [r7, r0]
	cmp r0, #0
	beq _0200E170
	cmp r0, r5
	andge r6, r1, #0xff
	bge _0200E17C
_0200E170:
	add r1, r1, #1
_0200E174:
	cmp r1, #0x10
	blt _0200E154
_0200E17C:
	cmp r6, #0x10
	mov r5, #0x55
	beq _0200E1D8
	mov sb, #0
	b _0200E1D0
_0200E190:
	add r0, r7, sb, lsl #1
	ldrsh r0, [r0, #0x20]
	cmp r0, #0
	beq _0200E1CC
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemCategory
	cmp r6, r0
	bne _0200E1CC
	add r0, r7, sb, lsl #1
	ldrsh r0, [r0, #0x20]
	cmp r0, r4
	movge r0, sb, lsl #0x10
	movge r5, r0, asr #0x10
	bge _0200E1D8
_0200E1CC:
	add sb, sb, #1
_0200E1D0:
	cmp sb, #0x16c
	blt _0200E190
_0200E1D8:
	mov r0, r7
	bl MemFree
	mov r0, r8
	bl MemFree
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200E1F0: .word ITEM_TABLES_PTRS_1
_0200E1F4: .word 0xFFFF8AD0
	arm_func_end GetItemIdFromList

	arm_func_start NormalizeTreasureBox
NormalizeTreasureBox: ; 0x0200E1F8
	sub r1, r0, #0x16c
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #2
	movls r0, #0x16c
	bxls lr
	ldr r1, _0200E39C ; =0xFFFFFE91
	add r2, r0, r1
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #0
	bxls lr
	sub r2, r1, #3
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #3
	bxls lr
	sub r2, r1, #6
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	addls r0, r1, #0x2e4
	bxls lr
	sub r2, r0, #0x178
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	movls r0, #0x178
	bxls lr
	sub r2, r1, #0xc
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #0xc
	bxls lr
	sub r2, r1, #0xf
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #0xf
	bxls lr
	sub r2, r1, #0x12
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	addls r0, r1, #0x2f0
	bxls lr
	sub r2, r0, #0x184
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	movls r0, #0x184
	bxls lr
	sub r2, r1, #0x18
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #0x18
	bxls lr
	sub r2, r1, #0x1b
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	rsbls r0, r1, #0x1b
	bxls lr
	sub r2, r1, #0x1e
	add r2, r0, r2
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #2
	addls r0, r1, #0x2fc
	bx lr
	.align 2, 0
_0200E39C: .word 0xFFFFFE91
	arm_func_end NormalizeTreasureBox

	arm_func_start SortItemList
SortItemList: ; 0x0200E3A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r6, #0
	b _0200E4E8
_0200E3B8:
	mov r0, #6
	mul r1, r6, r0
	ldrb r0, [sl, r1]
	add r8, sl, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200E4E4
	ldrsh r0, [r8, #4]
	bl IsThrownItem
	cmp r0, #0
	beq _0200E4E4
	ldrb r0, [r8, #1]
	cmp r0, #0
	bne _0200E4E4
	ldrb r0, [r8]
	tst r0, #2
	bne _0200E4E4
	add r7, r6, #1
	mov fp, #1
	mov r5, #0x63
	mov r4, #6
	b _0200E4DC
_0200E418:
	ldrh r1, [r8, #2]
	mla r0, r7, r4, sl
	cmp r1, #0x63
	beq _0200E4E4
	ldrb r1, [r0]
	tst r1, #1
	movne r1, fp
	moveq r1, #0
	tst r1, #0xff
	beq _0200E4D8
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _0200E4D8
	ldrb r1, [r0]
	tst r1, #2
	ldreqsh r2, [r0, #4]
	ldreqsh r1, [r8, #4]
	cmpeq r2, r1
	bne _0200E4D8
	ldrh r2, [r8, #2]
	ldrh r1, [r0, #2]
	add r1, r2, r1
	strh r1, [r8, #2]
	ldrb r1, [r8]
	tst r1, #8
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0200E4A4
	ldrb r1, [r0]
	tst r1, #8
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	bne _0200E4BC
_0200E4A4:
	ldrb r1, [r8]
	bic r1, r1, #8
	strb r1, [r8]
	ldrb r1, [r0]
	bic r1, r1, #8
	strb r1, [r0]
_0200E4BC:
	ldrh r1, [r8, #2]
	cmp r1, #0x63
	subhi r1, r1, #0x63
	strhih r1, [r0, #2]
	strhih r5, [r8, #2]
	bhi _0200E4D8
	bl ItemZInit
_0200E4D8:
	add r7, r7, #1
_0200E4DC:
	cmp r7, sb
	blt _0200E418
_0200E4E4:
	add r6, r6, #1
_0200E4E8:
	cmp r6, sb
	blt _0200E3B8
	mov r0, sl
	mov r1, sb
	bl RemoveEmptyItems
	mov r7, #0
	b _0200E5F4
_0200E504:
	mov r0, #6
	mul r1, r7, r0
	ldrb r0, [sl, r1]
	add r6, sl, r1
	mvn r4, #0
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200E5F0
	ldrsh r0, [r6, #4]
	bl sub_0200EB64
	mov fp, r0
	add r8, r7, #1
	b _0200E588
_0200E540:
	mov r0, #6
	mul r1, r8, r0
	ldrb r0, [sl, r1]
	add r5, sl, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200E584
	ldrsh r0, [r5, #4]
	bl sub_0200EB64
	cmp fp, r0
	ble _0200E584
	ldrsh r0, [r5, #4]
	mov r4, r8
	bl sub_0200EB64
	mov fp, r0
_0200E584:
	add r8, r8, #1
_0200E588:
	cmp r8, sb
	blt _0200E540
	mvn r0, #0
	cmp r4, r0
	beq _0200E5F0
	mov r0, #6
	mul r3, r4, r0
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	ldrh r5, [r6, #4]
	ldrh r0, [sl, r3]
	add r4, sl, r3
	strh r1, [sp]
	strh r0, [r6]
	ldrh r1, [r4, #2]
	strh r2, [sp, #2]
	ldrh r0, [sp]
	strh r1, [r6, #2]
	ldrh r2, [r4, #4]
	strh r5, [sp, #4]
	ldrh r1, [sp, #2]
	strh r2, [r6, #4]
	strh r0, [sl, r3]
	ldrh r0, [sp, #4]
	strh r1, [r4, #2]
	strh r0, [r4, #4]
_0200E5F0:
	add r7, r7, #1
_0200E5F4:
	cmp r7, sb
	blt _0200E504
	mov r0, sl
	mov r1, sb
	bl RemoveEmptyItems
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SortItemList

	arm_func_start RemoveEmptyItems
RemoveEmptyItems: ; 0x0200E610
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r1, #0
	mov r2, r1
	mov r3, #1
	b _0200E6CC
_0200E628:
	ldrb r4, [r0]
	tst r4, #1
	movne r4, r3
	moveq r4, r2
	tst r4, #0xff
	bne _0200E6C4
	mov r5, r0
	mov r4, r1
	add r0, r0, #6
	add r1, r1, #1
	mov r3, #0
	mov ip, #1
	b _0200E69C
_0200E65C:
	ldrb r2, [r0]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _0200E694
	ldrh r2, [r0]
	mov lr, r5
	add r4, r4, #1
	strh r2, [r5], #6
	ldrh r2, [r0, #2]
	strh r2, [lr, #2]
	ldrh r2, [r0, #4]
	strh r2, [lr, #4]
_0200E694:
	add r1, r1, #1
	add r0, r0, #6
_0200E69C:
	cmp r1, r6
	blt _0200E65C
	b _0200E6B8
_0200E6A8:
	mov r0, r5
	bl ItemZInit
	add r5, r5, #6
	add r4, r4, #1
_0200E6B8:
	cmp r4, r6
	blt _0200E6A8
	ldmia sp!, {r4, r5, r6, pc}
_0200E6C4:
	add r1, r1, #1
	add r0, r0, #6
_0200E6CC:
	cmp r1, r6
	blt _0200E628
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end RemoveEmptyItems

	arm_func_start LoadItemPspi2n
LoadItemPspi2n: ; 0x0200E6D8
#ifdef EUROPE
#define LOAD_ITEM_PSPI_2N_STACK_SIZE #0x108
#else
#define LOAD_ITEM_PSPI_2N_STACK_SIZE #8
#endif
	stmdb sp!, {r3, lr}
	sub sp, sp, LOAD_ITEM_PSPI_2N_STACK_SIZE
	ldr r1, _0200E748 ; =_02098038
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r0, _0200E74C ; =_020AF6C4
	bl HandleSir0Translation
	ldr r1, _0200E750 ; =_02098054
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r0, _0200E754 ; =ITEM_DATA_TABLE_PTRS
	bl HandleSir0Translation
	ldr r0, _0200E758 ; =_020AF6C8
	bl PointsToZero
	cmp r0, #0
	beq _0200E740
	ldr r0, _0200E758 ; =_020AF6C8
	bl ZInit8
#ifdef EUROPE
	bl GetLanguage
	mov r2, r0
	ldr r1, _0200E800 ; =_020AFF88_EU
	add r0, sp, #8
	ldr r2, [r1, r2, lsl #2]
	ldr r1, _0200E75C ; =_02098070
	bl SprintfStatic__0200E808_EU
	ldr r0, _0200E758 ; =_020AF6C8
	add r1, sp, #8
#else
	ldr r0, _0200E758 ; =_020AF6C8
	ldr r1, _0200E75C ; =_02098070
#endif
	mov r2, #1
	bl LoadFileFromRom
_0200E740:
	add sp, sp, LOAD_ITEM_PSPI_2N_STACK_SIZE
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E748: .word _02098038
#ifdef EUROPE
_0200E74C: .word ITEM_DATA_TABLE_PTRS
#else
_0200E74C: .word _020AF6C4
#endif
_0200E750: .word _02098054
#ifdef EUROPE
_0200E754: .word _020AF6C4
#else
_0200E754: .word ITEM_DATA_TABLE_PTRS
#endif
_0200E758: .word _020AF6C8
#ifdef EUROPE
_0200E800: .word _020AFF88_EU
#endif
_0200E75C: .word _02098070
	arm_func_end LoadItemPspi2n

#ifdef EUROPE
	arm_func_start SprintfStatic__0200E808_EU
SprintfStatic__0200E808_EU: ; 0x0200E808
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
	arm_func_end SprintfStatic__0200E808_EU
#endif

	arm_func_start GetExclusiveItemType
GetExclusiveItemType: ; 0x0200E760
	stmdb sp!, {r3, lr}
	bl GetExclusiveItemOffsetEnsureValid
	ldr r1, _0200E778 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	ldrb r0, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E778: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetExclusiveItemType

	arm_func_start GetExclusiveItemOffsetEnsureValid
GetExclusiveItemOffsetEnsureValid: ; 0x0200E77C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x1bc
	blt _0200E798
	ldr r1, _0200E7BC ; =0x00000578
	cmp r4, r1
	blt _0200E7A0
_0200E798:
	mov r0, #0x55
	ldmia sp!, {r4, pc}
_0200E7A0:
	bl IsItemValid
	cmp r0, #0
	subne r0, r4, #0x1bc
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	moveq r0, #0x55
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200E7BC: .word 0x00000578
	arm_func_end GetExclusiveItemOffsetEnsureValid
