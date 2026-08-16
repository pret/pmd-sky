	.include "asm/macros.inc"
	.include "main_0200F390.inc"

	.text

	arm_func_start RemoveItemNoHole
RemoveItemNoHole: ; 0x0200F390
	stmdb sp!, {r4, lr}
	ldr r2, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F3F8
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F3D4
	bl sub_020582E0
_0200F3D4:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F400 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F3F8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F400: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHole

	arm_func_start RemoveItem
RemoveItem: ; 0x0200F404
	stmdb sp!, {r4, lr}
	ldr r2, _0200F450 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldrneb r0, [r4, #1]
	cmpne r0, #0
	beq _0200F444
	bl sub_020582E0
_0200F444:
	mov r0, r4
	bl ItemZInit
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F450: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItem

	arm_func_start RemoveHeldItemNoHole
RemoveHeldItemNoHole: ; 0x0200F454
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #0
	ldr r0, [r0]
	mov r6, r4
	ldr r8, [r0, #0x384]
	mov r7, #1
_0200F478:
	ldrb r0, [r8]
	tst r0, #1
	movne r0, r7
	moveq r0, r6
	tst r0, #0xff
	beq _0200F4A8
	ldrb r0, [r8, #1]
	cmp r0, r5
	bne _0200F4A8
	bl sub_020582E0
	mov r0, r8
	bl ItemZInit
_0200F4A8:
	add r4, r4, #1
	cmp r4, #0x32
	add r8, r8, #6
	blt _0200F478
	ldr r0, _0200F4D0 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200F4D0: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveHeldItemNoHole

	arm_func_start RemoveItemByIdAndStackNoHole
RemoveItemByIdAndStackNoHole: ; 0x0200F4D4
	stmdb sp!, {r4, lr}
	ldr r1, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r1, [r1]
	ldr r4, [r1, #0x384]
	b _0200F544
_0200F4EC:
	ldrsh r2, [r4, #4]
	ldrsh r1, [r0]
	cmp r2, r1
	ldreqh r2, [r4, #2]
	ldreqh r1, [r0, #2]
	cmpeq r2, r1
	bne _0200F53C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F518
	bl sub_020582E0
_0200F518:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F554 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F53C:
	add r3, r3, #1
	add r4, r4, #6
_0200F544:
	cmp r3, #0x32
	blt _0200F4EC
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F554: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemByIdAndStackNoHole

	arm_func_start RemoveEquivItem
RemoveEquivItem: ; 0x0200F558
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F5EC
_0200F580:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F5E4
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F5E4
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F5C0
	bl sub_020582E0
_0200F5C0:
	mov r0, sb
	bl ItemZInit
	ldr r0, _0200F5FC ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F5E4:
	add r4, r4, #1
	add sb, sb, #6
_0200F5EC:
	cmp r4, #0x32
	blt _0200F580
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F5FC: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItem

	arm_func_start RemoveEquivItemNoHole
RemoveEquivItemNoHole: ; 0x0200F600
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F690 ; =BAG_ITEMS_PTR_MIRROR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	ldr sb, [r0, #0x384]
	mov r7, r4
	mov r8, #1
	mov r6, #0xb
	b _0200F680
_0200F628:
	ldrb r0, [sb]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	tst r0, #0xff
	beq _0200F678
	mov r0, sb
	mov r1, r5
	mov r2, r6
	bl AreItemsEquivalent
	cmp r0, #0
	beq _0200F678
	ldrb r0, [sb, #1]
	cmp r0, #0
	beq _0200F668
	bl sub_020582E0
_0200F668:
	mov r0, sb
	bl ItemZInit
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F678:
	add r4, r4, #1
	add sb, sb, #6
_0200F680:
	cmp r4, #0x32
	blt _0200F628
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F690: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveEquivItemNoHole

	arm_func_start DecrementStackItem
DecrementStackItem: ; 0x0200F694
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0200F714 ; =BAG_ITEMS_PTR_MIRROR
	mov r6, r0
	ldr r0, [r1]
	mov r5, #0
	ldr r4, [r0, #0x384]
	mov r8, r5
	mov sb, #1
	mov r7, #0xb
	b _0200F704
_0200F6BC:
	ldrb r0, [r4]
	tst r0, #1
	movne r0, sb
	moveq r0, r8
	tst r0, #0xff
	beq _0200F6FC
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl AreItemsEquivalent
	cmp r0, #0
	ldrneh r1, [r4, #2]
	movne r0, #1
	subne r1, r1, #1
	strneh r1, [r4, #2]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0200F6FC:
	add r5, r5, #1
	add r4, r4, #6
_0200F704:
	cmp r5, #0x32
	blt _0200F6BC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0200F714: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end DecrementStackItem

	arm_func_start RemoveItemNoHoleCheck
RemoveItemNoHoleCheck: ; 0x0200F718
	stmdb sp!, {r4, lr}
	mvn r1, #0
	cmp r0, r1
	beq _0200F78C
	ldr r2, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #6
	ldr r2, [r2]
	smulbb r1, r0, r1
	ldr r2, [r2, #0x384]
	ldrb r0, [r2, r1]
	add r4, r2, r1
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200F78C
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200F768
	bl sub_020582E0
_0200F768:
	mov r0, r4
	bl ItemZInit
	ldr r0, _0200F794 ; =BAG_ITEMS_PTR_MIRROR
	mov r1, #0x32
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	bl RemoveEmptyItems
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200F78C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200F794: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end RemoveItemNoHoleCheck
