	.include "asm/macros.inc"
	.include "main_0204317C.inc"

	.text

	arm_func_start FreeUnkStorageStruct0x18c0
FreeUnkStorageStruct0x18c0: ; 0x0204317C
	stmdb sp!, {r3, lr}
	ldr r0, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02044474
	bl sub_020442CC
	bl sub_020445C8
	ldr r0, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	ldr r1, [r0, #4]
	ldr r0, [r1]
	cmp r0, #6
	bne _020431BC
	add r0, r1, #0x700
	ldrsb r0, [r0, #0xd5]
	bl CloseTextBox
_020431BC:
	ldr r0, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0xd6]
	cmp r0, r1
	beq _020431DC
	bl CloseTextBox
_020431DC:
	ldr r1, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r1, #4]
	ldr r2, [r0]
	add r0, r0, #0x700
	str r2, [r1, #0xc]
	ldrsb r0, [r0, #0xd4]
	bl CloseCollectionMenu
	ldr r0, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02043214 ; =UNK_STORAGE_STRUCT_0X14
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02043214: .word UNK_STORAGE_STRUCT_0X14
	arm_func_end FreeUnkStorageStruct0x18c0
