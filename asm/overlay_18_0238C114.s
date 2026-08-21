	.include "asm/macros.inc"
	.include "overlay_18_0238C114.inc"

	.text

	arm_func_start ov18_0238C114
ov18_0238C114: ; 0x0238C114
	ldr r0, _0238C134 ; =LINK_SHOP_PTR
	ldr r3, _0238C138 ; =0x00010002
	ldr r2, [r0]
	mov r1, #0x11
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C134: .word LINK_SHOP_PTR
_0238C138: .word 0x00010002
	arm_func_end ov18_0238C114

	arm_func_start ov18_0238C13C
ov18_0238C13C: ; 0x0238C13C
	ldr r0, _0238C15C ; =LINK_SHOP_PTR
	ldr r3, _0238C160 ; =0x00010080
	ldr r2, [r0]
	mov r1, #0x12
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C15C: .word LINK_SHOP_PTR
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
	ldr r1, _0238C218 ; =LINK_SHOP_PTR
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x8c]
	bl sub_0203A5F0
	ldr r0, _0238C218 ; =LINK_SHOP_PTR
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
	ldr r2, _0238C218 ; =LINK_SHOP_PTR
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
_0238C218: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C164

	arm_func_start ov18_0238C21C
ov18_0238C21C: ; 0x0238C21C
	ldr r0, _0238C23C ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x14
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C23C: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C21C

	arm_func_start ov18_0238C240
ov18_0238C240: ; 0x0238C240
	ldr r0, _0238C254 ; =LINK_SHOP_PTR
	mov r1, #0x11
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C254: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C240

	arm_func_start ov18_0238C258
ov18_0238C258: ; 0x0238C258
	ldr r0, _0238C278 ; =LINK_SHOP_PTR
	mov r3, #0x90
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C278: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C258

	arm_func_start ov18_0238C27C
ov18_0238C27C: ; 0x0238C27C
	stmdb sp!, {r3, lr}
	ldr r0, _0238C33C ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, pc}
	ldr r0, _0238C33C ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl GetSimpleMenuResult__0202B870
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
	ldr r0, _0238C33C ; =LINK_SHOP_PTR
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
_0238C33C: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C27C

	arm_func_start ov18_0238C340
ov18_0238C340: ; 0x0238C340
	ldr r0, _0238C360 ; =LINK_SHOP_PTR
	mov r3, #0x100
	ldr r2, [r0]
	mov r1, #0x18
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C360: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C340

	arm_func_start ov18_0238C364
ov18_0238C364: ; 0x0238C364
	stmdb sp!, {r3, lr}
	bl sub_0203F398
	cmp r0, #1
	ldmneia sp!,  {r3, pc}
	bl sub_0203F990
	ldr r0, _0238C394 ; =LINK_SHOP_PTR
	mvn r2, #1
	ldr r1, [r0]
	mov r0, #0x11
	strb r2, [r1, #7]
	bl ov18_0238BE28
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C394: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C364

	arm_func_start ov18_0238C398
ov18_0238C398: ; 0x0238C398
	ldr r0, _0238C3B8 ; =LINK_SHOP_PTR
	ldr r3, _0238C3BC ; =0x00000201
	ldr r2, [r0]
	mov r1, #0x1a
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C3B8: .word LINK_SHOP_PTR
_0238C3BC: .word 0x00000201
	arm_func_end ov18_0238C398

	arm_func_start ov18_0238C3C0
ov18_0238C3C0: ; 0x0238C3C0
	stmdb sp!, {r4, lr}
	bl sub_020407EC
	movs r4, r0
	beq _0238C3E4
	ldr r0, _0238C424 ; =LINK_SHOP_PTR
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
_0238C424: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C3C0

	arm_func_start ov18_0238C428
ov18_0238C428: ; 0x0238C428
	stmdb sp!, {r3, lr}
	ldr r1, _0238C474 ; =LINK_SHOP_PTR
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
	ldr r0, _0238C474 ; =LINK_SHOP_PTR
	mov r1, #0x1c
	ldr r0, [r0]
	str r1, [r0, #0x80]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238C474: .word LINK_SHOP_PTR
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
	ldr r1, _0238C4E4 ; =LINK_SHOP_PTR
	ldr r1, [r1]
	str r0, [r1, #0x3a0]
	bl sub_02041094
	ldr r2, _0238C4E4 ; =LINK_SHOP_PTR
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
_0238C4E4: .word LINK_SHOP_PTR
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
	ldr r0, _0238C524 ; =LINK_SHOP_PTR
	mov r3, #0xa00
	ldr r2, [r0]
	mov r1, #0x20
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C524: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C504

	arm_func_start ov18_0238C528
ov18_0238C528: ; 0x0238C528
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0238C714 ; =LINK_SHOP_PTR
	mov r4, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r3, r4, r5, pc}
	bl sub_02041094
	ldr r1, _0238C714 ; =LINK_SHOP_PTR
	mov r5, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #0xa]
	bl GetSimpleMenuResult__0202B870
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
	bl PlaySeByIdVolumeWrapper
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
	bl PlaySeByIdVolumeWrapper
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
	ldr r0, _0238C714 ; =LINK_SHOP_PTR
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
_0238C714: .word LINK_SHOP_PTR
_0238C718: .word 0x00003F07
_0238C71C: .word 0x00001308
	arm_func_end ov18_0238C528

	arm_func_start ov18_0238C720
ov18_0238C720: ; 0x0238C720
	stmdb sp!, {r4, lr}
	bl sub_02041094
	mov r4, r0
	bl sub_02041154
	ldr r1, _0238C788 ; =LINK_SHOP_PTR
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
_0238C788: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C720

	arm_func_start ov18_0238C78C
ov18_0238C78C: ; 0x0238C78C
	ldr r0, _0238C7AC ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x23
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C7AC: .word LINK_SHOP_PTR
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
	ldr r0, _0238C7E0 ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x25
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C7E0: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C7C0

	arm_func_start ov18_0238C7E4
ov18_0238C7E4: ; 0x0238C7E4
	ldr r0, _0238C804 ; =LINK_SHOP_PTR
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x26
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C804: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C7E4

	arm_func_start ov18_0238C808
ov18_0238C808: ; 0x0238C808
	stmdb sp!, {r4, lr}
	ldr r0, _0238C884 ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238C884 ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #0
	beq _0238C850
	cmp r0, #1
	beq _0238C878
	ldmia sp!, {r4, pc}
_0238C850:
	mov r0, r4
	bl sub_02041484
	ldr r0, _0238C884 ; =LINK_SHOP_PTR
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
_0238C884: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C808

	arm_func_start ov18_0238C888
ov18_0238C888: ; 0x0238C888
	ldr r0, _0238C8A8 ; =LINK_SHOP_PTR
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0x28
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C8A8: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C888

	arm_func_start ov18_0238C8AC
ov18_0238C8AC: ; 0x0238C8AC
	ldr r0, _0238C8CC ; =LINK_SHOP_PTR
	mov r3, #0x43
	ldr r2, [r0]
	mov r1, #0x29
	str r3, [r2, #0x88]
	ldr r0, [r0]
	str r1, [r0, #0x80]
	bx lr
	.align 2, 0
_0238C8CC: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C8AC

	arm_func_start ov18_0238C8D0
ov18_0238C8D0: ; 0x0238C8D0
	stmdb sp!, {r4, lr}
	ldr r0, _0238C94C ; =LINK_SHOP_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl IsSimpleMenuActive
	cmp r0, #0
	ldmneia sp!,  {r4, pc}
	bl sub_02041094
	ldr r1, _0238C94C ; =LINK_SHOP_PTR
	mov r4, r0
	ldr r0, [r1]
	ldrsb r0, [r0, #6]
	bl GetSimpleMenuResult__0202B870
	cmp r0, #0
	beq _0238C918
	cmp r0, #1
	beq _0238C940
	ldmia sp!, {r4, pc}
_0238C918:
	mov r0, r4
	bl sub_02041484
	ldr r0, _0238C94C ; =LINK_SHOP_PTR
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
_0238C94C: .word LINK_SHOP_PTR
	arm_func_end ov18_0238C8D0
