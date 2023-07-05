	.include "asm/macros.inc"
	.include "overlay_14.inc"
	.include "global.inc"

	.text

	arm_func_start SentrySetupState
SentrySetupState: @ 0x0238A140
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r0
	ldr r0, _0238A504 @ =0x000038D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A508 @ =0x0238DB80
	str r0, [r1]
	add r0, r0, #0xa4
	bl InitPreprocessorArgs
	ldr r0, _0238A508 @ =0x0238DB80
	mov r5, #0
	ldr r1, [r0]
	sub r3, r5, #1
	str r5, [r1, #0x104]
	ldr r7, [r0]
	mov r2, #2
	ldr r6, [r7, #0x108]
	mov r1, #1
	str r6, [r7, #0x110]
	ldr r6, [r0]
	str r5, [r6, #0x10c]
	ldr r6, [r0]
	str r3, [r6, #0x114]
	ldr r6, [r0]
	str r5, [r6, #0x118]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x88c]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x890]
	ldr r6, [r0]
	add r6, r6, #0x3000
	strb r5, [r6, #0x530]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r2, [r6, #0x534]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x538]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x53c]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x540]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r3, [r6, #0x564]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r3, [r6, #0x568]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x56c]
	ldr r3, [r0]
	add r3, r3, #0x3000
	strb r5, [r3, #0x870]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x884]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x88c]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r2, [r3, #0x898]
	ldr r2, [r0]
	add r2, r2, #0x3000
	strb r1, [r2, #0x89c]
	mov r2, r1
_0238A25C:
	ldr r1, [r0]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x3000
	str r2, [r1, #0x544]
	ldr r1, [r0]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x3000
	add r5, r5, #1
	str r2, [r1, #0x554]
	cmp r5, #4
	blt _0238A25C
	ldr r2, _0238A508 @ =0x0238DB80
	mov r0, #0
	ldr r1, [r2]
	mov r3, #0x60
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r3, [r1, #0x8b0]
	mvn r3, #0
_0238A2BC:
	ldr r1, [r2]
	add r1, r1, r0, lsl #2
	add r1, r1, #0x3000
	add r0, r0, #1
	str r3, [r1, #0x8b8]
	cmp r0, #6
	blt _0238A2BC
	bl GetHeroMemberIdx
	ldr r1, _0238A508 @ =0x0238DB80
	ldr r1, [r1]
	add r1, r1, #0x3800
	strh r0, [r1, #0xd0]
	bl GetPartnerMemberIdx
	ldr r3, _0238A508 @ =0x0238DB80
	mvn r1, #1
	ldr r2, [r3]
	add r2, r2, #0x3800
	strh r0, [r2, #0xd2]
	ldr r2, [r3]
	mov r0, #0
	str r4, [r2, #0x11c]
	ldr r2, [r3]
	strb r1, [r2]
	ldr r2, [r3]
	strb r1, [r2, #1]
	ldr r2, [r3]
	strb r1, [r2, #2]
	ldr r2, [r3]
	strb r1, [r2, #3]
	ldr r2, [r3]
	strb r1, [r2, #4]
	ldr r2, [r3]
	strb r1, [r2, #5]
	ldr r2, [r3]
	strb r1, [r2, #6]
	ldr r2, [r3]
	strb r1, [r2, #7]
	ldr r2, [r3]
	strb r1, [r2, #8]
	ldr r2, [r3]
	strb r1, [r2, #9]
	ldr r2, [r3]
	strb r1, [r2, #0xa]
	ldr r2, [r3]
	strb r1, [r2, #0xb]
	bl ov14_0238AC04
	ldr r0, _0238A508 @ =0x0238DB80
	mov r1, #0xad
	ldr r0, [r0]
	mov r2, #0x8100000
	add r0, r0, #0x120
	bl ov11_022F6E60
	ldr r0, _0238A508 @ =0x0238DB80
	ldr r2, _0238A50C @ =0x88080000
	ldr r0, [r0]
	mov r1, #0xcd
	add r0, r0, #0x1e4
	bl ov11_022F6E60
	ldr r0, _0238A508 @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x2a8
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, _0238A508 @ =0x0238DB80
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x2a8
	bl ov11_022F52E8
	mov sb, #0
	ldr r5, _0238A510 @ =0xC8100000
	ldr r4, _0238A508 @ =0x0238DB80
	mov r7, #0x800
	mov r6, sb
	mov sl, #0xc4
_0238A3E8:
	mul r8, sb, sl
	ldr r1, [r4]
	add r0, r1, #0x36c
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, #0x36c
	mov r2, r6
	add r0, r0, r8
	bl ov11_022F52E8
	ldr r1, [r4]
	add r0, r1, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, [r4]
	mov r1, r5
	add r0, r0, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r8
	bl ov11_022F495C
	ldr r1, [r4]
	add r0, r1, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, [r4]
	mov r1, r5
	arm_func_end SentrySetupState

	arm_func_start ov14_0238A468
ov14_0238A468: @ 0x0238A468
	add r0, r0, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r8
	bl ov11_022F495C
	add sb, sb, #1
	cmp sb, #0x10
	blt _0238A3E8
	ldr r8, _0238A510 @ =0xC8100000
	ldr r7, _0238A508 @ =0x0238DB80
	mov r5, #0
	mov r6, #0xc4
_0238A494:
	mul r4, r5, r6
	ldr r1, [r7]
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	add r0, r0, r4
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, [r7]
	mov r1, r8
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	add r0, r0, r4
	bl ov11_022F495C
	add r5, r5, #1
	cmp r5, #2
	blt _0238A494
	ldr r0, _0238A508 @ =0x0238DB80
	ldr r2, [r0]
	ldr r0, [r2, #0x11c]
	cmp r0, #2
	mov r0, #4
	streq r0, [r2, #0x108]
	beq _0238A4FC
	mov r1, #6
	str r1, [r2, #0x108]
	bl sub_02017DF4
_0238A4FC:
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238A504: .4byte 0x000038D4
_0238A508: .4byte 0x0238DB80
_0238A50C: .4byte 0x88080000
_0238A510: .4byte 0xC8100000
	arm_func_end ov14_0238A468

	arm_func_start ov14_0238A514
ov14_0238A514: @ 0x0238A514
	push {r3, lr}
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #2
	bne _0238A540
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A540
	bl sub_0202F334
_0238A540:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #1
	bne _0238A568
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A568
	bl sub_0202BC60
_0238A568:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	bne _0238A590
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	beq _0238A590
	bl HidePortraitBox
_0238A590:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	bne _0238A5B8
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	beq _0238A5B8
	bl sub_0202F954
_0238A5B8:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	bne _0238A5E0
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	beq _0238A5E0
	bl sub_0202F954
_0238A5E0:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	bne _0238A608
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	beq _0238A608
	bl sub_0202F954
_0238A608:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	bne _0238A630
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	beq _0238A630
	bl HidePortraitBox
_0238A630:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	bne _0238A658
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	beq _0238A658
	bl HidePortraitBox
_0238A658:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	bne _0238A680
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	beq _0238A680
	bl HidePortraitBox
_0238A680:
	ldr r0, _0238A6AC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	popne {r3, pc}
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl HidePortraitBox
	pop {r3, pc}
	.align 2, 0
_0238A6AC: .4byte 0x0238DB80
	arm_func_end ov14_0238A514

	arm_func_start ov14_0238A6B0
ov14_0238A6B0: @ 0x0238A6B0
	push {r3, lr}
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #2
	bne _0238A71C
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A710
	bl IsDBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A710
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl FreeDBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #1]
_0238A710:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A71C:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #1
	bne _0238A784
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A778
	bl sub_0202BCBC
	cmp r0, #0
	movne r2, #0
	bne _0238A778
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl FreeAdvancedMenu
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0]
_0238A778:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A784:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	bne _0238A7EC
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A7E0
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238A7E0
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl FreePortraitBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #2]
_0238A7E0:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A7EC:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	bne _0238A854
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A848
	bl sub_0202FB9C
	cmp r0, #0
	movne r2, #0
	bne _0238A848
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl sub_0202F8FC
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #3]
_0238A848:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A854:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	bne _0238A8BC
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A8B0
	bl sub_0202FB9C
	cmp r0, #0
	movne r2, #0
	bne _0238A8B0
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_0202F8FC
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #4]
_0238A8B0:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A8BC:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	bne _0238A924
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A918
	bl sub_0202FB9C
	cmp r0, #0
	movne r2, #0
	bne _0238A918
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_0202F8FC
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #5]
_0238A918:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A924:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	bne _0238A98C
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A980
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238A980
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl FreePortraitBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #6]
_0238A980:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A98C:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	bne _0238A9F4
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A9E8
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238A9E8
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl FreePortraitBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #7]
_0238A9E8:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238A9F4:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	bne _0238AA5C
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AA50
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238AA50
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl FreePortraitBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #8]
_0238AA50:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238AA5C:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	bne _0238AAC4
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AAB8
	bl sub_0202F66C
	cmp r0, #0
	movne r2, #0
	bne _0238AAB8
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	bl FreePortraitBox
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #9]
_0238AAB8:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238AAC4:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40000000
	bne _0238AB2C
	ldrsb r0, [r1, #0xa]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AB20
	bl IsNormalMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238AB20
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl FreeNormalMenu
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xa]
_0238AB20:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238AB2C:
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80000000
	bne _0238AB94
	ldrsb r0, [r1, #0xb]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AB88
	bl IsNormalMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238AB88
	ldr r0, _0238AB9C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl FreeNormalMenu
	ldr r0, _0238AB9C @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xb]
_0238AB88:
	cmp r2, #0
	moveq r0, #0
	popeq {r3, pc}
_0238AB94:
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0238AB9C: .4byte 0x0238DB80
	arm_func_end ov14_0238A6B0

	arm_func_start ov14_0238ABA0
ov14_0238ABA0: @ 0x0238ABA0
	push {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r1
	lsl r1, r4, #0x10
	mov r5, r0
	asr r0, r1, #0x10
	bl GetSentryDutyGamePoints
	add r1, r4, #0x6e0
	lsl r1, r1, #0x10
	str r0, [sp, #0x28]
	lsr r0, r1, #0x10
	bl StringFromMessageId
	str r0, [sp, #0x3c]
	add r0, sp, #4
	str r0, [sp]
	ldr r2, _0238ABFC @ =0x0238DAE8
	ldr r3, _0238AC00 @ =0x0000C402
	mov r0, r5
	mov r1, #0x400
	bl PreprocessString
	mov r0, r5
	add sp, sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_0238ABFC: .4byte 0x0238DAE8
_0238AC00: .4byte 0x0000C402
	arm_func_end ov14_0238ABA0

	arm_func_start ov14_0238AC04
ov14_0238AC04: @ 0x0238AC04
	push {r3, lr}
	rsb ip, r0, #0x10
	mov r3, #1
	ldr r0, _0238AC3C @ =0x0238DB84
	mov r1, r3
	mov r2, #2
_0238AC1C:
	cmp r3, ip
	movge lr, r2
	movlt lr, r1
	strb lr, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x10
	blt _0238AC1C
	pop {r3, pc}
	.align 2, 0
_0238AC3C: .4byte 0x0238DB84
	arm_func_end ov14_0238AC04

	arm_func_start ov14_0238AC40
ov14_0238AC40: @ 0x0238AC40
	push {r3, lr}
	ldr r1, _0238ACE4 @ =0x0238DB80
	ldr ip, [r1]
	add r0, ip, #0x3000
	ldr r2, [r0, #0x880]
	ldr r3, [r0, #0x888]
	lsl r0, r2, #2
	add r0, r0, #0xf7
	add r0, r0, #0x600
	add r0, r3, r0
	str r0, [ip, #0x114]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl ShowDBox
	ldr r0, _0238ACE4 @ =0x0238DB80
	ldr r1, _0238ACE8 @ =0x00000408
	ldr r3, [r0]
	ldr r2, [r3, #0x114]
	ldrsb r0, [r3, #1]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	add r3, r3, #0xa4
	bl ShowMessageInDBox
	ldr r0, _0238ACE4 @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ShowDBox
	ldr r1, _0238ACE4 @ =0x0238DB80
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x888]
	add r2, r2, #1
	str r2, [r0, #0x888]
	ldr r0, [r1]
	add r2, r0, #0x3000
	ldr r0, [r2, #0x888]
	lsr r1, r0, #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	str r0, [r2, #0x888]
	pop {r3, pc}
	.align 2, 0
_0238ACE4: .4byte 0x0238DB80
_0238ACE8: .4byte 0x00000408
	arm_func_end ov14_0238AC40
_0238ACEC:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0x95, 0x73, 0xF2, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov14_0238AD04
ov14_0238AD04: @ 0x0238AD04
	push {r4, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	beq _0238ADF0
	bl sub_02027B58
	ldr r0, _0238ADF8 @ =0x0238DB80
	ldr r1, [r0]
	ldrsb r0, [r1, #4]
	cmp r4, r0
	bne _0238AD84
	add r0, r1, #0x3800
	ldrsh r1, [r0, #0xa2]
	add r0, sp, #0
	bl GetNameRaw
	mov r1, #2
	add r3, sp, #0
	mov r0, r4
	sub r2, r1, #3
	bl sub_02026214
	ldr r1, _0238ADF8 @ =0x0238DB80
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa4]
	bl GetNameRaw
	mov r1, #0x7a
	mov r0, r4
	sub r2, r1, #0x7b
	add r3, sp, #0
	bl sub_02026214
_0238AD84:
	ldr r0, _0238ADF8 @ =0x0238DB80
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	cmp r4, r0
	bne _0238ADE8
	add r0, r1, #0x3800
	ldrsh r1, [r0, #0xa6]
	add r0, sp, #0
	bl GetNameRaw
	mov r1, #2
	add r3, sp, #0
	mov r0, r4
	sub r2, r1, #3
	bl sub_02026214
	ldr r1, _0238ADF8 @ =0x0238DB80
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa8]
	bl GetNameRaw
	mov r1, #0x7a
	mov r0, r4
	sub r2, r1, #0x7b
	add r3, sp, #0
	bl sub_02026214
_0238ADE8:
	mov r0, r4
	bl sub_02027AF0
_0238ADF0:
	add sp, sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0238ADF8: .4byte 0x0238DB80
	arm_func_end ov14_0238AD04

	arm_func_start SentryUpdateDisplay
SentryUpdateDisplay: @ 0x0238ADFC
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	ldr r1, _0238B690 @ =0x0238D970
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x10]
	ldr r4, [r0]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r4, #0
	ldrne r0, [r4, #0x11c]
	cmpne r0, #2
	beq _0238B688
	add r0, r4, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238AECC
	ldr r0, [r0, #0x874]
	mov r1, #0x3c
	bl DivideInt
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r0, #9
	blt _0238AECC
	add r0, r4, #0x3000
	ldr r1, [r0, #0x540]
	mov r5, #0
	cmp r1, #2
	moveq r1, #3
	ldr r4, _0238B698 @ =0x0238DA40
	ldr r7, _0238B694 @ =0x0238DB80
	streq r1, [r0, #0x540]
	add sb, sp, #0x14
	mov r8, r5
	mov r6, #0xc4
_0238AE88:
	ldr r0, [r7]
	add r1, r4, r5, lsl #3
	add r0, r0, #0x278
	add r0, r0, #0x2800
	mla r0, r5, r6, r0
	ldr r2, [r4, r5, lsl #3]
	ldr r1, [r1, #4]
	add sl, r2, #0x2200
	add r3, r1, #0x1600
	mov r1, sb
	mov r2, r8
	str sl, [sp, #0x14]
	str r3, [sp, #0x18]
	bl ov11_022F6F14
	add r5, r5, #1
	cmp r5, #4
	blt _0238AE88
_0238AECC:
	ldr r7, _0238B694 @ =0x0238DB80
	ldr r0, [r7]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x870]
	cmp r0, #0
	beq _0238AFDC
	ldr r0, _0238B69C @ =0x00000806
	mov r4, #0xc4
	ldr r8, _0238B698 @ =0x0238DA40
	mov sl, #0
	sub sb, r0, #2
	mov r5, r4
	mov r6, r4
	mov fp, r4
_0238AF04:
	ldr r0, [r7]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x3000
	ldr r2, [r0, #0x544]
	ldr r1, [r0, #0x554]
	cmp r2, r1
	beq _0238AFA0
	str r1, [r0, #0x544]
	ldr r1, [r7]
	add r0, r1, sl, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x544]
	cmp r0, #2
	beq _0238AF50
	cmp r0, #3
	beq _0238AF6C
	cmp r0, #4
	beq _0238AF88
	b _0238AFA0
_0238AF50:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r6, r0
	mov r1, sb
	mov r2, #0
	bl ov11_022F52E8
	b _0238AFA0
_0238AF6C:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r5, r0
	ldr r1, _0238B6A0 @ =0x00001005
	mov r2, #0
	bl ov11_022F52E8
	b _0238AFA0
_0238AF88:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r4, r0
	ldr r1, _0238B69C @ =0x00000806
	mov r2, #0
	bl ov11_022F52E8
_0238AFA0:
	ldr r1, [r7]
	add r0, r1, sl, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x544]
	cmp r0, #1
	ble _0238AFD0
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, fp, r0
	add r1, r8, sl, lsl #3
	mov r2, #0
	bl ov11_022F6F14
_0238AFD0:
	add sl, sl, #1
	cmp sl, #4
	blt _0238AF04
_0238AFDC:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r2, [r0]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B038
	mov r1, #0x8000
	str r1, [sp, #0x14]
	ldr r1, [r0, #0x8b0]
	add r0, r2, #0x3a8
	lsl r3, r1, #8
	add r1, sp, #0x14
	add r0, r0, #0x3000
	mov r2, #0
	str r3, [sp, #0x18]
	bl ov11_022F7064
	ldr r0, _0238B694 @ =0x0238DB80
	add r1, sp, #0x14
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl ov11_022F6F14
_0238B038:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r2, [r0]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B1DC
	ldr r1, [r0, #0x538]
	cmp r1, #0
	beq _0238B1A8
	cmp r1, #3
	beq _0238B078
	cmp r1, #4
	beq _0238B0EC
	cmp r1, #5
	beq _0238B128
	b _0238B164
_0238B078:
	ldr r0, [r0, #0x534]
	cmp r0, #4
	bne _0238B098
	add r0, r2, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F4990
	cmp r0, #0
	bne _0238B1A8
_0238B098:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x534]
	cmp r0, #3
	beq _0238B0C4
	add r0, r1, #0x1b4
	ldr r1, _0238B6A4 @ =0x00000801
	add r0, r0, #0x2800
	mov r2, #0
	bl ov11_022F52E8
_0238B0C4:
	ldr r1, _0238B694 @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B0EC:
	add r0, r2, #0x1b4
	ldr r1, _0238B6A8 @ =0x00001002
	add r0, r0, #0x2800
	mov r2, #0
	bl ov11_022F52E8
	ldr r1, _0238B694 @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B128:
	add r0, r2, #0x1b4
	ldr r1, _0238B6AC @ =0x00000802
	add r0, r0, #0x2800
	mov r2, #0
	bl ov11_022F52E8
	ldr r1, _0238B694 @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B164:
	ldr r0, [r0, #0x534]
	cmp r0, r1
	beq _0238B184
	add r0, r2, #0x1b4
	add r0, r0, #0x2800
	mov r1, #0x800
	mov r2, #0
	bl ov11_022F52E8
_0238B184:
	ldr r1, _0238B694 @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
_0238B1A8:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x534]
	cmp r1, #1
	beq _0238B1DC
	ldr r1, [r0, #0x878]
	ldr r2, _0238B698 @ =0x0238DA40
	add r0, r3, #0x1b4
	add r0, r0, #0x2800
	add r1, r2, r1, lsl #3
	mov r2, #0
	bl ov11_022F6F14
_0238B1DC:
	mov sl, #0
	ldr r8, _0238B6B0 @ =0x0238DB84
	ldr r7, _0238B6B4 @ =0x0238DA60
	ldr r5, _0238B694 @ =0x0238DB80
	mov fp, sl
	mov r6, #0xa000
	mov r4, #0xc4
_0238B1F8:
	mul sb, sl, r4
	ldrsb r0, [r8, sl]
	ldr r1, [r5]
	mov r2, fp
	add r0, r0, #0x800
	add r3, r1, #0x36c
	lsl r1, r0, #0x10
	add r0, r3, sb
	asr r1, r1, #0x10
	bl ov11_022F52E8
	lsl r0, sl, #1
	ldrsh r1, [r7, r0]
	ldr r0, [r5]
	mov r2, #0
	lsl r1, r1, #8
	add r0, r0, #0x36c
	str r1, [sp, #0x14]
	add r0, r0, sb
	add r1, sp, #0x14
	str r6, [sp, #0x18]
	bl ov11_022F6F14
	add sl, sl, #1
	cmp sl, #0x10
	blt _0238B1F8
	ldr r1, _0238B694 @ =0x0238DB80
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x884]
	ldr r2, [r0, #0x564]
	cmp r3, r2
	beq _0238B2E4
	str r3, [r0, #0x564]
	ldr r2, [r1]
	mov r1, #6
	add r0, r2, #0x3000
	ldr r0, [r0, #0x564]
	ldr r3, _0238B6B8 @ =0x0000C402
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #6
	add r0, r2, #0x570
	ldr r2, _0238B6BC @ =0x0238DB0C
	str r1, [sp, #0x44]
	strgt r1, [sp, #0x40]
	add r4, sp, #0x1c
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r1, r4
	str r1, [sp]
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r2, _0238B6C0 @ =0x0238DB18
	ldr r0, [r0]
	ldr r3, _0238B6B8 @ =0x0000C402
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r1, #0x400
	bl PreprocessString
_0238B2E4:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x564]
	cmp r0, #0
	blt _0238B374
	add r0, r1, #0x3ac
	add r4, r0, #0xc00
	add r0, r1, #0x570
	mov r3, #0x3a
	str r4, [sp, #0x10]
	str r3, [sp, #0xc]
	mov r4, #1
	add r1, sp, #0x10
	add r2, sp, #0xc
	add r0, r0, #0x3000
	mov r3, #0x16
	str r4, [sp]
	bl ov14_0238D828
	mov r4, #0
	ldr r0, _0238B6C4 @ =0x0238DB24
	add r1, sp, #0x10
	add r2, sp, #0xc
	mov r3, #0x16
	str r4, [sp]
	bl ov14_0238D828
	mov r1, #1
	str r1, [sp]
	ldr r0, _0238B694 @ =0x0238DB80
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #0xc
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r3, #0x16
	bl ov14_0238D828
_0238B374:
	ldr r1, _0238B694 @ =0x0238DB80
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x88c]
	ldr r2, [r0, #0x568]
	cmp r3, r2
	beq _0238B3C4
	str r3, [r0, #0x568]
	ldr r2, [r1]
	ldr r3, _0238B6B8 @ =0x0000C402
	add r0, r2, #0x3000
	ldr r1, [r0, #0x568]
	add r0, r2, #0x770
	str r1, [sp, #0x40]
	add r4, sp, #0x1c
	ldr r2, _0238B6BC @ =0x0238DB0C
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
_0238B3C4:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x568]
	cmp r0, #0
	blt _0238B42C
	add r0, r1, #0x3ec
	add r4, r0, #0x1800
	add r0, r1, #0x770
	mov r3, #0xa8
	str r4, [sp, #8]
	str r3, [sp, #4]
	mov r4, #8
	add r1, sp, #8
	add r2, sp, #4
	add r0, r0, #0x3000
	mov r3, #0x18
	str r4, [sp]
	bl ov14_0238D828
	mov r4, #0
	ldr r0, _0238B6C8 @ =0x0238DB28
	add r1, sp, #8
	add r2, sp, #4
	mov r3, #0x18
	str r4, [sp]
	bl ov14_0238D828
_0238B42C:
	ldr r4, _0238B694 @ =0x0238DB80
	ldr r0, [r4]
	add r0, r0, #0x3000
	ldr r8, [r0, #0x56c]
	ldr r7, [r0, #0x898]
	cmp r7, r8
	beq _0238B4E4
	cmp r7, r8
	mov r5, #0
	ble _0238B494
	mov r6, #0x304
	mov r7, #0xc4
	b _0238B47C
_0238B460:
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	mla r0, r8, r7, r0
	mov r1, r6
	mov r2, r5
	bl ov11_022F52E8
	add r8, r8, #1
_0238B47C:
	ldr r1, [r4]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x898]
	cmp r8, r0
	blt _0238B460
	b _0238B4D0
_0238B494:
	ldr r6, _0238B6CC @ =0x00001004
	mov r8, #0xc4
	b _0238B4BC
_0238B4A0:
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	mla r0, r7, r8, r0
	mov r1, r6
	mov r2, r5
	bl ov11_022F52E8
	add r7, r7, #1
_0238B4BC:
	ldr r1, [r4]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x56c]
	cmp r7, r0
	blt _0238B4A0
_0238B4D0:
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x898]
	str r1, [r0, #0x56c]
_0238B4E4:
	mov r0, #0x2600
	mov r4, #0
	ldr r6, _0238B694 @ =0x0238DB80
	str r0, [sp, #0x18]
	add r8, sp, #0x14
	mov r7, r4
	mov r5, #0xc4
_0238B500:
	ldr r0, [r6]
	lsl r1, r4, #4
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	mla r0, r4, r5, r0
	add r1, r1, #0xd6
	lsl r3, r1, #8
	mov r1, r8
	mov r2, r7
	str r3, [sp, #0x14]
	bl ov11_022F6F14
	add r4, r4, #1
	cmp r4, #2
	blt _0238B500
	ldr r6, _0238B694 @ =0x0238DB80
	ldr r0, [r6]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B688
	ldr r2, [r0, #0x53c]
	ldr r1, [r0, #0x540]
	cmp r2, r1
	beq _0238B5BC
	mov r4, #0
	ldr r8, _0238B6D0 @ =0x00001003
	str r1, [r0, #0x53c]
	mov r7, r4
	mov r5, #0xc4
_0238B574:
	ldr r0, [r6]
	mov r1, r8
	add r0, r0, #0x98
	add r0, r0, #0x3000
	mla r0, r4, r5, r0
	mov r2, r7
	bl ov11_022F52E8
	add r4, r4, #1
	cmp r4, #4
	blt _0238B574
	ldr r0, _0238B694 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #3
	bne _0238B5BC
	ldr r0, _0238B6D4 @ =0x00002C05
	bl sub_02017C80
_0238B5BC:
	ldr r6, _0238B694 @ =0x0238DB80
	ldr r0, [r6]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #1
	ble _0238B688
	mov sl, #0
	mov r4, #0xc4
	ldr sb, _0238B698 @ =0x0238DA40
	add r8, sp, #0x14
	mov fp, sl
	mov r7, sl
	mov r5, r4
_0238B5F0:
	ldr r1, [r6]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #2
	beq _0238B610
	cmp r0, #3
	beq _0238B648
	b _0238B67C
_0238B610:
	add r0, r1, #0x98
	add r0, r0, #0x3000
	mla r0, sl, r5, r0
	add r1, sb, sl, lsl #3
	ldr r2, [sb, sl, lsl #3]
	ldr r1, [r1, #4]
	sub r3, r2, #0x1600
	sub ip, r1, #0x600
	mov r1, r8
	mov r2, r7
	str r3, [sp, #0x14]
	str ip, [sp, #0x18]
	bl ov11_022F6F14
	b _0238B67C
_0238B648:
	add r0, r1, #0x98
	add r0, r0, #0x3000
	mla r0, sl, r4, r0
	add r1, sb, sl, lsl #3
	ldr r2, [sb, sl, lsl #3]
	ldr r1, [r1, #4]
	add r3, r2, #0x2200
	add ip, r1, #0xe00
	mov r1, r8
	mov r2, fp
	str r3, [sp, #0x14]
	str ip, [sp, #0x18]
	bl ov11_022F6F14
_0238B67C:
	add sl, sl, #1
	cmp sl, #4
	blt _0238B5F0
_0238B688:
	add sp, sp, #0x6c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238B690: .4byte 0x0238D970
_0238B694: .4byte 0x0238DB80
_0238B698: .4byte 0x0238DA40
_0238B69C: .4byte 0x00000806
_0238B6A0: .4byte 0x00001005
_0238B6A4: .4byte 0x00000801
_0238B6A8: .4byte 0x00001002
_0238B6AC: .4byte 0x00000802
_0238B6B0: .4byte 0x0238DB84
_0238B6B4: .4byte 0x0238DA60
_0238B6B8: .4byte 0x0000C402
_0238B6BC: .4byte 0x0238DB0C
_0238B6C0: .4byte 0x0238DB18
_0238B6C4: .4byte 0x0238DB24
_0238B6C8: .4byte 0x0238DB28
_0238B6CC: .4byte 0x00001004
_0238B6D0: .4byte 0x00001003
_0238B6D4: .4byte 0x00002C05
	arm_func_end SentryUpdateDisplay

	arm_func_start SentrySetExitingState
SentrySetExitingState: @ 0x0238B6D8
	push {r3, lr}
	ldr r0, _0238B704 @ =0x0238DB80
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x118]
	bl ov14_0238A514
	ldr r0, _0238B704 @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x104]
	pop {r3, pc}
	.align 2, 0
_0238B704: .4byte 0x0238DB80
	arm_func_end SentrySetExitingState

	arm_func_start ov14_0238B708
ov14_0238B708: @ 0x0238B708
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _0238B7F8 @ =0x0238DB80
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	add r0, r0, #0x2a8
	bl ov11_022F4BE4
	ldr r7, _0238B7F8 @ =0x0238DB80
	mov r4, #0
	mov r6, #0xc4
_0238B730:
	mul r5, r4, r6
	ldr r0, [r7]
	add r0, r0, #0x36c
	add r0, r0, r5
	bl ov11_022F4BE4
	ldr r0, [r7]
	add r0, r0, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r5
	bl ov11_022F4BE4
	ldr r0, [r7]
	add r0, r0, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r5
	bl ov11_022F4BE4
	add r4, r4, #1
	cmp r4, #0x10
	blt _0238B730
	ldr r5, _0238B7F8 @ =0x0238DB80
	mov r6, #0
	mov r4, #0xc4
_0238B784:
	ldr r0, [r5]
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	mla r0, r6, r4, r0
	bl ov11_022F4BE4
	add r6, r6, #1
	cmp r6, #2
	blt _0238B784
	ldr r0, _0238B7F8 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x120
	bl ov11_022F4BE4
	ldr r0, _0238B7F8 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x1e4
	bl ov11_022F4BE4
	ldr r0, _0238B7F8 @ =0x0238DB80
	ldr r0, [r0]
	ldr r0, [r0, #0x11c]
	cmp r0, #2
	beq _0238B7DC
	bl sub_02017EE8
_0238B7DC:
	ldr r0, _0238B7F8 @ =0x0238DB80
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238B7F8 @ =0x0238DB80
	mov r1, #0
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0238B7F8: .4byte 0x0238DB80
	arm_func_end ov14_0238B708

	arm_func_start SentryRunState
SentryRunState: @ 0x0238B7FC
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r2, [r0]
	ldr r1, [r2, #0x104]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238C120
_0238B81C: @ jump table
	b _0238B82C @ case 0
	b _0238C0E0 @ case 1
	b _0238C0FC @ case 2
	b _0238C120 @ case 3
_0238B82C:
	ldr r1, [r2, #0x10c]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238C0D8
_0238B83C: @ jump table
	b _0238B84C @ case 0
	b _0238B8BC @ case 1
	b _0238C090 @ case 2
	b _0238B84C @ case 3
_0238B84C:
	mov r1, #0
	str r1, [r2, #0x10c]
	ldr r1, [r0]
	ldr r0, _0238C130 @ =0x0238DB94
	ldr r1, [r1, #0x108]
	ldr r0, [r0, r1, lsl #2]
	blx r0
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r3, [r0]
	ldr r1, [r3, #0x108]
	ldr r2, [r3, #0x110]
	cmp r1, r2
	beq _0238C0D8
	ldr r1, [r3, #0x10c]
	cmp r1, #3
	bne _0238B8A4
	str r2, [r3, #0x108]
	ldr r1, [r0]
	ldr r0, _0238C130 @ =0x0238DB94
	ldr r1, [r1, #0x108]
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0238B8A4:
	bl ov14_0238A514
	ldr r0, _0238C12C @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10c]
	b _0238C0D8
_0238B8BC:
	bl ov14_0238A6B0
	cmp r0, #0
	beq _0238C0D8
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r3, [r1]
	ldr r0, [r3, #0x118]
	tst r0, #1
	beq _0238B96C
	ldrsb r2, [r3]
	mvn r0, #1
	cmp r2, r0
	bne _0238B96C
	mov r2, #0
	str r2, [r3, #0xc]
	ldr r2, [r1]
	add r0, r0, #0x6e0
	strh r0, [r2, #0x14]
	ldr r0, [r1]
	mov r2, #0x10
	str r2, [r0, #0x18]
	ldr r2, [r1]
	mov r4, #5
	ldr r0, [r2, #0x11c]
	ldr r1, _0238C134 @ =0x04080800
	cmp r0, #2
	str r4, [sp]
	beq _0238B94C
	ldr r0, _0238C138 @ =0x0238D9C8
	ldr r3, _0238C13C @ =ov14_0238ABA0
	add r2, r2, #0xc
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1]
	b _0238B96C
_0238B94C:
	ldr r0, _0238C140 @ =0x0238D9D8
	ldr r3, _0238C13C @ =ov14_0238ABA0
	add r2, r2, #0xc
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1]
_0238B96C:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r3, [r0]
	ldr r1, [r3, #0x118]
	tst r1, #2
	beq _0238BDA4
	ldr r5, [r3, #0x114]
	mov r2, #0x32
	str r2, [r3, #0xf0]
	ldr r1, [r0]
	sub r0, r2, #0x34
	ldrsb r1, [r1, #1]
	ldr r4, _0238C144 @ =0x00003018
	cmp r1, r0
	bne _0238B9B8
	ldr r0, _0238C148 @ =0x0238D9B8
	bl CreateDBox
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #1]
_0238B9B8:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ShowDBox
	ldr r2, _0238C12C @ =0x0238DB80
	ldr r0, [r2]
	ldr r1, [r0, #0x108]
	cmp r1, #0x21
	addls pc, pc, r1, lsl #2
	b _0238BD6C
_0238B9E0: @ jump table
	b _0238BD6C @ case 0
	b _0238BD6C @ case 1
	b _0238BD6C @ case 2
	b _0238BD6C @ case 3
	b _0238BA68 @ case 4
	b _0238BA68 @ case 5
	b _0238BA7C @ case 6
	b _0238BA7C @ case 7
	b _0238BA90 @ case 8
	b _0238BD6C @ case 9
	b _0238BA90 @ case 10
	b _0238BD6C @ case 11
	b _0238BAA4 @ case 12
	b _0238BAA4 @ case 13
	b _0238BD6C @ case 14
	b _0238BD6C @ case 15
	b _0238BAC0 @ case 16
	b _0238BAC0 @ case 17
	b _0238BADC @ case 18
	b _0238BADC @ case 19
	b _0238BAF0 @ case 20
	b _0238BD6C @ case 21
	b _0238BD6C @ case 22
	b _0238BB60 @ case 23
	b _0238BD6C @ case 24
	b _0238BBE0 @ case 25
	b _0238BD6C @ case 26
	b _0238BD6C @ case 27
	b _0238BC50 @ case 28
	b _0238BD6C @ case 29
	b _0238BC88 @ case 30
	b _0238BD6C @ case 31
	b _0238BCFC @ case 32
	b _0238BD6C @ case 33
_0238BA68:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C150 @ =0x000006D9
	str r1, [r0, #0xf0]
	ldr r4, _0238C144 @ =0x00003018
	b _0238BD6C
_0238BA7C:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C154 @ =0x000006D8
	str r1, [r0, #0xf0]
	add r4, r5, #0x2940
	b _0238BD6C
_0238BA90:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C158 @ =0x000006DA
	str r1, [r0, #0xf0]
	ldr r4, _0238C144 @ =0x00003018
	b _0238BD6C
_0238BAA4:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd2]
	ldr r5, _0238C15C @ =0x000006DB
	ldr r4, _0238C160 @ =0x00003028
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	b _0238BD6C
_0238BAC0:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd2]
	ldr r5, _0238C164 @ =0x000006EB
	ldr r4, _0238C160 @ =0x00003028
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	b _0238BD6C
_0238BADC:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C168 @ =0x000006DC
	str r1, [r0, #0xf0]
	ldr r4, _0238C160 @ =0x00003028
	b _0238BD6C
_0238BAF0:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BB0C
	cmp r1, #1
	beq _0238BB38
	b _0238BB58
_0238BB0C:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd0]
	ldr r5, _0238C16C @ =0x000006EE
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BB58
_0238BB38:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C170 @ =0x000006EF
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BB58:
	ldr r4, _0238C160 @ =0x00003028
	b _0238BD6C
_0238BB60:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BB7C
	cmp r1, #1
	beq _0238BBAC
	b _0238BBD8
_0238BB7C:
	ldr r3, _0238C14C @ =0x00000142
	ldr r1, _0238C174 @ =0x00002311
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	ldr r5, _0238C178 @ =0x000006F1
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BBD8
_0238BBAC:
	ldr r5, _0238C17C @ =0x000006F2
	ldr r1, _0238C180 @ =0x00002C07
	sub r3, r5, #0x5b0
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BBD8:
	ldr r4, _0238C160 @ =0x00003028
	b _0238BD6C
_0238BBE0:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BBFC
	cmp r1, #1
	beq _0238BC28
	b _0238BC48
_0238BBFC:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd0]
	ldr r5, _0238C184 @ =0x000006EC
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BC48
_0238BC28:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C188 @ =0x000006ED
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BC48:
	ldr r4, _0238C160 @ =0x00003028
	b _0238BD6C
_0238BC50:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	bne _0238BC80
	ldr r1, _0238C14C @ =0x00000142
	mov r5, #0x6f0
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BC80:
	ldr r4, _0238C160 @ =0x00003028
	b _0238BD6C
_0238BC88:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BCA4
	cmp r1, #1
	beq _0238BCD4
	b _0238BCF4
_0238BCA4:
	mov r1, #0x32
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	ldr r1, _0238C18C @ =0x00002C09
	ldr r5, _0238C190 @ =0x000006F3
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BCF4
_0238BCD4:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C194 @ =0x000006F4
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BCF4:
	ldr r4, _0238C144 @ =0x00003018
	b _0238BD6C
_0238BCFC:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BD18
	cmp r1, #1
	beq _0238BD48
	b _0238BD68
_0238BD18:
	ldr r3, _0238C198 @ =0x000001E3
	ldr r1, _0238C18C @ =0x00002C09
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	ldr r5, _0238C19C @ =0x000006F5
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BD68
_0238BD48:
	ldr r1, _0238C14C @ =0x00000142
	ldr r5, _0238C1A0 @ =0x000006F6
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BD68:
	ldr r4, _0238C144 @ =0x00003018
_0238BD6C:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r2, [r0]
	ldr r1, [r2, #0x114]
	cmp r1, r5
	beq _0238BDA4
	str r5, [r2, #0x114]
	ldr r3, [r0]
	mov r1, r4
	ldr r2, [r3, #0x114]
	ldrsb r0, [r3, #1]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	add r3, r3, #0xa4
	bl ShowMessageInDBox
_0238BDA4:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	beq _0238BE30
	ldrsb r1, [r1, #2]
	mvn r0, #1
	cmp r1, r0
	bne _0238BE30
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238C12C @ =0x0238DB80
	mov r1, #0x32
	ldr r3, [r2]
	strb r0, [r3, #2]
	ldr r0, [r2]
	add r0, r0, #0xf4
	bl InitPortraitBoxWithMonsterId
	ldr r0, _0238C12C @ =0x0238DB80
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xf4
	bl SetPortraitUnknownAttr
	ldr r0, _0238C12C @ =0x0238DB80
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xf4
	bl SetPortraitExpressionId
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldrsb r0, [r1, #2]
	add r1, r1, #0xf4
	bl ShowPortraitBox
_0238BE30:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	beq _0238BE6C
	ldrsb r1, [r1, #3]
	mvn r0, #1
	cmp r1, r0
	bne _0238BE6C
	ldr r0, _0238C1A4 @ =0x0238D9F8
	ldr r1, _0238C1A8 @ =0x0238ACEC
	bl sub_0202F8C4
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #3]
_0238BE6C:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	beq _0238BEA8
	ldrsb r1, [r1, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238BEA8
	ldr r0, _0238C1AC @ =0x0238D988
	ldr r1, _0238C1B0 @ =ov14_0238AD04
	bl sub_0202F8C4
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238BEA8:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	beq _0238BEE4
	ldrsb r1, [r1, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238BEE4
	ldr r0, _0238C1B4 @ =0x0238D998
	ldr r1, _0238C1B0 @ =ov14_0238AD04
	bl sub_0202F8C4
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238BEE4:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	beq _0238BF24
	ldrsb r1, [r1, #6]
	mvn r0, #1
	cmp r1, r0
	bne _0238BF24
	mov r0, #0
	mov r2, r0
	mov r1, #3
	bl CreatePortraitBox
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #6]
_0238BF24:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	beq _0238BF64
	ldrsb r1, [r1, #7]
	mvn r0, #1
	cmp r1, r0
	bne _0238BF64
	mov r0, #0
	mov r2, r0
	mov r1, #4
	bl CreatePortraitBox
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #7]
_0238BF64:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	beq _0238BFA4
	ldrsb r1, [r1, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238BFA4
	mov r0, #0
	mov r2, r0
	mov r1, #5
	bl CreatePortraitBox
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #8]
_0238BFA4:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	beq _0238BFE4
	ldrsb r1, [r1, #9]
	mvn r0, #1
	cmp r1, r0
	bne _0238BFE4
	mov r0, #0
	mov r2, r0
	mov r1, #6
	bl CreatePortraitBox
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #9]
_0238BFE4:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40000000
	beq _0238C030
	ldrsb r1, [r1, #0xa]
	mvn r0, #1
	cmp r1, r0
	bne _0238C030
	ldr r0, _0238C1B8 @ =0x0238D9A8
	mov r4, #8
	ldr r3, _0238C1BC @ =0x0238DAA0
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #0xa]
_0238C030:
	ldr r0, _0238C12C @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80000000
	beq _0238C07C
	ldrsb r1, [r1, #0xb]
	mvn r0, #1
	cmp r1, r0
	bne _0238C07C
	ldr r0, _0238C1C0 @ =0x0238D9E8
	mov r4, #2
	ldr r3, _0238C1C4 @ =0x0238DA08
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateNormalMenu
	ldr r1, _0238C12C @ =0x0238DB80
	ldr r1, [r1]
	strb r0, [r1, #0xb]
_0238C07C:
	ldr r0, _0238C12C @ =0x0238DB80
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x10c]
	b _0238C0D8
_0238C090:
	ldr r0, [r2, #0x118]
	tst r0, #2
	beq _0238C0B0
	ldrsb r0, [r2, #1]
	bl IsDBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238C0B4
_0238C0B0:
	mov r0, #1
_0238C0B4:
	cmp r0, #0
	beq _0238C0D8
	ldr r0, _0238C12C @ =0x0238DB80
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x10c]
	ldr r1, [r0]
	ldr r0, [r1, #0x110]
	str r0, [r1, #0x108]
_0238C0D8:
	mov r0, #1
	b _0238C124
_0238C0E0:
	bl ov14_0238A6B0
	cmp r0, #0
	ldrne r0, _0238C12C @ =0x0238DB80
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x104]
	b _0238C120
_0238C0FC:
	mov r1, #3
	str r1, [r2, #0x104]
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x890]
	bl ov11_022E6E8C
	bl ov14_0238B708
	mov r0, #4
	b _0238C124
_0238C120:
	mov r0, #1
_0238C124:
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0238C12C: .4byte 0x0238DB80
_0238C130: .4byte 0x0238DB94
_0238C134: .4byte 0x04080800
_0238C138: .4byte 0x0238D9C8
_0238C13C: .4byte ov14_0238ABA0
_0238C140: .4byte 0x0238D9D8
_0238C144: .4byte 0x00003018
_0238C148: .4byte 0x0238D9B8
_0238C14C: .4byte 0x00000142
_0238C150: .4byte 0x000006D9
_0238C154: .4byte 0x000006D8
_0238C158: .4byte 0x000006DA
_0238C15C: .4byte 0x000006DB
_0238C160: .4byte 0x00003028
_0238C164: .4byte 0x000006EB
_0238C168: .4byte 0x000006DC
_0238C16C: .4byte 0x000006EE
_0238C170: .4byte 0x000006EF
_0238C174: .4byte 0x00002311
_0238C178: .4byte 0x000006F1
_0238C17C: .4byte 0x000006F2
_0238C180: .4byte 0x00002C07
_0238C184: .4byte 0x000006EC
_0238C188: .4byte 0x000006ED
_0238C18C: .4byte 0x00002C09
_0238C190: .4byte 0x000006F3
_0238C194: .4byte 0x000006F4
_0238C198: .4byte 0x000001E3
_0238C19C: .4byte 0x000006F5
_0238C1A0: .4byte 0x000006F6
_0238C1A4: .4byte 0x0238D9F8
_0238C1A8: .4byte 0x0238ACEC
_0238C1AC: .4byte 0x0238D988
_0238C1B0: .4byte ov14_0238AD04
_0238C1B4: .4byte 0x0238D998
_0238C1B8: .4byte 0x0238D9A8
_0238C1BC: .4byte 0x0238DAA0
_0238C1C0: .4byte 0x0238D9E8
_0238C1C4: .4byte 0x0238DA08
	arm_func_end SentryRunState

	arm_func_start SentrySetStateIntermediate
SentrySetStateIntermediate: @ 0x0238C1C8
	ldr r1, _0238C1E4 @ =0x0238DB80
	mov r3, #3
	ldr r2, [r1]
	str r3, [r2, #0x10c]
	ldr r1, [r1]
	str r0, [r1, #0x110]
	bx lr
	.align 2, 0
_0238C1E4: .4byte 0x0238DB80
	arm_func_end SentrySetStateIntermediate

	arm_func_start SentryState0
SentryState0: @ 0x0238C1E8
	ldr r0, _0238C208 @ =0x0238DB80
	mov r3, #0x80000000
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C208: .4byte 0x0238DB80
	arm_func_end SentryState0

	arm_func_start SentryState1
SentryState1: @ 0x0238C20C
	push {r3, lr}
	ldr r0, _0238C260 @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl IsNormalMenuActive
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0238C260 @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl GetNormalMenuResult
	cmp r0, #8
	beq _0238C248
	cmp r0, #9
	beq _0238C254
_0238C248:
	mov r0, #2
	bl SentrySetStateIntermediate
	pop {r3, pc}
_0238C254:
	mov r0, #6
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238C260: .4byte 0x0238DB80
	arm_func_end SentryState1

	arm_func_start SentryState2
SentryState2: @ 0x0238C264
	ldr r0, _0238C284 @ =0x0238DB80
	mov r3, #0x40000000
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C284: .4byte 0x0238DB80
	arm_func_end SentryState2

	arm_func_start SentryState3
SentryState3: @ 0x0238C288
	push {r3, lr}
	ldr r0, _0238C3AC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl IsNormalMenuActive
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0238C3AC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl GetNormalMenuResult
	add r0, r0, #1
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0238C3A4
_0238C2C4: @ jump table
	b _0238C3A4 @ case 0
	b _0238C2E8 @ case 1
	b _0238C300 @ case 2
	b _0238C318 @ case 3
	b _0238C330 @ case 4
	b _0238C348 @ case 5
	b _0238C360 @ case 6
	b _0238C378 @ case 7
	b _0238C390 @ case 8
_0238C2E8:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C300:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C318:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C330:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C348:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C360:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #5
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C378:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
	b _0238C3A4
_0238C390:
	ldr r0, _0238C3AC @ =0x0238DB80
	mov r1, #7
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x890]
_0238C3A4:
	bl SentrySetExitingState
	pop {r3, pc}
	.align 2, 0
_0238C3AC: .4byte 0x0238DB80
	arm_func_end SentryState3

	arm_func_start SentryState4
SentryState4: @ 0x0238C3B0
	ldr r0, _0238C3D0 @ =0x0238DB80
	mov r3, #3
	ldr r2, [r0]
	mov r1, #5
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C3D0: .4byte 0x0238DB80
	arm_func_end SentryState4

	arm_func_start SentrySetExitingState
SentrySetExitingState: @ 0x0238C3D4
	ldr ip, _0238C3DC @ =SentrySetExitingState
	bx ip
	.align 2, 0
_0238C3DC: .4byte SentrySetExitingState
	arm_func_end SentrySetExitingState

	arm_func_start SentryState6
SentryState6: @ 0x0238C3E0
	ldr r0, _0238C400 @ =0x0238DB80
	mov r3, #3
	ldr r2, [r0]
	mov r1, #7
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C400: .4byte 0x0238DB80
	arm_func_end SentryState6

	arm_func_start SentryState7
SentryState7: @ 0x0238C404
	ldr r0, _0238C418 @ =0x0238DB80
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C418: .4byte 0x0238DB80
	arm_func_end SentryState7

	arm_func_start SentryState8
SentryState8: @ 0x0238C41C
	ldr r0, _0238C43C @ =0x0238DB80
	mov r3, #3
	ldr r2, [r0]
	mov r1, #9
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C43C: .4byte 0x0238DB80
	arm_func_end SentryState8

	arm_func_start SentryState9
SentryState9: @ 0x0238C440
	ldr r0, _0238C460 @ =0x0238DB80
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0xc
	str r3, [r2, #0x118]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C460: .4byte 0x0238DB80
	arm_func_end SentryState9

	arm_func_start SentryStateA
SentryStateA: @ 0x0238C464
	ldr r0, _0238C478 @ =0x0238DB80
	mov r1, #0xb
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C478: .4byte 0x0238DB80
	arm_func_end SentryStateA

	arm_func_start SentryStateB
SentryStateB: @ 0x0238C47C
	ldr r0, _0238C490 @ =0x0238DB80
	mov r1, #0xc
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238C490: .4byte 0x0238DB80
	arm_func_end SentryStateB

	arm_func_start SentryStateGenerateChoices
SentryStateGenerateChoices: @ 0x0238C494
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r1, _0238CA58 @ =0x000003FA
	ldr r0, [r0]
	str r1, [r0, #0x118]
	bl GetHero
	mov r6, r0
	bl GetPartner
	ldr r2, _0238CA54 @ =0x0238DB80
	mov r5, r0
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x3000
	str r0, [r1, #0x878]
	ldr r1, [r2]
	ldr r3, _0238CA5C @ =0x000005DC
	add r2, r1, #0x3000
	mov r1, #4
	str r3, [r2, #0x894]
	bl RandRange
	ldr r2, _0238CA54 @ =0x0238DB80
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x888]
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x3000
	strb r0, [r1, #0x89d]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x89e]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x89f]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x8a0]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	bl ov14_0238AC04
	mov r0, #0
	mov r1, #4
	bl RandRange
	ldr r1, _0238CA54 @ =0x0238DB80
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0x87c]
_0238C564:
	mov r0, #0
	mov r1, #0x65
	bl RandRange
	ldr r2, _0238CA54 @ =0x0238DB80
	ldr r3, _0238CA60 @ =0x020A1BB0
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x880]
	ldr r4, [r2]
	add r0, r4, #0x3000
	ldr r1, [r0, #0x880]
	ldr r0, [r0, #0x87c]
	lsl r1, r1, #1
	add r0, r4, r0, lsl #1
	ldrsh r1, [r3, r1]
	add r0, r0, #0x3800
	strh r1, [r0, #0xa2]
	ldrsh r0, [r6, #4]
	ldr r4, [r2]
	bl FemaleToMaleForm
	add r1, r4, #0x3000
	ldr r1, [r1, #0x87c]
	add r1, r4, r1, lsl #1
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa2]
	cmp r1, r0
	beq _0238C564
	ldr r1, _0238CA54 @ =0x0238DB80
	ldrsh r0, [r5, #4]
	ldr r2, [r1]
	add r1, r2, #0x3000
	ldr r1, [r1, #0x87c]
	add r1, r2, r1, lsl #1
	add r1, r1, #0x3800
	ldrsh r4, [r1, #0xa2]
	bl FemaleToMaleForm
	cmp r4, r0
	ldrne r0, _0238CA64 @ =0x00000119
	cmpne r4, r0
	beq _0238C564
	ldr r0, _0238CA54 @ =0x0238DB80
	mov r8, #0
	ldr r4, [r0]
	add r2, r4, #0x3000
	ldr r0, [r2, #0x884]
	b _0238C640
_0238C61C:
	add r1, r4, r8, lsl #2
	add r1, r1, #0x3000
	ldr r3, [r2, #0x880]
	ldr r1, [r1, #0x8b8]
	cmp r3, r1
	beq _0238C648
	add r1, r8, #1
	lsl r1, r1, #0x10
	asr r8, r1, #0x10
_0238C640:
	cmp r8, r0
	blt _0238C61C
_0238C648:
	cmp r8, r0
	blt _0238C564
	ldr r1, _0238CA54 @ =0x0238DB80
	mov sb, #0
	ldr r2, [r1]
	add r1, r2, #0x3000
	add r0, r2, r0, lsl #2
	ldr r1, [r1, #0x880]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b8]
_0238C670:
	ldr sl, _0238CA54 @ =0x0238DB80
	ldr r0, [sl]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x87c]
	cmp sb, r0
	beq _0238C72C
	ldr r4, _0238CA60 @ =0x020A1BB0
	ldr fp, _0238CA64 @ =0x00000119
_0238C690:
	mov r0, #0
	mov r1, #0x65
	bl RandRange
	lsl r0, r0, #1
	ldrsh r8, [r4, r0]
	ldrsh r0, [r6, #4]
	bl FemaleToMaleForm
	cmp r8, r0
	beq _0238C690
	ldrsh r0, [r5, #4]
	bl FemaleToMaleForm
	cmp r8, r0
	cmpne r8, fp
	beq _0238C690
	ldr r1, [sl]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	cmp r8, r0
	beq _0238C690
	mov r0, #0
	b _0238C710
_0238C6F0:
	add r2, r1, r0, lsl #1
	add r2, r2, #0x3800
	ldrsh r2, [r2, #0xa2]
	cmp r8, r2
	beq _0238C718
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0238C710:
	cmp r0, sb
	blt _0238C6F0
_0238C718:
	cmp r0, sb
	blt _0238C690
	add r0, r1, sb, lsl #1
	add r0, r0, #0x3800
	strh r8, [r0, #0xa2]
_0238C72C:
	add r0, sb, #1
	lsl r0, r0, #0x10
	asr sb, r0, #0x10
	cmp sb, #4
	blt _0238C670
	ldr r0, _0238CA68 @ =0x0238DB2C
	bl DebugPrint0
	ldr r1, _0238CA54 @ =0x0238DB80
	ldr r0, _0238CA6C @ =0x0238DB44
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x880]
	bl DebugPrint0
	ldr r1, _0238CA54 @ =0x0238DB80
	ldr r0, _0238CA70 @ =0x0238DB58
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x87c]
	bl DebugPrint0
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r2, _0238CA74 @ =0x880A0000
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x880]
	add r0, r3, #0x3a8
	add r1, r1, #1
	lsl r1, r1, #0x10
	add r0, r0, #0x3000
	asr r1, r1, #0x10
	bl ov11_022F6FE0
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r1, _0238CA78 @ =0x00001001
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x3a8
	add r0, r0, #0x3000
	bl ov11_022F52E8
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x6c
	add r0, r0, #0x3400
	add r1, r1, #0x1e4
	bl ov11_022F4C64
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r1, _0238CA7C @ =0x00001003
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl ov11_022F52E8
	ldr r1, _0238CA54 @ =0x0238DB80
	mov r2, #0x60
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x8b0]
	ldr r1, [r1]
	add r0, r1, #0x1b4
	add r0, r0, #0x2800
	add r1, r1, #0x120
	bl ov11_022F4C64
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r1, _0238CA80 @ =0x48140000
	ldr r0, [r0]
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F495C
	ldr r0, _0238CA54 @ =0x0238DB80
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F52E8
	ldr r4, _0238CA54 @ =0x0238DB80
	mov sb, #0
	ldr r0, [r4]
	ldr r1, _0238CA84 @ =0x0238D970
	add r0, r0, #0x3000
	str sb, [r0, #0x53c]
	ldr r0, [r4]
	mov fp, #1
	add r0, r0, #0x3000
	str sb, [r0, #0x540]
	ldr r6, [r1]
	ldr r5, [r1, #4]
	str r6, [sp]
	str r5, [sp, #4]
	mvn sl, #1
_0238C88C:
	mov r0, #0xc4
	mul r8, sb, r0
	ldr r1, [r4]
	ldr r2, _0238CA88 @ =0x08120000
	add r0, r1, #0x278
	add r1, r1, sb, lsl #1
	add r1, r1, #0x3800
	add r0, r0, #0x2800
	ldrsh r1, [r1, #0xa2]
	add r0, r0, r8
	bl ov11_022F5BBC
	ldr r0, [r4]
	ldr r1, _0238CA8C @ =0x00000807
	add r0, r0, #0x278
	add r0, r0, #0x2800
	add r0, r0, r8
	mov r2, #7
	bl ov11_022F52E8
	ldr r1, [r4]
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	add r0, r0, r8
	add r1, r1, #0x120
	bl ov11_022F4C64
	ldr r0, [r4]
	ldr r1, _0238CA80 @ =0x48140000
	add r0, r0, #0x188
	add r0, r0, #0x2c00
	add r0, r0, r8
	bl ov11_022F495C
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x3000
	str fp, [r0, #0x544]
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x3000
	str fp, [r0, #0x554]
	ldr r1, [r4]
	add r0, r1, #0x98
	add r0, r0, #0x3000
	add r0, r0, r8
	add r1, r1, #0x120
	bl ov11_022F4C64
	cmp sb, #3
	addls pc, pc, sb, lsl #2
	b _0238C984
_0238C948: @ jump table
	b _0238C958 @ case 0
	b _0238C964 @ case 1
	b _0238C970 @ case 2
	b _0238C97C @ case 3
_0238C958:
	ldr r0, [r4]
	ldrsb r7, [r0, #6]
	b _0238C984
_0238C964:
	ldr r0, [r4]
	ldrsb r7, [r0, #7]
	b _0238C984
_0238C970:
	ldr r0, [r4]
	ldrsb r7, [r0, #8]
	b _0238C984
_0238C97C:
	ldr r0, [r4]
	ldrsb r7, [r0, #9]
_0238C984:
	cmp r7, sl
	beq _0238C9C0
	add r0, sp, #0x10
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	bl InitPortraitBox
	add r0, sp, #0x10
	mov r1, #3
	bl SetPortraitUnknownAttr
	add r0, sp, #0x10
	add r1, sp, #8
	bl SetPortraitAttrStruct
	mov r0, r7
	add r1, sp, #0x10
	bl ShowPortraitBox
_0238C9C0:
	add r0, sb, #1
	lsl r0, r0, #0x10
	asr sb, r0, #0x10
	cmp sb, #4
	blt _0238C88C
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov14_0238AD04
	ldr r0, _0238CA54 @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ov14_0238AD04
	ldr r0, _0238CA54 @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0238CA10
	bl sub_02027B58
_0238CA10:
	ldr r1, _0238CA54 @ =0x0238DB80
	ldr r0, _0238CA90 @ =0x00002C04
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x3000
	strb r2, [r1, #0x870]
	bl sub_02017C80
	ldr r1, _0238CA54 @ =0x0238DB80
	mov r3, #2
	ldr r0, [r1]
	mov r2, #0xd
	add r0, r0, #0x3000
	str r3, [r0, #0x538]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	add sp, sp, #0x20
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238CA54: .4byte 0x0238DB80
_0238CA58: .4byte 0x000003FA
_0238CA5C: .4byte 0x000005DC
_0238CA60: .4byte 0x020A1BB0
_0238CA64: .4byte 0x00000119
_0238CA68: .4byte 0x0238DB2C
_0238CA6C: .4byte 0x0238DB44
_0238CA70: .4byte 0x0238DB58
_0238CA74: .4byte 0x880A0000
_0238CA78: .4byte 0x00001001
_0238CA7C: .4byte 0x00001003
_0238CA80: .4byte 0x48140000
_0238CA84: .4byte 0x0238D970
_0238CA88: .4byte 0x08120000
_0238CA8C: .4byte 0x00000807
_0238CA90: .4byte 0x00002C04
	arm_func_end SentryStateGenerateChoices

	arm_func_start SentryStateGetUserChoice
SentryStateGetUserChoice: @ 0x0238CA94
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x38
	ldr r2, _0238CFA4 @ =0x0238DB80
	mov r1, #0x3c
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x874]
	add r3, r3, #1
	str r3, [r0, #0x874]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x894]
	sub r3, r3, #1
	str r3, [r0, #0x894]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x874]
	bl DivideInt
	lsl r0, r0, #0x10
	asr r8, r0, #0x10
	lsr r1, r8, #0x1f
	rsb r0, r1, r8, lsl #28
	add r0, r1, r0, ror #28
	bl ov14_0238AC04
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #0x3c
	ldr r4, [r0]
	add r0, r4, #0x3000
	ldr r0, [r0, #0x874]
	bl DivideInt
	cmp r0, #0x10
	bge _0238CDE0
	mov r4, #0
	add r1, sp, #2
	mov r0, r4
	bl sub_020063F4
	add r1, sp, #0
	mov r0, r4
	bl GetPressedButtons
	bl sub_0204AE60
	cmp r0, #0
	beq _0238CBCC
	add r0, sp, #4
	bl GetReleasedStylus
	ldrh r0, [sp, #4]
	tst r0, #2
	beq _0238CBCC
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r4
	ldr r0, _0238CFA8 @ =0x0238DA20
	b _0238CBC4
_0238CB64:
	ldr r6, [r0, r1, lsl #3]
	sub r5, r6, #0x38
	cmp r2, r5
	blt _0238CBB8
	add r5, r6, #0x40
	cmp r2, r5
	bgt _0238CBB8
	add r5, r0, r1, lsl #3
	ldr r6, [r5, #4]
	sub r5, r6, #0x20
	cmp r3, r5
	blt _0238CBB8
	add r5, r6, #0x28
	cmp r3, r5
	bgt _0238CBB8
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r4, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CBCC
_0238CBB8:
	add r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0238CBC4:
	cmp r1, #4
	blt _0238CB64
_0238CBCC:
	cmp r4, #0
	bne _0238CBEC
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	strhne r0, [sp, #2]
	strhne r0, [sp]
	movne r4, #1
_0238CBEC:
	cmp r4, #0
	beq _0238CCCC
	ldr r1, _0238CFA4 @ =0x0238DB80
	ldr r0, _0238CFAC @ =0x00003F02
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x3000
	str r2, [r1, #0x8ac]
	bl sub_02017C80
	ldr r2, _0238CFA4 @ =0x0238DB80
	ldr r1, [r2]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x878]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	str r0, [r1, #0xa4]
	ldr r4, [r2]
	add r1, r4, #0x3000
	ldr r3, [r1, #0x878]
	ldr r0, [r1, #0x87c]
	cmp r3, r0
	bne _0238CC5C
	mov r2, #5
	mov r0, #0x19
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CC5C:
	add r0, r4, r3, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x554]
	cmp r0, #3
	bne _0238CC7C
	ldr r0, _0238CFB0 @ =0x00003F03
	bl sub_02017C80
	b _0238CCE0
_0238CC7C:
	ldr r0, [r1, #0x898]
	cmp r0, #0
	ble _0238CCB8
	mov r0, #4
	str r0, [r1, #0x538]
	ldr r3, [r2]
	arm_func_end SentryStateGetUserChoice

	arm_func_start ov14_0238CC94
ov14_0238CC94: @ 0x0238CC94
	mov r2, #3
	add r0, r3, #0x3000
	ldr r1, [r0, #0x878]
	mov r0, #0x10
	add r1, r3, r1, lsl #2
	arm_func_end ov14_0238CC94

	arm_func_start ov14_0238CCA8
ov14_0238CCA8: @ 0x0238CCA8
	add r1, r1, #0x3000
	str r2, [r1, #0x554]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CCB8:
	mov r2, #5
	arm_func_end ov14_0238CCA8

	arm_func_start ov14_0238CCBC
ov14_0238CCBC: @ 0x0238CCBC
	mov r0, #0x14
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CCCC:
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #3
	ldr r0, [r0]
	arm_func_end ov14_0238CCBC

	arm_func_start ov14_0238CCD8
ov14_0238CCD8: @ 0x0238CCD8
	add r0, r0, #0x3000
	str r1, [r0, #0x538]
_0238CCE0:
	ldrh r0, [sp, #2]
	tst r0, #0xf0
	beq _0238CCF4
	ldr r0, _0238CFB4 @ =0x00003F01
	arm_func_end ov14_0238CCD8

	arm_func_start ov14_0238CCF0
ov14_0238CCF0: @ 0x0238CCF0
	bl sub_02017C80
_0238CCF4:
	ldr r0, _0238CFA4 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x878]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238CF14
_0238CD10: @ jump table
	b _0238CD20 @ case 0
	b _0238CD50 @ case 1
	b _0238CD80 @ case 2
	b _0238CDB0 @ case 3
_0238CD20:
	ldrh r2, [sp, #2]
	tst r2, #0x80
	movne r1, #2
	strne r1, [r0, #0x878]
	tst r2, #0x10
	beq _0238CF14
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CD50:
	ldrh r2, [sp, #2]
	tst r2, #0x80
	movne r1, #3
	strne r1, [r0, #0x878]
	tst r2, #0x20
	beq _0238CF14
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CD80:
	ldrh r2, [sp, #2]
	tst r2, #0x40
	movne r1, #0
	strne r1, [r0, #0x878]
	tst r2, #0x10
	beq _0238CF14
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CDB0:
	ldrh r2, [sp, #2]
	tst r2, #0x40
	movne r1, #1
	strne r1, [r0, #0x878]
	tst r2, #0x20
	beq _0238CF14
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CDE0:
	add r0, r4, #0x3000
	mov r2, #1
	ldr r1, _0238CFA4 @ =0x0238DB80
	strb r2, [r0, #0x871]
	ldr r0, [r1]
	mov r2, #2
	add r1, r0, #0x3000
	mov r0, #0x12
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CF14
_0238CE0C:
	ldr r4, _0238CFA4 @ =0x0238DB80
	ldr r0, [r4]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89d]
	cmp r1, #0
	bne _0238CF1C
	mov r1, #1
	strb r1, [r0, #0x89d]
	ldr r0, [r4]
	mov sb, #0
	mov r1, #2
	add r0, r0, #0x3000
	ldr r6, _0238CFB8 @ =0x0238D96C
	ldr r5, _0238CFBC @ =0x0238DA80
	str r1, [r0, #0x540]
	add r7, sp, #0x28
	mov sl, sb
_0238CE50:
	mov r0, r7
	bl InitPortraitBox
	ldr r1, [r4]
	mov r0, r7
	add r1, r1, sb, lsl #1
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa2]
	bl InitPortraitBoxWithMonsterId
	ldrb r1, [r6, sb]
	mov r0, r7
	bl SetPortraitUnknownAttr
	mov r0, r7
	add r1, r5, sb, lsl #3
	bl SetPortraitAttrStruct
	mov r0, r7
	mov r1, sl
	bl SetPortraitExpressionId
	cmp sb, #3
	addls pc, pc, sb, lsl #2
	b _0238CEFC
_0238CEA0: @ jump table
	b _0238CEB0 @ case 0
	b _0238CEC4 @ case 1
	b _0238CED8 @ case 2
	b _0238CEEC @ case 3
_0238CEB0:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #6]
	bl ShowPortraitBox
	b _0238CEFC
_0238CEC4:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #7]
	bl ShowPortraitBox
	b _0238CEFC
_0238CED8:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #8]
	bl ShowPortraitBox
	b _0238CEFC
_0238CEEC:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #9]
	bl ShowPortraitBox
_0238CEFC:
	add r0, sb, #1
	lsl r0, r0, #0x10
	asr sb, r0, #0x10
	cmp sb, #4
	blt _0238CE50
	b _0238CF1C
_0238CF14:
	cmp r8, #2
	bge _0238CE0C
_0238CF1C:
	cmp r8, #5
	blt _0238CF5C
	ldr r0, _0238CFA4 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x89e]
	cmp r0, #0
	bne _0238CF5C
	bl ov14_0238AC40
	ldr r0, _0238CFC0 @ =0x00002C06
	bl sub_02017C80
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x89e]
_0238CF5C:
	cmp r8, #0xb
	blt _0238CF9C
	ldr r0, _0238CFA4 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x89f]
	cmp r0, #0
	bne _0238CF9C
	bl ov14_0238AC40
	ldr r0, _0238CFC0 @ =0x00002C06
	bl sub_02017C80
	ldr r0, _0238CFA4 @ =0x0238DB80
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x89f]
_0238CF9C:
	add sp, sp, #0x38
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238CFA4: .4byte 0x0238DB80
_0238CFA8: .4byte 0x0238DA20
_0238CFAC: .4byte 0x00003F02
_0238CFB0: .4byte 0x00003F03
_0238CFB4: .4byte 0x00003F01
_0238CFB8: .4byte 0x0238D96C
_0238CFBC: .4byte 0x0238DA80
_0238CFC0: .4byte 0x00002C06
	arm_func_end ov14_0238CCF0

	arm_func_start SentryStateFinalizeRound
SentryStateFinalizeRound: @ 0x0238CFC4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r2, _0238D2FC @ =0x0238DB80
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x3000
	ldrb r4, [r1, #0x870]
	strb r0, [r1, #0x870]
	ldr r1, [r2]
	add r1, r1, #0x3000
	ldr r3, [r1, #0x884]
	add r3, r3, #1
	str r3, [r1, #0x884]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	bl ov14_0238AC04
	cmp r4, #0
	beq _0238D078
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3a8
	add r0, r0, #0x3000
	bl ov11_022F4BE4
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl ov11_022F4BE4
	ldr r1, _0238D2FC @ =0x0238DB80
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x3000
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	ldr r0, [r1]
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F4BE4
_0238D078:
	ldr r0, _0238D300 @ =0x0238D970
	ldr r4, _0238D2FC @ =0x0238DB80
	ldr r6, [r0, #8]
	ldr r5, [r0, #0xc]
	mov r7, #0
	str r6, [sp]
	str r5, [sp, #4]
	mvn sl, #1
	mov fp, #0xc4
_0238D09C:
	ldr r0, [r4]
	smulbb sb, r7, fp
	add r0, r0, #0x278
	add r0, r0, #0x2800
	add r0, r0, sb
	bl ov11_022F4BE4
	ldr r0, [r4]
	add r0, r0, #0x188
	add r0, r0, #0x2c00
	add r0, r0, sb
	bl ov11_022F4BE4
	ldr r0, [r4]
	add r0, r0, #0x98
	add r0, r0, #0x3000
	add r0, r0, sb
	bl ov11_022F4BE4
	cmp r7, #3
	addls pc, pc, r7, lsl #2
	b _0238D124
_0238D0E8: @ jump table
	b _0238D0F8 @ case 0
	b _0238D104 @ case 1
	b _0238D110 @ case 2
	b _0238D11C @ case 3
_0238D0F8:
	ldr r0, [r4]
	ldrsb r8, [r0, #6]
	b _0238D124
_0238D104:
	ldr r0, [r4]
	ldrsb r8, [r0, #7]
	b _0238D124
_0238D110:
	ldr r0, [r4]
	ldrsb r8, [r0, #8]
	b _0238D124
_0238D11C:
	ldr r0, [r4]
	ldrsb r8, [r0, #9]
_0238D124:
	cmp r8, sl
	beq _0238D160
	add r0, sp, #0x10
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	bl InitPortraitBox
	add r0, sp, #0x10
	mov r1, #3
	bl SetPortraitUnknownAttr
	add r0, sp, #0x10
	add r1, sp, #8
	bl SetPortraitAttrStruct
	mov r0, r8
	add r1, sp, #0x10
	bl ShowPortraitBox
_0238D160:
	add r0, r7, #1
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	cmp r7, #4
	blt _0238D09C
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_02027B58
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl sub_02027AF0
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_02027B58
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl sub_02027AF0
	ldr r1, _0238D2FC @ =0x0238DB80
	ldr r3, [r1]
	add r0, r3, #0x3000
	ldr r2, [r0, #0x884]
	cmp r2, #6
	movlt r0, #0xf
	strlt r0, [r3, #0x110]
	blt _0238D2F4
	mov r2, #0
	str r2, [r0, #0x8ac]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x88c]
	bl SetSentryDutyGamePoints
	cmp r0, #0
	beq _0238D25C
	ldr r1, _0238D2FC @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x890]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x88c]
	cmp r1, #0xfa0
	movgt r1, #1
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r1, _0238D304 @ =0x00001B58
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x88c]
	cmp r2, r1
	movgt r1, #2
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	movne r1, #3
	b _0238D2C0
_0238D25C:
	ldr r1, _0238D2FC @ =0x0238DB80
	mov r2, #4
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x890]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x88c]
	cmp r1, #0xfa0
	movgt r1, #5
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r1, _0238D304 @ =0x00001B58
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x88c]
	cmp r2, r1
	movgt r1, #6
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	movne r1, #7
_0238D2C0:
	strne r1, [r0, #0x890]
	ldr r0, _0238D2FC @ =0x0238DB80
	ldr r1, [r0]
	ldr r0, [r1, #0x11c]
	cmp r0, #0
	beq _0238D2EC
	cmp r0, #1
	bne _0238D2EC
	mov r0, #0x1e
	str r0, [r1, #0x110]
	b _0238D2F4
_0238D2EC:
	mov r0, #0x20
	str r0, [r1, #0x110]
_0238D2F4:
	add sp, sp, #0x20
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238D2FC: .4byte 0x0238DB80
_0238D300: .4byte 0x0238D970
_0238D304: .4byte 0x00001B58
	arm_func_end SentryStateFinalizeRound

	arm_func_start SentryStateF
SentryStateF: @ 0x0238D308
	ldr r0, _0238D31C @ =0x0238DB80
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D31C: .4byte 0x0238DB80
	arm_func_end SentryStateF

	arm_func_start SentryState10
SentryState10: @ 0x0238D320
	push {r3, lr}
	ldr r2, _0238D390 @ =0x0238DB80
	mvn r1, #1
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x898]
	sub r3, r3, #1
	str r3, [r0, #0x898]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x894]
	sub r3, r3, #0xfa
	str r3, [r0, #0x894]
	ldr r0, [r2]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0238D368
	bl sub_02027B58
_0238D368:
	ldr r0, _0238D394 @ =0x00002C08
	bl sub_02017C80
	ldr r0, _0238D390 @ =0x0238DB80
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #0x11
	str r3, [r2, #0x114]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	pop {r3, pc}
	.align 2, 0
_0238D390: .4byte 0x0238DB80
_0238D394: .4byte 0x00002C08
	arm_func_end SentryState10

	arm_func_start SentryState11
SentryState11: @ 0x0238D398
	ldr r0, _0238D3AC @ =0x0238DB80
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D3AC: .4byte 0x0238DB80
	arm_func_end SentryState11

	arm_func_start SentryState12
SentryState12: @ 0x0238D3B0
	ldr r1, _0238D3E0 @ =0x0238DB80
	mov r2, #0
	ldr r0, [r1]
	ldr r3, _0238D3E4 @ =0x00002311
	add r0, r0, #0x3000
	strb r2, [r0, #0x89c]
	ldr r0, [r1]
	mov r2, #0x13
	str r3, [r0, #0xc8]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D3E0: .4byte 0x0238DB80
_0238D3E4: .4byte 0x00002311
	arm_func_end SentryState12

	arm_func_start SentryState13
SentryState13: @ 0x0238D3E8
	ldr r1, _0238D40C @ =0x0238DB80
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0x17
	add r0, r0, #0x3000
	str r3, [r0, #0x8ac]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D40C: .4byte 0x0238DB80
	arm_func_end SentryState13

	arm_func_start SentryState14
SentryState14: @ 0x0238D410
	ldr r0, _0238D424 @ =0x0238DB80
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D424: .4byte 0x0238DB80
	arm_func_end SentryState14

	arm_func_start SentryState15
SentryState15: @ 0x0238D428
	push {r3, lr}
	ldr r0, _0238D464 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D450
	mov r0, #0x14
	bl SentrySetStateIntermediate
	pop {r3, pc}
_0238D450:
	mov r0, #0x304
	bl sub_02017C80
	mov r0, #0x16
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D464: .4byte 0x0238DB80
	arm_func_end SentryState15

	arm_func_start SentryState16
SentryState16: @ 0x0238D468
	push {r3, lr}
	ldr r2, _0238D4BC @ =0x0238DB80
	mvn r1, #0x3f
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	sub r3, r3, #4
	str r3, [r0, #0x8b0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	cmp r3, r1
	popge {r3, pc}
	mov r3, #0
	strb r3, [r0, #0x89c]
	ldr r1, [r2]
	mov r0, #0x17
	add r1, r1, #0x3000
	str r3, [r1, #0x8ac]
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D4BC: .4byte 0x0238DB80
	arm_func_end SentryState16

	arm_func_start SentryState17
SentryState17: @ 0x0238D4C0
	ldr r1, _0238D534 @ =0x0238DB80
	mov r3, #4
	ldr r2, [r1]
	add r0, r2, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	str r0, [r2, #0xa4]
	ldr r2, [r1]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x871]
	cmp r1, #0
	ldreq r0, [r0, #0x878]
	moveq r1, #3
	addeq r0, r2, r0, lsl #2
	addeq r0, r0, #0x3000
	streq r1, [r0, #0x554]
	ldr r1, _0238D534 @ =0x0238DB80
	mov r2, #0x18
	ldr ip, [r1]
	add r0, ip, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, ip, r0, lsl #2
	add r0, r0, #0x3000
	str r3, [r0, #0x554]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D534: .4byte 0x0238DB80
	arm_func_end SentryState17

	arm_func_start SentryState18
SentryState18: @ 0x0238D538
	push {r3, lr}
	ldr r0, _0238D56C @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D560
	mov r0, #0x17
	bl SentrySetStateIntermediate
	pop {r3, pc}
_0238D560:
	mov r0, #0xe
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D56C: .4byte 0x0238DB80
	arm_func_end SentryState18

	arm_func_start SentryState19
SentryState19: @ 0x0238D570
	ldr r0, _0238D584 @ =0x0238DB80
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D584: .4byte 0x0238DB80
	arm_func_end SentryState19

	arm_func_start SentryState1A
SentryState1A: @ 0x0238D588
	push {r3, lr}
	ldr r0, _0238D5C4 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D5B0
	mov r0, #0x19
	bl SentrySetStateIntermediate
	pop {r3, pc}
_0238D5B0:
	mov r0, #0x304
	bl sub_02017C80
	mov r0, #0x1b
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D5C4: .4byte 0x0238DB80
	arm_func_end SentryState1A

	arm_func_start SentryStateFinalizePoints
SentryStateFinalizePoints: @ 0x0238D5C8
	push {r3, lr}
	ldr r2, _0238D654 @ =0x0238DB80
	mvn r1, #0x3f
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	sub r3, r3, #4
	str r3, [r0, #0x8b0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	cmp r3, r1
	popge {r3, pc}
	ldr r3, [r0, #0x88c]
	ldr r1, [r0, #0x894]
	add r1, r3, r1
	str r1, [r0, #0x88c]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x884]
	cmp r1, #5
	bne _0238D634
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	ldrne r1, [r0, #0x88c]
	addne r1, r1, #0x7d0
	strne r1, [r0, #0x88c]
_0238D634:
	ldr r0, _0238D654 @ =0x0238DB80
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x1c
	add r1, r1, #0x3000
	str r2, [r1, #0x8ac]
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D654: .4byte 0x0238DB80
	arm_func_end SentryStateFinalizePoints

	arm_func_start SentryState1C
SentryState1C: @ 0x0238D658
	ldr r1, _0238D694 @ =0x0238DB80
	ldr r2, _0238D698 @ =0x00002310
	ldr r0, [r1]
	mov r3, #2
	str r2, [r0, #0xc8]
	ldr ip, [r1]
	mov r2, #0x1d
	add r0, ip, #0x3000
	ldr r0, [r0, #0x878]
	add r0, ip, r0, lsl #2
	add r0, r0, #0x3000
	str r3, [r0, #0x554]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D694: .4byte 0x0238DB80
_0238D698: .4byte 0x00002310
	arm_func_end SentryState1C

	arm_func_start SentryState1D
SentryState1D: @ 0x0238D69C
	push {r3, lr}
	ldr r0, _0238D6FC @ =0x0238DB80
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #1
	bne _0238D6CC
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	beq _0238D6CC
	bl sub_02027B58
_0238D6CC:
	ldr r0, _0238D6FC @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #1
	bge _0238D6F0
	mov r0, #0x1c
	bl SentrySetStateIntermediate
	pop {r3, pc}
_0238D6F0:
	mov r0, #0xe
	bl SentrySetStateIntermediate
	pop {r3, pc}
	.align 2, 0
_0238D6FC: .4byte 0x0238DB80
	arm_func_end SentryState1D

	arm_func_start SentryState1E
SentryState1E: @ 0x0238D700
	ldr r0, _0238D714 @ =0x0238DB80
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D714: .4byte 0x0238DB80
	arm_func_end SentryState1E

	arm_func_start SentryState1F
SentryState1F: @ 0x0238D718
	push {r3, lr}
	ldr r0, _0238D790 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	cmp r1, #2
	bge _0238D754
	mov r0, #0x1e
	bl SentrySetStateIntermediate
	ldr r0, _0238D790 @ =0x0238DB80
	mov r1, #0x1e
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b4]
	pop {r3, pc}
_0238D754:
	ldr r0, [r0, #0x8b4]
	cmp r0, #0x1e
	bne _0238D768
	mov r0, #0x1e
	bl sub_02017F28
_0238D768:
	ldr r0, _0238D790 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8b4]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x8b4]
	popgt {r3, pc}
	bl SentrySetExitingState
	pop {r3, pc}
	.align 2, 0
_0238D790: .4byte 0x0238DB80
	arm_func_end SentryState1F

	arm_func_start SentryState20
SentryState20: @ 0x0238D794
	ldr r0, _0238D7A8 @ =0x0238DB80
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D7A8: .4byte 0x0238DB80
	arm_func_end SentryState20

	arm_func_start SentryState21
SentryState21: @ 0x0238D7AC
	push {r3, lr}
	ldr r0, _0238D824 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	cmp r1, #2
	bge _0238D7E8
	mov r0, #0x20
	bl SentrySetStateIntermediate
	ldr r0, _0238D824 @ =0x0238DB80
	mov r1, #0x1e
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b4]
	pop {r3, pc}
_0238D7E8:
	ldr r0, [r0, #0x8b4]
	cmp r0, #0x1e
	bne _0238D7FC
	mov r0, #0x1e
	bl sub_02017F28
_0238D7FC:
	ldr r0, _0238D824 @ =0x0238DB80
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8b4]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x8b4]
	popgt {r3, pc}
	bl SentrySetExitingState
	pop {r3, pc}
	.align 2, 0
_0238D824: .4byte 0x0238DB80
	arm_func_end SentryState21

	arm_func_start ov14_0238D828
ov14_0238D828: @ 0x0238D828
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r4, r3
	ldr r7, [sb]
	bl Strlen
	ldr r2, [sp, #0x30]
	mov r6, #0
	cmp r0, r2
	ldrlt r1, [r8]
	sublt r0, r2, r0
	addlt r0, r1, r0, lsl #3
	strlt r0, [r8]
	lsl r0, r4, #8
	str r0, [sp, #4]
	add r5, sp, #0
	ldr fp, _0238D968 @ =0x0000080F
	mov r4, r6
	b _0238D950
_0238D87C:
	ldrb r1, [sl], #1
	ldr r0, [r8]
	lsl r0, r0, #8
	str r0, [sp]
	cmp r1, #0x30
	blo _0238D8DC
	cmp r1, #0x39
	bhi _0238D8DC
	sub r0, r1, #0x2b
	orr r0, r0, #0x800
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	ldr r2, [r8]
	mov r0, r7
	add r2, r2, #8
	str r2, [r8]
	mov r2, r6
	bl ov11_022F52E8
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl ov11_022F6F14
	add r7, r7, #0xc4
	b _0238D950
_0238D8DC:
	cmp r1, #0x2f
	bne _0238D918
	ldr r1, [r8]
	mov r0, r7
	add r1, r1, #8
	str r1, [r8]
	mov r1, fp
	mov r2, #0
	bl ov11_022F52E8
	mov r0, r7
	mov r1, r5
	mov r2, #0
	bl ov11_022F6F14
	add r7, r7, #0xc4
	b _0238D950
_0238D918:
	cmp r1, #0x50
	bne _0238D950
	ldr r1, [r8]
	mov r0, r7
	add r1, r1, #8
	str r1, [r8]
	mov r1, #0x810
	mov r2, #0
	bl ov11_022F52E8
	mov r0, r7
	mov r1, r5
	mov r2, #0
	bl ov11_022F6F14
	add r7, r7, #0xc4
_0238D950:
	ldrb r0, [sl]
	cmp r0, #0
	bne _0238D87C
	str r7, [sb]
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238D968: .4byte 0x0000080F
	arm_func_end ov14_0238D828
	@ 0x0238D96C
