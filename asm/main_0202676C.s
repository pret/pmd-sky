	.include "asm/macros.inc"
	.include "main_0202676C.inc"

	.text

	arm_func_start DrawChar
DrawChar: ; 0x0202676C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
#ifdef JAPAN
	sub sp, sp, #0x34
	mov fp, r1
	ldr r1, [sp, #0x58]
	str r0, [sp, #4]
	mov sl, r2
	mov r5, r3
	str r1, [sp, #0x58]
	bl GetWindow
	ldr r1, _02026EA0 ; =_020AFD04
	mov r4, r0
	ldr r0, [r1, #4]
	cmp r0, #2
	blt _0202689C
	ldr r0, [sp, #4]
	mov r4, #1
	mov r1, fp
	mov r2, sl
	mov r3, r5
	str r4, [sp]
	bl sub_02026C68
	b _02026E98
_0202689C:
	mov r0, r5
	bl sub_02025C7C
	ldr r1, _02026EA4 ; =_022A92B4_JP
	str r0, [sp, #0x1c]
	ldrb r1, [r1]
	ldr sb, [r0]
	cmp r1, #0
	beq _020268D8
	ldrb r0, [r0, #0xa]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	str r0, [sp, #8]
	b _020268E0
_020268D8:
	mov r0, #0
	str r0, [sp, #8]
_020268E0:
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, #0xa]
	tst r0, #1
	beq _02026B70
	ldr r0, [sp, #4]
	bl sub_0202760C
	ldr r1, _02026EA0 ; =_020AFD04
	mov r0, r0, lsl #1
	ldr r2, _02026EA8 ; =_022A92B8_JP
	ldr r1, [r1, #4]
	str r0, [sp, #0x14]
	ldr r5, [r2, r1, lsl #2]
	b _02026920
_02026914:
	add sb, sb, #6
	add sl, sl, #1
	sub r5, r5, #1
_02026920:
	cmp sl, #0
	blt _02026914
	ldrb r1, [r4, #7]
	add r0, sl, r5
	cmp r0, r1, lsl #3
	mov r0, fp, asr #2
	add r7, fp, r0, lsr #29
	ldr r0, [sp, #4]
	rsbge r5, sl, r1, lsl #3
	mov r6, r7, asr #3
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02027624
#endif
	mov r1, sl, asr #2
	add r1, sl, r1, lsr #29
	ldrb r3, [r4, #6]
	mov r1, r1, asr #3
	mov r2, sl, lsr #0x1f
	mul r3, r1, r3
	rsb r1, r2, sl, lsl #29
	add r8, r3, r7, asr #3
	mov r7, fp, lsr #0x1f
	add r2, r2, r1, ror #29
	mov r1, r8, lsl #4
	add r8, r1, r2, lsl #1
	rsb r3, r7, fp, lsl #29
	add r1, r7, r3, ror #29
	add r3, r0, r8, lsl #2
	ldr r2, _02026EAC ; =_0209B408_JP
	mov r0, #0
	add r8, r2, r1, lsl #4
	str r0, [sp, #0x30]
	b _02026B60
_0202699C:
	ldrh r1, [sb, #2]
	ldrh r0, [sb]
	orrs ip, r0, r1, lsl #16
	beq _02026A68
	ldrb r0, [r4, #6]
	cmp r6, r0
	bge _02026A0C
	ldr r1, [r8]
	ldr r0, [r8, #8]
	mov fp, r3
	str r0, [sp, #0x20]
	and r2, ip, r1
	mov r7, #7
_020269D0:
	mov r0, r7, lsl #2
	rsb lr, r0, #0x1c
	ldr r0, _02026EB0_JP ; =_0209B32C_JP
	ldr r1, [r0, r7, lsl #2]
	ldr r0, [sp, #0x20]
	and r0, r1, r2, lsl r0
	mov r0, r0, lsr lr
	ands r0, r0, #0xff
	ldrneb r1, [fp]
	orrne r0, r0, #0x20
	orrne r0, r1, r0
	strneb r0, [fp]
	add fp, fp, #1
	subs r7, r7, #1
	bpl _020269D0
_02026A0C:
	ldrb r0, [r4, #6]
	sub r0, r0, #1
	cmp r6, r0
	bge _02026A68
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	and r1, ip, r1
	add r2, r3, #0x40
	mov r7, #7
_02026A30:
	mov fp, r7, lsl #2
	rsb ip, fp, #0x1c
	ldr fp, _02026EB0_JP ; =_0209B32C_JP
	ldr fp, [fp, r7, lsl #2]
	and fp, fp, r1, lsr r0
	mov fp, fp, lsr ip
	ands fp, fp, #0xff
	ldrneb ip, [r2]
	orrne fp, fp, #0x20
	orrne fp, ip, fp
	strneb fp, [r2]
	add r2, r2, #1
	subs r7, r7, #1
	bpl _02026A30
_02026A68:
	ldrh r7, [sb, #4]
	cmp r7, #0
	beq _02026B34
	ldrb r0, [r4, #6]
	sub r0, r0, #1
	cmp r6, r0
	bge _02026AD8
	ldr r1, [r8]
	ldr r0, [r8, #8]
	and r2, r7, r1
	str r0, [sp, #0x24]
	add fp, r3, #0x40
	mov ip, #7
_02026A9C:
	mov r0, ip, lsl #2
	rsb lr, r0, #0x1c
	ldr r0, _02026EB0_JP ; =_0209B32C_JP
	ldr r1, [r0, ip, lsl #2]
	ldr r0, [sp, #0x24]
	and r0, r1, r2, lsl r0
	mov r0, r0, lsr lr
	ands r0, r0, #0xff
	ldrneb r1, [fp]
	orrne r0, r0, #0x20
	orrne r0, r1, r0
	strneb r0, [fp]
	add fp, fp, #1
	subs ip, ip, #1
	bpl _02026A9C
_02026AD8:
	ldrb r0, [r4, #6]
	sub r0, r0, #2
	cmp r6, r0
	bge _02026B34
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	and r1, r7, r1
	add r2, r3, #0x80
	mov r7, #7
_02026AFC:
	mov fp, r7, lsl #2
	rsb ip, fp, #0x1c
	ldr fp, _02026EB0_JP ; =_0209B32C_JP
	ldr fp, [fp, r7, lsl #2]
	and fp, fp, r1, lsr r0
	mov fp, fp, lsr ip
	ands fp, fp, #0xff
	ldrneb ip, [r2]
	orrne fp, fp, #0x20
	orrne fp, ip, fp
	strneb fp, [r2]
	add r2, r2, #1
	subs r7, r7, #1
	bpl _02026AFC
_02026B34:
	add sl, sl, #1
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	adds r0, r1, r0, ror #29
	ldreq r0, [sp, #0x14]
	add r3, r3, #8
	addeq r3, r3, r0, lsl #2
	ldr r0, [sp, #0x30]
	add sb, sb, #6
	add r0, r0, #1
	str r0, [sp, #0x30]
_02026B60:
	ldr r0, [sp, #0x30]
	cmp r0, r5
	blt _0202699C
	b _02026E90
_02026B70:
	ldr r0, [sp, #4]
	bl sub_0202760C
	ldr r1, _02026EA0 ; =_020AFD04
	ldr r2, _02026EA8 ; =_022A92B8_JP
	ldr r1, [r1, #4]
	str r0, [sp, #0x28]
	cmp sl, #0
	ldr r5, [r2, r1, lsl #2]
	mov r6, #0
	bge _02026BB4
	mov r6, #1
	b _02026BAC
_02026BA0:
	add sb, sb, #6
	add sl, sl, #1
	sub r5, r5, #1
_02026BAC:
	cmp sl, #0
	blt _02026BA0
_02026BB4:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02026BD4
	cmp r6, #0
	subne r0, sb, #6
	strne r0, [sp, #0xc]
	streq sb, [sp, #0xc]
	b _02026BDC
_02026BD4:
	str sb, [sp, #0xc]
	mov r6, #0
_02026BDC:
	ldrb r1, [r4, #7]
	add r0, sl, r5
	cmp r0, r1, lsl #3
	rsbge r5, sl, r1, lsl #3
	and r1, fp, #7
	str r1, [sp, #0x18]
	rsb r1, r1, #7
	ldr r0, [sp, #4]
	str r1, [sp, #0x10]
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02027624
#endif
	mov r2, sl, lsr #0x1f
	rsb r1, r2, sl, lsl #29
	add r1, r2, r1, ror #29
	mov r2, fp, asr #2
	add r2, fp, r2, lsr #29
	mov r3, sl, asr #2
	add r3, sl, r3, lsr #29
	mov ip, r3, asr #3
	ldrb fp, [r4, #6]
	mov r3, #0
	mul fp, ip, fp
	add r2, fp, r2, asr #3
	mov r2, r2, lsl #4
	add r1, r2, r1, lsl #1
	add r1, r0, r1, lsl #2
	ldr r0, [sp, #0x18]
	add fp, r1, r0
	b _02026E0C
_02026C4C:
	cmp r6, #0
	mov r2, fp
	ldr r0, [sp, #0x10]
	beq _02026D0C
	ldr ip, [sp, #0x58]
	mov r1, #0
	and ip, ip, #0xff
	mov lr, r1
	str ip, [sp, #0x2c]
_02026C70:
	tst lr, #3
	ldreq ip, [sp, #0xc]
	ldreqh r7, [sb], #2
	ldreqh r8, [ip], #2
	streq ip, [sp, #0xc]
	movne r7, r7, lsl #0xc
	movne r8, r8, lsl #0xc
	movne r7, r7, lsr #0x10
	movne r8, r8, lsr #0x10
	tst r7, #0xf
	ldrne r1, [sp, #0x2c]
	strneb r1, [r2], #1
	movne r1, #1
	bne _02026CD8
	cmp r1, #0
	bne _02026CB8
	tst r8, #0xf
	beq _02026CD4
_02026CB8:
	ldrb ip, [r2]
	mov r1, #0
	cmp ip, #0
	moveq ip, #0x13
	streqb ip, [r2], #1
	addne r2, r2, #1
	b _02026CD8
_02026CD4:
	add r2, r2, #1
_02026CD8:
	subs r0, r0, #1
	add lr, lr, #1
	addmi r2, r2, #0x38
	movmi r0, #7
	cmp lr, #0xc
	blt _02026C70
	cmp r1, #0
	beq _02026DEC
	ldrb r0, [r2]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [r2]
	b _02026DEC
_02026D0C:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _02026DA8
	ldr ip, [sp, #0x58]
	mov r1, #0
	mov r6, r1
	and lr, ip, #0xff
_02026D28_JP:
	tst r6, #3
	ldreqh r7, [sb], #2
	movne r7, r7, lsl #0xc
	movne r7, r7, lsr #0x10
	tst r7, #0xf
	strneb lr, [r2], #1
	movne r1, #1
	bne _02026D70
	cmp r1, #0
	beq _02026D6C
	ldrb ip, [r2]
	mov r1, #0
	cmp ip, #0
	moveq ip, #0x13
	streqb ip, [r2], #1
	addne r2, r2, #1
	b _02026D70
_02026D6C:
	add r2, r2, #1
_02026D70:
	subs r0, r0, #1
	add r6, r6, #1
	addmi r2, r2, #0x38
	movmi r0, #7
	cmp r6, #0xc
	blt _02026D28_JP
	cmp r1, #0
	beq _02026DA0
	ldrb r0, [r2]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [r2]
_02026DA0:
	mov r6, #1
	b _02026DEC
_02026DA8:
	ldr r1, [sp, #0x58]
	mov ip, #0
	and r1, r1, #0xff
	mov lr, #7
_02026DB8:
	tst ip, #3
	ldreqh r7, [sb], #2
	add ip, ip, #1
	movne r7, r7, lsl #0xc
	movne r7, r7, lsr #0x10
	tst r7, #0xf
	strneb r1, [r2], #1
	addeq r2, r2, #1
	subs r0, r0, #1
	addmi r2, r2, #0x38
	movmi r0, lr
	cmp ip, #0xc
	blt _02026DB8
_02026DEC:
	add sl, sl, #1
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	adds r0, r1, r0, ror #29
	ldreq r0, [sp, #0x28]
	add fp, fp, #8
	addeq fp, fp, r0, lsl #3
	add r3, r3, #1
_02026E0C:
	cmp r3, r5
	blt _02026C4C
	cmp r6, #0
	beq _02026E90
	ldrb r0, [r4, #7]
	add r1, sl, r5
	cmp r1, r0, lsl #3
	bge _02026E90
	mov r3, #0
	mov r2, #0x13
	mov r1, #7
_02026E38_JP:
	tst r3, #3
	ldreq r0, [sp, #0xc]
	ldreqh r8, [r0], #2
	streq r0, [sp, #0xc]
	movne r0, r8, lsl #0xc
	movne r8, r0, lsr #0x10
	tst r8, #0xf
	beq _02026E6C
	ldrb r0, [fp]
	cmp r0, #0
	streqb r2, [fp], #1
	addne fp, fp, #1
	b _02026E70
_02026E6C:
	add fp, fp, #1
_02026E70:
	ldr r0, [sp, #0x10]
	add r3, r3, #1
	subs r0, r0, #1
	str r0, [sp, #0x10]
	strmi r1, [sp, #0x10]
	addmi fp, fp, #0x38
	cmp r3, #0xc
	blt _02026E38_JP
_02026E90:
	ldr r0, [sp, #0x1c]
	ldrsh r0, [r0, #6]
_02026E98:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02026EA0: .word _020AFD04
_02026EA4: .word _022A92B4_JP
_02026EA8: .word _022A92B8_JP
_02026EAC: .word _0209B408_JP
_02026EB0_JP: .word _0209B32C_JP
#else
	sub sp, sp, #0x2c
	str r0, [sp, #4]
	mov sl, r1
	mov r6, r2
	mov r7, r3
	ldr r5, [sp, #0x50]
	bl GetWindow
	ldr r1, _02026B14 ; =_020AFD04
	str r0, [sp, #0x18]
#ifdef EUROPE
	ldr r0, [r1, #4]
#else
	ldr r0, [r1, #8]
#endif
	cmp r0, #2
	blt _020267C0
	ldr r0, [sp, #4]
	mov r4, #1
	mov r1, sl
	mov r2, r6
	mov r3, r7
	str r4, [sp]
	bl sub_02026C68
	b _02026B0C
_020267C0:
	ldr r0, [sp, #4]
	add r1, sp, #0x24
	bl sub_020282C8
	mov r0, r7
	bl sub_02025C7C
	ldr r1, _02026B14 ; =_020AFD04
	str r0, [sp, #0x14]
	ldrb r1, [r1]
	add r4, r0, #4
	cmp r1, #0
	beq _02026804
	ldrb r0, [r0, #3]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	and fp, r0, #0xff
	b _02026808
_02026804:
	mov fp, #0
_02026808:
	ldr r0, _02026B14 ; =_020AFD04
	ldr r3, [sp, #0x24]
#ifdef EUROPE
	ldr r2, [r0, #4]
#else
	ldr r2, [r0, #8]
#endif
	ldr r1, _02026B18 ; =_022A7A5C
	sub r0, r3, #8
	cmp r6, #0
	str r0, [sp, #0x1c]
	ldr r7, [r1, r2, lsl #2]
	mov r8, #0
	bge _0202684C
	mov r8, #1
	b _02026844
_02026838:
	add r4, r4, #2
	add r6, r6, #1
	sub r7, r7, #1
_02026844:
	cmp r6, #0
	blt _02026838
_0202684C:
	cmp fp, #0
	beq _02026868
	cmp r8, #0
	subne r0, r4, #2
	strne r0, [sp, #8]
	streq r4, [sp, #8]
	b _02026870
_02026868:
	str r4, [sp, #8]
	mov r8, #0
_02026870:
	ldr r1, [sp, #0x28]
	add r0, r6, r7
	cmp r0, r1
	and sb, sl, #7
	subge r7, r1, r6
	rsb r1, sb, #7
	ldr r0, [sp, #4]
	str r1, [sp, #0xc]
	bl sub_0202760C
	mov r3, r6, lsr #0x1f
	ldr r1, [sp, #0x18]
	rsb r2, r3, r6, lsl #29
	add r2, r3, r2, ror #29
	mov r3, sl, asr #2
	add r3, sl, r3, lsr #29
	mov sl, r6, asr #2
	add sl, r6, sl, lsr #29
	ldrb r1, [r1, #6]
	mov sl, sl, asr #3
	mul r1, sl, r1
	add r1, r1, r3, asr #3
	mov r1, r1, lsl #4
	add r1, r1, r2, lsl #1
	add r0, r0, r1, lsl #2
	add sb, r0, sb
	mov r1, #0
	b _02026A88
_020268DC:
	mov ip, sb
	ldr r2, [sp, #0xc]
	cmp r8, #0
	beq _0202699C
	ldr sl, [sp, #8]
	mov r3, #0
	ldrh r0, [sl], #2
	str sl, [sp, #8]
	and sl, r5, #0xff
	ldrh lr, [r4], #2
	str r3, [sp, #0x10]
	str sl, [sp, #0x20]
_0202690C:
	tst lr, #1
	ldrne r3, [sp, #0x20]
	strneb r3, [ip], #1
	movne r3, #1
	bne _02026950
	cmp r3, #0
	bne _02026930
	tst r0, #1
	beq _0202694C
_02026930:
	ldrb sl, [ip]
	mov r3, #0
	cmp sl, #0
	moveq sl, #0x13
	streqb sl, [ip], #1
	addne ip, ip, #1
	b _02026950
_0202694C:
	add ip, ip, #1
_02026950:
	mov sl, lr, lsl #0xf
	mov lr, sl, lsr #0x10
	ldr sl, [sp, #0x10]
	subs r2, r2, #1
	mov r0, r0, lsl #0xf
	add sl, sl, #1
	mov r0, r0, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, #7
	str sl, [sp, #0x10]
	cmp sl, #0xc
	blt _0202690C
	cmp r3, #0
	beq _02026A68
	ldrb r0, [ip]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [ip]
	b _02026A68
_0202699C:
	cmp fp, #0
	beq _02026A2C
	ldrh r8, [r4], #2
	mov r3, #0
	mov lr, r3
	and r0, r5, #0xff
_020269B4:
	tst r8, #1
	strneb r0, [ip], #1
	movne r3, #1
	bne _020269EC
	cmp r3, #0
	beq _020269E8
	ldrb sl, [ip]
	mov r3, #0
	cmp sl, #0
	moveq sl, #0x13
	streqb sl, [ip], #1
	addne ip, ip, #1
	b _020269EC
_020269E8:
	add ip, ip, #1
_020269EC:
	subs r2, r2, #1
	mov r8, r8, lsl #0xf
	add lr, lr, #1
	mov r8, r8, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, #7
	cmp lr, #0xc
	blt _020269B4
	cmp r3, #0
	beq _02026A24
	ldrb r0, [ip]
	cmp r0, #0
	moveq r0, #0x13
	streqb r0, [ip]
_02026A24:
	mov r8, #1
	b _02026A68
_02026A2C:
	ldrh r3, [r4], #2
	mov r0, #0
	and sl, r5, #0xff
	mov lr, #7
_02026A3C:
	tst r3, #1
	strneb sl, [ip], #1
	addeq ip, ip, #1
	subs r2, r2, #1
	mov r3, r3, lsl #0xf
	add r0, r0, #1
	mov r3, r3, lsr #0x10
	addmi ip, ip, #0x38
	movmi r2, lr
	cmp r0, #0xc
	blt _02026A3C
_02026A68:
	add r6, r6, #1
	mov r2, r6, lsr #0x1f
	rsb r0, r2, r6, lsl #29
	adds r0, r2, r0, ror #29
	ldreq r0, [sp, #0x1c]
	add sb, sb, #8
	addeq sb, sb, r0, lsl #3
	add r1, r1, #1
_02026A88:
	cmp r1, r7
	blt _020268DC
	cmp r8, #0
	beq _02026B04
	ldr r0, [sp, #0x28]
	add r1, r6, r7
	cmp r1, r0
	bge _02026B04
	ldr r0, [sp, #8]
	mov r4, #0
	ldrh r3, [r0]
	mov r2, #0x13
	mov r1, #7
_02026ABC:
	tst r3, #1
	beq _02026AD8
	ldrb r0, [sb]
	cmp r0, #0
	streqb r2, [sb], #1
	addne sb, sb, #1
	b _02026ADC
_02026AD8:
	add sb, sb, #1
_02026ADC:
	mov r0, r3, lsl #0xf
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	subs r0, r0, #1
	str r0, [sp, #0xc]
	strmi r1, [sp, #0xc]
	addmi sb, sb, #0x38
	cmp r4, #0xc
	blt _02026ABC
_02026B04:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #2]
_02026B0C:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02026B14: .word _020AFD04
_02026B18: .word _022A7A5C
#endif
	arm_func_end DrawChar

	arm_func_start sub_02026B1C
sub_02026B1C: ; 0x02026B1C
#ifdef JAPAN
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl sub_0202796C_JP
	mov fp, r0
	mov r0, sl
	bl GetWindow
	ldr r1, _02026C64 ; =_020AFD04
	ldrb r3, [r0, #6]
	ldr r2, [r1]
	add r1, r2, r7, lsl #2
	ldrsh r0, [r1, #2]
	mov r4, r3, lsl #6
	ldrb r5, [r2, r7, lsl #2]
	cmp r0, #0
	ldrb r6, [r1, #1]
	movlt r0, #0
	blt _02026FCC
	add r1, sp, #0
	mov r0, sl
	bl sub_020282C8
	ldr r0, _02026C64 ; =_020AFD04
	mov r3, sb
	ldr r1, [r0]
	mov sl, r8
	cmp sb, #0
	add r0, r1, r7, lsl #2
	ldrsh r0, [r0, #2]
	movlt r3, #0
	cmp r8, #0
	add r7, r1, r0
	movlt sl, #0
	add sb, sb, r5
	add r6, r8, r6
	b _02026FC0
_02026F4C:
	ldr r0, [sp, #4]
	cmp sl, r0
	bge _02026FC8
	mov r1, sl, lsr #0x1f
	rsb r0, r1, sl, lsl #29
	add r1, r1, r0, ror #29
	mov r2, sl, asr #2
	add r0, sl, r2, lsr #29
	add r1, fp, r1, lsl #3
	mov r0, r0, asr #3
	mla r8, r0, r4, r1
	mov r2, r3
	b _02026FB4
_02026F80:
	ldr r0, [sp]
	cmp r2, r0
	bge _02026FBC
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #29
	mov ip, r2, asr #2
	add ip, r2, ip, lsr #29
	add r0, r1, r0, ror #29
	ldrsb r1, [r7], #1
	mov ip, ip, asr #3
	add r0, r8, r0
	strb r1, [r0, ip, lsl #6]
	add r2, r2, #1
_02026FB4:
	cmp r2, sb
	blt _02026F80
_02026FBC:
	add sl, sl, #1
_02026FC0:
	cmp sl, r6
	blt _02026F4C
_02026FC8:
	mov r0, r5
_02026FCC:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#else
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r5, _02026C64 ; =_020AFD04
	mov r4, r0
#ifdef EUROPE
	ldr r5, [r5, #8]
#else
	ldr r5, [r5, #0xc]
#endif
	mov r6, r1
	add r7, r5, r3, lsl #2
	mov r5, r2
	bl sub_0202760C
	ldrsh r3, [r7, #2]
	mov r8, r0
	cmp r3, #0
	movlt r0, #0
	blt _02026C5C
	ldr r0, _02026C64 ; =_020AFD04
	add r1, sp, #0
#ifdef EUROPE
	ldr r2, [r0, #8]
#else
	ldr r2, [r0, #0xc]
#endif
	mov r0, r4
	add r4, r2, r3
	bl sub_020282C8
	ldrb r0, [r7, #1]
	cmp r5, #0
	add ip, r5, r0
	bge _02026B9C
	cmp ip, #0
	ldrltb r0, [r7]
	blt _02026C5C
	ldr r1, [sp]
	rsb r0, r5, #0
	mla r4, r1, r0, r4
	mov r5, #0
	b _02026BB8
_02026B9C:
	ldr r0, [sp, #4]
	cmp ip, r0
	ble _02026BB8
	cmp r5, r0
	ldrgtb r0, [r7]
	bgt _02026C5C
	mov ip, r0
_02026BB8:
	ldrb r0, [r7]
	cmp r6, #0
	movlt r6, #0
	ldr r1, [sp]
	add r3, r6, r0
	cmp r3, r1
	subgt r6, r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	movgt r3, r1
	mov r2, r6
	mov r1, r0, lsl #6
	b _02026C50
_02026BF0:
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	mov r0, r0, asr #3
	mul sb, r0, r1
	mov r6, r5, lsr #0x1f
	rsb r0, r6, r5, lsl #29
	add r0, r6, r0, ror #29
	add r0, sb, r0, lsl #3
	mov r6, r2
	add lr, r8, r0
	b _02026C44
_02026C1C:
	mov sb, r6, lsr #0x1f
	rsb r0, sb, r6, lsl #29
	mov sl, r6, asr #2
	add sl, r6, sl, lsr #29
	add sb, sb, r0, ror #29
	ldrb r0, [r4], #1
	mov sl, sl, asr #3
	add sb, lr, sb
	strb r0, [sb, sl, lsl #6]
	add r6, r6, #1
_02026C44:
	cmp r6, r3
	blt _02026C1C
	add r5, r5, #1
_02026C50:
	cmp r5, ip
	blt _02026BF0
	ldrb r0, [r7]
_02026C5C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
#endif
	.align 2, 0
_02026C64: .word _020AFD04
	arm_func_end sub_02026B1C

	arm_func_start sub_02026C68
sub_02026C68: ; 0x02026C68
	stmdb sp!, {r3, lr}
	cmp r3, #0x41
	blo _02026CA4
	cmp r3, #0x5a
	bhi _02026CA4
	ldr ip, _02026E38 ; =_020AFD04
	sub r3, r3, #0x40
#ifdef NORTH_AMERICA
	ldr ip, [ip, #8]
#else
	ldr ip, [ip, #4]
#endif
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	cmp ip, #3
	addeq r3, r3, #0x50
	moveq r3, r3, lsl #0x10
	moveq r3, r3, asr #0x10
	b _02026E18
_02026CA4:
	ldr ip, _02026E38 ; =_020AFD04
#ifdef NORTH_AMERICA
	ldr ip, [ip, #8]
#else
	ldr ip, [ip, #4]
#endif
	cmp ip, #3
	bne _02026D40
	cmp r3, #0x40
	bgt _02026CCC
	bge _02026D00
	cmp r3, #0x26
	beq _02026D30
	b _02026D38
_02026CCC:
	cmp r3, #0x6f
	bgt _02026CF4
	subs ip, r3, #0x6b
	addpl pc, pc, ip, lsl #2
	b _02026D38
_02026CE0: ; jump table
	b _02026D10 ; case 0
	b _02026D38 ; case 1
	b _02026D18 ; case 2
	b _02026D20 ; case 3
	b _02026D08 ; case 4
_02026CF4:
	cmp r3, #0xe9
	beq _02026D28
	b _02026D38
_02026D00:
	mov r3, #0x50
	b _02026E18
_02026D08:
	mov r3, #0x6b
	b _02026E18
_02026D10:
	mov r3, #0x6c
	b _02026E18
_02026D18:
	mov r3, #0x6d
	b _02026E18
_02026D20:
	mov r3, #0x6e
	b _02026E18
_02026D28:
	mov r3, #0x6f
	b _02026E18
_02026D30:
	mov r3, #0x71
	b _02026E18
_02026D38:
	mov r0, #8
	ldmia sp!, {r3, pc}
_02026D40:
	cmp r3, #0x61
	blo _02026D5C
	cmp r3, #0x7a
	subls r3, r3, #0x40
	movls r3, r3, lsl #0x10
	movls r3, r3, asr #0x10
	bls _02026E18
_02026D5C:
#ifdef EUROPE
	cmp r3, #0xe1
	bgt _02027090
	bge _020270F4
	cmp r3, #0x2e
	bgt _02027084
	subs ip, r3, #0x26
	addpl pc, pc, ip, lsl #2
	b _02026E10
_02027060: ; jump table
	b _02026DE8 ; case 0
	b _02026DE0 ; case 1
	b _02026E10 ; case 2
	b _02026E10 ; case 3
	b _02026E10 ; case 4
	b _02026E10 ; case 5
	b _02026DD0 ; case 6
	b _02026DD8 ; case 7
	b _02026DC8 ; case 8
_02027084:
	cmp r3, #0xc1
	beq _02026E00
	b _02026E10
_02027090:
	cmp r3, #0xeb
	bgt _020270A8
	bge _02026DF8
	cmp r3, #0xe9
	beq _02026DF0
	b _02026E10
_020270A8:
	cmp r3, #0xed
	beq _020270FC
	b _02026E10
#else
	cmp r3, #0xc1
	bgt _02026DAC
	bge _02026E00
	sub ip, r3, #0x22
	cmp ip, #0xc
	addls pc, pc, ip, lsl #2
	b _02026E10
_02026D78: ; jump table
	b _02026E08 ; case 0
	b _02026E10 ; case 1
	b _02026E10 ; case 2
	b _02026E10 ; case 3
	b _02026DE8 ; case 4
	b _02026DE0 ; case 5
	b _02026E10 ; case 6
	b _02026E10 ; case 7
	b _02026E10 ; case 8
	b _02026E10 ; case 9
	b _02026DD0 ; case 10
	b _02026DD8 ; case 11
	b _02026DC8 ; case 12
_02026DAC:
	cmp r3, #0xe9
	bgt _02026DBC
	beq _02026DF0
	b _02026E10
_02026DBC:
	cmp r3, #0xeb
	beq _02026DF8
	b _02026E10
#endif
_02026DC8:
	mov r3, #0x1b
	b _02026E18
_02026DD0:
	mov r3, #0x1c
	b _02026E18
_02026DD8:
	mov r3, #0x1d
	b _02026E18
_02026DE0:
	mov r3, #0x1e
	b _02026E18
_02026DE8:
	mov r3, #0
	b _02026E18
_02026DF0:
	mov r3, #0x3b
	b _02026E18
_02026DF8:
	mov r3, #0x3c
	b _02026E18
_02026E00:
	mov r3, #0x3d
	b _02026E18
#ifdef EUROPE
_020270F4:
	mov r3, #0x4c
	b _02026E18
_020270FC:
	mov r3, #0x4d
	b _02026E18
#else
_02026E08:
	mov r3, #0x3e
	b _02026E18
#endif
_02026E10:
	mov r0, #6
	ldmia sp!, {r3, pc}
_02026E18:
	ldrb ip, [sp, #8]
	cmp ip, #0
	ldreq r0, _02026E38 ; =_020AFD04
#if defined(EUROPE)
	ldreq r0, [r0, #8]
#elif defined(JAPAN)
	ldreq r0, [r0]
#else
	ldreq r0, [r0, #0xc]
#endif
	ldreqb r0, [r0, r3, lsl #2]
	ldmeqia sp!, {r3, pc}
	bl sub_02026B1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_02026E38: .word _020AFD04
	arm_func_end sub_02026C68

	arm_func_start sub_02026E3C
sub_02026E3C: ; 0x02026E3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_0202760C
#endif
	mov r4, r0
	mov r0, r7
	bl sub_02027624
	mov r3, r5, lsl #0x14
	mov r1, r0
	mov r0, r4
	mov r2, r6
	mov r3, r3, lsr #0x10
	bl DecompressAtHalf
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02026E3C

	arm_func_start sub_02026E78
sub_02026E78: ; 0x02026E78
#ifdef JAPAN
	stmdb sp!, {r3, lr}
	ldr r3, _02026FEC ; =_020AFD4C
	mov ip, #1
	ldr r0, _02026FF0 ; =WINDOW_LIST
	mov r1, #0
	mov r2, #0x1180
	strb ip, [r3, #4]
	bl memset
	ldr r0, _02026FF8 ; =_022A7B1C
	mov r1, #0
	mov r2, #0x370
	bl memset
	mov r1, #0
	ldr r0, _02026FFC ; =_022A7AC8
#else
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _02026FEC ; =_020AFD4C
	mov r4, #1
	ldr r0, _02026FF0 ; =WINDOW_LIST
	mov r1, #0
	mov r2, #0x1180
	strb r4, [r3, #2]
	bl memset
	mov r7, #0
	ldr r0, _02026FF4 ; =_022A7A6C
	mvn r5, #1
	ldr r6, _02026FF8 ; =_022A7B1C
	strb r5, [r0, #5]
	mov r4, r7
_02026EB0:
	strb r4, [r6]
	add r0, r6, #4
	strb r5, [r6, #0x2c]
	bl sub_02029A50
	add r7, r7, #1
	cmp r7, #0x14
	add r6, r6, #0x30
	blt _02026EB0
	ldr r0, _02026FFC ; =_022A7AC8
	mov r1, #0
#endif
	ldr r2, _02027000 ; =0x04000014
	ldr r3, _02027004 ; =0x0600D800
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027008 ; =_022A7B00
#ifdef JAPAN
	str r1, [sp]
	ldr r2, _0202700C ; =0x04001010
	ldr r3, _02027010 ; =0x0620D000
	bl sub_0200B2C4
	mov r1, #0
	str r1, [sp]
	ldr r0, _02027014 ; =_022A7AE4
	ldr r2, _02027018 ; =0x04001014
	ldr r3, _0202701C ; =0x0620D800
	bl sub_0200B2C4
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027020 ; =_022A7AA0
	mov r1, #1
	mov r2, #0x200
	ldr r3, _02027024 ; =0x06882000
#else
	ldr r2, _0202700C ; =0x04001010
	ldr r3, _02027010 ; =0x0620D000
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027014 ; =_022A7AE4
	ldr r2, _02027018 ; =0x04001014
	ldr r3, _0202701C ; =0x0620D800
	str r1, [sp]
	bl sub_0200B2C4
	mov r1, #0
	ldr r0, _02027020 ; =_022A7AA0
	str r1, [sp]
	ldr r3, _02027024 ; =0x06882000
	mov r1, #1
	mov r2, #0x200
#endif
	bl sub_0200A124
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027028 ; =_022A7A8C
	mov r1, #3
	mov r2, #0x200
	ldr r3, _0202702C ; =0x06898000
	bl sub_0200A124
	mov r0, #0
	str r0, [sp]
	ldr r0, _02027030 ; =_022A7A78
	mov r1, #3
	mov r2, #0x300
	ldr r3, _02027034 ; =0x0689A000
	bl sub_0200A124
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _02027038 ; =_022A7EDC
#ifdef JAPAN
	strb r2, [r1]
	strb r2, [r1, #4]
	strb r2, [r1, #2]
#else
	strb r2, [r1, #4]
	strb r2, [r1]
	strb r2, [r1, #1]
#endif
	mov r1, #0xa00
	bl MemZero
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _0202703C ; =_022A7AB4
	strh r2, [r1, #6]
	mov r1, #0x14
	bl MemZero
	mov r0, #0
	bl sub_02027180
	mov r2, #1
	ldr r0, _02026FF4 ; =_022A7A6C
	sub r1, r2, #3
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
#ifdef JAPAN
	strb r1, [r0, #1]
#else
	strb r1, [r0, #3]
#endif
	bl LoadCursors
	bl LoadAlert
	bl sub_0202A124
#ifdef JAPAN
	ldr r1, _02026FF4 ; =_022A7A6C
	mov r2, #0
	ldr r0, _02026FEC ; =_020AFD4C
#else
	mov r2, #0
	ldr r1, _02026FF4 ; =_022A7A6C
	ldr r0, _02026FEC ; =_020AFD4C
#endif
	strh r2, [r1, #6]
	str r2, [r0, #8]
	bl sub_0202903C
#ifdef JAPAN
	ldmia sp!, {r3, pc}
#else
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
#endif
	.align 2, 0
_02026FEC: .word _020AFD4C
_02026FF0: .word WINDOW_LIST
#ifndef JAPAN
_02026FF4: .word _022A7A6C
#endif
_02026FF8: .word _022A7B1C
_02026FFC: .word _022A7AC8
_02027000: .word 0x04000014
_02027004: .word 0x0600D800
_02027008: .word _022A7B00
_0202700C: .word 0x04001010
_02027010: .word 0x0620D000
_02027014: .word _022A7AE4
_02027018: .word 0x04001014
_0202701C: .word 0x0620D800
_02027020: .word _022A7AA0
_02027024: .word 0x06882000
_02027028: .word _022A7A8C
_0202702C: .word 0x06898000
_02027030: .word _022A7A78
_02027034: .word 0x0689A000
#ifdef JAPAN
_02026FF4: .word _022A7A6C
#endif
_02027038: .word _022A7EDC
_0202703C: .word _022A7AB4
	arm_func_end sub_02026E78

	arm_func_start sub_02027040
sub_02027040: ; 0x02027040
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov r3, #0xe0
	mul r5, r0, r3
	ldr r6, _02027134 ; =_022A88E4
	mov sl, r1
	ldrb r0, [r6, r5]
	ldr r3, _02027138 ; =_0209AC58
	mov r8, #0
	cmp r0, #0
	mov r0, r2, lsl #0x10
	ldreq sb, _0202713C ; =_022A7AA0
	add r2, sp, #0
	ldrne sb, _02027140 ; =_022A7A8C
	mov r7, r0, lsr #0x10
	mov r1, #4
_02027080:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027080
	add r4, sp, #8
_02027094:
	add r3, sp, #0
	add r2, sp, #4
	mov r1, #4
_020270A0:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020270A0
	ldrsb r0, [sl]
	add r3, sp, #4
	add r2, sp, #8
	strb r0, [sp, #4]
	ldrsb r0, [sl, #1]
	mov r1, #4
	strb r0, [sp, #5]
	ldrsb r0, [sl, #2]
	strb r0, [sp, #6]
_020270D4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020270D4
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r0, sb
	mov r2, r4
	add sl, sl, #3
	mov r7, r3, lsr #0x10
	bl sub_0200A29C
	add r8, r8, #1
	cmp r8, #0x10
	blt _02027094
	ldrb r0, [r6, r5]
	mov r1, #1
	cmp r0, #0
	ldreq r0, _02027144 ; =_022A7A6C
#ifdef JAPAN
	streqb r1, [r0]
	ldrne r0, _02027144 ; =_022A7A6C
	strneb r1, [r0, #4]
#else
	streqb r1, [r0, #4]
	ldrne r0, _02027144 ; =_022A7A6C
	strneb r1, [r0]
#endif
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02027134: .word _022A88E4
_02027138: .word _0209AC58
_0202713C: .word _022A7AA0
_02027140: .word _022A7A8C
_02027144: .word _022A7A6C
	arm_func_end sub_02027040

	arm_func_start sub_02027148
sub_02027148: ; 0x02027148
	ldr r0, _02027158 ; =_020AFD4C
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02027158: .word _020AFD4C
	arm_func_end sub_02027148

	arm_func_start sub_0202715C
sub_0202715C: ; 0x0202715C
	ldr r0, _0202716C ; =_020AFD4C
	mov r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_0202716C: .word _020AFD4C
	arm_func_end sub_0202715C

	arm_func_start sub_02027170
sub_02027170: ; 0x02027170
	ldr r0, _0202717C ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r0, #3]
#else
	ldrb r0, [r0, #2]
#endif
	bx lr
	.align 2, 0
_0202717C: .word _022A7A6C
	arm_func_end sub_02027170

	arm_func_start sub_02027180
sub_02027180: ; 0x02027180
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r0, #0xc
	mul r2, r4, r0
	ldr r1, _0202721C ; =_020AFD58
	add r0, sp, #0
	ldr r1, [r1, r2]
	mov r2, #0x300
	bl LoadWteFromRom
	ldr r3, [sp, #4]
	ldr r0, _02027220 ; =_022A7A6C
	ldrh r1, [r3, #0xc]
	ldr r2, _02027224 ; =_022A7AB6
	add r3, r3, #0x10
	strh r1, [r0, #0x48]
	mov r1, #4
_020271C4:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _020271C4
	ldr ip, _02027220 ; =_022A7A6C
	mov r1, #0x1f000
	mov r2, #0x1f
	str r1, [ip, #0x54]
	add r0, sp, #0
	mov r3, #0
	strh r2, [ip, #0x58]
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	mov r0, r4
	bl sub_02027228
	mov r0, r4
	bl sub_02027390
	ldr r0, _02027220 ; =_022A7A6C
#ifdef JAPAN
	strb r4, [r0, #3]
#else
	strb r4, [r0, #2]
#endif
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0202721C: .word _020AFD58
_02027220: .word _022A7A6C
_02027224: .word _022A7AB6
	arm_func_end sub_02027180

	arm_func_start sub_02027228
sub_02027228: ; 0x02027228
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r1, #0xc
	mul r2, r0, r1
	ldr r1, _0202726C ; =_020AFD5C
	add r0, sp, #0
	ldr r1, [r1, r2]
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r0, _02027270 ; =0x0620C000
	bl Memcpy32
	add r0, sp, #0
	bl UnloadFile
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202726C: .word _020AFD5C
_02027270: .word 0x0620C000
	arm_func_end sub_02027228

	arm_func_start sub_02027274
sub_02027274: ; 0x02027274
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov r1, r0
	add r0, sp, #0xc
	mov r2, #1
	bl LoadFileFromRom
	ldr r7, [sp, #0xc]
	ldr r3, _0202736C ; =_0209AC50
	add r2, sp, #0
	mov r8, #0x80
	mov sb, #0
	mov r1, #4
_020272A4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020272A4
	ldr r6, _02027370 ; =_022A7AA0
	ldr r4, _02027374 ; =_022A7A8C
	add r5, sp, #8
_020272C0:
	add r3, sp, #0
	add r2, sp, #4
	mov r1, #4
_020272CC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020272CC
	ldrb r0, [r7]
	add r3, sp, #4
	add r2, sp, #8
	strb r0, [sp, #4]
	ldrb r0, [r7, #1]
	mov r1, #4
	strb r0, [sp, #5]
	ldrb r0, [r7, #2]
	strb r0, [sp, #6]
_02027300:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027300
	mov r0, r6
	mov r1, r8
	mov r2, r5
	add r7, r7, #4
	bl sub_0200A29C
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl sub_0200A29C
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	add sb, sb, #1
	cmp sb, #0x80
	mov r8, r0, lsr #0x10
	blt _020272C0
	add r0, sp, #0xc
	bl UnloadFile
	ldr r0, _02027378 ; =_022A7A6C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
	strb r1, [r0, #4]
#else
	strb r1, [r0, #4]
	strb r1, [r0]
#endif
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202736C: .word _0209AC50
_02027370: .word _022A7AA0
_02027374: .word _022A7A8C
_02027378: .word _022A7A6C
	arm_func_end sub_02027274

	arm_func_start sub_0202737C
sub_0202737C: ; 0x0202737C
	ldr ip, _02027388 ; =sub_02027274
	ldr r0, _0202738C ; =_0209ADC8
	bx ip
	.align 2, 0
_02027388: .word sub_02027274
_0202738C: .word _0209ADC8
	arm_func_end sub_0202737C

	arm_func_start sub_02027390
sub_02027390: ; 0x02027390
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	ldr r1, _0202759C ; =_0209ADDC
	mov sl, r0
	add r0, sp, #0x10
	mov r2, #1
	bl LoadFileFromRom
	ldr r8, [sp, #0x10]
	ldr r3, _020275A0 ; =_0209AC54
	add r2, sp, #0
	mov sb, #0x10
	mov r7, #0
	mov r1, #4
_020273C4:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020273C4
	ldr r6, _020275A4 ; =_022A7AA0
	ldr r4, _020275A8 ; =_022A7A8C
	add r5, sp, #0x18
_020273E0:
	add r3, sp, #0
	add r2, sp, #0xc
	mov r1, #4
_020273EC:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020273EC
	ldrb r0, [r8]
	add r3, sp, #0xc
	add r2, sp, #0x18
	strb r0, [sp, #0xc]
	ldrb r0, [r8, #1]
	mov r1, #4
	strb r0, [sp, #0xd]
	ldrb r0, [r8, #2]
	strb r0, [sp, #0xe]
	ldrb r0, [r8, #3]
	strb r0, [sp, #0xf]
_02027428:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027428
	mov r0, r6
	mov r1, sb
	mov r2, r5
	add r8, r8, #4
	bl sub_0200A29C
	mov r0, r4
	mov r1, sb
	mov r2, r5
	bl sub_0200A29C
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	add r7, r7, #1
	cmp r7, #0x20
	mov sb, r0, lsr #0x10
	blt _020273E0
	add r0, sp, #0x10
	bl UnloadFile
	ldr r0, _020275AC ; =_0209ADC8
	bl sub_02027274
	mov r0, #0xc
	mul r2, sl, r0
	ldr r1, _020275B0 ; =_020AFD60
	add r0, sp, #0x10
	ldr r1, [r1, r2]
	mov r2, #1
	bl LoadFileFromRom
	mov r5, #0
	ldr r6, [sp, #0x10]
	ldr r3, _020275B4 ; =_0209AC4C
	add r2, sp, #4
	mov r4, r5
	mov r1, #4
_020274B8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020274B8
_020274C8:
	mov r0, r4, lsl #0x18
	ldr sl, _020275B8 ; =_022A7A78
	mov r7, r0, lsr #0x10
	mov r8, #0
	add sb, sp, #0x18
_020274DC:
	add r3, sp, #4
	add r2, sp, #8
	mov r1, #4
_020274E8:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _020274E8
	mov r0, r5, lsl #1
	ldrsh r1, [r6, r0]
	add r3, sp, #8
	add r2, sp, #0x18
	mov r0, r1, lsl #0x1b
	and ip, r1, #0x3e0
	and r1, r1, #0x7c00
	mov r0, r0, lsr #0x18
	mov ip, ip, asr #2
	mov r1, r1, asr #7
	strb r1, [sp, #0xa]
	strb r0, [sp, #8]
	strb ip, [sp, #9]
	mov r1, #4
_02027530:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _02027530
	add r0, r7, #1
	mov r1, r7
	mov r3, r0, lsl #0x10
	mov r0, sl
	mov r2, sb
	mov r7, r3, lsr #0x10
	bl sub_0200A29C
	add r8, r8, #1
	cmp r8, #0x10
	add r5, r5, #1
	blt _020274DC
	add r4, r4, #1
	cmp r4, #3
	blt _020274C8
	add r0, sp, #0x10
	bl UnloadFile
	ldr r0, _020275BC ; =_022A7A6C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
	strb r1, [r0, #4]
	strb r1, [r0, #2]
#else
	strb r1, [r0, #4]
	strb r1, [r0]
	strb r1, [r0, #1]
#endif
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202759C: .word _0209ADDC
_020275A0: .word _0209AC54
_020275A4: .word _022A7AA0
_020275A8: .word _022A7A8C
_020275AC: .word _0209ADC8
_020275B0: .word _020AFD60
_020275B4: .word _0209AC4C
_020275B8: .word _022A7A78
_020275BC: .word _022A7A6C
	arm_func_end sub_02027390

	arm_func_start sub_020275C0
sub_020275C0: ; 0x020275C0
	ldr r3, _020275D4 ; =_022A7AC8
	ldr r2, _020275D8 ; =_022A7AA0
	str r3, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_020275D4: .word _022A7AC8
_020275D8: .word _022A7AA0
	arm_func_end sub_020275C0

	arm_func_start sub_020275DC
sub_020275DC: ; 0x020275DC
	ldr r3, _020275F0 ; =_022A7B00
	ldr r2, _020275F4 ; =_022A7A8C
	str r3, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_020275F0: .word _022A7B00
_020275F4: .word _022A7A8C
	arm_func_end sub_020275DC

	arm_func_start GetWindow
GetWindow: ; 0x020275F8
	ldr r2, _02027608 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_02027608: .word WINDOW_LIST
	arm_func_end GetWindow

	arm_func_start sub_0202760C
sub_0202760C: ; 0x0202760C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027620 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
#ifdef JAPAN
_02027620: .word _022A88FC
#else
_02027620: .word _022A88F0
#endif
	arm_func_end sub_0202760C

#ifdef JAPAN
	arm_func_start sub_0202796C_JP
sub_0202796C_JP: ; 0x0202796C
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02027980 ; =_022A88F0
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02027980: .word _022A88F0
	arm_func_end sub_0202796C_JP
#endif

	arm_func_start sub_02027624
sub_02027624: ; 0x02027624
	ldr r2, _02027644 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r2, r0, r1, r2
	ldrb r1, [r2, #6]
	ldrb r0, [r2, #7]
	smulbb r0, r1, r0
	mov r0, r0, lsl #5
	bx lr
	.align 2, 0
_02027644: .word WINDOW_LIST
	arm_func_end sub_02027624

	arm_func_start NewWindowScreenCheck
NewWindowScreenCheck: ; 0x02027648
	stmdb sp!, {r4, lr}
	mov r4, #0
	ldr ip, _020276B8 ; =WINDOW_LIST
	mov lr, r4
	mov r3, r4
_0202765C:
	ldrsb r2, [ip, #0xb6]
	cmp r2, #0
	beq _02027678
	ldrb r2, [ip, #8]
	cmp r2, #0
	addeq lr, lr, #1
	addne r4, r4, #1
_02027678:
	add r2, r3, #1
	mov r2, r2, lsl #0x18
	mov r3, r2, asr #0x18
	cmp r3, #0x14
	add ip, ip, #0xe0
	blt _0202765C
	cmp lr, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #8]
	cmp r4, #0
	ldreq r2, _020276BC ; =_022A7A6C
	moveq r3, #1
	streqh r3, [r2, #0xa]
	bl NewWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_020276B8: .word WINDOW_LIST
_020276BC: .word _022A7A6C
	arm_func_end NewWindowScreenCheck

	arm_func_start NewWindow
NewWindow: ; 0x020276C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	ldr r5, _02027898 ; =WINDOW_LIST
	ldr r6, _0202789C ; =_022A7B1C
	mov r4, #0
	b _020276FC
_020276DC:
	ldrsb r0, [r5, #0xb6]
	cmp r0, #0
	beq _02027704
	add r0, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, asr #0x18
	add r5, r5, #0xe0
#ifdef JAPAN
	add r6, r6, #0x2c
#else
	add r6, r6, #0x30
#endif
_020276FC:
	cmp r4, #0x14
	blt _020276DC
_02027704:
	ldmia r8, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldrb r0, [r8, #6]
	mov r1, #8
	mov r0, r0, lsl #3
	sub r0, r0, #8
	str r0, [r5, #0x20]
	ldrb r0, [r5, #6]
	ldrb r2, [r5, #7]
	mov r0, r0, lsl #6
	mul r0, r2, r0
	bl MemAlloc
	str r0, [r5, #0x14]
	ldrb r0, [r5, #8]
	ldr lr, _020278A0 ; =_022A7A74
	ldrb r3, [r5, #6]
	mov r8, r0, lsl #1
	ldrh r0, [lr, r8]
	ldrb r2, [r5, #7]
	mvn r1, #8
	mla ip, r3, r2, r0
	strh r0, [r5, #0x12]
	ldrsb r2, [r5, #9]
	strh ip, [lr, r8]
	cmp r2, r1
	orreq r1, r0, #0x1000
	streqh r1, [r5, #0x30]
	strneh r0, [r5, #0x30]
	ldrb r1, [r5, #8]
	cmp r1, #0
	moveq r1, #0x6000000
	movne r1, #0x6200000
	add r0, r1, r0, lsl #6
	str r0, [r5, #0x18]
	str r0, [r5, #0x28]
	ldrb r3, [r5, #6]
	ldrb r2, [r5, #7]
	mov r1, #0
	mov r0, r4
	smulbb r2, r3, r2
	mov r2, r2, lsl #6
	str r2, [r5, #0x1c]
	strb r1, [r5, #0x11]
	bl sub_02027B1C
	strb r4, [r5, #0x10]
	mov r0, #1
	strb r0, [r5, #0xb6]
	strb r0, [r5, #0xb7]
	mov r0, r4
	strb r7, [r5, #0xb4]
	bl sub_020278C4
	mvn r1, #0
	add r0, r5, #0x34
	str r1, [r5, #0xb8]
	bl InitRender3dElement64
	mov r1, #2
	strb r1, [r5, #0x70]
	mov r0, #9
	strh r0, [r5, #0x5e]
	strb r1, [r5, #0x72]
	mov r0, #0x20
	strb r0, [r5, #0x60]
	strb r0, [r5, #0x61]
	strb r0, [r5, #0x62]
	mov r1, #0x90
	add r0, r5, #0x74
	strb r1, [r5, #0x63]
	bl InitRender3dElement64
	ldr r0, _020278A4 ; =_022A7A6C
	mov r1, #0
	ldrh r3, [r0, #0x48]
	mov r2, #0x18
	strh r3, [r5, #0x88]
	strh r1, [r5, #0x8a]
	strh r1, [r5, #0x8c]
	strh r2, [r5, #0x8e]
	strh r2, [r5, #0x90]
	ldr r2, [r0, #0x54]
	str r2, [r5, #0x94]
	ldrsh r0, [r0, #0x58]
	bl sub_020278A8
	str r0, [r5, #0x98]
	mov r0, #6
	strb r0, [r5, #0xb0]
	mov r0, #0xa
	strh r0, [r5, #0x9e]
	mov r1, #0
	strh r1, [r5, #0x74]
	strh r1, [r5, #0x76]
	strh r1, [r5, #0x78]
	add r0, r5, #0xbc
	strh r1, [r5, #0x7a]
	bl InitWindowTrailer
	mov r0, #0
	strb r0, [r6]
	add r0, r6, #4
	bl sub_02029A50
	ldrb r1, [r5, #8]
	mov r0, r4
	strb r1, [r6, #0x2a]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027898: .word WINDOW_LIST
_0202789C: .word _022A7B1C
_020278A0: .word _022A7A74
_020278A4: .word _022A7A6C
	arm_func_end NewWindow

	arm_func_start sub_020278A8
sub_020278A8: ; 0x020278A8
	ldr r2, _020278C0 ; =_020AFC70
	add r0, r1, r0, lsl #8
	ldr r1, [r2]
	ldr r1, [r1, #0xe0]
	add r0, r1, r0, lsl #1
	bx lr
	.align 2, 0
_020278C0: .word _020AFC70
	arm_func_end sub_020278A8

	arm_func_start sub_020278C4
sub_020278C4: ; 0x020278C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0xe0
	mul r2, r0, r1
	ldr ip, _02027964 ; =_022A7A6C
	ldr r4, _02027968 ; =_022A8990
#ifdef JAPAN
	ldrsb r3, [ip, #1]
#else
	ldrsb r3, [ip, #3]
#endif
	mvn r1, #1
	ldrsb r8, [r4, r2]
	cmp r3, r1
	ldreq r1, _0202796C ; =_022A8991
	mov r7, r3
#ifdef JAPAN
	streqb r0, [ip, #1]
#else
	streqb r0, [ip, #3]
#endif
	streqb r3, [r1, r2]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, r1
	ldr r5, _02027970 ; =WINDOW_LIST
	mov lr, #0xe0
	b _02027924
_0202790C:
	mla r6, r7, lr, r5
	ldrsb r4, [r6, #0xb4]
	cmp r4, r8
	blt _0202792C
	mov r1, r7
	ldrsb r7, [r6, #0xb5]
_02027924:
	cmp r7, ip
	bne _0202790C
_0202792C:
	mvn ip, #1
	cmp r1, ip
	ldreq ip, _0202796C ; =_022A8991
	ldreq r1, _02027964 ; =_022A7A6C
	streqb r3, [ip, r2]
#ifdef JAPAN
	streqb r0, [r1, #1]
#else
	streqb r0, [r1, #3]
#endif
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r3, #0xe0
	mul r3, r1, r3
	ldr ip, _0202796C ; =_022A8991
	ldrsb r1, [ip, r3]
	strb r0, [ip, r3]
	strb r1, [ip, r2]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02027964: .word _022A7A6C
_02027968: .word _022A8990
_0202796C: .word _022A8991
_02027970: .word WINDOW_LIST
	arm_func_end sub_020278C4

	arm_func_start sub_02027974
sub_02027974: ; 0x02027974
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020279FC ; =_022A7A6C
	mvn r5, #1
#ifdef JAPAN
	ldrsb r4, [r1, #1]
#else
	ldrsb r4, [r1, #3]
#endif
	mov r1, r5
	ldr ip, _02027A00 ; =WINDOW_LIST
	mov r2, #0xe0
	b _020279AC
_02027994:
	mla lr, r4, r2, ip
	ldrsb r3, [lr, #0x10]
	cmp r0, r3
	beq _020279B4
	mov r5, r4
	ldrsb r4, [lr, #0xb5]
_020279AC:
	cmp r4, r1
	bne _02027994
_020279B4:
	mvn ip, #1
	cmp r5, ip
	bne _020279DC
	mov r1, #0xe0
	mul r2, r0, r1
	ldr r3, _02027A04 ; =_022A8991
	ldr r0, _020279FC ; =_022A7A6C
	ldrsb r1, [r3, r2]
#ifdef JAPAN
	strb r1, [r0, #1]
#else
	strb r1, [r0, #3]
#endif
	b _020279F4
_020279DC:
	mov r0, #0xe0
	mul r2, r4, r0
	ldr r3, _02027A04 ; =_022A8991
	mul r0, r5, r0
	ldrsb r1, [r3, r2]
	strb r1, [r3, r0]
_020279F4:
	strb ip, [r3, r2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020279FC: .word _022A7A6C
_02027A00: .word WINDOW_LIST
_02027A04: .word _022A8991
	arm_func_end sub_02027974

	arm_func_start sub_02027A08
sub_02027A08: ; 0x02027A08
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl sub_02027974
	mov r0, #0xe0
	mul r4, r6, r0
	ldr r1, _02027A5C ; =_022A8990
	mov r0, r6
	strb r5, [r1, r4]
	bl sub_020278C4
	ldr r1, _02027A60 ; =_022A88E4
	ldr r0, _02027A64 ; =_020AFD4C
	ldrb r3, [r1, r4]
	ldr r2, [r0, #8]
	mov r1, #1
	orr r1, r2, r1, lsl r3
	str r1, [r0, #8]
	cmp r3, #1
	ldmneia sp!, {r4, r5, r6, pc}
	bl sub_02027B88
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02027A5C: .word _022A8990
_02027A60: .word _022A88E4
_02027A64: .word _020AFD4C
	arm_func_end sub_02027A08

	arm_func_start SetScreenWindowsColor
SetScreenWindowsColor: ; 0x02027A68
	ldr r2, _02027A7C ; =MENU_CONTROL_PTR
	cmp r1, #2
	moveq r1, #1
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_02027A7C: .word MENU_CONTROL_PTR
	arm_func_end SetScreenWindowsColor

	arm_func_start SetBothScreensWindowsColor
SetBothScreensWindowsColor: ; 0x02027A80
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	bl SetScreenWindowsColor
	mov r0, r4
	mov r1, #1
	bl SetScreenWindowsColor
	ldmia sp!, {r4, pc}
	arm_func_end SetBothScreensWindowsColor

	arm_func_start sub_02027AA0
sub_02027AA0: ; 0x02027AA0
	cmp r0, #1
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0, #3]
#else
	streqb r1, [r0]
#endif
	bxeq lr
	cmp r0, #2
	ldreq r0, _02027AE4 ; =_020AFD4C
	moveq r1, #1
#ifdef JAPAN
	streqb r1, [r0]
#else
	streqb r1, [r0, #3]
#endif
	bxeq lr
	ldr r0, _02027AE8 ; =_020AFD9C
	ldr r1, _02027AEC ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #1
	eor r0, r0, #1
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_02027AE4: .word _020AFD4C
_02027AE8: .word _020AFD9C
_02027AEC: .word _020AFD94
	arm_func_end sub_02027AA0

	arm_func_start UpdateWindow
UpdateWindow: ; 0x02027AF0
	ldr r2, _02027B18 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x28]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_02027B18: .word WINDOW_LIST
	arm_func_end UpdateWindow

	arm_func_start sub_02027B1C
sub_02027B1C: ; 0x02027B1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0xe0
	mul r2, r4, r0
	ldr r0, _02027B50 ; =_022A88F0
	ldr r1, _02027B54 ; =_022A88F8
	ldr r0, [r0, r2]
	ldr r2, [r1, r2]
	mov r1, #0
	bl memset
	mov r0, r4
	bl UpdateWindow
	ldmia sp!, {r4, pc}
	.align 2, 0
_02027B50: .word _022A88F0
_02027B54: .word _022A88F8
	arm_func_end sub_02027B1C

	arm_func_start ClearWindow
ClearWindow: ; 0x02027B58
	mov r1, #0xe0
	mul r2, r0, r1
	ldr r0, _02027B7C ; =_022A88F0
	ldr r1, _02027B80 ; =_022A88F8
	ldr r0, [r0, r2]
	ldr r2, [r1, r2]
	ldr ip, _02027B84 ; =memset
	mov r1, #0
	bx ip
	.align 2, 0
_02027B7C: .word _022A88F0
_02027B80: .word _022A88F8
_02027B84: .word memset
	arm_func_end ClearWindow

	arm_func_start sub_02027B88
sub_02027B88: ; 0x02027B88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	ldr r0, _02027E14 ; =_022A7A6C
#ifdef JAPAN
	ldrsb r2, [r0, #1]
#else
	ldrsb r2, [r0, #3]
#endif
	b _02027E00
_02027B9C:
	ldr r1, _02027E18 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r4, r2, r0, r1
	ldrb r0, [r4, #8]
	cmp r0, #1
	ldreqsb r0, [r4, #0xb6]
	cmpeq r0, #2
	bne _02027DFC
	ldrsb r1, [r4, #9]
	ldr r0, _02027E1C ; =_0209AC64
	rsb r1, r1, #0
	mov r1, r1, lsl #1
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _02027DF0
	ldr r0, _02027E20 ; =MENU_CONTROL_PTR
	ldrb r1, [r4, #4]
	ldrb r3, [r0, #1]
	ldr r2, _02027E24 ; =_0209ACAC
	sub r6, r1, #1
	ldrb r2, [r2, r3]
	ldrb r0, [r4, #5]
	add r1, sp, #0
	mov r5, r2, lsl #0xc
	sub r3, r0, #1
	orr r0, r5, #2
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	str r6, [sp]
	mov r2, r2, lsr #0x10
	str r3, [sp, #4]
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #3
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027C5C
_02027C40:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027C5C:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027C40
	orr r0, r5, #4
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	orr r1, r5, #5
	add r0, r0, #1
	str r0, [sp, #4]
	orr r0, r5, #1
	orr r2, r5, #6
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r8, r1, lsr #0x10
	mov r6, r2, lsr #0x10
	ldr sl, _02027E28 ; =_022A7AE4
	add sb, sp, #0
	b _02027D44
_02027CC8:
	ldrb r2, [r4, #4]
	mov r0, sl
	mov r1, sb
	sub r3, r2, #1
	mov r2, r8
	str r3, [sp]
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _02027D10
_02027CF4:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027D10:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CF4
	mov r0, sl
	mov r1, sb
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027D44:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _02027CC8
	ldrb r1, [r4, #4]
	orr r0, r5, #7
	mov r2, r0, lsl #0x10
	sub r3, r1, #1
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	str r3, [sp]
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
	ldr r1, [sp]
	orr r0, r5, #8
	add r1, r1, #1
	mov r0, r0, lsl #0x10
	str r1, [sp]
	mov r6, r0, lsr #0x10
	ldr r8, _02027E28 ; =_022A7AE4
	add r7, sp, #0
	b _02027DC0
_02027DA4:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027DC0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _02027DA4
	orr r0, r5, #9
	mov r2, r0, lsl #0x10
	ldr r0, _02027E28 ; =_022A7AE4
	add r1, sp, #0
	mov r2, r2, lsr #0x10
	bl sub_0200B3FC
_02027DF0:
	ldr r0, _02027E2C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
_02027DFC:
	ldrsb r2, [r4, #0xb5]
_02027E00:
	mvn r0, #1
	cmp r2, r0
	bne _02027B9C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02027E14: .word _022A7A6C
_02027E18: .word WINDOW_LIST
_02027E1C: .word _0209AC64
_02027E20: .word MENU_CONTROL_PTR
_02027E24: .word _0209ACAC
_02027E28: .word _022A7AE4
_02027E2C: .word _020AFD4C
	arm_func_end sub_02027B88

	arm_func_start sub_02027E30
sub_02027E30: ; 0x02027E30
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02028070 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r7, r0, r2, r3
	ldrsb r0, [r7, #9]
	ldr r2, _02028074 ; =_0209AC64
	cmp r1, #0
	rsb r0, r0, #0
	add r4, r2, r0, lsl #1
	movne r0, #2
	moveq r0, #3
	strb r0, [r7, #0xb6]
	ldrb r0, [r7, #8]
	cmp r0, #1
	bne _02027F34
	cmp r1, #0
	bne _02027F20
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	ldrsb r0, [r4]
	cmp r0, #0
	blt _02027F20
	ldrb r0, [r7, #5]
	ldr r6, _02028078 ; =_022A7AE4
	add r5, sp, #0
	sub r0, r0, #1
	str r0, [sp, #4]
	mov r4, #0
	b _02027F08
_02027EB8:
	ldrb r0, [r7, #4]
	sub r0, r0, #1
	str r0, [sp]
	b _02027EE4
_02027EC8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02027EE4:
	ldrb r1, [r7, #4]
	ldrb r0, [r7, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EC8
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02027F08:
	ldrb r1, [r7, #5]
	ldrb r0, [r7, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	ble _02027EB8
_02027F20:
	bl sub_02027B88
	ldr r0, _0202807C ; =_020AFD4C
	mov r1, #1
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028064
_02027F34:
	cmp r1, #0
	beq _0202801C
	ldrb r1, [r7, #4]
	mvn r0, #3
	mov r1, r1, lsl #3
	strh r1, [r7, #0x34]
	ldrb r1, [r7, #5]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x36]
	ldrb r1, [r7, #6]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x38]
	ldrb r1, [r7, #7]
	mov r1, r1, lsl #3
	strh r1, [r7, #0x3a]
	ldrh r1, [r7, #0x34]
	strh r1, [r7, #0x74]
	ldrh r1, [r7, #0x36]
	strh r1, [r7, #0x76]
	ldrh r1, [r7, #0x38]
	strh r1, [r7, #0x78]
	ldrh r1, [r7, #0x3a]
	strh r1, [r7, #0x7a]
	ldrsh r1, [r7, #0x74]
	sub r1, r1, #8
	strh r1, [r7, #0x74]
	ldrsh r1, [r7, #0x76]
	sub r1, r1, #8
	strh r1, [r7, #0x76]
	ldrsh r1, [r7, #0x78]
	add r1, r1, #0x10
	strh r1, [r7, #0x78]
	ldrsh r1, [r7, #0x7a]
	add r1, r1, #0x10
	strh r1, [r7, #0x7a]
	ldrsb r1, [r7, #9]
	cmp r1, r0
	beq _02027FFC
	ldrsh r0, [r7, #0x34]
	sub r0, r0, #1
	strh r0, [r7, #0x34]
	ldrsh r0, [r7, #0x36]
	sub r0, r0, #2
	strh r0, [r7, #0x36]
	ldrsh r0, [r7, #0x38]
	add r0, r0, #2
	strh r0, [r7, #0x38]
	ldrsh r0, [r7, #0x3a]
	add r0, r0, #6
	strh r0, [r7, #0x3a]
_02027FFC:
	ldr r0, _0202807C ; =_020AFD4C
	ldrb r0, [r0, #1]
	cmp r0, #0
	movne r0, #0x90
	strneb r0, [r7, #0x63]
	moveq r0, #0xff
	streqb r0, [r7, #0x63]
	b _02028064
_0202801C:
	ldrsb r1, [r7, #0x10]
	ldr r2, _02028070 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r0, r1, r0, r2
	add r0, r0, #0xbc
	bl InitWindowTrailer
	mov r0, #0
	strh r0, [r7, #0x3a]
	strh r0, [r7, #0x38]
	strh r0, [r7, #0x36]
	strh r0, [r7, #0x34]
	strh r0, [r7, #0x74]
	ldrh r0, [r7, #0x36]
	strh r0, [r7, #0x76]
	ldrh r0, [r7, #0x38]
	strh r0, [r7, #0x78]
	ldrh r0, [r7, #0x3a]
	strh r0, [r7, #0x7a]
_02028064:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028070: .word WINDOW_LIST
_02028074: .word _0209AC64
_02028078: .word _022A7AE4
_0202807C: .word _020AFD4C
	arm_func_end sub_02027E30

	arm_func_start sub_02028080
sub_02028080: ; 0x02028080
	stmdb sp!, {r4, lr}
	ldr r3, _020280B8 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r4, r0, r2, r3
	strb r1, [r4, #9]
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	ldr r0, _020280BC ; =_020AFD4C
	ldrb r1, [r4, #8]
	ldr r3, [r0, #8]
	mov r2, #1
	orr r1, r3, r2, lsl r1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020280B8: .word WINDOW_LIST
_020280BC: .word _020AFD4C
	arm_func_end sub_02028080

	arm_func_start sub_020280C0
sub_020280C0: ; 0x020280C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #1
	mov r5, r0
	bl sub_02027E30
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0xe0
	mul r3, r5, r1
	ldr r2, _02028104 ; =_022A88E4
	ldr r1, _02028108 ; =_020AFD4C
	ldrb r2, [r2, r3]
	ldr ip, [r1, #8]
	mov r3, #1
	orr r2, ip, r3, lsl r2
	str r2, [r1, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028104: .word _022A88E4
_02028108: .word _020AFD4C
	arm_func_end sub_020280C0

	arm_func_start sub_0202810C
sub_0202810C: ; 0x0202810C
	ldr ip, _02028118 ; =sub_020280C0
	mov r1, #1
	bx ip
	.align 2, 0
_02028118: .word sub_020280C0
	arm_func_end sub_0202810C

	arm_func_start sub_0202811C
sub_0202811C: ; 0x0202811C
	ldr ip, _02028128 ; =sub_02027E30
	mov r1, #1
	bx ip
	.align 2, 0
_02028128: .word sub_02027E30
	arm_func_end sub_0202811C

	arm_func_start sub_0202812C
sub_0202812C: ; 0x0202812C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r1, #0xe0
	mul r5, r6, r1
	ldr r1, _02028188 ; =_022A8992
	ldrsb r1, [r1, r5]
	cmp r1, #3
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, #0
	bl sub_02027E30
	mov r4, r0
	mov r0, r6
	bl sub_0202836C
	ldr r0, _0202818C ; =_022A88E4
	ldr r1, _02028190 ; =_020AFD4C
	ldrb r0, [r0, r5]
	ldr r3, [r1, #8]
	mov r2, #1
	orr r2, r3, r2, lsl r0
	mov r0, r4
	str r2, [r1, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02028188: .word _022A8992
_0202818C: .word _022A88E4
_02028190: .word _020AFD4C
	arm_func_end sub_0202812C

	arm_func_start DeleteWindow
DeleteWindow: ; 0x02028194
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02028224 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r4, r0, r1, r2
	bl sub_0202812C
	ldrb r5, [r4, #8]
	ldr lr, _02028224 ; =WINDOW_LIST
	mov ip, #1
	mov r3, #0
_020281B8:
	cmp lr, r4
	ldrnesb r0, [lr, #0xb6]
	cmpne r0, #0
	beq _020281EC
	ldrb r0, [lr, #8]
	cmp r5, r0
	bne _020281EC
	ldrh r2, [lr, #0x12]
	ldrb r1, [lr, #6]
	ldrb r0, [lr, #7]
	mla r0, r1, r0, r2
	cmp ip, r0
	movlt ip, r0
_020281EC:
	add r3, r3, #1
	cmp r3, #0x14
	add lr, lr, #0xe0
	blt _020281B8
	ldr r0, [r4, #0x14]
	ldr r1, _02028228 ; =_022A7A74
	mov r2, r5, lsl #1
	strh ip, [r1, r2]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02028224: .word WINDOW_LIST
_02028228: .word _022A7A74
	arm_func_end DeleteWindow

	arm_func_start sub_0202822C
sub_0202822C: ; 0x0202822C
	stmdb sp!, {r4, lr}
	ldr r2, _02028258 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r4, r0, r1, r2
	ldr r0, [r4, #0x14]
	bl MemFree
	ldrsb r0, [r4, #0x10]
	bl sub_02027974
	mov r0, #0
	strb r0, [r4, #0xb6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028258: .word WINDOW_LIST
	arm_func_end sub_0202822C

	arm_func_start sub_0202825C
sub_0202825C: ; 0x0202825C
	ldr r2, _0202826C ; =_022A7A74
	mov r0, r0, lsl #1
	strh r1, [r2, r0]
	bx lr
	.align 2, 0
_0202826C: .word _022A7A74
	arm_func_end sub_0202825C

	arm_func_start sub_02028270
sub_02028270: ; 0x02028270
	ldr r1, _02028280 ; =_022A7A74
	mov r0, r0, lsl #1
	ldrh r0, [r1, r0]
	bx lr
	.align 2, 0
_02028280: .word _022A7A74
	arm_func_end sub_02028270

	arm_func_start GetWindowRectangle
GetWindowRectangle: ; 0x02028284
	ldr r3, _020282C4 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r3, r0, r2, r3
	ldrb r0, [r3, #5]
	mov r2, r0, lsl #3
	str r2, [r1]
	ldrb r0, [r3, #7]
	add r0, r2, r0, lsl #3
	str r0, [r1, #4]
	ldrb r0, [r3, #4]
	mov r2, r0, lsl #3
	str r2, [r1, #8]
	ldrb r0, [r3, #6]
	add r0, r2, r0, lsl #3
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020282C4: .word WINDOW_LIST
	arm_func_end GetWindowRectangle

	arm_func_start sub_020282C8
sub_020282C8: ; 0x020282C8
	ldr r3, _020282F0 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r2, r0, r2, r3
	ldrb r0, [r2, #7]
	mov r0, r0, lsl #3
	str r0, [r1, #4]
	ldrb r0, [r2, #6]
	mov r0, r0, lsl #3
	str r0, [r1]
	bx lr
	.align 2, 0
_020282F0: .word WINDOW_LIST
	arm_func_end sub_020282C8

	arm_func_start sub_020282F4
sub_020282F4: ; 0x020282F4
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028308 ; =_022A8994
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02028308: .word _022A8994
	arm_func_end sub_020282F4

	arm_func_start sub_0202830C
sub_0202830C: ; 0x0202830C
	mov r2, #0xe0
	mul r2, r0, r2
	ldr r0, _02028320 ; =_022A8994
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_02028320: .word _022A8994
	arm_func_end sub_0202830C

	arm_func_start sub_02028324
sub_02028324: ; 0x02028324
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028338 ; =_022A88E4
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028338: .word _022A88E4
	arm_func_end sub_02028324

	arm_func_start GetWindowContents
GetWindowContents: ; 0x0202833C
	ldr r2, _02028350 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_02028350: .word WINDOW_LIST
	arm_func_end GetWindowContents

	arm_func_start sub_02028354
sub_02028354: ; 0x02028354
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028368 ; =_022A8992
	ldrsb r0, [r0, r1]
	bx lr
	.align 2, 0
_02028368: .word _022A8992
	arm_func_end sub_02028354

	arm_func_start sub_0202836C
sub_0202836C: ; 0x0202836C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, _02028438 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r6, r0, r1, r2
	ldrb r0, [r6, #8]
	cmp r0, #0
	bne _020283A4
	ldrb r0, [r6, #4]
	ldrb r1, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	bl sub_02029154
	b _02028428
_020283A4:
	ldrb r0, [r6, #8]
	bl sub_0202843C
	ldrb r1, [r6, #5]
	mov r7, r0
	add r5, sp, #0
	str r1, [sp, #4]
	mov r4, #0
	b _02028410
_020283C4:
	ldrb r0, [r6, #4]
	str r0, [sp]
	b _020283EC
_020283D0:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020283EC:
	ldrb r1, [r6, #4]
	ldrb r0, [r6, #6]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020283D0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_02028410:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #7]
	ldr r2, [sp, #4]
	add r0, r1, r0
	cmp r2, r0
	blt _020283C4
_02028428:
	ldrb r0, [r6, #8]
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028438: .word WINDOW_LIST
	arm_func_end sub_0202836C

	arm_func_start sub_0202843C
sub_0202843C: ; 0x0202843C
	cmp r0, #1
	ldreq r0, _02028458 ; =_022A7B00
	bxeq lr
	cmp r0, #2
	ldreq r0, _0202845C ; =_022A7AE4
	ldrne r0, _02028460 ; =_022A7AC8
	bx lr
	.align 2, 0
_02028458: .word _022A7B00
_0202845C: .word _022A7AE4
_02028460: .word _022A7AC8
	arm_func_end sub_0202843C

	arm_func_start sub_02028464
sub_02028464: ; 0x02028464
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x14
	ldr r3, _02028768 ; =WINDOW_LIST
	mov r2, #0xe0
	mla r4, r0, r2, r3
	ldrsb r0, [r4, #9]
	ldrb r5, [r4, #8]
	ldr r7, _0202876C ; =_0209AC64
	rsb r2, r0, #0
	mov r0, r5
	mov r6, r2, lsl #1
	mov r8, r1
	bl sub_0202843C
	ldrsb r1, [r7, r6]
	mov r6, r0
	cmp r1, #0
	movlt r8, #0
	cmp r5, #0
	bne _020284D8
	ldrh r0, [r4, #0x30]
	str r0, [sp]
	ldrb r0, [r4, #0x11]
	stmib sp, {r0, r8}
	ldrb r0, [r4, #4]
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	bl sub_020291FC
	b _02028758
_020284D8:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _0202857C
	ldrh r0, [r4, #0x30]
	ldrb r1, [r4, #5]
	add r7, sp, #0xc
	orr r0, r0, #0x400
	mov r0, r0, lsl #0x10
	str r1, [sp, #0x10]
	mov sb, r0, lsr #0x10
	b _02028560
_02028504:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028544
_0202851C:
	add r0, sb, #1
	mov r2, sb
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, r7
	mov sb, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0xc]
_02028544:
	ldrb r0, [r4, #4]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bge _0202851C
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02028560:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	ldr r2, [sp, #0x10]
	add r1, r0, r1
	cmp r2, r1
	blt _02028504
	b _02028600
_0202857C:
	ldrh r7, [r4, #0x30]
	ldrb sl, [r4, #5]
	add sb, sp, #0xc
	b _020285EC
_0202858C:
	mov r1, sl, lsr #0x1f
	ldrb r2, [r4, #4]
	rsb r0, r1, sl, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #0x10]
	str r2, [sp, #0xc]
	b _020285D0
_020285A8:
	add r0, r7, #1
	mov r2, r7
	mov r3, r0, lsl #0x10
	mov r0, r6
	mov r1, sb
	mov r7, r3, lsr #0x10
	bl sub_0200B3FC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_020285D0:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	blt _020285A8
	add sl, sl, #1
_020285EC:
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #7]
	add r1, r0, r1
	cmp sl, r1
	blt _0202858C
_02028600:
	cmp r8, #0
	beq _02028758
	subs r0, r0, #1
	str r0, [sp, #0x10]
	bmi _02028670
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028658
_0202862C:
	cmp r2, #0
	blt _0202864C
	cmp r2, #0x20
	bge _0202864C
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_0202864C:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028658:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _0202862C
_02028670:
	ldrb r0, [r4, #5]
	mov r8, #0
	add sb, sp, #0xc
	str r0, [sp, #0x10]
	mov r7, r8
	b _020286DC
_02028688:
	ldrb r0, [r4, #4]
	subs r0, r0, #1
	str r0, [sp, #0xc]
	bmi _020286A8
	mov r0, r6
	mov r1, sb
	mov r2, r8
	bl sub_0200B3FC
_020286A8:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	add r0, r1, r0
	str r0, [sp, #0xc]
	cmp r0, #0x20
	bge _020286D0
	mov r0, r6
	mov r1, sb
	mov r2, r7
	bl sub_0200B3FC
_020286D0:
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_020286DC:
	ldrb r1, [r4, #5]
	ldrb r0, [r4, #7]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	cmp r2, r0
	blt _02028688
	cmp r2, #0x18
	bge _02028758
	ldrb r0, [r4, #4]
	add r8, sp, #0xc
	mov r7, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	b _02028740
_02028714:
	cmp r2, #0
	blt _02028734
	cmp r2, #0x20
	bge _02028734
	mov r0, r6
	mov r1, r8
	mov r2, r7
	bl sub_0200B3FC
_02028734:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_02028740:
	ldrb r1, [r4, #4]
	ldrb r0, [r4, #6]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	cmp r2, r0
	ble _02028714
_02028758:
	mov r0, r5
	bl sub_02027AA0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028768: .word WINDOW_LIST
_0202876C: .word _0209AC64
	arm_func_end sub_02028464

	arm_func_start sub_02028770
sub_02028770: ; 0x02028770
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020287C0 ; =WINDOW_LIST
	mov r5, r0
	mov r1, #0xe0
	mla r4, r5, r1, r2
	bl sub_0202836C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	strb r0, [r4, #4]
	mov r0, r5
	mov r1, #1
	strb r2, [r4, #5]
	bl sub_02027E30
	mov r0, r5
	mov r1, #1
	bl sub_02028464
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020287C0: .word WINDOW_LIST
	arm_func_end sub_02028770

	arm_func_start sub_020287C4
sub_020287C4: ; 0x020287C4
	ldr r1, _020287DC ; =_020AFD4C
	mov r2, #1
	ldr r3, [r1, #8]
	orr r0, r3, r2, lsl r0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020287DC: .word _020AFD4C
	arm_func_end sub_020287C4

	arm_func_start sub_020287E0
sub_020287E0: ; 0x020287E0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02028840 ; =_022A7A6C
	mov r6, r0
#ifdef JAPAN
	ldrsb r0, [r1, #1]
#else
	ldrsb r0, [r1, #3]
#endif
	mov r1, #0
	mov sb, #1
	ldr r4, _02028844 ; =WINDOW_LIST
	mov r8, #0xe0
	mvn r7, #1
	b _0202882C
_02028808:
	mla r5, r0, r8, r4
	ldrsb r2, [r5, #0xb6]
	cmp r2, #2
	ldreqb r2, [r5, #8]
	cmpeq r6, r2
	bne _02028828
	bl sub_02028464
	mov r1, sb
_02028828:
	ldrsb r0, [r5, #0xb5]
_0202882C:
	cmp r0, r7
	bne _02028808
	mov r0, r6
	bl sub_02027AA0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02028840: .word _022A7A6C
_02028844: .word WINDOW_LIST
	arm_func_end sub_020287E0

	arm_func_start sub_02028848
sub_02028848: ; 0x02028848
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020288D0 ; =_022A7A6C
	ldr r6, _020288D4 ; =WINDOW_LIST
#ifdef JAPAN
	ldrsb r0, [r0, #1]
#else
	ldrsb r0, [r0, #3]
#endif
	mov r5, #0xe0
	mvn r4, #1
	b _02028888
_02028864:
	mla r7, r0, r5, r6
	ldrsb r0, [r7, #0xb6]
	cmp r0, #0
	ldrne r1, [r7]
	cmpne r1, #0
	beq _02028884
	mov r0, r7
	blx r1
_02028884:
	ldrsb r0, [r7, #0xb5]
_02028888:
	cmp r0, r4
	bne _02028864
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #1
	beq _020288A8
	mov r0, #0
	bl sub_020287E0
_020288A8:
	ldr r0, _020288D8 ; =_020AFD4C
	ldr r0, [r0, #8]
	tst r0, #2
	beq _020288C0
	mov r0, #1
	bl sub_020287E0
_020288C0:
	ldr r0, _020288D8 ; =_020AFD4C
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020288D0: .word _022A7A6C
_020288D4: .word WINDOW_LIST
_020288D8: .word _020AFD4C
	arm_func_end sub_02028848

	arm_func_start sub_020288DC
sub_020288DC: ; 0x020288DC
	ldr r2, _020288F4 ; =WINDOW_LIST
	mov r1, #0xe0
	mla r1, r0, r1, r2
	ldr ip, _020288F8 ; =InitWindowTrailer
	add r0, r1, #0xbc
	bx ip
	.align 2, 0
_020288F4: .word WINDOW_LIST
_020288F8: .word InitWindowTrailer
	arm_func_end sub_020288DC

	arm_func_start sub_020288FC
sub_020288FC: ; 0x020288FC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028944 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq ip, #1
	stmia sp, {r2, r3}
	movne ip, #0
	mov r2, r1
	add r0, r4, #0xbc
	and r3, ip, #0xff
	mov r1, #0
	bl sub_02029688
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028944: .word WINDOW_LIST
	arm_func_end sub_020288FC

	arm_func_start sub_02028948
sub_02028948: ; 0x02028948
	stmdb sp!, {r3, lr}
	ldr r3, _0202897C ; =WINDOW_LIST
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029758
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202897C: .word WINDOW_LIST
	arm_func_end sub_02028948

	arm_func_start sub_02028980
sub_02028980: ; 0x02028980
	stmdb sp!, {r3, lr}
	ldr r3, _020289B4 ; =WINDOW_LIST
	mov r2, #0xe0
	mla ip, r0, r2, r3
	ldr r3, [ip, #0xb8]
	sub r0, r2, #0xe1
	cmp r3, r0
	moveq r2, #1
	movne r2, #0
	add r0, ip, #0xbc
	and r2, r2, #0xff
	bl sub_02029828
	ldmia sp!, {r3, pc}
	.align 2, 0
_020289B4: .word WINDOW_LIST
	arm_func_end sub_02028980

	arm_func_start sub_020289B8
sub_020289B8: ; 0x020289B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr lr, _02028A04 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	ldr lr, [r4, #0xb8]
	sub r0, ip, #0xe1
	cmp lr, r0
	moveq lr, #1
	str r3, [sp]
	ldr ip, [sp, #0x10]
	movne lr, #0
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #4]
	bl sub_020298F8
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A04: .word WINDOW_LIST
	arm_func_end sub_020289B8

	arm_func_start sub_02028A08
sub_02028A08: ; 0x02028A08
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr lr, _02028A60 ; =WINDOW_LIST
	mov ip, #0xe0
	mla r4, r0, ip, lr
	sub r0, ip, #0xe1
	ldr lr, [r4, #0xb8]
	ldr ip, [sp, #0x18]
	cmp lr, r0
	stmia sp, {r3, ip}
	moveq lr, #1
	ldr r0, [sp, #0x1c]
	movne lr, #0
	str r0, [sp, #8]
	ldr ip, [sp, #0x20]
	mov r3, r2
	add r0, r4, #0xbc
	and r2, lr, #0xff
	str ip, [sp, #0xc]
	bl sub_02029998
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_02028A60: .word WINDOW_LIST
	arm_func_end sub_02028A08

	arm_func_start sub_02028A64
sub_02028A64: ; 0x02028A64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02028DE8 ; =_020AFD4C
	movs r4, r0
#ifdef JAPAN
	strb r4, [r1, #2]
#else
	strb r4, [r1, #4]
#endif
	mov r5, #8
	beq _02028D58
	ldr r0, _02028DEC ; =_022A7A6C
	mov r1, #0
#ifdef JAPAN
	ldrsb r3, [r0, #1]
#else
	ldrsb r3, [r0, #3]
	strb r3, [r0, #5]
#endif
	strh r1, [r0, #6]
	b _02028BF4
_02028A94:
	ldr r1, _02028DF0 ; =WINDOW_LIST
	mov r0, #0xe0
	mla r6, r3, r0, r1
	ldrsb r1, [r6, #0xb6]
	ldr r2, _02028DF4 ; =_022A7B1C
#ifdef JAPAN
	mov r0, #0x2c
#else
	mov r0, #0x30
#endif
	mla r7, r3, r0, r2
	cmp r1, #0
#ifdef JAPAN
	mov r0, #0
	beq _02028BDC
#else
	beq _02028BDC
	mov r0, #0
#endif
	strb r0, [r6, #0xb7]
	ldrb r0, [r6, #8]
	mov r1, #1
	strb r1, [r7]
	cmp r0, #0
	bne _02028BC4
	ldr r0, _02028DF8 ; =MENU_CONTROL_PTR
	ldrsb r3, [r6, #9]
	ldrb r2, [r0]
	ldr r0, _02028DEC ; =_022A7A6C
	ldr r1, _02028DFC ; =_0209ACA8
	ldrsh r0, [r0, #0x58]
	rsb r3, r3, #0
	ldrb r1, [r1, r2]
	ldr r2, _02028E00 ; =_0209AC64
	mov r3, r3, lsl #1
	ldrsb r8, [r2, r3]
	bl sub_020278A8
	mov r1, r5, lsl #1
	str r0, [r6, #0x98]
	add r0, r1, #9
	strh r0, [r6, #0x9e]
	add r0, r1, #0xa
	strh r0, [r6, #0x5e]
	cmp r8, #0
	sub r5, r5, #1
	blt _02028BC4
	ldrsh r0, [r6, #0x38]
	cmp r0, #0
	beq _02028BC4
	ldr r0, _02028E04 ; =_0209AC78
	mov r1, r8, lsl #3
	add r3, r0, r8, lsl #3
	ldrsh r1, [r0, r1]
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r2, [r3, #2]
	strh r1, [r6, #0x8a]
	ldrsh r8, [r0, #6]
	ldrsh r1, [r3, #4]
	strh r2, [r6, #0x8c]
	ldrsh r0, [r3, #6]
	strh r1, [r6, #0x8e]
	cmp r8, #0x14
	strh r0, [r6, #0x90]
	bge _02028BC4
	ldr r0, _02028E08 ; =_022A7EDC
	add ip, r6, #0x34
	add sl, r0, r8, lsl #7
	mov sb, #4
_02028B80:
	ldmia ip!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _02028B80
	ldr r0, _02028E08 ; =_022A7EDC
	add sl, r6, #0x74
	add r0, r0, r8, lsl #7
	add sb, r0, #0x40
	mov r8, #4
_02028BA4:
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _02028BA4
	ldr r0, _02028DEC ; =_022A7A6C
	ldrsh r1, [r0, #6]
	add r1, r1, #1
	strh r1, [r0, #6]
_02028BC4:
	add r0, r7, #4
	add r1, r6, #0xbc
	bl sub_02029A68
	add r0, r7, #4
	bl sub_02029B0C
	b _02028BEC
_02028BDC:
#ifdef JAPAN
	strb r0, [r7]
#else
	mov r1, #0
	add r0, r7, #4
	strb r1, [r7]
	bl sub_02029A50
#endif
_02028BEC:
	ldrsb r3, [r6, #0xb5]
#ifndef JAPAN
	strb r3, [r7, #0x2c]
#endif
_02028BF4:
	mvn r0, #1
	cmp r3, r0
	bne _02028A94
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1]
#else
	ldrb r0, [r1, #4]
#endif
	cmp r0, #0
	beq _02028C20
	ldr r0, _02028E0C ; =_022A7AA0
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1]
#else
	strb r2, [r1, #4]
#endif
	bl sub_0200A174
_02028C20:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #4]
#else
	ldrb r0, [r1]
#endif
	cmp r0, #0
	beq _02028C40
	ldr r0, _02028E10 ; =_022A7A8C
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #4]
#else
	strb r2, [r1]
#endif
	bl sub_0200A174
_02028C40:
	ldr r1, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldrb r0, [r1, #2]
#else
	ldrb r0, [r1, #1]
#endif
	cmp r0, #0
	beq _02028C60
	ldr r0, _02028E14 ; =_022A7A78
	mov r2, #0
#ifdef JAPAN
	strb r2, [r1, #2]
#else
	strb r2, [r1, #1]
#endif
	bl sub_0200A174
_02028C60:
	mov r8, #0
	ldr r7, _02028DF0 ; =WINDOW_LIST
	mov r6, r8
	mov r5, #0xe0
_02028C70:
	mla sl, r8, r5, r7
	ldrsb r0, [sl, #0xb6]
	cmp r0, #0
	ldrne sb, [sl, #0x2c]
	cmpne sb, #0
	beq _02028CB8
	ldr r0, [sl, #0x28]
	ldr r1, [sl, #0x24]
	mov r2, sb
	bl Memcpy32
	ldr r0, [sl, #0x24]
	bic r1, sb, #3
	add r0, r0, r1
	str r0, [sl, #0x24]
	ldr r0, [sl, #0x28]
	add r0, r0, r1
	str r0, [sl, #0x28]
	str r6, [sl, #0x2c]
_02028CB8:
	add r0, r8, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, asr #0x18
	cmp r8, #0x14
	blt _02028C70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028D08
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028D08:
	bl sub_02028FC8
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0, #3]
#else
	ldrb r0, [r0]
#endif
	cmp r0, #0
	beq _02028D30
	ldr r0, _02028E24 ; =_022A7B00
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0, #3]
#else
	strb r1, [r0]
#endif
_02028D30:
	ldr r0, _02028DE8 ; =_020AFD4C
#ifdef JAPAN
	ldrb r0, [r0]
#else
	ldrb r0, [r0, #3]
#endif
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E28 ; =_022A7AE4
	bl sub_0200B330
	ldr r0, _02028DE8 ; =_020AFD4C
	mov r1, #0
#ifdef JAPAN
	strb r1, [r0]
#else
	strb r1, [r0, #3]
#endif
	b _02028DD4
_02028D58:
	ldr r0, _02028DEC ; =_022A7A6C
#ifdef JAPAN
	ldr r6, _02028DF0 ; =WINDOW_LIST
	ldrsb r2, [r0, #1]
	ldr r5, _02028DF4 ; =_022A7B1C
	mov sb, #0xe0
	mov sl, #0x2c
	mvn r8, #1
	b _02028D90
_02028D70:
	mul r1, r2, sl
	ldrb r0, [r5, r1]
	mla r7, r2, sb, r6
	cmp r0, #0
	add r0, r5, r1
	beq _02028D8C
	add r0, r0, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r2, [r7, #0xb5]
_02028D90:
	cmp r2, r8
#else
	ldr r7, _02028DF4 ; =_022A7B1C
	ldrsb r0, [r0, #5]
	mov r6, #0x30
	mvn r5, #1
	b _02028D90
_02028D70:
	mul r1, r0, r6
	ldrb r0, [r7, r1]
	add r8, r7, r1
	cmp r0, #0
	beq _02028D8C
	add r0, r8, #4
	bl sub_02029B0C
_02028D8C:
	ldrsb r0, [r8, #0x2c]
_02028D90:
	cmp r0, r5
#endif
	bne _02028D70
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02028DD4
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_02029054
	ldr r0, _02028E20 ; =_022A7AC8
	bl sub_0200B330
	ldr r0, _02028E18 ; =_020AFD9C
	ldr r1, _02028E1C ; =_020AFD94
	ldrh r0, [r0]
	mov r2, #0
	strb r2, [r1, r0]
_02028DD4:
	bl sub_02029EC4
	bl sub_02029FE8
	mov r0, r4
	bl sub_0202A2C8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02028DE8: .word _020AFD4C
_02028DEC: .word _022A7A6C
_02028DF0: .word WINDOW_LIST
_02028DF4: .word _022A7B1C
_02028DF8: .word MENU_CONTROL_PTR
_02028DFC: .word _0209ACA8
_02028E00: .word _0209AC64
_02028E04: .word _0209AC78
_02028E08: .word _022A7EDC
_02028E0C: .word _022A7AA0
_02028E10: .word _022A7A8C
_02028E14: .word _022A7A78
_02028E18: .word _020AFD9C
_02028E1C: .word _020AFD94
_02028E20: .word _022A7AC8
_02028E24: .word _022A7B00
_02028E28: .word _022A7AE4
	arm_func_end sub_02028A64

	arm_func_start sub_02028E2C
sub_02028E2C: ; 0x02028E2C
	ldr r0, _02028E3C ; =_022A7A6C
	mov r1, #0
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
_02028E3C: .word _022A7A6C
	arm_func_end sub_02028E2C

	arm_func_start sub_02028E40
sub_02028E40: ; 0x02028E40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r5, _02028E80 ; =_022A7EDC
	ldr r4, _02028E84 ; =_022A7A6C
	b _02028E6C
_02028E54:
	add r7, r5, r6, lsl #7
	mov r0, r7
	bl sub_0201F2A0
	add r0, r7, #0x40
	bl sub_0201F2A0
	add r6, r6, #1
_02028E6C:
	ldrsh r0, [r4, #6]
	cmp r6, r0
	blt _02028E54
	bl sub_0202A388
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02028E80: .word _022A7EDC
_02028E84: .word _022A7A6C
	arm_func_end sub_02028E40

	arm_func_start sub_02028E88
sub_02028E88: ; 0x02028E88
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _02028ED0 ; =_022A7AC8
	bl sub_0200B340
	ldr r0, _02028ED4 ; =_022A7B00
	bl sub_0200B340
	ldr r0, _02028ED8 ; =_022A7AE4
	bl sub_0200B340
	ldr r0, _02028EDC ; =_022A7AA0
	bl sub_0200A184
	ldr r0, _02028EE0 ; =_022A7A8C
	bl sub_0200A184
	ldr r0, _02028EE4 ; =_022A7A78
	bl sub_0200A184
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_02028ED0: .word _022A7AC8
_02028ED4: .word _022A7B00
_02028ED8: .word _022A7AE4
_02028EDC: .word _022A7AA0
_02028EE0: .word _022A7A8C
_02028EE4: .word _022A7A78
	arm_func_end sub_02028E88

	arm_func_start sub_02028EE8
sub_02028EE8: ; 0x02028EE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r7, r3
	bl sub_0202843C
	mov r5, r0
	ldr r6, [sb, #4]
	add r4, sp, #0
	mov fp, #0
	b _02028F68
_02028F18:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	ldr r0, [sb]
	str r0, [sp]
	b _02028F50
_02028F34:
	mov r0, r5
	mov r1, r4
	mov r2, fp
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_02028F50:
	ldr r0, [sb]
	ldr r1, [sp]
	add r0, r0, r8
	cmp r1, r0
	blt _02028F34
	add r6, r6, #1
_02028F68:
	ldr r0, [sb, #4]
	add r0, r0, r7
	cmp r6, r0
	blt _02028F18
	mov r0, sl
	bl sub_02027AA0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02028EE8

	arm_func_start sub_02028F88
sub_02028F88: ; 0x02028F88
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl sub_0202843C
	mov r1, r4
	bl sub_0200B3C0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02028F88

	arm_func_start sub_02028FA0
sub_02028FA0: ; 0x02028FA0
	mov r1, #0xe0
	mul r1, r0, r1
	ldr r0, _02028FC4 ; =_022A8908
	ldr r0, [r0, r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02028FC4: .word _022A8908
	arm_func_end sub_02028FA0

	arm_func_start sub_02028FC8
sub_02028FC8: ; 0x02028FC8
	ldr r0, _02028FDC ; =_020AFD9C
	ldrh r1, [r0]
	eor r1, r1, #1
	strh r1, [r0]
	bx lr
	.align 2, 0
_02028FDC: .word _020AFD9C
	arm_func_end sub_02028FC8

	arm_func_start sub_02028FE0
sub_02028FE0: ; 0x02028FE0
	ldr r1, _02028FF8 ; =0x00000904
	ldr r2, _02028FFC ; =_022A9A5C
	mov r3, #0
	smlabb r0, r0, r1, r2
	str r3, [r0, #0x900]
	bx lr
	.align 2, 0
_02028FF8: .word 0x00000904
_02028FFC: .word _022A9A5C
	arm_func_end sub_02028FE0

	arm_func_start sub_02029000
sub_02029000: ; 0x02029000
	ldr r2, _02029034 ; =_022A9A5C
	ldr r1, _02029038 ; =0x00000904
	smlabb r2, r0, r1, r2
	ldr r0, [r2, #0x900]
	add r1, r0, #1
	mov r0, r0, lsl #0x10
	str r1, [r2, #0x900]
	cmp r1, #0x10
	mov r1, r0, asr #0x10
	movge r0, #0x10
	strge r0, [r2, #0x900]
	add r0, r2, r1, lsl #4
	bx lr
	.align 2, 0
_02029034: .word _022A9A5C
_02029038: .word 0x00000904
	arm_func_end sub_02029000

	arm_func_start sub_0202903C
sub_0202903C: ; 0x0202903C
	ldr r0, _0202904C ; =_020AFD9C
	ldr ip, _02029050 ; =sub_02028FE0
	ldrsh r0, [r0]
	bx ip
	.align 2, 0
_0202904C: .word _020AFD9C
_02029050: .word sub_02028FE0
	arm_func_end sub_0202903C

	arm_func_start sub_02029054
sub_02029054: ; 0x02029054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r2, _02029144 ; =_020AFD9C
	ldr r1, _02029148 ; =0x00000904
	ldrh sl, [r2]
	ldr r6, _0202914C ; =_022A9A5C
	ldr r2, _02029150 ; =_022AA35C
	mul r3, sl, r1
	smlabb r4, sl, r1, r6
	ldr r1, [r2, r3]
	add r5, r4, #0x100
	mov fp, r0
	mov r4, r1, lsl #0x10
	add sb, r6, r3
	mov r7, #0
	b _02029120
_02029094:
	add r8, sb, r7, lsl #4
	ldr r6, [r8, #4]
	b _02029100
_020290A0:
	mov r1, r6, lsr #0x1f
	rsb r0, r1, r6, lsl #27
	ldr r2, [r8]
	add r0, r1, r0, ror #27
	str r0, [sp, #4]
	str r2, [sp]
	b _020290E4
_020290BC:
	ldr r0, [sp, #4]
	mov r1, r2, lsl #1
	add r0, r5, r0, lsl #6
	ldrh r2, [r1, r0]
	mov r0, fp
	add r1, sp, #0
	bl sub_0200B3FC
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
_020290E4:
	ldr r1, [r8]
	ldr r0, [r8, #8]
	ldr r2, [sp]
	add r0, r1, r0
	cmp r2, r0
	blt _020290BC
	add r6, r6, #1
_02029100:
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	add r0, r1, r0
	cmp r6, r0
	blt _020290A0
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
_02029120:
	cmp r7, r4, asr #16
	blt _02029094
	ldr r0, _02029148 ; =0x00000904
	ldr r1, _0202914C ; =_022A9A5C
	mov r2, #0
	smlabb r0, sl, r0, r1
	str r2, [r0, #0x900]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02029144: .word _020AFD9C
_02029148: .word 0x00000904
_0202914C: .word _022A9A5C
_02029150: .word _022AA35C
	arm_func_end sub_02029054

	arm_func_start sub_02029154
sub_02029154: ; 0x02029154
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020291F0 ; =_020AFD9C
	mov r7, r0
	ldrh r0, [r4]
	mov r6, r1
	mov r5, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r4, r3
	bl sub_02029000
	ldr r1, _020291F0 ; =_020AFD9C
	ldr ip, _020291F4 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r2, _020291F8 ; =0x00000904
	add r1, r7, r5
	str r7, [r0]
	eor r3, r3, #1
	smlabb r2, r3, r2, ip
	str r6, [r0, #4]
	str r5, [r0, #8]
	str r4, [r0, #0xc]
	add r5, r2, #0x100
	add ip, r6, r4
	mov r3, #0
	b _020291E4
_020291BC:
	mov r0, r6, lsl #5
	mov r4, r7
	add r0, r5, r0, lsl #1
	b _020291D8
_020291CC:
	mov r2, r4, lsl #1
	strh r3, [r2, r0]
	add r4, r4, #1
_020291D8:
	cmp r4, r1
	blt _020291CC
	add r6, r6, #1
_020291E4:
	cmp r6, ip
	blt _020291BC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020291F0: .word _020AFD9C
_020291F4: .word _022A9A5C
_020291F8: .word 0x00000904
	arm_func_end sub_02029154

	arm_func_start sub_020291FC
sub_020291FC: ; 0x020291FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _0202946C ; =_020AFD9C
	mov r5, r0
	ldrh r0, [r4]
	mov r4, r1
	mov r8, r2
	eor r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r7, r3
	ldr r6, [sp, #0x18]
	bl sub_02029000
	ldr r1, _0202946C ; =_020AFD9C
	ldr ip, _02029470 ; =_022A9A5C
	ldrh r3, [r1]
	ldr r1, _02029474 ; =0x00000904
	ldrb r2, [sp, #0x1c]
	str r5, [r0]
	eor r3, r3, #1
	smlabb r1, r3, r1, ip
	stmib r0, {r4, r8}
	str r7, [r0, #0xc]
	cmp r2, #0
	add r1, r1, #0x100
	beq _020292BC
	orr r2, r6, #0x400
	mov r2, r2, lsl #0x10
	add r3, r5, r8
	mov r6, r2, lsr #0x10
	sub ip, r3, #1
	add lr, r4, r7
	b _020292B0
_0202927C:
	mov r2, r4, lsl #5
	mov r8, ip
	add r3, r1, r2, lsl #1
	b _020292A4
_0202928C:
	add r2, r6, #1
	mov r7, r8, lsl #1
	mov r2, r2, lsl #0x10
	strh r6, [r7, r3]
	mov r6, r2, lsr #0x10
	sub r8, r8, #1
_020292A4:
	cmp r8, r5
	bge _0202928C
	add r4, r4, #1
_020292B0:
	cmp r4, lr
	blt _0202927C
	b _02029310
_020292BC:
	add r2, r5, r8
	add r3, r4, r7
	b _02029308
_020292C8:
	mov r8, r4, lsr #0x1f
	rsb r7, r8, r4, lsl #27
	add r7, r8, r7, ror #27
	mov r7, r7, lsl #5
	mov ip, r5
	add r8, r1, r7, lsl #1
	b _020292FC
_020292E4:
	add r7, r6, #1
	mov lr, ip, lsl #1
	mov r7, r7, lsl #0x10
	strh r6, [lr, r8]
	mov r6, r7, lsr #0x10
	add ip, ip, #1
_020292FC:
	cmp ip, r2
	blt _020292E4
	add r4, r4, #1
_02029308:
	cmp r4, r3
	blt _020292C8
_02029310:
	ldrb r2, [sp, #0x20]
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, [r0]
	subs r2, r2, #1
	str r2, [r0]
	movmi r2, #0
	strmi r2, [r0]
	ldr r2, [r0, #4]
	subs r2, r2, #1
	str r2, [r0, #4]
	movmi r2, #0
	strmi r2, [r0, #4]
	ldr r2, [r0, #8]
	add r2, r2, #1
	str r2, [r0, #8]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #8]
	ldr r2, [r0, #0xc]
	add r2, r2, #1
	str r2, [r0, #0xc]
	cmp r2, #0x20
	movgt r2, #0x20
	strgt r2, [r0, #0xc]
	ldr r5, [r0, #0xc]
	ldmia r0, {r2, r3, r6}
	mov r0, r3, lsl #0x10
	mov r4, r2, lsl #0x10
	mov r5, r5, lsl #0x10
	mov r3, r6, lsl #0x10
	movs r2, r0, asr #0x10
	mov r4, r4, asr #0x10
	bmi _020293D8
	mov r0, r2, lsl #5
	mov r8, r4
	add ip, r4, r3, asr #16
	add r6, r1, r0, lsl #1
	mov r7, #0
	b _020293D0
_020293B0:
	cmp r8, #0
	blt _020293C4
	cmp r8, #0x20
	movlt r0, r8, lsl #1
	strlth r7, [r0, r6]
_020293C4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
_020293D0:
	cmp r8, ip
	ble _020293B0
_020293D8:
	add r3, r4, r3, asr #16
	add r0, r2, r5, asr #16
	mov r5, r3, lsl #0x10
	mov r8, r5, asr #0x10
	mov lr, #0
	mov ip, r4, lsl #1
	mov r6, r8, lsl #1
	mov r7, lr
	b _02029420
_020293FC:
	cmp r4, #0
	addge r5, r1, r2, lsl #6
	strgeh lr, [ip, r5]
	cmp r8, #0x20
	addlt r5, r1, r2, lsl #6
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	strlth r7, [r6, r5]
	mov r2, r2, asr #0x10
_02029420:
	cmp r2, r0
	blt _020293FC
	cmp r2, #0x18
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r2, lsl #5
	add r1, r1, r0, lsl #1
	mov r2, #0
	b _02029460
_02029440:
	cmp r4, #0
	blt _02029454
	cmp r4, #0x20
	movlt r0, r4, lsl #1
	strlth r2, [r0, r1]
_02029454:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, asr #0x10
_02029460:
	cmp r4, r3
	ble _02029440
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202946C: .word _020AFD9C
_02029470: .word _022A9A5C
_02029474: .word 0x00000904
	arm_func_end sub_020291FC

	arm_func_start sub_02029478
sub_02029478: ; 0x02029478
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mvn r2, #0
	cmp r1, r2
	ldrnesh r2, [r0, #0x24]
	cmpne r1, r2
	beq _020294FC
	ldrb r0, [r0, #0x26]
	cmp r0, #0
	bne _020294D0
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #1
	ldr r0, _02029504 ; =CURSOR_ANIMATION_CONTROL
	str r2, [sp, #8]
	mov r2, #0
	mov r3, #0x3f8
	str r2, [sp, #0xc]
	bl SetAnimationForAnimationControl
	b _020294FC
_020294D0:
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov ip, #1
	str ip, [sp, #8]
	ldr r0, _02029508 ; =CURSOR_16_ANIMATION_CONTROL
	mov r2, #0
	mov r3, #0x7c
	str ip, [sp, #0xc]
	bl SetAnimationForAnimationControl
_020294FC:
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029504: .word CURSOR_ANIMATION_CONTROL
_02029508: .word CURSOR_16_ANIMATION_CONTROL
	arm_func_end sub_02029478

	arm_func_start LoadCursors
LoadCursors: ; 0x0202950C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029654 ; =_022AAC68
	mov r1, #0
	mov r2, #0x15
	bl memset
	ldr r0, _02029658 ; =WAN_TABLE
	ldr r1, _0202965C ; =_0209ADF0
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r2, _02029660 ; =CURSOR_16_SPRITE_ID
	ldr r1, _02029658 ; =WAN_TABLE
	strh r0, [r2, #2]
	ldr r0, [r1]
	ldr r1, _02029664 ; =_0209AE08
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	mov r3, #1
	strh r0, [r1]
	str r3, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrsh r0, [r1, #2]
	mov r1, #0x3f8
	mov r2, #0xf
	bl sub_0201D9C8
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _02029660 ; =CURSOR_16_SPRITE_ID
	mov r1, #0x7c
	ldrsh r0, [r0]
	mov r2, #0xe
	bl sub_0201D9C8
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	ldrsh r1, [r1, #2]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	mov r2, r1
	mov r3, #0x3f8
	bl SetAnimationForAnimationControl
	mov r1, #0
	ldr r0, _02029668 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x38]
	bl sub_0201C108
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	ldr r1, _02029660 ; =CURSOR_16_SPRITE_ID
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	mov r1, #0
	mov r2, r1
	mov r3, #0x7c
	bl SetAnimationForAnimationControl
	ldr r0, _0202966C ; =CURSOR_16_ANIMATION_CONTROL
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_0201C108
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029654: .word _022AAC68
_02029658: .word WAN_TABLE
_0202965C: .word _0209ADF0
_02029660: .word CURSOR_16_SPRITE_ID
_02029664: .word _0209AE08
_02029668: .word CURSOR_ANIMATION_CONTROL
_0202966C: .word CURSOR_16_ANIMATION_CONTROL
	arm_func_end LoadCursors

	arm_func_start InitWindowTrailer
InitWindowTrailer: ; 0x02029670
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	strb r1, [r0, #0x19]
	strb r1, [r0, #0x18]
	bx lr
	arm_func_end InitWindowTrailer

	arm_func_start sub_02029688
sub_02029688: ; 0x02029688
	cmp r2, #1
	cmpeq r3, #0
	moveq r2, #2
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02029688

	arm_func_start sub_020296E8
sub_020296E8: ; 0x020296E8
	cmp r1, #0
	ldreq r1, [r0]
	cmpeq r1, r2
	ldreq r3, [r0, #8]
	ldreq r1, [sp]
	cmpeq r3, r1
	ldreq r3, [r0, #0xc]
	ldreq r1, [sp, #4]
	cmpeq r3, r1
	ldreq r3, [r0, #0x10]
	ldreq r1, [sp, #8]
	cmpeq r3, r1
	ldreq r3, [r0, #0x14]
	ldreq r1, [sp, #0xc]
	cmpeq r3, r1
	bxeq lr
	str r2, [r0]
	mov r1, #1
	ldr r2, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp, #4]
	str r2, [r0, #8]
	ldr r2, [sp, #8]
	str r1, [r0, #0xc]
	ldr r1, [sp, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_020296E8

	arm_func_start sub_02029758
sub_02029758: ; 0x02029758
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _0202980C
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _020297C8
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl GetPageItemYOffset
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_020297C8:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029820
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _02029820
_0202980C:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_02029820:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029758

	arm_func_start sub_02029828
sub_02029828: ; 0x02029828
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0xc0]
	mov r5, r0
	mov r6, r2
	cmp r1, #0
	ble _020298DC
	ldr r0, [r4, #0x10]
	tst r0, #0x4000000
	bne _02029898
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02033350
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xb0]
	mov r3, r6
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [r4]
	mov r2, #1
	add r0, r1, r0
	str r0, [sp, #4]
	ldrb r1, [r4, #0xd4]
	mov r0, r5
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029898:
	mov r0, r4
	bl sub_020333B4
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02033390
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _020298F0
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
	b _020298F0
_020298DC:
	mov r0, #0
	str r0, [r5]
	strb r0, [r5, #4]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
_020298F0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02029828

	arm_func_start sub_020298F8
sub_020298F8: ; 0x020298F8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029950
	ldr ip, [r4, #8]
	ldr r1, [sp, #0x18]
	mov r2, r3
	add r1, ip, r1
	str r1, [sp]
	ldr ip, [r4]
	ldr r1, [sp, #0x1c]
	mov r3, lr
	add r1, ip, r1
	str r1, [sp, #4]
	ldrb r1, [r4, #0xd4]
	bl sub_02029688
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029950:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029990
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029990:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020298F8

	arm_func_start sub_02029998
sub_02029998: ; 0x02029998
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r4, r1
	ldr r1, [r4, #0x10]
	mov r5, r0
	mov lr, r2
	tst r1, #0x4000000
	bne _02029A08
	ldr r1, [r4, #8]
	ldr r6, [sp, #0x28]
	ldr r7, [sp, #0x30]
	ldr ip, [r4]
	ldr r2, [sp, #0x2c]
	add r8, r1, r6
	ldr r6, [sp, #0x34]
	str r8, [sp]
	add r8, ip, r2
	mov r2, r3
	str r8, [sp, #4]
	add r1, r1, r7
	str r1, [sp, #8]
	add r1, ip, r6
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0xd4]
	mov r3, lr
	bl sub_020296E8
	mov r0, #0
	strb r0, [r4, #0xd4]
_02029A08:
	mov r0, r4
	bl sub_0203293C
	strb r0, [r5, #0x18]
	mov r0, r4
	bl sub_02032918
	strb r0, [r5, #0x19]
	tst r0, #0xff
	ldreqb r0, [r5, #0x18]
	cmpeq r0, #0
	beq _02029A48
	ldr r0, [r4, #0xc]
	sub r0, r0, #2
	str r0, [r5, #0x1c]
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r5, #0x20]
_02029A48:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02029998
