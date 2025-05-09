	.include "asm/macros.inc"
	.include "overlay_29_0231E990.inc"

	.text

	arm_func_start ShouldTryEatItem
ShouldTryEatItem: ; 0x0231E990
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0x45
	blt _0231E9A8
	cmp r4, #0x8a
	ble _0231E9B0
_0231E9A8:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0231E9B0:
	bl IsItemValidVeneer
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _0231E9EC ; =EAT_ITEM_EFFECT_IGNORE_LIST
	b _0231E9D8
_0231E9C8:
	cmp r4, r1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #2
_0231E9D8:
	ldrsh r1, [r0]
	cmp r1, #0
	bne _0231E9C8
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231E9EC: .word EAT_ITEM_EFFECT_IGNORE_LIST
	arm_func_end ShouldTryEatItem
