	.include "asm/macros.inc"
	.include "main_02011F60.inc"

	.text

	arm_func_start IncrementRecycleCountVar
IncrementRecycleCountVar: ; 0x02011F60
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
	arm_func_end IncrementRecycleCountVar

	arm_func_start UpdateRecycleShop
UpdateRecycleShop: ; 0x02011FA0
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
	bl CountValidRecycleShopItems
	mov r4, r0
	mov r1, r6
	mov r2, r5
	mov r0, #2
	bl CountValidRecycleShopItems
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
	bl CountValidRecycleShopItems
	mov r1, r6
	mov r2, r5
	mov r5, r0
	mov r0, #2
	bl CountValidRecycleShopItems
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
	bl IsRecycleOfferCooldownOver
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
	bl FreeRecycleOfferItems
	ldr r0, _02012214 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #2
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x1300
	strh r1, [r0, #0xb0]
_02012200:
	cmp r2, #0
	bne _0201220C
	bl DecrementRecycleOfferCooldown
_0201220C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02012214: .word BAG_ITEMS_PTR_MIRROR
_02012218: .word _020988A4
_0201221C: .word _020988A8
_02012220: .word RECYCLE_SHOP_ITEM_LIST
	arm_func_end UpdateRecycleShop

	arm_func_start DecrementRecycleOfferCooldown
DecrementRecycleOfferCooldown: ; 0x02012224
	stmdb sp!, {r3, lr}
	bl IsRecycleOfferCooldownOver
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
	arm_func_end DecrementRecycleOfferCooldown

	arm_func_start IsRecycleOfferCooldownOver
IsRecycleOfferCooldownOver: ; 0x02012254
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
	arm_func_end IsRecycleOfferCooldownOver
