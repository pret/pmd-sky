	.include "asm/macros.inc"
	.include "overlay_29_02346834.inc"

	.text

	arm_func_start GenerateMoneyQuantity
GenerateMoneyQuantity: ; 0x02346834
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x64
	mov r4, r1
	bl DungeonRandInt
	mov r3, #0
	ldr r2, _02346884 ; =MONEY_QUANTITY_TABLE
	b _02346870
_02346854:
	ldr r1, [r2, r0, lsl #2]
	cmp r1, r4
	strleh r0, [r5, #2]
	ldmleia sp!, {r3, r4, r5, pc}
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r3, r3, #1
_02346870:
	cmp r3, #0xc8
	blt _02346854
	mov r0, #1
	strh r0, [r5, #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02346884: .word MONEY_QUANTITY_TABLE
	arm_func_end GenerateMoneyQuantity

	arm_func_start ov29_02346888
ov29_02346888: ; 0x02346888
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _023468F8 ; =DUNGEON_PTR
	mov r0, #7
	ldr r1, [r1]
	ldrb r4, [r1, #0xc]
	bl IsCurrentMissionType
	ldr r1, _023468F8 ; =DUNGEON_PTR
	mov r0, #0
	ldr r2, [r1]
	strb r0, [r2, #0xc]
	ldr r1, [r1]
	ldrb r1, [r1, #0xc]
	cmp r1, #1
	cmpeq r4, #0
	bne _023468F0
#ifdef JAPAN
	ldr r1, _02347CAC ; =0x0000091F
	mov r2, r0
	mov r3, r0
#else
	mov r2, r0
	mov r3, r0
	mov r1, #0xbe0
#endif
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _023468F0
	mov r0, #2
	mov r1, #1
	bl ov29_022E09E8
_023468F0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_023468F8: .word DUNGEON_PTR
#ifdef JAPAN
_02347CAC: .word 0x0000091F
#endif
	arm_func_end ov29_02346888

	arm_func_start ov29_023468FC
ov29_023468FC: ; 0x023468FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldrsh r0, [r4, #4]
	bl GetItemCategoryVeneer
	cmp r0, #5
	bne _023469D4
	ldrsh r0, [r4, #4]
	bl GetItemMoveId16
	mov r8, r0
	ldrsh r0, [r4, #4]
	bl IsHM
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r7, #0
	mov r6, r7
	mov r5, r7
	mov fp, r7
	ldr r4, _023469DC ; =DUNGEON_PTR
	b _023469C4
_0234694C:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sl, [r0, #0xa84]
#else
	ldr sl, [r0, #0xb28]
#endif
	mov r0, sl
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _023469C0
	ldr r1, [sl, #0xb4]
	mov r0, r8
	ldrsh r1, [r1, #2]
	bl sub_02053D1C
	mov sb, r0
	mov r0, sl
	bl ov29_023009A0
	cmp r0, #0
	movne sb, r6
	mov r0, sl
	mov r1, r8
	bl ov29_022FBA54
	cmp r0, #0
	movne sb, r5
	mov r0, sl
	bl ov29_022FBA70
	cmp r0, #0
	movne sb, fp
	cmp sb, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023469C0:
	add r7, r7, #1
_023469C4:
	cmp r7, #4
	blt _0234694C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023469D4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023469DC: .word DUNGEON_PTR
	arm_func_end ov29_023468FC

	arm_func_start ov29_023469E0
ov29_023469E0: ; 0x023469E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	ldr r5, _02346A60 ; =BAG_ITEMS_PTR_MIRROR
	mov sl, r0
	mov r6, r8
	mov r7, #1
	mov fp, r8
	mov r4, #6
_02346A00:
	mul r1, r8, r4
	ldr r0, [r5]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sb, r2, r1
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02346A48
	ldrb r0, [sb]
	tst r0, sl
	beq _02346A48
	ldrb r0, [sb, #1]
	mov r1, fp
	bl ClearItem
	mov r0, sb
	bl ItemZInit
_02346A48:
	add r8, r8, #1
	cmp r8, #0x32
	blt _02346A00
	bl RemoveEmptyItemsInBag
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346A60: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_023469E0

	arm_func_start ov29_02346A64
ov29_02346A64: ; 0x02346A64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	ldr r5, _02346BD0 ; =DUNGEON_PTR
	mov r7, #0x55
	mov r6, r4
_02346A78:
	ldr r0, [r5]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa84]
#else
	ldr r8, [r0, #0xb28]
#endif
	mov r0, r8
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _02346AC4
	ldr sb, [r8, #0xb4]
	add r0, sb, #0x62
	bl IsLosableItem
	cmp r0, #0
	beq _02346AC4
	mov r1, r7
	mov r2, r6
	add r0, sb, #0x62
	ldrb r8, [sb, #0x63]
	bl InitStandardItem
	strb r8, [sb, #0x63]
_02346AC4:
	add r4, r4, #1
	cmp r4, #4
	blt _02346A78
	mov sb, #0
	mov r7, #1
	mov r6, sb
	mov r4, sb
	mov r5, r7
	mov fp, #0x55
_02346AE8:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov r8, r0
	ldrb r0, [r8]
	tst r0, #1
	movne r1, r7
	moveq r1, r6
	tst r1, #0xff
	beq _02346B5C
	tst r0, #2
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02346B5C
	ldrsh r0, [r8, #8]
	bl IsMonsterIdInNormalRange
	cmp r0, #0
	beq _02346B5C
	add r0, r8, #0x3e
	bl IsLosableItem
	cmp r0, #0
	beq _02346B5C
	mov r1, fp
	mov r2, #0
	add r0, r8, #0x3e
	ldrb sl, [r8, #0x3f]
	bl InitStandardItem
	strb sl, [r8, #0x3f]
_02346B5C:
	add sb, sb, #1
	cmp sb, #4
	blt _02346AE8
	mov r4, #0
	ldr r6, _02346BD4 ; =BAG_ITEMS_PTR_MIRROR
	mov r8, #0x55
	mov r7, r4
	mov r5, #6
_02346B7C:
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	mla sb, r4, r5, r0
	mov r0, sb
	bl IsLosableItem
	cmp r0, #0
	beq _02346BB8
	mov r0, sb
	mov r1, r8
	mov r2, r7
	ldrb sl, [sb, #1]
	bl InitStandardItem
	mov r0, sb
	bl SetItemAcquired
	strb sl, [sb, #1]
_02346BB8:
	add r4, r4, #1
	cmp r4, #0x32
	blt _02346B7C
	bl RemoveEmptyItemsInBag
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346BD0: .word DUNGEON_PTR
_02346BD4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_02346A64

	arm_func_start CheckTeamItemsFlags
CheckTeamItemsFlags: ; 0x02346BD8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02346CB4 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, #0
	mov r5, r0
	ldr r8, [r1]
	mov r2, r7
	mov r3, #1
	mov r0, #6
	b _02346C30
_02346BFC:
	mul r4, r7, r0
	ldr r6, [r8, #0x384]
	ldrb r1, [r6, r4]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _02346C2C
	ldrb r1, [r6, r4]
	tst r1, r5
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02346C2C:
	add r7, r7, #1
_02346C30:
	cmp r7, #0x32
	blt _02346BFC
	bl RemoveEmptyItemsInBag
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	mov r4, #0
	mov r7, r4
	mov r8, #1
	ldr r6, _02346CB8 ; =DUNGEON_PTR
	b _02346CA4
_02346C54:
	ldr r0, [r6]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa84]
#else
	ldr sb, [r0, #0xb28]
#endif
	mov r0, sb
	bl EntityIsValid__02345698
	cmp r0, #0
	beq _02346CA0
	ldr r1, [sb, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _02346CA0
	ldrb r0, [r1, #0x62]
	tst r0, r5
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02346CA0:
	add r4, r4, #1
_02346CA4:
	cmp r4, #4
	blt _02346C54
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02346CB4: .word BAG_ITEMS_PTR_MIRROR
_02346CB8: .word DUNGEON_PTR
	arm_func_end CheckTeamItemsFlags

	arm_func_start ov29_02346CBC
ov29_02346CBC: ; 0x02346CBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov r8, #1
	ldr r5, _02346DA0 ; =BAG_ITEMS_PTR_MIRROR
	mov r7, sb
	mov fp, sb
	mov r6, r8
	mov r4, #6
_02346CDC:
	mul r1, sb, r4
	ldr r0, [r5]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	add sl, r2, r1
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _02346D8C
	ldrb r0, [sl]
	bic r0, r0, #8
	strb r0, [sl]
	ldrsh r0, [sl, #4]
	cmp r0, #0xb7
	bne _02346D78
	mov r0, sl
	bl sub_0200D8AC
	bl AddMoneyCarried
	ldrb r0, [sl, #1]
	cmp r0, #0
	beq _02346D70
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	ldrb r1, [r0, #0x3e]
	tst r1, #1
	movne r1, r6
	moveq r1, fp
	tst r1, #0xff
	beq _02346D70
	ldrsh r1, [r0, #0x42]
	cmp r1, #0xb7
	bne _02346D70
	add r0, r0, #0x3e
	bl ItemZInit
_02346D70:
	mov r0, sl
	bl ItemZInit
_02346D78:
	ldrb r0, [sl]
	tst r0, #2
	beq _02346D8C
	mov r0, sl
	bl ItemZInit
_02346D8C:
	add sb, sb, #1
	cmp sb, #0x32
	blt _02346CDC
	bl RemoveEmptyItemsInBag
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02346DA0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_02346CBC

	arm_func_start ov29_02346DA4
ov29_02346DA4: ; 0x02346DA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl ov29_02346CBC
	bl RemoveEmptyItemsInBag
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	mov r8, #0
	mov r7, #1
	mov r6, r8
	mov r4, r8
	mov r5, r7
_02346DC8:
	mov r0, r8
	bl GetActiveTeamMember
	mov sb, r0
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _02346E30
	ldrb r0, [sb, #0x3e]
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02346E30
	ldrb r0, [sb, #0x3e]
	bic r0, r0, #8
	strb r0, [sb, #0x3e]
	ldrsh r0, [sb, #0x42]
	cmp r0, #0xb7
	bne _02346E30
	add r0, sb, #0x3e
	bl sub_0200D8AC
	bl AddMoneyCarried
	add r0, sb, #0x3e
	bl ItemZInit
_02346E30:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02346DC8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_02346DA4

	arm_func_start ov29_02346E48
ov29_02346E48: ; 0x02346E48
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	bl IsMarowakTrainingMaze
	cmp r0, #0
	beq _02348210
#endif
	bl ov29_02346CBC
_02348210:
	bl sub_02057CE8
	bl CleanStickyItemsInBag
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02346E48

	arm_func_start ov29_02346E5C
ov29_02346E5C: ; 0x02346E5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	ldr r1, _02346EB8 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, r5
	mov ip, #1
	mov r0, #6
_02346E74:
	mul lr, r5, r0
	ldr r2, [r1]
	ldr r4, [r2, #0x384]
	ldrb r2, [r4, lr]
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _02346EA8
	ldrb r2, [r4, lr]
	tst r2, #4
	bicne r2, r2, #4
	strneb r2, [r4, lr]
_02346EA8:
	add r5, r5, #1
	cmp r5, #0x32
	blt _02346E74
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02346EB8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_02346E5C

	arm_func_start ov29_02346EBC
ov29_02346EBC: ; 0x02346EBC
	ldrb r1, [r0, #6]
	cmp r1, #0
	bne _02346F04
	ldr r1, _02346F0C ; =DUNGEON_PTR
#ifdef JAPAN
	mov ip, #0
#else
	mov r3, #0
#endif
	ldr r1, [r1]
	add r1, r1, #0x3f4
	add r2, r1, #0x400
#ifdef JAPAN
	mov r1, #0x23c
	b _023482BC
_02346EE0:
	mla r3, ip, r1, r2
	cmp r3, r0
	ldreq r0, _02346F10 ; =ov29_023531C8
	ldreqb r0, [r0, ip]
	bxeq lr
	add ip, ip, #1
_023482BC:
	cmp ip, #4
#else
	b _02346EFC
_02346EE0:
	add r1, r3, r3, lsl #3
	add r1, r2, r1, lsl #6
	cmp r1, r0
	ldreq r0, _02346F10 ; =ov29_023531C8
	ldreqb r0, [r0, r3]
	bxeq lr
	add r3, r3, #1
_02346EFC:
	cmp r3, #4
#endif
	blt _02346EE0
_02346F04:
	mov r0, #0
	bx lr
	.align 2, 0
_02346F0C: .word DUNGEON_PTR
_02346F10: .word ov29_023531C8
	arm_func_end ov29_02346EBC

	arm_func_start AddHeldItemToBag
AddHeldItemToBag: ; 0x02346F14
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl GetCurrentBagCapacity
	ldr r1, _02346FB4 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r6, [r1]
	mov r2, lr
	mov r3, #1
	mov r1, #6
	b _02346FA4
_02346F3C:
	mul r4, lr, r1
	ldr ip, [r6, #0x384]
	ldrb ip, [ip, r4]
	tst ip, #1
	movne ip, r3
	moveq ip, r2
	tst ip, #0xff
	bne _02346FA0
	mov r0, r5
	bl ov29_02346EBC
	strb r0, [r5, #0x63]
	ldr r0, _02346FB4 ; =BAG_ITEMS_PTR_MIRROR
	ldrh r1, [r5, #0x62]
	ldr r2, [r0]
	add r0, r5, #0x62
	ldr r2, [r2, #0x384]
	strh r1, [r2, r4]
	ldrh r1, [r5, #0x64]
	add r2, r2, r4
	strh r1, [r2, #2]
	ldrh r1, [r5, #0x66]
	strh r1, [r2, #4]
	bl SetItemAcquired
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_02346FA0:
	add lr, lr, #1
_02346FA4:
	cmp lr, r0
	blt _02346F3C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02346FB4: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end AddHeldItemToBag

	arm_func_start ov29_02346FB8
ov29_02346FB8: ; 0x02346FB8
	ldr r1, _02346FFC ; =DUNGEON_PTR
#ifdef JAPAN
	mov ip, #0
#else
	mov r3, #0
#endif
	ldr r1, [r1]
	add r1, r1, #0x56
	add r2, r1, #0x800
#ifdef JAPAN
	mov r1, #0x23c
	b _023483A4
_02348394:
	mla r3, ip, r1, r2
	cmp r3, r0
	beq _023483AC
	add ip, ip, #1
_023483A4:
	cmp ip, #4
	blt _02348394
_023483AC:
	cmp ip, #4
	mvneq r0, #0
	movne r0, ip
#else
	b _02346FE4
_02346FD0:
	add r1, r3, r3, lsl #3
	add r1, r2, r1, lsl #6
	cmp r1, r0
	beq _02346FEC
	add r3, r3, #1
_02346FE4:
	cmp r3, #4
	blt _02346FD0
_02346FEC:
	cmp r3, #4
	mvneq r0, #0
	movne r0, r3
#endif
	bx lr
	.align 2, 0
_02346FFC: .word DUNGEON_PTR
	arm_func_end ov29_02346FB8

	arm_func_start ov29_02347000
ov29_02347000: ; 0x02347000
	ldr r1, _0234702C ; =ov10_022C4CD8
	b _02347018
_02347008:
	cmp r0, r2
	moveq r0, #1
	bxeq lr
	add r1, r1, #2
_02347018:
	ldrsh r2, [r1]
	cmp r2, #0
	bne _02347008
	mov r0, #0
	bx lr
	.align 2, 0
_0234702C: .word ov10_022C4CD8
	arm_func_end ov29_02347000

	arm_func_start RemoveEmptyItemsInBagWrapper
RemoveEmptyItemsInBagWrapper: ; 0x02347030
	stmdb sp!, {r3, lr}
	bl RemoveEmptyItemsInBag
#ifdef EUROPE
	mov r0, #0
#endif
	bl ov29_022FB920
	ldmia sp!, {r3, pc}
	arm_func_end RemoveEmptyItemsInBagWrapper

	arm_func_start ov29_02347040
ov29_02347040: ; 0x02347040
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, #0
	ldr r5, _023470F8 ; =DUNGEON_PTR
	ldr r6, _023470FC ; =BAG_ITEMS_PTR_MIRROR
	mov fp, r8
	mov r7, #1
	mov r4, #6
_0234705C:
	mul sl, r8, r4
	ldr r0, [r6]
	ldr r1, [r0, #0x384]
	ldrb r0, [r1, sl]
	add r1, r1, sl
	tst r0, #1
	movne r0, r7
	moveq r0, fp
	tst r0, #0xff
	ldrneb r1, [r1, #1]
	cmpne r1, #0
	beq _023470E8
	ldr r0, [r5]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa80]
#else
	ldr sb, [r0, #0xb24]
#endif
	mov r0, sb
	bl EntityIsValid__02345698
	cmp r0, #0
	bne _023470C0
	ldr r0, [r6]
	ldr r0, [r0, #0x384]
	add r0, r0, sl
	bl sub_0200D894
	b _023470E8
_023470C0:
	ldr r1, [r6]
	ldr r0, [sb, #0xb4]
	ldr r2, [r1, #0x384]
	ldrh r1, [r2, sl]
	add r2, r2, sl
	strh r1, [r0, #0x62]
	ldrh r1, [r2, #2]
	strh r1, [r0, #0x64]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0x66]
_023470E8:
	add r8, r8, #1
	cmp r8, #0x32
	blt _0234705C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023470F8: .word DUNGEON_PTR
_023470FC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end ov29_02347040

	arm_func_start ov29_02347100
ov29_02347100: ; 0x02347100
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetLeader
	mov r4, r0
	bl ov29_022EBB8C
	mov r1, r0
	mov r0, r4
	mov r2, #0xa
	bl GetItemToUseByIndex
	mov r4, r0
	bl ov29_022EBB98
	cmp r0, #0x90
	bhs _0234717C
	mov r0, r4
	bl GetItemAction
	cmp r0, #0
	beq _0234717C
	ldrb r0, [r4]
	tst r0, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_023468FC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_0234717C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02347100

	arm_func_start ov29_02347184
ov29_02347184: ; 0x02347184
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	mov sb, #0
	mov r7, #1
	mov sl, r0
	mov r8, sb
	mov r6, sb
	mov fp, sb
	mov r5, r7
	add r4, sp, #0
_023471AC:
	mov r0, r8
	bl GetItemAtIdx
	cmp sl, #0
	beq _023471F4
	mov r2, sl
	b _023471E0
_023471C4:
	ldrsh r1, [r0, #4]
	cmp r3, r1
	bne _023471DC
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _023471EC
_023471DC:
	add r2, r2, #2
_023471E0:
	ldrsh r3, [r2]
	cmp r3, #0
	bne _023471C4
_023471EC:
	cmp r3, #0
	bne _02347224
_023471F4:
	ldrb r1, [r0]
	tst r1, #1
	movne r2, r7
	moveq r2, r6
	tst r2, #0xff
	beq _02347224
	tst r1, #8
	movne r1, r5
	moveq r1, fp
	tst r1, #0xff
	streq r0, [r4, sb, lsl #2]
	addeq sb, sb, #1
_02347224:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x32
	blt _023471AC
	cmp sb, #0
	moveq r0, #0
	beq _023472B8
	bl DungeonRand16Bit
	mov r1, sb
	bl _s32_div_f
	mov r0, r1, lsl #0x10
	add r1, sp, #0
	mov r0, r0, asr #0x10
#ifdef JAPAN
	ldr r4, [r1, r0, lsl #2]
	ldrb r0, [r4]
	orr r0, r0, #8
	strb r0, [r4]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _023472B4
	sub r2, r0, #1
	mov r0, #0x23c
	ldr r1, _023472C0 ; =DUNGEON_PTR
	mul r3, r2, r0
	ldr r0, [r1]
	add r0, r0, #0x56
	add r1, r0, #0x800
	ldrb r0, [r1, r3]
#else
	ldr r3, [r1, r0, lsl #2]
	ldrb r0, [r3]
	orr r0, r0, #8
	strb r0, [r3]
	ldrb r1, [r3, #1]
	cmp r1, #0
	beq _023472B4
	ldr r0, _023472C0 ; =DUNGEON_PTR
	sub r1, r1, #1
	ldr r0, [r0]
	add r1, r1, r1, lsl #3
	add r0, r0, #0x56
	add r2, r0, #0x800
	ldrb r0, [r2, r1, lsl #6]
	mov r1, r1, lsl #6
#endif
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
#ifdef JAPAN
	ldrneb r0, [r1, r3]
	orrne r0, r0, #8
	strneb r0, [r1, r3]
_023472B4:
	ldrsh r0, [r4, #4]
#else
	ldrneb r0, [r2, r1]
	orrne r0, r0, #8
	strneb r0, [r2, r1]
_023472B4:
	ldrsh r0, [r3, #4]
#endif
_023472B8:
	add sp, sp, #0xc8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023472C0: .word DUNGEON_PTR
	arm_func_end ov29_02347184

	arm_func_start GenerateItem
GenerateItem: ; 0x023472C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r3
	mov r4, r1
	mov r3, #0
	mov r5, r0
	bl sub_0200CF6C
	mov r0, r4
	mov r6, #0
	bl IsNotMoney
	cmp r0, #0
	beq _02347324
	cmp r7, #0
	bne _0234731C
	mov r0, #0x64
	bl DungeonRandInt
	ldr r1, _02347374 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x28000
#ifdef JAPAN
	ldrb r1, [r1, #0x618]
#else
	ldrb r1, [r1, #0x6bc]
#endif
	cmp r0, r1
	movlt r6, #1
	b _02347324
_0234731C:
	cmp r7, #1
	moveq r6, #1
_02347324:
	cmp r6, #0
	ldrneb r0, [r5]
	orrne r0, r0, #8
	strneb r0, [r5]
	mov r0, r4
	bl GetItemCategoryVeneer
	cmp r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02347374 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x7cc]
	cmp r0, #0
	add r0, r1, #0x28000
#ifdef JAPAN
	ldrb r2, [r0, #0x625]
#else
	ldrb r2, [r0, #0x6c9]
#endif
	moveq r3, #5
	movne r3, #0x28
	mul r1, r2, r3
	mov r0, r5
	bl GenerateMoneyQuantity
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02347374: .word DUNGEON_PTR
	arm_func_end GenerateItem

	arm_func_start ov29_02347378
ov29_02347378: ; 0x02347378
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r3, _02347514 ; =DUNGEON_PTR
	mov sl, r0
	ldr r0, [r3]
	cmp r2, #0
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb fp, [r0, #0x1a1]
#else
	ldrb fp, [r0, #0x245]
#endif
	beq _023473B0
	cmp r2, #0
	beq _023473B8
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	bne _023473B8
_023473B0:
	mov r3, #1
	b _023473BC
_023473B8:
	mov r3, #0
_023473BC:
	ldrsh r2, [r1]
	ldrsh r1, [r1, #2]
	mov r0, #0x18
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #4
	add r0, r0, #4
	ands r4, r3, #0xff
	mov r8, r1, lsl #8
	mov sb, r0, lsl #8
	beq _023474CC
	ldr r5, [sl, #0xc]
	sub r0, r5, r8
	bl abs
	cmp r0, #0xc
	bge _02347410
	ldr r0, [sl, #0x10]
	sub r0, r0, sb
	bl abs
	cmp r0, #0xc
	blt _023474CC
_02347410:
	str r5, [sp, #0xc]
	ldr r0, [sl, #0x10]
	mov r6, #0
	str r0, [sp, #0x10]
	sub r0, r8, r5
	mov r1, #0x18
	mov r7, r6
	bl _s32_div_f
	ldr r1, [sp, #0x10]
	str r0, [sp, #8]
	sub r0, sb, r1
	mov r1, #0x18
	bl _s32_div_f
	str r0, [sp, #4]
	mov r5, r6
_0234744C:
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	add r0, r2, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #0x10]
	mov r0, r7
	bl sub_020018D0
	mov r1, #0xc
	mul r1, r0, r1
	str r1, [sl, #0x1c]
	mov r0, sl
	add r1, sp, #0xc
	bl UpdateEntityPixelPos
	mov r0, #0
	str r0, [sp]
	mov r0, sl
	mov r1, fp
	mov r2, #0
	and r3, r6, #0xff
	bl ov29_023457C8
	mov r0, #0x13
	bl AdvanceFrame
	tst r5, #3
	addeq r6, r6, #1
	add r5, r5, #1
	add r7, r7, #0x55
	and r6, r6, #7
	cmp r5, #0x18
	blt _0234744C
_023474CC:
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl SetEntityPixelPosXY
	mov r5, #0
	str r5, [sl, #0x1c]
	cmp r4, #0
	beq _02347504
	mov r0, sl
	mov r1, fp
	mov r2, #1
	mov r3, #0xff
	str r5, [sp]
	bl ov29_023457C8
_02347504:
	mov r0, #0x13
	bl AdvanceFrame
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02347514: .word DUNGEON_PTR
	arm_func_end ov29_02347378

	arm_func_start ov29_02347518
ov29_02347518: ; 0x02347518
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x248
	ldr r4, _02347B3C ; =DUNGEON_PTR
	mov sl, r0
	ldr r4, [r4]
	mov r6, #3
	add r0, r4, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a1]
#else
	ldrb r0, [r0, #0x245]
#endif
	mov r5, #0
	mov sb, r3
	str r0, [sp, #0x20]
	str r6, [r4, #0xcc]
	mov r0, #1
	strb r5, [r4, #0xf0]
	strb r0, [r4, #0xec]
	strb r5, [r4, #0xee]
	mov r0, r1
	str r0, [r4, #0x180]
	str r5, [r4, #0xe8]
#ifdef JAPAN
	ldrh r5, [r2]
	str r1, [sp, #8]
	mov r1, #0x18
	strh r5, [r4, #0xd0]
	ldrh r5, [r2, #2]
	add r0, r4, #0xcc
	ldr r8, [sp, #0x270]
	strh r5, [r4, #0xd2]
#else
	ldrh r6, [r2]
	str r1, [sp, #8]
	mov r1, #0x18
	strh r6, [r4, #0xd0]
	ldrh r6, [r2, #2]
	add r0, r4, #0xcc
	ldr r8, [sp, #0x270]
	strh r6, [r4, #0xd2]
#endif
	ldrsh r3, [r2]
	ldrsh r2, [r2, #2]
	smulbb r3, r3, r1
	smulbb r2, r2, r1
	add r1, r3, #4
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
#ifdef JAPAN
	mov r0, #0
#else
	mov r0, r5
#endif
	str r0, [sp, #0x1c]
	strh r0, [r4, #0xf2]
	ldr r0, [sl]
	cmp r0, #1
	bne _023475D4
	mov r0, sl
	mov r1, #0x31
	bl ItemIsActive__02347B50
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x1c]
_023475D4:
#ifdef JAPAN
	mov r0, #1
	ldrsh fp, [r8, #2]
	mov r5, #0
#else
	ldrsh r1, [r8, #2]
	mov r0, #1
	mov r6, #0
	str r1, [sp, #0x24]
#endif
	bl ov29_0234B4CC
_023475E8:
	ldrh r2, [r4, #0xd0]
	ldrh r1, [r4, #0xd2]
	ldrb r0, [r8, #1]
	strh r2, [sp, #0x44]
	strh r1, [sp, #0x46]
	cmp r0, #0
	beq _023476BC
	ldrb r0, [r8]
	cmp r0, #0
	bne _023476BC
	ldr r1, _02347B40 ; =DIRECTIONS_XY
	mov r2, sb, lsl #2
	add r0, r1, sb, lsl #2
#ifdef JAPAN
	ldrsh r6, [r4, #0xd0]
#else
	ldrsh r7, [r4, #0xd0]
#endif
	ldrsh r3, [r1, r2]
	ldrsh r2, [r4, #0xd2]
	ldrsh r1, [r0, #2]
#ifdef JAPAN
	add r0, r6, r3
#else
	add r0, r7, r3
#endif
	add r1, r2, r1
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
	bne _023476BC
	ldrsh r0, [sp, #0x46]
#ifdef JAPAN
	mov r6, #0
#else
	mov r7, #0
#endif
	str r0, [sp, #0x10]
	ldrsh r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldr r0, _02347B44 ; =ov29_023516FC
	add r0, r0, sb, lsl #2
#ifdef JAPAN
	str r0, [sp, #0x24]
	b _023476B4
_02347668:
	ldr r0, [sp, #0x24]
	ldrb r7, [r6, r0]
	cmp r7, #8
	bge _023476B0
	ldr r0, _02347B40 ; =DIRECTIONS_XY
	mov r1, r7, lsl #2
	ldrsh r1, [r0, r1]
	add r0, r0, r7, lsl #2
#else
	str r0, [sp, #0x28]
	b _023476B4
_02347668:
	ldr r0, [sp, #0x28]
	ldrb fp, [r7, r0]
	cmp fp, #8
	bge _023476B0
	ldr r0, _02347B40 ; =DIRECTIONS_XY
	mov r1, fp, lsl #2
	ldrsh r1, [r0, r1]
	add r0, r0, fp, lsl #2
#endif
	ldrsh r2, [r0, #2]
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	ldr r1, [sp, #0x10]
	add r1, r1, r2
	bl GetTile
	ldrh r0, [r0]
	tst r0, #3
#ifdef JAPAN
	movne sb, r7
	bne _023476BC
_023476B0:
	add r6, r6, #1
_023476B4:
	cmp r6, #4
#else
	movne sb, fp
	bne _023476BC
_023476B0:
	add r7, r7, #1
_023476B4:
	cmp r7, #4
#endif
	blt _02347668
_023476BC:
	mov r0, sb, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, _02347B40 ; =DIRECTIONS_XY
	mov r2, r1, lsl #2
	ldrh r2, [r0, r2]
	add r1, r0, r1, lsl #2
	ldrsh r3, [r4, #0xd0]
	strh r2, [sp, #0x3c]
	ldrsh r2, [sp, #0x3c]
	ldrh r1, [r1, #2]
	add r2, r3, r2
	strh r1, [sp, #0x3e]
	strh r2, [r4, #0xd0]
	ldrsh r1, [sp, #0x3e]
	ldrsh r2, [r4, #0xd2]
	add r1, r2, r1
	strh r1, [r4, #0xd2]
	ldrsh r2, [r4, #0xd0]
	cmp r2, #0
	ldrgesh r1, [r4, #0xd2]
	cmpge r1, #0
	blt _02347720
	cmp r2, #0x38
	cmplt r1, #0x20
	blt _02347728
_02347720:
#ifdef JAPAN
	mov r6, #2
#else
	mov r7, #2
#endif
	b _02347978
_02347728:
	mov r2, sb, lsl #2
	add r1, r0, sb, lsl #2
	ldrsh r0, [r0, r2]
	ldrsh r1, [r1, #2]
#ifdef JAPAN
	mov r6, #0
#else
	mov r7, #0
#endif
	mov r0, r0, lsl #0xa
	str r0, [sp, #0x14]
	and r0, sb, #0xff
#ifdef JAPAN
	mov r7, r1, lsl #0xa
	str r0, [sp, #0x28]
#else
	mov fp, r1, lsl #0xa
	str r0, [sp, #0x2c]
#endif
_02347750:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r0, r4, #0xcc
#ifdef JAPAN
	mov r2, r7
#else
	mov r2, fp
#endif
	bl IncrementEntityPixelPosXY
	bl IsWaterTileset
	cmp r0, #0
	ldr r0, [r4, #0xd8]
	ldr r1, [r4, #0xdc]
	movne r2, #3
	mov r0, r0, asr #8
	mov r1, r1, asr #8
	moveq r2, #0
	add r0, r0, #8
	add r1, r1, #0x10
	bl ov29_022E9488
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x20]
#ifdef JAPAN
	ldr r3, [sp, #0x28]
#else
	ldr r3, [sp, #0x2c]
#endif
	add r0, r4, #0xcc
	mov r2, #0
	bl ov29_023457C8
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x18]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _023477DC
	mov r0, #0x12
	bl AdvanceFrame
_023477DC:
#ifdef JAPAN
	add r6, r6, #1
	cmp r6, #6
#else
	add r7, r7, #1
	cmp r7, #6
#endif
	blt _02347750
	ldrsh r0, [r4, #0xd0]
	ldrsh r1, [r4, #0xd2]
	bl GetTile
#ifdef JAPAN
	mov r6, r0
	ldrh r0, [r6]
#else
	mov r7, r0
	ldrh r0, [r7]
#endif
	tst r0, #3
	ldreqb r0, [r8]
	cmpeq r0, #0
	bne _02347824
	ldrh r1, [sp, #0x44]
	ldrh r0, [sp, #0x46]
#ifdef JAPAN
	mov r6, #1
#else
	mov r7, #1
#endif
	strh r1, [r4, #0xd0]
	strh r0, [r4, #0xd2]
	b _02347978
_02347824:
#ifdef JAPAN
	ldr r0, [r6, #0xc]
#else
	ldr r0, [r7, #0xc]
#endif
	cmp r0, #0
	beq _02347960
	ldrb r1, [r8]
#ifdef JAPAN
	mov r7, #0
#else
	mov fp, #0
#endif
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, #1
	bne _02347870
	mov r1, #0x2d
	bl ItemIsActive__02347B50
	cmp r0, #0
	bne _0234786C
#ifdef JAPAN
	ldr r0, [r6, #0xc]
#else
	ldr r0, [r7, #0xc]
#endif
	mov r1, #0x54
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _02347870
_0234786C:
#ifdef JAPAN
	mov r7, #1
_02347870:
	cmp r7, #0
	addne r0, sb, #4
	andne sb, r0, #7
	bne _02347960
	ldr r0, [r6, #0xc]
	mov r7, #1
#else
	mov fp, #1
_02347870:
	cmp fp, #0
	beq _02347894
	add r5, r5, #1
	cmp r5, #2
	movge r7, #1
	bge _02347978
	add r0, sb, #4
	and sb, r0, #7
	b _02347960
_02347894:
	ldr r0, [r7, #0xc]
	mov fp, #1
#endif
	ldr r0, [r0]
	cmp r0, #1
	bne _0234791C
	add r0, sp, #0x34
#ifdef JAPAN
	add r1, r7, #0x194
	bl InitMove
	ldr r0, [r6, #0xc]
#else
	add r1, fp, #0x194
	bl InitMove
	ldr r0, [r7, #0xc]
#endif
	add r1, sp, #0x34
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	ldr r0, [sp, #8]
	mov r1, #1
	ldrsh r0, [r0, #4]
#ifdef JAPAN
	movne r7, #0
#else
	movne fp, #0
#endif
	bl TestItemAiFlag
	cmp r0, #0
	bne _0234791C
	mov r0, sl
	mov r1, #0x2e
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _02347908
	mov r0, sl
	mov r1, #0x60
	bl ExclusiveItemEffectIsActive__02347B80
	cmp r0, #0
	beq _0234791C
_02347908:
#ifdef JAPAN
	ldr r1, [r6, #0xc]
#else
	ldr r1, [r7, #0xc]
#endif
	mov r0, sl
	bl ov29_022FAFD4
	cmp r0, #0
#ifdef JAPAN
	movne r7, #0
_0234791C:
	cmp r7, #0
	beq _02347960
	cmp r5, #0x40
	bge _02347950
	ldr r1, [r6, #0xc]
	add r2, sp, #0x48
	mov r0, sl
	str r1, [r2, r5, lsl #3]
	bl DoesProjectileHitTarget
	add r1, sp, #0x48
	add r1, r1, r5, lsl #3
	strb r0, [r1, #4]
	add r5, r5, #1
#else
	movne fp, #0
_0234791C:
	cmp fp, #0
	beq _02347960
	cmp r6, #0x40
	bge _02347950
	ldr r1, [r7, #0xc]
	add r2, sp, #0x48
	mov r0, sl
	str r1, [r2, r6, lsl #3]
	bl DoesProjectileHitTarget
	add r1, sp, #0x48
	add r1, r1, r6, lsl #3
	strb r0, [r1, #4]
	add r6, r6, #1
#endif
_02347950:
	ldrb r0, [r8]
	cmp r0, #0
#ifdef JAPAN
	moveq r6, #0
	beq _02347978
_02347960:
	sub fp, fp, #1
	cmp fp, #0
	bgt _023475E8
	mov r6, #1
_02347978:
	mov r0, #0
	bl ov29_0234B4CC
	ldr r0, _02348EF8 ; =0x00000922
	mov fp, #0
	sub r0, r0, #1
	str r0, [sp, #0x2c]
	b _02347A94
_02347988:
	add r0, sp, #0x48
	ldr r7, [r0, fp, lsl #3]
	cmp r7, #0
	moveq r0, #0
	beq _02348D5C
	ldr r0, [r7]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02348D5C:
	cmp r0, #0
	beq _02347A90
	add r0, sp, #0x48
	add r0, r0, fp, lsl #3
#else
	moveq r7, #0
	beq _02347978
_02347960:
	ldr r0, [sp, #0x24]
	sub r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0
	bgt _023475E8
	mov r7, #1
_02347978:
	mov r0, #0
	bl ov29_0234B4CC
	mov r5, #0
	b _02347A94
_02347988:
	mov r0, sl
	bl EntityIsValid__02347BA4
	cmp r0, #0
	beq _02347A9C
	add r0, sp, #0x48
	ldr fp, [r0, r5, lsl #3]
	mov r0, fp
	bl EntityIsValid__02347BA4
	cmp r0, #0
	beq _02347A90
	add r0, sp, #0x48
	add r0, r0, r5, lsl #3
#endif
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02347A38
	mov r0, #0
#ifdef JAPAN
	mov r1, r7
#else
	mov r1, fp
#endif
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B70
#ifdef JAPAN
	mov r0, sl
	mov r1, r7
	mov r2, #0x920
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, r7
#else
	ldr r2, _02347B48 ; =0x00000BE1
	mov r0, sl
	mov r1, fp
	bl LogMessageByIdWithPopupCheckUserTarget
	mov r0, sl
	mov r1, fp
#endif
	bl ov29_02307BDC
	mov r2, r0
	ldr r0, [sp, #0x1c]
	mov r3, sl
	cmp r0, #0
	ldreqb r0, [r8]
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #0
	and r1, r0, #0xff
	ldr r0, [sp, #8]
#ifdef JAPAN
	str r7, [sp]
#else
	str fp, [sp]
#endif
	str r0, [sp, #4]
	mov r0, #1
	bl ApplyItemEffect
	b _02347A90
_02347A38:
	ldrb r0, [r8]
#ifdef JAPAN
	mov r1, r7
	cmp r0, #0
	mov r0, #0
	cmpeq r5, #1
	mov r2, r0
	moveq r6, #1
#else
	mov r1, fp
	cmp r0, #0
	mov r0, #0
	cmpeq r6, #1
	mov r2, r0
	moveq r7, #1
#endif
	bl SubstitutePlaceholderStringTags
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B44
	ldrb r0, [r8]
#ifdef JAPAN
	mov r1, r7
#else
	mov r1, fp
	ldr r2, _02347B48 ; =0x00000BE1
#endif
	cmp r0, #0
	mov r0, sl
	beq _02347A88
#ifdef JAPAN
	ldr r2, [sp, #0x2c]
#else
	add r2, r2, #1
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
	b _02347A90
_02347A88:
#ifdef JAPAN
	ldr r2, _02348EF8 ; =0x00000922
#else
	add r2, r2, #2
#endif
	bl LogMessageByIdWithPopupCheckUserTarget
_02347A90:
#ifdef JAPAN
	add fp, fp, #1
_02347A94:
	cmp fp, r5
#else
	add r5, r5, #1
_02347A94:
	cmp r5, r6
#endif
	blt _02347988
_02347A9C:
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	ldr r1, _02347B40 ; =DIRECTIONS_XY
	mov r2, r0, lsl #2
	add r0, r1, r0, lsl #2
	ldrh r1, [r1, r2]
	ldrh r0, [r0, #2]
#ifdef JAPAN
	cmp r6, #0
#else
	cmp r7, #0
#endif
	strh r1, [sp, #0x30]
	strh r0, [sp, #0x32]
	ldrsh r1, [sp, #0x30]
	ldrsh r0, [sp, #0x32]
	mov r1, r1, lsl #3
	mov r0, r0, lsl #3
	strh r1, [sp, #0x40]
	strh r0, [sp, #0x42]
	beq _02347B34
#ifdef JAPAN
	cmp r6, #1
	beq _02347AF4
	cmp r6, #2
#else
	cmp r7, #1
	beq _02347AF4
	cmp r7, #2
#endif
	beq _02347B1C
	b _02347B34
_02347AF4:
	add r1, sp, #0x40
	str r1, [sp]
	mov r5, #0
	ldr r2, [sp, #8]
	mov r0, sl
	add r1, r4, #0xcc
	mov r3, #1
	str r5, [sp, #4]
	bl SpawnDroppedItem
	b _02347B34
_02347B1C:
	ldr r1, [sp, #8]
	mov r0, #0
	bl ov29_02344B70
	ldr r1, _02347B4C ; =0x00000BE5
	mov r0, sl
	bl LogMessageByIdWithPopupCheckUser
_02347B34:
	add sp, sp, #0x248
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02347B3C: .word DUNGEON_PTR
_02347B40: .word DIRECTIONS_XY
_02347B44: .word ov29_023516FC
#ifdef JAPAN
_02348EF8: .word 0x00000922
_02347B4C: .word 0x00000924
#else
_02347B48: .word 0x00000BE1
_02347B4C: .word 0x00000BE5
#endif
	arm_func_end ov29_02347518
