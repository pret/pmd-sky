	.include "asm/macros.inc"
	.include "overlay_02.inc"
	.include "global.inc"

	.text

	arm_func_start ov02_02329520
ov02_02329520: @ 0x02329520
	push {r4, lr}
	bl FUN_022E0A70
	bl FUN_022BDC5C
	ldr r0, _0232955C @ =0x00040020
	mov r1, #8
	bl FUN_02001170
	mov r4, r0
	add r0, r4, #0x1f
	bic r0, r0, #0x1f
	mov r1, #1
	mov r2, #0
	bl ov02_023388B4
	mov r0, r4
	bl FUN_02001188
	pop {r4, pc}
	.align 2, 0
_0232955C: .4byte 0x00040020
	arm_func_end ov02_02329520

	arm_func_start ov02_02329560
ov02_02329560: @ 0x02329560
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end ov02_02329560

	arm_func_start ov02_02329578
ov02_02329578: @ 0x02329578
	ldrh r3, [r0, #0xa]
	mov r2, #0
	add ip, r1, r3
	str r2, [ip, #4]
	str r2, [r1, r3]
	str r1, [r0]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	bx lr
	arm_func_end ov02_02329578

	arm_func_start ov02_023295A4
ov02_023295A4: @ 0x023295A4
	push {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _023295BC
	bl ov02_02329578
	pop {r3, pc}
_023295BC:
	ldrh ip, [r0, #0xa]
	ldr r3, [r0, #4]
	mov r2, #0
	str r3, [r1, ip]
	add r3, r1, ip
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0, #4]
	add r2, r3, r2
	str r1, [r2, #4]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	pop {r3, pc}
	arm_func_end ov02_023295A4

	arm_func_start ov02_023295F8
ov02_023295F8: @ 0x023295F8
	push {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _02329610
	bl ov02_02329578
	pop {r3, pc}
_02329610:
	ldrh r3, [r0, #0xa]
	mov r2, #0
	str r2, [r1, r3]
	ldr r2, [r0]
	add r3, r1, r3
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0]
	str r1, [r3, r2]
	str r1, [r0]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	pop {r3, pc}
	arm_func_end ov02_023295F8

	arm_func_start ov02_02329648
ov02_02329648: @ 0x02329648
	push {r3, lr}
	cmp r1, #0
	bne _02329660
	mov r1, r2
	bl ov02_023295A4
	pop {r3, pc}
_02329660:
	ldr r3, [r0]
	cmp r1, r3
	bne _02329678
	mov r1, r2
	bl ov02_023295F8
	pop {r3, pc}
_02329678:
	ldrh lr, [r0, #0xa]
	ldr r3, [r1, lr]
	add ip, r2, lr
	str r3, [r2, lr]
	str r1, [ip, #4]
	add r3, r3, lr
	str r2, [r3, #4]
	ldrh r3, [r0, #0xa]
	str r2, [r1, r3]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	pop {r3, pc}
	arm_func_end ov02_02329648

	arm_func_start ov02_023296AC
ov02_023296AC: @ 0x023296AC
	push {r3, lr}
	ldrh ip, [r0, #0xa]
	ldr r3, [r1, ip]
	add lr, r1, ip
	cmp r3, #0
	ldreq r1, [lr, #4]
	streq r1, [r0]
	ldrne r2, [lr, #4]
	addne r1, r3, ip
	strne r2, [r1, #4]
	ldr r3, [lr, #4]
	cmp r3, #0
	ldreq r1, [lr]
	streq r1, [r0, #4]
	ldrhne r1, [r0, #0xa]
	ldrne r2, [lr]
	strne r2, [r3, r1]
	mov r1, #0
	str r1, [lr]
	str r1, [lr, #4]
	ldrh r1, [r0, #8]
	sub r1, r1, #1
	strh r1, [r0, #8]
	pop {r3, pc}
	arm_func_end ov02_023296AC

	arm_func_start ov02_0232970C
ov02_0232970C: @ 0x0232970C
	cmp r1, #0
	ldreq r0, [r0]
	ldrhne r0, [r0, #0xa]
	addne r0, r1, r0
	ldrne r0, [r0, #4]
	bx lr
	arm_func_end ov02_0232970C

	arm_func_start ov02_02329724
ov02_02329724: @ 0x02329724
	cmp r1, #0
	ldreq r0, [r0, #4]
	ldrhne r0, [r0, #0xa]
	ldrne r0, [r1, r0]
	bx lr
	arm_func_end ov02_02329724

	arm_func_start ov02_02329738
ov02_02329738: @ 0x02329738
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0
	mov r6, r0
	bl ov02_0232970C
	movs r4, r0
	beq _02329798
_02329754:
	ldr r0, [r4, #0x18]
	cmp r0, r5
	bhi _02329784
	ldr r0, [r4, #0x1c]
	cmp r5, r0
	bhs _02329784
	mov r1, r5
	add r0, r4, #0xc
	bl ov02_02329738
	cmp r0, #0
	moveq r0, r4
	pop {r4, r5, r6, pc}
_02329784:
	mov r0, r6
	mov r1, r4
	bl ov02_0232970C
	movs r4, r0
	bne _02329754
_02329798:
	mov r0, #0
	pop {r4, r5, r6, pc}
	arm_func_end ov02_02329738

	arm_func_start ov02_023297A0
ov02_023297A0: @ 0x023297A0
	push {r4, lr}
	ldr r4, _023297C4 @ =0x023544C4
	mov r1, r0
	mov r0, r4
	bl ov02_02329738
	cmp r0, #0
	addne r4, r0, #0xc
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_023297C4: .4byte 0x023544C4
	arm_func_end ov02_023297A0

	arm_func_start ov02_023297C8
ov02_023297C8: @ 0x023297C8
	push {r4, lr}
	mov r4, r0
	ldrh r0, [sp, #8]
	str r1, [r4]
	mov ip, #0
	str r2, [r4, #0x18]
	bic r1, ip, #0xff
	and r0, r0, #0xff
	orr r2, r1, r0
	str r3, [r4, #0x1c]
	add r0, r4, #0xc
	mov r1, #4
	str r2, [r4, #0x20]
	bl ov02_02329560
	ldr r0, _0232983C @ =0x023544C0
	ldr r0, [r0]
	cmp r0, #0
	bne _02329828
	ldr r0, _02329840 @ =0x023544C4
	mov r1, #4
	bl ov02_02329560
	ldr r0, _0232983C @ =0x023544C0
	mov r1, #1
	str r1, [r0]
_02329828:
	mov r0, r4
	bl ov02_023297A0
	mov r1, r4
	bl ov02_023295A4
	pop {r4, pc}
	.align 2, 0
_0232983C: .4byte 0x023544C0
_02329840: .4byte 0x023544C4
	arm_func_end ov02_023297C8

	arm_func_start ov02_02329844
ov02_02329844: @ 0x02329844
	push {r4, lr}
	mov r4, r0
	bl ov02_023297A0
	mov r1, r4
	bl ov02_023296AC
	pop {r4, pc}
	arm_func_end ov02_02329844

	arm_func_start ov02_0232985C
ov02_0232985C: @ 0x0232985C
	ldrh r2, [r1, #2]
	add r3, r1, #0x10
	asr r2, r2, #8
	and r2, r2, #0x7f
	lsl r2, r2, #0x10
	sub r2, r1, r2, lsr #16
	str r2, [r0]
	ldr r1, [r1, #4]
	add r1, r1, r3
	str r1, [r0, #4]
	bx lr
	arm_func_end ov02_0232985C

	arm_func_start ov02_02329888
ov02_02329888: @ 0x02329888
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0]
	cmp r1, #0
	strne r2, [r1, #8]
	streq r2, [r0, #4]
	mov r0, r2
	bx lr
	arm_func_end ov02_02329888

	arm_func_start ov02_023298B0
ov02_023298B0: @ 0x023298B0
	str r2, [r1, #8]
	cmp r2, #0
	ldrne r3, [r2, #0xc]
	strne r1, [r2, #0xc]
	ldreq r3, [r0]
	streq r1, [r0]
	str r3, [r1, #0xc]
	cmp r3, #0
	strne r1, [r3, #8]
	streq r1, [r0, #4]
	mov r0, r1
	bx lr
	arm_func_end ov02_023298B0

	arm_func_start ov02_023298E0
ov02_023298E0: @ 0x023298E0
	ldr r3, [r0]
	mov r2, #0
	strh r1, [r3]
	strh r2, [r3, #2]
	ldr r1, [r0, #4]
	add r0, r3, #0x10
	sub r0, r1, r0
	stmib r3, {r0, r2}
	mov r0, r3
	str r2, [r3, #0xc]
	bx lr
	arm_func_end ov02_023298E0

	arm_func_start ov02_0232990C
ov02_0232990C: @ 0x0232990C
	push {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _02329978 @ =0x45585048
	add r2, r4, #0x38
	bl ov02_023297C8
	mov r0, #0
	strh r0, [r4, #0x34]
	bic r0, r0, #1
	strh r0, [r4, #0x36]
	ldr r1, [r4, #0x18]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _0232997C @ =0x00004652
	str r2, [sp, #8]
	bl ov02_023298E0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [r4, #0x2c]
	mov r0, r4
	str r1, [r4, #0x30]
	add sp, sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02329978: .4byte 0x45585048
_0232997C: .4byte 0x00004652
	arm_func_end ov02_0232990C

	arm_func_start ov02_02329980
ov02_02329980: @ 0x02329980
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r7, r0
	add r0, sp, #0x10
	mov r8, r1
	mov r6, r2
	mov r4, r3
	bl ov02_0232985C
	ldr r3, [sp, #0x14]
	sub r5, r6, #0x10
	add r2, r4, r6
	mov r0, r7
	mov r1, r8
	str r5, [sp, #0x14]
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	bl ov02_02329888
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r4, r0
	sub r0, r1, r2
	cmp r0, #0x14
	strlo r2, [sp, #0x14]
	blo _02329A00
	ldr r1, _02329AF8 @ =0x00004652
	add r0, sp, #0x10
	bl ov02_023298E0
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl ov02_023298B0
	mov r4, r0
_02329A00:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	cmp r0, #0x14
	strlo r1, [sp, #8]
	blo _02329A34
	ldr r1, _02329AF8 @ =0x00004652
	add r0, sp, #8
	bl ov02_023298E0
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl ov02_023298B0
_02329A34:
	ldr r0, [r7, #-4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #8]
	and r0, r0, #0xff
	tst r0, #1
	sub r2, r2, r1
	beq _02329A58
	mov r0, #0
	bl FUN_0207C314
_02329A58:
	ldr r2, [sp, #8]
	ldr r1, _02329AFC @ =0x00005544
	add r0, sp, #0
	str r5, [sp]
	str r2, [sp, #4]
	bl ov02_023298E0
	mov r1, r0
	ldrh r3, [r1, #2]
	ldrh r2, [sp, #0x30]
	add r0, r7, #8
	bic r3, r3, #0x8000
	strh r3, [r1, #2]
	ldrh r3, [r1, #2]
	lsl r2, r2, #0x1f
	orr r2, r3, r2, lsr #16
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldr r3, [sp, #0x14]
	bic r2, r2, #0x7f00
	strh r2, [r1, #2]
	sub r2, r1, r3
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	ldrh r3, [r1, #2]
	lsl r2, r2, #0x19
	orr r2, r3, r2, lsr #17
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r3, [r7, #0x10]
	bic r2, r2, #0xff
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	and r3, r3, #0xff
	orr r2, r2, r3
	strh r2, [r1, #2]
	ldr r2, [r7, #0xc]
	bl ov02_023298B0
	mov r0, r6
	add sp, sp, #0x18
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02329AF8: .4byte 0x00004652
_02329AFC: .4byte 0x00005544
	arm_func_end ov02_02329980

	arm_func_start ov02_02329B00
ov02_02329B00: @ 0x02329B00
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x24]
	and r1, r4, #1
	lsl r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r1, #0
	moveq r6, #1
	movne r6, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _02329B90
	sub r2, r2, #1
	mvn r5, r2
_02329B40:
	add r8, ip, #0x10
	add r7, r2, r8
	and sb, r5, r7
	sub r7, sb, r8
	ldr r8, [ip, #4]
	add r7, r3, r7
	cmp r8, r7
	blo _02329B84
	cmp lr, r8
	bls _02329B84
	mov r1, ip
	mov lr, r8
	mov r4, sb
	cmp r6, #0
	bne _02329B90
	cmp r8, r3
	beq _02329B90
_02329B84:
	ldr ip, [ip, #0xc]
	cmp ip, #0
	bne _02329B40
_02329B90:
	cmp r1, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl ov02_02329980
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov02_02329B00

	arm_func_start ov02_02329BB4
ov02_02329BB4: @ 0x02329BB4
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x28]
	and r1, r4, #1
	lsl r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r1, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _02329C40
	sub r2, r2, #1
	mvn r2, r2
_02329BF4:
	ldr r8, [ip, #4]
	add sb, ip, #0x10
	add r6, r8, sb
	sub r6, r6, r3
	and r7, r2, r6
	subs r6, r7, sb
	bmi _02329C34
	cmp lr, r8
	bls _02329C34
	mov r1, ip
	mov lr, r8
	mov r4, r7
	cmp r5, #0
	bne _02329C40
	cmp r8, r3
	beq _02329C40
_02329C34:
	ldr ip, [ip, #8]
	cmp ip, #0
	bne _02329BF4
_02329C40:
	cmp r1, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl ov02_02329980
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov02_02329BB4

	arm_func_start ov02_02329C64
ov02_02329C64: @ 0x02329C64
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	ldr r2, [r5]
	ldr r1, [r5, #4]
	mov r6, r0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6]
	mov r4, #0
	cmp r1, #0
	beq _02329CD8
	ldr r0, [r5]
_02329C98:
	cmp r1, r0
	movlo r4, r1
	blo _02329CCC
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _02329CD8
	ldr r2, [r1, #4]
	add r0, r1, #0x10
	add r2, r2, r0
	mov r0, r6
	str r2, [sp, #4]
	bl ov02_02329888
	b _02329CD8
_02329CCC:
	ldr r1, [r1, #0xc]
	cmp r1, #0
	bne _02329C98
_02329CD8:
	cmp r4, #0
	beq _02329D0C
	ldr r2, [r4, #4]
	add r1, r4, #0x10
	ldr r0, [r5]
	add r1, r2, r1
	cmp r1, r0
	bne _02329D0C
	mov r0, r6
	mov r1, r4
	str r4, [sp]
	bl ov02_02329888
	mov r4, r0
_02329D0C:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	cmp r0, #0x10
	addlo sp, sp, #8
	movlo r0, #0
	poplo {r4, r5, r6, pc}
	ldr r1, _02329D50 @ =0x00004652
	add r0, sp, #0
	bl ov02_023298E0
	mov r1, r0
	mov r0, r6
	mov r2, r4
	bl ov02_023298B0
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02329D50: .4byte 0x00004652
	arm_func_end ov02_02329C64

	arm_func_start ov02_02329D54
ov02_02329D54: @ 0x02329D54
	push {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _02329D7C
	sub r3, r1, r0
	cmp r3, #0x4c
	bhs _02329D84
_02329D7C:
	mov r0, #0
	pop {r3, pc}
_02329D84:
	bl ov02_0232990C
	pop {r3, pc}
	arm_func_end ov02_02329D54

	arm_func_start ov02_02329844
ov02_02329844: @ 0x02329D8C
	ldr ip, _02329D94 @ =ov02_02329844
	bx ip
	.align 2, 0
_02329D94: .4byte ov02_02329844
	arm_func_end ov02_02329844

	arm_func_start ov02_02329D98
ov02_02329D98: @ 0x02329D98
	push {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	blt _02329DBC
	bl ov02_02329B00
	pop {r3, pc}
_02329DBC:
	rsb r2, r2, #0
	bl ov02_02329BB4
	pop {r3, pc}
	arm_func_end ov02_02329D98

	arm_func_start ov02_02329DC8
ov02_02329DC8: @ 0x02329DC8
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	sub r4, r1, #0x10
	mov r5, r0
	add r0, sp, #0
	mov r1, r4
	bl ov02_0232985C
	mov r1, r4
	add r0, r5, #0x2c
	bl ov02_02329888
	add r1, sp, #0
	add r0, r5, #0x24
	bl ov02_02329C64
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02329DC8

	arm_func_start ov02_02329E04
ov02_02329E04: @ 0x02329E04
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _02329E48 @ =0x46524D48
	add r2, r4, #0x30
	bl ov02_023297C8
	ldr r0, [r4, #0x18]
	mov r1, #0
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x1c]
	mov r0, r4
	str r2, [r4, #0x28]
	str r1, [r4, #0x2c]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02329E48: .4byte 0x46524D48
	arm_func_end ov02_02329E04

	arm_func_start ov02_02329E4C
ov02_02329E4C: @ 0x02329E4C
	push {r4, r5, r6, lr}
	mov r4, r0
	ldr r3, [r4]
	sub r0, r2, #1
	mvn r2, r0
	add r0, r0, r3
	and r5, r2, r0
	ldr r0, [r4, #4]
	add r6, r1, r5
	cmp r6, r0
	movhi r0, #0
	pophi {r4, r5, r6, pc}
	ldr r0, [r4, #-4]
	sub r2, r6, r3
	and r0, r0, #0xff
	tst r0, #1
	beq _02329E9C
	mov r1, r3
	mov r0, #0
	bl FUN_0207C314
_02329E9C:
	mov r0, r5
	str r6, [r4]
	pop {r4, r5, r6, pc}
	arm_func_end ov02_02329E4C

	arm_func_start ov02_02329EA8
ov02_02329EA8: @ 0x02329EA8
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #4]
	sub r0, r2, #1
	mvn r2, r0
	sub r1, r3, r1
	ldr r0, [r4]
	and r5, r2, r1
	cmp r5, r0
	movlo r0, #0
	poplo {r3, r4, r5, pc}
	ldr r0, [r4, #-4]
	sub r2, r3, r5
	and r0, r0, #0xff
	tst r0, #1
	beq _02329EF4
	mov r1, r5
	mov r0, #0
	bl FUN_0207C314
_02329EF4:
	mov r0, r5
	str r5, [r4, #4]
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02329EA8

	arm_func_start ov02_02329F00
ov02_02329F00: @ 0x02329F00
	ldr r2, [r0, #0x18]
	mov r1, #0
	str r2, [r0, #0x24]
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end ov02_02329F00

	arm_func_start ov02_02329F14
ov02_02329F14: @ 0x02329F14
	ldr r2, [r0, #0x2c]
	cmp r2, #0
	beq _02329F34
_02329F20:
	ldr r1, [r0, #0x1c]
	str r1, [r2, #8]
	ldr r2, [r2, #0xc]
	cmp r2, #0
	bne _02329F20
_02329F34:
	ldr r1, [r0, #0x1c]
	str r1, [r0, #0x28]
	bx lr
	arm_func_end ov02_02329F14

	arm_func_start ov02_02329F40
ov02_02329F40: @ 0x02329F40
	push {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _02329F68
	sub r3, r1, r0
	cmp r3, #0x30
	bhs _02329F70
_02329F68:
	mov r0, #0
	pop {r3, pc}
_02329F70:
	bl ov02_02329E04
	pop {r3, pc}
	arm_func_end ov02_02329F40

	arm_func_start ov02_02329844
ov02_02329844: @ 0x02329F78
	ldr ip, _02329F80 @ =ov02_02329844
	bx ip
	.align 2, 0
_02329F80: .4byte ov02_02329844
	arm_func_end ov02_02329844

	arm_func_start ov02_02329F84
ov02_02329F84: @ 0x02329F84
	push {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	add r0, r0, #0x24
	blt _02329FAC
	bl ov02_02329E4C
	pop {r3, pc}
_02329FAC:
	rsb r2, r2, #0
	bl ov02_02329EA8
	pop {r3, pc}
	arm_func_end ov02_02329F84

	arm_func_start ov02_02329FB8
ov02_02329FB8: @ 0x02329FB8
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	tst r4, #1
	beq _02329FD0
	bl ov02_02329F00
_02329FD0:
	tst r4, #2
	popeq {r3, r4, r5, pc}
	mov r0, r5
	bl ov02_02329F14
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02329FB8

	arm_func_start ov02_02329FE4
ov02_02329FE4: @ 0x02329FE4
	ldrh r2, [r0, #0xc]
	ldrh ip, [r0, #0xe]
	mov r3, #0
	add r0, r0, r2
	cmp ip, #0
	bls _0232A024
_02329FFC:
	ldr r2, [r0]
	cmp r2, r1
	bxeq lr
	add r2, r3, #1
	lsl r2, r2, #0x10
	ldr r3, [r0, #4]
	cmp ip, r2, lsr #16
	add r0, r0, r3
	lsr r3, r2, #0x10
	bhi _02329FFC
_0232A024:
	mov r0, #0
	bx lr
	arm_func_end ov02_02329FE4

	arm_func_start ov02_0232A02C
ov02_0232A02C: @ 0x0232A02C
	push {r3, lr}
	ldrh r3, [r0, #4]
	ldr r2, _0232A0F0 @ =0x0000FFFF
	cmp r3, #0
	beq _0232A054
	cmp r3, #1
	beq _0232A070
	cmp r3, #2
	beq _0232A084
	b _0232A0E8
_0232A054:
	ldrh r2, [r0]
	ldrh r3, [r0, #0xc]
	sub r0, r1, r2
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	b _0232A0E8
_0232A070:
	ldrh r2, [r0]
	sub r1, r1, r2
	add r0, r0, r1, lsl #1
	ldrh r2, [r0, #0xc]
	b _0232A0E8
_0232A084:
	ldrh r3, [r0, #0xc]
	add ip, r0, #0xe
	sub r0, r3, #1
	add lr, ip, r0, lsl #2
	cmp ip, lr
	bhi _0232A0E8
_0232A09C:
	sub r3, lr, ip
	asr r0, r3, #1
	add r0, r3, r0, lsr #30
	asr r0, r0, #2
	add r0, r0, r0, lsr #31
	asr r3, r0, #1
	lsl r0, r3, #2
	ldrh r0, [ip, r0]
	add r3, ip, r3, lsl #2
	cmp r0, r1
	addlo ip, r3, #4
	blo _0232A0E0
	cmp r1, r0
	sublo lr, r3, #4
	blo _0232A0E0
	ldrh r2, [r3, #2]
	b _0232A0E8
_0232A0E0:
	cmp ip, lr
	bls _0232A09C
_0232A0E8:
	mov r0, r2
	pop {r3, pc}
	.align 2, 0
_0232A0F0: .4byte 0x0000FFFF
	arm_func_end ov02_0232A02C

	arm_func_start ov02_0232A0F4
ov02_0232A0F4: @ 0x0232A0F4
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r4
	bl ov02_0232BA74
	ldr r0, _0232A114 @ =0x0232BD04
	str r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
_0232A114: .4byte 0x0232BD04
	arm_func_end ov02_0232A0F4

	arm_func_start ov02_0232A118
ov02_0232A118: @ 0x0232A118
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0232A154
_0232A12C:
	ldrh r2, [r0]
	cmp r2, r1
	ldrhls r2, [r0, #2]
	cmpls r1, r2
	bhi _0232A148
	bl ov02_0232A02C
	pop {r3, pc}
_0232A148:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0232A12C
_0232A154:
	ldr r0, _0232A15C @ =0x0000FFFF
	pop {r3, pc}
	.align 2, 0
_0232A15C: .4byte 0x0000FFFF
	arm_func_end ov02_0232A118

	arm_func_start ov02_0232A160
ov02_0232A160: @ 0x0232A160
	ldr ip, [r0]
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _0232A1A4
_0232A170:
	ldrh r2, [r3]
	cmp r2, r1
	ldrhls r0, [r3, #2]
	cmpls r1, r0
	bhi _0232A198
	sub r0, r1, r2
	add r1, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	bx lr
_0232A198:
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _0232A170
_0232A1A4:
	add r0, ip, #4
	bx lr
	arm_func_end ov02_0232A160

	arm_func_start ov02_0232A1AC
ov02_0232A1AC: @ 0x0232A1AC
	push {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	str r2, [sp]
	ldr r5, [r8, #4]
	add r0, sp, #0
	mov r7, r1
	mov r6, r3
	mov r4, #0
	blx r5
	movs r1, r0
	beq _0232A228
	ldr sb, _0232A254 @ =0x0000FFFF
	add sl, sp, #0
_0232A1E4:
	cmp r1, #0xa
	beq _0232A228
	mov r0, r8
	bl ov02_0232A118
	mov r1, r0
	cmp r1, sb
	ldreq r0, [r8]
	ldrheq r1, [r0, #2]
	mov r0, r8
	bl ov02_0232A160
	ldrsb r1, [r0, #2]
	mov r0, sl
	add r1, r7, r1
	add r4, r4, r1
	blx r5
	movs r1, r0
	bne _0232A1E4
_0232A228:
	cmp r6, #0
	beq _0232A240
	cmp r1, #0xa
	ldreq r0, [sp]
	movne r0, #0
	str r0, [r6]
_0232A240:
	cmp r4, #0
	subgt r4, r4, r7
	mov r0, r4
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0232A254: .4byte 0x0000FFFF
	arm_func_end ov02_0232A1AC

	arm_func_start ov02_0232A258
ov02_0232A258: @ 0x0232A258
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	add r4, sp, #0
	mov r3, #0
	mov r8, r0
	str r2, [sp, #8]
	str r3, [r4]
	str r3, [r4, #4]
	ldr r7, [r8, #4]
	add r0, sp, #8
	mov r4, r1
	mov r6, #1
	blx r7
	cmp r0, #0
	beq _0232A2B0
	add r5, sp, #8
_0232A298:
	cmp r0, #0xa
	mov r0, r5
	addeq r6, r6, #1
	blx r7
	cmp r0, #0
	bne _0232A298
_0232A2B0:
	ldr r0, [r8]
	ldrsb r0, [r0, #1]
	add r0, r4, r0
	mul r0, r6, r0
	sub r0, r0, r4
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232A258

	arm_func_start ov02_0232A2CC
ov02_0232A2CC: @ 0x0232A2CC
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r6, r2
	ldr r2, [sp, #0x28]
	add sb, sp, #0
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r3
	str r4, [sb]
	str r4, [sb, #4]
	cmp r2, #0
	mov r4, #1
	beq _0232A334
	add sb, sp, #0x28
_0232A308:
	mov r0, r7
	mov r1, r6
	mov r3, sb
	bl ov02_0232A1AC
	ldr r1, [sp]
	ldr r2, [sp, #0x28]
	cmp r0, r1
	strgt r0, [sp]
	add r4, r4, #1
	cmp r2, #0
	bne _0232A308
_0232A334:
	ldr r0, [r7]
	sub r2, r4, #1
	ldrsb r1, [r0, #1]
	ldr r0, [sp]
	add r1, r5, r1
	mul r1, r2, r1
	sub r1, r1, r5
	str r1, [sp, #4]
	stm r8, {r0, r1}
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov02_0232A2CC

	arm_func_start ov02_0232A360
ov02_0232A360: @ 0x0232A360
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, #3
	ldr r7, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r8, _0232A454 @ =0x0234FBF8
	mov r5, #0
	mov sb, sl
	mvn r4, #0
_0232A380:
	and ip, r3, r4, lsl r6
	cmp ip, r1
	and lr, r2, r4, lsl r7
	bhi _0232A3C4
	mla r5, r2, ip, r5
	cmp lr, r0
	bhi _0232A3B4
	sub r3, r3, ip
	mla r5, lr, r3, r5
	sub r0, r0, lr
	sub r1, r1, ip
	sub r2, r2, lr
	b _0232A40C
_0232A3B4:
	mov r2, lr
	sub r1, r1, ip
	sub r3, r3, ip
	b _0232A40C
_0232A3C4:
	cmp lr, r0
	mvn r3, r4, lsl r6
	bhi _0232A3E4
	mla r5, lr, ip, r5
	mov r3, ip
	sub r0, r0, lr
	sub r2, r2, lr
	b _0232A40C
_0232A3E4:
	and r2, r1, r4, lsl r6
	mla r5, lr, r2, r5
	and r2, r0, r4, lsl r7
	mvn r4, r4, lsl r7
	add r2, r5, r2, lsl r6
	and r1, r1, r3
	add r1, r2, r1, lsl r7
	and r0, r0, r4
	add r0, r1, r0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_0232A40C:
	cmp r2, #8
	movge r6, sl
	movlt r6, r2
	clzlt r6, r6
	rsblt r6, r6, #0x1f
	cmp r3, #8
	movge r7, sb
	movlt r7, r3
	clzlt r7, r7
	rsblt r7, r7, #0x1f
	add r7, r8, r7, lsl #3
	add ip, r7, r6, lsl #1
	ldrb r7, [r7, r6, lsl #1]
	ldrb r6, [ip, #1]
	str r7, [sp, #0x20]
	str r6, [sp, #0x24]
	b _0232A380
_0232A450:
	.byte 0xF0, 0x87, 0xBD, 0xE8
_0232A454: .4byte 0x0234FBF8
	arm_func_end ov02_0232A360

	arm_func_start ov02_0232A458
ov02_0232A458: @ 0x0232A458
	ldrb r3, [r0, #1]
	ldr r2, _0232A470 @ =0x0234FC18
	ldrb r1, [r0]
	add r0, r2, r3, lsl #4
	ldr r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_0232A470: .4byte 0x0234FC18
	arm_func_end ov02_0232A458

	arm_func_start ov02_0232A474
ov02_0232A474: @ 0x0232A474
	push {r3, r4, r5, lr}
	cmp r3, #8
	ldreq r4, [sp, #0x10]
	mov ip, r0
	ldr r0, [sp, #0x14]
	cmpeq r4, #8
	bne _0232A4A4
	ldr r2, [sp, #0x18]
	mov r1, ip
	lsl r2, r2, #3
	bl FUN_0207C358
	pop {r3, r4, r5, pc}
_0232A4A4:
	ldr r4, [sp, #0x18]
	cmp r4, #4
	bne _0232A504
	lsl r5, r1, #2
	add r4, r5, r3, lsl #2
	mvn r3, #0
	rsb r4, r4, #0x20
	lsr r3, r3, r5
	add r1, r4, r1, lsl #2
	lsl r3, r3, r1
	ldr r1, [sp, #0x10]
	add r2, ip, r2, lsl #2
	add r5, r2, r1, lsl #2
	and r1, r0, r3, lsr r4
	mvn r3, r3, lsr r4
	cmp r2, r5
	pophs {r3, r4, r5, pc}
_0232A4E8:
	ldr r0, [r2]
	and r0, r0, r3
	orr r0, r1, r0
	str r0, [r2], #4
	cmp r2, r5
	blo _0232A4E8
	pop {r3, r4, r5, pc}
_0232A504:
	lsl r1, r1, #3
	mvn r4, #0
	add r3, r1, r3, lsl #3
	rsb r3, r3, #0x40
	lsr r5, r4, r1
	cmp r3, #0x20
	lsllo r5, r5, r1
	blo _0232A534
	sub lr, r3, #0x20
	add r4, r1, lr
	lsl r4, r5, r4
	lsr r5, r4, lr
_0232A534:
	mvn lr, #0
	lsl r4, lr, r3
	cmp r1, #0x20
	lsrlo r3, r4, r3
	blo _0232A558
	sub lr, r1, #0x20
	add r1, lr, r3
	lsr r1, r4, r1
	lsl r3, r1, lr
_0232A558:
	ldr r1, [sp, #0x10]
	add r4, ip, r2, lsl #3
	add ip, r4, r1, lsl #3
	and r1, r0, r5
	and r2, r0, r3
	mvn r5, r5
	mvn r3, r3
	cmp r4, ip
	pophs {r3, r4, r5, pc}
_0232A57C:
	ldr r0, [r4]
	and r0, r0, r5
	orr r0, r1, r0
	str r0, [r4]
	ldr r0, [r4, #4]
	and r0, r0, r3
	orr r0, r2, r0
	str r0, [r4, #4]
	add r4, r4, #8
	cmp r4, ip
	blo _0232A57C
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232A474

	arm_func_start ov02_0232A5AC
ov02_0232A5AC: @ 0x0232A5AC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	ldr r5, [r0, #8]
	ldr r4, [r0, #0xc]
	cmp r5, #0
	strge r5, [sp]
	movlt r1, #0
	strlt r1, [sp]
	ldr r1, [r0, #0x10]
	cmp r4, #0
	add sl, r5, r1
	ldr r1, [r0, #0x14]
	movge r2, r4
	movlt r2, #0
	cmp sl, #8
	add r3, r4, r1
	movge sl, #8
	cmp r3, #8
	movge r3, #8
	cmp r4, #0
	movgt r4, #0
	cmp r5, #0
	ldr r7, [r0, #0x20]
	movgt r5, #0
	rsb r1, r4, #0
	mul r6, sl, r7
	ldr r8, [r0, #0x1c]
	rsb r4, r5, #0
	mul sb, r8, r4
	ldr r4, [r0, #0x18]
	mov sl, r6
	str r4, [sp, #0x10]
	ldr r4, [sp]
	cmp r7, #4
	mul r5, r4, r7
	ldr r4, [sp, #0x10]
	str r5, [sp]
	mla r4, r1, r4, sb
	ldr r1, [r0, #4]
	str r1, [sp, #0x14]
	ldr r1, [r0]
	bne _0232A71C
	ldr r7, [r0, #0x24]
	add r0, r1, r2, lsl #2
	str r0, [sp, #0xc]
	add r0, r1, r3, lsl #2
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r0
	addhs sp, sp, #0x28
	pophs {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0xf
	add r5, sp, #0x20
_0232A680:
	ldr r0, [sp, #0xc]
	lsr r1, r4, #0x1f
	ldr sb, [r0]
	ldr r0, [sp, #0x14]
	rsb r2, r1, r4, lsl #29
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x20]
	mov r0, #0
	strb r0, [sp, #0x24]
	strb r0, [sp, #0x25]
	mov r0, r5
	add r1, r1, r2, ror #29
	bl ov02_0232BCA4
	ldr r6, [sp]
	mov r0, r6
	cmp r0, sl
	bhs _0232A6F4
_0232A6C4:
	mov r0, r5
	mov r1, r8
	bl ov02_0232BCA4
	cmp r0, #0
	beq _0232A6E8
	add r0, r7, r0
	mvn r1, fp, lsl r6
	and r1, sb, r1
	orr sb, r1, r0, lsl r6
_0232A6E8:
	add r6, r6, #4
	cmp r6, sl
	blo _0232A6C4
_0232A6F4:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	str sb, [r1], #4
	cmp r1, r0
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	add r4, r4, r0
	blo _0232A680
	add sp, sp, #0x28
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232A71C:
	ldr r5, [r0, #0x24]
	add r0, r1, r3, lsl #3
	add fp, r1, r2, lsl #3
	str r0, [sp, #4]
	cmp fp, r0
	addhs sp, sp, #0x28
	pophs {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232A738:
	lsr r1, r4, #0x1f
	rsb r0, r1, r4, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, [sp, #0x14]
	ldm fp, {r6, r7}
	mov r2, #0
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x18]
	add r0, sp, #0x18
	strb r2, [sp, #0x1c]
	strb r2, [sp, #0x1d]
	bl ov02_0232BCA4
	ldr sb, [sp]
	mov r0, sb
	cmp r0, sl
	bhs _0232A7C8
_0232A778:
	add r0, sp, #0x18
	mov r1, r8
	bl ov02_0232BCA4
	cmp r0, #0
	beq _0232A7BC
	add r1, r5, r0
	cmp sb, #0x20
	mov r0, #0xff
	bhs _0232A7AC
	mvn r0, r0, lsl sb
	and r0, r6, r0
	orr r6, r0, r1, lsl sb
	b _0232A7BC
_0232A7AC:
	sub r2, sb, #0x20
	mvn r0, r0, lsl r2
	and r0, r7, r0
	orr r7, r0, r1, lsl r2
_0232A7BC:
	add sb, sb, #8
	cmp sb, sl
	blo _0232A778
_0232A7C8:
	ldr r0, [sp, #4]
	stm fp, {r6, r7}
	add fp, fp, #8
	cmp fp, r0
	ldr r0, [sp, #0x10]
	add r4, r4, r0
	blo _0232A738
	add sp, sp, #0x28
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232A5AC

	arm_func_start ov02_0232A7EC
ov02_0232A7EC: @ 0x0232A7EC
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r4, [sp, #0x54]
	ldrb r6, [r0, #0xc]
	str r4, [sp, #0x54]
	ldr r4, [r4]
	ldr r5, [r1]
	lsl r7, r6, #6
	ldrb r4, [r4, #1]
	asr r6, r7, #2
	add r6, r7, r6, lsr #29
	cmp r4, #0
	ldr r5, [r5, #8]
	mov sl, r2
	mov sb, r3
	asr r8, r6, #3
	addeq sp, sp, #0x2c
	ldmib r0, {fp, ip}
	ldr lr, [r0]
	ldrb r2, [r5, #1]
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r7, sl, r4
	addmi sp, sp, #0x2c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r3, sb, r2
	addmi sp, sp, #0x2c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movle r5, #0
	lsrgt r5, sl, #3
	cmp sb, #0
	movle r6, #0
	add r7, r7, #7
	lsrgt r6, sb, #3
	cmp fp, r7, lsr #3
	lsr r7, r7, #3
	add r3, r3, #7
	movls r7, fp
	lsr fp, r3, #3
	cmp ip, r3, lsr #3
	movls fp, ip
	subs r3, r7, r5
	sub fp, fp, r6
	addmi sp, sp, #0x2c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp fp, #0
	addlt sp, sp, #0x2c
	poplt {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [r0, #0x10]
	cmp sl, #0
	mla r6, r7, r6, r5
	sub r5, r7, r3
	mul r5, r8, r5
	str r5, [sp]
	ldr r5, [sp, #0x54]
	mla r7, r8, r6, lr
	ldr ip, [r5, #4]
	ldr r6, [sp, #0x50]
	str ip, [sp, #8]
	sub r5, r6, #1
	str r4, [sp, #0x14]
	str r5, [sp, #0x28]
	str r2, [sp, #0x18]
	ldr r2, [r1]
	andge sl, sl, #7
	ldr r2, [r2, #8]
	cmp sb, #0
	ldrb r2, [r2, #6]
	andge sb, sb, #7
	sub fp, sb, fp, lsl #3
	str r2, [sp, #0x20]
	ldrb r0, [r0, #0xc]
	cmp sb, fp
	sub r6, sl, r3, lsl #3
	str r0, [sp, #0x24]
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0]
	smulbb r0, r2, r0
	str r0, [sp, #0x1c]
	addle sp, sp, #0x2c
	pople {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, sp, #4
_0232A938:
	mov r5, sl
	str sb, [sp, #0x10]
	cmp sl, r6
	ble _0232A968
_0232A948:
	mov r0, r4
	str r7, [sp, #4]
	str r5, [sp, #0xc]
	bl ov02_0232A5AC
	sub r5, r5, #8
	cmp r5, r6
	add r7, r7, r8
	bgt _0232A948
_0232A968:
	ldr r0, [sp]
	sub sb, sb, #8
	cmp sb, fp
	add r7, r7, r0
	bgt _0232A938
	add sp, sp, #0x2c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232A7EC

	arm_func_start ov02_0232A984
ov02_0232A984: @ 0x0232A984
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r6, [sp, #0x74]
	ldrb r5, [r0, #0xc]
	ldr r4, [r6]
	ldr r7, [r1]
	lsl r8, r5, #6
	ldrb r4, [r4, #1]
	asr r5, r8, #2
	add r5, r8, r5, lsr #29
	ldr r7, [r7, #8]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, #0
	asr sb, r5, #3
	addeq sp, sp, #0x4c
	ldmib r0, {r3, r5}
	ldrb r2, [r7, #1]
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sp, #8]
	adds r7, r7, r4
	addmi sp, sp, #0x4c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, [sp, #0xc]
	adds r8, r8, r2
	addmi sp, sp, #0x4c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sl, [sp, #8]
	add r7, r7, #7
	cmp sl, #0
	movle sl, #0
	strle sl, [sp, #0x10]
	lsrgt sl, sl, #3
	strgt sl, [sp, #0x10]
	ldr sl, [sp, #0xc]
	cmp sl, #0
	movle sl, #0
	lsrgt sl, sl, #3
	cmp r3, r7, lsr #3
	lsr r7, r7, #3
	movls r7, r3
	add r3, r8, #7
	cmp r5, r3, lsr #3
	lsr r8, r3, #3
	ldr r3, [sp, #0x10]
	movls r8, r5
	subs r5, r7, r3
	sub r7, r8, sl
	addmi sp, sp, #0x4c
	popmi {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0
	addlt sp, sp, #0x4c
	poplt {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [sp, #8]
	ldr fp, [r0]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r8, [sp, #8]
	ldr r6, [r6, #4]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #0xc]
	ldr r3, [sp, #0x70]
	sub r5, r8, r5, lsl #3
	ldr r8, [sp, #0xc]
	sub r3, r3, #1
	str r3, [sp, #0x48]
	sub r7, r8, r7, lsl #3
	str r2, [sp, #0x38]
	str r6, [sp, #0x28]
	str r4, [sp, #0x34]
	ldr r4, [r1]
	mov r3, r8
	mov r2, r7
	cmp r3, r2
	ldr r2, [r4, #8]
	str r7, [sp, #0x1c]
	ldrb r3, [r2, #6]
	str r3, [sp, #0x40]
	ldrb r2, [r0, #0xc]
	str r2, [sp, #0x44]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	ldrb r1, [r1]
	smulbb r1, r3, r1
	str r1, [sp, #0x3c]
	ldr r3, [r0, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r0, #8]
	str r1, [sp, #0x14]
	lsl r2, r3, #0x18
	lsl r1, r3, #0x10
	str r3, [sp, #0x20]
	str r0, [sp, #0x18]
	lsr r8, r2, #0x18
	lsr r7, r1, #0x18
	addle sp, sp, #0x4c
	pople {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232AB14:
	ldr r0, [sp, #0xc]
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r5
	mov r4, r0
	ble _0232AB70
_0232AB30:
	ldr r2, [sp, #0x14]
	str r8, [sp]
	ldr r3, [sp, #0x18]
	mov r0, r6
	mov r1, sl
	str r7, [sp, #4]
	bl ov02_0232A360
	mla r1, r0, sb, fp
	add r0, sp, #0x24
	str r4, [sp, #0x2c]
	str r1, [sp, #0x24]
	bl ov02_0232A5AC
	sub r4, r4, #8
	add r6, r6, #1
	cmp r4, r5
	bgt _0232AB30
_0232AB70:
	ldr r0, [sp, #0xc]
	add sl, sl, #1
	sub r1, r0, #8
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0xc]
	cmp r1, r0
	bgt _0232AB14
	add sp, sp, #0x4c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232A984

	arm_func_start ov02_0232AB94
ov02_0232AB94: @ 0x0232AB94
	push {r3, lr}
	mov r3, r0
	ldrb r2, [r3, #0xc]
	ldr ip, [r3, #4]
	cmp r2, #4
	orreq r0, r1, r1, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r1, r1, lsl #8
	orr r1, r0, r0, lsl #16
	ldr r0, [r3, #8]
	lsl r2, r2, #6
	mul lr, ip, r0
	asr r0, r2, #2
	add r0, r2, r0, lsr #29
	asr r2, r0, #3
	mov r0, r1
	mul r2, lr, r2
	ldr r1, [r3]
	bl FUN_0207C358
	pop {r3, pc}
	arm_func_end ov02_0232AB94

	arm_func_start ov02_0232ABE4
ov02_0232ABE4: @ 0x0232ABE4
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldrb r2, [r7, #0xc]
	mov r6, r1
	ldr sb, [r7]
	cmp r2, #4
	orreq r0, r6, r6, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r6, r6, lsl #8
	lsl r1, r2, #6
	orr r6, r0, r0, lsl #16
	asr r0, r1, #2
	add r0, r1, r0, lsr #29
	asr r3, r0, #3
	ldr r2, [r7, #0x10]
	ldr r1, [r7, #4]
	ldr r0, [r7, #8]
	mul r5, r3, r2
	mul r4, r3, r1
	mov r8, #0
	cmp r0, #0
	pople {r3, r4, r5, r6, r7, r8, sb, pc}
_0232AC3C:
	mov r0, r6
	mov r1, sb
	mov r2, r4
	bl FUN_0207C358
	ldr r0, [r7, #8]
	add r8, r8, #1
	cmp r8, r0
	add sb, sb, r5
	blt _0232AC3C
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov02_0232ABE4

	arm_func_start ov02_0232AC64
ov02_0232AC64: @ 0x0232AC64
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x58]
	mov sb, r2
	ldrb fp, [r0, #0xc]
	mov sl, r1
	add r1, sb, r4
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x5c]
	mov r1, r3
	add r1, r1, r2
	cmp fp, #4
	str r1, [sp, #0x24]
	orreq r1, sl, sl, lsl #4
	orreq r1, r1, r1, lsl #8
	orrne r1, sl, sl, lsl #8
	str r3, [sp, #0xc]
	orr sl, r1, r1, lsl #16
	ldr r1, [sp, #0xc]
	lsl r6, fp, #6
	bic r1, r1, #7
	asr r4, r6, #2
	asr r2, r1, #2
	str r1, [sp, #0x2c]
	add r1, r1, r2, lsr #29
	ldr r2, [r0, #0x10]
	asr r3, r1, #3
	mul r1, r3, r2
	bic r3, sb, #7
	asr r5, r3, #2
	add r4, r6, r4, lsr #29
	str r3, [sp, #0x18]
	add r5, r3, r5, lsr #29
	asr r3, r4, #3
	str r3, [sp, #0x14]
	add r4, r1, r5, asr #3
	ldr r3, [sp, #0x24]
	ldr r5, [r0]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mla r4, r1, r4, r5
	add r3, r3, #7
	bic r1, r3, #7
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x14]
	add r0, r0, #7
	mul r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	str r4, [sp, #0x1c]
	cmp r2, r1
	bic r6, r0, #7
	addge sp, sp, #0x30
	popge {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232AD40:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge r8, #0
	bge _0232AD60
	mov r1, r0
	ldr r0, [sp, #0x2c]
	sub r8, r1, r0
_0232AD60:
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	ldr r7, [sp, #0x1c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, r8
	ldr r0, [sp, #0x18]
	cmp r0, r6
	mov r4, r0
	bge _0232ADD0
_0232AD8C:
	ldr r0, [sp, #0x28]
	cmp r4, sb
	sublt r1, sb, r4
	sub r0, r0, r4
	movge r1, #0
	cmp r0, #8
	movgt r0, #8
	sub r3, r0, r1
	mov r0, r7
	mov r2, r8
	stm sp, {r5, sl, fp}
	bl ov02_0232A474
	ldr r0, [sp, #0x14]
	add r4, r4, #8
	add r7, r7, r0
	cmp r4, r6
	blt _0232AD8C
_0232ADD0:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	add r1, r0, #8
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x2c]
	cmp r1, r0
	blt _0232AD40
	add sp, sp, #0x30
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232AC64

	arm_func_start ov02_0232AE00
ov02_0232AE00: @ 0x0232AE00
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	ldrb r4, [r0, #0xc]
	mov sl, r2
	mov fp, r1
	str r4, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r4, [sp, #0x70]
	cmp r1, #4
	add r1, sl, r4
	str r1, [sp, #0x3c]
	ldr r2, [sp, #0x74]
	mov r1, r3
	add r1, r1, r2
	bic r2, sl, #7
	str r1, [sp, #0x38]
	str r3, [sp, #0xc]
	str r2, [sp, #0x28]
	ldr r2, [sp, #0xc]
	orreq r1, fp, fp, lsl #4
	bic r2, r2, #7
	str r2, [sp, #0x40]
	ldr r2, [sp, #0x10]
	orreq r1, r1, r1, lsl #8
	lsl r5, r2, #6
	ldr r2, [sp, #0x38]
	asr r3, r5, #2
	add r6, r2, #7
	ldr r2, [sp, #0x28]
	add r3, r5, r3, lsr #29
	asr r4, r2, #2
	ldr r2, [sp, #0x40]
	orrne r1, fp, fp, lsl #8
	asr r5, r2, #2
	bic r2, r6, #7
	str r2, [sp, #0x34]
	asr r2, r3, #3
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x28]
	orr fp, r1, r1, lsl #16
	add r2, r2, r4, lsr #29
	asr r2, r2, #3
	str r2, [sp, #0x2c]
	ldr r2, [sp, #0x40]
	ldr r1, [r0, #0x10]
	add r2, r2, r5, lsr #29
	asr r8, r2, #3
	ldr r3, [sp, #0x40]
	ldr r2, [sp, #0x34]
	str r1, [sp, #0x44]
	cmp r3, r2
	ldr r2, [sp, #0x3c]
	add r2, r2, #7
	bic r7, r2, #7
	ldr r2, [r0, #4]
	str r2, [sp, #0x18]
	ldr r2, [r0, #8]
	ldr r0, [r0]
	str r2, [sp, #0x1c]
	str r0, [sp, #0x30]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	addge sp, sp, #0x48
	popge {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232AF10:
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge sb, #0
	bge _0232AF30
	mov r1, r0
	ldr r0, [sp, #0x40]
	sub sb, r1, r0
_0232AF30:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x40]
	ldr r6, [sp, #0x2c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, sb
	ldr r0, [sp, #0x28]
	cmp r0, r7
	mov r4, r0
	bge _0232AFD0
_0232AF5C:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, r6
	mov r1, r8
	bl ov02_0232A360
	ldr r2, [sp, #0x3c]
	cmp r4, sl
	sublt r1, sl, r4
	sub r2, r2, r4
	movge r1, #0
	cmp r2, #8
	movgt r2, #8
	stm sp, {r5, fp}
	sub r3, r2, r1
	ldr r2, [sp, #0x10]
	ldr ip, [sp, #0x14]
	str r2, [sp, #8]
	ldr r2, [sp, #0x30]
	mla r0, ip, r0, r2
	mov r2, sb
	bl ov02_0232A474
	add r4, r4, #8
	add r6, r6, #1
	cmp r4, r7
	blt _0232AF5C
_0232AFD0:
	ldr r0, [sp, #0x40]
	add r8, r8, #1
	add r1, r0, #8
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x40]
	cmp r1, r0
	blt _0232AF10
	add sp, sp, #0x48
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232AE00

	arm_func_start ov02_0232AFF4
ov02_0232AFF4: @ 0x0232AFF4
	str r2, [r0, #4]
	ldr r2, [sp]
	str r3, [r0, #8]
	strb r2, [r0, #0xc]
	ldr r2, [sp, #4]
	str r1, [r0]
	ldr r1, [sp, #8]
	str r2, [r0, #0x14]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov02_0232AFF4

	arm_func_start ov02_0232B01C
ov02_0232B01C: @ 0x0232B01C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, r1
	ldrh r1, [sp, #0x2c]
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl ov02_0232A118
	ldr r1, _0232B13C @ =0x0000FFFF
	mov r4, r0
	cmp r4, r1
	ldreq r0, [r7]
	ldrheq r4, [r0, #2]
	mov r0, r7
	mov r1, r4
	bl ov02_0232A160
	str r0, [sp, #8]
	ldr r1, [r7]
	ldr r2, [r1, #8]
	ldrh r1, [r2, #2]
	add r2, r2, #8
	mla r1, r4, r1, r2
	str r1, [sp, #0xc]
	ldr r1, [r7]
	ldr r3, [r1, #8]
	ldrb r1, [r3, #7]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _0232B100
_0232B094: @ jump table
	b _0232B0B4 @ case 0
	b _0232B0C0 @ case 1
	b _0232B0C0 @ case 2
	b _0232B0D4 @ case 3
	b _0232B0D4 @ case 4
	b _0232B0F0 @ case 5
	b _0232B0F0 @ case 6
	b _0232B0B4 @ case 7
_0232B0B4:
	ldrsb r0, [r0]
	add r6, r6, r0
	b _0232B100
_0232B0C0:
	ldrb r1, [r3]
	ldrsb r0, [r0]
	sub r6, r6, r1
	add r5, r5, r0
	b _0232B100
_0232B0D4:
	ldrsb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r0, [r3, #1]
	add r1, r2, r1
	sub r6, r6, r1
	sub r5, r5, r0
	b _0232B100
_0232B0F0:
	ldrsb r1, [r0]
	ldrb r0, [r3, #1]
	add r0, r1, r0
	sub r5, r5, r0
_0232B100:
	ldr r1, [sp, #0x28]
	add r0, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r8, #0x14]
	mov r0, r8
	ldr r4, [r1]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	blx r4
	ldr r0, [sp, #8]
	ldrsb r0, [r0, #2]
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232B13C: .4byte 0x0000FFFF
	arm_func_end ov02_0232B01C

	arm_func_start ov02_0232B140
ov02_0232B140: @ 0x0232B140
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr lr, [sp, #0x10]
	ldr ip, _0232B168 @ =0x0234FBE0
	str lr, [sp]
	str ip, [sp, #4]
	str r2, [sp, #8]
	bl ov02_0232AFF4
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0232B168: .4byte 0x0234FBE0
	arm_func_end ov02_0232B140

	arm_func_start ov02_0232B16C
ov02_0232B16C: @ 0x0232B16C
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	cmp r2, #8
	movlt r4, r2
	movge ip, #3
	clzlt r4, r4
	rsblt ip, r4, #0x1f
	cmp r3, #8
	movlt r4, r3
	movge r5, #3
	clzlt r4, r4
	rsblt r5, r4, #0x1f
	ldr r4, _0232B1EC @ =0x0234FBF8
	ldr lr, [sp, #0xc]
	add r5, r4, r5, lsl #3
	add r4, r5, ip, lsl #1
	ldrb ip, [r5, ip, lsl #1]
	bic r5, lr, #0xff
	ldrb r4, [r4, #1]
	ldr lr, [sp, #0x20]
	orr r5, r5, ip
	str lr, [sp]
	ldr ip, _0232B1F0 @ =0x0234FBEC
	bic lr, r5, #0xff00
	lsl r4, r4, #0x18
	orr r4, lr, r4, lsr #16
	str ip, [sp, #4]
	str r4, [sp, #0xc]
	str r4, [sp, #8]
	bl ov02_0232AFF4
	add sp, sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232B1EC: .4byte 0x0234FBF8
_0232B1F0: .4byte 0x0234FBEC
	arm_func_end ov02_0232B16C

	arm_func_start ov02_0232B1F4
ov02_0232B1F4: @ 0x0232B1F4
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x24]
	ldr lr, [sp, #0x20]
	cmp r5, #0x20
	ldr ip, [sp, #0x28]
	bgt _0232B230
	mla r4, r5, lr, r3
	ldr lr, [sp, #0x2c]
	mov r3, r5
	add r0, r0, r4, lsl #1
	stm sp, {ip, lr}
	bl ov02_0232B2A4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_0232B230:
	add r6, lr, r2
	ldr r4, [sp, #0x2c]
	cmp lr, r6
	add r5, r3, r1
	addge sp, sp, #8
	lsl r1, r4, #0x1c
	popge {r4, r5, r6, r7, r8, pc}
_0232B24C:
	cmp lr, #0x20
	movlt r2, lr
	addge r2, lr, #0x20
	mov r7, r3
	cmp r3, r5
	add r8, r0, r2, lsl #6
	bge _0232B290
_0232B268:
	cmp r7, #0x20
	movlt r2, r7
	addge r2, r7, #0x3e0
	orr r4, ip, r1, lsr #16
	lsl r2, r2, #1
	add r7, r7, #1
	strh r4, [r8, r2]
	cmp r7, r5
	add ip, ip, #1
	blt _0232B268
_0232B290:
	add lr, lr, #1
	cmp lr, r6
	blt _0232B24C
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232B1F4

	arm_func_start ov02_0232B2A4
ov02_0232B2A4: @ 0x0232B2A4
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, [sp, #0x1c]
	ldr r8, [sp, #0x18]
	mov r6, #0
	cmp r2, #0
	lsl ip, r4, #0x1c
	pople {r4, r5, r6, r7, r8, pc}
	mov r4, r6
_0232B2C4:
	mov r7, r0
	mov r5, r4
	cmp r1, #0
	ble _0232B2EC
_0232B2D4:
	orr lr, r8, ip, lsr #16
	add r5, r5, #1
	cmp r5, r1
	add r8, r8, #1
	strh lr, [r7], #2
	blt _0232B2D4
_0232B2EC:
	add r6, r6, #1
	cmp r6, r2
	add r0, r0, r3, lsl #1
	blt _0232B2C4
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232B2A4

	arm_func_start ov02_0232B300
ov02_0232B300: @ 0x0232B300
	push {r3, r4, r5, lr}
	lsr r3, r0, #3
	lsr r5, r1, #3
	mov r2, #0
	mla lr, r3, r5, r2
	and r4, r0, #2
	and r2, r0, #1
	add r2, r2, r4, lsr #1
	and r0, r0, #4
	lsl ip, r2, #1
	add ip, ip, r0, lsr #2
	mla ip, r5, ip, lr
	and r4, r1, #2
	and lr, r1, #1
	add r4, lr, r4, lsr #1
	and lr, r1, #4
	lsl r1, r4, #1
	add r1, r1, lr, lsr #2
	mla ip, r3, r1, ip
	add r1, r2, r0, lsr #2
	add r0, r4, lr, lsr #2
	mla r0, r1, r0, ip
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232B300

	arm_func_start ov02_0232B35C
ov02_0232B35C: @ 0x0232B35C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r7, r0
	mov r0, r1
	cmp r0, #8
	ldr r0, [sp, #0x60]
	str r1, [sp, #0x10]
	str r0, [sp, #0x60]
	str r2, [sp, #0x14]
	ldrlt r0, [sp, #0x10]
	str r3, [sp, #0x34]
	ldr r6, [sp, #0x64]
	ldr r5, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	movge r2, #3
	clzlt r0, r0
	rsblt r2, r0, #0x1f
	ldr r0, [sp, #0x14]
	cmp r0, #8
	ldrlt r0, [sp, #0x14]
	movge r1, #3
	clzlt r0, r0
	rsblt r1, r0, #0x1f
	ldr r0, _0232B648 @ =0x0234FBF8
	mvn r3, #0
	add r1, r0, r1, lsl #3
	add r0, r1, r2, lsl #1
	ldrb fp, [r1, r2, lsl #1]
	ldrb r1, [r0, #1]
	ldr r2, [sp, #0x14]
	cmp r6, #0
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x10]
	and r1, r1, r3, lsl fp
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	and r1, r2, r3, lsl r1
	str r1, [sp, #0x28]
	moveq r1, #1
	streq r1, [sp, #0x18]
	movne r1, #2
	strne r1, [sp, #0x18]
	mov r1, #0
	str r1, [sp, #0x24]
	bl ov02_0232A458
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	asr sb, r1, fp
	ldr r1, [sp, #0x30]
	asr r1, r2, r1
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x18]
	lsl r2, r1, fp
	ldr r1, [sp, #0x30]
	lsl r8, r2, r1
	mov r1, #0
	str r1, [sp, #0x1c]
	b _0232B4DC
_0232B444:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x30]
	mov sl, #0
	lsl r2, r2, r1
	ldr r1, [sp, #0x60]
	add r1, r1, r2, lsl #3
	mov r2, #0x400
	and r3, r1, #0xff
	rsb r2, r2, #0
	b _0232B4C8
_0232B46C:
	lsl ip, sl, fp
	ldr r1, [sp, #0x34]
	add sl, sl, #1
	add r1, r1, ip, lsl #3
	lsl lr, r1, #0x17
	ldr ip, [r7]
	ldr r1, _0232B64C @ =0xFE00FF00
	and r1, ip, r1
	orr r1, r1, r3
	orr ip, r1, lr, lsr #7
	ldr r1, _0232B650 @ =0x3FFF3FFF
	and r1, ip, r1
	orr r1, r1, r0
	str r1, [r7]
	ldrh r1, [r7, #4]
	and r1, r1, r2
	orr r1, r1, r5
	strh r1, [r7, #4]
	ldr r1, [r7]
	add r5, r5, r8, asr r4
	bic r1, r1, #0x2000
	orr r1, r1, r6, lsl #13
	str r1, [r7], #8
_0232B4C8:
	cmp sl, sb
	blt _0232B46C
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	str r1, [sp, #0x1c]
_0232B4DC:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	cmp r2, r1
	blt _0232B444
	ldr r0, [sp, #0x24]
	mla r0, sb, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bhs _0232B564
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x10]
	stm sp, {r0, r6}
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x2c]
	sub r8, r1, r0
	ldr r1, [sp, #0x34]
	str r5, [sp, #8]
	add r3, r1, r2, lsl #3
	ldr r2, [sp, #0x28]
	mov r0, r7
	mov r1, r8
	str r4, [sp, #0xc]
	bl ov02_0232B35C
	ldr r1, [sp, #0x18]
	add r7, r7, r0, lsl #3
	mul r2, r1, r8
	ldr r1, [sp, #0x28]
	mul r2, r1, r2
	ldr r1, [sp, #0x24]
	add r5, r5, r2, lsr r4
	add r0, r1, r0
	str r0, [sp, #0x24]
_0232B564:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bhs _0232B5D0
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x34]
	add r0, r1, r0, lsl #3
	stm sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	str r4, [sp, #0xc]
	sub r8, r1, r0
	ldr r1, [sp, #0x2c]
	mov r0, r7
	mov r2, r8
	bl ov02_0232B35C
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	add r7, r7, r0, lsl #3
	mul r1, r2, r1
	mul r1, r8, r1
	add r5, r5, r1, lsr r4
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_0232B5D0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	ldrlo r1, [sp, #0x28]
	ldrlo r0, [sp, #0x14]
	cmplo r1, r0
	bhs _0232B63C
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	add r0, r1, r0, lsl #3
	stm sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x14]
	sub r1, r2, r1
	ldr r2, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	sub r2, r3, r2
	ldr r3, [sp, #0x34]
	mov r0, r7
	add r3, r3, r5, lsl #3
	str r4, [sp, #0xc]
	bl ov02_0232B35C
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_0232B63C:
	ldr r0, [sp, #0x24]
	add sp, sp, #0x38
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232B648: .4byte 0x0234FBF8
_0232B64C: .4byte 0xFE00FF00
_0232B650: .4byte 0x3FFF3FFF
	arm_func_end ov02_0232B35C

	arm_func_start ov02_0232B654
ov02_0232B654: @ 0x0232B654
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov fp, r0
	ldr r4, [fp, #8]
	ldr r5, [fp, #4]
	ldr r6, [sp, #0x38]
	add r0, sp, #0xc
	str r6, [sp, #0xc]
	ldr r6, [r5, #4]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	ldrsb r8, [sp, #0x41]
	blx r6
	cmp r0, #0
	beq _0232B6DC
	ldrsb r7, [sp, #0x40]
_0232B698:
	cmp r0, #0xa
	beq _0232B6DC
	ldr r1, [sp, #8]
	mov r2, sl
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [fp]
	mov r1, r5
	mov r3, sb
	bl ov02_0232B01C
	add r0, r4, r0
	mla sl, r0, r7, sl
	mla sb, r0, r8, sb
	add r0, sp, #0xc
	blx r6
	cmp r0, #0
	bne _0232B698
_0232B6DC:
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	addeq sp, sp, #0x10
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0xa
	ldreq r1, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	movne r1, #0
	str r1, [r0]
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232B654

	arm_func_start ov02_0232B708
ov02_0232B708: @ 0x0232B708
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sl, r0
	ldr r0, [sl, #4]
	ldr r4, [sp, #0x60]
	ldr r0, [r0]
	ldrsb r8, [sp, #0x65]
	ldrsb r0, [r0, #1]
	ldr r5, [sl, #0xc]
	ldrsb sb, [sp, #0x64]
	add r5, r5, r0
	rsb r0, r8, #0
	mul r0, r5, r0
	str r0, [sp, #0x20]
	mul r0, r5, sb
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x58]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	mov fp, r3
	str r4, [sp, #0x30]
	cmp r4, #0
	str r0, [sp, #0x58]
	addeq sp, sp, #0x34
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [sp, #0x5c]
	mov r6, #0
	and r0, r2, #0x800
	add r1, fp, #1
	str r0, [sp, #0x18]
	add r0, r1, r1, lsr #31
	str r0, [sp, #0x2c]
	and r0, r2, #0x400
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x64]
	mov r7, r6
	str r0, [sp, #0x24]
	ldrb r0, [sp, #0x65]
	str r0, [sp, #0x28]
_0232B7A4:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #0xc]
	add r4, r0, r6
	ldr r0, [sp, #0x10]
	add r5, r0, r7
	beq _0232B7E0
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl ov02_0232A1AC
	sub r0, fp, r0
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
	b _0232B818
_0232B7E0:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0232B818
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl ov02_0232A1AC
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	asr r1, r0, #1
	ldr r0, [sp, #0x2c]
	rsb r0, r1, r0, asr #1
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
_0232B818:
	ldr r3, [sp, #0x30]
	mov r1, r4
	str r3, [sp]
	add r3, sp, #0x30
	str r3, [sp, #4]
	ldr r3, [sp, #0x24]
	mov r2, r5
	strb r3, [sp, #8]
	ldr r3, [sp, #0x28]
	mov r0, sl
	strb r3, [sp, #9]
	ldr r3, [sp, #0x58]
	bl ov02_0232B654
	ldr r0, [sp, #0x20]
	add r6, r6, r0
	ldr r0, [sp, #0x1c]
	add r7, r7, r0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _0232B7A4
	add sp, sp, #0x34
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_0232B708

	arm_func_start ov02_0232B870
ov02_0232B870: @ 0x0232B870
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	ldr r4, [sp, #0x44]
	mov r8, r0
	str r4, [sp]
	add r0, sp, #0x18
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldmib r8, {r1, r2, r3}
	ldr r4, [sp, #0x40]
	bl ov02_0232A2CC
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	tst r4, #0x10
	beq _0232B8E4
	add r0, r2, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	asr r2, r0, #1
	ldrsb r0, [sp, #0x49]
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
	b _0232B900
_0232B8E4:
	tst r4, #0x20
	beq _0232B900
	ldrsb r1, [sp, #0x48]
	ldrsb r0, [sp, #0x49]
	rsb r2, r2, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_0232B900:
	tst r4, #2
	beq _0232B934
	ldr r0, [sp, #0x24]
	ldrsb r2, [sp, #0x49]
	add r0, r0, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	asr r3, r0, #1
	rsb r0, r2, #0
	mla r7, r3, r0, r7
	mla r6, r3, r1, r6
	b _0232B958
_0232B934:
	tst r4, #4
	beq _0232B958
	ldrsb r1, [sp, #0x49]
	ldr r2, [sp, #0x24]
	ldrsb r0, [sp, #0x48]
	rsb r2, r2, #0
	rsb r1, r1, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_0232B958:
	str r5, [sp]
	ldr r1, [sp, #0x44]
	str r4, [sp, #4]
	ldrb r0, [sp, #0x48]
	str r1, [sp, #8]
	ldrb r4, [sp, #0x49]
	strb r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	strb r4, [sp, #0xd]
	bl ov02_0232B708
	add sp, sp, #0x28
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232B870

	arm_func_start ov02_0232B994
ov02_0232B994: @ 0x0232B994
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr ip, [sp, #0x30]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	tst ip, #0x100
	beq _0232B9E8
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl ov02_0232A258
	ldrsb r2, [sp, #0x39]
	ldr r3, [sp, #0x28]
	ldrsb r1, [sp, #0x38]
	sub r3, r3, r0
	rsb r0, r2, #0
	mla r6, r3, r0, r6
	mla r5, r3, r1, r5
	b _0232BA30
_0232B9E8:
	tst ip, #0x80
	beq _0232BA30
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl ov02_0232A258
	ldr r1, [sp, #0x28]
	add r0, r0, #1
	ldrsb r3, [sp, #0x39]
	add ip, r1, #1
	add r1, r0, r0, lsr #31
	ldrsb r2, [sp, #0x38]
	add r0, ip, ip, lsr #31
	asr r1, r1, #1
	rsb r1, r1, r0, asr #1
	rsb r0, r3, #0
	mla r6, r1, r0, r6
	mla r5, r1, r2, r5
_0232BA30:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r1, [sp]
	ldr r1, [sp, #0x34]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x38]
	str r1, [sp, #8]
	ldrb ip, [sp, #0x39]
	strb r0, [sp, #0xc]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	strb ip, [sp, #0xd]
	bl ov02_0232B708
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0232B994

	arm_func_start ov02_0232BA74
ov02_0232BA74: @ 0x0232BA74
	push {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, #0
	beq _0232BAEC
	cmp r6, #0
	beq _0232BAA4
	ldr r1, [r6]
	ldr r0, _0232BBBC @ =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _0232BAA8
_0232BAA4:
	mov r0, #0
_0232BAA8:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0232BAF0
	cmp r6, #0
	beq _0232BAD8
	ldrh r1, [r6, #6]
	ldr r0, _0232BBC0 @ =0x00000101
	cmp r1, r0
	movhs r0, #1
	bhs _0232BADC
_0232BAD8:
	mov r0, #0
_0232BADC:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _0232BAF0
_0232BAEC:
	mov r0, r4
_0232BAF0:
	cmp r0, #0
	bne _0232BB70
	cmp r6, #0
	beq _0232BB5C
	beq _0232BB18
	ldr r1, [r6]
	ldr r0, _0232BBBC @ =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _0232BB1C
_0232BB18:
	mov r0, #0
_0232BB1C:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0232BB60
	cmp r6, #0
	beq _0232BB48
	ldrh r0, [r6, #6]
	cmp r0, #0x100
	movhs r0, #1
	bhs _0232BB4C
_0232BB48:
	mov r0, #0
_0232BB4C:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _0232BB60
_0232BB5C:
	mov r0, #0
_0232BB60:
	cmp r0, #0
	bne _0232BB6C
	bl FUN_0207BC20
_0232BB6C:
	mov r4, #1
_0232BB70:
	mov r0, r6
	bl ov02_0232BBC8
	ldr r1, _0232BBC4 @ =0x46494E46
	mov r0, r6
	bl ov02_02329FE4
	cmp r0, #0
	moveq r0, #0
	streq r0, [r5]
	popeq {r4, r5, r6, pc}
	add r0, r0, #8
	str r0, [r5]
	cmp r4, #0
	beq _0232BBB4
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #7]
_0232BBB4:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0232BBBC: .4byte 0x4E465452
_0232BBC0: .4byte 0x00000101
_0232BBC4: .4byte 0x46494E46
	arm_func_end ov02_0232BA74

	arm_func_start ov02_0232BBC8
ov02_0232BBC8: @ 0x0232BBC8
	push {r4, r5, r6, lr}
	ldrh r1, [r0, #0xc]
	ldrh r3, [r0, #0xe]
	mov r2, #0
	add r1, r0, r1
	cmp r3, #0
	pople {r4, r5, r6, pc}
	ldr r3, _0232BC94 @ =0x46494E46
	ldr ip, _0232BC98 @ =0x43574448
	ldr r4, _0232BC9C @ =0x434D4150
	ldr lr, _0232BCA0 @ =0x43474C50
_0232BBF4:
	ldr r5, [r1]
	cmp r5, r4
	bhi _0232BC0C
	bhs _0232BC68
	cmp r5, lr
	b _0232BC78
_0232BC0C:
	cmp r5, ip
	bhi _0232BC1C
	beq _0232BC54
	b _0232BC78
_0232BC1C:
	cmp r5, r3
	bne _0232BC78
	ldr r5, [r1, #0x10]
	add r5, r5, r0
	str r5, [r1, #0x10]
	ldr r5, [r1, #0x14]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x14]
	ldr r5, [r1, #0x18]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x18]
	b _0232BC78
_0232BC54:
	ldr r5, [r1, #0xc]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0xc]
	b _0232BC78
_0232BC68:
	ldr r5, [r1, #0x10]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x10]
_0232BC78:
	ldrh r5, [r0, #0xe]
	ldr r6, [r1, #4]
	add r2, r2, #1
	cmp r2, r5
	add r1, r1, r6
	blt _0232BBF4
	pop {r4, r5, r6, pc}
	.align 2, 0
_0232BC94: .4byte 0x46494E46
_0232BC98: .4byte 0x43574448
_0232BC9C: .4byte 0x434D4150
_0232BCA0: .4byte 0x43474C50
	arm_func_end ov02_0232BBC8

	arm_func_start ov02_0232BCA4
ov02_0232BCA4: @ 0x0232BCA4
	push {r4, r5, r6, lr}
	ldrsb r3, [r0, #4]
	ldrb r4, [r0, #5]
	mov r5, r1
	cmp r3, r5
	subge r1, r3, r5
	lsrge r2, r4, r1
	strbge r1, [r0, #4]
	bge _0232BCF4
	ldr r2, [r0]
	sub r6, r5, r3
	add r1, r2, #1
	str r1, [r0]
	ldrb r3, [r2]
	mov r1, r6
	mov r2, #8
	strb r3, [r0, #5]
	strb r2, [r0, #4]
	bl ov02_0232BCA4
	orr r2, r0, r4, lsl r6
_0232BCF4:
	rsb r0, r5, #8
	mov r1, #0xff
	and r0, r2, r1, asr r0
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0232BCA4
_0232BD04:
	.byte 0x00, 0x10, 0x90, 0xE5, 0xB2, 0x20, 0xD1, 0xE0, 0x00, 0x10, 0x80, 0xE5
	.byte 0x02, 0x00, 0xA0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start ov02_0232BD18
ov02_0232BD18: @ 0x0232BD18
	push {r3, lr}
	ldr r0, _0232BD8C @ =0x023544E0
	ldr r1, [r0, #0xc]
	cmp r1, #0
	popne {r3, pc}
	mov r1, #1
	str r1, [r0, #0xc]
	bl FUN_0207CC10
	ldr r0, _0232BD90 @ =ov02_0232BDD0
	ldr r1, _0232BD8C @ =0x023544E0
	mov r2, #0
	str r0, [r1, #0x10]
	ldr r0, _0232BD94 @ =0x0232BE08
	str r2, [r1, #0x14]
	str r0, [r1, #0x1c]
	ldr r0, _0232BD98 @ =0x023544F0
	str r2, [r1, #0x20]
	bl FUN_0208260C
	ldr r0, _0232BD9C @ =0x023544FC
	bl FUN_02082624
	bl ov02_0232BE80
	bl ov02_0232C84C
	bl ov02_0232C038
	ldr r0, _0232BD8C @ =0x023544E0
	mvn r1, #0
	strb r1, [r0]
	mov r1, #1
	str r1, [r0, #4]
	pop {r3, pc}
	.align 2, 0
_0232BD8C: .4byte 0x023544E0
_0232BD90: .4byte ov02_0232BDD0
_0232BD94: .4byte 0x0232BE08
_0232BD98: .4byte 0x023544F0
_0232BD9C: .4byte 0x023544FC
	arm_func_end ov02_0232BD18
_0232BDA0:
	.byte 0x10, 0x40, 0x2D, 0xE9, 0x00, 0x40, 0xA0, 0xE3, 0x04, 0x00, 0xA0, 0xE1, 0xE4, 0x43, 0xF5, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0xFB, 0xFF, 0xFF, 0x1A, 0xCB, 0x00, 0x00, 0xEB, 0xA8, 0x02, 0x00, 0xEB
	.byte 0xF2, 0x06, 0x00, 0xEB, 0x00, 0x00, 0xA0, 0xE3, 0x51, 0x44, 0xF5, 0xEB, 0x10, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0232BDD0
ov02_0232BDD0: @ 0x0232BDD0
	push {r4, lr}
	bl ov02_0232C9DC
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl FUN_0207C8E0
	bl FUN_0207D13C
	mov r4, r0
	mov r0, #1
	bl FUN_0207CF14
	mov r0, r4
	bl FUN_0207D0D0
	pop {r4, pc}
	arm_func_end ov02_0232BDD0
_0232BE08:
	.byte 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x3C, 0xCA, 0x32, 0x02

	arm_func_start ov02_0232BE14
ov02_0232BE14: @ 0x0232BE14
	push {r4, lr}
	movs r4, r0
	popeq {r4, pc}
	mov r1, #0
	bl FUN_0207C9E4
	ldr r0, _0232BE40 @ =0x023568E0
	mvn r1, r4
	ldr r2, [r0, #8]
	and r1, r2, r1
	str r1, [r0, #8]
	pop {r4, pc}
	.align 2, 0
_0232BE40: .4byte 0x023568E0
	arm_func_end ov02_0232BE14

	arm_func_start ov02_0232BE44
ov02_0232BE44: @ 0x0232BE44
	ldr r1, _0232BE5C @ =0x023568E0
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_0232BE5C: .4byte 0x023568E0
	arm_func_end ov02_0232BE44

	arm_func_start ov02_0232BE60
ov02_0232BE60: @ 0x0232BE60
	ldr r1, _0232BE7C @ =0x023568E0
	mov r2, #1
	mvn r0, r2, lsl r0
	ldr r2, [r1, #4]
	and r0, r2, r0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0232BE7C: .4byte 0x023568E0
	arm_func_end ov02_0232BE60

	arm_func_start ov02_0232BE80
ov02_0232BE80: @ 0x0232BE80
	ldr r0, _0232BE98 @ =0x023568E0
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0232BE98: .4byte 0x023568E0
	arm_func_end ov02_0232BE80

	arm_func_start ov02_0232BE9C
ov02_0232BE9C: @ 0x0232BE9C
	mov r2, #0x24
	mul r2, r0, r2
	lsl r0, r1, #0x10
	ldr r1, _0232BEB8 @ =0x02356D5C
	lsr r0, r0, #0x10
	str r0, [r1, r2]
	bx lr
	.align 2, 0
_0232BEB8: .4byte 0x02356D5C
	arm_func_end ov02_0232BE9C

	arm_func_start ov02_0232BEBC
ov02_0232BEBC: @ 0x0232BEBC
	mov r2, #0x24
	mul r2, r0, r2
	ldr r0, _0232BED0 @ =0x02356D60
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_0232BED0: .4byte 0x02356D60
	arm_func_end ov02_0232BEBC

	arm_func_start ov02_0232BED4
ov02_0232BED4: @ 0x0232BED4
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	mov r0, r1
	mov r3, #0
	ldr r2, _0232BF60 @ =ov02_0232C5F4
	add r1, r5, #0x14
	str r3, [sp]
	bl ov02_0232CFB4
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, r5, r6, pc}
	mov r2, #0
	str r2, [r4, #0xc]
	str r6, [r4, #0x10]
	mov r1, r5
	add r0, r4, #0x14
	str r2, [r4, #8]
	bl ov02_0232CE70
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, r5, r6, pc}
	ldr r2, _0232BF64 @ =0x02356D44
	mov r1, #0x24
	mla r2, r6, r1, r2
	str r0, [r4, #8]
	mov r1, r4
	add r0, r2, #0xc
	bl ov02_023295A4
	mov r0, #1
	add sp, sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0232BF60: .4byte ov02_0232C5F4
_0232BF64: .4byte 0x02356D44
	arm_func_end ov02_0232BED4

	arm_func_start FUN_0232BF68
FUN_0232BF68: @ 0x0232BF68
	ldr ip, _0232BF74 @ =FUN_0232C344
	ldr r0, [r0]
	bx ip
	.align 2, 0
_0232BF74: .4byte FUN_0232C344
	arm_func_end FUN_0232BF68

	arm_func_start ov02_0232BF78
ov02_0232BF78: @ 0x0232BF78
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end ov02_0232BF78

	arm_func_start ov02_0232BF84
ov02_0232BF84: @ 0x0232BF84
	ldr r1, [r0]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	str r2, [r0]
	bx lr
	arm_func_end ov02_0232BF84

	arm_func_start FUN_0232BFA4
FUN_0232BFA4: @ 0x0232BFA4
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strbne r1, [r0, #0x41]
	bx lr
	arm_func_end FUN_0232BFA4

	arm_func_start ov02_0232BFB8
ov02_0232BFB8: @ 0x0232BFB8
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strbne r1, [r0, #0x40]
	bx lr
	arm_func_end ov02_0232BFB8

	arm_func_start ov02_0232BFCC
ov02_0232BFCC: @ 0x0232BFCC
	push {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	popeq {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl FUN_0207C85C
	pop {r3, pc}
	arm_func_end ov02_0232BFCC

	arm_func_start ov02_0232BFEC
ov02_0232BFEC: @ 0x0232BFEC
	push {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	popeq {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl FUN_0207C874
	pop {r3, pc}
	arm_func_end ov02_0232BFEC

	arm_func_start ov02_0232C00C
ov02_0232C00C: @ 0x0232C00C
	ldr r3, [r0]
	cmp r3, #0
	bxeq lr
	ldr r3, [r0]
	mov ip, #2
	strh ip, [r3, #0x34]
	ldr r3, [r0]
	strh r1, [r3, #0x38]
	ldr r0, [r0]
	strh r2, [r0, #0x3a]
	bx lr
	arm_func_end ov02_0232C00C

	arm_func_start ov02_0232C038
ov02_0232C038: @ 0x0232C038
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0232C0DC @ =0x023568F8
	mov r1, #0x14
	bl ov02_02329560
	ldr r0, _0232C0E0 @ =0x023568EC
	mov r1, #0x14
	bl ov02_02329560
	mov r6, #0
	ldr r7, _0232C0E4 @ =0x02356904
	ldr r4, _0232C0E0 @ =0x023568EC
	mov r5, r6
_0232C064:
	strb r5, [r7, #0x2c]
	mov r0, r4
	mov r1, r7
	strb r6, [r7, #0x3c]
	bl ov02_023295A4
	add r6, r6, #1
	cmp r6, #0x10
	add r7, r7, #0x44
	blt _0232C064
	mov sl, #0
	ldr sb, _0232C0E8 @ =0x02356D44
	mov r8, #0xc
	mov r7, sl
	mov r6, #0x7f
	mov r5, #1
	mov r4, sl
_0232C0A4:
	mov r0, sb
	mov r1, r8
	bl ov02_02329560
	mov r1, r7
	add r0, sb, #0xc
	bl ov02_02329560
	strb r6, [sb, #0x20]
	str r5, [sb, #0x18]
	add sl, sl, #1
	str r4, [sb, #0x1c]
	cmp sl, #0x20
	add sb, sb, #0x24
	blt _0232C0A4
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0232C0DC: .4byte 0x023568F8
_0232C0E0: .4byte 0x023568EC
_0232C0E4: .4byte 0x02356904
_0232C0E8: .4byte 0x02356D44
	arm_func_end ov02_0232C038

	arm_func_start ov02_0232C0EC
ov02_0232C0EC: @ 0x0232C0EC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl FUN_0207D444
	mov fp, r0
	ldr r0, _0232C244 @ =0x023568F8
	mov r1, #0
	bl ov02_0232970C
	movs r6, r0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr r5, _0232C248 @ =0x020AE224
	rsb r4, r4, #0
_0232C118:
	ldr r0, _0232C244 @ =0x023568F8
	mov r1, r6
	bl ov02_0232970C
	ldrb r1, [r6, #0x2d]
	mov r7, r0
	cmp r1, #0
	bne _0232C148
	ldr r0, [r6, #0x30]
	bl FUN_0207D168
	cmp r0, #0
	movne r0, #1
	strbne r0, [r6, #0x2d]
_0232C148:
	ldrb r0, [r6, #0x2d]
	cmp r0, #0
	beq _0232C170
	ldrb r1, [r6, #0x3c]
	mov r0, #1
	tst fp, r0, lsl r1
	bne _0232C170
	mov r0, r6
	bl ov02_0232C570
	b _0232C234
_0232C170:
	add r0, r6, #0x1c
	bl ov02_0232DD3C
	ldr r0, [r6, #4]
	ldrb r2, [r6, #0x41]
	ldrb r0, [r0, #0x20]
	ldrb r1, [r6, #0x40]
	lsl r2, r2, #1
	lsl r0, r0, #1
	lsl r1, r1, #1
	ldrsh sl, [r5, r0]
	add r0, r6, #0x1c
	ldrsh r8, [r5, r2]
	ldrsh sb, [r5, r1]
	bl ov02_0232DD08
	asr r0, r0, #8
	lsl r0, r0, #1
	add r1, sb, r8
	ldrsh r0, [r5, r0]
	add r1, sl, r1
	add r8, r0, r1
	cmp r8, r4
	movlt r8, r4
	blt _0232C1D8
	ldr r0, _0232C24C @ =0x00007FFF
	cmp r8, r0
	movgt r8, r0
_0232C1D8:
	ldrsh r0, [r6, #0x3e]
	cmp r8, r0
	beq _0232C1F4
	ldrb r0, [r6, #0x3c]
	mov r1, r8
	bl FUN_0207C844
	strh r8, [r6, #0x3e]
_0232C1F4:
	ldrb r0, [r6, #0x2c]
	cmp r0, #2
	bne _0232C218
	add r0, r6, #0x1c
	bl ov02_0232DD54
	cmp r0, #0
	beq _0232C218
	mov r0, r6
	bl ov02_0232C4D0
_0232C218:
	ldrb r0, [r6, #0x2f]
	cmp r0, #0
	beq _0232C234
	ldrb r0, [r6, #0x3c]
	bl FUN_0207C824
	mov r0, #0
	strb r0, [r6, #0x2f]
_0232C234:
	mov r6, r7
	cmp r7, #0
	bne _0232C118
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
	arm_func_end ov02_0232C0EC
_0232C244: .4byte 0x023568F8
_0232C248: .4byte 0x020AE224
_0232C24C: .4byte 0x00007FFF

	arm_func_start ov02_0232C250
ov02_0232C250: @ 0x0232C250
	push {r3, r4, r5, r6, r7, lr}
	ldr ip, _0232C2E4 @ =0x02356D44
	mov r3, #0x24
	mov r4, r0
	ldr r5, [r4]
	mla r6, r1, r3, ip
	mov r7, r2
	cmp r5, #0
	beq _0232C278
	bl ov02_0232BF84
_0232C278:
	ldrh r1, [r6, #8]
	ldr r0, [r6, #0x18]
	cmp r1, r0
	blo _0232C2B4
	mov r0, r6
	mov r1, #0
	bl ov02_0232970C
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r0, #0x3d]
	cmp r7, r1
	movlt r0, #0
	poplt {r3, r4, r5, r6, r7, pc}
	bl ov02_0232C4D0
_0232C2B4:
	mov r0, r7
	bl ov02_0232C508
	movs r5, r0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	bl ov02_0232C42C
	str r4, [r5]
	mov r0, r5
	str r5, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232C2E4: .4byte 0x02356D44
	arm_func_end ov02_0232C250

	arm_func_start ov02_0232C570
ov02_0232C570: @ 0x0232C2E8
	ldr ip, _0232C2F0 @ =ov02_0232C570
	bx ip
	.align 2, 0
_0232C2F0: .4byte ov02_0232C570
	arm_func_end ov02_0232C570

	arm_func_start ov02_0232C2F4
ov02_0232C2F4: @ 0x0232C2F4
	push {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x3c]
	ldr r4, [r5, #4]
	bl FUN_0207C7FC
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _0232C320
	ldrb r0, [r5, #0x3c]
	ldr r1, _0232C340 @ =0x0000FFFF
	bl FUN_0207C890
_0232C320:
	mov r0, r5
	bl ov02_0232C3E4
	bl FUN_0207D13C
	str r0, [r5, #0x30]
	mov r0, #1
	strb r0, [r5, #0x2f]
	strb r0, [r5, #0x2c]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232C340: .4byte 0x0000FFFF
	arm_func_end ov02_0232C2F4

	arm_func_start FUN_0232C344
FUN_0232C344: @ 0x0232C344
	push {r4, lr}
	movs r4, r0
	mov r2, r1
	ldrbne r1, [r4, #0x2c]
	cmpne r1, #0
	popeq {r4, pc}
	cmp r2, #0
	bne _0232C36C
	bl ov02_0232C4D0
	pop {r4, pc}
_0232C36C:
	add r0, r4, #0x1c
	mov r1, #0
	bl ov02_0232DCE0
	mov r0, r4
	mov r1, #0
	bl ov02_0232C644
	mov r0, #2
	strb r0, [r4, #0x2c]
	pop {r4, pc}
	arm_func_end FUN_0232C344

	arm_func_start ov02_0232C390
ov02_0232C390: @ 0x0232C390
	push {r4, r5, r6, lr}
	ldr r3, _0232C3E0 @ =0x02356D44
	mov r2, #0x24
	mla r5, r0, r2, r3
	mov r6, r1
	add r0, r5, #0xc
	mov r1, #0
	bl ov02_0232970C
	movs r4, r0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	mov r1, r4
	add r0, r5, #0xc
	bl ov02_023296AC
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	ldr r0, [r4, #8]
	bl ov02_0232CEF8
	ldr r0, [r4, #8]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0232C3E0: .4byte 0x02356D44
	arm_func_end ov02_0232C390

	arm_func_start ov02_0232C3E4
ov02_0232C3E4: @ 0x0232C3E4
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2f]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x3e]
	mov r1, #0x7f
	strb r1, [r4, #0x40]
	add r0, r4, #0x1c
	strb r1, [r4, #0x41]
	bl ov02_0232DCC8
	add r0, r4, #0x1c
	mov r1, #0x7f00
	mov r2, #1
	bl ov02_0232DCE0
	pop {r4, pc}
	arm_func_end ov02_0232C3E4

	arm_func_start ov02_0232C42C
ov02_0232C42C: @ 0x0232C42C
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0
	mov r5, r0
	bl ov02_0232970C
	movs r1, r0
	beq _0232C468
_0232C448:
	ldrb r2, [r4, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _0232C468
	mov r0, r5
	bl ov02_0232970C
	movs r1, r0
	bne _0232C448
_0232C468:
	mov r0, r5
	mov r2, r4
	bl ov02_02329648
	str r5, [r4, #4]
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232C42C

	arm_func_start ov02_0232C47C
ov02_0232C47C: @ 0x0232C47C
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0232C4CC @ =0x023568F8
	mov r1, #0
	bl ov02_0232970C
	movs r1, r0
	beq _0232C4BC
	ldr r4, _0232C4CC @ =0x023568F8
_0232C49C:
	ldrb r2, [r5, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _0232C4BC
	mov r0, r4
	bl ov02_0232970C
	movs r1, r0
	bne _0232C49C
_0232C4BC:
	ldr r0, _0232C4CC @ =0x023568F8
	mov r2, r5
	bl ov02_02329648
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232C4CC: .4byte 0x023568F8
	arm_func_end ov02_0232C47C

	arm_func_start ov02_0232C4D0
ov02_0232C4D0: @ 0x0232C4D0
	push {r4, lr}
	mov r4, r0
	arm_func_end ov02_0232C4D0

	arm_func_start ov02_0232C4D8
ov02_0232C4D8: @ 0x0232C4D8
	ldrb r0, [r4, #0x2c]
	cmp r0, #2
	bne _0232C4F0
	ldrb r0, [r4, #0x3c]
	ldr r1, _0232C504 @ =0xFFFFFD2D
	bl FUN_0207C844
_0232C4F0:
	ldrb r0, [r4, #0x3c]
	bl FUN_0207C7DC
	mov r0, r4
	bl ov02_0232C570
	pop {r4, pc}
	.align 2, 0
_0232C504: .4byte 0xFFFFFD2D
	arm_func_end ov02_0232C4D8

	arm_func_start ov02_0232C508
ov02_0232C508: @ 0x0232C508
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _0232C568 @ =0x023568EC
	mov r1, #0
	bl ov02_0232970C
	movs r4, r0
	bne _0232C548
	ldr r0, _0232C56C @ =0x023568F8
	mov r1, #0
	bl ov02_0232970C
	mov r4, r0
	ldrb r1, [r4, #0x3d]
	cmp r5, r1
	movlt r0, #0
	poplt {r3, r4, r5, pc}
	bl ov02_0232C4D0
_0232C548:
	ldr r0, _0232C568 @ =0x023568EC
	mov r1, r4
	bl ov02_023296AC
	mov r0, r4
	strb r5, [r4, #0x3d]
	bl ov02_0232C47C
	mov r0, r4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232C568: .4byte 0x023568EC
_0232C56C: .4byte 0x023568F8
	arm_func_end ov02_0232C508

	arm_func_start ov02_0232C570
ov02_0232C570: @ 0x0232C570
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	strne r0, [r4]
	ldr r5, [r4, #4]
	mov r1, r4
	mov r0, r5
	bl ov02_023296AC
	mov r0, #0
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0232C5C8
	add r0, r5, #0xc
	bl ov02_023295A4
	ldr r0, [r4, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r4, #8]
_0232C5C8:
	ldr r0, _0232C5EC @ =0x023568F8
	mov r1, r4
	bl ov02_023296AC
	ldr r0, _0232C5F0 @ =0x023568EC
	mov r1, r4
	bl ov02_023295A4
	mov r0, #0
	strb r0, [r4, #0x2c]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232C5EC: .4byte 0x023568F8
_0232C5F0: .4byte 0x023568EC
	arm_func_end ov02_0232C570

	arm_func_start ov02_0232C5F4
ov02_0232C5F4: @ 0x0232C5F4
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	popeq {r4, pc}
	bl ov02_0232CEE0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #8]
	popne {r4, pc}
	ldr r1, [r4, #0x10]
	ldr r2, _0232C640 @ =0x02356D44
	mov r0, #0x24
	mla r0, r1, r0, r2
	mov r1, r4
	add r0, r0, #0xc
	bl ov02_023296AC
	pop {r4, pc}
	.align 2, 0
_0232C640: .4byte 0x02356D44
	arm_func_end ov02_0232C5F4

	arm_func_start ov02_0232C644
ov02_0232C644: @ 0x0232C644
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	mov r5, r1
	cmp r4, #0
	beq _0232C670
	mov r0, r4
	mov r1, r6
	bl ov02_023296AC
	mov r0, #0
	str r0, [r6, #4]
_0232C670:
	ldr r0, _0232C6A0 @ =0x023568F8
	mov r1, r6
	bl ov02_023296AC
	strb r5, [r6, #0x3d]
	cmp r4, #0
	beq _0232C694
	mov r0, r4
	mov r1, r6
	bl ov02_0232C42C
_0232C694:
	mov r0, r6
	bl ov02_0232C47C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0232C6A0: .4byte 0x023568F8
	arm_func_end ov02_0232C644

	arm_func_start ov02_0232C6A4
ov02_0232C6A4: @ 0x0232C6A4
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	popeq {r4, pc}
	bl ov02_0232BE14
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	pop {r4, pc}
	arm_func_end ov02_0232C6A4

	arm_func_start ov02_0232C6CC
ov02_0232C6CC: @ 0x0232C6CC
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	lsl r2, r2, r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl FUN_0207C8B8
	ldr r0, [r4, #0x24]
	lsl r0, r0, #0x1e
	asrs r0, r0, #0x1f
	popne {r4, pc}
	add r0, r4, #8
	bl FUN_0208260C
	add r0, r4, #0x14
	bl FUN_02082624
	ldr r0, [r4, #0x24]
	orr r0, r0, #2
	str r0, [r4, #0x24]
	pop {r4, pc}
	arm_func_end ov02_0232C6CC

	arm_func_start ov02_0232C720
ov02_0232C720: @ 0x0232C720
	push {r3, lr}
	ldr r1, [r0, #0x24]
	lsl r1, r1, #0x1f
	asrs r1, r1, #0x1f
	popeq {r3, pc}
	bl ov02_0232C7A8
	pop {r3, pc}
	arm_func_end ov02_0232C720

	arm_func_start ov02_0232C73C
ov02_0232C73C: @ 0x0232C73C
	push {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	str r1, [r7, #0x3c]
	ldr r0, [r7, #0x48]
	mov r6, #0
	cmp r0, #0
	pople {r4, r5, r6, r7, r8, pc}
	ldr r4, _0232C7A4 @ =0x02357214
	mov r8, #1
_0232C760:
	add r0, r7, r6
	ldrb r5, [r0, #0x4c]
	ldr r1, [r7, #0x3c]
	add r0, r4, r5, lsl #3
	ldr r0, [r0, #4]
	add r0, r1, r0
	bl FUN_0207D540
	mov r2, r0
	lsl r0, r8, r5
	and r1, r2, #0xff
	asr r2, r2, #8
	bl FUN_0207CA24
	ldr r0, [r7, #0x48]
	add r6, r6, #1
	cmp r6, r0
	blt _0232C760
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0232C7A4: .4byte 0x02357214
	arm_func_end ov02_0232C73C

	arm_func_start ov02_0232C7A8
ov02_0232C7A8: @ 0x0232C7A8
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	lsl r0, r0, #0x1e
	asrs r0, r0, #0x1f
	beq _0232C810
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	lsl r2, r2, r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl FUN_0207C8E0
	add r0, r4, #8
	bl FUN_0208263C
	add r0, r4, #0x14
	bl FUN_02082654
	ldr r0, [r4, #0x24]
	bic r0, r0, #2
	str r0, [r4, #0x24]
	bl FUN_0207D13C
	mov r5, r0
	mov r0, #1
	bl FUN_0207CF14
	mov r0, r5
	bl FUN_0207D0D0
_0232C810:
	mov r0, r4
	bl ov02_0232C81C
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232C7A8

	arm_func_start ov02_0232C81C
ov02_0232C81C: @ 0x0232C81C
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	bl ov02_0232BE60
	ldr r0, _0232C848 @ =0x023571C8
	mov r1, r4
	bl ov02_023296AC
	ldr r0, [r4, #0x24]
	bic r0, r0, #1
	str r0, [r4, #0x24]
	pop {r4, pc}
	.align 2, 0
_0232C848: .4byte 0x023571C8
	arm_func_end ov02_0232C81C

	arm_func_start ov02_0232C84C
ov02_0232C84C: @ 0x0232C84C
	ldr r0, _0232C860 @ =0x02357294
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x48]
	bx lr
	.align 2, 0
_0232C860: .4byte 0x02357294
	arm_func_end ov02_0232C84C

	arm_func_start ov02_0232C864
ov02_0232C864: @ 0x0232C864
	push {r3, r4, r5, lr}
	ldr r0, _0232C8E4 @ =0x02357294
	ldr r4, _0232C8E8 @ =0x023572DC
	ldr r0, [r0, #0x48]
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	add r0, r4, #0x3c
	bl ov02_0232DD3C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0232C8B4
	add r0, r4, #0x3c
	bl ov02_0232DD54
	cmp r0, #0
	beq _0232C8B4
	bl ov02_0232C8EC
	pop {r3, r4, r5, pc}
_0232C8B4:
	add r0, r4, #0x3c
	bl ov02_0232DD08
	ldr r1, [r4, #0x50]
	asr r5, r0, #8
	cmp r5, r1
	popeq {r3, r4, r5, pc}
	ldr r0, [r4, #0x24]
	mov r1, r5
	mov r2, #0
	bl FUN_0207CA24
	str r5, [r4, #0x50]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232C8E4: .4byte 0x02357294
_0232C8E8: .4byte 0x023572DC
	arm_func_end ov02_0232C864

	arm_func_start ov02_0232C8EC
ov02_0232C8EC: @ 0x0232C8EC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _0232C9D0 @ =0x02357294
	ldr r4, _0232C9D4 @ =0x023572DC
	ldr r0, [r0, #0x48]
	cmp r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x2c]
	mov r3, #0
	cmp r1, #0
	movge r7, #1
	movlt r7, #0
	cmp r7, #0
	movne r0, #1
	lslne r2, r0, r1
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	moveq r2, #0
	bl FUN_0207C8E0
	cmp r7, #0
	beq _0232C974
	bl FUN_0207D13C
	mov r5, r0
	mov r0, #1
	bl FUN_0207CF14
	mov r0, r5
	bl FUN_0207D0D0
	ldr r6, _0232C9D8 @ =0x0235729C
	mov r5, #0
_0232C95C:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl FUN_02079E74
	cmp r0, #0
	bne _0232C95C
_0232C974:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0232C984
	bl ov02_0232BE44
_0232C984:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0232C994
	bl ov02_0232BE14
_0232C994:
	cmp r7, #0
	beq _0232C9A4
	ldr r0, [r4, #0x2c]
	bl ov02_0232BE60
_0232C9A4:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0232C9C4
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl FUN_0207CB54
_0232C9C4:
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232C9D0: .4byte 0x02357294
_0232C9D4: .4byte 0x023572DC
_0232C9D8: .4byte 0x0235729C
	arm_func_end ov02_0232C8EC

	arm_func_start ov02_0232C9DC
ov02_0232C9DC: @ 0x0232C9DC
	push {r4, lr}
	ldr r0, _0232CA34 @ =0x02357294
	ldr r3, _0232CA38 @ =0x023572DC
	ldr r0, [r0, #0x48]
	cmp r0, #0
	popeq {r4, pc}
	ldr r1, [r3, #0x2c]
	cmp r1, #0
	movge r0, #1
	lslge r2, r0, r1
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	movlt r2, #0
	mov r3, #0
	bl FUN_0207C8E0
	bl FUN_0207D13C
	mov r4, r0
	mov r0, #1
	bl FUN_0207CF14
	mov r0, r4
	bl FUN_0207D0D0
	pop {r4, pc}
	.align 2, 0
_0232CA34: .4byte 0x02357294
_0232CA38: .4byte 0x023572DC
	arm_func_end ov02_0232C9DC
_0232CA3C:
	.byte 0x10, 0x40, 0x2D, 0xE9
	.byte 0x70, 0x00, 0x9F, 0xE5, 0x70, 0x40, 0x9F, 0xE5, 0x48, 0x00, 0x90, 0xE5, 0x00, 0x00, 0x50, 0xE3
	.byte 0x10, 0x80, 0xBD, 0x08, 0x0C, 0x10, 0x94, 0xE5, 0x00, 0x00, 0xA0, 0xE3, 0x14, 0x20, 0x94, 0xE5
	.byte 0x1C, 0x00, 0x84, 0xE5, 0x2A, 0x3E, 0xF5, 0xEB, 0x10, 0x10, 0x94, 0xE5, 0x14, 0x20, 0x94, 0xE5
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x26, 0x3E, 0xF5, 0xEB, 0x0C, 0x00, 0x94, 0xE5, 0x14, 0x10, 0x94, 0xE5
	.byte 0x15, 0x36, 0xF5, 0xEB, 0x10, 0x00, 0x94, 0xE5, 0x14, 0x10, 0x94, 0xE5, 0x12, 0x36, 0xF5, 0xEB
	.byte 0x2C, 0x10, 0x94, 0xE5, 0x00, 0x30, 0xA0, 0xE3, 0x00, 0x00, 0x51, 0xE3, 0x01, 0x00, 0xA0, 0xA3
	.byte 0x10, 0x21, 0xA0, 0xA1, 0x24, 0x00, 0x94, 0xE5, 0x28, 0x10, 0x94, 0xE5, 0x00, 0x20, 0xA0, 0xB3
	.byte 0x80, 0x3F, 0xF5, 0xEB, 0x10, 0x80, 0xBD, 0xE8, 0x94, 0x72, 0x35, 0x02, 0xDC, 0x72, 0x35, 0x02

	arm_func_start ov02_0232CAC0
ov02_0232CAC0: @ 0x0232CAC0
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	mov r1, r5
	mov r2, #0x30
	bl FUN_0207C330
	ldr r0, [r5, #0x18]
	mov r3, #0
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x8c]
	ldr r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x84]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x88]
	str r3, [r5, #0x90]
	ldr r2, [r5, #0x84]
	ldr r0, [r2, #8]
	cmp r0, #0
	bls _0232CB6C
	mov ip, r3
	mov r1, r3
_0232CB38:
	add r2, r2, #0xc
	ldr r0, [r2, ip]
	add r2, r2, ip
	cmp r0, #0
	moveq r0, r1
	addne r0, r4, r0
	str r0, [r2, #8]
	ldr r2, [r5, #0x84]
	add r3, r3, #1
	ldr r0, [r2, #8]
	add ip, ip, #0x10
	cmp r3, r0
	blo _0232CB38
_0232CB6C:
	mov r1, #0
	ldr r0, _0232CB80 @ =0x02357890
	str r1, [r5, #0x30]
	str r5, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232CB80: .4byte 0x02357890
	arm_func_end ov02_0232CAC0

	arm_func_start ov02_0232CB84
ov02_0232CB84: @ 0x0232CB84
	ldr r1, _0232CB98 @ =0x02357890
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_0232CB98: .4byte 0x02357890
	arm_func_end ov02_0232CB84

	arm_func_start ov02_0232CB9C
ov02_0232CB9C: @ 0x0232CB9C
	ldr r0, _0232CBA8 @ =0x02357890
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0232CBA8: .4byte 0x02357890
	arm_func_end ov02_0232CB9C

	arm_func_start ov02_0232CBAC
ov02_0232CBAC: @ 0x0232CBAC
	ldr r1, _0232CC0C @ =0x02357890
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0xc]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_0232CC0C: .4byte 0x02357890
	arm_func_end ov02_0232CBAC

	arm_func_start ov02_0232CC10
ov02_0232CC10: @ 0x0232CC10
	ldr r1, _0232CC70 @ =0x02357890
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_0232CC70: .4byte 0x02357890
	arm_func_end ov02_0232CC10

	arm_func_start ov02_0232CC74
ov02_0232CC74: @ 0x0232CC74
	ldr r1, _0232CCD4 @ =0x02357890
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x14]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_0232CCD4: .4byte 0x02357890
	arm_func_end ov02_0232CC74

	arm_func_start ov02_0232CCD8
ov02_0232CCD8: @ 0x0232CCD8
	ldr r1, _0232CD38 @ =0x02357890
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x18]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_0232CD38: .4byte 0x02357890
	arm_func_end ov02_0232CCD8

	arm_func_start ov02_0232CD3C
ov02_0232CD3C: @ 0x0232CD3C
	ldr r1, _0232CD60 @ =0x02357890
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x10]
	bx lr
	.align 2, 0
_0232CD60: .4byte 0x02357890
	arm_func_end ov02_0232CD3C

	arm_func_start ov02_0232CD64
ov02_0232CD64: @ 0x0232CD64
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _0232CE28 @ =0x02357890
	mov sb, r2
	ldr r7, [r4]
	mov sl, r1
	ldr r2, [r7, #0x84]
	mov r8, r3
	ldr r1, [r2, #8]
	cmp r0, r1
	mvnhs r0, #0
	pophs {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, [r7, #0x90]
	add r1, r2, #0xc
	cmp r5, #0
	moveq r5, sb
	add fp, r1, r0, lsl #4
	cmp sb, #0
	mov r4, #0
	ble _0232CE20
_0232CDB0:
	ldr r0, [fp, #4]
	sub r6, sb, r4
	cmp r6, r5
	movgt r6, r5
	sub r0, r0, r8
	cmp r6, r0
	movhi r6, r0
	cmp r6, #0
	beq _0232CE20
	ldr r1, [fp]
	mov r2, #0
	add r0, r7, #0x34
	add r1, r1, r8
	bl FUN_0207F828
	cmp r0, #0
	mvneq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, sl
	mov r2, r6
	add r0, r7, #0x34
	bl FUN_0207F818
	cmp r0, #0
	poplt {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, r4, r0
	cmp r4, sb
	add r8, r8, r0
	add sl, sl, r0
	blt _0232CDB0
_0232CE20:
	mov r0, r4
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232CE28: .4byte 0x02357890
	arm_func_end ov02_0232CD64

	arm_func_start ov02_0232CE2C
ov02_0232CE2C: @ 0x0232CE2C
	ldr r1, _0232CE50 @ =0x02357890
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x14]
	bx lr
	.align 2, 0
_0232CE50: .4byte 0x02357890
	arm_func_end ov02_0232CE2C

	arm_func_start ov02_0232CE54
ov02_0232CE54: @ 0x0232CE54
	ldr r2, _0232CE6C @ =0x02357890
	ldr r2, [r2]
	ldr r2, [r2, #0x84]
	add r0, r2, r0, lsl #4
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_0232CE6C: .4byte 0x02357890
	arm_func_end ov02_0232CE54

	arm_func_start ov02_0232CE70
ov02_0232CE70: @ 0x0232CE70
	push {r3, r4, r5, lr}
	add r2, r0, #3
	add r0, r0, r1
	bic r5, r2, #3
	cmp r5, r0
	movhi r0, #0
	pophi {r3, r4, r5, pc}
	sub r1, r0, r5
	cmp r1, #0x10
	movlo r0, #0
	poplo {r3, r4, r5, pc}
	add r0, r5, #0x10
	sub r1, r1, #0x10
	mov r2, #0
	bl ov02_02329F40
	movs r4, r0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov02_0232D02C
	cmp r0, #0
	movne r0, r5
	popne {r3, r4, r5, pc}
	mov r0, r4
	bl ov02_02329844
	mov r0, #0
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232CE70

	arm_func_start ov02_0232CEE0
ov02_0232CEE0: @ 0x0232CEE0
	push {r4, lr}
	mov r4, r0
	bl ov02_0232CEF8
	ldr r0, [r4]
	bl ov02_02329844
	pop {r4, pc}
	arm_func_end ov02_0232CEE0

	arm_func_start ov02_0232CEF8
ov02_0232CEF8: @ 0x0232CEF8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r6, #0
	mov r1, r6
	add r0, r8, #4
	bl ov02_02329724
	movs r5, r0
	beq _0232CF90
	mov sl, #1
	mov sb, r6
	mov r4, r6
_0232CF24:
	mov r0, r5
	mov r1, r4
	bl ov02_02329724
	movs r7, r0
	beq _0232CF70
_0232CF38:
	ldr ip, [r7, #0xc]
	cmp ip, #0
	beq _0232CF5C
	ldr r1, [r7, #8]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	add r0, r7, #0x20
	blx ip
	mov r6, sl
_0232CF5C:
	mov r0, r5
	mov r1, r7
	bl ov02_02329724
	movs r7, r0
	bne _0232CF38
_0232CF70:
	mov r1, r5
	add r0, r8, #4
	bl ov02_023296AC
	mov r1, sb
	add r0, r8, #4
	bl ov02_02329724
	movs r5, r0
	bne _0232CF24
_0232CF90:
	ldr r0, [r8]
	mov r1, #3
	bl ov02_02329FB8
	cmp r6, #0
	beq _0232CFA8
	bl ov02_0232D09C
_0232CFA8:
	mov r0, r8
	bl ov02_0232D060
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov02_0232CEF8

	arm_func_start ov02_0232CFB4
ov02_0232CFB4: @ 0x0232CFB4
	push {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	add r0, r7, #0x1f
	bic r1, r0, #0x1f
	mov r6, r2
	ldr r0, [r8]
	add r1, r1, #0x20
	mov r2, #0x20
	mov r5, r3
	bl ov02_02329F84
	movs r4, r0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	add r0, r8, #4
	mov r1, #0
	bl ov02_02329724
	str r7, [r4, #8]
	str r6, [r4, #0xc]
	ldr r2, [sp, #0x18]
	str r5, [r4, #0x10]
	mov r1, r4
	str r2, [r4, #0x14]
	bl ov02_023295A4
	add r0, r4, #0x20
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232CFB4

	arm_func_start ov02_0232D01C
ov02_0232D01C: @ 0x0232D01C
	ldr ip, _0232D028 @ =ov02_02329560
	mov r1, #0
	bx ip
	.align 2, 0
_0232D028: .4byte ov02_02329560
	arm_func_end ov02_0232D01C

	arm_func_start ov02_0232D02C
ov02_0232D02C: @ 0x0232D02C
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #4
	mov r1, #0xc
	bl ov02_02329560
	mov r0, r5
	str r4, [r5]
	bl ov02_0232D060
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232D02C

	arm_func_start ov02_0232D060
ov02_0232D060: @ 0x0232D060
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r1, #0x14
	mov r2, #4
	bl ov02_02329F84
	movs r4, r0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	bl ov02_0232D01C
	mov r1, r4
	add r0, r5, #4
	bl ov02_023295A4
	mov r0, #1
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232D060

	arm_func_start ov02_0232D09C
ov02_0232D09C: @ 0x0232D09C
	push {r4, lr}
	bl FUN_0207D13C
	mov r4, r0
	mov r0, #1
	bl FUN_0207CF14
	mov r0, r4
	bl FUN_0207D0D0
	pop {r4, pc}
	arm_func_end ov02_0232D09C

	arm_func_start ov02_0232D0BC
ov02_0232D0BC: @ 0x0232D0BC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r1
	mov sb, r2
	mov fp, r3
	bl ov02_0232CC10
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #4
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	tst sl, #2
	ldr r0, [r5]
	beq _0232D110
	mov r1, sb
	mov r2, fp
	bl ov02_0232D328
	movs r6, r0
	bne _0232D118
	add sp, sp, #8
	mov r0, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232D110:
	bl ov02_0232CE2C
	mov r6, r0
_0232D118:
	and r8, sl, #4
	mov r7, #0
_0232D120:
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	ldr r1, _0232D1F8 @ =0x0000FFFF
	cmp r0, r1
	beq _0232D1D4
	bl ov02_0232CC74
	movs r4, r0
	addeq sp, sp, #8
	moveq r0, #5
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #4
	str r0, [sp]
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl ov02_0232D1FC
	cmp r0, #0
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4]
	lsr r0, r0, #0x18
	tst r0, #1
	cmpne r8, #0
	beq _0232D1B8
	str sb, [sp]
	ldr r1, [r4]
	ldr r0, [sp, #4]
	lsl r3, r1, #8
	mov r1, r6
	mov r2, r7
	lsr r3, r3, #8
	bl ov02_0232D6F0
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #9
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0232D1B8:
	cmp r6, #0
	ldrne r2, [sp, #4]
	cmpne r2, #0
	beq _0232D1D4
	mov r0, r6
	mov r1, r7
	bl FUN_0207D5B0
_0232D1D4:
	add r7, r7, #1
	cmp r7, #4
	blt _0232D120
	ldr r0, [sp, #0x30]
	cmp r0, #0
	strne r6, [r0]
	mov r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0232D1F8: .4byte 0x0000FFFF
	arm_func_end ov02_0232D0BC

	arm_func_start ov02_0232D1FC
ov02_0232D1FC: @ 0x0232D1FC
	push {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov02_0232CC74
	cmp r0, #0
	moveq r0, #5
	popeq {r4, r5, r6, pc}
	tst r6, #4
	ldr r0, [r0]
	beq _0232D268
	lsr r1, r0, #0x18
	tst r1, #1
	lsl r0, r0, #8
	mov r1, r5
	beq _0232D24C
	mov r2, r4
	lsr r0, r0, #8
	bl ov02_0232D400
	b _0232D258
_0232D24C:
	mov r2, r4
	lsr r0, r0, #8
	bl ov02_0232D394
_0232D258:
	cmp r0, #0
	bne _0232D274
	mov r0, #9
	pop {r4, r5, r6, pc}
_0232D268:
	lsl r0, r0, #8
	lsr r0, r0, #8
	bl ov02_0232CE2C
_0232D274:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0232D1FC

	arm_func_start ov02_0232D288
ov02_0232D288: @ 0x0232D288
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r4, r3
	bl ov02_0232CD3C
	movs r5, r0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, pc}
	mov r2, r7
	mov r3, r6
	add r1, r5, #0x20
	str r4, [sp]
	bl ov02_0232CFB4
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r4
	mov r2, r5
	mov r3, #0
	bl ov02_0232CD64
	cmp r5, r0
	addne sp, sp, #4
	movne r0, #0
	popne {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r5
	bl FUN_0207A2C0
	mov r0, r4
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232D288

	arm_func_start ov02_0232D328
ov02_0232D328: @ 0x0232D328
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl ov02_0232CE2C
	movs r4, r0
	bne _0232D388
	cmp r5, #0
	moveq r2, #0
	beq _0232D358
	bl ov02_0232CB9C
	mov r2, r0
_0232D358:
	ldr r1, _0232D390 @ =ov02_0232D560
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl ov02_0232D288
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _0232D388
	mov r0, r7
	mov r1, r4
	bl ov02_0232CE54
_0232D388:
	mov r0, r4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D390: .4byte ov02_0232D560
	arm_func_end ov02_0232D328

	arm_func_start ov02_0232D394
ov02_0232D394: @ 0x0232D394
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl ov02_0232CE2C
	movs r4, r0
	bne _0232D3F4
	cmp r5, #0
	moveq r2, #0
	beq _0232D3C4
	bl ov02_0232CB9C
	mov r2, r0
_0232D3C4:
	ldr r1, _0232D3FC @ =ov02_0232D590
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl ov02_0232D288
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _0232D3F4
	mov r0, r7
	mov r1, r4
	bl ov02_0232CE54
_0232D3F4:
	mov r0, r4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232D3FC: .4byte ov02_0232D590
	arm_func_end ov02_0232D394

	arm_func_start ov02_0232D400
ov02_0232D400: @ 0x0232D400
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl ov02_0232CE2C
	movs r5, r0
	bne _0232D4F4
	ldr r1, _0232D4FC @ =0x02357894
	mov r0, sb
	mov r2, #0x3c
	mov r3, #0
	bl ov02_0232CD64
	cmp r0, #0x3c
	movne r0, #0
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0232D500 @ =0x02357894
	cmp r8, #0
	ldr r0, [r0, #0x38]
	lsl r6, r0, #2
	lsl r4, r6, #1
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	moveq r3, #0
	beq _0232D46C
	bl ov02_0232CB9C
	mov r3, r0
_0232D46C:
	ldr r2, _0232D504 @ =ov02_0232D5C0
	mov r0, r8
	add r1, r4, #0x5c
	str sb, [sp]
	bl ov02_0232CFB4
	movs r5, r0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r5
	add r2, r6, #0x3c
	mov r3, #0
	bl ov02_0232CD64
	add r1, r6, #0x3c
	cmp r0, r1
	movne r0, #0
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r5, #0x38]
	add r0, r5, #0x3c
	mov r2, r6
	add r1, r0, r1, lsl #2
	bl FUN_0207C4C8
	mov r2, r6
	add r0, r5, #0x3c
	mov r1, #0
	bl FUN_0207C40C
	mov r0, r5
	add r1, r4, #0x3c
	bl FUN_0207A2C0
	cmp r7, #0
	beq _0232D4F4
	mov r0, sb
	mov r1, r5
	bl ov02_0232CE54
_0232D4F4:
	mov r0, r5
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232D4FC: .4byte 0x02357894
_0232D500: .4byte 0x02357894
_0232D504: .4byte ov02_0232D5C0
	arm_func_end ov02_0232D400

	arm_func_start ov02_0232D508
ov02_0232D508: @ 0x0232D508
	push {r3, r4, r5, r6, r7, lr}
	movs r4, r1
	mov r7, r0
	mov r6, r2
	popeq {r3, r4, r5, r6, r7, pc}
	bl FUN_0207B7E4
	mov r5, r0
	mov r0, r4
	bl ov02_0232CB84
	mov r4, r0
	mov r0, r6
	bl ov02_0232CE2C
	cmp r7, r0
	bne _0232D54C
	mov r0, r6
	mov r1, #0
	bl ov02_0232CE54
_0232D54C:
	mov r0, r4
	bl ov02_0232CB84
	mov r0, r5
	bl FUN_0207B7F8
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0232D508

	arm_func_start ov02_0232D560
ov02_0232D560: @ 0x0232D560
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl ov02_0232D508
	mov r0, r5
	add r1, r5, r4
	bl FUN_0207CB14
	mov r0, r5
	bl FUN_0207D67C
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232D560

	arm_func_start ov02_0232D590
ov02_0232D590: @ 0x0232D590
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl ov02_0232D508
	mov r0, r5
	add r1, r5, r4
	bl FUN_0207CB34
	mov r0, r5
	bl FUN_0207D714
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0232D590

	arm_func_start ov02_0232D5C0
ov02_0232D5C0: @ 0x0232D5C0
	push {r4, lr}
	mov r1, r2
	mov r4, r0
	mov r2, r3
	bl ov02_0232D508
	mov r0, r4
	bl FUN_0207D714
	pop {r4, pc}
	arm_func_end ov02_0232D5C0

	arm_func_start ov02_0232D5E0
ov02_0232D5E0: @ 0x0232D5E0
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r7, r0
	mov r4, r3
	mov r6, r1
	mov r0, r5
	mov r1, r4
	bl FUN_0207D968
	cmp r7, r0
	bne _0232D618
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl FUN_0207D934
_0232D618:
	mov r0, r7
	add r1, r7, r6
	bl FUN_0207CB34
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0232D5E0

	arm_func_start ov02_0232D628
ov02_0232D628: @ 0x0232D628
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl FUN_0207D968
	cmp r0, #0
	movne r0, #1
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	bl FUN_0207D92C
	ldr r1, [r8, #0x38]
	sub r0, r0, #1
	add r1, r1, r7
	add r1, r8, r1, lsl #2
	cmp r7, r0
	ldrlo r0, [r1, #0x40]
	ldr r4, [r1, #0x3c]
	ldrhs r0, [r8, #8]
	cmp r5, #0
	sub sb, r0, r4
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, _0232D6EC @ =ov02_0232D5E0
	mov r0, r5
	mov r3, r8
	add r1, sb, #0x20
	str r7, [sp]
	bl ov02_0232CFB4
	movs r5, r0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	mov r1, r5
	mov r2, sb
	mov r3, r4
	bl ov02_0232CD64
	cmp sb, r0
	movne r0, #0
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	mov r1, sb
	bl FUN_0207A2C0
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl FUN_0207D934
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0232D6EC: .4byte ov02_0232D5E0
	arm_func_end ov02_0232D628

	arm_func_start ov02_0232D6F0
ov02_0232D6F0: @ 0x0232D6F0
	push {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	add r0, sp, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x40]
	bl FUN_0207D75C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	cmp r7, #0
	add r2, sp, #8
	addeq sp, sp, #0x1c
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0x10
	mov r0, r7
	bl FUN_0207D77C
	cmp r0, #0
	beq _0232D7A4
	add sl, sp, #0x10
	add sb, sp, #8
_0232D754:
	ldrb r0, [sp, #0x10]
	cmp r0, #1
	ldrheq r0, [sp, #0x14]
	cmpeq r6, r0
	bne _0232D78C
	ldrh r1, [sp, #0x12]
	mov r0, r8
	mov r2, r5
	mov r3, r4
	bl ov02_0232D628
	cmp r0, #0
	addeq sp, sp, #0x1c
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_0232D78C:
	mov r0, r7
	mov r1, sl
	mov r2, sb
	bl FUN_0207D77C
	cmp r0, #0
	bne _0232D754
_0232D7A4:
	mov r0, #1
	add sp, sp, #0x1c
	pop {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov02_0232D6F0

	arm_func_start ov02_0232D7B0
ov02_0232D7B0: @ 0x0232D7B0
	push {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	bl ov02_0232CB9C
	mov r6, #0
	mov r5, r6
_0232D7C4:
	mov r0, r6
	bl ov02_0232CCD8
	movs r7, r0
	beq _0232D838
	ldrb r1, [r7]
	mov r0, r6
	bl ov02_0232BE9C
	ldrh r1, [r7, #2]
	mov r0, r6
	bl ov02_0232BEBC
	ldr r0, [r7, #4]
	cmp r0, #0
	cmpne r4, #0
	beq _0232D838
	ldrb r0, [r7]
	mov r8, r5
	cmp r0, #0
	ble _0232D838
_0232D80C:
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	bl ov02_0232BED4
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r7]
	add r8, r8, #1
	cmp r8, r0
	blt _0232D80C
_0232D838:
	add r6, r6, #1
	cmp r6, #0x20
	blt _0232D7C4
	mov r0, #1
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232D7B0

	arm_func_start ov02_0232D84C
ov02_0232D84C: @ 0x0232D84C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl ov02_0232CBAC
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	bl ov02_0232CE2C
	movs r4, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r1, r5
	bl ov02_0232DC88
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	stm sp, {r0, r4, r6}
	str r5, [sp, #0xc]
	ldrb r1, [r0, #9]
	ldrh r2, [r0, #4]
	ldrb r3, [r0, #8]
	mov r0, r7
	bl ov02_0232D8CC
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0232D84C

	arm_func_start ov02_0232D8CC
ov02_0232D8CC: @ 0x0232D8CC
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r2
	mov r2, r3
	ldr r6, [sp, #0x20]
	mov r4, r0
	mov r8, r1
	bl ov02_0232C250
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r5
	bl ov02_0232C390
	add ip, sp, #4
	mov r2, r0
	mov r0, r7
	mov r1, #6
	mov r3, #0
	str ip, [sp]
	bl ov02_0232D0BC
	cmp r0, #0
	beq _0232D940
	mov r0, r5
	bl ov02_0232C570
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0232D940:
	ldr ip, [sp, #0x24]
	ldr r2, [r6]
	ldr r1, [ip, #0x18]
	ldr r3, [sp, #4]
	mov r0, r5
	add r1, ip, r1
	bl ov02_0232C2F4
	ldrb r1, [r6, #6]
	mov r0, r4
	bl ov02_0232BFB8
	ldrb r1, [r6, #7]
	mov r0, r4
	bl ov02_0232BFCC
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r0, r4
	bl ov02_0232C00C
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232D8CC

	arm_func_start ov02_0232D990
ov02_0232D990: @ 0x0232D990
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0232DA98 @ =0x02357F6C
	ldr r4, _0232DA9C @ =0x020AE224
	mov r5, #0
_0232D9A0:
	ldr r1, [r7, #0x110]
	lsl r0, r1, #0x1f
	asrs r0, r0, #0x1f
	beq _0232DA84
	ldr r0, [r7, #0x114]
	cmp r0, #0
	bne _0232D9C8
	mov r0, r7
	bl ov02_0232DACC
	b _0232DA84
_0232D9C8:
	lsl r0, r1, #0x1d
	asrs r0, r0, #0x1f
	ldrne r0, [r7, #0x118]
	cmpne r0, #0
	beq _0232D9F4
	mov r0, r7
	bl ov02_0232C6CC
	ldr r0, [r7, #0x110]
	orr r0, r0, #2
	bic r0, r0, #4
	str r0, [r7, #0x110]
_0232D9F4:
	ldr r0, [r7, #0x110]
	lsl r0, r0, #0x1e
	asrs r0, r0, #0x1f
	beq _0232DA84
	add r0, r7, #0xe8
	bl ov02_0232DD3C
	ldr r1, [r7, #0x154]
	add r0, r7, #0xe8
	lsl r1, r1, #1
	ldrsh r6, [r4, r1]
	bl ov02_0232DD08
	asr r0, r0, #8
	ldr r1, [r7, #0x158]
	lsl r0, r0, #1
	lsl r2, r1, #1
	ldrsh r1, [r4, r0]
	ldrsh r2, [r4, r2]
	ldr r0, [r7, #0x15c]
	add r1, r1, r6
	add r6, r2, r1
	cmp r6, r0
	beq _0232DA5C
	mov r0, r7
	mov r1, r6
	bl ov02_0232C73C
	str r6, [r7, #0x15c]
_0232DA5C:
	ldr r0, [r7, #0x110]
	lsl r0, r0, #0x1c
	asrs r0, r0, #0x1f
	beq _0232DA84
	add r0, r7, #0xe8
	bl ov02_0232DD54
	cmp r0, #0
	beq _0232DA84
	mov r0, r7
	bl ov02_0232DACC
_0232DA84:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x174
	blt _0232D9A0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0232DA98: .4byte 0x02357F6C
_0232DA9C: .4byte 0x020AE224
	arm_func_end ov02_0232D990

	arm_func_start ov02_0232DAA0
ov02_0232DAA0: @ 0x0232DAA0
	ldr r2, [r0, #0x14c]
	cmp r2, #0
	movne r1, #0
	strne r1, [r2]
	strne r1, [r0, #0x14c]
	ldr r1, [r0, #0x110]
	bic r2, r1, #1
	bic r1, r2, #4
	bic r1, r1, #2
	str r1, [r0, #0x110]
	bx lr
	arm_func_end ov02_0232DAA0

	arm_func_start ov02_0232DACC
ov02_0232DACC: @ 0x0232DACC
	push {r4, lr}
	mov r4, r0
	ldr r0, _0232DB5C @ =0x02357F48
	bl FUN_0207A048
	ldr r0, _0232DB60 @ =0x023578D0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0232DAF8
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl FUN_0207A048
_0232DAF8:
	ldr r0, [r4, #0x110]
	lsl r0, r0, #0x1e
	asrs r0, r0, #0x1f
	beq _0232DB10
	mov r0, r4
	bl ov02_0232C720
_0232DB10:
	ldr r0, [r4, #0x110]
	lsl r0, r0, #0x1f
	asrs r0, r0, #0x1f
	beq _0232DB2C
	ldr r1, [r4, #0x170]
	mov r0, r4
	blx r1
_0232DB2C:
	mov r0, r4
	bl ov02_0232DB64
	ldr r0, _0232DB5C @ =0x02357F48
	bl FUN_0207A0CC
	ldr r0, _0232DB60 @ =0x023578D0
	ldr r0, [r0, #4]
	cmp r0, #0
	popeq {r4, pc}
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl FUN_0207A0CC
	pop {r4, pc}
	.align 2, 0
_0232DB5C: .4byte 0x02357F48
_0232DB60: .4byte 0x023578D0
	arm_func_end ov02_0232DACC

	arm_func_start ov02_0232DB64
ov02_0232DB64: @ 0x0232DB64
	push {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x110]
	lsl r1, r1, #0x1f
	asrs r1, r1, #0x1f
	popeq {r4, pc}
	bl ov02_0232DBC8
	ldr r1, [r4, #0x168]
	mov r0, r4
	blx r1
	ldr r0, _0232DBC0 @ =0x02357F60
	mov r1, r4
	bl ov02_0232DBEC
	ldr r0, _0232DBC4 @ =0x023578D0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0232DBB4
	mov r1, r4
	add r0, r0, #0x4e0
	bl ov02_0232DBEC
_0232DBB4:
	mov r0, r4
	bl ov02_0232DAA0
	pop {r4, pc}
	.align 2, 0
_0232DBC0: .4byte 0x02357F60
_0232DBC4: .4byte 0x023578D0
	arm_func_end ov02_0232DB64

	arm_func_start ov02_0232DBC8
ov02_0232DBC8: @ 0x0232DBC8
	push {r3, lr}
	ldr r1, [r0, #0x120]
	cmp r1, #0
	popeq {r3, pc}
	subs r1, r1, #1
	str r1, [r0, #0x120]
	popne {r3, pc}
	bl ov02_0232C6A4
	pop {r3, pc}
	arm_func_end ov02_0232DBC8

	arm_func_start ov02_0232DBEC
ov02_0232DBEC: @ 0x0232DBEC
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	bl FUN_0207B7E4
	mov r4, r0
	mov r0, r8
	mov r1, #0
	bl ov02_0232970C
	movs r5, r0
	beq _0232DC50
_0232DC14:
	mov r0, r8
	mov r1, r5
	bl ov02_0232970C
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r1, r7
	bne _0232DC44
	mov r0, r8
	mov r1, r5
	bl ov02_023296AC
	mov r0, r5
	bl ov02_0232DC5C
_0232DC44:
	mov r5, r6
	cmp r6, #0
	bne _0232DC14
_0232DC50:
	mov r0, r4
	bl FUN_0207B7F8
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0232DBEC

	arm_func_start ov02_0232DC5C
ov02_0232DC5C: @ 0x0232DC5C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl FUN_0207B7E4
	mov r4, r0
	ldr r0, _0232DC84 @ =0x023578DC
	mov r1, r5
	bl ov02_023295A4
	mov r0, r4
	bl FUN_0207B7F8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0232DC84: .4byte 0x023578DC
	arm_func_end ov02_0232DC5C

	arm_func_start ov02_0232DC88
ov02_0232DC88: @ 0x0232DC88
	cmp r1, #0
	movlt r0, #0
	bxlt lr
	ldr r2, [r0, #0x1c]
	cmp r1, r2
	movhs r0, #0
	bxhs lr
	mov r2, #0xc
	mul r3, r1, r2
	add ip, r0, #0x20
	ldr r1, [ip, r3]
	sub r0, r2, #0xd
	cmp r1, r0
	add r0, ip, r3
	moveq r0, #0
	bx lr
	arm_func_end ov02_0232DC88

	arm_func_start ov02_0232DCC8
ov02_0232DCC8: @ 0x0232DCC8
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	bx lr
	arm_func_end ov02_0232DCC8

	arm_func_start ov02_0232DCE0
ov02_0232DCE0: @ 0x0232DCE0
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl ov02_0232DD08
	stm r6, {r0, r5}
	str r4, [r6, #0xc]
	mov r0, #0
	str r0, [r6, #8]
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0232DCE0

	arm_func_start ov02_0232DD08
ov02_0232DD08: @ 0x0232DD08
	push {r4, lr}
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #8]
	cmp r2, r1
	ldrge r0, [r0, #4]
	popge {r4, pc}
	ldr r4, [r0]
	ldr r0, [r0, #4]
	sub r0, r0, r4
	mul r0, r2, r0
	bl FUN_0208FEA4
	add r0, r4, r0
	pop {r4, pc}
	arm_func_end ov02_0232DD08

	arm_func_start ov02_0232DD3C
ov02_0232DD3C: @ 0x0232DD3C
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #8]
	bx lr
	arm_func_end ov02_0232DD3C

	arm_func_start ov02_0232DD54
ov02_0232DD54: @ 0x0232DD54
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	movge r0, #1
	movlt r0, #0
	bx lr
	arm_func_end ov02_0232DD54

	arm_func_start ov02_0232DD6C
ov02_0232DD6C: @ 0x0232DD6C
	stmdbmi r2, {r3, r8, sl, ip, sp, pc}
	strmi r6, [r8, sb, lsl #16]
	strbmi fp, [r0], r8, lsl #26
	eorseq sb, r5, #32, #6
	arm_func_end ov02_0232DD6C

	arm_func_start ov02_0232DD7C
ov02_0232DD7C: @ 0x0232DD7C
	stmdbmi r2, {r3, r8, sl, ip, sp, pc}
	strmi r6, [r8, sb, lsl #16]
	strbmi fp, [r0], r8, lsl #26
	eorseq sb, r5, #44, #6
	arm_func_end ov02_0232DD7C

	thumb_func_start ov02_0232DD8C
ov02_0232DD8C: @ 0x0232DD8C
	push {r4, lr}
	ldr r2, _0232DE60 @ =0x00000106
	adds r4, r0, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq FUN_0232DDDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	blt FUN_0232DDDC
	adds r0, r2, #2
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt FUN_0232DDDC
	adds r0, r2, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq FUN_0232DDDC
	cmp r0, r1
	blt FUN_0232DDDC
	adds r0, r2, #6
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt FUN_0232DDDC
	adds r0, r2, #0
	adds r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt FUN_0232DDDC
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq FUN_0232DDDC
	subs r0, r2, #6
	cmp r1, r0
	bhi FUN_0232DDDC
	subs r0, r1, #1
	adds r0, r4, r0
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq FUN_0232DDE2
	movs r1, #0
	mvns r1, r1
	thumb_func_end ov02_0232DD8C
_0232DDE0:
	.byte 0x00, 0xE0, 0x00, 0x21, 0x1F, 0x48, 0x00, 0x68, 0x00, 0x28, 0x03, 0xD0, 0x1E, 0x48, 0x00, 0x68
	.byte 0x00, 0x28, 0x01, 0xD1, 0x00, 0x21, 0xC9, 0x43, 0x00, 0x20, 0xC0, 0x43, 0x81, 0x42, 0x07, 0xD1
	.byte 0x1A, 0x48, 0x0F, 0x21, 0x21, 0x54, 0x00, 0xF0, 0x51, 0xFD, 0x00, 0x20, 0xC0, 0x43, 0x10, 0xBD
	.byte 0x17, 0x48, 0xFF, 0xF7, 0xAB, 0xFF, 0x17, 0x49, 0x00, 0x28, 0x48, 0x61, 0x07, 0xD1, 0x13, 0x48
	.byte 0x0F, 0x21, 0x21, 0x54, 0x00, 0xF0, 0x42, 0xFD, 0x00, 0x20, 0xC0, 0x43, 0x10, 0xBD, 0x00, 0x20
	.byte 0xC0, 0x43, 0x00, 0xF0, 0x0F, 0xFF, 0x20, 0x1C, 0x00, 0xF0, 0x20, 0xF8, 0x04, 0x1C, 0x0D, 0x48
	.byte 0x40, 0x69, 0xFF, 0xF7, 0x9B, 0xFF, 0x00, 0xF0, 0x31, 0xFD, 0x0B, 0x48, 0x00, 0x21, 0x00, 0x68
	.byte 0xC9, 0x43, 0x88, 0x42, 0x01, 0xD0, 0x02, 0xF0, 0x1F, 0xF8, 0x20, 0x1C, 0x10, 0xBD, 0xC0, 0x46
	.byte 0x06, 0x01, 0x00, 0x00, 0x20, 0x93, 0x35, 0x02, 0x2C, 0x93, 0x35, 0x02, 0x16, 0x01, 0x00, 0x00
	.byte 0xF8, 0x05, 0x00, 0x00, 0x3C, 0x85, 0x35, 0x02, 0x64, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232DE7C
ov02_0232DE7C: @ 0x0232DE7C
	ldrshtlt fp, [r2], r8
	ldrdls r4, r5, [r2], -r3
	stmdahi sb, {r1, r3, fp, pc} ^
	strhi sl, [r2], -fp, lsl #16
	andhs r8, r0, r1, asr #12
	andhi sl, r8, r6, lsl sb
	subhi sb, r8, sb
	andsls r2, r5, r1
	stmdbls sb, {r0, r3, fp, ip, pc}
	andls sb, r7, r4, lsl r0
	andshs sl, r8, #44, #16
	arm_func_end ov02_0232DE7C
_0232DEA8:
	.byte 0x01, 0xF0, 0xA8, 0xFF, 0xC9, 0x49, 0x02, 0x98
	.byte 0x40, 0x5E, 0x0B, 0xA9, 0x08, 0x86, 0x30, 0x20, 0x0A, 0x5E, 0x31, 0x38, 0x82, 0x42, 0x01, 0xD1
	.byte 0x0A, 0x20, 0x08, 0x86, 0xC4, 0x49, 0x02, 0x98, 0x40, 0x5E, 0x0B, 0xA9, 0x88, 0x85, 0x2C, 0x20
	.byte 0x0A, 0x5E, 0x2D, 0x38, 0x82, 0x42, 0x01, 0xD1, 0x0A, 0x20, 0x88, 0x85, 0x42, 0x21, 0x02, 0x98
	.byte 0x89, 0x00, 0x40, 0x5E, 0x0B, 0xA9, 0x48, 0x86, 0x32, 0x20, 0x0A, 0x5E, 0x33, 0x38, 0x82, 0x42
	.byte 0x01, 0xD1, 0x64, 0x20, 0x48, 0x86, 0x43, 0x21, 0x02, 0x98, 0x89, 0x00, 0x40, 0x5E, 0x0B, 0xA9
	.byte 0xC8, 0x85, 0x2E, 0x20, 0x0A, 0x5E, 0x2F, 0x38, 0x82, 0x42, 0x01, 0xD1, 0x64, 0x20, 0xC8, 0x85
	.byte 0xB2, 0x49, 0x02, 0x98, 0x40, 0x5E, 0x00, 0x21, 0xC9, 0x43, 0x03, 0x90, 0x88, 0x42, 0x02, 0xD1
	.byte 0x7D, 0x20, 0x00, 0x01, 0x03, 0x90, 0x02, 0x98, 0x00, 0xF0, 0xD6, 0xFC, 0xAC, 0x48, 0xC1, 0x6A
	.byte 0x01, 0x20, 0x08, 0x40, 0x01, 0x28, 0x0C, 0xD0, 0x13, 0x20, 0x00, 0xF0, 0xF9, 0xFC, 0xA9, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xB1, 0xFC, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x00, 0x24, 0x20, 0x1C, 0x00, 0xF0, 0x7D, 0xFE, 0x0B, 0xA9, 0x32, 0x20, 0x0E, 0x5E
	.byte 0x30, 0x20, 0x0F, 0x5E, 0x9E, 0x4D, 0x68, 0x68, 0x00, 0x28, 0x03, 0xD0, 0xFF, 0xF7, 0x06, 0xFF
	.byte 0x00, 0x20, 0x68, 0x60, 0x9C, 0x48, 0x02, 0xF0, 0x5D, 0xF9, 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42
	.byte 0x09, 0xD1, 0x98, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x8F, 0xFC, 0x00, 0x20
	.byte 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x68, 0x68, 0x00, 0xF0, 0xE4, 0xFD, 0x04, 0x28, 0x09, 0xD1
	.byte 0x90, 0x49, 0x02, 0x98, 0x02, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x80, 0xFC, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x28, 0x12, 0xD0, 0xBC, 0x42, 0x09, 0xDB, 0x89, 0x49, 0x02, 0x98
	.byte 0x01, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x72, 0xFC, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD
	.byte 0x30, 0x1C, 0x02, 0xF0, 0xD3, 0xFA, 0x60, 0x1C, 0x00, 0x04, 0x04, 0x14, 0xC3, 0xE7, 0x01, 0x20
	.byte 0x00, 0xF0, 0x38, 0xFE, 0x1D, 0xA8, 0x00, 0x21, 0x3C, 0x22, 0x01, 0xF0, 0x07, 0xFF, 0x1D, 0xA8
	.byte 0x00, 0xF0, 0xF6, 0xFD, 0x00, 0x28, 0x09, 0xD0, 0x7A, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54
	.byte 0x00, 0xF0, 0x54, 0xFC, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x58, 0x20, 0xFF, 0xF7
	.byte 0xAD, 0xFE, 0x73, 0x49, 0x00, 0x28, 0xC8, 0x60, 0x09, 0xD1, 0x72, 0x49, 0x02, 0x98, 0x0F, 0x22
	.byte 0x42, 0x54, 0x00, 0xF0, 0x43, 0xFC, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x21
	.byte 0x58, 0x22, 0x01, 0xF0, 0xE3, 0xFE, 0x0B, 0xA9, 0x30, 0x20, 0x0D, 0x5E, 0x00, 0x24, 0x00, 0x2D
	.byte 0x21, 0xDD, 0x67, 0x4F, 0xF9, 0x68, 0x1D, 0xA8, 0x02, 0xF0, 0xB0, 0xF9, 0x00, 0x21, 0xC9, 0x43
	.byte 0x88, 0x42, 0x09, 0xD1, 0x63, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x26, 0xFC
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x28, 0x04, 0xD1, 0x0B, 0xD1, 0xF8, 0x68
	.byte 0x00, 0x68, 0x01, 0x28, 0x07, 0xD0, 0x30, 0x1C, 0x02, 0xF0, 0x80, 0xFA, 0x60, 0x1C, 0x00, 0x04
	.byte 0x04, 0x14, 0xAC, 0x42, 0xDE, 0xDB, 0x0B, 0xA8, 0x30, 0x21, 0x40, 0x5E, 0x84, 0x42, 0x09, 0xD1
	.byte 0x02, 0x98, 0x0F, 0x22, 0xE6, 0x31, 0x42, 0x54, 0x00, 0xF0, 0x08, 0xFC, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x51, 0x48, 0xFF, 0x21, 0xC9, 0x43, 0x02, 0x1C, 0x01, 0xF0, 0x50, 0xFE
	.byte 0x00, 0x28, 0x0C, 0xD0, 0x0C, 0x20, 0x00, 0xF0, 0x3B, 0xFC, 0x4A, 0x49, 0x02, 0x98, 0x0F, 0x22
	.byte 0x42, 0x54, 0x00, 0xF0, 0xF3, 0xFB, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0xF0
	.byte 0xED, 0xFB, 0x11, 0x23, 0x02, 0x9A, 0x1B, 0x01, 0x03, 0x20, 0x2C, 0xA9, 0xD2, 0x18, 0x00, 0xF0
	.byte 0xA1, 0xFD, 0x02, 0x20, 0x01, 0x1C, 0x00, 0x22, 0x01, 0xF0, 0xCC, 0xFE, 0x40, 0x49, 0x00, 0x28
	.byte 0x08, 0x60, 0x09, 0xDA, 0x3B, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xD6, 0xFB
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x04, 0x21, 0x00, 0x91, 0x39, 0x49, 0x01, 0x22
	.byte 0x15, 0xAB, 0x01, 0xF0, 0xB5, 0xFE, 0x00, 0x28, 0x0C, 0xDA, 0x0B, 0x20, 0x00, 0xF0, 0x08, 0xFC
	.byte 0x30, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xC0, 0xFB, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x0B, 0xA8, 0x00, 0x21, 0x08, 0x22, 0x01, 0xF0, 0x5F, 0xFE, 0x02, 0x21
	.byte 0x0B, 0xA8, 0x41, 0x70, 0x29, 0x48, 0x01, 0xF0, 0xAB, 0xFE, 0x0C, 0x90, 0x2A, 0x48, 0x01, 0xF0
	.byte 0xBB, 0xFE, 0x0B, 0xA9, 0x48, 0x80, 0x26, 0x48, 0x0B, 0xA9, 0x00, 0x68, 0x08, 0x22, 0x01, 0xF0
	.byte 0x95, 0xFE, 0x00, 0x28, 0x09, 0xDA, 0x1F, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0
	.byte 0x9D, 0xFB, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x19, 0x48, 0x00, 0x21, 0x40, 0x69
	.byte 0x14, 0x22, 0x06, 0x90, 0x18, 0xA8, 0x01, 0xF0, 0x39, 0xFE, 0x18, 0x48, 0xFA, 0x21, 0x1C, 0x90
	.byte 0x64, 0x38, 0x18, 0x90, 0x03, 0x98, 0x89, 0x00, 0x61, 0xF5, 0x84, 0xEE, 0x05, 0x90, 0xFA, 0x21
	.byte 0x03, 0x98, 0x89, 0x00, 0x61, 0xF5, 0x7E, 0xEE, 0xFA, 0x20, 0x80, 0x00, 0x48, 0x43, 0x04, 0x90
	.byte 0x30, 0x21, 0x0B, 0xA8, 0x47, 0x5E, 0x0A, 0x4D, 0x09, 0x98, 0x01, 0x28, 0x04, 0xD1, 0x0F, 0x49
	.byte 0x1C, 0x20, 0x08, 0x56, 0x01, 0x28, 0x00, 0xD1, 0x3C, 0xE1, 0x09, 0x48, 0x18, 0xE0, 0xC0, 0x46
	.byte 0x58, 0xFC, 0x34, 0x02, 0x06, 0x01, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00
	.byte 0x3C, 0x85, 0x35, 0x02, 0x16, 0x01, 0x00, 0x00, 0x40, 0x85, 0x35, 0x02, 0x65, 0x0B, 0xA8, 0xC0
	.byte 0x64, 0x2F, 0x35, 0x02, 0xFF, 0xFF, 0x00, 0x00, 0x90, 0x57, 0x00, 0x00, 0x5C, 0x85, 0x35, 0x02
	.byte 0x00, 0x21, 0x00, 0x68, 0xC9, 0x43, 0x88, 0x42, 0x01, 0xD0, 0x01, 0xF0, 0x45, 0xFE, 0x00, 0x21
	.byte 0xCB, 0x48, 0xC9, 0x43, 0x01, 0x60, 0x01, 0xF0, 0xC7, 0xFD, 0x00, 0x28, 0x09, 0xD0, 0xC9, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x41, 0xFB, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x58, 0x20, 0xFF, 0xF7, 0x9A, 0xFD, 0x68, 0x60, 0x00, 0x28, 0x09, 0xD1, 0xC1, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x31, 0xFB, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x68, 0x68, 0x00, 0x28, 0x03, 0xD0, 0xFF, 0xF7, 0x90, 0xFD, 0x00, 0x20, 0x68, 0x60
	.byte 0xB9, 0x48, 0x01, 0xF0, 0xE7, 0xFF, 0x00, 0x21, 0xC9, 0x43, 0x0A, 0x90, 0x88, 0x42, 0x09, 0xD1
	.byte 0xB4, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x18, 0xFB, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x68, 0x68, 0x00, 0xF0, 0x6D, 0xFC, 0x04, 0x28, 0x09, 0xD1, 0xAD, 0x49
	.byte 0x02, 0x98, 0x02, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x09, 0xFB, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x00, 0x28, 0x12, 0xD0, 0xBC, 0x42, 0x09, 0xDB, 0xA6, 0x49, 0x02, 0x98, 0x01, 0x22
	.byte 0x42, 0x54, 0x00, 0xF0, 0xFB, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x30, 0x1C
	.byte 0x02, 0xF0, 0x5C, 0xF9, 0x60, 0x1C, 0x00, 0x04, 0x04, 0x14, 0xC2, 0xE7, 0x00, 0x20, 0x0A, 0x99
	.byte 0xC0, 0x43, 0x81, 0x42, 0x09, 0xD1, 0x9B, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0
	.byte 0xE5, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x58, 0x20, 0xFF, 0xF7, 0x3E, 0xFD
	.byte 0xE8, 0x60, 0x00, 0x28, 0x09, 0xD1, 0x93, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0
	.byte 0xD5, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x21, 0x58, 0x22, 0x01, 0xF0
	.byte 0x75, 0xFD, 0x00, 0x24, 0x00, 0x2F, 0x20, 0xDD, 0xE9, 0x68, 0x1D, 0xA8, 0x02, 0xF0, 0x46, 0xF8
	.byte 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x09, 0xD1, 0x86, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54
	.byte 0x00, 0xF0, 0xBC, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x28, 0x04, 0xD1
	.byte 0x0B, 0xD1, 0xE8, 0x68, 0x00, 0x68, 0x01, 0x28, 0x07, 0xD0, 0x30, 0x1C, 0x02, 0xF0, 0x16, 0xF9
	.byte 0x60, 0x1C, 0x00, 0x04, 0x04, 0x14, 0xBC, 0x42, 0xDE, 0xDB, 0xBC, 0x42, 0x09, 0xD1, 0x79, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xA1, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x68, 0x6B, 0xA9, 0x6B, 0x00, 0xF0, 0x8D, 0xFA, 0xA9, 0x6B, 0x02, 0x1C, 0x07, 0x90
	.byte 0x01, 0xF0, 0xE6, 0xFC, 0x00, 0x28, 0x0C, 0xD0, 0x0C, 0x20, 0x00, 0xF0, 0xD1, 0xFA, 0x6D, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x89, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x6A, 0x48, 0x01, 0x21, 0x01, 0x77, 0x00, 0xF0, 0x80, 0xFA, 0x02, 0x20, 0x01, 0x1C
	.byte 0x00, 0x22, 0x01, 0xF0, 0x67, 0xFD, 0x62, 0x49, 0x00, 0x28, 0x08, 0x60, 0x09, 0xDA, 0x61, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x71, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x04, 0x21, 0x00, 0x91, 0x5E, 0x49, 0x01, 0x22, 0x15, 0xAB, 0x01, 0xF0, 0x50, 0xFD
	.byte 0x00, 0x28, 0x0C, 0xDA, 0x0B, 0x20, 0x00, 0xF0, 0xA3, 0xFA, 0x56, 0x49, 0x02, 0x98, 0x0F, 0x22
	.byte 0x42, 0x54, 0x00, 0xF0, 0x5B, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x0B, 0xA8
	.byte 0x00, 0x21, 0x08, 0x22, 0x01, 0xF0, 0xFA, 0xFC, 0x02, 0x21, 0x0B, 0xA8, 0x41, 0x70, 0x07, 0x98
	.byte 0x01, 0xF0, 0x46, 0xFD, 0x0C, 0x90, 0x4F, 0x48, 0x01, 0xF0, 0x56, 0xFD, 0x0B, 0xA9, 0x48, 0x80
	.byte 0x47, 0x48, 0x0B, 0xA9, 0x00, 0x68, 0x08, 0x22, 0x01, 0xF0, 0x30, 0xFD, 0x00, 0x28, 0x09, 0xDA
	.byte 0x44, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x38, 0xFA, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x3E, 0x4B, 0x09, 0x98, 0x1B, 0x68, 0x18, 0xA9, 0x2C, 0xAA, 0x01, 0xF0
	.byte 0x73, 0xF8, 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x0F, 0xD1, 0x01, 0x21, 0x09, 0x98, 0x09, 0x03
	.byte 0x40, 0x18, 0x00, 0xF0, 0x65, 0xFA, 0x37, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0
	.byte 0x1D, 0xFA, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x06, 0x98, 0x36, 0x4A, 0x00, 0x21
	.byte 0x01, 0xF0, 0xBC, 0xFC, 0x0F, 0xA8, 0x01, 0xF0, 0x8D, 0xFD, 0x2D, 0x48, 0x0F, 0xA9, 0x00, 0x68
	.byte 0x01, 0xF0, 0x8E, 0xFD, 0x05, 0x98, 0x00, 0x22, 0x0D, 0x90, 0x04, 0x98, 0x0F, 0xA9, 0x0E, 0x90
	.byte 0x0D, 0xA8, 0x00, 0x90, 0x26, 0x48, 0x13, 0x1C, 0x00, 0x68, 0x40, 0x1C, 0x01, 0xF0, 0xB6, 0xFC
	.byte 0x00, 0x28, 0x1F, 0xDC, 0x14, 0x98, 0x0B, 0xA9, 0x42, 0x1C, 0x14, 0x92, 0x2C, 0x20, 0x08, 0x5E
	.byte 0x82, 0x42, 0x12, 0xDD, 0x09, 0x98, 0x00, 0x28, 0x03, 0xD1, 0x0F, 0x20, 0x00, 0xF0, 0x30, 0xFA
	.byte 0x08, 0xE0, 0x01, 0x28, 0x03, 0xD1, 0x10, 0x20, 0x00, 0xF0, 0x2A, 0xFA, 0x02, 0xE0, 0x11, 0x20
	.byte 0x00, 0xF0, 0x26, 0xFA, 0x00, 0x25, 0xED, 0x43, 0x73, 0xE1, 0x2E, 0x20, 0x08, 0x5E, 0x02, 0xF0
	.byte 0x45, 0xF8, 0x61, 0xE6, 0x08, 0x20, 0x11, 0x90, 0x12, 0xA8, 0x00, 0x90, 0x11, 0xA8, 0x01, 0x90
	.byte 0x0F, 0x48, 0x06, 0x99, 0x00, 0x68, 0x15, 0x4A, 0x0C, 0x31, 0x00, 0x23, 0x01, 0xF0, 0x7C, 0xFC
	.byte 0x0B, 0x49, 0x00, 0x04, 0x0A, 0x68, 0x06, 0x99, 0x00, 0x0C, 0x0A, 0x60, 0x01, 0xF0, 0xF4, 0xFC
	.byte 0x06, 0x99, 0x14, 0xAA, 0x48, 0x60, 0x06, 0x48, 0x2C, 0xAB, 0x00, 0x68, 0x00, 0x90, 0x09, 0x98
	.byte 0x00, 0xF0, 0xA6, 0xFB, 0x08, 0x90, 0x64, 0x28, 0x12, 0xD1, 0x00, 0x25, 0x49, 0xE1, 0xC0, 0x46
	.byte 0x64, 0x2F, 0x35, 0x02, 0x16, 0x01, 0x00, 0x00, 0x40, 0x85, 0x35, 0x02, 0x5C, 0x85, 0x35, 0x02
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x90, 0x57, 0x00, 0x00, 0xF8, 0x05, 0x00, 0x00, 0xDC, 0x05, 0x00, 0x00
	.byte 0x00, 0x25, 0xED, 0x43, 0xA8, 0x42, 0x00, 0xD1, 0x33, 0xE1, 0x09, 0x99, 0x81, 0x42, 0x00, 0xD1
	.byte 0x10, 0xE1, 0x02, 0x28, 0x00, 0xD0, 0x0A, 0xE1, 0xC0, 0x48, 0x00, 0x68, 0xA8, 0x42, 0x01, 0xD0
	.byte 0x01, 0xF0, 0x8A, 0xFC, 0x00, 0x21, 0xBD, 0x48, 0xC9, 0x43, 0x01, 0x60, 0x01, 0xF0, 0x0C, 0xFC
	.byte 0x00, 0x28, 0x09, 0xD0, 0xBA, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x86, 0xF9
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x04, 0x20, 0x00, 0x24, 0x00, 0xF0, 0x52, 0xFB
	.byte 0x0B, 0xA9, 0x30, 0x20, 0x0F, 0x5E, 0xB3, 0x4D, 0x68, 0x68, 0x00, 0x28, 0x03, 0xD0, 0xFF, 0xF7
	.byte 0xDD, 0xFB, 0x00, 0x20, 0x68, 0x60, 0xB0, 0x48, 0x01, 0xF0, 0x34, 0xFE, 0x00, 0x21, 0xC9, 0x43
	.byte 0x88, 0x42, 0x09, 0xD1, 0xAA, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x66, 0xF9
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x68, 0x68, 0x00, 0xF0, 0xBB, 0xFA, 0x04, 0x28
	.byte 0x09, 0xD1, 0xA3, 0x49, 0x02, 0x98, 0x02, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x57, 0xF9, 0x00, 0x20
	.byte 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x28, 0x12, 0xD0, 0xBC, 0x42, 0x09, 0xDB, 0x9C, 0x49
	.byte 0x02, 0x98, 0x01, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x49, 0xF9, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x30, 0x1C, 0x01, 0xF0, 0xAA, 0xFF, 0x60, 0x1C, 0x00, 0x04, 0x04, 0x14, 0xC3, 0xE7
	.byte 0x58, 0x20, 0xFF, 0xF7, 0x9B, 0xFB, 0x93, 0x49, 0x00, 0x28, 0xC8, 0x60, 0x09, 0xD1, 0x90, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x31, 0xF9, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x00, 0x21, 0x58, 0x22, 0x01, 0xF0, 0xD1, 0xFB, 0x0B, 0xA9, 0x30, 0x20, 0x0D, 0x5E
	.byte 0x00, 0x24, 0x00, 0x2D, 0x21, 0xDD, 0x87, 0x4F, 0xF9, 0x68, 0x1D, 0xA8, 0x01, 0xF0, 0x9E, 0xFE
	.byte 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x09, 0xD1, 0x81, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54
	.byte 0x00, 0xF0, 0x14, 0xF9, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x28, 0x04, 0xD1
	.byte 0x0B, 0xD1, 0xF8, 0x68, 0x00, 0x68, 0x01, 0x28, 0x07, 0xD0, 0x30, 0x1C, 0x01, 0xF0, 0x6E, 0xFF
	.byte 0x60, 0x1C, 0x00, 0x04, 0x04, 0x14, 0xAC, 0x42, 0xDE, 0xDB, 0x0B, 0xA8, 0x30, 0x21, 0x40, 0x5E
	.byte 0x84, 0x42, 0x09, 0xD1, 0x02, 0x98, 0x0F, 0x22, 0xE6, 0x31, 0x42, 0x54, 0x00, 0xF0, 0xF6, 0xF8
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x6E, 0x49, 0x07, 0x98, 0x89, 0x6B, 0x02, 0x1C
	.byte 0x01, 0xF0, 0x3E, 0xFB, 0x00, 0x28, 0x0C, 0xD0, 0x0C, 0x20, 0x00, 0xF0, 0x29, 0xF9, 0x68, 0x49
	.byte 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xE1, 0xF8, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x00, 0xF0, 0xDB, 0xF8, 0x02, 0x20, 0x01, 0x1C, 0x00, 0x22, 0x01, 0xF0, 0xC2, 0xFB
	.byte 0x5E, 0x49, 0x00, 0x28, 0x08, 0x60, 0x09, 0xDA, 0x5D, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54
	.byte 0x00, 0xF0, 0xCC, 0xF8, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x04, 0x21, 0x00, 0x91
	.byte 0x5A, 0x49, 0x01, 0x22, 0x15, 0xAB, 0x01, 0xF0, 0xAB, 0xFB, 0x00, 0x28, 0x0C, 0xDA, 0x0B, 0x20
	.byte 0x00, 0xF0, 0xFE, 0xF8, 0x52, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0xB6, 0xF8
	.byte 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x0B, 0xA8, 0x00, 0x21, 0x08, 0x22, 0x01, 0xF0
	.byte 0x55, 0xFB, 0x02, 0x21, 0x0B, 0xA8, 0x41, 0x70, 0x07, 0x98, 0x01, 0xF0, 0xA1, 0xFB, 0x0C, 0x90
	.byte 0x4B, 0x48, 0x01, 0xF0, 0xB1, 0xFB, 0x0B, 0xA9

	arm_func_start ov02_0232E768
ov02_0232E768: @ 0x0232E768
	stmdami r4, {r3, r6, pc} ^
	stmdavs r0, {r0, r1, r3, r8, fp, sp, pc}
	arm_func_end ov02_0232E768
_0232E770:
	.byte 0x08, 0x22, 0x01, 0xF0, 0x8B, 0xFB, 0x00, 0x28, 0x09, 0xDA, 0x41, 0x49, 0x02, 0x98, 0x0F, 0x22
	.byte 0x42, 0x54, 0x00, 0xF0, 0x93, 0xF8, 0x00, 0x20, 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x08, 0x98
	.byte 0x09, 0x90, 0xF2, 0xE4, 0x09, 0x90, 0x0B, 0xA9, 0x2C, 0x20, 0x08, 0x5E, 0x14, 0x9A, 0x82, 0x42
	.byte 0x12, 0xDD, 0x08, 0x98, 0x00, 0x28, 0x03, 0xD1, 0x0F, 0x20, 0x00, 0xF0, 0xC1, 0xF8, 0x08, 0xE0
	.byte 0x01, 0x28, 0x03, 0xD1, 0x10, 0x20, 0x00, 0xF0, 0xBB, 0xF8, 0x02, 0xE0, 0x11, 0x20, 0x00, 0xF0

	arm_func_start ov02_0232E7C0
ov02_0232E7C0: @ 0x0232E7C0
	strhs pc, [r0, #-0x8b7]
	and r4, r4, sp, ror #7
	.word 0x5E08202E
	.word 0xFED6F001
	stmdami sl!, {r0, r1, r4, r6, r7, sl, sp, lr, pc}
	stmdavs r0, {r8, sp}
	addmi r4, r8, #0x24000003
	arm_func_end ov02_0232E7C0
_0232E7DC:
	.byte 0x01, 0xD0, 0x01, 0xF0
	.byte 0x5B, 0xFB, 0x00, 0x21, 0x25, 0x48, 0xC9, 0x43

	arm_func_start ov02_0232E7E8
ov02_0232E7E8: @ 0x0232E7E8
	arm_func_end ov02_0232E7E8
_0232E7E8:
	.byte 0x01, 0x60, 0x01, 0xF0, 0xDD, 0xFA, 0x00, 0x28
	.byte 0x09, 0xD0, 0x23, 0x49, 0x02, 0x98, 0x0F, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x57, 0xF8, 0x00, 0x20
	.byte 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x2D, 0x25, 0xD0, 0x00, 0xF0, 0x97, 0xF8, 0x0F, 0x38
	.byte 0x06, 0x28, 0x16, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14, 0x87, 0x44
	.byte 0x0C, 0x00, 0x10, 0x00, 0x14, 0x00, 0x20, 0x00, 0x20, 0x00, 0x18, 0x00, 0x1C, 0x00, 0x03, 0x22
	.byte 0x08, 0xE0, 0x04, 0x22, 0x06, 0xE0, 0x05, 0x22, 0x04, 0xE0, 0x07, 0x22, 0x02, 0xE0, 0x08, 0x22
	.byte 0x00, 0xE0, 0x0F, 0x22, 0x0E, 0x49, 0x02, 0x98, 0x42, 0x54, 0x00, 0xF0, 0x2F, 0xF8, 0x00, 0x20
	.byte 0x32, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x02, 0x98, 0x00, 0xF0, 0x76, 0xF8, 0x00, 0x28, 0x09, 0xD0
	.byte 0x07, 0x49, 0x02, 0x98, 0x06, 0x22, 0x42, 0x54, 0x00, 0xF0, 0x20, 0xF8, 0x00, 0x20, 0x32, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x20, 0x32, 0xB0, 0xF8, 0xBD, 0xC0, 0x46, 0x64, 0x2F, 0x35, 0x02
	.byte 0x16, 0x01, 0x00, 0x00, 0x3C, 0x85, 0x35, 0x02, 0x40, 0x85, 0x35, 0x02, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x90, 0x57, 0x00, 0x00

	arm_func_start ov02_0232E894
ov02_0232E894: @ 0x0232E894
	andmi r1, sl, r2, lsl #24
	andmi r4, r8, sb, asr #7
	tstmi r0, #64, #24
	addmi r4, r8, #0x44000000
	andhs sp, r1, r1, lsl #6
	arm_func_end ov02_0232E894
_0232E8A8:
	.byte 0x10, 0x43, 0x70, 0x47

	arm_func_start ov02_0232E8AC
ov02_0232E8AC: @ 0x0232E8AC
	stmdami sb, {r3, r8, sl, ip, sp, pc}
	stmdahs r0, {r6, r7, fp, sp, lr}
	arm_func_end ov02_0232E8AC
_0232E8B4:
	.byte 0x04, 0xD0, 0xFF, 0xF7, 0x61, 0xFA, 0x06, 0x48, 0x00, 0x21, 0xC1, 0x60
	.byte 0x04, 0x48, 0x40, 0x68, 0x00, 0x28, 0x04, 0xD0, 0xFF, 0xF7, 0x58, 0xFA, 0x01, 0x48, 0x00, 0x21
	.byte 0x41, 0x60, 0x08, 0xBD, 0x3C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232E8D8
ov02_0232E8D8: @ 0x0232E8D8
	arm_func_end ov02_0232E8D8
_0232E8D8:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x0F, 0x48, 0x00, 0x21
	.byte 0x08, 0x22, 0x01, 0xF0, 0x8B, 0xFA, 0x0E, 0x48, 0x01, 0x21, 0x01, 0x61, 0x0D, 0x48, 0x00, 0x21
	.byte 0x1C, 0x22, 0x01, 0xF0, 0x83, 0xFA, 0x0A, 0x49, 0xA0, 0x1D, 0x48, 0x62, 0xA0, 0x88, 0x00, 0x23
	.byte 0x88, 0x62, 0x22, 0x88, 0x0F, 0x20, 0x10, 0x40, 0xC8, 0x62, 0xA2, 0x78, 0x06, 0x48, 0x42, 0x77
	.byte 0x06, 0x4A, 0x0B, 0x63, 0x4A, 0x63, 0x03, 0x77, 0x10, 0xBD, 0xC0, 0x46, 0x9C, 0x92, 0x35, 0x02
	.byte 0x3C, 0x85, 0x35, 0x02, 0x60, 0x85, 0x35, 0x02, 0x5C, 0x85, 0x35, 0x02, 0x01, 0x0B, 0xA8, 0xC0

	arm_func_start ov02_0232E930
ov02_0232E930: @ 0x0232E930
	arm_func_end ov02_0232E930
_0232E930:
	.byte 0x01, 0x49, 0x08, 0x61, 0x70, 0x47, 0xC0, 0x46, 0x3C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232E93C
ov02_0232E93C: @ 0x0232E93C
	stmdbvs r0, {r0, fp, lr}
	uxtab16mi r4, r0, r0, ror #8
	eorseq r8, r5, #60, #10
	strdlt fp, ip, [r2], r8
	ldmdami r4!, {r0, r1, r2, sl, fp, ip} ^
	andls r4, r1, r4, ror sl
	ldmne ip!, {r2, r4, r5, r6, fp, lr}
	ldclmi p14, c4, [r5, #-0x1d0]!
	mrsle sb, apsr
	andlt r2, r2, r0
	ldcllt p3, c4, [r8, #0x300]!
	eorslo r4, sp, #0x1c8000
	blvs FUN_02589494
	eorshi r4, r8, r8
	arm_func_end ov02_0232E93C
_0232E974:
	.byte 0x20, 0x1C, 0x00, 0x21, 0x01, 0xF0, 0x40, 0xFA, 0x39, 0x88, 0x01, 0x20
	.byte 0x08, 0x42, 0x30, 0xD0, 0x31, 0x1C, 0x72, 0x68, 0x20, 0x1C, 0x30, 0x31, 0x01, 0xF0, 0x2E, 0xFA
	.byte 0x31, 0x1C, 0x72, 0x68, 0xA0, 0x1D, 0x70, 0x31, 0x01, 0xF0, 0x28, 0xFA, 0x20, 0x1C, 0x31, 0x1C
	.byte 0x72, 0x68, 0x0C, 0x30, 0xB0, 0x31, 0x01, 0xF0, 0x21, 0xFA, 0x20, 0x1C, 0x31, 0x1C, 0x72, 0x68
	.byte 0x12, 0x30, 0xF0, 0x31, 0x01, 0xF0, 0x1A, 0xFA, 0x30, 0x1C, 0x08, 0x30, 0x01, 0xF0, 0xB0, 0xFA
	.byte 0x01, 0x1C, 0x30, 0x1C, 0x08, 0x30, 0x00, 0xF0, 0xBB, 0xF8, 0x00, 0x28, 0x00, 0xD0, 0x9D, 0xE0
	.byte 0x30, 0x1C, 0x08, 0x30, 0x01, 0xF0, 0xA4, 0xFA, 0x02, 0x1C, 0x20, 0x1C, 0x08, 0x36, 0x18, 0x30
	.byte 0x31, 0x1C, 0x01, 0xF0, 0x03, 0xFA, 0x39, 0x88, 0x02, 0x20, 0x08, 0x42, 0x31, 0xD0, 0x20, 0x1C
	.byte 0x29, 0x1C, 0x6A, 0x68, 0x39, 0x30, 0x30, 0x31, 0x01, 0xF0, 0xF8, 0xF9, 0x20, 0x1C, 0x29, 0x1C
	.byte 0x6A, 0x68, 0x47, 0x30, 0x70, 0x31, 0x01, 0xF0, 0xF1, 0xF9, 0x20, 0x1C, 0x29, 0x1C, 0x6A, 0x68
	.byte 0x55, 0x30, 0xB0, 0x31, 0x01, 0xF0, 0xEA, 0xF9, 0x20, 0x1C, 0x29, 0x1C, 0x6A, 0x68, 0x63, 0x30
	.byte 0xF0, 0x31, 0x01, 0xF0, 0xE3, 0xF9, 0x28, 0x1C, 0x08, 0x30, 0x01, 0xF0, 0x79, 0xFA, 0x01, 0x1C

	arm_func_start ov02_0232EA30
ov02_0232EA30: @ 0x0232EA30
	andlo r1, r8, r8, lsr #24
	arm_func_end ov02_0232EA30
_0232EA34:
	.byte 0x00, 0xF0, 0x84, 0xF8, 0x00, 0x28, 0x67, 0xD1, 0x28, 0x1C, 0x08, 0x30
	.byte 0x01, 0xF0, 0x6E, 0xFA, 0x02, 0x1C, 0x20, 0x1C, 0x08, 0x35, 0x71, 0x30, 0x29, 0x1C, 0x01, 0xF0
	.byte 0xCD, 0xF9, 0x39, 0x88, 0x04, 0x20, 0x08, 0x42, 0x27, 0xD0, 0x01, 0x99, 0x01, 0x98, 0x49, 0x68
	.byte 0x30, 0x30, 0x49, 0x1E, 0x00, 0xF0, 0x6C, 0xF8, 0x00, 0x28, 0x4F, 0xD1, 0x01, 0x9A, 0x01, 0x99
	.byte 0x20, 0x1C, 0x52, 0x68, 0x92, 0x30, 0x30, 0x31, 0x01, 0xF0, 0xB8, 0xF9, 0x01, 0x98, 0x08, 0x30
	.byte 0x01, 0xF0, 0x4E, 0xFA, 0x01, 0x1C, 0x01, 0x98, 0x08, 0x30, 0x00, 0xF0, 0x59, 0xF8, 0x00, 0x28
	.byte 0x3C, 0xD1, 0x01, 0x98, 0x08, 0x30, 0x01, 0xF0, 0x43, 0xFA, 0x01, 0x99, 0x02, 0x1C, 0x20, 0x1C
	.byte 0x08, 0x31, 0xD2, 0x30, 0x01, 0x91, 0x01, 0xF0, 0xA1, 0xF9, 0x39, 0x88, 0x08, 0x20, 0x08, 0x42
	.byte 0x27, 0xD0, 0x00, 0x99, 0x00, 0x98, 0x49, 0x68, 0x30, 0x30, 0x49, 0x1E, 0x00, 0xF0, 0x40, 0xF8
	.byte 0x00, 0x28, 0x23, 0xD1, 0x00, 0x9A, 0x00, 0x99, 0x20, 0x1C, 0x52, 0x68, 0xF3, 0x30, 0x30, 0x31
	.byte 0x01, 0xF0, 0x8C, 0xF9, 0x00, 0x98, 0x08, 0x30, 0x01, 0xF0, 0x22, 0xFA, 0x01, 0x1C, 0x00, 0x98
	.byte 0x08, 0x30, 0x00, 0xF0, 0x2D, 0xF8, 0x00, 0x28, 0x10, 0xD1, 0x00, 0x98, 0x08, 0x30, 0x01, 0xF0
	.byte 0x17, 0xFA, 0x02, 0x1C, 0x10, 0x48, 0x00, 0x99, 0x20, 0x18, 0x08, 0x31, 0x00, 0x91, 0x01, 0xF0
	.byte 0x75, 0xF9, 0x0E, 0x49, 0x00, 0x20, 0x02, 0xB0, 0x78, 0x54, 0xF8, 0xBD, 0x55, 0x22, 0x20, 0x1C
	.byte 0x00, 0x21, 0x92, 0x00, 0x01, 0xF0, 0x72, 0xF9, 0x00, 0x20, 0xC0, 0x43, 0x02, 0xB0, 0xF8, 0xBD
	.byte 0x64, 0x8E, 0x35, 0x02, 0x17, 0x01, 0x00, 0x00, 0xD4, 0x8E, 0x35, 0x02, 0x04, 0x8C, 0x35, 0x02
	.byte 0x34, 0x8D, 0x35, 0x02, 0x3C, 0x85, 0x35, 0x02, 0x33, 0x01, 0x00, 0x00, 0x16, 0x01, 0x00, 0x00
	.byte 0x00, 0x23, 0x00, 0x29, 0x0B, 0xDD, 0x02, 0x78, 0x40, 0x1C, 0x20, 0x2A, 0x01, 0xD3, 0x7F, 0x2A
	.byte 0x02, 0xD9, 0x00, 0x20, 0xC0, 0x43, 0x70, 0x47, 0x5B, 0x1C, 0x8B, 0x42, 0xF3, 0xDB, 0x00, 0x20
	.byte 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_0232EB64
ov02_0232EB64: @ 0x0232EB64
	strdlt fp, ip, [r2], r8
	stmdavs r8!, {r0, r2, sl, fp, ip}
	strls r2, [r1], #-0x400
	stmdahs r0, {ip, pc}
	andlt sp, r2, r2, lsl #2
	ldcllt p0, c2, [r8, #0x14]!
	stmdble r1, {r6, fp, sp}
	andls r2, r0, r0, asr #32
	strhs sb, [r0, -r0, lsl #16]
	ldcle p8, c2, [ip, #-0]
	strlo r1, [r8], -lr, lsr #24
	andhs r6, r1, sb, ror #26
	andsle r4, r0, r8, lsl #4
	arm_func_end ov02_0232EB64
_0232EB98:
	.byte 0x10, 0x48, 0x01, 0xF0, 0xC1, 0xF9, 0x69, 0x68
	.byte 0x81, 0x42, 0x0A, 0xD1, 0x0D, 0x48, 0x01, 0xF0, 0xBB, 0xF9, 0x02, 0x1C, 0x0B, 0x49, 0x30, 0x1C
	.byte 0x01, 0xF0, 0x0C, 0xF9, 0x00, 0x28, 0x00, 0xD1, 0x64, 0x1C, 0x00, 0x98, 0x7F, 0x1C, 0x54, 0x35
	.byte 0x54, 0x36, 0x87, 0x42, 0xE4, 0xDB, 0x01, 0x2C, 0x01, 0xDD, 0x04, 0x20, 0x01, 0x90, 0x00, 0x2C
	.byte 0x01, 0xD1, 0x05, 0x20, 0x01, 0x90, 0x01, 0x98, 0x02, 0xB0, 0xF8, 0xBD, 0xC4, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232EBE0
ov02_0232EBE0: @ 0x0232EBE0
	arm_func_end ov02_0232EBE0
_0232EBE0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x0D, 0x48, 0x01, 0xF0, 0x9B, 0xF9, 0x20, 0x60, 0x0B, 0x49, 0x22, 0x68
	.byte 0x20, 0x1D, 0x01, 0xF0, 0xFB, 0xF8, 0x01, 0x20, 0x60, 0x62, 0x09, 0x48, 0x01, 0xF0, 0x90, 0xF9
	.byte 0x02, 0x1C, 0xA0, 0x62, 0x0D, 0x2A, 0x02, 0xD9, 0x00, 0x20, 0xC0, 0x43, 0x10, 0xBD, 0x2C, 0x34
	.byte 0x03, 0x49, 0x20, 0x1C, 0x01, 0xF0, 0xEA, 0xF8, 0x00, 0x20, 0x10, 0xBD, 0xC4, 0x2F, 0x35, 0x02
	.byte 0xD0, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232EC24
ov02_0232EC24: @ 0x0232EC24
	arm_func_end ov02_0232EC24
_0232EC24:
	.byte 0xF8, 0xB5, 0x06, 0x1C, 0x0D, 0x1C, 0x17, 0x1C, 0x00, 0x24, 0x00, 0x2E

	arm_func_start ov02_0232EC30
ov02_0232EC30: @ 0x0232EC30
	stcne p13, c13, [r8], #-0x3c
	andhs r1, r6, #0x3900
	arm_func_end ov02_0232EC30
_0232EC38:
	.byte 0x01, 0xF0, 0xD8, 0xF8, 0x01, 0xF0, 0x7A, 0xF9
	.byte 0xE8, 0x80, 0xE8, 0x88, 0x01, 0xF0, 0x40, 0xF9, 0xE8, 0x80, 0x64, 0x1C, 0x08, 0x35, 0xB4, 0x42
	.byte 0xEF, 0xDB, 0xF8, 0xBD

	arm_func_start ov02_0232EC54
ov02_0232EC54: @ 0x0232EC54
	arm_func_end ov02_0232EC54
_0232EC54:
	.byte 0x08, 0xB5, 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x03, 0xD1, 0x07, 0x49
	.byte 0x48, 0x60, 0x00, 0x20, 0x08, 0xBD, 0x05, 0x49, 0x4A, 0x68, 0x82, 0x42, 0x03, 0xD0, 0x48, 0x60
	.byte 0x01, 0xF0, 0x88, 0xFC, 0x08, 0xBD, 0x00, 0x20, 0x08, 0xBD, 0xC0, 0x46, 0x64, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232EC80
ov02_0232EC80: @ 0x0232EC80
	arm_func_end ov02_0232EC80
_0232EC80:
	.byte 0xF8, 0xB5, 0x0E, 0x1C, 0x05, 0x1C, 0xB0, 0x89, 0x37, 0x1C, 0x14, 0x1C, 0x00, 0x93, 0x0C, 0x37
	.byte 0x01, 0xF0, 0x3A, 0xF9, 0x01, 0x28, 0x04, 0xD2, 0x20, 0x68, 0x40, 0x1C, 0x20, 0x60, 0x28, 0x1C
	.byte 0xF8, 0xBD, 0xF8, 0x7B, 0x11, 0x28, 0x04, 0xD0, 0x20, 0x68, 0x40, 0x1C, 0x20, 0x60, 0x28, 0x1C
	.byte 0xF8, 0xBD, 0x30, 0x1C, 0x0C, 0x30, 0x00, 0xF0, 0x5F, 0xF9, 0x00, 0x28, 0x04, 0xDD, 0x20, 0x68
	.byte 0x40, 0x1C, 0x20, 0x60, 0x28, 0x1C, 0xF8, 0xBD, 0xF8, 0x88, 0x01, 0xF0, 0x1D, 0xF9, 0x11, 0x49
	.byte 0x88, 0x42, 0x06, 0xD0, 0x10, 0x49, 0x88, 0x42, 0x0B, 0xD0, 0x10, 0x49, 0x88, 0x42, 0x10, 0xD0
	.byte 0x16, 0xE0, 0x00, 0x9B, 0x28, 0x1C, 0x31, 0x1C, 0x22, 0x1C, 0x00, 0xF0, 0x19, 0xF8, 0x05, 0x1C
	.byte 0x0E, 0xE0, 0x00, 0x9B, 0x28, 0x1C, 0x31, 0x1C, 0x22, 0x1C, 0x00, 0xF0, 0x7F, 0xF8, 0x05, 0x1C
	.byte 0x06, 0xE0, 0x00, 0x9B, 0x28, 0x1C, 0x31, 0x1C, 0x22, 0x1C, 0x00, 0xF0, 0xE3, 0xF8, 0x05, 0x1C
	.byte 0x28, 0x1C, 0xF8, 0xBD, 0x10, 0x10, 0x00, 0x00, 0x10, 0x20, 0x00, 0x00, 0x10, 0x30, 0x00, 0x00

	arm_func_start ov02_0232ED20
ov02_0232ED20: @ 0x0232ED20
	arm_func_end ov02_0232ED20
_0232ED20:
	.byte 0xF8, 0xB5, 0x06, 0x1C, 0x15, 0x1C, 0x00, 0x2E, 0x03, 0xD0, 0x29, 0x68, 0x49, 0x1C, 0x29, 0x60
	.byte 0xF8, 0xBD, 0x0F, 0x1C, 0x0C, 0x37, 0x0C, 0x1C, 0x39, 0x1C, 0x18, 0x1C, 0x10, 0x31, 0x24, 0x34
	.byte 0x00, 0xF0, 0xB6, 0xF9, 0x00, 0x28, 0x04, 0xDA, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C
	.byte 0xF8, 0xBD, 0x60, 0x88, 0x01, 0xF0, 0xD8, 0xF8, 0x00, 0x28, 0x04, 0xD1

	arm_func_start ov02_0232ED5C
ov02_0232ED5C: @ 0x0232ED5C
	mcrrne p8, #2, r6, r0, c8
	ldcne p0, c6, [r0], #-0xa0
	stmdavc r0!, {r3, r4, r5, r6, r7, r8, sl, fp, ip, sp, pc}
	tstle fp, r7, lsl #16
	arm_func_end ov02_0232ED5C
_0232ED6C:
	.byte 0x60, 0x68, 0x01, 0xF0
	.byte 0xB7, 0xF8, 0x01, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x03, 0xD1, 0x14, 0x20, 0xFF, 0xF7, 0xD8, 0xFD
	.byte 0x0D, 0xE0, 0x60, 0x68

	arm_func_start ov02_0232ED84
ov02_0232ED84: @ 0x0232ED84
	arm_func_end ov02_0232ED84
_0232ED84:
	.byte 0x01, 0xF0, 0xAC, 0xF8, 0x02, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x03, 0xD1
	.byte 0x15, 0x20, 0xFF, 0xF7, 0xCD, 0xFD, 0x02, 0xE0, 0x18, 0x20, 0xFF, 0xF7, 0xC9, 0xFD, 0x00, 0x20
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x01, 0x28, 0x04, 0xD0, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C
	.byte 0xF8, 0xBD, 0x10, 0x49, 0x20, 0x1D, 0x00, 0xF0, 0xA1, 0xF9, 0x00, 0x28, 0x0E, 0xDA, 0x01, 0x21
	.byte 0xC9, 0x43, 0x88, 0x42, 0x05, 0xD1, 0x16, 0x20, 0xFF, 0xF7, 0xB2, 0xFD, 0x00, 0x20, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C, 0xF8, 0xBD, 0xB8, 0x89, 0x01, 0xF0
	.byte 0x93, 0xF8, 0x00, 0xF0, 0xA1, 0xFB, 0x04, 0x49, 0x08, 0x60, 0x00, 0x20, 0x28, 0x60, 0x01, 0x20
	.byte 0xF8, 0xBD, 0xC0, 0x46, 0x7C, 0x85, 0x35, 0x02, 0x3C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232EDFC
ov02_0232EDFC: @ 0x0232EDFC
	arm_func_end ov02_0232EDFC
_0232EDFC:
	.byte 0xF8, 0xB5, 0x06, 0x1C
	.byte 0x15, 0x1C, 0x01, 0x2E, 0x03, 0xD0, 0x29, 0x68, 0x49, 0x1C, 0x29, 0x60, 0xF8, 0xBD, 0x0F, 0x1C
	.byte 0x0C, 0x37, 0x0C, 0x1C, 0x08, 0x33, 0x39, 0x1C, 0x18, 0x1C, 0x10, 0x31, 0x24, 0x34, 0x00, 0xF0
	.byte 0x47, 0xF9, 0x00, 0x28, 0x04, 0xDA, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C, 0xF8, 0xBD
	.byte 0x60, 0x88, 0x01, 0xF0, 0x69, 0xF8, 0x00, 0x28, 0x04, 0xD1, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60
	.byte 0x30, 0x1C, 0xF8, 0xBD, 0x20, 0x78, 0x07, 0x28, 0x1B, 0xD1, 0x60, 0x68, 0x01, 0xF0, 0x48, 0xF8
	.byte 0x01, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x03, 0xD1, 0x14, 0x20, 0xFF, 0xF7, 0x69, 0xFD, 0x0D, 0xE0
	.byte 0x60, 0x68, 0x01, 0xF0, 0x3D, 0xF8, 0x02, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x03, 0xD1, 0x15, 0x20
	.byte 0xFF, 0xF7, 0x5E, 0xFD, 0x02, 0xE0, 0x18, 0x20, 0xFF, 0xF7, 0x5A, 0xFD, 0x00, 0x20, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x6A, 0x22, 0x10, 0x48, 0x00, 0x21, 0x12, 0x01, 0x00, 0xF0, 0xB7, 0xFF, 0x78, 0x89
	.byte 0x01, 0xF0, 0x3A, 0xF8, 0x02, 0x1C, 0x0D, 0x48, 0x0B, 0x4B, 0x00, 0x90, 0x00, 0x20, 0x21, 0x1C
	.byte 0x00, 0xF0, 0xBA, 0xFA, 0x00, 0x28, 0x04, 0xDA, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C
	.byte 0xF8, 0xBD, 0x07, 0x48, 0x01, 0x6B, 0xC0, 0x6A, 0x08, 0x42, 0x01, 0xD1, 0x30, 0x1C, 0xF8, 0xBD
	.byte 0x00, 0x20, 0x28, 0x60, 0x02, 0x20, 0xF8, 0xBD, 0xFC, 0x8B, 0x35, 0x02, 0x7C, 0x85, 0x35, 0x02
	.byte 0x3C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232EED4
ov02_0232EED4: @ 0x0232EED4
	arm_func_end ov02_0232EED4
_0232EED4:
	.byte 0x70, 0xB5, 0x06, 0x1C, 0x15, 0x1C, 0x02, 0x2E, 0x03, 0xD0, 0x29, 0x68
	.byte 0x49, 0x1C, 0x29, 0x60, 0x70, 0xBD, 0x0C, 0x1C, 0x10, 0x33, 0x0C, 0x31, 0x18, 0x1C, 0x10, 0x31
	.byte 0x24, 0x34, 0x00, 0xF0, 0xDD, 0xF8, 0x00, 0x28, 0x04, 0xDA, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60
	.byte 0x30, 0x1C, 0x70, 0xBD, 0x20, 0x78, 0x07, 0x28, 0x04, 0xD0, 0x28, 0x68, 0x40, 0x1C, 0x28, 0x60
	.byte 0x30, 0x1C, 0x70, 0xBD, 0x60, 0x88, 0x00, 0xF0, 0xF7, 0xFF, 0x00, 0x28, 0x04, 0xD1, 0x28, 0x68
	.byte 0x40, 0x1C, 0x28, 0x60, 0x30, 0x1C, 0x70, 0xBD, 0x60, 0x68, 0x00, 0xF0, 0xD9, 0xFF, 0x00, 0x28
	.byte 0x01, 0xD1, 0x64, 0x20, 0x70, 0xBD, 0x60, 0x68, 0x00, 0xF0, 0xD2, 0xFF, 0x01, 0x21, 0xC9, 0x43
	.byte 0x88, 0x42, 0x05, 0xD1, 0x14, 0x20, 0xFF, 0xF7, 0xF3, 0xFC, 0x00, 0x20, 0xC0, 0x43, 0x70, 0xBD
	.byte 0x60, 0x68, 0x00, 0xF0, 0xC5, 0xFF, 0x02, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x05, 0xD1, 0x15, 0x20
	.byte 0xFF, 0xF7, 0xE6, 0xFC, 0x00, 0x20, 0xC0, 0x43, 0x70, 0xBD, 0x18, 0x20, 0xFF, 0xF7, 0xE0, 0xFC
	.byte 0x00, 0x20, 0xC0, 0x43, 0x70, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232EF78
ov02_0232EF78: @ 0x0232EF78
	strdlt fp, ip, [r5], r0
	stcne p12, c1, [sb], #-0x14
	stmdage r3, {r2, r3, r5, sl, fp, ip}
	andhs r3, r8, #16, #2
	arm_func_end ov02_0232EF78
_0232EF88:
	.byte 0x18, 0x34, 0x00, 0xF0, 0x2F, 0xFF, 0x35, 0x48
	.byte 0x00, 0xF0, 0xC6, 0xFF, 0x03, 0x1C, 0x33, 0x4A, 0x03, 0xA8, 0x08, 0x21, 0x00, 0xF0, 0x42, 0xFE
	.byte 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x06, 0xD1, 0x02, 0x20, 0xFF, 0xF7, 0xC1, 0xFC, 0x63, 0x20
	.byte 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD, 0xE8, 0x88, 0x00, 0xF0, 0xA6, 0xFF, 0x03, 0xA9, 0x00, 0xF0
	.byte 0x55, 0xF8, 0x00, 0x28, 0x4B, 0xD1, 0xE8, 0x88, 0x00, 0xF0, 0x9E, 0xFF, 0x01, 0x21, 0x09, 0x03
	.byte 0x88, 0x42, 0x04, 0xD1, 0x24, 0x48, 0x03, 0xA9, 0x08, 0x22, 0x00, 0xF0, 0x07, 0xFF, 0xA8, 0x89
	.byte 0x00, 0xF0, 0x92, 0xFF, 0x0F, 0x21, 0x08, 0x42, 0x02, 0xD1, 0x05, 0xB0, 0x00, 0x20, 0xF0, 0xBD
	.byte 0x20, 0x88, 0x00, 0xF0, 0x89, 0xFF, 0x06, 0x1C, 0xFE, 0xF7, 0xB8, 0xFE, 0x07, 0x1C, 0x05, 0xD1
	.byte 0x02, 0x20, 0xFF, 0xF7, 0x95, 0xFC, 0x05, 0xB0, 0x64, 0x20, 0xF0, 0xBD, 0xA0, 0x1C, 0x00, 0x90
	.byte 0x15, 0x48, 0x39, 0x1C, 0x01, 0x90, 0x08, 0x20, 0x02, 0x90, 0xAB, 0x7B, 0x20, 0x1D, 0x32, 0x1C
	.byte 0x00, 0xF0, 0x08, 0xFD, 0x00, 0x28, 0x0C, 0xDA, 0x38, 0x1C, 0xFE, 0xF7, 0xA7, 0xFE, 0xFF, 0xF7
	.byte 0x85, 0xFC, 0x02, 0x28, 0x02, 0xD1, 0x05, 0xB0, 0x64, 0x20, 0xF0, 0xBD, 0x05, 0xB0, 0xC8, 0x20
	.byte 0xF0, 0xBD, 0x20, 0x1C, 0x39, 0x1C, 0x32, 0x1C, 0x00, 0xF0, 0xD0, 0xFE, 0x30, 0x04, 0x00, 0x0C
	.byte 0x00, 0xF0, 0x3A, 0xFF, 0x68, 0x81, 0x38, 0x1C, 0xFE, 0xF7, 0x90, 0xFE, 0x00, 0x20, 0x05, 0xB0
	.byte 0xF0, 0xBD, 0xC0, 0x46, 0xD0, 0x2F, 0x35, 0x02, 0x9C, 0x92, 0x35, 0x02

	arm_func_start ov02_0232F06C
ov02_0232F06C: @ 0x0232F06C
	strhs fp, [r0], #-0x570
	stcne p14, c4, [r5], #-0x38
	ldmdavc r2!, {r0, r1, r5, sl, fp, ip}
	andle r2, r1, r0, lsl #20
	and r2, r3, r1, lsl #10
	ldclne p12, c1, [r6], #-0x16c
	blle FUN_020B9CA4
	andle r2, r7, r0, lsl #26
	andhs r4, r6, #0x70000
	.word 0xFE9CF000
	andle r2, r6, r0, lsl #16
	and r2, r4, r1, lsl #8
	movweq r2, #0x9101
	andle r4, r0, r8, lsl #5
	stcne p4, c2, [r0], #-8
	uxtab16mi fp, r0, r0, ror #24
	eorseq sb, r5, #156, #4
	arm_func_end ov02_0232F06C

	arm_func_start ov02_0232F0B0
ov02_0232F0B0: @ 0x0232F0B0
	arm_func_end ov02_0232F0B0
_0232F0B0:
	.byte 0x70, 0xB5, 0x06, 0x1C, 0x10, 0x48, 0x0D, 0x1C, 0x00, 0x24, 0x00, 0xF0, 0x31, 0xFF, 0x03, 0x1C
	.byte 0x0D, 0x4A, 0x28, 0x1C, 0x08, 0x21, 0x00, 0xF0, 0xAD, 0xFD, 0x30, 0x1C, 0x29, 0x1C, 0x06, 0x22
	.byte 0x00, 0xF0, 0x7C, 0xFE, 0x00, 0x28, 0x01, 0xD0, 0x64, 0x1E, 0x0A, 0xE0, 0xF0, 0x88, 0x00, 0xF0
	.byte 0x13, 0xFF, 0x06, 0x1C, 0xE8, 0x88, 0x00, 0xF0, 0x0F, 0xFF, 0x71, 0x1C, 0x81, 0x42, 0x00, 0xD0
	.byte 0xA4, 0x1E, 0x20, 0x1C, 0x70, 0xBD, 0xC0, 0x46, 0xD0, 0x2F, 0x35, 0x02, 0xF8, 0xB5, 0x0D, 0x1C
	.byte 0x41, 0x22, 0x06, 0x1C, 0x28, 0x1C, 0x00, 0x21, 0x92, 0x00, 0x00, 0xF0, 0x77, 0xFE, 0x2F, 0x1C
	.byte 0x34, 0x1C, 0x80, 0x37, 0x60, 0x88, 0x00, 0xF0, 0xF7, 0xFE, 0x02, 0x1C, 0x00, 0x2A, 0x02, 0xDC
	.byte 0x00, 0x20, 0xC0, 0x43, 0xF8, 0xBD, 0x20, 0x78, 0x06, 0x28, 0x37, 0xD8, 0x00, 0x18, 0x78, 0x44
	.byte 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14, 0x87, 0x44, 0x0C, 0x00, 0x16, 0x00, 0x20, 0x00, 0x2E, 0x00
	.byte 0x2E, 0x00, 0x3E, 0x00, 0x50, 0x00, 0x28, 0x1C, 0xA1, 0x1D, 0x00, 0xF0, 0x4F, 0xFE, 0x28, 0xE0
	.byte 0x38, 0x1C, 0xA1, 0x1D, 0x00, 0xF0, 0x4A, 0xFE, 0x23, 0xE0, 0x01, 0x20, 0x00, 0x02, 0x28, 0x18
	.byte 0xA1, 0x1D, 0x00, 0xF0, 0x43, 0xFE, 0x1C, 0xE0, 0xA0, 0x79, 0x00, 0xF0, 0xCD, 0xFE, 0x00, 0x28
	.byte 0x17, 0xDC, 0x01, 0x20, 0xC0, 0x43, 0xF8, 0xBD, 0xA0, 0x1D, 0x11, 0x1C, 0x00, 0xF0, 0x1C, 0xF8
	.byte 0x00, 0xF0, 0xAE, 0xFE, 0x0B, 0x49, 0x48, 0x63, 0x0B, 0xE0, 0xA0, 0x1D, 0x11, 0x1C, 0x00, 0xF0
	.byte 0x13, 0xF8, 0x00, 0xF0, 0xA5, 0xFE, 0x07, 0x49, 0x88, 0x63, 0x02, 0xE0, 0x00, 0x20, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0xA0, 0x88, 0x00, 0x28, 0x03, 0xD0, 0x00, 0xF0, 0xAE, 0xFE, 0x34, 0x18, 0xB1, 0xE7
	.byte 0x00, 0x20, 0xF8, 0xBD, 0x3C, 0x85, 0x35, 0x02, 0x30, 0xB4, 0x00, 0x23, 0x4A, 0x1E, 0x85, 0x18
	.byte 0x1C, 0x1C, 0x00, 0x29, 0x06, 0xDD, 0x28, 0x78, 0x1A, 0x02, 0x64, 0x1C, 0x6D, 0x1E, 0x13, 0x18
	.byte 0x8C, 0x42, 0xF8, 0xDB, 0x18, 0x1C, 0x30, 0xBC, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_0232F1DC
ov02_0232F1DC: @ 0x0232F1DC
	strdlt fp, ip, [r5], r0
	stcne p12, c1, [r5, #0x38]
	andls r1, r3, r0, lsr ip
	andls r3, r3, r8
	andls r1, r2, r0, lsr ip
	strdls r3, r4, [r2], -r0
	andls r1, r1, r0, lsr ip
	strhls r3, [r1], -r0
	andls r1, r0, r0, lsr ip
	ldcne p0, c3, [r7], #-0x1c0
	ldrlo sb, [r0, -r0]!
	stmdahi r8!, {r2, r8, sl, ip, pc} ^
	.word 0xFE7CF000
	stmdavc r8!, {r2, sl, fp, ip}
	arm_func_end ov02_0232F1DC
_0232F214:
	.byte 0x21, 0x28, 0x14, 0xDC, 0x22, 0xDA, 0x15, 0x28, 0x0E, 0xDC, 0x01, 0x1C
	.byte 0x10, 0x39, 0x29, 0xD4, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04, 0x09, 0x14, 0x8F, 0x44
	.byte 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x46, 0x00, 0x3A, 0x00, 0x20, 0x28, 0x0F, 0xD0
	.byte 0x1A, 0xE0, 0x23, 0x28, 0x03, 0xDC, 0x0B, 0xDA, 0x22, 0x28, 0x09, 0xD0, 0x14, 0xE0, 0x25, 0x28
	.byte 0x0C, 0xD0, 0x11, 0xE0, 0x05, 0x2C, 0x0F, 0xD9, 0x00, 0x20, 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD
	.byte 0x0D, 0x2C, 0x09, 0xD9, 0x00, 0x20, 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD, 0x21, 0x2C, 0x03, 0xD9
	.byte 0x00, 0x20, 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD, 0x21, 0x28, 0x14, 0xDC, 0x23, 0xDA, 0x15, 0x28
	.byte 0x0E, 0xDC, 0x01, 0x1C, 0x10, 0x39, 0x43, 0xD4, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04
	.byte 0x09, 0x14, 0x8F, 0x44, 0x22, 0x00, 0x30, 0x00, 0x3E, 0x00, 0x4C, 0x00, 0x7A, 0x00, 0x5A, 0x00
	.byte 0x20, 0x28, 0x09, 0xD0, 0x34, 0xE0, 0x23, 0x28, 0x03, 0xDC, 0x1A, 0xDA, 0x22, 0x28, 0x11, 0xD0
	.byte 0x2E, 0xE0, 0x25, 0x28, 0x1C, 0xD0, 0x2B, 0xE0, 0x38, 0x1C, 0xA9, 0x1D, 0x22, 0x1C, 0x00, 0xF0
	.byte 0x95, 0xFD, 0x74, 0x60, 0x28, 0xE0, 0x00, 0x98, 0xA9, 0x1D, 0x22, 0x1C, 0x00, 0xF0, 0x8E, 0xFD
	.byte 0x74, 0x60, 0x21, 0xE0, 0x01, 0x98, 0xA9, 0x1D, 0x22, 0x1C, 0x00, 0xF0, 0x87, 0xFD, 0x74, 0x60
	.byte 0x1A, 0xE0, 0x02, 0x98, 0xA9, 0x1D, 0x22, 0x1C, 0x00, 0xF0, 0x80, 0xFD, 0x74, 0x60, 0x13, 0xE0
	.byte 0x00, 0x2C, 0x07, 0xD0, 0x28, 0x19, 0x40, 0x79, 0x00, 0x28, 0x03, 0xD0, 0x00, 0x20, 0x05, 0xB0
	.byte 0xC0, 0x43, 0xF0, 0xBD, 0x03, 0x98, 0xA9, 0x1D, 0x22, 0x1C, 0x00, 0xF0, 0x6F, 0xFD, 0x03, 0xE0
	.byte 0x00, 0x20, 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD, 0xA8, 0x88, 0x00, 0x28, 0x04, 0xD0, 0x00, 0xF0
	.byte 0xF3, 0xFD, 0x04, 0x99, 0x0D, 0x18, 0x70, 0xE7, 0x00, 0x20, 0x05, 0xB0, 0xF0, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232F330
ov02_0232F330: @ 0x0232F330
	strdlt fp, ip, [r2], r8
	stcne p12, c1, [r4, #0x38]
	andls r1, r0, r0, lsr ip
	ldcne p0, c3, [r7], #-0x20
	ldrlo sb, [r0, -r0]!
	stmdahi r0!, {r0, sl, ip, pc} ^
	.word 0xFDDEF000
	stmdavc r0!, {r0, r2, sl, fp, ip}
	arm_func_end ov02_0232F330
_0232F350:
	.byte 0x35, 0x28, 0x03, 0xDC, 0x0F, 0xDA, 0x30, 0x28, 0x07, 0xD0, 0x12, 0xE0, 0x40, 0x28, 0x01, 0xDC
	.byte 0x03, 0xD0, 0x0E, 0xE0, 0x45, 0x28, 0x06, 0xD0, 0x0B, 0xE0, 0x40, 0x2D, 0x09, 0xD9, 0x00, 0x20
	.byte 0x02, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x21, 0x2D, 0x03, 0xD9, 0x00, 0x20, 0x02, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x35, 0x28, 0x03, 0xDC, 0x10, 0xDA, 0x30, 0x28, 0x07, 0xD0, 0x1D, 0xE0, 0x40, 0x28
	.byte 0x01, 0xDC, 0x03, 0xD0, 0x19, 0xE0, 0x45, 0x28, 0x07, 0xD0, 0x16, 0xE0, 0x38, 0x1C, 0xA1, 0x1D
	.byte 0x2A, 0x1C, 0x00, 0xF0, 0x23, 0xFD, 0x75, 0x60, 0x13, 0xE0, 0x00, 0x2D, 0x07, 0xD0, 0x60, 0x19
	.byte 0x40, 0x79, 0x00, 0x28, 0x03, 0xD0, 0x00, 0x20, 0x02, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x00, 0x98
	.byte 0xA1, 0x1D, 0x2A, 0x1C, 0x00, 0xF0, 0x12, 0xFD, 0x03, 0xE0, 0x00, 0x20, 0x02, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0xA0, 0x88, 0x00, 0x28, 0x04, 0xD0, 0x00, 0xF0, 0x96, 0xFD, 0x01, 0x99, 0x0C, 0x18
	.byte 0xB1, 0xE7, 0x00, 0x20, 0x02, 0xB0, 0xF8, 0xBD

	arm_func_start ov02_0232F3E8
ov02_0232F3E8: @ 0x0232F3E8
	stcne p5, c11, [r4, #0xe0]
	arm_func_end ov02_0232F3E8
_0232F3EC:
	.byte 0x60, 0x88, 0x0D, 0x1C
	.byte 0x00, 0xF0, 0x8A, 0xFD, 0x02, 0x1C, 0x00, 0x2A, 0x02, 0xDC, 0x00, 0x20, 0xC0, 0x43, 0x38, 0xBD
	.byte 0x20, 0x78, 0x70, 0x28, 0x02, 0xD0, 0x00, 0x20, 0xC0, 0x43, 0x38, 0xBD, 0x28, 0x1C, 0xA1, 0x1D
	.byte 0x00, 0xF0, 0xEC, 0xFC, 0x00, 0x20, 0x38, 0xBD

	arm_func_start ov02_0232F418
ov02_0232F418: @ 0x0232F418
	strdlt fp, ip, [r5], r0
	andls r1, r0, r6, lsl ip
	strhs r1, [r0, #-0xc0c]
	.word 0x2E009301
	andlt sp, r5, r2, lsl #24
	ldcllt p14, c1, [r0, #0x2a0]!
	bls _02343124
	ldcpl p8, c7, [sl], #0x80
	addsmi r1, r0, #0x2100
	stmdahi r0!, {r0, r1, r3, ip, lr, pc} ^
	.word 0xFD62F000
	bne _030B684C
	.word 0x2E001824
	strdhs sp, lr, [r3], -r1
	bicmi fp, r0, #5
	stmdahi r8, {r4, r5, r6, r7, r8, sl, fp, ip, sp, pc} ^
	arm_func_end ov02_0232F418
_0232F458:
	.byte 0x24, 0x1D, 0x00, 0xF0, 0x55, 0xFD, 0x07, 0x1C
	.byte 0x35, 0x21, 0x00, 0x98, 0x09, 0x01, 0x41, 0x43, 0x01, 0x98, 0x46, 0x18, 0x0A, 0x98, 0x02, 0x90
	.byte 0x00, 0x98, 0xC0, 0x1C, 0xC0, 0x01, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x90, 0x08, 0x30, 0x04, 0x90
	.byte 0x20, 0x78, 0x0A, 0x28, 0x39, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14
	.byte 0x87, 0x44, 0x66, 0x00, 0x66, 0x00, 0x66, 0x00, 0x14, 0x00, 0x22, 0x00, 0x34, 0x00, 0x46, 0x00
	.byte 0x66, 0x00, 0x66, 0x00, 0x66, 0x00, 0x58, 0x00, 0x04, 0x99, 0x20, 0x1C, 0xFF, 0xF7, 0x96, 0xFE
	.byte 0x01, 0x21, 0x0D, 0x43, 0x23, 0xE0, 0x4E, 0x21, 0x89, 0x00, 0x20, 0x1C, 0x71, 0x18, 0xFF, 0xF7
	.byte 0x8D, 0xFE, 0x02, 0x21, 0x0D, 0x43, 0x1A, 0xE0, 0x9A, 0x21, 0x89, 0x00, 0x20, 0x1C, 0x71, 0x18
	.byte 0xFF, 0xF7, 0x2E, 0xFF, 0x04, 0x21, 0x0D, 0x43, 0x11, 0xE0, 0xB6, 0x21, 0x89, 0x00, 0x20, 0x1C
	.byte 0x71, 0x18, 0xFF, 0xF7, 0x25, 0xFF, 0x08, 0x21, 0x0D, 0x43, 0x08, 0xE0, 0x02, 0x9A, 0x03, 0x99
	.byte 0x20, 0x1C, 0x51, 0x18, 0xFF, 0xF7, 0x78, 0xFF, 0x01, 0xE0, 0x02, 0x20, 0xC0, 0x43, 0x00, 0x28
	.byte 0x0C, 0xD1, 0x60, 0x88, 0x00, 0xF0, 0x00, 0xFD, 0x00, 0x1D, 0x3F, 0x1A, 0x24, 0x18, 0x00, 0x2F
	.byte 0xB6, 0xDC, 0x04, 0x48, 0x01, 0x6B, 0x29, 0x43, 0x01, 0x63, 0x00, 0x20, 0x05, 0xB0, 0xF0, 0xBD
	.byte 0x60, 0x2F, 0x35, 0x02, 0x3C, 0x85, 0x35, 0x02, 0x10, 0x21, 0x00, 0x22, 0x08, 0x42, 0x00, 0xD0
	.byte 0x01, 0x22, 0x10, 0x1C, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_0232F538
ov02_0232F538: @ 0x0232F538
	arm_func_end ov02_0232F538
_0232F538:
	.byte 0x70, 0xB5, 0x0D, 0x1C, 0x14, 0x1C, 0x1E, 0x1C
	.byte 0x00, 0x28, 0x04, 0xD0, 0x01, 0x28, 0x0B, 0xD0, 0x02, 0x28, 0x12, 0xD0, 0x1A, 0xE0, 0x02, 0x20
	.byte 0xFF, 0xF7, 0x80, 0xFB, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C, 0x00, 0xF0, 0x17, 0xF8, 0x70, 0xBD
	.byte 0x03, 0x20, 0xFF, 0xF7, 0x77, 0xFB, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C, 0x00, 0xF0, 0xB0, 0xF8
	.byte 0x70, 0xBD, 0x05, 0x20, 0xFF, 0xF7, 0x6E, 0xFB, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C, 0x00, 0xF0
	.byte 0x15, 0xF9, 0x70, 0xBD, 0x00, 0x20, 0xC0, 0x43, 0x70, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232F58C
ov02_0232F58C: @ 0x0232F58C
	strdlt fp, ip, [r8], r8
	arm_func_end ov02_0232F58C
_0232F590:
	.byte 0x0F, 0x1C, 0x00, 0x21, 0x04, 0xA8, 0x01, 0x70, 0x81, 0x80, 0x41, 0x80, 0x48, 0x48, 0x03, 0x92
	.byte 0x45, 0x69, 0x48, 0x4A, 0x28, 0x1C, 0x00, 0xF0, 0x29, 0xFC, 0x21, 0x20, 0x00, 0x01, 0xFE, 0xF7
	.byte 0xDD, 0xFB, 0x04, 0x1C, 0x06, 0xD1, 0x02, 0x20, 0xFF, 0xF7, 0xBA, 0xF9, 0x00, 0x20, 0x08, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x21, 0x22, 0x00, 0x21, 0x12, 0x01, 0x00, 0xF0, 0x17, 0xFC, 0x2E, 0x1C
	.byte 0x3D, 0x48, 0x39, 0x1C, 0x08, 0x22, 0x18, 0x36, 0x00, 0xF0, 0x08, 0xFC, 0x05, 0xA8, 0x3A, 0x49
	.byte 0x02, 0x30, 0x08, 0x22, 0x00, 0xF0, 0x02, 0xFC, 0x20, 0x1D, 0x00, 0xF0, 0x15, 0xF9, 0x04, 0xA9
	.byte 0x88, 0x80, 0x04, 0x20, 0x08, 0x5E, 0x00, 0x28, 0x0B, 0xDA, 0x03, 0x20, 0xFF, 0xF7, 0x98, 0xF9
	.byte 0x00, 0x2C, 0x02, 0xD0, 0x20, 0x1C, 0xFE, 0xF7, 0xB9, 0xFB, 0x00, 0x20, 0x08, 0xB0, 0xC0, 0x43
	.byte 0xF8, 0xBD, 0x00, 0x20, 0x20, 0x70, 0x88, 0x88, 0x00, 0xF0, 0x56, 0xFC, 0x60, 0x80, 0x04, 0xA9
	.byte 0x04, 0x20, 0x08, 0x5E, 0x22, 0x1C, 0x05, 0xAB, 0x00, 0x1D, 0x88, 0x80, 0x04, 0xA8, 0x02, 0x30
	.byte 0x00, 0x90, 0x04, 0xA8, 0x01, 0x90, 0x00, 0x20, 0x31, 0x1C, 0x00, 0xF0, 0x33, 0xF9, 0x04, 0xA9
	.byte 0x02, 0x20, 0x0A, 0x5E, 0x10, 0x20, 0x06, 0x23, 0x10, 0x43, 0x48, 0x80, 0x05, 0xA8, 0x1F, 0x4A
	.byte 0x02, 0x30, 0x08, 0x21, 0x00, 0xF0, 0xE6, 0xFA, 0x00, 0x28, 0x0B, 0xD0, 0x02, 0x20, 0xFF, 0xF7
	.byte 0x67, 0xF9, 0x00, 0x2C, 0x02, 0xD0, 0x20, 0x1C, 0xFE, 0xF7, 0x88, 0xFB, 0x00, 0x20, 0x08, 0xB0
	.byte 0xC0, 0x43, 0xF8, 0xBD, 0x04, 0xAB, 0x00, 0x20, 0x18, 0x56, 0x01, 0x21, 0x04, 0x22, 0x00, 0x90
	.byte 0x11, 0x20, 0x01, 0x90, 0x05, 0xA8, 0x02, 0x30, 0x02, 0x90, 0x02, 0x26, 0x9A, 0x5E, 0x9B, 0x5F
	.byte 0x28, 0x1C, 0x09, 0x03, 0x00, 0xF0, 0x30, 0xF9, 0x04, 0xAA, 0x04, 0x21, 0x50, 0x5E, 0x03, 0x9B
	.byte 0x18, 0x30, 0x90, 0x80, 0x51, 0x5E, 0x28, 0x1C, 0xFF, 0x22, 0x00, 0xF0, 0x51, 0xF9, 0x00, 0x2C
	.byte 0x02, 0xD0, 0x20, 0x1C, 0xFE, 0xF7, 0x62, 0xFB, 0x00, 0x20, 0x08, 0xB0, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0x3C, 0x85, 0x35, 0x02, 0xDC, 0x05, 0x00, 0x00, 0x9C, 0x92, 0x35, 0x02, 0xD0, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232F6D0
ov02_0232F6D0: @ 0x0232F6D0
	addlt fp, sb, r8, ror r5
	arm_func_end ov02_0232F6D0
_0232F6D4:
	.byte 0x0D, 0x1C, 0x00, 0x21, 0x03, 0xA8, 0x01, 0x70, 0x81, 0x80, 0x41, 0x80
	.byte 0x2F, 0x48, 0x16, 0x1C, 0x44, 0x69, 0x05, 0xA8, 0x08, 0x22, 0x00, 0xF0, 0x87, 0xFB, 0x2D, 0x4A
	.byte 0x20, 0x1C, 0x00, 0x21, 0x00, 0xF0, 0x82, 0xFB, 0x02, 0x21, 0x03, 0xA8, 0x01, 0x72, 0x00, 0x21
	.byte 0x41, 0x72, 0x04, 0x20, 0x00, 0xF0, 0xE0, 0xFB, 0x03, 0xA9, 0x48, 0x81, 0x24, 0x48, 0xC0, 0x6A
	.byte 0x06, 0x90, 0x00, 0xF0, 0xC5, 0xFB, 0x06, 0x90, 0x08, 0x21, 0x03, 0xA8, 0x81, 0x80, 0x03, 0xA8
	.byte 0x02, 0x30, 0x00, 0x90, 0x03, 0xA8, 0x01, 0x90, 0x1D, 0x48, 0x21, 0x1C, 0x00, 0x68, 0x18, 0x31
	.byte 0x05, 0xAA, 0x04, 0xAB, 0x00, 0xF0, 0xB6, 0xF8, 0x08, 0x35, 0x07, 0xA8, 0x29, 0x1C, 0x08, 0x22
	.byte 0x00, 0xF0, 0x54, 0xFB, 0x18, 0x4A, 0x07, 0xA8, 0x08, 0x21, 0x06, 0x23, 0x00, 0xF0, 0x6A, 0xFA
	.byte 0x00, 0x28, 0x06, 0xD0, 0x02, 0x20, 0xFF, 0xF7, 0xEB, 0xF8, 0x00, 0x20, 0x09, 0xB0, 0xC0, 0x43
	.byte 0x78, 0xBD, 0x03, 0xAB, 0x00, 0x20, 0x18, 0x56, 0x02, 0x21, 0x04, 0x22, 0x00, 0x90, 0x11, 0x20
	.byte 0x01, 0x90, 0x07, 0xA8, 0x02, 0x90, 0x02, 0x25, 0x9A, 0x5E, 0x5B, 0x5F, 0x20, 0x1C, 0x09, 0x03
	.byte 0x00, 0xF0, 0xBA, 0xF8, 0x03, 0xAA, 0x04, 0x21, 0x50, 0x5E, 0x33, 0x1C, 0x18, 0x30, 0x90, 0x80
	.byte 0x51, 0x5E, 0x20, 0x1C, 0x00, 0x22, 0x00, 0xF0, 0xDB, 0xF8, 0x00, 0x20, 0x09, 0xB0, 0x78, 0xBD
	.byte 0x3C, 0x85, 0x35, 0x02, 0xDC, 0x05, 0x00, 0x00, 0xD0, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232F7AC
ov02_0232F7AC: @ 0x0232F7AC
	addlt fp, r5, r8, ror r5
	arm_func_end ov02_0232F7AC
_0232F7B0:
	.byte 0x16, 0x48, 0x16, 0x1C, 0x44, 0x69, 0x16, 0x4A, 0x0D, 0x1C, 0x20, 0x1C, 0x00, 0x21, 0x00, 0xF0
	.byte 0x1D, 0xFB, 0x10, 0x35, 0x03, 0xA8, 0x29, 0x1C, 0x08, 0x22, 0x00, 0xF0, 0x0F, 0xFB, 0x11, 0x48
	.byte 0x00, 0xF0, 0xA6, 0xFB, 0x03, 0x1C, 0x0F, 0x4A, 0x03, 0xA8, 0x08, 0x21, 0x00, 0xF0, 0x22, 0xFA
	.byte 0x00, 0x22, 0x03, 0x21, 0x00, 0x92, 0x11, 0x20, 0x01, 0x90, 0x03, 0xA8, 0x02, 0x90, 0x20, 0x1C
	.byte 0x09, 0x03, 0x13, 0x1C, 0x00, 0xF0, 0x80, 0xF8, 0x20, 0x1C, 0x18, 0x21, 0x00, 0x22, 0x33, 0x1C
	.byte 0x00, 0xF0, 0xA6, 0xF8, 0x00, 0x20, 0x05, 0xB0, 0x78, 0xBD, 0xC0, 0x46, 0x3C, 0x85, 0x35, 0x02
	.byte 0xDC, 0x05, 0x00, 0x00, 0xD0, 0x2F, 0x35, 0x02

	arm_func_start ov02_0232F818
ov02_0232F818: @ 0x0232F818
	stmdbmi r0!, {r3, r4, r5, r6, r7, r8, sl, ip, sp, pc}
	andshs r1, sp, r5, lsl #24
	ldmdbmi pc, {r3, sb, sl, ip, lr}
	eorvc r2, r8, r0, lsl #12
	rsbvc r2, r8, r1
	bvs _0358A254
	strne r0, [r4], #-0x400
	stcne p13, c1, [r2], #-0x2a0
	blx FUN_0196B840
	arm_func_end ov02_0232F818
_0232F83C:
	.byte 0x20, 0x04, 0x00, 0x0C
	.byte 0x00, 0xF0, 0x42, 0xFB, 0x68, 0x80, 0xA0, 0x1D, 0x00, 0x04, 0x00, 0x14, 0x41, 0x1C, 0xC8, 0x0F
	.byte 0x08, 0x18, 0x40, 0x10, 0x40, 0x04, 0x07, 0x14, 0x38, 0x04, 0x00, 0x0C, 0x00, 0xF0, 0x34, 0xFB
	.byte 0xA8, 0x80, 0xF0, 0x19, 0x00, 0x04, 0x06, 0x14, 0x60, 0x20, 0xE8, 0x55, 0xEC, 0x19, 0x00, 0x20
	.byte 0x60, 0x70, 0x00, 0xF0, 0x29, 0xFB, 0xA0, 0x80, 0x0E, 0x20, 0x00, 0xF0, 0x11, 0xFB, 0x00, 0x90
	.byte 0xA0, 0x1D, 0x00, 0xA9, 0x04, 0x22, 0x00, 0xF0, 0xB1, 0xFA, 0x04, 0x20, 0x00, 0xF0, 0x1C, 0xFB
	.byte 0x0A, 0x36, 0x60, 0x80, 0x30, 0x04, 0x00, 0x14, 0xF8, 0xBD, 0xC0, 0x46, 0x5C, 0x85, 0x35, 0x02
	.byte 0x3C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232F8A4
ov02_0232F8A4: @ 0x0232F8A4
	addlt fp, r3, r0, lsr r5
	arm_func_end ov02_0232F8A4
_0232F8A8:
	.byte 0x0D, 0x1C, 0x1C, 0x1C, 0x01, 0x28, 0x19, 0xD1
	.byte 0x06, 0x98, 0x01, 0x21, 0x01, 0x80, 0xA8, 0x1C, 0x00, 0x90, 0x0E, 0x48, 0x07, 0x9B, 0x01, 0x90
	.byte 0x08, 0x20, 0x02, 0x90, 0x10, 0x1C, 0x00, 0x22, 0xA2, 0x5E, 0x29, 0x1D, 0x00, 0xF0, 0x74, 0xF8
	.byte 0x20, 0x88, 0x00, 0xF0, 0xF9, 0xFA, 0x28, 0x80, 0x00, 0x20, 0x20, 0x5E, 0x03, 0xB0, 0x00, 0x1D
	.byte 0x20, 0x80, 0x30, 0xBD, 0x11, 0x1C, 0x00, 0x22, 0xA2, 0x5E, 0x28, 0x1C, 0x00, 0xF0, 0x7E, 0xFA
	.byte 0x03, 0xB0, 0x30, 0xBD, 0x9C, 0x92, 0x35, 0x02

	arm_func_start ov02_0232F8F8
ov02_0232F8F8: @ 0x0232F8F8
	arm_func_end ov02_0232F8F8
_0232F8F8:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x01, 0x20, 0x0C, 0x1C
	.byte 0x16, 0x1C, 0x1F, 0x1C, 0x00, 0xF0, 0xE0, 0xFA, 0x28, 0x80, 0x00, 0x20, 0x68, 0x80, 0xA8, 0x80
	.byte 0x20, 0x04, 0x00, 0x0C, 0x00, 0xF0, 0xD8, 0xFA, 0xE8, 0x80, 0x00, 0x20, 0x28, 0x81, 0x30, 0x04
	.byte 0x00, 0x0C, 0x00, 0xF0, 0xD1, 0xFA, 0x68, 0x81, 0x38, 0x04, 0x00, 0x0C, 0x00, 0xF0, 0xCC, 0xFA
	.byte 0xA8, 0x81, 0x02, 0xA9, 0x10, 0x20, 0x08, 0x56, 0x08, 0x22, 0xA8, 0x73, 0x14, 0x20, 0x08, 0x56
	.byte 0x08, 0x99, 0xE8, 0x73, 0x10, 0x35, 0x28, 0x1C, 0x00, 0xF0, 0x50, 0xFA, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232F950
ov02_0232F950: @ 0x0232F950
	strdlt fp, ip, [r4], r8
	arm_func_end ov02_0232F950
_0232F954:
	.byte 0x05, 0x1C, 0x0E, 0x1C, 0x14, 0x1C, 0x02, 0xA8, 0x00, 0x21, 0x08, 0x22
	.byte 0x1F, 0x1C, 0x00, 0xF0, 0x4B, 0xFA, 0x02, 0x21, 0x02, 0xA8, 0x41, 0x70, 0x0F, 0x48, 0x00, 0xF0
	.byte 0xAB, 0xFA, 0x02, 0xA9, 0x48, 0x80, 0x0E, 0x48, 0x40, 0x6B, 0x00, 0xF0, 0x91, 0xFA, 0x03, 0x90
	.byte 0xFF, 0x2C, 0x04, 0xD0, 0x0B, 0x49, 0x1C, 0x20, 0x08, 0x56, 0x00, 0x28, 0x02, 0xD1, 0x00, 0x20
	.byte 0xC0, 0x43, 0x03, 0x90, 0x02, 0xA8, 0x00, 0x90, 0x08, 0x20, 0x01, 0x90, 0x38, 0x1C, 0x29, 0x1C
	.byte 0x32, 0x1C, 0x00, 0x23, 0x00, 0xF0, 0x64, 0xFA, 0x04, 0xB0, 0xF8, 0xBD, 0x90, 0x57, 0x00, 0x00
	.byte 0x3C, 0x85, 0x35, 0x02, 0x5C, 0x85, 0x35, 0x02

	arm_func_start ov02_0232F9B8
ov02_0232F9B8: @ 0x0232F9B8
	strdlt fp, ip, [r5], r0
	arm_func_end ov02_0232F9B8
_0232F9BC:
	.byte 0x15, 0x1C, 0x0F, 0x1C
	.byte 0x1C, 0x1C, 0x29, 0x1C, 0x06, 0x1C, 0x00, 0xF0, 0xE1, 0xF8, 0x20, 0x70, 0x28, 0x1C, 0xFE, 0xF7
	.byte 0xCD, 0xF9, 0x03, 0x90, 0x00, 0x28, 0x03, 0xD1, 0x00, 0x20, 0x05, 0xB0, 0xC0, 0x43, 0xF0, 0xBD
	.byte 0x00, 0xF0, 0xA8, 0xFA, 0x00, 0xA9, 0x08, 0x80, 0x0A, 0x98, 0x00, 0xA9, 0x02, 0x22, 0x00, 0xF0
	.byte 0xFD, 0xF9, 0x0E, 0x48, 0x0A, 0x99, 0x02, 0x22, 0x00, 0xF0, 0xF8, 0xF9, 0x0C, 0x48, 0x0B, 0x99
	.byte 0x0C, 0x9A, 0x00, 0xF0, 0xF3, 0xF9, 0x0C, 0x9A, 0x08, 0x49, 0x01, 0xA8, 0x92, 0x1C, 0x2B, 0x1C
	.byte 0x00, 0xF0, 0x54, 0xF8, 0x01, 0xA8, 0x39, 0x1C, 0x32, 0x1C, 0x2B, 0x1C, 0x00, 0xF0, 0x80, 0xF8
	.byte 0x03, 0x98, 0xFE, 0xF7, 0xAB, 0xF9, 0x00, 0x20, 0x05, 0xB0, 0xF0, 0xBD, 0xA4, 0x92, 0x35, 0x02
	.byte 0xA6, 0x92, 0x35, 0x02

	arm_func_start ov02_0232FA34
ov02_0232FA34: @ 0x0232FA34
	strdlt fp, ip, [r4], r8
	arm_func_end ov02_0232FA34
_0232FA38:
	.byte 0x14, 0x1C, 0x07, 0x1C, 0x20, 0x1C, 0x0D, 0x1C
	.byte 0x1E, 0x1C, 0xFE, 0xF7, 0x93, 0xF9, 0x02, 0x90, 0x00, 0x28, 0x06, 0xD1, 0x02, 0x20, 0xFE, 0xF7
	.byte 0x6F, 0xFF, 0x00, 0x20, 0x04, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x16, 0x48, 0x0A, 0x99, 0x02, 0x22
	.byte 0x00, 0xF0, 0xC4, 0xF9, 0x14, 0x48, 0x0B, 0x99, 0x0C, 0x9A, 0x00, 0xF0, 0xBF, 0xF9, 0x0C, 0x9A
	.byte 0x10, 0x49, 0x00, 0xA8, 0x92, 0x1C, 0x23, 0x1C, 0x00, 0xF0, 0x20, 0xF8, 0x00, 0xA8, 0x29, 0x1C
	.byte 0x3A, 0x1C, 0x23, 0x1C, 0x00, 0xF0, 0x4C, 0xF8, 0x28, 0x1C, 0x21, 0x1C, 0x00, 0xF0, 0x7E, 0xF8
	.byte 0xB0, 0x42, 0x09, 0xD0, 0x12, 0x20, 0xFE, 0xF7, 0x4B, 0xFF, 0x02, 0x98, 0xFE, 0xF7, 0x6E, 0xF9
	.byte 0x00, 0x20, 0x04, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x02, 0x98, 0xFE, 0xF7, 0x67, 0xF9, 0x00, 0x20
	.byte 0x04, 0xB0, 0xF8, 0xBD, 0xA4, 0x92, 0x35, 0x02, 0xA6, 0x92, 0x35, 0x02

	arm_func_start ov02_0232FABC
ov02_0232FABC: @ 0x0232FABC
	strdlt fp, ip, [r4], r8
	mrsls sb, apsr
	stmdbls r0, {r2, r7, fp, sp, lr}
	subvs r2, r8, r0
	andvs sb, r8, r2, lsl #4
	sbcvs r1, sl, sl, lsl ip
	arm_func_end ov02_0232FABC
_0232FAD4:
	.byte 0x03, 0x93, 0x19, 0x1C, 0x04, 0xD0, 0x03, 0x99, 0x20, 0x54, 0x40, 0x1C
	.byte 0x88, 0x42, 0xFA, 0xD3, 0x03, 0x98, 0x00, 0x21, 0x0E, 0x1C, 0x0D, 0x1C, 0x00, 0x28, 0x14, 0xD9
	.byte 0x01, 0x98, 0x67, 0x5D, 0x80, 0x5D, 0x08, 0x18, 0x00, 0x99, 0x38, 0x18, 0xC9, 0x68, 0x60, 0xF5
	.byte 0xD8, 0xEA, 0x60, 0x5C, 0x76, 0x1C, 0x67, 0x54, 0x60, 0x55, 0x02, 0x98, 0x86, 0x42, 0x00, 0xD3
	.byte 0x00, 0x26, 0x03, 0x98, 0x6D, 0x1C, 0x85, 0x42, 0xEA, 0xD3, 0x04, 0xB0, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FB20
ov02_0232FB20: @ 0x0232FB20
	strdls fp, ip, [r0], -r8
	arm_func_end ov02_0232FB20
_0232FB24:
	.byte 0x0D, 0x1C, 0x16, 0x1C, 0x1F, 0x1C, 0x07, 0x4C, 0x0A, 0xD0, 0x00, 0x98
	.byte 0x00, 0xF0, 0x0C, 0xF8, 0x00, 0x06, 0x01, 0x0E, 0x30, 0x5D, 0x48, 0x40, 0x28, 0x55, 0x64, 0x1C
	.byte 0xBC, 0x42, 0xF4, 0xD3, 0xF8, 0xBD, 0xC0, 0x46, 0x00, 0x00, 0x00, 0x00

	arm_func_start ov02_0232FB4C
ov02_0232FB4C: @ 0x0232FB4C
	arm_func_end ov02_0232FB4C
_0232FB4C:
	.byte 0xF8, 0xB5, 0x05, 0x1C
	.byte 0xE8, 0x68, 0xAC, 0x68, 0x00, 0x90, 0x28, 0x68, 0x00, 0x99, 0x40, 0x1C, 0x60, 0xF5, 0xA8, 0xEA
	.byte 0x08, 0x06, 0x07, 0x0E, 0xE6, 0x5D, 0x68, 0x68, 0x00, 0x99, 0x30, 0x18, 0x60, 0xF5, 0xA0, 0xEA
	.byte 0x08, 0x06, 0x01, 0x0E, 0x60, 0x5C, 0x2F, 0x60, 0x69, 0x60, 0x66, 0x54, 0xE0, 0x55, 0xE9, 0x68
	.byte 0x30, 0x18, 0x60, 0xF5, 0x96, 0xEA, 0x60, 0x5C, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FB8C
ov02_0232FB8C: @ 0x0232FB8C
	arm_func_end ov02_0232FB8C
_0232FB8C:
	.byte 0x08, 0xB5, 0x03, 0x1C
	.byte 0x07, 0x48, 0x0A, 0x1C, 0x00, 0x90, 0x00, 0x20, 0x19, 0x1C, 0xC0, 0x43, 0x00, 0x23, 0x00, 0xF0
	.byte 0x09, 0xF8, 0x00, 0x21, 0xC9, 0x43, 0x48, 0x40, 0x00, 0x06, 0x00, 0x0E, 0x08, 0xBD, 0xC0, 0x46
	.byte 0xFC, 0x87, 0x35, 0x02

	arm_func_start ov02_0232FBB4
ov02_0232FBB4: @ 0x0232FBB4
	arm_func_end ov02_0232FBB4
_0232FBB4:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x0F, 0x1C, 0x14, 0x1C, 0x06, 0x9E, 0x00, 0x2B
	.byte 0x03, 0xD1, 0x18, 0x1C, 0x31, 0x1C, 0x00, 0xF0, 0x11, 0xF8, 0x00, 0x21, 0x00, 0x2C, 0x0A, 0xDD
	.byte 0x7A, 0x5C, 0x28, 0x0A, 0x49, 0x1C, 0x6A, 0x40, 0x12, 0x06, 0x92, 0x0D, 0xB2, 0x58, 0x05, 0x1C
	.byte 0x55, 0x40, 0xA1, 0x42, 0xF4, 0xDB, 0x28, 0x1C, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FBEC
ov02_0232FBEC: @ 0x0232FBEC
	strhs fp, [r1, #-0x4f0]
	arm_func_end ov02_0232FBEC
_0232FBF0:
	.byte 0x2B, 0x1C, 0x0B, 0x4C, 0x00, 0x20, 0xFF, 0x33, 0x07, 0x1C, 0x00, 0x22, 0x3E, 0x1C, 0x2E, 0x42
	.byte 0x03, 0xD0, 0x7E, 0x08, 0x37, 0x1C, 0x67, 0x40, 0x00, 0xE0, 0x7F, 0x08, 0x52, 0x1C, 0x08, 0x2A
	.byte 0xF4, 0xDB, 0x40, 0x1C, 0x80, 0xC1, 0x98, 0x42, 0xEE, 0xDB, 0xF0, 0xBC, 0x70, 0x47, 0xC0, 0x46
	.byte 0x20, 0x83, 0xB8, 0xED

	arm_func_start ov02_0232FC24
ov02_0232FC24: @ 0x0232FC24
	strdlt fp, ip, [r4], r8
	arm_func_end ov02_0232FC24
_0232FC28:
	.byte 0x0D, 0x1C, 0x07, 0x1C, 0xE8, 0x0F, 0x28, 0x18
	.byte 0x40, 0x10, 0x01, 0x92, 0x02, 0x93, 0xFE, 0xF7, 0x99, 0xF8, 0x06, 0x1C, 0x03, 0xD1, 0x00, 0x20
	.byte 0x04, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x28, 0x1C, 0xFE, 0xF7, 0x90, 0xF8, 0x03, 0x90, 0x00, 0x28
	.byte 0x06, 0xD1, 0x30, 0x1C, 0xFE, 0xF7, 0x92, 0xF8, 0x00, 0x20, 0x04, 0xB0, 0xC0, 0x43, 0xF8, 0xBD
	.byte 0x00, 0x24, 0x02, 0x98, 0x01, 0x9B, 0x00, 0x90, 0x20, 0x1C, 0x31, 0x1C, 0x2A, 0x1C, 0x00, 0xF0
	.byte 0x17, 0xF8, 0x30, 0x1C, 0x39, 0x1C, 0x2A, 0x1C, 0x00, 0xF0, 0x2C, 0xF8, 0x03, 0x9A, 0x38, 0x1C
	.byte 0x29, 0x1C, 0x00, 0xF0, 0x39, 0xF8, 0x64, 0x1C, 0x02, 0x2C, 0xEA, 0xDB, 0x30, 0x1C, 0xFE, 0xF7
	.byte 0x75, 0xF8, 0x03, 0x98, 0xFE, 0xF7, 0x72, 0xF8, 0x00, 0x20, 0x04, 0xB0, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FCA0
ov02_0232FCA0: @ 0x0232FCA0
	arm_func_end ov02_0232FCA0
_0232FCA0:
	.byte 0xF8, 0xB5, 0x0D, 0x1C, 0xD1, 0x0F, 0x51, 0x18, 0x06, 0x9E, 0x4C, 0x10, 0x31, 0x1C, 0x1F, 0x1C
	.byte 0x60, 0xF5, 0xF8, 0xE8, 0x00, 0x20, 0x00, 0x2C, 0x0B, 0xDD, 0x28, 0x54, 0x7A, 0x56, 0x2B, 0x56
	.byte 0x49, 0x1C, 0x5A, 0x40, 0x2A, 0x54, 0xB1, 0x42, 0x00, 0xDB, 0x00, 0x21, 0x40, 0x1C, 0xA0, 0x42
	.byte 0xF3, 0xDB, 0xF8, 0xBD

	arm_func_start ov02_0232FCD4
ov02_0232FCD4: @ 0x0232FCD4
	svceq #0xd3b430
	ldrsbne r1, [ip], #-0x83
	arm_func_end ov02_0232FCD4
_0232FCDC:
	.byte 0x00, 0x23, 0x00, 0x2C
	.byte 0x08, 0xDD, 0x0D, 0x19, 0xC1, 0x56, 0x2A, 0x78, 0x5B, 0x1C, 0x51, 0x40, 0x29, 0x70, 0x6D, 0x1C
	.byte 0xA3, 0x42, 0xF7, 0xDB, 0x30, 0xBC, 0x70, 0x47

	arm_func_start ov02_0232FCF8
ov02_0232FCF8: @ 0x0232FCF8
	arm_func_end ov02_0232FCF8
_0232FCF8:
	.byte 0xF8, 0xB5, 0x0E, 0x1C, 0x05, 0x1C, 0xF0, 0x0F
	.byte 0x30, 0x18, 0x47, 0x10, 0x14, 0x1C, 0x20, 0x1C, 0xE9, 0x19, 0x3A, 0x1C, 0x00, 0xF0, 0x6E, 0xF8
	.byte 0xE0, 0x19, 0x29, 0x1C, 0x3A, 0x1C, 0x00, 0xF0, 0x69, 0xF8, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C
	.byte 0x00, 0xF0, 0x64, 0xF8, 0xF8, 0xBD, 0x00, 0x00, 0x08, 0xB5, 0x00, 0x29, 0x04, 0xDD, 0x08, 0x1C
	.byte 0x02, 0x49, 0x09, 0x68, 0x88, 0x47, 0x08, 0xBD, 0x00, 0x20, 0x08, 0xBD, 0x20, 0x93, 0x35, 0x02
	.byte 0x08, 0xB5, 0x08, 0x1C, 0x01, 0x49, 0x09, 0x68, 0x88, 0x47, 0x08, 0xBD, 0x2C, 0x93, 0x35, 0x02

	arm_func_start ov02_0232FD50
ov02_0232FD50: @ 0x0232FD50
	arm_func_end ov02_0232FD50
_0232FD50:
	.byte 0x38, 0xB5, 0x0D, 0x1C, 0x14, 0x1C, 0x00, 0xF0, 0xA3, 0xF8, 0x10, 0x49, 0x88, 0x61, 0x28, 0x1C
	.byte 0x00, 0xF0, 0x9E, 0xF8, 0x0D, 0x49, 0xC8, 0x61, 0x20, 0x1C, 0x00, 0xF0, 0x99, 0xF8, 0x0B, 0x49
	.byte 0x08, 0x62, 0x0B, 0x48, 0x9F, 0xF7, 0x7E, 0xEC, 0x00, 0x28, 0x02, 0xDA, 0x00, 0x20, 0xC0, 0x43
	.byte 0x38, 0xBD, 0x08, 0x4D, 0x28, 0x68, 0x00, 0x28, 0x06, 0xD1, 0x64, 0x24, 0x20, 0x1C, 0x49, 0xF5
	.byte 0xC2, 0xEE, 0x28, 0x68, 0x00, 0x28, 0xF9, 0xD0, 0x00, 0x20, 0x38, 0xBD, 0x64, 0x2F, 0x35, 0x02
	.byte 0x6C, 0x2F, 0x35, 0x02, 0xC8, 0x50, 0x32, 0x02

	arm_func_start ov02_0232FDA8
ov02_0232FDA8: @ 0x0232FDA8
	arm_func_end ov02_0232FDA8
_0232FDA8:
	.byte 0x08, 0xB5, 0x9F, 0xF7, 0x1E, 0xED, 0x00, 0x28
	.byte 0x02, 0xDA, 0x00, 0x20, 0xC0, 0x43, 0x08, 0xBD, 0x00, 0xF0, 0x20, 0xFA, 0x00, 0x28, 0x01, 0xD0
	.byte 0x01, 0x20, 0x00, 0xE0, 0x00, 0x20, 0x40, 0x42, 0x08, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FDCC
ov02_0232FDCC: @ 0x0232FDCC
	movwhs fp, #0x418
	mcrrne p0, #0, lr, r0, c1
	arm_func_end ov02_0232FDCC
_0232FDD4:
	.byte 0x49, 0x1C, 0x14, 0x1C, 0x52, 0x1E, 0x00, 0x2C, 0x03, 0xDD, 0x04, 0x78
	.byte 0x0B, 0x78, 0xE3, 0x1A, 0xF5, 0xD0, 0x18, 0x1C, 0x18, 0xBC, 0x70, 0x47

	arm_func_start ov02_0232FDEC
ov02_0232FDEC: @ 0x0232FDEC
	arm_func_end ov02_0232FDEC
_0232FDEC:
	.byte 0x03, 0x1C, 0x08, 0x1C
	.byte 0x19, 0x1C, 0x01, 0x4B, 0x18, 0x47, 0xC0, 0x46, 0xC8, 0xC4, 0x07, 0x02

	arm_func_start ov02_0232FDFC
ov02_0232FDFC: @ 0x0232FDFC
	streq r4, [sb], -r1, lsl #22
	ldrmi r0, [r8, -sb, lsl #28]
	andeq ip, r7, #12, #8
	arm_func_end ov02_0232FDFC

	arm_func_start ov02_0232FE08
ov02_0232FE08: @ 0x0232FE08
	arm_func_end ov02_0232FE08
_0232FE08:
	.byte 0x38, 0xB5, 0x05, 0x9C, 0x25, 0x68, 0x04, 0x9C
	.byte 0x25, 0x70, 0x00, 0x94, 0x9F, 0xF7, 0x36, 0xEA, 0x38, 0xBD, 0x00, 0x00

	arm_func_start ov02_0232FE1C
ov02_0232FE1C: @ 0x0232FE1C
	addlt fp, r2, r0, ror r5
	stmdavs r8, {r1, r3, fp, sp, lr} ^
	andls sb, r0, #0x180
	stmdavs r8!, {r0, ip, pc}
	bmi _026F8E34
	stcne p7, c1, [r3], #-0x304
	stmda r6!, {r5, r6, r8, sl, ip, sp, lr, pc}
	streq r0, [sl], r3, lsl #19
	stmibeq r8, {r0, r1, r4, r8, sb, lr}
	smlalttmi r1, r4, r6, r8
	bmi _02589FEC
	movwhs r1, #0x7c1
	ldmda sl, {r5, r6, r8, sl, ip, sp, lr, pc}
	streq r0, [sl], r3, lsl #19
	stmibeq r8, {r0, r1, r4, r8, sb, lr}
	strdmi r1, r2, [r4, #-0x82]
	mrshs sl, apsr
	arm_func_end ov02_0232FE1C
_0232FE60:
	.byte 0x23, 0x1C, 0x9F, 0xF7, 0x5A, 0xED, 0x02, 0xB0, 0x70, 0xBD, 0xC0, 0x46, 0x10, 0x62, 0xFF, 0x01

	arm_func_start ov02_0232FE70
ov02_0232FE70: @ 0x0232FE70
	stcls p5, c11, [r5, #-0xe0]
	eorvc sb, r5, r4, lsl #24
	arm_func_end ov02_0232FE70
_0232FE78:
	.byte 0x00, 0x94, 0x9F, 0xF7, 0x5E, 0xEA, 0x38, 0xBD

	arm_func_start ov02_0232FE80
ov02_0232FE80: @ 0x0232FE80
	andeq r4, r0, r0, ror r7
	arm_func_end ov02_0232FE80

	arm_func_start ov02_022CF1AC
ov02_022CF1AC: @ 0x0232FE84
	ldrmi r4, [r8, -r0, lsl #22]
	eoreq pc, ip, #172, #2
	arm_func_end ov02_022CF1AC

	arm_func_start ov02_0232FE8C
ov02_0232FE8C: @ 0x0232FE8C
	andvc r4, sl, r1, lsl #22
	arm_func_end ov02_0232FE8C
_0232FE90:
	.byte 0x18, 0x47, 0xC0, 0x46, 0xD8, 0xF1, 0x2C, 0x02

	arm_func_start ov02_022CE8D4
ov02_022CE8D4: @ 0x0232FE98
	ldrmi r4, [r8, -r0, lsl #22]
	eoreq pc, ip, #200, #6
	arm_func_end ov02_022CE8D4

	arm_func_start ov02_0232FEA0
ov02_0232FEA0: @ 0x0232FEA0
	arm_func_end ov02_0232FEA0
_0232FEA0:
	.byte 0x30, 0xB4, 0xFF, 0x23, 0x01, 0x06, 0x1B, 0x06, 0x0A, 0x1C, 0x04, 0x02, 0x19, 0x0A, 0x21, 0x40
	.byte 0x04, 0x0E, 0x24, 0x06, 0x25, 0x0E, 0x04, 0x0A, 0x18, 0x0C, 0x20, 0x40, 0x28, 0x43, 0x1A, 0x40
	.byte 0x08, 0x43, 0x10, 0x43, 0x30, 0xBC, 0x70, 0x47

	arm_func_start ov02_0232FEC8
ov02_0232FEC8: @ 0x0232FEC8
	streq r1, [sb], -r1, lsl #4
	andeq r0, r1, #10, #28
	andeq r2, r0, #0xff
	tstmi r0, #8
	arm_func_end ov02_0232FEC8
_0232FED8:
	.byte 0x00, 0x04, 0x00, 0x0C, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_0232FEE0
ov02_0232FEE0: @ 0x0232FEE0
	arm_func_end ov02_0232FEE0
_0232FEE0:
	.byte 0x30, 0xB4, 0xFF, 0x23, 0x01, 0x06, 0x1B, 0x06, 0x0A, 0x1C, 0x04, 0x02, 0x19, 0x0A, 0x21, 0x40
	.byte 0x04, 0x0E, 0x24, 0x06, 0x25, 0x0E, 0x04, 0x0A, 0x18, 0x0C, 0x20, 0x40, 0x28, 0x43, 0x1A, 0x40
	.byte 0x08, 0x43, 0x10, 0x43, 0x30, 0xBC, 0x70, 0x47

	arm_func_start ov02_0232FF08
ov02_0232FF08: @ 0x0232FF08
	streq r1, [sb], -r1, lsl #4
	andeq r0, r1, #10, #28
	andeq r2, r0, #0xff
	tstmi r0, #8
	arm_func_end ov02_0232FF08
_0232FF18:
	.byte 0x00, 0x04, 0x00, 0x0C, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_0232FF20
ov02_0232FF20: @ 0x0232FF20
	strpl r2, [r1], r0, lsl #4
	andle r2, r3, r0, lsl #18
	pkhtbpl r1, r1, r2, asr #0x18
	arm_func_end ov02_0232FF20
_0232FF2C:
	.byte 0x00, 0x29, 0xFB, 0xD1
	.byte 0x10, 0x1C, 0x70, 0x47

	arm_func_start ov02_0232FF34
ov02_0232FF34: @ 0x0232FF34
	addlt fp, r3, r8, lsl r5
	stmvs r0, {r1, r2, r4, fp, lr}
	tstle sl, r0, lsl #16
	stmdage r0, {sl, sp}
	andhs r1, ip, #0x2100
	arm_func_end ov02_0232FF34
_0232FF48:
	.byte 0xFF, 0xF7, 0x58, 0xFF, 0x00, 0xA8, 0x52, 0xF5
	.byte 0x52, 0xEC, 0x00, 0x28, 0x07, 0xD1, 0x00, 0x98, 0x80, 0x02, 0x21, 0x18, 0x01, 0x98, 0xC0, 0x00
	.byte 0x09, 0x18, 0x02, 0x98, 0x0C, 0x18, 0x0B, 0x48, 0x0B, 0x49, 0x84, 0x61, 0xC1, 0x61, 0x0B, 0x49
	.byte 0x01, 0x62, 0x01, 0x21, 0x81, 0x60, 0x07, 0x48, 0xC2, 0x69, 0x81, 0x69, 0x03, 0x6A, 0x51, 0x43
	.byte 0x59, 0x18, 0x81, 0x61, 0x06, 0x48, 0x09, 0x0C, 0x48, 0x43, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0C
	.byte 0x03, 0xB0, 0x18, 0xBD, 0x3C, 0x85, 0x35, 0x02, 0x65, 0x8B, 0x58, 0x5D, 0xC3, 0x9E, 0x26, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00

	arm_func_start ov02_0232FFA4
ov02_0232FFA4: @ 0x0232FFA4
	andvs r2, r1, r0, lsl #2
	sbchi r8, r1, r1, lsl #1
	andeq r4, r0, r0, ror r7
	arm_func_end ov02_0232FFA4

	arm_func_start ov02_0232FFB0
ov02_0232FFB0: @ 0x0232FFB0
	andhs r6, r1, r8
	ldrbmi r8, [r0, -r8, lsl #1]!
	arm_func_end ov02_0232FFB0

	arm_func_start ov02_0232FFB8
ov02_0232FFB8: @ 0x0232FFB8
	arm_func_end ov02_0232FFB8
_0232FFB8:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x68, 0x89, 0x0C, 0x1C
	.byte 0x21, 0x1D, 0x20, 0x60, 0x28, 0x1C, 0x0C, 0x30, 0x20, 0x22, 0x4C, 0xF5, 0x8A, 0xE9, 0xE8, 0x8E
	.byte 0x21, 0x1C, 0x30, 0x31, 0x60, 0x62, 0x28, 0x1D, 0x06, 0x22, 0x4C, 0xF5, 0x82, 0xE9, 0x00, 0x21
	.byte 0x17, 0x4A, 0x08, 0x1C, 0x80, 0x26, 0x2F, 0x8E, 0x13, 0x88, 0x3B, 0x42, 0x10, 0xD0, 0x97, 0x78
	.byte 0x63, 0x18, 0x3C, 0x33, 0x1F, 0x70, 0xEF, 0x8D, 0x13, 0x88, 0x3B, 0x42, 0x07, 0xD0, 0x63, 0x18
	.byte 0x3C, 0x33, 0x1B, 0x78, 0x1F, 0x1C, 0x63, 0x18, 0x37, 0x43, 0x3C, 0x33, 0x1F, 0x70, 0x49, 0x1C
	.byte 0x40, 0x1C, 0x12, 0x1D, 0x0C, 0x28, 0xE6, 0xDB, 0xA1, 0x63, 0x68, 0x8E, 0xE0, 0x64, 0xA9, 0x8D
	.byte 0x03, 0x20, 0x08, 0x40, 0x01, 0x28, 0x02, 0xD1, 0x01, 0x20, 0x20, 0x65, 0xF8, 0xBD, 0x02, 0x28
	.byte 0x02, 0xD1, 0x02, 0x20, 0x20, 0x65, 0xF8, 0xBD, 0x00, 0x20, 0x20, 0x65, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0xD8, 0x2F, 0x35, 0x02

	arm_func_start ov02_02330044
ov02_02330044: @ 0x02330044
	arm_func_end ov02_02330044
_02330044:
	.byte 0x38, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x00, 0x20, 0x0C, 0x31, 0x20, 0x22
	.byte 0x4C, 0xF5, 0x32, 0xE9, 0x28, 0x68, 0x21, 0x1C, 0x60, 0x81, 0x62, 0x89, 0x28, 0x1D, 0x0C, 0x31
	.byte 0x4C, 0xF5, 0x32, 0xEA, 0x38, 0xBD, 0x00, 0x00

	arm_func_start ov02_02330068
ov02_02330068: @ 0x02330068
	arm_func_end ov02_02330068
_02330068:
	.byte 0x03, 0x1C, 0x08, 0x1C, 0x1A, 0x60, 0x19, 0x1D
	.byte 0x00, 0x4B, 0x18, 0x47, 0xB9, 0xFF, 0x32, 0x02, 0x02, 0x4B, 0x01, 0x1C, 0x02, 0x48, 0x00, 0x22
	.byte 0x18, 0x47, 0xC0, 0x46, 0xE0, 0x9D, 0x07, 0x02, 0x40, 0x93, 0x35, 0x02, 0x02, 0x4B, 0x01, 0x1C
	.byte 0x02, 0x48, 0x00, 0x22, 0x18, 0x47, 0xC0, 0x46, 0xE0, 0x9D, 0x07, 0x02, 0x40, 0x93, 0x35, 0x02

	thumb_func_start ov02_023300A0
ov02_023300A0: @ 0x023300A0
	thumb_func_end ov02_023300A0
_023300A0:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x0E, 0x1C, 0x2A, 0x48, 0x2A, 0x49, 0x04, 0x22, 0x01, 0x24, 0x49, 0xF5
	.byte 0x84, 0xEE, 0x00, 0x2D, 0x01, 0xD0, 0x00, 0x2E, 0x02, 0xD1, 0x00, 0x20, 0xC0, 0x43, 0xF8, 0xBD
	.byte 0x4B, 0xF5, 0x90, 0xEB, 0x24, 0x49, 0x0D, 0x60, 0xCE, 0x60, 0x4B, 0xF5, 0x96, 0xEB, 0x22, 0x49
	.byte 0x22, 0x48, 0x09, 0x68, 0x88, 0x47, 0x01, 0x1C, 0x1F, 0x48, 0x81, 0x60, 0x01, 0xD1, 0xA0, 0x1E
	.byte 0xF8, 0xBD, 0x1F, 0x48, 0x1D, 0x4A, 0x00, 0xF0, 0x29, 0xFD, 0x00, 0x28, 0x00, 0xD1, 0x00, 0x24
	.byte 0x00, 0x2C, 0x25, 0xD0, 0x16, 0x4D, 0x00, 0xAE, 0x01, 0x27, 0x28, 0x1C, 0x31, 0x1C, 0x3A, 0x1C
	.byte 0x49, 0xF5, 0xB8, 0xEE, 0x00, 0x98, 0x0F, 0x28, 0x17, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88
	.byte 0x00, 0x04, 0x00, 0x14, 0x87, 0x44, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x24, 0x00
	.byte 0x24, 0x00, 0x1E, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x22, 0x00
	.byte 0x22, 0x00, 0x22, 0x00, 0x22, 0x00, 0x00, 0x20, 0xF8, 0xBD, 0x00, 0x24, 0x00, 0x2C, 0xDC, 0xD1
	.byte 0x05, 0x49, 0x88, 0x68, 0xC9, 0x68, 0x88, 0x47, 0x00, 0x20, 0xC0, 0x43, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0x40, 0x93, 0x35, 0x02, 0x30, 0x93, 0x35, 0x02, 0x20, 0x93, 0x35, 0x02, 0x90, 0x58, 0x00, 0x00
	.byte 0x79, 0x00, 0x33, 0x02

	thumb_func_start ov02_02330164
ov02_02330164: @ 0x02330164
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _023301F4 @ =0x02359320
	movs r4, #1
	ldr r0, [r0, #0xc]
	subs r5, r4, #2
	cmp r0, #0
	bne FUN_02330176
	adds r0, r5, #0
	thumb_func_end ov02_02330164
_02330174:
	.byte 0xF8, 0xBD, 0x00, 0xF0, 0x73, 0xFC, 0x00, 0x28, 0x01, 0xD1, 0xA0, 0x1E
	.byte 0xF8, 0xBD, 0x1D, 0x4F, 0x1B, 0x4E, 0x38, 0x1C, 0x00, 0xA9, 0x01, 0x22, 0x49, 0xF5, 0x72, 0xEE
	.byte 0x00, 0x98, 0x14, 0x28, 0x20, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14
	.byte 0x87, 0x44, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x36, 0x00, 0x36, 0x00, 0x34, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x28, 0x00, 0xB0, 0x68, 0x00, 0x24
	.byte 0xF1, 0x68, 0x25, 0x1C, 0x88, 0x47, 0x00, 0xE0, 0x00, 0x24, 0x00, 0x2C, 0xD3, 0xD1, 0x4B, 0xF5
	.byte 0x02, 0xEB, 0x04, 0x49, 0x00, 0x22, 0x0A, 0x60, 0xCA, 0x60, 0x4B, 0xF5, 0x06, 0xEB, 0x28, 0x1C
	.byte 0xF8, 0xBD, 0xC0, 0x46, 0x20, 0x93, 0x35, 0x02, 0x40, 0x93, 0x35, 0x02

	arm_func_start ov02_023301FC
ov02_023301FC: @ 0x023301FC
	strhs fp, [r0, #-0x5f8]
	arm_func_end ov02_023301FC
_02330200:
	.byte 0xED, 0x43, 0x00, 0xF0, 0x11, 0xFC, 0x00, 0x28, 0x10, 0xD0, 0x09, 0x4C, 0x00, 0xAE, 0x01, 0x27
	.byte 0x20, 0x1C, 0x31, 0x1C, 0x3A, 0x1C, 0x49, 0xF5, 0x2E, 0xEE, 0x00, 0x98, 0x0E, 0x28, 0x02, 0xD1
	.byte 0x00, 0x20, 0x05, 0x1C, 0x00, 0xE0, 0x00, 0x20, 0x00, 0x28, 0xF1, 0xD1, 0x28, 0x1C, 0xF8, 0xBD
	.byte 0x40, 0x93, 0x35, 0x02

	arm_func_start ov02_02330234
ov02_02330234: @ 0x02330234
	ldrshlt fp, [r1], r0
	andhs sb, r0, r1
	andls r4, r4, r0, asr #7
	andls r2, r3, r1
	ldmdami r4, {sb, sl, sp} ^
	stmdavs r1, {r0, r1, r2, r4, r5, sl, fp, ip}
	stmdbhs r0, {r0, r2, r4, r5, sl, fp, ip}
	stmvs r0, {r1, ip, lr, pc} ^
	mrsle r2, apsr
	andslt r2, r1, r0
	ldcllt p3, c4, [r0, #0x300]!
	movweq r2, #3
	arm_func_end ov02_02330234
_02330264:
	.byte 0x88, 0x47, 0x04, 0x1C, 0x02, 0xD1, 0x11, 0xB0, 0x70, 0x1E, 0xF0, 0xBD
	.byte 0x30, 0x1C, 0x4A, 0x4B, 0x01, 0x1C, 0x02, 0x1C, 0x02, 0x94, 0x00, 0xF0, 0x3F, 0xFB, 0x00, 0x28
	.byte 0x00, 0xD1, 0x81, 0xE0, 0x06, 0xA8, 0x4A, 0xF5, 0xDC, 0xEE, 0x13, 0x20, 0x00, 0x90, 0x44, 0x49
	.byte 0x44, 0x4B, 0x06, 0xA8, 0x32, 0x1C, 0x4A, 0xF5, 0x72, 0xEF, 0x43, 0x48, 0x05, 0xA9, 0x01, 0x22
	.byte 0x49, 0xF5, 0xE8, 0xED, 0x05, 0x98, 0x13, 0x28, 0x61, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88
	.byte 0x00, 0x04, 0x00, 0x14, 0x87, 0x44, 0xB6, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0x6C, 0x00
	.byte 0x44, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0x6C, 0x00, 0xB6, 0x00, 0x66, 0x00, 0xB6, 0x00, 0xB6, 0x00
	.byte 0xB6, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0xB6, 0x00, 0x6C, 0x00, 0x26, 0x00, 0x00, 0x2E
	.byte 0x20, 0xD1, 0x00, 0x2D, 0x04, 0xD0, 0x20, 0x1C, 0x40, 0x21, 0x00, 0xF0, 0xE5, 0xFA, 0x07, 0x1C
	.byte 0x00, 0xF0, 0x7C, 0xFB, 0x00, 0x28, 0x3A, 0xD0, 0x01, 0x26, 0x13, 0xE0, 0x00, 0x2E, 0x11, 0xD1
	.byte 0x08, 0x2D, 0x01, 0xDA, 0x6D, 0x1C, 0x0D, 0xE0, 0x20, 0x1C, 0x40, 0x21, 0x00, 0xF0, 0xD4, 0xFA
	.byte 0x07, 0x1C, 0x00, 0xF0, 0x6B, 0xFB, 0x00, 0x28, 0x29, 0xD0, 0x01, 0x26, 0x02, 0xE0, 0x00, 0x20
	.byte 0x03, 0x90, 0x04, 0x90, 0x03, 0x98, 0x00, 0x28, 0xB7, 0xD1, 0x00, 0x2F, 0x09, 0xD0, 0x79, 0x1E
	.byte 0x54, 0x20, 0x48, 0x43, 0x18, 0x49, 0x58, 0x30, 0x09, 0x68, 0x88, 0x47, 0x00, 0x28, 0x06, 0xD1
	.byte 0x15, 0xE0, 0x15, 0x49, 0x58, 0x20, 0x09, 0x68, 0x88, 0x47, 0x00, 0x28, 0x0F, 0xD0, 0x01, 0x99
	.byte 0x00, 0x26, 0x08, 0x60, 0x07, 0x60, 0x00, 0x2F, 0x09, 0xDD, 0x05, 0x1D, 0x20, 0x1C, 0x29, 0x1C
	.byte 0xFF, 0xF7, 0x2A, 0xFE, 0x76, 0x1C, 0xC0, 0x34, 0x54, 0x35, 0xBE, 0x42, 0xF6, 0xDB, 0x06, 0xA8
	.byte 0x4A, 0xF5, 0x3A, 0xEF, 0x0C, 0x4D, 0x05, 0xAC, 0x00, 0x26, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C
	.byte 0x49, 0xF5, 0x78, 0xED, 0x01, 0x28, 0xF8, 0xD0, 0x03, 0x49, 0x02, 0x98, 0xC9, 0x68, 0x88, 0x47
	.byte 0x04, 0x98, 0x11, 0xB0, 0xF0, 0xBD, 0xC0, 0x46, 0x20, 0x93, 0x35, 0x02, 0xFE, 0xBF, 0x30, 0x00
	.byte 0x42, 0xEC, 0x3F, 0x00, 0x8D, 0x00, 0x33, 0x02, 0x40, 0x93, 0x35, 0x02

	arm_func_start ov02_023303AC
ov02_023303AC: @ 0x023303AC
	ldrshlt fp, [r0], r8
	arm_func_end ov02_023303AC
_023303B0:
	.byte 0x01, 0x24, 0x07, 0x1C, 0xA0, 0x1E, 0x03, 0x90, 0x78, 0x6A, 0x00, 0x26, 0x01, 0x91, 0x00, 0x28
	.byte 0x01, 0xD1, 0xE5, 0x04, 0x03, 0xE0, 0x01, 0x28, 0x01, 0xD1, 0x03, 0x25, 0xAD, 0x04, 0x03, 0x20
	.byte 0x00, 0x04, 0x05, 0x43, 0x62, 0x48, 0x00, 0x21, 0x60, 0x22, 0x4C, 0xF5, 0x18, 0xE8, 0xB8, 0x6A
	.byte 0x05, 0x28, 0x03, 0xD1, 0x5E, 0x48, 0x01, 0x21, 0x01, 0x70, 0x0F, 0xE0, 0x0D, 0x28, 0x03, 0xD1
	.byte 0x5B, 0x48, 0x02, 0x21, 0x01, 0x70, 0x09, 0xE0, 0x10, 0x28, 0x03, 0xD1, 0x58, 0x48, 0x03, 0x21
	.byte 0x01, 0x70, 0x03, 0xE0, 0x00, 0x20, 0x10, 0xB0, 0xC0, 0x43, 0xF8, 0xBD, 0x14, 0x21, 0x54, 0x4A
	.byte 0x71, 0x43, 0x89, 0x1C, 0x38, 0x1C, 0x56, 0x70, 0x51, 0x18, 0xBA, 0x6A, 0x2C, 0x30, 0x4C, 0xF5
	.byte 0x54, 0xE8, 0xA6, 0xF7, 0xDC, 0xEB, 0x3A, 0x68, 0x4E, 0x4B, 0x00, 0x20, 0x39, 0x1D, 0x00, 0xF0
	.byte 0x65, 0xFA, 0x00, 0x28, 0x00, 0xD1, 0x86, 0xE0, 0x00, 0x20, 0x02, 0x90, 0x05, 0xA8, 0x4A, 0xF5
	.byte 0x00, 0xEE, 0x12, 0x20, 0x00, 0x90, 0x48, 0x49, 0x48, 0x4B, 0x05, 0xA8, 0x00, 0x22, 0x4A, 0xF5
	.byte 0x96, 0xEE, 0x69, 0xE0, 0x46, 0x48, 0x04, 0xA9, 0x01, 0x22, 0x49, 0xF5, 0x0C, 0xED, 0x04, 0x98
	.byte 0x13, 0x28, 0x60, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14, 0x87, 0x44
	.byte 0xB4, 0x00, 0xB4, 0x00, 0xB4, 0x00, 0xB4, 0x00, 0xB6, 0x00, 0x2E, 0x00, 0xB4, 0x00, 0xB4, 0x00
	.byte 0xB6, 0x00, 0xB4, 0x00, 0x74, 0x00, 0xB4, 0x00, 0x8E, 0x00, 0x94, 0x00, 0xB4, 0x00, 0xB4, 0x00
	.byte 0xB4, 0x00, 0xB4, 0x00, 0x26, 0x00, 0x2C, 0x00, 0x00, 0x2E, 0x45, 0xD1, 0x00, 0x24, 0x43, 0xE0
	.byte 0x00, 0x2E, 0x41, 0xD1, 0x05, 0xA8, 0x4A, 0xF5, 0xA0, 0xEE, 0x32, 0x48, 0x01, 0x21, 0x00, 0xF0
	.byte 0x03, 0xFA, 0x01, 0x28, 0x01, 0xD0, 0x00, 0x24, 0x36, 0xE0, 0x2E, 0x49, 0x38, 0x1C, 0xFF, 0xF7
	.byte 0xC1, 0xFD, 0x2D, 0x49, 0x00, 0x20, 0x49, 0x89, 0x00, 0xE0, 0x40, 0x1C, 0x88, 0x42, 0xFC, 0xDB
	.byte 0x28, 0x48, 0x23, 0x49, 0x2A, 0x1C, 0x00, 0xF0, 0xEF, 0xFA, 0x00, 0x28, 0x01, 0xD1, 0x00, 0x24
	.byte 0x22, 0xE0, 0x01, 0x26, 0x20, 0xE0, 0x23, 0x49, 0x38, 0x1C, 0xFF, 0xF7, 0xAB, 0xFD, 0x21, 0x48
	.byte 0x1B, 0x49, 0x2A, 0x1C, 0x00, 0xF0, 0xE0, 0xFA, 0x00, 0x28, 0x15, 0xD1, 0x00, 0x24, 0x13, 0xE0
	.byte 0x00, 0x24, 0x03, 0x94, 0x10, 0xE0, 0x02, 0x98, 0x40, 0x1C, 0x02, 0x90, 0x03, 0x28, 0x08, 0xDA
	.byte 0x18, 0x48, 0x13, 0x49, 0x2A, 0x1C, 0x00, 0xF0, 0xCF, 0xFA, 0x00, 0x28, 0x04, 0xD1, 0x00, 0x24
	.byte 0x02, 0xE0, 0x00, 0x24, 0x00, 0xE0, 0x00, 0x24, 0x00, 0x2C, 0x93, 0xD1, 0x05, 0xA8, 0x4A, 0xF5
	.byte 0x5C, 0xEE, 0x0F, 0x4D, 0x04, 0xAC, 0x00, 0x26, 0x28, 0x1C, 0x21, 0x1C, 0x32, 0x1C, 0x49, 0xF5
	.byte 0x9A, 0xEC, 0x01, 0x28, 0xF8, 0xD0, 0x03, 0x98, 0x00, 0x28, 0x01, 0xD1, 0x01, 0x22, 0x00, 0xE0
	.byte 0x00, 0x22, 0x01, 0x98, 0x07, 0x49, 0xFF, 0xF7, 0x87, 0xFD, 0x03, 0x98, 0x10, 0xB0, 0xF8, 0xBD
	.byte 0x20, 0x94, 0x35, 0x02, 0xFE, 0xBF, 0x30, 0x00, 0x42, 0xEC, 0x3F, 0x00, 0x8D, 0x00, 0x33, 0x02
	.byte 0x40, 0x93, 0x35, 0x02, 0x60, 0x93, 0x35, 0x02, 0x60, 0x93, 0x35, 0x02

	arm_func_start ov02_02079B14
ov02_02079B14: @ 0x0233057C
	ldrmi r4, [r8, -r0, lsl #22]
	andeq sb, r7, #20, #22
	arm_func_end ov02_02079B14

	arm_func_start ov02_02330584
ov02_02330584: @ 0x02330584
	stmdbmi r3, {r3, r8, sl, ip, sp, pc}
	stmdbhs r0, {r0, r3, r6, fp, sp, lr}
	strmi sp, [r8, r0]
	stclt p0, c2, [r8, #-0]
	eorseq sb, r5, #32, #6
	stmdahs r0, {r3, r8, sl, ip, sp, pc}
	cmp r3, r0, lsl #2
	.word 0x5E422100
	stmdble r0, {r0, r1, r2, sb, fp, sp}
	ldmne r2, {r0, r1, r2, r6, r8, sp, lr, pc}
	ldmhi r2, {r1, r3, r4, r5, r6, sl, lr} ^
	ldrne r0, [r2], #-0x412
	addeq r4, r2, #0x97000000
	eorseq r0, r6, #0xe
	rscseq r0, r2, lr, lsl #1
	orrseq r0, r2, r0, asr #1
	andhs r0, r2, #0xe0000006
	stmdahs r0, {r7, sb, sl, fp, ip, lr}
	bmi _00B24A98
	stmdahs r4, {r4, r7, r8, fp, sp, lr}
	andhs sp, r3, r7, lsl #2
	ldmibvs r2, {r4, r7, r8, sp, lr} ^
	eorle r2, lr, r0, lsl #20
	ldrmi r2, [r0, r6]
	stmdahs r6, {r3, r8, sl, fp, ip, sp, pc}
	ldmdbvs r0, {r4, r8, ip, lr, pc}
	ldmdavs r2, {r0, r4, r6, r8, fp, sp, lr} ^
	ldcl p7, c15, [r0], #-0x290
	eorle r2, r2, r3, lsl #16
	.word 0x21034894
	stmibvs r2, {r0, r7, r8, sp, lr} ^
	andsle r2, ip, r0, lsl #20
	arm_func_end ov02_02330584
_02330604:
	.byte 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x08, 0x28, 0x16, 0xD1
	.byte 0x10, 0x6A, 0x51, 0x6A, 0xD2, 0x68, 0xA4, 0xF7, 0x7C, 0xED, 0x03, 0x28, 0x0F, 0xD0, 0x8B, 0x48
	.byte 0x03, 0x21, 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x09, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47
	.byte 0x08, 0xBD, 0x86, 0x48, 0x01, 0x23, 0x83, 0x61, 0xC3, 0x69, 0x00, 0x2B, 0x00, 0xD1, 0x03, 0xE1
	.byte 0x10, 0x1C, 0x98, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x0B, 0xD1, 0x7F, 0x48
	.byte 0x82, 0x69, 0x06, 0x2A, 0x75, 0xD1, 0x05, 0x22, 0x82, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x70, 0xD0
	.byte 0x08, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x79, 0x48, 0x03, 0x22, 0x82, 0x61, 0xC2, 0x69, 0x00, 0x2A
	.byte 0x67, 0xD0, 0x09, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x0B, 0xD1
	.byte 0x72, 0x48, 0x82, 0x69, 0x08, 0x2A, 0x5C, 0xD1, 0x07, 0x22, 0x82, 0x61, 0xC2, 0x69, 0x00, 0x2A
	.byte 0x57, 0xD0, 0x0C, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x6C, 0x48, 0x03, 0x22, 0x82, 0x61, 0xC2, 0x69
	.byte 0x00, 0x2A, 0x4E, 0xD0, 0x0D, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28
	.byte 0x41, 0xD1, 0x66, 0x4A, 0x90, 0x69, 0x04, 0x28, 0x07, 0xD1, 0x03, 0x20, 0x90, 0x61, 0xD2, 0x69
	.byte 0x00, 0x2A, 0x3E, 0xD0, 0x0A, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x06, 0x28, 0x10, 0xD1, 0x10, 0x69
	.byte 0x51, 0x69, 0x52, 0x68, 0xA4, 0xF7, 0xFE, 0xEB, 0x03, 0x28, 0x32, 0xD0, 0x5B, 0x48, 0x03, 0x21
	.byte 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x2C, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x02, 0x28, 0x0D, 0xD1, 0xA4, 0xF7, 0x76, 0xEB, 0x03, 0x28, 0x22, 0xD0, 0x53, 0x48, 0x03, 0x21
	.byte 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x1C, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x08, 0x28, 0x16, 0xD1, 0x10, 0x6A, 0x51, 0x6A, 0xD2, 0x68, 0xA4, 0xF7, 0xFA, 0xEC, 0x03, 0x28
	.byte 0x0F, 0xD0, 0x4A, 0x48, 0x03, 0x21, 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x09, 0xD0, 0x02, 0x20
	.byte 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x45, 0x48, 0x03, 0x22, 0x82, 0x61, 0xC2, 0x69, 0x00, 0x2A
	.byte 0x00, 0xD1, 0x81, 0xE0, 0x0B, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28
	.byte 0x44, 0xD1, 0x3E, 0x4A, 0x90, 0x69, 0x04, 0x28, 0x07, 0xD1, 0x03, 0x20, 0x90, 0x61, 0xD2, 0x69
	.byte 0x00, 0x2A, 0x71, 0xD0, 0x0E, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x06, 0x28, 0x10, 0xD1, 0x10, 0x69
	.byte 0x51, 0x69, 0x52, 0x68, 0xA4, 0xF7, 0xAE, 0xEB, 0x03, 0x28, 0x65, 0xD0, 0x33, 0x48, 0x03, 0x21
	.byte 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x5F, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x02, 0x28, 0x0D, 0xD1, 0xA4, 0xF7, 0x26, 0xEB, 0x03, 0x28, 0x55, 0xD0, 0x2B, 0x48, 0x03, 0x21
	.byte 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x4F, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x08, 0x28, 0x10, 0xD1, 0x10, 0x6A, 0x51, 0x6A, 0xD2, 0x68, 0xA4, 0xF7, 0xAA, 0xEC, 0x03, 0x28
	.byte 0x42, 0xD0, 0x22, 0x48, 0x03, 0x21, 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x3C, 0xD0, 0x02, 0x20
	.byte 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x03, 0x20, 0x90, 0x61, 0x08, 0xBD, 0x1B, 0x48, 0x03, 0x22
	.byte 0x82, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x2F, 0xD0, 0x0F, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22
	.byte 0x80, 0x5E, 0x00, 0x28, 0x0E, 0xD1, 0x15, 0x48, 0x80, 0x69, 0x02, 0x28, 0x24, 0xD1, 0xA4, 0xF7
	.byte 0xC4, 0xE9, 0x12, 0x48, 0x00, 0x21, 0x81, 0x61, 0xC2, 0x69, 0x00, 0x2A, 0x1C, 0xD0, 0x14, 0x20
	.byte 0x90, 0x47, 0x08, 0xBD, 0x0D, 0x48, 0x03, 0x23, 0x83, 0x61, 0xC3, 0x69, 0x00, 0x2B, 0x13, 0xD0
	.byte 0x10, 0x1C, 0x98, 0x47, 0x08, 0xBD, 0x09, 0x48, 0x82, 0x69, 0x05, 0x2A, 0x0C, 0xD1, 0xC2, 0x69
	.byte 0x00, 0x2A, 0x09, 0xD0, 0x05, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x04, 0x48, 0xC2, 0x69, 0x00, 0x2A
	.byte 0x02, 0xD0, 0x01, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0xC0, 0x46, 0x80, 0x94, 0x35, 0x02

	arm_func_start ov02_02330850
ov02_02330850: @ 0x02330850
	ldmdbmi r7, {r3, r8, sl, ip, sp, pc}
	stmdahs r8, {r3, r7, r8, fp, sp, lr}
	stmdane r0, {r0, r2, r5, fp, ip, lr, pc}
	stmhi r0, {r3, r4, r5, r6, sl, lr} ^
	strne r0, [r0], #-0x400
	eorseq r4, lr, r7, lsl #9
	eorseq r0, lr, lr, lsr #32
	eorseq r0, lr, lr, lsr r0
	eorseq r0, lr, r0, lsl r0
	eorseq r0, lr, r2, lsr #32
	arm_func_end ov02_02330850
_02330878:
	.byte 0x00, 0x20, 0x01, 0x1C, 0x02, 0x1C, 0xA4, 0xF7
	.byte 0x2A, 0xEB, 0x03, 0x28, 0x11, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0xA4, 0xF7, 0x44, 0xED, 0x03, 0x28
	.byte 0x0B, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0x88, 0x68, 0x06, 0x49, 0xA4, 0xF7, 0xA2, 0xE9, 0x03, 0x28
	.byte 0x03, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0x00, 0x20, 0x08, 0xBD, 0x01, 0x20, 0x08, 0xBD, 0xC0, 0x46
	.byte 0x80, 0x94, 0x35, 0x02, 0x99, 0x05, 0x33, 0x02

	arm_func_start ov02_023308B8
ov02_023308B8: @ 0x023308B8
	arm_func_end ov02_023308B8
_023308B8:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x01, 0x20, 0x0F, 0x1C
	.byte 0xA6, 0xF7, 0xE2, 0xE9, 0xA6, 0xF7, 0xB4, 0xE9, 0x06, 0x1C, 0x00, 0x2E, 0x10, 0xDD, 0x00, 0x24
	.byte 0x00, 0x2E, 0x0D, 0xDD, 0xBC, 0x42, 0x0B, 0xDA, 0x20, 0x04, 0x00, 0x0C, 0xA6, 0xF7, 0x12, 0xEA
	.byte 0x29, 0x1C, 0xC0, 0x22, 0x4B, 0xF5, 0x24, 0xED, 0x64, 0x1C, 0xC0, 0x35, 0xB4, 0x42, 0xF1, 0xDB
	.byte 0x00, 0x20, 0xA6, 0xF7, 0xCA, 0xE9, 0x30, 0x1C, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_023308FC
ov02_023308FC: @ 0x023308FC
	movwls fp, #0x5f8
	arm_func_end ov02_023308FC
_02330900:
	.byte 0x05, 0x1C, 0x0C, 0x1C, 0x16, 0x1C, 0x4A, 0xF5, 0x6E, 0xEF, 0x07, 0x1C, 0x32, 0x49, 0x00, 0x98
	.byte 0x00, 0x2D, 0x48, 0x60, 0x0C, 0xD0, 0x31, 0x4A, 0x00, 0x21, 0x28, 0x78, 0x49, 0x1C, 0x6D, 0x1C
	.byte 0x10, 0x70, 0x52, 0x1C, 0x06, 0x29, 0xF8, 0xDB, 0x2C, 0x49, 0x2B, 0x48, 0x01, 0x61, 0x07, 0xE0
	.byte 0x2A, 0x48, 0xFF, 0x21, 0x06, 0x22, 0x4B, 0xF5, 0x6A, 0xED, 0x29, 0x49, 0x26, 0x48, 0x01, 0x61
	.byte 0x00, 0x2C, 0x1C, 0xD0, 0x00, 0x2E, 0x1A, 0xDD, 0x20, 0x2E, 0x18, 0xDC, 0x00, 0x20, 0x00, 0x2E
	.byte 0x07, 0xDD, 0x24, 0x4A, 0x21, 0x78, 0x40, 0x1C, 0x64, 0x1C, 0x11, 0x70, 0x52, 0x1C, 0xB0, 0x42
	.byte 0xF8, 0xDB, 0x20, 0x28, 0x07, 0xDA, 0x1F, 0x49, 0x0A, 0x18, 0x00, 0x21, 0x40, 0x1C, 0x11, 0x70
	.byte 0x52, 0x1C, 0x20, 0x28, 0xFA, 0xDB, 0x1B, 0x49, 0x17, 0x48, 0x41, 0x61, 0x07, 0xE0, 0x19, 0x48
	.byte 0xFF, 0x21, 0x20, 0x22, 0x4B, 0xF5, 0x42, 0xED, 0x17, 0x49, 0x13, 0x48, 0x41, 0x61, 0x12, 0x4A
	.byte 0x90, 0x69, 0x03, 0x28, 0x0E, 0xD1, 0x10, 0x69, 0x51, 0x69, 0x52, 0x68, 0xA4, 0xF7, 0x9A, 0xEA
	.byte 0x03, 0x28, 0x13, 0xD1, 0x0C, 0x48, 0x06, 0x21, 0x81, 0x61, 0x38, 0x1C, 0x4A, 0xF5, 0x24, 0xEF
	.byte 0x01, 0x20, 0xF8, 0xBD, 0xFF, 0xF7, 0x4C, 0xFF, 0x01, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x06, 0x21
	.byte 0x81, 0x61, 0x38, 0x1C, 0x4A, 0xF5, 0x18, 0xEF, 0x01, 0x20, 0xF8, 0xBD, 0x38, 0x1C, 0x4A, 0xF5
	.byte 0x14, 0xEF, 0x00, 0x20, 0xF8, 0xBD, 0xC0, 0x46, 0x80, 0x94, 0x35, 0x02, 0xA8, 0x94, 0x35, 0x02
	.byte 0x58, 0x81, 0x31, 0x02, 0xB0, 0x94, 0x35, 0x02, 0x60, 0x81, 0x31, 0x02

	arm_func_start ov02_023309EC
ov02_023309EC: @ 0x023309EC
	arm_func_end ov02_023309EC
_023309EC:
	.byte 0x10, 0xB5, 0x4A, 0xF5
	.byte 0xFA, 0xEE, 0x04, 0x1C, 0x0B, 0x48, 0x80, 0x69, 0x05, 0x28, 0x0E, 0xD1, 0x00, 0x20, 0x01, 0x1C
	.byte 0x02, 0x1C, 0xA4, 0xF7, 0x68, 0xEA, 0x03, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x04, 0x21, 0x81, 0x61
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0xF2, 0xEE, 0x01, 0x20, 0x10, 0xBD, 0x20, 0x1C, 0x4A, 0xF5, 0xEC, 0xEE
	.byte 0x00, 0x20, 0x10, 0xBD, 0x80, 0x94, 0x35, 0x02

	arm_func_start ov02_02330A28
ov02_02330A28: @ 0x02330A28
	arm_func_end ov02_02330A28
_02330A28:
	.byte 0x10, 0xB5, 0x4A, 0xF5, 0xDC, 0xEE, 0x04, 0x1C
	.byte 0x0A, 0x48, 0x80, 0x69, 0x07, 0x28, 0x0B, 0xD1, 0xA4, 0xF7, 0x6C, 0xEC, 0x03, 0x28, 0x07, 0xD1
	.byte 0x06, 0x48, 0x04, 0x21, 0x81, 0x61, 0x20, 0x1C, 0x4A, 0xF5, 0xD6, 0xEE, 0x01, 0x20, 0x10, 0xBD
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0xD2, 0xEE, 0x00, 0x20, 0x10, 0xBD, 0xC0, 0x46, 0x80, 0x94, 0x35, 0x02

	arm_func_start ov02_02330A60
ov02_02330A60: @ 0x02330A60
	arm_func_end ov02_02330A60
_02330A60:
	.byte 0x10, 0xB5, 0x4A, 0xF5, 0xC0, 0xEE, 0x04, 0x1C, 0x12, 0x48, 0x80, 0x69, 0x03, 0x28, 0x10, 0xD1
	.byte 0xA4, 0xF7, 0xB8, 0xE9, 0x03, 0x28, 0x04, 0xD0, 0x20, 0x1C, 0x4A, 0xF5, 0xBE, 0xEE, 0x00, 0x20
	.byte 0x10, 0xBD, 0x0C, 0x48, 0x02, 0x21, 0x81, 0x61, 0x20, 0x1C, 0x4A, 0xF5, 0xB6, 0xEE, 0x01, 0x20
	.byte 0x10, 0xBD, 0xFF, 0xF7, 0xDD, 0xFE, 0x01, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x02, 0x21, 0x81, 0x61
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0xAA, 0xEE, 0x01, 0x20, 0x10, 0xBD, 0x20, 0x1C, 0x4A, 0xF5, 0xA4, 0xEE
	.byte 0x00, 0x20, 0x10, 0xBD, 0x80, 0x94, 0x35, 0x02

	arm_func_start ov02_02330AB8
ov02_02330AB8: @ 0x02330AB8
	arm_func_end ov02_02330AB8
_02330AB8:
	.byte 0xF8, 0xB5, 0x07, 0x1C, 0x0D, 0x1C, 0x16, 0x1C
	.byte 0x4A, 0xF5, 0x90, 0xEE, 0x1C, 0x49, 0x04, 0x1C, 0xCE, 0x60, 0x00, 0x2D, 0x05, 0xD0, 0x49, 0x6A
	.byte 0x28, 0x1C, 0x50, 0x22, 0x4B, 0xF5, 0xF8, 0xEC, 0x04, 0xE0, 0x48, 0x6A, 0x00, 0x21, 0x50, 0x22
	.byte 0x4B, 0xF5, 0x94, 0xEC, 0x14, 0x49, 0x38, 0x1C, 0x09, 0x6A, 0xC0, 0x22, 0x4B, 0xF5, 0x20, 0xEC
	.byte 0xFF, 0xF7, 0xAE, 0xFE, 0x01, 0x28, 0x07, 0xD1, 0x0F, 0x48, 0x08, 0x21, 0x81, 0x61, 0x20, 0x1C
	.byte 0x4A, 0xF5, 0x7A, 0xEE, 0x01, 0x20, 0xF8, 0xBD, 0x0B, 0x4A, 0x90, 0x69, 0x03, 0x28, 0x0E, 0xD1
	.byte 0x10, 0x6A, 0x51, 0x6A, 0xD2, 0x68, 0xA4, 0xF7, 0xFC, 0xEA, 0x03, 0x28, 0x07, 0xD1, 0x06, 0x48
	.byte 0x08, 0x21, 0x81, 0x61, 0x20, 0x1C, 0x4A, 0xF5, 0x68, 0xEE, 0x01, 0x20, 0xF8, 0xBD, 0x20, 0x1C
	.byte 0x4A, 0xF5, 0x62, 0xEE, 0x00, 0x20, 0xF8, 0xBD, 0x80, 0x94, 0x35, 0x02

	arm_func_start ov02_02330B3C
ov02_02330B3C: @ 0x02330B3C
	arm_func_end ov02_02330B3C
_02330B3C:
	.byte 0xF8, 0xB5, 0x0D, 0x1C
	.byte 0x07, 0x1C, 0x00, 0x92, 0x4A, 0xF5, 0x4E, 0xEE, 0x04, 0x1C, 0x28, 0x1C, 0x26, 0x4A, 0x53, 0x30
	.byte 0x03, 0x21, 0x88, 0x43, 0x06, 0x1C, 0x55, 0x62, 0x2F, 0x36, 0x1F, 0x21, 0x23, 0x4B, 0x90, 0x60
	.byte 0x8E, 0x43, 0x16, 0x60, 0xF6, 0x18, 0x8E, 0x43, 0x16, 0x62, 0xDF, 0x36, 0x8E, 0x43, 0x46, 0x60
	.byte 0x00, 0x99, 0x90, 0x68, 0x6D, 0x18, 0x41, 0x68, 0x69, 0x1A, 0x81, 0x60, 0x90, 0x68, 0x00, 0x21
	.byte 0xC1, 0x60, 0x90, 0x68, 0x03, 0x21, 0x01, 0x60, 0xD7, 0x61, 0x90, 0x69, 0x00, 0x28, 0x0E, 0xD1
	.byte 0x1F, 0x3B, 0x10, 0x68, 0x19, 0x1C, 0xA3, 0xF7, 0x6C, 0xEF, 0x00, 0x28, 0x04, 0xD0, 0x20, 0x1C
	.byte 0x4A, 0xF5, 0x2A, 0xEE, 0x00, 0x20, 0xF8, 0xBD, 0x0F, 0x48, 0x01, 0x21, 0x81, 0x61, 0x0E, 0x48
	.byte 0x81, 0x69, 0x01, 0x29, 0x12, 0xD1, 0x80, 0x68, 0x0D, 0x49, 0xA4, 0xF7, 0x12, 0xE8, 0x03, 0x28
	.byte 0x04, 0xD0, 0x20, 0x1C, 0x4A, 0xF5, 0x18, 0xEE, 0x00, 0x20, 0xF8, 0xBD, 0x06, 0x48, 0x04, 0x21
	.byte 0x81, 0x61, 0x20, 0x1C, 0x4A, 0xF5, 0x10, 0xEE, 0x01, 0x20, 0xF8, 0xBD, 0x20, 0x1C, 0x4A, 0xF5
	.byte 0x0C, 0xEE, 0x00, 0x20, 0xF8, 0xBD, 0xC0, 0x46, 0x80, 0x94, 0x35, 0x02, 0x1F, 0x23, 0x00, 0x00
	.byte 0x99, 0x05, 0x33, 0x02, 0x08, 0xB5, 0x00, 0x28, 0x00, 0xD1, 0x7C, 0xE1, 0x00, 0x21, 0x42, 0x5E
	.byte 0x09, 0x2A, 0x00, 0xD9, 0x70, 0xE1, 0x92, 0x18, 0x7A, 0x44, 0xD2, 0x88, 0x12, 0x04, 0x12, 0x14
	.byte 0x97, 0x44, 0xD4, 0x02, 0x12, 0x00, 0x62, 0x02, 0x98, 0x00, 0x06, 0x01, 0xD0, 0x00, 0xAE, 0x01
	.byte 0x9E, 0x02, 0xB4, 0x02, 0xC2, 0x02, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x34, 0xD1, 0xB2, 0x4A
	.byte 0xD0, 0x6A, 0x04, 0x28, 0x08, 0xD1, 0x03, 0x20, 0xD0, 0x62, 0xB0, 0x48, 0x02, 0x68, 0x00, 0x2A
	.byte 0x4C, 0xD0, 0x06, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x06, 0x28, 0x11, 0xD1, 0x50, 0x6C, 0x91, 0x6C
	.byte 0x12, 0x6E, 0xA4, 0xF7, 0x40, 0xE9, 0x03, 0x28, 0x40, 0xD0, 0xA7, 0x48, 0x03, 0x21, 0xC1, 0x62
	.byte 0xA6, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x39, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x08, 0x28, 0x33, 0xD1, 0xD0, 0x6C, 0x91, 0x6A, 0x92, 0x6D, 0xA4, 0xF7, 0x4A, 0xEA, 0x03, 0x28
	.byte 0x2C, 0xD0, 0x9D, 0x48, 0x03, 0x21, 0xC1, 0x62, 0x9C, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x25, 0xD0
	.byte 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x97, 0x48, 0x01, 0x23, 0xC3, 0x62, 0x97, 0x48
	.byte 0x03, 0x68, 0x00, 0x2B, 0x1A, 0xD0, 0x10, 0x1C, 0x98, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E
	.byte 0x00, 0x28, 0x0C, 0xD1, 0x90, 0x48, 0xC2, 0x6A, 0x06, 0x2A, 0x0F, 0xD1, 0x05, 0x22, 0xC2, 0x62
	.byte 0x8E, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x09, 0xD0, 0x08, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x8A, 0x48
	.byte 0x03, 0x22, 0xC2, 0x62, 0x89, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x00, 0xD1, 0x0B, 0xE1, 0x09, 0x20
	.byte 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x0C, 0xD1, 0x82, 0x48, 0xC2, 0x6A
	.byte 0x08, 0x2A, 0x74, 0xD1, 0x07, 0x22, 0xC2, 0x62, 0x80, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x6E, 0xD0
	.byte 0x0C, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x7C, 0x48, 0x03, 0x22, 0xC2, 0x62, 0x7B, 0x48, 0x02, 0x68
	.byte 0x00, 0x2A, 0x64, 0xD0, 0x0D, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28
	.byte 0x45, 0xD1, 0x75, 0x4A, 0xD0, 0x6A, 0x04, 0x28, 0x08, 0xD1, 0x03, 0x20, 0xD0, 0x62, 0x73, 0x48
	.byte 0x02, 0x68, 0x00, 0x2A, 0x53, 0xD0, 0x0A, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x06, 0x28, 0x11, 0xD1
	.byte 0x50, 0x6C, 0x91, 0x6C, 0x12, 0x6E, 0xA4, 0xF7, 0xC6, 0xE8, 0x03, 0x28, 0x47, 0xD0, 0x6A, 0x48
	.byte 0x03, 0x21, 0xC1, 0x62, 0x69, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x40, 0xD0, 0x02, 0x20, 0x00, 0x21
	.byte 0x90, 0x47, 0x08, 0xBD, 0x02, 0x28, 0x0E, 0xD1, 0xA4, 0xF7, 0x3C, 0xE8, 0x03, 0x28, 0x36, 0xD0
	.byte 0x61, 0x48, 0x03, 0x21, 0xC1, 0x62, 0x61, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x2F, 0xD0, 0x02, 0x20
	.byte 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x08, 0x28, 0x29, 0xD1, 0xD0, 0x6C, 0x91, 0x6A, 0x92, 0x6D
	.byte 0xA4, 0xF7, 0xBE, 0xE9, 0x03, 0x28, 0x22, 0xD0, 0x57, 0x48, 0x03, 0x21, 0xC1, 0x62, 0x57, 0x48
	.byte 0x02, 0x68, 0x00, 0x2A, 0x1B, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x52, 0x48
	.byte 0x03, 0x22, 0xC2, 0x62, 0x51, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x10, 0xD0, 0x0B, 0x20, 0x90, 0x47
	.byte 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x4B, 0xD1, 0x4B, 0x4A, 0xD0, 0x6A, 0x04, 0x28
	.byte 0x09, 0xD1, 0x03, 0x20, 0xD0, 0x62, 0x49, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x00, 0xD1, 0x8A, 0xE0
	.byte 0x0E, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x06, 0x28, 0x11, 0xD1, 0x50, 0x6C, 0x91, 0x6C, 0x12, 0x6E
	.byte 0xA4, 0xF7, 0x70, 0xE8, 0x03, 0x28, 0x7E, 0xD0, 0x3F, 0x48, 0x03, 0x21, 0xC1, 0x62, 0x3F, 0x48
	.byte 0x02, 0x68, 0x00, 0x2A, 0x77, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x28
	.byte 0x0E, 0xD1, 0xA3, 0xF7, 0xE8, 0xEF, 0x03, 0x28, 0x6D, 0xD0, 0x37, 0x48, 0x03, 0x21, 0xC1, 0x62
	.byte 0x36, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x66, 0xD0, 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD
	.byte 0x08, 0x28, 0x11, 0xD1, 0xD0, 0x6C, 0x91, 0x6A, 0x92, 0x6D, 0xA4, 0xF7, 0x6A, 0xE9, 0x03, 0x28
	.byte 0x59, 0xD0, 0x2D, 0x48, 0x03, 0x21, 0xC1, 0x62, 0x2C, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x52, 0xD0
	.byte 0x02, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0x07, 0x28, 0x4C, 0xD1, 0x03, 0x20, 0xD0, 0x62
	.byte 0x08, 0xBD, 0x25, 0x48, 0x03, 0x22, 0xC2, 0x62, 0x24, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x42, 0xD0
	.byte 0x0F, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x02, 0x22, 0x80, 0x5E, 0x00, 0x28, 0x0F, 0xD1, 0x1E, 0x48
	.byte 0xC0, 0x6A, 0x02, 0x28, 0x37, 0xD1, 0xA3, 0xF7, 0x80, 0xEE, 0x1B, 0x48, 0x00, 0x21, 0xC1, 0x62
	.byte 0x1A, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x2E, 0xD0, 0x14, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x16, 0x48
	.byte 0x03, 0x23, 0xC3, 0x62, 0x15, 0x48, 0x03, 0x68, 0x00, 0x2B, 0x24, 0xD0, 0x10, 0x1C, 0x98, 0x47
	.byte 0x08, 0xBD, 0x11, 0x48, 0xC0, 0x6A, 0x05, 0x28, 0x1D, 0xD1, 0x10, 0x48, 0x02, 0x68, 0x00, 0x2A
	.byte 0x19, 0xD0, 0x05, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x0C, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x12, 0xD0
	.byte 0x04, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x08, 0x48, 0xC1, 0x62, 0x08, 0x48, 0x02, 0x68, 0x00, 0x2A
	.byte 0x09, 0xD0, 0x03, 0x20, 0x90, 0x47, 0x08, 0xBD, 0x04, 0x48, 0x02, 0x68, 0x00, 0x2A, 0x02, 0xD0
	.byte 0x01, 0x20, 0x00, 0x21, 0x90, 0x47, 0x08, 0xBD, 0xD0, 0x94, 0x35, 0x02, 0x50, 0x95, 0x35, 0x02

	arm_func_start ov02_02330F00
ov02_02330F00: @ 0x02330F00
	ldmdbmi r7, {r3, r8, sl, ip, sp, pc}
	stmdahs r8, {r3, r6, r7, sb, fp, sp, lr}
	stmdane r0, {r0, r2, r5, fp, ip, lr, pc}
	stmhi r0, {r3, r4, r5, r6, sl, lr} ^
	strne r0, [r0], #-0x400
	eorseq r4, lr, r7, lsl #9
	eorseq r0, lr, lr, lsr #32
	eorseq r0, lr, lr, lsr r0
	eorseq r0, lr, r0, lsl r0
	eorseq r0, lr, r2, lsr #32
	arm_func_end ov02_02330F00
_02330F28:
	.byte 0x00, 0x20, 0x01, 0x1C, 0x02, 0x1C, 0xA3, 0xF7
	.byte 0xD2, 0xEF, 0x03, 0x28, 0x11, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0xA4, 0xF7, 0xEC, 0xE9, 0x03, 0x28
	.byte 0x0B, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0x88, 0x68, 0x06, 0x49, 0xA3, 0xF7, 0x4A, 0xEE, 0x03, 0x28
	.byte 0x03, 0xD0, 0x00, 0x20, 0x08, 0xBD, 0x00, 0x20, 0x08, 0xBD, 0x01, 0x20, 0x08, 0xBD, 0xC0, 0x46
	.byte 0xD0, 0x94, 0x35, 0x02, 0xF5, 0x0B, 0x33, 0x02

	arm_func_start ov02_02330F68
ov02_02330F68: @ 0x02330F68
	arm_func_end ov02_02330F68
_02330F68:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x01, 0x20, 0x0F, 0x1C
	.byte 0xA5, 0xF7, 0x8A, 0xEE, 0xA5, 0xF7, 0x5C, 0xEE, 0x06, 0x1C, 0x00, 0x2E, 0x10, 0xDD, 0x00, 0x24
	.byte 0x00, 0x2E, 0x0D, 0xDD, 0xBC, 0x42, 0x0B, 0xDA, 0x20, 0x04, 0x00, 0x0C, 0xA5, 0xF7, 0xBA, 0xEE
	.byte 0x29, 0x1C, 0xC0, 0x22, 0x4B, 0xF5, 0xCC, 0xE9, 0x64, 0x1C, 0xC0, 0x35, 0xB4, 0x42, 0xF1, 0xDB
	.byte 0x00, 0x20, 0xA5, 0xF7, 0x72, 0xEE, 0x30, 0x1C, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_02330FAC
ov02_02330FAC: @ 0x02330FAC
	movwls fp, #0x5f8
	arm_func_end ov02_02330FAC
_02330FB0:
	.byte 0x05, 0x1C, 0x0C, 0x1C, 0x16, 0x1C, 0x4A, 0xF5, 0x16, 0xEC, 0x07, 0x1C, 0x30, 0x49, 0x00, 0x98
	.byte 0x00, 0x2D, 0x08, 0x66, 0x2F, 0x48, 0x48, 0x64, 0x08, 0xD0, 0x00, 0x22, 0x29, 0x78, 0x52, 0x1C
	.byte 0x6D, 0x1C, 0x01, 0x70, 0x40, 0x1C, 0x06, 0x2A, 0xF8, 0xDB, 0x06, 0xE0, 0xFF, 0x21, 0x06, 0x22
	.byte 0x4B, 0xF5, 0x14, 0xEA, 0x28, 0x49, 0x26, 0x48, 0x41, 0x64, 0x28, 0x4A, 0x24, 0x48, 0x00, 0x2C
	.byte 0x82, 0x64, 0x18, 0xD0, 0x00, 0x2E, 0x16, 0xDD, 0x20, 0x2E, 0x14, 0xDA, 0x00, 0x20, 0x00, 0x2E
	.byte 0x06, 0xDD, 0x21, 0x78, 0x40, 0x1C, 0x64, 0x1C, 0x11, 0x70, 0x52, 0x1C, 0xB0, 0x42, 0xF8, 0xDB
	.byte 0x20, 0x28, 0x10, 0xDA, 0x1D, 0x49, 0x0A, 0x18, 0x00, 0x21, 0x40, 0x1C, 0x11, 0x70, 0x52, 0x1C
	.byte 0x20, 0x28, 0xFA, 0xDB, 0x07, 0xE0, 0x19, 0x48, 0xFF, 0x21, 0x20, 0x22, 0x4B, 0xF5, 0xEE, 0xE9
	.byte 0x17, 0x49, 0x13, 0x48, 0x81, 0x64, 0x12, 0x4A, 0xD0, 0x6A, 0x03, 0x28

	arm_func_start ov02_0233103C
ov02_0233103C: @ 0x0233103C
	ldcvs p1, c13, [r1], {0xe}
	mrcvs p8, #0, r4, c2, c0, #0
	svc #0x46f7a3
	tstle r3, r3, lsl #16
	arm_func_end ov02_0233103C
_0233104C:
	.byte 0x0C, 0x48, 0x06, 0x21
	.byte 0xC1, 0x62, 0x38, 0x1C, 0x4A, 0xF5, 0xD0, 0xEB, 0x01, 0x20, 0xF8, 0xBD, 0xFF, 0xF7, 0x50, 0xFF
	.byte 0x01, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x06, 0x21, 0xC1, 0x62, 0x38, 0x1C, 0x4A, 0xF5, 0xC4, 0xEB
	.byte 0x01, 0x20, 0xF8, 0xBD, 0x38, 0x1C, 0x4A, 0xF5, 0xC0, 0xEB, 0x00, 0x20, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0xD0, 0x94, 0x35, 0x02, 0x88, 0x99, 0x35, 0x02, 0x58, 0x81, 0x31, 0x02, 0xC0, 0x99, 0x35, 0x02
	.byte 0x60, 0x81, 0x31, 0x02

	arm_func_start ov02_02331094
ov02_02331094: @ 0x02331094
	arm_func_end ov02_02331094
_02331094:
	.byte 0x10, 0xB5, 0x4A, 0xF5, 0xA6, 0xEB, 0x04, 0x1C, 0x0A, 0x48, 0xC0, 0x6A
	.byte 0x07, 0x28, 0x0B, 0xD1, 0xA4, 0xF7, 0x36, 0xE9, 0x03, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x04, 0x21
	.byte 0xC1, 0x62, 0x20, 0x1C, 0x4A, 0xF5, 0xA0, 0xEB

	arm_func_start ov02_023310B8
ov02_023310B8: @ 0x023310B8
	ldclt p0, c2, [r0, #-4]
	arm_func_end ov02_023310B8
_023310BC:
	.byte 0x20, 0x1C, 0x4A, 0xF5
	.byte 0x9C, 0xEB, 0x00, 0x20, 0x10, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023310CC
ov02_023310CC: @ 0x023310CC
	arm_func_end ov02_023310CC
_023310CC:
	.byte 0x10, 0xB5, 0x4A, 0xF5
	.byte 0x8A, 0xEB, 0x04, 0x1C, 0x12, 0x48, 0xC0, 0x6A, 0x03, 0x28, 0x10, 0xD1, 0xA3, 0xF7, 0x82, 0xEE
	.byte 0x03, 0x28, 0x04, 0xD0, 0x20, 0x1C, 0x4A, 0xF5, 0x88, 0xEB, 0x00, 0x20, 0x10, 0xBD, 0x0C, 0x48
	.byte 0x02, 0x21, 0xC1, 0x62, 0x20, 0x1C, 0x4A, 0xF5, 0x80, 0xEB, 0x01, 0x20, 0x10, 0xBD, 0xFF, 0xF7
	.byte 0xFF, 0xFE, 0x01, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x02, 0x21, 0xC1, 0x62, 0x20, 0x1C, 0x4A, 0xF5
	.byte 0x74, 0xEB, 0x01, 0x20, 0x10, 0xBD, 0x20, 0x1C, 0x4A, 0xF5, 0x6E, 0xEB, 0x00, 0x20, 0x10, 0xBD
	.byte 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_02331124
ov02_02331124: @ 0x02331124
	arm_func_end ov02_02331124
_02331124:
	.byte 0xF8, 0xB5, 0x07, 0x1C, 0x0D, 0x1C, 0x16, 0x1C, 0x4A, 0xF5, 0x5A, 0xEB
	.byte 0x1C, 0x49, 0x04, 0x1C, 0x8E, 0x65, 0x00, 0x2D, 0x05, 0xD0, 0x89, 0x6A, 0x28, 0x1C, 0x60, 0x22
	.byte 0x4B, 0xF5, 0xC2, 0xE9, 0x04, 0xE0, 0x88, 0x6A, 0x00, 0x21, 0x60, 0x22, 0x4B, 0xF5, 0x5E, 0xE9
	.byte 0x14, 0x49, 0x38, 0x1C, 0xC9, 0x6C, 0xC0, 0x22, 0x4B, 0xF5, 0xEA, 0xE8, 0xFF, 0xF7, 0xD0, 0xFE
	.byte 0x01, 0x28, 0x07, 0xD1, 0x0F, 0x48, 0x08, 0x21, 0xC1, 0x62, 0x20, 0x1C, 0x4A, 0xF5, 0x44, 0xEB
	.byte 0x01, 0x20, 0xF8, 0xBD, 0x0B, 0x4A, 0xD0, 0x6A, 0x03, 0x28, 0x0E, 0xD1, 0xD0, 0x6C, 0x91, 0x6A
	.byte 0x92, 0x6D, 0xA3, 0xF7, 0xC6, 0xEF, 0x03, 0x28, 0x07, 0xD1, 0x06, 0x48, 0x08, 0x21, 0xC1, 0x62
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0x32, 0xEB, 0x01, 0x20, 0xF8, 0xBD, 0x20, 0x1C, 0x4A, 0xF5, 0x2C, 0xEB
	.byte 0x00, 0x20, 0xF8, 0xBD, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023311A8
ov02_023311A8: @ 0x023311A8
	arm_func_end ov02_023311A8
_023311A8:
	.byte 0xF8, 0xB5, 0x0D, 0x1C, 0x07, 0x1C, 0x00, 0x92
	.byte 0x4A, 0xF5, 0x18, 0xEB, 0x04, 0x1C, 0x28, 0x1C, 0x26, 0x4A, 0x63, 0x30, 0x03, 0x21, 0x88, 0x43
	.byte 0x06, 0x1C, 0x95, 0x62, 0x2F, 0x36, 0x1F, 0x21, 0x23, 0x4B, 0x90, 0x60, 0x8E, 0x43, 0xD6, 0x63
	.byte 0xF6, 0x18, 0x8E, 0x43, 0xD6, 0x64, 0xDF, 0x36, 0x8E, 0x43, 0x46, 0x60, 0x00, 0x99, 0x90, 0x68
	.byte 0x6D, 0x18, 0x41, 0x68, 0x69, 0x1A, 0x81, 0x60, 0x90, 0x68, 0x00, 0x21, 0xC1, 0x60, 0x90, 0x68
	.byte 0x03, 0x21, 0x01, 0x60, 0x19, 0x48, 0x07, 0x60, 0xD0, 0x6A, 0x00, 0x28, 0x0E, 0xD1, 0x1F, 0x3B
	.byte 0xD0, 0x6B, 0x19, 0x1C, 0xA3, 0xF7, 0x34, 0xEC, 0x00, 0x28, 0x04, 0xD0, 0x20, 0x1C, 0x4A, 0xF5
	.byte 0xF4, 0xEA, 0x00, 0x20, 0xF8, 0xBD, 0x0F, 0x48, 0x01, 0x21, 0xC1, 0x62, 0x0D, 0x48, 0xC1, 0x6A
	.byte 0x01, 0x29, 0x12, 0xD1, 0x80, 0x68, 0x0E, 0x49, 0xA3, 0xF7, 0xDA, 0xEC, 0x03, 0x28, 0x04, 0xD0
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0xE2, 0xEA, 0x00, 0x20, 0xF8, 0xBD, 0x06, 0x48, 0x04, 0x21, 0xC1, 0x62
	.byte 0x20, 0x1C, 0x4A, 0xF5, 0xDA, 0xEA, 0x01, 0x20, 0xF8, 0xBD, 0x20, 0x1C, 0x4A, 0xF5, 0xD4, 0xEA
	.byte 0x00, 0x20, 0xF8, 0xBD, 0xD0, 0x94, 0x35, 0x02, 0x1F, 0x23, 0x00, 0x00, 0x50, 0x95, 0x35, 0x02
	.byte 0xF5, 0x0B, 0x33, 0x02

	arm_func_start ov02_02331264
ov02_02331264: @ 0x02331264
	bvs _01343270
	uxtab16mi r4, r0, r0, ror #8
	eorseq sb, r5, #208, #8
	arm_func_end ov02_02331264

	arm_func_start ov02_02331270
ov02_02331270: @ 0x02331270
	arm_func_end ov02_02331270
_02331270:
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0x00, 0x2C, 0x0C, 0xDD, 0x07, 0x48, 0x48, 0xF5, 0xE6, 0xEE, 0x07, 0x49
	.byte 0x20, 0x1C, 0x49, 0x68, 0x88, 0x47, 0x04, 0x1C, 0x03, 0x48, 0x48, 0xF5, 0x20, 0xEF, 0x20, 0x1C
	.byte 0x10, 0xBD, 0x00, 0x20, 0x10, 0xBD, 0xC0, 0x46, 0x64, 0x95, 0x35, 0x02, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023312A0
ov02_023312A0: @ 0x023312A0
	arm_func_end ov02_023312A0
_023312A0:
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0x0B, 0xD0, 0x00, 0x2A, 0x09, 0xDD, 0x05, 0x48, 0x48, 0xF5, 0xCC, 0xEE
	.byte 0x04, 0x49, 0x20, 0x1C, 0xC9, 0x68, 0x88, 0x47, 0x01, 0x48, 0x48, 0xF5, 0x08, 0xEF, 0x10, 0xBD
	.byte 0x64, 0x95, 0x35, 0x02, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023312C8
ov02_023312C8: @ 0x023312C8
	arm_func_end ov02_023312C8
_023312C8:
	.byte 0x08, 0xB5, 0x4A, 0xF5, 0x8C, 0xEA, 0x06, 0x49
	.byte 0x00, 0x22, 0x8A, 0x66, 0xCA, 0x66, 0x05, 0x4B, 0x11, 0x1C, 0x52, 0x1C, 0x02, 0xC3, 0x04, 0x2A
	.byte 0xFB, 0xDB, 0x4A, 0xF5, 0x8A, 0xEA, 0x08, 0xBD, 0xD0, 0x94, 0x35, 0x02, 0x54, 0x95, 0x35, 0x02

	arm_func_start ov02_023312F0
ov02_023312F0: @ 0x023312F0
	arm_func_end ov02_023312F0
_023312F0:
	.byte 0x38, 0xB5, 0x4A, 0xF5, 0x78, 0xEA, 0x0A, 0x49, 0xCD, 0x6E, 0x8A, 0x6E, 0xAA, 0x42, 0x01, 0xD1
	.byte 0x00, 0x24, 0x08, 0xE0, 0x07, 0x4A, 0xAB, 0x00, 0xD4, 0x58, 0x6A, 0x1C, 0xCA, 0x66, 0x04, 0x2A
	.byte 0x01, 0xDB, 0x00, 0x22, 0xCA, 0x66, 0x4A, 0xF5, 0x70, 0xEA, 0x20, 0x1C, 0x38, 0xBD, 0xC0, 0x46
	.byte 0xD0, 0x94, 0x35, 0x02, 0x54, 0x95, 0x35, 0x02, 0x18, 0xB4, 0x09, 0x49, 0x8B, 0x6E, 0xCA, 0x6E
	.byte 0x5C, 0x1C, 0x94, 0x42, 0x0A, 0xD0, 0xD2, 0x1C, 0x93, 0x42, 0x07, 0xD0, 0x05, 0x4A, 0x9B, 0x00
	.byte 0xD0, 0x50, 0x8C, 0x66, 0x04, 0x2C, 0x01, 0xDB, 0x00, 0x20, 0x88, 0x66, 0x18, 0xBC, 0x70, 0x47
	.byte 0xD0, 0x94, 0x35, 0x02, 0x54, 0x95, 0x35, 0x02, 0x01, 0x4B, 0x00, 0x21, 0x18, 0x47, 0xC0, 0x46
	.byte 0x29, 0x13, 0x33, 0x02

	arm_func_start ov02_02331364
ov02_02331364: @ 0x02331364
	arm_func_end ov02_02331364
_02331364:
	.byte 0xF8, 0xB5, 0x06, 0x1C, 0x23, 0x48, 0x01, 0x24, 0x06, 0x67, 0xFF, 0xF7
	.byte 0xAB, 0xFF, 0xD0, 0x20, 0x37, 0x1C, 0x47, 0x43, 0x20, 0x48, 0x39, 0x18, 0xC0, 0x20, 0x70, 0x43
	.byte 0x08, 0x18, 0x1D, 0x49, 0x49, 0x68, 0x88, 0x47, 0x1B, 0x4E, 0x00, 0x28, 0x70, 0x65, 0x01, 0xD1
	.byte 0xA0, 0x1E, 0xF8, 0xBD, 0x1F, 0x21, 0x42, 0x18, 0x08, 0x1C, 0x3F, 0x38, 0x13, 0x1C, 0x03, 0x40
	.byte 0x17, 0x48, 0x33, 0x64, 0x3A, 0x18, 0x98, 0x18, 0x40, 0x18, 0x3F, 0x39, 0x08, 0x40, 0xF0, 0x65
	.byte 0x14, 0x48, 0x19, 0x1C, 0xFF, 0xF7, 0xF8, 0xFE, 0x00, 0x28, 0x01, 0xD1, 0xE0, 0x1E, 0xF8, 0xBD
	.byte 0x00, 0x26, 0x27, 0x1C, 0x0A, 0x20, 0x48, 0xF5, 0xA6, 0xEB, 0xFF, 0xF7, 0x91, 0xFF, 0x00, 0x28
	.byte 0x0E, 0xD0, 0x04, 0x28, 0x08, 0xD0, 0x05, 0x28, 0x06, 0xD0, 0x06, 0x28, 0x02, 0xD1, 0x34, 0x1C
	.byte 0x3D, 0x1C, 0x01, 0xE0, 0x00, 0x24, 0xA5, 0x1E, 0xFF, 0xF7, 0x82, 0xFF, 0x00, 0x28, 0xF0, 0xD1
	.byte 0x00, 0x2C, 0xE7, 0xD1, 0x28, 0x1C, 0xF8, 0xBD, 0xD0, 0x94, 0x35, 0x02, 0xD0, 0x24, 0x00, 0x00
	.byte 0x90, 0x24, 0x00, 0x00, 0x29, 0x13, 0x33, 0x02

	arm_func_start ov02_02331408
ov02_02331408: @ 0x02331408
	strhs fp, [r1, #-0x5f8]
	.word 0xFE5EF7FF
	andsle r2, r8, r0, lsl #16
	ldcne p6, c2, [r4], #-0
	ldcne p7, c2, [r8], #-0x28
	bl FUN_041EE944
	arm_func_end ov02_02331408
_02331420:
	.byte 0xFF, 0xF7, 0x66, 0xFF, 0x00, 0x28, 0x0C, 0xD0, 0x04, 0x28, 0x06, 0xD0, 0x05, 0x28, 0x04, 0xD0
	.byte 0x14, 0x28, 0x01, 0xD1, 0x25, 0x1C, 0x00, 0xE0, 0x35, 0x1C, 0xFF, 0xF7, 0x59, 0xFF, 0x00, 0x28
	.byte 0xF2, 0xD1, 0x00, 0x2D, 0xE9, 0xD1, 0x05, 0x49, 0x48, 0x6D, 0x00, 0x28, 0x04, 0xD0, 0xC9, 0x68
	.byte 0x88, 0x47, 0x02, 0x48, 0x00, 0x21, 0x41, 0x65, 0x01, 0x20, 0xF8, 0xBD, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_02331460
ov02_02331460: @ 0x02331460
	strdlt fp, ip, [ip], r8
	strhs r4, [r1], #-0x842
	stmibvs r0, {r0, r1, r6, r7, r8, sl, fp, sp, lr}
	arm_func_end ov02_02331460
_0233146C:
	.byte 0xC0, 0x22, 0x01, 0x1C
	.byte 0x51, 0x43, 0xE5, 0x1E, 0x5E, 0x18, 0x02, 0xD1, 0x0C, 0xB0, 0x00, 0x20, 0xF8, 0xBD, 0x30, 0x1C
	.byte 0x00, 0x21, 0x92, 0x02, 0xFF, 0xF7, 0x4E, 0xFE, 0x00, 0x28, 0x02, 0xD1, 0x0C, 0xB0, 0xE0, 0x1E
	.byte 0xF8, 0xBD, 0x01, 0xA8, 0x49, 0xF5, 0xD4, 0xED, 0x12, 0x20, 0x00, 0x90, 0x35, 0x49, 0x36, 0x4B
	.byte 0x01, 0xA8, 0x00, 0x22, 0x49, 0xF5, 0x6A, 0xEE, 0x00, 0x27, 0x02, 0xF0, 0x49, 0xFE, 0x33, 0x49
	.byte 0xC9, 0x68, 0x88, 0x42, 0x02, 0xD3, 0x02, 0x25, 0xED, 0x43, 0x3F, 0xE0, 0x2C, 0x48, 0x00, 0x69
	.byte 0x00, 0x28, 0x02, 0xD0, 0x07, 0x25, 0xED, 0x43, 0x38, 0xE0, 0x0A, 0x20, 0x48, 0xF5, 0x22, 0xEB
	.byte 0xFF, 0xF7, 0x0E, 0xFF, 0x00, 0x28, 0x2F, 0xD0, 0x0C, 0x28, 0x08, 0xDC, 0x11, 0xDA, 0x05, 0x28
	.byte 0x25, 0xDC, 0x04, 0x28, 0x23, 0xDB, 0x23, 0xD0, 0x05, 0x28, 0x21, 0xD0, 0x1F, 0xE0, 0x13, 0x28
	.byte 0x1D, 0xDC, 0x0D, 0x28, 0x1B, 0xDB, 0x07, 0xD0, 0x12, 0x28, 0x19, 0xD0, 0x13, 0x28, 0x17, 0xD0
	.byte 0x15, 0xE0, 0x3C, 0x1C, 0x01, 0x25, 0x13, 0xE0, 0x19, 0x48, 0x00, 0x69, 0x00, 0x28, 0x03, 0xD0
	.byte 0x00, 0x24, 0x25, 0x1C, 0x08, 0x3D, 0x0B, 0xE0, 0x03, 0x22, 0x30, 0x1C, 0x00, 0x21, 0x12, 0x04
	.byte 0xFF, 0xF7, 0x00, 0xFE, 0x00, 0x28, 0x03, 0xD1, 0x0C, 0xB0, 0x28, 0x1C, 0xF8, 0xBD, 0x00, 0x24
	.byte 0xFF, 0xF7, 0xDE, 0xFE, 0x00, 0x28, 0xCF, 0xD1, 0x00, 0x2C, 0xB6, 0xD1, 0x01, 0xA8, 0x49, 0xF5
	.byte 0x54, 0xEE, 0xFF, 0xF7, 0xD5, 0xFE, 0x00, 0x28, 0xFB, 0xD1, 0x00, 0x2D, 0x0D, 0xDD, 0x08, 0x48
	.byte 0x01, 0x21, 0x01, 0x62, 0x0A, 0x48, 0x9E, 0xF7, 0x8E, 0xE8, 0x00, 0x28, 0x02, 0xDA, 0x01, 0x25
	.byte 0xED, 0x43, 0x02, 0xE0, 0x02, 0x48, 0x01, 0x21, 0x41, 0x62, 0x28, 0x1C, 0x0C, 0xB0, 0xF8, 0xBD
	.byte 0xD0, 0x94, 0x35, 0x02, 0x42, 0xEC, 0x3F, 0x00, 0x59, 0x13, 0x33, 0x02, 0x08, 0x30, 0x35, 0x02
	.byte 0x1C, 0x30, 0x35, 0x02

	arm_func_start ov02_02331584
ov02_02331584: @ 0x02331584
	ldmdami r7, {r3, r4, r5, r6, r7, r8, sl, ip, sp, pc}
	bvs _0233A994
	andsle r2, pc, r0, lsl #16
	.word 0xFD80F7FF
	andsle r2, r8, r0, lsl #16
	ldcne p6, c2, [r4], #-0
	ldcne p7, c2, [r8], #-0x28
	b _0116EAC8
	arm_func_end ov02_02331584
_023315A4:
	.byte 0xFF, 0xF7, 0xA4, 0xFE, 0x00, 0x28, 0x0C, 0xD0, 0x04, 0x28, 0x06, 0xD0
	.byte 0x05, 0x28, 0x04, 0xD0, 0x0E, 0x28, 0x01, 0xD1, 0x25, 0x1C, 0x00, 0xE0, 0x35, 0x1C, 0xFF, 0xF7
	.byte 0x97, 0xFE, 0x00, 0x28, 0xF2, 0xD1, 0x00, 0x2D, 0xE9, 0xD1, 0x06, 0x48, 0x00, 0x21, 0x01, 0x62
	.byte 0x04, 0x48, 0x41, 0x6A, 0x00, 0x29, 0x03, 0xD0, 0x00, 0x21, 0x41, 0x62, 0x9E, 0xF7, 0x04, 0xE9
	.byte 0xF8, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023315E8
ov02_023315E8: @ 0x023315E8
	ldrshlt fp, [fp], r0
	andhs sb, r0, r0
	andls sb, r7, r8
	mrsls sb, apsr
	arm_func_end ov02_023315E8
_023315F8:
	.byte 0x06, 0x1D, 0x08, 0x1C, 0x04, 0x1D, 0x08, 0x98
	.byte 0x02, 0x92, 0x03, 0x90, 0x00, 0x98, 0x00, 0x68, 0x00, 0x28, 0x57, 0xD9, 0x12, 0xAA, 0x02, 0x32
	.byte 0x22, 0x21, 0x00, 0x20, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E, 0xFB, 0xD1, 0x12, 0xA8, 0x02, 0x30
	.byte 0x31, 0x1D, 0x20, 0x22, 0x55, 0xF5, 0x3A, 0xEE, 0x12, 0xA8, 0x31, 0x68, 0x00, 0x27, 0x02, 0x30
	.byte 0x47, 0x54, 0x01, 0x98, 0x00, 0x68, 0x04, 0x90, 0x00, 0x28, 0x31, 0xD9, 0x30, 0x1C, 0x09, 0x90
	.byte 0x28, 0x30, 0x35, 0x68, 0x09, 0x90, 0x00, 0x2D, 0x2A, 0xD0, 0x20, 0x2D, 0x28, 0xD8, 0x01, 0x2D
	.byte 0x04, 0xD1, 0x30, 0x79, 0x00, 0x28, 0x23, 0xD0, 0x20, 0x28, 0x21, 0xD0, 0x12, 0xA8, 0x02, 0x30
	.byte 0x58, 0xF5, 0x0A, 0xE8, 0x02, 0x1C, 0x12, 0xA8, 0x02, 0x30, 0x21, 0x1D, 0x55, 0xF5, 0x6C, 0xEE
	.byte 0x00, 0x28, 0x10, 0xD1, 0x21, 0x1C, 0x09, 0x98, 0x28, 0x31, 0x06, 0x22, 0x55, 0xF5, 0x64, 0xEE
	.byte 0x00, 0x28, 0x08, 0xD1, 0xF1, 0x8D, 0xE0, 0x8D, 0x81, 0x42, 0x04, 0xD0, 0x00, 0x29, 0x02, 0xD1
	.byte 0x01, 0x20, 0x08, 0x90, 0x04, 0xE0, 0x04, 0x98, 0x7F, 0x1C, 0x30, 0x34, 0x87, 0x42, 0xD2, 0xD3
	.byte 0x08, 0x98, 0x00, 0x28, 0x0A, 0xD1, 0x01, 0x98, 0x30, 0x36, 0x04, 0x1D, 0x03, 0x98, 0x40, 0x1C
	.byte 0x03, 0x90, 0x00, 0x98, 0x01, 0x68, 0x03, 0x98, 0x88, 0x42, 0xA7, 0xD3, 0x08, 0x98, 0x00, 0x28
	.byte 0x6A, 0xD1, 0x0A, 0xAA, 0x22, 0x21, 0x00, 0x20, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E, 0xFB, 0xD1
	.byte 0x00, 0x20, 0x06, 0x90, 0x05, 0x90, 0x00, 0x98, 0x06, 0x9E, 0x04, 0x1D, 0x01, 0x98, 0x05, 0x1D
	.byte 0x00, 0x68, 0x00, 0x28, 0x1E, 0xD9, 0x0A, 0xAF, 0x38, 0x1C, 0x29, 0x1D, 0x20, 0x22, 0x55, 0xF5
	.byte 0xD6, 0xED, 0x29, 0x68, 0x00, 0x20, 0x78, 0x54, 0x2D, 0x48, 0x57, 0xF5, 0xBE, 0xEF, 0x02, 0x1C
	.byte 0x2B, 0x49, 0x38, 0x1C, 0x55, 0xF5, 0x20, 0xEE, 0x00, 0x28, 0x05, 0xD1, 0xE8, 0x8D, 0x00, 0x28
	.byte 0x02, 0xD1, 0x01, 0x20, 0x05, 0x90, 0x05, 0xE0, 0x01, 0x98, 0x76, 0x1C, 0x00, 0x68, 0x30, 0x35
	.byte 0x86, 0x42, 0xE1, 0xD3, 0x00, 0x20, 0x03, 0x90, 0x00, 0x98, 0x00, 0x68, 0x00, 0x28, 0x2B, 0xD9
	.byte 0x1F, 0x4F, 0x0A, 0xAD, 0x28, 0x1C, 0x21, 0x1D, 0x20, 0x22, 0x55, 0xF5, 0xB0, 0xED, 0x21, 0x68
	.byte 0x00, 0x20, 0x68, 0x54, 0x28, 0x1C, 0x57, 0xF5, 0x98, 0xEF, 0x06, 0x1C, 0x38, 0x1C, 0x57, 0xF5
	.byte 0x94, 0xEF, 0x86, 0x42, 0x0F, 0xD1, 0x38, 0x1C, 0x57, 0xF5, 0x8E, 0xEF, 0x02, 0x1C, 0x28, 0x1C
	.byte 0x39, 0x1C, 0x55, 0xF5, 0xF2, 0xED, 0x00, 0x28, 0x05, 0xD1, 0xE0, 0x8D, 0x00, 0x28, 0x02, 0xD1
	.byte 0x01, 0x20, 0x06, 0x90, 0x08, 0xE0, 0x03, 0x98, 0x30, 0x34, 0x40, 0x1C, 0x03, 0x90, 0x00, 0x98
	.byte 0x01, 0x68, 0x03, 0x98, 0x88, 0x42, 0xD5, 0xD3, 0x06, 0x98, 0x00, 0x28, 0x04, 0xD0, 0x05, 0x98
	.byte 0x00, 0x28, 0x01, 0xD1, 0x01, 0x20, 0x08, 0x90, 0x08, 0x98, 0x00, 0x28, 0x04, 0xD0, 0x03, 0x99
	.byte 0x02, 0x98, 0x01, 0x60, 0x01, 0x20, 0x07, 0x90, 0x07, 0x98, 0x1B, 0xB0, 0xF0, 0xBD, 0xC0, 0x46
	.byte 0x74, 0x30, 0x35, 0x02

	arm_func_start ov02_023317B4
ov02_023317B4: @ 0x023317B4
	ldrshlt fp, [ip], r8
	andls r2, r2, r0
	ldmmi fp, {r3, ip, pc}
	svcvs #0x12400
	movtmi r2, #0x8030
	eorslo sb, r4, r4
	stmdbls r4, {r2, ip, pc}
	arm_func_end ov02_023317B4
_023317D0:
	.byte 0x01, 0x20, 0xE4, 0x43, 0x02, 0xF0, 0xC2, 0xFC, 0x03, 0x90, 0x00, 0x28, 0x06, 0xD0, 0x04, 0x99
	.byte 0x01, 0x20, 0x02, 0xF0, 0xBB, 0xFC, 0x02, 0x90, 0x00, 0x28, 0x00, 0xD1, 0x11, 0xE1, 0x00, 0x20
	.byte 0x07, 0x90, 0xF2, 0xE0, 0x02, 0xF0, 0xA4, 0xFC, 0x8D, 0x49, 0xC9, 0x68, 0x88, 0x42, 0x6E, 0xD2
	.byte 0x00, 0x20, 0x8C, 0x4B, 0x01, 0x1C, 0x02, 0x1C, 0xFF, 0xF7, 0xD0, 0xFB, 0x00, 0x28, 0x02, 0xD1
	.byte 0x01, 0x24, 0xE4, 0x43, 0xFD, 0xE0, 0x09, 0xA8, 0x49, 0xF5, 0x12, 0xEC, 0x13, 0x20, 0x00, 0x90
	.byte 0x85, 0x49, 0x86, 0x4B, 0x09, 0xA8, 0x00, 0x22, 0x49, 0xF5, 0xA8, 0xEC, 0x7F, 0x4F, 0x01, 0x25
	.byte 0x00, 0x24, 0x09, 0xAE, 0x0A, 0x20, 0x48, 0xF5, 0x6E, 0xE9, 0x02, 0xF0, 0x81, 0xFC, 0x7C, 0x49
	.byte 0xC9, 0x68, 0x88, 0x42, 0x40, 0xD2, 0x38, 0x69, 0x00, 0x28, 0x3D, 0xD1, 0xFF, 0xF7, 0x50, 0xFD
	.byte 0x00, 0x28, 0x37, 0xD0, 0x13, 0x28, 0x30, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04
	.byte 0x00, 0x14, 0x87, 0x44, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00, 0x56, 0x00, 0x2A, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x56, 0x00, 0x54, 0x00, 0x50, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00, 0x56, 0x00, 0x26, 0x00, 0x00, 0x25, 0x15, 0xE0
	.byte 0xF8, 0x6D, 0x39, 0x6F, 0xFF, 0xF7, 0x68, 0xFB, 0xA0, 0x42, 0x0F, 0xDD, 0x04, 0x1C, 0x30, 0x1C
	.byte 0x49, 0xF5, 0xA2, 0xEC, 0x13, 0x20, 0x00, 0x90, 0x63, 0x49, 0x64, 0x4B, 0x30, 0x1C, 0x00, 0x22
	.byte 0x49, 0xF5, 0x64, 0xEC, 0x02, 0xE0, 0x00, 0x25, 0x00, 0xE0, 0x00, 0x25, 0xFF, 0xF7, 0x18, 0xFD
	.byte 0x00, 0x28, 0xC7, 0xD1, 0x00, 0x2D, 0xB5, 0xD1, 0x09, 0xA8, 0x49, 0xF5, 0x8E, 0xEC, 0xFF, 0xF7
	.byte 0x0F, 0xFD, 0x00, 0x28, 0xFB, 0xD1, 0x55, 0x49, 0x08, 0x69, 0x00, 0x28, 0x00, 0xD0, 0x84, 0xE0
	.byte 0x00, 0x20, 0x05, 0x90, 0x08, 0x6F, 0x84, 0x42, 0x02, 0xDB, 0x05, 0x98, 0x84, 0x1F, 0x90, 0xE0
	.byte 0x05, 0x98, 0xCD, 0x6D, 0x06, 0x90, 0x00, 0x2C, 0x35, 0xDD, 0x34, 0xDD, 0x03, 0x98, 0x03, 0x9F
	.byte 0x01, 0x90, 0x08, 0x30, 0x3E, 0x1C, 0x01, 0x90, 0x2C, 0x36, 0x29, 0x1C, 0x01, 0x98, 0x0C, 0x31
	.byte 0x20, 0x22, 0x55, 0xF5, 0xC4, 0xEC, 0x68, 0x89, 0x78, 0x60, 0x68, 0x89, 0x39, 0x18, 0x00, 0x20
	.byte 0x08, 0x72, 0xA9, 0x8D, 0x10, 0x20, 0x08, 0x42, 0x01, 0xD0, 0x01, 0x20, 0x00, 0xE0, 0x00, 0x20
	.byte 0x78, 0x86, 0x28, 0x79, 0x30, 0x37, 0x30, 0x70, 0x68, 0x79, 0x70, 0x70, 0xA8, 0x79, 0xB0, 0x70
	.byte 0xE8, 0x79, 0xF0, 0x70, 0x28, 0x7A, 0x30, 0x71, 0x68, 0x7A, 0xC0, 0x35, 0x70, 0x71, 0x01, 0x98
	.byte 0x30, 0x36, 0x30, 0x30, 0x01, 0x90, 0x05, 0x98, 0x40, 0x1C, 0x05, 0x90, 0x06, 0x98, 0x40, 0x1C
	.byte 0x06, 0x90, 0xA0, 0x42, 0xD1, 0xDB, 0x03, 0x98, 0x04, 0x60, 0x30, 0x48, 0x80, 0x6B, 0x01, 0x28
	.byte 0x26, 0xD0, 0x03, 0x98, 0x02, 0x99, 0x08, 0xAA, 0xFF, 0xF7, 0x36, 0xFE, 0x00, 0x28, 0x1F, 0xD0
	.byte 0x03, 0x98, 0x08, 0x9A, 0x01, 0x1D, 0x30, 0x20, 0x50, 0x43, 0x0C, 0x18, 0x27, 0x48, 0x21, 0x1D
	.byte 0x82, 0x61, 0x2B, 0x48, 0x57, 0xF5, 0x7E, 0xEE, 0x20, 0x1C, 0x28, 0x34, 0x22, 0x78, 0x29, 0x49
	.byte 0x28, 0x30, 0x0A, 0x70, 0x42, 0x78, 0x4A, 0x70, 0x82, 0x78, 0x8A, 0x70, 0xC2, 0x78, 0xCA, 0x70
	.byte 0x02, 0x79, 0x0A, 0x71, 0x40, 0x79, 0x48, 0x71, 0x14, 0xA8, 0x02, 0xF0, 0x03, 0xFC, 0x14, 0xE0
	.byte 0x02, 0x98, 0x03, 0x99, 0x04, 0x9A, 0x55, 0xF5, 0x6A, 0xEC, 0x18, 0x48, 0x02, 0x21, 0x81, 0x63
	.byte 0x02, 0xF0, 0xF6, 0xFC, 0x07, 0x98, 0x40, 0x1C, 0x07, 0x90, 0x07, 0x98, 0x1E, 0x28, 0x04, 0xDA
	.byte 0x12, 0x48, 0x00, 0x69, 0x00, 0x28, 0x00, 0xD1, 0x04, 0xE7, 0x07, 0x98, 0x1E, 0x28, 0x05, 0xDA
	.byte 0x02, 0xF0, 0xA6, 0xFB, 0x0E, 0x49, 0xC9, 0x68, 0x88, 0x42, 0x02, 0xD9, 0x02, 0x24, 0xE4, 0x43
	.byte 0x07, 0xE0, 0x0A, 0x48, 0x00, 0x69, 0x00, 0x28, 0x02, 0xD0, 0x07, 0x24, 0xE4, 0x43, 0x00, 0xE0
	.byte 0x01, 0x24, 0x03, 0x98, 0x00, 0x28, 0x01, 0xD0, 0x02, 0xF0, 0xB2, 0xFB, 0x02, 0x98, 0x00, 0x28
	.byte 0x01, 0xD0, 0x02, 0xF0, 0xAD, 0xFB, 0x20, 0x1C, 0x1C, 0xB0, 0xF8, 0xBD, 0xD0, 0x94, 0x35, 0x02
	.byte 0x08, 0x30, 0x35, 0x02, 0xFE, 0xBF, 0x30, 0x00, 0x10, 0xFB, 0x0F, 0x00, 0x59, 0x13, 0x33, 0x02
	.byte 0xE0, 0x99, 0x35, 0x02, 0x80, 0x99, 0x35, 0x02

	arm_func_start ov02_02331A48
ov02_02331A48: @ 0x02331A48
	bls _023DEE70
	arm_func_end ov02_02331A48
_02331A4C:
	.byte 0x00, 0x91, 0x19, 0x1C
	.byte 0x00, 0x23, 0x9D, 0xF7, 0x72, 0xEC, 0x00, 0x28, 0x01, 0xDA, 0x03, 0x20, 0xC0, 0x43, 0x08, 0xBD

	arm_func_start ov02_02331A60
ov02_02331A60: @ 0x02331A60
	addlt fp, r4, r0, ror r5
	arm_func_end ov02_02331A60
_02331A64:
	.byte 0x05, 0x1C, 0x0E, 0x1C, 0x08, 0x21, 0x01, 0xA8, 0x01, 0x71, 0x02, 0x21
	.byte 0x41, 0x71, 0xC9, 0x1E, 0x03, 0x91, 0x08, 0x49, 0x14, 0x1C, 0xC1, 0x80, 0x9D, 0xF7, 0x48, 0xEA
	.byte 0x01, 0xA9, 0x9D, 0xF7, 0x3A, 0xEF, 0x28, 0x1C, 0x02, 0xA9, 0x01, 0xAA, 0x33, 0x1C, 0x00, 0x94
	.byte 0xFF, 0xF7, 0xDA, 0xFF, 0x04, 0xB0, 0x70, 0xBD, 0xE6, 0x01, 0x00, 0x00

	arm_func_start ov02_02331A9C
ov02_02331A9C: @ 0x02331A9C
	arm_func_end ov02_02331A9C
_02331A9C:
	.byte 0x11, 0x1C, 0x1A, 0x1C
	.byte 0x00, 0x4B, 0x18, 0x47, 0x61, 0x1A, 0x33, 0x02

	arm_func_start ov02_02331AA8
ov02_02331AA8: @ 0x02331AA8
	stmdahi r5, {r3, r4, r5, r6, sl, ip, sp, pc}
	eorne r2, ip, #0, #6
	.word 0x0E260624
	ldrbhs r0, [pc, #0x22c]!
	eormi r0, ip, sp, lsr #4
	strteq r4, [r4], #-0x334
	andvs r0, ip, r4, lsr #24
	eorsne r8, r1, #0x460000
	.word 0x0E0C0609
	eormi r0, sb, r1, lsr r2
	streq r4, [sb], #-0x321
	stcne p12, c0, [r1, #0x30]
	stmdbne sl, {r2, r4, sp, lr}
	addsmi r1, r0, #4, #24
	stmdavc r1!, {r2, sb, ip, lr, pc}
	ldmdane fp, {r2, r5, r6, sl, fp, ip} ^
	arm_func_end ov02_02331AA8
_02331AE8:
	.byte 0x94, 0x42, 0xFA, 0xD3, 0x15, 0x88, 0x19, 0x04
	.byte 0x09, 0x0C, 0x2A, 0x12, 0x12, 0x06, 0x14, 0x0E, 0xFF, 0x22, 0x2B, 0x02, 0x12, 0x02, 0x1A, 0x40
	.byte 0x22, 0x43, 0x12, 0x04, 0x12, 0x0C, 0x91, 0x42, 0x02, 0xD0, 0x00, 0x20, 0x78, 0xBC, 0x70, 0x47
	.byte 0x80, 0x1D, 0x78, 0xBC, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_02331B18
ov02_02331B18: @ 0x02331B18
	arm_func_end ov02_02331B18
_02331B18:
	.byte 0x78, 0xB4, 0x04, 0x1C, 0x20, 0x68, 0x88, 0x42
	.byte 0x02, 0xD3, 0x00, 0x20, 0x78, 0xBC, 0x70, 0x47, 0x05, 0x88, 0x29, 0x12, 0x09, 0x06, 0x0E, 0x0E
	.byte 0x29, 0x02, 0xFF, 0x25, 0x2D, 0x02, 0x29, 0x40, 0x31, 0x43, 0x09, 0x04, 0x09, 0x0C, 0x11, 0x60
	.byte 0x46, 0x88, 0x00, 0x1D, 0x31, 0x12, 0x09, 0x06, 0x0A, 0x0E, 0x31, 0x02, 0x29, 0x40, 0x11, 0x43
	.byte 0x09, 0x04, 0x0A, 0x0C, 0x1A, 0x60, 0x0B, 0x32, 0x07, 0x21, 0x8A, 0x43, 0x11, 0x1F, 0x41, 0x18
	.byte 0x21, 0x60, 0x78, 0xBC, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_02331B68
ov02_02331B68: @ 0x02331B68
	addlt fp, r1, r8, ror r5
	strlo r1, [r8, #-0xc05]
	arm_func_end ov02_02331B68
_02331B70:
	.byte 0x00, 0x95, 0x13, 0x1C, 0x02, 0x88, 0x0C, 0x1C, 0x00, 0xA8, 0x11, 0x12, 0x16, 0x02, 0xFF, 0x22
	.byte 0x09, 0x06, 0x12, 0x02, 0x09, 0x0E, 0x32, 0x40, 0x11, 0x43, 0x09, 0x04, 0x09, 0x0C, 0x69, 0x18
	.byte 0x22, 0x1C, 0xFF, 0xF7, 0xC1, 0xFF, 0x01, 0xB0, 0x78, 0xBD, 0x00, 0x00

	arm_func_start ov02_02331B9C
ov02_02331B9C: @ 0x02331B9C
	strdlt fp, ip, [r2], r8
	arm_func_end ov02_02331B9C
_02331BA0:
	.byte 0x1F, 0x1C, 0x06, 0x1C, 0x38, 0x1C, 0x08, 0x38, 0x01, 0x91, 0x00, 0x04, 0x11, 0x1C, 0x00, 0x25
	.byte 0x0D, 0x70, 0x00, 0x0C, 0x4D, 0x70, 0x02, 0x12, 0x8D, 0x70, 0x12, 0x06, 0xCD, 0x70, 0x13, 0x0E
	.byte 0x02, 0x02, 0xFF, 0x20, 0x0D, 0x71, 0x00, 0x02, 0x4D, 0x71, 0x10, 0x40, 0x8D, 0x71, 0x18, 0x43
	.byte 0xCD, 0x71, 0x08, 0x9B, 0x34, 0x1C, 0x08, 0x80, 0x00, 0x2B, 0x07, 0xD0, 0x10, 0x20, 0x00, 0x90
	.byte 0xB0, 0x1D, 0x3A, 0x1C, 0x00, 0xF0, 0xFA, 0xFD, 0x08, 0x37, 0x03, 0xE0, 0xB0, 0x1D, 0x3A, 0x1C
	.byte 0x55, 0xF5, 0x54, 0xEB, 0x00, 0x20, 0x30, 0x70, 0x70, 0x70, 0xB0, 0x70, 0xF0, 0x70, 0x30, 0x71
	.byte 0x70, 0x71, 0x01, 0x98, 0x00, 0x04, 0x01, 0x0C, 0x08, 0x12, 0x00, 0x06, 0x02, 0x0E, 0xFF, 0x20
	.byte 0x09, 0x02, 0x00, 0x02, 0x01, 0x40, 0x11, 0x43, 0x31, 0x80, 0x39, 0x04, 0x0A, 0x0C, 0x11, 0x12
	.byte 0x09, 0x06, 0x12, 0x02, 0x09, 0x0E, 0x10, 0x40, 0x08, 0x43, 0x70, 0x80, 0xA0, 0x1D, 0xC4, 0x19
	.byte 0x31, 0x1C, 0xA6, 0x42, 0x04, 0xD2, 0x08, 0x78, 0x49, 0x1C, 0x2D, 0x18, 0xA1, 0x42, 0xFA, 0xD3
	.byte 0x28, 0x04, 0x01, 0x0C, 0x08, 0x12, 0x00, 0x06, 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02, 0x00, 0x02
	.byte 0x08, 0x40, 0x10, 0x43, 0x20, 0x80, 0xA0, 0x1C, 0x80, 0x1B, 0x02, 0xB0, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_02331C60
ov02_02331C60: @ 0x02331C60
	arm_func_end ov02_02331C60
_02331C60:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x08, 0x04, 0x1C, 0x1C, 0x00, 0x23, 0x00, 0x0C, 0x17, 0x1C, 0x2B, 0x70
	.byte 0x01, 0x12, 0x02, 0x02, 0xFF, 0x20, 0x6B, 0x70, 0x09, 0x06, 0x00, 0x02, 0xAB, 0x70, 0x09, 0x0E
	.byte 0x02, 0x40, 0x11, 0x43, 0xEB, 0x70, 0x22, 0x1C, 0x29, 0x80, 0x0B, 0x32, 0x07, 0x21, 0x8A, 0x43
	.byte 0x21, 0x04, 0x16, 0x1F, 0x0A, 0x0C, 0x11, 0x12, 0x09, 0x06, 0x12, 0x02, 0x10, 0x40, 0x09, 0x0E
	.byte 0x08, 0x43, 0x68, 0x80, 0x2D, 0x1D, 0x28, 0x1C, 0x19, 0x1C, 0x32, 0x1C, 0x55, 0xF5, 0x2C, 0xEB
	.byte 0x28, 0x1C, 0x39, 0x1C, 0x22, 0x1C, 0x55, 0xF5, 0xF2, 0xEA, 0xA8, 0x19, 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_02331CC0
ov02_02331CC0: @ 0x02331CC0
	arm_func_end ov02_02331CC0
_02331CC0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0x20, 0x20, 0x70, 0x60, 0x70, 0xA0, 0x70, 0xE0, 0x70, 0x20, 0x71
	.byte 0x60, 0x71, 0xA0, 0x71, 0xE0, 0x71, 0x20, 0x1C, 0x08, 0x30, 0xFF, 0xF7, 0xC1, 0xFF, 0x00, 0x1B
	.byte 0x01, 0x1C, 0x08, 0x39, 0x21, 0x80, 0x10, 0xBD

	arm_func_start ov02_02331CE8
ov02_02331CE8: @ 0x02331CE8
	strdlt fp, ip, [r7], r0
	stmdbge r6, {r8, ip, pc}
	arm_func_end ov02_02331CE8
_02331CF0:
	.byte 0x05, 0xAA, 0xFF, 0xF7, 0xD9, 0xFE, 0x00, 0x26, 0x05, 0x1C, 0x37, 0x1C, 0x02, 0x95, 0x01, 0x96
	.byte 0x00, 0x2D, 0x02, 0xD1, 0x07, 0xB0, 0x30, 0x1C, 0xF0, 0xBD, 0x06, 0x98, 0x01, 0x28, 0x02, 0xD0
	.byte 0x07, 0xB0, 0x30, 0x1C, 0xF0, 0xBD, 0x05, 0x9C, 0x28, 0x1C, 0x08, 0x30, 0x02, 0x90, 0x02, 0xA8
	.byte 0x29, 0x19, 0x04, 0xAA, 0x03, 0xAB, 0xFF, 0xF7, 0xF7, 0xFE, 0x00, 0x28, 0x33, 0xD0, 0x04, 0x99
	.byte 0x01, 0x29, 0x04, 0xD0, 0x02, 0x29, 0x0E, 0xD0, 0x05, 0x29, 0x19, 0xD0, 0x23, 0xE0, 0x01, 0x88
	.byte 0x08, 0x12, 0x00, 0x06, 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02, 0x00, 0x02, 0x08, 0x40, 0x10, 0x43
	.byte 0x00, 0x04, 0x06, 0x0C, 0x17, 0xE0, 0x01, 0x88, 0x08, 0x12, 0x0A, 0x02, 0xFF, 0x21, 0x00, 0x06
	.byte 0x09, 0x02, 0x00, 0x0E, 0x11, 0x40, 0x08, 0x43, 0x00, 0x04, 0x00, 0x0C, 0x01, 0x90, 0x0A, 0xE0
	.byte 0x01, 0x88, 0x08, 0x12, 0x00, 0x06, 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02, 0x00, 0x02, 0x08, 0x40
	.byte 0x10, 0x43, 0x00, 0x04, 0x07, 0x0C, 0x02, 0xA8, 0x29, 0x19, 0x04, 0xAA, 0x03, 0xAB, 0xFF, 0xF7
	.byte 0xC3, 0xFE, 0x00, 0x28, 0xCB, 0xD1, 0x01, 0x2E, 0x02, 0xD1, 0x01, 0x98, 0x01, 0x28, 0x02, 0xD0
	.byte 0x07, 0xB0, 0x00, 0x20, 0xF0, 0xBD, 0x01, 0x2F, 0x02, 0xDB, 0x01, 0x21, 0x00, 0x98, 0x01, 0xE0
	.byte 0x00, 0x98, 0x00, 0x21, 0x01, 0x60, 0x01, 0x20, 0x07, 0xB0, 0xF0, 0xBD

	arm_func_start ov02_02331DBC
ov02_02331DBC: @ 0x02331DBC
	addlt fp, r3, r8, ror r5
	arm_func_end ov02_02331DBC
_02331DC0:
	.byte 0x0D, 0x1C, 0x16, 0x1C, 0x02, 0xA9, 0x01, 0xAA, 0x1C, 0x1C, 0xFF, 0xF7, 0x6D, 0xFE, 0x01, 0x1C
	.byte 0x02, 0xD1, 0x03, 0xB0, 0x00, 0x20, 0x78, 0xBD, 0x02, 0x98, 0xA8, 0x42, 0x02, 0xD0, 0x03, 0xB0
	.byte 0x00, 0x20, 0x78, 0xBD, 0x00, 0x2C, 0x0A, 0xD0, 0x10, 0x20, 0x00, 0x90, 0x01, 0x9A, 0x30, 0x1C
	.byte 0x23, 0x1C, 0x00, 0xF0, 0xCF, 0xFD, 0x01, 0x98, 0x08, 0x38, 0x01, 0x90, 0x03, 0xE0, 0x01, 0x9A
	.byte 0x30, 0x1C, 0x55, 0xF5, 0x4C, 0xEA, 0x01, 0x98, 0x03, 0xB0, 0x78, 0xBD

	arm_func_start ov02_02331E0C
ov02_02331E0C: @ 0x02331E0C
	addlt fp, r4, r0, lsl r5
	arm_func_end ov02_02331E0C
_02331E10:
	.byte 0x01, 0x21, 0x04, 0x1C, 0x01, 0xAA, 0x09, 0x02, 0x01, 0xA8, 0x01, 0x80, 0x1D, 0x4B, 0x02, 0x32
	.byte 0x07, 0x21, 0x18, 0x78, 0x5B, 0x1C, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E, 0xF9, 0xD1, 0x1A, 0x48
	.byte 0x01, 0x21, 0x00, 0x68, 0x01, 0xAA, 0x02, 0x23, 0xFF, 0xF7, 0x12, 0xFF, 0x02, 0x21, 0x01, 0xAA
	.byte 0x0B, 0x1C, 0xFF, 0xF7, 0x0D, 0xFF, 0x15, 0x49, 0x09, 0x6D, 0x00, 0x29, 0x04, 0xD0, 0x05, 0x21
	.byte 0x01, 0xAA, 0x02, 0x23, 0xFF, 0xF7, 0x04, 0xFF, 0x01, 0xAA, 0x03, 0x21, 0x02, 0x32, 0x07, 0x23
	.byte 0xFF, 0xF7, 0xFE, 0xFE, 0x0D, 0x49, 0x03, 0x1C, 0x09, 0x6D, 0x00, 0x29, 0x05, 0xD0, 0x0C, 0x4A
	.byte 0x04, 0x21, 0x06, 0x23, 0xFF, 0xF7, 0xF4, 0xFE, 0x03, 0x1C, 0x00, 0x20, 0x00, 0x90, 0x20, 0x1C
	.byte 0x05, 0x4C, 0x08, 0x4A, 0x24, 0x68, 0x02, 0x21, 0x1B, 0x1B, 0x08, 0x33, 0xFF, 0xF7, 0x86, 0xFE
	.byte 0x04, 0xB0, 0x10, 0xBD, 0x5C, 0xFC, 0x34, 0x02, 0x08, 0x30, 0x35, 0x02, 0xD0, 0x94, 0x35, 0x02
	.byte 0x78, 0x99, 0x35, 0x02, 0x04, 0x9A, 0x35, 0x02

	arm_func_start ov02_02331EA8
ov02_02331EA8: @ 0x02331EA8
	arm_func_end ov02_02331EA8
_02331EA8:
	.byte 0x08, 0xB5, 0x49, 0xF5, 0xA0, 0xED, 0x01, 0x20
	.byte 0x08, 0xBD, 0x00, 0x00

	arm_func_start ov02_02331EB4
ov02_02331EB4: @ 0x02331EB4
	addslt fp, r3, r8, lsl r5
	arm_func_end ov02_02331EB4
_02331EB8:
	.byte 0x39, 0x49, 0x04, 0x1C, 0x08, 0x78, 0x22, 0x1C
	.byte 0x0C, 0x32, 0x20, 0x73, 0x48, 0x78, 0x50, 0x70, 0x88, 0x78, 0x90, 0x70, 0xC8, 0x78, 0x01, 0xA9
	.byte 0x02, 0x31, 0xD0, 0x70, 0x33, 0x48, 0x02, 0x78, 0x0A, 0x70, 0x42, 0x78, 0x4A, 0x70, 0x82, 0x78
	.byte 0x8A, 0x70, 0xC2, 0x78, 0xCA, 0x70, 0x02, 0x79, 0x40, 0x79, 0x0A, 0x71, 0x48, 0x71, 0x00, 0xA9
	.byte 0x8A, 0x79, 0xFD, 0x20, 0x10, 0x40, 0x88, 0x71, 0x00, 0xA8, 0xFF, 0xF7, 0xD5, 0xFF, 0x00, 0xA9
	.byte 0x0A, 0x78, 0x29, 0x48, 0x02, 0x70, 0x4A, 0x78, 0x42, 0x70, 0x8A, 0x78, 0x82, 0x70, 0xCA, 0x78
	.byte 0xC2, 0x70, 0x0A, 0x79, 0x02, 0x71, 0x4A, 0x79, 0x42, 0x71, 0x01, 0xA8, 0x02, 0x30, 0x06, 0x22
	.byte 0x55, 0xF5, 0x12, 0xEA, 0x00, 0x28, 0x0F, 0xDC, 0x00, 0xA9, 0x08, 0x78, 0x20, 0x70, 0x48, 0x78
	.byte 0x60, 0x70, 0x88, 0x78, 0xA0, 0x70, 0xC8, 0x78, 0xE0, 0x70, 0x08, 0x79, 0x20, 0x71, 0x48, 0x79
	.byte 0x01, 0xA9, 0x02, 0x31, 0x60, 0x71, 0x0E, 0xE0, 0x01, 0xA9, 0x02, 0x31, 0x08, 0x78, 0x20, 0x70
	.byte 0x48, 0x78, 0x60, 0x70, 0x88, 0x78, 0xA0, 0x70, 0xC8, 0x78, 0xE0, 0x70, 0x08, 0x79, 0x20, 0x71
	.byte 0x48, 0x79, 0x00, 0xA9, 0x60, 0x71, 0x08, 0x78, 0xA0, 0x71, 0x48, 0x78, 0xE0, 0x71, 0x88, 0x78
	.byte 0x20, 0x72, 0xC8, 0x78, 0x60, 0x72, 0x08, 0x79, 0xA0, 0x72, 0x48, 0x79, 0xE0, 0x72, 0x0B, 0x48
	.byte 0x40, 0x68, 0x00, 0x28, 0x08, 0xD0, 0x0B, 0xA8, 0x00, 0xA9, 0x02, 0xF0, 0x1B, 0xF9, 0x01, 0xA9
	.byte 0x03, 0xA8, 0x02, 0x31, 0x02, 0xF0, 0x16, 0xF9, 0x01, 0x20, 0x13, 0xB0, 0x18, 0xBD, 0xC0, 0x46
	.byte 0xC8, 0x30, 0x35, 0x02, 0x80, 0x99, 0x35, 0x02, 0x78, 0x99, 0x35, 0x02, 0x08, 0x30, 0x35, 0x02

	arm_func_start ov02_02331FB0
ov02_02331FB0: @ 0x02331FB0
	strdlt fp, ip, [r6], r8
	mrsls r1, apsr
	mrsls r3, apsr
	arm_func_end ov02_02331FB0
_02331FBC:
	.byte 0x05, 0x91, 0x00, 0x21
	.byte 0x00, 0x91, 0x01, 0x88, 0x03, 0xAB, 0x08, 0x12, 0x00, 0x06, 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02
	.byte 0x00, 0x02, 0x08, 0x40, 0x10, 0x43, 0x00, 0x04, 0x00, 0x0C, 0x02, 0x90, 0x01, 0x9A, 0x02, 0x99
	.byte 0x05, 0xA8, 0x51, 0x18, 0x04, 0xAA, 0xFF, 0xF7, 0x97, 0xFD, 0x05, 0x1C, 0x00, 0xD1, 0xB7, 0xE0
	.byte 0x04, 0x9A, 0x5D, 0x48, 0x11, 0x1A, 0x09, 0x29, 0x41, 0xD8, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88
	.byte 0x09, 0x04, 0x09, 0x14, 0x8F, 0x44, 0x12, 0x00, 0x32, 0x00, 0x4E, 0x00, 0x78, 0x00, 0xA2, 0x00
	.byte 0xBE, 0x00, 0xBE, 0x00, 0xBE, 0x00, 0xBE, 0x00, 0x1E, 0x01, 0x54, 0x4B, 0x00, 0x20, 0x1A, 0x1C
	.byte 0x01, 0x1C, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0x9A, 0x18, 0x1C, 0x29, 0x1C
	.byte 0x55, 0xF5, 0x34, 0xE9, 0x01, 0x20, 0x00, 0x90, 0x87, 0xE0, 0x29, 0x88, 0x08, 0x12, 0x00, 0x06
	.byte 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02, 0x00, 0x02, 0x08, 0x40, 0x10, 0x43, 0x00, 0x04, 0x01, 0x0C
	.byte 0x47, 0x48, 0x01, 0x60, 0x79, 0xE0, 0x2B, 0x88, 0x46, 0x49, 0x00, 0x20, 0x1A, 0x12, 0x12, 0x06
	.byte 0x14, 0x0E, 0xFF, 0x22, 0x1B, 0x02, 0x12, 0x02, 0x1A, 0x40, 0x22, 0x43, 0x12, 0x04, 0x13, 0x0C
	.byte 0x57, 0x22, 0x92, 0x00, 0x40, 0x1C, 0x8B, 0x50, 0x28, 0x31, 0x04, 0x28, 0xFA, 0xDB, 0x64, 0xE0
	.byte 0x2B, 0x88, 0x3C, 0x48, 0x00, 0x21, 0x1A, 0x12, 0x12, 0x06, 0x14, 0x0E, 0xFF, 0x22, 0x1B, 0x02
	.byte 0x12, 0x02, 0x1A, 0x40, 0x22, 0x43, 0x12, 0x04, 0x13, 0x0C, 0x16, 0x22, 0x12, 0x01, 0x49, 0x1C
	.byte 0x83, 0x50, 0x28, 0x30, 0x04, 0x29, 0xFA, 0xDB, 0x4F, 0xE0, 0x29, 0x88, 0x08, 0x12, 0x00, 0x06
	.byte 0x02, 0x0E, 0xFF, 0x20, 0x09, 0x02, 0x00, 0x02, 0x08, 0x40, 0x10, 0x43, 0x00, 0x04, 0x01, 0x0C
	.byte 0x2B, 0x48, 0x41, 0x60, 0x41, 0xE0, 0x40, 0x1D, 0x12, 0x1A, 0x28, 0x20, 0x50, 0x43, 0x2A, 0x49
	.byte 0x20, 0x22, 0x08, 0x18, 0x00, 0x21, 0x55, 0xF5, 0x18, 0xE9, 0x25, 0x48, 0x27, 0x49, 0x00, 0x6B
	.byte 0x01, 0x28, 0x15, 0xD1, 0x04, 0x9A, 0x24, 0x48, 0x52, 0x1A, 0x28, 0x21, 0x51, 0x43, 0x44, 0x18
	.byte 0x03, 0x98, 0x00, 0x26, 0x00, 0x28, 0x28, 0xDD, 0x37, 0x1C, 0xE9, 0x57, 0x20, 0x1C, 0x6D, 0x1C
	.byte 0x02, 0xF0, 0x46, 0xF8, 0x24, 0x18, 0x03, 0x98, 0x76, 0x1C, 0x86, 0x42, 0xF5, 0xDB, 0x1C, 0xE0
	.byte 0x04, 0x9A, 0x19, 0x48, 0x52, 0x1A, 0x28, 0x21, 0x51, 0x43, 0x40, 0x18, 0x03, 0x9A, 0x29, 0x1C
	.byte 0x55, 0xF5, 0xBC, 0xE8, 0x11, 0xE0, 0x16, 0x4B, 0x00, 0x20, 0x1A, 0x1C, 0x01, 0x1C, 0x03, 0xC2
	.byte 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2, 0x03, 0xC2
	.byte 0x03, 0x9A, 0x18, 0x1C, 0x29, 0x1C, 0x55, 0xF5, 0xAA, 0xE8, 0x01, 0x9A, 0x02, 0x99, 0x05, 0xA8
	.byte 0x51, 0x18, 0x04, 0xAA, 0x03, 0xAB, 0xFF, 0xF7, 0xDF, 0xFC, 0x05, 0x1C, 0x00, 0xD0, 0x47, 0xE7
	.byte 0x00, 0x98, 0x06, 0xB0, 0xF8, 0xBD, 0xC0, 0x46, 0x01, 0x02, 0x00, 0x00, 0x24, 0x98, 0x35, 0x02
	.byte 0x50, 0x98, 0x35, 0x02, 0x24, 0x97, 0x35, 0x02, 0x88, 0x98, 0x35, 0x02, 0x06, 0x02, 0x00, 0x00
	.byte 0x20, 0x99, 0x35, 0x02

	arm_func_start ov02_02332184
ov02_02332184: @ 0x02332184
	arm_func_end ov02_02332184
_02332184:
	.byte 0xF0, 0xB4, 0x14, 0x1C, 0x00, 0x22, 0x0D, 0x1C, 0x13, 0x1C, 0x00, 0x2C
	.byte 0x4F, 0xDD, 0x1F, 0x27, 0xE9, 0x56, 0x63, 0x29, 0x27, 0xDC, 0x32, 0xDA, 0x61, 0x29, 0x21, 0xDC
	.byte 0x2F, 0xDA, 0x0E, 0x1C, 0x30, 0x3E, 0x16, 0x2E, 0x31, 0xD8, 0xB6, 0x19, 0x7E, 0x44, 0xF6, 0x88
	.byte 0x36, 0x04, 0x36, 0x14, 0xB7, 0x44, 0x44, 0x00, 0x44, 0x00, 0x44, 0x00, 0x44, 0x00, 0x44, 0x00
	.byte 0x44, 0x00, 0x44, 0x00, 0x44, 0x00, 0x44, 0x00, 0x44, 0x00, 0x56, 0x00, 0x56, 0x00, 0x56, 0x00
	.byte 0x56, 0x00, 0x56, 0x00, 0x56, 0x00, 0x56, 0x00, 0x50, 0x00, 0x50, 0x00, 0x50, 0x00, 0x50, 0x00
	.byte 0x50, 0x00, 0x50, 0x00, 0x62, 0x29, 0x0C, 0xD0, 0x11, 0xE0, 0x65, 0x29, 0x03, 0xDC, 0x08, 0xDA
	.byte 0x64, 0x29, 0x06, 0xD0, 0x0B, 0xE0, 0x66, 0x29, 0x03, 0xD0, 0x08, 0xE0, 0x30, 0x39, 0x52, 0x18
	.byte 0x08, 0xE0, 0x57, 0x39, 0x52, 0x18, 0x05, 0xE0, 0x37, 0x39, 0x52, 0x18, 0x02, 0xE0, 0x00, 0x20
	.byte 0xF0, 0xBC, 0x70, 0x47, 0xDE, 0x0F, 0xD9, 0x07, 0x89, 0x1B, 0xF9, 0x41, 0x71, 0x18, 0x01, 0xD1
	.byte 0x12, 0x01, 0x03, 0xE0, 0x9E, 0x19, 0x71, 0x10, 0x42, 0x54, 0x00, 0x22, 0x5B, 0x1C, 0xA3, 0x42
	.byte 0xB0, 0xDB, 0x01, 0x20, 0xF0, 0xBC, 0x70, 0x47

	arm_func_start ov02_02332238
ov02_02332238: @ 0x02332238
	strdlt fp, ip, [sl], r8
	andls r2, r0, r1
	ldmdbmi r8, {r0, r1, r2, r4, r6, fp, lr} ^
	b _02CEF7A8
	arm_func_end ov02_02332238
_02332248:
	.byte 0x57, 0x49, 0x08, 0x68, 0x03, 0x28, 0x00, 0xD9
	.byte 0x9F, 0xE0, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14, 0x87, 0x44, 0x06, 0x00
	.byte 0x0E, 0x00, 0x06, 0x01, 0x1C, 0x01, 0x51, 0x48, 0x00, 0x21, 0xC1, 0x60, 0x94, 0xE0, 0x49, 0x68
	.byte 0x00, 0x29, 0x03, 0xD1, 0x06, 0x20, 0xC0, 0x43, 0x00, 0x90, 0x8D, 0xE0, 0x4B, 0x48, 0x4C, 0x4E
	.byte 0x4C, 0x4D, 0x01, 0x61, 0x00, 0x27, 0x01, 0xAC, 0x01, 0xA8, 0x31, 0x1C, 0x20, 0x22, 0x55, 0xF5
	.byte 0x06, 0xE8, 0x00, 0x21, 0x09, 0xA8, 0x01, 0x70, 0x01, 0xA8, 0x57, 0xF5, 0xEE, 0xE9, 0x10, 0x28
	.byte 0x0E, 0xD8, 0x0A, 0x28, 0x05, 0xD3, 0x20, 0xD0, 0x0D, 0x28, 0x27, 0xD0, 0x10, 0x28, 0x3B, 0xD0
	.byte 0x50, 0xE0, 0x00, 0x28, 0x01, 0xD8, 0x50, 0xD0, 0x4C, 0xE0, 0x05, 0x28, 0x07, 0xD0, 0x49, 0xE0
	.byte 0x1A, 0x28, 0x01, 0xD8, 0x27, 0xD0, 0x45, 0xE0, 0x20, 0x28, 0x3A, 0xD0, 0x42, 0xE0, 0x37, 0x48
	.byte 0x01, 0x21, 0xC1, 0x60, 0x20, 0x78, 0x28, 0x70, 0x60, 0x78, 0x68, 0x70, 0xA0, 0x78, 0xA8, 0x70
	.byte 0xE0, 0x78, 0xE8, 0x70, 0x20, 0x79, 0x28, 0x71, 0x37, 0xE0, 0x30, 0x48, 0x01, 0x21, 0xC1, 0x60
	.byte 0x28, 0x1C, 0x21, 0x1C, 0x0A, 0x22, 0xFF, 0xF7, 0x45, 0xFF, 0x2E, 0xE0, 0x2B, 0x48, 0x02, 0x21
	.byte 0xC1, 0x60, 0x23, 0x1C, 0x2A, 0x1C, 0x0D, 0x21, 0x18, 0x78, 0x5B, 0x1C, 0x10, 0x70, 0x52, 0x1C
	.byte 0x49, 0x1E, 0xF9, 0xD1, 0x21, 0xE0, 0x25, 0x48, 0x02, 0x21, 0xC1, 0x60, 0x28, 0x1C, 0x21, 0x1C
	.byte 0x1A, 0x22, 0xFF, 0xF7, 0x2F, 0xFF, 0x18, 0xE0, 0x20, 0x48, 0x03, 0x21, 0xC1, 0x60, 0x23, 0x1C
	.byte 0x2A, 0x1C, 0x10, 0x21, 0x18, 0x78, 0x5B, 0x1C, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E, 0xF9, 0xD1
	.byte 0x0B, 0xE0, 0x1A, 0x48, 0x03, 0x21, 0xC1, 0x60, 0x28, 0x1C, 0x21, 0x1C, 0x20, 0x22, 0xFF, 0xF7
	.byte 0x19, 0xFF, 0x02, 0xE0, 0x06, 0x20, 0xC0, 0x43, 0x00, 0x90, 0x7F, 0x1C, 0x28, 0x36, 0x20, 0x35
	.byte 0x04, 0x2F, 0x91, 0xDB, 0x18, 0xE0, 0x11, 0x48, 0x04, 0x21, 0x13, 0x4C, 0x13, 0x4B, 0xC1, 0x60
	.byte 0x08, 0x22, 0x03, 0xCB, 0x03, 0xC4, 0x52, 0x1E, 0xFB, 0xD1, 0x0D, 0xE0, 0x0B, 0x48, 0x05, 0x21
	.byte 0x0D, 0x4C, 0x0E, 0x4B, 0xC1, 0x60, 0x08, 0x22, 0x03, 0xCB, 0x03, 0xC4, 0x52, 0x1E, 0xFB, 0xD1
	.byte 0x02, 0xE0, 0x06, 0x20, 0xC0, 0x43, 0x00, 0x90, 0x00, 0x98, 0x0A, 0xB0, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0x3C, 0x96, 0x35, 0x02, 0x24, 0x98, 0x35, 0x02, 0x50, 0x98, 0x35, 0x02, 0x50, 0x96, 0x35, 0x02
	.byte 0x88, 0x98, 0x35, 0x02, 0x64, 0x96, 0x35, 0x02, 0xE4, 0x96, 0x35, 0x02, 0x20, 0x99, 0x35, 0x02

	arm_func_start ov02_023323C0
ov02_023323C0: @ 0x023323C0
	strdlt fp, ip, [fp], r0
	svcne #0x602400
	stmmi pc, {r1, ip, pc} ^
	strls r2, [r3], #-0x101
	stcne p4, c9, [r6], #-4
	bic r6, ip, r1, asr #3
	addeq r2, r0, sp, ror r0
	bl FUN_009EF900
	stmibvs r0, {r0, r3, r6, r7, fp, lr} ^
	stmdble r0, {r1, r3, fp, sp}
	stmdane r0, {r0, r1, r6, r7, r8, sp, lr, pc}
	stmhi r0, {r3, r4, r5, r6, sl, lr} ^
	strne r0, [r0], #-0x400
	cmneq sl, #0x87000000
	eorseq r0, r4, r4, lsl r0
	addseq r0, r8, sl, asr #32
	arm_func_end ov02_023323C0
_02332400:
	.byte 0x00, 0x01, 0x24, 0x01, 0xCE, 0x01, 0x2A, 0x02, 0xB2, 0x02, 0x50, 0x03, 0xFF, 0xF7, 0xD2, 0xF9
	.byte 0x02, 0x90, 0x01, 0x28, 0x01, 0xD0, 0x01, 0x26, 0xAB, 0xE1, 0xBB, 0x48, 0x03, 0x21, 0x81, 0x63
	.byte 0x01, 0xF0, 0xCE, 0xFF, 0xB8, 0x48, 0x02, 0x21, 0xC1, 0x61, 0xA2, 0xE1, 0xFF, 0xF7, 0x18, 0xF8
	.byte 0x02, 0x90, 0x01, 0x28, 0x01, 0xD0, 0x01, 0x26, 0x9B, 0xE1, 0xB3, 0x48, 0x03, 0x21, 0xC1, 0x61
	.byte 0x97, 0xE1, 0x02, 0x20, 0x01, 0x1C, 0x00, 0x22, 0x9C, 0xF7, 0xB0, 0xEE, 0x04, 0x1C, 0x04, 0xD5
	.byte 0x01, 0x20, 0xC0, 0x43, 0x02, 0x90, 0x01, 0x26, 0x8B, 0xE1, 0x09, 0xAD, 0x00, 0x21, 0x29, 0x60
	.byte 0x69, 0x60, 0x08, 0x23, 0x04, 0xAA, 0x13, 0x75, 0x02, 0x23, 0x53, 0x75, 0xA7, 0x4B, 0xD3, 0x82
	.byte 0x0A, 0x91, 0x29, 0x1C, 0x9C, 0xF7, 0xB0, 0xEE, 0x02, 0x90, 0x00, 0x28, 0x04, 0xDA, 0x01, 0x20
	.byte 0xC0, 0x43, 0x02, 0x90, 0x01, 0x26, 0x74, 0xE1, 0x9F, 0x48, 0x04, 0x21, 0xC1, 0x61, 0x70, 0xE1
	.byte 0x01, 0xF0, 0x56, 0xFE, 0x9E, 0x49, 0xC9, 0x68, 0x88, 0x42, 0x07, 0xD3, 0x20, 0x1C, 0x9C, 0xF7
	.byte 0x94, 0xEF, 0x02, 0x20, 0xC0, 0x43, 0x02, 0x90, 0x01, 0x26, 0x62, 0xE1, 0x08, 0x21, 0x04, 0xA8
	.byte 0x01, 0x73, 0x98, 0x48, 0x07, 0xA9, 0xFF, 0xF7, 0xFD, 0xFC, 0x07, 0xA8, 0x02, 0x22, 0x00, 0x90
	.byte 0x95, 0x49, 0x20, 0x1C, 0x92, 0x02, 0x04, 0x23, 0x9C, 0xF7, 0xDC, 0xEE, 0x00, 0x28, 0x6C, 0xDD
	.byte 0x91, 0x48, 0x92, 0x49, 0xFF, 0xF7, 0x08, 0xFC, 0x00, 0x28, 0x66, 0xD0, 0x01, 0xF0, 0x30, 0xFE
	.byte 0x8F, 0x49, 0x41, 0x18, 0x8A, 0x48, 0xC1, 0x60, 0x87, 0x48, 0x05, 0x21, 0xC1, 0x61, 0x04, 0x21
	.byte 0x81, 0x63, 0x01, 0xF0, 0x65, 0xFF, 0x3C, 0xE1, 0x87, 0x48, 0xFF, 0xF7, 0x87, 0xFC, 0x03, 0x1C
	.byte 0x81, 0x48, 0x85, 0x4A, 0x43, 0x61, 0x20, 0x1C, 0x07, 0xA9, 0xFF, 0xF7, 0xC7, 0xFA, 0x01, 0xF0
	.byte 0x17, 0xFE, 0x03, 0x90, 0x7C, 0x48, 0x06, 0x21, 0xC1, 0x61, 0x2A, 0xE1, 0x01, 0xF0, 0x10, 0xFE
	.byte 0x7B, 0x49, 0xC9, 0x68, 0x88, 0x42, 0x07, 0xD3, 0x20, 0x1C, 0x9C, 0xF7, 0x4E, 0xEF, 0x03, 0x20
	.byte 0xC0, 0x43, 0x02, 0x90, 0x01, 0x26, 0x1C, 0xE1, 0x07, 0xA8, 0x02, 0x22, 0x00, 0x90, 0x76, 0x49
	.byte 0x20, 0x1C, 0x92, 0x02, 0x04, 0x23, 0x9C, 0xF7, 0x9E, 0xEE, 0x00, 0x28, 0x2E, 0xDD, 0x72, 0x48
	.byte 0x74, 0x4A, 0x70, 0x4B, 0x03, 0x21, 0xFF, 0xF7, 0x31, 0xFC, 0x00, 0x28, 0x26, 0xD0, 0x71, 0x48
	.byte 0x06, 0xA9, 0x05, 0xAA, 0xFF, 0xF7, 0x00, 0xFB, 0x05, 0x1C, 0x06, 0x99, 0x6E, 0x48, 0x81, 0x42
	.byte 0x1B, 0xD1, 0x01, 0xF0, 0xE5, 0xFD, 0x6D, 0x4A, 0x04, 0x90, 0x08, 0x21, 0x28, 0x78, 0x6D, 0x1C
	.byte 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E, 0xF9, 0xD1, 0x69, 0x48, 0x04, 0xA9, 0x04, 0x22, 0x01, 0xF0
	.byte 0xC3, 0xFD, 0x00, 0x20, 0x01, 0x90, 0x5C, 0x48, 0x07, 0x21, 0xC1, 0x61, 0x05, 0x21, 0x81, 0x63
	.byte 0x5B, 0x48, 0x89, 0x1F, 0xC1, 0x60, 0x01, 0xF0, 0x0B, 0xFF, 0xE2, 0xE0, 0x01, 0xF0, 0xC8, 0xFD
	.byte 0xFA, 0x22, 0x03, 0x99, 0x92, 0x00, 0x89, 0x18, 0x88, 0x42, 0x00, 0xD2, 0xD9, 0xE0, 0x52, 0x48
	.byte 0x05, 0x21, 0xC1, 0x61, 0xD5, 0xE0, 0x57, 0x48, 0x5A, 0x49, 0x59, 0x4A, 0x08, 0x23, 0xFF, 0xF7
	.byte 0x77, 0xFB, 0x4D, 0x4B, 0x53, 0x4A, 0x58, 0x63, 0x4E, 0x48, 0x04, 0x21, 0x00, 0x90, 0x4E, 0x48
	.byte 0x5B, 0x6B, 0xFF, 0xF7, 0xDB, 0xFA, 0x03, 0x1C, 0x47, 0x48, 0x4B, 0x4A, 0x43, 0x61, 0x20, 0x1C
	.byte 0x07, 0xA9, 0xFF, 0xF7, 0x53, 0xFA, 0x01, 0xF0, 0xA3, 0xFD, 0x03, 0x90, 0x00, 0x20, 0x12, 0x25
	.byte 0x4D, 0x4F, 0x01, 0x1C, 0x02, 0x1C, 0x03, 0x1C, 0xAC, 0x46, 0x0F, 0xC7, 0x65, 0x46, 0x6D, 0x1E
	.byte 0x0F, 0xC7, 0xAC, 0x46, 0xF9, 0xD1, 0x0F, 0xC7, 0x38, 0x60, 0x3B, 0x48, 0x08, 0x21, 0xC1, 0x61
	.byte 0xA7, 0xE0, 0x07, 0xA8, 0x02, 0x22, 0x00, 0x90, 0x3B, 0x49, 0x20, 0x1C, 0x92, 0x02, 0x04, 0x23
	.byte 0x9C, 0xF7, 0x28, 0xEE, 0x00, 0x28, 0x1F, 0xDD, 0x37, 0x48, 0x3A, 0x4A, 0x3B, 0x4B, 0x05, 0x21
	.byte 0xFF, 0xF7, 0xBC, 0xFB, 0x30, 0x49, 0x00, 0x28, 0x48, 0x63, 0x15, 0xD0, 0x35, 0x48, 0xFF, 0xF7
	.byte 0xAF, 0xFC, 0x00, 0x28, 0x10, 0xD0, 0x39, 0x49, 0x14, 0x20, 0x08, 0x56, 0x00, 0x28, 0x02, 0xD0
	.byte 0x01, 0x21, 0x29, 0x48, 0x01, 0xE0, 0x28, 0x48, 0x00, 0x21, 0x01, 0x70, 0x00, 0x20, 0x01, 0x90
	.byte 0x25, 0x48, 0x09, 0x21, 0xC1, 0x61, 0x7C, 0xE0, 0x01, 0xF0, 0x62, 0xFD, 0xFA, 0x22, 0x03, 0x99
	.byte 0x92, 0x00, 0x89, 0x18, 0x88, 0x42, 0x74, 0xD3, 0x01, 0x98, 0x40, 0x1C, 0x01, 0x90, 0x0A, 0x28
	.byte 0x07, 0xDB, 0x20, 0x1C, 0x9C, 0xF7, 0x98, 0xEE, 0x01, 0x20, 0xC0, 0x43, 0x02, 0x90, 0x01, 0x26
	.byte 0x67, 0xE0, 0x19, 0x48, 0x07, 0x21, 0xC1, 0x61, 0x63, 0xE0, 0x1E, 0x48, 0x24, 0x49, 0x25, 0x4A
	.byte 0x01, 0x23, 0xFF, 0xF7, 0x05, 0xFB, 0x14, 0x4B, 0x1A, 0x4A, 0x58, 0x63, 0x1B, 0x48, 0x06, 0x21
	.byte 0x00, 0x90, 0x15, 0x48, 0x5B, 0x6B, 0xFF, 0xF7, 0x69, 0xFA, 0x0F, 0x49, 0x48, 0x61, 0xFE, 0xF7
	.byte 0xC9, 0xFD, 0x07, 0x28, 0x0A, 0xD0, 0x01, 0xF0, 0x33, 0xFD, 0xFA, 0x21, 0x89, 0x00, 0x40, 0x18
	.byte 0x03, 0x90, 0x0A, 0x20, 0x08, 0x49, 0x01, 0x90, 0xC8, 0x61, 0x42, 0xE0, 0x06, 0x4B, 0x0A, 0x4A
	.byte 0x5B, 0x69, 0x20, 0x1C, 0x07, 0xA9, 0xFF, 0xF7, 0xD1, 0xF9, 0x01, 0xF0, 0x21, 0xFD, 0x03, 0x90
	.byte 0x01, 0x48, 0x0A, 0x21, 0xC1, 0x61, 0x34, 0xE0, 0xD0, 0x94, 0x35, 0x02, 0xE6, 0x01, 0x00, 0x00
	.byte 0x08, 0x30, 0x35, 0x02, 0x90, 0x99, 0x35, 0x02, 0x04, 0xA2, 0x35, 0x02, 0x20, 0x95, 0x35, 0x02
	.byte 0x30, 0x75, 0x00, 0x00, 0x04, 0x9A, 0x35, 0x02, 0x01, 0x01, 0x00, 0x00, 0xA0, 0x99, 0x35, 0x02
	.byte 0xA8, 0x99, 0x35, 0x02, 0x02, 0x01, 0x00, 0x00, 0x24, 0x97, 0x35, 0x02, 0x10, 0x98, 0x35, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0xD0, 0x94, 0x35, 0x02, 0x01, 0xF0, 0xFA, 0xFC, 0xFA, 0x22, 0x03, 0x99
	.byte 0x92, 0x00, 0x89, 0x18, 0x88, 0x42, 0x0C, 0xD3, 0x01, 0x98, 0x40, 0x1C, 0x01, 0x90, 0x0A, 0x28
	.byte 0x04, 0xDB, 0x01, 0x26, 0xFF, 0xF7, 0x68, 0xFD, 0x02, 0x90, 0x02, 0xE0, 0x0C, 0x48, 0x09, 0x21
	.byte 0xC1, 0x61, 0x00, 0x2E, 0x04, 0xD1, 0x0A, 0x48, 0x00, 0x69, 0x00, 0x28, 0x00, 0xD1, 0x2B, 0xE6
	.byte 0x00, 0x2C, 0x02, 0xD0, 0x20, 0x1C, 0x9C, 0xF7, 0x20, 0xEE, 0x05, 0x48, 0x00, 0x69, 0x00, 0x28
	.byte 0x02, 0xD0, 0x07, 0x20, 0xC0, 0x43, 0x02, 0x90, 0x02, 0x98, 0x0B, 0xB0, 0xF0, 0xBD, 0xC0, 0x46
	.byte 0xD0, 0x94, 0x35, 0x02, 0x10, 0xB5, 0xFF, 0xF7, 0x0B, 0xFE, 0x04, 0x1C, 0x09, 0x48, 0x84, 0x67
	.byte 0xFE, 0xF7, 0xE8, 0xFE, 0x01, 0x2C, 0x02, 0xD1, 0x06, 0x21, 0x06, 0x48, 0x01, 0xE0, 0x05, 0x48
	.byte 0x07, 0x21, 0x81, 0x63, 0x00, 0x21, 0x04, 0x48, 0xC9, 0x43, 0xC1, 0x60, 0x01, 0xF0, 0xF8, 0xFD
	.byte 0x10, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02, 0x08, 0x30, 0x35, 0x02

	arm_func_start ov02_023327DC
ov02_023327DC: @ 0x023327DC
	arm_func_end ov02_023327DC
_023327DC:
	.byte 0xF8, 0xB5, 0xEA, 0xB0
	.byte 0x00, 0x90, 0x6B, 0x48, 0x14, 0x1C, 0x0D, 0x1C, 0x12, 0x90, 0x13, 0x90, 0x07, 0x20, 0x21, 0x1C
	.byte 0x01, 0x42, 0x02, 0xD1, 0x70, 0x9A, 0x10, 0x42, 0x02, 0xD0, 0x6A, 0xB0, 0x00, 0x20, 0xF8, 0xBD
	.byte 0xE0, 0x08, 0x05, 0x90, 0x02, 0x28, 0x02, 0xDA, 0x6A, 0xB0, 0x00, 0x20, 0xF8, 0xBD, 0x1A, 0xA8
	.byte 0x19, 0x1C, 0xD2, 0x00, 0x00, 0xF0, 0xBE, 0xF9, 0x07, 0x90, 0x00, 0x98, 0x29, 0x1C, 0x08, 0x30
	.byte 0x22, 0x1C, 0x54, 0xF5, 0x3C, 0xED, 0x16, 0xAB, 0x12, 0xAA, 0x08, 0x21, 0x10, 0x78, 0x52, 0x1C
	.byte 0x18, 0x70, 0x5B, 0x1C, 0x49, 0x1E, 0xF9, 0xD1, 0x00, 0x20, 0x08, 0x90, 0x05, 0x98, 0xC0, 0x17
	.byte 0x06, 0x90, 0x05, 0x98, 0x01, 0x24, 0x01, 0x28, 0x00, 0xDA, 0x8D, 0xE0, 0x08, 0x9A, 0x06, 0x99
	.byte 0xD3, 0x17, 0x5D, 0xF5, 0x18, 0xEB, 0x03, 0x90, 0x00, 0x20, 0x02, 0x91, 0x0A, 0x90, 0x00, 0x20
	.byte 0x00, 0x21, 0x0C, 0x90, 0x08, 0x1C, 0x08, 0x43, 0x10, 0x90, 0x00, 0x98, 0xE1, 0x00, 0x45, 0x18
	.byte 0x2B, 0x1C, 0x18, 0xAA, 0x08, 0x21, 0x18, 0x78, 0x5B, 0x1C, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E
	.byte 0xF9, 0xD1, 0x16, 0xAA, 0x07, 0x99, 0x1A, 0xA8, 0x13, 0x1C, 0x00, 0xF0, 0xA7, 0xFB, 0x03, 0x98
	.byte 0xE1, 0x17, 0x23, 0x18, 0x02, 0x98, 0x41, 0x41, 0xFF, 0x20, 0x00, 0x06, 0x08, 0x40, 0x00, 0x0E
	.byte 0x09, 0x90, 0xFF, 0x20, 0x00, 0x04, 0x08, 0x40, 0x00, 0x0A, 0x0B, 0x90, 0xFF, 0x20, 0x00, 0x02
	.byte 0x00, 0x22, 0x08, 0x40, 0x1A, 0x40, 0x06, 0x02, 0x12, 0x0E, 0x0D, 0x92, 0x32, 0x43, 0x00, 0x0E
	.byte 0x0D, 0x92, 0x0E, 0x90, 0xFF, 0x20, 0x00, 0x22, 0x08, 0x40, 0x1A, 0x40, 0x06, 0x06, 0x12, 0x0A
	.byte 0x11, 0x92, 0x32, 0x43, 0x00, 0x0A, 0x11, 0x92, 0x0F, 0x90, 0x00, 0x20, 0x0A, 0x1C, 0x02, 0x40
	.byte 0xFF, 0x20, 0x00, 0x06, 0x18, 0x40, 0x06, 0x0E, 0x00, 0x02, 0x84, 0x46, 0x00, 0x20, 0x01, 0x40
	.byte 0xFF, 0x20, 0x00, 0x04, 0x12, 0x02, 0x18, 0x40, 0x32, 0x43, 0x06, 0x0A, 0x07, 0x06, 0xFF, 0x20
	.byte 0x09, 0x06, 0x18, 0x40, 0x31, 0x43, 0x06, 0x06, 0xFF, 0x20, 0x00, 0x02, 0x18, 0x40, 0x00, 0x02
	.byte 0x30, 0x43, 0x01, 0x43, 0x10, 0x98, 0x3B, 0x1C, 0x03, 0x43, 0x60, 0x46, 0x11, 0x43, 0x02, 0x1C
	.byte 0x0F, 0x98, 0x1A, 0x43, 0x01, 0x43, 0x11, 0x98, 0x02, 0x43, 0x0E, 0x98, 0x01, 0x43, 0x0D, 0x98
	.byte 0x02, 0x43, 0x0C, 0x98, 0x01, 0x43, 0x0B, 0x98, 0x02, 0x43, 0x0A, 0x98, 0x01, 0x43, 0x09, 0x98
	.byte 0x15, 0x91, 0x10, 0x43, 0x14, 0x90, 0x16, 0xA8, 0x14, 0xA9, 0x02, 0x1C, 0x00, 0xF0, 0xFE, 0xF8
	.byte 0x18, 0xAA, 0x08, 0x21, 0x10, 0x78, 0x52, 0x1C, 0x28, 0x70, 0x6D, 0x1C, 0x49, 0x1E, 0xF9, 0xD1
	.byte 0x05, 0x98, 0x64, 0x1C, 0x84, 0x42, 0x80, 0xDD, 0x08, 0x98, 0x40, 0x1C, 0x08, 0x90, 0x06, 0x28
	.byte 0x00, 0xDA, 0x66, 0xE7, 0x16, 0xAB, 0x08, 0x22, 0x19, 0x78, 0x00, 0x98, 0x5B, 0x1C, 0x01, 0x70
	.byte 0x40, 0x1C, 0x00, 0x90, 0x52, 0x1E, 0xF7, 0xD1, 0x01, 0x20, 0x6A, 0xB0, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0xA6, 0xA6, 0xA6, 0xA6

	arm_func_start ov02_02332994
ov02_02332994: @ 0x02332994
	arm_func_end ov02_02332994
_02332994:
	.byte 0xF8, 0xB5, 0xEA, 0xB0, 0x00, 0x90, 0x01, 0x20, 0x07, 0x90, 0x6A, 0x48
	.byte 0x14, 0x1C, 0x0D, 0x1C, 0x12, 0x90, 0x13, 0x90, 0x07, 0x20, 0x21, 0x1C, 0x01, 0x42, 0x02, 0xD1
	.byte 0x70, 0x9A, 0x10, 0x42, 0x02, 0xD0, 0x6A, 0xB0, 0x00, 0x20, 0xF8, 0xBD, 0x60, 0x1E, 0xC0, 0x08
	.byte 0x05, 0x90, 0x02, 0x28, 0x02, 0xDA, 0x6A, 0xB0, 0x00, 0x20, 0xF8, 0xBD, 0x1A, 0xA8, 0x19, 0x1C
	.byte 0xD2, 0x00, 0x00, 0xF0, 0x3B, 0xFA, 0x08, 0x90, 0x16, 0xAB, 0x2A, 0x1C, 0x08, 0x21, 0x10, 0x78
	.byte 0x52, 0x1C, 0x18, 0x70, 0x5B, 0x1C, 0x49, 0x1E, 0xF9, 0xD1, 0x08, 0x35, 0x00, 0x98, 0x29, 0x1C
	.byte 0x62, 0x1E, 0x54, 0xF5, 0x54, 0xEC, 0x05, 0x20, 0x09, 0x90, 0x05, 0x98, 0xC0, 0x17, 0x06, 0x90
	.byte 0x05, 0x9C, 0x20, 0x1C, 0x00, 0x28, 0x00, 0xDC, 0x8C, 0xE0, 0x09, 0x9A, 0x06, 0x99, 0xD3, 0x17
	.byte 0x5D, 0xF5, 0x38, 0xEA, 0x03, 0x90, 0x00, 0x20, 0x02, 0x91, 0x0B, 0x90, 0x00, 0x20, 0x00, 0x21
	.byte 0x0D, 0x90, 0x08, 0x1C, 0x08, 0x43, 0x10, 0x90, 0x03, 0x98, 0xE1, 0x17, 0x25, 0x18, 0x02, 0x98
	.byte 0x41, 0x41, 0xFF, 0x20, 0x00, 0x06, 0x08, 0x40, 0x00, 0x0E, 0x0A, 0x90, 0xFF, 0x20, 0x00, 0x04
	.byte 0x08, 0x40, 0x00, 0x0A, 0x0C, 0x90, 0xFF, 0x20, 0x00, 0x02, 0x0A, 0x1C, 0x02, 0x40, 0x00, 0x20
	.byte 0x2B, 0x1C, 0x03, 0x40, 0x10, 0x02, 0x1B, 0x0E, 0x03, 0x43, 0x10, 0x0E, 0x0E, 0x90, 0xFF, 0x20
	.byte 0x00, 0x22, 0x08, 0x40, 0x2A, 0x40, 0x06, 0x06, 0x12, 0x0A, 0x11, 0x92, 0x32, 0x43, 0x00, 0x0A
	.byte 0x11, 0x92, 0x0F, 0x90, 0x00, 0x20, 0x0A, 0x1C, 0x02, 0x40, 0xFF, 0x20, 0x00, 0x06, 0x28, 0x40
	.byte 0x06, 0x0E, 0x00, 0x02, 0x84, 0x46, 0x00, 0x20, 0x01, 0x40, 0xFF, 0x20, 0x00, 0x04, 0x12, 0x02
	.byte 0x28, 0x40, 0x32, 0x43, 0x06, 0x0A, 0x07, 0x06, 0xFF, 0x20, 0x09, 0x06, 0x28, 0x40, 0x31, 0x43
	.byte 0x06, 0x06, 0xFF, 0x20, 0x00, 0x02, 0x28, 0x40, 0x00, 0x02, 0x30, 0x43, 0x01, 0x43, 0x10, 0x98
	.byte 0x3D, 0x1C, 0x05, 0x43, 0x60, 0x46, 0x11, 0x43, 0x02, 0x1C, 0x0F, 0x98, 0x2A, 0x43, 0x01, 0x43
	.byte 0x11, 0x98, 0x02, 0x43, 0x0E, 0x98, 0x1A, 0x43, 0x01, 0x43, 0x0D, 0x98, 0x01, 0x43, 0x0C, 0x98
	.byte 0x02, 0x43, 0x0B, 0x98, 0x01, 0x43, 0x0A, 0x98, 0x15, 0x91, 0x10, 0x43, 0x14, 0x90, 0x16, 0xA8
	.byte 0x14, 0xA9, 0x02, 0x1C, 0x00, 0xF0, 0x32, 0xF8, 0x60, 0x1E, 0xC1, 0x00, 0x00, 0x98, 0x18, 0xAA
	.byte 0x45, 0x18, 0x2B, 0x1C, 0x08, 0x21, 0x18, 0x78, 0x5B, 0x1C, 0x10, 0x70, 0x52, 0x1C, 0x49, 0x1E
	.byte 0xF9, 0xD1, 0x16, 0xAA, 0x08, 0x99, 0x1A, 0xA8, 0x13, 0x1C, 0x00, 0xF0, 0x45, 0xFC, 0x18, 0xAA
	.byte 0x08, 0x21, 0x10, 0x78, 0x52, 0x1C, 0x28, 0x70, 0x6D, 0x1C, 0x49, 0x1E, 0xF9, 0xD1, 0x64, 0x1E
	.byte 0x00, 0x2C, 0x81, 0xDC, 0x09, 0x98, 0x40, 0x1E, 0x09, 0x90, 0x00, 0xD4, 0x68, 0xE7, 0x12, 0xA8
	.byte 0x16, 0xA9, 0x08, 0x22, 0x54, 0xF5, 0x08, 0xEC, 0x00, 0x28, 0x01, 0xD0, 0x00, 0x20, 0x07, 0x90
	.byte 0x07, 0x98, 0x6A, 0xB0, 0xF8, 0xBD, 0xC0, 0x46, 0xA6, 0xA6, 0xA6, 0xA6

	arm_func_start ov02_02332B4C
ov02_02332B4C: @ 0x02332B4C
	stmdavc r4, {r3, r4, sl, ip, sp, pc}
	rsbmi r7, r3, fp, lsl #16
	stmdavc r4, {r0, r1, r4, ip, sp, lr} ^
	rsbmi r7, r3, fp, asr #16
	stmvc r4, {r0, r1, r4, r6, ip, sp, lr}
	rsbmi r7, r3, fp, lsl #17
	stmvc r4, {r0, r1, r4, r7, ip, sp, lr} ^
	rsbmi r7, r3, fp, asr #17
	stmdbvc r4, {r0, r1, r4, r6, r7, ip, sp, lr}
	rsbmi r7, r3, fp, lsl #18
	stmdbvc r4, {r0, r1, r4, r8, ip, sp, lr} ^
	rsbmi r7, r3, fp, asr #18
	stmibvc r4, {r0, r1, r4, r6, r8, ip, sp, lr}
	rsbmi r7, r3, fp, lsl #19
	stmibvc r3, {r0, r1, r4, r7, r8, ip, sp, lr} ^
	subsmi r7, r8, r8, asr #19
	arm_func_end ov02_02332B4C
_02332B8C:
	.byte 0xD0, 0x71, 0x18, 0xBC
	.byte 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_02332B94
ov02_02332B94: @ 0x02332B94
	strdlt fp, ip, [r6], r8
	arm_func_end ov02_02332B94
_02332B98:
	.byte 0x0B, 0x1C, 0x11, 0x1C, 0x00, 0x22, 0x00, 0x92
	.byte 0x9A, 0x78, 0x5E, 0x78, 0xDD, 0x78, 0x14, 0x02, 0x1A, 0x78, 0x36, 0x04, 0x12, 0x06, 0x72, 0x40
	.byte 0x62, 0x40, 0x6A, 0x40, 0x02, 0x60, 0x9A, 0x79, 0x5E, 0x79, 0xDD, 0x79, 0x14, 0x02, 0x1A, 0x79
	.byte 0x36, 0x04, 0x12, 0x06, 0x72, 0x40, 0x62, 0x40, 0x6A, 0x40, 0x42, 0x60, 0x9A, 0x7A, 0x5E, 0x7A
	.byte 0xDD, 0x7A, 0x14, 0x02, 0x1A, 0x7A, 0x36, 0x04, 0x12, 0x06, 0x72, 0x40, 0x62, 0x40, 0x6A, 0x40
	.byte 0x82, 0x60, 0x9A, 0x7B, 0x5E, 0x7B, 0xDD, 0x7B, 0x14, 0x02, 0x1A, 0x7B, 0x36, 0x04, 0x12, 0x06
	.byte 0x72, 0x40, 0x62, 0x40, 0x6A, 0x40, 0xC2, 0x60, 0x80, 0x29, 0x3D, 0xD1, 0x91, 0x4D, 0x92, 0x4A
	.byte 0xC4, 0x68, 0x2B, 0x68, 0x21, 0x0E, 0x89, 0x00, 0x51, 0x58, 0x2D, 0x1D, 0x09, 0x06, 0x09, 0x0E
	.byte 0x02, 0x91, 0x21, 0x06, 0x89, 0x0D, 0x56, 0x58, 0xFF, 0x21, 0x09, 0x02, 0x37, 0x1C, 0x0F, 0x40
	.byte 0x01, 0x68, 0x01, 0x91, 0x21, 0x0C, 0x09, 0x06, 0x89, 0x0D, 0x56, 0x58, 0xFF, 0x21, 0x09, 0x06
	.byte 0x24, 0x0A, 0x0E, 0x40, 0x01, 0x99, 0x24, 0x06, 0xA4, 0x0D, 0x71, 0x40, 0x16, 0x59, 0xFF, 0x24
	.byte 0x24, 0x04, 0x34, 0x40, 0x61, 0x40, 0x3C, 0x1C, 0x4C, 0x40, 0x02, 0x99, 0x61, 0x40, 0x4B, 0x40
	.byte 0x03, 0x61, 0x41, 0x68, 0x4B, 0x40, 0x43, 0x61, 0x81, 0x68, 0x4B, 0x40, 0x83, 0x61, 0xC1, 0x68
	.byte 0x59, 0x40, 0xC1, 0x61, 0x00, 0x99, 0x49, 0x1C, 0x00, 0x91, 0x0A, 0x29, 0x02, 0xDB, 0x06, 0xB0
	.byte 0x0A, 0x20, 0xF8, 0xBD, 0x10, 0x30, 0xC3, 0xE7, 0x9A, 0x7C, 0x5E, 0x7C, 0xDD, 0x7C, 0x14, 0x02
	.byte 0x1A, 0x7C, 0x36, 0x04, 0x12, 0x06, 0x72, 0x40, 0x62, 0x40, 0x6A, 0x40, 0x02, 0x61, 0x9A, 0x7D
	.byte 0x5E, 0x7D, 0xDD, 0x7D, 0x14, 0x02, 0x1A, 0x7D, 0x36, 0x04, 0x12, 0x06, 0x72, 0x40, 0x62, 0x40
	.byte 0x6A, 0x40, 0x42, 0x61, 0xC0, 0x29, 0x45, 0xD1, 0x66, 0x4D, 0x67, 0x4B, 0x44, 0x69, 0x2E, 0x68
	.byte 0x21, 0x0E, 0x89, 0x00, 0x59, 0x58, 0x2D, 0x1D, 0x09, 0x06, 0x09, 0x0E, 0x03, 0x91, 0x21, 0x06
	.byte 0x89, 0x0D, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x02, 0x17, 0x1C, 0x0F, 0x40, 0x01, 0x68, 0x8E, 0x46
	.byte 0x21, 0x0C, 0x09, 0x06, 0x89, 0x0D, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x06, 0x11, 0x40, 0x72, 0x46
	.byte 0x51, 0x40, 0x22, 0x0A, 0x12, 0x06, 0x92, 0x0D, 0x9C, 0x58, 0xFF, 0x22, 0x12, 0x04, 0x22, 0x40
	.byte 0x51, 0x40, 0x3A, 0x1C, 0x4A, 0x40, 0x03, 0x99, 0x51, 0x40, 0x32, 0x1C, 0x4A, 0x40, 0x82, 0x61
	.byte 0x41, 0x68, 0x4A, 0x40, 0xC2, 0x61, 0x81, 0x68, 0x4A, 0x40, 0x02, 0x62, 0xC1, 0x68, 0x51, 0x40
	.byte 0x41, 0x62, 0x00, 0x99, 0x49, 0x1C, 0x00, 0x91, 0x08, 0x29, 0x02, 0xDB, 0x06, 0xB0, 0x0C, 0x20
	.byte 0xF8, 0xBD, 0x02, 0x69, 0x41, 0x6A, 0x4A, 0x40, 0x82, 0x62, 0x41, 0x69, 0x51, 0x40, 0xC1, 0x62
	.byte 0x18, 0x30, 0xBB, 0xE7, 0x9A, 0x7E, 0x5E, 0x7E, 0xDD, 0x7E, 0x14, 0x02, 0x1A, 0x7E, 0x36, 0x04
	.byte 0x12, 0x06, 0x72, 0x40, 0x62, 0x40, 0x6A, 0x40, 0x82, 0x61, 0x9A, 0x7F, 0xDD, 0x7F, 0x14, 0x02
	.byte 0x1A, 0x7F, 0x5B, 0x7F, 0x12, 0x06, 0x1B, 0x04, 0x5A, 0x40, 0x62, 0x40, 0x6A, 0x40, 0xC2, 0x61
	.byte 0x01, 0x22, 0x12, 0x02, 0x91, 0x42, 0x6A, 0xD1, 0x36, 0x4D, 0x37, 0x4B, 0xC4, 0x69, 0x2E, 0x68
	.byte 0x21, 0x0E, 0x89, 0x00, 0x59, 0x58, 0x2D, 0x1D, 0x09, 0x06, 0x09, 0x0E, 0x04, 0x91, 0x21, 0x06
	.byte 0x89, 0x0D, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x02, 0x17, 0x1C, 0x0F, 0x40, 0x01, 0x68, 0x8C, 0x46
	.byte 0x21, 0x0C, 0x09, 0x06, 0x89, 0x0D, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x06, 0x11, 0x40, 0x62, 0x46
	.byte 0x51, 0x40, 0x22, 0x0A, 0x12, 0x06, 0x92, 0x0D, 0x9C, 0x58, 0xFF, 0x22, 0x12, 0x04, 0x22, 0x40
	.byte 0x51, 0x40, 0x3A, 0x1C, 0x4A, 0x40, 0x04, 0x99, 0x51, 0x40, 0x32, 0x1C, 0x4A, 0x40, 0x02, 0x62
	.byte 0x41, 0x68, 0x4A, 0x40, 0x42, 0x62, 0x81, 0x68, 0x4A, 0x40, 0x82, 0x62, 0xC1, 0x68, 0x51, 0x40
	.byte 0xC1, 0x62, 0x00, 0x99, 0x49, 0x1C, 0x00, 0x91, 0x07, 0x29, 0x02, 0xDB, 0x06, 0xB0, 0x0E, 0x20
	.byte 0xF8, 0xBD, 0xC6, 0x6A, 0x07, 0x69, 0x31, 0x06, 0x89, 0x0D, 0x59, 0x58, 0x09, 0x06, 0x0C, 0x0E
	.byte 0x31, 0x0A, 0x09, 0x06, 0x89, 0x0D, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x02, 0x11, 0x40, 0x05, 0x91
	.byte 0x31, 0x0E, 0x89, 0x00, 0x5A, 0x58, 0xFF, 0x21, 0x09, 0x06, 0x11, 0x40, 0x32, 0x0C, 0x12, 0x06
	.byte 0x92, 0x0D, 0x9E, 0x58, 0xFF, 0x22, 0x12, 0x04, 0x79, 0x40, 0x32, 0x40, 0x4A, 0x40, 0x05, 0x99
	.byte 0x51, 0x40, 0x22, 0x1C, 0x4A, 0x40, 0x02, 0x63, 0x41, 0x69, 0x4A, 0x40, 0x42, 0x63, 0x81, 0x69
	.byte 0x4A, 0x40, 0x82, 0x63, 0xC1, 0x69, 0x51, 0x40, 0xC1, 0x63, 0x20, 0x30, 0x96, 0xE7, 0x00, 0x98
	.byte 0x06, 0xB0, 0xF8, 0xBD, 0x64, 0xFC, 0x34, 0x02, 0x8C, 0x18, 0x35, 0x02

	arm_func_start ov02_02332E4C
ov02_02332E4C: @ 0x02332E4C
	arm_func_end ov02_02332E4C
_02332E4C:
	.byte 0xF8, 0xB5, 0x04, 0x1C
	.byte 0xFF, 0xF7, 0xA0, 0xFE, 0x84, 0x46, 0x61, 0x46, 0x8E, 0x00, 0x00, 0x20, 0x00, 0x2E, 0x18, 0xDD
	.byte 0xB2, 0x00, 0x21, 0x1C, 0xA2, 0x18, 0x0D, 0x68, 0x13, 0x68, 0x00, 0x1D, 0x0B, 0x60, 0x15, 0x60
	.byte 0x4D, 0x68, 0x53, 0x68, 0x36, 0x1F, 0x4B, 0x60, 0x55, 0x60, 0x8D, 0x68, 0x93, 0x68, 0x8B, 0x60
	.byte 0x95, 0x60, 0xCD, 0x68, 0xD3, 0x68, 0xCB, 0x60, 0xD5, 0x60, 0x10, 0x31, 0x10, 0x3A, 0xB0, 0x42
	.byte 0xE9, 0xDB, 0x01, 0x20, 0x00, 0x90, 0x60, 0x46, 0x01, 0x28, 0x00, 0xDC, 0x91, 0xE0, 0x4A, 0x4A
	.byte 0x4A, 0x4F, 0x10, 0x34, 0x23, 0x68, 0x18, 0x06, 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06, 0x80, 0x0D
	.byte 0x39, 0x58, 0x18, 0x0A, 0x00, 0x06, 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06, 0x85, 0x0D, 0x44, 0x48
	.byte 0x46, 0x59, 0x18, 0x0E, 0x80, 0x00, 0x1B, 0x0C, 0x10, 0x58, 0x1B, 0x06, 0x9B, 0x0D, 0x00, 0x06
	.byte 0xD3, 0x58, 0x85, 0x0D, 0x3F, 0x48, 0x1B, 0x06, 0x40, 0x59, 0x9D, 0x0D, 0x3E, 0x4B, 0x5B, 0x59
	.byte 0x58, 0x40, 0x70, 0x40, 0x48, 0x40, 0x20, 0x60, 0x63, 0x68, 0x18, 0x06, 0x80, 0x0D, 0x10, 0x58
	.byte 0x00, 0x06, 0x80, 0x0D, 0x39, 0x58, 0x18, 0x0A, 0x00, 0x06, 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06
	.byte 0x85, 0x0D, 0x33, 0x48, 0x46, 0x59, 0x18, 0x0E, 0x80, 0x00, 0x1B, 0x0C, 0x10, 0x58, 0x1B, 0x06
	.byte 0x9B, 0x0D, 0x00, 0x06, 0xD3, 0x58, 0x85, 0x0D, 0x2E, 0x48, 0x1B, 0x06, 0x40, 0x59, 0x9D, 0x0D
	.byte 0x2D, 0x4B, 0x5B, 0x59, 0x58, 0x40, 0x70, 0x40, 0x48, 0x40, 0x60, 0x60, 0xA3, 0x68, 0x18, 0x06
	.byte 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06, 0x80, 0x0D, 0x39, 0x58, 0x18, 0x0A, 0x00, 0x06, 0x80, 0x0D
	.byte 0x10, 0x58, 0x00, 0x06, 0x85, 0x0D, 0x22, 0x48, 0x46, 0x59, 0x18, 0x0E, 0x80, 0x00, 0x1B, 0x0C
	.byte 0x10, 0x58, 0x1B, 0x06, 0x9B, 0x0D, 0x00, 0x06, 0xD3, 0x58, 0x85, 0x0D, 0x1D, 0x48, 0x1B, 0x06
	.byte 0x40, 0x59, 0x9D, 0x0D, 0x1C, 0x4B, 0x5B, 0x59, 0x58, 0x40, 0x70, 0x40, 0x48, 0x40, 0xA0, 0x60
	.byte 0xE3, 0x68, 0x18, 0x06, 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06, 0x80, 0x0D, 0x39, 0x58, 0x18, 0x0A
	.byte 0x00, 0x06, 0x80, 0x0D, 0x10, 0x58, 0x00, 0x06, 0x85, 0x0D, 0x11, 0x48, 0x46, 0x59, 0x18, 0x0E
	.byte 0x80, 0x00, 0x1B, 0x0C, 0x10, 0x58, 0x1B, 0x06, 0x9B, 0x0D, 0x00, 0x06, 0xD3, 0x58, 0x85, 0x0D
	.byte 0x0C, 0x48, 0x1B, 0x06, 0x40, 0x59, 0x9D, 0x0D, 0x0B, 0x4B, 0x5B, 0x59, 0x58, 0x40, 0x70, 0x40
	.byte 0x48, 0x40, 0xE0, 0x60, 0x00, 0x98, 0x41, 0x1C, 0x60, 0x46, 0x00, 0x91, 0x81, 0x42, 0x00, 0xDA
	.byte 0x6F, 0xE7, 0x60, 0x46, 0xF8, 0xBD, 0xC0, 0x46, 0x8C, 0x18, 0x35, 0x02, 0x8C, 0x00, 0x35, 0x02
	.byte 0x8C, 0xFC, 0x34, 0x02, 0x8C, 0x1C, 0x35, 0x02, 0x8C, 0x20, 0x35, 0x02

	arm_func_start ov02_02332FDC
ov02_02332FDC: @ 0x02332FDC
	ldrshlt fp, [r3], r0
	arm_func_end ov02_02332FDC
_02332FE0:
	.byte 0x0F, 0x1C, 0x11, 0x1C, 0x8A, 0x78, 0x00, 0x93, 0x4E, 0x78, 0x13, 0x02, 0x0A, 0x78, 0xCC, 0x78
	.byte 0x36, 0x04, 0x12, 0x06, 0x72, 0x40, 0x5A, 0x40, 0x62, 0x40, 0x05, 0x68, 0x4E, 0x79, 0x6A, 0x40
	.byte 0x03, 0x92, 0x8A, 0x79, 0xCC, 0x79, 0x36, 0x04, 0x13, 0x02, 0x0A, 0x79, 0x45, 0x68, 0x12, 0x06
	.byte 0x72, 0x40, 0x5A, 0x40, 0x62, 0x40, 0x6A, 0x40, 0x02, 0x92, 0x8A, 0x7A, 0x4E, 0x7A, 0xCC, 0x7A
	.byte 0x13, 0x02, 0x0A, 0x7A, 0x36, 0x04, 0x85, 0x68, 0x12, 0x06, 0x72, 0x40, 0x5A, 0x40, 0x62, 0x40
	.byte 0x55, 0x40, 0x8A, 0x7B, 0xCC, 0x7B, 0xC6, 0x68, 0x13, 0x02, 0x0A, 0x7B, 0x49, 0x7B, 0x12, 0x06
	.byte 0x09, 0x04, 0x51, 0x40, 0x59, 0x40, 0x61, 0x40, 0x4E, 0x40, 0x79, 0x10, 0x01, 0x91, 0x31, 0x06
	.byte 0x8A, 0x0D, 0xCC, 0x49, 0x04, 0x69, 0x8B, 0x58, 0x29, 0x0A, 0x09, 0x06, 0x8A, 0x0D, 0xCA, 0x49
	.byte 0x89, 0x58, 0x10, 0x91, 0x03, 0x99, 0x09, 0x0E, 0x8A, 0x00, 0xC8, 0x49, 0x8F, 0x58, 0x02, 0x99
	.byte 0x09, 0x0C, 0x09, 0x06, 0x8A, 0x0D, 0xC6, 0x49, 0x89, 0x58, 0x3A, 0x1C, 0x4A, 0x40, 0x10, 0x99
	.byte 0x51, 0x40, 0x59, 0x40, 0x61, 0x40, 0x04, 0x91, 0x03, 0x99, 0x44, 0x69, 0x09, 0x06, 0x8A, 0x0D
	.byte 0xBC, 0x49, 0x8B, 0x58, 0x31, 0x0A, 0x09, 0x06, 0x8A, 0x0D, 0xBB, 0x49, 0x89, 0x58, 0x12, 0x91
	.byte 0x02, 0x99, 0x09, 0x0E, 0x8A, 0x00, 0xB9, 0x49, 0x8F, 0x58, 0x29, 0x0C, 0x09, 0x06, 0x8A, 0x0D
	.byte 0xB7, 0x49, 0x89, 0x58, 0x3A, 0x1C, 0x4A, 0x40, 0x12, 0x99, 0x51, 0x40, 0x59, 0x40, 0x61, 0x40
	.byte 0x11, 0x91, 0x02, 0x99, 0x84, 0x69, 0x09, 0x06, 0x8A, 0x0D, 0xAE, 0x49, 0x8B, 0x58, 0x03, 0x99
	.byte 0x09, 0x0A, 0x09, 0x06, 0x8A, 0x0D, 0xAC, 0x49, 0x89, 0x58, 0x05, 0x91, 0x29, 0x0E, 0x8A, 0x00
	.byte 0xAA, 0x49, 0x8F, 0x58, 0x31, 0x0C, 0x09, 0x06, 0x8A, 0x0D, 0xA9, 0x49, 0x89, 0x58, 0x3A, 0x1C
	.byte 0x4A, 0x40, 0x05, 0x99, 0xC7, 0x69, 0x51, 0x40, 0x59, 0x40, 0x22, 0x1C, 0x4A, 0x40, 0x29, 0x06
	.byte 0x8B, 0x0D, 0xA0, 0x49, 0x20, 0x30, 0xCB, 0x58, 0x02, 0x99, 0x09, 0x0A, 0x09, 0x06, 0x8C, 0x0D
	.byte 0x9D, 0x49, 0x09, 0x59, 0x34, 0x0E, 0xA5, 0x00, 0x9C, 0x4C, 0x66, 0x59, 0x03, 0x9C, 0x24, 0x0C
	.byte 0x24, 0x06, 0xA5, 0x0D, 0x9A, 0x4C, 0x64, 0x59, 0x74, 0x40, 0x61, 0x40, 0x59, 0x40, 0x01, 0x9B
	.byte 0x79, 0x40, 0x5B, 0x1E, 0x01, 0x93, 0x6F, 0xD0, 0x0B, 0x06, 0x9D, 0x0D, 0x91, 0x4B, 0x04, 0x68
	.byte 0x5B, 0x59, 0x15, 0x0A, 0x2D, 0x06, 0xAE, 0x0D, 0x8F, 0x4D, 0xAF, 0x59, 0x04, 0x9D, 0x2D, 0x0E
	.byte 0xAE, 0x00, 0x8E, 0x4D, 0xAD, 0x59, 0x06, 0x95, 0x11, 0x9D, 0x2D, 0x0C, 0x2D, 0x06, 0xAE, 0x0D
	.byte 0x8B, 0x4D, 0xAE, 0x59, 0x06, 0x9D, 0x75, 0x40, 0x7D, 0x40, 0x6B, 0x40, 0x63, 0x40, 0x03, 0x93
	.byte 0x04, 0x9B, 0x44, 0x68, 0x1B, 0x06, 0x9D, 0x0D, 0x82, 0x4B, 0x5B, 0x59, 0x0D, 0x0A, 0x2D, 0x06
	.byte 0xAE, 0x0D, 0x81, 0x4D, 0xAF, 0x59, 0x11, 0x9D, 0x2D, 0x0E, 0xAE, 0x00, 0x7F, 0x4D, 0xAD, 0x59
	.byte 0x07, 0x95, 0x15, 0x0C, 0x2D, 0x06, 0xAE, 0x0D, 0x7D, 0x4D, 0xAE, 0x59, 0x07, 0x9D, 0x75, 0x40
	.byte 0x7D, 0x40, 0x6B, 0x40, 0x63, 0x40, 0x02, 0x93, 0x11, 0x9B, 0x86, 0x68, 0x1B, 0x06, 0x9C, 0x0D
	.byte 0x74, 0x4B, 0x1D, 0x59, 0x04, 0x9B, 0x1B, 0x0A, 0x1B, 0x06, 0x9C, 0x0D, 0x72, 0x4B, 0x1B, 0x59
	.byte 0x08, 0x93, 0x13, 0x0E, 0x9C, 0x00, 0x71, 0x4B, 0x12, 0x06, 0x1F, 0x59, 0x0B, 0x0C, 0x1B, 0x06
	.byte 0x9C, 0x0D, 0x6F, 0x4B, 0x09, 0x0E, 0x1B, 0x59, 0x3C, 0x1C, 0x5C, 0x40, 0x08, 0x9B, 0xC7, 0x68
	.byte 0x63, 0x40, 0x6B, 0x40, 0x35, 0x1C, 0x5D, 0x40, 0x93, 0x0D, 0x66, 0x4A, 0xD3, 0x58, 0x11, 0x9A
	.byte 0x12, 0x0A, 0x12, 0x06, 0x94, 0x0D, 0x64, 0x4A, 0x12, 0x59, 0x8C, 0x00, 0x63, 0x49, 0x0E, 0x59
	.byte 0x04, 0x99, 0x09, 0x0C, 0x09, 0x06, 0x8C, 0x0D, 0x61, 0x49, 0x09, 0x59, 0x71, 0x40, 0x51, 0x40
	.byte 0x59, 0x40, 0x3E, 0x1C, 0x4E, 0x40, 0x1A, 0xE7, 0x03, 0x68, 0xFF, 0x26, 0x09, 0x93, 0x0B, 0x06
	.byte 0x9C, 0x0D, 0x5C, 0x4B, 0x36, 0x04, 0x1C, 0x59, 0x24, 0x06, 0x24, 0x0E, 0x0A, 0x94, 0x14, 0x0A
	.byte 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x02, 0x2C, 0x40, 0x0B, 0x94, 0x04, 0x9C
	.byte 0x24, 0x0E, 0xA4, 0x00, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06, 0x25, 0x40, 0x11, 0x9C, 0x24, 0x0C
	.byte 0x24, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x34, 0x40, 0x65, 0x40, 0x0B, 0x9C, 0x65, 0x40, 0x0A, 0x9C
	.byte 0x65, 0x40, 0x09, 0x9C, 0x6C, 0x40, 0x00, 0x9D, 0x26, 0x0E, 0x2E, 0x70, 0x26, 0x0C, 0x6E, 0x70
	.byte 0x26, 0x0A, 0xAE, 0x70, 0xEC, 0x70, 0x44, 0x68, 0xFF, 0x26, 0x0C, 0x94, 0x04, 0x9C, 0x36, 0x04
	.byte 0x24, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x24, 0x06, 0x24, 0x0E, 0x0D, 0x94, 0x0C, 0x0A, 0x24, 0x06
	.byte 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x02, 0x2C, 0x40, 0x0E, 0x94, 0x11, 0x9C, 0x24, 0x0E
	.byte 0xA4, 0x00, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06, 0x25, 0x40, 0x14, 0x0C, 0x24, 0x06, 0xA4, 0x0D
	.byte 0x1C, 0x59, 0x34, 0x40, 0x65, 0x40, 0x0E, 0x9C, 0x65, 0x40, 0x0D, 0x9C, 0x65, 0x40, 0x0C, 0x9C
	.byte 0x6C, 0x40, 0x00, 0x9D, 0x26, 0x0E, 0x2E, 0x71, 0x26, 0x0C, 0x6E, 0x71, 0x26, 0x0A, 0xAE, 0x71
	.byte 0xEC, 0x71, 0x84, 0x68, 0x0F, 0x94, 0x11, 0x9C, 0x24, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x24, 0x06
	.byte 0x24, 0x0E, 0xA6, 0x46, 0x04, 0x9C, 0x24, 0x0A, 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24
	.byte 0x24, 0x02, 0x2C, 0x40, 0xA4, 0x46, 0x14, 0x0E, 0xA4, 0x00, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06
	.byte 0x2E, 0x1C, 0x26, 0x40, 0x0C, 0x0C, 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x04
	.byte 0x2C, 0x40, 0x74, 0x40, 0x65, 0x46, 0x65, 0x40, 0x74, 0x46, 0x65, 0x40, 0x0F, 0x9C, 0x6C, 0x40
	.byte 0x00, 0x9D, 0x26, 0x0E, 0x2E, 0x72, 0x26, 0x0C, 0x6E, 0x72, 0x26, 0x0A, 0xAE, 0x72, 0xEC, 0x72
	.byte 0xC5, 0x68, 0x10, 0x06, 0x80, 0x0D, 0x18, 0x58, 0x00, 0x06, 0x04, 0x0E, 0x11, 0x98, 0x00, 0x0A
	.byte 0x00, 0x06, 0x80, 0x0D, 0x1A, 0x58, 0xFF, 0x20, 0x00, 0x02, 0x02, 0x40, 0x08, 0x0E, 0x80, 0x00
	.byte 0x19, 0x58, 0xFF, 0x20, 0x00, 0x06, 0x08, 0x40, 0x04, 0x99, 0x09, 0x0C, 0x09, 0x06, 0x89, 0x0D
	.byte 0x5B, 0x58, 0xFF, 0x21, 0x09, 0x04, 0x19, 0x40, 0x48, 0x40, 0x50, 0x40, 0x60, 0x40, 0x68, 0x40
	.byte 0x00, 0x99, 0x02, 0x0E, 0x0A, 0x73, 0x02, 0x0C, 0x4A, 0x73, 0x02, 0x0A, 0x8A, 0x73, 0xC8, 0x73
	.byte 0x13, 0xB0, 0xF0, 0xBD, 0x8C, 0x14, 0x35, 0x02, 0x8C, 0x10, 0x35, 0x02, 0x8C, 0x08, 0x35, 0x02
	.byte 0x8C, 0x0C, 0x35, 0x02, 0x8C, 0x18, 0x35, 0x02

	arm_func_start ov02_02333398
ov02_02333398: @ 0x02333398
	ldrshlt fp, [r2], r8
	arm_func_end ov02_02333398
_0233339C:
	.byte 0x0F, 0x1C, 0x11, 0x1C
	.byte 0x8A, 0x78, 0x00, 0x93, 0x4E, 0x78, 0x13, 0x02, 0x0A, 0x78, 0xCC, 0x78, 0x36, 0x04, 0x12, 0x06
	.byte 0x72, 0x40, 0x5A, 0x40, 0x62, 0x40, 0x05, 0x68, 0x4E, 0x79, 0x6A, 0x40, 0x03, 0x92, 0x8A, 0x79
	.byte 0xCC, 0x79, 0x36, 0x04, 0x13, 0x02, 0x0A, 0x79, 0x45, 0x68, 0x12, 0x06, 0x72, 0x40, 0x5A, 0x40
	.byte 0x62, 0x40, 0x6A, 0x40, 0x02, 0x92, 0x8A, 0x7A, 0x4E, 0x7A, 0xCC, 0x7A, 0x13, 0x02, 0x0A, 0x7A
	.byte 0x36, 0x04, 0x85, 0x68, 0x12, 0x06, 0x72, 0x40, 0x5A, 0x40, 0x62, 0x40, 0x6A, 0x40, 0x10, 0x92
	.byte 0x8A, 0x7B, 0xC5, 0x68, 0xCC, 0x7B, 0x13, 0x02, 0x0A, 0x7B, 0x49, 0x7B, 0x2E, 0x1C, 0x12, 0x06
	.byte 0x09, 0x04, 0x51, 0x40, 0x59, 0x40, 0x61, 0x40, 0x4E, 0x40, 0x79, 0x10, 0x01, 0x91, 0x02, 0x99
	.byte 0x05, 0x69, 0x09, 0x06, 0x8A, 0x0D, 0xCA, 0x49, 0x8C, 0x58, 0x10, 0x99, 0x09, 0x0A, 0x09, 0x06
	.byte 0x8A, 0x0D, 0xC8, 0x49, 0x8B, 0x58, 0x03, 0x99, 0x09, 0x0E, 0x8A, 0x00, 0xC6, 0x49, 0x8F, 0x58
	.byte 0x31, 0x0C, 0x09, 0x06, 0x8A, 0x0D, 0xC5, 0x49, 0x89, 0x58, 0x79, 0x40, 0x59, 0x40, 0x61, 0x40
	.byte 0x69, 0x40, 0x04, 0x91, 0x10, 0x99, 0x45, 0x69, 0x09, 0x06, 0x8A, 0x0D, 0xBC, 0x49, 0x8C, 0x58
	.byte 0x31, 0x0A, 0x09, 0x06, 0x8A, 0x0D, 0xBB, 0x49, 0x8B, 0x58, 0x02, 0x99, 0x09, 0x0E, 0x8A, 0x00
	.byte 0xB9, 0x49, 0x8F, 0x58, 0x03, 0x99, 0x09, 0x0C, 0x09, 0x06, 0x8A, 0x0D, 0xB7, 0x49, 0x89, 0x58
	.byte 0x79, 0x40, 0x59, 0x40, 0x61, 0x40, 0x69, 0x40, 0x11, 0x91, 0x31, 0x06, 0x8A, 0x0D, 0xB0, 0x49
	.byte 0x83, 0x69, 0x8A, 0x58, 0x03, 0x99, 0x09, 0x0A, 0x09, 0x06, 0x8C, 0x0D, 0xAD, 0x49, 0x09, 0x59
	.byte 0x05, 0x91, 0x10, 0x99, 0x09, 0x0E, 0x8C, 0x00, 0xAB, 0x49, 0x09, 0x59, 0x02, 0x9C, 0x24, 0x0C
	.byte 0x24, 0x06, 0xA5, 0x0D, 0xA9, 0x4C, 0x64, 0x59, 0x4C, 0x40, 0x05, 0x99, 0x61, 0x40, 0x51, 0x40
	.byte 0x1A, 0x1C, 0x4A, 0x40, 0x03, 0x99, 0xC3, 0x69, 0x09, 0x06, 0x8C, 0x0D, 0xA0, 0x49, 0x20, 0x30
	.byte 0x09, 0x59, 0x02, 0x9C, 0x24, 0x0A, 0x24, 0x06, 0xA5, 0x0D, 0x9E, 0x4C, 0x67, 0x59, 0x34, 0x0E
	.byte 0xA5, 0x00, 0x9D, 0x4C, 0x66, 0x59, 0x10, 0x9C, 0x24, 0x0C, 0x24, 0x06, 0xA5, 0x0D, 0x9B, 0x4C
	.byte 0x64, 0x59, 0x74, 0x40, 0x7C, 0x40, 0x61, 0x40, 0x59, 0x40, 0x01, 0x9B, 0x5B, 0x1E, 0x01, 0x93
	.byte 0x6F, 0xD0, 0x11, 0x9B, 0x04, 0x68, 0x1B, 0x06, 0x9D, 0x0D, 0x91, 0x4B, 0x5B, 0x59, 0x15, 0x0A
	.byte 0x2D, 0x06, 0xAE, 0x0D, 0x8F, 0x4D, 0xAF, 0x59, 0x04, 0x9D, 0x2D, 0x0E, 0xAE, 0x00, 0x8E, 0x4D
	.byte 0xAD, 0x59, 0x06, 0x95, 0x0D, 0x0C, 0x2D, 0x06, 0xAE, 0x0D, 0x8C, 0x4D, 0xAE, 0x59, 0x06, 0x9D
	.byte 0x75, 0x40, 0x7D, 0x40, 0x6B, 0x40, 0x63, 0x40, 0x03, 0x93, 0x13, 0x06, 0x9D, 0x0D, 0x84, 0x4B
	.byte 0x44, 0x68, 0x5B, 0x59, 0x0D, 0x0A, 0x2D, 0x06, 0xAE, 0x0D, 0x82, 0x4D, 0xAF, 0x59, 0x11, 0x9D
	.byte 0x2D, 0x0E, 0xAE, 0x00, 0x80, 0x4D, 0xAD, 0x59, 0x07, 0x95, 0x04, 0x9D, 0x2D, 0x0C, 0x2D, 0x06
	.byte 0xAE, 0x0D, 0x7E, 0x4D, 0xAE, 0x59, 0x07, 0x9D, 0x75, 0x40, 0x7D, 0x40, 0x6B, 0x40, 0x63, 0x40
	.byte 0x02, 0x93, 0x0B, 0x06, 0x9C, 0x0D, 0x76, 0x4B, 0x86, 0x68, 0x1D, 0x59, 0x04, 0x9B, 0x09, 0x0E
	.byte 0x1B, 0x0A, 0x1B, 0x06, 0x9C, 0x0D, 0x73, 0x4B, 0x1B, 0x59, 0x08, 0x93, 0x13, 0x0E, 0x9C, 0x00
	.byte 0x71, 0x4B, 0x12, 0x0C, 0x1F, 0x59, 0x11, 0x9B, 0x12, 0x06, 0x1B, 0x0C, 0x1B, 0x06, 0x9C, 0x0D
	.byte 0x6E, 0x4B, 0x1B, 0x59, 0x3C, 0x1C, 0x5C, 0x40, 0x08, 0x9B, 0x63, 0x40, 0x6B, 0x40, 0x73, 0x40
	.byte 0x10, 0x93, 0x04, 0x9B, 0xC5, 0x68, 0x1B, 0x06, 0x9C, 0x0D, 0x65, 0x4B, 0x1C, 0x59, 0x11, 0x9B
	.byte 0x1B, 0x0A, 0x1B, 0x06, 0x9E, 0x0D, 0x63, 0x4B, 0x9B, 0x59, 0x8E, 0x00, 0x62, 0x49, 0x89, 0x59
	.byte 0x96, 0x0D, 0x62, 0x4A, 0x92, 0x59, 0x2E, 0x1C, 0x51, 0x40, 0x59, 0x40, 0x61, 0x40, 0x4E, 0x40
	.byte 0x1D, 0xE7, 0x03, 0x68, 0xFF, 0x26, 0x09, 0x93, 0x11, 0x9B, 0x36, 0x04, 0x1B, 0x06, 0x9C, 0x0D
	.byte 0x5B, 0x4B, 0x1C, 0x59, 0x24, 0x06, 0x24, 0x0E, 0x0A, 0x94, 0x14, 0x0A, 0x24, 0x06, 0xA4, 0x0D
	.byte 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x02, 0x2C, 0x40, 0x0B, 0x94, 0x04, 0x9C, 0x24, 0x0E, 0xA4, 0x00
	.byte 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06, 0x25, 0x40, 0x0C, 0x0C, 0x24, 0x06, 0xA4, 0x0D, 0x1C, 0x59
	.byte 0x34, 0x40, 0x65, 0x40, 0x0B, 0x9C, 0x65, 0x40, 0x0A, 0x9C, 0x65, 0x40, 0x09, 0x9C, 0x6C, 0x40
	.byte 0x00, 0x9D, 0x26, 0x0E, 0x2E, 0x70, 0x26, 0x0C, 0x6E, 0x70, 0x26, 0x0A, 0xAE, 0x70, 0xEC, 0x70
	.byte 0x44, 0x68, 0xFF, 0x26, 0x0C, 0x94, 0x14, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x36, 0x04, 0x24, 0x06
	.byte 0x24, 0x0E, 0x0D, 0x94, 0x0C, 0x0A, 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x02
	.byte 0x2C, 0x40, 0x0E, 0x94, 0x11, 0x9C, 0x24, 0x0E, 0xA4, 0x00, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06
	.byte 0x25, 0x40, 0x04, 0x9C, 0x24, 0x0C, 0x24, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x34, 0x40, 0x65, 0x40
	.byte 0x0E, 0x9C, 0x65, 0x40, 0x0D, 0x9C, 0x65, 0x40, 0x0C, 0x9C, 0x6C, 0x40, 0x00, 0x9D, 0x26, 0x0E
	.byte 0x2E, 0x71, 0x26, 0x0C, 0x6E, 0x71, 0x26, 0x0A, 0xAE, 0x71, 0xEC, 0x71, 0x84, 0x68, 0x0F, 0x94
	.byte 0x0C, 0x06, 0xA4, 0x0D, 0x1C, 0x59, 0x24, 0x06, 0x24, 0x0E, 0xA6, 0x46, 0x04, 0x9C, 0x24, 0x0A
	.byte 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x02, 0x2C, 0x40, 0xA4, 0x46, 0x14, 0x0E
	.byte 0xA4, 0x00, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x06, 0x2E, 0x1C, 0x26, 0x40, 0x11, 0x9C, 0x24, 0x0C
	.byte 0x24, 0x06, 0xA4, 0x0D, 0x1D, 0x59, 0xFF, 0x24, 0x24, 0x04, 0x2C, 0x40, 0x74, 0x40, 0x65, 0x46
	.byte 0x65, 0x40, 0x74, 0x46, 0x65, 0x40, 0x0F, 0x9C, 0x6C, 0x40, 0x00, 0x9D, 0x26, 0x0E, 0x2E, 0x72
	.byte 0x26, 0x0C, 0x6E, 0x72, 0x26, 0x0A, 0xAE, 0x72, 0xEC, 0x72, 0xC5, 0x68, 0x04, 0x98, 0x12, 0x0C
	.byte 0x00, 0x06, 0x80, 0x0D, 0x18, 0x58, 0x09, 0x0E, 0x00, 0x06, 0x04, 0x0E, 0x11, 0x98, 0x12, 0x06
	.byte 0x00, 0x0A, 0x00, 0x06, 0x80, 0x0D, 0x1E, 0x58, 0xFF, 0x20, 0x00, 0x02, 0x89, 0x00, 0x30, 0x40
	.byte 0xFF, 0x26, 0x92, 0x0D, 0x59, 0x58, 0x9B, 0x58, 0xFF, 0x22, 0x36, 0x06, 0x12, 0x04, 0x31, 0x40
	.byte 0x1A, 0x40, 0x51, 0x40, 0x48, 0x40, 0x60, 0x40, 0x68, 0x40, 0x00, 0x99, 0x02, 0x0E, 0x0A, 0x73
	.byte 0x02, 0x0C, 0x4A, 0x73, 0x02, 0x0A, 0x8A, 0x73, 0xC8, 0x73, 0x12, 0xB0, 0xF8, 0xBD, 0xC0, 0x46
	.byte 0x8C, 0x00, 0x35, 0x02, 0x8C, 0xFC, 0x34, 0x02, 0x8C, 0x1C, 0x35, 0x02, 0x8C, 0x20, 0x35, 0x02
	.byte 0x8C, 0x04, 0x35, 0x02

	arm_func_start ov02_02333754
ov02_02333754: @ 0x02333754
	mrsvs r2, spsr
	stmdbmi r4, {r0, r8, sp, lr}
	stmdbmi r4, {r0, sp, lr}
	stmdbmi r4, {r0, r6, sp, lr}
	stmdbmi r4, {r0, r7, sp, lr}
	ldrbmi r6, [r0, -r1, asr #1]!
	strbvs r2, [r5, -r1, lsl #6]
	svc #0xcdab89
	ldmls sl!, {r1, r2, r3, r4, r5, r6, r7, sl, fp, ip, lr, pc}
	eorsne r5, r2, r6, ror r4
	arm_func_end ov02_02333754

	arm_func_start ov02_0233377C
ov02_0233377C: @ 0x0233377C
	arm_func_end ov02_0233377C
_0233377C:
	.byte 0xF8, 0xB5, 0x05, 0x1C
	.byte 0x0F, 0x1C, 0x29, 0x69, 0x16, 0x1C, 0xCA, 0x08, 0x3F, 0x20, 0x10, 0x40, 0xF2, 0x00, 0x89, 0x18
	.byte 0x29, 0x61, 0x91, 0x42, 0x02, 0xD2, 0x69, 0x69, 0x49, 0x1C, 0x69, 0x61, 0x6A, 0x69, 0x71, 0x0F
	.byte 0x51, 0x18, 0x69, 0x61, 0x40, 0x21, 0x0C, 0x1A, 0xA6, 0x42, 0x1A, 0xD3, 0x29, 0x1C, 0x18, 0x31
	.byte 0x08, 0x18, 0x39, 0x1C, 0x22, 0x1C, 0x00, 0xF0, 0x97, 0xFC, 0x29, 0x1C, 0x28, 0x1C, 0x18, 0x31
	.byte 0x00, 0xF0, 0x42, 0xF8, 0x20, 0x1C, 0x3F, 0x30, 0xB0, 0x42, 0x08, 0xD2, 0x28, 0x1C, 0x39, 0x19
	.byte 0x00, 0xF0, 0x3A, 0xF8, 0x40, 0x34, 0x20, 0x1C, 0x3F, 0x30, 0xB0, 0x42, 0xF6, 0xD3, 0x00, 0x20
	.byte 0x00, 0xE0, 0x00, 0x24, 0x18, 0x35, 0x28, 0x18, 0x39, 0x19, 0x32, 0x1B, 0x00, 0xF0, 0x7C, 0xFC
	.byte 0xF8, 0xBD, 0x00, 0x00

	arm_func_start ov02_023337F4
ov02_023337F4: @ 0x023337F4
	addlt fp, r2, r8, lsr r5
	arm_func_end ov02_023337F4
_023337F8:
	.byte 0x05, 0x1C, 0x0C, 0x1C, 0x00, 0xA8, 0x10, 0x31
	.byte 0x08, 0x22, 0x00, 0xF0, 0x45, 0xFC, 0x20, 0x69, 0xC1, 0x08, 0x3F, 0x20, 0x01, 0x40, 0x38, 0x29
	.byte 0x01, 0xD2, 0x38, 0x20, 0x00, 0xE0, 0x78, 0x20, 0x42, 0x1A, 0x0A, 0x49, 0x20, 0x1C, 0xFF, 0xF7
	.byte 0xAD, 0xFF, 0x20, 0x1C, 0x00, 0xA9, 0x08, 0x22, 0xFF, 0xF7, 0xA8, 0xFF, 0x28, 0x1C, 0x21, 0x1C
	.byte 0x10, 0x22, 0x00, 0xF0, 0x2D, 0xFC, 0x20, 0x1C, 0x00, 0x21, 0x58, 0x22, 0x00, 0xF0, 0x60, 0xFC
	.byte 0x02, 0xB0, 0x38, 0xBD, 0x88, 0x30, 0x35, 0x02

	arm_func_start ov02_02333848
ov02_02333848: @ 0x02333848
	arm_func_end ov02_02333848
_02333848:
	.byte 0xF0, 0xB5, 0xA1, 0xB0, 0x07, 0x1C, 0x38, 0x68
	.byte 0x40, 0x22, 0x00, 0x90, 0x11, 0xA8, 0x7C, 0x68, 0xBD, 0x68, 0xFE, 0x68, 0x00, 0xF0, 0x2E, 0xFC
	.byte 0x11, 0x98, 0x21, 0x1C, 0x01, 0x90, 0xE0, 0x43, 0x29, 0x40, 0x30, 0x40, 0x01, 0x43, 0x01, 0x98
	.byte 0x41, 0x18, 0xEB, 0x48, 0x09, 0x1A, 0x00, 0x98, 0x40, 0x18, 0xC1, 0x01, 0x40, 0x0E, 0x08, 0x43
	.byte 0x03, 0x19, 0x12, 0x98, 0xD9, 0x43, 0x02, 0x90, 0x18, 0x1C, 0x20, 0x40, 0x29, 0x40, 0x01, 0x43
	.byte 0x02, 0x98, 0x41, 0x18, 0xE3, 0x48, 0x08, 0x1A, 0x30, 0x18, 0x01, 0x03, 0x00, 0x0D, 0x08, 0x43
	.byte 0xC2, 0x18, 0x13, 0x98, 0xD1, 0x43, 0x03, 0x90, 0x10, 0x1C, 0x18, 0x40, 0x21, 0x40, 0x01, 0x43
	.byte 0x03, 0x98, 0x41, 0x18, 0xDC, 0x48, 0x08, 0x18, 0x28, 0x18, 0x41, 0x04, 0xC0, 0x0B, 0x08, 0x43
	.byte 0x81, 0x18, 0x14, 0x98, 0xCD, 0x43, 0x04, 0x90, 0x08, 0x1C, 0x10, 0x40, 0x1D, 0x40, 0x05, 0x43
	.byte 0x04, 0x98, 0x45, 0x19, 0xD5, 0x48, 0x28, 0x1A, 0x20, 0x18, 0x84, 0x05, 0x80, 0x0A, 0x20, 0x43
	.byte 0x15, 0x9C, 0x40, 0x18, 0x05, 0x94, 0x04, 0x1C, 0xC5, 0x43, 0x0C, 0x40, 0x15, 0x40, 0x25, 0x43
	.byte 0x05, 0x9C, 0x65, 0x19, 0xCE, 0x4C, 0x2C, 0x1B, 0x1B, 0x19, 0xDC, 0x01, 0x5B, 0x0E, 0x23, 0x43
	.byte 0x16, 0x9C, 0x1B, 0x18, 0x06, 0x94, 0x1C, 0x1C, 0xDD, 0x43, 0x04, 0x40, 0x0D, 0x40, 0x25, 0x43
	.byte 0x06, 0x9C, 0x65, 0x19, 0xC7, 0x4C, 0x2C, 0x19, 0x12, 0x19, 0x14, 0x03, 0x12, 0x0D, 0x22, 0x43
	.byte 0x17, 0x9C, 0xD2, 0x18, 0x07, 0x94, 0x14, 0x1C, 0xD5, 0x43, 0x1C, 0x40, 0x05, 0x40, 0x25, 0x43
	.byte 0x07, 0x9C, 0x65, 0x19, 0xC0, 0x4C, 0x2C, 0x1B, 0x09, 0x19, 0x4C, 0x04, 0xC9, 0x0B, 0x21, 0x43
	.byte 0x18, 0x9C, 0x89, 0x18, 0x08, 0x94, 0x0C, 0x1C, 0xCD, 0x43, 0x14, 0x40, 0x1D, 0x40, 0x25, 0x43
	.byte 0x08, 0x9C, 0x65, 0x19, 0xB9, 0x4C, 0x2C, 0x1B, 0x00, 0x19, 0x84, 0x05, 0x80, 0x0A, 0x20, 0x43
	.byte 0x19, 0x9C, 0x40, 0x18, 0x09, 0x94, 0x04, 0x1C, 0xC5, 0x43, 0x0C, 0x40, 0x15, 0x40, 0x25, 0x43
	.byte 0x09, 0x9C, 0x65, 0x19, 0xB2, 0x4C, 0x2C, 0x19, 0x1B, 0x19, 0xDC, 0x01, 0x5B, 0x0E, 0x23, 0x43
	.byte 0x1A, 0x9C, 0x1B, 0x18, 0x0A, 0x94, 0x1C, 0x1C, 0xDD, 0x43, 0x04, 0x40, 0x0D, 0x40, 0x25, 0x43
	.byte 0x0A, 0x9C, 0x65, 0x19, 0xAB, 0x4C, 0x2C, 0x1B, 0x12, 0x19, 0x14, 0x03, 0x12, 0x0D, 0x22, 0x43
	.byte 0x1B, 0x9C, 0xD2, 0x18, 0x0B, 0x94, 0x14, 0x1C, 0xD5, 0x43, 0x1C, 0x40, 0x05, 0x40, 0x25, 0x43
	.byte 0x0B, 0x9C, 0x65, 0x19, 0xA4, 0x4C, 0x2C, 0x1B, 0x09, 0x19, 0x4C, 0x04, 0xC9, 0x0B, 0x21, 0x43
	.byte 0x1C, 0x9C, 0x89, 0x18, 0x0C, 0x94, 0x0C, 0x1C, 0xCD, 0x43, 0x14, 0x40, 0x1D, 0x40, 0x25, 0x43
	.byte 0x0C, 0x9C, 0x65, 0x19, 0x9D, 0x4C, 0x2C, 0x1B, 0x00, 0x19, 0x84, 0x05, 0x80, 0x0A, 0x20, 0x43
	.byte 0x40, 0x18, 0x1D, 0x9C, 0xC5, 0x43, 0x0D, 0x94, 0x04, 0x1C, 0x0C, 0x40, 0x15, 0x40, 0x25, 0x43
	.byte 0x0D, 0x9C, 0x65, 0x19, 0x96, 0x4C, 0x2C, 0x19, 0x1B, 0x19, 0xDC, 0x01, 0x5B, 0x0E, 0x23, 0x43
	.byte 0x1C, 0x18, 0x1E, 0x9B, 0xE5, 0x43, 0x0E, 0x93, 0x23, 0x1C, 0x03, 0x40, 0x0D, 0x40, 0x1D, 0x43
	.byte 0x0E, 0x9B, 0x5D, 0x19, 0x8F, 0x4B, 0xEB, 0x1A, 0xD2, 0x18, 0x13, 0x03, 0x12, 0x0D, 0x1A, 0x43
	.byte 0x13, 0x19, 0xDA, 0x43, 0x0F, 0x92, 0x1F, 0x9A, 0x0F, 0x9D, 0x10, 0x92, 0x1A, 0x1C, 0x22, 0x40
	.byte 0x05, 0x40, 0x15, 0x43, 0x10, 0x9A, 0x55, 0x19, 0x87, 0x4A, 0xAA, 0x1A, 0x89, 0x18, 0x4A, 0x04
	.byte 0xC9, 0x0B, 0x11, 0x43, 0xCA, 0x18, 0x20, 0x99, 0x15, 0x1C, 0xD6, 0x43, 0x8C, 0x46, 0x31, 0x1C
	.byte 0x1D, 0x40, 0x21, 0x40, 0x0D, 0x43, 0x61, 0x46, 0x4D, 0x19, 0x80, 0x49, 0x69, 0x18, 0x40, 0x18
	.byte 0x81, 0x05, 0x80, 0x0A, 0x08, 0x43, 0x81, 0x18, 0x0F, 0x9D, 0x08, 0x1C, 0x18, 0x40, 0x15, 0x40
	.byte 0x05, 0x43, 0x02, 0x98, 0x45, 0x19, 0x7A, 0x48, 0x28, 0x1A, 0x20, 0x18, 0x44, 0x01, 0xC0, 0x0E
	.byte 0x20, 0x43, 0x40, 0x18, 0x04, 0x1C, 0x0D, 0x1C, 0x14, 0x40, 0x95, 0x43, 0x25, 0x43, 0x07, 0x9C
	.byte 0x65, 0x19, 0x74, 0x4C, 0x2C, 0x1B, 0x1B, 0x19, 0x5C, 0x02, 0xDB, 0x0D, 0x23, 0x43, 0x1B, 0x18
	.byte 0x1C, 0x1C, 0xCD, 0x43, 0x0C, 0x40, 0x05, 0x40, 0x25, 0x43, 0x0C, 0x9C, 0x65, 0x19, 0x6E, 0x4C
	.byte 0x2C, 0x19, 0x12, 0x19, 0x94, 0x03, 0x92, 0x0C, 0x22, 0x43, 0xD2, 0x18, 0x14, 0x1C, 0xC5, 0x43
	.byte 0x04, 0x40, 0x1D, 0x40, 0x25, 0x43, 0x01, 0x9C, 0x65, 0x19, 0x68, 0x4C, 0x2C, 0x1B, 0x09, 0x19
	.byte 0x0C, 0x05, 0x09, 0x0B, 0x21, 0x43, 0x89, 0x18, 0x0C, 0x1C, 0xDD, 0x43, 0x1C, 0x40, 0x15, 0x40
	.byte 0x25, 0x43, 0x06, 0x9C, 0x65, 0x19, 0x62, 0x4C, 0x2C, 0x1B, 0x00, 0x19, 0x44, 0x01, 0xC0, 0x0E
	.byte 0x20, 0x43, 0x44, 0x18, 0x20, 0x1C, 0xD5, 0x43, 0x10, 0x40, 0x0D, 0x40, 0x05, 0x43, 0x0B, 0x98
	.byte 0x45, 0x19, 0x5C, 0x48, 0x28, 0x18, 0x18, 0x18, 0x43, 0x02, 0xC0, 0x0D, 0x18, 0x43, 0x03, 0x19
	.byte 0x18, 0x1C, 0xCD, 0x43, 0x08, 0x40, 0x25, 0x40, 0x05, 0x43, 0x60, 0x46, 0x45, 0x19, 0x56, 0x48
	.byte 0x28, 0x1A, 0x10, 0x18, 0x82, 0x03, 0x80, 0x0C, 0x10, 0x43, 0xC0, 0x18, 0x02, 0x1C, 0xE5, 0x43
	.byte 0x22, 0x40, 0x1D, 0x40, 0x15, 0x43, 0x05, 0x9A, 0x55, 0x19, 0x50, 0x4A, 0xAA, 0x1A, 0x89, 0x18
	.byte 0x0A, 0x05, 0x09, 0x0B, 0x11, 0x43, 0x0D, 0x18, 0x29, 0x1C, 0xDA, 0x43, 0x19, 0x40, 0x02, 0x40
	.byte 0x0A, 0x43, 0x0A, 0x99, 0x8A, 0x18, 0x4A, 0x49, 0x51, 0x18, 0x61, 0x18, 0x4A, 0x01, 0xC9, 0x0E
	.byte 0x11, 0x43, 0x4A, 0x19, 0x11, 0x1C, 0xC4, 0x43, 0x01, 0x40, 0x2C, 0x40, 0x0C, 0x43, 0x10, 0x99
	.byte 0x0C, 0x19, 0x44, 0x49, 0x61, 0x1A, 0x59, 0x18, 0x4B, 0x02, 0xC9, 0x0D, 0x19, 0x43, 0x89, 0x18
	.byte 0x0B, 0x1C, 0xEC, 0x43, 0x2B, 0x40, 0x14, 0x40, 0x1C, 0x43, 0x04, 0x9B, 0x1C, 0x19, 0x3E, 0x4B
	.byte 0xE3, 0x1A, 0xC0, 0x18, 0x83, 0x03, 0x80, 0x0C, 0x18, 0x43, 0x44, 0x18, 0x20, 0x1C, 0xD3, 0x43
	.byte 0x10, 0x40, 0x0B, 0x40, 0x03, 0x43, 0x09, 0x98, 0xC3, 0x18, 0x38, 0x48, 0x18, 0x18, 0x28, 0x18
	.byte 0x03, 0x05, 0x00, 0x0B, 0x18, 0x43, 0x03, 0x19, 0x18, 0x1C, 0xCD, 0x43, 0x08, 0x40, 0x25, 0x40
	.byte 0x05, 0x43, 0x0E, 0x98, 0x45, 0x19, 0x32, 0x48, 0x28, 0x1A, 0x10, 0x18, 0x42, 0x01, 0xC0, 0x0E
	.byte 0x10, 0x43, 0xC0, 0x18, 0x02, 0x1C, 0xE5, 0x43, 0x22, 0x40, 0x1D, 0x40, 0x15, 0x43, 0x03, 0x9A
	.byte 0x55, 0x19, 0x2C, 0x4A, 0xAA, 0x1A, 0x89, 0x18, 0x4A, 0x02, 0xC9, 0x0D, 0x11, 0x43, 0x0D, 0x18
	.byte 0x29, 0x1C, 0xDA, 0x43, 0x19, 0x40, 0x02, 0x40, 0x0A, 0x43, 0x08, 0x99, 0x8A, 0x18, 0x26, 0x49
	.byte 0x51, 0x18, 0x61, 0x18, 0x8A, 0x03, 0x89, 0x0C, 0x11, 0x43, 0x4A, 0x19, 0x11, 0x1C, 0xC4, 0x43
	.byte 0x01, 0x40, 0x2C, 0x40, 0x0C, 0x43, 0x0D, 0x99, 0x0C, 0x19, 0x20, 0x49, 0x40, 0xE0, 0xC0, 0x46
	.byte 0x88, 0x5B, 0x95, 0x28, 0xAA, 0x48, 0x38, 0x17, 0xDB, 0x70, 0x20, 0x24, 0x12, 0x31, 0x42, 0x3E
	.byte 0x51, 0xF0, 0x83, 0x0A, 0x2A, 0xC6, 0x87, 0x47, 0xED, 0xB9, 0xCF, 0x57, 0xFF, 0x6A, 0xB9, 0x02
	.byte 0xD8, 0x98, 0x80, 0x69, 0x51, 0x08, 0xBB, 0x74, 0x4F, 0xA4, 0x00, 0x00, 0x42, 0x28, 0xA3, 0x76
	.byte 0x22, 0x11, 0x90, 0x6B, 0x6D, 0x8E, 0x67, 0x02, 0x72, 0xBC, 0x86, 0x59, 0x21, 0x08, 0xB4, 0x49
	.byte 0x9E, 0xDA, 0xE1, 0x09, 0xC0, 0x4C, 0xBF, 0x3F, 0x51, 0x5A, 0x5E, 0x26, 0x56, 0x38, 0x49, 0x16
	.byte 0xA3, 0xEF, 0xD0, 0x29, 0x53, 0x14, 0x44, 0x02, 0x7F, 0x19, 0x5E, 0x27, 0x38, 0x04, 0x2C, 0x18
	.byte 0xE6, 0xCD, 0xE1, 0x21, 0x2A, 0xF8, 0xC8, 0x3C, 0x79, 0xF2, 0x2A, 0x0B, 0xED, 0x14, 0x5A, 0x45
	.byte 0xFB, 0x16, 0x1C, 0x56, 0x08, 0x5C, 0x10, 0x03, 0xD9, 0x02, 0x6F, 0x67, 0x76, 0xB3, 0xD5, 0x72
	.byte 0x61, 0x1A, 0x59, 0x18, 0x0B, 0x05, 0x09, 0x0B, 0x19, 0x43, 0x89, 0x18, 0x0B, 0x1C, 0x53, 0x40
	.byte 0x2C, 0x1C, 0x5C, 0x40, 0x06, 0x9B, 0x1C, 0x19, 0xD5, 0x4B, 0xE3, 0x1A, 0xC0, 0x18, 0x03, 0x01
	.byte 0x00, 0x0F, 0x18, 0x43, 0x44, 0x18, 0x20, 0x1C, 0x48, 0x40, 0x13, 0x1C, 0x43, 0x40, 0x09, 0x98
	.byte 0xC3, 0x18, 0xD0, 0x48, 0x18, 0x1A, 0x28, 0x18, 0xC3, 0x02, 0x40, 0x0D, 0x18, 0x43, 0x03, 0x19
	.byte 0x18, 0x1C, 0x60, 0x40, 0x0D, 0x1C, 0x45, 0x40, 0x0C, 0x98, 0x45, 0x19, 0xCA, 0x48, 0x28, 0x18
	.byte 0x10, 0x18, 0x02, 0x04, 0x00, 0x0C, 0x10, 0x43, 0xC0, 0x18, 0x02, 0x1C, 0x5A, 0x40, 0x25, 0x1C
	.byte 0x55, 0x40, 0x10, 0x9A, 0x55, 0x19, 0xC5, 0x4A, 0xAA, 0x1A, 0x89, 0x18, 0xCA, 0x05, 0x49, 0x0A
	.byte 0x11, 0x43, 0x0D, 0x18, 0x29, 0x1C, 0x41, 0x40, 0x1A, 0x1C, 0x4A, 0x40, 0x02, 0x99, 0x8A, 0x18
	.byte 0xBF, 0x49, 0x51, 0x1A, 0x61, 0x18, 0x0A, 0x01, 0x09, 0x0F, 0x11, 0x43, 0x4A, 0x19, 0x11, 0x1C
	.byte 0x69, 0x40, 0x04, 0x1C, 0x4C, 0x40, 0x05, 0x99, 0x0C, 0x19, 0xBA, 0x49, 0x61, 0x18, 0x59, 0x18
	.byte 0xCB, 0x02, 0x49, 0x0D, 0x19, 0x43, 0x89, 0x18, 0x0B, 0x1C, 0x53, 0x40, 0x2C, 0x1C, 0x5C, 0x40
	.byte 0x08, 0x9B, 0x1C, 0x19, 0xB4, 0x4B, 0xE3, 0x1A, 0xC0, 0x18, 0x03, 0x04, 0x00, 0x0C, 0x18, 0x43
	.byte 0x44, 0x18, 0x20, 0x1C, 0x48, 0x40, 0x13, 0x1C, 0x43, 0x40, 0x0B, 0x98, 0xC3, 0x18, 0xAF, 0x48
	.byte 0x18, 0x1A, 0x28, 0x18, 0xC3, 0x05, 0x40, 0x0A, 0x18, 0x43, 0x03, 0x19, 0x18, 0x1C, 0x60, 0x40
	.byte 0x0D, 0x1C, 0x45, 0x40, 0x0E, 0x98, 0x45, 0x19, 0xA9, 0x48, 0x28, 0x18, 0x10, 0x18, 0x02, 0x01
	.byte 0x00, 0x0F, 0x10, 0x43, 0xC0, 0x18, 0x02, 0x1C, 0x5A, 0x40, 0x25, 0x1C, 0x55, 0x40, 0x01, 0x9A
	.byte 0x55, 0x19, 0xA4, 0x4A, 0xAA, 0x1A, 0x89, 0x18, 0xCA, 0x02, 0x49, 0x0D, 0x11, 0x43, 0x0D, 0x18
	.byte 0x29, 0x1C, 0x41, 0x40, 0x1A, 0x1C, 0x4A, 0x40, 0x04, 0x99, 0x8A, 0x18, 0x9E, 0x49, 0x51, 0x1A
	.byte 0x61, 0x18, 0x0A, 0x04, 0x09, 0x0C, 0x11, 0x43, 0x4A, 0x19, 0x11, 0x1C, 0x69, 0x40, 0x04, 0x1C
	.byte 0x4C, 0x40, 0x07, 0x99, 0x0C, 0x19, 0x99, 0x49, 0x61, 0x18, 0x59, 0x18, 0xCB, 0x05, 0x49, 0x0A
	.byte 0x19, 0x43, 0x89, 0x18, 0x0B, 0x1C, 0x53, 0x40, 0x2C, 0x1C, 0x5C, 0x40, 0x0A, 0x9B, 0x1C, 0x19
	.byte 0x93, 0x4B, 0xE3, 0x1A, 0xC0, 0x18, 0x03, 0x01, 0x00, 0x0F, 0x18, 0x43, 0x44, 0x18, 0x20, 0x1C
	.byte 0x48, 0x40, 0x13, 0x1C, 0x43, 0x40, 0x0D, 0x98, 0xC3, 0x18, 0x8E, 0x48, 0x18, 0x1A, 0x28, 0x18
	.byte 0xC3, 0x02, 0x40, 0x0D, 0x18, 0x43, 0x03, 0x19, 0x18, 0x1C, 0x60, 0x40, 0x0D, 0x1C, 0x45, 0x40
	.byte 0x60, 0x46, 0x45, 0x19, 0x88, 0x48, 0x28, 0x18, 0x10, 0x18, 0x02, 0x04, 0x00, 0x0C, 0x10, 0x43
	.byte 0xC0, 0x18, 0x02, 0x1C, 0x5A, 0x40, 0x25, 0x1C, 0x55, 0x40, 0x03, 0x9A, 0x55, 0x19, 0x83, 0x4A
	.byte 0xAA, 0x1A, 0x89, 0x18, 0xCA, 0x05, 0x49, 0x0A, 0x11, 0x43, 0x0D, 0x18, 0xD9, 0x43, 0x29, 0x43
	.byte 0x02, 0x1C, 0x4A, 0x40, 0x01, 0x99, 0x8A, 0x18, 0x7D, 0x49, 0x51, 0x1A, 0x61, 0x18, 0x8A, 0x01
	.byte 0x89, 0x0E, 0x11, 0x43, 0x4A, 0x19, 0xC1, 0x43, 0x11, 0x43, 0x2C, 0x1C, 0x4C, 0x40, 0x08, 0x99
	.byte 0x0C, 0x19, 0x78, 0x49, 0x61, 0x18, 0x59, 0x18, 0x8B, 0x02, 0x89, 0x0D, 0x19, 0x43, 0x89, 0x18
	.byte 0xEB, 0x43, 0x0B, 0x43, 0x14, 0x1C, 0x5C, 0x40, 0x10, 0x9B, 0x1C, 0x19, 0x72, 0x4B, 0xE3, 0x1A
	.byte 0xC0, 0x18, 0xC3, 0x03, 0x40, 0x0C, 0x18, 0x43, 0x44, 0x18, 0xD0, 0x43, 0x20, 0x43, 0x0B, 0x1C
	.byte 0x43, 0x40, 0x06, 0x98, 0xC3, 0x18, 0x6D, 0x48, 0x18, 0x1A, 0x28, 0x18, 0x43, 0x05, 0xC0, 0x0A
	.byte 0x18, 0x43, 0x03, 0x19, 0xC8, 0x43, 0x18, 0x43, 0x25, 0x1C, 0x45, 0x40, 0x0D, 0x98, 0x45, 0x19
	.byte 0x67, 0x48, 0x28, 0x18, 0x10, 0x18, 0x82, 0x01, 0x80, 0x0E, 0x10, 0x43, 0xC0, 0x18, 0xE2, 0x43
	.byte 0x02, 0x43, 0x1D, 0x1C, 0x55, 0x40, 0x04, 0x9A, 0x55, 0x19, 0x62, 0x4A, 0xAA, 0x1A, 0x89, 0x18
	.byte 0x8A, 0x02, 0x89, 0x0D, 0x11, 0x43, 0x0D, 0x18, 0xD9, 0x43, 0x29, 0x43, 0x02, 0x1C, 0x4A, 0x40
	.byte 0x0B, 0x99, 0x8A, 0x18, 0x5C, 0x49, 0x51, 0x1A, 0x61, 0x18, 0xCA, 0x03, 0x49, 0x0C, 0x11, 0x43
	.byte 0x4A, 0x19, 0xC1, 0x43, 0x11, 0x43, 0x2C, 0x1C, 0x4C, 0x40, 0x02, 0x99, 0x0C, 0x19, 0x57, 0x49
	.byte 0x61, 0x1A, 0x59, 0x18, 0x4B, 0x05, 0xC9, 0x0A, 0x19, 0x43, 0x89, 0x18, 0xEB, 0x43, 0x0B, 0x43
	.byte 0x14, 0x1C, 0x5C, 0x40, 0x09, 0x9B, 0x1C, 0x19, 0x51, 0x4B, 0xE3, 0x18, 0xC0, 0x18, 0x83, 0x01
	.byte 0x80, 0x0E, 0x18, 0x43, 0x43, 0x18, 0xD0, 0x43, 0x18, 0x43, 0x48, 0x40, 0x64, 0x46, 0x24, 0x18
	.byte 0x4C, 0x48, 0x20, 0x1A, 0x28, 0x18, 0x84, 0x02, 0x80, 0x0D, 0x20, 0x43, 0xC0, 0x18, 0xCC, 0x43
	.byte 0x04, 0x43, 0x1D, 0x1C, 0x65, 0x40, 0x07, 0x9C, 0x65, 0x19, 0x47, 0x4C, 0x2C, 0x1B, 0x12, 0x19
	.byte 0xD4, 0x03, 0x52, 0x0C, 0x22, 0x43, 0x14, 0x18, 0xDA, 0x43, 0x22, 0x43, 0x05, 0x1C, 0x55, 0x40
	.byte 0x0E, 0x9A, 0x55, 0x19, 0x41, 0x4A, 0xAA, 0x18, 0x89, 0x18, 0x4A, 0x05, 0xC9, 0x0A, 0x11, 0x43
	.byte 0x0A, 0x19, 0xC1, 0x43, 0x11, 0x43, 0x25, 0x1C, 0x4D, 0x40, 0x05, 0x99, 0x4D, 0x19, 0x3C, 0x49
	.byte 0x69, 0x1A, 0x59, 0x18, 0x8B, 0x01, 0x89, 0x0E, 0x19, 0x43, 0x89, 0x18, 0xE3, 0x43, 0x0B, 0x43
	.byte 0x15, 0x1C, 0x5D, 0x40, 0x0C, 0x9B, 0x5D, 0x19, 0x36, 0x4B, 0xEB, 0x1A, 0xC0, 0x18, 0x83, 0x02
	.byte 0x80, 0x0D, 0x18, 0x43, 0x45, 0x18, 0xD0, 0x43, 0x28, 0x43, 0x0B, 0x1C, 0x43, 0x40, 0x03, 0x98
	.byte 0xC3, 0x18, 0x31, 0x48, 0x18, 0x18, 0x20, 0x18, 0xC3, 0x03, 0x40, 0x0C, 0x18, 0x43, 0x43, 0x19
	.byte 0xC8, 0x43, 0x18, 0x43, 0x2C, 0x1C, 0x44, 0x40, 0x0A, 0x98, 0x04, 0x19, 0x2B, 0x48, 0x20, 0x1A
	.byte 0x10, 0x18, 0x42, 0x05, 0xC0, 0x0A, 0x10, 0x43, 0x3A, 0x68, 0xC0, 0x18, 0x51, 0x18, 0x39, 0x60
	.byte 0x79, 0x68, 0x40, 0x22, 0x08, 0x18, 0x78, 0x60, 0xB8, 0x68, 0x00, 0x21, 0xC0, 0x18, 0xB8, 0x60
	.byte 0xF8, 0x68, 0x40, 0x19, 0xF8, 0x60, 0x11, 0xA8, 0x00, 0xF0, 0x7A, 0xF8, 0x21, 0xB0, 0xF0, 0xBD
	.byte 0xBE, 0xC6, 0x05, 0x00, 0x7F, 0x09, 0x8E, 0x78, 0x22, 0x61, 0x9D, 0x6D, 0xF4, 0xC7, 0x1A, 0x02
	.byte 0xBC, 0x15, 0x41, 0x5B, 0xA9, 0xCF, 0xDE, 0x4B, 0xA0, 0xB4, 0x44, 0x09, 0x90, 0x43, 0x40, 0x41
	.byte 0xC6, 0x7E, 0x9B, 0x28, 0x06, 0xD8, 0x5E, 0x15, 0x7B, 0xCF, 0x10, 0x2B, 0x05, 0x1D, 0x88, 0x04
	.byte 0xC7, 0x2F, 0x2B, 0x26, 0x1B, 0x66, 0x24, 0x19, 0xF8, 0x7C, 0xA2, 0x1F, 0x9B, 0xA9, 0x53, 0x3B
	.byte 0xBC, 0xDD, 0xD6, 0x0B, 0x97, 0xFF, 0x2A, 0x43, 0x59, 0xDC, 0x6B, 0x54, 0xC7, 0x5F, 0x6C, 0x03
	.byte 0xC3, 0x59, 0x5B, 0x65, 0x6E, 0x33, 0xF3, 0x70, 0x83, 0x0B, 0x10, 0x00, 0x2F, 0xA2, 0x7B, 0x7A
	.byte 0x4F, 0x7E, 0xA8, 0x6F, 0x20, 0x19, 0xD3, 0x01, 0xEC, 0xBC, 0xFE, 0x5C, 0xA1, 0x11, 0x08, 0x4E
	.byte 0x7E, 0x81, 0xAC, 0x08, 0xCB, 0x0D, 0xC5, 0x42, 0xBB, 0xD2, 0xD7, 0x2A, 0x6F, 0x2C, 0x79, 0x14

	arm_func_start ov02_02334090
ov02_02334090: @ 0x02334090
	strhs fp, [r0], #-0x430
	stmdble pc, {sb, fp, sp}
	stmdbne r3, {r0, r2, r3, fp, sp, lr}
	stmdavs sp, {r0, r2, r8, sl, ip, lr}
	beq _02E7B538
	stmdavs sp, {r0, r2, r3, r4, r6, ip, sp, lr}
	addsvc r0, sp
	stcne p8, c6, [sb, #-0x34]
	sbcsvc r0, sp, sp, lsr #28
	arm_func_end ov02_02334090
_023340B4:
	.byte 0x94, 0x42, 0xEF, 0xD3, 0x30, 0xBC, 0x70, 0x47

	arm_func_start ov02_023340BC
ov02_023340BC: @ 0x023340BC
	arm_func_end ov02_023340BC
_023340BC:
	.byte 0xF0, 0xB4, 0x00, 0x27
	.byte 0x00, 0x2A, 0x0E, 0xD9, 0xCE, 0x19, 0xF3, 0x78, 0x1D, 0x06, 0xB3, 0x78, 0x76, 0x78, 0x1C, 0x04
	.byte 0xCB, 0x5D, 0x36, 0x02, 0x3F, 0x1D, 0x33, 0x43, 0x23, 0x43, 0x2B, 0x43, 0x08, 0xC0, 0x97, 0x42
	.byte 0xF0, 0xD3, 0xF0, 0xBC, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_023340E8
ov02_023340E8: @ 0x023340E8
	strhs fp, [r0], #-0x418
	stmdble r4, {sb, fp, sp}
	strpl r5, [r3, #-0xd0b]
	addsmi r1, r4, #100, #24
	arm_func_end ov02_023340E8
_023340F8:
	.byte 0xFA, 0xD3, 0x18, 0xBC, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_02334100
ov02_02334100: @ 0x02334100
	bhs _0233CD08
	streq sp, [sb], -r6, lsl #18
	mrrcne p6, #0, r1, fp, c9
	mcrrne p0, #0, r7, r0, c1
	arm_func_end ov02_02334100
_02334110:
	.byte 0x93, 0x42, 0xFA, 0xD3, 0x70, 0x47, 0x00, 0x00

	arm_func_start ov02_02334118
ov02_02334118: @ 0x02334118
	addslt fp, r6, r0, ror r5
	arm_func_end ov02_02334118
_0233411C:
	.byte 0x05, 0x1C, 0x0C, 0x1C
	.byte 0x16, 0x1C, 0x00, 0xA8, 0xFF, 0xF7, 0x16, 0xFB, 0x00, 0xA8, 0x21, 0x1C, 0x32, 0x1C, 0xFF, 0xF7
	.byte 0x25, 0xFB, 0x28, 0x1C, 0x00, 0xA9, 0xFF, 0xF7, 0x5D, 0xFB, 0x16, 0xB0, 0x70, 0xBD, 0x00, 0x00

	arm_func_start ov02_02334140
ov02_02334140: @ 0x02334140
	arm_func_end ov02_02334140
_02334140:
	.byte 0x08, 0xB5, 0x46, 0xF5, 0x80, 0xEE, 0x82, 0x0E, 0x89, 0x01, 0x11, 0x43, 0x02, 0x4A, 0x80, 0x01
	.byte 0x00, 0x23, 0x5B, 0xF5, 0x74, 0xEE, 0x08, 0xBD, 0xEA, 0x82, 0x00, 0x00

	arm_func_start ov02_0233415C
ov02_0233415C: @ 0x0233415C
	arm_func_end ov02_0233415C
_0233415C:
	.byte 0x38, 0xB5, 0x04, 0x1C
	.byte 0x4C, 0x43, 0x06, 0x49, 0x20, 0x1C, 0x49, 0x68, 0x88, 0x47, 0x05, 0x1C, 0x03, 0xD0, 0x00, 0x21
	.byte 0x22, 0x1C, 0x53, 0xF5, 0xCA, 0xE8, 0x28, 0x1C, 0x38, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_02334180
ov02_02334180: @ 0x02334180
	stmdbmi r2, {r3, r8, sl, ip, sp, pc}
	strmi r6, [r8, sb, asr #17]
	strbmi fp, [r0], r8, lsl #26
	eorseq sb, r5, #208, #8
	arm_func_end ov02_02334180

	arm_func_start ov02_02334190
ov02_02334190: @ 0x02334190
	arm_func_end ov02_02334190
_02334190:
	.byte 0x30, 0xB4, 0x09, 0x06, 0x0B, 0x0E, 0xF0, 0x21, 0x19, 0x40, 0x0D, 0x11, 0x0F, 0x21, 0x02, 0x1C
	.byte 0x00, 0x24, 0x19, 0x40, 0x09, 0x2D, 0x01, 0xDC, 0x30, 0x35, 0x00, 0xE0, 0x37, 0x35, 0x64, 0x1C
	.byte 0x15, 0x70, 0x52, 0x1C, 0x0D, 0x1C, 0x02, 0x2C, 0xF4, 0xDB, 0x00, 0x21, 0x11, 0x70, 0x10, 0x1A
	.byte 0x30, 0xBC, 0x70, 0x47

	arm_func_start ov02_023341C4
ov02_023341C4: @ 0x023341C4
	strdls fp, ip, [r0], -r8
	arm_func_end ov02_023341C4
_023341C8:
	.byte 0x0E, 0x1C, 0x04, 0x1C, 0x00, 0x25, 0x3A, 0x27
	.byte 0x00, 0x21, 0x71, 0x56, 0x20, 0x1C, 0x76, 0x1C, 0xFF, 0xF7, 0xDA, 0xFF, 0x20, 0x18, 0x04, 0x1C
	.byte 0x05, 0x2D, 0x01, 0xDA, 0x44, 0x1C, 0x07, 0x70, 0x6D, 0x1C, 0x06, 0x2D, 0xF0, 0xDB, 0x00, 0x20
	.byte 0x20, 0x70, 0x00, 0x98, 0x20, 0x1A, 0xF8, 0xBD

	thumb_func_start ov02_023341F8
ov02_023341F8: @ 0x023341F8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _023342C8 @ =0x023594D0
	ldr r0, [r0, #0x38]
	cmp r0, #1
	blt FUN_02334212
	cmp r0, #5
	bgt FUN_02334212
	movs r0, #9
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
	ldr r5, _023342CC @ =0x02353008
	ldr r0, _023342C8 @ =0x023594D0
	movs r6, #7
	str r1, [r5, #0x10]
	str r6, [r0, #0x38]
	str r2, [r0, #0x7c]
	ldr r2, [sp, #0x18]
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #8]
	thumb_func_end ov02_023341F8
_02334228:
	.byte 0x08, 0x1C, 0xFD, 0xF7, 0x9B, 0xF8, 0x01, 0x22
	.byte 0x25, 0x49, 0x00, 0x28, 0x4A, 0x67, 0x02, 0xDA, 0x88, 0x67, 0x02, 0xB0, 0x70, 0xBD, 0x28, 0x1C
	.byte 0x80, 0x68, 0x49, 0x68, 0x88, 0x47, 0x20, 0x49, 0x00, 0x28, 0x08, 0x63, 0x04, 0xD1, 0x30, 0x1C
	.byte 0x08, 0x38, 0x88, 0x67, 0x02, 0xB0, 0x70, 0xBD, 0x45, 0xF5, 0x7A, 0xE9, 0x01, 0x28, 0x05, 0xD0
	.byte 0x30, 0x1C, 0x19, 0x49, 0x10, 0x38, 0x88, 0x67, 0x02, 0xB0, 0x70, 0xBD, 0x28, 0x1C, 0x83, 0x68
	.byte 0x17, 0x48, 0x00, 0x93, 0x01, 0x94, 0x14, 0x4C, 0x16, 0x49, 0x25, 0x6B, 0x07, 0x24, 0xA3, 0x43
	.byte 0x00, 0x22, 0xEB, 0x18, 0x45, 0xF5, 0x6C, 0xE9, 0x0F, 0x48, 0x01, 0x21, 0x81, 0x63, 0xFF, 0xF7
	.byte 0x57, 0xFF, 0x11, 0x49, 0x11, 0x4D, 0x41, 0x18, 0x0C, 0x48, 0x34, 0x1C, 0xC1, 0x60, 0x00, 0x20
	.byte 0x09, 0x49, 0x02, 0x1C, 0x08, 0x61, 0x01, 0x1C, 0x03, 0x1C, 0x0F, 0xC5, 0x0F, 0xC5, 0x64, 0x1E
	.byte 0xFB, 0xD1, 0x03, 0xC5, 0x00, 0xF0, 0x84, 0xF8, 0x05, 0x48, 0x45, 0xF5, 0x42, 0xEB, 0x02, 0x49
	.byte 0x01, 0x20, 0x48, 0x66, 0x02, 0xB0, 0x70, 0xBD, 0xD0, 0x94, 0x35, 0x02, 0x08, 0x30, 0x35, 0x02
	.byte 0x7C, 0x95, 0x35, 0x02, 0xA5, 0x27, 0x33, 0x02, 0x60, 0xEA, 0x00, 0x00, 0x3C, 0x96, 0x35, 0x02

	thumb_func_start ov02_023342E0
ov02_023342E0: @ 0x023342E0
	push {r4, r5, r6, lr}
	ldr r4, _0233436C @ =0x023594D0
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq FUN_02334350
	ldr r6, [r4, #0x38]
	thumb_func_end ov02_023342E0
_023342EC:
	.byte 0x01, 0x20, 0x20, 0x61
	.byte 0x64, 0x25, 0x02, 0xE0, 0x28, 0x1C, 0x45, 0xF5, 0x0E, 0xEC, 0xA0, 0x6B, 0x01, 0x28, 0x01, 0xDB
	.byte 0x05, 0x28, 0xF7, 0xDD, 0x7D, 0x20, 0x80, 0x00, 0x45, 0xF5, 0x04, 0xEC, 0x18, 0x48, 0x45, 0xF5
	.byte 0x90, 0xEA, 0x00, 0x28, 0x0B, 0xD1, 0x16, 0x4C, 0x20, 0x1C, 0x45, 0xF5, 0x12, 0xEB, 0x20, 0x1C
	.byte 0x45, 0xF5, 0x6E, 0xEA, 0x20, 0x1C, 0x45, 0xF5, 0x84, 0xEA, 0x00, 0x28, 0xF4, 0xD0, 0x0F, 0x49
	.byte 0x08, 0x6B, 0x00, 0x28, 0x04, 0xD0, 0xC9, 0x68, 0x88, 0x47, 0x0C, 0x48, 0x00, 0x21, 0x01, 0x63
	.byte 0x0A, 0x48, 0x00, 0x21, 0x41, 0x66, 0x80, 0x6B, 0x86, 0x42, 0x01, 0xD0, 0x00, 0xF0, 0x38, 0xF8
	.byte 0x06, 0x48, 0x40, 0x6F, 0x00, 0x28, 0x05, 0xDD, 0xFD, 0xF7, 0x56, 0xF8, 0x03, 0x49, 0x00, 0x22
	.byte 0x4A, 0x67, 0x70, 0xBD, 0x09, 0x20, 0xC0, 0x43, 0x70, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02
	.byte 0x7C, 0x95, 0x35, 0x02

	arm_func_start ov02_02334374
ov02_02334374: @ 0x02334374
	arm_func_end ov02_02334374
_02334374:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x0A, 0x48, 0x80, 0x6B, 0x20, 0x60, 0x0A, 0x48
	.byte 0xC1, 0x68, 0x00, 0x20, 0xC0, 0x43, 0x81, 0x42, 0x00, 0xD1, 0x04, 0xE0, 0xFF, 0xF7, 0xD8, 0xFE
	.byte 0x05, 0x49, 0xC9, 0x68, 0x08, 0x1A, 0x60, 0x60, 0x02, 0x48, 0x80, 0x6F, 0xA0, 0x60, 0x01, 0x20
	.byte 0x10, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02, 0x08, 0x30, 0x35, 0x02

	thumb_func_start ov02_023343AC
ov02_023343AC: @ 0x023343AC
	push {r3, lr}
	ldr r1, _023343BC @ =0x0235963C
	thumb_func_end ov02_023343AC
_023343B0:
	.byte 0xE8, 0x22, 0x52, 0xF5, 0x74, 0xEF, 0x01, 0x20, 0x08, 0xBD, 0xC0, 0x46, 0x3C, 0x96, 0x35, 0x02

	arm_func_start ov02_023343C0
ov02_023343C0: @ 0x023343C0
	addlt fp, r3, r0, lsl #10
	arm_func_end ov02_023343C0
_023343C4:
	.byte 0x00, 0xA8, 0xFF, 0xF7, 0xD5, 0xFF, 0x03, 0x49, 0x00, 0xA8, 0xC9, 0x6F
	.byte 0x88, 0x47, 0x03, 0xB0, 0x00, 0xBD, 0xC0, 0x46, 0xD0, 0x94, 0x35, 0x02

	arm_func_start ov02_023343DC
ov02_023343DC: @ 0x023343DC
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0xc
	mov r1, #4
	bl ov02_0234E7B4
	ldr r2, _0233449C @ =0x0235AA04
	mov r1, #0x47
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov02_0234D6AC
	ldr lr, _0233449C @ =0x0235AA04
	ldr r1, _023344A0 @ =0x0235248C
	ldr r2, [lr]
	ldrb r4, [r1, r4]
	str r0, [r2, #4]
	ldr r0, [lr]
	ldr ip, _023344A4 @ =0xFE00FF00
	ldr r5, [r0, #4]
	ldr r1, _023344A8 @ =ov02_023344E8
	ldrh r3, [r5, #4]
	mov r0, #1
	mov r2, #0
	bic r3, r3, #0xc00
	orr r3, r3, #0x400
	strh r3, [r5, #4]
	ldr r5, [lr]
	mov r3, #0x78
	ldr r6, [r5, #4]
	ldr r5, [r6]
	bic r5, r5, #0xc00
	str r5, [r6]
	ldrh r5, [r6, #4]
	bic r5, r5, #0xf000
	orr r4, r5, r4, lsl #12
	strh r4, [r6, #4]
	ldr r4, [lr]
	ldr r4, [r4, #4]
	ldr lr, [r4]
	and ip, lr, ip
	orr ip, ip, #0x8b
	orr ip, ip, #0xe60000
	str ip, [r4]
	bl ov02_0234FA98
	ldr r1, _0233449C @ =0x0235AA04
	ldr r1, [r1]
	str r0, [r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0233449C: .4byte 0x0235AA04
_023344A0: .4byte 0x0235248C
_023344A4: .4byte 0xFE00FF00
_023344A8: .4byte ov02_023344E8
	arm_func_end ov02_023343DC

	arm_func_start ov02_023344AC
ov02_023344AC: @ 0x023344AC
	push {r3, lr}
	ldr r1, _023344E0 @ =0x0235AA04
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov02_0234FB6C
	ldr r0, _023344E0 @ =0x0235AA04
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov02_0234F2C0
	ldr r0, _023344E4 @ =0x0235AA04
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_023344E0: .4byte 0x0235AA04
_023344E4: .4byte 0x0235AA04
	arm_func_end ov02_023344AC

	arm_func_start ov02_023344E8
ov02_023344E8: @ 0x023344E8
	push {r3, lr}
	ldr r0, _023345A8 @ =0x0235AA04
	mov r1, #0x28
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	add r0, r0, #1
	bl FUN_02075C38
	ldr r2, _023345A8 @ =0x0235AA04
	mov r1, #5
	ldr r3, [r2]
	strb r0, [r3, #9]
	ldr r0, [r2]
	ldrb r0, [r0, #9]
	bl FUN_02075BFC
	ldr r2, _023345A8 @ =0x0235AA04
	add r1, r0, #0x47
	ldr r2, [r2]
	mov r0, #0
	ldr r2, [r2, #4]
	bl ov02_0234D618
	ldr r1, _023345A8 @ =0x0235AA04
	ldr ip, _023345AC @ =0x0235248C
	ldr r2, [r1]
	ldr r0, _023345B0 @ =0xFE00FF00
	ldr r3, [r2, #4]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xc00
	orr r2, r2, #0x400
	strh r2, [r3, #4]
	ldr r2, [r1]
	ldrb lr, [r2, #8]
	ldr r3, [r2, #4]
	ldr r2, [r3]
	ldrb ip, [ip, lr]
	bic r2, r2, #0xc00
	str r2, [r3]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xf000
	orr r2, r2, ip, lsl #12
	strh r2, [r3, #4]
	ldr r1, [r1]
	ldr r2, [r1, #4]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x8b
	orr r0, r0, #0xe60000
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_023345A8: .4byte 0x0235AA04
_023345AC: .4byte 0x0235248C
_023345B0: .4byte 0xFE00FF00
	arm_func_end ov02_023344E8

	arm_func_start ov02_023345B4
ov02_023345B4: @ 0x023345B4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _0233469C @ =0x023524BC
	mov r5, r0
	mov r0, #0x1c
	mov r1, #4
	ldrb r8, [r2, r5]
	bl ov02_0234E7B4
	ldr r4, _023346A0 @ =0x0235AA08
	mvn r7, #1
	str r0, [r4]
	strb r7, [r0, #0x16]
	ldr r0, [r4]
	cmp r8, #0
	strb r5, [r0, #0x17]
	mov sb, #0
	ble _02334640
	ldr r0, _023346A4 @ =0x023524A0
	mov r6, sb
	add sl, r0, r5, lsl #1
	mov r5, #1
	mov fp, r5
_02334608:
	ldrb r1, [sl], #1
	mov r0, r6
	mov r2, r5
	bl ov02_0234D6D8
	ldr r1, [r4]
	mov r2, fp
	str r0, [r1, sb, lsl #2]
	ldr r0, [r4]
	add r1, r7, #1
	ldr r0, [r0, sb, lsl #2]
	bl ov02_0234D530
	add sb, sb, #1
	cmp sb, r8
	blt _02334608
_02334640:
	mov r1, #1
	mov r2, r1
	mov r0, #0
	bl ov02_0234D6D8
	ldr r3, _023346A0 @ =0x0235AA08
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #1
	str r0, [r4, #8]
	ldr r0, [r3]
	ldr r0, [r0, #8]
	bl ov02_0234D530
	mov r0, #0xc0
	bl ov02_02334780
	mov r0, #0
	ldr r1, _023346A8 @ =ov02_02334814
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _023346A0 @ =0x0235AA08
	ldr r1, [r1]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233469C: .4byte 0x023524BC
_023346A0: .4byte 0x0235AA08
_023346A4: .4byte 0x023524A0
_023346A8: .4byte ov02_02334814
	arm_func_end ov02_023345B4

	arm_func_start ov02_023346AC
ov02_023346AC: @ 0x023346AC
	ldr r0, _023346D0 @ =0x0235AA08
	mov r3, #1
	ldr r2, [r0]
	ldr ip, _023346D4 @ =ov02_0234FB38
	strb r3, [r2, #0x19]
	ldr r0, [r0]
	ldr r1, _023346D8 @ =ov02_02334A5C
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_023346D0: .4byte 0x0235AA08
_023346D4: .4byte ov02_0234FB38
_023346D8: .4byte ov02_02334A5C
	arm_func_end ov02_023346AC

	arm_func_start ov02_023346DC
ov02_023346DC: @ 0x023346DC
	ldr r0, _023346EC @ =0x0235AA08
	ldr r0, [r0]
	ldrsb r0, [r0, #0x16]
	bx lr
	.align 2, 0
_023346EC: .4byte 0x0235AA08
	arm_func_end ov02_023346DC

	arm_func_start ov02_023346F0
ov02_023346F0: @ 0x023346F0
	ldr r2, _0233470C @ =0x0235AA08
	mvn r1, #0
	ldr r3, [r2]
	ldrsb r2, [r3, #0x16]
	cmp r2, r1
	strbeq r0, [r3, #0x16]
	bx lr
	.align 2, 0
_0233470C: .4byte 0x0235AA08
	arm_func_end ov02_023346F0

	arm_func_start ov02_02334710
ov02_02334710: @ 0x02334710
	ldr r1, _02334720 @ =0x0235AA08
	ldr r1, [r1]
	strb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_02334720: .4byte 0x0235AA08
	arm_func_end ov02_02334710

	arm_func_start ov02_02334724
ov02_02334724: @ 0x02334724
	ldr r0, _0233474C @ =0x0235AA08
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0233474C: .4byte 0x0235AA08
	arm_func_end ov02_02334724

	arm_func_start ov02_02334750
ov02_02334750: @ 0x02334750
	ldr r0, _02334764 @ =0x0235AA08
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0
_02334764: .4byte 0x0235AA08
	arm_func_end ov02_02334750

	arm_func_start ov02_02334768
ov02_02334768: @ 0x02334768
	ldr r0, _0233477C @ =0x0235AA08
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0
_0233477C: .4byte 0x0235AA08
	arm_func_end ov02_02334768

	arm_func_start ov02_02334780
ov02_02334780: @ 0x02334780
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02334804 @ =0x0235AA08
	mov r8, r0
	ldr r0, [r1]
	ldr r1, _02334808 @ =0x023524BC
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, #8]
	mov r3, r8
	ldrb r6, [r1, r2]
	mvn r1, #0
	mov r2, #0
	bl ov02_0234D440
	mov r7, #0
	cmp r6, #0
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, _0233480C @ =0x023524AE
	ldr sl, _02334810 @ =0x02352498
	ldr sb, _02334804 @ =0x0235AA08
	mvn r5, #0
_023347CC:
	ldr r0, [sb]
	mov r1, r5
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, r7, lsl #2]
	add r3, r8, #4
	add r2, r4, r2, lsl #1
	ldrb r2, [r7, r2]
	lsl r2, r2, #2
	ldrh r2, [sl, r2]
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, r6
	blt _023347CC
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02334804: .4byte 0x0235AA08
_02334808: .4byte 0x023524BC
_0233480C: .4byte 0x023524AE
_02334810: .4byte 0x02352498
	arm_func_end ov02_02334780

	arm_func_start ov02_02334814
ov02_02334814: @ 0x02334814
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02334878 @ =0x0235AA08
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	sub r0, r0, #4
	str r0, [sp]
	bl ov02_02334780
	ldr r0, [sp]
	cmp r0, #0xa8
	addgt sp, sp, #8
	popgt {r4, pc}
	mov r0, #0xa8
	bl ov02_02334780
	ldr r1, _0233487C @ =ov02_02334880
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02334878: .4byte 0x0235AA08
_0233487C: .4byte ov02_02334880
	arm_func_end ov02_02334814

	arm_func_start ov02_02334880
ov02_02334880: @ 0x02334880
	push {r3, lr}
	ldr r1, _023348C8 @ =0x0235AA08
	mvn r3, #0
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r3, [r1]
	ldrh r2, [r3, #0x14]
	add r2, r2, #1
	strh r2, [r3, #0x14]
	ldr r3, [r1]
	ldrh r1, [r3, #0x14]
	cmp r1, #4
	poplo {r3, pc}
	ldr r1, _023348CC @ =ov02_023348D0
	mov r2, #0
	strh r2, [r3, #0x14]
	bl ov02_0234FB38
	pop {r3, pc}
	.align 2, 0
_023348C8: .4byte 0x0235AA08
_023348CC: .4byte ov02_023348D0
	arm_func_end ov02_02334880

	arm_func_start ov02_023348D0
ov02_023348D0: @ 0x023348D0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r8, _02334A3C @ =0x0235AA08
	ldr r1, _02334A40 @ =0x023524BC
	ldr r3, [r8]
	ldrb r2, [r3, #0x17]
	ldrb r0, [r3, #0x18]
	ldrb r6, [r1, r2]
	cmp r0, #0
	bne _02334A24
	ldrsb r1, [r3, #0x16]
	mvn r0, #0
	cmp r1, r0
	addne sp, sp, #8
	popne {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r6, #0
	mov r7, #0
	ble _02334A24
	ldr r5, _02334A44 @ =0x02352498
	ldr r4, _02334A48 @ =0x023524AE
	ldr sl, _02334A4C @ =0x02352494
	add sb, sp, #0
_02334928:
	ldr r0, [r8]
	mov r1, sl
	ldrb r0, [r0, #0x17]
	mov r2, sb
	add r0, r4, r0, lsl #1
	ldrb r0, [r7, r0]
	add r0, r5, r0, lsl #2
	bl ov02_0234E39C
	mov r0, sb
	bl ov02_0234ED04
	cmp r0, #0
	beq _02334A18
	ldr r0, _02334A3C @ =0x0235AA08
	ldr r3, [r0]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bne _02334A24
	ldrb r2, [r3, #0x17]
	ldr r1, _02334A50 @ =0x023524A0
	ldr r0, [r3, r7, lsl #2]
	add r1, r1, r2, lsl #1
	ldrb r4, [r7, r1]
	mov r1, #0
	bl ov02_0234D308
	mov r2, r0
	add r1, r4, #1
	mov r0, #0
	bl ov02_0234D618
	ldr r0, _02334A3C @ =0x0235AA08
	ldr r1, _02334A48 @ =0x023524AE
	ldr r0, [r0]
	ldr r2, _02334A44 @ =0x02352498
	ldrb r4, [r0, #0x17]
	ldr r3, _02334A54 @ =0x0235249A
	ldr r0, [r0, r7, lsl #2]
	add r1, r1, r4, lsl #1
	ldrb r4, [r7, r1]
	mvn r1, #0
	lsl r4, r4, #2
	ldrh r2, [r2, r4]
	ldrh r3, [r3, r4]
	bl ov02_0234D440
	ldr r0, _02334A3C @ =0x0235AA08
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, r7, lsl #2]
	bl ov02_0234D530
	mov r0, #0
	ldr r1, _02334A58 @ =ov02_02334B38
	mov r2, r0
	mov r3, #0x6e
	bl ov02_0234FA98
	ldr r1, _02334A3C @ =0x0235AA08
	add sp, sp, #8
	ldr r2, [r1]
	str r0, [r2, #0x10]
	ldr r0, [r1]
	strb r7, [r0, #0x16]
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02334A18:
	add r7, r7, #1
	cmp r7, r6
	blt _02334928
_02334A24:
	ldr r0, _02334A3C @ =0x0235AA08
	mvn r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x16]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02334A3C: .4byte 0x0235AA08
_02334A40: .4byte 0x023524BC
_02334A44: .4byte 0x02352498
_02334A48: .4byte 0x023524AE
_02334A4C: .4byte 0x02352494
_02334A50: .4byte 0x023524A0
_02334A54: .4byte 0x0235249A
_02334A58: .4byte ov02_02334B38
	arm_func_end ov02_023348D0

	arm_func_start ov02_02334A5C
ov02_02334A5C: @ 0x02334A5C
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02334AB8 @ =0x0235AA08
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	bl ov02_02334780
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02334ABC @ =ov02_02334AC0
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02334AB8: .4byte 0x0235AA08
_02334ABC: .4byte ov02_02334AC0
	arm_func_end ov02_02334A5C

	arm_func_start ov02_02334AC0
ov02_02334AC0: @ 0x02334AC0
	push {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov02_0234FB40
	ldr r0, _02334B30 @ =0x0235AA08
	ldr r0, [r0]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02334AEC
	mov r0, #0
	bl ov02_0234FB40
_02334AEC:
	ldr r4, _02334B30 @ =0x0235AA08
	mov r5, #0
_02334AF4:
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #2]
	cmp r0, #0
	beq _02334B08
	bl ov02_0234D288
_02334B08:
	add r5, r5, #1
	cmp r5, #2
	blt _02334AF4
	ldr r0, _02334B30 @ =0x0235AA08
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov02_0234D288
	ldr r0, _02334B34 @ =0x0235AA08
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02334B30: .4byte 0x0235AA08
_02334B34: .4byte 0x0235AA08
	arm_func_end ov02_02334AC0

	arm_func_start ov02_02334B38
ov02_02334B38: @ 0x02334B38
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _02334C1C @ =0x0235AA08
	str r0, [sp]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	add r0, r0, #1
	strh r0, [r1, #0x14]
	ldr r1, [r4]
	ldrh r0, [r1, #0x14]
	cmp r0, #0x10
	poplo {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r1, #0x17]
	ldr r0, _02334C20 @ =0x023524BC
	mov sb, #0
	ldrb r8, [r0, r1]
	cmp r8, #0
	ble _02334BD8
	ldr r7, _02334C24 @ =0x023524A0
	mov r6, sb
	mov fp, sb
	mvn r5, #0
_02334B8C:
	ldr r0, [r4]
	mov r1, r6
	ldrb r2, [r0, #0x17]
	ldr r0, [r0, sb, lsl #2]
	add r2, r7, r2, lsl #1
	ldrb sl, [sb, r2]
	bl ov02_0234D308
	mov r2, r0
	mov r1, sl
	mov r0, fp
	bl ov02_0234D618
	ldr r0, [r4]
	mov r1, r5
	ldr r0, [r0, sb, lsl #2]
	mov r2, #1
	bl ov02_0234D530
	add sb, sb, #1
	cmp sb, r8
	blt _02334B8C
_02334BD8:
	mov r0, #0xa8
	bl ov02_02334780
	ldr r1, _02334C1C @ =0x0235AA08
	mov r0, #0
	ldr r2, [r1]
	sub r3, r0, #1
	strh r0, [r2, #0x14]
	ldr r2, [r1]
	strb r3, [r2, #0x16]
	ldr r2, [r1]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp]
	str r0, [r2, #0x10]
	bl ov02_0234FB40
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02334C1C: .4byte 0x0235AA08
_02334C20: .4byte 0x023524BC
_02334C24: .4byte 0x023524A0
	arm_func_end ov02_02334B38

	arm_func_start ov02_02334C28
ov02_02334C28: @ 0x02334C28
	ldr r0, _02334C38 @ =0x0235AA0C
	mov r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_02334C38: .4byte 0x0235AA0C
	arm_func_end ov02_02334C28

	arm_func_start ov02_02334C3C
ov02_02334C3C: @ 0x02334C3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r3, _02334CF8 @ =0x0235AA0C
	mov r7, r0
	ldrb r0, [r3]
	mov r6, r1
	mov r5, r2
	cmp r0, #0
	addne sp, sp, #0x10
	movne r0, #0
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02334CFC @ =0x023530D0
	ldr r1, _02334D00 @ =0x02077FB0
	bl ov02_02334DA8
	ldr r3, _02334D04 @ =0x01920000
	ldr r2, _02334D08 @ =0x04001010
	mov r0, #1
	mov r1, #0
	str r3, [r2]
	bl ov02_0234DDC8
	ldr r1, _02334D0C @ =0x0235AA98
	mov r4, r0
	ldr r0, [r1]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl ov02_02338F74
	mov r5, r0
	bl ov02_02334FA0
	mov r1, #0x40
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	mov r0, r4
	mov r1, #0x14
	mov r2, #0
	mov r3, #0xd8
	bl ov02_0234E1E8
	mov r0, r4
	bl ov02_0234E354
	mov r0, #1
	ldr r1, _02334CF8 @ =0x0235AA0C
	strb r0, [r1]
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02334CF8: .4byte 0x0235AA0C
_02334CFC: .4byte 0x023530D0
_02334D00: .4byte 0x02077FB0
_02334D04: .4byte 0x01920000
_02334D08: .4byte 0x04001010
_02334D0C: .4byte 0x0235AA98
	arm_func_end ov02_02334C3C

	arm_func_start ov02_02334D10
ov02_02334D10: @ 0x02334D10
	push {r3, lr}
	ldr r0, _02334D44 @ =0x0235AA0C
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #0
	popeq {r3, pc}
	mov r0, #1
	bl ov02_0234E02C
	ldr r0, _02334D44 @ =0x0235AA0C
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_02334D44: .4byte 0x0235AA0C
	arm_func_end ov02_02334D10

	arm_func_start ov02_02334D48
ov02_02334D48: @ 0x02334D48
	push {r4, lr}
	mov r4, r0
	ldr r0, _02334DA0 @ =0x0235AA10
	mov r1, r4
	mov r2, #0x3f
	bl FUN_0208975C
	ldrb r0, [r4, #5]
	cmp r0, #0x78
	ldreq r0, _02334DA0 @ =0x0235AA10
	popeq {r4, pc}
	bl ov02_02338DF0
	ldrb r1, [r4, #5]
	cmp r1, #0x79
	bne _02334D8C
	cmp r0, #0
	ldrne r0, _02334DA0 @ =0x0235AA10
	popne {r4, pc}
_02334D8C:
	ldr r1, _02334DA4 @ =0x0235250C
	ldrb r1, [r1, r0]
	ldr r0, _02334DA0 @ =0x0235AA10
	strb r1, [r0, #5]
	pop {r4, pc}
	.align 2, 0
_02334DA0: .4byte 0x0235AA10
_02334DA4: .4byte 0x0235250C
	arm_func_end ov02_02334D48

	arm_func_start ov02_02334DA8
ov02_02334DA8: @ 0x02334DA8
	push {r3, r4, r5, lr}
	mov r5, r1
	bl ov02_02334D48
	add r1, sp, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, [sp]
	mov r4, r0
	bl FUN_0207A2DC
	ldr r2, [sp]
	mov r0, r4
	mov r1, #0
	blx r5
	mov r0, r4
	bl ov02_0234CF78
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02334DA8

	arm_func_start ov02_02334DE8
ov02_02334DE8: @ 0x02334DE8
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r0, sp, #0
	mov r1, #0
	bl ov02_02338D8C
	ldr r0, [sp]
	cmp r0, #1
	bne _02334E1C
	mov r0, r4
	bl ov02_02348174
	add sp, sp, #4
	pop {r3, r4, pc}
_02334E1C:
	cmp r0, #2
	addne sp, sp, #4
	popne {r3, r4, pc}
	mov r0, r4
	bl ov02_02348708
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end ov02_02334DE8

	arm_func_start ov02_02334E38
ov02_02334E38: @ 0x02334E38
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338D8C
	ldr r0, [sp]
	cmp r0, #1
	addne sp, sp, #4
	popne {r3, r4, pc}
	mov r0, r4
	bl ov02_023345B4
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end ov02_02334E38

	arm_func_start ov02_02334E70
ov02_02334E70: @ 0x02334E70
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	ldr r1, _02334EE0 @ =0x0235AA98
	mov r5, r0
	ldr r0, [r1]
	mov r1, r4
	bl ov02_02338F5C
	mov r4, r0
	bl ov02_02334FA0
	mov r1, #0x70
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	mov r0, r5
	mov r1, #0xd
	mov r2, #0x28
	mov r3, #0xe6
	bl ov02_0234E1E8
	mov r0, r5
	bl ov02_0234E354
	add sp, sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02334EE0: .4byte 0x0235AA98
	arm_func_end ov02_02334E70

	arm_func_start ov02_02334EE4
ov02_02334EE4: @ 0x02334EE4
	push {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0
	mov r6, r1
	mov r1, r0
	bl ov02_0234DDC8
	ldr r1, _02334F90 @ =0x0235AA98
	mov r4, r0
	ldr r0, [r1]
	mov r1, r6
	bl ov02_02338F5C
	mov r6, r0
	bl ov02_02334FA0
	mov r1, #0x5e
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, r4
	mov r1, #0xd
	mov r2, #0x3c
	mov r3, #0xe6
	str r6, [sp, #0xc]
	bl ov02_0234E1E8
	bl ov02_02338DF0
	mov r6, r0
	bl ov02_02338DF0
	ldr r1, _02334F94 @ =0x00000209
	lsl r3, r0, #2
	stm sp, {r1, r5}
	ldr r2, _02334F98 @ =0x023524F2
	ldr r1, _02334F9C @ =0x023524F0
	lsl ip, r6, #2
	ldrh r2, [r2, r3]
	ldrh r1, [r1, ip]
	mov r0, r4
	mov r3, #2
	bl ov02_0234E050
	mov r0, r4
	bl ov02_0234E354
	add sp, sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02334F90: .4byte 0x0235AA98
_02334F94: .4byte 0x00000209
_02334F98: .4byte 0x023524F2
_02334F9C: .4byte 0x023524F0
	arm_func_end ov02_02334EE4

	arm_func_start ov02_02334FA0
ov02_02334FA0: @ 0x02334FA0
	push {r3, lr}
	bl ov02_02338DF0
	ldr r1, _02334FB4 @ =0x023524D4
	ldr r0, [r1, r0, lsl #2]
	pop {r3, pc}
	.align 2, 0
_02334FB4: .4byte 0x023524D4
	arm_func_end ov02_02334FA0

	arm_func_start ov02_02334FB8
ov02_02334FB8: @ 0x02334FB8
	push {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _02334FD4 @ =0x0235AA50
	str r0, [r1]
	pop {r3, pc}
	.align 2, 0
_02334FD4: .4byte 0x0235AA50
	arm_func_end ov02_02334FB8

	arm_func_start ov02_02334FD8
ov02_02334FD8: @ 0x02334FD8
	push {r3, lr}
	bl ov02_0233519C
	ldr r0, _02334FEC @ =0x0235AA50
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_02334FEC: .4byte 0x0235AA50
	arm_func_end ov02_02334FD8

	arm_func_start ov02_02334FF0
ov02_02334FF0: @ 0x02334FF0
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r4, r0
	str r1, [sp]
	str r2, [sp, #4]
	mov fp, r3
	bl ov02_0233519C
	ldr r0, _023350A4 @ =0x02352514
	mov sb, #0
	add sl, r0, r4, lsl #1
	mov r7, #1
	ldr r4, _023350A8 @ =0x0235AA50
	mov r8, sb
	mvn r6, #0
	mov r5, r7
_0233502C:
	ldrb r1, [sl], #1
	mov r0, r8
	mov r2, r7
	bl ov02_0234D6D8
	ldr r2, [r4]
	mov r1, r6
	str r0, [r2, sb, lsl #2]
	ldr r0, [r4]
	mov r2, r5
	ldr r0, [r0, sb, lsl #2]
	bl ov02_0234D530
	add sb, sb, #1
	cmp sb, #2
	blt _0233502C
	ldr r0, _023350A8 @ =0x0235AA50
	ldr r2, [sp]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _023350A8 @ =0x0235AA50
	ldr r2, [sp, #4]
	ldr r0, [r0]
	mov r3, fp
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov02_0234D440
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023350A4: .4byte 0x02352514
_023350A8: .4byte 0x0235AA50
	arm_func_end ov02_02334FF0

	arm_func_start ov02_023350AC
ov02_023350AC: @ 0x023350AC
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov sb, #6
	bl ov02_0233519C
	mov sl, #0
	mov r7, #1
	ldr r4, _02335198 @ =0x0235AA50
	mov r8, sl
	mvn r6, #0
	mov r5, r7
_023350E4:
	mov r0, r8
	mov r1, sb
	mov r2, r7
	bl ov02_0234D6D8
	ldr r2, [r4]
	mov r1, r6
	str r0, [r2, sl, lsl #2]
	ldr r0, [r4]
	mov r2, r5
	ldr r0, [r0, sl, lsl #2]
	bl ov02_0234D530
	add sl, sl, #1
	cmp sl, #4
	add sb, sb, #1
	blt _023350E4
	ldr r0, _02335198 @ =0x0235AA50
	ldr r3, [sp, #4]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _02335198 @ =0x0235AA50
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #4]
	ldr r0, [r0, #4]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _02335198 @ =0x0235AA50
	ldr r3, [sp, #8]
	ldr r0, [r0]
	mov r2, fp
	ldr r0, [r0, #8]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _02335198 @ =0x0235AA50
	ldr r2, [sp]
	ldr r0, [r0]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mvn r1, #0
	bl ov02_0234D440
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335198: .4byte 0x0235AA50
	arm_func_end ov02_023350AC

	arm_func_start ov02_0233519C
ov02_0233519C: @ 0x0233519C
	push {r4, r5, r6, lr}
	mov r6, #0
	ldr r4, _023351D8 @ =0x0235AA50
	mov r5, r6
_023351AC:
	ldr r0, [r4]
	ldr r0, [r0, r6, lsl #2]
	cmp r0, #0
	beq _023351C8
	bl ov02_0234D288
	ldr r0, [r4]
	str r5, [r0, r6, lsl #2]
_023351C8:
	add r6, r6, #1
	cmp r6, #4
	blt _023351AC
	pop {r4, r5, r6, pc}
	.align 2, 0
_023351D8: .4byte 0x0235AA50
	arm_func_end ov02_0233519C

	arm_func_start ov02_023351DC
ov02_023351DC: @ 0x023351DC
	push {r3, lr}
	mov r0, #0xc0
	mov r1, #4
	bl ov02_0234E7B4
	ldr r2, _02335240 @ =0x0235AA54
	ldr r1, _02335244 @ =0x02078250
	str r0, [r2]
	ldr r0, _02335248 @ =0x02353304
	bl ov02_02334DA8
	bl ov02_02338E00
	cmp r0, #0
	beq _02335218
	cmp r0, #1
	beq _0233522C
	pop {r3, pc}
_02335218:
	ldr r0, _0233524C @ =0x023532B4
	ldr r1, _02335250 @ =FUN_02078010
	ldr r0, [r0]
	bl ov02_02334DA8
	pop {r3, pc}
_0233522C:
	ldr r0, _0233524C @ =0x023532B4
	ldr r1, _02335250 @ =FUN_02078010
	ldr r0, [r0, #4]
	bl ov02_02334DA8
	pop {r3, pc}
	.align 2, 0
_02335240: .4byte 0x0235AA54
_02335244: .4byte 0x02078250
_02335248: .4byte 0x02353304
_0233524C: .4byte 0x023532B4
_02335250: .4byte FUN_02078010
	arm_func_end ov02_023351DC

	arm_func_start ov02_02335254
ov02_02335254: @ 0x02335254
	ldr ip, _02335260 @ =ov02_0234E7D8
	ldr r0, _02335264 @ =0x0235AA54
	bx ip
	.align 2, 0
_02335260: .4byte ov02_0234E7D8
_02335264: .4byte 0x0235AA54
	arm_func_end ov02_02335254

	arm_func_start ov02_02335268
ov02_02335268: @ 0x02335268
	push {r4, lr}
	ldr r1, _023352B8 @ =0x023532B4
	ldr r0, [r1, r0, lsl #2]
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _023352BC @ =0x0235AA54
	mov r4, r0
	ldr r1, [r1]
	mov r2, #0xc0
	bl FUN_0207C3B4
	mov r0, r4
	bl ov02_0234CF78
	mov r0, #1
	ldr r1, _023352C0 @ =ov02_023352F4
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	pop {r4, pc}
	.align 2, 0
_023352B8: .4byte 0x023532B4
_023352BC: .4byte 0x0235AA54
_023352C0: .4byte ov02_023352F4
	arm_func_end ov02_02335268

	arm_func_start ov02_023352C4
ov02_023352C4: @ 0x023352C4
	push {r3, lr}
	bl ov02_02347518
	ldrb r0, [r0, #0xf4]
	add r0, r0, #5
	bl ov02_02335268
	pop {r3, pc}
	arm_func_end ov02_023352C4

	arm_func_start ov02_023352DC
ov02_023352DC: @ 0x023352DC
	push {r3, lr}
	bl ov02_02347518
	ldrb r0, [r0, #0xf4]
	add r0, r0, #2
	bl ov02_02335268
	pop {r3, pc}
	arm_func_end ov02_023352DC

	arm_func_start ov02_023352F4
ov02_023352F4: @ 0x023352F4
	push {r4, lr}
	ldr r1, _02335330 @ =0x0235AA54
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0xc0
	bl FUN_0207A2DC
	ldr r0, _02335330 @ =0x0235AA54
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0xc0
	bl FUN_02078010
	mov r1, r4
	mov r0, #1
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_02335330: .4byte 0x0235AA54
	arm_func_end ov02_023352F4

	arm_func_start ov02_02335334
ov02_02335334: @ 0x02335334
	push {r3, r4, r5, lr}
	ldr r1, _023353DC @ =0x0235AA58
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0xc
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _023353E0 @ =0x02352520
	ldr r2, _023353DC @ =0x0235AA58
	ldrb r1, [r1, r4, lsl #2]
	str r0, [r2]
	strb r4, [r0, #8]
	mov r0, #0
	bl ov02_0234D6AC
	ldr lr, _023353DC @ =0x0235AA58
	ldr ip, _023353E4 @ =0xFE00FF00
	ldr r2, [lr]
	ldr r1, _023353E8 @ =ov02_02335430
	str r0, [r2]
	ldr r2, [lr]
	mov r0, #0
	ldr r5, [r2]
	mov r2, r0
	ldr r4, [r5]
	mov r3, #0x78
	and r4, r4, ip
	orr r4, r4, #0x26
	orr r4, r4, #0xe50000
	str r4, [r5]
	ldr ip, [lr]
	ldr lr, [ip]
	ldrh ip, [lr, #4]
	bic ip, ip, #0xc00
	orr ip, ip, #0x800
	strh ip, [lr, #4]
	bl ov02_0234FA98
	ldr r1, _023353DC @ =0x0235AA58
	ldr r1, [r1]
	str r0, [r1, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_023353DC: .4byte 0x0235AA58
_023353E0: .4byte 0x02352520
_023353E4: .4byte 0xFE00FF00
_023353E8: .4byte ov02_02335430
	arm_func_end ov02_02335334

	arm_func_start ov02_023353EC
ov02_023353EC: @ 0x023353EC
	push {r3, lr}
	ldr r0, _02335428 @ =0x0235AA58
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
	ldr r1, [r0, #4]
	mov r0, #0
	bl ov02_0234FB6C
	ldr r0, _02335428 @ =0x0235AA58
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov02_0234F2C0
	ldr r0, _0233542C @ =0x0235AA58
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_02335428: .4byte 0x0235AA58
_0233542C: .4byte 0x0235AA58
	arm_func_end ov02_023353EC

	arm_func_start ov02_02335430
ov02_02335430: @ 0x02335430
	push {r3, r4, r5, lr}
	ldr r0, _023354C8 @ =0x04000208
	mov r4, #0
	ldrh r5, [r0]
	strh r4, [r0]
	bl FUN_022BF640
	cmp r0, #0x8000
	beq _02335458
	bl FUN_022BF660
	mov r4, r0
_02335458:
	ldr r2, _023354C8 @ =0x04000208
	ldr r1, _023354CC @ =0x0235AA58
	ldrh r0, [r2]
	ldr r3, _023354D0 @ =0x02352520
	mov r0, #0
	strh r5, [r2]
	ldr r2, [r1]
	ldrsb r1, [r2, #8]
	ldr r2, [r2]
	add r1, r3, r1, lsl #2
	ldrb r1, [r4, r1]
	bl ov02_0234D618
	ldr r1, _023354CC @ =0x0235AA58
	ldr r0, _023354D4 @ =0xFE00FF00
	ldr r2, [r1]
	ldr r3, [r2]
	ldr r2, [r3]
	and r0, r2, r0
	orr r0, r0, #0x26
	orr r0, r0, #0xe50000
	str r0, [r3]
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0x800
	strh r0, [r1, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_023354C8: .4byte 0x04000208
_023354CC: .4byte 0x0235AA58
_023354D0: .4byte 0x02352520
_023354D4: .4byte 0xFE00FF00
	arm_func_end ov02_02335430

	arm_func_start ov02_023354D8
ov02_023354D8: @ 0x023354D8
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	add r5, sp, #0x1c
	mov r4, #0
	strh r4, [r5, #4]
	mov r3, #0x11
	strh r4, [r5, #6]
	mov r2, #0x12
	mov r0, #0x128
	mov r1, #4
	strh r4, [r5]
	strh r4, [r5, #2]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	bl ov02_0234E7B4
	ldr r8, _02335824 @ =0x0235AA5C
	mov r1, #0xff
	str r0, [r8]
	strb r1, [r0, #0x11c]
	ldr r0, [r8]
	mov r6, r4
	strb r6, [r0, #0x121]
	mov r5, r4
	ldr r0, [r8]
	mov r1, #1
	strb r1, [r0, #0x123]
	ldr r0, [r8]
	ldr r7, _02335828 @ =0xC1FFFCFF
	strb r1, [r0, #0x124]
	mov r4, #0x34
_02335550:
	mov r0, r5
	mov r1, r4
	bl ov02_0234D6AC
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x30]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x30]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x30]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #0x2f
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _02335550
	mov r6, #0
	ldr r5, _0233582C @ =0x02352538
	ldr r8, _02335824 @ =0x0235AA5C
	ldr r7, _02335828 @ =0xC1FFFCFF
	mov r4, r6
_023355C0:
	ldrb r1, [r5], #1
	mov r0, r4
	bl ov02_0234D6AC
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0xec]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0xec]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0xec]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #4
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _023355C0
	mov sl, #0
	ldr sb, _02335830 @ =0x02352530
	ldr r4, _02335824 @ =0x0235AA5C
	mov r8, sl
	mov r7, #1
	mvn r6, #0
	mov r5, #0x200
	mov fp, sl
_0233563C:
	ldrb r1, [sb], #1
	mov r0, r8
	mov r2, r7
	bl ov02_0234D6D8
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, sl, lsl #2
	str r0, [r2, #0xfc]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0xfc]
	mov r3, fp
	bl ov02_0234D31C
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0xfc]
	mov r2, #3
	bl ov02_0234D530
	add sl, sl, #1
	cmp sl, #2
	blt _0233563C
	mov sl, #0
	strh sl, [sp, #0x16]
_023356A0:
	mov sb, #0
	ldr r6, _02335834 @ =0x02353324
	ldr r4, _02335824 @ =0x0235AA5C
	str sb, [sp, #0x10]
	mov fp, #2
_023356B4:
	add r0, sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r1, #0x1c
	mov r2, #2
	mov r3, r0
	bl ov02_0234DCC0
	ldr r1, [r4]
	lsl r2, sb, #2
	add r1, r1, sl, lsl #4
	str r0, [r1, sb, lsl #2]
	mov r0, #0
	ldr r7, [sp, #0x10]
	strh r0, [sp, #0x1c]
	mov r8, r0
	add r5, r2, sl, lsl #4
_023356F8:
	ldr r1, [r6, sl, lsl #2]
	lsl r0, r7, #1
	ldrh r1, [r1, r0]
	ldrh r0, [sp, #0x22]
	strh r1, [sp, #0x14]
	stm sp, {r0, fp}
	mov r0, #0x480
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldrh r1, [sp, #0x1c]
	ldrh r2, [sp, #0x1e]
	ldrh r3, [sp, #0x20]
	ldr r0, [r0, r5]
	bl ov02_0234E1E8
	ldrh r0, [sp, #0x1c]
	add r8, r8, #1
	cmp r8, #0xc
	add r0, r0, #0x12
	add r7, r7, #1
	strh r0, [sp, #0x1c]
	blt _023356F8
	cmp sl, #0
	bne _02335778
	ldr r1, [sp, #0x18]
	mov r0, #0
	mov r2, #1
	bl ov02_0234D12C
	ldr r1, [r4]
	add r1, r1, sb, lsl #2
	str r0, [r1, #0x104]
_02335778:
	ldr r0, [sp, #0x10]
	add sb, sb, #1
	add r0, r0, #0xc
	str r0, [sp, #0x10]
	cmp sb, #4
	blt _023356B4
	add sl, sl, #1
	cmp sl, #3
	blt _023356A0
	mov r0, #0
	mov r1, #0x40
	mov r2, #1
	bl ov02_0234D6D8
	ldr r3, _02335824 @ =0x0235AA5C
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x114]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x114]
	bl ov02_0234D31C
	ldr r0, _02335824 @ =0x0235AA5C
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov02_0234D530
	mov r0, #0
	ldr r1, _02335838 @ =ov02_023358C8
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r3, _02335824 @ =0x0235AA5C
	mov r1, #0
	ldr r4, [r3]
	mov r2, #0xc0
	str r0, [r4, #0x118]
	ldr r0, [r3]
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02335824: .4byte 0x0235AA5C
_02335828: .4byte 0xC1FFFCFF
_0233582C: .4byte 0x02352538
_02335830: .4byte 0x02352530
_02335834: .4byte 0x02353324
_02335838: .4byte ov02_023358C8
	arm_func_end ov02_023354D8

	arm_func_start ov02_0233583C
ov02_0233583C: @ 0x0233583C
	push {r3, lr}
	ldr r0, _02335868 @ =0x0235AA5C
	ldr r0, [r0]
	ldr r0, [r0, #0x114]
	bl ov02_0234D288
	ldr r0, _02335868 @ =0x0235AA5C
	ldr r1, _0233586C @ =ov02_02336E50
	ldr r0, [r0]
	ldr r0, [r0, #0x118]
	bl ov02_0234FB38
	pop {r3, pc}
	.align 2, 0
_02335868: .4byte 0x0235AA5C
_0233586C: .4byte ov02_02336E50
	arm_func_end ov02_0233583C

	arm_func_start ov02_02335870
ov02_02335870: @ 0x02335870
	ldr r0, _02335880 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11c]
	bx lr
	.align 2, 0
_02335880: .4byte 0x0235AA5C
	arm_func_end ov02_02335870

	arm_func_start ov02_02335884
ov02_02335884: @ 0x02335884
	ldr r1, _02335894 @ =0x0235AA5C
	ldr r1, [r1]
	strb r0, [r1, #0x123]
	bx lr
	.align 2, 0
_02335894: .4byte 0x0235AA5C
	arm_func_end ov02_02335884

	arm_func_start ov02_02335898
ov02_02335898: @ 0x02335898
	ldr r1, _023358A8 @ =0x0235AA5C
	ldr r1, [r1]
	strb r0, [r1, #0x124]
	bx lr
	.align 2, 0
_023358A8: .4byte 0x0235AA5C
	arm_func_end ov02_02335898

	arm_func_start ov02_023358AC
ov02_023358AC: @ 0x023358AC
	ldr r0, _023358C4 @ =0x0235AA5C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_023358C4: .4byte 0x0235AA5C
	arm_func_end ov02_023358AC

	arm_func_start ov02_023358C8
ov02_023358C8: @ 0x023358C8
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02335950 @ =0x0235AA5C
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _02335954 @ =0x01FF0000
	ldr r0, [r3, #0x30]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x51
	ldrb r0, [r3, #0x11d]
	mov r1, #0
	ble _0233591C
	bl ov02_02336574
	add sp, sp, #8
	pop {r4, pc}
_0233591C:
	mov r2, #0x51
	bl ov02_02336574
	ldr r0, _02335950 @ =0x0235AA5C
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	ldr r1, _02335958 @ =ov02_0233595C
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02335950: .4byte 0x0235AA5C
_02335954: .4byte 0x01FF0000
_02335958: .4byte ov02_0233595C
	arm_func_end ov02_023358C8

	arm_func_start ov02_0233595C
ov02_0233595C: @ 0x0233595C
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _023359E4 @ =0x0235AA5C
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _023359E8 @ =0x01FF0000
	ldr r0, [r3, #0x60]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x67
	ldrb r0, [r3, #0x11d]
	mov r1, #1
	ble _023359B0
	bl ov02_02336574
	add sp, sp, #8
	pop {r4, pc}
_023359B0:
	mov r2, #0x67
	bl ov02_02336574
	ldr r0, _023359E4 @ =0x0235AA5C
	mov r1, #2
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	ldr r1, _023359EC @ =ov02_023359F0
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_023359E4: .4byte 0x0235AA5C
_023359E8: .4byte 0x01FF0000
_023359EC: .4byte ov02_023359F0
	arm_func_end ov02_0233595C

	arm_func_start ov02_023359F0
ov02_023359F0: @ 0x023359F0
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02335A78 @ =0x0235AA5C
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _02335A7C @ =0x01FF0000
	ldr r0, [r3, #0x90]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x7d
	ldrb r0, [r3, #0x11d]
	mov r1, #2
	ble _02335A44
	bl ov02_02336574
	add sp, sp, #8
	pop {r4, pc}
_02335A44:
	mov r2, #0x7d
	bl ov02_02336574
	ldr r0, _02335A78 @ =0x0235AA5C
	mov r1, #3
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	ldr r1, _02335A80 @ =ov02_02335A84
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02335A78: .4byte 0x0235AA5C
_02335A7C: .4byte 0x01FF0000
_02335A80: .4byte ov02_02335A84
	arm_func_end ov02_023359F0

	arm_func_start ov02_02335A84
ov02_02335A84: @ 0x02335A84
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02335B0C @ =0x0235AA5C
	mov r4, r0
	ldr r3, [r2]
	ldr r1, _02335B10 @ =0x01FF0000
	ldr r0, [r3, #0xc0]
	ldr r0, [r0]
	and r1, r0, r1
	and r0, r0, #0xff
	sub r2, r0, #0xc
	lsr r0, r1, #0x10
	str r0, [sp, #4]
	str r2, [sp]
	cmp r2, #0x93
	ldrb r0, [r3, #0x11d]
	mov r1, #3
	ble _02335AD8
	bl ov02_02336574
	add sp, sp, #8
	pop {r4, pc}
_02335AD8:
	mov r2, #0x93
	bl ov02_02336574
	ldr r0, _02335B0C @ =0x0235AA5C
	mov r1, #4
	ldr r0, [r0]
	mov r2, #0xc0
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	ldr r1, _02335B14 @ =ov02_02335B18
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02335B0C: .4byte 0x0235AA5C
_02335B10: .4byte 0x01FF0000
_02335B14: .4byte ov02_02335B18
	arm_func_end ov02_02335A84

	arm_func_start ov02_02335B18
ov02_02335B18: @ 0x02335B18
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02335B9C @ =0x0235AA5C
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #0xfc]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	mov r1, #4
	sub r2, r0, #0xc
	str r2, [sp]
	cmp r2, #0xaa
	ble _02335B70
	ldr r0, _02335B9C @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	add sp, sp, #8
	pop {r4, pc}
_02335B70:
	ldr r0, _02335B9C @ =0x0235AA5C
	mov r2, #0xaa
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	bl ov02_02336574
	bl ov02_0233693C
	ldr r1, _02335BA0 @ =0x02335BA4
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02335B9C: .4byte 0x0235AA5C
_02335BA0: .4byte 0x02335BA4
	arm_func_end ov02_02335B18
_02335BA4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x03, 0x00, 0x00, 0xEB, 0x7C, 0x00, 0x00, 0xEB
	.byte 0x4D, 0x01, 0x00, 0xEB, 0xE2, 0x01, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02335BBC
ov02_02335BBC: @ 0x02335BBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _02335D80 @ =0x02352F34
	bl ov02_0234ED04
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _02335D84 @ =0x0235AA5C
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _02335D88 @ =0x02352588
	ldr r6, _02335D8C @ =0x02352544
	strb r1, [r0, #0x11e]
	mov r4, #0
	add r5, sp, #0
_02335BF8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02335C58
	ldr r0, _02335D84 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _02335C3C
	mov r0, #9
	bl ov02_023480E0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335C3C:
	mov r0, #0
	bl ov02_023480E0
	ldr r0, _02335D84 @ =0x0235AA5C
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02335C58:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _02335BF8
	ldr r6, _02335D90 @ =0x02352570
	ldr r7, _02335D94 @ =0x02352560
	mov r4, #0
	add r5, sp, #0
_02335C78:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02335D04
	cmp r4, #3
	bne _02335CB4
	ldr r0, _02335D84 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x123]
	cmp r0, #0
	beq _02335CD0
_02335CB4:
	cmp r4, #2
	bne _02335CE0
	ldr r0, _02335D84 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x124]
	cmp r0, #0
	bne _02335CE0
_02335CD0:
	mov r0, #9
	bl ov02_023480E0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335CE0:
	ldr r0, _02335D98 @ =0x02353330
	ldr r0, [r0, r4, lsl #2]
	bl ov02_023480E0
	ldr r0, _02335D84 @ =0x0235AA5C
	add r1, r4, #0x2f
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02335D04:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _02335C78
	ldr r6, _02335D9C @ =0x02352558
	ldr r5, _02335DA0 @ =0x02352540
	mov r7, #0
	add r4, sp, #0
_02335D28:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234ED04
	cmp r0, #0
	beq _02335D68
	mov r0, #0
	bl ov02_023480E0
	ldr r0, _02335D84 @ =0x0235AA5C
	add r1, r7, #0x33
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02335D68:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _02335D28
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02335D80: .4byte 0x02352F34
_02335D84: .4byte 0x0235AA5C
_02335D88: .4byte 0x02352588
_02335D8C: .4byte 0x02352544
_02335D90: .4byte 0x02352570
_02335D94: .4byte 0x02352560
_02335D98: .4byte 0x02353330
_02335D9C: .4byte 0x02352558
_02335DA0: .4byte 0x02352540
	arm_func_end ov02_02335BBC

	arm_func_start ov02_02335DA4
ov02_02335DA4: @ 0x02335DA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02336050 @ =0x0235AA5C
	ldr r0, _02336054 @ =0x02352F34
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x11c]
	bl ov02_0234EE14
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r7, _02336058 @ =0x02352588
	ldr r6, _0233605C @ =0x02352544
	mov r4, #0
	add r5, sp, #0
_02335DE0:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02335E60
	ldr r1, _02336050 @ =0x0235AA5C
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r4
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r3, #0x11d]
	ldr r0, _02336060 @ =0x02353318
	ldr r0, [r0, r2, lsl #2]
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02335E48
	mov r0, #0
	bl ov02_023367F0
_02335E48:
	ldr r0, _02336050 @ =0x0235AA5C
	ldr r0, [r0]
	strb r4, [r0, #0x121]
	bl ov02_0233693C
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335E60:
	add r4, r4, #1
	cmp r4, #0x2f
	add r7, r7, #4
	blt _02335DE0
	ldr r6, _02336064 @ =0x02352578
	ldr r7, _02336068 @ =0x02352568
	mov r4, #2
	add r5, sp, #0
_02335E80:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02335F00
	ldr r1, _02336050 @ =0x0235AA5C
	add r2, r4, #0x2f
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _0233606C @ =0x02352580
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02335EE4
	mov r0, #0
	bl ov02_023367F0
_02335EE4:
	ldr r0, _02336050 @ =0x0235AA5C
	add r1, r4, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov02_0233693C
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335F00:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _02335E80
	ldr r7, _02336070 @ =0x02352558
	ldr r6, _02336074 @ =0x02352540
	mov r4, #0
	add r5, sp, #0
_02335F24:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02335F84
	ldr r1, _02336050 @ =0x0235AA5C
	add r2, r4, #0x33
	ldr r3, [r1]
	add r0, r3, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _02336078 @ =0x02352534
	ldrb r0, [r0, r4]
	strb r0, [r3, #0x11c]
	ldr r0, [r1]
	strb r2, [r0, #0x121]
	bl ov02_0233693C
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335F84:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _02335F24
	ldr r0, _0233607C @ =0x02352560
	ldr r1, _02336080 @ =0x02352570
	add r2, sp, #0
	bl ov02_0234E39C
	add r0, sp, #0
	bl ov02_0234EE14
	cmp r0, #0
	beq _02335FF0
	ldr r0, _02336050 @ =0x0235AA5C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x2f
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	bl ov02_0233608C
	ldr r0, _02336050 @ =0x0235AA5C
	mov r1, #0x2f
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov02_0233693C
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02335FF0:
	ldr r0, _02336084 @ =0x02352564
	ldr r1, _02336088 @ =0x02352574
	add r2, sp, #0
	bl ov02_0234E39C
	add r0, sp, #0
	bl ov02_0234EE14
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _02336050 @ =0x0235AA5C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, #0x30
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	bl ov02_023360BC
	ldr r0, _02336050 @ =0x0235AA5C
	mov r1, #0x30
	ldr r0, [r0]
	strb r1, [r0, #0x121]
	bl ov02_0233693C
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02336050: .4byte 0x0235AA5C
_02336054: .4byte 0x02352F34
_02336058: .4byte 0x02352588
_0233605C: .4byte 0x02352544
_02336060: .4byte 0x02353318
_02336064: .4byte 0x02352578
_02336068: .4byte 0x02352568
_0233606C: .4byte 0x02352580
_02336070: .4byte 0x02352558
_02336074: .4byte 0x02352540
_02336078: .4byte 0x02352534
_0233607C: .4byte 0x02352560
_02336080: .4byte 0x02352570
_02336084: .4byte 0x02352564
_02336088: .4byte 0x02352574
	arm_func_end ov02_02335DA4

	arm_func_start ov02_0233608C
ov02_0233608C: @ 0x0233608C
	push {r3, lr}
	ldr r0, _023360B8 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #2
	moveq r0, #0
	movne r0, #2
	bl ov02_023367F0
	mov r0, #1
	bl ov02_023480E0
	pop {r3, pc}
	.align 2, 0
_023360B8: .4byte 0x0235AA5C
	arm_func_end ov02_0233608C

	arm_func_start ov02_023360BC
ov02_023360BC: @ 0x023360BC
	push {r3, lr}
	ldr r0, _023360E8 @ =0x0235AA5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov02_023367F0
	mov r0, #1
	bl ov02_023480E0
	pop {r3, pc}
	.align 2, 0
_023360E8: .4byte 0x0235AA5C
	arm_func_end ov02_023360BC

	arm_func_start ov02_023360EC
ov02_023360EC: @ 0x023360EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _023362D0 @ =0x02352F34
	bl ov02_0234EC7C
	cmp r0, #0
	beq _023362B0
	ldr r7, _023362D4 @ =0x02352588
	ldr r5, _023362D8 @ =0x02352544
	mov r6, #0
	add r4, sp, #0
_02336114:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02336158
	ldr r0, _023362DC @ =0x0235AA5C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1e]
	cmp r0, r6
	bne _023362B0
	mov r0, r6
	bl ov02_023362F0
	b _023362B8
_02336158:
	add r6, r6, #1
	cmp r6, #0x2f
	add r7, r7, #4
	blt _02336114
	ldr r6, _023362E0 @ =0x02352578
	ldr r7, _023362E4 @ =0x02352568
	mov r4, #2
	add r5, sp, #0
_02336178:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02336238
	ldr r1, _023362DC @ =0x0235AA5C
	add r0, r4, #0x2f
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1e]
	cmp r1, r0
	bne _023362B0
	bl ov02_023362F0
	cmp r4, #3
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r0, _023362DC @ =0x0235AA5C
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	add r1, r1, #1
	strb r1, [r2, #0x122]
	ldr r2, [r0]
	ldrb r1, [r2, #0x122]
	cmp r1, #0x28
	addlo sp, sp, #8
	poplo {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x123]
	cmp r1, #0
	bne _02336218
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _023362DC @ =0x0235AA5C
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x11e]
	pop {r3, r4, r5, r6, r7, pc}
_02336218:
	mov r1, #0x80
	strb r1, [r2, #0x11c]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x122]
	sub r0, r0, #7
	strb r0, [r1, #0x122]
	pop {r3, r4, r5, r6, r7, pc}
_02336238:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #4
	add r7, r7, #4
	blt _02336178
	ldr r6, _023362E8 @ =0x02352558
	ldr r5, _023362EC @ =0x02352540
	mov r7, #0
	add r4, sp, #0
_0233625C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	beq _023362A0
	ldr r1, _023362DC @ =0x0235AA5C
	add r0, r7, #0x33
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1e]
	cmp r1, r0
	bne _023362B0
	bl ov02_023362F0
	b _023362B8
_023362A0:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _0233625C
_023362B0:
	mvn r0, #0
	bl ov02_023362F0
_023362B8:
	ldr r0, _023362DC @ =0x0235AA5C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x122]
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023362D0: .4byte 0x02352F34
_023362D4: .4byte 0x02352588
_023362D8: .4byte 0x02352544
_023362DC: .4byte 0x0235AA5C
_023362E0: .4byte 0x02352578
_023362E4: .4byte 0x02352568
_023362E8: .4byte 0x02352558
_023362EC: .4byte 0x02352540
	arm_func_end ov02_023360EC

	arm_func_start ov02_023362F0
ov02_023362F0: @ 0x023362F0
	push {r4, lr}
	ldr r1, _02336340 @ =0x0235AA5C
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x100
	ldrsb r1, [r1, #0x1f]
	cmp r4, r1
	popeq {r4, pc}
	mov r1, #1
	bl ov02_02336874
	ldr r0, _02336340 @ =0x0235AA5C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsb r0, [r0, #0x1f]
	bl ov02_02336874
	ldr r0, _02336340 @ =0x0235AA5C
	ldr r0, [r0]
	strb r4, [r0, #0x11f]
	pop {r4, pc}
	.align 2, 0
_02336340: .4byte 0x0235AA5C
	arm_func_end ov02_023362F0

	arm_func_start ov02_02336344
ov02_02336344: @ 0x02336344
	push {r4, lr}
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02336360
	mov r0, #0
	bl ov02_02336A18
_02336360:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02336378
	mov r0, #1
	bl ov02_02336A18
_02336378:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02336390
	mov r0, #2
	bl ov02_02336A18
_02336390:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _023363A8
	mov r0, #3
	bl ov02_02336A18
_023363A8:
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _023364C0
	ldr r2, _02336564 @ =0x0235AA5C
	ldr r0, [r2]
	add r1, r0, #0x100
	ldrsb r4, [r1, #0x21]
	cmp r4, #0x2f
	bge _02336418
	ldrb r1, [r0, #0x124]
	cmp r1, #0
	bne _023363E8
	mov r0, #9
	bl ov02_023480E0
	pop {r4, pc}
_023363E8:
	ldrb r3, [r0, #0x11d]
	ldr r1, _02336568 @ =0x02353318
	ldr r1, [r1, r3, lsl #2]
	ldrb r1, [r1, r4]
	strb r1, [r0, #0x11c]
	ldr r0, [r2]
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	popne {r4, pc}
	mov r0, #0
	bl ov02_023367F0
	pop {r4, pc}
_02336418:
	sub r1, r4, #0x2f
	cmp r1, #4
	bge _023364B0
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _02336480
_02336430: @ jump table
	b _02336440 @ case 0
	b _02336448 @ case 1
	b _02336450 @ case 2
	b _02336468 @ case 3
_02336440:
	bl ov02_0233608C
	pop {r4, pc}
_02336448:
	bl ov02_023360BC
	pop {r4, pc}
_02336450:
	ldrb r1, [r0, #0x124]
	cmp r1, #0
	bne _02336480
	mov r0, #9
	bl ov02_023480E0
	pop {r4, pc}
_02336468:
	ldrb r1, [r0, #0x123]
	cmp r1, #0
	bne _02336480
	mov r0, #9
	bl ov02_023480E0
	pop {r4, pc}
_02336480:
	ldrb r0, [r0, #0x11d]
	cmp r0, #1
	bne _02336494
	mov r0, #0
	bl ov02_023367F0
_02336494:
	ldr r1, _0233656C @ =0x02352580
	sub r2, r4, #0x2f
	ldr r0, _02336564 @ =0x0235AA5C
	ldrb r1, [r1, r2]
	ldr r0, [r0]
	strb r1, [r0, #0x11c]
	pop {r4, pc}
_023364B0:
	ldr r1, _02336570 @ =0x02352534
	sub r2, r4, #0x33
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x11c]
_023364C0:
	mov r0, #2
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02336518
	ldr r0, _02336564 @ =0x0235AA5C
	ldr r1, [r0]
	ldrb r0, [r1, #0x123]
	cmp r0, #0
	bne _0233650C
	ldrb r0, [r1, #0x125]
	cmp r0, #0
	popne {r4, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02336564 @ =0x0235AA5C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x125]
	pop {r4, pc}
_0233650C:
	mov r0, #0x80
	strb r0, [r1, #0x11c]
	b _02336538
_02336518:
	mov r0, #2
	bl ov02_0234EC3C
	cmp r0, #0
	beq _02336538
	ldr r0, _02336564 @ =0x0235AA5C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x125]
_02336538:
	mov r0, #0x400
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233654C
	bl ov02_0233608C
_0233654C:
	mov r0, #0x800
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r4, pc}
	bl ov02_023360BC
	pop {r4, pc}
	.align 2, 0
_02336564: .4byte 0x0235AA5C
_02336568: .4byte 0x02353318
_0233656C: .4byte 0x02352580
_02336570: .4byte 0x02352534
	arm_func_end ov02_02336344

	arm_func_start ov02_02336574
ov02_02336574: @ 0x02336574
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _023367D4 @ =0x0235253C
	mov sl, r1
	ldrb r5, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r1, #0xc
	mul r1, sl, r1
	strb r5, [sp, #0x12]
	strb r4, [sp, #0x13]
	ldrb r4, [r3, #0x14]
	ldrb r5, [r3, #0x13]
	str r1, [sp, #4]
	strb r4, [sp, #0x15]
	strb r5, [sp, #0x14]
	ldrb r1, [r3, #0x15]
	mov sb, r2
	add r4, sp, #0x12
	strb r1, [sp, #0x16]
	ldrb r1, [r4, sl]
	ldrb r6, [r3, #0x16]
	ldrb r2, [r3, #0x17]
	cmp r1, #0
	ldr r5, [sp, #4]
	strb r6, [sp, #0xd]
	strb r2, [sp, #0xe]
	ldrb r7, [r3, #0x18]
	ldrb r2, [r3, #0x19]
	mov r6, #0
	strb r7, [sp, #0xf]
	strb r2, [sp, #0x10]
	ldrb r1, [r3, #0x1a]
	strb r1, [sp, #0x11]
	ldrb r2, [r3, #0xc]
	ldrb r1, [r3, #0xd]
	strb r2, [sp, #8]
	strb r1, [sp, #9]
	ldrb r2, [r3, #0xe]
	ldrb r1, [r3, #0xf]
	strb r2, [sp, #0xa]
	strb r1, [sp, #0xb]
	ldrb r1, [r3, #0x10]
	strb r1, [sp, #0xc]
	ble _02336690
	ldr r1, _023367D8 @ =0x02352588
	ldr fp, _023367DC @ =0x0235AA5C
	ldr lr, _023367E0 @ =0xC1FFFCFF
	ldr r8, _023367E4 @ =0xFE00FF00
	and r7, sb, #0xff
_02336638:
	ldr r2, [fp]
	lsl r3, r5, #2
	add r2, r2, r5, lsl #2
	ldr r2, [r2, #0x30]
	ldrh r3, [r1, r3]
	ldr ip, [r2]
	add r6, r6, #1
	and ip, ip, lr
	str ip, [r2]
	lsl r2, r3, #0x17
	ldr r3, [fp]
	add r3, r3, r5, lsl #2
	ldr r3, [r3, #0x30]
	add r5, r5, #1
	ldr ip, [r3]
	and ip, ip, r8
	orr ip, ip, r7
	orr r2, ip, r2, lsr #7
	str r2, [r3]
	ldrb r2, [r4, sl]
	cmp r6, r2
	blt _02336638
_02336690:
	cmp sl, #4
	bge _023366D0
	ldr r1, _023367DC @ =0x0235AA5C
	ldr r3, _023367D8 @ =0x02352588
	ldr r4, [r1]
	ldr r1, [sp, #4]
	mov r2, #2
	lsl r1, r1, #2
	str r2, [sp]
	add r0, r4, r0, lsl #4
	add r2, r4, sl, lsl #2
	ldrh r1, [r3, r1]
	ldr r3, [r2, #0x104]
	ldr r0, [r0, sl, lsl #2]
	mov r2, sb
	bl ov02_0234E2BC
_023366D0:
	add r0, sl, #3
	mov r1, #4
	bl FUN_02075C38
	add r3, sp, #0xd
	ldrb r1, [r3, sl]
	mov r5, #0
	cmp r1, #0
	ble _02336758
	ldr r2, _023367E8 @ =0x02352560
	lsl r1, r0, #2
	ldrh r0, [r2, r1]
	ldr r8, _023367DC @ =0x0235AA5C
	ldr r6, _023367E0 @ =0xC1FFFCFF
	ldr r7, _023367E4 @ =0xFE00FF00
	and r4, sb, #0xff
	lsl r2, r0, #0x17
_02336710:
	ldr r0, [r8]
	add r5, r5, #1
	add r0, r1, r0
	ldr fp, [r0, #0xec]
	ldr r0, [fp]
	and r0, r0, r6
	str r0, [fp]
	ldr r0, [r8]
	add r0, r1, r0
	ldr r0, [r0, #0xec]
	ldr fp, [r0]
	and fp, fp, r7
	orr fp, fp, r4
	orr fp, fp, r2, lsr #7
	str fp, [r0]
	ldrb r0, [r3, sl]
	cmp r5, r0
	blt _02336710
_02336758:
	add r7, sp, #8
	ldrb r0, [r7, sl]
	mov r8, #0
	cmp r0, #0
	addle sp, sp, #0x18
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _023367EC @ =0x02352558
	ldr r4, _023367DC @ =0x0235AA5C
	mvn r6, #0
	mov fp, r8
_02336780:
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0xfc]
	mov r2, fp
	mov r3, fp
	bl ov02_0234D31C
	ldr r0, [r4]
	lsl r1, r8, #2
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0xfc]
	ldrh r2, [r5, r1]
	mov r1, r6
	mov r3, sb
	bl ov02_0234D440
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _02336780
	add sp, sp, #0x18
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023367D4: .4byte 0x0235253C
_023367D8: .4byte 0x02352588
_023367DC: .4byte 0x0235AA5C
_023367E0: .4byte 0xC1FFFCFF
_023367E4: .4byte 0xFE00FF00
_023367E8: .4byte 0x02352560
_023367EC: .4byte 0x02352558
	arm_func_end ov02_02336574

	arm_func_start ov02_023367F0
ov02_023367F0: @ 0x023367F0
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0233686C @ =0x0235AA5C
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	ldr sb, _02336870 @ =0x02352588
	mov r6, r5
	mov r4, r5
	mov r7, r5
	strb r8, [r1, #0x11d]
_02336818:
	add r0, sb, r7, lsl #2
	ldrh r2, [r0, #2]
	mov r0, r8
	mov r1, r4
	bl ov02_02336574
	add r4, r4, #1
	cmp r4, #4
	add r7, r7, #0xc
	blt _02336818
	cmp r8, #2
	moveq r5, #1
	beq _02336850
	cmp r8, #1
	moveq r6, #1
_02336850:
	mov r1, r5
	mov r0, #0x2f
	bl ov02_02336874
	mov r1, r6
	mov r0, #0x30
	bl ov02_02336874
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233686C: .4byte 0x0235AA5C
_02336870: .4byte 0x02352588
	arm_func_end ov02_023367F0

	arm_func_start ov02_02336874
ov02_02336874: @ 0x02336874
	push {r3, lr}
	cmp r0, #0
	poplt {r3, pc}
	cmp r0, #0x2f
	bge _023368C0
	ldr r2, _02336930 @ =0x0235AA5C
	ldr r3, _02336934 @ =0x02352528
	ldr r2, [r2]
	ldrb r1, [r3, r1]
	add r0, r2, r0, lsl #2
	ldr r2, [r0, #0x30]
	ldr r0, [r2]
	bic r0, r0, #0xc00
	str r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r2, #4]
	pop {r3, pc}
_023368C0:
	sub ip, r0, #0x2f
	cmp ip, #4
	bge _02336904
	ldr r0, _02336930 @ =0x0235AA5C
	ldr r2, _02336934 @ =0x02352528
	ldr r3, [r0]
	ldrb r0, [r2, r1]
	add r1, r3, ip, lsl #2
	ldr r2, [r1, #0xec]
	ldr r1, [r2]
	bic r1, r1, #0xc00
	str r1, [r2]
	ldrh r1, [r2, #4]
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsl #12
	strh r0, [r2, #4]
	pop {r3, pc}
_02336904:
	ldr r2, _02336930 @ =0x0235AA5C
	ldr r3, _02336938 @ =0x0235252C
	ldr r2, [r2]
	sub r0, r0, #0x33
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0xfc]
	mvn r1, #0
	mov r2, #0
	bl ov02_0234D3C0
	pop {r3, pc}
	.align 2, 0
_02336930: .4byte 0x0235AA5C
_02336934: .4byte 0x02352528
_02336938: .4byte 0x0235252C
	arm_func_end ov02_02336874

	arm_func_start ov02_0233693C
ov02_0233693C: @ 0x0233693C
	push {r4, lr}
	ldr r0, _02336A0C @ =0x0235AA5C
	ldr r1, [r0]
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x21]
	sub r0, r0, #0x2f
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _023369A0
_02336960: @ jump table
	b _02336978 @ case 0
	b _02336980 @ case 1
	b _02336988 @ case 2
	b _02336990 @ case 3
	b _02336998 @ case 4
	b _02336998 @ case 5
_02336978:
	mov r4, #0x42
	b _023369A4
_02336980:
	mov r4, #0x41
	b _023369A4
_02336988:
	mov r4, #0x43
	b _023369A4
_02336990:
	mov r4, #0x41
	b _023369A4
_02336998:
	mov r4, #0x45
	b _023369A4
_023369A0:
	mov r4, #0x40
_023369A4:
	ldr r0, [r1, #0x114]
	mov r1, #0
	bl ov02_0234D308
	mov r2, r0
	mov r1, r4
	mov r0, #0
	bl ov02_0234D618
	ldr r0, _02336A0C @ =0x0235AA5C
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x114]
	bl ov02_0234D530
	ldr r0, _02336A0C @ =0x0235AA5C
	ldr r2, _02336A10 @ =0x02352644
	ldr r3, [r0]
	mvn r1, #0
	add r0, r3, #0x100
	ldrsb ip, [r0, #0x21]
	ldr r0, [r3, #0x114]
	ldr r3, _02336A14 @ =0x02352646
	lsl ip, ip, #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov02_0234D440
	pop {r4, pc}
	.align 2, 0
_02336A0C: .4byte 0x0235AA5C
_02336A10: .4byte 0x02352644
_02336A14: .4byte 0x02352646
	arm_func_end ov02_0233693C

	arm_func_start ov02_02336A18
ov02_02336A18: @ 0x02336A18
	push {r3, lr}
	ldr r2, _02336E48 @ =0x0235AA5C
	ldr r3, _02336E4C @ =0x02352718
	ldr ip, [r2]
	add r1, ip, #0x100
	ldrsb lr, [r1, #0x21]
	add r1, r3, lr, lsl #2
	ldrsb r1, [r0, r1]
	strb r1, [ip, #0x121]
	ldr r1, [r2]
	add r2, r1, #0x100
	ldrsb r3, [r2, #0x21]
	cmp r3, #0x2e
	cmpeq r0, #3
	strbeq lr, [r1, #0x120]
	beq _02336E38
	cmp r3, #0x33
	bne _02336A70
	cmp r0, #1
	cmpne r0, #3
	strbeq lr, [r1, #0x120]
	beq _02336E38
_02336A70:
	cmp r3, #0x34
	bne _02336A90
	cmp r0, #1
	cmpne r0, #3
	bne _02336A90
	cmp lr, #0x2e
	strbne lr, [r1, #0x120]
	b _02336E38
_02336A90:
	mvn r2, #0
	cmp r3, r2
	bne _02336AC0
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	cmpne r0, #0x32
	moveq r0, #0x23
	strbeq r0, [r1, #0x121]
	movne r0, #0x22
	strbne r0, [r1, #0x121]
	b _02336E38
_02336AC0:
	sub r0, r2, #1
	cmp r3, r0
	bne _02336B80
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x26
	bgt _02336B18
	bge _02336B50
	cmp r0, #5
	bgt _02336B0C
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02336B74
_02336AF4: @ jump table
	b _02336B38 @ case 0
	b _02336B44 @ case 1
	b _02336B74 @ case 2
	b _02336B50 @ case 3
	b _02336B5C @ case 4
	b _02336B68 @ case 5
_02336B0C:
	cmp r0, #0x24
	beq _02336B44
	b _02336B74
_02336B18:
	cmp r0, #0x28
	bgt _02336B30
	bge _02336B68
	cmp r0, #0x27
	beq _02336B5C
	b _02336B74
_02336B30:
	cmp r0, #0x31
	bne _02336B74
_02336B38:
	mov r0, #0x31
	strb r0, [r1, #0x121]
	b _02336E38
_02336B44:
	mov r0, #0x24
	strb r0, [r1, #0x121]
	b _02336E38
_02336B50:
	mov r0, #0x26
	strb r0, [r1, #0x121]
	b _02336E38
_02336B5C:
	mov r0, #0x27
	strb r0, [r1, #0x121]
	b _02336E38
_02336B68:
	mov r0, #0x28
	strb r0, [r1, #0x121]
	b _02336E38
_02336B74:
	mov r0, #0x25
	strb r0, [r1, #0x121]
	b _02336E38
_02336B80:
	sub r0, r2, #2
	cmp r3, r0
	bne _02336C78
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	bgt _02336BF0
	bge _02336C60
	cmp r0, #0xb
	bgt _02336BE4
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02336C6C
_02336BB4: @ jump table
	b _02336C6C @ case 0
	b _02336C6C @ case 1
	b _02336C6C @ case 2
	b _02336C6C @ case 3
	b _02336C6C @ case 4
	b _02336C6C @ case 5
	b _02336C30 @ case 6
	b _02336C3C @ case 7
	b _02336C6C @ case 8
	b _02336C48 @ case 9
	b _02336C54 @ case 10
	b _02336C60 @ case 11
_02336BE4:
	cmp r0, #0x22
	beq _02336C60
	b _02336C6C
_02336BF0:
	cmp r0, #0x2a
	bgt _02336C08
	bge _02336C3C
	cmp r0, #0x29
	beq _02336C30
	b _02336C6C
_02336C08:
	cmp r0, #0x32
	bgt _02336C6C
	cmp r0, #0x2c
	blt _02336C6C
	beq _02336C48
	cmp r0, #0x2d
	beq _02336C54
	cmp r0, #0x32
	beq _02336C60
	b _02336C6C
_02336C30:
	mov r0, #0x29
	strb r0, [r1, #0x121]
	b _02336E38
_02336C3C:
	mov r0, #0x2a
	strb r0, [r1, #0x121]
	b _02336E38
_02336C48:
	mov r0, #0x2c
	strb r0, [r1, #0x121]
	b _02336E38
_02336C54:
	mov r0, #0x2d
	strb r0, [r1, #0x121]
	b _02336E38
_02336C60:
	mov r0, #0x2e
	strb r0, [r1, #0x121]
	b _02336E38
_02336C6C:
	mov r0, #0x2b
	strb r0, [r1, #0x121]
	b _02336E38
_02336C78:
	sub r0, r2, #3
	cmp r3, r0
	bne _02336D38
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x26
	bgt _02336CD0
	bge _02336D08
	cmp r0, #5
	bgt _02336CC4
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02336D2C
_02336CAC: @ jump table
	b _02336CF0 @ case 0
	b _02336CFC @ case 1
	b _02336D2C @ case 2
	b _02336D08 @ case 3
	b _02336D14 @ case 4
	b _02336D20 @ case 5
_02336CC4:
	cmp r0, #0x24
	beq _02336CFC
	b _02336D2C
_02336CD0:
	cmp r0, #0x28
	bgt _02336CE8
	bge _02336D20
	cmp r0, #0x27
	beq _02336D14
	b _02336D2C
_02336CE8:
	cmp r0, #0x31
	bne _02336D2C
_02336CF0:
	mov r0, #0
	strb r0, [r1, #0x121]
	b _02336E38
_02336CFC:
	mov r0, #1
	strb r0, [r1, #0x121]
	b _02336E38
_02336D08:
	mov r0, #3
	strb r0, [r1, #0x121]
	b _02336E38
_02336D14:
	mov r0, #4
	strb r0, [r1, #0x121]
	b _02336E38
_02336D20:
	mov r0, #5
	strb r0, [r1, #0x121]
	b _02336E38
_02336D2C:
	mov r0, #2
	strb r0, [r1, #0x121]
	b _02336E38
_02336D38:
	sub r0, r2, #4
	cmp r3, r0
	bne _02336E38
	add r0, r1, #0x100
	ldrsb r0, [r0, #0x20]
	cmp r0, #0x23
	bgt _02336DA8
	bge _02336E24
	cmp r0, #0xb
	bgt _02336D9C
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02336E30
_02336D6C: @ jump table
	b _02336E30 @ case 0
	b _02336E30 @ case 1
	b _02336E30 @ case 2
	b _02336E30 @ case 3
	b _02336E30 @ case 4
	b _02336E30 @ case 5
	b _02336DE8 @ case 6
	b _02336DF4 @ case 7
	b _02336E30 @ case 8
	b _02336E00 @ case 9
	b _02336E0C @ case 10
	b _02336E18 @ case 11
_02336D9C:
	cmp r0, #0x22
	beq _02336E18
	b _02336E30
_02336DA8:
	cmp r0, #0x2a
	bgt _02336DC0
	bge _02336DF4
	cmp r0, #0x29
	beq _02336DE8
	b _02336E30
_02336DC0:
	cmp r0, #0x32
	bgt _02336E30
	cmp r0, #0x2c
	blt _02336E30
	beq _02336E00
	cmp r0, #0x2d
	beq _02336E0C
	cmp r0, #0x32
	beq _02336E24
	b _02336E30
_02336DE8:
	mov r0, #6
	strb r0, [r1, #0x121]
	b _02336E38
_02336DF4:
	mov r0, #7
	strb r0, [r1, #0x121]
	b _02336E38
_02336E00:
	mov r0, #9
	strb r0, [r1, #0x121]
	b _02336E38
_02336E0C:
	mov r0, #0xa
	strb r0, [r1, #0x121]
	b _02336E38
_02336E18:
	mov r0, #0xb
	strb r0, [r1, #0x121]
	b _02336E38
_02336E24:
	mov r0, #0x32
	strb r0, [r1, #0x121]
	b _02336E38
_02336E30:
	mov r0, #8
	strb r0, [r1, #0x121]
_02336E38:
	bl ov02_0233693C
	mov r0, #8
	bl ov02_023480E0
	pop {r3, pc}
	.align 2, 0
_02336E48: .4byte 0x0235AA5C
_02336E4C: .4byte 0x02352718
	arm_func_end ov02_02336A18

	arm_func_start ov02_02336E50
ov02_02336E50: @ 0x02336E50
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02336EC8 @ =0x0235AA5C
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0xfc]
	bl ov02_0234D308
	ldr r3, [r0]
	ldr r1, _02336EC8 @ =0x0235AA5C
	ldr r0, _02336ECC @ =0x01FF0000
	and r2, r3, #0xff
	and r0, r3, r0
	lsr r3, r0, #0x10
	ldr r1, [r1]
	add r2, r2, #0xc
	ldrb r0, [r1, #0x11d]
	str r2, [sp]
	mov r1, #4
	str r3, [sp, #4]
	bl ov02_02336574
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02336ED0 @ =ov02_02336ED4
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02336EC8: .4byte 0x0235AA5C
_02336ECC: .4byte 0x01FF0000
_02336ED0: .4byte ov02_02336ED4
	arm_func_end ov02_02336E50

	arm_func_start ov02_02336ED4
ov02_02336ED4: @ 0x02336ED4
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02336F3C @ =0x0235AA5C
	ldr r2, _02336F40 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0xc0]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #3
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov02_02336574
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02336F44 @ =ov02_02336F48
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02336F3C: .4byte 0x0235AA5C
_02336F40: .4byte 0x01FF0000
_02336F44: .4byte ov02_02336F48
	arm_func_end ov02_02336ED4

	arm_func_start ov02_02336F48
ov02_02336F48: @ 0x02336F48
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02336FB0 @ =0x0235AA5C
	ldr r2, _02336FB4 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x90]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #2
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov02_02336574
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02336FB8 @ =ov02_02336FBC
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02336FB0: .4byte 0x0235AA5C
_02336FB4: .4byte 0x01FF0000
_02336FB8: .4byte ov02_02336FBC
	arm_func_end ov02_02336F48

	arm_func_start ov02_02336FBC
ov02_02336FBC: @ 0x02336FBC
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02337024 @ =0x0235AA5C
	ldr r2, _02337028 @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x60]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #1
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov02_02336574
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _0233702C @ =ov02_02337030
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02337024: .4byte 0x0235AA5C
_02337028: .4byte 0x01FF0000
_0233702C: .4byte ov02_02337030
	arm_func_end ov02_02336FBC

	arm_func_start ov02_02337030
ov02_02337030: @ 0x02337030
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02337098 @ =0x0235AA5C
	ldr r2, _0233709C @ =0x01FF0000
	ldr r3, [r1]
	mov r4, r0
	ldr r1, [r3, #0x30]
	ldrb r0, [r3, #0x11d]
	ldr ip, [r1]
	mov r1, #0
	and r3, ip, #0xff
	and ip, ip, r2
	add r2, r3, #0xc
	lsr r3, ip, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl ov02_02336574
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _023370A0 @ =ov02_023370A4
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02337098: .4byte 0x0235AA5C
_0233709C: .4byte 0x01FF0000
_023370A0: .4byte ov02_023370A4
	arm_func_end ov02_02337030

	arm_func_start ov02_023370A4
ov02_023370A4: @ 0x023370A4
	push {r3, r4, r5, r6, r7, lr}
	mov r1, r0
	mov r0, #0
	bl ov02_0234FB40
	mov r5, #0
	ldr r7, _0233717C @ =0x0235AA5C
	mov r4, r5
_023370C0:
	mov r6, r4
_023370C4:
	ldr r0, [r7]
	add r0, r0, r5, lsl #4
	ldr r0, [r0, r6, lsl #2]
	bl ov02_0234DD9C
	cmp r5, #0
	bne _023370EC
	ldr r0, [r7]
	add r0, r0, r6, lsl #2
	ldr r0, [r0, #0x104]
	bl ov02_0234D288
_023370EC:
	add r6, r6, #1
	cmp r6, #4
	blt _023370C4
	add r5, r5, #1
	cmp r5, #3
	blt _023370C0
	ldr r4, _0233717C @ =0x0235AA5C
	mov r5, #0
_0233710C:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xfc]
	bl ov02_0234D288
	add r5, r5, #1
	cmp r5, #2
	blt _0233710C
	ldr r4, _0233717C @ =0x0235AA5C
	mov r5, #0
_02337130:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xec]
	bl ov02_0234F2C0
	add r5, r5, #1
	cmp r5, #4
	blt _02337130
	ldr r4, _0233717C @ =0x0235AA5C
	mov r5, #0
_02337154:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x30]
	bl ov02_0234F2C0
	add r5, r5, #1
	cmp r5, #0x2f
	blt _02337154
	ldr r0, _02337180 @ =0x0235AA5C
	bl ov02_0234E7D8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233717C: .4byte 0x0235AA5C
_02337180: .4byte 0x0235AA5C
	arm_func_end ov02_023370A4

	arm_func_start ov02_02337184
ov02_02337184: @ 0x02337184
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r0, _023374A4 @ =0x02352804
	mov r3, #0x1c
	ldrh r5, [r0, #0x20]
	ldrh r4, [r0, #0x22]
	mov r2, #0x14
	mov r0, #0x6c
	mov r1, #4
	strh r5, [sp, #0x1c]
	strh r4, [sp, #0x1e]
	strh r3, [sp, #0x20]
	strh r2, [sp, #0x22]
	bl ov02_0234E7B4
	ldr r8, _023374A8 @ =0x0235AA60
	mov r6, #0
	mov r1, #0x1f
	str r0, [r8]
	strb r1, [r0, #0x60]
	ldr r0, [r8]
	mov r1, #1
	strb r6, [r0, #0x63]
	ldr r0, [r8]
	ldr r7, _023374AC @ =0xC1FFFCFF
	strb r1, [r0, #0x66]
	ldr r0, [r8]
	mov r5, r6
	strb r1, [r0, #0x67]
	ldr r0, [r8]
	mov r4, #0x36
	strb r1, [r0, #0x68]
_02337200:
	mov r0, r5
	mov r1, r4
	bl ov02_0234D6AC
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x10]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x10]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x10]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #0xa
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _02337200
	mov r6, #0
	ldr r5, _023374B0 @ =0x023527F0
	ldr r8, _023374A8 @ =0x0235AA60
	ldr r7, _023374AC @ =0xC1FFFCFF
	mov r4, r6
_02337270:
	ldrb r1, [r5], #1
	mov r0, r4
	bl ov02_0234D6AC
	ldr r1, [r8]
	add r1, r1, r6, lsl #2
	str r0, [r1, #0x38]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x38]
	ldr r0, [r1]
	and r0, r0, r7
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r0, [r8]
	add r0, r0, r6, lsl #2
	ldr r1, [r0, #0x38]
	add r6, r6, #1
	ldrh r0, [r1, #4]
	cmp r6, #2
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	blt _02337270
	mov sl, #0
	ldr sb, _023374B4 @ =0x023527F4
	ldr r4, _023374A8 @ =0x0235AA60
	mov r8, sl
	mov r7, #1
	mvn r6, #0
	mov r5, #0x200
	mov fp, sl
_023372EC:
	ldrb r1, [sb], #1
	mov r0, r8
	mov r2, r7
	bl ov02_0234D6D8
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, sl, lsl #2
	str r0, [r2, #0x40]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x40]
	mov r3, fp
	bl ov02_0234D31C
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x40]
	mov r2, #3
	bl ov02_0234D530
	add sl, sl, #1
	cmp sl, #2
	blt _023372EC
	mov sl, #0
	str sl, [sp, #0x10]
	strh sl, [sp, #0x16]
_02337354:
	add r1, sp, #0x18
	mov r0, #0
	str r1, [sp]
	mov r3, r0
	mov r1, #0xc
	mov r2, #4
	str r0, [sp, #4]
	bl ov02_0234DCC0
	ldr fp, _023374A8 @ =0x0235AA60
	mov sb, #0
	ldr r1, [fp]
	ldr r8, [sp, #0x10]
	ldr r7, _023374B8 @ =0x0235283C
	str r0, [r1, sl, lsl #2]
	strh sb, [sp, #0x1c]
	mov r6, #2
	mov r5, #0x480
	add r4, sp, #0x14
_0233739C:
	lsl r0, r8, #1
	ldrh r2, [r7, r0]
	ldrh r0, [sp, #0x22]
	ldrh r1, [sp, #0x1c]
	strh r2, [sp, #0x14]
	stm sp, {r0, r6}
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [fp]
	ldrh r2, [sp, #0x1e]
	ldrh r3, [sp, #0x20]
	ldr r0, [r0, sl, lsl #2]
	bl ov02_0234E1E8
	ldrh r0, [sp, #0x1c]
	add sb, sb, #1
	cmp sb, #3
	add r0, r0, #0x20
	strh r0, [sp, #0x1c]
	add r8, r8, #1
	blt _0233739C
	mov r0, #0
	ldr r1, [sp, #0x18]
	mov r2, r0
	bl ov02_0234D12C
	ldr r1, [sp, #0x10]
	ldr r2, _023374A8 @ =0x0235AA60
	add r1, r1, #3
	str r1, [sp, #0x10]
	ldr r1, [r2]
	add r1, r1, sl, lsl #2
	add sl, sl, #1
	str r0, [r1, #0x48]
	cmp sl, #4
	blt _02337354
	mov r0, #0
	arm_func_end ov02_02337184

	arm_func_start ov02_02337428
ov02_02337428: @ 0x02337428
	mov r1, #0x44
	mov r2, #1
	bl ov02_0234D6D8
	ldr r3, _023374A8 @ =0x0235AA60
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x200
	str r0, [r4, #0x58]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0, #0x58]
	bl ov02_0234D31C
	ldr r0, _023374A8 @ =0x0235AA60
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov02_0234D530
	mov r0, #0
	ldr r1, _023374BC @ =ov02_02337560
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r2, _023374A8 @ =0x0235AA60
	mov r1, #0xc0
	ldr r2, [r2]
	str r0, [r2, #0x5c]
	mov r0, #0
	bl ov02_02337F80
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023374A4: .4byte 0x02352804
_023374A8: .4byte 0x0235AA60
_023374AC: .4byte 0xC1FFFCFF
_023374B0: .4byte 0x023527F0
_023374B4: .4byte 0x023527F4
_023374B8: .4byte 0x0235283C
_023374BC: .4byte ov02_02337560
	arm_func_end ov02_02337428

	arm_func_start ov02_023374C0
ov02_023374C0: @ 0x023374C0
	push {r3, lr}
	ldr r0, _023374EC @ =0x0235AA60
	ldr r0, [r0]
	ldr r0, [r0, #0x58]
	bl ov02_0234D288
	ldr r0, _023374EC @ =0x0235AA60
	ldr r1, _023374F0 @ =ov02_023383E0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl ov02_0234FB38
	pop {r3, pc}
	.align 2, 0
_023374EC: .4byte 0x0235AA60
_023374F0: .4byte ov02_023383E0
	arm_func_end ov02_023374C0

	arm_func_start ov02_023374F4
ov02_023374F4: @ 0x023374F4
	ldr r0, _02337504 @ =0x0235AA60
	ldr r0, [r0]
	ldrb r0, [r0, #0x60]
	bx lr
	.align 2, 0
_02337504: .4byte 0x0235AA60
	arm_func_end ov02_023374F4

	arm_func_start ov02_02337508
ov02_02337508: @ 0x02337508
	ldr r1, _02337518 @ =0x0235AA60
	ldr r1, [r1]
	strb r0, [r1, #0x66]
	bx lr
	.align 2, 0
_02337518: .4byte 0x0235AA60
	arm_func_end ov02_02337508

	arm_func_start ov02_0233751C
ov02_0233751C: @ 0x0233751C
	ldr r1, _0233752C @ =0x0235AA60
	ldr r1, [r1]
	strb r0, [r1, #0x67]
	bx lr
	.align 2, 0
_0233752C: .4byte 0x0235AA60
	arm_func_end ov02_0233751C

	arm_func_start ov02_02337530
ov02_02337530: @ 0x02337530
	ldr r1, _02337540 @ =0x0235AA60
	ldr r1, [r1]
	strb r0, [r1, #0x68]
	bx lr
	.align 2, 0
_02337540: .4byte 0x0235AA60
	arm_func_end ov02_02337530

	arm_func_start ov02_02337544
ov02_02337544: @ 0x02337544
	ldr r0, _0233755C @ =0x0235AA60
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0233755C: .4byte 0x0235AA60
	arm_func_end ov02_02337544

	arm_func_start ov02_02337560
ov02_02337560: @ 0x02337560
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _023375D8 @ =0x0235AA60
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _023375DC @ =0x01FF0000
	ldr r0, [r2, #0x10]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x4c
	mov r0, #0
	ble _023375B0
	bl ov02_02337F80
	add sp, sp, #8
	pop {r4, pc}
_023375B0:
	mov r1, #0x4c
	bl ov02_02337F80
	mov r0, #1
	mov r1, #0xc0
	bl ov02_02337F80
	ldr r1, _023375E0 @ =ov02_023375E4
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_023375D8: .4byte 0x0235AA60
_023375DC: .4byte 0x01FF0000
_023375E0: .4byte ov02_023375E4
	arm_func_end ov02_02337560

	arm_func_start ov02_023375E4
ov02_023375E4: @ 0x023375E4
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _0233765C @ =0x0235AA60
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _02337660 @ =0x01FF0000
	ldr r0, [r2, #0x1c]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x63
	mov r0, #1
	ble _02337634
	bl ov02_02337F80
	add sp, sp, #8
	pop {r4, pc}
_02337634:
	mov r1, #0x63
	bl ov02_02337F80
	mov r0, #2
	mov r1, #0xc0
	bl ov02_02337F80
	ldr r1, _02337664 @ =ov02_02337668
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0233765C: .4byte 0x0235AA60
_02337660: .4byte 0x01FF0000
_02337664: .4byte ov02_02337668
	arm_func_end ov02_023375E4

	arm_func_start ov02_02337668
ov02_02337668: @ 0x02337668
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _023376E0 @ =0x0235AA60
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _023376E4 @ =0x01FF0000
	ldr r0, [r2, #0x28]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x7a
	mov r0, #2
	ble _023376B8
	bl ov02_02337F80
	add sp, sp, #8
	pop {r4, pc}
_023376B8:
	mov r1, #0x7a
	bl ov02_02337F80
	mov r0, #3
	mov r1, #0xc0
	bl ov02_02337F80
	ldr r1, _023376E8 @ =ov02_023376EC
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_023376E0: .4byte 0x0235AA60
_023376E4: .4byte 0x01FF0000
_023376E8: .4byte ov02_023376EC
	arm_func_end ov02_02337668

	arm_func_start ov02_023376EC
ov02_023376EC: @ 0x023376EC
	push {r4, lr}
	sub sp, sp, #8
	ldr r2, _02337764 @ =0x0235AA60
	mov r4, r0
	ldr r2, [r2]
	ldr r1, _02337768 @ =0x01FF0000
	ldr r0, [r2, #0x34]
	ldr r0, [r0]
	and r2, r0, r1
	and r0, r0, #0xff
	sub r1, r0, #0xc
	lsr r0, r2, #0x10
	str r0, [sp, #4]
	str r1, [sp]
	cmp r1, #0x91
	mov r0, #3
	ble _0233773C
	bl ov02_02337F80
	add sp, sp, #8
	pop {r4, pc}
_0233773C:
	mov r1, #0x91
	bl ov02_02337F80
	mov r0, #4
	mov r1, #0xc0
	bl ov02_02337F80
	ldr r1, _0233776C @ =ov02_02337770
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02337764: .4byte 0x0235AA60
_02337768: .4byte 0x01FF0000
_0233776C: .4byte ov02_02337770
	arm_func_end ov02_023376EC

	arm_func_start ov02_02337770
ov02_02337770: @ 0x02337770
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _023377DC @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0, #0x40]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	sub r1, r0, #0xc
	str r1, [sp]
	cmp r1, #0xaa
	mov r0, #4
	ble _023377BC
	bl ov02_02337F80
	add sp, sp, #8
	pop {r4, pc}
_023377BC:
	mov r1, #0xaa
	bl ov02_02337F80
	bl ov02_023382A8
	ldr r1, _023377E0 @ =0x023377E4
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_023377DC: .4byte 0x0235AA60
_023377E0: .4byte 0x023377E4
	arm_func_end ov02_02337770
_023377E4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x03, 0x00, 0x00, 0xEB, 0x79, 0x00, 0x00, 0xEB
	.byte 0xEC, 0x00, 0x00, 0xEB, 0x7A, 0x01, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_023377FC
ov02_023377FC: @ 0x023377FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _023379B8 @ =0x02352F34
	bl ov02_0234ED04
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, _023379BC @ =0x0235AA60
	mvn r1, #0
	ldr r0, [r0]
	ldr r7, _023379C0 @ =0x02352856
	ldr r6, _023379C4 @ =0x02352804
	strb r1, [r0, #0x61]
	mov r4, #0
	add r5, sp, #0
_02337838:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02337898
	ldr r0, _023379BC @ =0x0235AA60
	ldr r0, [r0]
	ldrb r0, [r0, #0x67]
	cmp r0, #0
	bne _0233787C
	mov r0, #9
	bl ov02_023480E0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0233787C:
	mov r0, #0
	bl ov02_023480E0
	ldr r0, _023379BC @ =0x0235AA60
	add sp, sp, #8
	ldr r0, [r0]
	strb r4, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_02337898:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _02337838
	ldr r7, _023379C8 @ =0x0235282C
	ldr r6, _023379CC @ =0x0235280C
	mov r4, #0
	add r5, sp, #0
_023378B8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02337940
	cmp r4, #0
	bne _023378F4
	ldr r0, _023379BC @ =0x0235AA60
	ldr r0, [r0]
	ldrb r0, [r0, #0x66]
	cmp r0, #0
	beq _02337910
_023378F4:
	cmp r4, #1
	bne _02337920
	ldr r0, _023379BC @ =0x0235AA60
	ldr r0, [r0]
	ldrb r0, [r0, #0x68]
	cmp r0, #0
	bne _02337920
_02337910:
	mov r0, #9
	arm_func_end ov02_023377FC

	arm_func_start ov02_02337914
ov02_02337914: @ 0x02337914
	bl ov02_023480E0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02337920:
	mov r0, #0
	bl ov02_023480E0
	ldr r0, _023379BC @ =0x0235AA60
	add r1, r4, #0xa
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_02337940:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _023378B8
	ldr r6, _023379D0 @ =0x02352834
	ldr r5, _023379D4 @ =0x02352810
	mov r7, #0
	add r4, sp, #0
_02337960:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234ED04
	cmp r0, #0
	beq _023379A0
	mov r0, #0
	bl ov02_023480E0
	ldr r0, _023379BC @ =0x0235AA60
	add r1, r7, #0xc
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_023379A0:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _02337960
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_023379B8: .4byte 0x02352F34
_023379BC: .4byte 0x0235AA60
_023379C0: .4byte 0x02352856
_023379C4: .4byte 0x02352804
_023379C8: .4byte 0x0235282C
_023379CC: .4byte 0x0235280C
_023379D0: .4byte 0x02352834
_023379D4: .4byte 0x02352810
	arm_func_end ov02_02337914

	arm_func_start ov02_023379D8
ov02_023379D8: @ 0x023379D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02337B7C @ =0x0235AA60
	ldr r0, _02337B80 @ =0x02352F34
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x60]
	bl ov02_0234EE14
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r7, _02337B84 @ =0x02352856
	ldr r6, _02337B88 @ =0x02352804
	mov r4, #0
	add r5, sp, #0
_02337A14:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02337A6C
	ldr r0, _02337B7C @ =0x0235AA60
	ldr r2, [r0]
	ldrsb r1, [r2, #0x61]
	cmp r1, r4
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _02337B8C @ =0x023528F0
	ldrb r1, [r1, r4]
	strb r1, [r2, #0x60]
	ldr r0, [r0]
	strb r4, [r0, #0x63]
	bl ov02_023382A8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02337A6C:
	add r4, r4, #1
	cmp r4, #0xa
	add r7, r7, #4
	blt _02337A14
	ldr r7, _02337B90 @ =0x0235282C
	ldr r6, _02337B94 @ =0x0235280C
	mov r4, #0
	add r5, sp, #0
_02337A8C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02337AE8
	ldr r0, _02337B7C @ =0x0235AA60
	add r2, r4, #0xa
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _02337B98 @ =0x02352800
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov02_023382A8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02337AE8:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _02337A8C
	ldr r7, _02337B9C @ =0x02352834
	ldr r6, _02337BA0 @ =0x02352810
	mov r4, #0
	add r5, sp, #0
_02337B08:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234EE14
	cmp r0, #0
	beq _02337B64
	ldr r0, _02337B7C @ =0x0235AA60
	add r2, r4, #0xc
	ldr r3, [r0]
	ldrsb r1, [r3, #0x61]
	cmp r1, r2
	arm_func_end ov02_023379D8

	arm_func_start ov02_02337B3C
ov02_02337B3C: @ 0x02337B3C
	addne sp, sp, #8
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _02337BA4 @ =0x023527FC
	ldrb r1, [r1, r4]
	strb r1, [r3, #0x60]
	ldr r0, [r0]
	strb r2, [r0, #0x63]
	bl ov02_023382A8
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02337B64:
	add r4, r4, #1
	cmp r4, #2
	add r7, r7, #4
	blt _02337B08
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02337B7C: .4byte 0x0235AA60
_02337B80: .4byte 0x02352F34
_02337B84: .4byte 0x02352856
_02337B88: .4byte 0x02352804
_02337B8C: .4byte 0x023528F0
_02337B90: .4byte 0x0235282C
_02337B94: .4byte 0x0235280C
_02337B98: .4byte 0x02352800
_02337B9C: .4byte 0x02352834
_02337BA0: .4byte 0x02352810
_02337BA4: .4byte 0x023527FC
	arm_func_end ov02_02337B3C

	arm_func_start ov02_02337BA8
ov02_02337BA8: @ 0x02337BA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _02337D78 @ =0x02352F34
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02337D58
	ldr r7, _02337D7C @ =0x02352856
	ldr r5, _02337D80 @ =0x02352804
	mov r6, #0
	add r4, sp, #0
_02337BD0:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02337C10
	ldr r0, _02337D84 @ =0x0235AA60
	ldr r0, [r0]
	ldrsb r0, [r0, #0x61]
	cmp r0, r6
	bne _02337D58
	mov r0, r6
	bl ov02_02337D98
	b _02337D60
_02337C10:
	add r6, r6, #1
	cmp r6, #0xa
	add r7, r7, #4
	blt _02337BD0
	ldr r6, _02337D88 @ =0x0235282C
	ldr r5, _02337D8C @ =0x0235280C
	mov r7, #0
	add r4, sp, #0
_02337C30:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02337CE8
	ldr r1, _02337D84 @ =0x0235AA60
	arm_func_end ov02_02337BA8

	arm_func_start ov02_02337C54
ov02_02337C54: @ 0x02337C54
	add r0, r7, #0xa
	ldr r1, [r1]
	ldrsb r1, [r1, #0x61]
	cmp r1, r0
	bne _02337D58
	bl ov02_02337D98
	cmp r7, #0
	bne _02337D60
	ldr r0, _02337D84 @ =0x0235AA60
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	add r1, r1, #1
	strb r1, [r2, #0x65]
	ldr r2, [r0]
	ldrb r1, [r2, #0x65]
	cmp r1, #0x28
	addlo sp, sp, #8
	poplo {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, #0x66]
	cmp r1, #0
	bne _02337CC8
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02337D84 @ =0x0235AA60
	mvn r1, #0
	ldr r0, [r0]
	add sp, sp, #8
	strb r1, [r0, #0x61]
	pop {r3, r4, r5, r6, r7, pc}
_02337CC8:
	mov r1, #0x10
	strb r1, [r2, #0x60]
	ldr r1, [r0]
	add sp, sp, #8
	ldrb r0, [r1, #0x65]
	sub r0, r0, #7
	strb r0, [r1, #0x65]
	pop {r3, r4, r5, r6, r7, pc}
_02337CE8:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _02337C30
	ldr r6, _02337D90 @ =0x02352834
	ldr r5, _02337D94 @ =0x02352810
	mov r7, #0
	add r4, sp, #0
_02337D08:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234E39C
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02337D48
	ldr r1, _02337D84 @ =0x0235AA60
	add r0, r7, #0xc
	ldr r1, [r1]
	ldrsb r1, [r1, #0x61]
	cmp r1, r0
	bne _02337D58
	bl ov02_02337D98
	b _02337D60
_02337D48:
	add r7, r7, #1
	cmp r7, #2
	add r6, r6, #4
	blt _02337D08
_02337D58:
	mvn r0, #0
	bl ov02_02337D98
_02337D60:
	ldr r0, _02337D84 @ =0x0235AA60
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x65]
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02337D78: .4byte 0x02352F34
_02337D7C: .4byte 0x02352856
_02337D80: .4byte 0x02352804
_02337D84: .4byte 0x0235AA60
_02337D88: .4byte 0x0235282C
_02337D8C: .4byte 0x0235280C
_02337D90: .4byte 0x02352834
_02337D94: .4byte 0x02352810
	arm_func_end ov02_02337C54

	arm_func_start ov02_02337D98
ov02_02337D98: @ 0x02337D98
	push {r4, lr}
	ldr r1, _02337DE0 @ =0x0235AA60
	mov r4, r0
	ldr r1, [r1]
	ldrsb r1, [r1, #0x62]
	cmp r4, r1
	popeq {r4, pc}
	mov r1, #1
	bl ov02_023381E0
	ldr r0, _02337DE0 @ =0x0235AA60
	mov r1, #0
	ldr r0, [r0]
	ldrsb r0, [r0, #0x62]
	bl ov02_023381E0
	ldr r0, _02337DE0 @ =0x0235AA60
	ldr r0, [r0]
	strb r4, [r0, #0x62]
	pop {r4, pc}
	.align 2, 0
_02337DE0: .4byte 0x0235AA60
	arm_func_end ov02_02337D98

	arm_func_start ov02_02337DE4
ov02_02337DE4: @ 0x02337DE4
	push {r3, lr}
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02337E00
	mov r0, #0
	bl ov02_02338334
_02337E00:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	arm_func_end ov02_02337DE4

	arm_func_start ov02_02337E0C
ov02_02337E0C: @ 0x02337E0C
	beq _02337E18
	mov r0, #1
	bl ov02_02338334
_02337E18:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02337E30
	mov r0, #2
	bl ov02_02338334
_02337E30:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02337E48
	mov r0, #3
	bl ov02_02338334
_02337E48:
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02337EF4
	ldr r0, _02337F70 @ =0x0235AA60
	ldr r0, [r0]
	ldrsb r2, [r0, #0x63]
	cmp r2, #0xa
	bge _02337E94
	ldrb r1, [r0, #0x67]
	cmp r1, #0
	beq _02337E88
	ldr r1, _02337F74 @ =0x023528F0
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	pop {r3, pc}
_02337E88:
	mov r0, #9
	bl ov02_023480E0
	pop {r3, pc}
_02337E94:
	sub r1, r2, #0xa
	cmp r1, #2
	bge _02337EE4
	cmp r1, #0
	ldrbeq r1, [r0, #0x66]
	cmpeq r1, #0
	beq _02337EC4
	sub r1, r2, #0xa
	cmp r1, #1
	ldrbeq r1, [r0, #0x68]
	cmpeq r1, #0
	bne _02337ED0
_02337EC4:
	mov r0, #9
	bl ov02_023480E0
	pop {r3, pc}
_02337ED0:
	ldr r1, _02337F78 @ =0x02352800
	sub r2, r2, #0xa
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
	pop {r3, pc}
_02337EE4:
	ldr r1, _02337F7C @ =0x023527FC
	sub r2, r2, #0xc
	ldrb r1, [r1, r2]
	strb r1, [r0, #0x60]
_02337EF4:
	mov r0, #2
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02337F4C
	ldr r0, _02337F70 @ =0x0235AA60
	ldr r1, [r0]
	ldrb r0, [r1, #0x66]
	cmp r0, #0
	bne _02337F40
	ldrb r0, [r1, #0x69]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02337F70 @ =0x0235AA60
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	pop {r3, pc}
_02337F40:
	mov r0, #0x10
	strb r0, [r1, #0x60]
	pop {r3, pc}
_02337F4C:
	mov r0, #2
	bl ov02_0234EC3C
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _02337F70 @ =0x0235AA60
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x69]
	pop {r3, pc}
	.align 2, 0
_02337F70: .4byte 0x0235AA60
_02337F74: .4byte 0x023528F0
_02337F78: .4byte 0x02352800
_02337F7C: .4byte 0x023527FC
	arm_func_end ov02_02337E0C

	arm_func_start ov02_02337F80
ov02_02337F80: @ 0x02337F80
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r2, _023381C4 @ =0x02352804
	mov sl, r0
	ldrb r3, [r2, #0x15]
	ldrb r0, [r2, #0x16]
	ldrb r4, [r2, #0x17]
	strb r3, [sp, #0xe]
	strb r0, [sp, #0xf]
	ldrb r0, [r2, #0x18]
	mov sb, r1
	add r3, sp, #0xe
	strb r4, [sp, #0x10]
	strb r0, [sp, #0x11]
	ldrb r0, [r2, #0x19]
	add lr, sl, sl, lsl #1
	mov r4, lr
	strb r0, [sp, #0x12]
	ldrb r6, [r2, #0x1a]
	ldrb r1, [r2, #0x1b]
	ldrb r0, [r3, sl]
	mov r5, #0
	strb r6, [sp, #9]
	strb r1, [sp, #0xa]
	ldrb r6, [r2, #0x1c]
	ldrb r1, [r2, #0x1d]
	cmp r0, #0
	strb r6, [sp, #0xb]
	strb r1, [sp, #0xc]
	ldrb r0, [r2, #0x1e]
	strb r0, [sp, #0xd]
	ldrb r1, [r2, #0x10]
	ldrb r0, [r2, #0x11]
	strb r1, [sp, #4]
	strb r0, [sp, #5]
	ldrb r1, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	strb r1, [sp, #6]
	strb r0, [sp, #7]
	ldrb r0, [r2, #0x14]
	strb r0, [sp, #8]
	ble _02338094
	ldr r0, _023381C8 @ =0x02352856
	ldr fp, _023381CC @ =0x0235AA60
	ldr r7, _023381D0 @ =0xC1FFFCFF
	ldr r8, _023381D4 @ =0xFE00FF00
	and r6, sb, #0xff
_0233803C:
	ldr r1, [fp]
	lsl r2, r4, #2
	add r1, r1, r4, lsl #2
	ldr r1, [r1, #0x10]
	ldrh r2, [r0, r2]
	ldr ip, [r1]
	add r5, r5, #1
	and ip, ip, r7
	str ip, [r1]
	ldr ip, [fp]
	lsl r1, r2, #0x17
	add r2, ip, r4, lsl #2
	ldr r2, [r2, #0x10]
	add r4, r4, #1
	ldr ip, [r2]
	and ip, ip, r8
	orr ip, ip, r6
	orr r1, ip, r1, lsr #7
	str r1, [r2]
	ldrb r1, [r3, sl]
	cmp r5, r1
	blt _0233803C
_02338094:
	cmp sl, #4
	bge _023380CC
	ldr r0, _023381CC @ =0x0235AA60
	ldr r1, _023381C8 @ =0x02352856
	ldr r3, [r0]
	lsl r0, lr, #2
	mov r2, #2
	str r2, [sp]
	add r2, r3, sl, lsl #2
	ldrh r1, [r1, r0]
	ldr r0, [r3, sl, lsl #2]
	ldr r3, [r2, #0x48]
	mov r2, sb
	bl ov02_0234E2BC
_023380CC:
	add r3, sp, #9
	ldrb r0, [r3, sl]
	mov r5, #0
	cmp r0, #0
	ble _02338148
	ldr r0, _023381D8 @ =0x0235282C
	ldr r8, _023381CC @ =0x0235AA60
	ldr r6, _023381D0 @ =0xC1FFFCFF
	ldr r7, _023381D4 @ =0xFE00FF00
	and r4, sb, #0xff
_023380F4:
	ldr r1, [r8]
	lsl r2, r5, #2
	add r1, r1, r5, lsl #2
	ldr fp, [r1, #0x38]
	ldrh r1, [r0, r2]
	ldr r2, [fp]
	and r2, r2, r6
	str r2, [fp]
	ldr r2, [r8]
	lsl r1, r1, #0x17
	add r2, r2, r5, lsl #2
	ldr r2, [r2, #0x38]
	add r5, r5, #1
	ldr fp, [r2]
	and fp, fp, r7
	orr fp, fp, r4
	orr r1, fp, r1, lsr #7
	str r1, [r2]
	ldrb r1, [r3, sl]
	cmp r5, r1
	blt _023380F4
_02338148:
	add r7, sp, #4
	ldrb r0, [r7, sl]
	mov r8, #0
	cmp r0, #0
	addle sp, sp, #0x14
	pople {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _023381DC @ =0x02352834
	ldr r4, _023381CC @ =0x0235AA60
	mvn r6, #0
	mov fp, r8
_02338170:
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0x40]
	mov r2, fp
	mov r3, fp
	bl ov02_0234D31C
	ldr r0, [r4]
	lsl r1, r8, #2
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #0x40]
	ldrh r2, [r5, r1]
	mov r1, r6
	mov r3, sb
	bl ov02_0234D440
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _02338170
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023381C4: .4byte 0x02352804
_023381C8: .4byte 0x02352856
_023381CC: .4byte 0x0235AA60
_023381D0: .4byte 0xC1FFFCFF
_023381D4: .4byte 0xFE00FF00
_023381D8: .4byte 0x0235282C
_023381DC: .4byte 0x02352834
	arm_func_end ov02_02337F80

	arm_func_start ov02_023381E0
ov02_023381E0: @ 0x023381E0
	push {r3, lr}
	cmp r0, #0
	poplt {r3, pc}
	cmp r0, #0xa
	bge _0233822C
	ldr r2, _0233829C @ =0x0235AA60
	ldr r3, _023382A0 @ =0x023527F8
	ldr r2, [r2]
	ldrb r1, [r3, r1]
	add r0, r2, r0, lsl #2
	ldr r2, [r0, #0x10]
	ldr r0, [r2]
	bic r0, r0, #0xc00
	str r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r2, #4]
	pop {r3, pc}
_0233822C:
	sub ip, r0, #0xa
	cmp ip, #2
	bge _02338270
	ldr r0, _0233829C @ =0x0235AA60
	ldr r2, _023382A0 @ =0x023527F8
	ldr r3, [r0]
	ldrb r0, [r2, r1]
	add r1, r3, ip, lsl #2
	ldr r2, [r1, #0x38]
	ldr r1, [r2]
	bic r1, r1, #0xc00
	str r1, [r2]
	ldrh r1, [r2, #4]
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsl #12
	strh r0, [r2, #4]
	pop {r3, pc}
_02338270:
	ldr r2, _0233829C @ =0x0235AA60
	ldr r3, _023382A4 @ =0x023527EC
	ldr r2, [r2]
	sub r0, r0, #0xc
	add r0, r2, r0, lsl #2
	ldrb r3, [r3, r1]
	ldr r0, [r0, #0x40]
	mvn r1, #0
	mov r2, #0
	bl ov02_0234D3C0
	pop {r3, pc}
	.align 2, 0
_0233829C: .4byte 0x0235AA60
_023382A0: .4byte 0x023527F8
_023382A4: .4byte 0x023527EC
	arm_func_end ov02_023381E0

	arm_func_start ov02_023382A8
ov02_023382A8: @ 0x023382A8
	push {r4, lr}
	ldr r0, _02338328 @ =0x0235AA60
	ldr r1, [r0]
	ldrsb r0, [r1, #0x63]
	cmp r0, #0xb
	movle r4, #0x44
	ldr r0, [r1, #0x58]
	movgt r4, #0x45
	mov r1, #0
	bl ov02_0234D308
	mov r2, r0
	mov r1, r4
	mov r0, #0
	bl ov02_0234D618
	ldr r0, _02338328 @ =0x0235AA60
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #2
	ldr r0, [r0, #0x58]
	bl ov02_0234D530
	ldr r0, _02338328 @ =0x0235AA60
	ldr r2, _0233832C @ =0x0235287E
	ldr r0, [r0]
	ldr r3, _02338330 @ =0x02352880
	ldrsb ip, [r0, #0x63]
	ldr r0, [r0, #0x58]
	mvn r1, #0
	lsl ip, ip, #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov02_0234D440
	pop {r4, pc}
	.align 2, 0
_02338328: .4byte 0x0235AA60
_0233832C: .4byte 0x0235287E
_02338330: .4byte 0x02352880
	arm_func_end ov02_023382A8

	arm_func_start ov02_02338334
ov02_02338334: @ 0x02338334
	push {r3, lr}
	ldr r1, _023383D8 @ =0x0235AA60
	ldr r2, _023383DC @ =0x023528B6
	ldr r3, [r1]
	ldrsb ip, [r3, #0x63]
	add r2, r2, ip, lsl #2
	ldrsb r2, [r0, r2]
	strb r2, [r3, #0x63]
	ldr r2, [r1]
	ldrsb r1, [r2, #0x63]
	cmp r1, #0xd
	bne _02338374
	cmp r0, #1
	cmpne r0, #3
	strbeq ip, [r2, #0x64]
	beq _023383C8
_02338374:
	mvn r0, #0
	cmp r1, r0
	bne _023383A0
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #0xa
	strbeq r0, [r2, #0x63]
	movne r0, #0xb
	strbne r0, [r2, #0x63]
	b _023383C8
_023383A0:
	sub r0, r0, #1
	cmp r1, r0
	bne _023383C8
	ldrsb r0, [r2, #0x64]
	cmp r0, #1
	cmpne r0, #0xa
	moveq r0, #1
	strbeq r0, [r2, #0x63]
	movne r0, #2
	strbne r0, [r2, #0x63]
_023383C8:
	bl ov02_023382A8
	mov r0, #8
	bl ov02_023480E0
	pop {r3, pc}
	.align 2, 0
_023383D8: .4byte 0x0235AA60
_023383DC: .4byte 0x023528B6
	arm_func_end ov02_02338334

	arm_func_start ov02_023383E0
ov02_023383E0: @ 0x023383E0
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0233844C @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	ldr r0, [r0, #0x40]
	bl ov02_0234D308
	ldr r2, [r0]
	ldr r0, _02338450 @ =0x01FF0000
	and r1, r2, #0xff
	and r0, r2, r0
	lsr r2, r0, #0x10
	add r1, r1, #0xc
	str r1, [sp]
	mov r0, #4
	str r2, [sp, #4]
	bl ov02_02337F80
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02338454 @ =ov02_02338458
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0233844C: .4byte 0x0235AA60
_02338450: .4byte 0x01FF0000
_02338454: .4byte ov02_02338458
	arm_func_end ov02_023383E0

	arm_func_start ov02_02338458
ov02_02338458: @ 0x02338458
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _023384BC @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _023384C0 @ =0x01FF0000
	ldr r2, [r0, #0x34]
	mov r0, #3
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov02_02337F80
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _023384C4 @ =ov02_023384C8
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_023384BC: .4byte 0x0235AA60
_023384C0: .4byte 0x01FF0000
_023384C4: .4byte ov02_023384C8
	arm_func_end ov02_02338458

	arm_func_start ov02_023384C8
ov02_023384C8: @ 0x023384C8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0233852C @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _02338530 @ =0x01FF0000
	ldr r2, [r0, #0x28]
	mov r0, #2
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov02_02337F80
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02338534 @ =ov02_02338538
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0233852C: .4byte 0x0235AA60
_02338530: .4byte 0x01FF0000
_02338534: .4byte ov02_02338538
	arm_func_end ov02_023384C8

	arm_func_start ov02_02338538
ov02_02338538: @ 0x02338538
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0233859C @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _023385A0 @ =0x01FF0000
	ldr r2, [r0, #0x1c]
	mov r0, #1
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov02_02337F80
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _023385A4 @ =ov02_023385A8
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0233859C: .4byte 0x0235AA60
_023385A0: .4byte 0x01FF0000
_023385A4: .4byte ov02_023385A8
	arm_func_end ov02_02338538

	arm_func_start ov02_023385A8
ov02_023385A8: @ 0x023385A8
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0233860C @ =0x0235AA60
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _02338610 @ =0x01FF0000
	ldr r2, [r0, #0x10]
	mov r0, #0
	ldr r3, [r2]
	and r2, r3, #0xff
	and r3, r3, r1
	add r1, r2, #0xc
	lsr r2, r3, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	bl ov02_02337F80
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r1, _02338614 @ =ov02_02338618
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0233860C: .4byte 0x0235AA60
_02338610: .4byte 0x01FF0000
_02338614: .4byte ov02_02338618
	arm_func_end ov02_023385A8

	arm_func_start ov02_02338618
ov02_02338618: @ 0x02338618
	push {r3, r4, r5, lr}
	mov r1, r0
	mov r0, #0
	bl ov02_0234FB40
	ldr r4, _023386D0 @ =0x0235AA60
	mov r5, #0
_02338630:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x48]
	bl ov02_0234D288
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #2]
	bl ov02_0234DD9C
	add r5, r5, #1
	cmp r5, #4
	blt _02338630
	ldr r4, _023386D0 @ =0x0235AA60
	mov r5, #0
_02338660:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x40]
	bl ov02_0234D288
	add r5, r5, #1
	cmp r5, #2
	blt _02338660
	ldr r4, _023386D0 @ =0x0235AA60
	mov r5, #0
_02338684:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x38]
	bl ov02_0234F2C0
	add r5, r5, #1
	cmp r5, #2
	blt _02338684
	ldr r4, _023386D0 @ =0x0235AA60
	mov r5, #0
_023386A8:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234F2C0
	add r5, r5, #1
	cmp r5, #0xa
	blt _023386A8
	ldr r0, _023386D4 @ =0x0235AA60
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_023386D0: .4byte 0x0235AA60
_023386D4: .4byte 0x0235AA60
	arm_func_end ov02_02338618

	arm_func_start ov02_023386D8
ov02_023386D8: @ 0x023386D8
	stmdb sp!, {lr}
	sub sp, sp, #0x104
	mov r0, #0x26c
	mov r1, #4
	bl ov02_0234E7B4
	ldr r3, _023387D8 @ =0x0235AA64
	add r1, sp, #0
	str r0, [r3, #4]
	mov r0, #0
	mov r2, #0x104
	strb r0, [r3]
	bl FUN_0207C2B8
	mov r3, #0x50
	mov r2, #0xc
	ldr r0, _023387DC @ =0x023528FC
	add r1, sp, #4
	strb r3, [sp]
	strh r2, [sp, #2]
	bl FUN_0207C4C8
	ldr r0, _023387D8 @ =0x0235AA64
	mov r2, #3
	ldr r1, [r0, #4]
	add ip, sp, #0
	strh r2, [r1]
	ldr lr, [r0, #4]
	mov r2, #0x41
	add r3, lr, #2
_02338744:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _02338744
	ldr r1, _023387D8 @ =0x0235AA64
	mov r3, #1
	add r0, lr, #0x100
	strh r3, [r0, #6]
	ldr r0, [r1, #4]
	sub r2, r3, #2
	add r0, r0, #0x100
	strh r2, [r0, #8]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r3, [r0, #0xa]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r2, [r0, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r2, [r0, #0xe]
	ldr r0, [r1, #4]
	add r0, r0, #0x110
	bl FUN_0207B9EC
	ldr r0, _023387E0 @ =0x02338898
	ldr r1, _023387E4 @ =0x023388A8
	blx ov02_023300A0
	cmp r0, #0
	addeq sp, sp, #0x104
	ldmeq sp!, {pc}
	bl FUN_0207BC20
	add sp, sp, #0x104
	ldm sp!, {pc}
	.align 2, 0
_023387D8: .4byte 0x0235AA64
_023387DC: .4byte 0x023528FC
_023387E0: .4byte 0x02338898
_023387E4: .4byte 0x023388A8
	arm_func_end ov02_023386D8

	arm_func_start ov02_023387E8
ov02_023387E8: @ 0x023387E8
	push {r4, lr}
	mov r4, r0
	blx ov02_02330164
	cmp r4, #0
	beq _02338824
	ldr r0, _02338830 @ =0x0235AA64
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x116]
	cmp r1, #0
	ldrbeq r0, [r0]
	cmpeq r0, #1
	bne _02338824
	add r0, r2, #0x17
	add r0, r0, #0x100
	bl ov02_02347C0C
_02338824:
	ldr r0, _02338834 @ =0x0235AA68
	bl ov02_0234E7D8
	pop {r4, pc}
	.align 2, 0
_02338830: .4byte 0x0235AA64
_02338834: .4byte 0x0235AA68
	arm_func_end ov02_023387E8

	arm_func_start ov02_02338838
ov02_02338838: @ 0x02338838
	push {r3, lr}
	ldr r0, _02338894 @ =0x0235AA64
	ldr r0, [r0, #4]
	blx ov02_0232DD8C
	cmp r0, #0
	bne _02338860
	ldr r1, _02338894 @ =0x0235AA64
	mov r0, #1
	strb r0, [r1]
	pop {r3, pc}
_02338860:
	ldr r0, _02338894 @ =0x0235AA64
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x116]
	cmp r0, #1
	beq _02338884
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #2
	bhi _0233888C
_02338884:
	mov r0, #0
	pop {r3, pc}
_0233888C:
	mov r0, #2
	pop {r3, pc}
	.align 2, 0
_02338894: .4byte 0x0235AA64
	arm_func_end ov02_02338838
_02338898:
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x20, 0x10, 0xA0, 0xE3
	.byte 0x1C, 0xFF, 0x2F, 0xE1, 0xB4, 0xE7, 0x34, 0x02, 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x1C, 0xE8, 0x34, 0x02

	arm_func_start ov02_023388B4
ov02_023388B4: @ 0x023388B4
	push {r4, r5, r6, lr}
	ldr r3, _02338950 @ =0x0235AA6C
	str r0, [r3, #4]
	mov r0, r1
	mov r1, r2
	bl ov02_0233895C
	cmp r0, #0
	mvneq r0, #0
	popeq {r4, r5, r6, pc}
	bl FUN_022DBC94
	mov r6, r0
	ldr r0, _02338954 @ =0x023534FC
	bl FUN_022DBC84
	ldr r0, _02338950 @ =0x0235AA6C
	mov r1, #0
	strb r1, [r0, #1]
	bl ov02_023389D8
	bl ov02_02338AA0
	bl ov02_02348024
	ldr r0, _02338958 @ =ov02_0233963C
	bl ov02_02338D68
	ldr r4, _02338950 @ =0x0235AA6C
	mov r5, #0
_02338910:
	bl ov02_0234E90C
	ldr r0, [r4, #0xc]
	blx r0
	mov r0, r5
	bl ov02_0234F9E8
	bl ov02_0234EF6C
	bl ov02_0234F850
	bl FUN_0207B860
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02338910
	bl ov02_02338D18
	mov r0, r6
	bl FUN_022DBC84
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02338950: .4byte 0x0235AA6C
_02338954: .4byte 0x023534FC
_02338958: .4byte ov02_0233963C
	arm_func_end ov02_023388B4

	arm_func_start ov02_0233895C
ov02_0233895C: @ 0x0233895C
	ldr r2, _023389D4 @ =0x0235AA6C
	cmp r0, #0
	strb r0, [r2]
	str r1, [r2, #8]
	blt _02338978
	cmp r0, #6
	ble _02338980
_02338978:
	mov r0, #0
	bx lr
_02338980:
	lsl r2, r1, #0x1c
	lsr r2, r2, #0x1c
	cmp r2, #1
	movhi r0, #0
	bxhi lr
	lsr r1, r1, #4
	tst r1, #2
	movne r0, #0
	bxne lr
	cmp r0, #0
	beq _023389B8
	tst r1, #1
	movne r0, #0
	bxne lr
_023389B8:
	cmp r0, #0
	bne _023389CC
	tst r1, #1
	moveq r0, #0
	bxeq lr
_023389CC:
	mov r0, #1
	bx lr
	.align 2, 0
_023389D4: .4byte 0x0235AA6C
	arm_func_end ov02_0233895C

	arm_func_start ov02_023389D8
ov02_023389D8: @ 0x023389D8
	push {r3, lr}
	ldr r2, _02338A94 @ =0x04000208
	mov r0, #0
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_0207621C
	ldr r1, _02338A98 @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl FUN_0207ADCC
	cmp r0, #0
	bne _02338A10
	bl FUN_0207BC20
_02338A10:
	bl FUN_0207B030
	cmp r0, #0
	bne _02338A20
	bl FUN_0207BC20
_02338A20:
	mov r0, #0
	bl FUN_020761E8
	bl FUN_02076070
	mvn r0, #0
	bl FUN_0207F3BC
	bl FUN_020811EC
	bl FUN_0208266C
	bl FUN_0207621C
	ldr r1, _02338A98 @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl ov02_0234F610
	ldr r0, _02338A9C @ =0x0235AA6C
	ldr r0, [r0, #4]
	bl ov02_0234E704
	bl ov02_0234EFE8
	bl ov02_0234F88C
	bl ov02_0234CB8C
	bl ov02_0234E858
	bl ov02_0234D860
	mov r0, #0x700
	mov r1, #0x20
	bl ov02_0234E7B4
	str r0, [sp]
	bl FUN_022EE018
	add r0, sp, #0
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_02338A94: .4byte 0x04000208
_02338A98: .4byte 0x04001000
_02338A9C: .4byte 0x0235AA6C
	arm_func_end ov02_023389D8

	arm_func_start ov02_02338AA0
ov02_02338AA0: @ 0x02338AA0
	push {r4, lr}
	mov r0, #0
	bl FUN_020761E8
	mov r0, #1
	bl FUN_02076464
	mov r0, #2
	bl FUN_020766F4
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl FUN_020762A0
	mov r3, #0x4000000
	ldr r1, [r3]
	add r0, r3, #0x6c
	bic r1, r1, #0x1f00
	str r1, [r3]
	ldr r2, [r3]
	mov r1, #0
	bic r2, r2, #0xe000
	str r2, [r3]
	bl FUN_02076324
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r0, _02338D04 @ =0xFFCFFFEF
	ldr r1, _02338D08 @ =0x00200010
	and r0, r2, r0
	orr r0, r0, #0x10
	add ip, r1, #0x3e00000
	orr r0, r0, #0x200000
	str r0, [r3]
	ldrh r1, [r3, #8]
	mov lr, #0
	add r0, r3, #0x50
	bic r1, r1, #0x40
	strh r1, [r3, #8]
	ldrh r4, [r3, #0xa]
	mov r1, #0x3f
	mov r2, #0x10
	bic r4, r4, #0x40
	strh r4, [r3, #0xa]
	ldrh r4, [r3, #0xc]
	bic r4, r4, #0x40
	strh r4, [r3, #0xc]
	ldrh r4, [r3, #0xe]
	bic r4, r4, #0x40
	strh r4, [r3, #0xe]
	str lr, [ip]
	str lr, [r3, #0x14]
	str lr, [r3, #0x18]
	str lr, [r3, #0x1c]
	bl FUN_02077704
	mov r0, #0x80
	bl FUN_02076EB0
	mov r0, #0x100
	bl FUN_02076F58
	mov r0, #0
	bl FUN_02076308
	ldr r1, _02338D0C @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x1f00
	str r0, [r1]
	ldr r0, [r1]
	bic r0, r0, #0xe000
	str r0, [r1]
	add r0, r1, #0x6c
	mov r1, #0
	bl FUN_02076324
	ldr r3, _02338D0C @ =0x04001000
	ldr r0, _02338D04 @ =0xFFCFFFEF
	ldr r1, [r3]
	mov ip, #0
	and r0, r1, r0
	orr r0, r0, #0x10
	str r0, [r3]
	ldrh r2, [r3, #8]
	add r0, r3, #0x50
	mov r1, #0x3f
	bic r2, r2, #0x40
	strh r2, [r3, #8]
	ldrh lr, [r3, #0xa]
	mov r2, #0x10
	bic lr, lr, #0x40
	strh lr, [r3, #0xa]
	ldrh lr, [r3, #0xc]
	bic lr, lr, #0x40
	strh lr, [r3, #0xc]
	ldrh lr, [r3, #0xe]
	bic lr, lr, #0x40
	strh lr, [r3, #0xe]
	str ip, [r3, #0x10]
	str ip, [r3, #0x14]
	str ip, [r3, #0x18]
	str ip, [r3, #0x1c]
	bl FUN_02077704
	ldr r2, _02338D10 @ =0x04000008
	ldr r3, _02338D14 @ =0x0400100A
	ldrh r0, [r2]
	add r1, r2, #0x1000
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r2]
	ldrh r0, [r2, #2]
	and r0, r0, #0x43
	orr r0, r0, #0x108
	orr r0, r0, #0xc00
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	and r0, r0, #0x43
	orr r0, r0, #0xe10
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	and r0, r0, #0x43
	orr r0, r0, #0xf10
	strh r0, [r2, #6]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
	ldrh r0, [r3]
	and r0, r0, #0x43
	orr r0, r0, #0xd00
	strh r0, [r3]
	ldrh r0, [r3, #2]
	and r0, r0, #0x43
	orr r0, r0, #0xe00
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	mov r2, #0x4000000
	add r1, r2, #0x304
	and r0, r0, #0x43
	orr r0, r0, #0xf00
	strh r0, [r3, #4]
	ldr r0, [r2]
	bic r0, r0, #0x38000000
	str r0, [r2]
	ldr r0, [r2]
	bic r0, r0, #0x7000000
	str r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #0x8000
	strh r0, [r1]
	bl ov02_0234DB70
	bl ov02_0234F190
	bl ov02_0234F324
	bl ov02_0234D004
	bl FUN_02076258
	ldr r2, _02338D0C @ =0x04001000
	mov r0, #1
	ldr r1, [r2]
	orr r1, r1, #0x10000
	str r1, [r2]
	bl FUN_020761E8
	pop {r4, pc}
	.align 2, 0
_02338D04: .4byte 0xFFCFFFEF
_02338D08: .4byte 0x00200010
_02338D0C: .4byte 0x04001000
_02338D10: .4byte 0x04000008
_02338D14: .4byte 0x0400100A
	arm_func_end ov02_02338AA0

	arm_func_start ov02_02338D18
ov02_02338D18: @ 0x02338D18
	push {r3, lr}
	bl FUN_0207621C
	ldr r1, _02338D64 @ =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl ov02_0234F87C
	bl ov02_0234E8D4
	bl ov02_0234F05C
	bl ov02_023480B4
	bl ov02_0234D0D8
	bl ov02_0234F274
	bl ov02_0234DC74
	bl ov02_0234D8A8
	bl ov02_0234CD3C
	bl ov02_0234F9A0
	bl ov02_0234E744
	bl ov02_0234F6C4
	pop {r3, pc}
	.align 2, 0
_02338D64: .4byte 0x04001000
	arm_func_end ov02_02338D18

	arm_func_start ov02_02338D68
ov02_02338D68: @ 0x02338D68
	ldr r1, _02338D74 @ =0x0235AA6C
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02338D74: .4byte 0x0235AA6C
	arm_func_end ov02_02338D68

	arm_func_start ov02_02338D78
ov02_02338D78: @ 0x02338D78
	ldr r2, _02338D88 @ =0x0235AA6C
	str r0, [r2, #0x10]
	str r1, [r2, #0x14]
	bx lr
	.align 2, 0
_02338D88: .4byte 0x0235AA6C
	arm_func_end ov02_02338D78

	arm_func_start ov02_02338D8C
ov02_02338D8C: @ 0x02338D8C
	cmp r0, #0
	ldrne r2, _02338DB0 @ =0x0235AA6C
	ldrne r2, [r2, #0x10]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _02338DB0 @ =0x0235AA6C
	ldrne r0, [r0, #0x14]
	strne r0, [r1]
	bx lr
	.align 2, 0
_02338DB0: .4byte 0x0235AA6C
	arm_func_end ov02_02338D8C

	arm_func_start ov02_02338DB4
ov02_02338DB4: @ 0x02338DB4
	ldr r2, _02338DC4 @ =0x0235AA6C
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	bx lr
	.align 2, 0
_02338DC4: .4byte 0x0235AA6C
	arm_func_end ov02_02338DB4

	arm_func_start ov02_02338DC8
ov02_02338DC8: @ 0x02338DC8
	cmp r0, #0
	ldrne r2, _02338DEC @ =0x0235AA6C
	ldrne r2, [r2, #0x18]
	strne r2, [r0]
	cmp r1, #0
	ldrne r0, _02338DEC @ =0x0235AA6C
	ldrne r0, [r0, #0x1c]
	strne r0, [r1]
	bx lr
	.align 2, 0
_02338DEC: .4byte 0x0235AA6C
	arm_func_end ov02_02338DC8

	arm_func_start ov02_02338DF0
ov02_02338DF0: @ 0x02338DF0
	ldr r0, _02338DFC @ =0x0235AA6C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_02338DFC: .4byte 0x0235AA6C
	arm_func_end ov02_02338DF0

	arm_func_start ov02_02338E00
ov02_02338E00: @ 0x02338E00
	ldr r0, _02338E14 @ =0x0235AA6C
	ldr r0, [r0, #8]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bx lr
	.align 2, 0
_02338E14: .4byte 0x0235AA6C
	arm_func_end ov02_02338E00

	arm_func_start ov02_02338E18
ov02_02338E18: @ 0x02338E18
	ldr r1, _02338E30 @ =0x0235AA6C
	ldr r1, [r1, #8]
	tst r0, r1, lsr #4
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02338E30: .4byte 0x0235AA6C
	arm_func_end ov02_02338E18

	arm_func_start ov02_02338E34
ov02_02338E34: @ 0x02338E34
	ldr r0, _02338E44 @ =0x0235AA6C
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02338E44: .4byte 0x0235AA6C
	arm_func_end ov02_02338E34

	arm_func_start ov02_02338E48
ov02_02338E48: @ 0x02338E48
	ldr r0, _02338E84 @ =0x0235AA6C
	ldrb r1, [r0]
	cmp r1, #6
	moveq r0, #0x38
	bxeq lr
	cmp r1, #1
	bne _02338E78
	ldr r0, [r0, #8]
	lsr r0, r0, #4
	tst r0, #2
	moveq r0, #0x37
	bxeq lr
_02338E78:
	add r0, r1, #0x31
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02338E84: .4byte 0x0235AA6C
	arm_func_end ov02_02338E48

	arm_func_start ov02_02338E88
ov02_02338E88: @ 0x02338E88
	push {r3, lr}
	mov r0, #0x64
	mov r1, #4
	bl ov02_0234E7B4
	mov r1, r0
	ldr r3, _02338EC0 @ =0x0235AA8C
	mov r0, #8
	mov r2, #0xc
	str r1, [r3]
	bl ov02_0234D754
	ldr r1, _02338EC0 @ =0x0235AA8C
	ldr r1, [r1]
	str r0, [r1, #0x60]
	pop {r3, pc}
	.align 2, 0
_02338EC0: .4byte 0x0235AA8C
	arm_func_end ov02_02338E88

	arm_func_start ov02_02338EC4
ov02_02338EC4: @ 0x02338EC4
	ldr ip, _02338ED0 @ =ov02_0234E7D8
	ldr r0, _02338ED4 @ =0x0235AA8C
	bx ip
	.align 2, 0
_02338ED0: .4byte ov02_0234E7D8
_02338ED4: .4byte 0x0235AA8C
	arm_func_end ov02_02338EC4

	arm_func_start ov02_02338ED8
ov02_02338ED8: @ 0x02338ED8
	push {r3, r4, r5, lr}
	ldr r1, _02338F2C @ =0x0235AA8C
	mov r5, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x60]
	bl ov02_0234D808
	mov r4, r0
	add r1, sp, #0
	mov r0, r5
	mov r2, #4
	bl ov02_0234CE84
	add r2, r0, #0x20
	str r0, [r4, #8]
	add r0, r2, #0x10
	str r0, [r4]
	ldr r1, [r2, #4]
	mov r0, r4
	add r1, r2, r1
	add r1, r1, #8
	str r1, [r4, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02338F2C: .4byte 0x0235AA8C
	arm_func_end ov02_02338ED8

	arm_func_start ov02_02338F30
ov02_02338F30: @ 0x02338F30
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	bl ov02_0234CF78
	ldr r0, _02338F58 @ =0x0235AA8C
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov02_0234D7B0
	pop {r4, pc}
	.align 2, 0
_02338F58: .4byte 0x0235AA8C
	arm_func_end ov02_02338F30

	arm_func_start ov02_02338F5C
ov02_02338F5C: @ 0x02338F5C
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	ldm r0, {r2, r3}
	ldr r0, [r2, r1, lsl #2]
	add r0, r3, r0
	bx lr
	arm_func_end ov02_02338F5C

	arm_func_start ov02_02338F74
ov02_02338F74: @ 0x02338F74
	push {r3, lr}
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	ldm r0, {ip, lr}
	ldr r0, [ip, r1, lsl #2]
	cmp r2, #0
	add r0, lr, r0
	addge r3, r3, #0x30
	lslge r1, r2, #1
	strhge r3, [r0, r1]
	pop {r3, pc}
	arm_func_end ov02_02338F74

	arm_func_start ov02_02338FA0
ov02_02338FA0: @ 0x02338FA0
	push {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr r0, _02339078 @ =0x0001E2A4
	mov r1, #0x20
	bl ov02_0234E7B4
	ldr r2, _0233907C @ =0x0235AA90
	add r1, r0, #0x1e000
	str r0, [r2]
	str r4, [r1, #0x298]
	ldr r0, [r2]
	mov r4, #0
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a0]
	ldr r0, [r2]
	ldr lr, _02339080 @ =0x02353560
	add r0, r0, #0x1e000
	strb r4, [r0, #0x2a1]
	add ip, sp, #0
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldm lr, {r0, r1, r2}
	stm ip, {r0, r1, r2}
	ldr r0, _02339084 @ =0x0235AA98
	mov r1, r4
	ldr r0, [r0]
	bl ov02_02338F5C
	ldr r1, _02339084 @ =0x0235AA98
	str r0, [sp, #4]
	ldr r0, [r1]
	mov r1, #1
	bl ov02_02338F5C
	str r0, [sp, #8]
	bl ov02_02338E48
	strb r0, [sp, #0x18]
	ldr r0, _0233907C @ =0x0235AA90
	add r1, sp, #0
	ldr r0, [r0]
	bl ov02_0234BD34
	bl ov02_0234BF80
	cmp r0, #0
	bne _0233904C
	bl FUN_0207BC20
_0233904C:
	mov r0, #0
	ldr r1, _02339088 @ =ov02_02339140
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233907C @ =0x0235AA90
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x29c]
	add sp, sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_02339078: .4byte 0x0001E2A4
_0233907C: .4byte 0x0235AA90
_02339080: .4byte 0x02353560
_02339084: .4byte 0x0235AA98
_02339088: .4byte ov02_02339140
	arm_func_end ov02_02338FA0

	arm_func_start ov02_0233908C
ov02_0233908C: @ 0x0233908C
	ldr ip, _023390A4 @ =ov02_0234FA98
	mov r0, #0
	ldr r1, _023390A8 @ =ov02_023390AC
	mov r2, r0
	mov r3, #0x78
	bx ip
	.align 2, 0
_023390A4: .4byte ov02_0234FA98
_023390A8: .4byte ov02_023390AC
	arm_func_end ov02_0233908C

	arm_func_start ov02_023390AC
ov02_023390AC: @ 0x023390AC
	push {r4, lr}
	mov r4, r0
	bl ov02_0234BE24
	cmp r0, #0
	popeq {r4, pc}
	ldr r0, _023390E4 @ =0x0235AA90
	mov r1, r4
	ldr r0, [r0]
	mov r3, #1
	add r2, r0, #0x1e000
	mov r0, #0
	strb r3, [r2, #0x2a1]
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_023390E4: .4byte 0x0235AA90
	arm_func_end ov02_023390AC

	arm_func_start ov02_023390E8
ov02_023390E8: @ 0x023390E8
	ldr r0, _02339100 @ =0x0235AA90
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02339100: .4byte 0x0235AA90
	arm_func_end ov02_023390E8

	arm_func_start ov02_02339104
ov02_02339104: @ 0x02339104
	ldr r1, _02339118 @ =0x0235AA90
	ldr r1, [r1]
	add r1, r1, #0x1e000
	str r0, [r1, #0x298]
	bx lr
	.align 2, 0
_02339118: .4byte 0x0235AA90
	arm_func_end ov02_02339104

	arm_func_start ov02_0234BFC8
ov02_0234BFC8: @ 0x0233911C
	ldr ip, _02339124 @ =ov02_0234BFC8
	bx ip
	.align 2, 0
_02339124: .4byte ov02_0234BFC8
	arm_func_end ov02_0234BFC8

	arm_func_start ov02_02339128
ov02_02339128: @ 0x02339128
	ldr r0, _0233913C @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x2280
	add r0, r0, #0x1c000
	bx lr
	.align 2, 0
_0233913C: .4byte 0x0235AA90
	arm_func_end ov02_02339128

	arm_func_start ov02_02339140
ov02_02339140: @ 0x02339140
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov02_0234BFFC
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldrb r1, [r0, #0x2a0]
	cmp r1, #0
	beq _02339194
	ldrb r1, [r0, #0x2a1]
	cmp r1, #0
	bne _02339194
	ldr r1, [r0, #0x298]
	cmp r1, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_02339194:
	add r0, sp, #1
	add r1, sp, #0
	bl ov02_0234C380
	ldrb r0, [sp, #1]
	cmp r0, #0x1a
	bgt _02339228
	bge _02339334
	cmp r0, #0x14
	bgt _02339218
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _023393D0
_023391C4: @ jump table
	b _023393D0 @ case 0
	b _023393D0 @ case 1
	b _023393D0 @ case 2
	b _023393D0 @ case 3
	b _023393D0 @ case 4
	b _0233924C @ case 5
	b _023393D0 @ case 6
	b _023393D0 @ case 7
	b _023393D0 @ case 8
	b _023393D0 @ case 9
	b _023393D0 @ case 10
	b _023393D0 @ case 11
	b _02339378 @ case 12
	b _023392AC @ case 13
	b _023393D0 @ case 14
	b _023393D0 @ case 15
	b _023393D0 @ case 16
	b _023393D0 @ case 17
	b _023393D0 @ case 18
	b _023393D0 @ case 19
	b _023392F0 @ case 20
_02339218:
	cmp r0, #0x17
	beq _023392F0
	add sp, sp, #4
	pop {r3, r4, pc}
_02339228:
	cmp r0, #0x1d
	bgt _0233923C
	beq _02339334
	add sp, sp, #4
	pop {r3, r4, pc}
_0233923C:
	cmp r0, #0x22
	beq _023393BC
	add sp, sp, #4
	pop {r3, r4, pc}
_0233924C:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r4, r0, #0x2280
	bl ov02_0234C3C4
	add r1, r4, #0x1c000
	mov r2, #0x16
	bl FUN_0207C2E0
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #0
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_023392AC:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #1
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_023392F0:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #3
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_02339334:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #4
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_02339378:
	ldrb r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	ldr r0, _023393D8 @ =0x0235AA90
	ldr r0, [r0]
	add r0, r0, #0x1e000
	ldr r1, [r0, #0x298]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0x2a0]
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r0, #2
	blx r1
	add sp, sp, #4
	pop {r3, r4, pc}
_023393BC:
	mov r1, r4
	mov r0, #0
	bl ov02_0234FB40
	ldr r0, _023393DC @ =0x0235AA90
	bl ov02_0234E7D8
_023393D0:
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_023393D8: .4byte 0x0235AA90
_023393DC: .4byte 0x0235AA90
	arm_func_end ov02_02339140

	arm_func_start ov02_023393E0
ov02_023393E0: @ 0x023393E0
	push {r3, lr}
	sub sp, sp, #8
	mov r0, #0xc
	sub r1, r0, #0x10
	bl ov02_0234E7B4
	ldr r1, _0233943C @ =0x0235AA94
	ldr ip, _02339440 @ =0x02339580
	str r0, [r1]
	ldr r2, _02339444 @ =0x02339558
	ldr r3, _02339448 @ =0x02339570
	str ip, [sp]
	mov ip, #0x800
	mov r0, #0xf
	mov r1, #0x40
	str ip, [sp, #4]
	blx ov02_023341F8
	cmp r0, #1
	beq _0233942C
	bl FUN_0207BC20
_0233942C:
	mov r0, #0xa
	bl FUN_02079B14
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0233943C: .4byte 0x0235AA94
_02339440: .4byte 0x02339580
_02339444: .4byte 0x02339558
_02339448: .4byte 0x02339570
	arm_func_end ov02_023393E0

	arm_func_start ov02_0233944C
ov02_0233944C: @ 0x0233944C
	push {r3, lr}
	blx ov02_023342E0
	cmp r0, #1
	beq _02339460
	bl FUN_0207BC20
_02339460:
	ldr r0, _0233946C @ =0x0235AA94
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_0233946C: .4byte 0x0235AA94
	arm_func_end ov02_0233944C

	arm_func_start ov02_02339470
ov02_02339470: @ 0x02339470
	push {r3, lr}
	sub sp, sp, #0xe8
	ldr r1, _02339528 @ =0x0235AA94
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _02339520
_02339490: @ jump table
	b _023394B0 @ case 0
	b _023394B0 @ case 1
	b _023394BC @ case 2
	b _023394B0 @ case 3
	b _023394C8 @ case 4
	b _023394B0 @ case 5
	b _023394D4 @ case 6
	b _0233951C @ case 7
_023394B0:
	add sp, sp, #0xe8
	mov r0, #0
	pop {r3, pc}
_023394BC:
	add sp, sp, #0xe8
	mov r0, #1
	pop {r3, pc}
_023394C8:
	add sp, sp, #0xe8
	mov r0, #2
	pop {r3, pc}
_023394D4:
	add r0, sp, #0
	blx ov02_023343AC
	cmp r0, #1
	beq _023394E8
	bl FUN_0207BC20
_023394E8:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	blt _02339510
	cmp r0, #3
	bgt _02339510
	ldr r0, [sp, #0x24]
	cmp r0, #1
	addeq sp, sp, #0xe8
	moveq r0, #3
	popeq {r3, pc}
_02339510:
	add sp, sp, #0xe8
	mov r0, #5
	pop {r3, pc}
_0233951C:
	mov r0, #4
_02339520:
	add sp, sp, #0xe8
	pop {r3, pc}
	.align 2, 0
_02339528: .4byte 0x0235AA94
	arm_func_end ov02_02339470

	arm_func_start ov02_0233952C
ov02_0233952C: @ 0x0233952C
	push {r3, lr}
	sub sp, sp, #0xe8
	add r0, sp, #0
	blx ov02_023343AC
	cmp r0, #1
	beq _02339548
	bl FUN_0207BC20
_02339548:
	add r0, sp, #0
	bl ov02_02347AF8
	add sp, sp, #0xe8
	pop {r3, pc}
	arm_func_end ov02_0233952C
_02339558:
	.byte 0x0C, 0x30, 0x9F, 0xE5, 0x07, 0x00, 0x90, 0xE8
	.byte 0x00, 0x30, 0x93, 0xE5, 0x07, 0x00, 0x83, 0xE8, 0x1E, 0xFF, 0x2F, 0xE1, 0x94, 0xAA, 0x35, 0x02
	.byte 0x04, 0xC0, 0x9F, 0xE5, 0x20, 0x10, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1, 0xB4, 0xE7, 0x34, 0x02
	.byte 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1, 0x1C, 0xE8, 0x34, 0x02

	arm_func_start ov02_0233958C
ov02_0233958C: @ 0x0233958C
	push {r3, lr}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x14
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x14
	bl ov02_0234D8E0
	ldr r0, _023395C4 @ =ov02_023395C8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023395C4: .4byte ov02_023395C8
	arm_func_end ov02_0233958C

	arm_func_start ov02_023395C8
ov02_023395C8: @ 0x023395C8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	mov r1, r0
	bl ov02_0234FBB0
	mov r0, #1
	mov r1, #0
	bl ov02_0234FBB0
	mov r0, #1
	bl ov02_0234D5F0
	mov r0, #0
	bl ov02_0234D5F0
	bl ov02_02335254
	bl ov02_02334FD8
	ldr r0, _02339638 @ =0x0235AA98
	ldr r0, [r0]
	bl ov02_02338F30
	bl ov02_02338EC4
	bl ov02_02347504
	bl ov02_02338E34
	pop {r3, pc}
	.align 2, 0
_02339638: .4byte 0x0235AA98
	arm_func_end ov02_023395C8

	arm_func_start ov02_0233963C
ov02_0233963C: @ 0x0233963C
	push {r3, lr}
	bl ov02_023474C0
	bl ov02_02338E88
	bl ov02_02334FB8
	bl ov02_023351DC
	bl ov02_02334C28
	bl ov02_02338DF0
	cmp r0, #1
	bne _02339684
	mov r0, #2
	bl ov02_02338E18
	cmp r0, #0
	beq _02339684
	ldr r0, _023397B4 @ =0x02353608
	bl ov02_02338ED8
	ldr r1, _023397B8 @ =0x0235AA98
	str r0, [r1]
	b _0233969C
_02339684:
	bl ov02_02338DF0
	ldr r1, _023397BC @ =0x023535EC
	ldr r0, [r1, r0, lsl #2]
	bl ov02_02338ED8
	ldr r1, _023397B8 @ =0x0235AA98
	str r0, [r1]
_0233969C:
	ldr r0, _023397C0 @ =0x02353618
	bl ov02_02334D48
	mov r1, r0
	mov r0, #1
	bl ov02_0234D5C0
	ldr r0, _023397C4 @ =0x0235362C
	bl ov02_02334D48
	mov r1, r0
	mov r0, #0
	bl ov02_0234D5C0
	ldr r0, _023397C8 @ =0x02353640
	ldr r1, _023397CC @ =0x020782B0
	bl ov02_02334DA8
	ldr r0, _023397D0 @ =0x02353654
	ldr r1, _023397D4 @ =0x02077D4C
	bl ov02_02334DA8
	ldr r0, _023397D8 @ =0x02353668
	ldr r1, _023397DC @ =0x02077F58
	bl ov02_02334DA8
	ldr r0, _023397E0 @ =0x02353680
	ldr r1, _023397E4 @ =0x02077DFC
	bl ov02_02334DA8
	ldr r0, _023397E8 @ =0x02353698
	ldr r1, _023397EC @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _023397F0 @ =0x023536B0
	ldr r1, _023397F4 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _023397F8 @ =0x023536C8
	ldr r1, _023397FC @ =0x02077F00
	bl ov02_02334DA8
	ldr r0, _02339800 @ =0x023536E0
	ldr r1, _02339804 @ =0x02077DA4
	bl ov02_02334DA8
	bl ov02_02338E00
	cmp r0, #0
	beq _0233973C
	cmp r0, #1
	beq _0233974C
	b _02339758
_0233973C:
	ldr r0, _02339808 @ =0x023536F8
	ldr r1, _0233980C @ =FUN_02078070
	bl ov02_02334DA8
	b _02339758
_0233974C:
	ldr r0, _02339810 @ =0x0235370C
	ldr r1, _0233980C @ =FUN_02078070
	bl ov02_02334DA8
_02339758:
	ldr ip, _02339814 @ =0x0400100A
	mov r0, #1
	ldrh r2, [ip]
	sub r3, ip, #0x1000
	mov r1, #2
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [ip]
	ldrh r2, [r3]
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [r3]
	ldrh r2, [r3]
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [r3]
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #2
	bl ov02_0234E3D0
	ldr r0, _02339818 @ =ov02_0233981C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023397B4: .4byte 0x02353608
_023397B8: .4byte 0x0235AA98
_023397BC: .4byte 0x023535EC
_023397C0: .4byte 0x02353618
_023397C4: .4byte 0x0235362C
_023397C8: .4byte 0x02353640
_023397CC: .4byte 0x020782B0
_023397D0: .4byte 0x02353654
_023397D4: .4byte 0x02077D4C
_023397D8: .4byte 0x02353668
_023397DC: .4byte 0x02077F58
_023397E0: .4byte 0x02353680
_023397E4: .4byte 0x02077DFC
_023397E8: .4byte 0x02353698
_023397EC: .4byte 0x02078310
_023397F0: .4byte 0x023536B0
_023397F4: .4byte FUN_02077CF8
_023397F8: .4byte 0x023536C8
_023397FC: .4byte 0x02077F00
_02339800: .4byte 0x023536E0
_02339804: .4byte 0x02077DA4
_02339808: .4byte 0x023536F8
_0233980C: .4byte FUN_02078070
_02339810: .4byte 0x0235370C
_02339814: .4byte 0x0400100A
_02339818: .4byte ov02_0233981C
	arm_func_end ov02_0233963C

	arm_func_start ov02_0233981C
ov02_0233981C: @ 0x0233981C
	push {r3, lr}
	mov r0, #2
	mov r2, r0
	mov r1, #1
	mov r3, #0x14
	bl ov02_0234D8E0
	mov r0, #2
	mov r2, r0
	mov r1, #0
	mov r3, #0x14
	bl ov02_0234D8E0
	ldr r0, _02339854 @ =ov02_02339858
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339854: .4byte ov02_02339858
	arm_func_end ov02_0233981C

	arm_func_start ov02_02339858
ov02_02339858: @ 0x02339858
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02338E00
	cmp r0, #0
	beq _02339894
	cmp r0, #1
	beq _023398AC
	pop {r3, pc}
_02339894:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _023398C4 @ =ov02_023398CC
	bl ov02_02338D68
	pop {r3, pc}
_023398AC:
	mov r0, #1
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _023398C8 @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023398C4: .4byte ov02_023398CC
_023398C8: .4byte ov02_02343DB0
	arm_func_end ov02_02339858

	arm_func_start ov02_023398CC
ov02_023398CC: @ 0x023398CC
	push {r3, lr}
	bl ov02_02339948
	mov r0, #0
	bl ov02_02335268
	mov r0, #0x2e
	sub r1, r0, #0x2f
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #4
	bl ov02_02348C1C
	ldr r0, _02339930 @ =0x0235AA9C
	ldr r3, _02339934 @ =0x0235291A
	ldrb r0, [r0]
	ldr r1, _02339938 @ =0x0235291E
	ldr r2, _0233993C @ =0x0235291C
	lsl ip, r0, #3
	ldrh r0, [r3, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldr r3, _02339940 @ =0x02352920
	ldrh r3, [r3, ip]
	bl ov02_023350AC
	ldr r0, _02339944 @ =ov02_02339A34
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339930: .4byte 0x0235AA9C
_02339934: .4byte 0x0235291A
_02339938: .4byte 0x0235291E
_0233993C: .4byte 0x0235291C
_02339940: .4byte 0x02352920
_02339944: .4byte ov02_02339A34
	arm_func_end ov02_023398CC

	arm_func_start ov02_02339948
ov02_02339948: @ 0x02339948
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02339A0C @ =0x0235292A
	add r3, sp, #0
	mov r2, #0xb
_0233995C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0233995C
	ldr r0, _02339A10 @ =0x02353720
	ldr r1, _02339A14 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02339A18 @ =0x02353738
	ldr r1, _02339A1C @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _02339A20 @ =0x02353750
	ldr r1, _02339A24 @ =FUN_020780D0
	bl ov02_02334DA8
	add r0, sp, #0
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _02339A28 @ =0x0235AA9C
	ldr r2, _02339A2C @ =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _02339A30 @ =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02339A0C: .4byte 0x0235292A
_02339A10: .4byte 0x02353720
_02339A14: .4byte 0x02078310
_02339A18: .4byte 0x02353738
_02339A1C: .4byte FUN_02077CF8
_02339A20: .4byte 0x02353750
_02339A24: .4byte FUN_020780D0
_02339A28: .4byte 0x0235AA9C
_02339A2C: .4byte 0x04001008
_02339A30: .4byte 0x0400000A
	arm_func_end ov02_02339948

	arm_func_start ov02_02339A34
ov02_02339A34: @ 0x02339A34
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _02339A84 @ =ov02_02339A88
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339A84: .4byte ov02_02339A88
	arm_func_end ov02_02339A34

	arm_func_start ov02_02339A88
ov02_02339A88: @ 0x02339A88
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_02334E38
	ldr r0, _02339AC0 @ =0x02339AC4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339AC0: .4byte 0x02339AC4
	arm_func_end ov02_02339A88
_02339AC4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x03, 0xEB, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3
	.byte 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0x1C, 0xEB, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0xA0, 0xFC, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xEC, 0x9A, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x02, 0x00, 0x00, 0xEB, 0x4C, 0x00, 0x00, 0xEB, 0x4C, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02339B00
ov02_02339B00: @ 0x02339B00
	push {r3, r4, r5, lr}
	ldr r5, _02339C14 @ =0x0235290A
	mov r4, #0
_02339B0C:
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02339B5C
	mov r0, #1
	bl ov02_023346F0
	and r1, r4, #0xff
	lsl lr, r1, #3
	ldr r0, _02339C18 @ =0x0235291A
	ldr r1, _02339C1C @ =0x0235291E
	ldr r2, _02339C20 @ =0x0235291C
	ldr r3, _02339C24 @ =0x02352920
	ldr ip, _02339C28 @ =0x0235AA9C
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov02_023350AC
	pop {r3, r4, r5, pc}
_02339B5C:
	add r4, r4, #1
	cmp r4, #2
	add r5, r5, #8
	blo _02339B0C
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02339B88
	mov r0, #1
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_02339B88:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02339BA4
	mov r0, #0
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_02339BA4:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02339BC0
	mov r0, #1
	bl ov02_02339D94
	pop {r3, r4, r5, pc}
_02339BC0:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02339BDC
	mov r0, #3
	bl ov02_02339D94
	pop {r3, r4, r5, pc}
_02339BDC:
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02339BF8
	mov r0, #0
	bl ov02_02339D94
	pop {r3, r4, r5, pc}
_02339BF8:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #2
	bl ov02_02339D94
	pop {r3, r4, r5, pc}
	.align 2, 0
_02339C14: .4byte 0x0235290A
_02339C18: .4byte 0x0235291A
_02339C1C: .4byte 0x0235291E
_02339C20: .4byte 0x0235291C
_02339C24: .4byte 0x02352920
_02339C28: .4byte 0x0235AA9C
	arm_func_end ov02_02339B00

	arm_func_start ov02_02339C2C
ov02_02339C2C: @ 0x02339C2C
	bx lr
	arm_func_end ov02_02339C2C

	arm_func_start ov02_02339C30
ov02_02339C30: @ 0x02339C30
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _02339C4C
	cmp r0, #1
	beq _02339C60
	pop {r3, pc}
_02339C4C:
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _02339C78 @ =ov02_0233958C
	bl ov02_02338D68
	pop {r3, pc}
_02339C60:
	mov r0, #6
	bl ov02_023480E0
	bl ov02_02339E04
	ldr r0, _02339C7C @ =0x02339C80
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339C78: .4byte ov02_0233958C
_02339C7C: .4byte 0x02339C80
	arm_func_end ov02_02339C30
_02339C80:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xB7, 0xEA, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x93, 0x4F, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x33, 0xFC, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xA0, 0x9C, 0x33, 0x02

	arm_func_start ov02_02339CA0
ov02_02339CA0: @ 0x02339CA0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x16
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02339CE8 @ =ov02_02339CEC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339CE8: .4byte ov02_02339CEC
	arm_func_end ov02_02339CA0

	arm_func_start ov02_02339CEC
ov02_02339CEC: @ 0x02339CEC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0233519C
	bl ov02_02334D10
	ldr r0, _02339D88 @ =0x0235AA9C
	ldr r0, [r0, #4]
	bl ov02_0234CF78
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	ldr r0, _02339D88 @ =0x0235AA9C
	ldrb r0, [r0]
	cmp r0, #0
	beq _02339D58
	cmp r0, #1
	beq _02339D70
	pop {r3, pc}
_02339D58:
	mov r0, #1
	mov r1, #0
	bl ov02_02338D78
	ldr r0, _02339D8C @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
_02339D70:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _02339D90 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339D88: .4byte 0x0235AA9C
_02339D8C: .4byte ov02_02343DB0
_02339D90: .4byte ov02_0233A904
	arm_func_end ov02_02339CEC

	arm_func_start ov02_02339D94
ov02_02339D94: @ 0x02339D94
	push {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	popeq {r3, pc}
	ldr r1, _02339DF0 @ =0x0235AA9C
	mov r0, #8
	ldrb r2, [r1]
	eor r2, r2, #1
	strb r2, [r1]
	bl ov02_023480E0
	ldr r0, _02339DF0 @ =0x0235AA9C
	ldr ip, _02339DF4 @ =0x0235291A
	ldrb r0, [r0]
	ldr r1, _02339DF8 @ =0x0235291E
	ldr r2, _02339DFC @ =0x0235291C
	lsl lr, r0, #3
	ldr r3, _02339E00 @ =0x02352920
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov02_023350AC
	pop {r3, pc}
	.align 2, 0
_02339DF0: .4byte 0x0235AA9C
_02339DF4: .4byte 0x0235291A
_02339DF8: .4byte 0x0235291E
_02339DFC: .4byte 0x0235291C
_02339E00: .4byte 0x02352920
	arm_func_end ov02_02339D94

	arm_func_start ov02_02339E04
ov02_02339E04: @ 0x02339E04
	push {r3, lr}
	ldr r1, _02339E3C @ =0x02352908
	ldr r0, _02339E40 @ =0x0235AA9C
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	ldrb r1, [r0]
	add ip, sp, #0
	strb r3, [sp]
	strb r2, [sp, #1]
	ldrb r1, [ip, r1]
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov02_023468A0
	pop {r3, pc}
	.align 2, 0
_02339E3C: .4byte 0x02352908
_02339E40: .4byte 0x0235AA9C
	arm_func_end ov02_02339E04

	arm_func_start ov02_02339E44
ov02_02339E44: @ 0x02339E44
	push {r3, lr}
	ldr r0, _02339E84 @ =0x0235AAA4
	mov r1, #0
	strb r1, [r0]
	bl ov02_02339E8C
	mov r0, #0x12
	bl ov02_02335268
	mov r0, #0x3b
	sub r1, r0, #0x3c
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #0x17
	bl ov02_02334E70
	ldr r0, _02339E88 @ =ov02_02339F0C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339E84: .4byte 0x0235AAA4
_02339E88: .4byte ov02_02339F0C
	arm_func_end ov02_02339E44

	arm_func_start ov02_02339E8C
ov02_02339E8C: @ 0x02339E8C
	push {r3, lr}
	ldr r0, _02339EFC @ =0x02353764
	ldr r1, _02339F00 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02339F04 @ =0x04001008
	ldr r1, _02339F08 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02339EFC: .4byte 0x02353764
_02339F00: .4byte FUN_020780D0
_02339F04: .4byte 0x04001008
_02339F08: .4byte 0x0400000A
	arm_func_end ov02_02339E8C

	arm_func_start ov02_02339F0C
ov02_02339F0C: @ 0x02339F0C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02339F5C @ =ov02_02339F60
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339F5C: .4byte ov02_02339F60
	arm_func_end ov02_02339F0C

	arm_func_start ov02_02339F60
ov02_02339F60: @ 0x02339F60
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov02_02334E38
	ldr r0, _02339F98 @ =0x02339F9C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02339F98: .4byte 0x02339F9C
	arm_func_end ov02_02339F60
_02339F9C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xCD, 0xE9, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0xE6, 0xE9, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x6A, 0xFB, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xC4, 0x9F, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02339FD8
ov02_02339FD8: @ 0x02339FD8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02339FF4
	mov r0, #1
	bl ov02_023346F0
_02339FF4:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02339FD8

	arm_func_start ov02_0233A010
ov02_0233A010: @ 0x0233A010
	bx lr
	arm_func_end ov02_0233A010

	arm_func_start ov02_0233A014
ov02_0233A014: @ 0x0233A014
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _0233A030
	cmp r0, #1
	beq _0233A044
	pop {r3, pc}
_0233A030:
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _0233A074 @ =0x0233A07C
	bl ov02_02338D68
	pop {r3, pc}
_0233A044:
	mov r0, #6
	bl ov02_023480E0
	mov r2, #1
	mov r1, #0
	sub r3, r2, #2
	mov r0, #0x18
	str r1, [sp]
	bl ov02_02349394
	bl ov02_02334768
	ldr r0, _0233A078 @ =ov02_0233A1B8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A074: .4byte 0x0233A07C
_0233A078: .4byte ov02_0233A1B8
	arm_func_end ov02_0233A014
_0233A07C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xB8, 0xE9, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x94, 0x4E, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x34, 0xFB, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x9C, 0xA0, 0x33, 0x02

	arm_func_start ov02_0233A09C
ov02_0233A09C: @ 0x0233A09C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _0233A0F8 @ =0x0235AAA4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233A0D8
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0233A0D8:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233A0FC @ =ov02_0233A100
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A0F8: .4byte 0x0235AAA4
_0233A0FC: .4byte ov02_0233A100
	arm_func_end ov02_0233A09C

	arm_func_start ov02_0233A100
ov02_0233A100: @ 0x0233A100
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233A1AC @ =0x0235AAA4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233A134
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_0233A134:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233A1AC @ =0x0235AAA4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233A168
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233A168:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233A1AC @ =0x0235AAA4
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0233A19C
	bl ov02_02338D78
	ldr r0, _0233A1B0 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
_0233A19C:
	bl ov02_02338D78
	ldr r0, _0233A1B4 @ =0x0233A228
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A1AC: .4byte 0x0235AAA4
_0233A1B0: .4byte ov02_0233A904
_0233A1B4: .4byte 0x0233A228
	arm_func_end ov02_0233A100

	arm_func_start ov02_0233A1B8
ov02_0233A1B8: @ 0x0233A1B8
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	beq _0233A1E8
	cmp r0, #1
	popne {r3, pc}
	mov r0, #0xe
	bl ov02_023480E0
	ldr r0, _0233A200 @ =0x0235AAA4
	mov r1, #1
	strb r1, [r0]
	b _0233A1F0
_0233A1E8:
	mov r0, #7
	bl ov02_023480E0
_0233A1F0:
	bl ov02_023496C0
	ldr r0, _0233A204 @ =0x0233A208
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A200: .4byte 0x0235AAA4
_0233A204: .4byte 0x0233A208
	arm_func_end ov02_0233A1B8
_0233A208:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x41, 0x3D, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0xD1, 0xFA, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x7C, 0xA0, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x06, 0x00, 0x00, 0xEB
	.byte 0x19, 0x00, 0xA0, 0xE3, 0x0D, 0xEB, 0xFF, 0xEB, 0xCA, 0x36, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0xC8, 0xFA, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xCC, 0xA2, 0x33, 0x02

	arm_func_start ov02_0233A24C
ov02_0233A24C: @ 0x0233A24C
	push {r3, lr}
	ldr r0, _0233A2BC @ =0x02353778
	ldr r1, _0233A2C0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233A2C4 @ =0x04001008
	ldr r1, _0233A2C8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233A2BC: .4byte 0x02353778
_0233A2C0: .4byte FUN_020780D0
_0233A2C4: .4byte 0x04001008
_0233A2C8: .4byte 0x0400000A
	arm_func_end ov02_0233A24C

	arm_func_start ov02_0233A2CC
ov02_0233A2CC: @ 0x0233A2CC
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233A2FC @ =ov02_0233A300
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A2FC: .4byte ov02_0233A300
	arm_func_end ov02_0233A2CC

	arm_func_start ov02_0233A300
ov02_0233A300: @ 0x0233A300
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #5
	bl ov02_02334E38
	ldr r0, _0233A328 @ =0x0233A32C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A328: .4byte 0x0233A32C
	arm_func_end ov02_0233A300
_0233A32C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xE9, 0xE8, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0x02, 0xE9, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x86, 0xFA, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x54, 0xA3, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x09, 0x00, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233A368
ov02_0233A368: @ 0x0233A368
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233A368

	arm_func_start ov02_0233A388
ov02_0233A388: @ 0x0233A388
	bx lr
	arm_func_end ov02_0233A388

	arm_func_start ov02_0233A38C
ov02_0233A38C: @ 0x0233A38C
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233A3B0 @ =0x0233A3B4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A3B0: .4byte 0x0233A3B4
	arm_func_end ov02_0233A38C
_0233A3B4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xEA, 0xE8, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xC6, 0x4D, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x66, 0xFA, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xD4, 0xA3, 0x33, 0x02

	arm_func_start ov02_0233A3D4
ov02_0233A3D4: @ 0x0233A3D4
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x40
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x40
	bl ov02_0234D8E0
	ldr r0, _0233A41C @ =ov02_0233A420
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A41C: .4byte ov02_0233A420
	arm_func_end ov02_0233A3D4

	arm_func_start ov02_0233A420
ov02_0233A420: @ 0x0233A420
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0x1000000
	bl FUN_0207B854
	bl FUN_0208200C
	pop {r3, pc}
	arm_func_end ov02_0233A420

	arm_func_start ov02_0233A454
ov02_0233A454: @ 0x0233A454
	push {r3, lr}
	bl ov02_0233A488
	mov r0, #0x11
	bl ov02_02335268
	mov r0, #0x3a
	sub r1, r0, #0x3b
	mov r2, #0
	bl ov02_02334C3C
	bl ov02_0233A508
	ldr r0, _0233A484 @ =ov02_0233A70C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A484: .4byte ov02_0233A70C
	arm_func_end ov02_0233A454

	arm_func_start ov02_0233A488
ov02_0233A488: @ 0x0233A488
	push {r3, lr}
	ldr r0, _0233A4F8 @ =0x0235378C
	ldr r1, _0233A4FC @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233A500 @ =0x04001008
	ldr r1, _0233A504 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233A4F8: .4byte 0x0235378C
_0233A4FC: .4byte FUN_020780D0
_0233A500: .4byte 0x04001008
_0233A504: .4byte 0x0400000A
	arm_func_end ov02_0233A488

	arm_func_start ov02_0233A508
ov02_0233A508: @ 0x0233A508
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x7c
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	mov fp, r0
	add r0, sp, #0x14
	bl FUN_0207B9EC
	ldrb r1, [sp, #0x15]
	ldr r2, _0233A6FC @ =0x023537A0
	add r0, sp, #0x1a
	str r1, [sp]
	ldrb r3, [sp, #0x16]
	mov r1, #0x14
	str r3, [sp, #4]
	ldrb r3, [sp, #0x17]
	str r3, [sp, #8]
	ldrb r3, [sp, #0x18]
	str r3, [sp, #0xc]
	ldrb r3, [sp, #0x19]
	str r3, [sp, #0x10]
	ldrb r3, [sp, #0x14]
	bl FUN_0207911C
	add r0, sp, #0x2e
	add r1, sp, #0x1a
	mov r2, #0x14
	bl ov02_0234F5C8
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r1, sp, #0x2e
	str r1, [sp, #0xc]
	mov r0, fp
	mov r1, #8
	mov r2, #0x40
	mov r3, #0xf0
	bl ov02_0234E1E8
	add r0, sp, #0x68
	bl FUN_022ED468
	ldr sl, [sp, #0x6c]
	ldr r8, [sp, #0x68]
	cmp sl, #0
	mov r3, #0
	cmpeq r8, #0
	beq _0233A698
	mov r0, r8
	mov r1, sl
	mov r2, #0xa
	bl FUN_0208FE48
	mov r1, #0x3e8
	umull r4, r1, r0, r1
	mov r0, r8
	mov r1, sl
	mov r3, #0
	mov r2, #0xa
	str r4, [sp, #0x64]
	bl FUN_0208FE3C
	mov sb, #0
	ldr r7, _0233A700 @ =0x00002710
	mov r8, r0
	mov sl, r1
	mov r6, sb
	add r5, sp, #0x58
	mov r4, sb
_0233A614:
	mov r0, r8
	mov r1, sl
	mov r2, r7
	mov r3, r6
	bl FUN_0208FE48
	rsb r1, sb, #2
	str r0, [r5, r1, lsl #2]
	mov r0, r8
	mov r1, sl
	mov r2, r7
	mov r3, r4
	bl FUN_0208FE3C
	mov r8, r0
	mov sl, r1
	add sb, sb, #1
	cmp sb, #3
	blt _0233A614
	ldr r1, [sp, #0x5c]
	ldr r0, [sp, #0x60]
	str r1, [sp]
	str r0, [sp, #4]
	ldr r4, [sp, #0x64]
	ldr r3, [sp, #0x58]
	ldr r2, _0233A704 @ =0x023537C0
	add r0, sp, #0x1a
	mov r1, #0x14
	str r4, [sp, #8]
	bl FUN_0207911C
	add r0, sp, #0x2e
	add r1, sp, #0x1a
	mov r2, #0x14
	bl ov02_0234F5C8
	b _0233A6B8
_0233A698:
	ldr r2, _0233A708 @ =0x023537D4
	add r0, sp, #0x1a
	mov r1, #0x14
	bl FUN_0207911C
	add r0, sp, #0x2e
	add r1, sp, #0x1a
	mov r2, #0x14
	bl ov02_0234F5C8
_0233A6B8:
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r4, sp, #0x2e
	mov r0, fp
	mov r1, #8
	mov r2, #0x78
	mov r3, #0xf0
	str r4, [sp, #0xc]
	bl ov02_0234E1E8
	mov r0, fp
	bl ov02_0234E354
	add sp, sp, #0x7c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233A6FC: .4byte 0x023537A0
_0233A700: .4byte 0x00002710
_0233A704: .4byte 0x023537C0
_0233A708: .4byte 0x023537D4
	arm_func_end ov02_0233A508

	arm_func_start ov02_0233A70C
ov02_0233A70C: @ 0x0233A70C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233A75C @ =ov02_0233A760
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A75C: .4byte ov02_0233A760
	arm_func_end ov02_0233A70C

	arm_func_start ov02_0233A760
ov02_0233A760: @ 0x0233A760
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #2
	bl ov02_02334E38
	ldr r0, _0233A798 @ =0x0233A79C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A798: .4byte 0x0233A79C
	arm_func_end ov02_0233A760
_0233A79C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xCD, 0xE7, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0xE6, 0xE7, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x6A, 0xF9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xC4, 0xA7, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x09, 0x00, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233A7D8
ov02_0233A7D8: @ 0x0233A7D8
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233A7D8

	arm_func_start ov02_0233A7F8
ov02_0233A7F8: @ 0x0233A7F8
	bx lr
	arm_func_end ov02_0233A7F8

	arm_func_start ov02_0233A7FC
ov02_0233A7FC: @ 0x0233A7FC
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _0233A820 @ =0x0233A824
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A820: .4byte 0x0233A824
	arm_func_end ov02_0233A7FC
_0233A824:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xCE, 0xE7, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xAA, 0x4C, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x4A, 0xF9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x44, 0xA8, 0x33, 0x02

	arm_func_start ov02_0233A844
ov02_0233A844: @ 0x0233A844
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233A890 @ =ov02_0233A894
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A890: .4byte ov02_0233A894
	arm_func_end ov02_0233A844

	arm_func_start ov02_0233A894
ov02_0233A894: @ 0x0233A894
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233A900 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233A900: .4byte ov02_0233A904
	arm_func_end ov02_0233A894

	arm_func_start ov02_0233A904
ov02_0233A904: @ 0x0233A904
	push {r4, lr}
	ldr r0, _0233A9B0 @ =0x0235AAA8
	mov r1, #0
	strb r1, [r0, #1]
	bl ov02_0233A9CC
	mov r0, #0x10
	bl ov02_02335268
	mov r0, #3
	bl ov02_02348C1C
	mov r0, #0x39
	sub r1, r0, #0x3a
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #0
	mov r1, #0x5b
	bl ov02_0234D6AC
	ldr r2, _0233A9B0 @ =0x0235AAA8
	ldr r1, _0233A9B4 @ =0xFE00FF00
	str r0, [r2, #8]
	ldr r3, [r0]
	ldr lr, _0233A9B8 @ =0x0235298E
	and r1, r3, r1
	orr r1, r1, #0x84
	orr r1, r1, #0xe00000
	str r1, [r0]
	ldr r4, [r2, #8]
	ldr r1, _0233A9BC @ =0x02352992
	ldrh r0, [r4, #4]
	ldr ip, _0233A9C0 @ =0x02352990
	ldr r3, _0233A9C4 @ =0x02352994
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r4, #4]
	ldrb r0, [r2]
	lsl r4, r0, #3
	ldrh r0, [lr, r4]
_0233A994:
	ldrh r1, [r1, r4]
	ldrh r2, [ip, r4]
	ldrh r3, [r3, r4]
	bl ov02_023350AC
	ldr r0, _0233A9C8 @ =ov02_0233AB68
	bl ov02_02338D68
	pop {r4, pc}
	.align 2, 0
_0233A9B0: .4byte 0x0235AAA8
_0233A9B4: .4byte 0xFE00FF00
_0233A9B8: .4byte 0x0235298E
_0233A9BC: .4byte 0x02352992
_0233A9C0: .4byte 0x02352990
_0233A9C4: .4byte 0x02352994
_0233A9C8: .4byte ov02_0233AB68
	arm_func_end ov02_0233A904

	arm_func_start ov02_0233A9CC
ov02_0233A9CC: @ 0x0233A9CC
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x44
	ldr r4, _0233AB44 @ =0x02352948
	add r3, sp, #0x2b
	mov r2, #0xb
_0233A9E0:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	add r4, r4, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0233A9E0
	ldr r4, _0233AB48 @ =0x0235295E
	add r3, sp, #0x14
	mov r2, #0xb
_0233AA0C:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	add r4, r4, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0233AA0C
	ldrb r2, [r4]
	ldr r0, _0233AB4C @ =0x023537E8
	ldr r1, _0233AB50 @ =0x02078310
	strb r2, [r3]
	bl ov02_02334DA8
	ldr r0, _0233AB54 @ =0x02353800
	ldr r1, _0233AB58 @ =FUN_020780D0
	bl ov02_02334DA8
	add r0, sp, #0x14
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _0233AB5C @ =0x0235AAA8
	str r0, [r1, #4]
	add r0, sp, #0x2b
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	mov r8, r0
	add r0, sp, #0
	bl FUN_022ED468
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	mov r7, #0
	cmpeq r1, #0
	bne _0233AAD0
	add r5, r8, #0xc0
	add r6, r8, #0x40
	mov r4, #0x20
_0233AAAC:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl FUN_0207C4C8
	add r7, r7, #1
	cmp r7, #2
	add r5, r5, #0x20
	add r6, r6, #0x20
	blt _0233AAAC
_0233AAD0:
	mov r0, r8
	mov r1, #0x200
	bl FUN_0207A2DC
	mov r0, r8
	mov r1, #0
	mov r2, #0x200
	bl FUN_02077CF8
	mov r0, r8
	bl ov02_0234CF78
	ldr r2, _0233AB60 @ =0x04001008
	ldr r1, _0233AB64 @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x44
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233AB44: .4byte 0x02352948
_0233AB48: .4byte 0x0235295E
_0233AB4C: .4byte 0x023537E8
_0233AB50: .4byte 0x02078310
_0233AB54: .4byte 0x02353800
_0233AB58: .4byte FUN_020780D0
_0233AB5C: .4byte 0x0235AAA8
_0233AB60: .4byte 0x04001008
_0233AB64: .4byte 0x0400000A
	arm_func_end ov02_0233A9CC

	arm_func_start ov02_0233AB68
ov02_0233AB68: @ 0x0233AB68
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _0233ABB8 @ =ov02_0233ABBC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233ABB8: .4byte ov02_0233ABBC
	arm_func_end ov02_0233AB68

	arm_func_start ov02_0233ABBC
ov02_0233ABBC: @ 0x0233ABBC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_02334E38
	ldr r0, _0233ABF4 @ =0x0233ABF8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233ABF4: .4byte 0x0233ABF8
	arm_func_end ov02_0233ABBC
_0233ABF8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xB6, 0xE6, 0xFF, 0xEB
	.byte 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0xCF, 0xE6, 0xFF, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x53, 0xF8, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x20, 0xAC, 0x33, 0x02
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x3E, 0x00, 0x00, 0xEB, 0x3E, 0x00, 0x00, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233AC34
ov02_0233AC34: @ 0x0233AC34
	push {r3, r4, r5, lr}
	ldr r5, _0233AD10 @ =0x02352976
	mov r4, #0
_0233AC40:
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _0233AC90
	mov r0, #1
	bl ov02_023346F0
	and r1, r4, #0xff
	lsl lr, r1, #3
	ldr r0, _0233AD14 @ =0x0235298E
	ldr r1, _0233AD18 @ =0x02352992
	ldr r2, _0233AD1C @ =0x02352990
	ldr r3, _0233AD20 @ =0x02352994
	ldr ip, _0233AD24 @ =0x0235AAA8
	ldrh r0, [r0, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	strb r4, [ip]
	bl ov02_023350AC
	pop {r3, r4, r5, pc}
_0233AC90:
	add r4, r4, #1
	cmp r4, #3
	add r5, r5, #8
	blo _0233AC40
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233ACBC
	mov r0, #1
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_0233ACBC:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233ACD8
	mov r0, #0
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_0233ACD8:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _0233ACF4
	mov r0, #1
	bl ov02_0233AF60
	pop {r3, r4, r5, pc}
_0233ACF4:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #3
	bl ov02_0233AF60
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233AD10: .4byte 0x02352976
_0233AD14: .4byte 0x0235298E
_0233AD18: .4byte 0x02352992
_0233AD1C: .4byte 0x02352990
_0233AD20: .4byte 0x02352994
_0233AD24: .4byte 0x0235AAA8
	arm_func_end ov02_0233AC34

	arm_func_start ov02_0233AD28
ov02_0233AD28: @ 0x0233AD28
	bx lr
	arm_func_end ov02_0233AD28

	arm_func_start ov02_0233AD2C
ov02_0233AD2C: @ 0x0233AD2C
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	bl ov02_023346DC
	cmp r0, #0
	beq _0233AD50
	cmp r0, #1
	beq _0233AD5C
	add sp, sp, #0x14
	ldm sp!, {pc}
_0233AD50:
	mov r0, #7
	bl ov02_023480E0
	b _0233ADB8
_0233AD5C:
	add r0, sp, #0
	bl FUN_022ED468
	ldr r0, _0233ADC8 @ =0x0235AAA8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0233ADA0
	ldr r0, [sp, #4]
	ldr r1, [sp]
	cmp r0, #0
	cmpeq r1, #0
	bne _0233ADA0
	mov r0, #9
	bl ov02_023480E0
	mvn r0, #0
	bl ov02_02334710
	add sp, sp, #0x14
	ldm sp!, {pc}
_0233ADA0:
	mov r0, #6
	bl ov02_023480E0
	bl ov02_0233AFF0
	ldr r0, _0233ADC8 @ =0x0235AAA8
	mov r1, #1
	strb r1, [r0, #1]
_0233ADB8:
	ldr r0, _0233ADCC @ =0x0233ADD0
	bl ov02_02338D68
	add sp, sp, #0x14
	ldm sp!, {pc}
	.align 2, 0
_0233ADC8: .4byte 0x0235AAA8
_0233ADCC: .4byte 0x0233ADD0
_0233ADD0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x63, 0xE6, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x3F, 0x4B, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xDF, 0xF7, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
_0233ADEC: .4byte ov02_0233ADF0
	arm_func_end ov02_0233AD2C

	arm_func_start ov02_0233ADF0
ov02_0233ADF0: @ 0x0233ADF0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233AE4C @ =0x0235AAA8
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0233AE18
	bl ov02_023346AC
_0233AE18:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233AE50 @ =ov02_0233AE54
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233AE4C: .4byte 0x0235AAA8
_0233AE50: .4byte ov02_0233AE54
	arm_func_end ov02_0233ADF0

	arm_func_start ov02_0233AE54
ov02_0233AE54: @ 0x0233AE54
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	arm_func_end ov02_0233AE54

	arm_func_start ov02_0233AE64
ov02_0233AE64: @ 0x0233AE64
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0233AF4C @ =0x0235AAA8
	ldr r0, [r0, #8]
	bl ov02_0234F2C0
	bl ov02_0233519C
	bl ov02_02334D10
	ldr r0, _0233AF4C @ =0x0235AAA8
	ldr r0, [r0, #4]
	bl ov02_0234CF78
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	ldr r0, _0233AF4C @ =0x0235AAA8
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _0233AEE4
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _0233AF50 @ =ov02_023398CC
	bl ov02_02338D68
	pop {r3, pc}
_0233AEE4:
	ldrb r0, [r0]
	cmp r0, #0
	beq _0233AF04
	cmp r0, #1
	beq _0233AF1C
	cmp r0, #2
	beq _0233AF34
	pop {r3, pc}
_0233AF04:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233AF54 @ =ov02_0233A454
	bl ov02_02338D68
	pop {r3, pc}
_0233AF1C:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233AF58 @ =ov02_02339E44
	bl ov02_02338D68
	pop {r3, pc}
_0233AF34:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233AF5C @ =ov02_0233B6D0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233AF4C: .4byte 0x0235AAA8
_0233AF50: .4byte ov02_023398CC
_0233AF54: .4byte ov02_0233A454
_0233AF58: .4byte ov02_02339E44
_0233AF5C: .4byte ov02_0233B6D0
	arm_func_end ov02_0233AE64

	arm_func_start ov02_0233AF60
ov02_0233AF60: @ 0x0233AF60
	push {r3, lr}
	cmp r0, #1
	mov r1, #3
	bne _0233AF88
	ldr r0, _0233AFDC @ =0x0235AAA8
	ldrb r0, [r0]
	add r0, r0, #2
	bl FUN_02075C38
	ldr r1, _0233AFDC @ =0x0235AAA8
	b _0233AF9C
_0233AF88:
	ldr r0, _0233AFDC @ =0x0235AAA8
	ldrb r0, [r0]
	add r0, r0, #1
	bl FUN_02075C38
	ldr r1, _0233AFDC @ =0x0235AAA8
_0233AF9C:
	strb r0, [r1]
	mov r0, #8
	bl ov02_023480E0
	ldr r0, _0233AFDC @ =0x0235AAA8
	ldr ip, _0233AFE0 @ =0x0235298E
	ldrb r0, [r0]
	ldr r1, _0233AFE4 @ =0x02352992
	ldr r2, _0233AFE8 @ =0x02352990
	lsl lr, r0, #3
	ldr r3, _0233AFEC @ =0x02352994
	ldrh r0, [ip, lr]
	ldrh r1, [r1, lr]
	ldrh r2, [r2, lr]
	ldrh r3, [r3, lr]
	bl ov02_023350AC
	pop {r3, pc}
	.align 2, 0
_0233AFDC: .4byte 0x0235AAA8
_0233AFE0: .4byte 0x0235298E
_0233AFE4: .4byte 0x02352992
_0233AFE8: .4byte 0x02352990
_0233AFEC: .4byte 0x02352994
	arm_func_end ov02_0233AF60

	arm_func_start ov02_0233AFF0
ov02_0233AFF0: @ 0x0233AFF0
	ldr r0, _0233B010 @ =0x0235AAA8
	ldr r1, _0233B014 @ =0x02352940
	ldrb r2, [r0]
	ldr ip, _0233B018 @ =ov02_023468A0
	ldr r0, [r0, #4]
	ldrb r1, [r1, r2]
	mov r2, r1
	bx ip
	.align 2, 0
_0233B010: .4byte 0x0235AAA8
_0233B014: .4byte 0x02352940
_0233B018: .4byte ov02_023468A0
	arm_func_end ov02_0233AFF0

	arm_func_start ov02_0233B01C
ov02_0233B01C: @ 0x0233B01C
	push {r3, lr}
	bl ov02_0233B054
	mov r0, #0x1e
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	mov r0, #1
	bl ov02_02335334
	mov r0, #0xb
	bl ov02_023480E0
	ldr r0, _0233B050 @ =ov02_0233B0D4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B050: .4byte ov02_0233B0D4
	arm_func_end ov02_0233B01C

	arm_func_start ov02_0233B054
ov02_0233B054: @ 0x0233B054
	push {r3, lr}
	ldr r0, _0233B0C4 @ =0x02353818
	ldr r1, _0233B0C8 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233B0CC @ =0x04001008
	ldr r1, _0233B0D0 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233B0C4: .4byte 0x02353818
_0233B0C8: .4byte FUN_020780D0
_0233B0CC: .4byte 0x04001008
_0233B0D0: .4byte 0x0400000A
	arm_func_end ov02_0233B054

	arm_func_start ov02_0233B0D4
ov02_0233B0D4: @ 0x0233B0D4
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233B104 @ =ov02_0233B108
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B104: .4byte ov02_0233B108
	arm_func_end ov02_0233B0D4

	arm_func_start ov02_0233B108
ov02_0233B108: @ 0x0233B108
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233B130 @ =ov02_0233B20C
	bl ov02_02339104
	ldr r0, _0233B134 @ =0x0233B138
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B130: .4byte ov02_0233B20C
_0233B134: .4byte 0x0233B138
	arm_func_end ov02_0233B108
_0233B138:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0x00, 0xEB
	.byte 0x01, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233B148
ov02_0233B148: @ 0x0233B148
	bx lr
	arm_func_end ov02_0233B148

	arm_func_start ov02_0233B14C
ov02_0233B14C: @ 0x0233B14C
	bx lr
	arm_func_end ov02_0233B14C

	arm_func_start ov02_0233B150
ov02_0233B150: @ 0x0233B150
	push {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233B174 @ =ov02_0233B178
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B174: .4byte ov02_0233B178
	arm_func_end ov02_0233B150

	arm_func_start ov02_0233B178
ov02_0233B178: @ 0x0233B178
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_023353EC
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233B1FC @ =0x0235AAB4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233B1DC
	ldr r0, _0233B200 @ =ov02_0233BC04
	bl ov02_02338D68
	pop {r3, pc}
_0233B1DC:
	cmp r0, #2
	bne _0233B1F0
	ldr r0, _0233B204 @ =ov02_0233BA1C
	bl ov02_02338D68
	pop {r3, pc}
_0233B1F0:
	ldr r0, _0233B208 @ =0x0233B294
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B1FC: .4byte 0x0235AAB4
_0233B200: .4byte ov02_0233BC04
_0233B204: .4byte ov02_0233BA1C
_0233B208: .4byte 0x0233B294
	arm_func_end ov02_0233B178

	arm_func_start ov02_0233B20C
ov02_0233B20C: @ 0x0233B20C
	push {r3, lr}
	cmp r0, #2
	bne _0233B238
	bl ov02_02347D68
	ldr r0, _0233B28C @ =0x0235AAB4
	mov r1, #1
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #0x10
	bl ov02_023480E0
	b _0233B274
_0233B238:
	cmp r0, #3
	bne _0233B25C
	ldr r0, _0233B28C @ =0x0235AAB4
	mov r1, #2
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #0x12
	bl ov02_023480E0
	b _0233B274
_0233B25C:
	ldr r0, _0233B28C @ =0x0235AAB4
	mov r1, #0
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #0x12
	bl ov02_023480E0
_0233B274:
	mov r0, #0
	bl ov02_02339104
	bl ov02_0233908C
	ldr r0, _0233B290 @ =ov02_0233B150
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B28C: .4byte 0x0235AAB4
_0233B290: .4byte ov02_0233B150
	arm_func_end ov02_0233B20C
_0233B294:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x05, 0x00, 0x00, 0xEB, 0x1F, 0x00, 0xA0, 0xE3
	.byte 0xF2, 0xE6, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xAE, 0xF6, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x1C, 0xB3, 0x33, 0x02

	arm_func_start ov02_0233B2B4
ov02_0233B2B4: @ 0x0233B2B4
	ldr r3, _0233B314 @ =0x04001008
	ldr r1, _0233B318 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0233B314: .4byte 0x04001008
_0233B318: .4byte 0x0400000A
	arm_func_end ov02_0233B2B4

	arm_func_start ov02_0233B31C
ov02_0233B31C: @ 0x0233B31C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233B34C @ =ov02_0233B350
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B34C: .4byte ov02_0233B350
	arm_func_end ov02_0233B31C

	arm_func_start ov02_0233B350
ov02_0233B350: @ 0x0233B350
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #5
	bl ov02_02334E38
	ldr r0, _0233B378 @ =0x0233B37C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B378: .4byte 0x0233B37C
	arm_func_end ov02_0233B350
_0233B37C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xD5, 0xE4, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0xEE, 0xE4, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x72, 0xF6, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xA4, 0xB3, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x09, 0x00, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233B3B8
ov02_0233B3B8: @ 0x0233B3B8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233B3B8

	arm_func_start ov02_0233B3D8
ov02_0233B3D8: @ 0x0233B3D8
	bx lr
	arm_func_end ov02_0233B3D8

	arm_func_start ov02_0233B3DC
ov02_0233B3DC: @ 0x0233B3DC
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233B400 @ =0x0233B404
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B400: .4byte 0x0233B404
	arm_func_end ov02_0233B3DC
_0233B404:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xD6, 0xE4, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xB2, 0x49, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x52, 0xF6, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x24, 0xB4, 0x33, 0x02

	arm_func_start ov02_0233B424
ov02_0233B424: @ 0x0233B424
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	mov r1, #1
	mov r2, #0x3f
	mov r3, #0x40
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x40
	bl ov02_0234D8E0
	ldr r0, _0233B46C @ =ov02_0233B470
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B46C: .4byte ov02_0233B470
	arm_func_end ov02_0233B424

	arm_func_start ov02_0233B470
ov02_0233B470: @ 0x0233B470
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0x1000000
	bl FUN_0207B854
	bl FUN_0208200C
	pop {r3, pc}
	arm_func_end ov02_0233B470

	arm_func_start ov02_0233B4A4
ov02_0233B4A4: @ 0x0233B4A4
	push {r3, lr}
	bl ov02_0233B4C4
	mov r0, #0x1a
	bl ov02_02334E70
	ldr r0, _0233B4C0 @ =ov02_0233B52C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B4C0: .4byte ov02_0233B52C
	arm_func_end ov02_0233B4A4

	arm_func_start ov02_0233B4C4
ov02_0233B4C4: @ 0x0233B4C4
	ldr r3, _0233B524 @ =0x04001008
	ldr r1, _0233B528 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0233B524: .4byte 0x04001008
_0233B528: .4byte 0x0400000A
	arm_func_end ov02_0233B4C4

	arm_func_start ov02_0233B52C
ov02_0233B52C: @ 0x0233B52C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233B55C @ =ov02_0233B560
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B55C: .4byte ov02_0233B560
	arm_func_end ov02_0233B52C

	arm_func_start ov02_0233B560
ov02_0233B560: @ 0x0233B560
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #4
	bl ov02_02334E38
	ldr r0, _0233B598 @ =0x0233B59C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B598: .4byte 0x0233B59C
	arm_func_end ov02_0233B560
_0233B59C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x4D, 0xE4, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0x66, 0xE4, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xEA, 0xF5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xC4, 0xB5, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x09, 0x00, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233B5D8
ov02_0233B5D8: @ 0x0233B5D8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233B5D8

	arm_func_start ov02_0233B5F8
ov02_0233B5F8: @ 0x0233B5F8
	bx lr
	arm_func_end ov02_0233B5F8

	arm_func_start ov02_0233B5FC
ov02_0233B5FC: @ 0x0233B5FC
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233B620 @ =0x0233B624
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B620: .4byte 0x0233B624
	arm_func_end ov02_0233B5FC
_0233B624:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x4E, 0xE4, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0x2A, 0x49, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xCA, 0xF5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x44, 0xB6, 0x33, 0x02

	arm_func_start ov02_0233B644
ov02_0233B644: @ 0x0233B644
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233B67C @ =ov02_0233B680
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B67C: .4byte ov02_0233B680
	arm_func_end ov02_0233B644

	arm_func_start ov02_0233B680
ov02_0233B680: @ 0x0233B680
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233B6CC @ =ov02_0233C364
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B6CC: .4byte ov02_0233C364
	arm_func_end ov02_0233B680

	arm_func_start ov02_0233B6D0
ov02_0233B6D0: @ 0x0233B6D0
	push {r3, lr}
	ldr r0, _0233B710 @ =0x0235AAB8
	mov r1, #0
	strb r1, [r0]
	bl ov02_0233B718
	mov r0, #0x13
	bl ov02_02335268
	mov r0, #0x3c
	sub r1, r0, #0x3d
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #0x1b
	bl ov02_02334E70
	ldr r0, _0233B714 @ =ov02_0233B798
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B710: .4byte 0x0235AAB8
_0233B714: .4byte ov02_0233B798
	arm_func_end ov02_0233B6D0

	arm_func_start ov02_0233B718
ov02_0233B718: @ 0x0233B718
	push {r3, lr}
	ldr r0, _0233B788 @ =0x0235382C
	ldr r1, _0233B78C @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233B790 @ =0x04001008
	ldr r1, _0233B794 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233B788: .4byte 0x0235382C
_0233B78C: .4byte FUN_020780D0
_0233B790: .4byte 0x04001008
_0233B794: .4byte 0x0400000A
	arm_func_end ov02_0233B718

	arm_func_start ov02_0233B798
ov02_0233B798: @ 0x0233B798
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233B7E8 @ =ov02_0233B7EC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B7E8: .4byte ov02_0233B7EC
	arm_func_end ov02_0233B798

	arm_func_start ov02_0233B7EC
ov02_0233B7EC: @ 0x0233B7EC
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov02_02334E38
	ldr r0, _0233B814 @ =0x0233B818
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B814: .4byte 0x0233B818
	arm_func_end ov02_0233B7EC
_0233B818:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xAE, 0xE3, 0xFF, 0xEB
	.byte 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0xC7, 0xE3, 0xFF, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x4B, 0xF5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x40, 0xB8, 0x33, 0x02
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233B854
ov02_0233B854: @ 0x0233B854
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233B870
	mov r0, #1
	bl ov02_023346F0
_0233B870:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233B854

	arm_func_start ov02_0233B88C
ov02_0233B88C: @ 0x0233B88C
	bx lr
	arm_func_end ov02_0233B88C

	arm_func_start ov02_0233B890
ov02_0233B890: @ 0x0233B890
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _0233B8AC
	cmp r0, #1
	beq _0233B8B8
	pop {r3, pc}
_0233B8AC:
	mov r0, #7
	bl ov02_023480E0
	b _0233B8CC
_0233B8B8:
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233B8D8 @ =0x0235AAB8
	mov r1, #1
	strb r1, [r0]
_0233B8CC:
	ldr r0, _0233B8DC @ =0x0233B8E0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B8D8: .4byte 0x0235AAB8
_0233B8DC: .4byte 0x0233B8E0
	arm_func_end ov02_0233B890
_0233B8E0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x9F, 0xE3, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x7B, 0x48, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0x1B, 0xF5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x00, 0xB9, 0x33, 0x02

	arm_func_start ov02_0233B900
ov02_0233B900: @ 0x0233B900
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _0233B95C @ =0x0235AAB8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233B93C
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0233B93C:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233B960 @ =ov02_0233B964
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233B95C: .4byte 0x0235AAB8
_0233B960: .4byte ov02_0233B964
	arm_func_end ov02_0233B900

	arm_func_start ov02_0233B964
ov02_0233B964: @ 0x0233B964
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233BA10 @ =0x0235AAB8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233B998
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_0233B998:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233BA10 @ =0x0235AAB8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233B9CC
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233B9CC:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233BA10 @ =0x0235AAB8
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _0233BA00
	bl ov02_02338D78
	ldr r0, _0233BA14 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
_0233BA00:
	bl ov02_02338D78
	ldr r0, _0233BA18 @ =ov02_0233B4A4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BA10: .4byte 0x0235AAB8
_0233BA14: .4byte ov02_0233A904
_0233BA18: .4byte ov02_0233B4A4
	arm_func_end ov02_0233B964

	arm_func_start ov02_0233BA1C
ov02_0233BA1C: @ 0x0233BA1C
	push {r3, lr}
	ldr r0, _0233BA44 @ =0x0235AABC
	mov r1, #0
	strb r1, [r0]
	bl ov02_0233BA4C
	mov r0, #0x21
	bl ov02_02334E70
	ldr r0, _0233BA48 @ =ov02_0233BAB8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BA44: .4byte 0x0235AABC
_0233BA48: .4byte ov02_0233BAB8
	arm_func_end ov02_0233BA1C

	arm_func_start ov02_0233BA4C
ov02_0233BA4C: @ 0x0233BA4C
	push {r3, lr}
	ldr r0, _0233BAA8 @ =0x02353840
	ldr r1, _0233BAAC @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r2, _0233BAB0 @ =0x04001008
	ldr r1, _0233BAB4 @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233BAA8: .4byte 0x02353840
_0233BAAC: .4byte FUN_020780D0
_0233BAB0: .4byte 0x04001008
_0233BAB4: .4byte 0x0400000A
	arm_func_end ov02_0233BA4C

	arm_func_start ov02_0233BAB8
ov02_0233BAB8: @ 0x0233BAB8
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233BAE8 @ =ov02_0233BAEC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BAE8: .4byte ov02_0233BAEC
	arm_func_end ov02_0233BAB8

	arm_func_start ov02_0233BAEC
ov02_0233BAEC: @ 0x0233BAEC
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0233BB18 @ =0x0233BB1C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BB18: .4byte 0x0233BB1C
	arm_func_end ov02_0233BAEC
_0233BB1C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x2A, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233BB2C
ov02_0233BB2C: @ 0x0233BB2C
	bx lr
	arm_func_end ov02_0233BB2C

	arm_func_start ov02_0233BB30
ov02_0233BB30: @ 0x0233BB30
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233BB68 @ =ov02_0233BB6C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BB68: .4byte ov02_0233BB6C
	arm_func_end ov02_0233BB30

	arm_func_start ov02_0233BB6C
ov02_0233BB6C: @ 0x0233BB6C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233BBCC @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BBCC: .4byte ov02_0233A904
	arm_func_end ov02_0233BB6C

	arm_func_start ov02_0233BBD0
ov02_0233BBD0: @ 0x0233BBD0
	push {r3, lr}
	ldr r0, _0233BBFC @ =0x0235AABC
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _0233BC00 @ =ov02_0233BB30
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BBFC: .4byte 0x0235AABC
_0233BC00: .4byte ov02_0233BB30
	arm_func_end ov02_0233BBD0

	arm_func_start ov02_0233BC04
ov02_0233BC04: @ 0x0233BC04
	push {r3, lr}
	bl ov02_0233BC40
	mov r0, #0x20
	bl ov02_02334E70
	mov r0, #0x3c
	sub r1, r0, #0x3d
	mov r2, #0
	bl ov02_02334C3C
	ldr r1, _0233BC38 @ =0x0235AAC0
	strb r0, [r1]
	ldr r0, _0233BC3C @ =ov02_0233BCC0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BC38: .4byte 0x0235AAC0
_0233BC3C: .4byte ov02_0233BCC0
	arm_func_end ov02_0233BC04

	arm_func_start ov02_0233BC40
ov02_0233BC40: @ 0x0233BC40
	push {r3, lr}
	ldr r0, _0233BCB0 @ =0x02353854
	ldr r1, _0233BCB4 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233BCB8 @ =0x04001008
	ldr r1, _0233BCBC @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233BCB0: .4byte 0x02353854
_0233BCB4: .4byte FUN_020780D0
_0233BCB8: .4byte 0x04001008
_0233BCBC: .4byte 0x0400000A
	arm_func_end ov02_0233BC40

	arm_func_start ov02_0233BCC0
ov02_0233BCC0: @ 0x0233BCC0
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233BD20 @ =0x0235AAC0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0233BD14
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
_0233BD14:
	ldr r0, _0233BD24 @ =ov02_0233BD28
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BD20: .4byte 0x0235AAC0
_0233BD24: .4byte ov02_0233BD28
	arm_func_end ov02_0233BCC0

	arm_func_start ov02_0233BD28
ov02_0233BD28: @ 0x0233BD28
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov02_02334E38
	ldr r0, _0233BD60 @ =ov02_0233BD64
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BD60: .4byte ov02_0233BD64
	arm_func_end ov02_0233BD28

	arm_func_start ov02_0233BD64
ov02_0233BD64: @ 0x0233BD64
	push {r3, lr}
	bl ov02_023346DC
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_02334750
	ldr r0, _0233BD94 @ =0x0233BD98
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BD94: .4byte 0x0233BD98
	arm_func_end ov02_0233BD64
_0233BD98:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233BDAC
ov02_0233BDAC: @ 0x0233BDAC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233BDC8
	mov r0, #1
	bl ov02_023346F0
_0233BDC8:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233BDAC

	arm_func_start ov02_0233BDE4
ov02_0233BDE4: @ 0x0233BDE4
	bx lr
	arm_func_end ov02_0233BDE4

	arm_func_start ov02_0233BDE8
ov02_0233BDE8: @ 0x0233BDE8
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _0233BE18
	cmp r0, #1
	popne {r3, pc}
	ldr r1, _0233BE38 @ =0x0235AAC0
	mov r2, #1
	mov r0, #6
	strb r2, [r1, #1]
	bl ov02_023480E0
	b _0233BE2C
_0233BE18:
	ldr r1, _0233BE38 @ =0x0235AAC0
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov02_023480E0
_0233BE2C:
	ldr r0, _0233BE3C @ =0x0233BE40
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BE38: .4byte 0x0235AAC0
_0233BE3C: .4byte 0x0233BE40
	arm_func_end ov02_0233BDE8
_0233BE40:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x47, 0xE2, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x23, 0x47, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xC3, 0xF3, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x60, 0xBE, 0x33, 0x02

	arm_func_start ov02_0233BE60
ov02_0233BE60: @ 0x0233BE60
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _0233BEBC @ =0x0235AAC0
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233BE9C
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0233BE9C:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233BEC0 @ =ov02_0233BEC4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BEBC: .4byte 0x0235AAC0
_0233BEC0: .4byte ov02_0233BEC4
	arm_func_end ov02_0233BE60

	arm_func_start ov02_0233BEC4
ov02_0233BEC4: @ 0x0233BEC4
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233BF60 @ =0x0235AAC0
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233BF1C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233BF1C:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233BF60 @ =0x0235AAC0
	mov r1, #1
	ldrb r0, [r0, #1]
	cmp r0, #0
	mov r0, #0
	bne _0233BF50
	bl ov02_02338D78
	ldr r0, _0233BF64 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
_0233BF50:
	bl ov02_02338D78
	ldr r0, _0233BF68 @ =ov02_0233C364
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233BF60: .4byte 0x0235AAC0
_0233BF64: .4byte ov02_0233A904
_0233BF68: .4byte ov02_0233C364
	arm_func_end ov02_0233BEC4

	arm_func_start ov02_0233BF6C
ov02_0233BF6C: @ 0x0233BF6C
	push {r3, r4, r5, lr}
	sub sp, sp, #0x28
	bl ov02_02339128
	mov r5, r0
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	ldr r1, _0233C030 @ =0x0235AAC4
	mov r2, #0
	strb r2, [r1, #1]
	mov r4, r0
	strb r2, [r1]
	bl ov02_0233C03C
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #0x16
	bl FUN_0207C2B8
	ldrb r2, [r5, #1]
	add r0, r5, #2
	add r1, sp, #0x10
	lsl r2, r2, #1
	bl FUN_0207C2E0
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x480
	str r0, [sp, #8]
	add r1, sp, #0x10
	str r1, [sp, #0xc]
	mov r0, r4
	mov r1, #8
	mov r2, #0x35
	mov r3, #0xf0
	bl ov02_0234E1E8
	mov r0, r4
	bl ov02_0234E354
	ldr r0, _0233C034 @ =0x0233C330
	bl ov02_02339104
	mov r1, #4
	mov r2, #0
	mov r0, #0x1d
	sub r3, r1, #5
	str r2, [sp]
	bl ov02_02349394
	ldr r0, _0233C038 @ =ov02_0233C0BC
	bl ov02_02338D68
	add sp, sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233C030: .4byte 0x0235AAC4
_0233C034: .4byte 0x0233C330
_0233C038: .4byte ov02_0233C0BC
	arm_func_end ov02_0233BF6C

	arm_func_start ov02_0233C03C
ov02_0233C03C: @ 0x0233C03C
	push {r3, lr}
	ldr r0, _0233C0AC @ =0x02353868
	ldr r1, _0233C0B0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233C0B4 @ =0x04001008
	ldr r1, _0233C0B8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233C0AC: .4byte 0x02353868
_0233C0B0: .4byte FUN_020780D0
_0233C0B4: .4byte 0x04001008
_0233C0B8: .4byte 0x0400000A
	arm_func_end ov02_0233C03C

	arm_func_start ov02_0233C0BC
ov02_0233C0BC: @ 0x0233C0BC
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233C0EC @ =0x0233C0F0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C0EC: .4byte 0x0233C0F0
	arm_func_end ov02_0233C0BC
_0233C0F0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0xEF, 0x45, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x16, 0xF3, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x14, 0xC1, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x79, 0x35, 0x00, 0xEB, 0x01, 0x10, 0xE0, 0xE3
	.byte 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0x04, 0x00, 0x9F, 0xE5, 0x0D, 0xF3, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x38, 0xC1, 0x33, 0x02

	arm_func_start ov02_0233C138
ov02_0233C138: @ 0x0233C138
	push {r3, lr}
	bl ov02_0233C1A8
	bl ov02_0233C1AC
	bl ov02_02349704
	cmp r0, #0
	beq _0233C15C
	cmp r0, #1
	beq _0233C174
	pop {r3, pc}
_0233C15C:
	ldr r1, _0233C1A0 @ =0x0235AAC4
	mov r2, #0
	mov r0, #7
	strb r2, [r1, #1]
	bl ov02_023480E0
	b _0233C188
_0233C174:
	ldr r1, _0233C1A0 @ =0x0235AAC4
	mov r2, #1
	mov r0, #0xe
	strb r2, [r1, #1]
	bl ov02_023480E0
_0233C188:
	mov r0, #0
	bl ov02_02339104
	bl ov02_023496C0
	ldr r0, _0233C1A4 @ =ov02_0233C1B0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C1A0: .4byte 0x0235AAC4
_0233C1A4: .4byte ov02_0233C1B0
	arm_func_end ov02_0233C138

	arm_func_start ov02_0233C1A8
ov02_0233C1A8: @ 0x0233C1A8
	bx lr
	arm_func_end ov02_0233C1A8

	arm_func_start ov02_0233C1AC
ov02_0233C1AC: @ 0x0233C1AC
	bx lr
	arm_func_end ov02_0233C1AC

	arm_func_start ov02_0233C1B0
ov02_0233C1B0: @ 0x0233C1B0
	push {r3, lr}
	bl ov02_02349718
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233C204 @ =0x0235AAC4
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233C1E4
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0233C1E4:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233C208 @ =ov02_0233C20C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C204: .4byte 0x0235AAC4
_0233C208: .4byte ov02_0233C20C
	arm_func_end ov02_0233C1B0

	arm_func_start ov02_0233C20C
ov02_0233C20C: @ 0x0233C20C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233C260 @ =0x0235AAC4
	ldrb r1, [r0]
	cmp r1, #0
	ldrbeq r0, [r0, #1]
	cmpeq r0, #1
	bne _0233C250
	bl ov02_0234BFC8
	b _0233C254
_0233C250:
	bl ov02_0233908C
_0233C254:
	ldr r0, _0233C264 @ =ov02_0233C268
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C260: .4byte 0x0235AAC4
_0233C264: .4byte ov02_0233C268
	arm_func_end ov02_0233C20C

	arm_func_start ov02_0233C268
ov02_0233C268: @ 0x0233C268
	push {r3, lr}
	ldr r0, _0233C320 @ =0x0235AAC4
	ldrb r1, [r0]
	cmp r1, #0
	bne _0233C288
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233C294
_0233C288:
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
_0233C294:
	mov r0, #0
	bl ov02_0234E02C
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233C320 @ =0x0235AAC4
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233C2C8
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233C2C8:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233C320 @ =0x0235AAC4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0233C2F0
	ldr r0, _0233C324 @ =ov02_0233BC04
	bl ov02_02338D68
	pop {r3, pc}
_0233C2F0:
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0233C314
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	ldr r0, _0233C328 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
_0233C314:
	ldr r0, _0233C32C @ =ov02_0233B01C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C320: .4byte 0x0235AAC4
_0233C324: .4byte ov02_0233BC04
_0233C328: .4byte ov02_0233A904
_0233C32C: .4byte ov02_0233B01C
	arm_func_end ov02_0233C268
_0233C330:
	.byte 0x08, 0x00, 0x9F, 0xE5, 0x01, 0x10, 0xA0, 0xE3, 0x00, 0x10, 0xC0, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1
	.byte 0xC4, 0xAA, 0x35, 0x02

	arm_func_start ov02_0233C344
ov02_0233C344: @ 0x0233C344
	ldr r0, _0233C360 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0233C360: .4byte 0x027FFFA8
	arm_func_end ov02_0233C344

	arm_func_start ov02_0233C364
ov02_0233C364: @ 0x0233C364
	push {r3, lr}
	ldr r0, _0233C3A4 @ =ov02_0233C6E0
	bl ov02_02338FA0
	ldr r0, _0233C3A8 @ =0x0235AAC8
	mov r1, #0
	strb r1, [r0]
	bl ov02_0233C3B0
	mov r0, #0x1c
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	mov r0, #0xb
	bl ov02_023480E0
	ldr r0, _0233C3AC @ =ov02_0233C430
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C3A4: .4byte ov02_0233C6E0
_0233C3A8: .4byte 0x0235AAC8
_0233C3AC: .4byte ov02_0233C430
	arm_func_end ov02_0233C364

	arm_func_start ov02_0233C3B0
ov02_0233C3B0: @ 0x0233C3B0
	push {r3, lr}
	ldr r0, _0233C420 @ =0x0235387C
	ldr r1, _0233C424 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233C428 @ =0x04001008
	ldr r1, _0233C42C @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233C420: .4byte 0x0235387C
_0233C424: .4byte FUN_020780D0
_0233C428: .4byte 0x04001008
_0233C42C: .4byte 0x0400000A
	arm_func_end ov02_0233C3B0

	arm_func_start ov02_0233C430
ov02_0233C430: @ 0x0233C430
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233C460 @ =ov02_0233C464
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C460: .4byte ov02_0233C464
	arm_func_end ov02_0233C430

	arm_func_start ov02_0233C464
ov02_0233C464: @ 0x0233C464
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _0233C48C @ =0x0233C490
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C48C: .4byte 0x0233C490
	arm_func_end ov02_0233C464
_0233C490:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x90, 0xE0, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0x04, 0x00, 0x9F, 0xE5, 0x2E, 0xF2, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xB4, 0xC4, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233C4C8
ov02_0233C4C8: @ 0x0233C4C8
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233C4E8
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_0233C4E8:
	bl ov02_0233C344
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233C4C8

	arm_func_start ov02_0233C500
ov02_0233C500: @ 0x0233C500
	bx lr
	arm_func_end ov02_0233C500

	arm_func_start ov02_0233C504
ov02_0233C504: @ 0x0233C504
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _0233C52C @ =ov02_0233C530
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C52C: .4byte ov02_0233C530
	arm_func_end ov02_0233C504

	arm_func_start ov02_0233C530
ov02_0233C530: @ 0x0233C530
	push {r3, lr}
	ldr r0, _0233C560 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C548
	bl ov02_0233908C
_0233C548:
	bl ov02_02334768
	mov r0, #8
	bl ov02_0234DAE0
	ldr r0, _0233C564 @ =ov02_0233C568
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C560: .4byte 0x0235AAC8
_0233C564: .4byte ov02_0233C568
	arm_func_end ov02_0233C530

	arm_func_start ov02_0233C568
ov02_0233C568: @ 0x0233C568
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233C5E0 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C598
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
_0233C598:
	bl ov02_023346AC
	ldr r0, _0233C5E0 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C5C0
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0233C5C0:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233C5E4 @ =ov02_0233C5E8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C5E0: .4byte 0x0235AAC8
_0233C5E4: .4byte ov02_0233C5E8
	arm_func_end ov02_0233C568

	arm_func_start ov02_0233C5E8
ov02_0233C5E8: @ 0x0233C5E8
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233C6D0 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C61C
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_0233C61C:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0233C6D0 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C644
	bl ov02_023390E8
	cmp r0, #0
	popeq {r3, pc}
_0233C644:
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233C6D0 @ =0x0235AAC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C670
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233C670:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233C6D0 @ =0x0235AAC8
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233C6A4
	mov r0, #0
	bl ov02_02338D78
	ldr r0, _0233C6D4 @ =ov02_0233A904
	bl ov02_02338D68
	pop {r3, pc}
_0233C6A4:
	cmp r0, #2
	mov r0, #0
	bne _0233C6C0
	bl ov02_02338D78
	ldr r0, _0233C6D8 @ =ov02_0233BC04
	bl ov02_02338D68
	pop {r3, pc}
_0233C6C0:
	bl ov02_02338D78
	ldr r0, _0233C6DC @ =ov02_0233BF6C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C6D0: .4byte 0x0235AAC8
_0233C6D4: .4byte ov02_0233A904
_0233C6D8: .4byte ov02_0233BC04
_0233C6DC: .4byte ov02_0233BF6C
	arm_func_end ov02_0233C5E8

	arm_func_start ov02_0233C6E0
ov02_0233C6E0: @ 0x0233C6E0
	push {r4, lr}
	mov r4, r0
	bl ov02_02348148
	cmp r4, #0
	bne _0233C70C
	ldr r1, _0233C734 @ =0x0235AAC8
	mov r2, #1
	mov r0, #0x10
	strb r2, [r1]
	bl ov02_023480E0
	b _0233C720
_0233C70C:
	ldr r1, _0233C734 @ =0x0235AAC8
	mov r2, #2
	mov r0, #0x12
	strb r2, [r1]
	bl ov02_023480E0
_0233C720:
	mov r0, #0
	bl ov02_02339104
	ldr r0, _0233C738 @ =ov02_0233C530
	bl ov02_02338D68
	pop {r4, pc}
	.align 2, 0
_0233C734: .4byte 0x0235AAC8
_0233C738: .4byte ov02_0233C530
	arm_func_end ov02_0233C6E0

	arm_func_start ov02_0233C73C
ov02_0233C73C: @ 0x0233C73C
	ldr r0, _0233C758 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_0233C758: .4byte 0x027FFFA8
	arm_func_end ov02_0233C73C

	arm_func_start ov02_0233C75C
ov02_0233C75C: @ 0x0233C75C
	push {r3, lr}
	ldr r0, _0233C7B4 @ =0x0235AACC
	mov r1, #0
	strh r1, [r0, #2]
	bl ov02_0233C7BC
	bl ov02_023352C4
	mov r0, #0x36
	sub r1, r0, #0x37
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #2
	bl ov02_02334DE8
	mov r0, #0x22
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	bl ov02_023386D8
	mov r0, #0xb
	bl ov02_023480E0
	ldr r0, _0233C7B8 @ =ov02_0233C864
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C7B4: .4byte 0x0235AACC
_0233C7B8: .4byte ov02_0233C864
	arm_func_end ov02_0233C75C

	arm_func_start ov02_0233C7BC
ov02_0233C7BC: @ 0x0233C7BC
	push {r3, lr}
	ldr r0, _0233C844 @ =0x02353890
	ldr r1, _0233C848 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _0233C84C @ =0x023538A8
	ldr r1, _0233C850 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _0233C854 @ =0x023538C0
	ldr r1, _0233C858 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233C85C @ =0x04001008
	ldr r1, _0233C860 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233C844: .4byte 0x02353890
_0233C848: .4byte 0x02078310
_0233C84C: .4byte 0x023538A8
_0233C850: .4byte FUN_02077CF8
_0233C854: .4byte 0x023538C0
_0233C858: .4byte FUN_020780D0
_0233C85C: .4byte 0x04001008
_0233C860: .4byte 0x0400000A
	arm_func_end ov02_0233C7BC

	arm_func_start ov02_0233C864
ov02_0233C864: @ 0x0233C864
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233C8B4 @ =ov02_0233C8B8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C8B4: .4byte ov02_0233C8B8
	arm_func_end ov02_0233C864

	arm_func_start ov02_0233C8B8
ov02_0233C8B8: @ 0x0233C8B8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _0233C8F0 @ =ov02_0233C8F4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C8F0: .4byte ov02_0233C8F4
	arm_func_end ov02_0233C8B8

	arm_func_start ov02_0233C8F4
ov02_0233C8F4: @ 0x0233C8F4
	push {r3, lr}
	bl ov02_023346DC
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	ldr r1, _0233C930 @ =0x0233CC14
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233C934 @ =0x0235AACC
	str r0, [r1, #4]
	ldr r0, _0233C938 @ =ov02_0233C93C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233C930: .4byte 0x0233CC14
_0233C934: .4byte 0x0235AACC
_0233C938: .4byte ov02_0233C93C
	arm_func_end ov02_0233C8F4

	arm_func_start ov02_0233C93C
ov02_0233C93C: @ 0x0233C93C
	push {r3, lr}
	bl ov02_0233CA10
	bl ov02_0233CA48
	bl ov02_0233CA4C
	bl ov02_02338838
	cmp r0, #0
	popeq {r3, pc}
	cmp r0, #1
	beq _0233C96C
	cmp r0, #2
	beq _0233C9A0
	pop {r3, pc}
_0233C96C:
	ldr r2, _0233CA04 @ =0x0235AACC
	ldr r1, [r2, #4]
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #1
	strb r0, [r2]
	bl ov02_0234FB6C
	ldr r1, _0233CA04 @ =0x0235AACC
	mov r2, #0
	ldr r0, _0233CA08 @ =ov02_0233CC7C
	str r2, [r1, #4]
	bl ov02_02338D68
	pop {r3, pc}
_0233C9A0:
	ldr r0, _0233CA04 @ =0x0235AACC
	ldr r0, [r0, #4]
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_02348148
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xc
	str ip, [sp]
	bl ov02_02349394
	mov r0, #9
	bl ov02_023480E0
	bl ov02_02334768
	ldr r1, _0233CA04 @ =0x0235AACC
	mov r0, #1
	ldr r1, [r1, #4]
	bl ov02_0234FB6C
	ldr r1, _0233CA04 @ =0x0235AACC
	mov r2, #0
	ldr r0, _0233CA0C @ =ov02_0233CC30
	str r2, [r1, #4]
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CA04: .4byte 0x0235AACC
_0233CA08: .4byte ov02_0233CC7C
_0233CA0C: .4byte ov02_0233CC30
	arm_func_end ov02_0233C93C

	arm_func_start ov02_0233CA10
ov02_0233CA10: @ 0x0233CA10
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233CA30
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_0233CA30:
	bl ov02_0233C73C
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0233CA10

	arm_func_start ov02_0233CA48
ov02_0233CA48: @ 0x0233CA48
	bx lr
	arm_func_end ov02_0233CA48

	arm_func_start ov02_0233CA4C
ov02_0233CA4C: @ 0x0233CA4C
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233CA90 @ =0x0235AACC
	ldr r1, [r0, #4]
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #1
	bl ov02_0234FB40
	ldr r0, _0233CA90 @ =0x0235AACC
	mov r1, #0
	str r1, [r0, #4]
	bl ov02_02334768
	ldr r0, _0233CA94 @ =ov02_0233CCC8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CA90: .4byte 0x0235AACC
_0233CA94: .4byte ov02_0233CCC8
	arm_func_end ov02_0233CA4C

	arm_func_start ov02_0233CA98
ov02_0233CA98: @ 0x0233CA98
	push {r3, lr}
	bl ov02_02334768
	ldr r0, _0233CACC @ =0x0235AACC
	ldr r1, [r0, #4]
	arm_func_end ov02_0233CA98

	arm_func_start ov02_0233CAA8
ov02_0233CAA8: @ 0x0233CAA8
	cmp r1, #0
	beq _0233CAB8
	mov r0, #1
	bl ov02_0234FB6C
_0233CAB8:
	mov r0, #8
	bl ov02_0234DAE0
	ldr r0, _0233CAD0 @ =ov02_0233CAD4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CACC: .4byte 0x0235AACC
_0233CAD0: .4byte ov02_0233CAD4
	arm_func_end ov02_0233CAA8

	arm_func_start ov02_0233CAD4
ov02_0233CAD4: @ 0x0233CAD4
	push {r3, lr}
	arm_func_end ov02_0233CAD4

	arm_func_start ov02_0233CAD8
ov02_0233CAD8: @ 0x0233CAD8
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _0233CB30 @ =0x0235AACC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233CB10
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	arm_func_end ov02_0233CAD8
_0233CB10:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233CB34 @ =ov02_0233CB38
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CB30: .4byte 0x0235AACC
_0233CB34: .4byte ov02_0233CB38

	arm_func_start ov02_0233CB38
ov02_0233CB38: @ 0x0233CB38
	push {r3, lr}
	arm_func_end ov02_0233CB38

	arm_func_start ov02_0233CB3C
ov02_0233CB3C: @ 0x0233CB3C
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233CC08 @ =0x0235AACC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233CB6C
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_0233CB6C:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0233CC08 @ =0x0235AACC
	ldrb r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bl ov02_023387E8
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233CC08 @ =0x0235AACC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233CBBC
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_0233CBBC:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _0233CC08 @ =0x0235AACC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0233CBF0
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233CC0C @ =ov02_02344AF0
	bl ov02_02338D68
	pop {r3, pc}
_0233CBF0:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _0233CC10 @ =ov02_0233CCF8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CC08: .4byte 0x0235AACC
_0233CC0C: .4byte ov02_02344AF0
_0233CC10: .4byte ov02_0233CCF8
	arm_func_end ov02_0233CB3C
_0233CC14:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x3B, 0x47, 0x00, 0xEB, 0x00, 0x00, 0xA0, 0xE3
	.byte 0x70, 0x4B, 0x00, 0xEB, 0x79, 0xFF, 0xFF, 0xEB, 0x87, 0xFF, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233CC30
ov02_0233CC30: @ 0x0233CC30
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _0233CC58 @ =0x0233CC5C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CC58: .4byte 0x0233CC5C
	arm_func_end ov02_0233CC30
_0233CC5C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xAC, 0x32, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x3C, 0xF0, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x98, 0xCA, 0x33, 0x02

	arm_func_start ov02_0233CC7C
ov02_0233CC7C: @ 0x0233CC7C
	push {r3, lr}
	bl ov02_0233CA10
	bl ov02_0233CA48
	bl ov02_0233CA4C
	ldr r1, _0233CCBC @ =0x0235AACC
	ldr r0, _0233CCC0 @ =0x00000438
	ldrh r2, [r1, #2]
	add r2, r2, #1
	strh r2, [r1, #2]
	ldrh r1, [r1, #2]
	cmp r1, r0
	poplo {r3, pc}
	bl ov02_02348148
	ldr r0, _0233CCC4 @ =ov02_0233CA98
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CCBC: .4byte 0x0235AACC
_0233CCC0: .4byte 0x00000438
_0233CCC4: .4byte ov02_0233CA98
	arm_func_end ov02_0233CC7C

	arm_func_start ov02_0233CCC8
ov02_0233CCC8: @ 0x0233CCC8
	push {r3, lr}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r1, _0233CCF0 @ =0x0235AACC
	mov r2, #0
	ldr r0, _0233CCF4 @ =ov02_0233CA98
	strb r2, [r1]
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CCF0: .4byte 0x0235AACC
_0233CCF4: .4byte ov02_0233CA98
	arm_func_end ov02_0233CCC8

	arm_func_start ov02_0233CCF8
ov02_0233CCF8: @ 0x0233CCF8
	push {r3, lr}
	ldr r0, _0233CD2C @ =0x0235AAD4
	mov r1, #0
	strb r1, [r0]
_0233CD08:
	bl ov02_0233CD34
	bl ov02_023352C4
	mov r0, #0x23
	bl ov02_02334E70
	mov r0, #0x10
	bl ov02_023480E0
	ldr r0, _0233CD30 @ =ov02_0233CDA0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CD2C: .4byte 0x0235AAD4
_0233CD30: .4byte ov02_0233CDA0
	arm_func_end ov02_0233CCF8

	arm_func_start ov02_0233CD34
ov02_0233CD34: @ 0x0233CD34
	push {r3, lr}
	ldr r0, _0233CD90 @ =0x023538D4
	ldr r1, _0233CD94 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r2, _0233CD98 @ =0x04001008
	ldr r1, _0233CD9C @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233CD90: .4byte 0x023538D4
_0233CD94: .4byte FUN_020780D0
_0233CD98: .4byte 0x04001008
_0233CD9C: .4byte 0x0400000A
	arm_func_end ov02_0233CD34

	arm_func_start ov02_0233CDA0
ov02_0233CDA0: @ 0x0233CDA0
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233CDD0 @ =0x0233CDD4
	arm_func_end ov02_0233CDA0

	arm_func_start ov02_0233CDC8
ov02_0233CDC8: @ 0x0233CDC8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CDD0: .4byte 0x0233CDD4
	arm_func_end ov02_0233CDC8
_0233CDD4:
	.byte 0x08, 0x40, 0x2D, 0xE9

	arm_func_start ov02_0233CDD8
ov02_0233CDD8: @ 0x0233CDD8
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	arm_func_end ov02_0233CDD8

	arm_func_start ov02_0233CDE4
ov02_0233CDE4: @ 0x0233CDE4
	popne {r3, pc}
	ldr r0, _0233CDF4 @ =0x0233CDF8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CDF4: .4byte 0x0233CDF8
	arm_func_end ov02_0233CDE4
_0233CDF8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x2D, 0x00, 0x00, 0xEB
	.byte 0x00, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233CE08
ov02_0233CE08: @ 0x0233CE08
	bx lr
	arm_func_end ov02_0233CE08

	arm_func_start ov02_0233CE0C
ov02_0233CE0C: @ 0x0233CE0C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233CE44 @ =ov02_0233CE48
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CE44: .4byte ov02_0233CE48
	arm_func_end ov02_0233CE0C

	arm_func_start ov02_0233CE48
ov02_0233CE48: @ 0x0233CE48
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	mov r0, #0
	mov r1, #1
	bl ov02_02338DB4
	ldr r0, _0233CEB4 @ =ov02_02345968
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CEB4: .4byte ov02_02345968
	arm_func_end ov02_0233CE48

	arm_func_start ov02_0233CEB8
ov02_0233CEB8: @ 0x0233CEB8
	push {r3, lr}
	ldr r0, _0233CEE4 @ =0x0235AAD4
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _0233CEE8 @ =ov02_0233CE0C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CEE4: .4byte 0x0235AAD4
_0233CEE8: .4byte ov02_0233CE0C
	arm_func_end ov02_0233CEB8

	arm_func_start ov02_0233CEEC
ov02_0233CEEC: @ 0x0233CEEC
	push {r3, lr}
	mov r0, #0x5c
	mov r1, #4
	bl ov02_0234E7B4
	ldr r2, _0233CFB8 @ =0x0235AAD8
	mov r1, #0
	str r0, [r2, #4]
	add r0, sp, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	bne _0233CF2C
	ldr r0, _0233CFB8 @ =0x0235AAD8
	mov r1, #0
	strb r1, [r0]
	strh r1, [r0, #2]
_0233CF2C:
	ldr r0, _0233CFB8 @ =0x0235AAD8
	ldr r0, [r0, #4]
	bl ov02_0234722C
	ldr r1, _0233CFB8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	strb r0, [r1, #0x51]
	bl ov02_0233CFC4
	bl ov02_023352C4
	mov r0, #0x34
	sub r1, r0, #0x35
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #2
	bl ov02_02334DE8
	bl ov02_0233D118
	bl ov02_0233D1C0
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	ldr r2, _0233CFB8 @ =0x0235AAD8
	ldr r1, _0233CFBC @ =ov02_0233E118
	ldr r3, [r2, #4]
	mov r2, #0
	str r0, [r3, #0xc]
	mov r0, #1
	mov r3, #0x6e
	bl ov02_0234FA98
	ldr r1, _0233CFB8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x3c]
	bl ov02_0233DC5C
	bl ov02_0233E174
	ldr r0, _0233CFC0 @ =ov02_0233D334
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233CFB8: .4byte 0x0235AAD8
_0233CFBC: .4byte ov02_0233E118
_0233CFC0: .4byte ov02_0233D334
	arm_func_end ov02_0233CEEC

	arm_func_start ov02_0233CFC4
ov02_0233CFC4: @ 0x0233CFC4
	push {r3, lr}
	sub sp, sp, #0x30
	ldr r3, _0233D0FC @ =0x023529BF
	add lr, sp, #0x16
	mov r2, #0xc
_0233CFD8:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [lr]
	strb r0, [lr, #1]
	add lr, lr, #2
	subs r2, r2, #1
	bne _0233CFD8
	ldrb r0, [r3]
	ldr ip, _0233D100 @ =0x023529A9
	add r3, sp, #0
	strb r0, [lr]
	mov r2, #0xb
_0233D00C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0233D00C
	ldr r0, _0233D104 @ =0x023538E8
	ldr r1, _0233D108 @ =0x02078130
	bl ov02_02334DA8
	add r0, sp, #0x16
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _0233D10C @ =0x0235AAD8
	ldr r2, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #4]
	ldr r0, [r0, #4]
	bl ov02_02346750
	bl ov02_023467DC
	add r0, sp, #0
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _0233D10C @ =0x0235AAD8
	ldr r3, _0233D110 @ =0x04001008
	ldr r1, [r1, #4]
	sub r2, r3, #0x1000
	str r0, [r1, #8]
	ldrh r0, [r3]
	ldr r1, _0233D114 @ =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1, #4]
	add sp, sp, #0x30
	pop {r3, pc}
	.align 2, 0
_0233D0FC: .4byte 0x023529BF
_0233D100: .4byte 0x023529A9
_0233D104: .4byte 0x023538E8
_0233D108: .4byte 0x02078130
_0233D10C: .4byte 0x0235AAD8
_0233D110: .4byte 0x04001008
_0233D114: .4byte 0x0400000A
	arm_func_end ov02_0233CFC4

	arm_func_start ov02_0233D118
ov02_0233D118: @ 0x0233D118
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _0233D1BC @ =0x0235AAD8
	mov r1, #0x1c
	ldr ip, [r2, #4]
	mov r0, #0
	ldrb r3, [ip, #0x51]
	sub r3, r3, #4
	mul r1, r3, r1
	strh r1, [ip, #0x40]
	ldr r2, [r2, #4]
	ldrb r1, [r2, #0x51]
	cmp r1, #4
	movls r4, r0
	strbls r0, [r2, #0x53]
	bls _0233D178
	cmp r1, #8
	movhi r1, #0x37
	strbhi r1, [r2, #0x53]
	movhi r4, #2
	bhi _0233D178
	mov r1, #0x1f
	strb r1, [r2, #0x53]
	mov r4, #1
_0233D178:
	cmp r4, #0
	beq _0233D19C
	ldr r0, _0233D1BC @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_02075BFC
_0233D19C:
	str r0, [sp]
	mov r0, r4
	mov r1, #0x55
	mov r2, #0xec
	mov r3, #0x3f
	bl ov02_02346964
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0233D1BC: .4byte 0x0235AAD8
	arm_func_end ov02_0233D118

	arm_func_start ov02_0233D1C0
ov02_0233D1C0: @ 0x0233D1C0
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0233D324 @ =0x0235AAD8
	mov sb, #0
	ldr r0, [r0, #4]
	ldrb r8, [r0, #0x51]
	cmp r8, #5
	movgt r8, #5
	cmp r8, #0
	ble _0233D234
	ldr sl, _0233D324 @ =0x0235AAD8
	mov r7, sb
	mov r6, #0x2e
	mov r5, sb
	mov r4, #0x18
_0233D1F8:
	mov r0, r7
	mov r1, r6
	bl ov02_0234D6AC
	ldr r2, [sl, #4]
	mov r1, r4
	add r2, r2, sb, lsl #2
	str r0, [r2, #0x10]
	mov r0, r5
	bl ov02_0234D6AC
	ldr r1, [sl, #4]
	add r1, r1, sb, lsl #2
	add sb, sb, #1
	str r0, [r1, #0x24]
	cmp sb, r8
	blt _0233D1F8
_0233D234:
	mov r6, #0
	ldr r5, _0233D328 @ =0x02352A28
	ldr sb, _0233D324 @ =0x0235AAD8
	ldr r7, _0233D32C @ =0x000003FF
	mov r4, r6
_0233D248:
	ldr r0, [sb, #4]
	ldrb r1, [r5], #1
	ldr r2, [r0, #0x10]
	mov r0, r4
	bl ov02_0234D618
	ldr r0, [sb, #4]
	ldr r1, [r0, #0x10]
	add r0, r0, r6, lsl #1
	ldrh r1, [r1, #4]
	add r6, r6, #1
	cmp r6, #3
	and r1, r1, r7
	strh r1, [r0, #0x42]
	blo _0233D248
	mov r6, #0
	ldr r5, _0233D330 @ =0x02352A2C
	ldr sb, _0233D324 @ =0x0235AAD8
	ldr r7, _0233D32C @ =0x000003FF
	mov r4, r6
_0233D294:
	ldr r0, [sb, #4]
	ldrb r1, [r5], #1
	ldr r2, [r0, #0x24]
	mov r0, r4
	bl ov02_0234D618
	ldr r0, [sb, #4]
	ldr r1, [r0, #0x24]
	add r0, r0, r6, lsl #1
	ldrh r1, [r1, #4]
	add r6, r6, #1
	cmp r6, #4
	and r1, r1, r7
	strh r1, [r0, #0x48]
	blo _0233D294
	cmp r8, #0
	mov r0, #0
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0233D324 @ =0x0235AAD8
_0233D2DC:
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #2
	ldr r3, [r2, #0x10]
	ldrh r2, [r3, #4]
	bic r2, r2, #0xc00
	orr r2, r2, #0xc00
	strh r2, [r3, #4]
	ldr r2, [r1, #4]
	add r2, r2, r0, lsl #2
	ldr r3, [r2, #0x24]
	add r0, r0, #1
	ldrh r2, [r3, #4]
	cmp r0, r8
	bic r2, r2, #0xc00
	orr r2, r2, #0xc00
	strh r2, [r3, #4]
	blt _0233D2DC
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0233D324: .4byte 0x0235AAD8
_0233D328: .4byte 0x02352A28
_0233D32C: .4byte 0x000003FF
_0233D330: .4byte 0x02352A2C
	arm_func_end ov02_0233D1C0

	arm_func_start ov02_0233D334
ov02_0233D334: @ 0x0233D334
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x1d
	bl ov02_0234E3D0
	ldr r0, _0233D384 @ =ov02_0233D388
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233D384: .4byte ov02_0233D388
	arm_func_end ov02_0233D334

	arm_func_start ov02_0233D388
ov02_0233D388: @ 0x0233D388
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_02334E38
	ldr r0, _0233D3C0 @ =0x0233D3C4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233D3C0: .4byte 0x0233D3C4
	arm_func_end ov02_0233D388
_0233D3C4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xC3, 0xDC, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3
	.byte 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0xDC, 0xDC, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x60, 0xEE, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xEC, 0xD3, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x02, 0x00, 0x00, 0xEB, 0x96, 0x00, 0x00, 0xEB, 0x31, 0x01, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233D400
ov02_0233D400: @ 0x0233D400
	push {r3, r4, r5, lr}
	ldr r0, _0233D648 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x57]
	cmpeq r0, #0
	popne {r3, r4, r5, pc}
	ldr r0, _0233D64C @ =0x02352F34
	bl ov02_0234ED04
	cmp r0, #0
	beq _0233D498
	ldr r0, _0233D648 @ =0x0235AAD8
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r5, _0233D650 @ =0x023529D8
	strb r1, [r0, #0x50]
	mov r4, #0
_0233D448:
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _0233D488
	cmp r4, #4
	bge _0233D470
	ldr r0, _0233D648 @ =0x0235AAD8
	ldr r0, [r0, #4]
	strb r4, [r0, #0x50]
	b _0233D498
_0233D470:
	mov r0, #1
	bl ov02_023346F0
	ldr r0, _0233D648 @ =0x0235AAD8
	strb r4, [r0]
	bl ov02_0233E174
	pop {r3, r4, r5, pc}
_0233D488:
	add r4, r4, #1
	cmp r4, #5
	add r5, r5, #8
	blo _0233D448
_0233D498:
	ldr r0, _0233D64C @ =0x02352F34
	bl ov02_0234EE14
	cmp r0, #0
	beq _0233D514
	ldr r4, _0233D650 @ =0x023529D8
	mov r5, #0
_0233D4B0:
	mov r0, r4
	bl ov02_0234EE14
	cmp r0, #0
	beq _0233D504
	ldr r0, _0233D648 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldrsb r0, [r1, #0x50]
	cmp r0, r5
	bne _0233D514
	ldrb r0, [r1, #0x51]
	cmp r5, r0
	blt _0233D4EC
	mov r0, #9
	bl ov02_023480E0
	b _0233D514
_0233D4EC:
	mov r0, #1
	bl ov02_023346F0
	ldr r0, _0233D648 @ =0x0235AAD8
	strb r5, [r0]
	bl ov02_0233E174
	pop {r3, r4, r5, pc}
_0233D504:
	add r5, r5, #1
	cmp r5, #4
	add r4, r4, #8
	blt _0233D4B0
_0233D514:
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233D534
	mov r0, #1
	bl ov02_023346F0
	bl ov02_02346AC4
	pop {r3, r4, r5, pc}
_0233D534:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0233D550
	mov r0, #0
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_0233D550:
	mov r0, #0x200
	bl ov02_0234EBFC
	cmp r0, #0
	beq _0233D568
	bl ov02_0233E380
	pop {r3, r4, r5, pc}
_0233D568:
	mov r0, #0x200
	bl ov02_0234EC3C
	cmp r0, #0
	beq _0233D58C
	ldr r0, _0233D648 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_0233D58C:
	mov r0, #0x100
	bl ov02_0234EBFC
	cmp r0, #0
	beq _0233D5A4
	bl ov02_0233E30C
	pop {r3, r4, r5, pc}
_0233D5A4:
	mov r0, #0x100
	bl ov02_0234EC3C
	cmp r0, #0
	beq _0233D5C8
	ldr r0, _0233D648 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_0233D5C8:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _0233D5E4
	mov r0, #1
	bl ov02_0233E1C0
	pop {r3, r4, r5, pc}
_0233D5E4:
	mov r0, #0x40
	bl ov02_0234EC3C
	cmp r0, #0
	beq _0233D608
	ldr r0, _0233D648 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
_0233D608:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _0233D624
	mov r0, #3
	bl ov02_0233E1C0
	pop {r3, r4, r5, pc}
_0233D624:
	mov r0, #0x80
	bl ov02_0234EC3C
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _0233D648 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233D648: .4byte 0x0235AAD8
_0233D64C: .4byte 0x02352F34
_0233D650: .4byte 0x023529D8
	arm_func_end ov02_0233D400

	arm_func_start ov02_0233D654
ov02_0233D654: @ 0x0233D654
	push {r3, lr}
	ldr r0, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	popne {r3, pc}
	ldrb r0, [r1, #0x55]
	cmp r0, #0
	subne r0, r0, #1
	strbne r0, [r1, #0x55]
	bl ov02_02346A8C
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0233D68C: @ jump table
	pop {r3, pc} @ case 0
	b _0233D6AC @ case 1
	b _0233D6C4 @ case 2
	b _0233D718 @ case 3
	b _0233D7C4 @ case 4
	b _0233D8A4 @ case 5
	b _0233D82C @ case 6
	b _0233D8A4 @ case 7
_0233D6AC:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov02_02334768
	pop {r3, pc}
_0233D6C4:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x55]
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0233519C
	bl ov02_02346A78
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FUN_02075BFC
	ldr r1, _0233D8B8 @ =0x0235AAD8
	strh r0, [r1, #2]
	bl ov02_0233DC5C
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #4
	ldr r0, [r0, #4]
	strb r1, [r0, #0x55]
	pop {r3, pc}
_0233D718:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x57]
	bl ov02_02334750
	bl ov02_02346A78
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	ldrh r2, [r1, #0x40]
	ldrb r1, [r1, #0x53]
	mul r0, r2, r0
	bl FUN_02075BFC
	ldr r1, _0233D8B8 @ =0x0235AAD8
	strh r0, [r1, #2]
	mov r0, #0x13
	bl ov02_023480E0
	bl ov02_0233DC5C
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_02075C38
	cmp r0, #0
	bne _0233D77C
	bl ov02_0233E174
	pop {r3, pc}
_0233D77C:
	cmp r0, #0xe
	mov r0, #0
	mov r3, #0x78
	bge _0233D7A8
	ldr r1, _0233D8BC @ =ov02_0233DFC4
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0233D7A8:
	ldr r1, _0233D8C0 @ =ov02_0233E080
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0233D7C4:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _0233D800
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x58]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
_0233D800:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _0233D8BC @ =ov02_0233DFC4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0233D82C:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x51]
	cmp r1, #4
	bls _0233D850
	ldrh r1, [r0, #2]
	ldrh r0, [r2, #0x40]
	cmp r1, r0
	bne _0233D878
_0233D850:
	ldrb r0, [r2, #0x58]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
_0233D878:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _0233D8C0 @ =ov02_0233E080
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233D8B8 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
_0233D8A4:
	ldr r0, _0233D8B8 @ =0x0235AAD8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x58]
	pop {r3, pc}
	.align 2, 0
_0233D8B8: .4byte 0x0235AAD8
_0233D8BC: .4byte ov02_0233DFC4
_0233D8C0: .4byte ov02_0233E080
	arm_func_end ov02_0233D654

	arm_func_start ov02_0233D8C4
ov02_0233D8C4: @ 0x0233D8C4
	push {r3, lr}
	ldr r0, _0233D9C4 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x57]
	cmpeq r0, #0
	popne {r3, pc}
	bl ov02_023346DC
	cmp r0, #0
	beq _0233D8FC
	cmp r0, #1
	beq _0233D908
	pop {r3, pc}
_0233D8FC:
	mov r0, #7
	bl ov02_023480E0
	b _0233D9B8
_0233D908:
	ldr r0, _0233D9C4 @ =0x0235AAD8
	ldrb r1, [r0]
	cmp r1, #4
	bne _0233D934
	ldr r1, [r0, #4]
	mov r2, #1
	mov r0, #6
	strb r2, [r1, #0x54]
	bl ov02_023480E0
	bl ov02_0233E404
	b _0233D9B8
_0233D934:
	ldrh r0, [r0, #2]
	mov r1, #0x1c
	bl FUN_02075BFC
	ldr r2, _0233D9C4 @ =0x0235AAD8
	mov r1, #0x2a
	ldrb lr, [r2]
	ldr ip, [r2, #4]
	ldr r3, [ip]
	add lr, lr, r0
	mla r0, lr, r1, r3
	ldrb r0, [r0, #0x28]
	cmp r0, #2
	bne _0233D9A0
	mov r0, #9
	bl ov02_023480E0
	bl ov02_02346AC4
	bl ov02_02334768
	mov r1, #1
	mov r0, #0
	str r0, [sp]
	mov r2, r1
	mov r0, #0xe
	sub r3, r1, #2
	bl ov02_02349394
	ldr r0, _0233D9C8 @ =ov02_0233E434
	bl ov02_02338D68
	pop {r3, pc}
_0233D9A0:
	mov r0, #1
	strb r0, [ip, #0x54]
	ldr r1, [r2, #4]
	mov r0, #6
	strb lr, [r1, #0x52]
	bl ov02_023480E0
_0233D9B8:
	ldr r0, _0233D9CC @ =0x0233D9D0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233D9C4: .4byte 0x0235AAD8
_0233D9C8: .4byte ov02_0233E434
_0233D9CC: .4byte 0x0233D9D0
	arm_func_end ov02_0233D8C4
_0233D9D0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x63, 0xDB, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x3F, 0x40, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xDF, 0xEC, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xF0, 0xD9, 0x33, 0x02

	arm_func_start ov02_0233D9F0
ov02_0233D9F0: @ 0x0233D9F0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233DA58 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x54]
	cmp r0, #0
	beq _0233DA20
	bl ov02_023346AC
	b _0233DA24
_0233DA20:
	bl ov02_02334768
_0233DA24:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0233DA5C @ =ov02_0233DA60
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233DA58: .4byte 0x0235AAD8
_0233DA5C: .4byte ov02_0233DA60
	arm_func_end ov02_0233D9F0

	arm_func_start ov02_0233DA60
ov02_0233DA60: @ 0x0233DA60
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _0233DC40 @ =0x0235AAD8
	mov r0, #1
	ldr r1, [r1, #4]
	ldr r1, [r1, #0x3c]
	bl ov02_0234FB6C
	ldr r4, _0233DC40 @ =0x0235AAD8
	mov r5, #0
_0233DAAC:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0233DAC4
	bl ov02_0234F2C0
_0233DAC4:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0233DADC
	bl ov02_0234F2C0
_0233DADC:
	add r5, r5, #1
	cmp r5, #5
	blt _0233DAAC
	ldr r0, _0233DC40 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov02_0234DFC8
	bl ov02_02346A3C
	bl ov02_0233519C
	bl ov02_02334D10
	bl ov02_023467B0
	ldr r0, _0233DC40 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl ov02_0234CF78
	ldr r0, _0233DC40 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	bl ov02_0234CF78
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x1d
	bl ov02_0234E424
	mov r2, #0
	ldr r1, _0233DC44 @ =0x04000010
	ldr r0, _0233DC40 @ =0x0235AAD8
	str r2, [r1]
	str r2, [r1, #8]
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x54]
	cmp r1, #0
	bne _0233DB8C
	bl ov02_0234705C
	bl ov02_02347518
	ldrb r0, [r0, #0xf4]
	bl ov02_0234793C
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	ldr r0, _0233DC48 @ =ov02_02344AF0
	bl ov02_02338D68
	b _0233DC34
_0233DB8C:
	ldrb r0, [r0]
	cmp r0, #4
	bne _0233DBB4
	bl ov02_0234705C
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0233DC4C @ =ov02_023438CC
	bl ov02_02338D68
	b _0233DC34
_0233DBB4:
	ldrb r1, [r2, #0x52]
	ldr r2, [r2]
	mov r0, #0x2a
	mla r0, r1, r0, r2
	bl ov02_02347554
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r1, _0233DC40 @ =0x0235AAD8
	mov r0, #0x2a
	ldr r2, [r1, #4]
	ldrb r1, [r2, #0x52]
	ldr r2, [r2]
	mla r0, r1, r0, r2
	ldrb r0, [r0, #0x28]
	mov r1, #1
	cmp r0, #0
	mov r0, #0
	beq _0233DC1C
	bl ov02_02338D78
	mov r0, #1
	mov r1, r0
	bl ov02_02338DB4
	ldr r0, _0233DC50 @ =ov02_0233E488
	bl ov02_02338D68
	b _0233DC34
_0233DC1C:
	bl ov02_02338D78
	mov r0, #0
	mov r1, #1
	bl ov02_02338DB4
	ldr r0, _0233DC54 @ =ov02_02345968
	bl ov02_02338D68
_0233DC34:
	ldr r0, _0233DC58 @ =0x0235AADC
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233DC40: .4byte 0x0235AAD8
_0233DC44: .4byte 0x04000010
_0233DC48: .4byte ov02_02344AF0
_0233DC4C: .4byte ov02_023438CC
_0233DC50: .4byte ov02_0233E488
_0233DC54: .4byte ov02_02345968
_0233DC58: .4byte 0x0235AADC
	arm_func_end ov02_0233DA60

	arm_func_start ov02_0233DC5C
ov02_0233DC5C: @ 0x0233DC5C
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _0233DD00 @ =0x0235AAD8
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_02075BFC
	ldr r1, _0233DD00 @ =0x0235AAD8
	mov r7, r0
	ldr r0, [r1, #4]
	mov r1, #0
	ldrb r4, [r0, #0x51]
	ldr r0, [r0, #0xc]
	bl ov02_0234E2A8
	cmp r4, #5
	movgt r4, #5
	mov r5, r7
	cmp r4, #0
	mov r6, #0
	ble _0233DCC0
_0233DCA4:
	mov r0, r5
	mov r1, r6
	bl ov02_0233DD04
	add r6, r6, #1
	cmp r6, r4
	add r5, r5, #1
	blt _0233DCA4
_0233DCC0:
	cmp r4, #0
	mov r5, #0
	ble _0233DCE8
_0233DCCC:
	mov r0, r7
	mov r1, r5
	bl ov02_0233DE7C
	add r5, r5, #1
	cmp r5, r4
	add r7, r7, #1
	blt _0233DCCC
_0233DCE8:
	ldr r0, _0233DD00 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl ov02_0234E354
	bl ov02_0233DF08
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233DD00: .4byte 0x0235AAD8
	arm_func_end ov02_0233DC5C

	arm_func_start ov02_0233DD04
ov02_0233DD04: @ 0x0233DD04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	mov r0, #0x2a
	ldr r2, _0233DE78 @ =0x0235AAD8
	mul r6, r7, r0
	ldr r0, [r2, #4]
	mov r4, r1
	ldr r0, [r0]
	mov r1, #0x20
	add r0, r0, r6
	bl ov02_0234F59C
	ldr r2, _0233DE78 @ =0x0235AAD8
	mov r1, #0x1c
	mul r5, r4, r1
	ldr r2, [r2, #4]
	mov r4, r0
	ldrb r1, [r2, #0x51]
	cmp r7, r1
	addge sp, sp, #0x30
	popge {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	cmp r4, #0x10
	mov r1, #0
	mov r2, #0x22
	addle r5, r5, #6
	bl FUN_0207C40C
	cmp r4, #0x10
	movle ip, r4
	movgt ip, #0x10
	cmp ip, #0
	mov r3, #0
	ble _0233DDB4
	ldr r0, _0233DE78 @ =0x0235AAD8
	ldr r7, [r0, #4]
	add r0, sp, #0xc
_0233DD94:
	ldr r2, [r7]
	lsl r1, r3, #1
	add r2, r6, r2
	ldrb r2, [r3, r2]
	add r3, r3, #1
	cmp r3, ip
	strh r2, [r0, r1]
	blt _0233DD94
_0233DDB4:
	mov r1, #0xa
	add r0, sp, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _0233DE78 @ =0x0235AAD8
	mov r2, r5
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov02_0234E13C
	cmp r4, #0x10
	addle sp, sp, #0x30
	pople {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_0207C40C
	sub r3, r4, #0x10
	cmp r3, #0
	mov r7, #0
	ble _0233DE40
	ldr r0, _0233DE78 @ =0x0235AAD8
	ldr r4, [r0, #4]
	add r0, sp, #0xc
_0233DE1C:
	ldr r2, [r4]
	lsl r1, r7, #1
	add r2, r6, r2
	add r2, r7, r2
	ldrb r2, [r2, #0x10]
	add r7, r7, #1
	cmp r7, r3
	strh r2, [r0, r1]
	blt _0233DE1C
_0233DE40:
	mov r1, #0xa
	add r0, sp, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _0233DE78 @ =0x0235AAD8
	add r2, r5, #0xc
	ldr r0, [r0, #4]
	mov r3, #2
	ldr r0, [r0, #0xc]
	bl ov02_0234E13C
	add sp, sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233DE78: .4byte 0x0235AAD8
	arm_func_end ov02_0233DD04

	arm_func_start ov02_0233DE7C
ov02_0233DE7C: @ 0x0233DE7C
	push {r4, lr}
	ldr r3, _0233DF04 @ =0x0235AAD8
	ldr lr, [r3, #4]
	ldrb r2, [lr, #0x51]
	cmp r0, r2
	popge {r4, pc}
	mov r2, #0x2a
	mul r2, r0, r2
	ldr r0, [lr]
	add r4, lr, r1, lsl #2
	add r0, r0, r2
	ldrb ip, [r0, #0x28]
	ldr r4, [r4, #0x10]
	mov r0, #0x400
	add ip, lr, ip, lsl #1
	ldrh lr, [r4, #4]
	rsb r0, r0, #0
	ldrh ip, [ip, #0x42]
	and lr, lr, r0
	orr ip, lr, ip
	strh ip, [r4, #4]
	ldr lr, [r3, #4]
	ldr r3, [lr]
	add ip, lr, r1, lsl #2
	add r1, r3, r2
	ldrh r1, [r1, #0x26]
	ldr r3, [ip, #0x24]
	add r1, lr, r1, lsl #1
	ldrh r2, [r3, #4]
	ldrh r1, [r1, #0x48]
	and r0, r2, r0
	orr r0, r0, r1
	strh r0, [r3, #4]
	pop {r4, pc}
	.align 2, 0
_0233DF04: .4byte 0x0235AAD8
	arm_func_end ov02_0233DE7C

	arm_func_start ov02_0233DF08
ov02_0233DF08: @ 0x0233DF08
	push {r4, r5, r6, lr}
	ldr r0, _0233DFBC @ =0x0235AAD8
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_02075C38
	ldr r1, _0233DFBC @ =0x0235AAD8
	rsb r0, r0, #0x36
	ldr r1, [r1, #4]
	mov r2, #0
	ldrb r1, [r1, #0x51]
	cmp r1, #5
	movgt r1, #5
	cmp r1, #0
	ble _0233DFA8
	ldr ip, _0233DFBC @ =0x0235AAD8
	ldr r3, _0233DFC0 @ =0xFE00FF00
_0233DF48:
	ldr r5, [ip, #4]
	sub r4, r0, #2
	add r5, r5, r2, lsl #2
	ldr r6, [r5, #0x10]
	add lr, r0, #1
	ldr r5, [r6]
	and r4, r4, #0xff
	and r5, r5, r3
	orr r4, r5, r4
	orr r4, r4, #0xb30000
	str r4, [r6]
	ldr r4, [ip, #4]
	and lr, lr, #0xff
	add r4, r4, r2, lsl #2
	ldr r5, [r4, #0x24]
	add r2, r2, #1
	ldr r4, [r5]
	cmp r2, r1
	and r4, r4, r3
	orr r4, r4, lr
	orr r4, r4, #0xd20000
	str r4, [r5]
	add r0, r0, #0x1c
	blt _0233DF48
_0233DFA8:
	ldr r0, _0233DFBC @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x56]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0233DFBC: .4byte 0x0235AAD8
_0233DFC0: .4byte 0xFE00FF00
	arm_func_end ov02_0233DF08

	arm_func_start ov02_0233DFC4
ov02_0233DFC4: @ 0x0233DFC4
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov02_02346AC4
	bl ov02_0233519C
	ldr r0, _0233E07C @ =0x0235AAD8
	ldrh r1, [r0, #2]
	cmp r1, #4
	subhi r1, r1, #4
	movls r1, #0
	strh r1, [r0, #2]
	ldr r0, _0233E07C @ =0x0235AAD8
	mov r1, #0x1c
	ldrh r0, [r0, #2]
	bl FUN_02075C38
	mov r5, r0
	cmp r5, #0x18
	bne _0233E010
	bl ov02_0233DC5C
	pop {r3, r4, r5, pc}
_0233E010:
	ble _0233E02C
	ldr r0, _0233E07C @ =0x0235AAD8
	rsb r1, r5, #0x1c
	ldrh r2, [r0, #2]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #2]
_0233E02C:
	bl ov02_0233DF08
	cmp r5, #0
	popne {r3, r4, r5, pc}
	ldr r0, _0233E07C @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_02075BFC
	bl ov02_02346FEC
	bl ov02_02346AAC
	bl ov02_0233E174
	ldr r0, _0233E07C @ =0x0235AAD8
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov02_0234FB40
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233E07C: .4byte 0x0235AAD8
	arm_func_end ov02_0233DFC4

	arm_func_start ov02_0233E080
ov02_0233E080: @ 0x0233E080
	push {r4, lr}
	mov r4, r0
	bl ov02_02346AC4
	bl ov02_0233519C
	ldr r0, _0233E114 @ =0x0235AAD8
	mov r1, #0x1c
	ldrh r2, [r0, #2]
	add r2, r2, #4
	strh r2, [r0, #2]
	ldrh r0, [r0, #2]
	bl FUN_02075C38
	cmp r0, #4
	blt _0233E0BC
	bl ov02_0233DF08
	pop {r4, pc}
_0233E0BC:
	ldr r1, _0233E114 @ =0x0235AAD8
	ldrh r2, [r1, #2]
	sub r0, r2, r0
	strh r0, [r1, #2]
	bl ov02_0233DC5C
	ldr r0, _0233E114 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldrh r2, [r0, #2]
	ldrb r0, [r1, #0x53]
	ldrh r1, [r1, #0x40]
	mul r0, r2, r0
	bl FUN_02075BFC
	bl ov02_02346FEC
	bl ov02_02346AAC
	bl ov02_0233E174
	ldr r0, _0233E114 @ =0x0235AAD8
	mov r1, r4
	ldr r2, [r0, #4]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_0233E114: .4byte 0x0235AAD8
	arm_func_end ov02_0233E080

	arm_func_start ov02_0233E118
ov02_0233E118: @ 0x0233E118
	push {r3, lr}
	ldr r0, _0233E168 @ =0x0235AAD8
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x56]
	cmp r1, #0
	popeq {r3, pc}
	ldrh r0, [r0, #2]
	mov r1, #0x1c
	bl FUN_02075C38
	ldr r1, _0233E16C @ =0x01FF0000
	sub r0, r0, #0x32
	ldr r2, _0233E170 @ =0x04000010
	and r1, r1, r0, lsl #16
	str r1, [r2]
	ldr r0, _0233E168 @ =0x0235AAD8
	str r1, [r2, #8]
	ldr r0, [r0, #4]
	mov r1, #0
	strb r1, [r0, #0x56]
	pop {r3, pc}
	.align 2, 0
_0233E168: .4byte 0x0235AAD8
_0233E16C: .4byte 0x01FF0000
_0233E170: .4byte 0x04000010
	arm_func_end ov02_0233E118

	arm_func_start ov02_0233E174
ov02_0233E174: @ 0x0233E174
	push {r3, lr}
	ldr r0, _0233E1B0 @ =0x0235AAD8
	ldr r1, _0233E1B4 @ =0x02352A00
	ldrb r2, [r0]
	ldr r3, _0233E1B8 @ =0x02352A02
	lsl ip, r2, #3
	cmp r2, #4
	ldr r2, _0233E1BC @ =0x02352A04
	movlo r0, #2
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	movhs r0, #3
	bl ov02_02334FF0
	pop {r3, pc}
	.align 2, 0
_0233E1B0: .4byte 0x0235AAD8
_0233E1B4: .4byte 0x02352A00
_0233E1B8: .4byte 0x02352A02
_0233E1BC: .4byte 0x02352A04
	arm_func_end ov02_0233E174

	arm_func_start ov02_0233E1C0
ov02_0233E1C0: @ 0x0233E1C0
	push {r4, lr}
	ldr r1, _0233E304 @ =0x0235AAD8
	mov r4, #1
	ldrb r3, [r1]
	cmp r3, #4
	addls pc, pc, r3, lsl #2
	b _0233E2BC
_0233E1DC: @ jump table
	b _0233E1F0 @ case 0
	b _0233E254 @ case 1
	b _0233E254 @ case 2
	b _0233E280 @ case 3
	b _0233E298 @ case 4
_0233E1F0:
	cmp r0, #1
	bne _0233E238
	ldrh r0, [r1, #2]
	cmp r0, #0
	moveq r0, #4
	strbeq r0, [r1]
	beq _0233E2BC
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _0233E308 @ =ov02_0233DFC4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233E304 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r4, pc}
_0233E238:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x51]
	cmp r0, #1
	addhi r0, r3, #1
	strbhi r0, [r1]
	movls r4, #0
	b _0233E2BC
_0233E254:
	cmp r0, #1
	subeq r0, r3, #1
	strbeq r0, [r1]
	beq _0233E2BC
	ldr r2, [r1, #4]
	add r0, r3, #1
	ldrb r2, [r2, #0x51]
	cmp r2, r0
	strbgt r0, [r1]
	movle r4, #0
	b _0233E2BC
_0233E280:
	cmp r0, #1
	subeq r0, r3, #1
	strbeq r0, [r1]
	beq _0233E2BC
	bl ov02_0233E380
	pop {r4, pc}
_0233E298:
	cmp r0, #1
	moveq r4, #0
	beq _0233E2BC
	mov r0, #0
	strh r0, [r1, #2]
	strb r0, [r1]
	bl ov02_0233DC5C
	mov r0, #0
	bl ov02_02346FEC
_0233E2BC:
	cmp r4, #0
	bne _0233E2F4
	ldr r0, _0233E304 @ =0x0235AAD8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	popne {r4, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _0233E304 @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r4, pc}
_0233E2F4:
	mov r0, #8
	bl ov02_023480E0
	bl ov02_0233E174
	pop {r4, pc}
	.align 2, 0
_0233E304: .4byte 0x0235AAD8
_0233E308: .4byte ov02_0233DFC4
	arm_func_end ov02_0233E1C0

	arm_func_start ov02_0233E30C
ov02_0233E30C: @ 0x0233E30C
	push {r3, lr}
	ldr r0, _0233E378 @ =0x0235AAD8
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _0233E34C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x59]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _0233E378 @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, pc}
_0233E34C:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _0233E37C @ =ov02_0233DFC4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233E378 @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
	.align 2, 0
_0233E378: .4byte 0x0235AAD8
_0233E37C: .4byte ov02_0233DFC4
	arm_func_end ov02_0233E30C

	arm_func_start ov02_0233E380
ov02_0233E380: @ 0x0233E380
	push {r3, lr}
	ldr r0, _0233E3FC @ =0x0235AAD8
	ldr r2, [r0, #4]
	ldrh r1, [r0, #2]
	ldrh r0, [r2, #0x40]
	cmp r1, r0
	beq _0233E3A8
	ldrb r0, [r2, #0x51]
	cmp r0, #4
	bhi _0233E3D0
_0233E3A8:
	ldrb r0, [r2, #0x59]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _0233E3FC @ =0x0235AAD8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x59]
	pop {r3, pc}
_0233E3D0:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _0233E400 @ =ov02_0233E080
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0233E3FC @ =0x0235AAD8
	ldr r1, [r1, #4]
	str r0, [r1, #0x38]
	pop {r3, pc}
	.align 2, 0
_0233E3FC: .4byte 0x0235AAD8
_0233E400: .4byte ov02_0233E080
	arm_func_end ov02_0233E380

	arm_func_start ov02_0233E404
ov02_0233E404: @ 0x0233E404
	push {r3, lr}
	ldr r1, _0233E42C @ =0x023529A8
	ldr r0, _0233E430 @ =0x0235AAD8
	ldrb r1, [r1]
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	mov r2, r1
	strb r1, [sp]
	bl ov02_023468A0
	pop {r3, pc}
	.align 2, 0
_0233E42C: .4byte 0x023529A8
_0233E430: .4byte 0x0235AAD8
	arm_func_end ov02_0233E404

	arm_func_start ov02_0233E434
ov02_0233E434: @ 0x0233E434
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _0233E45C @ =0x0233E460
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233E45C: .4byte 0x0233E460
	arm_func_end ov02_0233E434
_0233E460:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xAB, 0x2C, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18
	.byte 0xB6, 0xD8, 0xFF, 0xEB, 0x8C, 0x21, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x39, 0xEA, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xEC, 0xD3, 0x33, 0x02

	arm_func_start ov02_0233E488
ov02_0233E488: @ 0x0233E488
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r1, _0233E5B0 @ =0x02352A30
	mov r0, #0x2c
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	mov r1, #4
	strb r3, [sp]
	strb r2, [sp, #1]
	bl ov02_0234E7B4
	ldr r2, _0233E5B4 @ =0x0235AAE0
	add r1, sp, #4
	str r0, [r2]
	add r0, sp, #8
	bl ov02_02338DC8
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0233E500
	ldr r0, _0233E5B4 @ =0x0235AAE0
	ldr r0, [r0]
	add r0, r0, #8
	bl ov02_023477B4
	ldr r0, _0233E5B4 @ =0x0235AAE0
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #8
	bl ov02_0234F59C
	ldr r1, _0233E5B4 @ =0x0235AAE0
	ldr r1, [r1]
	strb r0, [r1, #0x29]
_0233E500:
	bl ov02_0233E5BC
	ldr r0, [sp, #8]
	add r0, r0, #9
	bl ov02_02335268
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0233E530
	mov r0, #0x35
	sub r1, r0, #0x36
	mov r2, #0
	bl ov02_02334C3C
	b _0233E548
_0233E530:
	ldr r2, [sp, #8]
	add r0, sp, #0
	ldrb r0, [r0, r2]
	mvn r1, #0
	mov r2, #0
	bl ov02_02334C3C
_0233E548:
	mov r0, #2
	bl ov02_02334DE8
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	ldr r2, _0233E5B4 @ =0x0235AAE0
	mov r1, #0x3e
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov02_0234D6AC
	ldr r1, _0233E5B4 @ =0x0235AAE0
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	bl ov02_0233EC58
	bl ov02_0233EB64
	ldr r0, _0233E5B8 @ =ov02_0233E678
	bl ov02_02338D68
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0233E5B0: .4byte 0x02352A30
_0233E5B4: .4byte 0x0235AAE0
_0233E5B8: .4byte ov02_0233E678
	arm_func_end ov02_0233E488

	arm_func_start ov02_0233E5BC
ov02_0233E5BC: @ 0x0233E5BC
	push {r3, lr}
	ldr r0, _0233E650 @ =0x02353900
	ldr r1, _0233E654 @ =0x02077DA4
	bl ov02_02334DA8
	ldr r0, _0233E658 @ =0x02353914
	ldr r1, _0233E65C @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _0233E660 @ =0x0235392C
	ldr r1, _0233E664 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _0233E668 @ =0x02353944
	ldr r1, _0233E66C @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233E670 @ =0x04001008
	ldr r1, _0233E674 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233E650: .4byte 0x02353900
_0233E654: .4byte 0x02077DA4
_0233E658: .4byte 0x02353914
_0233E65C: .4byte 0x02078310
_0233E660: .4byte 0x0235392C
_0233E664: .4byte FUN_02077CF8
_0233E668: .4byte 0x02353944
_0233E66C: .4byte FUN_020780D0
_0233E670: .4byte 0x04001008
_0233E674: .4byte 0x0400000A
	arm_func_end ov02_0233E5BC

	arm_func_start ov02_0233E678
ov02_0233E678: @ 0x0233E678
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233E6C8 @ =ov02_0233E6CC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233E6C8: .4byte ov02_0233E6CC
	arm_func_end ov02_0233E678

	arm_func_start ov02_0233E6CC
ov02_0233E6CC: @ 0x0233E6CC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023354D8
	mov r0, #0x14
	bl ov02_023480E0
	ldr r0, _0233E740 @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	bne _0233E718
	mov r0, #0
	bl ov02_02335884
_0233E718:
	ldr r0, _0233E740 @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _0233E734
	mov r0, #0
	bl ov02_02335898
_0233E734:
	ldr r0, _0233E744 @ =0x0233E748
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233E740: .4byte 0x0235AAE0
_0233E744: .4byte 0x0233E748
	arm_func_end ov02_0233E6CC
_0233E748:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x47, 0xDC, 0xFF, 0xEB
	.byte 0xFF, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x08, 0x04, 0x00, 0x9F, 0xE5, 0x81, 0xE9, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x68, 0xE7, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0x00, 0xEB
	.byte 0x70, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233E778
ov02_0233E778: @ 0x0233E778
	push {r4, lr}
	bl ov02_02335870
	mov r4, r0
	cmp r4, #0x83
	bgt _0233E7B8
	cmp r4, #0x80
	blt _0233E7AC
	beq _0233E7C4
	cmp r4, #0x82
	beq _0233E828
	cmp r4, #0x83
	beq _0233E84C
	b _0233E8B8
_0233E7AC:
	cmp r4, #0
	beq _0233E91C
	b _0233E8B8
_0233E7B8:
	ldr r0, _0233E928 @ =0x0000E01D
	cmp r4, r0
	b _0233E8B8
_0233E7C4:
	ldr r0, _0233E92C @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0
	beq _0233E91C
	mov r0, #3
	bl ov02_023480E0
	ldr r1, _0233E92C @ =0x0235AAE0
	mov r0, #0
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	sub r2, r2, #1
	strb r2, [r3, #0x29]
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	add r2, r3, r2
	strb r0, [r2, #8]
	ldr r1, [r1]
	ldrb r1, [r1, #0x29]
	cmp r1, #0
	bne _0233E81C
	bl ov02_02335884
_0233E81C:
	mov r0, #1
	bl ov02_02335898
	b _0233E91C
_0233E828:
	mov r0, #7
	bl ov02_023480E0
	ldr r1, _0233E92C @ =0x0235AAE0
	ldr r0, _0233E930 @ =ov02_0233E93C
	ldr r1, [r1]
	mov r2, #0
	strb r2, [r1, #0x2a]
	bl ov02_02338D68
	pop {r4, pc}
_0233E84C:
	bl ov02_0233EDCC
	cmp r0, #0
	beq _0233E874
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233E92C @ =0x0235AAE0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x2a]
	b _0233E88C
_0233E874:
	ldr r0, _0233E92C @ =0x0235AAE0
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x2a]
	bl ov02_023480E0
_0233E88C:
	ldr r0, _0233E92C @ =0x0235AAE0
	ldr r1, _0233E934 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _0233E930 @ =ov02_0233E93C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	orr r1, r1, #0x200
	str r1, [r3]
	bl ov02_02338D68
	pop {r4, pc}
_0233E8B8:
	ldr r0, _0233E92C @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	beq _0233E91C
	mov r0, #1
	bl ov02_023480E0
	ldr r1, _0233E92C @ =0x0235AAE0
	mov r0, #1
	ldr r3, [r1]
	ldrb r2, [r3, #0x29]
	add r2, r3, r2
	strb r4, [r2, #8]
	ldr r2, [r1]
	ldrb r1, [r2, #0x29]
	add r1, r1, #1
	strb r1, [r2, #0x29]
	bl ov02_02335884
	ldr r0, _0233E92C @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x29]
	cmp r0, #0x20
	bne _0233E91C
	mov r0, #0
	bl ov02_02335898
_0233E91C:
	bl ov02_0233EB64
	bl ov02_0233EC58
	pop {r4, pc}
	.align 2, 0
_0233E928: .4byte 0x0000E01D
_0233E92C: .4byte 0x0235AAE0
_0233E930: .4byte ov02_0233E93C
_0233E934: .4byte 0xC1FFFCFF
	arm_func_end ov02_0233E778

	arm_func_start ov02_0233E938
ov02_0233E938: @ 0x0233E938
	bx lr
	arm_func_end ov02_0233E938

	arm_func_start ov02_0233E93C
ov02_0233E93C: @ 0x0233E93C
	push {r3, lr}
	mov r0, #8
	bl ov02_0234DAE0
	ldr r0, _0233E954 @ =ov02_0233E958
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233E954: .4byte ov02_0233E958
	arm_func_end ov02_0233E93C

	arm_func_start ov02_0233E958
ov02_0233E958: @ 0x0233E958
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0233583C
	mov r0, #0x15
	bl ov02_023480E0
	ldr r0, _0233E984 @ =ov02_0233E988
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233E984: .4byte ov02_0233E988
	arm_func_end ov02_0233E958

	arm_func_start ov02_0233E988
ov02_0233E988: @ 0x0233E988
	push {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _0233EA4C @ =0x02352A30
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	bl ov02_023358AC
	cmp r0, #0
	addne sp, sp, #0x10
	popne {r3, pc}
	ldr r0, _0233EA50 @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	bne _0233E9D8
	ldr r0, _0233EA54 @ =ov02_0233EA60
	bl ov02_02338D68
	add sp, sp, #0x10
	pop {r3, pc}
_0233E9D8:
	cmp r0, #2
	bne _0233EA0C
	mov r2, #1
	mov ip, #0
	sub r3, r2, #2
	mov r0, #6
	mov r1, #3
	str ip, [sp]
	bl ov02_02349394
	ldr r0, _0233EA58 @ =ov02_0233EF58
	bl ov02_02338D68
	add sp, sp, #0x10
	pop {r3, pc}
_0233EA0C:
	add r1, sp, #4
	mov r0, #0
	bl ov02_02338DC8
	mov r0, #0
	str r0, [sp]
	mov r2, #1
	ldr r1, [sp, #4]
	add r0, sp, #8
	ldr r0, [r0, r1, lsl #2]
	sub r3, r2, #2
	mov r1, #2
	bl ov02_02349394
	ldr r0, _0233EA5C @ =ov02_0233ECC0
	bl ov02_02338D68
	add sp, sp, #0x10
	pop {r3, pc}
	.align 2, 0
_0233EA4C: .4byte 0x02352A30
_0233EA50: .4byte 0x0235AAE0
_0233EA54: .4byte ov02_0233EA60
_0233EA58: .4byte ov02_0233EF58
_0233EA5C: .4byte ov02_0233ECC0
	arm_func_end ov02_0233E988

	arm_func_start ov02_0233EA60
ov02_0233EA60: @ 0x0233EA60
	push {r3, lr}
	sub sp, sp, #8
	bl ov02_02334D10
	ldr r0, _0233EB48 @ =0x0235AAE0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov02_0234F2C0
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233EB4C @ =0x02353958
	ldr r1, _0233EB50 @ =0x02077DA4
	bl ov02_02334DA8
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	add r0, sp, #4
	add r1, sp, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	bne _0233EAE4
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r1, [sp, #4]
	mov r0, #0
	bl ov02_02338DB4
	ldr r0, _0233EB54 @ =ov02_023402CC
	bl ov02_02338D68
	b _0233EB38
_0233EAE4:
	ldr r0, _0233EB48 @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	mov r0, #0
	bne _0233EB1C
	mov r1, #1
	bl ov02_02338D78
	mov r0, #1
	mov r1, #0
	bl ov02_02338DB4
	ldr r0, _0233EB58 @ =ov02_0233CEEC
	bl ov02_02338D68
	b _0233EB38
_0233EB1C:
	mov r1, r0
	bl ov02_02338D78
	mov r0, #0
	mov r1, #1
	bl ov02_02338DB4
	ldr r0, _0233EB5C @ =ov02_02345968
	bl ov02_02338D68
_0233EB38:
	ldr r0, _0233EB60 @ =0x0235AAE0
	bl ov02_0234E7D8
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0233EB48: .4byte 0x0235AAE0
_0233EB4C: .4byte 0x02353958
_0233EB50: .4byte 0x02077DA4
_0233EB54: .4byte ov02_023402CC
_0233EB58: .4byte ov02_0233CEEC
_0233EB5C: .4byte ov02_02345968
_0233EB60: .4byte 0x0235AAE0
	arm_func_end ov02_0233EA60

	arm_func_start ov02_0233EB64
ov02_0233EB64: @ 0x0233EB64
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r0, _0233EC4C @ =0x0235AAE0
	add r5, sp, #0x14
	mov r1, #0
	strh r1, [r5, #2]
	mov r4, #0x20
	strh r1, [r5, #4]
	mov r3, #0xe
	strh r1, [r5, #6]
	mov r2, #0x10
	ldr r0, [r0]
	strh r1, [r5]
	strh r4, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	ldr r0, [r0]
	bl ov02_0234E2A8
	mov sl, #0
	ldr r7, _0233EC50 @ =0x0000E01D
	ldr r6, _0233EC54 @ =0x02352A4C
	mov sb, sl
	strh sl, [sp, #0x12]
	mov r8, #0x31
	mov r5, #2
	mov r4, #0x480
	add fp, sp, #0x10
_0233EBD0:
	ldr r0, _0233EC4C @ =0x0235AAE0
	cmp sl, #0x10
	ldr r0, [r0]
	moveq sb, #0
	strheq r8, [sp, #0x16]
	add r1, r0, sl
	ldrb r1, [r1, #8]
	ldrb r2, [r6, sb]
	cmp r1, #0x20
	strheq r7, [sp, #0x10]
	strhne r1, [sp, #0x10]
	ldrh r1, [sp, #0x1a]
	strh r2, [sp, #0x14]
	stm sp, {r1, r5}
	str r4, [sp, #8]
	str fp, [sp, #0xc]
	ldrh r1, [sp, #0x14]
	ldrh r2, [sp, #0x16]
	ldrh r3, [sp, #0x18]
	ldr r0, [r0]
	bl ov02_0234E1E8
	add sl, sl, #1
	cmp sl, #0x20
	add sb, sb, #1
	blt _0233EBD0
	ldr r0, _0233EC4C @ =0x0235AAE0
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov02_0234E354
	add sp, sp, #0x1c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233EC4C: .4byte 0x0235AAE0
_0233EC50: .4byte 0x0000E01D
_0233EC54: .4byte 0x02352A4C
	arm_func_end ov02_0233EB64

	arm_func_start ov02_0233EC58
ov02_0233EC58: @ 0x0233EC58
	push {r3, lr}
	ldr r0, _0233ECB0 @ =0x0235AAE0
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	ldr ip, [r1, #4]
	ldr r1, _0233ECB4 @ =0x02352A48
	cmp r0, #0x20
	and r2, r0, #0xf
	asr lr, r0, #4
	movhs lr, #1
	ldr r0, _0233ECB8 @ =0x02352A4C
	movhs r2, #0xf
	ldrb r3, [r0, r2]
	ldr r2, [ip]
	ldr r0, _0233ECBC @ =0xFE00FF00
	ldrb r1, [r1, lr]
	and r0, r2, r0
	lsl r2, r3, #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [ip]
	pop {r3, pc}
	.align 2, 0
_0233ECB0: .4byte 0x0235AAE0
_0233ECB4: .4byte 0x02352A48
_0233ECB8: .4byte 0x02352A4C
_0233ECBC: .4byte 0xFE00FF00
	arm_func_end ov02_0233EC58

	arm_func_start ov02_0233ECC0
ov02_0233ECC0: @ 0x0233ECC0
	push {r3, lr}
	bl ov02_02349704
	ldr r1, _0233ED14 @ =0x0235AAE0
	ldr r2, [r1]
	strb r0, [r2, #0x2a]
	ldr r0, [r1]
	ldrb r0, [r0, #0x2a]
	cmp r0, #0
	beq _0233ECF0
	cmp r0, #1
	beq _0233ECFC
	pop {r3, pc}
_0233ECF0:
	mov r0, #7
	bl ov02_023480E0
	b _0233ED04
_0233ECFC:
	mov r0, #0xe
	bl ov02_023480E0
_0233ED04:
	bl ov02_023496C0
	ldr r0, _0233ED18 @ =ov02_0233ED1C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233ED14: .4byte 0x0235AAE0
_0233ED18: .4byte ov02_0233ED1C
	arm_func_end ov02_0233ECC0

	arm_func_start ov02_0233ED1C
ov02_0233ED1C: @ 0x0233ED1C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0233EDB8 @ =0x02352A30
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r1, [sp, #4]
	str r0, [sp, #8]
	bl ov02_02349718
	cmp r0, #0
	addne sp, sp, #0xc
	ldmne sp!, {pc}
	ldr r0, _0233EDBC @ =0x0235AAE0
	ldr r1, [r0]
	ldrb r0, [r1, #0x2a]
	cmp r0, #0
	bne _0233ED80
	ldr r3, [r1, #4]
	ldr r1, _0233EDC0 @ =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _0233EDC4 @ =ov02_0233E6CC
	and r1, r2, r1
	str r1, [r3]
	bl ov02_02338D68
	add sp, sp, #0xc
	ldm sp!, {pc}
_0233ED80:
	add r0, sp, #0
	mov r1, #0
	bl ov02_02338DC8
	ldr r0, _0233EDBC @ =0x0235AAE0
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _0233EDC8 @ =ov02_0233EA60
	bl ov02_02338D68
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0233EDB8: .4byte 0x02352A30
_0233EDBC: .4byte 0x0235AAE0
_0233EDC0: .4byte 0xC1FFFCFF
_0233EDC4: .4byte ov02_0233E6CC
_0233EDC8: .4byte ov02_0233EA60
	arm_func_end ov02_0233ED1C

	arm_func_start ov02_0233EDCC
ov02_0233EDCC: @ 0x0233EDCC
	push {r3, lr}
	sub sp, sp, #8
	add r0, sp, #4
	add r1, sp, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #1
	bne _0233EDFC
	mov r0, #0x35
	sub r1, r0, #0x36
	mov r2, #0
	bl ov02_02334C3C
_0233EDFC:
	add r0, sp, #4
	add r1, sp, #0
	bl ov02_02338DC8
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0233EE34
	ldr r0, _0233EF54 @ =0x0235AAE0
	add sp, sp, #8
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, pc}
_0233EE34:
	ldr r0, [sp]
	cmp r0, #1
	bne _0233EE5C
	ldr r0, _0233EF54 @ =0x0235AAE0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r3, pc}
_0233EE5C:
	ldr r0, _0233EF54 @ =0x0235AAE0
	mov r1, #0x20
	ldr r0, [r0]
	add r0, r0, #8
	bl ov02_0234F59C
	cmp r0, #0x10
	bgt _0233EEB0
	cmp r0, #0xa
	blt _0233EE94
	beq _0233EED8
	cmp r0, #0xd
	cmpne r0, #0x10
	beq _0233EECC
	b _0233EF48
_0233EE94:
	cmp r0, #0
	bgt _0233EEA4
	beq _0233EECC
	b _0233EF48
_0233EEA4:
	cmp r0, #5
	beq _0233EECC
	b _0233EF48
_0233EEB0:
	cmp r0, #0x1a
	bgt _0233EEC0
	beq _0233EED8
	b _0233EF48
_0233EEC0:
	cmp r0, #0x20
	beq _0233EED8
	b _0233EF48
_0233EECC:
	add sp, sp, #8
	mov r0, #1
	pop {r3, pc}
_0233EED8:
	cmp r0, #0
	mov r2, #0
	ble _0233EF3C
	ldr r1, _0233EF54 @ =0x0235AAE0
	ldr r3, [r1]
_0233EEEC:
	ldrb r1, [r3, #8]
	cmp r1, #0x30
	blo _0233EF00
	cmp r1, #0x39
	bls _0233EF2C
_0233EF00:
	cmp r1, #0x41
	blo _0233EF10
	cmp r1, #0x46
	bls _0233EF2C
_0233EF10:
	cmp r1, #0x61
	blo _0233EF20
	cmp r1, #0x66
	bls _0233EF2C
_0233EF20:
	add sp, sp, #8
	mov r0, #0
	pop {r3, pc}
_0233EF2C:
	add r2, r2, #1
	cmp r2, r0
	add r3, r3, #1
	blt _0233EEEC
_0233EF3C:
	add sp, sp, #8
	mov r0, #1
	pop {r3, pc}
_0233EF48:
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0233EF54: .4byte 0x0235AAE0
	arm_func_end ov02_0233EDCC

	arm_func_start ov02_0233EF58
ov02_0233EF58: @ 0x0233EF58
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _0233EF80 @ =ov02_0233EF84
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233EF80: .4byte ov02_0233EF84
	arm_func_end ov02_0233EF58

	arm_func_start ov02_0233EF84
ov02_0233EF84: @ 0x0233EF84
	push {r3, lr}
	bl ov02_02349718
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233EFBC @ =0x0235AAE0
	ldr r1, _0233EFC0 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _0233EFC4 @ =ov02_0233E6CC
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233EFBC: .4byte 0x0235AAE0
_0233EFC0: .4byte 0xC1FFFCFF
_0233EFC4: .4byte ov02_0233E6CC
	arm_func_end ov02_0233EF84

	arm_func_start ov02_0233EFC8
ov02_0233EFC8: @ 0x0233EFC8
	push {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r4, _0233F128 @ =0x02352A74
	ldr ip, _0233F12C @ =0x02352A5C
	ldm r4!, {r0, r1, r2, r3}
	add r5, sp, #0xc
	stm r5!, {r0, r1, r2, r3}
	ldr r4, [r4]
	ldrb lr, [ip, #0xa]
	str r4, [r5]
	ldrb r5, [ip, #8]
	ldrb r4, [ip, #9]
	ldrb r3, [ip, #0xb]
	ldrb r2, [ip, #0xc]
	mov r0, #0x18
	mov r1, #4
	strb r5, [sp, #4]
	strb r4, [sp, #5]
	strb lr, [sp, #6]
	strb r3, [sp, #7]
	strb r2, [sp, #8]
	bl ov02_0234E7B4
	ldr r2, _0233F130 @ =0x0235AAE4
	mov r1, #0
	str r0, [r2]
	add r0, sp, #0
	bl ov02_02338DC8
	ldr r0, _0233F130 @ =0x0235AAE4
	ldr r2, [sp]
	add r1, sp, #0xc
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _0233F130 @ =0x0235AAE4
	ldr r1, _0233F134 @ =0x02353970
	ldr r4, [r0]
	mov r2, #3
	add r0, r4, #8
	bl FUN_02087348
	cmp r0, #0
	movne r0, #3
	strbne r0, [r4, #0x14]
	bne _0233F098
	add r0, r4, #8
	mov r1, #0
	mov r2, #0xc
	bl FUN_0207C40C
	ldr r0, _0233F130 @ =0x0235AAE4
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x14]
_0233F098:
	bl ov02_0233F13C
	ldr r0, [sp]
	add r0, r0, #0xb
	bl ov02_02335268
	ldr r2, [sp]
	add r0, sp, #4
	ldrb r0, [r0, r2]
	mvn r1, #0
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #2
	bl ov02_02334DE8
	mov r0, #0
	mov r1, r0
	bl ov02_0234DDC8
	ldr r2, _0233F130 @ =0x0235AAE4
	mov r1, #0x3f
	ldr r2, [r2]
	str r0, [r2]
	mov r0, #0
	bl ov02_0234D6AC
	ldr r1, _0233F130 @ =0x0235AAE4
	ldr r2, [r1]
	str r0, [r2, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	bl ov02_0233F8F0
	bl ov02_0233F82C
	ldr r0, _0233F138 @ =ov02_0233F1F8
	bl ov02_02338D68
	add sp, sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233F128: .4byte 0x02352A74
_0233F12C: .4byte 0x02352A5C
_0233F130: .4byte 0x0235AAE4
_0233F134: .4byte 0x02353970
_0233F138: .4byte ov02_0233F1F8
	arm_func_end ov02_0233EFC8

	arm_func_start ov02_0233F13C
ov02_0233F13C: @ 0x0233F13C
	push {r3, lr}
	ldr r0, _0233F1D0 @ =0x02353974
	ldr r1, _0233F1D4 @ =0x02077DA4
	bl ov02_02334DA8
	ldr r0, _0233F1D8 @ =0x02353988
	ldr r1, _0233F1DC @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _0233F1E0 @ =0x023539A0
	ldr r1, _0233F1E4 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _0233F1E8 @ =0x023539B8
	ldr r1, _0233F1EC @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233F1F0 @ =0x04001008
	ldr r1, _0233F1F4 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233F1D0: .4byte 0x02353974
_0233F1D4: .4byte 0x02077DA4
_0233F1D8: .4byte 0x02353988
_0233F1DC: .4byte 0x02078310
_0233F1E0: .4byte 0x023539A0
_0233F1E4: .4byte FUN_02077CF8
_0233F1E8: .4byte 0x023539B8
_0233F1EC: .4byte FUN_020780D0
_0233F1F0: .4byte 0x04001008
_0233F1F4: .4byte 0x0400000A
	arm_func_end ov02_0233F13C

	arm_func_start ov02_0233F1F8
ov02_0233F1F8: @ 0x0233F1F8
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0233F248 @ =ov02_0233F24C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F248: .4byte ov02_0233F24C
	arm_func_end ov02_0233F1F8

	arm_func_start ov02_0233F24C
ov02_0233F24C: @ 0x0233F24C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02337184
	mov r0, #0x14
	bl ov02_023480E0
	ldr r0, _0233F2D0 @ =0x0235AAE4
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0233F2A4
	mov r0, #0
	bl ov02_02337508
	mov r0, #0
	bl ov02_02337530
	b _0233F2C4
_0233F2A4:
	mov r0, #0x1a
	bl ov02_0233F618
	cmp r0, #0
	beq _0233F2BC
	mov r0, #0
	bl ov02_0233751C
_0233F2BC:
	mov r0, #0
	bl ov02_02337530
_0233F2C4:
	ldr r0, _0233F2D4 @ =0x0233F2D8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F2D0: .4byte 0x0235AAE4
_0233F2D4: .4byte 0x0233F2D8
	arm_func_end ov02_0233F24C
_0233F2D8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x84, 0xE0, 0xFF, 0xEB
	.byte 0x1F, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x08, 0x04, 0x00, 0x9F, 0xE5, 0x9D, 0xE6, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xF8, 0xF2, 0x33, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0x00, 0xEB
	.byte 0xE9, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0233F308
ov02_0233F308: @ 0x0233F308
	push {r3, r4, r5, lr}
	bl ov02_023374F4
	mov r4, r0
	cmp r4, #0
	bgt _0233F324
	popeq {r3, r4, r5, pc}
	b _0233F4E8
_0233F324:
	sub r0, r4, #0x10
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0233F4E8
_0233F334: @ jump table
	b _0233F348 @ case 0
	b _0233F3F0 @ case 1
	b _0233F444 @ case 2
	b _0233F468 @ case 3
	pop {r3, r4, r5, pc} @ case 4
_0233F348:
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrbeq r0, [r1, #0xa]
	cmpeq r0, #0
	beq _0233F600
	mov r0, #3
	bl ov02_023480E0
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r0, r1, r1, lsl #1
	add r0, r0, #2
	add r0, r2, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	subeq r0, r1, #1
	strbeq r0, [r2, #0x14]
	ldr r0, _0233F60C @ =0x0235AAE4
	mov r1, #0
	ldr r3, [r0]
	mov r2, #3
	ldrb r0, [r3, #0x14]
	add r3, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r3, r0
	bl FUN_0207C40C
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldrbeq r0, [r1, #0xa]
	cmpeq r0, #0
	bne _0233F3DC
	mov r0, #0
	bl ov02_02337508
_0233F3DC:
	mov r0, #1
	bl ov02_0233751C
	mov r0, #0
	bl ov02_02337530
	b _0233F600
_0233F3F0:
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	bhs _0233F600
	add r0, r0, r0, lsl #1
	add r0, r0, #2
	add r0, r1, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0233F600
	mov r0, #1
	bl ov02_023480E0
	ldr r1, _0233F60C @ =0x0235AAE4
	mov r0, #0
	ldr r2, [r1]
	ldrb r1, [r2, #0x14]
	add r1, r1, #1
	strb r1, [r2, #0x14]
	bl ov02_02337530
	b _0233F600
_0233F444:
	ldr r0, _0233F60C @ =0x0235AAE4
	mov r2, #0
	ldr r1, [r0]
	mov r0, #7
	strb r2, [r1, #0x15]
	bl ov02_023480E0
	ldr r0, _0233F610 @ =ov02_0233F6B0
	bl ov02_02338D68
	pop {r3, r4, r5, pc}
_0233F468:
	bl ov02_0233FACC
	cmp r0, #0
	beq _0233F490
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _0233F60C @ =0x0235AAE4
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x15]
	b _0233F4A8
_0233F490:
	ldr r0, _0233F60C @ =0x0235AAE4
	mov r2, #2
	ldr r1, [r0]
	mov r0, #9
	strb r2, [r1, #0x15]
	bl ov02_023480E0
_0233F4A8:
	ldr r1, _0233F60C @ =0x0235AAE4
	mov r3, #3
	ldr r2, [r1]
	ldr r0, _0233F614 @ =0xC1FFFCFF
	strb r3, [r2, #0x14]
	ldr r1, [r1]
	ldr r2, [r1, #4]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x200
	str r0, [r2]
	bl ov02_0233F8F0
	bl ov02_0233FA54
	ldr r0, _0233F610 @ =ov02_0233F6B0
	bl ov02_02338D68
	pop {r3, r4, r5, pc}
_0233F4E8:
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bne _0233F50C
	mov r0, #0x1a
	bl ov02_0233F618
	cmp r0, #0
	bne _0233F600
_0233F50C:
	mov r0, #1
	bl ov02_023480E0
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	add r5, r2, #8
	add lr, r1, r1, lsl #1
	add ip, lr, #2
	ldrb r3, [r5, ip]
	cmp r3, #0
	strbeq r4, [r5, ip]
	beq _0233F5A4
	add r2, lr, #1
	ldrb r1, [r5, r2]
	cmp r1, #0
	bne _0233F580
	strb r3, [r5, r2]
	mov r0, #0x1a
	strb r4, [r5, ip]
	bl ov02_0233F618
	cmp r0, #0
	beq _0233F5A4
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	addlo r0, r0, #1
	strblo r0, [r1, #0x14]
	b _0233F5A4
_0233F580:
	strb r1, [r5, lr]
	ldrb r1, [r5, ip]
	strb r1, [r5, r2]
	strb r4, [r5, ip]
	ldr r1, [r0]
	ldrb r0, [r1, #0x14]
	cmp r0, #3
	addlo r0, r0, #1
	strblo r0, [r1, #0x14]
_0233F5A4:
	mov r0, #1
	bl ov02_02337508
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bhs _0233F5CC
	mov r0, #1
	bl ov02_02337530
	b _0233F5D4
_0233F5CC:
	mov r0, #0
	bl ov02_02337530
_0233F5D4:
	ldr r0, _0233F60C @ =0x0235AAE4
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #3
	bne _0233F600
	mov r0, #0x1a
	bl ov02_0233F618
	cmp r0, #0
	beq _0233F600
	mov r0, #0
	bl ov02_0233751C
_0233F600:
	bl ov02_0233F82C
	bl ov02_0233F8F0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0233F60C: .4byte 0x0235AAE4
_0233F610: .4byte ov02_0233F6B0
_0233F614: .4byte 0xC1FFFCFF
	arm_func_end ov02_0233F308

	arm_func_start ov02_0233F618
ov02_0233F618: @ 0x0233F618
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _0233F6A8 @ =0x0235AAE4
	mov r4, r0
	ldr r1, [r1]
	ldrb r0, [r1, #0x14]
	add r3, r1, #8
	add r2, r0, r0, lsl #1
	ldrb r0, [r3, r2]
	cmp r0, #0
	cmpne r0, #0x20
	addne sp, sp, #4
	movne r0, #1
	popne {r3, r4, pc}
	add r0, r3, r2
	add r1, sp, #0
	mov r2, #3
	bl FUN_0207C4C8
	mov r2, #0
	add r3, sp, #0
	strb r2, [sp, #3]
	mov r0, #0x20
_0233F670:
	ldrb r1, [r3]
	cmp r1, #0
	bne _0233F68C
	add r2, r2, #1
	cmp r2, #3
	strb r0, [r3], #1
	blt _0233F670
_0233F68C:
	add r0, sp, #0
	bl FUN_0208B360
	cmp r0, r4
	movge r0, #1
	movlt r0, #0
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0233F6A8: .4byte 0x0235AAE4
	arm_func_end ov02_0233F618

	arm_func_start ov02_0233F6AC
ov02_0233F6AC: @ 0x0233F6AC
	bx lr
	arm_func_end ov02_0233F6AC

	arm_func_start ov02_0233F6B0
ov02_0233F6B0: @ 0x0233F6B0
	push {r3, lr}
	mov r0, #8
	bl ov02_0234DAE0
	ldr r0, _0233F6C8 @ =ov02_0233F6CC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F6C8: .4byte ov02_0233F6CC
	arm_func_end ov02_0233F6B0

	arm_func_start ov02_0233F6CC
ov02_0233F6CC: @ 0x0233F6CC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023374C0
	mov r0, #0x15
	bl ov02_023480E0
	ldr r0, _0233F6F8 @ =ov02_0233F6FC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F6F8: .4byte ov02_0233F6FC
	arm_func_end ov02_0233F6CC

	arm_func_start ov02_0233F6FC
ov02_0233F6FC: @ 0x0233F6FC
	push {r3, lr}
	bl ov02_02337544
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233F778 @ =0x0235AAE4
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _0233F72C
	ldr r0, _0233F77C @ =ov02_0233F788
	bl ov02_02338D68
	pop {r3, pc}
_0233F72C:
	mov r2, #1
	cmp r0, #2
	mov ip, #0
	sub r3, r2, #2
	bne _0233F75C
	mov r0, #6
	mov r1, #3
	str ip, [sp]
	bl ov02_02349394
	ldr r0, _0233F780 @ =ov02_0233FC20
	bl ov02_02338D68
	pop {r3, pc}
_0233F75C:
	mov r0, #0x47
	mov r1, #2
	str ip, [sp]
	bl ov02_02349394
	ldr r0, _0233F784 @ =ov02_0233F944
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F778: .4byte 0x0235AAE4
_0233F77C: .4byte ov02_0233F788
_0233F780: .4byte ov02_0233FC20
_0233F784: .4byte ov02_0233F944
	arm_func_end ov02_0233F6FC

	arm_func_start ov02_0233F788
ov02_0233F788: @ 0x0233F788
	push {r3, lr}
	bl ov02_02334D10
	ldr r0, _0233F818 @ =0x0235AAE4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov02_0234F2C0
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _0233F81C @ =0x023539D0
	ldr r1, _0233F820 @ =0x02077DA4
	bl ov02_02334DA8
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	add r0, sp, #0
	mov r1, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	mov r1, #1
	cmp r0, #3
	addge r0, r0, #1
	strge r0, [sp]
	mov r0, #2
	bl ov02_02338D78
	ldr r1, [sp]
	mov r0, #0
	add r1, r1, #3
	bl ov02_02338DB4
	ldr r0, _0233F824 @ =ov02_023402CC
	bl ov02_02338D68
	ldr r0, _0233F828 @ =0x0235AAE4
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_0233F818: .4byte 0x0235AAE4
_0233F81C: .4byte 0x023539D0
_0233F820: .4byte 0x02077DA4
_0233F824: .4byte ov02_023402CC
_0233F828: .4byte 0x0235AAE4
	arm_func_end ov02_0233F788

	arm_func_start ov02_0233F82C
ov02_0233F82C: @ 0x0233F82C
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c
	ldr r0, _0233F8E4 @ =0x0235AAE4
	ldr r1, _0233F8E8 @ =0x02352A5C
	ldr r0, [r0]
	ldrh r5, [r1, #0xe]
	ldrh r4, [r1, #0x10]
	mov r3, #0xb
	mov r2, #0x10
	ldr r0, [r0]
	mov r1, #0
	strh r5, [sp, #0x14]
	strh r4, [sp, #0x16]
	strh r3, [sp, #0x18]
	strh r2, [sp, #0x1a]
	bl ov02_0234E2A8
	mov r4, #0
	ldr r5, _0233F8EC @ =0x02352A9C
	ldr r6, _0233F8E4 @ =0x0235AAE4
	strh r4, [sp, #0x12]
	mov sb, #2
	mov r8, #0x480
	add r7, sp, #0x10
_0233F888:
	ldr ip, [r6]
	ldrb r1, [r5], #1
	add r0, ip, r4
	ldrb r3, [r0, #8]
	ldrh r0, [sp, #0x1a]
	ldrh r2, [sp, #0x16]
	strh r3, [sp, #0x10]
	stm sp, {r0, sb}
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	ldrh r3, [sp, #0x18]
	ldr r0, [ip]
	strh r1, [sp, #0x14]
	bl ov02_0234E1E8
	add r4, r4, #1
	cmp r4, #0xc
	blt _0233F888
	ldr r0, _0233F8E4 @ =0x0235AAE4
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov02_0234E354
	add sp, sp, #0x1c
	pop {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233F8E4: .4byte 0x0235AAE4
_0233F8E8: .4byte 0x02352A5C
_0233F8EC: .4byte 0x02352A9C
	arm_func_end ov02_0233F82C

	arm_func_start ov02_0233F8F0
ov02_0233F8F0: @ 0x0233F8F0
	ldr r0, _0233F938 @ =0x0235AAE4
	ldr r2, [r0]
	ldrb r0, [r2, #0x14]
	ldr r3, [r2, #4]
	cmp r0, #3
	movgt r0, #3
	add r1, r0, r0, lsl #1
	ldr r0, _0233F93C @ =0x02352A9C
	add r1, r1, #2
	ldrb r2, [r0, r1]
	ldr r1, [r3]
	ldr r0, _0233F940 @ =0xFE00FF00
	lsl r2, r2, #0x17
	and r0, r1, r0
	orr r0, r0, #0x28
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	bx lr
	.align 2, 0
_0233F938: .4byte 0x0235AAE4
_0233F93C: .4byte 0x02352A9C
_0233F940: .4byte 0xFE00FF00
	arm_func_end ov02_0233F8F0

	arm_func_start ov02_0233F944
ov02_0233F944: @ 0x0233F944
	push {r3, lr}
	bl ov02_02349704
	ldr r1, _0233F998 @ =0x0235AAE4
	ldr r2, [r1]
	strb r0, [r2, #0x15]
	ldr r0, [r1]
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0233F974
	cmp r0, #1
	beq _0233F980
	pop {r3, pc}
_0233F974:
	mov r0, #7
	bl ov02_023480E0
	b _0233F988
_0233F980:
	mov r0, #0xe
	bl ov02_023480E0
_0233F988:
	bl ov02_023496C0
	ldr r0, _0233F99C @ =ov02_0233F9A0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233F998: .4byte 0x0235AAE4
_0233F99C: .4byte ov02_0233F9A0
	arm_func_end ov02_0233F944

	arm_func_start ov02_0233F9A0
ov02_0233F9A0: @ 0x0233F9A0
	push {r3, lr}
	sub sp, sp, #0x18
	ldr lr, _0233FA40 @ =0x02352A88
	add ip, sp, #4
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldr r0, [lr]
	str r0, [ip]
	bl ov02_02349718
	cmp r0, #0
	addne sp, sp, #0x18
	popne {r3, pc}
	ldr r0, _0233FA44 @ =0x0235AAE4
	ldr r1, [r0]
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _0233FA08
	ldr r3, [r1, #4]
	ldr r1, _0233FA48 @ =0xC1FFFCFF
	ldr r2, [r3]
	ldr r0, _0233FA4C @ =ov02_0233F24C
	and r1, r2, r1
	str r1, [r3]
	bl ov02_02338D68
	add sp, sp, #0x18
	pop {r3, pc}
_0233FA08:
	add r0, sp, #0
	mov r1, #0
	bl ov02_02338DC8
	ldr r0, _0233FA44 @ =0x0235AAE4
	ldr r2, [sp]
	add r1, sp, #4
	ldr r0, [r0]
	ldr r1, [r1, r2, lsl #2]
	add r0, r0, #8
	blx r1
	ldr r0, _0233FA50 @ =ov02_0233F788
	bl ov02_02338D68
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_0233FA40: .4byte 0x02352A88
_0233FA44: .4byte 0x0235AAE4
_0233FA48: .4byte 0xC1FFFCFF
_0233FA4C: .4byte ov02_0233F24C
_0233FA50: .4byte ov02_0233F788
	arm_func_end ov02_0233F9A0

	arm_func_start ov02_0233FA54
ov02_0233FA54: @ 0x0233FA54
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r0, _0233FAC8 @ =0x0235AAE4
	mov r6, r4
	mov r1, #0x20
	mov r2, #0x30
	mov ip, r4
_0233FA70:
	ldr r3, [r0]
	mov r5, ip
	add r3, r3, #8
	add lr, r3, r6
_0233FA80:
	ldrb r3, [lr, r5]
	cmp r3, #0x30
	cmpne r3, #0x20
	cmpne r3, #0
	bne _0233FAB0
	cmp r5, #2
	moveq r3, r2
	movne r3, r1
	strb r3, [lr, r5]
	add r5, r5, #1
	cmp r5, #3
	blt _0233FA80
_0233FAB0:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #3
	blt _0233FA70
	bl ov02_0233F82C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0233FAC8: .4byte 0x0235AAE4
	arm_func_end ov02_0233FA54

	arm_func_start ov02_0233FACC
ov02_0233FACC: @ 0x0233FACC
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _0233FC18 @ =0x02352A5C
	mov r0, #0
	ldrb ip, [r2]
	ldrb r3, [r2, #1]
	ldr r1, _0233FC1C @ =0x0235AAE4
	strb ip, [sp, #8]
	strb r3, [sp, #9]
	ldrb ip, [r2, #2]
	ldrb r3, [r2, #3]
	ldr r2, [r1]
	add r4, sp, #8
	strb ip, [sp, #0xa]
	mov r7, r0
	strb r3, [sp, #0xb]
	add lr, r2, #8
	mov ip, r0
_0233FB14:
	ldrb r1, [lr, r7]
	add r5, lr, r7
	cmp r1, #0x20
	beq _0233FB58
	mov r6, ip
	mov r8, r4
_0233FB2C:
	ldrb r3, [r5, r6]
	ldrb r1, [r8]
	cmp r3, r1
	addhi sp, sp, #0xc
	movhi r0, #0
	pophi {r3, r4, r5, r6, r7, r8, pc}
	blo _0233FB58
	add r6, r6, #1
	cmp r6, #3
	add r8, r8, #1
	blt _0233FB2C
_0233FB58:
	add r0, r0, #1
	cmp r0, #4
	add r7, r7, #3
	blt _0233FB14
	add r1, sp, #0
	add r0, r2, #8
	bl ov02_02347F80
	add r0, sp, #4
	mov r1, #0
	bl ov02_02338DC8
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0233FBFC
	mov r4, #0
	mov r1, #1
	add r5, sp, #0
	mov r6, r4
	mov r2, r1
	mov ip, r4
_0233FBA4:
	ldrb r3, [r5]
	mov r7, ip
_0233FBAC:
	cmp r4, #0
	rsb r0, r7, #7
	beq _0233FBCC
	tst r3, r2, lsl r0
	beq _0233FBD4
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_0233FBCC:
	tst r3, r1, lsl r0
	moveq r4, r1
_0233FBD4:
	add r7, r7, #1
	cmp r7, #8
	blt _0233FBAC
	add r6, r6, #1
	cmp r6, #4
	add r5, r5, #1
	blt _0233FBA4
	add sp, sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, pc}
_0233FBFC:
	add r0, sp, #0
	bl FUN_022ED8C0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0233FC18: .4byte 0x02352A5C
_0233FC1C: .4byte 0x0235AAE4
	arm_func_end ov02_0233FACC

	arm_func_start ov02_0233FC20
ov02_0233FC20: @ 0x0233FC20
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _0233FC48 @ =ov02_0233FC4C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233FC48: .4byte ov02_0233FC4C
	arm_func_end ov02_0233FC20

	arm_func_start ov02_0233FC4C
ov02_0233FC4C: @ 0x0233FC4C
	push {r3, lr}
	bl ov02_02349718
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0233FC84 @ =0x0235AAE4
	ldr r1, _0233FC88 @ =0xC1FFFCFF
	ldr r2, [r0]
	ldr r0, _0233FC8C @ =ov02_0233F24C
	ldr r3, [r2, #4]
	ldr r2, [r3]
	and r1, r2, r1
	str r1, [r3]
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0233FC84: .4byte 0x0235AAE4
_0233FC88: .4byte 0xC1FFFCFF
_0233FC8C: .4byte ov02_0233F24C
	arm_func_end ov02_0233FC4C
_0233FC90:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x04, 0x00, 0x00, 0xEB, 0x23, 0x00, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x30, 0xE4, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xA0, 0x00, 0x34, 0x02

	arm_func_start ov02_0233FCAC
ov02_0233FCAC: @ 0x0233FCAC
	push {r3, lr}
	ldr r0, _0233FD1C @ =0x023539E8
	ldr r1, _0233FD20 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _0233FD24 @ =0x04001008
	ldr r1, _0233FD28 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0233FD1C: .4byte 0x023539E8
_0233FD20: .4byte FUN_020780D0
_0233FD24: .4byte 0x04001008
_0233FD28: .4byte 0x0400000A
	arm_func_end ov02_0233FCAC

	arm_func_start ov02_0233FD2C
ov02_0233FD2C: @ 0x0233FD2C
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	add r1, sp, #0x18
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, _02340074 @ =0x0235AAE8
	ldr r2, _02340078 @ =0xFFFFB17D
	ldr r1, [r0]
	cmp r1, r2
	movge r6, #0
	bge _0233FF88
	sub r0, r2, #1
	cmp r1, r0
	movge r6, #2
	bge _0233FF88
	sub r0, r2, #2
	cmp r1, r0
	movge r6, #0x13
	bge _0233FF88
	sub r0, r2, #8
	cmp r1, r0
	movge r6, #2
	bge _0233FF88
	sub r0, r2, #9
	cmp r1, r0
	movge r6, #0x12
	bge _0233FF88
	sub r0, r2, #0xa
	cmp r1, r0
	movge r6, #2
	bge _0233FF88
	sub r0, r2, #0xb
	cmp r1, r0
	movge r6, #3
	bge _0233FF88
	sub r0, r2, #0x384
	cmp r1, r0
	movge r6, #2
	bge _0233FF88
	ldr r0, _0234007C @ =0xFFFFA629
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r0, #0x3e8
	cmp r1, r0
	movge r6, #0x13
	bge _0233FF88
	ldr r0, _02340080 @ =0xFFFF3CB1
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r2, r0, #3
	cmp r1, r2
	movge r6, #7
	bge _0233FF88
	sub r2, r0, #4
	cmp r1, r2
	movge r6, #5
	bge _0233FF88
	sub r2, r0, #0x63
	cmp r1, r2
	movge r6, #0
	bge _0233FF88
	sub r2, r0, #0x64
	cmp r1, r2
	blt _0233FE48
	ldr r0, [sp, #0x18]
	cmp r0, #2
	moveq r6, #5
	movne r6, #7
	b _0233FF88
_0233FE48:
	ldr r3, _02340084 @ =0xFFFF3866
	cmp r1, r3
	movge r6, #0
	bge _0233FF88
	sub r2, r3, #1
	cmp r1, r2
	blt _0233FE78
	ldr r0, [sp, #0x18]
	cmp r0, #2
	moveq r6, #5
	movne r6, #8
	b _0233FF88
_0233FE78:
	sub r2, r3, #4
	cmp r1, r2
	movge r6, #9
	bge _0233FF88
	sub r2, r3, #5
	cmp r1, r2
	movge r6, #5
	bge _0233FF88
	sub r2, r3, #0x65
	cmp r1, r2
	movge r6, #0
	bge _0233FF88
	sub r2, r3, #0xc9
	cmp r1, r2
	movge r6, #0x14
	bge _0233FF88
	sub r2, r3, #0xcc
	cmp r1, r2
	movge r6, #0x15
	bge _0233FF88
	sub r2, r3, #0xcd
	cmp r1, r2
	movge r6, #4
	bge _0233FF88
	sub r0, r0, #0x7d0
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r3, #0x388
	cmp r1, r0
	movge r6, #0xa
	bge _0233FF88
	ldr r2, _02340088 @ =0xFFFF34DD
	cmp r1, r2
	movge r6, #0x16
	bge _0233FF88
	sub r0, r2, #0x60
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r2, #0x64
	cmp r1, r0
	movge r6, #0xb
	bge _0233FF88
	sub r0, r2, #0xc4
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r2, #0xc8
	cmp r1, r0
	movge r6, #0xb
	bge _0233FF88
	sub r0, r2, #0x128
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r2, #0x18c
	cmp r1, r0
	movge r6, #2
	bge _0233FF88
	sub r0, r2, #0x3e4
	cmp r1, r0
	movge r6, #0
	bge _0233FF88
	sub r0, r2, #0x510
	cmp r1, r0
	movge r6, #2
	movlt r6, #0
_0233FF88:
	bl ov02_02338DF0
	mov r2, r0
	ldr r1, _0234008C @ =0x02352AA8
	mov r0, #0
	ldrb r1, [r1, r2]
	bl ov02_0234DDC8
	ldr r1, _02340090 @ =0x0235AA98
	mov r5, r0
	ldr r0, [r1]
	mov r1, r6
	bl ov02_02338F5C
	ldr r3, _02340074 @ =0x0235AAE8
	mov r4, r0
	ldr r3, [r3]
	ldr r2, _02340094 @ =0x023539FC
	add r0, sp, #0x10
	mov r1, #8
	rsb r3, r3, #0
	bl FUN_0207911C
	add r0, sp, #0x1c
	add r1, sp, #0x10
	mov r2, #8
	bl ov02_0234F5C8
	bl ov02_02338DF0
	lsl r1, r0, #2
	ldr r0, _02340098 @ =0x02352ABA
	ldrh r7, [r0, r1]
	bl ov02_02338DF0
	lsl r3, r0, #2
	ldr r1, _0234009C @ =0x02352AB8
	mov r0, #0xa
	ldrh r1, [r1, r3]
	str r0, [sp]
	add r3, sp, #0x1c
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r2, r7
	mov r0, r5
	mov r3, #2
	bl ov02_0234E13C
	cmp r6, #0
	beq _02340064
	bl ov02_02334FA0
	mov r1, #0x5e
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, r5
	mov r1, #0xd
	mov r2, #0x3c
	mov r3, #0xe6
	str r4, [sp, #0xc]
	bl ov02_0234E1E8
_02340064:
	mov r0, r5
	bl ov02_0234E354
	add sp, sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02340074: .4byte 0x0235AAE8
_02340078: .4byte 0xFFFFB17D
_0234007C: .4byte 0xFFFFA629
_02340080: .4byte 0xFFFF3CB1
_02340084: .4byte 0xFFFF3866
_02340088: .4byte 0xFFFF34DD
_0234008C: .4byte 0x02352AA8
_02340090: .4byte 0x0235AA98
_02340094: .4byte 0x023539FC
_02340098: .4byte 0x02352ABA
_0234009C: .4byte 0x02352AB8
	arm_func_end ov02_0233FD2C

	arm_func_start ov02_023400A0
ov02_023400A0: @ 0x023400A0
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _023400D0 @ =ov02_023400D4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023400D0: .4byte ov02_023400D4
	arm_func_end ov02_023400A0

	arm_func_start ov02_023400D4
ov02_023400D4: @ 0x023400D4
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #4
	bl ov02_02334E38
	ldr r0, _0234010C @ =0x02340110
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234010C: .4byte 0x02340110
	arm_func_end ov02_023400D4
_02340110:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x70, 0xD1, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0x89, 0xD1, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x0D, 0xE3, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x38, 0x01, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB
	.byte 0x09, 0x00, 0x00, 0xEB, 0x09, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0234014C
ov02_0234014C: @ 0x0234014C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0234014C

	arm_func_start ov02_0234016C
ov02_0234016C: @ 0x0234016C
	bx lr
	arm_func_end ov02_0234016C

	arm_func_start ov02_02340170
ov02_02340170: @ 0x02340170
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _02340194 @ =0x02340198
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02340194: .4byte 0x02340198
	arm_func_end ov02_02340170
_02340198:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x71, 0xD1, 0xFF, 0xEB
	.byte 0x08, 0x00, 0xA0, 0xE3, 0x4D, 0x36, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xED, 0xE2, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xB8, 0x01, 0x34, 0x02

	arm_func_start ov02_023401B8
ov02_023401B8: @ 0x023401B8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02340204 @ =ov02_02340208
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02340204: .4byte ov02_02340208
	arm_func_end ov02_023401B8

	arm_func_start ov02_02340208
ov02_02340208: @ 0x02340208
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	mov r0, #2
	beq _0234028C
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _023402B4 @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
_0234028C:
	mov r1, #0
	bl ov02_02338D78
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	mov r0, #0
	bl ov02_02342798
	ldr r0, _023402B8 @ =ov02_023402CC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023402B4: .4byte ov02_02343DB0
_023402B8: .4byte ov02_023402CC
	arm_func_end ov02_02340208

	arm_func_start ov02_023402BC
ov02_023402BC: @ 0x023402BC
	ldr r1, _023402C8 @ =0x0235AAE8
	str r0, [r1]
	bx lr
	.align 2, 0
_023402C8: .4byte 0x0235AAE8
	arm_func_end ov02_023402BC

	arm_func_start ov02_023402CC
ov02_023402CC: @ 0x023402CC
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	bl ov02_02347518
	mov r4, r0
	mov r0, #0x48
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _023404B0 @ =0x0235AAEC
	mov r2, #0xc
	str r0, [r1, #8]
	ldrb r3, [r4, #0xf6]
	strb r3, [r0, #0x43]
	ldr r0, [r1, #8]
	strb r2, [r0, #0x42]
	bl ov02_023406DC
	bl ov02_023404C8
	ldr r0, _023404B0 @ =0x0235AAEC
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0234033C
	bl ov02_02338DF0
	ldr r1, _023404B4 @ =0x02352BB0
	ldrb r2, [r4, #0xf4]
	ldrsb r1, [r1, r0]
	mov r0, #0x30
	add r2, r2, #1
	bl ov02_02334C3C
	b _0234034C
_0234033C:
	mov r0, #0x45
	sub r1, r0, #0x46
	mov r2, #0
	bl ov02_02334C3C
_0234034C:
	mov r0, #1
	bl ov02_02334DE8
	bl ov02_023352DC
	ldr r0, _023404B0 @ =0x0235AAEC
	mov r1, #0x37
	ldrh r3, [r0, #4]
	ldr r2, _023404B8 @ =0xE1FC780F
	mov r0, #2
	mul r5, r3, r1
	smull r1, r3, r2, r5
	add r3, r5, r3
	lsr r1, r5, #0x1f
	add r3, r1, r3, asr #7
	str r3, [sp]
	mov r1, #0x55
	mov r2, #0xf1
	mov r3, #0x41
	bl ov02_02346964
	mov r0, #0
	mov r1, #1
	bl ov02_0234DDC8
	ldr r6, _023404B0 @ =0x0235AAEC
	mov r5, #0
	ldr r1, [r6, #8]
	mov r8, r5
	str r0, [r1, #0x14]
	mov r7, #0x29
_023403B8:
	mov r0, r8
	mov r1, r7
	bl ov02_0234D6AC
	ldr r1, [r6, #8]
	add r1, r1, r5, lsl #2
	add r5, r5, #1
	str r0, [r1, #0x18]
	cmp r5, #7
	blt _023403B8
	ldrb r0, [r4, #0xe7]
	cmp r0, #1
	beq _023403F4
	cmp r0, #2
	beq _02340428
	b _02340458
_023403F4:
	mov r0, #0
	mov r1, #0x50
	bl ov02_0234D6AC
	ldr r1, _023404B0 @ =0x0235AAEC
	ldr r2, [r1, #8]
	str r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldr r1, [r0, #0x34]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	b _02340458
_02340428:
	mov r0, #0
	mov r1, #0x51
	bl ov02_0234D6AC
	ldr r1, _023404B0 @ =0x0235AAEC
	ldr r2, [r1, #8]
	str r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldr r1, [r0, #0x34]
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
_02340458:
	ldr r1, _023404BC @ =ov02_02342020
	mov r0, #1
	mov r2, #0
	mov r3, #0x6e
	bl ov02_0234FA98
	ldr r2, _023404B0 @ =0x0235AAEC
	ldr r1, _023404C0 @ =ov02_02342580
	ldr r2, [r2, #8]
	mov r3, #0x78
	str r0, [r2, #0x3c]
	mov r0, #0
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _023404B0 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1]
	bl ov02_02341294
	bl ov02_023420A4
	ldr r0, _023404C4 @ =ov02_02340718
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023404B0: .4byte 0x0235AAEC
_023404B4: .4byte 0x02352BB0
_023404B8: .4byte 0xE1FC780F
_023404BC: .4byte ov02_02342020
_023404C0: .4byte ov02_02342580
_023404C4: .4byte ov02_02340718
	arm_func_end ov02_023402CC

	arm_func_start ov02_023404C8
ov02_023404C8: @ 0x023404C8
	stmdb sp!, {lr}
	sub sp, sp, #0x44
	ldr r3, _0234069C @ =0x02352B4F
	add ip, sp, #0x2b
	mov r2, #0xb
_023404DC:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [ip]
	strb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	bne _023404DC
	ldrb r0, [r3]
	ldr r3, _023406A0 @ =0x02352B24
	add lr, sp, #0x16
	strb r0, [ip]
	mov r2, #0xa
_02340510:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [lr]
	strb r0, [lr, #1]
	add lr, lr, #2
	subs r2, r2, #1
	bne _02340510
	ldrb r0, [r3]
	ldr ip, _023406A4 @ =0x02352B39
	add r3, sp, #0
	strb r0, [lr]
	mov r2, #0xb
_02340544:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02340544
	ldr r3, _023406A8 @ =0x0400000C
	ldr r0, _023406AC @ =0x02353A00
	ldrh r2, [r3]
	ldr r1, _023406B0 @ =0x02077DA4
	and r2, r2, #0x43
	orr r2, r2, #0x218
	orr r2, r2, #0xc00
	strh r2, [r3]
	bl ov02_02334DA8
	ldr r0, _023406B4 @ =0x02353A14
	ldr r1, _023406B8 @ =0x02078370
	bl ov02_02334DA8
	ldr r0, _023406BC @ =0x02353A2C
	ldr r1, _023406C0 @ =0x02078310
	bl ov02_02334DA8
	ldr r1, _023406C4 @ =FUN_02077CF8
	add r0, sp, #0x16
	bl ov02_02334DA8
	ldr r0, _023406C8 @ =0x02353A44
	ldr r1, _023406CC @ =0x02078130
	bl ov02_02334DA8
	add r0, sp, #0x2b
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _023406D0 @ =0x0235AAEC
	ldr r2, [r1, #8]
	str r0, [r2, #8]
	ldr r0, [r1, #8]
	ldr r0, [r0, #8]
	bl ov02_02346750
	bl ov02_023467DC
	add r0, sp, #0x16
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _023406D0 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	add r0, sp, #0
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _023406D0 @ =0x0235AAEC
	ldr r2, _023406D4 @ =0x04001008
	ldr r1, [r1, #8]
	str r0, [r1, #0x10]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	sub r2, r2, #0x1000
	ldrh r0, [r2]
	ldr r1, _023406D8 @ =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	bic r0, r0, #3
	orr r0, r0, #2
	strh r0, [r1, #4]
	add sp, sp, #0x44
	ldm sp!, {pc}
	.align 2, 0
_0234069C: .4byte 0x02352B4F
_023406A0: .4byte 0x02352B24
_023406A4: .4byte 0x02352B39
_023406A8: .4byte 0x0400000C
_023406AC: .4byte 0x02353A00
_023406B0: .4byte 0x02077DA4
_023406B4: .4byte 0x02353A14
_023406B8: .4byte 0x02078370
_023406BC: .4byte 0x02353A2C
_023406C0: .4byte 0x02078310
_023406C4: .4byte FUN_02077CF8
_023406C8: .4byte 0x02353A44
_023406CC: .4byte 0x02078130
_023406D0: .4byte 0x0235AAEC
_023406D4: .4byte 0x04001008
_023406D8: .4byte 0x0400000A
	arm_func_end ov02_023404C8

	arm_func_start ov02_023406DC
ov02_023406DC: @ 0x023406DC
	push {r3, lr}
	bl ov02_02347518
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02340714 @ =0x0235AAEC
	mov r1, #0
	strh r1, [r0, #4]
	strb r1, [r0]
	strb r1, [r0, #2]
	pop {r3, pc}
	.align 2, 0
_02340714: .4byte 0x0235AAEC
	arm_func_end ov02_023406DC

	arm_func_start ov02_02340718
ov02_02340718: @ 0x02340718
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x1d
	bl ov02_0234E3D0
	ldr r0, _02340768 @ =ov02_0234076C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02340768: .4byte ov02_0234076C
	arm_func_end ov02_02340718

	arm_func_start ov02_0234076C
ov02_0234076C: @ 0x0234076C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234079C @ =0x023407A0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234079C: .4byte 0x023407A0
	arm_func_end ov02_0234076C
_023407A0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0x00, 0xEB, 0x4A, 0x01, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_023407B0
ov02_023407B0: @ 0x023407B0
	push {r3, lr}
	ldr r0, _02340A20 @ =0x0235AAEC
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	ldrbeq r0, [r1, #0x45]
	cmpeq r0, #0
	popne {r3, pc}
	bl ov02_02340A30
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _023407FC
	ldr r0, _02340A20 @ =0x0235AAEC
	ldrb r0, [r0]
	bl ov02_02340AB4
	pop {r3, pc}
_023407FC:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02340830
	mov r0, #7
	bl ov02_023480E0
	ldr r1, _02340A20 @ =0x0235AAEC
	ldr r0, _02340A24 @ =0x02340F34
	ldr r1, [r1, #8]
	mov r2, #0xd
	strb r2, [r1, #0x40]
	bl ov02_02338D68
	pop {r3, pc}
_02340830:
	mov r0, #0x200
	bl ov02_0234EBFC
	cmp r0, #0
	beq _023408A8
	ldr r0, _02340A20 @ =0x0235AAEC
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _0234087C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_0234087C:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02340A28 @ =ov02_02341F7C
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02340A20 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_023408A8:
	mov r0, #0x200
	bl ov02_0234EC3C
	cmp r0, #0
	beq _023408CC
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_023408CC:
	mov r0, #0x100
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02340944
	ldr r0, _02340A20 @ =0x0235AAEC
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _02340918
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_02340918:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02340A2C @ =ov02_02341EB4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02340A20 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02340944:
	mov r0, #0x100
	bl ov02_0234EC3C
	cmp r0, #0
	beq _02340968
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_02340968:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02340984
	mov r0, #1
	bl ov02_0234225C
	pop {r3, pc}
_02340984:
	mov r0, #0x40
	bl ov02_0234EC3C
	cmp r0, #0
	beq _023409A8
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_023409A8:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _023409C4
	mov r0, #3
	bl ov02_0234225C
	pop {r3, pc}
_023409C4:
	mov r0, #0x80
	bl ov02_0234EC3C
	cmp r0, #0
	beq _023409E8
	ldr r0, _02340A20 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, pc}
_023409E8:
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02340A04
	mov r0, #0
	bl ov02_0234225C
	pop {r3, pc}
_02340A04:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #2
	bl ov02_0234225C
	pop {r3, pc}
	.align 2, 0
_02340A20: .4byte 0x0235AAEC
_02340A24: .4byte 0x02340F34
_02340A28: .4byte ov02_02341F7C
_02340A2C: .4byte ov02_02341EB4
	arm_func_end ov02_023407B0

	arm_func_start ov02_02340A30
ov02_02340A30: @ 0x02340A30
	push {r4, lr}
	bl ov02_02347518
	bl ov02_02341BD8
	mov r4, r0
	cmp r4, #0xe
	moveq r0, #0
	popeq {r4, pc}
	bl ov02_02341644
	cmp r0, #0
	bne _02340A68
	mov r0, #9
	bl ov02_023480E0
	mov r0, #1
	pop {r4, pc}
_02340A68:
	mov r0, r4
	bl ov02_0234222C
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _02340AA4
_02340A7C: @ jump table
	b _02340AA4 @ case 0
	b _02340AA4 @ case 1
	b _02340AA0 @ case 2
	b _02340AA0 @ case 3
	b _02340AA4 @ case 4
	b _02340AA4 @ case 5
	b _02340AA4 @ case 6
	b _02340AA0 @ case 7
	b _02340AA0 @ case 8
_02340AA0:
	bl ov02_023425D4
_02340AA4:
	mov r0, r4
	bl ov02_02340AB4
	mov r0, #1
	pop {r4, pc}
	arm_func_end ov02_02340A30

	arm_func_start ov02_02340AB4
ov02_02340AB4: @ 0x02340AB4
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	bl ov02_02341644
	cmp r0, #0
	bne _02340ADC
	mov r0, #9
	bl ov02_023480E0
	add sp, sp, #4
	pop {r3, r4, pc}
_02340ADC:
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _02340B54
_02340AE8: @ jump table
	b _02340B54 @ case 0
	b _02340B54 @ case 1
	b _02340B0C @ case 2
	b _02340B0C @ case 3
	b _02340B54 @ case 4
	b _02340B54 @ case 5
	b _02340B54 @ case 6
	b _02340B30 @ case 7
	b _02340B30 @ case 8
_02340B0C:
	mov r0, #6
	bl ov02_023480E0
	sub r0, r4, #2
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov02_02340C34
	add sp, sp, #4
	pop {r3, r4, pc}
_02340B30:
	mov r0, #6
	bl ov02_023480E0
	sub r0, r4, #7
	teq r0, #1
	movne r0, #1
	moveq r0, #0
	bl ov02_02340CA0
	add sp, sp, #4
	pop {r3, r4, pc}
_02340B54:
	ldr r0, _02340C24 @ =0x0235AAEC
	sub r1, r4, #0xb
	ldr r0, [r0, #8]
	cmp r1, #1
	strb r4, [r0, #0x40]
	bhi _02340BD0
	bl ov02_0234254C
	bl ov02_02342698
	cmp r0, #0
	bne _02340BB0
	mov r0, #9
	bl ov02_023480E0
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #6
	str ip, [sp]
	bl ov02_02349394
	ldr r0, _02340C28 @ =ov02_02342738
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, pc}
_02340BB0:
	cmp r4, #0xb
	bne _02340BC4
	mov r0, #6
	bl ov02_023480E0
	b _02340C10
_02340BC4:
	mov r0, #0xe
	bl ov02_023480E0
	b _02340C10
_02340BD0:
	cmp r4, #0xd
	bne _02340BE8
	bl ov02_0234254C
	mov r0, #7
	bl ov02_023480E0
	b _02340C10
_02340BE8:
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _02340C2C @ =0x02352BD0
	ldrb r0, [r0, r4]
	bl ov02_02341E4C
	mov r2, r0
	mov r0, #0
	mov r1, #1
	bl ov02_023416D8
	bl ov02_023419C8
_02340C10:
	bl ov02_02346AC4
	ldr r0, _02340C30 @ =0x02340F34
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02340C24: .4byte 0x0235AAEC
_02340C28: .4byte ov02_02342738
_02340C2C: .4byte 0x02352BD0
_02340C30: .4byte 0x02340F34
	arm_func_end ov02_02340AB4

	arm_func_start ov02_02340C34
ov02_02340C34: @ 0x02340C34
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov02_02347518
	ldrb r1, [r0, #0xf5]
	cmp r1, r4
	popeq {r3, r4, r5, pc}
	cmp r4, #0
	beq _02340C70
	ldr r0, _02340C9C @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x43]
	cmp r0, #0
	movne r5, #1
	moveq r5, #0
	b _02340C84
_02340C70:
	ldr r1, _02340C9C @ =0x0235AAEC
	ldrb r2, [r0, #0xf6]
	ldr r0, [r1, #8]
	mov r5, #0
	strb r2, [r0, #0x43]
_02340C84:
	mov r0, r4
	bl ov02_0234752C
	mov r0, r5
	bl ov02_02347540
	bl ov02_02341294
	pop {r3, r4, r5, pc}
	.align 2, 0
_02340C9C: .4byte 0x0235AAEC
	arm_func_end ov02_02340C34

	arm_func_start ov02_02340CA0
ov02_02340CA0: @ 0x02340CA0
	push {r4, lr}
	mov r4, r0
	bl ov02_02347518
	ldrb r0, [r0, #0xf6]
	cmp r0, r4
	popeq {r4, pc}
	ldr r1, _02340CD4 @ =0x0235AAEC
	mov r0, r4
	ldr r1, [r1, #8]
	strb r4, [r1, #0x43]
	bl ov02_02347540
	bl ov02_02341294
	pop {r4, pc}
	.align 2, 0
_02340CD4: .4byte 0x0235AAEC
	arm_func_end ov02_02340CA0

	arm_func_start ov02_02340CD8
ov02_02340CD8: @ 0x02340CD8
	push {r3, lr}
	ldr r0, _02340F24 @ =0x0235AAEC
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	popne {r3, pc}
	ldrb r0, [r1, #0x41]
	cmp r0, #0
	subne r0, r0, #1
	strbne r0, [r1, #0x41]
	bl ov02_02346A8C
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02340D10: @ jump table
	pop {r3, pc} @ case 0
	b _02340D30 @ case 1
	b _02340D44 @ case 2
	b _02340D98 @ case 3
	b _02340E40 @ case 4
	b _02340F10 @ case 5
	b _02340EA8 @ case 6
	b _02340F10 @ case 7
_02340D30:
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	pop {r3, pc}
_02340D44:
	ldr r0, _02340F24 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x41]
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0233519C
	bl ov02_02346A78
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02340F28 @ =0x094F2095
	lsr r0, r1, #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02340F24 @ =0x0235AAEC
	add r3, r0, r3, asr #1
	strh r3, [r1, #4]
	bl ov02_02341294
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #4
	ldr r0, [r0, #8]
	strb r1, [r0, #0x41]
	pop {r3, pc}
_02340D98:
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x45]
	bl ov02_02346A78
	mov r1, #0x91
	mul r1, r0, r1
	ldr r2, _02340F28 @ =0x094F2095
	lsr r0, r1, #0x1f
	smull r1, r3, r2, r1
	ldr r1, _02340F24 @ =0x0235AAEC
	add r3, r0, r3, asr #1
	mov r0, #0x13
	strh r3, [r1, #4]
	bl ov02_023480E0
	bl ov02_02341294
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075C38
	cmp r0, #0
	bne _02340DF8
	bl ov02_0234217C
	pop {r3, pc}
_02340DF8:
	cmp r0, #0x10
	mov r0, #0
	mov r3, #0x78
	bge _02340E24
	ldr r1, _02340F2C @ =ov02_02341EB4
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _02340F24 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02340E24:
	ldr r1, _02340F30 @ =ov02_02341F7C
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _02340F24 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02340E40:
	ldr r0, _02340F24 @ =0x0235AAEC
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _02340E7C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
_02340E7C:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02340F2C @ =ov02_02341EB4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02340F24 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02340EA8:
	ldr r0, _02340F24 @ =0x0235AAEC
	ldrh r1, [r0, #4]
	cmp r1, #0x91
	bne _02340EE4
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x46]
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
_02340EE4:
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02340F30 @ =ov02_02341F7C
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02340F24 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, pc}
_02340F10:
	ldr r0, _02340F24 @ =0x0235AAEC
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x46]
	pop {r3, pc}
	.align 2, 0
_02340F24: .4byte 0x0235AAEC
_02340F28: .4byte 0x094F2095
_02340F2C: .4byte ov02_02341EB4
_02340F30: .4byte ov02_02341F7C
	arm_func_end ov02_02340CD8
_02340F34:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xE1, 0x16, 0x00, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xE6, 0x32, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x86, 0xDF, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x54, 0x0F, 0x34, 0x02

	arm_func_start ov02_02340F54
ov02_02340F54: @ 0x02340F54
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x1d
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02340F9C @ =ov02_02340FA0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02340F9C: .4byte ov02_02340FA0
	arm_func_end ov02_02340F54

	arm_func_start ov02_02340FA0
ov02_02340FA0: @ 0x02340FA0
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	ldr r1, _02341268 @ =0x0235AAEC
	mov r0, #0
	ldr r1, [r1, #8]
	ldr r1, [r1]
	bl ov02_0234FB6C
	ldr r1, _02341268 @ =0x0235AAEC
	mov r0, #1
	ldr r1, [r1, #8]
	ldr r1, [r1, #0x3c]
	bl ov02_0234FB6C
	ldr r4, _02341268 @ =0x0235AAEC
	mov r5, #0
_02340FF4:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x18]
	bl ov02_0234F2C0
	add r5, r5, #1
	cmp r5, #7
	blt _02340FF4
	ldr r0, _02341268 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _02341028
	bl ov02_0234F2C0
_02341028:
	bl ov02_02346A3C
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_0233519C
	ldr r0, _02341268 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xc
	beq _02341050
	bl ov02_02334D10
_02341050:
	bl ov02_023467B0
	ldr r0, _02341268 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	bl ov02_0234CF78
	ldr r4, _02341268 @ =0x0235AAEC
	mov r5, #0
_0234106C:
	ldr r0, [r4, #8]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0xc]
	bl ov02_0234CF78
	add r5, r5, #1
	cmp r5, #2
	blt _0234106C
	ldr r0, _0234126C @ =0x02353A58
	ldr r1, _02341270 @ =0x02077DA4
	bl ov02_02334DA8
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x1d
	bl ov02_0234E424
	ldr r0, _02341274 @ =0x04000010
	mov r1, #0
	str r1, [r0]
	sub r3, r0, #4
	str r1, [r0, #8]
	ldrh r0, [r3]
	ldr r2, _02341268 @ =0x0235AAEC
	and r0, r0, #0x43
	orr r0, r0, #0xe10
	strh r0, [r3]
	ldr r0, [r2, #8]
	ldrb r0, [r0, #0x40]
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _0234125C
_023410E8: @ jump table
	b _02341120 @ case 0
	b _02341120 @ case 1
	b _0234125C @ case 2
	b _0234125C @ case 3
	b _0234113C @ case 4
	b _0234113C @ case 5
	b _0234113C @ case 6
	b _0234125C @ case 7
	b _0234125C @ case 8
	b _0234113C @ case 9
	b _0234113C @ case 10
	b _0234116C @ case 11
	b _02341204 @ case 12
	b _02341218 @ case 13
_02341120:
	bl ov02_02338DB4
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	ldr r0, _02341278 @ =ov02_0233E488
	bl ov02_02338D68
	b _0234125C
_0234113C:
	sub r4, r0, #4
	cmp r0, #9
	subhs r4, r4, #2
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	mov r0, r4
	mov r1, #0
	bl ov02_02338DB4
	ldr r0, _0234127C @ =ov02_0233EFC8
	bl ov02_02338D68
	b _0234125C
_0234116C:
	bl ov02_02347518
	mov r4, r0
	add r0, r4, #0xf0
	bl FUN_022ED7C0
	strb r0, [r4, #0xd0]
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	beq _023411C4
	add r0, r4, #0xc0
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	add r0, r4, #0xc4
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	add r0, r4, #0xf0
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	mov r0, #0
	strb r0, [r4, #0xd0]
_023411C4:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	beq _023411E0
	add r0, r4, #0xc8
	mov r1, #0
	mov r2, #8
	bl FUN_0207C40C
_023411E0:
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	ldr r0, _02341280 @ =ov02_023452A8
	bl ov02_02338D68
	b _0234125C
_02341204:
	mov r0, r1
	bl ov02_02338D78
	ldr r0, _02341284 @ =0x023427A8
	bl ov02_02338D68
	b _0234125C
_02341218:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0234123C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02341288 @ =ov02_02343DB0
	bl ov02_02338D68
	b _0234125C
_0234123C:
	bl ov02_02347518
	ldrb r0, [r0, #0xf4]
	bl ov02_0234793C
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0234128C @ =ov02_02344AF0
	bl ov02_02338D68
_0234125C:
	ldr r0, _02341290 @ =0x0235AAF4
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02341268: .4byte 0x0235AAEC
_0234126C: .4byte 0x02353A58
_02341270: .4byte 0x02077DA4
_02341274: .4byte 0x04000010
_02341278: .4byte ov02_0233E488
_0234127C: .4byte ov02_0233EFC8
_02341280: .4byte ov02_023452A8
_02341284: .4byte 0x023427A8
_02341288: .4byte ov02_02343DB0
_0234128C: .4byte ov02_02344AF0
_02341290: .4byte 0x0235AAF4
	arm_func_end ov02_02340FA0

	arm_func_start ov02_02341294
ov02_02341294: @ 0x02341294
	push {r4, r5, r6, lr}
	ldr r0, _0234134C @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075BFC
	ldr r1, _0234134C @ =0x0235AAEC
	mov r4, r0
	ldr r0, [r1, #8]
	mov r1, #0
	ldr r0, [r0, #0x14]
	bl ov02_0234E2A8
	mov r5, r4
	mov r6, #0
_023412C8:
	mov r0, r5
	mov r1, r6
	bl ov02_02341354
	add r6, r6, #1
	cmp r6, #5
	add r5, r5, #1
	blt _023412C8
	ldr r0, _0234134C @ =0x0235AAEC
	ldr r1, _02341350 @ =0x02352B12
	lsl r2, r4, #1
	ldr r3, [r0, #8]
	ldrh r0, [r1, r2]
	ldr r2, [r3, #8]
	mov r1, #0
	add r0, r2, r0, lsl #1
	mov r2, #0x1e
	mov r3, #0x13
	bl ov02_023467F4
	mov r5, #0
_02341314:
	mov r0, r4
	mov r1, r5
	bl ov02_023414F0
	add r5, r5, #1
	cmp r5, #5
	add r4, r4, #1
	blt _02341314
	bl ov02_023467DC
	ldr r0, _0234134C @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x14]
	bl ov02_0234E354
	bl ov02_023419C8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234134C: .4byte 0x0235AAEC
_02341350: .4byte 0x02352B12
	arm_func_end ov02_02341294

	arm_func_start ov02_02341354
ov02_02341354: @ 0x02341354
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r6, r0
	mov r5, r1
	bl ov02_02347518
	cmp r6, #8
	addls pc, pc, r6, lsl #2
	b _023414E8
_02341374: @ jump table
	b _02341398 @ case 0
	b _023413AC @ case 1
	b _023414E8 @ case 2
	b _0234143C @ case 3
	b _02341460 @ case 4
	b _02341484 @ case 5
	b _023414E8 @ case 6
	b _023414A8 @ case 7
	b _023414CC @ case 8
_02341398:
	mov r1, r5
	add r0, r0, #0x40
	bl ov02_023417DC
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_023413AC:
	ldrb r1, [r0, #0xe6]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1e
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _023413F0
_023413C4: @ jump table
	b _023413D4 @ case 0
	b _023413DC @ case 1
	b _023413E4 @ case 2
	b _023413EC @ case 3
_023413D4:
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_023413DC:
	mov r4, #0xa
	b _023413F0
_023413E4:
	mov r4, #0x1a
	b _023413F0
_023413EC:
	mov r4, #0x20
_023413F0:
	ldrb r0, [r0, #0xe6]
	mov r1, #0
	mov r2, #0x21
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1a
	cmp r0, #1
	addeq r0, r4, r4, lsr #31
	asreq r4, r0, #1
	add r0, sp, #0
	bl FUN_0207C40C
	add r0, sp, #0
	mov r2, r4
	mov r1, #0x2a
	bl FUN_02087308
	add r0, sp, #0
	mov r1, r5
	bl ov02_023417DC
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_0234143C:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc0
	bl ov02_02341930
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02341460:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xf0
	bl ov02_02341930
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_02341484:
	ldrb r1, [r0, #0xf5]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc4
	bl ov02_02341930
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_023414A8:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xc8
	bl ov02_02341930
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
_023414CC:
	ldrb r1, [r0, #0xf6]
	cmp r1, #0
	addne sp, sp, #0x24
	popne {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r0, #0xcc
	bl ov02_02341930
_023414E8:
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, pc}
	arm_func_end ov02_02341354

	arm_func_start ov02_023414F0
ov02_023414F0: @ 0x023414F0
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	bl ov02_02347518
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _02341624
_0234150C: @ jump table
	b _02341530 @ case 0
	b _02341530 @ case 1
	b _0234154C @ case 2
	b _02341598 @ case 3
	b _02341598 @ case 4
	b _02341598 @ case 5
	b _023415B0 @ case 6
	b _0234160C @ case 7
	b _0234160C @ case 8
_02341530:
	mov r4, #0
	mov r0, r4
	mov r5, r4
	bl ov02_02341644
	cmp r0, #0
	moveq r5, #2
	b _0234162C
_0234154C:
	ldr r2, _02341640 @ =0x0235AAEC
	ldrb r0, [r0, #0xf5]
	ldr r3, [r2, #8]
	mov r1, #0
	ldrb r2, [r3, #4]
	cmp r0, #0
	movne r4, #1
	movne r0, #4
	moveq r4, #2
	moveq r0, #3
	cmp r2, #0
	mov r5, r1
	ldrb r2, [r3, #5]
	movne r5, #1
	cmp r2, #0
	movne r1, #1
	mov r2, r6
	bl ov02_023416D8
	b _0234162C
_02341598:
	ldrb r0, [r0, #0xf5]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, r4
	b _0234162C
_023415B0:
	ldrb r2, [r0, #0xf6]
	mov r1, #0
	mov r5, r1
	cmp r2, #0
	movne r4, #1
	movne r0, #4
	bne _023415E0
	ldrb r0, [r0, #0xf5]
	mov r4, #2
	cmp r0, #0
	moveq r5, #2
	mov r0, #3
_023415E0:
	ldr r2, _02341640 @ =0x0235AAEC
	ldr r3, [r2, #8]
	ldrb r2, [r3, #6]
	cmp r2, #0
	ldrb r2, [r3, #7]
	movne r5, #1
	cmp r2, #0
	movne r1, #1
	mov r2, r6
	bl ov02_023416D8
	b _0234162C
_0234160C:
	ldrb r0, [r0, #0xf6]
	mov r4, #0
	cmp r0, #0
	movne r5, #2
	moveq r5, r4
	b _0234162C
_02341624:
	mov r4, #0
	mov r5, #2
_0234162C:
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov02_023416D8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02341640: .4byte 0x0235AAEC
	arm_func_end ov02_023414F0

	arm_func_start ov02_02341644
ov02_02341644: @ 0x02341644
	push {r4, lr}
	mov r4, r0
	bl ov02_02347518
	cmp r4, #0xa
	mov r1, #1
	addls pc, pc, r4, lsl #2
	b _023416D0
_02341660: @ jump table
	b _0234169C @ case 0
	b _0234169C @ case 1
	b _023416D0 @ case 2
	b _023416D0 @ case 3
	b _023416B4 @ case 4
	b _023416B4 @ case 5
	b _023416B4 @ case 6
	b _0234168C @ case 7
	b _023416D0 @ case 8
	b _023416C4 @ case 9
	b _023416C4 @ case 10
_0234168C:
	ldrb r0, [r0, #0xf5]
	cmp r0, #0
	moveq r1, #0
	b _023416D0
_0234169C:
	ldrb r0, [r0, #0xe7]
	add r0, r0, #0xff
	and r0, r0, #0xff
	cmp r0, #1
	movls r1, #0
	b _023416D0
_023416B4:
	ldrb r0, [r0, #0xf5]
	cmp r0, #0
	movne r1, #0
	b _023416D0
_023416C4:
	ldrb r0, [r0, #0xf6]
	cmp r0, #0
	movne r1, #0
_023416D0:
	mov r0, r1
	pop {r4, pc}
	arm_func_end ov02_02341644

	arm_func_start ov02_023416D8
ov02_023416D8: @ 0x023416D8
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r3, _023417D0 @ =0x0235AAEC
	mov ip, #0xc0
	ldr r3, [r3, #8]
	mov r6, r0
	mov r4, #0x8f
	add r3, r3, #0x18
	sub r0, r6, #1
	mov lr, #0xcc
	mov r5, r1
	strh lr, [sp]
	strh ip, [sp, #2]
	strh ip, [sp, #4]
	strh r4, [sp, #6]
	strh r4, [sp, #8]
	cmp r0, #1
	add r4, r3, r2, lsl #2
	bhi _0234174C
	mov r0, r2
	bl ov02_02341E90
	cmp r0, #2
	ldrne r0, _023417D0 @ =0x0235AAEC
	ldrne r0, [r0, #8]
	addne r4, r0, #0x30
	bne _0234174C
	ldr r0, _023417D0 @ =0x0235AAEC
	ldr r0, [r0, #8]
	add r4, r0, #0x2c
_0234174C:
	ldr r0, _023417D4 @ =0x02352B02
	add r1, r6, r6, lsl #1
	add r0, r0, r1
	ldrb r1, [r5, r0]
	ldr r2, [r4]
	cmp r1, #0
	beq _023417B4
	mov r0, #0
	bl ov02_0234D618
	add r0, sp, #0
	lsl r1, r6, #1
	ldrh r2, [r0, r1]
	ldr r3, [r4]
	ldr r0, _023417D8 @ =0xFE00FF00
	ldr r1, [r3]
	lsl r2, r2, #0x17
	and r0, r1, r0
	orr r0, r0, r2, lsr #7
	str r0, [r3]
	ldr r1, [r4]
	add sp, sp, #0xc
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, #0xc00
	strh r0, [r1, #4]
	pop {r3, r4, r5, r6, pc}
_023417B4:
	ldr r0, _023417D8 @ =0xFE00FF00
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_023417D0: .4byte 0x0235AAEC
_023417D4: .4byte 0x02352B02
_023417D8: .4byte 0xFE00FF00
	arm_func_end ov02_023416D8

	arm_func_start ov02_023417DC
ov02_023417DC: @ 0x023417DC
	push {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	mov r5, r1
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_0207C40C
	mov r0, r6
	mov r1, #0x20
	bl ov02_0234F59C
	mov r4, r0
	cmp r4, #0x10
	movle lr, r4
	movgt lr, #0x10
	cmp lr, #0
	mov ip, #0
	ble _0234184C
	ldr r2, _02341928 @ =0x0000E01D
	add r1, sp, #0xc
_0234182C:
	ldrb r3, [r6, ip]
	lsl r0, ip, #1
	add ip, ip, #1
	cmp r3, #0x20
	strheq r2, [r1, r0]
	strhne r3, [r1, r0]
	cmp ip, lr
	blt _0234182C
_0234184C:
	mov r0, #0x1d
	mul r0, r5, r0
	mov r1, #8
	add r5, r0, #2
	str r1, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _0234192C @ =0x0235AAEC
	cmp r4, #0x10
	ldr r0, [r0, #8]
	addle r5, r5, #5
	ldr r0, [r0, #0x14]
	mov r2, r5
	mov r1, #0x48
	mov r3, #2
	bl ov02_0234E13C
	cmp r4, #0x10
	addle sp, sp, #0x30
	pople {r4, r5, r6, pc}
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x22
	bl FUN_0207C40C
	sub r4, r4, #0x10
	cmp r4, #0
	mov ip, #0
	ble _023418EC
	ldr r2, _02341928 @ =0x0000E01D
	add r1, sp, #0xc
_023418C8:
	add r0, r6, ip
	ldrb r3, [r0, #0x10]
	lsl r0, ip, #1
	add ip, ip, #1
	cmp r3, #0x20
	strheq r2, [r1, r0]
	strhne r3, [r1, r0]
	cmp ip, r4
	blt _023418C8
_023418EC:
	mov r1, #8
	str r1, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _0234192C @ =0x0235AAEC
	add r2, r5, #0xc
	ldr r0, [r0, #8]
	mov r1, #0x48
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov02_0234E13C
	add sp, sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
_02341928: .4byte 0x0000E01D
_0234192C: .4byte 0x0235AAEC
	arm_func_end ov02_023417DC

	arm_func_start ov02_02341930
ov02_02341930: @ 0x02341930
	push {r3, r4, lr}
	sub sp, sp, #0x3c
	mov ip, r0
	ldrb r2, [ip, #1]
	mov r4, r1
	add r0, sp, #0xc
	str r2, [sp]
	ldrb r3, [ip, #2]
	ldr r2, _023419C0 @ =0x02353A70
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [ip, #3]
	str r3, [sp, #8]
	ldrb r3, [ip]
	bl FUN_0207911C
	add r0, sp, #0x1c
	add r1, sp, #0xc
	mov r2, #0x10
	bl ov02_0234F5C8
	mov r2, #7
	mov r0, #0x1d
	mul r1, r4, r0
	str r2, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	ldr r0, _023419C4 @ =0x0235AAEC
	add r2, r1, #8
	ldr r0, [r0, #8]
	mov r1, #0x5f
	ldr r0, [r0, #0x14]
	mov r3, #2
	bl ov02_0234E13C
	add sp, sp, #0x3c
	pop {r3, r4, pc}
	.align 2, 0
_023419C0: .4byte 0x02353A70
_023419C4: .4byte 0x0235AAEC
	arm_func_end ov02_02341930

	arm_func_start ov02_023419C8
ov02_023419C8: @ 0x023419C8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _02341BCC @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075BFC
	ldr r1, _02341BCC @ =0x0235AAEC
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_02075C38
	ldr r1, _02341BCC @ =0x0235AAEC
	rsb ip, r0, #0x34
	ldr r1, [r1, #8]
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _02341A48
	ldr r5, [r1, #0x34]
	cmp r4, #0
	moveq r0, #0x26
	streq r0, [sp, #4]
	movne r0, #0x100
	strne r0, [sp, #4]
	ldr r2, [r5]
	ldr r0, _02341BD0 @ =0xFE00FF00
	ldr r3, [sp, #4]
	and r0, r2, r0
	and r1, ip, #0xff
	lsl r2, r3, #0x17
	orr r0, r0, r1
	orr r0, r0, r2, lsr #7
	str r0, [r5]
_02341A48:
	ldr r8, _02341BCC @ =0x0235AAEC
	ldr r6, _02341BD4 @ =0x01FF0000
	ldr r7, _02341BD0 @ =0xFE00FF00
	mov lr, ip
	mov r5, #0
_02341A5C:
	ldr r0, [r8, #8]
	and sb, lr, #0xff
	add r0, r0, r5, lsl #2
	ldr r3, [r0, #0x18]
	add r5, r5, #1
	ldr r1, [r3]
	cmp r5, #5
	mov r0, r1
	and r2, r1, r6
	and sl, r0, r7
	lsr r2, r2, #0x10
	lsl r0, r2, #0x17
	orr sb, sl, sb
	orr r0, sb, r0, lsr #7
	str r0, [r3]
	and r0, r1, #0xff
	add lr, lr, #0x1d
	blt _02341A5C
	str r0, [sp]
	str r2, [sp, #4]
	cmp r4, #2
	bgt _02341B0C
	ldr r0, _02341BCC @ =0x0235AAEC
	rsb r2, r4, #2
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x2c]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _02341BD4 @ =0x01FF0000
	and r6, r2, #0xff
	and r1, r2, r1
	lsr r7, r1, #0x10
	mov r5, r2
	ldr r1, _02341BD0 @ =0xFE00FF00
	and r2, r3, #0xff
	and r1, r5, r1
	lsl r3, r7, #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r7, [sp, #4]
	str r6, [sp]
	str r1, [r0]
	b _02341B2C
_02341B0C:
	ldr r1, _02341BCC @ =0x0235AAEC
	ldr r0, _02341BD0 @ =0xFE00FF00
	ldr r1, [r1, #8]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
_02341B2C:
	cmp r4, #2
	blt _02341B94
	cmp r4, #6
	bgt _02341B94
	ldr r0, _02341BCC @ =0x0235AAEC
	rsb r2, r4, #6
	ldr r0, [r0, #8]
	mov r1, #0x1d
	ldr r0, [r0, #0x30]
	mla r3, r2, r1, ip
	ldr r2, [r0]
	ldr r1, _02341BD4 @ =0x01FF0000
	and r5, r2, #0xff
	and r1, r2, r1
	lsr r6, r1, #0x10
	mov r4, r2
	ldr r1, _02341BD0 @ =0xFE00FF00
	and r2, r3, #0xff
	and r1, r4, r1
	lsl r3, r6, #0x17
	orr r1, r1, r2
	orr r1, r1, r3, lsr #7
	str r6, [sp, #4]
	str r5, [sp]
	str r1, [r0]
	b _02341BB4
_02341B94:
	ldr r1, _02341BCC @ =0x0235AAEC
	ldr r0, _02341BD0 @ =0xFE00FF00
	ldr r1, [r1, #8]
	ldr r2, [r1, #0x30]
	ldr r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0x1000000
	str r0, [r2]
_02341BB4:
	ldr r0, _02341BCC @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x44]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02341BCC: .4byte 0x0235AAEC
_02341BD0: .4byte 0xFE00FF00
_02341BD4: .4byte 0x01FF0000
	arm_func_end ov02_023419C8

	arm_func_start ov02_02341BD8
ov02_02341BD8: @ 0x02341BD8
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r0, _02341E38 @ =0x02352F34
	bl ov02_0234ED04
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0xe
	popeq {r4, r5, r6, pc}
	ldr r0, _02341E3C @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075BFC
	ldr r1, _02341E40 @ =0x02352AD8
	mov r5, r0
	ldrh r3, [r1, #4]
	ldrh r2, [r1, #6]
	add r4, sp, #0
	strh r3, [sp]
	strh r2, [sp, #2]
	ldrh r2, [r1, #8]
	ldrh r0, [r1, #0xa]
	mov r6, #0
	strh r2, [sp, #4]
	strh r0, [sp, #6]
_02341C38:
	cmp r5, #2
	cmpne r5, #6
	beq _02341C60
	mov r0, r4
	bl ov02_0234EE9C
	cmp r0, #0
	ldrne r0, _02341E44 @ =0x02352BB8
	addne sp, sp, #8
	ldrbne r0, [r0, r5]
	popne {r4, r5, r6, pc}
_02341C60:
	ldrh r0, [sp, #2]
	add r6, r6, #1
	cmp r6, #4
	add r0, r0, #0x1d
	strh r0, [sp, #2]
	add r5, r5, #1
	blt _02341C38
	ldr r0, _02341E3C @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075BFC
	mov r3, #0
_02341C90:
	cmp r0, #2
	bne _02341D2C
	ldr r1, _02341E40 @ =0x02352AD8
	mov r0, #0x1d
	ldrh r5, [r1, #0x16]
	ldrh r2, [r1, #0x14]
	mul r4, r3, r0
	strh r2, [sp]
	strh r5, [sp, #2]
	ldrh r3, [r1, #0x18]
	ldrh r2, [r1, #0x1a]
	add r1, r5, r4
	add r0, sp, #0
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov02_0234EE9C
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #2
	popne {r4, r5, r6, pc}
	ldr r1, _02341E40 @ =0x02352AD8
	add r0, sp, #0
	ldrh r5, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	strh r5, [sp, #2]
	strh r2, [sp]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x12]
	add r1, r5, r4
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov02_0234EE9C
	cmp r0, #0
	beq _02341D3C
	add sp, sp, #8
	mov r0, #3
	pop {r4, r5, r6, pc}
_02341D2C:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _02341C90
_02341D3C:
	ldr r0, _02341E3C @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075BFC
	mov r3, #0
_02341D50:
	cmp r0, #6
	bne _02341DEC
	ldr r1, _02341E40 @ =0x02352AD8
	mov r0, #0x1d
	ldrh r5, [r1, #0x16]
	ldrh r2, [r1, #0x14]
	mul r4, r3, r0
	strh r2, [sp]
	strh r5, [sp, #2]
	ldrh r3, [r1, #0x18]
	ldrh r2, [r1, #0x1a]
	add r1, r5, r4
	add r0, sp, #0
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov02_0234EE9C
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #7
	popne {r4, r5, r6, pc}
	ldr r1, _02341E40 @ =0x02352AD8
	add r0, sp, #0
	ldrh r5, [r1, #0xe]
	ldrh r2, [r1, #0xc]
	strh r5, [sp, #2]
	strh r2, [sp]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x12]
	add r1, r5, r4
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	strh r1, [sp, #2]
	bl ov02_0234EE9C
	cmp r0, #0
	beq _02341DFC
	add sp, sp, #8
	mov r0, #8
	pop {r4, r5, r6, pc}
_02341DEC:
	add r3, r3, #1
	cmp r3, #4
	add r0, r0, #1
	blt _02341D50
_02341DFC:
	ldr r4, _02341E48 @ =0x02352B66
	mov r5, #0
_02341E04:
	mov r0, r4
	bl ov02_0234ED04
	cmp r0, #0
	addne sp, sp, #8
	addne r0, r5, #0xb
	popne {r4, r5, r6, pc}
	add r5, r5, #1
	cmp r5, #3
	add r4, r4, #8
	blt _02341E04
	mov r0, #0xe
	add sp, sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02341E38: .4byte 0x02352F34
_02341E3C: .4byte 0x0235AAEC
_02341E40: .4byte 0x02352AD8
_02341E44: .4byte 0x02352BB8
_02341E48: .4byte 0x02352B66
	arm_func_end ov02_02341BD8

	arm_func_start ov02_02341E4C
ov02_02341E4C: @ 0x02341E4C
	push {r4, lr}
	ldr r1, _02341E8C @ =0x0235AAEC
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_02075BFC
	mov r1, #0
_02341E68:
	cmp r0, r4
	moveq r0, r1
	popeq {r4, pc}
	add r1, r1, #1
	cmp r1, #4
	add r0, r0, #1
	blt _02341E68
	mvn r0, #0
	pop {r4, pc}
	.align 2, 0
_02341E8C: .4byte 0x0235AAEC
	arm_func_end ov02_02341E4C

	arm_func_start ov02_02341E90
ov02_02341E90: @ 0x02341E90
	push {r4, lr}
	ldr r1, _02341EB0 @ =0x0235AAEC
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_02075BFC
	add r0, r0, r4
	pop {r4, pc}
	.align 2, 0
_02341EB0: .4byte 0x0235AAEC
	arm_func_end ov02_02341E90

	arm_func_start ov02_02341EB4
ov02_02341EB4: @ 0x02341EB4
	push {r3, r4, r5, lr}
	mov r4, r0
	bl ov02_02346AC4
	bl ov02_0233519C
	ldr r0, _02341F74 @ =0x0235AAEC
	ldrh r1, [r0, #4]
	cmp r1, #6
	subhi r1, r1, #6
	movls r1, #0
	strh r1, [r0, #4]
	ldr r0, _02341F74 @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r0, [r0, #4]
	bl FUN_02075C38
	mov r5, r0
	cmp r5, #0x17
	bne _02341F00
	bl ov02_02341294
	pop {r3, r4, r5, pc}
_02341F00:
	ble _02341F1C
	ldr r0, _02341F74 @ =0x0235AAEC
	rsb r1, r5, #0x1d
	ldrh r2, [r0, #4]
	mov r5, #0
	add r1, r2, r1
	strh r1, [r0, #4]
_02341F1C:
	bl ov02_023419C8
	cmp r5, #0
	popne {r3, r4, r5, pc}
	ldr r1, _02341F74 @ =0x0235AAEC
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _02341F78 @ =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	lsr r1, r3, #0x1f
	add r0, r1, r0, asr #7
	bl ov02_02346FEC
	bl ov02_02346AAC
	bl ov02_0234217C
	ldr r0, _02341F74 @ =0x0235AAEC
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov02_0234FB40
	pop {r3, r4, r5, pc}
	.align 2, 0
_02341F74: .4byte 0x0235AAEC
_02341F78: .4byte 0xE1FC780F
	arm_func_end ov02_02341EB4

	arm_func_start ov02_02341F7C
ov02_02341F7C: @ 0x02341F7C
	push {r4, lr}
	mov r4, r0
	bl ov02_02346AC4
	bl ov02_0233519C
	ldr r0, _02342018 @ =0x0235AAEC
	mov r1, #0x1d
	ldrh r2, [r0, #4]
	add r2, r2, #6
	strh r2, [r0, #4]
	ldrh r0, [r0, #4]
	bl FUN_02075C38
	cmp r0, #6
	blt _02341FB8
	bl ov02_023419C8
	pop {r4, pc}
_02341FB8:
	ldr r1, _02342018 @ =0x0235AAEC
	ldrh r2, [r1, #4]
	sub r0, r2, r0
	strh r0, [r1, #4]
	bl ov02_02341294
	ldr r1, _02342018 @ =0x0235AAEC
	mov r0, #0x37
	ldrh r1, [r1, #4]
	ldr r2, _0234201C @ =0xE1FC780F
	mul r3, r1, r0
	smull r1, r0, r2, r3
	add r0, r3, r0
	lsr r1, r3, #0x1f
	add r0, r1, r0, asr #7
	bl ov02_02346FEC
	bl ov02_02346AAC
	bl ov02_0234217C
	ldr r0, _02342018 @ =0x0235AAEC
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0
	str r0, [r2, #0x38]
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_02342018: .4byte 0x0235AAEC
_0234201C: .4byte 0xE1FC780F
	arm_func_end ov02_02341F7C

	arm_func_start ov02_02342020
ov02_02342020: @ 0x02342020
	push {r4, lr}
	ldr r0, _02342094 @ =0x0235AAEC
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x44]
	cmp r1, #0
	popeq {r4, pc}
	ldrh r0, [r0, #4]
	mov r1, #0x1d
	bl FUN_02075BFC
	ldr r1, _02342094 @ =0x0235AAEC
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_02075C38
	ldr r2, _02342098 @ =0x02352BC4
	ldr r1, _0234209C @ =0x01FF0000
	sub ip, r0, #0x33
	ldrb r0, [r2, r4]
	ldr r2, _023420A0 @ =0x04000010
	and r3, r1, ip, lsl #16
	add r0, ip, r0
	str r3, [r2]
	and r1, r1, r0, lsl #16
	ldr r0, _02342094 @ =0x0235AAEC
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	mov r1, #0
	strb r1, [r0, #0x44]
	pop {r4, pc}
	.align 2, 0
_02342094: .4byte 0x0235AAEC
_02342098: .4byte 0x02352BC4
_0234209C: .4byte 0x01FF0000
_023420A0: .4byte 0x04000010
	arm_func_end ov02_02342020

	arm_func_start ov02_023420A4
ov02_023420A4: @ 0x023420A4
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02342168 @ =0x02352AF4
	add r3, sp, #8
	mov r2, #7
_023420B8:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _023420B8
	ldr r0, _0234216C @ =0x0235AAEC
	add r1, sp, #8
	ldrb r2, [r0]
	ldrb r2, [r1, r2]
	cmp r2, #3
	blt _0234211C
	lsl r3, r2, #3
	ldr r1, _02342170 @ =0x02352B7E
	ldr r2, _02342174 @ =0x02352B82
	ldr r0, _02342178 @ =0x02352B80
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #3
	bl ov02_02334FF0
	add sp, sp, #0x18
	pop {r3, pc}
_0234211C:
	ldr r1, _02342170 @ =0x02352B7E
	lsl lr, r2, #3
	add ip, r1, r2, lsl #3
	ldrb r2, [r0, #2]
	ldrh r3, [ip, #2]
	mov r0, #0x1d
	ldrh r1, [r1, lr]
	mla r0, r2, r0, r3
	strh r0, [sp, #2]
	ldrh r2, [ip, #4]
	ldrh ip, [ip, #6]
	ldrh r3, [sp, #2]
	mov r0, #1
	strh r1, [sp]
	strh r2, [sp, #4]
	strh ip, [sp, #6]
	bl ov02_02334FF0
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02342168: .4byte 0x02352AF4
_0234216C: .4byte 0x0235AAEC
_02342170: .4byte 0x02352B7E
_02342174: .4byte 0x02352B82
_02342178: .4byte 0x02352B80
	arm_func_end ov02_023420A4

	arm_func_start ov02_0234217C
ov02_0234217C: @ 0x0234217C
	push {r4, lr}
	ldr r0, _02342224 @ =0x0235AAEC
	ldrb r0, [r0]
	add r0, r0, #0xf5
	and r0, r0, #0xff
	cmp r0, #2
	bhi _023421A0
	bl ov02_023420A4
	pop {r4, pc}
_023421A0:
	bl ov02_02347518
	ldr r1, _02342224 @ =0x0235AAEC
	mov r4, r0
	ldrh r0, [r1, #4]
	mov r1, #0x1d
	bl FUN_02075BFC
	ldr r1, _02342224 @ =0x0235AAEC
	ldrb r2, [r1, #2]
	add r2, r2, r0
	cmp r2, #2
	beq _023421D8
	cmp r2, #6
	beq _023421F4
	b _02342210
_023421D8:
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	movne r0, #2
	strbne r0, [r1]
	moveq r0, #3
	strbeq r0, [r1]
	b _0234221C
_023421F4:
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	movne r0, #7
	strbne r0, [r1]
	moveq r0, #8
	strbeq r0, [r1]
	b _0234221C
_02342210:
	ldr r0, _02342228 @ =0x02352BB8
	ldrb r0, [r0, r2]
	strb r0, [r1]
_0234221C:
	bl ov02_023420A4
	pop {r4, pc}
	.align 2, 0
_02342224: .4byte 0x0235AAEC
_02342228: .4byte 0x02352BB8
	arm_func_end ov02_0234217C

	arm_func_start ov02_0234222C
ov02_0234222C: @ 0x0234222C
	push {r3, lr}
	ldr r1, _02342254 @ =0x0235AAEC
	ldr r2, _02342258 @ =0x02352BD0
	strb r0, [r1]
	ldrb r0, [r2, r0]
	bl ov02_02341E4C
	ldr r1, _02342254 @ =0x0235AAEC
	strb r0, [r1, #2]
	bl ov02_023420A4
	pop {r3, pc}
	.align 2, 0
_02342254: .4byte 0x0235AAEC
_02342258: .4byte 0x02352BD0
	arm_func_end ov02_0234222C

	arm_func_start ov02_0234225C
ov02_0234225C: @ 0x0234225C
	push {r3, r4, r5, lr}
	mov r5, r0
	bl ov02_02347518
	ldr r1, _02342540 @ =0x0235AAEC
	mov r4, #0
	ldrb r2, [r1]
	cmp r2, #8
	ldrbeq r0, [r0, #0xf5]
	cmpeq r0, #0
	bne _02342290
	cmp r5, #0
	cmpne r5, #2
	popeq {r3, r4, r5, pc}
_02342290:
	cmp r2, #0
	bgt _023422A0
	beq _023422C0
	b _02342424
_023422A0:
	sub r0, r2, #0xa
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02342424
_023422B0: @ jump table
	b _023422F8 @ case 0
	b _02342334 @ case 1
	b _0234239C @ case 2
	b _0234239C @ case 3
_023422C0:
	cmp r5, #1
	bne _023422D8
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #0xb
	strb r1, [r0]
	b _02342520
_023422D8:
	cmp r5, #3
	movne r4, #2
	bne _02342520
	ldr r0, _02342540 @ =0x0235AAEC
	ldrb r1, [r0, #2]
	add r1, r1, #1
	strb r1, [r0, #2]
	b _02342520
_023422F8:
	cmp r5, #1
	bne _02342314
	ldr r0, _02342540 @ =0x0235AAEC
	ldrb r1, [r0, #2]
	sub r1, r1, #1
	strb r1, [r0, #2]
	b _02342520
_02342314:
	cmp r5, #3
	movne r4, #2
	bne _02342520
	ldr r0, _02342540 @ =0x0235AAEC
	ldr r1, [r0, #8]
	ldrb r1, [r1, #0x42]
	strb r1, [r0]
	b _02342520
_02342334:
	cmp r5, #1
	bne _0234236C
	ldr r0, _02342540 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, r4, r5, pc}
_0234236C:
	cmp r5, #3
	movne r4, #2
	bne _02342520
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	bl ov02_02341294
	mov r0, #0
	bl ov02_02346FEC
	b _02342520
_0234239C:
	ldr r0, _02342540 @ =0x0235AAEC
	cmp r5, #1
	ldr r1, [r0, #8]
	strb r2, [r1, #0x42]
	bne _023423D8
	mov r1, #0xa
	strb r1, [r0]
	mov r1, #3
	strb r1, [r0, #2]
	mov r1, #0x91
	strh r1, [r0, #4]
	bl ov02_02341294
	mov r0, #0x37
	bl ov02_02346FEC
	b _02342520
_023423D8:
	cmp r5, #3
	bne _0234240C
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x47]
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov02_023480E0
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x47]
	pop {r3, r4, r5, pc}
_0234240C:
	cmp r2, #0xc
	moveq r1, #0xd
	strbeq r1, [r0]
	movne r1, #0xc
	strbne r1, [r0]
	b _02342520
_02342424:
	cmp r5, #1
	bne _02342470
	ldr r0, _02342540 @ =0x0235AAEC
	ldrb r1, [r0, #2]
	cmp r1, #0
	subne r1, r1, #1
	strbne r1, [r0, #2]
	bne _02342520
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02342544 @ =ov02_02341EB4
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02342540 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, r4, r5, pc}
_02342470:
	cmp r5, #3
	bne _023424BC
	ldr r0, _02342540 @ =0x0235AAEC
	ldrb r1, [r0, #2]
	cmp r1, #3
	addlo r1, r1, #1
	strblo r1, [r0, #2]
	blo _02342520
	mov r0, #0x13
	bl ov02_023480E0
	mov r0, #0
	ldr r1, _02342548 @ =ov02_02341F7C
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02342540 @ =0x0235AAEC
	ldr r1, [r1, #8]
	str r0, [r1, #0x38]
	pop {r3, r4, r5, pc}
_023424BC:
	cmp r2, #2
	mov r4, #2
	bne _023424D8
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #3
	strb r1, [r0]
	b _02342514
_023424D8:
	cmp r2, #3
	ldreq r0, _02342540 @ =0x0235AAEC
	strbeq r4, [r0]
	beq _02342514
	cmp r2, #7
	bne _02342500
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #8
	strb r1, [r0]
	b _02342514
_02342500:
	cmp r2, #8
	bne _02342520
	ldr r0, _02342540 @ =0x0235AAEC
	mov r1, #7
	strb r1, [r0]
_02342514:
	mov r0, #8
	bl ov02_023480E0
	bl ov02_023420A4
_02342520:
	cmp r4, #2
	popeq {r3, r4, r5, pc}
	mov r0, #8
	bl ov02_023480E0
	cmp r4, #0
	popne {r3, r4, r5, pc}
	bl ov02_0234217C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02342540: .4byte 0x0235AAEC
_02342544: .4byte ov02_02341EB4
_02342548: .4byte ov02_02341F7C
	arm_func_end ov02_0234225C

	arm_func_start ov02_0234254C
ov02_0234254C: @ 0x0234254C
	ldr r0, _02342574 @ =0x0235AAEC
	ldr r1, _02342578 @ =0x02352AD4
	ldrb r2, [r0]
	ldr r0, [r0, #8]
	ldr ip, _0234257C @ =ov02_023468A0
	sub r2, r2, #0xb
	ldrb r1, [r1, r2]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bx ip
	.align 2, 0
_02342574: .4byte 0x0235AAEC
_02342578: .4byte 0x02352AD4
_0234257C: .4byte ov02_023468A0
	arm_func_end ov02_0234254C

	arm_func_start ov02_02342580
ov02_02342580: @ 0x02342580
	push {r3, r4, r5, lr}
	ldr r5, _023425D0 @ =0x0235AAEC
	mov r4, #0
_0234258C:
	ldr r0, [r5, #8]
	add r1, r0, r4
	ldrb r0, [r1, #4]
	cmp r0, #0
	beq _023425C0
	sub r0, r0, #1
	strb r0, [r1, #4]
	ldr r0, [r5, #8]
	add r0, r0, r4
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _023425C0
	bl ov02_02341294
_023425C0:
	add r4, r4, #1
	cmp r4, #4
	blt _0234258C
	pop {r3, r4, r5, pc}
	.align 2, 0
_023425D0: .4byte 0x0235AAEC
	arm_func_end ov02_02342580

	arm_func_start ov02_023425D4
ov02_023425D4: @ 0x023425D4
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, _02342690 @ =0x02352AD8
	ldr r0, _02342694 @ =0x0235AAEC
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	ldrb ip, [r0]
	strb r3, [sp]
	strb r2, [sp, #1]
	ldrb r2, [r1, #2]
	ldrb r0, [r1, #3]
	add r1, sp, #0
	mov r3, #0
	strb r2, [sp, #2]
	strb r0, [sp, #3]
_02342610:
	ldrb r0, [r1]
	cmp ip, r0
	bne _02342674
	ldr r0, _02342694 @ =0x0235AAEC
	mov r2, #0x14
	ldr r1, [r0, #8]
	tst r3, #1
	add r1, r1, r3
	strb r2, [r1, #4]
	ldr r1, [r0, #8]
	beq _02342658
	sub r0, r3, #1
	add r0, r1, r0
	mov r1, #0
	strb r1, [r0, #4]
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
_02342658:
	add r0, r3, #1
	add r0, r1, r0
	mov r1, #0
	strb r1, [r0, #4]
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
_02342674:
	add r3, r3, #1
	cmp r3, #4
	add r1, r1, #1
	blt _02342610
	add sp, sp, #4
	ldm sp!, {r3}
	bx lr
	.align 2, 0
_02342690: .4byte 0x02352AD8
_02342694: .4byte 0x0235AAEC
	arm_func_end ov02_023425D4

	arm_func_start ov02_02342698
ov02_02342698: @ 0x02342698
	push {r4, lr}
	bl ov02_02347518
	mov r4, r0
	ldrb r0, [r4, #0x40]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	ldrb r0, [r4, #0xf6]
	cmp r0, #0
	bne _023426E4
	add r0, r4, #0xc8
	bl FUN_022ED8C0
	cmp r0, #0
	bne _023426E4
	add r0, r4, #0xcc
	bl FUN_022ED8C0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
_023426E4:
	ldrb r0, [r4, #0xf5]
	cmp r0, #0
	bne _02342730
	add r0, r4, #0xc0
	bl FUN_022ED8C0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	add r0, r4, #0xc4
	bl FUN_022ED8C0
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	add r0, r4, #0xc0
	add r1, r4, #0xf0
	bl FUN_022ED85C
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
_02342730:
	mov r0, #1
	pop {r4, pc}
	arm_func_end ov02_02342698

	arm_func_start ov02_02342738
ov02_02342738: @ 0x02342738
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _02342770 @ =0x0235AAEC
	ldr r0, [r0, #8]
	ldr r0, [r0, #0xc]
	bl ov02_02346908
	ldr r0, _02342774 @ =0x02342778
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342770: .4byte 0x0235AAEC
_02342774: .4byte 0x02342778
	arm_func_end ov02_02342738
_02342778:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xE5, 0x1B, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x75, 0xD9, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xA0, 0x07, 0x34, 0x02

	arm_func_start ov02_02342798
ov02_02342798: @ 0x02342798
	ldr r1, _023427A4 @ =0x0235AAEC
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_023427A4: .4byte 0x0235AAEC
	arm_func_end ov02_02342798
_023427A8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x05, 0x00, 0x00, 0xEB
	.byte 0xC3, 0xCA, 0xFF, 0xEB, 0x98, 0x14, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x69, 0xD9, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x5C, 0x28, 0x34, 0x02

	arm_func_start ov02_023427C8
ov02_023427C8: @ 0x023427C8
	push {r3, lr}
	ldr r0, _0234283C @ =0x02353A80
	ldr r1, _02342840 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02342844 @ =0x02353A98
	ldr r1, _02342848 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _0234284C @ =0x02353AB0
	ldr r1, _02342850 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r2, _02342854 @ =0x04001008
	ldr r1, _02342858 @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0234283C: .4byte 0x02353A80
_02342840: .4byte 0x02078310
_02342844: .4byte 0x02353A98
_02342848: .4byte FUN_02077CF8
_0234284C: .4byte 0x02353AB0
_02342850: .4byte FUN_020780D0
_02342854: .4byte 0x04001008
_02342858: .4byte 0x0400000A
	arm_func_end ov02_023427C8

	arm_func_start ov02_0234285C
ov02_0234285C: @ 0x0234285C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _023428AC @ =ov02_023428B0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023428AC: .4byte ov02_023428B0
	arm_func_end ov02_0234285C

	arm_func_start ov02_023428B0
ov02_023428B0: @ 0x023428B0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r2, #1
	mov ip, #0
	sub r3, r2, #2
	mov r0, #0x44
	mov r1, #5
	str ip, [sp]
	bl ov02_02349394
	ldr r0, _023428FC @ =0x02342900
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023428FC: .4byte 0x02342900
	arm_func_end ov02_023428B0
_02342900:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x07, 0x00, 0x00, 0xEB, 0x07, 0x00, 0x00, 0xEB, 0x81, 0x1B, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x11, 0xD9, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x30, 0x29, 0x34, 0x02

	arm_func_start ov02_02342928
ov02_02342928: @ 0x02342928
	bx lr
	arm_func_end ov02_02342928

	arm_func_start ov02_0234292C
ov02_0234292C: @ 0x0234292C
	bx lr
	arm_func_end ov02_0234292C

	arm_func_start ov02_02342930
ov02_02342930: @ 0x02342930
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02342968 @ =ov02_0234296C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342968: .4byte ov02_0234296C
	arm_func_end ov02_02342930

	arm_func_start ov02_0234296C
ov02_0234296C: @ 0x0234296C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _023429C4 @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023429C4: .4byte ov02_02343DB0
	arm_func_end ov02_0234296C

	arm_func_start ov02_023429C8
ov02_023429C8: @ 0x023429C8
	ldr r0, _023429E4 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_023429E4: .4byte 0x027FFFA8
	arm_func_end ov02_023429C8

	arm_func_start ov02_023429E8
ov02_023429E8: @ 0x023429E8
	push {r3, lr}
	ldr r0, _02342A1C @ =0x0235AAF8
	mov r1, #0
	strb r1, [r0]
	bl ov02_02342A24
	bl ov02_023352C4
	mov r0, #0x25
	bl ov02_02334E70
	mov r0, #1
	bl ov02_023343DC
	ldr r0, _02342A20 @ =ov02_02342AA4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342A1C: .4byte 0x0235AAF8
_02342A20: .4byte ov02_02342AA4
	arm_func_end ov02_023429E8

	arm_func_start ov02_02342A24
ov02_02342A24: @ 0x02342A24
	push {r3, lr}
	ldr r0, _02342A94 @ =0x02353AC4
	ldr r1, _02342A98 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02342A9C @ =0x04001008
	ldr r1, _02342AA0 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02342A94: .4byte 0x02353AC4
_02342A98: .4byte FUN_020780D0
_02342A9C: .4byte 0x04001008
_02342AA0: .4byte 0x0400000A
	arm_func_end ov02_02342A24

	arm_func_start ov02_02342AA4
ov02_02342AA4: @ 0x02342AA4
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02342AD4 @ =ov02_02342AD8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342AD4: .4byte ov02_02342AD8
	arm_func_end ov02_02342AA4

	arm_func_start ov02_02342AD8
ov02_02342AD8: @ 0x02342AD8
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _02342B00 @ =0x02342B04
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342B00: .4byte 0x02342B04
	arm_func_end ov02_02342AD8
_02342B04:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xF3, 0xC6, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3
	.byte 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08, 0x0C, 0xC7, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x90, 0xD8, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x2C, 0x2B, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9
	.byte 0x0A, 0x00, 0xA0, 0xE3, 0xF6, 0xDB, 0xF4, 0xEB, 0x74, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02342B4C
ov02_02342B4C: @ 0x02342B4C
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02342B6C
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_02342B6C:
	bl ov02_023429C8
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02342B4C

	arm_func_start ov02_02342B84
ov02_02342B84: @ 0x02342B84
	bx lr
	arm_func_end ov02_02342B84

	arm_func_start ov02_02342B88
ov02_02342B88: @ 0x02342B88
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _02342BB0 @ =0x02342BB4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342BB0: .4byte 0x02342BB4
	arm_func_end ov02_02342B88
_02342BB4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xEA, 0xC6, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xC6, 0x2B, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x66, 0xD8, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xD4, 0x2B, 0x34, 0x02

	arm_func_start ov02_02342BD4
ov02_02342BD4: @ 0x02342BD4
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02342C40 @ =0x0235AAF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _02342BFC
	bl ov02_023346AC
_02342BFC:
	ldr r0, _02342C40 @ =0x0235AAF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _02342C20
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_02342C20:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02342C44 @ =ov02_02342C48
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342C40: .4byte 0x0235AAF8
_02342C44: .4byte ov02_02342C48
	arm_func_end ov02_02342BD4

	arm_func_start ov02_02342C48
ov02_02342C48: @ 0x02342C48
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02342D04 @ =0x0235AAF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _02342C7C
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_02342C7C:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _02342D04 @ =0x0235AAF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _02342CB4
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_02342CB4:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _02342D04 @ =0x0235AAF8
	ldrb r0, [r0]
	cmp r0, #0
	bne _02342CEC
	bl ov02_0233944C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02342D08 @ =ov02_02344AF0
	bl ov02_02338D68
	pop {r3, pc}
_02342CEC:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _02342D0C @ =ov02_02342E00
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342D04: .4byte 0x0235AAF8
_02342D08: .4byte ov02_02344AF0
_02342D0C: .4byte ov02_02342E00
	arm_func_end ov02_02342C48

	arm_func_start ov02_02342D10
ov02_02342D10: @ 0x02342D10
	push {r3, lr}
	bl ov02_02339470
	cmp r0, #2
	beq _02342D2C
	cmp r0, #4
	beq _02342D44
	pop {r3, pc}
_02342D2C:
	ldr r1, _02342D88 @ =0x0235AAF8
	mov r2, #1
	ldr r0, _02342D8C @ =0x02342BB4
	strb r2, [r1]
	bl ov02_02338D68
	pop {r3, pc}
_02342D44:
	ldr r0, _02342D88 @ =0x0235AAF8
	mov r1, #0
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #9
	bl ov02_023480E0
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov02_02349394
	bl ov02_02334768
	ldr r0, _02342D90 @ =ov02_02342D94
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342D88: .4byte 0x0235AAF8
_02342D8C: .4byte 0x02342BB4
_02342D90: .4byte ov02_02342D94
	arm_func_end ov02_02342D10

	arm_func_start ov02_02342D94
ov02_02342D94: @ 0x02342D94
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _02342DBC @ =0x02342DC0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342DBC: .4byte 0x02342DC0
	arm_func_end ov02_02342D94
_02342DC0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x53, 0x1A, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xE3, 0xD7, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xB4, 0x2B, 0x34, 0x02

	arm_func_start ov02_02342DE0
ov02_02342DE0: @ 0x02342DE0
	ldr r0, _02342DFC @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02342DFC: .4byte 0x027FFFA8
	arm_func_end ov02_02342DE0

	arm_func_start ov02_02342E00
ov02_02342E00: @ 0x02342E00
	push {r3, lr}
	ldr r0, _02342E34 @ =0x0235AAFC
	mov r1, #0
	strb r1, [r0]
	bl ov02_02342E3C
	bl ov02_023352C4
	mov r0, #0x2a
	bl ov02_02334E70
	mov r0, #2
	bl ov02_023343DC
	ldr r0, _02342E38 @ =ov02_02342EBC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342E34: .4byte 0x0235AAFC
_02342E38: .4byte ov02_02342EBC
	arm_func_end ov02_02342E00

	arm_func_start ov02_02342E3C
ov02_02342E3C: @ 0x02342E3C
	push {r3, lr}
	ldr r0, _02342EAC @ =0x02353AD8
	ldr r1, _02342EB0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02342EB4 @ =0x04001008
	ldr r1, _02342EB8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02342EAC: .4byte 0x02353AD8
_02342EB0: .4byte FUN_020780D0
_02342EB4: .4byte 0x04001008
_02342EB8: .4byte 0x0400000A
	arm_func_end ov02_02342E3C

	arm_func_start ov02_02342EBC
ov02_02342EBC: @ 0x02342EBC
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02342EEC @ =ov02_02342EF0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342EEC: .4byte ov02_02342EF0
	arm_func_end ov02_02342EBC

	arm_func_start ov02_02342EF0
ov02_02342EF0: @ 0x02342EF0
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _02342F18 @ =0x02342F1C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342F18: .4byte 0x02342F1C
	arm_func_end ov02_02342EF0
_02342F1C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xED, 0xC5, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0x06, 0xC6, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x8A, 0xD7, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x44, 0x2F, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x0A, 0x00, 0xA0, 0xE3, 0xF0, 0xDA, 0xF4, 0xEB
	.byte 0x6D, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02342F64
ov02_02342F64: @ 0x02342F64
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02342F84
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_02342F84:
	bl ov02_02342DE0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02342F64

	arm_func_start ov02_02342F9C
ov02_02342F9C: @ 0x02342F9C
	bx lr
	arm_func_end ov02_02342F9C

	arm_func_start ov02_02342FA0
ov02_02342FA0: @ 0x02342FA0
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _02342FC8 @ =0x02342FCC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02342FC8: .4byte 0x02342FCC
	arm_func_end ov02_02342FA0
_02342FCC:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0xE4, 0xC5, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0xC0, 0x2A, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x60, 0xD7, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xEC, 0x2F, 0x34, 0x02

	arm_func_start ov02_02342FEC
ov02_02342FEC: @ 0x02342FEC
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _02343048 @ =0x0235AAFC
	ldrb r0, [r0]
	cmp r0, #0
	bne _02343028
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_02343028:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0234304C @ =ov02_02343050
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343048: .4byte 0x0235AAFC
_0234304C: .4byte ov02_02343050
	arm_func_end ov02_02342FEC

	arm_func_start ov02_02343050
ov02_02343050: @ 0x02343050
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02343100 @ =0x0235AAFC
	ldrb r0, [r0]
	cmp r0, #0
	bne _02343084
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_02343084:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _02343100 @ =0x0235AAFC
	ldrb r0, [r0]
	cmp r0, #0
	bne _023430BC
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_023430BC:
	bl ov02_0233944C
	ldr r0, _02343100 @ =0x0235AAFC
	ldrb r0, [r0]
	cmp r0, #0
	bne _023430E8
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02343104 @ =ov02_02344AF0
	bl ov02_02338D68
	pop {r3, pc}
_023430E8:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _02343108 @ =ov02_02343230
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343100: .4byte 0x0235AAFC
_02343104: .4byte ov02_02344AF0
_02343108: .4byte ov02_02343230
	arm_func_end ov02_02343050

	arm_func_start ov02_0234310C
ov02_0234310C: @ 0x0234310C
	push {r3, lr}
	bl ov02_02339470
	cmp r0, #3
	beq _02343130
	cmp r0, #4
	beq _02343150
_02343124:
	cmp r0, #5
	beq _02343194
	pop {r3, pc}
_02343130:
	ldr r0, _023431D8 @ =0x0235AAFC
	mov r1, #1
	strb r1, [r0]
	bl ov02_02348148
	bl ov02_0233952C
	ldr r0, _023431DC @ =0x02342FCC
	bl ov02_02338D68
	pop {r3, pc}
_02343150:
	ldr r0, _023431D8 @ =0x0235AAFC
	mov r1, #0
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #9
	bl ov02_023480E0
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov02_02349394
	bl ov02_02334768
	ldr r0, _023431E0 @ =ov02_023431E4
	bl ov02_02338D68
	pop {r3, pc}
_02343194:
	ldr r0, _023431D8 @ =0x0235AAFC
	mov r1, #0
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #0x12
	bl ov02_023480E0
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xe
	str ip, [sp]
	bl ov02_02349394
	bl ov02_02334768
	ldr r0, _023431E0 @ =ov02_023431E4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023431D8: .4byte 0x0235AAFC
_023431DC: .4byte 0x02342FCC
_023431E0: .4byte ov02_023431E4
	arm_func_end ov02_0234310C

	arm_func_start ov02_023431E4
ov02_023431E4: @ 0x023431E4
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _0234320C @ =0x02343210
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234320C: .4byte 0x02343210
	arm_func_end ov02_023431E4
_02343210:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x3F, 0x19, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xCF, 0xD6, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xCC, 0x2F, 0x34, 0x02

	arm_func_start ov02_02343230
ov02_02343230: @ 0x02343230
	push {r3, lr}
	ldr r0, _02343264 @ =0x0235AB00
	mov r1, #0
	strb r1, [r0]
	bl ov02_0234326C
	bl ov02_023352C4
	mov r0, #0x26
	bl ov02_02334E70
	mov r0, #0x10
	bl ov02_023480E0
	ldr r0, _02343268 @ =ov02_023432EC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343264: .4byte 0x0235AB00
_02343268: .4byte ov02_023432EC
	arm_func_end ov02_02343230

	arm_func_start ov02_0234326C
ov02_0234326C: @ 0x0234326C
	push {r3, lr}
	ldr r0, _023432DC @ =0x02353AEC
	ldr r1, _023432E0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _023432E4 @ =0x04001008
	ldr r1, _023432E8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_023432DC: .4byte 0x02353AEC
_023432E0: .4byte FUN_020780D0
_023432E4: .4byte 0x04001008
_023432E8: .4byte 0x0400000A
	arm_func_end ov02_0234326C

	arm_func_start ov02_023432EC
ov02_023432EC: @ 0x023432EC
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _0234331C @ =0x02343320
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234331C: .4byte 0x02343320
	arm_func_end ov02_023432EC
_02343320:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0x63, 0x29, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x8A, 0xD6, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x44, 0x33, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x2D, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02343354
ov02_02343354: @ 0x02343354
	bx lr
	arm_func_end ov02_02343354

	arm_func_start ov02_02343358
ov02_02343358: @ 0x02343358
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02343390 @ =ov02_02343394
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343390: .4byte ov02_02343394
	arm_func_end ov02_02343358

	arm_func_start ov02_02343394
ov02_02343394: @ 0x02343394
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	mov r0, #0
	mov r1, #1
	bl ov02_02338DB4
	ldr r0, _02343400 @ =ov02_02345968
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343400: .4byte ov02_02345968
	arm_func_end ov02_02343394

	arm_func_start ov02_02343404
ov02_02343404: @ 0x02343404
	push {r3, lr}
	ldr r0, _02343430 @ =0x0235AB00
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _02343434 @ =ov02_02343358
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343430: .4byte 0x0235AB00
_02343434: .4byte ov02_02343358
	arm_func_end ov02_02343404

	arm_func_start ov02_02343438
ov02_02343438: @ 0x02343438
	ldr r0, _02343454 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02343454: .4byte 0x027FFFA8
	arm_func_end ov02_02343438

	arm_func_start ov02_02343458
ov02_02343458: @ 0x02343458
	push {r3, lr}
	ldr r0, _023434AC @ =0x0235AB04
	mov r1, #0
	strb r1, [r0]
	bl ov02_023434B4
	bl ov02_023352C4
	mov r0, #0x37
	sub r1, r0, #0x38
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #2
	bl ov02_02334DE8
	mov r0, #0x24
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	mov r0, #0xb
	bl ov02_023480E0
	ldr r0, _023434B0 @ =ov02_0234355C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023434AC: .4byte 0x0235AB04
_023434B0: .4byte ov02_0234355C
	arm_func_end ov02_02343458

	arm_func_start ov02_023434B4
ov02_023434B4: @ 0x023434B4
	push {r3, lr}
	ldr r0, _0234353C @ =0x02353B00
	ldr r1, _02343540 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02343544 @ =0x02353B18
	ldr r1, _02343548 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _0234354C @ =0x02353B30
	ldr r1, _02343550 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02343554 @ =0x04001008
	ldr r1, _02343558 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_0234353C: .4byte 0x02353B00
_02343540: .4byte 0x02078310
_02343544: .4byte 0x02353B18
_02343548: .4byte FUN_02077CF8
_0234354C: .4byte 0x02353B30
_02343550: .4byte FUN_020780D0
_02343554: .4byte 0x04001008
_02343558: .4byte 0x0400000A
	arm_func_end ov02_023434B4

	arm_func_start ov02_0234355C
ov02_0234355C: @ 0x0234355C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _023435AC @ =ov02_023435B0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023435AC: .4byte ov02_023435B0
	arm_func_end ov02_0234355C

	arm_func_start ov02_023435B0
ov02_023435B0: @ 0x023435B0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023393E0
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _023435EC @ =0x023435F0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023435EC: .4byte 0x023435F0
	arm_func_end ov02_023435B0
_023435F0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x38, 0xC4, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0x51, 0xC4, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xD5, 0xD5, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x18, 0x36, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x0A, 0x00, 0xA0, 0xE3
	.byte 0x3B, 0xD9, 0xF4, 0xEB, 0x74, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02343638
ov02_02343638: @ 0x02343638
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02343658
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_02343658:
	bl ov02_02343438
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02343638

	arm_func_start ov02_02343670
ov02_02343670: @ 0x02343670
	bx lr
	arm_func_end ov02_02343670

	arm_func_start ov02_02343674
ov02_02343674: @ 0x02343674
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _0234369C @ =0x023436A0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234369C: .4byte 0x023436A0
	arm_func_end ov02_02343674
_023436A0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x2F, 0xC4, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3, 0x0B, 0x29, 0x00, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xAB, 0xD5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xC0, 0x36, 0x34, 0x02

	arm_func_start ov02_023436C0
ov02_023436C0: @ 0x023436C0
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234372C @ =0x0235AB04
	ldrb r0, [r0]
	cmp r0, #0
	bne _023436E8
	bl ov02_023346AC
_023436E8:
	ldr r0, _0234372C @ =0x0235AB04
	ldrb r0, [r0]
	cmp r0, #0
	bne _0234370C
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_0234370C:
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02343730 @ =ov02_02343734
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234372C: .4byte 0x0235AB04
_02343730: .4byte ov02_02343734
	arm_func_end ov02_023436C0

	arm_func_start ov02_02343734
ov02_02343734: @ 0x02343734
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _023437F0 @ =0x0235AB04
	ldrb r0, [r0]
	cmp r0, #0
	bne _02343768
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_02343768:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _023437F0 @ =0x0235AB04
	ldrb r0, [r0]
	cmp r0, #0
	bne _023437A0
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_023437A0:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _023437F0 @ =0x0235AB04
	ldrb r0, [r0]
	cmp r0, #0
	bne _023437D8
	bl ov02_0233944C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _023437F4 @ =ov02_02344AF0
	bl ov02_02338D68
	pop {r3, pc}
_023437D8:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _023437F8 @ =ov02_023429E8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023437F0: .4byte 0x0235AB04
_023437F4: .4byte ov02_02344AF0
_023437F8: .4byte ov02_023429E8
	arm_func_end ov02_02343734

	arm_func_start ov02_023437FC
ov02_023437FC: @ 0x023437FC
	push {r3, lr}
	bl ov02_02339470
	cmp r0, #1
	beq _02343818
	cmp r0, #4
	beq _02343830
	pop {r3, pc}
_02343818:
	ldr r1, _02343874 @ =0x0235AB04
	mov r2, #1
	ldr r0, _02343878 @ =0x023436A0
	strb r2, [r1]
	bl ov02_02338D68
	pop {r3, pc}
_02343830:
	ldr r0, _02343874 @ =0x0235AB04
	mov r1, #0
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #9
	bl ov02_023480E0
	mov r1, #1
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xd
	str ip, [sp]
	bl ov02_02349394
	bl ov02_02334768
	ldr r0, _0234387C @ =ov02_02343880
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343874: .4byte 0x0235AB04
_02343878: .4byte 0x023436A0
_0234387C: .4byte ov02_02343880
	arm_func_end ov02_023437FC

	arm_func_start ov02_02343880
ov02_02343880: @ 0x02343880
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _023438A8 @ =0x023438AC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023438A8: .4byte 0x023438AC
	arm_func_end ov02_02343880
_023438AC:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x98, 0x17, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5
	.byte 0x28, 0xD5, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xA0, 0x36, 0x34, 0x02

	arm_func_start ov02_023438CC
ov02_023438CC: @ 0x023438CC
	push {r3, lr}
	ldr r0, _0234392C @ =0x0235AB08
	mov r1, #0
	strh r1, [r0, #2]
	strb r1, [r0]
	bl ov02_02343934
	mov r0, #0x33
	sub r1, r0, #0x34
	mov r2, #0
	bl ov02_02334C3C
	bl ov02_023352C4
	mov r0, #2
	bl ov02_02334DE8
	mov r0, #0x33
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	bl ov02_02347028
	bl ov02_02347090
	mov r0, #0xa
	bl ov02_023480E0
	ldr r0, _02343930 @ =ov02_023439DC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234392C: .4byte 0x0235AB08
_02343930: .4byte ov02_023439DC
	arm_func_end ov02_023438CC

	arm_func_start ov02_02343934
ov02_02343934: @ 0x02343934
	push {r3, lr}
	ldr r0, _023439BC @ =0x02353B44
	ldr r1, _023439C0 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _023439C4 @ =0x02353B5C
	ldr r1, _023439C8 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _023439CC @ =0x02353B74
	ldr r1, _023439D0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _023439D4 @ =0x04001008
	ldr r1, _023439D8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_023439BC: .4byte 0x02353B44
_023439C0: .4byte 0x02078310
_023439C4: .4byte 0x02353B5C
_023439C8: .4byte FUN_02077CF8
_023439CC: .4byte 0x02353B74
_023439D0: .4byte FUN_020780D0
_023439D4: .4byte 0x04001008
_023439D8: .4byte 0x0400000A
	arm_func_end ov02_02343934

	arm_func_start ov02_023439DC
ov02_023439DC: @ 0x023439DC
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02343A2C @ =ov02_02343A30
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343A2C: .4byte ov02_02343A30
	arm_func_end ov02_023439DC

	arm_func_start ov02_02343A30
ov02_02343A30: @ 0x02343A30
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #1
	bl ov02_02334E38
	ldr r0, _02343A68 @ =0x02343A6C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343A68: .4byte 0x02343A6C
	arm_func_end ov02_02343A30
_02343A6C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x19, 0xC3, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1, 0x08, 0x80, 0xBD, 0x08
	.byte 0x32, 0xC3, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xB6, 0xD4, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x94, 0x3A, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x4D, 0x00, 0x00, 0xEB, 0x55, 0x00, 0x00, 0xEB
	.byte 0x55, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02343AAC
ov02_02343AAC: @ 0x02343AAC
	push {r3, lr}
	sub sp, sp, #8
	ldr r0, _02343BC8 @ =0x0235AB08
	ldrh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	ldrh r0, [r0, #2]
	cmp r0, #0x12c
	addlo sp, sp, #8
	poplo {r3, pc}
	bl ov02_02348148
	add r0, sp, #4
	bl ov02_0234722C
	cmp r0, #0
	bne _02343B2C
	ldr r0, _02343BC8 @ =0x0235AB08
	mov r1, #1
	mov r3, #2
	strb r3, [r0]
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xf
	str ip, [sp]
	bl ov02_02349394
	mov r0, #0x12
	bl ov02_023480E0
	bl ov02_02334768
	ldr r0, _02343BCC @ =ov02_02343D64
	bl ov02_02338D68
	add sp, sp, #8
	pop {r3, pc}
_02343B2C:
	cmp r0, #0
	mov r2, #0
	ble _02343B58
	ldr r3, [sp, #4]
_02343B3C:
	ldrb r1, [r3, #0x28]
	cmp r1, #2
	bne _02343B58
	add r2, r2, #1
	cmp r2, r0
	add r3, r3, #0x2a
	blt _02343B3C
_02343B58:
	cmp r2, r0
	bne _02343BA4
	ldr r0, _02343BC8 @ =0x0235AB08
	mov r1, #1
	mov r3, #3
	strb r3, [r0]
	mov ip, #0
	mov r2, r1
	sub r3, r1, #2
	mov r0, #0xe
	str ip, [sp]
	bl ov02_02349394
	mov r0, #0x12
	bl ov02_023480E0
	bl ov02_02334768
	ldr r0, _02343BCC @ =ov02_02343D64
	bl ov02_02338D68
	add sp, sp, #8
	pop {r3, pc}
_02343BA4:
	ldr r1, _02343BC8 @ =0x0235AB08
	mov r2, #1
	mov r0, #0xf
	strb r2, [r1]
	bl ov02_023480E0
	ldr r0, _02343BD0 @ =0x02343C28
	bl ov02_02338D68
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02343BC8: .4byte 0x0235AB08
_02343BCC: .4byte ov02_02343D64
_02343BD0: .4byte 0x02343C28
	arm_func_end ov02_02343AAC

	arm_func_start ov02_02343BD4
ov02_02343BD4: @ 0x02343BD4
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_02348148
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02343BD4

	arm_func_start ov02_02343BF8
ov02_02343BF8: @ 0x02343BF8
	bx lr
	arm_func_end ov02_02343BF8

	arm_func_start ov02_02343BFC
ov02_02343BFC: @ 0x02343BFC
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _02343C24 @ =0x02343C28
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343C24: .4byte 0x02343C28
	arm_func_end ov02_02343BFC
_02343C28:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xCD, 0xC2, 0xFF, 0xEB
	.byte 0x08, 0x00, 0xA0, 0xE3, 0xA9, 0x27, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x49, 0xD4, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x48, 0x3C, 0x34, 0x02

	arm_func_start ov02_02343C48
ov02_02343C48: @ 0x02343C48
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02343C94 @ =ov02_02343C98
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343C94: .4byte ov02_02343C98
	arm_func_end ov02_02343C48

	arm_func_start ov02_02343C98
ov02_02343C98: @ 0x02343C98
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
_02343CC8:
	bl ov02_02347190
	cmp r0, #0
	beq _02343CC8
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _02343D58 @ =0x0235AB08
	ldrb r0, [r0]
	cmp r0, #1
	beq _02343D34
	bl ov02_0234705C
	bl ov02_02347518
	ldrb r0, [r0, #0xf4]
	bl ov02_0234793C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02343D5C @ =ov02_02344AF0
	bl ov02_02338D68
	pop {r3, pc}
_02343D34:
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	ldr r0, _02343D60 @ =ov02_0233CEEC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343D58: .4byte 0x0235AB08
_02343D5C: .4byte ov02_02344AF0
_02343D60: .4byte ov02_0233CEEC
	arm_func_end ov02_02343C98

	arm_func_start ov02_02343D64
ov02_02343D64: @ 0x02343D64
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _02343D8C @ =0x02343D90
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343D8C: .4byte 0x02343D90
	arm_func_end ov02_02343D64
_02343D90:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x5F, 0x16, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xEF, 0xD3, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0x28, 0x3C, 0x34, 0x02

	arm_func_start ov02_02343DB0
ov02_02343DB0: @ 0x02343DB0
	push {r3, lr}
	mov r0, #0x20
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _02343E08 @ =0x0235AB0C
	mov r2, #0
	str r0, [r1, #4]
	strb r2, [r0, #0x1d]
	bl ov02_02343E10
	mov r0, #1
	bl ov02_02335268
	mov r0, #0x2f
	sub r1, r0, #0x30
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #0
	bl ov02_02334DE8
	bl ov02_02343F20
	bl ov02_02344590
	ldr r0, _02343E0C @ =ov02_02344028
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02343E08: .4byte 0x0235AB0C
_02343E0C: .4byte ov02_02344028
	arm_func_end ov02_02343DB0

	arm_func_start ov02_02343E10
ov02_02343E10: @ 0x02343E10
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02343EF0 @ =0x02352BE8
	add r3, sp, #0
	mov r2, #0xb
_02343E24:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02343E24
	ldr r0, _02343EF4 @ =0x02353B88
	ldr r1, _02343EF8 @ =0x02077DA4
	bl ov02_02334DA8
	ldr r0, _02343EFC @ =0x02353B9C
	ldr r1, _02343F00 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02343F04 @ =0x02353BB4
	ldr r1, _02343F08 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _02343F0C @ =0x02353BCC
	ldr r1, _02343F10 @ =FUN_020780D0
	bl ov02_02334DA8
	add r0, sp, #0
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r2, _02343F14 @ =0x0235AB0C
	mov r1, #0x10
	ldr r2, [r2, #4]
	str r0, [r2]
	mov r0, #1
	bl ov02_0234E3D0
	ldr r2, _02343F18 @ =0x04001008
	ldr r1, _02343F1C @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02343EF0: .4byte 0x02352BE8
_02343EF4: .4byte 0x02353B88
_02343EF8: .4byte 0x02077DA4
_02343EFC: .4byte 0x02353B9C
_02343F00: .4byte 0x02078310
_02343F04: .4byte 0x02353BB4
_02343F08: .4byte FUN_02077CF8
_02343F0C: .4byte 0x02353BCC
_02343F10: .4byte FUN_020780D0
_02343F14: .4byte 0x0235AB0C
_02343F18: .4byte 0x04001008
_02343F1C: .4byte 0x0400000A
	arm_func_end ov02_02343E10

	arm_func_start ov02_02343F20
ov02_02343F20: @ 0x02343F20
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	ldr r6, _0234401C @ =0x02352BFE
	ldr r5, _02344020 @ =0x02352BDC
	ldr r4, _02344024 @ =0x0235AB0C
	mov fp, sl
	mvn r7, #0
	mov r8, #3
_02343F40:
	mov r0, sl
	bl ov02_02347924
	mov sb, r0
	cmp sb, #0xff
	moveq sb, r8
	beq _02343FB4
	mov r0, fp
	mov r1, #0x11
	mov r2, #1
	bl ov02_0234D6D8
	ldr r1, [r4, #4]
	add r3, sl, #3
	add r1, r1, sl, lsl #2
	str r0, [r1, #0x10]
	lsl r2, r3, #2
	ldr r0, [r4, #4]
	add r3, r6, r3, lsl #2
	add r0, r0, sl, lsl #2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	ldr r0, [r0, #0x10]
	mov r1, r7
	bl ov02_0234D440
	ldr r0, [r4, #4]
	mov r1, r7
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x10]
	mov r2, #3
	bl ov02_0234D530
_02343FB4:
	ldrb r1, [r5, sb]
	mov r0, #0
	mov r2, #1
	bl ov02_0234D6D8
	ldr r1, [r4, #4]
	lsl r2, sl, #2
	add r1, r1, sl, lsl #2
	str r0, [r1, #4]
	ldr r0, [r4, #4]
	add r3, r6, sl, lsl #2
	add r0, r0, sl, lsl #2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	ldr r0, [r0, #4]
	mov r1, r7
	bl ov02_0234D440
	ldr r0, [r4, #4]
	mov r1, r7
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #4]
	mov r2, #3
	bl ov02_0234D530
	add sl, sl, #1
	cmp sl, #3
	blt _02343F40
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234401C: .4byte 0x02352BFE
_02344020: .4byte 0x02352BDC
_02344024: .4byte 0x0235AB0C
	arm_func_end ov02_02343F20

	arm_func_start ov02_02344028
ov02_02344028: @ 0x02344028
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _02344078 @ =ov02_0234407C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02344078: .4byte ov02_0234407C
	arm_func_end ov02_02344028

	arm_func_start ov02_0234407C
ov02_0234407C: @ 0x0234407C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_02334E38
	ldr r0, _023440B4 @ =ov02_023440B8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023440B4: .4byte ov02_023440B8
	arm_func_end ov02_0234407C

	arm_func_start ov02_023440B8
ov02_023440B8: @ 0x023440B8
	push {r3, lr}
	bl ov02_023346DC
	mvn r1, #1
	cmp r0, r1
	popeq {r3, pc}
	bl ov02_023487D0
	cmp r0, #1
	popeq {r3, pc}
	bl ov02_02334750
	ldr r0, _023440E8 @ =0x023440EC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023440E8: .4byte 0x023440EC
	arm_func_end ov02_023440B8
_023440EC:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x02, 0x00, 0x00, 0xEB, 0x3E, 0x00, 0x00, 0xEB, 0x3E, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02344100
ov02_02344100: @ 0x02344100
	push {r3, r4, r5, lr}
	ldr r5, _023441EC @ =0x02352C16
	mov r4, #0
_0234410C:
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _02344134
	mov r0, #1
	bl ov02_023346F0
	ldr r0, _023441F0 @ =0x0235AB0C
	strb r4, [r0]
	bl ov02_02344590
	pop {r3, r4, r5, pc}
_02344134:
	add r4, r4, #1
	cmp r4, #7
	add r5, r5, #8
	blo _0234410C
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02344160
	mov r0, #1
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_02344160:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0234417C
	mov r0, #0
	bl ov02_023346F0
	pop {r3, r4, r5, pc}
_0234417C:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02344198
	mov r0, #1
	bl ov02_0234460C
	pop {r3, r4, r5, pc}
_02344198:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _023441B4
	mov r0, #3
	bl ov02_0234460C
	pop {r3, r4, r5, pc}
_023441B4:
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _023441D0
	mov r0, #0
	bl ov02_0234460C
	pop {r3, r4, r5, pc}
_023441D0:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, #2
	bl ov02_0234460C
	pop {r3, r4, r5, pc}
	.align 2, 0
_023441EC: .4byte 0x02352C16
_023441F0: .4byte 0x0235AB0C
	arm_func_end ov02_02344100

	arm_func_start ov02_023441F4
ov02_023441F4: @ 0x023441F4
	bx lr
	arm_func_end ov02_023441F4

	arm_func_start ov02_023441F8
ov02_023441F8: @ 0x023441F8
	push {r3, r4, lr}
	sub sp, sp, #4
	bl ov02_023346DC
	cmp r0, #0
	beq _0234421C
	cmp r0, #1
	beq _02344264
	add sp, sp, #4
	pop {r3, r4, pc}
_0234421C:
	bl ov02_02338E00
	cmp r0, #0
	beq _02344234
	cmp r0, #1
	beq _02344250
	b _02344308
_02344234:
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _02344318 @ =0x0235AB0C
	mov r1, #2
	ldr r0, [r0, #4]
	strb r1, [r0, #0x1d]
	b _02344308
_02344250:
	bl ov02_02334768
	ldr r0, _0234431C @ =ov02_0233958C
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, pc}
_02344264:
	ldr r0, _02344318 @ =0x0235AB0C
	mov r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x1d]
	ldrb r0, [r0]
	cmp r0, #4
	blo _023442F0
	sub r4, r0, #4
	mov r0, r4
	bl ov02_02347924
	cmp r0, #0xff
	bne _023442AC
	mov r0, #9
	bl ov02_023480E0
	mvn r0, #0
	bl ov02_02334710
	add sp, sp, #4
	pop {r3, r4, pc}
_023442AC:
	mov r0, #6
	bl ov02_023480E0
	bl ov02_02338DF0
	ldr r1, _02344320 @ =0x02352C88
	add ip, r4, #1
	ldrsb r3, [r1, r0]
	mov r0, #0x46
	mov r1, #0
	mov r2, #1
	str ip, [sp]
	bl ov02_02349394
	bl ov02_02344800
	bl ov02_02334768
	ldr r0, _02344324 @ =ov02_02344890
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, pc}
_023442F0:
	cmp r0, #2
	bhi _023442FC
	bl ov02_0234793C
_023442FC:
	mov r0, #6
	bl ov02_023480E0
	bl ov02_02344A20
_02344308:
	ldr r0, _02344328 @ =ov02_0234432C
	bl ov02_02338D68
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02344318: .4byte 0x0235AB0C
_0234431C: .4byte ov02_0233958C
_02344320: .4byte 0x02352C88
_02344324: .4byte ov02_02344890
_02344328: .4byte ov02_0234432C
	arm_func_end ov02_023441F8

	arm_func_start ov02_0234432C
ov02_0234432C: @ 0x0234432C
	push {r3, lr}
	ldr r0, _02344360 @ =0x0235AB0C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x1d]
	cmp r0, #2
	bne _02344348
	bl ov02_023486C8
_02344348:
	bl ov02_02334768
	mov r0, #8
	bl ov02_0234DAE0
	ldr r0, _02344364 @ =ov02_02344368
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02344360: .4byte 0x0235AB0C
_02344364: .4byte ov02_02344368
	arm_func_end ov02_0234432C

	arm_func_start ov02_02344368
ov02_02344368: @ 0x02344368
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _023443E4 @ =0x0235AB0C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x1d]
	cmp r1, #1
	bne _023443B0
	ldrb r0, [r0]
	cmp r0, #3
	beq _023443AC
	bl ov02_02347518
	ldrb r0, [r0, #0xe7]
	cmp r0, #0xff
	beq _023443B0
_023443AC:
	bl ov02_023346AC
_023443B0:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _023443E8 @ =ov02_023443EC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023443E4: .4byte 0x0235AB0C
_023443E8: .4byte ov02_023443EC
	arm_func_end ov02_02344368

	arm_func_start ov02_023443EC
ov02_023443EC: @ 0x023443EC
	push {r3, r4, r5, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl ov02_02348BF0
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r4, _02344570 @ =0x0235AB0C
	mov r5, #0
_02344430:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02344448
	bl ov02_0234D288
_02344448:
	add r5, r5, #1
	cmp r5, #3
	blo _02344430
	ldr r4, _02344570 @ =0x0235AB0C
	mov r5, #0
_0234445C:
	ldr r0, [r4, #4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02344474
	bl ov02_0234D288
_02344474:
	add r5, r5, #1
	cmp r5, #3
	blo _0234445C
	bl ov02_0233519C
	bl ov02_02334D10
	ldr r0, _02344570 @ =0x0235AB0C
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bl ov02_0234CF78
	ldr r0, _02344574 @ =0x02353BE0
	ldr r1, _02344578 @ =0x02077DA4
	bl ov02_02334DA8
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	ldr r0, _02344570 @ =0x0235AB0C
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x1d]
	cmp r1, #2
	bne _023444E8
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _0234457C @ =ov02_023398CC
	bl ov02_02338D68
	b _02344564
_023444E8:
	ldrb r0, [r0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02344564
_023444F8: @ jump table
	b _02344508 @ case 0
	b _02344508 @ case 1
	b _02344508 @ case 2
	b _02344550 @ case 3
_02344508:
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	bl ov02_02347518
	ldrb r0, [r0, #0xe7]
	cmp r0, #0xff
	bne _02344530
	ldr r0, _02344580 @ =ov02_02344AF0
	bl ov02_02338D68
	b _02344564
_02344530:
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	mov r0, #0
	bl ov02_02342798
	ldr r0, _02344584 @ =ov02_023402CC
	bl ov02_02338D68
	b _02344564
_02344550:
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02344588 @ =ov02_02345DC8
	bl ov02_02338D68
_02344564:
	ldr r0, _0234458C @ =0x0235AB10
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02344570: .4byte 0x0235AB0C
_02344574: .4byte 0x02353BE0
_02344578: .4byte 0x02077DA4
_0234457C: .4byte ov02_023398CC
_02344580: .4byte ov02_02344AF0
_02344584: .4byte ov02_023402CC
_02344588: .4byte ov02_02345DC8
_0234458C: .4byte 0x0235AB10
	arm_func_end ov02_023443EC

	arm_func_start ov02_02344590
ov02_02344590: @ 0x02344590
	push {r3, lr}
	ldr r0, _023445F8 @ =0x0235AB0C
	ldrb r2, [r0]
	cmp r2, #4
	bhs _023445D0
	lsl ip, r2, #3
	ldr r0, _023445FC @ =0x02352C4E
	ldr r1, _02344600 @ =0x02352C52
	ldr r2, _02344604 @ =0x02352C50
	ldr r3, _02344608 @ =0x02352C54
	ldrh r0, [r0, ip]
	ldrh r1, [r1, ip]
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov02_023350AC
	pop {r3, pc}
_023445D0:
	ldr r1, _023445FC @ =0x02352C4E
	lsl r3, r2, #3
	ldr r2, _02344600 @ =0x02352C52
	ldr r0, _02344604 @ =0x02352C50
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldrh r3, [r0, r3]
	mov r0, #0
	bl ov02_02334FF0
	pop {r3, pc}
	.align 2, 0
_023445F8: .4byte 0x0235AB0C
_023445FC: .4byte 0x02352C4E
_02344600: .4byte 0x02352C52
_02344604: .4byte 0x02352C50
_02344608: .4byte 0x02352C54
	arm_func_end ov02_02344590

	arm_func_start ov02_0234460C
ov02_0234460C: @ 0x0234460C
	push {r3, lr}
	ldr r2, _023447FC @ =0x0235AB0C
	mov r1, #1
	ldrb r3, [r2]
	cmp r3, #6
	addls pc, pc, r3, lsl #2
	b _023447E4
_02344628: @ jump table
	b _02344644 @ case 0
	b _02344684 @ case 1
	b _023446C4 @ case 2
	b _02344704 @ case 3
	b _0234472C @ case 4
	b _0234476C @ case 5
	b _023447A8 @ case 6
_02344644:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #2
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #2
	strbeq r1, [r2]
	beq _023447E4
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #4
	strbne r0, [r2]
	b _023447E4
_02344684:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #0
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #2
	moveq r0, #2
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #5
	strbne r0, [r2]
	b _023447E4
_023446C4:
	ldr r3, [r2, #4]
	mov ip, #2
	strb ip, [r3, #0x1c]
	cmp r0, #0
	strbeq r1, [r2]
	beq _023447E4
	cmp r0, #2
	moveq r0, #0
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #1
	moveq r0, #3
	strbeq r0, [r2]
	movne r0, #6
	strbne r0, [r2]
	b _023447E4
_02344704:
	ldr r3, [r2, #4]
	cmp r0, #1
	ldrb ip, [r3, #0x1c]
	add r3, ip, #4
	strbeq r3, [r2]
	beq _023447E4
	cmp r0, #3
	strbeq ip, [r2]
	movne r1, #0
	b _023447E4
_0234472C:
	ldr r3, [r2, #4]
	mov ip, #0
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #6
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #2
	moveq r0, #5
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #1
	strbeq ip, [r2]
	movne r0, #3
	strbne r0, [r2]
	b _023447E4
_0234476C:
	ldr r3, [r2, #4]
	cmp r0, #0
	strb r1, [r3, #0x1c]
	moveq r0, #4
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #2
	moveq r0, #6
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #1
	strbeq r1, [r2]
	movne r0, #3
	strbne r0, [r2]
	b _023447E4
_023447A8:
	ldr r3, [r2, #4]
	mov ip, #2
	cmp r0, #0
	strb ip, [r3, #0x1c]
	moveq r0, #5
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #2
	moveq r0, #4
	strbeq r0, [r2]
	beq _023447E4
	cmp r0, #1
	strbeq ip, [r2]
	movne r0, #3
	strbne r0, [r2]
_023447E4:
	cmp r1, #0
	popeq {r3, pc}
	mov r0, #8
	bl ov02_023480E0
	bl ov02_02344590
	pop {r3, pc}
	.align 2, 0
_023447FC: .4byte 0x0235AB0C
	arm_func_end ov02_0234460C

	arm_func_start ov02_02344800
ov02_02344800: @ 0x02344800
	push {r4, lr}
	ldr r0, _02344884 @ =0x0235AB0C
	mov r1, #0
	ldrb r2, [r0]
	ldr r0, [r0, #4]
	sub r4, r2, #4
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234D308
	mov r2, r0
	mov r0, #0
	mov r1, #0x32
	bl ov02_0234D618
	ldr r0, _02344884 @ =0x0235AB0C
	add r3, r4, #3
	ldr r2, [r0, #4]
	ldr r1, _02344888 @ =0x02352BFE
	lsl r3, r3, #2
	ldr r0, _0234488C @ =0x02352C00
	add ip, r2, r4, lsl #2
	ldrh r2, [r1, r3]
	ldrh r3, [r0, r3]
	ldr r0, [ip, #0x10]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _02344884 @ =0x0235AB0C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234D530
	pop {r4, pc}
	.align 2, 0
_02344884: .4byte 0x0235AB0C
_02344888: .4byte 0x02352BFE
_0234488C: .4byte 0x02352C00
	arm_func_end ov02_02344800

	arm_func_start ov02_02344890
ov02_02344890: @ 0x02344890
	push {r4, lr}
	ldr r0, _023449EC @ =0x0235AB0C
	ldrb r0, [r0]
	sub r4, r0, #4
	bl ov02_02349704
	cmp r0, #0
	beq _02344960
	cmp r0, #1
	popne {r4, pc}
	mov r0, #0xe
	bl ov02_023480E0
	mov r0, r4
	bl ov02_02347D2C
	ldr r0, _023449EC @ =0x0235AB0C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov02_0234D308
	mov r2, r0
	mov r0, #0
	mov r1, #0x56
	bl ov02_0234D618
	ldr r0, _023449EC @ =0x0235AB0C
	lsl ip, r4, #2
	ldr r0, [r0, #4]
	mvn r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	ldr r2, _023449F0 @ =0x02352BFE
	ldr r3, _023449F4 @ =0x02352C00
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	bl ov02_0234D440
	ldr r0, _023449EC @ =0x0235AB0C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #4]
	bl ov02_0234D530
	ldr r0, _023449EC @ =0x0235AB0C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234D288
	mov r1, #0
	ldr r0, _023449EC @ =0x0235AB0C
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	str r1, [r0, #0x10]
	b _023449DC
_02344960:
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _023449EC @ =0x0235AB0C
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234D308
	mov r2, r0
	mov r0, #0
	mov r1, #0x11
	bl ov02_0234D618
	ldr r0, _023449EC @ =0x0235AB0C
	add r1, r4, #3
	ldr r0, [r0, #4]
	lsl ip, r1, #2
	ldr r2, _023449F0 @ =0x02352BFE
	ldr r3, _023449F4 @ =0x02352C00
	add r0, r0, r4, lsl #2
	ldrh r2, [r2, ip]
	ldrh r3, [r3, ip]
	ldr r0, [r0, #0x10]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _023449EC @ =0x0235AB0C
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r2, #3
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x10]
	bl ov02_0234D530
_023449DC:
	bl ov02_023496C0
	ldr r0, _023449F8 @ =0x023449FC
	bl ov02_02338D68
	pop {r4, pc}
	.align 2, 0
_023449EC: .4byte 0x0235AB0C
_023449F0: .4byte 0x02352BFE
_023449F4: .4byte 0x02352C00
_023449F8: .4byte 0x023449FC
	arm_func_end ov02_02344890
_023449FC:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x44, 0x13, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x4F, 0xBF, 0xFF, 0xEB
	.byte 0x04, 0x00, 0x9F, 0xE5, 0xD3, 0xD0, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xEC, 0x40, 0x34, 0x02

	arm_func_start ov02_02344A20
ov02_02344A20: @ 0x02344A20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r1, _02344AE8 @ =0x02352BE0
	ldr r0, _02344AEC @ =0x0235AB0C
	ldrb r7, [r1]
	ldrb r6, [r1, #1]
	ldrb r5, [r1, #2]
	ldrb r4, [r1, #3]
	ldrb lr, [r1, #4]
	ldrb ip, [r1, #5]
	ldrb r3, [r1, #6]
	ldrb r2, [r1, #7]
	ldrb r1, [r0]
	strb r7, [sp, #4]
	strb r2, [sp, #3]
	strb r6, [sp, #5]
	strb r5, [sp, #6]
	strb r4, [sp, #7]
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	cmp r1, #3
	add r2, sp, #4
	addhi sp, sp, #8
	pophi {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r2, r1]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	mov r2, r1
	bl ov02_023468A0
	ldr r0, _02344AEC @ =0x0235AB0C
	ldrb r0, [r0]
	cmp r0, #3
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, pc}
	bl ov02_02347924
	ldr r1, _02344AEC @ =0x0235AB0C
	cmp r0, #2
	ldrb ip, [r1]
	ldr r1, [r1, #4]
	movgt r0, #3
	add r2, sp, #0
	ldrb r3, [r2, r0]
	add r0, r1, ip, lsl #2
	ldr r0, [r0, #4]
	mvn r1, #0
	mov r2, #0
	bl ov02_0234D3C0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02344AE8: .4byte 0x02352BE0
_02344AEC: .4byte 0x0235AB0C
	arm_func_end ov02_02344A20

	arm_func_start ov02_02344AF0
ov02_02344AF0: @ 0x02344AF0
	push {r4, r5, r6, lr}
	bl ov02_02347518
	ldr r1, _02344BF8 @ =0x0235AB14
	mov r2, #0
	strb r2, [r1, #2]
	ldrsb r2, [r1]
	mov r4, r0
	cmp r2, #0
	moveq r0, #1
	strbeq r0, [r1]
	bl ov02_02338DF0
	cmp r0, #0
	beq _02344B4C
	ldr r0, _02344BF8 @ =0x0235AB14
	ldrsb r1, [r0, #1]
	cmp r1, #2
	moveq r1, #0
	strbeq r1, [r0, #1]
	ldr r0, _02344BF8 @ =0x0235AB14
	ldrsb r1, [r0]
	cmp r1, #2
	moveq r1, #1
	strbeq r1, [r0]
_02344B4C:
	bl ov02_02344C14
	bl ov02_023352C4
	bl ov02_02338DF0
	mov r5, r0
	ldrb r1, [r4, #0xf4]
	mov r0, #0x32
	ldr r3, _02344BFC @ =0x02352CCC
	add r2, r1, #1
	ldrsb r1, [r3, r5]
	bl ov02_02334C3C
	mov r0, #1
	bl ov02_02334DE8
	mov r0, #1
	bl ov02_02338E18
	mov r6, r0
	mov r0, #1
	bl ov02_02338E18
	mov r5, r0
	mov r0, #1
	bl ov02_02338E18
	mov r4, r0
	mov r0, #1
	bl ov02_02338E18
	mov r3, r0
	ldr r1, _02344C00 @ =0x02352D14
	ldr r0, _02344BF8 @ =0x0235AB14
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _02344C04 @ =0x02352D18
	ldr r0, _02344C08 @ =0x02352D16
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	lsl r5, lr, #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _02344C0C @ =0x02352D1A
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov02_023350AC
	ldr r0, _02344C10 @ =ov02_02344D00
	bl ov02_02338D68
	pop {r4, r5, r6, pc}
	.align 2, 0
_02344BF8: .4byte 0x0235AB14
_02344BFC: .4byte 0x02352CCC
_02344C00: .4byte 0x02352D14
_02344C04: .4byte 0x02352D18
_02344C08: .4byte 0x02352D16
_02344C0C: .4byte 0x02352D1A
_02344C10: .4byte ov02_02344D00
	arm_func_end ov02_02344AF0

	arm_func_start ov02_02344C14
ov02_02344C14: @ 0x02344C14
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, _02344CD8 @ =0x02352C94
	add r3, sp, #0
	mov r2, #0xb
_02344C28:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02344C28
	ldr r0, _02344CDC @ =0x02353BF8
	ldr r1, _02344CE0 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02344CE4 @ =0x02353C10
	ldr r1, _02344CE8 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _02344CEC @ =0x02353C28
	ldr r1, _02344CF0 @ =FUN_020780D0
	bl ov02_02334DA8
	add r0, sp, #0
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _02344CF4 @ =0x0235AB14
	ldr r2, _02344CF8 @ =0x04001008
	str r0, [r1, #4]
	ldrh r0, [r2]
	ldr r1, _02344CFC @ =0x0400000A
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	add sp, sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02344CD8: .4byte 0x02352C94
_02344CDC: .4byte 0x02353BF8
_02344CE0: .4byte 0x02078310
_02344CE4: .4byte 0x02353C10
_02344CE8: .4byte FUN_02077CF8
_02344CEC: .4byte 0x02353C28
_02344CF0: .4byte FUN_020780D0
_02344CF4: .4byte 0x0235AB14
_02344CF8: .4byte 0x04001008
_02344CFC: .4byte 0x0400000A
	arm_func_end ov02_02344C14

	arm_func_start ov02_02344D00
ov02_02344D00: @ 0x02344D00
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _02344D50 @ =ov02_02344D54
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02344D50: .4byte ov02_02344D54
	arm_func_end ov02_02344D00

	arm_func_start ov02_02344D54
ov02_02344D54: @ 0x02344D54
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_02334E38
	ldr r0, _02344D8C @ =0x02344D90
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02344D8C: .4byte 0x02344D90
	arm_func_end ov02_02344D54
_02344D90:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x50, 0xBE, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0x69, 0xBE, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0xED, 0xCF, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xB8, 0x4D, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB
	.byte 0x62, 0x00, 0x00, 0xEB, 0x62, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02344DCC
ov02_02344DCC: @ 0x02344DCC
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r4, _02344F38 @ =0x02352CD4
	mov r7, r6
	mov r5, #1
_02344DE0:
	mov r0, r5
	bl ov02_02338E18
	add r0, r4, r0, lsl #5
	add r0, r0, r7
	bl ov02_0234ED04
	cmp r0, #0
	beq _02344E80
	mov r0, #1
	bl ov02_023346F0
	ldr r1, _02344F3C @ =0x0235AB14
	mov r0, #1
	strb r6, [r1, #1]
	bl ov02_02338E18
	mov r6, r0
	mov r0, #1
	bl ov02_02338E18
	mov r5, r0
	mov r0, #1
	bl ov02_02338E18
	mov r4, r0
	mov r0, #1
	bl ov02_02338E18
	mov r3, r0
	ldr r0, _02344F3C @ =0x0235AB14
	ldr r1, _02344F40 @ =0x02352D14
	ldrsb lr, [r0, #1]
	ldr r0, _02344F44 @ =0x02352D16
	add ip, r1, r6, lsl #5
	ldr r1, _02344F48 @ =0x02352D18
	add r2, r0, r4, lsl #5
	ldr r4, _02344F4C @ =0x02352D1A
	add r1, r1, r5, lsl #5
	lsl r5, lr, #3
	add r3, r4, r3, lsl #5
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldrh r3, [r5, r3]
	bl ov02_023350AC
	pop {r3, r4, r5, r6, r7, pc}
_02344E80:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #8
	blo _02344DE0
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02344EAC
	mov r0, #1
	bl ov02_023346F0
	pop {r3, r4, r5, r6, r7, pc}
_02344EAC:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02344EC8
	mov r0, #0
	bl ov02_023346F0
	pop {r3, r4, r5, r6, r7, pc}
_02344EC8:
	mov r0, #0x40
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02344EE4
	mov r0, #1
	bl ov02_0234515C
	pop {r3, r4, r5, r6, r7, pc}
_02344EE4:
	mov r0, #0x80
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02344F00
	mov r0, #3
	bl ov02_0234515C
	pop {r3, r4, r5, r6, r7, pc}
_02344F00:
	mov r0, #0x20
	bl ov02_0234EBFC
	cmp r0, #0
	beq _02344F1C
	mov r0, #0
	bl ov02_0234515C
	pop {r3, r4, r5, r6, r7, pc}
_02344F1C:
	mov r0, #0x10
	bl ov02_0234EBFC
	cmp r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, #2
	bl ov02_0234515C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02344F38: .4byte 0x02352CD4
_02344F3C: .4byte 0x0235AB14
_02344F40: .4byte 0x02352D14
_02344F44: .4byte 0x02352D16
_02344F48: .4byte 0x02352D18
_02344F4C: .4byte 0x02352D1A
	arm_func_end ov02_02344DCC

	arm_func_start ov02_02344F50
ov02_02344F50: @ 0x02344F50
	bx lr
	arm_func_end ov02_02344F50

	arm_func_start ov02_02344F54
ov02_02344F54: @ 0x02344F54
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _02344F70
	cmp r0, #1
	beq _02344F7C
	pop {r3, pc}
_02344F70:
	mov r0, #7
	bl ov02_023480E0
	b _02344F94
_02344F7C:
	mov r0, #6
	bl ov02_023480E0
	bl ov02_02345250
	ldr r0, _02344FA0 @ =0x0235AB14
	mov r1, #1
	strb r1, [r0, #2]
_02344F94:
	ldr r0, _02344FA4 @ =0x02344FA8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02344FA0: .4byte 0x0235AB14
_02344FA4: .4byte 0x02344FA8
	arm_func_end ov02_02344F54
_02344FA8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xED, 0xBD, 0xFF, 0xEB
	.byte 0x08, 0x00, 0xA0, 0xE3, 0xC9, 0x22, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x69, 0xCF, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xC8, 0x4F, 0x34, 0x02

	arm_func_start ov02_02344FC8
ov02_02344FC8: @ 0x02344FC8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02345024 @ =0x0235AB14
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _02344FF0
	bl ov02_023346AC
_02344FF0:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02345028 @ =ov02_0234502C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345024: .4byte 0x0235AB14
_02345028: .4byte ov02_0234502C
	arm_func_end ov02_02344FC8

	arm_func_start ov02_0234502C
ov02_0234502C: @ 0x0234502C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_0233519C
	bl ov02_02334D10
	ldr r0, _02345144 @ =0x0235AB14
	ldr r0, [r0, #4]
	bl ov02_0234CF78
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	ldr r0, _02345144 @ =0x0235AB14
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _023450B0
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	ldr r0, _02345148 @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
_023450B0:
	ldrsb r0, [r0, #1]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_023450C0: @ jump table
	b _023450D0 @ case 0
	b _023450E8 @ case 1
	b _02345100 @ case 2
	b _02345118 @ case 3
_023450D0:
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0234514C @ =ov02_023438CC
	bl ov02_02338D68
	pop {r3, pc}
_023450E8:
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02345150 @ =ov02_0233C75C
	bl ov02_02338D68
	pop {r3, pc}
_02345100:
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02345154 @ =ov02_02343458
	bl ov02_02338D68
	pop {r3, pc}
_02345118:
	mov r0, #2
	mov r1, #0
	bl ov02_02338D78
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	mov r0, #1
	bl ov02_02342798
	ldr r0, _02345158 @ =ov02_023402CC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345144: .4byte 0x0235AB14
_02345148: .4byte ov02_02343DB0
_0234514C: .4byte ov02_023438CC
_02345150: .4byte ov02_0233C75C
_02345154: .4byte ov02_02343458
_02345158: .4byte ov02_023402CC
	arm_func_end ov02_0234502C

	arm_func_start ov02_0234515C
ov02_0234515C: @ 0x0234515C
	push {r4, r5, r6, lr}
	ldr r1, _02345238 @ =0x0235AB14
	mov r5, r0
	mov r0, #1
	ldrsb r4, [r1, #1]
	bl ov02_02338E18
	ldr r2, _0234523C @ =0x02352CAA
	mvn r1, #0
	add r0, r2, r0, lsl #4
	add r0, r0, r4, lsl #2
	ldrsb r2, [r5, r0]
	cmp r2, r1
	popeq {r4, r5, r6, pc}
	cmp r2, #0
	ldreq r0, _02345238 @ =0x0235AB14
	strbeq r4, [r0]
	mvn r0, #1
	cmp r2, r0
	ldrne r0, _02345238 @ =0x0235AB14
	strbne r2, [r0, #1]
	bne _023451BC
	ldr r0, _02345238 @ =0x0235AB14
	ldrsb r1, [r0]
	strb r1, [r0, #1]
_023451BC:
	mov r0, #8
	bl ov02_023480E0
	mov r0, #1
	bl ov02_02338E18
	mov r6, r0
	mov r0, #1
	bl ov02_02338E18
	mov r5, r0
	mov r0, #1
	bl ov02_02338E18
	mov r4, r0
	mov r0, #1
	bl ov02_02338E18
	mov r3, r0
	ldr r1, _02345240 @ =0x02352D14
	ldr r0, _02345238 @ =0x0235AB14
	add ip, r1, r6, lsl #5
	ldrsb lr, [r0, #1]
	ldr r1, _02345244 @ =0x02352D18
	ldr r0, _02345248 @ =0x02352D16
	add r1, r1, r5, lsl #5
	add r2, r0, r4, lsl #5
	lsl r5, lr, #3
	ldrh r0, [r5, ip]
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	ldr r4, _0234524C @ =0x02352D1A
	add r3, r4, r3, lsl #5
	ldrh r3, [r5, r3]
	bl ov02_023350AC
	pop {r4, r5, r6, pc}
	.align 2, 0
_02345238: .4byte 0x0235AB14
_0234523C: .4byte 0x02352CAA
_02345240: .4byte 0x02352D14
_02345244: .4byte 0x02352D18
_02345248: .4byte 0x02352D16
_0234524C: .4byte 0x02352D1A
	arm_func_end ov02_0234515C

	arm_func_start ov02_02345250
ov02_02345250: @ 0x02345250
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _023452A0 @ =0x02352C90
	ldr r0, _023452A4 @ =0x0235AB14
	ldrb lr, [r1]
	ldrb ip, [r1, #1]
	ldrb r3, [r1, #2]
	ldrb r2, [r1, #3]
	ldrsb r1, [r0, #1]
	add r4, sp, #0
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	strb r2, [sp, #3]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov02_023468A0
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_023452A0: .4byte 0x02352C90
_023452A4: .4byte 0x0235AB14
	arm_func_end ov02_02345250

	arm_func_start ov02_023452A8
ov02_023452A8: @ 0x023452A8
	push {r3, lr}
	ldr r0, _0234532C @ =0x0235AB1C
	mov r1, #0
	strb r1, [r0]
	bl ov02_02345334
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	bne _023452E4
	mov r0, #0x31
	sub r1, r0, #0x32
	mov r2, #0
	bl ov02_02334C3C
_023452E4:
	mov r0, #2
	bl ov02_02334DE8
	ldr r0, [sp]
	cmp r0, #0
	bne _023452FC
	bl ov02_023352C4
_023452FC:
	mov r0, #0x2c
	bl ov02_02334E70
	mov r0, #0
	bl ov02_023343DC
	bl ov02_023453DC
	mov r0, #0
	bl ov02_02335334
	mov r0, #0xc
	bl ov02_023480E0
	ldr r0, _02345330 @ =ov02_0234547C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234532C: .4byte 0x0235AB1C
_02345330: .4byte ov02_0234547C
	arm_func_end ov02_023452A8

	arm_func_start ov02_02345334
ov02_02345334: @ 0x02345334
	push {r3, lr}
	ldr r0, _023453BC @ =0x02353C3C
	ldr r1, _023453C0 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _023453C4 @ =0x02353C54
	ldr r1, _023453C8 @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _023453CC @ =0x02353C6C
	ldr r1, _023453D0 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _023453D4 @ =0x04001008
	ldr r1, _023453D8 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_023453BC: .4byte 0x02353C3C
_023453C0: .4byte 0x02078310
_023453C4: .4byte 0x02353C54
_023453C8: .4byte FUN_02077CF8
_023453CC: .4byte 0x02353C6C
_023453D0: .4byte FUN_020780D0
_023453D4: .4byte 0x04001008
_023453D8: .4byte 0x0400000A
	arm_func_end ov02_02345334

	arm_func_start ov02_023453DC
ov02_023453DC: @ 0x023453DC
	push {r4, lr}
	sub sp, sp, #0x10
	bl ov02_02347518
	mov r4, r0
	ldr r0, _02345470 @ =0x02352D54
	add r1, sp, #4
	mov r2, #0xc
	bl FUN_0207C330
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #2
	moveq r0, #4
	strbeq r0, [sp, #0xe]
	ldrbne r0, [r4, #0xf4]
	addne r0, r0, #1
	strbne r0, [sp, #0xe]
	add r0, sp, #4
	bl FUN_022D75EC
	ldr r1, _02345474 @ =0x0235AB1C
	cmp r0, #0
	str r0, [r1, #4]
	beq _02345454
	ldr r0, [sp]
	cmp r0, #0
	bne _02345454
	ldrb r0, [r4, #0xf4]
	mov r1, r4
	bl FUN_022D7AB0
_02345454:
	mov r0, #0
	ldr r1, _02345478 @ =ov02_0234562C
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	add sp, sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02345470: .4byte 0x02352D54
_02345474: .4byte 0x0235AB1C
_02345478: .4byte ov02_0234562C
	arm_func_end ov02_023453DC

	arm_func_start ov02_0234547C
ov02_0234547C: @ 0x0234547C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	bne _023454D8
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
_023454D8:
	ldr r0, _023454E4 @ =ov02_023454E8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023454E4: .4byte ov02_023454E8
	arm_func_end ov02_0234547C

	arm_func_start ov02_023454E8
ov02_023454E8: @ 0x023454E8
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02345518 @ =0x0234551C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345518: .4byte 0x0234551C
	arm_func_end ov02_023454E8
_0234551C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x02, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02345530
ov02_02345530: @ 0x02345530
	bx lr
	arm_func_end ov02_02345530

	arm_func_start ov02_02345534
ov02_02345534: @ 0x02345534
	bx lr
	arm_func_end ov02_02345534

	arm_func_start ov02_02345538
ov02_02345538: @ 0x02345538
	bx lr
	arm_func_end ov02_02345538

	arm_func_start ov02_0234553C
ov02_0234553C: @ 0x0234553C
	push {r3, lr}
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02345560 @ =0x02345564
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345560: .4byte 0x02345564
	arm_func_end ov02_0234553C
_02345564:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0xD2, 0x20, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0xF9, 0xCD, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x88, 0x55, 0x34, 0x02

	arm_func_start ov02_02345588
ov02_02345588: @ 0x02345588
	push {r4, lr}
	bl ov02_02347D1C
	ldr r1, _02345620 @ =0x0235AB1C
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023455B0
	bl FUN_022D7958
	cmp r0, #0
	popeq {r4, pc}
_023455B0:
	bl FUN_022EE00C
	add r1, r4, #0xf0
	mov r2, #0xe
	bl FUN_0207C4C8
	bl FUN_022EE00C
	add r1, r4, #0x1f0
	mov r2, #0xe
	bl FUN_0207C4C8
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _02345620 @ =0x0235AB1C
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #0
	bne _02345610
	bl ov02_02338D78
	ldr r0, _02345624 @ =0x0233FC90
	bl ov02_02338D68
	pop {r4, pc}
_02345610:
	bl ov02_02338D78
	ldr r0, _02345628 @ =ov02_023456F4
	bl ov02_02338D68
	pop {r4, pc}
	.align 2, 0
_02345620: .4byte 0x0235AB1C
_02345624: .4byte 0x0233FC90
_02345628: .4byte ov02_023456F4
	arm_func_end ov02_02345588

	arm_func_start ov02_0234562C
ov02_0234562C: @ 0x0234562C
	push {r3, r4, r5, lr}
	ldr r1, _023456C4 @ =0x0235AB1C
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02345650
	bl FUN_022D7794
	movs r5, r0
	popeq {r3, r4, r5, pc}
_02345650:
	bl ov02_023353EC
	bl ov02_02348148
	ldr r1, _023456C4 @ =0x0235AB1C
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02345684
	cmp r5, #0
	ble _02345684
	mov r2, #1
	mov r0, #0x11
	strb r2, [r1]
	bl ov02_023480E0
	b _023456AC
_02345684:
	cmp r0, #0
	ldreq r0, _023456C8 @ =0xFFFF3BE9
	beq _02345694
	bl FUN_022D7864
_02345694:
	mvn r1, #9
	cmp r0, r1
	ldrge r0, _023456C8 @ =0xFFFF3BE9
	bl ov02_023402BC
	mov r0, #0x12
	bl ov02_023480E0
_023456AC:
	ldr r0, _023456CC @ =ov02_0234553C
	bl ov02_02338D68
	mov r1, r4
	mov r0, #0
	bl ov02_0234FB40
	pop {r3, r4, r5, pc}
	.align 2, 0
_023456C4: .4byte 0x0235AB1C
_023456C8: .4byte 0xFFFF3BE9
_023456CC: .4byte ov02_0234553C
	arm_func_end ov02_0234562C
_023456D0:
	.byte 0x08, 0xC0, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE1, 0x20, 0x10, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xB4, 0xE7, 0x34, 0x02, 0x04, 0xC0, 0x9F, 0xE5, 0x01, 0x00, 0xA0, 0xE1, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x1C, 0xE8, 0x34, 0x02

	arm_func_start ov02_023456F4
ov02_023456F4: @ 0x023456F4
	push {r3, lr}
	ldr r0, _0234571C @ =0x0235AB24
	mov r1, #0
	strb r1, [r0]
	bl ov02_02345724
	mov r0, #0x2d
	bl ov02_02334E70
	ldr r0, _02345720 @ =ov02_02345790
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234571C: .4byte 0x0235AB24
_02345720: .4byte ov02_02345790
	arm_func_end ov02_023456F4

	arm_func_start ov02_02345724
ov02_02345724: @ 0x02345724
	push {r3, lr}
	ldr r0, _02345780 @ =0x02353C80
	ldr r1, _02345784 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r2, _02345788 @ =0x04001008
	ldr r1, _0234578C @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02345780: .4byte 0x02353C80
_02345784: .4byte FUN_020780D0
_02345788: .4byte 0x04001008
_0234578C: .4byte 0x0400000A
	arm_func_end ov02_02345724

	arm_func_start ov02_02345790
ov02_02345790: @ 0x02345790
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _023457C0 @ =0x023457C4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023457C0: .4byte 0x023457C4
	arm_func_end ov02_02345790
_023457C4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0x3A, 0x20, 0x00, 0xEB
	.byte 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x61, 0xCD, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0xE8, 0x57, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x41, 0x00, 0x00, 0xEB
	.byte 0x00, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_023457F8
ov02_023457F8: @ 0x023457F8
	bx lr
	arm_func_end ov02_023457F8

	arm_func_start ov02_023457FC
ov02_023457FC: @ 0x023457FC
	push {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	beq _0234581C
	bl ov02_023486C8
_0234581C:
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02345850 @ =ov02_02345854
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345850: .4byte ov02_02345854
	arm_func_end ov02_023457FC

	arm_func_start ov02_02345854
ov02_02345854: @ 0x02345854
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02348BF0
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	ldr r0, [sp]
	cmp r0, #0
	bne _023458E4
	mov r0, #0
	mov r1, r0
	bl ov02_02338DB4
	ldr r0, _023458F0 @ =ov02_023402CC
	bl ov02_02338D68
	pop {r3, pc}
_023458E4:
	ldr r0, _023458F4 @ =ov02_023398CC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023458F0: .4byte ov02_023402CC
_023458F4: .4byte ov02_023398CC
	arm_func_end ov02_02345854

	arm_func_start ov02_023458F8
ov02_023458F8: @ 0x023458F8
	push {r3, lr}
	ldr r0, _0234595C @ =0x0235AB24
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0xb4
	poplo {r3, pc}
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	bl ov02_02338E00
	cmp r0, #0
	beq _02345950
	cmp r0, #1
	bne _02345950
	ldr r0, [sp]
	cmp r0, #0
	beq _02345950
	ldr r0, _02345960 @ =ov02_0233958C
	bl ov02_02338D68
	pop {r3, pc}
_02345950:
	ldr r0, _02345964 @ =ov02_023457FC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234595C: .4byte 0x0235AB24
_02345960: .4byte ov02_0233958C
_02345964: .4byte ov02_023457FC
	arm_func_end ov02_023458F8

	arm_func_start ov02_02345968
ov02_02345968: @ 0x02345968
	push {r3, lr}
	bl ov02_0234705C
	add r1, sp, #0
	mov r0, #0
	bl ov02_02338DC8
	bl ov02_023459C0
	mov r0, #0x31
	sub r1, r0, #0x32
	mov r2, #0
	bl ov02_02334C3C
	ldr r0, [sp]
	cmp r0, #2
	beq _023459A0
	bl ov02_023352C4
_023459A0:
	ldr r0, [sp]
	cmp r0, #1
	bne _023459B0
	bl ov02_02347A1C
_023459B0:
	ldr r0, _023459BC @ =ov02_02345A2C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023459BC: .4byte ov02_02345A2C
	arm_func_end ov02_02345968

	arm_func_start ov02_023459C0
ov02_023459C0: @ 0x023459C0
	push {r3, lr}
	ldr r0, _02345A1C @ =0x02353C94
	ldr r1, _02345A20 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r2, _02345A24 @ =0x04001008
	ldr r1, _02345A28 @ =0x0400000A
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r2, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2, #2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02345A1C: .4byte 0x02353C94
_02345A20: .4byte FUN_020780D0
_02345A24: .4byte 0x04001008
_02345A28: .4byte 0x0400000A
	arm_func_end ov02_023459C0

	arm_func_start ov02_02345A2C
ov02_02345A2C: @ 0x02345A2C
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E3D0
	ldr r0, _02345A7C @ =ov02_02345A80
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345A7C: .4byte ov02_02345A80
	arm_func_end ov02_02345A2C

	arm_func_start ov02_02345A80
ov02_02345A80: @ 0x02345A80
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	ldr r0, _02345B00 @ =0x02352D60
	add r3, sp, #8
	ldm r0, {r0, r1, r2}
	stm r3, {r0, r1, r2}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	addne sp, sp, #0x14
	ldmne sp!, {pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	addne sp, sp, #0x14
	ldmne sp!, {pc}
	add r1, sp, #4
	mov r0, #0
	bl ov02_02338DC8
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r3, [sp, #4]
	add r0, sp, #8
	ldr r0, [r0, r3, lsl #2]
	mov r2, r1
	sub r3, r1, #2
	bl ov02_02349394
	ldr r0, _02345B04 @ =ov02_02345B08
	bl ov02_02338D68
	add sp, sp, #0x14
	ldm sp!, {pc}
	.align 2, 0
_02345B00: .4byte 0x02352D60
_02345B04: .4byte ov02_02345B08
	arm_func_end ov02_02345A80

	arm_func_start ov02_02345B08
ov02_02345B08: @ 0x02345B08
	push {r3, lr}
	bl ov02_02345B44
	bl ov02_02345B48
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _02345B40 @ =ov02_02345B4C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345B40: .4byte ov02_02345B4C
	arm_func_end ov02_02345B08

	arm_func_start ov02_02345B44
ov02_02345B44: @ 0x02345B44
	bx lr
	arm_func_end ov02_02345B44

	arm_func_start ov02_02345B48
ov02_02345B48: @ 0x02345B48
	bx lr
	arm_func_end ov02_02345B48

	arm_func_start ov02_02345B4C
ov02_02345B4C: @ 0x02345B4C
	push {r3, lr}
	bl ov02_02349718
	cmp r0, #0
	popne {r3, pc}
	mov r0, #3
	mov r1, #0
	mov r2, #0x14
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02345B7C @ =ov02_02345B80
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345B7C: .4byte ov02_02345B80
	arm_func_end ov02_02345B4C

	arm_func_start ov02_02345B80
ov02_02345B80: @ 0x02345B80
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	mov r1, #0x14
	bl ov02_0234E424
	mov r0, #0
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02345BB8 @ =ov02_023452A8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345BB8: .4byte ov02_023452A8
	arm_func_end ov02_02345B80

	arm_func_start ov02_02345BBC
ov02_02345BBC: @ 0x02345BBC
	push {r3, lr}
	ldr r0, _02345BF4 @ =0x0235AB28
	mov r1, #0
	strb r1, [r0]
	bl ov02_02345BFC
	mov r0, #8
	bl ov02_02335268
	mov r0, #0x29
	bl ov02_02334E70
	mov r0, #0x10
	bl ov02_023480E0
	ldr r0, _02345BF8 @ =ov02_02345C7C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345BF4: .4byte 0x0235AB28
_02345BF8: .4byte ov02_02345C7C
	arm_func_end ov02_02345BBC

	arm_func_start ov02_02345BFC
ov02_02345BFC: @ 0x02345BFC
	push {r3, lr}
	ldr r0, _02345C6C @ =0x02353CA8
	ldr r1, _02345C70 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02345C74 @ =0x04001008
	ldr r1, _02345C78 @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02345C6C: .4byte 0x02353CA8
_02345C70: .4byte FUN_020780D0
_02345C74: .4byte 0x04001008
_02345C78: .4byte 0x0400000A
	arm_func_end ov02_02345BFC

	arm_func_start ov02_02345C7C
ov02_02345C7C: @ 0x02345C7C
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02345CAC @ =0x02345CB0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345CAC: .4byte 0x02345CB0
	arm_func_end ov02_02345C7C
_02345CB0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x00, 0xA0, 0xE3, 0xFF, 0x1E, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3
	.byte 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5, 0x26, 0xCC, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xD4, 0x5C, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x2D, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02345CE4
ov02_02345CE4: @ 0x02345CE4
	bx lr
	arm_func_end ov02_02345CE4

	arm_func_start ov02_02345CE8
ov02_02345CE8: @ 0x02345CE8
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02345D20 @ =ov02_02345D24
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345D20: .4byte ov02_02345D24
	arm_func_end ov02_02345CE8

	arm_func_start ov02_02345D24
ov02_02345D24: @ 0x02345D24
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	mov r0, #0
	mov r1, #2
	bl ov02_02338DB4
	ldr r0, _02345D90 @ =ov02_02345968
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345D90: .4byte ov02_02345968
	arm_func_end ov02_02345D24

	arm_func_start ov02_02345D94
ov02_02345D94: @ 0x02345D94
	push {r3, lr}
	ldr r0, _02345DC0 @ =0x0235AB28
	ldrb r1, [r0]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0]
	cmp r1, #0x78
	poplo {r3, pc}
	ldr r0, _02345DC4 @ =ov02_02345CE8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345DC0: .4byte 0x0235AB28
_02345DC4: .4byte ov02_02345CE8
	arm_func_end ov02_02345D94

	arm_func_start ov02_02345DC8
ov02_02345DC8: @ 0x02345DC8
	push {r3, lr}
	ldr r0, _02345E10 @ =0x0235AB2C
	mov r1, #0
	strb r1, [r0]
	bl ov02_02345E18
	mov r0, #8
	bl ov02_02335268
	mov r0, #0x38
	sub r1, r0, #0x39
	mov r2, #0
	bl ov02_02334C3C
	mov r0, #1
	bl ov02_02334DE8
	mov r0, #0x27
	bl ov02_02334E70
	ldr r0, _02345E14 @ =ov02_02345EC0
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345E10: .4byte 0x0235AB2C
_02345E14: .4byte ov02_02345EC0
	arm_func_end ov02_02345DC8

	arm_func_start ov02_02345E18
ov02_02345E18: @ 0x02345E18
	push {r3, lr}
	ldr r0, _02345EA0 @ =0x02353CBC
	ldr r1, _02345EA4 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02345EA8 @ =0x02353CD4
	ldr r1, _02345EAC @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _02345EB0 @ =0x02353CEC
	ldr r1, _02345EB4 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _02345EB8 @ =0x04001008
	ldr r1, _02345EBC @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02345EA0: .4byte 0x02353CBC
_02345EA4: .4byte 0x02078310
_02345EA8: .4byte 0x02353CD4
_02345EAC: .4byte FUN_02077CF8
_02345EB0: .4byte 0x02353CEC
_02345EB4: .4byte FUN_020780D0
_02345EB8: .4byte 0x04001008
_02345EBC: .4byte 0x0400000A
	arm_func_end ov02_02345E18

	arm_func_start ov02_02345EC0
ov02_02345EC0: @ 0x02345EC0
	push {r3, lr}
	mov r1, #1
	mov r2, r1
	mov r0, #2
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #1
	mov r1, r0
	bl ov02_0234E3D0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _02345F10 @ =ov02_02345F14
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345F10: .4byte ov02_02345F14
	arm_func_end ov02_02345EC0

	arm_func_start ov02_02345F14
ov02_02345F14: @ 0x02345F14
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_02334E38
	ldr r0, _02345F4C @ =0x02345F50
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02345F4C: .4byte 0x02345F50
	arm_func_end ov02_02345F14
_02345F50:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xE0, 0xB9, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0xF9, 0xB9, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x7D, 0xCB, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x78, 0x5F, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_02345F8C
ov02_02345F8C: @ 0x02345F8C
	push {r3, lr}
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02345FA8
	mov r0, #1
	bl ov02_023346F0
_02345FA8:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_02345F8C

	arm_func_start ov02_02345FC4
ov02_02345FC4: @ 0x02345FC4
	bx lr
	arm_func_end ov02_02345FC4

	arm_func_start ov02_02345FC8
ov02_02345FC8: @ 0x02345FC8
	push {r3, lr}
	bl ov02_023346DC
	cmp r0, #0
	beq _02345FE4
	cmp r0, #1
	beq _02345FF0
	pop {r3, pc}
_02345FE4:
	mov r0, #7
	bl ov02_023480E0
	b _02346004
_02345FF0:
	mov r0, #6
	bl ov02_023480E0
	ldr r0, _02346010 @ =0x0235AB2C
	mov r1, #1
	strb r1, [r0]
_02346004:
	ldr r0, _02346014 @ =0x02346018
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346010: .4byte 0x0235AB2C
_02346014: .4byte 0x02346018
	arm_func_end ov02_02345FC8
_02346018:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xD1, 0xB9, 0xFF, 0xEB
	.byte 0x08, 0x00, 0xA0, 0xE3, 0xAD, 0x1E, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x4D, 0xCB, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x38, 0x60, 0x34, 0x02

	arm_func_start ov02_02346038
ov02_02346038: @ 0x02346038
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _02346094 @ =0x0235AB2C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02346074
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_02346074:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _02346098 @ =ov02_0234609C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346094: .4byte 0x0235AB2C
_02346098: .4byte ov02_0234609C
	arm_func_end ov02_02346038

	arm_func_start ov02_0234609C
ov02_0234609C: @ 0x0234609C
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02346148 @ =0x0235AB2C
	ldrb r0, [r0]
	cmp r0, #0
	bne _023460D0
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_023460D0:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _02346148 @ =0x0235AB2C
	ldrb r0, [r0]
	cmp r0, #0
	bne _02346104
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_02346104:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _02346148 @ =0x0235AB2C
	mov r1, #1
	ldrb r0, [r0]
	cmp r0, #0
	mov r0, #2
	bne _02346138
	bl ov02_02338D78
	ldr r0, _0234614C @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
_02346138:
	bl ov02_02338D78
	ldr r0, _02346150 @ =ov02_02346174
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346148: .4byte 0x0235AB2C
_0234614C: .4byte ov02_02343DB0
_02346150: .4byte ov02_02346174
	arm_func_end ov02_0234609C

	arm_func_start ov02_02346154
ov02_02346154: @ 0x02346154
	ldr r0, _02346170 @ =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02346170: .4byte 0x027FFFA8
	arm_func_end ov02_02346154

	arm_func_start ov02_02346174
ov02_02346174: @ 0x02346174
	stmdb sp!, {lr}
	sub sp, sp, #0x6c
	ldr r0, _023461FC @ =0x0235AB30
	mov r1, #0
	strb r1, [r0]
	bl ov02_02346208
	mov r0, #8
	bl ov02_02335268
	mov r0, #2
	bl ov02_02334DE8
	add r0, sp, #0x16
	bl FUN_0207BA08
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x16
	bl FUN_0207C2B8
	ldrh r2, [sp, #0x30]
	add r0, sp, #0x1a
	add r1, sp, #0
	lsl r2, r2, #1
	bl FUN_0207C2E0
	add r0, sp, #0
	mov r1, #0x28
	bl ov02_02334EE4
	mov r0, #0
	bl ov02_023343DC
	ldr r0, _02346200 @ =0x02346554
	bl ov02_02348CB0
	mov r0, #0xb
	bl ov02_023480E0
	ldr r0, _02346204 @ =ov02_023462B0
	bl ov02_02338D68
	add sp, sp, #0x6c
	ldm sp!, {pc}
	.align 2, 0
_023461FC: .4byte 0x0235AB30
_02346200: .4byte 0x02346554
_02346204: .4byte ov02_023462B0
	arm_func_end ov02_02346174

	arm_func_start ov02_02346208
ov02_02346208: @ 0x02346208
	push {r3, lr}
	ldr r0, _02346290 @ =0x02353D00
	ldr r1, _02346294 @ =0x02078310
	bl ov02_02334DA8
	ldr r0, _02346298 @ =0x02353D18
	ldr r1, _0234629C @ =FUN_02077CF8
	bl ov02_02334DA8
	ldr r0, _023462A0 @ =0x02353D30
	ldr r1, _023462A4 @ =FUN_020780D0
	bl ov02_02334DA8
	ldr r3, _023462A8 @ =0x04001008
	ldr r1, _023462AC @ =0x0400000A
	ldrh r0, [r3]
	sub r2, r3, #0x1000
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3]
	ldrh r0, [r3, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r3, #2]
	ldrh r0, [r2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r2]
	ldrh r0, [r1]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1]
	ldrh r0, [r1, #2]
	bic r0, r0, #3
	orr r0, r0, #3
	strh r0, [r1, #2]
	pop {r3, pc}
	.align 2, 0
_02346290: .4byte 0x02353D00
_02346294: .4byte 0x02078310
_02346298: .4byte 0x02353D18
_0234629C: .4byte FUN_02077CF8
_023462A0: .4byte 0x02353D30
_023462A4: .4byte FUN_020780D0
_023462A8: .4byte 0x04001008
_023462AC: .4byte 0x0400000A
	arm_func_end ov02_02346208

	arm_func_start ov02_023462B0
ov02_023462B0: @ 0x023462B0
	push {r3, lr}
	mov r0, #2
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E3D0
	ldr r0, _023462E0 @ =ov02_023462E4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023462E0: .4byte ov02_023462E4
	arm_func_end ov02_023462B0

	arm_func_start ov02_023462E4
ov02_023462E4: @ 0x023462E4
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	mov r0, #2
	bl ov02_02334E38
	ldr r0, _0234630C @ =0x02346310
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_0234630C: .4byte 0x02346310
	arm_func_end ov02_023462E4
_02346310:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xF0, 0xB8, 0xFF, 0xEB, 0x01, 0x10, 0xE0, 0xE3, 0x01, 0x00, 0x50, 0xE1
	.byte 0x08, 0x80, 0xBD, 0x08, 0x09, 0xB9, 0xFF, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x8D, 0xCA, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x38, 0x63, 0x34, 0x02, 0x08, 0x40, 0x2D, 0xE9, 0x02, 0x00, 0x00, 0xEB
	.byte 0x0F, 0x00, 0x00, 0xEB, 0x0F, 0x00, 0x00, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0234634C
ov02_0234634C: @ 0x0234634C
	push {r3, lr}
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0234636C
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
_0234636C:
	bl ov02_02346154
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0
	bl ov02_023346F0
	pop {r3, pc}
	arm_func_end ov02_0234634C

	arm_func_start ov02_02346384
ov02_02346384: @ 0x02346384
	bx lr
	arm_func_end ov02_02346384

	arm_func_start ov02_02346388
ov02_02346388: @ 0x02346388
	push {r3, lr}
	ldr r0, _023463CC @ =0x0235AB30
	ldrb r0, [r0]
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346DC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _023463CC @ =0x0235AB30
	mov r1, #2
	strb r1, [r0]
	bl ov02_02348148
	mov r0, #7
	bl ov02_023480E0
	ldr r0, _023463D0 @ =0x023463D4
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023463CC: .4byte 0x0235AB30
_023463D0: .4byte 0x023463D4
	arm_func_end ov02_02346388
_023463D4:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xE2, 0xB8, 0xFF, 0xEB, 0x08, 0x00, 0xA0, 0xE3
	.byte 0xBE, 0x1D, 0x00, 0xEB, 0x04, 0x00, 0x9F, 0xE5, 0x5E, 0xCA, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0xF4, 0x63, 0x34, 0x02

	arm_func_start ov02_023463F4
ov02_023463F4: @ 0x023463F4
	push {r3, lr}
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_023346AC
	ldr r0, _02346458 @ =0x0235AB30
	ldrb r0, [r0]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _02346438
	mov r1, #1
	mov r2, r1
	mov r0, #3
	mov r3, #8
	bl ov02_0234D8E0
_02346438:
	mov r0, #3
	mov r1, #0
	mov r2, #0x15
	mov r3, #8
	bl ov02_0234D8E0
	ldr r0, _0234645C @ =ov02_02346460
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346458: .4byte 0x0235AB30
_0234645C: .4byte ov02_02346460
	arm_func_end ov02_023463F4

	arm_func_start ov02_02346460
ov02_02346460: @ 0x02346460
	push {r3, lr}
	mov r0, #0
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02346544 @ =0x0235AB30
	ldrb r0, [r0]
	cmp r0, #2
	bne _02346494
	mov r0, #1
	bl ov02_0234D8BC
	cmp r0, #0
	popne {r3, pc}
_02346494:
	bl ov02_02334724
	cmp r0, #0
	popeq {r3, pc}
	bl ov02_02348E68
	bl ov02_023344AC
	mov r0, #0
	bl ov02_0234E02C
	ldr r0, _02346544 @ =0x0235AB30
	ldrb r0, [r0]
	add r0, r0, #0xfe
	and r0, r0, #0xff
	cmp r0, #1
	bhi _023464D8
	bl ov02_02334D10
	mov r0, #1
	mov r1, r0
	bl ov02_0234E424
_023464D8:
	mov r0, #0
	mov r1, #0x15
	bl ov02_0234E424
	ldr r0, _02346544 @ =0x0235AB30
	ldrb r0, [r0]
	cmp r0, #2
	bne _0234650C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _02346548 @ =ov02_02343DB0
	bl ov02_02338D68
	pop {r3, pc}
_0234650C:
	cmp r0, #3
	bne _0234652C
	mov r0, #2
	mov r1, #1
	bl ov02_02338D78
	ldr r0, _0234654C @ =ov02_02345DC8
	bl ov02_02338D68
	pop {r3, pc}
_0234652C:
	mov r0, #0
	mov r1, r0
	bl ov02_02338D78
	ldr r0, _02346550 @ =ov02_02345BBC
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346544: .4byte 0x0235AB30
_02346548: .4byte ov02_02343DB0
_0234654C: .4byte ov02_02345DC8
_02346550: .4byte ov02_02345BBC
	arm_func_end ov02_02346460
_02346554:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xD0, 0x10, 0x9F, 0xE5, 0x00, 0x20, 0xD1, 0xE5
	.byte 0x00, 0x00, 0x52, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x03, 0x00, 0x50, 0xE3, 0x00, 0xF1, 0x8F, 0x90
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x02, 0x00, 0x00, 0xEA, 0x11, 0x00, 0x00, 0xEA, 0x16, 0x00, 0x00, 0xEA
	.byte 0x22, 0x00, 0x00, 0xEA, 0x03, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0xC1, 0xE5, 0xED, 0x06, 0x00, 0xEB
	.byte 0x12, 0x00, 0xA0, 0xE3, 0xD1, 0x06, 0x00, 0xEB, 0x01, 0x10, 0xA0, 0xE3, 0x00, 0xC0, 0xA0, 0xE3
	.byte 0x01, 0x20, 0xA0, 0xE1, 0x02, 0x30, 0x41, 0xE2, 0x10, 0x00, 0xA0, 0xE3, 0x00, 0xC0, 0x8D, 0xE5
	.byte 0x77, 0x0B, 0x00, 0xEB, 0x6B, 0xB8, 0xFF, 0xEB, 0x74, 0x00, 0x9F, 0xE5, 0xE9, 0xC9, 0xFF, 0xEB
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x01, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0xC1, 0xE5, 0xDD, 0x06, 0x00, 0xEB
	.byte 0x60, 0x00, 0x9F, 0xE5, 0xE3, 0xC9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xD9, 0x06, 0x00, 0xEB
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x58, 0x0A, 0x00, 0xEB, 0x01, 0x20, 0xA0, 0xE3, 0x00, 0x10, 0xA0, 0xE3
	.byte 0x02, 0x30, 0x42, 0xE2, 0x11, 0x00, 0xA0, 0xE3, 0x00, 0x10, 0x8D, 0xE5, 0x64, 0x0B, 0x00, 0xEB
	.byte 0x58, 0xB8, 0xFF, 0xEB, 0x30, 0x00, 0x9F, 0xE5, 0xD6, 0xC9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x02, 0x00, 0xA0, 0xE3, 0x00, 0x00, 0xC1, 0xE5, 0xCA, 0x06, 0x00, 0xEB, 0x09, 0x00, 0xA0, 0xE3
	.byte 0xAE, 0x06, 0x00, 0xEB, 0x0C, 0x00, 0x9F, 0xE5, 0xCE, 0xC9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x30, 0xAB, 0x35, 0x02, 0x40, 0x66, 0x34, 0x02, 0xD4, 0x63, 0x34, 0x02, 0x8C, 0x66, 0x34, 0x02

	arm_func_start ov02_02346640
ov02_02346640: @ 0x02346640
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	popne {r3, pc}
	mov r0, #6
	bl ov02_023480E0
	bl ov02_023496C0
	ldr r0, _02346668 @ =0x0234666C
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346668: .4byte 0x0234666C
	arm_func_end ov02_02346640
_0234666C:
	.byte 0x08, 0x40, 0x2D, 0xE9
	.byte 0x28, 0x0C, 0x00, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x04, 0x00, 0x9F, 0xE5
	.byte 0xB8, 0xC9, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8, 0xD4, 0x63, 0x34, 0x02

	arm_func_start ov02_0234668C
ov02_0234668C: @ 0x0234668C
	push {r3, lr}
	bl ov02_02349704
	cmp r0, #0
	beq _023466BC
	cmp r0, #1
	popne {r3, pc}
	ldr r1, _023466E0 @ =0x0235AB30
	mov r2, #3
	mov r0, #6
	strb r2, [r1]
	bl ov02_023480E0
	b _023466D0
_023466BC:
	ldr r1, _023466E0 @ =0x0235AB30
	mov r2, #1
	mov r0, #7
	strb r2, [r1]
	bl ov02_023480E0
_023466D0:
	bl ov02_023496C0
	ldr r0, _023466E4 @ =ov02_023466E8
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_023466E0: .4byte 0x0235AB30
_023466E4: .4byte ov02_023466E8
	arm_func_end ov02_0234668C

	arm_func_start ov02_023466E8
ov02_023466E8: @ 0x023466E8
	push {r3, lr}
	bl ov02_02349718
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02346740 @ =0x0235AB30
	ldrb r0, [r0]
	cmp r0, #1
	bne _02346714
	ldr r0, _02346744 @ =0x023463D4
	bl ov02_02338D68
	pop {r3, pc}
_02346714:
	mov r0, #0xb
	bl ov02_023480E0
	bl ov02_02334750
	ldr r1, _02346740 @ =0x0235AB30
	mov r2, #0
	ldr r0, _02346748 @ =0x02346554
	strb r2, [r1]
	bl ov02_02348F4C
	ldr r0, _0234674C @ =0x02346338
	bl ov02_02338D68
	pop {r3, pc}
	.align 2, 0
_02346740: .4byte 0x0235AB30
_02346744: .4byte 0x023463D4
_02346748: .4byte 0x02346554
_0234674C: .4byte 0x02346338
	arm_func_end ov02_023466E8

	arm_func_start ov02_02346750
ov02_02346750: @ 0x02346750
	push {r4, lr}
	mov r4, r0
	ldr r0, _023467A4 @ =0x00000608
	mov r1, #4
	bl ov02_0234E7B4
	mov ip, r0
	ldr r3, _023467A8 @ =0x0235AB34
	mov r0, r4
	add r1, ip, #4
	mov r2, #0x600
	str ip, [r3]
	bl FUN_0207C3B4
	ldr r1, _023467AC @ =ov02_0234684C
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _023467A8 @ =0x0235AB34
	ldr r1, [r1]
	str r0, [r1]
	pop {r4, pc}
	.align 2, 0
_023467A4: .4byte 0x00000608
_023467A8: .4byte 0x0235AB34
_023467AC: .4byte ov02_0234684C
	arm_func_end ov02_02346750

	arm_func_start ov02_023467B0
ov02_023467B0: @ 0x023467B0
	push {r3, lr}
	ldr r1, _023467D4 @ =0x0235AB34
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1]
	bl ov02_0234FB6C
	ldr r0, _023467D8 @ =0x0235AB34
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_023467D4: .4byte 0x0235AB34
_023467D8: .4byte 0x0235AB34
	arm_func_end ov02_023467B0

	arm_func_start ov02_023467DC
ov02_023467DC: @ 0x023467DC
	ldr r0, _023467F0 @ =0x0235AB34
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	bx lr
	.align 2, 0
_023467F0: .4byte 0x0235AB34
	arm_func_end ov02_023467DC

	arm_func_start ov02_023467F4
ov02_023467F4: @ 0x023467F4
	push {r4, r5, r6, r7, r8, lr}
	ldr ip, _02346848 @ =0x0235AB34
	mov r7, r3
	ldr r3, [ip]
	mov r8, r0
	add r0, r3, #4
	add r4, r0, r1, lsl #1
	mov r5, #0
	cmp r7, #0
	pople {r4, r5, r6, r7, r8, pc}
	lsl r6, r2, #1
_02346820:
	mov r0, r8
	mov r1, r4
	mov r2, r6
	bl FUN_0207C2E0
	add r5, r5, #1
	cmp r5, r7
	add r8, r8, #0x40
	add r4, r4, #0x40
	blt _02346820
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02346848: .4byte 0x0235AB34
	arm_func_end ov02_023467F4

	arm_func_start ov02_0234684C
ov02_0234684C: @ 0x0234684C
	push {r3, lr}
	ldr r0, _0234689C @ =0x0235AB34
	ldr r1, [r0]
	ldrb r0, [r1, #0x604]
	cmp r0, #0
	popeq {r3, pc}
	add r0, r1, #4
	mov r1, #0x600
	bl FUN_0207A2DC
	ldr r0, _0234689C @ =0x0235AB34
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	add r0, r0, #4
	bl FUN_020780D0
	ldr r0, _0234689C @ =0x0235AB34
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x604]
	pop {r3, pc}
	.align 2, 0
_0234689C: .4byte 0x0235AB34
	arm_func_end ov02_0234684C

	arm_func_start ov02_023468A0
ov02_023468A0: @ 0x023468A0
	push {r3, lr}
	ldr ip, _023468D4 @ =0x0235AB34
	add r3, r0, r1, lsl #5
	lsl r0, r2, #5
	ldr r1, _023468D8 @ =ov02_023468DC
	str r3, [ip, #4]
	add lr, r0, #0x5000000
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	str lr, [ip, #8]
	bl ov02_0234FA98
	pop {r3, pc}
	.align 2, 0
_023468D4: .4byte 0x0235AB34
_023468D8: .4byte ov02_023468DC
	arm_func_end ov02_023468A0

	arm_func_start ov02_023468DC
ov02_023468DC: @ 0x023468DC
	push {r4, lr}
	ldr r1, _02346904 @ =0x0235AB34
	mov r4, r0
	mov r2, #0x20
	ldmib r1, {r0, r1}
	bl FUN_0207C2E0
	mov r1, r4
	mov r0, #1
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_02346904: .4byte 0x0235AB34
	arm_func_end ov02_023468DC

	arm_func_start ov02_02346908
ov02_02346908: @ 0x02346908
	ldr r2, _02346928 @ =0x0235AB34
	ldr ip, _0234692C @ =ov02_0234FA98
	str r0, [r2, #4]
	ldr r1, _02346930 @ =ov02_02346934
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bx ip
	.align 2, 0
_02346928: .4byte 0x0235AB34
_0234692C: .4byte ov02_0234FA98
_02346930: .4byte ov02_02346934
	arm_func_end ov02_02346908

	arm_func_start ov02_02346934
ov02_02346934: @ 0x02346934
	push {r4, lr}
	ldr r1, _02346960 @ =0x0235AB34
	mov r4, r0
	ldr r0, [r1, #4]
	mov r1, #0x5000000
	mov r2, #0x200
	bl FUN_0207C2E0
	mov r1, r4
	mov r0, #1
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_02346960: .4byte 0x0235AB34
	arm_func_end ov02_02346934

	arm_func_start ov02_02346964
ov02_02346964: @ 0x02346964
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r7, r1
	mov r0, #0x20
	mov r1, #4
	mov r5, r2
	mov r4, r3
	bl ov02_0234E7B4
	ldr r2, _02346A30 @ =0x0235AB40
	ldr ip, [sp, #0x18]
	str r0, [r2]
	strb r6, [r0, #0x1b]
	ldr r1, [r2]
	mov r0, r5
	strb r7, [r1, #0x19]
	ldr r3, [r2]
	mov r1, r4
	strb ip, [r3, #0x1a]
	ldr r2, [r2]
	add r2, r2, #0x10
	bl ov02_0234E378
	ldr r1, _02346A34 @ =0x02352D6C
	mov r0, #0
	ldrb r1, [r1, r6]
	mov r2, #1
	bl ov02_0234D6D8
	mov r2, r5
	ldr r5, _02346A30 @ =0x0235AB40
	ldr r3, [sp, #0x18]
	ldr r6, [r5]
	mvn r1, #0
	str r0, [r6]
	ldr r0, [r5]
	add r3, r4, r3
	ldr r0, [r0]
	bl ov02_0234D440
	mov r0, r5
	ldr r0, [r0]
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov02_0234D530
	mov r0, #0
	ldr r1, _02346A38 @ =ov02_02346ADC
	mov r2, r0
	mov r3, #0x80
	bl ov02_0234FA98
	mov r1, r5
	ldr r1, [r1]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02346A30: .4byte 0x0235AB40
_02346A34: .4byte 0x02352D6C
_02346A38: .4byte ov02_02346ADC
	arm_func_end ov02_02346964

	arm_func_start ov02_02346A3C
ov02_02346A3C: @ 0x02346A3C
	push {r3, lr}
	ldr r1, _02346A70 @ =0x0235AB40
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl ov02_0234FB6C
	ldr r0, _02346A70 @ =0x0235AB40
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov02_0234D288
	ldr r0, _02346A74 @ =0x0235AB40
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_02346A70: .4byte 0x0235AB40
_02346A74: .4byte 0x0235AB40
	arm_func_end ov02_02346A3C

	arm_func_start ov02_02346A78
ov02_02346A78: @ 0x02346A78
	ldr r0, _02346A88 @ =0x0235AB40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	bx lr
	.align 2, 0
_02346A88: .4byte 0x0235AB40
	arm_func_end ov02_02346A78

	arm_func_start ov02_02346A8C
ov02_02346A8C: @ 0x02346A8C
	ldr r0, _02346A9C @ =0x0235AB40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1d]
	bx lr
	.align 2, 0
_02346A9C: .4byte 0x0235AB40
	arm_func_end ov02_02346A8C

	arm_func_start ov02_02346FEC
ov02_02346FEC: @ 0x02346AA0
	ldr ip, _02346AA8 @ =ov02_02346FEC
	bx ip
	.align 2, 0
_02346AA8: .4byte ov02_02346FEC
	arm_func_end ov02_02346FEC

	arm_func_start ov02_02346AAC
ov02_02346AAC: @ 0x02346AAC
	ldr r0, _02346AC0 @ =0x0235AB40
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.align 2, 0
_02346AC0: .4byte 0x0235AB40
	arm_func_end ov02_02346AAC

	arm_func_start ov02_02346AC4
ov02_02346AC4: @ 0x02346AC4
	ldr r0, _02346AD8 @ =0x0235AB40
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x1e]
	bx lr
	.align 2, 0
_02346AD8: .4byte 0x0235AB40
	arm_func_end ov02_02346AC4

	arm_func_start ov02_02346ADC
ov02_02346ADC: @ 0x02346ADC
	push {r3, lr}
	ldr r0, _02346C5C @ =0x0235AB40
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r1, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02346B04: @ jump table
	b _02346B14 @ case 0
	b _02346BC4 @ case 1
	b _02346BCC @ case 2
	b _02346C14 @ case 3
_02346B14:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	popne {r3, pc}
	bl ov02_02346E3C
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_02346B30: @ jump table
	pop {r3, pc} @ case 0
	b _02346B44 @ case 1
	b _02346BA4 @ case 2
	b _02346BB0 @ case 3
	b _02346BBC @ case 4
_02346B44:
	ldr r0, _02346C5C @ =0x0235AB40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	popeq {r3, pc}
	mov r0, #0x16
	bl ov02_023480E0
	mov r0, #0
	bl ov02_02348104
	ldr r0, _02346C5C @ =0x0235AB40
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x1d]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl ov02_0234EF04
	ldr r0, _02346C5C @ =0x0235AB40
	mov r1, #1
	ldr r3, [r0]
	ldrb r2, [r3, #0x1a]
	strb r2, [r3, #0x18]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_02346BA4:
	mov r0, #2
	bl ov02_02346DA8
	pop {r3, pc}
_02346BB0:
	mov r0, #3
	bl ov02_02346DA8
	pop {r3, pc}
_02346BBC:
	bl ov02_02346DD4
	pop {r3, pc}
_02346BC4:
	bl ov02_02346C60
	pop {r3, pc}
_02346BCC:
	mov r0, #2
	bl ov02_02346EC8
	cmp r0, #2
	beq _02346BFC
	ldr r0, _02346C5C @ =0x0235AB40
	mov r3, #5
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_02346BFC:
	bl ov02_02346E3C
	cmp r0, #2
	popne {r3, pc}
	mov r0, #2
	bl ov02_02346DA8
	pop {r3, pc}
_02346C14:
	mov r0, #3
	bl ov02_02346EC8
	cmp r0, #3
	beq _02346C44
	ldr r0, _02346C5C @ =0x0235AB40
	mov r3, #7
	ldr r2, [r0]
	mov r1, #0
	strb r3, [r2, #0x1d]
	ldr r0, [r0]
	strb r1, [r0, #0x1c]
	pop {r3, pc}
_02346C44:
	bl ov02_02346E3C
	cmp r0, #3
	popne {r3, pc}
	mov r0, #3
	bl ov02_02346DA8
	pop {r3, pc}
	.align 2, 0
_02346C5C: .4byte 0x0235AB40
	arm_func_end ov02_02346ADC

	arm_func_start ov02_02346C60
ov02_02346C60: @ 0x02346C60
	push {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _02346D24 @ =0x02352F34
	bl ov02_0234EC7C
	cmp r0, #0
	beq _02346CFC
	add r0, sp, #0
	bl ov02_0234EF04
	ldr r0, _02346D28 @ =0x0235AB40
	ldrh r1, [sp]
	ldr r3, [r0]
	ldrh r0, [r3, #0x10]
	sub r0, r0, #0x1e
	cmp r1, r0
	blt _02346CFC
	ldrh r1, [sp, #2]
	ldrh r0, [r3, #0x16]
	ldrb r2, [r3, #0x18]
	sub r0, r1, r0
	adds r4, r2, r0
	movmi r4, #0
	bmi _02346CD4
	ldrb r1, [r3, #0x1b]
	ldr r0, _02346D2C @ =0x02352D70
	ldrb r2, [r3, #0x19]
	ldrb r0, [r0, r1]
	sub r0, r2, r0
	cmp r4, r0
	movge r4, r0
_02346CD4:
	mov r0, r4
	bl ov02_02346D30
	mov r0, r4
	bl ov02_02346FEC
	ldr r0, _02346D28 @ =0x0235AB40
	mov r1, #2
	ldr r0, [r0]
	add sp, sp, #4
	strb r1, [r0, #0x1d]
	pop {r3, r4, pc}
_02346CFC:
	bl ov02_02348148
	ldr r0, _02346D28 @ =0x0235AB40
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	strb r3, [r2, #0x1c]
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02346D24: .4byte 0x02352F34
_02346D28: .4byte 0x0235AB40
_02346D2C: .4byte 0x02352D70
	arm_func_end ov02_02346C60

	arm_func_start ov02_02346D30
ov02_02346D30: @ 0x02346D30
	push {r4, lr}
	ldr r1, _02346DA0 @ =0x0235AB40
	ldr r1, [r1]
	ldrb r1, [r1, #0x1a]
	subs r4, r1, r0
	rsbmi r4, r4, #0
	cmp r4, #2
	movlt r0, #0
	blt _02346D68
	cmp r4, #6
	mov r0, #0x7f
	bge _02346D68
	rsb r1, r4, #6
	bl FUN_02075BFC
_02346D68:
	bl ov02_02348104
	cmp r4, #2
	mvnlt r1, #0xff
	blt _02346D94
	cmp r4, #6
	movge r1, #0x100
	bge _02346D94
	rsb r1, r4, #6
	mov r0, #0x200
	bl FUN_02075BFC
	sub r1, r0, #0x100
_02346D94:
	ldr r0, _02346DA4 @ =0x0000FFFF
	bl ov02_02348124
	pop {r4, pc}
	.align 2, 0
_02346DA0: .4byte 0x0235AB40
_02346DA4: .4byte 0x0000FFFF
	arm_func_end ov02_02346D30

	arm_func_start ov02_02346DA8
ov02_02346DA8: @ 0x02346DA8
	ldr r1, _02346DD0 @ =0x0235AB40
	cmp r0, #2
	ldr r1, [r1]
	strb r0, [r1, #0x1c]
	ldr r0, _02346DD0 @ =0x0235AB40
	moveq r1, #4
	ldr r0, [r0]
	movne r1, #6
	strb r1, [r0, #0x1d]
	bx lr
	.align 2, 0
_02346DD0: .4byte 0x0235AB40
	arm_func_end ov02_02346DA8

	arm_func_start ov02_02346DD4
ov02_02346DD4: @ 0x02346DD4
	push {r3, lr}
	add r0, sp, #0
	bl ov02_0234EF04
	ldr r0, _02346E34 @ =0x0235AB40
	ldr r2, _02346E38 @ =0x02352D70
	ldr ip, [r0]
	ldrh r1, [sp, #2]
	ldrb r3, [ip, #0x1b]
	ldrh r0, [ip, #0x12]
	ldrb r2, [r2, r3]
	sub r0, r1, r0
	subs r0, r0, r2, lsr #1
	movmi r0, #0
	bmi _02346E1C
	ldrb r1, [ip, #0x19]
	sub r1, r1, r2
	cmp r0, r1
	movge r0, r1
_02346E1C:
	bl ov02_02346FEC
	ldr r0, _02346E34 @ =0x0235AB40
	mov r1, #3
	ldr r0, [r0]
	strb r1, [r0, #0x1d]
	pop {r3, pc}
	.align 2, 0
_02346E34: .4byte 0x0235AB40
_02346E38: .4byte 0x02352D70
	arm_func_end ov02_02346DD4

	arm_func_start ov02_02346E3C
ov02_02346E3C: @ 0x02346E3C
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	add r1, sp, #0
	mov r0, #1
	bl ov02_02346F14
	add r0, sp, #0
	bl ov02_0234ED8C
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	popne {r3, r4, r5, pc}
	mov r5, #2
	add r4, sp, #0
_02346E70:
	mov r0, r5
	mov r1, r4
	bl ov02_02346F14
	mov r0, r4
	bl ov02_0234ED8C
	cmp r0, #0
	addne sp, sp, #8
	movne r0, r5
	popne {r3, r4, r5, pc}
	add r5, r5, #1
	cmp r5, #3
	ble _02346E70
	add r1, sp, #0
	mov r0, #4
	bl ov02_02346F14
	add r0, sp, #0
	bl ov02_0234ED04
	cmp r0, #0
	movne r0, #4
	moveq r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02346E3C

	arm_func_start ov02_02346EC8
ov02_02346EC8: @ 0x02346EC8
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, #2
	add r4, sp, #0
_02346ED8:
	mov r0, r5
	mov r1, r4
	bl ov02_02346F14
	mov r0, r4
	bl ov02_0234EC7C
	cmp r0, #0
	addne sp, sp, #8
	movne r0, r5
	popne {r3, r4, r5, pc}
	add r5, r5, #1
	cmp r5, #3
	ble _02346ED8
	mov r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	arm_func_end ov02_02346EC8

	arm_func_start ov02_02346F14
ov02_02346F14: @ 0x02346F14
	ldr r2, _02346FE4 @ =0x0235AB40
	cmp r0, #4
	ldr r3, [r2]
	ldrh r3, [r3, #0x10]
	strh r3, [r1]
	add r3, r3, #0xc
	strh r3, [r1, #4]
	addls pc, pc, r0, lsl #2
	bx lr
_02346F38: @ jump table
	bx lr @ case 0
	b _02346F4C @ case 1
	b _02346F80 @ case 2
	b _02346FA0 @ case 3
	b _02346FC4 @ case 4
_02346F4C:
	ldr r3, [r2]
	ldr r0, _02346FE8 @ =0x02352D70
	ldrh ip, [r3, #0x12]
	ldrb r3, [r3, #0x1a]
	add r3, ip, r3
	strh r3, [r1, #2]
	ldr r2, [r2]
	ldrh r3, [r1, #2]
	ldrb r2, [r2, #0x1b]
	ldrb r0, [r0, r2]
	add r0, r3, r0
	strh r0, [r1, #6]
	bx lr
_02346F80:
	ldr r0, [r2]
	ldrh r0, [r0, #0x12]
	sub r0, r0, #0xd
	strh r0, [r1, #2]
	ldr r0, [r2]
	ldrh r0, [r0, #0x12]
	strh r0, [r1, #6]
	bx lr
_02346FA0:
	ldr r0, [r2]
	ldrh r2, [r0, #0x12]
	ldrb r0, [r0, #0x19]
	add r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r1, #2]
	add r0, r0, #0xd
	strh r0, [r1, #6]
	bx lr
_02346FC4:
	ldr r0, [r2]
	ldrh r3, [r0, #0x12]
	strh r3, [r1, #2]
	ldr r0, [r2]
	ldrb r0, [r0, #0x19]
	add r0, r3, r0
	strh r0, [r1, #6]
	bx lr
	.align 2, 0
_02346FE4: .4byte 0x0235AB40
_02346FE8: .4byte 0x02352D70
	arm_func_end ov02_02346F14

	arm_func_start ov02_02346FEC
ov02_02346FEC: @ 0x02346FEC
	push {r4, lr}
	ldr r1, _02347024 @ =0x0235AB40
	mov r4, r0
	ldr r0, [r1]
	mvn r1, #0
	ldrh r3, [r0, #0x12]
	ldrh r2, [r0, #0x10]
	ldr r0, [r0]
	add r3, r4, r3
	bl ov02_0234D440
	ldr r0, _02347024 @ =0x0235AB40
	ldr r0, [r0]
	strb r4, [r0, #0x1a]
	pop {r4, pc}
	.align 2, 0
_02347024: .4byte 0x0235AB40
	arm_func_end ov02_02346FEC

	arm_func_start ov02_02347028
ov02_02347028: @ 0x02347028
	push {r3, lr}
	ldr r0, _02347054 @ =0x0235AB44
	ldr r0, [r0]
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _02347058 @ =0x00001E60
	mov r1, #0x20
	bl ov02_0234E7B4
	ldr r1, _02347054 @ =0x0235AB44
	str r0, [r1]
	pop {r3, pc}
	.align 2, 0
_02347054: .4byte 0x0235AB44
_02347058: .4byte 0x00001E60
	arm_func_end ov02_02347028

	arm_func_start ov02_0234705C
ov02_0234705C: @ 0x0234705C
	push {r3, lr}
	ldr r0, _02347088 @ =0x0235AB44
	ldr r0, [r0]
	cmp r0, #0
	popeq {r3, pc}
_02347070:
	bl FUN_022BF640
	cmp r0, #0x8000
	bne _02347070
	ldr r0, _0234708C @ =0x0235AB44
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_02347088: .4byte 0x0235AB44
_0234708C: .4byte 0x0235AB44
	arm_func_end ov02_0234705C

	arm_func_start ov02_02347090
ov02_02347090: @ 0x02347090
	push {r3, r4, r5, lr}
	ldr r1, _02347150 @ =0x0235AB44
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x348
	add r1, r1, #0x1300
	bl FUN_0207C2B8
	ldr r0, _02347150 @ =0x0235AB44
	ldr r1, _02347154 @ =ov02_02347288
	ldr r0, [r0]
	mov r2, #3
	bl FUN_022BFB14
	cmp r0, #2
	movne r0, #0
	popne {r3, r4, r5, pc}
	ldr r4, _02347150 @ =0x0235AB44
_023470D0:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_022BF3E0
	ldr ip, [r4]
	add r0, ip, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _023470D0
	add r0, ip, #0x248
	ldr r5, _02347158 @ =0x02352D80
	add lr, r0, #0x1400
	arm_func_end ov02_02347090

	arm_func_start ov02_02347100
ov02_02347100: @ 0x02347100
	mov r4, #4
_02347104:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02347104
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x648]
	bl FUN_022BF780
	ldr r1, _02347150 @ =0x0235AB44
	ldr r1, [r1]
	add r1, r1, #0x1600
	strh r0, [r1, #0x50]
	bl ov02_0234715C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02347150: .4byte 0x0235AB44
_02347154: .4byte ov02_02347288
_02347158: .4byte 0x02352D80
	arm_func_end ov02_02347100

	arm_func_start ov02_0234715C
ov02_0234715C: @ 0x0234715C
	push {r3, lr}
	ldr r1, _02347188 @ =0x0235AB44
	ldr r0, _0234718C @ =ov02_02347288
	ldr r1, [r1]
	add r1, r1, #0x248
	add r1, r1, #0x1400
	bl FUN_022BFED8
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	pop {r3, pc}
	.align 2, 0
_02347188: .4byte 0x0235AB44
_0234718C: .4byte ov02_02347288
	arm_func_end ov02_0234715C

	arm_func_start ov02_02347190
ov02_02347190: @ 0x02347190
	push {r4, lr}
	ldr r1, _02347224 @ =0x0235AB44
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xe5c]
	ldr r0, [r1]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_022BF3E0
	ldr r0, _02347224 @ =0x0235AB44
	ldr r0, [r0]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	beq _0234720C
	ldr r0, _02347228 @ =ov02_02347288
	bl FUN_022BFB9C
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r4, _02347224 @ =0x0235AB44
_023471E8:
	ldr r0, [r4]
	add r0, r0, #0x28c
	add r0, r0, #0x1400
	bl FUN_022BF3E0
	ldr r0, [r4]
	add r0, r0, #0x1600
	ldrh r0, [r0, #0x8c]
	cmp r0, #2
	bne _023471E8
_0234720C:
	ldr r0, _02347228 @ =ov02_02347288
	bl FUN_022BFBD4
	cmp r0, #2
	movne r0, #0
	moveq r0, #1
	pop {r4, pc}
	.align 2, 0
_02347224: .4byte 0x0235AB44
_02347228: .4byte ov02_02347288
	arm_func_end ov02_02347190

	arm_func_start ov02_0234722C
ov02_0234722C: @ 0x0234722C
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _02347280 @ =0x0235AB44
	mov r6, #0
	ldr r1, [r1]
	ldr r5, _02347284 @ =0x02352D78
	add r8, r1, #0x1300
	mov r7, r6
	str r8, [r0]
	mov r4, #6
_02347250:
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x20
	bl FUN_02087348
	cmp r0, #0
	add r7, r7, #1
	addne r6, r6, #1
	cmp r7, #0x14
	add r8, r8, #0x2a
	blt _02347250
	mov r0, r6
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02347280: .4byte 0x0235AB44
_02347284: .4byte 0x02352D78
	arm_func_end ov02_0234722C

	arm_func_start ov02_02347288
ov02_02347288: @ 0x02347288
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	popne {r3, pc}
	ldr r1, _023472E8 @ =0x0235AB44
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r1, [r1, #0xe5c]
	cmp r1, #0
	ldrheq r1, [r0]
	cmpeq r1, #0x26
	popne {r3, pc}
	ldrh r1, [r0, #8]
	cmp r1, #4
	beq _023472D8
	cmp r1, #5
	bne _023472E0
	bl ov02_023472EC
	bl ov02_0234715C
	pop {r3, pc}
_023472D8:
	bl ov02_0234715C
	pop {r3, pc}
_023472E0:
	bl FUN_0207BC20
	pop {r3, pc}
	.align 2, 0
_023472E8: .4byte 0x0235AB44
	arm_func_end ov02_02347288

	arm_func_start ov02_023472EC
ov02_023472EC: @ 0x023472EC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldr r1, _023474B4 @ =0x0235AB44
	mov fp, r0
	ldr r2, [r1]
	mov r1, #0x400
	add r0, r2, #0xf00
	add r2, r2, #0x1300
	str r2, [sp]
	bl FUN_0207A2A4
	ldrh r0, [fp, #0xe]
	mov sl, #0
	cmp r0, #0
	addle sp, sp, #0x88
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02347328:
	add r0, fp, sl, lsl #2
	ldr r4, [r0, #0x10]
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _0234749C
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	bne _0234749C
	ldr r7, [sp]
	mov r5, #0
	mov r6, #6
_02347354:
	mov r2, r6
	add r0, r4, #4
	add r1, r7, #0x20
	bl FUN_02087348
	cmp r0, #0
	beq _0234737C
	add r5, r5, #1
	cmp r5, #0x14
	add r7, r7, #0x2a
	blt _02347354
_0234737C:
	cmp r5, #0x14
	bne _023473C8
	ldr r8, [sp]
	ldr r7, _023474B8 @ =0x02352D78
	mov r5, #0
	mov r6, #6
_02347394:
	mov r1, r7
	mov r2, r6
	add r0, r8, #0x20
	bl FUN_02087348
	cmp r0, #0
	beq _023473BC
	add r5, r5, #1
	cmp r5, #0x14
	add r8, r8, #0x2a
	blt _02347394
_023473BC:
	cmp r5, #0x14
	addeq sp, sp, #0x88
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023473C8:
	ldr r0, [sp]
	mov r1, #0x2a
	mla sb, r5, r1, r0
	add r0, r4, #4
	add r1, sb, #0x20
	mov r2, #6
	bl FUN_0207C4C8
	mov r1, sb
	add r0, r4, #0xc
	mov r2, #0x20
	bl FUN_0207C4C8
	add r0, fp, sl, lsl #1
	ldrh r0, [r0, #0x50]
	strh r0, [sb, #0x26]
	ldrh r0, [r4, #0x2c]
	tst r0, #0x10
	moveq r0, #0
	strbeq r0, [sb, #0x28]
	beq _0234749C
	mov r2, #1
	add r0, sp, #4
	mov r1, r4
	strb r2, [sb, #0x28]
	bl FUN_022BF814
	ldrb r8, [sp, #4]
	mov r7, #0
	cmp r8, #0
	ble _0234749C
	ldr r5, _023474BC @ =0x02352D74
	mov r4, #4
	add r6, sp, #4
_02347444:
	add r1, r6, r7, lsl #3
	ldrb r0, [r1, #4]
	cmp r0, #0x30
	moveq r0, #2
	strbeq r0, [sb, #0x28]
	beq _0234749C
	cmp r0, #0xdd
	bne _02347490
	ldrb r0, [r1, #5]
	cmp r0, #4
	blo _02347490
	ldr r0, [r1, #8]
	mov r1, r5
	mov r2, r4
	bl FUN_02087348
	cmp r0, #0
	moveq r0, #2
	strbeq r0, [sb, #0x28]
	beq _0234749C
_02347490:
	add r7, r7, #1
	cmp r7, r8
	blt _02347444
_0234749C:
	ldrh r0, [fp, #0xe]
	add sl, sl, #1
	cmp sl, r0
	blt _02347328
	add sp, sp, #0x88
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023474B4: .4byte 0x0235AB44
_023474B8: .4byte 0x02352D78
_023474BC: .4byte 0x02352D74
	arm_func_end ov02_023472EC

	arm_func_start ov02_023474C0
ov02_023474C0: @ 0x023474C0
	push {r3, lr}
	ldr r0, _023474F8 @ =0x000006F8
	mov r1, #0x20
	bl ov02_0234E7B4
	ldr r1, _023474FC @ =0x0235AB48
	add r2, r0, #0xf8
	str r0, [r1]
	ldr r1, _02347500 @ =0x0000A001
	add r0, r2, #0x400
	bl FUN_02085030
	ldr r0, _023474FC @ =0x0235AB48
	ldr r0, [r0]
	bl FUN_022ED660
	pop {r3, pc}
	.align 2, 0
_023474F8: .4byte 0x000006F8
_023474FC: .4byte 0x0235AB48
_02347500: .4byte 0x0000A001
	arm_func_end ov02_023474C0

	arm_func_start ov02_02347504
ov02_02347504: @ 0x02347504
	ldr ip, _02347510 @ =ov02_0234E7D8
	ldr r0, _02347514 @ =0x0235AB48
	bx ip
	.align 2, 0
_02347510: .4byte ov02_0234E7D8
_02347514: .4byte 0x0235AB48
	arm_func_end ov02_02347504

	arm_func_start ov02_02347518
ov02_02347518: @ 0x02347518
	ldr r0, _02347528 @ =0x0235AB48
	ldr r0, [r0]
	add r0, r0, #0x400
	bx lr
	.align 2, 0
_02347528: .4byte 0x0235AB48
	arm_func_end ov02_02347518

	arm_func_start ov02_0234752C
ov02_0234752C: @ 0x0234752C
	ldr r1, _0234753C @ =0x0235AB48
	ldr r1, [r1]
	strb r0, [r1, #0x4f5]
	bx lr
	.align 2, 0
_0234753C: .4byte 0x0235AB48
	arm_func_end ov02_0234752C

	arm_func_start ov02_02347540
ov02_02347540: @ 0x02347540
	ldr r1, _02347550 @ =0x0235AB48
	ldr r1, [r1]
	strb r0, [r1, #0x4f6]
	bx lr
	.align 2, 0
_02347550: .4byte 0x0235AB48
	arm_func_end ov02_02347540

	arm_func_start ov02_02347554
ov02_02347554: @ 0x02347554
	push {r3, lr}
	ldr r1, _02347580 @ =0x0235AB48
	mov r2, #0x20
	ldr r1, [r1]
	add r1, r1, #0x440
	bl FUN_0207C4C8
	ldr r0, _02347580 @ =0x0235AB48
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4e7]
	pop {r3, pc}
	.align 2, 0
_02347580: .4byte 0x0235AB48
	arm_func_end ov02_02347554

	arm_func_start ov02_02347584
ov02_02347584: @ 0x02347584
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02347718 @ =0x0235AB48
	mov r6, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, #0x480
	mov r2, #0x10
	bl FUN_0207C40C
	mov r0, r6
	mov r1, #0x20
	bl ov02_0234F59C
	mov r5, r0
	cmp r5, #0xa
	bgt _023475CC
	bge _023475E4
	cmp r5, #0
	beq _023475E4
	b _0234763C
_023475CC:
	cmp r5, #0x1a
	bgt _023475DC
	beq _023475E4
	b _0234763C
_023475DC:
	cmp r5, #0x20
	bne _0234763C
_023475E4:
	ldr r0, _02347718 @ =0x0235AB48
	cmp r5, #0
	ldr r2, [r0]
	mov r4, #0
	ldrb r1, [r2, #0x4e6]
	bic r1, r1, #0xfc
	strb r1, [r2, #0x4e6]
	ldr r0, [r0]
	add r8, r0, #0x480
	ble _02347668
_0234760C:
	ldrb r0, [r6, r4]
	add sb, r6, r4
	bl ov02_02348008
	mov r7, r0
	ldrb r0, [sb, #1]
	bl ov02_02348008
	add r0, r0, r7, lsl #4
	add r4, r4, #2
	cmp r4, r5
	strb r0, [r8], #1
	blt _0234760C
	b _02347668
_0234763C:
	ldr r1, _02347718 @ =0x0235AB48
	mov r0, r6
	ldr r4, [r1]
	mov r2, #0x10
	ldrb r3, [r4, #0x4e6]
	bic r3, r3, #0xfc
	orr r3, r3, #4
	strb r3, [r4, #0x4e6]
	ldr r1, [r1]
	add r1, r1, #0x480
	bl FUN_0207C4C8
_02347668:
	cmp r5, #5
	bgt _02347680
	bge _023476C4
	cmp r5, #0
	beq _023476AC
	b _023476FC
_02347680:
	cmp r5, #0xd
	bgt _023476A0
	cmp r5, #0xa
	blt _023476FC
	beq _023476C4
	cmp r5, #0xd
	beq _023476E0
	b _023476FC
_023476A0:
	cmp r5, #0x1a
	beq _023476E0
	b _023476FC
_023476AC:
	ldr r0, _02347718 @ =0x0235AB48
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_023476C4:
	ldr r0, _02347718 @ =0x0235AB48
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #1
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_023476E0:
	ldr r0, _02347718 @ =0x0235AB48
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_023476FC:
	ldr r0, _02347718 @ =0x0235AB48
	ldr r1, [r0]
	ldrb r0, [r1, #0x4e6]
	bic r0, r0, #3
	orr r0, r0, #3
	strb r0, [r1, #0x4e6]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02347718: .4byte 0x0235AB48
	arm_func_end ov02_02347584
_0234771C:
	.byte 0x0C, 0x10, 0x9F, 0xE5
	.byte 0x0C, 0xC0, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5, 0x13, 0x1D, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0x48, 0xAB, 0x35, 0x02, 0x80, 0x7F, 0x34, 0x02, 0x0C, 0x10, 0x9F, 0xE5, 0x0C, 0xC0, 0x9F, 0xE5
	.byte 0x00, 0x10, 0x91, 0xE5, 0x4F, 0x1E, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0x48, 0xAB, 0x35, 0x02
	.byte 0x80, 0x7F, 0x34, 0x02, 0x10, 0x10, 0x9F, 0xE5, 0x10, 0xC0, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5
	.byte 0xC4, 0x10, 0x81, 0xE2, 0x01, 0x1B, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0x48, 0xAB, 0x35, 0x02
	.byte 0x80, 0x7F, 0x34, 0x02, 0x10, 0x10, 0x9F, 0xE5, 0x10, 0xC0, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5
	.byte 0xC8, 0x10, 0x81, 0xE2, 0x01, 0x1B, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0x48, 0xAB, 0x35, 0x02
	.byte 0x80, 0x7F, 0x34, 0x02, 0x10, 0x10, 0x9F, 0xE5, 0x10, 0xC0, 0x9F, 0xE5, 0x00, 0x10, 0x91, 0xE5
	.byte 0xCC, 0x10, 0x81, 0xE2, 0x01, 0x1B, 0x81, 0xE2, 0x1C, 0xFF, 0x2F, 0xE1, 0x48, 0xAB, 0x35, 0x02
	.byte 0x80, 0x7F, 0x34, 0x02

	arm_func_start ov02_023477B4
ov02_023477B4: @ 0x023477B4
	ldr r2, _023477D0 @ =0x0235AB48
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _023477D4 @ =FUN_0207C4C8
	mov r2, #0x20
	add r0, r0, #0x440
	bx ip
	.align 2, 0
_023477D0: .4byte 0x0235AB48
_023477D4: .4byte FUN_0207C4C8
	arm_func_end ov02_023477B4

	arm_func_start ov02_023477D8
ov02_023477D8: @ 0x023477D8
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _02347810 @ =0x0235AB48
	ldr r1, _02347814 @ =0x02353D44
	ldr r3, [r2]
	ldrb r2, [r3, #0x4c2]
	str r2, [sp]
	ldrb r2, [r3, #0x4c3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4c0]
	ldrb r3, [r3, #0x4c1]
	bl FUN_020790DC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02347810: .4byte 0x0235AB48
_02347814: .4byte 0x02353D44
	arm_func_end ov02_023477D8

	arm_func_start ov02_02347818
ov02_02347818: @ 0x02347818
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _02347850 @ =0x0235AB48
	ldr r1, _02347854 @ =0x02353D44
	ldr r3, [r2]
	ldrb r2, [r3, #0x4f2]
	str r2, [sp]
	ldrb r2, [r3, #0x4f3]
	str r2, [sp, #4]
	ldrb r2, [r3, #0x4f0]
	ldrb r3, [r3, #0x4f1]
	bl FUN_020790DC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02347850: .4byte 0x0235AB48
_02347854: .4byte 0x02353D44
	arm_func_end ov02_02347818

	arm_func_start ov02_02347858
ov02_02347858: @ 0x02347858
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _02347894 @ =0x0235AB48
	ldr r1, _02347898 @ =0x02353D44
	ldr ip, [r2]
	add r3, ip, #0xc4
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c4]
	ldrb r3, [r3, #0x401]
	bl FUN_020790DC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02347894: .4byte 0x0235AB48
_02347898: .4byte 0x02353D44
	arm_func_end ov02_02347858

	arm_func_start ov02_0234789C
ov02_0234789C: @ 0x0234789C
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _023478D8 @ =0x0235AB48
	ldr r1, _023478DC @ =0x02353D44
	ldr ip, [r2]
	add r3, ip, #0xc8
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4c8]
	ldrb r3, [r3, #0x401]
	bl FUN_020790DC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_023478D8: .4byte 0x0235AB48
_023478DC: .4byte 0x02353D44
	arm_func_end ov02_0234789C

	arm_func_start ov02_023478E0
ov02_023478E0: @ 0x023478E0
	push {r3, lr}
	sub sp, sp, #8
	ldr r2, _0234791C @ =0x0235AB48
	ldr r1, _02347920 @ =0x02353D44
	ldr ip, [r2]
	add r3, ip, #0xcc
	ldrb r2, [r3, #0x402]
	str r2, [sp]
	ldrb r2, [r3, #0x403]
	str r2, [sp, #4]
	ldrb r2, [ip, #0x4cc]
	ldrb r3, [r3, #0x401]
	bl FUN_020790DC
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234791C: .4byte 0x0235AB48
_02347920: .4byte 0x02353D44
	arm_func_end ov02_023478E0

	arm_func_start ov02_02347924
ov02_02347924: @ 0x02347924
	ldr r1, _02347938 @ =0x0235AB48
	ldr r1, [r1]
	add r0, r1, r0, lsl #8
	ldrb r0, [r0, #0xe7]
	bx lr
	.align 2, 0
_02347938: .4byte 0x0235AB48
	arm_func_end ov02_02347924

	arm_func_start ov02_0234793C
ov02_0234793C: @ 0x0234793C
	push {r3, r4, r5, lr}
	ldr r1, _02347A14 @ =0x0235AB48
	mov r3, #0x78
	ldr r5, [r1]
	add r4, r5, r0, lsl #8
	mov lr, r4
	add ip, r5, #0x400
_02347958:
	ldrb r2, [lr]
	ldrb r1, [lr, #1]
	add lr, lr, #2
	subs r3, r3, #1
	strb r2, [ip]
	strb r1, [ip, #1]
	add ip, ip, #2
	bne _02347958
	ldr r1, _02347A18 @ =0x02352DC4
	strb r0, [r5, #0x4f4]
	add r0, r4, #0xc0
	mov r2, #4
	bl FUN_02087348
	cmp r0, #0
	ldrne r0, _02347A14 @ =0x0235AB48
	movne r1, #0
	ldreq r0, _02347A14 @ =0x0235AB48
	moveq r1, #1
	ldr r0, [r0]
	mov r2, #4
	strb r1, [r0, #0x4f5]
	ldr r1, _02347A18 @ =0x02352DC4
	add r0, r4, #0xc8
	bl FUN_02087348
	cmp r0, #0
	bne _023479D8
	ldr r1, _02347A18 @ =0x02352DC4
	add r0, r4, #0xcc
	mov r2, #4
	bl FUN_02087348
	cmp r0, #0
	beq _023479EC
_023479D8:
	ldr r0, _02347A14 @ =0x0235AB48
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
	b _023479FC
_023479EC:
	ldr r0, _02347A14 @ =0x0235AB48
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x4f6]
_023479FC:
	ldr r1, _02347A14 @ =0x0235AB48
	ldrb r0, [r4, #0xd0]
	ldr r1, [r1]
	add r1, r1, #0x4f0
	bl FUN_022ED804
	pop {r3, r4, r5, pc}
	.align 2, 0
_02347A14: .4byte 0x0235AB48
_02347A18: .4byte 0x02352DC4
	arm_func_end ov02_0234793C

	arm_func_start ov02_02347A1C
ov02_02347A1C: @ 0x02347A1C
	push {r3, r4, r5, lr}
	ldr r0, _02347AF4 @ =0x0235AB48
	mov r2, #0x78
	ldr r1, [r0]
	add r4, r1, #0x400
	ldrb r0, [r4, #0xf4]
	mov ip, r4
	add r5, r1, r0, lsl #8
	mov r3, r5
_02347A40:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _02347A40
	ldrb r0, [r4, #0xf5]
	mov r2, #4
	cmp r0, #0
	beq _02347A94
	add r0, r5, #0xc0
	mov r1, #0
	bl FUN_0207C40C
	add r0, r5, #0xc4
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	mov r0, #0
	b _02347AB8
_02347A94:
	add r0, r4, #0xc0
	add r1, r5, #0xc0
	bl FUN_0207C4C8
	add r0, r4, #0xc4
	add r1, r5, #0xc4
	mov r2, #4
	bl FUN_0207C4C8
	add r0, r4, #0xf0
	bl FUN_022ED7C0
_02347AB8:
	strb r0, [r5, #0xd0]
	ldrb r0, [r4, #0xf6]
	mov r2, #8
	cmp r0, #0
	beq _02347ADC
	add r0, r5, #0xc8
	mov r1, #0
	bl FUN_0207C40C
	b _02347AE8
_02347ADC:
	add r0, r4, #0xc8
	add r1, r5, #0xc8
	bl FUN_0207C4C8
_02347AE8:
	ldrb r0, [r4, #0xf4]
	bl ov02_02347E18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02347AF4: .4byte 0x0235AB48
	arm_func_end ov02_02347A1C

	arm_func_start ov02_02347AF8
ov02_02347AF8: @ 0x02347AF8
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _02347C08 @ =0x0235AB48
	mov r6, r0
	ldr r4, [r1]
	mov r1, #0
	add r0, r4, #0x400
	mov r2, #0xef
	bl FUN_0207C40C
	mov r0, r6
	add r1, r4, #0x440
	mov r2, #0x20
	bl FUN_0207C4C8
	ldr r0, [r6, #0x20]
	cmp r0, #1
	beq _02347B48
	cmp r0, #2
	beq _02347B60
	cmp r0, #3
	beq _02347B78
	b _02347B90
_02347B48:
	ldrb r0, [r4, #0x4e6]
	mov r5, #5
	bic r0, r0, #3
	orr r0, r0, #1
	strb r0, [r4, #0x4e6]
	b _02347BA0
_02347B60:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0xd
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r4, #0x4e6]
	b _02347BA0
_02347B78:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0x10
	bic r0, r0, #3
	orr r0, r0, #3
	strb r0, [r4, #0x4e6]
	b _02347BA0
_02347B90:
	ldrb r0, [r4, #0x4e6]
	mov r5, #0
	bic r0, r0, #3
	strb r0, [r4, #0x4e6]
_02347BA0:
	ldrb r0, [r4, #0x4e6]
	add r8, r6, #0x28
	add r7, r4, #0x480
	bic r0, r0, #0xfc
	strb r0, [r4, #0x4e6]
	mov r6, #0
_02347BB8:
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl FUN_0207C4C8
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x10
	add r8, r8, #0x20
	blt _02347BB8
	mov r3, #2
	add r0, r4, #0x4f0
	mov r1, #0
	mov r2, #4
	strb r3, [r4, #0x4e7]
	bl FUN_0207C40C
	mov r0, #1
	strb r0, [r4, #0x4f5]
	strb r0, [r4, #0x4f6]
	bl ov02_02347A1C
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02347C08: .4byte 0x0235AB48
	arm_func_end ov02_02347AF8

	arm_func_start ov02_02347C0C
ov02_02347C0C: @ 0x02347C0C
	push {r3, r4, r5, lr}
	ldr r1, _02347D18 @ =0x0235AB48
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, #0x400
	mov r0, r4
	mov r2, #0xef
	bl FUN_0207C40C
	mov r0, r5
	add r1, r4, #0xd1
	mov r2, #5
	bl FUN_0207C4C8
	add r0, r5, #6
	add r1, r4, #0xd6
	mov r2, #5
	bl FUN_0207C4C8
	add r0, r5, #0xc
	add r1, r4, #0xdb
	mov r2, #5
	bl FUN_0207C4C8
	add r0, r5, #0x12
	add r1, r4, #0xe0
	mov r2, #5
	bl FUN_0207C4C8
	add r0, r5, #0x18
	add r1, r4, #0x60
	mov r2, #0x20
	bl FUN_0207C4C8
	add r0, r5, #0x39
	add r1, r4, #0x80
	mov r2, #0xd
	bl FUN_0207C4C8
	add r0, r5, #0x47
	add r1, r4, #0x90
	mov r2, #0xd
	bl FUN_0207C4C8
	add r0, r5, #0x55
	add r1, r4, #0xa0
	mov r2, #0xd
	bl FUN_0207C4C8
	add r0, r5, #0x63
	add r1, r4, #0xb0
	mov r2, #0xd
	bl FUN_0207C4C8
	add r0, r5, #0x71
	add r1, r4, #0x40
	mov r2, #0x20
	bl FUN_0207C4C8
	ldrb r2, [r4, #0xe6]
	mov r1, #1
	add r0, r4, #0xf0
	bic r2, r2, #3
	orr r2, r2, #2
	strb r2, [r4, #0xe6]
	and r2, r2, #0xff
	bic r2, r2, #0xfc
	strb r2, [r4, #0xe6]
	strb r1, [r4, #0xe7]
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	mov r0, #1
	strb r0, [r4, #0xf5]
	strb r0, [r4, #0xf6]
	bl ov02_02347A1C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02347D18: .4byte 0x0235AB48
	arm_func_end ov02_02347C0C

	arm_func_start ov02_02347D1C
ov02_02347D1C: @ 0x02347D1C
	ldr r0, _02347D28 @ =0x0235AB48
	ldr r0, [r0]
	bx lr
	.align 2, 0
_02347D28: .4byte 0x0235AB48
	arm_func_end ov02_02347D1C

	arm_func_start ov02_02347D2C
ov02_02347D2C: @ 0x02347D2C
	push {r3, r4, r5, lr}
	ldr r1, _02347D64 @ =0x0235AB48
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0
	add r4, r0, r5, lsl #8
	mov r0, r4
	mov r2, #0xef
	bl FUN_0207C40C
	mov r1, #0xff
	mov r0, r5
	strb r1, [r4, #0xe7]
	bl ov02_02347E18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02347D64: .4byte 0x0235AB48
	arm_func_end ov02_02347D2C

	arm_func_start ov02_02347D68
ov02_02347D68: @ 0x02347D68
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _02347E14 @ =0x0235AB48
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x400
	bl FUN_0207C2B8
	ldr r0, _02347E14 @ =0x0235AB48
	mov r3, #0
	mov r2, #0xff
_02347D90:
	ldr r1, [r0]
	add r1, r1, r3, lsl #8
	add r3, r3, #1
	strb r2, [r1, #0xe7]
	cmp r3, #3
	blt _02347D90
	add r0, sp, #0
	bl FUN_022EE650
	add r0, sp, #0
	bl FUN_022EDF4C
	mov r8, #0
	ldr r4, _02347E14 @ =0x0235AB48
	mov r6, r0
	mov r7, r8
	mov r5, #0xe
_02347DCC:
	ldr r1, [r4]
	mov r0, r6
	add r1, r1, r7
	mov r2, r5
	add r1, r1, #0xf0
	bl FUN_0207C4C8
	add r8, r8, #1
	cmp r8, #2
	add r7, r7, #0x100
	blt _02347DCC
	mov r4, #0
_02347DF8:
	mov r0, r4
	bl ov02_02347E18
	add r4, r4, #1
	cmp r4, #4
	blt _02347DF8
	add sp, sp, #0x14
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02347E14: .4byte 0x0235AB48
	arm_func_end ov02_02347D68

	arm_func_start ov02_02347E18
ov02_02347E18: @ 0x02347E18
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	ldr r1, _02347F7C @ =0x0235AB48
	mov r7, r0
	ldr r0, [r1]
	mov r6, #0
	add r2, r0, r7, lsl #8
	ldrb r5, [r2, #0xe7]
	add r0, sp, #4
	mov r1, r6
	mov r2, #0x10
	mov r4, #1
	bl FUN_0207C40C
	add r0, sp, #4
	mov r2, r4
	str r2, [r0, r7, lsl #2]
	cmp r7, #2
	bgt _02347EF4
	ldr r0, _02347F7C @ =0x0235AB48
	ldr r0, [r0]
	ldrb r1, [r0, #0xef]
	tst r1, r4, lsl r7
	movne r6, r2
	cmp r5, #0xff
	bne _02347EB8
	cmp r6, #0
	beq _02347EB8
	ldrb r1, [r0, #0xef]
	mvn r3, r4, lsl r7
	and r2, r1, r3
	ldr r1, _02347F7C @ =0x0235AB48
	strb r2, [r0, #0xef]
	ldr r2, [r1]
	mov r0, #1
	ldrb r1, [r2, #0x1ef]
	and r1, r1, r3
	strb r1, [r2, #0x1ef]
	str r0, [sp, #8]
	str r0, [sp, #4]
	b _02347EF4
_02347EB8:
	cmp r5, #0xff
	beq _02347EF4
	cmp r6, #0
	bne _02347EF4
	ldrb r3, [r0, #0xef]
	ldr r1, _02347F7C @ =0x0235AB48
	mov r2, #1
	orr r3, r3, r4, lsl r7
	strb r3, [r0, #0xef]
	ldr r1, [r1]
	ldrb r0, [r1, #0x1ef]
	orr r0, r0, r4, lsl r7
	strb r0, [r1, #0x1ef]
	str r2, [sp, #8]
	str r2, [sp, #4]
_02347EF4:
	mov r6, #0
	ldr r8, _02347F7C @ =0x0235AB48
	mov r7, r6
	mov r4, #0xfe
	add r5, sp, #4
_02347F08:
	ldr r0, [r5, r6, lsl #2]
	cmp r0, #0
	beq _02347F38
	ldr r1, [r8]
	mov r2, r4
	add r0, r1, #0xf8
	add r0, r0, #0x400
	add r1, r1, r7
	bl FUN_02085158
	ldr r1, [r8]
	add r1, r1, r6, lsl #8
	strh r0, [r1, #0xfe]
_02347F38:
	add r6, r6, #1
	cmp r6, #4
	add r7, r7, #0x100
	blt _02347F08
	mov r0, #0x100
	mov r1, #0x20
	bl ov02_0234E7B4
	mov r2, r0
	ldr r0, _02347F7C @ =0x0235AB48
	add r1, sp, #4
	ldr r0, [r0]
	str r2, [sp]
	bl FUN_022ED68C
	add r0, sp, #0
	bl ov02_0234E7D8
	add sp, sp, #0x14
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02347F7C: .4byte 0x0235AB48
	arm_func_end ov02_02347E18

	arm_func_start ov02_02347F80
ov02_02347F80: @ 0x02347F80
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl FUN_0207C40C
	mov r7, #0
	mov r8, r7
	mov r4, #0x20
	add r6, sp, #0
	mov r5, #3
	mov fp, r7
_02347FB4:
	mov r1, r6
	mov r2, r5
	add r0, sl, r8
	bl FUN_0207C4C8
	mov r1, fp
	mov r2, r6
_02347FCC:
	ldrb r0, [r2]
	cmp r0, #0
	bne _02347FE8
	add r1, r1, #1
	cmp r1, #3
	strb r4, [r2], #1
	blt _02347FCC
_02347FE8:
	mov r0, r6
	bl FUN_0208B360
	strb r0, [sb, r7]
	add r7, r7, #1
	cmp r7, #4
	add r8, r8, #3
	blt _02347FB4
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_02347F80

	arm_func_start ov02_02348008
ov02_02348008: @ 0x02348008
	cmp r0, #0x39
	subls r0, r0, #0x30
	bxls lr
	cmp r0, #0x46
	subls r0, r0, #0x37
	subhi r0, r0, #0x57
	bx lr
	arm_func_end ov02_02348008

	arm_func_start ov02_02348024
ov02_02348024: @ 0x02348024
	push {r3, lr}
	mov r0, #0xa0
	mov r1, #4
	bl ov02_0234E7B4
	ldr r2, _023480A8 @ =0x0235AB4C
	add r1, sp, #0
	str r0, [r2]
	ldr r0, _023480AC @ =0x02353D54
	mov r2, #0x20
	bl ov02_0234CE84
	ldr r1, _023480A8 @ =0x0235AB4C
	ldr r1, [r1]
	str r0, [r1, #0x98]
	bl ov02_0232BD18
	ldr r0, _023480A8 @ =0x0235AB4C
	ldr r0, [r0]
	ldr r1, [r0, #0x98]
	bl ov02_0232CAC0
	mov r0, #0
	bl ov02_0232D7B0
	ldr r0, _023480A8 @ =0x0235AB4C
	ldr r0, [r0]
	add r0, r0, #0x94
	bl ov02_0232BF78
	mov r0, #0
	ldr r1, _023480B0 @ =0x02348168
	mov r2, r0
	mov r3, #0xc8
	bl ov02_0234FA98
	ldr r1, _023480A8 @ =0x0235AB4C
	ldr r1, [r1]
	str r0, [r1, #0x9c]
	pop {r3, pc}
	.align 2, 0
_023480A8: .4byte 0x0235AB4C
_023480AC: .4byte 0x02353D54
_023480B0: .4byte 0x02348168
	arm_func_end ov02_02348024

	arm_func_start ov02_023480B4
ov02_023480B4: @ 0x023480B4
	push {r3, lr}
	ldr r1, _023480D8 @ =0x0235AB4C
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x9c]
	bl ov02_0234FB40
	ldr r0, _023480DC @ =0x0235AB4C
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_023480D8: .4byte 0x0235AB4C
_023480DC: .4byte 0x0235AB4C
	arm_func_end ov02_023480B4

	arm_func_start ov02_023480E0
ov02_023480E0: @ 0x023480E0
	ldr r1, _023480FC @ =0x0235AB4C
	mov r2, r0
	ldr r0, [r1]
	ldr ip, _02348100 @ =ov02_0232D84C
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_023480FC: .4byte 0x0235AB4C
_02348100: .4byte ov02_0232D84C
	arm_func_end ov02_023480E0

	arm_func_start ov02_02348104
ov02_02348104: @ 0x02348104
	ldr r2, _0234811C @ =0x0235AB4C
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02348120 @ =FUN_0232BFA4
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_0234811C: .4byte 0x0235AB4C
_02348120: .4byte FUN_0232BFA4
	arm_func_end ov02_02348104

	arm_func_start ov02_02348124
ov02_02348124: @ 0x02348124
	ldr r2, _02348140 @ =0x0235AB4C
	ldr ip, _02348144 @ =ov02_0232BFEC
	ldr r3, [r2]
	mov r2, r1
	mov r1, r0
	add r0, r3, #0x94
	bx ip
	.align 2, 0
_02348140: .4byte 0x0235AB4C
_02348144: .4byte ov02_0232BFEC
	arm_func_end ov02_02348124

	arm_func_start ov02_02348148
ov02_02348148: @ 0x02348148
	ldr r0, _02348160 @ =0x0235AB4C
	ldr ip, _02348164 @ =FUN_0232BF68
	ldr r0, [r0]
	mov r1, #0
	add r0, r0, #0x94
	bx ip
	.align 2, 0
_02348160: .4byte 0x0235AB4C
_02348164: .4byte FUN_0232BF68
	arm_func_end ov02_02348148
_02348168:
	.byte 0x00, 0xC0, 0x9F, 0xE5, 0x1C, 0xFF, 0x2F, 0xE1
	.byte 0xA0, 0xBD, 0x32, 0x02

	arm_func_start ov02_02348174
ov02_02348174: @ 0x02348174
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov r0, #0x1c
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, [sp]
	ldr r4, _0234825C @ =0x0235AB50
	add r3, r1, r1, lsl #2
	ldr r2, _02348260 @ =0x02352DC8
	ldr r1, _02348264 @ =0x02352DD7
	mov r8, #0
	mvn r7, #0
	ldr r5, _02348268 @ =0x02352DE6
	str r0, [r4, #4]
	add sb, r2, r3
	add sl, r1, r3
	sub r6, r7, #0x29
	mov fp, r8
_023481BC:
	ldrb r1, [sb], #1
	mov r0, #1
	mov r2, r0
	bl ov02_0234D6D8
	ldr r2, [r4, #4]
	mov r1, r7
	str r0, [r2, r8, lsl #2]
	ldr r0, [r4, #4]
	mov r2, fp
	ldr r0, [r0, r8, lsl #2]
	bl ov02_0234D530
	ldr r0, [r4, #4]
	add r3, r5, r8, lsl #2
	ldrh r3, [r3, #2]
	ldr r0, [r0, r8, lsl #2]
	mov r1, r7
	mov r2, r6
	bl ov02_0234D440
	ldr r0, [r4, #4]
	ldrb r3, [sl], #1
	ldr r0, [r0, r8, lsl #2]
	mov r1, r7
	mov r2, #0
	bl ov02_0234D3C0
	add r8, r8, #1
	cmp r8, #5
	blt _023481BC
	mov r0, #0
	ldr r1, _0234826C @ =ov02_02348270
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _0234825C @ =0x0235AB50
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	ldr r0, [sp]
	bl ov02_02348C1C
	mov r0, #0xd
	bl ov02_023480E0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234825C: .4byte 0x0235AB50
_02348260: .4byte 0x02352DC8
_02348264: .4byte 0x02352DD7
_02348268: .4byte 0x02352DE6
_0234826C: .4byte ov02_02348270
	arm_func_end ov02_02348174

	arm_func_start ov02_02348270
ov02_02348270: @ 0x02348270
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348348 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x20
	blt _023482B4
	cmp r0, #0x100
	ble _023482F4
_023482B4:
	ldr r5, _0234834C @ =0x02352DE6
	ldr r4, _02348348 @ =0x0235AB50
	mov r7, #0
	mvn r6, #0
_023482C4:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _023482C4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_023482F4:
	mov r0, #0x20
	ldr r6, _0234834C @ =0x02352DE6
	ldr r5, _02348348 @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #0
	mvn r7, #0
_0234830C:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _0234830C
	ldr r1, _02348350 @ =ov02_02348354
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348348: .4byte 0x0235AB50
_0234834C: .4byte 0x02352DE6
_02348350: .4byte ov02_02348354
	arm_func_end ov02_02348270

	arm_func_start ov02_02348354
ov02_02348354: @ 0x02348354
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _0234842C @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #4]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x50
	blt _02348398
	cmp r0, #0x100
	ble _023483D8
_02348398:
	ldr r5, _02348430 @ =0x02352DE6
	ldr r4, _0234842C @ =0x0235AB50
	mov r7, #1
	mvn r6, #0
_023483A8:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _023483A8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_023483D8:
	mov r0, #0x50
	ldr r6, _02348430 @ =0x02352DE6
	ldr r5, _0234842C @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #1
	mvn r7, #0
_023483F0:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _023483F0
	ldr r1, _02348434 @ =ov02_02348438
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234842C: .4byte 0x0235AB50
_02348430: .4byte 0x02352DE6
_02348434: .4byte ov02_02348438
	arm_func_end ov02_02348354

	arm_func_start ov02_02348438
ov02_02348438: @ 0x02348438
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348510 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x68
	blt _0234847C
	cmp r0, #0x100
	ble _023484BC
_0234847C:
	ldr r5, _02348514 @ =0x02352DE6
	ldr r4, _02348510 @ =0x0235AB50
	mov r7, #2
	mvn r6, #0
_0234848C:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _0234848C
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_023484BC:
	mov r0, #0x68
	ldr r6, _02348514 @ =0x02352DE6
	ldr r5, _02348510 @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #2
	mvn r7, #0
_023484D4:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _023484D4
	ldr r1, _02348518 @ =ov02_0234851C
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348510: .4byte 0x0235AB50
_02348514: .4byte 0x02352DE6
_02348518: .4byte ov02_0234851C
	arm_func_end ov02_02348438

	arm_func_start ov02_0234851C
ov02_0234851C: @ 0x0234851C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _023485F4 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0xc]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	add r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x98
	blt _02348560
	cmp r0, #0x100
	ble _023485A0
_02348560:
	ldr r5, _023485F8 @ =0x02352DE6
	ldr r4, _023485F4 @ =0x0235AB50
	mov r7, #3
	mvn r6, #0
_02348570:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _02348570
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_023485A0:
	mov r0, #0x98
	ldr r6, _023485F8 @ =0x02352DE6
	ldr r5, _023485F4 @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #3
	mvn r7, #0
_023485B8:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _023485B8
	ldr r1, _023485FC @ =ov02_02348600
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023485F4: .4byte 0x0235AB50
_023485F8: .4byte 0x02352DE6
_023485FC: .4byte ov02_02348600
	arm_func_end ov02_0234851C

	arm_func_start ov02_02348600
ov02_02348600: @ 0x02348600
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02348698 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0x10]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	add r2, r0, #8
	str r2, [sp, #4]
	cmp r2, #0xb0
	blt _02348644
	cmp r2, #0x100
	ble _02348664
_02348644:
	ldr r0, _02348698 @ =0x0235AB50
	mvn r1, #0
	ldr r0, [r0, #4]
	mov r3, #0x21
	ldr r0, [r0, #0x10]
	bl ov02_0234D440
	add sp, sp, #8
	pop {r4, pc}
_02348664:
	ldr r0, _02348698 @ =0x0235AB50
	mov r2, #0xb0
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0xb1
	mov r3, #0x21
	bl ov02_0234D440
	ldr r1, _0234869C @ =0x023486A0
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02348698: .4byte 0x0235AB50
_0234869C: .4byte 0x023486A0
	arm_func_end ov02_02348600
_023486A0:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x00, 0x10, 0xA0, 0xE1, 0x00, 0x00, 0xA0, 0xE3, 0x23, 0x1D, 0x00, 0xEB
	.byte 0x0C, 0x00, 0x9F, 0xE5, 0x00, 0x10, 0xA0, 0xE3, 0x04, 0x00, 0x90, 0xE5, 0x14, 0x10, 0x80, 0xE5
	.byte 0x08, 0x80, 0xBD, 0xE8, 0x50, 0xAB, 0x35, 0x02

	arm_func_start ov02_023486C8
ov02_023486C8: @ 0x023486C8
	push {r3, lr}
	ldr r1, _02348700 @ =0x0235AB50
	mov r0, #0
	ldr ip, [r1, #4]
	mov lr, #1
	ldr r1, _02348704 @ =ov02_023487F0
	mov r2, r0
	mov r3, #0x78
	strb lr, [ip, #0x18]
	bl ov02_0234FA98
	ldr r1, _02348700 @ =0x0235AB50
	ldr r1, [r1, #4]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_02348700: .4byte 0x0235AB50
_02348704: .4byte ov02_023487F0
	arm_func_end ov02_023486C8

	arm_func_start ov02_02348708
ov02_02348708: @ 0x02348708
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	add r2, r0, r0, lsl #2
	ldr r1, _023487C0 @ =0x02352DC8
	ldr r0, _023487C4 @ =0x02352DD7
	mov r8, #0
	ldr r5, _023487C8 @ =0x02352DE6
	ldr r4, _023487CC @ =0x0235AB50
	add sb, r1, r2
	add sl, r0, r2
	mov r7, r8
	mov fp, #1
	mvn r6, #0
_0234873C:
	ldr r0, [r4, #4]
	mov r1, r7
	ldr r0, [r0, r8, lsl #2]
	bl ov02_0234D308
	mov r2, r0
	ldrb r1, [sb], #2
	mov r0, fp
	bl ov02_0234D618
	ldr r0, [r4, #4]
	mov r1, r6
	ldr r0, [r0, r8, lsl #2]
	mov r2, #0
	bl ov02_0234D530
	ldr r0, [r4, #4]
	lsl r1, r8, #2
	add r3, r5, r8, lsl #2
	ldrh r2, [r5, r1]
	ldrh r3, [r3, #2]
	ldr r0, [r0, r8, lsl #2]
	mov r1, r6
	bl ov02_0234D440
	ldr r0, [r4, #4]
	ldrb r3, [sl], #2
	ldr r0, [r0, r8, lsl #2]
	mov r1, r6
	mov r2, #0
	bl ov02_0234D3C0
	add r8, r8, #2
	cmp r8, #5
	blt _0234873C
	ldr r0, [sp]
	bl ov02_02348C1C
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023487C0: .4byte 0x02352DC8
_023487C4: .4byte 0x02352DD7
_023487C8: .4byte 0x02352DE6
_023487CC: .4byte 0x0235AB50
	arm_func_end ov02_02348708

	arm_func_start ov02_023487D0
ov02_023487D0: @ 0x023487D0
	ldr r0, _023487EC @ =0x0235AB50
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_023487EC: .4byte 0x0235AB50
	arm_func_end ov02_023487D0

	arm_func_start ov02_023487F0
ov02_023487F0: @ 0x023487F0
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _0234887C @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0x10]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	mov r3, #0x21
	sub r2, r0, #8
	str r2, [sp, #4]
	cmp r2, #0x98
	ble _0234884C
	ldr r0, _0234887C @ =0x0235AB50
	mvn r1, #0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x10]
	bl ov02_0234D440
	add sp, sp, #8
	pop {r4, pc}
_0234884C:
	ldr r0, _0234887C @ =0x0235AB50
	mov r2, #0x98
	ldr r0, [r0, #4]
	str r2, [sp, #4]
	ldr r0, [r0, #0x10]
	sub r1, r2, #0x99
	bl ov02_0234D440
	ldr r1, _02348880 @ =ov02_02348884
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0234887C: .4byte 0x0235AB50
_02348880: .4byte ov02_02348884
	arm_func_end ov02_023487F0

	arm_func_start ov02_02348884
ov02_02348884: @ 0x02348884
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348954 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #0xc]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x68
	ble _02348900
	ldr r5, _02348958 @ =0x02352DE6
	ldr r4, _02348954 @ =0x0235AB50
	mov r7, #3
	mvn r6, #0
_023488D0:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _023488D0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_02348900:
	mov r0, #0x68
	ldr r6, _02348958 @ =0x02352DE6
	ldr r5, _02348954 @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #3
	mvn r7, #0
_02348918:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _02348918
	ldr r1, _0234895C @ =ov02_02348960
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348954: .4byte 0x0235AB50
_02348958: .4byte 0x02352DE6
_0234895C: .4byte ov02_02348960
	arm_func_end ov02_02348884

	arm_func_start ov02_02348960
ov02_02348960: @ 0x02348960
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348A30 @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #8]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x50
	ble _023489DC
	ldr r5, _02348A34 @ =0x02352DE6
	ldr r4, _02348A30 @ =0x0235AB50
	mov r7, #2
	mvn r6, #0
_023489AC:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _023489AC
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_023489DC:
	mov r0, #0x50
	ldr r6, _02348A34 @ =0x02352DE6
	ldr r5, _02348A30 @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #2
	mvn r7, #0
_023489F4:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _023489F4
	ldr r1, _02348A38 @ =ov02_02348A3C
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348A30: .4byte 0x0235AB50
_02348A34: .4byte 0x02352DE6
_02348A38: .4byte ov02_02348A3C
	arm_func_end ov02_02348960

	arm_func_start ov02_02348A3C
ov02_02348A3C: @ 0x02348A3C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348B0C @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0, #4]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	sub r0, r0, #8
	str r0, [sp, #4]
	cmp r0, #0x20
	ble _02348AB8
	ldr r5, _02348B10 @ =0x02352DE6
	ldr r4, _02348B0C @ =0x0235AB50
	mov r7, #1
	mvn r6, #0
_02348A88:
	add r0, r5, r7, lsl #2
	ldr r1, [r4, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r7, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r6
	bl ov02_0234D440
	add r7, r7, #1
	cmp r7, #5
	blt _02348A88
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
_02348AB8:
	mov r0, #0x20
	ldr r6, _02348B10 @ =0x02352DE6
	ldr r5, _02348B0C @ =0x0235AB50
	str r0, [sp, #4]
	mov r8, #1
	mvn r7, #0
_02348AD0:
	add r0, r6, r8, lsl #2
	ldr r1, [r5, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r8, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r7
	bl ov02_0234D440
	add r8, r8, #1
	cmp r8, #5
	blt _02348AD0
	ldr r1, _02348B14 @ =ov02_02348B18
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348B0C: .4byte 0x0235AB50
_02348B10: .4byte 0x02352DE6
_02348B14: .4byte ov02_02348B18
	arm_func_end ov02_02348A3C

	arm_func_start ov02_02348B18
ov02_02348B18: @ 0x02348B18
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r1, _02348BE0 @ =0x0235AB50
	mov r5, r0
	ldr r0, [r1, #4]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp, #4]
	ldr r7, _02348BE4 @ =0x02352DE6
	sub r0, r0, #8
	ldr r6, _02348BE0 @ =0x0235AB50
	mov r4, #0
	str r0, [sp, #4]
	mvn r8, #0
_02348B5C:
	add r0, r7, r4, lsl #2
	ldr r1, [r6, #4]
	ldrh r3, [r0, #2]
	ldr r0, [r1, r4, lsl #2]
	ldr r2, [sp, #4]
	mov r1, r8
	bl ov02_0234D440
	add r4, r4, #1
	cmp r4, #5
	blt _02348B5C
	ldr r1, [sp, #4]
	ldr r0, _02348BE8 @ =0x000001D6
	cmp r1, r0
	addgt sp, sp, #8
	popgt {r4, r5, r6, r7, r8, pc}
	cmp r1, #0x100
	addlt sp, sp, #8
	poplt {r4, r5, r6, r7, r8, pc}
	mov r1, r5
	mov r0, #0
	bl ov02_0234FB40
	ldr r4, _02348BE0 @ =0x0235AB50
	mov r5, #0
_02348BB8:
	ldr r0, [r4, #4]
	ldr r0, [r0, r5, lsl #2]
	bl ov02_0234D288
	add r5, r5, #1
	cmp r5, #5
	blt _02348BB8
	ldr r0, _02348BEC @ =0x0235AB54
	bl ov02_0234E7D8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02348BE0: .4byte 0x0235AB50
_02348BE4: .4byte 0x02352DE6
_02348BE8: .4byte 0x000001D6
_02348BEC: .4byte 0x0235AB54
	arm_func_end ov02_02348B18

	arm_func_start ov02_02348BF0
ov02_02348BF0: @ 0x02348BF0
	ldr r0, _02348C18 @ =0x0235AB50
	ldr r0, [r0, #4]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02348C18: .4byte 0x0235AB50
	arm_func_end ov02_02348BF0

	arm_func_start ov02_02348C1C
ov02_02348C1C: @ 0x02348C1C
	push {r3, lr}
	ldr r1, _02348C58 @ =0x02353DD0
	ldr r0, [r1, r0, lsl #2]
	bl ov02_02334D48
	mov r1, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r2, _02348C5C @ =0x0235AB50
	ldr r1, _02348C60 @ =ov02_02348C64
	str r0, [r2]
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	pop {r3, pc}
	.align 2, 0
_02348C58: .4byte 0x02353DD0
_02348C5C: .4byte 0x0235AB50
_02348C60: .4byte ov02_02348C64
	arm_func_end ov02_02348C1C

	arm_func_start ov02_02348C64
ov02_02348C64: @ 0x02348C64
	push {r4, lr}
	ldr r1, _02348CAC @ =0x0235AB50
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x600
	bl FUN_0207A2DC
	ldr r0, _02348CAC @ =0x0235AB50
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x600
	bl FUN_02078070
	ldr r0, _02348CAC @ =0x0235AB50
	ldr r0, [r0]
	bl ov02_0234CF78
	mov r1, r4
	mov r0, #1
	bl ov02_0234FB40
	pop {r4, pc}
	.align 2, 0
_02348CAC: .4byte 0x0235AB50
	arm_func_end ov02_02348C64

	arm_func_start ov02_02348CB0
ov02_02348CB0: @ 0x02348CB0
	push {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r0
	ldr r0, _02348E18 @ =0x00001BA0
	mov r1, #0x20
	bl ov02_0234E7B4
	ldr r2, _02348E1C @ =0x0235AB58
	add r1, r0, #0x1000
	str r0, [r2]
	str r4, [r1, #0x370]
	bl FUN_0207AE44
	ldr r4, _02348E1C @ =0x0235AB58
	mov r2, #3
	ldr r3, [r4]
	add r3, r3, #0x1000
	str r0, [r3, #0xb88]
	str r1, [r3, #0xb8c]
	ldr r0, [r4]
	ldr r1, _02348E20 @ =ov02_02348F64
	bl FUN_022BFB14
	cmp r0, #2
	bne _02348E04
_02348D08:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_022BF3E0
	ldr ip, [r4]
	add r0, ip, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _02348D08
	add r0, ip, #0x374
	ldr r5, _02348E24 @ =0x02352E10
	add lr, r0, #0x1000
	mov r4, #4
_02348D3C:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02348D3C
	ldr r0, [r5]
	add r1, ip, #0xf00
	str r0, [lr]
	add r0, ip, #0x1000
	str r1, [r0, #0x374]
	bl FUN_022BF780
	ldr r1, _02348E1C @ =0x0235AB58
	ldr r1, [r1]
	add r1, r1, #0x1300
	strh r0, [r1, #0x7c]
	add r0, sp, #0
	bl FUN_0207BA08
	ldr r1, _02348E1C @ =0x0235AB58
	ldr r0, _02348E28 @ =0x02352E04
	ldr r1, [r1]
	mov r2, #8
	add r1, r1, #0x388
	add r1, r1, #0x1000
	bl FUN_0207C4C8
	ldr r2, _02348E1C @ =0x0235AB58
	mov r3, #1
	ldr r1, [r2]
	add r0, sp, #4
	add r1, r1, #0x1000
	strb r3, [r1, #0x391]
	ldr r1, [r2]
	ldrh r2, [sp, #0x1a]
	add r1, r1, #0x394
	add r1, r1, #0x1000
	lsl r2, r2, #1
	bl FUN_0207C4C8
	bl ov02_02348E34
	cmp r0, #0
	beq _02348E04
	mov r0, #0
	ldr r1, _02348E2C @ =ov02_02349258
	mov r2, r0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02348E1C @ =0x0235AB58
	add sp, sp, #0x54
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0xb90]
	mov r0, #1
	pop {r4, r5, pc}
_02348E04:
	ldr r0, _02348E30 @ =0x0235AB58
	bl ov02_0234E7D8
	mov r0, #0
	add sp, sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_02348E18: .4byte 0x00001BA0
_02348E1C: .4byte 0x0235AB58
_02348E20: .4byte ov02_02348F64
_02348E24: .4byte 0x02352E10
_02348E28: .4byte 0x02352E04
_02348E2C: .4byte ov02_02349258
_02348E30: .4byte 0x0235AB58
	arm_func_end ov02_02348CB0

	arm_func_start ov02_02348E34
ov02_02348E34: @ 0x02348E34
	push {r3, lr}
	ldr r1, _02348E60 @ =0x0235AB58
	ldr r0, _02348E64 @ =ov02_02348F64
	ldr r1, [r1]
	add r1, r1, #0x374
	add r1, r1, #0x1000
	bl FUN_022BFED8
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	pop {r3, pc}
	.align 2, 0
_02348E60: .4byte 0x0235AB58
_02348E64: .4byte ov02_02348F64
	arm_func_end ov02_02348E34

	arm_func_start ov02_02348E68
ov02_02348E68: @ 0x02348E68
	push {r4, lr}
	ldr r1, _02348F40 @ =0x0235AB58
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x1000
	strb r2, [r0, #0xb94]
	ldr r0, [r1]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_022BF3E0
	ldr r0, _02348F40 @ =0x0235AB58
	ldr r0, [r0]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	beq _02348EE4
	ldr r0, _02348F44 @ =ov02_02348F64
	bl FUN_022BFB9C
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r4, _02348F40 @ =0x0235AB58
_02348EC0:
	ldr r0, [r4]
	add r0, r0, #0x3b8
	add r0, r0, #0x1000
	bl FUN_022BF3E0
	ldr r0, [r4]
	add r0, r0, #0x1300
	ldrh r0, [r0, #0xb8]
	cmp r0, #2
	bne _02348EC0
_02348EE4:
	ldr r0, _02348F44 @ =ov02_02348F64
	bl FUN_022BFBD4
	cmp r0, #2
	movne r0, #0
	popne {r4, pc}
	ldr r0, _02348F40 @ =0x0235AB58
	ldr r0, [r0]
	add r0, r0, #0x1000
	ldr r1, [r0, #0xb90]
	cmp r1, #0
	beq _02348F18
	mov r0, #0
	bl ov02_0234FB6C
_02348F18:
	ldr r0, _02348F40 @ =0x0235AB58
	ldr r0, [r0]
	add r0, r0, #0x1000
_02348F24:
	ldrb r1, [r0, #0xb94]
	cmp r1, #2
	bne _02348F24
	ldr r0, _02348F48 @ =0x0235AB58
	bl ov02_0234E7D8
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_02348F40: .4byte 0x0235AB58
_02348F44: .4byte ov02_02348F64
_02348F48: .4byte 0x0235AB58
	arm_func_end ov02_02348E68

	arm_func_start ov02_02348F4C
ov02_02348F4C: @ 0x02348F4C
	ldr r1, _02348F60 @ =0x0235AB58
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r0, [r1, #0x370]
	bx lr
	.align 2, 0
_02348F60: .4byte 0x0235AB58
	arm_func_end ov02_02348F4C

	arm_func_start ov02_02348F64
ov02_02348F64: @ 0x02348F64
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	popne {r3, pc}
	ldr r1, _02348FF0 @ =0x0235AB58
	ldr r1, [r1]
	add r1, r1, #0x1000
	ldrb r2, [r1, #0xb94]
	cmp r2, #0
	beq _02348FA0
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #2
	strbeq r0, [r1, #0xb94]
	pop {r3, pc}
_02348FA0:
	ldrh r2, [r0]
	cmp r2, #0x26
	popne {r3, pc}
	ldrh r2, [r0, #8]
	cmp r2, #4
	beq _02348FE0
	cmp r2, #5
	bne _02348FE8
	ldrb r1, [r1, #0xb96]
	cmp r1, #0
	beq _02348FD4
	bl ov02_0234914C
	b _02348FD8
_02348FD4:
	bl ov02_02348FF4
_02348FD8:
	bl ov02_02348E34
	pop {r3, pc}
_02348FE0:
	bl ov02_02348E34
	pop {r3, pc}
_02348FE8:
	bl FUN_0207BC20
	pop {r3, pc}
	.align 2, 0
_02348FF0: .4byte 0x0235AB58
	arm_func_end ov02_02348F64

	arm_func_start ov02_02348FF4
ov02_02348FF4: @ 0x02348FF4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	ldrh r0, [fp, #0xe]
	mov r7, #0
	cmp r0, #0
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0234900C:
	add r0, fp, r7, lsl #2
	ldr r6, [r0, #0x10]
	mov r1, #0xc0
	mov r0, r6
	bl FUN_0207A2A4
	ldr r1, _02349140 @ =0x02352E04
	add r0, r6, #0xc
	mov r2, #8
	bl FUN_02087348
	cmp r0, #0
	bne _0234912C
	ldr r0, _02349144 @ =0x0235AB58
	mov r5, #0
	ldr sb, [r0]
	mov r4, #6
	add r8, sb, #0x1300
_0234904C:
	mov r1, r8
	mov r2, r4
	add r0, r6, #4
	bl FUN_02087348
	cmp r0, #0
	bne _023490A4
	rsb r0, r5, r5, lsl #3
	add r0, sb, r0
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	bne _0234912C
	ldrb r0, [r6, #0x15]
	tst r0, #1
	beq _0234912C
	add r0, sb, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_023490A4:
	add r5, r5, #1
	cmp r5, #0x10
	add r8, r8, #7
	blt _0234904C
	ldr r5, _02349148 @ =0x02352DFC
	add r8, sb, #0x1300
	mov sl, #0
	mov r4, #6
_023490C4:
	mov r0, r8
	mov r1, r5
	mov r2, r4
	bl FUN_02087348
	cmp r0, #0
	bne _0234911C
	rsb r4, sl, sl, lsl #3
	add r1, sb, #0x1300
	add r0, r6, #4
	add r1, r1, r4
	mov r2, #6
	bl FUN_0207C4C8
	ldrb r0, [r6, #0x15]
	tst r0, #1
	ldr r0, _02349144 @ =0x0235AB58
	movne r1, #1
	ldr r0, [r0]
	moveq r1, #0
	add r0, r0, r4
	add r0, r0, #0x1000
	strb r1, [r0, #0x306]
	b _0234912C
_0234911C:
	add sl, sl, #1
	cmp sl, #0x10
	add r8, r8, #7
	blt _023490C4
_0234912C:
	ldrh r0, [fp, #0xe]
	add r7, r7, #1
	cmp r7, r0
	blt _0234900C
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349140: .4byte 0x02352E04
_02349144: .4byte 0x0235AB58
_02349148: .4byte 0x02352DFC
	arm_func_end ov02_02348FF4

	arm_func_start ov02_0234914C
ov02_0234914C: @ 0x0234914C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _02349250 @ =0x0235AB58
	mov sl, r0
	ldr r2, [r1]
	add r1, r2, #0x1000
	ldrb r0, [r1, #0xb95]
	cmp r0, #0
	beq _02349180
	ldr r1, [r1, #0x370]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02349180:
	add r0, r2, #0xf00
	mov r1, #0x400
	bl FUN_0207A2A4
	ldrh fp, [sl, #0xe]
	mov r6, #0
	cmp fp, #0
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _02349250 @ =0x0235AB58
	mov r4, #6
	ldr sb, [r0]
_023491A8:
	add r0, sl, r6, lsl #2
	ldr r5, [r0, #0x10]
	ldr r1, _02349254 @ =0x02352E04
	mov r2, #8
	add r0, r5, #0xc
	bl FUN_02087348
	cmp r0, #0
	bne _02349240
	ldrb r0, [r5, #0x15]
	tst r0, #1
	beq _02349240
	mov r7, #0
	add r8, sb, #0x1300
_023491DC:
	mov r1, r8
	mov r2, r4
	add r0, r5, #4
	bl FUN_02087348
	cmp r0, #0
	bne _02349230
	rsb r0, r7, r7, lsl #3
	add r0, sb, r0
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	bne _02349240
	add r0, sb, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	moveq r1, #1
	strbeq r1, [r0, #0xb95]
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	blx r1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02349230:
	add r7, r7, #1
	cmp r7, #0x10
	add r8, r8, #7
	blt _023491DC
_02349240:
	add r6, r6, #1
	cmp r6, fp
	blt _023491A8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349250: .4byte 0x0235AB58
_02349254: .4byte 0x02352E04
	arm_func_end ov02_0234914C

	arm_func_start ov02_02349258
ov02_02349258: @ 0x02349258
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	bl FUN_0207AE44
	ldr r2, _02349388 @ =0x0235AB58
	ldr r3, _0234938C @ =0x0017F898
	ldr sl, [r2]
	mov r7, #0
	add r2, sl, #0x1000
	ldr r4, [r2, #0xb88]
	ldr r2, [r2, #0xb8c]
	adds r3, r4, r3
	adc r2, r2, #0
	cmp r1, r2
	cmpeq r0, r3
	poplo {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, _02349390 @ =0x02352DFC
	mov r6, r7
	mov r5, r7
	mov sb, sl
	add r8, sl, #0x1300
	mov fp, #6
_023492AC:
	mov r0, r8
	mov r1, r4
	mov r2, fp
	bl FUN_02087348
	cmp r0, #0
	beq _023492D8
	add r0, sb, #0x1000
	ldrb r0, [r0, #0x306]
	cmp r0, #0
	movne r6, #1
	moveq r7, #1
_023492D8:
	add r5, r5, #1
	cmp r5, #0x10
	add r8, r8, #7
	add sb, sb, #7
	blt _023492AC
	cmp r6, #0
	cmpne r7, #0
	beq _02349314
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _02349358
	mov r0, #2
	blx r1
	b _02349358
_02349314:
	cmp r6, #0
	beq _02349338
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _02349358
	mov r0, #1
	blx r1
	b _02349358
_02349338:
	cmp r7, #0
	bne _02349358
	add r0, sl, #0x1000
	ldr r1, [r0, #0x370]
	cmp r1, #0
	beq _02349358
	mov r0, #0
	blx r1
_02349358:
	ldr r3, _02349388 @ =0x0235AB58
	mov r0, #0
	ldr r2, [r3]
	ldr r1, [sp]
	add r2, r2, #0x1000
	str r0, [r2, #0xb90]
	ldr r2, [r3]
	mov r3, #1
	add r2, r2, #0x1000
	strb r3, [r2, #0xb96]
	bl ov02_0234FB40
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349388: .4byte 0x0235AB58
_0234938C: .4byte 0x0017F898
_02349390: .4byte 0x02352DFC
	arm_func_end ov02_02349258

	arm_func_start ov02_02349394
ov02_02349394: @ 0x02349394
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r5, _02349690 @ =0x02352E54
	ldr r4, _02349694 @ =0x0235AA98
	ldrb sl, [r5, #4]
	ldrb sb, [r5, #5]
	ldrb r8, [r5, #6]
	ldrb r7, [r5, #7]
	ldrb r6, [r5, #8]
	ldrb r5, [r5, #9]
	strb sl, [sp, #0x1c]
	mov fp, r0
	str r2, [sp, #0x10]
	mov r2, r3
	mov sl, r1
	ldr r0, [r4]
	ldr r3, [sp, #0x48]
	mov r1, fp
	strb sb, [sp, #0x1d]
	strb r8, [sp, #0x1e]
	strb r7, [sp, #0x1f]
	strb r6, [sp, #0x20]
	strb r5, [sp, #0x21]
	bl ov02_02338F74
	str r0, [sp, #0x14]
	mov r0, #0x20
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _02349698 @ =0x0235AB5C
	mvn r3, #1
	str r0, [r1]
	strb sl, [r0, #0x1c]
	ldr r2, [r1]
	ldr r0, _0234969C @ =0x04000050
	strb r3, [r2, #0x1b]
	ldr r3, [r1]
	ldr r2, [sp, #0x10]
	mov r1, #0x1f
	strb r2, [r3, #0x1e]
	mov r2, #0
	bl FUN_02077704
	ldr r1, _023496A0 @ =0x02352F08
	mov r0, #0
	ldrb r1, [r1, sl]
	mov r2, r0
	bl ov02_0234D6D8
	ldr r3, _02349698 @ =0x0235AB5C
	mvn r1, #0
	ldr r4, [r3]
	mov r2, #0x100
	str r0, [r4]
	ldr r0, [r3]
	mov r3, #0
	ldr r0, [r0]
	bl ov02_0234D440
	ldr r0, _02349698 @ =0x0235AB5C
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	ldr r0, [r0]
	bl ov02_0234D530
	ldr r7, _023496A4 @ =0x02352F10
	mov r8, #0
	ldrb r0, [r7, sl]
	cmp r0, #0
	ble _02349514
	ldr r0, _023496A8 @ =0x02352E7A
	ldr r4, _02349698 @ =0x0235AB5C
	add sb, r0, sl, lsl #1
	mvn r6, #0
	mov r5, #0x100
	mov fp, r8
_023494B4:
	ldrb r1, [sb], #1
	mov r0, #0
	mov r2, r0
	bl ov02_0234D6D8
	ldr r2, [r4]
	mov r1, r6
	add r2, r2, r8, lsl #2
	str r0, [r2, #8]
	ldr r0, [r4]
	mov r2, r5
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #8]
	mov r3, fp
	bl ov02_0234D440
	ldr r0, [r4]
	mov r1, r6
	add r0, r0, r8, lsl #2
	ldr r0, [r0, #8]
	mov r2, #0
	bl ov02_0234D530
	ldrb r0, [r7, sl]
	add r8, r8, #1
	cmp r8, r0
	blt _023494B4
_02349514:
	add r1, sp, #0x18
	str r1, [sp]
	mov r0, #0
	mov r1, #0x20
	mov r2, #0xc
	mov r3, #1
	str r0, [sp, #4]
	bl ov02_0234DCC0
	ldr r1, _02349698 @ =0x0235AB5C
	ldr r1, [r1]
	str r0, [r1, #0x10]
	mov r0, #0
	ldr r1, [sp, #0x18]
	mov r2, r0
	bl ov02_0234D12C
	ldr r1, _02349698 @ =0x0235AB5C
	ldr r1, [r1]
	str r0, [r1, #4]
	bl ov02_02334FA0
	ldr r1, _023496AC @ =0x02352E9A
	lsl r5, sl, #2
	ldrh r4, [r1, r5]
	mov r3, #2
	ldr r2, _02349698 @ =0x0235AB5C
	str r4, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	ldr r3, _023496B0 @ =0x02352E98
	str r0, [sp, #0xc]
	ldr r0, [r2]
	mov r1, #0
	ldrh r3, [r3, r5]
	ldr r0, [r0, #0x10]
	mov r2, r1
	bl ov02_0234E1E8
	ldr r0, _02349698 @ =0x0235AB5C
	mov r2, #0
	ldr r3, [r0]
	mov r1, #0x100
	str r2, [sp]
	ldr r0, [r3, #0x10]
	ldr r3, [r3, #4]
	bl ov02_0234E2BC
	mov r0, #0
	mov r1, r0
	mov r2, #0x1f
	mov r3, r0
	bl ov02_0234E598
	ldr r3, _02349698 @ =0x0235AB5C
	add r4, sp, #0x1c
	ldr r3, [r3]
	mov r0, #0
	ldrb r3, [r3, #0x1c]
	mov r1, #1
	mov r2, #0x1f
	ldrb r3, [r4, r3]
	bl ov02_0234E598
	mov r0, #0
	mov r1, #3
	mov r2, #0x1f
	mov r3, #1
	bl ov02_0234E598
	ldr r2, _023496B4 @ =0x02352E5E
	mov r0, #0
	mov r1, #1
	bl ov02_0234E480
	mov r0, #0xc0
	bl ov02_02349A30
	mov r2, #0x4000000
	ldr r0, [sp, #0x10]
	ldr r1, [r2]
	cmp r0, #0
	bic r0, r1, #0xe000
	orr r0, r0, #0x6000
	str r0, [r2]
	mov r0, #1
	mov r2, #0
	beq _02349670
	ldr r1, _023496B8 @ =ov02_02349734
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02349698 @ =0x0235AB5C
	add sp, sp, #0x24
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02349670:
	ldr r1, _023496BC @ =ov02_02349794
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02349698 @ =0x0235AB5C
	ldr r1, [r1]
	str r0, [r1, #0x14]
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349690: .4byte 0x02352E54
_02349694: .4byte 0x0235AA98
_02349698: .4byte 0x0235AB5C
_0234969C: .4byte 0x04000050
_023496A0: .4byte 0x02352F08
_023496A4: .4byte 0x02352F10
_023496A8: .4byte 0x02352E7A
_023496AC: .4byte 0x02352E9A
_023496B0: .4byte 0x02352E98
_023496B4: .4byte 0x02352E5E
_023496B8: .4byte ov02_02349734
_023496BC: .4byte ov02_02349794
	arm_func_end ov02_02349394

	arm_func_start ov02_023496C0
ov02_023496C0: @ 0x023496C0
	push {r3, lr}
	ldr r1, _023496FC @ =0x0235AB5C
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x14]
	bl ov02_0234FB40
	ldr r1, _02349700 @ =ov02_02349D24
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _023496FC @ =0x0235AB5C
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_023496FC: .4byte 0x0235AB5C
_02349700: .4byte ov02_02349D24
	arm_func_end ov02_023496C0

	arm_func_start ov02_02349704
ov02_02349704: @ 0x02349704
	ldr r0, _02349714 @ =0x0235AB5C
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
_02349714: .4byte 0x0235AB5C
	arm_func_end ov02_02349704

	arm_func_start ov02_02349718
ov02_02349718: @ 0x02349718
	ldr r0, _02349730 @ =0x0235AB5C
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_02349730: .4byte 0x0235AB5C
	arm_func_end ov02_02349718

	arm_func_start ov02_02349734
ov02_02349734: @ 0x02349734
	push {r4, lr}
	ldr r1, _02349788 @ =0x0235AB5C
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _0234978C @ =0x04000050
	ldrsb r2, [r3, #0x1a]
	sub r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl FUN_0207772C
	ldr r1, _02349788 @ =0x0235AB5C
	mvn r0, #0xb
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	cmp r1, r0
	popgt {r4, pc}
	ldr r1, _02349790 @ =ov02_02349794
	mov r0, r4
	bl ov02_0234FB38
	pop {r4, pc}
	.align 2, 0
_02349788: .4byte 0x0235AB5C
_0234978C: .4byte 0x04000050
_02349790: .4byte ov02_02349794
	arm_func_end ov02_02349734

	arm_func_start ov02_02349794
ov02_02349794: @ 0x02349794
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02349858 @ =0x0235AB5C
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	ldr r1, _02349858 @ =0x0235AB5C
	sub r0, r0, #0xc
	ldr r1, [r1]
	str r0, [sp]
	ldrb r2, [r1, #0x1c]
	ldr r1, _0234985C @ =0x02352EB2
	lsl r2, r2, #2
	ldrh r1, [r1, r2]
	cmp r0, r1
	ble _023497F4
	bl ov02_02349A30
	add sp, sp, #8
	pop {r4, pc}
_023497F4:
	mov r0, r1
	bl ov02_02349A30
	ldr r0, _02349858 @ =0x0235AB5C
	mov r3, #0x78
	ldr r0, [r0]
	ldrb r0, [r0, #0x1c]
	cmp r0, #5
	mov r0, #0
	bne _0234982C
	ldr r1, _02349860 @ =ov02_023499C4
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _02349858 @ =0x0235AB5C
	b _0234983C
_0234982C:
	ldr r1, _02349864 @ =ov02_02349868
	mov r2, r0
	bl ov02_0234FA98
	ldr r1, _02349858 @ =0x0235AB5C
_0234983C:
	ldr r1, [r1]
	str r0, [r1, #0x14]
	mov r1, r4
	mov r0, #1
	bl ov02_0234FB40
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02349858: .4byte 0x0235AB5C
_0234985C: .4byte 0x02352EB2
_02349860: .4byte ov02_023499C4
_02349864: .4byte ov02_02349868
	arm_func_end ov02_02349794

	arm_func_start ov02_02349868
ov02_02349868: @ 0x02349868
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r4, _023499A8 @ =0x0235AB5C
	ldr sb, _023499AC @ =0x02352F10
	ldr r0, [r4]
	mov sl, #0
	ldrb r1, [r0, #0x1c]
	ldrb r0, [sb, r1]
	cmp r0, #0
	ble _023498F4
	ldr r8, _023499B0 @ =0x02352EE0
	ldr r7, _023499B4 @ =0x02352E66
	ldr r6, _023499B8 @ =0x02352E84
	add r5, sp, #0
_023498A0:
	add r0, r7, r1, lsl #1
	ldrb r0, [sl, r0]
	add r3, r8, r1, lsl #3
	mov r2, r5
	add r0, r3, r0, lsl #2
	add r1, r6, r1, lsl #2
	bl ov02_0234E39C
	mov r0, r5
	bl ov02_0234ED04
	cmp r0, #0
	beq _023498DC
	ldr r0, _023499A8 @ =0x0235AB5C
	ldr r0, [r0]
	strb sl, [r0, #0x1b]
	b _023498F4
_023498DC:
	ldr r0, [r4]
	add sl, sl, #1
	ldrb r1, [r0, #0x1c]
	ldrb r0, [sb, r1]
	cmp sl, r0
	blt _023498A0
_023498F4:
	mov r0, #1
	bl ov02_0234EBBC
	cmp r0, #0
	beq _02349920
	ldr r0, _023499A8 @ =0x0235AB5C
	ldr r1, _023499BC @ =0x02352E70
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	lsl r0, r0, #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_02349920:
	mov r0, #2
	bl ov02_0234EBBC
	cmp r0, #0
	beq _0234994C
	ldr r0, _023499A8 @ =0x0235AB5C
	ldr r1, _023499C0 @ =0x02352E71
	ldr r2, [r0]
	ldrb r0, [r2, #0x1c]
	lsl r0, r0, #1
	ldrsb r0, [r1, r0]
	strb r0, [r2, #0x1b]
_0234994C:
	ldr r0, _023499A8 @ =0x0235AB5C
	ldr r2, _023499AC @ =0x02352F10
	ldr r4, [r0]
	mov r0, #0
	ldrb r1, [r4, #0x1c]
	ldrb r1, [r2, r1]
	cmp r1, #0
	ble _02349998
	ldrsb r3, [r4, #0x1b]
_02349970:
	cmp r0, r3
	bne _02349984
	bl ov02_02349C64
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02349984:
	ldrb r1, [r4, #0x1c]
	add r0, r0, #1
	ldrb r1, [r2, r1]
	cmp r0, r1
	blt _02349970
_02349998:
	mvn r0, #0
	strb r0, [r4, #0x1b]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_023499A8: .4byte 0x0235AB5C
_023499AC: .4byte 0x02352F10
_023499B0: .4byte 0x02352EE0
_023499B4: .4byte 0x02352E66
_023499B8: .4byte 0x02352E84
_023499BC: .4byte 0x02352E70
_023499C0: .4byte 0x02352E71
	arm_func_end ov02_02349868

	arm_func_start ov02_023499C4
ov02_023499C4: @ 0x023499C4
	push {r3, lr}
	ldr r2, _02349A28 @ =0x0235AB5C
	mvn ip, #0
	ldr r3, [r2]
	mov r1, r0
	strb ip, [r3, #0x1b]
	ldr r3, [r2]
	ldrh r0, [r3, #0x18]
	add r0, r0, #1
	strh r0, [r3, #0x18]
	ldr r0, [r2]
	ldrh r0, [r0, #0x18]
	cmp r0, #0x78
	poplo {r3, pc}
	mov r0, #0
	bl ov02_0234FB40
	ldr r1, _02349A2C @ =ov02_02349D24
	mov r0, #1
	mov r2, #0
	mov r3, #0x78
	bl ov02_0234FA98
	ldr r1, _02349A28 @ =0x0235AB5C
	ldr r1, [r1]
	str r0, [r1, #0x14]
	pop {r3, pc}
	.align 2, 0
_02349A28: .4byte 0x0235AB5C
_02349A2C: .4byte ov02_02349D24
	arm_func_end ov02_023499C4

	arm_func_start ov02_02349A30
ov02_02349A30: @ 0x02349A30
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _02349BBC @ =0x0235AB5C
	mov sl, r0
	ldr r0, [r1]
	ldr r1, _02349BC0 @ =0x02352EB0
	ldrb r2, [r0, #0x1c]
	ldr r0, [r0]
	mov r3, sl
	lsl r2, r2, #2
	ldrh r2, [r1, r2]
	mvn r1, #0
	bl ov02_0234D440
	ldr r0, _02349BBC @ =0x0235AB5C
	ldr r2, _02349BC0 @ =0x02352EB0
	ldr r0, [r0]
	add r3, sl, #8
	ldrb r4, [r0, #0x1c]
	ldr r0, [r0, #4]
	mvn r1, #0
	lsl r4, r4, #2
	ldrh r2, [r2, r4]
	add r2, r2, #8
	bl ov02_0234D440
	ldr r0, _02349BBC @ =0x0235AB5C
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov02_02349BD8
	ldr r0, _02349BBC @ =0x0235AB5C
	mov r1, sl
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov02_02349BD8
	ldr r4, _02349BBC @ =0x0235AB5C
	ldr r8, _02349BC4 @ =0x02352F10
	ldr r0, [r4]
	mov sb, #0
	ldrb r0, [r0, #0x1c]
	ldrb r1, [r8, r0]
	cmp r1, #0
	ble _02349B54
	ldr r7, _02349BC8 @ =0x02352E66
	ldr r5, _02349BCC @ =0x02352EE0
	ldr fp, _02349BC0 @ =0x02352EB0
	mvn r6, #0
_02349AE8:
	add r1, r7, r0, lsl #1
	ldrb ip, [sb, r1]
	add r2, r5, r0, lsl #3
	add r3, fp, r0, lsl #2
	add r0, r2, ip, lsl #2
	ldr r1, [r4]
	lsl ip, ip, #2
	ldrh r2, [ip, r2]
	ldrh r0, [r0, #2]
	add r1, r1, sb, lsl #2
	ldrh r3, [r3, #2]
	add ip, sl, r0
	ldr r0, [r1, #8]
	mov r1, r6
	sub r3, ip, r3
	bl ov02_0234D440
	ldr r0, [r4]
	mov r1, sl
	add r0, r0, sb, lsl #2
	ldr r0, [r0, #8]
	bl ov02_02349BD8
	ldr r0, [r4]
	add sb, sb, #1
	ldrb r0, [r0, #0x1c]
	ldrb r1, [r8, r0]
	cmp sb, r1
	blt _02349AE8
_02349B54:
	and r1, sl, #0xff
	cmp r1, #0xc0
	movge r3, #0
	movge r1, r3
	bge _02349B78
	ldr r2, _02349BD0 @ =0x02352ECA
	lsl r3, r0, #2
	ldrh r2, [r2, r3]
	add r3, r1, r2
_02349B78:
	ldr r4, _02349BC0 @ =0x02352EB0
	lsl r5, r0, #2
	ldr r2, _02349BD4 @ =0x02352EC8
	ldrh r0, [r4, r5]
	ldrh r2, [r2, r5]
	cmp r3, #0xc0
	add r4, sp, #4
	movgt r3, #0xc0
	add r2, r0, r2
	str r4, [sp]
	bl ov02_0234E384
	mov r0, #0
	mov r2, r4
	mov r1, r0
	bl ov02_0234E480
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349BBC: .4byte 0x0235AB5C
_02349BC0: .4byte 0x02352EB0
_02349BC4: .4byte 0x02352F10
_02349BC8: .4byte 0x02352E66
_02349BCC: .4byte 0x02352EE0
_02349BD0: .4byte 0x02352ECA
_02349BD4: .4byte 0x02352EC8
	arm_func_end ov02_02349A30

	arm_func_start ov02_02349BD8
ov02_02349BD8: @ 0x02349BD8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	bl ov02_0234D314
	mov r7, r0
	cmp r7, #0
	mov r8, #0
	addle sp, sp, #8
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0x200
	mov r4, r8
	add r6, sp, #4
	add r5, sp, #0
_02349C10:
	mov r0, sl
	mov r1, r8
	mov r2, r6
	mov r3, r5
	bl ov02_0234D590
	ldr r0, [sp]
	cmp r0, sb
	blt _02349C3C
	cmp r0, #0xc0
	movlt r2, r4
	blt _02349C40
_02349C3C:
	mov r2, fp
_02349C40:
	mov r0, sl
	mov r1, r8
	mov r3, #0
	bl ov02_0234D31C
	add r8, r8, #1
	cmp r8, r7
	blt _02349C10
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov02_02349BD8

	arm_func_start ov02_02349C64
ov02_02349C64: @ 0x02349C64
	push {r4, lr}
	ldr r1, _02349D10 @ =0x0235AB5C
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov02_0234D308
	ldr r1, _02349D10 @ =0x0235AB5C
	mov r2, r0
	ldr r0, [r1]
	ldr r1, _02349D14 @ =0x02352E7A
	ldrb r3, [r0, #0x1c]
	mov r0, #0
	add r1, r1, r3, lsl #1
	ldrb r1, [r4, r1]
	add r1, r1, #1
	bl ov02_0234D618
	ldr r0, _02349D10 @ =0x0235AB5C
	ldr r2, _02349D18 @ =0x02352E66
	ldr r0, [r0]
	ldr r1, _02349D1C @ =0x02352EE0
	ldrb lr, [r0, #0x1c]
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	add r2, r2, lr, lsl #1
	ldrb r3, [r4, r2]
	add r2, r1, lr, lsl #3
	mvn r1, #0
	lsl ip, r3, #2
	ldrh r2, [ip, r2]
	ldr r3, _02349D20 @ =0x02352EE2
	add r3, r3, lr, lsl #3
	ldrh r3, [ip, r3]
	bl ov02_0234D440
	ldr r0, _02349D10 @ =0x0235AB5C
	mvn r1, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #8]
	bl ov02_0234D530
	pop {r4, pc}
	.align 2, 0
_02349D10: .4byte 0x0235AB5C
_02349D14: .4byte 0x02352E7A
_02349D18: .4byte 0x02352E66
_02349D1C: .4byte 0x02352EE0
_02349D20: .4byte 0x02352EE2
	arm_func_end ov02_02349C64

	arm_func_start ov02_02349D24
ov02_02349D24: @ 0x02349D24
	push {r3, lr}
	ldr r1, _02349D58 @ =0x0235AB5C
	ldr r3, [r1]
	ldrb r2, [r3, #0x1d]
	add r2, r2, #1
	strb r2, [r3, #0x1d]
	ldr r1, [r1]
	ldrb r1, [r1, #0x1d]
	cmp r1, #8
	poplo {r3, pc}
	ldr r1, _02349D5C @ =ov02_02349D60
	bl ov02_0234FB38
	pop {r3, pc}
	.align 2, 0
_02349D58: .4byte 0x0235AB5C
_02349D5C: .4byte ov02_02349D60
	arm_func_end ov02_02349D24

	arm_func_start ov02_02349D60
ov02_02349D60: @ 0x02349D60
	push {r4, lr}
	sub sp, sp, #8
	ldr r1, _02349DE4 @ =0x0235AB5C
	mov r4, r0
	ldr r0, [r1]
	add r2, sp, #4
	ldr r0, [r0]
	add r3, sp, #0
	mov r1, #0
	bl ov02_0234D590
	ldr r0, [sp]
	add r0, r0, #0xc
	str r0, [sp]
	bl ov02_02349A30
	ldr r0, [sp]
	cmp r0, #0xc0
	addlt sp, sp, #8
	poplt {r4, pc}
	ldr r0, _02349DE4 @ =0x0235AB5C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	beq _02349DD0
	ldr r1, _02349DE8 @ =ov02_02349DF0
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
_02349DD0:
	ldr r1, _02349DEC @ =ov02_02349E4C
	mov r0, r4
	bl ov02_0234FB38
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_02349DE4: .4byte 0x0235AB5C
_02349DE8: .4byte ov02_02349DF0
_02349DEC: .4byte ov02_02349E4C
	arm_func_end ov02_02349D60

	arm_func_start ov02_02349DF0
ov02_02349DF0: @ 0x02349DF0
	push {r4, lr}
	ldr r1, _02349E40 @ =0x0235AB5C
	mov r4, r0
	ldr r3, [r1]
	ldr r0, _02349E44 @ =0x04000050
	ldrsb r2, [r3, #0x1a]
	add r2, r2, #1
	strb r2, [r3, #0x1a]
	ldr r1, [r1]
	ldrsb r1, [r1, #0x1a]
	bl FUN_0207772C
	ldr r0, _02349E40 @ =0x0235AB5C
	ldr r0, [r0]
	ldrsb r0, [r0, #0x1a]
	cmp r0, #0
	poplt {r4, pc}
	ldr r1, _02349E48 @ =ov02_02349E4C
	mov r0, r4
	bl ov02_0234FB38
	pop {r4, pc}
	.align 2, 0
_02349E40: .4byte 0x0235AB5C
_02349E44: .4byte 0x04000050
_02349E48: .4byte ov02_02349E4C
	arm_func_end ov02_02349DF0

	arm_func_start ov02_02349E4C
ov02_02349E4C: @ 0x02349E4C
	push {r3, r4, r5, r6, r7, lr}
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _02349EF0 @ =0x0235AB5C
	bic r2, r2, #0xe000
	str r2, [r3]
	ldr r1, [r1]
	mov r6, r0
	ldr r0, [r1]
	bl ov02_0234D288
	ldr r0, _02349EF0 @ =0x0235AB5C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov02_0234D288
	ldr r7, _02349EF0 @ =0x0235AB5C
	ldr r4, _02349EF4 @ =0x02352F10
	ldr r1, [r7]
	mov r5, #0
	ldrb r0, [r1, #0x1c]
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _02349ED0
_02349EA4:
	add r0, r1, r5, lsl #2
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02349EB8
	bl ov02_0234D288
_02349EB8:
	ldr r1, [r7]
	add r5, r5, #1
	ldrb r0, [r1, #0x1c]
	ldrb r0, [r4, r0]
	cmp r5, r0
	blt _02349EA4
_02349ED0:
	ldr r0, [r1, #0x10]
	bl ov02_0234DD9C
	mov r1, r6
	mov r0, #1
	bl ov02_0234FB40
	ldr r0, _02349EF8 @ =0x0235AB5C
	bl ov02_0234E7D8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02349EF0: .4byte 0x0235AB5C
_02349EF4: .4byte 0x02352F10
_02349EF8: .4byte 0x0235AB5C
	arm_func_end ov02_02349E4C

	arm_func_start ov02_02349EFC
ov02_02349EFC: @ 0x02349EFC
	push {r3, lr}
	ldr r2, _02349F38 @ =0x0235AB60
	add r1, r0, #0x160
	str r0, [r2]
	add r0, r1, #0x1b000
	bl ov02_0234AB94
	ldr r1, _02349F38 @ =0x0235AB60
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x140]
	ldr r0, [r1]
	add r0, r0, #0x1b000
	str r2, [r0, #0x144]
	pop {r3, pc}
	.align 2, 0
_02349F38: .4byte 0x0235AB60
	arm_func_end ov02_02349EFC

	arm_func_start FUN_02349F3C
FUN_02349F3C: @ 0x02349F3C
	push {r4, r5, lr}
	sub sp, sp, #0x7c
	mov r5, r0
	add r0, sp, #0x28
	mov r4, r1
	bl FUN_0207BA08
	ldrb r2, [sp, #0x12]
	ldrb r1, [sp, #0x29]
	ldrh r3, [sp, #0x42]
	bic r2, r2, #0xf
	and r1, r1, #0xf
	orr r2, r2, r1
	strb r2, [sp, #0x12]
	add r0, sp, #0x2c
	add r1, sp, #0x14
	lsl r2, r3, #1
	strb r3, [sp, #0x13]
	bl FUN_0207C4C8
	ldrb r2, [sp, #0x12]
	ldr r0, _0234A054 @ =0x0235AB60
	add lr, sp, #4
	mov r1, #0
	ldr r0, [r0]
	bic r2, r2, #0xf0
	mov ip, r0
	strb r2, [sp, #0x12]
	strh r1, [lr]
	strh r1, [lr, #2]
	strh r1, [lr, #4]
	strh r1, [lr, #6]
	strh r1, [lr, #8]
	strh r1, [lr, #0xa]
	strh r1, [lr, #0xc]
	mov r3, #3
_02349FC4:
	ldrh r2, [lr]
	ldrh r1, [lr, #2]
	add lr, lr, #4
	subs r3, r3, #1
	strh r2, [ip]
	strh r1, [ip, #2]
	add ip, ip, #4
	bne _02349FC4
	ldrh r2, [lr]
	add r1, r0, #0x40
	add r1, r1, #0x10000
	strh r2, [ip]
	add r0, r0, #0x1b000
	str r1, [r0, #0x140]
	mov r1, #2
	str r1, [sp]
	ldr r0, _0234A054 @ =0x0235AB60
	add r1, sp, #0x12
	ldr r0, [r0]
	mov r2, r5
	add r0, r0, #0x1b000
	ldr r0, [r0, #0x140]
	mov r3, r4
	bl FUN_022C6EFC
	cmp r0, #0
	beq _0234A030
	bl FUN_0207BC20
_0234A030:
	mov r0, #0x100
	mov r1, #1
	bl FUN_022C7150
	ldr r0, _0234A058 @ =0x0234A64C
	bl FUN_022C3270
	mov r0, #1
	bl ov02_0234A970
	add sp, sp, #0x7c
	pop {r4, r5, pc}
	.align 2, 0
_0234A054: .4byte 0x0235AB60
_0234A058: .4byte 0x0234A64C
	arm_func_end FUN_02349F3C

	arm_func_start ov02_0234A05C
ov02_0234A05C: @ 0x0234A05C
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	bl ov02_0234A970
	mov r0, r4
	bl FUN_022C74A0
	cmp r0, #0
	beq _0234A08C
	mov r0, #7
	bl ov02_0234A970
	pop {r3, r4, r5, pc}
_0234A08C:
	mov r0, r5
	bl ov02_0234A0A4
	cmp r0, #0
	popne {r3, r4, r5, pc}
	bl FUN_0207BC20
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0234A05C

	arm_func_start ov02_0234A0A4
ov02_0234A0A4: @ 0x0234A0A4
	push {r4, r5, r6, lr}
	sub sp, sp, #0x48
	mov r6, r0
	ldr r0, [r6]
	mov r5, #0
	cmp r0, #0
	moveq r4, r5
	beq _0234A0EC
	add r0, sp, #0
	bl FUN_0207F3E4
	ldr r1, [r6]
	add r0, sp, #0
	bl FUN_0207F6C4
	cmp r0, #0
	addeq sp, sp, #0x48
	moveq r0, r5
	popeq {r4, r5, r6, pc}
	add r4, sp, #0
_0234A0EC:
	mov r0, r4
	bl FUN_022C4698
	cmp r0, #0
	beq _0234A158
	ldr r1, _0234A174 @ =0x0235AB60
	ldr r0, [r1]
	add r2, r0, #0x2c
	add r0, r0, #0x1b000
	str r2, [r0, #0x144]
	ldr r0, [r1]
	add r0, r0, #0x1b000
	ldr r1, [r0, #0x144]
	cmp r1, #0
	beq _0234A158
	mov r0, r4
	mov r2, #0x10000
	bl FUN_022C4718
	cmp r0, #0
	beq _0234A158
	ldr r1, _0234A174 @ =0x0235AB60
	mov r0, r6
	ldr r1, [r1]
	add r1, r1, #0x1b000
	ldr r1, [r1, #0x144]
	bl FUN_022C4C08
	cmp r0, #0
	movne r5, #1
_0234A158:
	add r0, sp, #0
	cmp r4, r0
	bne _0234A168
	bl FUN_0207F70C
_0234A168:
	mov r0, r5
	add sp, sp, #0x48
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234A174: .4byte 0x0235AB60
	arm_func_end ov02_0234A0A4

	arm_func_start ov02_0234A178
ov02_0234A178: @ 0x0234A178
	push {r3, r4, r5, lr}
	mov r1, #1
	mov r4, r0
	bl FUN_022C33BC
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_0207B7E4
	ldr r1, _0234A214 @ =0x0235AB60
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl FUN_0207B7F8
	mov r0, r4
	bl FUN_022C75D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234A214: .4byte 0x0235AB60
	arm_func_end ov02_0234A178

	arm_func_start ov02_0234A218
ov02_0234A218: @ 0x0234A218
	push {r3, r4, r5, lr}
	mov r1, #0
	mov r4, r0
	bl FUN_022C33BC
	cmp r0, #0
	bne _0234A2B4
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_0207B7E4
	ldr r1, _0234A2EC @ =0x0235AB60
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl FUN_0207B7F8
	mov r0, r4
	bl FUN_022C75D8
	pop {r3, r4, r5, pc}
_0234A2B4:
	bl FUN_0207B7E4
	ldr r1, _0234A2EC @ =0x0235AB60
	mov r2, #1
	ldr r3, [r1]
	mvn r4, r2, lsl r4
	ldrh r2, [r3, #4]
	and r2, r2, r4
	strh r2, [r3, #4]
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	and r1, r1, r4
	strh r1, [r2, #2]
	bl FUN_0207B7F8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234A2EC: .4byte 0x0235AB60
	arm_func_end ov02_0234A218

	arm_func_start ov02_0234A2F0
ov02_0234A2F0: @ 0x0234A2F0
	push {r3, r4, r5, lr}
	mov r1, #2
	mov r4, r0
	bl FUN_022C33BC
	cmp r0, #0
	bne _0234A38C
	mov r0, #1
	mvn r0, r0, lsl r4
	lsl r5, r0, #0x10
	bl FUN_0207B7E4
	ldr r1, _0234A3C4 @ =0x0235AB60
	ldr r3, [r1]
	ldrh r2, [r3, #2]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #2]
	ldr r3, [r1]
	ldrh r2, [r3, #4]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #4]
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #6]
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #8]
	ldr r3, [r1]
	ldrh r2, [r3, #0xa]
	and r2, r2, r5, lsr #16
	strh r2, [r3, #0xa]
	ldr r2, [r1]
	ldrh r1, [r2, #0xc]
	and r1, r1, r5, lsr #16
	strh r1, [r2, #0xc]
	bl FUN_0207B7F8
	mov r0, r4
	bl FUN_022C75D8
	pop {r3, r4, r5, pc}
_0234A38C:
	bl FUN_0207B7E4
	ldr r1, _0234A3C4 @ =0x0235AB60
	mov ip, #1
	ldr r5, [r1]
	mvn r2, ip, lsl r4
	ldrh r3, [r5, #6]
	and r2, r3, r2
	strh r2, [r5, #6]
	ldr r2, [r1]
	ldrh r1, [r2, #8]
	orr r1, r1, ip, lsl r4
	strh r1, [r2, #8]
	bl FUN_0207B7F8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234A3C4: .4byte 0x0235AB60
	arm_func_end ov02_0234A2F0

	arm_func_start ov02_0234A3C8
ov02_0234A3C8: @ 0x0234A3C8
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #3
	bl ov02_0234A970
	mov r5, #1
	ldr r7, _0234A4A4 @ =0x0235AB60
	mov r4, r5
_0234A3E0:
	ldr r1, [r7]
	ldrh r0, [r1, #2]
	tst r0, r4, lsl r5
	beq _0234A48C
	ldrh r0, [r1, #4]
	tst r0, r4, lsl r5
	bne _0234A48C
	ldrh r0, [r1, #6]
	tst r0, r4, lsl r5
	bne _0234A484
	mvn r0, r4, lsl r5
	lsl r6, r0, #0x10
	bl FUN_0207B7E4
	ldr r2, [r7]
	ldrh r1, [r2, #2]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #2]
	ldr r2, [r7]
	ldrh r1, [r2, #4]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #4]
	ldr r2, [r7]
	ldrh r1, [r2, #6]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #6]
	ldr r2, [r7]
	ldrh r1, [r2, #8]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #8]
	ldr r2, [r7]
	ldrh r1, [r2, #0xa]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #0xa]
	ldr r2, [r7]
	ldrh r1, [r2, #0xc]
	and r1, r1, r6, lsr #16
	strh r1, [r2, #0xc]
	bl FUN_0207B7F8
	mov r0, r5
	bl FUN_022C75D8
	b _0234A48C
_0234A484:
	mov r0, r5
	bl ov02_0234A2F0
_0234A48C:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x10
	blo _0234A3E0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234A4A4: .4byte 0x0235AB60
	arm_func_end ov02_0234A3C8

	arm_func_start ov02_0234A4A8
ov02_0234A4A8: @ 0x0234A4A8
	push {r4, r5, r6, lr}
	ldr r4, _0234A50C @ =0x0235AB60
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	mov r6, #1
	mov r5, r6
_0234A4CC:
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	tst r0, r5, lsl r6
	beq _0234A4F0
	mov r0, r6
	bl FUN_022C3368
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
_0234A4F0:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0x10
	blo _0234A4CC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234A50C: .4byte 0x0235AB60
	arm_func_end ov02_0234A4A8

	arm_func_start ov02_0234A510
ov02_0234A510: @ 0x0234A510
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #1
	ldr r4, _0234A604 @ =0x0235AB60
	mov r8, #0
	mov r5, #3
	mov r6, r7
_0234A528:
	ldr r0, [r4]
	ldrh r0, [r0, #0xa]
	tst r0, r6, lsl r7
	beq _0234A5D0
	mov r0, r7
	mov r1, r5
	bl FUN_022C33BC
	cmp r0, #0
	orrne r0, r8, r6, lsl r7
	lslne r0, r0, #0x10
	lsrne r8, r0, #0x10
	bne _0234A5D0
	mvn r0, r6, lsl r7
	lsl sb, r0, #0x10
	bl FUN_0207B7E4
	ldr r2, [r4]
	ldrh r1, [r2, #2]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #2]
	ldr r2, [r4]
	ldrh r1, [r2, #4]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #4]
	ldr r2, [r4]
	ldrh r1, [r2, #6]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #6]
	ldr r2, [r4]
	ldrh r1, [r2, #8]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #8]
	ldr r2, [r4]
	ldrh r1, [r2, #0xa]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #0xa]
	ldr r2, [r4]
	ldrh r1, [r2, #0xc]
	and r1, r1, sb, lsr #16
	strh r1, [r2, #0xc]
	bl FUN_0207B7F8
	mov r0, r7
	bl FUN_022C75D8
_0234A5D0:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x10
	blo _0234A528
	cmp r8, #0
	bne _0234A5F8
	mov r0, #7
	bl ov02_0234A970
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0234A5F8:
	mov r0, #4
	bl ov02_0234A970
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234A604: .4byte 0x0235AB60
	arm_func_end ov02_0234A510

	arm_func_start ov02_0234A608
ov02_0234A608: @ 0x0234A608
	push {r3, lr}
	mov r0, #6
	bl ov02_0234A970
	bl FUN_022C759C
	pop {r3, pc}
	arm_func_end ov02_0234A608

	arm_func_start ov02_0234A61C
ov02_0234A61C: @ 0x0234A61C
	push {r3, lr}
	ldr r0, _0234A648 @ =0x0235AB60
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r0, #4
	ldrheq r1, [r2, #2]
	ldrheq r0, [r2, #0xc]
	cmpeq r1, r0
	popne {r3, pc}
	bl FUN_022C759C
	pop {r3, pc}
	.align 2, 0
_0234A648: .4byte 0x0235AB60
	arm_func_end ov02_0234A61C
_0234A64C:
	.byte 0x70, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x50, 0xA0, 0xE1, 0x02, 0x40, 0xA0, 0xE1, 0x0E, 0x00, 0x51, 0xE3, 0x01, 0xF1, 0x8F, 0x90
	.byte 0xBF, 0x00, 0x00, 0xEA, 0xBE, 0x00, 0x00, 0xEA, 0x70, 0x80, 0xBD, 0xE8, 0x0B, 0x00, 0x00, 0xEA
	.byte 0x2C, 0x00, 0x00, 0xEA, 0x70, 0x80, 0xBD, 0xE8, 0x70, 0x80, 0xBD, 0xE8, 0x70, 0x80, 0xBD, 0xE8
	.byte 0x77, 0x00, 0x00, 0xEA, 0x70, 0x80, 0xBD, 0xE8, 0x81, 0x00, 0x00, 0xEA, 0x48, 0x00, 0x00, 0xEA
	.byte 0x70, 0x80, 0xBD, 0xE8, 0x8B, 0x00, 0x00, 0xEA, 0xA1, 0x00, 0x00, 0xEA, 0x5F, 0x00, 0x00, 0xEA
	.byte 0xB7, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x50, 0xE3, 0x70, 0x80, 0xBD, 0x18, 0xB8, 0x02, 0x9F, 0xE5
	.byte 0x00, 0x60, 0x90, 0xE5, 0x4A, 0xC4, 0xF4, 0xEB, 0xB2, 0x20, 0xD6, 0xE1, 0x01, 0x10, 0xA0, 0xE3
	.byte 0x11, 0x15, 0x82, 0xE1, 0xB2, 0x10, 0xC6, 0xE1, 0x4A, 0xC4, 0xF4, 0xEB, 0x98, 0x12, 0x9F, 0xE5
	.byte 0x01, 0x30, 0x45, 0xE2, 0x1E, 0x00, 0xA0, 0xE3, 0x93, 0x00, 0x00, 0xE0, 0x00, 0x20, 0x91, 0xE5
	.byte 0x24, 0x30, 0x82, 0xE2, 0x0A, 0x20, 0xD4, 0xE5, 0x00, 0xC0, 0x83, 0xE0, 0x00, 0x20, 0xC3, 0xE7
	.byte 0x0B, 0x20, 0xD4, 0xE5, 0x01, 0x20, 0xCC, 0xE5, 0x0C, 0x20, 0xD4, 0xE5, 0x02, 0x20, 0xCC, 0xE5
	.byte 0x0D, 0x20, 0xD4, 0xE5, 0x03, 0x20, 0xCC, 0xE5, 0x0E, 0x20, 0xD4, 0xE5, 0x04, 0x20, 0xCC, 0xE5
	.byte 0x0F, 0x20, 0xD4, 0xE5, 0x05, 0x20, 0xCC, 0xE5, 0x00, 0x10, 0x91, 0xE5, 0x00, 0x00, 0x81, 0xE0
	.byte 0xBA, 0x52, 0xC0, 0xE1, 0x70, 0x80, 0xBD, 0xE8, 0xB0, 0x00, 0x00, 0xEB, 0x06, 0x00, 0x50, 0xE3
	.byte 0x70, 0x80, 0xBD, 0x08, 0x01, 0x00, 0xA0, 0xE3, 0x10, 0x05, 0xE0, 0xE1, 0x00, 0x48, 0xA0, 0xE1
	.byte 0x27, 0xC4, 0xF4, 0xEB, 0x20, 0x12, 0x9F, 0xE5, 0x00, 0x30, 0x91, 0xE5, 0xB2, 0x20, 0xD3, 0xE1
	.byte 0x24, 0x28, 0x02, 0xE0, 0xB2, 0x20, 0xC3, 0xE1, 0x00, 0x30, 0x91, 0xE5, 0xB4, 0x20, 0xD3, 0xE1
	.byte 0x24, 0x28, 0x02, 0xE0, 0xB4, 0x20, 0xC3, 0xE1, 0x00, 0x30, 0x91, 0xE5, 0xB6, 0x20, 0xD3, 0xE1
	.byte 0x24, 0x28, 0x02, 0xE0, 0xB6, 0x20, 0xC3, 0xE1, 0x00, 0x30, 0x91, 0xE5, 0xB8, 0x20, 0xD3, 0xE1
	.byte 0x24, 0x28, 0x02, 0xE0, 0xB8, 0x20, 0xC3, 0xE1, 0x00, 0x30, 0x91, 0xE5, 0xBA, 0x20, 0xD3, 0xE1
	.byte 0x24, 0x28, 0x02, 0xE0, 0xBA, 0x20, 0xC3, 0xE1, 0x00, 0x20, 0x91, 0xE5, 0xBC, 0x10, 0xD2, 0xE1
	.byte 0x24, 0x18, 0x01, 0xE0, 0xBC, 0x10, 0xC2, 0xE1, 0x12, 0xC4, 0xF4, 0xEB, 0x9A, 0xFF, 0xFF, 0xEB
	.byte 0x70, 0x80, 0xBD, 0xE8, 0x72, 0x00, 0x00, 0xEB, 0x02, 0x00, 0x50, 0xE3, 0x02, 0x00, 0x00, 0x0A
	.byte 0x05, 0x00, 0xA0, 0xE1, 0x93, 0xFE, 0xFF, 0xEB, 0x70, 0x80, 0xBD, 0xE8, 0x98, 0x01, 0x9F, 0xE5
	.byte 0x01, 0x10, 0xA0, 0xE3, 0x00, 0x30, 0x90, 0xE5, 0x05, 0x00, 0xA0, 0xE1, 0xB4, 0x20, 0xD3, 0xE1
	.byte 0x11, 0x15, 0x82, 0xE1, 0xB4, 0x10, 0xC3, 0xE1, 0x62, 0xFE, 0xFF, 0xEB, 0x05, 0x00, 0xA0, 0xE1
	.byte 0xBB, 0xE2, 0xFD, 0xEB, 0x00, 0x00, 0x50, 0xE3, 0x70, 0x80, 0xBD, 0x08, 0x68, 0x11, 0x9F, 0xE5
	.byte 0x01, 0x20, 0x45, 0xE2, 0x00, 0x30, 0x91, 0xE5, 0x1E, 0x10, 0xA0, 0xE3, 0x0E, 0x30, 0x83, 0xE2
	.byte 0x92, 0x31, 0x21, 0xE0, 0x16, 0x20, 0xA0, 0xE3, 0x2A, 0xC7, 0xF4, 0xEB, 0x70, 0x80, 0xBD, 0xE8
	.byte 0x44, 0x01, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE3, 0x00, 0x30, 0x90, 0xE5, 0x14, 0x15, 0xE0, 0xE1
	.byte 0xB4, 0x20, 0xD3, 0xE1, 0x01, 0x10, 0x02, 0xE0, 0xB4, 0x10, 0xC3, 0xE1, 0x00, 0x10, 0x90, 0xE5
	.byte 0xB6, 0x00, 0xD1, 0xE1, 0x14, 0x05, 0x80, 0xE1, 0xB6, 0x00, 0xC1, 0xE1, 0x4C, 0x00, 0x00, 0xEB
	.byte 0x03, 0x00, 0x50, 0xE3, 0x70, 0x80, 0xBD, 0x18, 0x05, 0x00, 0xA0, 0xE1, 0xA3, 0xFE, 0xFF, 0xEB
	.byte 0x70, 0x80, 0xBD, 0xE8, 0x00, 0x01, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE3, 0x00, 0x30, 0x90, 0xE5
	.byte 0x14, 0x15, 0xE0, 0xE1, 0xB8, 0x20, 0xD3, 0xE1, 0x01, 0x10, 0x02, 0xE0, 0xB8, 0x10, 0xC3, 0xE1
	.byte 0x00, 0x10, 0x90, 0xE5, 0xBA, 0x00, 0xD1, 0xE1, 0x14, 0x05, 0x80, 0xE1, 0xBA, 0x00, 0xC1, 0xE1
	.byte 0x70, 0x80, 0xBD, 0xE8, 0xD0, 0x00, 0x9F, 0xE5, 0x01, 0x40, 0xA0, 0xE3, 0x00, 0x30, 0x90, 0xE5
	.byte 0x14, 0x15, 0xE0, 0xE1, 0xBA, 0x20, 0xD3, 0xE1, 0x01, 0x10, 0x02, 0xE0, 0xBA, 0x10, 0xC3, 0xE1
	.byte 0x00, 0x10, 0x90, 0xE5, 0xBC, 0x00, 0xD1, 0xE1, 0x14, 0x05, 0x80, 0xE1, 0xBC, 0x00, 0xC1, 0xE1
	.byte 0x55, 0xFF, 0xFF, 0xEB, 0x70, 0x80, 0xBD, 0xE8, 0x2D, 0x00, 0x00, 0xEB, 0x04, 0x00, 0x50, 0xE3
	.byte 0x02, 0x00, 0x00, 0x1A, 0x05, 0x00, 0xA0, 0xE3, 0x24, 0x00, 0x00, 0xEB, 0x01, 0x00, 0x00, 0xEA
	.byte 0x00, 0x00, 0xA0, 0xE3, 0x21, 0x00, 0x00, 0xEB, 0x7C, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5
	.byte 0x1B, 0x0A, 0x80, 0xE2, 0x44, 0x11, 0x90, 0xE5, 0x00, 0x00, 0x51, 0xE3, 0x00, 0x10, 0xA0, 0x13
	.byte 0x44, 0x11, 0x80, 0x15, 0x60, 0x00, 0x9F, 0xE5, 0x00, 0x00, 0x90, 0xE5, 0x1B, 0x0A, 0x80, 0xE2
	.byte 0x40, 0x11, 0x90, 0xE5, 0x00, 0x00, 0x51, 0xE3, 0x00, 0x10, 0xA0, 0x13, 0x40, 0x11, 0x80, 0x15
	.byte 0x70, 0x80, 0xBD, 0xE8, 0xB0, 0x00, 0xD4, 0xE1, 0x08, 0x00, 0x50, 0xE3, 0x07, 0x00, 0x00, 0xCA
	.byte 0x70, 0x80, 0xBD, 0xA8, 0x02, 0x00, 0x50, 0xE3, 0x70, 0x80, 0xBD, 0xC8, 0x01, 0x00, 0x50, 0xE3
	.byte 0x70, 0x80, 0xBD, 0xB8, 0x02, 0x00, 0x50, 0x13, 0x02, 0x00, 0x00, 0x0A, 0x70, 0x80, 0xBD, 0xE8
	.byte 0x09, 0x00, 0x50, 0xE3, 0x70, 0x80, 0xBD, 0x18, 0x07, 0x00, 0xA0, 0xE3, 0x03, 0x00, 0x00, 0xEB
	.byte 0x70, 0x80, 0xBD, 0xE8, 0xAD, 0xC4, 0xF4, 0xEB, 0x70, 0x80, 0xBD, 0xE8, 0x60, 0xAB, 0x35, 0x02

	arm_func_start ov02_0234A970
ov02_0234A970: @ 0x0234A970
	ldr r1, _0234A980 @ =0x0235AB60
	ldr r1, [r1]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0234A980: .4byte 0x0235AB60
	arm_func_end ov02_0234A970

	arm_func_start ov02_0234A984
ov02_0234A984: @ 0x0234A984
	ldr r0, _0234A994 @ =0x0235AB60
	ldr r0, [r0]
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0234A994: .4byte 0x0235AB60
	arm_func_end ov02_0234A984

	arm_func_start ov02_0234A998
ov02_0234A998: @ 0x0234A998
	ldr r2, _0234A9E4 @ =0x0235AB60
	ldr r1, _0234A9E8 @ =0x02353E54
	ldr ip, [r2]
	ldr r2, _0234A9EC @ =0x02353E54
	add r3, ip, #2
	str r3, [r1]
	add r3, ip, #4
	str r3, [r1, #4]
	add r3, ip, #6
	str r3, [r1, #8]
	add r3, ip, #8
	str r3, [r1, #0xc]
	add r3, ip, #0xa
	str r3, [r1, #0x10]
	add r3, ip, #0xc
	str r3, [r1, #0x14]
	ldr r0, [r2, r0, lsl #2]
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0234A9E4: .4byte 0x0235AB60
_0234A9E8: .4byte 0x02353E54
_0234A9EC: .4byte 0x02353E54
	arm_func_end ov02_0234A998

	arm_func_start ov02_0234A9F0
ov02_0234A9F0: @ 0x0234A9F0
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r4, r0
	bl FUN_0207B7E4
	ldr r1, _0234AAB4 @ =0x0235AB60
	mov r3, #1
	ldr r2, [r1]
	lsl r3, r3, r4
	ldrh r1, [r2, #2]
	lsl r4, r3, #0x10
	mov r5, r0
	tst r1, r4, lsr #16
	bne _0234AA34
	bl FUN_0207B7F8
	add sp, sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0234AA34:
	mov r0, r2
	add r1, sp, #0
	mov r2, #0xe
	bl FUN_0207C4C8
	mov r0, r5
	bl FUN_0207B7F8
	ldrh r0, [sp, #4]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #2
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #6]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #3
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #8]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #4
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #0xa]
	tst r0, r4, lsr #16
	addne sp, sp, #0x10
	movne r0, #5
	popne {r3, r4, r5, pc}
	ldrh r0, [sp, #0xc]
	tst r0, r4, lsr #16
	movne r0, #6
	moveq r0, #1
	add sp, sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234AAB4: .4byte 0x0235AB60
	arm_func_end ov02_0234A9F0

	arm_func_start ov02_0234AAB8
ov02_0234AAB8: @ 0x0234AAB8
	ldr r1, _0234AAE8 @ =0x0235AB60
	mov r2, #1
	ldr r3, [r1]
	ldrh r1, [r3, #2]
	tst r1, r2, lsl r0
	moveq r0, #0
	bxeq lr
	sub r1, r0, #1
	add r2, r3, #0xe
	mov r0, #0x1e
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_0234AAE8: .4byte 0x0235AB60
	arm_func_end ov02_0234AAB8

	arm_func_start ov02_0234AAEC
ov02_0234AAEC: @ 0x0234AAEC
	push {r4, r5, r6, r7, r8, lr}
	ldr r1, _0234AB90 @ =0x0235AB60
	mov lr, #1
	ldr r5, [r1]
	mov ip, lr
	ldrh r4, [r5, #2]
	add r1, r5, #0x24
	mov r6, #0x1e
_0234AB0C:
	tst r4, ip, lsl lr
	beq _0234AB74
	sub r2, lr, #1
	mul r3, r2, r6
	ldrb r8, [r0]
	ldrb r7, [r1, r3]
	add r2, r1, r3
	cmp r8, r7
	ldrbeq r8, [r0, #1]
	ldrbeq r7, [r2, #1]
	cmpeq r8, r7
	ldrbeq r8, [r0, #2]
	ldrbeq r7, [r2, #2]
	cmpeq r8, r7
	ldrbeq r8, [r0, #3]
	ldrbeq r7, [r2, #3]
	cmpeq r8, r7
	ldrbeq r8, [r0, #4]
	ldrbeq r7, [r2, #4]
	cmpeq r8, r7
	ldrbeq r7, [r0, #5]
	ldrbeq r2, [r2, #5]
	cmpeq r7, r2
	addeq r0, r5, r3
	ldrheq r0, [r0, #0x2a]
	popeq {r4, r5, r6, r7, r8, pc}
_0234AB74:
	add r2, lr, #1
	lsl r2, r2, #0x10
	lsr lr, r2, #0x10
	cmp lr, #2
	blo _0234AB0C
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234AB90: .4byte 0x0235AB60
	arm_func_end ov02_0234AAEC

	arm_func_start ov02_0234AB94
ov02_0234AB94: @ 0x0234AB94
	ldr r1, _0234ABCC @ =0x0235AB64
	mov r2, #0
	str r0, [r1, #4]
	str r2, [r0, #0x40]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3a8]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3ac]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x3b0]
	bx lr
	.align 2, 0
_0234ABCC: .4byte 0x0235AB64
	arm_func_end ov02_0234AB94

	arm_func_start ov02_0234ABD0
ov02_0234ABD0: @ 0x0234ABD0
	push {r4, lr}
	ldr r1, _0234AC3C @ =0x0235AB64
	mov r4, r0
	ldr r3, [r1]
	cmp r3, #0
	beq _0234AC04
	ldr r1, [r1, #4]
	ldr r0, _0234AC40 @ =0x0235420C
	ldr r2, [r1, #0x40]
	ldr r1, _0234AC44 @ =0x02354234
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
_0234AC04:
	ldr r0, _0234AC3C @ =0x0235AB64
	ldr r1, [r0, #4]
	str r4, [r1, #0x40]
	ldr r3, [r0]
	cmp r3, #0
	popeq {r4, pc}
	ldr r1, [r0, #4]
	ldr r0, _0234AC40 @ =0x0235420C
	ldr r2, [r1, #0x40]
	ldr r1, _0234AC48 @ =0x0235423C
	ldr r2, [r0, r2, lsl #2]
	mov r0, #0x8000000
	blx r3
	pop {r4, pc}
	.align 2, 0
_0234AC3C: .4byte 0x0235AB64
_0234AC40: .4byte 0x0235420C
_0234AC44: .4byte 0x02354234
_0234AC48: .4byte 0x0235423C
	arm_func_end ov02_0234ABD0

	arm_func_start ov02_0234AC4C
ov02_0234AC4C: @ 0x0234AC4C
	ldr r1, _0234AC68 @ =0x0235AB64
	ldr r2, [r1, #4]
	ldr r1, [r2, #0x40]
	sub r1, r1, #9
	cmp r1, #1
	strhi r0, [r2, #0x54]
	bx lr
	.align 2, 0
_0234AC68: .4byte 0x0235AB64
	arm_func_end ov02_0234AC4C

	arm_func_start ov02_0234AC6C
ov02_0234AC6C: @ 0x0234AC6C
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r1, _0234ACA8 @ =0x0235AB64
	ldr r0, _0234ACAC @ =ov02_0234ACB0
	ldr r1, [r1, #4]
	bl FUN_022BFC14
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234ACA8: .4byte 0x0235AB64
_0234ACAC: .4byte ov02_0234ACB0
	arm_func_end ov02_0234AC6C

	arm_func_start ov02_0234ACB0
ov02_0234ACB0: @ 0x0234ACB0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234ACD0
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234ACD0:
	ldr r0, _0234AD18 @ =0x0235AB64
	ldr r0, [r0, #4]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x3ac]
	cmp r0, #0
	beq _0234AD00
	bl ov02_0234AD1C
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234AD00:
	bl ov02_0234ADB8
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
	.align 2, 0
_0234AD18: .4byte 0x0235AB64
	arm_func_end ov02_0234ACB0

	arm_func_start ov02_0234AD1C
ov02_0234AD1C: @ 0x0234AD1C
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234AD78 @ =0x0235AB64
	ldr r1, [r0, #4]
	add r0, r1, #0x1000
	ldr r2, [r0, #0x3ac]
	add r0, r1, #0x13c0
	blx r2
	ldr r2, _0234AD78 @ =0x0235AB64
	mov r1, r0
	ldr r2, [r2, #4]
	ldr r0, _0234AD7C @ =ov02_0234AD80
	add r2, r2, #0x13c0
	bl FUN_022C13B8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234AD78: .4byte 0x0235AB64
_0234AD7C: .4byte ov02_0234AD80
	arm_func_end ov02_0234AD1C

	arm_func_start ov02_0234AD80
ov02_0234AD80: @ 0x0234AD80
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234ADA0
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234ADA0:
	bl ov02_0234ADB8
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
	arm_func_end ov02_0234AD80

	arm_func_start ov02_0234ADB8
ov02_0234ADB8: @ 0x0234ADB8
	push {r3, lr}
	ldr r0, _0234AE14 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	movls r0, #1
	popls {r3, pc}
	ldr r0, _0234AE18 @ =ov02_0234AE1C
	bl FUN_022BFD9C
	cmp r0, #2
	beq _0234ADF4
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
_0234ADF4:
	ldr r1, _0234AE14 @ =0x0235AB64
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strh r3, [r2, #0x50]
	ldr r1, [r1, #4]
	strh r0, [r1, #0x52]
	pop {r3, pc}
	.align 2, 0
_0234AE14: .4byte 0x0235AB64
_0234AE18: .4byte ov02_0234AE1C
	arm_func_end ov02_0234ADB8

	arm_func_start ov02_0234AE1C
ov02_0234AE1C: @ 0x0234AE1C
	push {r3, r4, r5, lr}
	mov r4, r0
	ldrh r2, [r4, #0x10]
	ldrh r0, [r4, #2]
	mov r1, #1
	lsl r1, r1, r2
	cmp r0, #0
	lsl r5, r1, #0x10
	beq _0234AE50
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, r4, r5, pc}
_0234AE50:
	ldrh ip, [r4, #8]
	cmp ip, #7
	bgt _0234AE80
	bge _0234AE8C
	cmp ip, #2
	bgt _0234AF58
	cmp ip, #0
	blt _0234AF58
	beq _0234AF40
	cmp ip, #2
	popeq {r3, r4, r5, pc}
	b _0234AF58
_0234AE80:
	cmp ip, #9
	beq _0234AF08
	b _0234AF58
_0234AE8C:
	ldr r0, _0234AF7C @ =0x0235AB64
	ldr r3, [r0]
	cmp r3, #0
	beq _0234AEA8
	ldr r1, _0234AF80 @ =0x02354240
	mov r0, #0x8000000
	blx r3
_0234AEA8:
	ldr r0, _0234AF7C @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r1, [r0, #0x4c]
	cmp r1, #0
	beq _0234AEF0
	mov r0, r4
	blx r1
	cmp r0, #0
	bne _0234AEF0
	ldrh r1, [r4, #0x10]
	mov r0, #0
	bl FUN_022C0134
	cmp r0, #2
	popeq {r3, r4, r5, pc}
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, r4, r5, pc}
_0234AEF0:
	ldr r0, _0234AF7C @ =0x0235AB64
	ldr r1, [r0, #4]
	ldrh r0, [r1, #0x52]
	orr r0, r0, r5, lsr #16
	strh r0, [r1, #0x52]
	pop {r3, r4, r5, pc}
_0234AF08:
	ldr r0, _0234AF7C @ =0x0235AB64
	ldr r3, [r0]
	cmp r3, #0
	beq _0234AF24
	ldr r1, _0234AF84 @ =0x0235426C
	mov r0, #0x8000000
	blx r3
_0234AF24:
	ldr r0, _0234AF7C @ =0x0235AB64
	mvn r1, r5, lsr #16
	ldr r2, [r0, #4]
	ldrh r0, [r2, #0x52]
	and r0, r0, r1
	strh r0, [r2, #0x52]
	pop {r3, r4, r5, pc}
_0234AF40:
	bl ov02_0234AF8C
	cmp r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, r4, r5, pc}
_0234AF58:
	ldr r0, _0234AF7C @ =0x0235AB64
	ldr r3, [r0]
	cmp r3, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _0234AF88 @ =0x02354298
	mov r2, ip
	mov r0, #0x8000000
	blx r3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234AF7C: .4byte 0x0235AB64
_0234AF80: .4byte 0x02354240
_0234AF84: .4byte 0x0235426C
_0234AF88: .4byte 0x02354298
	arm_func_end ov02_0234AE1C

	arm_func_start ov02_0234AF8C
ov02_0234AF8C: @ 0x0234AF8C
	push {r3, lr}
	sub sp, sp, #8
	ldr r0, _0234B01C @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	sub r0, r0, #4
	cmp r0, #2
	addls sp, sp, #8
	movls r0, #1
	popls {r3, pc}
	mov r0, #4
	bl ov02_0234ABD0
	ldr r0, _0234B01C @ =0x0235AB64
	mov ip, #1
	ldr lr, [r0, #4]
	ldr r0, _0234B020 @ =ov02_0234B024
	add r3, lr, #0x1000
	ldr r1, [r3, #0x2a0]
	add r2, lr, #0x60
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	stm sp, {r1, ip}
	ldr r3, [r3, #0x2a4]
	add r1, r2, #0x1000
	lsl r2, r3, #0x10
	lsr r2, r2, #0x10
	add r3, lr, #0xf80
	bl FUN_022C0430
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234B01C: .4byte 0x0235AB64
_0234B020: .4byte ov02_0234B024
	arm_func_end ov02_0234AF8C

	arm_func_start ov02_0234B024
ov02_0234B024: @ 0x0234B024
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _0234B048
	mov r0, r1
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B048:
	ldrh r2, [r0, #4]
	sub r0, r2, #0xa
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0234B124
_0234B05C: @ jump table
	b _0234B06C @ case 0
	pop {r3, pc} @ case 1
	b _0234B124 @ case 2
	b _0234B124 @ case 3
_0234B06C:
	ldr r0, _0234B144 @ =0x0235AB64
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x44]
	cmp r0, #2
	bne _0234B0CC
	ldr r0, [r1, #0x40]
	cmp r0, #4
	bne _0234B0C0
	bl ov02_0234B150
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234B144 @ =0x0235AB64
	ldr r2, [r0]
	cmp r2, #0
	beq _0234B0B4
	ldr r1, _0234B148 @ =0x023542B8
	mov r0, #0x8000000
	blx r2
_0234B0B4:
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B0C0:
	cmp r0, #6
	bne _0234B118
	pop {r3, pc}
_0234B0CC:
	cmp r0, #4
	bne _0234B118
	add r0, r1, #0x3e0
	mov ip, #1
	add r0, r0, #0x1000
	mov r1, #0xd
	mov r2, #7
	mov r3, #0x44
	str ip, [sp]
	bl FUN_022C0810
	cmp r0, #0
	beq _0234B10C
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B10C:
	mov r0, #5
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B118:
	mov r0, #4
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B124:
	ldr r0, _0234B144 @ =0x0235AB64
	ldr r3, [r0]
	cmp r3, #0
	popeq {r3, pc}
	ldr r1, _0234B14C @ =0x02354298
	mov r0, #0x8000000
	blx r3
	pop {r3, pc}
	.align 2, 0
_0234B144: .4byte 0x0235AB64
_0234B148: .4byte 0x023542B8
_0234B14C: .4byte 0x02354298
	arm_func_end ov02_0234B024

	arm_func_start ov02_0234B150
ov02_0234B150: @ 0x0234B150
	push {r3, lr}
	mov r0, #6
	bl ov02_0234ABD0
	ldr r0, _0234B188 @ =0x0235AB64
	mov r1, #0xd
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_022C1390
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B188: .4byte 0x0235AB64
	arm_func_end ov02_0234B150

	arm_func_start ov02_0234B18C
ov02_0234B18C: @ 0x0234B18C
	push {r3, lr}
	ldr r0, _0234B1B8 @ =0x0235AB64
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_022C13AC
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B1B8: .4byte 0x0235AB64
	arm_func_end ov02_0234B18C

	arm_func_start ov02_0234B1BC
ov02_0234B1BC: @ 0x0234B1BC
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B1E8 @ =ov02_0234B1EC
	bl FUN_022C05C8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B1E8: .4byte ov02_0234B1EC
	arm_func_end ov02_0234B1BC

	arm_func_start ov02_0234B1EC
ov02_0234B1EC: @ 0x0234B1EC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234B208
	bl ov02_0234AC4C
	bl ov02_0234BBC0
	pop {r3, pc}
_0234B208:
	bl ov02_0234B240
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234B238 @ =0x0235AB64
	ldr r2, [r0]
	cmp r2, #0
	beq _0234B230
	ldr r1, _0234B23C @ =0x023542E8
	mov r0, #0x8000000
	blx r2
_0234B230:
	bl ov02_0234BBC0
	pop {r3, pc}
	.align 2, 0
_0234B238: .4byte 0x0235AB64
_0234B23C: .4byte 0x023542E8
	arm_func_end ov02_0234B1EC

	arm_func_start ov02_0234B240
ov02_0234B240: @ 0x0234B240
	push {r3, lr}
	ldr r0, _0234B264 @ =0x0234B268
	bl FUN_022BFDAC
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B264: .4byte 0x0234B268
	arm_func_end ov02_0234B240
_0234B268:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xB2, 0x00, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x73, 0xFE, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x01, 0x00, 0xA0, 0xE3, 0x51, 0xFE, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0234B28C
ov02_0234B28C: @ 0x0234B28C
	push {r3, lr}
	ldr r0, _0234B2D8 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	movne r0, #0
	popne {r3, pc}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B2D8 @ =0x0235AB64
	ldr r0, [r0, #4]
	add r0, r0, #0x1e00
	bl FUN_022C13AC
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B2D8: .4byte 0x0235AB64
	arm_func_end ov02_0234B28C

	arm_func_start ov02_0234B2DC
ov02_0234B2DC: @ 0x0234B2DC
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B308 @ =ov02_0234B30C
	bl FUN_022C05C8
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B308: .4byte ov02_0234B30C
	arm_func_end ov02_0234B2DC

	arm_func_start ov02_0234B30C
ov02_0234B30C: @ 0x0234B30C
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234B328
	bl ov02_0234AC4C
	bl ov02_0234BBDC
	pop {r3, pc}
_0234B328:
	bl ov02_0234B340
	cmp r0, #0
	popne {r3, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r3, pc}
	arm_func_end ov02_0234B30C

	arm_func_start ov02_0234B340
ov02_0234B340: @ 0x0234B340
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B374 @ =0x0234B378
	mov r1, #0
	bl FUN_022C0134
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	bl ov02_0234BBC0
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B374: .4byte 0x0234B378
	arm_func_end ov02_0234B340
_0234B378:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xB2, 0x00, 0xD0, 0xE1
	.byte 0x00, 0x00, 0x50, 0xE3, 0x01, 0x00, 0x00, 0x0A, 0x2F, 0xFE, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8
	.byte 0x01, 0x00, 0xA0, 0xE3, 0x0D, 0xFE, 0xFF, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0234B39C
ov02_0234B39C: @ 0x0234B39C
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B3C8 @ =ov02_0234B3CC
	bl FUN_022BFB9C
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B3C8: .4byte ov02_0234B3CC
	arm_func_end ov02_0234B39C

	arm_func_start ov02_0234B3CC
ov02_0234B3CC: @ 0x0234B3CC
	push {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0234B3F4
	mov r0, #9
	bl ov02_0234ABD0
	ldrh r0, [r4, #2]
	bl ov02_0234AC4C
	pop {r4, pc}
_0234B3F4:
	mov r0, #1
	bl ov02_0234ABD0
	pop {r4, pc}
	arm_func_end ov02_0234B3CC

	arm_func_start ov02_0234B400
ov02_0234B400: @ 0x0234B400
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234B41C
	mov r0, #0xa
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B41C:
	mov r0, #0
	bl ov02_0234ABD0
	pop {r3, pc}
	arm_func_end ov02_0234B400

	arm_func_start ov02_0234B428
ov02_0234B428: @ 0x0234B428
	ldr r1, _0234B438 @ =0x0235AB64
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0234B438: .4byte 0x0235AB64
	arm_func_end ov02_0234B428

	arm_func_start ov02_0234B43C
ov02_0234B43C: @ 0x0234B43C
	ldr r0, _0234B44C @ =0x0235AB64
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x52]
	bx lr
	.align 2, 0
_0234B44C: .4byte 0x0235AB64
	arm_func_end ov02_0234B43C

	arm_func_start ov02_0234B450
ov02_0234B450: @ 0x0234B450
	ldr r0, _0234B460 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	bx lr
	.align 2, 0
_0234B460: .4byte 0x0235AB64
	arm_func_end ov02_0234B450

	arm_func_start ov02_0234B464
ov02_0234B464: @ 0x0234B464
	push {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl FUN_0207B9EC
	ldr r2, _0234B530 @ =0x027FFC3C
	ldrh r0, [sp]
	ldr r3, [r2]
	ldrh r2, [sp, #2]
	add r0, r0, r3
	ldr r1, _0234B534 @ =0x0235AB64
	add r2, r2, r0
	ldrh r3, [sp, #4]
	ldr r0, [r1, #4]
	add r2, r3, r2
	str r2, [r0, #0x58]
	ldr ip, [r1, #4]
	ldr r0, _0234B538 @ =0x00010DCD
	ldr r2, [ip, #0x58]
	mov r3, #0
	mul r0, r2, r0
	add r0, r0, #0x39
	add r0, r0, #0x3000
	str r0, [ip, #0x58]
	ldr r0, [r1, #4]
	mov r2, #0x65
	strh r3, [r0, #0x5c]
	ldr r1, [r1, #4]
	mov r0, #3
	strh r2, [r1, #0x5e]
	bl ov02_0234ABD0
	mov r0, #1
	bl ov02_0234B53C
	cmp r0, #0x18
	bne _0234B508
	mov r0, #0x18
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	add sp, sp, #8
	mov r0, #0
	pop {r3, pc}
_0234B508:
	cmp r0, #2
	addeq sp, sp, #8
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #0
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234B530: .4byte 0x027FFC3C
_0234B534: .4byte 0x0235AB64
_0234B538: .4byte 0x00010DCD
	arm_func_end ov02_0234B464

	arm_func_start ov02_0234B53C
ov02_0234B53C: @ 0x0234B53C
	push {r4, lr}
	mov r4, r0
	bl FUN_022BF640
	cmp r0, #0x8000
	bne _0234B568
	mov r0, #3
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #3
	pop {r4, pc}
_0234B568:
	cmp r0, #0
	bne _0234B588
	mov r0, #0x16
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #0x18
	pop {r4, pc}
_0234B588:
	sub r1, r4, #1
	mov r2, #1
	tst r0, r2, lsl r1
	bne _0234B5BC
_0234B598:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x10
	movhi r0, #0x18
	pophi {r4, pc}
	sub r1, r4, #1
	tst r0, r2, lsl r1
	beq _0234B598
_0234B5BC:
	ldr r0, _0234B5D4 @ =ov02_0234B5D8
	mov r1, r4
	bl ov02_0234B6B0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	.align 2, 0
_0234B5D4: .4byte ov02_0234B5D8
	arm_func_end ov02_0234B53C

	arm_func_start ov02_0234B5D8
ov02_0234B5D8: @ 0x0234B5D8
	push {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0234B5FC
	bl ov02_0234AC4C
	mov r0, #9
	bl ov02_0234ABD0
	pop {r4, pc}
_0234B5FC:
	ldr r0, _0234B6A8 @ =0x0235AB64
	ldr ip, [r0]
	cmp ip, #0
	beq _0234B620
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldr r1, _0234B6AC @ =0x02354340
	mov r0, #0x8000000
	blx ip
_0234B620:
	ldr r0, _0234B6A8 @ =0x0235AB64
	ldrh r2, [r4, #0xa]
	ldr r3, [r0, #4]
	ldrh ip, [r4, #8]
	ldrh r1, [r3, #0x5e]
	cmp r1, r2
	bls _0234B658
	strh r2, [r3, #0x5e]
	sub r1, ip, #1
	mov r2, #1
	lsl r1, r2, r1
	ldr r0, [r0, #4]
	strh r1, [r0, #0x60]
	b _0234B670
_0234B658:
	bne _0234B670
	ldrh r2, [r3, #0x60]
	sub r0, ip, #1
	mov r1, #1
	orr r0, r2, r1, lsl r0
	strh r0, [r3, #0x60]
_0234B670:
	add r0, ip, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ov02_0234B53C
	cmp r0, #0x18
	bne _0234B694
	mov r0, #7
	bl ov02_0234ABD0
	pop {r4, pc}
_0234B694:
	cmp r0, #2
	popeq {r4, pc}
	mov r0, #9
	bl ov02_0234ABD0
	pop {r4, pc}
	.align 2, 0
_0234B6A8: .4byte 0x0235AB64
_0234B6AC: .4byte 0x02354340
	arm_func_end ov02_0234B5D8

	arm_func_start ov02_0234B6B0
ov02_0234B6B0: @ 0x0234B6B0
	push {r3, lr}
	mov r3, r1
	mov ip, #0x1e
	mov r1, #3
	mov r2, #0x11
	str ip, [sp]
	bl FUN_022C1610
	pop {r3, pc}
	arm_func_end ov02_0234B6B0

	arm_func_start ov02_0234B6D0
ov02_0234B6D0: @ 0x0234B6D0
	push {r3, lr}
	ldr r0, _0234B740 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #7
	beq _0234B6EC
	bl FUN_0207BC20
_0234B6EC:
	mov r0, #1
	bl ov02_0234ABD0
	ldr r0, _0234B740 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x60]
	bl ov02_0234B748
	ldr r1, _0234B740 @ =0x0235AB64
	ldr r2, [r1, #4]
	strh r0, [r2, #0x5c]
	ldr r3, [r1]
	cmp r3, #0
	beq _0234B730
	ldr r0, [r1, #4]
	ldr r1, _0234B744 @ =0x02354358
	ldrh r2, [r0, #0x5c]
	mov r0, #0x8000000
	blx r3
_0234B730:
	ldr r0, _0234B740 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldrh r0, [r0, #0x5c]
	pop {r3, pc}
	.align 2, 0
_0234B740: .4byte 0x0235AB64
_0234B744: .4byte 0x02354358
	arm_func_end ov02_0234B6D0

	arm_func_start ov02_0234B748
ov02_0234B748: @ 0x0234B748
	push {r4, lr}
	mov r3, #0
	mov r1, r3
	mov ip, r3
	mov r4, #1
_0234B75C:
	tst r0, r4, lsl ip
	beq _0234B77C
	add r3, ip, #1
	add r2, r1, #1
	lsl r1, r3, #0x10
	lsl r2, r2, #0x10
	asr r3, r1, #0x10
	lsr r1, r2, #0x10
_0234B77C:
	add r2, ip, #1
	lsl r2, r2, #0x10
	asr ip, r2, #0x10
	cmp ip, #0x10
	blt _0234B75C
	cmp r1, #1
	movls r0, r3
	popls {r4, pc}
	ldr ip, _0234B828 @ =0x0235AB64
	ldr r3, _0234B82C @ =0x00010DCD
	ldr r4, [ip, #4]
	mov r2, #0
	ldr lr, [r4, #0x58]
	mul r3, lr, r3
	add r3, r3, #0x39
	add r3, r3, #0x3000
	str r3, [r4, #0x58]
	ldr r3, [ip, #4]
	ldr r3, [r3, #0x58]
	and r3, r3, #0xff
	mul r3, r1, r3
	lsl r1, r3, #8
	lsr r3, r1, #0x10
_0234B7D8:
	tst r0, #1
	beq _0234B804
	cmp r3, #0
	bne _0234B7F8
	add r0, r2, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, pc}
_0234B7F8:
	sub r1, r3, #1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
_0234B804:
	add r1, r2, #1
	lsl r1, r1, #0x10
	lsl r0, r0, #0xf
	asr r2, r1, #0x10
	cmp r2, #0x10
	lsr r0, r0, #0x10
	blt _0234B7D8
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_0234B828: .4byte 0x0235AB64
_0234B82C: .4byte 0x00010DCD
	arm_func_end ov02_0234B748

	arm_func_start ov02_0234B830
ov02_0234B830: @ 0x0234B830
	push {r3, lr}
	ldr r2, _0234B8A4 @ =0x0235AB64
	mov r0, #0
	ldr r1, [r2, #4]
	mov r3, #1
	add r1, r1, #0x1000
	str r0, [r1, #0x2a4]
	ldr r1, [r2, #4]
	add r1, r1, #0x1000
	str r0, [r1, #0x2a0]
	ldr r1, [r2, #4]
	str r0, [r1, #0x48]
	ldr r1, [r2, #4]
	strh r0, [r1, #0x50]
	ldr r1, [r2, #4]
	strh r3, [r1, #0x52]
	ldr r1, [r2, #4]
	str r0, [r1, #0x54]
	ldr r1, [r2, #4]
	str r0, [r1]
	ldr r1, [r2, #4]
	strh r0, [r1, #4]
	ldr r1, [r2, #4]
	str r0, [r1, #0x4c]
	bl ov02_0234B8C8
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	pop {r3, pc}
	.align 2, 0
_0234B8A4: .4byte 0x0235AB64
	arm_func_end ov02_0234B830
_0234B8A8:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0xB2, 0x00, 0xD0, 0xE1
	.byte 0x08, 0x00, 0x50, 0xE3, 0x08, 0x80, 0xBD, 0x18, 0x09, 0x00, 0xA0, 0xE3, 0xC3, 0xFC, 0xFF, 0xEB
	.byte 0xD6, 0xC0, 0xF4, 0xEB, 0x08, 0x80, 0xBD, 0xE8

	arm_func_start ov02_0234B8C8
ov02_0234B8C8: @ 0x0234B8C8
	push {r3, lr}
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234B90C @ =0x0235AB64
	ldr r1, _0234B910 @ =ov02_0234B914
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, r0, #0x80
	bl FUN_022BFB14
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	bl ov02_0234AC4C
	mov r0, #0xa
	bl ov02_0234ABD0
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234B90C: .4byte 0x0235AB64
_0234B910: .4byte ov02_0234B914
	arm_func_end ov02_0234B8C8

	arm_func_start ov02_0234B914
ov02_0234B914: @ 0x0234B914
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0234B934
	bl ov02_0234AC4C
	mov r0, #0xa
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B934:
	ldr r0, _0234B960 @ =0x0234B8A8
	bl FUN_022BF2C4
	cmp r0, #0
	beq _0234B954
	bl ov02_0234AC4C
	mov r0, #0xa
	bl ov02_0234ABD0
	pop {r3, pc}
_0234B954:
	mov r0, #1
	bl ov02_0234ABD0
	pop {r3, pc}
	.align 2, 0
_0234B960: .4byte 0x0234B8A8
	arm_func_end ov02_0234B914

	arm_func_start ov02_0234B964
ov02_0234B964: @ 0x0234B964
	push {r4, r5, r6, lr}
	ldr r3, _0234BACC @ =0x0235AB64
	mov r6, r0
	ldr r0, [r3, #4]
	mov r5, r1
	ldr r0, [r0, #0x40]
	mov r4, r2
	cmp r0, #1
	beq _0234B990
	bl FUN_0207BC20
	movs r0, #0
_0234B990:
	ldr r1, _0234BACC @ =0x0235AB64
	mov r3, #0x180
	ldr r0, [r1, #4]
	mov r2, #0xe0
	add r0, r0, #0x1000
	str r3, [r0, #0x2a4]
	ldr r0, [r1, #4]
	add r0, r0, #0x1000
	str r2, [r0, #0x2a0]
	ldr r3, [r1]
	cmp r3, #0
	beq _0234B9D8
	ldr r0, [r1, #4]
	ldr r1, _0234BAD0 @ =0x02354310
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a4]
	mov r0, #0x8000000
	blx r3
_0234B9D8:
	ldr r0, _0234BACC @ =0x0235AB64
	ldr r3, [r0]
	cmp r3, #0
	beq _0234BA00
	ldr r0, [r0, #4]
	ldr r1, _0234BAD4 @ =0x02354328
	add r0, r0, #0x1000
	ldr r2, [r0, #0x2a0]
	mov r0, #0x8000000
	blx r3
_0234BA00:
	ldr r1, _0234BACC @ =0x0235AB64
	mov r0, #3
	ldr r1, [r1, #4]
	str r6, [r1, #0x44]
	bl ov02_0234ABD0
	ldr r0, _0234BACC @ =0x0235AB64
	ldr r1, [r0, #4]
	strh r5, [r1, #0xc]
	ldr r0, [r0, #4]
	strh r4, [r0, #0x32]
	bl FUN_022BF6F0
	ldr r1, _0234BACC @ =0x0235AB64
	mov r2, #0xd0
	ldr r3, [r1, #4]
	mov r4, #0x44
	strh r0, [r3, #0x18]
	ldr r0, [r1, #4]
	mov r3, #2
	strh r2, [r0, #0x34]
	ldr r0, [r1, #4]
	mov r2, #0
	strh r4, [r0, #0x36]
	ldr r0, [r1, #4]
	mov r4, #1
	strh r3, [r0, #0x10]
	ldr r0, [r1, #4]
	cmp r6, #2
	strh r2, [r0, #0x16]
	ldr r0, [r1, #4]
	strh r2, [r0, #0x12]
	ldr r0, [r1, #4]
	strh r4, [r0, #0xe]
	ldr r0, _0234BACC @ =0x0235AB64
	movne r4, r2
	ldr r1, [r0, #4]
	cmp r6, #0
	cmpne r6, #2
	strh r4, [r1, #0x14]
	cmpne r6, #4
	bne _0234BAA8
	bl ov02_0234AC6C
	pop {r4, r5, r6, pc}
_0234BAA8:
	ldr r3, [r0]
	cmp r3, #0
	beq _0234BAC4
	ldr r1, _0234BAD8 @ =0x02354370
	mov r2, r6
	mov r0, #0x8000000
	blx r3
_0234BAC4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234BACC: .4byte 0x0235AB64
_0234BAD0: .4byte 0x02354310
_0234BAD4: .4byte 0x02354328
_0234BAD8: .4byte 0x02354370
	arm_func_end ov02_0234B964

	arm_func_start ov02_0234BADC
ov02_0234BADC: @ 0x0234BADC
	ldr r1, _0234BAEC @ =0x0235AB64
	ldr r1, [r1, #4]
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0234BAEC: .4byte 0x0235AB64
	arm_func_end ov02_0234BADC

	arm_func_start ov02_0234BAF0
ov02_0234BAF0: @ 0x0234BAF0
	ldr r1, _0234BB10 @ =0x0235AB64
	ldr ip, _0234BB14 @ =FUN_022C130C
	ldr r1, [r1, #4]
	mov r2, r0
	add r0, r1, #0x3e0
	add r0, r0, #0x1000
	add r1, r1, #0x1c00
	bx ip
	.align 2, 0
_0234BB10: .4byte 0x0235AB64
_0234BB14: .4byte FUN_022C130C
	arm_func_end ov02_0234BAF0

	arm_func_start ov02_0234BB18
ov02_0234BB18: @ 0x0234BB18
	push {r4, lr}
	ldr r2, _0234BBB4 @ =0x0235AB64
	mov r1, r0
	ldr r2, [r2, #4]
	add r0, r2, #0x3e0
	add r0, r0, #0x1000
	add r2, r2, #0x1c00
	bl FUN_022C0AAC
	mov r4, r0
	cmp r4, #7
	bne _0234BB68
	ldr r0, _0234BBB4 @ =0x0235AB64
	ldr r2, [r0]
	cmp r2, #0
	beq _0234BB60
	ldr r1, _0234BBB8 @ =0x0235438C
	mov r0, #0x8000000
	blx r2
_0234BB60:
	mov r0, #0
	pop {r4, pc}
_0234BB68:
	cmp r4, #5
	bne _0234BB9C
	ldr r0, _0234BBB4 @ =0x0235AB64
	ldr r2, [r0]
	cmp r2, #0
	beq _0234BB8C
	ldr r1, _0234BBBC @ =0x023543BC
	mov r0, #0x8000000
	blx r2
_0234BB8C:
	mov r0, r4
	bl ov02_0234AC4C
	mov r0, #0
	pop {r4, pc}
_0234BB9C:
	cmp r4, #0
	moveq r0, #1
	popeq {r4, pc}
	bl ov02_0234AC4C
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_0234BBB4: .4byte 0x0235AB64
_0234BBB8: .4byte 0x0235438C
_0234BBBC: .4byte 0x023543BC
	arm_func_end ov02_0234BB18

	arm_func_start ov02_0234BBC0
ov02_0234BBC0: @ 0x0234BBC0
	push {r3, lr}
	bl ov02_0234B39C
	cmp r0, #0
	popne {r3, pc}
	mov r0, #0xa
	bl ov02_0234ABD0
	pop {r3, pc}
	arm_func_end ov02_0234BBC0

	arm_func_start ov02_0234BBDC
ov02_0234BBDC: @ 0x0234BBDC
	push {r3, lr}
	ldr r0, _0234BCD8 @ =0x0235AB64
	ldr r1, [r0, #4]
	ldr r2, [r1, #0x40]
	cmp r2, #1
	bne _0234BC10
	ldr r2, [r0]
	cmp r2, #0
	popeq {r3, pc}
	ldr r1, _0234BCDC @ =0x023543F0
	mov r0, #0x8000000
	blx r2
	pop {r3, pc}
_0234BC10:
	ldr r3, [r0]
	cmp r3, #0
	beq _0234BC28
	ldr r1, _0234BCE0 @ =0x02354414
	mov r0, #0x8000000
	blx r3
_0234BC28:
	ldr r0, _0234BCD8 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #6
	cmpne r0, #5
	cmpne r0, #4
	mov r0, #3
	beq _0234BC54
	bl ov02_0234ABD0
	bl ov02_0234BBC0
	pop {r3, pc}
_0234BC54:
	bl ov02_0234ABD0
	ldr r0, _0234BCD8 @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x44]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0234BC70: @ jump table
	b _0234BCC4 @ case 0
	b _0234BC9C @ case 1
	b _0234BCB0 @ case 2
	b _0234BC88 @ case 3
	b _0234BCC4 @ case 4
	b _0234BC9C @ case 5
_0234BC88:
	bl ov02_0234B28C
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0234BBC0
	pop {r3, pc}
_0234BC9C:
	bl ov02_0234B2DC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0234BBC0
	pop {r3, pc}
_0234BCB0:
	bl ov02_0234B18C
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0234BBC0
	pop {r3, pc}
_0234BCC4:
	bl ov02_0234B1BC
	cmp r0, #0
	popne {r3, pc}
	bl ov02_0234BBC0
	pop {r3, pc}
	.align 2, 0
_0234BCD8: .4byte 0x0235AB64
_0234BCDC: .4byte 0x023543F0
_0234BCE0: .4byte 0x02354414
	arm_func_end ov02_0234BBDC

	arm_func_start ov02_0234BCE4
ov02_0234BCE4: @ 0x0234BCE4
	push {r3, lr}
	ldr r0, _0234BD2C @ =0x0235AB64
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x40]
	cmp r0, #1
	beq _0234BD00
	bl FUN_0207BC20
_0234BD00:
	mov r0, #3
	bl ov02_0234ABD0
	ldr r0, _0234BD30 @ =ov02_0234B400
	bl FUN_022BFBD4
	cmp r0, #2
	moveq r0, #1
	popeq {r3, pc}
	mov r0, #9
	bl ov02_0234ABD0
	mov r0, #0
	pop {r3, pc}
	.align 2, 0
_0234BD2C: .4byte 0x0235AB64
_0234BD30: .4byte ov02_0234B400
	arm_func_end ov02_0234BCE4

	arm_func_start ov02_0234BD34
ov02_0234BD34: @ 0x0234BD34
	push {r4, lr}
	ldr r2, _0234BE20 @ =0x0235AB6C
	mov r4, r1
	str r0, [r2]
	add r0, r0, #0xb00
	bl ov02_02349EFC
	ldr r1, _0234BE20 @ =0x0235AB6C
	mov r3, #0
	ldr r0, [r1]
	mov r2, #1
	add r0, r0, #0x600
	strh r3, [r0, #0x48]
	ldr r0, [r1]
	add r0, r0, #0x600
	strh r3, [r0, #0x4a]
	ldr r0, [r1]
	strb r2, [r0, #0xa90]
	ldr r0, [r1]
	strb r2, [r0, #0xa91]
	ldr r0, [r1]
	str r3, [r0, #0xa9c]
	bl ov02_0234C8E4
	ldr r0, _0234BE20 @ =0x0235AB6C
	ldr r3, [r4]
	ldr r2, [r0]
	mov r1, #2
	str r3, [r2, #0xab4]
	ldr r3, [r4, #4]
	ldr r2, [r0]
	str r3, [r2, #0xab8]
	ldr r3, [r4, #8]
	ldr r2, [r0]
	str r3, [r2, #0xabc]
	ldr r3, [r4, #0xc]
	ldr r2, [r0]
	str r3, [r2, #0xac0]
	ldr r3, [r4, #0x10]
	ldr r2, [r0]
	str r3, [r2, #0xac4]
	ldr r3, [r4, #0x14]
	ldr r2, [r0]
	str r3, [r2, #0xac8]
	ldrb r3, [r4, #0x18]
	ldr r2, [r0]
	strb r3, [r2, #0xa92]
	ldr r0, [r0]
	strb r1, [r0, #0xacc]
	bl FUN_0207AE44
	ldr r0, _0234BE20 @ =0x0235AB6C
	ldr r0, [r0]
	add r0, r0, #0x24c
	add r0, r0, #0x400
	bl FUN_022ED660
	bl FUN_0207AE44
	bl ov02_02347D1C
	ldr r1, _0234BE20 @ =0x0235AB6C
	ldr r1, [r1]
	str r0, [r1, #0xaa4]
	pop {r4, pc}
	.align 2, 0
_0234BE20: .4byte 0x0235AB6C
	arm_func_end ov02_0234BD34

	arm_func_start ov02_0234BE24
ov02_0234BE24: @ 0x0234BE24
	push {r3, lr}
	ldr r0, _0234BEFC @ =0x0235AB6C
	ldr r2, [r0]
	ldrb r1, [r2, #0xa90]
	cmp r1, #1
	cmpne r1, #0x14
	cmpne r1, #0x17
	cmpne r1, #0x1a
	cmpne r1, #0x1d
	bne _0234BE6C
	mov r1, #0x22
	strb r1, [r2, #0xa90]
	ldr r0, _0234BEFC @ =0x0235AB6C
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xaac]
	mov r0, #1
	pop {r3, pc}
_0234BE6C:
	cmp r1, #4
	cmpne r1, #5
	cmpne r1, #6
	cmpne r1, #0xd
	bne _0234BEC0
	cmp r1, #4
	bne _0234BE98
	ldr r0, [r2, #0xa98]
	cmp r0, #6
	movlo r0, #0
	poplo {r3, pc}
_0234BE98:
	bl FUN_022C759C
	ldr r0, _0234BEFC @ =0x0235AB6C
	mov r3, #0x10
	ldr r1, [r0]
	mov r2, #2
	strb r3, [r1, #0xa90]
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xaac]
	pop {r3, pc}
_0234BEC0:
	add r0, r1, #0xf7
	and r0, r0, #0xff
	cmp r0, #1
	bhi _0234BEE0
	mov r0, #0x20
	strb r0, [r2, #0xa90]
	mov r0, #1
	pop {r3, pc}
_0234BEE0:
	cmp r1, #0xc
	movne r0, #0
	popne {r3, pc}
	mov r0, #0x22
	strb r0, [r2, #0xa90]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0234BEFC: .4byte 0x0235AB6C
	arm_func_end ov02_0234BE24

	arm_func_start ov02_0234BF00
ov02_0234BF00: @ 0x0234BF00
	push {r3, lr}
	ldr r0, _0234BF7C @ =0x0235AB6C
	ldr r0, [r0]
	ldr r0, [r0, #0xac8]
	bl ov02_0234B428
	ldr r0, _0234BF7C @ =0x0235AB6C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bl FUN_022BF96C
	ldr r3, _0234BF7C @ =0x0235AB6C
	mov r2, #0x40
	ldr r1, [r3]
	add r1, r1, #0x600
	strh r0, [r1, #0x48]
	ldr r1, [r3]
	ldr r0, [r1, #0xaa4]
	add r1, r1, #0xa50
	bl FUN_0207C4C8
	ldr r0, _0234BF7C @ =0x0235AB6C
	mov r2, #0
	ldr r1, [r0]
	strb r2, [r1, #0xa93]
	ldr r1, [r0]
	str r2, [r1, #0x204]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r1, [r0, #0x48]
	add r1, r1, #1
	strh r1, [r0, #0x48]
	pop {r3, pc}
	.align 2, 0
_0234BF7C: .4byte 0x0235AB6C
	arm_func_end ov02_0234BF00

	arm_func_start ov02_0234BF80
ov02_0234BF80: @ 0x0234BF80
	push {r3, lr}
	ldr r0, _0234BFC4 @ =0x0235AB6C
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #1
	cmpne r0, #0x1a
	cmpne r0, #0x1d
	movne r0, #0
	popne {r3, pc}
	bl ov02_0234BF00
	bl ov02_0234B830
	ldr r0, _0234BFC4 @ =0x0235AB6C
	mov r2, #2
	ldr r1, [r0]
	mov r0, #1
	strb r2, [r1, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0234BFC4: .4byte 0x0235AB6C
	arm_func_end ov02_0234BF80

	arm_func_start ov02_0234BFC8
ov02_0234BFC8: @ 0x0234BFC8
	push {r3, lr}
	ldr r0, _0234BFF8 @ =0x0235AB6C
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #5
	movne r0, #0
	popne {r3, pc}
	mov r0, #6
	strb r0, [r1, #0xa90]
	bl ov02_0234A3C8
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0234BFF8: .4byte 0x0235AB6C
	arm_func_end ov02_0234BFC8

	arm_func_start ov02_0234BFFC
ov02_0234BFFC: @ 0x0234BFFC
	push {r3, lr}
	ldr r1, _0234C378 @ =0x0235AB6C
	ldr r0, [r1]
	ldrb r2, [r0, #0xa90]
	cmp r2, #0x22
	addls pc, pc, r2, lsl #2
	pop {r3, pc}
_0234C018: @ jump table
	pop {r3, pc} @ case 0
	b _0234C0A4 @ case 1
	b _0234C0E0 @ case 2
	b _0234C0E8 @ case 3
	b _0234C100 @ case 4
	b _0234C114 @ case 5
	b _0234C114 @ case 6
	b _0234C11C @ case 7
	b _0234C124 @ case 8
	b _0234C124 @ case 9
	b _0234C124 @ case 10
	b _0234C12C @ case 11
	pop {r3, pc} @ case 12
	pop {r3, pc} @ case 13
	pop {r3, pc} @ case 14
	pop {r3, pc} @ case 15
	b _0234C134 @ case 16
	b _0234C14C @ case 17
	b _0234C168 @ case 18
	b _0234C18C @ case 19
	pop {r3, pc} @ case 20
	b _0234C1C4 @ case 21
	b _0234C1E8 @ case 22
	pop {r3, pc} @ case 23
	b _0234C220 @ case 24
	b _0234C244 @ case 25
	pop {r3, pc} @ case 26
	b _0234C27C @ case 27
	b _0234C2A0 @ case 28
	pop {r3, pc} @ case 29
	b _0234C370 @ case 30
	pop {r3, pc} @ case 31
	b _0234C314 @ case 32
	b _0234C338 @ case 33
	pop {r3, pc} @ case 34
_0234C0A4:
	ldrb r2, [r0, #0xaac]
	cmp r2, #1
	bne _0234C0C0
	mov r1, #0
	strb r1, [r0, #0xaac]
	bl ov02_0234BF80
	pop {r3, pc}
_0234C0C0:
	cmp r2, #2
	popne {r3, pc}
	mov r2, #0
	strb r2, [r0, #0xaac]
	ldr r0, [r1]
	mov r1, #0x22
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C0E0:
	bl ov02_0234C3D4
	pop {r3, pc}
_0234C0E8:
	bl ov02_0234C47C
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #4
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C100:
	ldr r1, [r0, #0xa98]
	add r1, r1, #1
	str r1, [r0, #0xa98]
	bl ov02_0234C4A0
	pop {r3, pc}
_0234C114:
	bl ov02_0234C4A0
	pop {r3, pc}
_0234C11C:
	bl ov02_0234C658
	pop {r3, pc}
_0234C124:
	bl ov02_0234C684
	pop {r3, pc}
_0234C12C:
	bl ov02_0234C860
	pop {r3, pc}
_0234C134:
	mov r2, #0
	str r2, [r0, #0xa9c]
	ldr r0, [r1]
	mov r1, #0x11
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C14C:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234C878
	pop {r3, pc}
_0234C168:
	bl FUN_022C759C
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C18C:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234B450
	cmp r0, #1
	popne {r3, pc}
	bl ov02_0234BCE4
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #0x14
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C1C4:
	bl ov02_0234BBDC
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x16
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C1E8:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234B450
	cmp r0, #1
	popne {r3, pc}
	bl ov02_0234BCE4
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #0x17
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C220:
	bl ov02_0234BBDC
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x19
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C244:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234B450
	cmp r0, #1
	popne {r3, pc}
	bl ov02_0234BCE4
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #0x1a
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C27C:
	bl ov02_0234BBDC
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x1c
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C2A0:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234B450
	cmp r0, #1
	bne _0234C2D8
	bl ov02_0234BCE4
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #0x1d
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C2D8:
	ldr r1, _0234C378 @ =0x0235AB6C
	ldr r0, _0234C37C @ =0x88888889
	ldr r1, [r1]
	mov r2, #0x1e
	ldr r3, [r1, #0xa9c]
	umull r0, r1, r3, r0
	lsr r1, r1, #4
	umull r0, r1, r2, r1
	sub r1, r3, r0
	cmp r1, #1
	popne {r3, pc}
	cmp r3, #0x37
	popls {r3, pc}
	bl ov02_0234BBDC
	pop {r3, pc}
_0234C314:
	bl ov02_0234BBDC
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #0x21
	str r3, [r2, #0xa9c]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C338:
	ldr r2, [r0, #0xa9c]
	add r1, r2, #1
	str r1, [r0, #0xa9c]
	cmp r2, #0x1e
	popls {r3, pc}
	bl ov02_0234B450
	cmp r0, #1
	popne {r3, pc}
	bl ov02_0234BCE4
	ldr r0, _0234C378 @ =0x0235AB6C
	mov r1, #0x22
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C370:
	bl ov02_0234BBDC
	pop {r3, pc}
	.align 2, 0
_0234C378: .4byte 0x0235AB6C
_0234C37C: .4byte 0x88888889
	arm_func_end ov02_0234BFFC

	arm_func_start ov02_0234C380
ov02_0234C380: @ 0x0234C380
	ldr r2, _0234C3C0 @ =0x0235AB6C
	ldr r3, [r2]
	ldrb r3, [r3, #0xa90]
	strb r3, [r0]
	ldr r0, [r2]
	ldrb r2, [r0, #0xa90]
	ldrb r0, [r0, #0xa91]
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	strb r0, [r1]
	ldr r0, _0234C3C0 @ =0x0235AB6C
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	strb r0, [r1, #0xa91]
	bx lr
	.align 2, 0
_0234C3C0: .4byte 0x0235AB6C
	arm_func_end ov02_0234C380

	arm_func_start ov02_0234C3C4
ov02_0234C3C4: @ 0x0234C3C4
	ldr ip, _0234C3D0 @ =FUN_022C32E4
	mov r0, #1
	bx ip
	.align 2, 0
_0234C3D0: .4byte FUN_022C32E4
	arm_func_end ov02_0234C3C4

	arm_func_start ov02_0234C3D4
ov02_0234C3D4: @ 0x0234C3D4
	push {r3, lr}
	bl ov02_0234B450
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0234C470
_0234C3E8: @ jump table
	b _0234C448 @ case 0
	b _0234C410 @ case 1
	b _0234C470 @ case 2
	pop {r3, pc} @ case 3
	b _0234C470 @ case 4
	b _0234C470 @ case 5
	b _0234C470 @ case 6
	b _0234C418 @ case 7
	b _0234C470 @ case 8
	b _0234C468 @ case 9
_0234C410:
	bl ov02_0234B464
	pop {r3, pc}
_0234C418:
	bl ov02_0234B6D0
	ldr r2, _0234C478 @ =0x0235AB6C
	mov ip, #0
	ldr r1, [r2]
	mov r3, #3
	add r1, r1, #0x600
	strh r0, [r1, #0x4a]
	ldr r0, [r2]
	str ip, [r0, #0xa98]
	ldr r0, [r2]
	strb r3, [r0, #0xa90]
	pop {r3, pc}
_0234C448:
	ldr r0, _0234C478 @ =0x0235AB6C
	mov r3, #0
	ldr r2, [r0]
	mov r1, #3
	str r3, [r2, #0xa98]
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C468:
	bl ov02_0234BBC0
	pop {r3, pc}
_0234C470:
	bl FUN_0207BC20
	pop {r3, pc}
	.align 2, 0
_0234C478: .4byte 0x0235AB6C
	arm_func_end ov02_0234C3D4

	arm_func_start ov02_0234C47C
ov02_0234C47C: @ 0x0234C47C
	ldr r0, _0234C498 @ =0x0235AB6C
	ldr ip, _0234C49C @ =FUN_02349F3C
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x48]
	ldr r0, [r2, #0xac8]
	bx ip
	.align 2, 0
_0234C498: .4byte 0x0235AB6C
_0234C49C: .4byte FUN_02349F3C
	arm_func_end ov02_0234C47C

	arm_func_start ov02_0234C4A0
ov02_0234C4A0: @ 0x0234C4A0
	push {r3, lr}
	bl ov02_0234A984
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0234C4B4: @ jump table
	b _0234C604 @ case 0
	b _0234C4D4 @ case 1
	b _0234C4F4 @ case 2
	b _0234C584 @ case 3
	pop {r3, pc} @ case 4
	b _0234C5D8 @ case 5
	pop {r3, pc} @ case 6
	b _0234C5EC @ case 7
_0234C4D4:
	ldr r0, _0234C654 @ =0x0235AB6C
	ldr r2, [r0]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x4a]
	add r0, r2, #0x2b4
	add r0, r0, #0x800
	bl ov02_0234A05C
	pop {r3, pc}
_0234C4F4:
	mov r0, #2
	bl ov02_0234A998
	cmp r0, #0
	beq _0234C518
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #5
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C518:
	mov r0, #3
	bl ov02_0234A998
	cmp r0, #0
	bne _0234C538
	mov r0, #4
	bl ov02_0234A998
	cmp r0, #0
	beq _0234C54C
_0234C538:
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #6
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C54C:
	ldr r0, _0234C654 @ =0x0235AB6C
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	cmp r0, #5
	popne {r3, pc}
	mov r0, #2
	bl ov02_0234A998
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #0xd
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C584:
	bl ov02_0234A4A8
	cmp r0, #0
	beq _0234C598
	bl ov02_0234A510
	pop {r3, pc}
_0234C598:
	ldr r0, _0234C654 @ =0x0235AB6C
	ldr r0, [r0]
	ldrb r0, [r0, #0xa90]
	add r0, r0, #0xfa
	and r0, r0, #0xff
	cmp r0, #1
	pophi {r3, pc}
	mov r0, #3
	bl ov02_0234A998
	cmp r0, #0
	popne {r3, pc}
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #0x12
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C5D8:
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #7
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C5EC:
	bl ov02_0234A608
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C604:
	bl ov02_0234B450
	cmp r0, #0
	beq _0234C62C
	cmp r0, #1
	beq _0234C624
	cmp r0, #3
	popeq {r3, pc}
	b _0234C640
_0234C624:
	bl ov02_0234BCE4
	pop {r3, pc}
_0234C62C:
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C640:
	ldr r0, _0234C654 @ =0x0235AB6C
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0234C654: .4byte 0x0235AB6C
	arm_func_end ov02_0234C4A0

	arm_func_start ov02_0234C658
ov02_0234C658: @ 0x0234C658
	push {r3, lr}
	bl ov02_0234C8E4
	ldr r0, _0234C67C @ =ov02_0234C8A8
	bl ov02_0234BADC
	ldr r0, _0234C680 @ =0x0235AB6C
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0234C67C: .4byte ov02_0234C8A8
_0234C680: .4byte 0x0235AB6C
	arm_func_end ov02_0234C658

	arm_func_start ov02_0234C684
ov02_0234C684: @ 0x0234C684
	push {r3, lr}
	bl ov02_0234B450
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	pop {r3, pc}
_0234C698: @ jump table
	pop {r3, pc} @ case 0
	b _0234C6B4 @ case 1
	pop {r3, pc} @ case 2
	pop {r3, pc} @ case 3
	b _0234C6E0 @ case 4
	b _0234C6E0 @ case 5
	b _0234C6E0 @ case 6
_0234C6B4:
	ldr r1, _0234C85C @ =0x0235AB6C
	mov r0, #4
	ldr r1, [r1]
	add r1, r1, #0x600
	ldrh r3, [r1, #0x48]
	ldrh r2, [r1, #0x4a]
	add r1, r3, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov02_0234B964
	pop {r3, pc}
_0234C6E0:
	ldr r1, _0234C85C @ =0x0235AB6C
	mov r0, #0
	ldr r2, [r1]
	add r1, r2, #0x200
	ldrh r1, [r1]
	ldr ip, [r2, #0xaa4]
	lsr r3, r1, #0x1f
	rsb r2, r3, r1, lsl #28
	add r2, r3, r2, ror #28
	add r2, ip, r2, lsl #6
	bl ov02_0234C928
	bl ov02_0234CA90
	ldr r0, _0234C85C @ =0x0235AB6C
	ldr r1, [r0]
	ldrb r0, [r1, #0xa90]
	cmp r0, #0x1b
	popeq {r3, pc}
	ldr r0, [r1, #0x204]
	cmp r0, #0x1e0
	movhi r0, #0x1b
	strbhi r0, [r1, #0xa90]
	pophi {r3, pc}
	bl ov02_0234CB74
	cmp r0, #0x10
	beq _0234C750
	bl ov02_0234CB74
	cmp r0, #0x20
	bne _0234C768
_0234C750:
	bl ov02_0234CB74
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0xa
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C768:
	bl ov02_0234CB74
	cmp r0, #0x40
	bne _0234C788
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0xb
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C788:
	bl ov02_0234CB74
	cmp r0, #0xff
	bne _0234C7A8
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C7A8:
	bl ov02_0234CB74
	cmp r0, #0x50
	bne _0234C7C8
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0x15
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C7C8:
	bl ov02_0234CB74
	cmp r0, #0x60
	bne _0234C7E8
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0x18
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C7E8:
	bl ov02_0234CB74
	cmp r0, #0x70
	bne _0234C808
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C808:
	bl ov02_0234CB74
	cmp r0, #0
	bne _0234C828
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #8
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C828:
	bl ov02_0234CB74
	cmp r0, #0xbd
	bne _0234C848
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #9
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
_0234C848:
	ldr r0, _0234C85C @ =0x0235AB6C
	mov r1, #0x1f
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0234C85C: .4byte 0x0235AB6C
	arm_func_end ov02_0234C684

	arm_func_start ov02_0234C860
ov02_0234C860: @ 0x0234C860
	ldr r0, _0234C874 @ =0x0235AB6C
	mov r1, #0xc
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	bx lr
	.align 2, 0
_0234C874: .4byte 0x0235AB6C
	arm_func_end ov02_0234C860

	arm_func_start ov02_0234C878
ov02_0234C878: @ 0x0234C878
	push {r3, lr}
	bl ov02_0234B450
	cmp r0, #1
	movne r0, #0
	popne {r3, pc}
	bl ov02_0234BCE4
	ldr r1, _0234C8A4 @ =0x0235AB6C
	mov r0, #1
	ldr r1, [r1]
	strb r0, [r1, #0xa90]
	pop {r3, pc}
	.align 2, 0
_0234C8A4: .4byte 0x0235AB6C
	arm_func_end ov02_0234C878

	arm_func_start ov02_0234C8A8
ov02_0234C8A8: @ 0x0234C8A8
	push {r4, lr}
	add r0, r0, #0xa
	bl ov02_0234AAEC
	movs r4, r0
	moveq r0, #0
	popeq {r4, pc}
	bl ov02_0234AAB8
	ldr r1, _0234C8E0 @ =0x0235AB6C
	sub r2, r4, #1
	ldr r1, [r1]
	add r1, r1, r2, lsl #2
	str r0, [r1, #0xaa0]
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_0234C8E0: .4byte 0x0235AB6C
	arm_func_end ov02_0234C8A8

	arm_func_start ov02_0234C8E4
ov02_0234C8E4: @ 0x0234C8E4
	push {r3, lr}
	ldr r0, _0234C924 @ =0x0235AB6C
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	add r0, r0, #0x100
	bl FUN_0207C40C
	ldr r0, _0234C924 @ =0x0235AB6C
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x100
	bl FUN_0207C40C
	ldr r0, _0234C924 @ =0x0235AB6C
	ldr r0, [r0]
	str r0, [r0, #0xab0]
	pop {r3, pc}
	.align 2, 0
_0234C924: .4byte 0x0235AB6C
	arm_func_end ov02_0234C8E4

	arm_func_start ov02_0234C928
ov02_0234C928: @ 0x0234C928
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0234CA8C @ =0x0235AB6C
	ldr r5, [r3]
	ldrb r4, [r5, #0xa93]
	cmp r4, #1
	bne _0234C970
	ldr r4, [r5, #0xab0]
	strh r0, [r4]
	ldr r4, [r3]
	mov r0, r2
	ldr r4, [r4, #0xab0]
	mov r2, #0x40
	strh r1, [r4, #2]
	ldr r1, [r3]
	ldr r1, [r1, #0xab0]
	add r1, r1, #4
	bl FUN_0207C4C8
	b _0234C99C
_0234C970:
	ldr r0, [r5, #0x204]
	mov r1, #0xbc
	add r0, r0, #1
	str r0, [r5, #0x204]
	ldr r0, [r3]
	ldr r0, [r0, #0xab0]
	strh r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, #0xa92]
	ldr r0, [r0, #0xab0]
	strb r1, [r0, #4]
_0234C99C:
	bl ov02_0234B450
	cmp r0, #5
	popne {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0234CA8C @ =0x0235AB6C
	ldr r0, [r0]
	bl ov02_0234BB18
	cmp r0, #0
	bne _0234C9D4
	ldr r0, _0234CA8C @ =0x0235AB6C
	ldr r1, [r0]
	ldr r0, [r1, #0x204]
	add r0, r0, #4
	str r0, [r1, #0x204]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0234C9D4:
	ldr r0, _0234CA8C @ =0x0235AB6C
	ldr r1, [r0]
	ldrb r0, [r1, #0xa93]
	cmp r0, #0
	bne _0234C9F8
	ldr r0, [r1, #0x204]
	add r0, r0, #1
	str r0, [r1, #0x204]
	b _0234CA20
_0234C9F8:
	mov r0, #0
	str r0, [r1, #0x204]
	bl ov02_0234B43C
	cmp r0, #3
	beq _0234CA20
	ldr r0, _0234CA8C @ =0x0235AB6C
	mov r1, #0x1b
	ldr r0, [r0]
	strb r1, [r0, #0xa90]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0234CA20:
	mov r7, #0
	mov r6, #0x44
	ldr sb, _0234CA8C @ =0x0235AB6C
	mov r4, r7
	mov r5, #1
	mov r8, r6
_0234CA38:
	mov r0, r7
	bl ov02_0234BAF0
	cmp r0, #0
	ldreq r0, [sb]
	addeq r0, r0, r7, lsl #2
	streq r4, [r0, #0x208]
	beq _0234CA74
	ldr r1, [sb]
	mov r2, r6
	add r1, r1, #0x100
	mla r1, r7, r8, r1
	bl FUN_0207C4C8
	ldr r0, [sb]
	add r0, r0, r7, lsl #2
	str r5, [r0, #0x208]
_0234CA74:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #2
	blo _0234CA38
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234CA8C: .4byte 0x0235AB6C
	arm_func_end ov02_0234C928

	arm_func_start ov02_0234CA90
ov02_0234CA90: @ 0x0234CA90
	push {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	ldr r4, _0234CB70 @ =0x0235AB6C
	mov r0, #1
	mov r5, ip
	mov r1, #0xbc
	mov r2, ip
	mov lr, #0x44
_0234CAB0:
	ldr r3, [r4]
	add r6, r3, ip, lsl #2
	ldr r6, [r6, #0x208]
	cmp r6, #0
	beq _0234CB60
	mul r7, ip, lr
	cmp ip, #1
	add r8, r3, #0x100
	bne _0234CB60
	ldrb r6, [r3, #0xa93]
	cmp r6, #1
	bne _0234CB30
	ldrh r6, [r8, r7]
	cmp r6, #0x10
	popne {r4, r5, r6, r7, r8, pc}
	ldr r6, [r3, #0xa94]
	add r6, r6, #1
	str r6, [r3, #0xa94]
	ldr r6, [r4]
	ldr r3, [r6, #0xa94]
	tst r3, #1
	bne _0234CB60
	add r3, r6, #0x200
	ldrh r6, [r3]
	add r6, r6, #1
	strh r6, [r3]
	ldr r3, [r4]
	add r3, r3, #0x200
	ldrh r6, [r3]
	cmp r6, #0x24
	strhhs r2, [r3]
	b _0234CB60
_0234CB30:
	add r3, r3, #0x200
	strh r1, [r3, #2]
	ldrh r3, [r8, r7]
	cmp r3, #0xbd
	bne _0234CB60
	ldr r3, [r4]
	strb r0, [r3, #0xa93]
	ldr r3, [r4]
	add r3, r3, #0x200
	strh r5, [r3]
	ldr r3, [r4]
	str r5, [r3, #0xa94]
_0234CB60:
	add ip, ip, #1
	cmp ip, #0x10
	blt _0234CAB0
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234CB70: .4byte 0x0235AB6C
	arm_func_end ov02_0234CA90

	arm_func_start ov02_0234CB74
ov02_0234CB74: @ 0x0234CB74
	ldr r0, _0234CB88 @ =0x0235AB6C
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrh r0, [r0, #0x44]
	bx lr
	.align 2, 0
_0234CB88: .4byte 0x0235AB6C
	arm_func_end ov02_0234CB74

	arm_func_start ov02_0234CB8C
ov02_0234CB8C: @ 0x0234CB8C
	push {r4, lr}
	sub sp, sp, #0xe8
	mov r0, #0xe8
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _0234CD1C @ =0x0235AB70
	str r0, [r1]
	add r0, sp, #0xa0
	bl FUN_0207F3E4
	ldr r1, _0234CD20 @ =0x02354438
	add r0, sp, #0xa0
	bl FUN_0207F6C4
	cmp r0, #0
	bne _0234CBC8
	bl FUN_0207BC20
_0234CBC8:
	bl FUN_0207902C
	ldr r2, _0234CD1C @ =0x0235AB70
	add r1, sp, #0x18
	ldr r3, [r2]
	mov r2, #8
	strh r0, [r3, #0xe4]
	add r0, sp, #0xa0
	ldr r4, [sp, #0xc4]
	bl FUN_0207F818
	add r0, sp, #0xa0
	add r1, sp, #0x10
	mov r2, #8
	bl FUN_0207F818
	add r0, sp, #0xa0
	bl FUN_0207F70C
	ldr r0, _0234CD1C @ =0x0235AB70
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_0207ED88
	ldr r0, _0234CD1C @ =0x0235AB70
	ldr r1, _0234CD24 @ =0x02352F18
	ldr r0, [r0]
	mov r2, #3
	add r0, r0, #0x88
	bl FUN_0207EDF4
	cmp r0, #0
	bne _0234CC38
	bl FUN_0207BC20
_0234CC38:
	ldr r0, _0234CD1C @ =0x0235AB70
	ldr r1, _0234CD28 @ =ov02_0234CDC8
	ldr r0, [r0]
	ldr r2, _0234CD2C @ =0x00000602
	add r0, r0, #0x88
	bl FUN_0207F318
	ldr r0, [sp, #0x18]
	ldr r1, _0234CD30 @ =ov02_0234CE2C
	str r0, [sp]
	ldr r2, [sp, #0x1c]
	ldr r0, _0234CD34 @ =0x0234CE7C
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0234CD1C @ =0x0235AB70
	ldr r2, [sp, #0x10]
	ldr r0, [r0]
	ldr r3, [sp, #0x14]
	mov r1, r4
	add r0, r0, #0x88
	bl FUN_0207EF2C
	cmp r0, #0
	bne _0234CC98
	bl FUN_0207BC20
_0234CC98:
	ldr r0, _0234CD1C @ =0x0235AB70
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	add r0, r0, #0x88
	bl FUN_0207F05C
	mov r1, #4
	mov r4, r0
	bl ov02_0234E7B4
	ldr r1, _0234CD1C @ =0x0235AB70
	mov r2, r4
	ldr r3, [r1]
	str r0, [r3]
	ldr r0, [r1]
	ldr r1, [r0], #0x88
	bl FUN_0207F05C
	ldr r1, _0234CD1C @ =0x0235AB70
	mov r0, #0x20
	ldr r1, [r1]
	mov r2, #4
	add r1, r1, #4
	bl ov02_0234D754
	ldr r2, _0234CD1C @ =0x0235AB70
	ldr r1, _0234CD38 @ =0x02354450
	ldr r3, [r2]
	ldr r2, _0234CD24 @ =0x02352F18
	str r0, [r3, #0x84]
	add r0, sp, #0x20
	bl FUN_020790DC
	add r0, sp, #0x20
	bl FUN_0207F894
	add sp, sp, #0xe8
	pop {r4, pc}
	.align 2, 0
_0234CD1C: .4byte 0x0235AB70
_0234CD20: .4byte 0x02354438
_0234CD24: .4byte 0x02352F18
_0234CD28: .4byte ov02_0234CDC8
_0234CD2C: .4byte 0x00000602
_0234CD30: .4byte ov02_0234CE2C
_0234CD34: .4byte 0x0234CE7C
_0234CD38: .4byte 0x02354450
	arm_func_end ov02_0234CB8C

	arm_func_start ov02_0234CD3C
ov02_0234CD3C: @ 0x0234CD3C
	push {r3, lr}
	ldr r0, _0234CDBC @ =0x02354458
	bl FUN_0207F894
	ldr r0, _0234CDC0 @ =0x0235AB70
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_0207F180
	ldr r0, _0234CDC0 @ =0x0235AB70
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_0207EF9C
	ldr r0, _0234CDC0 @ =0x0235AB70
	ldr r0, [r0]
	add r0, r0, #0x88
	bl FUN_0207EEA8
	ldr r0, _0234CDC0 @ =0x0235AB70
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_02079094
	ldr r0, _0234CDC0 @ =0x0235AB70
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #0xe4]
	ldr r0, [r0]
	bl ov02_0234E7D8
	ldr r1, _0234CDC0 @ =0x0235AB70
	ldr r0, _0234CDC4 @ =0x0235AB70
	ldr r1, [r1]
	mov r2, #0
	str r2, [r1]
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_0234CDBC: .4byte 0x02354458
_0234CDC0: .4byte 0x0235AB70
_0234CDC4: .4byte 0x0235AB70
	arm_func_end ov02_0234CD3C

	arm_func_start ov02_0234CDC8
ov02_0234CDC8: @ 0x0234CDC8
	push {r3, lr}
	cmp r1, #1
	beq _0234CE18
	cmp r1, #9
	beq _0234CDE8
	cmp r1, #0xa
	beq _0234CE00
	b _0234CE20
_0234CDE8:
	ldr r0, _0234CE28 @ =0x0235AB70
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_02083434
	mov r0, #0
	pop {r3, pc}
_0234CE00:
	ldr r0, _0234CE28 @ =0x0235AB70
	ldr r0, [r0]
	ldrh r0, [r0, #0xe4]
	bl FUN_02083450
	mov r0, #0
	pop {r3, pc}
_0234CE18:
	mov r0, #4
	pop {r3, pc}
_0234CE20:
	mov r0, #8
	pop {r3, pc}
	.align 2, 0
_0234CE28: .4byte 0x0235AB70
	arm_func_end ov02_0234CDC8

	arm_func_start ov02_0234CE2C
ov02_0234CE2C: @ 0x0234CE2C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _0234CE68 @ =0x0234CE6C
	mov lr, r1
	str ip, [sp]
	mov ip, #1
	stmib sp, {r0, ip}
	ldr r0, [r0, #0x28]
	add r1, r2, r0
	mov r2, lr
	sub r0, ip, #2
	bl FUN_0208420C
	mov r0, #6
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0234CE68: .4byte 0x0234CE6C
_0234CE6C:
	.byte 0x04, 0xC0, 0x9F, 0xE5
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x1C, 0xFF, 0x2F, 0xE1
_0234CE78: .4byte FUN_0207F338
	arm_func_end ov02_0234CE2C
_0234CE7C:
	.byte 0x01, 0x00, 0xA0, 0xE3
	.byte 0x1E, 0xFF, 0x2F, 0xE1

	arm_func_start ov02_0234CE84
ov02_0234CE84: @ 0x0234CE84
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	ldr r3, _0234CF70 @ =0x0235AB70
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x84]
	mov r4, r2
	bl ov02_0234D808
	add r0, sp, #4
	bl FUN_0207F3E4
	add r0, sp, #4
	mov r1, r6
	bl FUN_0207F6C4
	cmp r0, #0
	bne _0234CEC8
	bl FUN_0207BC20
_0234CEC8:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	mov r2, #2
	sub r7, r1, r0
	cmp r5, #0
	ldr r1, _0234CF74 @ =0x02354460
	mov r0, r6
	strne r7, [r5]
	bl ov02_0234CFAC
	cmp r0, #0
	mvnne r6, #3
	moveq r6, r4
	mov r0, r7
	mov r1, r6
	bl ov02_0234E7B4
	mov r1, r0
	add r0, sp, #4
	mov r2, r7
	str r1, [sp]
	bl FUN_0207F818
	add r0, sp, #4
	bl FUN_0207F70C
	cmp r6, #0
	ldrgt r0, [sp]
	addgt sp, sp, #0x4c
	popgt {r4, r5, r6, r7, pc}
	ldr r0, [sp]
	cmp r5, #0
	ldr r0, [r0]
	mov r1, r4
	lsr r0, r0, #8
	strne r0, [r5]
	bl ov02_0234E7B4
	mov r4, r0
	ldr r0, [sp]
	mov r1, r4
	bl FUN_0207C650
	add r0, sp, #0
	bl ov02_0234E7D8
	mov r0, r4
	add sp, sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0234CF70: .4byte 0x0235AB70
_0234CF74: .4byte 0x02354460
	arm_func_end ov02_0234CE84

	arm_func_start ov02_0234CF78
ov02_0234CF78: @ 0x0234CF78
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov02_0234E7D8
	ldr r0, _0234CFA8 @ =0x0235AB70
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0x84]
	bl ov02_0234D7B0
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0234CFA8: .4byte 0x0235AB70
	arm_func_end ov02_0234CF78

	arm_func_start ov02_0234CFAC
ov02_0234CFAC: @ 0x0234CFAC
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r5, r2
	bl FUN_02089678
	mov r4, r0
	mov r0, r6
	bl FUN_02089678
	cmp r4, r5
	cmpge r0, r5
	movlt r0, #0
	poplt {r3, r4, r5, r6, r7, pc}
	sub r1, r0, r5
	sub r3, r4, r5
	mov r2, r5
	add r0, r7, r3
	add r1, r6, r1
	bl FUN_02087348
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0234CFAC

	arm_func_start ov02_0234D004
ov02_0234D004: @ 0x0234D004
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x450
	mov r1, #4
	bl ov02_0234E7B4
	ldr sl, _0234D0D4 @ =0x0235AB74
	mov r8, #0
	mov sb, r8
	str r0, [sl]
	mov r7, #0x20
	mov r6, #0x10
	mov r5, #0x40
	mov r4, #0x7f
_0234D034:
	ldr r1, [sl]
	mov r0, r7
	mov r2, r6
	add r1, r1, sb
	bl ov02_0234D754
	ldr r1, [sl]
	add r1, r1, sb
	str r0, [r1, #0x224]
	bl ov02_0234F0C0
	ldr r2, [sl]
	mov r1, r5
	add r2, r2, sb
	str r0, [r2, #0x220]
	mov r0, r8
	bl ov02_0234F30C
	ldr r2, [sl]
	mov r1, r4
	add r2, r2, sb
	str r0, [r2, #0x208]
	mov r0, r8
	bl ov02_0234F30C
	add r1, r0, #8
	ldr r0, [sl]
	add r0, r0, sb
	str r1, [r0, #0x218]
	ldr r0, [sl]
	add r1, r0, sb
	ldr r0, [r1, #0x220]
	add r1, r1, #0x200
	bl ov02_0234F180
	ldr r0, [sl]
	add r1, r0, sb
	ldr r0, [r1, #0x220]
	add r1, r1, #0x210
	bl ov02_0234F170
	add sb, sb, #0x228
	add r8, r8, #1
	cmp r8, #2
	blt _0234D034
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0234D0D4: .4byte 0x0235AB74
	arm_func_end ov02_0234D004

	arm_func_start ov02_0234D0D8
ov02_0234D0D8: @ 0x0234D0D8
	push {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _0234D124 @ =0x0235AB74
	mov r6, r5
_0234D0E8:
	ldr r0, [r4]
	add r0, r0, r6
	ldr r0, [r0, #0x220]
	bl ov02_0234F0EC
	ldr r0, [r4]
	add r0, r0, r6
	ldr r0, [r0, #0x224]
	bl ov02_0234D794
	add r5, r5, #1
	cmp r5, #2
	add r6, r6, #0x228
	blt _0234D0E8
	ldr r0, _0234D128 @ =0x0235AB74
	bl ov02_0234E7D8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234D124: .4byte 0x0235AB74
_0234D128: .4byte 0x0235AB74
	arm_func_end ov02_0234D0D8

	arm_func_start ov02_0234D12C
ov02_0234D12C: @ 0x0234D12C
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x228
	mul r7, sb, r0
	ldr r0, _0234D284 @ =0x0235AB74
	mov r8, r1
	ldr r0, [r0]
	mov r5, r2
	add r0, r0, r7
	ldr r0, [r0, #0x224]
	bl ov02_0234D808
	mov r4, r0
	mov r0, #1
	bl FUN_02078C98
	mov r6, r0
	cmp r5, #0
	mov r0, #0x228
	beq _0234D1F0
	ldr r1, _0234D284 @ =0x0235AB74
	ldr r1, [r1]
	mla r0, sb, r0, r1
	add r5, r0, #0x200
	add r0, r0, #0x210
	cmp r5, r0
	beq _0234D1D0
	add r0, r1, r7
	add r1, r0, #0x210
_0234D198:
	ldrb r3, [r5, #0xc]
	ldmib r5, {r0, sb}
	add sb, sb, r3, lsl #3
	ldr r2, [r0, #8]
	add r3, sb, r8, lsl #3
	cmp r3, r2
	bhi _0234D1C4
	mov r1, r4
	str sb, [r4, #8]
	bl ov02_0234F140
	b _0234D1D0
_0234D1C4:
	mov r5, r0
	cmp r0, r1
	bne _0234D198
_0234D1D0:
	ldr r0, _0234D284 @ =0x0235AB74
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x210
	cmp r5, r0
	bne _0234D270
	bl FUN_0207BC20
	b _0234D270
_0234D1F0:
	ldr r1, _0234D284 @ =0x0235AB74
	ldr r1, [r1]
	mla r0, sb, r0, r1
	add r5, r0, #0x210
	add r0, r0, #0x200
	cmp r5, r0
	beq _0234D254
	add r0, r1, r7
	add r0, r0, #0x200
_0234D214:
	ldr sb, [r5]
	ldr r3, [r5, #8]
	ldrb r1, [sb, #0xc]
	ldr r2, [sb, #8]
	sub r3, r3, r8, lsl #3
	add r1, r2, r1, lsl #3
	cmp r3, r1
	blo _0234D248
	mov r0, r5
	mov r1, r4
	str r3, [r4, #8]
	bl ov02_0234F140
	b _0234D254
_0234D248:
	mov r5, sb
	cmp sb, r0
	bne _0234D214
_0234D254:
	ldr r0, _0234D284 @ =0x0235AB74
	ldr r0, [r0]
	add r0, r0, r7
	add r0, r0, #0x200
	cmp r5, r0
	bne _0234D270
	bl FUN_0207BC20
_0234D270:
	mov r0, r6
	bl FUN_02078C68
	mov r0, r4
	strb r8, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234D284: .4byte 0x0235AB74
	arm_func_end ov02_0234D12C

	arm_func_start ov02_0234D288
ov02_0234D288: @ 0x0234D288
	push {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0xc]
	mov r4, #0
	mov r3, r4
	cmp r0, #0
	ldr r2, [r5, #8]
	ble _0234D2CC
	ldr r0, _0234D300 @ =0xC1FFFCFF
_0234D2AC:
	ldr r1, [r2]
	add r3, r3, #1
	and r1, r1, r0
	orr r1, r1, #0x200
	str r1, [r2], #8
	ldrb r1, [r5, #0xc]
	cmp r3, r1
	blt _0234D2AC
_0234D2CC:
	mov r0, r5
	bl ov02_0234F108
	ldr r0, _0234D304 @ =0x0235AB74
	ldr r1, [r0]
	add r0, r1, #0x228
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x228
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x224]
	mov r1, r5
	bl ov02_0234D7B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234D300: .4byte 0xC1FFFCFF
_0234D304: .4byte 0x0235AB74
	arm_func_end ov02_0234D288

	arm_func_start ov02_0234D308
ov02_0234D308: @ 0x0234D308
	ldr r0, [r0, #8]
	add r0, r0, r1, lsl #3
	bx lr
	arm_func_end ov02_0234D308

	arm_func_start ov02_0234D314
ov02_0234D314: @ 0x0234D314
	ldrb r0, [r0, #0xc]
	bx lr
	arm_func_end ov02_0234D314

	arm_func_start ov02_0234D31C
ov02_0234D31C: @ 0x0234D31C
	push {r4, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0234D368
	cmp r2, #0x100
	cmpne r2, #0x300
	ldr r0, _0234D3BC @ =0xC1FFFCFF
	beq _0234D350
	ldr r3, [ip, r1, lsl #3]
	and r0, r3, r0
	orr r0, r0, r2
	str r0, [ip, r1, lsl #3]
	pop {r4, pc}
_0234D350:
	ldr r4, [ip, r1, lsl #3]
	and r0, r4, r0
	orr r0, r0, r2
	orr r0, r0, r3, lsl #25
	str r0, [ip, r1, lsl #3]
	pop {r4, pc}
_0234D368:
	ldrb r4, [r0, #0xc]
	mov r1, #0
	cmp r4, #0
	pople {r4, pc}
	ldr lr, _0234D3BC @ =0xC1FFFCFF
_0234D37C:
	cmp r2, #0x100
	cmpne r2, #0x300
	ldr r4, [ip, r1, lsl #3]
	beq _0234D398
	and r4, r4, lr
	orr r4, r4, r2
	b _0234D3A4
_0234D398:
	and r4, r4, lr
	orr r4, r4, r2
	orr r4, r4, r3, lsl #25
_0234D3A4:
	str r4, [ip, r1, lsl #3]
	ldrb r4, [r0, #0xc]
	add r1, r1, #1
	cmp r1, r4
	blt _0234D37C
	pop {r4, pc}
	.align 2, 0
_0234D3BC: .4byte 0xC1FFFCFF
	arm_func_end ov02_0234D31C

	arm_func_start ov02_0234D3C0
ov02_0234D3C0: @ 0x0234D3C0
	push {r4, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0234D3F8
	ldr r0, [ip, r1, lsl #3]
	add lr, ip, r1, lsl #3
	bic r0, r0, #0xc00
	orr r0, r0, r2, lsl #10
	str r0, [ip, r1, lsl #3]
	ldrh r0, [lr, #4]
	bic r0, r0, #0xf000
	orr r0, r0, r3, lsl #12
	strh r0, [lr, #4]
	pop {r4, pc}
_0234D3F8:
	ldrb r1, [r0, #0xc]
	mov r4, #0
	cmp r1, #0
	pople {r4, pc}
_0234D408:
	ldr r1, [ip, r4, lsl #3]
	add lr, ip, r4, lsl #3
	bic r1, r1, #0xc00
	orr r1, r1, r2, lsl #10
	str r1, [ip, r4, lsl #3]
	ldrh r1, [lr, #4]
	add r4, r4, #1
	bic r1, r1, #0xf000
	orr r1, r1, r3, lsl #12
	strh r1, [lr, #4]
	ldrb r1, [r0, #0xc]
	cmp r4, r1
	blt _0234D408
	pop {r4, pc}
	arm_func_end ov02_0234D3C0

	arm_func_start ov02_0234D440
ov02_0234D440: @ 0x0234D440
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	cmp r1, #0
	ldr r5, [r0, #8]
	blt _0234D47C
	ldr r4, [r5, r1, lsl #3]
	ldr r0, _0234D528 @ =0xFE00FF00
	and r3, r3, #0xff
	and r0, r4, r0
	lsl r2, r2, #0x17
	orr r0, r0, r3
	orr r0, r0, r2, lsr #7
	add sp, sp, #0x10
	str r0, [r5, r1, lsl #3]
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_0234D47C:
	ldr r1, [r5]
	ldr ip, _0234D528 @ =0xFE00FF00
	and r6, r3, #0xff
	and r7, r1, ip
	mov sb, r1
	ldr r1, _0234D52C @ =0x01FF0000
	lsl r8, r2, #0x17
	orr r6, r7, r6
	orr r6, r6, r8, lsr #7
	str r6, [r5]
	ldrb r6, [r0, #0xc]
	and r4, sb, r1
	and lr, sb, #0xff
	lsr r7, r4, #0x10
	str r7, [sp, #0xc]
	cmp r6, #1
	str lr, [sp, #8]
	sub r6, r2, r4, lsr #16
	sub r7, r3, lr
	mov r4, #1
	addle sp, sp, #0x10
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
_0234D4D4:
	ldr r2, [r5, r4, lsl #3]
	and r3, r2, #0xff
	mov sb, r2
	and lr, r2, r1
	add r8, r3, r7
	add r2, r6, lr, lsr #16
	and sb, sb, ip
	and r8, r8, #0xff
	lsl sl, r2, #0x17
	orr r2, sb, r8
	orr r2, r2, sl, lsr #7
	str r2, [r5, r4, lsl #3]
	ldrb r2, [r0, #0xc]
	add r4, r4, #1
	lsr r8, lr, #0x10
	cmp r4, r2
	blt _0234D4D4
	str r3, [sp]
	str r8, [sp, #4]
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0234D528: .4byte 0xFE00FF00
_0234D52C: .4byte 0x01FF0000
	arm_func_end ov02_0234D440

	arm_func_start ov02_0234D530
ov02_0234D530: @ 0x0234D530
	push {r3, lr}
	cmp r1, #0
	ldr ip, [r0, #8]
	blt _0234D558
	add r1, ip, r1, lsl #3
	ldrh r0, [r1, #4]
	bic r0, r0, #0xc00
	orr r0, r0, r2, lsl #10
	strh r0, [r1, #4]
	pop {r3, pc}
_0234D558:
	ldrb r1, [r0, #0xc]
	mov lr, #0
	cmp r1, #0
	pople {r3, pc}
_0234D568:
	add r3, ip, lr, lsl #3
	ldrh r1, [r3, #4]
	add lr, lr, #1
	bic r1, r1, #0xc00
	orr r1, r1, r2, lsl #10
	strh r1, [r3, #4]
	ldrb r1, [r0, #0xc]
	cmp lr, r1
	blt _0234D568
	pop {r3, pc}
	arm_func_end ov02_0234D530

	arm_func_start ov02_0234D590
ov02_0234D590: @ 0x0234D590
	push {r3, lr}
	ldr lr, [r0, #8]
	ldr r0, _0234D5BC @ =0x01FF0000
	ldr ip, [lr, r1, lsl #3]
	and r0, ip, r0
	lsr r0, r0, #0x10
	str r0, [r2]
	ldr r0, [lr, r1, lsl #3]
	and r0, r0, #0xff
	str r0, [r3]
	pop {r3, pc}
	.align 2, 0
_0234D5BC: .4byte 0x01FF0000
	arm_func_end ov02_0234D590

	arm_func_start ov02_0234D5C0
ov02_0234D5C0: @ 0x0234D5C0
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, r1
	add r1, sp, #0
	mov r2, #4
	bl ov02_0234CE84
	ldr r1, _0234D5EC @ =0x0235AB78
	str r0, [r1, r4, lsl #2]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0234D5EC: .4byte 0x0235AB78
	arm_func_end ov02_0234D5C0

	arm_func_start ov02_0234D5F0
ov02_0234D5F0: @ 0x0234D5F0
	push {r4, lr}
	ldr r1, _0234D614 @ =0x0235AB78
	mov r4, r0
	ldr r0, [r1, r4, lsl #2]
	bl ov02_0234CF78
	ldr r0, _0234D614 @ =0x0235AB78
	mov r1, #0
	str r1, [r0, r4, lsl #2]
	pop {r4, pc}
	.align 2, 0
_0234D614: .4byte 0x0235AB78
	arm_func_end ov02_0234D5F0

	arm_func_start ov02_0234D618
ov02_0234D618: @ 0x0234D618
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r3, _0234D6A8 @ =0x0235AB78
	mov r5, r2
	ldr r6, [r3, r0, lsl #2]
	lsl r2, r1, #3
	add r0, r6, r1, lsl #3
	ldr r3, [r0, #4]
	ldrh r4, [r6, r2]
	add r1, sp, #0
	mov r0, #0
	mov r2, #8
	add sb, r6, r3
	bl FUN_0207C314
	cmp r4, #0
	mov sl, #0
	addle sp, sp, #8
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	add r8, sp, #0
	mov r7, #6
	mov r6, #8
_0234D66C:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl FUN_0207C2E0
	mov r0, r8
	mov r1, r5
	mov r2, r6
	bl FUN_0207C330
	add sl, sl, #1
	cmp sl, r4
	add sb, sb, #6
	add r5, r5, #8
	blt _0234D66C
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0234D6A8: .4byte 0x0235AB78
	arm_func_end ov02_0234D618

	arm_func_start ov02_0234D6AC
ov02_0234D6AC: @ 0x0234D6AC
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl ov02_0234F2A0
	mov r4, r0
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov02_0234D618
	mov r0, r4
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0234D6AC

	arm_func_start ov02_0234D6D8
ov02_0234D6D8: @ 0x0234D6D8
	push {r4, r5, r6, lr}
	ldr r3, _0234D71C @ =0x0235AB78
	mov r6, r0
	mov r5, r1
	ldr r3, [r3, r6, lsl #2]
	lsl r1, r5, #3
	ldrh r1, [r3, r1]
	bl ov02_0234D12C
	mov r1, #0
	mov r4, r0
	bl ov02_0234D308
	mov r2, r0
	mov r0, r6
	mov r1, r5
	bl ov02_0234D618
	mov r0, r4
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234D71C: .4byte 0x0235AB78
	arm_func_end ov02_0234D6D8

	arm_func_start ov02_0234D720
ov02_0234D720: @ 0x0234D720
	push {r4, lr}
	mov r4, r0
	add r0, r4, #1
	lsl r0, r0, #2
	add r0, r0, #8
	mov r1, #4
	bl ov02_0234E7B4
	add r1, r4, #1
	strh r1, [r0]
	mov r1, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	pop {r4, pc}
	arm_func_end ov02_0234D720

	arm_func_start ov02_0234D754
ov02_0234D754: @ 0x0234D754
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl ov02_0234D720
	cmp r6, #0
	mov r2, #0
	ble _0234D78C
_0234D774:
	add r1, r0, r2, lsl #2
	add r2, r2, #1
	str r5, [r1, #4]
	cmp r2, r6
	add r5, r5, r4
	blt _0234D774
_0234D78C:
	strb r6, [r0, #3]
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0234D754

	arm_func_start ov02_0234D794
ov02_0234D794: @ 0x0234D794
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov02_0234E7D8
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov02_0234D794

	arm_func_start ov02_0234D7B0
ov02_0234D7B0: @ 0x0234D7B0
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl FUN_02078C98
	ldrb r2, [r5, #3]
	mov r6, r0
	ldrh r1, [r5]
	add r0, r2, #1
	bl FUN_02075C38
	ldrb r1, [r5, #2]
	mov r7, r0
	cmp r7, r1
	bne _0234D7EC
	bl FUN_0207BC20
_0234D7EC:
	ldrb r1, [r5, #3]
	mov r0, r6
	add r1, r5, r1, lsl #2
	str r4, [r1, #4]
	strb r7, [r5, #3]
	bl FUN_02078C68
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end ov02_0234D7B0

	arm_func_start ov02_0234D808
ov02_0234D808: @ 0x0234D808
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, #0
	bl FUN_02078C98
	ldrb r2, [r6, #3]
	ldrb r1, [r6, #2]
	mov r5, r0
	cmp r1, r2
	beq _0234D850
	ldrh r1, [r6]
	add r0, r2, r1
	sub r0, r0, #1
	bl FUN_02075C38
	and r1, r0, #0xff
	strb r0, [r6, #3]
	add r0, r6, r1, lsl #2
	ldr r4, [r0, #4]
_0234D850:
	mov r0, r5
	bl FUN_02078C68
	mov r0, r4
	pop {r4, r5, r6, pc}
	arm_func_end ov02_0234D808

	arm_func_start ov02_0234D860
ov02_0234D860: @ 0x0234D860
	push {r3, lr}
	mov r0, #0x18
	mov r1, #4
	bl ov02_0234E7B4
	ldr r2, _0234D89C @ =0x0235AB80
	mov r1, #0x3f
	str r0, [r2]
	ldr r0, _0234D8A0 @ =0x04000050
	mov r2, #0x10
	bl FUN_02077704
	ldr r0, _0234D8A4 @ =0x04001050
	mov r1, #0x3f
	mov r2, #0x10
	bl FUN_02077704
	pop {r3, pc}
	.align 2, 0
_0234D89C: .4byte 0x0235AB80
_0234D8A0: .4byte 0x04000050
_0234D8A4: .4byte 0x04001050
	arm_func_end ov02_0234D860

	arm_func_start ov02_0234D8A8
ov02_0234D8A8: @ 0x0234D8A8
	ldr ip, _0234D8B4 @ =ov02_0234E7D8
	ldr r0, _0234D8B8 @ =0x0235AB80
	bx ip
	.align 2, 0
_0234D8B4: .4byte ov02_0234E7D8
_0234D8B8: .4byte 0x0235AB80
	arm_func_end ov02_0234D8A8

	arm_func_start ov02_0234D8BC
ov02_0234D8BC: @ 0x0234D8BC
	cmp r0, #1
	ldreq r0, _0234D8DC @ =0x0235AB80
	ldreq r0, [r0]
	ldrne r0, _0234D8DC @ =0x0235AB80
	ldrne r0, [r0]
	addne r0, r0, #0xc
	ldrb r0, [r0, #9]
	bx lr
	.align 2, 0
_0234D8DC: .4byte 0x0235AB80
	arm_func_end ov02_0234D8BC

	arm_func_start ov02_0234D8E0
ov02_0234D8E0: @ 0x0234D8E0
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r4, _0234D9A4 @ =0x02352F1C
	mov r5, r0
	ldrb r0, [r4, #0xb]
	ldrb r6, [r4, #8]
	ldrb lr, [r4, #9]
	strb r0, [sp, #3]
	cmp r1, #1
	ldreq r0, _0234D9A8 @ =0x0235AB80
	strb r6, [sp]
	ldreq r6, [r0]
	ldrne r0, _0234D9A8 @ =0x0235AB80
	ldrb ip, [r4, #0xa]
	ldrne r0, [r0]
	mov r4, r3
	addne r6, r0, #0xc
	ldrb r0, [r6, #9]
	strb lr, [sp, #1]
	strb ip, [sp, #2]
	cmp r0, #0
	addne sp, sp, #4
	movne r0, #0
	popne {r3, r4, r5, r6, pc}
	cmp r1, #1
	add r0, sp, #0
	mov r1, r2
	bne _0234D960
	ldrsb r2, [r0, r5]
	ldr r0, _0234D9AC @ =0x04001050
	bl FUN_02077704
	b _0234D96C
_0234D960:
	ldrsb r2, [r0, r5]
	ldr r0, _0234D9B0 @ =0x04000050
	bl FUN_02077704
_0234D96C:
	ldr r1, _0234D9B4 @ =ov02_0234D9B8
	mov r2, r6
	mov r0, #1
	mov r3, #0xc8
	bl ov02_0234FA98
	str r0, [r6]
	mov r0, #0
	strh r0, [r6, #4]
	strb r5, [r6, #8]
	strh r4, [r6, #6]
	mov r0, #1
	strb r0, [r6, #9]
	add sp, sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0234D9A4: .4byte 0x02352F1C
_0234D9A8: .4byte 0x0235AB80
_0234D9AC: .4byte 0x04001050
_0234D9B0: .4byte 0x04000050
_0234D9B4: .4byte ov02_0234D9B8
	arm_func_end ov02_0234D8E0

	arm_func_start ov02_0234D9B8
ov02_0234D9B8: @ 0x0234D9B8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r2, _0234DAD0 @ =0x02352F1C
	mov r4, r1
	ldrsh r1, [r4, #4]
	ldrb sb, [r2, #4]
	ldrb r8, [r2, #5]
	ldrb r7, [r2, #6]
	ldrb r6, [r2, #7]
	ldrb lr, [r2]
	ldrb ip, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	add r1, r1, #1
	mov r5, r0
	strh r1, [r4, #4]
	ldrsh r0, [r4, #4]
	ldrh r1, [r4, #6]
	strb sb, [sp, #4]
	lsl r0, r0, #4
	strb r8, [sp, #5]
	strb r7, [sp, #6]
	strb r6, [sp, #7]
	strb lr, [sp]
	strb ip, [sp, #1]
	strb r3, [sp, #2]
	strb r2, [sp, #3]
	bl FUN_02075BFC
	ldrb r3, [r4, #8]
	add r2, sp, #4
	mov r1, r0
	ldrb r0, [r2, r3]
	tst r0, #1
	rsbne r1, r1, #0x10
	tst r0, #0x10
	ldr r0, _0234DAD4 @ =0x0235AB80
	rsbne r1, r1, #0
	ldr r0, [r0]
	cmp r4, r0
	bne _0234DA64
	ldr r0, _0234DAD8 @ =0x04001050
	bl FUN_0207772C
	b _0234DA6C
_0234DA64:
	ldr r0, _0234DADC @ =0x04000050
	bl FUN_0207772C
_0234DA6C:
	ldrsh r1, [r4, #4]
	ldrh r0, [r4, #6]
	cmp r1, r0
	addlt sp, sp, #8
	poplt {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _0234DAD4 @ =0x0235AB80
	ldrb r2, [r4, #8]
	ldr r0, [r0]
	add r1, sp, #0
	cmp r4, r0
	bne _0234DAA8
	ldrsb r1, [r1, r2]
	ldr r0, _0234DAD8 @ =0x04001050
	bl FUN_0207772C
	b _0234DAB4
_0234DAA8:
	ldrsb r1, [r1, r2]
	ldr r0, _0234DADC @ =0x04000050
	bl FUN_0207772C
_0234DAB4:
	mov r2, #0
	mov r1, r5
	mov r0, #1
	strb r2, [r4, #9]
	bl ov02_0234FB40
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234DAD0: .4byte 0x02352F1C
_0234DAD4: .4byte 0x0235AB80
_0234DAD8: .4byte 0x04001050
_0234DADC: .4byte 0x04000050
	arm_func_end ov02_0234D9B8

	arm_func_start ov02_0234DAE0
ov02_0234DAE0: @ 0x0234DAE0
	push {r3, r4, r5, lr}
	ldr r1, _0234DB30 @ =0x0235AB80
	mov r5, r0
	ldr r4, [r1]
	ldrb r0, [r4, #9]
	cmp r0, #0
	movne r0, #0
	popne {r3, r4, r5, pc}
	ldr r1, _0234DB34 @ =ov02_0234DB38
	mov r2, r4
	mov r0, #1
	mov r3, #0xc8
	bl ov02_0234FA98
	str r0, [r4]
	mov r0, #0
	strh r0, [r4, #4]
	strh r5, [r4, #6]
	mov r0, #1
	strb r0, [r4, #9]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234DB30: .4byte 0x0235AB80
_0234DB34: .4byte ov02_0234DB38
	arm_func_end ov02_0234DAE0

	arm_func_start ov02_0234DB38
ov02_0234DB38: @ 0x0234DB38
	push {r3, lr}
	ldrsh r2, [r1, #4]
	add r2, r2, #1
	strh r2, [r1, #4]
	ldrsh r3, [r1, #4]
	ldrh r2, [r1, #6]
	cmp r3, r2
	poplt {r3, pc}
	mov r2, #0
	strb r2, [r1, #9]
	mov r1, r0
	mov r0, #1
	bl ov02_0234FB40
	pop {r3, pc}
	arm_func_end ov02_0234DB38

	arm_func_start ov02_0234DB70
ov02_0234DB70: @ 0x0234DB70
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r0, #0x680
	mov r1, #4
	bl ov02_0234E7B4
	mov r4, r0
	ldr r3, _0234DC68 @ =0x0235AB84
	add r1, r4, #0x10
	mov r0, #0x20
	mov r2, #0x30
	str r4, [r3]
	bl ov02_0234D754
	ldr r1, _0234DC68 @ =0x0235AB84
	ldr r1, [r1]
	str r0, [r1, #0x670]
	bl ov02_02338DF0
	cmp r0, #6
	mov r4, #4
	bne _0234DC10
	mov r7, #0
	ldr r6, _0234DC6C @ =0x02354464
	ldr sb, _0234DC68 @ =0x0235AB84
	mov r8, r7
	mov r5, r7
_0234DBCC:
	ldr r0, [r6, r7, lsl #2]
	mov r1, r5
	mov r2, r4
	bl ov02_0234CE84
	ldr r1, [sb]
	add r1, r1, r7, lsl #2
	str r0, [r1, #0x674]
	ldr r2, [sb]
	add r0, r2, r7, lsl #2
	ldr r1, [r0, #0x674]
	add r0, r2, r8
	bl ov02_0232A0F4
	add r7, r7, #1
	cmp r7, #2
	add r8, r8, #8
	blt _0234DBCC
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0234DC10:
	mov r8, #0
	ldr r6, _0234DC70 @ =0x0235446C
	ldr sb, _0234DC68 @ =0x0235AB84
	mov r7, r8
	mov r5, r8
_0234DC24:
	ldr r0, [r6, r8, lsl #2]
	mov r1, r5
	mov r2, r4
	bl ov02_0234CE84
	ldr r1, [sb]
	add r1, r1, r8, lsl #2
	str r0, [r1, #0x674]
	ldr r2, [sb]
	add r0, r2, r8, lsl #2
	ldr r1, [r0, #0x674]
	add r0, r2, r7
	bl ov02_0232A0F4
	add r8, r8, #1
	cmp r8, #2
	add r7, r7, #8
	blt _0234DC24
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234DC68: .4byte 0x0235AB84
_0234DC6C: .4byte 0x02354464
_0234DC70: .4byte 0x0235446C
	arm_func_end ov02_0234DB70

	arm_func_start ov02_0234DC74
ov02_0234DC74: @ 0x0234DC74
	push {r3, r4, r5, lr}
	ldr r4, _0234DCB8 @ =0x0235AB84
	mov r5, #0
_0234DC80:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	ldr r0, [r0, #0x674]
	bl ov02_0234CF78
	add r5, r5, #1
	cmp r5, #2
	blt _0234DC80
	ldr r0, _0234DCB8 @ =0x0235AB84
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov02_0234D794
	ldr r0, _0234DCBC @ =0x0235AB84
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234DCB8: .4byte 0x0235AB84
_0234DCBC: .4byte 0x0235AB84
	arm_func_end ov02_0234DC74

	arm_func_start ov02_0234DCC0
ov02_0234DCC0: @ 0x0234DCC0
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, _0234DD98 @ =0x0235AB84
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	ldr r0, [r0, #0x670]
	mov r5, r2
	mov r8, r3
	bl ov02_0234D808
	mov r4, r0
	strb r6, [r4, #0x2e]
	mul r1, r6, r5
	mov r2, r8
	strb r5, [r4, #0x2f]
	mov r0, r7
	add r3, sp, #4
	bl ov02_0234F3E4
	str r0, [r4, #0x28]
	ldr r1, [sp, #4]
	mov r0, r6
	strh r1, [r4, #0x2c]
	mov r1, r5
	bl ov02_0232B300
	ldr r1, [sp, #0x20]
	cmp r7, #1
	str r0, [r1]
	moveq ip, #0x6600000
	ldr r7, [sp, #4]
	mov r1, #4
	movne ip, #0x6400000
	str r1, [sp]
	mov r0, r4
	mov r2, r6
	mov r3, r5
	add r1, ip, r7, lsl #7
	bl ov02_0232B16C
	ldr r1, [r4, #0x14]
	mov r0, r4
	ldr r2, [r1, #4]
	mov r1, #0
	blx r2
	ldr r0, _0234DD98 @ =0x0235AB84
	ldr r2, [sp, #0x24]
	ldr r0, [r0]
	mov r1, #1
	str r4, [r4, #0x18]
	add r0, r0, r2, lsl #3
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	mov r0, r4
	str r1, [r4, #0x24]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234DD98: .4byte 0x0235AB84
	arm_func_end ov02_0234DCC0

	arm_func_start ov02_0234DD9C
ov02_0234DD9C: @ 0x0234DD9C
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x28]
	bl ov02_0234F55C
	ldr r0, _0234DDC4 @ =0x0235AB84
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x670]
	bl ov02_0234D7B0
	pop {r4, pc}
	.align 2, 0
_0234DDC4: .4byte 0x0235AB84
	arm_func_end ov02_0234DD9C

	arm_func_start ov02_0234DDC8
ov02_0234DDC8: @ 0x0234DDC8
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, _0234DF24 @ =0x0235AB84
	ldr r3, _0234DF28 @ =0x02352F2E
	lsl r4, r8, #2
	ldr r2, _0234DF2C @ =0x02352F2C
	ldr r0, [r0]
	ldrh r5, [r3, r4]
	ldrh r6, [r2, r4]
	add r3, r0, #0x610
	mov r0, #0x30
	mul r2, r6, r5
	mov r7, r1
	mla r4, r8, r0, r3
	lsl r0, r2, #5
	mov r1, #0x20
	bl ov02_0234E7B4
	str r0, [r4, #0x28]
	cmp r8, #1
	bne _0234DE40
	ldr r1, _0234DF30 @ =0x04001008
	ldrh r0, [r1]
	bic r0, r0, #0x40
	strh r0, [r1]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
	b _0234DE60
_0234DE40:
	ldr r1, _0234DF34 @ =0x04000008
	ldrh r0, [r1]
	bic r0, r0, #0x40
	strh r0, [r1]
	ldrh r0, [r1]
	and r0, r0, #0x43
	orr r0, r0, #0xc00
	strh r0, [r1]
_0234DE60:
	mov r0, #4
	str r0, [sp]
	ldr r1, [r4, #0x28]
	mov r0, r4
	mov r2, r6
	mov r3, r5
	bl ov02_0232B140
	ldr r0, _0234DF24 @ =0x0235AB84
	mov r1, #1
	ldr r0, [r0]
	cmp r8, #1
	str r4, [r4, #0x18]
	add r0, r0, r7, lsl #3
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r1, [r4, #0x24]
	bne _0234DEAC
	bl FUN_0207741C
	b _0234DEB0
_0234DEAC:
	bl FUN_020773E8
_0234DEB0:
	ldr r1, _0234DF38 @ =0x02352F28
	lsl r2, r8, #1
	mov r3, #0
	ldrh r7, [r1, r2]
	str r3, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, r6
	mov r2, r5
	str r7, [sp, #8]
	mov r5, #0xf
	str r5, [sp, #0xc]
	bl ov02_0232B1F4
	mov r0, r4
	mov r1, #0
	bl ov02_0234E2A8
	ldr r0, _0234DF24 @ =0x0235AB84
	ldr r1, _0234DF3C @ =ov02_0234DF40
	ldr r2, [r0]
	mov r0, #1
	add r2, r2, #0x27c
	add r2, r2, #0x400
	add r2, r2, r8
	mov r3, #0xc8
	bl ov02_0234FA98
	str r0, [r4, #0x2c]
	mov r0, r4
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234DF24: .4byte 0x0235AB84
_0234DF28: .4byte 0x02352F2E
_0234DF2C: .4byte 0x02352F2C
_0234DF30: .4byte 0x04001008
_0234DF34: .4byte 0x04000008
_0234DF38: .4byte 0x02352F28
_0234DF3C: .4byte ov02_0234DF40
	arm_func_end ov02_0234DDC8

	arm_func_start ov02_0234DF40
ov02_0234DF40: @ 0x0234DF40
	push {r4, lr}
	mov r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	popeq {r4, pc}
	ldr r0, _0234DFC4 @ =0x0235AB84
	ldr r1, [r0]
	add r0, r1, #0x27c
	add r0, r0, #0x400
	cmp r4, r0
	bne _0234DF94
	ldr r0, [r1, #0x638]
	mov r1, #0x6000
	bl FUN_0207A2DC
	ldr r0, _0234DFC4 @ =0x0235AB84
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x6000
	ldr r0, [r0, #0x638]
	bl FUN_02078190
	b _0234DFB8
_0234DF94:
	ldr r0, [r1, #0x668]
	mov r1, #0x3000
	bl FUN_0207A2DC
	ldr r0, _0234DFC4 @ =0x0235AB84
	mov r1, #0x3000
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x668]
	bl FUN_020781F0
_0234DFB8:
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
_0234DFC4: .4byte 0x0235AB84
	arm_func_end ov02_0234DF40

	arm_func_start ov02_0234DFC8
ov02_0234DFC8: @ 0x0234DFC8
	push {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x2c]
	mov r0, #1
	bl ov02_0234FB6C
	ldr r0, _0234E028 @ =0x0235AB84
	ldr r0, [r0]
	add r0, r0, #0x610
	cmp r4, r0
	bne _0234E008
	bl FUN_02077598
	mov r1, r0
	mov r0, #0
	mov r2, #0x6000
	bl FUN_0207C2B8
	b _0234E01C
_0234E008:
	bl FUN_02077598
	mov r1, r0
	mov r0, #0
	mov r2, #0x3000
	bl FUN_0207C2B8
_0234E01C:
	add r0, r4, #0x28
	bl ov02_0234E7D8
	pop {r4, pc}
	.align 2, 0
_0234E028: .4byte 0x0235AB84
	arm_func_end ov02_0234DFC8

	arm_func_start ov02_0234E02C
ov02_0234E02C: @ 0x0234E02C
	ldr r2, _0234E048 @ =0x0235AB84
	mov r1, #0x30
	ldr r2, [r2]
	ldr ip, _0234E04C @ =ov02_0234DFC8
	add r2, r2, #0x610
	mla r0, r1, r0, r2
	bx ip
	.align 2, 0
_0234E048: .4byte 0x0235AB84
_0234E04C: .4byte ov02_0234DFC8
	arm_func_end ov02_0234E02C

	arm_func_start ov02_0234E050
ov02_0234E050: @ 0x0234E050
	push {r4, lr}
	sub sp, sp, #0x10
	ldr r4, [r0, #0x1c]
	add ip, sp, #0xc
	mov lr, #0
	strb lr, [ip]
	strb lr, [ip, #1]
	ldr ip, [r4]
	ldr ip, [ip, #8]
	ldrb ip, [ip, #7]
	cmp ip, #7
	addls pc, pc, ip, lsl #2
	b _0234E0D0
_0234E084: @ jump table
	b _0234E0A4 @ case 0
	b _0234E0B0 @ case 1
	b _0234E0B0 @ case 2
	b _0234E0BC @ case 3
	b _0234E0BC @ case 4
	b _0234E0C8 @ case 5
	b _0234E0C8 @ case 6
	b _0234E0A4 @ case 7
_0234E0A4:
	mov ip, #1
	strb ip, [sp, #0xc]
	b _0234E0D0
_0234E0B0:
	mov ip, #1
	strb ip, [sp, #0xd]
	b _0234E0D0
_0234E0BC:
	sub ip, lr, #1
	strb ip, [sp, #0xc]
	b _0234E0D0
_0234E0C8:
	sub ip, lr, #1
	strb ip, [sp, #0xd]
_0234E0D0:
	ldr lr, [sp, #0x18]
	ldr ip, [sp, #0x1c]
	str lr, [sp]
	str ip, [sp, #4]
	ldrb lr, [sp, #0xc]
	ldrb ip, [sp, #0xd]
	add r0, r0, #0x18
	strb lr, [sp, #8]
	strb ip, [sp, #9]
	bl ov02_0232B870
	add sp, sp, #0x10
	pop {r4, pc}
	arm_func_end ov02_0234E050

	arm_func_start ov02_0234E100
ov02_0234E100: @ 0x0234E100
	push {r3, lr}
	sub sp, sp, #8
	ldrh ip, [sp, #0x10]
	str r3, [sp]
	ldr r3, _0234E138 @ =0x0235AB84
	str ip, [sp, #4]
	ldr lr, [r3]
	ldr ip, [sp, #0x14]
	mov r3, r2
	mov r2, r1
	add r1, lr, ip, lsl #3
	bl ov02_0232B01C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234E138: .4byte 0x0235AB84
	arm_func_end ov02_0234E100

	arm_func_start ov02_0234E13C
ov02_0234E13C: @ 0x0234E13C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r6, [sp, #0x34]
	mov sb, r1
	ldrh r1, [r6]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x38]
	cmp r1, #0
	mov sl, r0
	mov r8, r2
	mov fp, r3
	addeq sp, sp, #8
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0234E170:
	ldr r0, _0234E1E0 @ =0x0235AB84
	ldr r0, [r0]
	add r4, r0, r5, lsl #3
	mov r0, r4
	bl ov02_0232A118
	mov r1, r0
	ldr r0, _0234E1E4 @ =0x0000FFFF
	cmp r1, r0
	ldreq r0, [r4]
	ldrheq r1, [r0, #2]
	mov r0, r4
	bl ov02_0232A160
	ldrh r1, [r6]
	mov r2, r0
	mov r0, sl
	stm sp, {r1, r5}
	ldrsb r1, [r2, #2]
	mov r2, r8
	mov r3, fp
	sub r1, r7, r1
	add r1, sb, r1, asr #1
	bl ov02_0234E100
	ldrh r1, [r6, #2]!
	add sb, sb, r7
	cmp r1, #0
	bne _0234E170
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234E1E0: .4byte 0x0235AB84
_0234E1E4: .4byte 0x0000FFFF
	arm_func_end ov02_0234E13C

	arm_func_start ov02_0234E1E8
ov02_0234E1E8: @ 0x0234E1E8
	push {r4, lr}
	sub sp, sp, #0x18
	ldr r4, [r0, #0x1c]
	add ip, sp, #0x14
	mov lr, #0
	strb lr, [ip]
	strb lr, [ip, #1]
	ldr ip, [r4]
	ldr ip, [ip, #8]
	ldrb ip, [ip, #7]
	cmp ip, #7
	addls pc, pc, ip, lsl #2
	b _0234E268
_0234E21C: @ jump table
	b _0234E23C @ case 0
	b _0234E248 @ case 1
	b _0234E248 @ case 2
	b _0234E254 @ case 3
	b _0234E254 @ case 4
	b _0234E260 @ case 5
	b _0234E260 @ case 6
	b _0234E23C @ case 7
_0234E23C:
	mov ip, #1
	strb ip, [sp, #0x14]
	b _0234E268
_0234E248:
	mov ip, #1
	strb ip, [sp, #0x15]
	b _0234E268
_0234E254:
	sub ip, lr, #1
	strb ip, [sp, #0x14]
	b _0234E268
_0234E260:
	sub ip, lr, #1
	strb ip, [sp, #0x15]
_0234E268:
	ldr lr, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str lr, [sp]
	ldr lr, [sp, #0x28]
	str ip, [sp, #4]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	ldrb lr, [sp, #0x14]
	ldrb ip, [sp, #0x15]
	add r0, r0, #0x18
	strb lr, [sp, #0x10]
	strb ip, [sp, #0x11]
	bl ov02_0232B994
	add sp, sp, #0x18
	pop {r4, pc}
	arm_func_end ov02_0234E1E8

	arm_func_start ov02_0234E2A8
ov02_0234E2A8: @ 0x0234E2A8
	push {r3, lr}
	ldr r2, [r0, #0x14]
	ldr r2, [r2, #4]
	blx r2
	pop {r3, pc}
	arm_func_end ov02_0234E2A8

	arm_func_start ov02_0234E2BC
ov02_0234E2BC: @ 0x0234E2BC
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r6, r3
	mov r4, r0
	mov r8, r1
	mov r0, r6
	mov r1, #0
	mov r7, r2
	bl ov02_0234D308
	mov r2, #0
	mov r5, r0
	mov r0, r6
	mvn r1, #0
	mov r3, r2
	bl ov02_0234D31C
	mov r0, r6
	mvn r1, #0
	mov r2, #0
	mov r3, #0xf
	bl ov02_0234D3C0
	mov r0, r6
	mvn r1, #0
	ldr r2, [sp, #0x28]
	bl ov02_0234D530
	str r7, [sp]
	mov r0, r5
	mov r3, r8
	mov r1, #0
	str r1, [sp, #4]
	ldrh r2, [r4, #0x2c]
	mov r1, #2
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0x2e]
	ldrb r2, [r4, #0x2f]
	bl ov02_0232B35C
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end ov02_0234E2BC

	arm_func_start ov02_0234E354
ov02_0234E354: @ 0x0234E354
	ldr r1, _0234E374 @ =0x0235AB84
	ldr r2, [r1]
	add r1, r2, #0x610
	cmp r0, r1
	mov r0, #1
	strbeq r0, [r2, #0x67c]
	strbne r0, [r2, #0x67d]
	bx lr
	.align 2, 0
_0234E374: .4byte 0x0235AB84
	arm_func_end ov02_0234E354

	arm_func_start ov02_0234E378
ov02_0234E378: @ 0x0234E378
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	arm_func_end ov02_0234E378

	arm_func_start ov02_0234E384
ov02_0234E384: @ 0x0234E384
	ldr ip, [sp]
	strh r0, [ip]
	strh r1, [ip, #2]
	strh r2, [ip, #4]
	strh r3, [ip, #6]
	bx lr
	arm_func_end ov02_0234E384

	arm_func_start ov02_0234E39C
ov02_0234E39C: @ 0x0234E39C
	ldrh r3, [r0]
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh ip, [r0]
	ldrh r3, [r1]
	add r3, ip, r3
	strh r3, [r2, #4]
	ldrh r3, [r0, #2]
	ldrh r0, [r1, #2]
	add r0, r3, r0
	strh r0, [r2, #6]
	bx lr
	arm_func_end ov02_0234E39C

	arm_func_start ov02_0234E3D0
ov02_0234E3D0: @ 0x0234E3D0
	cmp r0, #1
	bne _0234E3FC
	ldr r3, _0234E420 @ =0x04001000
	ldr r2, [r3]
	ldr r0, [r3]
	and ip, r2, #0x1f00
	bic r2, r0, #0x1f00
	orr r0, r1, ip, lsr #8
	orr r0, r2, r0, lsl #8
	str r0, [r3]
	bx lr
_0234E3FC:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r0, [r3]
	and ip, r2, #0x1f00
	bic r2, r0, #0x1f00
	orr r0, r1, ip, lsr #8
	orr r0, r2, r0, lsl #8
	str r0, [r3]
	bx lr
	.align 2, 0
_0234E420: .4byte 0x04001000
	arm_func_end ov02_0234E3D0

	arm_func_start ov02_0234E424
ov02_0234E424: @ 0x0234E424
	cmp r0, #1
	bne _0234E454
	ldr r3, _0234E47C @ =0x04001000
	mvn r0, r1
	ldr r2, [r3]
	ldr r1, [r3]
	and r2, r2, #0x1f00
	bic r1, r1, #0x1f00
	and r0, r0, r2, lsr #8
	orr r0, r1, r0, lsl #8
	str r0, [r3]
	bx lr
_0234E454:
	mov r3, #0x4000000
	ldr r0, [r3]
	ldr r2, [r3]
	and ip, r0, #0x1f00
	mvn r0, r1
	bic r1, r2, #0x1f00
	and r0, r0, ip, lsr #8
	orr r0, r1, r0, lsl #8
	str r0, [r3]
	bx lr
	.align 2, 0
_0234E47C: .4byte 0x04001000
	arm_func_end ov02_0234E424

	arm_func_start ov02_0234E480
ov02_0234E480: @ 0x0234E480
	cmp r0, #1
	bne _0234E508
	cmp r1, #0
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	bne _0234E4D0
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0234E588 @ =0x04001040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_0234E4D0:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0234E58C @ =0x04001042
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_0234E508:
	cmp r1, #0
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	bne _0234E550
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0234E590 @ =0x04000040
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
_0234E550:
	ldrh r1, [r2, #4]
	ldrh ip, [r2, #6]
	lsl r2, r0, #8
	lsl r0, r3, #8
	and r3, r2, #0xff00
	and r1, r1, #0xff
	orr r3, r3, r1
	ldr r2, _0234E594 @ =0x04000042
	and r1, r0, #0xff00
	and r0, ip, #0xff
	strh r3, [r2]
	orr r0, r1, r0
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_0234E588: .4byte 0x04001040
_0234E58C: .4byte 0x04001042
_0234E590: .4byte 0x04000040
_0234E594: .4byte 0x04000042
	arm_func_end ov02_0234E480

	arm_func_start ov02_0234E598
ov02_0234E598: @ 0x0234E598
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	bx lr
_0234E5A4: @ jump table
	b _0234E5B4 @ case 0
	b _0234E604 @ case 1
	b _0234E654 @ case 2
	b _0234E6A4 @ case 3
_0234E5B4:
	cmp r0, #1
	bne _0234E5E0
	ldr r0, _0234E6F4 @ =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _0234E6F4 @ =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_0234E5E0:
	ldr r0, _0234E6F8 @ =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _0234E6F8 @ =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_0234E604:
	cmp r0, #1
	bne _0234E630
	ldr r0, _0234E6F4 @ =0x04001048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _0234E6F4 @ =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0234E630:
	ldr r0, _0234E6F8 @ =0x04000048
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _0234E6F8 @ =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0234E654:
	cmp r0, #1
	bne _0234E680
	ldr r0, _0234E6FC @ =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _0234E6FC @ =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0234E680:
	ldr r0, _0234E700 @ =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f00
	orr r1, r0, r2, lsl #8
	ldr r0, _0234E700 @ =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
_0234E6A4:
	cmp r0, #1
	bne _0234E6D0
	ldr r0, _0234E6FC @ =0x0400104A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _0234E6FC @ =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
_0234E6D0:
	ldr r0, _0234E700 @ =0x0400004A
	cmp r3, #0
	ldrh r0, [r0]
	bic r0, r0, #0x3f
	orr r1, r0, r2
	ldr r0, _0234E700 @ =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_0234E6F4: .4byte 0x04001048
_0234E6F8: .4byte 0x04000048
_0234E6FC: .4byte 0x0400104A
_0234E700: .4byte 0x0400004A
	arm_func_end ov02_0234E598

	arm_func_start ov02_0234E704
ov02_0234E704: @ 0x0234E704
	push {r4, lr}
	mov r4, r0
	mov r1, #0
	mov r2, #0x40000
	bl FUN_0207C40C
	mov r0, r4
	mov r1, #0x40000
	mov r2, #0
	bl ov02_02329D54
	ldr r1, _0234E740 @ =0x0235AB88
	cmp r0, #0
	str r0, [r1]
	popne {r4, pc}
	bl FUN_0207BC20
	pop {r4, pc}
	.align 2, 0
_0234E740: .4byte 0x0235AB88
	arm_func_end ov02_0234E704

	arm_func_start ov02_0234E744
ov02_0234E744: @ 0x0234E744
	push {r3, lr}
	ldr r0, _0234E764 @ =0x0235AB88
	ldr r0, [r0]
	bl ov02_02329844
	ldr r0, _0234E764 @ =0x0235AB88
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0234E764: .4byte 0x0235AB88
	arm_func_end ov02_0234E744

	arm_func_start ov02_0234E768
ov02_0234E768: @ 0x0234E768
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #1
	mov r4, r1
	bl FUN_02078C98
	ldr r1, _0234E7B0 @ =0x0235AB88
	mov r5, r0
	ldr r0, [r1]
	mov r1, r6
	mov r2, r4
	bl ov02_02329D98
	movs r4, r0
	bne _0234E7A0
	bl FUN_0207BC20
_0234E7A0:
	mov r0, r5
	bl FUN_02078C68
	mov r0, r4
	pop {r4, r5, r6, pc}
	.align 2, 0
_0234E7B0: .4byte 0x0235AB88
	arm_func_end ov02_0234E768

	arm_func_start ov02_0234E7B4
ov02_0234E7B4: @ 0x0234E7B4
	push {r4, lr}
	mov r4, r0
	bl ov02_0234E768
	mov r2, r4
	mov r1, #0
	mov r4, r0
	bl FUN_0207C40C
	mov r0, r4
	pop {r4, pc}
	arm_func_end ov02_0234E7B4

	arm_func_start ov02_0234E7D8
ov02_0234E7D8: @ 0x0234E7D8
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	bl FUN_02078C98
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _0234E818 @ =0x0235AB88
	ldr r0, [r0]
	bl ov02_02329DC8
	mov r0, r4
	bl FUN_02078C68
	mov r0, #0
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234E818: .4byte 0x0235AB88
	arm_func_end ov02_0234E7D8
_0234E81C:
	.byte 0x38, 0x40, 0x2D, 0xE9
	.byte 0x00, 0x50, 0xA0, 0xE1, 0x01, 0x00, 0xA0, 0xE3, 0x1A, 0xA9, 0xF4, 0xEB, 0x00, 0x40, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x55, 0xE3, 0x38, 0x80, 0xBD, 0x08, 0x14, 0x00, 0x9F, 0xE5, 0x05, 0x10, 0xA0, 0xE1
	.byte 0x00, 0x00, 0x90, 0xE5, 0x5F, 0x6D, 0xFF, 0xEB, 0x04, 0x00, 0xA0, 0xE1, 0x05, 0xA9, 0xF4, 0xEB
	.byte 0x38, 0x80, 0xBD, 0xE8, 0x88, 0xAB, 0x35, 0x02

	arm_func_start ov02_0234E858
ov02_0234E858: @ 0x0234E858
	push {r3, lr}
	sub sp, sp, #8
	mov r0, #0x3a
	mov r1, #4
	bl ov02_0234E7B4
	ldr r1, _0234E8D0 @ =0x0235AB8C
	str r0, [r1, #4]
	add r0, sp, #0
	bl FUN_02081264
	cmp r0, #0
	bne _0234E888
	bl FUN_0207BC20
_0234E888:
	add r0, sp, #0
	bl FUN_020812F8
	ldr r1, _0234E8D0 @ =0x0235AB8C
	mov r0, #0
	ldr r2, [r1, #4]
	mov r1, #4
	mov r3, #5
	bl FUN_0208151C
	mov r0, #2
	bl FUN_020819D4
	mov r0, #2
	bl FUN_020819EC
	cmp r0, #0
	beq _0234E8C4
	bl FUN_0207BC20
_0234E8C4:
	bl ov02_0234E90C
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234E8D0: .4byte 0x0235AB8C
	arm_func_end ov02_0234E858

	arm_func_start ov02_0234E8D4
ov02_0234E8D4: @ 0x0234E8D4
	push {r3, r4, r5, lr}
	mov r5, #4
	mov r4, r5
_0234E8E0:
	bl FUN_0208161C
	mov r0, r5
	bl FUN_020819D4
	mov r0, r4
	bl FUN_020819EC
	cmp r0, #0
	bne _0234E8E0
	ldr r0, _0234E908 @ =0x0235AB90
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234E908: .4byte 0x0235AB90
	arm_func_end ov02_0234E8D4

	arm_func_start ov02_0234E90C
ov02_0234E90C: @ 0x0234E90C
	push {r3, lr}
	bl ov02_0234E91C
	bl ov02_0234EA20
	pop {r3, pc}
	arm_func_end ov02_0234E90C

	arm_func_start ov02_0234E91C
ov02_0234E91C: @ 0x0234E91C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0234EA0C @ =0x04000130
	ldr r0, _0234EA10 @ =0x027FFFA8
	ldrh r2, [r1]
	ldrh r1, [r0]
	ldr r4, _0234EA14 @ =0x0235AB8C
	ldr r0, _0234EA18 @ =0x00002FFF
	orr r1, r2, r1
	eor r1, r1, r0
	and r0, r1, r0
	ldr r5, [r4, #4]
	lsl r0, r0, #0x10
	ldrh r1, [r5, #0x30]
	lsr ip, r0, #0x10
	ldr r3, _0234EA1C @ =0x0235AB94
	eor r1, r1, r0, lsr #16
	and r1, r1, r0, lsr #16
	strh r1, [r5, #0x32]
	ldrh r5, [r5, #0x30]
	ldr r1, [r4, #4]
	mov r2, #0
	eor r0, r5, r0, lsr #16
	and r0, r5, r0
	strh r0, [r1, #0x36]
	ldr r0, [r4, #4]
	mov r5, #0x28
	strh ip, [r0, #0x30]
	ldr r1, [r4, #4]
	ldrh r0, [r1, #0x32]
	strh r0, [r1, #0x34]
	mov r0, r2
	mov r1, #1
_0234E99C:
	lsl r6, r1, r2
	lsl lr, r6, #0x10
	tst ip, lr, lsr #16
	strbeq r0, [r3]
	beq _0234E9F8
	ldrb r6, [r3]
	add r7, r6, #1
	and r6, r7, #0xff
	strb r7, [r3]
	cmp r6, #0x28
	bne _0234E9DC
	ldr r7, [r4, #4]
	ldrh r6, [r7, #0x34]
	orr r6, r6, lr, lsr #16
	strh r6, [r7, #0x34]
	b _0234E9F8
_0234E9DC:
	cmp r6, #0x2f
	bne _0234E9F8
	ldr r7, [r4, #4]
	ldrh r6, [r7, #0x34]
	orr r6, r6, lr, lsr #16
	strh r6, [r7, #0x34]
	strb r5, [r3]
_0234E9F8:
	add r2, r2, #1
	cmp r2, #0xe
	add r3, r3, #1
	blt _0234E99C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234EA0C: .4byte 0x04000130
_0234EA10: .4byte 0x027FFFA8
_0234EA14: .4byte 0x0235AB8C
_0234EA18: .4byte 0x00002FFF
_0234EA1C: .4byte 0x0235AB94
	arm_func_end ov02_0234E91C

	arm_func_start ov02_0234EA20
ov02_0234EA20: @ 0x0234EA20
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _0234EBB8 @ =0x0235AB8C
	mov r5, #0
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x38]
	lsl r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	movne r6, #1
	moveq r6, #0
	bl FUN_020816B4
	ldr r7, _0234EBB8 @ =0x0235AB8C
	mov r4, r5
	ldr r3, [r7, #4]
	mov r8, #5
	ldrh r2, [r3, #0x28]
	ldrh r1, [r3, #0x2a]
	strh r2, [r3, #0x2c]
	strh r1, [r3, #0x2e]
_0234EA6C:
	ldr r1, [r7, #4]
	add r1, r1, r0, lsl #3
	ldrh r2, [r1, #4]
	cmp r2, #1
	ldrheq r2, [r1, #6]
	cmpeq r2, #0
	bne _0234EAB0
	add r0, sp, #0
	mov r5, #1
	bl FUN_020818B0
	ldr r1, _0234EBB8 @ =0x0235AB8C
	ldrh r0, [sp]
	ldr r2, [r1, #4]
	ldrh r1, [sp, #2]
	add r2, r2, #0x28
	bl ov02_0234E378
	b _0234EAC8
_0234EAB0:
	mov r1, r8
	add r4, r4, #1
	add r0, r0, #4
	bl FUN_02075C38
	cmp r4, #4
	blt _0234EA6C
_0234EAC8:
	ldr r0, _0234EBB8 @ =0x0235AB8C
	eor r7, r5, r6
	ldr r4, [r0, #4]
	and r1, r5, r7
	ldrb r3, [r4, #0x38]
	and r2, r1, #0xff
	and r1, r6, r7
	bic r3, r3, #2
	lsl r2, r2, #0x1f
	orr r2, r3, r2, lsr #30
	strb r2, [r4, #0x38]
	ldr r4, [r0, #4]
	and r1, r1, #0xff
	ldrb r3, [r4, #0x38]
	lsl r2, r1, #0x1f
	cmp r5, #0
	bic r3, r3, #8
	orr r2, r3, r2, lsr #28
	strb r2, [r4, #0x38]
	ldr r3, [r0, #4]
	and r1, r5, #1
	ldrb r2, [r3, #0x38]
	addeq sp, sp, #8
	bic r2, r2, #1
	orr r1, r2, r1
	strb r1, [r3, #0x38]
	ldr r3, [r0, #4]
	ldrb r2, [r3, #0x38]
	lsl r1, r2, #0x1e
	lsr r1, r1, #0x1f
	bic r2, r2, #4
	lsl r1, r1, #0x1f
	orr r1, r2, r1, lsr #29
	strb r1, [r3, #0x38]
	moveq r1, #0
	strbeq r1, [r0, #1]
	popeq {r4, r5, r6, r7, r8, pc}
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	cmp r1, #0x28
	bne _0234EB8C
	ldr r1, [r0, #4]
	add sp, sp, #8
	ldrb r0, [r1, #0x38]
	orr r0, r0, #4
	strb r0, [r1, #0x38]
	pop {r4, r5, r6, r7, r8, pc}
_0234EB8C:
	cmp r1, #0x2f
	addne sp, sp, #8
	popne {r4, r5, r6, r7, r8, pc}
	ldr r3, [r0, #4]
	mov r1, #0x28
	ldrb r2, [r3, #0x38]
	orr r2, r2, #4
	strb r2, [r3, #0x38]
	strb r1, [r0, #1]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234EBB8: .4byte 0x0235AB8C
	arm_func_end ov02_0234EA20

	arm_func_start ov02_0234EBBC
ov02_0234EBBC: @ 0x0234EBBC
	ldr r1, _0234EBF4 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EBF8 @ =0x0235AB8C
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x32]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0234EBF4: .4byte 0x027FFFA8
_0234EBF8: .4byte 0x0235AB8C
	arm_func_end ov02_0234EBBC

	arm_func_start ov02_0234EBFC
ov02_0234EBFC: @ 0x0234EBFC
	ldr r1, _0234EC34 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EC38 @ =0x0235AB8C
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x34]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0234EC34: .4byte 0x027FFFA8
_0234EC38: .4byte 0x0235AB8C
	arm_func_end ov02_0234EBFC

	arm_func_start ov02_0234EC3C
ov02_0234EC3C: @ 0x0234EC3C
	ldr r1, _0234EC74 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EC78 @ =0x0235AB8C
	ldr r1, [r1, #4]
	ldrh r1, [r1, #0x36]
	and r1, r0, r1
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0234EC74: .4byte 0x027FFFA8
_0234EC78: .4byte 0x0235AB8C
	arm_func_end ov02_0234EC3C

	arm_func_start ov02_0234EC7C
ov02_0234EC7C: @ 0x0234EC7C
	ldr r1, _0234ECFC @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234ED00 @ =0x0235AB8C
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.align 2, 0
_0234ECFC: .4byte 0x027FFFA8
_0234ED00: .4byte 0x0235AB8C
	arm_func_end ov02_0234EC7C

	arm_func_start ov02_0234ED04
ov02_0234ED04: @ 0x0234ED04
	ldr r1, _0234ED84 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234ED88 @ =0x0235AB8C
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.align 2, 0
_0234ED84: .4byte 0x027FFFA8
_0234ED88: .4byte 0x0235AB8C
	arm_func_end ov02_0234ED04

	arm_func_start ov02_0234ED8C
ov02_0234ED8C: @ 0x0234ED8C
	ldr r1, _0234EE0C @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EE10 @ =0x0235AB8C
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.align 2, 0
_0234EE0C: .4byte 0x027FFFA8
_0234EE10: .4byte 0x0235AB8C
	arm_func_end ov02_0234ED8C

	arm_func_start ov02_0234EE14
ov02_0234EE14: @ 0x0234EE14
	ldr r1, _0234EE94 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EE98 @ =0x0235AB8C
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	moveq r0, #0
	bxeq lr
	ldrh r2, [r3, #0x28]
	ldrh r1, [r0]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #4]
	cmp r1, r2
	movlo r0, #0
	bxlo lr
	ldrh r2, [r3, #0x2a]
	ldrh r1, [r0, #2]
	cmp r1, r2
	movhi r0, #0
	bxhi lr
	ldrh r0, [r0, #6]
	cmp r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
	.align 2, 0
_0234EE94: .4byte 0x027FFFA8
_0234EE98: .4byte 0x0235AB8C
	arm_func_end ov02_0234EE14

	arm_func_start ov02_0234EE9C
ov02_0234EE9C: @ 0x0234EE9C
	push {r3, lr}
	sub sp, sp, #8
	ldr r1, _0234EF00 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	addne sp, sp, #8
	movne r0, #0
	popne {r3, pc}
	ldrh r1, [r0]
	strh r1, [sp]
	ldrh r1, [r0, #2]
	strh r1, [sp, #2]
	ldrh r2, [r0]
	ldrh r1, [r0, #4]
	add r1, r2, r1
	strh r1, [sp, #4]
	ldrh r2, [r0, #2]
	ldrh r1, [r0, #6]
	add r0, sp, #0
	add r1, r2, r1
	strh r1, [sp, #6]
	bl ov02_0234ED04
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0234EF00: .4byte 0x027FFFA8
	arm_func_end ov02_0234EE9C

	arm_func_start ov02_0234EF04
ov02_0234EF04: @ 0x0234EF04
	ldr r1, _0234EF64 @ =0x027FFFA8
	ldrh r1, [r1]
	and r1, r1, #0x8000
	asrs r1, r1, #0xf
	movne r0, #0
	bxne lr
	ldr r1, _0234EF68 @ =0x0235AB8C
	ldr r3, [r1, #4]
	ldrb r1, [r3, #0x38]
	lsl r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	bne _0234EF4C
	ldrh r2, [r3, #0x2c]
	ldrh r1, [r3, #0x2e]
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r0, #0
	bx lr
_0234EF4C:
	ldrh r2, [r3, #0x28]
	ldrh r1, [r3, #0x2a]
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r0, #1
	bx lr
	.align 2, 0
_0234EF64: .4byte 0x027FFFA8
_0234EF68: .4byte 0x0235AB8C
	arm_func_end ov02_0234EF04

	arm_func_start ov02_0234EF6C
ov02_0234EF6C: @ 0x0234EF6C
	push {r3, lr}
	ldr r0, _0234EFE0 @ =0x0235AB8C
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, _0234EFE4 @ =0x027FFFA8
	beq _0234EFB4
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	popne {r3, pc}
	mov r0, #1
	bl FUN_02082420
	cmp r0, #0
	popeq {r3, pc}
	ldr r0, _0234EFE0 @ =0x0235AB8C
	mov r1, #0
	strb r1, [r0]
	pop {r3, pc}
_0234EFB4:
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	popeq {r3, pc}
	mov r0, #0
	bl FUN_02082420
	cmp r0, #0
	ldrne r0, _0234EFE0 @ =0x0235AB8C
	movne r1, #1
	strbne r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0234EFE0: .4byte 0x0235AB8C
_0234EFE4: .4byte 0x027FFFA8
	arm_func_end ov02_0234EF6C

	arm_func_start ov02_0234EFE8
ov02_0234EFE8: @ 0x0234EFE8
	push {r3, lr}
	ldr r0, _0234F048 @ =0x04000210
	ldr r1, _0234F04C @ =0x0235ABA4
	ldr r2, [r0]
	ldr r0, _0234F050 @ =0x00040018
	str r2, [r1, #4]
	bl FUN_02078C3C
	mov r0, #1
	bl FUN_02078C68
	mov r0, #1
	bl FUN_02078B20
	ldr r2, _0234F04C @ =0x0235ABA4
	ldr r1, _0234F054 @ =0x0234F098
	str r0, [r2]
	mov r0, #1
	bl FUN_02078A98
	mov r0, #1
	bl FUN_02078CC8
	ldr r2, _0234F058 @ =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl FUN_0207B7D0
	pop {r3, pc}
	.align 2, 0
_0234F048: .4byte 0x04000210
_0234F04C: .4byte 0x0235ABA4
_0234F050: .4byte 0x00040018
_0234F054: .4byte 0x0234F098
_0234F058: .4byte 0x04000208
	arm_func_end ov02_0234EFE8

	arm_func_start ov02_0234F05C
ov02_0234F05C: @ 0x0234F05C
	push {r3, lr}
	ldr r2, _0234F090 @ =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	ldr r0, _0234F094 @ =0x0235ABA4
	strh r1, [r2]
	ldr r0, [r0, #4]
	bl FUN_02078C3C
	ldr r1, _0234F094 @ =0x0235ABA4
	mov r0, #1
	ldr r1, [r1]
	bl FUN_02078A98
	pop {r3, pc}
	.align 2, 0
_0234F090: .4byte 0x04000208
_0234F094: .4byte 0x0235ABA4
	arm_func_end ov02_0234F05C
_0234F098:
	.byte 0x08, 0x40, 0x2D, 0xE9, 0x01, 0x00, 0xA0, 0xE3
	.byte 0x50, 0x02, 0x00, 0xEB, 0x10, 0x00, 0x9F, 0xE5, 0x03, 0x0A, 0x80, 0xE2, 0xF8, 0x1F, 0x90, 0xE5
	.byte 0x01, 0x10, 0x81, 0xE3, 0xF8, 0x1F, 0x80, 0xE5, 0x08, 0x80, 0xBD, 0xE8, 0x00, 0x00, 0x7E, 0x02

	arm_func_start ov02_0234F0C0
ov02_0234F0C0: @ 0x0234F0C0
	push {r3, lr}
	mov r0, #0x10
	mov r1, #4
	bl ov02_0234E7B4
	mov r2, #0
	str r2, [r0]
	add r1, r0, #8
	str r1, [r0, #4]
	str r0, [r0, #8]
	str r2, [r0, #0xc]
	pop {r3, pc}
	arm_func_end ov02_0234F0C0

	arm_func_start ov02_0234F0EC
ov02_0234F0EC: @ 0x0234F0EC
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	bl ov02_0234E7D8
	pop {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov02_0234F0EC

	arm_func_start ov02_0234F108
ov02_0234F108: @ 0x0234F108
	push {r4, lr}
	mov r4, r0
	mov r0, #1
	bl FUN_02078C98
	ldm r4, {r2, r3}
	str r3, [r2, #4]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	mov r1, #0
	str r3, [r2]
	str r1, [r4, #4]
	str r1, [r4]
	bl FUN_02078C68
	pop {r4, pc}
	arm_func_end ov02_0234F108

	arm_func_start ov02_0234F140
ov02_0234F140: @ 0x0234F140
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	mov r4, r1
	bl FUN_02078C98
	ldr r1, [r5]
	str r4, [r1, #4]
	ldr r1, [r5]
	stm r4, {r1, r5}
	str r4, [r5]
	bl FUN_02078C68
	pop {r3, r4, r5, pc}
	arm_func_end ov02_0234F140

	arm_func_start ov02_0234F170
ov02_0234F170: @ 0x0234F170
	ldr ip, _0234F17C @ =ov02_0234F140
	add r0, r0, #8
	bx ip
	.align 2, 0
_0234F17C: .4byte ov02_0234F140
	arm_func_end ov02_0234F170

	arm_func_start ov02_0234F180
ov02_0234F180: @ 0x0234F180
	ldr ip, _0234F18C @ =ov02_0234F140
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234F18C: .4byte ov02_0234F140
	arm_func_end ov02_0234F180

	arm_func_start ov02_0234F190
ov02_0234F190: @ 0x0234F190
	push {r4, r5, r6, r7, r8, lr}
	ldr r0, _0234F220 @ =0x0000080C
	mov r1, #4
	bl ov02_0234E7B4
	mov r1, r0
	ldr r3, _0234F224 @ =0x0235ABAC
	mov r0, #0x200
	mov r2, #0x800
	str r1, [r3]
	bl FUN_0207C358
	mov r5, #0
	ldr r7, _0234F224 @ =0x0235ABAC
	mov r6, r5
	mov r4, #0x40
	mov r8, #8
_0234F1CC:
	ldr r1, [r7]
	mov r0, r4
	mov r2, r8
	add r1, r1, r6
	bl ov02_0234D754
	ldr r1, [r7]
	add r6, r6, #0x400
	add r1, r1, r5, lsl #2
	add r5, r5, #1
	str r0, [r1, #0x800]
	cmp r5, #2
	blt _0234F1CC
	ldr r1, _0234F228 @ =ov02_0234F22C
	mov r0, #1
	mov r2, #0
	mov r3, #0xc8
	bl ov02_0234FA98
	ldr r1, _0234F224 @ =0x0235ABAC
	ldr r1, [r1]
	str r0, [r1, #0x808]
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234F220: .4byte 0x0000080C
_0234F224: .4byte 0x0235ABAC
_0234F228: .4byte ov02_0234F22C
	arm_func_end ov02_0234F190

	arm_func_start ov02_0234F22C
ov02_0234F22C: @ 0x0234F22C
	push {r3, lr}
	ldr r0, _0234F270 @ =0x0235ABAC
	mov r1, #0x800
	ldr r0, [r0]
	bl FUN_0207A2DC
	ldr r0, _0234F270 @ =0x0235ABAC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	bl FUN_02077E54
	ldr r0, _0234F270 @ =0x0235ABAC
	mov r1, #0
	ldr r0, [r0]
	mov r2, #0x400
	add r0, r0, #0x400
	bl FUN_02077EA8
	pop {r3, pc}
	.align 2, 0
_0234F270: .4byte 0x0235ABAC
	arm_func_end ov02_0234F22C

	arm_func_start ov02_0234F274
ov02_0234F274: @ 0x0234F274
	push {r3, lr}
	ldr r1, _0234F298 @ =0x0235ABAC
	mov r0, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x808]
	bl ov02_0234FB6C
	ldr r0, _0234F29C @ =0x0235ABAC
	bl ov02_0234E7D8
	pop {r3, pc}
	.align 2, 0
_0234F298: .4byte 0x0235ABAC
_0234F29C: .4byte 0x0235ABAC
	arm_func_end ov02_0234F274

	arm_func_start ov02_0234F2A0
ov02_0234F2A0: @ 0x0234F2A0
	ldr r1, _0234F2B8 @ =0x0235ABAC
	ldr ip, _0234F2BC @ =ov02_0234D808
	ldr r1, [r1]
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0x800]
	bx ip
	.align 2, 0
_0234F2B8: .4byte 0x0235ABAC
_0234F2BC: .4byte ov02_0234D808
	arm_func_end ov02_0234F2A0

	arm_func_start ov02_0234F2C0
ov02_0234F2C0: @ 0x0234F2C0
	mov r1, r0
	ldr r3, [r1]
	ldr r0, _0234F300 @ =0xC1FFFCFF
	ldr r2, _0234F304 @ =0x0235ABAC
	and r0, r3, r0
	orr r0, r0, #0x200
	str r0, [r1]
	ldr r3, [r2]
	mov r2, #0
	add r0, r3, #0x400
	cmp r1, r0
	movhs r2, #1
	add r0, r3, r2, lsl #2
	ldr ip, _0234F308 @ =ov02_0234D7B0
	ldr r0, [r0, #0x800]
	bx ip
	.align 2, 0
_0234F300: .4byte 0xC1FFFCFF
_0234F304: .4byte 0x0235ABAC
_0234F308: .4byte ov02_0234D7B0
	arm_func_end ov02_0234F2C0

	arm_func_start ov02_0234F30C
ov02_0234F30C: @ 0x0234F30C
	ldr r2, _0234F320 @ =0x0235ABAC
	ldr r2, [r2]
	add r0, r2, r0, lsl #10
	add r0, r0, r1, lsl #3
	bx lr
	.align 2, 0
_0234F320: .4byte 0x0235ABAC
	arm_func_end ov02_0234F30C

	arm_func_start ov02_0234F324
ov02_0234F324: @ 0x0234F324
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r0, #0x340
	mov r1, #4
	bl ov02_0234E7B4
	ldr r4, _0234F3E0 @ =0x0235ABB0
	mov sb, #0
	mov sl, sb
	str r0, [r4]
	mov r8, #0x20
	mov r7, #0xc
	mov r6, #0x300
	mov r5, #0x400
_0234F354:
	ldr r1, [r4]
	mov r0, r8
	mov r2, r7
	add r1, r1, sl
	bl ov02_0234D754
	ldr r1, [r4]
	add r1, r1, sl
	str r0, [r1, #0x19c]
	bl ov02_0234F0C0
	ldr r1, [r4]
	add r1, r1, sl
	str r0, [r1, #0x198]
	ldr r0, [r4]
	add r0, r0, sl
	add r0, r0, #0x100
	strh r6, [r0, #0x88]
	ldr r0, [r4]
	add r0, r0, sl
	add r0, r0, #0x100
	strh r5, [r0, #0x94]
	ldr r0, [r4]
	add r1, r0, sl
	ldr r0, [r1, #0x198]
	add r1, r1, #0x180
	bl ov02_0234F180
	ldr r0, [r4]
	add r1, r0, sl
	ldr r0, [r1, #0x198]
	add r1, r1, #0x18c
	bl ov02_0234F170
	add sb, sb, #1
	cmp sb, #2
	add sl, sl, #0x1a0
	blt _0234F354
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0234F3E0: .4byte 0x0235ABB0
	arm_func_end ov02_0234F324

	arm_func_start ov02_0234F3E4
ov02_0234F3E4: @ 0x0234F3E4
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov r0, #0x1a0
	mul sb, r5, r0
	ldr r0, _0234F558 @ =0x0235ABB0
	mov r6, r1
	ldr r0, [r0]
	mov sl, r2
	add r0, r0, sb
	ldr r0, [r0, #0x19c]
	mov r4, r3
	bl ov02_0234D808
	add r1, r6, #3
	bic r1, r1, #3
	mov r6, r0
	asr r8, r1, #2
	mov r0, #1
	strh r8, [r6, #0xa]
	bl FUN_02078C98
	mov r7, r0
	cmp sl, #0
	mov r0, #0x1a0
	beq _0234F4C0
	ldr r1, _0234F558 @ =0x0235ABB0
	ldr r1, [r1]
	mla r0, r5, r0, r1
	add r5, r0, #0x180
	add r0, r0, #0x18c
	cmp r5, r0
	beq _0234F4A0
	add r0, r1, sb
	add r1, r0, #0x18c
_0234F464:
	ldr r0, [r5, #4]
	ldrh sl, [r5, #8]
	ldrh r3, [r5, #0xa]
	ldrh r2, [r0, #8]
	add sl, sl, r3
	add r3, sl, r8
	cmp r3, r2
	bgt _0234F494
	mov r1, r6
	strh sl, [r6, #8]
	bl ov02_0234F140
	b _0234F4A0
_0234F494:
	mov r5, r0
	cmp r0, r1
	bne _0234F464
_0234F4A0:
	ldr r0, _0234F558 @ =0x0235ABB0
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x18c
	cmp r5, r0
	bne _0234F540
	bl FUN_0207BC20
	b _0234F540
_0234F4C0:
	ldr r1, _0234F558 @ =0x0235ABB0
	ldr r1, [r1]
	mla r0, r5, r0, r1
	add r5, r0, #0x18c
	add r0, r0, #0x180
	cmp r5, r0
	beq _0234F524
	add r0, r1, sb
	add r0, r0, #0x180
_0234F4E4:
	ldr sl, [r5]
	ldrh r3, [r5, #8]
	ldrh r2, [sl, #8]
	ldrh r1, [sl, #0xa]
	sub r3, r3, r8
	add r1, r2, r1
	cmp r3, r1
	blt _0234F518
	mov r0, r5
	mov r1, r6
	strh r3, [r6, #8]
	bl ov02_0234F140
	b _0234F524
_0234F518:
	mov r5, sl
	cmp sl, r0
	bne _0234F4E4
_0234F524:
	ldr r0, _0234F558 @ =0x0235ABB0
	ldr r0, [r0]
	add r0, r0, sb
	add r0, r0, #0x180
	cmp r5, r0
	bne _0234F540
	bl FUN_0207BC20
_0234F540:
	ldrh r1, [r6, #8]
	mov r0, r7
	str r1, [r4]
	bl FUN_02078C68
	mov r0, r6
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0234F558: .4byte 0x0235ABB0
	arm_func_end ov02_0234F3E4

	arm_func_start ov02_0234F55C
ov02_0234F55C: @ 0x0234F55C
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl ov02_0234F108
	ldr r0, _0234F598 @ =0x0235ABB0
	ldr r1, [r0]
	add r0, r1, #0x1a0
	cmp r5, r0
	movhs r4, #1
	mov r0, #0x1a0
	mla r0, r4, r0, r1
	ldr r0, [r0, #0x19c]
	mov r1, r5
	bl ov02_0234D7B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234F598: .4byte 0x0235ABB0
	arm_func_end ov02_0234F55C

	arm_func_start ov02_0234F59C
ov02_0234F59C: @ 0x0234F59C
	cmp r1, #0
	mov r3, #0
	ble _0234F5C0
_0234F5A8:
	ldrb r2, [r0, r3]
	cmp r2, #0
	beq _0234F5C0
	add r3, r3, #1
	cmp r3, r1
	blt _0234F5A8
_0234F5C0:
	mov r0, r3
	bx lr
	arm_func_end ov02_0234F59C

	arm_func_start ov02_0234F5C8
ov02_0234F5C8: @ 0x0234F5C8
	push {r3, lr}
	sub ip, r2, #1
	cmp ip, #0
	mov lr, #0
	ble _0234F5FC
_0234F5DC:
	ldrb r3, [r1, lr]
	cmp r3, #0
	beq _0234F5FC
	lsl r2, lr, #1
	add lr, lr, #1
	strh r3, [r0, r2]
	cmp lr, ip
	blt _0234F5DC
_0234F5FC:
	lsl r1, lr, #1
	mov r2, #0
	strh r2, [r0, r1]
	mov r0, lr
	pop {r3, pc}
	arm_func_end ov02_0234F5C8

	arm_func_start ov02_0234F610
ov02_0234F610: @ 0x0234F610
	push {r3, lr}
	bl FUN_0207729C
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1]
	bl FUN_020772B0
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #4]
	bl FUN_020772C4
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #8]
	bl FUN_020772E8
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0xc]
	bl FUN_0207730C
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x10]
	bl FUN_02077320
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x14]
	bl FUN_02077334
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x18]
	bl FUN_02077370
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x1c]
	bl FUN_02077384
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x20]
	bl FUN_02077398
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x24]
	bl FUN_020773C0
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x28]
	bl FUN_02077348
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x2c]
	bl FUN_0207735C
	ldr r1, _0234F6C0 @ =0x0235ABB4
	str r0, [r1, #0x30]
	ldr r0, [r1, #0x2c]
	bl FUN_02076DE4
	bl ov02_0234F7CC
	pop {r3, pc}
	.align 2, 0
_0234F6C0: .4byte 0x0235ABB4
	arm_func_end ov02_0234F610

	arm_func_start ov02_0234F6C4
ov02_0234F6C4: @ 0x0234F6C4
	push {r4, lr}
	bl FUN_0207729C
	bl FUN_020772B0
	bl FUN_02077370
	bl FUN_02077384
	bl ov02_0234F7CC
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0]
	bl FUN_02076464
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #4]
	bl FUN_020766F4
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #8]
	bl FUN_02076844
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0xc]
	bl FUN_02076944
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x10]
	bl FUN_020769F0
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x14]
	bl FUN_02076BC8
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x18]
	bl FUN_02076CB0
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x1c]
	bl FUN_02076EB0
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x20]
	bl FUN_02076F58
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x24]
	bl FUN_02076FC8
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x28]
	bl FUN_02077048
	ldr r0, _0234F7C0 @ =0x0235ABB4
	ldr r0, [r0, #0x30]
	bl FUN_02076E90
	mov r3, #0
	ldr r2, _0234F7C4 @ =0x04000050
	ldr r0, _0234F7C8 @ =0x04001014
	strh r3, [r2]
	add r1, r2, #0x1000
	strh r3, [r1]
	str r3, [r2, #-0x40]
	str r3, [r2, #-0x3c]
	str r3, [r2, #-0x38]
	str r3, [r2, #-0x34]
	str r3, [r2, #0xfc0]
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	bl FUN_0207B7E4
	mov r4, r0
	mov r0, #1
	bl FUN_02082420
	mov r0, r4
	bl FUN_0207B7F8
	pop {r4, pc}
	.align 2, 0
_0234F7C0: .4byte 0x0235ABB4
_0234F7C4: .4byte 0x04000050
_0234F7C8: .4byte 0x04001014
	arm_func_end ov02_0234F6C4

	arm_func_start ov02_0234F7CC
ov02_0234F7CC: @ 0x0234F7CC
	push {r3, lr}
	ldr r0, _0234F840 @ =0x000001F3
	bl FUN_02076E90
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0x40000
	bl FUN_0207C358
	ldr r1, _0234F844 @ =0x06880000
	mov r0, #0
	mov r2, #0x24000
	bl FUN_0207C358
	bl FUN_0207735C
	mov r0, #0x200
	mov r1, #0x7000000
	mov r2, #0x400
	bl FUN_0207C358
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl FUN_0207C358
	mov r0, #0x200
	ldr r1, _0234F848 @ =0x07000400
	mov r2, #0x400
	bl FUN_0207C358
	mov r0, #0
	ldr r1, _0234F84C @ =0x05000400
	mov r2, #0x400
	bl FUN_0207C358
	pop {r3, pc}
	.align 2, 0
_0234F840: .4byte 0x000001F3
_0234F844: .4byte 0x06880000
_0234F848: .4byte 0x07000400
_0234F84C: .4byte 0x05000400
	arm_func_end ov02_0234F7CC

	arm_func_start ov02_0234F850
ov02_0234F850: @ 0x0234F850
	push {r3, lr}
	add r0, sp, #0
	bl FUN_02082514
	cmp r0, #0
	popne {r3, pc}
	ldr r0, [sp]
	cmp r0, #0xf
	popeq {r3, pc}
	mov r0, #0xf
	bl FUN_020824A4
	pop {r3, pc}
	arm_func_end ov02_0234F850

	arm_func_start ov02_0234F87C
ov02_0234F87C: @ 0x0234F87C
	ldr ip, _0234F888 @ =FUN_020824A4
	mov r0, #1
	bx ip
	.align 2, 0
_0234F888: .4byte FUN_020824A4
	arm_func_end ov02_0234F87C

	arm_func_start ov02_0234F88C
ov02_0234F88C: @ 0x0234F88C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0x80
	mov r1, #4
	bl ov02_0234E7B4
	mov r8, #0
	ldr r4, _0234F998 @ =0x0235ABE8
	ldr sb, _0234F99C @ =0x02352F3C
	mov sl, r8
	str r0, [r4]
	mov r7, r8
	mov r6, #0xff
	mov r5, #1
	mov fp, #0x14
_0234F8C0:
	ldr r0, [r4]
	ldrb r2, [sb]
	add r0, r0, r8, lsl #6
	mov r1, #4
	str r2, [r0, #0x34]
	ldrb r2, [sb]
	mul r0, r2, fp
	bl ov02_0234E7B4
	ldr r1, [r4]
	mov r2, #0x14
	add r1, r1, r8, lsl #6
	str r0, [r1, #0x3c]
	ldr r1, [r4]
	ldrb r0, [sb]
	add r1, r1, r8, lsl #6
	ldr r1, [r1, #0x3c]
	bl ov02_0234D754
	ldr r1, [r4]
	str r0, [r1, r8, lsl #6]
	ldrb r0, [sb], #1
	bl ov02_0234D720
	ldr r1, [r4]
	add r1, r1, r8, lsl #6
	str r0, [r1, #4]
	bl ov02_0234F0C0
	ldr r1, [r4]
	add r1, r1, r8, lsl #6
	str r0, [r1, #8]
	ldr r0, [r4]
	add r0, r0, r8, lsl #6
	strb r7, [r0, #0x1c]
	ldr r0, [r4]
	add r0, r0, r8, lsl #6
	strb r6, [r0, #0x30]
	ldr r1, [r4]
	add r0, r1, r8, lsl #6
	add r1, r1, sl
	ldr r0, [r0, #8]
	add r1, r1, #0xc
	bl ov02_0234F180
	ldr r1, [r4]
	add r0, r1, r8, lsl #6
	add r1, r1, sl
	ldr r0, [r0, #8]
	add r1, r1, #0x20
	bl ov02_0234F170
	ldr r0, [r4]
	add sl, sl, #0x40
	add r0, r0, r8, lsl #6
	add r8, r8, #1
	strb r5, [r0, #0x38]
	cmp r8, #2
	blt _0234F8C0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234F998: .4byte 0x0235ABE8
_0234F99C: .4byte 0x02352F3C
	arm_func_end ov02_0234F88C

	arm_func_start ov02_0234F9A0
ov02_0234F9A0: @ 0x0234F9A0
	push {r3, r4, r5, lr}
	ldr r4, _0234F9E0 @ =0x0235ABE8
	mov r5, #0
_0234F9AC:
	ldr r0, [r4]
	add r0, r0, r5, lsl #6
	ldr r0, [r0, #8]
	bl ov02_0234F0EC
	ldr r0, [r4]
	ldr r0, [r0, r5, lsl #6]
	bl ov02_0234D794
	add r5, r5, #1
	cmp r5, #2
	blt _0234F9AC
	ldr r0, _0234F9E4 @ =0x0235ABE8
	bl ov02_0234E7D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234F9E0: .4byte 0x0235ABE8
_0234F9E4: .4byte 0x0235ABE8
	arm_func_end ov02_0234F9A0

	arm_func_start ov02_0234F9E8
ov02_0234F9E8: @ 0x0234F9E8
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _0234FA94 @ =0x0235ABE8
	mov r6, r0
	ldr r0, [r5]
	add r2, r0, r6, lsl #6
	ldrb r1, [r2, #0x38]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r4, [r2, #0x10]
	add r1, r2, #0x20
	cmp r4, r1
	beq _0234FA40
_0234FA18:
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #8]
	mov r0, r4
	blx r2
	ldr r0, [r5]
	ldr r4, [r4, #4]
	add r1, r0, r6, lsl #6
	add r1, r1, #0x20
	cmp r4, r1
	bne _0234FA18
_0234FA40:
	add r1, r0, r6, lsl #6
	ldr r1, [r1, #0x34]
	lsl r4, r6, #6
	mov r5, #0
	cmp r1, #0
	pople {r3, r4, r5, r6, r7, pc}
	ldr r7, _0234FA94 @ =0x0235ABE8
_0234FA5C:
	add r0, r4, r0
	ldr r0, [r0, #4]
	bl ov02_0234D808
	movs r1, r0
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ov02_0234FB6C
	ldr r0, [r7]
	add r5, r5, #1
	add r1, r4, r0
	ldr r1, [r1, #0x34]
	cmp r5, r1
	blt _0234FA5C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234FA94: .4byte 0x0235ABE8
	arm_func_end ov02_0234F9E8

	arm_func_start ov02_0234FA98
ov02_0234FA98: @ 0x0234FA98
	push {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl ov02_0234FAAC
	pop {r3, pc}
	arm_func_end ov02_0234FA98

	arm_func_start ov02_0234FAAC
ov02_0234FAAC: @ 0x0234FAAC
	push {r4, r5, r6, r7, r8, lr}
	ldr r4, _0234FB34 @ =0x0235ABE8
	mov r7, r0
	ldr r0, [r4]
	mov r8, r1
	ldr r0, [r0, r7, lsl #6]
	mov r5, r2
	mov r6, r3
	bl ov02_0234D808
	mov r4, r0
	str r8, [r4, #8]
	str r5, [r4, #0xc]
	ldrb r1, [sp, #0x18]
	strb r6, [r4, #0x10]
	mov r0, #1
	strb r1, [r4, #0x11]
	bl FUN_02078C98
	ldr r1, _0234FB34 @ =0x0235ABE8
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, r7, lsl #6
	ldr r0, [r0, #0x10]
_0234FB04:
	ldrb r1, [r0, #0x10]
	cmp r6, r1
	bhs _0234FB1C
	mov r1, r4
	bl ov02_0234F140
	b _0234FB24
_0234FB1C:
	ldr r0, [r0, #4]
	b _0234FB04
_0234FB24:
	mov r0, r5
	bl FUN_02078C68
	mov r0, r4
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234FB34: .4byte 0x0235ABE8
	arm_func_end ov02_0234FAAC

	arm_func_start ov02_0234FB38
ov02_0234FB38: @ 0x0234FB38
	str r1, [r0, #8]
	bx lr
	arm_func_end ov02_0234FB38

	arm_func_start ov02_0234FB40
ov02_0234FB40: @ 0x0234FB40
	ldr r2, _0234FB58 @ =0x0235ABE8
	ldr ip, _0234FB5C @ =ov02_0234D7B0
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234FB58: .4byte 0x0235ABE8
_0234FB5C: .4byte ov02_0234D7B0
	arm_func_end ov02_0234FB40

	arm_func_start ov02_0234FB6C
ov02_0234FB6C: @ 0x0234FB60
	ldr ip, _0234FB68 @ =ov02_0234FB6C
	bx ip
	.align 2, 0
_0234FB68: .4byte ov02_0234FB6C
	arm_func_end ov02_0234FB6C

	arm_func_start ov02_0234FB6C
ov02_0234FB6C: @ 0x0234FB6C
	push {r3, r4, r5, lr}
	mov r4, r1
	ldrb r1, [r4, #0x11]
	mov r5, r0
	cmp r1, #0
	beq _0234FB8C
	add r0, r4, #0xc
	bl ov02_0234E7D8
_0234FB8C:
	mov r0, r4
	bl ov02_0234F108
	ldr r0, _0234FBAC @ =0x0235ABE8
	mov r1, r4
	ldr r0, [r0]
	ldr r0, [r0, r5, lsl #6]
	bl ov02_0234D7B0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0234FBAC: .4byte 0x0235ABE8
	arm_func_end ov02_0234FB6C

	arm_func_start ov02_0234FBB0
ov02_0234FBB0: @ 0x0234FBB0
	ldr r2, _0234FBC4 @ =0x0235ABE8
	ldr r2, [r2]
	add r0, r2, r0, lsl #6
	strb r1, [r0, #0x38]
	bx lr
	.align 2, 0
_0234FBC4: .4byte 0x0235ABE8
	@ 0x0234FBC8
