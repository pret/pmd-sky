	.include "asm/macros.inc"
	.include "main_0207F894.inc"

	.text

    arm_func_start Std_CopyLString
Std_CopyLString: ; 0x02085244
	stmdb sp!, {r4, lr}
	sub ip, r2, #1
	mov r4, r1
	cmp ip, #0
	mov lr, #0
	ble _02085280
_0208525C:
	ldrsb r3, [r4]
	strb r3, [r0, lr]
	ldrsb r3, [r4]
	cmp r3, #0
	beq _02085280
	add lr, lr, #1
	cmp lr, ip
	add r4, r4, #1
	blt _0208525C
_02085280:
	sub r3, r2, #1
	cmp lr, r3
	blt _02085298
	cmp r2, #0
	movne r2, #0
	strneb r2, [r0, lr]
_02085298:
	mov r0, r1
	bl Std_GetStringLength
	ldmia sp!, {r4, pc}
	arm_func_end Std_CopyLString

	arm_func_start Std_GetStringLength
Std_GetStringLength: ; 0x020852A4
	ldrsb r1, [r0]
	mov r2, #0
	cmp r1, #0
	beq _020852C4
_020852B4:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _020852B4
_020852C4:
	mov r0, r2
	bx lr
	arm_func_end Std_GetStringLength

	arm_func_start Std_CompareString__020852CC
Std_CompareString__020852CC: ; 0x020852CC
	b _020852D8
_020852D0:
	add r0, r0, #1
	add r1, r1, #1
_020852D8:
	ldrsb r3, [r1]
	ldrsb r2, [r0]
	cmp r2, r3
	bne _020852F0
	cmp r2, #0
	bne _020852D0
_020852F0:
	sub r0, r2, r3
	bx lr
	arm_func_end Std_CompareString__020852CC

	arm_func_start Std_CompareNString
Std_CompareNString: ; 0x020852F8
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _02085330
	cmp r2, #0
	mov lr, #0
	ble _02085330
_02085310:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blt _02085310
_02085330:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end Std_CompareNString

	arm_func_start Std_TsScanf
Std_TsScanf: ; 0x02085338
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl Std_TvsScanf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end Std_TsScanf

	arm_func_start Stdi_IsSpace
Stdi_IsSpace: ; 0x02085360
	sub r3, r0, #9
	cmp r3, #0x17
	mov r0, #0
	bxhi lr
	ldr r1, _02085384 ; =0x0080001F
	mov r2, #1
	tst r1, r2, lsl r3
	movne r0, r2
	bx lr
	.align 2, 0
_02085384: .word 0x0080001F
	arm_func_end Stdi_IsSpace

	arm_func_start Stdi_FillBitset
Stdi_FillBitset: ; 0x02085388
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, r2
	ldmhsia sp!, {r3, r4, r5, pc}
	and r3, r2, #0x1f
	mov ip, #1
	mov r3, ip, lsl r3
	sub r5, r3, #1
	mvn ip, #0
_020853A8:
	and r3, r1, #0x1f
	mov lr, r1, lsr #5
	mov r4, ip, lsl r3
	add r1, lr, #1
	cmp r2, r1, lsl #5
	ldr r3, [r0, lr, lsl #2]
	andlo r4, r4, r5
	mov r1, r1, lsl #5
	orr r3, r3, r4
	cmp r1, r2
	str r3, [r0, lr, lsl #2]
	blo _020853A8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end Stdi_FillBitset

	arm_func_start Std_TvsScanf
Std_TvsScanf: ; 0x020853DC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov r8, r1
	ldrsb r4, [r8]
	mov sb, r0
	mov r0, #0
	str r0, [sp, #0xc]
	str r2, [sp]
	str sb, [sp, #0x10]
	str r0, [sp, #4]
	cmp r4, #0
	beq _02085AD4
_0208540C:
	mov r0, r4
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085460
	ldrsb r0, [r8]
	bl Stdi_IsSpace
	cmp r0, #0
	beq _0208543C
_0208542C:
	ldrsb r0, [r8, #1]!
	bl Stdi_IsSpace
	cmp r0, #0
	bne _0208542C
_0208543C:
	ldrsb r0, [sb]
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085AC8
_0208544C:
	ldrsb r0, [sb, #1]!
	bl Stdi_IsSpace
	cmp r0, #0
	bne _0208544C
	b _02085AC8
_02085460:
	cmp r4, #0x25
	beq _020854A0
	ldrsb r0, [sb]
	cmp r4, r0
	bne _02085AD4
	and r0, r4, #0xff
	eor r0, r0, #0x20
	sub r0, r0, #0xa1
	cmp r0, #0x3c
	bhs _02085494
	ldrsb r0, [sb, #1]!
	cmp r4, r0
	bne _02085AD4
_02085494:
	add sb, sb, #1
	add r8, r8, #1
	b _02085AC8
_020854A0:
	ldrsb r0, [r8, #1]
	cmp r0, #0x25
	bne _020854C0
	ldrsb r0, [sb]
	cmp r4, r0
	bne _02085AD4
	add r8, r8, #2
	b _02085AC8
_020854C0:
	ldrsb r0, [r8, #1]!
	mov sl, #0
	mov r5, sl
	cmp r0, #0x2a
	mov fp, sl
	mov r6, sl
	orreq r5, sl, #0x2000
	ldreqsb r0, [r8, #1]!
	mov r1, #0xa
	b _020854F4
_020854E8:
	mla r2, r6, r1, r0
	ldrsb r0, [r8, #1]!
	sub r6, r2, #0x30
_020854F4:
	cmp r0, #0x30
	blt _02085504
	cmp r0, #0x39
	ble _020854E8
_02085504:
	cmp r0, #0x68
	beq _02085518
	cmp r0, #0x6c
	beq _02085530
	b _02085544
_02085518:
	ldrsb r0, [r8, #1]!
	cmp r0, #0x68
	orrne r5, r5, #0x40
	orreq r5, r5, #0x100
	ldreqsb r0, [r8, #1]!
	b _02085544
_02085530:
	ldrsb r0, [r8, #1]!
	cmp r0, #0x6c
	orrne r5, r5, #0x20
	ldreqsb r0, [r8, #1]!
	orreq r5, r5, #0x80
_02085544:
	cmp r0, #0x69
	bgt _02085590
	cmp r0, #0x64
	blt _02085564
	beq _020855D8
	cmp r0, #0x69
	beq _020855E0
	b _02085AD4
_02085564:
	cmp r0, #0x5b
	bgt _02085584
	cmp r0, #0x58
	blt _02085AD4
	beq _020855FC
	cmp r0, #0x5b
	beq _020858D0
	b _02085AD4
_02085584:
	cmp r0, #0x63
	beq _020857D8
	b _02085AD4
_02085590:
	cmp r0, #0x6e
	bgt _020855A0
	beq _02085608
	b _02085AD4
_020855A0:
	sub r1, r0, #0x6f
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _02085AD4
_020855B0: ; jump table
	b _020855E8 ; case 0
	b _020855FC ; case 1
	b _02085AD4 ; case 2
	b _02085AD4 ; case 3
	b _020857D8 ; case 4
	b _02085AD4 ; case 5
	b _020855F0 ; case 6
	b _02085AD4 ; case 7
	b _02085AD4 ; case 8
	b _020855FC ; case 9
_020855D8:
	mov r4, #0xa
	b _0208562C
_020855E0:
	mvn r4, #0
	b _0208562C
_020855E8:
	mov r4, #8
	b _0208562C
_020855F0:
	orr r5, r5, #0x1000
	mov r4, #0xa
	b _0208562C
_020855FC:
	orr r5, r5, #0x1000
	mov r4, #0x10
	b _0208562C
_02085608:
	tst r5, #0x2000
	ldreq r0, [sp, #4]
	add r8, r8, #1
	subeq r0, r0, #1
	streq r0, [sp, #4]
	ldr r0, [sp, #0x10]
	sub sl, sb, r0
	mov fp, sl, asr #0x1f
	b _0208574C
_0208562C:
	ldrsb r7, [sb]
	add r8, r8, #1
	mov r0, r7
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085658
_02085644:
	ldrsb r7, [sb, #1]!
	mov r0, r7
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085644
_02085658:
	cmp r7, #0x2b
	orreq r5, r5, #2
	beq _02085670
	cmp r7, #0x2d
	bne _02085678
	orr r5, r5, #8
_02085670:
	ldrsb r7, [sb, #1]!
	b _02085658
_02085678:
	mvn r0, #0
	cmp r4, r0
	bne _020856A4
	cmp r7, #0x30
	movne r4, #0xa
	bne _020856A4
	ldrsb r0, [sb, #1]
	cmp r0, #0x78
	cmpne r0, #0x58
	moveq r4, #0x10
	movne r4, #8
_020856A4:
	cmp r4, #0x10
	cmpeq r7, #0x30
	bne _020856C0
	ldrsb r0, [sb, #1]
	cmp r0, #0x78
	cmpne r0, #0x58
	ldreqsb r7, [sb, #2]!
_020856C0:
	cmp r6, #0
	mvneq r6, #0x80000000
	cmp r6, #0
	mov r2, #0
	ble _0208572C
	mov ip, r4, asr #0x1f
_020856D8:
	sub r3, r7, #0x30
	cmp r3, #0xa
	blo _02085700
	sub r0, r3, #0x31
	cmp r0, #6
	sublo r3, r3, #0x27
	blo _02085700
	sub r3, r3, #0x11
	cmp r3, #6
	addlo r3, r3, #0xa
_02085700:
	cmp r3, r4
	bhs _0208572C
	ldrsb r7, [sb, #1]!
	add r2, r2, #1
	umull r1, r0, sl, r4
	mla r0, sl, ip, r0
	adds sl, r3, r1
	mla r0, fp, r4, r0
	adc fp, r0, #0
	cmp r2, r6
	blt _020856D8
_0208572C:
	cmp r2, #0
	beq _02085AD4
	tst r5, #8
	beq _02085744
	rsbs sl, sl, #0
	rsc fp, fp, #0
_02085744:
	mov r0, #1
	str r0, [sp, #0xc]
_0208574C:
	tst r5, #0x2000
	bne _02085AC8
	ldr r0, [sp, #4]
	tst r5, #0x100
	add r0, r0, #1
	str r0, [sp, #4]
	beq _02085780
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	strb sl, [r0]
	b _02085AC8
_02085780:
	tst r5, #0x40
	beq _020857A0
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	strh sl, [r0]
	b _02085AC8
_020857A0:
	tst r5, #0x80
	beq _020857C0
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	stmia r0, {sl, fp}
	b _02085AC8
_020857C0:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r0, #-4]
	str sl, [r0]
	b _02085AC8
_020857D8:
	mov r1, #1
	tst r5, #0x2000
	add r8, r8, #1
	mov r4, #0
	str r1, [sp, #0xc]
	bne _0208580C
	ldr r1, [sp]
	add r1, r1, #4
	str r1, [sp]
	ldr r4, [r1, #-4]
	ldr r1, [sp, #4]
	add r1, r1, #1
	str r1, [sp, #4]
_0208580C:
	cmp r0, #0x73
	bne _02085888
	ldrsb r5, [sb]
	cmp r6, #0
	mvneq r6, #0x80000000
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	beq _02085858
_02085830:
	ldrsb r5, [sb, #1]!
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085830
	b _02085858
_02085848:
	cmp r4, #0
	strneb r5, [r4], #1
	ldrsb r5, [sb, #1]!
	sub r6, r6, #1
_02085858:
	cmp r5, #0
	beq _02085878
	mov r0, r5
	bl Stdi_IsSpace
	cmp r0, #0
	bne _02085878
	cmp r6, #0
	bgt _02085848
_02085878:
	cmp r4, #0
	movne r0, #0
	strneb r0, [r4]
	b _02085AC8
_02085888:
	cmp r6, #0
	moveq r6, #1
	ldrsb r0, [sb]
	b _020858A8
_02085898:
	cmp r4, #0
	strneb r0, [r4], #1
	ldrsb r0, [sb, #1]!
	sub r6, r6, #1
_020858A8:
	cmp r0, #0
	beq _020858B8
	cmp r6, #0
	bgt _02085898
_020858B8:
	cmp r4, #0
	beq _02085AC8
	cmp r6, #0
	movgt r0, #0
	strgtb r0, [r4]
	b _02085AC8
_020858D0:
	mov sl, #0
	mov r3, #1
	add r1, sp, #0x14
	mov r0, sl
	mov r2, #0x20
	mov r7, sl
	mov fp, sl
	str r3, [sp, #8]
	bl MTi_CpuClear32
	ldrsb r0, [r8, #1]!
	cmp r0, #0x5e
	moveq r0, sl
	addeq r8, r8, #1
	streq r0, [sp, #8]
	ldrsb r0, [r8]
	cmp r0, #0x5d
	bne _02085938
	and r2, r0, #0xff
	mov r0, r2, lsr #5
	add r1, sp, #0x14
	ldr r4, [r1, r0, lsl #2]
	and r2, r2, #0x1f
	mov r3, #1
	orr r2, r4, r3, lsl r2
	str r2, [r1, r0, lsl #2]
	add r8, r8, #1
_02085938:
	add r4, sp, #0x14
_0208593C:
	ldrsb r0, [r8]
	cmp r0, #0
	cmpne r0, #0x5d
	bne _0208598C
	cmp fp, #0
	beq _0208597C
	add r4, sp, #0x14
	mov r3, r7, lsr #5
	ldr r2, [r4, r3, lsl #2]
	and r0, r7, #0x1f
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [r4, r3, lsl #2]
	ldr r0, [sp, #0x18]
	orr r0, r0, #0x2000
	str r0, [sp, #0x18]
_0208597C:
	ldrsb r0, [r8]
	cmp r0, #0x5d
	addeq r8, r8, #1
	b _02085A38
_0208598C:
	cmp fp, #0
	bne _020859CC
	cmp r7, #0
	beq _020859A8
	cmp r0, #0x2d
	moveq fp, #1
	beq _02085A30
_020859A8:
	and r0, r0, #0xff
	mov r3, r0, lsr #5
	ldr r2, [r4, r3, lsl #2]
	and r1, r0, #0x1f
	mov r0, #1
	orr r0, r2, r0, lsl r1
	str r0, [r4, r3, lsl #2]
	ldrb r7, [r8]
	b _02085A30
_020859CC:
	and r2, r0, #0xff
	cmp r7, r2
	bls _02085A18
	mov r1, r7, lsr #5
	ldr fp, [r4, r1, lsl #2]
	and r7, r7, #0x1f
	mov r3, #1
	orr r3, fp, r3, lsl r7
	str r3, [r4, r1, lsl #2]
	ldr r1, [sp, #0x18]
	mov r0, r2, lsr #5
	orr r1, r1, #0x2000
	str r1, [sp, #0x18]
	ldr r3, [r4, r0, lsl #2]
	and r2, r2, #0x1f
	mov r1, #1
	orr r1, r3, r1, lsl r2
	str r1, [r4, r0, lsl #2]
	b _02085A28
_02085A18:
	mov r1, r7
	add r2, r2, #1
	mov r0, r4
	bl Stdi_FillBitset
_02085A28:
	mov fp, #0
	mov r7, fp
_02085A30:
	add r8, r8, #1
	b _0208593C
_02085A38:
	mov r0, #1
	tst r5, #0x2000
	str r0, [sp, #0xc]
	bne _02085A64
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr sl, [r0, #-4]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02085A64:
	cmp r6, #0
	mvneq r6, #0x80000000
	ldrsb r0, [sb]
	add r3, sp, #0x14
	b _02085AAC
_02085A78:
	and r4, r0, #0xff
	mov r1, r4, lsr #5
	ldr r2, [r3, r1, lsl #2]
	and r1, r4, #0x1f
	mov r1, r2, lsr r1
	and r2, r1, #1
	ldr r1, [sp, #8]
	cmp r1, r2
	bne _02085ABC
	cmp sl, #0
	strneb r0, [sl], #1
	ldrsb r0, [sb, #1]!
	sub r6, r6, #1
_02085AAC:
	cmp r0, #0
	beq _02085ABC
	cmp r6, #0
	bgt _02085A78
_02085ABC:
	cmp sl, #0
	movne r0, #0
	strneb r0, [sl]
_02085AC8:
	ldrsb r4, [r8]
	cmp r4, #0
	bne _0208540C
_02085AD4:
	ldrsb r0, [sb]
	cmp r0, #0
	ldreq r0, [sp, #0xc]
	cmpeq r0, #0
	mvneq r0, #0
	streq r0, [sp, #4]
	ldr r0, [sp, #4]
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end Std_TvsScanf

