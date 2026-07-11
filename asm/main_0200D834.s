	.include "asm/macros.inc"
	.include "main_0200D834.inc"

	.text

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

	arm_func_start GetMoneyQuantity
GetMoneyQuantity: ; 0x0200D8AC
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
	arm_func_end GetMoneyQuantity

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
	bl InitBitstreamForRead
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
	bl BitstreamDebug
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
	bl InitBitstreamForWrite
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
	bl BitstreamDebug
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
