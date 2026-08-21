	.include "asm/macros.inc"
	.include "main_0204357C.inc"

	.text

	arm_func_start sub_0204357C
sub_0204357C: ; 0x0204357C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	ldr r4, _020435C4 ; =_0209CA98
	add lr, sp, #0
	ldmia r4!, {r0, r1, r2, r3}
	mov ip, lr
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1, r2}
	ldr r3, _020435C8 ; =UNK_STORAGE_STRUCT_0X14
	stmia lr, {r0, r1, r2}
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x90c]
	cmp r0, #7
	bge _020435BC
	ldr r0, [ip, r0, lsl #2]
	blx r0
_020435BC:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020435C4: .word _0209CA98
_020435C8: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_0204357C

	arm_func_start sub_020435CC
sub_020435CC: ; 0x020435CC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	cmp r0, r1
	bne _0204361C
	ldr r0, _02043764 ; =_0209CA68
	mov r4, #0xa
	ldr r3, _02043768 ; =_0209CAB4
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r1, #4]
	strb r0, [r1, #0x7d8]
	b _02043758
_0204361C:
	bl IsSimpleMenuActive
	cmp r0, #0
	bne _02043758
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	bl GetSimpleMenuResult__0202B870
	ldr r1, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mov r4, r0
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd8]
	bl CloseSimpleMenu
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mvn r2, #1
	ldr r1, [r0, #4]
	cmp r4, #8
	strb r2, [r1, #0x7d8]
	ldreq r0, [r0, #4]
	mov r1, #0
	streq r1, [r0, #0x90c]
	beq _02043744
	mov r0, r4
	bl sub_02043BFC
	mvn r1, #0
	cmp r0, r1
	bne _020436F4
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	sub r1, r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _020436AC
	bl sub_0202812C
_020436AC:
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020436CC
	bl sub_0202812C
_020436CC:
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202812C
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	b _02043758
_020436F4:
	ldr r2, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	cmp r4, #5
	ldreq r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	moveq r1, #4
	ldreq r0, [r0, #4]
	streq r1, [r0, #0x90c]
	beq _02043758
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
_02043744:
	ldr r0, _02043760 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
_02043758:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02043760: .word UNK_STORAGE_STRUCT_0X14
_02043764: .word _0209CA68
_02043768: .word _0209CAB4
	arm_func_end sub_020435CC

	arm_func_start sub_0204376C
sub_0204376C: ; 0x0204376C
	stmdb sp!, {r3, lr}
	ldr r0, _020437B4 ; =_0209CA88
	bl CreateDialogueBox
	ldr r3, _020437B8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, _020437BC ; =0x00000418
	ldr ip, [r3, #4]
	ldr r2, _020437C0 ; =0x000002FF
	strb r0, [ip, #0x7d7]
	ldr r0, [r3, #4]
	mov r3, #0
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl ShowStringIdInDialogueBox
	ldr r0, _020437B8 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #2
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020437B4: .word _0209CA88
_020437B8: .word UNK_STORAGE_STRUCT_0X14
_020437BC: .word 0x00000418
#ifdef JAPAN
_020437C0: .word 0x000023A7
#else
_020437C0: .word 0x000002FF
#endif
	arm_func_end sub_0204376C

	arm_func_start sub_020437C4
sub_020437C4: ; 0x020437C4
	stmdb sp!, {r3, lr}
	ldr r0, _02043840 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #9
	mov r1, #0
	bl sub_02043BFC
	ldr r2, _02043840 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	ldr r0, _02043840 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	bl sub_0202F2C4
	ldr r0, _02043840 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043840: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_020437C4

	arm_func_start sub_02043844
sub_02043844: ; 0x02043844
	stmdb sp!, {r3, lr}
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd7]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl CloseDialogueBox
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	mvn r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x7d7]
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r2
	beq _020438AC
	bl sub_02028354
	cmp r0, #3
	bne _020438AC
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	bl sub_0202810C
_020438AC:
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020438E8
	bl sub_02028354
	cmp r0, #3
	bne _020438E8
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	bl sub_0202810C
_020438E8:
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_02028354
	cmp r0, #3
	bne _02043918
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202810C
_02043918:
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
	ldr r0, _02043940 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043940: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_02043844

	arm_func_start sub_02043944
sub_02043944: ; 0x02043944
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020439E8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0xb4
	add r0, r0, #0x1800
	bl sub_020547C8
	ldr r0, _020439E8 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0xb4
	add r0, r0, #0x1800
	bl sub_02054804
	ldr r1, _020439E8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r2, _020439EC ; =0x000002FE
	ldr r0, [r1, #4]
	mov r3, #0x10
	add r0, r0, #0x800
	strh r2, [r0, #0x7c]
	ldr r2, [r1, #4]
	ldr r0, _020439F0 ; =_0209CA78
	str r3, [r2, #0x880]
	ldr r3, [r1, #4]
	ldr r1, _020439F4 ; =0x00481813
	add r2, r3, #0x1800
	ldrsh ip, [r2, #0xb4]
	add r2, r3, #0x74
	ldr r3, _020439F8 ; =sub_02043BAC
	str ip, [sp]
	mov ip, #9
	add r2, r2, #0x800
	str ip, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _020439E8 ; =UNK_STORAGE_STRUCT_0X14
	mov r2, #5
	ldr r3, [r1, #4]
	strb r0, [r3, #0x7d9]
	ldr r0, [r1, #4]
	str r2, [r0, #0x90c]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020439E8: .word UNK_STORAGE_STRUCT_0X14
#ifdef JAPAN
_020439EC: .word 0x000023A6
#else
_020439EC: .word 0x000002FE
#endif
_020439F0: .word _0209CA78
_020439F4: .word 0x00481813
_020439F8: .word sub_02043BAC
	arm_func_end sub_02043944

	arm_func_start sub_020439FC
sub_020439FC: ; 0x020439FC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r4, r0, lsl #0x10
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl GetAdvancedMenuResult
	ldr r1, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r5, r0, lsl #0x10
	ldr r0, [r1, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd9]
	bl CloseAdvancedMenu
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mvn r3, #1
	ldr r1, [r0, #4]
	mov r2, r4, asr #0xf
	strb r3, [r1, #0x7d9]
	ldr r1, [r0, #4]
	add r0, r1, #0x1000
	add r1, r1, #0xb4
	ldr r3, [r0, #0x8b8]
	add r0, r1, #0x1800
	ldrsh r4, [r3, r2]
	bl sub_020547D8
	mvn r0, #0
	cmp r0, r5, asr #16
	bne _02043AB8
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r0, #4]
	mov r1, #6
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
_02043AB8:
	mov r0, r4
	bl sub_020440F8
	cmp r0, #0
	bgt _02043B38
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r0, #4]
	sub r1, r1, #2
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _02043AF0
	bl sub_0202812C
_02043AF0:
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _02043B10
	bl sub_0202812C
_02043B10:
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202812C
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #1
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
_02043B38:
	ldr r2, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	strh r4, [r2]
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r1, [r2, #4]
	add r0, r1, #0x700
	add r1, r1, #0x900
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	bl sub_0202C6D4
	ldr r0, _02043B78 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02043B78: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_020439FC

	arm_func_start sub_02043B7C
sub_02043B7C: ; 0x02043B7C
	stmdb sp!, {r3, lr}
	ldr r0, _02043BA8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202C620
	ldr r0, _02043BA8 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x90c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043BA8: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_02043B7C

	arm_func_start sub_02043BAC
sub_02043BAC: ; 0x02043BAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	blt _02043BD4
	ldr r2, _02043BF8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r3, [r2, #4]
	add r2, r3, #0x1800
	ldrsh r2, [r2, #0xb4]
	cmp r1, r2
	blt _02043BDC
_02043BD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
_02043BDC:
	add r2, r3, #0x1000
	ldr r2, [r2, #0x8b8]
	mov r1, r1, lsl #1
	ldrsh r1, [r2, r1]
	bl GetNameRaw
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02043BF8: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_02043BAC

	arm_func_start sub_02043BFC
sub_02043BFC: ; 0x02043BFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mov sb, r0
	ldr r0, [r2, #4]
	mov r4, r1
	ldr r6, [r0]
	bl sub_0200FD48
	sub r1, r6, #5
	mov r5, r0
	cmp r1, #2
	mov r7, #0
	movls r0, #1
	movhi r0, r7
	cmp r4, #0
	and r4, r0, #0xff
	beq _02043D0C
	mov r0, #0x3e8
	mov r1, #8
	bl MemAlloc
	mov r8, r0
	mov sl, #0
	ldr r0, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mov r1, sl
	mov r2, #1
_02043C5C:
	ldr r3, [r0, #8]
	ldrb r3, [r3, sl]
	cmp r3, #1
	moveq r3, r2
	movne r3, r1
	strb r3, [r8, sl]
	add sl, sl, #1
	cmp sl, #0x3e8
	blt _02043C5C
	bl sub_0200FD48
	mov r1, r0
	mov r0, r8
	bl SortItemsInStorage
	mov sl, #0
	ldr r0, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mov r2, sl
	mov r3, #1
_02043CA0:
	ldrb r1, [r8, sl]
	cmp r1, #0
	movne fp, r3
	ldr r1, [r0, #8]
	moveq fp, r2
	strb fp, [r1, sl]
	add sl, sl, #1
	cmp sl, #0x3e8
	blt _02043CA0
	mov r0, r8
	bl MemFree
	ldr r0, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd5]
	cmp r0, r1
	beq _02043CEC
	bl IsTextboxState3
_02043CEC:
	ldr r0, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _02043D0C
	bl IsTextboxState3
_02043D0C:
	mov r8, #0
	b _02043DE4
_02043D14:
	ldr r0, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r0, r0, r8, lsl #1
	add r0, r0, #0x300
	ldrsh r1, [r0, #0x8a]
	cmp r1, #0
	beq _02043DEC
	cmp r4, #0
	beq _02043D48
	ldrsh r0, [r0, #0x8a]
	bl IsItemValidVeneer
	cmp r0, #0
	beq _02043DD8
_02043D48:
	cmp r6, #7
	bne _02043DBC
	ldr r0, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	add r1, r0, r8, lsl #1
	add r0, r1, #0x300
	ldrsh sl, [r0, #0x8a]
	add r0, r1, #0xb00
	ldrh fp, [r0, #0x5a]
	mov r0, sl
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _02043DB0
	mov r0, sl
	bl IsTreasureBox
	cmp r0, #0
	beq _02043DA8
	mov r0, fp, lsl #0x10
	mov r0, r0, asr #0x10
	bl IsItemInTimeDarkness
	cmp r0, #0
	beq _02043DB0
	mov r0, #1
	b _02043DB4
_02043DA8:
	mov r0, #1
	b _02043DB4
_02043DB0:
	mov r0, #0
_02043DB4:
	cmp r0, #0
	beq _02043DD8
_02043DBC:
	ldr r0, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	add r2, r7, #1
	ldr r0, [r0, #4]
	add r1, r0, r7, lsl #1
	mov r0, r2, lsl #0x10
	strh r8, [r1, #4]
	mov r7, r0, asr #0x10
_02043DD8:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02043DE4:
	cmp r8, r5
	blt _02043D14
_02043DEC:
	mov r4, r7
	mvn r3, #0
	ldr r1, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	b _02043E14
_02043DFC:
	ldr r2, [r1, #4]
	add r0, r4, #1
	add r2, r2, r4, lsl #1
	mov r0, r0, lsl #0x10
	strh r3, [r2, #4]
	mov r4, r0, asr #0x10
_02043E14:
	cmp r4, r5
	blt _02043DFC
	mov r0, r7, lsl #0x10
	ldr r4, _0204408C ; =UNK_STORAGE_STRUCT_0X14
	mov r5, r0, asr #0x10
	cmp r5, #0
	str sb, [r4, #0x10]
	movle r0, #9
	strle r0, [r4, #0x10]
	suble r0, r0, #0xa
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #9
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r7, r8
	mov fp, #1
	ldr sl, _02044090 ; =BAG_ITEMS_PTR_MIRROR
	b _02044070
_02043E60:
	ldr r1, [r4, #4]
	ldr r0, [sl]
	add r1, r1, r7, lsl #1
	ldrsh r6, [r1, #4]
	add r0, r0, r6, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	bl GetItemCategoryVeneer
	ldr r1, [sl]
	add r1, r1, r6, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r1, #0x5c
	bgt _02043EA0
	beq _02043F20
	b _02043F24
_02043EA0:
	sub r1, r1, #0x190
	cmp r1, #0x1b
	addls pc, pc, r1, lsl #2
	b _02043F24
_02043EB0: ; jump table
	b _02043F20 ; case 0
	b _02043F20 ; case 1
	b _02043F20 ; case 2
	b _02043F20 ; case 3
	b _02043F20 ; case 4
	b _02043F20 ; case 5
	b _02043F20 ; case 6
	b _02043F20 ; case 7
	b _02043F20 ; case 8
	b _02043F20 ; case 9
	b _02043F20 ; case 10
	b _02043F20 ; case 11
	b _02043F20 ; case 12
	b _02043F20 ; case 13
	b _02043F20 ; case 14
	b _02043F20 ; case 15
	b _02043F20 ; case 16
	b _02043F20 ; case 17
	b _02043F20 ; case 18
	b _02043F20 ; case 19
	b _02043F20 ; case 20
	b _02043F20 ; case 21
	b _02043F20 ; case 22
	b _02043F20 ; case 23
	b _02043F20 ; case 24
	b _02043F20 ; case 25
	b _02043F20 ; case 26
	b _02043F20 ; case 27
_02043F20:
	mov r0, #7
_02043F24:
	cmp sb, #9
	addls pc, pc, sb, lsl #2
	b _0204402C
_02043F30: ; jump table
	b _02043F58 ; case 0
	b _02043F70 ; case 1
	b _02043F88 ; case 2
	b _02043F9C ; case 3
	b _02043FB4 ; case 4
	b _02043FC8 ; case 5
	b _02043FDC ; case 6
	b _02043FF8 ; case 7
	b _0204402C ; case 8
	b _0204402C ; case 9
_02043F58:
	cmp r0, #0
	cmpne r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F70:
	cmp r0, #2
	cmpne r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F88:
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043F9C:
	cmp r0, #5
	cmpne r0, #0xb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FB4:
	cmp r0, #9
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FC8:
	cmp r0, #0xf
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FDC:
	add r0, r0, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	b _02044030
_02043FF8:
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #4
	mov r1, #0
	bhi _02044018
	mov r0, fp, lsl r0
	tst r0, #0x17
	movne r1, fp
_02044018:
	cmp r1, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	b _02044030
_0204402C:
	mov r0, #1
_02044030:
	cmp r0, #0
	beq _02044064
	ldr r0, [r4, #4]
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	add r2, r0, r8, lsl #1
	ldrsh r2, [r2, #4]
	add r0, r0, r7, lsl #1
	strh r2, [r0, #4]
	ldr r0, [r4, #4]
	add r0, r0, r8, lsl #1
	strh r6, [r0, #4]
	mov r8, r1, asr #0x10
_02044064:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02044070:
	cmp r7, r5
	blt _02043E60
	cmp r8, #0
	mvnle r8, #0
	mov r0, r8, lsl #0x10
	mov r0, r0, asr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204408C: .word UNK_STORAGE_STRUCT_0X14
_02044090: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02043BFC

	arm_func_start AllocStorageSelectedItemTable
AllocStorageSelectedItemTable: ; 0x02044094
	stmdb sp!, {r3, lr}
	mov r0, #0x3e8
	mov r1, #8
	bl MemAlloc
	ldr r1, _020440B4 ; =UNK_STORAGE_STRUCT_0X14
	str r0, [r1, #8]
	bl ClearStorageSelectedItemTable
	ldmia sp!, {r3, pc}
	.align 2, 0
_020440B4: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end AllocStorageSelectedItemTable

	arm_func_start FreeStorageSelectedItemTable
FreeStorageSelectedItemTable: ; 0x020440B8
	stmdb sp!, {r3, lr}
	ldr r0, _020440D8 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _020440D8 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020440D8: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end FreeStorageSelectedItemTable

	arm_func_start sub_020440DC
sub_020440DC: ; 0x020440DC
	ldr r0, _020440F4 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #9
	str r1, [r0, #0x10]
	mov r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_020440F4: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_020440DC

	arm_func_start sub_020440F8
sub_020440F8: ; 0x020440F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	mov sl, r0
	mov r1, sb
	bl GetType
	mov r6, r0
	mov r0, sl
	mov r1, #1
	bl GetType
	mov r7, r0
	mov r8, sb
	ldr r4, _020441B4 ; =UNK_STORAGE_STRUCT_0X14
	ldr fp, _020441B8 ; =BAG_ITEMS_PTR_MIRROR
	b _02044198
_02044130:
	add r0, r1, r8, lsl #1
	ldrsh r5, [r0, #4]
	ldr r0, [fp]
	mov r1, sl
	add r0, r0, r5, lsl #1
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8a]
	mov r2, r6
	mov r3, r7
	bl IsExclusiveItemIdForMonster
	cmp r0, #0
	beq _0204418C
	ldr r3, [r4, #4]
	add r0, sb, #1
	add r1, r3, sb, lsl #1
	ldrsh r2, [r1, #4]
	add r1, r3, r8, lsl #1
	mov r0, r0, lsl #0x10
	strh r2, [r1, #4]
	ldr r1, [r4, #4]
	add r1, r1, sb, lsl #1
	strh r5, [r1, #4]
	mov sb, r0, asr #0x10
_0204418C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_02044198:
	ldr r1, [r4, #4]
	add r0, r1, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r8, r0
	blt _02044130
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020441B4: .word UNK_STORAGE_STRUCT_0X14
_020441B8: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_020440F8

	arm_func_start sub_020441BC
sub_020441BC: ; 0x020441BC
	stmdb sp!, {r3, lr}
	ldr r0, _0204420C ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #1
	ldr r0, [r0, #0x10]
	bl sub_02043BFC
	ldr r2, _0204420C ; =UNK_STORAGE_STRUCT_0X14
	mov r3, #0
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r2, [r2, #4]
	add r0, r2, #0x700
	add r1, r2, #0x900
	add r2, r2, #0x1000
	ldrsb r0, [r0, #0xd4]
	ldrsh r1, [r1, #0x10]
	ldr r2, [r2, #0x8bc]
	bl sub_0202C654
	bl sub_02044308
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204420C: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_020441BC

	arm_func_start sub_02044210
sub_02044210: ; 0x02044210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	bl sub_02027B1C
#ifdef JAPAN
	ldr r3, _020445D8 ; =0x000023A8
#endif
	mov r0, r4
	mov r1, #0xa
	mov r2, #2
#ifndef JAPAN
	mov r3, #0x300
#endif
	bl AppendStandardStringToMission
	bl CountSelectedStorageItems
	str r0, [sp, #0x28]
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _02044268 ; =0x00000301
	mov r0, r4
	mov r1, #0x66
	mov r2, #2
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
#ifdef JAPAN
_020445D8: .word 0x000023A8
_02044268: .word 0x000023A9
#else
_02044268: .word 0x00000301
#endif
	arm_func_end sub_02044210

	arm_func_start sub_0204426C
sub_0204426C: ; 0x0204426C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _020442C0 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	mov r3, #1
	str r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	ldr r2, _020442C4 ; =_0209CB0C
	strb r3, [r0, #4]
	ldr r0, [r1]
	ldr r1, _020442C8 ; =sub_02044338
	ldr r0, [r0]
	add r0, r2, r0, lsl #4
	bl CreateTextBox
	ldr r1, _020442C0 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020442C0: .word UNK_STORAGE_STRUCT_0X8_PTR_1
_020442C4: .word _0209CB0C
_020442C8: .word sub_02044338
	arm_func_end sub_0204426C

	arm_func_start sub_020442CC
sub_020442CC: ; 0x020442CC
	stmdb sp!, {r3, lr}
	ldr r0, _02044304 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _02044304 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02044304 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044304: .word UNK_STORAGE_STRUCT_0X8_PTR_1
	arm_func_end sub_020442CC

	arm_func_start sub_02044308
sub_02044308: ; 0x02044308
	stmdb sp!, {r3, lr}
	ldr r0, _02044334 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r2, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl IsTextboxState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044334: .word UNK_STORAGE_STRUCT_0X8_PTR_1
	arm_func_end sub_02044308

	arm_func_start sub_02044338
sub_02044338: ; 0x02044338
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	ldr r1, _02044404 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	mov r5, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	beq _020443FC
	mov r1, #0
	strb r1, [r2, #4]
	mov r4, #2
	bl sub_02027B1C
	ldr r0, _02044404 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	cmpne r0, #2
	bne _020443B0
	bl GetNbItemsInBag
	str r0, [sp, #0x28]
	bl GetCurrentBagCapacity
#ifdef JAPAN
	str r0, [sp, #0x2c]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _0204477C ; =0x000031F7
	mov r0, r5
	mov r1, #0
	mov r2, #2
#else
	mov r2, #2
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	mov r0, r5
	add r3, r2, #0x330
	mov r1, #0
#endif
	bl sub_020262E0
	add r4, r4, #0x10
_020443B0:
	ldr r0, _02044404 ; =UNK_STORAGE_STRUCT_0X8_PTR_1
	ldr r0, [r0]
	ldr r0, [r0]
	sub r0, r0, #1
	cmp r0, #1
	bhi _020443F4
	bl CountNbOfItemsInStorage
	str r0, [sp, #0x28]
	bl sub_0200FD48
	str r0, [sp, #0x2c]
	add ip, sp, #4
	ldr r3, _02044408 ; =0x00000333
	mov r0, r5
	mov r2, r4
	mov r1, #0
	str ip, [sp]
	bl sub_020262E0
_020443F4:
	mov r0, r5
	bl UpdateWindow
_020443FC:
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02044404: .word UNK_STORAGE_STRUCT_0X8_PTR_1
#ifdef JAPAN
_0204477C: .word 0x000031F7
_02044408: .word 0x000031F8
#else
_02044408: .word 0x00000333
#endif
	arm_func_end sub_02044338

	arm_func_start sub_0204440C
sub_0204440C: ; 0x0204440C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r2, _02044468 ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	mov ip, #0
	str r0, [r2]
	str r4, [r0]
	ldr r1, [r2]
	ldr r0, _0204446C ; =_0209CB3C
	strh ip, [r1, #6]
	ldr r3, [r2]
	ldr r1, _02044470 ; =sub_020444F0
	strh ip, [r3, #8]
	ldr r2, [r2]
	mov r3, #1
	strb r3, [r2, #4]
	bl CreateTextBox
	ldr r1, _02044468 ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02044468: .word UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
_0204446C: .word _0209CB3C
_02044470: .word sub_020444F0
	arm_func_end sub_0204440C

	arm_func_start sub_02044474
sub_02044474: ; 0x02044474
	stmdb sp!, {r3, lr}
	ldr r0, _020444AC ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #0xa]
	bl CloseTextBox2
	ldr r0, _020444AC ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020444AC ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020444AC: .word UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	arm_func_end sub_02044474

	arm_func_start sub_020444B0
sub_020444B0: ; 0x020444B0
	stmdb sp!, {r3, lr}
	ldr r1, _020444EC ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	ldr r3, [r1]
	cmp r3, #0
	ldrnesh r2, [r3, #6]
	cmpne r2, r0
	ldmeqia sp!, {r3, pc}
	strh r0, [r3, #6]
	ldr r0, [r1]
	mov r2, #1
	strb r2, [r0, #4]
	ldr r0, [r1]
	ldrsb r0, [r0, #0xa]
	bl IsTextboxState3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020444EC: .word UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	arm_func_end sub_020444B0

	arm_func_start sub_020444F0
sub_020444F0: ; 0x020444F0
	stmdb sp!, {r4, lr}
	ldr r1, _02044564 ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	strb r1, [r2, #4]
	bl sub_02027B1C
	ldr r0, _02044564 ; =UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	ldr r2, [r0]
	ldrsh r1, [r2, #6]
	strh r1, [r2, #8]
	ldr r0, [r0]
	ldrsh r0, [r0, #8]
	cmp r0, #0
	beq _02044558
#if defined(EUROPE)
	add r0, r0, #0x4b
	add r0, r0, #0x2f00
#elif defined(JAPAN)
	add r0, r0, #0x41
	add r0, r0, #0x1d00
#else
	add r0, r0, #0x49
	add r0, r0, #0x2f00
#endif
	mov r3, r0, lsl #0x10
	mov r1, #2
	mov r0, r4
	mov r2, r1
	mov r3, r3, lsr #0x10
	bl AppendStandardStringToMission
_02044558:
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_02044564: .word UNK_STORAGE_WINDOW_STRUCT_0XC_PTR
	arm_func_end sub_020444F0

	arm_func_start sub_02044568
sub_02044568: ; 0x02044568
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #8
	mov r1, r0
	bl MemAlloc
	ldr r1, _020445BC ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	mov r3, #1
	str r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	ldr r2, _020445C0 ; =_0209CB4C
	strb r3, [r0, #4]
	ldr r0, [r1]
	ldr r1, _020445C4 ; =sub_02044604
	ldr r0, [r0]
	add r0, r2, r0, lsl #4
	bl CreateTextBox
	ldr r1, _020445BC ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	ldr r1, [r1]
	strb r0, [r1, #5]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020445BC: .word UNK_STORAGE_STRUCT_0X8_PTR_2
_020445C0: .word _0209CB4C
_020445C4: .word sub_02044604
	arm_func_end sub_02044568

	arm_func_start sub_020445C8
sub_020445C8: ; 0x020445C8
	stmdb sp!, {r3, lr}
	ldr r0, _02044600 ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0, #5]
	bl CloseTextBox2
	ldr r0, _02044600 ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02044600 ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02044600: .word UNK_STORAGE_STRUCT_0X8_PTR_2
	arm_func_end sub_020445C8

	arm_func_start sub_02044604
sub_02044604: ; 0x02044604
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	ldr r1, _02044680 ; =UNK_STORAGE_STRUCT_0X8_PTR_2
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #4]
	cmp r1, #0
	beq _02044678
	mov r1, #0
	strb r1, [r2, #4]
	bl sub_02027B1C
#ifdef JAPAN
	ldr r3, _020449FC ; =0x000031F9
#endif
	mov r0, r4
	mov r1, #4
	mov r2, #0
#ifndef JAPAN
	mov r3, #0x334
#endif
	bl AppendStandardStringToMission
	bl GetMoneyCarried
	mov r1, #0x18
	str r1, [sp, #0x2c]
	str r0, [sp, #0x28]
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _02044684 ; =0x00000335
	mov r0, r4
	mov r1, #0x10
	mov r2, #0xc
	bl sub_020262E0
	mov r0, r4
	bl UpdateWindow
_02044678:
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02044680: .word UNK_STORAGE_STRUCT_0X8_PTR_2
#ifdef JAPAN
_020449FC: .word 0x000031F9
_02044684: .word 0x000031FA
#else
_02044684: .word 0x00000335
#endif
	arm_func_end sub_02044604

	arm_func_start sub_02044688
sub_02044688: ; 0x02044688
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa4
	mov r6, r0
	mov r5, r1
	ldr r0, _020447E8 ; =0x00000944
	mov r1, #8
	mov r8, r2
	mov r7, r3
	bl MemAlloc
	ldr r1, _020447E8 ; =0x00000944
	mov r4, r0
	bl MemZero
	mov r1, r8
	mov r2, r7
	mov r3, #0
	strb r3, [r4, #0x72e]
	strb r3, [r4, #0x82e]
	str r3, [r4, #0x940]
	sub r0, r3, #1
	str r0, [r4, #0x930]
	str r3, [r4, #0x940]
	ldr r3, [sp, #0xc4]
	add r0, r4, #4
	str r3, [sp]
	ldrb r3, [sp, #0xc0]
	bl sub_02044BF8
	ldr r0, _020447EC ; =_0209CB78
	ldr r1, _020447F0 ; =sub_02044964
	mov r2, r4
	bl CreateTextBoxWithArg
	strb r0, [r4, #0x72c]
	cmp r5, #3
	mov r0, #0x10
	str r0, [sp, #0x18]
	ldr r1, _020447F4 ; =0x00000A36
	add r0, r4, #0x2e
	add r0, r0, #0x700
	str r0, [sp, #0x54]
	strh r1, [sp, #0x14]
	bne _02044760
	add r1, r1, #3
	add r0, r4, #0x900
	strh r1, [r0, #0x2e]
	str r4, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _020447F8 ; =_0209CB88
	ldr r3, _020447FC ; =sub_02044990
	add r2, sp, #0xc
	mov r1, #0x800
	bl CreateAdvancedTextBoxWithArg
	strb r0, [r4, #0x72d]
	b _020447A8
_02044760:
	cmp r5, #2
	addne r1, r1, #3
	addne r0, r4, #0x900
	strneh r1, [r0, #0x2e]
	bne _020447A8
	add r1, r1, #2
	add r0, r4, #0x900
	strh r1, [r0, #0x2e]
	str r4, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _020447F8 ; =_0209CB88
	ldr r3, _020447FC ; =sub_02044990
	add r2, sp, #0xc
	mov r1, #0x800
	bl CreateAdvancedTextBoxWithArg
	strb r0, [r4, #0x72d]
_020447A8:
	mov r0, r6
	str r6, [r4, #0x934]
	bl GetItemAtIdx
	ldrh r2, [r0]
	add r1, r4, #0x900
	strh r2, [r1, #0x38]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x3a]
	ldrh r2, [r0, #4]
	mov r0, r4
	strh r2, [r1, #0x3c]
	str r5, [r4]
	bl sub_02044AEC
	mov r0, r4
	add sp, sp, #0xa4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020447E8: .word 0x00000944
_020447EC: .word _0209CB78
_020447F0: .word sub_02044964
#ifdef JAPAN
_020447F4: .word 0x00000871
#else
_020447F4: .word 0x00000A36
#endif
_020447F8: .word _0209CB88
_020447FC: .word sub_02044990
	arm_func_end sub_02044688

	arm_func_start sub_02044800
sub_02044800: ; 0x02044800
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x940]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020448E4
_02044818: ; jump table
	b _02044828 ; case 0
	b _02044830 ; case 1
	b _020448B8 ; case 2
	b _020448DC ; case 3
_02044828:
	mov r0, #1
	str r0, [r5, #0x940]
_02044830:
	add r0, r5, #4
	bl sub_020451D8
	mov r4, r0
	mov r0, r5
	bl sub_02044AEC
	cmp r4, #0
	beq _020448E4
	mov r0, #2
	str r0, [r5, #0x940]
	cmp r4, #2
	bne _020448E4
	add r0, r5, #4
	bl sub_020452A0
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020448A0
_02044870: ; jump table
	b _02044880 ; case 0
	b _02044888 ; case 1
	b _02044890 ; case 2
	b _02044898 ; case 3
_02044880:
	mov r1, #1
	b _020448A4
_02044888:
	mov r1, #2
	b _020448A4
_02044890:
	mov r1, #3
	b _020448A4
_02044898:
	mov r1, #4
	b _020448A4
_020448A0:
	mov r1, #0
_020448A4:
	ldr r0, [r5, #0x934]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02058460
	b _020448E4
_020448B8:
	add r0, r5, #4
	bl sub_020452B8
	cmp r0, #0
	beq _020448E4
	mov r0, r5
	bl sub_02044918
	mov r0, #3
	str r0, [r5, #0x940]
	b _020448E4
_020448DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020448E4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02044800

	arm_func_start sub_020448EC
sub_020448EC: ; 0x020448EC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_02044918
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020448EC

	arm_func_start sub_02044918
sub_02044918: ; 0x02044918
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x2d]
	mvn r1, #1
	cmp r0, r1
	beq _02044940
	bl CloseAdvancedTextBox
	mvn r0, #1
	strb r0, [r4, #0x72d]
_02044940:
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x2c]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	bl CloseTextBox
	mvn r0, #1
	strb r0, [r4, #0x72c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02044918

	arm_func_start sub_02044964
sub_02044964: ; 0x02044964
	stmdb sp!, {r4, lr}
	add r1, r1, #0x900
	mov r4, r0
	ldrh r0, [r1, #0x2e]
	bl StringFromId
	mov r1, #2
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	arm_func_end sub_02044964

	arm_func_start sub_02044990
sub_02044990: ; 0x02044990
	ldr ip, _020449A8 ; =DrawTextInWindow
	add r1, r1, #0x2e
	add r3, r1, #0x800
	mov r1, #2
	mov r2, #0x10
	bx ip
	.align 2, 0
_020449A8: .word DrawTextInWindow
	arm_func_end sub_02044990

	arm_func_start sub_020449AC
sub_020449AC: ; 0x020449AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	add r0, r6, #4
	mov r5, r1
	mov r4, #0
	bl sub_02045298
	cmp r0, #0
#ifdef JAPAN
	beq _02044A30
#else
	bne _020449E8
	mov r0, r5
	bl sub_02045330
	add r2, r6, #0x2e
	mov r1, r0
	add r0, r2, #0x700
	bl GetRecoloredNameOfTeamMemberAtIdx
	b _02044A30
_020449E8:
#endif
	ldr r1, _02044ADC ; =DUNGEON_PTR
	add r0, r6, #0x2e
	ldr r1, [r1]
	add r0, r0, #0x700
	add r1, r1, r5, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	mov r2, r4
	ldr r7, [r1, #0xb4]
	bl GetMonsterOrTrapName
	ldrb r0, [r7, #0xbc]
	cmp r0, #7
	beq _02044A2C
	mov r0, r7
	bl IsExperienceLocked
	cmp r0, #0
	beq _02044A30
_02044A2C:
	mov r4, #1
_02044A30:
	cmp r4, #0
	beq _02044A4C
	add r0, r6, #0x2e
	ldr r1, _02044AE0 ; =0x00000A3D
	add r0, r0, #0x800
	bl GetStringFromFileVeneer
	b _02044ACC
_02044A4C:
	add r0, r6, #4
	bl sub_02045298
	cmp r0, #0
	bne _02044A70
	mov r0, r5
	bl sub_02045330
	bl GetActiveTeamMember
	add r1, r0, #0x3e
	b _02044A8C
_02044A70:
	ldr r0, _02044ADC ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	ldr r0, [r0, #0xb4]
	add r1, r0, #0x62
_02044A8C:
	ldrb r0, [r1]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	add r0, r6, #0x2e
	bne _02044AB8
	ldr r1, _02044AE4 ; =0x00000A37
	add r0, r0, #0x800
	bl GetStringFromFileVeneer
	b _02044ACC
_02044AB8:
	ldr r2, _02044AE8 ; =_0209CB6C
	mov r3, #1
	add r0, r0, #0x800
	str r3, [sp]
	bl MaybeGetFormattedItemName
_02044ACC:
	add r0, r6, #0x700
	ldrsb r0, [r0, #0x2d]
	bl SetAdvancedTextBoxField0x1C2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02044ADC: .word DUNGEON_PTR
#ifdef JAPAN
_02044AE0: .word 0x00000878
_02044AE4: .word 0x00000872
#else
_02044AE0: .word 0x00000A3D
_02044AE4: .word 0x00000A37
#endif
_02044AE8: .word _0209CB6C
	arm_func_end sub_020449AC

	arm_func_start sub_02044AEC
sub_02044AEC: ; 0x02044AEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	add r0, r7, #4
	bl sub_020452A0
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	ldrne r0, [r7, #0x930]
	ldr r5, [r7]
	cmpne r0, r4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r7, #4
	bl sub_02045298
	cmp r0, #0
	bne _02044B5C
	cmp r5, #1
	addne r0, r7, #0x700
	ldrnesb r1, [r0, #0x2d]
	mvnne r0, #1
	cmpne r1, r0
	beq _02044BEC
	sub r0, r5, #2
	cmp r0, #1
	bhi _02044BEC
	mov r0, r7
	mov r1, r4
	bl sub_020449AC
	b _02044BEC
_02044B5C:
	ldr r0, _02044BF4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r6, [r0, #0xa84]
#else
	ldr r6, [r0, #0xb28]
#endif
	cmp r6, #0
	moveq r0, #0
	beq _02044B90
	ldr r0, [r6]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02044B90:
	cmp r0, #0
	cmpne r5, #1
	beq _02044BC8
	sub r0, r5, #2
	cmp r0, #1
	bhi _02044BC8
	add r0, r7, #0x700
	ldrsb r1, [r0, #0x2d]
	mvn r0, #1
	cmp r1, r0
	beq _02044BC8
	mov r0, r7
	mov r1, r4
	bl sub_020449AC
_02044BC8:
	mov r0, r6
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov r2, #1
	mov r3, r2
	add r0, r6, #4
	mov r1, #0
	bl DrawTileGrid
_02044BEC:
	str r4, [r7, #0x930]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02044BF4: .word DUNGEON_PTR
	arm_func_end sub_02044AEC

	arm_func_start sub_02044BF8
sub_02044BF8: ; 0x02044BF8
#ifdef JAPAN
#define SUB_02044BF8_LOAD_OFFSET #0xa84
#else
#define SUB_02044BF8_LOAD_OFFSET #0xb28
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xbc
	mov fp, r1
	str r2, [sp, #4]
	ldr r1, _0204519C ; =0x00000728
	mov sl, r0
	str r3, [sp, #8]
	bl MemZero
	ldr sb, [sp, #0xe0]
	add r0, sl, #0x20c
	mov r4, #0
	str r4, [sl]
	cmp sb, #0
	add r7, r0, #0x400
	bne _02044CD8
	mov r8, r4
	mov fp, r4
	mov r6, #1
	mov r5, r4
_02044C44:
	mov r0, r8
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r1, r6
	moveq r1, fp
	tst r1, #0xff
	beq _02044C88
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	addne r1, r7, r4, lsl #2
	addne r0, r7, r4
	strne r8, [r1, #8]
	strneb r5, [r0, #0x18]
	addne r4, r4, #1
_02044C88:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #4
	blt _02044C44
	mov r0, r4, lsl #0x10
	mov r5, r0, asr #0x10
	mvn r3, #0
	mov r2, #0
	b _02044CCC
_02044CB0:
	add r1, r7, r5, lsl #2
	add r0, r5, #1
	str r3, [r1, #8]
	add r1, r7, r5
	mov r0, r0, lsl #0x10
	strb r2, [r1, #0x18]
	mov r5, r0, asr #0x10
_02044CCC:
	cmp r5, #4
	blt _02044CB0
	b _02044D78
_02044CD8:
	mov r5, r4
_02044CDC:
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, SUB_02044BF8_LOAD_OFFSET]
	mov r0, r6
	bl sub_0204533C
	cmp r0, #0
	beq _02044D40
	cmp fp, #0
	beq _02044D18
	mov r0, r6
	ldr r8, [r6, #0xb4]
	bl ov29_02347100
#ifdef JAPAN
	strb r0, [r8, #0x15d]
#else
	strb r0, [r8, #0x161]
#endif
_02044D18:
	add r0, r7, r4, lsl #2
	str r5, [r0, #8]
	ldr r0, [r6, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x15d]
#else
	ldrb r0, [r0, #0x161]
#endif
	cmp r0, #0
	movne r1, #0
	add r0, r7, r4
	moveq r1, #3
	strb r1, [r0, #0x18]
	add r4, r4, #1
_02044D40:
	add r5, r5, #1
	cmp r5, #4
	blt _02044CDC
	mov r5, r4
	mvn r3, #0
	mov r1, #0
	b _02044D70
_02044D5C:
	add r2, r7, r5, lsl #2
	add r0, r7, r5
	str r3, [r2, #8]
	strb r1, [r0, #0x18]
	add r5, r5, #1
_02044D70:
	cmp r5, #4
	blt _02044D5C
_02044D78:
	ldr r0, [sp, #0xe0]
	str r4, [r7, #0x1c]
	str r0, [r7]
	cmp sb, #0
	moveq r0, #0
	beq _02044D98
	mov r0, #0xb
	bl Arm9LoadUnkFieldNa0x2029EC8
_02044D98:
	str r0, [sl, #0x6e8]
	str r4, [sl, #0x6ec]
	str r4, [sl, #0x6f0]
	mov sb, #0
	str sb, [sl, #0x6f4]
	str sb, [sl, #0x6f8]
	add r0, sl, #0x18c
	str sb, [sl, #0x6dc]
	add r2, sl, #0x20c
	add r0, r0, #0x400
	mov r1, #0x40
	str sb, [sl, #0x6e0]
	add r5, r2, #0x400
	bl MemZero
	add r0, sl, #0x1cc
	add r0, r0, #0x400
	mov r1, #0x40
	bl MemZero
	add r0, sl, #0x18c
	add r0, r0, #0x400
	str r0, [sp, #0x14]
	add r0, sl, #0x3c
	add r1, sl, #0x1cc
	add r2, sl, #0x13c
	str r0, [sp, #0x10]
	add r0, r2, #0x400
	str r0, [sp, #0x18]
	ldr r0, _020451A4 ; =0x000003E7
	mov r6, sb
	sub r0, r0, #0x3e8
	str r0, [sp, #0x20]
	ldr r0, _020451A4 ; =0x000003E7
	add r4, r1, #0x400
	sub r0, r0, #0x3e8
	str r0, [sp, #0x1c]
	b _020450F8
_02044E28:
	mov r0, r5
	mov r1, r6
	bl sub_02045360
	mov fp, r0
	ldr r0, [sp, #0x1c]
	cmp fp, r0
	beq _020450F4
	ldr r0, [sp, #0x10]
	mov r1, r6
	add r0, r0, sb, lsl #8
	str r0, [sp, #0xc]
	mov r0, r5
	bl sub_02045360
	mov r1, r0
	ldr r0, [sp, #0x20]
	cmp r1, r0
	beq _02044EC4
	ldr r0, [r5]
	cmp r0, #0
	bne _02044E8C
	mov r0, r1, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r0, [sp, #0x14]
	bl GetRecoloredNameOfTeamMemberAtIdx
	b _02044EC4
_02044E8C:
	ldr r3, _020451A0 ; =DUNGEON_PTR
	add r0, r5, r6
	ldr r3, [r3]
	ldrb r0, [r0, #0x18]
	add r1, r3, r1, lsl #2
	add r1, r1, #0x12000
	cmp r0, #0
	movne r0, #0x57
	ldr r1, [r1, SUB_02044BF8_LOAD_OFFSET]
	moveq r0, #0x44
	and r2, r0, #0xff
	ldr r0, [sp, #0x14]
	ldr r1, [r1, #0xb4]
	bl ov29_023002F0
_02044EC4:
	ldr r0, [sp, #0x14]
	str r0, [sl, #0x574]
	ldr r0, [r5]
	cmp r0, #0
	bne _02044EE8
	ldr r1, _020451A8 ; =_0209CBA8
	mov r0, r4
	bl strcpy
	b _020450A8
_02044EE8:
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, fp, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, SUB_02044BF8_LOAD_OFFSET]
	bl sub_0204533C
	cmp r0, #0
	beq _020450F4
	ldr r0, _020451A0 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldr r0, _020451AC ; =TEAM_MEMBER_TABLE_PTR
	ldr r1, [r0]
	add r0, r2, fp, lsl #2
	add r0, r0, #0x12000
	ldr r2, [r0, SUB_02044BF8_LOAD_OFFSET]
	add r0, r1, #0x9000
	ldr r8, [r2, #0xb4]
	ldr r2, [r0, #0x84c]
	ldrsh r1, [r8, #0xc]
	mov r0, #0x68
	smlabb r0, r1, r0, r2
	ldrsh r0, [r0, #8]
	bl sub_02056228
	cmp r0, #0
	ldrsh r1, [r8, #0x12]
	ldrsh r0, [r8, #0x16]
	beq _02045000
	add r1, r1, r0
	ldr r0, _020451A4 ; =0x000003E7
	cmp r1, r0
	movgt r3, r0
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r8, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02044F8C
	ldr r1, _020451B0 ; =_0209CBB0
	mov r0, r4
	bl strcpy
	b _020450A8
_02044F8C:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r3, r2
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _02044FC0
	ldr r1, _020451B4 ; =_0209CBB8
	mov r0, r4
	bl strcpy
	b _020450A8
_02044FC0:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r1, r2
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	mov r0, r4
	bgt _02044FF4
	ldr r1, _020451B8 ; =_0209CBC0
	bl strcpy
	b _020450A8
_02044FF4:
	ldr r1, _020451BC ; =_0209CBC8
	bl strcpy
	b _020450A8
_02045000:
	add r1, r1, r0
	ldr r0, _020451A4 ; =0x000003E7
	cmp r1, r0
	movgt r3, r0
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r8, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02045038
	ldr r1, _020451C0 ; =_0209CBD0
	mov r0, r4
	bl strcpy
	b _020450A8
_02045038:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r3, r2
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _0204506C
	ldr r1, _020451C4 ; =_0209CBD8
	mov r0, r4
	bl strcpy
	b _020450A8
_0204506C:
	ldr r2, _020451A4 ; =0x000003E7
	cmp r1, r2
	movgt r1, r2
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	mov r0, r4
	bgt _020450A0
	ldr r1, _020451C8 ; =_0209CBE0
	bl strcpy
	b _020450A8
_020450A0:
	ldr r1, _020451A8 ; =_0209CBA8
	bl strcpy
_020450A8:
	str r4, [sl, #0x578]
	ldr r0, [r5]
	cmp r0, #0
	bne _020450C4
	mov r0, fp, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
_020450C4:
	ldr r0, [sp, #0x18]
	ldr r2, _020451CC ; =_0209CBE8
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r1, #0x100
	mov r3, #0
	bl PreprocessString
	add r1, sl, sb, lsl #3
	ldr r0, [sp, #0xc]
	add sb, sb, #1
	str r0, [r1, #0xc]
	str sb, [r1, #0x10]
_020450F4:
	add r6, r6, #1
_020450F8:
	ldr r0, [r5, #0x1c]
	cmp r6, r0
	blt _02044E28
	mov r0, #0
	add r1, sl, sb, lsl #3
	str r0, [r1, #0xc]
	sub r0, r0, #1
	str r0, [r1, #0x10]
	ldr r0, [sp, #4]
	add r2, sp, #0x24
	cmp r0, #0
	ldrne r1, _020451D0 ; =0x00000A3A
	movne r0, #0x10
	strne r0, [sp, #0x30]
	strneh r1, [sp, #0x2c]
	ldr r1, [sl, #0x6e8]
	add r0, r7, #0x18
	add r1, r1, #1
	str r1, [sp, #0x24]
	str r0, [sp, #0x84]
	ldr r0, [sp, #4]
	add r3, sl, #0xc
	cmp r0, #0
	movne r1, #0x800
	ldr r0, [sp, #8]
	moveq r1, #0
	cmp r0, #0
	movne r0, #0x400000
	moveq r0, #0
	orr r0, r0, #0x33
	orr r1, r0, r1
	ldr r0, _020451D4 ; =_0209CB98
	orr r1, r1, #0x1200
	bl CreateParentMenu
	ldr r1, [sp, #0xe0]
	strb r0, [sl, #8]
	cmp r1, #1
	bne _02045194
	bl ov29_022EA62C
_02045194:
	add sp, sp, #0xbc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0204519C: .word 0x00000728
_020451A0: .word DUNGEON_PTR
_020451A4: .word 0x000003E7
_020451A8: .word _0209CBA8
_020451AC: .word TEAM_MEMBER_TABLE_PTR
_020451B0: .word _0209CBB0
_020451B4: .word _0209CBB8
_020451B8: .word _0209CBC0
_020451BC: .word _0209CBC8
_020451C0: .word _0209CBD0
_020451C4: .word _0209CBD8
_020451C8: .word _0209CBE0
_020451CC: .word _0209CBE8
#ifdef JAPAN
_020451D0: .word 0x00000875
#else
_020451D0: .word 0x00000A3A
#endif
_020451D4: .word _0209CB98
	arm_func_end sub_02044BF8

	arm_func_start sub_020451D8
sub_020451D8: ; 0x020451D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	add r0, r4, #0x20c
	cmp r1, #0
	add r5, r0, #0x400
	beq _02045208
	cmp r1, #1
	beq _02045220
	cmp r1, #2
	beq _02045288
	b _02045290
_02045208:
	ldrsb r0, [r4, #8]
	bl IsParentMenuActive
	cmp r0, #0
	beq _02045290
	mov r0, #1
	str r0, [r4]
_02045220:
	ldrsb r0, [r4, #8]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02045278
	mov r0, #2
	str r0, [r4]
	ldrsb r0, [r4, #8]
	bl GetSimpleMenuResult__0202AEA4
	subs r0, r0, #1
	bmi _0204526C
	str r0, [r4, #0x6e8]
	add r0, r5, r0
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	moveq r0, #2
	streq r0, [r4, #0x724]
	movne r0, #1
	strne r0, [r4, #0x724]
	b _02045290
_0204526C:
	mov r0, #1
	str r0, [r4, #0x724]
	b _02045290
_02045278:
	ldrsb r0, [r4, #8]
	bl GetWindowIdSelectedItemOnPage
	str r0, [r4, #0x6e8]
	b _02045290
_02045288:
	ldr r0, [r4, #0x724]
	ldmia sp!, {r3, r4, r5, pc}
_02045290:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020451D8

	arm_func_start sub_02045298
sub_02045298: ; 0x02045298
	ldr r0, [r0, #0x60c]
	bx lr
	arm_func_end sub_02045298

	arm_func_start sub_020452A0
sub_020452A0: ; 0x020452A0
	ldr ip, _020452B4 ; =sub_02045360
	add r2, r0, #0x20c
	ldr r1, [r0, #0x6e8]
	add r0, r2, #0x400
	bx ip
	.align 2, 0
_020452B4: .word sub_02045360
	arm_func_end sub_020452A0

	arm_func_start sub_020452B8
sub_020452B8: ; 0x020452B8
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldrnesb r0, [r4, #8]
	mvnne r1, #1
	cmpne r0, r1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl sub_0202AAE8
	cmp r0, #0
	ldrsb r0, [r4, #8]
	beq _02045310
	bl sub_020282F4
	add r0, r0, #5
	cmp r0, #1
	movhi r0, #0
	bhi _02045320
	ldrsb r0, [r4, #8]
	bl CloseParentMenu
	mvn r0, #1
	strb r0, [r4, #8]
	mov r0, #1
	b _02045320
_02045310:
	bl CloseParentMenu
	mvn r0, #1
	strb r0, [r4, #8]
	mov r0, #1
_02045320:
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020452B8

	arm_func_start sub_02045330
sub_02045330: ; 0x02045330
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
	arm_func_end sub_02045330

	arm_func_start sub_0204533C
sub_0204533C: ; 0x0204533C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0204533C

	arm_func_start sub_02045360
sub_02045360: ; 0x02045360
	stmdb sp!, {r4, lr}
	add r1, r0, r1, lsl #2
	ldr r4, [r1, #8]
	mvn r1, #0
	cmp r4, r1
	moveq r0, r1
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0]
	cmp r0, #0
	bne _020453C8
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	ldrb r0, [r0]
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _020453C0
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _020453EC
_020453C0:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_020453C8:
	ldr r0, _020453F4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl sub_0204533C
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
_020453EC:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020453F4: .word DUNGEON_PTR
	arm_func_end sub_02045360

	arm_func_start InitUnkStorageStruct0x410
InitUnkStorageStruct0x410: ; 0x020453F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020454DC ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	bne _02045428
	mov r0, #0x410
	mov r1, #8
	bl MemAlloc
	ldr r1, _020454DC ; =UNK_STORAGE_STRUCT_0X410_PTR
	str r0, [r1]
_02045428:
	bl AllocStorageSelectedItemTable
	bl sub_020440DC
	ldr r1, _020454DC ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r2, #0
	ldr r0, [r1]
	strb r4, [r0, #0x386]
	ldr r0, [r1]
	add r0, r0, #0x300
	strh r2, [r0, #0x88]
	ldr r0, [r1]
	str r2, [r0, #0x38c]
	ldr r0, [r1]
	add r0, r0, #0x1c
	bl InitPreprocessorArgs
	ldr r1, _020454DC ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #2
	str r0, [r2, #0x68]
	ldr r2, [r1]
	cmp r4, #0
	str r0, [r2, #0x1c]
	ldr r2, [r1]
	str r0, [r2, #0x18]
	ldr r2, [r1]
	strb r3, [r2, #0x14]
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r2, [r1]
	strb r3, [r2, #0x15]
	ldr r2, [r1]
	strb r3, [r2, #0x17]
	ldr r3, [r1]
	ldrh r2, [r5]
	add r1, r3, #0x300
	strh r2, [r1, #0x80]
	ldrh r2, [r5, #2]
	strh r2, [r1, #0x82]
	ldrh r2, [r5, #4]
	strh r2, [r1, #0x84]
	str r0, [r3, #0x6c]
	moveq r0, #0x13
	bl sub_020454E0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020454DC: .word UNK_STORAGE_STRUCT_0X410_PTR
	arm_func_end InitUnkStorageStruct0x410

	arm_func_start sub_020454E0
sub_020454E0: ; 0x020454E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x194
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r4, [r1]
	ldr r0, [r4, #4]
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _02045A14
_02045508: ; jump table
	b _02045558 ; case 0
	b _02045584 ; case 1
	b _020455CC ; case 2
	b _02045A14 ; case 3
	b _02045A14 ; case 4
	b _02045A14 ; case 5
	b _020458C0 ; case 6
	b _02045914 ; case 7
	b _02045844 ; case 8
	b _02045948 ; case 9
	b _02045984 ; case 10
	b _020459C0 ; case 11
	b _02045A14 ; case 12
	b _02045A14 ; case 13
	b _02045958 ; case 14
	b _02045798 ; case 15
	b _02045688 ; case 16
	b _02045764 ; case 17
	b _02045A14 ; case 18
	b _020459E0 ; case 19
_02045558:
	mov r0, #2
	str r0, [r4, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045A20 ; =0x000002CD
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045584:
	mov r0, #2
	str r0, [r4, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _02045A24 ; =0x000002D5
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_020455CC:
	ldr r1, _02045A28 ; =0x000002CE
	add r0, r4, #0x70
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x14
	str r1, [r4, #0x170]
	bl InitPreprocessorArgs
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045A2C ; =_0209CC0C
	ldr r1, [r0]
	add r0, r1, #0x390
	add r1, r1, #0x380
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045A30 ; =0x000002CF
	ldr r5, [r0]
	add ip, sp, #0x14
	add r3, r5, #0x300
	ldrsh lr, [r3, #0x84]
	add r0, r4, #0x174
	mov r1, #0x100
	orr lr, lr, #0x10000
	str lr, [sp, #0x24]
	ldrh lr, [r3, #0x82]
	mov r3, #0
	str lr, [sp, #0x38]
	ldrb lr, [r5, #0x380]
	str lr, [sp, #0x3c]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r1, #3
	str r1, [r4, #0x274]
	mov r2, #0
	strb r2, [r4, #0x278]
	mov r0, #1
	str r0, [r4, #0x378]
	str r1, [sp]
	ldr r3, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, _02045A34 ; =_0209CC38
	ldr r3, [r3]
	ldr r1, _02045A38 ; =0x00300011
	add r3, r3, #0x70
	bl CreateSimpleMenu
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045688:
	mov r0, #0x11
	str r0, [r4, #8]
	ldr r0, [r1]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r1, [r2]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	strh r0, [sp, #0x10]
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r3, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045A2C ; =_0209CC0C
	ldr r4, [r3]
	add r1, sp, #0xc
	str r0, [r4, #0x38c]
	ldr r0, [r3]
	mov r3, #0
	ldr r4, [r0, #0x38c]
	add r0, r0, #0x390
	strh r4, [sp, #0xe]
	strb r3, [sp, #0xc]
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, [r0]
	add r1, r2, #0x390
	str r1, [r2, #0x54]
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r1, #0x2c]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r4, #0x11
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02045D9C ; =0x00002FC5
	str r4, [r3, #8]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #8]
	ldr r3, [r0]
	add r2, r4, #0x2c0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045764:
	mov r4, #3
	str r4, [sp, #0x64]
	mov r4, #2
	ldr r0, _02045A34 ; =_0209CC38
	ldr r1, _02045A3C ; =0x00300033
	ldr r3, _02045A40 ; =_0209CC48
	add r2, sp, #0x64
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045798:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r4, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, _02045A44 ; =0x00001013
	ldr r2, [r4]
	ldr r3, _02045A48 ; =0x000008E4
	str r0, [r2, #0x38c]
	ldr lr, [r4]
	ldr r0, _02045A4C ; =_0209CC28
	add r2, lr, #0x300
	ldrsh ip, [r2, #0x88]
	mov r2, #0
	str ip, [lr, #0x2c]
	ldr lr, [r4]
	ldr ip, [lr, #0x38c]
	add ip, ip, #0xbc
	str ip, [lr, #0x34]
	ldr r4, [r4]
	add ip, r4, #0x1c
	add r4, r4, #0x300
	str ip, [sp]
	ldrsh r4, [r4, #0x88]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x17]
	b _02045A14
_02045844:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r2, #3
	ldr r3, [r1]
	str r0, [r3, #0x38c]
	ldr r3, [r1]
	add r0, r3, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r3, #0x2c]
	ldr r0, [r1]
	str r2, [r0, #4]
	bl sub_02045A5C
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010154
	b _02045A14
_020458C0:
	add r0, r4, #0x390
	str r0, [r4, #0x5c]
	ldr r0, [r1]
	mov r1, #7
	str r1, [r0, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r3, #7
	ldr r1, [r0]
	ldr r2, _02045A50 ; =0x000002D6
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045A14
_02045914:
	mov r4, #3
	str r4, [sp, #0xfc]
	mov r4, #2
	ldr r0, _02045A34 ; =_0209CC38
	ldr r1, _02045A3C ; =0x00300033
	ldr r3, _02045A40 ; =_0209CC48
	add r2, sp, #0xfc
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045948:
	mov r0, #4
	str r0, [r4, #4]
	bl sub_02045A5C
	b _02045A14
_02045958:
	ldr r0, _02045A54 ; =_0209CC18
	mov r4, #3
	ldr r3, _02045A58 ; =_0209CC60
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045A14
_02045984:
	ldrsb r0, [r4, #0x14]
	bl CloseDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	bl sub_02043218
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl InitUnkStorageStruct0x18c0
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045A14
_020459C0:
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl InitUnkStorageStruct0x18c0
	ldr r1, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045A14
_020459E0:
	mov r0, #0xa
	str r0, [r4, #8]
	ldr r0, [r1]
	mov r1, #0x12
	str r1, [r0, #4]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045A1C ; =UNK_STORAGE_STRUCT_0X410_PTR
#ifdef JAPAN
	ldr r2, _02045DC0 ; =0x00002FC4
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x2d0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
_02045A14:
	add sp, sp, #0x194
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_020454E0_OFFSET 0x2CF4
#else
#define SUB_020454E0_OFFSET 0
#endif
_02045A1C: .word UNK_STORAGE_STRUCT_0X410_PTR
_02045A20: .word 0x000002CD + SUB_020454E0_OFFSET
_02045A24: .word 0x000002D5 + SUB_020454E0_OFFSET
_02045A28: .word 0x000002CE + SUB_020454E0_OFFSET
_02045A2C: .word _0209CC0C
_02045A30: .word 0x000002CF + SUB_020454E0_OFFSET
_02045A34: .word _0209CC38
_02045A38: .word 0x00300011
#ifdef JAPAN
_02045D9C: .word 0x00002FC5
#endif
_02045A3C: .word 0x00300033
_02045A40: .word _0209CC48
_02045A44: .word 0x00001013
#ifdef JAPAN
_02045A48: .word 0x00001D3C
#else
_02045A48: .word 0x000008E4
#endif
_02045A4C: .word _0209CC28
_02045A50: .word 0x000002D6 + SUB_020454E0_OFFSET
_02045A54: .word _0209CC18
_02045A58: .word _0209CC60
#ifdef JAPAN
_02045DC0: .word 0x00002FC4
#endif
	arm_func_end sub_020454E0

	arm_func_start sub_02045A5C
sub_02045A5C: ; 0x02045A5C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x194
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r4, [r0]
	ldr r1, [r4, #4]
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _02045F88
_02045A7C: ; jump table
	b _02045ACC ; case 0
	b _02045AF8 ; case 1
	b _02045B40 ; case 2
	b _02045F88 ; case 3
	b _02045F88 ; case 4
	b _02045F88 ; case 5
	b _02045E34 ; case 6
	b _02045E88 ; case 7
	b _02045DB8 ; case 8
	b _02045EBC ; case 9
	b _02045EF8 ; case 10
	b _02045F34 ; case 11
	b _02045F88 ; case 12
	b _02045F88 ; case 13
	b _02045ECC ; case 14
	b _02045D0C ; case 15
	b _02045BFC ; case 16
	b _02045CD8 ; case 17
	b _02045F88 ; case 18
	b _02045F54 ; case 19
_02045ACC:
	mov r0, #2
	str r0, [r4, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045F94 ; =0x000002CD
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045AF8:
	mov r0, #2
	str r0, [r4, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _02045F98 ; =0x000002D5
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045B40:
	ldr r1, _02045F9C ; =0x000002CE
	add r0, r4, #0x70
	bl GetStringFromFileVeneer
	mov r1, #2
	add r0, sp, #0x144
	str r1, [r4, #0x170]
	bl InitPreprocessorArgs
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045FA0 ; =_0209CC0C
	ldr r1, [r0]
	add r0, r1, #0x390
	add r1, r1, #0x380
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045FA4 ; =0x000002CF
	ldr r5, [r0]
	add ip, sp, #0x144
	add r3, r5, #0x300
	ldrsh lr, [r3, #0x84]
	add r0, r4, #0x174
	mov r1, #0x100
	orr lr, lr, #0x10000
	str lr, [sp, #0x154]
	ldrh lr, [r3, #0x82]
	mov r3, #0
	str lr, [sp, #0x168]
	ldrb lr, [r5, #0x380]
	str lr, [sp, #0x16c]
	str ip, [sp]
	bl PreprocessStringFromId
	mov r1, #3
	str r1, [r4, #0x274]
	mov r2, #0
	strb r2, [r4, #0x278]
	mov r0, #1
	str r0, [r4, #0x378]
	str r1, [sp]
	ldr r3, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r3, [r3]
	ldr r1, _02045FAC ; =0x00300011
	add r3, r3, #0x70
	bl CreateSimpleMenu
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045BFC:
	mov r1, #0x11
	str r1, [r4, #8]
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r1, [r2]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	strh r0, [sp, #0x10]
	ldr r0, [r1]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r3, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, _02045FA0 ; =_0209CC0C
	ldr r4, [r3]
	add r1, sp, #0xc
	str r0, [r4, #0x38c]
	ldr r0, [r3]
	mov r3, #0
	ldr r4, [r0, #0x38c]
	add r0, r0, #0x390
	strh r4, [sp, #0xe]
	strb r3, [sp, #0xc]
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, [r0]
	add r1, r2, #0x390
	str r1, [r2, #0x54]
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r1, #0x2c]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r4, #0x11
	ldr r3, [r0]
#ifdef JAPAN
	ldr r2, _02046318 ; =0x00002FC5
	str r4, [r3, #8]
	ldr r3, [r0]
	mov r1, #8
#else
	mov r1, #8
	str r4, [r3, #8]
	ldr r3, [r0]
	add r2, r4, #0x2c0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045CD8:
	mov r4, #3
	str r4, [sp, #0xac]
	mov r4, #2
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r1, _02045FB0 ; =0x00300033
	ldr r3, _02045FB4 ; =_0209CC48
	add r2, sp, #0xac
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045D0C:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r4, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, _02045FB8 ; =0x00001013
	ldr r2, [r4]
	ldr r3, _02045FBC ; =0x000008E4
	str r0, [r2, #0x38c]
	ldr lr, [r4]
	ldr r0, _02045FC0 ; =_0209CC28
	add r2, lr, #0x300
	ldrsh ip, [r2, #0x88]
	mov r2, #0
	str ip, [lr, #0x2c]
	ldr lr, [r4]
	ldr ip, [lr, #0x38c]
	add ip, ip, #0xbc
	str ip, [lr, #0x34]
	ldr r4, [r4]
	add ip, r4, #0x1c
	add r4, r4, #0x300
	str ip, [sp]
	ldrsh r4, [r4, #0x88]
#if defined(EUROPE)
	add r4, r4, #0xd3
	add r4, r4, #0x2900
#elif defined(JAPAN)
	add r4, r4, #0xce
	add r4, r4, #0x4100
#else
	add r4, r4, #0xd1
	add r4, r4, #0x2900
#endif
	mov r4, r4, lsl #0x10
	mov r4, r4, lsr #0x10
	stmib sp, {r4, ip}
	bl CreateScrollBoxSingle
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x17]
	b _02045F88
_02045DB8:
	ldr r0, [r4]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r2, #3
	ldr r3, [r1]
	str r0, [r3, #0x38c]
	ldr r3, [r1]
	add r0, r3, #0x300
	ldrsh r0, [r0, #0x88]
	str r0, [r3, #0x2c]
	ldr r0, [r1]
	str r2, [r0, #4]
	bl sub_02045A5C
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010154
	b _02045F88
_02045E34:
	add r1, r4, #0x390
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	mov r1, #7
	str r1, [r0, #8]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r3, #7
	ldr r1, [r0]
	ldr r2, _02045FC4 ; =0x000002D6
	str r3, [r1, #8]
	ldr r3, [r0]
	mov r1, #8
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
	b _02045F88
_02045E88:
	mov r4, #3
	str r4, [sp, #0x14]
	mov r4, #2
	ldr r0, _02045FA8 ; =_0209CC38
	ldr r1, _02045FB0 ; =0x00300033
	ldr r3, _02045FB4 ; =_0209CC48
	add r2, sp, #0x14
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045EBC:
	mov r0, #4
	str r0, [r4, #4]
	bl sub_02045A5C
	b _02045F88
_02045ECC:
	ldr r0, _02045FC8 ; =_0209CC18
	mov r4, #3
	ldr r3, _02045FCC ; =_0209CC60
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	b _02045F88
_02045EF8:
	ldrsb r0, [r4, #0x14]
	bl CloseDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	bl sub_02043218
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl InitUnkStorageStruct0x18c0
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045F88
_02045F34:
	mov r0, #2
	mov r1, #0
	mov r2, #8
	bl InitUnkStorageStruct0x18c0
	ldr r1, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x15]
	b _02045F88
_02045F54:
	mov r1, #0xa
	str r1, [r4, #8]
	ldr r0, [r0]
	mov r1, #0x12
	str r1, [r0, #4]
	bl UnkStorageStruct0x410CreateDialogueBox
	ldr r0, _02045F90 ; =UNK_STORAGE_STRUCT_0X410_PTR
#ifdef JAPAN
	ldr r2, _0204633C ; =0x00002FC4
	ldr r3, [r0]
	mov r1, #0x18
#else
	mov r1, #0x18
	ldr r3, [r0]
	mov r2, #0x2d0
#endif
	ldrsb r0, [r3, #0x14]
	add r3, r3, #0x1c
	bl ShowStringIdInDialogueBox
_02045F88:
	add sp, sp, #0x194
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define SUB_02045A5C_OFFSET 0x2CF4
#else
#define SUB_02045A5C_OFFSET 0
#endif
_02045F90: .word UNK_STORAGE_STRUCT_0X410_PTR
_02045F94: .word 0x000002CD + SUB_02045A5C_OFFSET
_02045F98: .word 0x000002D5 + SUB_02045A5C_OFFSET
_02045F9C: .word 0x000002CE + SUB_02045A5C_OFFSET
_02045FA0: .word _0209CC0C
_02045FA4: .word 0x000002CF + SUB_02045A5C_OFFSET
_02045FA8: .word _0209CC38
_02045FAC: .word 0x00300011
#ifdef JAPAN
_02046318: .word 0x00002FC5
#endif
_02045FB0: .word 0x00300033
_02045FB4: .word _0209CC48
_02045FB8: .word 0x00001013
#ifdef JAPAN
_02045FBC: .word 0x00001D3C
#else
_02045FBC: .word 0x000008E4
#endif
_02045FC0: .word _0209CC28
_02045FC4: .word 0x000002D6 + SUB_02045A5C_OFFSET
_02045FC8: .word _0209CC18
_02045FCC: .word _0209CC60
#ifdef JAPAN
_0204633C: .word 0x00002FC4
#endif
	arm_func_end sub_02045A5C

	arm_func_start sub_02045FD0
sub_02045FD0: ; 0x02045FD0
	stmdb sp!, {r3, lr}
	ldr r2, _02046024 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #4]
	ldmeqia sp!, {r3, pc}
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x88]
	strh r1, [r0, #4]
	ldr r1, [r2]
	ldr r1, [r1, #0x38c]
	strh r1, [r0, #2]
	bl FreeStorageSelectedItemTable
	ldr r0, _02046024 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046024 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046024: .word UNK_STORAGE_STRUCT_0X410_PTR
	arm_func_end sub_02045FD0

	arm_func_start sub_02046028
sub_02046028: ; 0x02046028
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r2, [r0]
	ldr r1, [r2, #0x18]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _020465CC
_02046048: ; jump table
	b _02046058 ; case 0
	b _02046064 ; case 1
	b _02046590 ; case 2
	b _020465C4 ; case 3
_02046058:
	mov r0, #1
	str r0, [r2, #0x18]
	b _020465CC
_02046064:
	ldr r1, [r2, #4]
	cmp r1, #0x12
	addls pc, pc, r1, lsl #2
	b _0204650C
_02046074: ; jump table
	b _0204650C ; case 0
	b _0204650C ; case 1
	b _020460C0 ; case 2
	b _020464B4 ; case 3
	b _020464BC ; case 4
	b _020464C4 ; case 5
	b _0204650C ; case 6
	b _02046168 ; case 7
	b _0204650C ; case 8
	b _0204650C ; case 9
	b _020461BC ; case 10
	b _020461BC ; case 11
	b _02046334 ; case 12
	b _02046364 ; case 13
	b _020463B4 ; case 14
	b _02046478 ; case 15
	b _0204650C ; case 16
	b _02046114 ; case 17
	b _020464CC ; case 18
_020460C0:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _02046104
	cmp r0, #2
	beq _020460F4
	cmp r0, #3
	beq _02046104
	b _0204653C
_020460F4:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #0x13
	bl sub_020454E0
	b _0204653C
_02046104:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #6
	bl sub_020454E0
	b _0204653C
_02046114:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _02046158
	cmp r0, #2
	beq _02046148
	cmp r0, #3
	beq _02046158
	b _0204653C
_02046148:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #8
	bl sub_020454E0
	b _0204653C
_02046158:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #0x13
	bl sub_020454E0
	b _0204653C
_02046168:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #1
	ldrne r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldrne r1, [r1]
	strne r0, [r1, #0x10]
	cmp r0, #1
	beq _020461AC
	cmp r0, #2
	beq _0204619C
	cmp r0, #3
	beq _020461AC
	b _0204653C
_0204619C:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #9
	bl sub_020454E0
	b _0204653C
_020461AC:
	bl UnkStorageStruct0x410CloseSimpleMenu
	mov r0, #0
	bl sub_020454E0
	b _0204653C
_020461BC:
	bl sub_02043468
	mov r4, r0
	bl sub_02043400
	cmp r0, #0
	bne _02046234
	mvn r0, #0
	cmp r4, r0
	bne _02046214
	bl FreeUnkStorageStruct0x18c0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #1
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046214:
	ldr r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1]
	bl sub_0204323C
	mov r0, #0xe
	bl sub_020454E0
	b _0204653C
_02046234:
	bl sub_02043434
	cmp r0, #0
	beq _0204653C
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	beq _020462F4
	mov r0, #0
	bl PlaySeVolumeWrapper
	ldr r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r0, r4
	ldr r1, [r1]
	str r4, [r1]
	bl sub_0204323C
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010044
	ldr r2, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x88]
	ldr r0, [r2]
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02010060
	ldr r1, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	str r0, [r1, #0x38c]
	bl UnkStorageStruct0x410CloseSimpleMenu
	bl FreeUnkStorageStruct0x18c0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0xf
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
_020462F4:
	bl CountNbOfItemsInStorage
	mov r4, r0
	bl sub_0200FD48
	cmp r4, r0
	bge _0204653C
	bl sub_02043398
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r3, #0xa
	ldr r1, [r0]
	mov r2, #5
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xd
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046334:
	mvn r1, #1
	strb r1, [r2, #0x15]
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	sub r1, r2, #1
	str r1, [r3, #0xc]
	cmp r2, #0
	bne _0204653C
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020454E0
	b _0204653C
_02046364:
	ldr r1, [r2, #0xc]
	sub r1, r1, #1
	str r1, [r2, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bgt _02046394
	bl FreeUnkStorageStruct0x18c0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
_02046394:
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bgt _0204653C
	ldr r0, [r1, #8]
	bl sub_020454E0
	b _0204653C
_020463B4:
	ldrsb r0, [r2, #0x16]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0204653C
_020463C8: ; jump table
	b _0204653C ; case 0
	b _0204645C ; case 1
	b _0204653C ; case 2
	b _0204653C ; case 3
	b _020463E4 ; case 4
	b _02046420 ; case 5
	b _0204645C ; case 6
_020463E4:
	bl UnkStorageStruct0x410CloseSimpleMenu
	bl FreeUnkStorageStruct0x18c0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0x10
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_02046420:
	bl UnkStorageStruct0x410CloseSimpleMenu
	bl FreeUnkStorageStruct0x18c0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r3, #2
	strb r2, [r1, #0x15]
	ldr r1, [r0]
	mov r2, #0xf
	str r3, [r1, #0xc]
	ldr r1, [r0]
	mov r0, #0xc
	str r2, [r1, #8]
	bl sub_020454E0
	b _0204653C
_0204645C:
	bl UnkStorageStruct0x410CloseSimpleMenu
	bl sub_020433C0
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #4]
	b _0204653C
_02046478:
	ldrsb r0, [r2, #0x17]
	bl IsScrollBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x17]
	bl CloseScrollBox
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0xb
	strb r2, [r1, #0x17]
	bl sub_020454E0
	b _0204653C
_020464B4:
	mov r2, #2
	b _02046540
_020464BC:
	mov r2, #4
	b _02046540
_020464C4:
	mov r2, #3
	b _02046540
_020464CC:
	ldrsb r0, [r2, #0x14]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mov r2, #0x14
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl sub_0202F2C4
	b _0204653C
_0204650C:
	ldrsb r0, [r2, #0x14]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _0204653C
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl ShowDialogueBox
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl sub_020454E0
_0204653C:
	mov r2, #1
_02046540:
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r0]
	str r2, [r1, #0x6c]
	ldr r2, [r0]
	ldr r1, [r2, #0x6c]
	cmp r1, #1
	beq _020465CC
	mov r1, #2
	str r1, [r2, #0x18]
	ldr r0, [r0]
	sub r1, r1, #4
	ldrsb r0, [r0, #0x14]
	cmp r0, r1
	beq _020465CC
	bl sub_0202836C
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x14]
	bl sub_0202F2C4
	b _020465CC
_02046590:
	mov r1, #3
	str r1, [r2, #0x18]
	ldr r0, [r0]
	sub r1, r1, #5
	ldrsb r0, [r0, #0x14]
	cmp r0, r1
	beq _020465CC
	bl CloseDialogueBox
	ldr r0, _020465D8 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	b _020465CC
_020465C4:
	ldr r0, [r2, #0x6c]
	b _020465D0
_020465CC:
	mov r0, #1
_020465D0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020465D8: .word UNK_STORAGE_STRUCT_0X410_PTR
	arm_func_end sub_02046028

	arm_func_start UnkStorageStruct0x410CloseSimpleMenu
UnkStorageStruct0x410CloseSimpleMenu: ; 0x020465DC
	stmdb sp!, {r3, lr}
	ldr r0, _02046620 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _02046620 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	bl CloseSimpleMenu
	ldr r0, _02046620 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x16]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046620: .word UNK_STORAGE_STRUCT_0X410_PTR
	arm_func_end UnkStorageStruct0x410CloseSimpleMenu

	arm_func_start UnkStorageStruct0x410CreateDialogueBox
UnkStorageStruct0x410CreateDialogueBox: ; 0x02046624
	stmdb sp!, {r3, lr}
	ldr r1, _02046658 ; =UNK_STORAGE_STRUCT_0X410_PTR
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x14]
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02046658 ; =UNK_STORAGE_STRUCT_0X410_PTR
	ldr r1, [r1]
	strb r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046658: .word UNK_STORAGE_STRUCT_0X410_PTR
	arm_func_end UnkStorageStruct0x410CreateDialogueBox

	arm_func_start sub_0204665C
sub_0204665C: ; 0x0204665C
	stmdb sp!, {r3, lr}
	ldr r0, _02046694 ; =_020AFED8
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseAdvancedTextBox
	ldr r0, _02046694 ; =_020AFED8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046694 ; =_020AFED8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046694: .word _020AFED8
	arm_func_end sub_0204665C

	arm_func_start sub_02046698
sub_02046698: ; 0x02046698
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa0
	mov r4, r0
	mov r0, #0xec
	mov r1, #0
	bl MemAlloc
	ldr r2, _0204672C ; =_020AFED8
	mov r1, #0xec
	str r0, [r2]
	bl MemZero
	ldr r0, _0204672C ; =_020AFED8
	mov ip, #0xe
	ldr r0, [r0]
	add lr, r0, #4
_020466D0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _020466D0
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	ldr r1, _02046730 ; =0x00000A43
	mov r0, #0x10
	strh r1, [sp, #0x10]
	str r0, [sp, #0x14]
	mov ip, #0
	str ip, [sp]
	ldr r0, _02046734 ; =_0209CC80
	ldr r1, _02046738 ; =0x00001815
	ldr r3, _0204673C ; =sub_02046798
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _0204672C ; =_020AFED8
	ldr r1, [r1]
	strb r0, [r1]
	add sp, sp, #0xa0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204672C: .word _020AFED8
#ifdef JAPAN
_02046730: .word 0x00000B8A
#else
_02046730: .word 0x00000A43
#endif
_02046734: .word _0209CC80
_02046738: .word 0x00001815
_0204673C: .word sub_02046798
	arm_func_end sub_02046698

	arm_func_start PlayMissionClearBgm
PlayMissionClearBgm: ; 0x02046740
	stmdb sp!, {r3, lr}
	ldr r1, _02046774 ; =_020AFED8
	ldr r0, _02046778 ; =0x00000279
	ldr r1, [r1]
	ldrsh r1, [r1, #0x5e]
	cmp r1, r0
	blt _02046768
	mov r0, #0x14
	bl PlayBgmByIdVeneer
	ldmia sp!, {r3, pc}
_02046768:
	mov r0, #0x13
	bl PlayBgmByIdVeneer
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046774: .word _020AFED8
_02046778: .word 0x00000279
	arm_func_end PlayMissionClearBgm

	arm_func_start sub_0204677C
sub_0204677C: ; 0x0204677C
	ldr r0, _02046790 ; =_020AFED8
	ldr ip, _02046794 ; =IsAdvancedTextBoxActive
	ldr r0, [r0]
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02046790: .word _020AFED8
_02046794: .word IsAdvancedTextBoxActive
	arm_func_end sub_0204677C

	arm_func_start sub_02046798
sub_02046798: ; 0x02046798
	ldr r1, _020467AC ; =_020AFED8
	ldr ip, _020467B0 ; =sub_0200C5DC
	ldr r1, [r1]
	add r1, r1, #4
	bx ip
	.align 2, 0
_020467AC: .word _020AFED8
_020467B0: .word sub_0200C5DC
	arm_func_end sub_02046798

	arm_func_start sub_020467B4
sub_020467B4: ; 0x020467B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	bl IsTouchScreenNotOff
	cmp r0, #0
	moveq r0, #0
	beq _020467E8
	add r0, sp, #0
	bl GetReleasedStylus
	add r0, sp, #0
	mov r2, r4
	mov r1, #2
	bl sub_02006C8C
_020467E8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020467B4

	arm_func_start sub_020467F0
sub_020467F0: ; 0x020467F0
	ldr ip, _020467FC ; =sub_020467B4
	ldr r0, _02046800 ; =_0209CC90
	bx ip
	.align 2, 0
_020467FC: .word sub_020467B4
_02046800: .word _0209CC90
	arm_func_end sub_020467F0

	arm_func_start sub_02046804
sub_02046804: ; 0x02046804
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _02046824 ; =_0209CCA0
	bl InitMenuWithWindowExtraInfo
	cmp r0, #0
	ldrne r0, _02046828 ; =_022AAE64
	strneh r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046824: .word _0209CCA0
_02046828: .word _022AAE64
	arm_func_end sub_02046804

	arm_func_start sub_0204682C
sub_0204682C: ; 0x0204682C
	stmdb sp!, {r3, lr}
	mov r0, #0xa8
	mov r1, #8
	bl MemAlloc
	ldr r1, _02046890 ; =_020AFEDC
	str r0, [r1]
	add r0, r0, #0x10
	bl CopyMenuControlWindowExtraInfo
	ldr r2, _02046890 ; =_020AFEDC
	ldr r1, _02046894 ; =_022AAE64
	ldr r3, [r2]
	str r0, [r3, #0xc]
	ldrh r3, [r1]
	ldr r1, [r2]
	mov r0, #0
	strh r3, [r1, #8]
	bl CreateDialogueBox
	ldr r1, _02046890 ; =_020AFEDC
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r1, [r1]
	mov r0, #1
	str r2, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046890: .word _020AFEDC
_02046894: .word _022AAE64
	arm_func_end sub_0204682C

	arm_func_start sub_02046898
sub_02046898: ; 0x02046898
	stmdb sp!, {r3, lr}
	ldr r0, _020468D0 ; =_020AFEDC
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _020468D0 ; =_020AFEDC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020468D0 ; =_020AFEDC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020468D0: .word _020AFEDC
	arm_func_end sub_02046898

	arm_func_start sub_020468D4
sub_020468D4: ; 0x020468D4
	stmdb sp!, {r3, lr}
	ldr r0, _020469B4 ; =_020AFEDC
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _020469AC
_020468F0: ; jump table
	b _02046900 ; case 0
	b _02046928 ; case 1
	b _0204695C ; case 2
	b _0204697C ; case 3
_02046900:
	ldrsb r0, [r2]
	ldrh r2, [r2, #8]
	ldr r1, _020469B8 ; =0x00000618
	mov r3, #0
	bl ShowStringIdInDialogueBox
	ldr r0, _020469B4 ; =_020AFEDC
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #4]
	b _020469AC
_02046928:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	bne _020469AC
	ldr r0, _020469B4 ; =_020AFEDC
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F334
	ldr r0, _020469B4 ; =_020AFEDC
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #4]
	b _020469AC
_0204695C:
	ldrsb r0, [r2]
	bl IsDialogueBoxActive
	cmp r0, #0
	ldreq r0, _020469B4 ; =_020AFEDC
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #4]
	b _020469AC
_0204697C:
	mov r1, #4
	str r1, [r2, #4]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	tst r0, #0x100
	beq _020469A4
	ldr r0, [r1, #0x98]
	ldr r2, [r1, #0x94]
	mov r1, #0
	blx r2
_020469A4:
	mov r0, #4
	ldmia sp!, {r3, pc}
_020469AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020469B4: .word _020AFEDC
_020469B8: .word 0x00000618
	arm_func_end sub_020468D4

	arm_func_start sub_020469BC
sub_020469BC: ; 0x020469BC
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #8
	bl MemAlloc
	ldr r2, _020469E4 ; =_020AFEE0
	mov r1, #0x2c
	str r0, [r2]
	bl MemZero
	bl sub_020471AC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020469E4: .word _020AFEE0
	arm_func_end sub_020469BC

	arm_func_start sub_020469E8
sub_020469E8: ; 0x020469E8
	stmdb sp!, {r3, lr}
	ldr r0, _02046A1C ; =_020AFEE0
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020471E8
	ldr r0, _02046A1C ; =_020AFEE0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02046A1C ; =_020AFEE0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02046A1C: .word _020AFEE0
	arm_func_end sub_020469E8

	arm_func_start sub_02046A20
sub_02046A20: ; 0x02046A20
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r4, _02046A98 ; =_020AFEE0
	mov r6, r1
	ldr r4, [r4]
	mov r7, r0
	mov r0, r4
	mov r1, #0x2c
	mov r5, r2
	mov r8, r3
	bl MemZero
	ldr r0, [sp, #0x28]
	str r8, [sp]
	ldrh r1, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r1, [sp, #8]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r0, [sp, #0xc]
	add r0, r4, #0x10
	bl sub_02046D50
	mov r0, #1
	str r0, [r4, #0x14]
	str r5, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x28]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02046A98: .word _020AFEE0
	arm_func_end sub_02046A20

	arm_func_start sub_02046A9C
sub_02046A9C: ; 0x02046A9C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xa4
	mov r7, r0
	mov r6, r1
	add r0, sp, #0xc
	mov r1, #0x98
	mov r5, r2
	mov r4, r3
	bl MemZero
	ldrsb r0, [sp, #0xb8]
	add r3, sp, #0xc
	mov r1, r6
	cmp r0, #0
	addge r0, r5, r0, lsl #3
	ldrge r0, [r0, #4]
	mov ip, #0
	movlt r0, #0
	str r0, [sp, #0xc]
	str r5, [sp]
	str r4, [sp, #4]
	mov r0, r7
	mov r2, #0x33
	str ip, [sp, #8]
	bl sub_02046A20
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_02046A9C

	arm_func_start sub_02046B04
sub_02046B04: ; 0x02046B04
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _02046B9C ; =_020AFEE0
	ldr r5, [r0]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _02046B94
	cmp r0, #1
	beq _02046B30
	cmp r0, #9
	beq _02046B64
	b _02046B94
_02046B30:
	ldr r0, [r5, #0x10]
	bl sub_02046F40
	ldr r0, [r5, #0x10]
	bl sub_02047030
	mov r4, r0
	ldr r0, [r5, #0x10]
	bl sub_02047038
	mvn r1, #0
	str r0, [r5, #0x28]
	cmp r4, r1
	movne r0, #9
	strne r0, [r5, #0x14]
	b _02046B94
_02046B64:
	ldr r0, [r5, #0x10]
	bl sub_02047030
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x24]
	tst r0, #0x400000
	bne _02046B8C
	add r0, r5, #0x10
	bl sub_02047040
	mov r0, #0
	str r0, [r5, #0x14]
_02046B8C:
	ldr r0, [r5, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
_02046B94:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02046B9C: .word _020AFEE0
	arm_func_end sub_02046B04

	arm_func_start sub_02046BA0
sub_02046BA0: ; 0x02046BA0
	ldr r0, _02046BB0 ; =_020AFEE0
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_02046BB0: .word _020AFEE0
	arm_func_end sub_02046BA0

	arm_func_start sub_02046BB4
sub_02046BB4: ; 0x02046BB4
	stmdb sp!, {r4, lr}
	ldr r0, _02046BE4 ; =_020AFEE0
	ldr r4, [r0]
	add r0, r4, #0x10
	bl sub_02047040
	mov r1, #0
	ldr r0, _02046BE4 ; =_020AFEE0
	str r1, [r4, #0x14]
	ldr r0, [r0]
	sub r1, r1, #2
	str r1, [r0, #0x20]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046BE4: .word _020AFEE0
	arm_func_end sub_02046BB4

	arm_func_start sub_02046BE8
sub_02046BE8: ; 0x02046BE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02046C2C ; =_020AFEE0
	mov r6, r1
	ldr r4, [r3]
	mov r7, r0
	mov r5, r2
	mov r0, r4
	mov r1, #0x2c
	bl MemZero
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_020472A4
	mov r0, #1
	str r0, [r4, #0x14]
	strh r7, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02046C2C: .word _020AFEE0
	arm_func_end sub_02046BE8

	arm_func_start sub_02046C30
sub_02046C30: ; 0x02046C30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02046C74 ; =_020AFEE0
	mov r6, r1
	ldr r4, [r3]
	mov r7, r0
	mov r5, r2
	mov r0, r4
	mov r1, #0x2c
	bl MemZero
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_02047358
	mov r0, #1
	str r0, [r4, #0x14]
	strh r7, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02046C74: .word _020AFEE0
	arm_func_end sub_02046C30

	arm_func_start sub_02046C78
sub_02046C78: ; 0x02046C78
	stmdb sp!, {r4, lr}
	ldr r0, _02046D1C ; =_020AFEE0
	ldr r4, [r0]
	ldr r0, [r4, #0x14]
	cmp r0, #9
	bgt _02046CB4
	bge _02046CF0
	cmp r0, #1
	bgt _02046D14
	cmp r0, #0
	blt _02046D14
	beq _02046D14
	cmp r0, #1
	beq _02046CC0
	b _02046D14
_02046CB4:
	cmp r0, #0xa
	beq _02046D00
	b _02046D14
_02046CC0:
	bl sub_020473FC
	cmp r0, #2
	bne _02046D14
	ldrh r0, [r4, #0x18]
	tst r0, #0x400
	movne r0, #0xa
	strne r0, [r4, #0x14]
	movne r0, #0x3c
	strne r0, [r4, #0x1c]
	moveq r0, #9
	streq r0, [r4, #0x14]
	b _02046D14
_02046CF0:
	mov r0, #0
	str r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_02046D00:
	ldr r0, [r4, #0x1c]
	subs r0, r0, #1
	str r0, [r4, #0x1c]
	movmi r0, #9
	strmi r0, [r4, #0x14]
_02046D14:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02046D1C: .word _020AFEE0
	arm_func_end sub_02046C78

	arm_func_start sub_02046D20
sub_02046D20: ; 0x02046D20
	ldr ip, _02046D28 ; =sub_020473A4
	bx ip
	.align 2, 0
_02046D28: .word sub_020473A4
	arm_func_end sub_02046D20

	arm_func_start sub_02046D2C
sub_02046D2C: ; 0x02046D2C
	ldr r1, _02046D40 ; =_020AFEE0
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_02046D40: .word _020AFEE0
	arm_func_end sub_02046D2C

	arm_func_start sub_02046D44
sub_02046D44: ; 0x02046D44
	ldr ip, _02046D4C ; =sub_020474B8
	bx ip
	.align 2, 0
_02046D4C: .word sub_020474B8
	arm_func_end sub_02046D44

	arm_func_start sub_02046D50
sub_02046D50: ; 0x02046D50
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x410
	mov r4, r0
	mov r5, r1
	mov r0, #0xcc
	mov r1, #8
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x434]
	bl MemAlloc
	mov r1, #0xcc
	mov r6, r0
	str r0, [r4]
	bl MemZero
	cmp r5, #0
	bne _02046E48
	mov r5, #0
	sub r0, r5, #1
	str r5, [sp]
	strb r0, [sp, #9]
	cmp r7, #0
	beq _02046E54
	mov r4, r5
	add sl, sp, #0x10
	b _02046DE0
_02046DB4:
	mov r0, r4, lsl #3
	ldrh r1, [r7, r0]
	cmp r1, #0
	beq _02046DE8
	mov r0, sl
	bl GetStringFromFileVeneer
	mov r0, sl
	bl sub_020265A8
	cmp r0, r5
	movgt r5, r0
	add r4, r4, #1
_02046DE0:
	cmp r4, #0x64
	blt _02046DB4
_02046DE8:
	mov r0, #0xe
	mul r1, r4, r0
	add r3, r5, #7
	mov r0, r3, asr #2
	add r2, r1, #7
	add r0, r3, r0, lsr #29
	mov r0, r0, asr #3
	add r3, r0, #2
	mov r1, r2, asr #2
	add r0, r2, r1, lsr #29
	mov r5, r0, asr #3
	rsb r4, r3, #0x1e
	rsb r2, r5, #0xf
	mov r1, #0
	strb r4, [sp, #4]
	add r0, sp, #0
	strb r5, [sp, #7]
	add r4, r6, #4
	strb r2, [sp, #5]
	strb r3, [sp, #6]
	str r1, [sp, #0xc]
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	b _02046E54
_02046E48:
	add r4, r6, #4
	ldmia r5, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
_02046E54:
	add r0, sp, #0x420
	ldrh r1, [r0, #0x18]
	ldr ip, [sp, #0x430]
	ldr r0, [sp, #0x43c]
	strh r1, [r6, #0x20]
	strh sb, [r6, #0x22]
	str r0, [r6, #0x24]
	str r7, [r6, #0x1c]
	mvn r0, #0
	str r0, [r6, #0x14]
	str r8, [r6, #0x28]
	mov r0, #0
	str r0, [r6, #0x18]
	cmp ip, #0
	streqb r0, [r6, #0xc4]
	beq _02046EBC
	add r5, r6, #0x2c
	mov r4, #9
_02046E9C:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02046E9C
	ldmia ip, {r0, r1}
	stmia r5, {r0, r1}
	mov r0, #1
	strb r0, [r6, #0xc4]
_02046EBC:
	mvn r0, #1
	strb r0, [r6]
	ldrh r0, [r6, #0x20]
	cmp r0, #0
	moveq r0, #0
	beq _02046EF8
	bl sub_020473FC
	cmp r0, #1
	bne _02046EE4
	bl sub_02047220
_02046EE4:
	ldrh r0, [r6, #0x22]
	ldrh r1, [r6, #0x20]
	ldr r2, [r6, #0x24]
	bl sub_02047244
	mov r0, #1
_02046EF8:
	cmp r0, #0
	bne _02046F2C
	ldrb r0, [r6, #0xc4]
	ldr r1, [r6, #0x28]
	ldr r3, [r6, #0x1c]
	cmp r0, #0
	addne r2, r6, #0x2c
	moveq r2, #0
	add r0, r6, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r6]
	mov r0, #1
	b _02046F30
_02046F2C:
	mov r0, #6
_02046F30:
	str r0, [r6, #0xc8]
	mov r0, #1
	add sp, sp, #0x410
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02046D50

	arm_func_start sub_02046F40
sub_02046F40: ; 0x02046F40
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #0xc8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_02046F58: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _02046FBC ; case 1
	ldmia sp!, {r3, r4, r5, pc} ; case 2
	ldmia sp!, {r3, r4, r5, pc} ; case 3
	ldmia sp!, {r3, r4, r5, pc} ; case 4
	ldmia sp!, {r3, r4, r5, pc} ; case 5
	b _02046F80 ; case 6
	ldmia sp!, {r3, r4, r5, pc} ; case 7
	ldmia sp!, {r3, r4, r5, pc} ; case 8
	b _02047024 ; case 9
_02046F80:
	bl sub_020473FC
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc4]
	ldr r1, [r4, #0x28]
	ldr r3, [r4, #0x1c]
	cmp r0, #0
	addne r2, r4, #0x2c
	moveq r2, #0
	add r0, r4, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r4]
	mov r0, #1
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02046FBC:
	ldrsb r0, [r4]
	bl sub_020282F4
	mov r5, r0
	ldrsb r0, [r4]
	bl GetWindowIdSelectedItemOnPage
	str r0, [r4, #0x18]
	ldrsb r0, [r4]
	bl IsParentMenuActive
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mvn r1, #3
	cmp r5, r1
	bne _02047008
	ldrsb r0, [r4]
	bl GetSimpleMenuResult__0202AEA4
	str r0, [r4, #0x14]
	mov r0, #9
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02047008:
	sub r0, r1, #1
	cmp r5, r0
	addeq r0, r1, #2
	streq r0, [r4, #0x14]
	moveq r0, #9
	streq r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
_02047024:
	mov r0, #0xa
	str r0, [r4, #0xc8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02046F40

	arm_func_start sub_02047030
sub_02047030: ; 0x02047030
	ldr r0, [r0, #0x14]
	bx lr
	arm_func_end sub_02047030

	arm_func_start sub_02047038
sub_02047038: ; 0x02047038
	ldr r0, [r0, #0x18]
	bx lr
	arm_func_end sub_02047038

	arm_func_start sub_02047040
sub_02047040: ; 0x02047040
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r4]
	mvn r1, #1
	cmp r0, r1
	beq _02047068
	bl CloseParentMenu
_02047068:
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02047040

	arm_func_start sub_0204707C
sub_0204707C: ; 0x0204707C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #0xc
	mov r1, #8
	mov r5, r2
	bl MemAlloc
	mov r1, #0xc
	mov r4, r0
	str r0, [r7]
	bl MemZero
	mov r0, r6
	mov r1, r5
	bl CreateTextBox
	strb r0, [r4]
	mov r0, #3
	str r0, [r4, #8]
	sub r0, r0, #4
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0204707C

	arm_func_start sub_020470D0
sub_020470D0: ; 0x020470D0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020470FC
	cmp r0, #3
	beq _02047108
	cmp r0, #4
	moveq r0, #8
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
_020470FC:
	mov r0, #3
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
_02047108:
	ldrsb r0, [r4]
	bl sub_020282F4
	mvn r2, #3
	cmp r0, r2
	addeq r0, r2, #1
	streq r0, [r4, #4]
	moveq r0, #4
	streq r0, [r4, #8]
	ldmeqia sp!, {r4, pc}
	sub r1, r2, #1
	cmp r0, r1
	addeq r0, r2, #2
	streq r0, [r4, #4]
	moveq r0, #4
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020470D0

	arm_func_start sub_02047148
sub_02047148: ; 0x02047148
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_02047148

	arm_func_start sub_02047150
sub_02047150: ; 0x02047150
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r4]
	bl sub_0202812C
	ldrsb r0, [r4]
	bl CloseTextBox2
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02047150

	arm_func_start sub_02047188
sub_02047188: ; 0x02047188
	stmdb sp!, {r4, lr}
	ldr r4, [r0]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldrsb r0, [r4]
	bl sub_02027B1C
	ldrsb r0, [r4]
	bl IsTextboxState3
	ldmia sp!, {r4, pc}
	arm_func_end sub_02047188

	arm_func_start sub_020471AC
sub_020471AC: ; 0x020471AC
	stmdb sp!, {r3, lr}
	mov r0, #0x70
	mov r1, #8
	bl MemAlloc
	ldr r2, _020471E4 ; =_020AFEE4
	mov r1, #0x70
	str r0, [r2]
	bl MemZero
	ldr r0, _020471E4 ; =_020AFEE4
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020471E4: .word _020AFEE4
	arm_func_end sub_020471AC

	arm_func_start sub_020471E8
sub_020471E8: ; 0x020471E8
	stmdb sp!, {r3, lr}
	ldr r0, _0204721C ; =_020AFEE4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020473A4
	ldr r0, _0204721C ; =_020AFEE4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204721C ; =_020AFEE4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204721C: .word _020AFEE4
	arm_func_end sub_020471E8

	arm_func_start sub_02047220
sub_02047220: ; 0x02047220
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _02047240 ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047240: .word _020AFEE4
	arm_func_end sub_02047220

	arm_func_start sub_02047244
sub_02047244: ; 0x02047244
	stmdb sp!, {r4, lr}
	ldr r3, _020472A0 ; =_020AFEE4
	mov r4, r2
	ldr r2, [r3]
	strh r1, [r2, #0x14]
	ldr r1, [r3]
	strh r0, [r1, #0x68]
	ldr r0, [r3]
	ldrsb r0, [r0]
	bl sub_020288DC
	ldr r0, _020472A0 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _020472A0 ; =_020AFEE4
	mov r3, r4
	ldr r2, [r0]
	ldrsb r0, [r2]
	ldrh r1, [r2, #0x68]
	ldrh r2, [r2, #0x14]
	bl ShowStringIdInDialogueBox
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020472A0: .word _020AFEE4
	arm_func_end sub_02047244

	arm_func_start sub_020472A4
sub_020472A4: ; 0x020472A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020473FC
	cmp r0, #1
	bne _020472D4
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _020472EC ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
_020472D4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_02047244
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020472EC: .word _020AFEE4
	arm_func_end sub_020472A4

	arm_func_start sub_020472F0
sub_020472F0: ; 0x020472F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02047354 ; =_020AFEE4
	mov ip, #0
	ldr r4, [r3]
	mov r5, r1
	strh ip, [r4, #0x14]
	ldr r1, [r3]
	mov r4, r2
	strh r0, [r1, #0x68]
	ldr r0, [r3]
	ldrsb r0, [r0]
	bl sub_020288DC
	ldr r0, _02047354 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _02047354 ; =_020AFEE4
	mov r2, r5
	ldr r1, [r0]
	mov r3, r4
	ldrsb r0, [r1]
	ldrh r1, [r1, #0x68]
	bl ShowStringInDialogueBox
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02047354: .word _020AFEE4
	arm_func_end sub_020472F0

	arm_func_start sub_02047358
sub_02047358: ; 0x02047358
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020473FC
	cmp r0, #1
	bne _02047388
	mov r0, #0
	bl CreateDialogueBox
	ldr r1, _020473A0 ; =_020AFEE4
	ldr r1, [r1]
	strb r0, [r1]
_02047388:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_020472F0
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020473A0: .word _020AFEE4
	arm_func_end sub_02047358

	arm_func_start sub_020473A4
sub_020473A4: ; 0x020473A4
	stmdb sp!, {r3, lr}
	ldr r0, _020473F8 ; =_020AFEE4
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _020473F8 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F2C4
	ldr r0, _020473F8 ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _020473F8 ; =_020AFEE4
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020473F8: .word _020AFEE4
	arm_func_end sub_020473A4

	arm_func_start sub_020473FC
sub_020473FC: ; 0x020473FC
	stmdb sp!, {r4, lr}
	ldr r0, _0204749C ; =_020AFEE4
	mov r4, #0
	ldr r0, [r0]
	sub r1, r4, #2
	ldrsb r0, [r0]
	cmp r0, r1
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #4
	bne _02047440
	ldr r0, _0204749C ; =_020AFEE4
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202F16C
_02047440:
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02047494
_0204744C: ; jump table
	b _02047494 ; case 0
	b _02047490 ; case 1
	b _02047494 ; case 2
	b _02047494 ; case 3
	b _02047488 ; case 4
	b _02047494 ; case 5
	b _02047494 ; case 6
	b _02047494 ; case 7
	b _02047478 ; case 8
	b _02047478 ; case 9
	b _02047480 ; case 10
_02047478:
	mov r4, #4
	b _02047494
_02047480:
	mov r4, #5
	b _02047494
_02047488:
	mov r4, #3
	b _02047494
_02047490:
	mov r4, #2
_02047494:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0204749C: .word _020AFEE4
	arm_func_end sub_020473FC

	arm_func_start sub_020474A0
sub_020474A0: ; 0x020474A0
	ldr r1, _020474B4 ; =_020AFEE4
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_020474B4: .word _020AFEE4
	arm_func_end sub_020474A0

	arm_func_start sub_020474B8
sub_020474B8: ; 0x020474B8
	ldr r2, _020474D8 ; =_020AFEE4
	mov r3, r0
	ldr r0, [r2]
	ldr ip, _020474DC ; =ReadStringFromDialogueBox
	mov r2, r1
	ldrsb r0, [r0]
	mov r1, r3
	bx ip
	.align 2, 0
_020474D8: .word _020AFEE4
_020474DC: .word ReadStringFromDialogueBox
	arm_func_end sub_020474B8

	arm_func_start sub_020474E0
sub_020474E0: ; 0x020474E0
	stmdb sp!, {r3, lr}
	ldr r0, _02047574 ; =_022AAE68
	ldr r2, [r0]
	cmp r2, #0
	beq _0204756C
	ldr r1, [r2, #0x10]
	cmp r1, #2
	bgt _02047520
	cmp r1, #0
	blt _0204756C
	beq _02047528
	cmp r1, #1
	beq _02047534
	cmp r1, #2
	beq _02047554
	b _0204756C
_02047520:
	cmp r1, #0xff
	b _0204756C
_02047528:
	add r0, r1, #1
	str r0, [r2, #0x10]
	b _0204756C
_02047534:
	mov r0, #0
	bl sub_02047C40
	cmp r0, #0
	ldrne r0, _02047574 ; =_022AAE68
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x10]
	b _0204756C
_02047554:
	mov r1, #1
	str r1, [r0, #4]
	mov r0, #0xff
	str r0, [r2, #0x10]
	mov r0, #4
	ldmia sp!, {r3, pc}
_0204756C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047574: .word _022AAE68
	arm_func_end sub_020474E0

	arm_func_start sub_02047578
sub_02047578: ; 0x02047578
	stmdb sp!, {r3, lr}
	ldr r0, _020475B0 ; =_022AAE68
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl sub_02047EF4
	ldr r0, _020475B0 ; =_022AAE68
	ldr r0, [r0]
	bl MemFree
	ldr r0, _020475B0 ; =_022AAE68
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020475B0: .word _022AAE68
	arm_func_end sub_02047578

	arm_func_start sub_020475B4
sub_020475B4: ; 0x020475B4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r3, _02047658 ; =_022AAE68
	mov ip, #0
	ldr r0, _0204765C ; =_0209CCB0
	mov r5, r1
	mov r4, r2
	str ip, [r3, #4]
	bl InitMenu
	cmp r0, #0
	beq _02047650
	mov r0, #0x14
	mov r1, #8
	bl MemAlloc
	ldr r2, _02047658 ; =_022AAE68
	mov r1, #0x14
	str r0, [r2]
	bl MemZero
	ldr r2, _02047658 ; =_022AAE68
	mov r1, #0
	str r1, [r2, #4]
	ldr r3, [r2]
	mov r0, r5
	str r6, [r3, #4]
	ldr r3, [r2]
	strh r1, [r3, #0xa]
	ldr r2, [r2]
	strh r5, [r2, #0xc]
	bl sub_02047760
	ldr r0, _02047658 ; =_022AAE68
	mov r2, #0
	ldr r5, [r0]
	mov r1, r4
	str r2, [sp]
	ldrsh r3, [r5, #0xc]
	ldr r0, [r5, #4]
	add r2, r5, #0xa
	bl sub_02047F38
_02047650:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02047658: .word _022AAE68
_0204765C: .word _0209CCB0
	arm_func_end sub_020475B4

	arm_func_start sub_02047660
sub_02047660: ; 0x02047660
	ldr r0, _0204766C ; =_022AAE68
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0204766C: .word _022AAE68
	arm_func_end sub_02047660

	arm_func_start sub_02047670
sub_02047670: ; 0x02047670
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #0x60
	mov r1, #8
	bl MemAlloc
	ldr r2, _020476E8 ; =_020AFEE8
	mov r1, #0x60
	str r0, [r2]
	bl MemZero
	ldr r0, _020476E8 ; =_020AFEE8
	ldr r0, [r0]
	bl InitPreprocessorArgs
	ldr r1, _020476E8 ; =_020AFEE8
	mov r0, r4
	ldr r2, [r1]
	mov r3, #0
	mov r1, #1
	str r3, [r2, #0x4c]
	bl sub_02047760
	ldr r1, _020476E8 ; =_020AFEE8
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	strh r3, [r2, #0x58]
	ldr r2, [r1]
	strh r4, [r2, #0x56]
	ldr r1, [r1]
	str r5, [r1, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020476E8: .word _020AFEE8
	arm_func_end sub_02047670

	arm_func_start sub_020476EC
sub_020476EC: ; 0x020476EC
	stmdb sp!, {r3, lr}
	ldr r1, _02047718 ; =_020AFEE8
	mov r2, #1
	ldr ip, [r1]
	mov r1, r0
	str r2, [sp]
	ldrsh r3, [ip, #0x56]
	ldr r0, [ip, #0x50]
	add r2, ip, #0x58
	bl sub_02047F38
	ldmia sp!, {r3, pc}
	.align 2, 0
_02047718: .word _020AFEE8
	arm_func_end sub_020476EC

	arm_func_start sub_0204771C
sub_0204771C: ; 0x0204771C
	stmdb sp!, {r3, lr}
	ldr r0, _0204775C ; =_020AFEE8
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	bl sub_02047EF4
	ldr r0, _0204775C ; =_020AFEE8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0204775C ; =_020AFEE8
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0204775C: .word _020AFEE8
	arm_func_end sub_0204771C

	arm_func_start sub_02047760
sub_02047760: ; 0x02047760
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r2, _02047920 ; =_020AFEEC
	mov r5, r1
	ldr r1, [r2, r5, lsl #2]
	mov r6, r0
	cmp r1, #0
	movne r0, #0
	bne _02047918
	ldr r0, _02047924 ; =0x00002020
	mov r1, #8
	bl MemAlloc
	ldr r1, _02047924 ; =0x00002020
	mov r4, r0
	bl MemZero
	cmp r5, #0
	bne _02047850
	ldr r0, _02047928 ; =_0209CCC0
	add lr, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov ip, #0
	add r2, r4, #0x384
	str ip, [sp, #8]
	str r4, [sp, #0x14]
	strb ip, [sp, #0x10]
	add r0, r4, #0x1000
#ifdef JAPAN
	mov r1, #0x10
	str r1, [r0, #0xf90]
	add r0, r4, #0x1f00
	mov r1, #0x1540
#else
	mov r3, #0x10
	str r3, [r0, #0xf90]
	ldr r1, _0204792C ; =0x00000A44
	add r0, r4, #0x1f00
#endif
	strh r1, [r0, #0x8c]
	str ip, [sp]
	ldr r1, _02047930 ; =0x0040180A
	ldr r3, _02047934 ; =sub_02047AB4
	mov r0, lr
	add r2, r2, #0x1c00
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	add r1, r4, #0x100
	strb r0, [r4, #0x120]
	ldrsb r0, [r1, #0x20]
	mov r1, #1
	bl SetAdvancedTextBoxPartialMenu
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #1
	bl sub_02030AAC
	add r0, r4, #0x1f00
	mov r1, #0x14
	strh r1, [r0, #0x80]
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
	b _020478A0
_02047850:
	ldr r0, _02047938 ; =_0209CCD0
	add ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r1, #0
	mov r0, #1
	add r2, r4, #0x384
	strb r0, [sp, #0x10]
	str r1, [sp, #8]
	str r4, [sp, #0x14]
	str r1, [sp]
	ldr r3, _02047934 ; =sub_02047AB4
	mov r0, ip
	add r2, r2, #0x1c00
	str r1, [sp, #4]
	bl CreateAdvancedTextBox
	strb r0, [r4, #0x120]
	add r0, r4, #0x1f00
	mov r1, #8
	strh r1, [r0, #0x80]
_020478A0:
	add r0, r4, #0x1000
	strb r5, [r0, #0xf7c]
	add r0, r4, #0x100
	ldrsb r1, [r0, #0x20]
	mov r0, r4
	bl sub_02025E84
	mov ip, #0
	str ip, [r4, #0x11c]
	add r2, r4, #0x1f00
	strh r6, [r2, #0x72]
	strb ip, [r4, #0x128]
	ldrb r1, [sp, #0xe]
	mov r3, #0x3c
	add r0, r4, #0x2000
	mov r1, r1, lsl #3
	strh r1, [r2, #0x78]
	strb ip, [r0, #0x1c]
	add r0, r4, #0x1000
	mov r1, #0x80
	str r1, [r0, #0xf6c]
	add r0, r4, #0x12c
	add r1, r3, #0x1e00
	strh r3, [r2, #0x68]
	bl MemZero
	add r0, r4, #0x1000
	mov r2, #0
	ldr r1, _02047920 ; =_020AFEEC
	strb r2, [r0, #0xf82]
	str r4, [r1, r5, lsl #2]
	mov r0, #1
_02047918:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02047920: .word _020AFEEC
_02047924: .word 0x00002020
_02047928: .word _0209CCC0
#ifndef JAPAN
_0204792C: .word 0x00000A44
#endif
_02047930: .word 0x0040180A
_02047934: .word sub_02047AB4
_02047938: .word _0209CCD0
	arm_func_end sub_02047760

	arm_func_start sub_0204793C
sub_0204793C: ; 0x0204793C
	ldr r1, _0204795C ; =_020AFEEC
	mov r2, #0
	ldr r3, [r1, r0, lsl #2]
	mov r1, #1
	add r0, r3, #0x1f00
	strh r2, [r0, #0x70]
	strb r1, [r3, #0x128]
	bx lr
	.align 2, 0
_0204795C: .word _020AFEEC
	arm_func_end sub_0204793C

	arm_func_start sub_02047960
sub_02047960: ; 0x02047960
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02047A0C ; =_020AFEEC
	mov r5, r0
	ldr r4, [r1, r5, lsl #2]
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	cmp r1, #0
	addle r0, r4, #0x2000
	movle r1, #1
	strleb r1, [r0, #0x1c]
	movle r2, #0
	ble _020479B0
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	movs r2, r0, asr #0x10
	addmi r0, r4, #0x2000
	movmi r1, #1
	strmib r1, [r0, #0x1c]
	movmi r2, #0
_020479B0:
	add r0, r4, #0x1f00
	strh r2, [r0, #0x74]
	mov r1, #0
	strb r1, [r4, #0x128]
	strh r2, [r0, #0x7e]
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	bl SetAdvancedTextBoxField0x1C2
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x2000
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	add r0, r4, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02047A0C: .word _020AFEEC
	arm_func_end sub_02047960

	arm_func_start sub_02047A10
sub_02047A10: ; 0x02047A10
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _02047AB0 ; =_020AFEEC
	mov r6, r0
	ldr r4, [r4, r3, lsl #2]
	mov r5, r2
	ldrb r0, [r4, #0x128]
	cmp r0, #0
	beq _02047AA8
	add r0, r4, #0x1f00
	ldrsh r3, [r0, #0x70]
	ldrsh r2, [r0, #0x68]
	cmp r3, r2
	bge _02047AA8
	add r2, r3, r3, lsl #7
	add r2, r4, r2
	strb r1, [r2, #0x1ac]
	ldrsh r0, [r0, #0x70]
	add r2, r4, #0x12c
	mov r1, r6
	add r0, r0, r0, lsl #7
	add r0, r2, r0
	bl strcpy
	str r5, [sp]
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	add r0, r4, #0x1000
	add r5, r4, #0x12c
	add r3, r1, r1, lsl #7
	ldr r1, [r0, #0xf6c]
	mov r2, r6
	add r0, r5, r3
	mov r3, #0x400
	bl PreprocessString
	add r0, r4, #0x1f00
	ldrsh r1, [r0, #0x70]
	add r1, r1, #1
	strh r1, [r0, #0x70]
_02047AA8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02047AB0: .word _020AFEEC
	arm_func_end sub_02047A10

	arm_func_start sub_02047AB4
sub_02047AB4: ; 0x02047AB4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	bl sub_02028324
	cmp r0, #0
	moveq r1, #0
	beq _02047ADC
	cmp r0, #1
	moveq r1, #1
	bne _02047C34
_02047ADC:
	ldr r0, _02047C3C ; =_020AFEEC
	ldr r5, [r0, r1, lsl #2]
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl sub_02027B1C
	ldr r0, [r5, #0x11c]
	cmp r0, #2
	beq _02047B0C
	mov r0, r5
	bl sub_0202613C
	mov r0, #1
	str r0, [r5, #0x11c]
_02047B0C:
	add r4, r5, #0x1f00
	ldrsh r0, [r4, #0x70]
	ldrsh r7, [r4, #0x7e]
	cmp r7, r0
	bge _02047C34
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #4]
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r8, r1, asr #0x10
	mov r1, r2, asr #0x10
	str r1, [sp, #4]
	mov r6, #0
	add fp, r5, #0x12c
	b _02047BBC
_02047B48:
	add sb, r7, r7, lsl #7
	add r0, r5, sb
	ldrb r0, [r0, #0x1ac]
	cmp r0, #0
	beq _02047B80
	mov r0, #0x17
	str r0, [sp]
	ldrsh r1, [r4, #0x80]
	ldrsh r3, [r4, #0x78]
	mov r0, sl
	mla r1, r6, r8, r1
	sub r2, r1, #2
	mov r1, #0
	bl sub_02025D50
_02047B80:
	ldrsh r2, [r4, #0x80]
	ldr r1, [sp, #4]
	mov r0, sl
	mla r2, r6, r8, r2
	add r3, fp, sb
	bl sub_020264A4
	add r0, r7, #1
	mov r1, r0, lsl #0x10
	ldrsh r0, [r4, #0x70]
	mov r7, r1, asr #0x10
	cmp r0, r1, asr #16
	ble _02047BC8
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, r1, asr #0x10
_02047BBC:
	ldrsh r1, [r4, #0x72]
	cmp r6, r1
	blt _02047B48
_02047BC8:
	add r1, r5, #0x1f00
	ldrsh r2, [r1, #0x72]
	cmp r0, r2
	ble _02047C18
	sub r0, r0, r2
	sub r0, r0, #1
	ldrsh r1, [r1, #0x74]
	mov r0, r0, lsl #0x10
	cmp r1, r0, asr #16
	addeq r0, r5, #0x1000
	moveq r1, #1
	streqb r1, [r0, #0xf82]
	beq _02047C2C
	cmp r1, #0
	add r0, r5, #0x1000
	moveq r1, #2
	streqb r1, [r0, #0xf82]
	movne r1, #3
	strneb r1, [r0, #0xf82]
	b _02047C2C
_02047C18:
	add r0, r5, #0x1000
	mov r1, #0
	strb r1, [r0, #0xf82]
	strb r1, [r0, #0xf7a]
	strb r1, [r0, #0xf7b]
_02047C2C:
	mov r0, sl
	bl UpdateWindow
_02047C34:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02047C3C: .word _020AFEEC
	arm_func_end sub_02047AB4

	arm_func_start sub_02047C40
sub_02047C40: ; 0x02047C40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r1, _02047EF0 ; =_020AFEEC
	mov r6, #0
	ldr r5, [r1, r0, lsl #2]
	add r1, sp, #0
	mov r0, r6
	bl sub_020063F4
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl GetAdvancedTextBoxFlags2
	ldr r1, [r5, #0x11c]
	mov r4, r0
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _02047EE4
_02047C80: ; jump table
	b _02047C94 ; case 0
	b _02047CAC ; case 1
	b _02047CB8 ; case 2
	b _02047EC0 ; case 3
	b _02047ECC ; case 4
_02047C94:
	mov r0, r5
	bl sub_020261D4
	cmp r0, #0
	beq _02047EE4
	mov r0, #1
	str r0, [r5, #0x11c]
_02047CAC:
	mov r0, #2
	str r0, [r5, #0x11c]
	b _02047EE4
_02047CB8:
	mov r0, r5
	bl sub_02026204
	add r1, r5, #0x1000
	ldrb r1, [r1, #0xf7c]
	mov r7, r0
	cmp r1, #1
	beq _02047EE4
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	beq _02047CF0
	ands r8, r4, #2
	beq _02047D0C
_02047CF0:
	mov r0, #1
	bl PlaySeVolumeWrapper
	mov r0, #3
	str r0, [r5, #0x11c]
	mov r0, #1
	str r0, [r5, #0x124]
	b _02047EE4
_02047D0C:
	add r0, r5, #0x1f00
	ldrsh r3, [r0, #0x72]
	ldrsh ip, [r0, #0x70]
	cmp ip, r3
	ble _02047E9C
	ldrh r0, [sp]
	tst r0, #0x40
	bne _02047D34
	tst r4, #0x40000
	beq _02047D7C
_02047D34:
	add r0, r5, #0x1f00
	ldrsh r1, [r0, #0x74]
	sub r1, r1, #1
	strh r1, [r0, #0x74]
	ldrsh r1, [r0, #0x74]
	cmp r1, #0
	bge _02047D6C
	mov r1, #0
	strh r1, [r0, #0x74]
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	b _02047D74
_02047D6C:
	mov r0, #3
	bl PlaySeVolumeWrapper
_02047D74:
	mov r6, #1
	b _02047DC4
_02047D7C:
	tst r0, #0x80
	bne _02047D8C
	tst r4, #0x80000
	beq _02047DC4
_02047D8C:
	add r1, r5, #0x1f00
	ldrsh r2, [r1, #0x74]
	sub r0, ip, r3
	mov r0, r0, lsl #0x10
	add r2, r2, #1
	strh r2, [r1, #0x74]
	ldrsh r2, [r1, #0x74]
	mov r3, r0, asr #0x10
	cmp r2, r0, asr #16
	strgth r3, [r1, #0x74]
	bgt _02047DC0
	mov r0, #3
	bl PlaySeVolumeWrapper
_02047DC0:
	mov r6, #1
_02047DC4:
	add r0, r5, #0x1f00
	ldrsh r2, [r0, #0x74]
	cmp r2, #1
	blt _02047E0C
	ldrsh r1, [r0, #0x70]
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	cmp r2, r0
	bge _02047E0C
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A90
	b _02047E70
_02047E0C:
	cmp r2, #0
	bne _02047E38
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A74
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A90
	b _02047E70
_02047E38:
	add r0, r5, #0x1f00
	ldrsh r1, [r0, #0x70]
	ldrsh r0, [r0, #0x72]
	sub r0, r1, r0
	cmp r2, r0
	bne _02047E70
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x20000000
	bl sub_02030A90
	add r0, r5, #0x100
	ldrsb r0, [r0, #0x20]
	mov r1, #0x40000000
	bl sub_02030A74
_02047E70:
	ldrb r0, [r5, #0x129]
	cmp r0, #0
	bne _02047E9C
	cmp r6, #0
	beq _02047E9C
	add r0, r5, #0x1f00
	ldrsh r2, [r0, #0x74]
	add r1, r5, #0x100
	strh r2, [r0, #0x7e]
	ldrsb r0, [r1, #0x20]
	bl SetAdvancedTextBoxField0x1C2
_02047E9C:
	cmp r8, #0
	bne _02047EAC
	cmp r7, #0x10
	bne _02047EE4
_02047EAC:
	mov r1, #3
	mov r0, #1
	str r1, [r5, #0x11c]
	bl PlaySeVolumeWrapper
	b _02047EE4
_02047EC0:
	mov r0, #4
	str r0, [r5, #0x11c]
	b _02047EE4
_02047ECC:
	mov r1, r6
	mov r0, r5
	str r1, [r5, #0x11c]
	bl sub_0202613C
	mov r0, #1
	b _02047EE8
_02047EE4:
	mov r0, #0
_02047EE8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02047EF0: .word _020AFEEC
	arm_func_end sub_02047C40

	arm_func_start sub_02047EF4
sub_02047EF4: ; 0x02047EF4
	stmdb sp!, {r4, lr}
	ldr r1, _02047F34 ; =_020AFEEC
	mov r4, r0
	ldr r0, [r1, r4, lsl #2]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x20]
	bl CloseAdvancedTextBox2
	ldr r0, _02047F34 ; =_020AFEEC
	ldr r0, [r0, r4, lsl #2]
	bl MemFree
	ldr r0, _02047F34 ; =_020AFEEC
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02047F34: .word _020AFEEC
	arm_func_end sub_02047EF4

	arm_func_start sub_02047F38
sub_02047F38: ; 0x02047F38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov sl, r0
	ldr r6, [sp, #0x28]
	mov r0, sb
	mov r1, #0x3c
	mov r8, r2
	mov r7, r3
	bl _s32_div_f
	mov r1, r1, lsl #0x10
	mov r2, #0
	mov r0, r6
	strh r2, [r8]
	mov sb, r1, asr #0x10
	bl sub_0204793C
	mov r5, #0
	mov fp, #0x3c
	mov r4, #0xd4
_02047F80:
	smulbb r1, sb, r4
	ldrb r0, [sl, r1]
	add r2, sl, r1
	cmp r0, #0
	beq _02047FB4
	ldrb r1, [r2, #1]
	mov r3, r6
	add r0, r2, #3
	add r2, r2, #0x84
	bl sub_02047A10
	ldrsh r0, [r8]
	add r0, r0, #1
	strh r0, [r8]
_02047FB4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, fp
	mov r0, r0, asr #0x10
	bl _s32_div_f
	add r0, r5, #1
	mov r2, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r5, r2, asr #0x10
	cmp r5, #0x3c
	mov sb, r0, asr #0x10
	blt _02047F80
	ldrsh r0, [r8]
	cmp r0, r7
	mov r0, r6
	strlth r7, [r8]
	bl sub_02047960
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02047F38

	arm_func_start sub_02047FFC
sub_02047FFC: ; 0x02047FFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x39c0
	mov r1, #0
	bl MemAlloc
	ldr r2, _02048048 ; =_020AFEF4
	mov r1, #0x39c0
	str r0, [r2]
	bl MemZero
	ldr r1, _02048048 ; =_020AFEF4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r4, [r0, #0x1bc]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0x1b3]
	bl sub_020480CC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02048048: .word _020AFEF4
	arm_func_end sub_02047FFC

	arm_func_start sub_0204804C
sub_0204804C: ; 0x0204804C
	stmdb sp!, {r3, lr}
	ldr r0, _02048074 ; =_020AFEF4
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02048074 ; =_020AFEF4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02048074: .word _020AFEF4
	arm_func_end sub_0204804C

	arm_func_start sub_02048078
sub_02048078: ; 0x02048078
	ldr r1, _0204809C ; =_020AFEF4
	ldr r1, [r1]
	cmp r1, #0
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	addne r1, r1, #0x3000
	strneb r0, [r1, #0x1b3]
	bx lr
	.align 2, 0
_0204809C: .word _020AFEF4
	arm_func_end sub_02048078

	arm_func_start sub_020480A0
sub_020480A0: ; 0x020480A0
	ldr r0, _020480C8 ; =_020AFEF4
	ldr r0, [r0]
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	addne r0, r0, #0x3000
	ldrneb r0, [r0, #0x1b3]
	moveq r0, #0
	bx lr
	.align 2, 0
_020480C8: .word _020AFEF4
	arm_func_end sub_020480A0

	arm_func_start sub_020480CC
sub_020480CC: ; 0x020480CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _02048130 ; =_020AFEF4
	mov r7, #0xd4
	ldr r0, [r6]
	mov r4, #0
	add r0, r0, #0x3100
	strh r4, [r0, #0xb8]
	ldr r0, [r6]
	mov r1, #1
	add r0, r0, #0x3000
	strb r1, [r0, #0x1b0]
	mov r5, r7
_020480FC:
	mul r8, r4, r5
	ldr r0, [r6]
	mov r1, r7
	add r0, r0, r8
	bl MemZero
	ldr r0, [r6]
	add r0, r0, r8
	add r0, r0, #0x84
	bl InitPreprocessorArgs
	add r4, r4, #1
	cmp r4, #0x3c
	blt _020480FC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02048130: .word _020AFEF4
	arm_func_end sub_020480CC

	arm_func_start sub_02048134
sub_02048134: ; 0x02048134
	ldr r0, _0204814C ; =_020AFEF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x1b0]
	bx lr
	.align 2, 0
_0204814C: .word _020AFEF4
	arm_func_end sub_02048134

	arm_func_start sub_02048150
sub_02048150: ; 0x02048150
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020480A0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _0204823C ; =_020AFEF4
	mov r1, #0xd4
	ldr lr, [r2]
	mov r3, #1
	add r0, lr, #0x3100
	ldrsh r0, [r0, #0xb8]
	smulbb ip, r0, r1
	strb r3, [lr, ip]
	ldr r0, [r2]
	add r1, lr, ip
	add r0, r0, ip
	strb r5, [r0, #1]
	ldr r0, [r2]
	add r2, r1, #3
	add r0, r0, ip
	strb r4, [r0, #2]
	add r1, r1, #0x82
_020481B0:
	ldrb r0, [r6]
	cmp r0, #0
	cmpne r0, #0xd
	beq _020481D0
	cmp r2, r1
	strlob r0, [r2], #1
	add r6, r6, #1
	b _020481B0
_020481D0:
	mov r3, #0
	ldr r1, _0204823C ; =_020AFEF4
	strb r3, [r2]
	ldr r0, [r1]
	add r0, r0, #0x3100
	ldrsh r2, [r0, #0xb8]
	add r2, r2, #1
	strh r2, [r0, #0xb8]
	ldr r0, [r1]
	mov r2, #1
	add r0, r0, #0x3100
	ldrsh r1, [r0, #0xb8]
	cmp r1, #0x3c
	ldr r1, _0204823C ; =_020AFEF4
	strgeh r3, [r0, #0xb8]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0x1b0]
	ldr r1, [r1]
	add r0, r1, #0x3000
	ldrb r0, [r0, #0x1b2]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r1, #0x3100
	ldrsh r0, [r0, #0xb8]
	bl sub_020476EC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204823C: .word _020AFEF4
	arm_func_end sub_02048150

	arm_func_start sub_02048240
sub_02048240: ; 0x02048240
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _02048334 ; =_020AFEF4
	mov r1, r0
	ldr r0, [r2]
	cmp r0, #0
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r0, #0x31c0
	mov r8, #0
	bl strcpy
	ldr r4, _02048334 ; =_020AFEF4
	mov r7, r8
	mov r6, #0x400
	mov fp, #0x440
	mov r5, r8
_02048284:
	ldr sb, [r4]
	add r0, sb, r8
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x1c0]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r2, sb, #0x31c0
	mov r1, r6
	mov r3, fp
	str r7, [sp]
	add r0, sb, #0x35c0
	add r2, r2, r8
	bl PreprocessString
	ldr r1, [r4]
	add r8, r8, r0
	add r0, r1, r0
	add r0, r0, #0x3000
	strb r5, [r0, #0x5c0]
	ldr sl, [r4]
	add r0, sl, r8
	add r0, r0, #0x3000
	ldrb sb, [r0, #0x1c0]
	cmp sb, #0
	beq _0204831C
	add r0, sl, #0x31c0
	ldr r1, _02048338 ; =_0209CCE0
	mov r2, #3
	add r0, r0, r8
	bl strncmp
	cmp r0, #0
	bne _02048310
	ldr r0, _02048338 ; =_0209CCE0
	bl strlen
	add r8, r8, r0
	b _0204831C
_02048310:
	cmp sb, #0xd
	cmpne sb, #0xa
	addeq r8, r8, #1
_0204831C:
	mov r1, #0
	mov r2, r1
	add r0, sl, #0x35c0
	bl sub_02048150
	b _02048284
_02048330:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02048334: .word _020AFEF4
_02048338: .word _0209CCE0
	arm_func_end sub_02048240

	arm_func_start sub_0204833C
sub_0204833C: ; 0x0204833C
	ldr r0, _02048358 ; =_020AFEF4
	ldr ip, _0204835C ; =sub_020475B4
	ldr r0, [r0]
	mov r1, #9
	add r2, r0, #0x3100
	ldrsh r2, [r2, #0xb8]
	bx ip
	.align 2, 0
_02048358: .word _020AFEF4
_0204835C: .word sub_020475B4
	arm_func_end sub_0204833C

	arm_func_start sub_02048360
sub_02048360: ; 0x02048360
	stmdb sp!, {r3, lr}
	bl sub_02047660
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	moveq r0, #2
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02048360

	arm_func_start sub_02048384
sub_02048384: ; 0x02048384
	stmdb sp!, {r3, lr}
	ldr r0, _020483B4 ; =_020AFEF4
	mov r1, #0xb
	ldr r0, [r0]
	bl sub_02047670
	cmp r0, #0
	ldrne r1, _020483B4 ; =_020AFEF4
	movne r2, #1
	ldrne r1, [r1]
	addne r1, r1, #0x3000
	strneb r2, [r1, #0x1b2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020483B4: .word _020AFEF4
	arm_func_end sub_02048384
