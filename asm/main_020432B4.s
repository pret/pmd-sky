	.include "asm/macros.inc"
	.include "main_020432B4.inc"

	.text

	arm_func_start sub_020432B4
sub_020432B4: ; 0x020432B4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _02043318 ; =UNK_STORAGE_STRUCT_0X14
	mov r5, r0
	ldr r0, [r3, #4]
	mov r4, r2
	add r0, r0, r1, lsl #1
	ldrsh r6, [r0, #4]
	add r1, sp, #0
	mov r0, r6
	bl ConvertStorageItemAtIdxToItem
	ldr r2, _0204331C ; =_0209CA3C
	add r1, sp, #0
	mov r0, r5
	bl MaybeGetColoredFormattedItemName
	ldr r0, _02043318 ; =UNK_STORAGE_STRUCT_0X14
	ldr r0, [r0, #8]
	ldrb r0, [r0, r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	str r0, [r4]
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02043318: .word UNK_STORAGE_STRUCT_0X14
_0204331C: .word _0209CA3C
	arm_func_end sub_020432B4

	arm_func_start sub_02043320
sub_02043320: ; 0x02043320
	stmdb sp!, {r3, lr}
	cmp r0, #7
	bne _02043344
	bl CountNbOfValidItemsInTimeDarknessInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_02043344:
	sub r0, r0, #5
	cmp r0, #1
	bhi _02043368
	bl CountNbOfValidItemsInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_02043368:
	bl CountNbOfItemsInStorage
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02043320
