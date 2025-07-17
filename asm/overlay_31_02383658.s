	.include "asm/macros.inc"
	.include "overlay_31_02383658.inc"

	.text

	arm_func_start ov31_02383658
ov31_02383658: ; 0x02383658
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov31_02383658

	arm_func_start ov31_0238367C
ov31_0238367C: ; 0x0238367C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x5c
	bl GetLeader
	mov r1, #0
	mov r2, #0xb
	bl GetItemToUse
	ldrsh r1, [r0, #4]
	mov r2, #0
	add lr, sp, #0xc
	str r1, [sp, #0x1c]
	ldrh r4, [r0, #2]
	ldr r1, _02383720 ; =0x00001013
	ldr r3, _02383724 ; =0x000008E4
	str r4, [sp, #0x30]
	ldrh r4, [r0, #2]
	add r4, r4, #0xbc
	str r4, [sp, #0x24]
	str r2, [sp, #0x38]
	str lr, [sp]
	ldrsh r4, [r0, #4]
	ldr r0, _02383728 ; =DUNGEON_WINDOW_PARAMS_8
#if defined(EUROPE)
	add ip, r4, #0xd3
	add r4, ip, #0x2900
#elif defined(JAPAN)
	add ip, r4, #0xce
	add r4, ip, #0x4100
#else
	add ip, r4, #0xd1
	add r4, ip, #0x2900
#endif
	mov ip, r4, lsl #0x10
	mov r4, ip, lsr #0x10
	stmib sp, {r4, lr}
	bl CreateScrollBoxSingle
	mov r5, r0
	mov r4, #0x16
_023836F0:
	mov r0, r4
	bl AdvanceFrame
	mov r0, r5
	bl IsScrollBoxActive
	cmp r0, #0
	bne _023836F0
	mov r0, r5
	bl CloseScrollBox
	mov r0, #0x16
	bl AdvanceFrame
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02383720: .word 0x00001013
#ifdef JAPAN
_02383724: .word 0x00001D3C
#else
_02383724: .word 0x000008E4
#endif
_02383728: .word DUNGEON_WINDOW_PARAMS_8
	arm_func_end ov31_0238367C

	arm_func_start ov31_0238372C
ov31_0238372C: ; 0x0238372C
	stmdb sp!, {r3, lr}
	ldr r1, _02383764 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r1, [r1, #0x1b1]
	cmp r1, #0
	beq _0238375C
	add r0, r0, #4
	bl PositionHasItem
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_0238375C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383764: .word OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	arm_func_end ov31_0238372C

	arm_func_start ov31_02383768
ov31_02383768: ; 0x02383768
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb r0, [r7]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov10_022BCD10
	cmp r0, #0
	beq _023837B4
	mvn r4, #3
	sub r5, r4, #1
	mov r6, #0x62
_02383798:
	mov r0, r6
	bl AdvanceFrame
	ldrsb r0, [r7]
	bl sub_020282F4
	cmp r0, r5
	cmpne r0, r4
	bne _02383798
_023837B4:
	ldrsb r0, [r7]
	bl CloseInventoryMenu
	mvn r0, #1
	strb r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov31_02383768

	arm_func_start ov31_023837C8
ov31_023837C8: ; 0x023837C8
	stmdb sp!, {r3, lr}
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x92
	add r0, r0, #0x1100
	bl ov29_0234E988
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x94]
	cmp r0, r1
	beq _02383800
	bl CloseTextBox2
_02383800:
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x95]
	cmp r0, r1
	beq _02383820
	bl CloseTextBox2
_02383820:
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x93
	add r0, r0, #0x1100
	bl ov31_02383768
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02383850 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02383850: .word OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	arm_func_end ov31_023837C8

; https://decomp.me/scratch/VL6fa
	arm_func_start ov31_02383854
ov31_02383854: ; 0x02383854
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0238387C ; =0x000008E6
	bl StringFromId
	mov r1, #2
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
#ifdef JAPAN
_0238387C: .word 0x00001D3E
#else
_0238387C: .word 0x000008E6
#endif
	arm_func_end ov31_02383854

	arm_func_start ov31_02383880
ov31_02383880: ; 0x02383880
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, #0
	mov r7, r0
	add r0, r5, #1
	ldr r8, _023838E0 ; =DUNGEON_PTR
	strb r5, [r7]
	and r6, r0, #0xff
	mov r4, r5
_023838A0:
	ldr r0, [r8]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl ov31_02383658
	cmp r0, #0
	addeq r0, r7, r5
	streqb r4, [r0, #1]
	addne r0, r7, r5
	addne r1, r6, #1
	strneb r6, [r0, #1]
	add r5, r5, #1
	andne r6, r1, #0xff
	cmp r5, #4
	blt _023838A0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023838E0: .word DUNGEON_PTR
	arm_func_end ov31_02383880

	arm_func_start ov31_023838E4
ov31_023838E4: ; 0x023838E4
#ifdef JAPAN
#define OV31_023838E4_OFFSET -0xA4
#else
#define OV31_023838E4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x234
	sub sp, sp, #0x400
	mov r2, #0
	mov r5, r2
	str r2, [sp, #0x30]
	mov sl, r0
	mov sb, r1
	mov r6, r5
	ldr r7, [sl, #0xb4]
	bl ov29_022EBB4C
	mov r0, #0x1280
	mov r1, #8
	bl MemAlloc
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r4, #1
	str r0, [r1]
	add r0, r0, #0x1000
	str sl, [r0, #0x19c]
	ldr r0, [r1]
	add r3, r4, #1
	add r0, r0, #0x1000
	strb r4, [r0, #0x193]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x1000
	strb r4, [r0, #0x192]
	ldr r8, [r1]
	mov r0, #1
	add r8, r8, #0x1000
	strb r4, [r8, #0x194]
	ldr r8, [r1]
	add r8, r8, #0x1000
	strb r4, [r8, #0x195]
	ldr r4, [r1]
	add r4, r4, #0x1000
	str r3, [r4, #0x198]
	ldr r3, [r1]
	add r3, r3, #0x1000
	str r2, [r3, #0x1ac]
	ldr r3, [r1]
	add r3, r3, #0x1000
	strb r0, [r3, #0x1b1]
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0x1b2]
	ldr r0, [r1]
	add r0, r0, #0x1000
	str r2, [r0, #0x1b4]
	ldr r0, [r1]
	add r0, r0, #0x278
	add r0, r0, #0x1000
	bl ov31_02383880
	cmp sb, #0
	beq _02383A1C
	ldrb r0, [sb]
	cmp r0, #0
	beq _023839E4
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [sb, #4]
	ldr r0, [r0]
	mov r6, #1
	add r0, r0, #0x1000
	str r1, [r0, #0x1b4]
_023839E4:
	ldrb r0, [sb, #1]
	cmp r0, #0
	ldreq r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	moveq r1, #0
	ldreq r0, [r0]
	addeq r0, r0, #0x1000
	streqb r1, [r0, #0x1b1]
	ldrb r0, [sb, #2]
	cmp r0, #0
	ldrne r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x1000
	strneb r1, [r0, #0x1b2]
_02383A1C:
	mov r0, #3
	bl Arm9LoadUnkFieldNa0x2029EC8
	mov r1, r0
	ldr r0, _0238489C ; =OVERLAY31_JP_STRING
	bl Debug_Print0
	bl GetNbItemsInBag
	ldr r2, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	cmp r6, #0
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x1a8]
	ldrne r0, [r2]
	movne r1, #0
	addne r0, r0, #0x1000
	strneb r1, [r0, #0x1b3]
	bne _02383A74
	mov r0, sl
	bl ov31_0238372C
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r1]
	add r1, r1, #0x1000
	strb r0, [r1, #0x1b3]
_02383A74:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r2, [r0]
	add r0, r2, #0x1000
	ldrb r1, [r0, #0x1b2]
	cmp r1, #0
	ldreq r1, [r0, #0x1a8]
	cmpeq r1, #0
	ldreqb r0, [r0, #0x1b3]
	cmpeq r0, #0
	bne _02383AC4
	ldr r1, _023848A0 ; =0x000008E5
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl ov31_023837C8
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	b _0238511C
_02383AC4:
	add r0, r2, #0x1000
	ldr r0, [r0, #0x1a8]
	cmp r0, #0
	bne _02383B08
	mov r0, sl
	bl ov31_0238372C
	ldr r2, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r3, #1
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x1b3]
	ldr r0, [r2]
	add r0, r0, #0x1000
	strb r3, [r0, #0x1b2]
	ldr r0, [r2]
	add r0, r0, #0x1000
	strb r3, [r0, #0x1b1]
_02383B08:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	cmp r0, r1
	beq _02383B48
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _02383D78
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCC7C
	b _02383D78
_02383B48:
	bl GetNbItemsInBag
	ldr r4, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r4]
	add r1, r1, #0x1000
	str r0, [r1, #0x1a8]
	ldr r0, [r4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x1a8]
	cmp r0, #0
	beq _02383C44
	ldr fp, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	mov r8, #0
_02383B78:
	mov r0, #6
	mul r1, r8, r0
	ldr r0, [fp]
	ldr r2, [r0, #0x384]
	ldrb r0, [r2, r1]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02383BD8
	ldrb r0, [r2, r1]
	tst r0, #4
	beq _02383BD8
	bic r0, r0, #4
	strb r0, [r2, r1]
	ldr r1, [r4]
	mov r0, #3
	add r1, r1, #0x1000
	str r8, [r1, #0x1ac]
	ldr r1, [r4]
	add r1, r1, #0x1000
	ldr r1, [r1, #0x1ac]
	and r1, r1, #0xff
	bl Arm9StoreUnkFieldNa0x2029ED8
_02383BD8:
	add r8, r8, #1
	cmp r8, #0x32
	blt _02383B78
	ldr fp, _023848A8 ; =DUNGEON_PTR
	mov r4, #0
_02383BEC:
	ldr r0, [fp]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r8, [r0, #0xb28 + OV31_023838E4_OFFSET]
	mov r0, r8
	bl ov31_02383658
	cmp r0, #0
	beq _02383C38
	ldr r1, [r8, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02383C38
	ldrb r0, [r1, #0x62]
	tst r0, #4
	bicne r0, r0, #4
	strneb r0, [r1, #0x62]
_02383C38:
	add r4, r4, #1
	cmp r4, #4
	blt _02383BEC
_02383C44:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r4, [r0]
	add r0, r4, #0x1000
	ldrb r1, [r0, #0x1b2]
	cmp r1, #0
	bne _02383D1C
	ldr r0, [r0, #0x1a8]
	cmp r0, #0
	beq _02383D1C
	mov r0, #3
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r2, _023848AC ; =ov31_02383478
	add r1, r4, #0x278
	str r2, [sp]
	add r1, r1, #0x1000
	str r1, [sp, #4]
	add r1, r4, #0x1000
	ldrb r2, [r1, #0x1b3]
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	add r3, r4, #0x1f8
	str r2, [sp, #8]
	ldr r1, [r1]
	mov r2, r0
	add r0, r1, #0x1000
	ldr r0, [r0, #0x1a8]
	mov r1, r6
	add r3, r3, #0x1000
	bl ov10_022BD474
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	cmp r6, #0
	ldr r1, [r1]
	add r1, r1, #0x1000
	strb r0, [r1, #0x193]
	beq _02383CEC
	ldr r0, _023848B0 ; =DUNGEON_WINDOW_PARAMS_10
	ldr r1, _023848B4 ; =ov31_02383854
	bl CreateTextBox
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r1]
	add r1, r1, #0x1000
	strb r0, [r1, #0x194]
	b _02383D78
_02383CEC:
	ldr r0, _023848B8 ; =DUNGEON_WINDOW_PARAMS_11
	mov r1, #0
	bl CreateTextBox
	ldr r2, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r3, #0
	ldr r1, [r2]
	add r1, r1, #0x1000
	strb r0, [r1, #0x195]
	ldr r0, [r2]
	add r0, r0, #0x1000
	str r3, [r0, #0x198]
	b _02383D78
_02383D1C:
	ldr r3, _023848BC ; =0x000008E3
	add r0, sp, #0x540
	add r1, r4, #0x278
	strh r3, [r0, #0x64]
	mov r2, #0x10
	str r2, [sp, #0x5a8]
	add r0, r1, #0x1000
	str r0, [sp]
	mov r4, #1
	str r4, [sp, #4]
	add r2, sp, #0x500
	str r4, [sp, #8]
	mov r4, #0
	ldr r0, _023848C0 ; =DUNGEON_WINDOW_PARAMS_12
	ldr r1, _023848C4 ; =0x00400813
	ldr r3, _023848AC ; =ov31_02383478
	add r2, r2, #0x9c
	str r4, [sp, #0xc]
	bl CreateInventoryMenu
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r1]
	add r1, r1, #0x1000
	strb r0, [r1, #0x193]
_02383D78:
	mvn r0, #0
	str r0, [sp, #0x38]
	sub r0, r0, #1
	ldr r4, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	str r0, [sp, #0x3c]
_02383D8C:
	mov r0, #0x14
	bl AdvanceFrame
	mov r0, #0
	add r1, sp, #0x42
	bl GetPressedButtons
	ldr r1, [r4]
	add r0, r1, #0x1000
	ldrb r0, [r0, #0x1b2]
	cmp r0, #0
	bne _023843D0
	add r0, r1, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCE44
	mov fp, r0
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl PopInventoryMenuField0x1A3
	str r0, [sp, #0x2c]
	ldr r0, [r4]
	add r1, r0, #0x1100
	ldrsb r8, [r1, #0x95]
	ldr r0, [sp, #0x3c]
	cmp r8, r0
	beq _02384054
	ldrsb r0, [r1, #0x93]
	bl ov10_022BCE44
	cmp r0, #0
	ldr r0, [r4]
	bne _02383F7C
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDA8
	str r0, [sp, #0x34]
	ldr r0, [r4]
	add r1, r0, #0x1000
	ldr r2, [r1, #0x198]
	ldr r0, [sp, #0x34]
	cmp r2, r0
	beq _02384054
	str r0, [r1, #0x198]
	ldr r1, [r4]
	mov r0, r8
	add r1, r1, #0x1000
	ldr r1, [r1, #0x19c]
	str r1, [sp, #0x28]
	bl sub_02027B1C
	ldr r1, [sp, #0x34]
	mov r0, #6
	mul r2, r1, r0
	ldr r0, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	add r1, r0, r2
	ldrb r0, [r0, r2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02383F28
	ldrb r0, [r1, #1]
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _02383F00
	ldr r1, _023848A8 ; =DUNGEON_PTR
	add r0, sp, #0x400
	ldr r3, [r1]
	ldr r1, [sp, #0x10]
	add r0, r0, #0x4c
	add r1, r3, r1, lsl #2
	add r1, r1, #0x12000
	ldr r1, [r1, #0xb24 + OV31_023838E4_OFFSET]
	mov r2, #0
	bl ov29_022E2A78
	add r0, sp, #0x400
	add r0, r0, #0x4c
	str r0, [sp, #0x584]
	add r0, sp, #0x500
#ifdef JAPAN
	ldr r2, [sp, #0x38]
	add r0, r0, #0x4c
	str r0, [sp]
	add r0, sp, #0x4c
	mov r1, #0x400
	add r2, r2, #0x1d40
#else
	add r0, r0, #0x4c
	str r0, [sp]
	ldr r2, _023848C8 ; =0x000008E7
	add r0, sp, #0x4c
	mov r1, #0x400
#endif
	mov r3, #0
	bl PreprocessStringFromId
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldr r0, [sp, #0x10]
	add r0, r1, r0, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb24 + OV31_023838E4_OFFSET]
	str r0, [sp, #0x28]
	b _02383F34
_02383F00:
	ldrsh r0, [r1, #4]
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
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	add r0, sp, #0x4c
	bl strcpy
	b _02383F34
_02383F28:
	ldr r1, _023848CC ; =ov31_02389F5C
	add r0, sp, #0x4c
	bl strcpy
_02383F34:
	mov r1, #2
	mov r0, r8
	mov r2, r1
	add r3, sp, #0x4c
	bl DrawTextInWindow
	mov r0, r8
	bl UpdateWindow
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	ldr r0, [sp, #0x28]
	mov r2, #1
	add r0, r0, #4
	mov r1, #0
	mov r3, r2
	bl DrawTileGrid
	b _02384054
_02383F7C:
	add r0, r0, #0x1000
	ldr r1, [r0, #0x198]
	cmp r1, #0x7f
	beq _02384054
	ldr r1, [r0, #0x19c]
	ldrsh r0, [r1, #4]
	ldrsh r1, [r1, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	bl GetItemInfo
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _02383FE4
	ldrsh r0, [r0, #4]
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
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r1, r0
	add r0, sp, #0x4c
	bl strcpy
	b _02383FF0
_02383FE4:
	ldr r1, _023848CC ; =ov31_02389F5C
	add r0, sp, #0x4c
	bl strcpy
_02383FF0:
	mov r0, r8
	bl sub_02027B1C
	mov r1, #2
	mov r0, r8
	mov r2, r1
	add r3, sp, #0x4c
	bl DrawTextInWindow
	mov r0, r8
	bl UpdateWindow
	ldr r0, [r4]
	mov r1, #0
	add r2, r0, #0x1000
	mov r0, #0x7f
	str r0, [r2, #0x198]
	ldr r0, [r4]
	mov r2, #1
	add r0, r0, #0x1000
	ldr r8, [r0, #0x19c]
	mov r0, r8
	bl TryPointCameraToMonster
	mov r2, #1
	add r0, r8, #4
	mov r1, #0
	mov r3, r2
	bl DrawTileGrid
_02384054:
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl IsInventoryMenuActive
	cmp r0, #0
	beq _02384088
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDA8
	and r1, r0, #0xff
	mov r0, #3
	bl Arm9StoreUnkFieldNa0x2029ED8
_02384088:
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl IsInventoryMenuActive
	cmp r0, #0
	bne _023841A4
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDBC
	movs r4, r0
	bmi _0238419C
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	and r1, r4, #0xff
	ldr r2, [r0]
	mov r0, #3
	add r2, r2, #0x1000
	str r4, [r2, #0x1ac]
	bl Arm9StoreUnkFieldNa0x2029ED8
	cmp fp, #0
	bne _02384138
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r0, #6
	ldr r1, [r1]
	mul r8, r4, r0
	add r0, r1, #0x1000
	ldrb r3, [r0, #0x1b2]
	ldr r2, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	add r1, sl, #4
	str r3, [sp]
	ldr r2, [r2]
	ldr r0, [r0, #0x1ac]
	ldr r2, [r2, #0x384]
	mov r3, #0
	add r2, r2, r8
	ldrb r2, [r2, #1]
	bl ov29_022EBAB0
	ldr r0, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	add r0, r0, r8
	str r0, [sb, #4]
	b _02384194
_02384138:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	add r1, sl, #4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x1b2]
	mov r3, #1
	str r4, [sp]
	ldr r0, [r0, #0x1ac]
	bl ov29_022EBAB0
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	bl GetItemInfo
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	strne r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb, #4]
_02384194:
	mov r4, #1
	b _02384438
_0238419C:
	mov r4, #2
	b _02384438
_023841A4:
	ldrh r0, [sp, #0x42]
	tst r0, #8
	beq _023842DC
	ldr r0, _023848D0 ; =0x00003F04
	bl sub_02017C80
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDF4
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDBC
	ldr r2, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r2]
	add r1, r1, #0x1000
	str r0, [r1, #0x1ac]
	ldr r1, [r2]
	mov r0, #3
	add r1, r1, #0x1000
	ldr r1, [r1, #0x1ac]
	and r1, r1, #0xff
	bl Arm9StoreUnkFieldNa0x2029ED8
	cmp fp, #0
	bne _02384278
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r3, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	mov r2, #6
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x1b2]
	ldr r0, [r0, #0x1ac]
	add r1, sl, #4
	str r4, [sp]
	ldr r4, [r3]
	mov r3, #0
	ldr r4, [r4, #0x384]
	mla r2, r0, r2, r4
	ldrb r2, [r2, #1]
	bl ov29_022EBAB0
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r1, [r1]
	add r0, r0, #0x1000
	ldr r2, [r1, #0x384]
	ldr r1, [r0, #0x1ac]
	mov r0, #6
	mla r0, r1, r0, r2
	str r0, [sb, #4]
	b _023842D4
_02384278:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	add r1, sl, #4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x1b2]
	mov r3, #1
	str r4, [sp]
	ldr r0, [r0, #0x1ac]
	bl ov29_022EBAB0
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	bl GetItemInfo
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	strne r0, [sb, #4]
	moveq r0, #0
	streq r0, [sb, #4]
_023842D4:
	mov r4, #3
	b _02384438
_023842DC:
	tst r0, #4
	bne _023842F4
	tst r0, #0x800
	ldreq r0, [sp, #0x2c]
	cmpeq r0, #0
	beq _02383D8C
_023842F4:
	cmp r6, #0
	cmpeq fp, #0
	bne _02383D8C
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02384314
	mov r0, #5
	bl PlaySeVolumeWrapper
_02384314:
	bl ov29_02346E5C
	bl SortItemsInBag
	mov r8, #0
_02384320:
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
	ldr fp, [r0, #0xb28 + OV31_023838E4_OFFSET]
	mov r0, fp
	bl ov31_02383658
	cmp r0, #0
	beq _02384374
	ldr r1, [fp, #0xb4]
	ldrb r0, [r1, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02384374
	ldrsh r0, [r1, #0x66]
	cmp r0, #0xb7
	bne _02384374
	add r0, r1, #0x62
	bl ItemZInit
_02384374:
	add r8, r8, #1
	cmp r8, #4
	blt _02384320
	ldr r0, [r4]
	add r1, r0, #0x1000
	ldr r0, [sp, #0x38]
	str r0, [r1, #0x198]
	bl GetNbItemsInBag
	movs r1, r0
	beq _023843C0
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCC60
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCCB0
	b _02383D8C
_023843C0:
	mov r0, #1
	str r0, [sp, #0x30]
	mov r4, #2
	b _02384438
_023843D0:
	add r0, r1, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCDF4
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	add r1, sl, #4
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x1b2]
	mov r3, #1
	str r4, [sp]
	ldr r0, [r0, #0x1ac]
	bl ov29_022EBAB0
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	bl GetItemInfo
	ldrb r1, [r0]
	mov r4, #1
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	str r0, [sb, #4]
_02384438:
	mov r0, #0x14
	bl AdvanceFrame
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r1, [r0]
	add r0, r1, #0x1000
	ldrb r0, [r0, #0x1b2]
	cmp r0, #0
	bne _02384490
	add r0, r1, #0x1100
	ldrsb r0, [r0, #0x93]
	bl ov10_022BCE44
	cmp r0, #0
	bne _02384490
	ldr r0, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	ldrb r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r4, #2
_02384490:
	cmp r4, #2
	bne _023844AC
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r5, #1
	b _023850D8
_023844AC:
	cmp r4, #0
	beq _023850D8
	cmp r4, #3
	bne _023844D8
	add r0, r7, #0x4a
	bl ov29_022EBBE8
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r5, #0
	b _023850D8
_023844D8:
	cmp r6, #0
	beq _023844FC
	add r0, r7, #0x54
	bl ov29_022EBB68
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r5, #0
	b _023850D8
_023844FC:
	bl ov29_022EBB8C
	mov r1, r0
	mov r0, sl
	mov r2, #0xa
	bl GetItemToUseByIndex
	mov r8, r0
	ldr r0, [sl, #0xb4]
	str r0, [sp, #0x14]
	bl ov29_022EBA70
	bl ov29_022EBB98
	cmp r0, #0x90
	bhs _023849F4
	bl ov29_022EBB98
	cmp r0, #0x80
	bne _02384598
	ldrsh r1, [r8, #4]
	mov r0, #9
	bl AddDungeonSubMenuOption
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #6
	beq _02384598
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75b]
	cmp r0, #0
	beq _02384570
	bl IsBagFull
	b _02384588
_02384570:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x62]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02384588:
	cmp r0, #0
	beq _02384598
	mov r0, #9
	bl DisableDungeonSubMenuOption
_02384598:
	bl ov29_022EBB98
	cmp r0, #0x80
	bne _023845C4
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75b]
	cmp r0, #0
	beq _023845C4
	ldrsh r1, [r8, #4]
	mov r0, #0xa
	bl AddDungeonSubMenuOption
_023845C4:
	mov r0, r8
	bl GetItemAction
	movs r4, r0
	beq _02384654
	ldrsh r1, [r8, #4]
	bl AddDungeonSubMenuOption
	ldrb r0, [r8]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023845FC
	mov r0, r4
	bl DisableDungeonSubMenuOption
_023845FC:
	mov r0, r8
	bl ov29_023468FC
	cmp r0, #0
	bne _02384614
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384614:
	mov r0, sl
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	bne _02384634
	mov r0, r8
	bl ov29_02348D00
	cmp r0, #0
	beq _0238463C
_02384634:
	mov r0, r4
	bl DisableDungeonSubMenuOption
_0238463C:
	mov r0, r8
	bl IsItemUsableNow
	cmp r0, #0
	bne _02384654
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384654:
	bl ov29_022EBB98
	cmp r0, #0x33
	bhs _02384728
	ldrb r0, [r8, #1]
	cmp r0, #0
	bne _02384728
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0
	beq _0238468C
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _02384728
_0238468C:
	ldrb r0, [r8]
	ldrsh r1, [r8, #4]
	tst r0, #0x10
	beq _023846A8
	mov r0, #0x3d
	bl AddDungeonSubMenuOption
	b _023846B0
_023846A8:
	mov r0, #0x3c
	bl AddDungeonSubMenuOption
_023846B0:
	ldr r0, _023848A4 ; =BAG_ITEMS_PTR_MIRROR
	mov r3, #0
	ldr r4, [r0]
	mov lr, #1
	mov r0, #6
	b _02384720
_023846C8:
	mul r1, r3, r0
	ldr r2, [r4, #0x384]
	ldrb fp, [r2, r1]
	tst fp, #1
	movne ip, lr
	moveq ip, #0
	tst ip, #0xff
	beq _0238471C
	ldrb r1, [r2, r1]
	tst r1, #0x10
	beq _0238471C
	tst fp, #8
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0238471C
	mov r0, #0x3c
	bl DisableDungeonSubMenuOption
	mov r0, #0x3d
	bl DisableDungeonSubMenuOption
	b _02384728
_0238471C:
	add r3, r3, #1
_02384720:
	cmp r3, #0x32
	blt _023846C8
_02384728:
	bl ov29_022EBB98
	cmp r0, #0x81
	beq _02384804
	bl ov29_022EBB98
	cmp r0, #0x80
	beq _02384860
	ldrsh r1, [r8, #4]
	mov r2, #0
	mov r0, #0x36
	str r2, [sp, #0x18]
	bl AddDungeonSubMenuOption
	mov r4, #0
_02384758:
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV31_023838E4_OFFSET]
	str r0, [sp, #0x1c]
	bl ov31_02383658
	cmp r0, #0
	beq _023847A0
	ldr r0, [sp, #0x1c]
	mov r1, #0
	ldr fp, [r0, #0xb4]
#ifdef JAPAN
	strb r1, [fp, #0x15d]
#else
	strb r1, [fp, #0x161]
#endif
	bl ov29_02300BF8
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x18]
#ifdef JAPAN
	streqb r0, [fp, #0x15d]
#else
	streqb r0, [fp, #0x161]
#endif
_023847A0:
	add r4, r4, #1
	cmp r4, #4
	blt _02384758
	add r0, sp, #0x40
	bl sub_0204F10C
	cmp r0, #0
	beq _023847EC
	bl GetCurrentBagCapacity
	cmp r0, #2
	bge _023847EC
	ldrsh r0, [sp, #0x40]
	sub r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	movls r0, #0
	strls r0, [sp, #0x18]
_023847EC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _02384860
	mov r0, #0x36
	bl DisableDungeonSubMenuOption
	b _02384860
_02384804:
	ldr r0, _023848A8 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75b]
	cmp r0, #0
	beq _02384860
	ldrsh r1, [r8, #4]
	mov r0, #0x37
	bl AddDungeonSubMenuOption
	mov r0, r8
	bl IsHeldItemInBag
	cmp r0, #0
	beq _02384840
	ldrsh r1, [r8, #4]
	mov r0, #0x3e
	bl AddDungeonSubMenuOption
_02384840:
	mov r0, sl
	bl CheckVariousConditions
	cmp r0, #0
	beq _02384860
	mov r0, #0x37
	bl DisableDungeonSubMenuOption
	mov r0, #0x3e
	bl DisableDungeonSubMenuOption
_02384860:
	bl ov29_022EBB98
	cmp r0, #0x33
	bhs _02384908
	ldrsh r0, [sl, #4]
	ldrsh r1, [sl, #6]
	bl GetTile
	mov r4, r0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _023848D4
	ldrsh r1, [r8, #4]
	mov r0, #8
	bl AddDungeonSubMenuOption
	b _02384908
	.align 2, 0
#ifdef JAPAN
#define OV31_023838E4_OFFSET_2 0x1458
#else
#define OV31_023838E4_OFFSET_2 0
#endif
_02384898: .word OVERLAY31_UNKNOWN_POINTER__NA_238A26C
_0238489C: .word OVERLAY31_JP_STRING
_023848A0: .word 0x000008E5 + OV31_023838E4_OFFSET_2
_023848A4: .word BAG_ITEMS_PTR_MIRROR
_023848A8: .word DUNGEON_PTR
_023848AC: .word ov31_02383478
_023848B0: .word DUNGEON_WINDOW_PARAMS_10
_023848B4: .word ov31_02383854
_023848B8: .word DUNGEON_WINDOW_PARAMS_11
_023848BC: .word 0x000008E3 + OV31_023838E4_OFFSET_2
_023848C0: .word DUNGEON_WINDOW_PARAMS_12
_023848C4: .word 0x00400813
#ifndef JAPAN
_023848C8: .word 0x000008E7
#endif
_023848CC: .word ov31_02389F5C
_023848D0: .word 0x00003F04
_023848D4:
	ldr r0, [r0]
	cmp r0, #3
	bne _02384908
	ldrsh r1, [r8, #4]
	mov r0, #0x3a
	bl AddDungeonSubMenuOption
	ldr r0, [r4, #0x10]
	bl ov29_022E1620
	bl ov29_02348D00
	cmp r0, #0
	beq _02384908
	mov r0, #0x3a
	bl DisableDungeonSubMenuOption
_02384908:
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0
	bne _02384928
	ldrsh r1, [r8, #4]
	mov r0, #0x27
	bl AddDungeonSubMenuOption
	b _02384950
_02384928:
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	ldrsh r1, [r8, #4]
	bne _02384948
	mov r0, #0x41
	bl AddDungeonSubMenuOption
	b _02384950
_02384948:
	mov r0, #0xb
	bl AddDungeonSubMenuOption
_02384950:
	ldr r0, [sp, #0x14]
	bl MonsterCanThrowItems
	cmp r0, #0
	bne _02384978
	mov r0, #0x27
	bl DisableDungeonSubMenuOption
	mov r0, #0x41
	bl DisableDungeonSubMenuOption
	mov r0, #0xb
	bl DisableDungeonSubMenuOption
_02384978:
	mov r0, sl
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	beq _023849A0
	mov r0, #0x27
	bl DisableDungeonSubMenuOption
	mov r0, #0x41
	bl DisableDungeonSubMenuOption
	mov r0, #0xb
	bl DisableDungeonSubMenuOption
_023849A0:
	mov r0, r8
	bl ov29_02348D00
	cmp r0, #0
	beq _023849D8
	mov r0, #0x27
	bl DisableDungeonSubMenuOption
	mov r0, #0x41
	bl DisableDungeonSubMenuOption
	mov r0, #0xb
	bl DisableDungeonSubMenuOption
	mov r0, #0xa
	bl DisableDungeonSubMenuOption
	mov r0, #9
	bl DisableDungeonSubMenuOption
_023849D8:
	mov r0, r8
	bl IsItemUsableNow
	cmp r0, #0
	bne _02384C48
	mov r0, #0xb
	bl DisableDungeonSubMenuOption
	b _02384C48
_023849F4:
	bl ov29_022EBB98
	ldr r1, _023848A8 ; =DUNGEON_PTR
	sub r2, r0, #0x90
	ldr r0, [r1]
	add r0, r0, r2, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV31_023838E4_OFFSET]
	str r0, [sp, #0x20]
	bl ov31_02383658
	cmp r0, #0
	beq _02384C48
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #0x24]
	mov r1, r0
	ldr fp, [r1, #0xb4]
	bl CheckVariousConditions
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x24]
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #5
	ldrsh r0, [r8, #4]
	moveq r4, #1
	bl GetItemCategoryVeneer
	cmp r0, #9
	ldr r0, _023848A8 ; =DUNGEON_PTR
	moveq r4, #1
	ldr r0, [r0]
	ldrb r0, [r0, #0x75b]
	cmp r0, #0
	beq _02384AC0
	ldrsh r1, [r8, #4]
	mov r0, #0x37
	bl AddDungeonSubMenuOption
	mov r0, r8
	bl IsHeldItemInBag
	cmp r0, #0
	beq _02384AA4
	ldrsh r1, [r8, #4]
	mov r0, #0x3e
	bl AddDungeonSubMenuOption
_02384AA4:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02384AC0
	mov r0, #0x37
	bl DisableDungeonSubMenuOption
	mov r0, #0x3e
	bl DisableDungeonSubMenuOption
_02384AC0:
	ldrb r0, [fp, #7]
	cmp r0, #0
	beq _02384BEC
	mov r0, r8
	bl GetItemAction
	movs r4, r0
	beq _02384B5C
	ldrsh r1, [r8, #4]
	bl AddDungeonSubMenuOption
	ldrb r0, [r8]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02384B04
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384B04:
	mov r0, r8
	bl ov29_023468FC
	cmp r0, #0
	bne _02384B1C
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384B1C:
	ldr r0, [sp, #0x20]
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	bne _02384B3C
	mov r0, r8
	bl ov29_02348D00
	cmp r0, #0
	beq _02384B44
_02384B3C:
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384B44:
	mov r0, r8
	bl IsItemUsableNow
	cmp r0, #0
	bne _02384B5C
	mov r0, r4
	bl DisableDungeonSubMenuOption
_02384B5C:
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #0
	bne _02384B7C
	ldrsh r1, [r8, #4]
	mov r0, #0x27
	bl AddDungeonSubMenuOption
	b _02384B98
_02384B7C:
	ldrsh r0, [r8, #4]
	bl GetItemCategoryVeneer
	cmp r0, #1
	bne _02384B98
	ldrsh r1, [r8, #4]
	mov r0, #0x41
	bl AddDungeonSubMenuOption
_02384B98:
	ldr r0, [sp, #0x14]
	bl MonsterCanThrowItems
	cmp r0, #0
	bne _02384BB8
	mov r0, #0x27
	bl DisableDungeonSubMenuOption
	mov r0, #0x41
	bl DisableDungeonSubMenuOption
_02384BB8:
	mov r0, sl
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	bne _02384BD8
	mov r0, sl
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	beq _02384C48
_02384BD8:
	mov r0, #0x27
	bl DisableDungeonSubMenuOption
	mov r0, #0x41
	bl DisableDungeonSubMenuOption
	b _02384C48
_02384BEC:
	ldrsh r1, [r8, #4]
	mov r0, #0x38
	bl AddDungeonSubMenuOption
	cmp r4, #0
	beq _02384C08
	mov r0, #0x38
	bl DisableDungeonSubMenuOption
_02384C08:
	ldr r0, [sp, #0x20]
	bl MonsterHasEmbargoStatus
	cmp r0, #0
	bne _02384C28
	mov r0, r8
	bl ov29_02348D00
	cmp r0, #0
	beq _02384C30
_02384C28:
	mov r0, #0x38
	bl DisableDungeonSubMenuOption
_02384C30:
	mov r0, r8
	bl IsItemUsableNow
	cmp r0, #0
	bne _02384C48
	mov r0, #0x38
	bl DisableDungeonSubMenuOption
_02384C48:
	ldrsh r1, [r8, #4]
	mov r0, #0xc
	bl AddDungeonSubMenuOption
	bl ov29_022EB9A0
	bl ov29_022EBA84
	mov r2, #0
	ldr r1, _02385128 ; =ov29_0237C91C
	ldr r4, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	b _02384C9C
_02384C6C:
	add r8, r1, r2, lsl #3
	ldr r3, [r4]
	ldrh r8, [r8, #6]
	add r3, r3, r2, lsl #3
	add r3, r3, #0x1100
	strh r8, [r3, #0x38]
	mov r8, r2, lsl #3
	ldr r3, [r4]
	add r2, r2, #1
	add r3, r3, r8
	add r3, r3, #0x1000
	str r2, [r3, #0x13c]
_02384C9C:
	cmp r2, r0
	blt _02384C6C
	ldr r3, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
#ifdef JAPAN
	mov r4, #0x1d40
#else
	ldr r4, _0238512C ; =0x000008E8
#endif
	ldr r1, [r3]
	mvn r0, #0
	add r1, r1, r2, lsl #3
	add r1, r1, #0x1100
	strh r4, [r1, #0x38]
	ldr r1, [r3]
	mov r4, #0
	add r1, r1, r2, lsl #3
	add r1, r1, #0x1000
	str r0, [r1, #0x13c]
	ldr r1, [r3]
	add r1, r1, r2, lsl #3
	add r1, r1, #0x1100
	strh r4, [r1, #0x40]
	ldr r1, [r3]
	add r1, r1, r2, lsl #3
	add r1, r1, #0x1000
	str r0, [r1, #0x144]
	ldr r0, [r3]
	add r0, r0, #0x92
	add r0, r0, #0x1100
	bl ov29_0234E988
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r2, r4
	ldr r1, [r0]
	add r0, r1, #0x138
	add r1, r1, #0x188
	add r0, r0, #0x1000
	add r1, r1, #0x1000
	bl ov31_0238513C
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	add r2, sp, #0x500
	ldr r1, [r0]
	add r2, r2, #0x9c
	add r0, r1, #0x188
	add r0, r0, #0x1000
	str r0, [sp, #0x5fc]
	add r0, r1, #0x1000
	add r3, r1, #0x138
	ldrb r0, [r0, #0x1b2]
	ldr r1, _02385130 ; =0x00000213
	add r3, r3, #0x1000
	cmp r0, #0
	ldrne r0, _02385134 ; =DUNGEON_WINDOW_PARAMS_13
	ldreq r0, _02385138 ; =DUNGEON_WINDOW_PARAMS_9
	bl CreateParentMenuFromStringIds
	ldr r4, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r8, #0x14
	ldr r1, [r4]
	add r1, r1, #0x1000
	strb r0, [r1, #0x192]
_02384D78:
	ldr r0, [r4]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x92]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02384E24
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x92]
	bl sub_0202ABB0
	cmp r0, #0
	blt _02384E04
	ldr r1, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	sub r2, r0, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	str r2, [r0, #0x1a4]
	ldr r0, [r1]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x1a4]
	bl ov29_022EB804
	cmp r0, #0
	mov r4, #0
	beq _02384E30
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r2, _02385128 ; =ov29_0237C91C
	ldr r1, [r0]
	add r0, r7, #0x4a
	add r1, r1, #0x1000
	ldr r1, [r1, #0x1a4]
	mov r1, r1, lsl #3
	ldrh r1, [r2, r1]
	bl ov29_022EBBA8
	b _02384E30
_02384E04:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mov r4, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x1b2]
	cmp r0, #0
	movne r4, #2
	b _02384E30
_02384E24:
	mov r0, r8
	bl AdvanceFrame
	b _02384D78
_02384E30:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x92
	add r0, r0, #0x1100
	bl ov29_0234E988
	ldr r0, _023848A8 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	cmp r4, #1
	add r0, r0, #0x1a000
#ifdef JAPAN
	strb r1, [r0, #0x1a3]
#else
	strb r1, [r0, #0x247]
#endif
	ldreq r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldreq r0, [r0]
	addeq r0, r0, #0x1000
	ldreqb r0, [r0, #0x1b2]
	cmpeq r0, #0
	beq _02383B08
	cmp r4, #2
	bne _02384E90
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r5, #1
	b _023850D8
_02384E90:
	ldrh r0, [r7, #0x4a]
	cmp r0, #0x38
	cmpne r0, #0x37
	cmpne r0, #0x3e
	bne _02384EC4
	bl ov29_022EBB98
	sub r2, r0, #0x90
	mov r0, #0xb
	mov r1, #0
	strb r2, [r7, #0x4e]
	bl ov29_022EA428
	mov r5, #0
	b _023850D8
_02384EC4:
	cmp r0, #0x36
	bne _02384FA0
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x94]
	cmp r0, r1
	beq _02384F00
	bl CloseTextBox2
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0x194]
_02384F00:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x95]
	cmp r0, r1
	beq _02384F34
	bl CloseTextBox2
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0x195]
_02384F34:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x93
	add r0, r0, #0x1100
	bl ov31_02383768
	mov r0, #0x62
	bl AdvanceFrame
	add r0, sp, #0x48
	mov r1, #2
	mov r2, #0
#ifndef JAPAN
	mov r3, #1
#endif
	bl ov31_023877EC
	cmp r0, #0
	beq _02384F88
	ldr r2, [sp, #0x48]
	mov r0, #0
	mov r1, r0
	strb r2, [r7, #0x54]
	bl ov29_022EA428
	mov r5, #0
	b _023850D8
_02384F88:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_022EB398
	b _02383B08
_02384FA0:
	cmp r0, #0x12
	beq _02384FC0
	add r0, r0, #0xf3
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _023850C8
_02384FC0:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x94]
	cmp r0, r1
	beq _02384FF4
	bl CloseTextBox2
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0x194]
_02384FF4:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1100
	ldrsb r0, [r0, #0x95]
	cmp r0, r1
	beq _02385028
	bl CloseTextBox2
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x1000
	strb r1, [r0, #0x195]
_02385028:
	ldr r0, _02384898 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A26C
	ldr r0, [r0]
	add r0, r0, #0x93
	add r0, r0, #0x1100
	bl ov31_02383768
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #0x62
	bl AdvanceFrame
#ifdef JAPAN
	add r0, sp, #0x44
	mov r1, #3
	mov r2, #1
#else
	mov r2, #1
	add r0, sp, #0x44
	mov r1, #3
	mov r3, r2
#endif
	bl ov31_023877EC
	cmp r0, #0
	beq _023850B0
	ldr r1, [sp, #0x44]
	ldr r0, _023848A8 ; =DUNGEON_PTR
	strb r1, [r7, #0x54]
	ldr r2, [r0]
	ldr r0, [sp, #0x44]
	mov r1, #0
	add r0, r2, r0, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV31_023838E4_OFFSET]
	mov r2, #1
	bl TryPointCameraToMonster
	mov r0, #0
	mov r2, #1
	mov r1, r0
#ifdef JAPAN
	strb r2, [r7, #0x238]
#else
	strb r2, [r7, #0x23c]
#endif
	bl ov29_022EA428
	mov r5, #0
	b _023850D8
_023850B0:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_022EB398
	b _02383B08
_023850C8:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r5, #0
_023850D8:
	ldr r0, _023848A8 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x1a000
	strb r1, [r0, #0x247 + OV31_023838E4_OFFSET]
	bl HideTileGrid
	bl ov31_023837C8
	mov r0, #0x14
	bl AdvanceFrame
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _02385118
	ldr r1, _023848A0 ; =0x000008E5
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_02385118:
	mov r0, r5
_0238511C:
	add sp, sp, #0x234
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02385128: .word ov29_0237C91C
#ifndef JAPAN
_0238512C: .word 0x000008E8
#endif
_02385130: .word 0x00000213
_02385134: .word DUNGEON_WINDOW_PARAMS_13
_02385138: .word DUNGEON_WINDOW_PARAMS_9
	arm_func_end ov31_023838E4

	arm_func_start ov31_0238513C
ov31_0238513C: ; 0x0238513C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl ov29_022EBA84
	mov r4, #0
	mov r5, r0
	mov sb, #3
	mov sl, r4
	b _02385190
_02385164:
	mov r0, r4
	mov r1, r6
	bl ov29_022EB2C8
	mov r1, r4, lsl #3
	strh r0, [r8, r1]
	mov r0, r4
	bl ov29_022EB804
	cmp r0, #0
	strneb sl, [r7, r4]
	streqb sb, [r7, r4]
	add r4, r4, #1
_02385190:
	cmp r4, r5
	blt _02385164
#ifdef JAPAN
	mov r1, r4, lsl #3
	mov r2, #0x1d40
#else
	ldr r2, _023851BC ; =0x000008E8
	mov r1, r4, lsl #3
#endif
	add r0, r4, #1
	strh r2, [r8, r1]
	mov r1, #0
	strb r1, [r7, r4]
	mov r0, r0, lsl #3
	strh r1, [r8, r0]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
#ifndef JAPAN
	.align 2, 0
_023851BC: .word 0x000008E8
#endif
	arm_func_end ov31_0238513C

	arm_func_start MovesMenu
MovesMenu: ; 0x023851C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _023853B8 ; =DUNGEON_PTR
	ldrb r4, [r0, #4]
	ldr r0, [r1]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r5, [r0, #0xa84]
#else
	ldr r5, [r0, #0xb28]
#endif
	str r5, [sp, #8]
_023851E4:
	mov r6, #0
	ldr sb, _023853B8 ; =DUNGEON_PTR
	mov r7, r6
	mov r8, r6
_023851F4:
	ldr r0, [sb]
	add r0, r0, r8, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bl ov29_02302388
	cmp r0, #0
	beq _0238521C
	cmp r8, r4
	moveq r6, r7
	add r7, r7, #1
_0238521C:
	add r8, r8, #1
	cmp r8, #4
	blt _023851F4
	ldr r0, [sp, #8]
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	ldr r0, [sp, #8]
	mov r2, #1
	mov r3, r2
	add r0, r0, #4
	mov r1, #0
	bl DrawTileGrid
	mov r0, #1
	bl ov29_022EB398
	str r7, [sp]
	mov r1, #0
	mov r3, r6
	add r0, sp, #8
	mov r2, #1
	str r1, [sp, #4]
	bl HandleMovesMenu
	cmp r0, #0
	bne _023853B0
	bl ov29_022F0B9C
	cmp r0, #0x1d
	bne _0238529C
	bl GetLeaderAction
	bl ov31_02385FE0
	mov r0, #1
	bl ov29_022EB398
	b _02385380
_0238529C:
	bl ov29_022F0B9C
	cmp r0, #0x1e
	bne _023852CC
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl GetLeaderAction
	mov r1, #0
	bl ov31_023860A4
	mov r0, #1
	bl ov29_022EB398
	b _02385380
_023852CC:
	bl ov29_022F0B9C
	cmp r0, #0x33
	bne _023852FC
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl GetLeaderAction
	mov r1, #0
	bl ov31_023860A4
	mov r0, #1
	bl ov29_022EB398
	b _02385380
_023852FC:
	bl ov29_022F0B9C
	cmp r0, #0x1f
	bne _02385328
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl GetLeaderAction
	bl ov31_0238619C
	mov r0, #1
	bl ov29_022EB398
	b _02385380
_02385328:
	bl ov29_022F0B9C
	cmp r0, #0x20
	bne _02385354
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl GetLeaderAction
	bl ov31_02386204
	mov r0, #1
	bl ov29_022EB398
	b _02385380
_02385354:
	bl ov29_022F0B9C
	cmp r0, #0x21
	bne _02385380
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl GetLeaderAction
	mov r1, #1
	bl ov31_02386308
	mov r0, #1
	bl ov29_022EB398
_02385380:
	bl ov29_022F0B9C
	cmp r0, #0
	beq _023851E4
	mov r0, r5
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov r2, #1
	mov r3, r2
	add r0, r5, #4
	mov r1, #0
	bl DrawTileGrid
_023853B0:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023853B8: .word DUNGEON_PTR
	arm_func_end MovesMenu

	arm_func_start HandleMovesMenuWrapper0
HandleMovesMenuWrapper0: ; 0x023853BC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl HandleMovesMenu
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end HandleMovesMenuWrapper0

	arm_func_start HandleMovesMenuWrapper1
HandleMovesMenuWrapper1: ; 0x023853E0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #1
	str lr, [sp]
	str ip, [sp, #4]
	bl HandleMovesMenu
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end HandleMovesMenuWrapper1

	arm_func_start HandleMovesMenu
HandleMovesMenu: ; 0x02385404
#ifdef JAPAN
#define HANDLE_MOVES_MENU_OFFSET -0xA4
#define HANDLE_MOVES_MENU_OFFSET_2 -4
#else
#define HANDLE_MOVES_MENU_OFFSET 0
#define HANDLE_MOVES_MENU_OFFSET_2 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x12c
	str r1, [sp, #4]
	str r0, [sp]
	mov r0, #0x14
	mov r1, #8
	str r2, [sp, #8]
	bl MemAlloc
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r2, #0
	str r0, [r1, #8]
	str r2, [r0, #0x10]
	mov r0, #0x62
	bl AdvanceFrame
	ldr r0, [sp, #0x154]
	cmp r0, #1
	bne _0238547C
	ldr r0, _02385F74 ; =DUNGEON_WINDOW_PARAMS_14
	bl CreateDialogueBox
	mov r1, #0
	str r0, [sp, #0x14]
	bl sub_0202F474
	ldr r0, _02385F78 ; =0x00003FCD
	bl StringFromId
	mov r2, r0
	ldr r0, [sp, #0x14]
	ldr r1, _02385F7C ; =0x00000404
	mov r3, #0
	bl ShowStringInDialogueBox
	b _023854AC
_0238547C:
	ldr r0, _02385F80 ; =DUNGEON_WINDOW_PARAMS_16
	bl CreateDialogueBox
	mov r1, #0
	str r0, [sp, #0x14]
	bl sub_0202F474
	ldr r0, _02385F84 ; =0x00003FCC
	bl StringFromId
	mov r2, r0
	ldr r0, [sp, #0x14]
	ldr r1, _02385F7C ; =0x00000404
	mov r3, #0
	bl ShowStringInDialogueBox
_023854AC:
	ldr r0, [sp]
	ldr r6, [r0]
	ldr sl, [r6, #0xb4]
	bl GetLeader
	ldr r7, [r0, #0xb4]
	mov r0, r6
	bl sub_0203F9CC
	mov r8, #0
	ldr sb, _02385F88 ; =DUNGEON_PTR
	mov r4, r8
	add fp, sp, #0x2c
_023854D8:
	ldr r0, [sb]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + HANDLE_MOVES_MENU_OFFSET]
	bl ov29_02302388
	cmp r0, #0
	beq _02385514
	ldr r0, [sb]
	str r4, [fp, r8, lsl #2]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + HANDLE_MOVES_MENU_OFFSET]
	cmp r6, r0
	streq r8, [sp, #0x10]
	add r8, r8, #1
_02385514:
	add r4, r4, #1
	cmp r4, #4
	blt _023854D8
	ldr r0, [sp, #0x154]
	ldr r2, [sp, #0x10]
	mov r1, r8
	bl sub_0204018C
	str r0, [sp, #0x18]
	bl sub_02041094
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	str r0, [r1]
	mov r0, #0x1e
	bl AdvanceFrame
_02385548:
	mov r4, #0
	str r4, [sp, #0xc]
	mov sb, r4
	bl ov29_022EA62C
	ldr fp, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
_0238555C:
	bl sub_020407EC
	mov r8, r0
	cmp r8, #9
	addls pc, pc, r8, lsl #2
	b _02385680
_02385570: ; jump table
	b _02385680 ; case 0
	b _0238562C ; case 1
	b _02385678 ; case 2
	b _023855A0 ; case 3
	b _023855A0 ; case 4
	b _023855A8 ; case 5
	b _02385634 ; case 6
	b _0238566C ; case 7
	b _02385650 ; case 8
	b _02385598 ; case 9
_02385598:
	mov sb, #1
	b _02385680
_023855A0:
	mov sb, #1
	b _02385680
_023855A8:
	ldr r0, [sp, #0x18]
	bl sub_02030A18
	mov r1, #0
	str r1, [fp]
	add r1, sp, #0x2c
	str r0, [sp, #0x10]
	ldr sb, [r1, r0, lsl #2]
	ldr r0, _02385F88 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28 + HANDLE_MOVES_MENU_OFFSET]
	ldr r0, [sp]
	ldr sl, [r6, #0xb4]
	str r6, [r0]
	bl GetLeaderMonster
	strb sb, [r0, #0x4e]
	mov r0, r6
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov r2, #1
	add r0, r6, #4
	mov r1, #0
	mov r3, r2
	bl DrawTileGrid
	mov r0, #0
	bl ov29_022EB398
	mov r0, r6
	bl sub_0203F9CC
	bl sub_02041178
	mov sb, #1
	b _02385680
_0238562C:
	mov r4, #1
	b _02385680
_02385634:
	ldrb r1, [r6, #0x24]
	mov r0, #2
	str r0, [sp, #0xc]
	strb r1, [r7, #0x4e]
	ldr r0, [fp]
	strb r0, [r7, #0x54]
	b _02385680
_02385650:
	ldrb r1, [r6, #0x24]
	mov r0, #3
	str r0, [sp, #0xc]
	strb r1, [r7, #0x4e]
	ldr r0, [fp]
	strb r0, [r7, #0x54]
	b _02385680
_0238566C:
	mov r0, #1
	str r0, [sp, #0xc]
	b _02385680
_02385678:
	bl sub_02041094
	str r0, [fp]
_02385680:
	cmp r8, #9
	addls pc, pc, r8, lsl #2
	b _023856D0
_0238568C: ; jump table
	b _023856D0 ; case 0
	b _023856D0 ; case 1
	b _023856D0 ; case 2
	b _023856B4 ; case 3
	b _023856B4 ; case 4
	b _023856C4 ; case 5
	b _023856D0 ; case 6
	b _023856D0 ; case 7
	b _023856D0 ; case 8
	b _023856B4 ; case 9
_023856B4:
	mov r0, r6
	bl sub_0203FD44
	str r0, [fp]
	b _023856D0
_023856C4:
	mov r0, r6
	bl sub_0203F9CC
	bl sub_02041178
_023856D0:
	mov r0, #0x1e
	bl AdvanceFrame
	cmp r8, #0
	beq _0238555C
	cmp r4, #0
	bne _02385EFC
	cmp sb, #0
	bne _02385548
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02385738
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldrb r1, [r6, #0x24]
	ldr r2, [r0]
	add r0, r7, #0x4a
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl ov29_022EBC2C
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #8
	mov r1, #0x1b
	bl ov29_022EA370
	mov r4, #0
	b _02385EFC
_02385738:
	ldr r8, [r6, #0xb4]
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	add sb, r8, #0x124 + HANDLE_MOVES_MENU_OFFSET_2
	ldr fp, [r0]
	bl ov29_022EBA70
	ldrb r0, [r8, #7]
	cmp r0, #0
	beq _023857B0
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02385770
	mov r0, #0x14
	mov r1, #0
	bl AddDungeonSubMenuOption
_02385770:
	ldrb r0, [sb, fp, lsl #3]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023857BC
	ldrb r0, [sb, fp, lsl #3]
	mov r1, #0
	tst r0, #8
	beq _023857A4
	mov r0, #0x33
	bl AddDungeonSubMenuOption
	b _023857BC
_023857A4:
	mov r0, #0x1e
	bl AddDungeonSubMenuOption
	b _023857BC
_023857B0:
	mov r0, #0x1f
	mov r1, #0
	bl AddDungeonSubMenuOption
_023857BC:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _023857E0
	mov r0, #0x20
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0x21
	mov r1, #0
	bl AddDungeonSubMenuOption
_023857E0:
	mov r0, #0x1d
	mov r1, #0
	bl AddDungeonSubMenuOption
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02385804
	mov r0, #0x20
	bl DisableDungeonSubMenuOption
	b _0238595C
_02385804:
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr fp, [r0]
	add r0, r8, fp, lsl #3
	add r0, r0, #0x100
	ldrh r0, [r0, #0x28 + HANDLE_MOVES_MENU_OFFSET_2]
	mov sb, fp
	bl IsNot2TurnsMoveOrSketch
	cmp r0, #0
	moveq r0, #0
	beq _0238592C
	add sb, sb, #1
	b _02385920
_02385834:
	add r0, r8, sb, lsl #3
	ldrb r0, [r0, #0x124 + HANDLE_MOVES_MENU_OFFSET_2]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02385928
	add r0, r8, sb, lsl #3
	add r0, r0, #0x100
	ldrh r0, [r0, #0x28 + HANDLE_MOVES_MENU_OFFSET_2]
	bl IsNot2TurnsMoveOrSketch
	cmp r0, #0
	beq _02385928
	add r0, r8, sb, lsl #3
	ldrb r0, [r0, #0x124 + HANDLE_MOVES_MENU_OFFSET_2]
	tst r0, #2
	bne _0238591C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	b _023858A4
_02385888:
	add r0, r8, r3, lsl #3
	ldrb r0, [r0, #0x124 + HANDLE_MOVES_MENU_OFFSET_2]
	tst r0, #2
	beq _023858AC
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_023858A4:
	cmp r3, #4
	blt _02385888
_023858AC:
	mov r0, fp, lsl #0x10
	mov r2, r0, asr #0x10
	b _0238590C
_023858B8:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r8, r2, lsl #3
	add sb, r0, #0x100
	b _023858F8
_023858D0:
	add fp, r8, r1, lsl #3
	add fp, fp, #0x100
	ldrh r0, [sb, #0x28 + HANDLE_MOVES_MENU_OFFSET_2]
	ldrh fp, [fp, #0x28 + HANDLE_MOVES_MENU_OFFSET_2]
	cmp r0, fp
	moveq r0, #0
	beq _0238592C
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
_023858F8:
	cmp r1, r3
	blt _023858D0
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
_0238590C:
	cmp r2, r3
	blt _023858B8
	mov r0, #1
	b _0238592C
_0238591C:
	add sb, sb, #1
_02385920:
	cmp sb, #4
	blt _02385834
_02385928:
	mov r0, #0
_0238592C:
	cmp r0, #0
	bne _0238593C
	mov r0, #0x20
	bl DisableDungeonSubMenuOption
_0238593C:
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r0, r8
	ldr r1, [r1]
	bl ov31_023863F8
	cmp r0, #0
	bne _0238595C
	mov r0, #0x21
	bl DisableDungeonSubMenuOption
_0238595C:
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r0, r8
	ldr r1, [r1]
	bl ov31_023863F8
	cmp r0, #0
	bne _0238597C
	mov r0, #0x21
	bl DisableDungeonSubMenuOption
_0238597C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _023859C0
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r8, #0
	ldr r1, [r0]
	cmp r1, #4
	bge _023859B0
	mov r0, r6
	mov r2, #1
	bl CanAiUseMove
	cmp r0, #0
	movne r8, #1
_023859B0:
	cmp r8, #0
#ifdef EUROPE
	bne _023859C0
	mov r0, #0x14
	bl DisableDungeonSubMenuOption
_023859C0:
	bl ov29_022EB9A0
	mov r0, #0x14
	bl ov29_022EB8B0
	mvn r1, #0
	cmp r0, r1
	moveq r8, #0
	beq _023865E4
	bl ov29_022EB804
	mov r8, r0
_023865E4:
#else
	bne _023859C0
	mov r0, #0x14
	bl DisableDungeonSubMenuOption
_023859C0:
	bl ov29_022EB9A0
#endif
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bne _02385A40
	mov r0, #0x20
	bl ov29_022EB8B0
	mov r5, r0
	bl ov29_022EB804
	cmp r0, #0
	beq _02385A08
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	mov r4, #0
	b _02385EFC
_02385A08:
	mov r0, #0x21
	bl ov29_022EB8B0
	mov r5, r0
	bl ov29_022EB804
	cmp r0, #0
	beq _02385EFC
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	mov r4, #0
	b _02385EFC
_02385A40:
	cmp r0, #2
	bne _02385AF8
	ldrb r0, [sl, #7]
	cmp r0, #0
	beq _02385AC0
	mov r0, #0x1e
	bl ov29_022EB8B0
	mov r5, r0
	bl ov29_022EB804
	cmp r0, #0
	beq _02385A88
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	mov r4, #0
_02385A88:
	mov r0, #0x33
	bl ov29_022EB8B0
	mov r5, r0
	bl ov29_022EB804
	cmp r0, #0
	beq _02385EFC
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	mov r4, #0
	b _02385EFC
_02385AC0:
	mov r0, #0x1f
	bl ov29_022EB8B0
	mov r5, r0
	bl ov29_022EB804
	cmp r0, #0
	beq _02385EFC
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	mov r4, #0
	b _02385EFC
_02385AF8:
	mov r0, #0x62
	bl AdvanceFrame
	add r1, sp, #0x20
	add r0, sp, #0xd4
	mov r2, #0
	str r1, [sp, #0x9c]
	bl ov31_0238513C
	bl ov29_022EBA84
	mov r1, #0
	add r3, sp, #0xd4
	b _02385B30
_02385B24:
	add r2, r3, r1, lsl #3
	str r1, [r2, #4]
	add r1, r1, #1
_02385B30:
	cmp r1, r0
	blt _02385B24
#ifdef JAPAN
	ldr r0, _02385F8C ; =0x00001D34
	add sb, sp, #0xd4
	mov sl, r1, lsl #3
	strh r0, [sb, sl]
	add r8, sb, r1, lsl #3
	mvn r0, #0
	mov r4, #0
	str r0, [r8, #4]
	strh r4, [r8, #8]
	sub r0, r4, #2
	str r0, [r8, #0xc]
	ldrh r0, [r8, #8]
	add r3, sp, #0x20
	ldr r2, _02387200 ; =0x0000087A
	strh r0, [r8, #0x18]
	ldr fp, [r8, #0xc]
	add r0, r3, r1
	str fp, [r8, #0x1c]
	ldrh sl, [sb, sl]
	ldrb fp, [r0, #1]
	mov sb, #0x14
	strh sl, [r8, #0x10]
	strb fp, [r0, #3]
	ldrb sl, [r3, r1]
	ldr fp, [r8, #4]
	ldr r3, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	str fp, [r8, #0x14]
	ldrh fp, [r8, #-8]
	strb sl, [r0, #2]
	ldrb sl, [r0, #-1]
	strh fp, [r8, #8]
	ldr fp, [r8, #-4]
	ldr r3, [r3]
	strb sl, [r0, #1]
	str fp, [r8, #0xc]
	strh r2, [r8, #-8]
	str sb, [r8, #-4]
	cmp r3, #0
	strb r4, [r0, #-1]
	movle r2, #3
	strleb r2, [r0, #-1]
	add r2, r3, #1
	mov r2, r2, lsl #0x10
	mov r4, r2, asr #0x10
	mov r3, #0
	ldr sb, _02387204 ; =0x0000087B
	add r8, sp, #0xd4
	mov r2, r1, lsl #3
	strh sb, [r8, r2]
	add r1, r8, r1, lsl #3
	mov r2, #0x15
	str r2, [r1, #4]
#else
#ifdef EUROPE
	ldr r0, _02385F8C ; =0x000008DC
	add sl, sp, #0xd4
	mov fp, r1, lsl #3
	strh r0, [sl, fp]
	mvn r0, #0
	add sb, sl, r1, lsl #3
	str r0, [sb, #4]
	mov ip, #0
	add r2, r0, #0xa40
	strh ip, [sb, #8]
	sub r0, ip, #2
	str r0, [sb, #0xc]
	ldrh r0, [sb, #8]
	add r3, sp, #0x20
	mov lr, #0x14
#else
	ldr r2, _02385F8C ; =0x000008DC
	add sl, sp, #0xd4
	mov fp, r1, lsl #3
	mvn r0, #0
	strh r2, [sl, fp]
	add sb, sl, r1, lsl #3
	str r0, [sb, #4]
	mov r8, #0
	add r2, r0, #0xa40
	strh r8, [sb, #8]
	sub r0, r8, #2
	str r0, [sb, #0xc]
	ldrh r0, [sb, #8]
	add r3, sp, #0x20
	mov ip, #0x14
#endif
	strh r0, [sb, #0x18]
	ldr r4, [sb, #0xc]
	add r0, r3, r1
	str r4, [sb, #0x1c]
	ldrh r4, [sl, fp]
	ldrb sl, [r0, #1]
	ldr fp, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	strh r4, [sb, #0x10]
	strb sl, [r0, #3]
	ldrb r4, [r3, r1]
	ldr sl, [sb, #4]
	ldr r3, [fp]
	str sl, [sb, #0x14]
	ldrh sl, [sb, #-8]
	strb r4, [r0, #2]
	ldrb r4, [r0, #-1]
	strh sl, [sb, #8]
	cmp r3, #0
	strb r4, [r0, #1]
	ldr r4, [sb, #-4]
#ifdef EUROPE
	strb ip, [r0, #-1]
	str r4, [sb, #0xc]
	strh r2, [sb, #-8]
	movle r2, #3
	strleb r2, [r0, #-1]
	add r2, r3, #1
	mov r2, r2, lsl #0x10
	str lr, [sb, #-4]
	mov r4, r2, asr #0x10
	add sb, sp, #0xd4
	mov r2, r1, lsl #3
	mov r3, #0xa40
	strh r3, [sb, r2]
	mov r3, #0
	add r1, sb, r1, lsl #3
	mov r2, #0x15
	str r2, [r1, #4]
#else
	strb r8, [r0, #-1]
	str r4, [sb, #0xc]
	strh r2, [sb, #-8]
	movle r2, #3
	str ip, [sb, #-4]
	add r8, sp, #0xd4
	strleb r2, [r0, #-1]
	mov sb, r1, lsl #3
	add r2, r8, r1, lsl #3
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	mov r1, #0xa40
	strh r1, [r8, sb]
	mov r1, #0x15
	mov r3, #0
	str r1, [r2, #4]
#endif
#endif
	strb r3, [r0]
	ldr sl, [r6, #0xb4]
	mov r1, r3
	mov r2, #1
	b _02385C58
_02385C1C:
#ifdef EUROPE
	add sb, sl, r4, lsl #3
	ldrb sb, [sb, #0x124]
	tst sb, #1
	movne sb, r2
	moveq sb, r1
	tst sb, #0xff
	beq _02385C4C
	add sb, sl, r4, lsl #3
	ldrb sb, [sb, #0x124]
	tst sb, #2
#else
	add r8, sl, r4, lsl #3
	ldrb r8, [r8, #0x124 + HANDLE_MOVES_MENU_OFFSET_2]
	tst r8, #1
	movne r8, r2
	moveq r8, r1
	tst r8, #0xff
	beq _02385C4C
	add r8, sl, r4, lsl #3
	ldrb r8, [r8, #0x124 + HANDLE_MOVES_MENU_OFFSET_2]
	tst r8, #2
#endif
	moveq r3, #1
	beq _02385C60
_02385C4C:
	add r4, r4, #1
	mov r4, r4, lsl #0x10
	mov r4, r4, asr #0x10
_02385C58:
	cmp r4, #4
	blt _02385C1C
_02385C60:
	cmp r3, #0
	moveq r1, #3
	streqb r1, [r0]
	ldr r0, _02385F90 ; =DUNGEON_WINDOW_PARAMS_15
	ldr r1, _02385F94 ; =0x80000213
	add r2, sp, #0x3c
	add r3, sp, #0xd4
	bl CreateParentMenuFromStringIds
	strb r0, [sp, #0x1c]
	mov r0, #0x1b
	bl AdvanceFrame
#ifdef EUROPE
	add r4, sp, #0xd4
	mov fp, #0x1b
	ldr sb, _02385F98 ; =0x0000099B
	b _02385D0C
_02385CA0:
	mov r0, fp
	bl AdvanceFrame
	mov r0, #0
#else
	add r8, sp, #0xd4
	mov sb, #0x1b
	mov fp, #0
	ldr r4, _02385F98 ; =0x0000099B
	b _02385D0C
_02385CA0:
	mov r0, sb
	bl AdvanceFrame
	mov r0, fp
#endif
	add r1, sp, #0x1e
	bl GetPressedButtons
	ldrh r0, [sp, #0x1e]
	tst r0, #0x400
	beq _02385D0C
	mov r5, #0
	b _02385CEC
_02385CC8:
	mov r1, r5, lsl #3
#ifdef EUROPE
	add r0, r4, r5, lsl #3
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _02385CF4
	cmp r8, #0
	beq _0238690C
	ldrh r0, [r4, r1]
	cmp r0, sb
	beq _02385CF4
_0238690C:
#else
	add r0, r8, r5, lsl #3
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _02385CF4
	ldrh r0, [r8, r1]
	cmp r0, r4
	beq _02385CF4
#endif
	add r5, r5, #1
_02385CEC:
	cmp r5, #0xa
	blt _02385CC8
_02385CF4:
#ifdef EUROPE
	add r0, r4, r5, lsl #3
#else
	add r0, r8, r5, lsl #3
#endif
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _02385D0C
	cmp r5, #0xa
	blt _02385D1C
_02385D0C:
	ldrsb r0, [sp, #0x1c]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02385CA0
_02385D1C:
	ldrh r0, [sp, #0x1e]
	tst r0, #0x400
	bne _02385D34
	ldrsb r0, [sp, #0x1c]
	bl sub_0202ABB0
	mov r5, r0
_02385D34:
	ldrsb r0, [sp, #0x1c]
	bl sub_0202AB80
	cmp r0, #0
	ble _02385D78
	mvn r0, #0
	cmp r5, r0
	bne _02385D78
	ldrsb r0, [sp, #0x1c]
	bl sub_0202AB80
	add r1, sp, #0xd4
	mov r0, r0, lsl #3
	ldrh r1, [r1, r0]
	ldr r0, _02385F8C ; =0x000008DC
	cmp r1, r0
	bne _02385D78
	mov r0, #0
	bl PlaySeVolumeWrapper
_02385D78:
	add r0, sp, #0x1c
	bl ov29_0234E988
	mov r0, #0x1b
	bl AdvanceFrame
	cmp r5, #0
	blt _02385ED8
	add r0, sp, #0xd4
	mov r1, r5, lsl #3
	ldrh r1, [r0, r1]
	ldr r0, _02385F9C ; =0x000009A8
	cmp r1, r0
	bgt _02385DC8
	sub r0, r0, #3
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _02385DE4
_02385DB8: ; jump table
	b _02385DD4 ; case 0
	b _02385DD4 ; case 1
	b _02385DD4 ; case 2
	b _02385DD4 ; case 3
_02385DC8:
	ldr r0, _02385FA0 ; =0x000009BA
	cmp r1, r0
	bne _02385DE4
_02385DD4:
	ldr r0, _02385FA4 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	b _02385DEC
_02385DE4:
	mov r0, #0
	bl PlaySeVolumeWrapper
_02385DEC:
	cmp r5, #0x14
	bne _02385E4C
	mov r0, r6
	bl sub_0203F9CC
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020416BC
	ldr r2, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r1, r0, lsl #0x10
	str r0, [r2]
	mov r0, r1, asr #0x10
	bl sub_020410A4
	mov r0, r6
	bl sub_0203FD44
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	str r0, [r1]
	ldr r0, [sp, #0x18]
	bl sub_020307EC
	bl sub_02041178
	mov r0, #0x1b
	bl AdvanceFrame
	b _02385548
_02385E4C:
	cmp r5, #0x15
	bne _02385EAC
	mov r0, r6
	bl sub_0203F9CC
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_020416DC
	ldr r2, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r1, r0, lsl #0x10
	str r0, [r2]
	mov r0, r1, asr #0x10
	bl sub_020410A4
	mov r0, r6
	bl sub_0203FD44
	ldr r1, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	str r0, [r1]
	ldr r0, [sp, #0x18]
	bl sub_020307EC
	bl sub_02041178
	mov r0, #0x1b
	bl AdvanceFrame
	b _02385548
_02385EAC:
	mov r0, r5
	bl ov29_022EB804
	cmp r0, #0
	beq _02385EF0
	mov r0, r6
	bl GetTeamMemberIndex
	mov r2, r0
	mov r1, r5
	add r0, r7, #0x4a
	bl ov31_02385FA8
	b _02385EF0
_02385ED8:
	ldr r0, [sp, #0x18]
	bl sub_020307EC
	bl sub_02041178
	mov r0, #0x1b
	bl AdvanceFrame
	b _02385548
_02385EF0:
	mov r0, #0x1b
	bl AdvanceFrame
	mov r4, #0
_02385EFC:
	ldr r0, [sp, #0x18]
	bl CloseAdvancedTextBox2
	ldr r0, [sp, #0x14]
	bl sub_0202F334
	ldr r0, [sp, #0x14]
	bl CloseDialogueBox
	mov r0, #8
	mov r1, #0x1e
	bl ov29_022EA370
	bl HideTileGrid
	mov r0, #0x1b
	bl AdvanceFrame
	bl sub_020407C0
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02385F50
	bl MemFree
	ldr r0, _02385F70 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r1, #0
	str r1, [r0, #8]
_02385F50:
	bl GetLeaderMonster
	ldr r1, [sp, #0x10]
	add r2, sp, #0x2c
	ldr r1, [r2, r1, lsl #2]
	strb r1, [r0, #0x4e]
	mov r0, r4
	add sp, sp, #0x12c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#if defined(EUROPE)
#define HANDLE_MOVES_MENU_DATA_OFFSET 2
#define HANDLE_MOVES_MENU_DATA_OFFSET_2 0
#elif defined(JAPAN)
#define HANDLE_MOVES_MENU_DATA_OFFSET 0xA03
#define HANDLE_MOVES_MENU_DATA_OFFSET_2 0x19D0
#else
#define HANDLE_MOVES_MENU_DATA_OFFSET 0
#define HANDLE_MOVES_MENU_DATA_OFFSET_2 0
#endif
_02385F70: .word OVERLAY31_UNKNOWN_POINTER__NA_238A270
_02385F74: .word DUNGEON_WINDOW_PARAMS_14
_02385F78: .word 0x00003FCD + HANDLE_MOVES_MENU_DATA_OFFSET
_02385F7C: .word 0x00000404
_02385F80: .word DUNGEON_WINDOW_PARAMS_16
_02385F84: .word 0x00003FCC + HANDLE_MOVES_MENU_DATA_OFFSET
_02385F88: .word DUNGEON_PTR
#ifdef JAPAN
_02385F8C: .word 0x00001D34
_02387200: .word 0x0000087A
_02387204: .word 0x0000087B
#else
_02385F8C: .word 0x000008DC
#endif
_02385F90: .word DUNGEON_WINDOW_PARAMS_15
_02385F94: .word 0x80000213
_02385F98: .word 0x0000099B + HANDLE_MOVES_MENU_DATA_OFFSET_2
_02385F9C: .word 0x000009A8 + HANDLE_MOVES_MENU_DATA_OFFSET_2
_02385FA0: .word 0x000009BA + HANDLE_MOVES_MENU_DATA_OFFSET_2
_02385FA4: .word 0x00003F07
	arm_func_end HandleMovesMenu

	arm_func_start ov31_02385FA8
ov31_02385FA8: ; 0x02385FA8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _02385FD8 ; =ov29_0237C91C
	mov r1, r1, lsl #3
	ldrh r1, [r3, r1]
	mov r5, r0
	mov r4, r2
	bl SetMonsterActionFields
	ldr r0, _02385FDC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	strb r4, [r5, #4]
	ldr r0, [r0]
	strb r0, [r5, #0xa]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02385FD8: .word ov29_0237C91C
_02385FDC: .word OVERLAY31_UNKNOWN_POINTER__NA_238A270
	arm_func_end ov31_02385FA8

	arm_func_start ov31_02385FE0
ov31_02385FE0: ; 0x02385FE0
#ifdef JAPAN
#define OV31_02385FE0_OFFSET -4
#else
#define OV31_02385FE0_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r1, _0238604C ; =DUNGEON_PTR
	ldrb r3, [r0, #4]
	ldr r1, [r1]
	ldrb r2, [r0, #0xa]
	add r1, r1, r3, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r1, [r1, #0xa84]
#else
	ldr r1, [r1, #0xb28]
#endif
	mov r2, r2, lsl #3
	ldr ip, [r1, #0xb4]
	add r1, ip, #0x26 + OV31_02385FE0_OFFSET
	add r3, r1, #0x100
	ldrh r1, [r3, r2]
	orr r1, r1, #2
	strh r1, [r3, r2]
	ldrb r1, [r0, #0xa]
	cmp r1, #4
	bhs _02386038
	add r0, ip, #0x124 + OV31_02385FE0_OFFSET
	mov r2, #4
	bl ov31_02386050
	ldmia sp!, {r3, pc}
_02386038:
	add r0, ip, #0x144 + OV31_02385FE0_OFFSET
	mov r1, #0
	mov r2, #1
	bl ov31_02386050
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238604C: .word DUNGEON_PTR
	arm_func_end ov31_02385FE0

	arm_func_start ov31_02386050
ov31_02386050: ; 0x02386050
	stmdb sp!, {r3, r4, r5, lr}
	mov r3, r1
	mov r1, r2
	mov r2, r3
	mov r3, #0
	bl sub_020417A8
	mov r5, r0
	mov r4, #0x62
_02386070:
	bl sub_02041A18
	cmp r0, #0
	beq _0238608C
	bl sub_02041A00
	mov r0, r5
	bl CloseScrollBox
	b _02386098
_0238608C:
	mov r0, r4
	bl AdvanceFrame
	b _02386070
_02386098:
	mov r0, #0x62
	bl AdvanceFrame
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov31_02386050

	arm_func_start ov31_023860A4
ov31_023860A4: ; 0x023860A4
#ifdef JAPAN
#define OV31_023860A4_OFFSET -4
#else
#define OV31_023860A4_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _02386190 ; =DUNGEON_PTR
	ldrb r3, [r0, #4]
	ldr r4, [r2]
	ldrb r2, [r0, #0xa]
	add r0, r4, r3, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r4, [r0, #0xa84]
#else
	ldr r4, [r0, #0xb28]
#endif
	mov r8, r1
	ldr r7, [r4, #0xb4]
	mov r6, #0
	add r1, r7, #0x124 + OV31_023860A4_OFFSET
	ldrb r0, [r1, r2, lsl #3]
	mov ip, #0
	add r5, r1, r2, lsl #3
	tst r0, #8
	movne r6, #1
	mov r2, ip
	mov r3, #1
_023860F0:
	add r0, r7, ip, lsl #3
	ldrb r0, [r0, #0x124 + OV31_023860A4_OFFSET]
	tst r0, #1
	movne r0, r3
	moveq r0, r2
	tst r0, #0xff
	addne r1, r7, ip, lsl #3
	ldrneb r0, [r1, #0x124 + OV31_023860A4_OFFSET]
	add ip, ip, #1
	bicne r0, r0, #8
	strneb r0, [r1, #0x124 + OV31_023860A4_OFFSET]
	cmp ip, #4
	blt _023860F0
	bl ov29_0234B034
	ldrh r1, [r5, #4]
	cmp r6, #0
	str r1, [r0, #0x10]
	ldreqb r0, [r5]
	orreq r0, r0, #8
	streqb r0, [r5]
	add r0, r7, #0x124 + OV31_023860A4_OFFSET
	bl AllManip1
	ldrh r0, [r5, #2]
	cmp r8, #0
	orr r0, r0, #2
	strh r0, [r5, #2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r6, #0
	bne _02386174
	ldr r1, _02386194 ; =0x000008D8
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _02386180
_02386174:
	ldr r1, _02386198 ; =0x000008D9
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
_02386180:
	mov r0, #0x78
	mov r1, #0x1f
	bl ov29_022EA370
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02386190: .word DUNGEON_PTR
#ifdef JAPAN
_02386194: .word 0x00001D30
_02386198: .word 0x00001D31
#else
_02386194: .word 0x000008D8
_02386198: .word 0x000008D9
#endif
	arm_func_end ov31_023860A4

	arm_func_start ov31_0238619C
ov31_0238619C: ; 0x0238619C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02386200 ; =DUNGEON_PTR
	ldrb r2, [r0, #4]
	ldr r1, [r1]
	ldrb r4, [r0, #0xa]
	add r0, r1, r2, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
	ldr r7, [r0, #0xb4]
	add r5, r7, #0x120
#else
	ldr r0, [r0, #0xb28]
	ldr r7, [r0, #0xb4]
	add r5, r7, #0x124
#endif
	add r6, r5, r4, lsl #3
	bl ov29_0234B034
	mov r1, #0
	mov r2, r6
	mov r3, r1
	bl FormatMoveStringMore
	ldrb r1, [r5, r4, lsl #3]
	mov r0, r5
	eor r1, r1, #4
	strb r1, [r5, r4, lsl #3]
	bl AllManip1
	ldrh r0, [r6, #2]
	orr r0, r0, #2
	strh r0, [r6, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02386200: .word DUNGEON_PTR
	arm_func_end ov31_0238619C

	arm_func_start ov31_02386204
ov31_02386204: ; 0x02386204
#ifdef JAPAN
#define OV31_02386204_OFFSET -4
#else
#define OV31_02386204_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xa0
	ldr r1, _02386304 ; =DUNGEON_PTR
	ldrb r2, [r0, #4]
	ldr r1, [r1]
	ldrb r5, [r0, #0xa]
	add r0, r1, r2, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r1, [r0, #0xa84]
#else
	ldr r1, [r0, #0xb28]
#endif
	add r0, sp, #0
	ldr r4, [r1, #0xb4]
	mov r2, #0
	add r1, r4, #0x124 + OV31_02386204_OFFSET
	add r1, r1, r5, lsl #3
	bl FormatMoveString
	add r0, r4, #0x26 + OV31_02386204_OFFSET
	add r2, r0, #0x100
	mov r1, r5, lsl #3
	ldrh r0, [r2, r1]
	mov r3, #0
	orr r0, r0, #2
	strh r0, [r2, r1]
	mov r1, r3
	mov r2, #1
	b _023862A4
_02386268:
	add r5, r5, #1
	cmp r5, #4
	bge _023862AC
	add r0, r4, r5, lsl #3
	ldrb r0, [r0, #0x124 + OV31_02386204_OFFSET]
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	beq _023862AC
	add r0, r4, r5, lsl #3
	ldrb r0, [r0, #0x124 + OV31_02386204_OFFSET]
	tst r0, #2
	beq _023862AC
	add r3, r3, #1
_023862A4:
	cmp r3, #4
	blt _02386268
_023862AC:
	add r0, r4, r5, lsl #3
	ldrb r0, [r0, #0x124 + OV31_02386204_OFFSET]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	moveq r5, #4
	cmp r5, #4
	bge _023862F4
	add ip, r4, #0x124 + OV31_02386204_OFFSET
	ldrb r2, [ip, r5, lsl #3]
	add r0, sp, #0x50
	add r1, ip, r5, lsl #3
	orr r2, r2, #2
	bic r3, r2, #4
	mov r2, #0
	strb r3, [ip, r5, lsl #3]
	bl FormatMoveString
_023862F4:
	add r0, r4, #0x124 + OV31_02386204_OFFSET
	bl AllManip1
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02386304: .word DUNGEON_PTR
	arm_func_end ov31_02386204

	arm_func_start ov31_02386308
ov31_02386308: ; 0x02386308
#ifdef JAPAN
#define OV31_02386308_OFFSET -4
#else
#define OV31_02386308_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _023863EC ; =DUNGEON_PTR
	ldrb r3, [r0, #4]
	ldr r2, [r2]
	ldrb r7, [r0, #0xa]
	add r0, r2, r3, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r4, [r0, #0xa84]
#else
	ldr r4, [r0, #0xb28]
#endif
	mov r8, r1
	ldr r6, [r4, #0xb4]
	mov r5, #0
	bl ov29_0234B034
	add r1, r6, r7, lsl #3
	add r1, r1, #0x100
	ldrh r2, [r1, #0x28 + OV31_02386308_OFFSET]
	mov r3, r7, lsl #3
	add r1, r6, #0x26 + OV31_02386308_OFFSET
	str r2, [r0, #0x10]
	add r2, r1, #0x100
	ldrh r1, [r2, r3]
	add r7, r7, #1
	mov r0, r5
	orr r1, r1, #2
	strh r1, [r2, r3]
	add ip, r6, #0x124 + OV31_02386308_OFFSET
	mov r1, #1
	b _023863A0
_02386374:
	cmp r7, #4
	bge _023863A8
	ldrb r2, [ip, r7, lsl #3]
	mov r3, r7, lsl #3
	tst r2, #2
	beq _023863A8
	bic r2, r2, #2
	mov r5, r1
	strb r2, [ip, r3]
	add r7, r7, #1
	add r0, r0, #1
_023863A0:
	cmp r0, #4
	blt _02386374
_023863A8:
	add r0, r6, #0x124 + OV31_02386308_OFFSET
	bl AllManip1
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r5, #0
	beq _023863D0
	ldr r1, _023863F0 ; =0x000008DA
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
	b _023863DC
_023863D0:
	ldr r1, _023863F4 ; =0x000008DB
	mov r0, r4
	bl LogMessageByIdWithPopupCheckUser
_023863DC:
	mov r0, #0x78
	mov r1, #0x1f
	bl ov29_022EA370
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023863EC: .word DUNGEON_PTR
#ifdef JAPAN
_023863F0: .word 0x00001D32
_023863F4: .word 0x00001D33
#else
_023863F0: .word 0x000008DA
_023863F4: .word 0x000008DB
#endif
	arm_func_end ov31_02386308

	arm_func_start ov31_023863F8
ov31_023863F8: ; 0x023863F8
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov ip, lr
	add r1, r1, #1
	mov r2, #1
	b _02386434
_02386410:
	cmp r1, #4
	bge _0238643C
	add r3, r0, r1, lsl #3
#ifdef JAPAN
	ldrb r3, [r3, #0x120]
#else
	ldrb r3, [r3, #0x124]
#endif
	tst r3, #2
	beq _0238643C
	mov lr, r2
	add r1, r1, #1
	add ip, ip, #1
_02386434:
	cmp ip, #4
	blt _02386410
_0238643C:
	cmp lr, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov31_023863F8

	arm_func_start ov31_02386450
ov31_02386450: ; 0x02386450
	stmdb sp!, {r3, lr}
	ldr r0, _02386478 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02386478 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02386478: .word OVERLAY31_UNKNOWN_POINTER__NA_238A270
	arm_func_end ov31_02386450

	arm_func_start ov31_0238647C
ov31_0238647C: ; 0x0238647C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x114
	mov r6, r0
	mov r5, r1
	str r2, [sp, #4]
	mov r0, #0x284
	mov r1, #8
	str r3, [sp, #8]
	mvn r4, #1
	bl MemAlloc
	ldr r1, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r1]
_023864B4:
	mov r0, #6
	mov r1, #0
	bl ov29_022EA428
	ldr r0, _02386B10 ; =ov29_0235352C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl sub_0200B3D4
	mvn sb, #1
	ldr r7, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	add r8, sb, #1
	add fp, sp, #0xbc
_023864E0:
	cmp r4, sb
	bne _02386578
	ldr r3, [r6, #0xb4]
	add r0, sp, #0x14
	ldrsh r2, [r3, #2]
	ldrb r3, [r3, #0x48]
	mov r1, #2
	bl sub_02053CA0
	mov r0, r6
	bl sub_0203F9CC
	mov r1, #0
	b _0238652C
_02386510:
	add r0, r5, r1, lsl #3
	ldrh r0, [r0, #2]
	tst r0, #4
	bne _02386534
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
_0238652C:
	cmp r1, #8
	blt _02386510
_02386534:
	add r0, r5, r1, lsl #3
	ldrh r0, [r0, #4]
	bl sub_0203FD14
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	add r3, sp, #0x14
	beq _02386568
	mov r0, #2
	mov r2, r1
	bl sub_0204019C
	mov r4, r0
	b _02386578
_02386568:
	mov r0, #3
	mov r2, r1
	bl sub_0204019C
	mov r4, r0
_02386578:
	mov r0, #0x1e
	bl AdvanceFrame
	bl sub_020407EC
	mov sl, r0
	bl sub_02041094
	cmp sl, #2
	str r0, [r7]
	moveq sl, #0
	beq _023865B4
	cmp sl, #1
	moveq sl, #1
	beq _023865B4
	cmp sl, #7
	bne _02386578
	mov sl, #2
_023865B4:
	mov r0, #0x1e
	bl AdvanceFrame
	cmp sl, #1
	ldreq r0, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	mvneq r1, #0
	streq r1, [r0]
	beq _02386924
	cmp sl, #2
	bne _02386694
	mov r0, r4
	bl SetAdvancedTextBoxState5
	mov r0, #0x1e
	bl AdvanceFrame
	mov r0, r4
	bl CloseAdvancedTextBox
	mov r0, #0x1b
	mov r4, sb
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	ldr r0, [r7]
	cmp r0, #4
	bge _02386664
	ldr r1, [r7]
	mov r0, r5
	mov r2, #4
	bl ov31_02386050
	b _02386674
_02386664:
	add r0, r5, #0x20
	mov r1, #0
	mov r2, #1
	bl ov31_02386050
_02386674:
	bl sub_020407C0
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #2
	mov r1, #0x1b
	bl ov29_022EA370
	b _023864E0
_02386694:
	bl ov29_022EBA70
	mov r0, #0x22
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0x21
	mov r1, #0
	bl AddDungeonSubMenuOption
	ldr r0, [r7]
	mov r3, #0
	add r1, r0, #1
	mov r2, r3
	b _023866E4
_023866C4:
	cmp r1, #8
	bge _023866EC
	ldrb r0, [r5, r1, lsl #3]
	tst r0, #2
	beq _023866EC
	mov r3, #1
	add r1, r1, #1
	add r2, r2, #1
_023866E4:
	cmp r2, #8
	blt _023866C4
_023866EC:
	cmp r3, #0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02386708
	mov r0, #0x21
	bl DisableDungeonSubMenuOption
_02386708:
	mov r0, #0x1d
	mov r1, #0
	bl AddDungeonSubMenuOption
	add r0, sp, #0x18
	str r0, [sp, #0x84]
	mov r0, fp
	add r1, sp, #0x18
	mov r2, #0
	bl ov31_0238513C
	bl ov29_022EBA84
	mov r2, #0
	b _0238674C
_02386738:
	add r1, fp, r2, lsl #3
	str r2, [r1, #4]
	add r1, r2, #1
	mov r1, r1, lsl #0x10
	mov r2, r1, asr #0x10
_0238674C:
	cmp r2, r0
	blt _02386738
	ldr r0, _02386B14 ; =0x000008DC
	mov r1, r2, lsl #3
	strh r0, [fp, r1]
	add r0, fp, r2, lsl #3
	str r8, [r0, #4]
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	mov r1, r2, lsl #3
	mov r0, #0
	strh r0, [fp, r1]
	add r0, fp, r2, lsl #3
	str r8, [r0, #4]
	ldr r0, _02386B18 ; =DUNGEON_WINDOW_PARAMS_15
	ldr r1, _02386B1C ; =0x00000213
	add r2, sp, #0x24
	mov r3, fp
	bl CreateParentMenuFromStringIds
	str r0, [sp, #0x10]
_023867A0:
	mov r0, #0x1b
	bl AdvanceFrame
	ldr r0, [sp, #0x10]
	bl IsParentMenuActive
	cmp r0, #0
	bne _023867A0
	ldr r0, [sp, #0x10]
	bl sub_0202ABB0
	movs sl, r0
	movmi r0, #1
	strmi r0, [sp, #0xc]
	movpl r0, #0
	strpl r0, [sp, #0xc]
	mov r0, #0x1b
	bl AdvanceFrame
	ldr r0, [sp, #0x10]
	bl CloseParentMenu
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _023867F8
	bl sub_020416FC
	b _023864E0
_023867F8:
	mov r0, #6
	mov r1, #0
	bl ov29_022EA428
	mov r0, r4
	bl SetAdvancedTextBoxState5
_0238680C:
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, r4
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _0238680C
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, r4
	bl CloseAdvancedTextBox
	mov r4, sb
	bl sub_020407C0
	cmp sl, #1
	bne _023868E8
	ldr r0, [r7]
	mov r1, #0
	add r2, r0, #1
	b _023868C0
_0238689C:
	cmp r2, #8
	bge _023868C8
	ldrb r0, [r5, r2, lsl #3]
	tst r0, #2
	beq _023868C8
	bic r0, r0, #2
	strb r0, [r5, r2, lsl #3]
	add r2, r2, #1
	add r1, r1, #1
_023868C0:
	cmp r1, #8
	blt _0238689C
_023868C8:
	mov r0, r5
	bl AllManip2
	ldr r0, [r6, #0xb4]
	mov r1, r5
#ifdef JAPAN
	add r0, r0, #0x120
#else
	add r0, r0, #0x124
#endif
	mov r2, #0x22
	bl memcpy
	b _023864E0
_023868E8:
	cmp sl, #2
	bne _02386924
	ldr r0, [r7]
	cmp r0, #4
	bge _02386910
	ldr r1, [r7]
	mov r0, r5
	mov r2, #4
	bl ov31_02386050
	b _023864E0
_02386910:
	add r0, r5, #0x20
	mov r1, #0
	mov r2, #1
	bl ov31_02386050
	b _023864E0
_02386924:
	mvn r0, #1
	cmp r4, r0
	beq _02386950
	mov r0, r4
	bl SetAdvancedTextBoxState5
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, r4
	bl CloseAdvancedTextBox
	mvn r4, #1
	bl sub_020407C0
_02386950:
	ldr r0, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r1, [r0]
	cmp r1, #0
	blt _02386AE8
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02386A04
	mov r0, r1, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_02041154
	mov r1, r0
	mov r0, #0
	bl ov29_0234B084
	ldr r0, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0]
	cmp r0, #4
	bge _023869D8
	bl sub_02041364
	cmp r0, #0
	mov r0, #0
	mov r2, #1
	beq _023869C0
	ldr r1, _02386B20 ; =0x000008D6
	mov r3, r0
	str r2, [sp]
	bl YesNoMenu
	mov r7, r0
	b _023869F4
_023869C0:
	ldr r1, _02386B24 ; =0x000008D7
	mov r3, r0
	str r2, [sp]
	bl YesNoMenu
	mov r7, r0
	b _023869F4
_023869D8:
	mov r0, #0
	mov r2, #1
	ldr r1, _02386B24 ; =0x000008D7
	mov r3, r0
	str r2, [sp]
	bl YesNoMenu
	mov r7, r0
_023869F4:
	mov r0, #1
	mov r1, #0
	bl ov29_0233A0E8
	b _02386A08
_02386A04:
	mov r7, #1
_02386A08:
	cmp r7, #1
	bne _023864B4
	ldr r0, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0]
	cmp r0, #4
	movge r1, #0
	strgeb r1, [r5, r0, lsl #3]
	bge _02386AE8
	bl sub_02041484
	bl sub_0203FD38
	mov r1, #0
	mov r2, r1
	mov r3, #1
	b _02386A80
_02386A40:
	add r8, r0, r1, lsl #3
	add r7, r5, r1, lsl #3
	mov r6, #4
_02386A4C:
	ldrh r4, [r8], #2
	subs r6, r6, #1
	strh r4, [r7], #2
	bne _02386A4C
	ldrb r4, [r5, r1, lsl #3]
	tst r4, #1
	movne r4, r3
	moveq r4, r2
	tst r4, #0xff
	beq _02386A88
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
_02386A80:
	cmp r1, #4
	blt _02386A40
_02386A88:
	mov r6, #4
_02386A8C:
	add r4, r5, r6, lsl #3
	add r3, r5, r1, lsl #3
	mov r2, #4
_02386A98:
	ldrh r0, [r4], #2
	subs r2, r2, #1
	strh r0, [r3], #2
	bne _02386A98
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	add r1, r1, #1
	mov r6, r0, asr #0x10
	mov r0, r1, lsl #0x10
	cmp r6, #8
	mov r1, r0, asr #0x10
	blt _02386A8C
	mov r2, #0
	b _02386AE0
_02386AD0:
	add r0, r1, #1
	mov r0, r0, lsl #0x10
	strb r2, [r5, r1, lsl #3]
	mov r1, r0, asr #0x10
_02386AE0:
	cmp r1, #8
	blt _02386AD0
_02386AE8:
	bl ov31_02386450
	ldr r0, _02386B0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A270
	ldr r0, [r0]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x114
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV31_0238647C_OFFSET 0x1458
#else
#define OV31_0238647C_OFFSET 0
#endif
_02386B0C: .word OVERLAY31_UNKNOWN_POINTER__NA_238A270
_02386B10: .word ov29_0235352C
_02386B14: .word 0x000008DC + OV31_0238647C_OFFSET
_02386B18: .word DUNGEON_WINDOW_PARAMS_15
_02386B1C: .word 0x00000213
_02386B20: .word 0x000008D6 + OV31_0238647C_OFFSET
_02386B24: .word 0x000008D7 + OV31_0238647C_OFFSET
	arm_func_end ov31_0238647C

	arm_func_start ov31_02386B28
ov31_02386B28: ; 0x02386B28
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xa4
	ldr r0, _02386C08 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	ldr r1, [r0, #0x64]
	ldrsh r0, [r1, #4]
	ldrsh r1, [r1, #6]
	bl GetTile
	mov r4, r0
	ldr r0, _02386C0C ; =0x000008D1
	bl StringFromId
	ldr r1, _02386C08 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	mov r3, r0
	ldr r0, [r1]
	mov r1, #8
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x60]
	mov r2, #2
	bl DrawTextInWindow
	ldr r1, [r4, #0x10]
	cmp r1, #0
	moveq r0, #0
	beq _02386B98
	ldr r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02386B98:
	cmp r0, #0
	beq _02386C00
	add r0, sp, #0x54
	mov r2, #0
	bl ov29_022E2A78
	ldr r0, [r4, #0x10]
	bl ov29_022E1618
	ldrb r1, [r0]
	ldr r0, _02386C10 ; =0x000008D2
	str r1, [sp, #0x14]
	bl StringFromId
	add r1, sp, #4
	mov r2, r0
	str r1, [sp]
	add r0, sp, #0x54
	mov r1, #0x50
	mov r3, #0
	bl PreprocessString
	ldr r0, _02386C08 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	mov r1, #0x10
	ldr r0, [r0]
	mov r2, #0x12
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x60]
	add r3, sp, #0x54
	bl DrawTextInWindow
_02386C00:
	add sp, sp, #0xa4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02386C08: .word OVERLAY31_UNKNOWN_POINTER__NA_238A27C
#ifdef JAPAN
_02386C0C: .word 0x00001D29
_02386C10: .word 0x00001D2A
#else
_02386C0C: .word 0x000008D1
_02386C10: .word 0x000008D2
#endif
	arm_func_end ov31_02386B28

	arm_func_start ov31_02386C14
ov31_02386C14: ; 0x02386C14
	stmdb sp!, {r3, lr}
	ldr r0, _02386C68 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	add r0, r0, #0x61
	add r0, r0, #0x100
	bl ov29_0234E988
	ldr r0, _02386C68 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x60]
	bl sub_0202F954
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #0x62
	bl AdvanceFrame
	ldr r0, _02386C68 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x60]
	bl CloseTextBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_02386C68: .word OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	arm_func_end ov31_02386C14

	arm_func_start ov31_02386C6C
ov31_02386C6C: ; 0x02386C6C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xf4
	mov r5, r0
	mov r0, #0x164
	mov r1, #8
	bl MemAlloc
	ldr r1, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	str r0, [r1]
	str r5, [r0, #0x64]
_02386C90:
	bl ov29_022EA62C
	ldr r0, _02386F10 ; =DUNGEON_WINDOW_PARAMS_18
	ldr r1, _02386F14 ; =ov31_02386B28
	bl CreateTextBox
	ldr r1, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r1, [r1]
	strb r0, [r1, #0x160]
	bl ov29_022EBA70
	mov r0, #0x25
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0xc
	mov r1, #0
	bl AddDungeonSubMenuOption
	bl ov29_022EB9A0
	bl ov29_022EBA84
	mov r1, #0
	ldr r2, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	b _02386CF0
_02386CDC:
	ldr r3, [r2]
	add r4, r1, #1
	add r3, r3, r1, lsl #3
	mov r1, r4
	str r4, [r3, #4]
_02386CF0:
	cmp r1, r0
	blt _02386CDC
	ldr r0, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	mov r2, #0
	ldr r4, [r0]
	mov r3, r1, lsl #3
	strh r2, [r4, r3]
	ldr r3, [r0]
	sub r4, r2, #1
	add r3, r3, r1, lsl #3
	str r4, [r3, #4]
	ldr r3, [r0]
	add r3, r3, r1, lsl #3
	strh r2, [r3, #8]
	ldr r3, [r0]
	add r1, r3, r1, lsl #3
	str r4, [r1, #0xc]
	ldr r0, [r0]
	add r1, r0, #0x58
	bl ov31_0238513C
	ldr r1, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, _02386F18 ; =DUNGEON_WINDOW_PARAMS_17
	ldr r3, [r1]
	ldr r1, _02386F1C ; =0x00000213
	add r4, r3, #0x58
	add r2, sp, #0x5c
	str r4, [sp, #0xbc]
	bl CreateParentMenuFromStringIds
	ldr r6, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	mov r4, #0x2d
	ldr r1, [r6]
	strb r0, [r1, #0x161]
_02386D70:
	mov r0, r4
	bl AdvanceFrame
	ldr r0, [r6]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x61]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02386D70
	ldr r0, [r6]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x61]
	bl sub_0202ABB0
	ldr r1, [r6]
	sub r0, r0, #1
	str r0, [r1, #0x124]
	ldr r0, [r6]
	ldr r0, [r0, #0x124]
	cmp r0, #0
	movlt r6, #1
	blt _02386EBC
	cmp r0, #1
	bne _02386E70
	bl ov31_02386C14
	ldrsh r0, [r5, #4]
	ldrsh r1, [r5, #6]
	bl GetTile
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02386E68
	ldr r1, [r0]
	cmp r1, #2
	bne _02386E68
	bl GetTrapInfo
	ldrb r3, [r0]
	add r2, sp, #0xc
	ldr r1, _02386F20 ; =0x00001013
	str r3, [sp, #0x1c]
	str r2, [sp]
	ldrb r2, [r0]
	ldr r0, _02386F24 ; =DUNGEON_WINDOW_PARAMS_19
#if defined(EUROPE)
	sub r3, r1, #0x740
	add r2, r2, #0xdc
	add r2, r2, #0x3400
#elif defined(JAPAN)
	ldr r3, _023881A0 ; =0x00001D2B
	add r2, r2, #0x5f
	add r2, r2, #0x4700
#else
	sub r3, r1, #0x740
	add r2, r2, #0xda
	add r2, r2, #0x3400
#endif
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	str r2, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	bl CreateScrollBoxSingle
	mov r6, r0
	mov r4, #0x16
_02386E3C:
	mov r0, r4
	bl AdvanceFrame
	mov r0, r6
	bl IsScrollBoxActive
	cmp r0, #0
	bne _02386E3C
	mov r0, r6
	bl CloseScrollBox
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
_02386E68:
	mov r6, #2
	b _02386EBC
_02386E70:
	bl ov29_022EB804
	cmp r0, #0
	beq _02386D70
	ldr r0, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r4, [r5, #0xb4]
	ldr r0, [r0]
	ldr r1, _02386F28 ; =ov29_0237C91C
	ldr r2, [r0, #0x124]
	add r0, r4, #0x4a
	mov r2, r2, lsl #3
	ldrh r1, [r1, r2]
	bl SetMonsterActionFields
	mov r6, #0
	strb r6, [r4, #0x4e]
	strh r6, [r4, #0x50]
	strh r6, [r4, #0x52]
	strb r6, [r4, #0x54]
	strh r6, [r4, #0x56]
	strh r6, [r4, #0x58]
_02386EBC:
	mov r0, #0x2d
	bl AdvanceFrame
	cmp r6, #2
	beq _02386C90
	ldr r0, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	cmp r0, #0
	beq _02386EF8
	bl ov31_02386C14
	ldr r0, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02386F0C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A27C
	mov r1, #0
	str r1, [r0]
_02386EF8:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add sp, sp, #0xf4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02386F0C: .word OVERLAY31_UNKNOWN_POINTER__NA_238A27C
_02386F10: .word DUNGEON_WINDOW_PARAMS_18
_02386F14: .word ov31_02386B28
_02386F18: .word DUNGEON_WINDOW_PARAMS_17
_02386F1C: .word 0x00000213
_02386F20: .word 0x00001013
_02386F24: .word DUNGEON_WINDOW_PARAMS_19
#ifdef JAPAN
_023881A0: .word 0x00001D2B
#endif
_02386F28: .word ov29_0237C91C
	arm_func_end ov31_02386C6C

	arm_func_start ov31_02386F2C
ov31_02386F2C: ; 0x02386F2C
	stmdb sp!, {r3, lr}
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x294
	add r0, r0, #0x400
	bl ov29_0234E988
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x97]
	cmp r0, r1
	beq _02386F64
	bl CloseAdvancedTextBox
_02386F64:
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _02386F98
	bl CloseAdvancedTextBox
	bl sub_020407C0
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x698]
_02386F98:
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x96]
	cmp r0, r1
	beq _02386FB8
	bl CloseTextBox
_02386FB8:
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x3a4
	add r0, r0, #0x400
	bl ov31_023899D4
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x3a8
	add r0, r0, #0x400
	bl ov31_02388714
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x95
	add r0, r0, #0x600
	bl ov29_0234E988
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02387010 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02387010: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
	arm_func_end ov31_02386F2C

	arm_func_start ov31_02387014
ov31_02387014: ; 0x02387014
	ldr r1, [r0, #0xb4]
	ldr ip, _02387044 ; =ov31_023899B8
	ldrb r0, [r1, #7]
	mov r2, #1
	cmp r0, #0
	movne r1, #0xb
	ldr r0, _02387048 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldreqb r1, [r1, #0xa8]
	ldr r0, [r0]
	and r1, r1, #0xff
	ldr r0, [r0, #0x7a4]
	bx ip
	.align 2, 0
_02387044: .word ov31_023899B8
_02387048: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
	arm_func_end ov31_02387014

	arm_func_start TeamMenu
TeamMenu: ; 0x0238704C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x13c
	mov sl, r0
	ldr r0, _02387614 ; =0x000007AC
	mov r1, #8
	bl MemAlloc
	ldr r1, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	str r0, [r1]
	bl ov31_023880D8
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	str sl, [r0, #0x69c]
	bl ov29_0234EBCC
	mov r7, #0
	add r0, sp, #0xb0
	mov r1, #1
	mov r2, r7
	mov r3, r7
	str r7, [sp]
	mov r8, r7
	bl ov29_0234EA18
	ldr r2, _0238761C ; =ov31_02387014
	add r0, sp, #0xb0
	mov r1, #0xe
	mov r3, r7
	bl ov31_02388114
	ldr r2, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r1, _02387620 ; =DUNGEON_WINDOW_PARAMS_22
	ldr r3, [r2]
	str r0, [r3, #0x7a8]
	ldr r0, [r2]
	ldr r0, [r0, #0x7a8]
	bl ov31_02388444
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	add r1, sp, #8
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_02388704
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, r1, #8
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, asr #0x10
	bl ov31_0238991C
	ldr r3, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r1, #0xb
	ldr r4, [r3]
	mov r2, r7
	str r0, [r4, #0x7a4]
	ldr r0, [r3]
	ldr r0, [r0, #0x7a4]
	bl ov31_023899B8
_02387124:
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_02388534
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_023886D4
	cmp r0, #1
	moveq r7, #1
	beq _023875D8
	cmp r0, #2
	bne _02387184
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r8, #1
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_023886DC
	ldr r1, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r2, [r1]
	str r0, [r2, #0x760]
	ldr r0, [r1]
	ldr sb, [r0, #0x760]
	b _023871B0
_02387184:
	cmp r0, #3
	bne _023871B0
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_023886DC
	ldr r1, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r2, [r1]
	str r0, [r2, #0x760]
	ldr r0, [r1]
	ldr sb, [r0, #0x760]
_023871B0:
	bl ov29_022EBA70
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	add r1, sp, #0xb0
	ldr r2, [r0]
	ldr r0, _02387624 ; =DUNGEON_PTR
	ldr r2, [r2, #0x760]
	ldr r3, [r0]
	add r0, r1, r2, lsl #5
	ldr r1, [r0, #4]
	mov r0, #0x1b
	add r1, r3, r1, lsl #2
	add r1, r1, #0x12000
#ifdef JAPAN
	ldr r4, [r1, #0xa84]
#else
	ldr r4, [r1, #0xb28]
#endif
	mov r1, #0
	ldr r5, [r4, #0xb4]
	bl AddDungeonSubMenuOption
	mov r0, #0x19
	mov r1, #0
	bl AddDungeonSubMenuOption
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02387278
	ldr r0, _02387624 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x75d]
	cmp r0, #0
	ldreqb r0, [r1, #0x75e]
	cmpeq r0, #0
	bne _0238726C
	ldrsh r0, [r5, #0xc]
	bl GetActiveTeamMember
	ldrsh r1, [r0, #8]
	ldr r0, _02387628 ; =0x00005AA5
	cmp r1, r0
	beq _0238726C
	ldrb r0, [r5, #0x48]
	bl JoinedAtRangeCheck2Veneer
	cmp r0, #0
	beq _02387260
	ldr r0, _02387624 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75c]
	cmp r0, #0
	beq _0238726C
_02387260:
	mov r0, #0x34
	mov r1, #0
	bl AddDungeonSubMenuOption
_0238726C:
	mov r0, #0x1c
	mov r1, #0
	bl AddDungeonSubMenuOption
_02387278:
	mov r0, #0x30
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0x1a
	mov r1, #0
	bl AddDungeonSubMenuOption
	ldrb r0, [r5, #7]
	cmp r0, #0
	ldreq r0, _02387624 ; =DUNGEON_PTR
	ldreq r1, [r0]
	ldreqb r0, [r1, #0x75e]
	cmpeq r0, #0
	bne _02387320
	ldrb r0, [r1, #0x75c]
	cmp r0, #0
	beq _02387320
	ldrb r0, [r1, #0x748]
	bl GetLeaderChangeFlag
	cmp r0, #0
	beq _02387320
	mov r0, #0x3b
	mov r1, #0
	bl AddDungeonSubMenuOption
	ldrsh r0, [r5, #0xc]
	mov r6, #1
	cmp r0, #4
	movge r6, #0
	bge _023872FC
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl ov29_022F9C34
	cmp r0, #0
	movne r6, #0
_023872FC:
	mov r0, r4
	mov r1, #0
	bl CheckVariousStatuses2
	cmp r0, #0
	movne r6, #0
	cmp r6, #0
	bne _02387320
	mov r0, #0x3b
	bl DisableDungeonSubMenuOption
_02387320:
	mov r0, r5
	bl IsExperienceLocked
	cmp r0, #0
	beq _0238735C
	mov r0, #0x19
	bl DisableDungeonSubMenuOption
	mov r0, #0x3b
	bl DisableDungeonSubMenuOption
	mov r0, #0x1a
	bl DisableDungeonSubMenuOption
	mov r0, #0x30
	bl DisableDungeonSubMenuOption
	mov r0, #0x34
	bl DisableDungeonSubMenuOption
	b _02387380
_0238735C:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02387380
	mov r0, r4
	bl ov29_0234FBD4
	cmp r0, #0
	bne _02387380
	mov r0, #0x1a
	bl DisableDungeonSubMenuOption
_02387380:
	bl ov29_022EB9A0
	cmp r8, #0
	beq _023873C8
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r3, [sl, #0xb4]
	ldr r0, [r0]
	add r1, sp, #0xb4
	ldr r2, [r0, #0x760]
	add r0, r3, #0x4a
	ldr r1, [r1, r2, lsl #5]
	bl ov29_022EBA94
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r7, #0
	ldr r0, [r0]
	add r0, r0, #0x294
	add r0, r0, #0x400
	bl ov29_0234E988
	b _023875D8
_023873C8:
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	cmp sb, #0
	ldr r0, [r0]
	moveq r2, #1
	add r1, r0, #0x188
	movne r2, #0
	add r0, r0, #0x530
	add r1, r1, #0x400
	bl ov31_0238513C
	bl ov29_022EBA84
	mov r2, #0
	ldr r1, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	b _02387410
_023873FC:
	ldr r3, [r1]
	add r4, r2, #1
	add r3, r3, r2, lsl #3
	mov r2, r4
	str r4, [r3, #0x534]
_02387410:
	cmp r2, r0
	blt _023873FC
	ldr r4, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r3, _0238762C ; =0x00000A3C
	ldr r0, [r4]
	mvn r1, #0
	add r0, r0, r2, lsl #3
	add r0, r0, #0x500
	strh r3, [r0, #0x30]
	ldr r0, [r4]
	mov r5, #0
	add r0, r0, r2, lsl #3
	str r1, [r0, #0x534]
	ldr r3, [r4]
	mov r0, #0xa
	add r3, r3, r2, lsl #3
	add r3, r3, #0x500
	strh r5, [r3, #0x38]
	ldr r3, [r4]
	add r2, r3, r2, lsl #3
	str r1, [r2, #0x53c]
	ldr r1, [r4]
	add r1, r1, #0x188
	add r1, r1, #0x400
	str r1, [sp, #0x78]
	bl Arm9LoadUnkFieldNa0x2029EC8
	add r4, r0, #1
	ldr r1, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, _02387630 ; =DUNGEON_WINDOW_PARAMS_23
	ldr r3, [r1]
	ldr r1, _02387634 ; =0x00000233
	add r2, sp, #0x18
	add r3, r3, #0x530
	str r4, [sp, #0x18]
	bl CreateParentMenuFromStringIds
	ldr r4, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r6, #0x1b
	ldr r1, [r4]
	add fp, sp, #4
	strb r0, [r1, #0x694]
_023874B0:
	mov r0, r6
	bl AdvanceFrame
	mov r0, r5
	mov r1, fp
	bl GetPressedButtons
	ldr r0, [r4]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x94]
	bl IsParentMenuActive
	cmp r0, #0
	ldr r0, [r4]
	add r0, r0, #0x600
	bne _02387578
	ldrsb r0, [r0, #0x94]
	bl sub_0202ABB0
	subs r1, r0, #1
	bmi _0238754C
	ldr r0, [r4]
	str r1, [r0, #0x760]
	ldr r0, [r4]
	ldr r0, [r0, #0x760]
	bl ov29_022EB804
	cmp r0, #0
	beq _023874B0
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r1, _02387638 ; =ov29_0237C91C
	ldr r0, [r0]
	ldr r5, [sl, #0xb4]
	ldr r2, [r0, #0x760]
	add r0, r5, #0x4a
	mov r2, r2, lsl #3
	ldrh r1, [r1, r2]
	bl SetMonsterActionFields
	add r0, sp, #0xb0
	add r0, r0, sb, lsl #5
	ldr r0, [r0, #4]
	mov r4, #0
	strb r0, [r5, #0x4e]
	b _02387594
_0238754C:
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x294
	add r0, r0, #0x400
	bl ov29_0234E988
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	ldr r0, [r0, #0x7a8]
	bl ov31_023886F4
	mov r4, #1
	b _02387594
_02387578:
	ldrsb r0, [r0, #0x94]
	bl sub_0202AB80
	mov r1, r0
	mov r0, #0xa
	and r1, r1, #0xff
	bl Arm9StoreUnkFieldNa0x2029ED8
	b _023874B0
_02387594:
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x294
	add r0, r0, #0x400
	bl ov29_0234E988
	cmp r4, #1
	beq _02387124
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x95
	add r0, r0, #0x600
	bl ov29_0234E988
	ldr r0, _02387618 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x3a4
	add r0, r0, #0x400
	bl ov31_023899D4
_023875D8:
	cmp r7, #0
	beq _023875F0
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
_023875F0:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	bl ov31_02386F2C
	mov r0, #0x1b
	bl AdvanceFrame
	mov r0, r7
	add sp, sp, #0x13c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02387614: .word 0x000007AC
_02387618: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
_0238761C: .word ov31_02387014
_02387620: .word DUNGEON_WINDOW_PARAMS_22
_02387624: .word DUNGEON_PTR
_02387628: .word 0x00005AA5
#ifdef JAPAN
_0238762C: .word 0x00000877
#else
_0238762C: .word 0x00000A3C
#endif
_02387630: .word DUNGEON_WINDOW_PARAMS_23
_02387634: .word 0x00000233
_02387638: .word ov29_0237C91C
	arm_func_end TeamMenu

	arm_func_start ov31_0238763C
ov31_0238763C: ; 0x0238763C
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov31_0238763C

	arm_func_start ov31_02387660
ov31_02387660: ; 0x02387660
	ldr r1, _02387680 ; =DUNGEON_PTR
	ldrb r0, [r0, #4]
	ldr r1, [r1]
	ldr ip, _02387684 ; =ov31_0238948C
	add r0, r1, r0, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r0, [r0, #0xa84]
#else
	ldr r0, [r0, #0xb28]
#endif
	bx ip
	.align 2, 0
_02387680: .word DUNGEON_PTR
_02387684: .word ov31_0238948C
	arm_func_end ov31_02387660

	arm_func_start ov31_02387688
ov31_02387688: ; 0x02387688
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x78
	ldr r2, _02387788 ; =DUNGEON_PTR
	ldrb r0, [r0, #4]
	ldr r2, [r2]
	mov r4, r1
	add r0, r2, r0, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr sb, [r0, #0xa84]
#else
	ldr sb, [r0, #0xb28]
#endif
	bl ov29_022EA62C
	cmp r4, #0
	beq _023876C4
	mov r0, sb
	bl ov31_023889DC
	b _0238776C
_023876C4:
	ldr r0, [sb, #0xb4]
	bl IsExperienceLocked
	cmp r0, #0
	movne r4, #1
	bne _023876E4
	cmp r4, #0
	movne r4, #2
	moveq r4, #0
_023876E4:
	add r0, sp, #0
	mov r1, sb
	bl CreateMonsterSummaryFromMonster
	mov r2, #0
	add r0, sp, #0
	mov r1, r4
	strh r2, [sp, #0x40]
	strh r2, [sp, #0x56]
	bl sub_0203F150
	mov r7, #0x62
	mov r6, r7
	mov r5, r7
	mov r4, #1
	mov fp, #0x1c
	mov r8, #0
_02387720:
	mov sl, r8
	bl ov29_022EA62C
_02387728:
	mov r0, r7
	bl AdvanceFrame
	bl sub_0203F398
	cmp r0, #2
	beq _0238775C
	cmp r0, #1
	bne _02387728
	bl sub_0203F990
	mov r0, r6
	bl AdvanceFrame
	mov r0, r5
	bl AdvanceFrame
	mov sl, r4
_0238775C:
	mov r0, fp
	bl AdvanceFrame
	cmp sl, #0
	beq _02387720
_0238776C:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, sb
	bl ov29_023021F0
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02387788: .word DUNGEON_PTR
	arm_func_end ov31_02387688

	arm_func_start ov31_0238778C
ov31_0238778C: ; 0x0238778C
	stmdb sp!, {r4, lr}
	ldr r1, _023877C0 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x92]
	bl StringFromId
	mov r1, #2
	mov r3, r0
	mov r0, r4
	mov r2, r1
	bl DrawTextInWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_023877C0: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
	arm_func_end ov31_0238778C

	arm_func_start ov31_023877C4
ov31_023877C4: ; 0x023877C4
	ldr r2, _023877E4 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr ip, _023877E8 ; =DrawTextInWindow
	ldr r3, [r2]
	mov r1, #2
	add r3, r3, #0x12
	mov r2, #0x10
	add r3, r3, #0x600
	bx ip
	.align 2, 0
_023877E4: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
_023877E8: .word DrawTextInWindow
	arm_func_end ov31_023877C4

	arm_func_start ov31_023877EC
ov31_023877EC: ; 0x023877EC
#ifdef JAPAN
#define OV31_023877EC_OFFSET -8
#define OV31_023877EC_OFFSET_2 -4
#define OV31_023877EC_OFFSET_3 -0xA4
#else
#define OV31_023877EC_OFFSET 0
#define OV31_023877EC_OFFSET_2 0
#define OV31_023877EC_OFFSET_3 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2a4 + OV31_023877EC_OFFSET
	mov r4, #0
	movs sl, r0
#ifndef JAPAN
	str r3, [sp, #8]
#endif
	subne r0, r4, #1
	strne r0, [sl]
	mov sb, r1
	ldr r0, _02388080 ; =0x000007AC
	mov r1, #8
	mov fp, r2
	bl MemAlloc
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	str r0, [r1]
	bl ov31_023880D8
	mov r7, #0
	mov r6, r7
_02387830:
	ldr r0, _02388088 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
	ldr r5, [r0, #0xb28 + OV31_023877EC_OFFSET_3]
	mov r0, r5
	bl ov31_0238763C
	cmp r0, #0
	beq _0238789C
	cmp fp, #0
	beq _0238786C
	mov r0, r5
	ldr r8, [r5, #0xb4]
	bl ov29_02347100
#ifdef JAPAN
	strb r0, [r8, #0x15d]
#else
	strb r0, [r8, #0x161]
#endif
_0238786C:
	add r0, sp, #0x218 + OV31_023877EC_OFFSET
	add r0, r0, r7, lsl #5
	str r6, [r0, #4]
	ldr r0, [r5, #0xb4]
#ifdef JAPAN
	ldrb r0, [r0, #0x15d]
#else
	ldrb r0, [r0, #0x161]
#endif
	cmp r0, #0
	movne r1, #0
	add r0, sp, #0x218 + OV31_023877EC_OFFSET
	add r0, r0, r7
	moveq r1, #3
	strb r1, [r0, #0x84]
	add r7, r7, #1
_0238789C:
	add r6, r6, #1
	cmp r6, #4
	blt _02387830
	mov r6, r7
	mvn r5, #0
	add r3, sp, #0x218 + OV31_023877EC_OFFSET
	mov r1, #0
	b _023878D0
_023878BC:
	add r2, r3, r6, lsl #5
	add r0, r3, r6
	str r5, [r2, #4]
	strb r1, [r0, #0x84]
	add r6, r6, #1
_023878D0:
	cmp r6, #4
	blt _023878BC
	mov r0, #0xb
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r2, #0
	ldr r3, [r1]
	str r0, [r3, #0x760]
	ldr r0, [r1]
	str r7, [r0, #0x764]
	ldr r0, [r1]
	str r7, [r0, #0x768]
	ldr r0, [r1]
	str r2, [r0, #0x76c]
	ldr r0, [r1]
	str r2, [r0, #0x770]
	ldr r0, [r1]
	str r2, [r0, #0x754]
	ldr r0, [r1]
	str r2, [r0, #0x758]
	bl ov29_022EA62C
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x95
	add r0, r0, #0x600
	bl ov29_0234E988
	mov r5, #0
	add r0, sp, #0x68 + OV31_023877EC_OFFSET
	mov r1, r5
	mov r2, #0x80
	bl memset
	mov r8, r5
	ldr fp, _0238808C ; =0x000003E7
	b _02387B80
_02387958:
	add r0, sp, #0x218 + OV31_023877EC_OFFSET
	add r0, r0, r8, lsl #5
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _02387B7C
	ldr r0, _02388088 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28 + OV31_023877EC_OFFSET_3]
	mov r0, r6
	bl ov31_0238763C
	cmp r0, #0
	beq _02387B7C
	add r0, sp, #0x218 + OV31_023877EC_OFFSET
	add r0, r0, r8
	ldrb r0, [r0, #0x84]
	ldr r6, [r6, #0xb4]
	cmp r0, #0
	movne r0, #0x57
	moveq r0, #0x44
	and r2, r0, #0xff
	add r0, sp, #0x68 + OV31_023877EC_OFFSET
	mov r1, r6
	bl ov29_023002F0
	add r0, sp, #0x68 + OV31_023877EC_OFFSET
	str r0, [sp, #0x50 + OV31_023877EC_OFFSET]
	ldrsh r0, [r6, #0xc]
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl ov29_022F9C34
	cmp r0, #0
	ldrsh r1, [r6, #0x12]
	ldrsh r0, [r6, #0x16]
	beq _02387A84
	add r1, r1, r0
	cmp r1, fp
	movgt r3, fp
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r6, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02387A18
	ldr r1, _02388090 ; =ov31_0238A044
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bl strcpy
	b _02387B20
_02387A18:
	cmp r1, fp
	movgt r3, fp
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _02387A48
	ldr r1, _02388094 ; =ov31_0238A04C
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bl strcpy
	b _02387B20
_02387A48:
	cmp r1, fp
	movgt r1, fp
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bgt _02387A78
	ldr r1, _02388098 ; =ov31_0238A054
	bl strcpy
	b _02387B20
_02387A78:
	ldr r1, _0238809C ; =ov31_0238A05C
	bl strcpy
	b _02387B20
_02387A84:
	add r1, r1, r0
	cmp r1, fp
	movgt r3, fp
	movle r3, r1
	mov r2, r3, asr #1
	ldrsh r0, [r6, #0x10]
	add r2, r3, r2, lsr #30
	cmp r0, r2, asr #2
	bgt _02387AB8
	ldr r1, _023880A0 ; =ov31_0238A064
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bl strcpy
	b _02387B20
_02387AB8:
	cmp r1, fp
	movgt r3, fp
	movle r3, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	cmp r0, r2, lsl #1
	bgt _02387AE8
	ldr r1, _023880A4 ; =ov31_0238A06C
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bl strcpy
	b _02387B20
_02387AE8:
	cmp r1, fp
	movgt r1, fp
	mov r2, r1, asr #1
	add r1, r1, r2, lsr #30
	mov r1, r1, asr #2
	add r1, r1, r1, lsl #1
	cmp r0, r1
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	bgt _02387B18
	ldr r1, _023880A8 ; =ov31_0238A074
	bl strcpy
	b _02387B20
_02387B18:
	ldr r1, _023880AC ; =ov31_0238A07C
	bl strcpy
_02387B20:
	add r0, sp, #0xa8 + OV31_023877EC_OFFSET
	str r0, [sp, #0x54 + OV31_023877EC_OFFSET]
	add r0, sp, #0x18 + OV31_023877EC_OFFSET
	str r0, [sp]
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r2, _023880B0 ; =ov31_0238A084
	ldr r0, [r0]
	mov r1, #0x100
	add r0, r0, #0x30
	add r0, r0, r5, lsl #8
	mov r3, #0
	bl PreprocessString
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r1, r5, lsl #3
	ldr r2, [r0]
	add r0, r2, #0x30
	add r0, r0, r5, lsl #8
	str r0, [r2, r5, lsl #3]
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	add r5, r5, #1
	ldr r0, [r0]
	add r0, r0, r1
	str r5, [r0, #4]
_02387B7C:
	add r8, r8, #1
_02387B80:
	cmp r8, r7
	blt _02387958
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #1
	str r3, [r1, r5, lsl #3]
	ldr r1, [r0]
	ldr r0, _02388088 ; =DUNGEON_PTR
	add r1, r1, r5, lsl #3
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrb r5, [r0, #0x75b]
	cmp r5, #0
	ldrne r1, _023880B4 ; =0x00000A3A
	movne r0, #0x10
	strne r0, [sp, #0xf4 + OV31_023877EC_OFFSET]
	mov r0, #0xb
	strneh r1, [sp, #0xf0 + OV31_023877EC_OFFSET]
	bl Arm9LoadUnkFieldNa0x2029EC8
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	cmp r5, #0
	ldr r3, [r1]
	add r2, sp, #0x29c + OV31_023877EC_OFFSET
	str r0, [r3, #0x760]
	ldr r0, [r1]
	movne r1, #0x800
	ldr r0, [r0, #0x760]
	moveq r1, #0
	add r0, r0, #1
	str r0, [sp, #0xe8 + OV31_023877EC_OFFSET]
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	orr r1, r1, #0x33
	ldr r3, [r0]
	str r2, [sp, #0x148 + OV31_023877EC_OFFSET]
	ldr r0, _023880B8 ; =DUNGEON_WINDOW_PARAMS_21
	add r2, sp, #0xe8 + OV31_023877EC_OFFSET
	orr r1, r1, #0x1200
	bl CreateParentMenu
	ldr r2, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r1, _023880BC ; =ov31_0238778C
	ldr r2, [r2]
	strb r0, [r2, #0x695]
	ldr r0, _023880C0 ; =DUNGEON_WINDOW_PARAMS_24
	bl CreateTextBox
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r3, _023880C4 ; =0x00000A36
	ldr r2, [r1]
	mov r5, #0x10
	strb r0, [r2, #0x696]
	ldr r2, [r1]
	str r5, [sp, #0x18c + OV31_023877EC_OFFSET]
	add r0, r2, #0x92
	add r1, r0, #0x500
	add r0, sp, #0x118 + OV31_023877EC_OFFSET
	strh r3, [r0, #0x70]
	str r1, [sp, #0x1c8 + OV31_023877EC_OFFSET]
	cmp sb, #3
	bne _02387CA8
	add r1, r3, #3
	add r0, r2, #0x600
	strh r1, [r0, #0x92]
	mov r5, #0
	str r5, [sp]
	ldr r0, _023880C8 ; =DUNGEON_WINDOW_PARAMS_20
	ldr r3, _023880CC ; =ov31_023877C4
	add r2, sp, #0x180 + OV31_023877EC_OFFSET
	mov r1, #0x800
	str r5, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r1, [r1]
	strb r0, [r1, #0x697]
	b _02387CF4
_02387CA8:
	cmp sb, #2
	addne r1, r3, #3
	addne r0, r2, #0x600
	strneh r1, [r0, #0x92]
	bne _02387CF4
	add r1, r3, #2
	add r0, r2, #0x600
	strh r1, [r0, #0x92]
	mov r5, #0
	str r5, [sp]
	ldr r0, _023880C8 ; =DUNGEON_WINDOW_PARAMS_20
	ldr r3, _023880CC ; =ov31_023877C4
	add r2, sp, #0x180 + OV31_023877EC_OFFSET
	mov r1, #0x800
	str r5, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r1, [r1]
	strb r0, [r1, #0x697]
_02387CF4:
	sub r0, sb, #2
#ifdef JAPAN
	str r0, [sp, #0xc]
	ldr r0, _023880D0 ; =0x00000872
	ldr r5, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r8, #0x3d8
	rsb fp, r0, #0x870
#else
	mvn r7, #0x3d8
	str r0, [sp, #0x10]
	add r0, r7, #0xe10
	ldr r5, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	str r0, [sp, #0x14]
	mov fp, r7, asr #9
#endif
_02387D10:
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x95]
	bl sub_0202AB80
	ldr r1, [r5]
	str r0, [r1, #0x760]
	ldr r1, [r5]
	mov r0, #0xb
	ldr r1, [r1, #0x760]
	and r1, r1, #0xff
	bl Arm9StoreUnkFieldNa0x2029ED8
	ldr r0, [r5]
	ldr r1, [r0, #0x760]
	add r0, sp, #0x218 + OV31_023877EC_OFFSET
	add r0, r0, r1, lsl #5
	ldr r6, [r0, #4]
	cmp r6, #0
	blt _02387EC0
	ldr r0, _02388088 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
	mov r0, r7
	bl ov31_0238763C
	cmp r0, #0
	cmpne r8, r6
	beq _02387E98
	cmp sb, #1
	bne _02387DCC
	mov r0, r7
#else
	ldr r8, [r0, #0xb28]
	mov r0, r8
	bl ov31_0238763C
	cmp r0, #0
	cmpne r7, r6
	beq _02387E98
	cmp sb, #1
	bne _02387DCC
	mov r0, r8
#endif
	bl sub_0203F9CC
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x98]
	cmp r0, fp
	bne _02387DC0
	mov r1, #0
	mov r0, #7
	mov r2, r1
	bl sub_0204018C
	ldr r1, [r5]
	strb r0, [r1, #0x698]
	b _02387DC4
_02387DC0:
	bl sub_02041178
_02387DC4:
	bl sub_020407EC
	b _02387E98
_02387DCC:
	ldr r0, [sp, #0x10 + OV31_023877EC_OFFSET_2]
	cmp r0, #1
	bhi _02387E98
	ldr r1, [r5]
	add r0, r1, #0x600
	ldrsb r0, [r0, #0x97]
	str r0, [sp, #0xc + OV31_023877EC_OFFSET_2]
	cmp r0, fp
	beq _02387E98
	add r0, r1, #0x92
#ifdef JAPAN
	ldr r8, [r7, #0xb4]
	add r0, r0, #0x500
	mov r1, r7
	mov r2, #0
	bl ov29_022E2A78
	ldrb r0, [r8, #0xbc]
	cmp r0, #7
	beq _02387E24
	mov r0, r8
#else
	ldr r7, [r8, #0xb4]
	add r0, r0, #0x500
	mov r1, r8
	mov r2, #0
	bl ov29_022E2A78
	ldrb r0, [r7, #0xbc]
	cmp r0, #7
	beq _02387E24
	mov r0, r7
#endif
	bl IsExperienceLocked
	cmp r0, #0
	beq _02387E3C
_02387E24:
#ifdef JAPAN
	ldr r0, _023880D0 ; =0x00000872
	ldr r2, [r5]
	add r1, r0, #6
	add r0, r2, #0x12
#else
	ldr r0, [r5]
	ldr r1, _023880D0 ; =0x00000A3D
	add r0, r0, #0x12
#endif
	add r0, r0, #0x600
	bl GetStringFromFileVeneer
	b _02387E90
_02387E3C:
#ifdef JAPAN
	ldrb r0, [r8, #0x62]
#else
	ldrb r0, [r7, #0x62]
#endif
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _02387E6C
	ldr r0, [r5]
#ifdef JAPAN
	ldr r1, _023880D0 ; =0x00000872
#else
	ldr r1, [sp, #0x14]
#endif
	add r0, r0, #0x12
	add r0, r0, #0x600
	bl GetStringFromFileVeneer
	b _02387E90
_02387E6C:
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5]
	ldr r2, _023880D4 ; =OVERLAY31_UNKNOWN_STRUCT__NA_2389FE8
	add r0, r0, #0x12
#ifdef JAPAN
	add r1, r8, #0x62
#else
	add r1, r7, #0x62
#endif
	add r0, r0, #0x600
	mov r3, #1
	bl sub_0200D310
_02387E90:
	ldr r0, [sp, #0xc + OV31_023877EC_OFFSET_2]
	bl SetAdvancedTextBoxField0x1C2
_02387E98:
#ifdef JAPAN
	mov r0, r7
	mov r1, #0
	mov r2, #1
	mov r8, r6
	bl TryPointCameraToMonster
	mov r2, #1
	add r0, r7, #4
#else
	mov r0, r8
	mov r1, #0
	mov r2, #1
	mov r7, r6
	bl TryPointCameraToMonster
	mov r2, #1
	add r0, r8, #4
#endif
	mov r1, #0
	mov r3, r2
	bl DrawTileGrid
_02387EC0:
	mov r0, #0x1b
	bl AdvanceFrame
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x95]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02387D10
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x95]
	bl sub_0202ABB0
	subs r3, r0, #1
	bmi _02387F24
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	add r1, sp, #0x29c + OV31_023877EC_OFFSET
	ldr r2, [r0]
	str r3, [r2, #0x760]
	ldr r0, [r0]
	ldr r0, [r0, #0x760]
	ldrb r0, [r1, r0]
	cmp r0, #0
	movne r4, #1
	b _02387F28
_02387F24:
	mov r4, #1
_02387F28:
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x97]
	cmp r0, r1
	beq _02387F58
	bl CloseAdvancedTextBox
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x697]
_02387F58:
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _02387F8C
	bl CloseAdvancedTextBox
	bl sub_020407C0
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x698]
_02387F8C:
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrsb r0, [r0, #0x96]
	bl CloseTextBox
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x1b
	strb r2, [r1, #0x696]
	bl AdvanceFrame
	cmp sb, #3
	bne _02387FEC
	cmp r4, #0
	beq _0238800C
	bl HideTileGrid
#ifndef JAPAN
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0238800C
#endif
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	b _0238800C
_02387FEC:
	bl HideTileGrid
#ifndef JAPAN
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0238800C
#endif
	bl GetLeader
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
_0238800C:
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #4
	mov r1, #0x3e
	bl ov29_022EA370
	cmp r4, #0
	beq _02388038
	bl ov31_02386F2C
	mov r0, #0
	b _02388078
_02388038:
	ldr r0, _02388084 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A280
	add r1, sp, #0x21c + OV31_023877EC_OFFSET
	ldr r0, [r0]
	cmp sl, #0
	ldr r0, [r0, #0x760]
	ldr r4, [r1, r0, lsl #5]
	strne r4, [sl]
	bl ov31_02386F2C
	cmp r4, #0
	movlt r0, #0
	blt _02388078
	ldr r0, _02388088 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x12000
	ldr r0, [r0, #0xb28 + OV31_023877EC_OFFSET_3]
_02388078:
	add sp, sp, #0x2a4 + OV31_023877EC_OFFSET
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef JAPAN
#define OV31_023877EC_DATA_OFFSET -0x1C5
#else
#define OV31_023877EC_DATA_OFFSET 0
#endif
_02388080: .word 0x000007AC
_02388084: .word OVERLAY31_UNKNOWN_POINTER__NA_238A280
_02388088: .word DUNGEON_PTR
_0238808C: .word 0x000003E7
_02388090: .word ov31_0238A044
_02388094: .word ov31_0238A04C
_02388098: .word ov31_0238A054
_0238809C: .word ov31_0238A05C
_023880A0: .word ov31_0238A064
_023880A4: .word ov31_0238A06C
_023880A8: .word ov31_0238A074
_023880AC: .word ov31_0238A07C
_023880B0: .word ov31_0238A084
_023880B4: .word 0x00000A3A + OV31_023877EC_DATA_OFFSET
_023880B8: .word DUNGEON_WINDOW_PARAMS_21
_023880BC: .word ov31_0238778C
_023880C0: .word DUNGEON_WINDOW_PARAMS_24
_023880C4: .word 0x00000A36 + OV31_023877EC_DATA_OFFSET
_023880C8: .word DUNGEON_WINDOW_PARAMS_20
_023880CC: .word ov31_023877C4
#ifdef JAPAN
_023880D0: .word 0x00000872
#else
_023880D0: .word 0x00000A3D
#endif
_023880D4: .word OVERLAY31_UNKNOWN_STRUCT__NA_2389FE8
	arm_func_end ov31_023877EC

	arm_func_start ov31_023880D8
ov31_023880D8: ; 0x023880D8
	mov r2, #0
	strb r2, [r0, #0x592]
	strb r2, [r0, #0x612]
	sub r1, r2, #2
	strb r1, [r0, #0x695]
	strb r1, [r0, #0x694]
	strb r1, [r0, #0x696]
	strb r1, [r0, #0x697]
	strb r1, [r0, #0x698]
	str r2, [r0, #0x7a4]
	str r2, [r0, #0x7a8]
	str r2, [r0, #0x76c]
	str r2, [r0, #0x770]
	str r2, [r0, #0x760]
	bx lr
	arm_func_end ov31_023880D8

	arm_func_start ov31_02388114
ov31_02388114: ; 0x02388114
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldr r0, _02388154 ; =0x000006D4
	mov r4, r2
	mov r1, #8
	mov r5, r3
	bl MemAlloc
	mov r1, r7
	mov r2, r6
	mov r3, r4
	mov r4, r0
	str r5, [sp]
	bl ov31_02388158
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02388154: .word 0x000006D4
	arm_func_end ov31_02388114

	arm_func_start ov31_02388158
ov31_02388158: ; 0x02388158
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xdc
	mov sl, r0
	mvn r0, #1
	strb r0, [sl]
	ldr r4, [sp, #0x100]
	str r3, [sl, #0x6c4]
	str r4, [sl, #0x6c8]
	mov r0, #0
	str r0, [sl, #0x688]
	str r0, [sl, #0x68c]
	str r0, [sl, #0x67c]
	mov sb, r1
	str r2, [sl, #0x6c0]
	sub r0, r0, #1
	mov r7, sb
	str r0, [sl, #0x6b8]
	add r6, sl, #4
	mov r4, #8
_023881A4:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _023881A4
	ldmia r7, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	add r0, sp, #0xc
	mov r1, #0x80
	bl MemZero
	mov r4, #0
	add r0, sb, #0x14
	mov r7, r4
	str r0, [sp, #8]
	add fp, sl, #0xc0
	b _023883F4
_023881E0:
	ldr r0, [sb]
	cmp r0, #1
	bne _023882A0
	add r0, sb, r7, lsl #5
	ldr r1, [r0, #0x20]
	cmp r1, #0
	beq _023883F0
	moveq r0, #0
	beq _02388218
	ldr r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_02388218:
	cmp r0, #0
	beq _023883F0
	add r0, sb, r7
	ldrb r0, [r0, #0x84]
	ldr r6, [r1, #0xb4]
	add r1, sb, r7, lsl #5
	cmp r0, #0
	movne r0, #0x57
	moveq r0, #0x44
	and r2, r0, #0xff
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	add r0, sp, #0xc
	beq _02388264
	ldrb r2, [r1, #0x1e]
	ldr r1, [sp, #8]
	add r1, r1, r7, lsl #5
	bl sub_02054F44
	b _0238826C
_02388264:
	mov r1, r6
	bl ov29_023002F0
_0238826C:
	ldrsh r1, [r6, #0x12]
	ldrsh r0, [r6, #0x16]
	ldrsh r5, [r6, #0x10]
	add r8, r1, r0
	ldr r0, _0238841C ; =0x000003E7
	cmp r8, r0
	movgt r8, r0
	ldrsh r0, [r6, #0xc]
	bl GetActiveTeamMember
	ldrsh r0, [r0, #8]
	bl ov29_022F9C34
	str r0, [sp, #4]
	b _023882E8
_023882A0:
	cmp r0, #0
	bne _023882E8
	add r0, sb, r7, lsl #5
	ldr r6, [r0, #0x20]
	ldrb r0, [r6]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _023883F0
	ldrsh r5, [r6, #0xe]
	ldrsh r8, [r6, #0x10]
	ldrsh r0, [r6, #8]
	bl sub_02056228
	str r0, [sp, #4]
	mov r1, r6
	add r0, sp, #0xc
	bl sub_020585B4
_023882E8:
	add r0, sp, #0xc
	str r0, [sp, #0xc4]
	ldr r0, [sp, #4]
	cmp r0, #0
	mov r0, r8, asr #1
	add r0, r8, r0, lsr #30
	beq _02388360
	cmp r5, r0, asr #2
	mov r0, r0, asr #2
	bgt _02388320
	ldr r1, _02388420 ; =ov31_0238A0A8
	add r0, sp, #0x4c
	bl strcpy
	b _023883B8
_02388320:
	cmp r5, r0, lsl #1
	bgt _02388338
	ldr r1, _02388424 ; =ov31_0238A0B0
	add r0, sp, #0x4c
	bl strcpy
	b _023883B8
_02388338:
	add r0, r0, r0, lsl #1
	cmp r5, r0
	add r0, sp, #0x4c
	bgt _02388354
	ldr r1, _02388428 ; =ov31_0238A0B8
	bl strcpy
	b _023883B8
_02388354:
	ldr r1, _0238842C ; =ov31_0238A0C0
	bl strcpy
	b _023883B8
_02388360:
	cmp r5, r0, asr #2
	mov r0, r0, asr #2
	bgt _0238837C
	ldr r1, _02388430 ; =ov31_0238A0C8
	add r0, sp, #0x4c
	bl strcpy
	b _023883B8
_0238837C:
	cmp r5, r0, lsl #1
	bgt _02388394
	ldr r1, _02388434 ; =ov31_0238A0D0
	add r0, sp, #0x4c
	bl strcpy
	b _023883B8
_02388394:
	add r0, r0, r0, lsl #1
	cmp r5, r0
	add r0, sp, #0x4c
	bgt _023883B0
	ldr r1, _02388438 ; =ov31_0238A0D8
	bl strcpy
	b _023883B8
_023883B0:
	ldr r1, _0238843C ; =ov31_0238A0E0
	bl strcpy
_023883B8:
	add r0, sp, #0x4c
	str r0, [sp, #0xc8]
	add r0, sp, #0x8c
	str r0, [sp]
	ldr r2, _02388440 ; =ov31_0238A0E8
	add r0, fp, r4, lsl #8
	mov r1, #0x100
	mov r3, #0
	bl PreprocessString
	add r1, fp, r4, lsl #8
	add r0, sl, r4, lsl #3
	str r1, [r0, #0x90]
	add r4, r4, #1
	str r4, [r0, #0x94]
_023883F0:
	add r7, r7, #1
_023883F4:
	ldr r0, [sb, #0x88]
	cmp r7, r0
	blt _023881E0
	mov r0, #0
	add r1, sl, r4, lsl #3
	str r0, [r1, #0x90]
	sub r0, r0, #1
	str r0, [r1, #0x94]
	add sp, sp, #0xdc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238841C: .word 0x000003E7
_02388420: .word ov31_0238A0A8
_02388424: .word ov31_0238A0B0
_02388428: .word ov31_0238A0B8
_0238842C: .word ov31_0238A0C0
_02388430: .word ov31_0238A0C8
_02388434: .word ov31_0238A0D0
_02388438: .word ov31_0238A0D8
_0238843C: .word ov31_0238A0E0
_02388440: .word ov31_0238A0E8
	arm_func_end ov31_02388158

	arm_func_start ov31_02388444
ov31_02388444: ; 0x02388444
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x98
	mov r6, r0
	mov r5, r1
	bl ov29_0234E988
	mov r0, #0xb
	bl Arm9LoadUnkFieldNa0x2029EC8
	str r0, [r6, #0x67c]
	ldr r1, [r6, #0x8c]
	mov r0, #0
	str r1, [r6, #0x680]
	ldr r1, [r6, #0x8c]
	str r1, [r6, #0x684]
	str r0, [r6, #0x688]
	str r0, [r6, #0x68c]
	str r0, [r6, #0x670]
	str r0, [r6, #0x674]
	bl ov29_022EA62C
	ldr r0, _02388528 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r4, [r0, #0x75b]
	cmp r4, #0
	ldrne r1, _0238852C ; =0x00000A3A
	movne r0, #0x10
	strne r0, [sp, #0xc]
	strneh r1, [sp, #8]
	mov r0, #0xb
	bl Arm9LoadUnkFieldNa0x2029EC8
	str r0, [r6, #0x67c]
	add r1, r0, #1
	add r0, r6, #0x88
	str r1, [sp]
	str r0, [sp, #0x60]
	ldr r0, [r6, #0x6c0]
	add r2, sp, #0
	tst r0, #2
	beq _023884FC
	cmp r4, #0
	movne r3, #0x800
	ldr r1, _02388530 ; =0x00401233
	moveq r3, #0
	orr r1, r3, r1
	mov r0, r5
	add r3, r6, #0x90
	bl CreateParentMenuWrapper
	b _0238851C
_023884FC:
	cmp r4, #0
	movne r0, #0x800
	moveq r0, #0
	orr r1, r0, #0x33
	mov r0, r5
	orr r1, r1, #0x1200
	add r3, r6, #0x90
	bl CreateParentMenu
_0238851C:
	strb r0, [r6]
	add sp, sp, #0x98
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02388528: .word DUNGEON_PTR
#ifdef JAPAN
_0238852C: .word 0x00000875
#else
_0238852C: .word 0x00000A3A
#endif
_02388530: .word 0x00401233
	arm_func_end ov31_02388444

	arm_func_start ov31_02388534
ov31_02388534: ; 0x02388534
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0
	str r0, [sl, #0x6cc]
	add r4, sl, #0x2cc
	str r0, [r4, #0x404]
	add sb, sl, #4
	mov r5, #2
	mov r6, #0xb
	mov fp, #0x1b
	mov r8, r0
	add r7, sp, #0
_02388564:
	mov r0, r8
	mov r1, r7
	bl GetPressedButtons
	ldrsb r0, [sl]
	bl sub_0202AB80
	str r0, [sl, #0x67c]
	ldr r1, [sl, #0x6b8]
	cmp r1, r0
	beq _023885DC
	str r0, [sl, #0x6b8]
	ldr r1, [sb]
	cmp r1, #1
	bne _023885B8
	add r0, sb, r0, lsl #5
	ldr r0, [r0, #0x20]
	cmp r0, #0
	ldrne r1, [sl, #0x6c4]
	cmpne r1, #0
	beq _023885DC
	blx r1
	b _023885DC
_023885B8:
	cmp r1, #0
	bne _023885DC
	add r0, sb, r0, lsl #5
	ldr r0, [r0, #0x20]
	cmp r0, #0
	ldrne r1, [sl, #0x6c4]
	cmpne r1, #0
	beq _023885DC
	blx r1
_023885DC:
	ldr r1, [sl, #0x67c]
	mov r0, r6
	and r1, r1, #0xff
	bl Arm9StoreUnkFieldNa0x2029ED8
	ldr r0, [sl, #0x6c0]
	tst r0, #4
	beq _02388644
	ldrh r0, [sp]
	tst r0, #8
	beq _02388644
	ldr r0, [sl, #0x67c]
	add r0, sb, r0
	ldrb r0, [r0, #0x84]
	cmp r0, #0
	bne _02388638
	add r0, sl, #0x5c0
	mov r1, #0
	bl PlayWindowInputSound
	mov r0, #2
	str r0, [r4, #0x400]
	ldr r0, [sl, #0x6b8]
	str r0, [r4, #0x404]
	b _023886BC
_02388638:
	mov r1, r5
	add r0, sl, #0x5c0
	bl PlayWindowInputSound
_02388644:
	ldrsb r0, [sl]
	bl IsParentMenuActive
	cmp r0, #0
	bne _023886A8
	ldrsb r0, [sl]
	bl sub_0202ABB0
	subs r0, r0, #1
	bmi _0238869C
	ldrsb r0, [sl]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [sl, #0x67c]
	add r0, sb, r0
	ldrb r0, [r0, #0x84]
	cmp r0, #0
	moveq r0, #3
	streq r0, [r4, #0x400]
	ldreq r0, [sl, #0x67c]
	streq r0, [r4, #0x404]
	movne r0, #1
	strne r0, [r4, #0x400]
	b _023886BC
_0238869C:
	mov r0, #1
	str r0, [r4, #0x400]
	b _023886BC
_023886A8:
	mov r0, sl
	bl ov31_02388744
	mov r0, fp
	bl AdvanceFrame
	b _02388564
_023886BC:
	mov r0, sl
	bl ov31_02388744
	mov r0, #0x1b
	bl AdvanceFrame
	bl HideTileGrid
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov31_02388534

	arm_func_start ov31_023886D4
ov31_023886D4: ; 0x023886D4
	ldr r0, [r0, #0x6cc]
	bx lr
	arm_func_end ov31_023886D4

	arm_func_start ov31_023886DC
ov31_023886DC: ; 0x023886DC
	ldr r1, [r0, #0x6cc]
	sub r1, r1, #2
	cmp r1, #1
	ldrls r0, [r0, #0x6d0]
	mvnhi r0, #0
	bx lr
	arm_func_end ov31_023886DC

	arm_func_start ov31_023886F4
ov31_023886F4: ; 0x023886F4
	ldr ip, _02388700 ; =ResumeParentMenu
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02388700: .word ResumeParentMenu
	arm_func_end ov31_023886F4

	arm_func_start ov31_02388704
ov31_02388704: ; 0x02388704
	ldr ip, _02388710 ; =GetWindowRectangle
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02388710: .word GetWindowRectangle
	arm_func_end ov31_02388704

	arm_func_start ov31_02388714
ov31_02388714: ; 0x02388714
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_0234E988
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov31_02388714

	arm_func_start ov31_02388744
ov31_02388744: ; 0x02388744
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #0x6c0]
	tst r1, #8
	ldrne r1, [r0, #0x67c]
	addne r0, r0, r1, lsl #5
	ldrne r4, [r0, #0x24]
	cmpne r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	mov r2, #1
	bl TryPointCameraToMonster
	mov r2, #1
	mov r3, r2
	add r0, r4, #4
	mov r1, #0
	bl DrawTileGrid
	ldmia sp!, {r4, pc}
	arm_func_end ov31_02388744

	arm_func_start RestMenu
RestMenu: ; 0x0238878C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x9c
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r0, [r0]
	cmp r0, #0
	bne _023887CC
	mov r0, #0x10
	mov r1, #8
	bl MemAlloc
	ldr r1, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	ldr r0, [r1]
	sub r1, r2, #2
	strb r1, [r0, #4]
_023887CC:
	mov r3, #0
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mov r2, r3
_023887D8:
	ldr r1, [r0]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0xc]
	cmp r3, #2
	blt _023887D8
	bl ov29_022E08F4
	cmp r0, #0
	ldreq r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	moveq r1, #3
	ldreq r0, [r0]
	ldr ip, _023889BC ; =0x000008C2
	streqb r1, [r0, #0xc]
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mov r5, #0x10
	ldr r1, [r0]
	ldr r0, _023889C0 ; =DUNGEON_WINDOW_PARAMS_25
	add r4, r1, #0xc
	ldr r1, _023889C4 ; =0x00001A13
	ldr r3, _023889C8 ; =DUNGEON_SUBMENU_ITEMS_5
	add r2, sp, #4
	strh ip, [sp, #0xc]
	str r5, [sp, #0x10]
	str r4, [sp, #0x64]
	bl CreateParentMenuFromStringIds
	ldr r4, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mov r5, #0x62
	ldr r1, [r4]
	strb r0, [r1, #4]
_0238884C:
	mov r0, r5
	bl AdvanceFrame
	ldr r0, [r4]
	ldrsb r0, [r0, #4]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0238884C
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202ABB0
	ldr r1, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r1, [r1]
	str r0, [r1, #8]
	mov r0, #0x62
	bl AdvanceFrame
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseParentMenu
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #1
	beq _023888BC
	cmp r0, #2
	beq _02388908
	b _0238897C
_023888BC:
	mov r2, #1
	ldr r1, _023889CC ; =0x000008C5
	mov r3, r2
	mov r0, #0
	str r2, [sp]
	bl YesNoMenu
	cmp r0, #1
	movne r0, #1
	bne _023888F0
	bl GetLeaderAction
	mov r1, #0x2b
	bl SetMonsterActionFields
	mov r0, #0
_023888F0:
	cmp r0, #0
	ldreq r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mvneq r1, #0
	ldreq r0, [r0]
	streq r1, [r0, #8]
	b _02388984
_02388908:
	mov r2, #1
	ldr r1, _023889D0 ; =0x000008C6
	mov r3, r2
	mov r0, #0
	str r2, [sp]
	bl YesNoMenu
	cmp r0, #1
	movne r2, #1
	bne _02388964
	bl GetLeaderAction
	mov r1, #0x2e
	bl SetMonsterActionFields
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _023889D4 ; =0x0000025A
	mov r3, r1
	bl ov29_022ECDE4
	ldr r0, _023889D8 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	strb r1, [r0, #0x758]
_02388964:
	cmp r2, #0
	ldreq r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mvneq r1, #0
	ldreq r0, [r0]
	streq r1, [r0, #8]
	b _02388984
_0238897C:
	mvn r0, #0
	str r0, [r1, #8]
_02388984:
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	ldr r0, [r0]
	ldr r1, [r0, #8]
	cmp r1, #0
	bge _023887CC
	cmp r0, #0
	beq _023889B0
	bl MemFree
	ldr r0, _023889B8 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A284
	mov r1, #0
	str r1, [r0]
_023889B0:
	add sp, sp, #0x9c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define REST_MENU_OFFSET 0x1458
#else
#define REST_MENU_OFFSET 0
#endif
_023889B8: .word OVERLAY31_UNKNOWN_POINTER__NA_238A284
_023889BC: .word 0x000008C2 + REST_MENU_OFFSET
_023889C0: .word DUNGEON_WINDOW_PARAMS_25
_023889C4: .word 0x00001A13
_023889C8: .word DUNGEON_SUBMENU_ITEMS_5
_023889CC: .word 0x000008C5 + REST_MENU_OFFSET
_023889D0: .word 0x000008C6 + REST_MENU_OFFSET
_023889D4: .word 0x0000025A
_023889D8: .word DUNGEON_PTR
	arm_func_end RestMenu

	arm_func_start ov31_023889DC
ov31_023889DC: ; 0x023889DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r6, r0
	ldr r4, [r6, #0xb4]
	add r3, sp, #0xc
	add r0, r4, #0x9c
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #8
	mov r1, #0x62
	bl ov29_022EA370
	mov r0, r6
	mov r1, #1
	bl IsBlinded
	mov r3, r0
	ldrsh r0, [r4, #2]
	ldrsh r2, [r4, #0xe]
	add r1, r4, #0x90
	bl PrintIqSkillsMenu
	mov r5, #0x62
_02388A2C:
	bl sub_02041B7C
	movs r7, r0
	bne _02388A44
	mov r0, r5
	bl AdvanceFrame
	b _02388A2C
_02388A44:
	bl sub_020420F4
	mov r0, r6
	bl ov29_023021F0
	ldr r0, [r6, #0xb4]
	add r3, sp, #0
	add r0, r0, #0x9c
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	add r0, sp, #0xc
	mov r1, #0x38
	bl IqSkillFlagTest
	mov r5, r0
	add r0, sp, #0
	mov r1, #0x38
	bl IqSkillFlagTest
	cmp r5, #0
	bne _02388AA8
	cmp r0, #0
	beq _02388AF8
	ldr r0, _02388BFC ; =_020A1870
	ldrsh r1, [r4, #0x16]
	ldrsh r0, [r0]
	add r0, r1, r0
	strh r0, [r4, #0x16]
	b _02388AF8
_02388AA8:
	cmp r0, #0
	bne _02388AF8
	ldr r0, _02388BFC ; =_020A1870
	ldrsh r1, [r4, #0x16]
	ldrsh r0, [r0]
	ldr r2, _02388C00 ; =0x000003E7
	sub r0, r1, r0
	strh r0, [r4, #0x16]
	ldrsh r1, [r4, #0x12]
	ldrsh r0, [r4, #0x16]
	add r1, r1, r0
	cmp r1, r2
	ldrsh r0, [r4, #0x10]
	movle r2, r1
	cmp r0, r2
	ble _02388AF8
	ldr r0, _02388C00 ; =0x000003E7
	cmp r1, r0
	movgt r1, r0
	strh r1, [r4, #0x10]
_02388AF8:
#ifdef JAPAN
	mov r0, #0x41
	bl TeamMemberHasEnabledIqSkill
	ldr r2, _02389E78 ; =DUNGEON_PTR
	mov r1, #0x39
	ldr r2, [r2]
	add r2, r2, #0x1a000
	strb r0, [r2, #0x19d]
	add r0, sp, #0xc
#else
	bl UpdateMapSurveyorFlag
	add r0, sp, #0xc
	mov r1, #0x39
#endif
	bl IqSkillFlagTest
	mov r5, r0
	add r0, sp, #0
	mov r1, #0x39
	bl IqSkillFlagTest
	cmp r5, #0
	bne _02388B74
	cmp r0, #0
	beq _02388BE8
	mov r5, #0
#ifdef JAPAN
	add r3, r4, #0x120
#else
	add r3, r4, #0x124
#endif
	mov r1, r5
	mov r2, #1
_02388B38:
	ldrb r0, [r3, r5, lsl #3]
	add r4, r3, r5, lsl #3
	tst r0, #1
	movne r0, r2
	moveq r0, r1
	tst r0, #0xff
	ldrneh r0, [r4, #2]
	orrne r0, r0, #0x100
	strneh r0, [r4, #2]
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #4
	blt _02388B38
	b _02388BE8
_02388B74:
	cmp r0, #0
	bne _02388BE8
	mov sb, #0
#ifdef JAPAN
	add r6, r4, #0x120
#else
	add r6, r4, #0x124
#endif
	mov r4, sb
	mov r5, #1
_02388B8C:
	ldrb r0, [r6, sb, lsl #3]
	add r8, r6, sb, lsl #3
	tst r0, #1
	movne r0, r5
	moveq r0, r4
	tst r0, #0xff
	beq _02388BD4
	ldrh r1, [r8, #2]
	mov r0, r8
	bic r1, r1, #0x100
	strh r1, [r8, #2]
	bl GetMaxPp
	ldrb r1, [r8, #6]
	cmp r1, r0
	ble _02388BD4
	mov r0, r8
	bl GetMaxPp
	strb r0, [r8, #6]
_02388BD4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _02388B8C
_02388BE8:
	cmp r7, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02388BFC: .word _020A1870
_02388C00: .word 0x000003E7
#ifdef JAPAN
_02389E78: .word DUNGEON_PTR
#endif
	arm_func_end ov31_023889DC

	arm_func_start RecruitmentSearchMenuLoop
RecruitmentSearchMenuLoop: ; 0x02388C04
	stmdb sp!, {r3, lr}
	sub sp, sp, #0xa0
	ldr r0, _02388D30 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	ldr r1, [r0]
	ldr r0, [r1, #0xd94]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02388D24
_02388C24: ; jump table
	b _02388C34 ; case 0
	b _02388CD0 ; case 1
	b _02388CF8 ; case 2
	b _02388D18 ; case 3
_02388C34:
	ldr r0, _02388D34 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsRecruitingAllowed
	cmp r0, #0
	ldreq r2, _02388D38 ; =0x00000B44
	ldreq r1, _02388D3C ; =ov29_0238280C
	moveq r0, #4
	streqh r2, [r1]
	beq _02388D28
	ldr r0, _02388D34 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x75d]
	cmp r0, #0
	ldrne r2, _02388D40 ; =0x00000B45
	ldrne r1, _02388D3C ; =ov29_0238280C
	movne r0, #4
	strneh r2, [r1]
	bne _02388D28
	ldr r1, _02388D44 ; =0x00000B46
	mov r0, #0x10
	strh r1, [sp, #0x10]
	str r0, [sp, #0x14]
	mov ip, #0
	str ip, [sp]
	ldr r0, _02388D48 ; =DUNGEON_WINDOW_PARAMS_26
	ldr r1, _02388D4C ; =0x00001813
	ldr r3, _02388D50 ; =ov31_02388D54
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _02388D30 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	ldr r2, [r1]
	strb r0, [r2]
	ldr r1, [r1]
	ldr r0, [r1, #0xd94]
	add r0, r0, #1
	str r0, [r1, #0xd94]
	b _02388D24
_02388CD0:
	ldrsb r0, [r1]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _02388D24
	ldr r0, _02388D30 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	ldr r1, [r0]
	ldr r0, [r1, #0xd94]
	add r0, r0, #1
	str r0, [r1, #0xd94]
	b _02388D24
_02388CF8:
	ldrsb r0, [r1]
	bl CloseAdvancedTextBox
	ldr r0, _02388D30 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	ldr r1, [r0]
	ldr r0, [r1, #0xd94]
	add r0, r0, #1
	str r0, [r1, #0xd94]
	b _02388D24
_02388D18:
	bl ov29_0234F77C
	mov r0, #4
	b _02388D28
_02388D24:
	mov r0, #1
_02388D28:
	add sp, sp, #0xa0
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
#define RECRUITMENT_SEARCH_MENU_LOOP_OFFSET -0x4FE
#else
#define RECRUITMENT_SEARCH_MENU_LOOP_OFFSET 0
#endif
_02388D30: .word OVERLAY31_UNKNOWN_POINTER__NA_238A288
_02388D34: .word DUNGEON_PTR
_02388D38: .word 0x00000B44 + RECRUITMENT_SEARCH_MENU_LOOP_OFFSET
_02388D3C: .word ov29_0238280C
_02388D40: .word 0x00000B45 + RECRUITMENT_SEARCH_MENU_LOOP_OFFSET
_02388D44: .word 0x00000B46 + RECRUITMENT_SEARCH_MENU_LOOP_OFFSET
_02388D48: .word DUNGEON_WINDOW_PARAMS_26
_02388D4C: .word 0x00001813
_02388D50: .word ov31_02388D54
	arm_func_end RecruitmentSearchMenuLoop

	arm_func_start ov31_02388D54
ov31_02388D54: ; 0x02388D54
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xd4
	ldr r4, _02388E54 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	mov sl, r0
	ldr r0, [r4]
	mov r8, #4
	ldr r0, [r0, #0xd90]
	mov sb, #0x14
	cmp r0, #0
	beq _02388E30
	mov r7, #0
	add r6, sp, #0x44
	add fp, sp, #4
	add r5, sp, #0x84
	b _02388E1C
_02388D90:
	add r0, r1, r7, lsl #1
	ldrsh r1, [r0, #4]
	mov r0, r6
	bl GetSpeciesString
	ldr r0, [r4]
	add r0, r0, r7, lsl #1
	ldrsh r0, [r0, #4]
	bl GetDexNumber
	ldr r2, [r4]
	str r0, [sp, #0xa8]
	add r2, r2, r7
	ldrb r2, [r2, #0x90a]
	ldr r1, _02388E58 ; =ov31_0238A154
	mov r0, fp
	mov r3, r6
	bl ov31_02388E60
	mov r0, r6
	mov r1, #0x40
	mov r2, fp
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	mov r0, sl
	mov r1, r8
	mov r2, sb
	mov r3, r6
	bl DrawTextInWindow
	add sb, sb, #0xd
	cmp sb, #0x7c
	blt _02388E18
	cmp r8, #4
	bgt _02388E4C
	mov r8, #0x74
	mov sb, #0x14
_02388E18:
	add r7, r7, #1
_02388E1C:
	ldr r1, [r4]
	ldr r0, [r1, #0xd90]
	cmp r7, r0
	blt _02388D90
	b _02388E4C
_02388E30:
	ldr r0, _02388E5C ; =0x00000B47
	bl StringFromId
	mov r3, r0
	mov r0, sl
	mov r1, r8
	mov r2, sb
	bl DrawTextInWindow
_02388E4C:
	add sp, sp, #0xd4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02388E54: .word OVERLAY31_UNKNOWN_POINTER__NA_238A288
_02388E58: .word ov31_0238A154
#ifdef JAPAN
_02388E5C: .word 0x00000649
#else
_02388E5C: .word 0x00000B47
#endif
	arm_func_end ov31_02388D54

	arm_func_start ov31_02388E60
ov31_02388E60: ; 0x02388E60
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
	arm_func_end ov31_02388E60

	arm_func_start ov31_02388E88
ov31_02388E88: ; 0x02388E88
#ifdef JAPAN
#define OV31_02388E88_OFFSET -0x50
#else
#define OV31_02388E88_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x84
	sub sp, sp, #0x400
	ldr r0, _02389164 ; =OVERLAY31_UNKNOWN_STRUCT__NA_238A144
	bl sub_020348E4
	cmp r0, #0
	beq _02389158
	ldr r0, _02389168 ; =0x00000D98
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238916C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	mov r3, #0
	str r0, [r1]
	add r5, r0, #4
	ldr r0, _02389170 ; =0x00000483
	mov r4, r3
	add r1, sp, #0
_02388ECC:
	add r2, r5, r3
	strb r4, [r1, r3]
	add r3, r3, #1
	strb r4, [r2, #0x906]
	cmp r3, r0
	blt _02388ECC
	mov sb, #1
	mov r8, #2
	add r7, sp, #0
	ldr r6, _02389174 ; =DUNGEON_PTR
	b _02388F3C
_02388EF8:
	ldr r1, [r6]
	mov sl, sb
	add r1, r1, r4, lsl #3
	add r1, r1, #0x3900
	ldrsh r2, [r1, #0x76 + OV31_02388E88_OFFSET]
	ldrsh r1, [r1, #0x78 + OV31_02388E88_OFFSET]
	cmp r2, #0
	cmpeq r1, #0
	beq _02388F38
	add r0, r0, #0x174 + OV31_02388E88_OFFSET
	add r0, r0, #0x3800
	add r0, r0, r4, lsl #3
	cmp r2, #0
	moveq sl, r8
	bl GetMonsterIdFromSpawnEntry
	strb sl, [r7, r0]
_02388F38:
	add r4, r4, #1
_02388F3C:
	ldr r0, [r6]
	add r1, r0, #0x3000
#ifdef JAPAN
	ldr r1, [r1, #0xd7c]
#else
	ldr r1, [r1, #0xe20]
#endif
	cmp r4, r1
	blt _02388EF8
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _02388F6C
	bl GetKecleonIdToSpawnByFloor
	add r1, sp, #0
	mov r2, #1
	strb r2, [r1, r0]
_02388F6C:
	ldr r0, _02389174 ; =DUNGEON_PTR
	mov sl, #0
	ldr r0, [r0]
#ifdef JAPAN
	mov r8, #1
#else
	mov sb, #1
#endif
	add r0, r0, #0x700
	ldrsh r2, [r0, #0xa8]
	cmp r2, #0
	addne r0, sp, #0
	movne r1, #1
	strneb r1, [r0, r2]
_02388F94:
#ifdef JAPAN
	mov r0, r8, lsl #0x10
	add r1, sp, #0
	ldrb r1, [r1, r0, asr #16]
	mov r7, r0, asr #0x10
#else
	mov r0, sb, lsl #0x10
	add r1, sp, #0
	ldrb r1, [r1, r0, asr #16]
	mov r8, r0, asr #0x10
#endif
	mov r6, #0x44
	cmp r1, #0
	mov r4, #0
	beq _023890B4
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl SpecificRecruitCheck
	cmp r0, #0
	beq _023890B4
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl CanMonsterSpawn
	cmp r0, #0
	beq _023890B4
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl GetRecruitRate2
	ldr r1, _02389178 ; =0xFFFFFC19
	cmp r0, r1
	beq _023890B4
#ifdef JAPAN
	mov sb, r4
	ldr fp, _0238A43C ; =0x0000022B
	b _0238A2A8
_0238A26C:
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetTeamMember
	ldrb r1, [r0]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	beq _0238A2A4
	ldrsh r1, [r0, #4]
	mov r0, r7
	bl BaseFormsEqual
	cmp r0, #0
	bne _0238A2B0
_0238A2A4:
	add sb, sb, #1
_0238A2A8:
	cmp sb, fp
	blt _0238A26C
_0238A2B0:
	ldr r0, _0238A43C ; =0x0000022B
	cmp sb, r0
	movne r4, #1
	cmp r4, #0
	bne _0238906C
	mov sb, #0
	b _0238905C
_0238900C:
	mov r0, sb, lsl #0x10
#else
	mov r0, r8
	mov r1, #1
	bl IsMonsterOnTeam
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	bne _0238906C
	mov r7, #0
	b _0238905C
_0238900C:
	mov r0, r7, lsl #0x10
#endif
	mov r0, r0, asr #0x10
	bl GetActiveTeamMember
	mov fp, r0
	ldrb r0, [fp]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	beq _02389058
	ldrsh r0, [fp, #8]
	bl CheckTeamMemberIdxVeneer
	cmp r0, #0
	bne _02389058
	ldrsh r1, [fp, #0xc]
#ifdef JAPAN
	mov r0, r7
	bl BaseFormsEqual
	cmp r0, #0
	bne _02389064
_02389058:
	add sb, sb, #1
_0238905C:
	cmp sb, #4
	blt _0238900C
_02389064:
	cmp sb, #4
	movne r4, #1
_0238906C:
	add sb, r5, sl
	ldrb r0, [sb, #0x906]
#else
	mov r0, r8
	bl BaseFormsEqual
	cmp r0, #0
	bne _02389064
_02389058:
	add r7, r7, #1
_0238905C:
	cmp r7, #4
	blt _0238900C
_02389064:
	cmp r7, #4
	movne r4, #1
_0238906C:
	add r7, r5, sl
	ldrb r0, [r7, #0x906]
#endif
	cmp r4, #0
	movne r6, #0x46
	cmp r6, r0
	bne _023890A4
#ifdef JAPAN
	mov r0, r7
#else
	mov r0, r8
#endif
	bl GetDexNumber
	mov r1, sl, lsl #1
	mov r4, r0
	ldrsh r0, [r5, r1]
	bl GetDexNumber
	cmp r4, r0
	beq _023890B4
_023890A4:
	mov r0, sl, lsl #1
#ifdef JAPAN
	strh r7, [r5, r0]
	strb r6, [sb, #0x906]
#else
	strh r8, [r5, r0]
	strb r6, [r7, #0x906]
#endif
	add sl, sl, #1
_023890B4:
	ldr r0, _02389170 ; =0x00000483
#ifdef JAPAN
	add r8, r8, #1
	cmp r8, r0
#else
	add sb, sb, #1
	cmp sb, r0
#endif
	blt _02388F94
	add r0, r5, #6
	str sl, [r5, #0xd8c]
	add r6, r0, #0x900
	mov r8, #0
	b _02389140
_023890D8:
	add r7, r8, #1
	mov fp, r8, lsl #1
	b _02389134
_023890E4:
	mov r1, r7, lsl #1
	ldrsh r0, [r5, r1]
	ldrsh sb, [r5, r1]
	bl GetDexNumber
	mov r4, r0
	ldrsh r0, [r5, fp]
	bl GetDexNumber
	ldrsh r2, [r5, fp]
	add r1, sb, r4, lsl #11
	add r0, r2, r0, lsl #11
	cmp r1, r0
	bge _02389130
	ldrb r1, [r6, r7]
	mov r0, r7, lsl #1
	strh r2, [r5, r0]
	ldrb r0, [r6, r8]
	strb r0, [r6, r7]
	strh sb, [r5, fp]
	strb r1, [r6, r8]
_02389130:
	add r7, r7, #1
_02389134:
	cmp r7, sl
	blt _023890E4
	add r8, r8, #1
_02389140:
	cmp r8, sl
	blt _023890D8
	ldr r0, _0238916C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xd94]
_02389158:
	add sp, sp, #0x84
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02389164: .word OVERLAY31_UNKNOWN_STRUCT__NA_238A144
_02389168: .word 0x00000D98
_0238916C: .word OVERLAY31_UNKNOWN_POINTER__NA_238A288
_02389170: .word 0x00000483
_02389174: .word DUNGEON_PTR
_02389178: .word 0xFFFFFC19
#ifdef JAPAN
_0238A43C: .word 0x0000022B
#endif
	arm_func_end ov31_02388E88

	arm_func_start ov31_0238917C
ov31_0238917C: ; 0x0238917C
	stmdb sp!, {r3, lr}
	ldr r0, _023891A4 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _023891A4 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A288
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023891A4: .word OVERLAY31_UNKNOWN_POINTER__NA_238A288
	arm_func_end ov31_0238917C

	arm_func_start ov31_023891A8
ov31_023891A8: ; 0x023891A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_02030A18
	mov r4, r0
	ldr r0, _023891F8 ; =DUNGEON_SUBMENU_ITEMS_6
	mov r1, r4, lsl #3
	ldrh r1, [r0, r1]
	mov r0, r5
	bl sub_02030A2C
#if defined(EUROPE)
	add r0, r4, #0xb2
	add r0, r0, #0x3f00
#elif defined(JAPAN)
	add r0, r4, #0xb3
	add r0, r0, #0x4900
#else
	add r0, r4, #0xfb0
	add r0, r0, #0x3000
#endif
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl StringFromId
	mov r3, r0
	mov r0, r5
	mov r1, #4
	mov r2, #0x10
	bl DrawTextInWindow
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023891F8: .word DUNGEON_SUBMENU_ITEMS_6
	arm_func_end ov31_023891A8

	arm_func_start HelpMenuLoop
HelpMenuLoop: ; 0x023891FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0xa0
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _023893F0
_0238921C: ; jump table
	b _02389238 ; case 0
	b _023892B8 ; case 1
	b _02389278 ; case 2
	b _02389344 ; case 3
	b _023893A8 ; case 4
	b _023893DC ; case 5
	b _023893DC ; case 6
_02389238:
	ldr ip, _02389400 ; =0x00003FA7
	mov r4, #0x10
	ldr r0, _02389404 ; =DUNGEON_WINDOW_PARAMS_27
	ldr r1, _02389408 ; =0x00401813
	ldr r3, _0238940C ; =DUNGEON_SUBMENU_ITEMS_6
	add r2, sp, #8
	strh ip, [sp, #0x10]
	str r4, [sp, #0x14]
	bl CreateParentMenuFromStringIds
	ldr r1, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r2, #1
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023893F0
_02389278:
	ldrsb r0, [r2]
	bl sub_02028354
	cmp r0, #3
	bne _02389298
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202810C
_02389298:
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ResumeParentMenu
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
_023892B8:
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl IsParentMenuActive
	cmp r0, #0
	bne _023893F0
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202ABB0
	movs r4, r0
	bmi _02389320
	bl sub_02001808
	cmp r0, #0xa000
	ldrlt r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	movlt r1, #2
	ldrlt r0, [r0]
	strlt r1, [r0, #8]
	blt _023893F0
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r1, #3
	ldr r2, [r0]
	str r4, [r2, #4]
	ldr r0, [r0]
	str r1, [r0, #8]
	b _02389330
_02389320:
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #8]
_02389330:
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl sub_0202812C
	b _023893F0
_02389344:
	mov r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, [r2, #4]
	ldr r0, _0238940C ; =DUNGEON_SUBMENU_ITEMS_6
	mov r1, r1, lsl #3
	ldrh r1, [r0, r1]
	mov ip, #8
	ldr r0, _02389410 ; =DUNGEON_WINDOW_PARAMS_28
	strh r1, [sp, #0x10]
	ldr r2, [r2, #4]
	ldr r1, _02389414 ; =0x00009833
	str r2, [sp, #8]
	str ip, [sp]
	mov ip, #1
	ldr r3, _02389418 ; =ov31_023891A8
	add r2, sp, #8
	str ip, [sp, #4]
	bl CreateAdvancedTextBox
	ldr r1, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r2, #4
	ldr r3, [r1]
	strb r0, [r3, #1]
	ldr r0, [r1]
	str r2, [r0, #8]
	b _023893F0
_023893A8:
	ldrsb r0, [r2, #1]
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	bne _023893F0
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseAdvancedTextBox
	ldr r0, _023893FC ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #8]
	b _023893F0
_023893DC:
	ldrsb r0, [r2]
	bl CloseParentMenu
	bl ov29_0234F77C
	mov r0, #4
	b _023893F4
_023893F0:
	mov r0, #1
_023893F4:
	add sp, sp, #0xa0
	ldmia sp!, {r4, pc}
	.align 2, 0
_023893FC: .word OVERLAY31_UNKNOWN_POINTER__NA_238A28C
#if defined(EUROPE)
_02389400: .word 0x00003FA9
#elif defined(JAPAN)
_02389400: .word 0x000049AA
#else
_02389400: .word 0x00003FA7
#endif
_02389404: .word DUNGEON_WINDOW_PARAMS_27
_02389408: .word 0x00401813
_0238940C: .word DUNGEON_SUBMENU_ITEMS_6
_02389410: .word DUNGEON_WINDOW_PARAMS_28
_02389414: .word 0x00009833
_02389418: .word ov31_023891A8
	arm_func_end HelpMenuLoop

	arm_func_start ov31_0238941C
ov31_0238941C: ; 0x0238941C
	stmdb sp!, {r3, lr}
	ldr r0, _02389458 ; =OVERLAY31_UNKNOWN_STRUCT__NA_238A190
	bl sub_020348E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0xc
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238945C ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, [r1]
	str r2, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02389458: .word OVERLAY31_UNKNOWN_STRUCT__NA_238A190
_0238945C: .word OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	arm_func_end ov31_0238941C

	arm_func_start ov31_02389460
ov31_02389460: ; 0x02389460
	stmdb sp!, {r3, lr}
	ldr r0, _02389488 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _02389488 ; =OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02389488: .word OVERLAY31_UNKNOWN_POINTER__NA_238A28C
	arm_func_end ov31_02389460

	arm_func_start ov31_0238948C
ov31_0238948C: ; 0x0238948C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x134
#ifdef JAPAN
	mov r5, r0
	mov r0, #0x410
	mov r1, #8
	bl MemAlloc
	mov r1, #0x410
	mov r4, r0
	bl MemZero
	mvn r1, #1
	strb r1, [r4]
	add r0, r4, #0x30c
	strb r1, [r4, #1]
	bl ov31_02389D80
	mov r0, #0
	str r0, [r4, #0x40c]
	strb r0, [r4, #0x408]
	bl ov29_022EA62C
	mov r0, r4
	mov r1, r5
	bl ov31_02389A78
	ldr r1, [r4, #0x40c]
	mov r0, #8
	str r1, [r4, #0x3cc]
	str r0, [r4, #0x3d0]
	mov r1, #0
	str r1, [r4, #0x3d4]
	str r1, [r4, #0x3d8]
	str r1, [r4, #0x3bc]
	mov r0, #0x10
	str r0, [r4, #0x3c0]
	mov r0, r4
	str r1, [r4, #0x3c8]
	bl ov29_0234E988
	add r0, sp, #0xac
	bl InitPreprocessorArgs
	ldrb r0, [r4, #0x408]
	cmp r0, #0
	ldrne r1, _023898F0 ; =0x0000158C
	mov r0, #0x10
	ldreq r1, _023898F4 ; =0x0000158B
	str r0, [sp, #0xa8]
	strh r1, [sp, #0xa4]
	ldrb r0, [r4, #0x408]
	cmp r0, #0
	bne _0238A820
	ldr r1, [r4, #0x404]
	add r0, r4, #0x78
	ldr r1, [r1, #0xb4]
	bl GetMonsterName
	add r0, r4, #0x78
	str r0, [sp, #0xe4]
_0238A820:
	ldr r0, _023898F8 ; =DUNGEON_WINDOW_PARAMS_31
	ldr r1, _023898FC ; =0x80401813
	add r2, sp, #0x9c
	add r3, r4, #0xc4
	bl CreateParentMenu
	strb r0, [r4]
_0238A838:
	mov r0, #0x3d
	bl AdvanceFrame
	ldr r0, [r4, #0x404]
	bl ov29_0234FB50
	mov r7, r0
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrsb r0, [r4]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0238AA84
	ldrsb r0, [r4]
	bl sub_0202ABB0
	movs r6, r0
	bmi _0238AA78
	ldrsb r0, [r4]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [r4, #0x3c8]
	add r1, r4, r0
	add r0, r4, #0x30c
	ldrb r5, [r1, #0xb8]
	bl ov31_02389D80
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
	bl ov29_022EBA70
	mov r0, #0x2f
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0xc
	mov r1, #0
	bl AddDungeonSubMenuOption
	cmp r7, #0
	beq _0238A8CC
	mov r0, #0x2f
	bl DisableDungeonSubMenuOption
_0238A8CC:
	add r1, r4, #0x6c
	add r0, r4, #4
	mov r2, #0
	str r1, [sp, #0x64]
	bl ov31_0238513C
	bl ov29_022EBA84
	mov r3, #0
	b _0238A8FC
_0238A8EC:
	add r2, r3, #1
	add r1, r4, r3, lsl #3
	mov r3, r2
	str r2, [r1, #8]
_0238A8FC:
	cmp r3, r0
	blt _0238A8EC
	ldr r0, _02389904 ; =0x00000877
	add r2, r4, r3, lsl #3
	strh r0, [r2, #4]
	mvn r1, #1
	mov r0, #0
	str r1, [r2, #8]
	strh r0, [r2, #0xc]
	sub r1, r0, #1
	add r0, r4, #1
	str r1, [r2, #0x10]
	bl ov29_0234E988
	ldr r0, _02389908 ; =0x0238B4C0
	ldr r1, _0238990C ; =0x80000213
	add r2, sp, #4
	add r3, r4, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r4, #1]
	mvn r8, #0
	mov r7, #0x3d
_0238A950:
	mov r0, r7
	bl AdvanceFrame
	ldrsb r0, [r4, #1]
	bl IsParentMenuActive
	cmp r0, #0
	bne _0238A950
	ldrsb r0, [r4, #1]
	bl sub_0202ABB0
	subs r1, r0, #1
	bmi _0238A998
	ldrsb r0, [r4, #1]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [r4, #0x3c8]
	bl ov29_022EB804
	cmp r0, #0
	movne r8, #0
	b _0238A9AC
_0238A998:
	mvn r0, #2
	cmp r1, r0
	bne _0238A9AC
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
_0238A9AC:
	cmp r8, #0
	bge _0238A9C8
	add r0, r4, #1
	bl ov29_0234E988
	ldrsb r0, [r4]
	bl ResumeParentMenu
	b _0238AB68
_0238A9C8:
	ldr r0, [r4, #0x3c8]
	cmp r0, #0
	bne _0238AA3C
	ldr r0, _02389910 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldrb r0, [r4, #0x408]
	cmp r0, #0
	beq _0238A9F8
	mov r0, r5
	bl ov31_02389C68
	b _0238AA04
_0238A9F8:
	ldr r0, [r4, #0x404]
	mov r1, r5
	bl ov31_02389C2C
_0238AA04:
	ldr r1, [r4, #0x404]
	mov r0, r4
	bl ov31_02389A78
	add r0, r4, #1
	bl ov29_0234E988
	ldrsb r0, [r4]
	bl ResumeParentMenu
	ldrsb r0, [r4]
	add r1, r4, #0xc4
	bl sub_0202A98C
	ldrsb r0, [r4]
	sub r1, r6, #1
	bl sub_0202AB94
	b _0238AB68
_0238AA3C:
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
	bl sub_02001808
	cmp r0, #0xa000
	bge _0238AA64
	add r0, r4, #1
	bl ov29_0234E988
	ldrsb r0, [r4]
	bl ResumeParentMenu
	b _0238AB68
_0238AA64:
	ldrsb r1, [r4]
	mov r0, r5
	mov r2, #1
	bl ov31_02389CC0
	b _0238AB68
_0238AA78:
	bl ov29_022EAC78
	mov r0, #1
	b _0238AB6C
_0238AA84:
	ldrh r0, [sp]
	tst r0, #8
	beq _0238AADC
	ldr r0, _02389914 ; =0x00003F04
	bl ov29_022EACCC
	bl sub_02001808
	cmp r0, #0xa000
	blt _0238AB68
	ldrsb r0, [r4]
	bl sub_0202B030
	mov r0, #0x3d
	bl AdvanceFrame
	ldrsb r0, [r4]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [r4, #0x3c8]
	add r0, r4, r0
	ldrb r0, [r0, #0xb8]
	ldrsb r1, [r4]
	mov r2, #1
	bl ov31_02389CC0
	b _0238AB68
_0238AADC:
	tst r0, #4
	beq _0238AB68
	cmp r7, #0
	beq _0238AAFC
	ldr r0, _02389918 ; =0x00003F03
	mov r1, #0x100
	bl sub_02017C74
	b _0238AB68
_0238AAFC:
	ldrsb r0, [r4]
	bl sub_0202B030
	ldrsb r0, [r4]
	bl sub_0202ABB0
	mov r5, r0
	ldr r0, _02389910 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldrb r0, [r4, #0x408]
	cmp r0, #0
	add r0, r4, r5
	beq _0238AB38
	ldrb r0, [r0, #0xb7]
	bl ov31_02389C68
	b _0238AB44
_0238AB38:
	ldrb r1, [r0, #0xb7]
	ldr r0, [r4, #0x404]
	bl ov31_02389C2C
_0238AB44:
	ldr r1, [r4, #0x404]
	mov r0, r4
	bl ov31_02389A78
	ldrsb r0, [r4]
	add r1, r4, #0xc4
	bl sub_0202A98C
	ldrsb r0, [r4]
	sub r1, r5, #1
	bl sub_0202AB94
_0238AB68:
	mov r0, #0
_0238AB6C:
	cmp r0, #0
	beq _0238A838
	add r0, r4, #1
	bl ov29_0234E988
	mov r0, r4
	bl ov29_0234E988
	mov r0, #0x3d
	bl AdvanceFrame
	add r0, r4, #1
	bl ov29_0234E988
	mov r0, r4
	bl ov29_0234E988
	mov r0, r4
#else
	mov r4, r0
	mov r0, #0x530
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r1, #0x530
	bl MemZero
	add r0, r5, #0x2c
	mvn r1, #1
	strb r1, [r5]
	add r0, r0, #0x400
	strb r1, [r5, #1]
	bl ov31_02389D80
	mov r0, #0
	str r0, [r5, #0x52c]
	strb r0, [r5, #0x528]
	bl ov29_022EA62C
	mov r0, r5
	mov r1, r4
	bl ov31_02389A78
	ldr r1, [r5, #0x52c]
	mov r0, #8
	str r1, [r5, #0x4ec]
	str r0, [r5, #0x4f0]
	mov r1, #0
	str r1, [r5, #0x4f4]
	str r1, [r5, #0x4f8]
	str r1, [r5, #0x4dc]
	mov r0, #0x10
	str r0, [r5, #0x4e0]
	mov r0, r5
	str r1, [r5, #0x4e8]
	bl ov29_0234E988
	add r0, sp, #0xac
	bl InitPreprocessorArgs
	ldrb r0, [r5, #0x528]
	cmp r0, #0
	ldrne r1, _023898F0 ; =0x00000F5F
	mov r0, #0x10
	ldreq r1, _023898F4 ; =0x00000F5E
	str r0, [sp, #0xa8]
	strh r1, [sp, #0xa4]
	ldrb r0, [r5, #0x528]
	cmp r0, #0
	bne _02389560
	ldr r1, [r5, #0x524]
	add r0, r5, #0x78
	ldr r1, [r1, #0xb4]
	bl GetMonsterName
	add r0, r5, #0x78
	str r0, [sp, #0xe4]
_02389560:
	ldr r0, _023898F8 ; =DUNGEON_WINDOW_PARAMS_31
	ldr r1, _023898FC ; =0x80401813
	add r2, sp, #0x9c
	add r3, r5, #0xc4
	bl CreateParentMenu
	strb r0, [r5]
_02389578:
	mov r0, #0x3d
	bl AdvanceFrame
	ldr r0, [r5, #0x524]
	bl ov29_0234FB50
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrsb r0, [r5]
	bl IsParentMenuActive
	cmp r0, #0
	bne _023897C8
	ldrsb r0, [r5]
	bl sub_0202ABB0
	movs r7, r0
	bmi _023897BC
	ldrsb r0, [r5]
	bl sub_0202ABB0
	sub r1, r0, #1
	add r0, r5, #0x2c
	str r1, [r5, #0x4e8]
	add r1, r5, r1
	add r0, r0, #0x400
	ldrb r6, [r1, #0xb8]
	bl ov31_02389D80
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
	bl ov29_022EBA70
	mov r0, #0x2f
	mov r1, #0
	bl AddDungeonSubMenuOption
	mov r0, #0xc
	mov r1, #0
	bl AddDungeonSubMenuOption
	cmp r4, #0
	beq _02389610
	mov r0, #0x2f
	bl DisableDungeonSubMenuOption
_02389610:
	add r1, r5, #0x6c
	add r0, r5, #4
	mov r2, #0
	str r1, [sp, #0x64]
	bl ov31_0238513C
	bl ov29_022EBA84
	mov r3, #0
	b _02389640
_02389630:
	add r2, r3, #1
	add r1, r5, r3, lsl #3
	mov r3, r2
	str r2, [r1, #8]
_02389640:
	cmp r3, r0
	blt _02389630
	ldr r0, _02389904 ; =0x00000A3C
	add r2, r5, r3, lsl #3
	strh r0, [r2, #4]
	mvn r1, #1
	mov r0, #0
	str r1, [r2, #8]
	strh r0, [r2, #0xc]
	sub r1, r0, #1
	add r0, r5, #1
	str r1, [r2, #0x10]
	bl ov29_0234E988
	ldr r0, _02389908 ; =DUNGEON_WINDOW_PARAMS_30
	ldr r1, _0238990C ; =0x80000213
	add r2, sp, #4
	add r3, r5, #4
	bl CreateParentMenuFromStringIds
	strb r0, [r5, #1]
	mvn r8, #0
	mov r4, #0x3d
_02389694:
	mov r0, r4
	bl AdvanceFrame
	ldrsb r0, [r5, #1]
	bl IsParentMenuActive
	cmp r0, #0
	bne _02389694
	ldrsb r0, [r5, #1]
	bl sub_0202ABB0
	subs r1, r0, #1
	bmi _023896DC
	ldrsb r0, [r5, #1]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [r5, #0x4e8]
	bl ov29_022EB804
	cmp r0, #0
	movne r8, #0
	b _023896F0
_023896DC:
	mvn r0, #2
	cmp r1, r0
	bne _023896F0
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
_023896F0:
	cmp r8, #0
	bge _0238970C
	add r0, r5, #1
	bl ov29_0234E988
	ldrsb r0, [r5]
	bl ResumeParentMenu
	b _023898AC
_0238970C:
	ldr r0, [r5, #0x4e8]
	cmp r0, #0
	bne _02389780
	ldr r0, _02389910 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldrb r0, [r5, #0x528]
	cmp r0, #0
	beq _0238973C
	mov r0, r6
	bl ov31_02389C68
	b _02389748
_0238973C:
	ldr r0, [r5, #0x524]
	mov r1, r6
	bl ov31_02389C2C
_02389748:
	ldr r1, [r5, #0x524]
	mov r0, r5
	bl ov31_02389A78
	add r0, r5, #1
	bl ov29_0234E988
	ldrsb r0, [r5]
	bl ResumeParentMenu
	ldrsb r0, [r5]
	add r1, r5, #0xc4
	bl sub_0202A98C
	ldrsb r0, [r5]
	sub r1, r7, #1
	bl sub_0202AB94
	b _023898AC
_02389780:
	ldr r0, _02389900 ; =0x00003F02
	bl sub_02017C80
	bl sub_02001808
	cmp r0, #0xa000
	bge _023897A8
	add r0, r5, #1
	bl ov29_0234E988
	ldrsb r0, [r5]
	bl ResumeParentMenu
	b _023898AC
_023897A8:
	ldrsb r1, [r5]
	mov r0, r6
	mov r2, #1
	bl ov31_02389CC0
	b _023898AC
_023897BC:
	bl ov29_022EAC78
	mov r0, #1
	b _023898B0
_023897C8:
	ldrh r0, [sp]
	tst r0, #8
	beq _02389820
	ldr r0, _02389914 ; =0x00003F04
	bl ov29_022EACCC
	bl sub_02001808
	cmp r0, #0xa000
	blt _023898AC
	ldrsb r0, [r5]
	bl sub_0202B030
	mov r0, #0x3d
	bl AdvanceFrame
	ldrsb r0, [r5]
	bl sub_0202ABB0
	sub r0, r0, #1
	str r0, [r5, #0x4e8]
	add r0, r5, r0
	ldrb r0, [r0, #0xb8]
	ldrsb r1, [r5]
	mov r2, #1
	bl ov31_02389CC0
	b _023898AC
_02389820:
	tst r0, #4
	beq _023898AC
	cmp r4, #0
	beq _02389840
	ldr r0, _02389918 ; =0x00003F03
	mov r1, #0x100
	bl sub_02017C74
	b _023898AC
_02389840:
	ldrsb r0, [r5]
	bl sub_0202B030
	ldrsb r0, [r5]
	bl sub_0202ABB0
	mov r4, r0
	ldr r0, _02389910 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	ldrb r0, [r5, #0x528]
	cmp r0, #0
	add r0, r5, r4
	beq _0238987C
	ldrb r0, [r0, #0xb7]
	bl ov31_02389C68
	b _02389888
_0238987C:
	ldrb r1, [r0, #0xb7]
	ldr r0, [r5, #0x524]
	bl ov31_02389C2C
_02389888:
	ldr r1, [r5, #0x524]
	mov r0, r5
	bl ov31_02389A78
	ldrsb r0, [r5]
	add r1, r5, #0xc4
	bl sub_0202A98C
	ldrsb r0, [r5]
	sub r1, r4, #1
	bl sub_0202AB94
_023898AC:
	mov r0, #0
_023898B0:
	cmp r0, #0
	beq _02389578
	add r0, r5, #1
	bl ov29_0234E988
	mov r0, r5
	bl ov29_0234E988
	mov r0, #0x3d
	bl AdvanceFrame
	add r0, r5, #1
	bl ov29_0234E988
	mov r0, r5
	bl ov29_0234E988
	mov r0, r5
#endif
	bl MemFree
	add sp, sp, #0x134
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
#ifdef JAPAN
_023898F0: .word 0x0000158C
_023898F4: .word 0x0000158B
#else
_023898F0: .word 0x00000F5F
_023898F4: .word 0x00000F5E
#endif
_023898F8: .word DUNGEON_WINDOW_PARAMS_31
_023898FC: .word 0x80401813
_02389900: .word 0x00003F02
#ifdef JAPAN
_02389904: .word 0x00000877
#else
_02389904: .word 0x00000A3C
#endif
_02389908: .word DUNGEON_WINDOW_PARAMS_30
_0238990C: .word 0x80000213
_02389910: .word 0x00003F07
_02389914: .word 0x00003F04
_02389918: .word 0x00003F03
	arm_func_end ov31_0238948C

	arm_func_start ov31_0238991C
ov31_0238991C: ; 0x0238991C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	mov r1, #8
	bl MemAlloc
	mov r1, r5
	mov r2, r4
	mov r4, r0
	bl ov31_0238994C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov31_0238991C

	arm_func_start ov31_0238994C
ov31_0238994C: ; 0x0238994C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r3, r2, asr #2
	mov r4, r0
	mov r0, r1, asr #2
	add r2, r2, r3, lsr #29
	add ip, r1, r0, lsr #29
	ldr r6, _023899B0 ; =DUNGEON_WINDOW_PARAMS_32
	mov lr, r2, asr #3
	add r5, sp, #0
	ldmia r6, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	mov ip, ip, asr #3
	add r3, lr, #1
	ldr r1, _023899B4 ; =ov31_02389A04
	mov r0, r5
	mov r2, r4
	strb ip, [sp, #4]
	strb r3, [sp, #5]
	bl CreateTextBoxWithArg
	strb r0, [r4]
	mov r0, #0xb
	strb r0, [r4, #1]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023899B0: .word DUNGEON_WINDOW_PARAMS_32
_023899B4: .word ov31_02389A04
	arm_func_end ov31_0238994C

	arm_func_start ov31_023899B8
ov31_023899B8: ; 0x023899B8
	stmdb sp!, {r3, lr}
	strb r1, [r0, #1]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrsb r0, [r0]
	bl sub_0202F9B8
	ldmia sp!, {r3, pc}
	arm_func_end ov31_023899B8

	arm_func_start ov31_023899D4
ov31_023899D4: ; 0x023899D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r4]
	bl CloseTextBox2
	mov r0, r4
	bl MemFree
	mov r0, #0
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov31_023899D4

	arm_func_start ov31_02389A04
ov31_02389A04: ; 0x02389A04
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x94
	mov r5, r0
	mov r4, r1
	bl sub_02027B1C
	add r0, sp, #0x44
	bl InitPreprocessorArgs
	ldrb r0, [r4, #1]
	ldr r3, _02389A70 ; =0x0000C402
	add ip, sp, #0x44
	cmp r0, #0xb
	strne r0, [sp, #0x54]
#ifdef JAPAN
	ldreq r2, _0238AD30 ; =0x0000158D
	add r0, sp, #4
	ldrne r2, _02389A74 ; =0x0000158E
#else
	moveq r2, #0xf60
	ldrne r2, _02389A74 ; =0x00000F61
	add r0, sp, #4
#endif
	mov r1, #0x40
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #4
	mov r0, r5
	mov r1, #4
	mov r2, #2
	bl DrawTextInWindow
	mov r0, r5
	bl UpdateWindow
	add sp, sp, #0x94
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02389A70: .word 0x0000C402
#ifdef JAPAN
_0238AD30: .word 0x0000158D
_02389A74: .word 0x0000158E
#else
_02389A74: .word 0x00000F61
#endif
	arm_func_end ov31_02389A04

	arm_func_start ov31_02389A78
ov31_02389A78: ; 0x02389A78
#ifdef JAPAN
#define OV31_02389A78_OFFSET -0x120
#else
#define OV31_02389A78_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x70
	mov sb, r1
	ldr r4, [sb, #0xb4]
	mov sl, r0
	ldrb r0, [r4, #7]
	strb r0, [sl, #0x528 + OV31_02389A78_OFFSET]
	bl GetLeaderMonster
	ldrb r1, [r0, #0xa]
	add r0, sp, #0x14
	bl GetUnlockedTactics
	ldrb r0, [sl, #0x528 + OV31_02389A78_OFFSET]
	cmp r0, #0
	beq _02389B64
	mov r6, #0
	bl GetLeaderMonster
	ldrb r1, [r0, #0xa]
	add r0, sp, #8
	bl GetUnlockedTactics
	ldr r4, _02389C20 ; =DUNGEON_PTR
	mov r7, r6
	add r5, sp, #4
_02389AD0:
	ldr r0, [r4]
	add r0, r0, r7, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r8, [r0, #0xa84]
#else
	ldr r8, [r0, #0xb28]
#endif
	mov r0, r8
	bl ov29_0234FB60
	cmp r0, #0
	beq _02389B08
	ldr r1, [r8, #0xb4]
	add r0, r6, #1
	ldrb r1, [r1, #0xa8]
	mov r0, r0, lsl #0x10
	strb r1, [r5, r6]
	mov r6, r0, asr #0x10
_02389B08:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _02389AD0
	cmp r6, #0
	moveq r6, #0xb
	beq _02389B68
	mov r3, #1
	ldrb r2, [sp, #4]
	add r1, sp, #4
	b _02389B54
_02389B38:
	ldrb r0, [r1, r3]
	cmp r2, r0
	movne r6, #0xb
	bne _02389B68
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
_02389B54:
	cmp r3, r6
	blt _02389B38
	ldrb r6, [sp, #4]
	b _02389B68
_02389B64:
	ldrb r6, [r4, #0xa8]
_02389B68:
	mov r8, #0
	add r4, sl, #0x12c
	add fp, sp, #0x14
	add r5, sp, #0x20
	b _02389BF4
_02389B7C:
	ldrb r1, [fp, r8]
	add r0, sl, r8
	strb r1, [r0, #0xb8]
	cmp r1, #0xb
	beq _02389BFC
	str r1, [sp, #0x30]
	cmp r6, #0xb
	beq _02389BC4
	cmp r6, r1
	bne _02389BC4
#ifdef JAPAN
	mov r0, #0x28
	mul r7, r8, r0
	ldr r2, _02389C24 ; =ov31_0238A228
	add r0, r4, r7
	mov r1, #0x28
	mov r3, #0
	str r5, [sp]
	bl PreprocessString
	b _02389BE0
_02389BC4:
	mov r0, #0x28
	mul r7, r8, r0
	ldr r2, _02389C28 ; =ov31_0238A23C
	add r0, r4, r7
	mov r1, #0x28
	mov r3, #0
	str r5, [sp]
#else
	ldr r2, _02389C24 ; =ov31_0238A228
	mov r1, #0x40
	add r0, r4, r8, lsl #6
	mov r3, #0
	str r5, [sp]
	mov r7, r8, lsl #6
	bl PreprocessString
	b _02389BE0
_02389BC4:
	ldr r2, _02389C28 ; =ov31_0238A23C
	mov r1, #0x40
	add r0, r4, r8, lsl #6
	mov r3, #0
	str r5, [sp]
	mov r7, r8, lsl #6
#endif
	bl PreprocessString
_02389BE0:
	add r1, r4, r7
	add r0, sl, r8, lsl #3
	str r1, [r0, #0xc4]
	add r8, r8, #1
	str r8, [r0, #0xc8]
_02389BF4:
	cmp r8, #0xc
	blt _02389B7C
_02389BFC:
	mov r0, #0
	str r8, [sl, #0x52c + OV31_02389A78_OFFSET]
	add r1, sl, r8, lsl #3
	str r0, [r1, #0xc4]
	sub r0, r0, #1
	str r0, [r1, #0xc8]
	str sb, [sl, #0x524 + OV31_02389A78_OFFSET]
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02389C20: .word DUNGEON_PTR
_02389C24: .word ov31_0238A228
_02389C28: .word ov31_0238A23C
	arm_func_end ov31_02389A78

	arm_func_start ov31_02389C2C
ov31_02389C2C: ; 0x02389C2C
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #0xb4]
	mov r2, #6
	strb r1, [r3, #0xa8]
	strb r2, [r3, #0x7c]
	mov r1, #0
	str r1, [r3, #0x84]
	str r1, [r3, #0x88]
	strh r1, [r3, #0x80]
	ldrb r1, [r3, #7]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	bl AiMovement
	ldmia sp!, {r3, pc}
	arm_func_end ov31_02389C2C

	arm_func_start ov31_02389C68
ov31_02389C68: ; 0x02389C68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _02389CBC ; =DUNGEON_PTR
	mov r4, r0
	mov r6, #0
_02389C78:
	ldr r0, [r5]
	add r0, r0, r6, lsl #2
	add r0, r0, #0x12000
#ifdef JAPAN
	ldr r7, [r0, #0xa84]
#else
	ldr r7, [r0, #0xb28]
#endif
	mov r0, r7
	bl ov29_0234FB60
	cmp r0, #0
	beq _02389CA4
	mov r0, r7
	mov r1, r4
	bl ov31_02389C2C
_02389CA4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #4
	blt _02389C78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02389CBC: .word DUNGEON_PTR
	arm_func_end ov31_02389C68

	arm_func_start ov31_02389CC0
ov31_02389CC0: ; 0x02389CC0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x5c
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl sub_0202812C
#if defined(EUROPE)
	add r0, r6, #0x2dc
	add r0, r0, #0x2400
#elif defined(JAPAN)
	add r0, r6, #0x308
	add r0, r0, #0x3c00
#else
	add r0, r6, #0xda
	add r0, r0, #0x2600
#endif
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	add r1, sp, #0xc
	str r6, [sp, #0x1c]
	str r1, [sp]
	str r2, [sp, #4]
	mov r2, #0
	ldr r0, _02389D74 ; =DUNGEON_WINDOW_PARAMS_29
	ldr r1, _02389D78 ; =0x00001013
	ldr r3, _02389D7C ; =0x00000A3B
	str r2, [sp, #8]
	bl CreateScrollBoxSingle
	mov r7, r0
	mov r6, #0x3e
_02389D1C:
	mov r0, r6
	bl AdvanceFrame
	mov r0, r7
	bl IsScrollBoxActive
	cmp r0, #0
	bne _02389D1C
	mov r0, r7
	bl CloseScrollBox
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	mov r0, #4
	mov r1, #0x3e
	bl ov29_022EA370
	mov r0, r5
	bl sub_0202810C
	cmp r4, #0
	beq _02389D6C
	mov r0, r5
	bl ResumeParentMenu
_02389D6C:
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02389D74: .word DUNGEON_WINDOW_PARAMS_29
_02389D78: .word 0x00001013
#ifdef JAPAN
_02389D7C: .word 0x00000876
#else
_02389D7C: .word 0x00000A3B
#endif
	arm_func_end ov31_02389CC0

	arm_func_start ov31_02389D80
ov31_02389D80: ; 0x02389D80
	mov r1, #0
	str r1, [r0, #0xc8]
	str r1, [r0, #0xcc]
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end ov31_02389D80
	; 0x02389D94

	.rodata
	.global DUNGEON_WINDOW_PARAMS_1
DUNGEON_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00
#ifdef EUROPE
	.byte 0x02, 0x02, 0x07, 0x0C
#else
	.byte 0x02, 0x02, 0x00, 0x0C
#endif
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_2
DUNGEON_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x04, 0x13, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_3
DUNGEON_WINDOW_PARAMS_3:
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov31_02382DAC
	.word ov31_02382B54
	.global DUNGEON_WINDOW_PARAMS_4
DUNGEON_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x10, 0x1C, 0x06, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_MAIN_MENU_ITEMS
DUNGEON_MAIN_MENU_ITEMS:
#ifdef JAPAN
#define OV31_DATA_OFFSET 0x1458
#else
#define OV31_DATA_OFFSET 0
#endif
	.word 0x8AD + OV31_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x8AE + OV31_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x8AF + OV31_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x8B0 + OV31_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x8B1 + OV31_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x8B3 + OV31_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x8B4 + OV31_DATA_OFFSET
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global DUNGEON_MENU_SWITCH_STR1
DUNGEON_MENU_SWITCH_STR1:
	.string "[dungeon:0]"
	.global OVERLAY31_UNKNOWN_STRING_IDS
OVERLAY31_UNKNOWN_STRING_IDS:
	.hword 0x8C7 + OV31_DATA_OFFSET
	.global ov31_02389E22
ov31_02389E22:
	.hword 0x8CB + OV31_DATA_OFFSET
	.hword 0x8C8 + OV31_DATA_OFFSET
	.hword 0x8CC + OV31_DATA_OFFSET
	.hword 0x8C9 + OV31_DATA_OFFSET
	.hword 0x8CD + OV31_DATA_OFFSET
	.hword 0x8CA + OV31_DATA_OFFSET
	.hword 0x8CE + OV31_DATA_OFFSET
	.global OVERLAY31_UNKNOWN_STRUCT__NA_2389E30
OVERLAY31_UNKNOWN_STRUCT__NA_2389E30:
	.byte 0x0E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov31_023832F0
	.word HandleStairsMenu
	.global DUNGEON_WINDOW_PARAMS_5
DUNGEON_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x1C, 0x0D, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_6
DUNGEON_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x13, 0x04, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_7
DUNGEON_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0x02, 0x07, 0x06, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_SUBMENU_ITEMS_1
DUNGEON_SUBMENU_ITEMS_1:
#ifdef JAPAN
#define DUNGEON_SUBMENU_ITEMS_1_OFFSET 0x19D0
#else
#define DUNGEON_SUBMENU_ITEMS_1_OFFSET 0
#endif
	.word 0x9AD + DUNGEON_SUBMENU_ITEMS_1_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x8CF + OV31_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x8D0 + OV31_DATA_OFFSET
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.word 0x9AD + DUNGEON_SUBMENU_ITEMS_1_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x8CF + OV31_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x8D0 + OV31_DATA_OFFSET
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.word 0x9C9 + DUNGEON_SUBMENU_ITEMS_1_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x8CF + OV31_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x8D0 + OV31_DATA_OFFSET
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.word 0x9AD + DUNGEON_SUBMENU_ITEMS_1_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x8CF + OV31_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x8D0 + OV31_DATA_OFFSET
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global OVERLAY31_UNKNOWN_STRUCT__NA_2389EF0
OVERLAY31_UNKNOWN_STRUCT__NA_2389EF0:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_8
DUNGEON_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_9
DUNGEON_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x07, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_10
DUNGEON_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x08, 0x02
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_11
DUNGEON_WINDOW_PARAMS_11:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x12, 0x02
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_12
DUNGEON_WINDOW_PARAMS_12:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x13, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_13
DUNGEON_WINDOW_PARAMS_13:
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x02, 0x07, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov31_02389F5C
ov31_02389F5C:
	.byte 0x20, 0x20, 0x3F, 0x3F, 0x3F, 0x00, 0x00, 0x00
	.global OVERLAY31_JP_STRING
OVERLAY31_JP_STRING:
	.byte 0x0A, 0x0A, 0x2D, 0x2D, 0x2D, 0x2D, 0x81, 0x40, 0x20, 0x8F, 0x89, 0x8A, 0xFA, 0x83, 0x7C, 0x83
	.byte 0x57, 0x83, 0x56, 0x83, 0x87, 0x83, 0x93, 0x3D, 0x25, 0x64, 0x81, 0x40, 0x2D, 0x2D, 0x2D, 0x2D
	.byte 0x2D, 0x20, 0x0A, 0x00
	.global DUNGEON_WINDOW_PARAMS_14
DUNGEON_WINDOW_PARAMS_14:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x11, 0x1C, 0x05, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_15
DUNGEON_WINDOW_PARAMS_15:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_16
DUNGEON_WINDOW_PARAMS_16:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x10, 0x1C, 0x04, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_17
DUNGEON_WINDOW_PARAMS_17:
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_18
DUNGEON_WINDOW_PARAMS_18:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x13, 0x04, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_19
DUNGEON_WINDOW_PARAMS_19:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_STRUCT__NA_2389FE8
OVERLAY31_UNKNOWN_STRUCT__NA_2389FE8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_20
DUNGEON_WINDOW_PARAMS_20:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x0E, 0x12, 0x04, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_21
DUNGEON_WINDOW_PARAMS_21:
	.byte 0x00, 0x00, 0x00, 0x00, 0x0E, 0x02, 0x10, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_22
DUNGEON_WINDOW_PARAMS_22:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x0F, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_23
DUNGEON_WINDOW_PARAMS_23:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x02, 0x0B, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_24
DUNGEON_WINDOW_PARAMS_24:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x0A, 0x02, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov31_0238A044
ov31_0238A044:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x30, 0x5D, 0x00, 0x00
	.global ov31_0238A04C
ov31_0238A04C:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x31, 0x5D, 0x00, 0x00
	.global ov31_0238A054
ov31_0238A054:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x32, 0x5D, 0x00, 0x00
	.global ov31_0238A05C
ov31_0238A05C:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x33, 0x5D, 0x00, 0x00
	.global ov31_0238A064
ov31_0238A064:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x34, 0x5D, 0x00, 0x00
	.global ov31_0238A06C
ov31_0238A06C:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x35, 0x5D, 0x00, 0x00
	.global ov31_0238A074
ov31_0238A074:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x36, 0x5D, 0x00, 0x00
	.global ov31_0238A07C
ov31_0238A07C:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x37, 0x5D, 0x00, 0x00
	.global ov31_0238A084
ov31_0238A084:
	.byte 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x30, 0x5D, 0x5B, 0x43, 0x4C, 0x55, 0x4D, 0x5F
	.byte 0x53, 0x45, 0x54, 0x3A, 0x38, 0x30, 0x5D, 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x31
	.byte 0x5D, 0x00, 0x00, 0x00
	.global ov31_0238A0A8
ov31_0238A0A8:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x30, 0x5D, 0x00, 0x00
	.global ov31_0238A0B0
ov31_0238A0B0:
	.byte 0x5B, 0x4D, 0x3A, 0x48
	.byte 0x31, 0x5D, 0x00, 0x00
	.global ov31_0238A0B8
ov31_0238A0B8:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x32, 0x5D, 0x00, 0x00
	.global ov31_0238A0C0
ov31_0238A0C0:
	.byte 0x5B, 0x4D, 0x3A, 0x48
	.byte 0x33, 0x5D, 0x00, 0x00
	.global ov31_0238A0C8
ov31_0238A0C8:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x34, 0x5D, 0x00, 0x00
	.global ov31_0238A0D0
ov31_0238A0D0:
	.byte 0x5B, 0x4D, 0x3A, 0x48
	.byte 0x35, 0x5D, 0x00, 0x00
	.global ov31_0238A0D8
ov31_0238A0D8:
	.byte 0x5B, 0x4D, 0x3A, 0x48, 0x36, 0x5D, 0x00, 0x00
	.global ov31_0238A0E0
ov31_0238A0E0:
	.byte 0x5B, 0x4D, 0x3A, 0x48
	.byte 0x37, 0x5D, 0x00, 0x00
	.global ov31_0238A0E8
ov31_0238A0E8:
	.byte 0x5B, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x3A, 0x30, 0x5D, 0x5B, 0x43
	.byte 0x4C, 0x55, 0x4D, 0x5F, 0x53, 0x45, 0x54, 0x3A, 0x38, 0x30, 0x5D, 0x5B, 0x73, 0x74, 0x72, 0x69
	.byte 0x6E, 0x67, 0x3A, 0x31, 0x5D, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_25
DUNGEON_WINDOW_PARAMS_25:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x0C, 0x00
	.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_SUBMENU_ITEMS_5
DUNGEON_SUBMENU_ITEMS_5:
	.word 0x8C3 + OV31_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x8C4 + OV31_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.global DUNGEON_WINDOW_PARAMS_26
DUNGEON_WINDOW_PARAMS_26:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x12, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_STRUCT__NA_238A144
OVERLAY31_UNKNOWN_STRUCT__NA_238A144:
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word ov31_0238917C
	.word RecruitmentSearchMenuLoop
	.global ov31_0238A154
ov31_0238A154:
	.byte 0x5B, 0x76, 0x61, 0x6C, 0x75, 0x65, 0x3A, 0x30, 0x3A, 0x33, 0x5D, 0x20, 0x5B, 0x43, 0x53, 0x3A
	.byte 0x25, 0x63, 0x5D, 0x25, 0x73, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_27
DUNGEON_WINDOW_PARAMS_27:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x0F, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_28
DUNGEON_WINDOW_PARAMS_28:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x1C, 0x14, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_STRUCT__NA_238A190
OVERLAY31_UNKNOWN_STRUCT__NA_238A190:
	.byte 0x0E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov31_02389460
	.word HelpMenuLoop
	.global DUNGEON_SUBMENU_ITEMS_6
DUNGEON_SUBMENU_ITEMS_6:
#if defined(EUROPE)
#define DUNGEON_SUBMENU_6_OFFSET 2
#elif defined(JAPAN)
#define DUNGEON_SUBMENU_6_OFFSET 0xA03
#else
#define DUNGEON_SUBMENU_6_OFFSET 0
#endif
	.word 0x3FA8 + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x3FA9 + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x3FAA + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x3FAB + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x3FAC + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3FAD + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x3FAE + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x3FAF + DUNGEON_SUBMENU_6_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.global DUNGEON_WINDOW_PARAMS_29
DUNGEON_WINDOW_PARAMS_29:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x18, 0x13, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_30
DUNGEON_WINDOW_PARAMS_30:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_31
DUNGEON_WINDOW_PARAMS_31:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x00, 0x00, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global DUNGEON_WINDOW_PARAMS_32
DUNGEON_WINDOW_PARAMS_32:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x14, 0x0F, 0x02, 0x00, 0xFE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov31_0238A228
ov31_0238A228:
	.byte 0x5B, 0x4D, 0x3A, 0x53, 0x32, 0x5D, 0x5B, 0x74, 0x61, 0x63, 0x74, 0x69
	.byte 0x63, 0x73, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00
	.global ov31_0238A23C
ov31_0238A23C:
	.byte 0x5B, 0x4D, 0x3A, 0x53, 0x31, 0x5D, 0x5B, 0x74
	.byte 0x61, 0x63, 0x74, 0x69, 0x63, 0x73, 0x3A, 0x30, 0x5D, 0x00, 0x00, 0x00

	.data
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A260
OVERLAY31_UNKNOWN_POINTER__NA_238A260:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A268
OVERLAY31_UNKNOWN_POINTER__NA_238A268:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A26C
OVERLAY31_UNKNOWN_POINTER__NA_238A26C:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A270
OVERLAY31_UNKNOWN_POINTER__NA_238A270:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A27C
OVERLAY31_UNKNOWN_POINTER__NA_238A27C:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A280
OVERLAY31_UNKNOWN_POINTER__NA_238A280:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A284
OVERLAY31_UNKNOWN_POINTER__NA_238A284:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A288
OVERLAY31_UNKNOWN_POINTER__NA_238A288:
	.byte 0x00, 0x00, 0x00, 0x00
	.global OVERLAY31_UNKNOWN_POINTER__NA_238A28C
OVERLAY31_UNKNOWN_POINTER__NA_238A28C:
	.byte 0x00, 0x00, 0x00, 0x00

	.bss
	.global ov31_0238A2A0
ov31_0238A2A0:
	.space 0x8
	.global ov31_0238A2A8
ov31_0238A2A8:
	.space 0x18
