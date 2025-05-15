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
