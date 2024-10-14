	.include "asm/macros.inc"
	.include "overlay_29_022DC2B8.inc"

	.text

	arm_func_start ov29_022DC2B8
ov29_022DC2B8: ; 0x022DC2B8
	stmdb sp!, {r3, lr}
	ldr r1, _022DC30C ; =0x00019628
	mov ip, #0
	strh ip, [r0, r1]
	add r2, r1, #0xa
	add r1, r1, #0xc
	ldrsh r2, [r0, r2]
	ldrsh r1, [r0, r1]
	mov lr, ip
	smulbb r1, r2, r1
	mov r3, r1, lsl #0x10
	ldr r1, _022DC310 ; =0x00017704
	b _022DC300
_022DC2EC:
	add r2, ip, #1
	add ip, r0, ip, lsl #1
	mov r2, r2, lsl #0x10
	strh lr, [ip, r1]
	mov ip, r2, asr #0x10
_022DC300:
	cmp ip, r3, asr #16
	blt _022DC2EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC30C: .word 0x00019628
_022DC310: .word 0x00017704
	arm_func_end ov29_022DC2B8

	arm_func_start ov29_022DC314
ov29_022DC314: ; 0x022DC314
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _022DC338 ; =ov29_0234FD14
	mov r4, r1
	bl Debug_Print0
	mov r0, r5
	mov r1, r4
	bl sub_02008BF4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DC338: .word ov29_0234FD14
	arm_func_end ov29_022DC314

	arm_func_start ov29_022DC33C
ov29_022DC33C: ; 0x022DC33C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _022DC52C ; =0x00019628
	mov r6, r0
	ldrh r0, [r6, r1]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, _022DC530 ; =ov29_02353880
	mov r1, #0
	ldrh r4, [r2, #0x14]
	ldrh r3, [sp]
	mov r0, #0x1000
	bic r4, r4, #0x700
	bic r3, r3, #0x700
	orr r4, r4, #0x200
	orr r3, r3, #0x200
	strh r4, [r2, #0x14]
	strh r3, [sp]
	ldrh r5, [r2, #0x14]
	ldrh r4, [sp]
	ldr r3, _022DC534 ; =_020AFC70
	bic r5, r5, #7
	bic r4, r4, #7
	orr r5, r5, #5
	orr r4, r4, #5
	strh r5, [r2, #0x14]
	ldrh r5, [r2, #0x14]
	strh r4, [sp]
	ldrh r4, [sp]
	ldr r7, _022DC538 ; =0x00007FFF
	bic r5, r5, #0x38
	orr r8, r5, #0x28
	bic r4, r4, #0x38
	mov r5, #0x1f
	orr r4, r4, #0x28
	ldr r3, [r3]
	strh r1, [r2, #0x16]
	strh r1, [r2, #0x18]
	strh r1, [r2, #0x1a]
	strh r1, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	strh r1, [r2, #0x24]
	str r1, [r2, #4]
	str r1, [r2, #8]
	strb r1, [r2, #0x26]
	strh r1, [r2, #2]
	strh r8, [r2, #0x14]
	strh r7, [r2, #0x22]
	strb r5, [r2, #0x27]
	strh r4, [sp]
	ldr r4, [r3, #0xe0]
	add r0, sp, #0
	mov r1, #0x1b000
	bl sub_01FF8130
	add r0, sp, #0
	add r1, r4, #0x3c00
	bl sub_01FF81CC
	ldr r0, _022DC53C ; =0x00018304
	mov r5, #0
	ldr r4, _022DC530 ; =ov29_02353880
	add fp, r0, #2
	add r7, r0, #4
	add r8, r0, #6
	add sb, r0, #8
	add sl, r0, #0xa
	b _022DC518
_022DC454:
	mov r0, #0xe
	smlabb r3, r5, r0, r6
	add r0, r3, #0x18000
	ldrb r1, [r0, #0x311]
	cmp r1, #0
	beq _022DC50C
	ldrb r2, [r0, #0x310]
	ldr r0, _022DC53C ; =0x00018304
	ldrsh r1, [r3, r0]
	ldrh r0, [r4, #0x14]
	and ip, r2, #3
	strh r1, [r4, #0x16]
	bic r0, r0, #0x700
	orr r1, r0, #0x200
	ldr r0, _022DC540 ; =ov29_0234FD04
	ldrsh lr, [r3, fp]
	ldrb r2, [r0, ip, lsl #2]
	add ip, r0, ip, lsl #2
	strh lr, [r4, #0x18]
	and r0, r2, #0xf8
	ldrsh r2, [r3, r7]
	ldrb lr, [ip, #2]
	ldrb ip, [ip, #1]
	strh r2, [r4, #0xc]
	and r2, lr, #0xf8
	and ip, ip, #0xf8
	mov r2, r2, lsl #0x17
	mov ip, ip, lsl #2
	orr r2, ip, r2, lsr #16
	ldrsh ip, [r3, r8]
	orr r2, r2, r0, asr #3
	mov r0, r4
	strh ip, [r4, #0xe]
	ldrsh ip, [r3, sb]
	strh ip, [r4, #0x10]
	ldrsh r3, [r3, sl]
	strh r1, [r4, #0x14]
	mov r1, #0
	strh r1, [r4, #2]
	mov r1, #0x1f
	strb r1, [r4, #0x27]
	mov r1, #3
	strh r3, [r4, #0x12]
	strh r2, [r4, #0x22]
	strh r1, [r4]
	bl sub_01FF8C60
_022DC50C:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_022DC518:
	ldr r0, _022DC52C ; =0x00019628
	ldrh r0, [r6, r0]
	cmp r5, r0
	blt _022DC454
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DC52C: .word 0x00019628
_022DC530: .word ov29_02353880
_022DC534: .word _020AFC70
_022DC538: .word 0x00007FFF
_022DC53C: .word 0x00018304
_022DC540: .word ov29_0234FD04
	arm_func_end ov29_022DC33C

	arm_func_start ov29_022DC544
ov29_022DC544: ; 0x022DC544
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022DC604 ; =ov29_023534E8
	mov r2, #0x300
	ldr r1, [r1, r0, lsl #2]
	add r0, sp, #0
	bl LoadFileFromRom
	ldr r4, [sp]
	ldr r2, [sp, #4]
	mov r0, r4
	mov r1, #0x1b000
	mov r3, #0
	bl sub_0201E050
	mov r1, #0
	mov r0, r4
	mov r2, r1
	mov r3, #2
	bl sub_0201E050
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC60C ; =ov29_0234FD48
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #0
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC610 ; =ov29_0234FD4C
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #1
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC614 ; =ov29_0234FD50
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #2
	bl sub_0201E380
	ldr r0, _022DC608 ; =_020AFC70
	ldr r1, _022DC618 ; =ov29_0234FD54
	ldr r0, [r0]
	mov r2, #0x1e
	add r0, r0, #0xcc
	mov r3, #3
	bl sub_0201E380
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DC604: .word ov29_023534E8
_022DC608: .word _020AFC70
_022DC60C: .word ov29_0234FD48
_022DC610: .word ov29_0234FD4C
_022DC614: .word ov29_0234FD50
_022DC618: .word ov29_0234FD54
	arm_func_end ov29_022DC544

	arm_func_start ov29_022DC61C
ov29_022DC61C: ; 0x022DC61C
	stmdb sp!, {r3, lr}
	ldr r0, _022DC650 ; =ov29_023538B4
	ldr r1, _022DC654 ; =0x0001963C
	bl MemZero
	mov r0, #0
	bl ov29_022DC544
	ldr r0, _022DC650 ; =ov29_023538B4
	bl ov29_022DC240
	ldr r1, _022DC658 ; =ov29_023534E0
	ldr r0, _022DC650 ; =ov29_023538B4
	ldr r1, [r1]
	bl ov29_022DC314
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DC650: .word ov29_023538B4
_022DC654: .word 0x0001963C
_022DC658: .word ov29_023534E0
	arm_func_end ov29_022DC61C

	arm_func_start ov29_022DC65C
ov29_022DC65C: ; 0x022DC65C
	ldr ip, _022DC668 ; =ov29_022DC2B8
	ldr r0, _022DC66C ; =ov29_023538B4
	bx ip
	.align 2, 0
_022DC668: .word ov29_022DC2B8
_022DC66C: .word ov29_023538B4
	arm_func_end ov29_022DC65C

	arm_func_start ov29_022DC670
ov29_022DC670: ; 0x022DC670
	ldr ip, _022DC67C ; =ov29_022DC33C
	ldr r0, _022DC680 ; =ov29_023538B4
	bx ip
	.align 2, 0
_022DC67C: .word ov29_022DC33C
_022DC680: .word ov29_023538B4
	arm_func_end ov29_022DC670

	arm_func_start ov29_022DC684
ov29_022DC684: ; 0x022DC684
	ldr ip, _022DC690 ; =ov10_022C0998
	mov r1, #1
	bx ip
	.align 2, 0
_022DC690: .word ov10_022C0998
	arm_func_end ov29_022DC684

	arm_func_start ov29_022DC694
ov29_022DC694: ; 0x022DC694
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	bl ov10_022C22A0
	add r0, sp, #0
	mov r1, r4
	bl ov10_022C0814
	mov r0, r5
	mov r1, #0
	mov r2, #1
	bl DrawTeamStats
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_022DC694

	arm_func_start ov29_022DC6D0
ov29_022DC6D0: ; 0x022DC6D0
	ldr ip, _022DC6D8 ; =UpdateTeamStats
	bx ip
	.align 2, 0
_022DC6D8: .word UpdateTeamStats
	arm_func_end ov29_022DC6D0

	arm_func_start ov29_022DC6DC
ov29_022DC6DC: ; 0x022DC6DC
	ldr ip, _022DC6E4 ; =ov10_022C11D8
	bx ip
	.align 2, 0
_022DC6E4: .word ov10_022C11D8
	arm_func_end ov29_022DC6DC

	arm_func_start ov29_022DC6E8
ov29_022DC6E8: ; 0x022DC6E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldrb r4, [sp, #0x20]
	ldrsh ip, [sp, #0x24]
	ldrsh lr, [sp, #0x28]
	stmia sp, {r4, ip}
	str lr, [sp, #8]
	ldrsh ip, [sp, #0x2c]
	ldrsh lr, [sp, #0x30]
	str ip, [sp, #0xc]
	ldrb ip, [sp, #0x34]
	str lr, [sp, #0x10]
	str ip, [sp, #0x14]
	bl ov10_022C0F6C
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	arm_func_end ov29_022DC6E8

	arm_func_start ov29_022DC728
ov29_022DC728: ; 0x022DC728
	stmdb sp!, {r3, lr}
	bl FreeTeamStats
	bl ov10_022C096C
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DC728

	arm_func_start ov29_022DC738
ov29_022DC738: ; 0x022DC738
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	bl ov10_022C22A0
	add r0, sp, #0
	mov r1, r4
	bl ov10_022C0814
	mov r0, r5
	bl ov10_022C14D0
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov29_022DC738

	arm_func_start ov29_022DC76C
ov29_022DC76C: ; 0x022DC76C
	ldr ip, _022DC774 ; =ov10_022C159C
	bx ip
	.align 2, 0
_022DC774: .word ov10_022C159C
	arm_func_end ov29_022DC76C

	arm_func_start ov29_022DC778
ov29_022DC778: ; 0x022DC778
	bx lr
	arm_func_end ov29_022DC778

	arm_func_start ov29_022DC77C
ov29_022DC77C: ; 0x022DC77C
	stmdb sp!, {r3, lr}
	bl FreeMapAndTeam
	bl ov10_022C096C
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DC77C

	arm_func_start ov29_022DC78C
ov29_022DC78C: ; 0x022DC78C
	stmdb sp!, {r4, lr}
	ldr r1, _022DC7E0 ; =ov29_02353518
	mov lr, #0
	ldr r4, [r1]
	mov r1, #0x50
	b _022DC7D0
_022DC7A4:
	mul ip, lr, r1
	add r3, r4, ip
	ldrb r2, [r3, #4]
	cmp r2, #0
	beq _022DC7CC
	ldr r2, [r3, #8]
	cmp r0, r2
	addeq r0, r4, #4
	addeq r0, r0, ip
	ldmeqia sp!, {r4, pc}
_022DC7CC:
	add lr, lr, #1
_022DC7D0:
	cmp lr, #0x16
	blt _022DC7A4
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DC7E0: .word ov29_02353518
	arm_func_end ov29_022DC78C

	arm_func_start ov29_022DC7E4
ov29_022DC7E4: ; 0x022DC7E4
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r3, lr
	mov r2, lr
	b _022DC80C
_022DC7F8:
	mov r0, r0, lsr #1
	mov ip, r1, lsr #1
	orr r0, r0, r1, lsl #31
	mov r1, ip
	add lr, lr, #1
_022DC80C:
	cmp r1, r3
	cmpeq r0, r2
	bne _022DC7F8
	mov r0, lr
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DC7E4

	arm_func_start ov29_022DC820
ov29_022DC820: ; 0x022DC820
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov r8, r1
	mov r1, #0xc
	mul r1, r8, r1
	mov sb, r0
	ldr r0, [sb, #0x10]
	add r4, sb, #0x2c
	ldr r3, [sb, #0xc]
	cmp r0, #0
	add r4, r4, r1
	mov r5, #0
	cmpeq r3, #0
	streq r5, [r4]
	str r2, [sp, #0xc]
	streq r5, [r4, #4]
	beq _022DD084
	ldr r0, [r4, #4]
	ldr r2, [r4]
	cmp r0, r5
	cmpeq r2, r5
	streq r5, [r4, #8]
	ldr r0, [r4, #8]
	moveq r5, #1
	cmp r0, #0
	bgt _022DC99C
	add r0, sb, #0x2c
	cmp r8, #0
	add r0, r0, r1
	moveq r1, #1
	streq r1, [sp, #0x10]
	moveq r1, #0
	streq r1, [sp, #0x14]
	movne r1, #0
	strne r1, [sp, #0x10]
	movne r1, #1
	strne r1, [sp, #0x14]
	cmp r8, #0
	ldr r1, [sb, #0x10]
	moveq sl, #0x80000000
	str r1, [sp, #0x1c]
	ldr r1, [sb, #0xc]
	moveq lr, #0
	str r1, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	movne sl, #0
	movne lr, #1
	cmp r8, #0
	moveq ip, #0x20
	movne ip, #1
	cmp r1, #0
	ldr r1, [sp, #0x18]
	cmpeq r1, #0
	mov r1, #0
	moveq r7, r1
	moveq r6, r1
	beq _022DC978
	ldr r6, [r0, #4]
	ldr r7, [r0]
	cmp r6, r1
	cmpeq r7, r1
	mov r3, #0
	ldreq r7, [sp, #0x10]
	ldreq r6, [sp, #0x14]
	mov r1, r3
	b _022DC968
_022DC928:
	mov r6, r6, lsl #1
	orr r6, r6, r7, lsr #31
	mov r7, r7, lsl #1
	cmp r6, lr
	cmpeq r7, sl
	ldrhi r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldrhi r7, [sp, #0x10]
	and r2, r0, r6
	mov r0, #0
	cmp r2, r0
	ldr r0, [sp, #0x18]
	and r0, r0, r7
	cmpeq r0, r1
	bne _022DC978
	add r3, r3, #1
_022DC968:
	cmp r3, ip
	blt _022DC928
	mov r7, #0
	mov r6, r7
_022DC978:
	ldr r0, [r4, #4]
	ldr r1, [r4]
	cmp r0, r6
	cmpeq r1, r7
	strne r7, [r4]
	strne r6, [r4, #4]
	mov r0, #0x3c
	str r0, [r4, #8]
	b _022DC9A4
_022DC99C:
	sub r0, r0, #1
	str r0, [r4, #8]
_022DC9A4:
	ldrb r0, [sb, #0x14]
	cmp r0, #0
	beq _022DCA0C
	ldmia r4, {r0, r1}
	cmp r1, #0
	cmpeq r0, #0
	beq _022DCA0C
	bl ov29_022DC7E4
	ldr r1, _022DD08C ; =ov29_02353518
	mov r0, r0, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, asr #0x10
	ldrb r0, [r2, #0x6e8]
	cmp r0, #0
	beq _022DCA0C
	ldr r0, [sp, #0xc]
	add r2, sb, #0x16
	str r0, [sp]
	ldrb r3, [sb, #0x15]
	add r0, sb, #0x1a
	str r3, [sp, #4]
	ldr r6, [sb, #4]
	add r3, r0, r8, lsl #2
	str r6, [sp, #8]
	ldrsh r0, [sb, #8]
	bl ov29_022DD0A4
_022DCA0C:
	ldrb r0, [sb, #0x44]
	cmp r0, #0
	beq _022DD084
	ldmia r4, {r0, r1}
	cmp r1, #0
	cmpeq r0, #0
	mov r6, #0
	beq _022DD084
	bl ov29_022DC7E4
	mov r0, r0, lsl #0x10
	cmp r5, #0
	mov r7, r0, asr #0x10
	movne r6, #1
	bne _022DCB24
	ldr r0, _022DD090 ; =ov29_02350F8C
	ldr r0, [r0, r7, lsl #3]
	cmp r0, #0x10
	addls pc, pc, r0, lsl #2
	b _022DCB24
_022DCA58: ; jump table
	b _022DCB24 ; case 0
	b _022DCA9C ; case 1
	b _022DCA9C ; case 2
	b _022DCA9C ; case 3
	b _022DCA9C ; case 4
	b _022DCABC ; case 5
	b _022DCABC ; case 6
	b _022DCABC ; case 7
	b _022DCABC ; case 8
	b _022DCAE0 ; case 9
	b _022DCAE0 ; case 10
	b _022DCAE0 ; case 11
	b _022DCAE0 ; case 12
	b _022DCB04 ; case 13
	b _022DCB04 ; case 14
	b _022DCB04 ; case 15
	b _022DCB04 ; case 16
_022DCA9C:
	ldr r0, _022DD08C ; =ov29_02353518
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	adds r0, r1, r0, ror #30
	moveq r6, #1
	b _022DCB24
_022DCABC:
	ldr r0, _022DD08C ; =ov29_02353518
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #1
	moveq r6, #1
	b _022DCB24
_022DCAE0:
	ldr r0, _022DD08C ; =ov29_02353518
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #2
	moveq r6, #1
	b _022DCB24
_022DCB04:
	ldr r0, _022DD08C ; =ov29_02353518
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #3
	moveq r6, #1
_022DCB24:
	cmp r6, #0
	beq _022DCC3C
	ldmia r4, {r0, r1}
	bl ov29_022DC7E4
	ldr r2, _022DD090 ; =ov29_02350F8C
	ldr r1, _022DD08C ; =ov29_02353518
	ldr r2, [r2, r7, lsl #3]
	ldr r3, [r1]
	mov r1, #0xc
	ldr r5, [r3, #0x6f4]
	mul r6, r2, r1
	ldr sl, [r5, #4]
	ldr r1, _022DD094 ; =ov29_02350F90
	add r4, sl, r6
	ldr r0, [r1, r0, lsl #3]
	ldr r3, [r3]
	ldrb sl, [sl, r6]
	ldrb r6, [r4, #1]
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	smulbb r6, sl, r6
	mov r0, r0, lsl #0x10
	str r0, [sp, #0x20]
	ldrsh r1, [r4, #8]
	ldrh sl, [sb, #0x4a]
	mov r3, r8, lsl #0x10
	mov fp, r6, lsl #5
	mov r0, r2, asr #2
	mov r6, r3, lsr #0x10
	bl _s32_div_f
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r4, #4]
	ldr r0, _022DD098 ; =_020AFC4C
	mla r1, fp, r1, r2
	mov r2, sl, lsl #0x11
	mov r2, r2, asr #0xe
	add r2, r2, #0x50
	ldr r0, [r0]
	ldr r4, [r5, #0xc]
	add r2, r2, r6, lsl #2
	mov r2, r2, lsl #0x10
	mov r3, fp
	add r0, r0, #0x70
	add r1, r4, r1
	mov r2, r2, asr #0x10
	bl sub_0201BAC8
	add r0, r6, sl, lsl #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r0, r0, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	ldr r1, [sp, #0x20]
	add r0, sp, #0x2c
	add r1, r2, r1, lsr #10
	mov r2, #0
	mov r3, #0x10
	bl sub_0201F598
	ldr r0, _022DD098 ; =_020AFC4C
	ldrh r2, [sp, #0x34]
	ldr r0, [r0]
	add r1, sp, #0x2c
	add r0, r0, #0x70
	bl sub_0201B43C
_022DCC3C:
	ldr r6, _022DD08C ; =ov29_02353518
	ldr r2, _022DD090 ; =ov29_02350F8C
	ldr r1, [r6]
	ldr r3, [r2, r7, lsl #3]
	ldr r1, [r1, #0x6f4]
	ldrh r4, [r6, #0xc]
	ldrsh r0, [sb, #0x4a]
	add r2, r2, r7, lsl #3
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]
	bic r4, r4, #0x100
	strh r4, [r6, #0xc]
	ldrh r4, [r6, #0xc]
	mov fp, r0, lsl #1
	mov sl, #0xc
	bic r4, r4, #0x200
	strh r4, [r6, #0xc]
	ldrh r4, [r6, #0xc]
	mov r0, r0, lsl #3
	mla r1, r3, sl, r1
	bic r4, r4, #0xc00
	strh r4, [r6, #0xc]
	ldrh r5, [r6, #0xc]
	add fp, fp, #4
	str r2, [sp, #0x28]
	bic r5, r5, #0x1000
	strh r5, [r6, #0xc]
	ldrh sl, [r6, #0xc]
	mov r5, r8, lsl #0x10
	add r5, fp, r5, asr #16
	bic sl, sl, #0x2000
	strh sl, [r6, #0xc]
	ldrh sl, [r6, #0x10]
	mov fp, r5, lsl #0x10
	add r0, r0, #0x50
	bic r5, sl, #0xc00
	strh r5, [r6, #0x10]
	ldrh sl, [r6, #0x12]
	mov r4, #0
	add r8, r0, r8, lsl #2
	bic sl, sl, #1
	strh sl, [r6, #0x12]
	ldrh sl, [r6, #0x12]
	mov r5, r4
	str r3, [sp, #0x24]
	bic r2, sl, #2
	strh r2, [r6, #0x12]
	ldrh r2, [r6, #0xe]
	cmp r3, #0x10
	mov r0, fp, asr #0x10
	bic r2, r2, #0x3e00
	strh r2, [r6, #0xe]
	addls pc, pc, r3, lsl #2
	b _022DCFAC
_022DCD14: ; jump table
	b _022DCFAC ; case 0
	b _022DCD58 ; case 1
	b _022DCE14 ; case 2
	b _022DCE14 ; case 3
	b _022DCF50 ; case 4
	b _022DCEE0 ; case 5
	b _022DCE14 ; case 6
	b _022DCE14 ; case 7
	b _022DCDB0 ; case 8
	b _022DCE14 ; case 9
	b _022DCE14 ; case 10
	b _022DCE14 ; case 11
	b _022DCD58 ; case 12
	b _022DCE14 ; case 13
	b _022DCD58 ; case 14
	b _022DCE14 ; case 15
	b _022DCE78 ; case 16
_022DCD58:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrb r2, [r1, #1]
	ldrb r4, [r1]
	ldrsh r3, [sb, #0x24]
	mov r1, r2, lsl #3
	mov r4, r4, lsl #3
	add r1, r1, r1, lsr #31
	sub r1, r3, r1, asr #1
	sub r1, r1, #0x10
	mov r2, r1, lsl #0x10
	ldrsh r3, [sb, #0x22]
	add r1, r4, r4, lsr #31
	mov r4, r2, asr #0x10
	sub r1, r3, r1, asr #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	b _022DCFAC
_022DCDB0:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xc]
	orr r2, r2, #0x8000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrb r2, [r1, #1]
	ldrb r4, [r1]
	ldrsh r3, [sb, #0x24]
	mov r1, r2, lsl #3
	mov r4, r4, lsl #3
	add r1, r1, r1, lsr #31
	sub r1, r3, r1, asr #1
	sub r1, r1, #0x10
	mov r2, r1, lsl #0x10
	ldrsh r3, [sb, #0x22]
	add r1, r4, r4, lsr #31
	mov r4, r2, asr #0x10
	sub r1, r3, r1, asr #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	b _022DCFAC
_022DCE14:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrh r2, [r6, #0xe]
	orr r2, r2, #0x4000
	strh r2, [r6, #0xe]
	ldrb r2, [r1, #1]
	ldrb r4, [r1]
	ldrsh r3, [sb, #0x24]
	mov r1, r2, lsl #3
	mov r4, r4, lsl #3
	add r1, r1, r1, lsr #31
	sub r1, r3, r1, asr #1
	sub r1, r1, #0x10
	mov r2, r1, lsl #0x10
	ldrsh r3, [sb, #0x22]
	add r1, r4, r4, lsr #31
	mov r4, r2, asr #0x10
	sub r1, r3, r1, asr #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	b _022DCFAC
_022DCE78:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrh r2, [r6, #0xe]
	orr r2, r2, #0x4000
	strh r2, [r6, #0xe]
	ldrb r2, [r1]
	ldrb r1, [r1, #1]
	ldrsh r4, [sb, #0x22]
	mov r3, r2, lsl #3
	mov r2, r1, lsl #3
	add r1, r3, r3, lsr #31
	sub r1, r4, r1, asr #1
	add r1, r1, #8
	mov r1, r1, lsl #0x10
	ldrsh r3, [sb, #0x24]
	add r2, r2, r2, lsr #31
	mov r5, r1, asr #0x10
	sub r1, r3, r2, asr #1
	sub r1, r1, #0x10
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
	b _022DCFAC
_022DCEE0:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xc]
	orr r2, r2, #0x4000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrh r2, [r6, #0xe]
	orr r2, r2, #0x8000
	strh r2, [r6, #0xe]
	ldrb r2, [r1, #1]
	ldrb r4, [r1]
	ldrsh r3, [sb, #0x24]
	mov r1, r2, lsl #3
	mov r4, r4, lsl #3
	add r1, r1, r1, lsr #31
	sub r1, r3, r1, asr #1
	sub r1, r1, #0x10
	mov r2, r1, lsl #0x10
	ldrsh r3, [sb, #0x22]
	add r1, r4, r4, lsr #31
	mov r4, r2, asr #0x10
	sub r1, r3, r1, asr #1
	mov r1, r1, lsl #0x10
	mov r5, r1, asr #0x10
	b _022DCFAC
_022DCF50:
	ldrh r2, [r6, #0xc]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xc]
	ldrh r2, [r6, #0xe]
	bic r2, r2, #0xc000
	strh r2, [r6, #0xe]
	ldrh r2, [r6, #0xe]
	orr r2, r2, #0x8000
	strh r2, [r6, #0xe]
	ldrb r2, [r1]
	ldrb r1, [r1, #1]
	ldrsh r4, [sb, #0x26]
	mov r3, r2, lsl #3
	mov r2, r1, lsl #3
	add r1, r3, r3, lsr #31
	sub r1, r4, r1, asr #1
	mov r1, r1, lsl #0x10
	ldrsh r3, [sb, #0x28]
	add r2, r2, r2, lsr #31
	mov r5, r1, asr #0x10
	sub r1, r3, r2, asr #1
	mov r1, r1, lsl #0x10
	mov r4, r1, asr #0x10
_022DCFAC:
	ldr r3, _022DD08C ; =ov29_02353518
	mov r1, #0x400
	ldrh r6, [r3, #0x10]
	rsb r1, r1, #0
	and r2, r8, r1, lsr #22
	and r6, r6, r1
	strh r6, [r3, #0x10]
	ldrh r8, [r3, #0x10]
	mov r6, r0, lsl #0x1c
	cmp r7, #0x20
	orr r2, r8, r2
	strh r2, [r3, #0x10]
	ldrh r8, [r3, #0x10]
	add r0, r1, #0x200
	ldr r2, _022DD09C ; =0xFFFF000F
	bic r7, r8, #0xf000
	strh r7, [r3, #0x10]
	ldrh r7, [r3, #0x10]
	orr r6, r7, r6, lsr #16
	strh r6, [r3, #0x10]
	ldrh r6, [r3, #0xe]
	ldrsh r7, [sb, #0x46]
	and r0, r6, r0
	strh r0, [r3, #0xe]
	add r0, r7, r5
	ldrh r6, [r3, #0xe]
	and r0, r0, r1, lsr #23
	orr r0, r6, r0
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0x12]
	ldrsh r5, [sb, #0x48]
	and r0, r0, r2
	strh r0, [r3, #0x12]
	add r0, r5, r4
	ldrh r1, [r3, #0x12]
	mov r0, r0, lsl #0x14
	orr r0, r1, r0, lsr #16
	strh r0, [r3, #0x12]
	ldrneh r0, [r3, #6]
	bicne r0, r0, #0x3e00
	strneh r0, [r3, #6]
	bne _022DD06C
	ldrh r0, [r3, #0xe]
	bic r0, r0, #0x3e00
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0xe]
	orr r0, r0, #0x2000
	strh r0, [r3, #0xe]
_022DD06C:
	ldr r0, _022DD098 ; =_020AFC4C
	ldr r1, _022DD0A0 ; =ov29_02353524
	ldr r0, [r0]
	mov r2, #1
	add r0, r0, #0x70
	bl sub_0201B9F8
_022DD084:
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DD08C: .word ov29_02353518
_022DD090: .word ov29_02350F8C
_022DD094: .word ov29_02350F90
_022DD098: .word _020AFC4C
_022DD09C: .word 0xFFFF000F
_022DD0A0: .word ov29_02353524
	arm_func_end ov29_022DC820

	arm_func_start ov29_022DD0A4
ov29_022DD0A4: ; 0x022DD0A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr sb, _022DD500 ; =ov29_02350F8C
	ldr r6, _022DD504 ; =ov29_02353518
	ldr r0, [sb, r1, lsl #3]
	mov lr, #0xc
	ldr r4, [r6]
	mul r7, r0, lr
	ldr r5, [r4, #0x6f4]
	ldrh r4, [r6, #8]
	ldr r8, [r5, #4]
	add r5, sb, r1, lsl #3
	add sb, r8, r7
	ldr sl, [r5, #4]
	ldrsh fp, [sb, #0xa]
	bic r4, r4, #0xc00
	ldr ip, [sp, #0x30]
	strh r4, [r6, #8]
	ldr r4, [sp, #0x34]
	ldrh r5, [r6, #8]
	mov r4, r4, lsl #0x1e
	str r0, [sp]
	orr r4, r5, r4, lsr #20
	strh r4, [r6, #8]
	ldrb r5, [r8, r7]
	ldrb r4, [sb, #1]
	ldrsh sb, [r2]
	mov r7, r5, lsl #3
	mov r5, r4, lsl #3
	add r4, r7, r7, lsr #31
	sub sb, sb, r4, asr #1
	ldrsh r8, [ip]
	ldrsh r7, [r2, #2]
	add r5, r5, r5, lsr #31
	sub r8, sb, r8
	ldrsh sb, [r3]
	sub r5, r7, r5, asr #1
	ldrsh r4, [ip, #2]
	ldrsh r3, [r3, #2]
	str sl, [sp, #4]
	sub r4, r5, r4
	add r4, r3, r4
	add r5, sb, r8
	sub r3, lr, #0x2c
	cmp r5, r3
	subge r8, lr, #0x2c
	add r7, fp, #0x190
	sub r3, r4, #0x10
	cmpge r4, r8
	blt _022DD4F8
	cmp r5, #0xff
	cmplt r4, #0xc0
	bge _022DD4F8
	ldrh r8, [r6, #4]
	cmp r0, #0x10
	bic r8, r8, #0x2000
	strh r8, [r6, #4]
	ldrh r8, [r6, #4]
	orr r8, r8, #0x2000
	strh r8, [r6, #4]
	addls pc, pc, r0, lsl #2
	b _022DD468
_022DD19C: ; jump table
	b _022DD468 ; case 0
	b _022DD1E0 ; case 1
	b _022DD2AC ; case 2
	b _022DD2AC ; case 3
	b _022DD400 ; case 4
	b _022DD388 ; case 5
	b _022DD2AC ; case 6
	b _022DD2AC ; case 7
	b _022DD240 ; case 8
	b _022DD2AC ; case 9
	b _022DD2AC ; case 10
	b _022DD2AC ; case 11
	b _022DD1E0 ; case 12
	b _022DD2AC ; case 13
	b _022DD1E0 ; case 14
	b _022DD2AC ; case 15
	b _022DD318 ; case 16
_022DD1E0:
	ldrh r8, [r6, #4]
	ldr r4, _022DD508 ; =0x000001FF
	sub r0, lr, #0x20c
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	and r5, r5, r4
	ldr r4, _022DD50C ; =0xFFFF000F
	bic r8, r8, #0xc000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	mov r3, r3, lsl #0x14
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r4
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r3, lsr #16
	strh r0, [r6, #0xa]
	b _022DD468
_022DD240:
	ldrh r8, [r6, #4]
	ldr r4, _022DD508 ; =0x000001FF
	sub r0, lr, #0x20c
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #4]
	and r5, r5, r4
	ldr r4, _022DD50C ; =0xFFFF000F
	orr r8, r8, #0x8000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	mov r3, r3, lsl #0x14
	bic r8, r8, #0xc000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r4
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r3, lsr #16
	strh r0, [r6, #0xa]
	b _022DD468
_022DD2AC:
	ldrh r8, [r6, #4]
	ldr r4, _022DD508 ; =0x000001FF
	sub r0, lr, #0x20c
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	and r5, r5, r4
	ldr r4, _022DD50C ; =0xFFFF000F
	bic r8, r8, #0xc000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	mov r3, r3, lsl #0x14
	orr r8, r8, #0x4000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r4
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r3, lsr #16
	strh r0, [r6, #0xa]
	b _022DD468
_022DD318:
	ldrh r8, [r6, #4]
	sub r0, lr, #0x20c
	ldr r4, _022DD508 ; =0x000001FF
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	add r5, r5, #8
	and r5, r5, r4
	bic r4, r8, #0xc000
	strh r4, [r6, #6]
	ldrh r8, [r6, #6]
	ldr r4, _022DD50C ; =0xFFFF000F
	mov r3, r3, lsl #0x14
	orr r8, r8, #0x4000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r4
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r3, lsr #16
	strh r0, [r6, #0xa]
	b _022DD468
_022DD388:
	ldrh r8, [r6, #4]
	ldr r4, _022DD508 ; =0x000001FF
	sub r0, lr, #0x20c
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #4]
	and r5, r5, r4
	ldr r4, _022DD50C ; =0xFFFF000F
	orr r8, r8, #0x4000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	mov r3, r3, lsl #0x14
	bic r8, r8, #0xc000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	orr r8, r8, #0x8000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r4
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r3, lsr #16
	strh r0, [r6, #0xa]
	b _022DD468
_022DD400:
	ldrh r8, [r6, #4]
	ldr r3, _022DD508 ; =0x000001FF
	sub r0, lr, #0x20c
	bic r8, r8, #0xc000
	strh r8, [r6, #4]
	ldrh r8, [r6, #6]
	and r5, r5, r3
	ldr r3, _022DD50C ; =0xFFFF000F
	bic r8, r8, #0xc000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	mov r4, r4, lsl #0x14
	orr r8, r8, #0x8000
	strh r8, [r6, #6]
	ldrh r8, [r6, #6]
	and r0, r8, r0
	strh r0, [r6, #6]
	ldrh r0, [r6, #6]
	orr r0, r0, r5
	strh r0, [r6, #6]
	ldrh r0, [r6, #0xa]
	and r0, r0, r3
	strh r0, [r6, #0xa]
	ldrh r0, [r6, #0xa]
	orr r0, r0, r4, lsr #16
	strh r0, [r6, #0xa]
_022DD468:
	ldr r3, _022DD504 ; =ov29_02353518
	mov r0, #0x400
	ldrh r5, [r3, #8]
	rsb r0, r0, #0
	ldr r4, [sp, #4]
	and r5, r5, r0
	strh r5, [r3, #8]
	ldrh r6, [r3, #8]
	and r5, r7, r0, lsr #22
	mov r0, r4, lsl #0x1c
	orr r4, r6, r5
	strh r4, [r3, #8]
	ldrh r4, [r3, #8]
	cmp r1, #0x20
	bic r1, r4, #0xf000
	strh r1, [r3, #8]
	ldrh r1, [r3, #8]
	orr r0, r1, r0, lsr #16
	strh r0, [r3, #8]
	ldrh r0, [r3, #6]
	ldr r1, _022DD510 ; =ov29_0235351C
	biceq r0, r0, #0x3e00
	streqh r0, [r3, #6]
	ldreqh r0, [r3, #6]
	orreq r0, r0, #0x2000
	bicne r0, r0, #0x3e00
	strh r0, [r3, #6]
	ldrsh r3, [r2, #2]
	ldrsh r0, [ip, #2]
	ldr r2, _022DD514 ; =_020AFC4C
	sub r0, r3, r0
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	ldr r0, [r2]
	add r2, r3, #1
	bl sub_0201B9F8
_022DD4F8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DD500: .word ov29_02350F8C
_022DD504: .word ov29_02353518
_022DD508: .word 0x000001FF
_022DD50C: .word 0xFFFF000F
_022DD510: .word ov29_0235351C
_022DD514: .word _020AFC4C
	arm_func_end ov29_022DD0A4

	arm_func_start ov29_022DD518
ov29_022DD518: ; 0x022DD518
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r2, _022DD5AC ; =ov29_02353518
	mov r1, #0xc
	ldr r3, [r2]
	mul r2, r0, r1
	ldr r5, [r3, #0x6f4]
	ldr r1, [r3]
	ldr r3, [r5, #4]
	mov r0, r1, asr #1
	add r4, r3, r2
	add r0, r1, r0, lsr #30
	ldrb r3, [r3, r2]
	ldrb r2, [r4, #1]
	ldrsh r1, [r4, #8]
	mov r0, r0, asr #2
	smulbb r2, r3, r2
	mov r6, r2, lsl #5
	bl _s32_div_f
	mov r0, #1
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	ldr r3, [r4, #4]
	ldrsh r2, [r4, #0xa]
	ldr r0, _022DD5B0 ; =_020AFC4C
	mla r4, r6, r1, r3
	add r1, r2, #0x190
	ldr r5, [r5, #0xc]
	mov r2, r1, lsl #0x10
	ldr r0, [r0]
	mov r3, r6
	add r1, r5, r4
	mov r2, r2, asr #0x10
	bl sub_0201BAC8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DD5AC: .word ov29_02353518
_022DD5B0: .word _020AFC4C
	arm_func_end ov29_022DD518

	arm_func_start ov29_022DD5B4
ov29_022DD5B4: ; 0x022DD5B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r2, _022DD758 ; =ov29_02353518
	ldr r0, [r2]
	cmp r0, #0
	bne _022DD60C
	ldr r0, _022DD75C ; =ov29_0236CEF0
	ldr r1, _022DD760 ; =0x000006FC
	str r0, [r2]
	bl MemZero
	ldr r0, _022DD764 ; =ov29_0236D5EC
	mov r1, #0x6000
	bl MemZero
	ldr r0, _022DD764 ; =ov29_0236D5EC
	ldr r1, _022DD768 ; =ov29_0235109C
	bl sub_02008BF4
	ldr r0, _022DD758 ; =ov29_02353518
	ldr r1, _022DD764 ; =ov29_0236D5EC
	ldr r0, [r0]
	add r0, r0, #0x2f4
	add r0, r0, #0x400
	bl HandleSir0Translation
_022DD60C:
	ldr r0, _022DD758 ; =ov29_02353518
	mov r2, #1
	ldr r1, [r0]
	mov sb, #0
	strb r2, [r1, #0x6e8]
	ldr r1, [r0]
	ldr r4, _022DD76C ; =_020AFC4C
	str sb, [r1]
	ldr r0, [r0]
	mov r8, #0xe0
	ldr sl, [r0, #0x6f4]
	mov r7, #0xff
	add r6, sp, #8
	mov r5, r2
	mov fp, #0x10
_022DD648:
	str r8, [sp]
	str r7, [sp, #4]
	ldr r1, [sl, #0x14]
	mov r0, r6
	mov r2, r5
	mov r3, fp
	add r1, r1, sb, lsl #6
	bl sub_0201F598
	mov r2, sb, lsl #0x10
	ldr r0, [r4]
	mov r1, r6
	mov r2, r2, lsr #0x10
	bl sub_0201B43C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #0x10
	blt _022DD648
	mov r0, #1
	mov r1, #0
	bl ov29_022DD518
	mov r0, #2
	mov r1, #0
	bl ov29_022DD518
	mov r0, #3
	mov r1, #0
	bl ov29_022DD518
	mov r0, #4
	mov r1, #0
	bl ov29_022DD518
	mov r0, #5
	mov r1, #0
	bl ov29_022DD518
	mov r0, #6
	mov r1, #0
	bl ov29_022DD518
	mov r0, #7
	mov r1, #0
	bl ov29_022DD518
	mov r0, #8
	mov r1, #0
	bl ov29_022DD518
	mov r0, #9
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xa
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xb
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xc
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xd
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xe
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0xf
	mov r1, #0
	bl ov29_022DD518
	mov r0, #0x10
	mov r1, #0
	bl ov29_022DD518
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DD758: .word ov29_02353518
_022DD75C: .word ov29_0236CEF0
_022DD760: .word 0x000006FC
_022DD764: .word ov29_0236D5EC
_022DD768: .word ov29_0235109C
_022DD76C: .word _020AFC4C
	arm_func_end ov29_022DD5B4

	arm_func_start ov29_022DD770
ov29_022DD770: ; 0x022DD770
	stmdb sp!, {r3, lr}
	ldr r0, _022DD7A8 ; =ov29_02353518
	mov r1, #8
	ldr r0, [r0]
	add r0, r0, #0x2ec
	add r0, r0, #0x400
	bl MemZero
	ldr r0, _022DD7A8 ; =ov29_02353518
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x6f4]
	ldr r0, [r0]
	str r2, [r0, #0x6f8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DD7A8: .word ov29_02353518
	arm_func_end ov29_022DD770

	arm_func_start ov29_022DD7AC
ov29_022DD7AC: ; 0x022DD7AC
	stmdb sp!, {r3, lr}
	ldr r0, _022DD7D4 ; =ov29_02353518
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022DD770
	ldr r0, _022DD7D4 ; =ov29_02353518
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DD7D4: .word ov29_02353518
	arm_func_end ov29_022DD7AC

	arm_func_start ov29_022DD7D8
ov29_022DD7D8: ; 0x022DD7D8
	stmdb sp!, {r4, r5, r6, lr}
	ldr ip, _022DD824 ; =ov29_02353518
	mov r6, r1
	ldr r1, [ip]
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov29_022DC78C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	strh r6, [r0, #8]
	str r5, [r0, #0xc]
	ldrb r2, [sp, #0x10]
	str r4, [r0, #0x10]
	mov r1, #0
	strb r2, [r0, #0x14]
	strb r1, [r0, #0x44]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DD824: .word ov29_02353518
	arm_func_end ov29_022DD7D8

	arm_func_start ov29_022DD828
ov29_022DD828: ; 0x022DD828
	ldr r1, _022DD838 ; =ov29_02353518
	ldr r1, [r1]
	strb r0, [r1, #0x6e8]
	bx lr
	.align 2, 0
_022DD838: .word ov29_02353518
	arm_func_end ov29_022DD828

	arm_func_start ov29_022DD83C
ov29_022DD83C: ; 0x022DD83C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _022DD8B0 ; =ov29_02353518
	ldr r4, [sp, #0x14]
	ldr r1, [r1]
	mov r6, r2
	mov r5, r3
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov29_022DC78C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r6, lsl #0x10
	mov r2, #1
	strb r2, [r0, #0x44]
	mov r1, r1, asr #0x10
	strh r1, [r0, #0x4a]
	strh r1, [r0, #0x4c]
	ldr r1, [sp, #0x10]
	strh r5, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrh r1, [r4]
	strh r1, [r0, #0x22]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0x24]
	ldrh r1, [r4, #0xc]
	strh r1, [r0, #0x26]
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DD8B0: .word ov29_02353518
	arm_func_end ov29_022DD83C

	arm_func_start ov29_022DD8B4
ov29_022DD8B4: ; 0x022DD8B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _022DDA50 ; =ov29_02353518
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r0]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022DD9C4
_022DD8E8: ; jump table
	b _022DD8F8 ; case 0
	b _022DD92C ; case 1
	b _022DD960 ; case 2
	b _022DD994 ; case 3
_022DD8F8:
	mov r0, #1
	mov r1, r0
	bl ov29_022DD518
	mov r0, #2
	mov r1, #1
	bl ov29_022DD518
	mov r0, #3
	mov r1, #1
	bl ov29_022DD518
	mov r0, #4
	mov r1, #1
	bl ov29_022DD518
	b _022DD9C4
_022DD92C:
	mov r0, #5
	mov r1, #1
	bl ov29_022DD518
	mov r0, #6
	mov r1, #1
	bl ov29_022DD518
	mov r0, #7
	mov r1, #1
	bl ov29_022DD518
	mov r0, #8
	mov r1, #1
	bl ov29_022DD518
	b _022DD9C4
_022DD960:
	mov r0, #9
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0xa
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0xb
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0xc
	mov r1, #1
	bl ov29_022DD518
	b _022DD9C4
_022DD994:
	mov r0, #0xd
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0xe
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0xf
	mov r1, #1
	bl ov29_022DD518
	mov r0, #0x10
	mov r1, #1
	bl ov29_022DD518
_022DD9C4:
	mov sb, #0
	ldr r6, _022DDA50 ; =ov29_02353518
	mov r8, sb
	mov fp, #1
	mov r7, sb
	mov r5, #0x50
_022DD9DC:
	mul r1, sb, r5
	ldr r2, [r6]
	add r0, r2, r1
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _022DDA20
	add r0, r2, #4
	add sl, r0, r1
	mov r0, sl
	mov r1, r8
	mov r2, r4
	bl ov29_022DC820
	mov r0, sl
	mov r1, fp
	mov r2, r4
	bl ov29_022DC820
	strb r7, [sl, #0x44]
_022DDA20:
	add sb, sb, #1
	cmp sb, #0x16
	blt _022DD9DC
	ldr r0, _022DDA50 ; =ov29_02353518
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x6e4]
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022DDA50: .word ov29_02353518
	arm_func_end ov29_022DD8B4

	arm_func_start ov29_022DDA54
ov29_022DDA54: ; 0x022DDA54
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _022DDB60 ; =ov29_02353518
	mov r7, r0
	ldr ip, [r4]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl ov29_022DC78C
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _022DDB60 ; =ov29_02353518
	mov r3, #0
	ldr ip, [r0]
	mov r0, #0x50
	b _022DDAB8
_022DDA98:
	mul r2, r3, r0
	add r1, ip, r2
	ldrb r1, [r1, #4]
	cmp r1, #0
	addeq r0, ip, #4
	addeq r1, r0, r2
	beq _022DDAC4
	add r3, r3, #1
_022DDAB8:
	cmp r3, #0x16
	blt _022DDA98
	mov r1, #0
_022DDAC4:
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #1
	strb r0, [r1]
	str r7, [r1, #4]
	strh r6, [r1, #8]
	mov r0, #0
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	ldrh r3, [r5]
	ldr r2, _022DDB64 ; =ov29_02350F88
	strh r3, [r1, #0x16]
	ldrh r3, [r5, #2]
	strh r3, [r1, #0x18]
	strb r4, [r1, #0x15]
	ldrh r3, [r2, #2]
	ldrh r4, [r2]
	strh r3, [sp, #2]
	mov r3, r3
	strh r4, [r1, #0x1e]
	strh r3, [r1, #0x20]
	ldrh r2, [r1, #0x1e]
	strh r4, [sp]
	strh r2, [r1, #0x1a]
	ldrh r2, [r1, #0x20]
	strh r2, [r1, #0x1c]
	strh r4, [r1, #0x26]
	strh r3, [r1, #0x28]
	ldrh r2, [r1, #0x26]
	strh r2, [r1, #0x22]
	ldrh r2, [r1, #0x28]
	strh r2, [r1, #0x24]
	str r0, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	str r0, [r1, #0x3c]
	str r0, [r1, #0x40]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022DDB60: .word ov29_02353518
_022DDB64: .word ov29_02350F88
	arm_func_end ov29_022DDA54

	arm_func_start ov29_022DDB68
ov29_022DDB68: ; 0x022DDB68
	stmdb sp!, {r3, lr}
	ldr r1, _022DDB94 ; =ov29_02353518
	ldr r1, [r1]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022DC78C
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0x50
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DDB94: .word ov29_02353518
	arm_func_end ov29_022DDB68

	arm_func_start ov29_022DDB98
ov29_022DDB98: ; 0x022DDB98
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022DDBFC ; =ov29_02353518
	mov r6, r1
	ldr r1, [r4]
	mov r4, r2
	mov r5, r3
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov29_022DC78C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r1, [r6]
	strh r1, [r0, #0x16]
	ldrh r1, [r6, #2]
	strh r1, [r0, #0x18]
	strb r5, [r0, #0x15]
	ldrh r1, [r4]
	strh r1, [r0, #0x1a]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0x1c]
	ldrh r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x20]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DDBFC: .word ov29_02353518
	arm_func_end ov29_022DDB98

	arm_func_start ov29_022DDC00
ov29_022DDC00: ; 0x022DDC00
	stmdb sp!, {r3, lr}
	ldr r0, _022DDC8C ; =0x027E0068
	mov r1, #0x2000
	bl MemZero
	ldr r1, _022DDC8C ; =0x027E0068
	ldr r0, _022DDC90 ; =ov29_023735EC
	ldr r3, _022DDC94 ; =ov29_02373690
	ldr r2, _022DDC98 ; =ov29_023735FC
	mov lr, #1
	str r1, [r0, #0x10]
_022DDC28:
	sub r0, lr, #1
	add r0, r0, r0, lsl #1
	add r1, lr, #1
	add ip, r3, r0, lsl #12
	mov r0, r1, lsl #0x10
	str ip, [r2, lr, lsl #2]
	mov lr, r0, asr #0x10
	cmp lr, #4
	blt _022DDC28
	mov r0, #0
	ldr r2, _022DDC9C ; =ov29_0237360C
	mov r1, r0
_022DDC58:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	str r1, [r2]
	mov r0, r0, asr #0x10
	str r1, [r2, #4]
	cmp r0, #4
	add r2, r2, #0x20
	blt _022DDC58
	ldr r0, _022DDC90 ; =ov29_023735EC
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DDC8C: .word 0x027E0068
_022DDC90: .word ov29_023735EC
_022DDC94: .word ov29_02373690
_022DDC98: .word ov29_023735FC
_022DDC9C: .word ov29_0237360C
	arm_func_end ov29_022DDC00

	arm_func_start ov29_022DDCA0
ov29_022DDCA0: ; 0x022DDCA0
	bx lr
	arm_func_end ov29_022DDCA0

	arm_func_start ov29_022DDCA4
ov29_022DDCA4: ; 0x022DDCA4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022DDD40 ; =ov29_023735FC
	ldr r6, _022DDD44 ; =ov29_0237360C
	ldr r5, [r4, r0, lsl #2]
	add r4, r6, r0, lsl #5
	stmib r4, {r1, r5}
	cmp r0, #0
	ldreq r5, _022DDD48 ; =0x00001FFC
	ldr ip, _022DDD40 ; =ov29_023735FC
	ldrne r5, _022DDD4C ; =0x00002FFC
	mov lr, #0xff
	str r5, [r4, #0x14]
	ldr r5, [ip, r0, lsl #2]
	cmp r2, #0
	strb lr, [r5]
	ldr r6, [ip, r0, lsl #2]
	ldr r5, [r4, #0x14]
	add r5, r6, r5
	strb lr, [r5, #3]
	ldr r6, [ip, r0, lsl #2]
	ldr r5, [r4, #0x14]
	add r5, r6, r5
	strb lr, [r5, #2]
	ldr ip, [ip, r0, lsl #2]
	ldr r0, [r4, #0x14]
	add r0, ip, r0
	strb lr, [r0, #1]
	ldr ip, [r4, #8]
	ldr r0, [r4, #0x14]
	add r0, ip, r0
	str r0, [r4, #0xc]
	str r1, [r4, #0x10]
	str r2, [r4, #0x18]
	str r3, [r4, #0x1c]
	beq _022DDD34
	blx r2
_022DDD34:
	mov r0, #1
	str r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DDD40: .word ov29_023735FC
_022DDD44: .word ov29_0237360C
_022DDD48: .word 0x00001FFC
_022DDD4C: .word 0x00002FFC
	arm_func_end ov29_022DDCA4

	arm_func_start ov29_022DDD50
ov29_022DDD50: ; 0x022DDD50
	stmdb sp!, {r3, lr}
	mov r3, r2
	movs lr, r0
	mov ip, r1
	ldmeqia sp!, {r3, pc}
	ldr r0, _022DDDA0 ; =ov29_0237360C
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	rsb r0, r0, #0
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	mov r1, lr
	mov r2, ip
	bl ov29_022DDCA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DDDA0: .word ov29_0237360C
	arm_func_end ov29_022DDD50

	arm_func_start ov29_022DDDA4
ov29_022DDDA4: ; 0x022DDDA4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r7, #0
	ldr r6, _022DDDFC ; =ov29_0237360C
	mov r5, r7
_022DDDBC:
	ldr r0, [r6, #4]
	cmp r0, r4
	bne _022DDDE0
	ldr r0, [r6, #0x1c]
	cmp r0, #0
	beq _022DDDD8
	blx r0
_022DDDD8:
	str r5, [r6]
	str r5, [r6, #4]
_022DDDE0:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	add r6, r6, #0x20
	blt _022DDDBC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022DDDFC: .word ov29_0237360C
	arm_func_end ov29_022DDDA4

	arm_func_start ov29_022DDE00
ov29_022DDE00: ; 0x022DDE00
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	b _022DDE18
_022DDE10:
	bl ov29_022DDEF8
	add r4, r4, #1
_022DDE18:
	cmp r4, r5
	blt _022DDE10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_022DDE00

	arm_func_start ov29_022DDE24
ov29_022DDE24: ; 0x022DDE24
	ldr ip, _022DDE2C ; =ov29_022DDE30
	bx ip
	.align 2, 0
_022DDE2C: .word ov29_022DDE30
	arm_func_end ov29_022DDE24

	arm_func_start ov29_022DDE30
ov29_022DDE30: ; 0x022DDE30
	stmdb sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
	ldr r0, _022DDEDC ; =ov29_023735F8
	mov r1, sp
	str r1, [r0]
	ldr r1, _022DDEE0 ; =ov29_023735EC
	mov r2, #0
	str r2, [r1]
	ldr r3, _022DDEE4 ; =ov29_023510B8
	ldr r4, [r3]
	ldr r3, _022DDEE8 ; =ov29_0237360C
_022DDE58:
	ldrh r5, [r3]
	cmp r5, #1
	beq _022DDE7C
	cmp r5, #2
	beq _022DDE7C
	add r2, r2, #1
	add r3, r3, #0x20
	cmp r2, r4
	blt _022DDE58
_022DDE7C:
	str r2, [r1]
	cmp r2, r4
	bge _022DDED8
	ldr r4, _022DDEEC ; =ov29_0237368C
	str r2, [r4]
	ldr r6, _022DDEF0 ; =ov29_023735F4
	ldr r7, [r3, #0xc]
	str r7, [r6]
	ldr r6, _022DDEF4 ; =ov29_023735F0
	ldr r7, [r3, #0x10]
	str r7, [r6]
	cmp r5, #2
	bne _022DDEC0
	ldr r6, _022DDEF0 ; =ov29_023735F4
	ldr sp, [r6]
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
_022DDEBC:
	b _022DDED8
_022DDEC0:
	ldr r6, _022DDEF0 ; =ov29_023735F4
	ldr sp, [r6]
	ldr r7, _022DDEF4 ; =ov29_023735F0
	ldr r2, [r7]
	bx r2
_022DDED4:
	b _022DDED8
_022DDED8:
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
	.align 2, 0
_022DDEDC: .word ov29_023735F8
_022DDEE0: .word ov29_023735EC
_022DDEE4: .word ov29_023510B8
_022DDEE8: .word ov29_0237360C
_022DDEEC: .word ov29_0237368C
_022DDEF0: .word ov29_023735F4
_022DDEF4: .word ov29_023735F0
	arm_func_end ov29_022DDE30

	arm_func_start ov29_022DDEF8
ov29_022DDEF8: ; 0x022DDEF8
	stmdb sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
	ldr r0, _022DDFD8 ; =ov29_023735F4
	str sp, [r0]
	mov r1, #0x20
	ldr r3, _022DDFDC ; =ov29_023735EC
	ldr r2, [r3]
	mul r1, r1, r2
	ldr r3, _022DDFE0 ; =ov29_0237360C
	add r4, r3, r1
	ldrh r5, [r4]
	cmp r5, #1
	bne _022DDF30
	mov r5, #2
	str r5, [r4]
_022DDF30:
	ldr r5, [r0]
	str r5, [r4, #0xc]
	ldr r5, _022DDFE4 ; =ov29_023735F0
	ldr r5, [r5]
	str r5, [r4, #0x10]
	mov r3, r4
	ldr r1, _022DDFE8 ; =ov29_023510B8
	ldr r4, [r1]
_022DDF50:
	add r2, r2, #1
	add r3, r3, #0x20
	cmp r2, r4
	bge _022DDF78
	ldrh r5, [r3]
	cmp r5, #1
	beq _022DDF78
	cmp r5, #2
	beq _022DDF78
	b _022DDF50
_022DDF78:
	ldr r6, _022DDFDC ; =ov29_023735EC
	str r2, [r6]
	cmp r2, r4
	bge _022DDFCC
	ldr r6, _022DDFD8 ; =ov29_023735F4
	ldr r7, [r3, #0xc]
	str r7, [r6]
	ldr r6, _022DDFE4 ; =ov29_023735F0
	ldr r7, [r3, #0x10]
	str r7, [r6]
	cmp r5, #2
	bne _022DDFB8
	ldr r6, _022DDFD8 ; =ov29_023735F4
	ldr sp, [r6]
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
_022DDFB4:
	b _022DDFCC
_022DDFB8:
	ldr r6, _022DDFD8 ; =ov29_023735F4
	ldr sp, [r6]
	ldr r7, _022DDFE4 ; =ov29_023735F0
	ldr r2, [r7]
	bx r2
_022DDFCC:
	ldr r0, _022DDFEC ; =ov29_023735F8
	ldr sp, [r0]
	ldmia sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
	.align 2, 0
_022DDFD8: .word ov29_023735F4
_022DDFDC: .word ov29_023735EC
_022DDFE0: .word ov29_0237360C
_022DDFE4: .word ov29_023735F0
_022DDFE8: .word ov29_023510B8
_022DDFEC: .word ov29_023735F8
	arm_func_end ov29_022DDEF8

	arm_func_start ov29_022DDFF0
ov29_022DDFF0: ; 0x022DDFF0
	ldr ip, _022DDFF8 ; =sub_020519D0
	bx ip
	.align 2, 0
_022DDFF8: .word sub_020519D0
	arm_func_end ov29_022DDFF0

	arm_func_start ov29_022DDFFC
ov29_022DDFFC: ; 0x022DDFFC
	stmdb sp!, {r3, lr}
	mov r0, #0x44
	mov r1, #0
	bl MemAlloc
	ldr r2, _022DE064 ; =ov29_0235352C
	mov r1, #0x44
	str r0, [r2]
	bl MemZero
	ldr r0, _022DE064 ; =ov29_0235352C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov29_022DE22C
	ldr r0, _022DE064 ; =ov29_0235352C
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x2c
	bl ov29_022DE22C
	mov r0, #0
	bl sub_02051ED4
	mov r1, r0
	ldr r0, _022DE064 ; =ov29_0235352C
	mov r2, #0x20
	ldr r0, [r0]
	bl sub_02063628
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE064: .word ov29_0235352C
	arm_func_end ov29_022DDFFC

	arm_func_start ov29_022DE068
ov29_022DE068: ; 0x022DE068
	stmdb sp!, {r3, lr}
	ldr r0, _022DE09C ; =ov29_0235352C
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov29_022DE274
	ldr r0, _022DE09C ; =ov29_0235352C
	ldr r0, [r0]
	add r0, r0, #0x2c
	bl ov29_022DE274
	ldr r0, _022DE09C ; =ov29_0235352C
	ldr r0, [r0]
	bl sub_0206367C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE09C: .word ov29_0235352C
	arm_func_end ov29_022DE068

	arm_func_start ov29_022DE0A0
ov29_022DE0A0: ; 0x022DE0A0
	stmdb sp!, {r3, lr}
	bl ov29_022DE068
	bl sub_02051B44
	ldr r0, _022DE0C8 ; =ov29_0235352C
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DE0C8 ; =ov29_0235352C
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE0C8: .word ov29_0235352C
	arm_func_end ov29_022DE0A0

	arm_func_start ov29_022DE0CC
ov29_022DE0CC: ; 0x022DE0CC
	stmdb sp!, {r3, lr}
	ldr r0, _022DE0E8 ; =ov29_0235352C
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_02051C24
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE0E8: .word ov29_0235352C
	arm_func_end ov29_022DE0CC

	arm_func_start ov29_022DE0EC
ov29_022DE0EC: ; 0x022DE0EC
	stmdb sp!, {r4, lr}
	ldr r2, _022DE118 ; =ov29_0235352C
	mov r4, r0
	ldr r0, [r2]
	mov r2, r1
	mov r1, r4
	bl sub_02063734
	ldr r0, _022DE118 ; =ov29_0235352C
	ldr r0, [r0]
	str r4, [r0, #0x18]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DE118: .word ov29_0235352C
	arm_func_end ov29_022DE0EC

	arm_func_start ov29_022DE11C
ov29_022DE11C: ; 0x022DE11C
	ldr r0, _022DE12C ; =ov29_0235352C
	ldr ip, _022DE130 ; =sub_02063770
	ldr r0, [r0]
	bx ip
	.align 2, 0
_022DE12C: .word ov29_0235352C
_022DE130: .word sub_02063770
	arm_func_end ov29_022DE11C

	arm_func_start ov29_022DE134
ov29_022DE134: ; 0x022DE134
	stmdb sp!, {r3, lr}
	ldr ip, _022DE158 ; =ov29_0235352C
	str r3, [sp]
	mov r2, r0
	mov r3, r1
	ldr r0, [ip]
	mov r1, #0
	bl sub_02063830
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE158: .word ov29_0235352C
	arm_func_end ov29_022DE134

	arm_func_start ov29_022DE15C
ov29_022DE15C: ; 0x022DE15C
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, r0
	bl sub_02051DD0
	mov r0, #1
	mov r1, #0
	bl sub_02051DD0
	mov r0, #0
	mov r1, #1
	bl sub_02051DD0
	mov r0, #1
	mov r1, r0
	bl sub_02051DD0
	mov r0, #0
	mov r1, r0
	bl sub_02051E60
	mov r0, #1
	mov r1, #0
	bl sub_02051E60
	mov r0, #0
	mov r1, #1
	bl sub_02051E60
	mov r0, #1
	mov r1, r0
	bl sub_02051E60
	mov r0, #0
	bl ov29_022DE1E4
	mov r0, #1
	bl ov29_022DE1E4
	mov r0, #0
	bl ov29_022DE208
	mov r0, #1
	bl ov29_022DE208
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DE15C

	arm_func_start ov29_022DE1E4
ov29_022DE1E4: ; 0x022DE1E4
	ldr r2, _022DE200 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _022DE204 ; =sub_0200B3D4
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_022DE200: .word ov29_0235352C
_022DE204: .word sub_0200B3D4
	arm_func_end ov29_022DE1E4

	arm_func_start ov29_022DE208
ov29_022DE208: ; 0x022DE208
	ldr r2, _022DE224 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _022DE228 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_022DE224: .word ov29_0235352C
_022DE228: .word sub_0200B330
	arm_func_end ov29_022DE208

	arm_func_start ov29_022DE22C
ov29_022DE22C: ; 0x022DE22C
	stmdb sp!, {r3, lr}
	mov r3, r0
	cmp r1, #0
	bne _022DE254
	ldr r2, _022DE26C ; =0x06005000
	add r0, r3, #4
	add r1, r3, #8
	str r2, [r3]
	bl sub_020275C0
	ldmia sp!, {r3, pc}
_022DE254:
	ldr r2, _022DE270 ; =0x06205000
	add r0, r3, #4
	add r1, r3, #8
	str r2, [r3]
	bl sub_020275DC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE26C: .word 0x06005000
_022DE270: .word 0x06205000
	arm_func_end ov29_022DE22C

	arm_func_start ov29_022DE274
ov29_022DE274: ; 0x022DE274
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end ov29_022DE274

	arm_func_start ov29_022DE288
ov29_022DE288: ; 0x022DE288
	ldr r0, [r0]
	bx lr
	arm_func_end ov29_022DE288

	arm_func_start ov29_022DE290
ov29_022DE290: ; 0x022DE290
	strh r1, [r0, #0xa]
	mov r2, #0
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	ldr r1, _022DE2C4 ; =DUNGEON_PTR
	strb r2, [r0, #0xf]
	ldr r2, [r1]
	mov r1, #1
	add r2, r2, #0x1e0
	str r2, [r0, #0x10]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_022DE2C4: .word DUNGEON_PTR
	arm_func_end ov29_022DE290

	arm_func_start ov29_022DE2C8
ov29_022DE2C8: ; 0x022DE2C8
	str r2, [r0, #0x14]
	strh r1, [r0, #0xa]
	mov r2, #0
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	ldr r1, _022DE2FC ; =DUNGEON_PTR
	strb r2, [r0, #0xf]
	ldr r1, [r1]
	add r1, r1, #0x1e0
	str r1, [r0, #0x10]
	strb r2, [r0, #8]
	bx lr
	.align 2, 0
_022DE2FC: .word DUNGEON_PTR
	arm_func_end ov29_022DE2C8

	arm_func_start ov29_022DE300
ov29_022DE300: ; 0x022DE300
	stmdb sp!, {r3, lr}
	mov r0, #0x74
	mov r1, #0
	bl MemAlloc
	ldr r2, _022DE410 ; =ov29_02353530
	mov r1, #0x74
	str r0, [r2]
	bl MemZero
	ldr r0, _022DE410 ; =ov29_02353530
	mov r2, #0x100
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r1, [r0]
	strh r2, [r1, #2]
	ldr r2, [r0]
	ldrsh r1, [r2, #2]
	strh r1, [r2, #6]
	ldr r2, [r0]
	ldrsh r1, [r2, #4]
	strh r1, [r2, #8]
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0200A2CC
	ldr r1, _022DE410 ; =ov29_02353530
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0x4c]
	strb r0, [r1, #0x4d]
	strb r0, [r1, #0x4e]
	strb r0, [r1, #0x4f]
	bl sub_02051ED4
	ldr r2, [r0, #0x14]
	ldr r1, _022DE410 ; =ov29_02353530
	mov r0, #0
	ldr r1, [r1]
	str r2, [r1, #0x34]
	bl sub_0201BCCC
	ldr r2, [r0, #0x14]
	ldr r1, _022DE410 ; =ov29_02353530
	mov r0, #0
	ldr r1, [r1]
	str r2, [r1, #0x38]
	bl sub_0201BCF4
	ldr r3, [r0, #0x14]
	ldr r1, _022DE410 ; =ov29_02353530
	mov r0, #1
	ldr r2, [r1]
	mov r1, #0
	str r3, [r2, #0x3c]
	bl sub_0201BD1C
	mov r0, #4
	ldr r1, _022DE414 ; =0x0000040A
	ldr r2, _022DE410 ; =ov29_02353530
	mov r3, #0
	ldr r2, [r2]
	add r2, r2, #0x40
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r0, _022DE410 ; =ov29_02353530
	ldr r1, [r0]
	add r0, r1, #0x48
	ldr r1, [r1, #0x40]
	bl HandleSir0Translation
	ldr r0, _022DE410 ; =ov29_02353530
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #0x51
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE410: .word ov29_02353530
#ifdef JAPAN
_022DE414: .word 0x000003FE
#else
_022DE414: .word 0x0000040A
#endif
	arm_func_end ov29_022DE300

	arm_func_start ov29_022DE418
ov29_022DE418: ; 0x022DE418
	stmdb sp!, {r3, lr}
	ldr r0, _022DE478 ; =ov29_02353530
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	bl sub_02051ED4
	ldr r1, _022DE478 ; =ov29_02353530
	ldr r1, [r1]
	ldr r1, [r1, #0x34]
	str r1, [r0, #0x14]
	mov r0, #0
	bl sub_0201BCCC
	ldr r1, _022DE478 ; =ov29_02353530
	ldr r1, [r1]
	ldr r1, [r1, #0x38]
	str r1, [r0, #0x14]
	mov r0, #0
	bl sub_0201BCF4
	ldr r1, _022DE478 ; =ov29_02353530
	ldr r1, [r1]
	ldr r1, [r1, #0x3c]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE478: .word ov29_02353530
	arm_func_end ov29_022DE418

	arm_func_start ov29_022DE47C
ov29_022DE47C: ; 0x022DE47C
	ldr r2, _022DE494 ; =ov29_02353530
	ldr r2, [r2]
	cmp r2, #0
	addne r0, r2, r0
	strneb r1, [r0, #0x51]
	bx lr
	.align 2, 0
_022DE494: .word ov29_02353530
	arm_func_end ov29_022DE47C

	arm_func_start ov29_022DE498
ov29_022DE498: ; 0x022DE498
	stmdb sp!, {r3, lr}
	ldr r0, _022DE4F8 ; =ov29_02353530
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_022DE418
	ldr r0, _022DE4F8 ; =ov29_02353530
	ldr r0, [r0]
	add r0, r0, #0x40
	bl UnloadFile
	mov r0, #0
	mov r1, r0
	bl sub_0201BD1C
	ldr r0, _022DE4F8 ; =ov29_02353530
	ldr r0, [r0]
	add r0, r0, #0xc
	bl sub_0200A2F4
	ldr r0, _022DE4F8 ; =ov29_02353530
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DE4F8 ; =ov29_02353530
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE4F8: .word ov29_02353530
	arm_func_end ov29_022DE498

	arm_func_start ov29_022DE4FC
ov29_022DE4FC: ; 0x022DE4FC
	stmdb sp!, {r4, lr}
	ldr r1, _022DE55C ; =ov29_02353530
	mov r0, #0
	ldr r1, [r1]
	ldrh r4, [r1, #4]
	bl sub_02051ED4
	ldr r2, _022DE560 ; =sub_01FF9BA0
	mov r1, r4
	bl ov29_022DE2C8
	mov r0, #0
	bl sub_0201BCCC
	ldr r1, _022DE55C ; =ov29_02353530
	ldr r2, _022DE564 ; =sub_01FF9E14
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	bl ov29_022DE2C8
	mov r0, #0
	bl sub_0201BCF4
	ldr r1, _022DE55C ; =ov29_02353530
	ldr r2, _022DE568 ; =sub_01FF9F80
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	bl ov29_022DE2C8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022DE55C: .word ov29_02353530
_022DE560: .word sub_01FF9BA0
_022DE564: .word sub_01FF9E14
_022DE568: .word sub_01FF9F80
	arm_func_end ov29_022DE4FC

	arm_func_start ov29_022DE56C
ov29_022DE56C: ; 0x022DE56C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	cmp r6, #1
	bne _022DE598
	mov r0, #0
	bl sub_02051ED4
	mov r1, r4, lsl #0x10
	mov r1, r1, lsr #0x10
	bl ov29_022DE290
	b _022DE5C0
_022DE598:
	mov r0, r4, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, #0
	bl sub_0201BCCC
	mov r1, r5
	bl ov29_022DE290
	mov r0, #0
	bl sub_0201BCF4
	mov r1, r5
	bl ov29_022DE290
_022DE5C0:
	ldr r0, _022DE5D4 ; =ov29_02353530
	ldr r0, [r0]
	add r0, r0, r6, lsl #1
	strh r4, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022DE5D4: .word ov29_02353530
	arm_func_end ov29_022DE56C

	arm_func_start ov29_022DE5D8
ov29_022DE5D8: ; 0x022DE5D8
	ldr r2, _022DE5EC ; =ov29_02353530
	ldr r2, [r2]
	add r1, r2, r1, lsl #1
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_022DE5EC: .word ov29_02353530
	arm_func_end ov29_022DE5D8

	arm_func_start ov29_022DE5F0
ov29_022DE5F0: ; 0x022DE5F0
	ldr r1, _022DE604 ; =ov29_02353530
	ldr r1, [r1]
	add r0, r1, r0, lsl #1
	ldrsh r0, [r0, #2]
	bx lr
	.align 2, 0
_022DE604: .word ov29_02353530
	arm_func_end ov29_022DE5F0

	arm_func_start ov29_022DE608
ov29_022DE608: ; 0x022DE608
	ldr r0, _022DE61C ; =ov29_02353530
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x50]
	bx lr
	.align 2, 0
_022DE61C: .word ov29_02353530
	arm_func_end ov29_022DE608

	arm_func_start GetWeatherColorTable
GetWeatherColorTable: ; 0x022DE620
	ldr r1, _022DE634 ; =ov29_02353530
	ldr r1, [r1]
	ldr r1, [r1, #0x48]
	add r0, r1, r0, lsl #10
	bx lr
	.align 2, 0
_022DE634: .word ov29_02353530
	arm_func_end GetWeatherColorTable

	arm_func_start ov29_022DE638
ov29_022DE638: ; 0x022DE638
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _022DE844 ; =DUNGEON_PTR
	mov r5, r0
	ldr r0, [r1]
	mov r4, #0
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	bl IsBackgroundTileset
	cmp r0, #0
	mov r1, r4
	bne _022DE754
	ldr r0, _022DE848 ; =ov29_023510BC
	mov r2, r5
	mov r3, r1
	str r1, [sp]
	bl sub_02051EF0
	mov r0, r4
	bl sub_02051D68
	mov r3, #1
	mov r1, r4
	str r3, [sp]
	ldr r0, _022DE848 ; =ov29_023510BC
	mov r2, r5
	mov r3, r1
	bl sub_02051EF0
	mov r0, #1
	bl sub_02051D68
	bl GetDefaultTileTextureId
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r7, #0
	add sb, r0, #4
	add r4, r4, #1
	mov r8, #1
	mov r6, r7
_022DE6C4:
	mov r1, r4, lsl #0x10
	mov r0, sb
	mov r2, r5
	mov r3, r7
	mov r1, r1, asr #0x10
	str r7, [sp]
	bl sub_02051EF0
	mov r0, r6
	bl sub_02051D68
	add r8, r8, #1
	cmp r8, #0xd0
	add sb, sb, #4
	add r4, r4, #1
	blt _022DE6C4
	mov sb, #0
	ldr r8, _022DE84C ; =ov29_0237C6D4
	mov r7, #0xd0
	mov r6, sb
	mov r4, sb
_022DE710:
	mov r1, r7, lsl #0x10
	mov r0, r8
	mov r2, r5
	mov r3, r6
	mov r1, r1, asr #0x10
	str r6, [sp]
	bl sub_02051EF0
	mov r0, r4
	bl sub_02051D68
	add r7, r7, #1
	cmp r7, #0xe0
	add sb, sb, #1
	addeq r7, r7, #0x10
	add r8, r8, #4
	cmp sb, #0x20
	blt _022DE710
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022DE754:
	ldr r0, _022DE848 ; =ov29_023510BC
	mov r2, r5
	mov r3, r1
	str r1, [sp]
	bl sub_02051EF0
	mov r0, r4
	bl sub_02051D68
	mov r3, #1
	mov r1, r4
	str r3, [sp]
	ldr r0, _022DE848 ; =ov29_023510BC
	mov r2, r5
	mov r3, r1
	bl sub_02051EF0
	mov r0, #1
	bl sub_02051D68
	bl GetDefaultTileTextureId
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r7, #0
	add r8, r0, #4
	add r4, r4, #1
	mov sb, #1
	mov r6, r7
_022DE7B4:
	mov r1, r4, lsl #0x10
	mov r0, r8
	mov r2, r5
	mov r3, r7
	mov r1, r1, asr #0x10
	str r7, [sp]
	bl sub_02051EF0
	mov r0, r6
	bl sub_02051D68
	add sb, sb, #1
	cmp sb, #0xe0
	add r8, r8, #4
	add r4, r4, #1
	blt _022DE7B4
	ldr r8, _022DE850 ; =ov29_0237C714
	mov r7, #0xf0
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov sb, #0
	mov r6, sb
	mov r4, sb
_022DE808:
	mov r1, r7, lsl #0x10
	mov r0, r8
	mov r2, r5
	mov r3, r6
	mov r1, r1, asr #0x10
	str r6, [sp]
	bl sub_02051EF0
	mov r0, r4
	bl sub_02051D68
	add sb, sb, #1
	cmp sb, #0x10
	add r8, r8, #4
	add r7, r7, #1
	blt _022DE808
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022DE844: .word DUNGEON_PTR
_022DE848: .word ov29_023510BC
_022DE84C: .word ov29_0237C6D4
_022DE850: .word ov29_0237C714
	arm_func_end ov29_022DE638

	arm_func_start ov29_022DE854
ov29_022DE854: ; 0x022DE854
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl sub_02051ED4
	bl sub_0200A544
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DE854

	arm_func_start ov29_022DE868
ov29_022DE868: ; 0x022DE868
	stmdb sp!, {r3, lr}
	ldr r0, _022DE900 ; =ov29_02353530
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r2, #0x50]
	cmp r0, #0
	ldreqsh r1, [r2, #4]
	ldreqsh r0, [r2, #8]
	cmpeq r1, r0
	beq _022DE8B0
	ldrsh r0, [r2, #4]
	mov r1, #1
	bl ov29_022DE56C
	ldr r0, _022DE900 ; =ov29_02353530
	ldr r1, [r0]
	ldrsh r0, [r1, #4]
	strh r0, [r1, #8]
_022DE8B0:
	ldr r0, _022DE900 ; =ov29_02353530
	ldr r2, [r0]
	ldrb r0, [r2, #0x50]
	cmp r0, #0
	ldreqsh r1, [r2, #2]
	ldreqsh r0, [r2, #6]
	cmpeq r1, r0
	beq _022DE8EC
	ldrsh r0, [r2, #2]
	mov r1, #0
	bl ov29_022DE56C
	ldr r0, _022DE900 ; =ov29_02353530
	ldr r1, [r0]
	ldrsh r0, [r1, #2]
	strh r0, [r1, #6]
_022DE8EC:
	ldr r0, _022DE900 ; =ov29_02353530
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x50]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE900: .word ov29_02353530
	arm_func_end ov29_022DE868

	arm_func_start ov29_022DE904
ov29_022DE904: ; 0x022DE904
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	mov r1, #0
	bl MemAlloc
	ldr r2, _022DE92C ; =ov29_02353534
	mov r1, #0x20
	str r0, [r2]
	bl MemZero
	bl ov29_022DEA34
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE92C: .word ov29_02353534
	arm_func_end ov29_022DE904

	arm_func_start ov29_022DE930
ov29_022DE930: ; 0x022DE930
	stmdb sp!, {r3, lr}
	ldr r0, _022DE950 ; =ov29_02353534
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022DE950 ; =ov29_02353534
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DE950: .word ov29_02353534
	arm_func_end ov29_022DE930

	arm_func_start ov29_022DE954
ov29_022DE954: ; 0x022DE954
	cmp r0, #0x10
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end ov29_022DE954

	arm_func_start ov29_022DE968
ov29_022DE968: ; 0x022DE968
	cmp r0, #0
	beq _022DE984
	cmp r0, #1
	beq _022DE990
	cmp r0, #2
	beq _022DE99C
	b _022DE9A8
_022DE984:
	mov r0, #0
	mov r3, #1
	b _022DE9B0
_022DE990:
	mov r0, #0x1b
	mov r3, #4
	b _022DE9B0
_022DE99C:
	mov r0, #1
	mov r3, #0x14
	b _022DE9B0
_022DE9A8:
	mov r3, #0
	mov r0, r3
_022DE9B0:
	ldr r1, _022DE9F4 ; =ov29_02353534
	mov r2, #0
	ldr ip, [r1]
	b _022DE9E4
_022DE9C0:
	ldrb r1, [ip, r0]
	cmp r1, #0
	bxeq lr
	add r2, r2, #1
	add r1, r0, #1
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, asr #0x10
	mov r0, r1, asr #0x10
_022DE9E4:
	cmp r2, r3
	blt _022DE9C0
	mvn r0, #0
	bx lr
	.align 2, 0
_022DE9F4: .word ov29_02353534
	arm_func_end ov29_022DE968

	arm_func_start ov29_022DE9F8
ov29_022DE9F8: ; 0x022DE9F8
	ldr r1, _022DEA0C ; =ov29_02353534
	mov r2, #1
	ldr r1, [r1]
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_022DEA0C: .word ov29_02353534
	arm_func_end ov29_022DE9F8

	arm_func_start ov29_022DEA10
ov29_022DEA10: ; 0x022DEA10
	ldr ip, _022DEA18 ; =ov29_022DE968
	bx ip
	.align 2, 0
_022DEA18: .word ov29_022DE968
	arm_func_end ov29_022DEA10

	arm_func_start ov29_022DEA1C
ov29_022DEA1C: ; 0x022DEA1C
	ldr r1, _022DEA30 ; =ov29_02353534
	mov r2, #0
	ldr r1, [r1]
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_022DEA30: .word ov29_02353534
	arm_func_end ov29_022DEA1C

	arm_func_start ov29_022DEA34
ov29_022DEA34: ; 0x022DEA34
	mov r3, #0
	ldr r0, _022DEA58 ; =ov29_02353534
	mov r2, r3
_022DEA40:
	ldr r1, [r0]
	strb r2, [r1, r3]
	add r3, r3, #1
	cmp r3, #0x20
	blt _022DEA40
	bx lr
	.align 2, 0
_022DEA58: .word ov29_02353534
	arm_func_end ov29_022DEA34

	arm_func_start DungeonAlloc
DungeonAlloc: ; 0x022DEA5C
	stmdb sp!, {r3, lr}
	ldr r0, _022DEA78 ; =0x0002CB14
	mov r1, #0
	bl MemAlloc
	ldr r1, _022DEA7C ; =DUNGEON_PTR
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_022DEA78: .word 0x0002CA70
#else
_022DEA78: .word 0x0002CB14
#endif
_022DEA7C: .word DUNGEON_PTR
	arm_func_end DungeonAlloc

	arm_func_start GetDungeonPtrMaster
GetDungeonPtrMaster: ; 0x022DEA80
	ldr r0, _022DEA8C ; =DUNGEON_PTR
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_022DEA8C: .word DUNGEON_PTR
	arm_func_end GetDungeonPtrMaster

	arm_func_start DungeonZInit
DungeonZInit: ; 0x022DEA90
	ldr r0, _022DEAA4 ; =DUNGEON_PTR
	ldr ip, _022DEAA8 ; =MemZero
	ldr r1, _022DEAAC ; =0x0002CB14
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022DEAA4: .word DUNGEON_PTR
_022DEAA8: .word MemZero
#ifdef JAPAN
_022DEAAC: .word 0x0002CA70
#else
_022DEAAC: .word 0x0002CB14
#endif
	arm_func_end DungeonZInit

	arm_func_start DungeonFree
DungeonFree: ; 0x022DEAB0
	stmdb sp!, {r3, lr}
	ldr r0, _022DEAD8 ; =DUNGEON_PTR
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _022DEAD8 ; =DUNGEON_PTR
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022DEAD8: .word DUNGEON_PTR
	arm_func_end DungeonFree

	arm_func_start ov29_022DEADC
ov29_022DEADC: ; 0x022DEADC
	stmdb sp!, {r3, lr}
	mov r0, #0x20
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DEADC

	arm_func_start ov29_022DEB40
ov29_022DEB40: ; 0x022DEB40
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_022DEB40

	arm_func_start ov29_022DEBA4
ov29_022DEBA4: ; 0x022DEBA4
	ldr ip, _022DEBAC ; =ov29_022DEADC
	bx ip
	.align 2, 0
_022DEBAC: .word ov29_022DEADC
	arm_func_end ov29_022DEBA4

	arm_func_start ov29_022DEBB0
ov29_022DEBB0: ; 0x022DEBB0
	ldr ip, _022DEBB8 ; =ov29_022DEB40
	bx ip
	.align 2, 0
_022DEBB8: .word ov29_022DEB40
	arm_func_end ov29_022DEBB0

	arm_func_start ov29_022DEBBC
ov29_022DEBBC: ; 0x022DEBBC
#ifdef JAPAN
#define OV29_022DEBBC_OFFSET -0xA4
#else
#define OV29_022DEBBC_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetHiddenFloorField
	mov r4, r0
	mov r0, #0
	bl SetForcedLossReason
	ldr r3, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r3]
	sub r0, r1, #1
	strb r1, [r2, #5]
	ldr r2, [r3]
	mov ip, #1
	strb r1, [r2, #6]
	ldr r2, [r3]
	strb r1, [r2, #0xc]
	ldr r2, [r3]
	strb r1, [r2, #7]
	ldr r2, [r3]
	strb r1, [r2, #0xa]
	ldr r2, [r3]
	strb r1, [r2, #0x11]
	ldr r2, [r3]
	str r0, [r2, #0x614]
	ldr r2, [r3]
	strb r1, [r2, #0xb]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xd8]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xda]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xdc]
	ldr r2, [r3]
	add r2, r2, #0x100
	strh r0, [r2, #0xde]
	ldr r0, [r3]
	strb r1, [r0, #0xd]
	ldr r0, [r3]
	strb ip, [r0, #0xf]
	ldr r0, [r3]
	strb r1, [r0, #0x10]
	ldr r0, [r3]
	ldrb r0, [r0, #0x748]
	bl IsIqEnabled
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	ldr r2, [r1]
	strb r0, [r2, #0x12]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl IsTrapInvisibleWhenAttacking
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0
	ldr r3, [r1]
	strb r0, [r3, #0x13]
	ldr r0, [r1]
	add r0, r0, #0x2c000
	strb r2, [r0, #0xb10 + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	strb r2, [r0, #8]
	ldr r0, [r1]
	str r2, [r0, #0x18]
	bl ov29_02349658
	cmp r5, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	bl SetHiddenStairsField
	bl ov29_02349188
	ldr r2, _022DEF2C ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r2]
	strb r0, [r1, #0x799]
	ldr r1, [r2]
	str r0, [r1, #0x7bc]
	ldr r1, [r2]
	str r0, [r1, #0x7c0]
	ldr r1, [r2]
	str r0, [r1, #0x7c4]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	strb r0, [r1, #0x790]
	ldr r1, [r2]
	strb r0, [r1, #0x791]
	bl ov29_022EAF34
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0
	ldr r2, [r0]
	ldr r5, _022DEF30 ; =0x000003E7
	strb r1, [r2, #0x78f]
	ldr r2, [r0]
	mov r3, #0x63
	strb r1, [r2, #0x78d]
	ldr r2, [r0]
	strb r1, [r2, #0x793]
	ldr r2, [r0]
	strb r1, [r2, #0x794]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r5, [r2, #0x96]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa4]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r3, [r2, #0xa6]
	ldr r2, [r0]
	add r2, r2, #0x700
	strh r1, [r2, #0x86]
	ldr r2, [r0]
	add r2, r2, #0xc000
	strb r1, [r2, #0xd38 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd4 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6b5 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strh r2, [r1, #0xd6 + OV29_022DEBBC_OFFSET]
	ldr r3, [r0]
	add r1, r3, #0x28000
	ldrb r2, [r1, #0x6c4 + OV29_022DEBBC_OFFSET]
	add r1, r3, #0x4000
	strb r2, [r1, #0xda + OV29_022DEBBC_OFFSET]
	ldr r1, [r0]
	ldrb r0, [r1, #0x798]
	cmp r0, #1
	bhi _022DEEA4
	add r0, r1, #0x700
	ldrsh r0, [r0, #0x4c]
	bl GetDungeonMode
	sub r0, r0, #2
	cmp r0, #1
	bhi _022DEE38
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	cmp r2, #0
	ldrne r1, _022DEF34 ; =FIXED_ROOM_REVISIT_OVERRIDES
	ldrneb r1, [r1, r2]
	cmpne r1, #0
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	cmp r1, #0xb3
	moveq r1, #0xb7
	streqh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
_022DEE38:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0x7d
	bne _022DEE78
	mov r0, #0
	mov r1, #0x10
	bl LoadScriptVariableValue
	cmp r0, #0
	beq _022DEEA4
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0x2a
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
	b _022DEEA4
_022DEE78:
	cmp r0, #0x87
	bne _022DEEA4
	mov r0, #0
	mov r1, #0xf
	bl LoadScriptVariableValue
	cmp r0, #0
	ldrne r0, _022DEF2C ; =DUNGEON_PTR
	movne r1, #0x2b
	ldrne r0, [r0]
	addne r0, r0, #0x4000
	strneb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEEA4:
	bl ov29_023484A0
	cmp r4, #1
	bne _022DEF08
	ldr r1, _022DEF2C ; =DUNGEON_PTR
	mov r2, #0x70
	ldr r0, [r1]
	add r0, r0, #0x4000
	strb r2, [r0, #0xda + OV29_022DEBBC_OFFSET]
	ldr r0, [r1]
	ldrb r0, [r0, #0x748]
	bl DungeonGoesUp
	cmp r0, #0
	beq _022DEEF0
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc4
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEEF0:
	ldr r0, _022DEF2C ; =DUNGEON_PTR
	mov r1, #0xc5
	ldr r0, [r0]
	add r0, r0, #0x4000
	strh r1, [r0, #0xd4 + OV29_022DEBBC_OFFSET]
	b _022DEF20
_022DEF08:
	cmp r4, #2
	ldreq r0, _022DEF2C ; =DUNGEON_PTR
	moveq r1, #0x71
	ldreq r0, [r0]
	addeq r0, r0, #0x4000
	streqb r1, [r0, #0xda + OV29_022DEBBC_OFFSET]
_022DEF20:
	mov r0, #0
	bl SetHiddenFloorField
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022DEF2C: .word DUNGEON_PTR
_022DEF30: .word 0x000003E7
_022DEF34: .word FIXED_ROOM_REVISIT_OVERRIDES
	arm_func_end ov29_022DEBBC

	arm_func_start RunDungeon
RunDungeon: ; 0x022DEF38
#ifdef JAPAN
#define RUN_DUNGEON_OFFSET -0xA4
#else
#define RUN_DUNGEON_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xd0
	mov sl, r0
	ldrb r5, [sl, #4]
	mov r8, #0
	mov sb, r1
	str r8, [sp]
	cmp r5, #0
	moveq r0, #1
	movne r0, r8
	ldrsb r1, [sl, #0xe]
	ldrb r6, [sl, #0x11]
	ldrb fp, [sl, #0xf]
	ldrb r7, [sl, #0x10]
	and r0, r0, #0xff
	cmp r1, #1
	str r0, [sp, #4]
	mov r0, #0
	bne _022DEF90
	bl ov29_0234C5EC
	mov r8, #1
	b _022DEF94
_022DEF90:
	bl ov29_0234C584
_022DEF94:
	mov r0, #1
	bl ov29_0234C584
	mov r0, #2
	bl ov29_022DDE00
	ldr r0, _022DFF3C ; =ov29_023510C8
	mov r1, #0x3e0
	bl Debug_Print0
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	cmp r5, #0
	str sb, [r0]
	ldrb r1, [sl]
	strb r1, [sb, #0x748]
	ldrb r1, [sl, #1]
	strb r1, [sb, #0x749]
	bne _022DF0AC
	ldrsb r2, [sl, #0xd]
	ldr r1, [r0]
	strb r2, [r1, #0x798]
	ldr r2, [r0]
	ldr r1, [sl, #0x14]
	ldr r0, [sl, #0x18]
	str r1, [r2, #0x750]
	str r0, [r2, #0x754]
	ldrb r0, [sl]
	bl GetTurnLimit
	ldr r2, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x700
	strh r0, [r1, #0x84]
	ldr r0, [r2]
	strb r3, [r0, #0x79a]
	ldrb r0, [sl]
	bl GetMaxRescueAttempts
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r1]
	strb r0, [r2, #0x79b]
	ldr r2, [sl, #0xac]
	ldr r0, [r1]
	str r2, [r0, #0x7cc]
	ldrb r2, [sl, #5]
	ldr r0, [r1]
	strb r2, [r0, #0x75c]
	ldrb r2, [sl, #8]
	ldr r0, [r1]
	strb r2, [r0, #0x75a]
	ldrb r2, [sl, #6]
	ldr r0, [r1]
	strb r2, [r0, #0x759]
	ldrb r2, [sl, #9]
	ldr r0, [r1]
	strb r2, [r0, #0x75b]
	ldrb r2, [sl, #0xa]
	ldr r0, [r1]
	strb r2, [r0, #0x75d]
	ldrb r2, [sl, #0xb]
	ldr r0, [r1]
	strb r2, [r0, #0x75e]
	ldrb r2, [sl, #0xc]
	ldr r0, [r1]
	strb r2, [r0, #0x75f]
	ldr r0, [r1]
	ldrsh r2, [sl, #2]
	add r0, r0, #0x700
	strh r2, [r0, #0x4c]
	ldrb r0, [sl, #7]
	cmp r0, #0
	ldrne r0, [r1]
	movne r1, #0
	strneb r1, [r0, #0x759]
_022DF0AC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	strb r3, [r2, #0x7c8]
	ldr r2, [r0]
	strb r3, [r2, #0x7c9]
	ldr r0, [r0]
	strb r1, [r0, #0x75b]
	bl ov29_022DE904
	bl ov29_022F6E40
	bl ov29_022ED030
	bl ov29_023388B0
	bl ov29_02338F10
	bl sub_02017B00
	mov r1, r5
	bl ov29_022EAF48
	bl AllocTopScreenStatus
	bl ov29_022E6F94
	bl ov29_022E1640
	bl ov29_023362EC
	bl OpenFixedBin
	bl ov29_022E9F18
	bl ov29_02338F68
	mov r0, #0
	bl ov29_02338F38
	mov r0, #1
	bl ov29_022E2B68
	bl ov29_0234AFA4
	bl ov29_0234BB10
	bl DungeonRngUnsetSecondary
	bl GetDungeonRngPreseed
	ldr r2, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0x340
	ldr r3, [r2]
	mov r2, #0
	str r0, [r3, #0x7ac]
	mov r0, #0x200
	bl ov10_022BDAB0
	mov r0, #0
	bl ov10_022BDB54
	mov r0, #0
	bl sub_02051ED4
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl sub_02051DFC
	str r0, [sp, #8]
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl GetBgRegionArea
	ldr r1, [sp, #8]
	mov r2, r4
	mov r3, #0
	bl ov10_022BDB60
	mov r0, #1
	bl sub_02051ED4
	mov r4, r0
	mov r0, #0
	mov r1, #1
	bl sub_02051DFC
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, r0
	mov r2, #1
	bl GetBgRegionArea
	ldr r1, [sp, #0xc]
	mov r2, r4
	mov r3, #1
	bl ov10_022BDB60
	mov r0, #0xb000
	mov r1, #0xb
	bl ov10_022BDB80
	mov r0, #0x2000
	mov r1, #0xa
	bl ov10_022BDBA4
	bl ov29_022E0F6C
	bl ov29_022E8104
	bl ov29_022E7F7C
	bl ov29_022E1304
	bl ov29_022E6E40
	bl ov29_022FE4A8
	bl ov29_023480FC
	mov r0, #2
	bl ov29_022DDE00
	ldrsb r0, [sl, #0xe]
	cmp r0, #1
	beq _022DF214
	bl ov29_022DEADC
_022DF214:
	cmp r5, #0
	beq _022DF22C
	bl ov29_0234CB34
	bl ov29_0234CB54
	bl ov29_023365E8
#ifndef JAPAN
	bl ov29_02348850
#endif
_022DF22C:
	cmp r6, #0
	beq _022DF238
	bl ov29_022E0434
_022DF238:
	cmp r5, #0
	bne _022DF2D0
	add r0, sb, #0x1a000
	mov r2, #1
	strb r2, [r0, #0x23f + RUN_DUNGEON_OFFSET]
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	strb r2, [r0, #0x240 + RUN_DUNGEON_OFFSET]
	ldr r0, [r1]
	add r0, r0, #0x7d0
	bl ov29_0231B39C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	ldreqb r1, [sl, #0x14]
	moveq r0, #1
	streqb r1, [sb, #0x748]
	streqb r0, [sb, #0x749]
	ldrb r0, [sb, #0x748]
	bl ChangeGiratinaFormIfSkyDungeon
	bl ov29_022E081C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	ldreq r0, [sl, #0x18]
	streq r0, [sb, #0x7a0]
	beq _022DF2C4
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl sub_02051134
	bic r0, r0, #0xff000000
	str r0, [sb, #0x7a0]
	bl sub_020634F4
_022DF2C4:
	ldr r0, [sb, #0x7a0]
	bl SetDungeonRngPreseed23Bit
	b _022DF2D8
_022DF2D0:
	ldr r0, [sb, #0x7ac]
	bl SetDungeonRngPreseed
_022DF2D8:
	cmp r6, #0
	beq _022DF31C
	add r0, sb, #0x700
	ldrsb r1, [r0, #0x9b]
	mov r0, #0
	bl ov29_0234B09C
	add r0, sb, #0x700
	ldrsb r0, [r0, #0x9b]
	mov r2, #1
	cmp r0, #0
	mov r0, #0
	beq _022DF314
	ldr r1, _022DFF44 ; =0x00000B6B
	bl DisplayMessage2
	b _022DF31C
_022DF314:
	ldr r1, _022DFF48 ; =0x00000B6C
	bl DisplayMessage2
_022DF31C:
	cmp fp, #0
	beq _022DF3B0
	add r4, sl, #0x1c
	ldrb r0, [r4, #2]
	cmp r0, #0xfa
	bne _022DF364
	ldrb r0, [sb, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _022DF34C
	mov r0, r4
	bl sub_02052EFC
_022DF34C:
	mov r0, r4
	bl ov29_022F7910
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp]
	b _022DF3A4
_022DF364:
	mov r6, #0
	mov fp, #0x44
_022DF36C:
	ldrb r0, [sb, #0x748]
	bl IsLevelResetDungeon
	cmp r0, #0
	beq _022DF384
	smlabb r0, r6, fp, r4
	bl sub_02052EFC
_022DF384:
	mov r0, #0x44
	smlabb r0, r6, r0, r4
	bl ov29_022F7BF4
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #2
	blt _022DF36C
_022DF3A4:
	cmp r5, #0
	beq _022DF3B0
	bl ov29_022FC9C0
_022DF3B0:
	cmp r5, #0
	addeq r0, sb, #0x700
	ldreqsb r0, [r0, #0x98]
	cmpeq r0, #2
	bne _022DF418
	add r0, sp, #0x10
	bl sub_0204F1B4
	cmp r0, #0
	beq _022DF418
	ldrsb r0, [sp, #0x10]
	bl sub_0205B77C
	ldrsb r0, [r0, #0xac]
	cmp r0, #0
	beq _022DF408
	add r1, r0, #1
	mov r0, #0
	bl ov29_0234B09C
	ldr r1, _022DFF4C ; =0x00000B6D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _022DF418
_022DF408:
	ldr r1, _022DFF50 ; =0x00000B6E
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022DF418:
	ldrsb r0, [sl, #0xe]
	cmp r0, #1
	beq _022DF428
	bl ov29_022DEB40
_022DF428:
	mov r0, #2
	bl ov29_022DDE00
	mov r0, #0
	bl ov10_022BDBB0
	bl ov29_022F6EF4
	bl ov29_022E8104
	bl ov29_022E7F7C
	bl ov29_0234B04C
	bl ov29_0234BB2C
	bl ov29_022DE4FC
	cmp r5, #0
	bne _022DF460
	bl ov29_022DEA34
	bl ov29_022E1640
_022DF460:
	ldr r0, _022DFF54 ; =LEADER_PTR
	mov r1, #0
	str r1, [r0]
	bl GetHiddenFloorField
	mov r6, r0
	bl SetBothScreensWindowColorToDefault
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r2, #0
	ldr r0, [r1]
	cmp r5, #0
	strb r2, [r0, #4]
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0xe28 + RUN_DUNGEON_OFFSET]
	bne _022DF4E4
	ldr r0, [r1]
	mov r1, #0xa
	add r0, r0, #0x700
	strh r1, [r0, #0x88]
	bl GetHiddenFloorField
	cmp r0, #0
	bne _022DF4E4
	bl GenerateDungeonRngSeed
	mov r4, r0
	bl GetDungeonRngPreseed
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r1]
	str r0, [r2, #0x7ac]
	ldr r0, [r1]
	str r4, [r0, #0x79c]
	ldr r0, [r1]
	ldr r0, [r0, #0x79c]
	bl InitDungeonRng
_022DF4E4:
	cmp r5, #0
	bne _022DF53C
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #4
	add r1, r1, #0x3000
	strb r2, [r1, #0xe38 + RUN_DUNGEON_OFFSET]
	bl DungeonRandInt
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r2, _022DFF58 ; =ov29_023510C0
	mov r3, r0, lsl #1
	ldr r0, [r1]
	ldrsh r3, [r2, r3]
#ifdef JAPAN
	add r0, r0, #0x3d00
	mov r2, #0
	strh r3, [r0, #0x96]
#else
	add r0, r0, #0x3e00
	mov r2, #0
	strh r3, [r0, #0x3a + RUN_DUNGEON_OFFSET]
#endif
	ldr r0, [r1]
	add r0, r0, #0x3000
	strb r2, [r0, #0xe39 + RUN_DUNGEON_OFFSET]
	ldr r0, [r1]
	strb r2, [r0, #0x78a]
_022DF53C:
	cmp r6, #0
	movne r1, #1
	moveq r1, #0
	ldr r2, _022DFF5C ; =ov29_022DEBBC
	mov r0, r5
	and r1, r1, #0xff
	bl LoadMappaFileAttributes
	mov r0, #0
	bl ov29_0234B4CC
	bl ov29_0234BB38
	cmp r5, #0
	bne _022DF574
	mov r0, #0
	bl ov29_02334DA8
_022DF574:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4 + RUN_DUNGEON_OFFSET]
	bl ov29_023389C4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0xc000
	ldrb r0, [r0, #0xd38 + RUN_DUNGEON_OFFSET]
	bl ov29_02338A4C
	bl ov29_022E8708
	bl ov29_022DD5B4
	bl ov29_023369F8
	bl ov29_022E7CFC
	bl ov29_022F7130
	cmp r5, #0
	bne _022DF5C4
	bl ov29_0231B460
	bl ov29_022F7104
	b _022DF5CC
_022DF5C4:
	bl ov29_022F7308
	bl ov29_022FBB1C
_022DF5CC:
	bl ov29_022FE2E4
	bl InitEnemySpawnStats
	cmp r5, #0
	bne _022DF5E4
	bl ov29_022EAD68
	bl ov29_022EF738
_022DF5E4:
	bl ov29_023365E8
	bl ov29_022E1550
	mov r0, #0
	bl ov29_02338F38
	mov r0, #4
	mov r1, #0
	bl ov29_022EA428
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, r5
	bl ov29_022E2B68
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + RUN_DUNGEON_OFFSET]
	bl IsRoomIlluminated
	cmp r0, #0
	addne r0, sb, #0x1a000
	movne r1, #1
	strneb r1, [r0, #0x23f + RUN_DUNGEON_OFFSET]
	strneb r1, [r0, #0x240 + RUN_DUNGEON_OFFSET]
	bl IsSecretBazaarVeneer
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + RUN_DUNGEON_OFFSET]
	bl IsBossFight
	cmp r0, #0
	bne _022DF660
	mov r0, #0x3c
	bl DisplayFloorCard
_022DF660:
	bl ov29_022E12F8
	cmp r5, #0
	bne _022DF68C
	bl ov29_0233845C
	bl GenerateFloor
	ldrb r0, [sb, #0x748]
	bl GetTurnLimit
	add r1, sb, #0x700
	strh r0, [r1, #0x84]
	mov r0, #0
	strb r0, [sb, #0x79a]
_022DF68C:
	bl ov29_0233785C
	bl DetermineAllTilesWalkableNeighbors
	bl ov29_02336460
	cmp r5, #0
	bne _022DF6C0
	ldr r0, [sp, #4]
	bl SpawnTeam
	mov r0, #0
	str r0, [sp, #4]
	bl SpawnShopkeepers
	bl SpawnInitialMonsters
	bl ResetGravity
	b _022DF6F8
_022DF6C0:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
	ldrb r0, [r0, #0x245 + RUN_DUNGEON_OFFSET]
	cmp r0, #0
	beq _022DF6F4
	bl GetLeader
	cmp r0, #0
	ldrne r0, _022DFF40 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x2c000
	strneb r1, [r0, #0xb10 + RUN_DUNGEON_OFFSET]
_022DF6F4:
	bl ov29_022FCD04
_022DF6F8:
	bl ov29_0231AFB4
	add r0, sb, #0x19000
	mov r1, #0
	str r1, [r0, #0x904 + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x90c + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x908 + RUN_DUNGEON_OFFSET]
	str r1, [r0, #0x910 + RUN_DUNGEON_OFFSET]
	cmp r5, #0
	bne _022DF74C
	bl ov29_022ED888
	bl ov29_0233873C
	bl ov29_02344C4C
	bl TrySpawnDoughSeedPoke
	ldr r1, [sb, #0x7bc]
	mov r0, #0
	str r1, [sb, #0x7c4]
	str r0, [sb, #0x7c0]
	bl ov29_02343980
	bl ov29_0233781C
	bl ClearHiddenStairs
	b _022DF750
_022DF74C:
	bl ov29_022F9970
_022DF750:
	bl ov29_022F7EAC
	bl ov29_0233665C
	bl UpdateTrapsVisibility
	cmp r5, #0
	bne _022DF778
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl ov29_022FA2F0
	b _022DF780
_022DF778:
	bl ov29_02304B64
	bl ov29_022FA524
_022DF780:
	mov r0, #1
	bl ov29_022E3A58
	cmp r5, #0
	bne _022DF798
	bl ov29_022EF8A4
	bl ov29_022FA418
_022DF798:
	ldr r0, _022DFF60 ; =ov29_02353563
	mov r1, #1
	strb r1, [r0]
	cmp r5, #0
	beq _022DF7B4
	bl ov29_023350FC
	bl ov29_022FA750
_022DF7B4:
	bl CountItemsOnFloorForAcuteSniffer
	mov r0, r5
	bl ov29_0233904C
	mov r0, #1
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0233A15C
	bl sub_0204AEA0
	cmp r0, #3
	bne _022DF7EC
	mov r0, #1
	bl ov29_0233A1BC
	bl UpdateMinimap
_022DF7EC:
	mov r0, #0
	bl ov29_022E34B0
	mov r0, #0
	mov r1, r0
	bl ov29_022EA3F8
	bl ov29_022E0DFC
	cmp r8, #0
	mov r1, #0x1000
	mov r2, #0
	beq _022DF824
	mov r0, #4
	bl StartFadeDungeonWrapper
	mov r8, #0
	b _022DF82C
_022DF824:
	mov r0, #1
	bl StartFadeDungeonWrapper
_022DF82C:
	mov r0, #1
	mov r2, r0
	mov r1, #0x1000
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	bl ov29_022E0E44
	mov r0, #1
	bl ov29_022E8BFC
	mov r0, #1
	bl ov29_022EA418
	mov r0, #0
	bl ov29_02339FD0
	mov r0, #0
	mov r1, r0
	bl ov29_0233A0E8
	mov r0, #0
	bl ov29_02338F48
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldr r0, [sp]
	mov r1, #0
	str r1, [sb, #0xc4]
	strb r1, [sb, #0x78b]
	cmp r0, #0
	strb r1, [sb, #0x78c]
	mov r0, #0x63
	strh r0, [sb, #0x1c]
	mov r2, #1
	ldr r0, _022DFF54 ; =LEADER_PTR
	strb r2, [sb, #4]
	str r1, [r0]
	beq _022DF8E4
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r0, #4
	ldr r1, [r1]
	strb r2, [r1, #8]
	bl SetForcedLossReason
	ldrsh r1, [sl, #0x20]
	mov r0, #0
	bl ov29_0234B06C
	ldr r1, _022DFF64 ; =0x00000B73
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
_022DF8E4:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	cmp r5, #0
	strb r1, [r0, #9]
	beq _022DF90C
	bl TryActivateArtificialWeatherAbilities
	mov r0, #1
	bl ov29_022F62CC
	b _022DF9B0
_022DF90C:
	bl DisplayFloorTip
	bl ov29_022EF9B8
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	ldreqb r0, [r1, #6]
	cmpeq r0, #0
	movne r0, #1
	strneb r0, [r1, #9]
	bne _022DF944
	bl GetLeader
	bl ov29_022E2DFC
	bl UpdateMinimap
_022DF944:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _022DF974
	bl ov29_02334D58
	mov r0, #0
	bl GetApparentWeather
	cmp r0, #0
	beq _022DF974
	mov r0, #1
	bl ov29_02335044
_022DF974:
	mov r0, #1
	bl ov29_022FACBC
	mov r0, #0
	bl ov29_022FAA58
	bl TryActivateIqBooster
	mov r0, #0
	bl ov29_022FAF08
	bl TryActivateSlowStart
	bl ov29_02349C84
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0xa4
	bne _022DF9B0
	bl TryInflictBurnStatusWholeTeam
_022DF9B0:
	cmp r7, #0
	beq _022DFA78
	bl GetLeader
	movs r4, r0
	beq _022DFA78
	mov r0, #8
	bl DungeonRandInt
	and r0, r0, #0xff
	and r3, r0, #7
	ldr r0, _022DFF68 ; =DIRECTIONS_XY
	mov r1, r3, lsl #2
	ldrsh r2, [r0, r1]
	add r0, r0, r3, lsl #2
	ldrsh r3, [r4, #4]
	ldrsh r0, [r0, #2]
	ldrsh r1, [r4, #6]
	add r2, r3, r2
	strh r2, [sp, #0x12]
	mov r2, #0
	add r0, r1, r0
	strh r0, [sp, #0x14]
	ldrh r1, [sp, #0x14]
	ldrh r0, [sp, #0x12]
	strb r2, [sp, #0x3c]
	strb r2, [sp, #0x3a]
	add r2, sl, #0xa4
	str r2, [sp, #0xcc]
	mov r2, #3
	str r2, [sp, #0x18]
	mov r2, #1
	strb r2, [sp, #0x38]
	strh r1, [sp, #0x1e]
	strh r0, [sp, #0x1c]
	ldrsh r2, [sp, #0x12]
	mov r0, #0x18
	ldrsh r1, [sp, #0x14]
	smulbb r2, r2, r0
	smulbb r0, r1, r0
	add r1, r2, #4
	add r2, r0, #4
	add r0, sp, #0x18
	mov r1, r1, lsl #8
	mov r2, r2, lsl #8
	bl SetEntityPixelPosXY
	mov r3, #0
	mov r0, r4
	add r1, sp, #0x18
	add r2, sl, #0xa4
	strh r3, [sp, #0x3e]
	bl ov29_02345D84
_022DFA78:
	mov r0, #0
	bl ov29_022EA418
	mov r0, #1
	bl ov29_02338F48
	mov r0, #1
	bl ov29_02339F88
	bl UpdateMinimap
	cmp r5, #0
	bne _022DFAA4
	mov r0, #0
	bl ov29_022FAD4C
_022DFAA4:
	mov r7, #0
	cmp r5, #0
	movne r5, r7
	bne _022DFAD4
	bl ov29_022E5F20
	bl GetLeader
	add r1, sb, #0x4000
	ldrb r1, [r1, #0xc4 + RUN_DUNGEON_OFFSET]
	bl ov29_02305814
	mov r0, #1
	mov r1, r7
	bl TryActivateWeather
_022DFAD4:
#ifdef JAPAN
	mov r0, #0x14000
#else
	mov r0, #0x10c00
#endif
	bl ov10_022BFE6C
	bl sub_02001808
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _022DFB2C
	mov r4, #1
	mov r2, #0
	mov r0, r4
	strb r2, [sb, #0x758]
	add r1, sb, #0x1a000
	strb r2, [r1, #0x24d + RUN_DUNGEON_OFFSET]
	bl SetMinimapDataE447
	mov r6, #0
_022DFB14:
	mov r0, r4
	bl RunFractionalTurn
	mov r4, r6
	bl IsFloorOver
	cmp r0, #0
	beq _022DFB14
_022DFB2C:
	mov r0, #0
	bl ov29_0234B010
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0
	bl ov29_022E8BFC
	bl GetLeader
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022DFB5C
	bl GetLeader
	bl EnemyEvolution
_022DFB5C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x758]
	cmp r0, #1
	beq _022DFB8C
	mov r0, #1
	bl TryForcedLoss
	cmp r0, #0
	ldrne r0, _022DFF40 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x758]
_022DFB8C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x758]
	cmp r0, #1
	beq _022DFBAC
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _022DFBC4
_022DFBAC:
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	ldreqb r0, [r1, #0x75f]
	cmpeq r0, #0
	bne _022DFBC4
	bl ov29_022FA648
_022DFBC4:
	bl GetLeader
	bl EntityIsValid__022E0354
	cmp r0, #0
	beq _022DFBE4
	mov r0, #0x4f
	bl ov29_0234BA18
	mov r0, #0x4f
	bl ov29_0234BA54
_022DFBE4:
	mov r0, #0
	bl ov29_02338F38
	mov r0, #1
	mov r1, #0
	bl ov29_022EA428
	mov r0, #0
	bl SetMinimapDataE447
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r2, #1
	ldr r1, [r0]
	mov r0, #4
	add r1, r1, #0x1a000
	strb r2, [r1, #0x24d + RUN_DUNGEON_OFFSET]
	mov r1, #0x4f
	bl ov29_022EA370
	bl ov29_022E9FC0
	cmp r0, #0
	beq _022DFC30
	bl FadeToBlack
_022DFC30:
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	bl GetForcedLossReason
	cmp r0, #2
	beq _022DFC60
	bl GetForcedLossReason
	cmp r0, #3
	bne _022DFDB0
_022DFC60:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _022DFDB0
	bl GetLeader
	mov r4, r0
	mov r0, #0
	bl ov29_0233A248
	mov r0, #1
	bl ov29_023359F8
	mov r0, #0x20
	bl ov29_0234C654
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_02009194
	mov r0, #1
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #0
#ifdef JAPAN
	mov r1, #0x880
#else
	ldr r1, _022DFF6C ; =0x00000B6F
#endif
	mov r2, #1
	bl DisplayMessage
	mov r0, #2
	mov r1, #0x4000
	mov r2, #0
	bl StartFadeDungeonWrapper
	mov r0, #0
	bl ov29_0234C738
	mov r0, #1
	bl ov29_0234C654
	mov r0, #0
	bl ov29_023359F8
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_020091B0
	mov r0, #3
	mov r1, #0
	bl sub_020091B0
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r1, #0
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	strb r1, [r0, #0xa]
	bl GetForcedLossReason
	cmp r0, #3
	bne _022DFD9C
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldr r0, _022DFF70 ; =0x00000266
	ldr r2, [r1]
	mov r1, r4
	add r3, r2, #0x248
	mov r2, r4
	add r3, r3, #0x400
	bl ov29_022ECDE4
	b _022DFDB0
_022DFD9C:
	ldr r0, _022DFF74 ; =0x00000261
	mov r1, r4
	mov r2, r4
	mov r3, #0
	bl ov29_022ECDE4
_022DFDB0:
	bl UpdateShouldBoostKecleonShopSpawnChance
	bl UpdateShouldBoostHiddenStairsSpawnChance
	bl DeleteAllMonsterSpriteFiles
	bl ov29_023365B8
	bl ov29_022DD7AC
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, _022DFF60 ; =ov29_02353563
	mov r3, #0
	ldr r2, [r0]
	strb r3, [r1]
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _022DFE0C
	bl ov29_0234CA84
	mov r1, #3
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	str r1, [sl, #0xb0]
	ldr r1, [r0]
	ldrb r0, [r1, #0x748]
	strb r0, [sl, #0xb4]
	ldrb r0, [r1, #0x749]
	strb r0, [sl, #0xb5]
	b _022E026C
_022DFE0C:
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	beq _022DFE1C
	bl ov29_0234CA84
_022DFE1C:
	bl ov29_022FDFA4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _022DFE3C
	mov r0, #2
	bl ov29_023469E0
_022DFE3C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x758]
	cmp r0, #1
	bne _022DFE64
	ldrb r0, [r1, #0x790]
	cmp r0, #0
	beq _022E00EC
	bl ov29_02346A64
	b _022E00EC
_022DFE64:
	ldr r0, [r1, #0x18]
	mov r1, #0
	cmp r0, #1
	bne _022DFE94
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF78 ; =0x00000279
	mov r3, r1
	bl ov29_022ECDE4
	mov r1, #1
	b _022DFF8C
_022DFE94:
	cmp r0, #2
	bne _022DFED4
	bl GetLeader
	mov r1, #0
	mov r2, r0
	mov r3, r1
	mov r0, #0x27c
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022DFECC
	bl IncrementNbSteals
_022DFECC:
	mov r1, #1
	b _022DFF8C
_022DFED4:
	cmp r0, #3
	bne _022DFF14
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF7C ; =0x0000027D
	mov r3, r1
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022DFF0C
	bl IncrementNbSteals
_022DFF0C:
	mov r1, #1
	b _022DFF8C
_022DFF14:
	cmp r0, #4
	bne _022DFF84
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	mov r1, #1
	b _022DFF8C
	.align 2, 0
#ifdef JAPAN
#define RUN_DUNGEON_DATA_OFFSET -0x2EF
#else
#define RUN_DUNGEON_DATA_OFFSET 0
#endif
_022DFF3C: .word ov29_023510C8
_022DFF40: .word DUNGEON_PTR
_022DFF44: .word 0x00000B6B + RUN_DUNGEON_DATA_OFFSET
_022DFF48: .word 0x00000B6C + RUN_DUNGEON_DATA_OFFSET
_022DFF4C: .word 0x00000B6D + RUN_DUNGEON_DATA_OFFSET
_022DFF50: .word 0x00000B6E + RUN_DUNGEON_DATA_OFFSET
_022DFF54: .word LEADER_PTR
_022DFF58: .word ov29_023510C0
_022DFF5C: .word ov29_022DEBBC
_022DFF60: .word ov29_02353563
_022DFF64: .word 0x00000B73 + RUN_DUNGEON_DATA_OFFSET
_022DFF68: .word DIRECTIONS_XY
#ifndef JAPAN
_022DFF6C: .word 0x00000B6F
#endif
_022DFF70: .word 0x00000266
_022DFF74: .word 0x00000261
_022DFF78: .word 0x00000279
_022DFF7C: .word 0x0000027D
_022DFF80: .word 0x0000027A
_022DFF84:
	cmp r0, #5
	moveq r1, #1
_022DFF8C:
	cmp r1, #0
	bne _022E00EC
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	bne _022DFFFC
	bl GetFloorType
	cmp r0, #2
	ldreq r0, _022DFF40 ; =DUNGEON_PTR
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x758]
	cmpeq r0, #2
	bne _022DFFFC
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022E034C ; =0x0000027B
	mov r3, r1
	bl ov29_022ECDE4
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022E00EC
	bl IncrementNbSteals
	b _022E00EC
_022DFFFC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	beq _022E0014
	bl IncrementNbSteals
_022E0014:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r4, [r0]
	add r0, r4, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #3
	bne _022E005C
	ldrb r0, [r4, #0x748]
	bl GetMaxReachedFloor
	ldrb r1, [r4, #0x749]
	cmp r0, r1
	bhi _022E005C
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	b _022E00EC
_022E005C:
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	ldrb r0, [r4, #0x748]
	ldr r4, [r1]
	bl GetMaxReachedFloor
	ldrb r1, [r4, #0x749]
	cmp r1, r0
	bls _022E008C
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x748]
	ldrb r1, [r1, #0x749]
	bl SetMaxReachedFloor
_022E008C:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	add r0, r1, #0x2c000
	ldrb r1, [r1, #0x749]
	ldrb r0, [r0, #0xaf4 + RUN_DUNGEON_OFFSET]
	add r1, r1, #1
	cmp r1, r0
	blt _022E00C8
	bl GetLeader
	mov r2, r0
	mov r1, #0
	ldr r0, _022DFF80 ; =0x0000027A
	mov r3, r1
	bl ov29_022ECDE4
	b _022E00EC
_022E00C8:
	bl GetHiddenFloorField
	cmp r0, #0
	bne _022DF428
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, [r0]
	ldrb r0, [r1, #0x749]
	add r0, r0, #1
	strb r0, [r1, #0x749]
	b _022DF428
_022E00EC:
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r1, _022DFF60 ; =ov29_02353563
	mov r2, #0
	ldr r0, [r0]
	strb r2, [r1]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _022E0150
	add r0, sl, #0xc0
	bl ov29_022ECFB8
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0x791]
	bl ov29_022EAF34
	ldr r1, _022DFF40 ; =DUNGEON_PTR
	mov r3, #0
	ldr r0, [r1]
	ldr r2, _022E0350 ; =0x000003E7
	strb r3, [r0, #0x794]
	ldr r0, [r1]
	add r0, r0, #0x700
	strh r2, [r0, #0x96]
	ldr r0, [r1]
	strb r3, [r0, #0x7c9]
_022E0150:
	cmp sl, #0
	beq _022E026C
	bl ov29_022ECF44
	cmp r0, #0
	beq _022E01D8
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _022E01C8
	mvn r2, #1
	add r0, sl, #0xb8
	mov r1, #8
	str r2, [sl, #0xb0]
	bl MemZero
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r2, [r0]
	ldrb r1, [r2, #0x748]
	strb r1, [sl, #0xb4]
	ldrb r1, [r2, #0x749]
	strb r1, [sl, #0xb5]
	ldr r2, [r0]
	ldrb r1, [r2, #0x748]
	strb r1, [sl, #0xb8]
	ldrb r1, [r2, #0x749]
	strb r1, [sl, #0xb9]
	ldr r0, [r0]
	ldr r0, [r0, #0x7a0]
	str r0, [sl, #0xbc]
	b _022E026C
_022E01C8:
	mvn r0, #0
	str r0, [sl, #0xb0]
	bl ov29_023488C8
	b _022E026C
_022E01D8:
	bl ov29_022ECF78
	cmp r0, #0
	beq _022E0244
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #2
	moveq r0, #4
	streq r0, [sl, #0xb0]
	beq _022E026C
	cmp r0, #3
	moveq r0, #1
	streq r0, [sl, #0xb0]
	beq _022E026C
	cmp r0, #0
	bne _022E022C
	mov r0, #1
	str r0, [sl, #0xb0]
	bl ov29_02348894
	b _022E026C
_022E022C:
	bl ov29_02348918
	bl ov29_02348994
	mov r0, #1
	str r0, [sl, #0xb0]
	bl ov29_02348894
	b _022E026C
_022E0244:
	mov r1, #2
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	str r1, [sl, #0xb0]
	ldr r0, [r0]
	add r0, r0, #0x700
	ldrsb r0, [r0, #0x98]
	cmp r0, #1
	bne _022E0268
	bl ov29_02348994
_022E0268:
	bl ov29_02348894
_022E026C:
	bl SetBothScreensWindowColorToDefault
	mov r0, #0x14
	bl ov29_022EAEAC
	mov r0, #0x14
	bl ov29_022DDE00
	bl ov29_022E15C8
	bl ov29_022E1604
	bl ov29_02338FC8
	cmp sl, #0
	beq _022E030C
	ldr r1, [sl, #0xb0]
	mvn r0, #1
	cmp r1, r0
	cmpne r1, #3
	beq _022E02B4
	bl sub_02057E90
	mvn r0, #0
	bl sub_02058644
_022E02B4:
	ldr r1, [sl, #0xb0]
	cmp r1, #1
	cmpne r1, #4
	cmpne r1, #2
	bne _022E02D4
	bl ov29_02346DA4
	bl RefillTeam
	b _022E02EC
_022E02D4:
	mvn r0, #0
	cmp r1, r0
	bne _022E02EC
	bl ov29_02346E48
	bl ov29_022F7E34
	bl sub_02057EF4
_022E02EC:
	ldr r0, [sl, #0xb0]
	cmp r0, #1
	cmpne r0, #4
	cmpne r0, #2
	moveq r0, #1
	streqb r0, [sl, #0x1a8]
	movne r0, #0
	strneb r0, [sl, #0x1a8]
_022E030C:
	bl ov10_022BDC0C
	bl FreeTopScreenStatus
	bl ov29_0234AFD0
	bl ov29_0234BB20
	bl ov29_02338D30
	bl ov29_022ED0B0
	bl ov29_022DE930
	bl FreeLoadedAttackSpriteAndMore
	ldr r0, _022DFF40 ; =DUNGEON_PTR
	mov r1, #0
	str r1, [r0]
	bl ov29_022DE15C
	bl CloseFixedBin
	mov r0, #1
	add sp, sp, #0xd0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022E034C: .word 0x0000027B
_022E0350: .word 0x000003E7
	arm_func_end RunDungeon
