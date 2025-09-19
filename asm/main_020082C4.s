	.include "asm/macros.inc"
	.include "main_020082C4.inc"

	.text

	arm_func_start FileClose
FileClose: ; 0x020082C4
	stmdb sp!, {r3, lr}
	bl sub_0207F70C
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	bl CardPullOutWithStatus
	ldmia sp!, {r3, pc}
	arm_func_end FileClose

	arm_func_start sub_020082E0
sub_020082E0: ; 0x020082E0
	ldr r0, _020082F0 ; =_020AF360
	mov r1, #2
	str r1, [r0]
	bx lr
	.align 2, 0
_020082F0: .word _020AF360
	arm_func_end sub_020082E0

	arm_func_start sub_020082F4
sub_020082F4: ; 0x020082F4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, _02008410 ; =_022A369C
	mov r1, #8
	bl sub_02002F34
	ldr r0, _02008414 ; =_020AF3E4
	bl sub_02002C40
	ldr r0, _02008414 ; =_020AF3E4
	mov r1, #8
	bl sub_02002CAC
	ldr r0, _02008414 ; =_020AF3E4
	bl sub_02002E98
	mov r1, #8
	ldr r0, _02008418 ; =_020AF490
	mov r2, r1
	bl sub_02002A9C
	ldr r0, _0200841C ; =_020AF53C
	mov r1, #8
	mov r2, #0
	bl sub_02002A9C
	ldr r0, _02008420 ; =_020AF42C
	bl sub_02002950
	ldr r0, _02008424 ; =_020AF408
	bl sub_02002C40
	ldr r0, _02008428 ; =_020AF5E8
	mov r1, #1
	mov r2, #0
	bl sub_02002A9C
	mov r0, #0x800
	sub r1, r0, #0xf3
	bl MemAlloc
	mov r6, r0
	ldr r0, _0200842C ; =_022A3698
	mov r7, #0
	ldr r4, _02008430 ; =_02092978
	str r6, [r0]
	mov r5, r7
_02008388:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	mov r3, r4
	bl sub_02008980
	add r7, r7, #1
	cmp r7, #8
	add r6, r6, #0x100
	blt _02008388
	mov r0, r8
	bl sub_02007004
	bl DebugPrintSystemClock
	bl sub_02007380
	bl sub_02007384
	ldr r0, _02008434 ; =_0209297C
	bl Debug_Print0
	bl sub_020073D8
	ldr r0, _02008438 ; =_0209299C
	bl Debug_Print0
	ldr r0, _0200843C ; =_020AF3D0
	ldr r1, _02008440 ; =0x0000070D
	ldr r0, [r0, #8]
	bl MemAlloc
	ldr r2, _0200843C ; =_020AF3D0
	ldr r1, _02008444 ; =_020AF3D0
	str r0, [r2, #4]
	ldr r0, _02008448 ; =_022A36C4
	mov r2, #0
	bl sub_02002778
	ldr r0, _02008424 ; =_020AF408
	bl sub_02002E98
	ldr r0, _02008448 ; =_022A36C4
	bl sub_020027E8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02008410: .word _022A369C
_02008414: .word _020AF3E4
_02008418: .word _020AF490
_0200841C: .word _020AF53C
_02008420: .word _020AF42C
_02008424: .word _020AF408
_02008428: .word _020AF5E8
_0200842C: .word _022A3698
_02008430: .word _02092978
_02008434: .word _0209297C
_02008438: .word _0209299C
_0200843C: .word _020AF3D0
_02008440: .word 0x0000070D
_02008444: .word _020AF3D0
_02008448: .word _022A36C4
	arm_func_end sub_020082F4

	arm_func_start sub_0200844C
sub_0200844C: ; 0x0200844C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02006ED4
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200844C

	arm_func_start sub_0200846C
sub_0200846C: ; 0x0200846C
	mov r2, #0
	str r2, [r0]
	sub r1, r2, #1
	stmib r0, {r1, r2}
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r1, #4
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_0200846C

	arm_func_start sub_02008490
sub_02008490: ; 0x02008490
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xb0
	ldr r0, _02008928 ; =_020AF408
	bl sub_02002CB4
	ldr r0, _0200892C ; =_02092908
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_020084B4:
	ldr r0, _02008930 ; =_022A369C
	add r1, sp, #0x20
	mov r2, #1
	bl sub_02002F98
	ldr r0, _02008934 ; =_020AF3E4
	bl sub_02002CB4
	ldr r1, [sp, #0x20]
	ldr r0, [r1]
	cmp r0, #1
	beq _020088F8
	ldr sb, [r1, #4]
	mov r1, #5
	add r0, sp, #0x24
	str r1, [sb, #0x24]
	bl sub_020075E8
	mov r6, #0
	add r1, sp, #0x24
	ldr r0, _02008934 ; =_020AF3E4
	str r1, [sb, #0x1c]
	mov r7, r6
	mov r8, r6
	bl sub_02002E98
	ldr r0, [sb, #0x20]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _02008894
_0200851C: ; jump table
	b _02008894 ; case 0
	b _02008894 ; case 1
	b _02008558 ; case 2
	b _020085BC ; case 3
	b _020085E0 ; case 4
	b _02008670 ; case 5
	b _0200868C ; case 6
	b _020086DC ; case 7
	b _02008724 ; case 8
	b _0200876C ; case 9
	b _020087B4 ; case 10
	b _020087F0 ; case 11
	b _02008834 ; case 12
	b _02008860 ; case 13
	b _02008880 ; case 14
_02008558:
	add r0, sp, #0x24
	mov r1, sb
	bl sub_020075F4
	movs r6, r0
	beq _02008894
	mov r1, r7
	ldr r0, _02008928 ; =_020AF408
	str r1, [sb, #0x24]
	bl sub_02002E98
	ldr r0, [sp, #0x20]
	bl sub_02008B78
	ldr r0, _02008938 ; =_020AF5E8
	bl sub_02002B7C
	add r0, sp, #0x24
	mov r1, sb
	bl sub_02007624
	cmp r0, #0
	beq _020085B4
	mov r1, r7
	str r1, [sb, #0x1c]
	ldr r0, _02008938 ; =_020AF5E8
	str r1, [sb, #0x24]
	bl sub_02002B20
_020085B4:
	mov sb, #0
	b _02008894
_020085BC:
	ldr r1, [sp, #0x20]
	mov r0, sb
	ldr r2, [r1, #0x10]
	ldr r3, [r1, #0xc]
	add r1, r1, #0x28
	mov r8, #1
	blx r3
	mov r6, r0
	b _02008894
_020085E0:
	ldr r5, [sp, #0x10]
	ldr r4, [sp, #0x14]
	add sl, sp, #0x18
	add fp, sp, #0x24
_020085F0:
	ldr r2, [sp, #0x20]
	mov r0, fp
	mov r1, sb
	mov r3, sl
	add r2, r2, #0x28
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	bl sub_020076E4
	movs r6, r0
	beq _020085F0
	cmp r6, #0
	beq _02008894
	mov r1, #0
	ldr r0, _02008928 ; =_020AF408
	str r1, [sb, #0x24]
	bl sub_02002E98
	ldr r0, [sp, #0x20]
	bl sub_02008B78
	ldr r0, _02008938 ; =_020AF5E8
	bl sub_02002B7C
	add r0, sp, #0x24
	mov r1, sb
	bl sub_02007774
	cmp r0, #0
	beq _02008668
	mov r1, #0
	str r1, [sb, #0x1c]
	ldr r0, _02008938 ; =_020AF5E8
	str r1, [sb, #0x24]
	bl sub_02002B20
_02008668:
	mov sb, #0
	b _02008894
_02008670:
	ldr r0, [sp, #0x20]
	ldr r4, [r0, #0x10]
	add r0, r0, #0x28
	bl sub_02007578
	str r0, [r4]
	mov r6, #1
	b _02008894
_0200868C:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	mov r1, sb
	add r2, r3, #0x28
	ldr r4, [r3, #0x10]
	bl sub_02007654
	cmp r0, #0
	beq _020086C4
	ldr r1, [sb]
	mov r0, r6
	str r1, [r4]
	ldr r1, [sb, #0x10]
	str r1, [r4, #0xc]
	b _020086D0
_020086C4:
	mov r0, r4
	bl sub_0200846C
	mov r0, #2
_020086D0:
	str r0, [r4, #0x14]
	mov r6, #1
	b _02008894
_020086DC:
	mov r4, r6
	mov r5, #1
	add r7, sp, #0x24
_020086E8:
	ldr r3, [sp, #0x20]
	mov r0, r7
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	mov r1, sb
	bl sub_02007A70
	cmp r0, #0
	movge r0, r5
	movlt r0, r4
	ands r6, r0, #0xff
	beq _020086E8
	ldrb r7, [sp, #0x30]
	b _02008894
_02008724:
	mov r4, r6
	mov r5, #1
	add r7, sp, #0x24
_02008730:
	ldr r3, [sp, #0x20]
	mov r0, r7
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	mov r1, sb
	bl sub_020079D8
	cmp r0, #0
	movge r0, r5
	movlt r0, r4
	ands r6, r0, #0xff
	beq _02008730
	ldrb r7, [sp, #0x30]
	b _02008894
_0200876C:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	add r1, r3, #0x28
	str r1, [sp]
	ldr r2, [r3, #0x1c]
	mov r1, sb
	str r2, [sp, #4]
	ldr r2, [r3, #0x18]
	str r2, [sp, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x14]
	bl sub_02007B14
	cmp r0, #0
	movge r0, #1
	movlt r0, r6
	and r6, r0, #0xff
	ldrb r7, [sp, #0x30]
	b _02008894
_020087B4:
	add r4, sp, #0x24
_020087B8:
	ldr r2, [sp, #0x20]
	mov r0, r4
	ldr r1, [r2, #0x20]
	add r3, r2, #0x28
	str r1, [sp]
	ldr r1, [r2, #0x24]
	str r1, [sp, #4]
	ldr r1, [r2, #4]
	ldr r2, [r2, #0x10]
	bl sub_02007BCC
	movs r6, r0
	beq _020087B8
	ldrb r7, [sp, #0x30]
	b _02008894
_020087F0:
	ldr r2, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r2, #0x20]
	add r3, r2, #0x28
	str r1, [sp]
	ldr r1, [r2, #0x24]
	str r1, [sp, #4]
	ldr r1, [r2, #0x1c]
	str r1, [sp, #8]
	ldr r1, [r2, #0x14]
	str r1, [sp, #0xc]
	ldr r1, [r2, #4]
	ldr r2, [r2, #0x10]
	bl sub_02007CA0
	mov r6, r0
	ldrb r7, [sp, #0x30]
	b _02008894
_02008834:
	ldr r3, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r3, #0x14]
	add r2, r3, #0x28
	str r1, [sp]
	ldr r1, [r3, #4]
	ldr r3, [r3, #0x10]
	bl sub_02007D94
	mov r6, r0
	mov r8, #1
	b _02008894
_02008860:
	ldr r2, [sp, #0x20]
	add r0, sp, #0x24
	ldr r1, [r2, #4]
	add r2, r2, #0x28
	bl sub_02007E2C
	mov r6, r0
	mov r8, #1
	b _02008894
_02008880:
	ldr r0, [sp, #0x20]
	add r0, r0, #0x28
	bl sub_020075B0
	mov r6, r0
	mov r8, #1
_02008894:
	ldr r0, _02008934 ; =_020AF3E4
	bl sub_02002CB4
	cmp sb, #0
	beq _020088DC
	mov r0, #0
	str r0, [sb, #0x1c]
	cmp r7, #0
	movne r0, #1
	strne r0, [sb, #0x24]
	bne _020088DC
	cmp r6, #0
	strne r0, [sb, #0x24]
	bne _020088DC
	cmp r8, #0
	movne r0, #2
	strne r0, [sb, #0x24]
	moveq r0, #3
	streq r0, [sb, #0x24]
_020088DC:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _020088F0
	bl sub_02002B50
_020088F0:
	ldr r0, [sp, #0x20]
	bl sub_02008B78
_020088F8:
	mov r1, #0
	ldr r0, [sp, #0x20]
	ldr r3, _0200893C ; =_02092978
	mov r2, r1
	bl sub_02008980
	ldr r0, _02008934 ; =_020AF3E4
	bl sub_02002E98
	ldr r0, _02008940 ; =_020AF42C
	bl sub_020029B8
	ldr r0, _02008944 ; =_020AF490
	bl sub_02002B20
	b _020084B4
	.align 2, 0
_02008928: .word _020AF408
_0200892C: .word _02092908
_02008930: .word _022A369C
_02008934: .word _020AF3E4
_02008938: .word _020AF5E8
_0200893C: .word _02092978
_02008940: .word _020AF42C
_02008944: .word _020AF490
	arm_func_end sub_02008490

	arm_func_start sub_02008948
sub_02008948: ; 0x02008948
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _0200897C ; =_020AF3E4
	bl sub_02002CB4
	ldr r0, [r4, #0x24]
	cmp r0, #4
	cmpne r0, #5
	moveq r4, #1
	ldr r0, _0200897C ; =_020AF3E4
	movne r4, #0
	bl sub_02002E98
	and r0, r4, #0xff
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200897C: .word _020AF3E4
	arm_func_end sub_02008948

	arm_func_start sub_02008980
sub_02008980: ; 0x02008980
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r2, [r4]
	cmp r3, #0
	str r1, [r4, #4]
	moveq r0, #0
	streqb r0, [r4, #0x28]
	beq _020089AC
	mov r1, r3
	add r0, r4, #0x28
	bl strcpy
_020089AC:
	mov r0, #0
	strb r0, [r4, #9]
	strb r0, [r4, #8]
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02008980

	arm_func_start sub_020089D8
sub_020089D8: ; 0x020089D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, _02008A78 ; =_020AF3E4
	ldr r1, _02008A7C ; =_020AF490
	bl sub_02002D80
	cmp r0, #0
	bne _02008A00
	ldr r0, _02008A78 ; =_020AF3E4
	ldr r1, _02008A7C ; =_020AF490
	bl sub_02002D14
_02008A00:
	ldr r0, _02008A80 ; =_022A3698
	mov r3, #0
	ldr r5, [r0]
	mov r0, r3
	mov r1, #1
	b _02008A60
_02008A18:
	ldr r2, [r5]
	cmp r2, #0
	moveq r2, r1
	movne r2, r0
	tst r2, #0xff
	beq _02008A58
	mov lr, r5
	mov ip, #0x10
_02008A38:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02008A38
	ldr r0, _02008A78 ; =_020AF3E4
	bl sub_02002E98
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_02008A58:
	add r3, r3, #1
	add r5, r5, #0x100
_02008A60:
	cmp r3, #8
	blt _02008A18
	ldr r0, _02008A78 ; =_020AF3E4
	bl sub_02002E98
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02008A78: .word _020AF3E4
_02008A7C: .word _020AF490
_02008A80: .word _022A3698
	arm_func_end sub_020089D8

	arm_func_start sub_02008A84
sub_02008A84: ; 0x02008A84
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldr r4, [r5, #4]
	mov r0, r4
	bl sub_02008948
	cmp r0, #0
	bne _02008B00
	ldr r1, [r5]
	mov r0, r5
	str r1, [r4, #0x20]
	mov r1, #4
	str r1, [r4, #0x24]
	bl sub_020089D8
	mov r1, r0
	mov r2, #1
	ldr r0, _02008B64 ; =_022A369C
	strb r2, [r1, #8]
	bl sub_02002F7C
	ldr r6, _02008B68 ; =_020AF53C
_02008AD4:
	mov r0, r6
	bl sub_02002B7C
	ldr r3, [r4, #0x24]
	cmp r3, #4
	bne _02008AF4
	mov r0, r6
	bl sub_02002B20
	b _02008AD4
_02008AF4:
	cmp r3, #2
	bhi _02008B04
	b _02008B5C
_02008B00:
	mov r3, #5
_02008B04:
	ldr r0, _02008B6C ; =_02092908
	ldr r2, _02008B70 ; =_020AF454
	ldr r1, [r0, #0x24]
	ldr r0, [r0, #0x20]
	str r1, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr ip, [r5]
	ldr r1, _02008B74 ; =_020929B8
	stmia sp, {r3, ip}
	ldr r3, [r4, #0x20]
	add r0, sp, #0x1c
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r4, [r5, #0xc]
	add r3, r5, #0x28
	str r4, [sp, #0x10]
	ldr r4, [r5, #0x10]
	str r4, [sp, #0x14]
	ldr r4, [r5, #0x14]
	str r4, [sp, #0x18]
	ldr r2, [r2, ip, lsl #2]
	bl Debug_FatalError
_02008B5C:
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02008B64: .word _022A369C
_02008B68: .word _020AF53C
_02008B6C: .word _02092908
_02008B70: .word _020AF454
_02008B74: .word _020929B8
	arm_func_end sub_02008A84

	arm_func_start sub_02008B78
sub_02008B78: ; 0x02008B78
	stmdb sp!, {r3, lr}
	ldrb r1, [r0, #8]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	strb r1, [r0, #8]
	ldr r0, _02008BA4 ; =_020AF53C
	bl sub_02002B20
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_02008BA4: .word _020AF53C
	arm_func_end sub_02008B78

	arm_func_start sub_02008BA8
sub_02008BA8: ; 0x02008BA8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x40
	mov r2, r0
	add r0, sp, #0
	add r1, sp, #0x28
	bl sub_02008C68
	cmp r0, #0
	ldrne r0, [sp, #0x34]
	mvneq r0, #0
	add sp, sp, #0x40
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008BA8
