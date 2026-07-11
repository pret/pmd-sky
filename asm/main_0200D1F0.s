	.include "asm/macros.inc"
	.include "main_0200D1F0.inc"

	.text

	arm_func_start sub_0200D1F0
sub_0200D1F0: ; 0x0200D1F0
	ldr ip, _0200D1F8 ; =sub_0200EB64
	bx ip
	.align 2, 0
_0200D1F8: .word sub_0200EB64
	arm_func_end sub_0200D1F0

	arm_func_start sub_0200D1FC
sub_0200D1FC: ; 0x0200D1FC
	ldr ip, _0200D204 ; =GetItemPaletteId
	bx ip
	.align 2, 0
_0200D204: .word GetItemPaletteId
	arm_func_end sub_0200D1FC

	arm_func_start sub_0200D208
sub_0200D208: ; 0x0200D208
	ldr ip, _0200D210 ; =GetItemActionName
	bx ip
	.align 2, 0
_0200D210: .word GetItemActionName
	arm_func_end sub_0200D208

	arm_func_start sub_0200D214
sub_0200D214: ; 0x0200D214
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl GetItemName
	mov r1, r0
	add r0, sp, #6
	mov r2, #0x50
	bl strncpy
	mov r2, #0
	mov r1, r5
	add r0, sp, #0
	mov r3, r2
	bl InitItem
	mov r1, #1
	strh r1, [sp, #2]
	mov r0, r6
	mov r3, r4
	add r1, sp, #6
	add r2, sp, #0
	bl sub_0200D688
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200D214

	arm_func_start FindItemInInventory
FindItemInInventory: ; 0x0200D278
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0200D30C ; =BAG_ITEMS_PTR_MIRROR
	mov r5, #0
	ldr r6, [r1]
	mov r3, r5
	mov ip, #1
	mov r1, #6
	b _0200D2D0
_0200D298:
	mul lr, r5, r1
	ldr r4, [r6, #0x384]
	ldrb r2, [r4, lr]
	add r4, r4, lr
	tst r2, #1
	movne r2, ip
	moveq r2, r3
	tst r2, #0xff
	beq _0200D2CC
	ldrsh r2, [r4, #4]
	cmp r0, r2
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, pc}
_0200D2CC:
	add r5, r5, #1
_0200D2D0:
	cmp r5, #0x32
	blt _0200D298
	mov r2, #0
	b _0200D2FC
_0200D2E0:
	add r1, r6, r2, lsl #1
	add r1, r1, #0x300
	ldrsh r1, [r1, #0x8a]
	cmp r0, r1
	addeq r0, r2, #0x8000
	ldmeqia sp!, {r4, r5, r6, pc}
	add r2, r2, #1
_0200D2FC:
	cmp r2, #0x3e8
	blt _0200D2E0
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0200D30C: .word BAG_ITEMS_PTR_MIRROR
	arm_func_end FindItemInInventory

	arm_func_start MaybeGetFormattedItemName
MaybeGetFormattedItemName: ; 0x0200D310
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa0
	mov sb, r1
	mov sl, r0
	ldrsh r0, [sb, #4]
	mov r8, r2
	mov r7, r3
	mov r4, #0
	bl GetItemCategory
	mov r5, r4
	mov r6, r0
	cmp r8, #0
	ldrneb r0, [r8, #8]
	mov fp, r5
	cmpne r0, #0
	ldrsh r0, [sb, #4]
	movne r4, #1
	bl GetItemName
	mov r2, r0
	cmp r6, #0
	bne _0200D3B4
	cmp r4, #0
	add r0, sp, #0x50
	beq _0200D394
	cmp r7, #0
	ldrh r3, [sb, #2]
	beq _0200D388
	ldr r1, _0200D60C ; =_02097F34
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D388:
	ldr r1, _0200D610 ; =_02097F50
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D394:
	cmp r7, #0
	beq _0200D3A8
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3A8:
	ldr r1, _0200D618 ; =_02097F68
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3B4:
	cmp r6, #1
	bne _0200D40C
	cmp r4, #0
	add r0, sp, #0x50
	beq _0200D3EC
	cmp r7, #0
	ldrh r3, [sb, #2]
	beq _0200D3E0
	ldr r1, _0200D60C ; =_02097F34
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3E0:
	ldr r1, _0200D610 ; =_02097F50
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D3EC:
	cmp r7, #0
	beq _0200D400
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D400:
	ldr r1, _0200D618 ; =_02097F68
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D40C:
	add r0, r6, #0xf4
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0200D440
	cmp r7, #0
	add r0, sp, #0x50
	beq _0200D434
	ldr r1, _0200D61C ; =_02097F6C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D434:
	mov r1, r2
	bl strcpy
	b _0200D4F8
_0200D440:
	ldrsh r0, [sb, #4]
	cmp r0, #0xb7
	bne _0200D4AC
	mov r0, sb
	bl GetMoneyQuantity
	mov r1, r0
	add r0, sp, #0
	bl MoneyQuantityToString__02023B30
	cmp r7, #0
	add r0, sp, #0x50
	add r2, sp, #0
	beq _0200D47C
	ldr r1, _0200D620 ; =_02097F7C
	bl SprintfStatic__0200D634
	b _0200D484
_0200D47C:
	ldr r1, _0200D624 ; =_02097F90
	bl SprintfStatic__0200D634
_0200D484:
	cmp r7, #0
	add r0, sp, #0x50
	add r2, sp, #0
	beq _0200D4A0
	ldr r1, _0200D620 ; =_02097F7C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4A0:
	ldr r1, _0200D624 ; =_02097F90
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4AC:
	cmp r6, #0xf
	add r0, sp, #0x50
	bne _0200D4D8
	cmp r7, #0
	beq _0200D4CC
	ldr r1, _0200D628 ; =_02097F9C
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4CC:
	mov r1, r2
	bl strcpy
	b _0200D4F8
_0200D4D8:
	cmp r7, #0
	beq _0200D4EC
	ldr r1, _0200D614 ; =_02097F58
	bl SprintfStatic__0200D634
	b _0200D4F8
_0200D4EC:
	mov r1, r2
	mov r2, #0x50
	bl strncpy
_0200D4F8:
	ldrb r0, [sb]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _0200D538
	ldr r1, _0200D62C ; =_02097FAC
	add r2, sp, #0x50
	mov r0, sl
	bl SprintfStatic__0200D634
	add r0, sp, #0x50
	mov r1, sl
	mov r2, #0x50
	bl strncpy
	mov fp, #1
	b _0200D564
_0200D538:
	ldrb r0, [sp, #0xc8]
	cmp r0, #0
	beq _0200D564
	ldr r1, _0200D630 ; =_02097FB8
	add r2, sp, #0x50
	mov r0, sl
	bl SprintfStatic__0200D634
	add r0, sp, #0x50
	mov r1, sl
	mov r2, #0x50
	bl strncpy
_0200D564:
	cmp r8, #0
	bne _0200D580
	add r1, sp, #0x50
	mov r0, sl
	mov r2, #0x50
	bl strncpy
	b _0200D600
_0200D580:
	ldrb r0, [r8, #4]
	cmp r0, #0
	beq _0200D5AC
	ldrb r0, [sb]
	tst r0, #0x10
	beq _0200D5AC
	cmp fp, #0
	movne r0, #0x35
	strneb r0, [sp, #0x54]
	moveq r0, #0x32
	streqb r0, [sp, #0x54]
_0200D5AC:
	ldr r0, [r8]
	add r1, sp, #0x50
	cmp r0, #1
	cmpne r0, #3
	bne _0200D5F0
	ldrb r0, [sb]
	tst r0, #2
	mov r0, sl
	beq _0200D5E4
	mov r2, sb
	mov r3, r8
	bl sub_0200D688
	mov r5, #1
	b _0200D600
_0200D5E4:
	mov r2, #0x50
	bl strncpy
	b _0200D600
_0200D5F0:
	mov r0, sl
	mov r2, sb
	mov r3, r8
	bl sub_0200D688
_0200D600:
	mov r0, r5
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0200D60C: .word _02097F34
_0200D610: .word _02097F50
_0200D614: .word _02097F58
_0200D618: .word _02097F68
_0200D61C: .word _02097F6C
_0200D620: .word _02097F7C
_0200D624: .word _02097F90
_0200D628: .word _02097F9C
_0200D62C: .word _02097FAC
_0200D630: .word _02097FB8
	arm_func_end MaybeGetFormattedItemName

	arm_func_start SprintfStatic__0200D634
SprintfStatic__0200D634: ; 0x0200D634
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end SprintfStatic__0200D634

	arm_func_start MaybeGetUncoloredFormattedItemName
MaybeGetUncoloredFormattedItemName: ; 0x0200D65C
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl MaybeGetFormattedItemName
	ldmia sp!, {r3, pc}
	arm_func_end MaybeGetUncoloredFormattedItemName

	arm_func_start MaybeGetColoredFormattedItemName
MaybeGetColoredFormattedItemName: ; 0x0200D670
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl MaybeGetFormattedItemName
	ldmia sp!, {r3, pc}
	arm_func_end MaybeGetColoredFormattedItemName

	arm_func_start sub_0200D688
sub_0200D688: ; 0x0200D688
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	movs r4, r3
	mov r6, r0
	mov r5, r1
	bne _0200D6AC
	mov r2, #0x50
	bl strncpy
	b _0200D75C
_0200D6AC:
	ldr r0, [r4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0200D6E8
_0200D6BC: ; jump table
	b _0200D6E8 ; case 0
	b _0200D6D0 ; case 1
	b _0200D6D0 ; case 2
	b _0200D6DC ; case 3
	b _0200D6DC ; case 4
_0200D6D0:
	mov r0, r2
	bl GetDisplayedBuyPrice
	b _0200D6EC
_0200D6DC:
	mov r0, r2
	bl GetDisplayedSellPrice
	b _0200D6EC
_0200D6E8:
	mov r0, #0
_0200D6EC:
	cmp r0, #0
	bne _0200D708
	mov r0, r6
	mov r1, r5
	mov r2, #0x50
	bl strncpy
	b _0200D75C
_0200D708:
	ldrsh r1, [r4, #6]
	cmp r1, #0
	add r1, sp, #4
	beq _0200D740
	mov r2, #1
	bl sub_0200D76C
	add r0, sp, #4
	str r0, [sp]
	ldrsh r3, [r4, #6]
	ldr r1, _0200D764 ; =_02097FC4
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0200D634
	b _0200D75C
_0200D740:
	mov r2, #0
	bl sub_0200D76C
	ldr r1, _0200D768 ; =_02097FE4
	add r3, sp, #4
	mov r0, r6
	mov r2, r5
	bl SprintfStatic__0200D634
_0200D75C:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200D764: .word _02097FC4
_0200D768: .word _02097FE4
	arm_func_end sub_0200D688

	arm_func_start sub_0200D76C
sub_0200D76C: ; 0x0200D76C
#ifdef JAPAN
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov lr, #0
	ldr r4, [r3, #4]
	mov ip, lr
	mov r3, lr
_0200D784:
	ldr r5, _0200D818 ; =_02094D0C
	mov r6, #0
	ldr r5, [r5, r3, lsl #2]
	b _0200D79C
_0200D794:
	sub r0, r0, r5
	add r6, r6, #1
_0200D79C:
	cmp r0, r5
	bge _0200D794
	cmp r6, #9
	movgt r6, #9
	cmp r6, #0
	beq _0200D7D8
	ldrb r5, [r4, r6, lsl #1]
	add r6, r4, r6, lsl #1
	add ip, ip, #1
	strb r5, [r1]
	ldrb r5, [r6, #1]
	mov lr, #1
	strb r5, [r1, #1]
	add r1, r1, #2
	b _0200D80C
_0200D7D8:
	cmp lr, #0
	beq _0200D800
	ldrb r5, [r4, r6, lsl #1]
	add r6, r4, r6, lsl #1
	add ip, ip, #1
	strb r5, [r1]
	ldrb r5, [r6, #1]
	strb r5, [r1, #1]
	add r1, r1, #2
	b _0200D80C
_0200D800:
	cmp r2, #0
	movne r5, #0x7f
	strneb r5, [r1], #1
_0200D80C:
	add r3, r3, #1
	cmp r3, #5
	blt _0200D784
	ldr r2, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r2, [r2, #4]
	ldrb r4, [r2, r0, lsl #1]
	add r2, r2, r0, lsl #1
	add r0, ip, #1
	strb r4, [r1]
	ldrb r2, [r2, #1]
	strb r2, [r1, #1]
	strb r3, [r1, #2]
	ldmia sp!, {r4, r5, r6, pc}
#else
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _0200D814 ; =BAG_ITEMS_PTR_MIRROR
	mov ip, #0
	ldr lr, [r3, #4]
	ldr r8, _0200D818 ; =_02094D0C
	mov r3, ip
	mov sl, ip
	mov r7, #9
	mov r4, #0x7f
	mov r6, #1
	mov sb, ip
_0200D798:
	mov r5, sb
	ldr fp, [r8, sl, lsl #2]
	b _0200D7AC
_0200D7A4:
	sub r0, r0, fp
	add r5, r5, #1
_0200D7AC:
	cmp r0, fp
	bge _0200D7A4
	cmp r5, #9
	movgt r5, r7
	cmp r5, #0
	ldrneb r5, [lr, r5]
	movne ip, r6
	addne r3, r3, #1
	strneb r5, [r1], #1
	bne _0200D7F0
	cmp ip, #0
	ldrneb r5, [lr, r5]
	addne r3, r3, #1
	strneb r5, [r1], #1
	bne _0200D7F0
	cmp r2, #0
	strneb r4, [r1], #1
_0200D7F0:
	add sl, sl, #1
	cmp sl, #5
	blt _0200D798
	ldrb ip, [lr, r0]
	mov r2, #0
	add r0, r3, #1
	strb ip, [r1]
	strb r2, [r1, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	.align 2, 0
_0200D814: .word BAG_ITEMS_PTR_MIRROR
_0200D818: .word _02094D0C
	arm_func_end sub_0200D76C
