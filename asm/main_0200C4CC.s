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

; https://decomp.me/scratch/28S9i
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
	bl AllocateTemp1024ByteBufferFromPool
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
	ldr r1, _0200CAB4 ; =BAG_ITEMS
	ldr r0, _0200CAB8 ; =BAG_ITEMS_PTR_MIRROR
	str r1, [r0]
	bl LoadItemPspi2n
	bl SetActiveInventoryToMain
	bl sub_0200FD38
	bl sub_02010590
	bl sub_02011AB8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200CAB4: .word BAG_ITEMS
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
