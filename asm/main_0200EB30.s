	.include "asm/macros.inc"
	.include "main_0200EB30.inc"

	.text

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

	arm_func_start ReturnEggExclusiveItem
ReturnEggExclusiveItem: ; 0x0200EB90
	mov ip, #0
	ldr r2, _0200EBC8 ; =BABY_EXCLUSIVE_ITEM_PAIRS
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
_0200EBC8: .word BABY_EXCLUSIVE_ITEM_PAIRS
	arm_func_end ReturnEggExclusiveItem

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
