	.include "asm/macros.inc"
	.include "main_0200C4CC.inc"

	.text

	arm_func_start sub_0200C4CC
sub_0200C4CC: ; 0x0200C4CC
	stmdb sp!, {r4, lr}
	ldr lr, _0200C4F8 ; =_02094C18
	mov r4, r0
	mov ip, #0xe
_0200C4DC:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0200C4DC
	ldmia lr, {r0, r1}
	stmia r4, {r0, r1}
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200C4F8: .word _02094C18
	arm_func_end sub_0200C4CC

	arm_func_start GetDungeonResultMsg
GetDungeonResultMsg: ; 0x0200C4FC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x5c
	ldr ip, _0200C5A8 ; =0x00000233
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, ip
	bge _0200C570
	mov r1, r0, lsl #0x10
	add r0, sp, #4
	mov r1, r1, lsr #0x10
	bl InitMoveCheckId
	mov r0, #0
	bl GetDungeonResultString
	add r1, sp, #4
	mov r2, #0
	bl FormatMoveString
	ldrh r1, [sp, #8]
	ldr r0, _0200C5AC ; =0x000009CB
	str r1, [sp, #0x1c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #0xc
	mov r1, r5
	mov r0, r6
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C5A0
_0200C570:
	rsb r1, ip, #0
	add r1, r0, r1
	ldr r0, _0200C5B0 ; =_0209E7A6
	mov r1, r1, lsl #2
	ldrh r0, [r0, r1]
	bl StringFromId
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C5A0:
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200C5A8: .word 0x00000233
#ifdef JAPAN
_0200C5AC: .word 0x000023B6
#else
_0200C5AC: .word 0x000009CB
#endif
_0200C5B0: .word _0209E7A6
	arm_func_end GetDungeonResultMsg

	arm_func_start sub_0200C5B4
sub_0200C5B4: ; 0x0200C5B4
	ldr r1, _0200C5D4 ; =0x00000233
	cmp r0, r1
	movlt r0, #1
	rsbge r1, r1, #0
	ldrge r2, _0200C5D8 ; =DUNGEON_RETURN_STATUS_TABLE
	addge r0, r0, r1
	ldrgeb r0, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_0200C5D4: .word 0x00000233
_0200C5D8: .word DUNGEON_RETURN_STATUS_TABLE
	arm_func_end sub_0200C5B4

	arm_func_start sub_0200C5DC
sub_0200C5DC: ; 0x0200C5DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r5, r1
	mov r6, r0
	bl GetWindow
	ldrb r1, [r5, #0x5c]
	ldrb r4, [r0, #6]
	cmp r1, #0x3d
	moveq r1, #0x3c
	orr r0, r1, #0x40000
	str r0, [sp, #0x14]
	ldrb r1, [r5, #0x5d]
	ldr r0, _0200CA18 ; =0x000009CC
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x10
	bl DrawTextInWindow
	add r1, r5, #0x1e
	add r0, r5, #0x3c
	str r1, [sp, #0x40]
	str r5, [sp, #0x3c]
	str r0, [sp, #0x44]
	ldrsh r0, [r5, #0x5a]
	bl sub_0200C5B4
	cmp r0, #0
	beq _0200C698
	ldr r0, _0200CA1C ; =0x000009CD
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
	b _0200C6BC
_0200C698:
	ldr r0, _0200CA20 ; =0x000009CE
	bl StringFromId
	mov r2, r0
	add ip, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str ip, [sp]
	bl PreprocessString
_0200C6BC:
	add r0, sp, #0x54
	bl sub_020265A8
	rsb r0, r0, r4, lsl #3
	add r1, r0, r0, lsr #31
	add r3, sp, #0x54
	mov r0, r6
	mov r1, r1, asr #1
	mov r2, #0x1a
	bl DrawTextInWindow
	ldrsh r0, [r5, #0x5a]
	add r1, sp, #0x54
	add r3, sp, #4
	mov r2, #0x400
	bl GetDungeonResultMsg
	add r0, sp, #0x54
	bl sub_020265A8
	rsb r0, r0, r4, lsl #3
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	mov r0, r6
	mov r2, #0x24
	add r3, sp, #0x54
	bl DrawTextInWindow
	ldr r1, [r5, #0x64]
	ldr r0, _0200CA24 ; =0x000009CF
	str r1, [sp, #0x28]
	ldrb r1, [r5, #0x6e]
	str r1, [sp, #0x2c]
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, #0x34
	add r3, sp, #0x54
	bl DrawTextInWindow
	ldrsh r1, [r5, #0x68]
#ifdef JAPAN
	ldr r0, _0200CA28 ; =0x000023BB
#else
	mov r0, #0x9d0
#endif
	str r1, [sp, #0x28]
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	mov r0, r6
	mov r1, #4
	mov r2, #0x3e
	add r3, sp, #0x54
	bl DrawTextInWindow
#ifdef JAPAN
	ldrb r1, [r5, #0x6a]
	str r1, [sp, #0x28]
	ldrb r0, [r5, #0x6c]
	str r0, [sp, #0x2c]
	ldrb r0, [r5, #0xa9]
	cmp r0, #0
	beq _0200C7EC
	add r1, r1, r0
	mov r0, #0x23c0
#else
	ldrb r2, [r5, #0x6a]
	str r2, [sp, #0x28]
	ldrb r0, [r5, #0x6c]
	str r0, [sp, #0x2c]
	ldrb r1, [r5, #0xa9]
	cmp r1, #0
	beq _0200C7EC
	ldr r0, _0200CA28 ; =0x000009D5
	add r1, r2, r1
#endif
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C810
_0200C7EC:
	ldr r0, _0200CA2C ; =0x000009D1
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C810:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x48
	bl DrawTextInWindow
	ldrb r2, [r5, #0xab]
	cmp r2, #0
	beq _0200C864
	ldr r1, [sp, #0x2c]
	ldr r0, _0200CA30 ; =0x000009D6
	add r1, r1, r2
	str r1, [sp, #0x2c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C888
_0200C864:
	ldr r0, _0200CA34 ; =0x000009D2
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C888:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x48
	bl DrawTextInWindow
	ldrb r2, [r5, #0x6b]
	str r2, [sp, #0x28]
	ldrb r0, [r5, #0x6d]
	str r0, [sp, #0x2c]
	ldrb r1, [r5, #0xaa]
	cmp r1, #0
	beq _0200C8E8
	ldr r0, _0200CA38 ; =0x000009D7
	add r1, r2, r1
	str r1, [sp, #0x28]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C90C
_0200C8E8:
	ldr r0, _0200CA3C ; =0x000009D3
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C90C:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x52
	bl DrawTextInWindow
	ldrb r2, [r5, #0xac]
	cmp r2, #0
	beq _0200C960
	ldr r1, [sp, #0x2c]
	ldr r0, _0200CA40 ; =0x000009D8
	add r1, r1, r2
	str r1, [sp, #0x2c]
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
	b _0200C984
_0200C960:
	ldr r0, _0200CA44 ; =0x000009D4
	bl StringFromId
	mov r2, r0
	add r4, sp, #4
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	str r4, [sp]
	bl PreprocessString
_0200C984:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x52
	bl DrawTextInWindow
	ldrb r0, [r5, #0x5e]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200C9EC
	bl sub_02025888
	ldr r2, _0200CA48 ; =_02094C0C
	add r1, r5, #0x5e
	str r0, [sp, #0x3c]
	bl sub_0200D670
	ldr r0, _0200CA4C ; =0x000009DA
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x400
	mov r3, #0
	bl PreprocessString
	b _0200C9F8
_0200C9EC:
	ldr r1, _0200CA50 ; =0x000009D9
	add r0, sp, #0x54
	bl GetStringFromFileVeneer
_0200C9F8:
	add r3, sp, #0x54
	mov r0, r6
	mov r1, #4
	mov r2, #0x62
	bl DrawTextInWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_0200C5DC_OFFSET 0x19EB
#else
#define SUB_0200C5DC_OFFSET 0
#endif
_0200CA18: .word 0x000009CC + SUB_0200C5DC_OFFSET
_0200CA1C: .word 0x000009CD + SUB_0200C5DC_OFFSET
_0200CA20: .word 0x000009CE + SUB_0200C5DC_OFFSET
_0200CA24: .word 0x000009CF + SUB_0200C5DC_OFFSET
#ifdef JAPAN
_0200CA28: .word 0x000023BB
#else
_0200CA28: .word 0x000009D5
#endif
_0200CA2C: .word 0x000009D1 + SUB_0200C5DC_OFFSET
_0200CA30: .word 0x000009D6 + SUB_0200C5DC_OFFSET
_0200CA34: .word 0x000009D2 + SUB_0200C5DC_OFFSET
_0200CA38: .word 0x000009D7 + SUB_0200C5DC_OFFSET
_0200CA3C: .word 0x000009D3 + SUB_0200C5DC_OFFSET
_0200CA40: .word 0x000009D8 + SUB_0200C5DC_OFFSET
_0200CA44: .word 0x000009D4 + SUB_0200C5DC_OFFSET
_0200CA48: .word _02094C0C
_0200CA4C: .word 0x000009DA + SUB_0200C5DC_OFFSET
_0200CA50: .word 0x000009D9 + SUB_0200C5DC_OFFSET
	arm_func_end sub_0200C5DC

	arm_func_start GetDamageSource
GetDamageSource: ; 0x0200CA54
	stmdb sp!, {r3, lr}
	cmp r1, #0
	beq _0200CA78
	mov r0, r1
	bl GetItemCategoryVeneer
	cmp r0, #9
	ldreq r0, _0200CA84 ; =0x00000262
	ldrne r0, _0200CA88 ; =0x00000263
	ldmia sp!, {r3, pc}
_0200CA78:
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200CA84: .word 0x00000262
_0200CA88: .word 0x00000263
	arm_func_end GetDamageSource

	arm_func_start sub_0200CA8C
sub_0200CA8C: ; 0x0200CA8C
	stmdb sp!, {r3, lr}
	ldr r1, _0200CAB4 ; =_022A3824
	ldr r0, _0200CAB8 ; =BAG_ITEMS_PTR_MIRROR
	str r1, [r0]
	bl LoadItemPspi2n
	bl SetActiveInventoryToMain
	bl sub_0200FD38
	bl sub_02010590
	bl sub_02011AB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200CAB4: .word _022A3824
_0200CAB8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200CA8C

	arm_func_start sub_0200CABC
sub_0200CABC: ; 0x0200CABC
	stmdb sp!, {r3, lr}
	bl AllInventoriesZInit
	bl sub_0200FD3C
	bl AllKecleonShopsZInit
	bl sub_02011AB8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200CABC

	arm_func_start sub_0200CAD4
sub_0200CAD4: ; 0x0200CAD4
	stmdb sp!, {r3, lr}
	bl SpecialEpisodeInventoryZInit
	bl SpecialEpisodeKecleonShopZInit
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200CAD4

	arm_func_start sub_0200CAE4
sub_0200CAE4: ; 0x0200CAE4
	ldr ip, _0200CAEC ; =RescueInventoryZInit
	bx ip
	.align 2, 0
_0200CAEC: .word RescueInventoryZInit
	arm_func_end sub_0200CAE4

	arm_func_start GetItemCategoryVeneer
GetItemCategoryVeneer: ; 0x0200CAF0
	ldr ip, _0200CAF8 ; =GetItemCategory
	bx ip
	.align 2, 0
_0200CAF8: .word GetItemCategory
	arm_func_end GetItemCategoryVeneer

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

	arm_func_start IsItemValid
IsItemValid: ; 0x0200E7C0
	ldr r1, _0200E7E4 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #0xe]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200E7E4: .word ITEM_DATA_TABLE_PTRS
	arm_func_end IsItemValid

	arm_func_start GetExclusiveItemParameter
GetExclusiveItemParameter: ; 0x0200E7E8
	stmdb sp!, {r3, lr}
	bl GetExclusiveItemOffsetEnsureValid
	ldr r1, _0200E804 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1, #4]
#else
	ldr r1, [r1]
#endif
	add r0, r1, r0, lsl #2
	ldrsh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E804: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetExclusiveItemParameter

	arm_func_start GetItemCategory
GetItemCategory: ; 0x0200E808
	stmdb sp!, {r3, lr}
	bl EnsureValidItem
	ldr r1, _0200E824 ; =ITEM_DATA_TABLE_PTRS
#ifdef EUROPE
	ldr r1, [r1]
#else
	ldr r1, [r1, #4]
#endif
	add r0, r1, r0, lsl #4
	ldrb r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200E824: .word ITEM_DATA_TABLE_PTRS
	arm_func_end GetItemCategory

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

	arm_func_start GetMoneyCarried
GetMoneyCarried: ; 0x0200ECFC
	ldr r0, _0200ED18 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r0]
	ldrb r0, [r1, #0x388]
	add r0, r1, r0, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x394]
	bx lr
	.align 2, 0
_0200ED18: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetMoneyCarried

	arm_func_start SetMoneyCarried
SetMoneyCarried: ; 0x0200ED1C
	ldr r1, _0200ED50 ; =0x0001869F
	cmp r0, r1
	movgt r0, r1
	bgt _0200ED34
	cmp r0, #0
	movlt r0, #0
_0200ED34:
	ldr r1, _0200ED54 ; =BAG_ITEMS_PTR_MIRROR
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x394]
	bx lr
	.align 2, 0
_0200ED50: .word 0x0001869F
_0200ED54: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetMoneyCarried

	arm_func_start AddMoneyCarried
AddMoneyCarried: ; 0x0200ED58
	ldr r1, _0200ED7C ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _0200ED80 ; =SetMoneyCarried
	ldr r2, [r1]
	ldrb r1, [r2, #0x388]
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x394]
	add r0, r0, r1
	bx ip
	.align 2, 0
_0200ED7C: .word BAG_ITEMS_PTR_MIRROR
_0200ED80: .word SetMoneyCarried
	arm_func_end AddMoneyCarried

	arm_func_start GetCurrentBagCapacity
GetCurrentBagCapacity: ; 0x0200ED84
	stmdb sp!, {r3, lr}
	bl GetExecuteSpecialEpisodeType
	mvn r1, #0
	cmp r0, r1
	bne _0200EDB8
	mov r0, #2
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl GetScenarioBalance
	bl GetBagCapacity
	ldmia sp!, {r3, pc}
_0200EDB8:
	bl GetBagCapacitySpecialEpisode
	ldmia sp!, {r3, pc}
	arm_func_end GetCurrentBagCapacity

	arm_func_start IsBagFull
IsBagFull: ; 0x0200EDC0
	stmdb sp!, {r3, lr}
	bl GetCurrentBagCapacity
	sub r2, r0, #1
	mov r0, #6
	ldr r1, _0200EDF8 ; =BAG_ITEMS_PTR_MIRROR
	mul r0, r2, r0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	ldrb r0, [r1, r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EDF8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsBagFull

	arm_func_start GetNbItemsInBag
GetNbItemsInBag: ; 0x0200EDFC
	stmdb sp!, {r3, lr}
	ldr r1, _0200EE48 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov lr, r0
	ldr ip, [r1, #0x384]
	mov r1, r0
	mov r2, #1
_0200EE1C:
	ldrb r3, [ip]
	add lr, lr, #1
	add ip, ip, #6
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	addne r0, r0, #1
	cmp lr, #0x32
	blt _0200EE1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200EE48: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetNbItemsInBag

	arm_func_start CountNbItemsOfTypeInBag
CountNbItemsOfTypeInBag: ; 0x0200EE4C
	ldr r1, _0200EE84 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	mov ip, r3
	ldr r2, [r1, #0x384]
_0200EE60:
	ldrsh r1, [r2, #4]
	add ip, ip, #1
	add r2, r2, #6
	cmp r1, r0
	addeq r3, r3, #1
	cmp ip, #0x32
	blt _0200EE60
	mov r0, r3
	bx lr
	.align 2, 0
_0200EE84: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbItemsOfTypeInBag

	arm_func_start CountItemTypeInBag
CountItemTypeInBag: ; 0x0200EE88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0200EEDC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r1, [r1]
	mov r7, r0
	ldr r4, [r1, #0x384]
	mov r6, r5
_0200EEA4:
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _0200EEC4
	bl IsThrownItem
	cmp r0, #0
	ldrneh r0, [r4, #2]
	addne r5, r5, r0
	addeq r5, r5, #1
_0200EEC4:
	add r6, r6, #1
	cmp r6, #0x32
	add r4, r4, #6
	blt _0200EEA4
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200EEDC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountItemTypeInBag

	arm_func_start IsItemInBag
IsItemInBag: ; 0x0200EEE0
	ldr r1, _0200EF1C ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	ldr r2, [r1, #0x384]
	b _0200EF0C
_0200EEF4:
	ldrsh r1, [r2, #4]
	cmp r1, r0
	moveq r0, #1
	bxeq lr
	add r3, r3, #1
	add r2, r2, #6
_0200EF0C:
	cmp r3, #0x32
	blt _0200EEF4
	mov r0, #0
	bx lr
	.align 2, 0
_0200EF1C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemInBag

	arm_func_start IsItemWithFlagsInBag
IsItemWithFlagsInBag: ; 0x0200EF20
	ldr r2, _0200EF68 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r2]
	ldr r3, [r2, #0x384]
	b _0200EF58
_0200EF34:
	ldrsh r2, [r3, #4]
	cmp r2, r0
	bne _0200EF50
	ldrb r2, [r3]
	tst r2, r1
	movne r0, #1
	bxne lr
_0200EF50:
	add ip, ip, #1
	add r3, r3, #6
_0200EF58:
	cmp ip, #0x32
	blt _0200EF34
	mov r0, #0
	bx lr
	.align 2, 0
_0200EF68: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemWithFlagsInBag

#ifndef JAPAN
	arm_func_start IsItemInTreasureBoxes
IsItemInTreasureBoxes: ; 0x0200EF6C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200EFC8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r0
	ldr r0, [r1]
	mov r6, #0
	ldr r5, [r0, #0x384]
	b _0200EFB8
_0200EF88:
	ldrsh r0, [r5, #4]
	bl GetItemCategoryVeneer
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0200EFB0
	ldrh r0, [r5, #2]
	cmp r0, r4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
_0200EFB0:
	add r6, r6, #1
	add r5, r5, #6
_0200EFB8:
	cmp r6, #0x32
	blt _0200EF88
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200EFC8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemInTreasureBoxes
#endif

	arm_func_start IsHeldItemInBag
IsHeldItemInBag: ; 0x0200EFCC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F04C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	mov sb, #1
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov r7, sb
	b _0200F03C
_0200EFF4:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200F034
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0200F034
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F034:
	add r5, r5, #1
	add r4, r4, #6
_0200F03C:
	cmp r5, #0x32
	blt _0200EFF4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F04C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsHeldItemInBag

	arm_func_start IsItemForSpecialSpawnInBag
IsItemForSpecialSpawnInBag: ; 0x0200F050
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200F0E0 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r0, [r0]
	mov ip, #1
	ldr lr, [r0, #0x384]
	mov r3, r4
	mov r1, r4
	mov r2, ip
	b _0200F0D0
_0200F078:
	ldrb r5, [lr]
	tst r5, #1
	movne r0, ip
	moveq r0, r3
	tst r0, #0xff
	beq _0200F0C8
	ldrsh r0, [lr, #4]
	sub r0, r0, #0xad
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0200F0C8
	tst r5, #8
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
_0200F0C8:
	add r4, r4, #1
	add lr, lr, #6
_0200F0D0:
	cmp r4, #0x32
	blt _0200F078
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0200F0E0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end IsItemForSpecialSpawnInBag

	arm_func_start HasStorableItems
HasStorableItems: ; 0x0200F0E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200F148 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	ldr r0, [r0]
	mov r4, r7
	ldr r6, [r0, #0x384]
	mov r5, #1
	b _0200F138
_0200F104:
	ldrb r0, [r6]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _0200F130
	ldrsh r0, [r6, #4]
	bl IsStorableItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_0200F130:
	add r7, r7, #1
	add r6, r6, #6
_0200F138:
	cmp r7, #0x32
	blt _0200F104
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200F148: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end HasStorableItems

	arm_func_start GetItemIndex
GetItemIndex: ; 0x0200F14C
	ldr r1, _0200F188 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	b _0200F178
_0200F160:
	cmp r1, r0
	moveq r0, r2, lsl #0x10
	moveq r0, r0, asr #0x10
	bxeq lr
	add r2, r2, #1
	add r1, r1, #6
_0200F178:
	cmp r2, #0x32
	blt _0200F160
	mvn r0, #0
	bx lr
	.align 2, 0
_0200F188: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetItemIndex

	arm_func_start GetEquivItemIndex
GetEquivItemIndex: ; 0x0200F18C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F204 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F1F4
_0200F1B4:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F1EC
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	movne r0, r4, lsl #0x10
	movne r0, r0, asr #0x10
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F1EC:
	add r4, r4, #1
	add sb, sb, #6
_0200F1F4:
	cmp r4, #0x32
	blt _0200F1B4
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F204: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquivItemIndex

	arm_func_start GetEquippedThrowableItem
GetEquippedThrowableItem: ; 0x0200F208
	ldr r0, _0200F268 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r0, [r0]
	mov r1, ip
	ldr r3, [r0, #0x384]
	mov r2, #1
	b _0200F258
_0200F224:
	ldrb r0, [r3]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _0200F250
	ldrb r0, [r3]
	tst r0, #0x10
	movne r0, ip, lsl #0x10
	movne r0, r0, asr #0x10
	bxne lr
_0200F250:
	add ip, ip, #1
	add r3, r3, #6
_0200F258:
	cmp ip, #0x32
	blt _0200F224
	mvn r0, #0
	bx lr
	.align 2, 0
_0200F268: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquippedThrowableItem

	arm_func_start GetFirstUnequippedItemOfType
GetFirstUnequippedItemOfType: ; 0x0200F26C
	stmdb sp!, {r3, lr}
	ldr r1, _0200F2DC ; =BAG_ITEMS_PTR_MIRROR
	mvn ip, #0
	ldr r1, [r1]
	cmp r0, #0
	ldr r3, [r1, #0x384]
	moveq r0, ip
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	mov r2, ip
	b _0200F2CC
_0200F298:
	ldrsh r1, [r3, #4]
	cmp r1, r0
	bne _0200F2C4
	ldrb r1, [r3, #1]
	cmp r1, #0
	moveq r0, lr, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	cmp ip, r2
	moveq r1, lr, lsl #0x10
	moveq ip, r1, asr #0x10
_0200F2C4:
	add lr, lr, #1
	add r3, r3, #6
_0200F2CC:
	cmp lr, #0x32
	blt _0200F298
	mov r0, ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F2DC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetFirstUnequippedItemOfType

	arm_func_start CopyItemAtIdx
CopyItemAtIdx: ; 0x0200F2E0
	stmdb sp!, {r3, lr}
	ldr r3, _0200F344 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #6
	ldr r3, [r3]
	smulbb r2, r0, r2
	ldr r3, [r3, #0x384]
	ldrb r0, [r3, r2]
	add r3, r3, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F334
	ldrh r2, [r3]
	mov r0, #1
	strh r2, [r1]
	ldrh r2, [r3, #2]
	strh r2, [r1, #2]
	ldrh r2, [r3, #4]
	strh r2, [r1, #4]
	ldmia sp!, {r3, pc}
_0200F334:
	mov r0, r1
	bl ItemZInit
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200F344: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CopyItemAtIdx

	arm_func_start GetItemAtIdx
GetItemAtIdx: ; 0x0200F348
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r2, _0200F36C ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	ldr r2, [r2, #0x384]
	smlabb r0, r0, r1, r2
	bx lr
	.align 2, 0
_0200F36C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetItemAtIdx

	arm_func_start RemoveEmptyItemsInBag
RemoveEmptyItemsInBag: ; 0x0200F370
	ldr r0, _0200F388 ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _0200F38C ; =RemoveEmptyItems
	ldr r0, [r0]
	mov r1, #0x32
	ldr r0, [r0, #0x384]
	bx ip
	.align 2, 0
_0200F388: .word BAG_ITEMS_PTR_MIRROR
_0200F38C: .word RemoveEmptyItems
	arm_func_end RemoveEmptyItemsInBag

	arm_func_start RemoveItemNoHole
RemoveItemNoHole: ; 0x0200F390
	stmdb sp!, {r4, lr}
	ldr r2, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F3F8
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F3D4
	bl sub_020582E0
_0200F3D4:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F3F8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F400: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHole

	arm_func_start RemoveItem
RemoveItem: ; 0x0200F404
	stmdb sp!, {r4, lr}
	ldr r2, _0200F450 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r4, #1]
	cmpne r0, #0
	beq _0200F444
	bl sub_020582E0
_0200F444:
	mov r0, r4
	bl ItemZInit
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F450: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItem

	arm_func_start RemoveHeldItemNoHole
RemoveHeldItemNoHole: ; 0x0200F454
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r0, [r0]
	mov r6, r4
	ldr r8, [r0, #0x384]
	mov r7, #1
_0200F478:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _0200F4A8
	ldrb r0, [r8, #1]
	cmp r0, r5
	bne _0200F4A8
	bl sub_020582E0
	mov r0, r8
	bl ItemZInit
_0200F4A8:
	add r4, r4, #1
	cmp r4, #0x32
	add r8, r8, #6
	blt _0200F478
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200F4D0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveHeldItemNoHole

	arm_func_start RemoveItemByIdAndStackNoHole
RemoveItemByIdAndStackNoHole: ; 0x0200F4D4
	stmdb sp!, {r4, lr}
	ldr r1, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	ldr r4, [r1, #0x384]
	b _0200F544
_0200F4EC:
	ldrsh r2, [r4, #4]
	ldrsh r1, [r0]
	cmp r2, r1
	ldreqh r2, [r4, #2]
	ldreqh r1, [r0, #2]
	cmpeq r2, r1
	bne _0200F53C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F518
	bl sub_020582E0
_0200F518:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F53C:
	add r3, r3, #1
	add r4, r4, #6
_0200F544:
	cmp r3, #0x32
	blt _0200F4EC
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F554: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemByIdAndStackNoHole

	arm_func_start RemoveEquivItem
RemoveEquivItem: ; 0x0200F558
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F5EC
_0200F580:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F5E4
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F5E4
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F5C0
	bl sub_020582E0
_0200F5C0:
	mov r0, sb
	bl ItemZInit
	ldr r0, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F5E4:
	add r4, r4, #1
	add sb, sb, #6
_0200F5EC:
	cmp r4, #0x32
	blt _0200F580
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F5FC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItem

	arm_func_start RemoveEquivItemNoHole
RemoveEquivItemNoHole: ; 0x0200F600
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F690 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F680
_0200F628:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F678
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F678
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F668
	bl sub_020582E0
_0200F668:
	mov r0, sb
	bl ItemZInit
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F678:
	add r4, r4, #1
	add sb, sb, #6
_0200F680:
	cmp r4, #0x32
	blt _0200F628
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F690: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItemNoHole

	arm_func_start DecrementStackItem
DecrementStackItem: ; 0x0200F694
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F714 ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov sb, #1
	mov r7, #0xb
	b _0200F704
_0200F6BC:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200F6FC
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	ldrneh r1, [r4, #2]
	movne r0, #1
	subne r1, r1, #1
	strneh r1, [r4, #2]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F6FC:
	add r5, r5, #1
	add r4, r4, #6
_0200F704:
	cmp r5, #0x32
	blt _0200F6BC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F714: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end DecrementStackItem

	arm_func_start RemoveItemNoHoleCheck
RemoveItemNoHoleCheck: ; 0x0200F718
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _0200F78C
	ldr r2, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F78C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F768
	bl sub_020582E0
_0200F768:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F78C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F794: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHoleCheck

	arm_func_start RemoveFirstUnequippedItemOfType
RemoveFirstUnequippedItemOfType: ; 0x0200F798
	stmdb sp!, {r3, lr}
	bl GetFirstUnequippedItemOfType
	bl RemoveItemNoHoleCheck
	ldmia sp!, {r3, pc}
	arm_func_end RemoveFirstUnequippedItemOfType

	arm_func_start RemoveAllItems
RemoveAllItems: ; 0x0200F7A8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0200F7D8 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r0, [r0]
	ldr r4, [r0, #0x384]
_0200F7BC:
	mov r0, r4
	bl ItemZInit
	add r5, r5, #1
	cmp r5, #0x32
	add r4, r4, #6
	blt _0200F7BC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0200F7D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveAllItems

	arm_func_start RemoveAllItemsStartingAt
RemoveAllItemsStartingAt: ; 0x0200F7DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0200F848 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r0
	ldr r1, [r6]
	mov r0, #6
	ldr r1, [r1, #0x384]
	mov r5, r0
	mla r7, r4, r0, r1
	b _0200F828
_0200F800:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0200F810
	bl sub_020582E0
_0200F810:
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	mla r0, r4, r5, r0
	bl ItemZInit
	add r4, r4, #1
	add r7, r7, #6
_0200F828:
	cmp r4, #0x32
	blt _0200F800
	ldr r0, _0200F848 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200F848: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveAllItemsStartingAt

	arm_func_start SpecialProcAddItemToBag
SpecialProcAddItemToBag: ; 0x0200F84C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r1, r0
	add r0, sp, #0
	bl BulkItemToItem
	add r0, sp, #0
	mov r1, #0
	bl AddItemToBag
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end SpecialProcAddItemToBag

	arm_func_start AddItemToBagNoHeld
AddItemToBagNoHeld: ; 0x0200F874
	ldr ip, _0200F880 ; =AddItemToBag
	mov r1, #0
	bx ip
	.align 2, 0
_0200F880: .word AddItemToBag
	arm_func_end AddItemToBagNoHeld

	arm_func_start AddItemToBag
AddItemToBag: ; 0x0200F884
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0200F90C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	ldr r4, [r0, #0x384]
	bl GetCurrentBagCapacity
	mov ip, #0
	mov r1, ip
	mov r2, #1
	b _0200F8FC
_0200F8B0:
	ldrb r3, [r4]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	bne _0200F8F4
	ldrh r1, [r6]
	mov r0, r6
	strh r1, [r4]
	ldrh r1, [r6, #2]
	strh r1, [r4, #2]
	ldrh r1, [r6, #4]
	strh r1, [r4, #4]
	strb r5, [r4, #1]
	bl SetItemAcquired
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_0200F8F4:
	add ip, ip, #1
	add r4, r4, #6
_0200F8FC:
	cmp ip, r0
	blt _0200F8B0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200F90C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToBag

	arm_func_start CleanStickyItemsInBag
CleanStickyItemsInBag: ; 0x0200F910
	ldr r0, _0200F93C ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r0, [r0]
	ldr r1, [r0, #0x384]
_0200F920:
	ldrb r0, [r1]
	add r2, r2, #1
	cmp r2, #0x32
	bic r0, r0, #8
	strb r0, [r1], #6
	blt _0200F920
	bx lr
	.align 2, 0
_0200F93C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CleanStickyItemsInBag

	arm_func_start CountStickyItemsInBag
CountStickyItemsInBag: ; 0x0200F940
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0200F9B0 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r0, [r0]
	mov r3, #1
	ldr ip, [r0, #0x384]
	mov r4, lr
	mov r2, lr
	mov r0, lr
	mov r1, r3
_0200F968:
	ldrb r5, [ip]
	tst r5, #1
	movne r6, r3
	moveq r6, r2
	tst r6, #0xff
	beq _0200F994
	tst r5, #8
	movne r5, r1
	moveq r5, r0
	tst r5, #0xff
	addne lr, lr, #1
_0200F994:
	add r4, r4, #1
	cmp r4, #0x32
	add ip, ip, #6
	blt _0200F968
	mov r0, lr, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200F9B0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountStickyItemsInBag

	arm_func_start sub_0200F9B4
sub_0200F9B4: ; 0x0200F9B4
	stmdb sp!, {r3, lr}
	ldr r1, _0200FA08 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r1, [r1]
	mov r2, lr
	ldr ip, [r1, #0x384]
	mov r3, #1
_0200F9D0:
	ldrb r1, [ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [ip, #1]
	cmpne r1, #0
	ldrneb r1, [r0, r1]
	strneb r1, [ip, #1]
	cmp lr, #0x32
	add ip, ip, #6
	blt _0200F9D0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FA08: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200F9B4

	arm_func_start sub_0200FA0C
sub_0200FA0C: ; 0x0200FA0C
	stmdb sp!, {r3, lr}
	ldr r3, _0200FA64 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0x12c
	ldr r3, [r3]
	mov lr, #0
	mla ip, r1, r2, r3
	mov r2, lr
	mov r3, #1
_0200FA2C:
	ldrb r1, [ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [ip, #1]
	cmpne r1, #0
	ldrneb r1, [r0, r1]
	strneb r1, [ip, #1]
	cmp lr, #0x32
	add ip, ip, #6
	blt _0200FA2C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FA64: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0200FA0C

	arm_func_start TransmuteHeldItemInBag
TransmuteHeldItemInBag: ; 0x0200FA68
	stmdb sp!, {r4, lr}
	ldr r1, _0200FAE8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r1, [r1]
	mov r3, r4
	ldr lr, [r1, #0x384]
	mov ip, #1
	b _0200FAD8
_0200FA88:
	ldrb r1, [lr]
	tst r1, #1
	movne r1, ip
	moveq r1, r3
	tst r1, #0xff
	beq _0200FAD0
	ldrb r2, [lr, #1]
	ldrb r1, [r0, #1]
	cmp r2, r1
	bne _0200FAD0
	ldrh r1, [r0]
	strh r1, [lr]
	ldrh r1, [r0, #2]
	strh r1, [lr, #2]
	ldrh r1, [r0, #4]
	mov r0, #1
	strh r1, [lr, #4]
	ldmia sp!, {r4, pc}
_0200FAD0:
	add r4, r4, #1
	add lr, lr, #6
_0200FAD8:
	cmp r4, #0x32
	blt _0200FA88
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FAE8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end TransmuteHeldItemInBag

	arm_func_start SetFlagsForHeldItemInBag
SetFlagsForHeldItemInBag: ; 0x0200FAEC
	stmdb sp!, {r4, lr}
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _0200FB50 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r2, [r2]
	mov r3, r4
	ldr lr, [r2, #0x384]
	mov ip, #1
_0200FB10:
	ldrb r2, [lr]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _0200FB3C
	ldrb r2, [lr, #1]
	cmp r2, r0
	ldreqb r2, [lr]
	orreq r2, r2, r1
	streqb r2, [lr]
_0200FB3C:
	add r4, r4, #1
	cmp r4, #0x32
	add lr, lr, #6
	blt _0200FB10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FB50: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetFlagsForHeldItemInBag

	arm_func_start RemoveHolderForItemInBag
RemoveHolderForItemInBag: ; 0x0200FB54
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200FBDC ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	mov sb, #1
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov r7, sb
	b _0200FBCC
_0200FB7C:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200FBC4
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200FBC4
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r1, [r6]
	mov r0, #1
	strb r1, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200FBC4:
	add r5, r5, #1
	add r4, r4, #6
_0200FBCC:
	cmp r5, #0x32
	blt _0200FB7C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200FBDC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveHolderForItemInBag

	arm_func_start SetHolderForItemInBag
SetHolderForItemInBag: ; 0x0200FBE0
	stmdb sp!, {r4, lr}
	ldr ip, _0200FC20 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #6
	ldr lr, [ip]
	smulbb ip, r0, r3
	ldr lr, [lr, #0x384]
	and r0, r2, #0xff
	ldrb r3, [lr, ip]
	add r4, lr, ip
	bic r3, r3, #0x10
	strb r3, [lr, ip]
	strb r2, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1]
	strb r0, [lr, ip]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200FC20: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetHolderForItemInBag

	arm_func_start SortItemsInBag
SortItemsInBag: ; 0x0200FC24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	ldr r7, _0200FCA8 ; =BAG_ITEMS_PTR_MIRROR
	mov r8, r4
	mov sb, #1
	mov r6, #6
_0200FC3C:
	mul r1, r4, r6
	ldr r0, [r7]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add r5, r2, r1
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200FC84
	ldrsh r0, [r5, #4]
	cmp r0, #0xb7
	bne _0200FC84
	mov r0, r5
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r0, r5
	bl ItemZInit
_0200FC84:
	add r4, r4, #1
	cmp r4, #0x32
	blt _0200FC3C
	ldr r0, _0200FCA8 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl SortItemList
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200FCA8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortItemsInBag

	arm_func_start RemovePokeItemsInBag
RemovePokeItemsInBag: ; 0x0200FCAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0200FD34 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r0, [r0]
	mov r6, r5
	ldr r4, [r0, #0x384]
	mov r7, #1
_0200FCC8:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _0200FD0C
	ldrsh r0, [r4, #4]
	cmp r0, #0xb7
	bne _0200FD0C
	ldrb r1, [r4]
	mov r0, r4
	bic r1, r1, #8
	strb r1, [r4]
	bl sub_0200D8AC
	bl AddMoneyCarried
	mov r0, r4
	bl ItemZInit
_0200FD0C:
	add r5, r5, #1
	cmp r5, #0x32
	add r4, r4, #6
	blt _0200FCC8
	ldr r0, _0200FD34 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FD34: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemovePokeItemsInBag

	arm_func_start sub_0200FD38
sub_0200FD38: ; 0x0200FD38
	bx lr
	arm_func_end sub_0200FD38

	arm_func_start sub_0200FD3C
sub_0200FD3C: ; 0x0200FD3C
	ldr ip, _0200FD44 ; =StorageZInit
	bx ip
	.align 2, 0
_0200FD44: .word StorageZInit
	arm_func_end sub_0200FD3C

	arm_func_start sub_0200FD48
sub_0200FD48: ; 0x0200FD48
	ldr ip, _0200FD50 ; =GetRankStorageSize
	bx ip
	.align 2, 0
_0200FD50: .word GetRankStorageSize
	arm_func_end sub_0200FD48

	arm_func_start IsStorageFull
IsStorageFull: ; 0x0200FD54
	stmdb sp!, {r4, lr}
	bl GetRankStorageSize
	mov r4, r0
	bl CountNbOfItemsInStorage
	cmp r0, r4
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsStorageFull

	arm_func_start CountNbOfItemsInStorage
CountNbOfItemsInStorage: ; 0x0200FD78
	ldr r1, _0200FDAC ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r3, [r1]
	mov r2, r0
_0200FD88:
	add r1, r3, r2, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #0x3e8
	blt _0200FD88
	bx lr
	.align 2, 0
_0200FDAC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfItemsInStorage

	arm_func_start CountNbOfValidItemsInStorage
CountNbOfValidItemsInStorage: ; 0x0200FDB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _0200FDFC ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r5
_0200FDC0:
	ldr r0, [r4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _0200FDE8
	ldrsh r0, [r0, #0x8a]
	bl IsItemValidVeneer
	cmp r0, #0
	addne r5, r5, #1
_0200FDE8:
	add r6, r6, #1
	cmp r6, #0x3e8
	blt _0200FDC0
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200FDFC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfValidItemsInStorage

	arm_func_start CountNbOfValidItemsInTimeDarknessInStorage
CountNbOfValidItemsInTimeDarknessInStorage: ; 0x0200FE00
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _0200FEA4 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r4
_0200FE10:
	ldr r0, [r6]
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r7, [r0, #0x8a]
	cmp r7, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsTreasureBox
	cmp r0, #0
	beq _0200FE8C
	ldr r0, [r6]
	add r0, r0, r5, lsl #1
	add r0, r0, #0xb00
	ldrsh r7, [r0, #0x5a]
	mov r0, r7
	bl IsItemValidVeneer
	cmp r0, #0
	beq _0200FE90
	mov r0, r7
	bl IsItemInTimeDarkness
	cmp r0, #0
	addne r4, r4, #1
	b _0200FE90
_0200FE8C:
	add r4, r4, #1
_0200FE90:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0200FE10
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FEA4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbOfValidItemsInTimeDarknessInStorage

	arm_func_start CountNbItemsOfTypeInStorage
CountNbItemsOfTypeInStorage: ; 0x0200FEA8
	ldr r1, _0200FEE0 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr ip, [r1]
	mov r3, r2
_0200FEB8:
	add r1, ip, r3, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	add r3, r3, #1
	cmp r0, r1
	addeq r2, r2, #1
	cmp r3, #0x3e8
	blt _0200FEB8
	mov r0, r2
	bx lr
	.align 2, 0
_0200FEE0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbItemsOfTypeInStorage

	arm_func_start CountItemTypeInStorage
CountItemTypeInStorage: ; 0x0200FEE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _0200FF4C ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	mov r5, r4
_0200FEF8:
	ldr r1, [r7]
	ldrsh r0, [r6]
	add r1, r1, r5, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r0, r1
	bne _0200FF38
	bl IsThrownItem
	cmp r0, #0
	addeq r4, r4, #1
	beq _0200FF38
	ldr r0, [r7]
	add r0, r0, r5, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	add r4, r4, r0
_0200FF38:
	add r5, r5, #1
	cmp r5, #0x3e8
	blt _0200FEF8
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200FF4C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountItemTypeInStorage

	arm_func_start GetEquivBulkItemIdxInStorage
GetEquivBulkItemIdxInStorage: ; 0x0200FF50
	stmdb sp!, {r3, lr}
	ldr r1, _0200FFA8 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr lr, [r1]
	b _0200FF98
_0200FF64:
	add r2, lr, ip, lsl #1
	add r1, r2, #0x300
	ldrsh r3, [r0]
	ldrsh r1, [r1, #0x8a]
	cmp r3, r1
	addeq r1, r2, #0xb00
	ldreqh r2, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r2, r1
	moveq r0, ip, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmeqia sp!, {r3, pc}
	add ip, ip, #1
_0200FF98:
	cmp ip, #0x3e8
	blt _0200FF64
	mvn r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200FFA8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetEquivBulkItemIdxInStorage

	arm_func_start ConvertStorageItemAtIdxToBulkItem
ConvertStorageItemAtIdxToBulkItem: ; 0x0200FFAC
	ldr r3, _0200FFF0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r2, [r3]
	add r2, r2, r0, lsl #1
	add r2, r2, #0x300
	ldrsh r2, [r2, #0x8a]
	strh r2, [r1]
	ldr r2, [r3]
	add r0, r2, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r1, #2]
	ldrsh r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0200FFF0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ConvertStorageItemAtIdxToBulkItem

	arm_func_start ConvertStorageItemAtIdxToItem
ConvertStorageItemAtIdxToItem: ; 0x0200FFF4
	ldr r3, _02010040 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r3]
	add r2, r2, r0, lsl #1
	add r2, r2, #0x300
	ldrsh r2, [r2, #0x8a]
	strh r2, [r1, #4]
	ldr r2, [r3]
	add r0, r2, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	strh r0, [r1, #2]
	strb ip, [r1]
	strb ip, [r1, #1]
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne ip, #1
	and r0, ip, #0xff
	bx lr
	.align 2, 0
_02010040: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ConvertStorageItemAtIdxToItem

	arm_func_start sub_02010044
sub_02010044: ; 0x02010044
	ldr r1, _0201005C ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bx lr
	.align 2, 0
_0201005C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010044

	arm_func_start sub_02010060
sub_02010060: ; 0x02010060
	ldr r1, _02010078 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	ldrh r0, [r0, #0x5a]
	bx lr
	.align 2, 0
_02010078: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010060

	arm_func_start sub_0201007C
sub_0201007C: ; 0x0201007C
	stmdb sp!, {r3, lr}
	ldr r1, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r2, [r1]
	b _02010144
_02010090:
	add r1, r2, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0
	bne _02010140
	mov r1, r0
	add r0, r0, #1
	ldr r3, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	b _020100FC
_020100B4:
	ldr lr, [r3]
	add r2, lr, r0, lsl #1
	add r2, r2, #0x300
	ldrsh ip, [r2, #0x8a]
	cmp ip, #0
	beq _020100F8
	add r2, lr, r1, lsl #1
	add r2, r2, #0x300
	strh ip, [r2, #0x8a]
	ldr lr, [r3]
	add r2, lr, r0, lsl #1
	add r2, r2, #0xb00
	ldrh ip, [r2, #0x5a]
	add r2, lr, r1, lsl #1
	add r2, r2, #0xb00
	strh ip, [r2, #0x5a]
	add r1, r1, #1
_020100F8:
	add r0, r0, #1
_020100FC:
	cmp r0, #0x3e8
	blt _020100B4
	mov r3, #0
	ldr r2, _02010150 ; =BAG_ITEMS_PTR_MIRROR
	b _02010134
_02010110:
	ldr r0, [r2]
	add r0, r0, r1, lsl #1
	add r0, r0, #0x300
	strh r3, [r0, #0x8a]
	ldr r0, [r2]
	add r0, r0, r1, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	add r1, r1, #1
_02010134:
	cmp r1, #0x3e8
	blt _02010110
	ldmia sp!, {r3, pc}
_02010140:
	add r0, r0, #1
_02010144:
	cmp r0, #0x3e8
	blt _02010090
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010150: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201007C

	arm_func_start sub_02010154
sub_02010154: ; 0x02010154
	stmdb sp!, {r3, lr}
	ldr r2, _0201019C ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r3, [r1, #0x8a]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r3, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201019C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010154

	arm_func_start RemoveItemAtIdxInStorage
RemoveItemAtIdxInStorage: ; 0x020101A0
	ldr r2, _020101E0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x300
	ldrsh r3, [r1, #0x8a]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	mov r3, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	add r0, r1, r0, lsl #1
	add r0, r0, #0xb00
	strh r3, [r0, #0x5a]
	mov r0, #1
	bx lr
	.align 2, 0
_020101E0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemAtIdxInStorage

	arm_func_start RemoveBulkItemInStorage
RemoveBulkItemInStorage: ; 0x020101E4
	stmdb sp!, {r4, lr}
	ldr r1, _0201025C ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r1]
	b _0201024C
_020101F8:
	add r3, r4, lr, lsl #1
	add r2, r3, #0x300
	ldrsh ip, [r0]
	ldrsh r1, [r2, #0x8a]
	cmp ip, r1
	addeq r1, r3, #0xb00
	ldreqh r3, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r3, r1
	bne _02010248
	mov r1, #0
	ldr r0, _0201025C ; =BAG_ITEMS_PTR_MIRROR
	strh r1, [r2, #0x8a]
	ldr r0, [r0]
	add r0, r0, lr, lsl #1
	add r0, r0, #0xb00
	strh r1, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02010248:
	add lr, lr, #1
_0201024C:
	cmp lr, #0x3e8
	blt _020101F8
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201025C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveBulkItemInStorage

	arm_func_start RemoveItemInStorage
RemoveItemInStorage: ; 0x02010260
	stmdb sp!, {r4, lr}
	ldr r1, _020102D8 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r1]
	b _020102C8
_02010274:
	add r3, r4, lr, lsl #1
	add r2, r3, #0x300
	ldrsh ip, [r0, #4]
	ldrsh r1, [r2, #0x8a]
	cmp ip, r1
	addeq r1, r3, #0xb00
	ldreqh r3, [r0, #2]
	ldreqh r1, [r1, #0x5a]
	cmpeq r3, r1
	bne _020102C4
	mov r1, #0
	ldr r0, _020102D8 ; =BAG_ITEMS_PTR_MIRROR
	strh r1, [r2, #0x8a]
	ldr r0, [r0]
	add r0, r0, lr, lsl #1
	add r0, r0, #0xb00
	strh r1, [r0, #0x5a]
	bl sub_0201007C
	mov r0, #1
	ldmia sp!, {r4, pc}
_020102C4:
	add lr, lr, #1
_020102C8:
	cmp lr, #0x3e8
	blt _02010274
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020102D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemInStorage

	arm_func_start StorageZInit
StorageZInit: ; 0x020102DC
	mov r3, #0
	ldr r1, _02010318 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r3
_020102E8:
	ldr r0, [r1]
	add r0, r0, r3, lsl #1
	add r0, r0, #0x300
	strh r2, [r0, #0x8a]
	ldr r0, [r1]
	add r0, r0, r3, lsl #1
	add r0, r0, #0xb00
	add r3, r3, #1
	strh r2, [r0, #0x5a]
	cmp r3, #0x3e8
	blt _020102E8
	bx lr
	.align 2, 0
_02010318: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end StorageZInit

	arm_func_start AddBulkItemToStorage
AddBulkItemToStorage: ; 0x0201031C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	bl GetRankStorageSize
	mov r5, r0
	add r0, sp, #0
	mov r1, r4
	bl BulkItemToItem
	ldr r0, _020103A8 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r2, [r0]
	b _02010394
_0201034C:
	add r0, r2, ip, lsl #1
	add r1, r0, #0x300
	ldrsh r0, [r1, #0x8a]
	cmp r0, #0
	bne _02010390
	ldrsh r3, [r4]
	ldr r2, _020103A8 ; =BAG_ITEMS_PTR_MIRROR
	add r0, sp, #0
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	ldrh r2, [r4, #2]
	add r1, r1, ip, lsl #1
	add r1, r1, #0xb00
	strh r2, [r1, #0x5a]
	bl SetItemAcquired
	mov r0, #1
	b _020103A0
_02010390:
	add ip, ip, #1
_02010394:
	cmp ip, r5
	blt _0201034C
	mov r0, #0
_020103A0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020103A8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddBulkItemToStorage

	arm_func_start AddItemToStorage
AddItemToStorage: ; 0x020103AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetRankStorageSize
	ldr r1, _02010420 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr r3, [r1]
	b _02010410
_020103C8:
	add r1, r3, ip, lsl #1
	add r1, r1, #0x300
	ldrsh r2, [r1, #0x8a]
	cmp r2, #0
	bne _0201040C
	ldrsh r3, [r4, #4]
	ldr r2, _02010420 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, r4
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	ldrh r2, [r4, #2]
	add r1, r1, ip, lsl #1
	add r1, r1, #0xb00
	strh r2, [r1, #0x5a]
	bl SetItemAcquired
	mov r0, #1
	ldmia sp!, {r4, pc}
_0201040C:
	add ip, ip, #1
_02010410:
	cmp ip, r0
	blt _020103C8
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02010420: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddItemToStorage

	arm_func_start SortItemsInStorage
SortItemsInStorage: ; 0x02010424
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r1, #6
	mov sl, r0
	mul r0, sb, r1
	mov r1, #0
	bl MemAlloc
	mov r5, #6
	mov r7, r0
	mov r8, #0
	mov fp, #0x80
	ldr r6, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	mov r4, r5
	b _020104C8
_0201045C:
	ldr r0, [r6]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	cmp r0, #0
	beq _020104D0
	mla r0, r8, r5, r7
	bl ItemZInit
	ldrb r0, [sl, r8]
	mul r2, r8, r4
	cmp r0, #0
	movne r0, fp
	moveq r0, #0
	orr r0, r0, #1
	strb r0, [r7, r2]
	ldr r1, [r6]
	add r0, r7, r2
	add r1, r1, r8, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	strh r1, [r0, #4]
	ldr r1, [r6]
	add r1, r1, r8, lsl #1
	add r1, r1, #0xb00
	ldrh r1, [r1, #0x5a]
	add r8, r8, #1
	strh r1, [r0, #2]
_020104C8:
	cmp r8, sb
	blt _0201045C
_020104D0:
	mov r0, r7
	mov r1, r8
	bl SortItemList
	mov r6, #0
	mov r1, r6
	mov r2, #1
	mov fp, #6
	ldr r0, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	b _0201053C
_020104F4:
	mul r4, r6, fp
	add r5, r7, r4
	ldr ip, [r0]
	ldrsh r3, [r5, #4]
	add ip, ip, r6, lsl #1
	add ip, ip, #0x300
	strh r3, [ip, #0x8a]
	ldr ip, [r0]
	ldrh r3, [r5, #2]
	add r5, ip, r6, lsl #1
	add r5, r5, #0xb00
	strh r3, [r5, #0x5a]
	ldrb r3, [r7, r4]
	tst r3, #0x80
	movne r3, r2
	moveq r3, r1
	strb r3, [sl, r6]
	add r6, r6, #1
_0201053C:
	cmp r6, r8
	blt _020104F4
	mov r2, #0
	ldr r1, _0201058C ; =BAG_ITEMS_PTR_MIRROR
	b _02010578
_02010550:
	ldr r0, [r1]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	strh r2, [r0, #0x8a]
	ldr r0, [r1]
	add r0, r0, r6, lsl #1
	add r0, r0, #0xb00
	strh r2, [r0, #0x5a]
	strb r2, [sl, r6]
	add r6, r6, #1
_02010578:
	cmp r6, sb
	blt _02010550
	mov r0, r7
	bl MemFree
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201058C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortItemsInStorage

	arm_func_start sub_02010590
sub_02010590: ; 0x02010590
	bx lr
	arm_func_end sub_02010590

	arm_func_start AllKecleonShopsZInit
AllKecleonShopsZInit: ; 0x02010594
	stmdb sp!, {r4, r5, r6, lr}
	mov r2, #0
	ldr ip, _02010650 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r2
	mov r0, r2
	mov r1, r2
_020105AC:
	mov r6, r1
_020105B0:
	ldr r3, [ip]
	mov r4, r6, lsl #2
	add r3, r3, #0x330
	add r3, r3, #0x1000
	add r3, r3, r2, lsl #5
	add lr, r3, r6, lsl #2
	strh r5, [r3, r4]
	add r6, r6, #1
	strh r5, [lr, #2]
	cmp r6, #8
	blt _020105B0
	mov r6, r5
_020105E0:
	ldr r3, [ip]
	mov lr, r6, lsl #2
	add r3, r3, #0x374
	add r3, r3, #0x1000
	add r3, r3, r2, lsl #4
	add r4, r3, r6, lsl #2
	strh r0, [r3, lr]
	add r6, r6, #1
	strh r0, [r4, #2]
	cmp r6, #4
	blt _020105E0
	add r2, r2, #1
	cmp r2, #2
	blt _020105AC
	ldr r2, _02010650 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x3a0]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa4]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa6]
	ldr r1, [r2]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02010650: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AllKecleonShopsZInit

	arm_func_start SpecialEpisodeKecleonShopZInit
SpecialEpisodeKecleonShopZInit: ; 0x02010654
	stmdb sp!, {r3, lr}
	mov lr, #0
	ldr r2, _020106C0 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, lr
_02010664:
	ldr r1, [r2]
	mov r3, lr, lsl #2
	add r1, r1, #0x350
	add r1, r1, #0x1000
	add ip, r1, lr, lsl #2
	strh r0, [r1, r3]
	add lr, lr, #1
	strh r0, [ip, #2]
	cmp lr, #8
	blt _02010664
	ldr r2, _020106C0 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
_02010694:
	ldr r1, [r2]
	mov ip, r0, lsl #2
	add r1, r1, #0x384
	add r1, r1, #0x1000
	add lr, r1, r0, lsl #2
	strh r3, [r1, ip]
	add r0, r0, #1
	strh r3, [lr, #2]
	cmp r0, #4
	blt _02010694
	ldmia sp!, {r3, pc}
	.align 2, 0
_020106C0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SpecialEpisodeKecleonShopZInit

	arm_func_start SetActiveKecleonShop
SetActiveKecleonShop: ; 0x020106C4
	ldr r2, _02010708 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x32a]
	ldr ip, [r2]
	add r1, ip, #0x330
	add r1, r1, #0x1000
	add r3, r1, r0, lsl #5
	add r1, ip, #0x1000
	str r3, [r1, #0x32c]
	ldr r2, [r2]
	add r1, r2, #0x374
	add r1, r1, #0x1000
	add r1, r1, r0, lsl #4
	add r0, r2, #0x1000
	str r1, [r0, #0x370]
	bx lr
	.align 2, 0
_02010708: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetActiveKecleonShop

	arm_func_start GetMoneyStored
GetMoneyStored: ; 0x0201070C
	ldr r0, _02010720 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3a0]
	bx lr
	.align 2, 0
_02010720: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end GetMoneyStored

	arm_func_start SetMoneyStored
SetMoneyStored: ; 0x02010724
	ldr r1, _02010750 ; =0x0098967F
	cmp r0, r1
	movgt r0, r1
	bgt _0201073C
	cmp r0, #0
	movlt r0, #0
_0201073C:
	ldr r1, _02010754 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x3a0]
	bx lr
	.align 2, 0
_02010750: .word 0x0098967F
_02010754: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SetMoneyStored

	arm_func_start AddMoneyStored
AddMoneyStored: ; 0x02010758
	ldr r1, _02010774 ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _02010778 ; =SetMoneyStored
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x3a0]
	add r0, r1, r0
	bx ip
	.align 2, 0
_02010774: .word BAG_ITEMS_PTR_MIRROR
_02010778: .word SetMoneyStored
	arm_func_end AddMoneyStored

	arm_func_start sub_0201077C
sub_0201077C: ; 0x0201077C
	ldr r0, _02010790 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xa4]
	bx lr
	.align 2, 0
_02010790: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201077C

	arm_func_start sub_02010794
sub_02010794: ; 0x02010794
	ldr r1, _020107A8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_020107A8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010794

	arm_func_start sub_020107AC
sub_020107AC: ; 0x020107AC
	ldr r0, _020107C0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xa6]
	bx lr
	.align 2, 0
_020107C0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107AC

	arm_func_start sub_020107C4
sub_020107C4: ; 0x020107C4
	ldr r1, _020107D8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa6]
	bx lr
	.align 2, 0
_020107D8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107C4

	arm_func_start sub_020107DC
sub_020107DC: ; 0x020107DC
	ldr r0, _020107F0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xa8]
	bx lr
	.align 2, 0
_020107F0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107DC

	arm_func_start sub_020107F4
sub_020107F4: ; 0x020107F4
	ldr r1, _02010808 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0xa8]
	bx lr
	.align 2, 0
_02010808: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020107F4

	arm_func_start sub_0201080C
sub_0201080C: ; 0x0201080C
	ldr r0, _0201082C ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r1, [r0, #0xa8]
	cmp r1, #0
	subne r1, r1, #1
	strneh r1, [r0, #0xa8]
	bx lr
	.align 2, 0
_0201082C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201080C

	arm_func_start sub_02010830
sub_02010830: ; 0x02010830
	ldr r1, _02010868 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov r2, r0
	add r1, r1, #0x1000
	ldr r3, [r1, #0x32c]
_02010848:
	mov r1, r2, lsl #2
	ldrsh r1, [r3, r1]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #8
	blt _02010848
	bx lr
	.align 2, 0
_02010868: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010830

	arm_func_start sub_0201086C
sub_0201086C: ; 0x0201086C
	ldr r1, _02010894 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r0, lsl #2
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	strh r2, [r1, r3]
	add r0, r1, r0, lsl #2
	strh r2, [r0, #2]
	bx lr
	.align 2, 0
_02010894: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201086C

	arm_func_start sub_02010898
sub_02010898: ; 0x02010898
	ldr r1, _020108B0 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_020108B0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010898

	arm_func_start sub_020108B4
sub_020108B4: ; 0x020108B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r4, r0
	ldr r2, _02010950 ; =BAG_ITEMS_PTR_MIRROR
	b _020108E8
_020108C8:
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	ldrsh r1, [r1, r3]
	cmp r1, #0
	bne _020108F0
	add r0, r0, #1
_020108E8:
	cmp r0, #8
	blt _020108C8
_020108F0:
	cmp r0, #8
	beq _02010944
	cmp r0, r4
	ble _0201092C
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r5, [r1, #0x32c]
	mov lr, r4, lsl #2
	ldrh r1, [r5, r3]
	add ip, r5, r0, lsl #2
	add r3, r5, r4, lsl #2
	strh r1, [r5, lr]
	ldrh r1, [ip, #2]
	strh r1, [r3, #2]
_0201092C:
	add r0, r0, #1
	add r4, r4, #1
	b _020108E8
_02010938:
	and r0, r4, #0xff
	bl sub_0201086C
	add r4, r4, #1
_02010944:
	cmp r4, #8
	blt _02010938
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02010950: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020108B4

	arm_func_start SortKecleonItems1
SortKecleonItems1: ; 0x02010954
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, #0
_02010960:
	add r7, r6, #1
	mov r5, r6, lsl #2
	ldr r4, _02010A48 ; =BAG_ITEMS_PTR_MIRROR
	b _02010A2C
_02010970:
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x32c]
	ldrsh r0, [r5, r0]
	bl sub_0200D1F0
	ldr r1, [r4]
	mov r2, r7, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	mov r8, r0
	ldrsh r0, [r1, r2]
	bl sub_0200D1F0
	cmp r8, r0
	bgt _020109D0
	bne _02010A28
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x32c]
	add r1, r5, r0
	add r0, r0, r7, lsl #2
	ldrh r1, [r1, #2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bhs _02010A28
_020109D0:
	ldr r1, [r4]
	mov r0, r7, lsl #2
	add r1, r1, #0x1000
	ldr r8, [r1, #0x32c]
	add lr, r5, r8
	ldrh ip, [r5, r8]
	ldrh r3, [lr, #2]
	ldrh r1, [r8, r0]
	add r2, r8, r7, lsl #2
	strh ip, [sp]
	strh r1, [r5, r8]
	ldrh r1, [r2, #2]
	strh r3, [sp, #2]
	ldrh r3, [sp]
	strh r1, [lr, #2]
	ldr r1, [r4]
	ldrh r2, [sp, #2]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x32c]
	strh r3, [r1, r0]
	add r0, r1, r7, lsl #2
	strh r2, [r0, #2]
_02010A28:
	add r7, r7, #1
_02010A2C:
	cmp r7, #8
	blt _02010970
	add r6, r6, #1
	cmp r6, #7
	blt _02010960
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010A48: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortKecleonItems1

	arm_func_start GenerateKecleonItems1
GenerateKecleonItems1: ; 0x02010A4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r4, #0
_02010A58:
	and r0, r4, #0xff
	bl sub_0201086C
	add r4, r4, #1
	cmp r4, #8
	blt _02010A58
	ldr r0, _02010AC0 ; =KECLEON_SHOP_ITEM_TABLE_LISTS_1
	ldr r5, _02010AC4 ; =0x0000270F
	ldr r6, [r0, r8, lsl #2]
	mov r7, #0
_02010A7C:
	mov r0, r5
	bl RandIntSafe
	mov r4, r0
	mov r0, r5
	bl RandIntSafe
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl GetItemIdFromList
	bl sub_02010AC8
	add r7, r7, #1
	cmp r7, #8
	blt _02010A7C
	bl SortKecleonItems1
	mov r0, r8
	bl GenerateKecleonItems2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010AC0: .word KECLEON_SHOP_ITEM_TABLE_LISTS_1
_02010AC4: .word 0x0000270F
	arm_func_end GenerateKecleonItems1

	arm_func_start sub_02010AC8
sub_02010AC8: ; 0x02010AC8
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl InitBulkItem
	ldr r0, _02010B38 ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r3, [r0]
	add r0, r3, #0x1000
	b _02010B28
_02010AEC:
	ldr r1, [r0, #0x32c]
	mov ip, r2, lsl #2
	ldrsh r1, [r1, ip]
	cmp r1, #0
	bne _02010B24
	add r0, r3, #0x1000
	ldr r3, [r0, #0x32c]
	ldrh r1, [sp]
	add r2, r3, ip
	mov r0, #0
	strh r1, [r3, ip]
	ldrh r1, [sp, #2]
	strh r1, [r2, #2]
	ldmia sp!, {r3, pc}
_02010B24:
	add r2, r2, #1
_02010B28:
	cmp r2, #8
	blt _02010AEC
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010B38: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010AC8

	arm_func_start sub_02010B3C
sub_02010B3C: ; 0x02010B3C
	ldr r1, _02010B74 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	mov r2, r0
	add r1, r1, #0x1000
	ldr r3, [r1, #0x370]
_02010B54:
	mov r1, r2, lsl #2
	ldrsh r1, [r3, r1]
	add r2, r2, #1
	cmp r1, #0
	addne r0, r0, #1
	cmp r2, #4
	blt _02010B54
	bx lr
	.align 2, 0
_02010B74: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010B3C

	arm_func_start sub_02010B78
sub_02010B78: ; 0x02010B78
	ldr r1, _02010BA0 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r0, lsl #2
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	strh r2, [r1, r3]
	add r0, r1, r0, lsl #2
	strh r2, [r0, #2]
	bx lr
	.align 2, 0
_02010BA0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010B78

	arm_func_start sub_02010BA4
sub_02010BA4: ; 0x02010BA4
	ldr r1, _02010BBC ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	add r0, r1, r0, lsl #2
	bx lr
	.align 2, 0
_02010BBC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010BA4

	arm_func_start sub_02010BC0
sub_02010BC0: ; 0x02010BC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r4, r0
	ldr r2, _02010C5C ; =BAG_ITEMS_PTR_MIRROR
	b _02010BF4
_02010BD4:
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	ldrsh r1, [r1, r3]
	cmp r1, #0
	bne _02010BFC
	add r0, r0, #1
_02010BF4:
	cmp r0, #4
	blt _02010BD4
_02010BFC:
	cmp r0, #4
	beq _02010C50
	cmp r0, r4
	ble _02010C38
	ldr r1, [r2]
	mov r3, r0, lsl #2
	add r1, r1, #0x1000
	ldr r5, [r1, #0x370]
	mov lr, r4, lsl #2
	ldrh r1, [r5, r3]
	add ip, r5, r0, lsl #2
	add r3, r5, r4, lsl #2
	strh r1, [r5, lr]
	ldrh r1, [ip, #2]
	strh r1, [r3, #2]
_02010C38:
	add r0, r0, #1
	add r4, r4, #1
	b _02010BF4
_02010C44:
	and r0, r4, #0xff
	bl sub_02010B78
	add r4, r4, #1
_02010C50:
	cmp r4, #4
	blt _02010C44
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02010C5C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010BC0

	arm_func_start SortKecleonItems2
SortKecleonItems2: ; 0x02010C60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r6, #0
_02010C6C:
	add r7, r6, #1
	mov r5, r6, lsl #2
	ldr r4, _02010D54 ; =BAG_ITEMS_PTR_MIRROR
	b _02010D38
_02010C7C:
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x370]
	ldrsh r0, [r5, r0]
	bl sub_0200D1F0
	ldr r1, [r4]
	mov r2, r7, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	mov r8, r0
	ldrsh r0, [r1, r2]
	bl sub_0200D1F0
	cmp r8, r0
	bgt _02010CDC
	bne _02010D34
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x370]
	add r1, r5, r0
	add r0, r0, r7, lsl #2
	ldrh r1, [r1, #2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bhs _02010D34
_02010CDC:
	ldr r1, [r4]
	mov r0, r7, lsl #2
	add r1, r1, #0x1000
	ldr r8, [r1, #0x370]
	add lr, r5, r8
	ldrh ip, [r5, r8]
	ldrh r3, [lr, #2]
	ldrh r1, [r8, r0]
	add r2, r8, r7, lsl #2
	strh ip, [sp]
	strh r1, [r5, r8]
	ldrh r1, [r2, #2]
	strh r3, [sp, #2]
	ldrh r3, [sp]
	strh r1, [lr, #2]
	ldr r1, [r4]
	ldrh r2, [sp, #2]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x370]
	strh r3, [r1, r0]
	add r0, r1, r7, lsl #2
	strh r2, [r0, #2]
_02010D34:
	add r7, r7, #1
_02010D38:
	cmp r7, #4
	blt _02010C7C
	add r6, r6, #1
	cmp r6, #3
	blt _02010C6C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02010D54: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end SortKecleonItems2

	arm_func_start GenerateKecleonItems2
GenerateKecleonItems2: ; 0x02010D58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, #0
_02010D64:
	and r0, r4, #0xff
	bl sub_02010B78
	add r4, r4, #1
	cmp r4, #4
	blt _02010D64
	ldr r0, _02010DC4 ; =KECLEON_SHOP_ITEM_TABLE_LISTS_2
	mov r7, #0
	ldr r6, [r0, r5, lsl #2]
	ldr r5, _02010DC8 ; =0x0000270F
_02010D88:
	mov r0, r5
	bl RandIntSafe
	mov r4, r0
	mov r0, r5
	bl RandIntSafe
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl GetItemIdFromList
	bl sub_02010DCC
	add r7, r7, #1
	cmp r7, #4
	blt _02010D88
	bl SortKecleonItems2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02010DC4: .word KECLEON_SHOP_ITEM_TABLE_LISTS_2
_02010DC8: .word 0x0000270F
	arm_func_end GenerateKecleonItems2

	arm_func_start sub_02010DCC
sub_02010DCC: ; 0x02010DCC
	stmdb sp!, {r3, lr}
	mov r1, r0
	add r0, sp, #0
	bl InitBulkItem
	ldr r0, _02010E3C ; =BAG_ITEMS_PTR_MIRROR
	mov r2, #0
	ldr r3, [r0]
	add r0, r3, #0x1000
	b _02010E2C
_02010DF0:
	ldr r1, [r0, #0x370]
	mov ip, r2, lsl #2
	ldrsh r1, [r1, ip]
	cmp r1, #0
	bne _02010E28
	add r0, r3, #0x1000
	ldr r3, [r0, #0x370]
	ldrh r1, [sp]
	add r2, r3, ip
	mov r0, #0
	strh r1, [r3, ip]
	ldrh r1, [sp, #2]
	strh r1, [r2, #2]
	ldmia sp!, {r3, pc}
_02010E28:
	add r2, r2, #1
_02010E2C:
	cmp r2, #4
	blt _02010DF0
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02010E3C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02010DCC

	arm_func_start GetExclusiveItemOffset
GetExclusiveItemOffset: ; 0x02010E40
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetItemCategory
	cmp r0, #0xf
	movne r0, #0
	subeq r0, r4, #0x1bc
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end GetExclusiveItemOffset

	arm_func_start ApplyExclusiveItemStatBoosts
ApplyExclusiveItemStatBoosts: ; 0x02010E64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x28]
	bl GetExclusiveItemOffset
	ldr r1, _02010F6C ; =EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
	ldrb r2, [r7]
	ldrb r1, [r1, r0, lsl #1]
	ldrb r0, [r4]
	strh r2, [sp, #4]
	ldrb r2, [r5]
	strh r0, [sp, #2]
	ldrb r3, [r6]
	ldr r0, _02010F70 ; =EXCLUSIVE_ITEM_ATTACK_BOOSTS
	mov r1, r1, lsl #2
	strh r3, [sp, #6]
	strh r2, [sp]
	ldrsb r2, [r0, r1]
	ldr r0, _02010F74 ; =EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
	ldrh sb, [sp, #4]
	ldrsb r8, [r0, r1]
	mov r0, r2, lsl #0x10
	add r0, sb, r0, lsr #16
	strh r0, [sp, #4]
	mov r0, r8, lsl #0x10
	ldrh lr, [sp, #6]
	ldrh r2, [sp, #4]
	ldr ip, _02010F78 ; =EXCLUSIVE_ITEM_DEFENSE_BOOSTS
	add r0, lr, r0, lsr #16
	ldrsb lr, [ip, r1]
	ldr r3, _02010F7C ; =EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	ldrsh ip, [sp, #2]
	ldrsb r1, [r3, r1]
	strh r0, [sp, #6]
	ldrsh r8, [sp]
	add r0, ip, r1
	strh r0, [sp, #2]
	cmp r2, #0xff
	movhi r0, #0xff
	strhih r0, [sp, #4]
	ldrh r0, [sp, #6]
	add r3, r8, lr
	ldrh r2, [sp, #4]
	cmp r0, #0xff
	movhi r0, #0xff
	strh r3, [sp]
	strhih r0, [sp, #6]
	ldrsh r0, [sp]
	strb r2, [r7]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp]
	ldrsh r0, [sp, #2]
	ldrsh r1, [sp]
	cmp r0, #0xff
	movgt r0, #0xff
	strgth r0, [sp, #2]
	ldrh r0, [sp, #6]
	strb r0, [r6]
	ldrsh r0, [sp, #2]
	strb r1, [r5]
	strb r0, [r4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02010F6C: .word EXCLUSIVE_ITEM_STAT_BOOST_DATA_INDEXES
_02010F70: .word EXCLUSIVE_ITEM_ATTACK_BOOSTS
_02010F74: .word EXCLUSIVE_ITEM_SPECIAL_ATTACK_BOOSTS
_02010F78: .word EXCLUSIVE_ITEM_DEFENSE_BOOSTS
_02010F7C: .word EXCLUSIVE_ITEM_SPECIAL_DEFENSE_BOOSTS
	arm_func_end ApplyExclusiveItemStatBoosts

	arm_func_start SetExclusiveItemEffect
SetExclusiveItemEffect: ; 0x02010F80
	cmp r1, #0
	bxeq lr
	mov ip, r1, lsr #5
	ldr r3, [r0, ip, lsl #2]
	sub r1, r1, ip, lsl #5
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, ip, lsl #2]
	bx lr
	arm_func_end SetExclusiveItemEffect

	arm_func_start ExclusiveItemEffectFlagTest
ExclusiveItemEffectFlagTest: ; 0x02010FA4
	mov r3, r1, lsr #5
	ldr r2, [r0, r3, lsl #2]
	sub r0, r1, r3, lsl #5
	mov r1, #1
	tst r2, r1, lsl r0
	moveq r1, #0
	and r0, r1, #0xff
	bx lr
	arm_func_end ExclusiveItemEffectFlagTest

	arm_func_start IsExclusiveItemIdForMonster
IsExclusiveItemIdForMonster: ; 0x02010FC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetItemCategory
	cmp r0, #0xf
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r8, #0x258
	mov r5, #0
	ble _02011000
	mov r0, r8
	bl FemaleToMaleForm
	mov r8, r0
_02011000:
	mov r0, sb
	bl GetExclusiveItemType
	movs r4, r0
	moveq r5, #0
	beq _0201108C
	sub r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #3
	mov r0, sb
	bhi _0201104C
	bl GetExclusiveItemParameter
	and r0, r0, #0xff
	cmp r7, r0
	cmpne r6, r0
	moveq r5, #1
	b _0201108C
_0201104C:
	bl GetExclusiveItemParameter
	mov r6, r0
	cmp r4, #9
	bne _02011068
	cmp r8, r6
	moveq r5, #1
	b _0201108C
_02011068:
	cmp r4, #0xa
	bne _0201107C
	cmp r8, r6
	moveq r5, #1
	b _0201108C
_0201107C:
	mov r0, r8
	bl GetFamilyIndex
	cmp r6, r0
	moveq r5, #1
_0201108C:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end IsExclusiveItemIdForMonster

	arm_func_start IsExclusiveItemForMonster
IsExclusiveItemForMonster: ; 0x02011094
	stmdb sp!, {r3, lr}
	ldrb ip, [r0]
	tst ip, #1
	movne lr, #1
	moveq lr, #0
	tst lr, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst ip, #8
	movne ip, #1
	moveq ip, #0
	tst ip, #0xff
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrsh r0, [r0, #4]
	bl IsExclusiveItemIdForMonster
	ldmia sp!, {r3, pc}
	arm_func_end IsExclusiveItemForMonster

	arm_func_start BagHasExclusiveItemTypeForMonster
BagHasExclusiveItemTypeForMonster: ; 0x020110D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl GetCurrentBagCapacity
	mov r4, r0, lsl #0x10
	mov r5, #0
	ldr fp, _02011164 ; =EXCLUSIVE_ITEM_EFFECT_DATA
	b _02011154
_02011100:
	ldr r0, _02011168 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, sb
	ldr r0, [r0]
	mov r2, r8
	ldr r3, [r0, #0x384]
	mov r0, #6
	smlabb r6, r5, r0, r3
	mov r0, r6
	mov r3, r7
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _02011148
	ldrsh r0, [r6, #4]
	bl GetExclusiveItemOffset
	ldrb r0, [fp, r0, lsl #1]
	cmp sl, r0
	ldreqsh r0, [r6, #4]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02011148:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02011154:
	cmp r5, r4, asr #16
	blt _02011100
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011164: .word EXCLUSIVE_ITEM_EFFECT_DATA
_02011168: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end BagHasExclusiveItemTypeForMonster

	arm_func_start GetExclusiveItemForMonsterFromBag
GetExclusiveItemForMonsterFromBag: ; 0x0201116C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov fp, r3
	ldr r7, [sp, #0x28]
	bl GetCurrentBagCapacity
	mov r4, r0, lsl #0x10
	mov r5, #0
	b _02011208
_02011194:
	ldr r0, _02011218 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, r8
	ldr r0, [r0]
	mov r2, fp
	ldr r3, [r0, #0x384]
	mov r0, #6
	smlabb r6, r5, r0, r3
	mov r0, r6
	mov r3, r7
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _020111FC
	ldrsh r0, [r6, #4]
	bl GetExclusiveItemOffset
	ldr r1, _0201121C ; =EXCLUSIVE_ITEM_EFFECT_DATA
	ldrb r0, [r1, r0, lsl #1]
	cmp sb, r0
	bne _020111FC
	ldrh r1, [r6]
	mov r0, #1
	strh r1, [sl]
	ldrh r1, [r6, #2]
	strh r1, [sl, #2]
	ldrh r1, [r6, #4]
	strh r1, [sl, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020111FC:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02011208:
	cmp r5, r4, asr #16
	blt _02011194
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011218: .word BAG_ITEMS_PTR_MIRROR
_0201121C: .word EXCLUSIVE_ITEM_EFFECT_DATA
	arm_func_end GetExclusiveItemForMonsterFromBag

	arm_func_start sub_02011220
sub_02011220: ; 0x02011220
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x68
	mov r8, r0
	mov r7, r1
	mov fp, r2
	str r3, [sp, #4]
	bl GetCurrentBagCapacity
	mov sb, r0, lsl #0x10
	mov r0, r8
	mov r1, #0x18
	mov r5, #0
	bl MemZero
	mov r4, r5
	b _0201130C
_02011258:
	ldr r1, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #6
	ldr r1, [r1]
	smulbb r6, r4, r0
	ldr r0, [r1, #0x384]
	ldr r3, [sp, #4]
	mov r1, r7
	mov r2, fp
	add r0, r0, r6
	bl IsExclusiveItemForMonster
	cmp r0, #0
	beq _02011300
	ldr r0, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	mov ip, lr
	ldr sl, [r0]
	b _020112D8
_0201129C:
	ldr r3, [sl, #0x384]
	mov r1, ip, lsl #1
	add r0, sp, #8
	ldrsh r2, [r0, r1]
	add r0, r3, r6
	ldrsh r1, [r0, #4]
	mov r0, #6
	smlabb r0, r2, r0, r3
	ldrsh r0, [r0, #4]
	cmp r0, r1
	moveq lr, #1
	beq _020112E0
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov ip, r0, asr #0x10
_020112D8:
	cmp ip, r5
	blt _0201129C
_020112E0:
	cmp lr, #0
	bne _02011300
	add r0, r5, #1
	mov r1, r0, lsl #0x10
	mov r2, r5, lsl #1
	add r0, sp, #8
	strh r4, [r0, r2]
	mov r5, r1, asr #0x10
_02011300:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201130C:
	cmp r4, sb, asr #16
	blt _02011258
	mov sl, #0
	add r4, r8, #3
	add r7, sp, #8
	ldr r6, _02011390 ; =EXCLUSIVE_ITEM_EFFECT_DATA
	ldr fp, _0201138C ; =BAG_ITEMS_PTR_MIRROR
	b _0201137C
_0201132C:
	mov r0, sl, lsl #1
	ldr r2, [fp]
	ldrsh r1, [r7, r0]
	ldr r2, [r2, #0x384]
	mov r0, #6
	smlabb sb, r1, r0, r2
	ldrsh r0, [sb, #4]
	bl GetExclusiveItemOffset
	ldrb r1, [r6, r0, lsl #1]
	add r0, r8, #4
	bl SetExclusiveItemEffect
	str r4, [sp]
	ldrsh r0, [sb, #4]
	mov r1, r8
	add r2, r8, #1
	add r3, r8, #2
	bl ApplyExclusiveItemStatBoosts
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, asr #0x10
_0201137C:
	cmp sl, r5
	blt _0201132C
	add sp, sp, #0x68
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201138C: .word BAG_ITEMS_PTR_MIRROR
_02011390: .word EXCLUSIVE_ITEM_EFFECT_DATA
	arm_func_end sub_02011220

	arm_func_start GetHpBoostFromExclusiveItems
GetHpBoostFromExclusiveItems: ; 0x02011394
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #4
	mov r1, #0x4c
	mov r4, #0
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	ldrne r0, _0201141C ; =_020A1878
	mov r1, #0x4d
	ldrnesh r0, [r0]
	addne r0, r4, r0
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
	add r0, r5, #4
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	ldrne r0, _0201141C ; =_020A1878
	mov r1, #0x4e
	ldrnesh r0, [r0]
	addne r0, r4, r0, lsl #1
	movne r0, r0, lsl #0x10
	movne r4, r0, asr #0x10
	add r0, r5, #4
	bl ExclusiveItemEffectFlagTest
	cmp r0, #0
	beq _02011414
	ldr r0, _0201141C ; =_020A1878
	ldrsh r0, [r0]
	add r0, r0, r0, lsl #1
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02011414:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201141C: .word _020A1878
	arm_func_end GetHpBoostFromExclusiveItems

	arm_func_start sub_02011420
sub_02011420: ; 0x02011420
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r1, #0
	bl GetType
	mov r4, r0
	mov r0, sl
	mov r1, #1
	bl GetType
	mov r5, r0
	mov r0, #8
	mov r1, #0
	bl MemAlloc
	mov r6, r0
	mov r0, #0xaf0
	mov r1, #0
	bl MemAlloc
	ldr fp, _020114F4 ; =0x00000578
	mov r8, r0
	mov sb, #0
	mov r7, #0x1bc
_02011470:
	mov r0, r7
	mov r1, sl
	mov r2, r4
	mov r3, r5
	bl IsExclusiveItemIdForMonster
	cmp r0, #0
	addne r0, sb, #1
	movne r1, sb, lsl #1
	movne r0, r0, lsl #0x10
	movne sb, r0, asr #0x10
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	strneh r7, [r8, r1]
	cmp fp, r0, asr #16
	mov r7, r0, asr #0x10
	bgt _02011470
	mov r0, sb, lsl #1
	mov r1, #0
	bl MemAlloc
	stmia r6, {r0, sb}
	mov r3, #0
	b _020114DC
_020114C8:
	mov r2, r3, lsl #1
	ldrsh r1, [r8, r2]
	ldr r0, [r6]
	add r3, r3, #1
	strh r1, [r0, r2]
_020114DC:
	cmp r3, sb
	blt _020114C8
	mov r0, r8
	bl MemFree
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020114F4: .word 0x00000578
	arm_func_end sub_02011420

	arm_func_start sub_020114F8
sub_020114F8: ; 0x020114F8
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
	arm_func_end sub_020114F8

	arm_func_start ApplyGummiBoostsToGroundMonster
ApplyGummiBoostsToGroundMonster: ; 0x02011528
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #4
	add r1, ip, #8
	add r2, ip, #0xc
	add r3, ip, #0xe
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToGroundMonster

	arm_func_start ApplyGummiBoostsToTeamMember
ApplyGummiBoostsToTeamMember: ; 0x02011554
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov ip, r0
	stmia sp, {r1, r2, r3}
	add r0, ip, #0xc
	add r1, ip, #6
	add r2, ip, #0x12
	add r3, ip, #0x14
	bl ApplyGummiBoostsGroundMode
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ApplyGummiBoostsToTeamMember

	arm_func_start ApplySitrusBerryBoostToGroundMonster
ApplySitrusBerryBoostToGroundMonster: ; 0x02011580
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115B8 ; =SITRUS_BERRY_FULL_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl sub_02054FB8
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115B8: .word SITRUS_BERRY_FULL_HP_BOOST
	arm_func_end ApplySitrusBerryBoostToGroundMonster

	arm_func_start ApplyLifeSeedBoostToGroundMonster
ApplyLifeSeedBoostToGroundMonster: ; 0x020115BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020115F4 ; =LIFE_SEED_HP_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrsh r4, [r7, #0xa]
	mov r6, r1
	add r0, r7, #0xa
	mov r1, r5
	bl sub_02054FB8
	cmp r6, #0
	strne r5, [r6]
	ldrsh r0, [r7, #0xa]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020115F4: .word LIFE_SEED_HP_BOOST
	arm_func_end ApplyLifeSeedBoostToGroundMonster

	arm_func_start ApplyGinsengToGroundMonster
ApplyGinsengToGroundMonster: ; 0x020115F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	mov r0, #0x64
	mov sb, r1
	mov r8, r2
	mvn r4, #0
	mov r6, #0
	bl RandInt
	ldr r1, _02011708 ; =GINSENG_CHANCE_3
	mov ip, #0
	ldrsh r1, [r1]
	mov r2, #1
	cmp r0, r1
	movlt r7, #3
	movge r7, #1
	mov r1, ip
	mov r0, #6
	b _02011664
_02011640:
	mla r3, ip, r0, r5
	ldrb r3, [r3, #0x22]
	tst r3, #1
	movne r3, r2
	moveq r3, r1
	tst r3, #0xff
	movne r4, ip
	bne _0201166C
	add ip, ip, #1
_02011664:
	cmp ip, #4
	blt _02011640
_0201166C:
	mvn r0, #0
	cmp r4, r0
	bne _02011698
	cmp sb, #0
	movne r0, #0
	strneh r0, [sb]
	cmp r8, #0
	movne r0, #0
	strne r0, [r8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02011698:
	add r1, r5, #0x22
	mov r0, #6
	mla r5, r4, r0, r1
	mov r0, r5
	bl GetMoveBasePowerGround
	cmp r0, #0
	beq _020116E4
	mov r0, r5
	ldrb r4, [r5, #4]
	bl GetMoveMaxGinsengBoostGround
	ldrb r1, [r5, #4]
	add r2, r1, r7
	and r1, r2, #0xff
	strb r2, [r5, #4]
	cmp r1, r0
	strgeb r0, [r5, #4]
	ldrb r0, [r5, #4]
	cmp r4, r0
	movne r6, #1
_020116E4:
	cmp sb, #0
	ldrneh r0, [r5, #2]
	strneh r0, [sb]
	cmp r8, #0
	strne r7, [r8]
	cmp r6, #0
	moveq r7, #0
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02011708: .word GINSENG_CHANCE_3
	arm_func_end ApplyGinsengToGroundMonster

	arm_func_start ApplyProteinBoostToGroundMonster
ApplyProteinBoostToGroundMonster: ; 0x0201170C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011744 ; =PROTEIN_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xc]
	mov r6, r1
	add r0, r7, #0xc
	mov r1, r5
	bl sub_02054FEC
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xc]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011744: .word PROTEIN_STAT_BOOST
	arm_func_end ApplyProteinBoostToGroundMonster

	arm_func_start ApplyCalciumBoostToGroundMonster
ApplyCalciumBoostToGroundMonster: ; 0x02011748
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02011780 ; =CALCIUM_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xd]
	mov r6, r1
	add r0, r7, #0xd
	mov r1, r5
	bl sub_02054FEC
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xd]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02011780: .word CALCIUM_STAT_BOOST
	arm_func_end ApplyCalciumBoostToGroundMonster

	arm_func_start ApplyIronBoostToGroundMonster
ApplyIronBoostToGroundMonster: ; 0x02011784
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117BC ; =IRON_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xe]
	mov r6, r1
	add r0, r7, #0xe
	mov r1, r5
	bl sub_02055020
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xe]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117BC: .word IRON_STAT_BOOST
	arm_func_end ApplyIronBoostToGroundMonster

	arm_func_start ApplyZincBoostToGroundMonster
ApplyZincBoostToGroundMonster: ; 0x020117C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020117F8 ; =ZINC_STAT_BOOST
	mov r7, r0
	ldrsh r5, [r2]
	ldrb r4, [r7, #0xf]
	mov r6, r1
	add r0, r7, #0xf
	mov r1, r5
	bl sub_02055020
	cmp r6, #0
	strne r5, [r6]
	ldrb r0, [r7, #0xf]
	sub r0, r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020117F8: .word ZINC_STAT_BOOST
	arm_func_end ApplyZincBoostToGroundMonster

	arm_func_start ApplyNectarBoostToGroundMonster
ApplyNectarBoostToGroundMonster: ; 0x020117FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrsh r4, [r6, #8]
	mov r5, r1
	add r0, r6, #8
	mov r1, #0xa
	bl sub_02055054
	cmp r5, #0
	movne r0, #0xa
	strne r0, [r5]
	ldrsh r0, [r6, #8]
	sub r0, r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ApplyNectarBoostToGroundMonster

	arm_func_start IsMonsterAffectedByGravelyrockGroundMode
IsMonsterAffectedByGravelyrockGroundMode: ; 0x02011830
	stmdb sp!, {r3, lr}
	ldrsh r0, [r0, #4]
	bl FemaleToMaleForm
	cmp r0, #0x1e0
	cmpne r0, #0xb9
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsMonsterAffectedByGravelyrockGroundMode

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
	bl sub_02055054
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
	bl sub_02054FEC
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
	bl sub_02054FEC
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
	bl sub_02055020
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
	bl sub_02055020
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02011AA0: .word WONDER_GUMMI_IQ_GAIN
_02011AA4: .word WONDER_GUMMI_STAT_BOOST
_02011AA8: .word GUMMI_STAT_BOOST
_02011AAC: .word IQ_GUMMI_GAIN_TABLE
_02011AB0: .word 0x000003E7
_02011AB4: .word _0209889C
	arm_func_end ApplyGummiBoostsGroundMode

	arm_func_start sub_02011AB8
sub_02011AB8: ; 0x02011AB8
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
	arm_func_end sub_02011AB8

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
	bl sub_020128DC
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

	arm_func_start sub_02011DB8
sub_02011DB8: ; 0x02011DB8
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
	arm_func_end sub_02011DB8

	arm_func_start sub_02011DF0
sub_02011DF0: ; 0x02011DF0
	ldr r0, [r0]
	ldrsh r0, [r0]
	bx lr
	arm_func_end sub_02011DF0

	arm_func_start sub_02011DFC
sub_02011DFC: ; 0x02011DFC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02011DFC

	arm_func_start sub_02011E18
sub_02011E18: ; 0x02011E18
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	bx lr
	arm_func_end sub_02011E18

	arm_func_start sub_02011E24
sub_02011E24: ; 0x02011E24
	mov ip, #0
	mov r3, ip
	b _02011E58
_02011E30:
	ldr r2, [r0]
	mov r1, r3, lsl #2
	add r2, r2, #0x14
	ldrsh r1, [r2, r1]
	add r2, r2, r3, lsl #2
	cmp r1, #0
	beq _02011E60
	ldrsh r1, [r2, #2]
	add r3, r3, #1
	add ip, ip, r1
_02011E58:
	cmp r3, #4
	blt _02011E30
_02011E60:
	mov r0, ip
	bx lr
	arm_func_end sub_02011E24

	arm_func_start sub_02011E68
sub_02011E68: ; 0x02011E68
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02011EB4
_02011E74:
	ldr r2, [r0]
	mov r1, lr, lsl #2
	add r2, r2, #0x14
	ldrsh r1, [r2, r1]
	add ip, r2, lr, lsl #2
	cmp r1, #0
	beq _02011EBC
	add r1, r0, lr, lsl #1
	ldrsh r3, [r1, #4]
	ldrsh r2, [r1, #0xc]
	ldrsh r1, [ip, #2]
	add r2, r3, r2
	cmp r2, r1
	movlt r0, #0
	ldmltia sp!, {r3, pc}
	add lr, lr, #1
_02011EB4:
	cmp lr, #4
	blt _02011E74
_02011EBC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02011E68

	arm_func_start sub_02011EC4
sub_02011EC4: ; 0x02011EC4
	ldr r1, [r0]
	ldr r0, _02011EE4 ; =0x00000578
	ldrsh r1, [r1, #0x14]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02011EE4: .word 0x00000578
	arm_func_end sub_02011EC4

	arm_func_start sub_02011EE8
sub_02011EE8: ; 0x02011EE8
	ldr r0, _02011F10 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02011F10: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011EE8

	arm_func_start sub_02011F14
sub_02011F14: ; 0x02011F14
	ldr r0, _02011F2C ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r1, [r0, #0xb2]
	bx lr
	.align 2, 0
_02011F2C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F14

	arm_func_start sub_02011F30
sub_02011F30: ; 0x02011F30
	ldr r0, _02011F44 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	bx lr
	.align 2, 0
_02011F44: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F30

	arm_func_start sub_02011F48
sub_02011F48: ; 0x02011F48
	ldr r0, _02011F5C ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x3aa]
	bx lr
	.align 2, 0
_02011F5C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02011F48

	arm_func_start sub_02011F60
sub_02011F60: ; 0x02011F60
	stmdb sp!, {r4, lr}
	mov r0, #0
	mov r1, #0x6c
	bl LoadScriptVariableValue
	add r4, r0, #1
	ldr r1, _02011F9C ; =0x000F423F
	mov r0, #0
	cmp r4, r1
	movgt r4, r1
	mov r2, r4
	mov r1, #0x6c
	bl SaveScriptVariableValue
	mov r0, r4
	bl SetNbRecycled
	ldmia sp!, {r4, pc}
	.align 2, 0
_02011F9C: .word 0x000F423F
	arm_func_end sub_02011F60

	arm_func_start sub_02011FA0
sub_02011FA0: ; 0x02011FA0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r0, #0
	mov r1, #0x71
	bl LoadScriptVariableValue
	and r0, r0, #0xff
	cmp r0, #1
	bne _0201207C
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #3
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r6, [r1, #0x3aa]
	ldr r5, [r1, #0x3ac]
	mov r1, r6
	mov r2, r5
	bl sub_020128DC
	mov r4, r0
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl sub_020128DC
	sub r4, r4, r0
	mov r0, #0
	mov r1, #0x6c
	bl LoadScriptVariableValue
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x3ac]
	bl GetRank
	ldr r2, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x3aa]
	ldr r1, [r2]
	mov r0, #3
	add r1, r1, #0x1000
	ldr r5, [r1, #0x3ac]
	ldrb r6, [r1, #0x3aa]
	mov r2, r5
	mov r1, r6
	bl sub_020128DC
	mov r1, r6
	mov r2, r5
	mov r5, r0
	mov r0, #2
	bl sub_020128DC
	sub r0, r5, r0
	cmp r0, r4
	ble _0201207C
	mov r0, #0
	mov r1, #0x6a
	mov r2, #1
	bl SaveScriptVariableValue
_0201207C:
	mov r0, #0
	mov r1, #0x6b
	bl LoadScriptVariableValue
	tst r0, #0xff
	bne _02012104
	mov r0, #0
	mov r1, #0x6d
	bl LoadScriptVariableValue
	mov r4, r0
	cmp r4, #5
	bge _02012104
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r1, _02012218 ; =_020988A4
	ldr r0, [r0]
	ldr r1, [r1, r4, lsl #3]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	cmp r0, r1
	blt _02012104
	bl GetScenarioBalance
	ldr r1, _0201221C ; =_020988A8
	mov r2, r4, lsl #3
	ldrsh r1, [r1, r2]
	and r1, r1, #0xff
	cmp r0, r1
	blo _02012104
	add r2, r4, #1
	mov r0, #0
	mov r1, #0x6d
	bl SaveScriptVariableValue
	mov r0, #0
	mov r1, #0x6b
	mov r2, #1
	bl SaveScriptVariableValue
_02012104:
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb2]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201213C
	bl sub_02012254
	cmp r0, #0
	moveq r2, #0
	beq _02012200
_0201213C:
	ldr r1, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #2
	ldr r1, [r1]
	add r2, r1, #0x1000
	ldrb r1, [r2, #0x3aa]
	ldr r2, [r2, #0x3ac]
	bl sub_02011B3C
	mov r4, r0
	str r4, [sp]
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02012184
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r1, [r0, #0xb2]
	b _020121E0
_02012184:
	bl Rand16Bit
	ldr r1, [r4, #4]
	bl _s32_div_f
	mov r0, #0x18
	mul r0, r1, r0
	ldr r1, [r4]
	ldr r2, _02012220 ; =RECYCLE_SHOP_ITEM_LIST
	ldr r1, [r1, r0]
	mov r3, #0
	b _020121C4
_020121AC:
	cmp r2, r1
	beq _020121D0
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	add r2, r2, #0x24
_020121C4:
	cmp r3, #0x18
	blt _020121AC
	mvn r3, #0
_020121D0:
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	strh r3, [r0, #0xb2]
_020121E0:
	add r0, sp, #0
	bl sub_02011DB8
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #2
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x1300
	strh r1, [r0, #0xb0]
_02012200:
	cmp r2, #0
	bne _0201220C
	bl sub_02012224
_0201220C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02012214: .word BAG_ITEMS_PTR_MIRROR
_02012218: .word _020988A4
_0201221C: .word _020988A8
_02012220: .word RECYCLE_SHOP_ITEM_LIST
	arm_func_end sub_02011FA0

	arm_func_start sub_02012224
sub_02012224: ; 0x02012224
	stmdb sp!, {r3, lr}
	bl sub_02012254
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02012250 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r1, [r0, #0xb0]
	sub r1, r1, #1
	strh r1, [r0, #0xb0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012250: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02012224

	arm_func_start sub_02012254
sub_02012254: ; 0x02012254
	ldr r0, _02012278 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02012278: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02012254

	arm_func_start sub_0201227C
sub_0201227C: ; 0x0201227C
	ldr r0, _02012290 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrsh r0, [r0, #0xb0]
	bx lr
	.align 2, 0
_02012290: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_0201227C

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
	bl sub_02012630
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
	bl sub_02012630
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

	arm_func_start sub_020125FC
sub_020125FC: ; 0x020125FC
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
	arm_func_end sub_020125FC

	arm_func_start sub_02012630
sub_02012630: ; 0x02012630
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
	bl sub_020125FC
	ldmia sp!, {r4, pc}
	arm_func_end sub_02012630

	arm_func_start sub_0201265C
sub_0201265C: ; 0x0201265C
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
	bl sub_02012630
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
	arm_func_end sub_0201265C

	arm_func_start sub_020126C8
sub_020126C8: ; 0x020126C8
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
	bl sub_02012630
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
	arm_func_end sub_020126C8

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
	bl sub_0201265C
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #1
	bl sub_020126C8
	add r1, sl, r8, lsl #1
	strh r0, [r1, #0xc]
	b _02012850
_02012810:
	mov r0, #0
	bl sub_0201265C
	add r1, sl, r8, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl sub_020126C8
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
	bl sub_0201007C
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
	bl sub_0201007C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02012874

	arm_func_start sub_020128DC
sub_020128DC: ; 0x020128DC
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
	bl sub_02012954
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
	arm_func_end sub_020128DC

	arm_func_start sub_02012954
sub_02012954: ; 0x02012954
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
	arm_func_end sub_02012954

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
	bl sub_02012954
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
	bl sub_0201265C
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, r5
	bl sub_020126C8
	add r1, sl, sb, lsl #1
	strh r0, [r1, #0xc]
	b _02012A84
_02012A44:
	mov r0, fp
	bl sub_0201265C
	add r1, sl, sb, lsl #1
	strh r0, [r1, #4]
	mov r0, #0
	bl sub_020126C8
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

	arm_func_start sub_02012AB8
sub_02012AB8: ; 0x02012AB8
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
	arm_func_end sub_02012AB8

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
	ldr r0, _02012B2C ; =_020AF6D4
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
_02012B2C: .word _020AF6D4
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
	ldr r0, _02012B78 ; =_020AF6D4
	bl UnloadFile
	ldr r0, _02012B74 ; =_020AF6D0
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02012B74: .word _020AF6D0
_02012B78: .word _020AF6D4
	arm_func_end CloseSynthBin

	arm_func_start sub_02012B7C
sub_02012B7C: ; 0x02012B7C
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
	bl sub_020132A4
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
	bl sub_020132A4
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
	arm_func_end sub_02012B7C

	arm_func_start sub_020130B8
sub_020130B8: ; 0x020130B8
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
	arm_func_end sub_020130B8

	arm_func_start sub_02013150
sub_02013150: ; 0x02013150
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
	arm_func_end sub_02013150

	arm_func_start sub_02013190
sub_02013190: ; 0x02013190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050974
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
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020131EC: .word _022A4BD8
	arm_func_end sub_02013190

	arm_func_start sub_020131F0
sub_020131F0: ; 0x020131F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02050990
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
	bl sub_020509BC
	ldr r0, [sp, #8]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201324C: .word _022A4BD8
	arm_func_end sub_020131F0

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

	arm_func_start sub_020132A4
sub_020132A4: ; 0x020132A4
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
	bl sub_0200EB90
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
	arm_func_end sub_020132A4

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

	arm_func_start InitMove
InitMove: ; 0x020137B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r2, #5
	strb r2, [r4]
	mov r2, #0
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl GetMaxPp
	strb r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #7]
	ldmia sp!, {r4, pc}
	arm_func_end InitMove

	arm_func_start InitMoveCheckId
InitMoveCheckId: ; 0x020137E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4]
	ldmeqia sp!, {r4, pc}
	mov r2, #5
	strb r2, [r4]
	mov r2, #0
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	bl GetMaxPp
	strb r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #7]
	ldmia sp!, {r4, pc}
	arm_func_end InitMoveCheckId

	arm_func_start GetInfoMoveGround
GetInfoMoveGround: ; 0x02013828
	mov r2, #5
	strb r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #4]
	bx lr
	arm_func_end GetInfoMoveGround

	arm_func_start GetMoveTargetAndRange
GetMoveTargetAndRange: ; 0x02013840
	ldr r2, _02013860 ; =DUNGEON_MOVE_TABLES
	ldrh r3, [r0, #4]
	ldr r2, [r2, #8]
	mov r0, #0x1a
	mla r0, r3, r0, r2
	add r0, r0, r1, lsl #1
	ldrsh r0, [r0, #4]
	bx lr
	.align 2, 0
_02013860: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveTargetAndRange

	arm_func_start GetMoveType
GetMoveType: ; 0x02013864
	ldr r1, _02013880 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #2]
	bx lr
	.align 2, 0
_02013880: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveType

	arm_func_start GetMovesetLevelUpPtr
GetMovesetLevelUpPtr: ; 0x02013884
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _020138C4 ; =_02098D64
	ldreq r1, _020138C8 ; =DUNGEON_MOVE_TABLES
	moveq r0, #0xc
	smulbbeq r0, r4, r0
	ldreq r1, [r1]
	ldreq r0, [r1, r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020138C4: .word _02098D64
_020138C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetLevelUpPtr

	arm_func_start IsInvalidMoveset
IsInvalidMoveset: ; 0x020138CC
	cmp r0, #0
	ble _020138E0
	ldr r1, _020138F0 ; =0x00000229
	cmp r0, r1
	blt _020138E8
_020138E0:
	mov r0, #1
	bx lr
_020138E8:
	mov r0, #0
	bx lr
	.align 2, 0
_020138F0: .word 0x00000229
	arm_func_end IsInvalidMoveset

	arm_func_start GetMovesetHmTmPtr
GetMovesetHmTmPtr: ; 0x020138F4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013938 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _0201393C ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013938: .word _02098D64
_0201393C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetHmTmPtr

	arm_func_start GetMovesetEggPtr
GetMovesetEggPtr: ; 0x02013940
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x258
	subge r0, r4, #0x258
	movge r0, r0, lsl #0x10
	movge r4, r0, asr #0x10
	mov r0, r4
	bl IsInvalidMoveset
	cmp r0, #0
	ldrne r0, _02013984 ; =_02098D64
	ldmneia sp!, {r4, pc}
	ldr r1, _02013988 ; =DUNGEON_MOVE_TABLES
	mov r0, #0xc
	ldr r1, [r1]
	smlabb r0, r4, r0, r1
	ldr r0, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02013984: .word _02098D64
_02013988: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMovesetEggPtr

	arm_func_start GetMoveAiWeight
GetMoveAiWeight: ; 0x0201398C
	ldr r1, _020139A8 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_020139A8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveAiWeight

	arm_func_start GetMoveNbStrikes
GetMoveNbStrikes: ; 0x020139AC
	ldr r1, _020139C8 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xd]
	bx lr
	.align 2, 0
_020139C8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveNbStrikes

	arm_func_start GetMoveBasePower
GetMoveBasePower: ; 0x020139CC
	ldrh r2, [r0, #4]
	mov r0, #0x1a
	ldr r1, _020139E8 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_020139E8: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePower

	arm_func_start GetMoveBasePowerGround
GetMoveBasePowerGround: ; 0x020139EC
	ldrh r2, [r0, #2]
	mov r0, #0x1a
	ldr r1, _02013A08 ; =DUNGEON_MOVE_TABLES
	mul r0, r2, r0
	ldr r1, [r1, #8]
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_02013A08: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerGround

	arm_func_start GetMoveAccuracyOrAiChance
GetMoveAccuracyOrAiChance: ; 0x02013A0C
	ldr r2, _02013A2C ; =DUNGEON_MOVE_TABLES
	ldrh r3, [r0, #4]
	ldr r2, [r2, #8]
	mov r0, #0x1a
	mla r0, r3, r0, r2
	add r0, r0, r1
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_02013A2C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveAccuracyOrAiChance

	arm_func_start GetMoveBasePp
GetMoveBasePp: ; 0x02013A30
	ldr r1, _02013A4C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_02013A4C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePp

	arm_func_start GetMaxPp
GetMaxPp: ; 0x02013A50
	ldr r1, _02013AC0 ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r3, [r1, #8]
	mov r1, #0x1a
	mla r1, r2, r1, r3
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #8]
	tst r2, #0x100
	ldrne r1, _02013AC4 ; =_020A18A0
	ldrnesh r1, [r1]
	addne r0, r0, r1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	tst r2, #0x200
	ldrne r1, _02013AC8 ; =_020A18C8
	ldrnesh r1, [r1]
	addne r0, r0, r1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	tst r2, #0x400
	ldrne r1, _02013ACC ; =_020A1874
	ldrnesh r1, [r1]
	addne r0, r0, r1
	movne r0, r0, lsl #0x10
	movne r0, r0, asr #0x10
	cmp r0, #0x63
	movgt r0, #0x63
	bx lr
	.align 2, 0
_02013AC0: .word DUNGEON_MOVE_TABLES
_02013AC4: .word _020A18A0
_02013AC8: .word _020A18C8
_02013ACC: .word _020A1874
	arm_func_end GetMaxPp

	arm_func_start GetMoveMaxGinsengBoost
GetMoveMaxGinsengBoost: ; 0x02013AD0
	ldr r1, _02013AEC ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013AEC: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoost

	arm_func_start GetMoveMaxGinsengBoostGround
GetMoveMaxGinsengBoostGround: ; 0x02013AF0
	ldr r1, _02013B0C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #2]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xe]
	bx lr
	.align 2, 0
_02013B0C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveMaxGinsengBoostGround

	arm_func_start GetMoveCritChance
GetMoveCritChance: ; 0x02013B10
	ldr r1, _02013B2C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0xf]
	bx lr
	.align 2, 0
_02013B2C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveCritChance

	arm_func_start IsThawingMove
IsThawingMove: ; 0x02013B30
	ldr r1, _02013B4C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x13]
	bx lr
	.align 2, 0
_02013B4C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsThawingMove

	arm_func_start IsAffectedByTaunt
IsAffectedByTaunt: ; 0x02013B50
	ldr r1, _02013B6C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x14]
	bx lr
	.align 2, 0
_02013B6C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsAffectedByTaunt

	arm_func_start GetMoveRangeId
GetMoveRangeId: ; 0x02013B70
	ldr r1, _02013B8C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x15]
	bx lr
	.align 2, 0
_02013B8C: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveRangeId

	arm_func_start GetMoveActualAccuracy
GetMoveActualAccuracy: ; 0x02013B90
	stmdb sp!, {r3, lr}
	ldr r2, _02013BE4 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x63
	bne _02013BDC
	ldrb r2, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	cmp r2, #0x7d
	ldmeqia sp!, {r3, pc}
	mul r0, r2, r0
	mov r1, #0x64
	bl _s32_div_f
	ldmia sp!, {r3, pc}
_02013BDC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02013BE4: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveActualAccuracy

	arm_func_start GetMoveBasePowerFromId
GetMoveBasePowerFromId: ; 0x02013BE8
	mov r1, #0x1a
	mul r1, r0, r1
	ldr r0, _02013C00 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r0, #8]
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_02013C00: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveBasePowerFromId

	arm_func_start IsMoveRangeString19
IsMoveRangeString19: ; 0x02013C04
	ldr r1, _02013C2C ; =DUNGEON_MOVE_TABLES
	ldrh r2, [r0, #4]
	ldr r1, [r1, #8]
	mov r0, #0x1a
	mla r0, r2, r0, r1
	ldrb r0, [r0, #0x15]
	cmp r0, #0x13
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02013C2C: .word DUNGEON_MOVE_TABLES
	arm_func_end IsMoveRangeString19

	arm_func_start GetMoveMessageFromId
GetMoveMessageFromId: ; 0x02013C30
	ldr r2, _02013C5C ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	ldr ip, _02013C60 ; =StringFromId
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x18]
#ifdef JAPAN
	add r0, r0, #0x13c
	add r0, r0, #0x1400
#else
	add r0, r0, #0x314
	add r0, r0, #0xc00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_02013C5C: .word DUNGEON_MOVE_TABLES
_02013C60: .word StringFromId
	arm_func_end GetMoveMessageFromId

	arm_func_start GetNbMoves
GetNbMoves: ; 0x02013C64
	stmdb sp!, {r4, lr}
	mov r4, #0
	mov lr, r4
	mov r2, r4
	mov r3, #1
	mov r1, #6
_02013C7C:
	mul ip, lr, r1
	ldrb ip, [r0, ip]
	add lr, lr, #1
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	addne r4, r4, #1
	cmp lr, #4
	blt _02013C7C
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end GetNbMoves

	arm_func_start GetMovesetIdx__02013CAC
GetMovesetIdx__02013CAC: ; 0x02013CAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov ip, r5
	mov lr, #1
	mov r2, #6
	b _02013CF8
_02013CC4:
	mul r4, r5, r2
	ldrb r3, [r0, r4]
	add r4, r0, r4
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _02013CF4
	ldrh r3, [r4, #2]
	cmp r1, r3
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
_02013CF4:
	add r5, r5, #1
_02013CF8:
	cmp r5, #4
	blt _02013CC4
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovesetIdx__02013CAC

	arm_func_start IsReflectedByMagicCoat
IsReflectedByMagicCoat: ; 0x02013D08
	ldr r2, _02013D20 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x10]
	bx lr
	.align 2, 0
_02013D20: .word DUNGEON_MOVE_TABLES
	arm_func_end IsReflectedByMagicCoat

	arm_func_start CanBeSnatched
CanBeSnatched: ; 0x02013D24
	ldr r2, _02013D3C ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_02013D3C: .word DUNGEON_MOVE_TABLES
	arm_func_end CanBeSnatched

	arm_func_start FailsWhileMuzzled
FailsWhileMuzzled: ; 0x02013D40
	ldr r2, _02013D58 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #0x12]
	bx lr
	.align 2, 0
_02013D58: .word DUNGEON_MOVE_TABLES
	arm_func_end FailsWhileMuzzled

	arm_func_start IsSoundMove
IsSoundMove: ; 0x02013D5C
	ldrh r2, [r0, #4]
	cmp r2, #0xd9
	moveq r0, #1
	bxeq lr
	cmp r2, #0x11c
	moveq r0, #1
	bxeq lr
	cmp r2, #0x53
	moveq r0, #1
	bxeq lr
	cmp r2, #0x22
	moveq r0, #1
	bxeq lr
	cmp r2, #0x54
	moveq r0, #1
	bxeq lr
	cmp r2, #0xab
	moveq r0, #1
	bxeq lr
	ldr r1, _02013E10 ; =0x00000125
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	cmp r2, #0x1b
	moveq r0, #1
	bxeq lr
	cmp r2, #0xf1
	moveq r0, #1
	bxeq lr
	cmp r2, #0x19
	moveq r0, #1
	bxeq lr
	cmp r2, #0x1a
	moveq r0, #1
	bxeq lr
	add r0, r1, #0xed
	cmp r2, r0
	moveq r0, #1
	bxeq lr
	add r0, r1, #0x99
	cmp r2, r0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02013E10: .word 0x00000125
	arm_func_end IsSoundMove

	arm_func_start IsRecoilMove
IsRecoilMove: ; 0x02013E14
	mov r3, #0
	ldr r2, _02013E50 ; =RECOIL_MOVE_LIST
	b _02013E38
_02013E20:
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02013E38:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _02013E20
	mov r0, #0
	bx lr
	.align 2, 0
_02013E50: .word RECOIL_MOVE_LIST
	arm_func_end IsRecoilMove

	arm_func_start sub_02013E54
sub_02013E54: ; 0x02013E54
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x88
	mov r4, r1
	mov r5, r0
	ldrb r2, [r5, r4, lsl #3]
	add r1, sp, #8
	orr r2, r2, #0x80
	strb r2, [r5, r4, lsl #3]
	bl ManipMoves1v1
	add r0, sp, #8
	bl sub_02014230
	cmp r0, #0
	blt _02013F14
	cmp r0, #3
	bge _02013F14
	add r1, r0, #1
	mov r2, #0
_02013E98:
	add r3, sp, #8
	add r3, r3, r0, lsl #5
	add ip, sp, #0
	add lr, r3, r2, lsl #3
	mov r6, #4
_02013EAC:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013EAC
	add r3, sp, #8
	add ip, r3, r0, lsl #5
	add r3, r3, r1, lsl #5
	mov r6, #4
	add lr, r3, r2, lsl #3
	add ip, ip, r2, lsl #3
_02013ED4:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013ED4
	add r3, sp, #8
	add r3, r3, r1, lsl #5
	add r6, sp, #0
	add lr, r3, r2, lsl #3
	mov ip, #4
_02013EF8:
	ldrh r3, [r6], #2
	subs ip, ip, #1
	strh r3, [lr], #2
	bne _02013EF8
	add r2, r2, #1
	cmp r2, #4
	blt _02013E98
_02013F14:
	add r1, sp, #8
	mov r0, r5
	bl ManipMoves1v2
	mov r1, #0
	b _02013F44
_02013F28:
	ldrb r0, [r5, r1, lsl #3]
	tst r0, #0x80
	bicne r0, r0, #0x80
	movne r4, r1
	strneb r0, [r5, r1, lsl #3]
	bne _02013F4C
	add r1, r1, #1
_02013F44:
	cmp r1, #4
	blt _02013F28
_02013F4C:
	mov r0, r4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02013E54

	arm_func_start sub_02013F58
sub_02013F58: ; 0x02013F58
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x88
	mov r4, r1
	mov r5, r0
	ldrb r2, [r5, r4, lsl #3]
	add r1, sp, #8
	orr r2, r2, #0x80
	strb r2, [r5, r4, lsl #3]
	bl ManipMoves1v1
	add r0, sp, #8
	bl sub_02014230
	cmp r0, #1
	blt _02014018
	cmp r0, #4
	bge _02014018
	sub r1, r0, #1
	mov r2, #0
_02013F9C:
	add r3, sp, #8
	add r3, r3, r0, lsl #5
	add ip, sp, #0
	add lr, r3, r2, lsl #3
	mov r6, #4
_02013FB0:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013FB0
	add r3, sp, #8
	add ip, r3, r0, lsl #5
	add r3, r3, r1, lsl #5
	mov r6, #4
	add lr, r3, r2, lsl #3
	add ip, ip, r2, lsl #3
_02013FD8:
	ldrh r3, [lr], #2
	subs r6, r6, #1
	strh r3, [ip], #2
	bne _02013FD8
	add r3, sp, #8
	add r3, r3, r1, lsl #5
	add r6, sp, #0
	add lr, r3, r2, lsl #3
	mov ip, #4
_02013FFC:
	ldrh r3, [r6], #2
	subs ip, ip, #1
	strh r3, [lr], #2
	bne _02013FFC
	add r2, r2, #1
	cmp r2, #4
	blt _02013F9C
_02014018:
	add r1, sp, #8
	mov r0, r5
	bl ManipMoves1v2
	mov r1, #0
	b _02014048
_0201402C:
	ldrb r0, [r5, r1, lsl #3]
	tst r0, #0x80
	bicne r0, r0, #0x80
	movne r4, r1
	strneb r0, [r5, r1, lsl #3]
	bne _02014050
	add r1, r1, #1
_02014048:
	cmp r1, #4
	blt _0201402C
_02014050:
	mov r0, r4
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02013F58

	arm_func_start sub_0201405C
sub_0201405C: ; 0x0201405C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r3, #0
	mov ip, r3
	mov lr, #0x63
	mov r4, r3
	mov r5, #1
	b _020140A4
_02014078:
	ldrb r2, [r0, r1, lsl #3]
	mov r6, r1, lsl #3
	tst r2, #1
	movne r2, r5
	moveq r2, r4
	tst r2, #0xff
	beq _020140AC
	ldrb r2, [r0, r6]
	tst r2, #2
	beq _020140AC
	sub r1, r1, #1
_020140A4:
	cmp r1, #0
	bge _02014078
_020140AC:
	mov r7, #1
	add r2, r1, #1
	mov r6, #0
	mov r4, r7
	b _020140F0
_020140C0:
	ldrb r5, [r0, r2, lsl #3]
	mov r8, r2, lsl #3
	tst r5, #1
	movne r5, r7
	moveq r5, r6
	tst r5, #0xff
	beq _020140F8
	ldrb r5, [r0, r8]
	tst r5, #2
	beq _020140F8
	mov ip, r4
	add r2, r2, #1
_020140F0:
	cmp r2, #4
	blt _020140C0
_020140F8:
	cmp ip, #0
	moveq r0, #0x63
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r8, #1
	mov ip, #0
	sub r2, r2, #1
	mov r7, ip
	mov r6, r8
	mov r4, r8
	b _02014168
_02014120:
	ldrb r5, [r0, r2, lsl #3]
	add sb, r0, r2, lsl #3
	tst r5, #1
	movne r5, r8
	moveq r5, r7
	tst r5, #0xff
	beq _02014170
	ldrb r5, [sb, #6]
	sub r2, r2, #1
	cmp lr, r5
	movgt lr, r5
	cmp r5, #0
	ldrh r5, [sb, #2]
	moveq ip, r6
	tst r5, #0x20
	bicne r5, r5, #0x20
	movne ip, r4
	strneh r5, [sb, #2]
_02014168:
	cmp r2, r1
	bge _02014120
_02014170:
	cmp ip, #0
	moveq r0, lr
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #1
	add r6, r1, #1
	mov ip, #0
	mov r1, r4
	b _020141C8
_02014190:
	ldrb r2, [r0, r6, lsl #3]
	mov r5, r6, lsl #3
	tst r2, #1
	movne r2, r4
	moveq r2, ip
	tst r2, #0xff
	beq _020141D0
	ldrb r2, [r0, r5]
	tst r2, #2
	beq _020141D0
	bic r2, r2, #2
	mov r3, r1
	strb r2, [r0, r5]
	add r6, r6, #1
_020141C8:
	cmp r6, #4
	blt _02014190
_020141D0:
	cmp r3, #0
	movne lr, #0
	mov r0, lr
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0201405C

	arm_func_start AllManip1
AllManip1: ; 0x020141E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x80
	add r1, sp, #0
	mov r4, r0
	bl ManipMoves1v1
	add r1, sp, #0
	mov r0, r4
	bl ManipMoves1v2
	add sp, sp, #0x80
	ldmia sp!, {r4, pc}
	arm_func_end AllManip1

	arm_func_start AllManip2
AllManip2: ; 0x02014208
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	add r1, sp, #0
	mov r4, r0
	bl ManipMoves2v1
	add r1, sp, #0
	mov r0, r4
	bl ManipMoves2v2
	add sp, sp, #0x200
	ldmia sp!, {r4, pc}
	arm_func_end AllManip2

	arm_func_start sub_02014230
sub_02014230: ; 0x02014230
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, #0
	mov r2, r4
	mov r3, #1
	mov lr, r4
	b _0201428C
_02014248:
	mov r5, lr
	add ip, r0, r4, lsl #5
	b _02014280
_02014254:
	ldrb r1, [ip, r5, lsl #3]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _0201427C
	ldrb r1, [ip, r5, lsl #3]
	tst r1, #0x80
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, pc}
_0201427C:
	add r5, r5, #1
_02014280:
	cmp r5, #4
	blt _02014254
	add r4, r4, #1
_0201428C:
	cmp r4, #4
	blt _02014248
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014230

	arm_func_start ManipMoves1v1
ManipMoves1v1: ; 0x0201429C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov ip, r4
	mov r3, r4
_020142AC:
	mov r5, r3
	add r2, r1, r4, lsl #5
_020142B4:
	strb ip, [r2, r5, lsl #3]
	add r5, r5, #1
	cmp r5, #4
	blt _020142B4
	add r4, r4, #1
	cmp r4, #4
	blt _020142AC
	mov r2, ip
	mvn r3, #0
	mov r7, #0
_020142DC:
	cmp r2, #0
	beq _020142F0
	ldrb r4, [r0, r2, lsl #3]
	tst r4, #2
	bne _020142F8
_020142F0:
	mov ip, r7
	add r3, r3, #1
_020142F8:
	add r4, r1, r3, lsl #5
	add r6, r0, r2, lsl #3
	add r5, r4, ip, lsl #3
	mov lr, #4
_02014308:
	ldrh r4, [r6], #2
	subs lr, lr, #1
	strh r4, [r5], #2
	bne _02014308
	add r4, r1, r3, lsl #5
	ldrb lr, [r4, ip, lsl #3]
	add r2, r2, #1
	cmp r2, #4
	bic lr, lr, #2
	strb lr, [r4, ip, lsl #3]
	add ip, ip, #1
	blt _020142DC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ManipMoves1v1

	arm_func_start ManipMoves1v2
ManipMoves1v2: ; 0x0201433C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r2, #0
	mov r4, #1
	mov r7, r2
	mov r3, r2
	mov fp, r4
	mov sb, r4
	add r6, sp, #4
	mov lr, r2
	add ip, sp, #0
_02014368:
	mov r8, lr
	strb lr, [r6, r7]
	strb lr, [ip, r7]
	add r5, r1, r7, lsl #5
_02014378:
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #1
	movne sl, r4
	moveq sl, r3
	tst sl, #0xff
	beq _020143A8
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #8
	strneb fp, [r6, r7]
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #4
	strneb sb, [ip, r7]
_020143A8:
	add r8, r8, #1
	cmp r8, #4
	blt _02014378
	add r7, r7, #1
	cmp r7, #4
	blt _02014368
	mov r6, #0
	b _02014494
_020143C8:
	mov r7, #0
	add r5, sp, #4
	add r4, sp, #0
	add lr, r1, r6, lsl #5
	mov r3, r7
	mov ip, #1
	b _02014488
_020143E4:
	ldrb r8, [lr, r7, lsl #3]
	tst r8, #1
	movne r8, ip
	moveq r8, r3
	tst r8, #0xff
	beq _02014484
	add fp, lr, r7, lsl #3
	add sl, r0, r2, lsl #3
	mov sb, #4
_02014408:
	ldrh r8, [fp], #2
	subs sb, sb, #1
	strh r8, [sl], #2
	bne _02014408
	ldrb r8, [r0, r2, lsl #3]
	cmp r7, #0
	biceq r8, r8, #2
	orrne r8, r8, #2
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r0, r2, lsl #3]
	bic sb, r8, #8
	and r8, sb, #0xff
	bic r8, r8, #4
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r5, r6]
	cmp r8, #0
	beq _0201445C
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #8
	streqb r8, [r0, r2, lsl #3]
_0201445C:
	ldrb r8, [r4, r6]
	cmp r8, #0
	beq _02014478
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #4
	streqb r8, [r0, r2, lsl #3]
_02014478:
	add r2, r2, #1
	cmp r2, #4
	beq _0201449C
_02014484:
	add r7, r7, #1
_02014488:
	cmp r7, #4
	blt _020143E4
	add r6, r6, #1
_02014494:
	cmp r6, #4
	blt _020143C8
_0201449C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ManipMoves1v2

	arm_func_start ManipMoves2v1
ManipMoves2v1: ; 0x020144A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov ip, r4
	mov r3, r4
_020144B4:
	mov r5, r3
	add r2, r1, r4, lsl #6
_020144BC:
	strb ip, [r2, r5, lsl #3]
	add r5, r5, #1
	cmp r5, #8
	blt _020144BC
	add r4, r4, #1
	cmp r4, #8
	blt _020144B4
	mov r2, ip
	mvn r3, #0
	mov r7, #0
_020144E4:
	cmp r2, #0
	beq _020144F8
	ldrb r4, [r0, r2, lsl #3]
	tst r4, #2
	bne _02014500
_020144F8:
	mov ip, r7
	add r3, r3, #1
_02014500:
	add r4, r1, r3, lsl #6
	add r6, r0, r2, lsl #3
	add r5, r4, ip, lsl #3
	mov lr, #4
_02014510:
	ldrh r4, [r6], #2
	subs lr, lr, #1
	strh r4, [r5], #2
	bne _02014510
	add r4, r1, r3, lsl #6
	ldrb lr, [r4, ip, lsl #3]
	add r2, r2, #1
	cmp r2, #8
	bic lr, lr, #2
	strb lr, [r4, ip, lsl #3]
	add ip, ip, #1
	blt _020144E4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ManipMoves2v1

	arm_func_start ManipMoves2v2
ManipMoves2v2: ; 0x02014544
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r2, #0
	mov r4, #1
	mov r7, r2
	mov r3, r2
	mov fp, r4
	mov sb, r4
	add r6, sp, #8
	mov lr, r2
	add ip, sp, #0
_02014570:
	mov r8, lr
	strb lr, [r6, r7]
	strb lr, [ip, r7]
	add r5, r1, r7, lsl #6
_02014580:
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #1
	movne sl, r4
	moveq sl, r3
	tst sl, #0xff
	beq _020145B0
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #8
	strneb fp, [r6, r7]
	ldrb sl, [r5, r8, lsl #3]
	tst sl, #4
	strneb sb, [ip, r7]
_020145B0:
	add r8, r8, #1
	cmp r8, #8
	blt _02014580
	add r7, r7, #1
	cmp r7, #8
	blt _02014570
	mov r6, #0
	b _0201469C
_020145D0:
	mov r7, #0
	add r5, sp, #8
	add r4, sp, #0
	add lr, r1, r6, lsl #6
	mov r3, r7
	mov ip, #1
	b _02014690
_020145EC:
	ldrb r8, [lr, r7, lsl #3]
	tst r8, #1
	movne r8, ip
	moveq r8, r3
	tst r8, #0xff
	beq _0201468C
	add fp, lr, r7, lsl #3
	add sl, r0, r2, lsl #3
	mov sb, #4
_02014610:
	ldrh r8, [fp], #2
	subs sb, sb, #1
	strh r8, [sl], #2
	bne _02014610
	ldrb r8, [r0, r2, lsl #3]
	cmp r7, #0
	biceq r8, r8, #2
	orrne r8, r8, #2
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r0, r2, lsl #3]
	bic sb, r8, #8
	and r8, sb, #0xff
	bic r8, r8, #4
	strb r8, [r0, r2, lsl #3]
	ldrb r8, [r5, r6]
	cmp r8, #0
	beq _02014664
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #8
	streqb r8, [r0, r2, lsl #3]
_02014664:
	ldrb r8, [r4, r6]
	cmp r8, #0
	beq _02014680
	cmp r7, #0
	ldreqb r8, [r0, r2, lsl #3]
	orreq r8, r8, #4
	streqb r8, [r0, r2, lsl #3]
_02014680:
	add r2, r2, #1
	cmp r2, #8
	beq _020146A4
_0201468C:
	add r7, r7, #1
_02014690:
	cmp r7, #8
	blt _020145EC
	add r6, r6, #1
_0201469C:
	cmp r6, #8
	blt _020145D0
_020146A4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ManipMoves2v2

	arm_func_start DungeonMoveToGroundMove
DungeonMoveToGroundMove: ; 0x020146AC
	ldrb r2, [r1]
	tst r2, #1
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	moveq r1, #0
	streqb r1, [r0]
	bxeq lr
	strb r2, [r0]
	ldrh r2, [r1, #4]
	strh r2, [r0, #2]
	ldrb r1, [r1, #7]
	strb r1, [r0, #4]
	bx lr
	arm_func_end DungeonMoveToGroundMove

	arm_func_start GroundToDungeonMoveset
GroundToDungeonMoveset: ; 0x020146E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r5, #6
	ldr r8, _02014774 ; =DUNGEON_MOVE_TABLES
	mov lr, #1
	mov sb, r4
	mov r3, r4
	mov r6, #0x1a
	mov r7, r5
_02014708:
	mul r2, r4, r7
	ldrb r2, [r1, r2]
	tst r2, #1
	movne sl, lr
	moveq sl, #0
	tst sl, #0xff
	streqb sb, [r0, r4, lsl #3]
	beq _0201475C
	mla ip, r4, r5, r1
	strb r2, [r0, r4, lsl #3]
	add r2, r0, r4, lsl #3
	strh r3, [r2, #2]
	ldrh sl, [ip, #2]
	strh sl, [r2, #4]
	ldrh fp, [ip, #2]
	ldr sl, [r8, #8]
	mla sl, fp, r6, sl
	ldrb sl, [sl, #8]
	strb sl, [r2, #6]
	ldrb ip, [ip, #4]
	strb ip, [r2, #7]
_0201475C:
	add r4, r4, #1
	cmp r4, #4
	blt _02014708
	mov r1, #0
	strb r1, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02014774: .word DUNGEON_MOVE_TABLES
	arm_func_end GroundToDungeonMoveset

	arm_func_start DungeonToGroundMoveset
DungeonToGroundMoveset: ; 0x02014778
	stmdb sp!, {r4, lr}
	mov r4, #0
	mov r2, #6
_02014784:
	mul lr, r4, r2
	ldrb r3, [r1, r4, lsl #3]
	add ip, r1, r4, lsl #3
	add r4, r4, #1
	strb r3, [r0, lr]
	ldrh r3, [ip, #4]
	add lr, r0, lr
	cmp r4, #4
	strh r3, [lr, #2]
	ldrb r3, [ip, #7]
	strb r3, [lr, #4]
	blt _02014784
	ldmia sp!, {r4, pc}
	arm_func_end DungeonToGroundMoveset

	arm_func_start GetInfoGroundMoveset
GetInfoGroundMoveset: ; 0x020147B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	mov r7, #6
	mov r6, r0
	mov r5, r1
	mov sb, r4
	mov r8, r7
_020147D4:
	mov r0, r4, lsl #1
	ldrh r1, [r5, r0]
	cmp r1, #0
	muleq r0, r4, r7
	streqb sb, [r6, r0]
	beq _020147F4
	mla r0, r4, r8, r6
	bl GetInfoMoveGround
_020147F4:
	add r4, r4, #1
	cmp r4, #4
	blt _020147D4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end GetInfoGroundMoveset

	arm_func_start GetMovesetIdx__02014804
GetMovesetIdx__02014804: ; 0x02014804
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	mov ip, r5
	mov lr, #1
	mov r2, #6
	b _02014850
_0201481C:
	mul r4, r5, r2
	ldrb r3, [r0, r4]
	add r4, r0, r4
	tst r3, #1
	movne r3, lr
	moveq r3, ip
	tst r3, #0xff
	beq _0201484C
	ldrh r3, [r4, #2]
	cmp r1, r3
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, pc}
_0201484C:
	add r5, r5, #1
_02014850:
	cmp r5, #4
	blt _0201481C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetMovesetIdx__02014804

	arm_func_start FindFirstFreeMovesetIdx
FindFirstFreeMovesetIdx: ; 0x02014860
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r2, lr
	mov r3, #1
	mov r1, #6
	b _0201489C
_02014878:
	mul ip, lr, r1
	ldrb ip, [r0, ip]
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	moveq r0, lr
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_0201489C:
	cmp lr, #4
	blt _02014878
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end FindFirstFreeMovesetIdx

	arm_func_start LearnMoves
LearnMoves: ; 0x020148AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r7, r1
	mov r1, #0
	mov r8, r0
	mov r6, r1
	add r0, sp, #0
_020148C8:
	strb r6, [r0, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _020148C8
	b _020149B0
_020148DC:
	mov r0, r6, lsl #1
	ldrh r4, [r7, r0]
	cmp r4, #0
	beq _020149B8
	mov r0, r8
	mov r1, r4
	bl GetMovesetIdx__02014804
	mvn r1, #0
	cmp r0, r1
	addne r1, sp, #0
	movne r2, #1
	strneb r2, [r1, r0]
	bne _020149AC
	mov r0, r8
	bl FindFirstFreeMovesetIdx
	mvn r1, #0
	cmp r0, r1
	bne _02014990
	mov r5, #0
	mov r3, r5
	add r0, sp, #4
	add r2, sp, #0
_02014934:
	ldrb r1, [r2, r3]
	cmp r1, #0
	streq r3, [r0, r5, lsl #2]
	add r3, r3, #1
	addeq r5, r5, #1
	cmp r3, #4
	blt _02014934
	bl Rand16Bit
	mov r1, r5
	bl _s32_div_f
	add r2, sp, #4
	ldr r5, [r2, r1, lsl #2]
	mov r0, #6
	mul r3, r5, r0
	mov r2, #0
	mov r1, r4
	add r0, r8, r3
	strb r2, [r8, r3]
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r5]
	b _020149AC
_02014990:
	mov r1, #6
	mla r0, r1, r0, r8
	mov r1, r4
	bl GetInfoMoveGround
	add r0, sp, #0
	mov r1, #1
	strb r1, [r0, r6]
_020149AC:
	add r6, r6, #1
_020149B0:
	cmp r6, #4
	blt _020148DC
_020149B8:
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end LearnMoves

	arm_func_start sub_020149C0
sub_020149C0: ; 0x020149C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, #0
	mov r3, r2
	mov r6, r2
	mov r7, #1
	b _02014A24
_020149D8:
	ldrb r4, [r1, r3, lsl #3]
	tst r4, #1
	movne r4, r7
	moveq r4, r6
	tst r4, #0xff
	beq _02014A2C
	add r5, r1, r3, lsl #3
	add r4, r0, r3, lsl #3
	mov lr, #4
_020149FC:
	ldrh ip, [r5], #2
	subs lr, lr, #1
	strh ip, [r4], #2
	bne _020149FC
	add lr, r0, r3, lsl #3
	ldrh ip, [lr, #2]
	add r2, r2, #1
	add r3, r3, #1
	bic ip, ip, #4
	strh ip, [lr, #2]
_02014A24:
	cmp r3, #4
	blt _020149D8
_02014A2C:
	mov r1, #0
	b _02014A3C
_02014A34:
	strb r1, [r0, r3, lsl #3]
	add r3, r3, #1
_02014A3C:
	cmp r3, #8
	blt _02014A34
	mov r0, r2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020149C0

	arm_func_start CopyMoveTo
CopyMoveTo: ; 0x02014A4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CopyMoveTo

	arm_func_start CopyMoveFrom
CopyMoveFrom: ; 0x02014A84
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CopyMoveFrom

	arm_func_start CopyMovesetTo
CopyMovesetTo: ; 0x02014ABC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #6
_02014AD0:
	mla r1, r5, r4, r6
	mov r0, r7
	bl CopyMoveTo
	add r5, r5, #1
	cmp r5, #4
	blt _02014AD0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyMovesetTo

	arm_func_start CopyMovesetFrom
CopyMovesetFrom: ; 0x02014AEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r4, #6
_02014B00:
	mla r1, r5, r4, r6
	mov r0, r7
	bl CopyMoveFrom
	add r5, r5, #1
	cmp r5, #4
	blt _02014B00
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CopyMovesetFrom

	arm_func_start sub_02014B1C
sub_02014B1C: ; 0x02014B1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r2, #4
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsTo
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsTo
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014B1C

	arm_func_start sub_02014B74
sub_02014B74: ; 0x02014B74
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014B84:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014B1C
	add r4, r4, #1
	cmp r4, #4
	blt _02014B84
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	bl CopyBitsTo
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014B74

	arm_func_start sub_02014BB0
sub_02014BB0: ; 0x02014BB0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #8
	bl memset
	mov r0, r5
	mov r1, r4
	mov r2, #4
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #2
	mov r2, #1
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #4
	mov r2, #0xa
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #6
	mov r2, #7
	bl CopyBitsFrom
	mov r0, r5
	add r1, r4, #7
	mov r2, #7
	bl CopyBitsFrom
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02014BB0

	arm_func_start sub_02014C20
sub_02014C20: ; 0x02014C20
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_02014C30:
	mov r0, r6
	add r1, r5, r4, lsl #3
	bl sub_02014BB0
	add r4, r4, #1
	cmp r4, #4
	blt _02014C30
	mov r3, #0
	mov r0, r6
	add r1, r5, #0x20
	mov r2, #8
	strb r3, [r5, #0x20]
	bl CopyBitsFrom
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02014C20

	arm_func_start Is2TurnsMove
Is2TurnsMove: ; 0x02014C64
	cmp r0, #0x97
	moveq r0, #1
	bxeq lr
	cmp r0, #0x64
	moveq r0, #1
	bxeq lr
	cmp r0, #0x3c
	moveq r0, #1
	bxeq lr
	cmp r0, #0x4b
	moveq r0, #1
	bxeq lr
	cmp r0, #0x15c
	moveq r0, #1
	bxeq lr
	cmp r0, #0x99
	moveq r0, #1
	bxeq lr
	cmp r0, #0xcd
	moveq r0, #1
	bxeq lr
	cmp r0, #0x9c
	moveq r0, #1
	bxeq lr
	cmp r0, #8
	moveq r0, #1
	bxeq lr
	ldr r1, _02014CE8 ; =0x000001DD
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014CE8: .word 0x000001DD
	arm_func_end Is2TurnsMove

	arm_func_start IsRegularAttackOrProjectile
IsRegularAttackOrProjectile: ; 0x02014CEC
	ldr r1, _02014D14 ; =0x00000163
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x32
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014D14: .word 0x00000163
	arm_func_end IsRegularAttackOrProjectile

	arm_func_start IsPunchMove
IsPunchMove: ; 0x02014D18
	mov r3, #0
	ldr r2, _02014D54 ; =PUNCH_MOVE_LIST
	b _02014D3C
_02014D24:
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
_02014D3C:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _02014D24
	mov r0, #0
	bx lr
	.align 2, 0
_02014D54: .word PUNCH_MOVE_LIST
	arm_func_end IsPunchMove

	arm_func_start IsHealingWishOrLunarDance
IsHealingWishOrLunarDance: ; 0x02014D58
	ldr r1, _02014D80 ; =0x000001B7
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x57
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014D80: .word 0x000001B7
	arm_func_end IsHealingWishOrLunarDance

	arm_func_start IsCopyingMove
IsCopyingMove: ; 0x02014D84
	ldr r1, _02014DB8 ; =0x00000147
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x8a
	moveq r0, #1
	bxeq lr
	add r1, r1, #0xc6
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014DB8: .word 0x00000147
	arm_func_end IsCopyingMove

	arm_func_start IsTrappingMove
IsTrappingMove: ; 0x02014DBC
	ldr r1, _02014DFC ; =0x00000127
	cmp r0, r1
	moveq r0, #1
	bxeq lr
	cmp r0, #0x1f0
	moveq r0, #1
	bxeq lr
	cmp r0, #0x1e0
	moveq r0, #1
	bxeq lr
	add r1, r1, #0x6a
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02014DFC: .word 0x00000127
	arm_func_end IsTrappingMove

	arm_func_start IsOneHitKoMove
IsOneHitKoMove: ; 0x02014E00
	cmp r0, #0x83
	moveq r0, #1
	bxeq lr
	cmp r0, #0x96
	moveq r0, #1
	bxeq lr
	cmp r0, #0xb1
	moveq r0, #1
	bxeq lr
	cmp r0, #0xf7
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsOneHitKoMove

	arm_func_start IsNot2TurnsMoveOrSketch
IsNot2TurnsMoveOrSketch: ; 0x02014E38
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Is2TurnsMove
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	cmp r4, #0x8a
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	arm_func_end IsNot2TurnsMoveOrSketch

	arm_func_start IsRealMove
IsRealMove: ; 0x02014E64
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _02014EEC ; =0x000001D3
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	cmp r0, #0x160
	moveq r0, #0
	bxeq lr
	sub r1, r1, #0x70
	cmp r0, r1
	blo _02014EA4
	cmp r0, #0x168
	movlo r0, #0
	bxlo lr
_02014EA4:
	cmp r0, #0x168
	bls _02014EBC
	ldr r1, _02014EF0 ; =0x0000018A
	cmp r0, r1
	movlo r0, #0
	bxlo lr
_02014EBC:
	ldr r1, _02014EF0 ; =0x0000018A
	cmp r0, r1
	bls _02014ED8
	add r1, r1, #0x23
	cmp r0, r1
	movls r0, #0
	bxls lr
_02014ED8:
	ldr r1, _02014EF4 ; =0x0000021F
	cmp r0, r1
	movhs r0, #0
	movlo r0, #1
	bx lr
	.align 2, 0
_02014EEC: .word 0x000001D3
_02014EF0: .word 0x0000018A
_02014EF4: .word 0x0000021F
	arm_func_end IsRealMove

	arm_func_start IsMovesetValid
IsMovesetValid: ; 0x02014EF8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r4, r0
	mov r6, r8
	mov r7, #1
	mov r5, #6
	b _02014F54
_02014F14:
	smulbb r1, r8, r5
	ldrb r0, [r4, r1]
	add r1, r4, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02014F48
	ldrh r0, [r1, #2]
	bl IsRealMove
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02014F48:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02014F54:
	cmp r8, #4
	blt _02014F14
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end IsMovesetValid

	arm_func_start IsRealMoveInTimeDarkness
IsRealMoveInTimeDarkness: ; 0x02014F64
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _02014FF8 ; =0x000001D3
	cmp r0, r1
	moveq r0, #0
	bxeq lr
	cmp r0, #0x1d4
	moveq r0, #0
	bxeq lr
	cmp r0, #0x160
	moveq r0, #0
	bxeq lr
	sub r1, r1, #0x70
	cmp r0, r1
	blo _02014FB0
	cmp r0, #0x168
	movlo r0, #0
	bxlo lr
_02014FB0:
	cmp r0, #0x168
	bls _02014FC8
	ldr r1, _02014FFC ; =0x0000018A
	cmp r0, r1
	movlo r0, #0
	bxlo lr
_02014FC8:
	ldr r1, _02014FFC ; =0x0000018A
	cmp r0, r1
	bls _02014FE4
	add r1, r1, #0x23
	cmp r0, r1
	movls r0, #0
	bxls lr
_02014FE4:
	ldr r1, _02015000 ; =0x0000021F
	cmp r0, r1
	movhs r0, #0
	movlo r0, #1
	bx lr
	.align 2, 0
_02014FF8: .word 0x000001D3
_02014FFC: .word 0x0000018A
_02015000: .word 0x0000021F
	arm_func_end IsRealMoveInTimeDarkness

	arm_func_start IsMovesetValidInTimeDarkness
IsMovesetValidInTimeDarkness: ; 0x02015004
	stmdb sp!, {r3, lr}
	bl GetFirstNotRealMoveInTimeDarkness
	mvn r1, #0
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsMovesetValidInTimeDarkness

	arm_func_start GetFirstNotRealMoveInTimeDarkness
GetFirstNotRealMoveInTimeDarkness: ; 0x02015024
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, #0
	mov r4, r0
	mov r6, r8
	mov r7, #1
	mov r5, #6
	b _02015080
_02015040:
	smulbb r1, r8, r5
	ldrb r0, [r4, r1]
	add r1, r4, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02015074
	ldrh r0, [r1, #2]
	bl IsRealMoveInTimeDarkness
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02015074:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02015080:
	cmp r8, #4
	blt _02015040
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end GetFirstNotRealMoveInTimeDarkness

	arm_func_start sub_02015090
sub_02015090: ; 0x02015090
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	mov lr, r4
	mov r2, r4
	mov r3, #1
	mov r0, #6
	b _020150E0
_020150B4:
	mul ip, lr, r0
	ldrb r1, [r6, ip]
	add lr, lr, #1
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	ldrneb r1, [r6, ip]
	addne r4, r4, #1
	bicne r1, r1, #2
	strneb r1, [r6, ip]
_020150E0:
	cmp lr, r5
	blt _020150B4
	bl Rand16Bit
	mov r1, r4
	bl _s32_div_f
	mov r0, #6
	mla r0, r1, r0, r6
	ldrh r0, [r0, #2]
	sub r3, r5, #1
	mov r2, #6
	b _02015130
_0201510C:
	mul r5, r1, r2
	add ip, r6, r5
	ldrh r4, [ip, #6]
	add r1, r1, #1
	strh r4, [r6, r5]
	ldrh r4, [ip, #8]
	strh r4, [ip, #2]
	ldrh r4, [ip, #0xa]
	strh r4, [ip, #4]
_02015130:
	cmp r1, r3
	blt _0201510C
	mov r1, #6
	mul r1, r3, r1
	mov r2, #0
	strb r2, [r6, r1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02015090

	arm_func_start IsSameMove
IsSameMove: ; 0x0201514C
	stmdb sp!, {r4, lr}
	ldrb r2, [r1]
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r4, #0
	mov ip, r4
	mov lr, #1
	b _020151B8
_0201517C:
	ldrb r2, [r0, r4, lsl #3]
	tst r2, #1
	movne r2, lr
	moveq r2, ip
	tst r2, #0xff
	beq _020151C0
	add r2, r0, r4, lsl #3
	ldrh r3, [r1, #4]
	ldrh r2, [r2, #4]
	cmp r3, r2
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	mov r4, r2, asr #0x10
_020151B8:
	cmp r4, #4
	blt _0201517C
_020151C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsSameMove

	arm_func_start GetMoveCategory
GetMoveCategory: ; 0x020151C8
	ldr r2, _020151E0 ; =DUNGEON_MOVE_TABLES
	mov r1, #0x1a
	ldr r2, [r2, #8]
	mla r1, r0, r1, r2
	ldrb r0, [r1, #3]
	bx lr
	.align 2, 0
_020151E0: .word DUNGEON_MOVE_TABLES
	arm_func_end GetMoveCategory

	arm_func_start GetPpIncrease
GetPpIncrease: ; 0x020151E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, r1
	mov r1, #0x39
	mov r6, #0
	bl IqSkillFlagTest
	cmp r0, #0
	orrne r0, r6, #0x100
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4a
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x200
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl GetAbility
	mov r5, r0
	mov r0, r4
	mov r1, #1
	bl GetAbility
	mov r3, r0
	mov r1, r4
	mov r2, r5
	mov r0, #0x4b
	bl BagHasExclusiveItemTypeForMonster
	cmp r0, #0
	orrne r0, r6, #0x400
	movne r0, r0, lsl #0x10
	movne r6, r0, lsr #0x10
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end GetPpIncrease

	arm_func_start OpenWaza
OpenWaza: ; 0x02015294
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _020152EC ; =_020AF6E8
	mov r4, r0
	ldr r0, _020152F0 ; =_020AF700
	ldr r1, [r1, r4, lsl #2]
	add r0, r0, r4, lsl #3
	mov r2, #0
	bl LoadFileFromRom
	ldr r1, _020152F0 ; =_020AF700
	add r0, sp, #0
	ldr r1, [r1, r4, lsl #3]
	bl HandleSir0Translation
	ldr r3, [sp]
	ldr r1, _020152F4 ; =_020AF6F8
	ldr r2, [r3]
	ldr r0, _020152F8 ; =_020AF6F0
	str r2, [r1, r4, lsl #2]
	ldr r1, [r3, #4]
	str r1, [r0, r4, lsl #2]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020152EC: .word _020AF6E8
_020152F0: .word _020AF700
_020152F4: .word _020AF6F8
_020152F8: .word _020AF6F0
	arm_func_end OpenWaza

	arm_func_start SelectWaza
SelectWaza: ; 0x020152FC
	ldr r1, _0201531C ; =_020AF6F8
	ldr r2, _02015320 ; =_020AF6F0
	ldr r3, [r1, r0, lsl #2]
	ldr r1, _02015324 ; =DUNGEON_MOVE_TABLES
	ldr r0, [r2, r0, lsl #2]
	str r3, [r1, #8]
	str r0, [r1]
	bx lr
	.align 2, 0
_0201531C: .word _020AF6F8
_02015320: .word _020AF6F0
_02015324: .word DUNGEON_MOVE_TABLES
	arm_func_end SelectWaza

	arm_func_start sub_02015328
sub_02015328: ; 0x02015328
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r0, #0x40
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl MemAlloc
	ldr r2, _02015500 ; =_020AF710
	mov r1, #0x40
	str r0, [r2]
	bl MemZero
	ldr r0, _02015500 ; =_020AF710
	ldr r2, [sp, #0x28]
	ldr r1, _02015504 ; =_020AF714
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #0x1c
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [r0]
	add r0, r1, #0x10
	ldr r1, [r1, #0x1c]
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp, #0x28]
	ldr ip, [r0]
	ldrsh r3, [sp, #0x24]
	ldr r2, [ip, #0x10]
	cmp r1, #2
	ldr r2, [r2, #4]
	str r2, [ip, #0x2c]
	ldr r2, [r0]
	str r5, [r2, #8]
	ldr r2, [r0]
	str r4, [r2, #0xc]
	ldr r2, [r0]
	strh r3, [r2, #0x30]
	mov r2, #0
	bne _02015454
	ldr r1, _02015508 ; =_02098F60
	add r0, sp, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	ldr r1, _0201550C ; =_02098F78
	add r0, sp, #0
	mov r2, #0
	bl LoadFileFromRom
	ldr r0, _02015500 ; =_020AF710
	ldr r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	add r1, r4, #1
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	bl sub_0201614C
	add r0, sp, #0
	bl UnloadFile
	b _020154CC
_02015454:
	cmp r1, #1
	ldr r0, [r0]
	bne _02015470
	ldr r1, _02015510 ; =_02098F90
	add r0, r0, #0x24
	bl LoadFileFromRom
	b _0201547C
_02015470:
	ldr r1, _02015514 ; =_02098FA8
	add r0, r0, #0x24
	bl LoadFileFromRom
_0201547C:
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	add r0, r0, #0x14
	bl HandleSir0Translation
	ldr r0, _02015500 ; =_020AF710
	ldrsh r4, [sp, #0x24]
	ldr r0, [r0]
	ldr r2, [r0, #0x14]
	mov r1, r4
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r2, _02015518 ; =_020AF720
	ldr r0, [r0]
	add r1, r4, #1
	bl sub_0201614C
	ldr r0, _02015500 ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x24
	bl UnloadFile
_020154CC:
	ldr r0, _02015500 ; =_020AF710
	ldrsh r3, [sp, #0x20]
	ldr r2, [r0]
	mov r1, #0
	str r7, [r2]
	ldr r2, [r0]
	str r6, [r2, #4]
	ldr r2, [r0]
	strh r3, [r2, #0x32]
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015500: .word _020AF710
_02015504: .word _020AF714
_02015508: .word _02098F60
_0201550C: .word _02098F78
_02015510: .word _02098F90
_02015514: .word _02098FA8
_02015518: .word _020AF720
	arm_func_end sub_02015328

	arm_func_start sub_0201551C
sub_0201551C: ; 0x0201551C
	stmdb sp!, {r3, lr}
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r0, #0x3c]
	cmp r0, #0
	beq _02015540
	bl sub_02015EB4
_02015540:
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl UnloadFile
	ldr r0, _0201556C ; =_020AF710
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201556C ; =_020AF710
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201556C: .word _020AF710
	arm_func_end sub_0201551C

	arm_func_start sub_02015570
sub_02015570: ; 0x02015570
	ldr r0, _02015584 ; =_020AF710
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x3c]
	bx lr
	.align 2, 0
_02015584: .word _020AF710
	arm_func_end sub_02015570

	arm_func_start sub_02015588
sub_02015588: ; 0x02015588
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020155F4 ; =_020AF710
	mov r1, #0x6000
	ldr r2, [r0]
	ldrsh r0, [r2, #0x32]
	ldr r2, [r2]
	add r0, r2, r0, lsl #5
	bl MemZero32
	ldr r0, _020155F4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020155EC
	bl sub_02015EB4
	ldr r1, _020155F8 ; =_02098EA8
	ldr r0, _020155F4 ; =_020AF710
	ldr r2, [r1, #4]
	ldr r1, [r1]
	ldr r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl sub_0200B3C0
_020155EC:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020155F4: .word _020AF710
_020155F8: .word _02098EA8
	arm_func_end sub_02015588

	arm_func_start sub_020155FC
sub_020155FC: ; 0x020155FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	bl StringFromId
	mov r8, #0
	mov r7, r0
	mov sb, r8
	mov r6, r8
	add r5, sp, #4
	mov fp, #0x100
	mov r4, r8
_02015624:
	ldrb r0, [r7, r8]
	cmp r0, #0
	beq _02015698
	mov r0, r5
	mov r1, fp
	mov r3, #0x440
	str r6, [sp]
	add r2, r7, r8
	bl PreprocessString
	strb r4, [r5, r0]
	add r8, r8, r0
	ldrb sl, [r7, r8]
	cmp sl, #0
	beq _02015690
	ldr r1, _020156A8 ; =_02098FBC
	mov r2, #3
	add r0, r7, r8
	bl strncmp
	cmp r0, #0
	bne _02015684
	ldr r0, _020156A8 ; =_02098FBC
	bl strlen
	add r8, r8, r0
	b _02015690
_02015684:
	cmp sl, #0xd
	cmpne sl, #0xa
	addeq r8, r8, #1
_02015690:
	add sb, sb, #1
	b _02015624
_02015698:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020156A8: .word _02098FBC
	arm_func_end sub_020155FC

	arm_func_start sub_020156AC
sub_020156AC: ; 0x020156AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	cmp r1, #0
	beq _02015780
	ldr r3, _02015788 ; =_020AF710
	mov r2, r0, asr #2
	ldr r6, [r3]
	add r2, r0, r2, lsr #29
	ldrsh r5, [r6, #0x32]
	mov r2, r2, asr #3
	mov r4, r0, lsr #0x1f
	rsb r3, r4, r0, lsl #29
	ldr r6, [r6]
	add r5, r5, r2, lsl #5
	mov r0, #0
	add r3, r4, r3, ror #29
	add r5, r6, r5, lsl #5
	add r3, r5, r3, lsl #2
	mov r4, r0
	and r5, r1, #0xf
_020156FC:
	mov r1, r4, lsl #2
	add r4, r4, #1
	cmp r4, #8
	orr r0, r0, r5, lsl r1
	blt _020156FC
	mov r1, #0
_02015714:
	add r1, r1, #1
	cmp r1, #0x20
	str r0, [r3], #0x20
	blt _02015714
	ldr r7, _02015788 ; =_020AF710
	mov r6, #0
	ldr r0, [r7]
	add r4, sp, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, r2, lsl #5
	mov r0, r0, lsl #0x10
	str r2, [sp, #4]
	mov r5, r0, asr #0x10
_02015748:
	ldr r0, [r7]
	str r6, [sp]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	mov r1, r4
	add r2, r2, #1
	orr r2, r5, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r6, r6, #1
	cmp r6, #0x20
	add r5, r5, #1
	blt _02015748
_02015780:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02015788: .word _020AF710
	arm_func_end sub_020156AC

	arm_func_start sub_0201578C
sub_0201578C: ; 0x0201578C
#ifdef EUROPE
#define SUB_0201578C_STACK_OFFSET 4
#else
#define SUB_0201578C_STACK_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2f8
	sub sp, sp, #0x400
	ldr r5, [sp, #0x720]
	mov r4, #0
	str r5, [sp, #0x720]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r7, r2
	str r3, [sp, #0xc]
	str r4, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
_020157B8:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _02015CF8
	ldr r1, [sp, #0xc]
	add r0, sp, #0x500
	mov r5, #0
	add r2, r1, r4
	add r0, r0, #0xf8
	mov r1, #0x100
	mov r3, #0x440
	str r5, [sp]
	bl PreprocessString
	add r1, sp, #0x500
	add r1, r1, #0xf8
	mov r2, r5
	strb r2, [r1, r0]
	add r4, r4, r0
	ldr r0, [sp, #0xc]
	ldrb r5, [r0, r4]
	cmp r5, #0
	beq _02015844
	ldr r1, _02015D08 ; =_02098FBC
	add r0, r0, r4
	mov r2, #3
	bl strncmp
	cmp r0, #0
	bne _02015838
	ldr r0, _02015D08 ; =_02098FBC
	bl strlen
	add r4, r4, r0
	b _02015844
_02015838:
	cmp r5, #0xd
	cmpne r5, #0xa
	addeq r4, r4, #1
_02015844:
	ldr r0, [sp, #0x720]
	cmp r0, #2
	bne _0201586C
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r0, r0, #0x100
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	b _02015888
_0201586C:
	cmp r0, #1
	ldrne r5, [sp, #8]
	bne _02015888
	add r0, sp, #0x500
	add r0, r0, #0xf8
	bl sub_020161CC
	rsb r5, r0, #0x100
_02015888:
	add r0, r7, #0xa
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	mov r2, r0, asr #2
	mov r3, r0, lsr #0x1f
	add r2, r1, r2, lsr #29
	rsb r1, r3, r1, lsl #29
	add r1, r3, r1, ror #29
	mov r0, r7, lsr #0x1f
	rsb r3, r0, r7, lsl #29
	add r0, r0, r3, ror #29
	str r0, [sp, #0x3c + SUB_0201578C_STACK_OFFSET]
	mov r0, r2, asr #3
	mov r6, r7, asr #2
	str r1, [sp, #0x34 + SUB_0201578C_STACK_OFFSET]
	add r1, r7, r6, lsr #29
	str r0, [sp, #0x30 + SUB_0201578C_STACK_OFFSET]
	mov r0, r1, asr #3
	add r6, sp, #0x500
	str r0, [sp, #0x38 + SUB_0201578C_STACK_OFFSET]
	add r6, r6, #0xf8
	b _02015CD8
#ifdef EUROPE
_020158E0:
	ldrb r0, [r6], #1
	cmp r0, #0x23
	str r0, [sp, #0x18]
	addeq r5, r5, #8
	beq _02015CD8
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02015CD8
	cmp r0, #0x5b
	bne _02015B14
	mov r0, #1
	str r6, [sp, #0x44]
	str r0, [sp, #0x1c]
	mov r1, r0
_020159C0:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _020159E0
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _020159C0
_020159E0:
	ldr r0, [sp, #0x44]
	ldr r1, _02015DEC ; =_02099404_EU
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015A0C
	ldr r0, [sp, #0x48]
	bl sub_0202380C_EU
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	b _02015B08
_02015A0C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015B08
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x34]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x38]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x20]
_02015A78:
	mov sl, sb
	mov lr, #0
	b _02015AD0
_02015A84:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_02015AD0:
	cmp lr, r0, asr #16
	blt _02015A84
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x20]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x20]
	cmp r1, #2
	blt _02015A78
	add r5, r5, r0, asr #16
_02015B08:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02015CD8
_02015B14:
	ldr r0, [sp, #0x18]
	bl sub_02025480
	bl sub_0201628C
	mov sl, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr r3, [r0]
	str r1, [sp, #0x24]
	mov r8, sl
	mov sb, sl
_02015B3C:
	ldrb r2, [r3], #1
	add r1, sp, #0x58
	add r1, r1, sb
	mov fp, r2, asr #4
	and ip, fp, #0xf
	add fp, sp, #0x58
	strb ip, [fp, sb]
	and r2, r2, #0xf
	add sb, sb, #2
	strb r2, [r1, #1]
	cmp sb, #0x240
	blt _02015B3C
_02015B6C:
	cmp r8, #0x240
	bge _02015BFC
	add r1, sp, #0x58
	ldrb r1, [r1, sl]
	add r3, sl, #1
	mov sl, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015BF0
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add sl, r3, #1
	and r3, r2, #0xff
	b _02015BC0
_02015BA8:
	add r2, sp, #0x298
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BC0:
	cmp sb, r1
	blt _02015BA8
	b _02015B6C
_02015BCC:
	add r2, sp, #0x58
	ldrb r3, [r2, sl]
	add r2, sp, #0x298
	add sl, sl, #1
	strb r3, [r2, r8]
	add r8, r8, #1
	cmp r8, #0x240
	bge _02015B6C
	add sb, sb, #1
_02015BF0:
	cmp sb, r1
	blt _02015BCC
	b _02015B6C
_02015BFC:
	mov fp, #0
_02015C00:
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x24]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r8, r1, #0xf00
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r1, r3, r1
	orr r1, r8, r1
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	cmp fp, #0x240
	str r2, [r1]
	blt _02015C00
	ldrb lr, [r0, #6]
	ldr r0, _02015D10 ; =_020AF710
	add r8, sp, #0x400
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r3, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x3c]
	mov r2, r7
	add r0, r1, r0, lsl #5
	add r1, r3, r0
	ldr r0, [sp, #4]
	add r8, r8, #0xd8
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x40]
	add r3, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x28]
_02015D04:
	mov r0, #0
	mov sl, r3
	str r0, [sp, #0x2c]
_02015D10_EU:
	ldr r1, [r8]
	cmp r1, #0
	beq _02015D4C
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015D4C:
	ldr r0, [sp, #0x2c]
	add r8, r8, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x2c]
	cmp r0, #3
	blt _02015D10_EU
	add r2, r2, #1
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	addeq r3, r3, #0x3e0
	str r0, [sp, #0x28]
	cmp r0, #0x18
	blt _02015D04
	ldr r0, [sp, #0x18]
	add r5, r5, lr
	cmp r0, #0x7e
#else
_020158E0:
	ldrb r8, [r6], #1
	cmp r8, #0x23
	addeq r5, r5, #8
	beq _02015CD8
	cmp r8, #0x20
#ifdef JAPAN
	addeq r5, r5, #0xc
#else
	addeq r5, r5, #6
#endif
	beq _02015CD8
	cmp r8, #0x5b
	bne _02015A2C
	str r6, [sp, #0x44]
	mov r1, #1
_0201590C:
	ldrb r0, [r6], #1
	cmp r0, #0x5d
	beq _0201592C
	cmp r0, #0x3a
	addeq r0, sp, #0x44
	streq r6, [r0, r1, lsl #2]
	addeq r1, r1, #1
	b _0201590C
_0201592C:
	ldr r0, [sp, #0x44]
	ldr r1, _02015D0C ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02015CD8
	ldr r0, [sp, #0x48]
	bl AtoiTagVeneer
	ldr r0, [sp, #0x4c]
	bl AtoiTagVeneer
	ldr r1, _02015D10 ; =_020AF710
	add ip, r5, #2
	ldr r1, [r1]
	ldr r8, [sp, #0x10]
	ldrsh r3, [r1, #0x32]
	mov r1, ip, asr #2
	add r1, ip, r1, lsr #29
	mov r2, r1, asr #3
	ldr r1, [sp, #0x30]
	mov r0, r0, lsl #0x10
	add r1, r2, r1, lsl #5
	add r2, r3, r1
	ldr r1, [sp, #4]
	add r2, r1, r2, lsl #5
	ldr r1, [sp, #0x34]
	add sb, r2, r1, lsl #2
	mov r1, #0
	str r1, [sp, #0x18]
_02015998:
	mov sl, sb
	mov lr, #0
	b _020159F0
_020159A4:
	add r1, ip, lr
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #29
	add r1, r2, r1, ror #29
	ldr r2, _02015D14 ; =_02098EE0
	add lr, lr, #8
	add r3, r2, r1, lsl #4
	ldr r1, [r2, r1, lsl #4]
	ldr r2, [sl]
	ldr fp, [r3, #8]
	bic r1, r1, #0
	orr r1, r2, r1, lsl fp
	str r1, [sl]
	ldr r1, [r3, #4]
	ldr r2, [sl, #0x20]!
	ldr r3, [r3, #0xc]
	bic r1, r1, #0
	orr r1, r2, r1, lsr r3
	str r1, [sl]
_020159F0:
	cmp lr, r0, asr #16
	blt _020159A4
	add r8, r8, #1
	mov r2, r8, lsr #0x1f
	rsb r1, r2, r8, lsl #29
	adds r1, r2, r1, ror #29
	ldr r1, [sp, #0x18]
	add sb, sb, #4
	add r1, r1, #1
	addeq sb, sb, #0x3e0
	str r1, [sp, #0x18]
	cmp r1, #2
	blt _02015998
	add r5, r5, r0, asr #16
	b _02015CD8
_02015A2C:
#ifdef JAPAN
	tst r8, #0x80
	beq _02015A24
	ldrb r0, [r6]
	cmp r0, #0
	orrne r8, r0, r8, lsl #8
	ldr r0, _02015D10_JP ; =0x00008140
	addne r6, r6, #1
	cmp r8, r0
	addeq r5, r5, #0xc
	beq _02015CD8
_02015A24:
#endif
	mov r0, r8
	bl sub_02025480
	bl sub_0201628C
	mov ip, #0
	add r1, sp, #0x400
	add r1, r1, #0xd8
	ldr sb, [r0]
	str r1, [sp, #0x1c]
	mov sl, ip
	mov fp, ip
_02015A54:
	ldrb r3, [sb], #1
	add r1, sp, #0x58
	add lr, r1, fp
	mov r1, r3, asr #4
	and r2, r1, #0xf
	add r1, sp, #0x58
	strb r2, [r1, fp]
	and r1, r3, #0xf
	add fp, fp, #2
	strb r1, [lr, #1]
	cmp fp, #0x240
	blt _02015A54
_02015A84:
	cmp sl, #0x240
	bge _02015B14
	add r1, sp, #0x58
	ldrb r1, [r1, ip]
	add r3, ip, #1
	mov ip, r3
	tst r1, #8
	and r1, r1, #7
	mov sb, #0
	beq _02015B08
	add r2, sp, #0x58
	ldrb r2, [r2, r3]
	add ip, r3, #1
	and r3, r2, #0xff
	b _02015AD8
_02015AC0:
	add r2, sp, #0x298
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015AD8:
	cmp sb, r1
	blt _02015AC0
	b _02015A84
_02015AE4:
	add r2, sp, #0x58
	ldrb r3, [r2, ip]
	add r2, sp, #0x298
	add ip, ip, #1
	strb r3, [r2, sl]
	add sl, sl, #1
	cmp sl, #0x240
	bge _02015A84
	add sb, sb, #1
_02015B08:
	cmp sb, r1
	blt _02015AE4
	b _02015A84
_02015B14:
	mov fp, #0
_02015B18:
	ldr r1, [sp, #0x1c]
	str r1, [sp, #0x14]
	add r1, r1, #4
	str r1, [sp, #0x1c]
	add r1, sp, #0x298
	add ip, r1, fp
	ldrb r3, [r1, fp]
	ldrb r1, [ip, #2]
	ldrb r2, [ip, #1]
	and sl, r3, #0xf
	mov r1, r1, lsl #8
	and r1, r1, #0xf00
	str r1, [sp, #0x40]
	ldrb r1, [ip, #5]
	mov r2, r2, lsl #4
	and sb, r2, #0xf0
	mov r1, r1, lsl #0x14
	ldrb r3, [ip, #3]
	ldrb r2, [ip, #4]
	and lr, r1, #0xf00000
	ldrb r1, [ip, #7]
	ldrb ip, [ip, #6]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsl #0x1c
	mov ip, ip, lsl #0x18
	mov r3, r3, lsl #0xc
	add fp, fp, #8
	and r1, r1, #0xf0000000
	and ip, ip, #0xf000000
	orr r1, r1, ip
	and r2, r2, #0xf0000
	orr r1, lr, r1
	and r3, r3, #0xf000
	orr r1, r2, r1
	orr r2, r3, r1
	ldr r1, [sp, #0x40]
	cmp fp, #0x240
	orr r1, r1, r2
	orr r1, sb, r1
	orr r2, sl, r1
	ldr r1, [sp, #0x14]
	str r2, [r1]
	blt _02015B18
	ldrb r0, [r0, #6]
	add r3, sp, #0x400
	mov lr, r7
	str r0, [sp, #0x20]
	ldr r0, _02015D10 ; =_020AF710
	add r3, r3, #0xd8
	ldr r1, [r0]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	ldrsh r2, [r1, #0x32]
	mov r1, r0, asr #3
	ldr r0, [sp, #0x38]
	add r0, r1, r0, lsl #5
	add r1, r2, r0
	ldr r0, [sp, #4]
	add r1, r0, r1, lsl #5
	ldr r0, [sp, #0x3c]
	add r2, r1, r0, lsl #2
	mov r1, r5, lsr #0x1f
	rsb r0, r1, r5, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, _02015D14 ; =_02098EE0
	add sb, r0, r1, lsl #4
	mov r0, #0
	str r0, [sp, #0x24]
_02015C28:
	mov r0, #0
	mov sl, r2
	str r0, [sp, #0x28]
_02015C34:
	ldr r1, [r3]
	cmp r1, #0
	beq _02015C70
	ldr r0, [sl]
	ldr ip, [sb]
	ldr fp, [sb, #8]
	and ip, r1, ip
	orr r0, r0, ip, lsl fp
	str r0, [sl]
	ldr ip, [sl, #0x20]
	ldr fp, [sb, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, fp
	orr r0, ip, r1, lsr r0
	str r0, [sl, #0x20]
_02015C70:
	ldr r0, [sp, #0x28]
	add r3, r3, #4
	add r0, r0, #1
	add sl, sl, #0x20
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02015C34
	add lr, lr, #1
	mov r1, lr, lsr #0x1f
	rsb r0, r1, lr, lsl #29
	adds r0, r1, r0, ror #29
	ldr r0, [sp, #0x24]
	add r2, r2, #4
	add r0, r0, #1
	addeq r2, r2, #0x3e0
	str r0, [sp, #0x24]
	cmp r0, #0x18
	blt _02015C28
	ldr r0, [sp, #0x20]
	cmp r8, #0x7e
	add r5, r5, r0
#endif
	ldreqb r0, [r6]
	cmpeq r0, #0x32
	ldreqb r0, [r6, #1]
	cmpeq r0, #0x37
	addeq r6, r6, #2
_02015CD8:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020158E0
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add r7, r7, #0x18
	add r0, r0, #1
	str r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	b _020157B8
_02015CF8:
	ldr r0, [sp, #0x2c + SUB_0201578C_STACK_OFFSET]
	add sp, sp, #0x2f8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015D08: .word _02098FBC
#ifdef EUROPE
_02015DEC: .word _02099404_EU
#endif
_02015D0C: .word _02098FC0
_02015D10: .word _020AF710
_02015D14: .word _02098EE0
#ifdef JAPAN
_02015D10_JP: .word 0x00008140
#endif
	arm_func_end sub_0201578C

	arm_func_start sub_02015D18
sub_02015D18: ; 0x02015D18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r6, r4
	str r1, [sp, #4]
	str r5, [sp, #8]
	b _02015D60
_02015D3C:
	ldrb r1, [r2], #1
	cmp r1, #0x7e
	strb r1, [r6], #1
	bne _02015D60
	ldrb r1, [r2]
	cmp r1, #0x32
	ldreqb r1, [r2, #1]
	cmpeq r1, #0x37
	addeq r2, r2, #2
_02015D60:
	ldrb r1, [r2]
	cmp r1, #0
	bne _02015D3C
	mov r1, #0
	strb r1, [r6]
	str r3, [sp]
	ldr r2, _02015E40 ; =_020AF710
	mov r1, r0
	ldr r0, [r2]
	mov r2, r5
	ldr r0, [r0]
	mov r3, r4
	bl sub_0201578C
	mov r1, r5, asr #2
	add r2, r5, r1, lsr #29
	mov r7, r0
	mov r1, #0x18
	mul r0, r7, r1
	add r0, r0, r2, asr #3
	add r3, r0, #7
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	mov r0, r0, asr #3
	mov sb, r2, asr #3
	bl _s32_div_f
	ldr fp, _02015E40 ; =_020AF710
	mov sl, r1
	ldr r0, [fp]
	mov r4, #0
	ldrsh r0, [r0, #0x32]
	add r0, r0, sb, lsl #5
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	b _02015E2C
_02015DE8:
	mov r5, #0
	add r8, sb, r4
_02015DF0:
	ldr r0, [fp]
	str r5, [sp, #4]
	str r8, [sp, #8]
	ldrsh r2, [r0, #0x30]
	ldr r0, [r0, #4]
	add r1, sp, #4
	orr r2, r6, r2, lsl #12
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	add r5, r5, #1
	cmp r5, #0x20
	add r6, r6, #1
	blt _02015DF0
	add r4, r4, #1
_02015E2C:
	cmp r4, sl
	blt _02015DE8
	mov r0, r7
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02015E40: .word _020AF710
	arm_func_end sub_02015D18

	arm_func_start sub_02015E44
sub_02015E44: ; 0x02015E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromId
	mov r2, r0
	mov r1, r4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	ldmia sp!, {r4, pc}
	arm_func_end sub_02015E44

	arm_func_start sub_02015E6C
sub_02015E6C: ; 0x02015E6C
	stmdb sp!, {r3, lr}
	ldr r0, _02015EB0 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02015E88
	bl sub_0200B330
_02015E88:
	ldr r0, _02015EB0 ; =_020AF710
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02015EA4
	bl sub_0200A174
	ldmia sp!, {r3, pc}
_02015EA4:
	ldr r0, [r1, #0xc]
	bl sub_0200A504
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EB0: .word _020AF710
	arm_func_end sub_02015E6C

	arm_func_start sub_02015EB4
sub_02015EB4: ; 0x02015EB4
	stmdb sp!, {r3, lr}
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0200B3D4
	ldr r0, _02015EE4 ; =_020AF710
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0200B330
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015EE4: .word _020AF710
	arm_func_end sub_02015EB4

	arm_func_start sub_02015EE8
sub_02015EE8: ; 0x02015EE8
	stmdb sp!, {r3, lr}
	ldr r1, _02015F14 ; =_020AF710
	ldr r2, [r1]
	ldr r1, [r2, #8]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, r0, lsl #0x10
	ldr r0, [r2, #0xc]
	mov r1, r1, lsr #0x10
	bl sub_0200A618
	ldmia sp!, {r3, pc}
	.align 2, 0
_02015F14: .word _020AF710
	arm_func_end sub_02015EE8

	arm_func_start sub_02015F18
sub_02015F18: ; 0x02015F18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r4, _02015FD4 ; =_020AF710
	mov r6, #0
	ldr r0, [r4]
	add r5, sp, #0
	ldr r0, [r0, #8]
	mov r8, #0x10
	cmp r0, #0
	beq _02015F88
	ldr r7, _02015FD8 ; =_020AFC70
_02015F44:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #8]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A2B4
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F44
	b _02015FCC
_02015F88:
	ldr r7, _02015FD8 ; =_020AFC70
_02015F8C:
	ldr r0, [r4]
	mov r2, r6, lsl #0x10
	ldr r0, [r0, #0xc]
	mov r1, r5
	mov r2, r2, lsr #0x10
	bl sub_0200A5F8
	ldr r0, [r7]
	mov r3, r6, lsl #0x10
	mov r1, r5
	mov r2, r8
	add r0, r0, #0xcc
	mov r3, r3, asr #0x10
	bl sub_0201E380
	add r6, r6, #1
	cmp r6, #0x100
	blt _02015F8C
_02015FCC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02015FD4: .word _020AF710
_02015FD8: .word _020AFC70
	arm_func_end sub_02015F18

	arm_func_start sub_02015FDC
sub_02015FDC: ; 0x02015FDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	mov r3, r2, asr #2
	add r2, r2, r3, lsr #29
	mov ip, r5
	mov lr, r5
	b _0201602C
_02015FF8:
	mov r6, lr
	add r8, r1, r5, lsl #10
_02016000:
	mov r7, ip
	add r4, r8, r6, lsl #2
_02016008:
	ldr r3, [r4], #0x20
	add r7, r7, #1
	cmp r7, #0x20
	str r3, [r0], #4
	blt _02016008
	add r6, r6, #1
	cmp r6, #8
	blt _02016000
	add r5, r5, #1
_0201602C:
	cmp r5, r2, asr #3
	blt _02015FF8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02015FDC

	arm_func_start sub_02016038
sub_02016038: ; 0x02016038
	ldr ip, _02016048 ; =sub_0201E050
	add r1, r1, #0x10000
	mov r3, #0
	bx ip
	.align 2, 0
_02016048: .word sub_0201E050
	arm_func_end sub_02016038

	arm_func_start sub_0201604C
sub_0201604C: ; 0x0201604C
	stmdb sp!, {r3, lr}
	add r1, r1, #0x10000
	str r1, [r0, #0x20]
	mov ip, #0
	strh ip, [r0, #0x16]
	mov r1, #8
	strh ip, [r0, #0x18]
	mov ip, #0x100
	mov r1, r1, lsl r3
	strh ip, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh lr, [r0, #0x14]
	mov ip, r3, lsl #0x1d
	ldr r1, _02016110 ; =_020AF710
	bic r3, lr, #7
	orr r3, r3, #5
	strh r3, [r0, #0x14]
	ldrh lr, [r0, #0x14]
	ldr r3, _02016114 ; =_020AFC70
	bic lr, lr, #0x38
	orr ip, lr, ip, lsr #26
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0xc0
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x700
	orr ip, ip, #0x300
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x1800
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	bic ip, ip, #0x6000
	strh ip, [r0, #0x14]
	ldrh ip, [r0, #0x14]
	orr ip, ip, #0x8000
	strh ip, [r0, #0x14]
	ldr r1, [r1]
	ldr r3, [r3]
	ldrsh r1, [r1, #0x30]
	ldr r3, [r3, #0xe0]
	add r1, r2, r1
	mov r1, r1, lsl #0x14
	mov r1, r1, asr #0x10
	add r1, r1, #0x1000
	add r1, r3, r1, lsl #1
	str r1, [r0, #0x24]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016110: .word _020AF710
_02016114: .word _020AFC70
	arm_func_end sub_0201604C

	arm_func_start sub_02016118
sub_02016118: ; 0x02016118
	ldr r2, _02016140 ; =_020AF720
	ldr r3, _02016144 ; =_020AF721
	ldrb ip, [r2, r1, lsl #2]
	ldr r2, _02016148 ; =_020AF722
	strb ip, [r0, #0x2c]
	ldrb r3, [r3, r1, lsl #2]
	strb r3, [r0, #0x2d]
	ldrb r1, [r2, r1, lsl #2]
	strb r1, [r0, #0x2e]
	bx lr
	.align 2, 0
_02016140: .word _020AF720
_02016144: .word _020AF721
_02016148: .word _020AF722
	arm_func_end sub_02016118

	arm_func_start sub_0201614C
sub_0201614C: ; 0x0201614C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, [r6, #8]
	mov r5, r1
	mov r4, r2
	cmp r0, #0
	mov r7, #0
	beq _0201619C
_0201616C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #8]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl sub_0200A29C
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201616C
	ldr r0, [r6, #8]
	bl sub_0200A174
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0201619C:
	add r0, r7, r5, lsl #4
	mov r1, r0, lsl #0x10
	ldr r0, [r6, #0xc]
	mov r1, r1, lsr #0x10
	add r2, r4, r7, lsl #2
	bl sub_0200A590
	add r7, r7, #1
	cmp r7, #0x10
	blt _0201619C
	ldr r0, [r6, #0xc]
	bl sub_0200A504
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201614C

	arm_func_start sub_020161CC
sub_020161CC: ; 0x020161CC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
#ifdef JAPAN
	mov r5, r0
	mov r4, #0
	b _02016294
_020161DC:
	ldrb r0, [r5], #1
	cmp r0, #0x23
	addeq r4, r4, #8
	beq _02016294
	cmp r0, #0x20
	addeq r4, r4, #0xc
	beq _02016294
	cmp r0, #0x5b
	bne _02016258
	str r5, [sp]
	mov r2, #1
	add r0, sp, #0
_0201620C:
	ldrb r1, [r5], #1
	cmp r1, #0x5d
	beq _02016228
	cmp r1, #0x3a
	streq r5, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _0201620C
_02016228:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0_JP
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016294
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r4, r4, r0, asr #16
	b _02016294
_02016258:
	tst r0, #0x80
	beq _02016280
	ldrb r1, [r5]
	cmp r1, #0
	orrne r0, r1, r0, lsl #8
	ldr r1, _020162B0_JP ; =0x00008140
	addne r5, r5, #1
	cmp r0, r1
	addeq r4, r4, #0xc
	beq _02016294
_02016280:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r4, r4, r0
_02016294:
	ldrb r0, [r5]
	cmp r0, #0
	bne _020161DC
	mov r0, r4
#else
	mov r4, r0
	mov r5, #0
	b _02016270
_020161E0:
	ldrb r0, [r4], #1
	cmp r0, #0x23
	addeq r5, r5, #8
	beq _02016270
	cmp r0, #0x20
	addeq r5, r5, #6
	beq _02016270
	cmp r0, #0x5b
	bne _0201625C
	str r4, [sp]
	mov r2, #1
	add r0, sp, #0
_02016210:
	ldrb r1, [r4], #1
	cmp r1, #0x5d
	beq _0201622C
	cmp r1, #0x3a
	streq r4, [r0, r2, lsl #2]
	addeq r2, r2, #1
	b _02016210
_0201622C:
	ldr r0, [sp]
	ldr r1, _02016288 ; =_02098FC0
	bl StrcmpTagVeneer
	cmp r0, #0
	beq _02016270
	ldr r0, [sp, #4]
	bl AtoiTagVeneer
	ldr r0, [sp, #8]
	bl AtoiTagVeneer
	mov r0, r0, lsl #0x10
	add r5, r5, r0, asr #16
	b _02016270
_0201625C:
	bl sub_02025480
	bl sub_0201628C
	cmp r0, #0
	ldrneb r0, [r0, #6]
	addne r5, r5, r0
_02016270:
	ldrb r0, [r4]
	cmp r0, #0
	bne _020161E0
	mov r0, r5
#endif
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02016288: .word _02098FC0
#ifdef JAPAN
_020162B0_JP: .word 0x00008140
#endif
	arm_func_end sub_020161CC

	arm_func_start sub_0201628C
sub_0201628C: ; 0x0201628C
	stmdb sp!, {r3, lr}
	ldr r1, _020162FC ; =_020AF710
	mov lr, #0
	ldr r1, [r1]
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #0x2c]
	ldr r3, [r2]
	sub ip, r1, #1
	b _020162DC
_020162B0:
	add r1, lr, ip
	add r1, r1, r1, lsr #31
	mov r2, r1, asr #1
	add r1, r3, r2, lsl #3
	ldrh r1, [r1, #4]
	cmp r0, r1
	moveq lr, r2
	beq _020162E4
	cmp r1, r0
	addlt lr, r2, #1
	movge ip, r2
_020162DC:
	cmp lr, ip
	blt _020162B0
_020162E4:
	add r2, r3, lr, lsl #3
	ldrh r1, [r2, #4]
	cmp r1, r0
	addne r2, r3, #8
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020162FC: .word _020AF710
	arm_func_end sub_0201628C

	arm_func_start sub_02016300
sub_02016300: ; 0x02016300
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x20]
	ldr lr, _0201636C ; =_020AF760
	ldrsh ip, [sp, #0x18]
	str r4, [lr]
	ldrsh r4, [sp, #0x1c]
	str ip, [sp]
	mov ip, #0x14
	str r4, [sp, #4]
	ldr r4, [lr]
	ldr lr, _02016370 ; =_0209901C
	mul ip, r4, ip
	ldr ip, [lr, ip]
	str ip, [sp, #8]
	bl sub_02015328
	ldr r1, _0201636C ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016374 ; =_02099020
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02016364
	blx r0
_02016364:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201636C: .word _020AF760
_02016370: .word _0209901C
_02016374: .word _02099020
	arm_func_end sub_02016300

	arm_func_start sub_02016378
sub_02016378: ; 0x02016378
	stmdb sp!, {r3, lr}
	ldr ip, _020163A4 ; =_020AF760
	mov r3, #0x14
	ldr lr, [ip]
	ldr ip, _020163A8 ; =_02099024
	mul r3, lr, r3
	ldr r3, [ip, r3]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163A4: .word _020AF760
_020163A8: .word _02099024
	arm_func_end sub_02016378

	arm_func_start sub_020163AC
sub_020163AC: ; 0x020163AC
	stmdb sp!, {r3, lr}
	ldr r1, _020163DC ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _020163E0 ; =_02099028
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, pc}
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020163DC: .word _020AF760
_020163E0: .word _02099028
	arm_func_end sub_020163AC

	arm_func_start sub_020163E4
sub_020163E4: ; 0x020163E4
	stmdb sp!, {r3, lr}
	ldr r1, _02016414 ; =_020AF760
	mov r0, #0x14
	ldr r2, [r1]
	ldr r1, _02016418 ; =_0209902C
	mul r0, r2, r0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0201640C
	blx r0
_0201640C:
	bl sub_0201551C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016414: .word _020AF760
_02016418: .word _0209902C
	arm_func_end sub_020163E4

	arm_func_start sub_0201641C
sub_0201641C: ; 0x0201641C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02015588
	mov r1, r4
	mov r0, #3
	mov r2, #0
	bl sub_0204F6F8
	mov r4, r0
	bl sub_02015570
	mov r0, r4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201641C

	arm_func_start sub_02016468
sub_02016468: ; 0x02016468
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r4, r1
	mov r5, r0
	bl sub_02015588
	bl sub_02015570
	add r0, sp, #0
	mov r1, r4
	bl strcpy
	mov r1, r5
	mov r0, #0
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016468

	arm_func_start sub_020164AC
sub_020164AC: ; 0x020164AC
	stmdb sp!, {r3, lr}
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x90
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30c0
	add r0, r0, #0x8000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0xf0
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x60
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	add r0, r0, #0xb000
	bl MemZero
	ldr r0, _02016544 ; =_020AF760
	mov r1, #0x30
	ldr r0, [r0, #4]
	add r0, r0, #0x120
	add r0, r0, #0xb000
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016544: .word _020AF760
	arm_func_end sub_020164AC

	arm_func_start sub_02016548
sub_02016548: ; 0x02016548
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x104
	ldrb r4, [sp, #0x118]
	mov ip, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, #0
	add r0, sp, #4
	mov r1, ip
	beq _020165C8
	mov r2, r5
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #4
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r6
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r7
	add r0, sp, #4
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #4
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	b _02016768
_020165C8:
	mov r2, r5
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016770 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r7
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016770 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016770 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #0xa
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r0, r0, asr #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r0, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldr r0, _02016770 ; =_020AF760
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r1, #0x1000
	mov r2, #0
	mov r3, #4
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r3, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r0, r0, lsl #0xf
	mov r2, r0, asr #0x10
	strb r3, [r4, #0x3c]
	strh r2, [r4]
	strh r1, [r4, #2]
	mov r0, #0xa
	strb r0, [r4, #0x3e]
	strh r2, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #0x21
	cmp r5, #0
	strh r0, [r4, #0x2a]
	beq _02016760
	bl sub_0201F36C
	ldr r2, _02016770 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldrsh r0, [r0, #0x60]
	bl sub_0201F324
	mov r1, #2
	strb r1, [r0, #0x3c]
	mov r1, #0
	strh r1, [r0]
	mov r1, #0x3b
	strh r1, [r0, #2]
	mov r1, #0x100
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	mov r2, #0xa
	mov r1, r6
	strb r2, [r0, #0x3e]
	mov r2, #0x21
	strh r2, [r0, #0x2a]
	bl sub_02016118
	b _02016768
_02016760:
	mov r0, #0x80
	bl sub_02015EE8
_02016768:
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02016770: .word _020AF760
	arm_func_end sub_02016548

	arm_func_start sub_02016774
sub_02016774: ; 0x02016774
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_02016774

	arm_func_start sub_02016788
sub_02016788: ; 0x02016788
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r0
	mov r5, r1
	mov r4, r2
	add r0, sp, #0
	mov r1, r3
	mov r2, #0
	bl sub_020175F8
	bl sub_02015570
	add r2, sp, #0
	mov r0, #0
	mov r1, #0x20
	mov r3, #2
	bl sub_02015D18
	mov r1, r4
	mov r0, #0x3b
	bl sub_020156AC
	mov r1, r5
	add r0, sp, #0
	bl strcpy
	mov r0, #0
	mov r1, #0x52
	add r2, sp, #0
	mov r3, #2
	bl sub_02015D18
	bl sub_02015E6C
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02016788

	arm_func_start sub_020167FC
sub_020167FC: ; 0x020167FC
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl sub_02016548
	ldmia sp!, {r3, pc}
	arm_func_end sub_020167FC

	arm_func_start sub_02016814
sub_02016814: ; 0x02016814
	stmdb sp!, {r4, lr}
	ldr r0, _02016880 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016884 ; =_020AF760
	ldr r1, _02016880 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016884 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016880: .word 0x0000B160
_02016884: .word _020AF760
	arm_func_end sub_02016814

	arm_func_start sub_02016888
sub_02016888: ; 0x02016888
	stmdb sp!, {r3, lr}
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x100
	bl sub_02015EE8
	bl sub_0201F2E4
	ldr r0, _020168C4 ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _020168C4 ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020168C4: .word _020AF760
	arm_func_end sub_02016888

	arm_func_start sub_020168C8
sub_020168C8: ; 0x020168C8
	stmdb sp!, {r4, lr}
	ldr r0, _02016934 ; =0x0000B160
	mov r1, #0
	bl MemAlloc
	ldr r2, _02016938 ; =_020AF760
	ldr r1, _02016934 ; =0x0000B160
	str r0, [r2, #4]
	bl MemZero
	bl sub_0201F2E4
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0x1000
	ldr r4, [r0, #4]
	add r0, r4, #0x6000
	bl MemZero
	add r0, r4, #0x7000
	mov r1, #0x4000
	bl MemZero
	add r0, r4, #0xb000
	mov r1, #0x20
	bl MemZero
	bl sub_02015F18
	ldr r0, _02016938 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02016934: .word 0x0000B160
_02016938: .word _020AF760
	arm_func_end sub_020168C8

	arm_func_start sub_0201693C
sub_0201693C: ; 0x0201693C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x104
	mov r3, r0
	mov r4, r1
	mov r6, r2
	add r0, sp, #4
	mov r1, r3
	mov r2, #1
	bl sub_020175F8
	mov r2, #2
	ldr r0, _02016BB4 ; =_020AF760
	str r2, [sp]
	ldr r0, [r0, #4]
	add r3, sp, #4
	mov r1, r4
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02016BB4 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02016BB4 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02016BB4 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	mov r2, r1
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0x20
	mov r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	rsb r0, r3, #0
	strh r0, [r4]
	strh r2, [r4, #2]
	strb r1, [r4, #0x3e]
	strh r3, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0x6000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r1, #0x1000
	mov r2, #0
	mov r3, #2
	mov r4, r0
	bl sub_0201604C
	ldrsh r0, [r4, #0x1a]
	mov r2, #0
	mov r1, #0x52
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	strb r2, [r4, #0x3c]
	add r0, r3, #0x100
	strh r0, [r4]
	strh r1, [r4, #2]
	mov r0, #1
	strb r0, [r4, #0x3e]
	strh r3, [r4, #8]
	strh r2, [r4, #0xa]
	mov r0, #0x21
	strh r0, [r4, #0x2a]
	ldrsh r0, [r4]
	mov r2, #0xa000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02016BB4 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0xb000
	add r1, r1, #0x60
	ldrsh r0, [r0, #0x60]
	add r5, r1, #0xb000
	bl sub_0201F324
	mov r4, r0
	mov r1, #2
	strb r1, [r4, #0x3c]
	mvn r1, #0xff
	strh r1, [r4]
	mov r1, #0x3b
	strh r1, [r4, #2]
	mov r1, #0x100
	strh r1, [r4, #4]
	mov r1, #1
	strh r1, [r4, #6]
	strb r1, [r4, #0x3e]
	mov r2, #0x21
	mov r1, r6
	strh r2, [r4, #0x2a]
	bl sub_02016118
	ldrsh r1, [r4]
	mov r2, #0x1800
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02016BB4 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0x14]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	mov r2, #0x10
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02016BB4: .word _020AF760
	arm_func_end sub_0201693C

	arm_func_start sub_02016BB8
sub_02016BB8: ; 0x02016BB8
	stmdb sp!, {r3, lr}
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0201F2E4
	ldr r0, _02016BEC ; =_020AF760
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02016BEC ; =_020AF760
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02016BEC: .word _020AF760
	arm_func_end sub_02016BB8

	arm_func_start sub_02016BF0
sub_02016BF0: ; 0x02016BF0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02016EA8 ; =_020AF760
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02016EA0
	add r2, r1, #0xb000
	ldrsh r0, [r2, #0x60]
	add r1, r1, #0x60
	add r6, r1, #0xb000
	ldr r5, [r2, #0x154]
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _02016C44
	cmp r1, #2
	beq _02016C78
	cmp r1, #3
	moveq r0, #0
	streqb r0, [r6, #0x28]
	b _02016C94
_02016C44:
	ldr r1, [r6, #4]
	ldr r0, [r6, #0x14]
	adds r0, r1, r0
	str r0, [r6, #4]
	bmi _02016C94
	ldrb r2, [r6, #0x28]
	mov r1, #0
	mov r0, #0x2d
	add r2, r2, #1
	strb r2, [r6, #0x28]
	str r1, [r6, #4]
	str r0, [r6, #0x2c]
	b _02016C94
_02016C78:
	ldr r1, [r6, #0x2c]
	sub r0, r1, #1
	str r0, [r6, #0x2c]
	cmp r1, #0
	ldreqb r0, [r6, #0x28]
	addeq r0, r0, #1
	streqb r0, [r6, #0x28]
_02016C94:
	ldr r2, [r6, #4]
	mov r1, r5
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	ldr r1, _02016EA8 ; =_020AF760
	strb r0, [r4, #0x2f]
	ldr r0, [r1, #4]
	mov r2, #0
	add r1, r0, #0xb000
	add r0, r0, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r2, _02016EA8 ; =_020AF760
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r3, [r0, #0x94]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	mov r1, r1, asr #8
	cmp r1, #0x80
	blt _02016D48
	mov r1, #0
	str r1, [r0, #0xa4]
	ldr r0, [r2, #4]
	mov r1, #0x8000
	add r0, r0, #0xb000
	str r1, [r0, #0x94]
	ldr r4, [r2, #4]
	add r0, r4, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	add r1, r4, #0xb000
	ldr r2, [r1, #0x94]
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [r0]
_02016D48:
	ldr r0, _02016EA8 ; =_020AF760
	ldr r2, [r0, #4]
	add r0, r2, #0xb000
	ldrsh r0, [r0, #0xc0]
	add r1, r2, #0x90
	add r2, r2, #0x30c0
	add r5, r1, #0xb000
	add r4, r2, #0x8000
	bl sub_0201F324
	ldr r1, [r5, #4]
	ldr r2, _02016EA8 ; =_020AF760
	rsb r3, r1, #0x10000
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	str r3, [r4, #4]
	mov r1, r1, asr #8
	strh r1, [r0]
	ldr r0, [r2, #4]
	add r1, r0, #0xb000
	ldr r3, [r1, #0x20]
	cmp r3, #0x14
	bhi _02016DCC
	subs r0, r3, #0x10
	addpl pc, pc, r0, lsl #2
	b _02016DC0
_02016DAC: ; jump table
	b _02016DE0 ; case 0
	b _02016E00 ; case 1
	b _02016E38 ; case 2
	b _02016E64 ; case 3
	b _02016E84 ; case 4
_02016DC0:
	cmp r3, #0
	beq _02016DD8
	b _02016E98
_02016DCC:
	cmp r3, #0xff
	beq _02016E90
	b _02016E98
_02016DD8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02016DE0:
	mov r0, #1
	strb r0, [r1, #0x88]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E00:
	ldrb r0, [r1, #0x88]
	cmp r0, #0
	bne _02016E98
	mov r3, #1
	strb r3, [r1, #0xb8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	strb r3, [r0, #0xe8]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E38:
	ldrb r0, [r1, #0xb8]
	cmp r0, #2
	bne _02016E98
	mov r0, #0x3c
	str r0, [r1, #0x150]
	ldr r0, [r2, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _02016E98
_02016E64:
	ldr r2, [r1, #0x94]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	cmp r0, #0x80
	addge r0, r3, #1
	strge r0, [r1, #0x20]
	b _02016E98
_02016E84:
	mov r0, #0xff
	str r0, [r1, #0x20]
	b _02016E98
_02016E90:
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_02016E98:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02016EA0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02016EA8: .word _020AF760
	arm_func_end sub_02016BF0

	arm_func_start sub_02016EAC
sub_02016EAC: ; 0x02016EAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	bl sub_020168C8
	ldr r0, _02017128 ; =0x00000A7C
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201712C ; =_020AF760
	ldr r1, _02017128 ; =0x00000A7C
	str r0, [r2, #8]
	bl MemZero
	ldr r0, _02017130 ; =WAN_TABLE
	ldr r1, _02017134 ; =_02099110
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r2, _02017130 ; =WAN_TABLE
	ldr r3, [r1, #8]
	ldr r1, _02017138 ; =_02099124
	strh r0, [r3, #0x94]
	ldr r0, [r2]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _0201712C ; =_020AF760
	ldr r1, [r1, #8]
	strh r0, [r1, #0x96]
	bl sub_02015F18
	ldr r0, _0201712C ; =_020AF760
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0201712C ; =_020AF760
	ldr r1, [r0, #8]
	add r0, r1, #0x98
	ldrsh r1, [r1, #0x94]
	bl SetSpriteIdForAnimationControl
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r0, _0201712C ; =_020AF760
	str r2, [sp, #0xc]
	ldr r0, [r0, #8]
	mov r1, #0xc
	mov r3, #0x100
	add r0, r0, #0x98
	bl SetAnimationForAnimationControl
	ldr r0, _0201712C ; =_020AF760
	mov r4, #0xd0
	ldr r2, [r0, #8]
	mov r3, #0x6a
	strh r4, [r2, #0xb4]
	ldr r2, [r0, #8]
	mov r1, #0
	strh r3, [r2, #0xb6]
	ldr r0, [r0, #8]
	add r0, r0, #0x98
	bl sub_0201D12C
	ldr r0, _0201712C ; =_020AF760
	ldr r5, _0201713C ; =_02098FC8
	ldr r7, [r0, #8]
	mov sb, #0
	add r6, r7, #0x114
	mov fp, #1
_02016FB0:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x94]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	mov r0, #0xc
	mul r4, sb, r0
	add sl, r5, r4
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #25
	str fp, [sp]
	add r0, r1, r0, ror #25
	stmib sp, {r0, fp}
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r5, r4]
	mov r0, r8
	mov r2, #0
	mov r3, #0x100
	bl SetAnimationForAnimationControl
	ldr r1, [sl, #4]
	mov r0, r8
	strh r1, [r8, #0x1c]
	ldr r2, [sl, #8]
	mov r1, #0
	strh r2, [r8, #0x1e]
	bl sub_0201D12C
	add sb, sb, #1
	cmp sb, #7
	blt _02016FB0
	ldr r0, _0201712C ; =_020AF760
	ldr r4, _02017140 ; =_02099080
	ldr r7, [r0, #8]
	mov sb, #0
	add r0, r7, #0x7c
	add r6, r0, #0x400
	mov r5, #0x40
	mov fp, #0xc
_02017054:
	mov r0, #0x7c
	mla r8, sb, r0, r6
	mov r0, r8
	bl InitAnimationControlWithSet__0201C0B0
	ldrsh r1, [r7, #0x96]
	mov r0, r8
	bl SetSpriteIdForAnimationControl
	strh r5, [r8, #0x38]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mul r0, sb, fp
	mov r2, #0
	ldr r1, [r4, r0]
	add sl, r4, r0
	mov r0, r8
	mov r3, r2
	bl SetAnimationForAnimationControl
	ldr r0, [sl, #4]
	cmp sb, #6
	strh r0, [r8, #0x1c]
	ldr r0, [sl, #8]
	strh r0, [r8, #0x1e]
	blt _020170D8
	add r3, r7, sb, lsl #2
	ldr r2, [r3, #0xa34]
	mov r0, r8
	mov r1, #0
	str r2, [r3, #0xa4c]
	bl sub_0201D12C
	b _020170FC
_020170D8:
	bl Rand16Bit
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r2, r1, r0, ror #28
	add r1, r7, sb, lsl #2
	str r2, [r1, #0xa4c]
	mov r0, r8
	mov r1, #1
	bl sub_0201D12C
_020170FC:
	add sb, sb, #1
	cmp sb, #0xc
	blt _02017054
	mov r0, #2
	bl sub_0206AA5C
	bl sub_0206AB98
	bl sub_0206ABB0
	mov r0, #0x2d
	bl sub_0206ADA0
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017128: .word 0x00000A7C
_0201712C: .word _020AF760
_02017130: .word WAN_TABLE
_02017134: .word _02099110
_02017138: .word _02099124
_0201713C: .word _02098FC8
_02017140: .word _02099080
	arm_func_end sub_02016EAC

	arm_func_start sub_02017144
sub_02017144: ; 0x02017144
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r2, r0
	mov r4, r1
	mov r1, r2
	add r0, sp, #4
	mov r2, #1
	bl sub_020175F8
	mov r1, #0
	str r1, [sp]
	ldr r0, _02017310 ; =_020AF760
	add r3, sp, #4
	ldr r0, [r0, #4]
	mov r1, r4
	mov r2, #2
	bl sub_0201770C
	bl sub_020164AC
	ldr r0, _02017310 ; =_020AF760
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x90]
	bl sub_0201F36C
	ldr r1, _02017310 ; =_020AF760
	ldr r1, [r1, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0xc0]
	bl sub_0201F36C
	ldr r2, _02017310 ; =_020AF760
	ldr r1, [r2, #4]
	add r1, r1, #0xb000
	strh r0, [r1, #0x60]
	ldr r1, [r2, #4]
	add r0, r1, #0x90
	add r5, r0, #0xb000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0x90]
	bl sub_0201F324
	mov r1, #0
	mov r4, r0
	strb r1, [r4, #0x3c]
	sub r2, r1, #0x100
	strh r2, [r4]
	mov r2, #0x20
	strh r2, [r4, #2]
	mov r2, #1
	strb r2, [r4, #0x3e]
	mov r3, #0x21
	strh r3, [r4, #0x2a]
	mov r3, #2
	bl sub_0201604C
	ldrsh r0, [r4]
	mov r2, #0x2000
	mov r1, #0xff00
	mov r0, r0, lsl #8
	str r0, [r5, #4]
	ldrsh r3, [r4, #2]
	ldr r0, _02017310 ; =_020AF760
	mov r3, r3, lsl #8
	str r3, [r5, #8]
	str r2, [r5, #0xc]
	ldr r2, [r5, #8]
	str r2, [r5, #0x10]
	str r1, [r5, #0x24]
	ldr r1, [r0, #4]
	add r0, r1, #0x30c0
	add r5, r0, #0x8000
	add r0, r1, #0xb000
	ldrsh r0, [r0, #0xc0]
	bl sub_0201F324
	mov r4, r0
	mov r2, #0
	strb r2, [r4, #0x3c]
	mov r1, #0x180
	strh r1, [r4]
	mov r1, #0x52
	strh r1, [r4, #2]
	mov r1, #0x80
	strh r1, [r4, #8]
	strh r2, [r4, #0xa]
	mov r1, #0x21
	strh r1, [r4, #0x2a]
	mov r1, #1
	strb r1, [r4, #0x3e]
	mov r1, #0x1000
	mov r3, #2
	bl sub_0201604C
	ldrsh r1, [r4]
	mov r2, #0x8000
	mov r0, #0xff00
	mov r1, r1, lsl #8
	str r1, [r5, #4]
	ldrsh r4, [r4, #2]
	ldr r1, _02017310 ; =_020AF760
	mov r3, #0x100
	mov r4, r4, lsl #8
	str r4, [r5, #8]
	str r2, [r5, #0xc]
	ldr r4, [r5, #8]
	mov r2, #0x10
	str r4, [r5, #0x10]
	str r0, [r5, #0x24]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r3, [r0, #0x154]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	str r2, [r0, #0x20]
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02017310: .word _020AF760
	arm_func_end sub_02017144

	arm_func_start sub_02017314
sub_02017314: ; 0x02017314
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r0, _02017588 ; =_020AF760
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0201757C
	bl sub_0206ADB8
	bl sub_0206AD4C
	cmp r0, #0
	bne _0201757C
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldmib r0, {r3, r4}
	add r1, r3, #0xb000
	add r0, r3, #0x90
	ldr r1, [r1, #0x154]
	add r0, r0, #0xb000
	bl sub_020177AC
	ldr r0, _02017588 ; =_020AF760
	mov r2, #1
	ldr r0, [r0, #4]
	add r1, r0, #0xb000
	add r0, r0, #0x30c0
	ldr r1, [r1, #0x154]
	add r0, r0, #0x8000
	bl sub_020177AC
	ldr r1, _02017588 ; =_020AF760
	ldr r5, [r1, #4]
	add r0, r5, #0xb000
	ldr r3, [r0, #0x20]
	cmp r3, #0x13
	bhi _020173BC
	subs r2, r3, #0x10
	addpl pc, pc, r2, lsl #2
	b _020173B0
_020173A0: ; jump table
	b _020173D0 ; case 0
	b _020173FC ; case 1
	b _02017438 ; case 2
	b _02017464 ; case 3
_020173B0:
	cmp r3, #0
	beq _020173C8
	b _020174A8
_020173BC:
	cmp r3, #0xff
	beq _020174A0
	b _020174A8
_020173C8:
	mov r0, #0
	b _02017580
_020173D0:
	mov r2, #1
	strb r2, [r0, #0xb8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	strb r2, [r0, #0xe8]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x20]
	add r1, r1, #1
	str r1, [r0, #0x20]
	b _020174A8
_020173FC:
	ldr r1, [r0, #0xd4]
	cmp r1, #0
	ldrne r0, [r0, #0xa4]
	cmpne r0, #0
	bne _020174A8
	add r0, r5, #0xb000
	ldr r2, [r0, #0x20]
	ldr r1, _02017588 ; =_020AF760
	add r2, r2, #1
	str r2, [r0, #0x20]
	ldr r0, [r1, #4]
	mov r1, #0x14
	add r0, r0, #0xb000
	str r1, [r0, #0x150]
	b _020174A8
_02017438:
	ldr r2, [r0, #0x150]
	sub r2, r2, #1
	str r2, [r0, #0x150]
	ldr r0, [r1, #4]
	add r0, r0, #0xb000
	ldr r1, [r0, #0x150]
	cmp r1, #0
	ldreq r1, [r0, #0x20]
	addeq r1, r1, #1
	streq r1, [r0, #0x20]
	b _020174A8
_02017464:
	add r0, r4, #0x98
	bl sub_0201CF5C
	add r0, r4, #0x98
	bl sub_0201D1B0
	cmp r0, #0
	bne _020174A8
	ldr r0, _02017588 ; =_020AF760
	mov r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xb000
	ldr r2, [r0, #0x20]
	add r2, r2, #1
	str r2, [r0, #0x20]
	strb r1, [r4, #0x478]
	b _020174A8
_020174A0:
	mov r0, #2
	b _02017580
_020174A8:
	ldrb r0, [r4, #0x478]
	cmp r0, #0
	beq _020174D4
	mov r7, #0
	add r6, r4, #0x114
	mov r5, #0x7c
_020174C0:
	mla r0, r7, r5, r6
	bl sub_0201CF5C
	add r7, r7, #1
	cmp r7, #7
	blt _020174C0
_020174D4:
	mov r8, #0
	add r0, r4, #0x7c
	add r7, r0, #0x400
	mov fp, r8
	mov r6, #1
	mov r5, #0x7c
_020174EC:
	add r1, r4, r8, lsl #2
	ldr r0, [r1, #0xa4c]
	cmp r0, #0
	bne _02017560
	mla sb, r8, r5, r7
	mov r0, sb
	bl sub_0201D1B0
	cmp r0, #0
	bne _02017554
	ldrsh sl, [sb, #0x78]
	cmp sl, #0
	beq _02017554
	and r0, sl, #1
	cmp r0, #1
	mov r0, sb
	addeq sl, sl, #1
	bl sub_0201C108
	str fp, [sp]
	str fp, [sp, #4]
	str r6, [sp, #8]
	mov r0, sb
	mov r1, sl
	mov r2, fp
	mov r3, fp
	str fp, [sp, #0xc]
	bl SetAnimationForAnimationControl
_02017554:
	mov r0, sb
	bl sub_0201CF5C
	b _02017568
_02017560:
	sub r0, r0, #1
	str r0, [r1, #0xa4c]
_02017568:
	add r8, r8, #1
	cmp r8, #0xc
	blt _020174EC
	mov r0, #1
	b _02017580
_0201757C:
	mov r0, #0
_02017580:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02017588: .word _020AF760
	arm_func_end sub_02017A00

	arm_func_start sub_0201758C
sub_0201758C: ; 0x0201758C
	stmdb sp!, {r3, lr}
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020175E4
	ldr r0, _020175F4 ; =WAN_TABLE
	ldrsh r1, [r1, #0x94]
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r1, _020175F4 ; =WAN_TABLE
	ldr r2, [r0, #8]
	ldr r0, [r1]
	ldrsh r1, [r2, #0x96]
	bl DeleteWanTableEntryVeneer
	ldr r0, _020175F0 ; =_020AF760
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020175F0 ; =_020AF760
	mov r1, #0
	str r1, [r0, #8]
	bl ov10_022BDADC
_020175E4:
	bl sub_0206BA5C
	bl sub_02016BB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020175F0: .word _020AF760
_020175F4: .word WAN_TABLE
	arm_func_end sub_0201758C

	arm_func_start sub_020175F8
sub_020175F8: ; 0x020175F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x80
#ifdef JAPAN
	mov r8, r0
	cmp r2, #0
	movne r7, #0x3a
	mov sb, r1
	mvn r0, #0
	moveq r7, #0x38
	cmp sb, r0
	beq _02017708
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r6, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r5, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r6, #0
	and r2, r1, #0xff
	addne r0, r6, #0x4f
	movne r1, #0x82
	strneb r1, [r4]
	strneb r0, [r4, #1]
	addne r4, r4, #2
	cmp r5, #0
	beq _020176B4
	mov r0, #0x82
	strb r0, [r4]
	add r0, r5, #0x4f
	strb r0, [r4, #1]
	add r4, r4, #2
	b _020176CC_JP
_020176B4:
	cmp r6, #0
	movne r0, #0x82
	strneb r0, [r4]
	addne r0, r5, #0x4f
	strneb r0, [r4, #1]
	addne r4, r4, #2
_020176CC_JP:
	mov r0, #0x82
	strb r0, [r4]
	add r2, r2, #0x4f
	strb r2, [r4, #1]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r7
	strb r2, [r4, #2]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
	bl SprintfStatic__020176E4
	b _020176CC
_02017708:
	add r0, sp, #0
	mov r1, #0x39
	bl GetStringFromFileVeneer
	add r0, sp, #0x40
	mov r1, r7
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r8
#else
	cmp r2, #0
	ldrne r5, _020176D4 ; =0x00000171
	mov r6, r0
	mov sb, r1
	mvn r0, #0
	ldreq r5, _020176D8 ; =0x0000016F
	cmp sb, r0
	beq _020176B0
	mov r0, sb
	mov r1, #0x64
	add r4, sp, #0
	bl _u32_div_f
	and r8, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	and r7, r0, #0xff
	mov r0, sb
	mov r1, #0xa
	bl _u32_div_f
	cmp r8, #0
	addne r0, r8, #0x30
	strneb r0, [r4], #1
	cmp r7, #0
	addne r0, r7, #0x30
	and r1, r1, #0xff
	strneb r0, [r4], #1
	bne _0201767C
	cmp r8, #0
	addne r0, r7, #0x30
	strneb r0, [r4], #1
_0201767C:
	add r2, r1, #0x30
	strb r2, [r4]
	mov r2, #0
	add r0, sp, #0x40
	mov r1, r5
	strb r2, [r4, #1]
	bl GetStringFromFileVeneer
	ldr r1, _020176DC ; =_02099138
	add r2, sp, #0x40
	add r3, sp, #0
	mov r0, r6
	bl SprintfStatic__020176E4
	b _020176CC
_020176B0:
	add r0, sp, #0x40
	mov r1, #0x170
	bl GetStringFromFileVeneer
	ldr r1, _020176E0 ; =_02099140
	add r2, sp, #0x40
	mov r0, r6
#endif
	bl SprintfStatic__020176E4
_020176CC:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
#ifdef JAPAN
_020176DC: .word _02099138
#else
_020176D4: .word 0x00000171
_020176D8: .word 0x0000016F
_020176DC: .word _02099138
_020176E0: .word _02099140
#endif
	arm_func_end sub_020175F8

	arm_func_start SprintfStatic__020176E4
SprintfStatic__020176E4: ; 0x020176E4
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
	arm_func_end SprintfStatic__020176E4

	arm_func_start sub_0201770C
sub_0201770C: ; 0x0201770C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r1, #0x6000
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl MemZero
	ldr r2, [sp, #0x18]
	mov r1, #0
	mov r0, r7
	str r2, [sp]
	mov r2, r1
	mov r3, r4
	bl sub_0201578C
	add r0, r7, #0x6000
	mov r1, r7
	mov r2, #0x20
	bl sub_02015FDC
	add r0, r7, #0x6000
	mov r1, #0
	mov r2, #0x1000
	bl sub_02016038
	mov r0, r7
	mov r1, #0x6000
	bl MemZero
	str r5, [sp]
	mov r3, r6
	mov r0, r7
	mov r1, #0
	mov r2, r1
	bl sub_0201578C
	add r0, r7, #0x7000
	mov r1, r7
	mov r2, #0x80
	bl sub_02015FDC
	add r0, r7, #0x7000
	mov r1, #0x1000
	mov r2, #0x4000
	bl sub_02016038
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201770C

	arm_func_start sub_020177AC
sub_020177AC: ; 0x020177AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldrsh r0, [r6]
	mov r5, r1
	mov r7, r2
	bl sub_0201F324
	ldrb r1, [r6, #0x28]
	mov r4, r0
	cmp r1, #1
	beq _020177E8
	cmp r1, #2
	beq _02017848
	cmp r1, #3
	beq _02017858
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020177E8:
	cmp r7, #0
	mov r3, #0x80
	beq _02017820
	mov r0, #0
	str r0, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017820:
	str r3, [sp]
	ldr r1, [r6, #4]
	ldr r2, [r6, #0xc]
	add r0, r6, #0x14
	bl ov10_022C2528
	cmp r0, #0
	ldrneb r0, [r6, #0x28]
	addne r0, r0, #1
	strneb r0, [r6, #0x28]
	b _02017868
_02017848:
	cmp r5, #0
	addeq r0, r1, #1
	streqb r0, [r6, #0x28]
	b _02017868
_02017858:
	mov r0, #0xff
	strb r0, [r6, #0x28]
	mov r0, #0
	str r0, [r6, #0x14]
_02017868:
	ldr r2, [r6, #4]
	ldr r0, [r6, #0x14]
	mov r1, r5
	add r2, r2, r0
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	str r2, [r6, #4]
	mov r0, r0, asr #8
	strh r0, [r4]
	ldr r2, [r6, #0x24]
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	mov r0, r0, asr #8
	bl MultiplyByFixedPoint
	strb r0, [r4, #0x2f]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020177AC

	arm_func_start sub_020178A8
sub_020178A8: ; 0x020178A8
	stmdb sp!, {r4, r5, r6, r7, lr}
#ifdef EUROPE
	sub sp, sp, #0x254
	mov r4, r1
	and r1, r4, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r5, r0
	cmp r5, r7
	and r6, r4, #0xff
	beq _020179BC
	bl GetNbFloors
	cmp r0, #1
	moveq r6, #0
_020179BC:
	mov r1, r7
	and r2, r4, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r4, r0
	add r0, sp, #4
	bl InitPreprocessorArgs
	mov r0, r5
	bl DungeonGoesUp
	cmp r0, #0
	movne r2, r6
	rsbeq r2, r6, #0
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #0x54
	str r2, [sp, #0x28]
	bl SprintfStatic__02017A40
	add r5, sp, #4
	add r0, sp, #0x154
	add r2, sp, #0x54
	mov r1, #0x100
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	bl sub_02015570
	cmp r6, #0
	mov r0, r4
	beq _02017A70
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r5, r0, #0xc0
	mov r0, r5, asr #1
	mov r1, r4
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r5, asr #1
	add r1, r0, #0x20
	add r2, sp, #0x154
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _02017A8C
_02017A70:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r4
	mov r0, r0, asr #1
	bl sub_02015E44
_02017A8C:
	bl sub_02015E6C
	add sp, sp, #0x254
#else
	sub sp, sp, #0x104
	mov r5, r1
	and r1, r5, #0xff
	mov r7, r0
	bl sub_0204F77C
	mov r6, r0
	cmp r6, r7
	and r4, r5, #0xff
	beq _020178DC
	bl GetNbFloors
	cmp r0, #1
	moveq r4, #0
_020178DC:
	mov r1, r7
	and r2, r5, #0xff
	mov r0, #2
	bl sub_0204F6F8
	mov r5, r0
	mov r0, r6
	bl DungeonGoesUp
	cmp r0, #0
	ldrne r0, _020179FC ; =_020AF76C
	ldrne r7, [r0]
	ldreq r0, _020179FC ; =_020AF76C
	ldreq r7, [r0, #4]
	cmp r4, #0xa
	blo _02017954
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	mov r6, r0
	mov r0, r4
	mov r1, #0xa
	bl _s32_div_f
	add r1, r1, #0x30
	ldr r0, _020179FC ; =_020AF76C
	str r1, [sp]
	ldr r1, [r0, #8]
	add r0, sp, #4
	mov r2, r7
	add r3, r6, #0x30
	bl SprintfStatic__02017A40
	b _0201797C
_02017954:
	cmp r4, #0
	moveq r0, #0
	streqb r0, [sp, #4]
	beq _0201797C
	ldr r1, _020179FC ; =_020AF76C
	add r0, sp, #4
	ldr r1, [r1, #0xc]
	mov r2, r7
	add r3, r4, #0x30
	bl SprintfStatic__02017A40
_0201797C:
	bl sub_02015570
	cmp r4, #0
	mov r0, r5
	beq _020179D4
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	add r0, r1, #0x38
	rsb r4, r0, #0xc0
	mov r0, r4, asr #1
	mov r1, r5
	bl sub_02015E44
	sub r1, r0, #1
	mov r0, #0x18
	mul r0, r1, r0
	add r0, r0, r4, asr #1
	add r1, r0, #0x20
	add r2, sp, #4
	mov r0, #0
	mov r3, #2
	bl sub_02015D18
	b _020179F0
_020179D4:
	bl sub_020155FC
	mov r1, #0x18
	mul r1, r0, r1
	rsb r0, r1, #0xc0
	mov r1, r5
	mov r0, r0, asr #1
	bl sub_02015E44
_020179F0:
	bl sub_02015E6C
	add sp, sp, #0x104
#endif
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_020179FC: .word _0209958C
#else
_020179FC: .word _020AF76C
#endif
	arm_func_end sub_020178A8

	arm_func_start sub_02017A00
sub_02017A00: ; 0x02017A00
	stmdb sp!, {r3, lr}
	bl sub_02015570
	ldr r1, _02017A1C ; =0x000044BD
	mov r0, #0x3e
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A1C: .word 0x000044BF
#elif defined(JAPAN)
_02017A1C: .word 0x0000076D
#else
_02017A1C: .word 0x000044BD
#endif
	arm_func_end sub_02017A00

	arm_func_start sub_02017A20
sub_02017A20: ; 0x02017A20
	stmdb sp!, {r3, lr}
	bl sub_02015570
#ifdef JAPAN
	mov r0, #0x3e
	add r1, r0, #0x730
#else
	ldr r1, _02017A3C ; =0x000044BE
	mov r0, #0x3e
#endif
	bl sub_02015E44
	bl sub_02015E6C
	ldmia sp!, {r3, pc}
	.align 2, 0
#if defined(EUROPE)
_02017A3C: .word 0x000044C0
#elif !defined(JAPAN)
_02017A3C: .word 0x000044BE
#endif
	arm_func_end sub_02017A20

	arm_func_start SprintfStatic__02017A40
SprintfStatic__02017A40: ; 0x02017A40
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
	arm_func_end SprintfStatic__02017A40

	arm_func_start sub_02017A68
sub_02017A68: ; 0x02017A68
	ldr r0, _02017A7C ; =_022A4BE8
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	bx lr
	.align 2, 0
_02017A7C: .word _022A4BE8
	arm_func_end sub_02017A68

	arm_func_start sub_02017A80
sub_02017A80: ; 0x02017A80
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0, #2]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0, #2]
	ldr r0, _02017AAC ; =_022A4BE8
	ldrsh r1, [r0]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r0]
	bx lr
	.align 2, 0
_02017AAC: .word _022A4BE8
	arm_func_end sub_02017A80

	arm_func_start sub_02017AB0
sub_02017AB0: ; 0x02017AB0
	stmdb sp!, {r3, lr}
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldmia sp!, {r3, pc}
	arm_func_end sub_02017AB0

	arm_func_start sub_02017ACC
sub_02017ACC: ; 0x02017ACC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017F28
	mov r0, r4
	bl sub_02018158
	ldr r0, _02017AFC ; =0x000003E6
	mov r1, r4
	bl sub_02018460
	mov r1, r4
	mov r0, #0x3f00
	bl sub_02018460
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017AFC: .word 0x000003E6
	arm_func_end sub_02017ACC

	arm_func_start sub_02017B00
sub_02017B00: ; 0x02017B00
	ldr ip, _02017B08 ; =sub_02017D80
	bx ip
	.align 2, 0
_02017B08: .word sub_02017D80
	arm_func_end sub_02017B00

	arm_func_start sub_02017B0C
sub_02017B0C: ; 0x02017B0C
	ldr ip, _02017B14 ; =sub_02017DE8
	bx ip
	.align 2, 0
_02017B14: .word sub_02017DE8
	arm_func_end sub_02017B0C

	arm_func_start sub_02017B18
sub_02017B18: ; 0x02017B18
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017D80
	ldr r1, _02017B54 ; =0x000003E7
	cmp r4, r1
	bne _02017B40
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017B4C
_02017B40:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017B4C:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017B54: .word 0x000003E7
	arm_func_end sub_02017B18

	arm_func_start PlayBgmByIdVeneer
PlayBgmByIdVeneer: ; 0x02017B58
	ldr ip, _02017B60 ; =PlayBgmById
	bx ip
	.align 2, 0
_02017B60: .word PlayBgmById
	arm_func_end PlayBgmByIdVeneer

	arm_func_start PlayBgmByIdVolumeVeneer
PlayBgmByIdVolumeVeneer: ; 0x02017B64
	ldr ip, _02017B6C ; =PlayBgmByIdVolume
	bx ip
	.align 2, 0
_02017B6C: .word PlayBgmByIdVolume
	arm_func_end PlayBgmByIdVolumeVeneer

	arm_func_start sub_02017B70
sub_02017B70: ; 0x02017B70
	ldr ip, _02017B78 ; =StopBgmCommand
	bx ip
	.align 2, 0
_02017B78: .word StopBgmCommand
	arm_func_end sub_02017B70

	arm_func_start sub_02017B7C
sub_02017B7C: ; 0x02017B7C
	ldr ip, _02017B84 ; =sub_02017F28
	bx ip
	.align 2, 0
_02017B84: .word sub_02017F28
	arm_func_end sub_02017B7C

	arm_func_start sub_02017B88
sub_02017B88: ; 0x02017B88
	ldr ip, _02017B90 ; =sub_02017F64
	bx ip
	.align 2, 0
_02017B90: .word sub_02017F64
	arm_func_end sub_02017B88

	arm_func_start sub_02017B94
sub_02017B94: ; 0x02017B94
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02017FBC
	ldr r1, _02017BD0 ; =0x000003E7
	cmp r4, r1
	bne _02017BBC
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017BC8
_02017BBC:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017BC8:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017BD0: .word 0x000003E7
	arm_func_end sub_02017B94

	arm_func_start sub_02017BD4
sub_02017BD4: ; 0x02017BD4
	ldr ip, _02017BDC ; =sub_02018024
	bx ip
	.align 2, 0
_02017BDC: .word sub_02018024
	arm_func_end sub_02017BD4

	arm_func_start sub_02017BE0
sub_02017BE0: ; 0x02017BE0
	ldr ip, _02017BE8 ; =sub_020180A0
	bx ip
	.align 2, 0
_02017BE8: .word sub_020180A0
	arm_func_end sub_02017BE0

	arm_func_start sub_02017BEC
sub_02017BEC: ; 0x02017BEC
	ldr ip, _02017BF4 ; =sub_02018118
	bx ip
	.align 2, 0
_02017BF4: .word sub_02018118
	arm_func_end sub_02017BEC

	arm_func_start sub_02017BF8
sub_02017BF8: ; 0x02017BF8
	ldr ip, _02017C00 ; =sub_02018158
	bx ip
	.align 2, 0
_02017C00: .word sub_02018158
	arm_func_end sub_02017BF8

	arm_func_start sub_02017C04
sub_02017C04: ; 0x02017C04
	ldr ip, _02017C0C ; =sub_02018194
	bx ip
	.align 2, 0
_02017C0C: .word sub_02018194
	arm_func_end sub_02017C04

	arm_func_start sub_02017C10
sub_02017C10: ; 0x02017C10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020181E0
	ldr r1, _02017C4C ; =0x000003E6
	cmp r4, r1
	bne _02017C38
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	b _02017C44
_02017C38:
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
_02017C44:
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017C4C: .word 0x000003E6
	arm_func_end sub_02017C10

	arm_func_start sub_02017C50
sub_02017C50: ; 0x02017C50
	ldr ip, _02017C58 ; =sub_0201820C
	bx ip
	.align 2, 0
_02017C58: .word sub_0201820C
	arm_func_end sub_02017C50

	arm_func_start sub_02017C5C
sub_02017C5C: ; 0x02017C5C
	ldr ip, _02017C64 ; =sub_02018278
	bx ip
	.align 2, 0
_02017C64: .word sub_02018278
	arm_func_end sub_02017C5C

	arm_func_start sub_02017C68
sub_02017C68: ; 0x02017C68
	ldr ip, _02017C70 ; =sub_020182AC
	bx ip
	.align 2, 0
_02017C70: .word sub_020182AC
	arm_func_end sub_02017C68

	arm_func_start sub_02017C74
sub_02017C74: ; 0x02017C74
	ldr ip, _02017C7C ; =PlaySeByIdVolume
	bx ip
	.align 2, 0
_02017C7C: .word PlaySeByIdVolume
	arm_func_end sub_02017C74

	arm_func_start sub_02017C80
sub_02017C80: ; 0x02017C80
	ldr ip, _02017C8C ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017C8C: .word PlaySeByIdVolume
	arm_func_end sub_02017C80

	arm_func_start sub_02017C90
sub_02017C90: ; 0x02017C90
	ldr ip, _02017C98 ; =sub_0201831C
	bx ip
	.align 2, 0
_02017C98: .word sub_0201831C
	arm_func_end sub_02017C90

	arm_func_start sub_02017C9C
sub_02017C9C: ; 0x02017C9C
	ldr ip, _02017CA4 ; =sub_020183A0
	bx ip
	.align 2, 0
_02017CA4: .word sub_020183A0
	arm_func_end sub_02017C9C

	arm_func_start sub_02017CA8
sub_02017CA8: ; 0x02017CA8
	ldr ip, _02017CB0 ; =sub_020183E4
	bx ip
	.align 2, 0
_02017CB0: .word sub_020183E4
	arm_func_end sub_02017CA8

	arm_func_start sub_02017CB4
sub_02017CB4: ; 0x02017CB4
	ldr ip, _02017CBC ; =sub_02018428
	bx ip
	.align 2, 0
_02017CBC: .word sub_02018428
	arm_func_end sub_02017CB4

	arm_func_start sub_02017CC0
sub_02017CC0: ; 0x02017CC0
	ldr ip, _02017CC8 ; =sub_02018460
	bx ip
	.align 2, 0
_02017CC8: .word sub_02018460
	arm_func_end sub_02017CC0

	arm_func_start PlaySeVolumeWrapper
PlaySeVolumeWrapper: ; 0x02017CCC
	ldr r1, _02017CE4 ; =_0209915C
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	ldr ip, _02017CE8 ; =PlaySeByIdVolume
	mov r1, #0x100
	bx ip
	.align 2, 0
_02017CE4: .word _0209915C
_02017CE8: .word PlaySeByIdVolume
	arm_func_end PlaySeVolumeWrapper

	arm_func_start sub_02017CEC
sub_02017CEC: ; 0x02017CEC
	stmdb sp!, {r3, lr}
	ldr r2, _02017D18 ; =_022A4BE8
	ldrsh r0, [r2]
	cmp r0, #0
	ldmgtia sp!, {r3, pc}
	ldr r0, _02017D1C ; =0x00003F05
	mov r3, #3
	mov r1, #0x100
	strh r3, [r2]
	bl PlaySeByIdVolume
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D18: .word _022A4BE8
_02017D1C: .word 0x00003F05
	arm_func_end sub_02017CEC

	arm_func_start sub_02017D20
sub_02017D20: ; 0x02017D20
	stmdb sp!, {r3, lr}
	bl sub_020184CC
	bl sub_02018B50
	ldr r2, _02017D74 ; =0x000003E7
	ldr r0, _02017D78 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	sub r1, r2, #1
	strh r1, [r0, #0xc]
	mov r1, #0x3f00
	strh r1, [r0, #0x10]
	bl sub_02018C0C
	ldr r0, _02017D7C ; =_020AF77C
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017D74: .word 0x000003E7
_02017D78: .word _022A4BEC
_02017D7C: .word _020AF77C
	arm_func_end sub_02017D20

	arm_func_start sub_02017D80
sub_02017D80: ; 0x02017D80
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DAC ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DB0 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DB0 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DAC: .word 0x000003E7
_02017DB0: .word _022A4BEC
	arm_func_end sub_02017D80

	arm_func_start sub_02017DB4
sub_02017DB4: ; 0x02017DB4
	stmdb sp!, {r3, lr}
	bl sub_02019824
	ldr r2, _02017DE0 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017DE4 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1]
	ldrne r0, _02017DE4 ; =_022A4BEC
	streqh r2, [r1, #2]
	ldrneh r0, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017DE0: .word 0x000003E7
_02017DE4: .word _022A4BEC
	arm_func_end sub_02017DB4

	arm_func_start sub_02017DE8
sub_02017DE8: ; 0x02017DE8
	ldr ip, _02017DF0 ; =IsSongOver
	bx ip
	.align 2, 0
_02017DF0: .word IsSongOver
	arm_func_end sub_02017DE8

	arm_func_start PlayBgmById
PlayBgmById: ; 0x02017DF4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02017E68 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _02017E6C ; =_022A4BEC
	ldrneh r0, [r0, #2]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017E6C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1]
	strh r5, [r1, #2]
	mov r0, #3
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017E68: .word 0x000003E7
_02017E6C: .word _022A4BEC
	arm_func_end PlayBgmById

	arm_func_start PlayBgmByIdVolume
PlayBgmByIdVolume: ; 0x02017E70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02017EE0 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02017EE4 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #2]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02017EE4 ; =_022A4BEC
	mov r0, #3
	strh r6, [r1]
	strh r6, [r1, #2]
	strh r4, [r1, #4]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02017EE0: .word 0x000003E7
_02017EE4: .word _022A4BEC
	arm_func_end PlayBgmByIdVolume

	arm_func_start StopBgmCommand
StopBgmCommand: ; 0x02017EE8
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02017F20 ; =0x000003E7
	ldr r1, _02017F24 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	mov r0, #5
	strh r2, [r1, #4]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017F20: .word 0x000003E7
_02017F24: .word _022A4BEC
	arm_func_end StopBgmCommand

	arm_func_start sub_02017F28
sub_02017F28: ; 0x02017F28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _02017F5C ; =0x000003E7
	ldr r0, _02017F60 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	mov r0, #5
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_02017F5C: .word 0x000003E7
_02017F60: .word _022A4BEC
	arm_func_end sub_02017F28

	arm_func_start sub_02017F64
sub_02017F64: ; 0x02017F64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02017FA8 ; =_022A4BEC
	ldr r2, _02017FAC ; =0x000003E7
	ldrh r3, [r3, #2]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02017FA8 ; =_022A4BEC
	mov r0, #6
	strh r4, [r1, #4]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02017FA8: .word _022A4BEC
_02017FAC: .word 0x000003E7
	arm_func_end sub_02017F64

	arm_func_start sub_02017FB0
sub_02017FB0: ; 0x02017FB0
	ldr ip, _02017FB8 ; =sub_02019D04
	bx ip
	.align 2, 0
_02017FB8: .word sub_02019D04
	arm_func_end sub_02017FB0

	arm_func_start sub_02017FBC
sub_02017FBC: ; 0x02017FBC
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _02017FE8 ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02017FEC ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02017FEC ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02017FE8: .word 0x000003E7
_02017FEC: .word _022A4BEC
	arm_func_end sub_02017FBC

	arm_func_start sub_02017FF0
sub_02017FF0: ; 0x02017FF0
	stmdb sp!, {r3, lr}
	bl sub_02019D58
	ldr r2, _0201801C ; =0x000003E7
	cmp r0, r2
	ldreq r1, _02018020 ; =_022A4BEC
	moveq r0, r2
	streqh r2, [r1, #6]
	ldrne r0, _02018020 ; =_022A4BEC
	streqh r2, [r1, #8]
	ldrneh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201801C: .word 0x000003E7
_02018020: .word _022A4BEC
	arm_func_end sub_02017FF0

	arm_func_start sub_02018024
sub_02018024: ; 0x02018024
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018098 ; =0x000003E7
	mov r5, r0
	cmp r5, r1
	ldrne r0, _0201809C ; =_022A4BEC
	ldrneh r0, [r0, #8]
	cmpne r5, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _0201809C ; =_022A4BEC
	mov r2, #0x100
	strh r5, [r1, #6]
	strh r5, [r1, #8]
	mov r0, #7
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018098: .word 0x000003E7
_0201809C: .word _022A4BEC
	arm_func_end sub_02018024

	arm_func_start sub_020180A0
sub_020180A0: ; 0x020180A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02018110 ; =0x000003E7
	mov r6, r0
	cmp r6, r3
	ldrne r0, _02018114 ; =_022A4BEC
	mov r5, r1
	ldrneh r0, [r0, #8]
	mov r4, r2
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_02018B50
	ldr r1, _02018114 ; =_022A4BEC
	mov r0, #7
	strh r6, [r1, #6]
	strh r6, [r1, #8]
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	mov r7, r0
	mov r0, #3
	strh r6, [r7, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r4, #0
	strh r4, [r7, #6]
	mov r0, r7
	strh r5, [r7, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02018110: .word 0x000003E7
_02018114: .word _022A4BEC
	arm_func_end sub_020180A0

	arm_func_start sub_02018118
sub_02018118: ; 0x02018118
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r0, _02018150 ; =0x000003E7
	ldr r1, _02018154 ; =_022A4BEC
	mov r2, #0
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	mov r0, #9
	strh r2, [r1, #0xa]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018150: .word 0x000003E7
_02018154: .word _022A4BEC
	arm_func_end sub_02018118

	arm_func_start sub_02018158
sub_02018158: ; 0x02018158
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02018B50
	ldr r2, _0201818C ; =0x000003E7
	ldr r0, _02018190 ; =_022A4BEC
	mov r1, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #9
	bl AllocAudioCommand
	strh r4, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201818C: .word 0x000003E7
_02018190: .word _022A4BEC
	arm_func_end sub_02018158

	arm_func_start sub_02018194
sub_02018194: ; 0x02018194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020181D8 ; =_022A4BEC
	ldr r2, _020181DC ; =0x000003E7
	ldrh r3, [r3, #8]
	mov r5, r0
	mov r4, r1
	cmp r3, r2
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _020181D8 ; =_022A4BEC
	mov r0, #0xa
	strh r4, [r1, #0xa]
	bl AllocAudioCommand
	strh r4, [r0, #6]
	strh r5, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020181D8: .word _022A4BEC
_020181DC: .word 0x000003E7
	arm_func_end sub_02018194

	arm_func_start sub_020181E0
sub_020181E0: ; 0x020181E0
	stmdb sp!, {r3, lr}
	bl sub_0201A19C
	ldr r1, _02018204 ; =0x000003E6
	cmp r0, r1
	ldreq r0, _02018208 ; =_022A4BEC
	streqh r1, [r0, #0xc]
	ldrne r0, _02018208 ; =_022A4BEC
	ldrh r0, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02018204: .word 0x000003E6
_02018208: .word _022A4BEC
	arm_func_end sub_020181E0

	arm_func_start sub_0201820C
sub_0201820C: ; 0x0201820C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02018270 ; =0x000003E6
	mov r5, r0
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0xd
	ldmhiia sp!, {r3, r4, r5, pc}
	bl sub_02018B50
	ldr r1, _02018274 ; =_022A4BEC
	mov r0, #0xb
	strh r5, [r1, #0xc]
	bl AllocAudioCommand
	mov r4, r0
	mov r0, #3
	strh r5, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r1, #0
	moveq r1, #0x100
	strh r1, [r4, #6]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018270: .word 0x000003E6
_02018274: .word _022A4BEC
	arm_func_end sub_0201820C

	arm_func_start sub_02018278
sub_02018278: ; 0x02018278
	stmdb sp!, {r3, lr}
	bl sub_02018B50
	ldr r2, _020182A4 ; =0x000003E6
	ldr r1, _020182A8 ; =_022A4BEC
	mov r0, #0xc
	strh r2, [r1, #0xc]
	bl AllocAudioCommand
	mov r1, #0
	strh r1, [r0, #8]
	bl SendAudioCommand
	ldmia sp!, {r3, pc}
	.align 2, 0
_020182A4: .word 0x000003E6
_020182A8: .word _022A4BEC
	arm_func_end sub_02018278

	arm_func_start sub_020182AC
sub_020182AC: ; 0x020182AC
	ldr ip, _020182B4 ; =sub_0201A480
	bx ip
	.align 2, 0
_020182B4: .word sub_0201A480
	arm_func_end sub_020182AC

	arm_func_start PlaySeByIdVolume
PlaySeByIdVolume: ; 0x020182B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	ldr r1, _02018318 ; =_0209916C
	mov r2, r6
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r6, #0x3f00
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0xd
	cmp r5, #0x100
	movhi r5, #0x100
	bl sub_02018A78
	mov r4, r0
	mov r0, #4
	strh r6, [r4, #4]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r5, #0
	mov r0, r4
	strh r5, [r4, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018318: .word _0209916C
	arm_func_end PlaySeByIdVolume

	arm_func_start sub_0201831C
sub_0201831C: ; 0x0201831C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r6, r2
	mov r7, r1
	mov r5, r3
	str r6, [sp]
	ldr r1, _0201839C ; =_0209918C
	mov r2, r8
	mov r3, r7
	mov r0, #8
	str r5, [sp, #4]
	bl Debug_Print
	cmp r8, #0x3f00
	beq _02018394
	mov r0, #0xe
	cmp r6, #0x100
	movhi r6, #0x100
	bl sub_02018A78
	mov r4, r0
	strh r8, [r4, #4]
	mov r0, #4
	strh r7, [r4, #6]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r6, #0
	strh r6, [r4, #8]
	mov r0, r4
	strh r5, [r4, #0xa]
	bl SendAudioCommand2
_02018394:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201839C: .word _0209918C
	arm_func_end sub_0201831C

	arm_func_start sub_020183A0
sub_020183A0: ; 0x020183A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _020183E0 ; =_020991C8
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x10
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020183E0: .word _020991C8
	arm_func_end sub_020183A0

	arm_func_start sub_020183E4
sub_020183E4: ; 0x020183E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	mov r5, r1
	ldr r1, _02018424 ; =_020991F0
	mov r2, r6
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0x11
	bl sub_02018A78
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xa]
	bl SendAudioCommand2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02018424: .word _020991F0
	arm_func_end sub_020183E4

	arm_func_start sub_02018428
sub_02018428: ; 0x02018428
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _0201845C ; =_02099210
	mov r2, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r4, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201845C: .word _02099210
	arm_func_end sub_02018428

	arm_func_start sub_02018460
sub_02018460: ; 0x02018460
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _02018498 ; =_02099224
	mov r2, r5
	mov r3, r4
	mov r0, #8
	bl Debug_Print
	mov r0, #0xf
	bl sub_02018A78
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl SendAudioCommand2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018498: .word _02099224
	arm_func_end sub_02018460

	arm_func_start sub_0201849C
sub_0201849C: ; 0x0201849C
	ldr ip, _020184A4 ; =sub_0201906C
	bx ip
	.align 2, 0
_020184A4: .word sub_0201906C
	arm_func_end sub_0201849C

	arm_func_start sub_020184A8
sub_020184A8: ; 0x020184A8
	ldr ip, _020184B0 ; =sub_02019260
	bx ip
	.align 2, 0
_020184B0: .word sub_02019260
	arm_func_end sub_020184A8

	arm_func_start sub_020184B4
sub_020184B4: ; 0x020184B4
	ldr ip, _020184BC ; =sub_0201929C
	bx ip
	.align 2, 0
_020184BC: .word sub_0201929C
	arm_func_end sub_020184B4

	arm_func_start sub_020184C0
sub_020184C0: ; 0x020184C0
	ldr ip, _020184C8 ; =sub_020192D0
	bx ip
	.align 2, 0
_020184C8: .word sub_020192D0
	arm_func_end sub_020184C0

	arm_func_start sub_020184CC
sub_020184CC: ; 0x020184CC
	stmdb sp!, {r3, lr}
	bl InitSoundSystem
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002C40
	ldr r0, _020185D0 ; =_022A4C00
	mov r1, #0x11
	bl sub_02002F34
	ldr r0, _020185D4 ; =_022A4C28
	mov r1, #0x11
	bl sub_02002F34
	mov r1, #0x10
	ldr r0, _020185D8 ; =_020AF7E4
	mov r2, r1
	bl sub_02002A9C
	mov r2, #0
	ldr r1, _020185DC ; =_022A4C50
	mov r0, r2
_02018510:
	add r2, r2, #1
	cmp r2, #0x10
	str r0, [r1], #0x20
	blt _02018510
	ldr r0, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	ldr r0, [r0, #0x34]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #0x30]
	ldr r0, [r2, #0xc]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E4 ; =0x00000701
	str r0, [r2, #8]
	ldr r0, [r2, #0x20]
	bl MemAlloc
	ldr r2, _020185E0 ; =_020AF780
	ldr r1, _020185E8 ; =_020AF7AC
	str r0, [r2, #0x1c]
	ldr r0, _020185EC ; =_020AF96C
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F0 ; =_020AFA48
	ldr r1, _020185F4 ; =_020AF784
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185F8 ; =_020AF890
	ldr r1, _020185FC ; =_020AF798
	mov r2, #0
	bl sub_02002778
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	ldr r0, _020185EC ; =_020AF96C
	bl sub_020027E8
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002CB4
	ldr r0, _020185CC ; =_020AF7C0
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _020185CC ; =_020AF7C0
	bl sub_02002E98
	mov r1, #1
	ldr r0, _020185E0 ; =_020AF780
	strb r1, [r0, #1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020185CC: .word _020AF7C0
_020185D0: .word _022A4C00
_020185D4: .word _022A4C28
_020185D8: .word _020AF7E4
_020185DC: .word _022A4C50
_020185E0: .word _020AF780
_020185E4: .word 0x00000701
_020185E8: .word _020AF7AC
_020185EC: .word _020AF96C
_020185F0: .word _020AFA48
_020185F4: .word _020AF784
_020185F8: .word _020AF890
_020185FC: .word _020AF798
	arm_func_end sub_020184CC

	arm_func_start sub_02018600
sub_02018600: ; 0x02018600
	stmdb sp!, {r3, lr}
	bl ManipBgmPlayback
	ldr r0, _02018624 ; =_020AFA48
	bl sub_020027E8
	ldr r0, _02018628 ; =_020AF890
	bl sub_020027E8
_02018618:
	bl sub_02003AB0
	bl ManipBgmPlayback
	b _02018618
	.align 2, 0
_02018624: .word _020AFA48
_02018628: .word _020AF890
	arm_func_end sub_02018600

	arm_func_start sub_0201862C
sub_0201862C: ; 0x0201862C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, #1
	ldr sl, _020187F0 ; =_022A4C28
	ldr sb, _020187F4 ; =_022A4C00
	ldr r4, _020187F8 ; =_020AF780
	mov r6, #2
	mov r5, #0
	add r8, sp, #0
	mov r7, fp
_02018650:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl sub_02002F98
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #1
	ldreqb r0, [r4, #1]
	beq _02018650
	mov r0, r6
	bl Debug_GetDebugFlag
	cmp r0, #0
	bne _020187D0
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _020187D0
_02018698: ; jump table
	b _020187D0 ; case 0
	b _020187D0 ; case 1
	b _020186E0 ; case 2
	b _020186E0 ; case 3
	b _020186E0 ; case 4
	b _020186E0 ; case 5
	b _020186E0 ; case 6
	b _020186E0 ; case 7
	b _020186E0 ; case 8
	b _020186E0 ; case 9
	b _020186E0 ; case 10
	b _020186E0 ; case 11
	b _020186E0 ; case 12
	b _020186F0 ; case 13
	b _020186F0 ; case 14
	b _02018790 ; case 15
	b _020186F0 ; case 16
	b _020186F0 ; case 17
_020186E0:
	mov r0, sl
	mov r2, fp
	bl sub_02002F7C
	b _02018650
_020186F0:
	ldrh r0, [r1, #4]
	bl sub_0201AAA0
	cmp r0, #0
	bne _02018714
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_02018714:
	ldr r3, [sp]
	ldr r0, [r3]
	sub r0, r0, #0xd
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020187D0
_0201872C: ; jump table
	b _02018740 ; case 0
	b _02018750 ; case 1
	b _020187D0 ; case 2
	b _02018768 ; case 3
	b _0201877C ; case 4
_02018740:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	b _020187D0
_02018750:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	b _020187D0
_02018768:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _020187D0
_0201877C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
	b _020187D0
_02018790:
	ldrh r0, [r1, #4]
	cmp r0, #0x3f00
	beq _020187BC
	bl sub_0201AAA0
	cmp r0, #0
	beq _020187BC
	ldr r1, [sp]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl StopSe
	b _020187D0
_020187BC:
	ldr r1, [sp]
	mov r0, sl
	mov r2, #1
	bl sub_02002F7C
	b _02018650
_020187D0:
	ldr r0, _020187FC ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, [sp]
	ldr r0, _020187FC ; =_020AF7C0
	str r5, [r1]
	ldr r1, _02018800 ; =_020AF7E4
	bl sub_02002ECC
	b _02018650
	.align 2, 0
_020187F0: .word _022A4C28
_020187F4: .word _022A4C00
_020187F8: .word _020AF780
_020187FC: .word _020AF7C0
_02018800: .word _020AF7E4
	arm_func_end sub_0201862C

	arm_func_start sub_02018804
sub_02018804: ; 0x02018804
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
_0201880C:
	ldr r0, _02018A64 ; =_022A4C28
	add r1, sp, #0
	mov r2, #1
	bl sub_02002F98
	ldr r3, [sp]
	ldr r0, [r3]
	cmp r0, #0x11
	addls pc, pc, r0, lsl #2
	b _02018A40
_02018830: ; jump table
	b _02018A40 ; case 0
	b _02018A40 ; case 1
	b _02018878 ; case 2
	b _02018880 ; case 3
	b _020188B4 ; case 4
	b _02018900 ; case 5
	b _0201890C ; case 6
	b _0201891C ; case 7
	b _02018950 ; case 8
	b _0201899C ; case 9
	b _020189A8 ; case 10
	b _020189B8 ; case 11
	b _020189D0 ; case 12
	b _020189DC ; case 13
	b _020189F0 ; case 14
	b _02018A0C ; case 15
	b _02018A1C ; case 16
	b _02018A30 ; case 17
_02018878:
	bl SoundDriverReset
	b _02018A40
_02018880:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201888C
_02018888:
	bl sub_02003AB0
_0201888C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018888
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_020188B4:
	ldr r4, _02018A68 ; =0x000003E6
	b _020188C0
_020188BC:
	bl sub_02003AB0
_020188C0:
	bl sub_0201A19C
	cmp r0, r4
	bne _020188BC
	ldr r4, _02018A6C ; =0x000003E7
	b _020188D8
_020188D4:
	bl sub_02003AB0
_020188D8:
	bl sub_02019824
	cmp r0, r4
	bne _020188D4
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm
	bl sub_02003AB0
	b _02018A40
_02018900:
	ldrh r0, [r3, #8]
	bl StopBgm
	b _02018A40
_0201890C:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm
	b _02018A40
_0201891C:
	ldr r4, _02018A68 ; =0x000003E6
	b _02018928
_02018924:
	bl sub_02003AB0
_02018928:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018924
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_02018950:
	ldr r4, _02018A68 ; =0x000003E6
	b _0201895C
_02018958:
	bl sub_02003AB0
_0201895C:
	bl sub_0201A19C
	cmp r0, r4
	bne _02018958
	ldr r4, _02018A6C ; =0x000003E7
	b _02018974
_02018970:
	bl sub_02003AB0
_02018974:
	bl sub_02019D58
	cmp r0, r4
	bne _02018970
	ldr r2, [sp]
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
	ldrh r2, [r2, #6]
	bl PlayBgm2
	bl sub_02003AB0
	b _02018A40
_0201899C:
	ldrh r0, [r3, #8]
	bl StopBgm2
	b _02018A40
_020189A8:
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #6]
	bl ChangeBgm2
	b _02018A40
_020189B8:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	ldrh r2, [r3, #6]
	bl PlayME
	bl sub_02003AB0
	b _02018A40
_020189D0:
	ldrh r0, [r3, #8]
	bl StopME
	b _02018A40
_020189DC:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #8]
	bl PlaySe
	bl sub_02003AB0
	b _02018A40
_020189F0:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrsh r3, [r3, #0xa]
	bl PlaySeFullSpec
	bl sub_02003AB0
	b _02018A40
_02018A0C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	bl StopSe
	b _02018A40
_02018A1C:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	bl SeChangeVolume
	b _02018A40
_02018A30:
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrsh r2, [r3, #0xa]
	bl SeChangePan
_02018A40:
	ldr r0, _02018A70 ; =_020AF7C0
	bl sub_02002CB4
	ldr r2, [sp]
	mov r3, #0
	ldr r0, _02018A70 ; =_020AF7C0
	ldr r1, _02018A74 ; =_020AF7E4
	str r3, [r2]
	bl sub_02002ECC
	b _0201880C
	.align 2, 0
_02018A64: .word _022A4C28
_02018A68: .word 0x000003E6
_02018A6C: .word 0x000003E7
_02018A70: .word _020AF7C0
_02018A74: .word _020AF7E4
	arm_func_end sub_02018804

	arm_func_start sub_02018A78
sub_02018A78: ; 0x02018A78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02018AD8 ; =_020AF7C0
	ldr r1, _02018ADC ; =_020AF7E4
	bl sub_02002D14
	mov r1, #0
	ldr r4, _02018AE0 ; =_022A4C50
	b _02018AC0
_02018A98:
	ldr r0, [r4]
	cmp r0, #0
	bne _02018AB8
	ldr r0, _02018AD8 ; =_020AF7C0
	str r5, [r4]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_02018AB8:
	add r1, r1, #1
	add r4, r4, #0x20
_02018AC0:
	cmp r1, #0x10
	blt _02018A98
	ldr r0, _02018AD8 ; =_020AF7C0
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018AD8: .word _020AF7C0
_02018ADC: .word _020AF7E4
_02018AE0: .word _022A4C50
	arm_func_end sub_02018A78

	arm_func_start SendAudioCommand2
SendAudioCommand2: ; 0x02018AE4
	stmdb sp!, {r4, lr}
	ldr r1, _02018B3C ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018B0C
	ldr r0, _02018B40 ; =_022A4C00
	ldr r1, _02018B44 ; =_02099240
	bl sub_02002FB4
_02018B0C:
	ldr r0, _02018B48 ; =_020AF7C0
	bl sub_02002CB4
	ldr r1, _02018B4C ; =_020AF780
	mov r2, #1
	ldr r0, _02018B48 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018B40 ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018B3C: .word _022A4C00
_02018B40: .word _022A4C00
_02018B44: .word _02099240
_02018B48: .word _020AF7C0
_02018B4C: .word _020AF780
	arm_func_end SendAudioCommand2

	arm_func_start sub_02018B50
sub_02018B50: ; 0x02018B50
	ldr ip, _02018B60 ; =sub_02002D14
	ldr r0, _02018B64 ; =_020AF7C0
	ldr r1, _02018B68 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018B60: .word sub_02002D14
_02018B64: .word _020AF7C0
_02018B68: .word _020AF7E4
	arm_func_end sub_02018B50

	arm_func_start AllocAudioCommand
AllocAudioCommand: ; 0x02018B6C
	mov r3, #0
	ldr r2, _02018BA4 ; =_022A4C50
	b _02018B94
_02018B78:
	ldr r1, [r2]
	cmp r1, #0
	streq r0, [r2]
	moveq r0, r2
	bxeq lr
	add r3, r3, #1
	add r2, r2, #0x20
_02018B94:
	cmp r3, #0x10
	blt _02018B78
	mov r0, #0
	bx lr
	.align 2, 0
_02018BA4: .word _022A4C50
	arm_func_end AllocAudioCommand

	arm_func_start SendAudioCommand
SendAudioCommand: ; 0x02018BA8
	stmdb sp!, {r4, lr}
	ldr r1, _02018BF8 ; =_022A4C00
	mov r4, r0
	ldr r2, [r1, #0x24]
	ldr r0, [r1, #0x14]
	cmp r2, r0
	bne _02018BD0
	ldr r0, _02018BFC ; =_022A4C00
	ldr r1, _02018C00 ; =_02099240
	bl sub_02002FB4
_02018BD0:
	ldr r1, _02018C04 ; =_020AF780
	mov r2, #1
	ldr r0, _02018C08 ; =_020AF7C0
	strb r2, [r1]
	bl sub_02002E98
	ldr r0, _02018BFC ; =_022A4C00
	mov r1, r4
	mov r2, #1
	bl sub_02002F7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02018BF8: .word _022A4C00
_02018BFC: .word _022A4C00
_02018C00: .word _02099240
_02018C04: .word _020AF780
_02018C08: .word _020AF7C0
	arm_func_end SendAudioCommand

	arm_func_start sub_02018C0C
sub_02018C0C: ; 0x02018C0C
	ldr ip, _02018C1C ; =sub_02002ECC
	ldr r0, _02018C20 ; =_020AF7C0
	ldr r1, _02018C24 ; =_020AF7E4
	bx ip
	.align 2, 0
_02018C1C: .word sub_02002ECC
_02018C20: .word _020AF7C0
_02018C24: .word _020AF7E4
	arm_func_end sub_02018C0C

	arm_func_start InitSoundSystem
InitSoundSystem: ; 0x02018C28
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002C40
	ldr r0, _02018E44 ; =_020AFB28
	mov r1, #4
	bl sub_02002CAC
	bl sub_0207CC10
	ldr r0, _02018E48 ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9C4
	add r0, sp, #0x10
	bl DseDriver_LoadDefaultSettings
	mov r0, #0x10000
	mov r1, #2
	bl MemAlloc
	ldr r2, _02018E4C ; =_022A4E50
	mov r1, #0x3c000
	str r0, [r2]
	mov r0, #0
	mov r2, #0x14
	mov r3, #2
	bl MemArenaAlloc
	ldr r1, _02018E4C ; =_022A4E50
	mov r2, #0x10000
	str r0, [r1, #4]
	ldr r1, [r1]
	add r0, sp, #0x10
	bl DseDriver_ConfigureHeap
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #4
	bl sub_0206C36C
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0xf
	bl sub_0206C39C
	add r0, sp, #0x10
	bl DseDriver_Init
	ldr r1, _02018E50 ; =_0209939C
	add r0, sp, #8
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp, #8]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E58 ; =_020993B4
	str r1, [r2, #0x80]
	bl Debug_Print0
	ldr r1, _02018E5C ; =_020993D0
	add r0, sp, #8
	bl sub_02019314
	ldr r0, [sp, #8]
	bl DseSe_Load
	mov r1, r0
	ldr r0, _02018E54 ; =_022A4E58
	str r1, [r0, #0x7c]
	ldr r0, _02018E60 ; =_020993E8
	bl Debug_Print0
	ldr r1, _02018E64 ; =_02099404
	add r0, sp, #0
	bl sub_02019314
	mov r1, #0
	ldr r0, [sp]
	mov r2, r1
	bl DseSwd_LoadBank
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E68 ; =_02099418
	str r1, [r2, #0x8c]
	bl Debug_Print0
	ldr r1, _02018E6C ; =_02099434
	add r0, sp, #0
	bl sub_02019314
	ldr r0, [sp]
	bl DseSe_Load
	mov r1, r0
	ldr r2, _02018E54 ; =_022A4E58
	ldr r0, _02018E70 ; =_02099448
	str r1, [r2, #0x88]
	bl Debug_Print0
	ldr r0, _02018E54 ; =_022A4E58
	mov r2, #0
	str r2, [r0, #0xc4]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r2, [r0, #0x44]
	ldr r1, _02018E74 ; =0x000003E7
	str r2, [r0, #0x64]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x48]
	sub r1, r1, #1
	strh r1, [r0, #0x68]
	str r2, [r0, #0x94]
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	strh r1, [r0, #0x9a]
	ldr r0, _02018E78 ; =_022A4E7C
	bl ZInit8
	ldr r0, _02018E7C ; =_022A4E84
	bl ZInit8
	ldr r0, _02018E80 ; =_022A4E8C
	bl ZInit8
	ldr r0, _02018E84 ; =_022A4EA4
	bl ZInit8
	ldr r0, _02018E88 ; =_022A4EAC
	bl ZInit8
	ldr r0, _02018E8C ; =_022A4EB4
	bl ZInit8
	ldr r0, _02018E90 ; =_022A4EC4
	bl ZInit8
	ldr r0, _02018E94 ; =_022A4ECC
	bl ZInit8
	ldr r0, _02018E98 ; =_022A4EF4
	bl ZInit8
	ldr r4, _02018E9C ; =_022A4EFC
	mov r5, #0
_02018E04:
	add r0, r4, r5, lsl #3
	bl ZInit8
	add r5, r5, #1
	cmp r5, #4
	blt _02018E04
	mov r1, #0
	ldr r0, _02018EA0 ; =_020AFB4C
	mov r2, r1
	mov r3, r1
	bl DseSwd_LoadMainBank
	ldr r1, _02018E54 ; =_022A4E58
	str r0, [r1, #4]
	ldr r0, _02018E44 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02018E44: .word _020AFB28
_02018E48: .word 0x0000FFFF
_02018E4C: .word _022A4E50
_02018E50: .word _0209939C
_02018E54: .word _022A4E58
_02018E58: .word _020993B4
_02018E5C: .word _020993D0
_02018E60: .word _020993E8
_02018E64: .word _02099404
_02018E68: .word _02099418
_02018E6C: .word _02099434
_02018E70: .word _02099448
_02018E74: .word 0x000003E7
_02018E78: .word _022A4E7C
_02018E7C: .word _022A4E84
_02018E80: .word _022A4E8C
_02018E84: .word _022A4EA4
_02018E88: .word _022A4EAC
_02018E8C: .word _022A4EB4
_02018E90: .word _022A4EC4
_02018E94: .word _022A4ECC
_02018E98: .word _022A4EF4
_02018E9C: .word _022A4EFC
_02018EA0: .word _020AFB4C
	arm_func_end InitSoundSystem

	arm_func_start ManipBgmPlayback
ManipBgmPlayback: ; 0x02018EA4
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _02018F5C
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018F0C
	ldr r0, [r0]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02018F0C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _02019054 ; =_02099464
	ldrh r2, [r0, #0x20]
	mov r0, #7
	bl Debug_Print
	bl sub_02019408
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02018F0C:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _0201903C
	ldr r0, [r0, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, _0201905C ; =_02099470
	ldrh r2, [r0, #0x48]
	mov r0, #7
	bl Debug_Print
	bl sub_02019488
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019058 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
	b _0201903C
_02018F5C:
	cmp r1, #1
	ldreq r1, [r0, #0x64]
	cmpeq r1, #2
	bne _0201903C
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201903C
	bl sub_02019508
	ldr r0, _02019050 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019060 ; =0x000003E6
	str r2, [r0, #0x64]
	strh r1, [r0, #0x68]
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _02018FE0
	ldrh r2, [r0, #0x20]
	ldr r1, _02019064 ; =_0209947C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x22]
	ldr r0, [r0]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02018FE0:
	ldr r0, _02019050 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #2
	bne _02019030
	ldrh r2, [r0, #0x48]
	ldr r1, _02019068 ; =_0209948C
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019050 ; =_022A4E58
	mov ip, #4
	ldrh r2, [r0, #0x4a]
	ldr r0, [r0, #8]
	add r1, sp, #0
	rsb r2, r2, r2, lsl #7
	mov r2, r2, asr #8
	add r3, r2, #0x3e80000
	mov r2, #0
	str r3, [sp, #0xc]
	str ip, [sp]
	bl ResumeBgm
_02019030:
	ldr r0, _02019050 ; =_022A4E58
	mov r1, #0
	str r1, [r0, #0x18]
_0201903C:
	ldr r0, _0201904C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_0201904C: .word _020AFB28
_02019050: .word _022A4E58
_02019054: .word _02099464
_02019058: .word 0x000003E7
_0201905C: .word _02099470
_02019060: .word 0x000003E6
_02019064: .word _0209947C
_02019068: .word _0209948C
	arm_func_end ManipBgmPlayback

	arm_func_start sub_0201906C
sub_0201906C: ; 0x0201906C
	stmdb sp!, {r3, lr}
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _020190C4 ; =_022A4E58
	ldr r1, [r0, #0x94]
	cmp r1, #2
	bne _020190B4
	ldr r0, [r0, #0xdc]
	mov r1, #0
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bne _020190B4
	bl sub_02019790
	ldr r0, _020190C4 ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x98]
	mov r1, #0
	str r1, [r0, #0x94]
_020190B4:
	ldr r0, _020190C0 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020190C0: .word _020AFB28
_020190C4: .word _022A4E58
	arm_func_end sub_0201906C

	arm_func_start SoundDriverReset
SoundDriverReset: ; 0x020190C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019250 ; =_0209949C
	mov r0, #6
	bl Debug_Print
	ldr r4, _02019254 ; =_022A4E58
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02019184
	ldr r5, _0201924C ; =_020AFB28
	b _0201910C
_020190F8:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201910C:
	ldr r0, [r4, #0x64]
	cmp r0, #1
	beq _020190F8
	cmp r0, #2
	bne _02019174
	ldr r0, _02019254 ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	ble _02019174
	ldr r0, _02019254 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x10]
	bl DseBgm_Stop
	ldr r5, _0201924C ; =_020AFB28
	ldr r4, _02019254 ; =_022A4E58
	b _02019164
_02019150:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019164:
	ldr r0, [r4, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019150
_02019174:
	bl sub_02019508
	ldr r1, _02019258 ; =0x000003E6
	ldr r0, _02019254 ; =_022A4E58
	strh r1, [r0, #0x68]
_02019184:
	mov r7, #0
	ldr r6, _0201925C ; =0x000003E7
	ldr sl, _0201924C ; =_020AFB28
	ldr sb, _02019254 ; =_022A4E58
	mov r8, r7
	mov r4, r7
	mov r5, r7
_020191A0:
	ldr r0, [sb, #0x1c]
	cmp r0, #2
	bne _020191D4
	ldr r0, [sb]
	mov r1, r8
	bl DseBgm_Stop
	ldr r0, [sb]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _020191D4
	bl sub_02019408
	str r7, [sb, #0x1c]
	strh r6, [sb, #0x20]
_020191D4:
	ldr r0, [sb, #0x44]
	cmp r0, #2
	bne _02019208
	ldr r0, [sb, #8]
	mov r1, r5
	bl DseBgm_Stop
	ldr r0, [sb, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019208
	bl sub_02019488
	str r4, [sb, #0x44]
	strh r6, [sb, #0x48]
_02019208:
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	ldrne r0, [sb, #0x44]
	cmpne r0, #0
	beq _02019234
	mov r0, sl
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, sl
	bl sub_02002CB4
	b _020191A0
_02019234:
	mov r0, #0x3f00
	mov r1, #0
	bl StopSe
	ldr r0, _0201924C ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0201924C: .word _020AFB28
_02019250: .word _0209949C
_02019254: .word _022A4E58
_02019258: .word 0x000003E6
_0201925C: .word 0x000003E7
	arm_func_end SoundDriverReset

	arm_func_start sub_02019260
sub_02019260: ; 0x02019260
	stmdb sp!, {r3, lr}
	ldr r0, _02019294 ; =_020AFB24
	ldrb r0, [r0]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019298 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #1
	bl sub_0206C620
	ldr r0, _02019294 ; =_020AFB24
	mov r1, #1
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019294: .word _020AFB24
_02019298: .word _020AFB28
	arm_func_end sub_02019260

	arm_func_start sub_0201929C
sub_0201929C: ; 0x0201929C
	stmdb sp!, {r3, lr}
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002CB4
	mov r0, #0
	bl sub_0206C6BC
	ldr r0, _020192CC ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9E4
	ldr r0, _020192C8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192C8: .word _020AFB28
_020192CC: .word 0x0000FFFF
	arm_func_end sub_0201929C

	arm_func_start sub_020192D0
sub_020192D0: ; 0x020192D0
	stmdb sp!, {r3, lr}
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019300 ; =0x0000FFFF
	mov r1, #0
	bl sub_0207C9C4
	mov r0, #0
	bl sub_0206C754
	ldr r0, _020192FC ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_020192FC: .word _020AFB28
_02019300: .word 0x0000FFFF
	arm_func_end sub_020192D0

	arm_func_start sub_02019304
sub_02019304: ; 0x02019304
	ldr r0, _02019310 ; =_022A4E50
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_02019310: .word _022A4E50
	arm_func_end sub_02019304

	arm_func_start sub_02019314
sub_02019314: ; 0x02019314
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019388 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #2
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019388: .word _022A4E50
	arm_func_end sub_02019314

	arm_func_start LoadDseFile
LoadDseFile: ; 0x0201938C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	mov r4, r1
	bl FileRom_InitDataTransfer
	add r0, sp, #0
	bl FileRom_Veneer_FileInit
	add r0, sp, #0
	mov r1, r4
	bl FileRom_HandleOpen
	add r0, sp, #0
	bl FileGetSize
	str r0, [r5, #4]
	ldr r0, _02019400 ; =_022A4E50
	ldr r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02019404 ; =0x00000302
	bl MemLocateSet
	str r0, [r5]
	add r0, sp, #0
	ldmia r5, {r1, r2}
	bl FileRom_HandleRead
	mov r4, r0
	add r0, sp, #0
	bl FileClose
	bl FileRom_StopDataTransfer
	mov r0, r4
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02019400: .word _022A4E50
_02019404: .word 0x00000302
	arm_func_end LoadDseFile

	arm_func_start sub_02019408
sub_02019408: ; 0x02019408
	stmdb sp!, {r3, lr}
	ldr r0, _0201947C ; =_022A4E8C
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0]
	bl DseBgm_Unload
	ldr r0, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x34]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x24]
	bl MemLocateUnset
	ldr r0, _02019484 ; =_022A4E50
	ldr r1, _02019480 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x2c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201947C: .word _022A4E8C
_02019480: .word _022A4E58
_02019484: .word _022A4E50
	arm_func_end sub_02019408

	arm_func_start sub_02019488
sub_02019488: ; 0x02019488
	stmdb sp!, {r3, lr}
	ldr r0, _020194FC ; =_022A4EB4
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #8]
	bl DseBgm_Unload
	ldr r0, _02019500 ; =_022A4E58
	ldr r0, [r0, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x5c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x4c]
	bl MemLocateUnset
	ldr r0, _02019504 ; =_022A4E50
	ldr r1, _02019500 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x54]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_020194FC: .word _022A4EB4
_02019500: .word _022A4E58
_02019504: .word _022A4E50
	arm_func_end sub_02019488

	arm_func_start sub_02019508
sub_02019508: ; 0x02019508
	stmdb sp!, {r3, lr}
	ldr r0, _02019568 ; =_022A4ECC
	bl PointsToZero
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x10]
	bl DseBgm_Unload
	ldr r0, _0201956C ; =_022A4E58
	ldr r0, [r0, #0x14]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x74]
	bl MemLocateUnset
	ldr r0, _02019570 ; =_022A4E50
	ldr r1, _0201956C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x6c]
	bl MemLocateUnset
	ldmia sp!, {r3, pc}
	.align 2, 0
_02019568: .word _022A4ECC
_0201956C: .word _022A4E58
_02019570: .word _022A4E50
	arm_func_end sub_02019508

	arm_func_start PlaySeLoad
PlaySeLoad: ; 0x02019574
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10c
	mov r6, r0
	mov r1, r6, asr #8
	and r4, r1, #0xff
	and r5, r6, #0xff
	bl sub_0201AAA0
	cmp r0, #0
	movne r0, #0
	bne _02019758
	cmp r5, #0
	moveq r0, #0
	beq _02019758
	ldr r0, _02019760 ; =_022A4E58
	ldrh r0, [r0, #0x9a]
	cmp r0, r6
	moveq r0, #1
	beq _02019758
	cmp r0, #0x3f00
	beq _020195C8
	bl sub_02019790
_020195C8:
	ldr r0, _02019760 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x94]
	ldr r1, _02019764 ; =_020AFB6C
	strh r6, [r0, #0x9a]
	mov r2, #0
	str r2, [r0, #0xc4]
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02019768 ; =_020994B0
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _0201976C ; =_020994C0
	add r3, sp, #0xc
	mov r2, r6
	mov r0, #8
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	ldr r0, _02019774 ; =_022A4EF4
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019760 ; =_022A4E58
	ldr r0, [r0, #0x9c]
	bl DseSe_Load
	ldr r2, _02019760 ; =_022A4E58
	add r1, sp, #4
	str r0, [r2, #0xc8]
	add r0, r0, r5, lsl #16
	str r0, [r2, #0xdc]
	mov r2, #4
	bl DseSe_GetUsedBankIDs
	mov r7, r0
	ldr r1, _02019778 ; =_020994D8
	mov r2, r6
	mov r3, r5
	mov r8, #0
	mov r0, #8
	str r7, [sp]
	bl Debug_Print
	mov sb, r8
	add r6, sp, #4
	mov fp, #8
	ldr r5, _0201977C ; =_022A4EFC
	ldr r4, _02019760 ; =_022A4E58
	b _0201970C
_02019684:
	mov r0, sb, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, _02019780 ; =_02099500
	mov r0, fp
	and sl, r2, #0xff
	str r2, [sp]
	mov r2, sb
	mov r3, sl
	bl Debug_Print
	ldr r1, _02019784 ; =_02099514
	mov r2, sl
	add r0, sp, #0xc
	bl sprintf
	ldr r1, _02019788 ; =_02099528
	mov r0, #8
	mov r2, r8
	add r3, sp, #0xc
	bl Debug_Print
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002E98
	add r0, r5, r8, lsl #3
	add r1, sp, #0xc
	bl LoadDseFile
	ldr r0, _02019770 ; =_020AFB28
	bl sub_02002CB4
	add r0, r4, r8, lsl #3
	mov r1, #0
	ldr r0, [r0, #0xa4]
	mov r2, r1
	bl DseSwd_LoadBank
	add r1, r4, r8, lsl #2
	str r0, [r1, #0xcc]
	add r8, r8, #1
	add sb, sb, #1
_0201970C:
	cmp sb, r7
	blt _02019684
	ldr r0, _02019760 ; =_022A4E58
	cmp r8, #0
	str r8, [r0, #0xc4]
	movne r0, #1
	bne _02019758
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _0201978C ; =_022A4E50
	ldr r1, _02019760 ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	mov r0, #0
_02019758:
	add sp, sp, #0x10c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02019760: .word _022A4E58
_02019764: .word _020AFB6C
_02019768: .word _020994B0
_0201976C: .word _020994C0
_02019770: .word _020AFB28
_02019774: .word _022A4EF4
_02019778: .word _020994D8
_0201977C: .word _022A4EFC
_02019780: .word _02099500
_02019784: .word _02099514
_02019788: .word _02099528
_0201978C: .word _022A4E50
	arm_func_end PlaySeLoad

	arm_func_start sub_02019790
sub_02019790: ; 0x02019790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0201981C ; =_022A4E58
	ldr r5, [r4, #0xc4]
	cmp r5, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #0
	str r6, [r4, #0xc4]
	ldr r7, _02019820 ; =_022A4E50
	b _020197DC
_020197B4:
	add r0, r4, r6, lsl #2
	ldr r0, [r0, #0xcc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_Unload
	add r1, r4, r6, lsl #3
	ldr r0, [r7, #4]
	ldr r1, [r1, #0xa4]
	bl MemLocateUnset
	add r6, r6, #1
_020197DC:
	cmp r6, r5
	blt _020197B4
	ldr r0, _0201981C ; =_022A4E58
	ldr r0, [r0, #0xc8]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSe_Unload
	ldr r0, _02019820 ; =_022A4E50
	ldr r1, _0201981C ; =_022A4E58
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x9c]
	bl MemLocateUnset
	ldr r0, _0201981C ; =_022A4E58
	mov r1, #0x3f00
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201981C: .word _022A4E58
_02019820: .word _022A4E50
	arm_func_end sub_02019790

	arm_func_start sub_02019824
sub_02019824: ; 0x02019824
	stmdb sp!, {r4, lr}
	ldr r0, _02019848 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201984C ; =_022A4E58
	ldr r0, _02019848 ; =_020AFB28
	ldrh r4, [r1, #0x20]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019848: .word _020AFB28
_0201984C: .word _022A4E58
	arm_func_end sub_02019824

	arm_func_start IsSongOver
IsSongOver: ; 0x02019850
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020198B0 ; =_020AFB28
	mov r4, #0
	bl sub_02002CB4
	ldr r0, _020198B4 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #2
	bne _0201989C
	ldr r0, [r0]
	add r2, sp, #0
	mov r1, #0xa
	bl DseSequence_GetParameter
	ldr r0, _020198B4 ; =_022A4E58
	ldr r2, [sp]
	ldr r1, [r0, #0x40]
	cmp r2, r1
	strgt r2, [r0, #0x40]
	movgt r4, #1
_0201989C:
	ldr r0, _020198B0 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020198B0: .word _020AFB28
_020198B4: .word _022A4E58
	arm_func_end IsSongOver

	arm_func_start PlayBgm
PlayBgm: ; 0x020198B8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019B00 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019B04 ; =_0209953C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019B08 ; =_022A4E58
	ldrh r0, [r0, #0x48]
	cmp r6, r0
	bne _02019914
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019914:
	ldr r1, _02019B08 ; =_022A4E58
	ldr r0, _02019B0C ; =0x000003E7
	ldrh r1, [r1, #0x20]
	cmp r1, r0
	beq _02019940
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
_02019940:
	cmp r6, #1
	blo _02019950
	cmp r6, #0xc9
	bls _02019970
_02019950:
	ldr r1, _02019B08 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019B0C ; =0x000003E7
	str r0, [r1, #0x1c]
	ldr r0, _02019B00 ; =_020AFB28
	strh r2, [r1, #0x20]
	bl sub_02002E98
	b _02019AF8
_02019970:
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x1c]
	strh r6, [r0, #0x20]
	strh r4, [r0, #0x22]
	mov r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019AE4
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019B10 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B14 ; =_022A4E8C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _02019B18 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019B1C ; =_022A4E7C
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x24]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019B08 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #4]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019B20 ; =_022A4E50
	ldr r2, _02019B08 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x30]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019B08 ; =_022A4E58
	str r0, [r1, #0x2c]
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019B08 ; =_022A4E58
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x2c]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019A5C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019A5C
	bl FileRom_StopDataTransfer
	ldr r0, _02019B00 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019B08 ; =_022A4E58
	ldr r0, [r0, #0x34]
	bl DseBgm_Load
	ldr r3, _02019B08 ; =_022A4E58
	ldr r1, _02019B24 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019B08 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0]
	mov r2, #1
	bl ResumeBgm
_02019AE4:
	ldr r1, _02019B08 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019B00 ; =_020AFB28
	str r2, [r1, #0x1c]
	bl sub_02002E98
_02019AF8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019B00: .word _020AFB28
_02019B04: .word _0209953C
_02019B08: .word _022A4E58
_02019B0C: .word 0x000003E7
_02019B10: .word _02099554
_02019B14: .word _022A4E8C
_02019B18: .word _0209956C
_02019B1C: .word _022A4E7C
_02019B20: .word _022A4E50
_02019B24: .word sub_0201AABC
	arm_func_end PlayBgm

	arm_func_start StopBgm
StopBgm: ; 0x02019B28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019C40 ; =_02099584
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _02019C44 ; =_022A4E58
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02019C2C
	ldr r6, _02019C3C ; =_020AFB28
	b _02019B78
_02019B64:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_02019B78:
	ldr r0, [r5, #0x1c]
	cmp r0, #1
	beq _02019B64
	cmp r0, #2
	bne _02019C2C
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _02019C44 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2]
	bl DseBgm_Stop
	ldr r0, _02019C44 ; =_022A4E58
	str r4, [sp]
	ldrh r3, [r0, #0x20]
	ldr r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	ldr r0, _02019C48 ; =_02099594
	bl Debug_Print0
	cmp r4, #0
	beq _02019BE4
	ldr r0, _02019C44 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02019C2C
_02019BE4:
	ldr r5, _02019C3C ; =_020AFB28
	ldr r4, _02019C44 ; =_022A4E58
	b _02019C04
_02019BF0:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_02019C04:
	ldr r0, [r4]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _02019BF0
	bl sub_02019408
	ldr r0, _02019C44 ; =_022A4E58
	mov r2, #0
	ldr r1, _02019C4C ; =0x000003E7
	str r2, [r0, #0x1c]
	strh r1, [r0, #0x20]
_02019C2C:
	ldr r0, _02019C3C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02019C3C: .word _020AFB28
_02019C40: .word _02099584
_02019C44: .word _022A4E58
_02019C48: .word _02099594
_02019C4C: .word 0x000003E7
	arm_func_end StopBgm

	arm_func_start ChangeBgm
ChangeBgm: ; 0x02019C50
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _02019CF8 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _02019CFC ; =_020995BC
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _02019D00 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019CE8
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019CE0
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _02019D00 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_02019CE0:
	ldr r0, _02019D00 ; =_022A4E58
	strh r4, [r0, #0x22]
_02019CE8:
	ldr r0, _02019CF8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02019CF8: .word _020AFB28
_02019CFC: .word _020995BC
_02019D00: .word _022A4E58
	arm_func_end ChangeBgm

	arm_func_start sub_02019D04
sub_02019D04: ; 0x02019D04
	stmdb sp!, {r4, lr}
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019D54 ; =_022A4E58
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02019D3C
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	subgt r1, r1, #1
	movgt r4, #1
	strgt r1, [r0, #0x3c]
	movle r4, #0
	b _02019D40
_02019D3C:
	mov r4, #1
_02019D40:
	ldr r0, _02019D50 ; =_020AFB28
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D50: .word _020AFB28
_02019D54: .word _022A4E58
	arm_func_end sub_02019D04

	arm_func_start sub_02019D58
sub_02019D58: ; 0x02019D58
	stmdb sp!, {r4, lr}
	ldr r0, _02019D7C ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _02019D80 ; =_022A4E58
	ldr r0, _02019D7C ; =_020AFB28
	ldrh r4, [r1, #0x48]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02019D7C: .word _020AFB28
_02019D80: .word _022A4E58
	arm_func_end sub_02019D58

	arm_func_start PlayBgm2
PlayBgm2: ; 0x02019D84
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _02019FC0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _02019FC4 ; =_020995D0
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r0, _02019FC8 ; =_022A4E58
	ldrh r0, [r0, #0x20]
	cmp r6, r0
	bne _02019DE0
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019DE0:
	ldr r1, _02019FC8 ; =_022A4E58
	ldr r0, _02019FCC ; =0x000003E7
	ldrh r1, [r1, #0x48]
	cmp r1, r0
	beq _02019E0C
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopBgm2
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
_02019E0C:
	cmp r6, #1
	blo _02019E1C
	cmp r6, #0xc9
	bls _02019E3C
_02019E1C:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r0, #0
	ldr r2, _02019FCC ; =0x000003E7
	str r0, [r1, #0x44]
	ldr r0, _02019FC0 ; =_020AFB28
	strh r2, [r1, #0x48]
	bl sub_02002E98
	b _02019FB8
_02019E3C:
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #1
	str r1, [r0, #0x44]
	strh r6, [r0, #0x48]
	strh r4, [r0, #0x4a]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _02019FA4
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	ldr r1, _02019FD0 ; =_02099554
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FD4 ; =_022A4EB4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r1, _02019FD8 ; =_0209956C
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _02019FDC ; =_022A4EA4
	add r1, sp, #0x18
	bl LoadDseFile
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x4c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r2, _02019FC8 ; =_022A4E58
	mov r1, r0, lsl #0x10
	str r0, [r2, #0xc]
	mov r0, r1, lsr #0x10
	mov r1, #0
	bl DseSwd_LoadWaves
	mov r1, r0
	ldr r0, _02019FE0 ; =_022A4E50
	ldr r2, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #4]
	str r1, [r2, #0x58]
	mov r2, #2
	bl MemLocateSet
	ldr r1, _02019FC8 ; =_022A4E58
	str r0, [r1, #0x54]
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002E98
	bl FileRom_InitDataTransfer
	bl sub_02003AB0
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r2, [r0, #0xc]
	ldr r1, [r0, #0x54]
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	bl DseSwd_LoadWaves
_02019F1C:
	bl sub_02003AB0
	bl DseSwd_IsBankLoading
	cmp r0, #0
	bne _02019F1C
	bl FileRom_StopDataTransfer
	ldr r0, _02019FC0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _02019FC8 ; =_022A4E58
	ldr r0, [r0, #0x5c]
	bl DseBgm_Load
	ldr r3, _02019FC8 ; =_022A4E58
	ldr r1, _02019FE4 ; =sub_0201AABC
	mov r2, #0
	str r0, [r3, #8]
	bl DseBgm_SetSignalCallback
	mov r0, #0x3e8
	mov r1, #4
	str r1, [sp, #4]
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02019FC8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #8]
	mov r2, #1
	bl ResumeBgm
_02019FA4:
	ldr r1, _02019FC8 ; =_022A4E58
	mov r2, #2
	ldr r0, _02019FC0 ; =_020AFB28
	str r2, [r1, #0x44]
	bl sub_02002E98
_02019FB8:
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02019FC0: .word _020AFB28
_02019FC4: .word _020995D0
_02019FC8: .word _022A4E58
_02019FCC: .word 0x000003E7
_02019FD0: .word _02099554
_02019FD4: .word _022A4EB4
_02019FD8: .word _0209956C
_02019FDC: .word _022A4EA4
_02019FE0: .word _022A4E50
_02019FE4: .word sub_0201AABC
	arm_func_end PlayBgm2

	arm_func_start StopBgm2
StopBgm2: ; 0x02019FE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A0DC ; =_020995E8
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r5, _0201A0E0 ; =_022A4E58
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0201A0CC
	ldr r6, _0201A0D8 ; =_020AFB28
	b _0201A034
_0201A020:
	mov r0, r6
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r6
	bl sub_02002CB4
_0201A034:
	ldr r0, [r5, #0x44]
	cmp r0, #1
	beq _0201A020
	cmp r0, #2
	bne _0201A0CC
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A0E0 ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #8]
	bl DseBgm_Stop
	cmp r4, #0
	beq _0201A084
	ldr r0, _0201A0E0 ; =_022A4E58
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0201A0CC
_0201A084:
	ldr r5, _0201A0D8 ; =_020AFB28
	ldr r4, _0201A0E0 ; =_022A4E58
	b _0201A0A4
_0201A090:
	mov r0, r5
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r5
	bl sub_02002CB4
_0201A0A4:
	ldr r0, [r4, #8]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A090
	bl sub_02019488
	ldr r0, _0201A0E0 ; =_022A4E58
	mov r2, #0
	ldr r1, _0201A0E4 ; =0x000003E7
	str r2, [r0, #0x44]
	strh r1, [r0, #0x48]
_0201A0CC:
	ldr r0, _0201A0D8 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201A0D8: .word _020AFB28
_0201A0DC: .word _020995E8
_0201A0E0: .word _022A4E58
_0201A0E4: .word 0x000003E7
	arm_func_end StopBgm2

	arm_func_start ChangeBgm2
ChangeBgm2: ; 0x0201A0E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	ldr r0, _0201A190 ; =_020AFB28
	mov r4, r1
	bl sub_02002CB4
	ldr r1, _0201A194 ; =_020995F8
	mov r2, r4
	mov r3, r5
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A198 ; =_022A4E58
	ldr r1, [r0, #0x44]
	cmp r1, #0
	beq _0201A180
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _0201A178
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r2, #4
	mov r1, #0x3c
	str r2, [sp]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r2, #4
	ldr r1, _0201A198 ; =_022A4E58
	rsb r3, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r3, r0, r3, asr #8
	ldr r0, [r1, #8]
	add r1, sp, #0
	str r3, [sp, #0xc]
	str r2, [sp]
	bl DseBgm_SetFades
_0201A178:
	ldr r0, _0201A198 ; =_022A4E58
	strh r4, [r0, #0x4a]
_0201A180:
	ldr r0, _0201A190 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0201A190: .word _020AFB28
_0201A194: .word _020995F8
_0201A198: .word _022A4E58
	arm_func_end ChangeBgm2

	arm_func_start sub_0201A19C
sub_0201A19C: ; 0x0201A19C
	stmdb sp!, {r4, lr}
	ldr r0, _0201A1C0 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A1C4 ; =_022A4E58
	ldr r0, _0201A1C0 ; =_020AFB28
	ldrh r4, [r1, #0x68]
	bl sub_02002E98
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A1C0: .word _020AFB28
_0201A1C4: .word _022A4E58
	arm_func_end sub_0201A19C

	arm_func_start PlayME
PlayME: ; 0x0201A1C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x98
	mov r6, r0
	ldr r0, _0201A3F0 ; =_020AFB28
	mov r5, r1
	mov r4, r2
	bl sub_02002CB4
	ldr r1, _0201A3F4 ; =_0209960C
	mov r2, r6
	mov r3, r4
	mov r0, #7
	str r5, [sp]
	bl Debug_Print
	ldr r7, _0201A3F8 ; =_022A4E58
	cmp r6, #0xd
	ldr r0, [r7, #0x18]
	movhi r6, #0
	cmp r0, #0
	bne _0201A2B0
	mov r0, #1
	str r0, [r7, #0x18]
	str r0, [r7, #0x64]
	ldr r8, _0201A3F0 ; =_020AFB28
	strh r6, [r7, #0x68]
_0201A228:
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	beq _0201A268
	cmp r0, #2
	bne _0201A250
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0]
	bl DseBgm_Stop
	b _0201A268
_0201A250:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A228
_0201A268:
	ldr r8, _0201A3F0 ; =_020AFB28
	ldr r7, _0201A3F8 ; =_022A4E58
_0201A270:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _0201A304
	cmp r0, #2
	bne _0201A298
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #8]
	bl DseBgm_Stop
	b _0201A304
_0201A298:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
	b _0201A270
_0201A2B0:
	ldr r0, [r7, #0x64]
	cmp r0, #2
	bne _0201A304
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002E98
	mov r0, #0
	bl StopME
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r8, _0201A3F0 ; =_020AFB28
	b _0201A2F0
_0201A2DC:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A2F0:
	ldr r0, [r7, #0x10]
	bl DseBgm_IsPlaying
	cmp r0, #0
	bne _0201A2DC
	bl sub_02019508
_0201A304:
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r0, #1
	str r0, [r1, #0x18]
	str r0, [r1, #0x64]
	ldr r0, _0201A3F0 ; =_020AFB28
	strh r6, [r1, #0x68]
	bl sub_02002E98
	ldr r1, _0201A3FC ; =_02099620
	add r0, sp, #0x18
	mov r2, r6
	bl sprintf
	ldr r0, _0201A400 ; =_022A4ECC
	add r1, sp, #0x18
	bl sub_02019314
	ldr r1, _0201A404 ; =_02099634
	add r0, sp, #0x18
	bl sprintf
	ldr r0, _0201A408 ; =_022A4EC4
	add r1, sp, #0x18
	bl sub_02019314
	ldr r0, _0201A3F0 ; =_020AFB28
	bl sub_02002CB4
	ldr r0, _0201A3F8 ; =_022A4E58
	mov r1, #0
	ldr r0, [r0, #0x6c]
	mov r2, r1
	bl DseSwd_LoadBank
	ldr r1, _0201A3F8 ; =_022A4E58
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x74]
	bl DseBgm_Load
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #4
	str r0, [r1, #0x10]
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	str r2, [sp, #4]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r1, r4, r4, lsl #7
	mov r0, r0, lsl #0x10
	add r0, r0, r1, asr #8
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0201A3F8 ; =_022A4E58
	add r1, sp, #4
	ldr r0, [r0, #0x10]
	mov r2, #1
	bl ResumeBgm
	ldr r1, _0201A3F8 ; =_022A4E58
	mov r2, #2
	ldr r0, _0201A3F0 ; =_020AFB28
	str r2, [r1, #0x64]
	bl sub_02002E98
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A3F0: .word _020AFB28
_0201A3F4: .word _0209960C
_0201A3F8: .word _022A4E58
_0201A3FC: .word _02099620
_0201A400: .word _022A4ECC
_0201A404: .word _02099634
_0201A408: .word _022A4EC4
	arm_func_end PlayME

	arm_func_start StopME
StopME: ; 0x0201A40C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002CB4
	ldr r1, _0201A478 ; =_02099644
	mov r2, r4
	mov r0, #7
	bl Debug_Print
	ldr r0, _0201A47C ; =_022A4E58
	ldr r1, [r0, #0x18]
	cmp r1, #1
	ldreq r0, [r0, #0x64]
	cmpeq r0, #2
	bne _0201A468
	mov r0, #0x3e8
	mul r0, r4, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	ldr r2, _0201A47C ; =_022A4E58
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x10]
	bl DseBgm_Stop
_0201A468:
	ldr r0, _0201A474 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201A474: .word _020AFB28
_0201A478: .word _02099644
_0201A47C: .word _022A4E58
	arm_func_end StopME

	arm_func_start sub_0201A480
sub_0201A480: ; 0x0201A480
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7, asr #8
	ldr r0, _0201A4F4 ; =_020AFB28
	and r5, r7, #0xff
	and r4, r1, #0xff
	mov r6, #0
	bl sub_02002CB4
	cmp r5, #0
	cmpne r4, #0x3f
	beq _0201A4E4
	cmp r4, #1
	bne _0201A4D4
	ldr r0, _0201A4F8 ; =_022A4E58
	mov r1, r5, lsl #0x10
	ldr r0, [r0, #0x88]
	mov r1, r1, lsr #0x10
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	movgt r6, #1
	b _0201A4E4
_0201A4D4:
	ldr r0, _0201A4F8 ; =_022A4E58
	ldrh r0, [r0, #0x98]
	cmp r0, r7
	moveq r6, #1
_0201A4E4:
	ldr r0, _0201A4F4 ; =_020AFB28
	bl sub_02002E98
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201A4F4: .word _020AFB28
_0201A4F8: .word _022A4E58
	arm_func_end sub_0201A480

	arm_func_start PlaySe
PlaySe: ; 0x0201A4FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r2, r5, asr #8
	ldr r0, _0201A660 ; =_020AFB28
	mov r7, r1
	and r6, r2, #0xff
	and r4, r5, #0xff
	bl sub_02002CB4
	ldr r1, _0201A664 ; =_02099650
	mov r2, r5
	mov r3, r7
	mov r0, #8
	bl Debug_Print
	rsb r0, r7, r7, lsl #7
	mov r0, r0, asr #8
	mov r1, #4
	str r0, [sp, #0xc]
	str r1, [sp]
	cmp r4, #0
	beq _0201A650
	cmp r6, #0x3f
	bne _0201A578
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A650
_0201A578:
	cmp r6, #1
	bne _0201A5A0
	ldr r3, _0201A668 ; =_022A4E58
	add r2, sp, #0
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A650
_0201A5A0:
	ldr r0, _0201A668 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh r5, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A60C
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r8, _0201A660 ; =_020AFB28
	mov r7, #0
	ldr r6, _0201A668 ; =_022A4E58
	b _0201A5F8
_0201A5E4:
	mov r0, r8
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r8
	bl sub_02002CB4
_0201A5F8:
	ldr r0, [r6, #0xdc]
	mov r1, r7
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A5E4
_0201A60C:
	mov r0, r5
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A668 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A650
	ldr r3, _0201A668 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #0
	add r0, r0, r4, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A650:
	ldr r0, _0201A660 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A660: .word _020AFB28
_0201A664: .word _02099650
_0201A668: .word _022A4E58
	arm_func_end PlaySe

	arm_func_start PlaySeFullSpec
PlaySeFullSpec: ; 0x0201A66C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	mov sb, r0
	mov r4, sb, asr #8
	ldr r0, _0201A81C ; =_020AFB28
	mov r8, r1
	mov r7, r2
	mov r6, r3
	and r4, r4, #0xff
	and r5, sb, #0xff
	bl sub_02002CB4
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #8
	ldr r1, _0201A820 ; =_02099660
	mov r2, sb
	mov r3, r8
	bl Debug_Print
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3e8
	mul r0, r8, r0
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r7, r7, lsl #7
	rsb r1, r6, r6, lsl #6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x14]
	cmp r5, #0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	mov r0, r0, asr #8
	add r0, r0, #0x40
	str r0, [sp, #0x18]
	mov r0, #0xc
	str r0, [sp, #8]
	beq _0201A80C
	cmp r4, #0x3f
	bne _0201A734
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x7c]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x84]
	bl DseSe_Play
	b _0201A80C
_0201A734:
	cmp r4, #1
	bne _0201A75C
	ldr r3, _0201A824 ; =_022A4E58
	add r2, sp, #8
	ldr r0, [r3, #0x88]
	mov r1, #0
	add r0, r0, r5, lsl #16
	str r0, [r3, #0x90]
	bl DseSe_Play
	b _0201A80C
_0201A75C:
	ldr r0, _0201A824 ; =_022A4E58
	mov r1, #1
	ldrh r2, [r0, #0x98]
	ldr r3, [r0, #0x94]
	str r1, [r0, #0x94]
	cmp r3, #0
	strh sb, [r0, #0x98]
	cmpne r2, #0x3f00
	beq _0201A7C8
	mov r1, #0
	ldr r0, [r0, #0xdc]
	mov r2, r1
	bl DseSe_Stop
	ldr r7, _0201A81C ; =_020AFB28
	mov r6, #0
	ldr r4, _0201A824 ; =_022A4E58
	b _0201A7B4
_0201A7A0:
	mov r0, r7
	bl sub_02002E98
	bl sub_02003AB0
	mov r0, r7
	bl sub_02002CB4
_0201A7B4:
	ldr r0, [r4, #0xdc]
	mov r1, r6
	bl DseSe_HasPlayingInstances
	cmp r0, #0
	bgt _0201A7A0
_0201A7C8:
	mov r0, sb
	bl PlaySeLoad
	cmp r0, #0
	ldreq r0, _0201A824 ; =_022A4E58
	mov r1, #0
	streq r1, [r0, #0x94]
	moveq r1, #0x3f00
	streqh r1, [r0, #0x98]
	beq _0201A80C
	ldr r3, _0201A824 ; =_022A4E58
	mov r0, #2
	str r0, [r3, #0x94]
	ldr r0, [r3, #0xc8]
	add r2, sp, #8
	add r0, r0, r5, lsl #16
	str r0, [r3, #0xdc]
	bl DseSe_Play
_0201A80C:
	ldr r0, _0201A81C ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0201A81C: .word _020AFB28
_0201A820: .word _02099660
_0201A824: .word _022A4E58
	arm_func_end PlaySeFullSpec

	arm_func_start SeChangeVolume
SeChangeVolume: ; 0x0201A828
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A8F4 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A8F8 ; =_02099684
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #4
	rsb r2, r6, r6, lsl #7
	str r0, [sp, #4]
	mov r0, r1, lsl #0x10
	add r0, r0, r2, asr #8
	str r0, [sp, #0x10]
	cmp r5, #0
	beq _0201A8E4
	cmp r4, #0x3f
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A8D8
	cmp r4, #1
	ldreq r0, _0201A8FC ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A8FC ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A8D8:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A8E4:
	ldr r0, _0201A8F4 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A8F4: .word _020AFB28
_0201A8F8: .word _02099684
_0201A8FC: .word _022A4E58
	arm_func_end SeChangeVolume

	arm_func_start SeChangePan
SeChangePan: ; 0x0201A900
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r3, r8, asr #8
	ldr r0, _0201A9D8 ; =_020AFB28
	mov r7, r1
	mov r6, r2
	and r4, r3, #0xff
	and r5, r8, #0xff
	bl sub_02002CB4
	ldr r1, _0201A9DC ; =_020996A4
	mov r2, r8
	mov r3, r7
	str r6, [sp]
	mov r0, #8
	bl Debug_Print
	mov r0, #0x3e8
	mul r0, r7, r0
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0x3c
	bl _s32_div_f
	rsb r2, r6, r6, lsl #6
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r2, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r1, #8
	str r1, [sp, #4]
	add r1, r2, #0x40
	mov r0, r0, lsr #0x10
	add r0, r1, r0, lsl #16
	str r0, [sp, #0x14]
	cmp r5, #0
	beq _0201A9C8
	cmp r4, #0x3f
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r0, r0, r5, lsl #16
	beq _0201A9BC
	cmp r4, #1
	ldreq r0, _0201A9E0 ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r0, r0, r5, lsl #16
	ldrne r0, _0201A9E0 ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r0, r0, r5, lsl #16
_0201A9BC:
	add r2, sp, #4
	mov r1, #0
	bl sub_0206F5C8
_0201A9C8:
	ldr r0, _0201A9D8 ; =_020AFB28
	bl sub_02002E98
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201A9D8: .word _020AFB28
_0201A9DC: .word _020996A4
_0201A9E0: .word _022A4E58
	arm_func_end SeChangePan

	arm_func_start StopSe
StopSe: ; 0x0201A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r2, r7, asr #8
	ldr r0, _0201AA94 ; =_020AFB28
	mov r5, r1
	and r6, r2, #0xff
	and r4, r7, #0xff
	bl sub_02002CB4
	ldr r1, _0201AA98 ; =_020996C0
	mov r2, r7
	mov r3, r5
	mov r0, #8
	bl Debug_Print
	cmp r7, #0x3f00
	bne _0201AA2C
	mov r0, #0
	bl DseSe_StopAll
	b _0201AA88
_0201AA2C:
	cmp r4, #0
	beq _0201AA88
	cmp r6, #0x3f
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x7c]
	addeq r4, r0, r4, lsl #16
	beq _0201AA64
	cmp r6, #1
	ldreq r0, _0201AA9C ; =_022A4E58
	ldreq r0, [r0, #0x88]
	addeq r4, r0, r4, lsl #16
	ldrne r0, _0201AA9C ; =_022A4E58
	ldrne r0, [r0, #0xc8]
	addne r4, r0, r4, lsl #16
_0201AA64:
	mov r0, #0x3e8
	mul r0, r5, r0
	mov r1, #0x3c
	bl _s32_div_f
	mov r1, r0, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r0, r4
	mov r1, #0
	bl DseSe_Stop
_0201AA88:
	ldr r0, _0201AA94 ; =_020AFB28
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201AA94: .word _020AFB28
_0201AA98: .word _020996C0
_0201AA9C: .word _022A4E58
	arm_func_end StopSe

	arm_func_start sub_0201AAA0
sub_0201AAA0: ; 0x0201AAA0
	mov r0, r0, asr #8
	and r0, r0, #0xff
	cmp r0, #0x3f
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0201AAA0

	arm_func_start sub_0201AABC
sub_0201AABC: ; 0x0201AABC
	ldr r1, _0201AAD4 ; =_022A4E58
	mov r0, #0
	ldr r2, [r1, #0x3c]
	add r2, r2, #1
	str r2, [r1, #0x3c]
	bx lr
	.align 2, 0
_0201AAD4: .word _022A4E58
	arm_func_end sub_0201AABC

	arm_func_start sub_0201AAD8
sub_0201AAD8: ; 0x0201AAD8
	ldrb ip, [sp]
	cmp ip, #1
	cmpne ip, #2
	moveq r3, r3, lsl #1
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldrb r2, [sp]
	ldrh r1, [sp, #4]
	strb r2, [r0, #0xe]
	strh r1, [r0, #0xc]
	mov r0, r3
	bx lr
	arm_func_end sub_0201AAD8

	arm_func_start sub_0201AB0C
sub_0201AB0C: ; 0x0201AB0C
	stmdb sp!, {r3, lr}
	mov ip, r0
	ldr r1, [ip, #4]
	cmp r1, #0
	beq _0201AB7C
	ldrb r0, [ip, #0xe]
	cmp r0, #0
	bne _0201AB40
	mov r0, r1
	ldr r1, [ip, #8]
	ldr r2, [ip]
	bl ArrayCopy32
	ldmia sp!, {r3, pc}
_0201AB40:
	cmp r0, #1
	bne _0201AB60
	ldr r2, [ip]
	ldrh r3, [ip, #0xc]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl sub_01FF8000
	ldmia sp!, {r3, pc}
_0201AB60:
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [ip]
	ldr r0, [ip, #8]
	mov r2, r2, asr #1
	bl sub_01FF80B0
	ldmia sp!, {r3, pc}
_0201AB7C:
	ldr r1, [ip, #8]
	ldr r2, [ip]
	mov r0, #0
	bl ArrayFill32
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201AB0C

	arm_func_start sub_0201AB90
sub_0201AB90: ; 0x0201AB90
	ldr ip, _0201ABA8 ; =MemZero
	add r2, r0, #0xe00
	mov r3, #0
	mov r1, #0xe00
	strh r3, [r2]
	bx ip
	.align 2, 0
_0201ABA8: .word MemZero
	arm_func_end sub_0201AB90

	arm_func_start sub_0201ABAC
sub_0201ABAC: ; 0x0201ABAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r7, #0
	mov sb, r0
	mov r8, r1
	mov r6, r7
	add r5, sp, #8
	b _0201ABF8
_0201ABCC:
	str r6, [sp]
	str r6, [sp, #4]
	ldr r2, [sb], #0xc
	mov r0, r5
	mov r1, r8
	bl sub_0201AAD8
	mov r4, r0
	mov r0, r5
	bl sub_0201AB0C
	add r8, r8, r4
	add r7, r7, r4
_0201ABF8:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201ABCC
	mov r0, r7
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0201ABAC

	arm_func_start sub_0201AC10
sub_0201AC10: ; 0x0201AC10
	add r0, r0, #0xe00
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201AC10

	arm_func_start sub_0201AC20
sub_0201AC20: ; 0x0201AC20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x10]
	ldrh ip, [sp, #0x14]
	mov r4, r0
	str lr, [sp]
	str ip, [sp, #4]
	add r0, r4, #0xe00
	ldrsh r0, [r0]
	add r0, r4, r0, lsl #4
	bl sub_0201AAD8
	add r0, r4, #0xe00
	ldrsh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AC20

	arm_func_start sub_0201AC64
sub_0201AC64: ; 0x0201AC64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	add r4, sl, #0xe00
	mov fp, #1
	mov r5, #0
	b _0201AD30
_0201AC90:
	ldrsh r0, [r4]
	cmp r0, #0xe0
	bge _0201AD3C
	cmp r7, #0
	beq _0201ACB8
	cmp r7, #1
	beq _0201ACD8
	cmp r7, #2
	beq _0201ACF8
	b _0201AD1C
_0201ACB8:
	str r5, [sp]
	str r5, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
	b _0201AD1C
_0201ACD8:
	str fp, [sp]
	str r6, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
	b _0201AD1C
_0201ACF8:
	mov r1, #2
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, [sb]
	mov r1, r8
	add r0, sl, r0, lsl #4
	bl sub_0201AAD8
	mov r3, r0
_0201AD1C:
	ldrsh r0, [r4]
	add r8, r8, r3
	add sb, sb, #0xc
	add r0, r0, #1
	strh r0, [r4]
_0201AD30:
	ldr r3, [sb, #4]
	cmp r3, #0
	bne _0201AC90
_0201AD3C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0201AC64

	arm_func_start sub_0201AD44
sub_0201AD44: ; 0x0201AD44
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r0, r6, #0xe00
	ldrsh r5, [r0]
	mov r4, #0
	b _0201AD70
_0201AD5C:
	add r0, r6, r4, lsl #4
	bl sub_0201AB0C
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_0201AD70:
	cmp r4, r5
	blt _0201AD5C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AD44

	arm_func_start sub_0201AD7C
sub_0201AD7C: ; 0x0201AD7C
	add r0, r0, #0x14
	bx lr
	arm_func_end sub_0201AD7C

	arm_func_start sub_0201AD84
sub_0201AD84: ; 0x0201AD84
	add r0, r0, #0x50
	bx lr
	arm_func_end sub_0201AD84

	arm_func_start sub_0201AD8C
sub_0201AD8C: ; 0x0201AD8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, r2
	mov r5, #0
	mov ip, #1
	b _0201ADC0
_0201ADA4:
	add r2, r1, r5
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	add r5, r5, #0x10
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADC0:
	cmp r5, r0
	blt _0201ADA4
	mov ip, r0, lsr #0x1f
	rsb r2, ip, r0, lsl #28
	adds r2, ip, r2, ror #28
	beq _0201ADF8
	add r2, r1, r0
	sub r2, r2, #1
	and r2, r2, #0xff
	ldrh lr, [r4, #0x7a]
	mov r2, r2, asr #4
	mov ip, #1
	orr r2, lr, ip, lsl r2
	strh r2, [r4, #0x7a]
_0201ADF8:
	mov r1, r1, lsl #0x10
	mov r2, r3
	mov r3, r0
	add r0, r4, #0x14
	mov r1, r1, lsr #0x10
	bl sub_0200A5B0
	add r0, r4, #0x14
	bl sub_0200A504
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AD8C

	arm_func_start sub_0201AE1C
sub_0201AE1C: ; 0x0201AE1C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov lr, #0
	add ip, r4, r1, lsl #1
	mov r5, #1
	b _0201AE50
_0201AE34:
	add r0, r2, lr
	and r0, r0, #0xff
	ldrh r6, [ip, #0x7c]
	mov r0, r0, asr #4
	add lr, lr, #0x10
	orr r0, r6, r5, lsl r0
	strh r0, [ip, #0x7c]
_0201AE50:
	cmp lr, r3
	blt _0201AE34
	mov ip, r3, lsr #0x1f
	rsb r0, ip, r3, lsl #28
	adds r0, ip, r0, ror #28
	beq _0201AE90
	add r0, r2, r3
	sub r0, r0, #1
	and r0, r0, #0xff
	add r6, r4, #0x7c
	mov r5, r1, lsl #1
	ldrh lr, [r6, r5]
	mov r0, r0, asr #4
	mov ip, #1
	orr r0, lr, ip, lsl r0
	strh r0, [r6, r5]
_0201AE90:
	add r0, r2, r1, lsl #8
	mov r1, r0, lsl #0x10
	ldr r2, [sp, #0x10]
	add r0, r4, #0x50
	mov r1, r1, lsr #0x10
	bl sub_0200A5B0
	add r0, r4, #0x50
	bl sub_0200A504
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201AE1C

	arm_func_start sub_0201AEB4
sub_0201AEB4: ; 0x0201AEB4
	ldrh r3, [r0, #0x7a]
	mov r1, r1, asr #4
	mov r2, #1
	orr r1, r3, r2, lsl r1
	strh r1, [r0, #0x7a]
	bx lr
	arm_func_end sub_0201AEB4

	arm_func_start sub_0201AECC
sub_0201AECC: ; 0x0201AECC
	stmdb sp!, {r3, lr}
	add lr, r0, #0x7c
	mov ip, r1, lsl #1
	ldrh r3, [lr, ip]
	mov r0, r2, asr #4
	mov r1, #1
	orr r0, r3, r1, lsl r0
	strh r0, [lr, ip]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201AECC

	arm_func_start sub_0201AEF0
sub_0201AEF0: ; 0x0201AEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	strb r4, [r5, #0x79]
	ldrb r0, [r5, #0x78]
	orr r0, r0, #2
	strb r0, [r5, #0x78]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201AEF0

	arm_func_start sub_0201AF18
sub_0201AF18: ; 0x0201AF18
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r1, #0
	mov r2, #0x100
	mov r4, r0
	str r1, [sp]
	bl sub_0200A124
	mov r2, #0
	mov r1, r4
	str r2, [sp]
	add r0, r4, #0x14
	mov r3, #0x100
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #4
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF18

	arm_func_start sub_0201AF64
sub_0201AF64: ; 0x0201AF64
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r1
	mov ip, #0
	add r0, r4, #0x3c
	mov r1, #2
	mov r2, #0x1000
	str ip, [sp]
	bl sub_0200A124
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0x50
	add r1, r4, #0x3c
	mov r3, #0x1000
	bl sub_0200A478
	ldrb r0, [r4, #0x78]
	orr r0, r0, #8
	strb r0, [r4, #0x78]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0201AF64

	arm_func_start sub_0201AFB8
sub_0201AFB8: ; 0x0201AFB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1f
	beq _0201AFE0
	add r0, r4, #0x14
	bl sub_0200A510
	mov r0, r4
	bl sub_0200A180
_0201AFE0:
	ldrb r0, [r4, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x50
	bl sub_0200A510
	add r0, r4, #0x3c
	bl sub_0200A180
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201AFB8

	arm_func_start sub_0201B004
sub_0201B004: ; 0x0201B004
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrb r1, [r7, #0x78]
	mov r2, r1, lsl #0x1d
	movs r2, r2, lsr #0x1f
	beq _0201B158
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _0201B14C
	ldrb r0, [r7, #8]
	cmp r0, #0
	beq _0201B150
	mov r4, #0
_0201B038:
	mov r2, r4, lsl #4
	and r0, r2, #0xff
	ldrh r1, [r7, #0x7a]
	mov r0, r0, asr #4
	mov r3, #1
	tst r1, r3, lsl r0
	moveq r3, #0
	tst r3, #0xff
	beq _0201B12C
	mov r0, r2, lsl #0x10
	ldr r1, [r7, #0x10]
	mov r3, r0, asr #0x10
	add r5, r1, r3, lsl #1
	ldr r2, [r7, #0xc]
	mov r0, r5
	mov r1, #0x20
	add r6, r2, r3, lsl #1
	bl sub_0207A2DC
	ldr r0, [r7]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0201B0A4
_0201B090: ; jump table
	b _0201B0A4 ; case 0
	b _0201B0C0 ; case 1
	b _0201B0DC ; case 2
	b _0201B0F8 ; case 3
	b _0201B114 ; case 4
_0201B0A4:
	mov r1, #0
_0201B0A8:
	ldrh r0, [r5], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r6], #2
	blt _0201B0A8
	b _0201B12C
_0201B0C0:
	bl GX_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0201B12C
_0201B0DC:
	bl GX_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0201B12C
_0201B0F8:
	bl GXS_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0201B12C
_0201B114:
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, #0x20
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0201B12C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x10
	blt _0201B038
	mov r0, #0
	strb r0, [r7, #8]
	b _0201B150
_0201B14C:
	bl sub_0200A184
_0201B150:
	mov r0, #0
	strh r0, [r7, #0x7a]
_0201B158:
	ldrb r0, [r7, #0x78]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #0x3c
	bl sub_0200A184
	mov r3, #0
	mov r2, r3
_0201B178:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r7, r3, lsl #1
	mov r3, r0, asr #0x10
	strh r2, [r1, #0x7c]
	cmp r3, #0x10
	blt _0201B178
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201B004

	arm_func_start sub_0201B198
sub_0201B198: ; 0x0201B198
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r8, r1
	mov r4, r0
	mov r1, #0x70
	mov r7, r2
	mov r6, r3
	bl MemZero
	strb r5, [r4, #0xe]
	strb r6, [r4]
	stmib r4, {r7, r8}
	ldr r0, [r4, #4]
	bl sub_0201AC10
	mov r0, #2
	strh r0, [r4, #0xc]
	cmp r6, #0
	moveq r0, #0x6400000
	movne r0, #0x6600000
	str r0, [r4, #0x64]
	cmp r5, #0
	bne _0201B210
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	mov r3, #0x7000000
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B210:
	cmp r5, #1
	bne _0201B238
	ldr r3, _0201B294 ; =0x07000400
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x70
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B238:
	cmp r5, #2
	bne _0201B260
	ldr r3, _0201B298 ; =0x07000380
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
	b _0201B284
_0201B260:
	cmp r5, #3
	bne _0201B284
	ldr r3, _0201B29C ; =0x07000780
	mov ip, #0
	add r0, r4, #0x20
	mov r1, #0x10
	mov r2, #0x140
	str ip, [sp]
	bl sub_0200B508
_0201B284:
	mov r0, r4
	bl sub_0201B2A0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0201B294: .word 0x07000400
_0201B298: .word 0x07000380
_0201B29C: .word 0x07000780
	arm_func_end sub_0201B198

	arm_func_start sub_0201B2A0
sub_0201B2A0: ; 0x0201B2A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x40]
	add r0, r4, #0x20
	bl sub_0200B67C
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x10
	mov r1, #0xc
	bl MemZero
	mov r0, #0
	strb r0, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201B2A0

	arm_func_start sub_0201B2DC
sub_0201B2DC: ; 0x0201B2DC
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r6, [r0, #0xc]
	ldrh r4, [r3, #4]
	ldr r5, _0201B384 ; =_020AFC28
	mov lr, r6, lsr #0x1f
	rsb r3, lr, r6, lsl #30
	add r3, lr, r3, ror #30
	mov r3, r3, lsl #1
	ldrsh r3, [r5, r3]
	cmp r4, #0
	ldr lr, [r0, #0x64]
	mul r5, r2, r3
	bne _0201B35C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	cmp r3, #0x10
	bhs _0201B344
	mov r2, ip
	add r1, r5, lr
	bl sub_0201ABAC
	mov ip, r0
	b _0201B37C
_0201B344:
	mov r3, ip
	add r1, r5, lr
	mov r2, #2
	bl sub_0201ABAC
	mov ip, r0
	b _0201B37C
_0201B35C:
	cmp r4, #1
	bne _0201B37C
	ldrh r3, [sp, #0x10]
	mov r0, r1
	mov r2, ip
	add r1, r5, lr
	bl sub_0201ABAC
	mov ip, r0
_0201B37C:
	mov r0, ip
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201B384: .word _020AFC28
	arm_func_end sub_0201B2DC

	arm_func_start sub_0201B388
sub_0201B388: ; 0x0201B388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r0, #0xc]
	ldrb ip, [r3, #0xa]
	ldr r5, _0201B438 ; =_020AFC28
	mov r4, lr, lsr #0x1f
	rsb lr, r4, lr, lsl #30
	add r4, r4, lr, ror #30
	mov r4, r4, lsl #1
	ldrsh lr, [r5, r4]
	cmp ip, #0xff
	ldr r4, [r0, #0x64]
	mul r5, r2, lr
	ldreqh r2, [sp, #0x10]
	andeq ip, r2, #0xff
	ldrh r2, [r3, #4]
	cmp r2, #0
	bne _0201B414
	cmp ip, #0x10
	bhs _0201B3F8
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
	b _0201B430
_0201B3F8:
	mov r2, #0
	str r2, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	mov r3, #2
	bl sub_0201AC64
	b _0201B430
_0201B414:
	cmp r2, #1
	bne _0201B430
	mov r3, #0
	str r3, [sp]
	ldr r0, [r0, #4]
	add r2, r5, r4
	bl sub_0201AC64
_0201B430:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201B438: .word _020AFC28
	arm_func_end sub_0201B388

	arm_func_start sub_0201B43C
sub_0201B43C: ; 0x0201B43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r1
	ldrb r1, [r6, #0xa]
	mov r7, r0
	ldrh r0, [r6, #4]
	mov r5, r2
	cmp r1, #0xff
	movne r5, r1
	cmp r0, #0
	bne _0201B4B8
	cmp r5, #0x10
	bhs _0201B48C
	ldrsh r2, [r6, #6]
	mov r1, r5, lsl #4
	ldr r0, [r7, #8]
	ldr r3, [r6]
	and r1, r1, #0xff
	and r2, r2, #0xff
	bl sub_0201AD8C
	b _0201B534
_0201B48C:
	ldr r1, [r6]
	sub r0, r5, #0x10
	str r1, [sp]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, [r7, #8]
	and r1, r1, #0xff
	mov r2, #0
	mov r3, #0x10
	bl sub_0201AE1C
	b _0201B534
_0201B4B8:
	cmp r0, #1
	bne _0201B534
	ldrb r0, [r6, #0xb]
	cmp r0, #0
	beq _0201B518
	ldrsh r1, [r6, #6]
	mov r4, #0
	mov sb, #0x10
	mov r0, r1, asr #3
	add r8, r1, r0, lsr #28
	b _0201B50C
_0201B4E4:
	ldr r0, [r6]
	add r1, r5, r4
	add r0, r0, r4, lsl #6
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldr r0, [r7, #8]
	mov r3, sb
	and r1, r1, #0xff
	bl sub_0201AE1C
	add r4, r4, #1
_0201B50C:
	cmp r4, r8, asr #4
	blt _0201B4E4
	b _0201B534
_0201B518:
	ldr r0, [r6]
	and r1, r5, #0xff
	str r0, [sp]
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #6]
	ldr r0, [r7, #8]
	bl sub_0201AE1C
_0201B534:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_0201B43C

	arm_func_start sub_0201B53C
sub_0201B53C: ; 0x0201B53C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	mov r5, r3
	ldrh ip, [r4, #4]
	ldr r3, _0201B5F4 ; =_020AFC30
	mov r6, r0
	mov r0, ip, lsl #1
	ldrh r7, [r3, r0]
	mov r3, #0
	cmp r7, #0
	bne _0201B57C
	ldrh r0, [sp, #0x1c]
	cmp r0, #0x10
	movhs r0, #1
	movlo r0, r7
	b _0201B580
_0201B57C:
	mov r0, r7
_0201B580:
	mov ip, r2, lsl #0x10
	ldrsh r2, [r6, #0xc]
	cmp r7, #0
	cmpeq r0, #1
	mov r0, r1
	moveq r3, #1
	mov r1, ip, asr #0x10
	bl sub_0201B5F8
	ldrb r1, [sp, #0x24]
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	cmp r1, #0
	bne _0201B5D0
	ldrh ip, [sp, #0x1c]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, r4
	str ip, [sp]
	bl sub_0201B388
_0201B5D0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	bne _0201B5EC
	ldrh r2, [sp, #0x1c]
	mov r0, r6
	mov r1, r4
	bl sub_0201B43C
_0201B5EC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201B5F4: .word _020AFC30
	arm_func_end sub_0201B53C

	arm_func_start sub_0201B5F8
sub_0201B5F8: ; 0x0201B5F8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r5, r1
	mov r1, r4
	add r0, sp, #0
	mov r6, r2
	mov r4, r3
	bl sub_0201B678
	ldrh r3, [sp, #8]
	ldr r0, _0201B670 ; =0x000003FF
	ldr r1, _0201B674 ; =_020996D8
	mov r2, r6, lsl #1
	and r0, r3, r0
	mov r0, r0, lsl #0x10
	ldrsh r1, [r1, r2]
	mov r0, r0, asr #0x10
	cmp r4, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	movne r1, #1
	mov r0, r0, asr #0x10
	moveq r1, #0
	mov r0, r0, lsl r1
	mov r0, r0, lsl #0x10
	add r0, r5, r0, asr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201B670: .word 0x000003FF
_0201B674: .word _020996D8
	arm_func_end sub_0201B5F8

	arm_func_start sub_0201B678
sub_0201B678: ; 0x0201B678
	ldrh r3, [r1]
	ldr r2, _0201B6D0 ; =0x0000FCFF
	strh r3, [r0]
	ldrh ip, [r1, #2]
	sub r3, r2, #0xb00
	strh ip, [r0, #2]
	ldrh ip, [r1, #4]
	and r2, ip, r2
	strh r2, [r0, #4]
	ldrh r2, [r1, #6]
	and r2, r2, r3
	strh r2, [r0, #6]
	ldrh r2, [r1, #8]
	strh r2, [r0, #8]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	mov r1, r2, lsl #0x16
	and r2, r3, #0xe00
	mov r1, r1, lsr #0x12
	orr r1, r1, r2, asr #9
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201B6D0: .word 0x0000FCFF
	arm_func_end sub_0201B678

	arm_func_start sub_0201B6D4
sub_0201B6D4: ; 0x0201B6D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r6, r2
	mov r7, r1
	mov r4, r3
	ldrsh r1, [r6, #4]
	ldrsh r2, [r5, #0xc]
	ldrb r3, [r6, #0xe]
	mov r0, r7
	bl sub_0201B5F8
	ldr r1, [r5, #0x40]
	str r0, [sp, #4]
	cmp r1, #0x80
	mvnge r0, #0
	bge _0201B9A4
	ldrh r2, [r6, #0xa]
	ldrh r3, [r6, #8]
	ldrb sl, [r6, #0xf]
	and r8, r2, #0xff
	ldrh r2, [r6, #0xc]
	add r0, sp, #0x16
	mov r1, r7
	str r2, [sp]
	and sb, r3, #0xff
	ldrh r7, [r6, #6]
	ldrsh fp, [r6, #2]
	ldrsh r6, [r6]
	bl sub_0201B678
	ldrsb r0, [sp, #0x19]
	adds r7, r7, r0
	movmi r7, #0
	cmp r7, #0x140
	ldrge r7, _0201B9AC ; =0x0000013F
	cmp r4, #0
	bne _0201B790
	add r3, sp, #0x1a
	ldrh r0, [r3]
	add r4, sp, #0xe
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	strh r0, [r4]
	ldrh r0, [r3, #6]
	strh r2, [r4, #2]
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	b _0201B7E8
_0201B790:
	add lr, sp, #0x1a
	ldrh r1, [r4]
	ldrh r2, [lr]
	ldrh r0, [r4, #6]
	add ip, sp, #0xe
	and r1, r2, r1
	orr r0, r0, r1
	strh r0, [ip]
	ldrh r2, [lr, #2]
	ldrh r1, [r4, #2]
	ldrh r3, [r4, #8]
	ldrh r0, [lr, #4]
	and r1, r2, r1
	orr r1, r3, r1
	strh r1, [ip, #2]
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	ldrh r3, [lr, #6]
	and r0, r0, r1
	orr r0, r2, r0
	strh r0, [ip, #4]
	strh r3, [ip, #6]
_0201B7E8:
	ldrh r1, [sp, #0x12]
	mov r2, #0x400
	rsb r2, r2, #0
	and r1, r1, r2
	ldrh r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	and r1, r0, r2, lsr #23
	sub r0, r6, #0x100
	add r4, r1, r0
	ldr r1, [sp, #4]
	ldrh r0, [sp, #0x12]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsr #0x16
	and r1, r2, r1, lsr #16
	orr r1, r0, r1
	mov r3, r4, lsl #0x10
	mov r0, r3, asr #0x10
	strh r1, [sp, #0x12]
	bl sub_0201B9B0
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0x10]
	mov r0, #0x200
	rsb r0, r0, #0
	and r1, r1, r0
	strh r1, [sp, #0x10]
	ldrh r3, [sp, #0x14]
	mov r1, r0, lsr #0x14
	sub r2, fp, #0x200
	and r1, r1, r3, asr #4
	add r6, r1, r2
	ldrh r3, [sp, #0x10]
	mov r1, r6, lsl #0x10
	and r2, r4, r0, lsr #23
	mov r0, r1, asr #0x10
	orr r1, r3, r2
	strh r1, [sp, #0x10]
	bl sub_0201B9D4
	cmp r0, #0
	mvnne r7, #0
	bne _0201B950
	ldrh r1, [sp, #0xe]
	ldrh r0, [sp, #0x14]
	and r2, r6, #0xff
	bic r1, r1, #0xff
	strh r1, [sp, #0xe]
	ldrh r3, [sp, #0xe]
	mov r1, r0, asr #1
	ldr r0, [sp]
	orr r2, r3, r2
	bic r2, r2, #0x2000
	strh r2, [sp, #0xe]
	ldrh r2, [sp, #0xe]
	mov r0, r0, lsl #0x1f
	tst r1, #1
	orr r0, r2, r0, lsr #18
	strh r0, [sp, #0xe]
	bne _0201B928
	cmp sl, #0
	beq _0201B8FC
	ldrh r1, [sp, #0x12]
	mov r0, sb, lsl #0x1c
	bic r1, r1, #0xf000
	strh r1, [sp, #0x12]
	ldrh r1, [sp, #0x12]
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
	b _0201B928
_0201B8FC:
	ldrh r2, [sp, #0x12]
	and r1, sb, #0xf
	bic r0, r2, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r2, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r1
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B928:
	ldrh r1, [sp, #0x12]
	bic r0, r1, #0xf000
	strh r0, [sp, #0x12]
	mov r0, r1, asr #0xc
	and r0, r0, #0xf
	add r0, r0, r8
	ldrh r1, [sp, #0x12]
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	strh r0, [sp, #0x12]
_0201B950:
	cmp r7, #0
	mvnlt r0, #1
	blt _0201B9A4
	ldr r1, [r5, #0x40]
	ldr r0, [r5, #0x20]
	cmp r1, r0
	bge _0201B9A0
	ldrh r4, [sp, #0xe]
	ldrh r3, [sp, #0x10]
	ldrh r0, [sp, #0x12]
	add r1, sp, #8
	mov r2, r7
	strh r0, [sp, #0xc]
	strh r4, [sp, #8]
	strh r3, [sp, #0xa]
	add r0, r5, #0x20
	bl sub_0200B6F0
	ldr r0, [r5, #0x40]
	add r0, r0, #1
	str r0, [r5, #0x40]
_0201B9A0:
	mov r0, #0
_0201B9A4:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201B9AC: .word 0x0000013F
	arm_func_end sub_0201B6D4

	arm_func_start sub_0201B9B0
sub_0201B9B0: ; 0x0201B9B0
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9C4
	cmp r0, #0x100
	blt _0201B9CC
_0201B9C4:
	mov r0, #1
	bx lr
_0201B9CC:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9B0

	arm_func_start sub_0201B9D4
sub_0201B9D4: ; 0x0201B9D4
	mvn r1, #0x3f
	cmp r0, r1
	blt _0201B9E8
	cmp r0, #0xc0
	blt _0201B9F0
_0201B9E8:
	mov r0, #1
	bx lr
_0201B9F0:
	mov r0, #0
	bx lr
	arm_func_end sub_0201B9D4

	arm_func_start sub_0201B9F8
sub_0201B9F8: ; 0x0201B9F8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #0x40]
	cmp r3, #0x80
	mvnge r0, #0
	bge _0201BA90
	cmp r2, #0
	blt _0201BA24
	cmp r2, #0x140
	blt _0201BA2C
_0201BA24:
	mvn r0, #1
	b _0201BA90
_0201BA2C:
	ldr r0, [r4, #0x20]
	cmp r3, r0
	bge _0201BA8C
	ldrh lr, [r1]
	ldr r3, _0201BA98 ; =0x00000FFF
	add r0, r4, #0x20
	strh lr, [sp]
	ldrh ip, [r1, #2]
	and lr, lr, #0xff00
	strh ip, [sp, #2]
	ldrh ip, [r1, #4]
	strh ip, [sp, #4]
	ldrh ip, [r1, #6]
	add r1, sp, #0
	and r3, r3, ip, asr #4
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	and r3, r3, #0xff
	orr r3, lr, r3
	strh r3, [sp]
	bl sub_0200B6F0
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0201BA8C:
	mov r0, #0
_0201BA90:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201BA98: .word 0x00000FFF
	arm_func_end sub_0201B9F8

	arm_func_start sub_0201BA9C
sub_0201BA9C: ; 0x0201BA9C
	ldr ip, _0201BAA8 ; =sub_0200B57C
	add r0, r0, #0x20
	bx ip
	.align 2, 0
_0201BAA8: .word sub_0200B57C
	arm_func_end sub_0201BA9C

	arm_func_start sub_0201BAAC
sub_0201BAAC: ; 0x0201BAAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x20
	bl sub_0200B570
	add r0, r4, #0x20
	bl sub_0200B630
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BAAC

	arm_func_start sub_0201BAC8
sub_0201BAC8: ; 0x0201BAC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldrb r5, [sp, #0x18]
	ldrb r4, [sp, #0x1c]
	str r5, [sp]
	str r4, [sp, #4]
	ldrh ip, [r0, #0xc]
	ldr r4, [r0, #0x64]
	ldr r5, _0201BB1C ; =_020AFC28
	mov lr, ip, lsr #0x1f
	rsb ip, lr, ip, lsl #30
	add ip, lr, ip, ror #30
	mov ip, ip, lsl #1
	ldrsh ip, [r5, ip]
	mov r5, r1
	ldr r0, [r0, #4]
	smlabb r1, r2, ip, r4
	mov r2, r5
	bl sub_0201AC20
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201BB1C: .word _020AFC28
	arm_func_end sub_0201BAC8

	arm_func_start sub_0201BB20
sub_0201BB20: ; 0x0201BB20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	bl sub_0201AD44
	ldr r0, [r4, #4]
	bl sub_0201AC10
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201BB20

	arm_func_start sub_0201BB3C
sub_0201BB3C: ; 0x0201BB3C
	stmdb sp!, {r3, lr}
	mov r0, #0x1f00
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201BCBC ; =_020AFC4C
	mov r1, #0x1f00
	str r0, [r2]
	bl MemZero
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AB90
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c0
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x3c4
	add r0, r0, #0xc00
	bl sub_0201AC10
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC0 ; =0x05000200
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC4 ; =0x06894000
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AF64
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AEF0
	ldr r0, _0201BCBC ; =_020AFC4C
	ldr r1, _0201BCC8 ; =0x05000600
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AF18
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r3, #0
	ldr r0, [r0]
	str r3, [sp]
	add r1, r0, #0x1c8
	add r1, r1, #0x1c00
	add r2, r0, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r3, #1
	ldr r2, [r0]
	str r3, [sp]
	add r0, r2, #0x70
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #2
	ldr r2, [r0]
	mov r3, #0
	str r1, [sp]
	add r0, r2, #0xe0
	add r1, r2, #0x1c8
	add r1, r1, #0x1c00
	add r2, r2, #0x1c0
	bl sub_0201B198
	ldr r0, _0201BCBC ; =_020AFC4C
	mov r1, #3
	ldr r2, [r0]
	mov r3, #1
	str r1, [sp]
	add r0, r2, #0x150
	add r1, r2, #0x264
	add r1, r1, #0x1c00
	add r2, r2, #0x3c4
	add r2, r2, #0xc00
	bl sub_0201B198
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BCBC: .word _020AFC4C
_0201BCC0: .word 0x05000200
_0201BCC4: .word 0x06894000
_0201BCC8: .word 0x05000600
	arm_func_end sub_0201BB3C

	arm_func_start sub_0201BCCC
sub_0201BCCC: ; 0x0201BCCC
	ldr r1, _0201BCEC ; =_020AFC4C
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BCF0 ; =sub_0201AD7C
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BCEC: .word _020AFC4C
_0201BCF0: .word sub_0201AD7C
	arm_func_end sub_0201BCCC

	arm_func_start sub_0201BCF4
sub_0201BCF4: ; 0x0201BCF4
	ldr r1, _0201BD14 ; =_020AFC4C
	mov r2, #0x9c
	ldr r1, [r1]
	ldr ip, _0201BD18 ; =sub_0201AD84
	add r1, r1, #0x1c8
	add r1, r1, #0x1c00
	mla r0, r2, r0, r1
	bx ip
	.align 2, 0
_0201BD14: .word _020AFC4C
_0201BD18: .word sub_0201AD84
	arm_func_end sub_0201BCF4

	arm_func_start sub_0201BD1C
sub_0201BD1C: ; 0x0201BD1C
	ldr r3, _0201BD4C ; =_020AFC4C
	mov r2, #0x9c
	ldr ip, [r3]
	and r3, r0, #1
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r2, r1, r2, r0
	ldrb r0, [r2, #0x78]
	bic r0, r0, #1
	orr r0, r0, r3
	strb r0, [r2, #0x78]
	bx lr
	.align 2, 0
_0201BD4C: .word _020AFC4C
	arm_func_end sub_0201BD1C

	arm_func_start sub_0201BD50
sub_0201BD50: ; 0x0201BD50
	stmdb sp!, {r3, lr}
	ldr r3, _0201BD7C ; =_020AFC4C
	mov r2, #0x9c
	ldr r3, [r3]
	mov ip, r0
	add r0, r3, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r1, r2, r0
	mov r1, ip
	bl sub_0201AEB4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BD7C: .word _020AFC4C
	arm_func_end sub_0201BD50

	arm_func_start sub_0201BD80
sub_0201BD80: ; 0x0201BD80
	stmdb sp!, {r3, lr}
	ldr ip, _0201BDB0 ; =_020AFC4C
	mov lr, r0
	ldr ip, [ip]
	mov r3, #0x9c
	add r0, ip, #0x1c8
	add r0, r0, #0x1c00
	mla r0, r2, r3, r0
	mov r2, r1
	mov r1, lr
	bl sub_0201AECC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDB0: .word _020AFC4C
	arm_func_end sub_0201BD80

	arm_func_start sub_0201BDB4
sub_0201BDB4: ; 0x0201BDB4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BDE8 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BAAC
	ldr r0, _0201BDE8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BAAC
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BDE8: .word _020AFC4C
	arm_func_end sub_0201BDB4

	arm_func_start sub_0201BDEC
sub_0201BDEC: ; 0x0201BDEC
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BE24 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BAAC
	ldr r0, _0201BE24 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BAAC
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE24: .word _020AFC4C
	arm_func_end sub_0201BDEC

	arm_func_start sub_0201BE28
sub_0201BE28: ; 0x0201BE28
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE58 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldr r0, _0201BE58 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201AFB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE58: .word _020AFC4C
	arm_func_end sub_0201BE28

	arm_func_start sub_0201BE5C
sub_0201BE5C: ; 0x0201BE5C
	stmdb sp!, {r3, lr}
	ldr r0, _0201BE80 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BA9C
	ldr r0, _0201BE80 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BA9C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BE80: .word _020AFC4C
	arm_func_end sub_0201BE5C

	arm_func_start sub_0201BE84
sub_0201BE84: ; 0x0201BE84
	stmdb sp!, {r3, lr}
	ldr r0, _0201BEAC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BA9C
	ldr r0, _0201BEAC ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BA9C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BEAC: .word _020AFC4C
	arm_func_end sub_0201BE84

	arm_func_start sub_0201BEB0
sub_0201BEB0: ; 0x0201BEB0
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x1c8
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x264
	add r0, r0, #0x1c00
	bl sub_0201B004
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201BB20
	ldr r0, _0201BF0C ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF0C: .word _020AFC4C
	arm_func_end sub_0201BEB0

	arm_func_start sub_0201BF10
sub_0201BF10: ; 0x0201BF10
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _0201BF48 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201BB20
	ldr r0, _0201BF48 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201BB20
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BF48: .word _020AFC4C
	arm_func_end sub_0201BF10

	arm_func_start sub_0201BF4C
sub_0201BF4C: ; 0x0201BF4C
	stmdb sp!, {r3, lr}
	bl sub_0201BEB0
	bl sub_0201BF10
	bl sub_0201BDB4
	bl sub_0201BDEC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201BF4C

	arm_func_start sub_0201BF64
sub_0201BF64: ; 0x0201BF64
	stmdb sp!, {r3, lr}
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0xe0
	bl sub_0201B2A0
	ldr r0, _0201BFA8 ; =_020AFC4C
	ldr r0, [r0]
	add r0, r0, #0x150
	bl sub_0201B2A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201BFA8: .word _020AFC4C
	arm_func_end sub_0201BF64

	arm_func_start sub_0201BFAC
sub_0201BFAC: ; 0x0201BFAC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, _0201BFEC ; =_020AFC4C
	str r3, [sp]
	ldr lr, [ip]
	ldr ip, [sp, #0x10]
	mov r3, #0x70
	mov r4, r0
	mla r0, ip, r3, lr
	mov ip, r1
	mov r3, r2
	mov r1, r4
	mov r2, ip
	bl sub_0201B2DC
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201BFEC: .word _020AFC4C
	arm_func_end sub_0201BFAC

	arm_func_start sub_0201BFF0
sub_0201BFF0: ; 0x0201BFF0
	ldr ip, _0201BFFC ; =sub_01FF8000
	mov r2, r2, asr #1
	bx ip
	.align 2, 0
_0201BFFC: .word sub_01FF8000
	arm_func_end sub_0201BFF0

	arm_func_start sub_0201C000
sub_0201C000: ; 0x0201C000
	ldr r2, _0201C024 ; =0x0000FFFF
	mov r1, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	.align 2, 0
_0201C024: .word 0x0000FFFF
	arm_func_end sub_0201C000

	arm_func_start sub_0201C028
sub_0201C028: ; 0x0201C028
	strh r1, [r0]
	strh r2, [r0, #2]
	ldrh r1, [sp]
	strh r3, [r0, #4]
	ldrh r2, [sp, #4]
	strh r1, [r0, #6]
	ldrh r1, [sp, #8]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_0201C028

	arm_func_start InitAnimationControl
InitAnimationControl: ; 0x0201C050
	stmdb sp!, {r4, lr}
	mov r1, #0x7c
	mov r4, r0
	bl MemZero
	mov r1, #0
	str r1, [r4, #0x68]
	str r1, [r4, #0x6c]
	strh r1, [r4, #0x70]
	mov r0, #0xff
	strh r1, [r4, #0x72]
	strb r0, [r4, #0x43]
	add r0, r0, #0xff00
	strh r0, [r4, #0x36]
	mov r0, #9
	strb r0, [r4, #0x40]
	add r0, r4, #0x10
	bl sub_0201C000
	ldrh r0, [r4, #2]
	bic r0, r0, #0x8000
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	orr r0, r0, #0x200
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControl

	arm_func_start InitAnimationControlWithSet__0201C0B0
InitAnimationControlWithSet__0201C0B0: ; 0x0201C0B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0B0

	arm_func_start InitAnimationControlWithSet__0201C0CC
InitAnimationControlWithSet__0201C0CC: ; 0x0201C0CC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl InitAnimationControl
	ldrh r0, [r4, #2]
	orr r0, r0, #1
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	arm_func_end InitAnimationControlWithSet__0201C0CC

	arm_func_start SetSpriteIdForAnimationControl
SetSpriteIdForAnimationControl: ; 0x0201C0E8
	strh r1, [r0, #0x70]
	ldrsh r2, [r0, #0x70]
	ldrsh r1, [r0, #0x72]
	cmp r2, r1
	strneh r2, [r0, #0x72]
	movne r1, #0xff
	strneb r1, [r0, #0x43]
	bx lr
	arm_func_end SetSpriteIdForAnimationControl

	arm_func_start sub_0201C108
sub_0201C108: ; 0x0201C108
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x70]
	cmp r0, #0
	bne _0201C124
	ldr r0, _0201C134 ; =_020996E0
	bl Debug_Print0
_0201C124:
	ldrh r0, [r4, #2]
	orr r0, r0, #0x8000
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201C134: .word _020996E0
	arm_func_end sub_0201C108

	arm_func_start sub_0201C138
sub_0201C138: ; 0x0201C138
	ldr ip, _0201C140 ; =InitAnimationControl
	bx ip
	.align 2, 0
_0201C140: .word InitAnimationControl
	arm_func_end sub_0201C138

	arm_func_start sub_0201C144
sub_0201C144: ; 0x0201C144
	stmdb sp!, {r3, lr}
	ldr r1, _0201C178 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201C178: .word _020AFC3C
	arm_func_end sub_0201C144

	arm_func_start SetAnimationForAnimationControlInternal
SetAnimationForAnimationControlInternal: ; 0x0201C17C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	ldmia r1, {ip, lr}
	mov r5, #0
	mov r4, r4, lsl #0x10
	strh r5, [r0]
	strh r5, [r0, #6]
	mov r4, r4, asr #0x10
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	mov r5, #1
	ldrb r4, [sp, #0x1c]
	strh r5, [r0, #4]
	ldrh r5, [r0]
	cmp r4, #0
	orr r4, r5, #0x8000
	strh r4, [r0]
	ldrneh r4, [r0]
	mov r5, #0
	orrne r4, r4, #0x1000
	strneh r4, [r0]
	ldr r4, [ip, #8]
	add r4, r4, r2, lsl #3
	ldrh r4, [r4, #4]
	cmp r3, r4
	strh r5, [r0, #0x20]
	movge r3, #0
	ldr r4, [sp, #0x10]
	strh r5, [r0, #0x22]
	strh r4, [r0, #0x32]
	sub r4, r5, #1
	strh r4, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	str r5, [r0, #0x28]
	str r5, [r0, #0x2c]
	strh r5, [r0, #0xc]
	strh r2, [r0, #0x76]
	strh r3, [r0, #0x78]
	ldr r4, [ip]
	cmp lr, #0
	str r4, [r0, #0x54]
	ldrne r5, [lr]
	cmp lr, #0
	str r5, [r0, #0x58]
	ldrne r4, [lr, #4]
	moveq r4, #0
	str r4, [r0, #0x5c]
	cmp lr, #0
	ldrnesh r4, [lr, #0xa]
	ldrb lr, [sp, #0x14]
	ldreqsh r4, [ip, #0x14]
	and r4, r4, #1
	strh r4, [r0, #0x60]
	ldr r4, [ip, #4]
	str r4, [r0, #0x50]
	ldrb r4, [sp, #0x20]
	strb lr, [r0, #0x41]
	strb r4, [r0, #0x7a]
	ldrb r1, [r1, #8]
	cmp r1, #1
	beq _0201C29C
	ldr r1, [ip, #8]
	ldr r1, [r1]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	ldrh r1, [r1, #4]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	b _0201C2C0
_0201C29C:
	ldrsh r1, [ip, #0xc]
	strh r1, [r0, #0x30]
	ldr r1, [ip, #8]
	ldr r1, [r1, r2, lsl #3]
	ldr r1, [r1, r3, lsl #2]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	ldr r1, [ip, #8]
	add r1, r1, r2, lsl #3
_0201C2C0:
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x62]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetAnimationForAnimationControlInternal

	arm_func_start SetAnimationForAnimationControl
SetAnimationForAnimationControl: ; 0x0201C2CC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	ldrsh r0, [r7, #0x70]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl SpriteTypeInWanTable
	cmp r0, #0
	beq _0201C304
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0201C348
_0201C304:
	mov r0, r7
	bl GetWanForAnimationControl
	ldrb r3, [sp, #0x28]
	str r4, [sp]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	ldrb r0, [sp, #0x30]
	str r2, [sp, #8]
	ldrb r4, [sp, #0x34]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r6
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C348:
	ldrsh r0, [r7, #0x70]
	mov r1, r6, lsl #0x10
	mov r1, r1, asr #0x10
	bl WanTableSpriteHasAnimationGroup
	cmp r0, #0
	mov r0, r7
	beq _0201C3A4
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r2, r6
	str r0, [sp, #0xc]
	mov r0, r7
	mov r3, r5
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
	b _0201C3E0
_0201C3A4:
	bl GetWanForAnimationControl
	str r4, [sp]
	ldrb r3, [sp, #0x28]
	mov r1, r0
	ldr r2, [sp, #0x2c]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrb r0, [sp, #0x30]
	ldrb r4, [sp, #0x34]
	mov r3, r5
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, #0
	str r4, [sp, #0x10]
	bl SetAnimationForAnimationControlInternal
_0201C3E0:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end SetAnimationForAnimationControl

	arm_func_start GetWanForAnimationControl
GetWanForAnimationControl: ; 0x0201C3E8
	ldr r1, [r0, #0x68]
	cmp r1, #0
	ldrne r0, [r1, #4]
	bxne lr
	ldr r1, _0201C414 ; =WAN_TABLE
	ldrsh r2, [r0, #0x70]
	ldr r1, [r1]
	mov r0, #0x38
	smlabb r0, r2, r0, r1
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
_0201C414: .word WAN_TABLE
	arm_func_end GetWanForAnimationControl

	arm_func_start SetAndPlayAnimationForAnimationControl
SetAndPlayAnimationForAnimationControl: ; 0x0201C418
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldrb r4, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	ldrb lr, [sp, #0x20]
	stmia sp, {r4, ip}
	ldrb ip, [sp, #0x24]
	str lr, [sp, #8]
	mov r4, r0
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end SetAndPlayAnimationForAnimationControl

	arm_func_start SwitchAnimationControlToNextFrame
SwitchAnimationControlToNextFrame: ; 0x0201C458
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201D1B0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x3a]
	cmp r0, #0
	blt _0201C4F4
	ldrh r0, [r4]
	tst r0, #0x4000
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xc]
	ldrsh r0, [r4, #4]
	add r0, r1, r0
	strh r0, [r4, #0xc]
	ldrsh r1, [r4, #0xa]
	cmp r1, #0
	beq _0201C4C0
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #0xa]
	ldrsh r0, [r4, #0xa]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
_0201C4C0:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	beq _0201C4E8
	ldrsh r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, #6]
	cmp r0, #0
	movlt r0, #0
	strlth r0, [r4, #6]
_0201C4E8:
	ldrsh r0, [r4, #6]
	cmp r0, #0
	ldmgtia sp!, {r4, pc}
_0201C4F4:
	ldr r0, [r4, #0x4c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C550
	ldrh r0, [r4]
	tst r0, #0x1000
	beq _0201C544
	ldrh r1, [r4, #0x62]
	ldr r2, [r4, #0x48]
	mov r0, #0xc
	mla r0, r1, r0, r2
	str r0, [r4, #0x4c]
	ldrsh r0, [r4, #8]
	cmp r0, #0
	beq _0201C550
	bl Rand16Bit
	ldrsh r1, [r4, #8]
	and r0, r1, r0
	strh r0, [r4, #0xa]
	b _0201C550
_0201C544:
	orr r0, r0, #0x2000
	strh r0, [r4]
	ldmia sp!, {r4, pc}
_0201C550:
	ldr r1, [r4, #0x4c]
	mov r0, r4
	bl LoadAnimationFrameAndIncrementInAnimationControl
	ldmia sp!, {r4, pc}
	arm_func_end SwitchAnimationControlToNextFrame

	arm_func_start LoadAnimationFrameAndIncrementInAnimationControl
LoadAnimationFrameAndIncrementInAnimationControl: ; 0x0201C560
	ldrh r2, [r0]
	orr r2, r2, #0x800
	strh r2, [r0]
	ldrb r2, [r1]
	strh r2, [r0, #6]
	ldrsh r2, [r1, #2]
	strh r2, [r0, #0x3a]
	ldrsh r2, [r1, #4]
	strh r2, [r0, #0x20]
	ldrsh r2, [r1, #6]
	strh r2, [r0, #0x22]
	ldrsh r2, [r1, #8]
	strh r2, [r0, #0x24]
	ldrsh r2, [r1, #0xa]
	strh r2, [r0, #0x26]
	ldrb r2, [r1, #1]
	str r2, [r0, #0x28]
	ldrb r1, [r1, #1]
	ldr r2, [r0, #0x2c]
	orr r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x4c]
	add r1, r1, #0xc
	str r1, [r0, #0x4c]
	bx lr
	arm_func_end LoadAnimationFrameAndIncrementInAnimationControl

	arm_func_start sub_0201C5C4
sub_0201C5C4: ; 0x0201C5C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x90
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0201CF40
	ldrsh r0, [r8, #0x3a]
	mov fp, #0
	cmp r0, #0
	bge _0201C618
	mov r0, r8
	bl SwitchAnimationControlToNextFrame
	ldrh r0, [r8]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, fp
	tst r0, #0xff
	beq _0201CF40
_0201C618:
	ldrsh r1, [r8, #0x3c]
	ldrsh r0, [r8, #0x3a]
	cmp r1, r0
	ldrh r0, [r8, #2]
	movne fp, #1
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201C640
	tst r0, #0x100
	movne fp, #1
_0201C640:
	ldrb r0, [r8, #0x7a]
	cmp r0, #4
	bhs _0201CEC8
	ldrsh r0, [r8, #0x70]
	bl SpriteTypeInWanTable
	cmp r0, #3
	bne _0201C928
	mov r0, r8
	bl GetWanForAnimationControl
	ldr r6, [r0]
	ldr r5, [r0, #4]
	ldr sl, [r6, #0x10]
	mov r0, #0
	ldr r3, [r5]
	mov r7, r0
	str r0, [sp, #0x44]
	ldr r0, [r5, #4]
	ldrsh r1, [r8, #0x3a]
	ldr r2, [r6]
	cmp sl, #0
	str r0, [sp, #0x48]
	ldr r4, [r3]
	ldr sb, [r2, r1, lsl #2]
	beq _0201C6CC
	ldrsh r0, [r8, #0x78]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	ldrh r0, [r8, #0xc]
	add r1, sl, r1, lsl #3
	ldr r1, [r1, #4]
	bl _s32_div_f
	ldr r0, [sp, #0x20]
	ldr r0, [sl, r0, lsl #3]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x44]
_0201C6CC:
	cmp r5, #0
	cmpne fp, #0
	beq _0201C7D8
	ldrh r0, [r8, #2]
	tst r0, #0x8000
	bne _0201C7D8
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x48]
	ldrsh r0, [r0, #6]
	strh r0, [sp, #0x8a]
	ldrsh r0, [r5, #0xa]
	cmp r0, #2
	bne _0201C72C
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #2
	smulbb r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	strh r1, [sp, #0x88]
	mov r5, r0, asr #2
	b _0201C79C
_0201C72C:
	cmp r0, #0
	bne _0201C754
	ldrsh r2, [r4, #4]
	ldrsh r0, [r4, #6]
	mov r1, #0
	smulbb r0, r2, r0
	add r0, r0, r0, lsr #31
	strh r1, [sp, #0x88]
	mov r5, r0, asr #1
	b _0201C79C
_0201C754:
	cmp r0, #3
	bne _0201C774
	ldrsh r2, [r4, #4]
	ldrsh r1, [r4, #6]
	mov r0, #3
	strh r0, [sp, #0x88]
	smulbb r5, r2, r1
	b _0201C79C
_0201C774:
	cmp r0, #4
	ldrsh r2, [r4, #4]
	ldreqsh r1, [r4, #6]
	moveq r0, #4
	streqh r0, [sp, #0x88]
	smulbbeq r5, r2, r1
	ldrnesh r1, [r4, #6]
	movne r0, #1
	smulbbne r5, r2, r1
	strneh r0, [sp, #0x88]
_0201C79C:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrb r2, [r8, #0x40]
	ldr r0, [r0]
	ldrb r3, [r8, #0x41]
	add r1, sp, #0x84
	add r0, r0, #0xcc
	bl sub_0201E408
	ldrh r1, [r8, #0x32]
	ldr r0, [r4]
	mov r2, r5
	mov r3, #0
	bl sub_0201E050
	ldrh r0, [r8, #2]
	orr r0, r0, #0x8000
	strh r0, [r8, #2]
_0201C7D8:
	ldr r0, [sp, #0x44]
	and r0, r0, #0xf8
	mov r0, r0, asr #3
	str r0, [sp, #0x24]
_0201C7E8:
	ldr r0, _0201CF48 ; =_020AFC70
	ldrsh r2, [r8, #0x1c]
	ldr r5, [r0]
	ldrsh r0, [r8, #0x20]
	ldrh sl, [sb, #0x20]
	ldrsh ip, [r8, #0x1e]
	ldrsh r3, [r8, #0x22]
	add r2, r2, r0
	ldrb r4, [r8, #0x41]
	ldrb r1, [r8, #0x40]
	add r3, ip, r3
	add ip, sl, #0x39
	ldrh r0, [r8, #0x32]
	ldr r5, [r5, #0xe0]
	mov sl, #3
	add r1, r4, r1, lsl #8
	strh sl, [sp, #0x5c]
	add r4, r5, r1, lsl #1
	str r0, [sp, #0x60]
	strh ip, [sp, #0x5e]
	mov r0, r4, lsl #0x10
	ldr r1, [sb]
	mov r4, r7
	add r0, r1, r0, lsr #16
	add r1, r7, #1
	and r7, r1, #0xff
	add r5, sp, #0x68
	str r0, [sp, #0x64]
	add sl, sb, #0x10
	mov r1, #4
_0201C860:
	ldrh r0, [sl], #2
	subs r1, r1, #1
	strh r0, [r5], #2
	bne _0201C860
	ldrh r5, [sb, #0x18]
	add r0, sp, #0x7e
	add r1, sb, #0x1a
	strh r5, [sp, #0x70]
	ldrsh r5, [sb, #4]
	strh r5, [sp, #0x72]
	ldrsh sl, [sb, #6]
	add r5, r5, r2
	add r2, sl, r3
	strh r5, [sp, #0x72]
	strh r2, [sp, #0x74]
	ldrsh r2, [sb, #8]
	strh r2, [sp, #0x76]
	ldrsh r2, [sb, #0xa]
	strh r2, [sp, #0x78]
	ldrh r2, [sb, #0xc]
	strh r2, [sp, #0x7a]
	ldrh r2, [sb, #0xe]
	strh r2, [sp, #0x7c]
	ldrh r2, [sb, #0x1e]
	strb r4, [sp, #0x82]
	strh r2, [sp, #0x80]
	ldrb r2, [sb, #0x1d]
	and r2, r2, #0xf8
	mov r2, r2, asr #3
	strb r2, [sp, #0x83]
	bl Rgb8ToRgb5
	ldr r0, [r6, #0x10]
	mov r1, #0x3f
	cmp r0, #0
	ldrne r0, [sp, #0x24]
	strneb r0, [sp, #0x83]
	mov r0, r7
	bl _s32_div_f
	ldrh r0, [r8, #2]
	and r7, r1, #0xff
	tst r0, #2
	bne _0201C910
	add r0, sp, #0x5c
	bl sub_01FF8CAC
_0201C910:
	ldrb r0, [sb, #0x22]
	cmp r0, #0
	addeq sb, sb, #0x28
	beq _0201C7E8
	mov r4, #1
	b _0201CF04
_0201C928:
	ldrb r2, [r8, #0x7a]
	ldr r1, _0201CF4C ; =_020AFC50
	mov r0, r8
	ldr r1, [r1, r2, lsl #2]
	str r1, [sp, #0x40]
	bl GetWanForAnimationControl
	mov r1, #0
	ldrh r3, [r8, #0x60]
	str r1, [sp, #0x2c]
	ldr r2, _0201CF50 ; =_020AFC30
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	str r1, [sp, #0x28]
	ldrsh r2, [r8, #0x3a]
	ldr r3, [r8, #0x54]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r7, [r0, #4]
	ldr r1, [sp, #0x28]
	ldrb r0, [r8, #0x41]
	ldr r6, [r3, r2, lsl #2]
	cmp r1, #0
	str r0, [sp, #0x30]
	bne _0201C9B4
	ldr r0, [sp, #0x30]
	cmp r0, #0x10
	blo _0201C9B4
	sub r0, r0, #0x10
	mov r1, r0, lsl #0x10
	mov r0, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x38]
	mov r0, r1, lsr #0x10
	str r0, [sp, #0x30]
_0201C9B4:
	ldrh r2, [r8, #2]
	tst r2, #0x20
	addne r0, r8, #0x10
	strne r0, [sp, #0x2c]
	cmp r7, #0
	cmpne fp, #0
	beq _0201CCFC
	ldrh r0, [r7, #8]
	tst r0, #1
	beq _0201CCFC
	tst r2, #0x8000
	bne _0201CCFC
	ldr r0, [sp, #0x40]
	mov r1, #0
	ldrh r5, [r7, #0xe]
	ldrh sb, [r8, #0x32]
	mov r4, r1
	tst r2, #0x80
	movne r1, #1
	tst r2, #0x40
	and r0, r0, #0xff
	movne r4, #1
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0201CCE0
_0201CA18: ; jump table
	b _0201CA28 ; case 0
	b _0201CAD0 ; case 1
	b _0201CB80 ; case 2
	b _0201CC30 ; case 3
_0201CA28:
	cmp r1, #0
	bne _0201CAB0
	mov sl, #0
	b _0201CAA8
_0201CA38:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x3c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x3c]
	ldrh r2, [r1, #0xc]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CAA8:
	cmp sl, r5
	blo _0201CA38
_0201CAB0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	bl sub_0201B43C
	b _0201CCE0
_0201CAD0:
	cmp r1, #0
	bne _0201CB5C
	mov sl, #0
	b _0201CB54
_0201CAE0:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x14]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, #0x7c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CB54:
	cmp sl, r5
	blo _0201CAE0
_0201CB5C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x70
	bl sub_0201B43C
	b _0201CCE0
_0201CB80:
	cmp r1, #0
	bne _0201CC0C
	mov sl, #0
	b _0201CC04
_0201CB90:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x18]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B388
	ldr r2, [r8, #0x5c]
	ldr r1, _0201CF54 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r1]
	ldr r0, [sp, #0x18]
	ldrh r2, [r1, #0xec]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CC04:
	cmp sl, r5
	blo _0201CB90
_0201CC0C:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0xe0
	bl sub_0201B43C
	b _0201CCE0
_0201CC30:
	cmp r1, #0
	bne _0201CCC0
	mov sl, #0
	b _0201CCB8
_0201CC40:
	ldr r0, [r8, #0x58]
	ldrb r1, [r8, #0x41]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	str r0, [sp, #0x1c]
	str r1, [sp]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r3, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B388
	ldr r1, _0201CF54 ; =_020AFC4C
	ldr r2, [r8, #0x5c]
	ldr r1, [r1]
	ldrh r3, [r2, #4]
	add r1, r1, #0x100
	ldrh r2, [r1, #0x5c]
	ldr r0, [sp, #0x1c]
	ldr r1, _0201CF50 ; =_020AFC30
	mov r3, r3, lsl #1
	ldrh r1, [r1, r3]
	ldr r0, [r0, #4]
	bl sub_0201C144
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov sl, r0, lsr #0x10
_0201CCB8:
	cmp sl, r5
	blo _0201CC40
_0201CCC0:
	cmp r4, #0
	bne _0201CCE0
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrb r2, [r8, #0x41]
	ldr r0, [r0]
	ldr r1, [r8, #0x5c]
	add r0, r0, #0x150
	bl sub_0201B43C
_0201CCE0:
	ldrh r1, [r8, #2]
	ldr r0, _0201CF58 ; =0x0000FFFF
	orr r1, r1, #0x8000
	strh r1, [r8, #2]
	ldrb r1, [r8, #0x41]
	strb r1, [r8, #0x43]
	strh r0, [r8, #0x36]
_0201CCFC:
	ldr r0, [sp, #0x40]
	mov r1, #0x70
	mul r5, r0, r1
	cmp fp, #0
	moveq sb, #1
	ldr sl, _0201CF58 ; =0x0000FFFF
	movne sb, #0
_0201CD18:
	cmp sb, #0
	mov r4, #0
	bne _0201CD34
	ldrsh r0, [r6]
	cmp r0, #0
	strgeh r0, [r8, #0x36]
	bge _0201CD38
_0201CD34:
	strh sl, [r8, #0x36]
_0201CD38:
	ldrsh r3, [r8, #0x1e]
	ldrsh r2, [r8, #0x22]
	ldrsh r1, [r8, #0x1c]
	ldrsh r0, [r8, #0x20]
	add r2, r3, r2
	add r0, r1, r0
	strh r2, [sp, #0x4e]
	strh r0, [sp, #0x4c]
	ldrh r0, [r8, #0x32]
	strh r0, [sp, #0x50]
	ldrh r0, [r8, #0x38]
	strh r0, [sp, #0x52]
	ldr r0, [sp, #0x30]
	strh r0, [sp, #0x54]
	ldrb r0, [r8, #0x42]
	strh r0, [sp, #0x56]
	ldr r0, [sp, #0x28]
	strh r0, [sp, #0x58]
	ldr r0, [sp, #0x38]
	strb r0, [sp, #0x5a]
	ldrh r0, [r8, #2]
	tst r0, #0x1000
	movne r0, #1
	moveq r0, #0
	strb r0, [sp, #0x5b]
	ldrh r0, [r8, #2]
	tst r0, #2
	bne _0201CDD4
	ldr r0, _0201CF54 ; =_020AFC4C
	ldr r3, [sp, #0x2c]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	add r2, sp, #0x4c
	bl sub_0201B6D4
	cmp r0, #0
	movne r0, #1
	moveq r4, #1
	strne r0, [sp, #0x34]
_0201CDD4:
	ldrh r2, [r8, #2]
	tst r2, #0x200
	movne r4, #1
	cmp r4, #0
	cmpne r7, #0
	beq _0201CE80
	ldrh r0, [r7, #8]
	tst r0, #1
	bne _0201CE80
	ldrh r0, [r8, #0x36]
	cmp r0, sl
	beq _0201CE80
	ldrb r3, [r8, #0x41]
	ldrb r1, [r8, #0x43]
	mov r0, #1
	cmp r3, r1
	beq _0201CE24
	tst r2, #0x40
	moveq r0, #0
	strb r3, [r8, #0x43]
_0201CE24:
	ldrh r2, [r8, #0x36]
	ldr r3, [r8, #0x58]
	ldrh r1, [r8, #2]
	ldr r3, [r3, r2, lsl #2]
	ldr r2, [r8, #0x5c]
	tst r1, #0x80
	str r2, [sp]
	ldrb r2, [r8, #0x41]
	movne r1, #1
	moveq r1, #0
	str r2, [sp, #4]
	mov r2, #0
	and r4, r1, #0xff
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0201CF54 ; =_020AFC4C
	ldrh r2, [r8, #0x32]
	ldr r0, [r0]
	mov r1, r6
	add r0, r0, r5
	bl sub_0201B53C
	strh sl, [r8, #0x36]
_0201CE80:
	ldrh r0, [r6, #6]
	mov r0, r0, asr #0xb
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addeq r6, r6, #0xa
	beq _0201CD18
	ldrh r0, [r8, #2]
	tst r0, #0x200
	movne r0, #0
	strne r0, [sp, #0x34]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r4, r0, #0xff
	b _0201CF04
_0201CEC8:
	bne _0201CF04
	ldrsh r0, [r8, #0x3a]
	ldr r1, [r8, #0x54]
	ldr r3, [r1, r0, lsl #2]
	mov r0, #0
	mov r1, #1
_0201CEE0:
	ldrh r2, [r3, #6]
	mov r2, r2, asr #0xb
	tst r2, #1
	movne r2, r1
	moveq r2, r0
	tst r2, #0xff
	addeq r3, r3, #0xa
	beq _0201CEE0
	mov r4, #1
_0201CF04:
	cmp r4, #0
	ldrneh r0, [r8, #2]
	bicne r0, r0, #0x100
	strneh r0, [r8, #2]
	bne _0201CF28
	cmp fp, #0
	ldrneh r0, [r8, #2]
	orrne r0, r0, #0x100
	strneh r0, [r8, #2]
_0201CF28:
	ldrsh r0, [r8, #0x3a]
	strh r0, [r8, #0x3c]
	ldrh r0, [r8]
	tst r0, #0x800
	bicne r0, r0, #0x800
	strneh r0, [r8]
_0201CF40:
	add sp, sp, #0x90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201CF48: .word _020AFC70
_0201CF4C: .word _020AFC50
_0201CF50: .word _020AFC30
_0201CF54: .word _020AFC4C
_0201CF58: .word 0x0000FFFF
	arm_func_end sub_0201C5C4

	arm_func_start sub_0201CF5C
sub_0201CF5C: ; 0x0201CF5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0201C5C4
	ldrh r0, [r4, #2]
	tst r0, #0x10
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201CF5C

	arm_func_start sub_0201CF80
sub_0201CF80: ; 0x0201CF80
	ldrb r1, [r0, #0x41]
	add r1, r1, #1
	strb r1, [r0, #0x43]
	bx lr
	arm_func_end sub_0201CF80

	arm_func_start sub_0201CF90
sub_0201CF90: ; 0x0201CF90
	stmdb sp!, {r3, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	ldrh r3, [r1]
	tst r3, #0x8000
	movne ip, #1
	tst ip, #0xff
	ldmeqia sp!, {r3, pc}
	cmp r2, #4
	ldmhsia sp!, {r3, pc}
	ldrsh ip, [r1, #0x3a]
	mvn r3, #0
	cmp ip, r3
	ldrne r3, [r1, #0x50]
	cmpne r3, #0
	beq _0201D024
	add ip, r3, ip, lsl #4
	mov r3, r2, lsl #2
	ldrsh lr, [ip, r3]
	cmp lr, #0x63
	addeq r3, ip, r3
	ldreqsh r3, [r3, #2]
	cmpeq r3, #0x63
	moveq r1, #0x63
	streqh r1, [r0]
	streqh r1, [r0, #2]
	ldmeqia sp!, {r3, pc}
	ldrsh r3, [r1, #0x20]
	add r2, ip, r2, lsl #2
	add r3, r3, lr
	strh r3, [r0]
	ldrsh r3, [r1, #0x22]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
_0201D024:
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201CF90

	arm_func_start sub_0201D034
sub_0201D034: ; 0x0201D034
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r3, [r2]
	tst r3, #0x8000
	movne r3, #1
	moveq r3, #0
	tst r3, #0xff
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r2, #0x50]
	cmp r4, #0
	beq _0201D0CC
	ldrsh r3, [r2, #0x3a]
	mov ip, #0
	mov r5, #0x63
	add r3, r4, r3, lsl #4
	b _0201D0C0
_0201D070:
	mov r4, ip, lsl #2
	ldrsh r6, [r3, r4]
	cmp r6, #0x63
	addeq r4, r3, r4
	ldreqsh r4, [r4, #2]
	cmpeq r4, #0x63
	streqh r5, [r0]
	streqh r5, [r0, #2]
	beq _0201D0B4
	ldrsh r4, [r2, #0x20]
	add lr, r3, ip, lsl #2
	add r4, r4, r6
	strh r4, [r0]
	ldrsh r4, [r2, #0x22]
	ldrsh lr, [lr, #2]
	add r4, r4, lr
	strh r4, [r0, #2]
_0201D0B4:
	add ip, ip, #1
	add r0, r0, #4
	and ip, ip, #0xff
_0201D0C0:
	cmp ip, r1
	blo _0201D070
	ldmia sp!, {r4, r5, r6, pc}
_0201D0CC:
	mov r2, #0
	mov r3, r2
	b _0201D0EC
_0201D0D8:
	strh r3, [r0]
	add r2, r2, #1
	strh r3, [r0, #2]
	add r0, r0, #4
	and r2, r2, #0xff
_0201D0EC:
	cmp r2, r1
	blo _0201D0D8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D034

	arm_func_start sub_0201D0F8
sub_0201D0F8: ; 0x0201D0F8
	strb r1, [r0, #0x40]
	bx lr
	arm_func_end sub_0201D0F8

	arm_func_start sub_0201D100
sub_0201D100: ; 0x0201D100
	ldr ip, _0201D10C ; =sub_0201DC4C
	ldrsh r0, [r0, #0x70]
	bx ip
	.align 2, 0
_0201D10C: .word sub_0201DC4C
	arm_func_end sub_0201D100

	arm_func_start sub_0201D110
sub_0201D110: ; 0x0201D110
	add r3, r0, #0x10
	mov r2, #6
_0201D118:
	ldrh r0, [r1], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _0201D118
	bx lr
	arm_func_end sub_0201D110

	arm_func_start sub_0201D12C
sub_0201D12C: ; 0x0201D12C
	ldrh r3, [r0, #2]
	and r2, r1, #3
	ldr r1, _0201D16C ; =0x0000F3FF
	orr r3, r3, #0x20
	strh r3, [r0, #2]
	ldrh r3, [r0, #0x14]
	mov r2, r2, lsl #0x10
	and r3, r3, r1
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x1a]
	and r1, r3, r1
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0x1a]
	orr r1, r1, r2, lsr #6
	strh r1, [r0, #0x1a]
	bx lr
	.align 2, 0
_0201D16C: .word 0x0000F3FF
	arm_func_end sub_0201D12C

	arm_func_start AnimationControlGetAllocForMaxFrame
AnimationControlGetAllocForMaxFrame: ; 0x0201D170
	stmdb sp!, {r3, lr}
	bl GetWanForAnimationControl
	cmp r0, #0
	ldrne r0, [r0]
	ldrnesh r0, [r0, #0xe]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end AnimationControlGetAllocForMaxFrame

	arm_func_start sub_0201D18C
sub_0201D18C: ; 0x0201D18C
	mov r1, #0
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D18C

	arm_func_start sub_0201D198
sub_0201D198: ; 0x0201D198
	cmp r1, #0
	ldrh r1, [r0]
	orrne r1, r1, #0x4000
	biceq r1, r1, #0x4000
	strh r1, [r0]
	bx lr
	arm_func_end sub_0201D198

	arm_func_start sub_0201D1B0
sub_0201D1B0: ; 0x0201D1B0
	ldrh r0, [r0]
	tst r0, #0x2000
	movne r0, #0
	bxne lr
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0201D1B0

	arm_func_start sub_0201D1D4
sub_0201D1D4: ; 0x0201D1D4
	ldr r0, [r0, #0x2c]
	bx lr
	arm_func_end sub_0201D1D4

	arm_func_start DeleteWanTableEntry
DeleteWanTableEntry: ; 0x0201D1DC
	stmdb sp!, {r4, lr}
	mov r2, #0x38
	smlabb r4, r1, r2, r0
	ldrb r0, [r4, #0x20]
	cmp r0, #0
	beq _0201D204
	mov r0, r4
	mov r1, r2
	bl MemZero
	ldmia sp!, {r4, pc}
_0201D204:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	ldrnesh r0, [r4, #0x2c]
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r0, #1
	strh r0, [r4, #0x2c]
	ldrsh r0, [r4, #0x2c]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x34]
	bl MemFree
	mov r0, r4
	mov r1, #0x38
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end DeleteWanTableEntry

	arm_func_start AllocateWanTableEntry
AllocateWanTableEntry: ; 0x0201D244
	stmdb sp!, {r3, r4, r5, lr}
	add r1, r0, #0x1500
	mov lr, #1
	ldrsh r4, [r1, #0xa]
	ldrsh r5, [r1, #8]
	mov ip, lr
	mov r3, #0x38
	b _0201D2C4
_0201D264:
	cmp r4, r5
	movge r4, ip
	smlabb r1, r4, r3, r0
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0201D2AC
	add r2, r4, #1
	add r1, r0, #0x1500
	strh r2, [r1, #0xa]
	ldrsh r3, [r1, #0xa]
	ldrsh r2, [r1, #8]
	cmp r3, r2
	movge r2, #1
	strgeh r2, [r1, #0xa]
	mov r1, #0x38
	bl MemZero
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_0201D2AC:
	add r1, lr, #1
	add r2, r4, #1
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov lr, r1, asr #0x10
	mov r4, r2, asr #0x10
_0201D2C4:
	cmp lr, r5
	blt _0201D264
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AllocateWanTableEntry

	arm_func_start FindWanTableEntry
FindWanTableEntry: ; 0x0201D2D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	add r0, r6, #0x1500
	mov r5, r1
	ldrsh r4, [r0, #8]
	mov r8, #1
	mov r7, #0x38
	b _0201D324
_0201D2F4:
	smlabb r0, r8, r7, r6
	ldrb r1, [r0, #0x21]
	cmp r1, #1
	bne _0201D318
	mov r1, r5
	bl strcmp
	cmp r0, #0
	moveq r0, r8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_0201D318:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_0201D324:
	cmp r8, r4
	blt _0201D2F4
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FindWanTableEntry

	arm_func_start GetLoadedWanTableEntry
GetLoadedWanTableEntry: ; 0x0201D334
	stmdb sp!, {r3, r4, r5, lr}
	add r3, r0, #0x1500
	ldrsh r5, [r3, #8]
	mov r4, #1
	mov ip, #0x38
	b _0201D37C
_0201D34C:
	smlabb lr, r4, ip, r0
	ldrb r3, [lr, #0x21]
	cmp r3, #2
	ldreqh r3, [lr, #0x22]
	cmpeq r1, r3
	ldreqh r3, [lr, #0x24]
	cmpeq r2, r3
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	add r3, r4, #1
	mov r3, r3, lsl #0x10
	mov r4, r3, asr #0x10
_0201D37C:
	cmp r4, r5
	blt _0201D34C
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetLoadedWanTableEntry

	arm_func_start sub_0201D38C
sub_0201D38C: ; 0x0201D38C
	stmdb sp!, {r4, lr}
	ldr r1, _0201D3B8 ; =0x00001510
	mov r4, r0
	bl MemZero
	add r1, r4, #0x1500
	mov r2, #1
	strh r2, [r1, #0xa]
	add r0, r4, #0x1000
	strb r2, [r0, #0x50c]
	strh r2, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201D3B8: .word 0x00001510
	arm_func_end sub_0201D38C

	arm_func_start InitWanTable
InitWanTable: ; 0x0201D3BC
	stmdb sp!, {r4, lr}
	mov r1, #0x1500
	mov r4, r0
	bl MemZero
	add r0, r4, #0x1500
	mov r1, #0x60
	strh r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end InitWanTable

	arm_func_start LoadWanTableEntry
LoadWanTableEntry: ; 0x0201D3DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	mov r7, r2
	bl FindWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D418
	mov r1, #0x38
	smlabb r2, r0, r1, r5
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	b _0201D47C
_0201D418:
	mov r0, r5
	bl AllocateWanTableEntry
	mov r4, r0
	mov r0, #0x38
	smlabb r5, r4, r0, r5
	mov r3, #1
	add r0, sp, #0
	mov r1, r6
	mov r2, r7
	strb r3, [r5, #0x21]
	bl LoadFileFromRom
	ldr r1, [sp]
	mov r0, r5
	str r1, [r5, #0x34]
	ldr r2, [sp, #4]
	mov r1, r6
	str r2, [r5, #0x28]
	bl strcpy
	ldrsh r1, [r5, #0x2c]
	add r0, r5, #0x30
	add r1, r1, #1
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r4
_0201D47C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LoadWanTableEntry

	arm_func_start LoadWanTableEntryFromPack
LoadWanTableEntryFromPack: ; 0x0201D484
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D4C0
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D4C0:
	mov r0, sb
	bl AllocateWanTableEntry
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	ldrb r0, [sp, #0x20]
	mov r1, #2
	strb r1, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	cmp r0, #0
	beq _0201D53C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r7, r0
	mov r1, r6
	bl MemAlloc
	mov r1, r7
	mov r2, sb
	mov r6, r0
	bl DecompressAtNormalVeneer
	b _0201D56C
_0201D53C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r1, r6
	mov sb, r0
	bl MemAlloc
	mov r6, r0
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
	str sb, [r4, #0x28]
_0201D56C:
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPack

	arm_func_start LoadWanTableEntryFromPackUseProvidedMemory
LoadWanTableEntryFromPackUseProvidedMemory: ; 0x0201D590
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl GetLoadedWanTableEntry
	mvn r1, #0
	cmp r0, r1
	beq _0201D5CC
	mov r1, #0x38
	smlabb r2, r0, r1, sb
	ldrsh r1, [r2, #0x2c]
	add r1, r1, #1
	strh r1, [r2, #0x2c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0201D5CC:
	mov r0, sb
	bl AllocateWanTableEntry
	ldrb r1, [sp, #0x20]
	mov r5, r0
	mov r0, #0x38
	smlabb r4, r5, r0, sb
	cmp r1, #0
	beq _0201D62C
	add r0, sb, #0x1000
	ldr sb, [r0, #0x500]
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, sb
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, sb
	bl GetAtSize
	mov r2, sb
	mov r1, r0
	mov r0, r6
	bl DecompressAtNormalVeneer
	b _0201D648
_0201D62C:
	mov r0, r8
	mov r1, r7
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D648:
	mov r0, #2
	strb r0, [r4, #0x21]
	strh r8, [r4, #0x22]
	strh r7, [r4, #0x24]
	str r6, [r4, #0x34]
	ldrsh r1, [r4, #0x2c]
	add r0, r4, #0x30
	add r1, r1, #1
	strh r1, [r4, #0x2c]
	ldr r1, [r4, #0x34]
	bl HandleSir0TranslationVeneer
	mov r1, #1
	mov r0, r5
	strb r1, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end LoadWanTableEntryFromPackUseProvidedMemory

	arm_func_start ReplaceWanFromBinFile
ReplaceWanFromBinFile: ; 0x0201D684
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrb ip, [sp, #0x18]
	mov r4, #0x38
	smlabb r6, r1, r4, r0
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	beq _0201D6E8
	add r0, r0, #0x1000
	ldr r7, [r0, #0x500]
	mov r0, r5
	mov r1, r4
	ldr r8, [r6, #0x34]
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
	mov r0, r7
	bl GetAtSize
	mov r2, r7
	mov r1, r0
	mov r0, r8
	bl DecompressAtNormalVeneer
	b _0201D708
_0201D6E8:
	ldr r7, [r6, #0x34]
	mov r0, r5
	mov r1, r4
	bl DirectoryFileMngr_GetDirectoryFileSize
	mov r0, r5
	mov r1, r4
	mov r2, r7
	bl DirectoryFileMngr_LoadDirectoryFile
_0201D708:
	ldr r1, [r6, #0x34]
	add r0, r6, #0x30
	bl HandleSir0TranslationVeneer
	mov r0, #2
	strb r0, [r6, #0x21]
	strh r5, [r6, #0x22]
	strh r4, [r6, #0x24]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ReplaceWanFromBinFile

	arm_func_start DeleteWanTableEntryVeneer
DeleteWanTableEntryVeneer: ; 0x0201D72C
	ldr ip, _0201D734 ; =DeleteWanTableEntry
	bx ip
	.align 2, 0
_0201D734: .word DeleteWanTableEntry
	arm_func_end DeleteWanTableEntryVeneer

	arm_func_start sub_0201D738
sub_0201D738: ; 0x0201D738
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r3, r6, #0x1000
	ldr r3, [r3, #0x500]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	beq _0201D75C
	bl sub_0201D778
_0201D75C:
	mov r0, r5
	mov r1, r4
	bl MemAlloc
	add r1, r6, #0x1000
	str r0, [r1, #0x500]
	str r5, [r1, #0x504]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0201D738

	arm_func_start sub_0201D778
sub_0201D778: ; 0x0201D778
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x1000
	ldr r0, [r0, #0x500]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl MemFree
	add r0, r4, #0x1000
	mov r1, #0
	str r1, [r0, #0x500]
	str r1, [r0, #0x504]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201D778

	arm_func_start sub_0201D7A8
sub_0201D7A8: ; 0x0201D7A8
	stmdb sp!, {r3, lr}
	ldr r0, _0201D7D8 ; =0x00001510
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201D7DC ; =_020AFC64
	ldr r1, _0201D7D8 ; =0x00001510
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0201D7DC ; =_020AFC64
	ldr r0, [r0, #4]
	bl sub_0201D38C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D7D8: .word 0x00001510
_0201D7DC: .word _020AFC64
	arm_func_end sub_0201D7A8

	arm_func_start sub_0201D7E0
sub_0201D7E0: ; 0x0201D7E0
	ldr r2, _0201D7FC ; =_020AFC64
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _0201D800 ; =sub_0201D738
	mov r1, r3
	bx ip
	.align 2, 0
_0201D7FC: .word _020AFC64
_0201D800: .word sub_0201D738
	arm_func_end sub_0201D7E0

	arm_func_start sub_0201D804
sub_0201D804: ; 0x0201D804
	ldr r0, _0201D814 ; =_020AFC64
	ldr ip, _0201D818 ; =sub_0201D778
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201D814: .word _020AFC64
_0201D818: .word sub_0201D778
	arm_func_end sub_0201D804

	arm_func_start sub_0201D81C
sub_0201D81C: ; 0x0201D81C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrb r4, [sp, #0x2c]
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r4, #0
	ldrh r7, [r5, #0xe]
	beq _0201D848
	cmp r4, #1
	beq _0201D8E4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D848:
	cmp r3, #0
	beq _0201D8C0
	mov r8, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =_020AFC4C
	b _0201D8B8
_0201D860:
	ldr r0, [r5]
	mov r2, sl
	ldr r6, [r0, r8, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r6
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0xc]
	ldr r0, [r6, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201D8B8:
	cmp r8, r7
	blo _0201D860
_0201D8C0:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =_020AFC4C
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	bl sub_0201B43C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201D8E4:
	cmp r3, #0
	beq _0201D960
	mov r6, #0
	ldr fp, _0201D988 ; =_020AFC30
	ldr r4, _0201D98C ; =_020AFC4C
	b _0201D958
_0201D8FC:
	ldr r0, [r5]
	mov r2, sl
	ldr r8, [r0, r6, lsl #2]
	str sb, [sp]
	ldr r0, [r4]
	ldr r3, [r5, #4]
	mov r1, r8
	add r0, r0, #0x70
	bl sub_0201B388
	ldr r1, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r1, #4]
	ldrh r2, [r0, #0x7c]
	ldr r0, [r8, #4]
	mov r1, r1, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r6, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r6, r1, lsr #0x10
_0201D958:
	cmp r6, r7
	blo _0201D8FC
_0201D960:
	ldrb r0, [sp, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0201D98C ; =_020AFC4C
	ldr r1, [r5, #4]
	ldr r0, [r0]
	mov r2, sb
	add r0, r0, #0x70
	bl sub_0201B43C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201D988: .word _020AFC30
_0201D98C: .word _020AFC4C
	arm_func_end sub_0201D81C

	arm_func_start sub_0201D990
sub_0201D990: ; 0x0201D990
	stmdb sp!, {r3, lr}
	ldr r1, _0201D9C4 ; =_020AFC3C
	ldr r1, [r1, r2, lsl #2]
	mov r1, r1, lsl #0x10
	add r0, r0, r1, asr #16
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #0x10
	mov r0, r0, asr #0x10
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9C4: .word _020AFC3C
	arm_func_end sub_0201D990

	arm_func_start sub_0201D9C8
sub_0201D9C8: ; 0x0201D9C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldrb lr, [sp, #0x14]
	ldr ip, _0201D9FC ; =_020AFC64
	mov r3, #1
	stmia sp, {r3, lr}
	ldr lr, [ip, #4]
	mov ip, #0x38
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201D81C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201D9FC: .word _020AFC64
	arm_func_end sub_0201D9C8

	arm_func_start sub_0201DA00
sub_0201DA00: ; 0x0201DA00
	ldrb r1, [r0, #8]
	ldr r0, [r0]
	cmp r1, #0
	cmpne r1, #2
	ldreq r0, [r0, #8]
	ldreqsh r0, [r0, #4]
	ldrnesh r0, [r0, #0xc]
	bx lr
	arm_func_end sub_0201DA00

	arm_func_start sub_0201DA20
sub_0201DA20: ; 0x0201DA20
	ldr r2, _0201DA3C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DA40 ; =sub_0201DA00
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA3C: .word _020AFC64
_0201DA40: .word sub_0201DA00
	arm_func_end sub_0201DA20

	arm_func_start WanHasAnimationGroup
WanHasAnimationGroup: ; 0x0201DA44
	ldr r2, [r0]
	ldrsh r0, [r2, #0xc]
	cmp r1, r0
	bge _0201DA70
	cmp r1, #0
	blt _0201DA70
	ldr r0, [r2, #8]
	add r0, r0, r1, lsl #3
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0201DA78
_0201DA70:
	mov r0, #0
	bx lr
_0201DA78:
	mov r0, #1
	bx lr
	arm_func_end WanHasAnimationGroup

	arm_func_start WanTableSpriteHasAnimationGroup
WanTableSpriteHasAnimationGroup: ; 0x0201DA80
	ldr r3, _0201DA9C ; =_020AFC64
	mov r2, #0x38
	ldr r3, [r3, #4]
	ldr ip, _0201DAA0 ; =WanHasAnimationGroup
	smlabb r0, r0, r2, r3
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DA9C: .word _020AFC64
_0201DAA0: .word WanHasAnimationGroup
	arm_func_end WanTableSpriteHasAnimationGroup

	arm_func_start sub_0201DAA4
sub_0201DAA4: ; 0x0201DAA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, [r0, #4]
	mov sl, r1
	mov sb, r2
	cmp r3, #0
	ldrh r7, [r5, #0xe]
	beq _0201DACC
	cmp r3, #1
	beq _0201DB38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DACC:
	mov r8, #0
	mov r6, r8
	ldr r4, _0201DBB0 ; =_020AFC30
	ldr fp, _0201DBB4 ; =_020AFC4C
	b _0201DB2C
_0201DAE0:
	str r6, [sp]
	ldmia r5, {r0, r2}
	ldr r0, [r0, r8, lsl #2]
	mov r1, sl
	mov r3, sb
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r1, [fp]
	ldrh r3, [r2, #4]
	ldrh r2, [r1, #0xc]
	mov r1, r3, lsl #1
	ldrh r1, [r4, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DB2C:
	cmp r8, r7
	blo _0201DAE0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0201DB38:
	mov r8, #0
	mov r4, #1
	ldr fp, _0201DBB0 ; =_020AFC30
	b _0201DBA4
_0201DB48:
	ldr r0, [r5]
	mov r1, sl
	ldr r6, [r0, r8, lsl #2]
	mov r3, sb
	str r4, [sp]
	ldr r2, [r5, #4]
	mov r0, r6
	bl sub_0201BFAC
	ldr r2, [r5, #4]
	ldr r0, _0201DBB4 ; =_020AFC4C
	ldrh r3, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r6, #4]
	ldrh r2, [r1, #0x7c]
	mov r1, r3, lsl #1
	ldrh r1, [fp, r1]
	bl sub_0201D990
	add r0, sl, r0
	add r1, r8, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov sl, r0, lsr #0x10
	mov r8, r1, lsr #0x10
_0201DBA4:
	cmp r8, r7
	blo _0201DB48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201DBB0: .word _020AFC30
_0201DBB4: .word _020AFC4C
	arm_func_end sub_0201DAA4

	arm_func_start sub_0201DBB8
sub_0201DBB8: ; 0x0201DBB8
	stmdb sp!, {r3, lr}
	ldr lr, _0201DBD8 ; =_020AFC64
	mov ip, #0x38
	ldr lr, [lr, #4]
	smlabb r0, r0, ip, lr
	ldr r0, [r0, #0x30]
	bl sub_0201DAA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DBD8: .word _020AFC64
	arm_func_end sub_0201DBB8

	arm_func_start sub_0201DBDC
sub_0201DBDC: ; 0x0201DBDC
	ldr r0, [r0, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _0201DC30
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldrsh r0, [r1, #6]
	addne r1, r0, #0xf
	movne r0, r1, asr #3
	addne r0, r1, r0, lsr #28
	movne r0, r0, lsl #0xc
	addeq r1, r0, #0xff
	moveq r0, r1, asr #7
	addeq r0, r1, r0, lsr #24
	moveq r0, r0, lsl #8
	mov r0, r0, asr #0x10
	bx lr
_0201DC30:
	ldrsh r0, [r1, #6]
	add r1, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, lsl #0xc
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201DBDC

	arm_func_start sub_0201DC4C
sub_0201DC4C: ; 0x0201DC4C
	ldr r2, _0201DC68 ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	ldr ip, _0201DC6C ; =sub_0201DBDC
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	bx ip
	.align 2, 0
_0201DC68: .word _020AFC64
_0201DC6C: .word sub_0201DBDC
	arm_func_end sub_0201DC4C

	arm_func_start SpriteTypeInWanTable
SpriteTypeInWanTable: ; 0x0201DC70
	ldr r2, _0201DC8C ; =_020AFC64
	mov r1, #0x38
	ldr r2, [r2, #4]
	smlabb r0, r0, r1, r2
	ldr r0, [r0, #0x30]
	ldrb r0, [r0, #8]
	bx lr
	.align 2, 0
_0201DC8C: .word _020AFC64
	arm_func_end SpriteTypeInWanTable

	arm_func_start sub_0201DC90
sub_0201DC90: ; 0x0201DC90
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCC8 ; =0x000007C4
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201DCCC ; =_020AFC6C
	ldr r1, _0201DCC8 ; =0x000007C4
	str r0, [r2]
	bl MemZero
	ldr r0, _0201DCCC ; =_020AFC6C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCC8: .word 0x000007C4
_0201DCCC: .word _020AFC6C
	arm_func_end sub_0201DC90

	arm_func_start sub_0201DCD0
sub_0201DCD0: ; 0x0201DCD0
	stmdb sp!, {r3, lr}
	ldr r0, _0201DCF0 ; =_020AFC6C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0201DCF0 ; =_020AFC6C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DCF0: .word _020AFC6C
	arm_func_end sub_0201DCD0

	arm_func_start sub_0201DCF4
sub_0201DCF4: ; 0x0201DCF4
	ldr r0, _0201DD44 ; =_020AFC6C
	mov r2, #0
	ldr r1, [r0]
	mov r3, #1
	strb r2, [r1, #0x7c2]
	ldr r2, [r0]
	mov r1, #0x7c
	b _0201DD30
_0201DD14:
	smlabb r0, r3, r1, r2
	ldrh r0, [r0, #2]
	tst r0, #1
	bxeq lr
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_0201DD30:
	cmp r3, #0x10
	blt _0201DD14
	mov r0, #1
	strb r0, [r2, #0x7c2]
	bx lr
	.align 2, 0
_0201DD44: .word _020AFC6C
	arm_func_end sub_0201DCF4

	arm_func_start sub_0201DD48
sub_0201DD48: ; 0x0201DD48
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0201DD8C ; =_020AFC6C
	mov r6, #1
	mov r4, #0x7c
_0201DD58:
	ldr r0, [r5]
	smlabb r0, r6, r4, r0
	ldrh r1, [r0, #2]
	tst r1, #1
	beq _0201DD70
	bl sub_0201CF5C
_0201DD70:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x10
	blt _0201DD58
	bl sub_0201DCF4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DD8C: .word _020AFC6C
	arm_func_end sub_0201DD48

	arm_func_start sub_0201DD90
sub_0201DD90: ; 0x0201DD90
	stmdb sp!, {r3, lr}
	mov r0, #0x2ec
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201DDF0 ; =_020AFC70
	str r0, [r1]
	bl sub_0201E614
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r1, _0201DDF4 ; =0x06860000
	ldr r0, [r0]
	add r2, r1, #0x30000
	add r0, r0, #0xbc
	mov r3, #0x80
	bl sub_0201E190
	ldr r0, _0201DDF0 ; =_020AFC70
	ldr r2, _0201DDF8 ; =0x06890000
	ldr r1, [r0]
	mov r0, #0x2000
	str r0, [sp]
	add r0, r1, #0xcc
	add r1, r1, #0xbc
	mov r3, #0
	bl sub_0201E314
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DDF0: .word _020AFC70
_0201DDF4: .word 0x06860000
_0201DDF8: .word 0x06890000
	arm_func_end sub_0201DD90

	arm_func_start sub_0201DDFC
sub_0201DDFC: ; 0x0201DDFC
	stmdb sp!, {r3, lr}
	bl sub_0201E5B0
	bl GeomSwapBuffers
	bl sub_0201E544
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201DDFC

	arm_func_start sub_0201DE10
sub_0201DE10: ; 0x0201DE10
	stmdb sp!, {r3, lr}
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xcc
	bl sub_0201E424
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl sub_0201E230
	ldr r0, _0201DE48 ; =_020AFC70
	ldr r0, [r0]
	add r0, r0, #0xbc
	bl sub_0201E1D4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201DE48: .word _020AFC70
	arm_func_end sub_0201DE10

	arm_func_start LoadWteFromRom
LoadWteFromRom: ; 0x0201DE4C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x10c
	mov r5, r1
	mov r6, r0
	ldr r1, _0201DEBC ; =_02099714
	add r0, sp, #0xc
	mov r4, r2
	bl strcpy
	add r0, sp, #0xc
	mov r1, r5
	bl strcat
	add r0, sp, #4
	add r1, sp, #0xc
	mov r2, r4
	bl LoadFileFromRom
	ldr r1, [sp, #4]
	add r0, sp, #0
	bl HandleSir0Translation
	ldr r0, [sp]
	ldr r1, _0201DEC0 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp]
	str r0, [r6, #4]
	add sp, sp, #0x10c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201DEBC: .word _02099714
_0201DEC0: .word _0209971C
	arm_func_end LoadWteFromRom

	arm_func_start LoadWteFromFileDirectory
LoadWteFromFileDirectory: ; 0x0201DEC4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, r1
	mov r1, r2
	add r2, sp, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, [sp]
	add r0, sp, #8
	bl HandleSir0Translation
	ldr r0, [sp, #8]
	ldr r1, _0201DF14 ; =_0209971C
	mov r2, #4
	bl strncmp
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201DF14: .word _0209971C
	arm_func_end LoadWteFromFileDirectory

	arm_func_start UnloadWte
UnloadWte: ; 0x0201DF18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadWte

	arm_func_start sub_0201DF38
sub_0201DF38: ; 0x0201DF38
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x108
	mov r6, r0
	mov r0, #8
	mov r5, r1
	bl MemAlloc
	mov r4, r0
	ldr r1, _0201DFAC ; =_02099714
	add r0, sp, #8
	bl strcpy
	add r0, sp, #8
	mov r1, r6
	bl strcat
	add r0, sp, #0
	add r1, sp, #8
	mov r2, r5
	bl LoadFileFromRom
	ldr r5, [sp]
	ldr r1, _0201DFB0 ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0201DFAC: .word _02099714
_0201DFB0: .word _02099720
	arm_func_end sub_0201DF38

	arm_func_start LoadWtuFromBin
LoadWtuFromBin: ; 0x0201DFB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r6, r1
	mov r1, r5
	mov r0, #8
	bl MemAlloc
	mov r4, r0
	add r2, sp, #0
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r5, [sp]
	ldr r1, _0201E01C ; =_02099720
	str r5, [r4]
	mov r0, r5
	mov r2, #4
	bl strncmp
	ldr r1, [r5, #0xc]
	mov r0, r4
	add r1, r5, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0201E01C: .word _02099720
	arm_func_end LoadWtuFromBin

	arm_func_start sub_0201E020
sub_0201E020: ; 0x0201E020
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
	arm_func_end sub_0201E020

	arm_func_start sub_0201E050
sub_0201E050: ; 0x0201E050
	stmdb sp!, {r3, lr}
	ldr ip, _0201E07C ; =_020AFC70
	str r3, [sp]
	ldr ip, [ip]
	mov lr, r1
	mov r3, r2
	mov r1, r0
	mov r2, lr
	add r0, ip, #0xbc
	bl sub_0201E1E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E07C: .word _020AFC70
	arm_func_end sub_0201E050

	arm_func_start sub_0201E080
sub_0201E080: ; 0x0201E080
	stmdb sp!, {r3, lr}
	mov r2, #2
	ldr r1, _0201E0AC ; =_020AFC70
	str r2, [sp]
	mov r2, #0
	ldr ip, [r1]
	mov r1, r0
	mov r3, r2
	add r0, ip, #0xbc
	bl sub_0201E1E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E0AC: .word _020AFC70
	arm_func_end sub_0201E080

	arm_func_start ProcessWte
ProcessWte: ; 0x0201E0B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov ip, r1
	ldr r1, [r6, #4]
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _0201E0F4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0201E128 ; =_020AFC70
	ldr r3, [r6, #8]
	ldr r0, [r0]
	mov r2, ip
	add r0, r0, #0xbc
	bl sub_0201E1E0
_0201E0F4:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	beq _0201E120
	ldr r0, _0201E128 ; =_020AFC70
	str r4, [sp]
	ldr r0, [r0]
	ldrsh r2, [r6, #0x1c]
	ldr r1, [r6, #0x18]
	mov r3, r5
	add r0, r0, #0xcc
	bl sub_0201E3AC
_0201E120:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0201E128: .word _020AFC70
	arm_func_end ProcessWte

	arm_func_start sub_0201E12C
sub_0201E12C: ; 0x0201E12C
	ldr ip, _0201E138 ; =ProcessWte
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0201E138: .word ProcessWte
	arm_func_end sub_0201E12C

	arm_func_start sub_0201E13C
sub_0201E13C: ; 0x0201E13C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r2, #2
	ldr r1, _0201E180 ; =_020AFC70
	str r2, [sp]
	mov r4, r0
	ldr r0, [r1]
	mov r2, #0
	ldr r1, [r4]
	mov r3, r2
	add r0, r0, #0xbc
	bl sub_0201E1E0
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E180: .word _020AFC70
	arm_func_end sub_0201E13C

	arm_func_start sub_0201E184
sub_0201E184: ; 0x0201E184
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_0201E184

	arm_func_start sub_0201E190
sub_0201E190: ; 0x0201E190
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0x1c
	mul r4, r3, ip
	mov r7, r0
	mov r6, r1
	mov r0, r4
	mov r1, #0
	mov r5, r2
	bl MemAlloc
	mov r1, r4
	str r0, [r7]
	bl MemZero
	mov r0, #0
	strh r0, [r7, #0xc]
	str r6, [r7, #4]
	str r5, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0201E190

	arm_func_start sub_0201E1D4
sub_0201E1D4: ; 0x0201E1D4
	mov r1, #0
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0201E1D4

	arm_func_start sub_0201E1E0
sub_0201E1E0: ; 0x0201E1E0
	stmdb sp!, {r4, lr}
	ldrsh r4, [r0, #0xc]
	cmp r4, #0x80
	mvnge r0, #0
	ldmgeia sp!, {r4, pc}
	ldr lr, [r0]
	mov ip, #0x1c
	smlabb ip, r4, ip, lr
	str r3, [ip, #4]
	str r1, [ip, #8]
	ldrb r3, [sp, #8]
	str r2, [ip, #0xc]
	mov r1, #0
	str r3, [ip, #0x10]
	strb r1, [ip, #0x14]
	ldrsh r1, [r0, #0xc]
	add r1, r1, #1
	strh r1, [r0, #0xc]
	ldrsh r0, [r0, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E1E0

	arm_func_start sub_0201E230
sub_0201E230: ; 0x0201E230
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r7, [r4, #0xc]
	mov r6, #0
	ldr fp, _0201E310 ; =_022A4F38
	mov r5, #0x1c
	b _0201E304
_0201E24C:
	ldr r0, [r4]
	smlabb r1, r6, r5, r0
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0201E274
	cmp r0, #1
	beq _0201E2C8
	cmp r0, #2
	beq _0201E2F0
	b _0201E2F8
_0201E274:
	ldr sl, [r1, #8]
	cmp sl, #0
	beq _0201E2A4
	ldr sb, [r1, #4]
	ldr r8, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2A4:
	ldr r8, [r1, #4]
	ldr sb, [r1, #0xc]
	bl GX_BeginLoadTex
	mov r0, fp
	mov r1, sb
	mov r2, r8
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _0201E2F8
_0201E2C8:
	ldr sl, [r1, #4]
	ldr sb, [r1, #0xc]
	ldr r8, [r1, #8]
	bl GX_BeginLoadTexPltt
	mov r0, r8
	mov r1, sb
	mov r2, sl
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	b _0201E2F8
_0201E2F0:
	ldr r0, [r1, #8]
	bl MemFree
_0201E2F8:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
_0201E304:
	cmp r6, r7
	blt _0201E24C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0201E310: .word _022A4F38
	arm_func_end sub_0201E230

	arm_func_start sub_0201E314
sub_0201E314: ; 0x0201E314
	stmdb sp!, {r4, lr}
	ldr ip, [sp, #8]
	mov r4, r0
	mov r0, ip, asr #7
	add r0, ip, r0, lsr #24
	stmia r4, {r1, ip}
	mov r0, r0, asr #8
	str r0, [r4, #8]
	mov r1, #0
	strb r1, [r4, #0xc]
	str r2, [r4, #0x10]
	str r3, [r4, #0x14]
	mov r0, ip, lsl #1
	bl MemAlloc
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	mov r1, #0
	bl MemAlloc
	str r0, [r4, #0x1c]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x18]
	mov r1, r1, lsl #1
	bl MemZero
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #8]
	bl MemZero
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E314

	arm_func_start sub_0201E380
sub_0201E380: ; 0x0201E380
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	ldr r2, [r5, #0x18]
	add r0, r3, r4, lsl #8
	add r0, r2, r0, lsl #1
	bl Rgb8ToRgb5
	ldr r0, [r5, #0x1c]
	mov r1, #1
	strb r1, [r0, r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0201E380

	arm_func_start sub_0201E3AC
sub_0201E3AC: ; 0x0201E3AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldrsh r4, [sp, #0x20]
	mov r7, r3
	mov sl, r0
	add r6, r4, r7, lsl #8
	mov sb, r1
	mov r8, r2
	mov r5, #0
	mov r4, #1
	b _0201E3FC
_0201E3D4:
	ldr r1, [sl, #0x18]
	add r0, r5, r6
	add r0, r1, r0, lsl #1
	add r1, sb, r5, lsl #2
	bl Rgb8ToRgb5
	add r0, r5, #1
	ldr r1, [sl, #0x1c]
	mov r0, r0, lsl #0x10
	strb r4, [r7, r1]
	mov r5, r0, asr #0x10
_0201E3FC:
	cmp r5, r8
	blt _0201E3D4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0201E3AC

	arm_func_start sub_0201E408
sub_0201E408: ; 0x0201E408
	stmdb sp!, {r3, lr}
	str r3, [sp]
	mov r3, r2
	ldrsh r2, [r1, #6]
	ldr r1, [r1]
	bl sub_0201E3AC
	ldmia sp!, {r3, pc}
	arm_func_end sub_0201E408

	arm_func_start sub_0201E424
sub_0201E424: ; 0x0201E424
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r6, r0
	mov r4, #1
	mov r8, #0x200
	mov r7, r5
	b _0201E480
_0201E444:
	ldr r0, [r6, #0x1c]
	ldrb r0, [r0, r5]
	cmp r0, #0
	beq _0201E47C
	str r4, [sp]
	ldr r1, [r6, #0x18]
	ldr r2, [r6, #0x14]
	ldr r0, [r6]
	mov r3, r8
	add r1, r1, r5, lsl #9
	add r2, r2, r5, lsl #9
	bl sub_0201E1E0
	ldr r0, [r6, #0x1c]
	strb r7, [r0, r5]
_0201E47C:
	add r5, r5, #1
_0201E480:
	ldr r0, [r6, #8]
	cmp r5, r0
	blt _0201E444
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0201E424

	arm_func_start GeomSetTexImageParam
GeomSetTexImageParam: ; 0x0201E494
	ldr ip, [sp, #0xc]
	mov r0, r0, lsl #0x1a
	orr r0, r0, ip, lsr #3
	orr r0, r0, r1, lsl #30
	orr r0, r0, r2, lsl #20
	ldr r1, [sp]
	orr r0, r0, r3, lsl #23
	ldr r2, [sp, #4]
	orr r0, r0, r1, lsl #16
	ldr r3, [sp, #8]
	orr r1, r0, r2, lsl #18
	ldr r0, _0201E4D0 ; =0x040004A8
	orr r1, r1, r3, lsl #29
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E4D0: .word 0x040004A8
	arm_func_end GeomSetTexImageParam

	arm_func_start GeomSetVertexCoord16
GeomSetVertexCoord16: ; 0x0201E4D4
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r1, lsl #0x10
	mov r1, r2, lsl #0x10
	ldr r2, _0201E500 ; =0x0400048C
	orr r0, r3, r0, lsr #16
	str r0, [r2]
	mov r0, r1, lsr #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0201E500: .word 0x0400048C
	arm_func_end GeomSetVertexCoord16

	arm_func_start InitRender3dData
InitRender3dData: ; 0x0201E504
	stmdb sp!, {r3, lr}
	ldr r0, _0201E540 ; =RENDER_3D
	ldr r0, [r0, #0x40]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #0x1a00
	mov r1, #0
	bl MemAlloc
	ldr r1, _0201E540 ; =RENDER_3D
	mov r2, #0
	str r0, [r1, #0x40]
	strh r2, [r1]
	mov r0, #0x80
	strh r0, [r1, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E540: .word RENDER_3D
	arm_func_end InitRender3dData

	arm_func_start sub_0201E544
sub_0201E544: ; 0x0201E544
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r0, _0201E5A4 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r2, _0201E5A8 ; =0x3F1F00C0
	ldr r1, _0201E5AC ; =0x040004A4
	ldr r0, _0201E5A4 ; =RENDER_3D
	str r2, [r1]
	mov r1, #0
	strh r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E5A4: .word RENDER_3D
_0201E5A8: .word 0x3F1F00C0
_0201E5AC: .word 0x040004A4
	arm_func_end sub_0201E544

	arm_func_start sub_0201E5B0
sub_0201E5B0: ; 0x0201E5B0
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	bl Render3dStack
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #0xc]
	bl GeomSetTexImageParam
	ldr r0, _0201E608 ; =RENDER_3D
	mvn r1, #0
	str r1, [r0, #8]
	bl sub_01FF8F04
	ldr r1, _0201E60C ; =0x3F1F00C0
	ldr r0, _0201E610 ; =0x040004A4
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201E608: .word RENDER_3D
_0201E60C: .word 0x3F1F00C0
_0201E610: .word 0x040004A4
	arm_func_end sub_0201E5B0

	arm_func_start sub_0201E614
sub_0201E614: ; 0x0201E614
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0xbc
	bl MemZero
	bl InitRender3dData
	mov r0, r4
	bl sub_0201E634
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E614

	arm_func_start sub_0201E634
sub_0201E634: ; 0x0201E634
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	mov r2, #0
	str r2, [r4, #0xa0]
	mov r0, #0x100000
	str r0, [r4, #0xa4]
	ldr r0, _0201E70C ; =0x007FFFFF
	str r2, [r4, #0xa8]
	mov r1, #0xc0000
	str r1, [r4, #0xac]
	mov r1, #0x1000
	str r1, [r4, #0xb0]
	str r0, [r4, #0xb4]
	str r2, [r4]
	str r2, [r4, #4]
	str r1, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	mov r0, r0, lsl #0xc
	str r0, [r4, #0x20]
	str r2, [r4, #0x24]
	str r1, [r4, #0x28]
	ldr r1, _0201E710 ; =0xBFFF0000
	ldr r0, _0201E714 ; =0x04000580
	str r2, [r4, #0x2c]
	str r1, [r0]
	ldr r0, [r4, #0xb0]
	mov r1, #0x400000
	str r0, [sp]
	ldr r2, [r4, #0xb4]
	mov r0, #1
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xa8]
	ldr r1, [r4, #0xac]
	ldr r2, [r4, #0xa0]
	ldr r3, [r4, #0xa4]
	bl G3i_OrthoW_
	ldr r1, _0201E718 ; =0x0400044C
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	add ip, r4, #0x30
	add r1, r4, #0x24
	add r2, r4, #0x18
	mov r3, #1
	str ip, [sp]
	bl G3i_LookAt_
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0201E70C: .word 0x007FFFFF
_0201E710: .word 0xBFFF0000
_0201E714: .word 0x04000580
_0201E718: .word 0x0400044C
	arm_func_end sub_0201E634

	arm_func_start GeomSwapBuffers
GeomSwapBuffers: ; 0x0201E71C
	ldr r0, _0201E72C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_0201E72C: .word 0x04000540
	arm_func_end GeomSwapBuffers

	arm_func_start InitRender3dElement64
InitRender3dElement64: ; 0x0201E730
	stmdb sp!, {r4, lr}
	mov r1, #0x40
	mov r4, r0
	bl MemZero
	mov r0, #0xff
	strb r0, [r4, #0x2c]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2f]
	mov r0, #0x1000
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	mov r0, #0x40
	strh r0, [r4, #0x2a]
	mov r0, #0
	strb r0, [r4, #0x3e]
	ldmia sp!, {r4, pc}
	arm_func_end InitRender3dElement64

	arm_func_start sub_0201E774
sub_0201E774: ; 0x0201E774
	stmdb sp!, {r4, lr}
	ldrh ip, [r1, #0xc]
	mov r4, r0
	mov r0, r3
	strh ip, [r4, #0x14]
	ldrsh r3, [r1, #0x10]
	strh r3, [r4, #0x16]
	ldrsh r3, [r1, #0x12]
	strh r3, [r4, #0x18]
	ldrsh r3, [r1, #0x14]
	strh r3, [r4, #0x1a]
	ldrsh r3, [r1, #0x16]
	ldrsh r1, [sp, #8]
	strh r3, [r4, #0x1c]
	str r2, [r4, #0x20]
	bl sub_0201E7BC
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E774

	arm_func_start sub_0201E7BC
sub_0201E7BC: ; 0x0201E7BC
	ldr r2, _0201E7D4 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_0201E7D4: .word _020AFC70
	arm_func_end sub_0201E7BC

	arm_func_start sub_0201E7D8
sub_0201E7D8: ; 0x0201E7D8
	stmdb sp!, {r4, lr}
	ldr ip, [r1]
	mov r4, r0
	ldrh lr, [ip, #8]
	mov ip, r2, lsl #3
	ldrsh r0, [sp, #8]
	strh lr, [r4, #0x14]
	ldr lr, [r1, #4]
	ldrsh ip, [lr, ip]
	strh ip, [r4, #0x16]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #2]
	strh ip, [r4, #0x18]
	ldr ip, [r1, #4]
	add ip, ip, r2, lsl #3
	ldrsh ip, [ip, #4]
	strh ip, [r4, #0x1a]
	ldr ip, [r1, #4]
	ldrsh r1, [sp, #0xc]
	add r2, ip, r2, lsl #3
	ldrsh r2, [r2, #6]
	strh r2, [r4, #0x1c]
	str r3, [r4, #0x20]
	bl sub_0201E7BC
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0201E7D8

	arm_func_start Render3d64Texture0x7
Render3d64Texture0x7: ; 0x0201E844
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl sub_01FF8D6C
	ldrsh r1, [r4]
	mov r5, #0
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb r6, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r6, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
_0201E8F0:
	mov r1, #0x18
	mul r6, r5, r1
	mov r1, r6, lsl #0x10
	mov ip, r1, asr #0x10
	mov r1, #0x1f
	mov r3, #0x18
	and r7, r5, #1
	mov lr, #0
	mov r2, r1
	mov sb, r3
_0201E918:
	mul r8, lr, sb
	ldrsh sl, [r4]
	tst lr, #1
	add sl, sl, r8
	strh sl, [r0, #0x16]
	ldrsh sl, [r4, #2]
	add sl, sl, r6
	strh sl, [r0, #0x18]
	strh r8, [r0, #0xc]
	strh ip, [r0, #0xe]
	strh r3, [r0, #0x10]
	strh r3, [r0, #0x12]
	beq _0201E988
	cmp r7, #0
	streqh r2, [r0, #0x22]
	beq _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
	b _0201E9C0
_0201E988:
	cmp r7, #0
	strneh r1, [r0, #0x22]
	bne _0201E9C0
	ldrb r8, [r4, #0x2e]
	ldrb sl, [r4, #0x2d]
	ldrb fp, [r4, #0x2c]
	and r8, r8, #0xf8
	mov r8, r8, lsl #0x17
	and fp, fp, #0xf8
	and sl, sl, #0xf8
	mov sl, sl, lsl #2
	orr r8, sl, r8, lsr #16
	orr r8, r8, fp, asr #3
	strh r8, [r0, #0x22]
_0201E9C0:
	add r8, lr, #1
	mov r8, r8, lsl #0x10
	mov lr, r8, asr #0x10
	cmp lr, #0xa
	blt _0201E918
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	cmp r5, #8
	blt _0201E8F0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64Texture0x7

	arm_func_start Render3d64WindowFrame
Render3d64WindowFrame: ; 0x0201E9EC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov sl, r0
	add r5, sp, #0xc
	mov r6, sl
	mov r4, #4
_0201EA04:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0201EA04
	mov r0, #5
	strb r0, [sp, #0x48]
	ldrsh r1, [sl, #4]
	ldrsh r2, [sl, #6]
	cmp r1, #0x10
	addle r0, r1, r1, lsr #31
	movgt r3, #8
	movle r0, r0, lsl #0xf
	movle r3, r0, asr #0x10
	cmp r2, #0x10
	addle r0, r2, r2, lsr #31
	movgt r6, #8
	movle r0, r0, lsl #0xf
	movle r6, r0, asr #0x10
	ldrsh r0, [sl]
	str r0, [sp]
	ldrsh r8, [sl, #2]
	ldr r4, [sp]
	add r0, sp, #0xc
	add r4, r4, r3
	add r5, r8, r6
	mov r4, r4, lsl #0x10
	mov r7, r5, lsl #0x10
	mov r5, r4, asr #0x10
	mov r4, r7, asr #0x10
	ldr r7, [sp]
	add sb, r8, r2
	strh r7, [sp, #0xc]
	ldr r7, [sp]
	mov r2, sb, lsl #0x10
	add fp, r7, r1
	sub r1, fp, r3
	mov r3, r1, lsl #0x10
	sub r1, sb, r6
	mov r7, r1, lsl #0x10
	mov r1, fp, lsl #0x10
	mov r6, r3, asr #0x10
	strh r8, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh ip, [sl, #0x16]
	mov r1, r1, asr #0x10
	mov r3, #8
	strh ip, [sp, #0x22]
	ldrsh ip, [sl, #0x18]
	mov r7, r7, asr #0x10
	str r1, [sp, #8]
	strh ip, [sp, #0x24]
	strh r3, [sp, #0x26]
	strh r3, [sp, #0x28]
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r6, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	mov r1, #8
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh fp, [sp, #0x10]
	strh r4, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	mov r1, #8
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	strh r4, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh r7, [sp, #0x12]
	strh r0, [sp, #0xc]
	ldrsh r0, [sl, #0x16]
	strh r0, [sp, #0x22]
	ldrsh r0, [sl, #0x18]
	add r0, r0, #8
	strh r0, [sp, #0x24]
	mov r1, #8
	add r0, sp, #0xc
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r4, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	strh r7, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #8
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	ldr r0, [sp]
	mov r1, #8
	strh r0, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r5, [sp, #0x10]
	strh sb, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r5, [sp, #0xc]
	strh r7, [sp, #0xe]
	strh r6, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #8
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #8
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	strh r6, [sp, #0xc]
	strh r7, [sp, #0xe]
	ldr r0, [sp, #8]
	mov r1, #8
	strh r0, [sp, #0x10]
	ldr r0, [sp, #4]
	strh r0, [sp, #0x12]
	ldrsh r2, [sl, #0x16]
	add r0, sp, #0xc
	add r2, r2, #0x10
	strh r2, [sp, #0x22]
	ldrsh r2, [sl, #0x18]
	add r2, r2, #0x10
	strh r2, [sp, #0x24]
	strh r1, [sp, #0x26]
	strh r1, [sp, #0x28]
	bl EnqueueRender3d64Tiling
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Render3d64WindowFrame

	arm_func_start EnqueueRender3d64Tiling
EnqueueRender3d64Tiling: ; 0x0201EC9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_01FF8D9C
	ldrsh r2, [r4]
	mov r1, #0
	strh r2, [r0, #0x16]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x18]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x1a]
	ldrsh r2, [r4, #2]
	strh r2, [r0, #0x1c]
	ldrsh r2, [r4]
	strh r2, [r0, #0x1e]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x20]
	ldrsh r2, [r4, #4]
	strh r2, [r0, #0x22]
	ldrsh r2, [r4, #6]
	strh r2, [r0, #0x24]
_0201ECEC:
	ldrb r3, [r4, #0x2e]
	ldrb r2, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r2, #0xf8
	mov r2, ip, lsl #0x17
	mov ip, r3, lsl #2
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	and lr, lr, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, lr, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ECEC
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201ED74:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201ED74
	ldmia sp!, {r4, pc}
	arm_func_end EnqueueRender3d64Tiling

	arm_func_start Render3d64Tiling
Render3d64Tiling: ; 0x0201ED88
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_01FF8D9C
	mov r1, #0
_0201ED98:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #0x16]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #0x18]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x26]
	cmp r1, #4
	blt _0201ED98
	ldrb r1, [r4, #0x2f]
	add r3, r4, #0x16
	add r2, r0, #0xc
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x31]
	ldrh ip, [r4, #0x28]
	mov r1, #4
	strh ip, [r0, #0x2e]
	ldr ip, [r4, #0x20]
	str ip, [r0, #4]
	ldr ip, [r4, #0x24]
	str ip, [r0, #8]
	ldrb ip, [r4, #0x3e]
	strb ip, [r0, #0x30]
	ldrh ip, [r4, #0x2a]
	strh ip, [r0, #2]
	ldrh r4, [r4, #0x14]
	strh r4, [r0, #0x14]
_0201EE3C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _0201EE3C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Tiling

	arm_func_start Render3d64Quadrilateral
Render3d64Quadrilateral: ; 0x0201EE50
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_01FF8D3C
	mov r1, #0
_0201EE60:
	mov r2, r1, lsl #2
	ldrsh r2, [r4, r2]
	add ip, r0, r1, lsl #2
	add r5, r4, r1, lsl #2
	strh r2, [ip, #4]
	ldrsh r2, [r5, #2]
	add r3, r0, r1, lsl #1
	add r1, r1, #1
	strh r2, [ip, #6]
	ldrb ip, [r5, #0x2e]
	ldrb r2, [r5, #0x2d]
	ldrb r5, [r5, #0x2c]
	and lr, ip, #0xf8
	and ip, r2, #0xf8
	mov r2, lr, lsl #0x17
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r2, ip, r2, lsr #16
	orr r2, r2, r5, asr #3
	strh r2, [r3, #0x1a]
	cmp r1, #4
	blt _0201EE60
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Render3d64Quadrilateral

	arm_func_start Render3d64RectangleMulticolor
Render3d64RectangleMulticolor: ; 0x0201EEF0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_01FF8D0C
	ldrh r1, [r4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrb r1, [r4, #0x3d]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	strb r1, [r0, #0x24]
	tst r1, #0xff
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	beq _0201F034
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldrb r2, [r4, #0x32]
	ldrb r1, [r4, #0x31]
	ldrb ip, [r4, #0x30]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1c]
	ldrb r2, [r4, #0x36]
	ldrb r1, [r4, #0x35]
	ldrb ip, [r4, #0x34]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1e]
	ldrb r2, [r4, #0x3a]
	ldrb r1, [r4, #0x39]
	ldrb r4, [r4, #0x38]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
_0201F034:
	ldrb r4, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, r4, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x1a]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64RectangleMulticolor

	arm_func_start Render3d64Rectangle
Render3d64Rectangle: ; 0x0201F05C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_01FF8D0C
	ldrh r1, [r4]
	mov r2, #0
	strh r1, [r0, #4]
	ldrh r1, [r4, #2]
	strh r1, [r0, #6]
	ldrh r1, [r4, #4]
	strh r1, [r0, #8]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	ldrb r3, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb lr, [r4, #0x2c]
	and ip, r3, #0xf8
	and r3, r1, #0xf8
	mov r1, ip, lsl #0x17
	mov r3, r3, lsl #2
	and ip, lr, #0xf8
	orr r1, r3, r1, lsr #16
	orr r1, r1, ip, asr #3
	strh r1, [r0, #0x1a]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x23]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x14]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x16]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x18]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x22]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	strb r2, [r0, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Rectangle

	arm_func_start Render3d64Nothing
Render3d64Nothing: ; 0x0201F108
	bx lr
	arm_func_end Render3d64Nothing

	arm_func_start Render3d64Texture
Render3d64Texture: ; 0x0201F10C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_01FF8D6C
	ldrsh r1, [r4]
	add ip, r4, #0x16
	add r3, r0, #0xc
	strh r1, [r0, #0x16]
	ldrsh r1, [r4, #2]
	mov r2, #4
	strh r1, [r0, #0x18]
	ldrsh r1, [r4, #8]
	strh r1, [r0, #0x1a]
	ldrsh r1, [r4, #0xa]
	strh r1, [r0, #0x1c]
_0201F144:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _0201F144
	ldrb r2, [r4, #0x2e]
	ldrb r1, [r4, #0x2d]
	ldrb ip, [r4, #0x2c]
	and r3, r2, #0xf8
	and r2, r1, #0xf8
	mov r1, r3, lsl #0x17
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr r1, r2, r1, lsr #16
	orr r1, r1, r3, asr #3
	strh r1, [r0, #0x22]
	ldrb r1, [r4, #0x2f]
	and r1, r1, #0xf8
	mov r1, r1, asr #3
	strb r1, [r0, #0x27]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0x12]
	strh r1, [r0, #0x20]
	ldrh r1, [r4, #0x28]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #0x20]
	str r1, [r0, #4]
	ldr r1, [r4, #0x24]
	str r1, [r0, #8]
	ldrb r1, [r4, #0x3e]
	strb r1, [r0, #0x26]
	ldrh r1, [r4, #0x2a]
	strh r1, [r0, #2]
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end Render3d64Texture

	arm_func_start Render3dElement64
Render3dElement64: ; 0x0201F1D4
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #0x3d]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldrb r1, [r0, #0x2f]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r0, #0x3c]
	ldr r1, _0201F204 ; =RENDER_3D_FUNCTIONS_64
	ldr r1, [r1, r2, lsl #2]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F204: .word RENDER_3D_FUNCTIONS_64
	arm_func_end Render3dElement64

	arm_func_start sub_0201F208
sub_0201F208: ; 0x0201F208
	stmdb sp!, {r3, lr}
	ldr r0, _0201F240 ; =0x00001544
	mov r1, #0
	bl MemAlloc
	ldr r2, _0201F244 ; =_020AFCE4
	ldr r1, _0201F240 ; =0x00001544
	str r0, [r2]
	bl MemZero
	ldr r0, _0201F244 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0201F240: .word 0x00001544
_0201F244: .word _020AFCE4
	arm_func_end sub_0201F208

	arm_func_start sub_0201F248
sub_0201F248: ; 0x0201F248
	ldr r1, _0201F29C ; =_020AFCE4
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0x542]
	ldr r3, [r1]
	mov r1, #0x44
	b _0201F284
_0201F268:
	smlabb r0, r2, r1, r3
	ldrb r0, [r0, #0x40]
	cmp r0, #0
	bxeq lr
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_0201F284:
	cmp r2, #0x50
	blt _0201F268
	add r0, r3, #0x1000
	mov r1, #1
	strb r1, [r0, #0x542]
	bx lr
	.align 2, 0
_0201F29C: .word _020AFCE4
	arm_func_end sub_0201F248

	arm_func_start sub_0201F2A0
sub_0201F2A0: ; 0x0201F2A0
	ldr ip, _0201F2A8 ; =Render3dElement64
	bx ip
	.align 2, 0
_0201F2A8: .word Render3dElement64
	arm_func_end sub_0201F2A0

	arm_func_start sub_0201F2AC
sub_0201F2AC: ; 0x0201F2AC
	stmdb sp!, {r4, lr}
	ldr r2, _0201F2E0 ; =_020AFCE4
	mov r1, #0x44
	smulbb r4, r0, r1
	ldr r0, [r2]
	add r0, r0, r4
	bl InitRender3dElement64
	ldr r0, _0201F2E0 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	strb r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F2E0: .word _020AFCE4
	arm_func_end sub_0201F2AC

	arm_func_start sub_0201F2E4
sub_0201F2E4: ; 0x0201F2E4
	stmdb sp!, {r4, lr}
	mov r4, #0
_0201F2EC:
	mov r0, r4
	bl sub_0201F2AC
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	blt _0201F2EC
	ldr r0, _0201F320 ; =_020AFCE4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1500
	strh r1, [r0, #0x40]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0201F320: .word _020AFCE4
	arm_func_end sub_0201F2E4

	arm_func_start sub_0201F324
sub_0201F324: ; 0x0201F324
	ldr r2, _0201F344 ; =_020AFCE4
	mov r1, #0x44
	ldr r2, [r2]
	smlabb r0, r0, r1, r2
	ldrb r1, [r0, #0x40]
	cmp r1, #0
	moveq r0, #0
	bx lr
	.align 2, 0
_0201F344: .word _020AFCE4
	arm_func_end sub_0201F324

	arm_func_start sub_0201F348
sub_0201F348: ; 0x0201F348
	ldr r3, _0201F368 ; =_020AFCE4
	mov r2, #0x44
	ldr r3, [r3]
	smlabb r2, r0, r2, r3
	ldrb r0, [r2, #0x40]
	cmp r0, #0
	strneb r1, [r2, #0x41]
	bx lr
	.align 2, 0
_0201F368: .word _020AFCE4
	arm_func_end sub_0201F348

	arm_func_start sub_0201F36C
sub_0201F36C: ; 0x0201F36C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F460 ; =_020AFCE4
	mov ip, #0
	ldr lr, [r0]
	mov r5, ip
	add r0, lr, #0x1500
	ldrsh r4, [r0, #0x40]
	mov r2, #0x44
	b _0201F3F8
_0201F390:
	cmp r4, #0x50
	movge r4, r5
	smlabb r3, r4, r2, lr
	ldrb r0, [r3, #0x40]
	cmp r0, #0
	bne _0201F3E0
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #1
	strb r0, [r3, #0x40]
	ldr r0, [r1]
	add r2, r4, #1
	add r0, r0, #0x1500
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x1500
	ldrsh r1, [r0, #0x40]
	cmp r1, #0x50
	movge r1, #0
	strgeh r1, [r0, #0x40]
	b _0201F410
_0201F3E0:
	add r0, ip, #1
	add r1, r4, #1
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov ip, r0, asr #0x10
	mov r4, r1, asr #0x10
_0201F3F8:
	cmp ip, #0x50
	blt _0201F390
	mov r1, #1
	add r0, lr, #0x1000
	strb r1, [r0, #0x542]
	sub r4, r1, #2
_0201F410:
	mvn r0, #0
	cmp r4, r0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0201F460 ; =_020AFCE4
	mov r0, #0x44
	smulbb r5, r4, r0
	ldr r0, [r1]
	add r0, r0, r5
	bl InitRender3dElement64
	ldr r1, _0201F460 ; =_020AFCE4
	mov r3, #1
	ldr r2, [r1]
	mov r0, r4
	add r2, r2, r5
	strb r3, [r2, #0x40]
	ldr r1, [r1]
	add r1, r1, r5
	strb r3, [r1, #0x41]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F460: .word _020AFCE4
	arm_func_end sub_0201F36C

	arm_func_start sub_0201F464
sub_0201F464: ; 0x0201F464
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0201F4B0 ; =_020AFCE4
	mov r4, #0
	ldr r5, [r0]
_0201F474:
	ldrb r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r0, [r5, #0x41]
	cmpne r0, #0
	beq _0201F490
	mov r0, r5
	bl Render3dElement64
_0201F490:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	cmp r4, #0x50
	add r5, r5, #0x44
	blt _0201F474
	bl sub_0201F248
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0201F4B0: .word _020AFCE4
	arm_func_end sub_0201F464

	arm_func_start HandleSir0Translation
HandleSir0Translation: ; 0x0201F4B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrb r2, [r4]
	mov r5, r0
	mov r0, #0
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x30
	bne _0201F500
	mov r1, #0x4f
	mov r0, r4
	strb r1, [r4, #3]
	bl ConvertPointersSir0
	mov r0, #1
	b _0201F520
_0201F500:
	cmp r2, #0x53
	ldreqb r1, [r4, #1]
	cmpeq r1, #0x49
	ldreqb r1, [r4, #2]
	cmpeq r1, #0x52
	ldreqb r1, [r4, #3]
	cmpeq r1, #0x4f
	moveq r0, #2
_0201F520:
	cmp r0, #0
	ldrne r1, [r4, #4]
	strne r1, [r5]
	streq r4, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end HandleSir0Translation

	arm_func_start ConvertPointersSir0
ConvertPointersSir0: ; 0x0201F534
	stmdb sp!, {r4, r5}
	ldr r1, [r0, #8]
	mov r3, r0
	add r1, r1, r0
_0201F544:
	mov r2, #0
_0201F548:
	ldrb r4, [r1]
	add r1, r1, #1
	mov r2, r2, lsl #7
	and r5, r4, #0x7f
	orr r2, r2, r5
	and r5, r4, #0x80
	cmp r5, #0
	bne _0201F548
	cmp r2, #0
	beq _0201F584
	add r3, r3, r2
	ldr r2, [r3]
	add r2, r2, r0
	str r2, [r3]
	b _0201F544
_0201F584:
	ldmia sp!, {r4, r5}
	bx lr
	arm_func_end ConvertPointersSir0

	arm_func_start HandleSir0TranslationVeneer
HandleSir0TranslationVeneer: ; 0x0201F58C
	ldr ip, _0201F594 ; =HandleSir0Translation
	bx ip
	.align 2, 0
_0201F594: .word HandleSir0Translation
	arm_func_end HandleSir0TranslationVeneer

	arm_func_start sub_0201F598
sub_0201F598: ; 0x0201F598
	str r1, [r0]
	strh r2, [r0, #4]
	ldrsh r1, [sp]
	strh r3, [r0, #6]
	ldrb r2, [sp, #4]
	strh r1, [r0, #8]
	mov r1, #0
	strb r2, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	arm_func_end sub_0201F598

	arm_func_start DecompressAtNormalVeneer
DecompressAtNormalVeneer: ; 0x0201F5C0
	ldr ip, _0201F5C8 ; =DecompressAtNormal
	bx ip
	.align 2, 0
_0201F5C8: .word DecompressAtNormal
	arm_func_end DecompressAtNormalVeneer

	arm_func_start DecompressAtNormal
DecompressAtNormal: ; 0x0201F5CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldrb r5, [r2]
	mov ip, #0
	ldrb r4, [r2, #5]
	cmp r5, #0x50
	ldreqb r6, [r2, #1]
	ldrb r3, [r2, #6]
	mov lr, ip
	cmpeq r6, #0x4b
	ldreqb r6, [r2, #2]
	add r3, r4, r3, lsl #8
	mov r4, #8
	cmpeq r6, #0x44
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F644
	ldrb r7, [r2, #0x10]
	ldrb r6, [r2, #0x11]
	ldrb r8, [r2, #0x12]
	ldrb r5, [r2, #0x13]
	add r6, r7, r6, lsl #8
	add r6, r6, r8, lsl #16
	add r5, r6, r5, lsl #24
	cmp r1, #0
	cmpne r1, r5
	movne r0, ip
	bne _0201FA08
	mov r5, #0x14
	b _0201F6B4
_0201F644:
	cmp r5, #0x41
	ldreqb r6, [r2, #1]
	cmpeq r6, #0x54
	ldreqb r6, [r2, #2]
	cmpeq r6, #0x34
	ldreqb r6, [r2, #3]
	cmpeq r6, #0x50
	bne _0201F688
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r1, #0
	add r5, r6, r5, lsl #8
	cmpne r1, r5
	movne r0, #0
	bne _0201FA08
	mov r5, #0x12
	b _0201F6B4
_0201F688:
	cmp r5, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x33
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	moveq r5, #0x10
	beq _0201F6B4
	mov r0, #0
	b _0201FA08
_0201F6B4:
	ldrb r6, [r2, #4]
	cmp r6, #0x4e
	bne _0201F6E8
	mov r4, #0
	b _0201F6D8
_0201F6C8:
	add r1, r2, r4
	ldrb r1, [r1, #7]
	strb r1, [r0, r4]
	add r4, r4, #1
_0201F6D8:
	cmp r4, r3
	blt _0201F6C8
	mov r0, r4
	b _0201FA08
_0201F6E8:
	ldrb r6, [r2, #7]
	ldrb sb, [r2, #8]
	ldrb r8, [r2, #9]
	add r6, r6, #3
	str r6, [sp, #0x18]
	add r6, sb, #3
	str r6, [sp, #0x14]
	add r6, r8, #3
	ldrb r7, [r2, #0xa]
	str r6, [sp, #0x10]
	ldrb sl, [r2, #0xb]
	add r6, r7, #3
	str r6, [sp, #0xc]
	add r6, sl, #3
	ldrb r7, [r2, #0xf]
	ldrb fp, [r2, #0xc]
	str r6, [sp, #8]
	ldrb r8, [r2, #0xe]
	add r6, fp, #3
	str r6, [sp, #4]
	ldrb r6, [r2, #0xd]
	add fp, r8, #3
	add sl, r7, #3
	add r6, r6, #3
	str r6, [sp]
	b _0201F9FC
_0201F750:
	cmp r1, #0
	beq _0201F764
	cmp ip, r1
	movge r0, #0
	bge _0201FA08
_0201F764:
	cmp r4, #8
	ldreqb lr, [r2, r5]
	addeq r5, r5, #1
	moveq r4, #0
	tst lr, #0x80
	bne _0201F9E4
	ldrb r8, [r2, r5]
	ldr sb, [sp, #0x18]
	add r7, r2, r5
	and r6, r8, #0xf0
	mov r6, r6, asr #4
	add r6, r6, #3
	cmp r6, sb
	ldr sb, [sp, #0x14]
	moveq r6, #0x1f
	cmp r6, sb
	ldr sb, [sp, #0x10]
	moveq r6, #0x1e
	cmp r6, sb
	ldr sb, [sp, #0xc]
	moveq r6, #0x1d
	cmp r6, sb
	ldr sb, [sp, #8]
	moveq r6, #0x1c
	cmp r6, sb
	ldr sb, [sp, #4]
	moveq r6, #0x1b
	cmp r6, sb
	ldr sb, [sp]
	moveq r6, #0x1a
	cmp r6, sb
	moveq r6, #0x19
	cmp r6, fp
	moveq r6, #0x18
	cmp r6, sl
	moveq r6, #0x17
	sub sb, r6, #0x17
	and r8, r8, #0xf
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201F9A8
_0201F808: ; jump table
	b _0201F97C ; case 0
	b _0201F950 ; case 1
	b _0201F924 ; case 2
	b _0201F8FC ; case 3
	b _0201F8D0 ; case 4
	b _0201F8A4 ; case 5
	b _0201F878 ; case 6
	b _0201F850 ; case 7
	b _0201F82C ; case 8
_0201F82C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	and r6, r8, #0xf
	orr r6, r6, r6, lsl #4
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F850:
	add r5, r5, #1
	add r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F878:
	add r5, r5, #1
	add r6, r0, ip
	sub r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8A4:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	sub r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8D0:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	sub r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F8FC:
	add r5, r5, #1
	sub r6, r8, #1
	and r6, r6, #0xf
	orr r7, r6, r8, lsl #4
	orr r6, r6, r6, lsl #4
	strb r7, [r0, ip]
	add r7, r0, ip
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F924:
	add r5, r5, #1
	add r6, r0, ip
	add r7, r8, #1
	and r7, r7, #0xf
	orr r7, r7, r8, lsl #4
	strb r7, [r0, ip]
	and r7, r8, #0xf
	orr r7, r7, r7, lsl #4
	strb r7, [r6, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F950:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	add r6, r8, #1
	mov r6, r6, lsl #0x1c
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F97C:
	add r5, r5, #1
	add r7, r0, ip
	orr r6, r8, r8, lsl #4
	strb r6, [r0, ip]
	mov r6, r8, lsl #0x1c
	add r8, r8, #1
	and r8, r8, #0xf
	orr r6, r8, r6, lsr #24
	strb r6, [r7, #1]
	add ip, ip, #2
	b _0201F9F4
_0201F9A8:
	ldrb sb, [r7, #1]
	sub r7, ip, #0x1000
	add r5, r5, #2
	add r8, sb, r8, lsl #8
	add sb, r8, r7
	mov r8, #0
	b _0201F9D8
_0201F9C4:
	ldrb r7, [r0, sb]
	add sb, sb, #1
	add r8, r8, #1
	strb r7, [r0, ip]
	add ip, ip, #1
_0201F9D8:
	cmp r8, r6
	blt _0201F9C4
	b _0201F9F4
_0201F9E4:
	ldrb r6, [r2, r5]
	add r5, r5, #1
	strb r6, [r0, ip]
	add ip, ip, #1
_0201F9F4:
	add r4, r4, #1
	mov lr, lr, lsl #1
_0201F9FC:
	cmp r5, r3
	blt _0201F750
	mov r0, ip
_0201FA08:
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtNormal

	arm_func_start DecompressAtHalf
DecompressAtHalf: ; 0x0201FA10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldrb r4, [r2]
	ldrb r6, [r2, #5]
	ldrb r5, [r2, #6]
	cmp r4, #0x50
	mov ip, #0
	add sl, r6, r5, lsl #8
	ldreqb r5, [r2, #1]
	str ip, [sp, #0x30]
	mov lr, #8
	cmpeq r5, #0x4b
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x44
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FA88
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	ldrb r7, [r2, #0x12]
	ldrb r4, [r2, #0x13]
	add r5, r6, r5, lsl #8
	add r5, r5, r7, lsl #16
	add r4, r5, r4, lsl #24
	cmp r1, #0
	cmpne r1, r4
	movne r0, ip
	bne _0201FF44
	mov r8, #0x14
	b _0201FB18
_0201FA88:
	cmp r4, #0x41
	ldreqb r5, [r2, #1]
	cmpeq r5, #0x54
	ldreqb r5, [r2, #2]
	cmpeq r5, #0x34
	ldreqb r5, [r2, #3]
	cmpeq r5, #0x50
	bne _0201FAEC
	ldrb r4, [r2, #4]
	ldrb r6, [r2, #0x10]
	ldrb r5, [r2, #0x11]
	cmp r4, #0x4e
	add r4, r6, r5, lsl #8
	bne _0201FAD4
	cmp r1, #0
	cmpne r1, sl
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FAD4:
	cmp r1, #0
	cmpne r1, r4
	movne r0, #0
	bne _0201FF44
	mov r8, #0x12
	b _0201FB18
_0201FAEC:
	cmp r4, #0x41
	ldreqb r4, [r2, #1]
	cmpeq r4, #0x54
	ldreqb r4, [r2, #2]
	cmpeq r4, #0x33
	ldreqb r4, [r2, #3]
	cmpeq r4, #0x50
	moveq r8, #0x10
	beq _0201FB18
	mov r0, #0
	b _0201FF44
_0201FB18:
	ldrb r4, [r2, #4]
	cmp r4, #0x4e
	bne _0201FB78
	mov r5, #0
	b _0201FB68
_0201FB2C:
	add r6, r2, r5
	ldrb r4, [r6, #7]
	add r1, r0, r5, lsl #1
	ands r4, r4, #0xf
	strb r4, [r0, r5, lsl #1]
	orrne r4, r4, r3
	strneb r4, [r1]
	ldrb r4, [r6, #7]
	add r5, r5, #1
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	strb r4, [r1, #1]
	ands r4, r4, #0xff
	orrne r4, r4, r3
	strneb r4, [r1, #1]
_0201FB68:
	cmp r5, sl
	blt _0201FB2C
	mov r0, r5
	b _0201FF44
_0201FB78:
	ldrb r4, [r2, #7]
	ldrb r7, [r2, #8]
	ldrb r6, [r2, #9]
	add r4, r4, #3
	str r4, [sp, #0x24]
	add r4, r7, #3
	str r4, [sp, #0x20]
	add r4, r6, #3
	ldrb r5, [r2, #0xa]
	str r4, [sp, #0x1c]
	ldrb sb, [r2, #0xb]
	add r4, r5, #3
	str r4, [sp, #0x18]
	add r4, sb, #3
	str r4, [sp, #0x14]
	ldrb r4, [r2, #0xc]
	ldrb r6, [r2, #0xd]
	ldrb r5, [r2, #0xe]
	add r4, r4, #3
	str r4, [sp, #0x10]
	add r4, r6, #3
	str r4, [sp, #0xc]
	add r4, r5, #3
	str r4, [sp, #8]
	ldrb r4, [r2, #0xf]
	mov r1, r1, lsl #1
	add r4, r4, #3
	str r4, [sp, #4]
	b _0201FF38
_0201FBEC:
	cmp r1, #0
	beq _0201FC00
	cmp ip, r1
	movge r0, #0
	bge _0201FF44
_0201FC00:
	cmp lr, #8
	ldreqb r4, [r2, r8]
	addeq r8, r8, #1
	moveq lr, #0
	streq r4, [sp, #0x30]
	ldr r4, [sp, #0x30]
	tst r4, #0x80
	bne _0201FEEC
	add r4, r2, r8
	str r4, [sp]
	ldrb r4, [r2, r8]
	ldr sb, [sp, #0x24]
	str r4, [sp, #0x28]
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x28]
	and r4, r4, #0xf0
	mov r4, r4, asr #4
	ands fp, r5, #0xf
	add r6, r6, #1
	sub r7, r7, #1
	mov r5, fp
	add r4, r4, #3
	and r6, r6, #0xf
	orrne r5, fp, r3
	cmp r6, #0
	and r7, r7, #0xf
	orrne r6, r6, r3
	cmp r7, #0
	orrne r7, r7, r3
	cmp r4, sb
	ldr sb, [sp, #0x20]
	moveq r4, #0x1f
	cmp r4, sb
	ldr sb, [sp, #0x1c]
	moveq r4, #0x1e
	cmp r4, sb
	ldr sb, [sp, #0x18]
	moveq r4, #0x1d
	cmp r4, sb
	ldr sb, [sp, #0x14]
	moveq r4, #0x1c
	cmp r4, sb
	ldr sb, [sp, #0x10]
	moveq r4, #0x1b
	cmp r4, sb
	ldr sb, [sp, #0xc]
	moveq r4, #0x1a
	cmp r4, sb
	ldr sb, [sp, #8]
	moveq r4, #0x19
	cmp r4, sb
	ldr sb, [sp, #4]
	moveq r4, #0x18
	cmp r4, sb
	moveq r4, #0x17
	sub sb, r4, #0x17
	str sb, [sp, #0x2c]
	cmp sb, #8
	addls pc, pc, sb, lsl #2
	b _0201FEAC
_0201FCF4: ; jump table
	b _0201FE80 ; case 0
	b _0201FE54 ; case 1
	b _0201FE28 ; case 2
	b _0201FDFC ; case 3
	b _0201FDC8 ; case 4
	b _0201FD9C ; case 5
	b _0201FD70 ; case 6
	b _0201FD44 ; case 7
	b _0201FD18 ; case 8
_0201FD18:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD44:
	and r4, r6, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FD70:
	strb r7, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FD9C:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r7, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FDC8:
	orr r5, fp, r3
	add r8, r8, #1
	and r4, r5, #0xff
	sub r6, r5, #1
	strb r4, [r0, ip]
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FDFC:
	and r4, r7, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r6, ip, #1
	strb r5, [r0, r6]
	add r5, ip, #2
	strb r4, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FE28:
	strb r6, [r0, ip]
	and r5, r5, #0xff
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r5, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE54:
	and r5, r5, #0xff
	strb r5, [r0, ip]
	add r8, r8, #1
	add r4, ip, #1
	strb r5, [r0, r4]
	add r4, ip, #2
	strb r5, [r0, r4]
	add r4, ip, #3
	strb r6, [r0, r4]
	add ip, ip, #4
	b _0201FF28
_0201FE80:
	and r4, r5, #0xff
	strb r4, [r0, ip]
	add r8, r8, #1
	add r5, ip, #1
	strb r4, [r0, r5]
	add r5, ip, #2
	strb r6, [r0, r5]
	add r5, ip, #3
	strb r4, [r0, r5]
	add ip, ip, #4
	b _0201FF28
_0201FEAC:
	ldr r5, [sp]
	add r8, r8, #2
	ldrb r6, [r5, #1]
	sub r5, ip, #0x2000
	add r6, r6, fp, lsl #8
	add r7, r5, r6, lsl #1
	mov r6, #0
	b _0201FEE0
_0201FECC:
	ldrb r5, [r0, r7]
	add r7, r7, #1
	add r6, r6, #1
	strb r5, [r0, ip]
	add ip, ip, #1
_0201FEE0:
	cmp r6, r4, lsl #1
	blt _0201FECC
	b _0201FF28
_0201FEEC:
	ldrb r5, [r2, r8]
	add r4, r0, ip
	ands r5, r5, #0xf
	strb r5, [r0, ip]
	orrne r5, r5, r3
	strneb r5, [r4]
	ldrb r5, [r2, r8]
	add ip, ip, #2
	add r8, r8, #1
	and r5, r5, #0xf0
	mov r5, r5, asr #4
	strb r5, [r4, #1]
	ands r5, r5, #0xff
	orrne r5, r5, r3
	strneb r5, [r4, #1]
_0201FF28:
	ldr r4, [sp, #0x30]
	add lr, lr, #1
	mov r4, r4, lsl #1
	str r4, [sp, #0x30]
_0201FF38:
	cmp r8, sl
	blt _0201FBEC
	mov r0, ip
_0201FF44:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DecompressAtHalf

	arm_func_start DecompressAtFromMemoryPointerVeneer
DecompressAtFromMemoryPointerVeneer: ; 0x0201FF4C
	ldr ip, _0201FF54 ; =DecompressAtFromMemoryPointer
	bx ip
	.align 2, 0
_0201FF54: .word DecompressAtFromMemoryPointer
	arm_func_end DecompressAtFromMemoryPointerVeneer

	arm_func_start DecompressAtFromMemoryPointer
DecompressAtFromMemoryPointer: ; 0x0201FF58
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r5, r2
	ldrb r4, [r5, #5]
	ldrb r3, [r5, #6]
	ldr r2, _0202046C ; =_022A5038
	mov r7, #0
	str r0, [r2]
	str r0, [r2, #0xc]
	str r7, [r2, #4]
	str r7, [r2, #8]
	ldrb r0, [r5]
	mov r6, r1
	add r1, r4, r3, lsl #8
	cmp r0, #0x50
	str r1, [sp, #0x28]
	ldreqb r1, [r5, #1]
	str r7, [sp, #0x24]
	mov sl, #8
	cmpeq r1, #0x4b
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _0201FFF0
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	ldrb r2, [r5, #0x12]
	ldrb r3, [r5, #0x13]
	add r0, r1, r0, lsl #8
	add r0, r0, r2, lsl #16
	add r0, r0, r3, lsl #24
	cmp r6, #0
	cmpne r6, r0
	movne r0, r7
	bne _02020464
	mov r4, #0x14
	b _02020060
_0201FFF0:
	cmp r0, #0x41
	ldreqb r1, [r5, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r5, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r5, #3]
	cmpeq r1, #0x50
	bne _02020034
	ldrb r1, [r5, #0x10]
	ldrb r0, [r5, #0x11]
	cmp r6, #0
	add r0, r1, r0, lsl #8
	cmpne r6, r0
	movne r0, #0
	bne _02020464
	mov r4, #0x12
	b _02020060
_02020034:
	cmp r0, #0x41
	ldreqb r0, [r5, #1]
	cmpeq r0, #0x54
	ldreqb r0, [r5, #2]
	cmpeq r0, #0x33
	ldreqb r0, [r5, #3]
	cmpeq r0, #0x50
	moveq r4, #0x10
	beq _02020060
	mov r0, #0
	b _02020464
_02020060:
	ldrb r0, [r5, #4]
	cmp r0, #0x4e
	bne _0202009C
	mov r4, #0
	b _02020084
_02020074:
	add r0, r5, r4
	ldrb r0, [r0, #7]
	bl WriteByteFromMemoryPointer
	add r4, r4, #1
_02020084:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _02020074
	bl sub_020204CC
	mov r0, r4
	b _02020464
_0202009C:
	ldrb r0, [r5, #7]
	ldrb fp, [r5, #8]
	ldrb sb, [r5, #9]
	add r0, r0, #3
	str r0, [sp, #0x20]
	add r0, fp, #3
	str r0, [sp, #0x1c]
	add r0, sb, #3
	ldrb r8, [r5, #0xa]
	str r0, [sp, #0x18]
	ldrb r3, [r5, #0xb]
	add r0, r8, #3
	str r0, [sp, #0x14]
	add r0, r3, #3
	ldrb r2, [r5, #0xc]
	str r0, [sp, #0x10]
	ldrb r1, [r5, #0xd]
	add r0, r2, #3
	str r0, [sp, #0xc]
	add r0, r1, #3
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	ldrb r1, [r5, #0xf]
	add r0, r0, #3
	str r0, [sp, #4]
	add r0, r1, #3
	str r0, [sp]
	b _02020450
_0202010C:
	cmp r6, #0
	beq _02020120
	cmp r7, r6
	movge r0, #0
	bge _02020464
_02020120:
	cmp sl, #8
	ldreqb r0, [r5, r4]
	addeq r4, r4, #1
	moveq sl, #0
	streq r0, [sp, #0x24]
	ldr r0, [sp, #0x24]
	tst r0, #0x80
	bne _02020430
	ldrb r2, [r5, r4]
	add r0, r5, r4
	and r1, r2, #0xf0
	mov r1, r1, asr #4
	add r8, r1, #3
	ldr r1, [sp, #0x20]
	and sb, r2, #0xf
	cmp r8, r1
	ldr r1, [sp, #0x1c]
	moveq r8, #0x1f
	cmp r8, r1
	ldr r1, [sp, #0x18]
	moveq r8, #0x1e
	cmp r8, r1
	ldr r1, [sp, #0x14]
	moveq r8, #0x1d
	cmp r8, r1
	ldr r1, [sp, #0x10]
	moveq r8, #0x1c
	cmp r8, r1
	ldr r1, [sp, #0xc]
	moveq r8, #0x1b
	cmp r8, r1
	ldr r1, [sp, #8]
	moveq r8, #0x1a
	cmp r8, r1
	ldr r1, [sp, #4]
	moveq r8, #0x19
	cmp r8, r1
	ldr r1, [sp]
	moveq r8, #0x18
	cmp r8, r1
	moveq r8, #0x17
	sub r1, r8, #0x17
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _02020398
_020201D4: ; jump table
	b _02020368 ; case 0
	b _02020338 ; case 1
	b _02020308 ; case 2
	b _020202DC ; case 3
	b _020202AC ; case 4
	b _0202027C ; case 5
	b _0202024C ; case 6
	b _02020220 ; case 7
	b _020201F8 ; case 8
_020201F8:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020220:
	add r4, r4, #1
	add r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202024C:
	add r4, r4, #1
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_0202027C:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	sub r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202AC:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	sub r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_020202DC:
	add r4, r4, #1
	sub r0, sb, #1
	and r8, r0, #0xf
	orr r0, r8, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	orr r0, r8, r8, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020308:
	add r4, r4, #1
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	and r0, sb, #0xf
	orr r0, r0, r0, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020338:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r0, sb, #1
	mov r1, r0, lsl #0x1c
	and r0, sb, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020368:
	add r4, r4, #1
	orr r0, sb, sb, lsl #4
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	mov r1, sb, lsl #0x1c
	add r0, sb, #1
	and r0, r0, #0xf
	orr r0, r0, r1, lsr #24
	and r0, r0, #0xff
	bl WriteByteFromMemoryPointer
	add r7, r7, #2
	b _02020440
_02020398:
	ldrb r1, [r0, #1]
	sub r0, r7, #0x1000
	add r4, r4, #2
	add r1, r1, sb, lsl #8
	add sb, r1, r0
	mov fp, #0
	b _02020424
_020203B4:
	ldr r0, _0202046C ; =_022A5038
	ldr r1, [r0, #0xc]
	mov r0, sb, asr #1
	add r0, sb, r0, lsr #30
	mov r0, r0, asr #2
	ldr r1, [r1, r0, lsl #2]
	and r0, sb, #3
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020203EC
_020203DC: ; jump table
	b _020203EC ; case 0
	b _020203F4 ; case 1
	b _02020400 ; case 2
	b _0202040C ; case 3
_020203EC:
	and r0, r1, #0xff
	b _02020414
_020203F4:
	mov r0, r1, lsr #8
	and r0, r0, #0xff
	b _02020414
_02020400:
	mov r0, r1, lsr #0x10
	and r0, r0, #0xff
	b _02020414
_0202040C:
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
_02020414:
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add sb, sb, #1
	add fp, fp, #1
_02020424:
	cmp fp, r8
	blt _020203B4
	b _02020440
_02020430:
	ldrb r0, [r5, r4]
	bl WriteByteFromMemoryPointer
	add r7, r7, #1
	add r4, r4, #1
_02020440:
	ldr r0, [sp, #0x24]
	add sl, sl, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x24]
_02020450:
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _0202010C
	bl sub_020204CC
	mov r0, r7
_02020464:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202046C: .word _022A5038
	arm_func_end DecompressAtFromMemoryPointer

	arm_func_start WriteByteFromMemoryPointer
WriteByteFromMemoryPointer: ; 0x02020470
	ldr r1, _020204C4 ; =_022A5038
	ldr r2, _020204C8 ; =_020997A4
	ldr r3, [r1, #8]
	ldr ip, [r1, #4]
	ldr r2, [r2, r3, lsl #2]
	orr r2, ip, r0, lsl r2
	str r2, [r1, #4]
	ldr r0, [r1]
	str r2, [r0]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	cmp r0, #4
	bxne lr
	ldr r2, [r1]
	mov r0, #0
	add r2, r2, #4
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020204C4: .word _022A5038
_020204C8: .word _020997A4
	arm_func_end WriteByteFromMemoryPointer

	arm_func_start sub_020204CC
sub_020204CC: ; 0x020204CC
	ldr r0, _020204E8 ; =_022A5038
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r1, [r0, #4]
	ldrne r0, [r0]
	strne r1, [r0]
	bx lr
	.align 2, 0
_020204E8: .word _022A5038
	arm_func_end sub_020204CC

	arm_func_start GetAtSize
GetAtSize: ; 0x020204EC
	ldrb r2, [r0]
	cmp r2, #0x50
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x4b
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x44
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	bne _02020530
	ldrb r2, [r0, #0x10]
	ldrb r1, [r0, #0x11]
	ldrb r3, [r0, #0x12]
	ldrb ip, [r0, #0x13]
	add r0, r2, r1, lsl #8
	add r0, r0, r3, lsl #16
	add r0, r0, ip, lsl #24
	bx lr
_02020530:
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r1, [r0, #2]
	cmpeq r1, #0x34
	ldreqb r1, [r0, #3]
	cmpeq r1, #0x50
	ldreqb r1, [r0, #0x10]
	ldreqb r0, [r0, #0x11]
	addeq r0, r1, r0, lsl #8
	bxeq lr
	cmp r2, #0x41
	ldreqb r1, [r0, #1]
	cmpeq r1, #0x54
	ldreqb r0, [r0, #2]
	cmpeq r0, #0x33
	moveq r0, #0
	movne r0, #0
	bx lr
	arm_func_end GetAtSize

	arm_func_start sub_0202057C
sub_0202057C: ; 0x0202057C
	stmdb sp!, {lr}
	sub sp, sp, #0x54
	add r0, sp, #0
	bl sub_02004F74
	ldrsb r0, [sp]
	bl sub_020205C0
#ifdef EUROPE
	bl sub_0202059C
#endif
	add sp, sp, #0x54
	ldmia sp!, {pc}
	arm_func_end sub_0202057C

	arm_func_start sub_0202059C
sub_0202059C: ; 0x0202059C
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldmeqia sp!, {r4, pc}
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	ldr r0, _02020684 ; =_02099C04_EU
	ldrsb r1, [r1]
	mov r2, r4
	bl Debug_Print0
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	mov r0, r4
	strb r4, [r1]
	bl sub_020206C0_EU
	ldr r1, _02020680 ; =LANGUAGE_INFO_DATA
	strb r0, [r1, #1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02020680: .word LANGUAGE_INFO_DATA
_02020684: .word _02099C04_EU
#else
	bx lr
#endif
	arm_func_end sub_0202059C

	arm_func_start GetLanguageType
GetLanguageType: ; 0x020205A0
	ldr r0, _020205AC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0, #1]
	bx lr
	.align 2, 0
_020205AC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguageType

#ifdef EUROPE
	arm_func_start sub_02020698_EU
sub_02020698_EU: ; 0x02020698
	and r0, r0, #0xff
	cmp r0, #4
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_02020698_EU
#endif

	arm_func_start GetLanguage
GetLanguage: ; 0x020205B0
	ldr r0, _020205BC ; =LANGUAGE_INFO_DATA
	ldrsb r0, [r0]
	bx lr
	.align 2, 0
_020205BC: .word LANGUAGE_INFO_DATA
	arm_func_end GetLanguage

#ifdef EUROPE
	arm_func_start sub_020206C0_EU
sub_020206C0_EU: ; 0x020206C0
	cmp r0, #0
	blt _020206D8_EU
	cmp r0, #5
	ldrlt r1, _020206E0_EU ; =_02099BF0_EU
	ldrltsb r0, [r1, r0]
	bxlt lr
_020206D8_EU:
	mvn r0, #0
	bx lr
	.align 2, 0
_020206E0_EU: .word _02099BF0_EU
	arm_func_end sub_020206C0_EU
#endif

	arm_func_start sub_020205C0
sub_020205C0: ; 0x020205C0
	cmp r0, #0
	blt _020205D8
	cmp r0, #9
	ldrlt r1, _020205E0 ; =_020997B4
	ldrltsb r0, [r1, r0]
	bxlt lr
_020205D8:
	mvn r0, #0
	bx lr
	.align 2, 0
_020205E0: .word _020997B4
	arm_func_end sub_020205C0

	arm_func_start sub_020205E4
sub_020205E4: ; 0x020205E4
	stmdb sp!, {r3, lr}
	bl sub_0202057C
	bl sub_020257FC
	bl sub_02023610
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205E4

	arm_func_start sub_020205F8
sub_020205F8: ; 0x020205F8
	stmdb sp!, {r3, lr}
	bl sub_0200B768
	bl LoadStringFile
#ifndef JAPAN
	bl sub_0202088C
#endif
	ldmia sp!, {r3, pc}
	arm_func_end sub_020205F8

	arm_func_start sub_0202060C
sub_0202060C: ; 0x0202060C
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0x61
	blo _0202062C
	cmp r0, #0x66
	subls r0, r0, #0x57
	bxls lr
_0202062C:
	cmp r0, #0x41
	blo _02020640
	cmp r0, #0x46
	subls r0, r0, #0x37
	bxls lr
_02020640:
	cmp r0, #0x30
	blo _02020654
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
_02020654:
	mov r0, #0
	bx lr
	arm_func_end sub_0202060C

	arm_func_start sub_0202065C
sub_0202065C: ; 0x0202065C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r6, [r4]
	ldrb r0, [r6]
	cmp r0, #0x7e
	bne _020206C8
	ldrb r0, [r6, #1]
	bl sub_0202060C
	movs r5, r0
	addmi r0, r6, #1
	strmi r0, [r4]
	movmi r0, #0
	ldmmiia sp!, {r4, r5, r6, pc}
	ldrb r0, [r6, #2]
	bl sub_0202060C
	cmp r0, #0
	addlt r1, r6, #2
	movlt r0, r5, lsl #0x10
	strlt r1, [r4]
	movlt r0, r0, lsr #0x10
	ldmltia sp!, {r4, r5, r6, pc}
	add r0, r0, r5, lsl #4
	add r1, r6, #3
	mov r0, r0, lsl #0x10
	str r1, [r4]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, pc}
_020206C8:
	cmp r0, #0x81
	blo _020206D8
	cmp r0, #0x84
	bls _020206E0
_020206D8:
	cmp r0, #0x87
	bne _020206F0
_020206E0:
	ldrb r1, [r6, #1]!
	orr r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_020206F0:
	add r1, r6, #1
	str r1, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0202065C

	arm_func_start sub_020206FC
sub_020206FC: ; 0x020206FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	ldr r5, [sb]
	mov sl, r0
	ldrb r0, [r5]
	mov r8, r2
	ldr r4, [sl]
	cmp r0, #0x7e
	bne _020207F0
	ldrb r0, [r5, #1]
	mov r6, #0
	bl sub_0202060C
	movs r7, r0
	bpl _02020754
	ldrb r2, [r5]
	add r1, r4, #1
	add r0, r5, #1
	strb r2, [r4]
	str r1, [sl]
	str r0, [sb]
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020754:
	add r0, r4, #1
	cmp r0, r8
	ldrb r0, [r5, #2]
	moveq r6, #1
	bl sub_0202060C
	cmp r0, #0
	bge _020207A4
	cmp r6, #0
	bne _02020790
	ldrb r1, [r5]
	add r0, r4, #2
	strb r1, [r4]
	ldrb r1, [r5, #1]
	strb r1, [r4, #1]
	str r0, [sl]
_02020790:
	add r1, r5, #2
	mov r0, r7, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207A4:
	add r1, r4, #2
	cmp r1, r8
	moveq r6, #1
	cmp r6, #0
	bne _020207D8
	ldrb r2, [r5]
	add r1, r4, #3
	strb r2, [r4]
	ldrb r2, [r5, #1]
	strb r2, [r4, #1]
	ldrb r2, [r5, #2]
	strb r2, [r4, #2]
	str r1, [sl]
_020207D8:
	add r0, r0, r7, lsl #4
	add r1, r5, #3
	mov r0, r0, lsl #0x10
	str r1, [sb]
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020207F0:
	cmp r0, #0x81
	blo _02020800
	cmp r0, #0x84
	bls _02020808
_02020800:
	cmp r0, #0x87
	bne _02020850
_02020808:
	ldrb r2, [r5, #1]
	add r1, r4, #1
	cmp r1, r8
	orr r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	addeq r1, r5, #2
	mov r0, r0, lsr #0x10
	streq r1, [sb]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldrb r3, [r5]
	add r2, r5, #2
	add r1, r4, #2
	strb r3, [r4]
	ldrb r3, [r5, #1]
	strb r3, [r4, #1]
	str r2, [sb]
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02020850:
	strb r0, [r4]
	add r1, r5, #1
	str r1, [sb]
	add r1, r4, #1
	str r1, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020206FC

	arm_func_start sub_02020868
sub_02020868: ; 0x02020868
	b _02020870
_0202086C:
	add r0, r0, #1
_02020870:
	ldrb r1, [r0]
	cmp r1, #0
	bne _0202086C
	bx lr
	arm_func_end sub_02020868

	arm_func_start sub_02020880
sub_02020880: ; 0x02020880
	ldr ip, _02020888 ; =strstr
	bx ip
	.align 2, 0
_02020888: .word strstr
	arm_func_end sub_02020880

#ifndef JAPAN
	arm_func_start sub_0202088C
sub_0202088C: ; 0x0202088C
#ifdef EUROPE
	stmdb sp!, {r3, lr}
	bl GetLanguage
	ldr r1, _020209E0 ; =_020B05B0_EU
	mov r2, r0, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _020209E4 ; =_020B05AC_EU
	cmp r0, #2
	strh r2, [r1]
	strh r2, [r1, #2]
	moveq r0, #0x2e
	streqh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020209E0: .word _020B05B0_EU
_020209E4: .word _020B05AC_EU
#else
	bx lr
#endif
	arm_func_end sub_0202088C
#endif

	arm_func_start sub_02020890
sub_02020890: ; 0x02020890
	cmp r1, #0
	beq _020208C0
	ldr ip, [r0]
_0202089C:
	cmp ip, r2
	moveq r0, #0
	streqb r0, [r2, #-1]
	bxeq lr
	ldrb r3, [r1], #1
	cmp r3, #0
	strneb r3, [ip], #1
	bne _0202089C
	str ip, [r0]
_020208C0:
	mov r0, #1
	bx lr
	arm_func_end sub_02020890

	arm_func_start StrcmpTag
StrcmpTag: ; 0x020208C8
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _020208F0
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_020208F0:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq StrcmpTag
	mov r0, #0
	bx lr
	arm_func_end StrcmpTag

	arm_func_start AtoiTag
AtoiTag: ; 0x0202090C
	mov r3, #0
	mov r1, #0xa
_02020914:
	ldrb r2, [r0], #1
	cmp r2, #0
	cmpne r2, #0x3a
	cmpne r2, #0x5d
	moveq r0, r3
	bxeq lr
	cmp r2, #0x30
	blo _02020914
	cmp r2, #0x39
	mlals r2, r3, r1, r2
	subls r3, r2, #0x30
	b _02020914
	arm_func_end AtoiTag

	arm_func_start sub_02020944
sub_02020944: ; 0x02020944
	bx lr
	arm_func_end sub_02020944

	arm_func_start sub_02020948
sub_02020948: ; 0x02020948
	stmdb sp!, {r4, lr}
	ldrb r4, [r0]
	cmp r4, #0x41
	blo _02020A24
	cmp r4, #0x5a
	bhi _02020A24
	add r0, r0, #1
	bl AtoiTag
	mov r0, r0, lsl #0x10
	cmp r4, #0x49
	mov r0, r0, asr #0x10
	bgt _0202099C
	cmp r4, #0x48
	blt _02020990
	beq _020209DC
	cmp r4, #0x49
	beq _02020A0C
	b _02020A1C
_02020990:
	cmp r4, #0x42
	ldmeqia sp!, {r4, pc}
	b _02020A1C
_0202099C:
	cmp r4, #0x52
	bgt _020209AC
	beq _020209EC
	b _02020A1C
_020209AC:
	cmp r4, #0x54
	bgt _02020A1C
	cmp r4, #0x53
	blt _02020A1C
	beq _020209CC
	cmp r4, #0x54
	beq _020209FC
	b _02020A1C
_020209CC:
	add r0, r0, #0x21
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209DC:
	add r0, r0, #0x29
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209EC:
	add r0, r0, #0x32
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_020209FC:
	add r0, r0, #0x3c
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A0C:
	add r0, r0, #0x43
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A1C:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02020A24:
	cmp r4, #0x30
	blo _02020A44
	cmp r4, #0x39
	bhi _02020A44
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
_02020A44:
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020948

	arm_func_start sub_02020A4C
sub_02020A4C: ; 0x02020A4C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetLanguageType
	cmp r0, #3
	ldreq r4, _02020A94 ; =_0209995C
	ldrne r4, _02020A98 ; =_0209990C
	b _02020A80
_02020A68:
	mov r0, r5
	bl StrcmpTag
	cmp r0, #0
	ldrneh r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	add r4, r4, #8
_02020A80:
	ldr r1, [r4]
	cmp r1, #0
	bne _02020A68
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02020A94: .word _0209995C
_02020A98: .word _0209990C
	arm_func_end sub_02020A4C

	arm_func_start sub_02020A9C
sub_02020A9C: ; 0x02020A9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r5, r2
	mov lr, r4
	mov ip, #5
_02020AB4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02020AB4
	ldr r0, [r6]
	str r0, [lr]
	str r5, [r4, #0x54]
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _02020AE8
	ldr r0, [r4, #0x54]
	add r1, r4, #8
	blx r2
_02020AE8:
	mov r0, #0
	str r0, [r4, #0x58]
	mov r0, #0x78
	mov r1, #0x3c
	str r0, [r4, #0x6c]
	mov r0, r4
	str r1, [r4, #0x70]
	sub r1, r1, #0x3d
	str r1, [r4, #0x74]
	bl sub_02020B14
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02020A9C

	arm_func_start sub_02020B14
sub_02020B14: ; 0x02020B14
	mov r3, #0
	str r3, [r0, #0x5c]
	strb r3, [r0, #0x9d]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	mov r2, r3
_02020B34:
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #0x99]
	cmp r3, #4
	blt _02020B34
	bx lr
	arm_func_end sub_02020B14

	arm_func_start sub_02020B4C
sub_02020B4C: ; 0x02020B4C
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02020B4C

	arm_func_start sub_02020B60
sub_02020B60: ; 0x02020B60
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x90]
	str r1, [r0, #0x94]
	bx lr
	arm_func_end sub_02020B60

	arm_func_start sub_02020B74
sub_02020B74: ; 0x02020B74
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	and r1, r1, #0xff
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B74

	arm_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	stmdb sp!, {r3, lr}
	mov r2, r0
	strb r1, [r2, #0x98]
	strb r1, [r2, #0x9c]
	ldrb r1, [r2, #0x98]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x30]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_02020B94

	arm_func_start sub_02020BB8
sub_02020BB8: ; 0x02020BB8
	str r1, [r0, #0x6c]
	str r2, [r0, #0x70]
	bx lr
	arm_func_end sub_02020BB8

	arm_func_start sub_02020BC4
sub_02020BC4: ; 0x02020BC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	tst r1, #0x400
	movne r0, #1
	moveq r0, #0
	strh r1, [r4, #0x60]
	strb r0, [r4, #0x62]
	tst r1, #2
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C50
	tst r1, #4
	beq _02020C14
	mov r0, #3
	str r0, [r4, #0x5c]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
	b _02020C50
_02020C14:
	ldr r0, [r4, #0x5c]
	cmp r0, #1
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02020C40
	ldr r1, [r4, #0x6c]
	mov r0, #0xc
	str r1, [r4, #0x7c]
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
_02020C40:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r4, #0x90]
	str r0, [r4, #0x94]
_02020C50:
	str r2, [r4, #0x88]
	str r2, [r4, #0x84]
	mov r1, #0
	strh r1, [r4, #0x8c]
	str r1, [r4, #0xa4]
	strb r1, [r4, #0xa8]
	add r2, r4, #0xac
	mov r0, r1
_02020C70:
	add r1, r1, #1
	cmp r1, #4
	strb r0, [r2], #0x18
	blt _02020C70
	mov r1, #0x44
	strb r1, [r4, #0x98]
	str r0, [r4, #0xa0]
	bl Debug_GetDebugFlag
	cmp r0, #0
	movne r0, #4
	moveq r0, #1
	str r0, [r4, #0x64]
	mov r0, #1
	str r0, [r4, #0x68]
	mov r0, #0
	str r0, [r4, #0x78]
	str r0, [r4, #0x7c]
	str r0, [r4, #0x80]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	ldmia sp!, {r4, pc}
	arm_func_end sub_02020BC4

	arm_func_start sub_02020CCC
sub_02020CCC: ; 0x02020CCC
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bne _02020CF4
	ldr r2, [r0, #0x6c]
	mov r1, #0xb
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
_02020CF4:
	cmp r1, #0x10
	bxeq lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xe
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020CCC

	arm_func_start sub_02020D18
sub_02020D18: ; 0x02020D18
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	bxne lr
	ldr r2, [r0, #0x6c]
	mov r1, #0xd
	str r2, [r0, #0x7c]
	str r1, [r0, #0x5c]
	mov r1, #1
	strb r1, [r0, #0x9d]
	bx lr
	arm_func_end sub_02020D18

	arm_func_start sub_02020D40
sub_02020D40: ; 0x02020D40
	ldr r1, [r0, #0x5c]
	cmp r1, #1
	moveq r1, #2
	streq r1, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D40

	arm_func_start sub_02020D54
sub_02020D54: ; 0x02020D54
	ldr r0, [r0, #0x5c]
	bx lr
	arm_func_end sub_02020D54

	arm_func_start sub_02020D5C
sub_02020D5C: ; 0x02020D5C
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #2
	cmpne r0, #0x10
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end sub_02020D5C

	arm_func_start sub_02020D7C
sub_02020D7C: ; 0x02020D7C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r4, #0
	mov ip, #0x18
	b _02020DB8
_02020D94:
	mla r0, r4, ip, r7
	mov r5, r6
	add lr, r0, #0xac
	ldmia lr!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia r5, {r0, r1}
	add r6, r6, #0x18
	add r4, r4, #1
_02020DB8:
	ldr r0, [r7, #0xa4]
	cmp r4, r0
	blt _02020D94
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02020D7C

	arm_func_start AnalyzeText
AnalyzeText: ; 0x02020DC8
#ifdef EUROPE
#define ANALYZE_TEXT_STACK_OFFSET 8
#define ANALYZE_TEXT_LOAD_OFFSET -0x10
#else
#define ANALYZE_TEXT_STACK_OFFSET 0
#define ANALYZE_TEXT_LOAD_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	mov r4, r0
	ldr r0, [r4, #0x78]
	add r0, r0, #1
	str r0, [r4, #0x78]
	ldr r0, [r4, #0x5c]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _02021EC4
_02020DF0: ; jump table
	b _02021EC4 ; case 0
	b _02021EC4 ; case 1
	b _02021EC4 ; case 2
	b _02020E34 ; case 3
	b _02020EC4 ; case 4
	b _02020E4C ; case 5
	b _02020E4C ; case 6
	b _02021C90 ; case 7
	b _02021CE4 ; case 8
	b _02021CE4 ; case 9
	b _02021CE4 ; case 10
	b _02021CE4 ; case 11
	b _02021CE4 ; case 12
	b _02021CE4 ; case 13
	b _02021E90 ; case 14
	b _02021E9C ; case 15
	b _02021EC4 ; case 16
_02020E34:
	ldrh r0, [r4, #0x60]
	tst r0, #0x8000
	bne _02020E4C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x28]
	blx r1
_02020E4C:
	ldr r1, [r4, #0x5c]
	sub r0, r1, #5
	cmp r0, #1
	bhi _02020EBC
	cmp r1, #5
	bne _02020E74
	ldrh r0, [r4, #0x60]
	tst r0, #0x1000
	beq _02020E74
	bl sub_02017CEC
_02020E74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02020EA8
	tst r0, #0x800
	beq _02020EA8
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x18]
	blx r1
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x62]
	movne r0, #0
	strne r0, [r4, #0x7c]
_02020EA8:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	cmp r0, #0
	bgt _02021EC4
_02020EBC:
	mov r0, #4
	str r0, [r4, #0x5c]
_02020EC4:
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	mov r0, #0
	str r0, [r4, #0x7c]
	b _02021BFC
_02020EE4:
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	strh r0, [r4, #0x8c]
	cmp r0, #0x5b
	bne _02021AB4
	ldr r0, [r4, #0x88]
	ldrb r5, [r0]
	strh r5, [r4, #0x8c]
	cmp r5, #0x5b
	bne _02021A70
	ldr r0, [r4, #0x88]
	mov r6, #1
	add r0, r0, #1
	str r0, [r4, #0x88]
	str r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	add r0, sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET
_02020F24:
	ldr r1, [r4, #0x88]
	mov r2, r1
	add r1, r1, #1
	str r1, [r4, #0x88]
	ldrb r1, [r2]
	cmp r1, #0x5d
	beq _02020F54
	cmp r1, #0x3a
	ldreq r1, [r4, #0x88]
	streq r1, [r0, r6, lsl #2]
	addeq r6, r6, #1
	b _02020F24
_02020F54:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldrb r7, [r0]
	cmp r7, #0x41
	blo _02021A38
	cmp r7, #0x5a
	bhi _02021A38
	sub r1, r7, #0x42
	cmp r1, #0x15
	addls pc, pc, r1, lsl #2
	b _02021A10
_02020F7C: ; jump table
	b _02020FD4 ; case 0
	b _02021040 ; case 1
	b _02021A10 ; case 2
	b _02021A10 ; case 3
	b _0202134C ; case 4
#ifdef EUROPE
	b _0202155C ; case 5
#else
	b _02021A10 ; case 5
#endif
	b _020212F0 ; case 6
	b _02021A10 ; case 7
	b _02021A10 ; case 8
	b _02021404 ; case 9
	b _0202145C ; case 10
	b _02021694 ; case 11
	b _02021A10 ; case 12
	b _02021A10 ; case 13
	b _020217C4 ; case 14
	b _02021A10 ; case 15
	b _02021868 ; case 16
	b _020218D8 ; case 17
	b _02021A10 ; case 18
	b _02021A10 ; case 19
	b _02021A10 ; case 20
	b _020219AC ; case 21
_02020FD4:
	ldr r1, _02021ED0 ; =_020999AC
	bl StrcmpTag
	cmp r0, #0
	beq _02021018
	ldr r1, [r4, #8]
	ldr r3, [r4, #0x94]
	ldr r2, [r4, #0x14]
	ldr r0, [r4, #0x54]
	ldr r5, [r4, #0x48]
	add r2, r3, r2
	sub r3, r1, #4
	mov r1, #2
	blx r5
	ldr r0, [r4, #0x94]
	add r0, r0, #3
	str r0, [r4, #0x94]
	b _02021AA0
_02021018:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xe8]
	ldr r0, [r0, #0xe4]
	str r1, [sp, #0x6c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x68 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_02021040:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EDC ; =_020999C8
	bl StrcmpTag
	cmp r0, #0
	beq _02021104
	cmp r6, #2
	bne _02021098
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	ldrne r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	strneb r1, [r4, #0x99]
	ldrneb r0, [r0]
	strneb r0, [r4, #0x9c]
	bne _020210F0
	ldrb r0, [r4, #0x98]
	strb r0, [r4, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
	b _020210F0
_02021098:
	cmp r6, #3
	bne _020210F0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r2, [r4, #0x9c]
	cmp r2, #0
	cmpne r0, #3
	beq _020210D0
	add r1, r4, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	strb r2, [r1, #0x99]
	ldrb r0, [r0]
	strb r0, [r4, #0x9c]
	b _020210F0
_020210D0:
	ldrb r1, [r4, #0x98]
	add r0, r4, r0
	strb r1, [r0, #0x99]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreq r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	ldreqb r0, [r0]
	streqb r0, [r4, #0x98]
_020210F0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_02021104:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE0 ; =_020999CC
	bl StrcmpTag
	cmp r0, #0
	beq _020211C4
	cmp r6, #1
	bne _02021158
	ldrb r0, [r4, #0x9c]
	cmp r0, #0
	ldrneb r1, [r4, #0x99]
	movne r0, #0
	strneb r1, [r4, #0x9c]
	strneb r0, [r4, #0x99]
	bne _020211B0
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	ldreqb r0, [r4, #0x99]
	streqb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0x99]
	b _020211B0
_02021158:
	cmp r6, #2
	bne _020211B0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldrb r1, [r4, #0x9c]
	cmp r1, #0
	cmpne r0, #3
	beq _02021190
	add r2, r4, r0
	ldrb r1, [r2, #0x99]
	mov r0, #0
	strb r1, [r4, #0x9c]
	strb r0, [r2, #0x99]
	b _020211B0
_02021190:
	ldrb r1, [r4, #0xa8]
	cmp r1, #0
	addeq r1, r4, r0
	ldreqb r1, [r1, #0x99]
	add r0, r4, r0
	streqb r1, [r4, #0x98]
	mov r1, #0
	strb r1, [r0, #0x99]
_020211B0:
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020211C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE4 ; =_020999D0
	bl StrcmpTag
	cmp r0, #0
	beq _02021200
	ldr r0, [r4, #0x88]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	bl sub_02022118
	ldr r1, [r4, #8]
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x90]
	b _02021AA0
_02021200:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EE8 ; =_020999D4
	bl StrcmpTag
	cmp r0, #0
	beq _02021278
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r0, [r4, #0x94]
	str r1, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	strb r1, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021260
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021260:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021278:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EEC ; =_020999D8
	bl StrcmpTag
	cmp r0, #0
	beq _0202129C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x90]
	b _02021AA0
_0202129C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF0 ; =_020999E4
	bl StrcmpTag
	cmp r0, #0
	beq _020212C8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_020212C8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0xf8 - ANALYZE_TEXT_STACK_OFFSET]
	ldr r0, [r0, #0xf4 - ANALYZE_TEXT_STACK_OFFSET]
	str r1, [sp, #0x64 + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x60 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_020212F0:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF4 ; =_020999F0
	bl StrcmpTag
	cmp r0, #0
	beq _02021324
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x94]
	add r0, r0, r0, lsr #31
	add r0, r1, r0, asr #1
	str r0, [r4, #0x94]
	b _02021AA0
_02021324:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x100]
	ldr r0, [r0, #0xfc]
	str r1, [sp, #0x5c + ANALYZE_TEXT_STACK_OFFSET]
	str r0, [sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58 + ANALYZE_TEXT_STACK_OFFSET
	bl Debug_FatalError
_0202134C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EF8 ; =_020999F4
	bl StrcmpTag
	cmp r0, #0
	beq _020213A8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020A4C
	movs r3, r0
	beq _020213F4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _020213F4
_020213A8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021EFC ; =_020999F8
	bl StrcmpTag
	cmp r0, #0
	beq _020213CC
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x58]
	b _020213F4
_020213CC:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x108]
	ldr r0, [r0, #0x104]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x58]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x58
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_0202155C:
	ldr r1, _020220C4 ; =_02099E64_EU
	bl StrcmpTag
	cmp r0, #0
	beq _02021598
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021598:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x78]
	ldr r1, [r0, #0x90]
	ldr r0, [r0, #0x8c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_02021404:
	ldr r0, [sp, #0x78]
#else
	ldr r1, [r0, #0xa0]
	ldr r0, [r0, #0x9c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x50]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x50
	bl Debug_FatalError
_020213F4:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x34]
	blx r1
	b _02021AA0
_02021404:
#endif
	ldr r1, _02021F00 ; =_020999FC
	bl StrcmpTag
	cmp r0, #0
	beq _02021434
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	mov r0, #8
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	b _02021AA4
_02021434:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x98 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x94 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x4c]
	str r0, [sp, #0x48]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x48
	bl Debug_FatalError
_0202145C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F04 ; =_02099A00
	bl StrcmpTag
	cmp r0, #0
	beq _020214E8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0xa4]
	mov r1, #0x18
	mul r3, r2, r1
	add r2, r4, #0xac
	mov r1, #1
	strb r1, [r2, r3]
	add r3, r2, r3
	strh r0, [r3, #2]
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r2, [r4, #0x94]
	ldr r1, [r4, #0x90]
	sub r0, r0, #1
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	ldr r1, [r3, #0xc]
	stmib r3, {r1, r2}
	str r0, [r3, #0x14]
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	bne _02021AA0
	ldrb r0, [r4, #0x98]
	mov r1, #0x54
	strb r0, [r4, #0xa8]
	strb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
	b _02021AA0
_020214E8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F08 ; =_02099A04
	bl StrcmpTag
	cmp r0, #0
	beq _02021588
	ldr r3, [r4, #0xa4]
	add r1, r4, #0xac
	mov r0, #0x18
	mla r2, r3, r0, r1
	add r0, r3, #1
	str r0, [r4, #0xa4]
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	str r1, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r2, #0xc]
	sub r0, r0, #1
	str r0, [r2, #0xc]
	ldr r0, [r4, #0x14]
	ldr r1, [r2, #0x10]
	sub r0, r0, #1
	add r0, r1, r0
	str r0, [r2, #0x10]
	ldrb r0, [r4, #0xa8]
	cmp r0, #0
	beq _0202156C
	strb r0, [r4, #0x98]
	mov r0, #0
	strb r0, [r4, #0xa8]
	ldrb r1, [r4, #0x98]
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x30]
	blx r2
_0202156C:
	ldrh r0, [r4, #0x60]
	tst r0, #0x100
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021588:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F0C ; =_02099A08
	bl StrcmpTag
	cmp r0, #0
	beq _0202166C
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0x78 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r6, r0
	ldr r0, _02021F10 ; =_020997E4
	mov r1, r5, lsl #1
	mov r7, #0
	ldrh sb, [r0, r1]
	mov r5, r7
	b _02021654
_020215CC:
	ldr r1, [r4, #0x38]
	mov r0, sb
	mov r8, r5
	blx r1
	ldr r2, [r4, #0x90]
	ldr r1, [r4, #8]
	add r0, r2, r0
	cmp r0, r1
	ble _02021608
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
_02021608:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021630
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r8, [r4, #0x40]
	mov r3, sb
	blx r8
	mov r8, r0
_02021630:
	ldr r0, [r4, #0x90]
	add r7, r7, #1
	add r0, r0, r8
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
_02021654:
	cmp r7, r6
	blt _020215CC
	ldr r0, [r4, #0x90]
	add r0, r0, #1
	str r0, [r4, #0x90]
	b _02021AA0
_0202166C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x90 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x8c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x40
	bl Debug_FatalError
_02021694:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F14 ; =_02099A10
	bl StrcmpTag
	cmp r0, #0
	beq _020216F8
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl sub_02020948
	mov r3, r0
	mvn r0, #0
	cmp r3, r0
	beq _02021AA0
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x44]
	blx r5
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021AA0
_020216F8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F18 ; =_02099A14
	bl StrcmpTag
	cmp r0, #0
	beq _02021728
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r2, [r4, #0x90]
	mov r1, #6
	mla r1, r0, r1, r2
	str r1, [r4, #0x90]
	b _02021AA0
_02021728:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F1C ; =_02099A18
	bl StrcmpTag
	cmp r0, #0
	beq _02021764
#ifdef EUROPE
	ldr r1, _020220C8 ; =_020B05AC_EU
	ldr r0, [r4, #0x54]
	ldrh r3, [r1, #2]
#else
	ldr r0, [r4, #0x54]
#endif
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r5, [r4, #0x40]
#ifndef EUROPE
	mov r3, #0x2c
#endif
	blx r5
	ldr r0, [r4, #0x90]
	add r0, r0, #6
	str r0, [r4, #0x90]
	b _02021AA0
_02021764:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F20 ; =_02099A1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202179C
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C50
	b _02021AA0
_0202179C:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x88 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x84 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x38]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x38
	bl Debug_FatalError
_020217C4:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F24 ; =_02099A24
	bl StrcmpTag
	cmp r0, #0
	beq _02021840
	ldr r1, [r4, #0xc]
	mov r0, #0
	str r1, [r4, #0x94]
	str r0, [r4, #0xa0]
	mov r0, #9
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r0, [r4, #0x88]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021828
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r0, #7
	strne r0, [r4, #0x5c]
_02021828:
	ldrh r0, [r4, #0x60]
	tst r0, #0x80
	movne r0, #7
	strne r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_02021840:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x80 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x7c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x34]
	str r0, [sp, #0x30]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x30
	bl Debug_FatalError
_02021868:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F28 ; =_02099A28
	bl StrcmpTag
	cmp r0, #0
	beq _020218B0
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	beq _02021AA0
	mov r0, #7
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020218B0:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x78 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x74 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x28
	bl Debug_FatalError
_020218D8:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F2C ; =_02099A2C
	bl StrcmpTag
	cmp r0, #0
	beq _02021904
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	ldr r1, [r4, #0x90]
	add r0, r1, r0
	str r0, [r4, #0x90]
	b _02021AA0
_02021904:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F30 ; =_02099A30
	bl StrcmpTag
	cmp r0, #0
	movne r0, #0x400
	strne r0, [r4, #0x80]
	bne _02021AA0
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F34 ; =_02099A34
	bl StrcmpTag
	cmp r0, #0
	beq _0202194C
	ldrb r0, [r4, #0x62]
	cmp r0, #0
	movne r0, #0x400
	ldreq r0, [r4, #0x64]
	str r0, [r4, #0x80]
	b _02021AA0
_0202194C:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F38 ; =_02099A38
	bl StrcmpTag
	cmp r0, #0
	beq _02021984
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_02017C80
	b _02021AA0
_02021984:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x70 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x6c + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x24]
	str r0, [sp, #0x20]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x20
	bl Debug_FatalError
_020219AC:
	ldr r0, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, _02021F3C ; =_02099A40
	bl StrcmpTag
	cmp r0, #0
	beq _020219E8
	ldrh r0, [r4, #0x60]
	tst r0, #1
	bne _02021AA0
	ldr r0, [sp, #0x74 + ANALYZE_TEXT_STACK_OFFSET]
	bl AtoiTag
	str r0, [r4, #0x7c]
	mov r0, #6
	str r0, [r4, #0x5c]
	mov r0, #1
	b _02021AA4
_020219E8:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x68 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x64 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x18
	bl Debug_FatalError
_02021A10:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
#ifdef EUROPE
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x3c]
#else
	ldr r1, [r0, #0x60]
	ldr r0, [r0, #0x5c]
#endif
	str r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #0x10
	bl Debug_FatalError
_02021A38:
	cmp r7, #0x61
	blo _02021A48
	cmp r7, #0x7a
	bls _02021AA0
_02021A48:
	ldr r0, _02021ED4 ; =_020997E4
	ldr r2, [sp, #0x70 + ANALYZE_TEXT_STACK_OFFSET]
	ldr r1, [r0, #0x58 + ANALYZE_TEXT_LOAD_OFFSET]
	ldr r0, [r0, #0x54 + ANALYZE_TEXT_LOAD_OFFSET]
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r3, [r4, #0x84]
	ldr r1, _02021ED8 ; =_020999B0
	add r0, sp, #8
	bl Debug_FatalError
_02021A70:
	cmp r5, #0x5b
	beq _02021AA0
	ldr r1, _02021ED4 ; =_020997E4
	add r0, sp, #0
#ifdef EUROPE
	ldr r2, [r1, #0x98]
	ldr r1, [r1, #0x94]
#else
	ldr r2, [r1, #0x48]
	ldr r1, [r1, #0x44]
#endif
	str r2, [sp, #4]
	str r1, [sp]
	ldr r2, [r4, #0x88]
	ldr r3, [r4, #0x84]
	ldr r1, _02021F40 ; =_02099A44
	bl Debug_FatalError
_02021AA0:
	mov r0, #0
_02021AA4:
	cmp r0, #0
	beq _02021BC4
	ldr r1, [r4, #0x5c]
	b _02021C10
_02021AB4:
	cmp r0, #0
	moveq r1, #7
	streq r1, [r4, #0x5c]
	beq _02021C10
	cmp r0, #0xd
	cmpne r0, #0xa
	bne _02021B0C
	ldrh r0, [r4, #0x60]
	tst r0, #0x40
	movne r1, #7
	strne r1, [r4, #0x5c]
	bne _02021C10
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	ldr r0, [r4, #0x88]
	add r0, r0, #1
	str r0, [r4, #0x88]
	b _02021BC4
_02021B0C:
	ldr r7, [r4, #0x88]
	add r0, r4, #0x88
	bl sub_0202065C
	strh r0, [r4, #0x8c]
	ldr r0, [r4, #0x10]
	ldrh r6, [r4, #0x8c]
	cmp r0, #0
	bne _02021B50
	ldr r8, [r4, #0x90]
	cmp r6, #0x7f
	addeq r5, r8, #6
	beq _02021B58
	ldr r1, [r4, #0x38]
	mov r0, r6
	blx r1
	add r5, r8, r0
	b _02021B58
_02021B50:
	ldr r8, [r4, #0x90]
	add r5, r8, r0
_02021B58:
	ldr r0, [r4, #8]
	cmp r5, r0
	ble _02021B84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x94]
	str r7, [r4, #0x88]
	b _02021BC4
_02021B84:
	ldrb r0, [r4, #0x98]
	cmp r0, #0x54
	beq _02021BA8
	ldr r0, [r4, #0x54]
	ldr r2, [r4, #0x94]
	ldr r7, [r4, #0x40]
	mov r1, r8
	mov r3, r6
	blx r7
_02021BA8:
	str r5, [r4, #0x90]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x80]
	sub r0, r0, #1
	str r0, [r4, #0x80]
	b _02021BFC
_02021BC4:
	ldrh r0, [r4, #0x60]
	tst r0, #0x400
	bne _02021BFC
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021BFC
	mov r0, #0
	str r0, [r4, #0xa0]
	mov r0, #1
	mov r1, #9
	strb r0, [r4, #0x9d]
	str r1, [r4, #0x5c]
	b _02021C10
_02021BFC:
	ldr r0, [r4, #0x80]
	cmp r0, #0
	bgt _02020EE4
	mov r1, #5
	str r1, [r4, #0x5c]
_02021C10:
	sub r0, r1, #7
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _02021C74
_02021C20: ; jump table
	b _02021C54 ; case 0
	b _02021C48 ; case 1
	b _02021C3C ; case 2
	b _02021C74 ; case 3
	b _02021C74 ; case 4
	b _02021C3C ; case 5
	b _02021C3C ; case 6
_02021C3C:
	ldr r0, [r4, #0x6c]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C48:
	ldr r0, [r4, #0x70]
	str r0, [r4, #0x7c]
	b _02021C74
_02021C54:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021C6C
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
_02021C6C:
	mov r0, #7
	b _02021EC8
_02021C74:
	ldrh r0, [r4, #0x60]
	tst r0, #0x4000
	bne _02021EC4
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x24]
	blx r1
	b _02021EC4
_02021C90:
	ldrh r0, [r4, #0x60]
	tst r0, #0x10
	beq _02021CCC
	mov r0, #0xa
	str r0, [r4, #0x5c]
	mov r0, #1
	strb r0, [r4, #0x9d]
	ldr r1, [r4, #0x74]
	cmp r1, #0
	ldrge r0, [r4, #0x78]
	subge r0, r1, r0
	strge r0, [r4, #0x7c]
	ldrlt r0, [r4, #0x6c]
	strlt r0, [r4, #0x7c]
	b _02021EC4
_02021CCC:
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021CE4:
	ldrh r1, [r4, #0x60]
	mov r5, #0
	tst r1, #8
	bne _02021D08
	cmp r0, #0xb
	cmpne r0, #0xc
	cmpne r0, #0xd
	movne r5, #1
	bne _02021D60
_02021D08:
	tst r1, #0x20
	beq _02021D24
	ldr r0, [r4, #0x7c]
	subs r0, r0, #1
	str r0, [r4, #0x7c]
	movmi r5, #1
	b _02021D60
_02021D24:
	ldrb r0, [r4, #0x9d]
	cmp r0, #0
	beq _02021D50
	mov r0, #0
	strb r0, [r4, #0x9d]
	bl sub_02006220
	mov r0, #0
	bl sub_020063A0
	mov r0, #0
	bl sub_020063D4
	b _02021D60
_02021D50:
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x1c]
	blx r1
	mov r5, r0
_02021D60:
	cmp r5, #0
	bne _02021DB0
	ldrh r0, [r4, #0x60]
	tst r0, #0x20
	bne _02021EC4
	ldr r0, [r4, #0x5c]
	cmp r0, #8
	bne _02021D98
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x90]
	ldr r2, [r4, #0x94]
	ldr r3, [r4, #0x50]
	blx r3
	b _02021EC4
_02021D98:
	mvn r1, #0
	ldr r0, [r4, #0x54]
	ldr r3, [r4, #0x50]
	mov r2, r1
	blx r3
	b _02021EC4
_02021DB0:
	ldr r2, [r4, #0x88]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x4c]
	ldrb r5, [r2]
	blx r1
	ldr r0, [r4, #0x5c]
	cmp r0, #0xb
	moveq r0, #0x10
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xc
	moveq r0, #3
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r0, #0xd
	moveq r0, #2
	streq r0, [r4, #0x5c]
	beq _02021EC4
	cmp r5, #0
	cmpne r0, #0xa
	bne _02021E20
	ldrh r0, [r4, #0x60]
	tst r0, #0x200
	movne r0, #0x10
	strne r0, [r4, #0x5c]
	moveq r0, #1
	streq r0, [r4, #0x5c]
	b _02021EC4
_02021E20:
	cmp r0, #9
	bne _02021E84
	ldr r0, [r4]
	str r0, [r4, #0x90]
	ldr r1, [r4, #0x94]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	blt _02021E78
	ldr r0, [r4, #4]
	str r0, [r4, #0x94]
	ldr r0, [r4, #0xa0]
	cmp r0, #0
	movne r0, #3
	strne r0, [r4, #0x5c]
	bne _02021EC4
	mov r0, #0xf
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x7c]
	b _02021EC4
_02021E78:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E84:
	mov r0, #4
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E90:
	mov r0, #0x10
	str r0, [r4, #0x5c]
	b _02021EC4
_02021E9C:
	ldr r0, [r4, #0x7c]
	sub r0, r0, #1
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	blx r1
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	movle r0, #4
	strle r0, [r4, #0x5c]
_02021EC4:
	ldr r0, [r4, #0x5c]
_02021EC8:
	add sp, sp, #0x84 + ANALYZE_TEXT_STACK_OFFSET
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02021ED0: .word _020999AC
_02021ED4: .word _020997E4
_02021ED8: .word _020999B0
_02021EDC: .word _020999C8
_02021EE0: .word _020999CC
_02021EE4: .word _020999D0
_02021EE8: .word _020999D4
_02021EEC: .word _020999D8
_02021EF0: .word _020999E4
_02021EF4: .word _020999F0
_02021EF8: .word _020999F4
_02021EFC: .word _020999F8
#ifdef EUROPE
_020220C4: .word _02099E64_EU
_020220C8: .word _020B05AC_EU
#endif
_02021F00: .word _020999FC
_02021F04: .word _02099A00
_02021F08: .word _02099A04
_02021F0C: .word _02099A08
_02021F10: .word _020997E4
_02021F14: .word _02099A10
_02021F18: .word _02099A14
_02021F1C: .word _02099A18
_02021F20: .word _02099A1C
_02021F24: .word _02099A24
_02021F28: .word _02099A28
_02021F2C: .word _02099A2C
_02021F30: .word _02099A30
_02021F34: .word _02099A34
_02021F38: .word _02099A38
_02021F3C: .word _02099A40
_02021F40: .word _02099A44
	arm_func_end AnalyzeText

	arm_func_start sub_02021F44
sub_02021F44: ; 0x02021F44
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r0, #0
	ldr r6, _02022020 ; =_02099A24
	ldr r5, _02022024 ; =_020999D4
	ldr r4, _02022028 ; =_02099A00
	str r0, [sb]
	add r7, sp, #0x20
_02021F68:
	mov r0, r7
	bl sub_0202065C
	cmp r0, #0
	beq _02022010
	cmp r0, #0x5b
	bne _02021F68
	ldr r8, [sp, #0x20]
	add r1, r8, #1
	str r1, [sp, #0x20]
_02021F8C:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02021F8C
	mov r0, r8
	mov r1, r6
	bl StrcmpTag
	cmp r0, #0
	bne _02021FCC
	mov r0, r8
	mov r1, r5
	bl StrcmpTag
	cmp r0, #0
	beq _02021FF0
_02021FCC:
	ldr r0, [sp, #0x20]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x20]
	addeq r0, r0, #1
	streq r0, [sp, #0x20]
	ldr r0, [sp, #0x20]
	b _02022014
_02021FF0:
	mov r0, r8
	mov r1, r4
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sb]
	addne r0, r0, #1
	strne r0, [sb]
	b _02021F68
_02022010:
	mov r0, #0
_02022014:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022020: .word _02099A24
_02022024: .word _020999D4
_02022028: .word _02099A00
	arm_func_end sub_02021F44

	arm_func_start sub_0202202C
sub_0202202C: ; 0x0202202C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, [r1, #0x14]
	str r0, [sp]
_02022040:
	add r0, sp, #0
	ldr r4, [sp]
	bl sub_0202065C
	cmp r0, #0
	beq _020220F4
	cmp r0, #0x5b
	bne _020220DC
	ldr r4, [sp]
	add r1, r4, #1
	str r1, [sp]
_02022068:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022068
	ldr r1, _02022110 ; =_02099A04
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _020220F4
	ldr r1, _02022114 ; =_02099A00
	mov r0, r4
	bl StrcmpTag
	cmp r0, #0
	bne _02022040
	ldr r2, [sp, #0x10]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x10]
	strb r0, [r2]
_020220BC:
	ldr r1, [sp, #0x10]
	add r0, r1, #1
	str r0, [sp, #0x10]
	ldrb r0, [r4], #1
	strb r0, [r1]
	cmp r0, #0x5d
	bne _020220BC
	b _02022040
_020220DC:
	add r0, sp, #0x10
	add r1, sp, #0
	mov r2, #0
	str r4, [sp]
	bl sub_020206FC
	b _02022040
_020220F4:
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02022110: .word _02099A04
_02022114: .word _02099A00
	arm_func_end sub_0202202C

	arm_func_start sub_02022118
sub_02022118: ; 0x02022118
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r1
	mov r7, r2
	mov r4, #0
_0202212C:
	add r0, sp, #0x18
	bl sub_0202065C
	cmp r0, #0
	cmpne r0, #0xd
	cmpne r0, #0xa
	cmpne r0, #0x1b
	beq _020223B4
	cmp r0, #0x5b
	bne _020223A8
	ldr r6, [sp, #0x18]
	ldr r1, _020223C4 ; =_02099A10
	add r2, r6, #1
	mov r0, r6
	str r2, [sp, #0x18]
	mov r5, #0
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D4 ; =_02099A18
	mov r0, r6
	bl StrcmpTag
#ifdef EUROPE
	cmp r0, #0
	bne _020221D8
	ldr r1, _020225D0 ; =_02099E64_EU
	mov r0, r6
	bl StrcmpTag
#endif
	cmp r0, #0
	bne _020221D8
	ldr r1, _020223D8 ; =_02099A08
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022324
_020221D8:
	ldr r1, [sp, #0x18]
_020221DC:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _02022214
	mov r5, r1
_020221F8:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _020221F8
	b _0202221C
_02022214:
	cmp r0, #0x5d
	bne _020221DC
_0202221C:
	ldr r1, _020223C4 ; =_02099A10
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022250
	mov r0, r5
	bl sub_02020948
	mvn r1, #0
	cmp r0, r1
	beq _0202212C
	blx r7
	add r4, r4, r0
	b _0202212C
_02022250:
	ldr r1, _020223C8 ; =_020999F4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _02022280
	mov r0, r5
	bl sub_02020A4C
	cmp r0, #0
	beq _0202212C
	blx r8
	add r4, r4, r0
	b _0202212C
_02022280:
	ldr r1, _020223CC ; =_02099A2C
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222A4
	mov r0, r5
	bl AtoiTag
	add r4, r4, r0
	b _0202212C
_020222A4:
	ldr r1, _020223D0 ; =_02099A14
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	beq _020222CC
	mov r0, r5
	bl AtoiTag
	mov r1, #6
	mla r4, r0, r1, r4
	b _0202212C
_020222CC:
	ldr r1, _020223D4 ; =_02099A18
#ifdef EUROPE
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	ldr r1, _020225D0 ; =_02099A08
#endif
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	addne r4, r4, #6
	bne _0202212C
	mov r6, r5
_020222E8:
	ldrb r0, [r6], #1
	cmp r0, #0x3a
	bne _020222E8
	mov r0, r5
	bl AtoiTag
	mov r5, r0
	mov r0, r6
	bl AtoiTag
	ldr r1, _020223DC ; =_020997E4
	mov r2, r5, lsl #1
	mov r5, r0
	ldrh r0, [r1, r2]
	blx r8
	mla r4, r5, r0, r4
	b _0202212C
_02022324:
	ldr r1, [sp, #0x18]
_02022328:
	mov r0, r1
	add r1, r1, #1
	str r1, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _02022328
	ldrb r0, [r6]
	cmp r0, #0x41
	blo _0202212C
	cmp r0, #0x5a
	bhi _0202212C
	ldr r1, _020223E0 ; =_02099A24
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E4 ; =_020999D4
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223E8 ; =_02099A28
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	ldr r1, _020223EC ; =_020999F0
	mov r0, r6
	bl StrcmpTag
	cmp r0, #0
	bne _020223B4
	b _0202212C
_020223A8:
	blx r8
	add r4, r4, r0
	b _0202212C
_020223B4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020223C4: .word _02099A10
_020223C8: .word _020999F4
_020223CC: .word _02099A2C
_020223D0: .word _02099A14
_020223D4: .word _02099A18
#ifdef EUROPE
_020225D0: .word _02099E64_EU
#endif
_020223D8: .word _02099A08
_020223DC: .word _020997E4
_020223E0: .word _02099A24
_020223E4: .word _020999D4
_020223E8: .word _02099A28
_020223EC: .word _020999F0
	arm_func_end sub_02022118

	arm_func_start PreprocessString
PreprocessString: ; 0x020223F0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c8
	sub sp, sp, #0x400
	ldr sl, [sp, #0x5f0]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, r0
	str r0, [sp, #0xc]
	and r0, r3, #0x40
	mov sb, r1
	str r0, [sp, #8]
	and r0, r3, #0x100
	ldr r8, [sp, #0x600]
	add r4, sl, sb
	and fp, r3, #0x2000
	str r0, [sp, #4]
_02022434:
	ldr r1, [sp, #0x5f0]
	cmp r1, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r0, [sp, #0x5f8]
	ldrb r5, [r0]
	cmp r5, #0
	moveq r0, #0
	streqb r0, [r1]
	ldreq r0, [sp, #0x5f0]
	subeq r0, r0, sl
	beq _0202357C
	cmp r5, #0xd
	cmpne r5, #0xa
	bne _02022490
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _02022554
_02022490:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0202251C
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	cmp fp, #0
	beq _02022554
	ldr r1, [r8, #0x4c]
	add r0, sp, #0x1c8
	bl sub_02023B68
	movs r6, r0
	beq _02022554
	ldr r1, _0202346C ; =_02099A5C
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	add r0, sp, #0x5f0
	mov r1, r6
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
	ldr r1, _02023470 ; =_02099A64
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	bne _02022554
	mov r0, sb
	b _0202357C
_0202251C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02022554
	mov r0, #0
	cmp fp, #0
	str r0, [sp, #0xc]
	beq _02022554
	ldr r1, _02023474 ; =_02099A70
	add r0, sp, #0x5f0
	mov r2, r4
	bl sub_02020890
	cmp r0, #0
	moveq r0, sb
	beq _0202357C
_02022554:
	cmp r5, #0x5b
	bne _02023454
	ldr r5, [sp, #0x5f8]
	mov r7, #0
	add r0, r5, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r5, #1]
	cmp r2, #0x61
	blo _0202332C
	cmp r2, #0x7a
	bhi _0202332C
	str r0, [sp, #0xb4]
	mov r6, #1
	add r1, sp, #0xb4
_0202258C:
	mov r2, r0
	add r0, r0, #1
	str r0, [sp, #0x5f8]
	ldrb r2, [r2]
	cmp r2, #0x5d
	beq _020225B4
	cmp r2, #0x3a
	streq r0, [r1, r6, lsl #2]
	addeq r6, r6, #1
	b _0202258C
_020225B4:
	ldr r0, [sp, #0xb4]
	ldrb r1, [r0]
	sub r1, r1, #0x61
	cmp r1, #0x16
	addls pc, pc, r1, lsl #2
	b _020232C8
_020225CC: ; jump table
	b _02022628 ; case 0
	b _020226BC ; case 1
	b _0202274C ; case 2
	b _02022838 ; case 3
	b _02022908 ; case 4
	b _02022994 ; case 5
	b _020229F0 ; case 6
	b _02022AD8 ; case 7
	b _02022B28 ; case 8
	b _020232C8 ; case 9
	b _02022B8C ; case 10
	b _020232C8 ; case 11
	b _02022C64 ; case 12
	b _02022BE4 ; case 13
	b _020232C8 ; case 14
	b _02022D5C ; case 15
	b _020232C8 ; case 16
	b _02022E30 ; case 17
	b _02022EC0 ; case 18
	b _02022FA0 ; case 19
	b _020232C8 ; case 20
	b _0202313C ; case 21
	b _0202323C ; case 22
_02022628:
	ldr r1, _02023478 ; =_02099A74
	bl StrcmpTag
	cmp r0, #0
	beq _02022658
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_0202494C
	mov r7, r0
	b _020232F0
_02022658:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202347C ; =_02099A7C
	bl StrcmpTag
	cmp r0, #0
	beq _02022694
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022694:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd8]
	ldr ip, [r1, #0xd4]
#else
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#endif
	str r2, [sp, #0xb0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xac
	mov r2, r5
	str ip, [sp, #0xac]
	bl Debug_FatalError
_020226BC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023488 ; =_02099A84
	bl StrcmpTag
	cmp r0, #0
	beq _020226F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238F0
	mov r7, r0
	b _020232F0
_020226F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202348C ; =_02099A8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022724
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02023900
	mov r7, r0
	b _020232F0
_02022724:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xb8]
	ldr ip, [r1, #0xb4]
	str r2, [sp, #0xa8]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0xa4
	mov r2, r5
	str ip, [sp, #0xa4]
	bl Debug_FatalError
_0202274C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023490 ; =_02099A98
	bl StrcmpTag
	cmp r0, #0
	beq _02022774
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_020240B0
	mov r7, r0
	b _020232F0
_02022774:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023494 ; =_02099AA0
	bl StrcmpTag
	cmp r0, #0
	beq _020227A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024C18
	mov r7, r0
	b _020232F0
_020227A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023498 ; =_02099AA4
	bl StrcmpTag
	cmp r0, #0
	beq _020227D0
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024114
	mov r7, r0
	b _020232F0
_020227D0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202349C ; =_02099AAC
	bl StrcmpTag
	cmp r0, #0
	beq _020227F8
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x1c8
	bl sub_02024178
	mov r7, r0
	b _020232F0
_020227F8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A0 ; =_02099AB8
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, _020234A4 ; =_02099AC0
	bne _020232F0
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0xc8]
	ldr ip, [r1, #0xc4]
	str r2, [sp, #0xa0]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x9c
	mov r2, r5
	str ip, [sp, #0x9c]
	bl Debug_FatalError
_02022838:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234A8 ; =_02099AC8
	bl StrcmpTag
	cmp r0, #0
	beq _02022870
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234AC ; =_02099AD0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022870:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B0 ; =_02099AD4
	bl StrcmpTag
	cmp r0, #0
	beq _020228A8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234B4 ; =_02099AE0
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020228A8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234B8 ; =_02099AF0
	bl StrcmpTag
	cmp r0, #0
	beq _020228E0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020245D0
	mov r7, r0
	b _020232F0
_020228E0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xf8]
	ldr ip, [r1, #0xf4]
#else
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#endif
	str r2, [sp, #0x98]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x94
	mov r2, r5
	str ip, [sp, #0x94]
	bl Debug_FatalError
_02022908:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234BC ; =_02099AF8
	bl StrcmpTag
	cmp r0, #0
	beq _02022938
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_02024E34
	mov r7, r0
	b _020232F0
_02022938:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C0 ; =_02099B04
	bl StrcmpTag
	cmp r0, #0
	beq _0202296C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02023910
	mov r7, r0
	b _020232F0
_0202296C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x110]
	ldr ip, [r1, #0x10c]
#else
	ldr r2, [r1, #0x108]
	ldr ip, [r1, #0x104]
#endif
	str r2, [sp, #0x90]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x8c
	mov r2, r5
	str ip, [sp, #0x8c]
	bl Debug_FatalError
_02022994:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C4 ; =_02099B10
	bl StrcmpTag
	cmp r0, #0
	beq _020229C8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_02024598
	mov r7, r0
	b _020232F0
_020229C8:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#else
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#endif
	str r2, [sp, #0x88]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x84
	mov r2, r5
	str ip, [sp, #0x84]
	bl Debug_FatalError
_020229F0:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234C8 ; =_02099B18
	bl StrcmpTag
	cmp r0, #0
	beq _02022A14
	add r0, sp, #0x1c8
	bl GetBagNameString
	mov r7, r0
	b _020232F0
_02022A14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234CC ; =_02099B24
	bl StrcmpTag
	cmp r0, #0
	beq _02022A48
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D7C
	mov r7, r0
	b _020232F0
_02022A48:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D0 ; =_02099B2C
	bl StrcmpTag
	cmp r0, #0
	beq _02022A7C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238D0
	mov r7, r0
	b _020232F0
_02022A7C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D4 ; =_02099B34
	bl StrcmpTag
	cmp r0, #0
	beq _02022AB0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020238E0
	mov r7, r0
	b _020232F0
_02022AB0:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#else
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#endif
	str r2, [sp, #0x80]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x7c
	mov r2, r5
	str ip, [sp, #0x7c]
	bl Debug_FatalError
_02022AD8:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234D8 ; =_02099B40
	bl StrcmpTag
	cmp r0, #0
	beq _02022B00
	add r0, sp, #0x1c8
	mov r1, #0x3c
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022B00:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x1c]
#else
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0xc]
#endif
	str r2, [sp, #0x78]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x74
	mov r2, r5
	str ip, [sp, #0x74]
	bl Debug_FatalError
_02022B28:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234DC ; =_02099B48
	bl StrcmpTag
	cmp r0, #0
	beq _02022B64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r3, r8, r0, lsl #2
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r0, sp, #0x1c8
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022B64:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x24]
	str r2, [sp, #0x70]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x6c
	mov r2, r5
	str ip, [sp, #0x6c]
	bl Debug_FatalError
_02022B8C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E0 ; =_02099B50
	bl StrcmpTag
	cmp r0, #0
	beq _02022BBC
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023920
	mov r7, r0
	b _020232F0
_02022BBC:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x4c]
#else
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x3c]
#endif
	str r2, [sp, #0x68]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x64
	mov r2, r5
	str ip, [sp, #0x64]
	bl Debug_FatalError
_02022BE4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E4 ; =_02099B58
	bl StrcmpTag
	cmp r0, #0
	beq _02022C14
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02023B68
	mov r7, r0
	b _020232F0
_02022C14:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234E8 ; =_02099B60
	bl StrcmpTag
	cmp r0, #0
	beq _02022C3C
	add r0, sp, #0x1c8
	mov r1, #2
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02022C3C:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xe0]
	ldr ip, [r1, #0xdc]
#else
	ldr r2, [r1, #0xa8]
	ldr ip, [r1, #0xa4]
#endif
	str r2, [sp, #0x60]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x5c
	mov r2, r5
	str ip, [sp, #0x5c]
	bl Debug_FatalError
_02022C64:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234EC ; =_02099B6C
	bl StrcmpTag
	cmp r0, #0
	beq _02022C9C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	ldr r2, [r0, #0x24]
	add r0, sp, #0x1c8
	bl sub_020242F8
	mov r7, r0
	b _020232F0
_02022C9C:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F0 ; =_02099B74
	bl StrcmpTag
	cmp r0, #0
	beq _02022CD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _020234F4 ; =_02099B7C
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022CD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234F8 ; =_02099B8C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D04
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringAccuracy
	mov r7, r0
	b _020232F0
_02022D04:
	ldr r0, [sp, #0xb4]
	ldr r1, _020234FC ; =_02099B9C
	bl StrcmpTag
	cmp r0, #0
	beq _02022D34
	ldr r1, [r8, #0x34]
	add r0, sp, #0x1c8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl SetStringPower
	mov r7, r0
	b _020232F0
_02022D34:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0xd0]
	ldr ip, [r1, #0xcc]
#else
	ldr r2, [r1, #0xc0]
	ldr ip, [r1, #0xbc]
#endif
	str r2, [sp, #0x58]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x54
	mov r2, r5
	str ip, [sp, #0x54]
	bl Debug_FatalError
_02022D5C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023500 ; =_02099BA8
	bl StrcmpTag
	cmp r0, #0
	beq _02022D84
	add r0, sp, #0x1c8
	mov r1, #0x3d
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022D84:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023504 ; =_02099BB0
	bl StrcmpTag
	cmp r0, #0
	beq _02022DAC
	add r0, sp, #0x1c8
	mov r1, #0x3e
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DAC:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023508 ; =_02099BBC
	bl StrcmpTag
	cmp r0, #0
	beq _02022DD4
	add r0, sp, #0x1c8
	mov r1, #0x3f
	bl sub_02023DC0
	mov r7, r0
	b _020232F0
_02022DD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202350C ; =_02099BC4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E08
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024A68
	mov r7, r0
	b _020232F0
_02022E08:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x118]
	ldr ip, [r1, #0x114]
#else
	ldr r2, [r1, #0xf0]
	ldr ip, [r1, #0xec]
#endif
	str r2, [sp, #0x50]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x4c
	mov r2, r5
	str ip, [sp, #0x4c]
	bl Debug_FatalError
_02022E30:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023510 ; =_02099BCC
	bl StrcmpTag
	cmp r0, #0
	beq _02022E64
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024AF4
	mov r7, r0
	b _020232F0
_02022E64:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023514 ; =_02099BD4
	bl StrcmpTag
	cmp r0, #0
	beq _02022E98
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B48
	mov r7, r0
	b _020232F0
_02022E98:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x14]
#else
	ldr r2, [r1, #8]
	ldr ip, [r1, #4]
#endif
	str r2, [sp, #0x48]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x44
	mov r2, r5
	str ip, [sp, #0x44]
	bl Debug_FatalError
_02022EC0:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023518 ; =_02099BDC
	bl StrcmpTag
	cmp r0, #0
	beq _02022EF8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r2, #0
	orr r1, r0, #0x50000
	add r0, sp, #0x1c8
	mov r3, r2
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02022EF8:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202351C ; =_02099BE4
	bl StrcmpTag
	cmp r0, #0
	ldrne r7, [r8, #0x38]
	bne _020232F0
	ldr r0, [sp, #0xb4]
	ldr r1, _02023520 ; =_02099BEC
	bl StrcmpTag
	cmp r0, #0
	beq _02022F40
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r7, [r0, #0x38]
	b _020232F0
_02022F40:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023524 ; =_02099BF4
	bl StrcmpTag
	cmp r0, #0
	beq _02022F78
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r2, [r0, #0x24]
	ldr r1, _02023528 ; =_02099BFC
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02022F78:
	ldr r1, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x2c]
	str r2, [sp, #0x40]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x3c
	mov r2, r5
	str ip, [sp, #0x3c]
	bl Debug_FatalError
_02022FA0:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202352C ; =_02099C0C
	bl StrcmpTag
	cmp r0, #0
	beq _02022FD4
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024B94
	mov r7, r0
	b _020232F0
_02022FD4:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023530 ; =_02099C14
	bl StrcmpTag
	cmp r0, #0
	beq _02023008
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_020244F4
	mov r7, r0
	b _020232F0
_02023008:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023534 ; =_02099C1C
	bl StrcmpTag
	cmp r0, #0
	beq _0202303C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024D48
	mov r7, r0
	b _020232F0
_0202303C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023538 ; =_02099C24
	bl StrcmpTag
	cmp r0, #0
	beq _02023094
	cmp r6, #1
	bne _0202306C
	add r0, sp, #0x1c8
	mov r1, #0
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_0202306C:
	cmp r6, #2
	bne _020232F0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl GetCurrentTeamNameString
	mov r7, r0
	b _020232F0
_02023094:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202353C ; =_02099C2C
	bl StrcmpTag
	cmp r0, #0
	beq _02023114
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r5, [r0, #0x24]
	mov r1, #0xe10
	mov r0, r5
	bl _u32_div_f
	mov r6, r0
	mov r0, r5
	mov r1, #0xe10
	bl _u32_div_f
	mov r5, r1
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	mov r7, r0
	mov r0, r5
	mov r1, #0x3c
	bl _u32_div_f
	str r1, [sp]
	ldr r1, _02023540 ; =_02099C34
	mov r2, r6
	mov r3, r7
	add r0, sp, #0x1c8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_02023114:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa0]
	ldr r2, [r0, #0x9c]
#else
	ldr r1, [r0, #0xb0]
	ldr r2, [r0, #0xac]
#endif
	str r1, [sp, #0x38]
	str r2, [sp, #0x34]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x34
	mov r2, r5
	bl Debug_FatalError
_0202313C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023544 ; =_02099C44
	bl StrcmpTag
	cmp r0, #0
	beq _02023180
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	mov r2, r0
	ldr r1, [r1, #0x24]
	add r0, sp, #0x1c8
	bl sub_0202372C
	mov r7, r0
	b _020232F0
_02023180:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023548 ; =_02099C4C
	bl StrcmpTag
	cmp r0, #0
	beq _020231D8
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	mov r5, r0
	ldr r0, [sp, #0xbc]
	bl AtoiTag
	add r1, r8, r5, lsl #2
	ldr r3, [r1, #0x24]
	mov r2, r0
	ldr r1, _0202354C ; =_02099C54
	add r0, sp, #0xc8
	bl SprintfStatic__02023590
	ldr r1, _02023550 ; =_02099C5C
	add r0, sp, #0x1c8
	add r2, sp, #0xc8
	bl SprintfStatic__02023590
	add r7, sp, #0x1c8
	b _020232F0
_020231D8:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023554 ; =_02099C68
	bl StrcmpTag
	cmp r0, #0
	beq _02023214
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r2, r8, r0, lsl #2
	ldr r1, [r2, #0x10]
	ldr r2, [r2, #0x24]
	add r0, sp, #0x1c8
	mov r3, #0
	bl sub_020241DC
	mov r7, r0
	b _020232F0
_02023214:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xc0]
	ldr r2, [r0, #0xbc]
#else
	ldr r1, [r0, #0xd0]
	ldr r2, [r0, #0xcc]
#endif
	str r1, [sp, #0x30]
	str r2, [sp, #0x2c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x2c
	mov r2, r5
	bl Debug_FatalError
_0202323C:
	ldr r0, [sp, #0xb4]
	ldr r1, _02023558 ; =_02099C70
	bl StrcmpTag
	cmp r0, #0
	beq _0202326C
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	ldr r1, [r8, r0, lsl #2]
	add r0, sp, #0x1c8
	bl sub_02024AA8
	mov r7, r0
	b _020232F0
_0202326C:
	ldr r0, [sp, #0xb4]
	ldr r1, _0202355C ; =_02099C78
	bl StrcmpTag
	cmp r0, #0
	beq _020232A0
	ldr r0, [sp, #0xb8]
	bl AtoiTag
	add r0, r8, r0, lsl #2
	ldr r1, [r0, #0x10]
	add r0, sp, #0x1c8
	bl sub_02024BD8
	mov r7, r0
	b _020232F0
_020232A0:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
	ldr r1, [r0, #0x38]
	ldr r2, [r0, #0x34]
	str r1, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x24
	mov r2, r5
	bl Debug_FatalError
_020232C8:
	ldr r0, _02023480 ; =_020997E4
	ldr r3, [sp, #0xb4]
#ifdef EUROPE
	ldr r1, [r0, #0xa8]
	ldr r2, [r0, #0xa4]
#else
	ldr r1, [r0, #0xd8]
	ldr r2, [r0, #0xd4]
#endif
	str r1, [sp, #0x20]
	str r2, [sp, #0x1c]
	ldr r1, _02023484 ; =_020999B0
	add r0, sp, #0x1c
	mov r2, r5
	bl Debug_FatalError
_020232F0:
	cmp r7, #0
	beq _02022434
_020232F8:
	ldr r2, [sp, #0x5f0]
	cmp r2, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldrb r1, [r7], #1
	cmp r1, #0
	beq _02022434
	add r0, r2, #1
	str r0, [sp, #0x5f0]
	strb r1, [r2]
	b _020232F8
_0202332C:
	cmp r2, #0x41
	blo _0202342C
	cmp r2, #0x5a
	bhi _0202342C
	ldr r1, _02023560 ; =_02099A24
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	bne _02023364
	ldr r1, _02023564 ; =_020999D4
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _02023390
_02023364:
	ldr r0, [sp, #0x5f8]
	ldrb r0, [r0]
	cmp r0, #0xd
	cmpne r0, #0xa
	ldreq r0, [sp, #0x5f8]
	addeq r0, r0, #1
	streq r0, [sp, #0x5f8]
	mov r0, #1
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	b _020233D8
_02023390:
	ldr r1, _02023568 ; =_02099A28
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	beq _020233BC
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02023574
	mov r0, #1
	str r0, [sp, #0xc]
	b _020233D8
_020233BC:
	ldr r1, _0202356C ; =_02099A04
	add r0, r5, #1
	bl StrcmpTag
	cmp r0, #0
	ldrne r0, [sp, #4]
	cmpne r0, #0
	bne _02023574
_020233D8:
	ldr r2, [sp, #0x5f0]
	mov r0, #0x5b
	add r1, r2, #1
	str r1, [sp, #0x5f0]
	strb r0, [r2]
_020233EC:
	ldr r3, [sp, #0x5f0]
	cmp r3, r4
	moveq r1, #0
	moveq r0, sb
	streqb r1, [r4, #-1]
	beq _0202357C
	ldr r2, [sp, #0x5f8]
	add r0, r3, #1
	add r1, r2, #1
	str r1, [sp, #0x5f8]
	ldrb r1, [r2]
	str r0, [sp, #0x5f0]
	strb r1, [r3]
	cmp r1, #0x5d
	beq _02022434
	b _020233EC
_0202342C:
	ldr r1, _02023480 ; =_020997E4
	add r0, sp, #0x14
#ifdef EUROPE
	ldr r3, [r1, #0xb0]
	ldr r1, [r1, #0xac]
#else
	ldr r3, [r1, #0x110]
	ldr r1, [r1, #0x10c]
#endif
	str r3, [sp, #0x18]
	str r1, [sp, #0x14]
	ldr r1, _02023570 ; =_02099C84
	mov r3, r2
	str r5, [sp]
	bl Debug_FatalError
_02023454:
	add r1, sp, #0x500
	add r0, sp, #0x5f0
	add r1, r1, #0xf8
	mov r2, r4
	bl sub_020206FC
	b _02022434
	.align 2, 0
_0202346C: .word _02099A5C
_02023470: .word _02099A64
_02023474: .word _02099A70
_02023478: .word _02099A74
_0202347C: .word _02099A7C
_02023480: .word _020997E4
_02023484: .word _020999B0
_02023488: .word _02099A84
_0202348C: .word _02099A8C
_02023490: .word _02099A98
_02023494: .word _02099AA0
_02023498: .word _02099AA4
_0202349C: .word _02099AAC
_020234A0: .word _02099AB8
_020234A4: .word _02099AC0
_020234A8: .word _02099AC8
_020234AC: .word _02099AD0
_020234B0: .word _02099AD4
_020234B4: .word _02099AE0
_020234B8: .word _02099AF0
_020234BC: .word _02099AF8
_020234C0: .word _02099B04
_020234C4: .word _02099B10
_020234C8: .word _02099B18
_020234CC: .word _02099B24
_020234D0: .word _02099B2C
_020234D4: .word _02099B34
_020234D8: .word _02099B40
_020234DC: .word _02099B48
_020234E0: .word _02099B50
_020234E4: .word _02099B58
_020234E8: .word _02099B60
_020234EC: .word _02099B6C
_020234F0: .word _02099B74
_020234F4: .word _02099B7C
_020234F8: .word _02099B8C
_020234FC: .word _02099B9C
_02023500: .word _02099BA8
_02023504: .word _02099BB0
_02023508: .word _02099BBC
_0202350C: .word _02099BC4
_02023510: .word _02099BCC
_02023514: .word _02099BD4
_02023518: .word _02099BDC
_0202351C: .word _02099BE4
_02023520: .word _02099BEC
_02023524: .word _02099BF4
_02023528: .word _02099BFC
_0202352C: .word _02099C0C
_02023530: .word _02099C14
_02023534: .word _02099C1C
_02023538: .word _02099C24
_0202353C: .word _02099C2C
_02023540: .word _02099C34
_02023544: .word _02099C44
_02023548: .word _02099C4C
_0202354C: .word _02099C54
_02023550: .word _02099C5C
_02023554: .word _02099C68
_02023558: .word _02099C70
_0202355C: .word _02099C78
_02023560: .word _02099A24
_02023564: .word _020999D4
_02023568: .word _02099A28
_0202356C: .word _02099A04
_02023570: .word _02099C84
_02023574:
	ldr r0, [sp, #0x5f0]
	sub r0, r0, sl
_0202357C:
	add sp, sp, #0x1c8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end PreprocessString

	arm_func_start SprintfStatic__02023590
SprintfStatic__02023590: ; 0x02023590
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
	arm_func_end SprintfStatic__02023590

	arm_func_start PreprocessStringFromId
PreprocessStringFromId: ; 0x020235B8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r2
	mov r5, r1
	mov r4, r3
	bl StringFromId
	ldr ip, [sp, #0x18]
	mov r2, r0
	mov r0, r6
	mov r1, r5
	mov r3, r4
	str ip, [sp]
	bl PreprocessString
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end PreprocessStringFromId

	arm_func_start StrcmpTagVeneer
StrcmpTagVeneer: ; 0x020235F8
	ldr ip, _02023600 ; =StrcmpTag
	bx ip
	.align 2, 0
_02023600: .word StrcmpTag
	arm_func_end StrcmpTagVeneer

	arm_func_start AtoiTagVeneer
AtoiTagVeneer: ; 0x02023604
	ldr ip, _0202360C ; =AtoiTag
	bx ip
	.align 2, 0
_0202360C: .word AtoiTag
	arm_func_end AtoiTagVeneer

#ifdef EUROPE
	arm_func_start sub_0202380C_EU
sub_0202380C_EU: ; 0x0202380C
	ldr ip, _02023814 ; =sub_02020A4C
	bx ip
	.align 2, 0
_02023814: .word sub_02020A4C
	arm_func_end sub_0202380C_EU
#endif

	arm_func_start sub_02023610
sub_02023610: ; 0x02023610
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#ifdef EUROPE
	bl GetLanguageType
	cmp r0, #5
	moveq r1, #1
	ldr r0, _02023864 ; =_020B05BC_EU
	movne r1, #0
#endif
	ldr r6, _02023644 ; =_022A5048
	ldr r5, _02023648 ; =_02099CA0
	mov r7, #0
#ifdef EUROPE
	strb r1, [r0]
#endif
	mov r4, #1
_02023624:
	mov r2, r4
	add r0, r6, r7, lsl #2
	add r1, r5, r7
	bl StrncpySimpleNoPadSafe
	add r7, r7, #1
	cmp r7, #3
	blt _02023624
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
#ifdef EUROPE
_02023864: .word _020B05BC_EU
#endif
_02023644: .word _022A5048
_02023648: .word _02099CA0
	arm_func_end sub_02023610

	arm_func_start sub_0202364C
sub_0202364C: ; 0x02023610
	ldrb r2, [r1], #1
	ldrb r3, [r0], #1
	cmp r2, #0
	bne _02023674
	cmp r3, #0
	cmpne r3, #0x3a
	cmpne r3, #0x5d
	moveq r0, #1
	movne r0, #0
	bx lr
_02023674:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r2
	beq sub_0202364C
	mov r0, #0
	bx lr
	arm_func_end sub_0202364C

	arm_func_start InitPreprocessorArgs
InitPreprocessorArgs: ; 0x02023690
	mov r1, #0x60000
	str r1, [r0, #0x4c]
	mov r1, #0
	mov r3, r1
_020236A0:
	str r3, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #4
	blt _020236A0
	mov r2, #0
_020236B4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x10]
	cmp r3, #5
	blt _020236B4
	mov r3, #0
_020236CC:
	add r1, r0, r2, lsl #2
	add r2, r2, #1
	str r3, [r1, #0x24]
	cmp r2, #5
	blt _020236CC
	mov r2, #0
_020236E4:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #0x38]
	cmp r3, #5
	blt _020236E4
	bx lr
	arm_func_end InitPreprocessorArgs

	arm_func_start sub_020236FC
sub_020236FC: ; 0x020236FC
	stmdb sp!, {r4, lr}
	movs lr, r1
	mov r4, r0
	beq _02023724
	mov ip, #5
_02023710:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02023710
	ldmia sp!, {r4, pc}
_02023724:
	bl InitPreprocessorArgs
	ldmia sp!, {r4, pc}
	arm_func_end sub_020236FC

	arm_func_start sub_0202372C
sub_0202372C: ; 0x0202372C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x100
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _02023784 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r2, r0
	cmp r2, r4
	movgt r4, r2
	ldr r1, _02023788 ; =_02099D10
	add r3, sp, #0
	mov r0, r5
	sub r2, r4, r2
	bl SprintfStatic__0202378C
	mov r0, r5
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef EUROPE
_02023784: .word _0209A230_EU
#else
_02023784: .word _02099D0C
#endif
_02023788: .word _02099D10
	arm_func_end sub_0202372C

	arm_func_start SprintfStatic__0202378C
SprintfStatic__0202378C: ; 0x0202378C
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
	arm_func_end SprintfStatic__0202378C

	arm_func_start sub_020237B4
sub_020237B4: ; 0x020237B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x100
#ifdef EUROPE
	mov r4, r1
	mov r8, r0
	mov r7, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r4
	mov r6, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r7, #0
	ble _02023A38
	cmp r5, r7
	movgt r7, r5
	sub r0, r7, #1
	mov r1, #3
	bl _s32_div_f
_02023A38:
	ldr r1, _02023B14 ; =_020B05BC_EU
	ldrb r1, [r1]
	cmp r1, #0
	beq _02023A50
	cmp r5, #4
	movle r4, #0
_02023A50:
	cmp r4, #0
	ble _02023AD0
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov lr, #0
	add sl, sb, r4, lsl #2
	mov ip, lr
	strb lr, [sl, #1]
	mov r3, #0x5d
	mov r2, #0x50
	mov fp, #0x5b
	b _02023AC8
_02023A84:
	cmp lr, #3
	blt _02023AB8
	strb r3, [sl]
	cmp r6, #0
	movne r1, #0x47
	strb r2, [sl, #-1]
	moveq r1, #0x4d
	strb r1, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023AD0
	mov lr, #0
_02023AB8:
	ldrb r1, [sb], #-1
	add lr, lr, #1
	add ip, ip, #1
	strb r1, [sl], #-1
_02023AC8:
	cmp ip, r5
	blt _02023A84
_02023AD0:
	cmp r7, #0
	ble _02023AF8
	sub r1, r7, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r8
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _02023B04
_02023AF8:
	add r1, sp, #0
	mov r0, r8
	bl strcpy
_02023B04:
	mov r0, r8
#else
	mov r3, r1
	mov r7, r0
	mov r6, r2
	ldr r1, _020238C8 ; =_02099D0C
	add r0, sp, #0
	mov r2, r3
	bl SprintfStatic__0202378C
	add r0, sp, #0
	bl strlen
	mov r5, r0
	sub r0, r5, #1
	mov r1, #3
	bl _s32_div_f
	mov r4, r0
	cmp r6, #0
	ble _02023810
	cmp r5, r6
	movgt r6, r5
	sub r0, r6, #1
	mov r1, #3
	bl _s32_div_f
_02023810:
	cmp r4, #0
	ble _02023888
	add r2, sp, #0
	sub r1, r5, #1
	add sb, r2, r1
	mov r8, #0
	add sl, sb, r4, lsl #2
	mov lr, r8
	strb r8, [sl, #1]
	mov ip, #0x5d
	mov r3, #0x50
	mov r2, #0x4d
	mov fp, #0x5b
	b _02023880
_02023848:
	cmp r8, #3
	blt _02023870
	strb ip, [sl]
	strb r3, [sl, #-1]
	strb r2, [sl, #-2]
	strb fp, [sl, #-3]
	sub sl, sl, #4
	cmp sl, sb
	beq _02023888
	mov r8, #0
_02023870:
	ldrb r1, [sb], #-1
	add r8, r8, #1
	add lr, lr, #1
	strb r1, [sl], #-1
_02023880:
	cmp lr, r5
	blt _02023848
_02023888:
	cmp r6, #0
	ble _020238B0
	sub r1, r6, r5
	add r2, r0, r1
	ldr r1, _020238CC ; =_02099D10
	add r3, sp, #0
	mov r0, r7
	sub r2, r2, r4
	bl SprintfStatic__0202378C
	b _020238BC
_020238B0:
	add r1, sp, #0
	mov r0, r7
	bl strcpy
_020238BC:
	mov r0, r7
#endif
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef EUROPE
_020238C8: .word _0209A230_EU
_02023B14: .word _020B05BC_EU
#else
_020238C8: .word _02099D0C
#endif
_020238CC: .word _02099D10
	arm_func_end sub_020237B4

	arm_func_start sub_020238D0
sub_020238D0: ; 0x020238D0
	ldr ip, _020238DC ; =sub_020237B4
	mov r2, #5
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238DC: .word sub_020237B4
	arm_func_end sub_020238D0

	arm_func_start sub_020238E0
sub_020238E0: ; 0x020238E0
	ldr ip, _020238EC ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238EC: .word sub_020237B4
	arm_func_end sub_020238E0

	arm_func_start sub_020238F0
sub_020238F0: ; 0x020238F0
	ldr ip, _020238FC ; =sub_020237B4
	mov r2, #7
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_020238FC: .word sub_020237B4
	arm_func_end sub_020238F0

	arm_func_start sub_02023900
sub_02023900: ; 0x02023900
	ldr ip, _0202390C ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, #1
#endif
	bx ip
	.align 2, 0
_0202390C: .word sub_020237B4
	arm_func_end sub_02023900

	arm_func_start sub_02023910
sub_02023910: ; 0x02023910
	ldr ip, _0202391C ; =sub_020237B4
	mov r2, #0
#ifdef EUROPE
	mov r3, r2
#endif
	bx ip
	.align 2, 0
_0202391C: .word sub_020237B4
	arm_func_end sub_02023910

	arm_func_start sub_02023920
sub_02023920: ; 0x02023920
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x40000
	mov r4, r2, lsr #0x10
	bgt _02023978
	cmp r1, #0x40000
	bge _02023B44
	cmp r1, #0x10000
	bgt _0202395C
	bge _02023A30
	cmp r1, #0
	beq _020239AC
	b _02023B44
_0202395C:
	cmp r1, #0x20000
	bgt _0202396C
	beq _02023A40
	b _02023B44
_0202396C:
	cmp r1, #0x30000
	beq _02023A8C
	b _02023B44
_02023978:
	cmp r1, #0x70000
	bgt _02023990
	bge _02023B3C
	cmp r1, #0x60000
	beq _02023B34
	b _02023B44
_02023990:
	cmp r1, #0x80000
	bgt _020239A0
	beq _020239D0
	b _02023B44
_020239A0:
	cmp r1, #0x90000
	beq _02023AE0
	b _02023B44
_020239AC:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020239D0:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGender
	cmp r0, #1
	beq _02023A0C
	cmp r0, #2
	beq _02023A1C
	b _02023A28
_02023A0C:
	ldr r1, _02023B50 ; =_022A5048
	mov r0, r5
	bl strcat
	b _02023A28
_02023A1C:
	ldr r1, _02023B54 ; =_022A504C
	mov r0, r5
	bl strcat
_02023A28:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A30:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r3, r4, r5, pc}
_02023A40:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023A8C:
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #0xc]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B4C ; =_02099D1C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023AE0:
	mov r0, #0x44
	ldr r1, _02023B58 ; =TEAM_MEMBER_TABLE_PTR
	mul r2, r4, r0
	ldr r0, [r1]
	add r0, r0, #0x98
	add r1, r0, #0x9800
	ldrb r0, [r1, r2]
	add r1, r1, r2
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023B44
	ldrsh r0, [r1, #4]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023B5C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02023B34:
	ldr r0, _02023B60 ; =_02099D3C
	ldmia sp!, {r3, r4, r5, pc}
_02023B3C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02023B44:
	ldr r0, _02023B64 ; =_02099D50
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023B4C: .word _02099D1C
_02023B50: .word _022A5048
_02023B54: .word _022A504C
_02023B58: .word TEAM_MEMBER_TABLE_PTR
_02023B5C: .word _02099D2C
_02023B60: .word _02099D3C
_02023B64: .word _02099D50
	arm_func_end sub_02023920

	arm_func_start sub_02023B68
sub_02023B68: ; 0x02023B68
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r2, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r5, r0
	cmp r1, #0x30000
	mov r4, r2, lsr #0x10
	bgt _02023BB4
	cmp r1, #0x30000
	bge _02023C90
	cmp r1, #0x10000
	bgt _02023BA8
	bge _02023C08
	cmp r1, #0
	beq _02023BE4
	b _02023D40
_02023BA8:
	cmp r1, #0x20000
	beq _02023C18
	b _02023D40
_02023BB4:
	cmp r1, #0x50000
	bgt _02023BC8
	bge _02023D14
	cmp r1, #0x40000
	b _02023D40
_02023BC8:
	cmp r1, #0x60000
	bgt _02023BD8
	beq _02023D30
	b _02023D40
_02023BD8:
	cmp r1, #0x70000
	beq _02023D38
	b _02023D40
_02023BE4:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetNameString
	mov r2, r0
	ldr r1, _02023D4C ; =_02099D2C
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02023D44
_02023C08:
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	b _02023D44
_02023C18:
	mov r0, #0x44
	mul r1, r4, r0
	ldr r0, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0
	beq _02023C7C
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023C88
_02023C7C:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023C88:
	mov r0, r5
	b _02023D44
_02023C90:
	ldr r1, _02023D50 ; =TEAM_MEMBER_TABLE_PTR
	mov r0, #0x68
	ldr r2, [r1]
	mul r1, r4, r0
	add r0, r2, #0x9000
	ldr r2, [r0, #0x84c]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D40
	add r0, sp, #0
	add r1, r4, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldrb r0, [r4, #1]
	add r2, sp, #0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02023D00
	ldr r1, _02023D54 ; =_02099D54
	mov r0, r5
	bl SprintfStatic__0202378C
	b _02023D0C
_02023D00:
	ldr r1, _02023D58 ; =_02099D64
	mov r0, r5
	bl SprintfStatic__0202378C
_02023D0C:
	mov r0, r5
	b _02023D44
_02023D14:
	mov r0, r4
	bl sub_02024FB8
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02023D44
_02023D30:
	ldr r0, _02023D5C ; =_02099D3C
	b _02023D44
_02023D38:
	mov r0, #0
	b _02023D44
_02023D40:
	ldr r0, _02023D60 ; =_02099D50
_02023D44:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02023D4C: .word _02099D2C
_02023D50: .word TEAM_MEMBER_TABLE_PTR
_02023D54: .word _02099D54
_02023D58: .word _02099D64
_02023D5C: .word _02099D3C
_02023D60: .word _02099D50
	arm_func_end sub_02023B68

	arm_func_start sub_02023D64
sub_02023D64: ; 0x02023D64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023DAC
	ldrsh r0, [sp]
	bl GetNameString
	mov r2, r0
	ldr r1, _02023DBC ; =_02099D1C
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
_02023DAC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023DBC: .word _02099D1C
	arm_func_end sub_02023D64

	arm_func_start sub_02023DC0
sub_02023DC0: ; 0x02023DC0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x84
	mov r4, r0
	add r0, sp, #0x94
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02023F98
	ldrsh r0, [sp, #0x94]
	cmp r0, #0x39
	bne _02023E18
	add r0, sp, #0x42
	bl sub_02065BF0
	ldr r1, _02023FA8 ; =_02099D64
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02023F98
_02023E18:
	cmp r0, #0x42
	bne _02023E44
	add r1, sp, #2
	mov r0, #0x3f
	mov r2, #0xa
	bl sub_0204BBB0
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E44:
	cmp r0, #0x43
	bne _02023E70
	add r1, sp, #2
	mov r0, #0x41
	mov r2, #0xa
	bl sub_0204BBB0
	add r0, sp, #0x42
	add r1, sp, #2
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023F5C
_02023E70:
	bl GetActorMatchingStorageId
	mov r5, r0
	mvn r1, #0
	cmp r5, r1
	beq _02023F2C
	bl GetActiveRosterIndex
	mvn r1, #0
	cmp r0, r1
	beq _02023EB0
	bl GetActiveTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x5e
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	b _02023ECC
_02023EB0:
	mov r0, r5
	bl GetTeamMember
	mov r1, r0
	add r0, sp, #0x42
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
_02023ECC:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023EF4
	cmp r0, #0xa
	bge _02023EF4
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023EF4:
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0x42
	beq _02023F18
	ldr r1, _02023FAC ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F24
_02023F18:
	ldr r1, _02023FA8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F24:
	mov r0, r4
	b _02023F98
_02023F2C:
	ldrsh r0, [sp, #0x94]
	bl sub_02065B14
	movs r1, r0
	beq _02023F48
	add r0, sp, #0x42
	bl GetStringFromFileVeneer
	b _02023F5C
_02023F48:
	ldrsh r0, [sp]
	bl GetNameString
	mov r1, r0
	add r0, sp, #0x42
	bl strcpy
_02023F5C:
	ldrsh r0, [sp, #0x94]
	cmp r0, #0
	blt _02023F84
	cmp r0, #0xa
	bge _02023F84
	ldr r1, _02023FAC ; =_02099D54
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02023F94
_02023F84:
	ldr r1, _02023FB0 ; =_02099D2C
	add r2, sp, #0x42
	mov r0, r4
	bl SprintfStatic__0202378C
_02023F94:
	mov r0, r4
_02023F98:
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02023FA8: .word _02099D64
_02023FAC: .word _02099D54
_02023FB0: .word _02099D2C
	arm_func_end sub_02023DC0

	arm_func_start sub_02023FB4
sub_02023FB4: ; 0x02023FB4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x8c
	mov r4, r0
	add r0, sp, #0xa4
	add r1, sp, #0
	bl sub_0206549C
	ldrsh r0, [sp]
	cmp r0, #0
	moveq r0, #0
	beq _02024094
	ldrsh r0, [sp, #0xa4]
	bl GetActorMatchingStorageId
	mov r5, r0
	bl GetTeamMember
	movs r6, r0
	beq _02024014
	add r0, sp, #0x4c
	add r1, r6, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	add r0, sp, #0x4c
	str r0, [sp, #8]
	b _02024020
_02024014:
	ldrsh r0, [sp]
	bl GetNameString
	str r0, [sp, #8]
_02024020:
	add r3, sp, #0xc
	add r0, sp, #4
	add r1, sp, #8
	add r2, sp, #0x4c
	str r3, [sp, #4]
	bl sub_020206FC
	ldr r0, [sp, #4]
	mov r1, #0
	strb r1, [r0]
	cmp r6, #0
	beq _02024080
	mov r0, r5
	bl sub_020564B0
	cmp r0, #0
	add r2, sp, #0xc
	beq _02024070
	ldr r1, _020240A4 ; =_02099D54
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024070:
	ldr r1, _020240A8 ; =_02099D64
	mov r0, r4
	bl SprintfStatic__0202378C
	b _02024090
_02024080:
	ldr r1, _020240AC ; =_02099D2C
	add r2, sp, #0xc
	mov r0, r4
	bl SprintfStatic__0202378C
_02024090:
	mov r0, r4
_02024094:
	add sp, sp, #0x8c
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020240A4: .word _02099D54
_020240A8: .word _02099D64
_020240AC: .word _02099D2C
	arm_func_end sub_02023FB4

	arm_func_start sub_020240B0
sub_020240B0: ; 0x020240B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _0202410C ; =ENTITIES
	mov r6, #0
	ldr r4, _02024110 ; =0x00000182
	b _020240FC
_020240CC:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020240F4
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023D64
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020240F4:
	add r6, r6, #1
	add r5, r5, #0xc
_020240FC:
	cmp r6, r4
	blt _020240CC
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202410C: .word ENTITIES
_02024110: .word 0x00000182
	arm_func_end sub_020240B0

	arm_func_start sub_02024114
sub_02024114: ; 0x02024114
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02024170 ; =ENTITIES
	mov r6, #0
	ldr r4, _02024174 ; =0x00000182
	b _02024160
_02024130:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _02024158
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023DC0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02024158:
	add r6, r6, #1
	add r5, r5, #0xc
_02024160:
	cmp r6, r4
	blt _02024130
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02024170: .word ENTITIES
_02024174: .word 0x00000182
	arm_func_end sub_02024114

	arm_func_start sub_02024178
sub_02024178: ; 0x02024178
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _020241D4 ; =ENTITIES
	mov r6, #0
	ldr r4, _020241D8 ; =0x00000182
	b _020241C4
_02024194:
	ldr r1, [r5, #4]
	mov r0, r7
	bl sub_0202364C
	cmp r0, #0
	beq _020241BC
	mov r1, r6, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl sub_02023FB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020241BC:
	add r6, r6, #1
	add r5, r5, #0xc
_020241C4:
	cmp r6, r4
	blt _02024194
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020241D4: .word ENTITIES
_020241D8: .word 0x00000182
	arm_func_end sub_02024178

	arm_func_start sub_020241DC
sub_020241DC: ; 0x020241DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov ip, r1, lsl #0x10
	and lr, r1, #0x70000
	mov r4, r0
	cmp lr, #0x20000
	mov r5, ip, lsr #0x10
	bgt _02024220
	cmp lr, #0x20000
	bge _020242E0
	cmp lr, #0
	bgt _02024214
	beq _02024240
	b _020242E0
_02024214:
	cmp lr, #0x10000
	beq _0202426C
	b _020242E0
_02024220:
	cmp lr, #0x40000
	bgt _02024234
	bge _0202429C
	cmp lr, #0x30000
	b _020242E0
_02024234:
	cmp lr, #0x50000
	beq _020242AC
	b _020242E0
_02024240:
	tst r1, #0x80000
	movne r2, #1
	moveq r2, #0
	mov r1, r5, lsl #0x10
	and r3, r2, #0xff
	mov r0, r4
	mov r1, r1, asr #0x10
	mov r2, #1
	bl GetItemNameFormatted
	mov r0, r4
	b _020242E4
_0202426C:
	strh r2, [sp, #0xc]
	mov ip, #0
	strb r3, [sp, #0xa]
	ldr r2, _020242EC ; =_02099CAC
	add r1, sp, #0xa
	strb ip, [sp, #0xb]
	strh r5, [sp, #0xe]
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	mov r0, r4
	b _020242E4
_0202429C:
	mov r1, r5
	bl sub_0202507C
	mov r0, r4
	b _020242E4
_020242AC:
	mov r0, r5, lsl #0x10
	add r1, sp, #4
	mov r0, r0, asr #0x10
	bl sub_02065CD8
	mov ip, #0
	ldr r2, _020242F0 ; =_02099CB8
	add r1, sp, #4
	mov r0, r4
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	mov r0, r4
	b _020242E4
_020242E0:
	ldr r0, _020242F4 ; =_02099D50
_020242E4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020242EC: .word _02099CAC
_020242F0: .word _02099CB8
_020242F4: .word _02099D50
	arm_func_end sub_020241DC

	arm_func_start sub_020242F8
sub_020242F8: ; 0x020242F8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r0, r2, lsr #0x10
	ands r1, r1, #0x30000
	beq _0202431C
	cmp r1, #0x10000
	beq _02024338
	b _02024350
_0202431C:
	bl GetMoveName
	mov r2, r0
	ldr r1, _02024358 ; =_02099D74
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024338:
	bl GetDungeonResultString
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024350:
	ldr r0, _0202435C ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024358: .word _02099D74
_0202435C: .word _02099D50
	arm_func_end sub_020242F8

	arm_func_start SetStringAccuracy
SetStringAccuracy: ; 0x02024360
#if defined(EUROPE)
#define SET_STRING_ACCURACY_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_ACCURACY_OFFSET 0x17FD
#else
#define SET_STRING_ACCURACY_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02024410 ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _02024408
	ldr r0, _02024414 ; =0x000029C1
	cmp r1, r0
	bhs _02024408
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveActualAccuracy
	mov r6, #1
	mov r3, #0
	ldr r2, _02024418 ; =MOVE_ACCURACY_STARS_TABLE
	b _020243B8
_020243A4:
	ldr r1, [r2, r3, lsl #2]
	cmp r0, r1
	blt _020243C0
	add r6, r6, #1
	add r3, r3, #1
_020243B8:
	cmp r3, #8
	blt _020243A4
_020243C0:
	cmp r6, #8
	ble _020243D8
	ldr r1, _0202441C ; =0x000027A0
	mov r0, r4
	bl GetStringFromFileVeneer
	b _02024400
_020243D8:
	mov r7, #0
	strb r7, [r4]
	ldr r5, _02024420 ; =_02099D84
	b _020243F8
_020243E8:
	mov r0, r4
	mov r1, r5
	bl strcat
	add r7, r7, #1
_020243F8:
	cmp r7, r6
	blt _020243E8
_02024400:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02024408:
	ldr r0, _02024424 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02024410: .word 0x000027A2 + SET_STRING_ACCURACY_OFFSET
_02024414: .word 0x000029C1 + SET_STRING_ACCURACY_OFFSET
_02024418: .word MOVE_ACCURACY_STARS_TABLE
_0202441C: .word 0x000027A0 + SET_STRING_ACCURACY_OFFSET
_02024420: .word _02099D84
_02024424: .word _02099D50
	arm_func_end SetStringAccuracy

	arm_func_start SetStringPower
SetStringPower: ; 0x02024428
#if defined(EUROPE)
#define SET_STRING_POWER_OFFSET 2
#elif defined(JAPAN)
#define SET_STRING_POWER_OFFSET 0x17FD
#else
#define SET_STRING_POWER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020244DC ; =0x000027A2
	mov r4, r0
	cmp r1, r2
	blo _020244D4
	ldr r0, _020244E0 ; =0x000029C1
	cmp r1, r0
	bhs _020244D4
	rsb r0, r2, #0
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl GetMoveBasePowerFromId
	mov r3, #0
	mov r5, r3
	ldr r2, _020244E4 ; =MOVE_POWER_STARS_TABLE
	b _02024480
_0202446C:
	ldr r1, [r2, r5, lsl #2]
	cmp r0, r1
	blt _02024488
	add r3, r3, #1
	add r5, r5, #1
_02024480:
	cmp r5, #6
	blt _0202446C
_02024488:
	cmp r3, #0
	bne _020244A0
	ldr r1, _020244E8 ; =0x000027A1
	mov r0, r4
	bl GetStringFromFileVeneer
	b _020244CC
_020244A0:
	mov r7, #0
	strb r7, [r4]
	add r5, r3, #2
	ldr r6, _020244EC ; =_02099D84
	b _020244C4
_020244B4:
	mov r0, r4
	mov r1, r6
	bl strcat
	add r7, r7, #1
_020244C4:
	cmp r7, r5
	blt _020244B4
_020244CC:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020244D4:
	ldr r0, _020244F0 ; =_02099D50
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020244DC: .word 0x000027A2 + SET_STRING_POWER_OFFSET
_020244E0: .word 0x000029C1 + SET_STRING_POWER_OFFSET
_020244E4: .word MOVE_POWER_STARS_TABLE
_020244E8: .word 0x000027A1 + SET_STRING_POWER_OFFSET
_020244EC: .word _02099D84
_020244F0: .word _02099D50
	arm_func_end SetStringPower

	arm_func_start sub_020244F4
sub_020244F4: ; 0x020244F4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r5, r0
	mov r4, r2, lsr #0x10
	ands r0, r1, #0x70000
	beq _0202451C
	cmp r0, #0x10000
	beq _02024564
	b _02024580
_0202451C:
#if defined(EUROPE)
	add r0, r1, #0xc3
	add r0, r0, #0x3400
#elif defined(JAPAN)
	add r0, r1, #0x46
	add r0, r0, #0x4700
#else
	add r0, r1, #0xc1
	add r0, r0, #0x3400
#endif
	mov r1, r0, lsl #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	bl CopyStringFromId
	cmp r4, #0x11
	add r2, sp, #0
	bne _02024550
	ldr r1, _0202458C ; =_02099D8C
	mov r0, r5
	bl SprintfStatic__0202378C
	b _0202455C
_02024550:
	ldr r1, _02024590 ; =_02099D90
	mov r0, r5
	bl SprintfStatic__0202378C
_0202455C:
	mov r0, r5
	b _02024584
_02024564:
	mov r0, r4
	bl sub_02024FC8
	mov r1, r0
	mov r0, r5
	bl strcpy
	mov r0, r5
	b _02024584
_02024580:
	ldr r0, _02024594 ; =_02099D50
_02024584:
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202458C: .word _02099D8C
_02024590: .word _02099D90
_02024594: .word _02099D50
	arm_func_end sub_020244F4

	arm_func_start sub_02024598
sub_02024598: ; 0x02024598
#ifdef EUROPE
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bmi _02024828
	bl GetLanguage
	mov r2, r0
	ldr r1, _0202484C ; =_020B05D4_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	mov r2, r4
	bl SprintfStatic__0202378C
	b _02024844
_02024828:
	bl GetLanguage
	mov r2, r0
	ldr r1, _02024850 ; =_020B05D8_EU
	mov r0, r5
	ldr r1, [r1, r2, lsl #3]
	rsb r2, r4, #0
	bl SprintfStatic__0202378C
_02024844:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202484C: .word _020B05D4_EU
_02024850: .word _020B05D8_EU
#else
	stmdb sp!, {r4, lr}
	movs r2, r1
	mov r4, r0
	bmi _020245B4
	ldr r1, _020245C8 ; =_02099DA0
	bl SprintfStatic__0202378C
	b _020245C0
_020245B4:
	ldr r1, _020245CC ; =_02099DB0
	rsb r2, r2, #0
	bl SprintfStatic__0202378C
_020245C0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020245C8: .word _02099DA0
_020245CC: .word _02099DB0
#endif
	arm_func_end sub_02024598

#ifdef EUROPE
	arm_func_start sub_02024854_EU
sub_02024854_EU: ; 0x02024854
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	ldr ip, [sp, #0x50]
	mov r6, r0
	mov r5, r1
	mov r4, r3
	cmp ip, #2
	bgt _02024884
	ldr r1, _020248DC ; =_02099DC0
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_02024884:
	and r0, r2, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r0, sp, #0
	beq _020248B8
	mov r1, r4
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
	b _020248D4
_020248B8:
	rsb r1, r4, #0
	bl sub_02024598
	ldr r1, _020248E0 ; =_0209A2D4_EU
	add r3, sp, #0
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0202378C
_020248D4:
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020248DC: .word _02099DC0
_020248E0: .word _0209A2D4_EU
	arm_func_end sub_02024854_EU
#endif

	arm_func_start sub_020245D0
sub_020245D0: ; 0x020245D0
#ifdef EUROPE
#define SUB_020245D0_STACK_OFFSET 4
#else
#define SUB_020245D0_STACK_OFFSET 0
#endif
#ifdef EUROPE
	stmdb sp!, {r4, r5, r6, r7, lr}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
#endif
	sub sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
	mov r3, r1, lsl #0x10
	and r1, r1, #0xf0000
	mov r7, r0
	mov r6, r2
	cmp r1, #0x20000
	mov r4, r3, lsr #0x10
	bgt _02024618
	cmp r1, #0x20000
	bge _020246A8
	cmp r1, #0
	bgt _0202460C
	beq _02024634
	b _02024918
_0202460C:
	cmp r1, #0x10000
	beq _02024744
	b _02024918
_02024618:
	cmp r1, #0x30000
	bgt _02024628
	beq _02024668
	b _02024918
_02024628:
	cmp r1, #0x40000
	beq _020248E4
	b _02024918
_02024634:
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024668:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl DungeonSwapIdxToId
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_020246A8:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	mov r0, #0
	mov r2, r0
	and r1, r4, #0xff
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	cmp r6, #0
	mvnlt r0, #0
	mullt r0, r6, r0
	movlt r6, r0
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _02024704
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _0202473C
_02024704:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _0202472C
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _0202473C
_0202472C:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_0202473C:
#endif
	mov r0, r7
	b _0202491C
_02024744:
	and r0, r4, #0xff
	and r1, r6, #0xff
	bl sub_0204F77C
	bl GetNbFloorsPlusOne
	mov r5, r0
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #1
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	mov r1, #0
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
_02024780:
	ldrb r2, [r3, r1]
	cmp r2, #0
	beq _02024888
	strb r2, [r0, r1]
	cmp r2, #0xa
	bne _02024880
	add r1, r1, #1
	mov r2, #0x5b
	strb r2, [r0, r1]
	add r2, r1, #1
	mov r3, #0x43
	strb r3, [r0, r2]
	add r2, r1, #2
	mov r3, #0x4c
	strb r3, [r0, r2]
	add r2, r1, #3
	mov r3, #0x55
	strb r3, [r0, r2]
	add r2, r1, #4
	mov r3, #0x4d
	strb r3, [r0, r2]
	add r2, r1, #5
	mov r3, #0x5f
	strb r3, [r0, r2]
	add r2, r1, #6
	mov r3, #0x53
	strb r3, [r0, r2]
	add r2, r1, #7
	mov r3, #0x45
	strb r3, [r0, r2]
	add r2, r1, #8
	mov r3, #0x54
	strb r3, [r0, r2]
	add r2, r1, #9
	mov r3, #0x3a
	strb r3, [r0, r2]
	add r2, r1, #0xa
	mov r3, #0x38
	strb r3, [r0, r2]
	add r2, r1, #0xb
	mov r3, #0x30
	strb r3, [r0, r2]
	add r2, r1, #0xc
	mov r3, #0x5d
	strb r3, [r0, r2]
	add ip, r1, #0xd
	add r3, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0 + SUB_020245D0_STACK_OFFSET
_02024840:
	ldrb r2, [r3, r1]
	add r1, r1, #1
	strb r2, [r0, ip]
	cmp r2, #0
	add ip, ip, #1
	bne _02024840
	mov r3, #0
	add r2, sp, #0 + SUB_020245D0_STACK_OFFSET
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	b _02024874
_02024868:
	ldrb r1, [r2, r3]
	strb r1, [r0, r3]
	add r3, r3, #1
_02024874:
	cmp r3, ip
	bne _02024868
	b _02024888
_02024880:
	add r1, r1, #1
	b _02024780
_02024888:
#ifdef EUROPE
	add r1, sp, #0x44
	mov r0, r7
	mov r2, r4
	mov r3, r6
	str r5, [sp]
	bl sub_02024854_EU
#else
	cmp r5, #2
	bhi _020248A4
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40
	mov r0, r7
	bl SprintfStatic__0202378C
	b _020248DC
_020248A4:
	and r0, r4, #0xff
	bl DungeonGoesUp
	cmp r0, #0
	add r2, sp, #0x40
	beq _020248CC
	ldr r1, _02024928 ; =_02099DD0
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
	b _020248DC
_020248CC:
	ldr r1, _0202492C ; =_02099DEC
	mov r0, r7
	mov r3, r6
	bl SprintfStatic__0202378C
_020248DC:
#endif
	mov r0, r7
	b _0202491C
_020248E4:
	and r1, r4, #0xff
	and r2, r6, #0xff
	mov r0, #0
	bl sub_0204F6F8
	mov r1, r0
	add r0, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	bl GetStringFromFileVeneer
	ldr r1, _02024924 ; =_02099DC0
	add r2, sp, #0x40 + SUB_020245D0_STACK_OFFSET
	mov r0, r7
	bl SprintfStatic__0202378C
	mov r0, r7
	b _0202491C
_02024918:
	ldr r0, _02024930 ; =_02099D50
_0202491C:
	add sp, sp, #0x80 + SUB_020245D0_STACK_OFFSET
#ifdef EUROPE
	ldmia sp!, {r4, r5, r6, r7, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02024924: .word _02099DC0
#ifndef EUROPE
_02024928: .word _02099DD0
_0202492C: .word _02099DEC
#endif
_02024930: .word _02099D50
	arm_func_end sub_020245D0

	arm_func_start sub_02024934
sub_02024934: ; 0x02024934
	ldr ip, _02024948 ; =sub_0204F6F8
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bx ip
	.align 2, 0
_02024948: .word sub_0204F6F8
	arm_func_end sub_02024934

	arm_func_start sub_0202494C
sub_0202494C: ; 0x0202494C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	and r5, r1, #0xf0000
	mov r6, r0
	cmp r5, #0x20000
	mov r4, r2, lsr #0x10
	bgt _02024990
	cmp r5, #0x20000
	bge _020249F8
	cmp r5, #0
	bgt _02024984
	beq _020249F8
	b _02024A4C
_02024984:
	cmp r5, #0x10000
	beq _020249B0
	b _02024A4C
_02024990:
	cmp r5, #0x40000
	bgt _020249A8
	bge _020249B0
	cmp r5, #0x30000
	beq _020249B0
	b _02024A4C
_020249A8:
	cmp r5, #0x50000
	bne _02024A4C
_020249B0:
	cmp r5, #0x40000
	mov r0, #0
	bne _020249D0
	mov r2, r0
	mov r1, #0x25
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249D0:
	cmp r5, #0x50000
	bne _020249EC
	mov r1, #0x25
	mov r2, #1
	bl LoadScriptVariableValueAtIndex
	mov r4, r0
	b _020249F8
_020249EC:
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r4, r0
_020249F8:
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0206A90C
	mov r1, r0
	add r0, sp, #0
	bl GetStringFromFileVeneer
	cmp r5, #0x30000
	cmpne r5, #0x20000
	ldrne r0, _02024A58 ; =0x00000133
	add r2, sp, #0
	cmpne r4, r0
	bne _02024A38
	ldr r1, _02024A5C ; =_02099D8C
	mov r0, r6
	bl SprintfStatic__0202378C
	b _02024A44
_02024A38:
	ldr r1, _02024A60 ; =_02099DC0
	mov r0, r6
	bl SprintfStatic__0202378C
_02024A44:
	mov r0, r6
	b _02024A50
_02024A4C:
	ldr r0, _02024A64 ; =_02099D50
_02024A50:
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02024A58: .word 0x00000133
_02024A5C: .word _02099D8C
_02024A60: .word _02099DC0
_02024A64: .word _02099D50
	arm_func_end sub_0202494C

	arm_func_start sub_02024A68
sub_02024A68: ; 0x02024A68
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024A9C
#ifdef JAPAN
	add r1, r1, #0xc9
	add r1, r1, #0x200
#else
	add r1, r1, #0x79
	add r1, r1, #0xa00
#endif
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024A9C:
	ldr r0, _02024AA4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AA4: .word _02099D50
	arm_func_end sub_02024A68

	arm_func_start sub_02024AA8
sub_02024AA8: ; 0x02024AA8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024AE8
#ifdef JAPAN
	add r0, r0, #0xf5
	add r0, r0, #0x3e00
#else
	add r0, r0, #0x4d
	add r0, r0, #0xa00
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024AE8:
	ldr r0, _02024AF0 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024AF0: .word _02099D50
	arm_func_end sub_02024AA8

	arm_func_start sub_02024AF4
sub_02024AF4: ; 0x02024AF4
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B38
#ifdef JAPAN
	add r0, r0, #0x7f
	add r0, r0, #0x300
#else
	add r0, r0, #0x77
	add r0, r0, #0x100
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r2, r0
	ldr r1, _02024B40 ; =_02099E08
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B38:
	ldr r0, _02024B44 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B40: .word _02099E08
_02024B44: .word _02099D50
	arm_func_end sub_02024AF4

	arm_func_start sub_02024B48
sub_02024B48: ; 0x02024B48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024B88
#if defined(EUROPE)
	add r0, r0, #0x71
	add r0, r0, #0x2700
#elif defined(JAPAN)
	add r0, r0, #0x79
	add r0, r0, #0x4900
#else
	add r0, r0, #0x6f
	add r0, r0, #0x2700
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024B88:
	ldr r0, _02024B90 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024B90: .word _02099D50
	arm_func_end sub_02024B48

	arm_func_start sub_02024B94
sub_02024B94: ; 0x02024B94
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024BCC
	and r0, r0, #0xff
	bl GetTypeStringId
	bl StringFromId
	mov r1, r0
	mov r0, r4
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024BCC:
	ldr r0, _02024BD4 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024BD4: .word _02099D50
	arm_func_end sub_02024B94

	arm_func_start sub_02024BD8
sub_02024BD8: ; 0x02024BD8
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r0, r2, lsr #0x10
	bne _02024C0C
	and r0, r0, #0xff
	bl GetIqSkillStringId
	mov r1, r0
	mov r0, r4
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024C0C:
	ldr r0, _02024C14 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C14: .word _02099D50
	arm_func_end sub_02024BD8

	arm_func_start sub_02024C18
sub_02024C18: ; 0x02024C18
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024C58
	add r0, sp, #0
	and r1, r1, #0xff
	bl GetAbilityString
	ldr r1, _02024C64 ; =_02099D8C
	add r2, sp, #0
	mov r0, r4
	bl SprintfStatic__0202378C
	mov r0, r4
	b _02024C5C
_02024C58:
	ldr r0, _02024C68 ; =_02099D50
_02024C5C:
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024C64: .word _02099D8C
_02024C68: .word _02099D50
	arm_func_end sub_02024C18

	arm_func_start GetCurrentTeamNameString
GetCurrentTeamNameString: ; 0x02024C6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r4, r1
	mov r5, r0
	bl GetExecuteSpecialEpisodeType
	cmp r4, #2
	bne _02024C98
	mvn r1, #0
	cmp r0, r1
	moveq r4, #0
	movne r4, #1
_02024C98:
	cmp r4, #0
	beq _02024CAC
	cmp r4, #1
	beq _02024CFC
	b _02024D2C
_02024CAC:
	mvn r1, #0
	cmp r0, r1
	bne _02024CC8
	mov r0, #1
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _02024CE8
_02024CC8:
	add r0, sp, #0
	bl GetMainTeamName
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024CE8:
	ldr r1, _02024D3C ; =0x00000237
	mov r0, r5
	bl GetStringFromFileVeneer
	mov r0, r5
	b _02024D30
_02024CFC:
	cmp r0, #3
	ldrne r0, _02024D40 ; =_02099D50
	bne _02024D30
	ldr r1, _02024D44 ; =0x00000236
	add r0, sp, #0
	bl GetStringFromFileVeneer
	ldr r1, _02024D38 ; =_02099E08
	add r2, sp, #0
	mov r0, r5
	bl SprintfStatic__0202378C
	mov r0, r5
	b _02024D30
_02024D2C:
	ldr r0, _02024D40 ; =_02099D50
_02024D30:
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02024D38: .word _02099E08
#ifdef JAPAN
_02024D3C: .word 0x000004C8
_02024D40: .word _02099D50
_02024D44: .word 0x000004C7
#else
_02024D3C: .word 0x00000237
_02024D40: .word _02099D50
_02024D44: .word 0x00000236
#endif
	arm_func_end GetCurrentTeamNameString

	arm_func_start sub_02024D48
sub_02024D48: ; 0x02024D48
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	tst r1, #0xf0000
	mov r1, r2, lsr #0x10
	bne _02024D70
	and r1, r1, #0xff
	bl sub_02058C30
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024D70:
	ldr r0, _02024D78 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024D78: .word _02099D50
	arm_func_end sub_02024D48

#ifdef EUROPE
	arm_func_start sub_02025010_EU
sub_02025010_EU: ; 0x02025010
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl GetLanguage
	ldr r2, _02025040 ; =_020B05C0_EU
	ldr r1, _02025044 ; =_0209A2F4_EU
	ldr r2, [r2, r0, lsl #2]
	mov r0, r5
	mov r3, r4
	bl SprintfStatic__0202378C
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025040: .word _020B05C0_EU
_02025044: .word _0209A2F4_EU
	arm_func_end sub_02025010_EU
#endif

	arm_func_start sub_02024D7C
sub_02024D7C: ; 0x02024D7C
	stmdb sp!, {r4, lr}
	mov r2, r1, lsl #0x10
	mov r4, r0
	mov r2, r2, lsr #0x10
	ands r0, r1, #0xf0000
	beq _02024DD4
	cmp r0, #0x10000
	bne _02024DEC
	mov r0, r2, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetMonsterGenderVeneer
	cmp r0, #1
	beq _02024DC0
	cmp r0, #2
	beq _02024DC8
	cmp r0, #3
	b _02024DD0
_02024DC0:
	mov r2, #0
	b _02024DD4
_02024DC8:
	mov r2, #1
	b _02024DD4
_02024DD0:
	mov r2, #2
_02024DD4:
	ldr r1, _02024DF4 ; =_022A5048
	mov r0, r4
	add r1, r1, r2, lsl #2
	bl strcpy
	mov r0, r4
	ldmia sp!, {r4, pc}
_02024DEC:
	ldr r0, _02024DF8 ; =_02099D50
	ldmia sp!, {r4, pc}
	.align 2, 0
_02024DF4: .word _022A5048
_02024DF8: .word _02099D50
	arm_func_end sub_02024D7C

	arm_func_start GetBagNameString
GetBagNameString: ; 0x02024DFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetCurrentBagCapacity
	cmp r0, #2
	ldrlt r0, _02024E2C ; =0x000008E1
	ldrge r0, _02024E30 ; =0x000008E2
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl GetStringFromFileVeneer
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_02024E2C: .word 0x00001D39
_02024E30: .word 0x00001D3A
#else
_02024E2C: .word 0x000008E1
_02024E30: .word 0x000008E2
#endif
	arm_func_end GetBagNameString

	arm_func_start sub_02024E34
sub_02024E34: ; 0x02024E34
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	sub sp, sp, #0x400
	mov sl, r0
	ldr r0, _02024F94 ; =0x000001B1
	mov r4, r1
	bl StringFromId
	str r0, [sp]
	ldr r0, _02024F98 ; =0x000001B2
	bl StringFromId
	ldr r1, _02024F9C ; =0x000029D1
	mov fp, r0
	cmp r4, r1
	blo _02024E94
	ldr r0, _02024FA0 ; =0x00002F49
	cmp r4, r0
	bhs _02024E94
	rsb r0, r1, #0
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetItemMoveId16
	mov r5, r0
	b _02024E98
_02024E94:
	mov r5, #0
_02024E98:
	mov r0, sl
#ifdef JAPAN
	mov r1, #0x3b8
#else
	mov r1, #0x1b0
#endif
	bl GetStringFromFileVeneer
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
	cmp r5, #0
	beq _02024F78
	bl GetGameMode
	cmp r0, #1
	ldrls sb, _02024FA8 ; =_02099CA4
	mvn r4, #0
	ldrhi sb, _02024FAC ; =_02099CC4
	b _02024F6C
_02024ED0:
	ldrsh r6, [sb], #2
	mov r0, r6
	bl GetActorMatchingStorageId
	mov r7, r0
	cmp r6, #0x16
	bne _02024EF4
	ldr r1, _02024FA4 ; =_02099E18
	mov r0, sl
	bl strcat
_02024EF4:
	cmp r7, r4
	beq _02024F6C
	mov r0, r7
	bl GetTeamMember
	ldrsh r8, [r0, #4]
	bl sub_0204E530
	cmp r0, #0
	bne _02024F2C
	mov r0, r7
	bl GetActiveRosterIndex
	cmp r0, r4
	beq _02024F2C
	bl GetActiveTeamMember
	ldrsh r8, [r0, #0xc]
_02024F2C:
	add r0, sp, #4
	mov r1, r6
	bl sub_02023DC0
	mov r0, r5
	mov r1, r8
	bl sub_02053D1C
	cmp r0, #0
	ldrne r3, [sp]
	ldr r1, _02024FB0 ; =_02099E20
	moveq r3, fp
	add r0, sp, #0x44
	add r2, sp, #4
	bl SprintfStatic__0202378C
	mov r0, sl
	add r1, sp, #0x44
	bl strcat
_02024F6C:
	ldrsh r0, [sb]
	cmp r0, r4
	bne _02024ED0
_02024F78:
	ldr r1, _02024FB4 ; =_02099E40
	mov r0, sl
	bl strcat
	mov r0, sl
	add sp, sp, #0x44
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
_02024F94: .word 0x000003B9
_02024F98: .word 0x000003BA
#else
_02024F94: .word 0x000001B1
_02024F98: .word 0x000001B2
#endif
#if defined(EUROPE)
_02024F9C: .word 0x000029D3
_02024FA0: .word 0x00002F4B
#elif defined(JAPAN)
_02024F9C: .word 0x000041CE
_02024FA0: .word 0x00004746
#else
_02024F9C: .word 0x000029D1
_02024FA0: .word 0x00002F49
#endif
_02024FA4: .word _02099E18
_02024FA8: .word _02099CA4
_02024FAC: .word _02099CC4
_02024FB0: .word _02099E20
_02024FB4: .word _02099E40
	arm_func_end sub_02024E34

	arm_func_start sub_02024FB8
sub_02024FB8: ; 0x02024FB8
	ldr r1, _02024FC4 ; =_022A5468
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FC4: .word _022A5468
	arm_func_end sub_02024FB8

	arm_func_start sub_02024FC8
sub_02024FC8: ; 0x02024FC8
	ldr r1, _02024FD4 ; =_022A5068
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FD4: .word _022A5068
	arm_func_end sub_02024FC8

	arm_func_start GetDungeonResultString
GetDungeonResultString: ; 0x02024FD8
	ldr r1, _02024FE4 ; =_022A5268
	add r0, r1, r0, lsl #7
	bx lr
	.align 2, 0
_02024FE4: .word _022A5268
	arm_func_end GetDungeonResultString

	arm_func_start sub_02024FE8
sub_02024FE8: ; 0x02024FE8
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	beq _02025030
	mov r3, #0x14
	mul r3, r0, r3
	ldr lr, _02025070 ; =_022A596A
	ldrh r0, [r1]
	ldr ip, _02025074 ; =_022A5969
	add r4, lr, r3
	strh r0, [lr, r3]
	ldrh lr, [r1, #2]
	mov r0, #1
	add r5, ip, r3
	strh lr, [r4, #2]
	ldrh r1, [r1, #4]
	strh r1, [r4, #4]
	strb r0, [ip, r3]
	b _02025048
_02025030:
	mov r1, #0x14
	mul r3, r0, r1
	ldr r1, _02025074 ; =_022A5969
	mov r0, #0
	strb r0, [r1, r3]
	add r5, r1, r3
_02025048:
	cmp r2, #0
	moveq r0, #0
	beq _02025068
	ldr ip, _02025078 ; =_022A5970
	ldmia r2, {r0, r1, r2}
	add r3, ip, r3
	stmia r3, {r0, r1, r2}
	mov r0, #1
_02025068:
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025070: .word _022A596A
_02025074: .word _022A5969
_02025078: .word _022A5970
	arm_func_end sub_02024FE8

	arm_func_start sub_0202507C
sub_0202507C: ; 0x0202507C
	stmdb sp!, {r3, lr}
	mov r2, #0x14
	mul r3, r1, r2
	ldr r1, _020250D8 ; =_022A5969
	ldrb r1, [r1, r3]
	cmp r1, #0
	beq _020250BC
	ldr r1, _020250DC ; =_022A596A
	ldr r2, _020250E0 ; =_022A5970
	mov ip, #0
	add r1, r1, r3
	add r2, r2, r3
	mov r3, #1
	str ip, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
_020250BC:
	ldr r1, _020250DC ; =_022A596A
	mov r2, #0
	add r1, r1, r3
	mov r3, #1
	str r2, [sp]
	bl sub_0200D310
	ldmia sp!, {r3, pc}
	.align 2, 0
_020250D8: .word _022A5969
_020250DC: .word _022A596A
_020250E0: .word _022A5970
	arm_func_end sub_0202507C

	arm_func_start SetQuestionMarks
SetQuestionMarks: ; 0x020250E4
#ifdef JAPAN
	mov r1, #0xf
#else
	mov r1, #0x3f
#endif
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #3]
	bx lr
	arm_func_end SetQuestionMarks

	arm_func_start StrcpySimple
StrcpySimple:
	ldrb r2, [r1], #1
	mov r3, r0
	strb r2, [r0], #1
	ldrb r2, [r3]
	cmp r2, #0
	bne StrcpySimple
	bx lr
	arm_func_end StrcpySimple

	arm_func_start StrncpySimple
StrncpySimple: ; 0x0202511C
	stmdb sp!, {r3, lr}
	mov ip, #0
	b _02025164
_02025128:
	ldrb r3, [r1], #1
	mov lr, r0
	strb r3, [r0], #1
	ldrb r3, [lr]
	cmp r3, #0
	bne _02025160
	add ip, ip, #1
	mov r1, #0
	b _02025154
_0202514C:
	strb r1, [r0], #1
	add ip, ip, #1
_02025154:
	cmp ip, r2
	blt _0202514C
	ldmia sp!, {r3, pc}
_02025160:
	add ip, ip, #1
_02025164:
	cmp ip, r2
	blt _02025128
	ldmia sp!, {r3, pc}
	arm_func_end StrncpySimple

	arm_func_start StrncpySimpleNoPad
StrncpySimpleNoPad: ; 0x02025170
	stmdb sp!, {r3, lr}
	mov ip, #0
	b _02025198
_0202517C:
	ldrb r3, [r1], #1
	mov lr, r0
	strb r3, [r0], #1
	ldrb r3, [lr]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	add ip, ip, #1
_02025198:
	cmp ip, r2
	blt _0202517C
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	arm_func_end StrncpySimpleNoPad

	arm_func_start StrncmpSimple
StrncmpSimple: ; 0x020251AC
	stmdb sp!, {r3, lr}
	mov lr, #0
_020251B4:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	add lr, lr, #1
	cmp ip, r3
	beq _020251D4
	mvnlo r0, #0
	movhs r0, #1
	ldmia sp!, {r3, pc}
_020251D4:
	cmp ip, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp lr, r2
	blt _020251B4
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end StrncmpSimple

	arm_func_start sub_020251F0
sub_020251F0: ; 0x020251F0
#ifdef JAPAN
	ldr r1, _02025264 ; =_020B112C_JP
	ldr r1, [r1, #4]
	add r2, r1, r0, lsl #1
	ldrb r1, [r1, r0, lsl #1]
	ldrb r0, [r2, #1]
	add r0, r0, r1, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_02025264: .word _020B112C_JP
#else
	bx lr
#endif
	arm_func_end sub_020251F0

	arm_func_start StrncpySimpleNoPadSafe
StrncpySimpleNoPadSafe: ; 0x020251F4
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	b _02025294
_0202527C:
	ldrb r0, [r5], #1
	bl sub_020251F0
	mov r1, r0, asr #8
	strb r1, [r6]
	strb r0, [r6, #1]
	add r6, r6, #2
_02025294:
	cmp r4, #0
	sub r4, r4, #1
	ble _020252AC
	ldrb r0, [r5]
	cmp r0, #0
	bne _0202527C
_020252AC:
	mov r0, #0
	strb r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
#else
	mov ip, #0x20
	b _0202520C
_020251FC:
	ldrb r3, [r1], #1
	cmp r3, #0x100
	strlob r3, [r0], #1
	strhsb ip, [r0], #1
_0202520C:
	cmp r2, #0
	sub r2, r2, #1
	ble _02025224
	ldrb r3, [r1]
	cmp r3, #0
	bne _020251FC
_02025224:
	mov r1, #0
	strb r1, [r0]
	bx lr
#endif
	arm_func_end StrncpySimpleNoPadSafe

	arm_func_start StrcpyName
StrcpyName: ; 0x02025230
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	ldr r3, _02025300 ; =_020B112C_JP
	b _020252D8
_020252C4:
	ldrb ip, [r1], #1
	ldr lr, [r3]
	mov ip, ip, lsl #1
	ldrh ip, [lr, ip]
	strh ip, [r0], #2
_020252D8:
	cmp r2, #0
	sub r2, r2, #1
	ble _020252F0
	ldrb ip, [r1]
	cmp ip, #0
	bne _020252C4
_020252F0:
	cmp r2, #0
	movgt r1, #0
	strgth r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025300: .word _020B112C_JP
#else
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r3, ip
	b _020252FC
_02025240:
	cmp r2, #0x7e
	bne _020252F8
	ldrb lr, [r1]
	ldrb r4, [r1, #1]
	add r1, r1, #2
	cmp lr, #0x30
	blo _0202526C
	cmp lr, #0x39
	subls r2, lr, #0x30
	andls lr, r2, #0xff
	bls _020252A0
_0202526C:
	cmp lr, #0x61
	blo _02025284
	cmp lr, #0x66
	subls r2, lr, #0x6b
	andls lr, r2, #0xff
	bls _020252A0
_02025284:
	cmp lr, #0x41
	blo _0202529C
	cmp lr, #0x46
	subls r2, lr, #0x4b
	andls lr, r2, #0xff
	bls _020252A0
_0202529C:
	mov lr, ip
_020252A0:
	cmp r4, #0x30
	blo _020252B8
	cmp r4, #0x39
	subls r2, r4, #0x30
	andls r4, r2, #0xff
	bls _020252EC
_020252B8:
	cmp r4, #0x61
	blo _020252D0
	cmp r4, #0x66
	subls r2, r4, #0x6b
	andls r4, r2, #0xff
	bls _020252EC
_020252D0:
	cmp r4, #0x41
	blo _020252E8
	cmp r4, #0x46
	subls r2, r4, #0x4b
	andls r4, r2, #0xff
	bls _020252EC
_020252E8:
	mov r4, r3
_020252EC:
	orr r2, r4, lr, lsl #4
	strb r2, [r0], #1
	b _020252FC
_020252F8:
	strb r2, [r0], #1
_020252FC:
	ldrb r2, [r1], #1
	cmp r2, #0
	bne _02025240
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r4, pc}
#endif
	arm_func_end StrcpyName

#ifdef JAPAN
	arm_func_start sub_02025304_JP
sub_02025304_JP: ; 0x02025304
	stmdb sp!, {r4, r5, r6, lr}
	mov lr, #0
	ldr r2, _02025368 ; =_020B112C_JP
	b _02025350
_02025314:
	mov r5, lr
	ldr r4, [r2, #4]
	b _0202533C
_02025320:
	cmp r6, r3
	ldreqb ip, [r1, #1]
	ldreqb r3, [r4, #1]
	cmpeq ip, r3
	beq _02025348
	add r4, r4, #2
	add r5, r5, #1
_0202533C:
	ldrb r3, [r4]
	cmp r3, #0
	bne _02025320
_02025348:
	strb r5, [r0], #1
	add r1, r1, #2
_02025350:
	ldrb r6, [r1]
	cmp r6, #0
	bne _02025314
	mov r1, #0
	strb r1, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02025368: .word _020B112C_JP
	arm_func_end sub_02025304_JP
#endif

	arm_func_start StrncpyName
StrncpyName: ; 0x02025314
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r3, _020253DC ; =_020B112C_JP
	b _020253CC
_0202537C:
	ldrb r7, [r1]
	cmp r7, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, r4
	ldr r5, [r3, #4]
	b _020253B8
_0202539C:
	cmp r7, ip
	ldreqb lr, [r1, #1]
	ldreqb ip, [r5, #1]
	cmpeq lr, ip
	beq _020253C4
	add r5, r5, #2
	add r6, r6, #1
_020253B8:
	ldrb ip, [r5]
	cmp ip, #0
	bne _0202539C
_020253C4:
	strb r6, [r0], #1
	add r1, r1, #2
_020253CC:
	cmp r2, #0
	sub r2, r2, #1
	bgt _0202537C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020253DC: .word _020B112C_JP
#else
	stmdb sp!, {r3, r4, r5, lr}
	mov lr, #0
	mov ip, lr
	b _020253F4
_02025324:
	ldrb r3, [r1], #1
	cmp r3, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r3, #0x7e
	bne _020253F0
	ldrb r4, [r1]
	ldrb r5, [r1, #1]
	add r1, r1, #2
	cmp r4, #0x30
	blo _02025364
	cmp r4, #0x39
	subls r3, r4, #0x30
	andls r4, r3, #0xff
	bls _02025398
_02025364:
	cmp r4, #0x61
	blo _0202537C
	cmp r4, #0x66
	subls r3, r4, #0x6b
	andls r4, r3, #0xff
	bls _02025398
_0202537C:
	cmp r4, #0x41
	blo _02025394
	cmp r4, #0x46
	subls r3, r4, #0x4b
	andls r4, r3, #0xff
	bls _02025398
_02025394:
	mov r4, lr
_02025398:
	cmp r5, #0x30
	blo _020253B0
	cmp r5, #0x39
	subls r3, r5, #0x30
	andls r5, r3, #0xff
	bls _020253E4
_020253B0:
	cmp r5, #0x61
	blo _020253C8
	cmp r5, #0x66
	subls r3, r5, #0x6b
	andls r5, r3, #0xff
	bls _020253E4
_020253C8:
	cmp r5, #0x41
	blo _020253E0
	cmp r5, #0x46
	subls r3, r5, #0x4b
	andls r5, r3, #0xff
	bls _020253E4
_020253E0:
	mov r5, ip
_020253E4:
	orr r3, r5, r4, lsl #4
	strb r3, [r0], #1
	b _020253F4
_020253F0:
	strb r3, [r0], #1
_020253F4:
	cmp r2, #0
	sub r2, r2, #1
	bgt _02025324
	ldmia sp!, {r3, r4, r5, pc}
#endif
	arm_func_end StrncpyName

#ifdef JAPAN
	arm_func_start sub_020253E0_JP
sub_020253E0_JP: ; 0x020253E0
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r3, _02025444 ; =_020B112C_JP
	b _02025434
_020253F0:
	ldrh r5, [r1]
	cmp r5, #0
	moveq r1, #0
	streqb r1, [r0]
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, ip
	ldr lr, [r3]
	b _02025420
_02025410:
	cmp r6, r5
	beq _0202542C
	add lr, lr, #2
	add r4, r4, #1
_02025420:
	ldrh r6, [lr]
	cmp r6, #0
	bne _02025410
_0202542C:
	strb r4, [r0], #1
	add r1, r1, #2
_02025434:
	cmp r2, #0
	sub r2, r2, #1
	bgt _020253F0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02025444: .word _020B112C_JP
	arm_func_end sub_020253E0_JP
#else
	arm_func_start sub_02025404
sub_02025404: ; 0x02025404
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	b _02025424
_02025418:
	ldrb r0, [r5], #1
	bl sub_02025480
	strh r0, [r6], #2
_02025424:
	cmp r4, #0
	sub r4, r4, #1
	ble _0202543C
	ldrb r0, [r5]
	cmp r0, #0
	bne _02025418
_0202543C:
	cmp r4, #0
	movgt r0, #0
	strgth r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02025404

	arm_func_start sub_0202544C
sub_0202544C: ; 0x0202544C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	mov r5, r0
	add r0, sp, #0
	mov r3, #1
	mov r4, r2
	bl sub_0202568C
	add r1, sp, #0
	mov r0, r5
	mov r2, r4
	bl StrncpyName
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202544C
#endif

	arm_func_start sub_02025480
sub_02025480: ; 0x02025480
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	tst r0, #0xff00
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	ldmeqia sp!, {r3, pc}
#endif
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov ip, #0
#ifdef JAPAN
	mov lr, #0x110
#else
	mov lr, #0xdb
#endif
	ldr r2, _020254F0 ; =_0209A044
	b _020254C8
_020254A0:
	add r1, ip, lr
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, r3, lsl #2
	ldrh r1, [r2, r1]
	cmp r1, r0
	moveq ip, r3
	beq _020254D0
	addlt ip, r3, #1
	movge lr, r3
_020254C8:
	cmp ip, lr
	blt _020254A0
_020254D0:
	ldr r1, _020254F0 ; =_0209A044
	mov r2, ip, lsl #2
	ldrh r1, [r1, r2]
	cmp r1, r0
	ldreq r0, _020254F4 ; =_0209A046
	ldreqh r0, [r0, r2]
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020254F0: .word _0209A044
_020254F4: .word _0209A046
	arm_func_end sub_02025480

	arm_func_start sub_020254F8
sub_020254F8: ; 0x020254F8
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa
	ldreq r0, _02025530 ; =0x000081A5
	ldmeqia sp!, {r3, pc}
	tst r0, #0xff00
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	ldr r3, _02025534 ; =_0209A044
	ldr r1, _02025538 ; =0x00000111
	b _02025520
_02025504:
	add r2, r3, lr, lsl #2
	ldrh r2, [r2, #2]
	mov ip, lr, lsl #2
	cmp r0, r2
	ldreqh r0, [r3, ip]
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_02025520:
	cmp lr, r1
	blt _02025504
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025530: .word 0x000081A5
_02025534: .word _0209A044
_02025538: .word 0x00000111
#else
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0xa
	moveq r0, #0xa
	bxeq lr
	mov ip, #0
	ldr r2, _02025548 ; =_0209A044
	b _02025538
_0202551C:
	add r1, r2, ip, lsl #2
	ldrh r1, [r1, #2]
	mov r3, ip, lsl #2
	cmp r0, r1
	ldreqh r0, [r2, r3]
	bxeq lr
	add ip, ip, #1
_02025538:
	cmp ip, #0xdc
	blt _0202551C
	mov r0, #0
	bx lr
	.align 2, 0
_02025548: .word _0209A044
#endif
	arm_func_end sub_020254F8

	arm_func_start sub_0202554C
sub_0202554C: ; 0x0202554C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #0xa
#ifdef JAPAN
	ldreq r0, _020255BC ; =0x000081A5
#else
	moveq r0, #0xa
#endif
	ldmeqia sp!, {r3, pc}
	mov lr, #0
	ldr ip, _020255CC ; =0x000001BE
	ldr r2, _020255D0 ; =_0209A3B4
	b _020255A4
_02025578:
	add r1, lr, ip
	add r1, r1, r1, lsr #31
	mov r3, r1, asr #1
	mov r1, r3, lsl #2
	ldrh r1, [r2, r1]
	cmp r0, r1
	moveq lr, r3
	beq _020255AC
	cmp r1, r0
	addlo lr, r3, #1
	movhs ip, r3
_020255A4:
	cmp lr, ip
	blt _02025578
_020255AC:
	ldr r1, _020255D0 ; =_0209A3B4
	mov r2, lr, lsl #2
	ldrh r1, [r1, r2]
	cmp r0, r1
	ldreq r0, _020255D4 ; =_0209A3B6
	ldreqh r0, [r0, r2]
#ifdef JAPAN
	ldrne r0, _020255CC_JP ; =0x00008148
#else
	movne r0, #0x3f
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_020255BC: .word 0x000081A5
_020255CC: .word 0x000001BF
#else
_020255CC: .word 0x000001BE
#endif
_020255D0: .word _0209A3B4
_020255D4: .word _0209A3B6
#ifdef JAPAN
_020255CC_JP: .word 0x00008148
#endif
	arm_func_end sub_0202554C

	arm_func_start sub_020255D8
sub_020255D8: ; 0x020255D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	str r1, [sp]
	add r4, sp, #0
	b _020255FC
_020255EC:
	mov r0, r4
	bl sub_0202065C
	bl sub_02025480
	strh r0, [r5], #2
_020255FC:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	bne _020255EC
	mov r1, #0
	mov r0, r5
	strh r1, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020255D8

	arm_func_start sub_0202561C
sub_0202561C: ; 0x0202561C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r8, r2
	mov r7, r3
	str r1, [sp]
	mov r6, #0
	add r5, sp, #0
	b _02025654
_02025640:
	mov r0, r5
	bl sub_0202065C
	bl sub_02025480
	strh r0, [r4], #2
	add r6, r6, #1
_02025654:
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0202566C
	cmp r6, r8
	blt _02025640
_0202566C:
	cmp r7, #0
	beq _02025680
	cmp r6, r8
	movlt r0, #0
	strlth r0, [r4]
_02025680:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0202561C

	arm_func_start sub_0202568C
sub_0202568C: ; 0x0202568C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, #0
	b _020256C0
_0202569C:
	bl sub_020254F8
	ands r1, r0, #0xff00
	movne r1, r1, asr #8
	strneb r1, [r7]
	strneb r0, [r7, #1]
	addne r7, r7, #2
	streqb r0, [r7], #1
	add r6, r6, #2
	add r4, r4, #1
_020256C0:
	ldrh r0, [r6]
	cmp r0, #0
	beq _020256D4
	cmp r4, r5
	blt _0202569C
_020256D4:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r5, #0
	b _020256CC
_020256A8:
	bl sub_020254F8
	ands r1, r0, #0xff00
	movne r1, r1, asr #8
	strneb r1, [r4]
	strneb r0, [r4, #1]
	addne r4, r4, #2
	streqb r0, [r4], #1
	add r8, r8, #2
	add r5, r5, #1
_020256CC:
	ldrh r0, [r8]
	cmp r0, #0
	beq _020256E0
	cmp r5, r7
	blt _020256A8
_020256E0:
	cmp r6, #0
	beq _020256F4
	cmp r5, r7
	movlt r0, #0
	strltb r0, [r4]
_020256F4:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
#endif
	arm_func_end sub_0202568C

	arm_func_start sub_020256FC
sub_020256FC: ; 0x020256FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, #0
	mov r5, #0x81
	mov r4, #0x48
	ldr fp, _02025780 ; =0x000081A1
	b _02025764
_02025720:
	bl sub_0202554C
	mov r6, r0
	bl sub_02025C7C
#ifdef JAPAN
	ldrh r0, [r0, #4]
#else
	ldrh r0, [r0]
#endif
	cmp r0, fp
	streqb r5, [sl]
	streqb r4, [sl, #1]
	addeq sl, sl, #2
	beq _0202575C
	ands r0, r6, #0xff00
	movne r0, r0, asr #8
	strneb r0, [sl]
	strneb r6, [sl, #1]
	addne sl, sl, #2
	streqb r6, [sl], #1
_0202575C:
	add sb, sb, #2
	add r7, r7, #1
_02025764:
	ldrh r0, [sb]
	cmp r0, #0
	beq _02025778
	cmp r7, r8
	blt _02025720
_02025778:
	mov r0, sl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02025780: .word 0x000081A1
	arm_func_end sub_020256FC

	arm_func_start sub_02025784
sub_02025784: ; 0x02025784
	bx lr
	arm_func_end sub_02025784

	arm_func_start GetStringFromFile
GetStringFromFile: ; 0x02025788
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r5, r0
	bl FileRom_InitDataTransfer
	sub r0, r4, #1
	mov r1, r0, lsl #0x10
	ldr r0, _020257F8 ; =_022A59C0
	mov r1, r1, lsr #0xe
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _020257F8 ; =_022A59C0
	add r1, sp, #0
	mov r2, #8
	bl FileRom_HandleRead
	ldr r1, [sp]
	ldr r0, _020257F8 ; =_022A59C0
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r3, [sp, #4]
	ldr r2, [sp]
	ldr r0, _020257F8 ; =_022A59C0
	mov r1, r5
	sub r2, r3, r2
	bl FileRom_HandleRead
	bl FileRom_StopDataTransfer
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020257F8: .word _022A59C0
	arm_func_end GetStringFromFile

	arm_func_start sub_020257FC
sub_020257FC: ; 0x020257FC
	stmdb sp!, {r3, lr}
	ldr r0, _02025814 ; =_022A59B8
	mov r1, #8
	bl MemZero
	bl LoadStringFile
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025814: .word _022A59B8
	arm_func_end sub_020257FC

	arm_func_start LoadStringFile
LoadStringFile: ; 0x02025818
	stmdb sp!, {r4, lr}
	bl GetLanguage
	ldr r1, _0202587C ; =_020AFCEC
	mov r4, r0
	ldrsb r0, [r1]
	cmp r0, r4
	ldmeqia sp!, {r4, pc}
	bl FileRom_InitDataTransfer
	ldr r1, _0202587C ; =_020AFCEC
	mvn r0, #0
	ldrsb r1, [r1]
	cmp r1, r0
	beq _02025854
	ldr r0, _02025880 ; =_022A59C0
	bl FileClose
_02025854:
	ldr r1, _0202587C ; =_020AFCEC
	ldr r0, _02025880 ; =_022A59C0
	strb r4, [r1]
	bl FileRom_Veneer_FileInit
	ldr r1, _02025884 ; =_020AFCF0
	ldr r0, _02025880 ; =_022A59C0
	ldr r1, [r1, r4, lsl #2]
	bl FileRom_HandleOpen
	bl FileRom_StopDataTransfer
	ldmia sp!, {r4, pc}
	.align 2, 0
_0202587C: .word _020AFCEC
_02025880: .word _022A59C0
_02025884: .word _020AFCF0
	arm_func_end LoadStringFile

	arm_func_start sub_02025888
sub_02025888: ; 0x02025888
	ldr r1, _020258B0 ; =_022A59B8
	ldr r0, _020258B4 ; =_022A5A08
	ldrh r3, [r1, #4]
	add r2, r3, #1
	strh r2, [r1, #4]
	ldrh r2, [r1, #4]
	add r0, r0, r3, lsl #10
	and r2, r2, #7
	strh r2, [r1, #4]
	bx lr
	.align 2, 0
_020258B0: .word _022A59B8
_020258B4: .word _022A5A08
	arm_func_end sub_02025888

	arm_func_start GetStringFromFileVeneer
GetStringFromFileVeneer: ; 0x020258B8
	ldr ip, _020258C0 ; =GetStringFromFile
	bx ip
	.align 2, 0
_020258C0: .word GetStringFromFile
	arm_func_end GetStringFromFileVeneer

	arm_func_start StringFromId
StringFromId: ; 0x020258C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02025888
	mov r1, r4
	mov r4, r0
	bl GetStringFromFile
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end StringFromId

	arm_func_start CopyStringFromId
CopyStringFromId: ; 0x020258E4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r4, r0
	add r0, sp, #0
	bl GetStringFromFile
	add r1, sp, #0
	mov r0, r4
	bl strcpy
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	arm_func_end CopyStringFromId

	arm_func_start CopyNStringFromId
CopyNStringFromId: ; 0x0202590C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r5, r0
	add r0, sp, #0
	mov r4, r2
	bl GetStringFromFile
	add r1, sp, #0
	mov r0, r5
	mov r2, r4
	bl strncpy
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CopyNStringFromId

	arm_func_start LoadTblTalk
LoadTblTalk: ; 0x0202593C
	stmdb sp!, {r3, lr}
	bl FileRom_InitDataTransfer
	ldr r0, _02025980 ; =_022A7A0C
	bl FileRom_Veneer_FileInit
	ldr r0, _02025980 ; =_022A7A0C
	ldr r1, _02025984 ; =_0209AAD8
	bl FileRom_HandleOpen
	ldr r0, _02025980 ; =_022A7A0C
	mov r1, #0x33c
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _02025980 ; =_022A7A0C
	ldr r1, _02025988 ; =_022A7A08
	mov r2, #2
	bl FileRom_HandleRead
	bl FileRom_StopDataTransfer
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025980: .word _022A7A0C
_02025984: .word _0209AAD8
_02025988: .word _022A7A08
	arm_func_end LoadTblTalk

	arm_func_start GetTalkLine
GetTalkLine: ; 0x0202598C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x6c
	ldr r3, _02025AC4 ; =0x000004B8
	mov r6, r0
#ifdef JAPAN
	mov r4, r2
	cmp r6, r3
	cmpeq r4, #2
	mov r5, r1
#else
	cmp r6, r3
	addne r0, r3, #0x1b
	mov r5, r1
	mov r4, r2
	cmpne r6, r0
	bne _020259BC
	cmp r4, #2
#endif
	moveq r4, #0
_020259BC:
	bl FileRom_InitDataTransfer
	ldr r1, _02025AC8 ; =_022A7A08
	ldr r0, _02025ACC ; =_022A7A0C
	ldrsh r1, [r1]
	mov r2, #0
	add r1, r1, r6
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #0
	mov r2, #1
	bl FileRom_HandleRead
	ldrsb r2, [sp]
	cmp r2, #0
	bge _02025A00
	bl FileRom_StopDataTransfer
	ldr r0, _02025AD0 ; =0x00003EFD
	b _02025ABC
_02025A00:
	mov r0, #6
	mla r1, r2, r0, r5
	ldr r0, _02025ACC ; =_022A7A0C
	mov r1, r1, lsl #1
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #2
	mov r2, #4
	bl FileRom_HandleRead
	ldrsh r1, [sp, #2]
	ldrsh r0, [sp, #4]
	subs r6, r0, r1
	bne _02025A44
	bl FileRom_StopDataTransfer
	ldr r0, _02025AD0 ; =0x00003EFD
	b _02025ABC
_02025A44:
	ldr r0, _02025ACC ; =_022A7A0C
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #6
	mov r2, r6
	bl FileRom_HandleRead
	cmp r4, #1
	bne _02025A78
	mov r0, #2
	bl RandInt
	mov r4, r0
	b _02025A90
_02025A78:
	cmp r4, #2
	moveq r4, #2
	beq _02025A90
	mov r0, r6, lsr #1
	bl RandInt
	mov r4, r0
_02025A90:
	bl FileRom_StopDataTransfer
	ldr r2, _02025AD4 ; =TBL_TALK_GROUP_STRING_ID_START
	mov r3, r5, lsl #1
	add r0, sp, #6
	mov r1, r4, lsl #1
	ldrh r2, [r2, r3]
	ldrsh r0, [r0, r1]
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	ldreq r0, _02025AD0 ; =0x00003EFD
_02025ABC:
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02025AC4: .word 0x000004B8
_02025AC8: .word _022A7A08
_02025ACC: .word _022A7A0C
#if defined(EUROPE)
_02025AD0: .word 0x00003EFF
#elif defined(JAPAN)
_02025AD0: .word 0x00002FF6
#else
_02025AD0: .word 0x00003EFD
#endif
_02025AD4: .word TBL_TALK_GROUP_STRING_ID_START
	arm_func_end GetTalkLine

	arm_func_start sub_02025AD8
sub_02025AD8: ; 0x02025AD8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _02025B6C ; =_0209ABF0
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
#ifdef JAPAN
	ldr r1, [sp]
	ldr r0, _02025B34 ; =_022A7A54
	bl HandleSir0Translation
	ldr r1, _02025B38 ; =_0209AC04
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r0, _02025B3C ; =_022A92C4
	bl HandleSir0Translation
	ldr r1, _02025B40 ; =_0209AC18
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r2, [sp]
	ldr r0, _02025B44 ; =_020AFD04
	mov r1, #0
	str r2, [r0]
	str r1, [r0, #4]
	ldr r0, _02025B48 ; =_022A92B4_JP
	mov r1, #0xb
	str r1, [r0, #4]
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0]
#else
	ldr r0, [sp]
	ldr r2, _02025B70 ; =_022A7A54
	add r3, r0, #4
#ifdef EUROPE
	str r0, [r2, #8]
#else
	str r0, [r2, #0x10]
#endif
	str r3, [r2]
	ldr r1, _02025B74 ; =_0209AC04
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, [sp]
	ldr r2, _02025B70 ; =_022A7A54
	add r3, r0, #4
#ifdef EUROPE
	str r0, [r2, #0xc]
#else
	str r0, [r2, #0x14]
#endif
	str r3, [r2, #4]
	ldr r1, _02025B78 ; =_0209AC18
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, [sp]
	ldr r1, _02025B7C ; =_020AFD04
	mov r2, #0
#ifdef EUROPE
	str r0, [r1, #8]
	str r2, [r1, #4]
	ldr r0, _02025B70 ; =_022A7A54
	mov r2, #0xb
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
#else
	str r0, [r1, #0xc]
	str r2, [r1, #8]
	ldr r0, _02025B70 ; =_022A7A54
	mov r2, #0xb
	str r2, [r0, #8]
	str r2, [r0, #0xc]
#endif
	mov r0, #1
	strb r0, [r1]
#endif
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_02025B6C: .word _0209B548_JP
_02025B34: .word _022A7A54
_02025B38: .word _0209AC04
_02025B3C: .word _022A92C4
_02025B40: .word _0209AC18
_02025B44: .word _020AFD04
_02025B48: .word _022A92B4_JP
#else
_02025B6C: .word _0209ABF0
_02025B70: .word _022A7A54
_02025B74: .word _0209AC04
_02025B78: .word _0209AC18
_02025B7C: .word _020AFD04
#endif
	arm_func_end sub_02025AD8

	arm_func_start sub_02025B80
sub_02025B80: ; 0x02025B80
	ldr r1, _02025B8C ; =_020AFD04
#ifdef NORTH_AMERICA
	str r0, [r1, #8]
#else
	str r0, [r1, #4]
#endif
	bx lr
	.align 2, 0
_02025B8C: .word _020AFD04
	arm_func_end sub_02025B80

	arm_func_start sub_02025B90
sub_02025B90: ; 0x02025B90
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	ldr r1, _02025C00 ; =_020AFD34
	mov r4, r0
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02025C04 ; =_0209AC2C
	add r0, sp, #0
	bl sprintf
	add r0, sp, #0
	bl sub_02027274
	ldr r0, _02025C08 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0x8]
	cmp r1, #0
	strne r1, [r0, #0xc]
#elif defined(JAPAN)
	ldr r1, [r0]
	cmp r1, #0
	strne r1, [r0, #8]
#else
	ldr r1, [r0, #0xc]
	cmp r1, #0
	strne r1, [r0, #4]
#endif
	ldr r1, _02025C0C ; =_020AFD1C
	add r0, sp, #0
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02025C04 ; =_0209AC2C
	bl sprintf
	ldr r0, _02025C10 ; =_020AFD14
	add r1, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, _02025C08 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0x10]
	str r1, [r0, #8]
#elif defined(JAPAN)
	ldr r1, [r0, #0xc]
	str r1, [r0]
#else
	ldr r1, [r0, #0x10]
	str r1, [r0, #0xc]
#endif
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02025C00: .word _020AFD34
_02025C04: .word _0209AC2C
_02025C08: .word _020AFD04
_02025C0C: .word _020AFD1C
_02025C10: .word _020AFD14
	arm_func_end sub_02025B90

	arm_func_start sub_02025C14
sub_02025C14: ; 0x02025C14
	stmdb sp!, {r3, lr}
	ldr r0, _02025C70 ; =_020AFD04
#ifdef JAPAN
	ldr r0, [r0, #0xc]
#else
	ldr r0, [r0, #0x10]
#endif
	cmp r0, #0
	beq _02025C30
	ldr r0, _02025C74 ; =_020AFD14
	bl UnloadFile
_02025C30:
	ldr r1, _02025C70 ; =_020AFD04
	mov r2, #0
#ifdef JAPAN
	str r2, [r1, #0xc]
	ldr r0, _02025C78 ; =_0209AC38
	str r2, [r1, #0x10]
#else
	str r2, [r1, #0x10]
	ldr r0, _02025C78 ; =_0209AC38
	str r2, [r1, #0x14]
#endif
	bl sub_02027274
	ldr r0, _02025C70 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0xc]
	cmp r1, #0
	strne r1, [r0, #8]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #0xc]
#elif defined(JAPAN)
	ldr r1, [r0, #8]
	cmp r1, #0
	strne r1, [r0]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #8]
#else
	ldr r1, [r0, #4]
	cmp r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #4]
#endif
	bl sub_02027170
	bl sub_02027390
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025C70: .word _020AFD04
_02025C74: .word _020AFD14
_02025C78: .word _0209AC38
	arm_func_end sub_02025C14

	arm_func_start sub_02025C7C
sub_02025C7C: ; 0x02025C7C
	stmdb sp!, {r4, lr}
#ifdef EUROPE
	ldr r2, _02025D3C ; =_020AFD04
	ldr r1, _0202601C_EU ; =0x000082BD
	ldr r4, [r2, #4]
	ldr r2, _02025D40 ; =_022A7A54
	cmp r0, r1
	ldr r1, [r2, r4, lsl #2]
	ldreq r0, _02026024 ; =_0209B09C_EU
	ldmeqia sp!, {r4, pc}
	cmp r0, #0xf800
#else
	ldr r1, _02025D3C ; =_020AFD04
	ldr r2, _02025D40 ; =_022A7A54
#ifdef JAPAN
	ldr r1, [r1, #4]
	cmp r0, #0xf800
	ldr r3, [r2, r1, lsl #2]
	ldr r1, [r3, #4]
#else
	ldr r4, [r1, #8]
	cmp r0, #0xf800
	ldr r1, [r2, r4, lsl #2]
#endif
#endif
	blo _02025CCC
	ldr r2, _02025D44 ; =0x0000FFFF
	cmp r0, r2
	bhs _02025CCC
	and r2, r0, #0xff00
	and r3, r0, #0xff
	mov r0, r2, asr #8
	sub r3, r3, #0x20
	sub r2, r0, #0xf8
	mov r0, #0xe0
	mla r3, r2, r0, r3
#ifdef JAPAN
	mov r0, #0xc
	mla r2, r3, r0, r1
	b _02025CF8
_02025CCC:
	ldr r2, [r3]
	mov r4, #0
	sub lr, r2, #1
	mov r3, #0xc
	b _02025CDC
_02025CB0:
	add r2, r4, lr
	add r2, r2, r2, lsr #31
	mov ip, r2, asr #1
	mla r2, ip, r3, r1
	ldrh r2, [r2, #4]
	cmp r0, r2
	moveq r4, ip
	beq _02025CE4
	cmp r2, r0
	addlo r4, ip, #1
	movhs lr, ip
_02025CDC:
	cmp r4, lr
	blt _02025CB0
_02025CE4:
	mov r2, #0xc
	mla r2, r4, r2, r1
	ldrh r1, [r2, #4]
	cmp r1, r0
	ldrne r2, _02025D4C ; =_0209AB60
_02025CF8:
	mov r0, r2
#else
	mov r0, #0x1c
	mla r1, r3, r0, r1
	b _02025D34
_02025CCC:
	ldr r3, _02025D48 ; =_022A7A64
	mov r2, #0
	ldr r3, [r3, r4, lsl #2]
	mov ip, #0x1c
	ldr r3, [r3]
	sub r4, r3, #1
	b _02025D14
_02025CE8:
	add r3, r2, r4
	add r3, r3, r3, lsr #31
	mov lr, r3, asr #1
	mul r3, lr, ip
	ldrh r3, [r1, r3]
	cmp r0, r3
	moveq r2, lr
	beq _02025D1C
	cmp r3, r0
	addlo r2, lr, #1
	movhs r4, lr
_02025D14:
	cmp r2, r4
	blt _02025CE8
_02025D1C:
	mov r3, #0x1c
	mul r3, r2, r3
	ldrh r2, [r1, r3]
	add r1, r1, r3
	cmp r2, r0
	ldrne r1, _02025D4C ; =_0209AB60
_02025D34:
	mov r0, r1
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_02025D3C: .word _020AFD04
#ifdef EUROPE
_0202601C_EU: .word 0x000082BD
#endif
_02025D40: .word _022A7A54
#ifdef EUROPE
_02026024: .word _0209B09C_EU
#endif
_02025D44: .word 0x0000FFFF
#ifndef JAPAN
_02025D48: .word _022A7A64
#endif
_02025D4C: .word _0209AB60
	arm_func_end sub_02025C7C

	arm_func_start sub_02025D50
sub_02025D50: ; 0x02025D50
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [sp, #0x18]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	str ip, [sp]
	bl sub_01FF905C
	mov ip, #0x13
	mov r0, r7
	mov r1, r6
	mov r3, r4
	add r2, r5, #1
	str ip, [sp]
	bl sub_01FF905C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02025D50

	arm_func_start sub_02025D90
sub_02025D90: ; 0x02025D90
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#ifdef JAPAN
	sub sp, sp, #0x28
	mov fp, r1
	mov r4, fp, lsr #0x1f
	rsb r1, r4, fp, lsl #29
	add r5, r4, r1, ror #29
	ldr r6, _02025F58 ; =_0209B488
	mov r4, #0x18
	mla r8, r5, r4, r6
	mov r1, fp, asr #2
	str r0, [sp]
	add r0, fp, r1, lsr #29
	ldr r4, [sp, #0x50]
	mov sb, r2
	str r0, [sp, #0x24]
	add r0, sb, r4
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r3, [sp, #4]
	str r0, [sp, #0xc]
	b _02025F44
_02025DA4:
	ldr r0, [sp]
	ldr r4, [sp, #4]
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02028324
#endif
	cmp fp, #0
	mov r6, r0
	cmpge sb, #0
	blt _02025F40
	mov r0, sb, asr #2
	add r5, sb, r0, lsr #29
	ldr r0, [sp]
	mov r7, r5, asr #3
	bl GetWindow
	ldrb r2, [r0, #6]
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #29
	add r1, r1, r0, ror #29
	mul r2, r7, r2
	ldr r0, [sp, #0x24]
	add r0, r2, r0, asr #3
	add r2, r6, r0, lsl #6
	ldr r0, [sp]
	add r7, r2, r1, lsl #3
	bl GetWindow
	ldrb r0, [r0, #7]
	cmp r0, r5, asr #3
	ldrgt r0, [sp, #4]
	cmpgt r0, #0
	ble _02025F40
	mov sl, #0
	b _02025F38
_02025E1C:
	mov r6, #0
	mov r2, r4
	cmp r4, #8
	movge r2, #8
	mov r5, r6
	mov r3, r6
	b _02025E50
_02025E38:
	mov r1, r5, lsl #8
	ldr r0, [sp, #0xc]
	orr r1, r1, r6, lsr #24
	orr r5, r1, r0, asr #31
	orr r6, r0, r6, lsl #8
	add r3, r3, #1
_02025E50:
	cmp r3, r2
	blt _02025E38
	mov r0, #0
	cmp r5, r0
	cmpeq r6, sl
	beq _02025F30
	ldr r0, [r7]
	str r0, [sp, #0x14]
	ldr r0, [r7, #4]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_01FF9130_JP
	ldr r2, [r8, #4]
	ldr r3, [r8]
	and ip, r5, r2
	ldr r2, [r8, #0x10]
	and r3, r6, r3
	mov ip, ip, lsl r2
	rsb lr, r2, #0x20
	orr ip, ip, r3, lsr lr
	sub lr, r2, #0x20
	and r2, r0, r3, lsl r2
	ldr r0, [sp, #0x14]
	orr ip, ip, r3, lsl lr
	orr r0, r0, r2
	str r0, [r7]
	ldr r0, [sp, #0x18]
	and r1, r1, ip
	orr r0, r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0x40]
	str r0, [sp, #0x1c]
	ldr r0, [r7, #0x44]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	bl sub_01FF9130_JP
	ldr r3, [r8, #8]
	ldr r2, [r8, #0xc]
	and r6, r6, r3
	and r3, r5, r2
	ldr r2, [r8, #0x14]
	mov r5, r6, lsr r2
	and r6, r1, r3, lsr r2
	ldr r1, [sp, #0x20]
	orr r1, r1, r6
	rsb r6, r2, #0x20
	orr r5, r5, r3, lsl r6
	sub r2, r2, #0x20
	orr r5, r5, r3, lsr r2
	and r2, r0, r5
	ldr r0, [sp, #0x1c]
	orr r0, r0, r2
	str r0, [r7, #0x40]
	str r1, [r7, #0x44]
_02025F30:
	add r7, r7, #0x40
	sub r4, r4, #8
_02025F38:
	cmp r4, #0
	bgt _02025E1C
_02025F40:
	add sb, sb, #1
_02025F44:
	ldr r0, [sp, #8]
	cmp sb, r0
	blt _02025DA4
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02025F58: .word _0209B488
#else
	ldr r4, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov fp, r0
	add r6, sl, r3
	add r7, sb, r4
	ldr r8, [sp, #0x2c]
	b _02025E78
_02025DB4:
	mov r0, fp
	mov r5, sl
	bl GetWindow
	mov r4, r0
	mov r0, fp
	bl sub_0202760C
	cmp sb, #0
	blt _02025E74
	ldrb r1, [r4, #7]
	cmp sb, r1, lsl #3
	bge _02025E74
	ldrb r2, [r4, #6]
	mov r1, r6
	cmp sl, #0
	mov r3, r2, lsl #3
	bge _02025E00
	cmp r6, #0
	blt _02025E74
	mov r5, #0
_02025E00:
	cmp r6, r3
	blt _02025E14
	cmp r5, r3
	bge _02025E74
	sub r1, r3, #1
_02025E14:
	mov r3, sb, asr #2
	add r3, sb, r3, lsr #29
	mov r3, r3, asr #3
	mul r4, r3, r2
	mov r3, sb, lsr #0x1f
	rsb r2, r3, sb, lsl #29
	add r2, r3, r2, ror #29
	add r2, r2, r4, lsl #3
	add r2, r0, r2, lsl #3
	and r0, r8, #0xff
	b _02025E6C
_02025E40:
	mov r4, r5, lsr #0x1f
	mov ip, r5, asr #2
	rsb r3, r4, r5, lsl #29
	add ip, r5, ip, lsr #29
	add r4, r4, r3, ror #29
	mov r3, ip, asr #3
	add r4, r4, r3, lsl #6
	ldrb r3, [r2, r4]
	add r5, r5, #1
	cmp r3, #0
	streqb r0, [r2, r4]
_02025E6C:
	cmp r5, r1
	ble _02025E40
_02025E74:
	add sb, sb, #1
_02025E78:
	cmp sb, r7
	blt _02025DB4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	arm_func_end sub_02025D90

	arm_func_start sub_02025E84
sub_02025E84: ; 0x02025E84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	ldr r4, _02025EE4 ; =_0209AB9C
	add lr, sp, #0
	mov r6, r0
	mov r5, r1
	mov ip, #5
_02025EA0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02025EA0
	ldr r1, [r4]
	mov r0, #0x17
	str r1, [lr]
	strb r5, [r6]
	str r0, [r6, #0x110]
	mov r3, #0x13
	add r1, sp, #0
	mov r2, r6
	add r0, r6, #4
	str r3, [r6, #0x114]
	bl sub_02020A9C
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02025EE4: .word _0209AB9C
	arm_func_end sub_02025E84

	arm_func_start IsAOrBPressed
IsAOrBPressed: ; 0x02025EE8
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAOrBPressed

	arm_func_start sub_02025F10
sub_02025F10: ; 0x02025F10
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	mov r5, r0
	add r1, sp, #2
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #3
	movne r0, #1
	bne _02025FD4
	ldrh r0, [sp, #2]
	tst r0, #2
	beq _02025F5C
	tst r0, #0xf0
	moveq r0, #1
	beq _02025FD4
_02025F5C:
	bl sub_0204AE60
	cmp r0, #0
	beq _02025FD0
	ldrsb r0, [r5]
	mov r4, #0
	bl sub_02028324
	cmp r0, #0
	bne _02025FAC
	ldrsb r0, [r5]
	bl GetWindow
	ldrsb r1, [r0, #9]
	mvn r0, #5
	cmp r1, r0
	addne r0, r0, #1
	cmpne r1, r0
	beq _02025FAC
	ldrsb r0, [r5]
	add r4, sp, #0x28
	mov r1, r4
	bl GetWindowRectangle
_02025FAC:
	add r0, sp, #4
	bl GetReleasedStylus
	ldr r1, _02025FDC ; =0x00001408
	add r0, sp, #4
	mov r2, r4
	bl sub_02006C8C
	cmp r0, #0
	movne r0, #1
	bne _02025FD4
_02025FD0:
	mov r0, #0
_02025FD4:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025FDC: .word 0x00001408
	arm_func_end sub_02025F10

	arm_func_start sub_02025FE0
sub_02025FE0: ; 0x02025FE0
	ldr ip, _02025FEC ; =sub_020282C8
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02025FEC: .word sub_020282C8
	arm_func_end sub_02025FE0

	arm_func_start sub_02025FF0
sub_02025FF0: ; 0x02025FF0
	ldr ip, _02025FFC ; =sub_02027B1C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02025FFC: .word sub_02027B1C
	arm_func_end sub_02025FF0

	arm_func_start sub_02026000
sub_02026000: ; 0x02026000
	ldr ip, _0202600C ; =sub_01FF929C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202600C: .word sub_01FF929C
	arm_func_end sub_02026000

	arm_func_start sub_02026010
sub_02026010: ; 0x02026010
	ldr ip, _0202601C ; =UpdateWindow
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202601C: .word UpdateWindow
	arm_func_end sub_02026010

	arm_func_start sub_02026020
sub_02026020: ; 0x02026020
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl sub_020265C4
	str r0, [r4, #0x110]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02026020

	arm_func_start sub_02026038
sub_02026038: ; 0x02026038
	ldr r1, _02026044 ; =_020AFD04
#ifdef NORTH_AMERICA
	str r0, [r1, #8]
#else
	str r0, [r1, #4]
#endif
	bx lr
	.align 2, 0
_02026044: .word _020AFD04
	arm_func_end sub_02026038

	arm_func_start sub_02026048
sub_02026048: ; 0x02026048
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x110]
	str ip, [sp]
	ldrsb r0, [r0]
	bl sub_0202676C
	ldmia sp!, {r3, pc}
	arm_func_end sub_02026048

	arm_func_start sub_02026060
sub_02026060: ; 0x02026060
	ldr ip, _0202606C ; =sub_02026B1C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202606C: .word sub_02026B1C
	arm_func_end sub_02026060

	arm_func_start sub_02026070
sub_02026070: ; 0x02026070
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrsb r4, [r0]
	ldr ip, [r0, #0x110]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r0, r4
	str ip, [sp]
	bl sub_01FF905C
	mov ip, #0x13
	mov r0, r4
	mov r1, r7
	mov r3, r5
	add r2, r6, #1
	str ip, [sp]
	bl sub_01FF905C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02026070

	arm_func_start sub_020260B4
sub_020260B4: ; 0x020260B4
	ldr ip, _020260C0 ; =sub_020288DC
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_020260C0: .word sub_020288DC
	arm_func_end sub_020260B4

	arm_func_start sub_020260C4
sub_020260C4: ; 0x020260C4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldrsb r0, [r4]
	mov r6, r1
	add r1, sp, #0
	mov r5, r2
	bl GetWindowRectangle
	cmp r6, #0
	bge _02026118
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	add r0, r1, r0
	add r1, r0, r0, lsr #31
	ldrsb r0, [r4]
	mov r2, r1, asr #1
	add r3, r3, #4
	mov r1, #4
	bl sub_020288FC
	b _02026134
_02026118:
	ldr r2, [sp, #8]
	ldr r1, [sp]
	ldrsb r0, [r4]
	add r2, r6, r2
	add r3, r5, r1
	mov r1, #3
	bl sub_020288FC
_02026134:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020260C4

	arm_func_start sub_0202613C
sub_0202613C: ; 0x0202613C
	ldr ip, _02026148 ; =sub_02020B14
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026148: .word sub_02020B14
	arm_func_end sub_0202613C

	arm_func_start sub_0202614C
sub_0202614C: ; 0x0202614C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r3, sp, #0
	str r1, [sp]
	mov r1, r3
	add r0, r0, #4
	str r2, [sp, #4]
	bl sub_02020B60
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202614C

	arm_func_start sub_02026174
sub_02026174: ; 0x02026174
	ldr ip, _02026180 ; =sub_02020B74
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026180: .word sub_02020B74
	arm_func_end sub_02026174

	arm_func_start sub_02026184
sub_02026184: ; 0x02026184
	ldr ip, _02026190 ; =sub_02020BB8
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026190: .word sub_02020BB8
	arm_func_end sub_02026184

	arm_func_start sub_02026194
sub_02026194: ; 0x02026194
	ldr ip, _020261A0 ; =sub_02020BC4
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261A0: .word sub_02020BC4
	arm_func_end sub_02026194

	arm_func_start sub_020261A4
sub_020261A4: ; 0x020261A4
	ldr ip, _020261B0 ; =sub_02020CCC
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261B0: .word sub_02020CCC
	arm_func_end sub_020261A4

	arm_func_start sub_020261B4
sub_020261B4: ; 0x020261B4
	ldr ip, _020261C0 ; =sub_02020D18
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261C0: .word sub_02020D18
	arm_func_end sub_020261B4

	arm_func_start sub_020261C4
sub_020261C4: ; 0x020261C4
	ldr ip, _020261D0 ; =sub_02020D40
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261D0: .word sub_02020D40
	arm_func_end sub_020261C4

	arm_func_start sub_020261D4
sub_020261D4: ; 0x020261D4
	ldr ip, _020261E0 ; =sub_02020D54
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261E0: .word sub_02020D54
	arm_func_end sub_020261D4

	arm_func_start sub_020261E4
sub_020261E4: ; 0x020261E4
	ldr ip, _020261F0 ; =sub_02020D5C
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261F0: .word sub_02020D5C
	arm_func_end sub_020261E4

	arm_func_start sub_020261F4
sub_020261F4: ; 0x020261F4
	ldr ip, _02026200 ; =sub_02020D7C
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026200: .word sub_02020D7C
	arm_func_end sub_020261F4

	arm_func_start sub_02026204
sub_02026204: ; 0x02026204
	ldr ip, _02026210 ; =AnalyzeText
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026210: .word AnalyzeText
	arm_func_end sub_02026204

	arm_func_start DrawTextInWindow
DrawTextInWindow: ; 0x02026214
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026264 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026264: .word 0x0000C402
	arm_func_end DrawTextInWindow

	arm_func_start sub_02026268
sub_02026268: ; 0x02026268
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	mov ip, #0
	ldr r3, _020262DC ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _020262DC ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020262DC: .word 0x0000C402
	arm_func_end sub_02026268

	arm_func_start sub_020262E0
sub_020262E0: ; 0x020262E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	ldr ip, [sp, #0x530]
	ldr r3, _02026354 ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _02026354 ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02026354: .word 0x0000C402
	arm_func_end sub_020262E0

	arm_func_start sub_02026358
sub_02026358: ; 0x02026358
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x138]
	ldr ip, [sp, #0x13c]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020263C4 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020263C4: .word 0x0000C402
	arm_func_end sub_02026358

	arm_func_start sub_020263C8
sub_020263C8: ; 0x020263C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026424 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x130]
	add r0, sp, #0xc
	bl sub_02020B74
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026424: .word 0x0000C402
	arm_func_end sub_020263C8

	arm_func_start sub_02026428
sub_02026428: ; 0x02026428
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x13c]
	ldr ip, [sp, #0x140]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264A0 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x138]
	add r0, sp, #0x14
	bl sub_02020B94
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264A0: .word 0x0000C402
	arm_func_end sub_02026428

	arm_func_start sub_020264A4
sub_020264A4: ; 0x020264A4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264F4 ; =0x0000C403
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264F4: .word 0x0000C403
	arm_func_end sub_020264A4

	arm_func_start sub_020264F8
sub_020264F8: ; 0x020264F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r3
	mov r7, r0
	mov r0, r4
	mov r6, r1
	mov r5, r2
	bl sub_02025C7C
#ifdef JAPAN
	ldrsh r0, [r0, #6]
	cmp r0, #0xc
	rsblt r0, r0, #0xc
	addlt r0, r0, r0, lsr #31
	addlt r6, r6, r0, asr #1
#else
	ldrb r0, [r0, #2]
	cmp r0, #0xc
	rsblo r0, r0, #0xc
	addlo r0, r0, r0, lsr #31
	addlo r6, r6, r0, asr #1
#endif
	ldrb r0, [sp, #0x18]
	bl sub_020265C4
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_0202676C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020264F8

	arm_func_start sub_0202654C
sub_0202654C: ; 0x0202654C
	stmdb sp!, {r3, lr}
	ldr r1, _02026590 ; =_020AFD04
	mov r3, r0
#ifdef NORTH_AMERICA
	ldr r1, [r1, #8]
#else
	ldr r1, [r1, #4]
#endif
	cmp r1, #2
	blt _0202657C
	mov r1, #0
	mov r2, r1
	sub r0, r1, #2
	str r1, [sp]
	bl sub_02026C68
	ldmia sp!, {r3, pc}
_0202657C:
	bl sub_02025C7C
	cmp r0, #0
#ifdef JAPAN
	ldrnesh r0, [r0, #6]
#else
	ldrneb r0, [r0, #2]
#endif
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02026590: .word _020AFD04
	arm_func_end sub_0202654C

	arm_func_start sub_02026594
sub_02026594: ; 0x02026594
	ldr r1, _020265A4 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r1, #8]
#elif defined(JAPAN)
	ldr r1, [r1]
#else
	ldr r1, [r1, #0xc]
#endif
	ldrb r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020265A4: .word _020AFD04
	arm_func_end sub_02026594

	arm_func_start sub_020265A8
sub_020265A8: ; 0x020265A8
	ldr ip, _020265B8 ; =sub_02022118
	ldr r1, _020265BC ; =sub_0202654C
	ldr r2, _020265C0 ; =sub_02026594
	bx ip
	.align 2, 0
_020265B8: .word sub_02022118
_020265BC: .word sub_0202654C
_020265C0: .word sub_02026594
	arm_func_end sub_020265A8

	arm_func_start sub_020265C4
sub_020265C4: ; 0x020265C4
	sub r0, r0, #0x41
	cmp r0, #0x31
	addls pc, pc, r0, lsl #2
	b _02026764
_020265D4: ; jump table
	b _0202671C ; case 0
	b _02026704 ; case 1
	b _020266B4 ; case 2
	b _02026764 ; case 3
	b _020266AC ; case 4
	b _020266D4 ; case 5
	b _02026734 ; case 6
	b _0202674C ; case 7
	b _0202671C ; case 8
	b _02026754 ; case 9
	b _020266E4 ; case 10
	b _02026744 ; case 11
	b _020266EC ; case 12
	b _020266DC ; case 13
	b _0202675C ; case 14
	b _020266F4 ; case 15
	b _02026714 ; case 16
	b _0202673C ; case 17
	b _0202670C ; case 18
	b _0202669C ; case 19
	b _02026724 ; case 20
	b _020266FC ; case 21
	b _020266BC ; case 22
	b _020266C4 ; case 23
	b _020266CC ; case 24
	b _0202672C ; case 25
	b _02026764 ; case 26
	b _02026764 ; case 27
	b _02026764 ; case 28
	b _02026764 ; case 29
	b _02026764 ; case 30
	b _02026764 ; case 31
	b _02026764 ; case 32
	b _02026764 ; case 33
	b _02026764 ; case 34
	b _02026764 ; case 35
	b _02026764 ; case 36
	b _02026764 ; case 37
	b _02026764 ; case 38
	b _02026764 ; case 39
	b _02026764 ; case 40
	b _020266F4 ; case 41
	b _02026764 ; case 42
	b _02026764 ; case 43
	b _02026764 ; case 44
	b _02026764 ; case 45
	b _02026764 ; case 46
	b _02026764 ; case 47
	b _02026764 ; case 48
	b _020266A4 ; case 49
_0202669C:
	mov r0, #0
	bx lr
_020266A4:
	mov r0, #0x15
	bx lr
_020266AC:
	mov r0, #0x18
	bx lr
_020266B4:
	mov r0, #0x19
	bx lr
_020266BC:
	mov r0, #0x1a
	bx lr
_020266C4:
	mov r0, #0x1b
	bx lr
_020266CC:
	mov r0, #0x1c
	bx lr
_020266D4:
	mov r0, #0x1d
	bx lr
_020266DC:
	mov r0, #0x1e
	bx lr
_020266E4:
	mov r0, #0x1f
	bx lr
_020266EC:
	mov r0, #0x20
	bx lr
_020266F4:
	mov r0, #0x21
	bx lr
_020266FC:
	mov r0, #0x22
	bx lr
_02026704:
	mov r0, #0x23
	bx lr
_0202670C:
	mov r0, #0x24
	bx lr
_02026714:
	mov r0, #0x25
	bx lr
_0202671C:
	mov r0, #0x26
	bx lr
_02026724:
	mov r0, #0x27
	bx lr
_0202672C:
	mov r0, #0x28
	bx lr
_02026734:
	mov r0, #0x29
	bx lr
_0202673C:
	mov r0, #0x2a
	bx lr
_02026744:
	mov r0, #0x2b
	bx lr
_0202674C:
	mov r0, #0x2c
	bx lr
_02026754:
	mov r0, #0x2d
	bx lr
_0202675C:
	mov r0, #0x2e
	bx lr
_02026764:
	mov r0, #0x17
	bx lr
	arm_func_end sub_020265C4

	arm_func_start sub_0202676C
sub_0202676C: ; 0x0202676C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#ifdef JAPAN
	sub sp, sp, #0x34
	mov fp, r1
	ldr r1, [sp, #0x58]
	str r0, [sp, #4]
	mov sl, r2
	mov r5, r3
	str r1, [sp, #0x58]
	bl GetWindow
	ldr r1, _02026EA0 ; =_020AFD04
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r0, #2
	blt _0202689C
	ldr r0, [sp, #4]
	mov r4, #1
	mov r1, fp
	mov r2, sl
	mov r3, r5
	str r4, [sp]
	bl sub_02026C68
	b _02026E98
_0202689C:
	mov r0, r5
	bl sub_02025C7C
	ldr r1, _02026EA4 ; =_022A92B4_JP
	str r0, [sp, #0x1c]
	ldrb r1, [r1]
	ldr sb, [r0]
	cmp r1, #0
	beq _020268D8
	ldrb r0, [r0, #0xa]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	str r0, [sp, #8]
	b _020268E0
_020268D8:
	mov r0, #0
	str r0, [sp, #8]
_020268E0:
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, #0xa]
	tst r0, #1
	beq _02026B70
	ldr r0, [sp, #4]
	bl sub_0202760C
	ldr r1, _02026EA0 ; =_020AFD04
	mov r0, r0, lsl #1
	ldr r2, _02026EA8 ; =_022A92B8_JP
	ldr r1, [r1, #4]
	str r0, [sp, #0x14]
	ldr r5, [r2, r1, lsl #2]
	b _02026920
_02026914:
	add sb, sb, #6
	add sl, sl, #1
	sub r5, r5, #1
_02026920:
	cmp sl, #0
	blt _02026914
	ldrb r1, [r4, #7]
	add r0, sl, r5
	cmp r0, r1, lsl #3
	mov r0, fp, asr #2
	add r7, fp, r0, lsr #29
	ldr r0, [sp, #4]
	rsbge r5, sl, r1, lsl #3
	mov r6, r7, asr #3
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02027624
#endif
	mov r1, sl, asr #2
	add r1, sl, r1, lsr #29
	ldrb r3, [r4, #6]
	mov r1, r1, asr #3
	mov r2, sl, lsr #0x1f
	mul r3, r1, r3
	rsb r1, r2, sl, lsl #29
	add r8, r3, r7, asr #3
	mov r7, fp, lsr #0x1f
	add r2, r2, r1, ror #29
	mov r1, r8, lsl #4
	add r8, r1, r2, lsl #1
	rsb r3, r7, fp, lsl #29
	add r1, r7, r3, ror #29
	add r3, r0, r8, lsl #2
	ldr r2, _02026EAC ; =_0209B408_JP
	mov r0, #0
	add r8, r2, r1, lsl #4
	str r0, [sp, #0x30]
	b _02026B60
_0202699C:
	ldrh r1, [sb, #2]
	ldrh r0, [sb]
	orrs ip, r0, r1, lsl #16
	beq _02026A68
	ldrb r0, [r4, #6]
	cmp r6, r0
	bge _02026A0C
	ldr r1, [r8]
	ldr r0, [r8, #8]
	mov fp, r3
	str r0, [sp, #0x20]
	and r2, ip, r1
	mov r7, #7
_020269D0:
	mov r0, r7, lsl #2
	rsb lr, r0, #0x1c
	ldr r0, _02026EB0_JP ; =_0209B32C_JP
	ldr r1, [r0, r7, lsl #2]
	ldr r0, [sp, #0x20]
	and r0, r1, r2, lsl r0
	mov r0, r0, lsr lr
	ands r0, r0, #0xff
	ldrneb r1, [fp]
	orrne r0, r0, #0x20
	orrne r0, r1, r0
	strneb r0, [fp]
	add fp, fp, #1
	subs r7, r7, #1
	bpl _020269D0
_02026A0C:
	ldrb r0, [r4, #6]
	sub r0, r0, #1
	cmp r6, r0
	bge _02026A68
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	and r1, ip, r1
	add r2, r3, #0x40
	mov r7, #7
_02026A30:
	mov fp, r7, lsl #2
	rsb ip, fp, #0x1c
	ldr fp, _02026EB0_JP ; =_0209B32C_JP
	ldr fp, [fp, r7, lsl #2]
	and fp, fp, r1, lsr r0
	mov fp, fp, lsr ip
	ands fp, fp, #0xff
	ldrneb ip, [r2]
	orrne fp, fp, #0x20
	orrne fp, ip, fp
	strneb fp, [r2]
	add r2, r2, #1
	subs r7, r7, #1
	bpl _02026A30
_02026A68:
	ldrh r7, [sb, #4]
	cmp r7, #0
	beq _02026B34
	ldrb r0, [r4, #6]
	sub r0, r0, #1
	cmp r6, r0
	bge _02026AD8
	ldr r1, [r8]
	ldr r0, [r8, #8]
	and r2, r7, r1
	str r0, [sp, #0x24]
	add fp, r3, #0x40
	mov ip, #7
_02026A9C:
	mov r0, ip, lsl #2
	rsb lr, r0, #0x1c
	ldr r0, _02026EB0_JP ; =_0209B32C_JP
	ldr r1, [r0, ip, lsl #2]
	ldr r0, [sp, #0x24]
	and r0, r1, r2, lsl r0
	mov r0, r0, lsr lr
	ands r0, r0, #0xff
	ldrneb r1, [fp]
	orrne r0, r0, #0x20
	orrne r0, r1, r0
	strneb r0, [fp]
	add fp, fp, #1
	subs ip, ip, #1
	bpl _02026A9C
_02026AD8:
	ldrb r0, [r4, #6]
	sub r0, r0, #2
	cmp r6, r0
	bge _02026B34
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	and r1, r7, r1
	add r2, r3, #0x80
	mov r7, #7
_02026AFC:
	mov fp, r7, lsl #2
	rsb ip, fp, #0x1c
	ldr fp, _02026EB0_JP ; =_0209B32C_JP
	ldr fp, [fp, r7, lsl #2]
	and fp, fp, r1, lsr r0
	mov fp, fp, lsr ip
	ands fp, fp, #0xff
	ldrneb ip, [r2]
	orrne fp, fp, #0x20
	orrne fp, ip, fp
	strneb fp, [r2]
	add r2, r2, #1
	subs r7, r7, #1
	bpl _02026AFC
_02026B34:
	add sl, sl, #1
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	adds r0, r1, r0, ror #29
	ldreq r0, [sp, #0x14]
	add r3, r3, #8
	addeq r3, r3, r0, lsl #2
	ldr r0, [sp, #0x30]
	add sb, sb, #6
	add r0, r0, #1
	str r0, [sp, #0x30]
_02026B60:
	ldr r0, [sp, #0x30]
	cmp r0, r5
	blt _0202699C
	b _02026E90
_02026B70:
	ldr r0, [sp, #4]
	bl sub_0202760C
	ldr r1, _02026EA0 ; =_020AFD04
	ldr r2, _02026EA8 ; =_022A92B8_JP
	ldr r1, [r1, #4]
	str r0, [sp, #0x28]
	cmp sl, #0
	ldr r5, [r2, r1, lsl #2]
	mov r6, #0
	bge _02026BB4
	mov r6, #1
	b _02026BAC
_02026BA0:
	add sb, sb, #6
	add sl, sl, #1
	sub r5, r5, #1
_02026BAC:
	cmp sl, #0
	blt _02026BA0
_02026BB4:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02026BD4
	cmp r6, #0
	subne r0, sb, #6
	strne r0, [sp, #0xc]
	streq sb, [sp, #0xc]
	b _02026BDC
_02026BD4:
	str sb, [sp, #0xc]
	mov r6, #0
_02026BDC:
	ldrb r1, [r4, #7]
	add r0, sl, r5
	cmp r0, r1, lsl #3
	rsbge r5, sl, r1, lsl #3
	and r1, fp, #7
	str r1, [sp, #0x18]
	rsb r1, r1, #7
	ldr r0, [sp, #4]
	str r1, [sp, #0x10]
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02027624
#endif
	mov r2, sl, lsr #0x1f
	rsb r1, r2, sl, lsl #29
	add r1, r2, r1, ror #29
	mov r2, fp, asr #2
	add r2, fp, r2, lsr #29
	mov r3, sl, asr #2
	add r3, sl, r3, lsr #29
	mov ip, r3, asr #3
	ldrb fp, [r4, #6]
	mov r3, #0
	mul fp, ip, fp
	add r2, fp, r2, asr #3
	mov r2, r2, lsl #4
	add r1, r2, r1, lsl #1
	add r1, r0, r1, lsl #2
	ldr r0, [sp, #0x18]
	add fp, r1, r0
	b _02026E0C
_02026C4C:
	cmp r6, #0
	mov r2, fp
	ldr r0, [sp, #0x10]
	beq _02026D0C
	ldr ip, [sp, #0x58]
	mov r1, #0
	and ip, ip, #0xff
	mov lr, r1
	str ip, [sp, #0x2c]
_02026C70:
	tst lr, #3
	ldreq ip, [sp, #0xc]
	ldreqh r7, [sb], #2
	ldreqh r8, [ip], #2
	streq ip, [sp, #0xc]
	movne r7, r7, lsl #0xc
	movne r8, r8, lsl #0xc
	movne r7, r7, lsr #0x10
	movne r8, r8, lsr #0x10
	tst r7, #0xf
	ldrne r1, [sp, #0x2c]
	strneb r1, [r2], #1
	movne r1, #1
	bne _02026CD8
	cmp r1, #0
	bne _02026CB8
	tst r8, #0xf
	beq _02026CD4
_02026CB8:
	ldrb ip, [r2]
	mov r1, #0
	cmp ip, #0
	moveq ip, #0x13
	streqb ip, [r2], #1
	addne r2, r2, #1
	b _02026CD8
_02026CD4:
	add r2, r2, #1
_02026CD8:
	subs r0, r0, #1
	add lr, lr, #1
	addmi r2, r2, #0x38
	movmi r0, #7
	cmp lr, #0xc
	blt _02026C70
	cmp r1, #0
	beq _02026DEC
	ldrb r0, [r2]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [r2]
	b _02026DEC
_02026D0C:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _02026DA8
	ldr ip, [sp, #0x58]
	mov r1, #0
	mov r6, r1
	and lr, ip, #0xff
_02026D28_JP:
	tst r6, #3
	ldreqh r7, [sb], #2
	movne r7, r7, lsl #0xc
	movne r7, r7, lsr #0x10
	tst r7, #0xf
	strneb lr, [r2], #1
	movne r1, #1
	bne _02026D70
	cmp r1, #0
	beq _02026D6C
	ldrb ip, [r2]
	mov r1, #0
	cmp ip, #0
	moveq ip, #0x13
	streqb ip, [r2], #1
	addne r2, r2, #1
	b _02026D70
_02026D6C:
	add r2, r2, #1
_02026D70:
	subs r0, r0, #1
	add r6, r6, #1
	addmi r2, r2, #0x38
	movmi r0, #7
	cmp r6, #0xc
	blt _02026D28_JP
	cmp r1, #0
	beq _02026DA0
	ldrb r0, [r2]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [r2]
_02026DA0:
	mov r6, #1
	b _02026DEC
_02026DA8:
	ldr r1, [sp, #0x58]
	mov ip, #0
	and r1, r1, #0xff
	mov lr, #7
_02026DB8:
	tst ip, #3
	ldreqh r7, [sb], #2
	add ip, ip, #1
	movne r7, r7, lsl #0xc
	movne r7, r7, lsr #0x10
	tst r7, #0xf
	strneb r1, [r2], #1
	addeq r2, r2, #1
	subs r0, r0, #1
	addmi r2, r2, #0x38
	movmi r0, lr
	cmp ip, #0xc
	blt _02026DB8
_02026DEC:
	add sl, sl, #1
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	adds r0, r1, r0, ror #29
	ldreq r0, [sp, #0x28]
	add fp, fp, #8
	addeq fp, fp, r0, lsl #3
	add r3, r3, #1
_02026E0C:
	cmp r3, r5
	blt _02026C4C
	cmp r6, #0
	beq _02026E90
	ldrb r0, [r4, #7]
	add r1, sl, r5
	cmp r1, r0, lsl #3
	bge _02026E90
	mov r3, #0
	mov r2, #0x13
	mov r1, #7
_02026E38_JP:
	tst r3, #3
	ldreq r0, [sp, #0xc]
	ldreqh r8, [r0], #2
	streq r0, [sp, #0xc]
	movne r0, r8, lsl #0xc
	movne r8, r0, lsr #0x10
	tst r8, #0xf
	beq _02026E6C
	ldrb r0, [fp]
	cmp r0, #0
	streqb r2, [fp], #1
	addne fp, fp, #1
	b _02026E70
_02026E6C:
	add fp, fp, #1
_02026E70:
	ldr r0, [sp, #0x10]
	add r3, r3, #1
	subs r0, r0, #1
	str r0, [sp, #0x10]
	strmi r1, [sp, #0x10]
	addmi fp, fp, #0x38
	cmp r3, #0xc
	blt _02026E38_JP
_02026E90:
	ldr r0, [sp, #0x1c]
	ldrsh r0, [r0, #6]
_02026E98:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02026EA0: .word _020AFD04
_02026EA4: .word _022A92B4_JP
_02026EA8: .word _022A92B8_JP
_02026EAC: .word _0209B408_JP
_02026EB0_JP: .word _0209B32C_JP
#else
	sub sp, sp, #0x2c
	str r0, [sp, #4]
	mov sl, r1
	mov r6, r2
	mov r7, r3
	ldr r5, [sp, #0x50]
	bl GetWindow
	ldr r1, _02026B14 ; =_020AFD04
	str r0, [sp, #0x18]
#ifdef EUROPE
	ldr r0, [r1, #4]
#else
	ldr r0, [r1, #8]
#endif
	cmp r0, #2
	blt _020267C0
	ldr r0, [sp, #4]
	mov r4, #1
	mov r1, sl
	mov r2, r6
	mov r3, r7
	str r4, [sp]
	bl sub_02026C68
	b _02026B0C
_020267C0:
	ldr r0, [sp, #4]
	add r1, sp, #0x24
	bl sub_020282C8
	mov r0, r7
	bl sub_02025C7C
	ldr r1, _02026B14 ; =_020AFD04
	str r0, [sp, #0x14]
	ldrb r1, [r1]
	add r4, r0, #4
	cmp r1, #0
	beq _02026804
	ldrb r0, [r0, #3]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and fp, r0, #0xff
	b _02026808
_02026804:
	mov fp, #0
_02026808:
	ldr r0, _02026B14 ; =_020AFD04
	ldr r3, [sp, #0x24]
#ifdef EUROPE
	ldr r2, [r0, #4]
#else
	ldr r2, [r0, #8]
#endif
	ldr r1, _02026B18 ; =_022A7A5C
	sub r0, r3, #8
	cmp r6, #0
	str r0, [sp, #0x1c]
	ldr r7, [r1, r2, lsl #2]
	mov r8, #0
	bge _0202684C
	mov r8, #1
	b _02026844
_02026838:
	add r4, r4, #2
	add r6, r6, #1
	sub r7, r7, #1
_02026844:
	cmp r6, #0
	blt _02026838
_0202684C:
	cmp fp, #0
	beq _02026868
	cmp r8, #0
	subne r0, r4, #2
	strne r0, [sp, #8]
	streq r4, [sp, #8]
	b _02026870
_02026868:
	str r4, [sp, #8]
	mov r8, #0
_02026870:
	ldr r1, [sp, #0x28]
	add r0, r6, r7
	cmp r0, r1
	and sb, sl, #7
	subge r7, r1, r6
	rsb r1, sb, #7
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	bl sub_0202760C
	mov r3, r6, lsr #0x1f
	ldr r1, [sp, #0x18]
	rsb r2, r3, r6, lsl #29
	add r2, r3, r2, ror #29
	mov r3, sl, asr #2
	add r3, sl, r3, lsr #29
	mov sl, r6, asr #2
	add sl, r6, sl, lsr #29
	ldrb r1, [r1, #6]
	mov sl, sl, asr #3
	mul r1, sl, r1
	add r1, r1, r3, asr #3
	mov r1, r1, lsl #4
	add r1, r1, r2, lsl #1
	add r0, r0, r1, lsl #2
	add sb, r0, sb
	mov r1, #0
	b _02026A88
_020268DC:
	mov ip, sb
	ldr r2, [sp, #0xc]
	cmp r8, #0
	beq _0202699C
	ldr sl, [sp, #8]
	mov r3, #0
	ldrh r0, [sl], #2
	str sl, [sp, #8]
	and sl, r5, #0xff
	ldrh lr, [r4], #2
	str r3, [sp, #0x10]
	str sl, [sp, #0x20]
_0202690C:
	tst lr, #1
	ldrne r3, [sp, #0x20]
	strneb r3, [ip], #1
	movne r3, #1
	bne _02026950
	cmp r3, #0
	bne _02026930
	tst r0, #1
	beq _0202694C
_02026930:
	ldrb sl, [ip]
	mov r3, #0
	cmp sl, #0
	moveq sl, #0x13
	streqb sl, [ip], #1
	addne ip, ip, #1
	b _02026950
_0202694C:
	add ip, ip, #1
_02026950:
	mov sl, lr, lsl #0xf
	mov lr, sl, lsr #0x10
	ldr sl, [sp, #0x10]
	subs r2, r2, #1
	mov r0, r0, lsl #0xf
	add sl, sl, #1
	mov r0, r0, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, #7
	str sl, [sp, #0x10]
	cmp sl, #0xc
	blt _0202690C
	cmp r3, #0
	beq _02026A68
	ldrb r0, [ip]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [ip]
	b _02026A68
_0202699C:
	cmp fp, #0
	beq _02026A2C
	ldrh r8, [r4], #2
	mov r3, #0
	mov lr, r3
	and r0, r5, #0xff
_020269B4:
	tst r8, #1
	strneb r0, [ip], #1
	movne r3, #1
	bne _020269EC
	cmp r3, #0
	beq _020269E8
	ldrb sl, [ip]
	mov r3, #0
	cmp sl, #0
	moveq sl, #0x13
	streqb sl, [ip], #1
	addne ip, ip, #1
	b _020269EC
_020269E8:
	add ip, ip, #1
_020269EC:
	subs r2, r2, #1
	mov r8, r8, lsl #0xf
	add lr, lr, #1
	mov r8, r8, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, #7
	cmp lr, #0xc
	blt _020269B4
	cmp r3, #0
	beq _02026A24
	ldrb r0, [ip]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [ip]
_02026A24:
	mov r8, #1
	b _02026A68
_02026A2C:
	ldrh r3, [r4], #2
	mov r0, #0
	and sl, r5, #0xff
	mov lr, #7
_02026A3C:
	tst r3, #1
	strneb sl, [ip], #1
	addeq ip, ip, #1
	subs r2, r2, #1
	mov r3, r3, lsl #0xf
	add r0, r0, #1
	mov r3, r3, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, lr
	cmp r0, #0xc
	blt _02026A3C
_02026A68:
	add r6, r6, #1
	mov r2, r6, lsr #0x1f
	rsb r0, r2, r6, lsl #29
	adds r0, r2, r0, ror #29
	ldreq r0, [sp, #0x1c]
	add sb, sb, #8
	addeq sb, sb, r0, lsl #3
	add r1, r1, #1
_02026A88:
	cmp r1, r7
	blt _020268DC
	cmp r8, #0
	beq _02026B04
	ldr r0, [sp, #0x28]
	add r1, r6, r7
	cmp r1, r0
	bge _02026B04
	ldr r0, [sp, #8]
	mov r4, #0
	ldrh r3, [r0]
	mov r2, #0x13
	mov r1, #7
_02026ABC:
	tst r3, #1
	beq _02026AD8
	ldrb r0, [sb]
	cmp r0, #0
	streqb r2, [sb], #1
	addne sb, sb, #1
	b _02026ADC
_02026AD8:
	add sb, sb, #1
_02026ADC:
	mov r0, r3, lsl #0xf
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	subs r0, r0, #1
	str r0, [sp, #0xc]
	strmi r1, [sp, #0xc]
	addmi sb, sb, #0x38
	cmp r4, #0xc
	blt _02026ABC
_02026B04:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #2]
_02026B0C:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02026B14: .word _020AFD04
_02026B18: .word _022A7A5C
#endif
	arm_func_end sub_0202676C

	arm_func_start sub_02026B1C
sub_02026B1C: ; 0x02026B1C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl sub_0202796C_JP
	mov fp, r0
	mov r0, sl
	bl GetWindow
	ldr r1, _02026C64 ; =_020AFD04
	ldrb r3, [r0, #6]
	ldr r2, [r1]
	add r1, r2, r7, lsl #2
	ldrsh r0, [r1, #2]
	mov r4, r3, lsl #6
	ldrb r5, [r2, r7, lsl #2]
	cmp r0, #0
	ldrb r6, [r1, #1]
	movlt r0, #0
	blt _02026FCC
	add r1, sp, #0
	mov r0, sl
	bl sub_020282C8
	ldr r0, _02026C64 ; =_020AFD04
	mov r3, sb
	ldr r1, [r0]
	mov sl, r8
	cmp sb, #0
	add r0, r1, r7, lsl #2
	ldrsh r0, [r0, #2]
	movlt r3, #0
	cmp r8, #0
	add r7, r1, r0
	movlt sl, #0
	add sb, sb, r5
	add r6, r8, r6
	b _02026FC0
_02026F4C:
	ldr r0, [sp, #4]
	cmp sl, r0
	bge _02026FC8
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	add r1, r1, r0, ror #29
	mov r2, sl, asr #2
	add r0, sl, r2, lsr #29
	add r1, fp, r1, lsl #3
	mov r0, r0, asr #3
	mla r8, r0, r4, r1
	mov r2, r3
	b _02026FB4
_02026F80:
	ldr r0, [sp]
	cmp r2, r0
	bge _02026FBC
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #29
	mov ip, r2, asr #2
	add ip, r2, ip, lsr #29
	add r0, r1, r0, ror #29
	ldrsb r1, [r7], #1
	mov ip, ip, asr #3
	add r0, r8, r0
	strb r1, [r0, ip, lsl #6]
	add r2, r2, #1
_02026FB4:
	cmp r2, sb
	blt _02026F80
_02026FBC:
	add sl, sl, #1
_02026FC0:
	cmp sl, r6
	blt _02026F4C
_02026FC8:
	mov r0, r5
_02026FCC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r5, _02026C64 ; =_020AFD04
	mov r4, r0
#ifdef EUROPE
	ldr r5, [r5, #8]
#else
	ldr r5, [r5, #0xc]
#endif
	mov r6, r1
	add r7, r5, r3, lsl #2
	mov r5, r2
	bl sub_0202760C
	ldrsh r3, [r7, #2]
	mov r8, r0
	cmp r3, #0
	movlt r0, #0
	blt _02026C5C
	ldr r0, _02026C64 ; =_020AFD04
	add r1, sp, #0
#ifdef EUROPE
	ldr r2, [r0, #8]
#else
	ldr r2, [r0, #0xc]
#endif
	mov r0, r4
	add r4, r2, r3
	bl sub_020282C8
	ldrb r0, [r7, #1]
	cmp r5, #0
	add ip, r5, r0
	bge _02026B9C
	cmp ip, #0
	ldrltb r0, [r7]
	blt _02026C5C
	ldr r1, [sp]
	rsb r0, r5, #0
	mla r4, r1, r0, r4
	mov r5, #0
	b _02026BB8
_02026B9C:
	ldr r0, [sp, #4]
	cmp ip, r0
	ble _02026BB8
	cmp r5, r0
	ldrgtb r0, [r7]
	bgt _02026C5C
	mov ip, r0
_02026BB8:
	ldrb r0, [r7]
	cmp r6, #0
	movlt r6, #0
	ldr r1, [sp]
	add r3, r6, r0
	cmp r3, r1
	subgt r6, r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	movgt r3, r1
	mov r2, r6
	mov r1, r0, lsl #6
	b _02026C50
_02026BF0:
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	mov r0, r0, asr #3
	mul sb, r0, r1
	mov r6, r5, lsr #0x1f
	rsb r0, r6, r5, lsl #29
	add r0, r6, r0, ror #29
	add r0, sb, r0, lsl #3
	mov r6, r2
	add lr, r8, r0
	b _02026C44
_02026C1C:
	mov sb, r6, lsr #0x1f
	rsb r0, sb, r6, lsl #29
	mov sl, r6, asr #2
	add sl, r6, sl, lsr #29
	add sb, sb, r0, ror #29
	ldrb r0, [r4], #1
	mov sl, sl, asr #3
	add sb, lr, sb
	strb r0, [sb, sl, lsl #6]
	add r6, r6, #1
_02026C44:
	cmp r6, r3
	blt _02026C1C
	add r5, r5, #1
_02026C50:
	cmp r5, ip
	blt _02026BF0
	ldrb r0, [r7]
_02026C5C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
#endif
	.align 2, 0
_02026C64: .word _020AFD04
	arm_func_end sub_02026B1C

	arm_func_start sub_02026C68
sub_02026C68: ; 0x02026C68
	stmdb sp!, {r3, lr}
	cmp r3, #0x41
	blo _02026CA4
	cmp r3, #0x5a
	bhi _02026CA4
	ldr ip, _02026E38 ; =_020AFD04
	sub r3, r3, #0x40
#ifdef NORTH_AMERICA
	ldr ip, [ip, #8]
#else
	ldr ip, [ip, #4]
#endif
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	cmp ip, #3
	addeq r3, r3, #0x50
	moveq r3, r3, lsl #0x10
	moveq r3, r3, asr #0x10
	b _02026E18
_02026CA4:
	ldr ip, _02026E38 ; =_020AFD04
#ifdef NORTH_AMERICA
	ldr ip, [ip, #8]
#else
	ldr ip, [ip, #4]
#endif
	cmp ip, #3
	bne _02026D40
	cmp r3, #0x40
	bgt _02026CCC
	bge _02026D00
	cmp r3, #0x26
	beq _02026D30
	b _02026D38
_02026CCC:
	cmp r3, #0x6f
	bgt _02026CF4
	subs ip, r3, #0x6b
	addpl pc, pc, ip, lsl #2
	b _02026D38
_02026CE0: ; jump table
	b _02026D10 ; case 0
	b _02026D38 ; case 1
	b _02026D18 ; case 2
	b _02026D20 ; case 3
	b _02026D08 ; case 4
_02026CF4:
	cmp r3, #0xe9
	beq _02026D28
	b _02026D38
_02026D00:
	mov r3, #0x50
	b _02026E18
_02026D08:
	mov r3, #0x6b
	b _02026E18
_02026D10:
	mov r3, #0x6c
	b _02026E18
_02026D18:
	mov r3, #0x6d
	b _02026E18
_02026D20:
	mov r3, #0x6e
	b _02026E18
_02026D28:
	mov r3, #0x6f
	b _02026E18
_02026D30:
	mov r3, #0x71
	b _02026E18
_02026D38:
	mov r0, #8
	ldmia sp!, {r3, pc}
_02026D40:
	cmp r3, #0x61
	blo _02026D5C
	cmp r3, #0x7a
	subls r3, r3, #0x40
	movls r3, r3, lsl #0x10
	movls r3, r3, asr #0x10
	bls _02026E18
_02026D5C:
#ifdef EUROPE
	cmp r3, #0xe1
	bgt _02027090
	bge _020270F4
	cmp r3, #0x2e
	bgt _02027084
	subs ip, r3, #0x26
	addpl pc, pc, ip, lsl #2
	b _02026E10
_02027060: ; jump table
	b _02026DE8 ; case 0
	b _02026DE0 ; case 1
	b _02026E10 ; case 2
	b _02026E10 ; case 3
	b _02026E10 ; case 4
	b _02026E10 ; case 5
	b _02026DD0 ; case 6
	b _02026DD8 ; case 7
	b _02026DC8 ; case 8
_02027084:
	cmp r3, #0xc1
	beq _02026E00
	b _02026E10
_02027090:
	cmp r3, #0xeb
	bgt _020270A8
	bge _02026DF8
	cmp r3, #0xe9
	beq _02026DF0
	b _02026E10
_020270A8:
	cmp r3, #0xed
	beq _020270FC
	b _02026E10
#else
	cmp r3, #0xc1
	bgt _02026DAC
	bge _02026E00
	sub ip, r3, #0x22
	cmp ip, #0xc
	addls pc, pc, ip, lsl #2
	b _02026E10
_02026D78: ; jump table
	b _02026E08 ; case 0
	b _02026E10 ; case 1
	b _02026E10 ; case 2
	b _02026E10 ; case 3
	b _02026DE8 ; case 4
	b _02026DE0 ; case 5
	b _02026E10 ; case 6
	b _02026E10 ; case 7
	b _02026E10 ; case 8
	b _02026E10 ; case 9
	b _02026DD0 ; case 10
	b _02026DD8 ; case 11
	b _02026DC8 ; case 12
_02026DAC:
	cmp r3, #0xe9
	bgt _02026DBC
	beq _02026DF0
	b _02026E10
_02026DBC:
	cmp r3, #0xeb
	beq _02026DF8
	b _02026E10
#endif
_02026DC8:
	mov r3, #0x1b
	b _02026E18
_02026DD0:
	mov r3, #0x1c
	b _02026E18
_02026DD8:
	mov r3, #0x1d
	b _02026E18
_02026DE0:
	mov r3, #0x1e
	b _02026E18
_02026DE8:
	mov r3, #0
	b _02026E18
_02026DF0:
	mov r3, #0x3b
	b _02026E18
_02026DF8:
	mov r3, #0x3c
	b _02026E18
_02026E00:
	mov r3, #0x3d
	b _02026E18
#ifdef EUROPE
_020270F4:
	mov r3, #0x4c
	b _02026E18
_020270FC:
	mov r3, #0x4d
	b _02026E18
#else
_02026E08:
	mov r3, #0x3e
	b _02026E18
#endif
_02026E10:
	mov r0, #6
	ldmia sp!, {r3, pc}
_02026E18:
	ldrb ip, [sp, #8]
	cmp ip, #0
	ldreq r0, _02026E38 ; =_020AFD04
#if defined(EUROPE)
	ldreq r0, [r0, #8]
#elif defined(JAPAN)
	ldreq r0, [r0]
#else
	ldreq r0, [r0, #0xc]
#endif
	ldreqb r0, [r0, r3, lsl #2]
	ldmeqia sp!, {r3, pc}
	bl sub_02026B1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02026E38: .word _020AFD04
	arm_func_end sub_02026C68

	arm_func_start sub_02026E3C
sub_02026E3C: ; 0x02026E3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_0202760C
#endif
	mov r4, r0
	mov r0, r7
	bl sub_02027624
	mov r3, r5, lsl #0x14
	mov r1, r0
	mov r0, r4
	mov r2, r6
	mov r3, r3, lsr #0x10
	bl DecompressAtHalf
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02026E3C

	arm_func_start sub_02026E78
sub_02026E78: ; 0x02026E78
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	ldr r3, _02026FEC ; =_020AFD4C
	mov ip, #1
	ldr r0, _02026FF0 ; =_022A88DC
	mov r1, #0
	mov r2, #0x1180
	strb ip, [r3, #4]
	bl memset
	ldr r0, _02026FF8 ; =_022A7B1C
	mov r1, #0
	mov r2, #0x370
	bl memset
	mov r1, #0
	ldr r0, _02026FFC ; =_022A7AC8
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02026FEC ; =_020AFD4C
	mov r4, #1
	ldr r0, _02026FF0 ; =_022A88DC
	mov r1, #0
	mov r2, #0x1180
	strb r4, [r3, #2]
	bl memset
	mov r7, #0
	ldr r0, _02026FF4 ; =_022A7A6C
	mvn r5, #1
	ldr r6, _02026FF8 ; =_022A7B1C
	strb r5, [r0, #5]
	mov r4, r7
_02026EB0:
	strb r4, [r6]
	add r0, r6, #4
	strb r5, [r6, #0x2c]
	bl sub_02029A50
	add r7, r7, #1
	cmp r7, #0x14
	add r6, r6, #0x30
	blt _02026EB0
	ldr r0, _02026FFC ; =_022A7AC8
	mov r1, #0
#endif
	ldr r2, _02027000 ; =0x04000014
	ldr r3, _02027004 ; =0x0600D800
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027008 ; =_022A7B00
#ifdef JAPAN
	str r1, [sp]
	ldr r2, _0202700C ; =0x04001010
	ldr r3, _02027010 ; =0x0620D000
	bl sub_0200B2C4
	mov r1, #0
	str r1, [sp]
	ldr r0, _02027014 ; =_022A7AE4
	ldr r2, _02027018 ; =0x04001014
	ldr r3, _0202701C ; =0x0620D800
	bl sub_0200B2C4
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027020 ; =_022A7AA0
	mov r1, #1
	mov r2, #0x200
	ldr r3, _02027024 ; =0x06882000
#else
	ldr r2, _0202700C ; =0x04001010
	ldr r3, _02027010 ; =0x0620D000
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027014 ; =_022A7AE4
	ldr r2, _02027018 ; =0x04001014
	ldr r3, _0202701C ; =0x0620D800
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027020 ; =_022A7AA0
	str r1, [sp]
	ldr r3, _02027024 ; =0x06882000
	mov r1, #1
	mov r2, #0x200
#endif
	bl sub_0200A124
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027028 ; =_022A7A8C
	mov r1, #3
	mov r2, #0x200
	ldr r3, _0202702C ; =0x06898000
	bl sub_0200A124
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027030 ; =_022A7A78
	mov r1, #3
	mov r2, #0x300
	ldr r3, _02027034 ; =0x0689A000
	bl sub_0200A124
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _02027038 ; =_022A7EDC
#ifdef JAPAN
	strb r2, [r1]
	strb r2, [r1, #4]
	strb r2, [r1, #2]
#else
	strb r2, [r1, #4]
	strb r2, [r1]
	strb r2, [r1, #1]
#endif
	mov r1, #0xa00
	bl MemZero
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _0202703C ; =_022A7AB4
	strh r2, [r1, #6]
	mov r1, #0x14
	bl MemZero
	mov r0, #0
	bl sub_02027180
	mov r2, #1
	ldr r0, _02026FF4 ; =_022A7A6C
	sub r1, r2, #3
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
#ifdef JAPAN
	strb r1, [r0, #1]
#else
	strb r1, [r0, #3]
#endif
	bl LoadCursors
	bl LoadAlert
	bl sub_0202A124
#ifdef JAPAN
	ldr r1, _02026FF4 ; =_022A7A6C
	mov r2, #0
	ldr r0, _02026FEC ; =_020AFD4C
#else
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _02026FEC ; =_020AFD4C
#endif
	strh r2, [r1, #6]
	str r2, [r0, #8]
	bl sub_0202903C
#ifdef JAPAN
	ldmia sp!, {r3, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02026FEC: .word _020AFD4C
_02026FF0: .word _022A88DC
#ifndef JAPAN
_02026FF4: .word _022A7A6C
#endif
_02026FF8: .word _022A7B1C
_02026FFC: .word _022A7AC8
_02027000: .word 0x04000014
_02027004: .word 0x0600D800
_02027008: .word _022A7B00
_0202700C: .word 0x04001010
_02027010: .word 0x0620D000
_02027014: .word _022A7AE4
_02027018: .word 0x04001014
_0202701C: .word 0x0620D800
_02027020: .word _022A7AA0
_02027024: .word 0x06882000
_02027028: .word _022A7A8C
_0202702C: .word 0x06898000
_02027030: .word _022A7A78
_02027034: .word 0x0689A000
#ifdef JAPAN
_02026FF4: .word _022A7A6C
#endif
_02027038: .word _022A7EDC
_0202703C: .word _022A7AB4
	arm_func_end sub_02026E78

	arm_func_start sub_02027040
sub_02027040: ; 0x02027040
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r3, #0xe0
	mul r5, r0, r3
	ldr r6, _02027134 ; =_022A88E4
	mov sl, r1
	ldrb r0, [r6, r5]
	ldr r3, _02027138 ; =_0209AC58
	mov r8, #0
	cmp r0, #0
	mov r0, r2, lsl #0x10
	ldreq sb, _0202713C ; =_022A7AA0
	add r2, sp, #0
	ldrne sb, _02027140 ; =_022A7A8C
	mov r7, r0, lsr #0x10
	mov r1, #4
_02027080:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027080
	add r4, sp, #8
_02027094:
	add r3, sp, #0
	add r2, sp, #4
	mov r1, #4
_020270A0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020270A0
	ldrsb r0, [sl]
	add r3, sp, #4
	add r2, sp, #8
	strb r0, [sp, #4]
	ldrsb r0, [sl, #1]
	mov r1, #4
	strb r0, [sp, #5]
	ldrsb r0, [sl, #2]
	strb r0, [sp, #6]
_020270D4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020270D4
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r0, sb
	mov r2, r4
	add sl, sl, #3
	mov r7, r3, lsr #0x10
	bl sub_0200A29C
	add r8, r8, #1
	cmp r8, #0x10
	blt _02027094
	ldrb r0, [r6, r5]
	mov r1, #1
	cmp r0, #0
	ldreq r0, _02027144 ; =_022A7A6C
#ifdef JAPAN
	streqb r1, [r0]
	ldrne r0, _02027144 ; =_022A7A6C
	strneb r1, [r0, #4]
#else
	streqb r1, [r0, #4]
	ldrne r0, _02027144 ; =_022A7A6C
	strneb r1, [r0]
#endif
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02027134: .word _022A88E4
_02027138: .word _0209AC58
_0202713C: .word _022A7AA0
_02027140: .word _022A7A8C
_02027144: .word _022A7A6C
	arm_func_end sub_02027040

	arm_func_start sub_02027148
sub_02027148: ; 0x02027148
	ldr r0, _02027158 ; =_020AFD4C
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02027158: .word _020AFD4C
	arm_func_end sub_02027148

	arm_func_start sub_0202715C
sub_0202715C: ; 0x0202715C
	ldr r0, _0202716C ; =_020AFD4C
	mov r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0202716C: .word _020AFD4C
	arm_func_end sub_0202715C

	arm_func_start sub_02027170
sub_02027170: ; 0x02027170
	ldr r0, _0202717C ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r0, #3]
#else
	ldrb r0, [r0, #2]
#endif
	bx lr
	.align 2, 0
_0202717C: .word _022A7A6C
	arm_func_end sub_02027170

	arm_func_start sub_02027180
sub_02027180: ; 0x02027180
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r0, #0xc
	mul r2, r4, r0
	ldr r1, _0202721C ; =_020AFD58
	add r0, sp, #0
	ldr r1, [r1, r2]
	mov r2, #0x300
	bl LoadWteFromRom
	ldr r3, [sp, #4]
	ldr r0, _02027220 ; =_022A7A6C
	ldrh r1, [r3, #0xc]
	ldr r2, _02027224 ; =_022A7AB6
	add r3, r3, #0x10
	strh r1, [r0, #0x48]
	mov r1, #4
_020271C4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _020271C4
	ldr ip, _02027220 ; =_022A7A6C
	mov r1, #0x1f000
	mov r2, #0x1f
	str r1, [ip, #0x54]
	add r0, sp, #0
	mov r3, #0
	strh r2, [ip, #0x58]
	bl sub_0201E12C
	add r0, sp, #0
	bl sub_0201E13C
	mov r0, r4
	bl sub_02027228
	mov r0, r4
	bl sub_02027390
	ldr r0, _02027220 ; =_022A7A6C
#ifdef JAPAN
	strb r4, [r0, #3]
#else
	strb r4, [r0, #2]
#endif
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0202721C: .word _020AFD58
_02027220: .word _022A7A6C
_02027224: .word _022A7AB6
	arm_func_end sub_02027180

	arm_func_start sub_02027228
sub_02027228: ; 0x02027228
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r1, #0xc
	mul r2, r0, r1
	ldr r1, _0202726C ; =_020AFD5C
	add r0, sp, #0
	ldr r1, [r1, r2]
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r0, _02027270 ; =0x0620C000
	bl Memcpy32
	add r0, sp, #0
	bl UnloadFile
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202726C: .word _020AFD5C
_02027270: .word 0x0620C000
	arm_func_end sub_02027228

	arm_func_start sub_02027274
sub_02027274: ; 0x02027274
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r1, r0
	add r0, sp, #0xc
	mov r2, #1
	bl LoadFileFromRom
	ldr r7, [sp, #0xc]
	ldr r3, _0202736C ; =_0209AC50
	add r2, sp, #0
	mov r8, #0x80
	mov sb, #0
	mov r1, #4
_020272A4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020272A4
	ldr r6, _02027370 ; =_022A7AA0
	ldr r4, _02027374 ; =_022A7A8C
	add r5, sp, #8
_020272C0:
	add r3, sp, #0
	add r2, sp, #4
	mov r1, #4
_020272CC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020272CC
	ldrb r0, [r7]
	add r3, sp, #4
	add r2, sp, #8
	strb r0, [sp, #4]
	ldrb r0, [r7, #1]
	mov r1, #4
	strb r0, [sp, #5]
	ldrb r0, [r7, #2]
	strb r0, [sp, #6]
_02027300:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027300
	mov r0, r6
	mov r1, r8
	mov r2, r5
	add r7, r7, #4
	bl sub_0200A29C
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_0200A29C
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	add sb, sb, #1
	cmp sb, #0x80
	mov r8, r0, lsr #0x10
	blt _020272C0
	add r0, sp, #0xc
	bl UnloadFile
	ldr r0, _02027378 ; =_022A7A6C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
	strb r1, [r0, #4]
#else
	strb r1, [r0, #4]
	strb r1, [r0]
#endif
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202736C: .word _0209AC50
_02027370: .word _022A7AA0
_02027374: .word _022A7A8C
_02027378: .word _022A7A6C
	arm_func_end sub_02027274

	arm_func_start sub_0202737C
sub_0202737C: ; 0x0202737C
	ldr ip, _02027388 ; =sub_02027274
	ldr r0, _0202738C ; =_0209ADC8
	bx ip
	.align 2, 0
_02027388: .word sub_02027274
_0202738C: .word _0209ADC8
	arm_func_end sub_0202737C

	arm_func_start sub_02027390
sub_02027390: ; 0x02027390
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	ldr r1, _0202759C ; =_0209ADDC
	mov sl, r0
	add r0, sp, #0x10
	mov r2, #1
	bl LoadFileFromRom
	ldr r8, [sp, #0x10]
	ldr r3, _020275A0 ; =_0209AC54
	add r2, sp, #0
	mov sb, #0x10
	mov r7, #0
	mov r1, #4
_020273C4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020273C4
	ldr r6, _020275A4 ; =_022A7AA0
	ldr r4, _020275A8 ; =_022A7A8C
	add r5, sp, #0x18
_020273E0:
	add r3, sp, #0
	add r2, sp, #0xc
	mov r1, #4
_020273EC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020273EC
	ldrb r0, [r8]
	add r3, sp, #0xc
	add r2, sp, #0x18
	strb r0, [sp, #0xc]
	ldrb r0, [r8, #1]
	mov r1, #4
	strb r0, [sp, #0xd]
	ldrb r0, [r8, #2]
	strb r0, [sp, #0xe]
	ldrb r0, [r8, #3]
	strb r0, [sp, #0xf]
_02027428:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027428
	mov r0, r6
	mov r1, sb
	mov r2, r5
	add r8, r8, #4
	bl sub_0200A29C
	mov r0, r4
	mov r1, sb
	mov r2, r5
	bl sub_0200A29C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	add r7, r7, #1
	cmp r7, #0x20
	mov sb, r0, lsr #0x10
	blt _020273E0
	add r0, sp, #0x10
	bl UnloadFile
	ldr r0, _020275AC ; =_0209ADC8
	bl sub_02027274
	mov r0, #0xc
	mul r2, sl, r0
	ldr r1, _020275B0 ; =_020AFD60
	add r0, sp, #0x10
	ldr r1, [r1, r2]
	mov r2, #1
	bl LoadFileFromRom
	mov r5, #0
	ldr r6, [sp, #0x10]
	ldr r3, _020275B4 ; =_0209AC4C
	add r2, sp, #4
	mov r4, r5
	mov r1, #4
_020274B8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020274B8
_020274C8:
	mov r0, r4, lsl #0x18
	ldr sl, _020275B8 ; =_022A7A78
	mov r7, r0, lsr #0x10
	mov r8, #0
	add sb, sp, #0x18
_020274DC:
	add r3, sp, #4
	add r2, sp, #8
	mov r1, #4
_020274E8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020274E8
	mov r0, r5, lsl #1
	ldrsh r1, [r6, r0]
	add r3, sp, #8
	add r2, sp, #0x18
	mov r0, r1, lsl #0x1b
	and ip, r1, #0x3e0
	and r1, r1, #0x7c00
	mov r0, r0, lsr #0x18
	mov ip, ip, asr #2
	mov r1, r1, asr #7
	strb r1, [sp, #0xa]
	strb r0, [sp, #8]
	strb ip, [sp, #9]
	mov r1, #4
_02027530:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027530
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r0, sl
	mov r2, sb
	mov r7, r3, lsr #0x10
	bl sub_0200A29C
	add r8, r8, #1
	cmp r8, #0x10
	add r5, r5, #1
	blt _020274DC
	add r4, r4, #1
	cmp r4, #3
	blt _020274C8
	add r0, sp, #0x10
	bl UnloadFile
	ldr r0, _020275BC ; =_022A7A6C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
	strb r1, [r0, #4]
	strb r1, [r0, #2]
#else
	strb r1, [r0, #4]
	strb r1, [r0]
	strb r1, [r0, #1]
#endif
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202759C: .word _0209ADDC
_020275A0: .word _0209AC54
_020275A4: .word _022A7AA0
_020275A8: .word _022A7A8C
_020275AC: .word _0209ADC8
_020275B0: .word _020AFD60
_020275B4: .word _0209AC4C
_020275B8: .word _022A7A78
_020275BC: .word _022A7A6C
	arm_func_end sub_02027390

	arm_func_start sub_020275C0
sub_020275C0: ; 0x020275C0
	ldr r3, _020275D4 ; =_022A7AC8
	ldr r2, _020275D8 ; =_022A7AA0
	str r3, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_020275D4: .word _022A7AC8
_020275D8: .word _022A7AA0
	arm_func_end sub_020275C0

	arm_func_start sub_020275DC
sub_020275DC: ; 0x020275DC
	ldr r3, _020275F0 ; =_022A7B00
	ldr r2, _020275F4 ; =_022A7A8C
	str r3, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_020275F0: .word _022A7B00
_020275F4: .word _022A7A8C
	arm_func_end sub_020275DC

	arm_func_start GetWindow
GetWindow: ; 0x020275F8
	ldr r2, _02027608 ; =_022A88DC
	mov r1, #0xe0
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02027608: .word _022A88DC
	arm_func_end GetWindow

	arm_func_start sub_0202760C
sub_0202760C: ; 0x0202760C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027620 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
#ifdef JAPAN
_02027620: .word _022A88FC
#else
_02027620: .word _022A88F0
#endif
	arm_func_end sub_0202760C

#ifdef JAPAN
	arm_func_start sub_0202796C_JP
sub_0202796C_JP: ; 0x0202796C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027980 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02027980: .word _022A88F0
	arm_func_end sub_0202796C_JP
#endif

	arm_func_start sub_02027624
sub_02027624: ; 0x02027624
	ldr r2, _02027644 ; =_022A88DC
	mov r1, #0xe0
	mla r2, r0, r1, r2
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	smulbb r0, r1, r0
	mov r0, r0, lsl #5
	bx lr
	.align 2, 0
_02027644: .word _022A88DC
	arm_func_end sub_02027624

	arm_func_start NewWindowScreenCheck
NewWindowScreenCheck: ; 0x02027648
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr ip, _020276B8 ; =_022A88DC
	mov lr, r4
	mov r3, r4
_0202765C:
	ldrsb r2, [ip, #0xb6]
	cmp r2, #0
	beq _02027678
	ldrb r2, [ip, #8]
	cmp r2, #0
	addeq lr, lr, #1
	addne r4, r4, #1
_02027678:
	add r2, r3, #1
	mov r2, r2, lsl #0x18
	mov r3, r2, asr #0x18
	cmp r3, #0x14
	add ip, ip, #0xe0
	blt _0202765C
	cmp lr, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #8]
	cmp r4, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #0xa]
	bl NewWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_020276B8: .word _022A88DC
_020276BC: .word _022A7A6C
	arm_func_end NewWindowScreenCheck

	arm_func_start NewWindow
NewWindow: ; 0x020276C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02027898 ; =_022A88DC
	ldr r6, _0202789C ; =_022A7B1C
	mov r4, #0
	b _020276FC
_020276DC:
	ldrsb r0, [r5, #0xb6]
	cmp r0, #0
	beq _02027704
	add r0, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	add r5, r5, #0xe0
#ifdef JAPAN
	add r6, r6, #0x2c
#else
	add r6, r6, #0x30
#endif
_020276FC:
	cmp r4, #0x14
	blt _020276DC
_02027704:
	ldmia r8, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldrb r0, [r8, #6]
	mov r1, #8
	mov r0, r0, lsl #3
	sub r0, r0, #8
	str r0, [r5, #0x20]
	ldrb r0, [r5, #6]
	ldrb r2, [r5, #7]
	mov r0, r0, lsl #6
	mul r0, r2, r0
	bl MemAlloc
	str r0, [r5, #0x14]
	ldrb r0, [r5, #8]
	ldr lr, _020278A0 ; =_022A7A74
	ldrb r3, [r5, #6]
	mov r8, r0, lsl #1
	ldrh r0, [lr, r8]
	ldrb r2, [r5, #7]
	mvn r1, #8
	mla ip, r3, r2, r0
	strh r0, [r5, #0x12]
	ldrsb r2, [r5, #9]
	strh ip, [lr, r8]
	cmp r2, r1
	orreq r1, r0, #0x1000
	streqh r1, [r5, #0x30]
	strneh r0, [r5, #0x30]
	ldrb r1, [r5, #8]
	cmp r1, #0
	moveq r1, #0x6000000
	movne r1, #0x6200000
	add r0, r1, r0, lsl #6
	str r0, [r5, #0x18]
	str r0, [r5, #0x28]
	ldrb r3, [r5, #6]
	ldrb r2, [r5, #7]
	mov r1, #0
	mov r0, r4
	smulbb r2, r3, r2
	mov r2, r2, lsl #6
	str r2, [r5, #0x1c]
	strb r1, [r5, #0x11]
	bl sub_02027B1C
	strb r4, [r5, #0x10]
	mov r0, #1
	strb r0, [r5, #0xb6]
	strb r0, [r5, #0xb7]
	mov r0, r4
	strb r7, [r5, #0xb4]
	bl sub_020278C4
	mvn r1, #0
	add r0, r5, #0x34
	str r1, [r5, #0xb8]
	bl InitRender3dElement64
	mov r1, #2
	strb r1, [r5, #0x70]
	mov r0, #9
	strh r0, [r5, #0x5e]
	strb r1, [r5, #0x72]
	mov r0, #0x20
	strb r0, [r5, #0x60]
	strb r0, [r5, #0x61]
	strb r0, [r5, #0x62]
	mov r1, #0x90
	add r0, r5, #0x74
	strb r1, [r5, #0x63]
	bl InitRender3dElement64
	ldr r0, _020278A4 ; =_022A7A6C
	mov r1, #0
	ldrh r3, [r0, #0x48]
	mov r2, #0x18
	strh r3, [r5, #0x88]
	strh r1, [r5, #0x8a]
	strh r1, [r5, #0x8c]
	strh r2, [r5, #0x8e]
	strh r2, [r5, #0x90]
	ldr r2, [r0, #0x54]
	str r2, [r5, #0x94]
	ldrsh r0, [r0, #0x58]
	bl sub_020278A8
	str r0, [r5, #0x98]
	mov r0, #6
	strb r0, [r5, #0xb0]
	mov r0, #0xa
	strh r0, [r5, #0x9e]
	mov r1, #0
	strh r1, [r5, #0x74]
	strh r1, [r5, #0x76]
	strh r1, [r5, #0x78]
	add r0, r5, #0xbc
	strh r1, [r5, #0x7a]
	bl InitWindowTrailer
	mov r0, #0
	strb r0, [r6]
	add r0, r6, #4
	bl sub_02029A50
	ldrb r1, [r5, #8]
	mov r0, r4
	strb r1, [r6, #0x2a]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027898: .word _022A88DC
_0202789C: .word _022A7B1C
_020278A0: .word _022A7A74
_020278A4: .word _022A7A6C
	arm_func_end NewWindow

	arm_func_start sub_020278A8
sub_020278A8: ; 0x020278A8
	ldr r2, _020278C0 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_020278C0: .word _020AFC70
	arm_func_end sub_020278A8

	arm_func_start sub_020278C4
sub_020278C4: ; 0x020278C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0xe0
	mul r2, r0, r1
	ldr ip, _02027964 ; =_022A7A6C
	ldr r4, _02027968 ; =_022A8990
#ifdef JAPAN
	ldrsb r3, [ip, #1]
#else
	ldrsb r3, [ip, #3]
#endif
	mvn r1, #1
	ldrsb r8, [r4, r2]
	cmp r3, r1
	ldreq r1, _0202796C ; =_022A8991
	mov r7, r3
#ifdef JAPAN
	streqb r0, [ip, #1]
#else
	streqb r0, [ip, #3]
#endif
	streqb r3, [r1, r2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, r1
	ldr r5, _02027970 ; =_022A88DC
	mov lr, #0xe0
	b _02027924
_0202790C:
	mla r6, r7, lr, r5
	ldrsb r4, [r6, #0xb4]
	cmp r4, r8
	blt _0202792C
	mov r1, r7
	ldrsb r7, [r6, #0xb5]
_02027924:
	cmp r7, ip
	bne _0202790C
_0202792C:
	mvn ip, #1
	cmp r1, ip
	ldreq ip, _0202796C ; =_022A8991
	ldreq r1, _02027964 ; =_022A7A6C
	streqb r3, [ip, r2]
#ifdef JAPAN
	streqb r0, [r1, #1]
#else
	streqb r0, [r1, #3]
#endif
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r3, #0xe0
	mul r3, r1, r3
	ldr ip, _0202796C ; =_022A8991
	ldrsb r1, [ip, r3]
	strb r0, [ip, r3]
	strb r1, [ip, r2]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027964: .word _022A7A6C
_02027968: .word _022A8990
_0202796C: .word _022A8991
_02027970: .word _022A88DC
	arm_func_end sub_020278C4

	arm_func_start sub_02027974
sub_02027974: ; 0x02027974
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020279FC ; =_022A7A6C
	mvn r5, #1
#ifdef JAPAN
	ldrsb r4, [r1, #1]
#else
	ldrsb r4, [r1, #3]
#endif
	mov r1, r5
	ldr ip, _02027A00 ; =_022A88DC
	mov r2, #0xe0
	b _020279AC
_02027994:
	mla lr, r4, r2, ip
	ldrsb r3, [lr, #0x10]
	cmp r0, r3
	beq _020279B4
	mov r5, r4
	ldrsb r4, [lr, #0xb5]
_020279AC:
	cmp r4, r1
	bne _02027994
_020279B4:
	mvn ip, #1
	cmp r5, ip
	bne _020279DC
	mov r1, #0xe0
	mul r2, r0, r1
	ldr r3, _02027A04 ; =_022A8991
	ldr r0, _020279FC ; =_022A7A6C
	ldrsb r1, [r3, r2]
#ifdef JAPAN
	strb r1, [r0, #1]
#else
	strb r1, [r0, #3]
#endif
	b _020279F4
_020279DC:
	mov r0, #0xe0
	mul r2, r4, r0
	ldr r3, _02027A04 ; =_022A8991
	mul r0, r5, r0
	ldrsb r1, [r3, r2]
	strb r1, [r3, r0]
_020279F4:
	strb ip, [r3, r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020279FC: .word _022A7A6C
_02027A00: .word _022A88DC
_02027A04: .word _022A8991
	arm_func_end sub_02027974

	arm_func_start sub_02027A08
sub_02027A08: ; 0x02027A08
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_02027974
	mov r0, #0xe0
	mul r4, r6, r0
	ldr r1, _02027A5C ; =_022A8990
	mov r0, r6
	strb r5, [r1, r4]
	bl sub_020278C4
	ldr r1, _02027A60 ; =_022A88E4
	ldr r0, _02027A64 ; =_020AFD4C
	ldrb r3, [r1, r4]
	ldr r2, [r0, #8]
	mov r1, #1
	orr r1, r2, r1, lsl r3
	str r1, [r0, #8]
	cmp r3, #1
	ldmneia sp!, {r4, r5, r6, pc}
	bl sub_02027B88
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02027A5C: .word _022A8990
_02027A60: .word _022A88E4
_02027A64: .word _020AFD4C
	arm_func_end sub_02027A08

	arm_func_start SetScreenWindowsColor
SetScreenWindowsColor: ; 0x02027A68
	ldr r2, _02027A7C ; =_020AFD98
	cmp r1, #2
	moveq r1, #1
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_02027A7C: .word _020AFD98
	arm_func_end SetScreenWindowsColor

	arm_func_start SetBothScreensWindowsColor
SetBothScreensWindowsColor: ; 0x02027A80
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	bl SetScreenWindowsColor
	mov r0, r4
	mov r1, #1
	bl SetScreenWindowsColor
	ldmia sp!, {r4, pc}
	arm_func_end SetBothScreensWindowsColor

	arm_func_start sub_02027AA0
sub_02027AA0: ; 0x02027AA0
	cmp r0, #1
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0, #3]
#else
	streqb r1, [r0]
#endif
	bxeq lr
	cmp r0, #2
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0]
#else
	streqb r1, [r0, #3]
#endif
	bxeq lr
	ldr r0, _02027AE8 ; =_020AFD9C
	ldr r1, _02027AEC ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #1
	eor r0, r0, #1
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_02027AE4: .word _020AFD4C
_02027AE8: .word _020AFD9C
_02027AEC: .word _020AFD94
	arm_func_end sub_02027AA0

	arm_func_start UpdateWindow
UpdateWindow: ; 0x02027AF0
	ldr r2, _02027B18 ; =_022A88DC
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x28]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_02027B18: .word _022A88DC
	arm_func_end UpdateWindow

	arm_func_start sub_02027B1C
sub_02027B1C: ; 0x02027B1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xe0
	mul r2, r4, r0
	ldr r0, _02027B50 ; =_022A88F0
	ldr r1, _02027B54 ; =_022A88F8
	ldr r0, [r0, r2]
	ldr r2, [r1, r2]
	mov r1, #0
	bl memset
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_02027B50: .word _022A88F0
_02027B54: .word _022A88F8
	arm_func_end sub_02027B1C

	arm_func_start ClearWindow
ClearWindow: ; 0x02027B58
	mov r1, #0xe0
	mul r2, r0, r1
	ldr r0, _02027B7C ; =_022A88F0
	ldr r1, _02027B80 ; =_022A88F8
	ldr r0, [r0, r2]
	ldr r2, [r1, r2]
	ldr ip, _02027B84 ; =memset
	mov r1, #0
	bx ip
	.align 2, 0
_02027B7C: .word _022A88F0
_02027B80: .word _022A88F8
_02027B84: .word memset
	arm_func_end ClearWindow

	arm_func_start sub_02027B88
sub_02027B88: ; 0x02027B88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _02027E14 ; =_022A7A6C
#ifdef JAPAN
	ldrsb r2, [r0, #1]
#else
	ldrsb r2, [r0, #3]
#endif
	b _02027E00
_02027B9C:
	ldr r1, _02027E18 ; =_022A88DC
	mov r0, #0xe0
	mla r4, r2, r0, r1
	ldrb r0, [r4, #8]
	cmp r0, #1
	ldreqsb r0, [r4, #0xb6]
	cmpeq r0, #2
	bne _02027DFC
	ldrsb r1, [r4, #9]
	ldr r0, _02027E1C ; =_0209AC64
	rsb r1, r1, #0
	mov r1, r1, lsl #1
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _02027DF0
	ldr r0, _02027E20 ; =_020AFD98
	ldrb r1, [r4, #4]
	ldrb r3, [r0, #1]
	ldr r2, _02027E24 ; =_0209ACAC
	sub r6, r1, #1
	ldrb r2, [r2, r3]
	ldrb r0, [r4, #5]
	add r1, sp, #0
	mov r5, r2, lsl #0xc
	sub r3, r0, #1
	orr r0, r5, #2
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	str r6, [sp]
	mov r2, r2, lsr #0x10
	str r3, [sp, #4]
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #3
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027C5C
_02027C40:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027C5C:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027C40
	orr r0, r5, #4
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	orr r1, r5, #5
	add r0, r0, #1
	str r0, [sp, #4]
	orr r0, r5, #1
	orr r2, r5, #6
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r8, r1, lsr #0x10
	mov r6, r2, lsr #0x10
	ldr sl, _02027E28 ; =_022A7AE4
	add sb, sp, #0
	b _02027D44
_02027CC8:
	ldrb r2, [r4, #4]
	mov r0, sl
	mov r1, sb
	sub r3, r2, #1
	mov r2, r8
	str r3, [sp]
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _02027D10
_02027CF4:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027D10:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CF4
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027D44:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CC8
	ldrb r1, [r4, #4]
	orr r0, r5, #7
	mov r2, r0, lsl #0x10
	sub r3, r1, #1
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	str r3, [sp]
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #8
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027DC0
_02027DA4:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027DC0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027DA4
	orr r0, r5, #9
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
_02027DF0:
	ldr r0, _02027E2C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
_02027DFC:
	ldrsb r2, [r4, #0xb5]
_02027E00:
	mvn r0, #1
	cmp r2, r0
	bne _02027B9C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02027E14: .word _022A7A6C
_02027E18: .word _022A88DC
_02027E1C: .word _0209AC64
_02027E20: .word _020AFD98
_02027E24: .word _0209ACAC
_02027E28: .word _022A7AE4
_02027E2C: .word _020AFD4C
	arm_func_end sub_02027B88

	arm_func_start sub_02027E30
sub_02027E30: ; 0x02027E30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02028070 ; =_022A88DC
	mov r2, #0xe0
	mla r7, r0, r2, r3
	ldrsb r0, [r7, #9]
	ldr r2, _02028074 ; =_0209AC64
	cmp r1, #0
	rsb r0, r0, #0
	add r4, r2, r0, lsl #1
	movne r0, #2
	moveq r0, #3
	strb r0, [r7, #0xb6]
	ldrb r0, [r7, #8]
	cmp r0, #1
	bne _02027F34
	cmp r1, #0
	bne _02027F20
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =_022A88DC
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	ldrsb r0, [r4]
	cmp r0, #0
	blt _02027F20
	ldrb r0, [r7, #5]
	ldr r6, _02028078 ; =_022A7AE4
	add r5, sp, #0
	sub r0, r0, #1
	str r0, [sp, #4]
	mov r4, #0
	b _02027F08
_02027EB8:
	ldrb r0, [r7, #4]
	sub r0, r0, #1
	str r0, [sp]
	b _02027EE4
_02027EC8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027EE4:
	ldrb r1, [r7, #4]
	ldrb r0, [r7, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EC8
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027F08:
	ldrb r1, [r7, #5]
	ldrb r0, [r7, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EB8
_02027F20:
	bl sub_02027B88
	ldr r0, _0202807C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028064
_02027F34:
	cmp r1, #0
	beq _0202801C
	ldrb r1, [r7, #4]
	mvn r0, #3
	mov r1, r1, lsl #3
	strh r1, [r7, #0x34]
	ldrb r1, [r7, #5]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x36]
	ldrb r1, [r7, #6]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x38]
	ldrb r1, [r7, #7]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x3a]
	ldrh r1, [r7, #0x34]
	strh r1, [r7, #0x74]
	ldrh r1, [r7, #0x36]
	strh r1, [r7, #0x76]
	ldrh r1, [r7, #0x38]
	strh r1, [r7, #0x78]
	ldrh r1, [r7, #0x3a]
	strh r1, [r7, #0x7a]
	ldrsh r1, [r7, #0x74]
	sub r1, r1, #8
	strh r1, [r7, #0x74]
	ldrsh r1, [r7, #0x76]
	sub r1, r1, #8
	strh r1, [r7, #0x76]
	ldrsh r1, [r7, #0x78]
	add r1, r1, #0x10
	strh r1, [r7, #0x78]
	ldrsh r1, [r7, #0x7a]
	add r1, r1, #0x10
	strh r1, [r7, #0x7a]
	ldrsb r1, [r7, #9]
	cmp r1, r0
	beq _02027FFC
	ldrsh r0, [r7, #0x34]
	sub r0, r0, #1
	strh r0, [r7, #0x34]
	ldrsh r0, [r7, #0x36]
	sub r0, r0, #2
	strh r0, [r7, #0x36]
	ldrsh r0, [r7, #0x38]
	add r0, r0, #2
	strh r0, [r7, #0x38]
	ldrsh r0, [r7, #0x3a]
	add r0, r0, #6
	strh r0, [r7, #0x3a]
_02027FFC:
	ldr r0, _0202807C ; =_020AFD4C
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r0, #0x90
	strneb r0, [r7, #0x63]
	moveq r0, #0xff
	streqb r0, [r7, #0x63]
	b _02028064
_0202801C:
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =_022A88DC
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	mov r0, #0
	strh r0, [r7, #0x3a]
	strh r0, [r7, #0x38]
	strh r0, [r7, #0x36]
	strh r0, [r7, #0x34]
	strh r0, [r7, #0x74]
	ldrh r0, [r7, #0x36]
	strh r0, [r7, #0x76]
	ldrh r0, [r7, #0x38]
	strh r0, [r7, #0x78]
	ldrh r0, [r7, #0x3a]
	strh r0, [r7, #0x7a]
_02028064:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028070: .word _022A88DC
_02028074: .word _0209AC64
_02028078: .word _022A7AE4
_0202807C: .word _020AFD4C
	arm_func_end sub_02027E30

	arm_func_start sub_02028080
sub_02028080: ; 0x02028080
	stmdb sp!, {r4, lr}
	ldr r3, _020280B8 ; =_022A88DC
	mov r2, #0xe0
	mla r4, r0, r2, r3
	strb r1, [r4, #9]
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	ldr r0, _020280BC ; =_020AFD4C
	ldrb r1, [r4, #8]
	ldr r3, [r0, #8]
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020280B8: .word _022A88DC
_020280BC: .word _020AFD4C
	arm_func_end sub_02028080

	arm_func_start sub_020280C0
sub_020280C0: ; 0x020280C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #1
	mov r5, r0
	bl sub_02027E30
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0xe0
	mul r3, r5, r1
	ldr r2, _02028104 ; =_022A88E4
	ldr r1, _02028108 ; =_020AFD4C
	ldrb r2, [r2, r3]
	ldr ip, [r1, #8]
	mov r3, #1
	orr r2, ip, r3, lsl r2
	str r2, [r1, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028104: .word _022A88E4
_02028108: .word _020AFD4C
	arm_func_end sub_020280C0

	arm_func_start sub_0202810C
sub_0202810C: ; 0x0202810C
	ldr ip, _02028118 ; =sub_020280C0
	mov r1, #1
	bx ip
	.align 2, 0
_02028118: .word sub_020280C0
	arm_func_end sub_0202810C

	arm_func_start sub_0202811C
sub_0202811C: ; 0x0202811C
	ldr ip, _02028128 ; =sub_02027E30
	mov r1, #1
	bx ip
	.align 2, 0
_02028128: .word sub_02027E30
	arm_func_end sub_0202811C

	arm_func_start sub_0202812C
sub_0202812C: ; 0x0202812C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r1, #0xe0
	mul r5, r6, r1
	ldr r1, _02028188 ; =_022A8992
	ldrsb r1, [r1, r5]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, #0
	bl sub_02027E30
	mov r4, r0
	mov r0, r6
	bl sub_0202836C
	ldr r0, _0202818C ; =_022A88E4
	ldr r1, _02028190 ; =_020AFD4C
	ldrb r0, [r0, r5]
	ldr r3, [r1, #8]
	mov r2, #1
	orr r2, r3, r2, lsl r0
	mov r0, r4
	str r2, [r1, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02028188: .word _022A8992
_0202818C: .word _022A88E4
_02028190: .word _020AFD4C
	arm_func_end sub_0202812C

	arm_func_start DeleteWindow
DeleteWindow: ; 0x02028194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02028224 ; =_022A88DC
	mov r1, #0xe0
	mla r4, r0, r1, r2
	bl sub_0202812C
	ldrb r5, [r4, #8]
	ldr lr, _02028224 ; =_022A88DC
	mov ip, #1
	mov r3, #0
_020281B8:
	cmp lr, r4
	ldrnesb r0, [lr, #0xb6]
	cmpne r0, #0
	beq _020281EC
	ldrb r0, [lr, #8]
	cmp r5, r0
	bne _020281EC
	ldrh r2, [lr, #0x12]
	ldrb r1, [lr, #6]
	ldrb r0, [lr, #7]
	mla r0, r1, r0, r2
	cmp ip, r0
	movlt ip, r0
_020281EC:
	add r3, r3, #1
	cmp r3, #0x14
	add lr, lr, #0xe0
	blt _020281B8
	ldr r0, [r4, #0x14]
	ldr r1, _02028228 ; =_022A7A74
	mov r2, r5, lsl #1
	strh ip, [r1, r2]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028224: .word _022A88DC
_02028228: .word _022A7A74
	arm_func_end DeleteWindow

	arm_func_start sub_0202822C
sub_0202822C: ; 0x0202822C
	stmdb sp!, {r4, lr}
	ldr r2, _02028258 ; =_022A88DC
	mov r1, #0xe0
	mla r4, r0, r1, r2
	ldr r0, [r4, #0x14]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028258: .word _022A88DC
	arm_func_end sub_0202822C

	arm_func_start sub_0202825C
sub_0202825C: ; 0x0202825C
	ldr r2, _0202826C ; =_022A7A74
	mov r0, r0, lsl #1
	strh r1, [r2, r0]
	bx lr
	.align 2, 0
_0202826C: .word _022A7A74
	arm_func_end sub_0202825C

	arm_func_start sub_02028270
sub_02028270: ; 0x02028270
	ldr r1, _02028280 ; =_022A7A74
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	bx lr
	.align 2, 0
_02028280: .word _022A7A74
	arm_func_end sub_02028270

	arm_func_start GetWindowRectangle
GetWindowRectangle: ; 0x02028284
	ldr r3, _020282C4 ; =_022A88DC
	mov r2, #0xe0
	mla r3, r0, r2, r3
	ldrb r0, [r3, #5]
	mov r2, r0, lsl #3
	str r2, [r1]
	ldrb r0, [r3, #7]
	add r0, r2, r0, lsl #3
	str r0, [r1, #4]
	ldrb r0, [r3, #4]
	mov r2, r0, lsl #3
	str r2, [r1, #8]
	ldrb r0, [r3, #6]
	add r0, r2, r0, lsl #3
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020282C4: .word _022A88DC
	arm_func_end GetWindowRectangle

	arm_func_start sub_020282C8
sub_020282C8: ; 0x020282C8
	ldr r3, _020282F0 ; =_022A88DC
	mov r2, #0xe0
	mla r2, r0, r2, r3
	ldrb r0, [r2, #7]
	mov r0, r0, lsl #3
	str r0, [r1, #4]
	ldrb r0, [r2, #6]
	mov r0, r0, lsl #3
	str r0, [r1]
	bx lr
	.align 2, 0
_020282F0: .word _022A88DC
	arm_func_end sub_020282C8

	arm_func_start sub_020282F4
sub_020282F4: ; 0x020282F4
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028308 ; =_022A8994
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02028308: .word _022A8994
	arm_func_end sub_020282F4

	arm_func_start sub_0202830C
sub_0202830C: ; 0x0202830C
	mov r2, #0xe0
	mul r2, r0, r2
	ldr r0, _02028320 ; =_022A8994
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_02028320: .word _022A8994
	arm_func_end sub_0202830C

	arm_func_start sub_02028324
sub_02028324: ; 0x02028324
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028338 ; =_022A88E4
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028338: .word _022A88E4
	arm_func_end sub_02028324

	arm_func_start GetWindowContents
GetWindowContents: ; 0x0202833C
	ldr r2, _02028350 ; =_022A88DC
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02028350: .word _022A88DC
	arm_func_end GetWindowContents

	arm_func_start sub_02028354
sub_02028354: ; 0x02028354
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028368 ; =_022A8992
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028368: .word _022A8992
	arm_func_end sub_02028354

	arm_func_start sub_0202836C
sub_0202836C: ; 0x0202836C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _02028438 ; =_022A88DC
	mov r1, #0xe0
	mla r6, r0, r1, r2
	ldrb r0, [r6, #8]
	cmp r0, #0
	bne _020283A4
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	bl sub_02029154
	b _02028428
_020283A4:
	ldrb r0, [r6, #8]
	bl sub_0202843C
	ldrb r1, [r6, #5]
	mov r7, r0
	add r5, sp, #0
	str r1, [sp, #4]
	mov r4, #0
	b _02028410
_020283C4:
	ldrb r0, [r6, #4]
	str r0, [sp]
	b _020283EC
_020283D0:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020283EC:
	ldrb r1, [r6, #4]
	ldrb r0, [r6, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020283D0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02028410:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _020283C4
_02028428:
	ldrb r0, [r6, #8]
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028438: .word _022A88DC
	arm_func_end sub_0202836C

	arm_func_start sub_0202843C
sub_0202843C: ; 0x0202843C
	cmp r0, #1
	ldreq r0, _02028458 ; =_022A7B00
	bxeq lr
	cmp r0, #2
	ldreq r0, _0202845C ; =_022A7AE4
	ldrne r0, _02028460 ; =_022A7AC8
	bx lr
	.align 2, 0
_02028458: .word _022A7B00
_0202845C: .word _022A7AE4
_02028460: .word _022A7AC8
	arm_func_end sub_0202843C

	arm_func_start sub_02028464
sub_02028464: ; 0x02028464
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	ldr r3, _02028768 ; =_022A88DC
	mov r2, #0xe0
	mla r4, r0, r2, r3
	ldrsb r0, [r4, #9]
	ldrb r5, [r4, #8]
	ldr r7, _0202876C ; =_0209AC64
	rsb r2, r0, #0
	mov r0, r5
	mov r6, r2, lsl #1
	mov r8, r1
	bl sub_0202843C
	ldrsb r1, [r7, r6]
	mov r6, r0
	cmp r1, #0
	movlt r8, #0
	cmp r5, #0
	bne _020284D8
	ldrh r0, [r4, #0x30]
	str r0, [sp]
	ldrb r0, [r4, #0x11]
	stmib sp, {r0, r8}
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	bl sub_020291FC
	b _02028758
_020284D8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _0202857C
	ldrh r0, [r4, #0x30]
	ldrb r1, [r4, #5]
	add r7, sp, #0xc
	orr r0, r0, #0x400
	mov r0, r0, lsl #0x10
	str r1, [sp, #0x10]
	mov sb, r0, lsr #0x10
	b _02028560
_02028504:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028544
_0202851C:
	add r0, sb, #1
	mov r2, sb
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, r7
	mov sb, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0xc]
_02028544:
	ldrb r0, [r4, #4]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bge _0202851C
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02028560:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	ldr r2, [sp, #0x10]
	add r1, r0, r1
	cmp r2, r1
	blt _02028504
	b _02028600
_0202857C:
	ldrh r7, [r4, #0x30]
	ldrb sl, [r4, #5]
	add sb, sp, #0xc
	b _020285EC
_0202858C:
	mov r1, sl, lsr #0x1f
	ldrb r2, [r4, #4]
	rsb r0, r1, sl, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #0x10]
	str r2, [sp, #0xc]
	b _020285D0
_020285A8:
	add r0, r7, #1
	mov r2, r7
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, sb
	mov r7, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_020285D0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	blt _020285A8
	add sl, sl, #1
_020285EC:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	add r1, r0, r1
	cmp sl, r1
	blt _0202858C
_02028600:
	cmp r8, #0
	beq _02028758
	subs r0, r0, #1
	str r0, [sp, #0x10]
	bmi _02028670
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028658
_0202862C:
	cmp r2, #0
	blt _0202864C
	cmp r2, #0x20
	bge _0202864C
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_0202864C:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028658:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _0202862C
_02028670:
	ldrb r0, [r4, #5]
	mov r8, #0
	add sb, sp, #0xc
	str r0, [sp, #0x10]
	mov r7, r8
	b _020286DC
_02028688:
	ldrb r0, [r4, #4]
	subs r0, r0, #1
	str r0, [sp, #0xc]
	bmi _020286A8
	mov r0, r6
	mov r1, sb
	mov r2, r8
	bl sub_0200B3FC
_020286A8:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	str r0, [sp, #0xc]
	cmp r0, #0x20
	bge _020286D0
	mov r0, r6
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
_020286D0:
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_020286DC:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	cmp r2, r0
	blt _02028688
	cmp r2, #0x18
	bge _02028758
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028740
_02028714:
	cmp r2, #0
	blt _02028734
	cmp r2, #0x20
	bge _02028734
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_02028734:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028740:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _02028714
_02028758:
	mov r0, r5
	bl sub_02027AA0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028768: .word _022A88DC
_0202876C: .word _0209AC64
	arm_func_end sub_02028464

	arm_func_start sub_02028770
sub_02028770: ; 0x02028770
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020287C0 ; =_022A88DC
	mov r5, r0
	mov r1, #0xe0
	mla r4, r5, r1, r2
	bl sub_0202836C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	strb r0, [r4, #4]
	mov r0, r5
	mov r1, #1
	strb r2, [r4, #5]
	bl sub_02027E30
	mov r0, r5
	mov r1, #1
	bl sub_02028464
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020287C0: .word _022A88DC
	arm_func_end sub_02028770

	arm_func_start sub_020287C4
sub_020287C4: ; 0x020287C4
	ldr r1, _020287DC ; =_020AFD4C
	mov r2, #1
	ldr r3, [r1, #8]
	orr r0, r3, r2, lsl r0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020287DC: .word _020AFD4C
	arm_func_end sub_020287C4

	arm_func_start sub_020287E0
sub_020287E0: ; 0x020287E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02028840 ; =_022A7A6C
	mov r6, r0
#ifdef JAPAN
	ldrsb r0, [r1, #1]
#else
	ldrsb r0, [r1, #3]
#endif
	mov r1, #0
	mov sb, #1
	ldr r4, _02028844 ; =_022A88DC
	mov r8, #0xe0
	mvn r7, #1
	b _0202882C
_02028808:
	mla r5, r0, r8, r4
	ldrsb r2, [r5, #0xb6]
	cmp r2, #2
	ldreqb r2, [r5, #8]
	cmpeq r6, r2
	bne _02028828
	bl sub_02028464
	mov r1, sb
_02028828:
	ldrsb r0, [r5, #0xb5]
_0202882C:
	cmp r0, r7
	bne _02028808
	mov r0, r6
	bl sub_02027AA0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02028840: .word _022A7A6C
_02028844: .word _022A88DC
	arm_func_end sub_020287E0

	arm_func_start sub_02028848
sub_02028848: ; 0x02028848
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020288D0 ; =_022A7A6C
	ldr r6, _020288D4 ; =_022A88DC
#ifdef JAPAN
	ldrsb r0, [r0, #1]
#else
	ldrsb r0, [r0, #3]
#endif
	mov r5, #0xe0
	mvn r4, #1
	b _02028888
_02028864:
	mla r7, r0, r5, r6
	ldrsb r0, [r7, #0xb6]
	cmp r0, #0
	ldrne r1, [r7]
	cmpne r1, #0
	beq _02028884
	mov r0, r7
	blx r1
_02028884:
	ldrsb r0, [r7, #0xb5]
_02028888:
	cmp r0, r4
	bne _02028864
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #1
	beq _020288A8
	mov r0, #0
	bl sub_020287E0
_020288A8:
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #2
	beq _020288C0
	mov r0, #1
	bl sub_020287E0
_020288C0:
	ldr r0, _020288D8 ; =_020AFD4C
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020288D0: .word _022A7A6C
_020288D4: .word _022A88DC
_020288D8: .word _020AFD4C
	arm_func_end sub_02028848

	arm_func_start sub_020288DC
sub_020288DC: ; 0x020288DC
	ldr r2, _020288F4 ; =_022A88DC
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr ip, _020288F8 ; =InitWindowTrailer
	add r0, r1, #0xbc
	bx ip
	.align 2, 0
_020288F4: .word _022A88DC
_020288F8: .word InitWindowTrailer
	arm_func_end sub_020288DC

	arm_func_start sub_020288FC
sub_020288FC: ; 0x020288FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028944 ; =_022A88DC
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq ip, #1
	stmia sp, {r2, r3}
	movne ip, #0
	mov r2, r1
	add r0, r4, #0xbc
	and r3, ip, #0xff
	mov r1, #0
	bl sub_02029688
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028944: .word _022A88DC
	arm_func_end sub_020288FC

	arm_func_start sub_02028948
sub_02028948: ; 0x02028948
	stmdb sp!, {r3, lr}
	ldr r3, _0202897C ; =_022A88DC
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029758
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202897C: .word _022A88DC
	arm_func_end sub_02028948

	arm_func_start sub_02028980
sub_02028980: ; 0x02028980
	stmdb sp!, {r3, lr}
	ldr r3, _020289B4 ; =_022A88DC
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029828
	ldmia sp!, {r3, pc}
	.align 2, 0
_020289B4: .word _022A88DC
	arm_func_end sub_02028980

	arm_func_start sub_020289B8
sub_020289B8: ; 0x020289B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028A04 ; =_022A88DC
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq lr, #1
	str r3, [sp]
	ldr ip, [sp, #0x10]
	movne lr, #0
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #4]
	bl sub_020298F8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A04: .word _022A88DC
	arm_func_end sub_020289B8

	arm_func_start sub_02028A08
sub_02028A08: ; 0x02028A08
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr lr, _02028A60 ; =_022A88DC
	mov ip, #0xe0
	mla r4, r0, ip, lr
	sub r0, ip, #0xe1
	ldr lr, [r4, #0xb8]
	ldr ip, [sp, #0x18]
	cmp lr, r0
	stmia sp, {r3, ip}
	moveq lr, #1
	ldr r0, [sp, #0x1c]
	movne lr, #0
	str r0, [sp, #8]
	ldr ip, [sp, #0x20]
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #0xc]
	bl sub_02029998
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A60: .word _022A88DC
	arm_func_end sub_02028A08

	arm_func_start sub_02028A64
sub_02028A64: ; 0x02028A64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02028DE8 ; =_020AFD4C
	movs r4, r0
#ifdef JAPAN
	strb r4, [r1, #2]
#else
	strb r4, [r1, #4]
#endif
	mov r5, #8
	beq _02028D58
	ldr r0, _02028DEC ; =_022A7A6C
	mov r1, #0
#ifdef JAPAN
	ldrsb r3, [r0, #1]
#else
	ldrsb r3, [r0, #3]
	strb r3, [r0, #5]
#endif
	strh r1, [r0, #6]
	b _02028BF4
_02028A94:
	ldr r1, _02028DF0 ; =_022A88DC
	mov r0, #0xe0
	mla r6, r3, r0, r1
	ldrsb r1, [r6, #0xb6]
	ldr r2, _02028DF4 ; =_022A7B1C
#ifdef JAPAN
	mov r0, #0x2c
#else
	mov r0, #0x30
#endif
	mla r7, r3, r0, r2
	cmp r1, #0
#ifdef JAPAN
	mov r0, #0
	beq _02028BDC
#else
	beq _02028BDC
	mov r0, #0
#endif
	strb r0, [r6, #0xb7]
	ldrb r0, [r6, #8]
	mov r1, #1
	strb r1, [r7]
	cmp r0, #0
	bne _02028BC4
	ldr r0, _02028DF8 ; =_020AFD98
	ldrsb r3, [r6, #9]
	ldrb r2, [r0]
	ldr r0, _02028DEC ; =_022A7A6C
	ldr r1, _02028DFC ; =_0209ACA8
	ldrsh r0, [r0, #0x58]
	rsb r3, r3, #0
	ldrb r1, [r1, r2]
	ldr r2, _02028E00 ; =_0209AC64
	mov r3, r3, lsl #1
	ldrsb r8, [r2, r3]
	bl sub_020278A8
	mov r1, r5, lsl #1
	str r0, [r6, #0x98]
	add r0, r1, #9
	strh r0, [r6, #0x9e]
	add r0, r1, #0xa
	strh r0, [r6, #0x5e]
	cmp r8, #0
	sub r5, r5, #1
	blt _02028BC4
	ldrsh r0, [r6, #0x38]
	cmp r0, #0
	beq _02028BC4
	ldr r0, _02028E04 ; =_0209AC78
	mov r1, r8, lsl #3
	add r3, r0, r8, lsl #3
	ldrsh r1, [r0, r1]
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r2, [r3, #2]
	strh r1, [r6, #0x8a]
	ldrsh r8, [r0, #6]
	ldrsh r1, [r3, #4]
	strh r2, [r6, #0x8c]
	ldrsh r0, [r3, #6]
	strh r1, [r6, #0x8e]
	cmp r8, #0x14
	strh r0, [r6, #0x90]
	bge _02028BC4
	ldr r0, _02028E08 ; =_022A7EDC
	add ip, r6, #0x34
	add sl, r0, r8, lsl #7
	mov sb, #4
_02028B80:
	ldmia ip!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _02028B80
	ldr r0, _02028E08 ; =_022A7EDC
	add sl, r6, #0x74
	add r0, r0, r8, lsl #7
	add sb, r0, #0x40
	mov r8, #4
_02028BA4:
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02028BA4
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r1, [r0, #6]
	add r1, r1, #1
	strh r1, [r0, #6]
_02028BC4:
	add r0, r7, #4
	add r1, r6, #0xbc
	bl sub_02029A68
	add r0, r7, #4
	bl sub_02029B0C
	b _02028BEC
_02028BDC:
#ifdef JAPAN
	strb r0, [r7]
#else
	mov r1, #0
	add r0, r7, #4
	strb r1, [r7]
	bl sub_02029A50
#endif
_02028BEC:
	ldrsb r3, [r6, #0xb5]
#ifndef JAPAN
	strb r3, [r7, #0x2c]
#endif
_02028BF4:
	mvn r0, #1
	cmp r3, r0
	bne _02028A94
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1]
#else
	ldrb r0, [r1, #4]
#endif
	cmp r0, #0
	beq _02028C20
	ldr r0, _02028E0C ; =_022A7AA0
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1]
#else
	strb r2, [r1, #4]
#endif
	bl sub_0200A174
_02028C20:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #4]
#else
	ldrb r0, [r1]
#endif
	cmp r0, #0
	beq _02028C40
	ldr r0, _02028E10 ; =_022A7A8C
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #4]
#else
	strb r2, [r1]
#endif
	bl sub_0200A174
_02028C40:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #2]
#else
	ldrb r0, [r1, #1]
#endif
	cmp r0, #0
	beq _02028C60
	ldr r0, _02028E14 ; =_022A7A78
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #2]
#else
	strb r2, [r1, #1]
#endif
	bl sub_0200A174
_02028C60:
	mov r8, #0
	ldr r7, _02028DF0 ; =_022A88DC
	mov r6, r8
	mov r5, #0xe0
_02028C70:
	mla sl, r8, r5, r7
	ldrsb r0, [sl, #0xb6]
	cmp r0, #0
	ldrne sb, [sl, #0x2c]
	cmpne sb, #0
	beq _02028CB8
	ldr r0, [sl, #0x28]
	ldr r1, [sl, #0x24]
	mov r2, sb
	bl Memcpy32
	ldr r0, [sl, #0x24]
	bic r1, sb, #3
	add r0, r0, r1
	str r0, [sl, #0x24]
	ldr r0, [sl, #0x28]
	add r0, r0, r1
	str r0, [sl, #0x28]
	str r6, [sl, #0x2c]
_02028CB8:
	add r0, r8, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, asr #0x18
	cmp r8, #0x14
	blt _02028C70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028D08
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028D08:
	bl sub_02028FC8
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0, #3]
#else
	ldrb r0, [r0]
#endif
	cmp r0, #0
	beq _02028D30
	ldr r0, _02028E24 ; =_022A7B00
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0, #3]
#else
	strb r1, [r0]
#endif
_02028D30:
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0]
#else
	ldrb r0, [r0, #3]
#endif
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E28 ; =_022A7AE4
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028DD4
_02028D58:
	ldr r0, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldr r6, _02028DF0 ; =_022A88DC
	ldrsb r2, [r0, #1]
	ldr r5, _02028DF4 ; =_022A7B1C
	mov sb, #0xe0
	mov sl, #0x2c
	mvn r8, #1
	b _02028D90
_02028D70:
	mul r1, r2, sl
	ldrb r0, [r5, r1]
	mla r7, r2, sb, r6
	cmp r0, #0
	add r0, r5, r1
	beq _02028D8C
	add r0, r0, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r2, [r7, #0xb5]
_02028D90:
	cmp r2, r8
#else
	ldr r7, _02028DF4 ; =_022A7B1C
	ldrsb r0, [r0, #5]
	mov r6, #0x30
	mvn r5, #1
	b _02028D90
_02028D70:
	mul r1, r0, r6
	ldrb r0, [r7, r1]
	add r8, r7, r1
	cmp r0, #0
	beq _02028D8C
	add r0, r8, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r0, [r8, #0x2c]
_02028D90:
	cmp r0, r5
#endif
	bne _02028D70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028DD4:
	bl sub_02029EC4
	bl sub_02029FE8
	mov r0, r4
	bl sub_0202A2C8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028DE8: .word _020AFD4C
_02028DEC: .word _022A7A6C
_02028DF0: .word _022A88DC
_02028DF4: .word _022A7B1C
_02028DF8: .word _020AFD98
_02028DFC: .word _0209ACA8
_02028E00: .word _0209AC64
_02028E04: .word _0209AC78
_02028E08: .word _022A7EDC
_02028E0C: .word _022A7AA0
_02028E10: .word _022A7A8C
_02028E14: .word _022A7A78
_02028E18: .word _020AFD9C
_02028E1C: .word _020AFD94
_02028E20: .word _022A7AC8
_02028E24: .word _022A7B00
_02028E28: .word _022A7AE4
	arm_func_end sub_02028A64

	arm_func_start sub_02028E2C
sub_02028E2C: ; 0x02028E2C
	ldr r0, _02028E3C ; =_022A7A6C
	mov r1, #0
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
_02028E3C: .word _022A7A6C
	arm_func_end sub_02028E2C

	arm_func_start sub_02028E40
sub_02028E40: ; 0x02028E40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r5, _02028E80 ; =_022A7EDC
	ldr r4, _02028E84 ; =_022A7A6C
	b _02028E6C
_02028E54:
	add r7, r5, r6, lsl #7
	mov r0, r7
	bl sub_0201F2A0
	add r0, r7, #0x40
	bl sub_0201F2A0
	add r6, r6, #1
_02028E6C:
	ldrsh r0, [r4, #6]
	cmp r6, r0
	blt _02028E54
	bl sub_0202A388
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028E80: .word _022A7EDC
_02028E84: .word _022A7A6C
	arm_func_end sub_02028E40

	arm_func_start sub_02028E88
sub_02028E88: ; 0x02028E88
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _02028ED0 ; =_022A7AC8
	bl sub_0200B340
	ldr r0, _02028ED4 ; =_022A7B00
	bl sub_0200B340
	ldr r0, _02028ED8 ; =_022A7AE4
	bl sub_0200B340
	ldr r0, _02028EDC ; =_022A7AA0
	bl sub_0200A184
	ldr r0, _02028EE0 ; =_022A7A8C
	bl sub_0200A184
	ldr r0, _02028EE4 ; =_022A7A78
	bl sub_0200A184
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02028ED0: .word _022A7AC8
_02028ED4: .word _022A7B00
_02028ED8: .word _022A7AE4
_02028EDC: .word _022A7AA0
_02028EE0: .word _022A7A8C
_02028EE4: .word _022A7A78
	arm_func_end sub_02028E88

	arm_func_start sub_02028EE8
sub_02028EE8: ; 0x02028EE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r7, r3
	bl sub_0202843C
	mov r5, r0
	ldr r6, [sb, #4]
	add r4, sp, #0
	mov fp, #0
	b _02028F68
_02028F18:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	ldr r0, [sb]
	str r0, [sp]
	b _02028F50
_02028F34:
	mov r0, r5
	mov r1, r4
	mov r2, fp
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02028F50:
	ldr r0, [sb]
	ldr r1, [sp]
	add r0, r0, r8
	cmp r1, r0
	blt _02028F34
	add r6, r6, #1
_02028F68:
	ldr r0, [sb, #4]
	add r0, r0, r7
	cmp r6, r0
	blt _02028F18
	mov r0, sl
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02028EE8

	arm_func_start sub_02028F88
sub_02028F88: ; 0x02028F88
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0202843C
	mov r1, r4
	bl sub_0200B3C0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02028F88

	arm_func_start sub_02028FA0
sub_02028FA0: ; 0x02028FA0
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028FC4 ; =_022A8908
	ldr r0, [r0, r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02028FC4: .word _022A8908
	arm_func_end sub_02028FA0

	arm_func_start sub_02028FC8
sub_02028FC8: ; 0x02028FC8
	ldr r0, _02028FDC ; =_020AFD9C
	ldrh r1, [r0]
	eor r1, r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0
_02028FDC: .word _020AFD9C
	arm_func_end sub_02028FC8

	arm_func_start sub_02028FE0
sub_02028FE0: ; 0x02028FE0
	ldr r1, _02028FF8 ; =0x00000904
	ldr r2, _02028FFC ; =_022A9A5C
	mov r3, #0
	smlabb r0, r0, r1, r2
	str r3, [r0, #0x900]
	bx lr
	.align 2, 0
_02028FF8: .word 0x00000904
_02028FFC: .word _022A9A5C
	arm_func_end sub_02028FE0

	arm_func_start sub_02029000
sub_02029000: ; 0x02029000
	ldr r2, _02029034 ; =_022A9A5C
	ldr r1, _02029038 ; =0x00000904
	smlabb r2, r0, r1, r2
	ldr r0, [r2, #0x900]
	add r1, r0, #1
	mov r0, r0, lsl #0x10
	str r1, [r2, #0x900]
	cmp r1, #0x10
	mov r1, r0, asr #0x10
	movge r0, #0x10
	strge r0, [r2, #0x900]
	add r0, r2, r1, lsl #4
	bx lr
	.align 2, 0
_02029034: .word _022A9A5C
_02029038: .word 0x00000904
	arm_func_end sub_02029000

	arm_func_start sub_0202903C
sub_0202903C: ; 0x0202903C
	ldr r0, _0202904C ; =_020AFD9C
	ldr ip, _02029050 ; =sub_02028FE0
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_0202904C: .word _020AFD9C
_02029050: .word sub_02028FE0
	arm_func_end sub_0202903C

	arm_func_start sub_02029054
sub_02029054: ; 0x02029054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r2, _02029144 ; =_020AFD9C
	ldr r1, _02029148 ; =0x00000904
	ldrh sl, [r2]
	ldr r6, _0202914C ; =_022A9A5C
	ldr r2, _02029150 ; =_022AA35C
	mul r3, sl, r1
	smlabb r4, sl, r1, r6
	ldr r1, [r2, r3]
	add r5, r4, #0x100
	mov fp, r0
	mov r4, r1, lsl #0x10
	add sb, r6, r3
	mov r7, #0
	b _02029120
_02029094:
	add r8, sb, r7, lsl #4
	ldr r6, [r8, #4]
	b _02029100
_020290A0:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	ldr r2, [r8]
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	str r2, [sp]
	b _020290E4
_020290BC:
	ldr r0, [sp, #4]
	mov r1, r2, lsl #1
	add r0, r5, r0, lsl #6
	ldrh r2, [r1, r0]
	mov r0, fp
	add r1, sp, #0
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020290E4:
	ldr r1, [r8]
	ldr r0, [r8, #8]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020290BC
	add r6, r6, #1
_02029100:
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	add r0, r1, r0
	cmp r6, r0
	blt _020290A0
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02029120:
	cmp r7, r4, asr #16
	blt _02029094
	ldr r0, _02029148 ; =0x00000904
	ldr r1, _0202914C ; =_022A9A5C
	mov r2, #0
	smlabb r0, sl, r0, r1
	str r2, [r0, #0x900]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02029144: .word _020AFD9C
_02029148: .word 0x00000904
_0202914C: .word _022A9A5C
_02029150: .word _022AA35C
	arm_func_end sub_02029054

	arm_func_start sub_02029154
sub_02029154: ; 0x02029154
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020291F0 ; =_020AFD9C
	mov r7, r0
	ldrh r0, [r4]
	mov r6, r1
	mov r5, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r4, r3
	bl sub_02029000
	ldr r1, _020291F0 ; =_020AFD9C
	ldr ip, _020291F4 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r2, _020291F8 ; =0x00000904
	add r1, r7, r5
	str r7, [r0]
	eor r3, r3, #1
	smlabb r2, r3, r2, ip
	str r6, [r0, #4]
	str r5, [r0, #8]
	str r4, [r0, #0xc]
	add r5, r2, #0x100
	add ip, r6, r4
	mov r3, #0
	b _020291E4
_020291BC:
	mov r0, r6, lsl #5
	mov r4, r7
	add r0, r5, r0, lsl #1
	b _020291D8
_020291CC:
	mov r2, r4, lsl #1
	strh r3, [r2, r0]
	add r4, r4, #1
_020291D8:
	cmp r4, r1
	blt _020291CC
	add r6, r6, #1
_020291E4:
	cmp r6, ip
	blt _020291BC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020291F0: .word _020AFD9C
_020291F4: .word _022A9A5C
_020291F8: .word 0x00000904
	arm_func_end sub_02029154

	arm_func_start sub_020291FC
sub_020291FC: ; 0x020291FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _0202946C ; =_020AFD9C
	mov r5, r0
	ldrh r0, [r4]
	mov r4, r1
	mov r8, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r7, r3
	ldr r6, [sp, #0x18]
	bl sub_02029000
	ldr r1, _0202946C ; =_020AFD9C
	ldr ip, _02029470 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r1, _02029474 ; =0x00000904
	ldrb r2, [sp, #0x1c]
	str r5, [r0]
	eor r3, r3, #1
	smlabb r1, r3, r1, ip
	stmib r0, {r4, r8}
	str r7, [r0, #0xc]
	cmp r2, #0
	add r1, r1, #0x100
	beq _020292BC
	orr r2, r6, #0x400
	mov r2, r2, lsl #0x10
	add r3, r5, r8
	mov r6, r2, lsr #0x10
	sub ip, r3, #1
	add lr, r4, r7
	b _020292B0
_0202927C:
	mov r2, r4, lsl #5
	mov r8, ip
	add r3, r1, r2, lsl #1
	b _020292A4
_0202928C:
	add r2, r6, #1
	mov r7, r8, lsl #1
	mov r2, r2, lsl #0x10
	strh r6, [r7, r3]
	mov r6, r2, lsr #0x10
	sub r8, r8, #1
_020292A4:
	cmp r8, r5
	bge _0202928C
	add r4, r4, #1
_020292B0:
	cmp r4, lr
	blt _0202927C
	b _02029310
_020292BC:
	add r2, r5, r8
	add r3, r4, r7
	b _02029308
_020292C8:
	mov r8, r4, lsr #0x1f
	rsb r7, r8, r4, lsl #27
	add r7, r8, r7, ror #27
	mov r7, r7, lsl #5
	mov ip, r5
	add r8, r1, r7, lsl #1
	b _020292FC
_020292E4:
	add r7, r6, #1
	mov lr, ip, lsl #1
	mov r7, r7, lsl #0x10
	strh r6, [lr, r8]
	mov r6, r7, lsr #0x10
	add ip, ip, #1
_020292FC:
	cmp ip, r2
	blt _020292E4
	add r4, r4, #1
_02029308:
	cmp r4, r3
	blt _020292C8
_02029310:
	ldrb r2, [sp, #0x20]
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, [r0]
	subs r2, r2, #1
	str r2, [r0]
	movmi r2, #0
	strmi r2, [r0]
	ldr r2, [r0, #4]
	subs r2, r2, #1
	str r2, [r0, #4]
	movmi r2, #0
	strmi r2, [r0, #4]
	ldr r2, [r0, #8]
	add r2, r2, #1
	str r2, [r0, #8]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #8]
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #0xc]
	ldr r5, [r0, #0xc]
	ldmia r0, {r2, r3, r6}
	mov r0, r3, lsl #0x10
	mov r4, r2, lsl #0x10
	mov r5, r5, lsl #0x10
	mov r3, r6, lsl #0x10
	movs r2, r0, asr #0x10
	mov r4, r4, asr #0x10
	bmi _020293D8
	mov r0, r2, lsl #5
	mov r8, r4
	add ip, r4, r3, asr #16
	add r6, r1, r0, lsl #1
	mov r7, #0
	b _020293D0
_020293B0:
	cmp r8, #0
	blt _020293C4
	cmp r8, #0x20
	movlt r0, r8, lsl #1
	strlth r7, [r0, r6]
_020293C4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_020293D0:
	cmp r8, ip
	ble _020293B0
_020293D8:
	add r3, r4, r3, asr #16
	add r0, r2, r5, asr #16
	mov r5, r3, lsl #0x10
	mov r8, r5, asr #0x10
	mov lr, #0
	mov ip, r4, lsl #1
	mov r6, r8, lsl #1
	mov r7, lr
	b _02029420
_020293FC:
	cmp r4, #0
	addge r5, r1, r2, lsl #6
	strgeh lr, [ip, r5]
	cmp r8, #0x20
	addlt r5, r1, r2, lsl #6
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	strlth r7, [r6, r5]
	mov r2, r2, asr #0x10
_02029420:
	cmp r2, r0
	blt _020293FC
	cmp r2, #0x18
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r2, lsl #5
	add r1, r1, r0, lsl #1
	mov r2, #0
	b _02029460
_02029440:
	cmp r4, #0
	blt _02029454
	cmp r4, #0x20
	movlt r0, r4, lsl #1
	strlth r2, [r0, r1]
_02029454:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02029460:
	cmp r4, r3
	ble _02029440
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202946C: .word _020AFD9C
_02029470: .word _022A9A5C
_02029474: .word 0x00000904
	arm_func_end sub_020291FC

	arm_func_start sub_02029478
sub_02029478: ; 0x02029478
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mvn r2, #0
	cmp r1, r2
	ldrnesh r2, [r0, #0x24]
	cmpne r1, r2
	beq _020294FC
	ldrb r0, [r0, #0x26]
	cmp r0, #0
	bne _020294D0
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #1
	ldr r0, _02029504 ; =_022AAC80
	str r2, [sp, #8]
	mov r2, #0
	mov r3, #0x3f8
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	b _020294FC
_020294D0:
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov ip, #1
	str ip, [sp, #8]
	ldr r0, _02029508 ; =_022AACFC
	mov r2, #0
	mov r3, #0x7c
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
_020294FC:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029504: .word _022AAC80
_02029508: .word _022AACFC
	arm_func_end sub_02029478

	arm_func_start LoadCursors
LoadCursors: ; 0x0202950C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029654 ; =_022AAC68
	mov r1, #0
	mov r2, #0x15
	bl memset
	ldr r0, _02029658 ; =WAN_TABLE
	ldr r1, _0202965C ; =_0209ADF0
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r2, _02029660 ; =_022AAC64
	ldr r1, _02029658 ; =WAN_TABLE
	strh r0, [r2, #2]
	ldr r0, [r1]
	ldr r1, _02029664 ; =_0209AE08
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029660 ; =_022AAC64
	mov r3, #1
	strh r0, [r1]
	str r3, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrsh r0, [r1, #2]
	mov r1, #0x3f8
	mov r2, #0xf
	bl sub_0201D9C8
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _02029660 ; =_022AAC64
	mov r1, #0x7c
	ldrsh r0, [r0]
	mov r2, #0xe
	bl sub_0201D9C8
	ldr r0, _02029668 ; =_022AAC80
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _02029668 ; =_022AAC80
	ldr r1, _02029660 ; =_022AAC64
	ldrsh r1, [r1, #2]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, _02029668 ; =_022AAC80
	mov r2, r1
	mov r3, #0x3f8
	bl SetAnimationForAnimationControl
	mov r1, #0
	ldr r0, _02029668 ; =_022AAC80
	strh r1, [r0, #0x38]
	bl sub_0201C108
	ldr r0, _0202966C ; =_022AACFC
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0202966C ; =_022AACFC
	ldr r1, _02029660 ; =_022AAC64
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0202966C ; =_022AACFC
	mov r1, #0
	mov r2, r1
	mov r3, #0x7c
	bl SetAnimationForAnimationControl
	ldr r0, _0202966C ; =_022AACFC
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_0201C108
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029654: .word _022AAC68
_02029658: .word WAN_TABLE
_0202965C: .word _0209ADF0
_02029660: .word _022AAC64
_02029664: .word _0209AE08
_02029668: .word _022AAC80
_0202966C: .word _022AACFC
	arm_func_end LoadCursors

	arm_func_start InitWindowTrailer
InitWindowTrailer: ; 0x02029670
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	strb r1, [r0, #0x19]
	strb r1, [r0, #0x18]
	bx lr
	arm_func_end InitWindowTrailer

	arm_func_start sub_02029688
sub_02029688: ; 0x02029688
	cmp r2, #1
	cmpeq r3, #0
	moveq r2, #2
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02029688

	arm_func_start sub_020296E8
sub_020296E8: ; 0x020296E8
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	ldreq r3, [r0, #0x10]
	ldreq r1, [sp, #8]
	cmpeq r3, r1
	ldreq r3, [r0, #0x14]
	ldreq r1, [sp, #0xc]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	ldr r2, [sp, #8]
	str r1, [r0, #0xc]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020296E8

	arm_func_start sub_02029758
sub_02029758: ; 0x02029758
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _0202980C
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _020297C8
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_020328D8
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_020297C8:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029820
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _02029820
_0202980C:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_02029820:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029758

	arm_func_start sub_02029828
sub_02029828: ; 0x02029828
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _020298DC
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _02029898
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02033350
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029898:
	mov r0, r4
	bl sub_020333B4
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02033390
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _020298F0
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _020298F0
_020298DC:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_020298F0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029828

	arm_func_start sub_020298F8
sub_020298F8: ; 0x020298F8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029950
	ldr ip, [r4, #8]
	ldr r1, [sp, #0x18]
	mov r2, r3
	add r1, ip, r1
	str r1, [sp]
	ldr ip, [r4]
	ldr r1, [sp, #0x1c]
	mov r3, lr
	add r1, ip, r1
	str r1, [sp, #4]
	ldrb r1, [r4, #0xd4]
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029950:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029990
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029990:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020298F8

	arm_func_start sub_02029998
sub_02029998: ; 0x02029998
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029A08
	ldr r1, [r4, #8]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x30]
	ldr ip, [r4]
	ldr r2, [sp, #0x2c]
	add r8, r1, r6
	ldr r6, [sp, #0x34]
	str r8, [sp]
	add r8, ip, r2
	mov r2, r3
	str r8, [sp, #4]
	add r1, r1, r7
	str r1, [sp, #8]
	add r1, ip, r6
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0xd4]
	mov r3, lr
	bl sub_020296E8
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029A08:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029A48
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029A48:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02029998

	arm_func_start sub_02029A50
sub_02029A50: ; 0x02029A50
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	strh r1, [r0, #0x24]
	str r2, [r0, #4]
	bx lr
	arm_func_end sub_02029A50

	arm_func_start sub_02029A68
sub_02029A68: ; 0x02029A68
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r2, r3
	beq _02029AAC
	mov r3, #0
	strb r3, [r1, #4]
	ldr r2, [r1]
	stmia r0, {r2, r3}
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
	b _02029AE8
_02029AAC:
	cmp r3, #0
	ldrneb r2, [r1, #4]
	cmpne r2, #0
	beq _02029AE8
	mov r2, #0
	strb r2, [r1, #4]
	str r2, [r0, #4]
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
_02029AE8:
	ldrb r2, [r1, #0x19]
	strb r2, [r0, #0x19]
	ldrb r2, [r1, #0x18]
	strb r2, [r0, #0x18]
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x20]
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02029A68

	arm_func_start sub_02029B0C
sub_02029B0C: ; 0x02029B0C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02029EB0
	cmp r0, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #1
	strne r0, [r4, #4]
	ldr r0, [r4, #4]
	tst r0, #0x10
	bne _02029EB0
	ldr r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02029EB0
_02029B50: ; jump table
	b _02029EB0 ; case 0
	b _02029B70 ; case 1
	b _02029B70 ; case 2
	b _02029BBC ; case 3
	b _02029C08 ; case 4
	b _02029C64 ; case 5
	b _02029D38 ; case 6
	b _02029D94 ; case 7
_02029B70:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BA4
	ldr r0, _02029EB8 ; =_022AAC80
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BA4:
	ldr r0, _02029EBC ; =_022AACFC
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BBC:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BF0
	ldr r0, _02029EB8 ; =_022AAC80
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BF0:
	ldr r0, _02029EBC ; =_022AACFC
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C08:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029C44
	ldr r0, _02029EB8 ; =_022AAC80
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C44:
	ldr r0, _02029EBC ; =_022AACFC
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C64:
	ldr r1, _02029EC0 ; =0x0000FFFF
	mov ip, #0
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0x18
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	add r1, sp, #0x18
	cmp r0, #0
	bne _02029CF0
	ldr r0, _02029EB8 ; =_022AAC80
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =_022AAC80
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =_022AAC80
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029CF0:
	ldr r0, _02029EBC ; =_022AACFC
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =_022AACFC
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =_022AACFC
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029D38:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029D74
	ldr r0, _02029EB8 ; =_022AAC80
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D74:
	ldr r0, _02029EBC ; =_022AACFC
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D94:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029DD0
	ldr r0, _02029EB8 ; =_022AAC80
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029DEC
_02029DD0:
	ldr r0, _02029EBC ; =_022AACFC
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
_02029DEC:
	mov ip, #0
	ldr r1, _02029EC0 ; =0x0000FFFF
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	ldrb r0, [r4, #0x26]
	add r1, sp, #0xc
	cmp r0, #0
	bne _02029E6C
	ldr r0, _02029EB8 ; =_022AAC80
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =_022AAC80
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =_022AAC80
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029E6C:
	ldr r0, _02029EBC ; =_022AACFC
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =_022AACFC
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =_022AACFC
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
_02029EB0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02029EB8: .word _022AAC80
_02029EBC: .word _022AACFC
_02029EC0: .word 0x0000FFFF
	arm_func_end sub_02029B0C

	arm_func_start sub_02029EC4
sub_02029EC4: ; 0x02029EC4
	bx lr
	arm_func_end sub_02029EC4

	arm_func_start Arm9LoadUnkFieldNa0x2029EC8
Arm9LoadUnkFieldNa0x2029EC8: ; 0x02029EC8
	ldr r1, _02029ED4 ; =_022AAC68
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02029ED4: .word _022AAC68
	arm_func_end Arm9LoadUnkFieldNa0x2029EC8

	arm_func_start Arm9StoreUnkFieldNa0x2029ED8
Arm9StoreUnkFieldNa0x2029ED8: ; 0x02029ED8
	ldr r2, _02029EE4 ; =_022AAC68
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02029EE4: .word _022AAC68
	arm_func_end Arm9StoreUnkFieldNa0x2029ED8

	arm_func_start LoadAlert
LoadAlert: ; 0x02029EE8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029F74 ; =WAN_TABLE
	ldr r1, _02029F78 ; =_0209AE20
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029F7C ; =_022AAD78
	strh r0, [r1]
	ldr r0, _02029F80 ; =_022AAD7C
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02029F7C ; =_022AAD78
	ldr r0, _02029F80 ; =_022AAD7C
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r1, #0
	mov r0, #0xd
	stmia sp, {r0, r1}
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _02029F80 ; =_022AAD7C
	mov r2, r1
	mov r3, #0x3e4
	str r1, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _02029F80 ; =_022AAD7C
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_02029FBC
	ldr r0, _02029F84 ; =_020AFDA0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029F74: .word WAN_TABLE
_02029F78: .word _0209AE20
_02029F7C: .word _022AAD78
_02029F80: .word _022AAD7C
_02029F84: .word _020AFDA0
	arm_func_end LoadAlert

	arm_func_start sub_02029F88
sub_02029F88: ; 0x02029F88
	ldr ip, _02029FB4 ; =_022AAD7C
	ldr r3, _02029FB8 ; =_020AFDA0
	strh r0, [ip, #0x1c]
	strh r1, [ip, #0x1e]
	ldrh r1, [ip, #2]
	mov r0, #0
	str r0, [r3, #4]
	bic r0, r1, #2
	strh r0, [ip, #2]
	strb r2, [r3]
	bx lr
	.align 2, 0
_02029FB4: .word _022AAD7C
_02029FB8: .word _020AFDA0
	arm_func_end sub_02029F88

	arm_func_start sub_02029FBC
sub_02029FBC: ; 0x02029FBC
	ldr r1, _02029FE0 ; =_022AAD7C
	ldr r0, _02029FE4 ; =_020AFDA0
	ldrh r3, [r1, #2]
	mov r2, #0
	str r2, [r0, #4]
	orr r3, r3, #2
	strh r3, [r1, #2]
	strb r2, [r0]
	bx lr
	.align 2, 0
_02029FE0: .word _022AAD7C
_02029FE4: .word _020AFDA0
	arm_func_end sub_02029FBC

	arm_func_start sub_02029FE8
sub_02029FE8: ; 0x02029FE8
	stmdb sp!, {r3, lr}
	ldr r0, _0202A034 ; =_022AAD7C
	ldrh r1, [r0, #2]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldr r1, _0202A038 ; =_020AFDA0
	ldrb r2, [r1]
	cmp r2, #0
	beq _0202A02C
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	ldr r1, [r1, #4]
	tst r1, #0x10
	ldmneia sp!, {r3, pc}
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
_0202A02C:
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A034: .word _022AAD7C
_0202A038: .word _020AFDA0
	arm_func_end sub_02029FE8

	arm_func_start sub_0202A03C
sub_0202A03C: ; 0x0202A03C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020334A8
	mov r0, r5
	mov r1, r4
	bl sub_02033BC0
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A0A8
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A0A8
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A0A8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A03C

	arm_func_start sub_0202A0B0
sub_0202A0B0: ; 0x0202A0B0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020335A8
	mov r0, r5
	mov r1, r4
	bl sub_02034360
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A11C
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A11C
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A11C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A0B0

	arm_func_start sub_0202A124
sub_0202A124: ; 0x0202A124
	stmdb sp!, {r3, lr}
	ldr r0, _0202A144 ; =0x00000488
	mov r1, #0
	bl MemAlloc
	ldr r1, _0202A148 ; =_020AFDA8
	str r0, [r1]
	bl sub_0202A14C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A144: .word 0x00000488
_0202A148: .word _020AFDA8
	arm_func_end sub_0202A124

	arm_func_start sub_0202A14C
sub_0202A14C: ; 0x0202A14C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, #0
	ldr r8, _0202A1D0 ; =_020AFDA8
	mov r4, r5
	mov r7, #0x48
_0202A160:
	mul r6, r5, r7
	ldr r0, [r8]
	add r0, r0, r6
	add r0, r0, #4
	bl InitRender3dElement64
	ldr r0, [r8]
	mov ip, #4
	strb r4, [r0, r6]
	ldr sb, [r8]
	add lr, sb, r6
	add r6, lr, #0x244
_0202A18C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202A18C
	add r5, r5, #1
	ldmia lr, {r0, r1}
	stmia r6, {r0, r1}
	cmp r5, #8
	blo _0202A160
	add r0, sb, #0x200
	mov r2, #0
	ldr r1, _0202A1D0 ; =_020AFDA8
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r2, [r0, #0x84]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A1D0: .word _020AFDA8
	arm_func_end sub_0202A14C

	arm_func_start sub_0202A1D4
sub_0202A1D4: ; 0x0202A1D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0202A2A0 ; =_020AFDA8
	mov sb, r0
	ldr r0, [r4]
	mov r7, r2
	add r0, r0, #0x200
	mov r8, r1
	ldrh r1, [r0, #0x40]
	mov r6, r3
	mov r2, #1
	add r1, r1, #1
	strh r1, [r0, #0x40]
	ldr r0, [r4]
	ldr r5, [sp, #0x20]
	add r0, r0, #0x200
	ldrh r1, [r0, #0x40]
	cmp r1, #8
	movhs r1, #0
	strhsh r1, [r0, #0x40]
	ldr r0, _0202A2A0 ; =_020AFDA8
	mov r1, #0x48
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrh r0, [r0, #0x40]
	mul r1, r0, r1
	add r4, r3, r1
	add r0, r4, #4
	strb r2, [r3, r1]
	bl InitRender3dElement64
	mov r0, #2
	mov r3, r5
	strb r0, [r4, #0x40]
	add r2, r4, #0x30
	mov r1, #4
_0202A25C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _0202A25C
	ldrb r2, [r5, #3]
	mov r1, #8
	ldrsh r0, [sp, #0x24]
	strb r2, [r4, #0x33]
	strh sb, [r4, #4]
	strh r8, [r4, #6]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r1, [r4, #0x2e]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r0, [r4, #0x44]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A2A0: .word _020AFDA8
	arm_func_end sub_0202A1D4

	arm_func_start sub_0202A2A4
sub_0202A2A4: ; 0x0202A2A4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrsh ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_0202A1D4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A2A4

	arm_func_start sub_0202A2C8
sub_0202A2C8: ; 0x0202A2C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0202A384 ; =_020AFDA8
	cmp r0, #0
	ldr ip, [r1]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, ip, #0x400
	mov lr, #0
	strh lr, [r0, #0x84]
_0202A2E8:
	ldr r0, _0202A384 ; =_020AFDA8
	ldr r4, [r0]
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	cmp r1, #8
	ldrneb r0, [ip]
	cmpne r0, #0
	beq _0202A368
	mov r0, #0x48
	mla r0, r1, r0, r4
	mov r7, ip
	add r6, r0, #0x244
	mov r5, #4
_0202A31C:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A31C
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	add r1, r1, #1
	strh r1, [r0, #0x84]
	ldrb r1, [ip, #0x33]
	ldrsh r0, [ip, #0x44]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	movle r0, #0
	strleb r0, [ip]
	strgtb r0, [ip, #0x33]
_0202A368:
	add r0, lr, #1
	mov r0, r0, lsl #0x10
	mov lr, r0, asr #0x10
	cmp lr, #8
	add ip, ip, #0x48
	blt _0202A2E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202A384: .word _020AFDA8
	arm_func_end sub_0202A2C8

	arm_func_start sub_0202A388
sub_0202A388: ; 0x0202A388
	stmdb sp!, {r4, r5, r6, lr}
	ldr r6, _0202A3E0 ; =_020AFDA8
	mov r5, #0
	ldr r1, [r6]
	add r0, r1, #0x400
	ldrh r0, [r0, #0x84]
	add r4, r1, #0x244
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, pc}
	b _0202A3C8
_0202A3B0:
	add r0, r4, #4
	bl sub_0201F2A0
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	add r4, r4, #0x48
_0202A3C8:
	ldr r0, [r6]
	add r0, r0, #0x400
	ldrh r0, [r0, #0x84]
	cmp r5, r0
	blt _0202A3B0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202A3E0: .word _020AFDA8
	arm_func_end sub_0202A388

	arm_func_start PrintClearMark
PrintClearMark: ; 0x0202A3E4
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0
	bl sub_0202A45C
	ldmia sp!, {r3, pc}
	arm_func_end PrintClearMark

	arm_func_start sub_0202A40C
sub_0202A40C: ; 0x0202A40C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #1
	bl sub_0202A45C
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A40C

	arm_func_start sub_0202A434
sub_0202A434: ; 0x0202A434
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl sub_0202A45C
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A434

	arm_func_start sub_0202A45C
sub_0202A45C: ; 0x0202A45C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x70
	mov sl, r0
	mov r4, r1
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x90]
	bl FileRom_InitDataTransfer
	add r0, sp, #0x28
	bl FileRom_Veneer_FileInit
	ldr r1, _0202A5C0 ; =_020AFDAC
	add r0, sp, #0x28
	ldr r1, [r1, sl, lsl #2]
	bl FileRom_HandleOpen
	mov r1, r4, lsl #3
	add r0, sp, #0x28
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	add r1, sp, #8
	mov r2, #0x10
	bl FileRom_HandleRead
	ldr r6, [sp, #8]
	ldr r1, [sp, #0x10]
	mov r0, r6
	sub r4, r1, r6
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	movs r5, r0
	beq _0202A504
	add r0, sp, #0x28
	mov r1, r6
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	mov r1, r5
	mov r2, r4
	bl FileRom_HandleRead
_0202A504:
	add r0, sp, #0x28
	bl FileClose
	bl FileRom_StopDataTransfer
	cmp sl, #2
	ldreq r0, _0202A5C4 ; =_0209AE44
	add r4, sp, #0x18
	ldrne r0, _0202A5C8 ; =_0209AE34
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	mvn r0, #0
	ldrb r2, [sp, #4]
	ldrb r1, [sp, #5]
	cmp r7, r0
	ldreqb r0, [sp, #6]
	strb sb, [sp, #0x1c]
	strb r8, [sp, #0x1d]
	strb r2, [sp, #0x1e]
	strb r1, [sp, #0x1f]
	addeq r7, r0, #3
	beq _0202A564
	sub r0, r0, #1
	cmp r7, r0
	ldreqb r0, [sp, #6]
	addeq r7, r0, #0x11
_0202A564:
	add r0, sp, #0x18
	mov r1, #0
	bl CreateTextBox
	mov r1, #0
	mov r4, r0
	bl sub_02027A08
	cmp r5, #0
	beq _0202A5B4
	mov r0, r4
	mov r1, r5
	mov r2, r7, lsl #4
	bl sub_02027040
	mov r0, r4
	mov r2, r7
	add r1, r5, #0x30
	bl sub_02026E3C
	mov r0, r4
	bl UpdateWindow
	mov r0, r5
	bl MemFree
_0202A5B4:
	mov r0, r4
	add sp, sp, #0x70
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202A5C0: .word _020AFDAC
_0202A5C4: .word _0209AE44
_0202A5C8: .word _0209AE34
	arm_func_end sub_0202A45C

	arm_func_start CreateParentMenuFromStringIds
CreateParentMenuFromStringIds: ; 0x0202A5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A5F4
_0202A5EC:
	add r1, r1, #8
	add r2, r2, #1
_0202A5F4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202A5EC
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A638
_0202A620:
	mov r0, r5
	bl GetStringFromFileVeneer
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A638:
	ldrh r1, [r6]
	cmp r1, #0
	bne _0202A620
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenuFromStringIds

	arm_func_start IsEmptyString
IsEmptyString: ; 0x0202A66C
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsEmptyString

	arm_func_start CreateParentMenu
CreateParentMenu: ; 0x0202A690
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A6B8
_0202A6B0:
	add r1, r1, #8
	add r2, r2, #1
_0202A6B8:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A6B0
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A6FC
_0202A6E4:
	mov r0, r5
	bl strcpy
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A6FC:
	ldr r1, [r6]
	cmp r1, #0
	bne _0202A6E4
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenu

	arm_func_start CreateParentMenuWrapper
CreateParentMenuWrapper: ; 0x0202A730
	stmdb sp!, {r4, lr}
	bl CreateParentMenu
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	beq _0202A754
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1b0]
_0202A754:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end CreateParentMenuWrapper

	arm_func_start CreateParentMenuInternal
CreateParentMenuInternal: ; 0x0202A75C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	tst sl, #0x20
	ldrne r7, [sb]
	mov fp, #0
	moveq r7, #0
	cmp r6, #0
	str fp, [sp, #8]
	mov r4, r0
	addne ip, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202A94C ; =UpdateParentMenu
	mov r5, r8
	strne r0, [sp, #0x1c]
	bne _0202A7CC
	ldr r0, _0202A950 ; =PARENT_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202A7CC:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202A81C
	mov r6, #0
	b _0202A7F8
_0202A7E4:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202A7F8:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A7E4
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202A81C:
	mov r5, r8
	and r6, sl, #0x20
	b _0202A84C
_0202A828:
	cmp r6, #0
	beq _0202A83C
	ldr r0, [r5, #0x100]
	cmp r0, r7
	ldreq fp, [sp, #8]
_0202A83C:
	ldr r0, [sp, #8]
	add r5, r5, #0x104
	add r0, r0, #1
	str r0, [sp, #8]
_0202A84C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A828
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	bne _0202A880
	add r2, sp, #8
	mov r0, sl
	mov r1, sb
	mov r3, r2
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
_0202A880:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202A94C ; =UpdateParentMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202A8DC
	add r6, r4, #0x100
	mov r5, #9
_0202A8C4:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A8C4
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202A8DC:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1a8]
	str r2, [r4, #0x1ac]
	strb r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r5, [sp, #8]
	add r3, sp, #0xc
	str r5, [sp]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202A94C: .word UpdateParentMenu
_0202A950: .word PARENT_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateParentMenuInternal

	arm_func_start ResumeParentMenu
ResumeParentMenu: ; 0x0202A954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	str r1, [r0, #0x1a4]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeParentMenu

	arm_func_start sub_0202A98C
sub_0202A98C: ; 0x0202A98C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov sb, r1
	mov r5, #0
	bl GetWindow
	mov r7, r0
	mov r1, sb
	ldr r8, [r7, #0xc]
	b _0202A9BC
_0202A9B4:
	add r1, r1, #8
	add r5, r5, #1
_0202A9BC:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A9B4
	ldr r0, [r8, #0x198]
	cmp r0, #0
	beq _0202A9D8
	bl MemFree
_0202A9D8:
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	b _0202AA10
_0202A9F8:
	mov r0, r6
	bl strcpy
	ldr r0, [sb, #4]
	add sb, sb, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202AA10:
	ldr r1, [sb]
	cmp r1, #0
	bne _0202A9F8
	mov sl, #0
	strb sl, [r6]
	ldr r0, [sb, #4]
	mov sb, r5
	str r0, [r6, #0x100]
	b _0202AA3C
_0202AA34:
	add sb, sb, #0x104
	add sl, sl, #1
_0202AA3C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202AA34
	str r5, [r8, #0x198]
	ldrb r0, [r7, #8]
	bl sub_020287C4
	mov r0, r4
	bl UpdateWindow
	mov r0, #3
	str r0, [r8, #0x19c]
	mov r2, #0
	strb r2, [r8, #0x1a0]
	strb r2, [r8, #0x1a1]
	add r1, sp, #8
	mov r0, r4
	str r2, [r8, #0x1a4]
	bl GetWindowRectangle
	str sl, [sp]
	str sl, [sp, #4]
	ldr r1, [r8, #0xfc]
	add r0, r8, #4
	add r2, r8, #0x100
	add r3, sp, #8
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0202A98C

	arm_func_start SetParentMenuState7
SetParentMenuState7: ; 0x0202AAA8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #7
	str r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end SetParentMenuState7

	arm_func_start CloseParentMenu
CloseParentMenu: ; 0x0202AABC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseParentMenu

	arm_func_start sub_0202AAE8
sub_0202AAE8: ; 0x0202AAE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #9
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202AAE8

	arm_func_start IsParentMenuActive
IsParentMenuActive: ; 0x0202AB40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #8
	cmpne r0, #9
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsParentMenuActive

	arm_func_start CheckParentMenuField0x1A0
CheckParentMenuField0x1A0: ; 0x0202AB60
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckParentMenuField0x1A0

	arm_func_start sub_0202AB80
sub_0202AB80: ; 0x0202AB80
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202AB80

	arm_func_start sub_0202AB94
sub_0202AB94: ; 0x0202AB94
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202AB94

	arm_func_start sub_0202ABB0
sub_0202ABB0: ; 0x0202ABB0
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202ABF4
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202ABE0
	bl sub_0203258C
	b _0202ABE4
_0202ABE0:
	bl sub_02032578
_0202ABE4:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202ABF4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202ABB0

	arm_func_start UpdateParentMenu
UpdateParentMenu: ; 0x0202ABFC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202AF6C
_0202AC1C: ; jump table
	b _0202AC3C ; case 0
	b _0202AC5C ; case 1
	b _0202AC78 ; case 2
	b _0202ACDC ; case 3
	b _0202AD3C ; case 4
	b _0202AEE8 ; case 5
	b _0202AEF8 ; case 6
	b _0202AF40 ; case 7
_0202AC3C:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202AF6C
	ldr r1, [r4, #0x1a8]
	mov r0, #2
	str r1, [r4, #0x1ac]
	str r0, [r4, #0x19c]
_0202AC5C:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1a8]
	moveq r0, #2
	streq r1, [r4, #0x1ac]
	streq r0, [r4, #0x19c]
	beq _0202AF6C
_0202AC78:
	ldr r0, [r4, #0x1a8]
	cmp r0, #0
	ble _0202ACD4
	ldr r0, [r4, #0x1ac]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	add r0, r4, #4
	ble _0202ACD0
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a4]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202AF78
	b _0202AF6C
_0202ACD0:
	bl sub_02031C84
_0202ACD4:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202ACDC:
	mov r0, r6
	bl sub_0202AF78
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202AD18
	mov r0, #9
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD18:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD3C:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202ADAC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202ADAC
	mov r3, #0
	ldr r2, _0202AF74 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202ADAC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202ADAC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202ADCC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202ADCC:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202ADF8
	mov r0, r6
	bl sub_0202AF78
_0202ADF8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202AE68
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202AE58
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202AE2C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202AE2C:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AE58:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202AED8
_0202AE68:
	tst r1, #2
	add r0, r4, #4
	beq _0202AEA4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AEA4:
	bl sub_0203250C
	cmp r0, #0
	beq _0202AED8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202AED8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202AF6C
_0202AEE8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202AF6C
_0202AEF8:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202AF24
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202AF38
	mov r0, r6
	bl sub_0202AF78
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202AF6C
_0202AF24:
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	movne r0, #9
	strne r0, [r4, #0x19c]
	bne _0202AF6C
_0202AF38:
	mov r0, #7
	str r0, [r4, #0x19c]
_0202AF40:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202AF6C
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
_0202AF6C:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202AF74: .word 0x00000408
	arm_func_end UpdateParentMenu

	arm_func_start sub_0202AF78
sub_0202AF78: ; 0x0202AF78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r5, [sl, #0xc]
	mov r7, #0
	ldr r0, [r5, #0xfc]
	ldr r6, [r5, #0x198]
	tst r0, #0x200
	ldrne r8, [r5, #0x160]
	ldrsb r0, [sl, #0x10]
	moveq r8, #0
	bl sub_02027B1C
	mov fp, #1
	mov r4, r7
	b _0202B008
_0202AFB0:
	mov r1, r4
	cmp r8, #0
	beq _0202AFCC
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, fp
_0202AFCC:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r5, #4
	bl sub_020328D8
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	add r7, r7, #1
	add r6, r6, #0x104
_0202B008:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202AFB0
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202AF78

	arm_func_start sub_0202B030
sub_0202B030: ; 0x0202B030
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B094
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B068
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B068:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
_0202B094:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B030

	arm_func_start sub_0202B0A4
sub_0202B0A4: ; 0x0202B0A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	add r0, r4, #4
	mov r1, #0xb000000
	beq _0202B0D8
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C84
	ldmia sp!, {r3, r4, r5, pc}
_0202B0D8:
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B0A4

	arm_func_start CreateSimpleMenuFromStringIds
CreateSimpleMenuFromStringIds: ; 0x0202B0EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r3
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r1, r7
	mov r2, #0
	b _0202B114
_0202B10C:
	add r1, r1, #8
	add r2, r2, #1
_0202B114:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202B10C
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	mov r4, #0
	mov fp, #0x100
	b _0202B16C
_0202B148:
	ldr r3, _0202B1A8 ; =0x0000C402
	mov r0, r6
	mov r1, fp
	str r4, [sp]
	bl PreprocessStringFromId
	ldr r0, [r7, #4]
	add r7, r7, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202B16C:
	ldrh r2, [r7]
	cmp r2, #0
	bne _0202B148
	mov r0, #0
	strb r0, [r6]
	ldr r0, [r7, #4]
	ldr r4, [sp, #0x28]
	str r0, [r6, #0x100]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r5
	str r4, [sp]
	bl CreateSimpleMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B1A8: .word 0x0000C402
	arm_func_end CreateSimpleMenuFromStringIds

	arm_func_start CreateSimpleMenu
CreateSimpleMenu: ; 0x0202B1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r4, r6
	mov r5, #0
	b _0202B1D8
_0202B1D0:
	add r4, r4, #0x104
	add r5, r5, #1
_0202B1D8:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202B1D0
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202B234
_0202B208:
	mov sl, r6
	mov ip, r5
	add r6, r6, #0x104
	add r5, r5, #0x104
	mov lr, #0x10
_0202B21C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0202B21C
	ldr r0, [sl]
	str r0, [ip]
_0202B234:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202B208
	mov ip, #0x10
_0202B248:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202B248
	ldr r0, [r6]
	ldr r6, [sp, #0x28]
	str r0, [r5]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [sp]
	bl CreateSimpleMenuInternal
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end CreateSimpleMenu

	arm_func_start CreateSimpleMenuInternal
CreateSimpleMenuInternal: ; 0x0202B284
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	tst sl, #0x20
	ldrne r7, [sb]
	mov fp, #0
	moveq r7, #0
	cmp r6, #0
	str fp, [sp, #8]
	mov r4, r0
	addne ip, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202B488 ; =UpdateSimpleMenu
	mov r5, r8
	orr sl, sl, #0x8000
	strne r0, [sp, #0x1c]
	bne _0202B2F8
	ldr r0, _0202B48C ; =SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202B2F8:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202B348
	mov r6, #0
	b _0202B324
_0202B310:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202B324:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B310
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202B348:
	mov r5, r8
	b _0202B36C
_0202B350:
	ldr r0, [r5, #0x100]
	add r5, r5, #0x104
	cmp r0, r7
	ldr r0, [sp, #8]
	ldreq fp, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0202B36C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B350
	ldr r0, [sp, #0x50]
	add r2, sp, #8
	cmp r0, #0
	ldrle r0, [sp, #8]
	add r3, sp, #0x50
	strle r0, [sp, #0x50]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, sl
	bne _0202B3B4
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202B3BC
_0202B3B4:
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202B3BC:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202B488 ; =UpdateSimpleMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202B418
	add r6, r4, #0x100
	mov r5, #9
_0202B400:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202B400
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202B418:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1ac]
	str r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r5, [sp, #0x50]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B488: .word UpdateSimpleMenu
_0202B48C: .word SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateSimpleMenuInternal

	arm_func_start ResumeSimpleMenu
ResumeSimpleMenu: ; 0x0202B490
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeSimpleMenu

	arm_func_start CloseSimpleMenu
CloseSimpleMenu: ; 0x0202B4C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseSimpleMenu

	arm_func_start IsSimpleMenuActive
IsSimpleMenuActive: ; 0x0202B4F0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSimpleMenuActive

	arm_func_start CheckSimpleMenuField0x1A0
CheckSimpleMenuField0x1A0: ; 0x0202B510
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckSimpleMenuField0x1A0

	arm_func_start sub_0202B530
sub_0202B530: ; 0x0202B530
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B530

	arm_func_start sub_0202B544
sub_0202B544: ; 0x0202B544
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032560
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B544

	arm_func_start GetSimpleMenuField0x1A4
GetSimpleMenuField0x1A4: ; 0x0202B558
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a4]
	ldmia sp!, {r3, pc}
	arm_func_end GetSimpleMenuField0x1A4

	arm_func_start sub_0202B568
sub_0202B568: ; 0x0202B568
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_0203259C
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B568

	arm_func_start GetSimpleMenuResult
GetSimpleMenuResult: ; 0x0202B57C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202B5C0
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202B5AC
	bl sub_0203258C
	b _0202B5B0
_0202B5AC:
	bl sub_02032578
_0202B5B0:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202B5C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetSimpleMenuResult

	arm_func_start UpdateSimpleMenu
UpdateSimpleMenu: ; 0x0202B5C8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0202B928
_0202B5E8: ; jump table
	b _0202B604 ; case 0
	b _0202B624 ; case 1
	b _0202B640 ; case 2
	b _0202B6A4 ; case 3
	b _0202B704 ; case 4
	b _0202B8B8 ; case 5
	b _0202B8FC ; case 6
_0202B604:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202B928
	ldr r1, [r4, #0x1ac]
	mov r0, #2
	str r1, [r4, #0x1b0]
	str r0, [r4, #0x19c]
_0202B624:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1ac]
	moveq r0, #2
	streq r1, [r4, #0x1b0]
	streq r0, [r4, #0x19c]
	beq _0202B928
_0202B640:
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	ble _0202B69C
	ldr r0, [r4, #0x1b0]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1b0]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	add r0, r4, #4
	ble _0202B698
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a8]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202B934
	b _0202B928
_0202B698:
	bl sub_02031C84
_0202B69C:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202B6A4:
	mov r0, r6
	bl sub_0202B934
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202B6E0
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202B928
_0202B6E0:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202B928
_0202B704:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	str r1, [r4, #0x1a4]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B77C
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202B77C
	mov r3, #0
	ldr r2, _0202B930 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202B77C
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202B77C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B79C
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202B79C:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202B7C8
	mov r0, r6
	bl sub_0202B934
_0202B7C8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202B838
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B828
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B7FC
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B7FC:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B828:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202B8A8
_0202B838:
	tst r1, #2
	add r0, r4, #4
	beq _0202B874
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B874:
	bl sub_0203250C
	cmp r0, #0
	beq _0202B8A8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202B8A8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202B928
_0202B8B8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202B8F4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202B8F4
	mov r0, r6
	bl sub_0202B934
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202B928
_0202B8F4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202B8FC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202B928:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202B930: .word 0x00000408
	arm_func_end UpdateSimpleMenu

	arm_func_start sub_0202B934
sub_0202B934: ; 0x0202B934
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r7, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r2, [r4, #0xfc]
	mov r5, r0
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r1, r7, r7, lsl #6
	ldrsb r0, [sl, #0x10]
	add r6, r3, r1, lsl #2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202B9F4
	mov fp, r7
	b _0202B9EC
_0202B994:
	mov r1, fp
	cmp r8, #0
	beq _0202B9B0
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202B9B0:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r4, #4
	bl sub_020328D8
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	add r7, r7, #1
	add r6, r6, #0x104
_0202B9EC:
	cmp r7, r5
	blt _0202B994
_0202B9F4:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202B934

	arm_func_start SetSimpleMenuField0x1AC
SetSimpleMenuField0x1AC: ; 0x0202BA0C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1ac]
	ldmia sp!, {r4, pc}
	arm_func_end SetSimpleMenuField0x1AC

	arm_func_start CreateAdvancedMenu
CreateAdvancedMenu: ; 0x0202BA20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b0
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _0202BBE8 ; =ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _0202BBEC ; =UpdateAdvancedMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _0202BADC
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _0202BABC
_0202BA98:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _0202BAB8
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202BAB8:
	add r6, r6, #1
_0202BABC:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _0202BA98
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_0202BADC:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _0202BB0C
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _0202BB1C
_0202BB0C:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202BB1C:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _0202BBEC ; =UpdateAdvancedMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0202BB78
	add r6, r5, #0x100
	mov r4, #9
_0202BB60:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202BB60
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202BB78:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r8, [r5, #0x198]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a8]
	add r0, sp, #0x18
	mov r1, #3
	str r2, [r5, #0x1ac]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x448]
	add r3, sp, #8
	str r0, [sp]
	ldr r4, [sp, #0x44c]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x28
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202BBE8: .word ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
_0202BBEC: .word UpdateAdvancedMenu
	arm_func_end CreateAdvancedMenu

	arm_func_start ResumeAdvancedMenu
ResumeAdvancedMenu: ; 0x0202BBF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	str r1, [r0, #0x1a4]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeAdvancedMenu

	arm_func_start sub_0202BC28
sub_0202BC28: ; 0x0202BC28
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202BC28

	arm_func_start CloseAdvancedMenu
CloseAdvancedMenu: ; 0x0202BC44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAdvancedMenu

	arm_func_start sub_0202BC60
sub_0202BC60: ; 0x0202BC60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #3
	cmpne r0, #4
	cmpne r0, #0xa
	cmpne r0, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202BC60

	arm_func_start IsAdvancedMenuActive2
IsAdvancedMenuActive2: ; 0x0202BCBC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive2

	arm_func_start IsAdvancedMenuActive
IsAdvancedMenuActive: ; 0x0202BCDC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive

	arm_func_start GetAdvancedMenuCurrentOption
GetAdvancedMenuCurrentOption: ; 0x0202BCFC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuCurrentOption

	arm_func_start GetAdvancedMenuResult
GetAdvancedMenuResult: ; 0x0202BD10
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _0202BD40
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_0202BD40:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuResult

	arm_func_start sub_0202BD48
sub_0202BD48: ; 0x0202BD48
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202BD48

	arm_func_start UpdateAdvancedMenu
UpdateAdvancedMenu: ; 0x0202BD64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202C1D8
_0202BD84: ; jump table
	b _0202BDB0 ; case 0
	b _0202BDC8 ; case 1
	b _0202BDF0 ; case 2
	b _0202BE50 ; case 3
	b _0202C168 ; case 4
	b _0202C178 ; case 5
	b _0202C1AC ; case 6
	b _0202C1D8 ; case 7
	b _0202C1D8 ; case 8
	b _0202C0F8 ; case 9
	b _0202C130 ; case 10
_0202BDB0:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202C1D8
	mov r0, #2
	str r0, [r4, #0x19c]
_0202BDC8:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _0202BDF0
	ldrb r0, [r6, #8]
	bl sub_020287C4
	ldrsb r0, [r6, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202BDF0:
	mov r0, r6
	bl sub_0202C260
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202BE2C
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE2C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE50:
	mov r0, #0
	str r0, [sp, #8]
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202BEC8
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202BEC8
	mov r3, #0
	ldr r2, _0202C1E0 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202BEC8
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202BEC8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202BEE8
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202BEE8:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202BF14
	mov r0, r6
	bl sub_0202C260
_0202BF14:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202BF84
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202BF74
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202BF48
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202BF48:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BF74:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202C0E8
_0202BF84:
	tst r1, #2
	beq _0202BFC0
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BFC0:
	tst r1, #0x1000
	beq _0202C00C
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _0202C00C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C00C:
	tst r1, #0x2000
	beq _0202C058
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _0202C058
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #0xa
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C058:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _0202C080
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _0202C0E8
_0202C080:
	bl sub_0203250C
	cmp r0, #0
	beq _0202C0B8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C0B8:
	ldr r0, [sp, #8]
	tst r0, #0x40000
	bne _0202C0CC
	tst r0, #0x80000
	beq _0202C0E8
_0202C0CC:
	tst r0, #0x4000
	bne _0202C0E8
	tst r0, #0x8000
	moveq r0, #1
	streqb r0, [r4, #0x1a0]
	ldreq r0, [sp, #8]
	streq r0, [r4, #0x1a4]
_0202C0E8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202C1D8
_0202C0F8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl sub_0202C260
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C130:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl sub_0202C260
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C168:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
_0202C178:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202C1A4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202C1A4
	mov r0, r6
	bl sub_0202C260
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202C1A4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202C1AC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202C1D8
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202C1D8:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202C1E0: .word 0x00000408
	arm_func_end UpdateAdvancedMenu

	arm_func_start sub_0202C1E4
sub_0202C1E4: ; 0x0202C1E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202C24C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202C21C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202C21C:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #5
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0202C24C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C1E4

	arm_func_start sub_0202C260
sub_0202C260: ; 0x0202C260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r6, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	addne sb, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq sb, #0
	bl sub_02027B1C
	cmp r6, #0
	mov r7, #0
	ble _0202C36C
	mov fp, #0x42
	b _0202C364
_0202C2BC:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _0202C2EC
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_0202C2EC:
	cmp r8, #0
	beq _0202C35C
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _0202C334
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp, #4]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #8]
	ldrsb r0, [sl, #0x10]
	bl sub_02026428
	b _0202C35C
_0202C334:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #4]
	ldrsb r0, [sl, #0x10]
	bl sub_02026358
_0202C35C:
	add r7, r7, #1
	add r5, r5, #1
_0202C364:
	cmp r7, r6
	blt _0202C2BC
_0202C36C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202C260

	arm_func_start sub_0202C38C
sub_0202C38C: ; 0x0202C38C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	ldrne r0, [r0, #0x1a4]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C38C

	arm_func_start CreateCollectionMenu
CreateCollectionMenu: ; 0x0202C3A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	sub sp, sp, #0x400
	mov r4, r0
	mov sl, r1
	mov r0, #0x1cc
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	ldr r1, [sp, #0x450]
	mov r5, r0
	cmp r1, #0
	ldrne r0, _0202C5D4 ; =0x10008004
	orr sl, sl, #0x8000
	orrne sl, sl, r0
	cmp r4, #0
	addne r6, sp, #0x1c
	ldmneia r4, {r0, r1, r2, r3}
	stmneia r6, {r0, r1, r2, r3}
	ldrne r0, _0202C5D8 ; =UpdateCollectionMenu
	strne r0, [sp, #0x1c]
	bne _0202C418
	ldr r0, _0202C5DC ; =COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202C418:
	ldrb r0, [sp, #0x22]
	str r5, [sp, #0x28]
	cmp r0, #0
	bne _0202C484
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x2c
	add fp, sp, #8
	b _0202C464
_0202C43C:
	mov r0, r4
	mov r1, r6
	mov r2, fp
	blx r8
	cmp r0, #0
	beq _0202C460
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202C460:
	add r6, r6, #1
_0202C464:
	ldr r0, [sp, #0x454]
	cmp r6, r0
	blt _0202C43C
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202C484:
	ldrb r0, [sp, #0x23]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x54
	bne _0202C4B4
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202C4C4
_0202C4B4:
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202C4C4:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r1, _0202C5D8 ; =UpdateCollectionMenu
	mov r0, #0
	str r1, [r5]
	str sl, [r5, #0xfc]
	strb r0, [r5, #0x1c5]
	cmp sb, #0
	beq _0202C528
	add r6, r5, #0x100
	mov r4, #9
_0202C510:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202C510
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202C528:
	mov r3, #0
	str r3, [r5, #0x18c]
	ldr r0, [sp, #0x450]
	str r8, [r5, #0x198]
	str r0, [r5, #0x19c]
	str r3, [r5, #0x1a8]
	str r3, [r5, #0x1ac]
	strb r3, [r5, #0x1b0]
	strb r3, [r5, #0x1b1]
	strb r3, [r5, #0x1b2]
	str r3, [r5, #0x1b4]
	str r3, [r5, #0x1b8]
	mov r0, #0xd
	str r0, [r5, #0x1bc]
	strb r3, [r5, #0x1c6]
	ldrb r2, [sp, #0x22]
	add r0, sp, #0x1c
	mov r1, #3
	mov r2, r2, lsl #3
	sub r2, r2, #1
	str r2, [r5, #0x1c0]
	strb r3, [r5, #0x1c4]
	strb r3, [r5, #0x1c8]
	strb r3, [r5, #0x1c9]
	str r3, [r5, #0x1a4]
	str r3, [r5, #0x1a0]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x454]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x458]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202C5D4: .word 0x10008004
_0202C5D8: .word UpdateCollectionMenu
_0202C5DC: .word COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateCollectionMenu

	arm_func_start SetCollectionMenuField0x1BC
SetCollectionMenuField0x1BC: ; 0x0202C5E0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1bc]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1BC

	arm_func_start SetCollectionMenuWidth
SetCollectionMenuWidth: ; 0x0202C5F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindow
	ldr r1, [r0, #0xc]
	str r4, [r1, #0x1c0]
	ldrb r0, [r0, #6]
	mov r0, r0, lsl #3
	sub r0, r0, #1
	cmp r4, r0
	strgt r0, [r1, #0x1c0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuWidth

	arm_func_start sub_0202C620
sub_0202C620: ; 0x0202C620
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1ac]
	mov r1, #0
	strb r1, [r0, #0x1b0]
	strb r1, [r0, #0x1b1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C620

	arm_func_start sub_0202C654
sub_0202C654: ; 0x0202C654
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x1ac]
	mov r0, #0
	strb r0, [r4, #0x1b0]
	strb r0, [r4, #0x1b1]
	cmp r5, #0
	bne _0202C6A4
	mov r0, r8
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	str r0, [r4, #0x100]
_0202C6A4:
	add r1, sp, #8
	mov r0, r8
	bl GetWindowRectangle
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, [r4, #0xfc]
	add r3, sp, #8
	add r0, r4, #4
	add r2, r4, #0x100
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0202C654

	arm_func_start sub_0202C6D4
sub_0202C6D4: ; 0x0202C6D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202C6D4

	arm_func_start sub_0202C6F0
sub_0202C6F0: ; 0x0202C6F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	str r5, [r0, #0x1b4]
	str r4, [r0, #0x1b8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C6F0

	arm_func_start CloseCollectionMenu
CloseCollectionMenu: ; 0x0202C70C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseCollectionMenu

	arm_func_start IsCollectionMenuActive
IsCollectionMenuActive: ; 0x0202C728
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuActive

	arm_func_start sub_0202C748
sub_0202C748: ; 0x0202C748
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C748

	arm_func_start sub_0202C75C
sub_0202C75C: ; 0x0202C75C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1b0]
	cmp r1, #0
	beq _0202C78C
	ldrb r1, [r0, #0x1b1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_0202C78C:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C75C

	arm_func_start SetCollectionMenuField0x1C8
SetCollectionMenuField0x1C8: ; 0x0202C794
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1C8

	arm_func_start SetCollectionMenuField0x1A0
SetCollectionMenuField0x1A0: ; 0x0202C7A8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A0

	arm_func_start SetCollectionMenuField0x1A4
SetCollectionMenuField0x1A4: ; 0x0202C7BC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a4]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A4

	arm_func_start SetCollectionMenuVoidFn
SetCollectionMenuVoidFn: ; 0x0202C7D0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuVoidFn

	arm_func_start sub_0202C7E4
sub_0202C7E4: ; 0x0202C7E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x1ac]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x1ac]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C7E4

	arm_func_start UpdateCollectionMenu
UpdateCollectionMenu: ; 0x0202C808
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldrsb r0, [r4, #0x10]
	ldr r5, [r4, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r5, #0x1ac]
	and fp, r1, #0xff
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202CE40
_0202C840: ; jump table
	b _0202C86C ; case 0
	b _0202C884 ; case 1
	b _0202C8C0 ; case 2
	b _0202C918 ; case 3
	b _0202CDC8 ; case 4
	b _0202CE0C ; case 5
	b _0202CE40 ; case 6
	b _0202CE40 ; case 7
	b _0202CCA4 ; case 8
	b _0202CD14 ; case 9
	b _0202CD74 ; case 10
_0202C86C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202CE40
	mov r0, #2
	str r0, [r5, #0x1ac]
_0202C884:
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202C8C0
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202C8A4
	mov r0, r4
	bl sub_0202CEA0
_0202C8A4:
	ldrb r0, [r4, #8]
	bl sub_020287C4
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202C8C0:
	mov r0, r4
	bl sub_0202CEA0
	ldr r0, [r5, #0xfc]
	tst r0, #0x800000
	beq _0202C8F8
	mov r0, #7
	str r0, [r5, #0x1ac]
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C8F8:
	mov r1, #3
	mov r0, #0
	str r1, [r5, #0x1ac]
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #1
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C918:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, #0
	cmp r1, #0
	movne r6, #1
	mov r8, r0
	cmp r1, #0
	bne _0202CA70
	ldr r0, [r5, #0xfc]
	tst r0, #1
	beq _0202CA70
	mov r3, #0
	str r3, [sp]
	ldr r2, _0202CE9C ; =0x00000408
	add r1, sp, #0xc
	add r0, r5, #4
	str r3, [sp, #4]
	bl sub_02032160
	movs r7, r0
	bmi _0202CA70
	ldrb r0, [r5, #0x1b2]
	cmp r0, #0
	beq _0202C994
	add r0, r5, #4
	bl sub_02032578
	cmp r7, r0
	bne _0202CA54
_0202C994:
	ldr r0, [r5, #0x19c]
	cmp r0, #0
	ldrne r0, [sp, #8]
	orrne r0, r0, #4
	orrne r0, r0, #0x400
	strne r0, [sp, #8]
	bne _0202CA60
	ldr r1, [sp, #8]
	add r0, r5, #4
	orr r1, r1, #1
	str r1, [sp, #8]
	ldr r8, [r5, #0xc]
	ldr sb, [r5, #0x10]
	bl sub_02032568
	mov r1, r0
	add r0, r5, #4
	sub r1, r7, r1
	bl sub_020328D8
	ldr r1, [r5, #4]
	add sl, r1, r0
	add r0, r5, #4
	bl sub_02032568
	sub r0, r7, r0
	add r1, r0, #1
	add r0, r5, #4
	bl sub_020328D8
	ldr r2, [r5, #4]
	mov r1, #6
	str r1, [r5, #0xdc]
	sub r1, r1, #7
	str r1, [r5, #0xe0]
	mov r1, #0
	str r1, [r5, #0xe4]
	ldr r1, [r5, #0xc]
	add r0, r2, r0
	sub r1, r8, r1
	str r1, [r5, #0xf0]
	ldr r1, [r5, #0xc]
	sub r0, r0, #2
	sub r1, sb, r1
	str r1, [r5, #0xf4]
	ldr r1, [r5, #4]
	sub r1, sl, r1
	str r1, [r5, #0xe8]
	ldr r1, [r5, #4]
	sub r0, r0, r1
	str r0, [r5, #0xec]
	b _0202CA60
_0202CA54:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
_0202CA60:
	mov r1, r7
	add r0, r5, #4
	bl sub_02032684
	mov r8, #1
_0202CA70:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202CA90
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	bl sub_02033758
	orr r8, r8, r0
_0202CA90:
	add r0, r5, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r5, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r8, r0
	ldreqb r0, [r5, #0x1c4]
	cmpeq r0, #0
	beq _0202CACC
	mov r1, #0
	mov r0, r4
	strb r1, [r5, #0x1c4]
	bl sub_0202CEA0
_0202CACC:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202CB44
	cmp r6, #0
	add r0, r5, #4
	beq _0202CAEC
	bl sub_020324C4
	b _0202CAF0
_0202CAEC:
	bl IsMenuOptionActive
_0202CAF0:
	cmp r0, #0
	beq _0202CB34
	ldr r0, [r5, #0xfc]
	tst r0, #0x80000000
	bne _0202CB10
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202CB10:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB34:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202CC94
_0202CB44:
	tst r0, #2
	beq _0202CB94
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r1, [r5, #0x1a0]
	cmp r1, #0
	beq _0202CB74
	ldrsb r0, [r4, #0x10]
	blx r1
	cmp r0, #0
	bne _0202CE40
_0202CB74:
	mov r0, #1
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #6
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB94:
	tst r0, #0x1000
	beq _0202CBE8
	ldr r1, [r5, #0xfc]
	tst r1, #0x2000
	beq _0202CBE8
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CBC0
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
_0202CBC0:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #8
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CBE8:
	tst r0, #0x2000
	beq _0202CC30
	ldr r1, [r5, #0xfc]
	tst r1, #0x4000
	beq _0202CC30
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #9
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC30:
	tst r0, #0x200
	ldrne r1, [r5, #0x18c]
	cmpne r1, #0
	beq _0202CC74
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #0xa
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC74:
	ldr r1, [r5, #0x19c]
	cmp r1, #0
	beq _0202CC94
	blx r1
	cmp r0, #0
	beq _0202CC94
	mov r0, r4
	bl sub_0202CEA0
_0202CC94:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202CE40
_0202CCA4:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CD04
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CCEC
	mov r0, r4
	bl sub_0202CEA0
_0202CCEC:
	mov r0, #0
	ldr r3, [r5, #0x174]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD04:
	mov r0, #1
	strb r0, [r5, #0x1c5]
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CD14:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CD5C
	mov r0, r4
	bl sub_0202CEA0
_0202CD5C:
	mov r0, #0
	ldr r3, [r5, #0x17c]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD74:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x18c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CDBC
	mov r0, r4
	bl sub_0202CEA0
_0202CDBC:
	ldr r0, [r5, #0x18c]
	blx r0
	b _0202CE40
_0202CDC8:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	bne _0202CE04
	ldr r0, [r5, #0xfc]
	tst r0, #0x400000
	beq _0202CE04
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #7
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CE04:
	mov r0, #5
	str r0, [r5, #0x1ac]
_0202CE0C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r4, #0xb8]
	mov r0, #6
	str r0, [r5, #0x1ac]
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE40:
	mov r0, #0
	strb r0, [r5, #0x1c6]
	cmp fp, #0
	beq _0202CE6C
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202CE6C
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE6C:
	ldr r0, [r5, #0x1a8]
	cmp r0, #0
	ldrne r0, [r5, #0x1ac]
	cmpne r0, #8
	cmpne r0, #9
	beq _0202CE94
	add r0, r5, #4
	bl sub_02032578
	ldr r1, [r5, #0x1a8]
	blx r1
_0202CE94:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202CE9C: .word 0x00000408
	arm_func_end UpdateCollectionMenu

	arm_func_start sub_0202CEA0
sub_0202CEA0: ; 0x0202CEA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x410
	mov r5, r0
	ldr r6, [r5, #0xc]
	add r0, r6, #4
	bl sub_02032568
	mov r7, r0
	add r0, r6, #4
	bl sub_02032594
	ldr r1, [r6, #0xfc]
	mov r8, r0
	tst r1, #0x200
	ldrne r0, [r6, #0x160]
	addne r4, r0, r7
	ldrsb r0, [r5, #0x10]
	moveq r4, #0
	bl sub_02027B1C
	mov sb, #0
	mov fp, #0x42
	b _0202D020
_0202CEF0:
	ldr r3, [r6, #0x198]
	add r0, sp, #0x10
	mov r1, r7
	add r2, sp, #0xc
	blx r3
	mov sl, r0
	cmp r4, #0
	mov r1, #0
	beq _0202CF24
	ldrb r0, [r4]
	add r4, r4, #1
	tst r0, #2
	movne r1, #1
_0202CF24:
	cmp sl, #0
	beq _0202CFF4
	cmp r1, #0
	add r0, r6, #4
	mov r1, sb
	beq _0202CF6C
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp, #4]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #8]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026428
	b _0202CF94
_0202CF6C:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #4]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026358
_0202CF94:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0202D018
	ldr r1, [r6, #0x104]
	mov sl, #0xc
	cmp r1, #0
	ble _0202CFBC
	ldr r0, [r6, #0xfc]
	tst r0, #0x400
	subne sl, r1, #2
_0202CFBC:
	add r0, r6, #4
	mov r1, sb
	bl sub_020328D8
	str sl, [sp]
	mov r1, #0x24
	str r1, [sp, #4]
	mov r2, r0
	ldr sl, [r6, #0x1bc]
	ldr r3, [r6, #0x1c0]
	ldrsb r0, [r5, #0x10]
	sub r1, sl, #4
	sub r3, r3, sl
	bl sub_02025D90
	b _0202D018
_0202CFF4:
	ldrb r0, [r6, #0x1c8]
	cmp r0, #0
	beq _0202D018
	str sb, [r6, #0xc4]
	ldr r0, [r6, #0xc0]
	cmp r0, sb
	subge r0, sb, #1
	strge r0, [r6, #0xc0]
	b _0202D028
_0202D018:
	add sb, sb, #1
	add r7, r7, #1
_0202D020:
	cmp sb, r8
	blt _0202CEF0
_0202D028:
	ldr r4, [r6, #0x1a4]
	cmp r4, #0
	beq _0202D04C
	ldrsb r0, [r5, #0x10]
	mov r3, sb
	add r1, r6, #4
	sub r2, r7, sb
	blx r4
	b _0202D058
_0202D04C:
	ldrsb r1, [r5, #0x10]
	add r0, r6, #4
	bl sub_0202A03C
_0202D058:
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	add sp, sp, #0x410
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202CEA0

	arm_func_start sub_0202D068
sub_0202D068: ; 0x0202D068
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D068

	arm_func_start sub_0202D07C
sub_0202D07C: ; 0x0202D07C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	ldr r1, [r0, #0xfc]
	ands r2, r1, #0x10000000
	cmpne r4, #0
	beq _0202D0B0
	eor r1, r1, #0x10000000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	mov r1, #0x10000000
	bl sub_02031C84
	ldmia sp!, {r4, pc}
_0202D0B0:
	cmp r2, #0
	cmpeq r4, #0
	ldmneia sp!, {r4, pc}
	ldr r2, [r0, #0xfc]
	mov r1, #0x10000000
	orr r2, r2, #0x10000000
	str r2, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D07C

	arm_func_start SetCollectionMenuField0x1B2
SetCollectionMenuField0x1B2: ; 0x0202D0D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1b2]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1B2

	arm_func_start sub_0202D0EC
sub_0202D0EC: ; 0x0202D0EC
	stmdb sp!, {r3, r4, r5, lr}
	bl GetWindowContents
	mov r5, r0
	add r0, r5, #4
	bl sub_02032558
	mov r4, r0
	add r0, r5, #4
	bl sub_02032568
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D0EC

	arm_func_start IsCollectionMenuState3
IsCollectionMenuState3: ; 0x0202D114
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuState3

	arm_func_start sub_0202D134
sub_0202D134: ; 0x0202D134
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1b0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1b1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1ac]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D134

	arm_func_start sub_0202D16C
sub_0202D16C: ; 0x0202D16C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	ldr r0, [r4, #0xfc]
	beq _0202D1BC
	tst r0, #0x10000000
	ldmeqia sp!, {r3, r4, r5, pc}
	bic r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C84
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
_0202D1BC:
	tst r0, #0x10000000
	ldmneia sp!, {r3, r4, r5, pc}
	orr r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C74
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D16C

	arm_func_start CreateOptionsMenu
CreateOptionsMenu: ; 0x0202D1F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x12c
	mov r5, r1
	orr r5, r5, #4
	mov r1, #0
	str r1, [sp, #8]
	tst r5, #0x8000
	mov sl, r3
	mov r4, r2
	mov r6, r0
	ldr r8, [sp, #0x154]
	orrne r5, r5, #0x20000
	mov r2, sl
	ldr r1, [sp, #8]
	b _0202D238
_0202D22C:
	add r1, r1, #1
	str r1, [sp, #8]
	add r2, r2, #0xc
_0202D238:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0202D22C
	ldr r1, [sp, #8]
	mov r0, #0x10c
	add r1, r1, #1
	mul r0, r1, r0
	mov r1, #8
	bl MemAlloc
	mov fp, r0
	mov r7, fp
	and sb, r5, #0x20
	b _0202D300
_0202D26C:
	mov r0, r7
	bl GetStringFromFileVeneer
	ldr r0, [sl, #8]
	str r0, [r7, #0x100]
	ldr r0, [sl, #8]
	cmp r0, #0
	beq _0202D2C4
	ldr r1, [r7, #0x100]
	mov r2, #0
	b _0202D298
_0202D294:
	add r2, r2, #1
_0202D298:
	ldrh r0, [r1], #2
	cmp r0, #0
	bne _0202D294
	ldr r0, [sl, #4]
	cmp r0, #0
	streq r2, [r7, #0x104]
	beq _0202D2CC
	cmp r0, r2
	movle r2, r0
	str r2, [r7, #0x104]
	b _0202D2CC
_0202D2C4:
	ldr r0, [sl, #4]
	str r0, [r7, #0x104]
_0202D2CC:
	cmp sb, #0
	beq _0202D2EC
	ldr r1, [r8]
	ldr r0, [r7, #0x104]
	cmp r1, r0
	movge r1, #0
	str r1, [r7, #0x108]
	b _0202D2F4
_0202D2EC:
	mov r0, #0
	str r0, [r7, #0x108]
_0202D2F4:
	add sl, sl, #0xc
	add r7, r7, #0x10c
	add r8, r8, #4
_0202D300:
	ldrh r1, [sl]
	cmp r1, #0
	bne _0202D26C
	mov r2, #0
	strb r2, [r7]
	str r2, [r7, #0x100]
	str r2, [r7, #0x104]
	mov r0, #0x1b8
	mov r1, #8
	str r2, [r7, #0x108]
	bl MemAlloc
	cmp r6, #0
	mov r7, r0
	addne sb, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia sb, {r0, r1, r2, r3}
	ldrne r0, _0202D528 ; =UpdateOptionsMenu
	mov r8, fp
	strne r0, [sp, #0x1c]
	bne _0202D364
	ldr r0, _0202D52C ; =OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202D364:
	mov r6, #0
	mov sb, r6
	str r7, [sp, #0x28]
	b _0202D3CC
_0202D374:
	mov r0, r8
	bl sub_020265A8
	cmp r0, r6
	ldr sl, [r8, #0x100]
	movgt r6, r0
	cmp sl, #0
	beq _0202D3C0
	b _0202D3B0
_0202D394:
	ldrh r1, [sl], #2
	add r0, sp, #0x2c
	bl GetStringFromFileVeneer
	add r0, sp, #0x2c
	bl sub_020265A8
	cmp r0, sb
	movgt sb, r0
_0202D3B0:
	ldrh r0, [sl]
	cmp r0, #0
	bne _0202D394
	b _0202D3C8
_0202D3C0:
	cmp sb, #0x30
	movlt sb, #0x30
_0202D3C8:
	add r8, r8, #0x10c
_0202D3CC:
	mov r0, r8
	bl IsEmptyString
	cmp r0, #0
	beq _0202D374
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	bne _0202D400
	add r2, r6, sb
	mov r0, r5
	mov r1, r4
	add r2, r2, #0x34
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202D400:
	str r6, [r7, #0x1a8]
	add r0, sb, #4
	str r0, [r7, #0x1ac]
	ldr r0, [r7, #0x1a8]
	add r2, sp, #8
	add r1, r0, #0x15
	str r1, [r7, #0x1b0]
	ldr r0, [r7, #0x1ac]
	add r3, sp, #0x150
	add r0, r1, r0
	add r0, r0, #0xe
	str r0, [r7, #0x1b4]
	ldr r0, [sp, #0x150]
	cmp r0, #0
	ldreq r0, [sp, #8]
	streq r0, [sp, #0x150]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, r5
	bne _0202D460
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202D468
_0202D460:
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
_0202D468:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202D528 ; =UpdateOptionsMenu
	cmp r4, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202D4C4
	add r8, r7, #0x100
	mov r6, #9
_0202D4AC:
	ldmia r4!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202D4AC
	ldmia r4, {r0, r1}
	stmia r8, {r0, r1}
_0202D4C4:
	ldr r0, [sp, #0x154]
	str fp, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [r7, #0x1a5]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x150]
	mov r1, r5
	add r0, r7, #4
	add r2, r7, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x12c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202D528: .word UpdateOptionsMenu
_0202D52C: .word OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateOptionsMenu

	arm_func_start CloseOptionsMenu
CloseOptionsMenu: ; 0x0202D530
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseOptionsMenu

	arm_func_start IsOptionsMenuActive
IsOptionsMenuActive: ; 0x0202D55C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsOptionsMenuActive

	arm_func_start CheckOptionsMenuField0x1A4
CheckOptionsMenuField0x1A4: ; 0x0202D57C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckOptionsMenuField0x1A4

	arm_func_start sub_0202D59C
sub_0202D59C: ; 0x0202D59C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202D59C

	arm_func_start sub_0202D5B0
sub_0202D5B0: ; 0x0202D5B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	ldr r4, [r0, #0x198]
	b _0202D5D0
_0202D5C4:
	ldr r0, [r4, #0x108]
	add r4, r4, #0x10c
	str r0, [r5], #4
_0202D5D0:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202D5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D5B0

	arm_func_start sub_0202D5E4
sub_0202D5E4: ; 0x0202D5E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202D610
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202D610:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202D5E4

	arm_func_start UpdateOptionsMenu
UpdateOptionsMenu: ; 0x0202D618
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202DA5C
_0202D638: ; jump table
	b _0202D650 ; case 0
	b _0202D668 ; case 1
	b _0202D690 ; case 2
	b _0202D6E8 ; case 3
	b _0202D9EC ; case 4
	b _0202DA30 ; case 5
_0202D650:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202DA5C
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202D668:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202D690
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202D690:
	mov r0, r7
	bl sub_0202DA64
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202D6C8
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6C8:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6E8:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202D760
	ldr r3, [r4, #0x1b0]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D760
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r1, r6
	orr r2, r0, #0x40
	add r0, r4, #4
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D760:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7C0
	ldr r3, [r4, #0x1b4]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D7C0
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r1, [sp, #8]
	add r0, r4, #4
	orr r2, r1, #0x80
	add r1, r6, #0x3e8
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D7C0:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7E0
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202D7E0:
	add r0, r4, #4
	bl sub_02032578
	ldr r2, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	mov r1, #0x10c
	mla r6, r0, r1, r3
	tst r2, #0x200
	ldrne r1, [r4, #0x160]
	ldrneb r0, [r1, r0]
	moveq r0, #0
	and r0, r0, #0xff
	tst r0, #1
	bne _0202D8E8
	ldr r0, [sp, #8]
	tst r0, #0x40
	beq _0202D878
	ldr r0, [r6, #0x108]
	cmp r0, #0
	add r0, r4, #4
	ble _0202D86C
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D85C
	subs r0, r0, #0xa
	str r0, [r6, #0x108]
	movmi r0, #0
	strmi r0, [r6, #0x108]
	b _0202D864
_0202D85C:
	sub r0, r0, #1
	str r0, [r6, #0x108]
_0202D864:
	mov r5, #1
	b _0202D900
_0202D86C:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D878:
	tst r0, #0x80
	beq _0202D900
	ldr r0, [r6, #0x104]
	ldr r1, [r6, #0x108]
	sub r0, r0, #1
	cmp r1, r0
	add r0, r4, #4
	bge _0202D8DC
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D8CC
	add r1, r0, #0xa
	str r1, [r6, #0x108]
	ldr r0, [r6, #0x104]
	sub r0, r0, #1
	cmp r1, r0
	strgt r0, [r6, #0x108]
	b _0202D8D4
_0202D8CC:
	add r0, r0, #1
	str r0, [r6, #0x108]
_0202D8D4:
	mov r5, #1
	b _0202D900
_0202D8DC:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D8E8:
	ldr r0, [sp, #8]
	tst r0, #0xc0
	beq _0202D900
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202D900:
	cmp r5, #0
	beq _0202D910
	mov r0, r7
	bl sub_0202DA64
_0202D910:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [r4, #0x198]
	mov r0, #0x10c
	mla r0, r2, r0, r1
	ldr r1, [sp, #8]
	ldr r3, [r0, #0x108]
	add r0, r4, #4
	bl sub_020323F8
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202D9AC
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202D9DC
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202D96C
_0202D960:
	ldr r0, [r5, #0x108]
	add r5, r5, #0x10c
	str r0, [r6], #4
_0202D96C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202D960
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202D9DC
_0202D9AC:
	tst r0, #2
	beq _0202D9DC
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202D9DC:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202DA5C
_0202D9EC:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202DA28
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202DA28
	mov r0, r7
	bl sub_0202DA64
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202DA28:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202DA30:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202DA5C:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateOptionsMenu

	arm_func_start sub_0202DA64
sub_0202DA64: ; 0x0202DA64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x160
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r2, [r4, #0xfc]
	str r0, [sp, #0xc]
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne sb, r0, r5
	mov r1, #0x10c
	add r0, r4, #4
	mla r6, r5, r1, r3
	moveq sb, #0
	bl sub_020320C0
	mov fp, r0
	ldrsb r0, [sl, #0x10]
	bl sub_02027B1C
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _0202DC1C
	b _0202DC10
_0202DAD4:
	add r0, r4, #4
	mov r1, r7
	bl sub_020328D8
	mov r8, r0
	mov r0, #1
	cmp sb, #0
	mov r1, #0
	str r0, [sp, #8]
	beq _0202DB14
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
	tst r0, #1
	movne r0, #0
	strne r0, [sp, #8]
_0202DB14:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and r0, r0, #0xff
	str r0, [sp, #4]
	str r0, [sp]
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r2, r8
	mov r3, r6
	bl sub_020263C8
	ldr r2, [r6, #0x100]
	add r0, sp, #0x60
	cmp r2, #0
	ldr r1, [r6, #0x108]
	beq _0202DB64
	mov r1, r1, lsl #1
	ldrh r1, [r2, r1]
	bl GetStringFromFileVeneer
	b _0202DB80
_0202DB64:
	str r1, [sp, #0x34]
	add r1, sp, #0x10
	str r1, [sp]
	ldr r2, _0202DC38 ; =_0209AEE0
	ldr r3, _0202DC3C ; =0x0000C402
	mov r1, #0x100
	bl PreprocessString
_0202DB80:
	add r0, sp, #0x60
	bl sub_020265A8
	ldr r1, [sp, #4]
	mov ip, r0
	str r1, [sp]
	ldr r3, [r4, #0x1ac]
	ldr r1, [r4, #0x1b0]
	sub r3, r3, ip
	add r3, r3, r3, lsr #31
	add r1, r1, r3, asr #1
	ldrsb r0, [sl, #0x10]
	mov r2, r8
	add r1, r1, #0xe
	add r3, sp, #0x60
	bl sub_020263C8
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0202DC04
	cmp r5, fp
	ldreq r3, _0202DC40 ; =_0209AEEC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC44 ; =_0209AEF4
	ldr r1, [r4, #0x1b0]
	mov r2, r8
	bl DrawTextInWindow
	add r0, r5, #0x3e8
	cmp r0, fp
	ldreq r3, _0202DC48 ; =_0209AEFC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC4C ; =_0209AF04
	ldr r1, [r4, #0x1b4]
	mov r2, r8
	bl DrawTextInWindow
_0202DC04:
	add r7, r7, #1
	add r5, r5, #1
	add r6, r6, #0x10c
_0202DC10:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0202DAD4
_0202DC1C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x160
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DC38: .word _0209AEE0
_0202DC3C: .word 0x0000C402
_0202DC40: .word _0209AEEC
_0202DC44: .word _0209AEF4
_0202DC48: .word _0209AEFC
_0202DC4C: .word _0209AF04
	arm_func_end sub_0202DA64

	arm_func_start CreateDebugMenu
CreateDebugMenu: ; 0x0202DC50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r7, r3
	mov r5, r1
	mov sl, r2
	mov r8, r0
	mov r1, r7
	mov r2, #0
	b _0202DC7C
_0202DC74:
	add r1, r1, #2
	add r2, r2, #1
_0202DC7C:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202DC74
	add r0, r2, #1
	add r0, r0, r0, lsl #8
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r6, r4
	b _0202DCB8
_0202DCA4:
	mov r0, r6
	bl GetStringFromFileVeneer
	add r0, r6, #1
	add r7, r7, #2
	add r6, r0, #0x100
_0202DCB8:
	ldrh r1, [r7]
	cmp r1, #0
	bne _0202DCA4
	mov r0, #0
	strb r0, [r6]
	ldr r2, [sp, #0x58]
	mov r0, #0x3b4
	mov r1, #8
	str r2, [sp, #0xc]
	bl MemAlloc
	mov r1, #0
	cmp r8, #0
	addne fp, sp, #0x10
	mov r7, r0
	str r1, [sp, #8]
	ldmneia r8, {r0, r1, r2, r3}
	stmneia fp, {r0, r1, r2, r3}
	ldrne r0, _0202DEE8 ; =UpdateDebugMenu
	mov sb, r4
	orr r5, r5, #4
	ldr r6, [sp, #0x5c]
	strne r0, [sp, #0x10]
	bne _0202DD28
	ldr r0, _0202DEEC ; =DEBUG_MENU_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x10
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202DD28:
	str r7, [sp, #0x1c]
	mov r8, #0
	b _0202DD4C
_0202DD34:
	mov r0, sb
	bl sub_020265A8
	cmp r0, r8
	movgt r8, r0
	add r0, sb, #1
	add sb, r0, #0x100
_0202DD4C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD34
	ldrb r0, [sp, #0x16]
	cmp r0, #0
	bne _0202DD7C
	mov r0, r5
	mov r1, sl
	add r2, r8, #0x40
	bl sub_02031A5C
	strb r0, [sp, #0x16]
_0202DD7C:
	str r8, [r7, #0x1a8]
	mov sb, r4
	and r8, r5, #0x20
	mov fp, #0
	b _0202DDB8
_0202DD90:
	cmp r8, #0
	ldrneb r0, [r6]
	add r6, r6, #1
	strneb r0, [sb, #0x100]
	streqb fp, [sb, #0x100]
	ldr r1, [sp, #8]
	add r0, sb, #1
	add r1, r1, #1
	str r1, [sp, #8]
	add sb, r0, #0x100
_0202DDB8:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD90
	ldrb r0, [sp, #0x17]
	add r2, sp, #8
	add r3, sp, #0xc
	cmp r0, #0
	mov r0, r5
	bne _0202DDF0
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x17]
	b _0202DDF8
_0202DDF0:
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
_0202DDF8:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x14]
	ldrneb r0, [sp, #0x16]
	subne r0, r1, r0
	strneb r0, [sp, #0x14]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x15]
	ldrneb r0, [sp, #0x17]
	subne r0, r1, r0
	strneb r0, [sp, #0x15]
	ldr r0, _0202DEE8 ; =UpdateDebugMenu
	cmp sl, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202DE54
	add r8, r7, #0x100
	mov r6, #9
_0202DE3C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202DE3C
	ldmia sl, {r0, r1}
	stmia r8, {r0, r1}
_0202DE54:
	ldr r0, [sp, #0x5c]
	str r4, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
#ifdef JAPAN
	add r0, r7, #0x1ac
	mov r1, #0x3bc
#else
	ldr r1, _0202DEF0 ; =0x00003C65
	add r0, r7, #0x1ac
#endif
	strb r2, [r7, #0x1a5]
	bl GetStringFromFileVeneer
	ldr r1, _0202DEF4 ; =0x00003C66
	add r0, r7, #0x2ac
	bl GetStringFromFileVeneer
	add r0, r7, #0x1ac
	bl sub_020265A8
	str r0, [r7, #0x3ac]
	add r0, r7, #0x2ac
	bl sub_020265A8
	str r0, [r7, #0x3b0]
	add r0, sp, #0x10
	mov r1, #3
	bl NewWindowScreenCheck
	add r1, sp, #0x20
	mov r6, r0
	bl GetWindowRectangle
	ldr r2, [sp, #8]
	mov r1, r5
	str r2, [sp]
	ldr r4, [sp, #0xc]
	add r0, r7, #4
	add r2, r7, #0x100
	add r3, sp, #0x20
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DEE8: .word UpdateDebugMenu
_0202DEEC: .word DEBUG_MENU_DEFAULT_WINDOW_PARAMS
#if defined(EUROPE)
_0202DEF0: .word 0x00003C67
_0202DEF4: .word 0x00003C68
#elif defined(JAPAN)
_0202DEF4: .word 0x000003BD
#else
_0202DEF0: .word 0x00003C65
_0202DEF4: .word 0x00003C66
#endif
	arm_func_end CreateDebugMenu

	arm_func_start CloseDebugMenu
CloseDebugMenu: ; 0x0202DEF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseDebugMenu

	arm_func_start IsDebugMenuActive
IsDebugMenuActive: ; 0x0202DF24
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsDebugMenuActive

	arm_func_start CheckDebugMenuField0x1A4
CheckDebugMenuField0x1A4: ; 0x0202DF44
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckDebugMenuField0x1A4

	arm_func_start sub_0202DF64
sub_0202DF64: ; 0x0202DF64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202DF90
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202DF90:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202DF64

	arm_func_start UpdateDebugMenu
UpdateDebugMenu: ; 0x0202DF98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202E294
_0202DFB8: ; jump table
	b _0202DFD0 ; case 0
	b _0202DFE8 ; case 1
	b _0202E010 ; case 2
	b _0202E068 ; case 3
	b _0202E224 ; case 4
	b _0202E268 ; case 5
_0202DFD0:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202E294
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202DFE8:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202E010
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E010:
	mov r0, r7
	bl sub_0202E29C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202E048
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202E294
_0202E048:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202E294
_0202E068:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202E0CC
	mov r3, #0
	add r1, sp, #0xc
	str r3, [sp]
	mov r6, #1
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202E0CC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, r6
	orr r0, r0, #0x2000
	str r0, [sp, #8]
_0202E0CC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202E0EC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202E0EC:
	add r0, r4, #4
	bl sub_02032578
	ldr r1, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	tst r1, #0x200
	ldrne r1, [r4, #0x160]
	add r2, r0, r0, lsl #8
	ldrneb r1, [r1, r0]
	ldr r0, [sp, #8]
	add r6, r3, r2
	moveq r1, #0
	and r1, r1, #0xff
	tst r0, #0x2200
	beq _0202E15C
	tst r1, #1
	add r0, r4, #4
	bne _0202E154
	mov r1, #3
	bl PlayWindowInputSound
	ldrb r0, [r6, #0x100]
	mov r5, #1
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r6, #0x100]
	b _0202E15C
_0202E154:
	mov r1, #2
	bl PlayWindowInputSound
_0202E15C:
	cmp r5, #0
	beq _0202E16C
	mov r0, r7
	bl sub_0202E29C
_0202E16C:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202E1E4
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202E214
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202E1A4
_0202E194:
	ldrb r1, [r5, #0x100]
	add r0, r5, #1
	add r5, r0, #0x100
	strb r1, [r6], #1
_0202E1A4:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202E194
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202E214
_0202E1E4:
	tst r0, #2
	beq _0202E214
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202E214:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202E294
_0202E224:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202E260
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202E260
	mov r0, r7
	bl sub_0202E29C
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E260:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202E268:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202E294:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateDebugMenu

	arm_func_start sub_0202E29C
sub_0202E29C: ; 0x0202E29C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r7, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r5, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r2, r7, r7, lsl #8
	ldrsb r0, [sl, #0x10]
	add r6, r3, r2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202E3B0
	add r0, r4, #0x1ac
	str r0, [sp, #8]
	b _0202E3A8
_0202E304:
	add r0, r4, #4
	mov r1, r7
	bl sub_020328D8
	str r0, [sp, #4]
	ldrb r0, [r6, #0x100]
	mov r1, #0
	cmp r0, #0
	movne sb, #1
	moveq sb, #0
	cmp r8, #0
	beq _0202E340
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202E340:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and fp, r0, #0xff
	str fp, [sp]
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	str fp, [sp]
	add r3, r4, sb, lsl #2
	ldr fp, [r3, #0x3ac]
	ldr r3, [sp, #8]
	ldr r1, [r4, #0x1a8]
	add r3, r3, sb, lsl #8
	rsb sb, fp, #0x30
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	add r1, r1, #0xd
	add sb, sb, sb, lsr #31
	add r1, r1, sb, asr #1
	bl sub_020263C8
	add r0, r6, #1
	add r7, r7, #1
	add r6, r0, #0x100
_0202E3A8:
	cmp r7, r5
	blt _0202E304
_0202E3B0:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202E29C

	arm_func_start CreateScrollBoxSingle
CreateScrollBoxSingle: ; 0x0202E3CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	ldr r0, _0202E508 ; =0x00001D6C
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	cmp r8, #0
	ldreq r0, _0202E50C ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E510 ; =UpdateScrollBox
	ldr r1, _0202E510 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E514 ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, r7, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r6, #0
	beq _0202E45C
	add ip, r4, #0x100
	mov r7, #9
_0202E444:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _0202E444
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_0202E45C:
	ldr r7, [sp, #0x28]
	add r0, r4, #0x100
	strh r5, [r0, #0xa0]
	cmp r7, #0
	beq _0202E48C
	add r6, r4, #0x1a8
	mov r5, #5
_0202E478:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E478
	b _0202E494
_0202E48C:
	add r0, r4, #0x1a8
	bl InitPreprocessorArgs
_0202E494:
	mov r0, #1
	ldr r7, [sp, #0x30]
	ldrh r1, [sp, #0x2c]
	str r0, [r4, #0x198]
	mov r0, #0
	str r0, [r4, #0x19c]
	add r0, r4, #0x200
	strh r1, [r0, #0xe8]
	cmp r7, #0
	beq _0202E4D8
	add r6, r4, #0x2f0
	mov r5, #5
_0202E4C4:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E4C4
	b _0202E4E0
_0202E4D8:
	add r0, r4, #0x2f0
	bl InitPreprocessorArgs
_0202E4E0:
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202E508: .word 0x00001D6C
_0202E50C: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E510: .word UpdateScrollBox
_0202E514: .word 0x0D0C8012
	arm_func_end CreateScrollBoxSingle

	arm_func_start CreateScrollBoxMulti
CreateScrollBoxMulti: ; 0x0202E518
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r2
	ldr r2, [sp, #0x44]
	mov sl, r1
	ldr r0, _0202E6A0 ; =0x00001D6C
	mov r1, #8
	mov sb, r3
	ldr r8, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	ldr fp, [sp, #0x40]
	str r2, [sp, #0x44]
	bl MemAlloc
	cmp r6, #0
	mov r4, r0
	ldreq r0, _0202E6A4 ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	addeq r6, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r6, {r0, r1, r2, r3}
	addne ip, sp, #0
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E6A8 ; =UpdateScrollBox
	ldr r1, _0202E6A8 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E6AC ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, sl, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r5, #0
	beq _0202E5C0
	add sl, r4, #0x100
	mov r6, #9
_0202E5A8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202E5A8
	ldmia r5, {r0, r1}
	stmia sl, {r0, r1}
_0202E5C0:
	str sb, [r4, #0x198]
	mov r6, #0
	str r6, [r4, #0x19c]
	b _0202E670
_0202E5D0:
	mov r0, #0x50
	mul r5, r6, r0
	mov r1, r6, lsl #1
	add r0, r4, r6, lsl #1
	ldrh r1, [r8, r1]
	add r0, r0, #0x100
	adds sl, r7, r5
	strh r1, [r0, #0xa0]
	beq _0202E614
	add r0, r4, r5
	add lr, r0, #0x1a8
	mov ip, #5
_0202E600:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202E600
	b _0202E620
_0202E614:
	add r0, r4, #0x1a8
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E620:
	mov r0, r6, lsl #1
	ldrh r1, [fp, r0]
	add r0, r4, r6, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0xe8]
	ldr r0, [sp, #0x44]
	adds sl, r0, r5
	beq _0202E660
	add r0, r4, r5
	add ip, r0, #0x2f0
	mov r5, #5
_0202E64C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E64C
	b _0202E66C
_0202E660:
	add r0, r4, #0x2f0
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E66C:
	add r6, r6, #1
_0202E670:
	cmp r6, sb
	blt _0202E5D0
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202E6A0: .word 0x00001D6C
_0202E6A4: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E6A8: .word UpdateScrollBox
_0202E6AC: .word 0x0D0C8012
	arm_func_end CreateScrollBoxMulti

	arm_func_start SetScrollBoxState7
SetScrollBoxState7: ; 0x0202E6B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
	ldmia sp!, {r3, pc}
	arm_func_end SetScrollBoxState7

	arm_func_start CloseScrollBox
CloseScrollBox: ; 0x0202E6C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseScrollBox

	arm_func_start IsScrollBoxActive
IsScrollBoxActive: ; 0x0202E6E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsScrollBoxActive

	arm_func_start UpdateScrollBox
UpdateScrollBox: ; 0x0202E708
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	mov r4, r0
	ldr r5, [r4, #0xc]
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202EE74
_0202E72C: ; jump table
	b _0202E74C ; case 0
	b _0202E768 ; case 1
	b _0202E768 ; case 2
	b _0202E768 ; case 3
	b _0202E998 ; case 4
	b _0202E9C0 ; case 5
	b _0202EE38 ; case 6
	b _0202EE54 ; case 7
_0202E74C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202EE74
	add r0, r5, #0x1000
	mov r1, #1
	str r1, [r0, #0x464]
_0202E768:
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #1
	beq _0202E788
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
_0202E788:
	add r0, r5, #0x34
	ldr r2, [r5, #0x430]
	ldr r1, _0202EE7C ; =0x0000040C
	add r0, r0, #0x400
	add r3, r5, #0x16c
	mla r6, r2, r1, r0
	cmp r2, #0
	add r7, r3, #0x1800
	mov r8, #0
	bne _0202E850
	ldr sl, [r5, #0x19c]
	add r0, r5, sl, lsl #1
	add r0, r0, #0x100
	ldrh r2, [r0, #0xa0]
	cmp r2, #0
	addeq r0, r5, #0x1000
	streqb r8, [r0, #0x56c]
	beq _0202E7F0
	add r1, r5, #0x1a8
	mov r0, #0x50
	mla sb, sl, r0, r1
	mov r1, #0x400
	add r0, r3, #0x1400
	add r3, r1, #4
	str sb, [sp]
	bl PreprocessStringFromId
_0202E7F0:
	ldr r2, [r5, #0x19c]
	mov r0, #0x50
	mla r1, r2, r0, r5
	add r0, r5, #0x6c
	add fp, r1, #0x2f0
	add sl, r0, #0x1400
	mov sb, #5
_0202E80C:
	ldmia fp!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _0202E80C
	ldr r0, [r5, #0x19c]
	add r1, r5, #0x1000
	add r0, r5, r0, lsl #1
	add r0, r0, #0x200
	ldrh r0, [r0, #0xe8]
	strh r0, [r6]
	ldr r0, [r1, #0x464]
	cmp r0, #1
	moveq r0, #0
	streq r0, [r6, #4]
	subeq r0, r0, #1
	streq r0, [r6, #8]
	b _0202E85C
_0202E850:
	add r0, r3, #0x1400
	add r1, r6, #0xc
	bl strcpy
_0202E85C:
	ldr r0, [r5, #0xfc]
	ldr r1, _0202EE80 ; =0x000001AF
	orr r0, r0, #0x800
	str r0, [r5, #0xfc]
	add r0, r5, #0x100
	strh r1, [r0, #8]
	mov r0, #0x10
	add r3, r5, #0x16c
	str r0, [r5, #0x10c]
	add r0, r3, #0x1400
	str r0, [r5, #0x148]
	ldrh sb, [r6]
	add r0, r5, #0x1000
	add r2, r5, #0x6c
	str sb, [r0, #0x4a0]
	add r0, r2, #0x1400
	str r0, [sp]
	ldrh r2, [r6]
	mov r1, #0x400
	add r0, r3, #0x1800
	add r3, r1, #4
	bl PreprocessStringFromId
	add r0, r5, #0xc4
	add sb, r0, #0x1400
	b _0202E8E0
_0202E8C0:
	add r0, r5, r8, lsl #2
	add r2, r0, #0x1000
	add r1, sb, r8, lsl #2
	mov r0, r7
	str r7, [r2, #0x4e4]
	add r8, r8, #1
	bl sub_02021F44
	mov r7, r0
_0202E8E0:
	cmp r7, #0
	bne _0202E8C0
	add r0, r5, #0x1000
	str r8, [r0, #0x4bc]
	ldr r1, [r0, #0x464]
	cmp r1, #3
	ldreq r1, [r6, #4]
	movne r1, #0
	str r1, [r0, #0x4c0]
	ldr r1, [r5, #0xfc]
	add r0, r5, #0x1000
	orr r1, r1, #8
	str r1, [r5, #0xfc]
	ldr r0, [r0, #0x4bc]
	add r1, sp, #0x38
	cmp r0, #1
	ldrle r0, [r5, #0xfc]
	eorle r0, r0, #8
	strle r0, [r5, #0xfc]
	ldrsb r0, [r4, #0x10]
	bl GetWindowRectangle
	ldr r0, [r5, #0x430]
	add r3, sp, #0x38
	cmp r0, #0
	mov r0, #1
	bne _0202E974
	ldr r1, [r5, #0x198]
	add r2, r5, #0x100
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	bl InitWindowInput
	ldr r1, [r5, #0x19c]
	add r0, r5, #4
	bl sub_02032684
	b _0202E98C
_0202E974:
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	add r2, r5, #0x100
	bl InitWindowInput
_0202E98C:
	add r0, r5, #0x1000
	mov r1, #4
	str r1, [r0, #0x464]
_0202E998:
	mov r0, r4
	bl sub_0202EE88
	mov r1, #0
	add r0, r5, #0x1000
	mov r2, #5
	str r2, [r0, #0x464]
	strb r1, [r0, #0x468]
	sub r0, r1, #1
	str r0, [r4, #0xb8]
	b _0202EE74
_0202E9C0:
	add r0, r5, #0x34
	add r8, r0, #0x400
	ldr r7, [r5, #0x430]
	ldr r6, _0202EE7C ; =0x0000040C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	mov r3, #1
	mla r6, r7, r6, r8
	bl sub_02031C98
	mov r7, r0
	add r0, r5, #4
	bl sub_02032560
	mov fp, r0
	add r2, r5, #0x1000
	mov r0, #0
	mov r1, #0x13
	ldr r8, [r2, #0x4c0]
	bl sub_02031914
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	mov sb, r0
	cmp r1, #1
	ble _0202EA70
	tst sb, #0x10
	beq _0202EA48
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	subs r8, r8, #1
	addmi r0, r5, #0x1000
	ldrmi r0, [r0, #0x4bc]
	submi r8, r0, #1
	b _0202EA70
_0202EA48:
	tst sb, #0x20
	beq _0202EA70
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	add r0, r5, #0x1000
	ldr r0, [r0, #0x4bc]
	add r8, r8, #1
	cmp r8, r0
	movge r8, #0
_0202EA70:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202EA98
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202EB54
_0202EA98:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	beq _0202EAC0
	str r8, [r0, #0x4c0]
	str r8, [r6, #4]
	mvn r0, #0
	str r0, [r6, #8]
	mov r7, #1
	b _0202EB54
_0202EAC0:
	ldr r2, [r0, #0x504]
	cmp r2, #0
	ble _0202EB54
	ldr r0, [sp, #0x14]
	tst r0, #0x2000
	beq _0202EB10
	ldr r0, [r6, #8]
	cmp r0, #0
	sublt r0, r2, #1
	strlt r0, [r6, #8]
	blt _0202EAFC
	mvneq r0, #0
	streq r0, [r6, #8]
	subne r0, r0, #1
	strne r0, [r6, #8]
_0202EAFC:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
	b _0202EB54
_0202EB10:
	tst r0, #0x1000
	beq _0202EB54
	ldr r1, [r6, #8]
	cmp r1, #0
	movlt r0, #0
	strlt r0, [r6, #8]
	blt _0202EB44
	sub r0, r2, #1
	cmp r1, r0
	mvnge r0, #0
	strge r0, [r6, #8]
	addlt r0, r1, #1
	strlt r0, [r6, #8]
_0202EB44:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
_0202EB54:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0202ECC4
	ldrsb r0, [r4, #0x10]
	mvn r2, #0
	add r1, sp, #0x28
	str r2, [sp, #8]
	bl GetWindowRectangle
	add r0, r5, #0x108
	add r0, r0, #0x1400
	str r0, [sp, #0xc]
	add r0, r5, #0x1000
	mov sl, #0
	str r0, [sp, #0x10]
	b _0202EC08
_0202EB90:
	ldr r0, [sp, #0xc]
	mov r1, #0x18
	mla r2, sl, r1, r0
	ldr r1, [sp, #0x28]
	ldr r0, [r2, #8]
	ldr r3, [sp, #0x30]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr ip, [r2, #0x10]
	add r0, sp, #0x48
	add r1, ip, r1
	str r1, [sp, #0x1c]
	ldr ip, [r2, #4]
	ldr r1, _0202EE84 ; =0x00000408
	add ip, ip, r3
	str ip, [sp, #0x20]
	ldr ip, [r2, #0xc]
	add r2, sp, #0x18
	add r3, ip, r3
	str r3, [sp, #0x24]
	bl sub_02006C8C
	cmp r0, #0
	beq _0202EC04
	add r0, r5, #4
	mov r1, #0
	str sl, [sp, #8]
	bl sub_020320EC
	mov r7, #1
	b _0202EC18
_0202EC04:
	add sl, sl, #1
_0202EC08:
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x504]
	cmp sl, r0
	blt _0202EB90
_0202EC18:
	ldr r0, [sp, #8]
	cmp r0, #0
	strge sl, [r6, #8]
	orrge sb, sb, #1
	bge _0202EC7C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	bl sub_02033758
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	orr r7, r7, r0
	cmp r1, #1
	ble _0202EC7C
	ldr r0, [sp, #0x14]
	tst r0, #0x40000
	beq _0202EC68
	subs r8, r8, #1
	submi r8, r1, #1
	b _0202EC7C
_0202EC68:
	tst r0, #0x80000
	beq _0202EC7C
	add r8, r8, #1
	cmp r8, r1
	movge r8, #0
_0202EC7C:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202ECA4
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202ECC4
_0202ECA4:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	strne r8, [r0, #0x4c0]
	strne r8, [r6, #4]
	mvnne r0, #0
	strne r0, [r6, #8]
	movne r7, #1
_0202ECC4:
	cmp r7, #0
	beq _0202ECD4
	mov r0, r4
	bl sub_0202EE88
_0202ECD4:
#ifdef JAPAN
	ldr r0, [r6, #8]
	cmp r0, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r1, r5, #0x108
	add r2, r1, #0x1400
	mov r1, #0x18
	mla r7, r0, r1, r2
	ldr sb, [r5, #0x430]
	mov r8, #0
	ldr r1, _0202EE7C ; =0x0000040C
	b _0202F078
_0202F05C:
	mla r2, r8, r1, r5
	add r2, r2, #0x400
	ldrh r3, [r7, #2]
	ldrh r2, [r2, #0x34]
	cmp r3, r2
	beq _0202F080
	add r8, r8, #1
_0202F078:
	cmp r8, sb
	blt _0202F05C
_0202F080:
	cmp sb, #3
	bge _0202EDBC
	ldrh r1, [r7, #2]
	cmp r1, #0
	addne r0, r5, r0
#else
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
	bne _0202EE28
	ldr r1, [r6, #8]
	mov r0, #0
	mov r7, r0
	cmp r1, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r2, r5, #0x108
	add r3, r2, #0x1400
	mov r2, #0x18
	mla r8, r1, r2, r3
	ldr sl, [r5, #0x430]
	mov r7, #1
	ldr r2, _0202EE7C ; =0x0000040C
	b _0202ED3C
_0202ED20:
	mla r3, r0, r2, r5
	add r3, r3, #0x400
	ldrh sb, [r8, #2]
	ldrh r3, [r3, #0x34]
	cmp sb, r3
	beq _0202ED44
	add r0, r0, #1
_0202ED3C:
	cmp r0, sl
	blt _0202ED20
_0202ED44:
	cmp sl, #3
	bge _0202EDBC
	ldrh r0, [r8, #2]
	cmp r0, #0
	addne r0, r5, r1
#endif
	addne r0, r0, #0x1000
	ldrneb r0, [r0, #0x568]
	cmpne r0, #0
	beq _0202EDBC
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	add r2, r6, #0x18
	add r0, r0, #1
	str r0, [r5, #0x430]
	mov r3, #0
#ifdef JAPAN
	ldrh r8, [r7, #2]
	add r0, r6, #0x400
	mov r1, r7
	strh r8, [r0, #0xc]
#else
	ldrh sb, [r8, #2]
	add r0, r6, #0x400
	mov r1, r8
	strh sb, [r0, #0xc]
#endif
	str r3, [r6, #0x410]
	sub r3, r3, #1
	add r0, r2, #0x400
	str r3, [r6, #0x414]
	bl sub_0202202C
	add r0, r5, #0x1000
	mov r1, #2
	str r1, [r0, #0x464]
	b _0202EDC8
_0202EDBC:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202EDC8:
#ifdef JAPAN
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
#else
	cmp r7, #0
#endif
	bne _0202EE28
	ldr r0, [sp, #0x14]
	tst r0, #2
	beq _0202EE28
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	cmp r0, #0
	ble _0202EE0C
	sub r0, r0, #1
	str r0, [r5, #0x430]
	add r0, r5, #0x1000
	mov r1, #3
	str r1, [r0, #0x464]
	b _0202EE28
_0202EE0C:
	mov r1, #1
	add r0, r5, #0x1000
	strb r1, [r0, #0x468]
	sub r1, r1, #6
	str r1, [r4, #0xb8]
	mov r1, #6
	str r1, [r0, #0x464]
_0202EE28:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202EE74
_0202EE38:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
	add r0, r5, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
_0202EE54:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r4, #0xb8]
	addne r0, r5, #0x1000
	movne r1, #8
	strne r1, [r0, #0x464]
_0202EE74:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202EE7C: .word 0x0000040C
#ifdef JAPAN
_0202EE80: .word 0x000003B7
#else
_0202EE80: .word 0x000001AF
#endif
_0202EE84: .word 0x00000408
	arm_func_end UpdateScrollBox

	arm_func_start sub_0202EE88
sub_0202EE88: ; 0x0202EE88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	mov sl, r0
	ldr r5, [sl, #0xc]
	ldrsb r0, [sl, #0x10]
	add r1, r5, #0x34
	ldr r4, [r5, #0x430]
	ldr r2, _0202F0A4 ; =0x0000040C
	add r1, r1, #0x400
	add r3, r5, #0x1000
	mla r6, r4, r2, r1
	ldr r4, [r3, #0x4c0]
	bl sub_02027B1C
	ldrsb r1, [sl, #0x10]
	add r0, sp, #8
	bl sub_02025E84
	add r0, r5, #4
	mov r1, #0
	bl sub_020328D8
	mov r2, r0
	add r0, sp, #8
	mov r1, #4
	bl sub_0202614C
	add r0, r5, r4, lsl #2
	add r0, r0, #0x1000
	ldr r2, [r0, #0x4e4]
	ldr r1, _0202F0A8 ; =0x0000C406
	add r0, sp, #8
	bl sub_02026194
	add r0, sp, #8
	bl sub_02026204
	add r1, r5, #0x108
	add r0, sp, #8
	add r1, r1, #0x1400
	bl sub_020261F4
	add r1, r5, #0x1000
	str r0, [r1, #0x504]
	ldr r0, [r5, #0x430]
	cmp r0, #3
	bge _0202EFA0
	mov r8, #0
	mov r0, #1
	mov lr, r8
	ldr sb, _0202F0A4 ; =0x0000040C
	mov ip, #0x18
	b _0202EF90
_0202EF40:
	mla r2, r8, ip, r5
	add r3, r2, #0x1500
	mov r4, r0
	mov r2, lr
	ldrh r3, [r3, #0xa]
	ldr r7, [r5, #0x430]
	b _0202EF78
_0202EF5C:
	mla fp, r2, sb, r5
	add fp, fp, #0x400
	ldrh fp, [fp, #0x34]
	cmp r3, fp
	moveq r4, #0
	beq _0202EF80
	add r2, r2, #1
_0202EF78:
	cmp r2, r7
	blt _0202EF5C
_0202EF80:
	add r2, r5, r8
	add r2, r2, #0x1000
	strb r4, [r2, #0x568]
	add r8, r8, #1
_0202EF90:
	ldr r3, [r1, #0x504]
	cmp r8, r3
	blt _0202EF40
	b _0202EFC8
_0202EFA0:
	mov r4, #0
	mov r2, r4
	b _0202EFBC
_0202EFAC:
	add r0, r5, r4
	add r0, r0, #0x1000
	strb r2, [r0, #0x568]
	add r4, r4, #1
_0202EFBC:
	ldr r3, [r1, #0x504]
	cmp r4, r3
	blt _0202EFAC
_0202EFC8:
	add r0, r5, #0x108
	cmp r3, #0
	add r7, r0, #0x1400
	mov r8, #0
	ble _0202F088
	add r4, r5, #0x1000
	mov fp, #0x2e
	b _0202F07C
_0202EFE8:
	add r0, r5, r8
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x568]
	ldrsb r1, [sl, #0x10]
	cmp r0, #0
	movne sb, #0x4c
	add r0, sp, #8
	moveq sb, #0x57
	bl sub_02025E84
	add r0, sp, #8
	ldmib r7, {r1, r2}
	bl sub_0202614C
	ldr r1, _0202F0AC ; =0x0000C506
	ldr r2, [r7, #0x14]
	add r0, sp, #8
	bl sub_02026194
	mov r1, sb
	add r0, sp, #8
	bl sub_02026174
	add r0, sp, #8
	bl sub_02026204
	ldr r0, [r6, #8]
	cmp r0, r8
	bne _0202F074
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0202F074
	sub r3, r0, r1
	ldr r2, [r7, #8]
	ldr r0, [r7, #0x10]
	sub r0, r0, r2
	stmia sp, {r0, fp}
	ldrsb r0, [sl, #0x10]
	bl sub_02025D90
_0202F074:
	add r8, r8, #1
	add r7, r7, #0x18
_0202F07C:
	ldr r0, [r4, #0x504]
	cmp r8, r0
	blt _0202EFE8
_0202F088:
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202F0A4: .word 0x0000040C
_0202F0A8: .word 0x0000C406
_0202F0AC: .word 0x0000C506
	arm_func_end sub_0202EE88

	arm_func_start CreateDialogueBox
CreateDialogueBox: ; 0x0202F0B0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r0, _0202F13C ; =0x00000528
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r6, #0
	ldreq r0, _0202F140 ; =DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
	add r5, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r5, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r5, {r0, r1, r2, r3}
	ldrne r0, _0202F144 ; =UpdateDialogueBox
	ldr r1, _0202F144 ; =UpdateDialogueBox
	strne r0, [sp]
	str r4, [sp, #0xc]
	str r1, [r4]
	mov r2, #1
	add r0, sp, #0
	mov r1, #3
	strb r2, [r4, #0xa]
	bl NewWindowScreenCheck
	mov r5, r0
	mov r1, r5
	add r0, r4, #0xc
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	strb r1, [r4, #8]
	mov r0, r5
	strb r1, [r4, #9]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202F13C: .word 0x00000528
_0202F140: .word DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
_0202F144: .word UpdateDialogueBox
	arm_func_end CreateDialogueBox

	arm_func_start CloseDialogueBox
CloseDialogueBox: ; 0x0202F148
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseDialogueBox

	arm_func_start sub_0202F16C
sub_0202F16C: ; 0x0202F16C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0xc
	bl sub_020261D4
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F16C

	arm_func_start IsDialogueBoxActive
IsDialogueBoxActive: ; 0x0202F180
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end IsDialogueBoxActive

	arm_func_start sub_0202F190
sub_0202F190: ; 0x0202F190
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r5
	mov r2, r4
	add r0, r0, #0xc
	bl sub_02026184
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202F190

	arm_func_start ShowStringIdInDialogueBox
ShowStringIdInDialogueBox: ; 0x0202F1B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F1EC
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F200
_0202F1EC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F200
	add r0, r4, #0x128
	bl sub_02048240
_0202F200:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringIdInDialogueBox

	arm_func_start ShowStringInDialogueBox
ShowStringInDialogueBox: ; 0x0202F23C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F274
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F288
_0202F274:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F288
	add r0, r4, #0x128
	bl sub_02048240
_0202F288:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessString
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringInDialogueBox

	arm_func_start sub_0202F2C4
sub_0202F2C4: ; 0x0202F2C4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F31C
_0202F2E0: ; jump table
	b _0202F31C ; case 0
	b _0202F2F4 ; case 1
	b _0202F308 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F2F4:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F308:
	add r0, r4, #0xc
	bl sub_020261A4
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F31C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F2C4

	arm_func_start sub_0202F334
sub_0202F334: ; 0x0202F334
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F38C
_0202F350: ; jump table
	b _0202F38C ; case 0
	b _0202F364 ; case 1
	b _0202F378 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F364:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F378:
	mov r0, #3
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F38C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F334

	arm_func_start ShowDialogueBox
ShowDialogueBox: ; 0x0202F3A4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F3E0
_0202F3C0: ; jump table
	b _0202F3E0 ; case 0
	b _0202F3D4 ; case 1
	b _0202F3D4 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F3D4:
	add r0, r4, #0xc
	bl sub_020261C4
	ldmia sp!, {r4, pc}
_0202F3E0:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end ShowDialogueBox

	arm_func_start sub_0202F3F8
sub_0202F3F8: ; 0x0202F3F8
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F434
_0202F414: ; jump table
	b _0202F434 ; case 0
	b _0202F428 ; case 1
	b _0202F428 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F428:
	add r0, r4, #0xc
	bl sub_020261B4
	ldmia sp!, {r4, pc}
_0202F434:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F3F8

	arm_func_start ReadStringFromDialogueBox
ReadStringFromDialogueBox: ; 0x0202F44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r0
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x128
	bl MemcpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadStringFromDialogueBox

	arm_func_start sub_0202F474
sub_0202F474: ; 0x0202F474
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xa]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F474

	arm_func_start UpdateDialogueBox
UpdateDialogueBox: ; 0x0202F488
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F4A4: ; jump table
	b _0202F4B8 ; case 0
	b _0202F4E4 ; case 1
	b _0202F504 ; case 2
	b _0202F568 ; case 3
	b _0202F57C ; case 4
_0202F4B8:
	add r0, r4, #0xc
	bl sub_020261D4
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F4E4:
	mov r0, #1
	strb r0, [r4, #8]
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F504:
	add r0, r4, #0xc
	bl sub_02026204
	cmp r0, #0x10
	moveq r0, #3
	streq r0, [r4, #4]
	moveq r0, #1
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r5, [r4, #8]
	add r0, r4, #0xc
	bl sub_020261E4
	strb r0, [r4, #8]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x128
	bl sub_02048240
	mov r0, #0
	strb r0, [r4, #9]
	ldmia sp!, {r3, r4, r5, pc}
_0202F568:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
_0202F57C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateDialogueBox

	arm_func_start CreatePortraitBox
CreatePortraitBox: ; 0x0202F5AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r4, r1
	mov r0, #0x380
	mov r1, #8
	mov r6, r2
	bl MemAlloc
	ldr r1, _0202F648 ; =PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
	mov r5, r0
	add ip, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, _0202F64C ; =UpdatePortraitBox
	cmp r6, #0
	str r0, [sp]
	mvnne r0, #3
	mvneq r0, #6
	strb r0, [sp, #9]
	str r5, [sp, #0xc]
	strb r7, [sp, #8]
	add r0, sp, #0
	strb r6, [r5, #0x2a]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r5]
	mov r1, #0
	add r0, r5, #8
	str r1, [r5, #4]
	bl InitPortraitParams
	add r0, r5, #0x18
	bl InitPortraitParams
	str r4, [r5, #0x2c]
	mov r0, #0
	strb r0, [r5, #0x28]
	strb r0, [r5, #0x29]
	ldrsb r0, [r5]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202F648: .word PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
_0202F64C: .word UpdatePortraitBox
	arm_func_end CreatePortraitBox

	arm_func_start ClosePortraitBox
ClosePortraitBox: ; 0x0202F650
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end ClosePortraitBox

	arm_func_start PortraitBoxNeedsUpdate
PortraitBoxNeedsUpdate: ; 0x0202F66C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end PortraitBoxNeedsUpdate

	arm_func_start ShowPortraitInPortraitBox
ShowPortraitInPortraitBox: ; 0x0202F690
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #1
	strne r0, [r4, #4]
	cmp r5, #0
	addne ip, r4, #0x18
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	bne _0202F6D0
	add r0, r4, #0x18
	bl InitPortraitParams
_0202F6D0:
	mov r0, #1
	strb r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShowPortraitInPortraitBox

	arm_func_start HidePortraitBox
HidePortraitBox: ; 0x0202F6DC
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	bl InitPortraitParams
	ldr r0, [r4, #4]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x29]
	ldmia sp!, {r4, pc}
	arm_func_end HidePortraitBox

	arm_func_start UpdatePortraitBox
UpdatePortraitBox: ; 0x0202F70C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F728: ; jump table
	b _0202F73C ; case 0
	b _0202F760 ; case 1
	b _0202F778 ; case 2
	b _0202F86C ; case 3
	b _0202F894 ; case 4
_0202F73C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	mov r0, #1
	strb r1, [r4, #0x28]
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F760:
	ldrsb r0, [r5, #0x10]
	bl sub_0202811C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F778:
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	add ip, r4, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	bne _0202F86C
	mov r0, ip
	bl IsValidPortrait
	cmp r0, #0
	beq _0202F854
	add r0, r4, #8
	add r1, r4, #0x30
	bl LoadPortrait
	cmp r0, #0
	beq _0202F824
	ldr r2, [r4, #0x2c]
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0x30
	mov r2, r2, lsl #4
	bl sub_02027040
	ldrsb r0, [r5, #0x10]
	ldr r2, [r4, #0x2c]
	add r1, r4, #0x60
	bl sub_02026E3C
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x11]
	ldrb r0, [r4, #0x2a]
	cmp r0, #0
	ldrsb r0, [r4]
	beq _0202F808
	mvn r1, #3
	bl sub_02028080
	b _0202F810
_0202F808:
	mvn r1, #6
	bl sub_02028080
_0202F810:
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0xc
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F824:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	ldrsb r0, [r4]
	mov r1, #0
	bl sub_02028080
	add r1, r4, #0xc
	ldrsb r0, [r5, #0x10]
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F854:
	mov r0, #1
	strb r0, [r4, #0x29]
_0202F85C:
	mov r0, #3
	str r0, [r4, #4]
	sub r0, r0, #4
	str r0, [r5, #0xb8]
_0202F86C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	movne r0, #4
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0202F894:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl InitPortraitParams
	mov r0, #0
	strb r0, [r4, #0x29]
	str r0, [r4, #4]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdatePortraitBox

	arm_func_start CreateTextBox
CreateTextBox: ; 0x0202F8C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl CreateTextBoxInternal
	str r4, [r0, #4]
	ldrsb r0, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end CreateTextBox

	arm_func_start CreateTextBoxWithArg
CreateTextBoxWithArg: ; 0x0202F8DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r5, r1
	bl CreateTextBoxInternal
	str r4, [r0, #0x14]
	str r5, [r0, #8]
	ldrsb r0, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CreateTextBoxWithArg

	arm_func_start CloseTextBox
CloseTextBox: ; 0x0202F8FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox

	arm_func_start CloseTextBox2
CloseTextBox2: ; 0x0202F918
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl sub_0202836C
	mov r0, r4
	bl sub_02027B1C
	mov r0, r4
	bl sub_0202F954
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox2

	arm_func_start sub_0202F954
sub_0202F954: ; 0x0202F954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0202F9AC
_0202F96C: ; jump table
	b _0202F9AC ; case 0
	b _0202F988 ; case 1
	b _0202F994 ; case 2
	b _0202F9A0 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	ldmia sp!, {r3, pc} ; case 5
	ldmia sp!, {r3, pc} ; case 6
_0202F988:
	mov r1, #5
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F994:
	mov r1, #3
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9A0:
	mov r1, #4
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9AC:
	mov r1, #0
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F954

	arm_func_start sub_0202F9B8
sub_0202F9B8: ; 0x0202F9B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x10]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F9B8

	arm_func_start CreateTextBoxInternal
CreateTextBoxInternal: ; 0x0202F9DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x18
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r5, #0
	ldreq r0, _0202FA54 ; =TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _0202FA58 ; =UpdateTextBox
	add r0, sp, #0
	str r1, [sp]
	str r4, [sp, #0xc]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
	ldr r1, _0202FA58 ; =UpdateTextBox
	mov r0, r4
	str r1, [r4, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202FA54: .word TEXT_BOX_DEFAULT_WINDOW_PARAMS
_0202FA58: .word UpdateTextBox
	arm_func_end CreateTextBoxInternal

	arm_func_start UpdateTextBox
UpdateTextBox: ; 0x0202FA5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, [r4, #0x10]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202FA84: ; jump table
	b _0202FAA0 ; case 0
	b _0202FAB0 ; case 1
	b _0202FAC8 ; case 2
	b _0202FB04 ; case 3
	b _0202FB50 ; case 4
	b _0202FB68 ; case 5
	b _0202FB88 ; case 6
_0202FAA0:
	mvn r0, #0
	str r0, [r5, #0xb8]
	mov r0, #1
	str r0, [r4, #0x10]
_0202FAB0:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #0x10]
_0202FAC8:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _0202FAE4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x14]
	blx r2
	b _0202FAF8
_0202FAE4:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0202FAF8
	ldrsb r0, [r5, #0x10]
	blx r1
_0202FAF8:
	mov r0, #3
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB04:
	ldrb r0, [r5, #8]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp]
	tst r0, #2
	ldrnesb r2, [r5, #9]
	mvnne r1, #1
	cmpne r2, r1
	subne r0, r1, #3
	cmpne r2, r0
	subne r0, r1, #6
	cmpne r2, r0
	subne r0, r1, #7
	cmpne r2, r0
	movne r0, #4
	strne r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	cmp r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_0202FB50:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #0x10]
_0202FB68:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	movne r0, #6
	strne r0, [r4, #0x10]
	subne r0, r0, #0xc
	strne r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB88:
	mvn r0, #4
	str r0, [r5, #0xb8]
	mov r0, #7
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateTextBox

	arm_func_start IsTextBoxActive
IsTextBoxActive: ; 0x0202FB9C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x10]
	cmp r0, #7
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTextBoxActive

	arm_func_start CreateAreaNameBox
CreateAreaNameBox: ; 0x0202FBBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x64
	mov r7, r0
	mov r6, r1
	mov r0, #0x1b4
	mov r1, #8
	mov r5, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	str r8, [r4, #0xa4]
	add r0, sp, #0x14
	str r8, [sp, #0x24]
	str r0, [sp]
	ldr r2, _0202FD2C ; =_0209AF6C
	ldr r3, _0202FD30 ; =0x0000C402
	add r0, r4, #0xac
	mov r1, #0x100
	bl PreprocessString
	add r0, r4, #0xac
	bl sub_020265A8
	mov ip, r0
	cmp r7, #0
	str ip, [r4, #0xa8]
	addne lr, sp, #4
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FD34 ; =UpdateAreaNameBox
	strne r0, [sp, #4]
	bne _0202FC48
	ldr r0, _0202FD38 ; =AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	add r7, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	orr r6, r6, #0x300000
_0202FC48:
	ldrb r0, [sp, #0xa]
	str r4, [sp, #0x10]
	cmp r0, #0
	addeq r1, ip, #7
	moveq r0, r1, asr #2
	addeq r0, r1, r0, lsr #29
	moveq r0, r0, asr #3
	streqb r0, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sp, #0xb]
	tst r6, #0x200000
	ldrneb r1, [sp, #8]
	ldrneb r0, [sp, #0xa]
	subne r0, r1, r0
	strneb r0, [sp, #8]
	tst r6, #0x100000
	ldrneb r1, [sp, #9]
	ldrneb r0, [sp, #0xb]
	subne r0, r1, r0
	strneb r0, [sp, #9]
	ldrb r1, [sp, #0xa]
	ldr r0, [r4, #0xa8]
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1b0]
	ldrb r0, [sp, #0xb]
	mov r0, r0, lsl #3
	sub r0, r0, #0xc
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r4, #0x1b0]
	ldr r0, _0202FD34 ; =UpdateAreaNameBox
	cmp r5, #0
	stmia r4, {r0, r6}
	beq _0202FD10
	add r7, r4, #8
	mov r6, #9
_0202FCF8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202FCF8
	ldmia r5, {r0, r1}
	stmia r7, {r0, r1}
_0202FD10:
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r2, [r4, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202FD2C: .word _0209AF6C
_0202FD30: .word 0x0000C402
_0202FD34: .word UpdateAreaNameBox
_0202FD38: .word AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAreaNameBox

	arm_func_start SetAreaNameBoxState3
SetAreaNameBoxState3: ; 0x0202FD3C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #3
	str r1, [r0, #0xa0]
	ldmia sp!, {r3, pc}
	arm_func_end SetAreaNameBoxState3

	arm_func_start CloseAreaNameBox
CloseAreaNameBox: ; 0x0202FD50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAreaNameBox

	arm_func_start IsAreaNameBoxActive
IsAreaNameBoxActive: ; 0x0202FD6C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAreaNameBoxActive

	arm_func_start UpdateAreaNameBox
UpdateAreaNameBox: ; 0x0202FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FDA8: ; jump table
	b _0202FDB8 ; case 0
	b _0202FDD0 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FE0C ; case 3
_0202FDB8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FDD0:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1b0]
	ldr r2, [r6, #0x1ac]
	add r3, r6, #0xac
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FE0C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateAreaNameBox

	arm_func_start CreateControlsChart
CreateControlsChart: ; 0x0202FE2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r5, r1
	mov r0, #0xa8
	mov r1, #8
	mov r4, r2
	mov r6, r3
	bl MemAlloc
	mov ip, r0
	cmp r7, #0
	ldreq r0, _0202FECC ; =CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
	strh r6, [ip, #0xa4]
	add lr, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia lr, {r0, r1, r2, r3}
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FED0 ; =UpdateControlsChart
	str ip, [sp, #0xc]
	strne r0, [sp]
	ldr r0, _0202FED0 ; =UpdateControlsChart
	cmp r4, #0
	stmia ip, {r0, r5}
	beq _0202FEB0
	add lr, ip, #8
	mov r5, #9
_0202FE98:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202FE98
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_0202FEB0:
	mov r2, #0
	add r0, sp, #0
	mov r1, #3
	str r2, [ip, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202FECC: .word CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
_0202FED0: .word UpdateControlsChart
	arm_func_end CreateControlsChart

	arm_func_start CloseControlsChart
CloseControlsChart: ; 0x0202FED4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseControlsChart

	arm_func_start IsControlsChartActive
IsControlsChartActive: ; 0x0202FEF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsControlsChartActive

	arm_func_start UpdateControlsChart
UpdateControlsChart: ; 0x0202FF10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FF2C: ; jump table
	b _0202FF3C ; case 0
	b _0202FF54 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FF90 ; case 3
_0202FF3C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FF54:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldrh r3, [r6, #0xa4]
	mov r1, #4
	mov r2, #2
	bl sub_02026268
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FF90:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateControlsChart

	arm_func_start CreateAlertBox
CreateAlertBox: ; 0x0202FFB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x650
	mov r1, #8
	bl MemAlloc
	mov r1, #0x650
	mov r4, r0
	bl MemZero
	cmp r5, #0
	ldreq r0, _0203003C ; =ALERT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030040 ; =UpdateAlertBox
	str r4, [sp, #0xc]
	strne r0, [sp]
	add r0, sp, #0
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	ldrsb r1, [r4]
	add r0, r4, #8
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	add r0, r4, #0x600
	strh r1, [r0, #0x44]
	strh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsb r0, [r4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203003C: .word ALERT_BOX_DEFAULT_WINDOW_PARAMS
_02030040: .word UpdateAlertBox
	arm_func_end CreateAlertBox

	arm_func_start CloseAlertBox
CloseAlertBox: ; 0x02030044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4]
	bl sub_0202836C
	add r0, r4, #8
	bl sub_0202613C
	mov r0, r5
	bl GetWindowContents
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAlertBox

	arm_func_start sub_0203007C
sub_0203007C: ; 0x0203007C
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x44]
	add r1, r1, #1
	strh r1, [r0, #0x44]
	ldrsh r1, [r0, #0x44]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x44]
	bx lr
	arm_func_end sub_0203007C

	arm_func_start sub_020300A0
sub_020300A0: ; 0x020300A0
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x44]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	movge r0, #0
	bx lr
	arm_func_end sub_020300A0

	arm_func_start sub_020300C0
sub_020300C0: ; 0x020300C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add ip, sp, #0
	str r1, [sp]
	mov r1, ip
	add r0, r5, #0xc
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02020B60
	ldr r1, _02030108 ; =0x0000C402
	mov r2, r4
	add r0, r5, #0xc
	bl sub_02020BC4
	add r0, r5, #0xc
	bl AnalyzeText
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02030108: .word 0x0000C402
	arm_func_end sub_020300C0

	arm_func_start sub_0203010C
sub_0203010C: ; 0x0203010C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	beq _02030144
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
_02030144:
	mov r0, r4
	bl sub_020300A0
	add r1, r4, #0x600
	ldrsh r2, [r1, #0x46]
	cmp r2, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r5, [sp]
	ldrsh r1, [r1, #0x44]
	add r0, r4, #0x29
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r0, r1, r0, r2
	mov r2, r6
	mov r3, r7
	mov r1, #0x140
	bl PreprocessString
	add r1, r4, #0x600
	add r0, r4, #0x29
	ldrsh r1, [r1, #0x44]
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r2, r1, r0, r2
	mov r1, r7
	add r0, r4, #8
	bl sub_02026194
	add r1, r4, #0x600
	ldrsh r0, [r1, #0x44]
	mov r2, #0x148
	mov r6, #0
	smlabb r0, r0, r2, r4
	add r0, r0, #0x200
	strh r7, [r0, #0x6a]
	ldrsh r5, [r1, #0x44]
	ldrb r3, [sp, #0x18]
	mov r0, r4
	smlabb r5, r5, r2, r4
	str r6, [r5, #0x124]
	ldrsh r1, [r1, #0x44]
	smlabb r1, r1, r2, r4
	strb r3, [r1, #0x128]
	bl sub_0203007C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203010C

	arm_func_start IsAlertBoxActive
IsAlertBoxActive: ; 0x020301F4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAlertBoxActive

	arm_func_start sub_02030214
sub_02030214: ; 0x02030214
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030260
_02030230: ; jump table
	b _02030260 ; case 0
	b _02030248 ; case 1
	b _02030254 ; case 2
	b _02030254 ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
_02030248:
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030254:
	mov r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030260:
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030214

	arm_func_start UpdateAlertBox
UpdateAlertBox: ; 0x02030274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030290: ; jump table
	b _020302A8 ; case 0
	b _020302C8 ; case 1
	b _020302E0 ; case 2
	b _02030438 ; case 3
	b _0203056C ; case 4
	b _02030588 ; case 5
_020302A8:
	add r0, r4, #8
	bl sub_020261D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_020302C8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020302E0:
	ldrsb r0, [r5, #0x10]
	bl GetWindowContents
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x46]
	ldrsh r0, [r0, #0x44]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsb r4, [r5, #0x10]
	mov r0, r4
	bl GetWindowContents
	mov r6, r0
	add r3, r6, #0x600
	ldr r1, [r6, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r5, [r6, #0x10]
	mov r8, r1, asr #0x10
	mla r1, r2, r8, r5
	ldr r2, [r6, #0xc]
	mov r7, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	ldrsh r3, [r3, #0x46]
	mov r1, #0x148
	add r5, r6, #0x124
	smulbb r3, r3, r1
	ldr r1, [r5, r3]
	add r5, r5, r3
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov r7, r7, asr #0x10
	bne _02030388
	mov r5, #0x17
	mov r0, r4
	add r2, r7, r8
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
	b _020303C4
_02030388:
	mov r2, r7
	add r3, r5, #5
	bl sub_020300C0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _020303C4
	cmp r7, r8
	blt _020303C4
	mov r5, #0x17
	mov r0, r4
	sub r2, r7, #2
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
_020303C4:
	mov r0, r4
	bl UpdateWindow
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsh r1, [r0, #0x46]
	add r1, r1, #1
	strh r1, [r0, #0x46]
	ldrsh r1, [r0, #0x46]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x46]
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x4a]
	cmp r1, #3
	movge r1, #3
	strge r1, [r6, #4]
	movge r1, #0
	strgeh r1, [r0, #0x4c]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r6, #0xa0]
	ldr r0, [r6, #0x10]
	add r2, r1, r8
	mov r1, r8
	sub r0, r2, r0
	bl _s32_div_f
	add r1, r6, #0x600
	strh r0, [r1, #0x4a]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030438:
	ldrsb r5, [r5, #0x10]
	mov r0, r5
	bl GetWindowContents
	mov r7, r0
	add r3, r7, #0x600
	ldr r1, [r7, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r6, [r7, #0x10]
	mov r8, r1, asr #0x10
	ldr r1, [r7, #0xc]
	mla r6, r2, r8, r6
	ldrsh sb, [r3, #0x4c]
	mov r2, r1, lsl #0x10
	ldrsh ip, [r3, #0x48]
	mov r1, #0x148
	add r3, sb, r6
	mov r3, r3, lsl #0x10
	smulbb r6, ip, r1
	add sb, r7, #0x124
	ldr r1, [sb, r6]
	add r6, sb, r6
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov sb, r3, asr #0x10
	bne _020304C0
	mov r6, #0x17
	mov r0, r5
	add r2, sb, r8
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
	b _020304FC
_020304C0:
	mov r2, sb
	add r3, r6, #5
	bl sub_020300C0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _020304FC
	cmp sb, r8
	blt _020304FC
	mov r6, #0x17
	mov r0, r5
	sub r2, sb, #2
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
_020304FC:
	add r0, r7, #0x600
	ldrsh r0, [r0, #0x4c]
	add r0, r0, r8
	cmp r0, #1
	mov r0, r5
	bne _02030528
	bl sub_01FF9128
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #1
	b _02030538
_02030528:
	bl sub_01FF929C
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #2
_02030538:
	strh r1, [r0, #0x4c]
	add r0, r7, #0x600
	ldrsh r2, [r0, #0x4c]
	rsb r1, r8, #0
	cmp r2, r1
	movle r1, #3
	strleh r1, [r0, #0x4a]
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0203056C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030588:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	add r0, r4, #8
	str r1, [r4, #4]
	bl sub_0202613C
	mvn r0, #5
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end UpdateAlertBox

	arm_func_start CreateAdvancedTextBox
CreateAdvancedTextBox: ; 0x020305B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	add r1, r0, #0x100
	str r4, [r0, #0x1a4]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBox

	arm_func_start CreateAdvancedTextBoxWithArg
CreateAdvancedTextBoxWithArg: ; 0x020305E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	ldr r2, [sp, #0x10]
	str r4, [r0, #0x1a8]
	add r1, r0, #0x100
	str r2, [r0, #0x1ac]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBoxWithArg

	arm_func_start CreateAdvancedTextBoxInternal
CreateAdvancedTextBoxInternal: ; 0x0203061C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r8, r0
	mov r7, r1
	mov r0, #0x1c8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x1a4]
	str r0, [r4, #0x1a8]
	str r0, [r4, #0x1ac]
	str r0, [r4, #0x1b8]
	mov r0, #1
	cmp r8, #0
	strb r0, [r4, #0x1c4]
	addne ip, sp, #0x18
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030774 ; =UpdateAdvancedTextBox
	strne r0, [sp, #0x18]
	bne _02030690
	ldr r0, _02030778 ; =ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x18
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r7, r7, #0x300000
_02030690:
	tst r7, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	str r4, [sp, #0x24]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r7, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02030774 ; =UpdateAdvancedTextBox
	cmp r6, #0
	str r0, [r4]
	str r7, [r4, #0x104]
	beq _020306F0
	add ip, r4, #0x108
	mov r8, #9
_020306D8:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _020306D8
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_020306F0:
	mov r2, #0
	str r2, [r4, #0x1bc]
	strb r2, [r4, #0x1c0]
	strb r2, [r4, #0x1c1]
	strb r2, [r4, #0x1c2]
	str r2, [r4, #0x1b0]
	str r2, [r4, #0x1b4]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r4, #0x1c3]
	bl NewWindowScreenCheck
	add r1, sp, #8
	strb r0, [r4, #0x1a0]
	bl GetWindowRectangle
	mov r1, #0x100
	strh r1, [r4, #0xfc]
	tst r7, #0x8000
	moveq r5, #0
	streq r5, [sp, #0x40]
	strh r1, [r4, #0xfe]
	add r0, r4, #0x100
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #0x40]
	add r3, sp, #8
	mov r1, r7
	add r0, r4, #4
	add r2, r4, #0x108
	stmia sp, {r5, r6}
	bl InitWindowInput
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02030774: .word UpdateAdvancedTextBox
_02030778: .word ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAdvancedTextBoxInternal

	arm_func_start SetAdvancedTextBoxPartialMenu
SetAdvancedTextBoxPartialMenu: ; 0x0203077C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c3]
	ldr r1, [r0, #0x104]
	tst r4, #0xff
	orrne r1, r1, #0x400000
	biceq r1, r1, #0x400000
	str r1, [r0, #0x104]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxPartialMenu

	arm_func_start SetAdvancedTextBoxField0x1C4
SetAdvancedTextBoxField0x1C4: ; 0x020307A4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c4]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxField0x1C4

	arm_func_start sub_020307B8
sub_020307B8: ; 0x020307B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1bc]
	mov r1, #0
	strb r1, [r0, #0x1c0]
	strb r1, [r0, #0x1c1]
	ldr r1, [r0, #0x104]
	bic r1, r1, #0x800000
	str r1, [r0, #0x104]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_020307B8

	arm_func_start sub_020307EC
sub_020307EC: ; 0x020307EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #7
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _02030828
	mov r0, r5
	bl sub_020307B8
	ldmia sp!, {r3, r4, r5, pc}
_02030828:
	ldr r0, [r4, #0x1bc]
	cmp r0, #6
	moveq r0, #0
	streq r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020307EC

	arm_func_start SetAdvancedTextBoxField0x1C2
SetAdvancedTextBoxField0x1C2: ; 0x0203083C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1c2]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxField0x1C2

	arm_func_start CloseAdvancedTextBox2
CloseAdvancedTextBox2: ; 0x02030850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0202836C
	mov r0, r5
	bl sub_020288DC
	mov r0, r5
	bl sub_0202812C
	mov r0, r5
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox2

	arm_func_start SetAdvancedTextBoxState5
SetAdvancedTextBoxState5: ; 0x0203088C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #5
	str r1, [r0, #0x1bc]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxState5

	arm_func_start CloseAdvancedTextBox
CloseAdvancedTextBox: ; 0x020308A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox

	arm_func_start IsAdvancedTextBoxActive
IsAdvancedTextBoxActive: ; 0x020308C4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedTextBoxActive

#ifndef JAPAN
	arm_func_start sub_020308E4
sub_020308E4: ; 0x020308E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	ldrneb r0, [r0, #0x1c1]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020308E4
#endif

	arm_func_start sub_02030908
sub_02030908: ; 0x02030908
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030938
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
_02030938:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030908

	arm_func_start sub_02030940
sub_02030940: ; 0x02030940
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030970
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_02030970:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030940

	arm_func_start sub_02030978
sub_02030978: ; 0x02030978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetWindowContents
	mov r1, r0
	strh r5, [r1, #0xfc]
	strh r4, [r1, #0xfe]
	mov r0, r7
	mov r2, r6
	mov r3, r5
	add r1, r1, #4
	str r4, [sp]
	bl sub_020289B8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02030978

	arm_func_start sub_020309B8
sub_020309B8: ; 0x020309B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r1, r0
	strh r6, [r1, #0xfc]
	ldr r4, [sp, #0x28]
	strh r5, [r1, #0xfe]
	add ip, r1, #0x100
	ldr lr, [sp, #0x2c]
	strh r4, [ip]
	strh lr, [ip, #2]
	str r5, [sp]
	mov r0, r8
	add r1, r1, #4
	mov r2, r7
	mov r3, r6
	stmib sp, {r4, lr}
	bl sub_02028A08
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020309B8

	arm_func_start sub_02030A18
sub_02030A18: ; 0x02030A18
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032568
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030A18

	arm_func_start sub_02030A2C
sub_02030A2C: ; 0x02030A2C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strh r4, [r0, #0x20]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A2C

	arm_func_start GetAdvancedTextBoxFlags2
GetAdvancedTextBoxFlags2: ; 0x02030A40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1b0]
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedTextBoxFlags2

	arm_func_start sub_02030A50
sub_02030A50: ; 0x02030A50
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0xc0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A50

	arm_func_start sub_02030A64
sub_02030A64: ; 0x02030A64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030A64

	arm_func_start sub_02030A74
sub_02030A74: ; 0x02030A74
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A74

	arm_func_start sub_02030A90
sub_02030A90: ; 0x02030A90
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C84
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A90

	arm_func_start sub_02030AAC
sub_02030AAC: ; 0x02030AAC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xf8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030AAC

	arm_func_start SetUnkAdvancedTextBoxFn
SetUnkAdvancedTextBoxFn: ; 0x02030AC0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b4]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxFn

	arm_func_start SetUnkAdvancedTextBoxWindowFn
SetUnkAdvancedTextBoxWindowFn: ; 0x02030AD4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b8]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxWindowFn

	arm_func_start UpdateAdvancedTextBox
UpdateAdvancedTextBox: ; 0x02030AE8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r7, r0
	ldr r4, [r7, #0xc]
	mov r5, #0
	str r5, [r4, #0x1b0]
	ldr r0, [r4, #0x1bc]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030E88
_02030B10: ; jump table
	b _02030B28 ; case 0
	b _02030B40 ; case 1
	b _02030B48 ; case 2
	b _02030BA0 ; case 3
	b _02030E0C ; case 4
	b _02030E5C ; case 5
_02030B28:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02030E88
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B40:
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B48:
	mov r0, r7
	bl sub_02030E94
	ldr r0, [r4, #0x104]
	tst r0, #0x800000
	beq _02030B80
	mov r0, #7
	str r0, [r4, #0x1bc]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02030E88
_02030B80:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1bc]
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02030E88
_02030BA0:
	ldr r2, [r4, #0x1b4]
	ldrb r6, [r4, #0x1c2]
	cmp r2, #0
	beq _02030BF0
	add r0, sp, #0x1c
	add r1, sp, #0x18
	blx r2
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	ldr ip, [sp, #0x1c]
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	str ip, [sp]
	bl sub_02031E80
	b _02030C18
_02030BF0:
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	bl sub_02031C98
_02030C18:
	orr r6, r6, r0
	mov r0, #0
	strb r0, [r4, #0x1c2]
	ldr r2, [r4, #0x1b4]
	cmp r2, #0
	beq _02030CAC
	add r0, sp, #0x14
	add r1, sp, #0x10
	blx r2
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CAC
	ldr r0, [r4, #0x104]
	tst r0, #1
	beq _02030CAC
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _02030E90 ; =0x00000408
	str r0, [sp, #8]
	ldr ip, [sp, #0x10]
	add r1, sp, #0x20
	add r0, r4, #4
	str ip, [sp, #0xc]
	bl sub_020322B0
	movs r1, r0
	bmi _02030CAC
	ldr r2, [sp, #0x14]
	add r0, r4, #4
	bl sub_020326F8
	ldr r0, [r4, #0x1b0]
	mov r6, #1
	orr r0, r0, #1
	mov r5, r6
	str r0, [r4, #0x1b0]
_02030CAC:
	ldrb r0, [r4, #0xf8]
	cmp r0, #0
	bne _02030CC4
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CD8
_02030CC4:
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	bl sub_02033758
	orr r6, r6, r0
_02030CD8:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [r4, #0x1b0]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r6, r0
	beq _02030D04
	mov r0, r7
	bl sub_02030E94
_02030D04:
	ldr r0, [r4, #0x1b0]
	tst r0, #1
	beq _02030D74
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _02030DB0
	ldr r0, [r4, #0x104]
	tst r0, #0x80000000
	bne _02030D38
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02030D38:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldr r2, [r4, #0x1b8]
	cmp r2, #0
	beq _02030DB0
	ldrsb r0, [r7, #0x10]
	mov r1, r5
	blx r2
	b _02030DB0
_02030D74:
	tst r0, #2
	beq _02030DB0
	ldrb r0, [r4, #0x1c4]
	cmp r0, #0
	beq _02030D94
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
_02030D94:
	mov r0, #1
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
_02030DB0:
	ldrsh r0, [r4, #0xfe]
	cmp r0, #0x100
	str r0, [sp]
	bne _02030DD8
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	add r1, r4, #4
	bl sub_020289B8
	b _02030E00
_02030DD8:
	add r0, r4, #0x100
	ldrsh r2, [r0]
	add r1, r4, #4
	str r2, [sp, #4]
	ldrsh r0, [r0, #2]
	str r0, [sp, #8]
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	bl sub_02028A08
_02030E00:
	ldr r0, [r4, #0x1bc]
	cmp r0, #4
	bne _02030E88
_02030E0C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	beq _02030E34
	ldrb r0, [r4, #0x1c3]
	cmp r0, #0
	beq _02030E54
_02030E34:
	ldr r0, [r4, #0x104]
	tst r0, #0x400000
	beq _02030E54
	mov r0, r7
	bl sub_02030E94
	mov r0, #7
	str r0, [r4, #0x1bc]
	b _02030E88
_02030E54:
	mov r0, #5
	str r0, [r4, #0x1bc]
_02030E5C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1bc]
_02030E88:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02030E90: .word 0x00000408
	arm_func_end UpdateAdvancedTextBox

	arm_func_start sub_02030E94
sub_02030E94: ; 0x02030E94
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrsb r0, [r5, #0x10]
	ldr r4, [r5, #0xc]
	bl sub_02027B1C
	ldr r2, [r4, #0x1a8]
	cmp r2, #0
	beq _02030EC4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x1ac]
	blx r2
	b _02030ED8
_02030EC4:
	ldr r1, [r4, #0x1a4]
	cmp r1, #0
	beq _02030ED8
	ldrsb r0, [r5, #0x10]
	blx r1
_02030ED8:
	ldrsb r1, [r5, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030E94

	arm_func_start sub_02030EF0
sub_02030EF0: ; 0x02030EF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1c0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1c1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030EF0

	arm_func_start PlayAdvancedTextBoxInputSound
PlayAdvancedTextBoxInputSound: ; 0x02030F28
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl PlayWindowInputSound
	ldmia sp!, {r4, pc}
	arm_func_end PlayAdvancedTextBoxInputSound

	arm_func_start CreateTeamSelectionMenu
CreateTeamSelectionMenu: ; 0x02030F44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _02031114 ; =TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _02031118 ; =UpdateTeamSelectionMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _02031000
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _02030FE0
_02030FBC:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _02030FDC
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_02030FDC:
	add r6, r6, #1
_02030FE0:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _02030FBC
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_02031000:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _02031030
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _02031040
_02031030:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_02031040:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02031118 ; =UpdateTeamSelectionMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0203109C
	add r6, r5, #0x100
	mov r4, #9
_02031084:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02031084
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0203109C:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r2, [r5, #0x190]
	str r8, [r5, #0x198]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x1a8]
	str r2, [r5, #0x1ac]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r5, #0x1b0]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x448]
	add r3, sp, #8
	str r0, [sp]
	ldr r4, [sp, #0x44c]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x28
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02031114: .word TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
_02031118: .word UpdateTeamSelectionMenu
	arm_func_end CreateTeamSelectionMenu

	arm_func_start sub_0203111C
sub_0203111C: ; 0x0203111C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x19c]
	mov r0, #0
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x800000
	str r0, [r4, #0xfc]
	bl sub_0203C984
	add r0, r4, #4
	bl sub_02032984
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203111C

	arm_func_start sub_0203115C
sub_0203115C: ; 0x0203115C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	bl sub_0203C984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0203115C

	arm_func_start sub_0203117C
sub_0203117C: ; 0x0203117C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203117C

	arm_func_start CloseTeamSelectionMenu
CloseTeamSelectionMenu: ; 0x02031198
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTeamSelectionMenu

	arm_func_start IsTeamSelectionMenuActive
IsTeamSelectionMenuActive: ; 0x020311B4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuActive

	arm_func_start sub_020311D4
sub_020311D4: ; 0x020311D4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311D4

	arm_func_start sub_020311E8
sub_020311E8: ; 0x020311E8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _02031218
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_02031218:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311E8

	arm_func_start sub_02031220
sub_02031220: ; 0x02031220
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031220

	arm_func_start UpdateTeamSelectionMenu
UpdateTeamSelectionMenu: ; 0x0203123C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldrsb r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r4, #0x19c]
	and r5, r1, #0xff
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02031714
_02031274: ; jump table
	b _0203129C ; case 0
	b _020312B4 ; case 1
	b _020312F0 ; case 2
	b _02031350 ; case 3
	b _020316A4 ; case 4
	b _020316E8 ; case 5
	b _02031714 ; case 6
	b _02031714 ; case 7
	b _020315D4 ; case 8
	b _0203163C ; case 9
_0203129C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02031714
	mov r0, #2
	str r0, [r4, #0x19c]
_020312B4:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _020312F0
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _020312D4
	mov r0, r7
	bl sub_0203175C
_020312D4:
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _02031714
_020312F0:
	mov r0, r7
	bl sub_0203175C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0203132C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02031714
_0203132C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02031714
_02031350:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, r0
	cmp r1, #0
	bne _020313DC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _020313DC
	mov r3, #0
	ldr r2, _02031758 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _020313C4
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r6, #1
	orr r0, r0, #1
	str r0, [sp, #8]
	b _020313F0
_020313C4:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r6, r6, r0
	b _020313F0
_020313DC:
	cmp r1, #4
	cmpne r1, #8
	cmpne r1, #0xc
	beq _020313F0
	bl sub_0203C984
_020313F0:
	cmp r6, #0
	beq _02031400
	mov r0, r7
	bl sub_0203175C
_02031400:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0203148C
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0203147C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _02031450
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02031450:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_0203147C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _020315C4
_0203148C:
	tst r1, #2
	beq _020314C8
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_020314C8:
	tst r1, #0x1000
	beq _02031518
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _02031518
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
	b _020315C4
_02031518:
	tst r1, #0x2000
	beq _02031568
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _02031568
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _020315C4
_02031568:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _02031590
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _020315C4
_02031590:
	bl sub_0203250C
	cmp r0, #0
	beq _020315C4
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
_020315C4:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _02031714
_020315D4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _020315F0
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020315F0:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_0203163C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _02031658
	mov r0, r7
	bl sub_0203175C
	b _02031714
_02031658:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020316A4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _020316E0
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _020316E0
	mov r0, r7
	bl sub_0203175C
	mov r0, #7
	str r0, [r4, #0x19c]
	b _02031714
_020316E0:
	mov r0, #5
	str r0, [r4, #0x19c]
_020316E8:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x19c]
_02031714:
	mov r0, #0
	strb r0, [r4, #0x1b0]
	cmp r5, #0
	beq _02031740
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _02031740
	mov r0, r7
	bl sub_0203175C
	mov r0, #1
	strb r0, [r4, #0x1b0]
_02031740:
	ldr r0, [r4, #0x190]
	cmp r0, #0
	beq _02031750
	blx r0
_02031750:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02031758: .word 0x00000408
	arm_func_end UpdateTeamSelectionMenu

	arm_func_start sub_0203175C
sub_0203175C: ; 0x0203175C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r6, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	addne sb, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq sb, #0
	bl sub_02027B1C
	cmp r6, #0
	mov r7, #0
	ble _02031868
	mov fp, #0x42
	b _02031860
_020317B8:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _020317E8
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_020317E8:
	cmp r8, #0
	beq _02031858
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _02031830
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp, #4]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #8]
	ldrsb r0, [sl, #0x10]
	bl sub_02026428
	b _02031858
_02031830:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #4]
	ldrsb r0, [sl, #0x10]
	bl sub_02026358
_02031858:
	add r7, r7, #1
	add r5, r5, #1
_02031860:
	cmp r7, r6
	blt _020317B8
_02031868:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0203175C

	arm_func_start sub_02031888
sub_02031888: ; 0x02031888
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031888

	arm_func_start sub_0203189C
sub_0203189C: ; 0x0203189C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x190]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203189C

	arm_func_start IsTeamSelectionMenuState3
IsTeamSelectionMenuState3: ; 0x020318B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuState3

	arm_func_start sub_020318D0
sub_020318D0: ; 0x020318D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1a0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1a1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020318D0

	arm_func_start sub_02031908
sub_02031908: ; 0x02031908
	ldr ip, _02031910 ; =KeyWaitInit
	bx ip
	.align 2, 0
_02031910: .word KeyWaitInit
	arm_func_end sub_02031908

	arm_func_start sub_02031914
sub_02031914: ; 0x02031914
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, #0
	mov r6, r1
	mov r4, r0
	add r1, sp, #4
	mov r0, r5
	bl GetHeldButtons
	add r1, sp, #2
	mov r0, r5
	bl GetPressedButtons
	ldrh r1, [sp, #2]
	tst r1, #1
	orrne r5, r5, #1
	tst r1, #2
	orrne r5, r5, #2
	tst r1, #0x800
	orrne r5, r5, #0x1000
	tst r1, #0x400
	orrne r5, r5, #0x2000
	tst r1, #0x200
	beq _0203197C
	ldrh r0, [sp, #4]
	tst r0, #0x100
	orrne r5, r5, #0x800
	orr r5, r5, #0x400
_0203197C:
	tst r1, #8
	orrne r5, r5, #0x100
	tst r1, #4
	orrne r5, r5, #0x200
	cmp r5, #0
	mov r0, #0
	beq _020319A0
	bl sub_020063A0
	b _020319F8
_020319A0:
	add r1, sp, #0
	bl sub_020063F4
	tst r6, #8
	beq _020319D4
	ldrh r0, [sp, #4]
	tst r0, #0x100
	beq _020319D4
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x4000
	tst r0, #0x80
	orrne r5, r5, #0x8000
	b _020319E8
_020319D4:
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x10
	tst r0, #0x80
	orrne r5, r5, #0x20
_020319E8:
	tst r0, #0x20
	orrne r5, r5, #0x40
	tst r0, #0x10
	orrne r5, r5, #0x80
_020319F8:
	ldrh r0, [sp, #4]
	tst r0, #0x200
	orrne r5, r5, #4
	tst r0, #0x100
	orrne r5, r5, #8
	cmp r4, #0
	beq _02031A30
	bl sub_0204AE60
	cmp r0, #0
	mov r0, r4
	beq _02031A2C
	bl GetReleasedStylus
	b _02031A30
_02031A2C:
	bl sub_02006BFC
_02031A30:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02031914

	arm_func_start sub_02031A3C
sub_02031A3C: ; 0x02031A3C
	stmdb sp!, {r3, lr}
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02031A3C

	arm_func_start sub_02031A5C
sub_02031A5C: ; 0x02031A5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02031A5C

	arm_func_start CalcMenuHeightDiv8__02031AA4
CalcMenuHeightDiv8__02031AA4: ; 0x02031AA4
	tst r0, #0x40000
	bne _02031ABC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_02031ABC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__02031AA4

	arm_func_start InitWindowInput
InitWindowInput: ; 0x02031AF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02031B28:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02031B28
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	str r1, [r7, #0xd0]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02031B90
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02031B98
_02031B90:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02031B98:
	mov r0, r7
	bl sub_02032754
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02031C2C
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02031C20
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02031C20:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02031C34
_02031C2C:
	mov r0, r7
	bl sub_02032894
_02031C34:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02031C4C
	ldr r1, [r6]
	mov r0, r7
	bl sub_02032684
_02031C4C:
	bl sub_02031908
	mov r1, #0
	strb r1, [r7, #0xf4]
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_02032984
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitWindowInput

	arm_func_start sub_02031C74
sub_02031C74: ; 0x02031C74
	ldr r2, [r0, #0x10]
	orr r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C74

	arm_func_start sub_02031C84
sub_02031C84: ; 0x02031C84
	ldr r2, [r0, #0x10]
	mvn r1, r1
	and r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C84

	arm_func_start sub_02031C98
sub_02031C98: ; 0x02031C98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031DD4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031D18
	tst r1, #0x20000
	beq _02031D18
	tst r1, #0x2000000
	bne _02031D18
	tst sb, #8
	beq _02031D18
	tst sb, #0x10
	beq _02031D04
	mov r0, r8
	bl sub_0203280C
	b _02031D44
_02031D04:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020327E4
	b _02031D44
_02031D18:
	tst r1, #0x1000000
	bne _02031D44
	tst sb, #0x10
	beq _02031D34
	mov r0, r8
	bl sub_0203261C
	b _02031D44
_02031D34:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020325AC
_02031D44:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031DBC
	tst r0, #0x20000
	bne _02031DBC
	tst r0, #0x2000000
	bne _02031DBC
	tst r0, #0x10000
	beq _02031D98
	tst sb, #8
	beq _02031D98
	tst sb, #0x40
	beq _02031D84
	mov r0, r8
	bl sub_02032864
	b _02031DBC
_02031D84:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_0203282C
	b _02031DBC
_02031D98:
	tst sb, #0x40
	beq _02031DAC
	mov r0, r8
	bl sub_0203280C
	b _02031DBC
_02031DAC:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_020327E4
_02031DBC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031DDC
_02031DD4:
	mov sb, #0
	bl sub_02006BFC
_02031DDC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031E0C
	add ip, sp, #0
	mov r7, #2
_02031DF4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031DF4
	ldr r0, [ip]
	str r0, [r6]
_02031E0C:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _02031E2C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02031E78
_02031E2C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02031E44
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02031E44:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02031E74
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02031E74
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02031E78
_02031E74:
	mov r0, #0
_02031E78:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031C98

	arm_func_start sub_02031E80
sub_02031E80: ; 0x02031E80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031FC4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031F00
	tst r1, #0x20000
	beq _02031F00
	tst r1, #0x2000000
	bne _02031F00
	tst sb, #8
	beq _02031F00
	tst sb, #0x10
	beq _02031EEC
	mov r0, r8
	bl sub_0203280C
	b _02031F34
_02031EEC:
	tst sb, #0x20
	beq _02031F34
	mov r0, r8
	bl sub_020327E4
	b _02031F34
_02031F00:
	tst r1, #0x1000000
	bne _02031F34
	tst sb, #0x10
	beq _02031F20
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_02032654
	b _02031F34
_02031F20:
	tst sb, #0x20
	beq _02031F34
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_020325E8
_02031F34:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031FAC
	tst r0, #0x20000
	bne _02031FAC
	tst r0, #0x2000000
	bne _02031FAC
	tst r0, #0x10000
	beq _02031F88
	tst sb, #8
	beq _02031F88
	tst sb, #0x40
	beq _02031F74
	mov r0, r8
	bl sub_02032864
	b _02031FAC
_02031F74:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_0203282C
	b _02031FAC
_02031F88:
	tst sb, #0x40
	beq _02031F9C
	mov r0, r8
	bl sub_0203280C
	b _02031FAC
_02031F9C:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_020327E4
_02031FAC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031FCC
_02031FC4:
	mov sb, #0
	bl sub_02006BFC
_02031FCC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031FFC
	add ip, sp, #0
	mov r7, #2
_02031FE4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031FE4
	ldr r0, [ip]
	str r0, [r6]
_02031FFC:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _0203201C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02032068
_0203201C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02032034
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02032034:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02032064
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02032064
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02032068
_02032064:
	mov r0, #0
_02032068:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031E80

	arm_func_start sub_02032070
sub_02032070: ; 0x02032070
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _020320A0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _020320A0
	mov r0, #1
	bx lr
_020320A0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032070

	arm_func_start sub_020320A8
sub_020320A8: ; 0x020320A8
	mov r2, #6
	str r2, [r0, #0xd8]
	str r1, [r0, #0xdc]
	mov r1, #0
	str r1, [r0, #0xe0]
	bx lr
	arm_func_end sub_020320A8

	arm_func_start sub_020320C0
sub_020320C0: ; 0x020320C0
	ldr r0, [r0, #0xdc]
	bx lr
	arm_func_end sub_020320C0

	arm_func_start sub_020320C8
sub_020320C8: ; 0x020320C8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_020320C8

	arm_func_start sub_020320EC
sub_020320EC: ; 0x020320EC
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r3, r2, #7
	str r3, [r0, #0xdc]
	mov r2, #0
	str r2, [r0, #0xe0]
	cmp r1, #0
	streq r3, [r0, #0xe8]
	streq r3, [r0, #0xe4]
	streq r3, [r0, #0xf0]
	streq r3, [r0, #0xec]
	bxeq lr
	ldr r3, [r1, #8]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xec]
	ldr r3, [r1, #0xc]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xf0]
	ldr r3, [r1]
	ldr r2, [r0]
	sub r2, r3, r2
	str r2, [r0, #0xe4]
	ldr r2, [r1, #4]
	ldr r1, [r0]
	sub r1, r2, r1
	str r1, [r0, #0xe8]
	bx lr
	arm_func_end sub_020320EC

	arm_func_start sub_02032160
sub_02032160: ; 0x02032160
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _020322A4
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _0203229C
_020321BC:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032298
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032288
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032288:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _020322A8
_02032298:
	add r6, r6, #1
_0203229C:
	cmp r6, r5
	blt _020321BC
_020322A4:
	mvn r0, #0
_020322A8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032160

	arm_func_start sub_020322B0
sub_020322B0: ; 0x020322B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov sb, r1
	ldrh r1, [sb]
	mov r8, r2
	mov sl, r0
	tst r1, r8
	ldr r7, [sp, #0x38]
	beq _020323EC
	cmp r3, #0
	ldrge r0, [sl, #8]
	ldr r1, [sp, #0x30]
	ldrlt r0, [sl, #0xc]
	cmp r1, #0
	add r0, r0, r3
	str r0, [sp, #8]
	ldrgt r0, [sl, #8]
	mov r5, #0
	ldrle r0, [sl, #0xc]
	add r4, sp, #0
	add r1, r0, r1
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0xc]
	mov r6, r0, lsl #8
	b _020323E4
_02032314:
	mul r3, r5, r6
	add r0, r5, #1
	mul r2, r0, r6
	mov r0, r3, asr #7
	mov r1, r2, asr #7
	ldr ip, [sl, #0xb4]
	add r0, r3, r0, lsr #24
	ldr r3, [sl]
	add r0, ip, r0, asr #8
	add r0, r3, r0
	str r0, [sp]
	ldr r3, [sl, #0xb4]
	add r0, r2, r1, lsr #24
	ldr r1, [sl]
	add r0, r3, r0, asr #8
	add r0, r1, r0
	sub r3, r0, #2
	mov r0, sb
	mov r1, r8
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _020323E0
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _020323D8
	mov r0, #6
	str r0, [sl, #0xd8]
	sub r0, r0, #7
	str r0, [sl, #0xdc]
	mov r0, #0
	str r0, [sl, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xf0]
	ldr r1, [sp]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe8]
_020323D8:
	mov r0, r5
	b _020323F0
_020323E0:
	add r5, r5, #1
_020323E4:
	cmp r5, r7
	blt _02032314
_020323EC:
	mvn r0, #0
_020323F0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020322B0

	arm_func_start sub_020323F8
sub_020323F8: ; 0x020323F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032440
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032440
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032440:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020323F8

	arm_func_start IsMenuOptionActive
IsMenuOptionActive: ; 0x02032474
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _020324BC
	tst r1, #0x8000000
	bne _020324BC
	tst r1, #0x200
	beq _020324B4
	bl sub_02032578
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _020324BC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324B4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324BC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsMenuOptionActive

	arm_func_start sub_020324C4
sub_020324C4: ; 0x020324C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _02032504
	tst r1, #0x200
	beq _020324FC
	bl sub_02032578
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _02032504
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324FC:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02032504:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020324C4

	arm_func_start sub_0203250C
sub_0203250C: ; 0x0203250C
	ldr r3, [r0, #0x10]
	tst r3, #0x2000
	beq _02032530
	tst r1, #0x1000
	beq _02032530
	ldr r2, [r0, #0x88]
	cmp r2, #0
	moveq r0, #1
	bxeq lr
_02032530:
	tst r3, #0x4000
	beq _02032550
	tst r1, #0x2000
	beq _02032550
	ldr r0, [r0, #0x90]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
_02032550:
	mov r0, #0
	bx lr
	arm_func_end sub_0203250C

	arm_func_start sub_02032558
sub_02032558: ; 0x02032558
	ldr r0, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032558

	arm_func_start sub_02032560
sub_02032560: ; 0x02032560
	ldr r0, [r0, #0xc8]
	bx lr
	arm_func_end sub_02032560

	arm_func_start sub_02032568
sub_02032568: ; 0x02032568
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02032568

	arm_func_start sub_02032578
sub_02032578: ; 0x02032578
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02032578

	arm_func_start sub_0203258C
sub_0203258C: ; 0x0203258C
	ldr r0, [r0, #0xd0]
	bx lr
	arm_func_end sub_0203258C

	arm_func_start sub_02032594
sub_02032594: ; 0x02032594
	ldr r0, [r0, #0xc0]
	bx lr
	arm_func_end sub_02032594

	arm_func_start sub_0203259C
sub_0203259C: ; 0x0203259C
	ldr r0, [r0, #0xc4]
	bx lr
	arm_func_end sub_0203259C

	arm_func_start sub_020325A4
sub_020325A4: ; 0x020325A4
	ldr r0, [r0, #0xcc]
	bx lr
	arm_func_end sub_020325A4

	arm_func_start sub_020325AC
sub_020325AC: ; 0x020325AC
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325AC

	arm_func_start sub_020325E8
sub_020325E8: ; 0x020325E8
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r2, [r0, #0xbc]
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0, #0xbc]
	subge r1, r1, #1
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325E8

	arm_func_start sub_0203261C
sub_0203261C: ; 0x0203261C
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_0203261C

	arm_func_start sub_02032654
sub_02032654: ; 0x02032654
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	movmi r1, #0
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032654

	arm_func_start sub_02032684
sub_02032684: ; 0x02032684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	strb r0, [r5, #0xd4]
	movs r4, r1
	ldr r0, [r5, #0x10]
	movmi r4, #0
	tst r0, #0x8000
	beq _020326E0
	ldr r0, [r5, #0xd0]
	ldr r1, [r5, #0xc4]
	cmp r4, r0
	subge r4, r0, #1
	mov r0, r4
	bl _s32_div_f
	str r0, [r5, #0xc8]
	ldr r1, [r5, #0xc4]
	mov r0, r4
	bl _s32_div_f
	mov r0, r5
	str r1, [r5, #0xbc]
	bl sub_02032754
	ldmia sp!, {r3, r4, r5, pc}
_020326E0:
	ldr r0, [r5, #0xc0]
	cmp r4, r0
	subge r0, r0, #1
	strge r0, [r5, #0xbc]
	strlt r4, [r5, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02032684

	arm_func_start sub_020326F8
sub_020326F8: ; 0x020326F8
	mov r3, #1
	cmp r1, #0
	movlt r1, #0
	strb r3, [r0, #0xd4]
	cmp r1, r2
	ldrge r1, [r0, #0xc0]
	subge r1, r1, #1
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020326F8

	arm_func_start sub_0203271C
sub_0203271C: ; 0x0203271C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_02032754
	ldr r0, [r4, #0xcc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	orrge r0, r0, #0x10000
	biclt r0, r0, #0x10000
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203271C

	arm_func_start sub_02032754
sub_02032754: ; 0x02032754
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldr r1, [r4, #0xc8]
	sub r0, r0, #1
	cmp r1, r0
	strge r0, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032754

	arm_func_start sub_020327CC
sub_020327CC: ; 0x020327CC
	str r1, [r0, #0xd0]
	str r2, [r0, #0xc4]
	mov r1, #0
	str r1, [r0, #0xbc]
	str r1, [r0, #0xc8]
	bx lr
	arm_func_end sub_020327CC

	arm_func_start sub_020327E4
sub_020327E4: ; 0x020327E4
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _02032808 ; =sub_02032754
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032808: .word sub_02032754
	arm_func_end sub_020327E4

	arm_func_start sub_0203280C
sub_0203280C: ; 0x0203280C
	ldr r1, [r0, #0xc8]
	ldr ip, _02032828 ; =sub_02032754
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032828: .word sub_02032754
	arm_func_end sub_0203280C

	arm_func_start sub_0203282C
sub_0203282C: ; 0x0203282C
	ldr r2, [r0, #0xcc]
	ldr r1, [r0, #0xc8]
	sub r2, r2, #1
	cmp r1, r2
	movge r1, #0
	strge r1, [r0, #0xc8]
	bge _02032858
	add r1, r1, #0xa
	cmp r1, r2
	movle r2, r1
	str r2, [r0, #0xc8]
_02032858:
	ldr ip, _02032860 ; =sub_02032754
	bx ip
	.align 2, 0
_02032860: .word sub_02032754
	arm_func_end sub_0203282C

	arm_func_start sub_02032864
sub_02032864: ; 0x02032864
	ldr r1, [r0, #0xc8]
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	suble r1, r1, #1
	strle r1, [r0, #0xc8]
	ble _02032888
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
_02032888:
	ldr ip, _02032890 ; =sub_02032754
	bx ip
	.align 2, 0
_02032890: .word sub_02032754
	arm_func_end sub_02032864

	arm_func_start sub_02032894
sub_02032894: ; 0x02032894
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _020328B4
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _020328D0
_020328B4:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_020328D0:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032894

	arm_func_start sub_020328D8
sub_020328D8: ; 0x020328D8
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_020328D8

	arm_func_start sub_020328F4
sub_020328F4: ; 0x020328F4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032910
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032910:
	mov r0, #0
	bx lr
	arm_func_end sub_020328F4

	arm_func_start sub_02032918
sub_02032918: ; 0x02032918
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032934
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032934:
	mov r0, #0
	bx lr
	arm_func_end sub_02032918

	arm_func_start sub_0203293C
sub_0203293C: ; 0x0203293C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032958
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032958:
	mov r0, #0
	bx lr
	arm_func_end sub_0203293C

	arm_func_start PlayWindowInputSound
PlayWindowInputSound: ; 0x02032960
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end PlayWindowInputSound

	arm_func_start sub_02032984
sub_02032984: ; 0x02032984
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_02032984

	arm_func_start sub_0203299C
sub_0203299C: ; 0x0203299C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203299C

	arm_func_start CalcMenuHeightDiv8__020329E4
CalcMenuHeightDiv8__020329E4: ; 0x020329E4
	tst r0, #0x40000
	bne _020329FC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_020329FC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__020329E4

	arm_func_start InitInventoryMenuInput
InitInventoryMenuInput: ; 0x02032A38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02032A68:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02032A68
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	ldrb r0, [sp, #0x28]
	str r1, [r7, #0xd0]
	strb r0, [r7, #0xd5]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02032AD8
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02032AE0
_02032AD8:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02032AE0:
	mov r0, r7
	bl sub_020331D4
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02032B74
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02032B68
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02032B68:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02032B7C
_02032B74:
	mov r0, r7
	bl sub_0203330C
_02032B7C:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02032B94
	ldr r1, [r6]
	mov r0, r7
	bl sub_020330EC
_02032B94:
	bl sub_02031908
	mov r1, #0
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_020333FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitInventoryMenuInput

	arm_func_start sub_02032BB8
sub_02032BB8: ; 0x02032BB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x24
	mov sb, r0
	mov r6, r3
	mov r8, r1
	mov r7, r2
	ldr r4, [sb, #0xc8]
	ldr r5, [sb, #0xbc]
	bl sub_02033414
	mov sl, r0
	cmp r6, #0
	add r0, sp, #0
	beq _02032D04
	ldr r1, [sb, #0x10]
	bl sub_02031914
	ldr r1, [sb, #0x10]
	mov r6, r0
	tst r1, #0x8000
	beq _02032C44
	tst r1, #0x20000
	beq _02032C44
	tst r1, #0x2000000
	bne _02032C44
	tst r6, #8
	beq _02032C44
	tst r6, #0x10
	beq _02032C30
	mov r0, sb
	bl sub_020332AC
	b _02032C74
_02032C30:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033284
	b _02032C74
_02032C44:
	tst r1, #0x1000000
	cmpeq sl, #0
	bne _02032C74
	tst r6, #0x10
	beq _02032C64
	mov r0, sb
	bl sub_020330B4
	b _02032C74
_02032C64:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033078
_02032C74:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _02032CEC
	tst r0, #0x20000
	bne _02032CEC
	tst r0, #0x2000000
	bne _02032CEC
	tst r0, #0x10000
	beq _02032CC8
	tst r6, #8
	beq _02032CC8
	tst r6, #0x40
	beq _02032CB4
	mov r0, sb
	bl sub_020332F0
	b _02032CEC
_02032CB4:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_020332CC
	b _02032CEC
_02032CC8:
	tst r6, #0x40
	beq _02032CDC
	mov r0, sb
	bl sub_020332AC
	b _02032CEC
_02032CDC:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_02033284
_02032CEC:
	ldr r0, [sb, #0x10]
	tst r0, #1
	biceq r6, r6, #1
	tst r0, #2
	biceq r6, r6, #2
	b _02032D0C
_02032D04:
	mov r6, #0
	bl sub_02006BFC
_02032D0C:
	cmp r8, #0
	strne r6, [r8]
	cmp r7, #0
	beq _02032D3C
	add r8, sp, #0
	mov r6, #2
_02032D24:
	ldmia r8!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02032D24
	ldr r0, [r8]
	str r0, [r7]
_02032D3C:
	ldr r0, [sb, #0xc8]
	cmp r4, r0
	beq _02032D5C
	mov r0, sb
	mov r1, #4
	bl sub_020333D8
	mov r0, #1
	b _02032DA8
_02032D5C:
	ldr r0, [sb, #0xbc]
	cmp r5, r0
	beq _02032D74
	mov r0, sb
	mov r1, #3
	bl sub_020333D8
_02032D74:
	ldr r0, [sb, #0xd8]
	cmp r0, #0
	ble _02032DA4
	subs r0, r0, #1
	str r0, [sb, #0xd8]
	bne _02032DA4
	mvn r0, #0
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	mov r0, #1
	b _02032DA8
_02032DA4:
	mov r0, #0
_02032DA8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02032BB8

	arm_func_start sub_02032DB0
sub_02032DB0: ; 0x02032DB0
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _02032DE0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _02032DE0
	mov r0, #1
	bx lr
_02032DE0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032DB0

	arm_func_start sub_02032DE8
sub_02032DE8: ; 0x02032DE8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_02032DE8

	arm_func_start sub_02032E0C
sub_02032E0C: ; 0x02032E0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _02032F50
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _02032F48
_02032E68:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032F44
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032F34
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032F34:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _02032F54
_02032F44:
	add r6, r6, #1
_02032F48:
	cmp r6, r5
	blt _02032E68
_02032F50:
	mvn r0, #0
_02032F54:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032E0C

	arm_func_start sub_02032F5C
sub_02032F5C: ; 0x02032F5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032FA4
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032FA4
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032FA4:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02032F5C

	arm_func_start sub_02032FD8
sub_02032FD8: ; 0x02032FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _0203304C
	tst r1, #0x8000000
	bne _0203304C
	tst r1, #0x200
	beq _02033044
	bl sub_02033414
	cmp r0, #0
	bne _02033028
	mov r0, r4
	bl sub_02033064
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _0203304C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02033028:
	ldr r0, [r4, #0xac]
	ldrb r0, [r0, #0x7f]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_02033044:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203304C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032FD8

	arm_func_start sub_02033054
sub_02033054: ; 0x02033054
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02033054

	arm_func_start sub_02033064
sub_02033064: ; 0x02033064
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02033064

	arm_func_start sub_02033078
sub_02033078: ; 0x02033078
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02033078

	arm_func_start sub_020330B4
sub_020330B4: ; 0x020330B4
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020330B4

	arm_func_start sub_020330EC
sub_020330EC: ; 0x020330EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #1
	strb r0, [r4, #0xd4]
	movs r5, r1
	ldr r0, [r4, #0x10]
	movmi r5, #0
	tst r0, #0x8000
	beq _02033194
	ldr r1, [r4, #0xd0]
	cmp r5, r1
	blt _02033168
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	beq _02033140
	ldr r1, [r4, #0xcc]
	mov r0, #0
	sub r1, r1, #1
	str r1, [r4, #0xc8]
	str r0, [r4, #0xbc]
	b _02033188
_02033140:
	sub r5, r1, #1
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
	b _02033188
_02033168:
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
_02033188:
	mov r0, r4
	bl sub_020331D4
	ldmia sp!, {r3, r4, r5, pc}
_02033194:
	ldr r0, [r4, #0xc0]
	cmp r5, r0
	subge r0, r0, #1
	strge r0, [r4, #0xbc]
	strlt r5, [r4, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020330EC

	arm_func_start sub_020331AC
sub_020331AC: ; 0x020331AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_020331D4
	mov r0, r4
	bl sub_02033064
	mov r1, r0
	mov r0, r4
	bl sub_020330EC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331AC

	arm_func_start sub_020331D4
sub_020331D4: ; 0x020331D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	ldrne r0, [r4, #0xcc]
	addne r0, r0, #1
	strne r0, [r4, #0xcc]
	ldr r1, [r4, #0xcc]
	ldr r0, [r4, #0xc8]
	sub r1, r1, #1
	cmp r0, r1
	strge r1, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	mov r0, r4
	bl sub_02033414
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xbc]
	movne r0, #1
	strne r0, [r4, #0xc0]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331D4

	arm_func_start sub_02033284
sub_02033284: ; 0x02033284
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _020332A8 ; =sub_020331D4
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332A8: .word sub_020331D4
	arm_func_end sub_02033284

	arm_func_start sub_020332AC
sub_020332AC: ; 0x020332AC
	ldr r1, [r0, #0xc8]
	ldr ip, _020332C8 ; =sub_020331D4
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332C8: .word sub_020331D4
	arm_func_end sub_020332AC

	arm_func_start sub_020332CC
sub_020332CC: ; 0x020332CC
	ldr r2, [r0, #0xc8]
	ldr r1, [r0, #0xcc]
	add r2, r2, #0xa
	cmp r2, r1
	subge r2, r1, #1
	ldr ip, _020332EC ; =sub_020331D4
	str r2, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332EC: .word sub_020331D4
	arm_func_end sub_020332CC

	arm_func_start sub_020332F0
sub_020332F0: ; 0x020332F0
	ldr r1, [r0, #0xc8]
	ldr ip, _02033308 ; =sub_020331D4
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02033308: .word sub_020331D4
	arm_func_end sub_020332F0

	arm_func_start sub_0203330C
sub_0203330C: ; 0x0203330C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _0203332C
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _02033348
_0203332C:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_02033348:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203330C

	arm_func_start sub_02033350
sub_02033350: ; 0x02033350
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_02033350

	arm_func_start sub_0203336C
sub_0203336C: ; 0x0203336C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02033388
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02033388:
	mov r0, #0
	bx lr
	arm_func_end sub_0203336C

	arm_func_start sub_02033390
sub_02033390: ; 0x02033390
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333AC
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333AC:
	mov r0, #0
	bx lr
	arm_func_end sub_02033390

	arm_func_start sub_020333B4
sub_020333B4: ; 0x020333B4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333D0
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333D0:
	mov r0, #0
	bx lr
	arm_func_end sub_020333B4

	arm_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020333D8

	arm_func_start sub_020333FC
sub_020333FC: ; 0x020333FC
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_020333FC

	arm_func_start sub_02033414
sub_02033414: ; 0x02033414
	ldrb r1, [r0, #0xd5]
	cmp r1, #0
	beq _02033438
	ldr r1, [r0, #0xc8]
	ldr r2, [r0, #0xcc]
	add r0, r1, #1
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_02033438:
	mov r0, #0
	bx lr
	arm_func_end sub_02033414

	arm_func_start sub_02033440
sub_02033440: ; 0x02033440
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r5, r0
	tst r5, #0x800
	mov r4, #0
	beq _02033498
	ldrh r2, [r1, #8]
	cmp r2, #0
	moveq r0, r4
	beq _02033488
	ldr r3, _020334A4 ; =0x0000C402
	add ip, r1, #0x10
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #4
	bl sub_020265A8
_02033488:
	tst r5, #0x8000
	addne r0, r0, #0x40
	cmp r0, #0
	movgt r4, r0
_02033498:
	mov r0, r4
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020334A4: .word 0x0000C402
	arm_func_end sub_02033440

	arm_func_start sub_020334A8
sub_020334A8: ; 0x020334A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r0, [r5, #0x10]
	mov r4, r1
	tst r0, #0x800
	beq _02033598
	ldrh r2, [r5, #0x1c]
	cmp r2, #0
	beq _020334FC
	ldr r3, _020335A0 ; =0x0000C402
	add ip, r5, #0x24
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
_020334FC:
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_020328F4
	cmp r0, #0
	beq _02033598
	mov r0, r5
	bl sub_02032560
	add r1, r0, #1
	mov r0, r5
	str r1, [sp, #0x28]
	bl sub_020325A4
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _020335A4 ; =_0209AFC4
	ldr r3, _020335A0 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov ip, r0
	ldr r3, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r3, r1
	mov r2, #0
	sub r1, r1, ip
	add r3, sp, #0x54
	bl DrawTextInWindow
_02033598:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020335A0: .word 0x0000C402
_020335A4: .word _0209AFC4
	arm_func_end sub_020334A8

	arm_func_start sub_020335A8
sub_020335A8: ; 0x020335A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r2, [r5, #0x10]
	mov r4, r1
	tst r2, #0x800
	beq _020336E8
	bl sub_02033414
	cmp r0, #0
	beq _02033610
	ldr r3, _020336F0 ; =0x000008E3
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl sub_02026268
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	b _020336E8
_02033610:
	add r0, r5, #0x24
	str r0, [sp]
	ldrh r2, [r5, #0x1c]
	ldr r3, _020336F4 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_0203336C
	cmp r0, #0
	beq _020336E8
	ldr r0, [r5, #0xc8]
	ldr r2, _020336F8 ; =_0209AFC4
	add r0, r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r5, #0xd5]
	ldr r3, _020336F4 ; =0x0000C402
	add ip, sp, #4
	cmp r0, #0
	movne r1, #1
	ldr r0, [r5, #0xcc]
	moveq r1, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov r2, r0
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	add r3, sp, #0x54
	sub r1, r1, r0
	sub r1, r1, r2
	mov r0, r4
	mov r2, #0
	bl DrawTextInWindow
_020336E8:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_020336F0: .word 0x00001D3B
#else
_020336F0: .word 0x000008E3
#endif
_020336F4: .word 0x0000C402
_020336F8: .word _0209AFC4
	arm_func_end sub_020335A8

	arm_func_start sub_020336FC
sub_020336FC: ; 0x020336FC
	tst r0, #0x1000
	mov r1, #0
	beq _02033750
	mov r2, #4
	tst r0, #0x2000
	addne r2, r2, #0x12
	tst r0, #0x4000
	addne r2, r2, #0x14
	tst r0, #0x20000
	addne r2, r2, #0x1f
	bne _02033738
	tst r0, #0x8000
	addne r2, r2, #0x3e
	tst r0, #8
	addne r2, r2, #0x1f
_02033738:
	tst r0, #4
	addne r2, r2, #0x12
	tst r0, #2
	addne r2, r2, #0x12
	cmp r2, #0
	movgt r1, r2
_02033750:
	mov r0, r1
	bx lr
	arm_func_end sub_020336FC

	arm_func_start sub_02033758
sub_02033758: ; 0x02033758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	ldrb r0, [sb, #0xf4]
	mov r8, r1
	ldr r1, [sb, #0x10]
	cmp r0, #0
	ldrne r0, _02033BBC ; =0x00001002
	mov r7, r2
	moveq r0, #2
	mov r0, r0, lsl #0x10
	mov r4, #0
	tst r1, #0x1000
	mov r5, r0, lsr #0x10
	beq _02033B98
	ldrh r0, [r7]
	tst r0, r5
	beq _02033B98
	ldmib sb, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [sb, #4]
	add r6, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sb, #0x10]
	tst r0, #0x2000
	beq _0203380C
	mov r0, #0x12
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r8]
	add r6, r6, #0x12
_0203380C:
	ldr r0, [sb, #0x10]
	tst r0, #0x4000
	beq _0203385C
	mov r0, #0x13
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r8]
	add r6, r6, #0x14
_0203385C:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _020339C8
	tst r0, #0x20000
	bne _020339C8
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _020339C4
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _020338D4
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _020338D4
	mov r0, sb
	bl sub_02032864
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r8]
_020338D4:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _0203392C
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _0203392C
	mov r0, sb
	bl sub_0203282C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r8]
_0203392C:
	add ip, r6, #0x1f
	add r3, r6, #0x2a
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033978
	mov r0, sb
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r8]
_02033978:
	add ip, r6, #0x2d
	add r3, r6, #0x38
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _020339C4
	mov r0, sb
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r8]
_020339C4:
	add r6, r6, #0x3e
_020339C8:
	ldr r0, [sb, #0x10]
	tst r0, #8
	bne _020339EC
	tst r0, #0x20000
	beq _02033AE0
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _02033AE0
_020339EC:
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000000
	bne _02033A64
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033A64
	ldr r0, [r8]
	orr r0, r0, #0x40000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033A58
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x4000
	str r0, [r8]
	b _02033A60
_02033A58:
	mov r1, #0
	bl PlayWindowInputSound
_02033A60:
	mov r4, #1
_02033A64:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x40000000
	bne _02033AE0
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033AE0
	ldr r0, [r8]
	orr r0, r0, #0x80000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033AD4
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x8000
	str r0, [r8]
	b _02033ADC
_02033AD4:
	mov r1, #0
	bl PlayWindowInputSound
_02033ADC:
	mov r4, #1
_02033AE0:
	ldr r1, [sb, #0xc]
	ldr r0, [sb, #0x10]
	add r6, r1, #4
	tst r0, #2
	beq _02033B2C
	sub r6, r6, #0x12
	add r3, r6, #0xb
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r8]
_02033B2C:
	ldr r0, [sb, #0x10]
	tst r0, #4
	beq _02033B98
	sub ip, r6, #0x12
	sub r3, r6, #7
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033B98
	ldr r0, [sb, #0x10]
	tst r0, #0x18000000
	ldreq r0, [r8]
	orreq r0, r0, #1
	orreq r0, r0, #0x10000
	streq r0, [r8]
	beq _02033B94
	ldr r1, [r8]
	mov r0, sb
	orr r2, r1, #0x10000
	mov r1, #2
	str r2, [r8]
	bl PlayWindowInputSound
_02033B94:
	mov r4, #1
_02033B98:
	ldr r1, [r8]
	cmp r1, #0
	beq _02033BB0
	mov r0, sb
	bl sub_020320C8
	mov r4, #1
_02033BB0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02033BBC: .word 0x00001002
	arm_func_end sub_02033758

	arm_func_start sub_02033BC0
sub_02033BC0: ; 0x02033BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02033ECC
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033C44
	tst r4, #0x1000000
	ldrne r3, _02033ED4 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _02033ED8 ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
	add r6, r6, #0x12
_02033C44:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02033C70
	tst r4, #0x2000000
	ldrne r3, _02033EDC ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02033EE0 ; =_0209AFF4
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	add r6, r6, #0x14
_02033C70:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02033D74
	tst r0, #0x20000
	bne _02033D74
	mov r0, r8
	bl sub_020328F4
	cmp r0, #0
	beq _02033D70
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02033D08
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033CB8
	tst r4, #0x400000
	beq _02033CD4
_02033CB8:
	tst r4, #0x400000
	ldrne r3, _02033EE4 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _02033EE8 ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033CD4:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033CEC
	tst r4, #0x800000
	beq _02033D08
_02033CEC:
	tst r4, #0x800000
	ldrne r3, _02033EEC ; =_0209B00C
	mov r0, r7
	ldreq r3, _02033EF0 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033D08:
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033D20
	tst r4, #0x100000
	beq _02033D3C
_02033D20:
	tst r4, #0x100000
	ldrne r3, _02033EF4 ; =_0209B01C
	mov r0, r7
	ldreq r3, _02033EF8 ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_02033D3C:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033D54
	tst r4, #0x200000
	beq _02033D70
_02033D54:
	tst r4, #0x200000
	ldrne r3, _02033EFC ; =_0209B02C
	mov r0, r7
	ldreq r3, _02033F00 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_02033D70:
	add r6, r6, #0x3e
_02033D74:
	ldr r1, [r8, #0x10]
	ldr r0, _02033F04 ; =0x00020008
	tst r1, r0
	beq _02033E40
	tst r4, #0x40000
	beq _02033DA4
	ldr r3, _02033F08 ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033DE0
_02033DA4:
	tst r1, #0x20000000
	bne _02033DE0
	tst r1, #8
	bne _02033DCC
	tst r1, #0x20000
	beq _02033DE0
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	beq _02033DE0
_02033DCC:
	ldr r3, _02033F0C ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033DE0:
	tst r4, #0x80000
	beq _02033E00
	ldr r3, _02033F10 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033E40
_02033E00:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02033E40
	tst r0, #8
	bne _02033E2C
	tst r0, #0x20000
	beq _02033E40
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	beq _02033E40
_02033E2C:
	ldr r3, _02033F14 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033E40:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02033E7C
	tst r4, #0x20000
	ldrne r3, _02033F18 ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _02033F1C ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033E7C:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02033ECC
	tst r0, #0x18000000
	beq _02033EB0
	tst r4, #0x10000
	ldrne r3, _02033F20 ; =_0209B06C
	mov r0, r7
	ldreq r3, _02033F24 ; =_0209B074
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033ECC
_02033EB0:
	tst r4, #0x10000
	ldrne r3, _02033F28 ; =_0209B07C
	mov r0, r7
	ldreq r3, _02033F2C ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02033ECC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02033ED4: .word _0209AFDC
_02033ED8: .word _0209AFE4
_02033EDC: .word _0209AFEC
_02033EE0: .word _0209AFF4
_02033EE4: .word _0209AFFC
_02033EE8: .word _0209B004
_02033EEC: .word _0209B00C
_02033EF0: .word _0209B014
_02033EF4: .word _0209B01C
_02033EF8: .word _0209B024
_02033EFC: .word _0209B02C
_02033F00: .word _0209B034
_02033F04: .word 0x00020008
_02033F08: .word _0209B03C
_02033F0C: .word _0209B044
_02033F10: .word _0209B04C
_02033F14: .word _0209B054
_02033F18: .word _0209B05C
_02033F1C: .word _0209B064
_02033F20: .word _0209B06C
_02033F24: .word _0209B074
_02033F28: .word _0209B07C
_02033F2C: .word _0209B084
	arm_func_end sub_02033BC0

	arm_func_start sub_02033F30
sub_02033F30: ; 0x02033F30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	mov r6, r2
	tst r0, #0x1000
	mov r4, #0
	beq _0203433C
	ldrh r0, [r6]
	tst r0, #2
	beq _0203433C
	ldmib r8, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [r8, #4]
	add r5, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033FC8
	mov r0, #0x12
	str r5, [sp, #8]
	bl sub_02026594
	add r0, r5, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r7]
_02033FC8:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _0203401C
	add r1, r5, #0x12
	mov r0, #0x13
	str r1, [sp, #8]
	bl sub_02026594
	add r1, r5, #0x12
	add r0, r1, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r7]
_0203401C:
	ldr r0, [r8, #0x10]
	add r5, r5, #0x26
	tst r0, #0x8000
	beq _0203418C
	tst r0, #0x20000
	bne _0203418C
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _02034188
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02034098
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034098
	mov r0, r8
	bl sub_020332F0
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r7]
_02034098:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020340F0
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020340F0
	mov r0, r8
	bl sub_020332CC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r7]
_020340F0:
	add ip, r5, #0x1f
	add r3, r5, #0x2a
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0203413C
	mov r0, r8
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r7]
_0203413C:
	add ip, r5, #0x2d
	add r3, r5, #0x38
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02034188
	mov r0, r8
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r7]
_02034188:
	add r5, r5, #0x3e
_0203418C:
	ldr r1, [r8, #0x10]
	ands r0, r1, #8
	beq _020342AC
	cmp r0, #0
	bne _020341B8
	tst r1, #0x20000
	beq _020342AC
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _020342AC
_020341B8:
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02034230
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034230
	ldr r0, [r7]
	orr r0, r0, #0x40000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _02034224
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x4000
	str r0, [r7]
	b _0203422C
_02034224:
	mov r1, #0
	bl sub_020333D8
_0203422C:
	mov r4, #1
_02034230:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000000
	bne _020342AC
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020342AC
	ldr r0, [r7]
	orr r0, r0, #0x80000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _020342A0
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x8000
	str r0, [r7]
	b _020342A8
_020342A0:
	mov r1, #0
	bl sub_020333D8
_020342A8:
	mov r4, #1
_020342AC:
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #0x10]
	add r5, r1, #4
	tst r0, #2
	beq _020342F8
	sub r5, r5, #0x12
	add r3, r5, #0xb
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r7]
_020342F8:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _0203433C
	sub ip, r5, #0x12
	sub r3, r5, #7
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #1
	orrne r0, r0, #0x10000
	strne r0, [r7]
_0203433C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02034354
	mov r0, r8
	bl sub_02032DE8
	mov r4, #1
_02034354:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02033F30

	arm_func_start sub_02034360
sub_02034360: ; 0x02034360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02034660
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _020343E0
	tst r4, #0x1000000
	ldrne r3, _02034668 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _0203466C ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
_020343E0:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02034408
	tst r4, #0x2000000
	ldrne r3, _02034670 ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02034674 ; =_0209AFF4
	add r2, r5, #3
	mov r1, #0x16
	bl DrawTextInWindow
_02034408:
	ldr r0, [r8, #0x10]
	add r6, r6, #0x26
	tst r0, #0x8000
	beq _02034510
	tst r0, #0x20000
	bne _02034510
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _0203450C
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020344A4
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _02034454
	tst r4, #0x400000
	beq _02034470
_02034454:
	tst r4, #0x400000
	ldrne r3, _02034678 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _0203467C ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034470:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _02034488
	tst r4, #0x800000
	beq _020344A4
_02034488:
	tst r4, #0x800000
	ldrne r3, _02034680 ; =_0209B00C
	mov r0, r7
	ldreq r3, _02034684 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020344A4:
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _020344BC
	tst r4, #0x100000
	beq _020344D8
_020344BC:
	tst r4, #0x100000
	ldrne r3, _02034688 ; =_0209B01C
	mov r0, r7
	ldreq r3, _0203468C ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_020344D8:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _020344F0
	tst r4, #0x200000
	beq _0203450C
_020344F0:
	tst r4, #0x200000
	ldrne r3, _02034690 ; =_0209B02C
	mov r0, r7
	ldreq r3, _02034694 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_0203450C:
	add r6, r6, #0x3e
_02034510:
	ldr r1, [r8, #0x10]
	ldr r0, _02034698 ; =0x00020008
	tst r1, r0
	beq _020345DC
	tst r4, #0x40000
	beq _02034540
	ldr r3, _0203469C ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _0203457C
_02034540:
	tst r1, #0x20000000
	bne _0203457C
	tst r1, #8
	bne _02034568
	tst r1, #0x20000
	beq _0203457C
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	beq _0203457C
_02034568:
	ldr r3, _020346A0 ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_0203457C:
	tst r4, #0x80000
	beq _0203459C
	ldr r3, _020346A4 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _020345DC
_0203459C:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _020345DC
	tst r0, #8
	bne _020345C8
	tst r0, #0x20000
	beq _020345DC
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	beq _020345DC
_020345C8:
	ldr r3, _020346A8 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020345DC:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02034618
	tst r4, #0x20000
	ldrne r3, _020346AC ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _020346B0 ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034618:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02034660
	tst r0, #0x18000000
	beq _02034644
	ldr r3, _020346B4 ; =_0209B074
	mov r0, r7
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02034660
_02034644:
	tst r4, #0x10000
	ldrne r3, _020346B8 ; =_0209B07C
	mov r0, r7
	ldreq r3, _020346BC ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02034660:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02034668: .word _0209AFDC
_0203466C: .word _0209AFE4
_02034670: .word _0209AFEC
_02034674: .word _0209AFF4
_02034678: .word _0209AFFC
_0203467C: .word _0209B004
_02034680: .word _0209B00C
_02034684: .word _0209B014
_02034688: .word _0209B01C
_0203468C: .word _0209B024
_02034690: .word _0209B02C
_02034694: .word _0209B034
_02034698: .word 0x00020008
_0203469C: .word _0209B03C
_020346A0: .word _0209B044
_020346A4: .word _0209B04C
_020346A8: .word _0209B054
_020346AC: .word _0209B05C
_020346B0: .word _0209B064
_020346B4: .word _0209B074
_020346B8: .word _0209B07C
_020346BC: .word _0209B084
	arm_func_end sub_02034360

	arm_func_start sub_020346C0
sub_020346C0: ; 0x020346C0
	stmdb sp!, {r4, lr}
	mov r0, #0xdc
	mov r1, #1
	bl MemAlloc
	mov r4, r0
	ldr ip, _02034708 ; =_020AFDB8
	ldr r0, _0203470C ; =_0209B08C
	str r4, [ip]
	add lr, r4, #0xc4
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r1, #0
	str r1, [r4, #0xd4]
	ldr r0, [ip]
	strb r1, [r0, #0xd8]
	bl sub_02034710
	bl sub_020469BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034708: .word _020AFDB8
_0203470C: .word _0209B08C
	arm_func_end sub_020346C0

	arm_func_start sub_02034710
sub_02034710: ; 0x02034710
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r1, _02034798 ; =_020AFDB8
	ldr r0, _0203479C ; =_0209B08C
	ldr r1, [r1]
	add r4, r1, #0xc4
	mov r1, r4
	bl sub_020347A0
	cmp r0, #0
	bne _0203473C
	bl sub_020347F0
_0203473C:
	ldr r0, _0203479C ; =_0209B08C
	add r7, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr ip, _02034798 ; =_020AFDB8
	ldmia r7, {r0, r1, r2, r3}
	ldr r5, [ip]
	mov r6, #0
	stmia r5, {r0, r1, r2, r3}
	strb r6, [r5, #0x10]
	ldr r5, [ip]
	ldmia r7, {r0, r1, r2, r3}
	add lr, r5, #0x14
	stmia lr, {r0, r1, r2, r3}
	str r6, [r5, #0x24]
	ldr r0, [ip]
	strb r6, [r0, #0xc0]
	ldmia r7, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	str r6, [r0, #0xd4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02034798: .word _020AFDB8
_0203479C: .word _0209B08C
	arm_func_end sub_02034710

	arm_func_start sub_020347A0
sub_020347A0: ; 0x020347A0
	cmp r0, #0
	ldreq r0, _020347EC ; =_0209B08C
	cmp r1, #0
	ldreq r1, _020347EC ; =_0209B08C
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r2, [r0, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020347EC: .word _0209B08C
	arm_func_end sub_020347A0

	arm_func_start sub_020347F0
sub_020347F0: ; 0x020347F0
	stmdb sp!, {r4, lr}
	ldr r0, _0203483C ; =_020AFDB8
	ldr r4, [r0]
	ldr r0, [r4, #0xcc]
	cmp r0, #0
	beq _0203480C
	blx r0
_0203480C:
	ldr r0, _0203483C ; =_020AFDB8
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc4]
	bl UnloadOverlay
	ldr r0, _0203483C ; =_020AFDB8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203483C: .word _020AFDB8
	arm_func_end sub_020347F0

	arm_func_start sub_02034840
sub_02034840: ; 0x02034840
	stmdb sp!, {r4, lr}
	ldr r1, _020348DC ; =_020AFDB8
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02034894
	cmp r4, #0
	beq _0203487C
	add r1, r2, #0x14
	bl sub_020347A0
	cmp r0, #0
	beq _02034894
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203487C:
	ldr r0, _020348E0 ; =_0209B08C
	add r1, r2, #0x14
	bl sub_020347A0
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02034894:
	cmp r4, #0
	beq _020348B4
	ldr r1, _020348DC ; =_020AFDB8
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0xc4
	bl sub_020347A0
	ldmia sp!, {r4, pc}
_020348B4:
	ldr r1, _020348DC ; =_020AFDB8
	ldr r0, _020348E0 ; =_0209B08C
	ldr r1, [r1]
	add r1, r1, #0x14
	bl sub_020347A0
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_020348DC: .word _020AFDB8
_020348E0: .word _0209B08C
	arm_func_end sub_02034840
