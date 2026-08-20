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
