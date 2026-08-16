	.include "asm/macros.inc"
	.include "main_0200EE4C.inc"

	.text

	arm_func_start CountNbItemsOfTypeInBag
CountNbItemsOfTypeInBag: ; 0x0200EE4C
	ldr r1, _0200EE84 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	mov ip, r3
	ldr r2, [r1, #0x384]
_0200EE60:
	ldrsh r1, [r2, #4]
	add ip, ip, #1
	add r2, r2, #6
	cmp r1, r0
	addeq r3, r3, #1
	cmp ip, #0x32
	blt _0200EE60
	mov r0, r3
	bx lr
	.align 2, 0
_0200EE84: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountNbItemsOfTypeInBag

	arm_func_start CountItemTypeInBag
CountItemTypeInBag: ; 0x0200EE88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0200EEDC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r1, [r1]
	mov r7, r0
	ldr r4, [r1, #0x384]
	mov r6, r5
_0200EEA4:
	ldrsh r0, [r4, #4]
	cmp r0, r7
	bne _0200EEC4
	bl IsThrownItem
	cmp r0, #0
	ldrneh r0, [r4, #2]
	addne r5, r5, r0
	addeq r5, r5, #1
_0200EEC4:
	add r6, r6, #1
	cmp r6, #0x32
	add r4, r4, #6
	blt _0200EEA4
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0200EEDC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end CountItemTypeInBag
