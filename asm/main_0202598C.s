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
