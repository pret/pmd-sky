	.include "asm/macros.inc"
	.include "overlay_18.inc"

	.text

	arm_func_start ov18_0238A140
ov18_0238A140: ; 0x0238A140
	stmdb sp!, {r3, lr}
	mov r0, #0x3c4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A298 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #1
	str r0, [r1]
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	add r0, r0, #0x14
	bl InitPreprocessorArgs
	ldr r3, _0238A298 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	ldr r2, [r3]
	sub r0, r1, #1
	str r1, [r2, #0x74]
	ldr r2, [r3]
	mov ip, #2
	str r1, [r2, #0x78]
	ldr lr, [r3]
	ldr r2, [lr, #0x78]
	str r2, [lr, #0x80]
	ldr r2, [r3]
	str r1, [r2, #0x7c]
	ldr r2, [r3]
	str r0, [r2, #0x84]
	ldr r2, [r3]
	str r1, [r2, #0x88]
	ldr r2, [r3]
	add r2, r2, #0x300
	strh r0, [r2, #0x8c]
	ldr r2, [r3]
	add r2, r2, #0x300
	strh ip, [r2, #0x88]
	ldr r2, [r3]
	add r2, r2, #0x300
	strh ip, [r2, #0x8a]
	ldr r2, [r3]
	str r1, [r2, #0x3a0]
	ldr r2, [r3]
	add r2, r2, #0x300
	strh r0, [r2, #0xa4]
	ldr r0, [r3]
	strh r1, [r0, #0x8c]
	bl sub_020573A0
	bl sub_02041400
	ldr r1, _0238A29C ; =ov11_0238A090
	ldr r0, _0238A298 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r1]
	ldr r2, [r0]
	mvn r1, #1
	str r3, [r2, #0x390]
	ldr r2, [r0]
	strb r1, [r2]
	ldr r2, [r0]
	strb r1, [r2, #1]
	ldr r2, [r0]
	strb r1, [r2, #2]
	ldr r2, [r0]
	strb r1, [r2, #3]
	ldr r2, [r0]
	strb r1, [r2, #4]
	ldr r2, [r0]
	strb r1, [r2, #5]
	ldr r2, [r0]
	strb r1, [r2, #6]
	ldr r2, [r0]
	strb r1, [r2, #7]
	ldr r2, [r0]
	strb r1, [r2, #8]
	ldr r2, [r0]
	strb r1, [r2, #9]
	ldr r2, [r0]
	strb r1, [r2, #0xa]
	ldr r2, [r0]
	strb r1, [r2, #0xb]
	ldr r2, [r0]
	strb r1, [r2, #0xc]
	ldr r2, [r0]
	strb r1, [r2, #0xd]
	ldr r2, [r0]
	strb r1, [r2, #0xe]
	ldr r2, [r0]
	mov r0, #1
	strb r1, [r2, #0xf]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A298: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238A29C: .word ov11_0238A090
	arm_func_end ov18_0238A140

	arm_func_start ov18_0238A2A0
ov18_0238A2A0: ; 0x0238A2A0
	stmdb sp!, {r3, lr}
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #1
	bne _0238A2CC
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2CC
	bl sub_0202F334
_0238A2CC:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #2
	bne _0238A2F4
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A2F4
	bl HidePortraitBox
_0238A2F4:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #4
	bne _0238A31C
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	beq _0238A31C
	bl sub_0202F954
_0238A31C:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldr r0, [r0, #0x88]
	tst r0, #0x80
	bne _0238A334
	bl sub_0203A618
_0238A334:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x100
	bne _0238A35C
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	beq _0238A35C
	bl SetAdvancedTextBoxState5
_0238A35C:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x200
	bne _0238A384
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	beq _0238A384
	bl SetAdvancedTextBoxState5
_0238A384:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x400
	bne _0238A3AC
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	beq _0238A3AC
	bl SetScrollBoxState7
_0238A3AC:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x1000
	bne _0238A3D4
	ldrsb r0, [r1, #0xb]
	mvn r1, #1
	cmp r0, r1
	beq _0238A3D4
	bl sub_0202BC60
_0238A3D4:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x4000
	bne _0238A3FC
	ldrsb r0, [r1, #0xd]
	mvn r1, #1
	cmp r0, r1
	beq _0238A3FC
	bl SetAdvancedTextBoxState5
_0238A3FC:
	ldr r0, _0238A428 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10000
	ldmneia sp!,  {r3, pc}
	ldrsb r0, [r1, #0xf]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F334
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A428: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238A2A0

	arm_func_start ov18_0238A42C
ov18_0238A42C: ; 0x0238A42C
	stmdb sp!, {r3, lr}
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #1
	bne _0238A498
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A48C
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A48C
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseDialogueBox
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0]
_0238A48C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A498:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #2
	bne _0238A500
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A4F4
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238A4F4
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ClosePortraitBox
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #1]
_0238A4F4:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A500:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #4
	bne _0238A568
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A55C
	bl IsTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A55C
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl CloseTextBox
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #2]
_0238A55C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A568:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #8
	bne _0238A5D0
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A5C4
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A5C4
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #3]
_0238A5C4:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A5D0:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x20
	bne _0238A638
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A62C
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A62C
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #4]
_0238A62C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A638:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10
	bne _0238A6A0
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A694
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A694
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #5]
_0238A694:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A6A0:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x40
	bne _0238A708
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A6FC
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A6FC
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #6]
_0238A6FC:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A708:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldr r0, [r0, #0x88]
	tst r0, #0x80
	bne _0238A740
	bl sub_0203A9B8
	cmp r0, #0
	movne r0, #0
	bne _0238A734
	bl sub_0203A51C
	mov r0, #1
_0238A734:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A740:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r0]
	ldr r2, [r3, #0x88]
	tst r2, #0x100
	bne _0238A774
	ldrsb r1, [r3, #7]
	mvn r0, #1
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A774:
	tst r2, #0x200
	bne _0238A7D4
	ldrsb r0, [r3, #8]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A7C8
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A7C8
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl CloseAdvancedTextBox
	bl sub_020407C0
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #8]
_0238A7C8:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A7D4:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x400
	bne _0238A840
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A834
	bl IsScrollBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A834
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	bl CloseScrollBox
	bl sub_02041A00
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #9]
_0238A834:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A840:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x800
	bne _0238A8A8
	ldrsb r0, [r1, #0xa]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A89C
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A89C
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xa]
_0238A89C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A8A8:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x1000
	bne _0238A910
	ldrsb r0, [r1, #0xb]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A904
	bl IsAdvancedMenuActive2
	cmp r0, #0
	movne r2, #0
	bne _0238A904
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl CloseAdvancedMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xb]
_0238A904:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A910:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x2000
	bne _0238A978
	ldrsb r0, [r1, #0xc]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A96C
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238A96C
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xc]
_0238A96C:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A978:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x4000
	bne _0238A9E4
	ldrsb r0, [r1, #0xd]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A9D8
	bl IsAdvancedTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A9D8
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xd]
	bl CloseAdvancedTextBox
	bl sub_020407C0
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xd]
_0238A9D8:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A9E4:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x8000
	bne _0238AA4C
	ldrsb r0, [r1, #0xe]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AA40
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238AA40
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xe]
	bl CloseSimpleMenu
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xe]
_0238AA40:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AA4C:
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10000
	bne _0238AAB4
	ldrsb r0, [r1, #0xf]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AAA8
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238AAA8
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xf]
	bl CloseDialogueBox
	ldr r0, _0238AABC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xf]
_0238AAA8:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AAB4:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238AABC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238A42C

	arm_func_start ov18_0238AAC0
ov18_0238AAC0: ; 0x0238AAC0
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
	arm_func_end ov18_0238AAC0

	arm_func_start ov18_0238AAE8
ov18_0238AAE8: ; 0x0238AAE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, r2
	mov sb, r1
	mov r8, r3
	ldr r7, [sp, #0x28]
	mov r6, #0
	bl GetMovesetLevelUpPtr
	mov r5, r0
	mov r4, #1
	ldr fp, _0238ABAC ; =0x0000021F
	b _0238AB98
_0238AB18:
	mov r0, r5
	add r1, sp, #0
	bl GetEncodedHalfword
	ldrb r1, [r0]
	add r5, r0, #1
	cmp r1, r8
	bgt _0238ABA4
	ldrsh r0, [sb]
	cmp r0, fp
	bge _0238AB98
	ldrh r0, [sp]
	mov r1, r7
	bl sub_02053880
	cmp r0, #0
	beq _0238AB98
	ldrh r1, [sp]
	mov r2, r1, lsr #0x1f
	mov r0, r1, lsr #5
	rsb r1, r2, r1, lsl #27
	ldr r3, [sl, r0, lsl #2]
	add ip, r2, r1, ror #27
	tst r3, r4, lsl ip
	bne _0238AB98
	mov r2, r3
	orr r2, r2, r4, lsl ip
	str r2, [sl, r0, lsl #2]
	add r1, r6, #1
	mov r0, r1, lsl #0x10
	ldrsh r2, [sb]
	mov r6, r0, asr #0x10
	add r0, r2, #1
	strh r0, [sb]
_0238AB98:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0238AB18
_0238ABA4:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238ABAC: .word 0x0000021F
	arm_func_end ov18_0238AAE8

	arm_func_start ov18_0238ABB0
ov18_0238ABB0: ; 0x0238ABB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x58
	ldr r2, _0238ACDC ; =TEAM_MEMBER_TABLE_PTR
	mov r1, #0x44
	ldr r2, [r2]
	mov r3, #0
	smlabb r6, r0, r1, r2
	mov r0, r3
	add r2, sp, #0x14
_0238ABD4:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	str r0, [r2, r3, lsl #2]
	mov r3, r1, asr #0x10
	cmp r3, #0x11
	blt _0238ABD4
	add r8, sp, #0x14
	mov r4, #1
	mov r3, #6
_0238ABF8:
	mla r2, r0, r3, r6
	ldrb r1, [r2, #0x22]
	tst r1, #1
	beq _0238AC28
	ldrh r1, [r2, #0x24]
	mov r7, r1, lsr #5
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #27
	ldr r5, [r8, r7, lsl #2]
	add r1, r2, r1, ror #27
	orr r1, r5, r4, lsl r1
	str r1, [r8, r7, lsl #2]
_0238AC28:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	blt _0238ABF8
	mov r0, #0
	strh r0, [sp, #4]
	ldrsh r1, [r6, #4]
	cmp r1, #0
	beq _0238ACD4
	add r1, sp, #6
	mov r0, r6
	bl GetEvoFamily
	mov r8, r0
	mov r7, #0
	add r5, sp, #0x14
	add r4, sp, #4
	add sb, sp, #6
	b _0238AC9C
_0238AC74:
	ldrsh r2, [r6, #8]
	mov r1, r7, lsl #2
	add r0, sb, r7, lsl #2
	str r2, [sp]
	ldrsh r2, [sb, r1]
	ldrb r3, [r0, #2]
	mov r0, r5
	mov r1, r4
	bl ov18_0238AAE8
	add r7, r7, #1
_0238AC9C:
	cmp r7, r8
	blt _0238AC74
	ldrsh r0, [r6, #4]
	ldr r2, _0238ACE0 ; =0x00000216
	cmp r0, r2
	bne _0238ACD0
	ldrsh r3, [r6, #8]
	add r0, sp, #0x14
	add r1, sp, #4
	str r3, [sp]
	ldrb r3, [r6, #1]
	add r2, r2, #1
	bl ov18_0238AAE8
_0238ACD0:
	ldrsh r0, [sp, #4]
_0238ACD4:
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0238ACDC: .word TEAM_MEMBER_TABLE_PTR
_0238ACE0: .word 0x00000216
	arm_func_end ov18_0238ABB0

	arm_func_start ov18_0238ACE4
ov18_0238ACE4: ; 0x0238ACE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, r2
	mov sb, r1
	mov r8, r3
	ldr r7, [sp, #0x28]
	ldr r6, [sp, #0x2c]
	bl GetMovesetLevelUpPtr
	mov r5, r0
	mov r4, #1
	ldr fp, _0238ADA4 ; =0x0000021F
	b _0238AD90
_0238AD14:
	mov r0, r5
	add r1, sp, #0
	bl GetEncodedHalfword
	ldrb r1, [r0]
	add r5, r0, #1
	cmp r1, r8
	bgt _0238AD9C
	ldrsh r0, [sb]
	cmp r0, fp
	bge _0238AD90
	ldrh r0, [sp]
	mov r1, r7
	bl sub_02053880
	cmp r0, #0
	beq _0238AD90
	ldrh r0, [sp]
	mov r3, r0, lsr #0x1f
	mov r1, r0, lsr #5
	rsb r2, r3, r0, lsl #27
	ldr ip, [sl, r1, lsl #2]
	add r3, r3, r2, ror #27
	tst ip, r4, lsl r3
	bne _0238AD90
	mov r2, ip
	orr r2, r2, r4, lsl r3
	str r2, [sl, r1, lsl #2]
	ldrsh r1, [sb]
	cmp r6, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r1, #1
	strh r0, [sb]
_0238AD90:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0238AD14
_0238AD9C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238ADA4: .word 0x0000021F
	arm_func_end ov18_0238ACE4

	arm_func_start ov18_0238ADA8
ov18_0238ADA8: ; 0x0238ADA8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x5c
	ldr r3, _0238AEE8 ; =TEAM_MEMBER_TABLE_PTR
	mov r2, #0x44
	ldr r3, [r3]
	mov r4, r1
	smlabb r8, r0, r2, r3
	mov r3, #0
	mov r1, r3
	add r2, sp, #0x18
_0238ADD0:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	str r1, [r2, r3, lsl #2]
	mov r3, r0, asr #0x10
	cmp r3, #0x11
	blt _0238ADD0
	add r0, sp, #0x18
	mov r6, #1
	mov r5, #6
_0238ADF4:
	mla r3, r1, r5, r8
	ldrb r2, [r3, #0x22]
	tst r2, #1
	beq _0238AE24
	ldrh r2, [r3, #0x24]
	mov sb, r2, lsr #5
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #27
	ldr r7, [r0, sb, lsl #2]
	add r2, r3, r2, ror #27
	orr r2, r7, r6, lsl r2
	str r2, [r0, sb, lsl #2]
_0238AE24:
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	cmp r1, #4
	blt _0238ADF4
	mov r0, #0
	strh r0, [sp, #8]
	ldrsh r1, [r8, #4]
	cmp r1, #0
	beq _0238AEE0
	add r1, sp, #0xa
	mov r0, r8
	bl GetEvoFamily
	mov sl, r0
	mov sb, #0
	add r7, sp, #0x18
	add r6, sp, #8
	add r5, sp, #0xa
	b _0238AEA0
_0238AE70:
	ldrsh r2, [r8, #8]
	mov r1, sb, lsl #2
	add r0, r5, sb, lsl #2
	stmia sp, {r2, r4}
	ldrsh r2, [r5, r1]
	ldrb r3, [r0, #2]
	mov r0, r7
	mov r1, r6
	bl ov18_0238ACE4
	cmp r0, #0
	bne _0238AEE0
	add sb, sb, #1
_0238AEA0:
	cmp sb, sl
	blt _0238AE70
	ldrsh r0, [r8, #4]
	ldr r2, _0238AEEC ; =0x00000216
	cmp r0, r2
	bne _0238AEDC
	ldrsh r3, [r8, #8]
	add r0, sp, #0x18
	add r1, sp, #8
	stmia sp, {r3, r4}
	ldrb r3, [r8, #1]
	add r2, r2, #1
	bl ov18_0238ACE4
	cmp r0, #0
	bne _0238AEE0
_0238AEDC:
	mov r0, #0
_0238AEE0:
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238AEE8: .word TEAM_MEMBER_TABLE_PTR
_0238AEEC: .word 0x00000216
	arm_func_end ov18_0238ADA8

	arm_func_start ov18_0238AEF0
ov18_0238AEF0: ; 0x0238AEF0
	stmdb sp!, {r4, lr}
	ldr r2, _0238AF34 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, r1, lsl #0x10
	ldr r2, [r2]
	mov r4, r0
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x8c]
	mov r1, r1, asr #0x10
	bl ov18_0238ADA8
	bl GetMoveName
	mov r3, r0
	ldr r1, _0238AF38 ; =ov18_0238D5F8
	mov r0, r4
	mov r2, #0x4d
	bl ov18_0238AAC0
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238AF34: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238AF38: .word ov18_0238D5F8
	arm_func_end ov18_0238AEF0

	arm_func_start ov18_0238AF3C
ov18_0238AF3C: ; 0x0238AF3C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	sub sp, sp, #0x400
	mov r4, r0
	bl sub_02027B1C
	bl GetMoneyCarried
	str r0, [sp, #0x428]
	bl sub_02041414
	cmp r0, #0
	ldrne r0, [sp, #0x428]
	add ip, sp, #0x400
	subne r0, r0, #0x1f4
	strne r0, [sp, #0x428]
	add ip, ip, #4
	ldr r2, _0238AFC8 ; =ov18_0238D608
	ldr r3, _0238AFCC ; =0x0000C402
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
#ifdef JAPAN
	mov r1, #4
	mov r0, r4
	rsb r3, r1, #0x430
#else
	ldr r3, _0238AFD0 ; =0x00000225
	mov r0, r4
	mov r1, #4
#endif
	mov r2, #2
	bl sub_02026268
	add r3, sp, #4
	mov r0, r4
	mov r1, #0x16
	mov r2, #0x10
	bl DrawTextInWindow
	mov r0, r4
	bl UpdateWindow
	add sp, sp, #0x54
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238AFC8: .word ov18_0238D608
_0238AFCC: .word 0x0000C402
#ifndef JAPAN
_0238AFD0: .word 0x00000225
#endif
	arm_func_end ov18_0238AF3C

	arm_func_start ov18_0238AFD4
ov18_0238AFD4: ; 0x0238AFD4
	stmdb sp!, {r3, lr}
	ldr r0, _0238B018 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0238B018 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	str r1, [r0]
	bl sub_02041414
	cmp r0, #0
	beq _0238B010
	mov r0, #0x1f4
	rsb r0, r0, #0
	bl AddMoneyCarried
_0238B010:
	bl sub_020572EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B018: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238AFD4

	arm_func_start ov18_0238B01C
ov18_0238B01C: ; 0x0238B01C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x214
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r4, [r0]
	ldr r0, [r4, #0x74]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238BD34
_0238B03C: ; jump table
	b _0238B04C ; case 0
	b _0238BD00 ; case 1
	b _0238BD1C ; case 2
	b _0238BD34 ; case 3
_0238B04C:
	ldr ip, _0238BD44 ; =OVERLAY18_FUNCTION_POINTER_TABLE
	add r6, sp, #0x1c
	mov r5, #0x13
_0238B058:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0238B058
	ldr r0, [r4, #0x7c]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0238BCF8
_0238B078: ; jump table
	b _0238B088 ; case 0
	b _0238B0FC ; case 1
	b _0238BC88 ; case 2
	b _0238B088 ; case 3
_0238B088:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	str r1, [r4, #0x7c]
	ldr r1, [r0]
	add r0, sp, #0x1c
	ldr r1, [r1, #0x78]
	ldr r0, [r0, r1, lsl #2]
	blx r0
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r0]
	ldr r1, [r3, #0x78]
	ldr r2, [r3, #0x80]
	cmp r1, r2
	beq _0238BCF8
	ldr r1, [r3, #0x7c]
	cmp r1, #3
	bne _0238B0E4
	str r2, [r3, #0x78]
	ldr r1, [r0]
	add r0, sp, #0x1c
	ldr r1, [r1, #0x78]
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0238B0E4:
	bl ov18_0238A2A0
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x7c]
	b _0238BCF8
_0238B0FC:
	bl ov18_0238A42C
	cmp r0, #0
	beq _0238BCF8
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #1
	beq _0238B4A4
	ldrsb r1, [r1]
	mvn r0, #1
	ldr r4, _0238BD48 ; =0x00003008
	cmp r1, r0
	bne _0238B150
	ldr r0, _0238BD4C ; =LINK_SHOP_WINDOW_PARAMS_11
	bl CreateDialogueBox
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r2, #0
	ldr r3, [r1]
	strb r0, [r3]
	ldr r0, [r1]
	str r2, [r0, #0x84]
_0238B150:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl ShowDialogueBox
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x1fc
	ldr r3, [r0]
	ldr r2, [r3, #0x84]
	str r1, [r3, #0x60]
	ldr r3, [r0]
	mov r0, r2, lsl #0x10
	ldr r1, [r3, #0x78]
	mov r0, r0, lsr #0x10
	cmp r1, #0x48
	bgt _0238B1AC
	bge _0238B1C8
	cmp r1, #0x2d
	bgt _0238B1E4
	cmp r1, #0x2c
	blt _0238B1E4
	cmpne r1, #0x2d
	beq _0238B1C8
	b _0238B1E4
_0238B1AC:
	cmp r1, #0x4b
	bgt _0238B1E4
	cmp r1, #0x49
	blt _0238B1E4
	cmpne r1, #0x4a
	cmpne r1, #0x4b
	bne _0238B1E4
_0238B1C8:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r2, [r1]
	add r1, r2, #0x300
	ldrsh r1, [r1, #0x8c]
	orr r1, r1, #0x20000
	str r1, [r2, #0x14]
	b _0238B1EC
_0238B1E4:
	mov r1, #0x1fc
	str r1, [r3, #0x14]
_0238B1EC:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r1]
	ldr r2, [r3, #0x78]
	cmp r2, #0x4b
	addls pc, pc, r2, lsl #2
	b _0238B468
_0238B204: ; jump table
	b _0238B334 ; case 0
	b _0238B468 ; case 1
	b _0238B468 ; case 2
	b _0238B360 ; case 3
	b _0238B360 ; case 4
	b _0238B36C ; case 5
	b _0238B468 ; case 6
	b _0238B468 ; case 7
	b _0238B374 ; case 8
	b _0238B374 ; case 9
	b _0238B380 ; case 10
	b _0238B380 ; case 11
	b _0238B38C ; case 12
	b _0238B38C ; case 13
	b _0238B398 ; case 14
	b _0238B398 ; case 15
	b _0238B468 ; case 16
	b _0238B468 ; case 17
	b _0238B468 ; case 18
	b _0238B3BC ; case 19
	b _0238B3BC ; case 20
	b _0238B468 ; case 21
	b _0238B468 ; case 22
	b _0238B468 ; case 23
	b _0238B468 ; case 24
	b _0238B3A4 ; case 25
	b _0238B3A4 ; case 26
	b _0238B468 ; case 27
	b _0238B468 ; case 28
	b _0238B468 ; case 29
	b _0238B468 ; case 30
	b _0238B468 ; case 31
	b _0238B468 ; case 32
	b _0238B468 ; case 33
	b _0238B3C8 ; case 34
	b _0238B3C8 ; case 35
	b _0238B3D4 ; case 36
	b _0238B468 ; case 37
	b _0238B468 ; case 38
	b _0238B3DC ; case 39
	b _0238B468 ; case 40
	b _0238B468 ; case 41
	b _0238B3E4 ; case 42
	b _0238B3E4 ; case 43
	b _0238B3F0 ; case 44
	b _0238B3F0 ; case 45
	b _0238B468 ; case 46
	b _0238B3FC ; case 47
	b _0238B3FC ; case 48
	b _0238B408 ; case 49
	b _0238B408 ; case 50
	b _0238B414 ; case 51
	b _0238B468 ; case 52
	b _0238B468 ; case 53
	b _0238B468 ; case 54
	b _0238B468 ; case 55
	b _0238B468 ; case 56
	b _0238B468 ; case 57
	b _0238B420 ; case 58
	b _0238B420 ; case 59
	b _0238B468 ; case 60
	b _0238B468 ; case 61
	b _0238B468 ; case 62
	b _0238B468 ; case 63
	b _0238B468 ; case 64
	b _0238B468 ; case 65
	b _0238B434 ; case 66
	b _0238B468 ; case 67
	b _0238B468 ; case 68
	b _0238B43C ; case 69
	b _0238B468 ; case 70
	b _0238B468 ; case 71
	b _0238B444 ; case 72
	b _0238B444 ; case 73
	b _0238B458 ; case 74
	b _0238B458 ; case 75
_0238B334:
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	ldreq r0, _0238BD50 ; =0x000003FB
	beq _0238B468
	mov r0, #0x1f4
	str r0, [r3, #0x38]
	ldr r0, [r1]
	mov r1, #0
	strb r1, [r0, #0x10]
	ldr r0, _0238BD54 ; =0x000003F9
	b _0238B468
_0238B360:
#ifdef JAPAN
	ldr r0, _0238D2B4 ; =0x00003D36
#else
	mov r0, #0x410
#endif
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B36C:
	ldr r0, _0238BD5C ; =0x0000040B
	b _0238B468
_0238B374:
	ldr r0, _0238BD60 ; =0x0000040C
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B380:
	ldr r0, _0238BD64 ; =0x0000040D
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B38C:
	ldr r0, _0238BD68 ; =0x0000040E
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B398:
	ldr r0, _0238BD6C ; =0x0000040F
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B3A4:
	bl GetMoneyCarried
	cmp r0, #0x1f4
	ldrlt r0, _0238BD70 ; =0x00003FCC
	ldr r4, _0238BD74 ; =0x00000408
	ldrge r0, _0238BD78 ; =0x00003FCD
	b _0238B468
_0238B3BC:
	ldr r0, _0238BD7C ; =0x00000405
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B3C8:
	ldr r0, _0238BD80 ; =0x00000406
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B3D4:
	ldr r0, _0238BD84 ; =0x00000407
	b _0238B468
_0238B3DC:
	ldr r0, _0238BD88 ; =0x00000409
	b _0238B468
_0238B3E4:
#ifdef JAPAN
	ldr r0, _0238D2EC ; =0x00003D2E
#else
	ldr r0, _0238BD74 ; =0x00000408
#endif
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B3F0:
	ldr r0, _0238BD8C ; =0x0000040A
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B3FC:
#ifdef JAPAN
	ldr r0, _0238D2F4 ; =0x00003D22
#else
	mov r0, #0x3fc
#endif
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B408:
	ldr r0, _0238BD90 ; =0x000003FD
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B414:
	ldr r0, _0238BD94 ; =0x000003FE
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B420:
	ldr r1, _0238BD98 ; =0x0000131B
	ldr r0, _0238BD9C ; =0x000003FF
	str r1, [r3, #0x38]
	ldr r4, _0238BD58 ; =0x00003018
	b _0238B468
_0238B434:
	ldr r0, _0238BDA0 ; =0x00000401
	b _0238B468
_0238B43C:
	ldr r0, _0238BDA4 ; =0x00000403
	b _0238B468
_0238B444:
	ldr r1, _0238BD98 ; =0x0000131B
	ldr r0, _0238BDA8 ; =0x00000402
	str r1, [r3, #0x38]
#ifdef JAPAN
	sub r4, r0, #0xd10
#else
	ldr r4, _0238BD58 ; =0x00003018
#endif
	b _0238B468
_0238B458:
	ldr r1, _0238BD98 ; =0x0000131B
	ldr r0, _0238BDAC ; =0x00000404
	ldr r4, _0238BD58 ; =0x00003018
	str r1, [r3, #0x38]
_0238B468:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r0, r0, lsl #0x10
	ldr r3, [r1]
	mov r5, r0, lsr #0x10
	ldr r2, [r3, #0x84]
	cmp r2, r0, lsr #16
	beq _0238B4A4
	str r5, [r3, #0x84]
	ldr r3, [r1]
	mov r1, r4
	ldr r2, [r3, #0x84]
	ldrsb r0, [r3], #0x14
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl ShowStringIdInDialogueBox
_0238B4A4:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #2
	beq _0238B530
	ldrsb r1, [r1, #1]
	mvn r0, #1
	cmp r1, r0
	bne _0238B530
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x1fc
	ldr r3, [r2]
	strb r0, [r3, #1]
	ldr r0, [r2]
	add r0, r0, #0x64
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x64
	bl SetPortraitLayout
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x64
	bl SetPortraitEmotion
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldrsb r0, [r1, #1]
	add r1, r1, #0x64
	bl ShowPortraitInPortraitBox
_0238B530:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #4
	beq _0238B56C
	ldrsb r1, [r1, #2]
	mvn r0, #1
	cmp r1, r0
	bne _0238B56C
	ldr r0, _0238BDB0 ; =LINK_SHOP_WINDOW_PARAMS_1
	ldr r1, _0238BDB4 ; =ov18_0238AF3C
	bl CreateTextBox
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #2]
_0238B56C:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #8
	beq _0238B5B8
	ldrsb r1, [r1, #3]
	mvn r0, #1
	cmp r1, r0
	bne _0238B5B8
	ldr r0, _0238BDB8 ; =LINK_SHOP_WINDOW_PARAMS_9
	mov r4, #3
	ldr r1, _0238BDBC ; =0x00300013
	ldr r3, _0238BDC0 ; =LINK_SHOP_MAIN_MENU_ITEMS
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #3]
_0238B5B8:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x20
	beq _0238B604
	ldrsb r1, [r1, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238B604
	ldr r0, _0238BDC4 ; =LINK_SHOP_WINDOW_PARAMS_7
	mov r4, #4
	ldr r1, _0238BDBC ; =0x00300013
	ldr r3, _0238BDC8 ; =LINK_SHOP_SUBMENU_ITEMS_3
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238B604:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r1]
	ldr r0, [r3, #0x88]
	tst r0, #0x40
	beq _0238B65C
	ldrsb r2, [r3, #6]
	mvn r0, #1
	cmp r2, r0
	bne _0238B65C
	mov r0, #1
	str r0, [r3, #0x90]
	mov r0, #2
	str r0, [sp]
	ldr r2, [r1]
	ldr r0, _0238BDCC ; =LINK_SHOP_WINDOW_PARAMS_2
	ldr r1, _0238BDD0 ; =0x00300033
	ldr r3, _0238BDD4 ; =LINK_SHOP_MENU_ITEMS_CONFIRM
	add r2, r2, #0x90
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #6]
_0238B65C:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10
	beq _0238B6A8
	ldrsb r1, [r1, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238B6A8
	ldr r0, _0238BDD8 ; =LINK_SHOP_WINDOW_PARAMS_8
	mov r4, #5
	ldr r3, _0238BDDC ; =LINK_SHOP_SUBMENU_ITEMS_4
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238B6A8:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldr r0, [r0, #0x88]
	tst r0, #0x80
	beq _0238B6F8
	bl sub_0203A998
	cmp r0, #0
	bne _0238B6F8
	ldr r2, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #2
	ldr r1, [r2]
	mov r0, #6
	add r1, r1, #0x300
	strh r3, [r1, #0x88]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	add r1, r1, #0x388
	bl sub_02039C2C
_0238B6F8:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r2, [r0]
	ldr r0, [r2, #0x88]
	tst r0, #0x100
	beq _0238B744
	ldrsb r1, [r2, #7]
	mvn r0, #1
	cmp r1, r0
	bne _0238B744
	add r0, r2, #0x300
	ldrsh r1, [r0, #0x8c]
	add r0, sp, #0x19c
	bl sub_0205B028
	add r0, sp, #0x19c
	mov r1, #3
	bl sub_0203F150
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #7]
_0238B744:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x200
	beq _0238B7B0
	ldrsb r1, [r1, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238B7AC
	bl GetMoneyCarried
	mov r1, #0
	cmp r0, #0x1f4
	mov r2, r1
	bge _0238B794
	mov r0, #4
	bl sub_0204018C
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #8]
	b _0238B7B0
_0238B794:
	mov r0, #5
	bl sub_0204018C
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #8]
	b _0238B7B0
_0238B7AC:
	bl sub_02041178
_0238B7B0:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r2, [r0]
	ldr r0, [r2, #0x88]
	tst r0, #0x400
	beq _0238B820
	ldrsb r1, [r2, #7]
	mvn r0, #1
	cmp r1, r0
	bne _0238B820
	ldr r0, [r2, #0x3a0]
	cmp r0, #0
	bne _0238B800
	add r0, r2, #0xa6
	add r0, r0, #0x300
	mov r1, #1
	bl sub_02041860
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #9]
	b _0238B820
_0238B800:
	add r1, r2, #0x300
	ldrsh r2, [r1, #0xa4]
	mov r1, #4
	mov r3, #1
	bl sub_020417A8
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #9]
_0238B820:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x800
	beq _0238B984
	ldrsb r1, [r1, #0xa]
	mvn r0, #1
	cmp r1, r0
	bne _0238B984
	bl sub_02041094
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r6, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_020564B0
	cmp r0, #0
	beq _0238B87C
	bl sub_02040FA8
	cmp r0, #0
	ldrne r4, _0238BDE0 ; =LINK_SHOP_SUBMENU_ITEMS_6
	ldreq r4, _0238BDE4 ; =LINK_SHOP_SUBMENU_ITEMS_5
	b _0238B880
_0238B87C:
	ldr r4, _0238BDE8 ; =LINK_SHOP_SUBMENU_ITEMS_7
_0238B880:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #0
	ldr r0, [r0]
	mov r1, r2
	add r5, r0, #0x394
_0238B894:
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	strb r1, [r5, r2]
	mov r2, r0, asr #0x10
	cmp r2, #8
	blt _0238B894
	mov r0, r6
	bl sub_02041194
	cmp r0, #0
	moveq r0, #3
	streqb r0, [r5, #1]
	mov r0, r6
	bl sub_02041364
	cmp r0, #0
	moveq r0, #3
	streqb r0, [r5, #2]
	cmp r6, #0
	movle r0, #3
	strleb r0, [r5, #3]
	bl sub_0203FD38
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	mov r6, #0
	mov ip, r1, asr #0x10
	mov r2, r6
	mov r3, #1
	b _0238B934
_0238B900:
	ldrb r1, [r0, ip, lsl #3]
	tst r1, #1
	movne r1, r3
	moveq r1, r2
	tst r1, #0xff
	beq _0238B928
	ldrb r1, [r0, ip, lsl #3]
	tst r1, #2
	moveq r6, #1
	beq _0238B93C
_0238B928:
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	mov ip, r1, asr #0x10
_0238B934:
	cmp ip, #4
	blt _0238B900
_0238B93C:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	cmp r6, #0
	moveq r0, #3
	streqb r0, [r5, #4]
	ldr r5, [r1]
	mov r2, #8
	add r3, r5, #0x394
	str r3, [r5, #0x188]
	str r2, [sp]
	ldr r2, [r1]
	ldr r0, _0238BDEC ; =LINK_SHOP_WINDOW_PARAMS_5
	ldr r1, _0238BDF0 ; =0x80000213
	mov r3, r4
	add r2, r2, #0x128
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #0xa]
_0238B984:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r2, [r0]
	ldr r0, [r2, #0x88]
	tst r0, #0x1000
	beq _0238BA70
	ldrsb r1, [r2, #0xb]
	mvn r0, #1
	cmp r1, r0
	bne _0238BA70
	add r0, r2, #0x300
	ldr r1, _0238BDF4 ; =TEAM_MEMBER_TABLE_PTR
	ldrsh r2, [r0, #0x8c]
	ldr r1, [r1]
	mov r0, #0x44
	smlabb r1, r2, r0, r1
	add r0, sp, #8
	add r1, r1, #0x3a
	mov r2, #0xa
	bl StrncpySimpleNoPadSafe
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, _0238BDF8 ; =ov18_0238D5F8
	ldr r0, [r0]
	add r3, sp, #8
	add r0, r0, #0xae
	add r0, r0, #0x300
	mov r2, #0x46
	bl ov18_0238AAC0
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, _0238BDFC ; =0x00000A3E
	ldr r4, [r1]
	mov r2, #0x10
	ldrsh r0, [r4, #0x8c]
	str r0, [r4, #0x1c0]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r3, [r0, #0xc8]
	ldr r0, [r1]
	str r2, [r0, #0x1cc]
	ldr r2, [r1]
	add r0, r2, #0xae
	add r0, r0, #0x300
	str r0, [r2, #0x208]
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ABB0
	str r0, [sp]
	mov r1, #8
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	str r1, [sp, #4]
	ldr r1, [r0]
	ldr r0, _0238BE00 ; =LINK_SHOP_WINDOW_PARAMS_6
	add r2, r1, #0x1c0
	ldr r1, _0238BE04 ; =0x00401833
	ldr r3, _0238BE08 ; =ov18_0238AEF0
	bl CreateAdvancedMenu
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #0xb]
_0238BA70:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r1]
	ldr r0, [r3, #0x88]
	tst r0, #0x2000
	beq _0238BAC8
	ldrsb r2, [r3, #0xc]
	mvn r0, #1
	cmp r2, r0
	bne _0238BAC8
	mov r0, #1
	str r0, [r3, #0x258]
	mov r0, #3
	str r0, [sp]
	ldr r1, [r1]
	ldr r0, _0238BE0C ; =LINK_SHOP_WINDOW_PARAMS_4
	ldr r3, _0238BE10 ; =LINK_SHOP_SUBMENU_ITEMS_1
	add r2, r1, #0x258
	mov r1, #0x33
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #0xc]
_0238BAC8:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x4000
	beq _0238BB10
	ldrsb r1, [r1, #0xd]
	mvn r0, #1
	cmp r1, r0
	bne _0238BB0C
	mov r1, #0
	mov r2, r1
	mov r0, #6
	bl sub_0204018C
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #0xd]
	b _0238BB10
_0238BB0C:
	bl sub_02041178
_0238BB10:
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r1]
	ldr r0, [r3, #0x88]
	tst r0, #0x8000
	beq _0238BBAC
	ldrsb r2, [r3, #0xe]
	mvn r0, #1
	cmp r2, r0
	bne _0238BBAC
	mov r2, #0
	strb r2, [r3, #0x39c]
	ldr r0, [r1]
	strb r2, [r0, #0x39d]
	ldr r0, [r1]
	strb r2, [r0, #0x39e]
	bl sub_02041094
	cmp r0, #4
	ldrge r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	movge r1, #3
	ldrge r0, [r0]
	mov r3, #1
	strgeb r1, [r0, #0x39c]
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, #3
	ldr r2, [r1]
	add r0, r2, #0x39c
	str r0, [r2, #0x350]
	ldr r2, [r1]
	ldr r0, _0238BE14 ; =LINK_SHOP_WINDOW_PARAMS_3
	str r3, [r2, #0x2f0]
	str r4, [sp]
	ldr r2, [r1]
	ldr r3, _0238BE18 ; =LINK_SHOP_SUBMENU_ITEMS_2
	add r1, r4, #0x230
	add r2, r2, #0x2f0
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	strb r0, [r1, #0xe]
_0238BBAC:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10000
	beq _0238BC74
	ldrsb r1, [r1, #0xf]
	mvn r0, #1
	cmp r1, r0
	bne _0238BBF0
	ldr r0, _0238BE1C ; =LINK_SHOP_WINDOW_PARAMS_10
	bl CreateDialogueBox
	ldr r1, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r2, #0
	ldr r3, [r1]
	strb r0, [r3, #0xf]
	ldr r0, [r1]
	str r2, [r0, #0x84]
_0238BBF0:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xf]
	bl ShowDialogueBox
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, [r0]
	ldr r0, [r3, #0x78]
	cmp r0, #0x12
	bgt _0238BC2C
	cmp r0, #0x10
	blt _0238BC48
	cmpne r0, #0x11
	cmpne r0, #0x12
	beq _0238BC34
	b _0238BC48
_0238BC2C:
	cmp r0, #0x3c
	b _0238BC48
_0238BC34:
	mov r0, #0x1fc
	str r0, [sp, #0x198]
	ldr r2, _0238BE20 ; =0x000003FA
	ldr r1, _0238BE24 ; =0x00003408
	b _0238BC50
_0238BC48:
#ifdef JAPAN
	ldr r2, _0238D390 ; =0x00003D26
	ldr r1, _0238BD74 ; =0x00000408
#else
	mov r2, #0x400
	add r1, r2, #8
#endif
_0238BC50:
	ldr r0, [r3, #0x84]
	cmp r0, r2
	beq _0238BC74
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	str r2, [r3, #0x84]
	ldr r0, [r0]
	add r3, sp, #0x14c
	ldrsb r0, [r0, #0xf]
	bl ShowStringIdInDialogueBox
_0238BC74:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x7c]
	b _0238BCF8
_0238BC88:
	ldr r0, [r4, #0x88]
	tst r0, #1
	beq _0238BCA8
	ldrsb r0, [r4]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238BCD4
_0238BCA8:
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r0]
	ldr r0, [r1, #0x88]
	tst r0, #0x10000
	beq _0238BCD0
	ldrsb r0, [r1, #0xf]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238BCD4
_0238BCD0:
	mov r0, #1
_0238BCD4:
	cmp r0, #0
	beq _0238BCF8
	ldr r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x7c]
	ldr r1, [r0]
	ldr r0, [r1, #0x80]
	str r0, [r1, #0x78]
_0238BCF8:
	mov r0, #1
	b _0238BD38
_0238BD00:
	bl ov18_0238A42C
	cmp r0, #0
	ldrne r0, _0238BD40 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x74]
	b _0238BD34
_0238BD1C:
	mov r0, #3
	str r0, [r4, #0x74]
	bl ov11_022E6E68
	bl ov18_0238AFD4
	mov r0, #4
	b _0238BD38
_0238BD34:
	mov r0, #1
_0238BD38:
	add sp, sp, #0x214
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
#ifdef JAPAN
#define OV18_0238B01C_OFFSET 0x3926
#else
#define OV18_0238B01C_OFFSET 0
#endif
_0238BD40: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238BD44: .word OVERLAY18_FUNCTION_POINTER_TABLE
_0238BD48: .word 0x00003008
_0238BD4C: .word LINK_SHOP_WINDOW_PARAMS_11
_0238BD50: .word 0x000003FB + OV18_0238B01C_OFFSET
_0238BD54: .word 0x000003F9 + OV18_0238B01C_OFFSET
#ifdef JAPAN
_0238D2B4: .word 0x00003D36
#endif
_0238BD58: .word 0x00003018
_0238BD5C: .word 0x0000040B + OV18_0238B01C_OFFSET
_0238BD60: .word 0x0000040C + OV18_0238B01C_OFFSET
_0238BD64: .word 0x0000040D + OV18_0238B01C_OFFSET
_0238BD68: .word 0x0000040E + OV18_0238B01C_OFFSET
_0238BD6C: .word 0x0000040F + OV18_0238B01C_OFFSET
#if defined(EUROPE)
_0238BD70: .word 0x00003FCE
_0238BD74: .word 0x00000408
_0238BD78: .word 0x00003FCF
#elif defined(JAPAN)
_0238BD70: .word 0x000049CF
_0238BD74: .word 0x00000408
_0238BD78: .word 0x000049D0
#else
_0238BD70: .word 0x00003FCC
_0238BD74: .word 0x00000408
_0238BD78: .word 0x00003FCD
#endif
_0238BD7C: .word 0x00000405 + OV18_0238B01C_OFFSET
_0238BD80: .word 0x00000406 + OV18_0238B01C_OFFSET
_0238BD84: .word 0x00000407 + OV18_0238B01C_OFFSET
_0238BD88: .word 0x00000409 + OV18_0238B01C_OFFSET
#ifdef JAPAN
_0238D2EC: .word 0x00003D2E
_0238BD8C: .word 0x00003D30
_0238D2F4: .word 0x00003D22
#else
_0238BD8C: .word 0x0000040A + OV18_0238B01C_OFFSET
#endif
_0238BD90: .word 0x000003FD + OV18_0238B01C_OFFSET
_0238BD94: .word 0x000003FE + OV18_0238B01C_OFFSET
_0238BD98: .word 0x0000131B
_0238BD9C: .word 0x000003FF + OV18_0238B01C_OFFSET
_0238BDA0: .word 0x00000401 + OV18_0238B01C_OFFSET
_0238BDA4: .word 0x00000403 + OV18_0238B01C_OFFSET
_0238BDA8: .word 0x00000402 + OV18_0238B01C_OFFSET
_0238BDAC: .word 0x00000404 + OV18_0238B01C_OFFSET
_0238BDB0: .word LINK_SHOP_WINDOW_PARAMS_1
_0238BDB4: .word ov18_0238AF3C
_0238BDB8: .word LINK_SHOP_WINDOW_PARAMS_9
_0238BDBC: .word 0x00300013
_0238BDC0: .word LINK_SHOP_MAIN_MENU_ITEMS
_0238BDC4: .word LINK_SHOP_WINDOW_PARAMS_7
_0238BDC8: .word LINK_SHOP_SUBMENU_ITEMS_3
_0238BDCC: .word LINK_SHOP_WINDOW_PARAMS_2
_0238BDD0: .word 0x00300033
_0238BDD4: .word LINK_SHOP_MENU_ITEMS_CONFIRM
_0238BDD8: .word LINK_SHOP_WINDOW_PARAMS_8
_0238BDDC: .word LINK_SHOP_SUBMENU_ITEMS_4
_0238BDE0: .word LINK_SHOP_SUBMENU_ITEMS_6
_0238BDE4: .word LINK_SHOP_SUBMENU_ITEMS_5
_0238BDE8: .word LINK_SHOP_SUBMENU_ITEMS_7
_0238BDEC: .word LINK_SHOP_WINDOW_PARAMS_5
_0238BDF0: .word 0x80000213
_0238BDF4: .word TEAM_MEMBER_TABLE_PTR
_0238BDF8: .word ov18_0238D5F8
#ifdef JAPAN
_0238BDFC: .word 0x00000879
#else
_0238BDFC: .word 0x00000A3E
#endif
_0238BE00: .word LINK_SHOP_WINDOW_PARAMS_6
_0238BE04: .word 0x00401833
_0238BE08: .word ov18_0238AEF0
_0238BE0C: .word LINK_SHOP_WINDOW_PARAMS_4
_0238BE10: .word LINK_SHOP_SUBMENU_ITEMS_1
_0238BE14: .word LINK_SHOP_WINDOW_PARAMS_3
_0238BE18: .word LINK_SHOP_SUBMENU_ITEMS_2
_0238BE1C: .word LINK_SHOP_WINDOW_PARAMS_10
_0238BE20: .word 0x000003FA + OV18_0238B01C_OFFSET
_0238BE24: .word 0x00003408
#ifdef JAPAN
_0238D390: .word 0x00003D26
#endif
	arm_func_end ov18_0238B01C

	arm_func_start ov18_0238BE28
ov18_0238BE28: ; 0x0238BE28
	ldr r1, _0238BE44 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r1]
	str r3, [r2, #0x7c]
	ldr r1, [r1]
	str r0, [r1, #0x80]
	bx lr
	.align 2, 0
_0238BE44: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BE28

	arm_func_start ov18_0238BE48
ov18_0238BE48: ; 0x0238BE48
	ldr r0, _0238BE68 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238BE68: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BE48

	arm_func_start ov18_0238BE6C
ov18_0238BE6C: ; 0x0238BE6C
	ldr r0, _0238BE8C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0xf
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238BE8C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BE6C

	arm_func_start ov18_0238BE90
ov18_0238BE90: ; 0x0238BE90
	stmdb sp!, {r3, lr}
	ldr r0, _0238BF08 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238BF08 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl GetSimpleMenuResult
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238BEFC
_0238BEC8: ; jump table
	b _0238BEFC ; case 0
	b _0238BEFC ; case 1
	b _0238BEFC ; case 2
	b _0238BEE4 ; case 3
	b _0238BEF0 ; case 4
	b _0238BEFC ; case 5
	b _0238BEFC ; case 6
_0238BEE4:
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238BEF0:
	mov r0, #5
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238BEFC:
	mov r0, #3
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238BF08: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BE90

	arm_func_start ov18_0238BF0C
ov18_0238BF0C: ; 0x0238BF0C
	ldr r0, _0238BF2C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #4
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238BF2C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BF0C

	arm_func_start ov18_0238BF30
ov18_0238BF30: ; 0x0238BF30
	stmdb sp!, {r3, lr}
	ldr r0, _0238BF5C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x88]
	bl ov18_0238A2A0
	ldr r0, _0238BF5C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x74]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238BF5C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BF30

	arm_func_start ov18_0238BF60
ov18_0238BF60: ; 0x0238BF60
	ldr r0, _0238BF80 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238BF80: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BF60

	arm_func_start ov18_0238BF84
ov18_0238BF84: ; 0x0238BF84
	ldr r0, _0238BFA4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x23
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238BFA4: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BF84

	arm_func_start ov18_0238BFA8
ov18_0238BFA8: ; 0x0238BFA8
	stmdb sp!, {r3, lr}
	ldr r0, _0238C038 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238C038 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl GetSimpleMenuResult
	cmp r0, #8
	bgt _0238BFFC
	cmp r0, #2
	blt _0238C02C
	beq _0238C02C
	cmp r0, #7
	beq _0238C008
	cmp r0, #8
	beq _0238C014
	b _0238C02C
_0238BFFC:
	cmp r0, #0xd
	beq _0238C020
	b _0238C02C
_0238C008:
	mov r0, #8
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C014:
	mov r0, #0xa
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C020:
	mov r0, #0xe
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C02C:
	mov r0, #0
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C038: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238BFA8

	arm_func_start ov18_0238C03C
ov18_0238C03C: ; 0x0238C03C
	ldr r0, _0238C05C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #9
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C05C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C03C

	arm_func_start ov18_0238C060
ov18_0238C060: ; 0x0238C060
	ldr r0, _0238C074 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C074: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C060

	arm_func_start ov18_0238C078
ov18_0238C078: ; 0x0238C078
	ldr r0, _0238C098 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0xc
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C098: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C078

	arm_func_start ov18_0238C09C
ov18_0238C09C: ; 0x0238C09C
	ldr r0, _0238C0BC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0xd
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C0BC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C09C

	arm_func_start ov18_0238C0C0
ov18_0238C0C0: ; 0x0238C0C0
	ldr r0, _0238C0D4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C0D4: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C0C0

	arm_func_start ov18_0238C0D8
ov18_0238C0D8: ; 0x0238C0D8
	ldr r0, _0238C0F8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0xf
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C0F8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C0D8

	arm_func_start ov18_0238C0FC
ov18_0238C0FC: ; 0x0238C0FC
	ldr r0, _0238C110 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C110: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C0FC

	arm_func_start ov18_0238C114
ov18_0238C114: ; 0x0238C114
	ldr r0, _0238C134 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, _0238C138 ; =0x00010002
	ldr r2, [r0]
	mov r1, #0x11
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C134: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238C138: .word 0x00010002
	arm_func_end ov18_0238C114

	arm_func_start ov18_0238C13C
ov18_0238C13C: ; 0x0238C13C
	ldr r0, _0238C15C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, _0238C160 ; =0x00010080
	ldr r2, [r0]
	mov r1, #0x12
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C15C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238C160: .word 0x00010080
	arm_func_end ov18_0238C13C

	arm_func_start ov18_0238C164
ov18_0238C164: ; 0x0238C164
	stmdb sp!, {r3, lr}
	bl sub_0203A5A8
	cmp r0, #0
	beq _0238C1CC
	bl sub_0203A9EC
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #8
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl PlaySeVolumeWrapper
	bl sub_0203AAB0
	ldr r1, _0238C218 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x8c]
	bl sub_0203A5F0
	ldr r0, _0238C218 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x17
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r3, pc}
_0238C1CC:
	bl sub_0203AA20
	mvn r1, #0
	cmp r0, r1
	bne _0238C1EC
	bl sub_0203A51C
	mov r0, #0
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C1EC:
	ldr r2, _0238C218 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x8c]
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FA64
	mov r0, #0x15
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C218: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C164

	arm_func_start ov18_0238C21C
ov18_0238C21C: ; 0x0238C21C
	ldr r0, _0238C23C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x14
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C23C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C21C

	arm_func_start ov18_0238C240
ov18_0238C240: ; 0x0238C240
	ldr r0, _0238C254 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C254: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C240

	arm_func_start ov18_0238C258
ov18_0238C258: ; 0x0238C258
	ldr r0, _0238C278 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x90
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C278: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C258

	arm_func_start ov18_0238C27C
ov18_0238C27C: ; 0x0238C27C
	stmdb sp!, {r3, lr}
	ldr r0, _0238C33C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238C33C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl GetSimpleMenuResult
	sub r0, r0, #5
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0238C2F4
_0238C2B8: ; jump table
	b _0238C32C ; case 0
	b _0238C32C ; case 1
	b _0238C2F4 ; case 2
	b _0238C2F4 ; case 3
	b _0238C2F4 ; case 4
	b _0238C2F4 ; case 5
	b _0238C2F4 ; case 6
	b _0238C2F4 ; case 7
	b _0238C320 ; case 8
	b _0238C2F4 ; case 9
	b _0238C2E8 ; case 10
	b _0238C300 ; case 11
_0238C2E8:
	mov r0, #0x17
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C2F4:
	mov r0, #0x19
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C300:
	ldr r0, _0238C33C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x1b
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r3, pc}
_0238C320:
	mov r0, #0x2e
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238C32C:
	bl sub_0203A638
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C33C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C27C

	arm_func_start ov18_0238C340
ov18_0238C340: ; 0x0238C340
	ldr r0, _0238C360 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x100
	ldr r2, [r0]
	mov r1, #0x18
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C360: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C340

	arm_func_start ov18_0238C364
ov18_0238C364: ; 0x0238C364
	stmdb sp!, {r3, lr}
	bl sub_0203F398
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	bl sub_0203F990
	ldr r0, _0238C394 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x11
	strb r2, [r1, #7]
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C394: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C364

	arm_func_start ov18_0238C398
ov18_0238C398: ; 0x0238C398
	ldr r0, _0238C3B8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r3, _0238C3BC ; =0x00000201
	ldr r2, [r0]
	mov r1, #0x1a
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C3B8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238C3BC: .word 0x00000201
	arm_func_end ov18_0238C398

	arm_func_start ov18_0238C3C0
ov18_0238C3C0: ; 0x0238C3C0
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238C3E4
	ldr r0, _0238C424 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
_0238C3E4:
	cmp r4, #1
	beq _0238C40C
	cmp r4, #2
	beq _0238C400
	cmp r4, #7
	beq _0238C418
	ldmia sp!, {r4, pc}
_0238C400:
	mov r0, #0x1f
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C40C:
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C418:
	mov r0, #0x1d
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C424: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C3C0

	arm_func_start ov18_0238C428
ov18_0238C428: ; 0x0238C428
	stmdb sp!, {r3, lr}
	ldr r1, _0238C474 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, _0238C478 ; =TEAM_MEMBER_TABLE_PTR
	ldr r2, [r1]
	ldr r1, [r0]
	add r0, r2, #0x300
	ldrsh r2, [r0, #0x8c]
	mov r0, #0x44
	mov r3, #0
	smlabb r1, r2, r0, r1
	ldrsh r0, [r1, #4]
	ldrsh r2, [r1, #8]
	add r1, r1, #0x14
	bl PrintIqSkillsMenu
	ldr r0, _0238C474 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C474: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238C478: .word TEAM_MEMBER_TABLE_PTR
	arm_func_end ov18_0238C428

	arm_func_start ov18_0238C47C
ov18_0238C47C: ; 0x0238C47C
	stmdb sp!, {r3, lr}
	bl sub_02041B7C
	cmp r0, #1
	ldmneia sp!, {r3, pc}
	bl sub_020420F4
	bl sub_020572EC
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238C47C

	arm_func_start ov18_0238C4A0
ov18_0238C4A0: ; 0x0238C4A0
	stmdb sp!, {r3, lr}
	bl sub_0203FD38
	ldr r1, _0238C4E4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	str r0, [r1, #0x3a0]
	bl sub_02041094
	ldr r2, _0238C4E4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov ip, #0x400
	ldr r1, [r2]
	mov r3, #0x1e
	add r1, r1, #0x300
	strh r0, [r1, #0xa4]
	ldr r0, [r2]
	str ip, [r0, #0x88]
	ldr r0, [r2]
	str r3, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C4E4: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C4A0

	arm_func_start ov18_0238C4E8
ov18_0238C4E8: ; 0x0238C4E8
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x19
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238C4E8

	arm_func_start ov18_0238C504
ov18_0238C504: ; 0x0238C504
	ldr r0, _0238C524 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0xa00
	ldr r2, [r0]
	mov r1, #0x20
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C524: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C504

	arm_func_start ov18_0238C528
ov18_0238C528: ; 0x0238C528
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0238C714 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, r4, r5, pc}
	bl sub_02041094
	ldr r1, _0238C714 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r5, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult
	sub r1, r0, #4
	cmp r1, #0xe
	addls pc, pc, r1, lsl #2
	b _0238C6D0
_0238C570: ; jump table
	b _0238C6BC ; case 0
	b _0238C6D0 ; case 1
	b _0238C6D0 ; case 2
	b _0238C5AC ; case 3
	b _0238C5C8 ; case 4
	b _0238C638 ; case 5
	b _0238C6A8 ; case 6
	b _0238C5AC ; case 7
	b _0238C5AC ; case 8
	b _0238C6D0 ; case 9
	b _0238C6D0 ; case 10
	b _0238C6D0 ; case 11
	b _0238C6D0 ; case 12
	b _0238C670 ; case 13
	b _0238C68C ; case 14
_0238C5AC:
	ldr r0, _0238C718 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	mov r0, r5
	mov r4, #1
	bl sub_02041000
	b _0238C6E4
_0238C5C8:
	mov r4, #1
	bl GetMoneyCarried
	cmp r0, #0x1f4
	bge _0238C5EC
	mov r0, #0
	bl PlaySeVolumeWrapper
	mov r0, #0x13
	bl ov18_0238BE28
	ldmia sp!, {r3, r4, r5, pc}
_0238C5EC:
	mov r0, r5
	bl sub_02041194
	cmp r0, #0
	beq _0238C62C
	bl sub_02041414
	cmp r0, #0
	bne _0238C614
	ldr r0, _0238C71C ; =0x00001308
	bl sub_02017C80
	b _0238C620
_0238C614:
	ldr r0, _0238C718 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
_0238C620:
	mov r0, r5
	bl sub_020412B0
	b _0238C6E4
_0238C62C:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _0238C6E4
_0238C638:
	mov r0, r5
	mov r4, #1
	bl sub_02041364
	cmp r0, #0
	beq _0238C664
	ldr r0, _0238C718 ; =0x00003F07
	mov r1, #0x100
	bl sub_02017C74
	mov r0, r5
	bl sub_02041394
	b _0238C6E4
_0238C664:
	mov r0, #2
	bl PlaySeVolumeWrapper
	b _0238C6E4
_0238C670:
	mov r0, r4
	bl PlaySeVolumeWrapper
	mov r0, r5
	bl sub_020416BC
	bl sub_020410A4
	mov r4, #1
	b _0238C6E4
_0238C68C:
	mov r0, r4
	bl PlaySeVolumeWrapper
	mov r0, r5
	bl sub_020416DC
	bl sub_020410A4
	mov r4, #1
	b _0238C6E4
_0238C6A8:
	ldr r0, _0238C718 ; =0x00003F07
	bl sub_02017C80
	mov r0, #0x21
	bl ov18_0238BE28
	b _0238C6E4
_0238C6BC:
	mov r0, r4
	bl PlaySeVolumeWrapper
	mov r0, #0x1d
	bl ov18_0238BE28
	b _0238C6E4
_0238C6D0:
	cmp r0, #6
	beq _0238C6E0
	mov r0, #1
	bl PlaySeVolumeWrapper
_0238C6E0:
	mov r4, #1
_0238C6E4:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _0238C714 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0238C708
	bl sub_020307EC
_0238C708:
	mov r0, #0x19
	bl ov18_0238BE28
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0238C714: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
_0238C718: .word 0x00003F07
_0238C71C: .word 0x00001308
	arm_func_end ov18_0238C528

	arm_func_start ov18_0238C720
ov18_0238C720: ; 0x0238C720
	stmdb sp!, {r4, lr}
	bl sub_02041094
	mov r4, r0
	bl sub_02041154
	ldr r1, _0238C788 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	cmp r4, #0
	ldr r1, [r1]
	str r0, [r1, #0x24]
	bne _0238C760
	mov r0, r4
	bl sub_02041424
	cmp r0, #0
	bne _0238C760
	mov r0, #0x22
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C760:
	mov r0, r4
	bl sub_02041364
	cmp r0, #0
	beq _0238C77C
	mov r0, #0x24
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C77C:
	mov r0, #0x27
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C788: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C720

	arm_func_start ov18_0238C78C
ov18_0238C78C: ; 0x0238C78C
	ldr r0, _0238C7AC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x23
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C7AC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C78C

	arm_func_start ov18_0238C7B0
ov18_0238C7B0: ; 0x0238C7B0
	ldr ip, _0238C7BC ; =ov18_0238BE28
	mov r0, #0x19
	bx ip
	.align 2, 0
_0238C7BC: .word ov18_0238BE28
	arm_func_end ov18_0238C7B0

	arm_func_start ov18_0238C7C0
ov18_0238C7C0: ; 0x0238C7C0
	ldr r0, _0238C7E0 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C7E0: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C7C0

	arm_func_start ov18_0238C7E4
ov18_0238C7E4: ; 0x0238C7E4
	ldr r0, _0238C804 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x26
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C804: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C7E4

	arm_func_start ov18_0238C808
ov18_0238C808: ; 0x0238C808
	stmdb sp!, {r4, lr}
	ldr r0, _0238C884 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238C884 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult
	cmp r0, #0
	beq _0238C850
	cmp r0, #1
	beq _0238C878
	ldmia sp!, {r4, pc}
_0238C850:
	mov r0, r4
	bl sub_02041484
	ldr r0, _0238C884 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	mov r0, #0x2a
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C878:
	mov r0, #0x19
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C884: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C808

	arm_func_start ov18_0238C888
ov18_0238C888: ; 0x0238C888
	ldr r0, _0238C8A8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x28
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C8A8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C888

	arm_func_start ov18_0238C8AC
ov18_0238C8AC: ; 0x0238C8AC
	ldr r0, _0238C8CC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C8CC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C8AC

	arm_func_start ov18_0238C8D0
ov18_0238C8D0: ; 0x0238C8D0
	stmdb sp!, {r4, lr}
	ldr r0, _0238C94C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238C94C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult
	cmp r0, #0
	beq _0238C918
	cmp r0, #1
	beq _0238C940
	ldmia sp!, {r4, pc}
_0238C918:
	mov r0, r4
	bl sub_02041484
	ldr r0, _0238C94C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	mov r0, #0x2c
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238C940:
	mov r0, #0x19
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238C94C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C8D0

	arm_func_start ov18_0238C950
ov18_0238C950: ; 0x0238C950
	ldr r0, _0238C970 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x2b
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C970: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C950

	arm_func_start ov18_0238C974
ov18_0238C974: ; 0x0238C974
	ldr ip, _0238C980 ; =ov18_0238BE28
	mov r0, #0x19
	bx ip
	.align 2, 0
_0238C980: .word ov18_0238BE28
	arm_func_end ov18_0238C974

	arm_func_start ov18_0238C984
ov18_0238C984: ; 0x0238C984
	ldr r0, _0238C9A4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x2d
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C9A4: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C984

	arm_func_start ov18_0238C9A8
ov18_0238C9A8: ; 0x0238C9A8
	ldr ip, _0238C9B4 ; =ov18_0238BE28
	mov r0, #0x19
	bx ip
	.align 2, 0
_0238C9B4: .word ov18_0238BE28
	arm_func_end ov18_0238C9A8

	arm_func_start ov18_0238C9B8
ov18_0238C9B8: ; 0x0238C9B8
	stmdb sp!, {r3, lr}
	bl sub_0204159C
	cmp r0, #0
	ldreq r0, _0238CA14 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	moveq r1, #0x2f
	ldreq r0, [r0]
	streq r1, [r0, #0x80]
	ldmeqia sp!, {r3, pc}
	ldr r0, _0238CA14 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ABB0
	cmp r0, #0
	ldrle r0, _0238CA14 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	movle r1, #0x31
	ldrle r0, [r0]
	strle r1, [r0, #0x80]
	ldrgt r0, _0238CA14 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	movgt r1, #0x33
	ldrgt r0, [r0]
	strgt r1, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CA14: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238C9B8

	arm_func_start ov18_0238CA18
ov18_0238CA18: ; 0x0238CA18
	ldr r0, _0238CA38 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x30
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CA38: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CA18

	arm_func_start ov18_0238CA3C
ov18_0238CA3C: ; 0x0238CA3C
	ldr ip, _0238CA48 ; =ov18_0238BE28
	mov r0, #0x11
	bx ip
	.align 2, 0
_0238CA48: .word ov18_0238BE28
	arm_func_end ov18_0238CA3C

	arm_func_start ov18_0238CA4C
ov18_0238CA4C: ; 0x0238CA4C
	ldr r0, _0238CA6C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x32
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CA6C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CA4C

	arm_func_start ov18_0238CA70
ov18_0238CA70: ; 0x0238CA70
	ldr ip, _0238CA7C ; =ov18_0238BE28
	mov r0, #0x11
	bx ip
	.align 2, 0
_0238CA7C: .word ov18_0238BE28
	arm_func_end ov18_0238CA70

	arm_func_start ov18_0238CA80
ov18_0238CA80: ; 0x0238CA80
	ldr r0, _0238CAAC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #3
	ldr r1, [r0]
	mov r3, #0
	str r2, [r1, #0x88]
	ldr r2, [r0]
	mov r1, #0x34
	strh r3, [r2, #0x8c]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CAAC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CA80

	arm_func_start ov18_0238CAB0
ov18_0238CAB0: ; 0x0238CAB0
	ldr r0, _0238CAD0 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x1000
	ldr r2, [r0]
	mov r1, #0x35
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CAD0: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CAB0

	arm_func_start ov18_0238CAD4
ov18_0238CAD4: ; 0x0238CAD4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, _0238CBD8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuCurrentOption
	ldr r1, _0238CBD8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r2, [r1]
	strh r0, [r2, #0x8c]
	ldrh r0, [sp]
	tst r0, #8
	beq _0238CB8C
	ldr r1, [r1]
	ldrsb r0, [r1, #0xb]
	ldrsh r4, [r1, #0x8c]
	bl sub_0202C1E4
	ldr r0, _0238CBD8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r2, _0238CBD8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov lr, #0
	ldr r1, [r2]
	mov ip, #1
	str lr, [r1, #0x3a0]
	ldr r1, [r2]
	mov r3, #0x38
	add r1, r1, #0x300
	strh r0, [r1, #0xaa]
	ldr r0, [r2]
	strb ip, [r0, #0x3a6]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh lr, [r0, #0xa8]
	ldr r0, [r2]
	strb ip, [r0, #0x3ac]
	ldr r0, [r2]
	strb lr, [r0, #0x3ad]
	ldr r0, [r2]
	str r3, [r0, #0x80]
	b _0238CBD0
_0238CB8C:
	ldr r0, [r1]
	ldrsb r0, [r0, #0xb]
	bl IsAdvancedMenuActive2
	cmp r0, #0
	bne _0238CBD0
	ldr r0, _0238CBD8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuResult
	mvn r1, #0
	cmp r0, r1
	bne _0238CBC8
	mov r0, #0x11
	bl ov18_0238BE28
	b _0238CBD0
_0238CBC8:
	mov r0, #0x36
	bl ov18_0238BE28
_0238CBD0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_0238CBD8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CAD4

	arm_func_start ov18_0238CBDC
ov18_0238CBDC: ; 0x0238CBDC
	ldr r0, _0238CBFC ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x3000
	ldr r2, [r0]
	mov r1, #0x37
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CBFC: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CBDC

	arm_func_start ov18_0238CC00
ov18_0238CC00: ; 0x0238CC00
	stmdb sp!, {r4, lr}
	ldr r0, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetAdvancedMenuResult
	ldr r1, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xc]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	ldr r0, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xc]
	bl GetSimpleMenuResult
	sub r0, r0, #4
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0238CD5C
_0238CC50: ; jump table
	b _0238CCF0 ; case 0
	b _0238CD5C ; case 1
	b _0238CD5C ; case 2
	b _0238CD5C ; case 3
	b _0238CD5C ; case 4
	b _0238CD5C ; case 5
	b _0238CD5C ; case 6
	b _0238CD5C ; case 7
	b _0238CD5C ; case 8
	b _0238CC78 ; case 9
_0238CC78:
	ldr r1, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r0, r4, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r1, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	str r4, [r0, #0x24]
	bl sub_020415BC
	cmp r0, #0
	mov r0, r4
	beq _0238CCCC
	bl sub_0203FD14
	ldr r0, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x3c
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238CCCC:
	bl sub_02041614
	ldr r0, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	mov r0, #0x3a
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CCF0:
	ldr r1, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r0, r4, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x8c]
	bl ov18_0238ADA8
	ldr r2, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, #0
	ldr r1, [r2]
	mov r3, #1
	str r4, [r1, #0x3a0]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0xaa]
	ldr r1, [r2]
	mov r0, #0x38
	strb r3, [r1, #0x3a6]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r4, [r1, #0xa8]
	ldr r1, [r2]
	strb r3, [r1, #0x3ac]
	ldr r1, [r2]
	strb r4, [r1, #0x3ad]
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CD5C:
	ldr r0, _0238CD84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	cmp r0, r1
	beq _0238CD78
	bl ResumeAdvancedMenu
_0238CD78:
	mov r0, #0x34
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238CD84: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CC00

	arm_func_start ov18_0238CD88
ov18_0238CD88: ; 0x0238CD88
	ldr r0, _0238CDA8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x400
	ldr r2, [r0]
	mov r1, #0x39
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CDA8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CD88

	arm_func_start ov18_0238CDAC
ov18_0238CDAC: ; 0x0238CDAC
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x34
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238CDAC

	arm_func_start ov18_0238CDC8
ov18_0238CDC8: ; 0x0238CDC8
	ldr r0, _0238CDE8 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x3b
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CDE8: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CDC8

	arm_func_start ov18_0238CDEC
ov18_0238CDEC: ; 0x0238CDEC
	ldr ip, _0238CDF8 ; =ov18_0238BE28
	mov r0, #0x11
	bx ip
	.align 2, 0
_0238CDF8: .word ov18_0238BE28
	arm_func_end ov18_0238CDEC

	arm_func_start ov18_0238CDFC
ov18_0238CDFC: ; 0x0238CDFC
	ldr r0, _0238CE1C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x14000
	ldr r2, [r0]
	mov r1, #0x3d
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238CE1C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CDFC

	arm_func_start ov18_0238CE20
ov18_0238CE20: ; 0x0238CE20
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238CE44
	ldr r0, _0238CE84 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
_0238CE44:
	cmp r4, #1
	beq _0238CE6C
	cmp r4, #2
	beq _0238CE60
	cmp r4, #7
	beq _0238CE78
	ldmia sp!, {r4, pc}
_0238CE60:
	mov r0, #0x3e
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CE6C:
	mov r0, #0x11
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
_0238CE78:
	mov r0, #0x40
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238CE84: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CE20

	arm_func_start ov18_0238CE88
ov18_0238CE88: ; 0x0238CE88
	stmdb sp!, {r3, lr}
	ldr r0, _0238CED4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0xc000
	ldr r0, [r0]
	str r1, [r0, #0x88]
	bl sub_02041094
	bl sub_02041154
	ldr r1, _0238CED4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	str r0, [r1, #0x24]
	mov r0, #4
	bl sub_02041154
	ldr r1, _0238CED4 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #0x3f
	ldr r3, [r1]
	str r0, [r3, #0x28]
	ldr r0, [r1]
	str r2, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CED4: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CE88

	arm_func_start ov18_0238CED8
ov18_0238CED8: ; 0x0238CED8
	stmdb sp!, {r3, lr}
	bl sub_02041094
	ldr r0, _0238CF94 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xe]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	bl sub_0203FD38
	ldr r0, _0238CF94 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #0xe]
	bl GetSimpleMenuResult
	sub r0, r0, #4
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0238CF6C
_0238CF1C: ; jump table
	b _0238CF60 ; case 0
	b _0238CF6C ; case 1
	b _0238CF6C ; case 2
	b _0238CF6C ; case 3
	b _0238CF6C ; case 4
	b _0238CF6C ; case 5
	b _0238CF38 ; case 6
_0238CF38:
	bl sub_02041094
	bl sub_02041364
	cmp r0, #0
	beq _0238CF54
	mov r0, #0x42
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF54:
	mov r0, #0x45
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF60:
	mov r0, #0x40
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
_0238CF6C:
	ldr r0, _0238CF94 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	cmp r0, r1
	beq _0238CF88
	bl ResumeAdvancedMenu
_0238CF88:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238CF94: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CED8

	arm_func_start ov18_0238CF98
ov18_0238CF98: ; 0x0238CF98
	stmdb sp!, {r4, lr}
	bl sub_0203FD38
	mov r4, r0
	bl sub_02041094
	cmp r0, #4
	blt _0238CFF0
	bl sub_0203FD2C
	ldr r2, _0238D030 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, r0
	ldr r0, [r2]
	mov r2, #8
	add r0, r0, #0xa6
	add r0, r0, #0x300
	bl memcpy
	ldr r0, _0238D030 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x3a0]
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r2, [r0, #0xa4]
	b _0238D010
_0238CFF0:
	ldr r0, _0238D030 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	str r4, [r0, #0x3a0]
	bl sub_02041094
	ldr r1, _0238D030 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xa4]
_0238D010:
	ldr r0, _0238D030 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x400
	ldr r2, [r0]
	mov r1, #0x41
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D030: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238CF98

	arm_func_start ov18_0238D034
ov18_0238D034: ; 0x0238D034
	stmdb sp!, {r3, lr}
	bl sub_02041A18
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	arm_func_end ov18_0238D034

	arm_func_start ov18_0238D050
ov18_0238D050: ; 0x0238D050
	ldr r0, _0238D070 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x43
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D070: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D050

	arm_func_start ov18_0238D074
ov18_0238D074: ; 0x0238D074
	ldr r0, _0238D094 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x44
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D094: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D074

	arm_func_start ov18_0238D098
ov18_0238D098: ; 0x0238D098
	stmdb sp!, {r4, lr}
	ldr r0, _0238D128 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238D128 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult
	cmp r0, #0
	beq _0238D0E0
	cmp r0, #1
	beq _0238D11C
	ldmia sp!, {r4, pc}
_0238D0E0:
	mov r0, r4
	bl sub_02041484
	bl sub_0203FD2C
	ldrh r0, [r0, #4]
	bl sub_02041614
	ldr r0, _0238D128 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	ldr r0, _0238D128 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x48
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238D11C:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D128: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D098

	arm_func_start ov18_0238D12C
ov18_0238D12C: ; 0x0238D12C
	ldr r0, _0238D14C ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x46
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D14C: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D12C

	arm_func_start ov18_0238D150
ov18_0238D150: ; 0x0238D150
	ldr r0, _0238D170 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x47
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238D170: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D150

	arm_func_start ov18_0238D174
ov18_0238D174: ; 0x0238D174
	stmdb sp!, {r4, lr}
	ldr r0, _0238D204 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238D204 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult
	cmp r0, #0
	beq _0238D1BC
	cmp r0, #1
	beq _0238D1F8
	ldmia sp!, {r4, pc}
_0238D1BC:
	mov r0, r4
	bl sub_02041484
	bl sub_0203FD2C
	ldrh r0, [r0, #4]
	bl sub_02041614
	ldr r0, _0238D204 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrsh r0, [r0, #0x8c]
	bl sub_0203FD80
	ldr r0, _0238D204 ; =OVERLAY18_UNKNOWN_POINTER__NA_238D620
	mov r1, #0x4a
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r4, pc}
_0238D1F8:
	mov r0, #0x3c
	bl ov18_0238BE28
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238D204: .word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	arm_func_end ov18_0238D174
	; 0x0238D208

	.rodata
	.global ov18_0238D208
ov18_0238D208:
	.byte 0x18, 0x00, 0x9F, 0xE5, 0x03, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0x90, 0xE5, 0x49, 0x10, 0xA0, 0xE3
	.byte 0x88, 0x30, 0x82, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x80, 0x10, 0x80, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	.global ov18_0238D22C
ov18_0238D22C:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x11, 0x00, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
	.word ov18_0238BE28
	.global ov18_0238D23C
ov18_0238D23C:
	.byte 0x18, 0x00, 0x9F, 0xE5, 0x03, 0x30, 0xA0, 0xE3, 0x00, 0x20, 0x90, 0xE5
	.byte 0x4B, 0x10, 0xA0, 0xE3, 0x88, 0x30, 0x82, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x80, 0x10, 0x80, 0xE5
	.byte 0x1E, 0xFF, 0x2F, 0xE1
	.word OVERLAY18_UNKNOWN_POINTER__NA_238D620
	.global ov18_0238D260
ov18_0238D260:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x11, 0x00, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1
	.word ov18_0238BE28
	.global LINK_SHOP_WINDOW_PARAMS_1
LINK_SHOP_WINDOW_PARAMS_1:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x04
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_2
LINK_SHOP_WINDOW_PARAMS_2:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_3
LINK_SHOP_WINDOW_PARAMS_3:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_4
LINK_SHOP_WINDOW_PARAMS_4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_5
LINK_SHOP_WINDOW_PARAMS_5:
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x02, 0x08, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_6
LINK_SHOP_WINDOW_PARAMS_6:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x12, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_7
LINK_SHOP_WINDOW_PARAMS_7:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x0B, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_8
LINK_SHOP_WINDOW_PARAMS_8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x02, 0x0B, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_9
LINK_SHOP_WINDOW_PARAMS_9:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x0F, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_10
LINK_SHOP_WINDOW_PARAMS_10:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x12, 0x1C, 0x04
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_WINDOW_PARAMS_11
LINK_SHOP_WINDOW_PARAMS_11:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x11, 0x1C, 0x05
	.byte 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global LINK_SHOP_MENU_ITEMS_CONFIRM
LINK_SHOP_MENU_ITEMS_CONFIRM:
#ifdef JAPAN
#define OV18_DATA_OFFSET 0x3926
#define OV18_DATA_OFFSET_2 -0x1C5
#else
#define OV18_DATA_OFFSET 0
#define OV18_DATA_OFFSET_2 0
#define OV18_DATA_OFFSET_2 0
#endif
	.word 0x3E7 + OV18_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x3E8 + OV18_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_1
LINK_SHOP_SUBMENU_ITEMS_1:
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_2
LINK_SHOP_SUBMENU_ITEMS_2:
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_MAIN_MENU_ITEMS
LINK_SHOP_MAIN_MENU_ITEMS:
	.word 0x3EA + OV18_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_3
LINK_SHOP_SUBMENU_ITEMS_3:
	.word 0x3ED + OV18_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3E9 + OV18_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_4
LINK_SHOP_SUBMENU_ITEMS_4:
	.word 0x3F4 + OV18_DATA_OFFSET
	.byte 0x0E, 0x00, 0x00, 0x00
	.word 0x3F5 + OV18_DATA_OFFSET
	.byte 0x0F, 0x00, 0x00, 0x00
	.word 0x3F6 + OV18_DATA_OFFSET
	.byte 0x10, 0x00, 0x00, 0x00
	.word 0x3F3 + OV18_DATA_OFFSET
	.byte 0x0D, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_5
LINK_SHOP_SUBMENU_ITEMS_5:
	.word 0x3ED + OV18_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_6
LINK_SHOP_SUBMENU_ITEMS_6:
	.word 0x3F1 + OV18_DATA_OFFSET
	.byte 0x0B, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global LINK_SHOP_SUBMENU_ITEMS_7
LINK_SHOP_SUBMENU_ITEMS_7:
	.word 0x3F2 + OV18_DATA_OFFSET
	.byte 0x0C, 0x00, 0x00, 0x00
	.word 0x3EE + OV18_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x3EF + OV18_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00
	.word 0xA3F + OV18_DATA_OFFSET_2
	.byte 0x11, 0x00, 0x00, 0x00
	.word 0xA40 + OV18_DATA_OFFSET_2
	.byte 0x12, 0x00, 0x00, 0x00
	.word 0x3F0 + OV18_DATA_OFFSET
	.byte 0x0A, 0x00, 0x00, 0x00
	.word 0x3EB + OV18_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x3EC + OV18_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.global OVERLAY18_FUNCTION_POINTER_TABLE
OVERLAY18_FUNCTION_POINTER_TABLE:
	.word ov18_0238BE48
	.word ov18_0238BE6C
	.word ov18_0238BE90
	.word ov18_0238BF0C
	.word ov18_0238BF30
	.word ov18_0238BF60
	.word ov18_0238BF84
	.word ov18_0238BFA8
	.word ov18_0238C03C
	.word ov18_0238C060
	.word ov18_0238C078
	.word ov18_0238C060
	.word ov18_0238C09C
	.word ov18_0238C0C0
	.word ov18_0238C0D8
	.word ov18_0238C0FC
	.word ov18_0238C114
	.word ov18_0238C13C
	.word ov18_0238C164
	.word ov18_0238C21C
	.word ov18_0238C240
	.word ov18_0238C258
	.word ov18_0238C27C
	.word ov18_0238C340
	.word ov18_0238C364
	.word ov18_0238C398
	.word ov18_0238C3C0
	.word ov18_0238C428
	.word ov18_0238C47C
	.word ov18_0238C4A0
	.word ov18_0238C4E8
	.word ov18_0238C504
	.word ov18_0238C528
	.word ov18_0238C720
	.word ov18_0238C78C
	.word ov18_0238C7B0
	.word ov18_0238C7C0
	.word ov18_0238C7E4
	.word ov18_0238C808
	.word ov18_0238C888
	.word ov18_0238C8AC
	.word ov18_0238C8D0
	.word ov18_0238C950
	.word ov18_0238C974
	.word ov18_0238C984
	.word ov18_0238C9A8
	.word ov18_0238C9B8
	.word ov18_0238CA18
	.word ov18_0238CA3C
	.word ov18_0238CA4C
	.word ov18_0238CA70
	.word ov18_0238CA80
	.word ov18_0238CAB0
	.word ov18_0238CAD4
	.word ov18_0238CBDC
	.word ov18_0238CC00
	.word ov18_0238CD88
	.word ov18_0238CDAC
	.word ov18_0238CDC8
	.word ov18_0238CDEC
	.word ov18_0238CDFC
	.word ov18_0238CE20
	.word ov18_0238CE88
	.word ov18_0238CED8
	.word ov18_0238CF98
	.word ov18_0238D034
	.word ov18_0238D050
	.word ov18_0238D074
	.word ov18_0238D098
	.word ov18_0238D12C
	.word ov18_0238D150
	.word ov18_0238D174
	.word ov18_0238D208
	.word ov18_0238D22C
	.word ov18_0238D23C
	.word ov18_0238D260
	.global ov18_0238D5F8
ov18_0238D5F8:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x25, 0x63, 0x5D, 0x25, 0x73, 0x5B, 0x43, 0x52, 0x5D, 0x00, 0x00, 0x00
	.global ov18_0238D608
ov18_0238D608:
	.byte 0x5B, 0x43, 0x53, 0x3A, 0x56, 0x5D, 0x5B, 0x67, 0x6F, 0x6C, 0x64, 0x3A, 0x30, 0x5D, 0x5B, 0x43
	.byte 0x52, 0x5D, 0x00, 0x00

	.data
	.global OVERLAY18_UNKNOWN_POINTER__NA_238D620
OVERLAY18_UNKNOWN_POINTER__NA_238D620:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
