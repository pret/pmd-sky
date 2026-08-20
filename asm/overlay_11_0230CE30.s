	.include "asm/macros.inc"
	.include "overlay_11_0230CE30.inc"

	.text

	arm_func_start LoadSpecialEpisodeDiscardOverlay1
LoadSpecialEpisodeDiscardOverlay1: ; 0x0230CE30
	ldr ip, _0230CE3C ; =InitMenu
	ldr r0, _0230CE40 ; =ov11_0232319C
	bx ip
	.align 2, 0
_0230CE3C: .word InitMenu
_0230CE40: .word ov11_0232319C
	arm_func_end LoadSpecialEpisodeDiscardOverlay1

	arm_func_start LoadSpecialEpisodeDiscardOverlay2
LoadSpecialEpisodeDiscardOverlay2: ; 0x0230CE44
	ldr ip, _0230CE50 ; =InitMenu
	ldr r0, _0230CE54 ; =ov11_023231AC
	bx ip
	.align 2, 0
_0230CE50: .word InitMenu
_0230CE54: .word ov11_023231AC
	arm_func_end LoadSpecialEpisodeDiscardOverlay2

	arm_func_start ov11_0230CE58
ov11_0230CE58: ; 0x0230CE58
	ldr ip, _0230CE70 ; =InitMenuWithWindowExtraInfo
	mov r3, r0
	mov r2, r1
	ldr r0, _0230CE74 ; =ov11_023231AC
	mov r1, r3
	bx ip
	.align 2, 0
_0230CE70: .word InitMenuWithWindowExtraInfo
_0230CE74: .word ov11_023231AC
	arm_func_end ov11_0230CE58

	arm_func_start ov11_0230CE78
ov11_0230CE78: ; 0x0230CE78
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0x54
	mov r1, #1
	bl MemAlloc
	mov r5, r0
	ldr r0, _0230CECC ; =ov11_02324DBC
	ldr r4, _0230CED0 ; =ov11_023231BC
	str r5, [r0]
	add lr, r5, #0x2c
	mov ip, #2
_0230CEA0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230CEA0
	ldr r1, [r4]
	mov r0, #0
	str r1, [lr]
	str r0, [r5, #0x50]
	bl ov11_02312B40
	bl ov11_0230CF00
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230CECC: .word ov11_02324DBC
_0230CED0: .word ov11_023231BC
	arm_func_end ov11_0230CE78

	arm_func_start ov11_0230CED4
ov11_0230CED4: ; 0x0230CED4
	stmdb sp!, {r3, lr}
	bl ov11_0230CF00
	bl ov11_02312BCC
	ldr r0, _0230CEFC ; =ov11_02324DBC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230CEFC ; =ov11_02324DBC
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230CEFC: .word ov11_02324DBC
	arm_func_end ov11_0230CED4

	arm_func_start ov11_0230CF00
ov11_0230CF00: ; 0x0230CF00
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	ldr r0, _0230CFEC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #2
	bne _0230CF48
	ldr r0, _0230CFF0 ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230CF48
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230CF48
	mov r0, #1
	blx r1
_0230CF48:
	ldr r0, _0230CFEC ; =ov11_02324DBC
	mov r2, #0
	ldr r1, [r0]
	ldr r6, _0230CFF0 ; =ov11_023231BC
	strb r2, [r1]
	ldr r1, [r0]
	add lr, sp, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r5, #2
	strb r2, [r0, #0x29]
_0230CF74:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230CF74
	ldr r0, _0230CFEC ; =ov11_02324DBC
	ldr r1, [r6]
	ldr ip, [r0]
	str r1, [lr]
	add r6, sp, #0
	add lr, ip, #4
	mov r5, #2
_0230CFA0:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230CFA0
	ldr r0, [r6]
	add r5, sp, #0
	str r0, [lr]
	mov lr, #2
_0230CFC0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0230CFC0
	ldr r1, [r5]
	mov r0, #0
	str r1, [r4]
	str r0, [ip, #0x50]
	bl ov11_02312BF4
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0230CFEC: .word ov11_02324DBC
_0230CFF0: .word ov11_023231BC
	arm_func_end ov11_0230CF00

	arm_func_start ov11_0230CFF4
ov11_0230CFF4: ; 0x0230CFF4
	ldr ip, _0230CFFC ; =ov11_0230D71C
	bx ip
	.align 2, 0
_0230CFFC: .word ov11_0230D71C
	arm_func_end ov11_0230CFF4

	arm_func_start ov11_0230D000
ov11_0230D000: ; 0x0230D000
	stmdb sp!, {r3, lr}
	bl GetTopScreenOption
	ldr r1, _0230D084 ; =ov11_02324DBC
	mov r2, #1
	ldr r1, [r1]
	cmp r0, #4
	strb r2, [r1, #0x29]
	addls pc, pc, r0, lsl #2
	b _0230D07C
_0230D024: ; jump table
	b _0230D040 ; case 0
	b _0230D074 ; case 1
	b _0230D06C ; case 2
	b _0230D048 ; case 3
	b _0230D038 ; case 4
_0230D038:
	bl ov11_02316440
	ldmia sp!, {r3, pc}
_0230D040:
	bl ov11_0230E48C
	ldmia sp!, {r3, pc}
_0230D048:
	bl sub_0204AFD0
	cmp r0, #0
	beq _0230D064
	mov r0, #0
	bl WorldMapSetMode
	bl ov11_0230ED28
	ldmia sp!, {r3, pc}
_0230D064:
	bl ov11_02310680
	ldmia sp!, {r3, pc}
_0230D06C:
	bl ov11_0230DFF4
	ldmia sp!, {r3, pc}
_0230D074:
	bl ov11_0231391C
	ldmia sp!, {r3, pc}
_0230D07C:
	bl ov11_0230D730
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D084: .word ov11_02324DBC
	arm_func_end ov11_0230D000

	arm_func_start ov11_0230D088
ov11_0230D088: ; 0x0230D088
	stmdb sp!, {r3, lr}
	bl GetTopScreenOption
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0230D0F4
_0230D09C: ; jump table
	b _0230D0B8 ; case 0
	b _0230D0EC ; case 1
	b _0230D0E4 ; case 2
	b _0230D0C0 ; case 3
	b _0230D0B0 ; case 4
_0230D0B0:
	bl ov11_0231642C
	ldmia sp!, {r3, pc}
_0230D0B8:
	bl ov11_0230E478
	ldmia sp!, {r3, pc}
_0230D0C0:
	bl sub_0204AFD0
	cmp r0, #0
	beq _0230D0DC
	mov r0, #0
	bl WorldMapSetMode
	bl ov11_0230E964
	ldmia sp!, {r3, pc}
_0230D0DC:
	bl ov11_0231066C
	ldmia sp!, {r3, pc}
_0230D0E4:
	bl ov11_0230DFE0
	ldmia sp!, {r3, pc}
_0230D0EC:
	bl ov11_02313908
	ldmia sp!, {r3, pc}
_0230D0F4:
	bl ov11_0230D71C
	ldmia sp!, {r3, pc}
	arm_func_end ov11_0230D088

	arm_func_start ov11_0230D0FC
ov11_0230D0FC: ; 0x0230D0FC
	cmp r0, #0
	ldreq r0, _0230D16C ; =ov11_023231BC
	cmp r1, #0
	ldreq r1, _0230D16C ; =ov11_023231BC
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r3, [r0, #0x18]
	ldreq r2, [r1, #0x18]
	cmpeq r3, r2
	ldreq r3, [r0, #0x14]
	ldreq r2, [r1, #0x14]
	cmpeq r3, r2
	ldreq r3, [r0, #0x1c]
	ldreq r2, [r1, #0x1c]
	cmpeq r3, r2
	ldreq r2, [r0, #0x20]
	ldreq r0, [r1, #0x20]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230D16C: .word ov11_023231BC
	arm_func_end ov11_0230D0FC

	arm_func_start ov11_0230D170
ov11_0230D170: ; 0x0230D170
	ldr ip, _0230D178 ; =ov11_0230D220
	bx ip
	.align 2, 0
_0230D178: .word ov11_0230D220
	arm_func_end ov11_0230D170

	arm_func_start ov11_0230D17C
ov11_0230D17C: ; 0x0230D17C
	stmdb sp!, {r4, lr}
	ldr r1, _0230D218 ; =ov11_02324DBC
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0230D1D0
	cmp r4, #0
	beq _0230D1B8
	add r1, r2, #4
	bl ov11_0230D0FC
	cmp r0, #0
	beq _0230D1D0
	mov r0, #1
	ldmia sp!, {r4, pc}
_0230D1B8:
	ldr r0, _0230D21C ; =ov11_023231BC
	add r1, r2, #4
	bl ov11_0230D0FC
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0230D1D0:
	cmp r4, #0
	beq _0230D1F0
	ldr r1, _0230D218 ; =ov11_02324DBC
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl ov11_0230D0FC
	ldmia sp!, {r4, pc}
_0230D1F0:
	ldr r1, _0230D218 ; =ov11_02324DBC
	ldr r0, _0230D21C ; =ov11_023231BC
	ldr r1, [r1]
	add r1, r1, #4
	bl ov11_0230D0FC
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230D218: .word ov11_02324DBC
_0230D21C: .word ov11_023231BC
	arm_func_end ov11_0230D17C

	arm_func_start ov11_0230D220
ov11_0230D220: ; 0x0230D220
	stmdb sp!, {r3, lr}
	ldr r0, _0230D26C ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	ldreqb r0, [r1, #0x28]
	cmpeq r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x50]
	cmp r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	cmp r0, #2
	ldrneb r0, [r1, #0x29]
	ldmneia sp!, {r3, pc}
	ldr r0, [r1, #0x38]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D26C: .word ov11_02324DBC
	arm_func_end ov11_0230D220

	arm_func_start ov11_0230D270
ov11_0230D270: ; 0x0230D270
	stmdb sp!, {r4, lr}
	ldr r1, _0230D314 ; =ov11_02324DBC
	mov r4, r0
	ldr r1, [r1]
	add r1, r1, #0x2c
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D300
	ldr r0, _0230D314 ; =ov11_02324DBC
	ldr r2, [r0]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0230D2B8
	mov r0, r4
	add r1, r2, #4
	bl ov11_0230D0FC
	mov r0, #0
	ldmia sp!, {r4, pc}
_0230D2B8:
	mov r1, #1
	strb r1, [r2]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r1, [r0]
	mov ip, #2
	strb r2, [r1, #0x29]
	ldr r0, [r0]
	add lr, r0, #4
_0230D2E0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D2E0
	ldr r1, [r4]
	mov r0, #1
	str r1, [lr]
	ldmia sp!, {r4, pc}
_0230D300:
	ldr r1, _0230D314 ; =ov11_02324DBC
	mov r0, #0
	ldr r1, [r1]
	strb r0, [r1, #0x29]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230D314: .word ov11_02324DBC
	arm_func_end ov11_0230D270

	arm_func_start ov11_0230D318
ov11_0230D318: ; 0x0230D318
	stmdb sp!, {r3, lr}
	ldr r2, _0230D33C ; =ov11_02324DBC
	ldr r3, [r2]
	ldr r2, [r3, #0x50]
	cmp r2, #2
	ldmneia sp!, {r3, pc}
	ldr r2, [r3, #0x3c]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D33C: .word ov11_02324DBC
	arm_func_end ov11_0230D318

	arm_func_start ov11_0230D340
ov11_0230D340: ; 0x0230D340
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #1
	beq _0230D55C
	cmp r0, #2
	bne _0230D410
	add ip, sp, #0
	mov lr, r4
	mov r5, #2
_0230D374:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D374
	ldr r0, [lr]
	str r0, [ip]
	ldr r0, [r4, #0x14]
	blx r0
	cmp r0, #1
	bne _0230D410
	add r1, sp, #0
	mov r0, r4
	bl ov11_0230D0FC
	cmp r0, #0
	beq _0230D410
	ldr r0, _0230D568 ; =ov11_02324DBC
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #0x50]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D3D4
	mov r0, #1
	blx r1
_0230D3D4:
	ldr r5, _0230D56C ; =ov11_023231BC
	mov lr, r4
	mov ip, #2
_0230D3E0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D3E0
	ldr r1, [r5]
	ldr r0, _0230D568 ; =ov11_02324DBC
	str r1, [lr]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0230D410:
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	beq _0230D43C
	ldrb r0, [r1]
	cmp r0, #0
	ldreqb r0, [r1, #0x28]
	cmpeq r0, #0
	bne _0230D43C
	bl ov11_0230D088
_0230D43C:
	ldr r0, _0230D568 ; =ov11_02324DBC
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230D4E8
	ldr r0, _0230D56C ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D480
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D480
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0230D55C
_0230D480:
	ldr r0, _0230D568 ; =ov11_02324DBC
	mov ip, #2
	ldr r5, [r0]
	add lr, r5, #4
_0230D490:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D490
	ldr r0, [lr]
	mov r1, #0
	str r0, [r4]
	ldr r0, _0230D568 ; =ov11_02324DBC
	strb r1, [r5]
	ldr r5, [r0]
	ldr lr, _0230D56C ; =ov11_023231BC
	add ip, r5, #4
	mov r4, #2
_0230D4C4:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0230D4C4
	ldr r1, [lr]
	mov r0, #1
	str r1, [ip]
	str r0, [r5, #0x50]
	b _0230D55C
_0230D4E8:
	ldrb r0, [r1, #0x28]
	cmp r0, #0
	beq _0230D55C
	ldr r0, _0230D56C ; =ov11_023231BC
	mov r1, r4
	bl ov11_0230D0FC
	cmp r0, #0
	bne _0230D524
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0230D524
	mov r0, #0
	blx r1
	cmp r0, #0
	beq _0230D55C
_0230D524:
	ldr lr, _0230D56C ; =ov11_023231BC
	mov ip, #2
_0230D52C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0230D52C
	ldr r1, [lr]
	ldr r0, _0230D568 ; =ov11_02324DBC
	str r1, [r4]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	str r2, [r0, #0x50]
_0230D55C:
	bl ov11_02312D00
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0230D568: .word ov11_02324DBC
_0230D56C: .word ov11_023231BC
	arm_func_end ov11_0230D340

	arm_func_start ov11_0230D570
ov11_0230D570: ; 0x0230D570
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	add r4, r1, #0x2c
	cmp r0, #2
	bne _0230D5A0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0230D6B4
	blx r0
	b _0230D6B4
_0230D5A0:
	cmp r0, #1
	bne _0230D6B4
	ldrb r0, [r1, #0x29]
	cmp r0, #0
	beq _0230D5C4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0230D5C4
	bl ov11_0230D088
_0230D5C4:
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr ip, [r0]
	ldrb r0, [ip]
	cmp r0, #0
	beq _0230D628
	mov lr, r4
	add r6, ip, #4
	mov r5, #2
_0230D5E4:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D5E4
	ldr r0, [r6]
	ldr r6, _0230D6C0 ; =ov11_023231BC
	str r0, [lr]
	add lr, ip, #4
	mov r5, #2
_0230D608:
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0230D608
	ldr r1, [r6]
	mov r0, #0
	str r1, [lr]
	strb r0, [ip]
_0230D628:
	ldr r0, _0230D6BC ; =ov11_02324DBC
	ldr ip, [r0]
	ldrb r0, [ip, #0x28]
	cmp r0, #0
	beq _0230D674
	ldr r5, _0230D6C0 ; =ov11_023231BC
	mov lr, #2
_0230D644:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0230D644
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
	ldr r0, _0230D6BC ; =ov11_02324DBC
	strb r1, [ip, #0x28]
	ldr r0, [r0]
	str r1, [r0, #0x50]
	b _0230D6B4
_0230D674:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0230D6AC
	blx r0
	cmp r0, #0
	ldreq r0, _0230D6BC ; =ov11_02324DBC
	moveq r1, #3
	ldreq r0, [r0]
	streq r1, [r0, #0x50]
	ldrne r0, _0230D6BC ; =ov11_02324DBC
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x50]
	b _0230D6B4
_0230D6AC:
	mov r0, #2
	str r0, [ip, #0x50]
_0230D6B4:
	bl ov11_023130AC
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230D6BC: .word ov11_02324DBC
_0230D6C0: .word ov11_023231BC
	arm_func_end ov11_0230D570

	arm_func_start ov11_0230D6C4
ov11_0230D6C4: ; 0x0230D6C4
	stmdb sp!, {r3, lr}
	ldr r0, _0230D6EC ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	bne _0230D6E4
	ldr r0, [r1, #0x48]
	blx r0
_0230D6E4:
	bl ov11_02313488
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D6EC: .word ov11_02324DBC
	arm_func_end ov11_0230D6C4

	arm_func_start ov11_0230D6F0
ov11_0230D6F0: ; 0x0230D6F0
	stmdb sp!, {r3, lr}
	ldr r0, _0230D718 ; =ov11_02324DBC
	ldr r1, [r0]
	ldr r0, [r1, #0x50]
	cmp r0, #2
	bne _0230D710
	ldr r0, [r1, #0x4c]
	blx r0
_0230D710:
	bl ov11_02313794
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D718: .word ov11_02324DBC
	arm_func_end ov11_0230D6F0

	arm_func_start ov11_0230D71C
ov11_0230D71C: ; 0x0230D71C
	ldr ip, _0230D728 ; =ov11_0230D270
	ldr r0, _0230D72C ; =ov11_023231E0
	bx ip
	.align 2, 0
_0230D728: .word ov11_0230D270
_0230D72C: .word ov11_023231E0
	arm_func_end ov11_0230D71C

	arm_func_start ov11_0230D730
ov11_0230D730: ; 0x0230D730
	ldr ip, _0230D73C ; =ov11_0230D17C
	ldr r0, _0230D740 ; =ov11_023231E0
	bx ip
	.align 2, 0
_0230D73C: .word ov11_0230D17C
_0230D740: .word ov11_023231E0
	arm_func_end ov11_0230D730

	arm_func_start ov11_0230D744
ov11_0230D744: ; 0x0230D744
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230D76C ; =ov11_02324DC0
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D76C: .word ov11_02324DC0
	arm_func_end ov11_0230D744

	arm_func_start ov11_0230D770
ov11_0230D770: ; 0x0230D770
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230D794
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230D794:
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230D7B4 ; =ov11_02324DC0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D7B4: .word ov11_02324DC0
	arm_func_end ov11_0230D770

	arm_func_start ov11_0230D7B8
ov11_0230D7B8: ; 0x0230D7B8
	ldr r0, _0230D7D8 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230D7D8: .word ov11_02324DC0
	arm_func_end ov11_0230D7B8

	arm_func_start ov11_0230D7DC
ov11_0230D7DC: ; 0x0230D7DC
	stmdb sp!, {r3, lr}
	ldr r0, _0230D8A8 ; =ov11_02324DC0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0230D8A0
_0230D7F8: ; jump table
	b _0230D810 ; case 0
	b _0230D874 ; case 1
	b _0230D8A0 ; case 2
	b _0230D890 ; case 3
	b _0230D8A0 ; case 4
	b _0230D890 ; case 5
_0230D810:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230D8A0
	bl ov11_022EA014
	cmp r0, #0x100
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230D8A0
	bl ov11_022EA014
	mvn r1, #0xff
	cmp r0, r1
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230D8A0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230D8A8 ; =ov11_02324DC0
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0230D8A0
_0230D874:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldreq r0, _0230D8A8 ; =ov11_02324DC0
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0230D8A0
_0230D890:
	mov r0, #6
	str r0, [r1]
	mov r0, #1
	ldmia sp!, {r3, pc}
_0230D8A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D8A8: .word ov11_02324DC0
	arm_func_end ov11_0230D7DC

	arm_func_start ov11_0230D8AC
ov11_0230D8AC: ; 0x0230D8AC
	ldr r0, _0230D8CC ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230D8CC: .word ov11_02324DC0
	arm_func_end ov11_0230D8AC

	arm_func_start ov11_0230D8D0
ov11_0230D8D0: ; 0x0230D8D0
	stmdb sp!, {r3, lr}
	ldr r0, _0230D928 ; =ov11_02324DC0
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	ldmneia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
	ldr r0, _0230D928 ; =ov11_02324DC0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #2
	moveq r0, #3
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D928: .word ov11_02324DC0
	arm_func_end ov11_0230D8D0

	arm_func_start ov11_0230D92C
ov11_0230D92C: ; 0x0230D92C
	ldr ip, _0230D938 ; =ov11_0230D270
	ldr r0, _0230D93C ; =ov11_02323204
	bx ip
	.align 2, 0
_0230D938: .word ov11_0230D270
_0230D93C: .word ov11_02323204
	arm_func_end ov11_0230D92C

	arm_func_start ov11_0230D940
ov11_0230D940: ; 0x0230D940
	stmdb sp!, {r3, lr}
	mov r0, #4
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230D968 ; =ov11_02324DC4
	mov r2, #0
	str r0, [r1]
	str r2, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D968: .word ov11_02324DC4
	arm_func_end ov11_0230D940

	arm_func_start ov11_0230D96C
ov11_0230D96C: ; 0x0230D96C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230D990
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230D990:
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230D9B0 ; =ov11_02324DC4
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230D9B0: .word ov11_02324DC4
	arm_func_end ov11_0230D96C

	arm_func_start ov11_0230D9B4
ov11_0230D9B4: ; 0x0230D9B4
	ldr r0, _0230D9D4 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230D9D4: .word ov11_02324DC4
	arm_func_end ov11_0230D9B4

	arm_func_start ov11_0230D9D8
ov11_0230D9D8: ; 0x0230D9D8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	ldr r2, [r0]
	ldr r0, [r2]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230DACC
_0230D9F4: ; jump table
	b _0230DA14 ; case 0
	b _0230DA8C ; case 1
	b _0230DACC ; case 2
	b _0230DAB4 ; case 3
	b _0230DACC ; case 4
	b _0230DA78 ; case 5
	b _0230DAB4 ; case 6
	b _0230DAA8 ; case 7
_0230DA14:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DACC
	bl ov11_022EA014
	cmp r0, #0x100
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230DACC
	bl ov11_022EA014
	mvn r1, #0xff
	cmp r0, r1
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	beq _0230DACC
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0]
	b _0230DACC
_0230DA78:
	mov r1, #7
	mov r0, #0x10
	str r1, [r2]
	bl ov11_022E9CB0
	b _0230DACC
_0230DA8C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldreq r0, _0230DAD4 ; =ov11_02324DC4
	moveq r1, #2
	ldreq r0, [r0]
	streq r1, [r0]
	b _0230DACC
_0230DAA8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DACC
_0230DAB4:
	ldr r0, _0230DAD4 ; =ov11_02324DC4
	mov r2, #8
	ldr r1, [r0]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, pc}
_0230DACC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DAD4: .word ov11_02324DC4
	arm_func_end ov11_0230D9D8

	arm_func_start ov11_0230DAD8
ov11_0230DAD8: ; 0x0230DAD8
	ldr r0, _0230DAF8 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_0230DAF8: .word ov11_02324DC4
	arm_func_end ov11_0230DAD8

	arm_func_start ov11_0230DAFC
ov11_0230DAFC: ; 0x0230DAFC
	stmdb sp!, {r3, lr}
	ldr r0, _0230DB54 ; =ov11_02324DC4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #2
	cmpne r0, #4
	ldmneia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
	ldr r0, _0230DB54 ; =ov11_02324DC4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #2
	moveq r0, #3
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DB54: .word ov11_02324DC4
	arm_func_end ov11_0230DAFC

	arm_func_start ov11_0230DB58
ov11_0230DB58: ; 0x0230DB58
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0230DB90 ; =ov11_02323244
	bl ov11_0230D270
	cmp r0, #0
	ldrne r0, _0230DB94 ; =ov11_02324DC8
	strne r4, [r0, #8]
	ldmneia sp!, {r4, pc}
	ldr r0, _0230DB94 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #8]
	cmp r0, r4
	strne r4, [r1, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230DB90: .word ov11_02323244
_0230DB94: .word ov11_02324DC8
	arm_func_end ov11_0230DB58

	arm_func_start ov11_0230DB98
ov11_0230DB98: ; 0x0230DB98
	stmdb sp!, {r3, lr}
	mov r0, #0x18
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230DBE4 ; =ov11_02324DC8
	str r0, [r1, #4]
	bl ov11_0230DC3C
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230DBE4 ; =ov11_02324DC8
	mov r3, #0
	ldmib r1, {r2, ip}
	str ip, [r2, #0x10]
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #0x14]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DBE4: .word ov11_02324DC8
	arm_func_end ov11_0230DB98

	arm_func_start ov11_0230DBE8
ov11_0230DBE8: ; 0x0230DBE8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230DC14
	ldr r0, _0230DC38 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0x14]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230DC14:
	bl ov11_0230DC3C
	ldr r0, _0230DC38 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230DC38 ; =ov11_02324DC8
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DC38: .word ov11_02324DC8
	arm_func_end ov11_0230DBE8

	arm_func_start ov11_0230DC3C
ov11_0230DC3C: ; 0x0230DC3C
	stmdb sp!, {r3, lr}
	ldr r1, _0230DCB4 ; =ov11_02324DC8
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #0xc]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	ldr r0, [r0]
	cmp r0, #0
	beq _0230DCA0
	bl GroundBg_FreeAll
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	mov r1, #0
	str r1, [r0]
_0230DCA0:
	ldr r0, _0230DCB4 ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DCB4: .word ov11_02324DC8
	arm_func_end ov11_0230DC3C

	arm_func_start ov11_0230DCB8
ov11_0230DCB8: ; 0x0230DCB8
	ldr r0, _0230DCD4 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0230DCD4: .word ov11_02324DC8
	arm_func_end ov11_0230DCB8

	arm_func_start ov11_0230DCD8
ov11_0230DCD8: ; 0x0230DCD8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230DE78
_0230DCF4: ; jump table
	b _0230DD14 ; case 0
	b _0230DD3C ; case 1
	b _0230DE78 ; case 2
	b _0230DE78 ; case 3
	b _0230DDD4 ; case 4
	b _0230DE00 ; case 5
	b _0230DE4C ; case 6
	b _0230DE68 ; case 7
_0230DD14:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DD3C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _0230DD94
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #0xc]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230DE78
_0230DD94:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _0230DE78
	str r1, [r2, #8]
	ldr r1, [r0, #4]
	mov r2, #1
	strb r2, [r1, #0xc]
	ldr r1, [r0, #4]
	mov r2, #0
	str r2, [r1, #0x10]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230DE78
_0230DDD4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230DE80 ; =ov11_02324DC8
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #0xc]
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DE00:
	ldr r0, _0230DE80 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	ldreq r0, [r1, #0x10]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0xc]
	beq _0230DE78
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
	b _0230DE78
_0230DE4C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230DE78
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DE68:
	ldr r0, _0230DE80 ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
_0230DE78:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DE80: .word ov11_02324DC8
	arm_func_end ov11_0230DCD8

	arm_func_start ov11_0230DE84
ov11_0230DE84: ; 0x0230DE84
	stmdb sp!, {r3, lr}
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #0xc]
	bl ov11_0230DC3C
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230DEF0 ; =ov11_02324DC8
	ldr r1, _0230DEF4 ; =ov11_02323228
	str r0, [r2]
	bl GroundBg_Init
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [r1, #8]
	ldmia r2, {r1, r2}
	bl ov11_022EDE64
	ldr r0, _0230DEF0 ; =ov11_02324DC8
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DEF0: .word ov11_02324DC8
_0230DEF4: .word ov11_02323228
	arm_func_end ov11_0230DE84

	arm_func_start ov11_0230DEF8
ov11_0230DEF8: ; 0x0230DEF8
	stmdb sp!, {r3, lr}
	ldr r0, _0230DF58 ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #3
	bne _0230DF50
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230DF58 ; =ov11_02324DC8
	mov r2, #1
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldr r0, _0230DF58 ; =ov11_02324DC8
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230DF50:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DF58: .word ov11_02324DC8
	arm_func_end ov11_0230DEF8

	arm_func_start ov11_0230DF5C
ov11_0230DF5C: ; 0x0230DF5C
	stmdb sp!, {r3, lr}
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r2, [r0, #4]
	ldrb r1, [r2]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0230DF98
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
_0230DF98:
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	ldr r0, [r0]
	cmp r0, #0
	bne _0230DFBC
	mov r0, #1
	mov r1, #3
	bl sub_02008F64
_0230DFBC:
	ldr r0, _0230DFDC ; =ov11_02324DC8
	ldr r0, [r0]
	bl ov11_022EFB70
	ldr r0, _0230DFDC ; =ov11_02324DC8
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230DFDC: .word ov11_02324DC8
	arm_func_end ov11_0230DF5C

	arm_func_start ov11_0230DFE0
ov11_0230DFE0: ; 0x0230DFE0
	ldr ip, _0230DFEC ; =ov11_0230D270
	ldr r0, _0230DFF0 ; =ov11_02323284
	bx ip
	.align 2, 0
_0230DFEC: .word ov11_0230D270
_0230DFF0: .word ov11_02323284
	arm_func_end ov11_0230DFE0

	arm_func_start ov11_0230DFF4
ov11_0230DFF4: ; 0x0230DFF4
	ldr ip, _0230E000 ; =ov11_0230D17C
	ldr r0, _0230E004 ; =ov11_02323284
	bx ip
	.align 2, 0
_0230E000: .word ov11_0230D17C
_0230E004: .word ov11_02323284
	arm_func_end ov11_0230DFF4

	arm_func_start ov11_0230E008
ov11_0230E008: ; 0x0230E008
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230E05C ; =ov11_02324DD4
	str r0, [r1, #4]
	bl ov11_0230E0D8
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230E05C ; =ov11_02324DD4
	mov r3, #0
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1, #4]
	strb r0, [r2, #0xa]
	ldr r2, [r1, #4]
	strb r3, [r2, #0xb]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E05C: .word ov11_02324DD4
	arm_func_end ov11_0230E008

	arm_func_start ov11_0230E060
ov11_0230E060: ; 0x0230E060
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230E08C
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230E08C:
	bl ov11_0230E0D8
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	mov r2, #7
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0230E0B4
	bl sub_020483D8
_0230E0B4:
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230E0D4 ; =ov11_02324DD4
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E0D4: .word ov11_02324DD4
	arm_func_end ov11_0230E060

	arm_func_start ov11_0230E0D8
ov11_0230E0D8: ; 0x0230E0D8
	stmdb sp!, {r3, lr}
	ldr r1, _0230E150 ; =ov11_02324DD4
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230E150 ; =ov11_02324DD4
	ldr r0, [r0]
	cmp r0, #0
	beq _0230E13C
	bl GroundBg_FreeAll
	ldr r0, _0230E150 ; =ov11_02324DD4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230E150 ; =ov11_02324DD4
	mov r1, #0
	str r1, [r0]
_0230E13C:
	ldr r0, _0230E150 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E150: .word ov11_02324DD4
	arm_func_end ov11_0230E0D8

	arm_func_start ov11_0230E154
ov11_0230E154: ; 0x0230E154
	ldr r0, _0230E170 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0230E170: .word ov11_02324DD4
	arm_func_end ov11_0230E154

	arm_func_start ov11_0230E174
ov11_0230E174: ; 0x0230E174
	bx lr
	arm_func_end ov11_0230E174

	arm_func_start ov11_0230E178
ov11_0230E178: ; 0x0230E178
	stmdb sp!, {r3, lr}
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0230E338
_0230E194: ; jump table
	b _0230E1B4 ; case 0
	b _0230E1DC ; case 1
	b _0230E338 ; case 2
	b _0230E338 ; case 3
	b _0230E26C ; case 4
	b _0230E298 ; case 5
	b _0230E2E4 ; case 6
	b _0230E328 ; case 7
_0230E1B4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E1DC:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0230E234
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230E338
_0230E234:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _0230E338
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230E338
_0230E26C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E340 ; =ov11_02324DD4
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E298:
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _0230E338
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _0230E338
_0230E2E4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230E338
	ldr r0, _0230E340 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0230E318
	bl sub_020483D8
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E318:
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E328:
	ldr r0, _0230E340 ; =ov11_02324DD4
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_0230E338:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E340: .word ov11_02324DD4
	arm_func_end ov11_0230E178

	arm_func_start ov11_0230E344
ov11_0230E344: ; 0x0230E344
	stmdb sp!, {r3, lr}
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #9]
	bl ov11_0230E0D8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230E3D8 ; =ov11_02324DD4
	ldr r1, _0230E3DC ; =ov11_02323268
	str r0, [r2]
	bl GroundBg_Init
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r1, _0230E3E0 ; =ov11_023232A8
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0230E3C4
	bl sub_02048384
	bl sub_020483B8
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E3C4:
	ldr r0, _0230E3D8 ; =ov11_02324DD4
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E3D8: .word ov11_02324DD4
_0230E3DC: .word ov11_02323268
_0230E3E0: .word ov11_023232A8
	arm_func_end ov11_0230E344

	arm_func_start ov11_0230E3E4
ov11_0230E3E4: ; 0x0230E3E4
	stmdb sp!, {r3, lr}
	ldr r0, _0230E430 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	cmp r1, #3
	bne _0230E428
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230E430 ; =ov11_02324DD4
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E428:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E430: .word ov11_02324DD4
	arm_func_end ov11_0230E3E4

	arm_func_start ov11_0230E434
ov11_0230E434: ; 0x0230E434
	stmdb sp!, {r3, lr}
	ldr r0, _0230E474 ; =ov11_02324DD4
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _0230E474 ; =ov11_02324DD4
	mov r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E474: .word ov11_02324DD4
	arm_func_end ov11_0230E434

	arm_func_start ov11_0230E478
ov11_0230E478: ; 0x0230E478
	ldr ip, _0230E484 ; =ov11_0230D270
	ldr r0, _0230E488 ; =ov11_023232D8
	bx ip
	.align 2, 0
_0230E484: .word ov11_0230D270
_0230E488: .word ov11_023232D8
	arm_func_end ov11_0230E478

	arm_func_start ov11_0230E48C
ov11_0230E48C: ; 0x0230E48C
	ldr ip, _0230E498 ; =ov11_0230D17C
	ldr r0, _0230E49C ; =ov11_023232D8
	bx ip
	.align 2, 0
_0230E498: .word ov11_0230D17C
_0230E49C: .word ov11_023232D8
	arm_func_end ov11_0230E48C

	arm_func_start ov11_0230E4A0
ov11_0230E4A0: ; 0x0230E4A0
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230E4F8 ; =ov11_02324DDC
	str r0, [r1, #4]
	bl ov11_0230E578
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _0230E4F8 ; =ov11_02324DDC
	mvn r3, #1
	ldr r2, [r1, #4]
	mov r0, #1
	strb r3, [r2, #8]
	ldr r2, [r1, #4]
	mov r3, #0
	strb r0, [r2, #0xa]
	ldr r2, [r1, #4]
	strb r3, [r2, #0xb]
	ldr r1, [r1, #4]
	str r3, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E4F8: .word ov11_02324DDC
	arm_func_end ov11_0230E4A0

	arm_func_start ov11_0230E4FC
ov11_0230E4FC: ; 0x0230E4FC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230E528
	ldr r0, _0230E574 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230E528:
	bl ov11_0230E578
	ldr r0, _0230E574 ; =ov11_02324DDC
	mov r3, #8
	ldr r2, [r0, #4]
	sub r1, r3, #0xa
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0230E554
	bl CloseControlsChart
_0230E554:
	ldr r0, _0230E574 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230E574 ; =ov11_02324DDC
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E574: .word ov11_02324DDC
	arm_func_end ov11_0230E4FC

	arm_func_start ov11_0230E578
ov11_0230E578: ; 0x0230E578
	stmdb sp!, {r3, lr}
	ldr r1, _0230E5F0 ; =ov11_02324DDC
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	ldr r0, [r0]
	cmp r0, #0
	beq _0230E5DC
	bl GroundBg_FreeAll
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	mov r1, #0
	str r1, [r0]
_0230E5DC:
	ldr r0, _0230E5F0 ; =ov11_02324DDC
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E5F0: .word ov11_02324DDC
	arm_func_end ov11_0230E578

	arm_func_start ov11_0230E5F4
ov11_0230E5F4: ; 0x0230E5F4
	ldr r0, _0230E610 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_0230E610: .word ov11_02324DDC
	arm_func_end ov11_0230E5F4

	arm_func_start ov11_0230E614
ov11_0230E614: ; 0x0230E614
	bx lr
	arm_func_end ov11_0230E614

	arm_func_start HandleControlsTopScreenGround
HandleControlsTopScreenGround: ; 0x0230E618
	stmdb sp!, {r3, lr}
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _0230E7E0
_0230E634: ; jump table
	b _0230E658 ; case 0
	b _0230E680 ; case 1
	b _0230E7E0 ; case 2
	b _0230E7E0 ; case 3
	b _0230E7E0 ; case 4
	b _0230E710 ; case 5
	b _0230E73C ; case 6
	b _0230E788 ; case 7
	b _0230E7D0 ; case 8
_0230E658:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E680:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _0230E6D8
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #7
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _0230E7E0
_0230E6D8:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _0230E7E0
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _0230E7E0
_0230E710:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _0230E7E8 ; =ov11_02324DDC
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #6
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E73C:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _0230E7E0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _0230E7E0
_0230E788:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230E7E0
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mvn r1, #1
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	cmp r0, r1
	beq _0230E7C0
	bl CloseControlsChart
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mvn r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_0230E7C0:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #8
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E7D0:
	ldr r0, _0230E7E8 ; =ov11_02324DDC
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_0230E7E0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E7E8: .word ov11_02324DDC
	arm_func_end HandleControlsTopScreenGround

	arm_func_start ov11_0230E7EC
ov11_0230E7EC: ; 0x0230E7EC
	stmdb sp!, {r3, lr}
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	ldr r3, [r0, #4]
	ldr r1, [r3, #4]
	cmp r1, #2
	bne _0230E854
	mov r2, #1
	strb r2, [r3, #9]
	ldr r1, [r0, #4]
	sub r0, r2, #3
	ldrsb r1, [r1, #8]
	cmp r1, r0
	bne _0230E840
	mov r0, #0
	ldr r3, _0230E8C4 ; =0x00003FCA
	mov r1, r0
	mov r2, r0
	bl CreateControlsChart
	ldr r1, _0230E8C0 ; =ov11_02324DDC
	ldr r1, [r1, #4]
	strb r0, [r1, #8]
_0230E840:
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
_0230E854:
	cmp r1, #3
	ldmneia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r3, #9]
	ldr r0, [r0, #4]
	ldrsb r0, [r0, #8]
	bl IsControlsChartActive
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl ov11_0230E578
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0230E8C0 ; =ov11_02324DDC
	ldr r1, _0230E8C8 ; =ov11_023232BC
	str r0, [r2]
	bl GroundBg_Init
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	ldr r1, _0230E8CC ; =ov11_023232FC
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _0230E8C0 ; =ov11_02324DDC
	mov r1, #4
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E8C0: .word ov11_02324DDC
#if defined(EUROPE)
_0230E8C4: .word 0x00003FCC
#elif defined(JAPAN)
_0230E8C4: .word 0x000049CD
#else
_0230E8C4: .word 0x00003FCA
#endif
_0230E8C8: .word ov11_023232BC
_0230E8CC: .word ov11_023232FC
	arm_func_end ov11_0230E7EC

	arm_func_start ov11_0230E8D0
ov11_0230E8D0: ; 0x0230E8D0
	stmdb sp!, {r3, lr}
	ldr r0, _0230E91C ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	cmp r1, #4
	bne _0230E914
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _0230E91C ; =ov11_02324DDC
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #5
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_0230E914:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E91C: .word ov11_02324DDC
	arm_func_end ov11_0230E8D0

	arm_func_start ov11_0230E920
ov11_0230E920: ; 0x0230E920
	stmdb sp!, {r3, lr}
	ldr r0, _0230E960 ; =ov11_02324DDC
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _0230E960 ; =ov11_02324DDC
	mov r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x10
	strb r2, [r1]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230E960: .word ov11_02324DDC
	arm_func_end ov11_0230E920

	arm_func_start ov11_0230E964
ov11_0230E964: ; 0x0230E964
	ldr ip, _0230E970 ; =ov11_0230D270
	ldr r0, _0230E974 ; =ov11_02323350
	bx ip
	.align 2, 0
_0230E970: .word ov11_0230D270
_0230E974: .word ov11_02323350
	arm_func_end ov11_0230E964

	arm_func_start ov11_0230E978
ov11_0230E978: ; 0x0230E978
	stmdb sp!, {r3, lr}
	ldr r0, _0230EB50 ; =0x0000FF94
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	str r0, [r1, #8]
	bl GetExecuteSpecialEpisodeType
	mvn r1, #0
	cmp r0, r1
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	movne r2, #1
	mov ip, #1
	ldr r1, [r0, #8]
	moveq r2, #0
	strb r2, [r1]
	ldr r1, [r0, #8]
	sub r3, ip, #2
	strb ip, [r1, #0xc]
	ldr r1, [r0, #8]
	mov r2, #0
	strh r3, [r1, #2]
	ldr r1, [r0, #8]
	strb r2, [r1, #4]
	ldr r1, [r0, #8]
	strb r2, [r1, #5]
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	addne r0, r1, #0xf000
	strneb r2, [r0, #0x999]
	bne _0230EA08
	bl sub_0204CDCC
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
_0230EA08:
	ldr ip, _0230EB54 ; =WORLD_MAP_MODE
	mvn r0, #0
	ldr r2, [ip, #8]
	mov r1, #0
	add r2, r2, #0xf900
	strh r0, [r2, #0x9c]
	ldr r2, [ip, #8]
	ldr r3, _0230EB58 ; =0x00000136
	add r2, r2, #0xf900
	strh r0, [r2, #0x9e]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0xe8c]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0xe88]
	ldr r2, [ip, #8]
	add r2, r2, #0xf000
	strb r1, [r2, #0x9ac]
_0230EA54:
	ldr r2, [ip, #8]
	add r2, r2, r1, lsl #2
	add r2, r2, #0xf000
	add r1, r1, #1
	str r0, [r2, #0x9b0]
	cmp r1, r3
	blt _0230EA54
	ldr r2, _0230EB54 ; =WORLD_MAP_MODE
	mov ip, #0
	ldr r1, [r2, #8]
	sub r3, ip, #2
	add r1, r1, #0xf000
	strb ip, [r1, #0xf90]
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r3, [r1, #0x998]
	ldr r1, [r2, #8]
	str ip, [r1, #0x2c]
	bl ov11_022F4734
	mov r0, #0
	bl ov11_02312844
	bl ov11_0230EC00
	bl GetMainCharacter1
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	ldrsh r2, [r0, #4]
	ldr r0, [r1, #8]
	mov r3, #0
	add r0, r0, #0x500
	strh r2, [r0, #0x2e]
	ldr r0, [r1, #8]
	ldr r2, _0230EB5C ; =0xA0080000
	strb r3, [r0, #0x530]
	ldr r1, [r1, #8]
	add r0, r1, #0x134
	add r0, r0, #0x400
	add r1, r1, #0x500
	ldrsh r1, [r1, #0x2e]
	bl ov11_022F5BBC
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #0xa
	ldr r0, [r0, #8]
	add r0, r0, #0x134
	add r0, r0, #0x400
	bl ov11_022F4974
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #0x9b
	ldr r0, [r0, #8]
	ldr r2, _0230EB5C ; =0xA0080000
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl LoadObjectAnimData
	ldr r0, _0230EB54 ; =WORLD_MAP_MODE
	mov r1, #8
	ldr r0, [r0, #8]
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl ov11_022F4974
	mov r2, #0
	ldr r1, _0230EB54 ; =WORLD_MAP_MODE
	mov r0, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x6bc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EB50: .word 0x0000FF94
_0230EB54: .word WORLD_MAP_MODE
_0230EB58: .word 0x00000136
_0230EB5C: .word 0xA0080000
	arm_func_end ov11_0230E978

	arm_func_start ov11_0230EB60
ov11_0230EB60: ; 0x0230EB60
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _0230EB90
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #8]
	cmp r0, #9
	addne r0, r1, #0xf000
	movne r1, #1
	strneb r1, [r0, #0xf90]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_0230EB90:
	bl ov11_0230EC00
	bl ov11_02312894
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0x134
	add r0, r0, #0x400
	bl ov11_022F5C3C
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0x1f8
	add r0, r0, #0x400
	bl ov11_022F6EFC
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0x6bc]
	cmp r0, #0
	beq _0230EBDC
	add r0, r1, #0x6c0
	bl ov11_022F6EFC
_0230EBDC:
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	bl MemFree
	ldr r0, _0230EBFC ; =WORLD_MAP_MODE
	mov r1, #0
	str r1, [r0, #8]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EBFC: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EB60

	arm_func_start ov11_0230EC00
ov11_0230EC00: ; 0x0230EC00
	stmdb sp!, {r3, lr}
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mov r3, #1
	ldr r1, [r0, #8]
	mov r2, #0
	strb r2, [r1, #6]
	ldr r2, [r0, #8]
	sub r1, r3, #3
	str r3, [r2, #8]
	ldr r2, [r0, #8]
	strb r3, [r2, #0xc]
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _0230EC58
	bl CloseAreaNameBox
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_0230EC58:
	mov ip, #0
	ldr r2, _0230ED20 ; =WORLD_MAP_MODE
	ldr r1, _0230ED24 ; =0x00000136
	mov r0, ip
_0230EC68:
	ldr r3, [r2, #8]
	add r3, r3, ip, lsl #2
	add ip, ip, #1
	str r0, [r3, #0x54]
	cmp ip, r1
	blt _0230EC68
	ldr r1, _0230ED20 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r1, #8]
	add r1, r1, #0x500
	strh r2, [r1, #0x2c]
	bl ov11_023128C0
	ldr r1, _0230ED20 ; =WORLD_MAP_MODE
	mvn ip, #0
	ldr r0, [r1, #8]
	mov r3, #0
	strh ip, [r0, #0x30]
	ldr r2, [r1, #8]
	mov r0, #1
	str r3, [r2, #0x34]
	ldr r2, [r1, #8]
	str r3, [r2, #0x38]
	ldr r2, [r1, #8]
	str r3, [r2, #0x3c]
	ldr r2, [r1, #8]
	str r3, [r2, #0x40]
	ldr r2, [r1, #8]
	str r3, [r2, #0x44]
	ldr r1, [r1, #8]
	strb ip, [r1, #0x50]
	bl ov11_022EAFF8
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0230ED20 ; =WORLD_MAP_MODE
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230ED20: .word WORLD_MAP_MODE
_0230ED24: .word 0x00000136
	arm_func_end ov11_0230EC00

	arm_func_start ov11_0230ED28
ov11_0230ED28: ; 0x0230ED28
	ldr r0, _0230ED44 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0230ED44: .word WORLD_MAP_MODE
	arm_func_end ov11_0230ED28

	arm_func_start GetDungeonMapPos
GetDungeonMapPos: ; 0x0230ED48
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0230EDAC ; =WORLD_MAP_MODE
	mov r4, r0
	ldr r2, [r2, #8]
	mov r0, r1
	ldrsh r1, [r2, #2]
	add r2, sp, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	beq _0230EDA0
	ldr r0, [sp]
	cmp r0, #0
	blt _0230EDA0
	mov r0, r0, lsl #8
	str r0, [r4]
	ldr r1, [sp, #4]
	mov r0, #1
	mov r1, r1, lsl #8
	str r1, [r4, #4]
	b _0230EDA4
_0230EDA0:
	mov r0, #0
_0230EDA4:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0230EDAC: .word WORLD_MAP_MODE
	arm_func_end GetDungeonMapPos

	arm_func_start ov11_0230EDB0
ov11_0230EDB0: ; 0x0230EDB0
	ldr r1, _0230EDD8 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r1, #8]
	str r3, [r2, #0x34]
	ldr r2, [r1, #8]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2, #0x48]
	str r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_0230EDD8: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EDB0

	arm_func_start ov11_0230EDDC
ov11_0230EDDC: ; 0x0230EDDC
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	mov r0, #0
	ldr r1, [r1, #8]
	sub r2, r0, #1
	add r1, r1, #0xf900
	ldrsh r1, [r1, #0x9c]
	cmp r1, r2
	beq _0230EE74
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230EE5C
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf900
	ldrsh r0, [r0, #0x9c]
	strh r0, [r2, #0x30]
	ldr r0, [r1, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	cmpne r0, #1
	beq _0230EE54
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB2F4
_0230EE54:
	add r0, sp, #0
	bl ov11_0230EDB0
_0230EE5C:
	ldr r0, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r0, #8]
	mov r0, #1
	add r1, r1, #0xf900
	strh r2, [r1, #0x9c]
_0230EE74:
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r1, #8]
	add r1, r1, #0xf900
	ldrsh r1, [r1, #0x9e]
	cmp r1, r2
	beq _0230EF3C
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230EF24
	mov r0, #1
	mov r1, #6
	bl ov11_022EB0C0
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf900
	ldrsh r0, [r0, #0x9e]
	strh r0, [r2, #0x30]
	ldr r0, [r1, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	cmpne r0, #1
	beq _0230EEE0
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB2F4
_0230EEE0:
	ldr r1, _0230EF44 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0xf000
	ldr r0, [r0, #0x9a0]
	str r0, [r2, #0x34]
	ldr ip, [r1, #8]
	ldr r3, [sp]
	ldr r2, [sp, #4]
	add r0, ip, #0xf000
	str r3, [ip, #0x48]
	str r2, [ip, #0x4c]
	ldr r0, [r0, #0x9a4]
	str r0, [ip, #0x38]
	ldr r1, [r1, #8]
	add r0, r1, #0xf000
	ldr r0, [r0, #0x9a8]
	str r0, [r1, #0x3c]
_0230EF24:
	ldr r0, _0230EF44 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r1, [r0, #8]
	mov r0, #1
	add r1, r1, #0xf900
	strh r2, [r1, #0x9e]
_0230EF3C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0230EF44: .word WORLD_MAP_MODE
	arm_func_end ov11_0230EDDC

	arm_func_start ov11_0230EF48
ov11_0230EF48: ; 0x0230EF48
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _0230EFFC ; =WORLD_MAP_MODE
	mov r4, r2
	ldr r2, [r3, #8]
	mov r5, r1
	ldrsh r1, [r2, #2]
	add r2, sp, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	cmpne r5, #0
	beq _0230EFF4
	ldr r1, _0230EFFC ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, r0, lsl #2
	ldr r1, [r1, #0x54]
	cmp r1, r5
	blt _0230EF9C
	cmp r4, #0
	beq _0230EFF4
_0230EF9C:
	ldr r2, _0230EFFC ; =WORLD_MAP_MODE
	mov r1, #0xc4
	ldr r3, [r2, #8]
	mul r4, r0, r1
	add r0, r3, r0, lsl #2
	str r5, [r0, #0x54]
	ldr r1, [r2, #8]
	add r0, r3, #0x384
	add r6, r0, #0x400
	add r1, r1, #0x1f8
	add r0, r6, r4
	add r1, r1, #0x400
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r6, r4
	mov r1, #8
	bl ov11_022F4974
	ldr r0, _0230F000 ; =ov11_02323310
	mov r1, r5, lsl #1
	ldrsh r1, [r0, r1]
	add r0, r6, r4
	mov r2, #0
	bl SetAnimDataFields2
_0230EFF4:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0230EFFC: .word WORLD_MAP_MODE
_0230F000: .word ov11_02323310
	arm_func_end ov11_0230EF48

	arm_func_start WorldMapSetMode
WorldMapSetMode: ; 0x0230F004
	ldr r1, _0230F04C ; =WORLD_MAP_MODE
	str r0, [r1]
	ldr r3, [r1, #8]
	cmp r3, #0
	ldrne r2, [r3, #0x2c]
	cmpne r2, r0
	bxeq lr
	ldrsb r2, [r3, #4]
	add r0, r3, #0xf000
	mov r3, #0
	strb r2, [r0, #0x999]
	ldr r0, [r1, #8]
	mov r2, #1
	add r0, r0, #0xf000
	strb r3, [r0, #0x99a]
	ldr r0, [r1, #8]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F04C: .word WORLD_MAP_MODE
	arm_func_end WorldMapSetMode

	arm_func_start ov11_0230F050
ov11_0230F050: ; 0x0230F050
	ldr r2, _0230F088 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
	ldr r0, [r2, #8]
	mov r1, #0
	add r0, r0, #0xf000
	strb r1, [r0, #0x99a]
	ldr r0, [r2, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F088: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F050

	arm_func_start ov11_0230F08C
ov11_0230F08C: ; 0x0230F08C
	ldr r2, _0230F0C0 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
	ldr r0, [r2, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0x99a]
	ldr r0, [r2, #8]
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F0C0: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F08C

	arm_func_start WorldMapSetCamera
WorldMapSetCamera: ; 0x0230F0C4
	ldr r2, _0230F0E8 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	addne r1, r1, #0xf900
	strneh r0, [r1, #0x9c]
	ldrne r0, [r2, #8]
	movne r1, #1
	strneb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F0E8: .word WORLD_MAP_MODE
	arm_func_end WorldMapSetCamera

	arm_func_start ov11_0230F0EC
ov11_0230F0EC: ; 0x0230F0EC
	ldr r2, _0230F134 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf900
	strh r0, [r1, #0x9e]
	ldr r0, [r2, #8]
	mov r1, #2
	add r0, r0, #0xf000
	str r1, [r0, #0x9a0]
	ldr r0, [r2, #8]
	mov r1, #0x200
	add r0, r0, #0xf000
	str r1, [r0, #0x9a4]
	ldr r0, [r2, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F134: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F0EC

	arm_func_start ov11_0230F138
ov11_0230F138: ; 0x0230F138
	ldr r3, _0230F17C ; =WORLD_MAP_MODE
	ldr r2, [r3, #8]
	cmp r2, #0
	bxeq lr
	add r2, r2, #0xf900
	strh r0, [r2, #0x9e]
	ldr r0, [r3, #8]
	mov r2, #3
	add r0, r0, #0xf000
	str r2, [r0, #0x9a0]
	ldr r0, [r3, #8]
	mov r2, #1
	add r0, r0, #0xf000
	str r1, [r0, #0x9a8]
	ldr r0, [r3, #8]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0230F17C: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F138

	arm_func_start ov11_0230F180
ov11_0230F180: ; 0x0230F180
	ldr r1, _0230F1B0 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	cmp r2, #0
	bxeq lr
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf000
	mov r2, #1
	str r2, [r0, #0x9b0]
	ldr r0, [r1, #8]
	add r0, r0, #0xf000
	strb r2, [r0, #0x9ac]
	bx lr
	.align 2, 0
_0230F1B0: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F180

	arm_func_start ov11_0230F1B4
ov11_0230F1B4: ; 0x0230F1B4
	ldr r1, _0230F1E8 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	cmp r2, #0
	bxeq lr
	add r0, r2, r0, lsl #2
	add r0, r0, #0xf000
	mov r2, #2
	str r2, [r0, #0x9b0]
	ldr r0, [r1, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0x9ac]
	bx lr
	.align 2, 0
_0230F1E8: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F1B4

	arm_func_start ov11_0230F1EC
ov11_0230F1EC: ; 0x0230F1EC
	ldr r2, _0230F218 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xfe00
	strh r0, [r1, #0x8a]
	ldr r0, [r2, #8]
	mov r1, #1
	add r0, r0, #0xf000
	strb r1, [r0, #0xe88]
	bx lr
	.align 2, 0
_0230F218: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F1EC

	arm_func_start ov11_0230F21C
ov11_0230F21C: ; 0x0230F21C
	ldr r2, _0230F258 ; =WORLD_MAP_MODE
	ldr r1, [r2, #8]
	cmp r1, #0
	bxeq lr
	add r1, r1, #0xf000
	mov r3, #1
	strb r3, [r1, #0xe8c]
	ldr r1, [r2, #8]
	mov r3, #0
	add r1, r1, #0xfe00
	strh r0, [r1, #0x8e]
	ldr r0, [r2, #8]
	add r0, r0, #0xf000
	strb r3, [r0, #0xe90]
	bx lr
	.align 2, 0
_0230F258: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F21C

	arm_func_start ov11_0230F25C
ov11_0230F25C: ; 0x0230F25C
	ldr r1, _0230F288 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	ldr r2, [r1, #0x40]
	ldr r1, [r1, #0x44]
	str r2, [r0]
	str r1, [r0, #4]
	mov r0, #1
	bx lr
	.align 2, 0
_0230F288: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F25C

	arm_func_start ov11_0230F28C
ov11_0230F28C: ; 0x0230F28C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0230F358 ; =WORLD_MAP_MODE
	mov r5, r0
	ldr r0, [r2, #4]
	mov r4, r1
	cmp r0, #0
	beq _0230F350
	ldr r1, [r2, #8]
	ldrsh r2, [r1, #2]
	cmp r2, #0x10c
	bne _0230F2E0
	mov r0, #0x8000
	str r0, [r5]
	mov r0, #0x6000
	str r0, [r5, #4]
	mov r0, #0x17800
	str r0, [r4]
	mov r0, #0xf000
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230F2E0:
	mvn r1, #0
	cmp r2, r1
	beq _0230F350
	mov r1, r5
	mov r2, r4
	bl ov11_022EF498
	ldr r0, [r5]
	add r0, r0, #0x8000
	str r0, [r5]
	ldr r0, [r5, #4]
	add r0, r0, #0x6000
	str r0, [r5, #4]
	ldr r0, [r4]
	sub r0, r0, #0x8000
	str r0, [r4]
	ldr r0, [r4, #4]
	sub r0, r0, #0x6000
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r4]
	cmp r1, r0
	strgt r1, [r4]
	ldr r1, [r5, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	strgt r1, [r4, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0230F350:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0230F358: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F28C

	arm_func_start ov11_0230F35C
ov11_0230F35C: ; 0x0230F35C
	ldr r0, _0230F374 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	cmp r0, #0
	ldrneb r0, [r0, #0xc]
	moveq r0, #0
	bx lr
	.align 2, 0
_0230F374: .word WORLD_MAP_MODE
	arm_func_end ov11_0230F35C

	arm_func_start ov11_0230F378
ov11_0230F378: ; 0x0230F378
	bx lr
	arm_func_end ov11_0230F378

	arm_func_start ov11_0230F37C
ov11_0230F37C: ; 0x0230F37C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x4c
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _0230FDB0
_0230F39C: ; jump table
	b _0230F3C4 ; case 0
	b _0230F3EC ; case 1
	b _0230FDB0 ; case 2
	b _0230FDB0 ; case 3
	b _0230F7D0 ; case 4
	b _0230F900 ; case 5
	b _0230F640 ; case 6
	b _0230F66C ; case 7
	b _0230FD84 ; case 8
	b _0230FDA0 ; case 9
_0230F3C4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230F3EC:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	movne r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1, #0x6bc]
	cmp r0, #0
	beq _0230F434
	add r0, r1, #0x6c0
	bl ov11_022F6EFC
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0x6bc]
_0230F434:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0]
	cmp r1, #0
	bne _0230F4D4
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	addne r0, r1, #0xf000
	movne r1, #0
	strneb r1, [r0, #0x999]
	bne _0230F4A0
	mov r0, #0x3e8
	bl sub_0206A878
	ldr r1, _02310054 ; =0x0000010D
	cmp r0, r1
	bne _0230F48C
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x999]
	b _0230F4A0
_0230F48C:
	bl sub_0204CDCC
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x999]
_0230F4A0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	beq _0230F4D4
	bl CloseAreaNameBox
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_0230F4D4:
	ldr r3, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r3, #8]
	add r1, r0, #0xf000
	ldrb r1, [r1, #0xf90]
	cmp r1, #0
	beq _0230F514
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #1
	ldr r2, [r0, #8]
	mov r1, #8
	strb r3, [r2, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0, #8]
	b _0230FDB0
_0230F514:
	add r2, r0, #0xf900
	ldrsb r1, [r2, #0x99]
	cmp r1, #0
	blt _0230F604
	ldr r2, [r3]
	mvn r1, #0
	str r2, [r0, #0x2c]
	ldr r4, [r3, #8]
	mov r2, #1
	add r0, r4, #0xf900
	ldrsb r0, [r0, #0x99]
	strb r0, [r4, #4]
	ldr r0, [r3, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x999]
	ldr r0, [r3, #8]
	strb r2, [r0, #0xc]
	ldr r1, [r3, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230F588
	bl sub_0206A9DC
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r2, #2
	ldr r3, [r1, #8]
	strh r0, [r3, #2]
	ldr r0, [r1, #8]
	str r2, [r0, #8]
	b _0230F5BC
_0230F588:
	ldrsb r0, [r1, #4]
	cmp r0, #0
	movne r0, #0x10c
	strneh r0, [r1, #2]
	ldrne r0, [r3, #8]
	movne r1, #2
	strne r1, [r0, #8]
	bne _0230F5BC
	add r0, r2, #0x10c
	strh r0, [r1, #2]
	ldr r0, [r3, #8]
	mov r1, #2
	str r1, [r0, #8]
_0230F5BC:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r2, #0
	ldr r1, [r0, #8]
	strb r2, [r1, #5]
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x2c]
	cmp r0, #3
	bne _0230F5F0
	ldrsb r0, [r1, #4]
	cmp r0, #1
	addgt r0, r1, #0xf000
	ldrgtb r0, [r0, #0x99a]
	strgtb r0, [r1, #5]
_0230F5F0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F604:
	ldrsh r3, [r2, #0x9c]
	mvn r1, #0
	cmp r3, r1
	ldreqsh r2, [r2, #0x9e]
	cmpeq r2, r1
	moveq r1, #0
	streqb r1, [r0, #0xc]
	beq _0230FDB0
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r2, #5
	str r2, [r0, #8]
	ldr r0, [r1, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F640:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	movne r1, #1
	ldrne r0, [r0, #8]
	strneb r1, [r0, #0xc]
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #7
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230F66C:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	add r0, r1, #0xf000
	ldrb r0, [r0, #0xf90]
	cmp r0, #0
	bne _0230F694
	add r0, r1, #0xf900
	ldrsb r0, [r0, #0x99]
	cmp r0, #0
	blt _0230F6BC
_0230F694:
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r0, #8]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F6BC:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _0230F764
	mov r0, #0
	mov r1, #0x20
	bl LoadScriptVariableValue
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
	add r0, sp, #0x44
	mov r1, r4
	bl GetDungeonMapPos
	cmp r0, #0
	ldreq r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	ldreq r0, [r0, #8]
	streqb r1, [r0, #0xc]
	beq _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrsh r0, [r1, #0x30]
	cmp r0, r4
	beq _0230F758
	mov r1, r4
	bl sub_0206A8A0
	cmp r0, #0
	ldrne r0, _02310050 ; =WORLD_MAP_MODE
	ldrne r0, [r0, #8]
	strneh r4, [r0, #0x30]
	bne _0230FDB0
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r3, #0
	ldr r2, [r0, #8]
	mov r1, #1
	str r3, [r2, #8]
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F758:
	mov r0, #0
	strb r0, [r1, #0xc]
	b _0230FDB0
_0230F764:
	bl ov11_0230EDDC
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	add r0, r2, #0xf000
	ldrb r1, [r0, #0x9ac]
	cmp r1, #0
	ldreqb r1, [r0, #0xe88]
	cmpeq r1, #0
	beq _0230F7A4
	mov r1, #5
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0xc]
	b _0230FDB0
_0230F7A4:
	ldr r1, [r2, #0x2c]
	cmp r1, #3
	bne _0230F7C4
	ldr r0, [r0, #0x990]
	cmp r0, #0
	movgt r0, #1
	strgtb r0, [r2, #0xc]
	bgt _0230FDB0
_0230F7C4:
	mov r0, #0
	strb r0, [r2, #0xc]
	b _0230FDB0
_0230F7D0:
	add r0, sp, #0x3c
	mov r1, #0x3e8
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F7F0
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F7F0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230F860
	bl sub_0206AA40
	add r2, sp, #4
	mvn r1, #0
	bl sub_0206A96C
	mvn r1, #0
	cmp r0, r1
	beq _0230F848
	ldr r1, [sp, #4]
	cmp r1, #0
	blt _0230F848
	ldr r0, [sp, #8]
	mov r1, r1, lsl #8
	mov r0, r0, lsl #8
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	mov r0, #1
	b _0230F84C
_0230F848:
	mov r0, #0
_0230F84C:
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F860:
	ldrsh r1, [r1, #2]
	ldr r0, _02310054 ; =0x0000010D
	cmp r1, r0
	add r0, sp, #0x3c
	bne _0230F890
	mov r1, #0xc1
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
	b _0230F8A8
_0230F890:
	mov r1, #0xb8
	bl GetDungeonMapPos
	cmp r0, #0
	beq _0230F8A8
	add r0, sp, #0x3c
	bl ov11_0230EDB0
_0230F8A8:
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrsh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0230F900
	mov r0, #0
	strb r0, [r2, #0x530]
	ldr r0, [r1, #8]
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x2c]
	ldr r3, [r1, #8]
	cmp r0, #0
	ldreq r0, _02310058 ; =0x00000807
	movne r0, #0x800
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r3, #0x500
	ldrsb r2, [r0, #0x30]
	add r0, r3, #0x134
	add r0, r0, #0x400
	bl SetAnimDataFields2
_0230F900:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldrsb r0, [r2, #4]
	cmp r0, #0
	ble _0230F978
	ldr r0, _0231005C ; =ov11_02323310
	mov r3, #0x150
	ldr r1, [r0, #0x14]
	ldr r0, [r0, #0x10]
	str r1, [sp, #0x38]
	str r0, [sp, #0x34]
	ldrsb r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	cmp r0, #1
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	movne r1, #0x1f8
	str r1, [sp, #0x34]
	ldr r0, [r0, #8]
	add r1, sp, #0x34
	ldrsb r2, [r0, #4]
	add r0, r0, #0x10
	sub r2, r2, #1
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	mul r3, r2, r3
	str r3, [sp, #0x38]
	bl ov11_022F040C
_0230F978:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0230FB38
	ldrsb r1, [r4, #4]
	ldr r3, _02310060 ; =ov11_023233E8
	mov r0, #0x18
	sub r1, r1, #2
	mla r3, r1, r0, r3
	add r0, r4, #0xf000
	str r3, [r0, #0x994]
	ldr r0, [r2, #8]
	ldr r4, _02310064 ; =ov11_02323374
	ldrsb r3, [r0, #4]
	add r1, r0, #0xf000
	mov r0, #0
	sub r3, r3, #2
	ldrb r3, [r4, r3]
	str r3, [r1, #0x668]
	ldr r1, [r2, #8]
	ldrsb r1, [r1, #4]
	subs r3, r1, #2
	beq _0230F9F4
	mov r2, r0
	b _0230F9EC
_0230F9E0:
	ldrb r1, [r4, r2]
	add r2, r2, #1
	add r0, r0, r1
_0230F9EC:
	cmp r2, r3
	bne _0230F9E0
_0230F9F4:
	mov r7, #0
	ldr r5, _02310068 ; =ov11_02323490
	mov r2, #0x18
	ldr r3, _02310050 ; =WORLD_MAP_MODE
	b _0230FA20
_0230FA08:
	add r1, r7, r0
	mla r4, r1, r2, r5
	add r1, r6, r7, lsl #2
	add r1, r1, #0xf000
	str r4, [r1, #0x980]
	add r7, r7, #1
_0230FA20:
	ldr r6, [r3, #8]
	add r1, r6, #0xf000
	ldr r4, [r1, #0x668]
	cmp r7, r4
	bne _0230FA08
	ldr r0, [r1, #0x994]
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x10]
	mov r3, #0
	str r0, [r1, #0x990]
	ldr r4, [r2, #8]
	add r0, r4, #0xf000
	strb r3, [r0, #0x5a0]
	ldr r1, [r2, #8]
	add r4, r4, #0x1a4
	ldrb r0, [r1, #5]
	cmp r0, #0
	ldrneb r0, [r1, #0x6bc]
	cmpne r0, #0
	beq _0230FB24
	add r0, r4, #0xf400
	add r1, r1, #0x6c0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r4, #0xf400
	mov r1, #0xe
	bl ov11_022F4974
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	add r0, r4, #0xf400
	ldr r1, [r1, #8]
	mov r2, #0
	add r1, r1, #0xf000
	ldr r1, [r1, #0x994]
	ldrsh r1, [r1, #0x14]
	bl SetAnimDataFields2
	mov r5, #0
	mov r4, r5
	ldr r7, _02310050 ; =WORLD_MAP_MODE
	mov r6, #0xc4
	b _0230FB08
_0230FABC:
	mul r8, r5, r6
	ldr r1, [r7, #8]
	add r0, r1, #0x670
	add sb, r0, #0xf000
	add r0, sb, r8
	add r1, r1, #0x6c0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, sb, r8
	rsb r1, r5, #0x20
	bl ov11_022F4974
	ldr r1, [r7, #8]
	mov r2, r4
	add r0, sb, r8
	add r1, r1, r5, lsl #2
	add r1, r1, #0xf000
	ldr r1, [r1, #0x980]
	ldrsh r1, [r1, #0x14]
	bl SetAnimDataFields2
	add r5, r5, #1
_0230FB08:
	ldr r0, [r7, #8]
	add r0, r0, #0xf000
	ldr r1, [r0, #0x668]
	cmp r5, r1
	bne _0230FABC
	mov r1, #1
	strb r1, [r0, #0x5a0]
_0230FB24:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #5]
	b _0230FB44
_0230FB38:
	add r0, r4, #0xf000
	mov r1, #0
	str r1, [r0, #0x990]
_0230FB44:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x2c]
	cmp r0, #4
	beq _0230FB9C
	mov r6, #1
	mov r5, r6
	mov r4, #0
_0230FB64:
	sub r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl GetDungeonMode
	cmp r0, #0
	beq _0230FB90
	mov r0, r6, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
_0230FB90:
	add r6, r6, #1
	cmp r6, #0xb4
	ble _0230FB64
_0230FB9C:
	mov sb, #0
	mov r6, #1
	ldr r4, _02310050 ; =WORLD_MAP_MODE
	ldr sl, _0231006C ; =0x00000136
	mov r5, sb
	mov r8, r6
	mvn r7, #0
_0230FBB8:
	ldr r2, [r4, #8]
	add r0, r2, sb, lsl #2
	add r0, r0, #0xf000
	ldr r1, [r0, #0x9b0]
	cmp r1, r7
	beq _0230FBF4
	mov r0, sb, lsl #0x10
	mov r2, r8
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
	ldr r0, [r4, #8]
	add r0, r0, sb, lsl #2
	add r0, r0, #0xf000
	str r7, [r0, #0x9b0]
	b _0230FC28
_0230FBF4:
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	beq _0230FC28
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	bl sub_0204CE00
	cmp r0, #0
	beq _0230FC28
	mov r0, sb, lsl #0x10
	mov r1, r6
	mov r2, r5
	mov r0, r0, asr #0x10
	bl ov11_0230EF48
_0230FC28:
	add sb, sb, #1
	cmp sb, sl
	blt _0230FBB8
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x2c]
	cmp r0, #4
	cmpne r0, #3
	beq _0230FC7C
	ldrb r0, [r1]
	cmp r0, #0
	beq _0230FC6C
	bl sub_0206AA40
	mov r1, #1
	mov r2, #0
	bl ov11_0230EF48
	b _0230FC7C
_0230FC6C:
	mov r0, #0xb8
	mov r1, #1
	mov r2, #0
	bl ov11_0230EF48
_0230FC7C:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	add r0, r4, #0xf000
	ldrb r0, [r0, #0xe88]
	cmp r0, #0
	beq _0230FCEC
	add r0, r4, #0xfe00
	add r1, r4, #0x500
	ldrsh r3, [r0, #0x8a]
	ldrsh r0, [r1, #0x2c]
	add r4, r4, #0xdc
	cmp r0, r3
	mvnne r0, #0
	strneh r3, [r1, #0x2c]
	cmpne r3, r0
	beq _0230FCEC
	ldr r1, [r2, #8]
	add r0, r4, #0xf400
	add r1, r1, #0x1f8
	add r1, r1, #0x400
	bl InitAnimDataFromOtherAnimDataVeneer
	add r0, r4, #0xf400
	mov r1, #0xc
	bl ov11_022F4974
	ldr r1, _02310070 ; =0x0000080D
	add r0, r4, #0xf400
	mov r2, #0
	bl SetAnimDataFields2
_0230FCEC:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	mov r0, #0
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x9ac]
	ldr r1, [r2, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0xe88]
	ldr r1, [r2, #8]
	ldr r1, [r1, #0x2c]
	cmp r1, #0
	bne _0230FD34
	mov r1, #0x20
	bl LoadScriptVariableValue
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf900
	strh r0, [r1, #0x9c]
_0230FD34:
	bl ov11_0230EDDC
	cmp r0, #0
	beq _0230FD5C
	mov r0, #0x10
	bl ov11_022E9C98
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #6
	ldr r0, [r0, #8]
	str r1, [r0, #8]
	b _0230FDB0
_0230FD5C:
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mvn r0, #0
	ldr r2, [r1, #8]
	ldrsh r1, [r2, #0x30]
	cmp r1, r0
	movne r0, #7
	strne r0, [r2, #8]
	moveq r0, #1
	streq r0, [r2, #8]
	b _0230FDB0
_0230FD84:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _0230FDB0
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #9
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_0230FDA0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #0xc]
_0230FDB0:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r3, [r1, #0x40]
	ldr r2, [r1, #0x44]
	ldr r0, [r1, #0x34]
	str r3, [sp, #0x2c]
	str r2, [sp, #0x30]
	cmp r0, #1
	beq _0230FDE8
	cmp r0, #2
	beq _0230FE78
	cmp r0, #3
	beq _0230FF04
	b _0230FF64
_0230FDE8:
	ldr r2, _0231005C ; =ov11_02323310
	add r0, sp, #0x1c
	ldr r3, [r2, #0x2c]
	ldr r2, [r2, #0x28]
	str r3, [sp, #0x20]
	str r2, [sp, #0x1c]
	ldr r3, [r1, #0x48]
	ldr r2, [r1, #0x40]
	sub r2, r3, r2
	str r2, [sp, #0x1c]
	ldr r3, [r1, #0x4c]
	ldr r2, [r1, #0x44]
	sub r2, r3, r2
	str r2, [sp, #0x20]
	ldr r1, [r1, #0x38]
	bl ClampComponentAbs
	ldr r3, [sp, #0x1c]
	cmp r3, #0
	ldreq r0, [sp, #0x20]
	cmpeq r0, #0
	ldreq r0, _02310050 ; =WORLD_MAP_MODE
	moveq r1, #0
	ldreq r0, [r0, #8]
	streq r1, [r0, #0x34]
	beq _0230FF74
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldr r1, [r2, #0x40]
	add r1, r1, r3
	str r1, [r2, #0x40]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x20]
	ldr r1, [r2, #0x44]
	add r0, r1, r0
	str r0, [r2, #0x44]
	b _0230FF74
_0230FE78:
	ldr r2, _0231005C ; =ov11_02323310
	add r0, sp, #0x14
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #8]
	str r3, [sp, #0x18]
	str r2, [sp, #0x14]
	ldr r3, [r1, #0x48]
	ldr r2, [r1, #0x40]
	sub r2, r3, r2
	str r2, [sp, #0x14]
	ldr r2, [r1, #0x4c]
	ldr r1, [r1, #0x44]
	sub r1, r2, r1
	str r1, [sp, #0x18]
	bl EuclideanNorm__020050B0
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	mov r4, r0
	ldr r5, [r1, #8]
	ldr r0, [r5, #0x38]
	bl _fflt
	mov r1, r0
	mov r0, r4
	bl _fdiv
	bl _ffix
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	str r0, [r5, #0x3c]
	ldr r1, [r1, #8]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	movle r0, #1
	strle r0, [r1, #0x3c]
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #3
	ldr r0, [r0, #8]
	str r1, [r0, #0x34]
_0230FF04:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r2, [r0, #8]
	add r0, sp, #0xc
	str r1, [sp]
	ldr r3, [r2, #0x3c]
	add r1, r2, #0x40
	add r2, r2, #0x48
	bl sub_0200514C
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r2, [sp, #0xc]
	ldr r3, [r0, #8]
	ldr r1, [sp, #0x10]
	str r2, [r3, #0x40]
	str r1, [r3, #0x44]
	ldr r1, [r3, #0x3c]
	sub r1, r1, #1
	str r1, [r3, #0x3c]
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	movle r0, #0
	strle r0, [r1, #0x34]
	b _0230FF74
_0230FF64:
	ldr r2, [r1, #0x48]
	ldr r0, [r1, #0x4c]
	str r2, [r1, #0x40]
	str r0, [r1, #0x44]
_0230FF74:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r3, [r0, #8]
	ldr r0, [r3, #0x34]
	cmp r0, #0
	mvneq r0, #0
	streqb r0, [r3, #0x50]
	beq _0230FFC4
	ldr r2, [r3, #0x40]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	sub r0, r2, r0
	str r0, [sp, #0x24]
	ldr r2, [r3, #0x44]
	add r0, sp, #0x24
	sub r1, r2, r1
	str r1, [sp, #0x28]
	bl sub_020055C8
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	strb r0, [r1, #0x50]
_0230FFC4:
	ldr r2, _02310050 ; =WORLD_MAP_MODE
	ldr r4, [r2, #8]
	add r1, r4, #0x500
	ldrsh r0, [r1, #0x2e]
	cmp r0, #0
	ldrnesb r3, [r4, #0x50]
	mvnne r0, #0
	cmpne r3, r0
	ldrnesb r0, [r1, #0x30]
	cmpne r0, r3
	beq _0231002C
	strb r3, [r4, #0x530]
	ldr r0, [r2, #8]
	ldr r1, _02310050 ; =WORLD_MAP_MODE
	ldr r0, [r0, #0x2c]
	ldr r3, [r1, #8]
	cmp r0, #0
	ldreq r0, _02310058 ; =0x00000807
	movne r0, #0x800
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	add r0, r3, #0x500
	ldrsb r2, [r0, #0x30]
	add r0, r3, #0x134
	add r0, r0, #0x400
	bl SetAnimDataFields2
_0231002C:
	ldr r0, _02310050 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x34]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r1, #0xc]
	mov r0, #0
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02310050: .word WORLD_MAP_MODE
_02310054: .word 0x0000010D
_02310058: .word 0x00000807
_0231005C: .word ov11_02323310
_02310060: .word ov11_023233E8
_02310064: .word ov11_02323374
_02310068: .word ov11_02323490
_0231006C: .word 0x00000136
_02310070: .word 0x0000080D
	arm_func_end ov11_0230F37C

	arm_func_start ov11_02310074
ov11_02310074: ; 0x02310074
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _0231031C ; =WORLD_MAP_MODE
	ldr r2, [r1, #8]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _02310250
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1, #8]
	ldr r1, _02310320 ; =ov11_02323730
	ldrsh r5, [r2, #2]
	mov r2, r5
	bl Debug_Print
	bl ov11_0230EC00
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #0
	str r0, [r2, #4]
	ldr r0, [r2, #8]
	cmp r5, r1
	strh r5, [r0, #2]
	bne _02310108
	ldr r0, [r2, #4]
	ldr r1, _02310324 ; =ov11_02323394
	bl GroundBg_Init
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldmib r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _023101EC
_02310108:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _02310328 ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _023101A0
_0231012C: ; jump table
	b _02310178 ; case 0
	b _023101A0 ; case 1
	b _023101A0 ; case 2
	b _023101A0 ; case 3
	b _023101A0 ; case 4
	b _023101A0 ; case 5
	b _02310160 ; case 6
	b _02310160 ; case 7
	b _02310160 ; case 8
	b _02310160 ; case 9
	b _02310160 ; case 10
	b _02310178 ; case 11
	b _02310178 ; case 12
_02310160:
	ldr r0, [r2, #4]
	ldr r1, _0231032C ; =ov11_023233B0
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	b _023101B8
_02310178:
	ldr r0, _02310330 ; =ov11_02323310
	ldrsh r3, [r4]
	ldr ip, [r0, #0x1c]
	ldr lr, [r0, #0x18]
	ldr r1, _02310334 ; =ov11_02323750
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_023101A0:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r1, _02310324 ; =ov11_02323394
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_023128C0
_023101B8:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldmib r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r2, _02310338 ; =ov11_02323330
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023101EC:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r2, [r0, #8]
	ldrb r1, [r2, #5]
	cmp r1, #0
	beq _02310240
	mov r1, #3
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r2, _0231033C ; =0xA4080000
	add r0, r0, #0x6c0
	mov r1, #0x9a
	bl LoadObjectAnimData
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #8
	ldr r0, [r0, #8]
	add r0, r0, #0x6c0
	bl ov11_022F4974
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #0x6bc]
_02310240:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #4
	ldr r0, [r0, #8]
	str r1, [r0, #8]
_02310250:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	add r0, r1, #0xf000
	ldrb r0, [r0, #0xe8c]
	cmp r0, #0
	beq _02310314
	add r0, r1, #0xf900
	ldrsb r0, [r0, #0x98]
	mvn r1, #1
	cmp r0, r1
	beq _023102B0
	bl IsAreaNameBoxActive
	cmp r0, #0
	bne _023102B0
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	add r0, r0, #0xf900
	ldrsb r0, [r0, #0x98]
	bl CloseAreaNameBox
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0x998]
_023102B0:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mvn r1, #1
	ldr r2, [r0, #8]
	add r0, r2, #0xf900
	ldrsb r0, [r0, #0x98]
	cmp r0, r1
	bne _02310314
	add r0, r2, #0xfe00
	ldrsh r3, [r0, #0x8e]
	add r0, r1, #1
	cmp r3, r0
	beq _02310300
	ldr r0, _02310340 ; =ov11_02323340
	mov r1, #0x13
	mov r2, #0
	bl CreateAreaNameBox
	ldr r1, _0231031C ; =WORLD_MAP_MODE
	ldr r1, [r1, #8]
	add r1, r1, #0xf000
	strb r0, [r1, #0x998]
_02310300:
	ldr r0, _0231031C ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	add r0, r0, #0xf000
	strb r1, [r0, #0xe8c]
_02310314:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231031C: .word WORLD_MAP_MODE
_02310320: .word ov11_02323730
_02310324: .word ov11_02323394
_02310328: .word EVENTS
_0231032C: .word ov11_023233B0
_02310330: .word ov11_02323310
_02310334: .word ov11_02323750
_02310338: .word ov11_02323330
_0231033C: .word 0xA4080000
_02310340: .word ov11_02323340
	arm_func_end ov11_02310074

	arm_func_start ov11_02310344
ov11_02310344: ; 0x02310344
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	cmp r0, #7
	cmpne r0, #6
	cmpne r0, #0
	cmpne r0, #5
	bne _02310614
	add r1, sp, #0x10
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp, #0x10]
	streq r0, [sp, #0x14]
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #8]
	ldr r1, [r0, #0x2c]
	cmp r1, #3
	bne _023104A4
	add r1, r0, #0xf000
	ldr r2, [r1, #0x990]
	cmp r2, #0
	ble _023104A4
	ldr r1, [r1, #0x994]
	add r0, r0, #0xf000
	ldr r1, [r1, #0x10]
	sub r1, r1, r2
	subs sb, r1, #0x1e
	ldr r2, [r0, #0x990]
	ldr r1, _02310624 ; =WORLD_MAP_MODE
	sub r2, r2, #1
	str r2, [r0, #0x990]
	ldr r2, [r1, #8]
	movmi sb, #0
	add r0, r2, #0xf000
	ldr r4, [r0, #0x994]
	add r2, r2, #0x1a4
	ldr r3, [r4, #8]
	ldr r5, [r4]
	mul r4, r3, sb
	add r3, r4, r5, lsl #8
	str r3, [sp, #8]
	ldr r3, [r0, #0x994]
	add r0, r2, #0xf400
	ldr r2, [r3, #0xc]
	ldr r4, [r3, #4]
	mul r3, r2, sb
	add r3, r3, r4, lsl #8
	add r1, sp, #8
	mov r2, #0
	str r3, [sp, #0xc]
	bl AnimRelatedFunction__022F6F14
	mov r8, #0
	add r7, sp, #8
	mov r6, r8
	ldr r5, _02310624 ; =WORLD_MAP_MODE
	mov r4, #0xc4
	b _02310490
_02310438:
	ldr r3, [r5, #8]
	mov r1, r7
	add r0, r3, r8, lsl #2
	add r2, r0, #0xf000
	ldr sl, [r2, #0x980]
	add r0, r3, #0x670
	ldr r3, [sl, #8]
	add r0, r0, #0xf000
	mul r3, sb, r3
	ldr sl, [sl]
	mla r0, r8, r4, r0
	add r3, r3, sl, lsl #8
	str r3, [sp, #8]
	ldr sl, [r2, #0x980]
	mov r2, r6
	ldr r3, [sl, #0xc]
	ldr sl, [sl, #4]
	mul r3, sb, r3
	add r3, r3, sl, lsl #8
	str r3, [sp, #0xc]
	bl AnimRelatedFunction__022F6F14
	add r8, r8, #1
_02310490:
	ldr r0, [r5, #8]
	add r1, r0, #0xf000
	ldr r1, [r1, #0x668]
	cmp r8, r1
	bne _02310438
_023104A4:
	ldr r1, [r0, #0x2c]
	mov sb, #0
	cmp r1, #1
	bhi _023104F8
	add r0, r0, #0x500
	ldrsh r0, [r0, #0x2e]
	cmp r0, #0
	beq _023104F8
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r2, sp, #0
	ldr r5, [r0, #8]
	mov r3, sb
	ldr r4, [r5, #0x40]
	ldr r0, [r5, #0x44]
	add r1, r5, #0x500
	str r0, [sp, #4]
	str r4, [sp]
	add r0, r5, #0x134
	ldrsh r1, [r1, #0x2e]
	add r0, r0, #0x400
	bl ov11_022F5C94
_023104F8:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	mvn r2, #0
	ldr r0, [r0, #8]
	add r0, r0, #0x500
	ldrsh r1, [r0, #0x2c]
	cmp r1, r2
	beq _02310540
	add r0, sp, #0
	bl GetDungeonMapPos
	cmp r0, #0
	beq _02310540
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r1, sp, #0
	ldr r0, [r0, #8]
	mov r2, #0
	add r0, r0, #0xdc
	add r0, r0, #0xf400
	bl AnimRelatedFunction__022F6F14
_02310540:
	mov sl, #0
	add r8, sp, #0
	mov fp, sl
	ldr r7, _02310624 ; =WORLD_MAP_MODE
	mov r5, #0xc4
	mvn r6, #0
	ldr r4, _02310628 ; =0x00000136
	b _023105BC
_02310560:
	ldr r0, [r7, #8]
	add r0, r0, sl, lsl #2
	ldr r0, [r0, #0x54]
	cmp r0, #0
	cmpne r0, r6
	beq _023105B8
	mov r1, sl, lsl #0x10
	mov r0, r8
	mov r1, r1, asr #0x10
	bl GetDungeonMapPos
	cmp r0, #0
	beq _023105B8
	ldr r0, [r7, #8]
	mov r1, r8
	add r0, r0, #0x384
	add r0, r0, #0x400
	mla r0, sl, r5, r0
	mov r2, fp
	bl AnimRelatedFunction__022F6F14
	add sb, sb, #1
	cmp sb, #0x64
	bgt _023105C4
_023105B8:
	add sl, sl, #1
_023105BC:
	cmp sl, r4
	blt _02310560
_023105C4:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r1, sp, #0x10
	ldr r0, [r0, #8]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023105F8
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	add r2, sp, #0x10
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023105F8:
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02310624 ; =WORLD_MAP_MODE
	mov r1, #1
	ldr r0, [r0, #8]
	strb r1, [r0, #6]
_02310614:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02310624: .word WORLD_MAP_MODE
_02310628: .word 0x00000136
	arm_func_end ov11_02310344

	arm_func_start ov11_0231062C
ov11_0231062C: ; 0x0231062C
	stmdb sp!, {r3, lr}
	ldr r0, _02310668 ; =WORLD_MAP_MODE
	ldr r1, [r0, #8]
	ldrb r1, [r1, #6]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02310660
	bl ov11_022EFB70
	ldr r0, _02310668 ; =WORLD_MAP_MODE
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #6]
_02310660:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310668: .word WORLD_MAP_MODE
	arm_func_end ov11_0231062C

	arm_func_start ov11_0231066C
ov11_0231066C: ; 0x0231066C
	ldr ip, _02310678 ; =ov11_0230D270
	ldr r0, _0231067C ; =ov11_02323788
	bx ip
	.align 2, 0
_02310678: .word ov11_0230D270
_0231067C: .word ov11_02323788
	arm_func_end ov11_0231066C

	arm_func_start ov11_02310680
ov11_02310680: ; 0x02310680
	ldr ip, _0231068C ; =ov11_0230D17C
	ldr r0, _02310690 ; =ov11_02323788
	bx ip
	.align 2, 0
_0231068C: .word ov11_0230D17C
_02310690: .word ov11_02323788
	arm_func_end ov11_02310680

	arm_func_start ov11_02310694
ov11_02310694: ; 0x02310694
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r0, #0x6f0
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0231072C ; =ov11_02324DF0
	mov r2, #1
	str r0, [r1]
	strb r2, [r0, #0x6ec]
	bl ov11_023107BC
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r0, _0231072C ; =ov11_02324DF0
	mov r2, #1
	ldr r1, [r0]
	mov r4, #0
	strb r2, [r1, #0x6ed]
	ldr r1, [r0]
	ldr r6, _02310730 ; =0xA0080000
	strb r4, [r1, #0x6ee]
	ldr r1, [r0]
	mov r7, #0x9c
	str r2, [r1, #4]
	ldr r0, [r0]
	mov r5, #8
	add r8, r0, #8
_023106F8:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl LoadObjectAnimData
	mov r0, r8
	mov r1, r5
	bl ov11_022F4974
	add r4, r4, #1
	cmp r4, #9
	add r8, r8, #0xc4
	blt _023106F8
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0231072C: .word ov11_02324DF0
_02310730: .word 0xA0080000
	arm_func_end ov11_02310694

	arm_func_start ov11_02310734
ov11_02310734: ; 0x02310734
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	bne _02310760
	ldr r0, _023107B8 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #0x6ee]
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
_02310760:
	bl ov11_023107BC
	ldr r0, _023107B8 ; =ov11_02324DF0
	mov r2, #8
	ldr r1, [r0]
	mov r5, #0
	str r2, [r1, #4]
	ldr r0, [r0]
	add r4, r0, #8
_02310780:
	mov r0, r4
	bl ov11_022F6EFC
	add r5, r5, #1
	cmp r5, #9
	add r4, r4, #0xc4
	blt _02310780
	ldr r0, _023107B8 ; =ov11_02324DF0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023107B8 ; =ov11_02324DF0
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_023107B8: .word ov11_02324DF0
	arm_func_end ov11_02310734

	arm_func_start ov11_023107BC
ov11_023107BC: ; 0x023107BC
	stmdb sp!, {r3, lr}
	ldr r1, _02310834 ; =ov11_02324DF0
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1]
	strb r3, [r1, #0x6ec]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02310834 ; =ov11_02324DF0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02310820
	bl GroundBg_FreeAll
	ldr r0, _02310834 ; =ov11_02324DF0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02310834 ; =ov11_02324DF0
	mov r1, #0
	str r1, [r0, #4]
_02310820:
	ldr r0, _02310834 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x6ed]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310834: .word ov11_02324DF0
	arm_func_end ov11_023107BC

	arm_func_start ov11_02310838
ov11_02310838: ; 0x02310838
	ldr r0, _02310848 ; =ov11_02324DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0x6ec]
	bx lr
	.align 2, 0
_02310848: .word ov11_02324DF0
	arm_func_end ov11_02310838

	arm_func_start ov11_0231084C
ov11_0231084C: ; 0x0231084C
	bx lr
	arm_func_end ov11_0231084C

	arm_func_start ov11_02310850
ov11_02310850: ; 0x02310850
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02310A48
_0231086C: ; jump table
	b _02310890 ; case 0
	b _023108B8 ; case 1
	b _02310A48 ; case 2
	b _02310A48 ; case 3
	b _02310948 ; case 4
	b _023109A4 ; case 5
	b _023109D0 ; case 6
	b _02310A1C ; case 7
	b _02310A38 ; case 8
_02310890:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r0, [r0]
	str r1, [r0, #4]
_023108B8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r2, [r0]
	ldrb r1, [r2, #0x6ee]
	cmp r1, #0
	beq _02310910
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #0x6ec]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02310A48
_02310910:
	ldrb r1, [r2, #0x6ed]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #0x6ec]
	beq _02310A48
	mov r1, #1
	strb r1, [r2, #0x6ec]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x6ed]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _02310A48
_02310948:
	mov r7, #0
	ldr r6, _02310A54 ; =ov11_023237AC
	add r5, r1, #8
	mov r4, r7
_02310958:
	ldrsh r1, [r6, #8]
	mov r0, r5
	mov r2, r4
	bl SetAnimDataFields2
	add r7, r7, #1
	cmp r7, #9
	add r5, r5, #0xc4
	add r6, r6, #0xc
	blt _02310958
	mov r0, #0x10
	bl ov11_022E9C98
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #5
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
	b _02310A48
_023109A4:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02310A50 ; =ov11_02324DF0
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #0x6ec]
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0, #4]
_023109D0:
	ldr r0, _02310A50 ; =ov11_02324DF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x6ee]
	cmp r0, #0
	ldreqb r0, [r1, #0x6ed]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #0x6ec]
	beq _02310A48
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
	b _02310A48
_02310A1C:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02310A48
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0, #4]
_02310A38:
	ldr r0, _02310A50 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x6ec]
_02310A48:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02310A50: .word ov11_02324DF0
_02310A54: .word ov11_023237AC
	arm_func_end ov11_02310850

	arm_func_start ov11_02310A58
ov11_02310A58: ; 0x02310A58
	stmdb sp!, {r3, lr}
	ldr r0, _02310AC0 ; =ov11_02324DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1, #0x6ec]
	bl ov11_023107BC
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02310AC0 ; =ov11_02324DF0
	ldr r1, _02310AC4 ; =ov11_0232376C
	str r0, [r2, #4]
	bl GroundBg_Init
	ldr r0, _02310AC0 ; =ov11_02324DF0
	ldr r1, _02310AC8 ; =ov11_02323818
	ldr r0, [r0, #4]
	ldr r2, _02310ACC ; =ov11_0232382C
	bl ov11_022EDE64
	ldr r0, _02310AC0 ; =ov11_02324DF0
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310AC0: .word ov11_02324DF0
_02310AC4: .word ov11_0232376C
_02310AC8: .word ov11_02323818
_02310ACC: .word ov11_0232382C
	arm_func_end ov11_02310A58

	arm_func_start ov11_02310AD0
ov11_02310AD0: ; 0x02310AD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r0, _02310B98 ; =ov11_02324DF0
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #6
	cmpne r1, #5
	cmpne r1, #0
	bne _02310B58
	mov r6, #0
	ldr r5, _02310B9C ; =ov11_023237AC
	add r4, r2, #8
	add r8, sp, #0
	mov r7, r6
_02310B08:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	mov ip, r1, lsl #8
	mov r3, r0, lsl #8
	mov r0, r4
	mov r1, r8
	mov r2, r7
	str ip, [sp]
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
	add r6, r6, #1
	cmp r6, #9
	add r4, r4, #0xc4
	add r5, r5, #0xc
	blt _02310B08
	ldr r0, _02310B98 ; =ov11_02324DF0
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
	b _02310B8C
_02310B58:
	cmp r1, #3
	bne _02310B8C
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02310B98 ; =ov11_02324DF0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
_02310B8C:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02310B98: .word ov11_02324DF0
_02310B9C: .word ov11_023237AC
	arm_func_end ov11_02310AD0

	arm_func_start ov11_02310BA0
ov11_02310BA0: ; 0x02310BA0
	stmdb sp!, {r3, lr}
	ldr r0, _02310BD8 ; =ov11_02324DF0
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _02310BD8 ; =ov11_02324DF0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310BD8: .word ov11_02324DF0
	arm_func_end ov11_02310BA0

	arm_func_start ov11_02310BDC
ov11_02310BDC: ; 0x02310BDC
	ldr ip, _02310BE8 ; =ov11_0230DB58
	ldr r0, _02310BEC ; =ov11_02323840
	bx ip
	.align 2, 0
_02310BE8: .word ov11_0230DB58
_02310BEC: .word ov11_02323840
	arm_func_end ov11_02310BDC

	arm_func_start ov11_02310BF0
ov11_02310BF0: ; 0x02310BF0
	ldr ip, _02310BFC ; =ov11_0230DB58
	ldr r0, _02310C00 ; =ov11_02323864
	bx ip
	.align 2, 0
_02310BFC: .word ov11_0230DB58
_02310C00: .word ov11_02323864
	arm_func_end ov11_02310BF0

	arm_func_start ov11_02310C04
ov11_02310C04: ; 0x02310C04
	ldr ip, _02310C10 ; =ov11_0230DB58
	ldr r0, _02310C14 ; =ov11_0232385C
	bx ip
	.align 2, 0
_02310C10: .word ov11_0230DB58
_02310C14: .word ov11_0232385C
	arm_func_end ov11_02310C04

	arm_func_start ov11_02310C18
ov11_02310C18: ; 0x02310C18
	ldr ip, _02310C24 ; =ov11_0230DB58
	ldr r0, _02310C28 ; =ov11_02323894
	bx ip
	.align 2, 0
_02310C24: .word ov11_0230DB58
_02310C28: .word ov11_02323894
	arm_func_end ov11_02310C18

	arm_func_start ov11_02310C2C
ov11_02310C2C: ; 0x02310C2C
	ldr ip, _02310C38 ; =ov11_0230DB58
	ldr r0, _02310C3C ; =ov11_023238B0
	bx ip
	.align 2, 0
_02310C38: .word ov11_0230DB58
_02310C3C: .word ov11_023238B0
	arm_func_end ov11_02310C2C

	arm_func_start ov11_02310C40
ov11_02310C40: ; 0x02310C40
	ldr ip, _02310C4C ; =ov11_0230D270
	ldr r0, _02310C50 ; =ov11_023238DC
	bx ip
	.align 2, 0
_02310C4C: .word ov11_0230D270
_02310C50: .word ov11_023238DC
	arm_func_end ov11_02310C40

	arm_func_start ov11_02310C54
ov11_02310C54: ; 0x02310C54
	stmdb sp!, {r3, lr}
	mov r0, #0x30
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02310CA0 ; =ov11_02324DF8
	mvn r3, #0
	str r0, [r1]
	strh r3, [r0]
	ldr r2, [r1]
	mov r0, #0
	strh r3, [r2, #0x2c]
	ldr r2, [r1]
	strh r3, [r2, #2]
	ldr r1, [r1]
	strh r3, [r1, #0x2e]
	bl ov11_02312844
	bl ov11_02310CD4
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310CA0: .word ov11_02324DF8
	arm_func_end ov11_02310C54

	arm_func_start ov11_02310CA4
ov11_02310CA4: ; 0x02310CA4
	stmdb sp!, {r3, lr}
	bl ov11_02310CD4
	bl ov11_02312894
	ldr r0, _02310CD0 ; =ov11_02324DF8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02310CD0 ; =ov11_02324DF8
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310CD0: .word ov11_02324DF8
	arm_func_end ov11_02310CA4

	arm_func_start ov11_02310CD4
ov11_02310CD4: ; 0x02310CD4
	stmdb sp!, {r3, lr}
	ldr r0, _02310D40 ; =ov11_02324DF8
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1, #4]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02310D40 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _02310D40 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02310D40 ; =ov11_02324DF8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310D40: .word ov11_02324DF8
	arm_func_end ov11_02310CD4

	arm_func_start ov11_02310D44
ov11_02310D44: ; 0x02310D44
	ldr r0, _02310D60 ; =ov11_02324DF8
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02310D60: .word ov11_02324DF8
	arm_func_end ov11_02310D44

	arm_func_start ov11_02310D64
ov11_02310D64: ; 0x02310D64
	stmdb sp!, {r3, lr}
	ldr r1, _02310D9C ; =ov11_02324DF8
	ldr r1, [r1, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #1
	cmpne r0, #3
	bne _02310D94
	mov r0, r1
	bl ov11_022EE60C
	ldmia sp!, {r3, pc}
_02310D94:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310D9C: .word ov11_02324DF8
	arm_func_end ov11_02310D64

	arm_func_start ov11_02310DA0
ov11_02310DA0: ; 0x02310DA0
	ldr r2, _02310DB8 ; =ov11_02324DF8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02310DBC ; =ov11_022F03F8
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_02310DB8: .word ov11_02324DF8
_02310DBC: .word ov11_022F03F8
	arm_func_end ov11_02310DA0

	arm_func_start ov11_02310DC0
ov11_02310DC0: ; 0x02310DC0
	ldr r2, _02310DD8 ; =ov11_02324DF8
	mov r1, r0
	ldr r0, [r2]
	ldr ip, _02310DDC ; =ov11_022F040C
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_02310DD8: .word ov11_02324DF8
_02310DDC: .word ov11_022F040C
	arm_func_end ov11_02310DC0

	arm_func_start ov11_02310DE0
ov11_02310DE0: ; 0x02310DE0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02310EC0 ; =ov11_02324DF8
	mov r6, r0
	ldr r0, [r2, #4]
	mov r5, r1
	cmp r0, #0
	ldrne r2, [r2]
	mvnne r1, #0
	ldrnesh r4, [r2]
	cmpne r4, r1
	beq _02310EB8
	mov r1, r6
	mov r2, r5
	bl ov11_022EF498
	ldr r1, [r6]
	mov r0, #0xc
	add r1, r1, #0x8000
	str r1, [r6]
	ldr r2, [r6, #4]
	smulbb r1, r4, r0
	add r0, r2, #0x6000
	str r0, [r6, #4]
	ldr r2, [r5]
	ldr r0, _02310EC4 ; =EVENTS
	sub r2, r2, #0x8000
	str r2, [r5]
	ldr r2, [r5, #4]
	ldrsh r0, [r0, r1]
	sub r1, r2, #0x6000
	str r1, [r5, #4]
	cmp r0, #0xa
	bne _02310E90
	ldr r0, [r6]
	add r0, r0, #0x1800
	str r0, [r6]
	ldr r0, [r6, #4]
	add r0, r0, #0x1800
	str r0, [r6, #4]
	ldr r0, [r5]
	sub r0, r0, #0x1800
	str r0, [r5]
	ldr r0, [r5, #4]
	sub r0, r0, #0x1800
	str r0, [r5, #4]
_02310E90:
	ldr r1, [r6]
	ldr r0, [r5]
	cmp r1, r0
	strgt r1, [r5]
	ldr r1, [r6, #4]
	ldr r0, [r5, #4]
	cmp r1, r0
	strgt r1, [r5, #4]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02310EB8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02310EC0: .word ov11_02324DF8
_02310EC4: .word EVENTS
	arm_func_end ov11_02310DE0

	arm_func_start ov11_02310EC8
ov11_02310EC8: ; 0x02310EC8
	ldr r0, _02310EE4 ; =ov11_02324DF8
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02310EE4: .word ov11_02324DF8
	arm_func_end ov11_02310EC8

	arm_func_start ov11_02310EE8
ov11_02310EE8: ; 0x02310EE8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02310F08
	cmp r0, #1
	beq _02310F24
	cmp r0, #2
	beq _02310F40
	ldmia sp!, {r3, pc}
_02310F08:
	ldr r0, _02310FBC ; =ov11_02324DF8
	mov r2, #1
	ldr r3, [r0]
	strh r1, [r3, #0x2c]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	ldmia sp!, {r3, pc}
_02310F24:
	ldr r0, _02310FBC ; =ov11_02324DF8
	mov r2, #1
	ldr r3, [r0]
	strh r1, [r3, #0x2e]
	ldr r0, [r0]
	strb r2, [r0, #0xc]
	ldmia sp!, {r3, pc}
_02310F40:
	cmp r1, #1
	beq _02310F5C
	cmp r1, #2
	beq _02310F7C
	cmp r1, #3
	beq _02310F9C
	ldmia sp!, {r3, pc}
_02310F5C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02310F7C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02310F9C:
	ldr r0, _02310FBC ; =ov11_02324DF8
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02310FBC: .word ov11_02324DF8
	arm_func_end ov11_02310EE8

	arm_func_start ov11_02310FC0
ov11_02310FC0: ; 0x02310FC0
	stmdb sp!, {r3, lr}
	ldr r0, _02311070 ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r0, [r2, #8]
	cmp r0, #1
	cmpne r0, #4
	bne _02311068
	ldrsh r0, [r2, #0x2c]
	mvn ip, #0
	cmp r0, ip
	beq _02311028
	mov r1, #1
	ldr r0, _02311070 ; =ov11_02324DF8
	strb r1, [r2, #0xc]
	ldr r3, [r0]
	mov r2, #2
	ldrsh r1, [r3, #0x2c]
	strh r1, [r3]
	ldr r1, [r0]
	strh ip, [r1, #0x2c]
	ldr r1, [r0]
	str r2, [r1, #8]
	ldr r0, [r0]
	ldrsh r0, [r0]
	bl ov11_022F4734
	b _02311068
_02311028:
	ldrsh r0, [r2, #0x2e]
	cmp r0, ip
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _02311068
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, _02311070 ; =ov11_02324DF8
	mov r1, #3
	ldr r3, [r0]
	ldrsh r2, [r3, #0x2e]
	strh r2, [r3, #2]
	ldr r2, [r0]
	strh ip, [r2, #0x2e]
	ldr r0, [r0]
	str r1, [r0, #8]
_02311068:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311070: .word ov11_02324DF8
	arm_func_end ov11_02310FC0

	arm_func_start ov11_02311074
ov11_02311074: ; 0x02311074
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _0231126C ; =ov11_02324DF8
	ldr r2, [r1]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _0231122C
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1]
	ldr r1, _02311270 ; =ov11_02323974
	ldrsh r5, [r2]
	mov r2, r5
	bl Debug_Print
	bl ov11_02310CD4
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _0231126C ; =ov11_02324DF8
	mvn r1, #0
	str r0, [r2, #4]
	ldr r0, [r2]
	cmp r5, r1
	strh r5, [r0]
	bne _0231110C
	ldr r0, [r2, #4]
	ldr r1, _02311274 ; =ov11_02323920
	bl GroundBg_Init
	ldr r0, _0231126C ; =ov11_02324DF8
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _0231120C
_0231110C:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _02311278 ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _023111BC
_02311130: ; jump table
	b _02311194 ; case 0
	b _023111BC ; case 1
	b _023111BC ; case 2
	b _023111BC ; case 3
	b _023111BC ; case 4
	b _023111BC ; case 5
	b _02311164 ; case 6
	b _02311164 ; case 7
	b _02311164 ; case 8
	b _02311164 ; case 9
	b _02311164 ; case 10
	b _0231117C ; case 11
	b _0231117C ; case 12
_02311164:
	ldr r0, [r2, #4]
	ldr r1, _0231127C ; =ov11_0232393C
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	b _023111D4
_0231117C:
	ldr r0, [r2, #4]
	ldr r1, _02311280 ; =ov11_02323958
	bl GroundBg_Init
	mov r0, #1
	bl ov11_023128C0
	b _023111D4
_02311194:
	ldr r0, _02311284 ; =ov11_023238CC
	ldrsh r3, [r4]
	ldr ip, [r0, #0xc]
	ldr lr, [r0, #8]
	ldr r1, _02311288 ; =ov11_02323998
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_023111BC:
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r1, _02311274 ; =ov11_02323920
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_023128C0
_023111D4:
	ldr r0, _0231126C ; =ov11_02324DF8
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _0231126C ; =ov11_02324DF8
	ldr r2, _0231128C ; =ov11_023238CC
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_0231120C:
	ldr r0, _0231126C ; =ov11_02324DF8
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0]
	strb r1, [r0, #0xc]
	b _02311264
_0231122C:
	cmp r0, #3
	bne _02311264
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r0, [r1]
	ldrsh r0, [r0, #2]
	bl ov11_0231297C
	ldr r0, _0231126C ; =ov11_02324DF8
	mov r3, #4
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0]
	strb r1, [r0, #0xc]
_02311264:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231126C: .word ov11_02324DF8
_02311270: .word ov11_02323974
_02311274: .word ov11_02323920
_02311278: .word EVENTS
_0231127C: .word ov11_0232393C
_02311280: .word ov11_02323958
_02311284: .word ov11_023238CC
_02311288: .word ov11_02323998
_0231128C: .word ov11_023238CC
	arm_func_end ov11_02311074

	arm_func_start ov11_02311290
ov11_02311290: ; 0x02311290
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02311328 ; =ov11_02324DF8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	cmp r0, #4
	bne _02311318
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _02311328 ; =ov11_02324DF8
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023112FC
	ldr r0, _02311328 ; =ov11_02324DF8
	add r2, sp, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
_023112FC:
	ldr r0, _02311328 ; =ov11_02324DF8
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311328 ; =ov11_02324DF8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #4]
_02311318:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311328: .word ov11_02324DF8
	arm_func_end ov11_02311290

	arm_func_start ov11_0231132C
ov11_0231132C: ; 0x0231132C
	stmdb sp!, {r3, lr}
	ldr r0, _02311368 ; =ov11_02324DF8
	ldr r1, [r0]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311360
	bl ov11_022EFB70
	ldr r0, _02311368 ; =ov11_02324DF8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #4]
_02311360:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311368: .word ov11_02324DF8
	arm_func_end ov11_0231132C

	arm_func_start ov11_0231136C
ov11_0231136C: ; 0x0231136C
	ldr ip, _02311378 ; =ov11_0230D270
	ldr r0, _0231137C ; =ov11_023239C4
	bx ip
	.align 2, 0
_02311378: .word ov11_0230D270
_0231137C: .word ov11_023239C4
	arm_func_end ov11_0231136C

	arm_func_start ov11_02311380
ov11_02311380: ; 0x02311380
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023113B4 ; =ov11_02324E00
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #0x28]
	mov r0, r2
	bl ov11_02312844
	bl ov11_023113E8
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023113B4: .word ov11_02324E00
	arm_func_end ov11_02311380

	arm_func_start ov11_023113B8
ov11_023113B8: ; 0x023113B8
	stmdb sp!, {r3, lr}
	bl ov11_023113E8
	bl ov11_02312894
	ldr r0, _023113E4 ; =ov11_02324E00
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023113E4 ; =ov11_02324E00
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023113E4: .word ov11_02324E00
	arm_func_end ov11_023113B8

	arm_func_start ov11_023113E8
ov11_023113E8: ; 0x023113E8
	stmdb sp!, {r3, lr}
	ldr r0, _02311458 ; =ov11_02324E00
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #8]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	mov r1, #5
	bl ov11_022EB0C0
	ldr r0, _02311458 ; =ov11_02324E00
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _02311458 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311458 ; =ov11_02324E00
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311458: .word ov11_02324E00
	arm_func_end ov11_023113E8

	arm_func_start ov11_0231145C
ov11_0231145C: ; 0x0231145C
	ldr r0, _02311478 ; =ov11_02324E00
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02311478: .word ov11_02324E00
	arm_func_end ov11_0231145C

	arm_func_start ov11_0231147C
ov11_0231147C: ; 0x0231147C
	stmdb sp!, {r3, lr}
	ldr r1, _02311528 ; =ov11_02324E00
	ldr r2, [r1, #4]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0231149C: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _023114B4 ; case 1
	b _023114D0 ; case 2
	b _023114EC ; case 3
	b _02311508 ; case 4
	b _02311518 ; case 5
_023114B4:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023114D0:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023114EC:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r2
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02311508:
	mov r0, r2
	mov r1, #1
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_02311518:
	mov r0, r2
	mov r1, #0
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311528: .word ov11_02324E00
	arm_func_end ov11_0231147C

	arm_func_start ov11_0231152C
ov11_0231152C: ; 0x0231152C
	ldr r0, _02311548 ; =ov11_02324E00
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	bx lr
	.align 2, 0
_02311548: .word ov11_02324E00
	arm_func_end ov11_0231152C

	arm_func_start ov11_0231154C
ov11_0231154C: ; 0x0231154C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02311564
	cmp r0, #1
	beq _02311580
	ldmia sp!, {r3, pc}
_02311564:
	ldr r0, _0231158C ; =ov11_02324E00
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	strb r2, [r0, #8]
	ldmia sp!, {r3, pc}
_02311580:
	and r0, r1, #0xff
	bl ov11_0231147C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231158C: .word ov11_02324E00
	arm_func_end ov11_0231154C

	arm_func_start ov11_02311590
ov11_02311590: ; 0x02311590
	stmdb sp!, {r3, lr}
	ldr r0, _023115F0 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #1
	cmpne r0, #3
	bne _023115E8
	ldrb r0, [r2, #0x28]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r2, #8]
	beq _023115E8
	ldr r0, _023115F0 ; =ov11_02324E00
	mov r1, #1
	strb r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	bl ov11_022F47BC
_023115E8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023115F0: .word ov11_02324E00
	arm_func_end ov11_02311590

	arm_func_start ov11_023115F4
ov11_023115F4: ; 0x023115F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _0231179C
	mov r0, #1
	strb r0, [r1, #8]
	bl ov11_022F1798
	mov r4, r0
	ldr r1, _023117A8 ; =ov11_02323A58
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	bl ov11_023113E8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _023117A4 ; =ov11_02324E00
	mvn r1, #0
	str r0, [r2, #4]
	cmp r4, r1
	bne _02311684
	ldr r1, _023117AC ; =ov11_02323A04
	bl GroundBg_Init
	ldr r0, _023117A4 ; =ov11_02324E00
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _02311780
_02311684:
	bl ov11_022F17B4
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02311730
_02311698: ; jump table
	b _0231170C ; case 0
	b _02311730 ; case 1
	b _02311730 ; case 2
	b _02311730 ; case 3
	b _02311730 ; case 4
	b _02311730 ; case 5
	b _023116CC ; case 6
	b _023116CC ; case 7
	b _023116CC ; case 8
	b _023116CC ; case 9
	b _023116CC ; case 10
	b _023116E8 ; case 11
	b _023116E8 ; case 12
_023116CC:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117B0 ; =ov11_02323A20
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	b _02311750
_023116E8:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117B4 ; =ov11_02323A3C
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
	b _02311750
_0231170C:
	ldr r1, _023117B8 ; =ov11_023239B4
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _023117BC ; =ov11_02323A7C
	mov r2, r4
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_02311730:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r1, _023117AC ; =ov11_02323A04
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
_02311750:
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl ov11_022F17E8
	ldr r0, _023117A4 ; =ov11_02324E00
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_022F1EEC
_02311780:
	ldr r0, _023117A4 ; =ov11_02324E00
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
_0231179C:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_023117A4: .word ov11_02324E00
_023117A8: .word ov11_02323A58
_023117AC: .word ov11_02323A04
_023117B0: .word ov11_02323A20
_023117B4: .word ov11_02323A3C
_023117B8: .word ov11_023239B4
_023117BC: .word ov11_02323A7C
	arm_func_end ov11_023115F4

	arm_func_start ov11_023117C0
ov11_023117C0: ; 0x023117C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02311824 ; =ov11_02324E00
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02311818
	ldr r0, _02311828 ; =ov11_023239B4
	add r1, sp, #0
	ldr r3, [r0, #4]
	ldr r0, [r0]
	str r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r2, #4]
	bl ov11_022F1E90
	ldr r0, _02311824 ; =ov11_02324E00
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311824 ; =ov11_02324E00
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02311818:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311824: .word ov11_02324E00
_02311828: .word ov11_023239B4
	arm_func_end ov11_023117C0

	arm_func_start ov11_0231182C
ov11_0231182C: ; 0x0231182C
	stmdb sp!, {r3, lr}
	ldr r0, _02311868 ; =ov11_02324E00
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311860
	bl ov11_022EFB70
	ldr r0, _02311868 ; =ov11_02324E00
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
_02311860:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311868: .word ov11_02324E00
	arm_func_end ov11_0231182C

	arm_func_start ov11_0231186C
ov11_0231186C: ; 0x0231186C
	ldr ip, _02311878 ; =ov11_0230D270
	ldr r0, _0231187C ; =ov11_02323AA8
	bx ip
	.align 2, 0
_02311878: .word ov11_0230D270
_0231187C: .word ov11_02323AA8
	arm_func_end ov11_0231186C

	arm_func_start ov11_02311880
ov11_02311880: ; 0x02311880
	stmdb sp!, {r3, lr}
	mov r0, #0x2c
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023118B4 ; =ov11_02324E08
	mov r2, #0
	str r0, [r1]
	strb r2, [r0, #0x28]
	mov r0, r2
	bl ov11_02312844
	bl ov11_023118E8
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023118B4: .word ov11_02324E08
	arm_func_end ov11_02311880

	arm_func_start ov11_023118B8
ov11_023118B8: ; 0x023118B8
	stmdb sp!, {r3, lr}
	bl ov11_023118E8
	bl ov11_02312894
	ldr r0, _023118E4 ; =ov11_02324E08
	ldr r0, [r0]
	bl MemFree
	ldr r0, _023118E4 ; =ov11_02324E08
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_023118E4: .word ov11_02324E08
	arm_func_end ov11_023118B8

	arm_func_start ov11_023118E8
ov11_023118E8: ; 0x023118E8
	stmdb sp!, {r3, lr}
	ldr r0, _02311958 ; =ov11_02324E08
	mov r3, #0
	ldr r1, [r0]
	mov r2, #1
	strb r3, [r1]
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	strb r2, [r0, #8]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	mov r1, #5
	bl ov11_022EB0C0
	ldr r0, _02311958 ; =ov11_02324E08
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _02311958 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311958 ; =ov11_02324E08
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311958: .word ov11_02324E08
	arm_func_end ov11_023118E8

	arm_func_start ov11_0231195C
ov11_0231195C: ; 0x0231195C
	ldr r0, _02311978 ; =ov11_02324E08
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02311978: .word ov11_02324E08
	arm_func_end ov11_0231195C

	arm_func_start ov11_0231197C
ov11_0231197C: ; 0x0231197C
	stmdb sp!, {r3, lr}
	ldr r1, _02311A28 ; =ov11_02324E08
	ldr r2, [r1, #4]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_0231199C: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _023119B4 ; case 1
	b _023119D0 ; case 2
	b _023119EC ; case 3
	b _02311A08 ; case 4
	b _02311A18 ; case 5
_023119B4:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023119D0:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #1
	mov r0, r2
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_023119EC:
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r2
	mov r1, #0
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_02311A08:
	mov r0, r2
	mov r1, #1
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_02311A18:
	mov r0, r2
	mov r1, #0
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311A28: .word ov11_02324E08
	arm_func_end ov11_0231197C

	arm_func_start ov11_02311A2C
ov11_02311A2C: ; 0x02311A2C
	ldr r0, _02311A48 ; =ov11_02324E08
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #8]
	bx lr
	.align 2, 0
_02311A48: .word ov11_02324E08
	arm_func_end ov11_02311A2C

	arm_func_start ov11_02311A4C
ov11_02311A4C: ; 0x02311A4C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _02311A64
	cmp r0, #1
	beq _02311A80
	ldmia sp!, {r3, pc}
_02311A64:
	ldr r0, _02311A8C ; =ov11_02324E08
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	strb r2, [r0, #8]
	ldmia sp!, {r3, pc}
_02311A80:
	and r0, r1, #0xff
	bl ov11_0231197C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311A8C: .word ov11_02324E08
	arm_func_end ov11_02311A4C

	arm_func_start ov11_02311A90
ov11_02311A90: ; 0x02311A90
	stmdb sp!, {r3, lr}
	ldr r0, _02311AF0 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r0, [r2, #4]
	cmp r0, #1
	cmpne r0, #3
	bne _02311AE8
	ldrb r0, [r2, #0x28]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r2, #8]
	beq _02311AE8
	ldr r0, _02311AF0 ; =ov11_02324E08
	mov r1, #1
	strb r1, [r2, #8]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0x28]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	bl ov11_022F47BC
_02311AE8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311AF0: .word ov11_02324E08
	arm_func_end ov11_02311A90

	arm_func_start ov11_02311AF4
ov11_02311AF4: ; 0x02311AF4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _02311C9C
	mov r0, #1
	strb r0, [r1, #8]
	bl ov11_022F1798
	mov r4, r0
	ldr r1, _02311CA8 ; =ov11_02323B3C
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	bl ov11_023118E8
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02311CA4 ; =ov11_02324E08
	mvn r1, #0
	str r0, [r2, #4]
	cmp r4, r1
	bne _02311B84
	ldr r1, _02311CAC ; =ov11_02323AE8
	bl GroundBg_Init
	ldr r0, _02311CA4 ; =ov11_02324E08
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _02311C80
_02311B84:
	bl ov11_022F17B4
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _02311C30
_02311B98: ; jump table
	b _02311C0C ; case 0
	b _02311C30 ; case 1
	b _02311C30 ; case 2
	b _02311C30 ; case 3
	b _02311C30 ; case 4
	b _02311C30 ; case 5
	b _02311BCC ; case 6
	b _02311BCC ; case 7
	b _02311BCC ; case 8
	b _02311BCC ; case 9
	b _02311BCC ; case 10
	b _02311BE8 ; case 11
	b _02311BE8 ; case 12
_02311BCC:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CB0 ; =ov11_02323B04
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	b _02311C50
_02311BE8:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CB4 ; =ov11_02323B20
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
	b _02311C50
_02311C0C:
	ldr r1, _02311CB8 ; =ov11_02323A98
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _02311CBC ; =ov11_02323B60
	mov r2, r4
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_02311C30:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r1, _02311CAC ; =ov11_02323AE8
	ldr r0, [r0, #4]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_023128C0
_02311C50:
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl ov11_022F17E8
	ldr r0, _02311CA4 ; =ov11_02324E08
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov11_022F1EEC
_02311C80:
	ldr r0, _02311CA4 ; =ov11_02324E08
	mov r3, #3
	ldr r2, [r0]
	mov r1, #0
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #8]
_02311C9C:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02311CA4: .word ov11_02324E08
_02311CA8: .word ov11_02323B3C
_02311CAC: .word ov11_02323AE8
_02311CB0: .word ov11_02323B04
_02311CB4: .word ov11_02323B20
_02311CB8: .word ov11_02323A98
_02311CBC: .word ov11_02323B60
	arm_func_end ov11_02311AF4

	arm_func_start ov11_02311CC0
ov11_02311CC0: ; 0x02311CC0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _02311D24 ; =ov11_02324E08
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02311D18
	ldr r0, _02311D28 ; =ov11_02323A98
	add r1, sp, #0
	ldr r3, [r0, #4]
	ldr r0, [r0]
	str r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r2, #4]
	bl ov11_022F1E90
	ldr r0, _02311D24 ; =ov11_02324E08
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _02311D24 ; =ov11_02324E08
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0]
_02311D18:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311D24: .word ov11_02324E08
_02311D28: .word ov11_02323A98
	arm_func_end ov11_02311CC0

	arm_func_start ov11_02311D2C
ov11_02311D2C: ; 0x02311D2C
	stmdb sp!, {r3, lr}
	ldr r0, _02311D68 ; =ov11_02324E08
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	beq _02311D60
	bl ov11_022EFB70
	ldr r0, _02311D68 ; =ov11_02324E08
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0]
_02311D60:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311D68: .word ov11_02324E08
	arm_func_end ov11_02311D2C

	arm_func_start ov11_02311D6C
ov11_02311D6C: ; 0x02311D6C
	ldr ip, _02311D78 ; =ov11_0230D270
	ldr r0, _02311D7C ; =ov11_02323B98
	bx ip
	.align 2, 0
_02311D78: .word ov11_0230D270
_02311D7C: .word ov11_02323B98
	arm_func_end ov11_02311D6C

	arm_func_start ov11_02311D80
ov11_02311D80: ; 0x02311D80
	stmdb sp!, {r4, lr}
	mov r0, #0x30
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02311E28 ; =ov11_02324E10
	str r0, [r1, #4]
	bl ov11_02311EA4
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r0, _02311E28 ; =ov11_02324E10
	mov r3, #1
	ldr r1, [r0, #4]
	mov r2, #0
	strb r3, [r1, #0xa]
	ldr r1, [r0, #4]
	strb r3, [r1, #0xb]
	ldr r1, [r0, #4]
	strb r2, [r1, #0xc]
	ldr r1, [r0, #4]
	str r3, [r1, #4]
	ldr r0, [r0, #4]
	strb r2, [r0, #8]
	bl ov11_022E8168
	movs r4, r0
	beq _02311E20
	ldr ip, _02311E28 ; =ov11_02324E10
	ldmia r4!, {r0, r1, r2, r3}
	ldr ip, [ip, #4]
	add lr, ip, #0x10
	mov ip, lr
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r0, ip
	mov r1, #0
	bl CreateJobSummary
	ldr r0, _02311E28 ; =ov11_02324E10
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #8]
_02311E20:
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_02311E28: .word ov11_02324E10
	arm_func_end ov11_02311D80

	arm_func_start ov11_02311E2C
ov11_02311E2C: ; 0x02311E2C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _02311E58
	ldr r0, _02311EA0 ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xc]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_02311E58:
	bl ov11_02311EA4
	ldr r0, _02311EA0 ; =ov11_02324E10
	mov r2, #7
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02311E80
	bl sub_02069904
_02311E80:
	ldr r0, _02311EA0 ; =ov11_02324E10
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02311EA0 ; =ov11_02324E10
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311EA0: .word ov11_02324E10
	arm_func_end ov11_02311E2C

	arm_func_start ov11_02311EA4
ov11_02311EA4: ; 0x02311EA4
	stmdb sp!, {r3, lr}
	ldr r1, _02311F1C ; =ov11_02324E10
	mov r3, #1
	ldr r0, [r1, #4]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1, #4]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1, #4]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02311F1C ; =ov11_02324E10
	ldr r0, [r0]
	cmp r0, #0
	beq _02311F08
	bl GroundBg_FreeAll
	ldr r0, _02311F1C ; =ov11_02324E10
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02311F1C ; =ov11_02324E10
	mov r1, #0
	str r1, [r0]
_02311F08:
	ldr r0, _02311F1C ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0xb]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02311F1C: .word ov11_02324E10
	arm_func_end ov11_02311EA4

	arm_func_start ov11_02311F20
ov11_02311F20: ; 0x02311F20
	ldr r0, _02311F3C ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_02311F3C: .word ov11_02324E10
	arm_func_end ov11_02311F20

	arm_func_start ov11_02311F40
ov11_02311F40: ; 0x02311F40
	bx lr
	arm_func_end ov11_02311F40

	arm_func_start ov11_02311F44
ov11_02311F44: ; 0x02311F44
	stmdb sp!, {r3, lr}
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _023120F4
_02311F60: ; jump table
	b _02311F80 ; case 0
	b _02311FA8 ; case 1
	b _023120F4 ; case 2
	b _023120F4 ; case 3
	b _02312038 ; case 4
	b _02312064 ; case 5
	b _023120A8 ; case 6
	b _023120E4 ; case 7
_02311F80:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	mov r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02311FA8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0xc]
	cmp r1, #0
	beq _02312000
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _023120FC ; =ov11_02324E10
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	b _023120F4
_02312000:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _023120F4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0, #4]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0, #4]
	mov r1, #2
	str r1, [r0, #4]
	b _023120F4
_02312038:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _023120FC ; =ov11_02324E10
	movne r1, #1
	ldrne r0, [r0, #4]
	strneb r1, [r0, #9]
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #5
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_02312064:
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r1, #9]
	beq _023120F4
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _023120FC ; =ov11_02324E10
	mov r3, #0
	ldr r2, [r0, #4]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
	b _023120F4
_023120A8:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _023120F4
	ldr r0, _023120FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _023120D4
	mov r0, #0
	strb r0, [r1, #8]
	bl sub_02069904
_023120D4:
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #7
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_023120E4:
	ldr r0, _023120FC ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #9]
_023120F4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023120FC: .word ov11_02324E10
	arm_func_end ov11_02311F44

	arm_func_start ov11_02312100
ov11_02312100: ; 0x02312100
	stmdb sp!, {r3, lr}
	ldr r0, _02312164 ; =ov11_02324E10
	ldr r3, [r0, #4]
	ldr r0, [r3, #4]
	cmp r0, #2
	ldmneia sp!, {r3, pc}
	mov r2, #1
	mov r0, #0x2f4
	mov r1, #0xf
	strb r2, [r3, #9]
	bl MemAlloc
	ldr r2, _02312164 ; =ov11_02324E10
	ldr r1, _02312168 ; =ov11_02323B7C
	str r0, [r2]
	bl GroundBg_Init
	ldr r0, _02312164 ; =ov11_02324E10
	ldr r1, _0231216C ; =ov11_02323BBC
	ldr r0, [r0]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _02312164 ; =ov11_02324E10
	mov r1, #3
	ldr r0, [r0, #4]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312164: .word ov11_02324E10
_02312168: .word ov11_02323B7C
_0231216C: .word ov11_02323BBC
	arm_func_end ov11_02312100

	arm_func_start ov11_02312170
ov11_02312170: ; 0x02312170
	stmdb sp!, {r3, lr}
	ldr r0, _023121FC ; =ov11_02324E10
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	cmp r1, #3
	bne _023121C4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r0, [r0]
	bl ov11_022EF70C
	mov r0, #0x10
	bl ov11_022E9C98
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _023121FC ; =ov11_02324E10
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0, #4]
	str r1, [r0, #4]
_023121C4:
	ldr r0, _023121FC ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _023121E4
	sub r0, r0, #4
	cmp r0, #2
	bhi _023121F4
_023121E4:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _023121F4
	bl sub_020698B8
_023121F4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023121FC: .word ov11_02324E10
	arm_func_end ov11_02312170

	arm_func_start ov11_02312200
ov11_02312200: ; 0x02312200
	stmdb sp!, {r3, lr}
	ldr r0, _0231224C ; =ov11_02324E10
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #1
	mov r1, #2
	bl sub_02008F64
	ldr r0, _0231224C ; =ov11_02324E10
	ldr r0, [r0]
	bl ov11_022EFB70
	ldr r0, _0231224C ; =ov11_02324E10
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231224C: .word ov11_02324E10
	arm_func_end ov11_02312200

	arm_func_start ov11_02312250
ov11_02312250: ; 0x02312250
	ldr ip, _0231225C ; =ov11_0230D270
	ldr r0, _02312260 ; =ov11_02323BF8
	bx ip
	.align 2, 0
_0231225C: .word ov11_0230D270
_02312260: .word ov11_02323BF8
	arm_func_end ov11_02312250

	arm_func_start ov11_02312264
ov11_02312264: ; 0x02312264
	stmdb sp!, {r3, lr}
#ifdef JAPAN
	mov r0, #0xf4
#else
	mov r0, #0x1b8
#endif
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _0231233C ; =ov11_02324E18
#if defined(EUROPE)
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	bl GetLanguage
	mov r2, r0, lsl #1
	ldr r0, _02312D14 ; =0x0232473C
	ldr ip, _02312D18 ; =0x00000115
	ldr r1, _0231233C ; =ov11_02324E18
	ldrsh r2, [r0, r2]
	ldr r0, [r1, #4]
	rsb r3, ip, #0x114
	strh r2, [r0, #0x2c]
	ldr r2, [r1, #4]
	mov r0, #0
	strh ip, [r2, #0x2c]
	ldr r2, [r1, #4]
#elif defined(JAPAN)
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	mov r0, #0
	mov r1, #0x46
	bl LoadScriptVariableValue
	cmp r0, #1
	ldreq r0, _0231233C ; =ov11_02324E18
	ldreq r1, _023138CC ; =0x00000116
	ldrne r0, _0231233C ; =ov11_02324E18
	ldrne r1, _023138D0_JP ; =0x00000115
	ldr r0, [r0, #4]
	mvn r3, #0
	strh r1, [r0, #0x2c]
	ldr r1, _0231233C ; =ov11_02324E18
	mov r0, #0
	ldr r2, [r1, #4]
#else
	mvn r3, #0
	str r0, [r1, #4]
	strh r3, [r0]
	ldr r0, [r1, #4]
	rsb r2, r3, #0x114
	strh r2, [r0, #0x2c]
	ldr r2, [r1, #4]
	mov r0, #0
#endif
	strh r3, [r2, #2]
	ldr r1, [r1, #4]
	strh r3, [r1, #0x2e]
	bl ov11_02312844
#ifdef EUROPE
	bl GetLanguage
	ldr r1, _0231233C ; =0x02325958
	mov r2, r0, lsl #1
	ldr r0, [r1, #4]
	ldr r1, _02312D1C ; =0x02324728
	add r0, r0, #0x30
	ldrsh r1, [r1, r2]
	ldr r2, _02312340 ; =0xA0080000
#else
	ldr r0, _0231233C ; =ov11_02324E18
	ldr r2, _02312340 ; =0xA0080000
	ldr r0, [r0, #4]
	mov r1, #0xa7
	add r0, r0, #0x30
#endif
	bl LoadObjectAnimData
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #8
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	bl ov11_022F4974
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x30
	bl SetAnimDataFields2
#ifndef JAPAN
#ifdef EUROPE
	bl GetLanguage
	mov r2, r0, lsl #1
#endif
	ldr r0, _0231233C ; =ov11_02324E18
	ldr r1, _02312344 ; =0x00000179
	ldr r0, [r0, #4]
#ifdef EUROPE
	ldrsh r1, [r1, r2]
#endif
	ldr r2, _02312340 ; =0xA0080000
	add r0, r0, #0xf4
	bl LoadObjectAnimData
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0xa
	ldr r0, [r0, #4]
	add r0, r0, #0xf4
	bl ov11_022F4974
	ldr r0, _0231233C ; =ov11_02324E18
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xf4
	bl SetAnimDataFields2
#endif
	bl ov11_02312398
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231233C: .word ov11_02324E18
#if defined(EUROPE)
_02312D14: .word 0x0232473C
_02312D18: .word 0x00000115
_02312D1C: .word 0x02324728
_02312340: .word 0xA0080000
_02312344: .word 0x02324732
#elif defined(JAPAN)
_023138CC: .word 0x00000116
_023138D0_JP: .word 0x00000115
_02312340: .word 0xA0080000
#else
_02312340: .word 0xA0080000
_02312344: .word 0x00000179
#endif
	arm_func_end ov11_02312264

	arm_func_start ov11_02312348
ov11_02312348: ; 0x02312348
	stmdb sp!, {r3, lr}
	bl ov11_02312398
	bl ov11_02312894
	ldr r0, _02312394 ; =ov11_02324E18
	ldr r0, [r0, #4]
	add r0, r0, #0x30
	bl ov11_022F6EFC
	ldr r0, _02312394 ; =ov11_02324E18
#ifndef JAPAN
	ldr r0, [r0, #4]
	add r0, r0, #0xf4
	bl ov11_022F6EFC
	ldr r0, _02312394 ; =ov11_02324E18
#endif
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02312394 ; =ov11_02324E18
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312394: .word ov11_02324E18
	arm_func_end ov11_02312348

	arm_func_start ov11_02312398
ov11_02312398: ; 0x02312398
	stmdb sp!, {r3, lr}
	ldr r0, _02312414 ; =ov11_02324E18
	mov r3, #0
	ldr r1, [r0, #4]
	mov r2, #1
	strb r3, [r1, #4]
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bl ov11_02312BF4
	mov r0, #0
	bl ov11_023128C0
	mov r0, #1
	bl ov11_022EAFF8
	mov r0, #1
	ldr r2, _02312418 ; =ov11_02323BE0
	mov r1, r0
	bl ov11_022EB0E4
	ldr r0, _02312414 ; =ov11_02324E18
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _02312414 ; =ov11_02324E18
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02312414 ; =ov11_02324E18
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312414: .word ov11_02324E18
#ifdef JAPAN
_02312418: .word ov11_02323BD8
#else
_02312418: .word ov11_02323BE0
#endif
	arm_func_end ov11_02312398

	arm_func_start ov11_0231241C
ov11_0231241C: ; 0x0231241C
	ldr r0, _02312438 ; =ov11_02324E18
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02312438: .word ov11_02324E18
	arm_func_end ov11_0231241C

	arm_func_start ov11_0231243C
ov11_0231243C: ; 0x0231243C
	cmp r0, #0
	beq _02312450
	cmp r0, #1
	beq _0231246C
	bx lr
_02312450:
	ldr r0, _02312488 ; =ov11_02324E18
	mov r2, #1
	ldr r3, [r0, #4]
	strh r1, [r3, #0x2c]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bx lr
_0231246C:
	ldr r0, _02312488 ; =ov11_02324E18
	mov r2, #1
	ldr r3, [r0, #4]
	strh r1, [r3, #0x2e]
	ldr r0, [r0, #4]
	strb r2, [r0, #0xc]
	bx lr
	.align 2, 0
_02312488: .word ov11_02324E18
	arm_func_end ov11_0231243C

	arm_func_start ov11_0231248C
ov11_0231248C: ; 0x0231248C
	stmdb sp!, {r3, lr}
	ldr r0, _0231253C ; =ov11_02324E18
	ldr r2, [r0, #4]
	ldr r0, [r2, #8]
	cmp r0, #1
	cmpne r0, #4
	bne _02312534
	ldrsh r0, [r2, #0x2c]
	mvn ip, #0
	cmp r0, ip
	beq _023124F4
	mov r1, #1
	ldr r0, _0231253C ; =ov11_02324E18
	strb r1, [r2, #0xc]
	ldr r3, [r0, #4]
	mov r2, #2
	ldrsh r1, [r3, #0x2c]
	strh r1, [r3]
	ldr r1, [r0, #4]
	strh ip, [r1, #0x2c]
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r0, [r0, #4]
	ldrsh r0, [r0]
	bl ov11_022F4734
	b _02312534
_023124F4:
	ldrsh r0, [r2, #0x2e]
	cmp r0, ip
	moveq r0, #0
	streqb r0, [r2, #0xc]
	beq _02312534
	mov r1, #1
	strb r1, [r2, #0xc]
	ldr r0, _0231253C ; =ov11_02324E18
	mov r1, #3
	ldr r3, [r0, #4]
	ldrsh r2, [r3, #0x2e]
	strh r2, [r3, #2]
	ldr r2, [r0, #4]
	strh ip, [r2, #0x2e]
	ldr r0, [r0, #4]
	str r1, [r0, #8]
_02312534:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0231253C: .word ov11_02324E18
	arm_func_end ov11_0231248C

	arm_func_start ov11_02312540
ov11_02312540: ; 0x02312540
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r1, _02312710 ; =ov11_02324E18
	ldr r2, [r1, #4]
	ldr r0, [r2, #8]
	cmp r0, #2
	bne _023126D0
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r2, [r1, #4]
	ldr r1, _02312714 ; =ov11_02323C8C
	ldrsh r5, [r2]
	mov r2, r5
	bl Debug_Print
	bl ov11_02312398
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02312710 ; =ov11_02324E18
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r5, r1
	strh r5, [r0]
	bne _023125D4
	ldr r0, [r2]
	ldr r1, _02312718 ; =ov11_02323C38
	bl GroundBg_Init
	ldr r0, _02312710 ; =ov11_02324E18
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312710 ; =ov11_02324E18
	ldmia r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	b _023126B0
_023125D4:
	mov r0, #0xc
	smulbb r1, r5, r0
	ldr r3, _0231271C ; =EVENTS
	ldrsh r0, [r3, r1]
	add r4, r3, r1
	add r0, r0, #1
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02312664
_023125F8: ; jump table
	b _0231263C ; case 0
	b _02312664 ; case 1
	b _02312664 ; case 2
	b _02312664 ; case 3
	b _02312664 ; case 4
	b _02312664 ; case 5
	b _02312624 ; case 6
	b _02312624 ; case 7
	b _02312624 ; case 8
	b _02312624 ; case 9
	b _02312624 ; case 10
_02312624:
	ldr r0, [r2]
	ldr r1, _02312720 ; =ov11_02323C54
	bl GroundBg_Init
	mov r0, #1
	bl ov11_022EF53C
	b _0231267C
_0231263C:
	ldr r0, _02312724 ; =ov11_02323BD0
	ldrsh r3, [r4]
#ifdef JAPAN
	ldr ip, [r0, #4]
	ldr lr, [r0]
#else
	ldr ip, [r0, #0x24]
	ldr lr, [r0, #0x20]
#endif
	ldr r1, _02312728 ; =ov11_02323CAC
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_02312664:
	ldr r0, _02312710 ; =ov11_02324E18
	ldr r1, _02312718 ; =ov11_02323C38
	ldr r0, [r0]
	bl GroundBg_Init
	mov r0, #1
	bl ov11_023128C0
_0231267C:
	ldr r0, _02312710 ; =ov11_02324E18
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312710 ; =ov11_02324E18
	ldmia r0, {r1, r2}
	add r0, r2, #0x10
	bl ov11_022EFD5C
	ldr r0, _02312710 ; =ov11_02324E18
	ldr r2, _0231272C ; =ov11_02323BD0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_023126B0:
	ldr r0, _02312710 ; =ov11_02324E18
	mov r3, #4
	ldr r2, [r0, #4]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
	b _02312708
_023126D0:
	cmp r0, #3
	bne _02312708
	mov r0, #1
	strb r0, [r2, #0xc]
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #2]
	bl ov11_0231297C
	ldr r0, _02312710 ; =ov11_02324E18
	mov r3, #4
	ldr r2, [r0, #4]
	mov r1, #0
	str r3, [r2, #8]
	ldr r0, [r0, #4]
	strb r1, [r0, #0xc]
_02312708:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02312710: .word ov11_02324E18
_02312714: .word ov11_02323C8C
_02312718: .word ov11_02323C38
_0231271C: .word EVENTS
_02312720: .word ov11_02323C54
_02312724: .word ov11_02323BD0
_02312728: .word ov11_02323CAC
#ifdef JAPAN
_0231272C: .word ov11_02323BE0
#else
_0231272C: .word ov11_02323BD0
#endif
	arm_func_end ov11_02312540

	arm_func_start ov11_02312730
ov11_02312730: ; 0x02312730
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r0, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #4
	bne _023127E8
	add r1, sp, #0
	mov r0, #1
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r1, _023127FC ; =ov11_02323BE8
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x30
	bl AnimRelatedFunction__022F6F14
	ldr r0, _023127F8 ; =ov11_02324E18
#ifndef JAPAN
	ldr r1, _02312800 ; =ov11_02323BD8
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xf4
	bl AnimRelatedFunction__022F6F14
	ldr r0, _023127F8 ; =ov11_02324E18
#endif
	add r1, sp, #0
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x10
	bl ov11_022F042C
	cmp r0, #0
	beq _023127CC
	ldr r0, _023127F8 ; =ov11_02324E18
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_023127CC:
	ldr r0, _023127F8 ; =ov11_02324E18
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _023127F8 ; =ov11_02324E18
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_023127E8:
	bl ov11_02312A74
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023127F8: .word ov11_02324E18
_023127FC: .word ov11_02323BE8
#ifndef JAPAN
_02312800: .word ov11_02323BD8
#endif
	arm_func_end ov11_02312730

	arm_func_start ov11_02312804
ov11_02312804: ; 0x02312804
	stmdb sp!, {r3, lr}
	ldr r0, _02312840 ; =ov11_02324E18
	ldr r1, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	beq _02312838
	bl ov11_022EFB70
	ldr r0, _02312840 ; =ov11_02324E18
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_02312838:
	bl ov11_02312B18
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312840: .word ov11_02324E18
	arm_func_end ov11_02312804

	arm_func_start ov11_02312844
ov11_02312844: ; 0x02312844
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x34
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _02312890 ; =ov11_02324E20
	mov ip, #0
	str r0, [r1, #4]
	strb ip, [r0, #4]
	ldr r2, [r1, #4]
	mov r0, r4
	strb ip, [r2, #3]
	ldr r3, [r1, #4]
	sub r2, ip, #1
	strb ip, [r3, #2]
	ldr r1, [r1, #4]
	strh r2, [r1]
	bl ov11_023128C0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02312890: .word ov11_02324E20
	arm_func_end ov11_02312844

	arm_func_start ov11_02312894
ov11_02312894: ; 0x02312894
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov11_023128C0
	ldr r0, _023128BC ; =ov11_02324E20
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _023128BC ; =ov11_02324E20
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023128BC: .word ov11_02324E20
	arm_func_end ov11_02312894

	arm_func_start ov11_023128C0
ov11_023128C0: ; 0x023128C0
	stmdb sp!, {r4, lr}
	ldr r1, _02312974 ; =ov11_02324E20
	mov r3, #0
	ldr r2, [r1, #4]
	mov r4, r0
	strb r3, [r2, #4]
	ldr r0, [r1, #4]
	sub r2, r3, #1
	strb r3, [r0, #3]
	ldr r0, [r1, #4]
	strb r4, [r0, #2]
	ldr r0, [r1, #4]
	strh r2, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _0231291C
	bl GroundBg_FreeAll
	ldr r0, _02312974 ; =ov11_02324E20
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02312974 ; =ov11_02324E20
	mov r1, #0
	str r1, [r0]
_0231291C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02312974 ; =ov11_02324E20
	ldr r1, _02312978 ; =ov11_02323CD0
	str r0, [r2]
	bl GroundBg_Init
	ldr r0, _02312974 ; =ov11_02324E20
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _02312974 ; =ov11_02324E20
	ldmia r0, {r1, r2}
	add r0, r2, #0x18
	bl ov11_022EFD5C
	ldr r0, _02312974 ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02312974: .word ov11_02324E20
_02312978: .word ov11_02323CD0
	arm_func_end ov11_023128C0

	arm_func_start ov11_0231297C
ov11_0231297C: ; 0x0231297C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02312A68 ; =ov11_02324E20
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r1, _02312A6C ; =ov11_02323CEC
	ldrb r3, [r0, #2]
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r1, _02312A68 ; =ov11_02324E20
	mov r2, #0
	ldr r0, [r1, #4]
	strb r2, [r0, #4]
	ldr r0, [r1, #4]
	strb r2, [r0, #3]
	ldr r0, [r1, #4]
	strh r4, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #2]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r0, r2, #1
	cmp r4, r0
	bne _023129FC
	ldr r0, [r1]
	sub r1, r2, #1
	bl ov11_022EC27C
	ldr r0, _02312A68 ; =ov11_02324E20
	ldmia r0, {r1, r2}
	add r0, r2, #0x18
	bl ov11_022EFD5C
	b _02312A54
_023129FC:
	ldr r5, _02312A70 ; =GROUND_WEATHER_TABLE
	ldr r0, [r1]
	add r1, r5, r4, lsl #2
	ldrsh r1, [r1, #2]
	mov r4, r4, lsl #2
	bl ov11_022EC27C
	ldr r0, _02312A68 ; =ov11_02324E20
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #8]
	ldr r1, [r0, #4]
	str r2, [r1, #0xc]
	ldr r1, [r0, #4]
	str r2, [r1, #0x10]
	ldr r1, [r0, #4]
	str r2, [r1, #0x14]
	ldrsh r1, [r5, r4]
	cmp r1, #1
	bne _02312A54
	ldr r0, [r0]
	mov r1, #2
	bl ov11_022EE620
_02312A54:
	ldr r0, _02312A68 ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02312A68: .word ov11_02324E20
_02312A6C: .word ov11_02323CEC
_02312A70: .word GROUND_WEATHER_TABLE
	arm_func_end ov11_0231297C

	arm_func_start ov11_02312A74
ov11_02312A74: ; 0x02312A74
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r1, [r0, #4]
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _02312B04
	ldrsh r1, [r1]
	mvn r0, #0
	cmp r1, r0
	beq _02312AD4
	ldr r0, _02312B10 ; =GROUND_WEATHER_TABLE
	mov r1, r1, lsl #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _02312AD4
	add r0, sp, #0
	bl ov11_022F1E70
	ldr r0, _02312B0C ; =ov11_02324E20
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
	b _02312AE8
_02312AD4:
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r2, _02312B14 ; =ov11_02323CC8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_02312AE8:
	ldr r0, _02312B0C ; =ov11_02324E20
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _02312B0C ; =ov11_02324E20
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #4]
_02312B04:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312B0C: .word ov11_02324E20
_02312B10: .word GROUND_WEATHER_TABLE
_02312B14: .word ov11_02323CC8
	arm_func_end ov11_02312A74

	arm_func_start ov11_02312B18
ov11_02312B18: ; 0x02312B18
	stmdb sp!, {r3, lr}
	ldr r0, _02312B3C ; =ov11_02324E20
	ldr r1, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	bl ov11_022EFB70
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312B3C: .word ov11_02324E20
	arm_func_end ov11_02312B18

	arm_func_start ov11_02312B40
ov11_02312B40: ; 0x02312B40
	stmdb sp!, {r3, lr}
	ldr r0, _02312BC4 ; =0x00000584
	mov r1, #1
	bl MemAlloc
	ldr r2, _02312BC8 ; =ov11_02324E28
	mov r1, #0
	str r0, [r2, #4]
	str r1, [r0]
	ldr r0, [r2, #4]
	strh r1, [r0, #4]
	ldr r0, [r2, #4]
	strh r1, [r0, #6]
	ldr r0, [r2, #4]
	add r0, r0, #0x500
	strh r1, [r0, #0x78]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x10]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x570]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x571]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x572]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x573]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x574]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x575]
	ldr r0, [r2, #4]
	strb r1, [r0, #0x576]
	bl ov11_02312BF4
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312BC4: .word 0x00000584
_02312BC8: .word ov11_02324E28
	arm_func_end ov11_02312B40

	arm_func_start ov11_02312BCC
ov11_02312BCC: ; 0x02312BCC
	stmdb sp!, {r3, lr}
	bl ov11_02312BF4
	ldr r0, _02312BF0 ; =ov11_02324E28
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _02312BF0 ; =ov11_02324E28
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312BF0: .word ov11_02324E28
	arm_func_end ov11_02312BCC

	arm_func_start ov11_02312BF4
ov11_02312BF4: ; 0x02312BF4
	stmdb sp!, {r3, lr}
	bl ov11_02313798
	ldr r0, _02312C54 ; =ov11_02324E28
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02312C24
	bl ov11_023146F8
	ldr r0, _02312C54 ; =ov11_02324E28
	mov r1, #0
	ldr r0, [r0, #4]
	strb r1, [r0, #0x10]
_02312C24:
	ldr r0, _02312C54 ; =ov11_02324E28
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r1, [r0, #4]
	strh r2, [r1, #6]
	ldr r0, [r0, #4]
	add r0, r0, #0x500
	strh r2, [r0, #0x78]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02312C54: .word ov11_02324E28
	arm_func_end ov11_02312BF4

	arm_func_start ov11_02312C58
ov11_02312C58: ; 0x02312C58
	ldr r0, _02312C8C ; =ov11_02324E28
	ldr r1, [r0, #4]
	add r0, r1, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02312C8C: .word ov11_02324E28
	arm_func_end ov11_02312C58

	arm_func_start ov11_02312C90
ov11_02312C90: ; 0x02312C90
	ldr r0, _02312CD4 ; =ov11_02324E28
	ldr r1, [r0, #4]
	add r0, r1, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _02312CCC
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	bxls lr
_02312CCC:
	mov r0, #0
	bx lr
	.align 2, 0
_02312CD4: .word ov11_02324E28
	arm_func_end ov11_02312C90

	arm_func_start ov11_02312CD8
ov11_02312CD8: ; 0x02312CD8
	ldr ip, _02312CFC ; =ov11_02324E28
	ldr r3, [ip, #4]
	add r3, r3, #0x500
	strh r0, [r3, #0x78]
	ldr r0, [ip, #4]
	str r1, [r0, #0x57c]
	ldr r0, [ip, #4]
	str r2, [r0, #0x580]
	bx lr
	.align 2, 0
_02312CFC: .word ov11_02324E28
	arm_func_end ov11_02312CD8

	arm_func_start ov11_02312D00
ov11_02312D00: ; 0x02312D00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _023130A8 ; =ov11_02324E28
	ldr r2, [r1, #4]
	ldr r0, [r2]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #2
	beq _02312D2C
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	b _02312F9C
_02312D2C:
	ldrsh r0, [r2, #4]
	cmp r0, #0x10
	bgt _02312D88
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312D44: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 0
	b _02312DA4 ; case 1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 3
	b _02312E8C ; case 4
	b _02312E8C ; case 5
	b _02312E8C ; case 6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 7
	b _02312E70 ; case 8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 9
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 11
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 12
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 13
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc} ; case 14
	b _02312E70 ; case 15
	b _02312F24 ; case 16
_02312D88:
	cmp r0, #0x17
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r0, #0x15
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmpne r0, #0x17
	beq _02312E8C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312DA4:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl SetAnimDataFields2
	mov r4, #0
	ldr r7, _023130A8 ; =ov11_02324E28
	mov sb, #0x800
	mov r8, r4
	mov r6, #0xc4
_02312E14:
	mul r5, r4, r6
	ldmia r7, {r0, r1}
	add r0, r0, r5
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r7]
	mov r1, sb
	mov r2, r8
	add r0, r0, r5
	bl SetAnimDataFields2
	add r4, r4, #1
	cmp r4, #0x50
	blt _02312E14
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312E70:
	strh r0, [r2, #6]
	ldr r0, [r1, #4]
	mov r2, #0
	strh r2, [r0, #4]
	ldr r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312E8C:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	mov r4, #0
	ldr r7, _023130A8 ; =ov11_02324E28
	mov sb, #0x800
	mov r8, r4
	mov r6, #0xc4
_02312EC8:
	mul r5, r4, r6
	ldmia r7, {r0, r1}
	add r0, r0, r5
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r7]
	mov r1, sb
	mov r2, r8
	add r0, r0, r5
	bl SetAnimDataFields2
	add r4, r4, #1
	cmp r4, #0x50
	blt _02312EC8
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312F24:
	mov r0, #0x3d40
	mov r1, #1
	bl MemAlloc
	ldr r2, _023130A8 ; =ov11_02324E28
	mov r1, #0x800
	str r0, [r2]
	ldr r0, [r2, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r5, _023130A8 ; =ov11_02324E28
	mov r6, #0
	mov r4, #0xc4
_02312F58:
	ldmia r5, {r0, r1}
	mla r0, r6, r4, r0
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x50
	blt _02312F58
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r2, #0
	ldr r3, [r0, #4]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0, #4]
	strh r2, [r1, #4]
	ldr r0, [r0, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02312F9C:
	add r0, r2, #0x500
	ldrsh r0, [r0, #0x78]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	strh r0, [r2, #4]
	ldr r3, [r1, #4]
	mov r2, #0
	ldr r0, [r3, #0x57c]
	str r0, [r3, #8]
	ldr r3, [r1, #4]
	ldr r0, [r3, #0x580]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, #0x500
	strh r2, [r0, #0x78]
	ldr r1, [r1, #4]
	ldrsh r0, [r1, #4]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _0231309C
_02312FEC: ; jump table
	b _0231309C ; case 0
	b _0231304C ; case 1
	b _0231308C ; case 2
	b _02313070 ; case 3
	b _02313058 ; case 4
	b _02313058 ; case 5
	b _02313058 ; case 6
	b _0231309C ; case 7
	b _02313058 ; case 8
	b _0231309C ; case 9
	b _0231309C ; case 10
	b _0231309C ; case 11
	b _0231309C ; case 12
	b _0231309C ; case 13
	b _0231309C ; case 14
	b _0231304C ; case 15
	b _02313064 ; case 16
	b _0231309C ; case 17
	b _0231309C ; case 18
	b _0231309C ; case 19
	b _0231309C ; case 20
	b _02313058 ; case 21
	b _0231309C ; case 22
	b _02313058 ; case 23
_0231304C:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313058:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313064:
	mov r0, #1
	str r0, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02313070:
	bl ov11_023146F8
	bl ov11_02313798
	ldr r0, _023130A8 ; =ov11_02324E28
	mov r1, #0
	ldr r0, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231308C:
	add r0, r1, #0x324
	bl ov11_022F6EFC
	bl ov11_02313798
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0231309C:
	mov r0, #0
	strh r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_023130A8: .word ov11_02324E28
	arm_func_end ov11_02312D00

	arm_func_start ov11_023130AC
ov11_023130AC: ; 0x023130AC
#ifdef EUROPE
#define OV11_023130AC_LOAD_OFFSET 0x10
#else
#define OV11_023130AC_LOAD_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	bl GetHero
	mov r5, r0
	bl GetPartner
	ldr r1, _02313464 ; =ov11_02324E28
	mov r4, r0
	ldr ip, [r1, #4]
	ldr r0, [ip]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsh r0, [ip, #4]
	cmp r0, #0x10
	bgt _02313130
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_023130EC: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	b _02313150 ; case 1
	ldmia sp!, {r3, r4, r5, pc} ; case 2
	ldmia sp!, {r3, r4, r5, pc} ; case 3
	b _02313404 ; case 4
	b _02313404 ; case 5
	b _023133D4 ; case 6
	ldmia sp!, {r3, r4, r5, pc} ; case 7
	b _023132EC ; case 8
	ldmia sp!, {r3, r4, r5, pc} ; case 9
	ldmia sp!, {r3, r4, r5, pc} ; case 10
	ldmia sp!, {r3, r4, r5, pc} ; case 11
	ldmia sp!, {r3, r4, r5, pc} ; case 12
	ldmia sp!, {r3, r4, r5, pc} ; case 13
	ldmia sp!, {r3, r4, r5, pc} ; case 14
	b _023132A4 ; case 15
	b _02313434 ; case 16
_02313130:
	cmp r0, #0x17
	ldmgtia sp!, {r3, r4, r5, pc}
	cmp r0, #0x15
	ldmltia sp!, {r3, r4, r5, pc}
	beq _02313404
	cmp r0, #0x17
	beq _023133D4
	ldmia sp!, {r3, r4, r5, pc}
_02313150:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xcd + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _02313468 ; =0x88080000
	ldr r0, [r0, #4]
	mov r1, #0xa
	add r0, r0, #0x3e8
	bl ov11_022F6FE0
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _0231346C ; =0x08080000
	ldr r0, [r0, #4]
	mov r1, #0xad + OV11_023130AC_LOAD_OFFSET
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x14
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0xd8
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x19c
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	mov r2, #0x8100000
	add r0, r0, #0x260
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x14
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xd8
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x19c
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313470 ; =0x00000807
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x260
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r1, [r0, #4]
	strb r3, [r1, #0x570]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x571]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x572]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x573]
	ldr r1, [r0, #4]
	strb r3, [r1, #0x574]
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x575]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x576]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023132A4:
	mov r3, #0
	strb r3, [ip, #0x570]
	ldr r0, [r1, #4]
	mov r2, #2
	strb r3, [r0, #0x571]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x572]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x573]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x574]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x575]
	ldr r0, [r1, #4]
	strb r3, [r0, #0x576]
	ldr r0, [r1, #4]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023132EC:
	mov r0, #6
	bl ov11_02314670
	ldr r0, _02313464 ; =ov11_02324E28
	mov r2, #1
	ldr r1, [r0, #4]
	strb r2, [r1, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x57c]
	ldr r1, [r1, #0x580]
	bl ov11_023159CC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r5, #4]
	ldr r0, [r0, #4]
	ldr r2, _02313474 ; =0x8C100000
	add r0, r0, #0x14
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldrsh r1, [r4, #4]
	ldr r0, [r0, #4]
	ldr r2, _02313474 ; =0x8C100000
	add r0, r0, #0xd8
	bl ov11_022F5BBC
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313478 ; =0x00001013
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x14
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313478 ; =0x00001013
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0xd8
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r2, _0231347C ; =0x8C080000
	ldr r0, [r0, #4]
	mov r1, #0xd0 + OV11_023130AC_LOAD_OFFSET
	add r0, r0, #0x324
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	ldr r1, _02313480 ; =0x00000801
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #0x324
	bl SetAnimDataFields2
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x573]
	ldr r2, [r0, #4]
	strb r3, [r2, #0x574]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_023133D4:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xb6 + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_02313404:
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	mov r1, #0xbe + OV11_023130AC_LOAD_OFFSET
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_02313434:
	ldr r1, _02313484 ; =0x00000223
	ldr r2, _02313468 ; =0x88080000
	add r0, ip, #0x324
	bl LoadObjectAnimData
	ldr r0, _02313464 ; =ov11_02324E28
	mov r3, #1
	ldr r2, [r0, #4]
	mov r1, #2
	strb r3, [r2, #0x570]
	ldr r0, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02313464: .word ov11_02324E28
_02313468: .word 0x88080000
_0231346C: .word 0x08080000
_02313470: .word 0x00000807
_02313474: .word 0x8C100000
_02313478: .word 0x00001013
_0231347C: .word 0x8C080000
_02313480: .word 0x00000801
#ifdef EUROPE
_02313484: .word 0x00000231
#else
_02313484: .word 0x00000223
#endif
	arm_func_end ov11_023130AC

	arm_func_start ov11_02313488
ov11_02313488: ; 0x02313488
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _0231378C ; =ov11_02323D0C
	ldr r1, [r0, #0x1c]
	ldr r0, [r0, #0x18]
	str r1, [sp, #4]
	str r0, [sp]
	bl GetHero
	mov r6, r0
	bl GetPartner
	ldr r1, _02313790 ; =ov11_02324E28
	mov r5, r0
	ldr r0, [r1, #4]
	ldrsh r0, [r0, #6]
	cmp r0, #0x10
	bgt _02313518
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _02313784
_023134D4: ; jump table
	b _02313784 ; case 0
	b _02313534 ; case 1
	b _02313784 ; case 2
	b _02313784 ; case 3
	b _023135DC ; case 4
	b _023135DC ; case 5
	b _023135DC ; case 6
	b _02313784 ; case 7
	b _0231353C ; case 8
	b _02313784 ; case 9
	b _02313784 ; case 10
	b _02313784 ; case 11
	b _02313784 ; case 12
	b _02313784 ; case 13
	b _02313784 ; case 14
	b _02313534 ; case 15
	b _023136AC ; case 16
_02313518:
	cmp r0, #0x17
	bgt _02313784
	cmp r0, #0x15
	blt _02313784
	cmpne r0, #0x17
	beq _023135DC
	b _02313784
_02313534:
	bl SentryUpdateDisplay
	b _02313784
_0231353C:
	bl ov11_0231474C
	cmp r0, #0
	beq _02313784
	mov r0, #0
	bl ov11_0231598C
	ldr r3, [r0, #8]
	mov r2, #0xd800
	add r2, r2, r3, lsl #8
	ldr r4, [r0, #4]
	ldr r1, _02313790 ; =ov11_02324E28
	mov r3, #0x7000
	str r3, [sp]
	str r2, [sp, #4]
	ldr r0, [r1, #4]
	ldrsh r1, [r6, #4]
	add r2, sp, #0
	add r0, r0, #0x14
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _02313790 ; =ov11_02324E28
	mov r1, #0x9000
	str r1, [sp]
	ldr r0, [r0, #4]
	ldrsh r1, [r5, #4]
	add r2, sp, #0
	add r0, r0, #0xd8
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _02313790 ; =ov11_02324E28
	mov r1, #0x14000
	add r2, r1, r4, lsl #8
	ldr r0, [r0, #4]
	mov r1, #0x8000
	str r1, [sp]
	str r2, [sp, #4]
	add r1, sp, #0
	add r0, r0, #0x324
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
	b _02313784
_023135DC:
	bl ov11_02313DC4
	cmp r0, #0
	beq _02313784
	mov sb, #0
	mov r6, #0xc4
	ldr r7, _02313790 ; =ov11_02324E28
	mov r8, sb
	add fp, sp, #0
	mov r4, r6
	mvn r5, #0x4f
_02313604:
	mov r0, sb
	bl ov11_0231598C
	mov sl, r0
	ldrh r0, [sl]
	cmp r0, #0xff
	beq _0231369C
	ldrh r0, [sl, #0x14]
	cmp r0, #8
	bhs _02313648
	ldr r0, [r7]
	ldr r1, [sl, #0xc]
	mla r0, sb, r6, r0
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r2, r8
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
_02313648:
	ldr r0, [sl, #8]
	ldr r3, [sl, #4]
	add r2, r0, #0xd0000
	mov r1, r2, asr #0xb
	mov r0, r3, asr #0xb
	add r1, r2, r1, lsr #20
	add r0, r3, r0, lsr #20
	cmp r5, r1, asr #12
	mov r1, r1, asr #0xc
	mov r2, r0, asr #0xc
	cmplt r1, #0xda
	bge _0231369C
	ldr r0, [r7]
	mov sl, r2, lsl #8
	mla r0, sb, r4, r0
	mov r3, r1, lsl #8
	mov r1, fp
	mov r2, #0
	str sl, [sp]
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
_0231369C:
	add sb, sb, #1
	cmp sb, #0x50
	blt _02313604
	b _02313784
_023136AC:
	bl ov11_02313DC4
	cmp r0, #0
	beq _02313784
	mov sl, #0
	mov r5, #0xc4
	ldr r6, _02313790 ; =ov11_02324E28
	mov fp, sl
	mov r7, #2
	mov r4, r5
_023136D0:
	mov r0, sl
	bl ov11_023159B0
	mov r8, r0
	ldrh r0, [r8]
	cmp r0, #0xff
	ldrneh r0, [r8, #0x16]
	cmpne r0, #0
	beq _02313778
	cmp r0, #1
	bne _02313740
	mul sb, sl, r5
	ldmia r6, {r0, r1}
	add r0, r0, sb
	add r1, r1, #0x324
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r6]
	ldr r1, [r8, #0xc]
	add r0, r0, sb
	bl ov11_022F4974
	ldrh r1, [r8, #0x14]
	ldr r0, [r6]
	mov r2, fp
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	add r0, r0, sb
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	strh r7, [r8, #0x16]
_02313740:
	ldr r0, [r8, #8]
	cmp r0, #0x12000
	bhs _02313778
	ldr r0, [r6]
	ldr r1, [r8, #4]
	mla r0, sl, r4, r0
	sub r1, r1, #0x2000
	str r1, [sp]
	ldr r2, [r8, #8]
	add r1, sp, #0
	sub r3, r2, #0x2000
	mov r2, #0
	str r3, [sp, #4]
	bl AnimRelatedFunction__022F6F14
_02313778:
	add sl, sl, #1
	cmp sl, #0x50
	blt _023136D0
_02313784:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0231378C: .word ov11_02323D0C
_02313790: .word ov11_02324E28
	arm_func_end ov11_02313488

	arm_func_start ov11_02313794
ov11_02313794: ; 0x02313794
	bx lr
	arm_func_end ov11_02313794

	arm_func_start ov11_02313798
ov11_02313798: ; 0x02313798
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x570]
	cmp r1, #0
	beq _023137C4
	mov r1, #0
	strb r1, [r2, #0x570]
	ldr r0, [r0, #4]
	add r0, r0, #0x324
	bl ov11_022F6EFC
_023137C4:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x571]
	cmp r1, #0
	beq _023137EC
	mov r1, #0
	strb r1, [r2, #0x571]
	ldr r0, [r0, #4]
	add r0, r0, #0x3e8
	bl ov11_022F7058
_023137EC:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x572]
	cmp r1, #0
	beq _02313818
	mov r1, #0
	strb r1, [r2, #0x572]
	ldr r0, [r0, #4]
	add r0, r0, #0xac
	add r0, r0, #0x400
	bl ov11_022F6EFC
_02313818:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x573]
	cmp r1, #0
	beq _02313840
	mov r1, #0
	strb r1, [r2, #0x573]
	ldr r0, [r0, #4]
	add r0, r0, #0x14
	bl ov11_022F6EFC
_02313840:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x574]
	cmp r1, #0
	beq _02313868
	mov r1, #0
	strb r1, [r2, #0x574]
	ldr r0, [r0, #4]
	add r0, r0, #0xd8
	bl ov11_022F6EFC
_02313868:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x575]
	cmp r1, #0
	beq _02313890
	mov r1, #0
	strb r1, [r2, #0x575]
	ldr r0, [r0, #4]
	add r0, r0, #0x19c
	bl ov11_022F6EFC
_02313890:
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r2, [r0, #4]
	ldrb r1, [r2, #0x576]
	cmp r1, #0
	beq _023138B8
	mov r1, #0
	strb r1, [r2, #0x576]
	ldr r0, [r0, #4]
	add r0, r0, #0x260
	bl ov11_022F6EFC
_023138B8:
	ldr r5, _02313904 ; =ov11_02324E28
	ldr r0, [r5]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	mov r4, #0xc4
_023138D0:
	ldr r0, [r5]
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #0x50
	blt _023138D0
	ldr r0, _02313904 ; =ov11_02324E28
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02313904 ; =ov11_02324E28
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02313904: .word ov11_02324E28
	arm_func_end ov11_02313798

	arm_func_start ov11_02313908
ov11_02313908: ; 0x02313908
	ldr ip, _02313914 ; =ov11_0230D270
	ldr r0, _02313918 ; =ov11_02323D2C
	bx ip
	.align 2, 0
_02313914: .word ov11_0230D270
_02313918: .word ov11_02323D2C
	arm_func_end ov11_02313908

	arm_func_start ov11_0231391C
ov11_0231391C: ; 0x0231391C
	ldr ip, _02313928 ; =ov11_0230D17C
	ldr r0, _0231392C ; =ov11_02323D2C
	bx ip
	.align 2, 0
_02313928: .word ov11_0230D17C
_0231392C: .word ov11_02323D2C
	arm_func_end ov11_0231391C

	arm_func_start ov11_02313930
ov11_02313930: ; 0x02313930
	stmdb sp!, {lr}
	sub sp, sp, #0x14
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023139C4 ; =ov11_02324E30
	str r0, [r1]
	bl ov11_02313A48
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r2, _023139C4 ; =ov11_02324E30
	mov lr, #0
	ldr r0, [r2]
	mov ip, #1
	strb lr, [r0, #8]
	ldr r1, [r2]
	add r0, sp, #0x10
	strb ip, [r1, #0xa]
	ldr r3, [r2]
	add r1, sp, #0xc
	strb lr, [r3, #0xb]
	ldr r3, [r2]
	add r2, sp, #8
	str ip, [r3, #4]
	bl ov11_022EBAA0
	ldr r1, [sp, #0xc]
	mov r0, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r1, _023139C8 ; =0x06210000
	str r2, [sp, #4]
	ldr r3, [sp, #0x10]
	add r2, r1, #0x8000
	bl ov11_022DC240
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {pc}
	.align 2, 0
_023139C4: .word ov11_02324E30
_023139C8: .word 0x06210000

	arm_func_start ov11_023139CC
ov11_023139CC: ; 0x023139CC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _023139F8
	ldr r0, _02313A44 ; =ov11_02324E30
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #7
	movne r0, #1
	strneb r0, [r1, #0xb]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_023139F8:
	bl ov11_02313A48
	ldr r0, _02313A44 ; =ov11_02324E30
	mov r2, #7
	ldr r1, [r0]
	str r2, [r1, #4]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _02313A20
	bl ov11_022DC3FC
_02313A20:
	bl ov11_022DC368
	ldr r0, _02313A44 ; =ov11_02324E30
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02313A44 ; =ov11_02324E30
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313A44: .word ov11_02324E30
	arm_func_end ov11_02313930

	arm_func_start ov11_02313A48
ov11_02313A48: ; 0x02313A48
	stmdb sp!, {r3, lr}
	ldr r1, _02313A94 ; =ov11_02324E30
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2, #4]
	ldr r1, [r1]
	strb r3, [r1, #9]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _02313A94 ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xa]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313A94: .word ov11_02324E30
	arm_func_end ov11_02313A48

	arm_func_start StatusUpdate
StatusUpdate: ; 0x02313A98
	ldr r0, _02313AB4 ; =ov11_02324E30
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #1
	strneb r0, [r1, #0xa]
	moveq r0, #0
	bx lr
	.align 2, 0
_02313AB4: .word ov11_02324E30
	arm_func_end StatusUpdate

	arm_func_start ov11_02313AB8
ov11_02313AB8: ; 0x02313AB8
	ldr r0, _02313AD4 ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #9]
	bx lr
	.align 2, 0
_02313AD4: .word ov11_02324E30
	arm_func_end ov11_02313AB8

	arm_func_start ov11_02313AD8
ov11_02313AD8: ; 0x02313AD8
	bx lr
	arm_func_end ov11_02313AD8

	arm_func_start HandleTeamStatsGround
HandleTeamStatsGround: ; 0x02313ADC
	stmdb sp!, {r3, lr}
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02313CA4
_02313AF8: ; jump table
	b _02313B18 ; case 0
	b _02313B40 ; case 1
	b _02313CA4 ; case 2
	b _02313CA4 ; case 3
	b _02313BD0 ; case 4
	b _02313BFC ; case 5
	b _02313C58 ; case 6
	b _02313C94 ; case 7
_02313B18:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r0, [r0]
	str r1, [r0, #4]
_02313B40:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r2, [r0]
	ldrb r1, [r2, #0xb]
	cmp r1, #0
	beq _02313B98
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	strb r3, [r2, #9]
	ldr r0, [r0]
	str r1, [r0, #4]
	b _02313CA4
_02313B98:
	ldrb r1, [r2, #0xa]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #9]
	beq _02313CA4
	mov r1, #1
	strb r1, [r2, #9]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #0xa]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0, #4]
	b _02313CA4
_02313BD0:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02313CAC ; =ov11_02324E30
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #9]
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0, #4]
_02313BFC:
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	ldreqb r0, [r1, #0xa]
	cmpeq r0, #0
	beq _02313C40
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2, #4]
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _02313CA4
_02313C40:
	bl ov11_022DC434
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _02313CA4
_02313C58:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02313CA4
	ldr r0, _02313CAC ; =ov11_02324E30
	ldr r1, [r0]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _02313C84
	mov r0, #0
	strb r0, [r1, #8]
	bl ov11_022DC3FC
_02313C84:
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0, #4]
_02313C94:
	ldr r0, _02313CAC ; =ov11_02324E30
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #9]
_02313CA4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313CAC: .word ov11_02324E30
	arm_func_end HandleTeamStatsGround

	arm_func_start ov11_02313CB0
ov11_02313CB0: ; 0x02313CB0
	stmdb sp!, {r3, lr}
	ldr r0, _02313D14 ; =ov11_02324E30
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #2
	ldmneia sp!, {r3, pc}
	mov r1, #1
	strb r1, [r2, #9]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _02313CFC
	bl ov11_022DC3A0
	ldr r0, _02313D14 ; =ov11_02324E30
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	bl ov11_02313A48
	b _02313D00
_02313CFC:
	bl ov11_022DC504
_02313D00:
	ldr r0, _02313D14 ; =ov11_02324E30
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313D14: .word ov11_02324E30
	arm_func_end ov11_02313CB0

	arm_func_start ov11_02313D18
ov11_02313D18: ; 0x02313D18
	stmdb sp!, {r3, lr}
	ldr r0, _02313D8C ; =ov11_02324E30
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	bne _02313D54
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02313D8C ; =ov11_02324E30
	mov r3, #1
	ldr r2, [r0]
	mov r1, #4
	strb r3, [r2]
	ldr r0, [r0]
	str r1, [r0, #4]
_02313D54:
	ldr r0, _02313D8C ; =ov11_02324E30
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _02313D74
	sub r0, r0, #4
	cmp r0, #2
	bhi _02313D84
_02313D74:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _02313D84
	bl ov11_022DC46C
_02313D84:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313D8C: .word ov11_02324E30
	arm_func_end ov11_02313D18

	arm_func_start ov11_02313D90
ov11_02313D90: ; 0x02313D90
	stmdb sp!, {r3, lr}
	ldr r0, _02313DC0 ; =ov11_02324E30
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	mov r0, #0x10
	strb r1, [r2]
	bl ov11_022E9C98
	bl ov11_022DC494
	ldmia sp!, {r3, pc}
	.align 2, 0
_02313DC0: .word ov11_02324E30
	arm_func_end ov11_02313D90

	arm_func_start ov11_02313DC4
ov11_02313DC4: ; 0x02313DC4
	ldr r0, _02313DF0 ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02313DF0: .word ov11_02324E34
	arm_func_end ov11_02313DC4

	arm_func_start ov11_02313DF4
ov11_02313DF4: ; 0x02313DF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	mov r5, r2
	bl sub_0201F2E4
	ldr r0, _023145D4 ; =0x00000CB4
	mov r1, #6
	bl MemAlloc
	ldr r4, _023145D8 ; =ov11_02324E34
	mov r6, #0
	str r0, [r4]
	strb r6, [r0, #0xcac]
	ldr r0, [r4]
	mov sb, r6
	str r8, [r0]
	ldr r0, [r4]
	mov r8, #0x28
	str r6, [r0, #4]
	ldr r0, [r4]
	str r6, [r0, #8]
	ldr r0, [r4]
	str r6, [r0, #0xc]
	ldr r0, [r4]
	str r6, [r0, #0x10]
	ldr r0, [r4]
	str r6, [r0, #0x14]
	ldr r0, [r4]
	str r6, [r0, #0x18]
	ldr r0, [r4]
	str r6, [r0, #0x1c]
	ldr r0, [r4]
	str r6, [r0, #0x20]
	ldr r0, [r4]
	str r7, [r0, #0x24]
	ldr r0, [r4]
	str r5, [r0, #0x28]
	mov r5, #0xff
_02313E8C:
	mul r7, r6, r8
	ldr r0, [r4]
	add r0, r0, r7
	strh r5, [r0, #0x2c]
	bl sub_0201F36C
	ldr r1, [r4]
	add r1, r1, r7
	strh r0, [r1, #0x4c]
	ldr r0, [r4]
	add r0, r0, r7
	ldrsh r0, [r0, #0x4c]
	bl sub_0201F324
	ldr r2, [r4]
	mov r1, sb
	add r2, r2, r7
	str r0, [r2, #0x48]
	ldr r0, [r4]
	add r0, r0, r7
	ldrsh r0, [r0, #0x4c]
	bl sub_0201F348
	add r6, r6, #1
	cmp r6, #0x50
	blt _02313E8C
	ldr r4, _023145D8 ; =ov11_02324E34
	ldr r1, [r4]
	ldr r0, [r1]
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _023145CC
_02313F00: ; jump table
	b _023145CC ; case 0
	b _023145CC ; case 1
	b _023145CC ; case 2
	b _02313F50 ; case 3
	b _02314060 ; case 4
	b _0231419C ; case 5
	b _02314210 ; case 6
	b _02314320 ; case 7
	b _02314228 ; case 8
	b _023145CC ; case 9
	b _023145CC ; case 10
	b _023144C0 ; case 11
	b _023144C8 ; case 12
	b _023144D0 ; case 13
	b _023144EC ; case 14
	b _02314548 ; case 15
	b _0231455C ; case 16
	b _0231421C ; case 17
	b _02314570 ; case 18
	b _023145CC ; case 19
_02313F50:
	mov sl, #0
	ldr r8, _023145DC ; =ov11_02323F84
	ldr r7, _023145E0 ; =ov11_02323FD4
	ldr r6, _023145E4 ; =ov11_02323E92
	ldr fp, _023145E8 ; =ov11_02323DEE
	mov r5, #0xc400
	mov sb, sl
_02313F6C:
	ldr r0, _023145EC ; =ov11_02324380
	bl ov11_02314D48
	mov r0, #0x28
	mul r2, sl, r0
	ldr r0, [r4]
	ldr r1, [r8, sl, lsl #2]
	add r0, r0, r2
	str r1, [r0, #0x30]
	mov r0, sl, lsl #1
	ldr r3, [r4]
	ldrh r1, [r6, r0]
	ldr ip, [r7, sl, lsl #2]
	add r0, r3, r2
	str ip, [r0, #0x34]
	ldr r3, [r4]
	add r0, sl, #3
	add r3, r3, r2
	str r1, [r3, #0x38]
	ldr r3, [r4]
	mov r1, r1, lsl #1
	add r3, r3, r2
	strh r0, [r3, #0x2c]
	ldr r3, [r4]
	add r0, sl, sl, lsl #4
	add r3, r3, r2
	strh r5, [r3, #0x3c]
	ldr r3, [r4]
	add sl, sl, #1
	add r3, r3, r2
	strh sb, [r3, #0x40]
	ldr r3, [r4]
	ldrh r1, [fp, r1]
	add r3, r3, r2
	strh r0, [r3, #0x42]
	ldr r0, [r4]
	cmp sl, #0x14
	add r0, r0, r2
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	add r0, r0, r2
	strh sb, [r0, #0x50]
	blt _02313F6C
	ldr r4, _023145D8 ; =ov11_02324E34
	b _02314024
_0231401C:
	bl ov11_0231474C
	add sb, sb, #1
_02314024:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp sb, r0
	bne _0231401C
	mov r4, #0
	ldr r1, _023145D8 ; =ov11_02324E34
	mov r3, r4
	mov r0, #0x28
_02314044:
	ldr r2, [r1]
	mla r2, r4, r0, r2
	add r4, r4, #1
	strh r3, [r2, #0x40]
	cmp r4, #0x14
	blt _02314044
	b _023145CC
_02314060:
	add r1, sp, #8
	mov r0, #0
	bl ov11_022EB3C8
	mov sl, #0
	ldr r6, _023145F0 ; =ov11_023240E8
	ldr r5, _023145F4 ; =ov11_02324160
	ldr fp, _023145F8 ; =ov11_02323EBC
	mov sb, sl
_02314080:
	ldr r0, _023145EC ; =ov11_02324380
	bl ov11_02314D48
	mov r0, #0x28
	mul r7, sl, r0
	ldr r0, [r4]
	ldr r1, [r6, sl, lsl #2]
	add r0, r0, r7
	str r1, [r0, #0x30]
	ldr r1, [r4]
	mov r0, sl, lsl #1
	ldrh r8, [fp, r0]
	ldr r2, [r5, sl, lsl #2]
	add r1, r1, r7
	str r2, [r1, #0x34]
	ldr r1, [r4]
	mov r0, sl
	add r1, r1, r7
	str r8, [r1, #0x38]
	mov r1, #0xf
	bl _s32_div_f
	ldr r3, [r4]
	ldr r1, _023145FC ; =ov11_02323DD0
	add r3, r3, r7
	strh r0, [r3, #0x2c]
	ldr r0, [r4]
	mov r2, r8, lsl #1
	add r3, r0, r7
	mov r0, #0xbd00
	strh r0, [r3, #0x3c]
	ldr r0, [r4]
	ldrh r1, [r1, r2]
	add r0, r0, r7
	strh sb, [r0, #0x40]
	ldr r0, [r4]
	add r2, sl, sl, lsl #4
	add r0, r0, r7
	strh r2, [r0, #0x42]
	ldr r0, [r4]
	add sl, sl, #1
	add r0, r0, r7
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	ldr r1, [sp, #8]
	add r0, r0, r7
	strh r1, [r0, #0x50]
	ldr r0, [r4]
	cmp sl, #0x1e
	add r1, r0, r7
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0xc
	strh r0, [r1, #0x4e]
	blt _02314080
	ldr r4, _023145D8 ; =ov11_02324E34
	b _02314160
_02314158:
	bl ov11_0231474C
	add sb, sb, #1
_02314160:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp sb, r0
	bne _02314158
	mov r4, #0
	ldr r1, _023145D8 ; =ov11_02324E34
	mov r3, r4
	mov r0, #0x28
_02314180:
	ldr r2, [r1]
	mla r2, r4, r0, r2
	add r4, r4, #1
	strh r3, [r2, #0x40]
	cmp r4, #0x19
	blt _02314180
	b _023145CC
_0231419C:
	ldr r1, _02314600 ; =ov11_02324B0C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _02314604 ; =ov11_02324B24
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	ldr r5, _02314608 ; =ov11_023242D8
	mov r6, #0
	strb r2, [r0, #0xcac]
	mov r4, #0x1c
_023141F8:
	mla r0, r6, r4, r5
	bl ov11_02314D48
	add r6, r6, #1
	cmp r6, #6
	blt _023141F8
	b _023145CC
_02314210:
	ldr r0, _0231460C ; =ov11_02323D98
	bl ov11_02314D48
	b _023145CC
_0231421C:
	ldr r0, _02314610 ; =ov11_02323D60
	bl ov11_02314D48
	b _023145CC
_02314228:
	ldr r8, _02314614 ; =ov11_02324700
	ldr r7, _02314618 ; =TRIG_TABLE
	mov sl, #0
	mov fp, #3
	mov r5, #0x28
	mov r6, #0x600
_02314240:
	mov r0, r8
	bl ov11_02314D48
	mul sb, sl, r5
	mov r0, sl
	mov r1, fp
	bl _s32_div_f
	mov r0, sl, asr #2
	add r0, sl, r0, lsr #29
	mov r2, r0, asr #3
	mov r3, sl, lsr #0x1f
	ldr r0, [r4]
	add r2, r2, r2, lsl #1
	add r1, r1, r2
	rsb r2, r3, sl, lsl #30
	add r2, r3, r2, ror #30
	add r0, r0, sb
	strh r1, [r0, #0x2c]
	add r0, r2, #1
	mul r1, r0, r6
	ldr r0, [r4]
	mov r2, sl, lsl #0xb
	add r0, r0, sb
	strh r2, [r0, #0x3c]
	ldr r0, [r4]
	add r1, r1, #0x2400
	add r0, r0, sb
	strh r1, [r0, #0x3e]
	ldr r0, [r4]
	add sl, sl, #1
	add r2, r0, sb
	ldrh r1, [r2, #0x3c]
	ldrh r0, [r2, #0x3e]
	cmp sl, #0x20
	mov r1, r1, asr #4
	mov r1, r1, lsl #1
	mov r0, r0, lsr #9
	mov r3, r1, lsl #1
	ldrsh r3, [r7, r3]
	add r1, r7, r1, lsl #1
	mul ip, r3, r0
	add r3, ip, #0x80000
	str r3, [r2, #0x30]
	ldrsh r2, [r1, #2]
	ldr r1, [r4]
	mul r0, r2, r0
	rsb r2, r0, #0x60000
	add r0, r1, sb
	str r2, [r0, #0x34]
	blt _02314240
	ldr r0, _0231461C ; =ov11_0232471C
	bl ov11_02314D48
	ldr r0, _02314620 ; =ov11_02324738
	bl ov11_02314D48
	ldr r0, _02314624 ; =ov11_02324754
	bl ov11_02314D48
	b _023145CC
_02314320:
	ldr r1, _02314628 ; =ov11_02324B3C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _0231462C ; =ov11_02324B54
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	mov r6, #0
	strb r2, [r0, #0xcac]
_02314374:
	ldr r0, _02314630 ; =ov11_02323D7C
	bl ov11_02314D48
	mov r0, #0x28
	mul r4, r6, r0
	ldr r1, _023145D8 ; =ov11_02324E34
	ldr r3, _02314634 ; =ov11_02323EFC
	ldr r2, [r1]
	ldr r3, [r3, r6, lsl #2]
	add r2, r2, r4
	ldr r0, _02314638 ; =ov11_02323F40
	str r3, [r2, #0x34]
	ldr r2, [r0, r6, lsl #2]
	ldr r0, [r1]
	add r2, r2, #0x18000
	add r0, r0, r4
	str r2, [r0, #0x30]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, r4
	str r2, [r0, #0x38]
	ldr r3, [r1]
	ldr r5, _0231463C ; =ov11_02323E70
	mov r8, r6, lsl #1
	ldr r0, _02314640 ; =ov11_02323E2C
	ldrh r7, [r5, r8]
	ldr r2, _02314644 ; =ov11_02323E4E
	add r3, r3, r4
	strh r7, [r3, #0x2c]
	ldrh r5, [r2, r8]
	ldr r2, [r1]
	ldrh r0, [r0, r8]
	add r2, r2, r4
	strh r5, [r2, #0x3c]
	ldr r7, [r1]
	mov r1, #0x64
	ldr r2, [r7, #0x24]
	rsb r2, r2, #0x64
	mul r0, r2, r0
	bl _s32_div_f
	mov r1, r5, asr #4
	add r2, r7, r4
	strh r0, [r2, #0x40]
	ldr r5, _023145D8 ; =ov11_02324E34
	mov r3, r1, lsl #1
	ldr r0, [r5]
	ldr r1, _02314618 ; =TRIG_TABLE
	mov r2, #0xf000
	add r0, r0, r4
	strh r2, [r0, #0x3e]
	mov r2, r3, lsl #1
	add r0, r1, r3, lsl #1
	ldrsh r3, [r1, r2]
	ldrsh r1, [r0, #2]
	ldr r2, [r5]
	add r0, r3, r3, lsl #1
	add r1, r1, r1, lsl #1
	mov r8, r0, lsl #0xe
	mov r3, r1, lsl #0xe
	mov r1, r3, asr #0xa
	mov r0, r8, asr #0xa
	add r7, r2, r4
	add r2, r8, r0, lsr #21
	add r3, r3, r1, lsr #21
	ldrh r1, [r7, #0x40]
	mov r0, #0
	b _023144A8
_0231447C:
	ldr r7, [r5]
	add r0, r0, #1
	add r8, r4, r7
	ldr r7, [r8, #0x30]
	sub r7, r7, r2, asr #11
	str r7, [r8, #0x30]
	ldr r7, [r5]
	add r8, r4, r7
	ldr r7, [r8, #0x34]
	add r7, r7, r3, asr #11
	str r7, [r8, #0x34]
_023144A8:
	cmp r0, r1
	bne _0231447C
	add r6, r6, #1
	cmp r6, #0x11
	blt _02314374
	b _023145CC
_023144C0:
	bl ov11_02316330
	b _023145CC
_023144C8:
	bl ov11_02316330
	bl ov11_023163B0
_023144D0:
	ldr r0, _02314648 ; =ov11_02324024
	bl ov11_02314D48
	ldr r0, _0231464C ; =ov11_02324040
	bl ov11_02314D48
	ldr r0, _02314650 ; =ov11_0232405C
	bl ov11_02314D48
	b _023145CC
_023144EC:
	ldr r1, _02314654 ; =ov11_02324B6C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _02314658 ; =ov11_02324B84
	mov r1, #0
	bl sub_0201DF38
	mov r1, r4
	ldr r3, [r1]
	mov r2, #1
	str r0, [r3, #0xcb0]
	ldr r1, [r1]
	ldr r0, _0231465C ; =ov11_02323DB4
	strb r2, [r1, #0xcac]
	bl ov11_02314D48
	b _023145CC
_02314548:
	ldr r0, _02314660 ; =ov11_02324078
	bl ov11_02314D48
	ldr r0, _02314664 ; =ov11_02324094
	bl ov11_02314D48
	b _023145CC
_0231455C:
	ldr r0, _02314668 ; =ov11_023240B0
	bl ov11_02314D48
	ldr r0, _0231466C ; =ov11_023240CC
	bl ov11_02314D48
	b _023145CC
_02314570:
	mov r5, #0
	str r5, [r1, #0xc]
	ldr r0, [r4]
	mov r2, #4
	str r2, [r0, #0x10]
	ldr r0, [r4]
	mov r1, #2
	str r1, [r0, #0x14]
	ldr r0, [r4]
	mov r1, #5
	str r1, [r0, #0x18]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x1c]
	ldr r0, [r4]
	str r2, [r0, #0x20]
	b _023145BC
_023145B4:
	bl ov11_0231474C
	add r5, r5, #1
_023145BC:
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp r5, r0
	blt _023145B4
_023145CC:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023145D4: .word 0x00000CB4
_023145D8: .word ov11_02324E34
_023145DC: .word ov11_02323F84
_023145E0: .word ov11_02323FD4
_023145E4: .word ov11_02323E92
_023145E8: .word ov11_02323DEE
_023145EC: .word ov11_02324380
_023145F0: .word ov11_023240E8
_023145F4: .word ov11_02324160
_023145F8: .word ov11_02323EBC
_023145FC: .word ov11_02323DD0
_02314600: .word ov11_02324B0C
_02314604: .word ov11_02324B24
_02314608: .word ov11_023242D8
_0231460C: .word ov11_02323D98
_02314610: .word ov11_02323D60
_02314614: .word ov11_02324700
_02314618: .word TRIG_TABLE
_0231461C: .word ov11_0232471C
_02314620: .word ov11_02324738
_02314624: .word ov11_02324754
_02314628: .word ov11_02324B3C
_0231462C: .word ov11_02324B54
_02314630: .word ov11_02323D7C
_02314634: .word ov11_02323EFC
_02314638: .word ov11_02323F40
_0231463C: .word ov11_02323E70
_02314640: .word ov11_02323E2C
_02314644: .word ov11_02323E4E
_02314648: .word ov11_02324024
_0231464C: .word ov11_02324040
_02314650: .word ov11_0232405C
_02314654: .word ov11_02324B6C
_02314658: .word ov11_02324B84
_0231465C: .word ov11_02323DB4
_02314660: .word ov11_02324078
_02314664: .word ov11_02324094
_02314668: .word ov11_023240B0
_0231466C: .word ov11_023240CC
	arm_func_end ov11_02313DF4

	arm_func_start ov11_02314670
ov11_02314670: ; 0x02314670
	ldr ip, _02314680 ; =ov11_02313DF4
	mov r1, #0
	mov r2, r1
	bx ip
	.align 2, 0
_02314680: .word ov11_02313DF4
	arm_func_end ov11_02314670

	arm_func_start ov11_02314684
ov11_02314684: ; 0x02314684
	ldr r0, _023146AC ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	beq _023146A4
	ldr r0, [r0]
	cmp r0, #0xb
	moveq r0, #1
	bxeq lr
_023146A4:
	mov r0, #0
	bx lr
	.align 2, 0
_023146AC: .word ov11_02324E34
	arm_func_end ov11_02314684

	arm_func_start ov11_023146B0
ov11_023146B0: ; 0x023146B0
	ldr r0, _023146D0 ; =ov11_02324E34
	ldr r0, [r0]
	ldrb r0, [r0, #0xcac]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_023146D0: .word ov11_02324E34
	arm_func_end ov11_023146B0

	arm_func_start ov11_023146D4
ov11_023146D4: ; 0x023146D4
	ldr r2, _023146F0 ; =ov11_02324E34
	ldr ip, _023146F4 ; =ov11_023163B0
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x28]
	bx ip
	.align 2, 0
_023146F0: .word ov11_02324E34
_023146F4: .word ov11_023163B0
	arm_func_end ov11_023146D4

	arm_func_start ov11_023146F8
ov11_023146F8: ; 0x023146F8
	stmdb sp!, {r3, lr}
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0201F2E4
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r1, [r0]
	ldrb r0, [r1, #0xcac]
	cmp r0, #0
	beq _0231472C
	add r0, r1, #0xcb0
	bl sub_0201E020
_0231472C:
	ldr r0, _02314748 ; =ov11_02324E34
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02314748 ; =ov11_02324E34
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02314748: .word ov11_02324E34
	arm_func_end ov11_023146F8

	arm_func_start ov11_0231474C
ov11_0231474C: ; 0x0231474C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _02314D2C ; =ov11_02324E34
	ldr r0, [r6]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, _02314D30 ; =ov11_02324E38
	mov r4, #0
	mov r5, #0x28
_02314770:
	mul r2, r4, r5
	ldr r3, [r6]
	add r1, r3, r2
	ldrh r0, [r1, #0x2c]
	cmp r0, #0xff
	beq _0231479C
	ldrh r1, [r1, #0x44]
	add r0, r3, #0x2c
	add r0, r0, r2
	ldr r1, [r7, r1, lsl #2]
	blx r1
_0231479C:
	add r4, r4, #1
	cmp r4, #0x50
	blt _02314770
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r2, [r0]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldr r4, [r0]
	ldr r0, [r4]
	cmp r0, #3
	bgt _023147E8
	cmp r0, #1
	blt _02314D24
	beq _023147F4
	cmp r0, #2
	beq _023148CC
	cmp r0, #3
	b _02314D24
_023147E8:
	cmp r0, #0x12
	beq _023149D4
	b _02314D24
_023147F4:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #8
	bl _s32_div_f
	cmp r1, #1
	bne _0231482C
	ldr r0, [r4, #8]
	ldr r2, _02314D34 ; =ov11_02324620
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r1, r1, r0, ror #30
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
_0231482C:
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r4, [r0]
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #8
	bl _s32_div_f
	cmp r1, #0
	bne _02314D24
	ldr r1, [r4, #8]
	ldr r0, _02314D2C ; =ov11_02324E34
	add r1, r1, #1
	str r1, [r4, #8]
	ldr r0, [r0]
	ldr r3, _02314D34 ; =ov11_02324620
	ldr r0, [r0, #8]
	mov r2, #0x1c
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	add r1, r0, #4
	mla r0, r1, r2, r3
	bl ov11_02314D48
	ldr r0, _02314D2C ; =ov11_02324E34
	ldr r0, [r0]
	ldr r2, [r0, #8]
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #30
	adds r0, r1, r0, ror #30
	bne _02314D24
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r1, r0, asr #2
	mov r2, r1, lsr #0x1f
	rsb r0, r2, r1, lsl #30
	ldr r3, _02314D38 ; =ov11_02324540
	add r2, r2, r0, ror #30
	mov r0, #0x1c
	mla r0, r2, r0, r3
	bl ov11_02314EF8
	b _02314D24
_023148CC:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #4]
	add r1, r1, #6
	bl _s32_div_f
	cmp r1, #0
	bne _02314D24
	ldr r1, [r4, #8]
	ldr r0, _02314D2C ; =ov11_02324E34
	add r1, r1, #1
	str r1, [r4, #8]
	ldr r0, [r0]
	mov r1, #3
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #0
	bne _0231493C
	add r0, r4, r4, lsr #31
	mov r0, r0, asr #1
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	ldr r2, _02314D38 ; =ov11_02324540
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r2
	mov r1, r4
	bl ov11_02314EF8
_0231493C:
	ldr r0, _02314D2C ; =ov11_02324E34
	mov r1, #3
	ldr r0, [r0]
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #0
	bne _02314988
	mov r0, r4
	mov r1, #3
	bl _s32_div_f
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	ldr r2, _02314D3C ; =ov11_02324460
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
_02314988:
	ldr r0, _02314D2C ; =ov11_02324E34
	mov r1, #3
	ldr r0, [r0]
	ldr r4, [r0, #8]
	mov r0, r4
	bl _s32_div_f
	cmp r1, #1
	bne _02314D24
	mov r0, r4
	mov r1, #3
	bl _s32_div_f
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	ldr r2, _02314D3C ; =ov11_02324460
	add r1, r1, r0, ror #30
	mov r0, #0x1c
	mla r0, r1, r0, r2
	bl ov11_02314D48
	b _02314D24
_023149D4:
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	add r0, r1, #0xc
	cmp r0, r2
	mov r8, #6
	ble _023149F8
	cmp r1, r2
	bgt _02314D24
	mov r8, #3
_023149F8:
	ldr r0, _02314D40 ; =0x000001BF
	mov r7, #0
	ldr r5, _02314D44 ; =ov11_023247E0
	sub sl, r0, #0xe
	ldr r4, _02314D2C ; =ov11_02324E34
	b _02314D1C
_02314A10:
	cmp r7, #5
	mov r6, #0xff
	addls pc, pc, r7, lsl #2
	b _02314CA0
_02314A20: ; jump table
	b _02314A38 ; case 0
	b _02314A9C ; case 1
	b _02314B04 ; case 2
	b _02314B70 ; case 3
	b _02314BD8 ; case 4
	b _02314C3C ; case 5
_02314A38:
	ldr r2, [r4]
	ldr r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	adds r0, r1, r0, ror #30
	bne _02314CA0
	ldr r0, [r2, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r1, r1, r0, ror #31
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0xc]
	mov r0, #0xb7
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0xc]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0xc]
	b _02314CA0
_02314A9C:
	ldr sb, [r4]
	mov r1, #3
	ldr r0, [sb, #4]
	bl _s32_div_f
	cmp r1, #1
	bne _02314CA0
	ldr r0, [sb, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #2
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x10]
	mov r0, #0x9f
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x10]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x10]
	b _02314CA0
_02314B04:
	ldr r2, [r4]
	ldr r0, [r2, #4]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	cmp r0, #2
	bne _02314CA0
	ldr r0, [r2, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x14]
	mov r0, #0x92
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x14]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x14]
	b _02314CA0
_02314B70:
	ldr sb, [r4]
	mov r1, #5
	ldr r0, [sb, #4]
	bl _s32_div_f
	cmp r1, #2
	bne _02314CA0
	ldr r0, [sb, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #4
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x14]
	mov r0, #0x9b
	mul r0, r2, r0
	mov r1, #0x140
	bl _s32_div_f
	ldr r0, [sb, #0x18]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x18]
	b _02314CA0
_02314BD8:
	ldr r0, [r4]
	mov r1, #5
	ldr sb, [r0, #8]
	mov r0, sb
	bl _s32_div_f
	cmp r1, #3
	bne _02314CA0
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #6
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x1c]
	mov r1, #0x140
	mul r0, r2, sl
	bl _s32_div_f
	ldr r0, [sb, #0x1c]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x1c]
	b _02314CA0
_02314C3C:
	ldr r0, [r4]
	mov r1, #6
	ldr sb, [r0, #8]
	mov r0, sb
	bl _s32_div_f
	cmp r1, #3
	bne _02314CA0
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #31
	add r0, r1, r0, ror #31
	add r1, r0, #6
	mov r0, #0x1c
	mla r0, r1, r0, r5
	bl ov11_02314E20
	ldr sb, [r4]
	mov r6, r0
	ldr r2, [sb, #0x20]
	ldr r0, _02314D40 ; =0x000001BF
	mov r1, #0x140
	mul r0, r2, r0
	bl _s32_div_f
	ldr r0, [sb, #0x20]
	mov fp, r1
	add r0, r0, #1
	str r0, [sb, #0x20]
_02314CA0:
	cmp r6, #0xff
	beq _02314D18
	mov r0, #0x28
	mul r0, r6, r0
	ldr r1, [r4]
	add r1, r1, #0x2c
	strh r6, [r1, r0]
	add r6, r1, r0
	mov r0, fp, lsl #8
	str r0, [r6, #4]
	mov r0, #0x20000
	str r0, [r6, #8]
	ldr r0, [r4]
	ldr r1, [r0, #0x28]
	ldr r2, [r0, #4]
	mov r0, #0x3c00
	mul r0, r2, r0
	mov r1, r1, lsl #5
	bl _s32_div_f
	ldrh r1, [r6, #0x12]
	rsb r0, r0, #0x200
	mul r0, r1, r0
	mov r0, r0, lsl #1
	strh r0, [r6, #0x12]
	mov r0, #0
	strh r0, [r6, #0x16]
	ldr r1, [r4]
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
_02314D18:
	add r7, r7, #1
_02314D1C:
	cmp r7, r8
	blt _02314A10
_02314D24:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02314D2C: .word ov11_02324E34
_02314D30: .word ov11_02324E38
_02314D34: .word ov11_02324620
_02314D38: .word ov11_02324540
_02314D3C: .word ov11_02324460
_02314D40: .word 0x000001BF
_02314D44: .word ov11_023247E0
	arm_func_end ov11_0231474C

	arm_func_start ov11_02314D48
ov11_02314D48: ; 0x02314D48
	stmdb sp!, {r4, lr}
	ldr r1, _02314E1C ; =ov11_02324E34
	mov r2, #0
	ldr r4, [r1]
	mov r3, #0x28
	b _02314E0C
_02314D60:
	mul r1, r2, r3
	add lr, r4, r1
	ldrh ip, [lr, #0x2c]
	cmp ip, #0xff
	bne _02314E08
	ldrh ip, [r0]
	ldr r3, _02314E1C ; =ov11_02324E34
	strh ip, [lr, #0x2c]
	ldr ip, [r3]
	ldr lr, [r0, #4]
	add ip, ip, r1
	str lr, [ip, #0x30]
	ldr ip, [r3]
	ldr lr, [r0, #8]
	add ip, ip, r1
	str lr, [ip, #0x34]
	ldr ip, [r3]
	ldr lr, [r0, #0xc]
	add ip, ip, r1
	str lr, [ip, #0x38]
	ldr ip, [r3]
	ldrh lr, [r0, #0x10]
	add ip, ip, r1
	strh lr, [ip, #0x3c]
	ldr ip, [r3]
	ldrh lr, [r0, #0x12]
	add ip, ip, r1
	strh lr, [ip, #0x3e]
	ldr ip, [r3]
	ldrh lr, [r0, #0x14]
	add ip, ip, r1
	strh lr, [ip, #0x40]
	ldr ip, [r3]
	ldrh lr, [r0, #0x16]
	add ip, ip, r1
	strh lr, [ip, #0x42]
	ldrh ip, [r0, #0x18]
	ldr r3, [r3]
	mov r0, r2
	add r1, r3, r1
	strh ip, [r1, #0x44]
	ldmia sp!, {r4, pc}
_02314E08:
	add r2, r2, #1
_02314E0C:
	cmp r2, #0x50
	blt _02314D60
	mov r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02314E1C: .word ov11_02324E34
	arm_func_end ov11_02314D48

	arm_func_start ov11_02314E20
ov11_02314E20: ; 0x02314E20
	stmdb sp!, {r4, lr}
	ldr r1, _02314EF4 ; =ov11_02324E34
	mov r2, #0
	ldr r4, [r1]
	mov r3, #0x28
	b _02314EE4
_02314E38:
	mul r1, r2, r3
	add lr, r4, r1
	ldrh ip, [lr, #0x2c]
	cmp ip, #0xff
	bne _02314EE0
	ldrh ip, [r0]
	ldr r3, _02314EF4 ; =ov11_02324E34
	strh ip, [lr, #0x2c]
	ldr ip, [r3]
	ldr lr, [r0, #4]
	add ip, ip, r1
	str lr, [ip, #0x30]
	ldr ip, [r3]
	ldr lr, [r0, #8]
	add ip, ip, r1
	str lr, [ip, #0x34]
	ldr ip, [r3]
	ldr lr, [r0, #0xc]
	add ip, ip, r1
	str lr, [ip, #0x38]
	ldr ip, [r3]
	ldrh lr, [r0, #0x10]
	add ip, ip, r1
	strh lr, [ip, #0x3c]
	ldr ip, [r3]
	ldrh lr, [r0, #0x12]
	add ip, ip, r1
	strh lr, [ip, #0x3e]
	ldr ip, [r3]
	ldrh lr, [r0, #0x14]
	add ip, ip, r1
	strh lr, [ip, #0x40]
	ldr ip, [r3]
	ldrh lr, [r0, #0x16]
	add ip, ip, r1
	strh lr, [ip, #0x42]
	ldrh ip, [r0, #0x18]
	ldr r3, [r3]
	mov r0, r2
	add r1, r3, r1
	strh ip, [r1, #0x44]
	ldmia sp!, {r4, pc}
_02314EE0:
	add r2, r2, #1
_02314EE4:
	cmp r2, #0x40
	blt _02314E38
	mov r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_02314EF4: .word ov11_02324E34
	arm_func_end ov11_02314E20

	arm_func_start ov11_02314EF8
ov11_02314EF8: ; 0x02314EF8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02314FF4 ; =ov11_02324E34
	mov ip, #0
	ldr r5, [r2]
	mov r2, #0x28
	b _02314FE4
_02314F10:
	mul r3, ip, r2
	add r6, r5, r3
	ldrh r4, [r6, #0x2c]
	cmp r4, #0xff
	bne _02314FE0
	ldrh r5, [r0]
	ldr r4, _02314FF4 ; =ov11_02324E34
	and r2, r1, #0x1f
	strh r5, [r6, #0x2c]
	ldr r6, [r0, #4]
	ldr r5, [r4]
	add r6, r6, r2, lsl #12
	add r5, r5, r3
	str r6, [r5, #0x30]
	ldr r5, [r0, #8]
	mov lr, #0x1c00
	mla r6, r2, lr, r5
	ldr r2, [r4]
	mov r5, r1, lsl #0x1c
	add r2, r2, r3
	str r6, [r2, #0x34]
	ldr r6, [r0, #0xc]
	ldr r2, [r4]
	add r6, r6, r1
	and r6, r6, #1
	add r2, r2, r3
	str r6, [r2, #0x38]
	ldrh r6, [r0, #0x10]
	ldr lr, [r4]
	mov r2, r1, lsl #0x1b
	add r5, r6, r5, lsr #21
	add r1, lr, r3
	strh r5, [r1, #0x3c]
	ldrh lr, [r0, #0x12]
	ldr r1, [r4]
	add r2, lr, r2, lsr #21
	add r1, r1, r3
	strh r2, [r1, #0x3e]
	ldr r1, [r4]
	ldrh r2, [r0, #0x14]
	add r1, r1, r3
	strh r2, [r1, #0x40]
	ldr r1, [r4]
	ldrh r2, [r0, #0x16]
	add r1, r1, r3
	strh r2, [r1, #0x42]
	ldrh r2, [r0, #0x18]
	ldr r1, [r4]
	mov r0, ip
	add r1, r1, r3
	strh r2, [r1, #0x44]
	ldmia sp!, {r4, r5, r6, pc}
_02314FE0:
	add ip, ip, #1
_02314FE4:
	cmp ip, #0x50
	bne _02314F10
	mov r0, #0xff
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02314FF4: .word ov11_02324E34
	arm_func_end ov11_02314EF8

	arm_func_start ov11_02314FF8
ov11_02314FF8: ; 0x02314FF8
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x10]
	ldr r2, _0231513C ; =TRIG_TABLE
	cmp r1, #0x8000
	sublo r1, r1, #0x90
	addhs r1, r1, #0x90
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	sub r1, r1, #0x18
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	cmp r1, #0x18
	movlo r1, #0x30
	strloh r1, [r0, #0x12]
	ldrh r4, [r0, #0x14]
	mov r1, r4, lsl #0x1b
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #4
	mov r1, r1, lsl #2
	ldrsh r3, [r2, r1]
	add r1, r4, #1
	strh r1, [r0, #0x14]
	add r1, r3, r3, lsr #31
	mov r1, r1, asr #1
	cmp r4, #0x200
	mov lr, r1, lsl #0x10
	movhi r1, #0xff
	strhih r1, [r0]
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	ldmib r0, {r1, r4}
	mov r3, r1, asr #0xb
	add r3, r1, r3, lsr #20
	mov r5, r3, asr #0xc
	mov ip, r4, asr #0xb
	add r3, r4, ip, lsr #20
	cmp r5, #0x140
	mov r4, r3, asr #0xc
	bgt _023150A0
	mvn r3, #0x3f
	cmp r5, r3
	bge _023150B0
_023150A0:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023150B0:
	cmp r4, #0x1b8
	bgt _023150C4
	sub r3, r3, #0xc0
	cmp r4, r3
	bge _023150D4
_023150C4:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023150D4:
	ldrh r3, [r0, #0x10]
	ldrh r5, [r0, #0x12]
	mov r3, r3, asr #4
	mov ip, r3, lsl #1
	mov r3, ip, lsl #1
	ldrsh r4, [r2, r3]
	add r3, ip, #1
	mov ip, r3, lsl #1
	add r3, r4, lr, asr #16
	mul r4, r5, r3
	mov r3, r4, asr #0xb
	add r3, r4, r3, lsr #20
	add r1, r1, r3, asr #12
	str r1, [r0, #4]
	ldrsh r2, [r2, ip]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	mov r1, r1, asr #0xc
	add r1, r1, #0x80
	sub r1, ip, r1
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231513C: .word TRIG_TABLE
	arm_func_end ov11_02314FF8

	arm_func_start ov11_02315140
ov11_02315140: ; 0x02315140
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x12]
	ldr r2, _02315274 ; =TRIG_TABLE
	sub r1, r1, #0x18
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	cmp r1, #0x18
	movlo r1, #0x30
	strloh r1, [r0, #0x12]
	ldrh r4, [r0, #0x14]
	mov r1, r4, lsl #0x1b
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #4
	mov r1, r1, lsl #2
	ldrsh r3, [r2, r1]
	add r1, r4, #1
	strh r1, [r0, #0x14]
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, asr #2
	cmp r4, #0x180
	mov lr, r1, lsl #0x10
	movhi r1, #0xff
	strhih r1, [r0]
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	ldmib r0, {r1, r4}
	mov r3, r1, asr #0xb
	add r3, r1, r3, lsr #20
	mov r5, r3, asr #0xc
	mov ip, r4, asr #0xb
	add r3, r4, ip, lsr #20
	cmp r5, #0x140
	mov r4, r3, asr #0xc
	bgt _023151D8
	mvn r3, #0x3f
	cmp r5, r3
	bge _023151E8
_023151D8:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_023151E8:
	cmp r4, #0x100
	bgt _023151FC
	sub r3, r3, #0xc0
	cmp r4, r3
	bge _0231520C
_023151FC:
	mov r1, #0xff
	strh r1, [r0]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0231520C:
	ldrh r3, [r0, #0x10]
	ldrh r5, [r0, #0x12]
	mov r3, r3, asr #4
	mov ip, r3, lsl #1
	mov r3, ip, lsl #1
	ldrsh r4, [r2, r3]
	add r3, ip, #1
	mov ip, r3, lsl #1
	add r3, r4, lr, asr #16
	mul r4, r5, r3
	mov r3, r4, asr #0xb
	add r3, r4, r3, lsr #20
	add r1, r1, r3, asr #12
	str r1, [r0, #4]
	ldrsh r2, [r2, ip]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	mov r1, r1, asr #0xc
	add r1, r1, #0x80
	sub r1, ip, r1
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315274: .word TRIG_TABLE
	arm_func_end ov11_02315140

	arm_func_start ov11_02315278
ov11_02315278: ; 0x02315278
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x108
	ldr r3, _023154F8 ; =ov11_023241D8
	add r2, sp, #0x88
	mov r8, r0
	mov r1, #0x40
_02315290:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _02315290
	ldr r3, _023154FC ; =ov11_02324258
	add r2, sp, #8
	mov r1, #0x40
_023152AC:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _023152AC
	ldr r1, [r8, #0xc]
	ldrh r0, [r8, #0x16]
	mov r1, r1, lsr #1
	rsb r1, r1, #0xa
	mov r2, r1, lsl #0x10
	mov r3, r0, lsr #2
	add r1, sp, #0
	mov r0, #0
	mov r4, r2, lsr #0x10
	and r7, r3, #0x3f
	bl ov11_022EB3C8
	ldrsh r3, [r8, #0x24]
	ldr r2, [sp]
	cmp r2, r3
	beq _0231531C
	ldrh r0, [r8]
	cmp r0, #1
	bne _0231531C
	ldr r1, [r8, #4]
	sub r0, r2, r3
	sub r0, r1, r0, lsl #12
	str r0, [r8, #4]
	ldr r0, [sp]
	strh r0, [r8, #0x24]
_0231531C:
	ldrh r2, [r8, #0x14]
	add r0, sp, #0x88
	mov r1, r7, lsl #1
	add r2, r2, #1
	strh r2, [r8, #0x14]
	ldrh r2, [r8, #0x16]
	ldr r6, _02315500 ; =TRIG_TABLE
	add r2, r2, #1
	strh r2, [r8, #0x16]
	ldrh r0, [r0, r1]
	ldmib r8, {r1, lr}
	mov r0, r0, asr #4
	mov r5, r0, lsl #1
	add r3, r5, #1
	ldrh r0, [r8]
	mov r2, r1, asr #0xb
	mov ip, lr, asr #0xb
	mov r5, r5, lsl #1
	add r2, r1, r2, lsr #20
	add ip, lr, ip, lsr #20
	mov r3, r3, lsl #1
	ldrsh r5, [r6, r5]
	cmp r0, #2
	mov r2, r2, asr #0xc
	mov ip, ip, asr #0xc
	ldrsh r6, [r6, r3]
	bhs _0231541C
	cmp r0, #0
	beq _0231539C
	cmp r0, #1
	beq _023153F8
	b _02315440
_0231539C:
	mvn r0, #0x2f
	cmp r2, r0
	addlt r0, r1, #0x154000
	strlt r0, [r8, #4]
	ldrltsh r0, [r8, #0x22]
	movlt r0, r0, lsl #0xc
	strlt r0, [r8, #8]
	mvn r0, #0xdf
	cmp ip, r0
	movlt r0, #0x118000
	strlt r0, [r8, #4]
	ldrltsh r0, [r8, #0x22]
	movlt r0, r0, lsl #0xc
	strlt r0, [r8, #8]
	cmp ip, #0
	ble _02315440
	ldr r0, [r8, #4]
	add r0, r0, #0x100000
	str r0, [r8, #4]
	ldrsh r0, [r8, #0x22]
	mov r0, r0, lsl #0xc
	str r0, [r8, #8]
	b _02315440
_023153F8:
	mvn r0, #0x5f
	cmp r2, r0
	bge _02315440
	add r0, r1, #0x170000
	str r0, [r8, #4]
	ldrsh r0, [r8, #0x22]
	mov r0, r0, lsl #0xc
	str r0, [r8, #8]
	b _02315440
_0231541C:
	mvn r0, #0x2f
	cmp r2, r0
	addlt r0, r1, #0x154000
	strlt r0, [r8, #4]
	mvn r0, #0xdf
	cmp ip, r0
	ldrlt r0, [r8, #8]
	addlt r0, r0, #0x1c0000
	strlt r0, [r8, #8]
_02315440:
	ldrh r0, [r8, #0x10]
	ldr ip, _02315500 ; =TRIG_TABLE
	ldrh r2, [r8, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [ip, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	ldr r3, [r8, #4]
	ldrsh r1, [ip, r1]
	add r0, r3, r0, asr #12
	str r0, [r8, #4]
	ldrh r0, [r8, #0x12]
	ldr ip, [r8, #8]
	add r2, sp, #8
	mul r3, r1, r0
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	sub r0, ip, r0, asr #12
	str r0, [r8, #8]
	mov r0, r7, lsl #1
	mov r1, r4
	ldrh r4, [r2, r0]
	mov r0, #0x1000
	bl _s32_div_f
	mov r1, #0xa
	mul r7, r0, r1
	mul r0, r5, r4
	mov r1, r7
	bl _s32_div_f
	ldr r2, [r8, #4]
	mov r1, r7
	add r2, r2, r0
	mul r0, r6, r4
	str r2, [r8, #4]
	bl _s32_div_f
	ldr r1, [r8, #8]
	sub r0, r1, r0
	str r0, [r8, #8]
	mov r0, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023154F8: .word ov11_023241D8
_023154FC: .word ov11_02324258
_02315500: .word TRIG_TABLE
	arm_func_end ov11_02315278

	arm_func_start ov11_02315504
ov11_02315504: ; 0x02315504
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, #0
	ldr r1, [r5, #4]
	sub r0, r4, #0x80000
	cmp r1, r0
	bls _02315540
	sub r0, r4, #0x60000
	cmp r1, r0
	movlo r0, #1
	strloh r0, [r5]
	ldrlo r0, [r5, #4]
	addlo r0, r0, #0x180000
	strlo r0, [r5, #4]
_02315540:
	ldrh r0, [r5]
	cmp r0, #0
	ldrh r0, [r5, #0x12]
	moveq r4, #0x20000
	rsbeq r4, r4, #0
	add r0, r0, #0x180
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	cmp r0, #0x7800
	subhi r0, r0, #0x180
	strhih r0, [r5, #0x12]
	ldrh r0, [r5, #0x12]
	cmp r0, #0x3c00
	bls _023155AC
	mov r0, #0x4000
	ldr r1, [r5, #8]
	rsb r0, r0, #0
	and r0, r1, r0
	str r0, [r5, #8]
	ldrh r0, [r5, #0x14]
	add r0, r0, #1
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x14]
	ldr r1, [r5, #8]
	mov r0, r0, lsl #0x1f
	add r0, r1, r0, lsr #18
	str r0, [r5, #8]
_023155AC:
	ldrh r0, [r5, #0x10]
	ldr ip, _023156B0 ; =TRIG_TABLE
	ldrh r2, [r5, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [ip, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	ldr r3, [r5, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r5, #4]
	ldrsh r1, [ip, r1]
	ldrh r0, [r5, #0x12]
	ldr r3, [r5, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r5, #8]
	ldrh r6, [r5]
	ldrsh r0, [r5, #0x20]
	mov r1, #1
	cmp r6, #1
	movhi r6, #1
	bl sub_0201F348
	ldr r0, [r5, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _023156B4 ; =ov11_02324E34
	ldr r0, [r5, #0x1c]
	ldr r1, [r1]
	mov r2, r6
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr ip, [r5, #0x1c]
	ldr r0, _023156B4 ; =ov11_02324E34
	ldrb r1, [ip, #0x3d]
	mov r3, #0x3f
	mov r2, #0x7e
	orr r1, r1, #4
	strb r1, [ip, #0x3d]
	ldr ip, [r5, #4]
	ldr r1, [r5, #0x1c]
	add r4, ip, r4
	mov r4, r4, lsr #0xc
	strh r4, [r1]
	ldr r0, [r0]
	ldr r4, [r5, #8]
	ldr r1, [r0, #0x24]
	ldr r0, [r5, #0x1c]
	add r1, r1, r4, lsr #12
	strh r1, [r0, #2]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strb r3, [r1, #0x3e]
	ldr r1, [r5, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023156B0: .word TRIG_TABLE
_023156B4: .word ov11_02324E34
	arm_func_end ov11_02315504

	arm_func_start ov11_023156B8
ov11_023156B8: ; 0x023156B8
	stmdb sp!, {r4, lr}
	ldr r1, _02315750 ; =ov11_02324E34
	ldrh r2, [r0, #0x12]
	ldr r1, [r1]
	ldr lr, _02315754 ; =TRIG_TABLE
	ldr r1, [r1, #0x24]
	add r1, r2, r1, lsl #8
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0x10]
	ldrh r3, [r0, #0x12]
	ldr r4, [r0, #4]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	mov r1, r2, lsl #1
	ldrsh ip, [lr, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	mul r3, ip, r3
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	add r1, r4, r1, asr #12
	str r1, [r0, #4]
	ldrsh r2, [lr, r2]
	ldrh r1, [r0, #0x12]
	ldr ip, [r0, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r0, #8]
	ldrh r2, [r0, #0x14]
	add r1, r2, #1
	strh r1, [r0, #0x14]
	cmp r2, #0x100
	movhi r1, #0xff
	strhih r1, [r0]
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315750: .word ov11_02324E34
_02315754: .word TRIG_TABLE
	arm_func_end ov11_023156B8

	arm_func_start ov11_02315758
ov11_02315758: ; 0x02315758
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x16]
	cmp r1, #0
	bne _023157AC
	ldr r2, [r0, #0xc]
	cmp r2, #0x480
	bls _02315794
	ldr r1, _0231581C ; =ov11_02324E34
	ldr r1, [r1]
	ldr r1, [r1, #0x28]
	mov r1, r1, lsl #4
	add r1, r1, #0x380
	sub r1, r2, r1
	str r1, [r0, #0xc]
	b _023157B4
_02315794:
	mov r1, #0x190000
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	mov r0, r1
	ldmia sp!, {r3, r4, r5, pc}
_023157AC:
	sub r1, r1, #1
	strh r1, [r0, #0x16]
_023157B4:
	ldrh r1, [r0, #0x10]
	ldr r5, [r0, #0xc]
	ldr r2, _0231581C ; =ov11_02324E34
	mov r3, r1, asr #4
	mov r4, r3, lsl #1
	add r3, r4, #1
	ldr lr, _02315820 ; =TRIG_TABLE
	mov ip, r4, lsl #1
	mov r3, r3, lsl #1
	ldr r4, [r2]
	ldrsh ip, [lr, ip]
	mov r5, r5, lsr #8
	ldrsh r2, [lr, r3]
	mul lr, ip, r5
	mul r3, r2, r5
	ldrh r5, [r0, #0x12]
	ldr ip, [r4, #0x24]
	add r2, lr, #0xa0000
	add r4, r5, ip, lsl #4
	sub r1, r1, r4
	strh r1, [r0, #0x10]
	str r2, [r0, #4]
	rsb r1, r3, #0x80000
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0231581C: .word ov11_02324E34
_02315820: .word TRIG_TABLE
	arm_func_end ov11_02315758

	arm_func_start ov11_02315824
ov11_02315824: ; 0x02315824
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	add r1, sp, #8
	mov r0, #0
	bl ov11_022EB3C8
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	beq _023158AC
	sub r0, r0, #1
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x10]
	ldr r3, _02315984 ; =TRIG_TABLE
	ldr r4, [r5, #4]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r2, [r3, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	add r0, r2, r2, lsl #1
	mov r2, r0, lsl #0xe
	ldrsh r1, [r3, r1]
	mov r0, r2, asr #0xa
	add r0, r2, r0, lsr #21
	add r2, r4, r0, asr #11
	add r0, r1, r1, lsl #1
	str r2, [r5, #4]
	mov r1, r0, lsl #0xe
	mov r0, r1, asr #0xa
	ldr r2, [r5, #8]
	add r0, r1, r0, lsr #21
	sub r0, r2, r0, asr #11
	str r0, [r5, #8]
_023158AC:
	ldr r2, [r5, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r2
	beq _023158D4
	ldr r1, [r5, #4]
	sub r0, r0, r2
	sub r0, r1, r0, lsl #12
	str r0, [r5, #4]
	ldr r0, [sp, #8]
	str r0, [r5, #0xc]
_023158D4:
	ldrsh r0, [r5, #0x20]
	ldrh r4, [r5]
	mov r1, #1
	bl sub_0201F348
	ldr r0, [r5, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _02315988 ; =ov11_02324E34
	ldr r0, [r5, #0x1c]
	ldr r1, [r1]
	mov r2, r4
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr r1, [r5, #0x1c]
	mov lr, #0x18
	ldrb r0, [r1, #0x3d]
	mov ip, #0xff
	rsb r3, r4, #0x3f
	orr r0, r0, #4
	strb r0, [r1, #0x3d]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r1, r1, lsr #0xc
	strh r1, [r0]
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x1c]
	mov r1, r1, lsr #0xc
	strh r1, [r0, #2]
	ldr r0, [r5, #0x1c]
	rsb r2, r4, #0x40
	strh lr, [r0, #8]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strh lr, [r1, #0xa]
	ldr r1, [r5, #0x1c]
	strb ip, [r1, #0x2f]
	ldr r1, [r5, #0x1c]
	strb r3, [r1, #0x3e]
	ldr r1, [r5, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315984: .word TRIG_TABLE
_02315988: .word ov11_02324E34
	arm_func_end ov11_02315824

	arm_func_start ov11_0231598C
ov11_0231598C: ; 0x0231598C
	ldr r1, _023159AC ; =ov11_02324E34
	ldr r1, [r1]
	cmp r1, #0
	addne r2, r1, #0x2c
	moveq r0, #0
	movne r1, #0x28
	mlane r0, r1, r0, r2
	bx lr
	.align 2, 0
_023159AC: .word ov11_02324E34
	arm_func_end ov11_0231598C

	arm_func_start ov11_023159B0
ov11_023159B0: ; 0x023159B0
	ldr r2, _023159C8 ; =ov11_02324E34
	mov r1, #0x28
	ldr r2, [r2]
	add r2, r2, #0x2c
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_023159C8: .word ov11_02324E34
	arm_func_end ov11_023159B0

	arm_func_start ov11_023159CC
ov11_023159CC: ; 0x023159CC
	ldr r2, _023159E4 ; =ov11_02324E34
	ldr r3, [r2]
	str r0, [r3, #0x24]
	ldr r0, [r2]
	str r1, [r0, #0x28]
	bx lr
	.align 2, 0
_023159E4: .word ov11_02324E34
	arm_func_end ov11_023159CC

	arm_func_start ov11_023159E8
ov11_023159E8: ; 0x023159E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r3, _02315A98 ; =ov11_02324E34
	ldr r3, [r3]
	cmp r3, #0
	beq _02315A90
	add r4, r3, #0x2c
	mov r3, #0x28
	mla r4, r2, r3, r4
	mov r2, r0, asr #7
	add r0, r0, r2, lsr #24
	mov r2, r1, asr #7
	mov r3, r0, asr #8
	add r0, r1, r2, lsr #24
	mov r1, r3, lsl #0xc
	mov r0, r0, asr #8
	str r1, [r4, #4]
	mov r0, r0, lsl #0xc
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	mov r2, #0xa0000
	str r0, [sp]
	ldr r3, [r4, #8]
	mov r0, #0
	mov r1, #0x80000
	str r3, [sp, #4]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldmib r4, {r0, r1}
	sub r0, r0, #0xa0000
	rsb r1, r1, #0x80000
	bl FX_Atan2Idx
	strh r0, [r4, #0x10]
	add r0, sp, #0xc
	add r1, sp, #0
	bl VEC_Distance
	mov r1, r0, asr #3
	add r0, r0, r1, lsr #28
	mov r0, r0, asr #4
	str r0, [r4, #0xc]
_02315A90:
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315A98: .word ov11_02324E34
	arm_func_end ov11_023159E8

	arm_func_start ov11_02315A9C
ov11_02315A9C: ; 0x02315A9C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r3, [r4, #4]
	ldrh r1, [r4, #0x10]
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	cmp r1, #0x4000
	mov r2, r0, asr #0xc
	mov r0, #0x1000
	beq _02315AEC
	cmp r1, #0xc000
	bne _02315AF8
	sub r0, r0, #0x1100
	cmp r2, r0
	addlt r0, r3, #0x300000
	strlt r0, [r4, #4]
	mov r0, #0x1000
	rsb r0, r0, #0
	b _02315AF8
_02315AEC:
	cmp r2, #0x200
	subgt r1, r3, #0x300000
	strgt r1, [r4, #4]
_02315AF8:
	ldrh r1, [r4, #0x10]
	ldr lr, _02315C00 ; =TRIG_TABLE
	ldrh r3, [r4, #0x12]
	mov r1, r1, asr #4
	mov r2, r1, lsl #1
	mov r1, r2, lsl #1
	ldrsh ip, [lr, r1]
	add r1, r2, #1
	mov r2, r1, lsl #1
	mul r3, ip, r3
	mov r1, r3, asr #0xb
	ldr ip, [r4, #4]
	add r1, r3, r1, lsr #20
	add r1, ip, r1, asr #12
	str r1, [r4, #4]
	ldrsh r2, [lr, r2]
	ldrh r1, [r4, #0x12]
	ldr ip, [r4, #8]
	mul r3, r2, r1
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r4, #8]
	ldrh r1, [r4, #0x16]
	cmp r1, #0
	subne r1, r1, #1
	strneh r1, [r4, #0x16]
	ldrne r1, [r4, #8]
	addne r0, r1, r0
	strne r0, [r4, #8]
	ldrsh r0, [r4, #0x20]
	ldrh r5, [r4]
	mov r1, #1
	bl sub_0201F348
	ldr r0, [r4, #0x1c]
	mov r3, #0
	strb r3, [r0, #0x3c]
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _02315C04 ; =ov11_02324E34
	ldr r0, [r4, #0x1c]
	ldr r1, [r1]
	mov r2, r5
	ldr r1, [r1, #0xcb0]
	bl sub_0201E7D8
	ldr ip, [r4, #0x1c]
	mov r3, #0x3f
	ldrb r1, [ip, #0x3d]
	mov r2, #0x7e
	mov r0, #0
	orr r1, r1, #4
	strb r1, [ip, #0x3d]
	ldr ip, [r4, #4]
	ldr r1, [r4, #0x1c]
	mov ip, ip, lsr #0xc
	strh ip, [r1]
	ldr ip, [r4, #8]
	ldr r1, [r4, #0x1c]
	mov ip, ip, lsr #0xc
	strh ip, [r1, #2]
	ldr r1, [r4, #0x1c]
	strb r3, [r1, #0x3e]
	ldr r1, [r4, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02315C00: .word TRIG_TABLE
_02315C04: .word ov11_02324E34
	arm_func_end ov11_02315A9C

	arm_func_start ov11_02315C08
ov11_02315C08: ; 0x02315C08
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	ldr r3, [r8, #4]
	ldrh r1, [r8, #0x10]
	mov r0, r3, asr #0xb
	add r0, r3, r0, lsr #20
	cmp r1, #0x4000
	mov r2, r0, asr #0xc
	beq _02315C4C
	cmp r1, #0xc000
	bne _02315C58
	mvn r0, #0xff
	cmp r2, r0
	addle r0, r3, #0x300000
	strle r0, [r8, #4]
	b _02315C58
_02315C4C:
	cmp r2, #0x200
	subge r0, r3, #0x300000
	strge r0, [r8, #4]
_02315C58:
	ldrh r0, [r8, #0x10]
	ldr r4, _02315E18 ; =TRIG_TABLE
	ldrh r2, [r8, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [r4, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r0, r3, r2
	mov r2, r0, lsl #1
	mov r0, r2, asr #0xb
	ldr r3, [r8, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r8, #4]
	ldrsh r1, [r4, r1]
	ldrh r0, [r8, #0x12]
	ldr r3, [r8, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r8, #8]
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r8, #0x16]
	bne _02315CDC
	ldrh r0, [r8, #0x12]
	cmp r0, #0x4800
	addlo r0, r0, #0x200
	strloh r0, [r8, #0x12]
_02315CDC:
	ldrh r0, [r8, #0x16]
	ldr r6, [r8, #4]
	ldr r4, [r8, #8]
	mov r0, r0, lsl #1
	rsb r0, r0, #0x40
	mov r0, r0, lsl #0x10
	movs r7, r0, asr #0x10
	mov r1, r6, asr #0xb
	add r2, r6, r1, lsr #20
	mov r3, r4, asr #0xb
	ldrsh r0, [r8, #0x20]
	ldrh r5, [r8]
	mov r1, #1
	movmi r7, #0
	mov r6, r2, asr #0xc
	add r4, r4, r3, lsr #20
	bl sub_0201F348
	ldr r0, [r8, #0x1c]
	mov r1, #5
	strb r1, [r0, #0x3c]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _02315E1C ; =ov11_02324E34
	ldr r0, [r8, #0x1c]
	ldr r1, [r1]
	mov r2, r5
	ldr r1, [r1, #0xcb0]
	mov r3, #0x8000
	bl sub_0201E7D8
	sub r1, r7, #1
	cmp r6, #0x100
	ldr r0, [r8, #0x1c]
	mov r1, r1, lsl #2
	strb r1, [r0, #0x2f]
	ldr r3, [r8, #0x1c]
	mvnge r6, #0xff
	ldrb r2, [r3, #0x3d]
	mov r1, r6, lsl #0x10
	add r0, r7, r7, lsr #31
	orr r2, r2, #4
	strb r2, [r3, #0x3d]
	add r3, r6, #0x100
	ldr r2, [r8, #0x1c]
	mov r1, r1, asr #0x10
	strh r1, [r2]
	mov r0, r0, asr #1
	rsb r2, r0, r4, asr #12
	mov r2, r2, lsl #0x10
	add r0, r0, r4, asr #12
	mov r0, r0, lsl #0x10
	ldr r5, [r8, #0x1c]
	mov r6, r2, asr #0x10
	strh r6, [r5, #2]
	mov r3, r3, lsl #0x10
	mov r5, r3, asr #0x10
	ldr r2, [r8, #0x1c]
	mov r4, r0, asr #0x10
	strh r5, [r2, #4]
	ldr r2, [r8, #0x1c]
	mov r3, #0x3e
	strh r6, [r2, #6]
	ldr r2, [r8, #0x1c]
	strh r1, [r2, #8]
	ldr r1, [r8, #0x1c]
	mov r2, #0x7e
	strh r4, [r1, #0xa]
	ldr r0, [r8, #0x1c]
	strh r5, [r0, #0xc]
	ldr r0, [r8, #0x1c]
	strh r4, [r0, #0xe]
	ldr r1, [r8, #0x1c]
	mov r0, #0
	strb r3, [r1, #0x3e]
	ldr r1, [r8, #0x1c]
	strh r2, [r1, #0x2a]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02315E18: .word TRIG_TABLE
_02315E1C: .word ov11_02324E34
	arm_func_end ov11_02315C08

	arm_func_start ov11_02315E20
ov11_02315E20: ; 0x02315E20
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _02315E68
	rsb r0, r0, #0x30
	mov r0, r0, lsl #2
	rsb r0, r0, #0
	str r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	rsb r0, r0, #0x30
	mov r0, r0, lsl #2
	rsb r0, r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	sub r0, r0, #1
	strh r0, [r4, #0x16]
	b _02315ECC
_02315E68:
	ldr r0, _02315ED4 ; =ov11_02324E34
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _02315EB4
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	mov r1, #3
	bl _s32_div_f
	sub r1, r1, #0xc4
	ldr r0, _02315ED4 ; =ov11_02324E34
	str r1, [r4, #8]
	ldr r2, [r0]
	mov r0, #0
	ldr r1, [r2, #0x24]
	sub r1, r1, #1
	str r1, [r2, #0x24]
	ldmia sp!, {r4, pc}
_02315EB4:
	ldr r0, [r4, #8]
	add r0, r0, #2
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #4
	str r0, [r4, #4]
_02315ECC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02315ED4: .word ov11_02324E34
	arm_func_end ov11_02315E20

	arm_func_start ov11_02315ED8
ov11_02315ED8: ; 0x02315ED8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	ldrh r0, [r5, #0x10]
	ldr r4, _02316010 ; =TRIG_TABLE
	ldrh r2, [r5, #0x12]
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	mov r0, r1, lsl #1
	ldrsh r3, [r4, r0]
	add r0, r1, #1
	mov r1, r0, lsl #1
	mul r2, r3, r2
	mov r0, r2, asr #0xb
	ldr r3, [r5, #4]
	add r0, r2, r0, lsr #20
	add r0, r3, r0, asr #12
	str r0, [r5, #4]
	ldrsh r1, [r4, r1]
	ldrh r0, [r5, #0x12]
	ldr r3, [r5, #8]
	mul r2, r1, r0
	mov r0, r2, asr #0xb
	add r0, r2, r0, lsr #20
	sub r0, r3, r0, asr #12
	str r0, [r5, #8]
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x16]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #25
	add r1, r1, r0, ror #25
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r4, r0, asr #2
	cmp r4, #0x10
	ldrsh r0, [r5, #0x20]
	mov r1, #1
	rsbhi r4, r4, #0x20
	bl sub_0201F348
	mov r2, #0
	ldr r1, [r5, #0x1c]
	ldr r0, _02316014 ; =ov11_02324E34
	strb r2, [r1, #0x3c]
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r5, #0x1c]
	ldr r1, [r1, #0xcb0]
	mov r3, r2
	bl sub_0201E7D8
	ldr r3, [r5, #0x1c]
	mov r0, #6
	mul r1, r4, r0
	ldrb r2, [r3, #0x3d]
	add r1, r1, #0x80
	orr r0, r2, #4
	strb r0, [r3, #0x3d]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	mov r2, r2, lsr #0xc
	strh r2, [r0]
	ldr r2, [r5, #8]
	ldr r0, [r5, #0x1c]
	mov r2, r2, lsr #0xc
	strh r2, [r0, #2]
	ldr r0, [r5, #0x1c]
	strb r1, [r0, #0x2f]
	ldr r0, [r5, #0x1c]
	mov r1, #0x3f
	strb r1, [r0, #0x3e]
	ldr r0, [r5, #0x1c]
	mov r1, #0x7e
	strh r1, [r0, #0x2a]
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02316010: .word TRIG_TABLE
_02316014: .word ov11_02324E34
	arm_func_end ov11_02315ED8

	arm_func_start ov11_02316018
ov11_02316018: ; 0x02316018
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r1, [r0, #0x12]
	ldr r3, [r0, #4]
	add r1, r1, #0x40
	strh r1, [r0, #0x12]
	ldrh r2, [r0]
	mov r1, r3, asr #0xb
	add r1, r3, r1, lsr #20
	cmp r2, #0
	mov r3, r1, asr #0xc
	bne _02316094
	cmp r3, #8
	bgt _02316068
	ldrh r1, [r0, #0x10]
	cmp r1, #0xc000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_02316068:
	cmp r3, #0xf8
	blt _023160E0
	ldrh r1, [r0, #0x10]
	cmp r1, #0x4000
	bne _023160E0
	mov r2, #0
	ldr r1, _02316160 ; =ov11_02324E34
	strh r2, [r0, #0x12]
	ldr r1, [r1]
	str r2, [r1, #0x24]
	b _023160E0
_02316094:
	mvn r1, #0x5f
	cmp r3, r1
	bgt _023160BC
	ldrh r1, [r0, #0x10]
	cmp r1, #0xc000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_023160BC:
	cmp r3, #0x158
	blt _023160E0
	ldrh r1, [r0, #0x10]
	cmp r1, #0x4000
	moveq r2, #0
	ldreq r1, _02316160 ; =ov11_02324E34
	streqh r2, [r0, #0x12]
	ldreq r1, [r1]
	streq r2, [r1, #0x24]
_023160E0:
	ldrh r1, [r0, #0x10]
	ldr r2, _02316160 ; =ov11_02324E34
	ldr lr, _02316164 ; =TRIG_TABLE
	mov r1, r1, asr #4
	mov r3, r1, lsl #1
	mov r1, r3, lsl #1
	ldrsh ip, [lr, r1]
	ldrh r1, [r0, #0x12]
	ldr r4, [r2]
	add r3, r3, #1
	mul r1, ip, r1
	ldr ip, [r4, #0x24]
	ldr r5, [r0, #4]
	add r4, r1, ip, lsl #8
	mov r1, r4, asr #0xb
	add r1, r4, r1, lsr #20
	add r1, r5, r1, asr #12
	str r1, [r0, #4]
	mov r1, r3, lsl #1
	ldrsh r3, [lr, r1]
	ldrh r1, [r0, #0x12]
	ldr r2, [r2]
	ldr ip, [r0, #8]
	mul r1, r3, r1
	ldr r2, [r2, #0x24]
	add r2, r1, r2, lsl #8
	mov r1, r2, asr #0xb
	add r1, r2, r1, lsr #20
	sub r1, ip, r1, asr #12
	str r1, [r0, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02316160: .word ov11_02324E34
_02316164: .word TRIG_TABLE
	arm_func_end ov11_02316018

	arm_func_start ov11_02316168
ov11_02316168: ; 0x02316168
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x14
	bl OverlayIsLoaded
	cmp r0, #0
	beq _023161BC
	bl ov16_0238CCBC
	cmp r0, #0
	beq _023161BC
	bl ov16_0238CCBC
	cmp r0, #1
	str r0, [r4, #0xc]
	cmpne r0, #2
	beq _023161B0
	cmp r0, #3
	moveq r0, #0
	streqh r0, [r4, #0x16]
	b _023161B8
_023161B0:
	mov r0, #0
	strh r0, [r4, #0x16]
_023161B8:
	bl ov16_0238CCD8
_023161BC:
	ldrh r0, [r4, #0x16]
	add r0, r0, #1
	strh r0, [r4, #0x16]
	ldr r2, [r4, #0xc]
	cmp r2, #5
	addls pc, pc, r2, lsl #2
	b _02316324
_023161D8: ; jump table
	b _023161F0 ; case 0
	b _02316214 ; case 1
	b _0231624C ; case 2
	b _0231626C ; case 3
	b _023162F4 ; case 4
	b _0231631C ; case 5
_023161F0:
	ldr r0, [r4, #8]
	cmp r0, #0x80
	addlo r0, r0, #1
	strlo r0, [r4, #8]
	addhs r0, r2, #1
	strhs r0, [r4, #0xc]
	movhs r0, #0
	strhsh r0, [r4, #0x16]
	b _02316324
_02316214:
	ldrh r0, [r4, #0x10]
	cmp r0, #0x10
	addlo r0, r0, #1
	strloh r0, [r4, #0x10]
	movlo r0, #0
	strloh r0, [r4, #0x16]
	blo _02316324
	add r0, r2, #1
	str r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x100
	strh r0, [r4, #0x12]
	b _02316324
_0231624C:
	ldrh r1, [r4, #0x16]
	ldr r0, _0231632C ; =0x00002710
	cmp r1, r0
	addhi r0, r2, #1
	strhi r0, [r4, #0xc]
	movhi r0, #0
	strhih r0, [r4, #0x16]
	b _02316324
_0231626C:
	ldrh r0, [r4, #0x16]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x17
	add r0, r0, #0x80
	str r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	add r0, r0, #1
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x17
	add r0, r0, #0x80
	str r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xb4
	movlo r0, #0x180
	strlo r0, [r4, #4]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xb4
	bne _023162B8
	bl ov16_0238CCF0
_023162B8:
	ldrh r0, [r4, #0x16]
	cmp r0, #0xc4
	movhi r0, #0x180
	strhi r0, [r4, #8]
	ldrh r0, [r4, #0x16]
	cmp r0, #0xdc
	bls _02316324
	mov r0, #0x180
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	mov r0, #0
	add r1, r1, #1
	str r1, [r4, #0xc]
	strh r0, [r4, #0x16]
	b _02316324
_023162F4:
	mov r0, #0
	strh r0, [r4, #0x12]
	mov r0, #0x80
	str r0, [r4, #4]
	mov r0, #0x180
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _02316324
_0231631C:
	mov r0, #0
	strh r0, [r4, #0x12]
_02316324:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_0231632C: .word 0x00002710
	arm_func_end ov11_02316168

	arm_func_start ov11_02316330
ov11_02316330: ; 0x02316330
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _023163A4 ; =ov11_02324E34
	ldr r0, [r0]
	ldrb r0, [r0, #0xcac]
	cmp r0, #0
	bne _0231639C
	ldr r1, _023163A8 ; =ov11_02324B9C
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	add r0, sp, #0
	mov r1, #0x8000
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _023163AC ; =ov11_02324BB4
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _023163A4 ; =ov11_02324E34
	mov r2, #1
	ldr r3, [r1]
	str r0, [r3, #0xcb0]
	ldr r0, [r1]
	strb r2, [r0, #0xcac]
_0231639C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_023163A4: .word ov11_02324E34
_023163A8: .word ov11_02324B9C
_023163AC: .word ov11_02324BB4
	arm_func_end ov11_02316330

	arm_func_start ov11_023163B0
ov11_023163B0: ; 0x023163B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _023163DC ; =ov11_023248C0
	mov r6, #0
	mov r4, #0x1c
_023163C0:
	add r1, r6, #3
	mla r0, r1, r4, r5
	bl ov11_02314D48
	add r6, r6, #1
	cmp r6, #0x12
	blt _023163C0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_023163DC: .word ov11_023248C0
	arm_func_end ov11_023163B0

	arm_func_start ov11_023163E0
ov11_023163E0: ; 0x023163E0
	ldrh r2, [r0, #0x12]
	ldr r1, [r0, #8]
	cmp r1, r2, lsl #2
	movlo r1, #0xff
	strloh r1, [r0]
	sublo r0, r1, #0x100
	bxlo lr
	sub r1, r1, r2, lsl #2
	str r1, [r0, #8]
	ldrh r1, [r0, #0x12]
	ldr r2, [r0, #4]
	add r1, r2, r1
	str r1, [r0, #4]
	cmp r1, #0x16000
	ldrhi r1, [r0, #4]
	subhi r1, r1, #0x14000
	strhi r1, [r0, #4]
	mov r0, #0
	bx lr
	arm_func_end ov11_023163E0

	arm_func_start ov11_0231642C
ov11_0231642C: ; 0x0231642C
	ldr ip, _02316438 ; =ov11_0230D270
	ldr r0, _0231643C ; =ov11_02324BF8
	bx ip
	.align 2, 0
_02316438: .word ov11_0230D270
_0231643C: .word ov11_02324BF8
	arm_func_end ov11_0231642C

	arm_func_start ov11_02316440
ov11_02316440: ; 0x02316440
	ldr ip, _0231644C ; =ov11_0230D17C
	ldr r0, _02316450 ; =ov11_02324BF8
	bx ip
	.align 2, 0
_0231644C: .word ov11_0230D17C
_02316450: .word ov11_02324BF8
	arm_func_end ov11_02316440

	arm_func_start ov11_02316454
ov11_02316454: ; 0x02316454
	stmdb sp!, {r3, lr}
	mov r0, #0xc
	mov r1, #0xf
	bl MemAlloc
	ldr r1, _023164A8 ; =ov11_02324E78
	str r0, [r1]
	bl ov11_02316528
	mov r0, #0x10
	bl ov11_022E9D10
	ldr r1, _023164A8 ; =ov11_02324E78
	mov r3, #0
	ldr r2, [r1]
	mov r0, #1
	str r3, [r2, #8]
	ldr r2, [r1]
	strb r0, [r2, #6]
	ldr r2, [r1]
	strb r3, [r2, #7]
	ldr r1, [r1]
	str r3, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023164A8: .word ov11_02324E78
	arm_func_end ov11_02316454

	arm_func_start ov11_023164AC
ov11_023164AC: ; 0x023164AC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	bne _023164D8
	ldr r0, _02316524 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #8
	movne r0, #1
	strneb r0, [r1, #7]
	movne r0, #0
	ldmneia sp!, {r3, pc}
_023164D8:
	bl ov11_02316528
	ldr r0, _02316524 ; =ov11_02324E78
	mov r2, #8
	ldr r1, [r0]
	str r2, [r1]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02316504
	add r0, r1, #8
	bl sub_02047150
_02316504:
	ldr r0, _02316524 ; =ov11_02324E78
	ldr r0, [r0]
	bl MemFree
	ldr r0, _02316524 ; =ov11_02324E78
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316524: .word ov11_02324E78
	arm_func_end ov11_023164AC

	arm_func_start ov11_02316528
ov11_02316528: ; 0x02316528
	stmdb sp!, {r3, lr}
	ldr r1, _023165A0 ; =ov11_02324E78
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	strb r2, [r0, #4]
	ldr r2, [r1]
	sub r0, r3, #2
	str r3, [r2]
	ldr r1, [r1]
	strb r3, [r1, #5]
	bl ov11_022F4734
	mov r0, #1
	bl ov11_022EAFF8
	ldr r0, _023165A0 ; =ov11_02324E78
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0231658C
	bl GroundBg_FreeAll
	ldr r0, _023165A0 ; =ov11_02324E78
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _023165A0 ; =ov11_02324E78
	mov r1, #0
	str r1, [r0, #4]
_0231658C:
	ldr r0, _023165A0 ; =ov11_02324E78
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_023165A0: .word ov11_02324E78
	arm_func_end ov11_02316528

	arm_func_start ov11_023165A4
ov11_023165A4: ; 0x023165A4
	ldr r0, _023165C0 ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #5]
	bx lr
	.align 2, 0
_023165C0: .word ov11_02324E78
	arm_func_end ov11_023165A4

	arm_func_start ov11_023165C4
ov11_023165C4: ; 0x023165C4
	bx lr
	arm_func_end ov11_023165C4

	arm_func_start ov11_023165C8
ov11_023165C8: ; 0x023165C8
	stmdb sp!, {r3, lr}
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02316780
_023165E4: ; jump table
	b _02316608 ; case 0
	b _02316630 ; case 1
	b _02316780 ; case 2
	b _02316780 ; case 3
	b _02316780 ; case 4
	b _023166C0 ; case 5
	b _023166EC ; case 6
	b _02316738 ; case 7
	b _02316770 ; case 8
_02316608:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	mov r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r0, [r0]
	str r1, [r0]
_02316630:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r2, [r0]
	ldrb r1, [r2, #7]
	cmp r1, #0
	beq _02316688
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02316788 ; =ov11_02324E78
	mov r3, #1
	ldr r2, [r0]
	mov r1, #7
	strb r3, [r2, #5]
	ldr r0, [r0]
	str r1, [r0]
	b _02316780
_02316688:
	ldrb r1, [r2, #6]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r2, #5]
	beq _02316780
	mov r1, #1
	strb r1, [r2, #5]
	ldr r1, [r0]
	mov r2, #0
	strb r2, [r1, #6]
	ldr r0, [r0]
	mov r1, #2
	str r1, [r0]
	b _02316780
_023166C0:
	bl IsScreenFadeInProgress
	cmp r0, #0
	ldrne r0, _02316788 ; =ov11_02324E78
	movne r1, #1
	ldrne r0, [r0]
	strneb r1, [r0, #5]
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #6
	ldr r0, [r0]
	str r1, [r0]
_023166EC:
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	cmp r0, #0
	ldreqb r0, [r1, #6]
	cmpeq r0, #0
	moveq r0, #0
	streqb r0, [r1, #5]
	beq _02316780
	mov r0, #0x10
	bl ov11_022E9CB0
	ldr r0, _02316788 ; =ov11_02324E78
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #5]
	b _02316780
_02316738:
	bl IsScreenFadeInProgress
	cmp r0, #0
	bne _02316780
	ldr r0, _02316788 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02316760
	add r0, r1, #8
	bl sub_02047150
_02316760:
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #8
	ldr r0, [r0]
	str r1, [r0]
_02316770:
	ldr r0, _02316788 ; =ov11_02324E78
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
_02316780:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316788: .word ov11_02324E78
	arm_func_end ov11_023165C8
	; 0x0231678C

	arm_func_start ov11_0231678C
ov11_0231678C: ; 0x0231678C
	stmdb sp!, {r3, lr}
	ldr r0, _02316838 ; =ov11_02324E78
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #2
	bne _023167E0
	mov r1, #1
	strb r1, [r2, #5]
	ldr r3, [r0]
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _023167CC
	ldr r1, _0231683C ; =ov11_02324BCC
	ldr r2, _02316840 ; =ov11_023168E0
	add r0, r3, #8
	bl sub_0204707C
_023167CC:
	ldr r0, _02316838 ; =ov11_02324E78
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
_023167E0:
	cmp r1, #3
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r2, #5]
	bl ov11_02316528
	mov r0, #0x2f4
	mov r1, #0xf
	bl MemAlloc
	ldr r2, _02316838 ; =ov11_02324E78
	ldr r1, _02316844 ; =ov11_02324BDC
	str r0, [r2, #4]
	bl GroundBg_Init
	ldr r0, _02316838 ; =ov11_02324E78
	ldr r1, _02316848 ; =ov11_02324C1C
	ldr r0, [r0, #4]
	mov r2, #0
	bl ov11_022EDE64
	ldr r0, _02316838 ; =ov11_02324E78
	mov r1, #4
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316838: .word ov11_02324E78
_0231683C: .word ov11_02324BCC
_02316840: .word ov11_023168E0
_02316844: .word ov11_02324BDC
_02316848: .word ov11_02324C1C
	arm_func_end ov11_0231678C

	arm_func_start ov11_0231684C
ov11_0231684C: ; 0x0231684C
	stmdb sp!, {r3, lr}
	ldr r0, _02316898 ; =ov11_02324E78
	ldr r1, [r0]
	ldr r1, [r1]
	cmp r1, #4
	bne _02316890
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	mov r0, #1
	bl ov11_022EF53C
	ldr r0, _02316898 ; =ov11_02324E78
	mov r3, #1
	ldr r2, [r0]
	mov r1, #5
	strb r3, [r2, #4]
	ldr r0, [r0]
	str r1, [r0]
_02316890:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02316898: .word ov11_02324E78
	arm_func_end ov11_0231684C

	arm_func_start ov11_0231689C
ov11_0231689C: ; 0x0231689C
	stmdb sp!, {r3, lr}
	ldr r0, _023168DC ; =ov11_02324E78
	ldr r1, [r0]
	ldrb r1, [r1, #4]
	cmp r1, #0
	ldrne r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_022EFB70
	ldr r0, _023168DC ; =ov11_02324E78
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x10
	strb r2, [r1, #4]
	bl ov11_022E9C98
	ldmia sp!, {r3, pc}
	.align 2, 0
_023168DC: .word ov11_02324E78
	arm_func_end ov11_0231689C

	arm_func_start ov11_023168E0
ov11_023168E0: ; 0x023168E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl GetGameMode
	mov r4, r0
	mov r0, #0x400
	mov r1, #0xf
	bl MemAlloc
	mov r6, r0
	cmp r4, #2
	mov r7, #0
	bne _023169FC
	ldr r4, _02316A2C ; =ov11_02324C38
	ldr r5, _02316A30 ; =ov11_02324C30
	mov r8, r7
	mov fp, #5
_0231691C:
	mov r0, r8, lsl #0x18
	mov r0, r0, asr #0x18
	bl IsAcceptedMissionSlotEmpty
	cmp r0, #0
	bne _023169F0
	mov r0, r8, lsl #0x18
	mov r0, r0, asr #0x18
	bl GetAcceptedMission
	mov sb, r0
	ldrb r0, [sb]
	mov r1, fp
	mov r2, r7
	cmp r0, #5
	moveq r3, r5
	movne r3, r4
	mov r0, sl
	bl DrawTextInWindow
	mov r0, r6
	mov r1, #0x400
	mov r2, sb
	bl sub_02061F44
	mov r0, sl
	mov r1, #0x12
	mov r2, r7
	mov r3, r6
	bl DrawTextInWindow
	mov r0, r6
	mov r1, #0x400
	mov r2, sb
	bl sub_02061F90
	mov r0, sl
	mov r1, #0x40
	add r2, r7, #0xa
	mov r3, r6
	bl DrawTextInWindow
	ldrb r1, [sb, #1]
	cmp r1, #0xe
	bne _023169CC
	ldr r3, _02316A34 ; =0x00003C2A
	mov r0, sl
	mov r1, #0xcc
	add r2, r7, #0xa
	bl AppendStandardStringToMission
	b _023169EC
_023169CC:
	add r0, sb, #4
	bl GetMissionRankWithCapAndModifiersAndCap
	bl sub_02062DB4
	mov r3, r0
	mov r0, sl
	mov r1, #0xcc
	add r2, r7, #0xa
	bl DrawTextInWindow
_023169EC:
	add r7, r7, #0x14
_023169F0:
	add r8, r8, #1
	cmp r8, #8
	blt _0231691C
_023169FC:
	cmp r7, #0
	bne _02316A18
	ldr r3, _02316A38 ; =0x000008DF
	mov r0, sl
	mov r1, #5
	mov r2, #0x48
	bl AppendStandardStringToMission
_02316A18:
	mov r0, sl
	bl UpdateWindow
	mov r0, r6
	bl MemFree
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02316A2C: .word ov11_02324C38
_02316A30: .word ov11_02324C30
#if defined(EUROPE)
_02316A34: .word 0x00003C2C
_02316A38: .word 0x000008DF
#elif defined(JAPAN)
_02316A34: .word 0x00003868
_02316A38: .word 0x00001D37
#else
_02316A34: .word 0x00003C2A
_02316A38: .word 0x000008DF
#endif
	arm_func_end ov11_023168E0

	.bss
	.global ov11_02324E80
ov11_02324E80:
	.space 0x14
	.global ov11_02324E94
ov11_02324E94:
	.space 0x10
	.global ov11_02324EA4
ov11_02324EA4:
	.space 0x10
	.global LOCK_NOTIFY_ARRAY
LOCK_NOTIFY_ARRAY:
	.space 0x18
	.global ov11_02324ECC
ov11_02324ECC:
	.space 0x50
	.global ov11_02324F1C
ov11_02324F1C:
	.space 0x54
	.global ov11_02324F70
ov11_02324F70:
	.space 0x4
	.global ov11_02324F74
ov11_02324F74:
	.space 0xE
	.global ov11_02324F82
ov11_02324F82:
	.space 0x8
	.global ov11_02324F8A
ov11_02324F8A:
	.space 0xA
	.global ov11_02324F94
ov11_02324F94:
	.space 0x4
	.global ov11_02324F98
ov11_02324F98:
	.space 0x4
	.global ov11_02324F9C
ov11_02324F9C:
	.space 0x4
	.global ov11_02324FA0
ov11_02324FA0:
	.space 0x20
	.global GROUND_MEMORY_ARENA_1
GROUND_MEMORY_ARENA_1:
	.space 0x64000
	.global ov11_02388FC0
ov11_02388FC0:
	.space 0x14
	.global ov11_02388FD4
ov11_02388FD4:
	.space 0x4
	.global ov11_02388FD8
ov11_02388FD8:
	.space 0x40
	.global ov11_02389018
ov11_02389018:
	.space 0x44
	.global ov11_0238905C
ov11_0238905C:
	.space 0x44
	.global ov11_023890A0
ov11_023890A0:
	.space 0x44
	.global ov11_023890E4
ov11_023890E4:
	.space 0x44
	.global ov11_02389128
ov11_02389128:
	.space 0x44
	.global ov11_0238916C
ov11_0238916C:
	.space 0x88
	.global ov11_023891F4
ov11_023891F4:
	.space 0x4
	.global ov11_023891F8
ov11_023891F8:
	.space 0xA8
	.global ov11_023892A0
ov11_023892A0:
	.space 0xD80
	.global ov11_0238A020
ov11_0238A020:
	.space 0x14
	.global ov11_0238A034
ov11_0238A034:
	.space 0xC
	.global ov11_0238A040
ov11_0238A040:
	.space 0xC
	.global ov11_0238A04C
ov11_0238A04C:
	.space 0x4
	.global ov11_0238A050
ov11_0238A050:
	.space 0xC
	.global ov11_0238A05C
ov11_0238A05C:
	.space 0xC
	.global ov11_0238A068
ov11_0238A068:
	.space 0xC
	.global ov11_0238A074
ov11_0238A074:
	.space 0x4
	.global ov11_0238A078
ov11_0238A078:
	.space 0x8
	.global ov11_0238A080
ov11_0238A080:
	.space 0x4
	.global ov11_0238A084
ov11_0238A084:
	.space 0x4
	.global ov11_0238A088
ov11_0238A088:
	.space 0x4
	.global ov11_0238A08C
ov11_0238A08C:
	.space 0x4
	.global ov11_0238A090
ov11_0238A090:
	.space 0x4
	.global ov11_0238A094
ov11_0238A094:
	.space 0x4
	.global ov11_0238A098
ov11_0238A098:
	.space 0x98
	.global ov11_0238A130
ov11_0238A130:
	.space 0x4
	.global ov11_0238A134
ov11_0238A134:
	.space 0xC
