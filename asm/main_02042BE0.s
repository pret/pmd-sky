	.include "asm/macros.inc"
	.include "main_02042BE0.inc"

	.text

	arm_func_start sub_02042BE0
sub_02042BE0: ; 0x02042BE0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	bl GetNbItemsInBag
	mov r1, #6
	mov r4, r0
	mov r0, #0
	ldr ip, _02042CE8 ; =UNK_STORAGE_STRUCT_0XC
	ldr r3, _02042CEC ; =BAG_ITEMS_PTR_MIRROR
	mov r2, r1
	b _02042C44
_02042C04:
	ldr r5, [ip, #8]
	ldr r5, [r5, r0, lsl #2]
	tst r5, #1
	muleq r6, r0, r1
	ldreq r5, [r3]
	ldreq r7, [r5, #0x384]
	ldreqb r5, [r7, r6]
	biceq r5, r5, #0x80
	beq _02042C3C
	mul r6, r0, r2
	ldr r5, [r3]
	ldr r7, [r5, #0x384]
	ldrb r5, [r7, r6]
	orr r5, r5, #0x80
_02042C3C:
	strb r5, [r7, r6]
	add r0, r0, #1
_02042C44:
	cmp r0, r4
	blt _02042C04
	bl SortItemsInBag
	mov r2, #0
	mov r7, r2
	mov r0, #1
	mov r3, #6
	ldr lr, _02042CEC ; =BAG_ITEMS_PTR_MIRROR
	ldr ip, _02042CE8 ; =UNK_STORAGE_STRUCT_0XC
	b _02042CA4
_02042C6C:
	mul r1, r2, r3
	ldr r5, [lr]
	ldr r5, [r5, #0x384]
	ldrb r5, [r5, r1]
	tst r5, #0x80
	ldr r5, [ip, #8]
	strne r0, [r5, r2, lsl #2]
	streq r7, [r5, r2, lsl #2]
	ldr r5, [lr]
	add r2, r2, #1
	ldr r6, [r5, #0x384]
	ldrb r5, [r6, r1]
	bic r5, r5, #0x80
	strb r5, [r6, r1]
_02042CA4:
	cmp r2, r4
	blt _02042C6C
	ldr r1, _02042CE8 ; =UNK_STORAGE_STRUCT_0XC
	mvn r0, #1
	ldr r1, [r1, #4]
	ldrsb r1, [r1, #4]
	cmp r1, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl GetNbItemsInBag
	ldr r2, _02042CE8 ; =UNK_STORAGE_STRUCT_0XC
	mov r1, r0
	ldr r0, [r2, #4]
	mov r2, #8
	ldrsb r0, [r0, #4]
	mov r3, #0
	bl sub_0202C654
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02042CE8: .word UNK_STORAGE_STRUCT_0XC
_02042CEC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end sub_02042BE0

	arm_func_start InitUnkStorageStruct0x18c0
InitUnkStorageStruct0x18c0: ; 0x02042CF0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #0x18c0
	mov r1, #8
	mov r4, r2
	bl MemAlloc
	ldr r2, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	mvn r3, #1
	str r0, [r2, #4]
	str r5, [r0]
	ldr r0, [r2, #4]
	mov r1, #0
	strb r3, [r0, #0x7d5]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d6]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d7]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d8]
	ldr r0, [r2, #4]
	strb r3, [r0, #0x7d9]
	ldr r0, [r2, #4]
	str r1, [r0, #0x90c]
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	strh r1, [r0, #0x10]
	ldr r0, [r2, #0x10]
	bl sub_02043BFC
	ldr r2, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	ldr r0, [r2, #4]
	add r0, r0, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	ble _02042DB4
	ldr r0, [r2, #0x10]
	cmp r0, #5
	bne _02042DB4
	ldrsh r0, [r2]
	cmp r0, #0
	beq _02042DB4
	bl sub_020440F8
	ldr r1, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r1, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
_02042DB4:
	ldr r0, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x900
	ldrsh r0, [r0, #0x10]
	cmp r0, #0
	bgt _02042DF0
	mov r0, #9
	mov r1, #0
	bl sub_02043BFC
	ldr r2, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	mov r3, #9
	ldr r1, [r2, #4]
	add r1, r1, #0x900
	strh r0, [r1, #0x10]
	str r3, [r2, #0x10]
_02042DF0:
	ldr r1, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	sub r2, r5, #2
	ldr r0, [r1, #4]
	ldr r5, _02042F8C ; =0x000002F3
	add r0, r0, #0x1000
	str r4, [r0, #0x8bc]
	ldrsh ip, [r1, #2]
	ldr r0, [r1, #4]
	mov r3, #0x10
	str ip, [r0, #0x7dc]
	ldr r0, [r1, #4]
	mov ip, #0xd
	add r0, r0, #0x700
	strh r5, [r0, #0xe4]
	ldr r0, [r1, #4]
	ldr r5, _02042F90 ; =_0204357C
	str r3, [r0, #0x7e8]
	ldr r0, [r1, #4]
	ldr r3, _02042F94 ; =_020441BC
	str ip, [r0, #0x7e0]
	ldr r0, [r1, #4]
	cmp r2, #5
	str r5, [r0, #0x858]
	ldr r0, [r1, #4]
	mov r5, #0
	str r3, [r0, #0x850]
	bhi _02042E6C
	mov r0, #1
	mov r1, r0, lsl r2
	tst r1, #0x2b
	movne r5, r0
_02042E6C:
	ldr r1, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	cmp r5, #0
	movne r2, #0
	ldr r3, [r1, #4]
	ldreq r2, _02042F98 ; =MaybeTrySelectStorageItem
	ldr r0, _02042F9C ; =_0209CA58
	str r2, [sp]
	add r2, r3, #0x900
	ldrsh r5, [r2, #0x10]
	add r2, r3, #0x3dc
	ldr r1, _02042FA0 ; =0x00447C33
	str r5, [sp, #4]
	ldr r3, _02042FA4 ; =_020432B4
	add r2, r2, #0x400
	str r4, [sp, #8]
	bl CreateCollectionMenu
	ldr r2, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, _02042FA8 ; =sub_020430F4
	ldr r3, [r2, #4]
	strb r0, [r3, #0x7d4]
	ldr r0, [r2, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D068
	ldr r0, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, _02042FAC ; =sub_02043148
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl SetCollectionMenuVoidFn
	ldr r0, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02042F70
_02042EFC: ; jump table
	b _02042F70 ; case 0
	b _02042F28 ; case 1
	b _02042F28 ; case 2
	b _02042F1C ; case 3
	b _02042F28 ; case 4
	b _02042F60 ; case 5
	b _02042F3C ; case 6
	b _02042F60 ; case 7
_02042F1C:
	mov r0, #0
	bl sub_0204440C
	b _02042F70
_02042F28:
	mov r0, #0
	bl sub_0204440C
	mov r0, #2
	bl sub_0204426C
	b _02042F70
_02042F3C:
	ldr r0, _02042FB0 ; =_0209CA48
	ldr r1, _02042FB4 ; =sub_02044210
	bl CreateTextBox
	ldr r1, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r1, #4]
	strb r0, [r1, #0x7d5]
	mov r0, #1
	bl sub_0204426C
	b _02042F70
_02042F60:
	mov r0, #0
	bl sub_0204440C
	mov r0, #1
	bl sub_0204426C
_02042F70:
	ldr r0, _02042F88 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02042F88: .word UNK_STORAGE_STRUCT_0X14
#ifdef JAPAN
_02042F8C: .word 0x0000239B
#else
_02042F8C: .word 0x000002F3
#endif
_02042F90: .word sub_0204357C
_02042F94: .word sub_020441BC
_02042F98: .word MaybeTrySelectStorageItem
_02042F9C: .word _0209CA58
_02042FA0: .word 0x00447C33
_02042FA4: .word sub_020432B4
_02042FA8: .word sub_020430F4
_02042FAC: .word sub_02043148
_02042FB0: .word _0209CA48
_02042FB4: .word sub_02044210
	arm_func_end InitUnkStorageStruct0x18c0

	arm_func_start MaybeTrySelectStorageItem
MaybeTrySelectStorageItem: ; 0x02042FB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	tst r0, #0x400
	mov r4, #0
	beq _020430A8
	ldr r0, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #1
	cmpne r0, #4
	cmpne r0, #6
	bne _020430A8
	bl sub_02043468
	ldr r1, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	mov r5, r0
	ldr r0, [r1, #8]
	ldrb r0, [r0, r5]
	tst r0, #1
	movne r4, #1
	bne _0204303C
	ldr r0, [r1, #4]
	ldr r0, [r0]
	cmp r0, #1
	bne _02043038
	bl GetNbItemsInBag
	mov r7, r0
	bl CountSelectedStorageItems
	mov r6, r0
	bl GetCurrentBagCapacity
	add r1, r7, r6
	cmp r1, r0
	movlt r4, #1
	b _0204303C
_02043038:
	mov r4, #1
_0204303C:
	cmp r4, #0
	beq _020430A0
	mov r0, #6
	bl PlaySeVolumeWrapper
	ldr r0, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r3, [r0, #8]
	ldrb r2, [r3, r5]
	eor r2, r2, #1
	strb r2, [r3, r5]
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _0204307C
	bl IsTextboxState3
_0204307C:
	ldr r0, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #6
	bne _020430A8
	add r0, r1, #0x700
	ldrsb r0, [r0, #0xd5]
	bl IsTextboxState3
	b _020430A8
_020430A0:
	mov r0, #2
	bl PlaySeVolumeWrapper
_020430A8:
	bl CountSelectedStorageItems
	cmp r0, #0
	ble _020430D0
	ldr r0, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D16C
	b _020430E8
_020430D0:
	ldr r0, _020430F0 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd4]
	bl sub_0202D16C
_020430E8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020430F0: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end MaybeTrySelectStorageItem

	arm_func_start sub_020430F4
sub_020430F4: ; 0x020430F4
	stmdb sp!, {r3, lr}
	ldr r0, _02043144 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #1
	ldr r0, [r0, #0x10]
	bl sub_02043BFC
	ldr r2, _02043144 ; =UNK_STORAGE_STRUCT_0X14
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
_02043144: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end sub_020430F4
