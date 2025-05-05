	.include "asm/macros.inc"
	.include "main_0202598C.inc"

	.text

	arm_func_start GetTalkLine
GetTalkLine: ; 0x0202598C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x6c
	ldr r3, _02025AC4 ; =0x000004B8
	mov r6, r0
#ifdef JAPAN
	mov r4, r2
	cmp r6, r3
	cmpeq r4, #2
	mov r5, r1
#else
	cmp r6, r3
	addne r0, r3, #0x1b
	mov r5, r1
	mov r4, r2
	cmpne r6, r0
	bne _020259BC
	cmp r4, #2
#endif
	moveq r4, #0
_020259BC:
	bl FileRom_InitDataTransfer
	ldr r1, _02025AC8 ; =_022A7A08
	ldr r0, _02025ACC ; =_022A7A0C
	ldrsh r1, [r1]
	mov r2, #0
	add r1, r1, r6
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #0
	mov r2, #1
	bl FileRom_HandleRead
	ldrsb r2, [sp]
	cmp r2, #0
	bge _02025A00
	bl FileRom_StopDataTransfer
	ldr r0, _02025AD0 ; =0x00003EFD
	b _02025ABC
_02025A00:
	mov r0, #6
	mla r1, r2, r0, r5
	ldr r0, _02025ACC ; =_022A7A0C
	mov r1, r1, lsl #1
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #2
	mov r2, #4
	bl FileRom_HandleRead
	ldrsh r1, [sp, #2]
	ldrsh r0, [sp, #4]
	subs r6, r0, r1
	bne _02025A44
	bl FileRom_StopDataTransfer
	ldr r0, _02025AD0 ; =0x00003EFD
	b _02025ABC
_02025A44:
	ldr r0, _02025ACC ; =_022A7A0C
	mov r2, #0
	bl FileRom_HandleSeek
	ldr r0, _02025ACC ; =_022A7A0C
	add r1, sp, #6
	mov r2, r6
	bl FileRom_HandleRead
	cmp r4, #1
	bne _02025A78
	mov r0, #2
	bl RandInt
	mov r4, r0
	b _02025A90
_02025A78:
	cmp r4, #2
	moveq r4, #2
	beq _02025A90
	mov r0, r6, lsr #1
	bl RandInt
	mov r4, r0
_02025A90:
	bl FileRom_StopDataTransfer
	ldr r2, _02025AD4 ; =TBL_TALK_GROUP_STRING_ID_START
	mov r3, r5, lsl #1
	add r0, sp, #6
	mov r1, r4, lsl #1
	ldrh r2, [r2, r3]
	ldrsh r0, [r0, r1]
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	ldreq r0, _02025AD0 ; =0x00003EFD
_02025ABC:
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02025AC4: .word 0x000004B8
_02025AC8: .word _022A7A08
_02025ACC: .word _022A7A0C
#if defined(EUROPE)
_02025AD0: .word 0x00003EFF
#elif defined(JAPAN)
_02025AD0: .word 0x00002FF6
#else
_02025AD0: .word 0x00003EFD
#endif
_02025AD4: .word TBL_TALK_GROUP_STRING_ID_START
	arm_func_end GetTalkLine

	arm_func_start sub_02025AD8
sub_02025AD8: ; 0x02025AD8
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r1, _02025B6C ; =_0209ABF0
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
#ifdef JAPAN
	ldr r1, [sp]
	ldr r0, _02025B34 ; =_022A7A54
	bl HandleSir0Translation
	ldr r1, _02025B38 ; =_0209AC04
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r1, [sp]
	ldr r0, _02025B3C ; =_022A92C4
	bl HandleSir0Translation
	ldr r1, _02025B40 ; =_0209AC18
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r2, [sp]
	ldr r0, _02025B44 ; =_020AFD04
	mov r1, #0
	str r2, [r0]
	str r1, [r0, #4]
	ldr r0, _02025B48 ; =_022A92B4_JP
	mov r1, #0xb
	str r1, [r0, #4]
	str r1, [r0, #8]
	mov r1, #1
	strb r1, [r0]
#else
	ldr r0, [sp]
	ldr r2, _02025B70 ; =_022A7A54
	add r3, r0, #4
#ifdef EUROPE
	str r0, [r2, #8]
#else
	str r0, [r2, #0x10]
#endif
	str r3, [r2]
	ldr r1, _02025B74 ; =_0209AC04
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, [sp]
	ldr r2, _02025B70 ; =_022A7A54
	add r3, r0, #4
#ifdef EUROPE
	str r0, [r2, #0xc]
#else
	str r0, [r2, #0x14]
#endif
	str r3, [r2, #4]
	ldr r1, _02025B78 ; =_0209AC18
	add r0, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, [sp]
	ldr r1, _02025B7C ; =_020AFD04
	mov r2, #0
#ifdef EUROPE
	str r0, [r1, #8]
	str r2, [r1, #4]
	ldr r0, _02025B70 ; =_022A7A54
	mov r2, #0xb
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
#else
	str r0, [r1, #0xc]
	str r2, [r1, #8]
	ldr r0, _02025B70 ; =_022A7A54
	mov r2, #0xb
	str r2, [r0, #8]
	str r2, [r0, #0xc]
#endif
	mov r0, #1
	strb r0, [r1]
#endif
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_02025B6C: .word _0209B548_JP
_02025B34: .word _022A7A54
_02025B38: .word _0209AC04
_02025B3C: .word _022A92C4
_02025B40: .word _0209AC18
_02025B44: .word _020AFD04
_02025B48: .word _022A92B4_JP
#else
_02025B6C: .word _0209ABF0
_02025B70: .word _022A7A54
_02025B74: .word _0209AC04
_02025B78: .word _0209AC18
_02025B7C: .word _020AFD04
#endif
	arm_func_end sub_02025AD8

	arm_func_start sub_02025B80
sub_02025B80: ; 0x02025B80
	ldr r1, _02025B8C ; =_020AFD04
#ifdef NORTH_AMERICA
	str r0, [r1, #8]
#else
	str r0, [r1, #4]
#endif
	bx lr
	.align 2, 0
_02025B8C: .word _020AFD04
	arm_func_end sub_02025B80

	arm_func_start sub_02025B90
sub_02025B90: ; 0x02025B90
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	ldr r1, _02025C00 ; =_020AFD34
	mov r4, r0
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02025C04 ; =_0209AC2C
	add r0, sp, #0
	bl sprintf
	add r0, sp, #0
	bl sub_02027274
	ldr r0, _02025C08 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0x8]
	cmp r1, #0
	strne r1, [r0, #0xc]
#elif defined(JAPAN)
	ldr r1, [r0]
	cmp r1, #0
	strne r1, [r0, #8]
#else
	ldr r1, [r0, #0xc]
	cmp r1, #0
	strne r1, [r0, #4]
#endif
	ldr r1, _02025C0C ; =_020AFD1C
	add r0, sp, #0
	ldr r2, [r1, r4, lsl #2]
	ldr r1, _02025C04 ; =_0209AC2C
	bl sprintf
	ldr r0, _02025C10 ; =_020AFD14
	add r1, sp, #0
	mov r2, #1
	bl LoadFileFromRom
	ldr r0, _02025C08 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0x10]
	str r1, [r0, #8]
#elif defined(JAPAN)
	ldr r1, [r0, #0xc]
	str r1, [r0]
#else
	ldr r1, [r0, #0x10]
	str r1, [r0, #0xc]
#endif
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.align 2, 0
_02025C00: .word _020AFD34
_02025C04: .word _0209AC2C
_02025C08: .word _020AFD04
_02025C0C: .word _020AFD1C
_02025C10: .word _020AFD14
	arm_func_end sub_02025B90

	arm_func_start sub_02025C14
sub_02025C14: ; 0x02025C14
	stmdb sp!, {r3, lr}
	ldr r0, _02025C70 ; =_020AFD04
#ifdef JAPAN
	ldr r0, [r0, #0xc]
#else
	ldr r0, [r0, #0x10]
#endif
	cmp r0, #0
	beq _02025C30
	ldr r0, _02025C74 ; =_020AFD14
	bl UnloadFile
_02025C30:
	ldr r1, _02025C70 ; =_020AFD04
	mov r2, #0
#ifdef JAPAN
	str r2, [r1, #0xc]
	ldr r0, _02025C78 ; =_0209AC38
	str r2, [r1, #0x10]
#else
	str r2, [r1, #0x10]
	ldr r0, _02025C78 ; =_0209AC38
	str r2, [r1, #0x14]
#endif
	bl sub_02027274
	ldr r0, _02025C70 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r0, #0xc]
	cmp r1, #0
	strne r1, [r0, #8]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #0xc]
#elif defined(JAPAN)
	ldr r1, [r0, #8]
	cmp r1, #0
	strne r1, [r0]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #8]
#else
	ldr r1, [r0, #4]
	cmp r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _02025C70 ; =_020AFD04
	mov r1, #0
	str r1, [r0, #4]
#endif
	bl sub_02027170
	bl sub_02027390
	ldmia sp!, {r3, pc}
	.align 2, 0
_02025C70: .word _020AFD04
_02025C74: .word _020AFD14
_02025C78: .word _0209AC38
	arm_func_end sub_02025C14

	arm_func_start sub_02025C7C
sub_02025C7C: ; 0x02025C7C
	stmdb sp!, {r4, lr}
#ifdef EUROPE
	ldr r2, _02025D3C ; =_020AFD04
	ldr r1, _0202601C_EU ; =0x000082BD
	ldr r4, [r2, #4]
	ldr r2, _02025D40 ; =_022A7A54
	cmp r0, r1
	ldr r1, [r2, r4, lsl #2]
	ldreq r0, _02026024 ; =_0209B09C_EU
	ldmeqia sp!, {r4, pc}
	cmp r0, #0xf800
#else
	ldr r1, _02025D3C ; =_020AFD04
	ldr r2, _02025D40 ; =_022A7A54
#ifdef JAPAN
	ldr r1, [r1, #4]
	cmp r0, #0xf800
	ldr r3, [r2, r1, lsl #2]
	ldr r1, [r3, #4]
#else
	ldr r4, [r1, #8]
	cmp r0, #0xf800
	ldr r1, [r2, r4, lsl #2]
#endif
#endif
	blo _02025CCC
	ldr r2, _02025D44 ; =0x0000FFFF
	cmp r0, r2
	bhs _02025CCC
	and r2, r0, #0xff00
	and r3, r0, #0xff
	mov r0, r2, asr #8
	sub r3, r3, #0x20
	sub r2, r0, #0xf8
	mov r0, #0xe0
	mla r3, r2, r0, r3
#ifdef JAPAN
	mov r0, #0xc
	mla r2, r3, r0, r1
	b _02025CF8
_02025CCC:
	ldr r2, [r3]
	mov r4, #0
	sub lr, r2, #1
	mov r3, #0xc
	b _02025CDC
_02025CB0:
	add r2, r4, lr
	add r2, r2, r2, lsr #31
	mov ip, r2, asr #1
	mla r2, ip, r3, r1
	ldrh r2, [r2, #4]
	cmp r0, r2
	moveq r4, ip
	beq _02025CE4
	cmp r2, r0
	addlo r4, ip, #1
	movhs lr, ip
_02025CDC:
	cmp r4, lr
	blt _02025CB0
_02025CE4:
	mov r2, #0xc
	mla r2, r4, r2, r1
	ldrh r1, [r2, #4]
	cmp r1, r0
	ldrne r2, _02025D4C ; =_0209AB60
_02025CF8:
	mov r0, r2
#else
	mov r0, #0x1c
	mla r1, r3, r0, r1
	b _02025D34
_02025CCC:
	ldr r3, _02025D48 ; =_022A7A64
	mov r2, #0
	ldr r3, [r3, r4, lsl #2]
	mov ip, #0x1c
	ldr r3, [r3]
	sub r4, r3, #1
	b _02025D14
_02025CE8:
	add r3, r2, r4
	add r3, r3, r3, lsr #31
	mov lr, r3, asr #1
	mul r3, lr, ip
	ldrh r3, [r1, r3]
	cmp r0, r3
	moveq r2, lr
	beq _02025D1C
	cmp r3, r0
	addlo r2, lr, #1
	movhs r4, lr
_02025D14:
	cmp r2, r4
	blt _02025CE8
_02025D1C:
	mov r3, #0x1c
	mul r3, r2, r3
	ldrh r2, [r1, r3]
	add r1, r1, r3
	cmp r2, r0
	ldrne r1, _02025D4C ; =_0209AB60
_02025D34:
	mov r0, r1
#endif
	ldmia sp!, {r4, pc}
	.align 2, 0
_02025D3C: .word _020AFD04
#ifdef EUROPE
_0202601C_EU: .word 0x000082BD
#endif
_02025D40: .word _022A7A54
#ifdef EUROPE
_02026024: .word _0209B09C_EU
#endif
_02025D44: .word 0x0000FFFF
#ifndef JAPAN
_02025D48: .word _022A7A64
#endif
_02025D4C: .word _0209AB60
	arm_func_end sub_02025C7C

	arm_func_start sub_02025D50
sub_02025D50: ; 0x02025D50
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [sp, #0x18]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	str ip, [sp]
	bl sub_01FF905C
	mov ip, #0x13
	mov r0, r7
	mov r1, r6
	mov r3, r4
	add r2, r5, #1
	str ip, [sp]
	bl sub_01FF905C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02025D50

	arm_func_start sub_02025D90
sub_02025D90: ; 0x02025D90
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
#ifdef JAPAN
	sub sp, sp, #0x28
	mov fp, r1
	mov r4, fp, lsr #0x1f
	rsb r1, r4, fp, lsl #29
	add r5, r4, r1, ror #29
	ldr r6, _02025F58 ; =_0209B488
	mov r4, #0x18
	mla r8, r5, r4, r6
	mov r1, fp, asr #2
	str r0, [sp]
	add r0, fp, r1, lsr #29
	ldr r4, [sp, #0x50]
	mov sb, r2
	str r0, [sp, #0x24]
	add r0, sb, r4
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r3, [sp, #4]
	str r0, [sp, #0xc]
	b _02025F44
_02025DA4:
	ldr r0, [sp]
	ldr r4, [sp, #4]
#ifdef JAPAN
	bl sub_0202796C_JP
#else
	bl sub_02028324
#endif
	cmp fp, #0
	mov r6, r0
	cmpge sb, #0
	blt _02025F40
	mov r0, sb, asr #2
	add r5, sb, r0, lsr #29
	ldr r0, [sp]
	mov r7, r5, asr #3
	bl GetWindow
	ldrb r2, [r0, #6]
	mov r1, sb, lsr #0x1f
	rsb r0, r1, sb, lsl #29
	add r1, r1, r0, ror #29
	mul r2, r7, r2
	ldr r0, [sp, #0x24]
	add r0, r2, r0, asr #3
	add r2, r6, r0, lsl #6
	ldr r0, [sp]
	add r7, r2, r1, lsl #3
	bl GetWindow
	ldrb r0, [r0, #7]
	cmp r0, r5, asr #3
	ldrgt r0, [sp, #4]
	cmpgt r0, #0
	ble _02025F40
	mov sl, #0
	b _02025F38
_02025E1C:
	mov r6, #0
	mov r2, r4
	cmp r4, #8
	movge r2, #8
	mov r5, r6
	mov r3, r6
	b _02025E50
_02025E38:
	mov r1, r5, lsl #8
	ldr r0, [sp, #0xc]
	orr r1, r1, r6, lsr #24
	orr r5, r1, r0, asr #31
	orr r6, r0, r6, lsl #8
	add r3, r3, #1
_02025E50:
	cmp r3, r2
	blt _02025E38
	mov r0, #0
	cmp r5, r0
	cmpeq r6, sl
	beq _02025F30
	ldr r0, [r7]
	str r0, [sp, #0x14]
	ldr r0, [r7, #4]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_01FF9130_JP
	ldr r2, [r8, #4]
	ldr r3, [r8]
	and ip, r5, r2
	ldr r2, [r8, #0x10]
	and r3, r6, r3
	mov ip, ip, lsl r2
	rsb lr, r2, #0x20
	orr ip, ip, r3, lsr lr
	sub lr, r2, #0x20
	and r2, r0, r3, lsl r2
	ldr r0, [sp, #0x14]
	orr ip, ip, r3, lsl lr
	orr r0, r0, r2
	str r0, [r7]
	ldr r0, [sp, #0x18]
	and r1, r1, ip
	orr r0, r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #0x40]
	str r0, [sp, #0x1c]
	ldr r0, [r7, #0x44]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	bl sub_01FF9130_JP
	ldr r3, [r8, #8]
	ldr r2, [r8, #0xc]
	and r6, r6, r3
	and r3, r5, r2
	ldr r2, [r8, #0x14]
	mov r5, r6, lsr r2
	and r6, r1, r3, lsr r2
	ldr r1, [sp, #0x20]
	orr r1, r1, r6
	rsb r6, r2, #0x20
	orr r5, r5, r3, lsl r6
	sub r2, r2, #0x20
	orr r5, r5, r3, lsr r2
	and r2, r0, r5
	ldr r0, [sp, #0x1c]
	orr r0, r0, r2
	str r0, [r7, #0x40]
	str r1, [r7, #0x44]
_02025F30:
	add r7, r7, #0x40
	sub r4, r4, #8
_02025F38:
	cmp r4, #0
	bgt _02025E1C
_02025F40:
	add sb, sb, #1
_02025F44:
	ldr r0, [sp, #8]
	cmp sb, r0
	blt _02025DA4
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02025F58: .word _0209B488
#else
	ldr r4, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov fp, r0
	add r6, sl, r3
	add r7, sb, r4
	ldr r8, [sp, #0x2c]
	b _02025E78
_02025DB4:
	mov r0, fp
	mov r5, sl
	bl GetWindow
	mov r4, r0
	mov r0, fp
	bl sub_0202760C
	cmp sb, #0
	blt _02025E74
	ldrb r1, [r4, #7]
	cmp sb, r1, lsl #3
	bge _02025E74
	ldrb r2, [r4, #6]
	mov r1, r6
	cmp sl, #0
	mov r3, r2, lsl #3
	bge _02025E00
	cmp r6, #0
	blt _02025E74
	mov r5, #0
_02025E00:
	cmp r6, r3
	blt _02025E14
	cmp r5, r3
	bge _02025E74
	sub r1, r3, #1
_02025E14:
	mov r3, sb, asr #2
	add r3, sb, r3, lsr #29
	mov r3, r3, asr #3
	mul r4, r3, r2
	mov r3, sb, lsr #0x1f
	rsb r2, r3, sb, lsl #29
	add r2, r3, r2, ror #29
	add r2, r2, r4, lsl #3
	add r2, r0, r2, lsl #3
	and r0, r8, #0xff
	b _02025E6C
_02025E40:
	mov r4, r5, lsr #0x1f
	mov ip, r5, asr #2
	rsb r3, r4, r5, lsl #29
	add ip, r5, ip, lsr #29
	add r4, r4, r3, ror #29
	mov r3, ip, asr #3
	add r4, r4, r3, lsl #6
	ldrb r3, [r2, r4]
	add r5, r5, #1
	cmp r3, #0
	streqb r0, [r2, r4]
_02025E6C:
	cmp r5, r1
	ble _02025E40
_02025E74:
	add sb, sb, #1
_02025E78:
	cmp sb, r7
	blt _02025DB4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
#endif
	arm_func_end sub_02025D90

	arm_func_start sub_02025E84
sub_02025E84: ; 0x02025E84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	ldr r4, _02025EE4 ; =_0209AB9C
	add lr, sp, #0
	mov r6, r0
	mov r5, r1
	mov ip, #5
_02025EA0:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02025EA0
	ldr r1, [r4]
	mov r0, #0x17
	str r1, [lr]
	strb r5, [r6]
	str r0, [r6, #0x110]
	mov r3, #0x13
	add r1, sp, #0
	mov r2, r6
	add r0, r6, #4
	str r3, [r6, #0x114]
	bl sub_02020A9C
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02025EE4: .word _0209AB9C
	arm_func_end sub_02025E84

	arm_func_start IsAOrBPressed
IsAOrBPressed: ; 0x02025EE8
	stmdb sp!, {r3, lr}
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #3
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAOrBPressed

	arm_func_start sub_02025F10
sub_02025F10: ; 0x02025F10
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	mov r5, r0
	add r1, sp, #2
	mov r0, #0
	bl GetHeldButtons
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldrh r0, [sp]
	tst r0, #3
	movne r0, #1
	bne _02025FD4
	ldrh r0, [sp, #2]
	tst r0, #2
	beq _02025F5C
	tst r0, #0xf0
	moveq r0, #1
	beq _02025FD4
_02025F5C:
	bl sub_0204AE60
	cmp r0, #0
	beq _02025FD0
	ldrsb r0, [r5]
	mov r4, #0
	bl sub_02028324
	cmp r0, #0
	bne _02025FAC
	ldrsb r0, [r5]
	bl GetWindow
	ldrsb r1, [r0, #9]
	mvn r0, #5
	cmp r1, r0
	addne r0, r0, #1
	cmpne r1, r0
	beq _02025FAC
	ldrsb r0, [r5]
	add r4, sp, #0x28
	mov r1, r4
	bl GetWindowRectangle
_02025FAC:
	add r0, sp, #4
	bl GetReleasedStylus
	ldr r1, _02025FDC ; =0x00001408
	add r0, sp, #4
	mov r2, r4
	bl sub_02006C8C
	cmp r0, #0
	movne r0, #1
	bne _02025FD4
_02025FD0:
	mov r0, #0
_02025FD4:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02025FDC: .word 0x00001408
	arm_func_end sub_02025F10

	arm_func_start sub_02025FE0
sub_02025FE0: ; 0x02025FE0
	ldr ip, _02025FEC ; =sub_020282C8
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02025FEC: .word sub_020282C8
	arm_func_end sub_02025FE0

	arm_func_start sub_02025FF0
sub_02025FF0: ; 0x02025FF0
	ldr ip, _02025FFC ; =sub_02027B1C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_02025FFC: .word sub_02027B1C
	arm_func_end sub_02025FF0

	arm_func_start sub_02026000
sub_02026000: ; 0x02026000
	ldr ip, _0202600C ; =sub_01FF929C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202600C: .word sub_01FF929C
	arm_func_end sub_02026000

	arm_func_start sub_02026010
sub_02026010: ; 0x02026010
	ldr ip, _0202601C ; =UpdateWindow
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202601C: .word UpdateWindow
	arm_func_end sub_02026010

	arm_func_start sub_02026020
sub_02026020: ; 0x02026020
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl GetColorCodePaletteOffset
	str r0, [r4, #0x110]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02026020

	arm_func_start sub_02026038
sub_02026038: ; 0x02026038
	ldr r1, _02026044 ; =_020AFD04
#ifdef NORTH_AMERICA
	str r0, [r1, #8]
#else
	str r0, [r1, #4]
#endif
	bx lr
	.align 2, 0
_02026044: .word _020AFD04
	arm_func_end sub_02026038

	arm_func_start sub_02026048
sub_02026048: ; 0x02026048
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x110]
	str ip, [sp]
	ldrsb r0, [r0]
	bl DrawChar
	ldmia sp!, {r3, pc}
	arm_func_end sub_02026048

	arm_func_start sub_02026060
sub_02026060: ; 0x02026060
	ldr ip, _0202606C ; =sub_02026B1C
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_0202606C: .word sub_02026B1C
	arm_func_end sub_02026060

	arm_func_start sub_02026070
sub_02026070: ; 0x02026070
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrsb r4, [r0]
	ldr ip, [r0, #0x110]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r0, r4
	str ip, [sp]
	bl sub_01FF905C
	mov ip, #0x13
	mov r0, r4
	mov r1, r7
	mov r3, r5
	add r2, r6, #1
	str ip, [sp]
	bl sub_01FF905C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02026070

	arm_func_start sub_020260B4
sub_020260B4: ; 0x020260B4
	ldr ip, _020260C0 ; =sub_020288DC
	ldrsb r0, [r0]
	bx ip
	.align 2, 0
_020260C0: .word sub_020288DC
	arm_func_end sub_020260B4

	arm_func_start sub_020260C4
sub_020260C4: ; 0x020260C4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldrsb r0, [r4]
	mov r6, r1
	add r1, sp, #0
	mov r5, r2
	bl GetWindowRectangle
	cmp r6, #0
	bge _02026118
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	add r0, r1, r0
	add r1, r0, r0, lsr #31
	ldrsb r0, [r4]
	mov r2, r1, asr #1
	add r3, r3, #4
	mov r1, #4
	bl sub_020288FC
	b _02026134
_02026118:
	ldr r2, [sp, #8]
	ldr r1, [sp]
	ldrsb r0, [r4]
	add r2, r6, r2
	add r3, r5, r1
	mov r1, #3
	bl sub_020288FC
_02026134:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020260C4

	arm_func_start sub_0202613C
sub_0202613C: ; 0x0202613C
	ldr ip, _02026148 ; =sub_02020B14
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026148: .word sub_02020B14
	arm_func_end sub_0202613C

	arm_func_start sub_0202614C
sub_0202614C: ; 0x0202614C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r3, sp, #0
	str r1, [sp]
	mov r1, r3
	add r0, r0, #4
	str r2, [sp, #4]
	bl sub_02020B60
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202614C

	arm_func_start sub_02026174
sub_02026174: ; 0x02026174
	ldr ip, _02026180 ; =sub_02020B74
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026180: .word sub_02020B74
	arm_func_end sub_02026174

	arm_func_start sub_02026184
sub_02026184: ; 0x02026184
	ldr ip, _02026190 ; =sub_02020BB8
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026190: .word sub_02020BB8
	arm_func_end sub_02026184

	arm_func_start sub_02026194
sub_02026194: ; 0x02026194
	ldr ip, _020261A0 ; =sub_02020BC4
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261A0: .word sub_02020BC4
	arm_func_end sub_02026194

	arm_func_start sub_020261A4
sub_020261A4: ; 0x020261A4
	ldr ip, _020261B0 ; =sub_02020CCC
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261B0: .word sub_02020CCC
	arm_func_end sub_020261A4

	arm_func_start sub_020261B4
sub_020261B4: ; 0x020261B4
	ldr ip, _020261C0 ; =sub_02020D18
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261C0: .word sub_02020D18
	arm_func_end sub_020261B4

	arm_func_start sub_020261C4
sub_020261C4: ; 0x020261C4
	ldr ip, _020261D0 ; =sub_02020D40
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261D0: .word sub_02020D40
	arm_func_end sub_020261C4

	arm_func_start sub_020261D4
sub_020261D4: ; 0x020261D4
	ldr ip, _020261E0 ; =sub_02020D54
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261E0: .word sub_02020D54
	arm_func_end sub_020261D4

	arm_func_start sub_020261E4
sub_020261E4: ; 0x020261E4
	ldr ip, _020261F0 ; =sub_02020D5C
	add r0, r0, #4
	bx ip
	.align 2, 0
_020261F0: .word sub_02020D5C
	arm_func_end sub_020261E4

	arm_func_start sub_020261F4
sub_020261F4: ; 0x020261F4
	ldr ip, _02026200 ; =sub_02020D7C
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026200: .word sub_02020D7C
	arm_func_end sub_020261F4

	arm_func_start sub_02026204
sub_02026204: ; 0x02026204
	ldr ip, _02026210 ; =AnalyzeText
	add r0, r0, #4
	bx ip
	.align 2, 0
_02026210: .word AnalyzeText
	arm_func_end sub_02026204

	arm_func_start DrawTextInWindow
DrawTextInWindow: ; 0x02026214
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026264 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026264: .word 0x0000C402
	arm_func_end DrawTextInWindow

	arm_func_start sub_02026268
sub_02026268: ; 0x02026268
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	mov ip, #0
	ldr r3, _020262DC ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _020262DC ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020262DC: .word 0x0000C402
	arm_func_end sub_02026268

	arm_func_start sub_020262E0
sub_020262E0: ; 0x020262E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x128
	sub sp, sp, #0x400
	str r2, [sp, #8]
	mov r2, r3
	mov r4, r0
	str r1, [sp, #4]
	ldr ip, [sp, #0x530]
	ldr r3, _02026354 ; =0x0000C402
	add r0, sp, #0xc
	mov r1, #0x400
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #0x400
	add r0, r0, #0xc
	mov r1, r4
	bl sub_02025E84
	add r0, sp, #0x410
	add r1, sp, #4
	bl sub_02020B60
	ldr r1, _02026354 ; =0x0000C402
	add r0, sp, #0x410
	add r2, sp, #0xc
	bl sub_02020BC4
	add r0, sp, #0x410
	bl AnalyzeText
	add sp, sp, #0x128
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_02026354: .word 0x0000C402
	arm_func_end sub_020262E0

	arm_func_start sub_02026358
sub_02026358: ; 0x02026358
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x138]
	ldr ip, [sp, #0x13c]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020263C4 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020263C4: .word 0x0000C402
	arm_func_end sub_02026358

	arm_func_start sub_020263C8
sub_020263C8: ; 0x020263C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _02026424 ; =0x0000C402
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x130]
	add r0, sp, #0xc
	bl sub_02020B74
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02026424: .word 0x0000C402
	arm_func_end sub_020263C8

	arm_func_start sub_02026428
sub_02026428: ; 0x02026428
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x12c
	mov r4, r0
	ldr lr, [sp, #0x13c]
	ldr ip, [sp, #0x140]
	str r1, [sp]
	mov r1, r4
	add r0, sp, #0x10
	mov r4, r3
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0x14
	add r1, sp, #8
	bl sub_02020B4C
	add r0, sp, #0x14
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264A0 ; =0x0000C402
	add r0, sp, #0x14
	mov r2, r4
	bl sub_02020BC4
	ldrb r1, [sp, #0x138]
	add r0, sp, #0x14
	bl sub_02020B94
	add r0, sp, #0x14
	bl AnalyzeText
	add sp, sp, #0x12c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264A0: .word 0x0000C402
	arm_func_end sub_02026428

	arm_func_start sub_020264A4
sub_020264A4: ; 0x020264A4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x124
	mov r4, r0
	str r1, [sp]
	mov r1, r4
	add r0, sp, #8
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02025E84
	add r0, sp, #0xc
	add r1, sp, #0
	bl sub_02020B60
	ldr r1, _020264F4 ; =0x0000C403
	add r0, sp, #0xc
	mov r2, r4
	bl sub_02020BC4
	add r0, sp, #0xc
	bl AnalyzeText
	add sp, sp, #0x124
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020264F4: .word 0x0000C403
	arm_func_end sub_020264A4

	arm_func_start sub_020264F8
sub_020264F8: ; 0x020264F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r3
	mov r7, r0
	mov r0, r4
	mov r6, r1
	mov r5, r2
	bl sub_02025C7C
#ifdef JAPAN
	ldrsh r0, [r0, #6]
	cmp r0, #0xc
	rsblt r0, r0, #0xc
	addlt r0, r0, r0, lsr #31
	addlt r6, r6, r0, asr #1
#else
	ldrb r0, [r0, #2]
	cmp r0, #0xc
	rsblo r0, r0, #0xc
	addlo r0, r0, r0, lsr #31
	addlo r6, r6, r0, asr #1
#endif
	ldrb r0, [sp, #0x18]
	bl GetColorCodePaletteOffset
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl DrawChar
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020264F8

	arm_func_start GetCharWidth
GetCharWidth: ; 0x0202654C
	stmdb sp!, {r3, lr}
	ldr r1, _02026590 ; =_020AFD04
	mov r3, r0
#ifdef NORTH_AMERICA
	ldr r1, [r1, #8]
#else
	ldr r1, [r1, #4]
#endif
	cmp r1, #2
	blt _0202657C
	mov r1, #0
	mov r2, r1
	sub r0, r1, #2
	str r1, [sp]
	bl sub_02026C68
	ldmia sp!, {r3, pc}
_0202657C:
	bl sub_02025C7C
	cmp r0, #0
#ifdef JAPAN
	ldrnesh r0, [r0, #6]
#else
	ldrneb r0, [r0, #2]
#endif
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02026590: .word _020AFD04
	arm_func_end GetCharWidth

	arm_func_start sub_02026594
sub_02026594: ; 0x02026594
	ldr r1, _020265A4 ; =_020AFD04
#if defined(EUROPE)
	ldr r1, [r1, #8]
#elif defined(JAPAN)
	ldr r1, [r1]
#else
	ldr r1, [r1, #0xc]
#endif
	ldrb r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020265A4: .word _020AFD04
	arm_func_end sub_02026594

	arm_func_start sub_020265A8
sub_020265A8: ; 0x020265A8
	ldr ip, _020265B8 ; =sub_02022118
	ldr r1, _020265BC ; =GetCharWidth
	ldr r2, _020265C0 ; =sub_02026594
	bx ip
	.align 2, 0
_020265B8: .word sub_02022118
_020265BC: .word GetCharWidth
_020265C0: .word sub_02026594
	arm_func_end sub_020265A8

	arm_func_start GetColorCodePaletteOffset
GetColorCodePaletteOffset: ; 0x020265C4
	sub r0, r0, #0x41
	cmp r0, #0x31
	addls pc, pc, r0, lsl #2
	b _02026764
_020265D4: ; jump table
	b _0202671C ; case 0
	b _02026704 ; case 1
	b _020266B4 ; case 2
	b _02026764 ; case 3
	b _020266AC ; case 4
	b _020266D4 ; case 5
	b _02026734 ; case 6
	b _0202674C ; case 7
	b _0202671C ; case 8
	b _02026754 ; case 9
	b _020266E4 ; case 10
	b _02026744 ; case 11
	b _020266EC ; case 12
	b _020266DC ; case 13
	b _0202675C ; case 14
	b _020266F4 ; case 15
	b _02026714 ; case 16
	b _0202673C ; case 17
	b _0202670C ; case 18
	b _0202669C ; case 19
	b _02026724 ; case 20
	b _020266FC ; case 21
	b _020266BC ; case 22
	b _020266C4 ; case 23
	b _020266CC ; case 24
	b _0202672C ; case 25
	b _02026764 ; case 26
	b _02026764 ; case 27
	b _02026764 ; case 28
	b _02026764 ; case 29
	b _02026764 ; case 30
	b _02026764 ; case 31
	b _02026764 ; case 32
	b _02026764 ; case 33
	b _02026764 ; case 34
	b _02026764 ; case 35
	b _02026764 ; case 36
	b _02026764 ; case 37
	b _02026764 ; case 38
	b _02026764 ; case 39
	b _02026764 ; case 40
	b _020266F4 ; case 41
	b _02026764 ; case 42
	b _02026764 ; case 43
	b _02026764 ; case 44
	b _02026764 ; case 45
	b _02026764 ; case 46
	b _02026764 ; case 47
	b _02026764 ; case 48
	b _020266A4 ; case 49
_0202669C:
	mov r0, #0
	bx lr
_020266A4:
	mov r0, #0x15
	bx lr
_020266AC:
	mov r0, #0x18
	bx lr
_020266B4:
	mov r0, #0x19
	bx lr
_020266BC:
	mov r0, #0x1a
	bx lr
_020266C4:
	mov r0, #0x1b
	bx lr
_020266CC:
	mov r0, #0x1c
	bx lr
_020266D4:
	mov r0, #0x1d
	bx lr
_020266DC:
	mov r0, #0x1e
	bx lr
_020266E4:
	mov r0, #0x1f
	bx lr
_020266EC:
	mov r0, #0x20
	bx lr
_020266F4:
	mov r0, #0x21
	bx lr
_020266FC:
	mov r0, #0x22
	bx lr
_02026704:
	mov r0, #0x23
	bx lr
_0202670C:
	mov r0, #0x24
	bx lr
_02026714:
	mov r0, #0x25
	bx lr
_0202671C:
	mov r0, #0x26
	bx lr
_02026724:
	mov r0, #0x27
	bx lr
_0202672C:
	mov r0, #0x28
	bx lr
_02026734:
	mov r0, #0x29
	bx lr
_0202673C:
	mov r0, #0x2a
	bx lr
_02026744:
	mov r0, #0x2b
	bx lr
_0202674C:
	mov r0, #0x2c
	bx lr
_02026754:
	mov r0, #0x2d
	bx lr
_0202675C:
	mov r0, #0x2e
	bx lr
_02026764:
	mov r0, #0x17
	bx lr
	arm_func_end GetColorCodePaletteOffset

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
	ldr r2, _02027A7C ; =_020AFD98
	cmp r1, #2
	moveq r1, #1
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_02027A7C: .word _020AFD98
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
	ldr r0, _02027E20 ; =_020AFD98
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
_02027E20: .word _020AFD98
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
	ldr r0, _02028DF8 ; =_020AFD98
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
_02028DF8: .word _020AFD98
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
	bl sub_020328D8
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

	arm_func_start sub_02029A50
sub_02029A50: ; 0x02029A50
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	strh r1, [r0, #0x24]
	str r2, [r0, #4]
	bx lr
	arm_func_end sub_02029A50

	arm_func_start sub_02029A68
sub_02029A68: ; 0x02029A68
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r2, r3
	beq _02029AAC
	mov r3, #0
	strb r3, [r1, #4]
	ldr r2, [r1]
	stmia r0, {r2, r3}
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
	b _02029AE8
_02029AAC:
	cmp r3, #0
	ldrneb r2, [r1, #4]
	cmpne r2, #0
	beq _02029AE8
	mov r2, #0
	strb r2, [r1, #4]
	str r2, [r0, #4]
	ldr r3, [r1, #8]
	ldr r2, [r1, #0xc]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	ldr r3, [r1, #0x10]
	ldr r2, [r1, #0x14]
	str r3, [r0, #0x10]
	str r2, [r0, #0x14]
_02029AE8:
	ldrb r2, [r1, #0x19]
	strb r2, [r0, #0x19]
	ldrb r2, [r1, #0x18]
	strb r2, [r0, #0x18]
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x20]
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02029A68

	arm_func_start sub_02029B0C
sub_02029B0C: ; 0x02029B0C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x24
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02029EB0
	cmp r0, #2
	ldrne r0, [r4, #4]
	addne r0, r0, #1
	strne r0, [r4, #4]
	ldr r0, [r4, #4]
	tst r0, #0x10
	bne _02029EB0
	ldr r0, [r4]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02029EB0
_02029B50: ; jump table
	b _02029EB0 ; case 0
	b _02029B70 ; case 1
	b _02029B70 ; case 2
	b _02029BBC ; case 3
	b _02029C08 ; case 4
	b _02029C64 ; case 5
	b _02029D38 ; case 6
	b _02029D94 ; case 7
_02029B70:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BA4
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BA4:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BBC:
	mov r0, r4
	mov r1, #0
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029BF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029BF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C08:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029C44
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C44:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029C64:
	ldr r1, _02029EC0 ; =0x0000FFFF
	mov ip, #0
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0x18
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	add r1, sp, #0x18
	cmp r0, #0
	bne _02029CF0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029CF0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029D38:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029D74
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D74:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029EB0
_02029D94:
	mov r0, r4
	mov r1, #1
	bl sub_02029478
	ldrb r0, [r4, #0x26]
	ldr r1, [r4, #8]
	cmp r0, #0
	bne _02029DD0
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	b _02029DEC
_02029DD0:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0x14]
	sub r1, r1, #4
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
_02029DEC:
	mov ip, #0
	ldr r1, _02029EC0 ; =0x0000FFFF
	str ip, [sp]
	mov r0, #0x2000
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r2, r1
	mov r3, r1
	str ip, [sp, #8]
	bl sub_0201C028
	ldrb r0, [r4, #0x26]
	add r1, sp, #0xc
	cmp r0, #0
	bne _02029E6C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EB8 ; =CURSOR_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
	b _02029EB0
_02029E6C:
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r2, [r0, #2]
	orr r2, r2, #0x20
	strh r2, [r0, #2]
	bl sub_0201D110
	ldr r1, [r4, #8]
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	sub r1, r1, #4
	strh r1, [r0, #0x1c]
	ldr r1, [r4, #0xc]
	sub r1, r1, #0x10
	strh r1, [r0, #0x1e]
	bl sub_0201CF5C
	ldr r0, _02029EBC ; =CURSOR_16_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	bic r1, r1, #0x20
	strh r1, [r0, #2]
_02029EB0:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_02029EB8: .word CURSOR_ANIMATION_CONTROL
_02029EBC: .word CURSOR_16_ANIMATION_CONTROL
_02029EC0: .word 0x0000FFFF
	arm_func_end sub_02029B0C

	arm_func_start sub_02029EC4
sub_02029EC4: ; 0x02029EC4
	bx lr
	arm_func_end sub_02029EC4

	arm_func_start Arm9LoadUnkFieldNa0x2029EC8
Arm9LoadUnkFieldNa0x2029EC8: ; 0x02029EC8
	ldr r1, _02029ED4 ; =_022AAC68
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02029ED4: .word _022AAC68
	arm_func_end Arm9LoadUnkFieldNa0x2029EC8

	arm_func_start Arm9StoreUnkFieldNa0x2029ED8
Arm9StoreUnkFieldNa0x2029ED8: ; 0x02029ED8
	ldr r2, _02029EE4 ; =_022AAC68
	strb r1, [r2, r0]
	bx lr
	.align 2, 0
_02029EE4: .word _022AAC68
	arm_func_end Arm9StoreUnkFieldNa0x2029ED8

	arm_func_start LoadAlert
LoadAlert: ; 0x02029EE8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02029F74 ; =WAN_TABLE
	ldr r1, _02029F78 ; =_0209AE20
	ldr r0, [r0]
	mov r2, #0
	bl LoadWanTableEntry
	ldr r1, _02029F7C ; =ALERT_SPRITE_ID
	strh r0, [r1]
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	bl InitAnimationControlWithSet__0201C0B0
	ldr r1, _02029F7C ; =ALERT_SPRITE_ID
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	ldrsh r1, [r1]
	bl SetSpriteIdForAnimationControl
	mov r1, #0
	mov r0, #0xd
	stmia sp, {r0, r1}
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	mov r2, r1
	mov r3, #0x3e4
	str r1, [sp, #0xc]
	bl SetAnimationForAnimationControl
	ldr r0, _02029F80 ; =ALERT_ANIMATION_CONTROL
	mov r1, #0
	strh r1, [r0, #0x38]
	bl sub_02029FBC
	ldr r0, _02029F84 ; =_020AFDA0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_02029F74: .word WAN_TABLE
_02029F78: .word _0209AE20
_02029F7C: .word ALERT_SPRITE_ID
_02029F80: .word ALERT_ANIMATION_CONTROL
_02029F84: .word _020AFDA0
	arm_func_end LoadAlert

	arm_func_start sub_02029F88
sub_02029F88: ; 0x02029F88
	ldr ip, _02029FB4 ; =ALERT_ANIMATION_CONTROL
	ldr r3, _02029FB8 ; =_020AFDA0
	strh r0, [ip, #0x1c]
	strh r1, [ip, #0x1e]
	ldrh r1, [ip, #2]
	mov r0, #0
	str r0, [r3, #4]
	bic r0, r1, #2
	strh r0, [ip, #2]
	strb r2, [r3]
	bx lr
	.align 2, 0
_02029FB4: .word ALERT_ANIMATION_CONTROL
_02029FB8: .word _020AFDA0
	arm_func_end sub_02029F88

	arm_func_start sub_02029FBC
sub_02029FBC: ; 0x02029FBC
	ldr r1, _02029FE0 ; =ALERT_ANIMATION_CONTROL
	ldr r0, _02029FE4 ; =_020AFDA0
	ldrh r3, [r1, #2]
	mov r2, #0
	str r2, [r0, #4]
	orr r3, r3, #2
	strh r3, [r1, #2]
	strb r2, [r0]
	bx lr
	.align 2, 0
_02029FE0: .word ALERT_ANIMATION_CONTROL
_02029FE4: .word _020AFDA0
	arm_func_end sub_02029FBC

	arm_func_start sub_02029FE8
sub_02029FE8: ; 0x02029FE8
	stmdb sp!, {r3, lr}
	ldr r0, _0202A034 ; =ALERT_ANIMATION_CONTROL
	ldrh r1, [r0, #2]
	tst r1, #2
	ldmneia sp!, {r3, pc}
	ldr r1, _0202A038 ; =_020AFDA0
	ldrb r2, [r1]
	cmp r2, #0
	beq _0202A02C
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	ldr r1, [r1, #4]
	tst r1, #0x10
	ldmneia sp!, {r3, pc}
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
_0202A02C:
	bl sub_0201CF5C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A034: .word ALERT_ANIMATION_CONTROL
_0202A038: .word _020AFDA0
	arm_func_end sub_02029FE8

	arm_func_start sub_0202A03C
sub_0202A03C: ; 0x0202A03C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020334A8
	mov r0, r5
	mov r1, r4
	bl sub_02033BC0
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A0A8
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A0A8
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A0A8:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A03C

	arm_func_start sub_0202A0B0
sub_0202A0B0: ; 0x0202A0B0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020335A8
	mov r0, r5
	mov r1, r4
	bl sub_02034360
	ldr r0, [r5, #0xd8]
	cmp r0, #0
	ble _0202A11C
	ldr r1, [r5, #0xec]
	cmp r1, #0
	ldrge lr, [r5, #0xf0]
	cmpge lr, #0
	ldrge r2, [r5, #0xe4]
	cmpge r2, #0
	ldrge r0, [r5, #0xe8]
	cmpge r0, #0
	blt _0202A11C
	sub r3, r0, r2
	mov r0, r4
	str r3, [sp]
	mov ip, #0x25
	sub r3, lr, r1
	str ip, [sp, #4]
	bl sub_02025D90
_0202A11C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202A0B0

	arm_func_start sub_0202A124
sub_0202A124: ; 0x0202A124
	stmdb sp!, {r3, lr}
	ldr r0, _0202A144 ; =0x00000488
	mov r1, #0
	bl MemAlloc
	ldr r1, _0202A148 ; =_020AFDA8
	str r0, [r1]
	bl sub_0202A14C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0202A144: .word 0x00000488
_0202A148: .word _020AFDA8
	arm_func_end sub_0202A124

	arm_func_start sub_0202A14C
sub_0202A14C: ; 0x0202A14C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, #0
	ldr r8, _0202A1D0 ; =_020AFDA8
	mov r4, r5
	mov r7, #0x48
_0202A160:
	mul r6, r5, r7
	ldr r0, [r8]
	add r0, r0, r6
	add r0, r0, #4
	bl InitRender3dElement64
	ldr r0, [r8]
	mov ip, #4
	strb r4, [r0, r6]
	ldr sb, [r8]
	add lr, sb, r6
	add r6, lr, #0x244
_0202A18C:
	ldmia lr!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202A18C
	add r5, r5, #1
	ldmia lr, {r0, r1}
	stmia r6, {r0, r1}
	cmp r5, #8
	blo _0202A160
	add r0, sb, #0x200
	mov r2, #0
	ldr r1, _0202A1D0 ; =_020AFDA8
	strh r2, [r0, #0x40]
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r2, [r0, #0x84]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A1D0: .word _020AFDA8
	arm_func_end sub_0202A14C

	arm_func_start sub_0202A1D4
sub_0202A1D4: ; 0x0202A1D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0202A2A0 ; =_020AFDA8
	mov sb, r0
	ldr r0, [r4]
	mov r7, r2
	add r0, r0, #0x200
	mov r8, r1
	ldrh r1, [r0, #0x40]
	mov r6, r3
	mov r2, #1
	add r1, r1, #1
	strh r1, [r0, #0x40]
	ldr r0, [r4]
	ldr r5, [sp, #0x20]
	add r0, r0, #0x200
	ldrh r1, [r0, #0x40]
	cmp r1, #8
	movhs r1, #0
	strhsh r1, [r0, #0x40]
	ldr r0, _0202A2A0 ; =_020AFDA8
	mov r1, #0x48
	ldr r3, [r0]
	add r0, r3, #0x200
	ldrh r0, [r0, #0x40]
	mul r1, r0, r1
	add r4, r3, r1
	add r0, r4, #4
	strb r2, [r3, r1]
	bl InitRender3dElement64
	mov r0, #2
	mov r3, r5
	strb r0, [r4, #0x40]
	add r2, r4, #0x30
	mov r1, #4
_0202A25C:
	ldrb r0, [r3], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _0202A25C
	ldrb r2, [r5, #3]
	mov r1, #8
	ldrsh r0, [sp, #0x24]
	strb r2, [r4, #0x33]
	strh sb, [r4, #4]
	strh r8, [r4, #6]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r1, [r4, #0x2e]
	strh r7, [r4, #8]
	strh r6, [r4, #0xa]
	strh r0, [r4, #0x44]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0202A2A0: .word _020AFDA8
	arm_func_end sub_0202A1D4

	arm_func_start sub_0202A2A4
sub_0202A2A4: ; 0x0202A2A4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrsh ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_0202A1D4
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A2A4

	arm_func_start sub_0202A2C8
sub_0202A2C8: ; 0x0202A2C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0202A384 ; =_020AFDA8
	cmp r0, #0
	ldr ip, [r1]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, ip, #0x400
	mov lr, #0
	strh lr, [r0, #0x84]
_0202A2E8:
	ldr r0, _0202A384 ; =_020AFDA8
	ldr r4, [r0]
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	cmp r1, #8
	ldrneb r0, [ip]
	cmpne r0, #0
	beq _0202A368
	mov r0, #0x48
	mla r0, r1, r0, r4
	mov r7, ip
	add r6, r0, #0x244
	mov r5, #4
_0202A31C:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A31C
	ldmia r7, {r0, r1}
	stmia r6, {r0, r1}
	add r0, r4, #0x400
	ldrh r1, [r0, #0x84]
	add r1, r1, #1
	strh r1, [r0, #0x84]
	ldrb r1, [ip, #0x33]
	ldrsh r0, [ip, #0x44]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	movle r0, #0
	strleb r0, [ip]
	strgtb r0, [ip, #0x33]
_0202A368:
	add r0, lr, #1
	mov r0, r0, lsl #0x10
	mov lr, r0, asr #0x10
	cmp lr, #8
	add ip, ip, #0x48
	blt _0202A2E8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202A384: .word _020AFDA8
	arm_func_end sub_0202A2C8

	arm_func_start sub_0202A388
sub_0202A388: ; 0x0202A388
	stmdb sp!, {r4, r5, r6, lr}
	ldr r6, _0202A3E0 ; =_020AFDA8
	mov r5, #0
	ldr r1, [r6]
	add r0, r1, #0x400
	ldrh r0, [r0, #0x84]
	add r4, r1, #0x244
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, pc}
	b _0202A3C8
_0202A3B0:
	add r0, r4, #4
	bl sub_0201F2A0
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	add r4, r4, #0x48
_0202A3C8:
	ldr r0, [r6]
	add r0, r0, #0x400
	ldrh r0, [r0, #0x84]
	cmp r5, r0
	blt _0202A3B0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202A3E0: .word _020AFDA8
	arm_func_end sub_0202A388

	arm_func_start PrintClearMark
PrintClearMark: ; 0x0202A3E4
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end PrintClearMark

	arm_func_start sub_0202A40C
sub_0202A40C: ; 0x0202A40C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #1
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202A40C

	arm_func_start PrintBadgeMark
PrintBadgeMark: ; 0x0202A434
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl PrintMark
	ldmia sp!, {r3, pc}
	arm_func_end PrintBadgeMark

	arm_func_start PrintMark
PrintMark: ; 0x0202A45C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x70
	mov sl, r0
	mov r4, r1
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x90]
	bl FileRom_InitDataTransfer
	add r0, sp, #0x28
	bl FileRom_Veneer_FileInit
	ldr r1, _0202A5C0 ; =_020AFDAC
	add r0, sp, #0x28
	ldr r1, [r1, sl, lsl #2]
	bl FileRom_HandleOpen
	mov r1, r4, lsl #3
	add r0, sp, #0x28
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	add r1, sp, #8
	mov r2, #0x10
	bl FileRom_HandleRead
	ldr r6, [sp, #8]
	ldr r1, [sp, #0x10]
	mov r0, r6
	sub r4, r1, r6
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r4
	mov r1, #8
	bl MemAlloc
	movs r5, r0
	beq _0202A504
	add r0, sp, #0x28
	mov r1, r6
	mov r2, #0
	bl FileRom_HandleSeek
	add r0, sp, #0x28
	mov r1, r5
	mov r2, r4
	bl FileRom_HandleRead
_0202A504:
	add r0, sp, #0x28
	bl FileClose
	bl FileRom_StopDataTransfer
	cmp sl, #2
	ldreq r0, _0202A5C4 ; =_0209AE44
	add r4, sp, #0x18
	ldrne r0, _0202A5C8 ; =_0209AE34
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	mvn r0, #0
	ldrb r2, [sp, #4]
	ldrb r1, [sp, #5]
	cmp r7, r0
	ldreqb r0, [sp, #6]
	strb sb, [sp, #0x1c]
	strb r8, [sp, #0x1d]
	strb r2, [sp, #0x1e]
	strb r1, [sp, #0x1f]
	addeq r7, r0, #3
	beq _0202A564
	sub r0, r0, #1
	cmp r7, r0
	ldreqb r0, [sp, #6]
	addeq r7, r0, #0x11
_0202A564:
	add r0, sp, #0x18
	mov r1, #0
	bl CreateTextBox
	mov r1, #0
	mov r4, r0
	bl sub_02027A08
	cmp r5, #0
	beq _0202A5B4
	mov r0, r4
	mov r1, r5
	mov r2, r7, lsl #4
	bl sub_02027040
	mov r0, r4
	mov r2, r7
	add r1, r5, #0x30
	bl sub_02026E3C
	mov r0, r4
	bl UpdateWindow
	mov r0, r5
	bl MemFree
_0202A5B4:
	mov r0, r4
	add sp, sp, #0x70
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202A5C0: .word _020AFDAC
_0202A5C4: .word _0209AE44
_0202A5C8: .word _0209AE34
	arm_func_end PrintMark

	arm_func_start CreateParentMenuFromStringIds
CreateParentMenuFromStringIds: ; 0x0202A5CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A5F4
_0202A5EC:
	add r1, r1, #8
	add r2, r2, #1
_0202A5F4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202A5EC
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A638
_0202A620:
	mov r0, r5
	bl GetStringFromFileVeneer
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A638:
	ldrh r1, [r6]
	cmp r1, #0
	bne _0202A620
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenuFromStringIds

	arm_func_start IsEmptyString
IsEmptyString: ; 0x0202A66C
	cmp r0, #0
	moveq r0, #1
	bxeq lr
	ldrb r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsEmptyString

	arm_func_start CreateParentMenu
CreateParentMenu: ; 0x0202A690
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mov sb, r0
	mov r1, r6
	mov r2, #0
	b _0202A6B8
_0202A6B0:
	add r1, r1, #8
	add r2, r2, #1
_0202A6B8:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A6B0
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202A6FC
_0202A6E4:
	mov r0, r5
	bl strcpy
	ldr r0, [r6, #4]
	add r6, r6, #8
	str r0, [r5, #0x100]
	add r5, r5, #0x104
_0202A6FC:
	ldr r1, [r6]
	cmp r1, #0
	bne _0202A6E4
	mov r0, #0
	strb r0, [r5]
	ldr r6, [r6, #4]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [r5, #0x100]
	bl CreateParentMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CreateParentMenu

	arm_func_start CreateParentMenuWrapper
CreateParentMenuWrapper: ; 0x0202A730
	stmdb sp!, {r4, lr}
	bl CreateParentMenu
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	beq _0202A754
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1b0]
_0202A754:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end CreateParentMenuWrapper

	arm_func_start CreateParentMenuInternal
CreateParentMenuInternal: ; 0x0202A75C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	tst sl, #0x20
	ldrne r7, [sb]
	mov fp, #0
	moveq r7, #0
	cmp r6, #0
	str fp, [sp, #8]
	mov r4, r0
	addne ip, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202A94C ; =UpdateParentMenu
	mov r5, r8
	strne r0, [sp, #0x1c]
	bne _0202A7CC
	ldr r0, _0202A950 ; =PARENT_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202A7CC:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202A81C
	mov r6, #0
	b _0202A7F8
_0202A7E4:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202A7F8:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A7E4
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202A81C:
	mov r5, r8
	and r6, sl, #0x20
	b _0202A84C
_0202A828:
	cmp r6, #0
	beq _0202A83C
	ldr r0, [r5, #0x100]
	cmp r0, r7
	ldreq fp, [sp, #8]
_0202A83C:
	ldr r0, [sp, #8]
	add r5, r5, #0x104
	add r0, r0, #1
	str r0, [sp, #8]
_0202A84C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202A828
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	bne _0202A880
	add r2, sp, #8
	mov r0, sl
	mov r1, sb
	mov r3, r2
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
_0202A880:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202A94C ; =UpdateParentMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202A8DC
	add r6, r4, #0x100
	mov r5, #9
_0202A8C4:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202A8C4
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202A8DC:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1a8]
	str r2, [r4, #0x1ac]
	strb r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r5, [sp, #8]
	add r3, sp, #0xc
	str r5, [sp]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202A94C: .word UpdateParentMenu
_0202A950: .word PARENT_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateParentMenuInternal

	arm_func_start ResumeParentMenu
ResumeParentMenu: ; 0x0202A954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	str r1, [r0, #0x1a4]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeParentMenu

	arm_func_start sub_0202A98C
sub_0202A98C: ; 0x0202A98C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov sb, r1
	mov r5, #0
	bl GetWindow
	mov r7, r0
	mov r1, sb
	ldr r8, [r7, #0xc]
	b _0202A9BC
_0202A9B4:
	add r1, r1, #8
	add r5, r5, #1
_0202A9BC:
	ldr r0, [r1]
	cmp r0, #0
	bne _0202A9B4
	ldr r0, [r8, #0x198]
	cmp r0, #0
	beq _0202A9D8
	bl MemFree
_0202A9D8:
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	b _0202AA10
_0202A9F8:
	mov r0, r6
	bl strcpy
	ldr r0, [sb, #4]
	add sb, sb, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202AA10:
	ldr r1, [sb]
	cmp r1, #0
	bne _0202A9F8
	mov sl, #0
	strb sl, [r6]
	ldr r0, [sb, #4]
	mov sb, r5
	str r0, [r6, #0x100]
	b _0202AA3C
_0202AA34:
	add sb, sb, #0x104
	add sl, sl, #1
_0202AA3C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202AA34
	str r5, [r8, #0x198]
	ldrb r0, [r7, #8]
	bl sub_020287C4
	mov r0, r4
	bl UpdateWindow
	mov r0, #3
	str r0, [r8, #0x19c]
	mov r2, #0
	strb r2, [r8, #0x1a0]
	strb r2, [r8, #0x1a1]
	add r1, sp, #8
	mov r0, r4
	str r2, [r8, #0x1a4]
	bl GetWindowRectangle
	str sl, [sp]
	str sl, [sp, #4]
	ldr r1, [r8, #0xfc]
	add r0, r8, #4
	add r2, r8, #0x100
	add r3, sp, #8
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_0202A98C

	arm_func_start SetParentMenuState7
SetParentMenuState7: ; 0x0202AAA8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #7
	str r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end SetParentMenuState7

	arm_func_start CloseParentMenu
CloseParentMenu: ; 0x0202AABC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseParentMenu

	arm_func_start sub_0202AAE8
sub_0202AAE8: ; 0x0202AAE8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #9
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202AAE8

	arm_func_start IsParentMenuActive
IsParentMenuActive: ; 0x0202AB40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #8
	cmpne r0, #9
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsParentMenuActive

	arm_func_start CheckParentMenuField0x1A0
CheckParentMenuField0x1A0: ; 0x0202AB60
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckParentMenuField0x1A0

	arm_func_start sub_0202AB80
sub_0202AB80: ; 0x0202AB80
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202AB80

	arm_func_start sub_0202AB94
sub_0202AB94: ; 0x0202AB94
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202AB94

	arm_func_start sub_0202ABB0
sub_0202ABB0: ; 0x0202ABB0
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202ABF4
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202ABE0
	bl sub_0203258C
	b _0202ABE4
_0202ABE0:
	bl sub_02032578
_0202ABE4:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202ABF4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202ABB0

	arm_func_start UpdateParentMenu
UpdateParentMenu: ; 0x0202ABFC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202AF6C
_0202AC1C: ; jump table
	b _0202AC3C ; case 0
	b _0202AC5C ; case 1
	b _0202AC78 ; case 2
	b _0202ACDC ; case 3
	b _0202AD3C ; case 4
	b _0202AEE8 ; case 5
	b _0202AEF8 ; case 6
	b _0202AF40 ; case 7
_0202AC3C:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202AF6C
	ldr r1, [r4, #0x1a8]
	mov r0, #2
	str r1, [r4, #0x1ac]
	str r0, [r4, #0x19c]
_0202AC5C:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1a8]
	moveq r0, #2
	streq r1, [r4, #0x1ac]
	streq r0, [r4, #0x19c]
	beq _0202AF6C
_0202AC78:
	ldr r0, [r4, #0x1a8]
	cmp r0, #0
	ble _0202ACD4
	ldr r0, [r4, #0x1ac]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	add r0, r4, #4
	ble _0202ACD0
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a4]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202AF78
	b _0202AF6C
_0202ACD0:
	bl sub_02031C84
_0202ACD4:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202ACDC:
	mov r0, r6
	bl sub_0202AF78
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202AD18
	mov r0, #9
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD18:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202AF6C
_0202AD3C:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202ADAC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202ADAC
	mov r3, #0
	ldr r2, _0202AF74 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202ADAC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202ADAC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202ADCC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202ADCC:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202ADF8
	mov r0, r6
	bl sub_0202AF78
_0202ADF8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202AE68
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202AE58
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202AE2C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202AE2C:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AE58:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202AED8
_0202AE68:
	tst r1, #2
	add r0, r4, #4
	beq _0202AEA4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202AED8
_0202AEA4:
	bl sub_0203250C
	cmp r0, #0
	beq _0202AED8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202AED8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202AF6C
_0202AEE8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202AF6C
_0202AEF8:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202AF24
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202AF38
	mov r0, r6
	bl sub_0202AF78
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202AF6C
_0202AF24:
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	movne r0, #9
	strne r0, [r4, #0x19c]
	bne _0202AF6C
_0202AF38:
	mov r0, #7
	str r0, [r4, #0x19c]
_0202AF40:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202AF6C
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
_0202AF6C:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202AF74: .word 0x00000408
	arm_func_end UpdateParentMenu

	arm_func_start sub_0202AF78
sub_0202AF78: ; 0x0202AF78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r5, [sl, #0xc]
	mov r7, #0
	ldr r0, [r5, #0xfc]
	ldr r6, [r5, #0x198]
	tst r0, #0x200
	ldrne r8, [r5, #0x160]
	ldrsb r0, [sl, #0x10]
	moveq r8, #0
	bl sub_02027B1C
	mov fp, #1
	mov r4, r7
	b _0202B008
_0202AFB0:
	mov r1, r4
	cmp r8, #0
	beq _0202AFCC
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, fp
_0202AFCC:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r5, #4
	bl sub_020328D8
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	add r7, r7, #1
	add r6, r6, #0x104
_0202B008:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202AFB0
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202AF78

	arm_func_start sub_0202B030
sub_0202B030: ; 0x0202B030
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B094
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B068
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B068:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
_0202B094:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B030

	arm_func_start sub_0202B0A4
sub_0202B0A4: ; 0x0202B0A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	add r0, r4, #4
	mov r1, #0xb000000
	beq _0202B0D8
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C84
	ldmia sp!, {r3, r4, r5, pc}
_0202B0D8:
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10
	bl sub_02031C74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202B0A4

	arm_func_start CreateSimpleMenuFromStringIds
CreateSimpleMenuFromStringIds: ; 0x0202B0EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r3
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r1, r7
	mov r2, #0
	b _0202B114
_0202B10C:
	add r1, r1, #8
	add r2, r2, #1
_0202B114:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202B10C
	add r0, r2, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r5, r0
	mov r6, r5
	mov r4, #0
	mov fp, #0x100
	b _0202B16C
_0202B148:
	ldr r3, _0202B1A8 ; =0x0000C402
	mov r0, r6
	mov r1, fp
	str r4, [sp]
	bl PreprocessStringFromId
	ldr r0, [r7, #4]
	add r7, r7, #8
	str r0, [r6, #0x100]
	add r6, r6, #0x104
_0202B16C:
	ldrh r2, [r7]
	cmp r2, #0
	bne _0202B148
	mov r0, #0
	strb r0, [r6]
	ldr r0, [r7, #4]
	ldr r4, [sp, #0x28]
	str r0, [r6, #0x100]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r5
	str r4, [sp]
	bl CreateSimpleMenuInternal
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B1A8: .word 0x0000C402
	arm_func_end CreateSimpleMenuFromStringIds

	arm_func_start CreateSimpleMenu
CreateSimpleMenu: ; 0x0202B1AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r4, r6
	mov r5, #0
	b _0202B1D8
_0202B1D0:
	add r4, r4, #0x104
	add r5, r5, #1
_0202B1D8:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202B1D0
	add r0, r5, #1
	add r0, r0, r0, lsl #6
	mov r0, r0, lsl #2
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r5, r4
	b _0202B234
_0202B208:
	mov sl, r6
	mov ip, r5
	add r6, r6, #0x104
	add r5, r5, #0x104
	mov lr, #0x10
_0202B21C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs lr, lr, #1
	bne _0202B21C
	ldr r0, [sl]
	str r0, [ip]
_0202B234:
	mov r0, r6
	bl IsEmptyString
	cmp r0, #0
	beq _0202B208
	mov ip, #0x10
_0202B248:
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202B248
	ldr r0, [r6]
	ldr r6, [sp, #0x28]
	str r0, [r5]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r4
	str r6, [sp]
	bl CreateSimpleMenuInternal
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end CreateSimpleMenu

	arm_func_start CreateSimpleMenuInternal
CreateSimpleMenuInternal: ; 0x0202B284
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	tst sl, #0x20
	ldrne r7, [sb]
	mov fp, #0
	moveq r7, #0
	cmp r6, #0
	str fp, [sp, #8]
	mov r4, r0
	addne ip, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202B488 ; =UpdateSimpleMenu
	mov r5, r8
	orr sl, sl, #0x8000
	strne r0, [sp, #0x1c]
	bne _0202B2F8
	ldr r0, _0202B48C ; =SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202B2F8:
	ldrb r0, [sp, #0x22]
	str r4, [sp, #0x28]
	cmp r0, #0
	bne _0202B348
	mov r6, #0
	b _0202B324
_0202B310:
	mov r0, r5
	bl sub_020265A8
	cmp r0, r6
	movgt r6, r0
	add r5, r5, #0x104
_0202B324:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B310
	mov r0, sl
	mov r1, sb
	add r2, r6, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202B348:
	mov r5, r8
	b _0202B36C
_0202B350:
	ldr r0, [r5, #0x100]
	add r5, r5, #0x104
	cmp r0, r7
	ldr r0, [sp, #8]
	ldreq fp, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0202B36C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202B350
	ldr r0, [sp, #0x50]
	add r2, sp, #8
	cmp r0, #0
	ldrle r0, [sp, #8]
	add r3, sp, #0x50
	strle r0, [sp, #0x50]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, sl
	bne _0202B3B4
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202B3BC
_0202B3B4:
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202B3BC:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202B488 ; =UpdateSimpleMenu
	cmp sb, #0
	str r0, [r4]
	str sl, [r4, #0xfc]
	beq _0202B418
	add r6, r4, #0x100
	mov r5, #9
_0202B400:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202B400
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202B418:
	str fp, [r4, #0x100]
	str r8, [r4, #0x198]
	mov r2, #0
	str r2, [r4, #0x19c]
	strb r2, [r4, #0x1a0]
	strb r2, [r4, #0x1a1]
	str r2, [r4, #0x1a4]
	str r2, [r4, #0x1ac]
	str r2, [r4, #0x1b0]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [sp, #0x24]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r5, [sp, #0x50]
	mov r1, sl
	add r0, r4, #4
	add r2, r4, #0x100
	str r5, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202B488: .word UpdateSimpleMenu
_0202B48C: .word SIMPLE_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateSimpleMenuInternal

	arm_func_start ResumeSimpleMenu
ResumeSimpleMenu: ; 0x0202B490
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeSimpleMenu

	arm_func_start CloseSimpleMenu
CloseSimpleMenu: ; 0x0202B4C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseSimpleMenu

	arm_func_start IsSimpleMenuActive
IsSimpleMenuActive: ; 0x0202B4F0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSimpleMenuActive

	arm_func_start CheckSimpleMenuField0x1A0
CheckSimpleMenuField0x1A0: ; 0x0202B510
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckSimpleMenuField0x1A0

	arm_func_start sub_0202B530
sub_0202B530: ; 0x0202B530
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B530

	arm_func_start sub_0202B544
sub_0202B544: ; 0x0202B544
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032560
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B544

	arm_func_start GetSimpleMenuField0x1A4
GetSimpleMenuField0x1A4: ; 0x0202B558
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a4]
	ldmia sp!, {r3, pc}
	arm_func_end GetSimpleMenuField0x1A4

	arm_func_start sub_0202B568
sub_0202B568: ; 0x0202B568
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_0203259C
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202B568

	arm_func_start GetSimpleMenuResult
GetSimpleMenuResult: ; 0x0202B57C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	ldr r4, [r0, #0x198]
	cmp r1, #0
	beq _0202B5C0
	ldrb r1, [r0, #0x1a1]
	add r0, r0, #4
	cmp r1, #0
	beq _0202B5AC
	bl sub_0203258C
	b _0202B5B0
_0202B5AC:
	bl sub_02032578
_0202B5B0:
	add r0, r0, r0, lsl #6
	add r0, r4, r0, lsl #2
	ldr r0, [r0, #0x100]
	ldmia sp!, {r4, pc}
_0202B5C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end GetSimpleMenuResult

	arm_func_start UpdateSimpleMenu
UpdateSimpleMenu: ; 0x0202B5C8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0202B928
_0202B5E8: ; jump table
	b _0202B604 ; case 0
	b _0202B624 ; case 1
	b _0202B640 ; case 2
	b _0202B6A4 ; case 3
	b _0202B704 ; case 4
	b _0202B8B8 ; case 5
	b _0202B8FC ; case 6
_0202B604:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202B928
	ldr r1, [r4, #0x1ac]
	mov r0, #2
	str r1, [r4, #0x1b0]
	str r0, [r4, #0x19c]
_0202B624:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	ldreq r1, [r4, #0x1ac]
	moveq r0, #2
	streq r1, [r4, #0x1b0]
	streq r0, [r4, #0x19c]
	beq _0202B928
_0202B640:
	ldr r0, [r4, #0x1ac]
	cmp r0, #0
	ble _0202B69C
	ldr r0, [r4, #0x1b0]
	mov r1, #0x4000000
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r4, #0x1b0]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	add r0, r4, #4
	ble _0202B698
	bl sub_02031C74
	mov r1, #0
	strb r1, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	str r1, [r4, #0x1a8]
	sub r1, r1, #1
	mov r0, r6
	str r1, [r6, #0xb8]
	bl sub_0202B934
	b _0202B928
_0202B698:
	bl sub_02031C84
_0202B69C:
	mov r0, #3
	str r0, [r4, #0x19c]
_0202B6A4:
	mov r0, r6
	bl sub_0202B934
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202B6E0
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202B928
_0202B6E0:
	mov r1, #4
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a8]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202B928
_0202B704:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	str r1, [r4, #0x1a4]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B77C
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202B77C
	mov r3, #0
	ldr r2, _0202B930 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202B77C
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202B77C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202B79C
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202B79C:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202B7C8
	mov r0, r6
	bl sub_0202B934
_0202B7C8:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202B838
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202B828
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202B7FC
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202B7FC:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B828:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202B8A8
_0202B838:
	tst r1, #2
	add r0, r4, #4
	beq _0202B874
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
	b _0202B8A8
_0202B874:
	bl sub_0203250C
	cmp r0, #0
	beq _0202B8A8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a8]
	str r0, [r6, #0xb8]
	mov r0, #5
	str r0, [r4, #0x19c]
_0202B8A8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202B928
_0202B8B8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202B8F4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202B8F4
	mov r0, r6
	bl sub_0202B934
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202B928
_0202B8F4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202B8FC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202B928
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202B928:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202B930: .word 0x00000408
	arm_func_end UpdateSimpleMenu

	arm_func_start sub_0202B934
sub_0202B934: ; 0x0202B934
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r7, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r2, [r4, #0xfc]
	mov r5, r0
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r1, r7, r7, lsl #6
	ldrsb r0, [sl, #0x10]
	add r6, r3, r1, lsl #2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202B9F4
	mov fp, r7
	b _0202B9EC
_0202B994:
	mov r1, fp
	cmp r8, #0
	beq _0202B9B0
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202B9B0:
	cmp r1, #0
	movne sb, #0x42
	moveq sb, #0x44
	mov r1, r7
	add r0, r4, #4
	bl sub_020328D8
	and r1, sb, #0xff
	str r1, [sp]
	mov r2, r0
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	add r7, r7, #1
	add r6, r6, #0x104
_0202B9EC:
	cmp r7, r5
	blt _0202B994
_0202B9F4:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202B934

	arm_func_start SetSimpleMenuField0x1AC
SetSimpleMenuField0x1AC: ; 0x0202BA0C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1ac]
	ldmia sp!, {r4, pc}
	arm_func_end SetSimpleMenuField0x1AC

	arm_func_start CreateAdvancedMenu
CreateAdvancedMenu: ; 0x0202BA20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b0
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _0202BBE8 ; =ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _0202BBEC ; =UpdateAdvancedMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _0202BADC
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _0202BABC
_0202BA98:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _0202BAB8
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202BAB8:
	add r6, r6, #1
_0202BABC:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _0202BA98
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_0202BADC:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _0202BB0C
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _0202BB1C
_0202BB0C:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202BB1C:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _0202BBEC ; =UpdateAdvancedMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0202BB78
	add r6, r5, #0x100
	mov r4, #9
_0202BB60:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202BB60
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202BB78:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r8, [r5, #0x198]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a8]
	add r0, sp, #0x18
	mov r1, #3
	str r2, [r5, #0x1ac]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x448]
	add r3, sp, #8
	str r0, [sp]
	ldr r4, [sp, #0x44c]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x28
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0202BBE8: .word ADVANCED_MENU_DEFAULT_WINDOW_PARAMS
_0202BBEC: .word UpdateAdvancedMenu
	arm_func_end CreateAdvancedMenu

	arm_func_start ResumeAdvancedMenu
ResumeAdvancedMenu: ; 0x0202BBF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x19c]
	mov r1, #0
	strb r1, [r0, #0x1a0]
	strb r1, [r0, #0x1a1]
	str r1, [r0, #0x1a4]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end ResumeAdvancedMenu

	arm_func_start sub_0202BC28
sub_0202BC28: ; 0x0202BC28
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202BC28

	arm_func_start CloseAdvancedMenu
CloseAdvancedMenu: ; 0x0202BC44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAdvancedMenu

	arm_func_start sub_0202BC60
sub_0202BC60: ; 0x0202BC60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x19c]
	cmp r0, #3
	cmpne r0, #4
	cmpne r0, #0xa
	cmpne r0, #8
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #1
	strb r0, [r4, #0x1a0]
	mov r2, #0
	strb r0, [r4, #0x1a1]
	mov r0, r5
	sub r1, r2, #5
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #6
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202BC60

	arm_func_start IsAdvancedMenuActive2
IsAdvancedMenuActive2: ; 0x0202BCBC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #7
	cmpne r0, #8
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive2

	arm_func_start IsAdvancedMenuActive
IsAdvancedMenuActive: ; 0x0202BCDC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedMenuActive

	arm_func_start GetAdvancedMenuCurrentOption
GetAdvancedMenuCurrentOption: ; 0x0202BCFC
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuCurrentOption

	arm_func_start GetAdvancedMenuResult
GetAdvancedMenuResult: ; 0x0202BD10
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _0202BD40
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_0202BD40:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedMenuResult

	arm_func_start sub_0202BD48
sub_0202BD48: ; 0x0202BD48
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202BD48

	arm_func_start UpdateAdvancedMenu
UpdateAdvancedMenu: ; 0x0202BD64
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r4, [r6, #0xc]
	ldr r0, [r4, #0x19c]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202C1D8
_0202BD84: ; jump table
	b _0202BDB0 ; case 0
	b _0202BDC8 ; case 1
	b _0202BDF0 ; case 2
	b _0202BE50 ; case 3
	b _0202C168 ; case 4
	b _0202C178 ; case 5
	b _0202C1AC ; case 6
	b _0202C1D8 ; case 7
	b _0202C1D8 ; case 8
	b _0202C0F8 ; case 9
	b _0202C130 ; case 10
_0202BDB0:
	ldrsb r0, [r6, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202C1D8
	mov r0, #2
	str r0, [r4, #0x19c]
_0202BDC8:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _0202BDF0
	ldrb r0, [r6, #8]
	bl sub_020287C4
	ldrsb r0, [r6, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202BDF0:
	mov r0, r6
	bl sub_0202C260
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202BE2C
	mov r0, #8
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE2C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r6, #0xb8]
	b _0202C1D8
_0202BE50:
	mov r0, #0
	str r0, [sp, #8]
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202BEC8
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _0202BEC8
	mov r3, #0
	ldr r2, _0202C1E0 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202BEC8
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, #1
	orr r0, r0, #1
	str r0, [sp, #8]
_0202BEC8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202BEE8
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202BEE8:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r5, r0
	beq _0202BF14
	mov r0, r6
	bl sub_0202C260
_0202BF14:
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0202BF84
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202BF74
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202BF48
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202BF48:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BF74:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202C0E8
_0202BF84:
	tst r1, #2
	beq _0202BFC0
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202BFC0:
	tst r1, #0x1000
	beq _0202C00C
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _0202C00C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C00C:
	tst r1, #0x2000
	beq _0202C058
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _0202C058
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #0xa
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C058:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _0202C080
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _0202C0E8
_0202C080:
	bl sub_0203250C
	cmp r0, #0
	beq _0202C0B8
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r6, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _0202C0E8
_0202C0B8:
	ldr r0, [sp, #8]
	tst r0, #0x40000
	bne _0202C0CC
	tst r0, #0x80000
	beq _0202C0E8
_0202C0CC:
	tst r0, #0x4000
	bne _0202C0E8
	tst r0, #0x8000
	moveq r0, #1
	streqb r0, [r4, #0x1a0]
	ldreq r0, [sp, #8]
	streq r0, [r4, #0x1a4]
_0202C0E8:
	ldrsb r0, [r6, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202C1D8
_0202C0F8:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl sub_0202C260
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C130:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
	mov r0, r6
	bl sub_0202C260
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _0202C1D8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202C1D8
_0202C168:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202C1D8
_0202C178:
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _0202C1A4
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202C1A4
	mov r0, r6
	bl sub_0202C260
	mov r0, #8
	str r0, [r4, #0x19c]
	b _0202C1D8
_0202C1A4:
	mov r0, #6
	str r0, [r4, #0x19c]
_0202C1AC:
	ldrsb r0, [r6, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202C1D8
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r6, #0xb8]
	mov r0, #7
	str r0, [r4, #0x19c]
_0202C1D8:
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202C1E0: .word 0x00000408
	arm_func_end UpdateAdvancedMenu

	arm_func_start sub_0202C1E4
sub_0202C1E4: ; 0x0202C1E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202C24C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _0202C21C
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202C21C:
	mov r2, #1
	mov r1, #0
	strb r2, [r4, #0x1a0]
	strb r1, [r4, #0x1a1]
	mov r0, r5
	sub r1, r1, #4
	str r2, [r4, #0x1a4]
	bl sub_0202830C
	mov r0, #5
	str r0, [r4, #0x19c]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0202C24C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C1E4

	arm_func_start sub_0202C260
sub_0202C260: ; 0x0202C260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r6, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	addne sb, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq sb, #0
	bl sub_02027B1C
	cmp r6, #0
	mov r7, #0
	ble _0202C36C
	mov fp, #0x42
	b _0202C364
_0202C2BC:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _0202C2EC
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_0202C2EC:
	cmp r8, #0
	beq _0202C35C
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _0202C334
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp, #4]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #8]
	ldrsb r0, [sl, #0x10]
	bl sub_02026428
	b _0202C35C
_0202C334:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #4]
	ldrsb r0, [sl, #0x10]
	bl sub_02026358
_0202C35C:
	add r7, r7, #1
	add r5, r5, #1
_0202C364:
	cmp r7, r6
	blt _0202C2BC
_0202C36C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202C260

	arm_func_start sub_0202C38C
sub_0202C38C: ; 0x0202C38C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	ldrne r0, [r0, #0x1a4]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C38C

	arm_func_start CreateCollectionMenu
CreateCollectionMenu: ; 0x0202C3A8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	sub sp, sp, #0x400
	mov r4, r0
	mov sl, r1
	mov r0, #0x1cc
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	ldr r1, [sp, #0x450]
	mov r5, r0
	cmp r1, #0
	ldrne r0, _0202C5D4 ; =0x10008004
	orr sl, sl, #0x8000
	orrne sl, sl, r0
	cmp r4, #0
	addne r6, sp, #0x1c
	ldmneia r4, {r0, r1, r2, r3}
	stmneia r6, {r0, r1, r2, r3}
	ldrne r0, _0202C5D8 ; =UpdateCollectionMenu
	strne r0, [sp, #0x1c]
	bne _0202C418
	ldr r0, _0202C5DC ; =COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	orr sl, sl, #0x300000
_0202C418:
	ldrb r0, [sp, #0x22]
	str r5, [sp, #0x28]
	cmp r0, #0
	bne _0202C484
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x2c
	add fp, sp, #8
	b _0202C464
_0202C43C:
	mov r0, r4
	mov r1, r6
	mov r2, fp
	blx r8
	cmp r0, #0
	beq _0202C460
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_0202C460:
	add r6, r6, #1
_0202C464:
	ldr r0, [sp, #0x454]
	cmp r6, r0
	blt _0202C43C
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202C484:
	ldrb r0, [sp, #0x23]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x54
	bne _0202C4B4
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202C4C4
_0202C4B4:
	add r3, r3, #0x58
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_0202C4C4:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r1, _0202C5D8 ; =UpdateCollectionMenu
	mov r0, #0
	str r1, [r5]
	str sl, [r5, #0xfc]
	strb r0, [r5, #0x1c5]
	cmp sb, #0
	beq _0202C528
	add r6, r5, #0x100
	mov r4, #9
_0202C510:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0202C510
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0202C528:
	mov r3, #0
	str r3, [r5, #0x18c]
	ldr r0, [sp, #0x450]
	str r8, [r5, #0x198]
	str r0, [r5, #0x19c]
	str r3, [r5, #0x1a8]
	str r3, [r5, #0x1ac]
	strb r3, [r5, #0x1b0]
	strb r3, [r5, #0x1b1]
	strb r3, [r5, #0x1b2]
	str r3, [r5, #0x1b4]
	str r3, [r5, #0x1b8]
	mov r0, #0xd
	str r0, [r5, #0x1bc]
	strb r3, [r5, #0x1c6]
	ldrb r2, [sp, #0x22]
	add r0, sp, #0x1c
	mov r1, #3
	mov r2, r2, lsl #3
	sub r2, r2, #1
	str r2, [r5, #0x1c0]
	strb r3, [r5, #0x1c4]
	strb r3, [r5, #0x1c8]
	strb r3, [r5, #0x1c9]
	str r3, [r5, #0x1a4]
	str r3, [r5, #0x1a0]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x454]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x458]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x2c
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202C5D4: .word 0x10008004
_0202C5D8: .word UpdateCollectionMenu
_0202C5DC: .word COLLECTION_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateCollectionMenu

	arm_func_start SetCollectionMenuField0x1BC
SetCollectionMenuField0x1BC: ; 0x0202C5E0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1bc]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1BC

	arm_func_start SetCollectionMenuWidth
SetCollectionMenuWidth: ; 0x0202C5F4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindow
	ldr r1, [r0, #0xc]
	str r4, [r1, #0x1c0]
	ldrb r0, [r0, #6]
	mov r0, r0, lsl #3
	sub r0, r0, #1
	cmp r4, r0
	strgt r0, [r1, #0x1c0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuWidth

	arm_func_start sub_0202C620
sub_0202C620: ; 0x0202C620
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1ac]
	mov r1, #0
	strb r1, [r0, #0x1b0]
	strb r1, [r0, #0x1b1]
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0x800000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C620

	arm_func_start sub_0202C654
sub_0202C654: ; 0x0202C654
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x1ac]
	mov r0, #0
	strb r0, [r4, #0x1b0]
	strb r0, [r4, #0x1b1]
	cmp r5, #0
	bne _0202C6A4
	mov r0, r8
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	str r0, [r4, #0x100]
_0202C6A4:
	add r1, sp, #8
	mov r0, r8
	bl GetWindowRectangle
	str r7, [sp]
	str r6, [sp, #4]
	ldr r1, [r4, #0xfc]
	add r3, sp, #8
	add r0, r4, #4
	add r2, r4, #0x100
	bl InitWindowInput
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0202C654

	arm_func_start sub_0202C6D4
sub_0202C6D4: ; 0x0202C6D4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202C6D4

	arm_func_start sub_0202C6F0
sub_0202C6F0: ; 0x0202C6F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	str r5, [r0, #0x1b4]
	str r4, [r0, #0x1b8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202C6F0

	arm_func_start CloseCollectionMenu
CloseCollectionMenu: ; 0x0202C70C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseCollectionMenu

	arm_func_start IsCollectionMenuActive
IsCollectionMenuActive: ; 0x0202C728
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuActive

	arm_func_start sub_0202C748
sub_0202C748: ; 0x0202C748
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C748

	arm_func_start sub_0202C75C
sub_0202C75C: ; 0x0202C75C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1b0]
	cmp r1, #0
	beq _0202C78C
	ldrb r1, [r0, #0x1b1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_0202C78C:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C75C

	arm_func_start SetCollectionMenuField0x1C8
SetCollectionMenuField0x1C8: ; 0x0202C794
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1C8

	arm_func_start SetCollectionMenuField0x1A0
SetCollectionMenuField0x1A0: ; 0x0202C7A8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a0]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A0

	arm_func_start SetCollectionMenuField0x1A4
SetCollectionMenuField0x1A4: ; 0x0202C7BC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a4]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1A4

	arm_func_start SetCollectionMenuVoidFn
SetCollectionMenuVoidFn: ; 0x0202C7D0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1a8]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuVoidFn

	arm_func_start sub_0202C7E4
sub_0202C7E4: ; 0x0202C7E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x1ac]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x1ac]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202C7E4

	arm_func_start UpdateCollectionMenu
UpdateCollectionMenu: ; 0x0202C808
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldrsb r0, [r4, #0x10]
	ldr r5, [r4, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r5, #0x1ac]
	and fp, r1, #0xff
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _0202CE40
_0202C840: ; jump table
	b _0202C86C ; case 0
	b _0202C884 ; case 1
	b _0202C8C0 ; case 2
	b _0202C918 ; case 3
	b _0202CDC8 ; case 4
	b _0202CE0C ; case 5
	b _0202CE40 ; case 6
	b _0202CE40 ; case 7
	b _0202CCA4 ; case 8
	b _0202CD14 ; case 9
	b _0202CD74 ; case 10
_0202C86C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202CE40
	mov r0, #2
	str r0, [r5, #0x1ac]
_0202C884:
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202C8C0
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202C8A4
	mov r0, r4
	bl sub_0202CEA0
_0202C8A4:
	ldrb r0, [r4, #8]
	bl sub_020287C4
	ldrsb r0, [r4, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202C8C0:
	mov r0, r4
	bl sub_0202CEA0
	ldr r0, [r5, #0xfc]
	tst r0, #0x800000
	beq _0202C8F8
	mov r0, #7
	str r0, [r5, #0x1ac]
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C8F8:
	mov r1, #3
	mov r0, #0
	str r1, [r5, #0x1ac]
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #1
	str r0, [r4, #0xb8]
	b _0202CE40
_0202C918:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, #0
	cmp r1, #0
	movne r6, #1
	mov r8, r0
	cmp r1, #0
	bne _0202CA70
	ldr r0, [r5, #0xfc]
	tst r0, #1
	beq _0202CA70
	mov r3, #0
	str r3, [sp]
	ldr r2, _0202CE9C ; =0x00000408
	add r1, sp, #0xc
	add r0, r5, #4
	str r3, [sp, #4]
	bl sub_02032160
	movs r7, r0
	bmi _0202CA70
	ldrb r0, [r5, #0x1b2]
	cmp r0, #0
	beq _0202C994
	add r0, r5, #4
	bl sub_02032578
	cmp r7, r0
	bne _0202CA54
_0202C994:
	ldr r0, [r5, #0x19c]
	cmp r0, #0
	ldrne r0, [sp, #8]
	orrne r0, r0, #4
	orrne r0, r0, #0x400
	strne r0, [sp, #8]
	bne _0202CA60
	ldr r1, [sp, #8]
	add r0, r5, #4
	orr r1, r1, #1
	str r1, [sp, #8]
	ldr r8, [r5, #0xc]
	ldr sb, [r5, #0x10]
	bl sub_02032568
	mov r1, r0
	add r0, r5, #4
	sub r1, r7, r1
	bl sub_020328D8
	ldr r1, [r5, #4]
	add sl, r1, r0
	add r0, r5, #4
	bl sub_02032568
	sub r0, r7, r0
	add r1, r0, #1
	add r0, r5, #4
	bl sub_020328D8
	ldr r2, [r5, #4]
	mov r1, #6
	str r1, [r5, #0xdc]
	sub r1, r1, #7
	str r1, [r5, #0xe0]
	mov r1, #0
	str r1, [r5, #0xe4]
	ldr r1, [r5, #0xc]
	add r0, r2, r0
	sub r1, r8, r1
	str r1, [r5, #0xf0]
	ldr r1, [r5, #0xc]
	sub r0, r0, #2
	sub r1, sb, r1
	str r1, [r5, #0xf4]
	ldr r1, [r5, #4]
	sub r1, sl, r1
	str r1, [r5, #0xe8]
	ldr r1, [r5, #4]
	sub r0, r0, r1
	str r0, [r5, #0xec]
	b _0202CA60
_0202CA54:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
_0202CA60:
	mov r1, r7
	add r0, r5, #4
	bl sub_02032684
	mov r8, #1
_0202CA70:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202CA90
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r5, #4
	bl sub_02033758
	orr r8, r8, r0
_0202CA90:
	add r0, r5, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r5, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r8, r0
	ldreqb r0, [r5, #0x1c4]
	cmpeq r0, #0
	beq _0202CACC
	mov r1, #0
	mov r0, r4
	strb r1, [r5, #0x1c4]
	bl sub_0202CEA0
_0202CACC:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202CB44
	cmp r6, #0
	add r0, r5, #4
	beq _0202CAEC
	bl sub_020324C4
	b _0202CAF0
_0202CAEC:
	bl IsMenuOptionActive
_0202CAF0:
	cmp r0, #0
	beq _0202CB34
	ldr r0, [r5, #0xfc]
	tst r0, #0x80000000
	bne _0202CB10
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
_0202CB10:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB34:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _0202CC94
_0202CB44:
	tst r0, #2
	beq _0202CB94
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r1, [r5, #0x1a0]
	cmp r1, #0
	beq _0202CB74
	ldrsb r0, [r4, #0x10]
	blx r1
	cmp r0, #0
	bne _0202CE40
_0202CB74:
	mov r0, #1
	strb r0, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	sub r0, r0, #6
	str r0, [r4, #0xb8]
	mov r0, #4
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CB94:
	tst r0, #0x1000
	beq _0202CBE8
	ldr r1, [r5, #0xfc]
	tst r1, #0x2000
	beq _0202CBE8
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CBC0
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
_0202CBC0:
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #8
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CBE8:
	tst r0, #0x2000
	beq _0202CC30
	ldr r1, [r5, #0xfc]
	tst r1, #0x4000
	beq _0202CC30
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #9
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC30:
	tst r0, #0x200
	ldrne r1, [r5, #0x18c]
	cmpne r1, #0
	beq _0202CC74
	add r0, r5, #4
	mov r1, #5
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r5, #0x1b0]
	strb r0, [r5, #0x1b1]
	strb r1, [r5, #0x1c7]
	sub r0, r0, #4
	str r0, [r4, #0xb8]
	mov r0, #0xa
	str r0, [r5, #0x1ac]
	b _0202CC94
_0202CC74:
	ldr r1, [r5, #0x19c]
	cmp r1, #0
	beq _0202CC94
	blx r1
	cmp r0, #0
	beq _0202CC94
	mov r0, r4
	bl sub_0202CEA0
_0202CC94:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202CE40
_0202CCA4:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x174]
	cmp r0, #0
	beq _0202CD04
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CCEC
	mov r0, r4
	bl sub_0202CEA0
_0202CCEC:
	mov r0, #0
	ldr r3, [r5, #0x174]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD04:
	mov r0, #1
	strb r0, [r5, #0x1c5]
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CD14:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CD5C
	mov r0, r4
	bl sub_0202CEA0
_0202CD5C:
	mov r0, #0
	ldr r3, [r5, #0x17c]
	mov r1, r0
	mov r2, r0
	blx r3
	b _0202CE40
_0202CD74:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1c7]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r5, #0x1c7]
	movne r0, #1
	strneb r0, [r5, #0x1c6]
	ldr r0, [r5, #0x18c]
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1c6]
	cmp r0, #0
	beq _0202CDBC
	mov r0, r4
	bl sub_0202CEA0
_0202CDBC:
	ldr r0, [r5, #0x18c]
	blx r0
	b _0202CE40
_0202CDC8:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	bne _0202CE04
	ldr r0, [r5, #0xfc]
	tst r0, #0x400000
	beq _0202CE04
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #7
	str r0, [r5, #0x1ac]
	b _0202CE40
_0202CE04:
	mov r0, #5
	str r0, [r5, #0x1ac]
_0202CE0C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202CE40
	ldrb r0, [r5, #0x1b1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r4, #0xb8]
	mov r0, #6
	str r0, [r5, #0x1ac]
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE40:
	mov r0, #0
	strb r0, [r5, #0x1c6]
	cmp fp, #0
	beq _0202CE6C
	ldr r0, [r5, #0x1ac]
	cmp r0, #1
	bne _0202CE6C
	mov r0, r4
	bl sub_0202CEA0
	mov r0, #1
	strb r0, [r5, #0x1c6]
_0202CE6C:
	ldr r0, [r5, #0x1a8]
	cmp r0, #0
	ldrne r0, [r5, #0x1ac]
	cmpne r0, #8
	cmpne r0, #9
	beq _0202CE94
	add r0, r5, #4
	bl sub_02032578
	ldr r1, [r5, #0x1a8]
	blx r1
_0202CE94:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202CE9C: .word 0x00000408
	arm_func_end UpdateCollectionMenu

	arm_func_start sub_0202CEA0
sub_0202CEA0: ; 0x0202CEA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x410
	mov r5, r0
	ldr r6, [r5, #0xc]
	add r0, r6, #4
	bl sub_02032568
	mov r7, r0
	add r0, r6, #4
	bl sub_02032594
	ldr r1, [r6, #0xfc]
	mov r8, r0
	tst r1, #0x200
	ldrne r0, [r6, #0x160]
	addne r4, r0, r7
	ldrsb r0, [r5, #0x10]
	moveq r4, #0
	bl sub_02027B1C
	mov sb, #0
	mov fp, #0x42
	b _0202D020
_0202CEF0:
	ldr r3, [r6, #0x198]
	add r0, sp, #0x10
	mov r1, r7
	add r2, sp, #0xc
	blx r3
	mov sl, r0
	cmp r4, #0
	mov r1, #0
	beq _0202CF24
	ldrb r0, [r4]
	add r4, r4, #1
	tst r0, #2
	movne r1, #1
_0202CF24:
	cmp sl, #0
	beq _0202CFF4
	cmp r1, #0
	add r0, r6, #4
	mov r1, sb
	beq _0202CF6C
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp, #4]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #8]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026428
	b _0202CF94
_0202CF6C:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r6, #0x1b4]
	mov r3, sl
	str r0, [sp]
	ldr r0, [r6, #0x1b8]
	str r0, [sp, #4]
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1bc]
	bl sub_02026358
_0202CF94:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0202D018
	ldr r1, [r6, #0x104]
	mov sl, #0xc
	cmp r1, #0
	ble _0202CFBC
	ldr r0, [r6, #0xfc]
	tst r0, #0x400
	subne sl, r1, #2
_0202CFBC:
	add r0, r6, #4
	mov r1, sb
	bl sub_020328D8
	str sl, [sp]
	mov r1, #0x24
	str r1, [sp, #4]
	mov r2, r0
	ldr sl, [r6, #0x1bc]
	ldr r3, [r6, #0x1c0]
	ldrsb r0, [r5, #0x10]
	sub r1, sl, #4
	sub r3, r3, sl
	bl sub_02025D90
	b _0202D018
_0202CFF4:
	ldrb r0, [r6, #0x1c8]
	cmp r0, #0
	beq _0202D018
	str sb, [r6, #0xc4]
	ldr r0, [r6, #0xc0]
	cmp r0, sb
	subge r0, sb, #1
	strge r0, [r6, #0xc0]
	b _0202D028
_0202D018:
	add sb, sb, #1
	add r7, r7, #1
_0202D020:
	cmp sb, r8
	blt _0202CEF0
_0202D028:
	ldr r4, [r6, #0x1a4]
	cmp r4, #0
	beq _0202D04C
	ldrsb r0, [r5, #0x10]
	mov r3, sb
	add r1, r6, #4
	sub r2, r7, sb
	blx r4
	b _0202D058
_0202D04C:
	ldrsb r1, [r5, #0x10]
	add r0, r6, #4
	bl sub_0202A03C
_0202D058:
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	add sp, sp, #0x410
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202CEA0

	arm_func_start sub_0202D068
sub_0202D068: ; 0x0202D068
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D068

	arm_func_start sub_0202D07C
sub_0202D07C: ; 0x0202D07C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	ldr r1, [r0, #0xfc]
	ands r2, r1, #0x10000000
	cmpne r4, #0
	beq _0202D0B0
	eor r1, r1, #0x10000000
	str r1, [r0, #0xfc]
	add r0, r0, #4
	mov r1, #0x10000000
	bl sub_02031C84
	ldmia sp!, {r4, pc}
_0202D0B0:
	cmp r2, #0
	cmpeq r4, #0
	ldmneia sp!, {r4, pc}
	ldr r2, [r0, #0xfc]
	mov r1, #0x10000000
	orr r2, r2, #0x10000000
	str r2, [r0, #0xfc]
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202D07C

	arm_func_start SetCollectionMenuField0x1B2
SetCollectionMenuField0x1B2: ; 0x0202D0D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1b2]
	ldmia sp!, {r4, pc}
	arm_func_end SetCollectionMenuField0x1B2

	arm_func_start sub_0202D0EC
sub_0202D0EC: ; 0x0202D0EC
	stmdb sp!, {r3, r4, r5, lr}
	bl GetWindowContents
	mov r5, r0
	add r0, r5, #4
	bl sub_02032558
	mov r4, r0
	add r0, r5, #4
	bl sub_02032568
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D0EC

	arm_func_start IsCollectionMenuState3
IsCollectionMenuState3: ; 0x0202D114
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1ac]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsCollectionMenuState3

	arm_func_start sub_0202D134
sub_0202D134: ; 0x0202D134
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1b0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1b1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1ac]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D134

	arm_func_start sub_0202D16C
sub_0202D16C: ; 0x0202D16C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	cmp r5, #0
	ldr r0, [r4, #0xfc]
	beq _0202D1BC
	tst r0, #0x10000000
	ldmeqia sp!, {r3, r4, r5, pc}
	bic r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C84
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C84
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
_0202D1BC:
	tst r0, #0x10000000
	ldmneia sp!, {r3, r4, r5, pc}
	orr r2, r0, #0x10000000
	add r0, r4, #4
	mov r1, #0x8000000
	str r2, [r4, #0xfc]
	bl sub_02031C74
	add r0, r4, #4
	mov r1, #0x10000000
	bl sub_02031C74
	mov r0, #1
	strb r0, [r4, #0x1c4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202D16C

	arm_func_start CreateOptionsMenu
CreateOptionsMenu: ; 0x0202D1F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x12c
	mov r5, r1
	orr r5, r5, #4
	mov r1, #0
	str r1, [sp, #8]
	tst r5, #0x8000
	mov sl, r3
	mov r4, r2
	mov r6, r0
	ldr r8, [sp, #0x154]
	orrne r5, r5, #0x20000
	mov r2, sl
	ldr r1, [sp, #8]
	b _0202D238
_0202D22C:
	add r1, r1, #1
	str r1, [sp, #8]
	add r2, r2, #0xc
_0202D238:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0202D22C
	ldr r1, [sp, #8]
	mov r0, #0x10c
	add r1, r1, #1
	mul r0, r1, r0
	mov r1, #8
	bl MemAlloc
	mov fp, r0
	mov r7, fp
	and sb, r5, #0x20
	b _0202D300
_0202D26C:
	mov r0, r7
	bl GetStringFromFileVeneer
	ldr r0, [sl, #8]
	str r0, [r7, #0x100]
	ldr r0, [sl, #8]
	cmp r0, #0
	beq _0202D2C4
	ldr r1, [r7, #0x100]
	mov r2, #0
	b _0202D298
_0202D294:
	add r2, r2, #1
_0202D298:
	ldrh r0, [r1], #2
	cmp r0, #0
	bne _0202D294
	ldr r0, [sl, #4]
	cmp r0, #0
	streq r2, [r7, #0x104]
	beq _0202D2CC
	cmp r0, r2
	movle r2, r0
	str r2, [r7, #0x104]
	b _0202D2CC
_0202D2C4:
	ldr r0, [sl, #4]
	str r0, [r7, #0x104]
_0202D2CC:
	cmp sb, #0
	beq _0202D2EC
	ldr r1, [r8]
	ldr r0, [r7, #0x104]
	cmp r1, r0
	movge r1, #0
	str r1, [r7, #0x108]
	b _0202D2F4
_0202D2EC:
	mov r0, #0
	str r0, [r7, #0x108]
_0202D2F4:
	add sl, sl, #0xc
	add r7, r7, #0x10c
	add r8, r8, #4
_0202D300:
	ldrh r1, [sl]
	cmp r1, #0
	bne _0202D26C
	mov r2, #0
	strb r2, [r7]
	str r2, [r7, #0x100]
	str r2, [r7, #0x104]
	mov r0, #0x1b8
	mov r1, #8
	str r2, [r7, #0x108]
	bl MemAlloc
	cmp r6, #0
	mov r7, r0
	addne sb, sp, #0x1c
	ldmneia r6, {r0, r1, r2, r3}
	stmneia sb, {r0, r1, r2, r3}
	ldrne r0, _0202D528 ; =UpdateOptionsMenu
	mov r8, fp
	strne r0, [sp, #0x1c]
	bne _0202D364
	ldr r0, _0202D52C ; =OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	add r6, sp, #0x1c
	ldmia r0, {r0, r1, r2, r3}
	stmia r6, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202D364:
	mov r6, #0
	mov sb, r6
	str r7, [sp, #0x28]
	b _0202D3CC
_0202D374:
	mov r0, r8
	bl sub_020265A8
	cmp r0, r6
	ldr sl, [r8, #0x100]
	movgt r6, r0
	cmp sl, #0
	beq _0202D3C0
	b _0202D3B0
_0202D394:
	ldrh r1, [sl], #2
	add r0, sp, #0x2c
	bl GetStringFromFileVeneer
	add r0, sp, #0x2c
	bl sub_020265A8
	cmp r0, sb
	movgt sb, r0
_0202D3B0:
	ldrh r0, [sl]
	cmp r0, #0
	bne _0202D394
	b _0202D3C8
_0202D3C0:
	cmp sb, #0x30
	movlt sb, #0x30
_0202D3C8:
	add r8, r8, #0x10c
_0202D3CC:
	mov r0, r8
	bl IsEmptyString
	cmp r0, #0
	beq _0202D374
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	bne _0202D400
	add r2, r6, sb
	mov r0, r5
	mov r1, r4
	add r2, r2, #0x34
	bl sub_02031A5C
	strb r0, [sp, #0x22]
_0202D400:
	str r6, [r7, #0x1a8]
	add r0, sb, #4
	str r0, [r7, #0x1ac]
	ldr r0, [r7, #0x1a8]
	add r2, sp, #8
	add r1, r0, #0x15
	str r1, [r7, #0x1b0]
	ldr r0, [r7, #0x1ac]
	add r3, sp, #0x150
	add r0, r1, r0
	add r0, r0, #0xe
	str r0, [r7, #0x1b4]
	ldr r0, [sp, #0x150]
	cmp r0, #0
	ldreq r0, [sp, #8]
	streq r0, [sp, #0x150]
	ldrb r0, [sp, #0x23]
	cmp r0, #0
	mov r0, r5
	bne _0202D460
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x23]
	b _0202D468
_0202D460:
	mov r1, r4
	bl CalcMenuHeightDiv8__02031AA4
_0202D468:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x20]
	ldrneb r0, [sp, #0x22]
	subne r0, r1, r0
	strneb r0, [sp, #0x20]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x21]
	ldrneb r0, [sp, #0x23]
	subne r0, r1, r0
	strneb r0, [sp, #0x21]
	ldr r0, _0202D528 ; =UpdateOptionsMenu
	cmp r4, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202D4C4
	add r8, r7, #0x100
	mov r6, #9
_0202D4AC:
	ldmia r4!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202D4AC
	ldmia r4, {r0, r1}
	stmia r8, {r0, r1}
_0202D4C4:
	ldr r0, [sp, #0x154]
	str fp, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
	add r0, sp, #0x1c
	mov r1, #3
	strb r2, [r7, #0x1a5]
	bl NewWindowScreenCheck
	add r1, sp, #0xc
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #8]
	add r3, sp, #0xc
	str r0, [sp]
	ldr r4, [sp, #0x150]
	mov r1, r5
	add r0, r7, #4
	add r2, r7, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x12c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202D528: .word UpdateOptionsMenu
_0202D52C: .word OPTIONS_MENU_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateOptionsMenu

	arm_func_start CloseOptionsMenu
CloseOptionsMenu: ; 0x0202D530
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseOptionsMenu

	arm_func_start IsOptionsMenuActive
IsOptionsMenuActive: ; 0x0202D55C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsOptionsMenuActive

	arm_func_start CheckOptionsMenuField0x1A4
CheckOptionsMenuField0x1A4: ; 0x0202D57C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckOptionsMenuField0x1A4

	arm_func_start sub_0202D59C
sub_0202D59C: ; 0x0202D59C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202D59C

	arm_func_start GetOptionsMenuStates
GetOptionsMenuStates: ; 0x0202D5B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	ldr r4, [r0, #0x198]
	b _0202D5D0
_0202D5C4:
	ldr r0, [r4, #0x108]
	add r4, r4, #0x10c
	str r0, [r5], #4
_0202D5D0:
	mov r0, r4
	bl IsEmptyString
	cmp r0, #0
	beq _0202D5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end GetOptionsMenuStates

	arm_func_start GetOptionsMenuResult
GetOptionsMenuResult: ; 0x0202D5E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202D610
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202D610:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetOptionsMenuResult

	arm_func_start UpdateOptionsMenu
UpdateOptionsMenu: ; 0x0202D618
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202DA5C
_0202D638: ; jump table
	b _0202D650 ; case 0
	b _0202D668 ; case 1
	b _0202D690 ; case 2
	b _0202D6E8 ; case 3
	b _0202D9EC ; case 4
	b _0202DA30 ; case 5
_0202D650:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202DA5C
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202D668:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202D690
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202D690:
	mov r0, r7
	bl sub_0202DA64
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202D6C8
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6C8:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202DA5C
_0202D6E8:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202D760
	ldr r3, [r4, #0x1b0]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D760
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r1, r6
	orr r2, r0, #0x40
	add r0, r4, #4
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D760:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7C0
	ldr r3, [r4, #0x1b4]
	add r1, sp, #0xc
	add r0, r3, #0xe
	str r0, [sp]
	mov r6, #0
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r6, r0
	bmi _0202D7C0
	mov r1, r6
	add r0, r4, #4
	bl sub_02032684
	ldr r1, [sp, #8]
	add r0, r4, #4
	orr r2, r1, #0x80
	add r1, r6, #0x3e8
	str r2, [sp, #8]
	bl sub_020320A8
	mov r5, #1
_0202D7C0:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202D7E0
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202D7E0:
	add r0, r4, #4
	bl sub_02032578
	ldr r2, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	mov r1, #0x10c
	mla r6, r0, r1, r3
	tst r2, #0x200
	ldrne r1, [r4, #0x160]
	ldrneb r0, [r1, r0]
	moveq r0, #0
	and r0, r0, #0xff
	tst r0, #1
	bne _0202D8E8
	ldr r0, [sp, #8]
	tst r0, #0x40
	beq _0202D878
	ldr r0, [r6, #0x108]
	cmp r0, #0
	add r0, r4, #4
	ble _0202D86C
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D85C
	subs r0, r0, #0xa
	str r0, [r6, #0x108]
	movmi r0, #0
	strmi r0, [r6, #0x108]
	b _0202D864
_0202D85C:
	sub r0, r0, #1
	str r0, [r6, #0x108]
_0202D864:
	mov r5, #1
	b _0202D900
_0202D86C:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D878:
	tst r0, #0x80
	beq _0202D900
	ldr r0, [r6, #0x104]
	ldr r1, [r6, #0x108]
	sub r0, r0, #1
	cmp r1, r0
	add r0, r4, #4
	bge _0202D8DC
	mov r1, #3
	bl PlayWindowInputSound
	ldr r0, [sp, #8]
	tst r0, #8
	ldr r0, [r6, #0x108]
	beq _0202D8CC
	add r1, r0, #0xa
	str r1, [r6, #0x108]
	ldr r0, [r6, #0x104]
	sub r0, r0, #1
	cmp r1, r0
	strgt r0, [r6, #0x108]
	b _0202D8D4
_0202D8CC:
	add r0, r0, #1
	str r0, [r6, #0x108]
_0202D8D4:
	mov r5, #1
	b _0202D900
_0202D8DC:
	mov r1, #2
	bl PlayWindowInputSound
	b _0202D900
_0202D8E8:
	ldr r0, [sp, #8]
	tst r0, #0xc0
	beq _0202D900
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202D900:
	cmp r5, #0
	beq _0202D910
	mov r0, r7
	bl sub_0202DA64
_0202D910:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [r4, #0x198]
	mov r0, #0x10c
	mla r0, r2, r0, r1
	ldr r1, [sp, #8]
	ldr r3, [r0, #0x108]
	add r0, r4, #4
	bl sub_020323F8
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202D9AC
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202D9DC
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202D96C
_0202D960:
	ldr r0, [r5, #0x108]
	add r5, r5, #0x10c
	str r0, [r6], #4
_0202D96C:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202D960
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202D9DC
_0202D9AC:
	tst r0, #2
	beq _0202D9DC
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202D9DC:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202DA5C
_0202D9EC:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202DA28
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202DA28
	mov r0, r7
	bl sub_0202DA64
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202DA5C
_0202DA28:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202DA30:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202DA5C
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202DA5C:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateOptionsMenu

	arm_func_start sub_0202DA64
sub_0202DA64: ; 0x0202DA64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x160
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r2, [r4, #0xfc]
	str r0, [sp, #0xc]
	tst r2, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne sb, r0, r5
	mov r1, #0x10c
	add r0, r4, #4
	mla r6, r5, r1, r3
	moveq sb, #0
	bl sub_020320C0
	mov fp, r0
	ldrsb r0, [sl, #0x10]
	bl sub_02027B1C
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _0202DC1C
	b _0202DC10
_0202DAD4:
	add r0, r4, #4
	mov r1, r7
	bl sub_020328D8
	mov r8, r0
	mov r0, #1
	cmp sb, #0
	mov r1, #0
	str r0, [sp, #8]
	beq _0202DB14
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
	tst r0, #1
	movne r0, #0
	strne r0, [sp, #8]
_0202DB14:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and r0, r0, #0xff
	str r0, [sp, #4]
	str r0, [sp]
	ldrsb r0, [sl, #0x10]
	mov r1, #0xd
	mov r2, r8
	mov r3, r6
	bl sub_020263C8
	ldr r2, [r6, #0x100]
	add r0, sp, #0x60
	cmp r2, #0
	ldr r1, [r6, #0x108]
	beq _0202DB64
	mov r1, r1, lsl #1
	ldrh r1, [r2, r1]
	bl GetStringFromFileVeneer
	b _0202DB80
_0202DB64:
	str r1, [sp, #0x34]
	add r1, sp, #0x10
	str r1, [sp]
	ldr r2, _0202DC38 ; =_0209AEE0
	ldr r3, _0202DC3C ; =0x0000C402
	mov r1, #0x100
	bl PreprocessString
_0202DB80:
	add r0, sp, #0x60
	bl sub_020265A8
	ldr r1, [sp, #4]
	mov ip, r0
	str r1, [sp]
	ldr r3, [r4, #0x1ac]
	ldr r1, [r4, #0x1b0]
	sub r3, r3, ip
	add r3, r3, r3, lsr #31
	add r1, r1, r3, asr #1
	ldrsb r0, [sl, #0x10]
	mov r2, r8
	add r1, r1, #0xe
	add r3, sp, #0x60
	bl sub_020263C8
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0202DC04
	cmp r5, fp
	ldreq r3, _0202DC40 ; =_0209AEEC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC44 ; =_0209AEF4
	ldr r1, [r4, #0x1b0]
	mov r2, r8
	bl DrawTextInWindow
	add r0, r5, #0x3e8
	cmp r0, fp
	ldreq r3, _0202DC48 ; =_0209AEFC
	ldrsb r0, [sl, #0x10]
	ldrne r3, _0202DC4C ; =_0209AF04
	ldr r1, [r4, #0x1b4]
	mov r2, r8
	bl DrawTextInWindow
_0202DC04:
	add r7, r7, #1
	add r5, r5, #1
	add r6, r6, #0x10c
_0202DC10:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0202DAD4
_0202DC1C:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x160
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DC38: .word _0209AEE0
_0202DC3C: .word 0x0000C402
_0202DC40: .word _0209AEEC
_0202DC44: .word _0209AEF4
_0202DC48: .word _0209AEFC
_0202DC4C: .word _0209AF04
	arm_func_end sub_0202DA64

	arm_func_start CreateDebugMenu
CreateDebugMenu: ; 0x0202DC50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov r7, r3
	mov r5, r1
	mov sl, r2
	mov r8, r0
	mov r1, r7
	mov r2, #0
	b _0202DC7C
_0202DC74:
	add r1, r1, #2
	add r2, r2, #1
_0202DC7C:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0202DC74
	add r0, r2, #1
	add r0, r0, r0, lsl #8
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	mov r6, r4
	b _0202DCB8
_0202DCA4:
	mov r0, r6
	bl GetStringFromFileVeneer
	add r0, r6, #1
	add r7, r7, #2
	add r6, r0, #0x100
_0202DCB8:
	ldrh r1, [r7]
	cmp r1, #0
	bne _0202DCA4
	mov r0, #0
	strb r0, [r6]
	ldr r2, [sp, #0x58]
	mov r0, #0x3b4
	mov r1, #8
	str r2, [sp, #0xc]
	bl MemAlloc
	mov r1, #0
	cmp r8, #0
	addne fp, sp, #0x10
	mov r7, r0
	str r1, [sp, #8]
	ldmneia r8, {r0, r1, r2, r3}
	stmneia fp, {r0, r1, r2, r3}
	ldrne r0, _0202DEE8 ; =UpdateDebugMenu
	mov sb, r4
	orr r5, r5, #4
	ldr r6, [sp, #0x5c]
	strne r0, [sp, #0x10]
	bne _0202DD28
	ldr r0, _0202DEEC ; =DEBUG_MENU_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x10
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r5, r5, #0x300000
_0202DD28:
	str r7, [sp, #0x1c]
	mov r8, #0
	b _0202DD4C
_0202DD34:
	mov r0, sb
	bl sub_020265A8
	cmp r0, r8
	movgt r8, r0
	add r0, sb, #1
	add sb, r0, #0x100
_0202DD4C:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD34
	ldrb r0, [sp, #0x16]
	cmp r0, #0
	bne _0202DD7C
	mov r0, r5
	mov r1, sl
	add r2, r8, #0x40
	bl sub_02031A5C
	strb r0, [sp, #0x16]
_0202DD7C:
	str r8, [r7, #0x1a8]
	mov sb, r4
	and r8, r5, #0x20
	mov fp, #0
	b _0202DDB8
_0202DD90:
	cmp r8, #0
	ldrneb r0, [r6]
	add r6, r6, #1
	strneb r0, [sb, #0x100]
	streqb fp, [sb, #0x100]
	ldr r1, [sp, #8]
	add r0, sb, #1
	add r1, r1, #1
	str r1, [sp, #8]
	add sb, r0, #0x100
_0202DDB8:
	mov r0, sb
	bl IsEmptyString
	cmp r0, #0
	beq _0202DD90
	ldrb r0, [sp, #0x17]
	add r2, sp, #8
	add r3, sp, #0xc
	cmp r0, #0
	mov r0, r5
	bne _0202DDF0
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x17]
	b _0202DDF8
_0202DDF0:
	mov r1, sl
	bl CalcMenuHeightDiv8__02031AA4
_0202DDF8:
	tst r5, #0x200000
	ldrneb r1, [sp, #0x14]
	ldrneb r0, [sp, #0x16]
	subne r0, r1, r0
	strneb r0, [sp, #0x14]
	tst r5, #0x100000
	ldrneb r1, [sp, #0x15]
	ldrneb r0, [sp, #0x17]
	subne r0, r1, r0
	strneb r0, [sp, #0x15]
	ldr r0, _0202DEE8 ; =UpdateDebugMenu
	cmp sl, #0
	str r0, [r7]
	str r5, [r7, #0xfc]
	beq _0202DE54
	add r8, r7, #0x100
	mov r6, #9
_0202DE3C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202DE3C
	ldmia sl, {r0, r1}
	stmia r8, {r0, r1}
_0202DE54:
	ldr r0, [sp, #0x5c]
	str r4, [r7, #0x198]
	str r0, [r7, #0x19c]
	mov r2, #0
	str r2, [r7, #0x1a0]
	strb r2, [r7, #0x1a4]
#ifdef JAPAN
	add r0, r7, #0x1ac
	mov r1, #0x3bc
#else
	ldr r1, _0202DEF0 ; =0x00003C65
	add r0, r7, #0x1ac
#endif
	strb r2, [r7, #0x1a5]
	bl GetStringFromFileVeneer
	ldr r1, _0202DEF4 ; =0x00003C66
	add r0, r7, #0x2ac
	bl GetStringFromFileVeneer
	add r0, r7, #0x1ac
	bl sub_020265A8
	str r0, [r7, #0x3ac]
	add r0, r7, #0x2ac
	bl sub_020265A8
	str r0, [r7, #0x3b0]
	add r0, sp, #0x10
	mov r1, #3
	bl NewWindowScreenCheck
	add r1, sp, #0x20
	mov r6, r0
	bl GetWindowRectangle
	ldr r2, [sp, #8]
	mov r1, r5
	str r2, [sp]
	ldr r4, [sp, #0xc]
	add r0, r7, #4
	add r2, r7, #0x100
	add r3, sp, #0x20
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202DEE8: .word UpdateDebugMenu
_0202DEEC: .word DEBUG_MENU_DEFAULT_WINDOW_PARAMS
#if defined(EUROPE)
_0202DEF0: .word 0x00003C67
_0202DEF4: .word 0x00003C68
#elif defined(JAPAN)
_0202DEF4: .word 0x000003BD
#else
_0202DEF0: .word 0x00003C65
_0202DEF4: .word 0x00003C66
#endif
	arm_func_end CreateDebugMenu

	arm_func_start CloseDebugMenu
CloseDebugMenu: ; 0x0202DEF8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #0x198]
	bl MemFree
	mov r0, r4
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseDebugMenu

	arm_func_start IsDebugMenuActive
IsDebugMenuActive: ; 0x0202DF24
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1a0]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsDebugMenuActive

	arm_func_start CheckDebugMenuField0x1A4
CheckDebugMenuField0x1A4: ; 0x0202DF44
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #0x1a4]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end CheckDebugMenuField0x1A4

	arm_func_start sub_0202DF64
sub_0202DF64: ; 0x0202DF64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a4]
	cmp r1, #0
	beq _0202DF90
	ldrb r0, [r0, #0x1a5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
_0202DF90:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202DF64

	arm_func_start UpdateDebugMenu
UpdateDebugMenu: ; 0x0202DF98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldr r4, [r7, #0xc]
	ldr r0, [r4, #0x1a0]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0202E294
_0202DFB8: ; jump table
	b _0202DFD0 ; case 0
	b _0202DFE8 ; case 1
	b _0202E010 ; case 2
	b _0202E068 ; case 3
	b _0202E224 ; case 4
	b _0202E268 ; case 5
_0202DFD0:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202E294
	mov r0, #2
	str r0, [r4, #0x1a0]
_0202DFE8:
	ldr r0, [r4, #0x1a0]
	cmp r0, #1
	bne _0202E010
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E010:
	mov r0, r7
	bl sub_0202E29C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0202E048
	mov r0, #7
	str r0, [r4, #0x1a0]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _0202E294
_0202E048:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _0202E294
_0202E068:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r5, r0
	cmp r1, #0
	bne _0202E0CC
	mov r3, #0
	add r1, sp, #0xc
	str r3, [sp]
	mov r6, #1
	add r0, r4, #4
	mov r2, #2
	str r6, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _0202E0CC
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r5, r6
	orr r0, r0, #0x2000
	str r0, [sp, #8]
_0202E0CC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0202E0EC
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r5, r5, r0
_0202E0EC:
	add r0, r4, #4
	bl sub_02032578
	ldr r1, [r4, #0xfc]
	ldr r3, [r4, #0x198]
	tst r1, #0x200
	ldrne r1, [r4, #0x160]
	add r2, r0, r0, lsl #8
	ldrneb r1, [r1, r0]
	ldr r0, [sp, #8]
	add r6, r3, r2
	moveq r1, #0
	and r1, r1, #0xff
	tst r0, #0x2200
	beq _0202E15C
	tst r1, #1
	add r0, r4, #4
	bne _0202E154
	mov r1, #3
	bl PlayWindowInputSound
	ldrb r0, [r6, #0x100]
	mov r5, #1
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r6, #0x100]
	b _0202E15C
_0202E154:
	mov r1, #2
	bl PlayWindowInputSound
_0202E15C:
	cmp r5, #0
	beq _0202E16C
	mov r0, r7
	bl sub_0202E29C
_0202E16C:
	ldr r0, [sp, #8]
	tst r0, #1
	beq _0202E1E4
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0202E214
	ldr r5, [r4, #0x198]
	ldr r6, [r4, #0x19c]
	b _0202E1A4
_0202E194:
	ldrb r1, [r5, #0x100]
	add r0, r5, #1
	add r5, r0, #0x100
	strb r1, [r6], #1
_0202E1A4:
	mov r0, r5
	bl IsEmptyString
	cmp r0, #0
	beq _0202E194
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
	b _0202E214
_0202E1E4:
	tst r0, #2
	beq _0202E214
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a4]
	strb r0, [r4, #0x1a5]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1a0]
_0202E214:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _0202E294
_0202E224:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	bne _0202E260
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _0202E260
	mov r0, r7
	bl sub_0202E29C
	mov r0, #7
	str r0, [r4, #0x1a0]
	b _0202E294
_0202E260:
	mov r0, #5
	str r0, [r4, #0x1a0]
_0202E268:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _0202E294
	ldrb r0, [r4, #0x1a5]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1a0]
_0202E294:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end UpdateDebugMenu

	arm_func_start sub_0202E29C
sub_0202E29C: ; 0x0202E29C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r7, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r5, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	ldr r3, [r4, #0x198]
	addne r8, r0, r7
	add r2, r7, r7, lsl #8
	ldrsb r0, [sl, #0x10]
	add r6, r3, r2
	moveq r8, #0
	bl sub_02027B1C
	cmp r5, #0
	mov r7, #0
	ble _0202E3B0
	add r0, r4, #0x1ac
	str r0, [sp, #8]
	b _0202E3A8
_0202E304:
	add r0, r4, #4
	mov r1, r7
	bl sub_020328D8
	str r0, [sp, #4]
	ldrb r0, [r6, #0x100]
	mov r1, #0
	cmp r0, #0
	movne sb, #1
	moveq sb, #0
	cmp r8, #0
	beq _0202E340
	ldrb r0, [r8]
	add r8, r8, #1
	tst r0, #2
	movne r1, #1
_0202E340:
	cmp r1, #0
	movne r0, #0x42
	moveq r0, #0x44
	and fp, r0, #0xff
	str fp, [sp]
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	mov r1, #0xd
	mov r3, r6
	bl sub_020263C8
	str fp, [sp]
	add r3, r4, sb, lsl #2
	ldr fp, [r3, #0x3ac]
	ldr r3, [sp, #8]
	ldr r1, [r4, #0x1a8]
	add r3, r3, sb, lsl #8
	rsb sb, fp, #0x30
	ldrsb r0, [sl, #0x10]
	ldr r2, [sp, #4]
	add r1, r1, #0xd
	add sb, sb, sb, lsr #31
	add r1, r1, sb, asr #1
	bl sub_020263C8
	add r0, r6, #1
	add r7, r7, #1
	add r6, r0, #0x100
_0202E3A8:
	cmp r7, r5
	blt _0202E304
_0202E3B0:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0202E29C

	arm_func_start CreateScrollBoxSingle
CreateScrollBoxSingle: ; 0x0202E3CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	mov r7, r1
	ldr r0, _0202E508 ; =0x00001D6C
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	cmp r8, #0
	ldreq r0, _0202E50C ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E510 ; =UpdateScrollBox
	ldr r1, _0202E510 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E514 ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, r7, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r6, #0
	beq _0202E45C
	add ip, r4, #0x100
	mov r7, #9
_0202E444:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _0202E444
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_0202E45C:
	ldr r7, [sp, #0x28]
	add r0, r4, #0x100
	strh r5, [r0, #0xa0]
	cmp r7, #0
	beq _0202E48C
	add r6, r4, #0x1a8
	mov r5, #5
_0202E478:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E478
	b _0202E494
_0202E48C:
	add r0, r4, #0x1a8
	bl InitPreprocessorArgs
_0202E494:
	mov r0, #1
	ldr r7, [sp, #0x30]
	ldrh r1, [sp, #0x2c]
	str r0, [r4, #0x198]
	mov r0, #0
	str r0, [r4, #0x19c]
	add r0, r4, #0x200
	strh r1, [r0, #0xe8]
	cmp r7, #0
	beq _0202E4D8
	add r6, r4, #0x2f0
	mov r5, #5
_0202E4C4:
	ldmia r7!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E4C4
	b _0202E4E0
_0202E4D8:
	add r0, r4, #0x2f0
	bl InitPreprocessorArgs
_0202E4E0:
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202E508: .word 0x00001D6C
_0202E50C: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E510: .word UpdateScrollBox
_0202E514: .word 0x0D0C8012
	arm_func_end CreateScrollBoxSingle

	arm_func_start CreateScrollBoxMulti
CreateScrollBoxMulti: ; 0x0202E518
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov r6, r0
	mov r5, r2
	ldr r2, [sp, #0x44]
	mov sl, r1
	ldr r0, _0202E6A0 ; =0x00001D6C
	mov r1, #8
	mov sb, r3
	ldr r8, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	ldr fp, [sp, #0x40]
	str r2, [sp, #0x44]
	bl MemAlloc
	cmp r6, #0
	mov r4, r0
	ldreq r0, _0202E6A4 ; =SCROLL_BOX_DEFAULT_WINDOW_PARAMS
	addeq r6, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r6, {r0, r1, r2, r3}
	addne ip, sp, #0
	ldmneia r6, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _0202E6A8 ; =UpdateScrollBox
	ldr r1, _0202E6A8 ; =UpdateScrollBox
	strne r0, [sp]
	ldr r0, _0202E6AC ; =0x0D0C8012
	str r4, [sp, #0xc]
	orr r0, sl, r0
	str r1, [r4]
	bic r0, r0, #1
	str r0, [r4, #0xfc]
	cmp r5, #0
	beq _0202E5C0
	add sl, r4, #0x100
	mov r6, #9
_0202E5A8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202E5A8
	ldmia r5, {r0, r1}
	stmia sl, {r0, r1}
_0202E5C0:
	str sb, [r4, #0x198]
	mov r6, #0
	str r6, [r4, #0x19c]
	b _0202E670
_0202E5D0:
	mov r0, #0x50
	mul r5, r6, r0
	mov r1, r6, lsl #1
	add r0, r4, r6, lsl #1
	ldrh r1, [r8, r1]
	add r0, r0, #0x100
	adds sl, r7, r5
	strh r1, [r0, #0xa0]
	beq _0202E614
	add r0, r4, r5
	add lr, r0, #0x1a8
	mov ip, #5
_0202E600:
	ldmia sl!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0202E600
	b _0202E620
_0202E614:
	add r0, r4, #0x1a8
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E620:
	mov r0, r6, lsl #1
	ldrh r1, [fp, r0]
	add r0, r4, r6, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0xe8]
	ldr r0, [sp, #0x44]
	adds sl, r0, r5
	beq _0202E660
	add r0, r4, r5
	add ip, r0, #0x2f0
	mov r5, #5
_0202E64C:
	ldmia sl!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202E64C
	b _0202E66C
_0202E660:
	add r0, r4, #0x2f0
	add r0, r0, r5
	bl InitPreprocessorArgs
_0202E66C:
	add r6, r6, #1
_0202E670:
	cmp r6, sb
	blt _0202E5D0
	mov r3, #0
	str r3, [r4, #0x430]
	add r2, r4, #0x1000
	str r3, [r2, #0x464]
	add r0, sp, #0
	mov r1, #3
	strb r3, [r2, #0x468]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202E6A0: .word 0x00001D6C
_0202E6A4: .word SCROLL_BOX_DEFAULT_WINDOW_PARAMS
_0202E6A8: .word UpdateScrollBox
_0202E6AC: .word 0x0D0C8012
	arm_func_end CreateScrollBoxMulti

	arm_func_start SetScrollBoxState7
SetScrollBoxState7: ; 0x0202E6B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
	ldmia sp!, {r3, pc}
	arm_func_end SetScrollBoxState7

	arm_func_start CloseScrollBox
CloseScrollBox: ; 0x0202E6C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseScrollBox

	arm_func_start IsScrollBoxActive
IsScrollBoxActive: ; 0x0202E6E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #8
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsScrollBoxActive

	arm_func_start UpdateScrollBox
UpdateScrollBox: ; 0x0202E708
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	mov r4, r0
	ldr r5, [r4, #0xc]
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0202EE74
_0202E72C: ; jump table
	b _0202E74C ; case 0
	b _0202E768 ; case 1
	b _0202E768 ; case 2
	b _0202E768 ; case 3
	b _0202E998 ; case 4
	b _0202E9C0 ; case 5
	b _0202EE38 ; case 6
	b _0202EE54 ; case 7
_0202E74C:
	ldrsb r0, [r4, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _0202EE74
	add r0, r5, #0x1000
	mov r1, #1
	str r1, [r0, #0x464]
_0202E768:
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #1
	beq _0202E788
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
_0202E788:
	add r0, r5, #0x34
	ldr r2, [r5, #0x430]
	ldr r1, _0202EE7C ; =0x0000040C
	add r0, r0, #0x400
	add r3, r5, #0x16c
	mla r6, r2, r1, r0
	cmp r2, #0
	add r7, r3, #0x1800
	mov r8, #0
	bne _0202E850
	ldr sl, [r5, #0x19c]
	add r0, r5, sl, lsl #1
	add r0, r0, #0x100
	ldrh r2, [r0, #0xa0]
	cmp r2, #0
	addeq r0, r5, #0x1000
	streqb r8, [r0, #0x56c]
	beq _0202E7F0
	add r1, r5, #0x1a8
	mov r0, #0x50
	mla sb, sl, r0, r1
	mov r1, #0x400
	add r0, r3, #0x1400
	add r3, r1, #4
	str sb, [sp]
	bl PreprocessStringFromId
_0202E7F0:
	ldr r2, [r5, #0x19c]
	mov r0, #0x50
	mla r1, r2, r0, r5
	add r0, r5, #0x6c
	add fp, r1, #0x2f0
	add sl, r0, #0x1400
	mov sb, #5
_0202E80C:
	ldmia fp!, {r0, r1, r2, r3}
	stmia sl!, {r0, r1, r2, r3}
	subs sb, sb, #1
	bne _0202E80C
	ldr r0, [r5, #0x19c]
	add r1, r5, #0x1000
	add r0, r5, r0, lsl #1
	add r0, r0, #0x200
	ldrh r0, [r0, #0xe8]
	strh r0, [r6]
	ldr r0, [r1, #0x464]
	cmp r0, #1
	moveq r0, #0
	streq r0, [r6, #4]
	subeq r0, r0, #1
	streq r0, [r6, #8]
	b _0202E85C
_0202E850:
	add r0, r3, #0x1400
	add r1, r6, #0xc
	bl strcpy
_0202E85C:
	ldr r0, [r5, #0xfc]
	ldr r1, _0202EE80 ; =0x000001AF
	orr r0, r0, #0x800
	str r0, [r5, #0xfc]
	add r0, r5, #0x100
	strh r1, [r0, #8]
	mov r0, #0x10
	add r3, r5, #0x16c
	str r0, [r5, #0x10c]
	add r0, r3, #0x1400
	str r0, [r5, #0x148]
	ldrh sb, [r6]
	add r0, r5, #0x1000
	add r2, r5, #0x6c
	str sb, [r0, #0x4a0]
	add r0, r2, #0x1400
	str r0, [sp]
	ldrh r2, [r6]
	mov r1, #0x400
	add r0, r3, #0x1800
	add r3, r1, #4
	bl PreprocessStringFromId
	add r0, r5, #0xc4
	add sb, r0, #0x1400
	b _0202E8E0
_0202E8C0:
	add r0, r5, r8, lsl #2
	add r2, r0, #0x1000
	add r1, sb, r8, lsl #2
	mov r0, r7
	str r7, [r2, #0x4e4]
	add r8, r8, #1
	bl sub_02021F44
	mov r7, r0
_0202E8E0:
	cmp r7, #0
	bne _0202E8C0
	add r0, r5, #0x1000
	str r8, [r0, #0x4bc]
	ldr r1, [r0, #0x464]
	cmp r1, #3
	ldreq r1, [r6, #4]
	movne r1, #0
	str r1, [r0, #0x4c0]
	ldr r1, [r5, #0xfc]
	add r0, r5, #0x1000
	orr r1, r1, #8
	str r1, [r5, #0xfc]
	ldr r0, [r0, #0x4bc]
	add r1, sp, #0x38
	cmp r0, #1
	ldrle r0, [r5, #0xfc]
	eorle r0, r0, #8
	strle r0, [r5, #0xfc]
	ldrsb r0, [r4, #0x10]
	bl GetWindowRectangle
	ldr r0, [r5, #0x430]
	add r3, sp, #0x38
	cmp r0, #0
	mov r0, #1
	bne _0202E974
	ldr r1, [r5, #0x198]
	add r2, r5, #0x100
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	bl InitWindowInput
	ldr r1, [r5, #0x19c]
	add r0, r5, #4
	bl sub_02032684
	b _0202E98C
_0202E974:
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [r5, #0xfc]
	add r0, r5, #4
	add r2, r5, #0x100
	bl InitWindowInput
_0202E98C:
	add r0, r5, #0x1000
	mov r1, #4
	str r1, [r0, #0x464]
_0202E998:
	mov r0, r4
	bl sub_0202EE88
	mov r1, #0
	add r0, r5, #0x1000
	mov r2, #5
	str r2, [r0, #0x464]
	strb r1, [r0, #0x468]
	sub r0, r1, #1
	str r0, [r4, #0xb8]
	b _0202EE74
_0202E9C0:
	add r0, r5, #0x34
	add r8, r0, #0x400
	ldr r7, [r5, #0x430]
	ldr r6, _0202EE7C ; =0x0000040C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	mov r3, #1
	mla r6, r7, r6, r8
	bl sub_02031C98
	mov r7, r0
	add r0, r5, #4
	bl sub_02032560
	mov fp, r0
	add r2, r5, #0x1000
	mov r0, #0
	mov r1, #0x13
	ldr r8, [r2, #0x4c0]
	bl sub_02031914
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	mov sb, r0
	cmp r1, #1
	ble _0202EA70
	tst sb, #0x10
	beq _0202EA48
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	subs r8, r8, #1
	addmi r0, r5, #0x1000
	ldrmi r0, [r0, #0x4bc]
	submi r8, r0, #1
	b _0202EA70
_0202EA48:
	tst sb, #0x20
	beq _0202EA70
	add r0, r5, #4
	mov r1, #4
	bl PlayWindowInputSound
	add r0, r5, #0x1000
	ldr r0, [r0, #0x4bc]
	add r8, r8, #1
	cmp r8, r0
	movge r8, #0
_0202EA70:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202EA98
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202EB54
_0202EA98:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	beq _0202EAC0
	str r8, [r0, #0x4c0]
	str r8, [r6, #4]
	mvn r0, #0
	str r0, [r6, #8]
	mov r7, #1
	b _0202EB54
_0202EAC0:
	ldr r2, [r0, #0x504]
	cmp r2, #0
	ble _0202EB54
	ldr r0, [sp, #0x14]
	tst r0, #0x2000
	beq _0202EB10
	ldr r0, [r6, #8]
	cmp r0, #0
	sublt r0, r2, #1
	strlt r0, [r6, #8]
	blt _0202EAFC
	mvneq r0, #0
	streq r0, [r6, #8]
	subne r0, r0, #1
	strne r0, [r6, #8]
_0202EAFC:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
	b _0202EB54
_0202EB10:
	tst r0, #0x1000
	beq _0202EB54
	ldr r1, [r6, #8]
	cmp r1, #0
	movlt r0, #0
	strlt r0, [r6, #8]
	blt _0202EB44
	sub r0, r2, #1
	cmp r1, r0
	mvnge r0, #0
	strge r0, [r6, #8]
	addlt r0, r1, #1
	strlt r0, [r6, #8]
_0202EB44:
	add r0, r5, #4
	mov r1, #3
	bl PlayWindowInputSound
	mov r7, #1
_0202EB54:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0202ECC4
	ldrsb r0, [r4, #0x10]
	mvn r2, #0
	add r1, sp, #0x28
	str r2, [sp, #8]
	bl GetWindowRectangle
	add r0, r5, #0x108
	add r0, r0, #0x1400
	str r0, [sp, #0xc]
	add r0, r5, #0x1000
	mov sl, #0
	str r0, [sp, #0x10]
	b _0202EC08
_0202EB90:
	ldr r0, [sp, #0xc]
	mov r1, #0x18
	mla r2, sl, r1, r0
	ldr r1, [sp, #0x28]
	ldr r0, [r2, #8]
	ldr r3, [sp, #0x30]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr ip, [r2, #0x10]
	add r0, sp, #0x48
	add r1, ip, r1
	str r1, [sp, #0x1c]
	ldr ip, [r2, #4]
	ldr r1, _0202EE84 ; =0x00000408
	add ip, ip, r3
	str ip, [sp, #0x20]
	ldr ip, [r2, #0xc]
	add r2, sp, #0x18
	add r3, ip, r3
	str r3, [sp, #0x24]
	bl sub_02006C8C
	cmp r0, #0
	beq _0202EC04
	add r0, r5, #4
	mov r1, #0
	str sl, [sp, #8]
	bl sub_020320EC
	mov r7, #1
	b _0202EC18
_0202EC04:
	add sl, sl, #1
_0202EC08:
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x504]
	cmp sl, r0
	blt _0202EB90
_0202EC18:
	ldr r0, [sp, #8]
	cmp r0, #0
	strge sl, [r6, #8]
	orrge sb, sb, #1
	bge _0202EC7C
	add r1, sp, #0x14
	add r2, sp, #0x48
	add r0, r5, #4
	bl sub_02033758
	add r1, r5, #0x1000
	ldr r1, [r1, #0x4bc]
	orr r7, r7, r0
	cmp r1, #1
	ble _0202EC7C
	ldr r0, [sp, #0x14]
	tst r0, #0x40000
	beq _0202EC68
	subs r8, r8, #1
	submi r8, r1, #1
	b _0202EC7C
_0202EC68:
	tst r0, #0x80000
	beq _0202EC7C
	add r8, r8, #1
	cmp r8, r1
	movge r8, #0
_0202EC7C:
	ldr r0, [r5, #0x430]
	cmp r0, #0
	bne _0202ECA4
	ldr r0, [r5, #0x19c]
	cmp r0, fp
	strne fp, [r5, #0x19c]
	addne r0, r5, #0x1000
	movne r1, #1
	strne r1, [r0, #0x464]
	bne _0202ECC4
_0202ECA4:
	add r0, r5, #0x1000
	ldr r1, [r0, #0x4c0]
	cmp r1, r8
	strne r8, [r0, #0x4c0]
	strne r8, [r6, #4]
	mvnne r0, #0
	strne r0, [r6, #8]
	movne r7, #1
_0202ECC4:
	cmp r7, #0
	beq _0202ECD4
	mov r0, r4
	bl sub_0202EE88
_0202ECD4:
#ifdef JAPAN
	ldr r0, [r6, #8]
	cmp r0, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r1, r5, #0x108
	add r2, r1, #0x1400
	mov r1, #0x18
	mla r7, r0, r1, r2
	ldr sb, [r5, #0x430]
	mov r8, #0
	ldr r1, _0202EE7C ; =0x0000040C
	b _0202F078
_0202F05C:
	mla r2, r8, r1, r5
	add r2, r2, #0x400
	ldrh r3, [r7, #2]
	ldrh r2, [r2, #0x34]
	cmp r3, r2
	beq _0202F080
	add r8, r8, #1
_0202F078:
	cmp r8, sb
	blt _0202F05C
_0202F080:
	cmp sb, #3
	bge _0202EDBC
	ldrh r1, [r7, #2]
	cmp r1, #0
	addne r0, r5, r0
#else
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
	bne _0202EE28
	ldr r1, [r6, #8]
	mov r0, #0
	mov r7, r0
	cmp r1, #0
	blt _0202EDC8
	tst sb, #1
	beq _0202EDC8
	add r2, r5, #0x108
	add r3, r2, #0x1400
	mov r2, #0x18
	mla r8, r1, r2, r3
	ldr sl, [r5, #0x430]
	mov r7, #1
	ldr r2, _0202EE7C ; =0x0000040C
	b _0202ED3C
_0202ED20:
	mla r3, r0, r2, r5
	add r3, r3, #0x400
	ldrh sb, [r8, #2]
	ldrh r3, [r3, #0x34]
	cmp sb, r3
	beq _0202ED44
	add r0, r0, #1
_0202ED3C:
	cmp r0, sl
	blt _0202ED20
_0202ED44:
	cmp sl, #3
	bge _0202EDBC
	ldrh r0, [r8, #2]
	cmp r0, #0
	addne r0, r5, r1
#endif
	addne r0, r0, #0x1000
	ldrneb r0, [r0, #0x568]
	cmpne r0, #0
	beq _0202EDBC
	add r0, r5, #4
	mov r1, #0
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	add r2, r6, #0x18
	add r0, r0, #1
	str r0, [r5, #0x430]
	mov r3, #0
#ifdef JAPAN
	ldrh r8, [r7, #2]
	add r0, r6, #0x400
	mov r1, r7
	strh r8, [r0, #0xc]
#else
	ldrh sb, [r8, #2]
	add r0, r6, #0x400
	mov r1, r8
	strh sb, [r0, #0xc]
#endif
	str r3, [r6, #0x410]
	sub r3, r3, #1
	add r0, r2, #0x400
	str r3, [r6, #0x414]
	bl sub_0202202C
	add r0, r5, #0x1000
	mov r1, #2
	str r1, [r0, #0x464]
	b _0202EDC8
_0202EDBC:
	add r0, r5, #4
	mov r1, #2
	bl PlayWindowInputSound
_0202EDC8:
#ifdef JAPAN
	add r0, r5, #0x1000
	ldr r0, [r0, #0x464]
	cmp r0, #5
#else
	cmp r7, #0
#endif
	bne _0202EE28
	ldr r0, [sp, #0x14]
	tst r0, #2
	beq _0202EE28
	add r0, r5, #4
	mov r1, #1
	bl PlayWindowInputSound
	ldr r0, [r5, #0x430]
	cmp r0, #0
	ble _0202EE0C
	sub r0, r0, #1
	str r0, [r5, #0x430]
	add r0, r5, #0x1000
	mov r1, #3
	str r1, [r0, #0x464]
	b _0202EE28
_0202EE0C:
	mov r1, #1
	add r0, r5, #0x1000
	strb r1, [r0, #0x468]
	sub r1, r1, #6
	str r1, [r4, #0xb8]
	mov r1, #6
	str r1, [r0, #0x464]
_0202EE28:
	ldrsb r0, [r4, #0x10]
	add r1, r5, #4
	bl sub_02028948
	b _0202EE74
_0202EE38:
	add r0, r5, #4
	bl sub_02032070
	cmp r0, #0
	bne _0202EE74
	add r0, r5, #0x1000
	mov r1, #7
	str r1, [r0, #0x464]
_0202EE54:
	ldrsb r0, [r4, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r4, #0xb8]
	addne r0, r5, #0x1000
	movne r1, #8
	strne r1, [r0, #0x464]
_0202EE74:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202EE7C: .word 0x0000040C
#ifdef JAPAN
_0202EE80: .word 0x000003B7
#else
_0202EE80: .word 0x000001AF
#endif
_0202EE84: .word 0x00000408
	arm_func_end UpdateScrollBox

	arm_func_start sub_0202EE88
sub_0202EE88: ; 0x0202EE88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x124
	mov sl, r0
	ldr r5, [sl, #0xc]
	ldrsb r0, [sl, #0x10]
	add r1, r5, #0x34
	ldr r4, [r5, #0x430]
	ldr r2, _0202F0A4 ; =0x0000040C
	add r1, r1, #0x400
	add r3, r5, #0x1000
	mla r6, r4, r2, r1
	ldr r4, [r3, #0x4c0]
	bl sub_02027B1C
	ldrsb r1, [sl, #0x10]
	add r0, sp, #8
	bl sub_02025E84
	add r0, r5, #4
	mov r1, #0
	bl sub_020328D8
	mov r2, r0
	add r0, sp, #8
	mov r1, #4
	bl sub_0202614C
	add r0, r5, r4, lsl #2
	add r0, r0, #0x1000
	ldr r2, [r0, #0x4e4]
	ldr r1, _0202F0A8 ; =0x0000C406
	add r0, sp, #8
	bl sub_02026194
	add r0, sp, #8
	bl sub_02026204
	add r1, r5, #0x108
	add r0, sp, #8
	add r1, r1, #0x1400
	bl sub_020261F4
	add r1, r5, #0x1000
	str r0, [r1, #0x504]
	ldr r0, [r5, #0x430]
	cmp r0, #3
	bge _0202EFA0
	mov r8, #0
	mov r0, #1
	mov lr, r8
	ldr sb, _0202F0A4 ; =0x0000040C
	mov ip, #0x18
	b _0202EF90
_0202EF40:
	mla r2, r8, ip, r5
	add r3, r2, #0x1500
	mov r4, r0
	mov r2, lr
	ldrh r3, [r3, #0xa]
	ldr r7, [r5, #0x430]
	b _0202EF78
_0202EF5C:
	mla fp, r2, sb, r5
	add fp, fp, #0x400
	ldrh fp, [fp, #0x34]
	cmp r3, fp
	moveq r4, #0
	beq _0202EF80
	add r2, r2, #1
_0202EF78:
	cmp r2, r7
	blt _0202EF5C
_0202EF80:
	add r2, r5, r8
	add r2, r2, #0x1000
	strb r4, [r2, #0x568]
	add r8, r8, #1
_0202EF90:
	ldr r3, [r1, #0x504]
	cmp r8, r3
	blt _0202EF40
	b _0202EFC8
_0202EFA0:
	mov r4, #0
	mov r2, r4
	b _0202EFBC
_0202EFAC:
	add r0, r5, r4
	add r0, r0, #0x1000
	strb r2, [r0, #0x568]
	add r4, r4, #1
_0202EFBC:
	ldr r3, [r1, #0x504]
	cmp r4, r3
	blt _0202EFAC
_0202EFC8:
	add r0, r5, #0x108
	cmp r3, #0
	add r7, r0, #0x1400
	mov r8, #0
	ble _0202F088
	add r4, r5, #0x1000
	mov fp, #0x2e
	b _0202F07C
_0202EFE8:
	add r0, r5, r8
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x568]
	ldrsb r1, [sl, #0x10]
	cmp r0, #0
	movne sb, #0x4c
	add r0, sp, #8
	moveq sb, #0x57
	bl sub_02025E84
	add r0, sp, #8
	ldmib r7, {r1, r2}
	bl sub_0202614C
	ldr r1, _0202F0AC ; =0x0000C506
	ldr r2, [r7, #0x14]
	add r0, sp, #8
	bl sub_02026194
	mov r1, sb
	add r0, sp, #8
	bl sub_02026174
	add r0, sp, #8
	bl sub_02026204
	ldr r0, [r6, #8]
	cmp r0, r8
	bne _0202F074
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0202F074
	sub r3, r0, r1
	ldr r2, [r7, #8]
	ldr r0, [r7, #0x10]
	sub r0, r0, r2
	stmia sp, {r0, fp}
	ldrsb r0, [sl, #0x10]
	bl sub_02025D90
_0202F074:
	add r8, r8, #1
	add r7, r7, #0x18
_0202F07C:
	ldr r0, [r4, #0x504]
	cmp r8, r0
	blt _0202EFE8
_0202F088:
	ldrsb r1, [sl, #0x10]
	add r0, r5, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0x124
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0202F0A4: .word 0x0000040C
_0202F0A8: .word 0x0000C406
_0202F0AC: .word 0x0000C506
	arm_func_end sub_0202EE88

	arm_func_start CreateDialogueBox
CreateDialogueBox: ; 0x0202F0B0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r0, _0202F13C ; =0x00000528
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r6, #0
	ldreq r0, _0202F140 ; =DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
	add r5, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r5, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r5, {r0, r1, r2, r3}
	ldrne r0, _0202F144 ; =UpdateDialogueBox
	ldr r1, _0202F144 ; =UpdateDialogueBox
	strne r0, [sp]
	str r4, [sp, #0xc]
	str r1, [r4]
	mov r2, #1
	add r0, sp, #0
	mov r1, #3
	strb r2, [r4, #0xa]
	bl NewWindowScreenCheck
	mov r5, r0
	mov r1, r5
	add r0, r4, #0xc
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	strb r1, [r4, #8]
	mov r0, r5
	strb r1, [r4, #9]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0202F13C: .word 0x00000528
_0202F140: .word DIALOGUE_BOX_DEFAULT_WINDOW_PARAMS
_0202F144: .word UpdateDialogueBox
	arm_func_end CreateDialogueBox

	arm_func_start CloseDialogueBox
CloseDialogueBox: ; 0x0202F148
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseDialogueBox

	arm_func_start sub_0202F16C
sub_0202F16C: ; 0x0202F16C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #0xc
	bl sub_020261D4
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F16C

	arm_func_start IsDialogueBoxActive
IsDialogueBoxActive: ; 0x0202F180
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r0, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end IsDialogueBoxActive

	arm_func_start sub_0202F190
sub_0202F190: ; 0x0202F190
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r5
	mov r2, r4
	add r0, r0, #0xc
	bl sub_02026184
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0202F190

	arm_func_start ShowStringIdInDialogueBox
ShowStringIdInDialogueBox: ; 0x0202F1B4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F1EC
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F200
_0202F1EC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F200
	add r0, r4, #0x128
	bl sub_02048240
_0202F200:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessStringFromId
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringIdInDialogueBox

	arm_func_start ShowStringInDialogueBox
ShowStringInDialogueBox: ; 0x0202F23C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0202F274
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
	b _0202F288
_0202F274:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0202F288
	add r0, r4, #0x128
	bl sub_02048240
_0202F288:
	mov r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xa]
	mov r2, r6
	mov r3, r7
	strb r0, [r4, #9]
	add r0, r4, #0x128
	mov r1, #0x400
	str r5, [sp]
	bl PreprocessString
	mov r1, r7
	add r0, r4, #0xc
	add r2, r4, #0x128
	bl sub_02026194
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ShowStringInDialogueBox

	arm_func_start sub_0202F2C4
sub_0202F2C4: ; 0x0202F2C4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F31C
_0202F2E0: ; jump table
	b _0202F31C ; case 0
	b _0202F2F4 ; case 1
	b _0202F308 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F2F4:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F308:
	add r0, r4, #0xc
	bl sub_020261A4
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F31C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F2C4

	arm_func_start sub_0202F334
sub_0202F334: ; 0x0202F334
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F38C
_0202F350: ; jump table
	b _0202F38C ; case 0
	b _0202F364 ; case 1
	b _0202F378 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F364:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F378:
	mov r0, #3
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_0202F38C:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F334

	arm_func_start ShowDialogueBox
ShowDialogueBox: ; 0x0202F3A4
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F3E0
_0202F3C0: ; jump table
	b _0202F3E0 ; case 0
	b _0202F3D4 ; case 1
	b _0202F3D4 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F3D4:
	add r0, r4, #0xc
	bl sub_020261C4
	ldmia sp!, {r4, pc}
_0202F3E0:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end ShowDialogueBox

	arm_func_start sub_0202F3F8
sub_0202F3F8: ; 0x0202F3F8
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0202F434
_0202F414: ; jump table
	b _0202F434 ; case 0
	b _0202F428 ; case 1
	b _0202F428 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	ldmia sp!, {r4, pc} ; case 4
_0202F428:
	add r0, r4, #0xc
	bl sub_020261B4
	ldmia sp!, {r4, pc}
_0202F434:
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F3F8

	arm_func_start ReadStringFromDialogueBox
ReadStringFromDialogueBox: ; 0x0202F44C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl GetWindowContents
	mov r1, r0
	mov r0, r5
	mov r2, r4
	add r1, r1, #0x128
	bl MemcpySimple
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ReadStringFromDialogueBox

	arm_func_start sub_0202F474
sub_0202F474: ; 0x0202F474
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xa]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0202F474

	arm_func_start UpdateDialogueBox
UpdateDialogueBox: ; 0x0202F488
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F4A4: ; jump table
	b _0202F4B8 ; case 0
	b _0202F4E4 ; case 1
	b _0202F504 ; case 2
	b _0202F568 ; case 3
	b _0202F57C ; case 4
_0202F4B8:
	add r0, r4, #0xc
	bl sub_020261D4
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F4E4:
	mov r0, #1
	strb r0, [r4, #8]
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F504:
	add r0, r4, #0xc
	bl sub_02026204
	cmp r0, #0x10
	moveq r0, #3
	streq r0, [r4, #4]
	moveq r0, #1
	streqb r0, [r4, #8]
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r5, [r4, #8]
	add r0, r4, #0xc
	bl sub_020261E4
	strb r0, [r4, #8]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #8]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x128
	bl sub_02048240
	mov r0, #0
	strb r0, [r4, #9]
	ldmia sp!, {r3, r4, r5, pc}
_0202F568:
	mov r0, #4
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
_0202F57C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #8]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateDialogueBox

	arm_func_start CreatePortraitBox
CreatePortraitBox: ; 0x0202F5AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r4, r1
	mov r0, #0x380
	mov r1, #8
	mov r6, r2
	bl MemAlloc
	ldr r1, _0202F648 ; =PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
	mov r5, r0
	add ip, sp, #0
	ldmia r1, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, _0202F64C ; =UpdatePortraitBox
	cmp r6, #0
	str r0, [sp]
	mvnne r0, #3
	mvneq r0, #6
	strb r0, [sp, #9]
	str r5, [sp, #0xc]
	strb r7, [sp, #8]
	add r0, sp, #0
	strb r6, [r5, #0x2a]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r5]
	mov r1, #0
	add r0, r5, #8
	str r1, [r5, #4]
	bl InitPortraitParams
	add r0, r5, #0x18
	bl InitPortraitParams
	str r4, [r5, #0x2c]
	mov r0, #0
	strb r0, [r5, #0x28]
	strb r0, [r5, #0x29]
	ldrsb r0, [r5]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202F648: .word PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS
_0202F64C: .word UpdatePortraitBox
	arm_func_end CreatePortraitBox

	arm_func_start ClosePortraitBox
ClosePortraitBox: ; 0x0202F650
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end ClosePortraitBox

	arm_func_start PortraitBoxNeedsUpdate
PortraitBoxNeedsUpdate: ; 0x0202F66C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	movhi r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end PortraitBoxNeedsUpdate

	arm_func_start ShowPortraitInPortraitBox
ShowPortraitInPortraitBox: ; 0x0202F690
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #1
	strne r0, [r4, #4]
	cmp r5, #0
	addne ip, r4, #0x18
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	bne _0202F6D0
	add r0, r4, #0x18
	bl InitPortraitParams
_0202F6D0:
	mov r0, #1
	strb r0, [r4, #0x28]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ShowPortraitInPortraitBox

	arm_func_start HidePortraitBox
HidePortraitBox: ; 0x0202F6DC
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	bl InitPortraitParams
	ldr r0, [r4, #4]
	cmp r0, #0
	movne r0, #1
	strneb r0, [r4, #0x29]
	ldmia sp!, {r4, pc}
	arm_func_end HidePortraitBox

	arm_func_start UpdatePortraitBox
UpdatePortraitBox: ; 0x0202F70C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202F728: ; jump table
	b _0202F73C ; case 0
	b _0202F760 ; case 1
	b _0202F778 ; case 2
	b _0202F86C ; case 3
	b _0202F894 ; case 4
_0202F73C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	mov r0, #1
	strb r1, [r4, #0x28]
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_0202F760:
	ldrsb r0, [r5, #0x10]
	bl sub_0202811C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #4]
_0202F778:
	mov r0, #0
	strb r0, [r4, #0x28]
	add r0, r4, #0x18
	add ip, r4, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	bne _0202F86C
	mov r0, ip
	bl IsValidPortrait
	cmp r0, #0
	beq _0202F854
	add r0, r4, #8
	add r1, r4, #0x30
	bl LoadPortrait
	cmp r0, #0
	beq _0202F824
	ldr r2, [r4, #0x2c]
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0x30
	mov r2, r2, lsl #4
	bl sub_02027040
	ldrsb r0, [r5, #0x10]
	ldr r2, [r4, #0x2c]
	add r1, r4, #0x60
	bl sub_02026E3C
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x11]
	ldrb r0, [r4, #0x2a]
	cmp r0, #0
	ldrsb r0, [r4]
	beq _0202F808
	mvn r1, #3
	bl sub_02028080
	b _0202F810
_0202F808:
	mvn r1, #6
	bl sub_02028080
_0202F810:
	ldrsb r0, [r5, #0x10]
	add r1, r4, #0xc
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F824:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	ldrsb r0, [r4]
	mov r1, #0
	bl sub_02028080
	add r1, r4, #0xc
	ldrsb r0, [r5, #0x10]
	ldmia r1, {r1, r2}
	bl sub_02028770
	b _0202F85C
_0202F854:
	mov r0, #1
	strb r0, [r4, #0x29]
_0202F85C:
	mov r0, #3
	str r0, [r4, #4]
	sub r0, r0, #4
	str r0, [r5, #0xb8]
_0202F86C:
	ldrb r0, [r4, #0x28]
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x29]
	cmp r0, #0
	movne r0, #4
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
_0202F894:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl InitPortraitParams
	mov r0, #0
	strb r0, [r4, #0x29]
	str r0, [r4, #4]
	sub r0, r0, #6
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdatePortraitBox

	arm_func_start CreateTextBox
CreateTextBox: ; 0x0202F8C4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl CreateTextBoxInternal
	str r4, [r0, #4]
	ldrsb r0, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end CreateTextBox

	arm_func_start CreateTextBoxWithArg
CreateTextBoxWithArg: ; 0x0202F8DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r5, r1
	bl CreateTextBoxInternal
	str r4, [r0, #0x14]
	str r5, [r0, #8]
	ldrsb r0, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CreateTextBoxWithArg

	arm_func_start CloseTextBox
CloseTextBox: ; 0x0202F8FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox

	arm_func_start CloseTextBox2
CloseTextBox2: ; 0x0202F918
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	mov r0, r4
	bl sub_0202836C
	mov r0, r4
	bl sub_02027B1C
	mov r0, r4
	bl sub_0202F954
	mov r0, r4
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTextBox2

	arm_func_start sub_0202F954
sub_0202F954: ; 0x0202F954
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _0202F9AC
_0202F96C: ; jump table
	b _0202F9AC ; case 0
	b _0202F988 ; case 1
	b _0202F994 ; case 2
	b _0202F9A0 ; case 3
	ldmia sp!, {r3, pc} ; case 4
	ldmia sp!, {r3, pc} ; case 5
	ldmia sp!, {r3, pc} ; case 6
_0202F988:
	mov r1, #5
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F994:
	mov r1, #3
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9A0:
	mov r1, #4
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
_0202F9AC:
	mov r1, #0
	str r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F954

	arm_func_start sub_0202F9B8
sub_0202F9B8: ; 0x0202F9B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x10]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x10]
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_0202F9B8

	arm_func_start CreateTextBoxInternal
CreateTextBoxInternal: ; 0x0202F9DC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x18
	mov r1, #8
	bl MemAlloc
	mov r4, r0
	cmp r5, #0
	ldreq r0, _0202FA54 ; =TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _0202FA58 ; =UpdateTextBox
	add r0, sp, #0
	str r1, [sp]
	str r4, [sp, #0xc]
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
	ldr r1, _0202FA58 ; =UpdateTextBox
	mov r0, r4
	str r1, [r4, #0xc]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0202FA54: .word TEXT_BOX_DEFAULT_WINDOW_PARAMS
_0202FA58: .word UpdateTextBox
	arm_func_end CreateTextBoxInternal

	arm_func_start UpdateTextBox
UpdateTextBox: ; 0x0202FA5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r1, sp, #0
	mov r0, #0
	bl GetPressedButtons
	ldr r0, [r4, #0x10]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0202FA84: ; jump table
	b _0202FAA0 ; case 0
	b _0202FAB0 ; case 1
	b _0202FAC8 ; case 2
	b _0202FB04 ; case 3
	b _0202FB50 ; case 4
	b _0202FB68 ; case 5
	b _0202FB88 ; case 6
_0202FAA0:
	mvn r0, #0
	str r0, [r5, #0xb8]
	mov r0, #1
	str r0, [r4, #0x10]
_0202FAB0:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r4, #0x10]
_0202FAC8:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _0202FAE4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x14]
	blx r2
	b _0202FAF8
_0202FAE4:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0202FAF8
	ldrsb r0, [r5, #0x10]
	blx r1
_0202FAF8:
	mov r0, #3
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB04:
	ldrb r0, [r5, #8]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [sp]
	tst r0, #2
	ldrnesb r2, [r5, #9]
	mvnne r1, #1
	cmpne r2, r1
	subne r0, r1, #3
	cmpne r2, r0
	subne r0, r1, #6
	cmpne r2, r0
	subne r0, r1, #7
	cmpne r2, r0
	movne r0, #4
	strne r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	cmp r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_0202FB50:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #0x10]
_0202FB68:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	movne r0, #6
	strne r0, [r4, #0x10]
	subne r0, r0, #0xc
	strne r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, pc}
_0202FB88:
	mvn r0, #4
	str r0, [r5, #0xb8]
	mov r0, #7
	str r0, [r4, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end UpdateTextBox

	arm_func_start IsTextBoxActive
IsTextBoxActive: ; 0x0202FB9C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x10]
	cmp r0, #7
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTextBoxActive

	arm_func_start CreateAreaNameBox
CreateAreaNameBox: ; 0x0202FBBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x64
	mov r7, r0
	mov r6, r1
	mov r0, #0x1b4
	mov r1, #8
	mov r5, r2
	mov r8, r3
	bl MemAlloc
	mov r4, r0
	str r8, [r4, #0xa4]
	add r0, sp, #0x14
	str r8, [sp, #0x24]
	str r0, [sp]
	ldr r2, _0202FD2C ; =_0209AF6C
	ldr r3, _0202FD30 ; =0x0000C402
	add r0, r4, #0xac
	mov r1, #0x100
	bl PreprocessString
	add r0, r4, #0xac
	bl sub_020265A8
	mov ip, r0
	cmp r7, #0
	str ip, [r4, #0xa8]
	addne lr, sp, #4
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FD34 ; =UpdateAreaNameBox
	strne r0, [sp, #4]
	bne _0202FC48
	ldr r0, _0202FD38 ; =AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	add r7, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	orr r6, r6, #0x300000
_0202FC48:
	ldrb r0, [sp, #0xa]
	str r4, [sp, #0x10]
	cmp r0, #0
	addeq r1, ip, #7
	moveq r0, r1, asr #2
	addeq r0, r1, r0, lsr #29
	moveq r0, r0, asr #3
	streqb r0, [sp, #0xa]
	ldrb r0, [sp, #0xb]
	cmp r0, #0
	moveq r0, #2
	streqb r0, [sp, #0xb]
	tst r6, #0x200000
	ldrneb r1, [sp, #8]
	ldrneb r0, [sp, #0xa]
	subne r0, r1, r0
	strneb r0, [sp, #8]
	tst r6, #0x100000
	ldrneb r1, [sp, #9]
	ldrneb r0, [sp, #0xb]
	subne r0, r1, r0
	strneb r0, [sp, #9]
	ldrb r1, [sp, #0xa]
	ldr r0, [r4, #0xa8]
	rsb r0, r0, r1, lsl #3
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1b0]
	ldrb r0, [sp, #0xb]
	mov r0, r0, lsl #3
	sub r0, r0, #0xc
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r4, #0x1ac]
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	movlt r0, #0
	strlt r0, [r4, #0x1b0]
	ldr r0, _0202FD34 ; =UpdateAreaNameBox
	cmp r5, #0
	stmia r4, {r0, r6}
	beq _0202FD10
	add r7, r4, #8
	mov r6, #9
_0202FCF8:
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _0202FCF8
	ldmia r5, {r0, r1}
	stmia r7, {r0, r1}
_0202FD10:
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r2, [r4, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0202FD2C: .word _0209AF6C
_0202FD30: .word 0x0000C402
_0202FD34: .word UpdateAreaNameBox
_0202FD38: .word AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAreaNameBox

	arm_func_start SetAreaNameBoxState3
SetAreaNameBoxState3: ; 0x0202FD3C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #3
	str r1, [r0, #0xa0]
	ldmia sp!, {r3, pc}
	arm_func_end SetAreaNameBoxState3

	arm_func_start CloseAreaNameBox
CloseAreaNameBox: ; 0x0202FD50
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseAreaNameBox

	arm_func_start IsAreaNameBoxActive
IsAreaNameBoxActive: ; 0x0202FD6C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAreaNameBoxActive

	arm_func_start UpdateAreaNameBox
UpdateAreaNameBox: ; 0x0202FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FDA8: ; jump table
	b _0202FDB8 ; case 0
	b _0202FDD0 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FE0C ; case 3
_0202FDB8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FDD0:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldr r1, [r6, #0x1b0]
	ldr r2, [r6, #0x1ac]
	add r3, r6, #0xac
	bl DrawTextInWindow
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FE0C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateAreaNameBox

	arm_func_start CreateControlsChart
CreateControlsChart: ; 0x0202FE2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r5, r1
	mov r0, #0xa8
	mov r1, #8
	mov r4, r2
	mov r6, r3
	bl MemAlloc
	mov ip, r0
	cmp r7, #0
	ldreq r0, _0202FECC ; =CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
	strh r6, [ip, #0xa4]
	add lr, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia lr, {r0, r1, r2, r3}
	ldmneia r7, {r0, r1, r2, r3}
	stmneia lr, {r0, r1, r2, r3}
	ldrne r0, _0202FED0 ; =UpdateControlsChart
	str ip, [sp, #0xc]
	strne r0, [sp]
	ldr r0, _0202FED0 ; =UpdateControlsChart
	cmp r4, #0
	stmia ip, {r0, r5}
	beq _0202FEB0
	add lr, ip, #8
	mov r5, #9
_0202FE98:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _0202FE98
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_0202FEB0:
	mov r2, #0
	add r0, sp, #0
	mov r1, #3
	str r2, [ip, #0xa0]
	bl NewWindowScreenCheck
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0202FECC: .word CONTROLS_CHART_DEFAULT_WINDOW_PARAMS
_0202FED0: .word UpdateControlsChart
	arm_func_end CreateControlsChart

	arm_func_start CloseControlsChart
CloseControlsChart: ; 0x0202FED4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseControlsChart

	arm_func_start IsControlsChartActive
IsControlsChartActive: ; 0x0202FEF0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xa0]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsControlsChartActive

	arm_func_start UpdateControlsChart
UpdateControlsChart: ; 0x0202FF10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0xa0]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, r5, r6, pc}
_0202FF2C: ; jump table
	b _0202FF3C ; case 0
	b _0202FF54 ; case 1
	ldmia sp!, {r4, r5, r6, pc} ; case 2
	b _0202FF90 ; case 3
_0202FF3C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r4, #0xa0]
_0202FF54:
	ldrsb r0, [r5, #0x10]
	ldr r6, [r5, #0xc]
	bl sub_02027B1C
	ldrsb r0, [r5, #0x10]
	ldrh r3, [r6, #0xa4]
	mov r1, #4
	mov r2, #2
	bl sub_02026268
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0xa0]
	sub r0, r0, #3
	str r0, [r5, #0xb8]
	ldmia sp!, {r4, r5, r6, pc}
_0202FF90:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	mvnne r0, #4
	strne r0, [r5, #0xb8]
	movne r0, #4
	strne r0, [r4, #0xa0]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end UpdateControlsChart

	arm_func_start CreateAlertBox
CreateAlertBox: ; 0x0202FFB0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #0x650
	mov r1, #8
	bl MemAlloc
	mov r1, #0x650
	mov r4, r0
	bl MemZero
	cmp r5, #0
	ldreq r0, _0203003C ; =ALERT_BOX_DEFAULT_WINDOW_PARAMS
	add ip, sp, #0
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia ip, {r0, r1, r2, r3}
	ldmneia r5, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030040 ; =UpdateAlertBox
	str r4, [sp, #0xc]
	strne r0, [sp]
	add r0, sp, #0
	mov r1, #3
	bl NewWindowScreenCheck
	strb r0, [r4]
	ldrsb r1, [r4]
	add r0, r4, #8
	bl sub_02025E84
	mov r1, #0
	str r1, [r4, #4]
	add r0, r4, #0x600
	strh r1, [r0, #0x44]
	strh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsb r0, [r4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0203003C: .word ALERT_BOX_DEFAULT_WINDOW_PARAMS
_02030040: .word UpdateAlertBox
	arm_func_end CreateAlertBox

	arm_func_start CloseAlertBox
CloseAlertBox: ; 0x02030044
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	ldrsb r0, [r4]
	bl sub_0202836C
	add r0, r4, #8
	bl sub_0202613C
	mov r0, r5
	bl GetWindowContents
	bl MemFree
	mov r0, r5
	bl DeleteWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAlertBox

	arm_func_start sub_0203007C
sub_0203007C: ; 0x0203007C
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x44]
	add r1, r1, #1
	strh r1, [r0, #0x44]
	ldrsh r1, [r0, #0x44]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x44]
	bx lr
	arm_func_end sub_0203007C

	arm_func_start sub_020300A0
sub_020300A0: ; 0x020300A0
	add r0, r0, #0x600
	ldrsh r0, [r0, #0x44]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #4
	movge r0, #0
	bx lr
	arm_func_end sub_020300A0

	arm_func_start sub_020300C0
sub_020300C0: ; 0x020300C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add ip, sp, #0
	str r1, [sp]
	mov r1, ip
	add r0, r5, #0xc
	mov r4, r3
	str r2, [sp, #4]
	bl sub_02020B60
	ldr r1, _02030108 ; =0x0000C402
	mov r2, r4
	add r0, r5, #0xc
	bl sub_02020BC4
	add r0, r5, #0xc
	bl AnalyzeText
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02030108: .word 0x0000C402
	arm_func_end sub_020300C0

	arm_func_start sub_0203010C
sub_0203010C: ; 0x0203010C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	cmpne r0, #3
	beq _02030144
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #1
	str r0, [r4, #4]
_02030144:
	mov r0, r4
	bl sub_020300A0
	add r1, r4, #0x600
	ldrsh r2, [r1, #0x46]
	cmp r2, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r5, [sp]
	ldrsh r1, [r1, #0x44]
	add r0, r4, #0x29
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r0, r1, r0, r2
	mov r2, r6
	mov r3, r7
	mov r1, #0x140
	bl PreprocessString
	add r1, r4, #0x600
	add r0, r4, #0x29
	ldrsh r1, [r1, #0x44]
	add r2, r0, #0x100
	mov r0, #0x148
	smlabb r2, r1, r0, r2
	mov r1, r7
	add r0, r4, #8
	bl sub_02026194
	add r1, r4, #0x600
	ldrsh r0, [r1, #0x44]
	mov r2, #0x148
	mov r6, #0
	smlabb r0, r0, r2, r4
	add r0, r0, #0x200
	strh r7, [r0, #0x6a]
	ldrsh r5, [r1, #0x44]
	ldrb r3, [sp, #0x18]
	mov r0, r4
	smlabb r5, r5, r2, r4
	str r6, [r5, #0x124]
	ldrsh r1, [r1, #0x44]
	smlabb r1, r1, r2, r4
	strb r3, [r1, #0x128]
	bl sub_0203007C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203010C

	arm_func_start IsAlertBoxActive
IsAlertBoxActive: ; 0x020301F4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #4]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsAlertBoxActive

	arm_func_start sub_02030214
sub_02030214: ; 0x02030214
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030260
_02030230: ; jump table
	b _02030260 ; case 0
	b _02030248 ; case 1
	b _02030254 ; case 2
	b _02030254 ; case 3
	ldmia sp!, {r4, pc} ; case 4
	ldmia sp!, {r4, pc} ; case 5
_02030248:
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030254:
	mov r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
_02030260:
	add r0, r4, #8
	bl sub_0202613C
	mov r0, #0
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030214

	arm_func_start UpdateAlertBox
UpdateAlertBox: ; 0x02030274
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030290: ; jump table
	b _020302A8 ; case 0
	b _020302C8 ; case 1
	b _020302E0 ; case 2
	b _02030438 ; case 3
	b _0203056C ; case 4
	b _02030588 ; case 5
_020302A8:
	add r0, r4, #8
	bl sub_020261D4
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, #1
	str r0, [r4, #4]
	sub r0, r0, #2
	str r0, [r5, #0xb8]
_020302C8:
	ldrsb r0, [r5, #0x10]
	bl sub_0202810C
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020302E0:
	ldrsb r0, [r5, #0x10]
	bl GetWindowContents
	add r0, r0, #0x600
	ldrsh r1, [r0, #0x46]
	ldrsh r0, [r0, #0x44]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrsb r4, [r5, #0x10]
	mov r0, r4
	bl GetWindowContents
	mov r6, r0
	add r3, r6, #0x600
	ldr r1, [r6, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r5, [r6, #0x10]
	mov r8, r1, asr #0x10
	mla r1, r2, r8, r5
	ldr r2, [r6, #0xc]
	mov r7, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	ldrsh r3, [r3, #0x46]
	mov r1, #0x148
	add r5, r6, #0x124
	smulbb r3, r3, r1
	ldr r1, [r5, r3]
	add r5, r5, r3
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov r7, r7, asr #0x10
	bne _02030388
	mov r5, #0x17
	mov r0, r4
	add r2, r7, r8
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
	b _020303C4
_02030388:
	mov r2, r7
	add r3, r5, #5
	bl sub_020300C0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _020303C4
	cmp r7, r8
	blt _020303C4
	mov r5, #0x17
	mov r0, r4
	sub r2, r7, #2
	mov r1, #0
	mov r3, #0xe0
	str r5, [sp]
	bl sub_02025D50
_020303C4:
	mov r0, r4
	bl UpdateWindow
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x46]
	strh r1, [r0, #0x48]
	ldrsh r1, [r0, #0x46]
	add r1, r1, #1
	strh r1, [r0, #0x46]
	ldrsh r1, [r0, #0x46]
	cmp r1, #4
	movge r1, #0
	strgeh r1, [r0, #0x46]
	add r0, r6, #0x600
	ldrsh r1, [r0, #0x4a]
	cmp r1, #3
	movge r1, #3
	strge r1, [r6, #4]
	movge r1, #0
	strgeh r1, [r0, #0x4c]
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r6, #0xa0]
	ldr r0, [r6, #0x10]
	add r2, r1, r8
	mov r1, r8
	sub r0, r2, r0
	bl _s32_div_f
	add r1, r6, #0x600
	strh r0, [r1, #0x4a]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030438:
	ldrsb r5, [r5, #0x10]
	mov r0, r5
	bl GetWindowContents
	mov r7, r0
	add r3, r7, #0x600
	ldr r1, [r7, #0x20]
	ldrsh r2, [r3, #0x4a]
	mov r1, r1, lsl #0x10
	ldr r6, [r7, #0x10]
	mov r8, r1, asr #0x10
	ldr r1, [r7, #0xc]
	mla r6, r2, r8, r6
	ldrsh sb, [r3, #0x4c]
	mov r2, r1, lsl #0x10
	ldrsh ip, [r3, #0x48]
	mov r1, #0x148
	add r3, sb, r6
	mov r3, r3, lsl #0x10
	smulbb r6, ip, r1
	add sb, r7, #0x124
	ldr r1, [sb, r6]
	add r6, sb, r6
	cmp r1, #1
	mov r1, r2, asr #0x10
	mov sb, r3, asr #0x10
	bne _020304C0
	mov r6, #0x17
	mov r0, r5
	add r2, sb, r8
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
	b _020304FC
_020304C0:
	mov r2, sb
	add r3, r6, #5
	bl sub_020300C0
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _020304FC
	cmp sb, r8
	blt _020304FC
	mov r6, #0x17
	mov r0, r5
	sub r2, sb, #2
	mov r1, #0
	mov r3, #0xe0
	str r6, [sp]
	bl sub_02025D50
_020304FC:
	add r0, r7, #0x600
	ldrsh r0, [r0, #0x4c]
	add r0, r0, r8
	cmp r0, #1
	mov r0, r5
	bne _02030528
	bl sub_01FF9128
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #1
	b _02030538
_02030528:
	bl sub_01FF929C
	add r0, r7, #0x600
	ldrsh r1, [r0, #0x4c]
	sub r1, r1, #2
_02030538:
	strh r1, [r0, #0x4c]
	add r0, r7, #0x600
	ldrsh r2, [r0, #0x4c]
	rsb r1, r8, #0
	cmp r2, r1
	movle r1, #3
	strleh r1, [r0, #0x4a]
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	movne r0, #2
	strne r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0203056C:
	ldrsb r0, [r5, #0x10]
	bl sub_0202836C
	ldrsb r0, [r5, #0x10]
	bl sub_02027B1C
	mov r0, #5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02030588:
	ldrsb r0, [r5, #0x10]
	bl sub_0202812C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r1, #0
	add r0, r4, #8
	str r1, [r4, #4]
	bl sub_0202613C
	mvn r0, #5
	str r0, [r5, #0xb8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end UpdateAlertBox

	arm_func_start CreateAdvancedTextBox
CreateAdvancedTextBox: ; 0x020305B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	add r1, r0, #0x100
	str r4, [r0, #0x1a4]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBox

	arm_func_start CreateAdvancedTextBoxWithArg
CreateAdvancedTextBoxWithArg: ; 0x020305E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r3
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str ip, [sp]
	bl CreateAdvancedTextBoxInternal
	ldr r2, [sp, #0x10]
	str r4, [r0, #0x1a8]
	add r1, r0, #0x100
	str r2, [r0, #0x1ac]
	ldrsb r0, [r1, #0xa0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end CreateAdvancedTextBoxWithArg

	arm_func_start CreateAdvancedTextBoxInternal
CreateAdvancedTextBoxInternal: ; 0x0203061C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	mov r8, r0
	mov r7, r1
	mov r0, #0x1c8
	mov r1, #8
	mov r6, r2
	mov r5, r3
	bl MemAlloc
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x1a4]
	str r0, [r4, #0x1a8]
	str r0, [r4, #0x1ac]
	str r0, [r4, #0x1b8]
	mov r0, #1
	cmp r8, #0
	strb r0, [r4, #0x1c4]
	addne ip, sp, #0x18
	ldmneia r8, {r0, r1, r2, r3}
	stmneia ip, {r0, r1, r2, r3}
	ldrne r0, _02030774 ; =UpdateAdvancedTextBox
	strne r0, [sp, #0x18]
	bne _02030690
	ldr r0, _02030778 ; =ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	add r8, sp, #0x18
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	orr r7, r7, #0x300000
_02030690:
	tst r7, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	str r4, [sp, #0x24]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst r7, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02030774 ; =UpdateAdvancedTextBox
	cmp r6, #0
	str r0, [r4]
	str r7, [r4, #0x104]
	beq _020306F0
	add ip, r4, #0x108
	mov r8, #9
_020306D8:
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r8, r8, #1
	bne _020306D8
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
_020306F0:
	mov r2, #0
	str r2, [r4, #0x1bc]
	strb r2, [r4, #0x1c0]
	strb r2, [r4, #0x1c1]
	strb r2, [r4, #0x1c2]
	str r2, [r4, #0x1b0]
	str r2, [r4, #0x1b4]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r4, #0x1c3]
	bl NewWindowScreenCheck
	add r1, sp, #8
	strb r0, [r4, #0x1a0]
	bl GetWindowRectangle
	mov r1, #0x100
	strh r1, [r4, #0xfc]
	tst r7, #0x8000
	moveq r5, #0
	streq r5, [sp, #0x40]
	strh r1, [r4, #0xfe]
	add r0, r4, #0x100
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #0x40]
	add r3, sp, #8
	mov r1, r7
	add r0, r4, #4
	add r2, r4, #0x108
	stmia sp, {r5, r6}
	bl InitWindowInput
	mov r0, r4
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02030774: .word UpdateAdvancedTextBox
_02030778: .word ADVANCED_TEXT_BOX_DEFAULT_WINDOW_PARAMS
	arm_func_end CreateAdvancedTextBoxInternal

	arm_func_start SetAdvancedTextBoxPartialMenu
SetAdvancedTextBoxPartialMenu: ; 0x0203077C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c3]
	ldr r1, [r0, #0x104]
	tst r4, #0xff
	orrne r1, r1, #0x400000
	biceq r1, r1, #0x400000
	str r1, [r0, #0x104]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxPartialMenu

	arm_func_start SetAdvancedTextBoxField0x1C4
SetAdvancedTextBoxField0x1C4: ; 0x020307A4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0x1c4]
	ldmia sp!, {r4, pc}
	arm_func_end SetAdvancedTextBoxField0x1C4

	arm_func_start sub_020307B8
sub_020307B8: ; 0x020307B8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	str r1, [r0, #0x1bc]
	mov r1, #0
	strb r1, [r0, #0x1c0]
	strb r1, [r0, #0x1c1]
	ldr r1, [r0, #0x104]
	bic r1, r1, #0x800000
	str r1, [r0, #0x104]
	add r0, r0, #4
	bl sub_02032984
	ldmia sp!, {r3, pc}
	arm_func_end sub_020307B8

	arm_func_start sub_020307EC
sub_020307EC: ; 0x020307EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #7
	moveq r0, #1
	movne r0, #0
	tst r0, #0xff
	beq _02030828
	mov r0, r5
	bl sub_020307B8
	ldmia sp!, {r3, r4, r5, pc}
_02030828:
	ldr r0, [r4, #0x1bc]
	cmp r0, #6
	moveq r0, #0
	streq r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020307EC

	arm_func_start SetAdvancedTextBoxField0x1C2
SetAdvancedTextBoxField0x1C2: ; 0x0203083C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #1
	strb r1, [r0, #0x1c2]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxField0x1C2

	arm_func_start CloseAdvancedTextBox2
CloseAdvancedTextBox2: ; 0x02030850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_0202836C
	mov r0, r5
	bl sub_020288DC
	mov r0, r5
	bl sub_0202812C
	mov r0, r5
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox2

	arm_func_start SetAdvancedTextBoxState5
SetAdvancedTextBoxState5: ; 0x0203088C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	mov r1, #5
	str r1, [r0, #0x1bc]
	ldmia sp!, {r3, pc}
	arm_func_end SetAdvancedTextBoxState5

	arm_func_start CloseAdvancedTextBox
CloseAdvancedTextBox: ; 0x020308A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, r5
	bl DeleteWindow
	mov r0, r4
	bl MemFree
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CloseAdvancedTextBox

	arm_func_start IsAdvancedTextBoxActive
IsAdvancedTextBoxActive: ; 0x020308C4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1bc]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsAdvancedTextBoxActive

#ifndef JAPAN
	arm_func_start sub_020308E4
sub_020308E4: ; 0x020308E4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	ldrneb r0, [r0, #0x1c1]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020308E4
#endif

	arm_func_start sub_02030908
sub_02030908: ; 0x02030908
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030938
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032558
	ldmia sp!, {r3, pc}
_02030938:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030908

	arm_func_start sub_02030940
sub_02030940: ; 0x02030940
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1c0]
	cmp r1, #0
	beq _02030970
	ldrb r1, [r0, #0x1c1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_02030970:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030940

	arm_func_start sub_02030978
sub_02030978: ; 0x02030978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl GetWindowContents
	mov r1, r0
	strh r5, [r1, #0xfc]
	strh r4, [r1, #0xfe]
	mov r0, r7
	mov r2, r6
	mov r3, r5
	add r1, r1, #4
	str r4, [sp]
	bl sub_020289B8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02030978

	arm_func_start sub_020309B8
sub_020309B8: ; 0x020309B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl GetWindowContents
	mov r1, r0
	strh r6, [r1, #0xfc]
	ldr r4, [sp, #0x28]
	strh r5, [r1, #0xfe]
	add ip, r1, #0x100
	ldr lr, [sp, #0x2c]
	strh r4, [ip]
	strh lr, [ip, #2]
	str r5, [sp]
	mov r0, r8
	add r1, r1, #4
	mov r2, r7
	mov r3, r6
	stmib sp, {r4, lr}
	bl sub_02028A08
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020309B8

	arm_func_start sub_02030A18
sub_02030A18: ; 0x02030A18
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032568
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030A18

	arm_func_start sub_02030A2C
sub_02030A2C: ; 0x02030A2C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strh r4, [r0, #0x20]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A2C

	arm_func_start GetAdvancedTextBoxFlags2
GetAdvancedTextBoxFlags2: ; 0x02030A40
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x1b0]
	ldmia sp!, {r3, pc}
	arm_func_end GetAdvancedTextBoxFlags2

	arm_func_start sub_02030A50
sub_02030A50: ; 0x02030A50
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0xc0]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A50

	arm_func_start sub_02030A64
sub_02030A64: ; 0x02030A64
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0xc0]
	ldmia sp!, {r3, pc}
	arm_func_end sub_02030A64

	arm_func_start sub_02030A74
sub_02030A74: ; 0x02030A74
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C74
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A74

	arm_func_start sub_02030A90
sub_02030A90: ; 0x02030A90
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02031C84
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030A90

	arm_func_start sub_02030AAC
sub_02030AAC: ; 0x02030AAC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	strb r4, [r0, #0xf8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02030AAC

	arm_func_start SetUnkAdvancedTextBoxFn
SetUnkAdvancedTextBoxFn: ; 0x02030AC0
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b4]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxFn

	arm_func_start SetUnkAdvancedTextBoxWindowFn
SetUnkAdvancedTextBoxWindowFn: ; 0x02030AD4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x1b8]
	ldmia sp!, {r4, pc}
	arm_func_end SetUnkAdvancedTextBoxWindowFn

	arm_func_start UpdateAdvancedTextBox
UpdateAdvancedTextBox: ; 0x02030AE8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r7, r0
	ldr r4, [r7, #0xc]
	mov r5, #0
	str r5, [r4, #0x1b0]
	ldr r0, [r4, #0x1bc]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02030E88
_02030B10: ; jump table
	b _02030B28 ; case 0
	b _02030B40 ; case 1
	b _02030B48 ; case 2
	b _02030BA0 ; case 3
	b _02030E0C ; case 4
	b _02030E5C ; case 5
_02030B28:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02030E88
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B40:
	mov r0, #2
	str r0, [r4, #0x1bc]
_02030B48:
	mov r0, r7
	bl sub_02030E94
	ldr r0, [r4, #0x104]
	tst r0, #0x800000
	beq _02030B80
	mov r0, #7
	str r0, [r4, #0x1bc]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02030E88
_02030B80:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x1bc]
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02030E88
_02030BA0:
	ldr r2, [r4, #0x1b4]
	ldrb r6, [r4, #0x1c2]
	cmp r2, #0
	beq _02030BF0
	add r0, sp, #0x1c
	add r1, sp, #0x18
	blx r2
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	ldr ip, [sp, #0x1c]
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	str ip, [sp]
	bl sub_02031E80
	b _02030C18
_02030BF0:
	ldrsb r0, [r7, #0x10]
	bl sub_02028324
	cmp r0, #0
	moveq r3, #1
	movne r3, r5
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	and r3, r3, #0xff
	bl sub_02031C98
_02030C18:
	orr r6, r6, r0
	mov r0, #0
	strb r0, [r4, #0x1c2]
	ldr r2, [r4, #0x1b4]
	cmp r2, #0
	beq _02030CAC
	add r0, sp, #0x14
	add r1, sp, #0x10
	blx r2
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CAC
	ldr r0, [r4, #0x104]
	tst r0, #1
	beq _02030CAC
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _02030E90 ; =0x00000408
	str r0, [sp, #8]
	ldr ip, [sp, #0x10]
	add r1, sp, #0x20
	add r0, r4, #4
	str ip, [sp, #0xc]
	bl sub_020322B0
	movs r1, r0
	bmi _02030CAC
	ldr r2, [sp, #0x14]
	add r0, r4, #4
	bl sub_020326F8
	ldr r0, [r4, #0x1b0]
	mov r6, #1
	orr r0, r0, #1
	mov r5, r6
	str r0, [r4, #0x1b0]
_02030CAC:
	ldrb r0, [r4, #0xf8]
	cmp r0, #0
	bne _02030CC4
	ldr r0, [r4, #0x1b0]
	cmp r0, #0
	bne _02030CD8
_02030CC4:
	add r2, sp, #0x20
	add r0, r4, #4
	add r1, r4, #0x1b0
	bl sub_02033758
	orr r6, r6, r0
_02030CD8:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [r4, #0x1b0]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	orrs r0, r6, r0
	beq _02030D04
	mov r0, r7
	bl sub_02030E94
_02030D04:
	ldr r0, [r4, #0x1b0]
	tst r0, #1
	beq _02030D74
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _02030DB0
	ldr r0, [r4, #0x104]
	tst r0, #0x80000000
	bne _02030D38
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02030D38:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldr r2, [r4, #0x1b8]
	cmp r2, #0
	beq _02030DB0
	ldrsb r0, [r7, #0x10]
	mov r1, r5
	blx r2
	b _02030DB0
_02030D74:
	tst r0, #2
	beq _02030DB0
	ldrb r0, [r4, #0x1c4]
	cmp r0, #0
	beq _02030D94
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
_02030D94:
	mov r0, #1
	strb r0, [r4, #0x1c0]
	strb r0, [r4, #0x1c1]
	sub r0, r0, #6
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x1bc]
_02030DB0:
	ldrsh r0, [r4, #0xfe]
	cmp r0, #0x100
	str r0, [sp]
	bne _02030DD8
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	add r1, r4, #4
	bl sub_020289B8
	b _02030E00
_02030DD8:
	add r0, r4, #0x100
	ldrsh r2, [r0]
	add r1, r4, #4
	str r2, [sp, #4]
	ldrsh r0, [r0, #2]
	str r0, [sp, #8]
	ldrsb r0, [r7, #0x10]
	ldrsh r3, [r4, #0xfc]
	ldr r2, [r7, #0xbc]
	bl sub_02028A08
_02030E00:
	ldr r0, [r4, #0x1bc]
	cmp r0, #4
	bne _02030E88
_02030E0C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	beq _02030E34
	ldrb r0, [r4, #0x1c3]
	cmp r0, #0
	beq _02030E54
_02030E34:
	ldr r0, [r4, #0x104]
	tst r0, #0x400000
	beq _02030E54
	mov r0, r7
	bl sub_02030E94
	mov r0, #7
	str r0, [r4, #0x1bc]
	b _02030E88
_02030E54:
	mov r0, #5
	str r0, [r4, #0x1bc]
_02030E5C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02030E88
	ldrb r0, [r4, #0x1c1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x1bc]
_02030E88:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_02030E90: .word 0x00000408
	arm_func_end UpdateAdvancedTextBox

	arm_func_start sub_02030E94
sub_02030E94: ; 0x02030E94
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrsb r0, [r5, #0x10]
	ldr r4, [r5, #0xc]
	bl sub_02027B1C
	ldr r2, [r4, #0x1a8]
	cmp r2, #0
	beq _02030EC4
	ldrsb r0, [r5, #0x10]
	ldr r1, [r4, #0x1ac]
	blx r2
	b _02030ED8
_02030EC4:
	ldr r1, [r4, #0x1a4]
	cmp r1, #0
	beq _02030ED8
	ldrsb r0, [r5, #0x10]
	blx r1
_02030ED8:
	ldrsb r1, [r5, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [r5, #0x10]
	bl UpdateWindow
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030E94

	arm_func_start sub_02030EF0
sub_02030EF0: ; 0x02030EF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1c0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1c1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x1bc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02030EF0

	arm_func_start PlayAdvancedTextBoxInputSound
PlayAdvancedTextBoxInputSound: ; 0x02030F28
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl PlayWindowInputSound
	ldmia sp!, {r4, pc}
	arm_func_end PlayAdvancedTextBoxInputSound

	arm_func_start CreateTeamSelectionMenu
CreateTeamSelectionMenu: ; 0x02030F44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	sub sp, sp, #0x400
	mov r6, r0
	mov sl, r1
	mov r0, #0x1b4
	mov r1, #8
	mov sb, r2
	mov r8, r3
	bl MemAlloc
	mov r5, r0
	cmp r6, #0
	ldreq r0, _02031114 ; =TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
	add r4, sp, #0x18
	ldmeqia r0, {r0, r1, r2, r3}
	stmeqia r4, {r0, r1, r2, r3}
	ldmneia r6, {r0, r1, r2, r3}
	stmneia r4, {r0, r1, r2, r3}
	ldrne r0, _02031118 ; =UpdateTeamSelectionMenu
	orr sl, sl, #0x8000
	strne r0, [sp, #0x18]
	ldrb r0, [sp, #0x1e]
	orreq sl, sl, #0x300000
	str r5, [sp, #0x24]
	cmp r0, #0
	bne _02031000
	mov r7, #0
	mov r6, r7
	add r4, sp, #0x28
	b _02030FE0
_02030FBC:
	mov r0, r4
	mov r1, r6
	blx r8
	cmp r0, #0
	beq _02030FDC
	bl sub_020265A8
	cmp r0, r7
	movgt r7, r0
_02030FDC:
	add r6, r6, #1
_02030FE0:
	ldr r0, [sp, #0x448]
	cmp r6, r0
	blt _02030FBC
	mov r0, sl
	mov r1, sb
	add r2, r7, #0x10
	bl sub_02031A5C
	strb r0, [sp, #0x1e]
_02031000:
	ldrb r0, [sp, #0x1f]
	add r2, sp, #0x400
	add r3, sp, #0x400
	cmp r0, #0
	add r2, r2, #0x48
	bne _02031030
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
	strb r0, [sp, #0x1f]
	b _02031040
_02031030:
	add r3, r3, #0x4c
	mov r0, sl
	mov r1, sb
	bl CalcMenuHeightDiv8__02031AA4
_02031040:
	tst sl, #0x200000
	ldrneb r1, [sp, #0x1c]
	ldrneb r0, [sp, #0x1e]
	subne r0, r1, r0
	strneb r0, [sp, #0x1c]
	tst sl, #0x100000
	ldrneb r1, [sp, #0x1d]
	ldrneb r0, [sp, #0x1f]
	subne r0, r1, r0
	strneb r0, [sp, #0x1d]
	ldr r0, _02031118 ; =UpdateTeamSelectionMenu
	cmp sb, #0
	str r0, [r5]
	str sl, [r5, #0xfc]
	beq _0203109C
	add r6, r5, #0x100
	mov r4, #9
_02031084:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02031084
	ldmia sb, {r0, r1}
	stmia r6, {r0, r1}
_0203109C:
	mov r2, #0
	str r2, [r5, #0x18c]
	str r2, [r5, #0x190]
	str r8, [r5, #0x198]
	str r2, [r5, #0x19c]
	strb r2, [r5, #0x1a0]
	strb r2, [r5, #0x1a1]
	str r2, [r5, #0x1a4]
	str r2, [r5, #0x1a8]
	str r2, [r5, #0x1ac]
	add r0, sp, #0x18
	mov r1, #3
	strb r2, [r5, #0x1b0]
	bl NewWindowScreenCheck
	add r1, sp, #8
	mov r6, r0
	bl GetWindowRectangle
	ldr r0, [sp, #0x448]
	add r3, sp, #8
	str r0, [sp]
	ldr r4, [sp, #0x44c]
	mov r1, sl
	add r0, r5, #4
	add r2, r5, #0x100
	str r4, [sp, #4]
	bl InitWindowInput
	mov r0, r6
	add sp, sp, #0x28
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02031114: .word TEAM_SELECTION_MENU_DEFAULT_WINDOW_PARAMS
_02031118: .word UpdateTeamSelectionMenu
	arm_func_end CreateTeamSelectionMenu

	arm_func_start sub_0203111C
sub_0203111C: ; 0x0203111C
	stmdb sp!, {r4, lr}
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	str r0, [r4, #0x19c]
	mov r0, #0
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x800000
	str r0, [r4, #0xfc]
	bl sub_0203C984
	add r0, r4, #4
	bl sub_02032984
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203111C

	arm_func_start sub_0203115C
sub_0203115C: ; 0x0203115C
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r1, [r0, #0x19c]
	cmp r1, #3
	moveq r1, #2
	streq r1, [r0, #0x19c]
	bl sub_0203C984
	ldmia sp!, {r3, pc}
	arm_func_end sub_0203115C

	arm_func_start sub_0203117C
sub_0203117C: ; 0x0203117C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_0203271C
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203117C

	arm_func_start CloseTeamSelectionMenu
CloseTeamSelectionMenu: ; 0x02031198
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetWindowContents
	bl MemFree
	mov r0, r4
	bl DeleteWindow
	ldmia sp!, {r4, pc}
	arm_func_end CloseTeamSelectionMenu

	arm_func_start IsTeamSelectionMenuActive
IsTeamSelectionMenuActive: ; 0x020311B4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #6
	cmpne r0, #7
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuActive

	arm_func_start sub_020311D4
sub_020311D4: ; 0x020311D4
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311D4

	arm_func_start sub_020311E8
sub_020311E8: ; 0x020311E8
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldrb r1, [r0, #0x1a0]
	cmp r1, #0
	beq _02031218
	ldrb r1, [r0, #0x1a1]
	cmp r1, #0
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r0, #4
	bl sub_02032578
	ldmia sp!, {r3, pc}
_02031218:
	mvn r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020311E8

	arm_func_start sub_02031220
sub_02031220: ; 0x02031220
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	mov r1, r4
	add r0, r0, #4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031220

	arm_func_start UpdateTeamSelectionMenu
UpdateTeamSelectionMenu: ; 0x0203123C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r7, r0
	ldrsb r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	bl sub_02028354
	cmp r0, #3
	moveq r1, #1
	movne r1, #0
	ldr r0, [r4, #0x19c]
	and r5, r1, #0xff
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _02031714
_02031274: ; jump table
	b _0203129C ; case 0
	b _020312B4 ; case 1
	b _020312F0 ; case 2
	b _02031350 ; case 3
	b _020316A4 ; case 4
	b _020316E8 ; case 5
	b _02031714 ; case 6
	b _02031714 ; case 7
	b _020315D4 ; case 8
	b _0203163C ; case 9
_0203129C:
	ldrsb r0, [r7, #0x10]
	bl sub_0202810C
	cmp r0, #0
	beq _02031714
	mov r0, #2
	str r0, [r4, #0x19c]
_020312B4:
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _020312F0
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _020312D4
	mov r0, r7
	bl sub_0203175C
_020312D4:
	ldrb r0, [r7, #8]
	bl sub_020287C4
	ldrsb r0, [r7, #0x10]
	bl UpdateWindow
	mov r0, #2
	str r0, [r4, #0x19c]
	b _02031714
_020312F0:
	mov r0, r7
	bl sub_0203175C
	ldr r0, [r4, #0xfc]
	tst r0, #0x800000
	beq _0203132C
	mov r0, #7
	str r0, [r4, #0x19c]
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #4
	str r0, [r7, #0xb8]
	b _02031714
_0203132C:
	mov r1, #3
	mov r0, #0
	str r1, [r4, #0x19c]
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	str r0, [r4, #0x1a4]
	sub r0, r0, #1
	str r0, [r7, #0xb8]
	b _02031714
_02031350:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	mov r3, #1
	bl sub_02031C98
	ldr r1, [sp, #8]
	mov r6, r0
	cmp r1, #0
	bne _020313DC
	ldr r0, [r4, #0xfc]
	tst r0, #1
	beq _020313DC
	mov r3, #0
	ldr r2, _02031758 ; =0x00000408
	add r1, sp, #0xc
	str r3, [sp]
	mov ip, #1
	add r0, r4, #4
	str ip, [sp, #4]
	bl sub_02032160
	movs r1, r0
	bmi _020313C4
	add r0, r4, #4
	bl sub_02032684
	ldr r0, [sp, #8]
	mov r6, #1
	orr r0, r0, #1
	str r0, [sp, #8]
	b _020313F0
_020313C4:
	add r1, sp, #8
	add r2, sp, #0xc
	add r0, r4, #4
	bl sub_02033758
	orr r6, r6, r0
	b _020313F0
_020313DC:
	cmp r1, #4
	cmpne r1, #8
	cmpne r1, #0xc
	beq _020313F0
	bl sub_0203C984
_020313F0:
	cmp r6, #0
	beq _02031400
	mov r0, r7
	bl sub_0203175C
_02031400:
	add r0, r4, #4
	bl sub_02032578
	mov r2, r0
	ldr r1, [sp, #8]
	add r0, r4, #4
	mov r3, #0
	bl sub_020323F8
	ldr r1, [sp, #8]
	tst r1, #1
	beq _0203148C
	add r0, r4, #4
	bl IsMenuOptionActive
	cmp r0, #0
	beq _0203147C
	ldr r0, [r4, #0xfc]
	tst r0, #0x80000000
	bne _02031450
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
_02031450:
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_0203147C:
	add r0, r4, #4
	mov r1, #2
	bl PlayWindowInputSound
	b _020315C4
_0203148C:
	tst r1, #2
	beq _020314C8
	add r0, r4, #4
	mov r1, #1
	bl PlayWindowInputSound
	mov r0, #1
	strb r0, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #6
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
	b _020315C4
_020314C8:
	tst r1, #0x1000
	beq _02031518
	ldr r0, [r4, #0xfc]
	tst r0, #0x2000
	beq _02031518
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #8
	str r0, [r4, #0x19c]
	b _020315C4
_02031518:
	tst r1, #0x2000
	beq _02031568
	ldr r0, [r4, #0xfc]
	tst r0, #0x4000
	beq _02031568
	add r0, r4, #4
	mov r1, #0
	bl PlayWindowInputSound
	mov r2, #1
	mov r0, #0
	strb r2, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	strb r2, [r4, #0x1b1]
	str r0, [r7, #0xb8]
	mov r0, #9
	str r0, [r4, #0x19c]
	b _020315C4
_02031568:
	tst r1, #0x200
	ldrne r0, [r4, #0x18c]
	cmpne r0, #0
	add r0, r4, #4
	beq _02031590
	mov r1, #5
	bl PlayWindowInputSound
	ldr r0, [r4, #0x18c]
	blx r0
	b _020315C4
_02031590:
	bl sub_0203250C
	cmp r0, #0
	beq _020315C4
	mov r1, #1
	mov r0, #0
	strb r1, [r4, #0x1a0]
	strb r0, [r4, #0x1a1]
	ldr r1, [sp, #8]
	sub r0, r0, #4
	str r1, [r4, #0x1a4]
	str r0, [r7, #0xb8]
	mov r0, #4
	str r0, [r4, #0x19c]
_020315C4:
	ldrsb r0, [r7, #0x10]
	add r1, r4, #4
	bl sub_02028948
	b _02031714
_020315D4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _020315F0
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020315F0:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x174]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_0203163C:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	beq _02031658
	mov r0, r7
	bl sub_0203175C
	b _02031714
_02031658:
	ldrb r0, [r4, #0x1b1]
	cmp r0, #0
	movne r0, #0
	strneb r0, [r4, #0x1b1]
	movne r0, #1
	strneb r0, [r4, #0x1b0]
	ldr r3, [r4, #0x17c]
	cmp r3, #0
	beq _02031714
	mov r0, #0
	mov r1, r0
	mov r2, r0
	blx r3
	ldrb r0, [r4, #0x1b0]
	cmp r0, #0
	beq _02031714
	mov r0, r7
	bl sub_0203175C
	b _02031714
_020316A4:
	add r0, r4, #4
	bl sub_02032070
	cmp r0, #0
	bne _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	bne _020316E0
	ldr r0, [r4, #0xfc]
	tst r0, #0x400000
	beq _020316E0
	mov r0, r7
	bl sub_0203175C
	mov r0, #7
	str r0, [r4, #0x19c]
	b _02031714
_020316E0:
	mov r0, #5
	str r0, [r4, #0x19c]
_020316E8:
	ldrsb r0, [r7, #0x10]
	bl sub_0202812C
	cmp r0, #0
	beq _02031714
	ldrb r0, [r4, #0x1a1]
	cmp r0, #0
	mvnne r0, #4
	mvneq r0, #3
	str r0, [r7, #0xb8]
	mov r0, #6
	str r0, [r4, #0x19c]
_02031714:
	mov r0, #0
	strb r0, [r4, #0x1b0]
	cmp r5, #0
	beq _02031740
	ldr r0, [r4, #0x19c]
	cmp r0, #1
	bne _02031740
	mov r0, r7
	bl sub_0203175C
	mov r0, #1
	strb r0, [r4, #0x1b0]
_02031740:
	ldr r0, [r4, #0x190]
	cmp r0, #0
	beq _02031750
	blx r0
_02031750:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02031758: .word 0x00000408
	arm_func_end UpdateTeamSelectionMenu

	arm_func_start sub_0203175C
sub_0203175C: ; 0x0203175C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	sub sp, sp, #0x400
	mov sl, r0
	ldr r4, [sl, #0xc]
	add r0, r4, #4
	bl sub_02032568
	mov r5, r0
	add r0, r4, #4
	bl sub_02032594
	ldr r1, [r4, #0xfc]
	mov r6, r0
	tst r1, #0x200
	ldrne r0, [r4, #0x160]
	addne sb, r0, r5
	ldrsb r0, [sl, #0x10]
	moveq sb, #0
	bl sub_02027B1C
	cmp r6, #0
	mov r7, #0
	ble _02031868
	mov fp, #0x42
	b _02031860
_020317B8:
	ldr r2, [r4, #0x198]
	add r0, sp, #0xc
	mov r1, r5
	blx r2
	mov r8, r0
	mov r1, #0
	cmp sb, #0
	beq _020317E8
	ldrb r0, [sb]
	add sb, sb, #1
	tst r0, #2
	movne r1, #1
_020317E8:
	cmp r8, #0
	beq _02031858
	cmp r1, #0
	mov r1, r7
	add r0, r4, #4
	beq _02031830
	bl sub_020328D8
	str fp, [sp]
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp, #4]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #8]
	ldrsb r0, [sl, #0x10]
	bl sub_02026428
	b _02031858
_02031830:
	bl sub_020328D8
	mov r2, r0
	ldr r0, [r4, #0x1a8]
	mov r3, r8
	str r0, [sp]
	ldr r0, [r4, #0x1ac]
	mov r1, #0xd
	str r0, [sp, #4]
	ldrsb r0, [sl, #0x10]
	bl sub_02026358
_02031858:
	add r7, r7, #1
	add r5, r5, #1
_02031860:
	cmp r7, r6
	blt _020317B8
_02031868:
	ldrsb r1, [sl, #0x10]
	add r0, r4, #4
	bl sub_0202A03C
	ldrsb r0, [sl, #0x10]
	bl UpdateWindow
	add sp, sp, #0xc
	add sp, sp, #0x400
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0203175C

	arm_func_start sub_02031888
sub_02031888: ; 0x02031888
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x18c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02031888

	arm_func_start sub_0203189C
sub_0203189C: ; 0x0203189C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl GetWindowContents
	str r4, [r0, #0x190]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203189C

	arm_func_start IsTeamSelectionMenuState3
IsTeamSelectionMenuState3: ; 0x020318B0
	stmdb sp!, {r3, lr}
	bl GetWindowContents
	ldr r0, [r0, #0x19c]
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end IsTeamSelectionMenuState3

	arm_func_start sub_020318D0
sub_020318D0: ; 0x020318D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl GetWindowContents
	mov r4, r0
	mov r0, #1
	mov r2, #0
	strb r0, [r4, #0x1a0]
	mov r0, r5
	sub r1, r2, #4
	strb r2, [r4, #0x1a1]
	bl sub_0202830C
	mov r0, #4
	str r0, [r4, #0x19c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020318D0

	arm_func_start sub_02031908
sub_02031908: ; 0x02031908
	ldr ip, _02031910 ; =KeyWaitInit
	bx ip
	.align 2, 0
_02031910: .word KeyWaitInit
	arm_func_end sub_02031908

	arm_func_start sub_02031914
sub_02031914: ; 0x02031914
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, #0
	mov r6, r1
	mov r4, r0
	add r1, sp, #4
	mov r0, r5
	bl GetHeldButtons
	add r1, sp, #2
	mov r0, r5
	bl GetPressedButtons
	ldrh r1, [sp, #2]
	tst r1, #1
	orrne r5, r5, #1
	tst r1, #2
	orrne r5, r5, #2
	tst r1, #0x800
	orrne r5, r5, #0x1000
	tst r1, #0x400
	orrne r5, r5, #0x2000
	tst r1, #0x200
	beq _0203197C
	ldrh r0, [sp, #4]
	tst r0, #0x100
	orrne r5, r5, #0x800
	orr r5, r5, #0x400
_0203197C:
	tst r1, #8
	orrne r5, r5, #0x100
	tst r1, #4
	orrne r5, r5, #0x200
	cmp r5, #0
	mov r0, #0
	beq _020319A0
	bl sub_020063A0
	b _020319F8
_020319A0:
	add r1, sp, #0
	bl sub_020063F4
	tst r6, #8
	beq _020319D4
	ldrh r0, [sp, #4]
	tst r0, #0x100
	beq _020319D4
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x4000
	tst r0, #0x80
	orrne r5, r5, #0x8000
	b _020319E8
_020319D4:
	ldrh r0, [sp]
	tst r0, #0x40
	orrne r5, r5, #0x10
	tst r0, #0x80
	orrne r5, r5, #0x20
_020319E8:
	tst r0, #0x20
	orrne r5, r5, #0x40
	tst r0, #0x10
	orrne r5, r5, #0x80
_020319F8:
	ldrh r0, [sp, #4]
	tst r0, #0x200
	orrne r5, r5, #4
	tst r0, #0x100
	orrne r5, r5, #8
	cmp r4, #0
	beq _02031A30
	bl sub_0204AE60
	cmp r0, #0
	mov r0, r4
	beq _02031A2C
	bl GetReleasedStylus
	b _02031A30
_02031A2C:
	bl sub_02006BFC
_02031A30:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02031914

	arm_func_start sub_02031A3C
sub_02031A3C: ; 0x02031A3C
	stmdb sp!, {r3, lr}
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02031A3C

	arm_func_start sub_02031A5C
sub_02031A5C: ; 0x02031A5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02031A5C

	arm_func_start CalcMenuHeightDiv8__02031AA4
CalcMenuHeightDiv8__02031AA4: ; 0x02031AA4
	tst r0, #0x40000
	bne _02031ABC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_02031ABC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__02031AA4

	arm_func_start InitWindowInput
InitWindowInput: ; 0x02031AF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02031B28:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02031B28
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	str r1, [r7, #0xd0]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02031B90
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02031B98
_02031B90:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02031B98:
	mov r0, r7
	bl sub_02032754
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02031C2C
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02031C20
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02031C20:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02031C34
_02031C2C:
	mov r0, r7
	bl sub_02032894
_02031C34:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02031C4C
	ldr r1, [r6]
	mov r0, r7
	bl sub_02032684
_02031C4C:
	bl sub_02031908
	mov r1, #0
	strb r1, [r7, #0xf4]
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_02032984
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitWindowInput

	arm_func_start sub_02031C74
sub_02031C74: ; 0x02031C74
	ldr r2, [r0, #0x10]
	orr r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C74

	arm_func_start sub_02031C84
sub_02031C84: ; 0x02031C84
	ldr r2, [r0, #0x10]
	mvn r1, r1
	and r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	arm_func_end sub_02031C84

	arm_func_start sub_02031C98
sub_02031C98: ; 0x02031C98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031DD4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031D18
	tst r1, #0x20000
	beq _02031D18
	tst r1, #0x2000000
	bne _02031D18
	tst sb, #8
	beq _02031D18
	tst sb, #0x10
	beq _02031D04
	mov r0, r8
	bl sub_0203280C
	b _02031D44
_02031D04:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020327E4
	b _02031D44
_02031D18:
	tst r1, #0x1000000
	bne _02031D44
	tst sb, #0x10
	beq _02031D34
	mov r0, r8
	bl sub_0203261C
	b _02031D44
_02031D34:
	tst sb, #0x20
	beq _02031D44
	mov r0, r8
	bl sub_020325AC
_02031D44:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031DBC
	tst r0, #0x20000
	bne _02031DBC
	tst r0, #0x2000000
	bne _02031DBC
	tst r0, #0x10000
	beq _02031D98
	tst sb, #8
	beq _02031D98
	tst sb, #0x40
	beq _02031D84
	mov r0, r8
	bl sub_02032864
	b _02031DBC
_02031D84:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_0203282C
	b _02031DBC
_02031D98:
	tst sb, #0x40
	beq _02031DAC
	mov r0, r8
	bl sub_0203280C
	b _02031DBC
_02031DAC:
	tst sb, #0x80
	beq _02031DBC
	mov r0, r8
	bl sub_020327E4
_02031DBC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031DDC
_02031DD4:
	mov sb, #0
	bl sub_02006BFC
_02031DDC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031E0C
	add ip, sp, #0
	mov r7, #2
_02031DF4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031DF4
	ldr r0, [ip]
	str r0, [r6]
_02031E0C:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _02031E2C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02031E78
_02031E2C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02031E44
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02031E44:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02031E74
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02031E74
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02031E78
_02031E74:
	mov r0, #0
_02031E78:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031C98

	arm_func_start sub_02031E80
sub_02031E80: ; 0x02031E80
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r8, r0
	mov r7, r1
	mov r6, r2
	cmp r3, #0
	ldr r4, [r8, #0xc8]
	ldr r5, [r8, #0xbc]
	add r0, sp, #0
	beq _02031FC4
	ldr r1, [r8, #0x10]
	bl sub_02031914
	ldr r1, [r8, #0x10]
	mov sb, r0
	tst r1, #0x8000
	beq _02031F00
	tst r1, #0x20000
	beq _02031F00
	tst r1, #0x2000000
	bne _02031F00
	tst sb, #8
	beq _02031F00
	tst sb, #0x10
	beq _02031EEC
	mov r0, r8
	bl sub_0203280C
	b _02031F34
_02031EEC:
	tst sb, #0x20
	beq _02031F34
	mov r0, r8
	bl sub_020327E4
	b _02031F34
_02031F00:
	tst r1, #0x1000000
	bne _02031F34
	tst sb, #0x10
	beq _02031F20
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_02032654
	b _02031F34
_02031F20:
	tst sb, #0x20
	beq _02031F34
	ldr r1, [sp, #0x40]
	mov r0, r8
	bl sub_020325E8
_02031F34:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02031FAC
	tst r0, #0x20000
	bne _02031FAC
	tst r0, #0x2000000
	bne _02031FAC
	tst r0, #0x10000
	beq _02031F88
	tst sb, #8
	beq _02031F88
	tst sb, #0x40
	beq _02031F74
	mov r0, r8
	bl sub_02032864
	b _02031FAC
_02031F74:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_0203282C
	b _02031FAC
_02031F88:
	tst sb, #0x40
	beq _02031F9C
	mov r0, r8
	bl sub_0203280C
	b _02031FAC
_02031F9C:
	tst sb, #0x80
	beq _02031FAC
	mov r0, r8
	bl sub_020327E4
_02031FAC:
	ldr r0, [r8, #0x10]
	tst r0, #1
	biceq sb, sb, #1
	tst r0, #2
	biceq sb, sb, #2
	b _02031FCC
_02031FC4:
	mov sb, #0
	bl sub_02006BFC
_02031FCC:
	cmp r7, #0
	strne sb, [r7]
	cmp r6, #0
	beq _02031FFC
	add ip, sp, #0
	mov r7, #2
_02031FE4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _02031FE4
	ldr r0, [ip]
	str r0, [r6]
_02031FFC:
	ldr r0, [r8, #0xc8]
	cmp r4, r0
	beq _0203201C
	mov r0, r8
	mov r1, #4
	bl PlayWindowInputSound
	mov r0, #1
	b _02032068
_0203201C:
	ldr r0, [r8, #0xbc]
	cmp r5, r0
	beq _02032034
	mov r0, r8
	mov r1, #3
	bl PlayWindowInputSound
_02032034:
	ldr r0, [r8, #0xd8]
	cmp r0, #0
	ble _02032064
	subs r0, r0, #1
	str r0, [r8, #0xd8]
	bne _02032064
	mvn r0, #0
	str r0, [r8, #0xdc]
	mov r0, #0
	str r0, [r8, #0xe0]
	mov r0, #1
	b _02032068
_02032064:
	mov r0, #0
_02032068:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02031E80

	arm_func_start sub_02032070
sub_02032070: ; 0x02032070
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _020320A0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _020320A0
	mov r0, #1
	bx lr
_020320A0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032070

	arm_func_start sub_020320A8
sub_020320A8: ; 0x020320A8
	mov r2, #6
	str r2, [r0, #0xd8]
	str r1, [r0, #0xdc]
	mov r1, #0
	str r1, [r0, #0xe0]
	bx lr
	arm_func_end sub_020320A8

	arm_func_start sub_020320C0
sub_020320C0: ; 0x020320C0
	ldr r0, [r0, #0xdc]
	bx lr
	arm_func_end sub_020320C0

	arm_func_start sub_020320C8
sub_020320C8: ; 0x020320C8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_020320C8

	arm_func_start sub_020320EC
sub_020320EC: ; 0x020320EC
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r3, r2, #7
	str r3, [r0, #0xdc]
	mov r2, #0
	str r2, [r0, #0xe0]
	cmp r1, #0
	streq r3, [r0, #0xe8]
	streq r3, [r0, #0xe4]
	streq r3, [r0, #0xf0]
	streq r3, [r0, #0xec]
	bxeq lr
	ldr r3, [r1, #8]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xec]
	ldr r3, [r1, #0xc]
	ldr r2, [r0, #8]
	sub r2, r3, r2
	str r2, [r0, #0xf0]
	ldr r3, [r1]
	ldr r2, [r0]
	sub r2, r3, r2
	str r2, [r0, #0xe4]
	ldr r2, [r1, #4]
	ldr r1, [r0]
	sub r1, r2, r1
	str r1, [r0, #0xe8]
	bx lr
	arm_func_end sub_020320EC

	arm_func_start sub_02032160
sub_02032160: ; 0x02032160
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _020322A4
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _0203229C
_020321BC:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032298
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032288
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032288:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _020322A8
_02032298:
	add r6, r6, #1
_0203229C:
	cmp r6, r5
	blt _020321BC
_020322A4:
	mvn r0, #0
_020322A8:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032160

	arm_func_start sub_020322B0
sub_020322B0: ; 0x020322B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov sb, r1
	ldrh r1, [sb]
	mov r8, r2
	mov sl, r0
	tst r1, r8
	ldr r7, [sp, #0x38]
	beq _020323EC
	cmp r3, #0
	ldrge r0, [sl, #8]
	ldr r1, [sp, #0x30]
	ldrlt r0, [sl, #0xc]
	cmp r1, #0
	add r0, r0, r3
	str r0, [sp, #8]
	ldrgt r0, [sl, #8]
	mov r5, #0
	ldrle r0, [sl, #0xc]
	add r4, sp, #0
	add r1, r0, r1
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0xc]
	mov r6, r0, lsl #8
	b _020323E4
_02032314:
	mul r3, r5, r6
	add r0, r5, #1
	mul r2, r0, r6
	mov r0, r3, asr #7
	mov r1, r2, asr #7
	ldr ip, [sl, #0xb4]
	add r0, r3, r0, lsr #24
	ldr r3, [sl]
	add r0, ip, r0, asr #8
	add r0, r3, r0
	str r0, [sp]
	ldr r3, [sl, #0xb4]
	add r0, r2, r1, lsr #24
	ldr r1, [sl]
	add r0, r3, r0, asr #8
	add r0, r1, r0
	sub r3, r0, #2
	mov r0, sb
	mov r1, r8
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _020323E0
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _020323D8
	mov r0, #6
	str r0, [sl, #0xd8]
	sub r0, r0, #7
	str r0, [sl, #0xdc]
	mov r0, #0
	str r0, [sl, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #8]
	sub r0, r1, r0
	str r0, [sl, #0xf0]
	ldr r1, [sp]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sl]
	sub r0, r1, r0
	str r0, [sl, #0xe8]
_020323D8:
	mov r0, r5
	b _020323F0
_020323E0:
	add r5, r5, #1
_020323E4:
	cmp r5, r7
	blt _02032314
_020323EC:
	mvn r0, #0
_020323F0:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020322B0

	arm_func_start sub_020323F8
sub_020323F8: ; 0x020323F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032440
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032440
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032440:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020323F8

	arm_func_start IsMenuOptionActive
IsMenuOptionActive: ; 0x02032474
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _020324BC
	tst r1, #0x8000000
	bne _020324BC
	tst r1, #0x200
	beq _020324B4
	bl sub_02032578
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _020324BC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324B4:
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324BC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end IsMenuOptionActive

	arm_func_start sub_020324C4
sub_020324C4: ; 0x020324C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _02032504
	tst r1, #0x200
	beq _020324FC
	bl sub_02032578
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _02032504
	mov r0, #1
	ldmia sp!, {r4, pc}
_020324FC:
	mov r0, #1
	ldmia sp!, {r4, pc}
_02032504:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020324C4

	arm_func_start sub_0203250C
sub_0203250C: ; 0x0203250C
	ldr r3, [r0, #0x10]
	tst r3, #0x2000
	beq _02032530
	tst r1, #0x1000
	beq _02032530
	ldr r2, [r0, #0x88]
	cmp r2, #0
	moveq r0, #1
	bxeq lr
_02032530:
	tst r3, #0x4000
	beq _02032550
	tst r1, #0x2000
	beq _02032550
	ldr r0, [r0, #0x90]
	cmp r0, #0
	moveq r0, #1
	bxeq lr
_02032550:
	mov r0, #0
	bx lr
	arm_func_end sub_0203250C

	arm_func_start sub_02032558
sub_02032558: ; 0x02032558
	ldr r0, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032558

	arm_func_start sub_02032560
sub_02032560: ; 0x02032560
	ldr r0, [r0, #0xc8]
	bx lr
	arm_func_end sub_02032560

	arm_func_start sub_02032568
sub_02032568: ; 0x02032568
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02032568

	arm_func_start sub_02032578
sub_02032578: ; 0x02032578
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02032578

	arm_func_start sub_0203258C
sub_0203258C: ; 0x0203258C
	ldr r0, [r0, #0xd0]
	bx lr
	arm_func_end sub_0203258C

	arm_func_start sub_02032594
sub_02032594: ; 0x02032594
	ldr r0, [r0, #0xc0]
	bx lr
	arm_func_end sub_02032594

	arm_func_start sub_0203259C
sub_0203259C: ; 0x0203259C
	ldr r0, [r0, #0xc4]
	bx lr
	arm_func_end sub_0203259C

	arm_func_start sub_020325A4
sub_020325A4: ; 0x020325A4
	ldr r0, [r0, #0xcc]
	bx lr
	arm_func_end sub_020325A4

	arm_func_start sub_020325AC
sub_020325AC: ; 0x020325AC
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325AC

	arm_func_start sub_020325E8
sub_020325E8: ; 0x020325E8
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r2, [r0, #0xbc]
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0, #0xbc]
	subge r1, r1, #1
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020325E8

	arm_func_start sub_0203261C
sub_0203261C: ; 0x0203261C
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_0203261C

	arm_func_start sub_02032654
sub_02032654: ; 0x02032654
	mov r2, #1
	cmp r1, #0
	strb r2, [r0, #0xd4]
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	movmi r1, #0
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02032654

	arm_func_start sub_02032684
sub_02032684: ; 0x02032684
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #1
	strb r0, [r5, #0xd4]
	movs r4, r1
	ldr r0, [r5, #0x10]
	movmi r4, #0
	tst r0, #0x8000
	beq _020326E0
	ldr r0, [r5, #0xd0]
	ldr r1, [r5, #0xc4]
	cmp r4, r0
	subge r4, r0, #1
	mov r0, r4
	bl _s32_div_f
	str r0, [r5, #0xc8]
	ldr r1, [r5, #0xc4]
	mov r0, r4
	bl _s32_div_f
	mov r0, r5
	str r1, [r5, #0xbc]
	bl sub_02032754
	ldmia sp!, {r3, r4, r5, pc}
_020326E0:
	ldr r0, [r5, #0xc0]
	cmp r4, r0
	subge r0, r0, #1
	strge r0, [r5, #0xbc]
	strlt r4, [r5, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02032684

	arm_func_start sub_020326F8
sub_020326F8: ; 0x020326F8
	mov r3, #1
	cmp r1, #0
	movlt r1, #0
	strb r3, [r0, #0xd4]
	cmp r1, r2
	ldrge r1, [r0, #0xc0]
	subge r1, r1, #1
	str r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020326F8

	arm_func_start sub_0203271C
sub_0203271C: ; 0x0203271C
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_02032754
	ldr r0, [r4, #0xcc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	orrge r0, r0, #0x10000
	biclt r0, r0, #0x10000
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xbc]
	mov r0, r4
	bl sub_02032684
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203271C

	arm_func_start sub_02032754
sub_02032754: ; 0x02032754
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldr r1, [r4, #0xc8]
	sub r0, r0, #1
	cmp r1, r0
	strge r0, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032754

	arm_func_start sub_020327CC
sub_020327CC: ; 0x020327CC
	str r1, [r0, #0xd0]
	str r2, [r0, #0xc4]
	mov r1, #0
	str r1, [r0, #0xbc]
	str r1, [r0, #0xc8]
	bx lr
	arm_func_end sub_020327CC

	arm_func_start sub_020327E4
sub_020327E4: ; 0x020327E4
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _02032808 ; =sub_02032754
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032808: .word sub_02032754
	arm_func_end sub_020327E4

	arm_func_start sub_0203280C
sub_0203280C: ; 0x0203280C
	ldr r1, [r0, #0xc8]
	ldr ip, _02032828 ; =sub_02032754
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02032828: .word sub_02032754
	arm_func_end sub_0203280C

	arm_func_start sub_0203282C
sub_0203282C: ; 0x0203282C
	ldr r2, [r0, #0xcc]
	ldr r1, [r0, #0xc8]
	sub r2, r2, #1
	cmp r1, r2
	movge r1, #0
	strge r1, [r0, #0xc8]
	bge _02032858
	add r1, r1, #0xa
	cmp r1, r2
	movle r2, r1
	str r2, [r0, #0xc8]
_02032858:
	ldr ip, _02032860 ; =sub_02032754
	bx ip
	.align 2, 0
_02032860: .word sub_02032754
	arm_func_end sub_0203282C

	arm_func_start sub_02032864
sub_02032864: ; 0x02032864
	ldr r1, [r0, #0xc8]
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	suble r1, r1, #1
	strle r1, [r0, #0xc8]
	ble _02032888
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
_02032888:
	ldr ip, _02032890 ; =sub_02032754
	bx ip
	.align 2, 0
_02032890: .word sub_02032754
	arm_func_end sub_02032864

	arm_func_start sub_02032894
sub_02032894: ; 0x02032894
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _020328B4
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _020328D0
_020328B4:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_020328D0:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032894

	arm_func_start sub_020328D8
sub_020328D8: ; 0x020328D8
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_020328D8

	arm_func_start sub_020328F4
sub_020328F4: ; 0x020328F4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032910
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032910:
	mov r0, #0
	bx lr
	arm_func_end sub_020328F4

	arm_func_start sub_02032918
sub_02032918: ; 0x02032918
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032934
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032934:
	mov r0, #0
	bx lr
	arm_func_end sub_02032918

	arm_func_start sub_0203293C
sub_0203293C: ; 0x0203293C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02032958
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02032958:
	mov r0, #0
	bx lr
	arm_func_end sub_0203293C

	arm_func_start PlayWindowInputSound
PlayWindowInputSound: ; 0x02032960
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end PlayWindowInputSound

	arm_func_start sub_02032984
sub_02032984: ; 0x02032984
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_02032984

	arm_func_start sub_0203299C
sub_0203299C: ; 0x0203299C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_02033440
	mov r4, r0
	mov r0, r7
	mov r1, r6
	bl sub_020336FC
	cmp r4, r5
	movgt r5, r4
	cmp r0, r5
	movgt r5, r0
	add r1, r5, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0203299C

	arm_func_start CalcMenuHeightDiv8__020329E4
CalcMenuHeightDiv8__020329E4: ; 0x020329E4
	tst r0, #0x40000
	bne _020329FC
	ldr ip, [r2]
	ldr r2, [r3]
	cmp r2, ip
	strgt ip, [r3]
_020329FC:
	tst r0, #0x400
	ldrne ip, [r1, #4]
	ldr r2, [r3]
	moveq ip, #0xe
	mul r3, r2, ip
	tst r0, #0x800
	ldrne r1, [r1, #0xc]
	addne r3, r3, r1
	tst r0, #0x1000
	addne r3, r3, #0x10
	add r1, r3, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	bx lr
	arm_func_end CalcMenuHeightDiv8__020329E4

	arm_func_start InitInventoryMenuInput
InitInventoryMenuInput: ; 0x02032A38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r6, r2
	tst sb, #0x400
	ldrne r4, [r6, #4]
	mov r7, r0
	mov r5, r3
	moveq r4, #0xe
	mov r8, r6
	str sb, [r7, #0x10]
	add lr, r7, #0x14
	mov ip, #9
_02032A68:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02032A68
	ldmia r8, {r0, r1}
	stmia lr, {r0, r1}
	ldmia r5, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, #0
	str r0, [r7, #0xbc]
	str r0, [r7, #0xc8]
	tst sb, #0x200
	ldrne r0, [r6, #0x60]
	ldr r1, [sp, #0x20]
	str r0, [r7, #0xac]
	ldrb r0, [sp, #0x28]
	str r1, [r7, #0xd0]
	strb r0, [r7, #0xd5]
	ldr r0, [r7, #0x10]
	tst r0, #0x8000
	beq _02032AD8
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movle r0, #1
	str r0, [r7, #0xc4]
	mov r0, #1
	str r0, [r7, #0xcc]
	b _02032AE0
_02032AD8:
	str r1, [r7, #0xc0]
	str r1, [r7, #0xc4]
_02032AE0:
	mov r0, r7
	bl sub_020331D4
	ldr r0, [r7, #0xcc]
	mov r3, #0
	cmp r0, #0xa
	ldrge r0, [r7, #0x10]
	orrge r0, r0, #0x10000
	strge r0, [r7, #0x10]
	str r3, [r7, #0xb0]
	ldr r0, [r7, #0x10]
	tst r0, #0x800
	ldrne r3, [r6, #0xc]
	str r3, [r7, #0xb4]
	ldmia r5, {r1, r2}
	ldr r0, [r7, #0x10]
	sub r1, r2, r1
	sub r1, r1, r3
	mov r3, #0
	tst r0, #0x1000
	subne r1, r1, #0x10
	strb r3, [r7, #0xd4]
	cmp r4, #0
	ble _02032B74
	ldr r0, [r7, #0x10]
	tst r0, #0x80000
	bne _02032B68
	ldr r0, [r7, #0xc4]
	ldr r2, [r7, #0xb4]
	mul r0, r4, r0
	sub r0, r1, r0
	add r0, r0, r0, lsr #31
	adds r0, r2, r0, asr #1
	str r0, [r7, #0xb4]
	strmi r3, [r7, #0xb4]
_02032B68:
	mov r0, r4, lsl #8
	str r0, [r7, #0xb8]
	b _02032B7C
_02032B74:
	mov r0, r7
	bl sub_0203330C
_02032B7C:
	ldr r0, [r7, #0x10]
	tst r0, #0x20
	beq _02032B94
	ldr r1, [r6]
	mov r0, r7
	bl sub_020330EC
_02032B94:
	bl sub_02031908
	mov r1, #0
	str r1, [r7, #0xd8]
	sub r0, r1, #1
	str r0, [r7, #0xdc]
	mov r0, r7
	str r1, [r7, #0xe0]
	bl sub_020333FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end InitInventoryMenuInput

	arm_func_start sub_02032BB8
sub_02032BB8: ; 0x02032BB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x24
	mov sb, r0
	mov r6, r3
	mov r8, r1
	mov r7, r2
	ldr r4, [sb, #0xc8]
	ldr r5, [sb, #0xbc]
	bl sub_02033414
	mov sl, r0
	cmp r6, #0
	add r0, sp, #0
	beq _02032D04
	ldr r1, [sb, #0x10]
	bl sub_02031914
	ldr r1, [sb, #0x10]
	mov r6, r0
	tst r1, #0x8000
	beq _02032C44
	tst r1, #0x20000
	beq _02032C44
	tst r1, #0x2000000
	bne _02032C44
	tst r6, #8
	beq _02032C44
	tst r6, #0x10
	beq _02032C30
	mov r0, sb
	bl sub_020332AC
	b _02032C74
_02032C30:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033284
	b _02032C74
_02032C44:
	tst r1, #0x1000000
	cmpeq sl, #0
	bne _02032C74
	tst r6, #0x10
	beq _02032C64
	mov r0, sb
	bl sub_020330B4
	b _02032C74
_02032C64:
	tst r6, #0x20
	beq _02032C74
	mov r0, sb
	bl sub_02033078
_02032C74:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _02032CEC
	tst r0, #0x20000
	bne _02032CEC
	tst r0, #0x2000000
	bne _02032CEC
	tst r0, #0x10000
	beq _02032CC8
	tst r6, #8
	beq _02032CC8
	tst r6, #0x40
	beq _02032CB4
	mov r0, sb
	bl sub_020332F0
	b _02032CEC
_02032CB4:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_020332CC
	b _02032CEC
_02032CC8:
	tst r6, #0x40
	beq _02032CDC
	mov r0, sb
	bl sub_020332AC
	b _02032CEC
_02032CDC:
	tst r6, #0x80
	beq _02032CEC
	mov r0, sb
	bl sub_02033284
_02032CEC:
	ldr r0, [sb, #0x10]
	tst r0, #1
	biceq r6, r6, #1
	tst r0, #2
	biceq r6, r6, #2
	b _02032D0C
_02032D04:
	mov r6, #0
	bl sub_02006BFC
_02032D0C:
	cmp r8, #0
	strne r6, [r8]
	cmp r7, #0
	beq _02032D3C
	add r8, sp, #0
	mov r6, #2
_02032D24:
	ldmia r8!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	subs r6, r6, #1
	bne _02032D24
	ldr r0, [r8]
	str r0, [r7]
_02032D3C:
	ldr r0, [sb, #0xc8]
	cmp r4, r0
	beq _02032D5C
	mov r0, sb
	mov r1, #4
	bl sub_020333D8
	mov r0, #1
	b _02032DA8
_02032D5C:
	ldr r0, [sb, #0xbc]
	cmp r5, r0
	beq _02032D74
	mov r0, sb
	mov r1, #3
	bl sub_020333D8
_02032D74:
	ldr r0, [sb, #0xd8]
	cmp r0, #0
	ble _02032DA4
	subs r0, r0, #1
	str r0, [sb, #0xd8]
	bne _02032DA4
	mvn r0, #0
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	mov r0, #1
	b _02032DA8
_02032DA4:
	mov r0, #0
_02032DA8:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_02032BB8

	arm_func_start sub_02032DB0
sub_02032DB0: ; 0x02032DB0
	ldr r1, [r0, #0xd8]
	cmp r1, #0
	ble _02032DE0
	subs r1, r1, #1
	str r1, [r0, #0xd8]
	mvneq r1, #0
	streq r1, [r0, #0xdc]
	moveq r1, #0
	streq r1, [r0, #0xe0]
	beq _02032DE0
	mov r0, #1
	bx lr
_02032DE0:
	mov r0, #0
	bx lr
	arm_func_end sub_02032DB0

	arm_func_start sub_02032DE8
sub_02032DE8: ; 0x02032DE8
	mov r2, #6
	str r2, [r0, #0xd8]
	sub r2, r2, #7
	str r1, [r0, #0xe0]
	str r2, [r0, #0xe8]
	str r2, [r0, #0xe4]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xec]
	bx lr
	arm_func_end sub_02032DE8

	arm_func_start sub_02032E0C
sub_02032E0C: ; 0x02032E0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r8, r1
	ldrh r1, [r8]
	mov r7, r2
	mov sb, r0
	tst r1, r7
	beq _02032F50
	cmp r3, #0
	ldrge r0, [sb, #8]
	ldr r5, [sb, #0xc0]
	ldrlt r0, [sb, #0xc]
	ldr r1, [sp, #0x30]
	add r0, r0, r3
	str r0, [sp, #8]
	cmp r1, #0
	ldrgt r0, [sb, #8]
	mov r6, #0
	ldrle r0, [sb, #0xc]
	add r4, sp, #0
	add r0, r0, r1
	str r0, [sp, #0xc]
	b _02032F48
_02032E68:
	ldr r0, [sb, #0xb8]
	ldr r2, [sb, #0xb4]
	mul r1, r6, r0
	mov r0, r1, asr #7
	add r0, r1, r0, lsr #24
	ldr r1, [sb]
	add r0, r2, r0, asr #8
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sb, #0xb8]
	add r1, r6, #1
	mul r2, r1, r0
	mov r0, r2, asr #7
	ldr r1, [sb, #0xb4]
	add r0, r2, r0, lsr #24
	ldr r2, [sb]
	add r0, r1, r0, asr #8
	add r0, r2, r0
	sub r3, r0, #2
	mov r0, r8
	mov r1, r7
	mov r2, r4
	str r3, [sp, #4]
	bl sub_02006C8C
	cmp r0, #0
	beq _02032F44
	ldrb r0, [sp, #0x34]
	cmp r0, #0
	beq _02032F34
	mov r0, #6
	str r0, [sb, #0xd8]
	sub r0, r0, #7
	str r0, [sb, #0xdc]
	mov r0, #0
	str r0, [sb, #0xe0]
	ldr r1, [sp, #8]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xec]
	ldr r1, [sp, #0xc]
	ldr r0, [sb, #8]
	sub r0, r1, r0
	str r0, [sb, #0xf0]
	ldr r1, [sp]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe4]
	ldr r1, [sp, #4]
	ldr r0, [sb]
	sub r0, r1, r0
	str r0, [sb, #0xe8]
_02032F34:
	ldr r1, [sb, #0xc8]
	ldr r0, [sb, #0xc4]
	mla r0, r1, r0, r6
	b _02032F54
_02032F44:
	add r6, r6, #1
_02032F48:
	cmp r6, r5
	blt _02032E68
_02032F50:
	mvn r0, #0
_02032F54:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_02032E0C

	arm_func_start sub_02032F5C
sub_02032F5C: ; 0x02032F5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r4, r0
	mov r6, r2
	mov r5, r3
	tst r7, #0x2000
	mov r0, #0
	beq _02032FA4
	ldr r1, [r4, #0x10]
	tst r1, #0x40
	ldrne r3, [r4, #0x78]
	cmpne r3, #0
	beq _02032FA4
	ldr r0, [r4, #0x7c]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
_02032FA4:
	tst r7, #0x1000
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x10]
	tst r1, #0x80
	ldrne r3, [r4, #0x80]
	cmpne r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x84]
	mov r1, r6
	mov r2, r5
	blx r3
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02032F5C

	arm_func_start sub_02032FD8
sub_02032FD8: ; 0x02032FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	tst r1, #1
	beq _0203304C
	tst r1, #0x8000000
	bne _0203304C
	tst r1, #0x200
	beq _02033044
	bl sub_02033414
	cmp r0, #0
	bne _02033028
	mov r0, r4
	bl sub_02033064
	ldr r1, [r4, #0xac]
	ldrb r0, [r1, r0]
	tst r0, #1
	bne _0203304C
	mov r0, #1
	ldmia sp!, {r4, pc}
_02033028:
	ldr r0, [r4, #0xac]
	ldrb r0, [r0, #0x7f]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_02033044:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203304C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02032FD8

	arm_func_start sub_02033054
sub_02033054: ; 0x02033054
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mul r0, r1, r0
	bx lr
	arm_func_end sub_02033054

	arm_func_start sub_02033064
sub_02033064: ; 0x02033064
	ldr r2, [r0, #0xbc]
	ldr r1, [r0, #0xc8]
	ldr r0, [r0, #0xc4]
	mla r0, r1, r0, r2
	bx lr
	arm_func_end sub_02033064

	arm_func_start sub_02033078
sub_02033078: ; 0x02033078
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	add r2, r1, #1
	str r2, [r0, #0xbc]
	ldr r1, [r0, #0xc0]
	cmp r2, r1
	movge r1, #0
	strge r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_02033078

	arm_func_start sub_020330B4
sub_020330B4: ; 0x020330B4
	mov r1, #1
	strb r1, [r0, #0xd4]
	ldr r1, [r0, #0xc0]
	cmp r1, #0
	movle r1, #0
	strle r1, [r0, #0xbc]
	bxle lr
	ldr r1, [r0, #0xbc]
	subs r1, r1, #1
	str r1, [r0, #0xbc]
	ldrmi r1, [r0, #0xc0]
	submi r1, r1, #1
	strmi r1, [r0, #0xbc]
	bx lr
	arm_func_end sub_020330B4

	arm_func_start sub_020330EC
sub_020330EC: ; 0x020330EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #1
	strb r0, [r4, #0xd4]
	movs r5, r1
	ldr r0, [r4, #0x10]
	movmi r5, #0
	tst r0, #0x8000
	beq _02033194
	ldr r1, [r4, #0xd0]
	cmp r5, r1
	blt _02033168
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	beq _02033140
	ldr r1, [r4, #0xcc]
	mov r0, #0
	sub r1, r1, #1
	str r1, [r4, #0xc8]
	str r0, [r4, #0xbc]
	b _02033188
_02033140:
	sub r5, r1, #1
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
	b _02033188
_02033168:
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r0, [r4, #0xc8]
	ldr r1, [r4, #0xc4]
	mov r0, r5
	bl _s32_div_f
	str r1, [r4, #0xbc]
_02033188:
	mov r0, r4
	bl sub_020331D4
	ldmia sp!, {r3, r4, r5, pc}
_02033194:
	ldr r0, [r4, #0xc0]
	cmp r5, r0
	subge r0, r0, #1
	strge r0, [r4, #0xbc]
	strlt r5, [r4, #0xbc]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020330EC

	arm_func_start sub_020331AC
sub_020331AC: ; 0x020331AC
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #0xd0]
	bl sub_020331D4
	mov r0, r4
	bl sub_02033064
	mov r1, r0
	mov r0, r4
	bl sub_020330EC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331AC

	arm_func_start sub_020331D4
sub_020331D4: ; 0x020331D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	tst r0, #0x8000
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc4]
	ldr r0, [r4, #0xd0]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	str r0, [r4, #0xcc]
	ldrb r0, [r4, #0xd5]
	cmp r0, #0
	ldrne r0, [r4, #0xcc]
	addne r0, r0, #1
	strne r0, [r4, #0xcc]
	ldr r1, [r4, #0xcc]
	ldr r0, [r4, #0xc8]
	sub r1, r1, #1
	cmp r0, r1
	strge r1, [r4, #0xc8]
	ldr r1, [r4, #0xc8]
	ldr r0, [r4, #0xc4]
	ldr r2, [r4, #0xd0]
	mul r0, r1, r0
	sub r1, r2, r0
	str r1, [r4, #0xc0]
	ldr r0, [r4, #0xc4]
	cmp r1, r0
	strgt r0, [r4, #0xc0]
	mov r0, r4
	bl sub_02033414
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xbc]
	movne r0, #1
	strne r0, [r4, #0xc0]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0xc0]
	ldr r0, [r4, #0xbc]
	sub r1, r1, #1
	cmp r0, r1
	strgt r1, [r4, #0xbc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020331D4

	arm_func_start sub_02033284
sub_02033284: ; 0x02033284
	ldr r1, [r0, #0xcc]
	ldr r2, [r0, #0xc8]
	sub r1, r1, #1
	cmp r2, r1
	movge r1, #0
	addlt r1, r2, #1
	ldr ip, _020332A8 ; =sub_020331D4
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332A8: .word sub_020331D4
	arm_func_end sub_02033284

	arm_func_start sub_020332AC
sub_020332AC: ; 0x020332AC
	ldr r1, [r0, #0xc8]
	ldr ip, _020332C8 ; =sub_020331D4
	cmp r1, #0
	ldrle r1, [r0, #0xcc]
	sub r1, r1, #1
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332C8: .word sub_020331D4
	arm_func_end sub_020332AC

	arm_func_start sub_020332CC
sub_020332CC: ; 0x020332CC
	ldr r2, [r0, #0xc8]
	ldr r1, [r0, #0xcc]
	add r2, r2, #0xa
	cmp r2, r1
	subge r2, r1, #1
	ldr ip, _020332EC ; =sub_020331D4
	str r2, [r0, #0xc8]
	bx ip
	.align 2, 0
_020332EC: .word sub_020331D4
	arm_func_end sub_020332CC

	arm_func_start sub_020332F0
sub_020332F0: ; 0x020332F0
	ldr r1, [r0, #0xc8]
	ldr ip, _02033308 ; =sub_020331D4
	subs r1, r1, #0xa
	movmi r1, #0
	str r1, [r0, #0xc8]
	bx ip
	.align 2, 0
_02033308: .word sub_020331D4
	arm_func_end sub_020332F0

	arm_func_start sub_0203330C
sub_0203330C: ; 0x0203330C
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	ble _0203332C
	mov r0, r1, lsl #8
	ldr r1, [r4, #0xc4]
	bl _s32_div_f
	b _02033348
_0203332C:
	ldr r0, [r4, #0xb4]
	ldmia r4, {r1, r2}
	sub r1, r2, r1
	sub r0, r1, r0
	ldr r1, [r4, #0xc4]
	mov r0, r0, lsl #8
	bl _s32_div_f
_02033348:
	str r0, [r4, #0xb8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0203330C

	arm_func_start sub_02033350
sub_02033350: ; 0x02033350
	ldr r2, [r0, #0xb8]
	ldr r3, [r0, #0xb4]
	mul r2, r1, r2
	mov r0, r2, asr #7
	add r0, r2, r0, lsr #24
	add r0, r3, r0, asr #8
	bx lr
	arm_func_end sub_02033350

	arm_func_start sub_0203336C
sub_0203336C: ; 0x0203336C
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _02033388
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_02033388:
	mov r0, #0
	bx lr
	arm_func_end sub_0203336C

	arm_func_start sub_02033390
sub_02033390: ; 0x02033390
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333AC
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333AC:
	mov r0, #0
	bx lr
	arm_func_end sub_02033390

	arm_func_start sub_020333B4
sub_020333B4: ; 0x020333B4
	ldr r1, [r0, #0x10]
	tst r1, #0x8000
	beq _020333D0
	ldr r0, [r0, #0xcc]
	cmp r0, #1
	movgt r0, #1
	bxgt lr
_020333D0:
	mov r0, #0
	bx lr
	arm_func_end sub_020333B4

	arm_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x10]
	tst r0, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	bl PlaySeVolumeWrapper
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020333D8

	arm_func_start sub_020333FC
sub_020333FC: ; 0x020333FC
	mvn r1, #0
	str r1, [r0, #0xe8]
	str r1, [r0, #0xf0]
	str r1, [r0, #0xe4]
	str r1, [r0, #0xec]
	bx lr
	arm_func_end sub_020333FC

	arm_func_start sub_02033414
sub_02033414: ; 0x02033414
	ldrb r1, [r0, #0xd5]
	cmp r1, #0
	beq _02033438
	ldr r1, [r0, #0xc8]
	ldr r2, [r0, #0xcc]
	add r0, r1, #1
	cmp r2, r0
	moveq r0, #1
	bxeq lr
_02033438:
	mov r0, #0
	bx lr
	arm_func_end sub_02033414

	arm_func_start sub_02033440
sub_02033440: ; 0x02033440
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	mov r5, r0
	tst r5, #0x800
	mov r4, #0
	beq _02033498
	ldrh r2, [r1, #8]
	cmp r2, #0
	moveq r0, r4
	beq _02033488
	ldr r3, _020334A4 ; =0x0000C402
	add ip, r1, #0x10
	add r0, sp, #4
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r0, sp, #4
	bl sub_020265A8
_02033488:
	tst r5, #0x8000
	addne r0, r0, #0x40
	cmp r0, #0
	movgt r4, r0
_02033498:
	mov r0, r4
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020334A4: .word 0x0000C402
	arm_func_end sub_02033440

	arm_func_start sub_020334A8
sub_020334A8: ; 0x020334A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r0, [r5, #0x10]
	mov r4, r1
	tst r0, #0x800
	beq _02033598
	ldrh r2, [r5, #0x1c]
	cmp r2, #0
	beq _020334FC
	ldr r3, _020335A0 ; =0x0000C402
	add ip, r5, #0x24
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
_020334FC:
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_020328F4
	cmp r0, #0
	beq _02033598
	mov r0, r5
	bl sub_02032560
	add r1, r0, #1
	mov r0, r5
	str r1, [sp, #0x28]
	bl sub_020325A4
	str r0, [sp, #0x2c]
	add r1, sp, #4
	str r1, [sp]
	ldr r2, _020335A4 ; =_0209AFC4
	ldr r3, _020335A0 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov ip, r0
	ldr r3, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r3, r1
	mov r2, #0
	sub r1, r1, ip
	add r3, sp, #0x54
	bl DrawTextInWindow
_02033598:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020335A0: .word 0x0000C402
_020335A4: .word _0209AFC4
	arm_func_end sub_020334A8

	arm_func_start sub_020335A8
sub_020335A8: ; 0x020335A8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x154
	mov r5, r0
	ldr r2, [r5, #0x10]
	mov r4, r1
	tst r2, #0x800
	beq _020336E8
	bl sub_02033414
	cmp r0, #0
	beq _02033610
	ldr r3, _020336F0 ; =0x000008E3
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl sub_02026268
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	b _020336E8
_02033610:
	add r0, r5, #0x24
	str r0, [sp]
	ldrh r2, [r5, #0x1c]
	ldr r3, _020336F4 ; =0x0000C402
	add r0, sp, #0x54
	mov r1, #0x100
	bl PreprocessStringFromId
	add r3, sp, #0x54
	mov r0, r4
	mov r1, #8
	mov r2, #0
	bl DrawTextInWindow
	mov r0, #0x17
	str r0, [sp]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	mov r0, r4
	sub r1, r2, r1
	sub r3, r1, #4
	mov r1, #2
	mov r2, #0xd
	bl sub_02025D50
	mov r0, r5
	bl sub_0203336C
	cmp r0, #0
	beq _020336E8
	ldr r0, [r5, #0xc8]
	ldr r2, _020336F8 ; =_0209AFC4
	add r0, r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r5, #0xd5]
	ldr r3, _020336F4 ; =0x0000C402
	add ip, sp, #4
	cmp r0, #0
	movne r1, #1
	ldr r0, [r5, #0xcc]
	moveq r1, #0
	sub r0, r0, r1
	str r0, [sp, #0x2c]
	add r0, sp, #0x54
	mov r1, #0x100
	str ip, [sp]
	bl PreprocessString
	add r0, sp, #0x54
	bl sub_020265A8
	mov r2, r0
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	add r3, sp, #0x54
	sub r1, r1, r0
	sub r1, r1, r2
	mov r0, r4
	mov r2, #0
	bl DrawTextInWindow
_020336E8:
	add sp, sp, #0x154
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
_020336F0: .word 0x00001D3B
#else
_020336F0: .word 0x000008E3
#endif
_020336F4: .word 0x0000C402
_020336F8: .word _0209AFC4
	arm_func_end sub_020335A8

	arm_func_start sub_020336FC
sub_020336FC: ; 0x020336FC
	tst r0, #0x1000
	mov r1, #0
	beq _02033750
	mov r2, #4
	tst r0, #0x2000
	addne r2, r2, #0x12
	tst r0, #0x4000
	addne r2, r2, #0x14
	tst r0, #0x20000
	addne r2, r2, #0x1f
	bne _02033738
	tst r0, #0x8000
	addne r2, r2, #0x3e
	tst r0, #8
	addne r2, r2, #0x1f
_02033738:
	tst r0, #4
	addne r2, r2, #0x12
	tst r0, #2
	addne r2, r2, #0x12
	cmp r2, #0
	movgt r1, r2
_02033750:
	mov r0, r1
	bx lr
	arm_func_end sub_020336FC

	arm_func_start sub_02033758
sub_02033758: ; 0x02033758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	ldrb r0, [sb, #0xf4]
	mov r8, r1
	ldr r1, [sb, #0x10]
	cmp r0, #0
	ldrne r0, _02033BBC ; =0x00001002
	mov r7, r2
	moveq r0, #2
	mov r0, r0, lsl #0x10
	mov r4, #0
	tst r1, #0x1000
	mov r5, r0, lsr #0x10
	beq _02033B98
	ldrh r0, [r7]
	tst r0, r5
	beq _02033B98
	ldmib sb, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [sb, #4]
	add r6, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sb, #0x10]
	tst r0, #0x2000
	beq _0203380C
	mov r0, #0x12
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r8]
	add r6, r6, #0x12
_0203380C:
	ldr r0, [sb, #0x10]
	tst r0, #0x4000
	beq _0203385C
	mov r0, #0x13
	str r6, [sp, #8]
	bl sub_02026594
	add r0, r6, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r8]
	add r6, r6, #0x14
_0203385C:
	ldr r0, [sb, #0x10]
	tst r0, #0x8000
	beq _020339C8
	tst r0, #0x20000
	bne _020339C8
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _020339C4
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _020338D4
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _020338D4
	mov r0, sb
	bl sub_02032864
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r8]
_020338D4:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x10000
	beq _0203392C
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _0203392C
	mov r0, sb
	bl sub_0203282C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r8]
_0203392C:
	add ip, r6, #0x1f
	add r3, r6, #0x2a
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033978
	mov r0, sb
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r8]
_02033978:
	add ip, r6, #0x2d
	add r3, r6, #0x38
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _020339C4
	mov r0, sb
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r8]
_020339C4:
	add r6, r6, #0x3e
_020339C8:
	ldr r0, [sb, #0x10]
	tst r0, #8
	bne _020339EC
	tst r0, #0x20000
	beq _02033AE0
	mov r0, sb
	bl sub_020328F4
	cmp r0, #0
	beq _02033AE0
_020339EC:
	add r0, r6, #0xb
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000000
	bne _02033A64
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033A64
	ldr r0, [r8]
	orr r0, r0, #0x40000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033A58
	bl sub_020327E4
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x4000
	str r0, [r8]
	b _02033A60
_02033A58:
	mov r1, #0
	bl PlayWindowInputSound
_02033A60:
	mov r4, #1
_02033A64:
	add r1, r6, #0xe
	add r0, r6, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sb, #0x10]
	tst r0, #0x40000000
	bne _02033AE0
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	bl sub_02006C8C
	cmp r0, #0
	beq _02033AE0
	ldr r0, [r8]
	orr r0, r0, #0x80000
	str r0, [r8]
	ldr r0, [sb, #0x10]
	tst r0, #0x20000
	mov r0, sb
	beq _02033AD4
	bl sub_0203280C
	mov r0, sb
	mov r1, #4
	bl PlayWindowInputSound
	ldr r0, [r8]
	orr r0, r0, #0x8000
	str r0, [r8]
	b _02033ADC
_02033AD4:
	mov r1, #0
	bl PlayWindowInputSound
_02033ADC:
	mov r4, #1
_02033AE0:
	ldr r1, [sb, #0xc]
	ldr r0, [sb, #0x10]
	add r6, r1, #4
	tst r0, #2
	beq _02033B2C
	sub r6, r6, #0x12
	add r3, r6, #0xb
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str r6, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r8]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r8]
_02033B2C:
	ldr r0, [sb, #0x10]
	tst r0, #4
	beq _02033B98
	sub ip, r6, #0x12
	sub r3, r6, #7
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02033B98
	ldr r0, [sb, #0x10]
	tst r0, #0x18000000
	ldreq r0, [r8]
	orreq r0, r0, #1
	orreq r0, r0, #0x10000
	streq r0, [r8]
	beq _02033B94
	ldr r1, [r8]
	mov r0, sb
	orr r2, r1, #0x10000
	mov r1, #2
	str r2, [r8]
	bl PlayWindowInputSound
_02033B94:
	mov r4, #1
_02033B98:
	ldr r1, [r8]
	cmp r1, #0
	beq _02033BB0
	mov r0, sb
	bl sub_020320C8
	mov r4, #1
_02033BB0:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02033BBC: .word 0x00001002
	arm_func_end sub_02033758

	arm_func_start sub_02033BC0
sub_02033BC0: ; 0x02033BC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02033ECC
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033C44
	tst r4, #0x1000000
	ldrne r3, _02033ED4 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _02033ED8 ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
	add r6, r6, #0x12
_02033C44:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02033C70
	tst r4, #0x2000000
	ldrne r3, _02033EDC ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02033EE0 ; =_0209AFF4
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	add r6, r6, #0x14
_02033C70:
	ldr r0, [r8, #0x10]
	tst r0, #0x8000
	beq _02033D74
	tst r0, #0x20000
	bne _02033D74
	mov r0, r8
	bl sub_020328F4
	cmp r0, #0
	beq _02033D70
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02033D08
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033CB8
	tst r4, #0x400000
	beq _02033CD4
_02033CB8:
	tst r4, #0x400000
	ldrne r3, _02033EE4 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _02033EE8 ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033CD4:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033CEC
	tst r4, #0x800000
	beq _02033D08
_02033CEC:
	tst r4, #0x800000
	ldrne r3, _02033EEC ; =_0209B00C
	mov r0, r7
	ldreq r3, _02033EF0 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033D08:
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	bne _02033D20
	tst r4, #0x100000
	beq _02033D3C
_02033D20:
	tst r4, #0x100000
	ldrne r3, _02033EF4 ; =_0209B01C
	mov r0, r7
	ldreq r3, _02033EF8 ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_02033D3C:
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	bne _02033D54
	tst r4, #0x200000
	beq _02033D70
_02033D54:
	tst r4, #0x200000
	ldrne r3, _02033EFC ; =_0209B02C
	mov r0, r7
	ldreq r3, _02033F00 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_02033D70:
	add r6, r6, #0x3e
_02033D74:
	ldr r1, [r8, #0x10]
	ldr r0, _02033F04 ; =0x00020008
	tst r1, r0
	beq _02033E40
	tst r4, #0x40000
	beq _02033DA4
	ldr r3, _02033F08 ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033DE0
_02033DA4:
	tst r1, #0x20000000
	bne _02033DE0
	tst r1, #8
	bne _02033DCC
	tst r1, #0x20000
	beq _02033DE0
	mov r0, r8
	bl sub_02032918
	cmp r0, #0
	beq _02033DE0
_02033DCC:
	ldr r3, _02033F0C ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033DE0:
	tst r4, #0x80000
	beq _02033E00
	ldr r3, _02033F10 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033E40
_02033E00:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02033E40
	tst r0, #8
	bne _02033E2C
	tst r0, #0x20000
	beq _02033E40
	mov r0, r8
	bl sub_0203293C
	cmp r0, #0
	beq _02033E40
_02033E2C:
	ldr r3, _02033F14 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_02033E40:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02033E7C
	tst r4, #0x20000
	ldrne r3, _02033F18 ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _02033F1C ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02033E7C:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02033ECC
	tst r0, #0x18000000
	beq _02033EB0
	tst r4, #0x10000
	ldrne r3, _02033F20 ; =_0209B06C
	mov r0, r7
	ldreq r3, _02033F24 ; =_0209B074
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02033ECC
_02033EB0:
	tst r4, #0x10000
	ldrne r3, _02033F28 ; =_0209B07C
	mov r0, r7
	ldreq r3, _02033F2C ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02033ECC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02033ED4: .word _0209AFDC
_02033ED8: .word _0209AFE4
_02033EDC: .word _0209AFEC
_02033EE0: .word _0209AFF4
_02033EE4: .word _0209AFFC
_02033EE8: .word _0209B004
_02033EEC: .word _0209B00C
_02033EF0: .word _0209B014
_02033EF4: .word _0209B01C
_02033EF8: .word _0209B024
_02033EFC: .word _0209B02C
_02033F00: .word _0209B034
_02033F04: .word 0x00020008
_02033F08: .word _0209B03C
_02033F0C: .word _0209B044
_02033F10: .word _0209B04C
_02033F14: .word _0209B054
_02033F18: .word _0209B05C
_02033F1C: .word _0209B064
_02033F20: .word _0209B06C
_02033F24: .word _0209B074
_02033F28: .word _0209B07C
_02033F2C: .word _0209B084
	arm_func_end sub_02033BC0

	arm_func_start sub_02033F30
sub_02033F30: ; 0x02033F30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	mov r6, r2
	tst r0, #0x1000
	mov r4, #0
	beq _0203433C
	ldrh r0, [r6]
	tst r0, #2
	beq _0203433C
	ldmib r8, {r0, r1}
	sub r0, r0, #0xf
	str r0, [sp]
	ldr r0, [r8, #4]
	add r5, r1, #4
	sub r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _02033FC8
	mov r0, #0x12
	str r5, [sp, #8]
	bl sub_02026594
	add r0, r5, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x1000
	orrne r0, r0, #0x1000000
	strne r0, [r7]
_02033FC8:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _0203401C
	add r1, r5, #0x12
	mov r0, #0x13
	str r1, [sp, #8]
	bl sub_02026594
	add r1, r5, #0x12
	add r0, r1, r0
	sub r3, r0, #1
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #0x2000
	orrne r0, r0, #0x2000000
	strne r0, [r7]
_0203401C:
	ldr r0, [r8, #0x10]
	add r5, r5, #0x26
	tst r0, #0x8000
	beq _0203418C
	tst r0, #0x20000
	bne _0203418C
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _02034188
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _02034098
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034098
	mov r0, r8
	bl sub_020332F0
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x400000
	str r0, [r7]
_02034098:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020340F0
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020340F0
	mov r0, r8
	bl sub_020332CC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x800000
	str r0, [r7]
_020340F0:
	add ip, r5, #0x1f
	add r3, r5, #0x2a
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _0203413C
	mov r0, r8
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x100000
	str r0, [r7]
_0203413C:
	add ip, r5, #0x2d
	add r3, r5, #0x38
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	beq _02034188
	mov r0, r8
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	mov r4, #1
	orr r0, r0, #0x200000
	str r0, [r7]
_02034188:
	add r5, r5, #0x3e
_0203418C:
	ldr r1, [r8, #0x10]
	ands r0, r1, #8
	beq _020342AC
	cmp r0, #0
	bne _020341B8
	tst r1, #0x20000
	beq _020342AC
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _020342AC
_020341B8:
	add r0, r5, #0xb
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _02034230
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _02034230
	ldr r0, [r7]
	orr r0, r0, #0x40000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _02034224
	bl sub_020332AC
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x4000
	str r0, [r7]
	b _0203422C
_02034224:
	mov r1, #0
	bl sub_020333D8
_0203422C:
	mov r4, #1
_02034230:
	add r1, r5, #0xe
	add r0, r5, #0x19
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000000
	bne _020342AC
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	bl sub_02006C8C
	cmp r0, #0
	beq _020342AC
	ldr r0, [r7]
	orr r0, r0, #0x80000
	str r0, [r7]
	ldr r0, [r8, #0x10]
	tst r0, #0x20000
	mov r0, r8
	beq _020342A0
	bl sub_02033284
	mov r0, r8
	mov r1, #4
	bl sub_020333D8
	ldr r0, [r7]
	orr r0, r0, #0x8000
	str r0, [r7]
	b _020342A8
_020342A0:
	mov r1, #0
	bl sub_020333D8
_020342A8:
	mov r4, #1
_020342AC:
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #0x10]
	add r5, r1, #4
	tst r0, #2
	beq _020342F8
	sub r5, r5, #0x12
	add r3, r5, #0xb
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str r5, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #2
	orrne r0, r0, #0x20000
	strne r0, [r7]
_020342F8:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _0203433C
	sub ip, r5, #0x12
	sub r3, r5, #7
	add r2, sp, #0
	mov r0, r6
	mov r1, #2
	str ip, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_02006C8C
	cmp r0, #0
	ldrne r0, [r7]
	movne r4, #1
	orrne r0, r0, #1
	orrne r0, r0, #0x10000
	strne r0, [r7]
_0203433C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02034354
	mov r0, r8
	bl sub_02032DE8
	mov r4, #1
_02034354:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_02033F30

	arm_func_start sub_02034360
sub_02034360: ; 0x02034360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x10]
	mov r7, r1
	tst r0, #0x1000
	ldr r4, [r8, #0xe0]
	beq _02034660
	ldmia r8, {r1, r2}
	mov r0, #0x17
	str r0, [sp]
	sub r0, r2, r1
	sub r5, r0, #0x10
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	mov r0, r7
	sub r1, r2, r1
	sub r3, r1, #4
	mov r2, r5
	mov r1, #2
	mov r6, #4
	bl sub_02025D50
	ldr r0, [r8, #0x10]
	tst r0, #0x2000
	beq _020343E0
	tst r4, #0x1000000
	ldrne r3, _02034668 ; =_0209AFDC
	mov r0, r7
	ldreq r3, _0203466C ; =_0209AFE4
	add r2, r5, #3
	mov r1, #4
	bl DrawTextInWindow
_020343E0:
	ldr r0, [r8, #0x10]
	tst r0, #0x4000
	beq _02034408
	tst r4, #0x2000000
	ldrne r3, _02034670 ; =_0209AFEC
	mov r0, r7
	ldreq r3, _02034674 ; =_0209AFF4
	add r2, r5, #3
	mov r1, #0x16
	bl DrawTextInWindow
_02034408:
	ldr r0, [r8, #0x10]
	add r6, r6, #0x26
	tst r0, #0x8000
	beq _02034510
	tst r0, #0x20000
	bne _02034510
	mov r0, r8
	bl sub_0203336C
	cmp r0, #0
	beq _0203450C
	ldr r0, [r8, #0x10]
	tst r0, #0x10000
	beq _020344A4
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _02034454
	tst r4, #0x400000
	beq _02034470
_02034454:
	tst r4, #0x400000
	ldrne r3, _02034678 ; =_0209AFFC
	mov r0, r7
	ldreq r3, _0203467C ; =_0209B004
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034470:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _02034488
	tst r4, #0x800000
	beq _020344A4
_02034488:
	tst r4, #0x800000
	ldrne r3, _02034680 ; =_0209B00C
	mov r0, r7
	ldreq r3, _02034684 ; =_0209B014
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020344A4:
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	bne _020344BC
	tst r4, #0x100000
	beq _020344D8
_020344BC:
	tst r4, #0x100000
	ldrne r3, _02034688 ; =_0209B01C
	mov r0, r7
	ldreq r3, _0203468C ; =_0209B024
	add r1, r6, #0x1f
	add r2, r5, #3
	bl DrawTextInWindow
_020344D8:
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	bne _020344F0
	tst r4, #0x200000
	beq _0203450C
_020344F0:
	tst r4, #0x200000
	ldrne r3, _02034690 ; =_0209B02C
	mov r0, r7
	ldreq r3, _02034694 ; =_0209B034
	add r1, r6, #0x2d
	add r2, r5, #3
	bl DrawTextInWindow
_0203450C:
	add r6, r6, #0x3e
_02034510:
	ldr r1, [r8, #0x10]
	ldr r0, _02034698 ; =0x00020008
	tst r1, r0
	beq _020345DC
	tst r4, #0x40000
	beq _02034540
	ldr r3, _0203469C ; =_0209B03C
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
	b _0203457C
_02034540:
	tst r1, #0x20000000
	bne _0203457C
	tst r1, #8
	bne _02034568
	tst r1, #0x20000
	beq _0203457C
	mov r0, r8
	bl sub_02033390
	cmp r0, #0
	beq _0203457C
_02034568:
	ldr r3, _020346A0 ; =_0209B044
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_0203457C:
	tst r4, #0x80000
	beq _0203459C
	ldr r3, _020346A4 ; =_0209B04C
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
	b _020345DC
_0203459C:
	ldr r0, [r8, #0x10]
	tst r0, #0x40000000
	bne _020345DC
	tst r0, #8
	bne _020345C8
	tst r0, #0x20000
	beq _020345DC
	mov r0, r8
	bl sub_020333B4
	cmp r0, #0
	beq _020345DC
_020345C8:
	ldr r3, _020346A8 ; =_0209B054
	mov r0, r7
	add r1, r6, #0xe
	add r2, r5, #3
	bl DrawTextInWindow
_020345DC:
	ldr r2, [r8, #0xc]
	ldr r1, [r8, #8]
	ldr r0, [r8, #0x10]
	sub r1, r2, r1
	tst r0, #2
	add r6, r1, #4
	beq _02034618
	tst r4, #0x20000
	ldrne r3, _020346AC ; =_0209B05C
	sub r6, r6, #0x12
	ldreq r3, _020346B0 ; =_0209B064
	mov r0, r7
	mov r1, r6
	add r2, r5, #3
	bl DrawTextInWindow
_02034618:
	ldr r0, [r8, #0x10]
	tst r0, #4
	beq _02034660
	tst r0, #0x18000000
	beq _02034644
	ldr r3, _020346B4 ; =_0209B074
	mov r0, r7
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
	b _02034660
_02034644:
	tst r4, #0x10000
	ldrne r3, _020346B8 ; =_0209B07C
	mov r0, r7
	ldreq r3, _020346BC ; =_0209B084
	sub r1, r6, #0x12
	add r2, r5, #3
	bl DrawTextInWindow
_02034660:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02034668: .word _0209AFDC
_0203466C: .word _0209AFE4
_02034670: .word _0209AFEC
_02034674: .word _0209AFF4
_02034678: .word _0209AFFC
_0203467C: .word _0209B004
_02034680: .word _0209B00C
_02034684: .word _0209B014
_02034688: .word _0209B01C
_0203468C: .word _0209B024
_02034690: .word _0209B02C
_02034694: .word _0209B034
_02034698: .word 0x00020008
_0203469C: .word _0209B03C
_020346A0: .word _0209B044
_020346A4: .word _0209B04C
_020346A8: .word _0209B054
_020346AC: .word _0209B05C
_020346B0: .word _0209B064
_020346B4: .word _0209B074
_020346B8: .word _0209B07C
_020346BC: .word _0209B084
	arm_func_end sub_02034360

	arm_func_start sub_020346C0
sub_020346C0: ; 0x020346C0
	stmdb sp!, {r4, lr}
	mov r0, #0xdc
	mov r1, #1
	bl MemAlloc
	mov r4, r0
	ldr ip, _02034708 ; =_020AFDB8
	ldr r0, _0203470C ; =_0209B08C
	str r4, [ip]
	add lr, r4, #0xc4
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	mov r1, #0
	str r1, [r4, #0xd4]
	ldr r0, [ip]
	strb r1, [r0, #0xd8]
	bl sub_02034710
	bl sub_020469BC
	ldmia sp!, {r4, pc}
	.align 2, 0
_02034708: .word _020AFDB8
_0203470C: .word _0209B08C
	arm_func_end sub_020346C0

	arm_func_start sub_02034710
sub_02034710: ; 0x02034710
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r1, _02034798 ; =_020AFDB8
	ldr r0, _0203479C ; =_0209B08C
	ldr r1, [r1]
	add r4, r1, #0xc4
	mov r1, r4
	bl sub_020347A0
	cmp r0, #0
	bne _0203473C
	bl sub_020347F0
_0203473C:
	ldr r0, _0203479C ; =_0209B08C
	add r7, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	ldr ip, _02034798 ; =_020AFDB8
	ldmia r7, {r0, r1, r2, r3}
	ldr r5, [ip]
	mov r6, #0
	stmia r5, {r0, r1, r2, r3}
	strb r6, [r5, #0x10]
	ldr r5, [ip]
	ldmia r7, {r0, r1, r2, r3}
	add lr, r5, #0x14
	stmia lr, {r0, r1, r2, r3}
	str r6, [r5, #0x24]
	ldr r0, [ip]
	strb r6, [r0, #0xc0]
	ldmia r7, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, [ip]
	str r6, [r0, #0xd4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02034798: .word _020AFDB8
_0203479C: .word _0209B08C
	arm_func_end sub_02034710

	arm_func_start sub_020347A0
sub_020347A0: ; 0x020347A0
	cmp r0, #0
	ldreq r0, _020347EC ; =_0209B08C
	cmp r1, #0
	ldreq r1, _020347EC ; =_0209B08C
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	ldreq r3, [r0, #4]
	ldreq r2, [r1, #4]
	cmpeq r3, r2
	ldreq r3, [r0, #8]
	ldreq r2, [r1, #8]
	cmpeq r3, r2
	ldreq r2, [r0, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020347EC: .word _0209B08C
	arm_func_end sub_020347A0

	arm_func_start sub_020347F0
sub_020347F0: ; 0x020347F0
	stmdb sp!, {r4, lr}
	ldr r0, _0203483C ; =_020AFDB8
	ldr r4, [r0]
	ldr r0, [r4, #0xcc]
	cmp r0, #0
	beq _0203480C
	blx r0
_0203480C:
	ldr r0, _0203483C ; =_020AFDB8
	ldr r0, [r0]
	ldrb r0, [r0, #0xd8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc4]
	bl UnloadOverlay
	ldr r0, _0203483C ; =_020AFDB8
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xd8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0203483C: .word _020AFDB8
	arm_func_end sub_020347F0

	arm_func_start sub_02034840
sub_02034840: ; 0x02034840
	stmdb sp!, {r4, lr}
	ldr r1, _020348DC ; =_020AFDB8
	mov r4, r0
	ldr r2, [r1]
	ldrb r1, [r2, #0x10]
	cmp r1, #0
	beq _02034894
	cmp r4, #0
	beq _0203487C
	add r1, r2, #0x14
	bl sub_020347A0
	cmp r0, #0
	beq _02034894
	mov r0, #1
	ldmia sp!, {r4, pc}
_0203487C:
	ldr r0, _020348E0 ; =_0209B08C
	add r1, r2, #0x14
	bl sub_020347A0
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_02034894:
	cmp r4, #0
	beq _020348B4
	ldr r1, _020348DC ; =_020AFDB8
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0xc4
	bl sub_020347A0
	ldmia sp!, {r4, pc}
_020348B4:
	ldr r1, _020348DC ; =_020AFDB8
	ldr r0, _020348E0 ; =_0209B08C
	ldr r1, [r1]
	add r1, r1, #0x14
	bl sub_020347A0
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_020348DC: .word _020AFDB8
_020348E0: .word _0209B08C
	arm_func_end sub_02034840
