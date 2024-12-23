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

	arm_func_start UnloadFile
UnloadFile: ; 0x02008BD4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl MemFree
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end UnloadFile

	arm_func_start sub_02008BF4
sub_02008BF4: ; 0x02008BF4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008CC4
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008BF4

	arm_func_start sub_02008C18
sub_02008C18: ; 0x02008C18
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl sub_02008D10
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end sub_02008C18

	arm_func_start LoadFileFromRom
LoadFileFromRom: ; 0x02008C3C
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x28
	mov lr, r0
	mov ip, r1
	mov r3, r2
	add r0, sp, #0
	mov r1, lr
	mov r2, ip
	bl sub_02008D60
	add sp, sp, #0x28
	ldmia sp!, {r3, pc}
	arm_func_end LoadFileFromRom

	arm_func_start sub_02008C68
sub_02008C68: ; 0x02008C68
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #6
	bl sub_02008980
	mov r0, r5
	str r5, [sp, #0x10]
	bl sub_0200846C
	add r0, sp, #0
	bl sub_02008A84
	ldr r0, [r5, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008C68

	arm_func_start sub_02008CC4
sub_02008CC4: ; 0x02008CC4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	mvn r1, #0
	add r0, sp, #0
	str r5, [sp, #0xc]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008CC4

	arm_func_start sub_02008D10
sub_02008D10: ; 0x02008D10
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x100
	mov r6, r0
	mov r4, r2
	mov r5, r1
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r6
	mov r3, r4
	mov r2, #8
	bl sub_02008980
	ldr r1, [r5]
	add r0, sp, #0
	str r1, [sp, #0xc]
	ldr r1, [r5, #4]
	str r1, [sp, #0x14]
	bl sub_02008A84
	ldr r0, [r6, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02008D10

	arm_func_start sub_02008D60
sub_02008D60: ; 0x02008D60
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x100
	mov r7, r0
	mov r5, r2
	mov r6, r1
	mov r4, r3
	bl sub_0200844C
	add r0, sp, #0
	mov r1, r7
	mov r3, r5
	mov r2, #0xa
	bl sub_02008980
	add r0, sp, #0
	str r6, [sp, #0x10]
	str r4, [sp, #0x24]
	bl sub_02008A84
	ldr r0, [r7, #0x10]
	add sp, sp, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02008D60

	arm_func_start sub_02008DAC
sub_02008DAC: ; 0x02008DAC
	stmdb sp!, {r4, lr}
	ldr r1, _02008EAC ; =_020AF694
	mov r3, #0xff
	ldr r0, _02008EB0 ; =GXi_DmaId
	mov r2, #3
	strb r3, [r1]
	str r2, [r0]
	bl GX_Init
	ldr r2, _02008EB4 ; =0x04000304
	ldr r0, _02008EB8 ; =0xFFFFFDF1
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	bl G3X_Init
	bl G3X_ClearFifo
	bl GX_DispOff
	ldr r1, _02008EBC ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	bl sub_0200961C
	ldr r0, _02008EC0 ; =0x000001FF
	bl GX_SetBankForLCDC
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl ArrayFill32Fast
	bl GX_DisableBankForLCDC
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0xc0
	ldr r1, _02008EC4 ; =0x07000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	ldr r1, _02008EC8 ; =0x05000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r1, #0x100
	ldr r0, _02008ECC ; =_022A37A0
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02009648
	mov r2, #0
	ldr r0, _02008ECC ; =_022A37A0
	mov r1, #0x100
	str r2, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl sub_02008F88
	mov r4, #1
_02008E98:
	mov r0, r4
	bl sub_02082420
	cmp r0, #0
	beq _02008E98
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008EAC: .word _020AF694
_02008EB0: .word GXi_DmaId
_02008EB4: .word 0x04000304
_02008EB8: .word 0xFFFFFDF1
_02008EBC: .word 0x04001000
_02008EC0: .word 0x000001FF
_02008EC4: .word 0x07000400
_02008EC8: .word 0x05000400
_02008ECC: .word _022A37A0
	arm_func_end sub_02008DAC

	arm_func_start sub_02008ED0
sub_02008ED0: ; 0x02008ED0
	stmdb sp!, {r4, lr}
	ldr r1, _02008F30 ; =_020AF694
	mov r4, r0
	ldrb r1, [r1]
	cmp r1, r4
	ldmeqia sp!, {r4, pc}
	ldr r0, _02008F34 ; =_02092AB8
	mov r2, r4
	bl Debug_Print0
	cmp r4, #0
	beq _02008F0C
	cmp r4, #0xff
	bne _02008F24
	bl sub_0200961C
	b _02008F24
_02008F0C:
	bl sub_02009648
	bl GX_DispOn
	ldr r1, _02008F38 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
_02008F24:
	ldr r0, _02008F30 ; =_020AF694
	strb r4, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02008F30: .word _020AF694
_02008F34: .word _02092AB8
_02008F38: .word 0x04001000
	arm_func_end sub_02008ED0

	arm_func_start sub_02008F3C
sub_02008F3C: ; 0x02008F3C
	ldr r2, _02008F48 ; =_022A37A4
	str r1, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_02008F48: .word _022A37A4
	arm_func_end sub_02008F3C

	arm_func_start sub_02008F4C
sub_02008F4C: ; 0x02008F4C
	ldr r1, _02008F60 ; =_022A37A4
	ldr r0, [r1, r0, lsl #2]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bx lr
	.align 2, 0
_02008F60: .word _022A37A4
	arm_func_end sub_02008F4C

	arm_func_start sub_02008F64
sub_02008F64: ; 0x02008F64
	ldr r2, _02008F80 ; =_022A37A0
	add r0, r1, r0, lsl #2
	ldr r3, [r2]
	mov r1, #1
	orr r0, r3, r1, lsl r0
	str r0, [r2]
	bx lr
	.align 2, 0
_02008F80: .word _022A37A0
	arm_func_end sub_02008F64

	arm_func_start sub_02008F84
sub_02008F84: ; 0x02008F84
	bx lr
	arm_func_end sub_02008F84

	arm_func_start sub_02008F88
sub_02008F88: ; 0x02008F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r0, #0
	bl sub_02009DCC
	mov r0, #1
	bl sub_02009DCC
	mov r0, #0
	bl sub_02009D48
	mov r0, #1
	bl sub_02009D48
	mov r0, #0
	bl sub_02009F9C
	mov r0, #1
	bl sub_02009F9C
	mov r0, #0
	bl sub_02009E70
	mov r0, #1
	bl sub_02009E70
	ldr r1, _02009080 ; =_022A37A0
	ldr r0, _02009084 ; =0x0400006C
	ldr r2, [r1, #4]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl GXx_SetMasterBrightness_
	ldr r1, _02009080 ; =_022A37A0
	ldr r0, _02009088 ; =0x0400106C
	ldr r2, [r1, #8]
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r1, r1, asr #4
	bl GXx_SetMasterBrightness_
	ldr r0, _02009080 ; =_022A37A0
	ldr sb, [r0]
	cmp sb, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sl, #0
	ldr r8, _0200908C ; =_02092A18
	mov fp, #2
	ldr r7, _02009090 ; =_02092A38
	ldr r6, _02009094 ; =_02092A58
	ldr r5, _02009098 ; =_02092A78
	ldr r4, _0200909C ; =_02092A98
	b _02009068
_02009034:
	tst sb, #1
	beq _02009060
	ldr r0, [r8, sl, lsl #2]
	mov r1, fp
	bl MemZero16
	ldr r0, [r7, sl, lsl #2]
	ldr r1, [r6, sl, lsl #2]
	bl MemZero32
	ldr r0, [r5, sl, lsl #2]
	ldr r1, [r4, sl, lsl #2]
	bl MemZero32
_02009060:
	mov sb, sb, asr #1
	add sl, sl, #1
_02009068:
	cmp sb, #0
	bne _02009034
	ldr r0, _02009080 ; =_022A37A0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02009080: .word _022A37A0
_02009084: .word 0x0400006C
_02009088: .word 0x0400106C
_0200908C: .word _02092A18
_02009090: .word _02092A38
_02009094: .word _02092A58
_02009098: .word _02092A78
_0200909C: .word _02092A98
	arm_func_end sub_02008F88

	arm_func_start sub_020090A0
sub_020090A0: ; 0x020090A0
	mov r3, r1, lsr #0x1f
	ldr ip, _020090BC ; =_022A37CC
	rsb r1, r3, r1, lsl #30
	add r3, r3, r1, ror #30
	add r1, ip, r2, lsl #4
	str r3, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020090BC: .word _022A37CC
	arm_func_end sub_020090A0

	arm_func_start sub_020090C0
sub_020090C0: ; 0x020090C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
_020090D0:
	ldrb r1, [r6, r4]
	mov r0, r4
	mov r2, r5
	bl sub_020090A0
	add r0, r4, #1
	and r4, r0, #0xff
	cmp r4, #4
	blo _020090D0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020090C0

	arm_func_start sub_020090F4
sub_020090F4: ; 0x020090F4
	ldr r2, _0200911C ; =_022A37CC
	mov ip, #0
	add r3, r2, r1, lsl #4
_02009100:
	ldr r2, [r3, ip, lsl #2]
	add r1, ip, #1
	strb r2, [r0, ip]
	and ip, r1, #0xff
	cmp ip, #4
	blo _02009100
	bx lr
	.align 2, 0
_0200911C: .word _022A37CC
	arm_func_end sub_020090F4

	arm_func_start sub_02009120
sub_02009120: ; 0x02009120
	cmp r0, #0
	bne _02009150
	ldr r2, _02009184 ; =_022A37CC
	mov r3, #1
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =_022A37D0
	mov r3, #0
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =_022A37D4
	mov r3, #2
	ldr r1, _02009190 ; =_022A37D8
	b _02009174
_02009150:
	ldr r2, _02009184 ; =_022A37CC
	mov r3, #0
	str r3, [r2, r0, lsl #4]
	ldr r1, _02009188 ; =_022A37D0
	mov r3, #1
	str r3, [r1, r0, lsl #4]
	ldr r2, _0200918C ; =_022A37D4
	ldr r1, _02009190 ; =_022A37D8
	mov r3, #2
_02009174:
	str r3, [r2, r0, lsl #4]
	mov r2, #3
	str r2, [r1, r0, lsl #4]
	bx lr
	.align 2, 0
_02009184: .word _022A37CC
_02009188: .word _022A37D0
_0200918C: .word _022A37D4
_02009190: .word _022A37D8
	arm_func_end sub_02009120

	arm_func_start sub_02009194
sub_02009194: ; 0x02009194
	ldr r2, _020091AC ; =_022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091AC: .word _022A37AC
	arm_func_end sub_02009194

	arm_func_start sub_020091B0
sub_020091B0: ; 0x020091B0
	ldr r2, _020091C8 ; =_022A37AC
	add r1, r1, r1, lsl #2
	add r1, r2, r1
	mov r2, #0
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_020091C8: .word _022A37AC
	arm_func_end sub_020091B0

	arm_func_start sub_020091CC
sub_020091CC: ; 0x020091CC
	ldr r1, _020091F4 ; =_022A37AC
	add r0, r0, r0, lsl #2
	add r2, r1, r0
	mov r1, #0
	mov r0, r1
_020091E0:
	strb r0, [r2, r1]
	add r1, r1, #1
	cmp r1, #5
	blt _020091E0
	bx lr
	.align 2, 0
_020091F4: .word _022A37AC
	arm_func_end sub_020091CC

	arm_func_start sub_020091F8
sub_020091F8: ; 0x020091F8
	stmdb sp!, {r3, lr}
	mov ip, #0x1b
	mul lr, r3, ip
	ldr ip, _02009220 ; =_022A37EC
	ldr r3, _02009224 ; =_022A37ED
	strb r0, [ip, lr]
	ldr r0, _02009228 ; =_022A37EE
	strb r1, [r3, lr]
	strb r2, [r0, lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009220: .word _022A37EC
_02009224: .word _022A37ED
_02009228: .word _022A37EE
	arm_func_end sub_020091F8

	arm_func_start sub_0200922C
sub_0200922C: ; 0x0200922C
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009278 ; =_022A37F3
	smulbb r4, r4, ip
	ldr ip, _0200927C ; =_022A37F4
	strb r0, [lr, r4]
	ldr lr, _02009280 ; =_022A37F5
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _02009284 ; =_022A37F6
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009288 ; =_022A37F7
	strb r3, [r0, r4]
	ldr r0, _0200928C ; =_022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009278: .word _022A37F3
_0200927C: .word _022A37F4
_02009280: .word _022A37F5
_02009284: .word _022A37F6
_02009288: .word _022A37F7
_0200928C: .word _022A37EF
	arm_func_end sub_0200922C

	arm_func_start sub_02009290
sub_02009290: ; 0x02009290
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020092DC ; =_022A37F8
	smulbb r4, r4, ip
	ldr ip, _020092E0 ; =_022A37F9
	strb r0, [lr, r4]
	ldr lr, _020092E4 ; =_022A37FA
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020092E8 ; =_022A37FB
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020092EC ; =_022A37FC
	strb r3, [r0, r4]
	ldr r0, _020092F0 ; =_022A37F0
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020092DC: .word _022A37F8
_020092E0: .word _022A37F9
_020092E4: .word _022A37FA
_020092E8: .word _022A37FB
_020092EC: .word _022A37FC
_020092F0: .word _022A37F0
	arm_func_end sub_02009290

	arm_func_start sub_020092F4
sub_020092F4: ; 0x020092F4
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _02009340 ; =_022A3802
	smulbb r4, r4, ip
	ldr ip, _02009344 ; =_022A3803
	strb r0, [lr, r4]
	ldr lr, _02009348 ; =_022A3804
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _0200934C ; =_022A3805
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _02009350 ; =_022A3806
	strb r3, [r0, r4]
	ldr r0, _02009354 ; =_022A37EF
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009340: .word _022A3802
_02009344: .word _022A3803
_02009348: .word _022A3804
_0200934C: .word _022A3805
_02009350: .word _022A3806
_02009354: .word _022A37EF
	arm_func_end sub_020092F4

	arm_func_start sub_02009358
sub_02009358: ; 0x02009358
	stmdb sp!, {r4, lr}
	ldrb r4, [sp, #0x10]
	mov ip, #0x1b
	ldr lr, _020093A4 ; =_022A37FD
	smulbb r4, r4, ip
	ldr ip, _020093A8 ; =_022A37FE
	strb r0, [lr, r4]
	ldr lr, _020093AC ; =_022A37FF
	strb r1, [ip, r4]
	ldrb ip, [sp, #8]
	ldr r0, _020093B0 ; =_022A3800
	strb r2, [lr, r4]
	ldrb r1, [sp, #0xc]
	ldr r2, _020093B4 ; =_022A3801
	strb r3, [r0, r4]
	ldr r0, _020093B8 ; =_022A37F1
	strb ip, [r2, r4]
	strb r1, [r0, r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020093A4: .word _022A37FD
_020093A8: .word _022A37FE
_020093AC: .word _022A37FF
_020093B0: .word _022A3800
_020093B4: .word _022A3801
_020093B8: .word _022A37F1
	arm_func_end sub_02009358

	arm_func_start sub_020093BC
sub_020093BC: ; 0x020093BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r4
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	stmib sp, {r0, r4}
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020093BC

	arm_func_start sub_02009454
sub_02009454: ; 0x02009454
	ldr ip, _02009468 ; =_022A37B6
	mov r3, #0xa
	mla r3, r2, r3, ip
	strb r1, [r0, r3]
	bx lr
	.align 2, 0
_02009468: .word _022A37B6
	arm_func_end sub_02009454

	arm_func_start sub_0200946C
sub_0200946C: ; 0x0200946C
	ldr r3, _02009494 ; =_022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_0200947C:
	ldrb r1, [r0, r2]
	strb r1, [r3, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _0200947C
	bx lr
	.align 2, 0
_02009494: .word _022A37B6
	arm_func_end sub_0200946C

	arm_func_start sub_02009498
sub_02009498: ; 0x02009498
	ldr r3, _020094C0 ; =_022A37B6
	mov r2, #0xa
	mla r3, r1, r2, r3
	mov r2, #0
_020094A8:
	ldrb r1, [r3, r2]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #5
	blt _020094A8
	bx lr
	.align 2, 0
_020094C0: .word _022A37B6
	arm_func_end sub_02009498

	arm_func_start sub_020094C4
sub_020094C4: ; 0x020094C4
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _020094E0 ; =_022A37BC
	ldr r2, _020094E4 ; =_022A37BE
	strh r0, [r3, ip]
	strh r1, [r2, ip]
	bx lr
	.align 2, 0
_020094E0: .word _022A37BC
_020094E4: .word _022A37BE
	arm_func_end sub_020094C4

	arm_func_start sub_020094E8
sub_020094E8: ; 0x020094E8
	mov r3, #0xa
	mul ip, r2, r3
	ldr r3, _0200950C ; =_022A37BC
	ldr r2, _02009510 ; =_022A37BE
	ldrsh r3, [r3, ip]
	strh r3, [r0]
	ldrsh r0, [r2, ip]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200950C: .word _022A37BC
_02009510: .word _022A37BE
	arm_func_end sub_020094E8

	arm_func_start sub_02009514
sub_02009514: ; 0x02009514
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x40
	mov r1, r0
	mov r2, r4
	bl sub_020094C4
	mov r0, #0xa
	mul r3, r4, r0
	cmp r4, #0
	bne _02009568
	ldr r0, _02009598 ; =_022A37B6
	mov r2, #1
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =_022A37B7
	mov r2, #2
	strb r2, [r1, r3]
	ldr r0, _020095A0 ; =_022A37B8
	ldr r1, _020095A4 ; =_022A37B9
	strb r2, [r0, r3]
	ldr r0, _020095A8 ; =_022A37BA
	b _0200958C
_02009568:
	ldr r0, _02009598 ; =_022A37B6
	mov r2, #2
	strb r2, [r0, r3]
	ldr r1, _0200959C ; =_022A37B7
	ldr r0, _020095A0 ; =_022A37B8
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldr r1, _020095A4 ; =_022A37B9
	ldr r0, _020095A8 ; =_022A37BA
_0200958C:
	strb r2, [r1, r3]
	strb r2, [r0, r3]
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009598: .word _022A37B6
_0200959C: .word _022A37B7
_020095A0: .word _022A37B8
_020095A4: .word _022A37B9
_020095A8: .word _022A37BA
	arm_func_end sub_02009514

	arm_func_start sub_020095AC
sub_020095AC: ; 0x020095AC
	ldr r2, _020095C4 ; =0x04001008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095C4: .word 0x04001008
	arm_func_end sub_020095AC

	arm_func_start sub_020095C8
sub_020095C8: ; 0x020095C8
	ldr r2, _020095E0 ; =0x0400100A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095E0: .word 0x0400100A
	arm_func_end sub_020095C8

	arm_func_start sub_020095E4
sub_020095E4: ; 0x020095E4
	ldr r2, _020095FC ; =0x0400100C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020095FC: .word 0x0400100C
	arm_func_end sub_020095E4

	arm_func_start sub_02009600
sub_02009600: ; 0x02009600
	ldr r2, _02009618 ; =0x0400100E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009618: .word 0x0400100E
	arm_func_end sub_02009600

	arm_func_start sub_0200961C
sub_0200961C: ; 0x0200961C
	stmdb sp!, {r3, lr}
	bl GX_DisableBankForBG
	bl GX_DisableBankForOBJ
	bl GX_DisableBankForBGExtPltt
	bl GX_DisableBankForOBJExtPltt
	bl GX_DisableBankForTex
	bl GX_DisableBankForTexPltt
	bl GX_DisableBankForSubBG
	bl GX_DisableBankForSubOBJ
	bl GX_DisableBankForSubBGExtPltt
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200961C

	arm_func_start sub_02009648
sub_02009648: ; 0x02009648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r0, #1
	bl GX_SetBankForBG
	mov r0, #2
	bl GX_SetBankForOBJ
	mov r0, #0x10
	bl GX_SetBankForBGExtPltt
	mov r0, #0x40
	bl GX_SetBankForOBJExtPltt
	mov r0, #8
	bl GX_SetBankForTex
	mov r0, #0x20
	bl GX_SetBankForTexPltt
	mov r0, #1
	mov r1, #0
	mov r2, r0
	bl GX_SetGraphicsMode
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _02009B78 ; =0x00005C10
	bic r1, r1, #0x1f00
	orr r1, r1, #0x1f00
	str r1, [r2]
	add r3, r0, #0x208
	ldr r1, [r2]
	mov r0, #0x1c
	bic r1, r1, #0x38000000
	str r1, [r2]
	ldr r4, [r2]
	mov r1, #0
	bic r4, r4, #0x7000000
	str r4, [r2]
	ldrh r4, [r2, #0xa]
	and r4, r4, #0x43
	orr r4, r4, #0x1b80
	strh r4, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	bic r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009B98
	mov r0, #0x1c
	mov r1, #0
	bl sub_02009BC0
	mov r0, #0
	mov r1, r0
	bl sub_02009BE8
	mov r0, #0xc
	mov r1, #0
	bl sub_02009C10
	mov r3, #8
	str r3, [sp]
	ldr r0, _02009B7C ; =0x04000050
	mov r1, #1
	mov r2, #0x3e
	bl G2x_SetBlendAlpha_
	ldr ip, _02009B80 ; =0x04000040
	mov lr, #0
	strh lr, [ip]
	strh lr, [ip, #4]
	strh lr, [ip, #2]
	strh lr, [ip, #6]
	sub r4, ip, #0x36
	ldrh r0, [r4]
	sub r3, ip, #0x38
	sub r2, ip, #0x34
	bic r0, r0, #3
	strh r0, [r4]
	ldrh r0, [r3]
	sub r1, ip, #0x32
	mov r6, #0x4000000
	bic r0, r0, #3
	orr r0, r0, #1
	strh r0, [r3]
	ldrh r7, [r2]
	ldr r5, _02009B84 ; =0xFFCFFFEF
	mov r0, #4
	bic r7, r7, #3
	orr r7, r7, #2
	strh r7, [r2]
	ldrh r7, [r1]
	bic r7, r7, #3
	orr r7, r7, #3
	strh r7, [r1]
	str lr, [ip, #-0x2c]
	str lr, [ip, #-0x28]
	str lr, [ip, #-0x24]
	ldrh r7, [r3]
	bic r7, r7, #0x40
	strh r7, [r3]
	ldrh r3, [r4]
	bic r3, r3, #0x40
	strh r3, [r4]
	ldrh r3, [r2]
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r2, [r1]
	bic r2, r2, #0x40
	strh r2, [r1]
	ldr r1, [r6]
	and r1, r1, r5
	orr r1, r1, #0x10
	orr r1, r1, #0x200000
	str r1, [r6]
	bl GX_SetBankForSubBG
	mov r0, #0x100
	bl GX_SetBankForSubOBJ
	mov r0, #0x80
	bl GX_SetBankForSubBGExtPltt
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r2, _02009B88 ; =0x04001000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, #0x1f00
	str r0, [r2]
	ldrh r0, [r2, #8]
	and r0, r0, #0x43
	orr r0, r0, #0x1a80
	strh r0, [r2, #8]
	ldrh r3, [r2, #0xa]
	ldr r1, _02009B78 ; =0x00005C10
	mov r0, #0x1e
	and r3, r3, #0x43
	orr r3, r3, #0x38c
	orr r3, r3, #0x1800
	strh r3, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	add r3, r1, #0x208
	mov r1, #1
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	orr r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009CA8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009CD0
	mov r0, #0
	mov r1, r0
	bl sub_02009CF8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009D20
	ldr ip, _02009B8C ; =0x04001050
	mov r1, #0
	strh r1, [ip]
	strh r1, [ip, #-0x10]
	strh r1, [ip, #-0xc]
	strh r1, [ip, #-0xe]
	strh r1, [ip, #-0xa]
	sub r3, ip, #0x48
	ldrh r4, [r3]
	sub r0, ip, #0x46
	sub r2, ip, #0x44
	bic r4, r4, #3
	strh r4, [r3]
	ldrh r5, [r0]
	sub r4, ip, #0x42
	bic r5, r5, #3
	orr r5, r5, #1
	strh r5, [r0]
	ldrh r5, [r2]
	bic r5, r5, #3
	orr r5, r5, #2
	strh r5, [r2]
	ldrh r5, [r4]
	bic r5, r5, #3
	orr r5, r5, #3
	strh r5, [r4]
	str r1, [ip, #-0x40]
	str r1, [ip, #-0x3c]
	str r1, [ip, #-0x38]
	str r1, [ip, #-0x34]
	ldrh r5, [r3]
	ldr r6, _02009B90 ; =0xFFFFCFFD
	ldr lr, _02009B94 ; =0x04000304
	bic r5, r5, #0x40
	strh r5, [r3]
	ldrh r3, [r0]
	sub r7, ip, #0x50
	ldr r5, _02009B84 ; =0xFFCFFFEF
	bic r3, r3, #0x40
	strh r3, [r0]
	ldrh r3, [r2]
	sub ip, lr, #0x2a4
	mov r0, r6, lsr #0x16
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r8, [r4]
	mov r2, r6, lsr #0x11
	mov r3, #0x3f
	bic r8, r8, #0x40
	strh r8, [r4]
	ldr r4, [r7]
	and r4, r4, r5
	orr r4, r4, #0x10
	orr r4, r4, #0x200000
	str r4, [r7]
	ldrh r4, [lr]
	bic r4, r4, #0x8000
	strh r4, [lr]
	ldrh r4, [ip]
	and r4, r4, r6
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #0x10
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #8
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #4
	strh r4, [ip]
	strh r1, [lr, #0x3c]
	str r1, [sp]
	bl G3X_SetClearColor
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	str r0, [sp, #8]
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009358
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #1
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02009B78: .word 0x00005C10
_02009B7C: .word 0x04000050
_02009B80: .word 0x04000040
_02009B84: .word 0xFFCFFFEF
_02009B88: .word 0x04001000
_02009B8C: .word 0x04001050
_02009B90: .word 0xFFFFCFFD
_02009B94: .word 0x04000304
	arm_func_end sub_02009648

	arm_func_start sub_02009B98
sub_02009B98: ; 0x02009B98
	ldr r2, _02009BBC ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009BBC ; =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BBC: .word 0x04000048
	arm_func_end sub_02009B98

	arm_func_start sub_02009BC0
sub_02009BC0: ; 0x02009BC0
	ldr r2, _02009BE4 ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009BE4 ; =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BE4: .word 0x04000048
	arm_func_end sub_02009BC0

	arm_func_start sub_02009BE8
sub_02009BE8: ; 0x02009BE8
	ldr r2, _02009C0C ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009C0C ; =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C0C: .word 0x0400004A
	arm_func_end sub_02009BE8

	arm_func_start sub_02009C10
sub_02009C10: ; 0x02009C10
	ldr r2, _02009C34 ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009C34 ; =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C34: .word 0x0400004A
	arm_func_end sub_02009C10

	arm_func_start sub_02009C38
sub_02009C38: ; 0x02009C38
	ldr r2, _02009C50 ; =0x0400000A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C50: .word 0x0400000A
	arm_func_end sub_02009C38

	arm_func_start sub_02009C54
sub_02009C54: ; 0x02009C54
	ldr r2, _02009C6C ; =0x04000008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C6C: .word 0x04000008
	arm_func_end sub_02009C54

	arm_func_start sub_02009C70
sub_02009C70: ; 0x02009C70
	ldr r2, _02009C88 ; =0x0400000C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C88: .word 0x0400000C
	arm_func_end sub_02009C70

	arm_func_start sub_02009C8C
sub_02009C8C: ; 0x02009C8C
	ldr r2, _02009CA4 ; =0x0400000E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009CA4: .word 0x0400000E
	arm_func_end sub_02009C8C

	arm_func_start sub_02009CA8
sub_02009CA8: ; 0x02009CA8
	ldr r2, _02009CCC ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009CCC ; =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CCC: .word 0x04001048
	arm_func_end sub_02009CA8

	arm_func_start sub_02009CD0
sub_02009CD0: ; 0x02009CD0
	ldr r2, _02009CF4 ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009CF4 ; =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CF4: .word 0x04001048
	arm_func_end sub_02009CD0

	arm_func_start sub_02009CF8
sub_02009CF8: ; 0x02009CF8
	ldr r2, _02009D1C ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009D1C ; =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D1C: .word 0x0400104A
	arm_func_end sub_02009CF8

	arm_func_start sub_02009D20
sub_02009D20: ; 0x02009D20
	ldr r2, _02009D44 ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009D44 ; =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D44: .word 0x0400104A
	arm_func_end sub_02009D20

	arm_func_start sub_02009D48
sub_02009D48: ; 0x02009D48
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02009D88
	ldr r0, _02009DBC ; =_022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C54
	ldr r0, _02009DC0 ; =_022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C38
	ldr r0, _02009DC4 ; =_022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C70
	ldr r0, _02009DC8 ; =_022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009C8C
	ldmia sp!, {r4, pc}
_02009D88:
	ldr r0, _02009DBC ; =_022A37CC
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095AC
	ldr r0, _02009DC0 ; =_022A37D0
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095C8
	ldr r0, _02009DC4 ; =_022A37D4
	ldr r0, [r0, r4, lsl #4]
	bl sub_020095E4
	ldr r0, _02009DC8 ; =_022A37D8
	ldr r0, [r0, r4, lsl #4]
	bl sub_02009600
	ldmia sp!, {r4, pc}
	.align 2, 0
_02009DBC: .word _022A37CC
_02009DC0: .word _022A37D0
_02009DC4: .word _022A37D4
_02009DC8: .word _022A37D8
	arm_func_end sub_02009D48

	arm_func_start sub_02009DCC
sub_02009DCC: ; 0x02009DCC
	ldr r1, _02009E58 ; =_022A37AC
	add r3, r0, r0, lsl #2
	ldrb r2, [r1, r3]
	mov r1, #0x1f
	cmp r2, #0
	ldr r2, _02009E5C ; =_022A37AD
	bicne r1, r1, #1
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E60 ; =_022A37AE
	bicne r1, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E64 ; =_022A37AF
	bicne r1, r1, #4
	ldrb r2, [r2, r3]
	cmp r2, #0
	ldr r2, _02009E68 ; =_022A37B0
	bicne r1, r1, #8
	ldrb r2, [r2, r3]
	cmp r2, #0
	bicne r1, r1, #0x10
	cmp r0, #0
	ldrne r2, _02009E6C ; =0x04001000
	ldrne r0, [r2]
	bicne r0, r0, #0x1f00
	orrne r0, r0, r1, lsl #8
	strne r0, [r2]
	bxne lr
	mov r2, #0x4000000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, r1, lsl #8
	str r0, [r2]
	bx lr
	.align 2, 0
_02009E58: .word _022A37AC
_02009E5C: .word _022A37AD
_02009E60: .word _022A37AE
_02009E64: .word _022A37AF
_02009E68: .word _022A37B0
_02009E6C: .word 0x04001000
	arm_func_end sub_02009DCC

	arm_func_start sub_02009E70
sub_02009E70: ; 0x02009E70
	stmdb sp!, {r3, lr}
	mov r1, #0xa
	mul r3, r0, r1
	ldr r2, _02009F78 ; =_022A37B6
	mov r1, #0
	ldrb ip, [r2, r3]
	mov r2, #0x20
	cmp ip, #1
	orreq r1, r1, #1
	beq _02009EA0
	cmp ip, #2
	orreq r2, r2, #1
_02009EA0:
	ldr ip, _02009F7C ; =_022A37B7
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #2
	beq _02009EBC
	cmp ip, #2
	orreq r2, r2, #2
_02009EBC:
	ldr ip, _02009F80 ; =_022A37B8
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #4
	beq _02009ED8
	cmp ip, #2
	orreq r2, r2, #4
_02009ED8:
	ldr ip, _02009F84 ; =_022A37B9
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #8
	beq _02009EF4
	cmp ip, #2
	orreq r2, r2, #8
_02009EF4:
	ldr ip, _02009F88 ; =_022A37BA
	ldrb ip, [ip, r3]
	cmp ip, #1
	orreq r1, r1, #0x10
	beq _02009F10
	cmp ip, #2
	orreq r2, r2, #0x10
_02009F10:
	cmp r0, #0
	bne _02009F48
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F94 ; =0x04000050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
_02009F48:
	ldr r0, _02009F8C ; =_022A37BE
	ldr ip, _02009F90 ; =_022A37BC
	ldrh lr, [r0, r3]
	ldr r0, _02009F98 ; =0x04001050
	and lr, lr, #0xf8
	mov lr, lr, asr #3
	str lr, [sp]
	ldrh r3, [ip, r3]
	and r3, r3, #0xf8
	mov r3, r3, asr #3
	bl G2x_SetBlendAlpha_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02009F78: .word _022A37B6
_02009F7C: .word _022A37B7
_02009F80: .word _022A37B8
_02009F84: .word _022A37B9
_02009F88: .word _022A37BA
_02009F8C: .word _022A37BE
_02009F90: .word _022A37BC
_02009F94: .word 0x04000050
_02009F98: .word 0x04001050
	arm_func_end sub_02009E70

	arm_func_start sub_02009F9C
sub_02009F9C: ; 0x02009F9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r1, #0x1b
	mul r4, r0, r1
	ldr r3, _0200A100 ; =_022A37EC
	mov r2, #0
	ldrb r1, [r3, r4]
	add lr, r3, r4
	mov r3, #0
	cmp r1, #0
	ldr r1, _0200A104 ; =_022A37ED
	orrne r2, r2, #1
	ldrb r1, [r1, r4]
	mov r5, r3
	mov r6, r3
	cmp r1, #0
	ldr r1, _0200A108 ; =_022A37EE
	orrne r2, r2, #2
	ldrb r1, [r1, r4]
	mov ip, r3
	cmp r1, #0
	ldr r1, _0200A10C ; =_02092A04
	orrne r2, r2, #4
_02009FF4:
	add r7, lr, ip
	ldrb r8, [r7, #7]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r3, r3, r8
	ldrb r8, [r7, #0xc]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r3, r3, r8
	ldrb r8, [r7, #0x16]
	ldrb r7, [r7, #0x11]
	cmp r8, #0
	ldrne r8, [r1, ip, lsl #2]
	orrne r6, r6, r8
	cmp r7, #0
	ldrne r7, [r1, ip, lsl #2]
	orrne r5, r5, r7
	add r7, ip, #1
	and ip, r7, #0xff
	cmp ip, #5
	blo _02009FF4
	cmp r0, #0
	bne _0200A0A8
	mov r7, #0x4000000
	ldr r1, [r7]
	ldr r0, _0200A110 ; =_022A37EF
	bic r1, r1, #0xe000
	orr r1, r1, r2, lsl #13
	str r1, [r7]
	ldrb r1, [r0, r4]
	mov r0, r3
	bl sub_02009B98
	ldr r1, _0200A114 ; =_022A37F0
	mov r0, #0
	ldrb r1, [r1, r4]
	bl sub_02009BC0
	ldr r1, _0200A118 ; =_022A37F1
	mov r0, r5
	ldrb r1, [r1, r4]
	bl sub_02009BE8
	ldr r1, _0200A11C ; =_022A37F2
	mov r0, r6
	ldrb r1, [r1, r4]
	bl sub_02009C10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A0A8:
	ldr ip, _0200A120 ; =0x04001000
	ldr r1, _0200A110 ; =_022A37EF
	ldr r7, [ip]
	mov r0, r3
	bic r3, r7, #0xe000
	orr r2, r3, r2, lsl #13
	str r2, [ip]
	ldrb r1, [r1, r4]
	bl sub_02009CA8
	ldr r1, _0200A114 ; =_022A37F0
	mov r0, #0
	ldrb r1, [r1, r4]
	bl sub_02009CD0
	ldr r1, _0200A118 ; =_022A37F1
	mov r0, r5
	ldrb r1, [r1, r4]
	bl sub_02009CF8
	ldr r1, _0200A11C ; =_022A37F2
	mov r0, r6
	ldrb r1, [r1, r4]
	bl sub_02009D20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0200A100: .word _022A37EC
_0200A104: .word _022A37ED
_0200A108: .word _022A37EE
_0200A10C: .word _02092A04
_0200A110: .word _022A37EF
_0200A114: .word _022A37F0
_0200A118: .word _022A37F1
_0200A11C: .word _022A37F2
_0200A120: .word 0x04001000
	arm_func_end sub_02009F9C

	arm_func_start sub_0200A124
sub_0200A124: ; 0x0200A124
	stmdb sp!, {r4, lr}
	mov r4, r0
	stmia r4, {r1, r2}
	mov r0, #0
	strb r0, [r4, #8]
	ldr r1, [sp, #8]
	str r3, [r4, #0xc]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r4, #0x10]
	mov r0, r4
	bl sub_0200A274
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A124

	arm_func_start sub_0200A158
sub_0200A158: ; 0x0200A158
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x10]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A158

	arm_func_start sub_0200A174
sub_0200A174: ; 0x0200A174
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A174

	arm_func_start sub_0200A180
sub_0200A180: ; 0x0200A180
	bx lr
	arm_func_end sub_0200A180

	arm_func_start sub_0200A184
sub_0200A184: ; 0x0200A184
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x10]
	ldr r1, [r6, #4]
	mov r0, r4
	mov r1, r1, lsl #1
	ldr r5, [r6, #0xc]
	bl sub_0207A2DC
	ldr r0, [r6]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0200A1D4
_0200A1C0: ; jump table
	b _0200A1D4 ; case 0
	b _0200A1EC ; case 1
	b _0200A20C ; case 2
	b _0200A22C ; case 3
	b _0200A24C ; case 4
_0200A1D4:
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	b _0200A268
_0200A1EC:
	bl GX_BeginLoadBGExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GX_EndLoadBGExtPltt
	b _0200A268
_0200A20C:
	bl GX_BeginLoadOBJExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GX_EndLoadOBJExtPltt
	b _0200A268
_0200A22C:
	bl GXS_BeginLoadBGExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GXS_EndLoadBGExtPltt
	b _0200A268
_0200A24C:
	bl GXS_BeginLoadOBJExtPltt
	ldr r2, [r6, #4]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #1
	bl Memcpy32
	bl GXS_EndLoadOBJExtPltt
_0200A268:
	mov r0, #0
	strb r0, [r6, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A184

	arm_func_start sub_0200A274
sub_0200A274: ; 0x0200A274
	mov r3, #0
	ldr ip, [r0, #0x10]
	mov r2, r3
	b _0200A28C
_0200A284:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A28C:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A284
	bx lr
	arm_func_end sub_0200A274

	arm_func_start sub_0200A29C
sub_0200A29C: ; 0x0200A29C
	ldr r0, [r0, #0x10]
	ldr ip, _0200A2B0 ; =Rgb8ToRgb5
	add r0, r0, r1, lsl #1
	mov r1, r2
	bx ip
	.align 2, 0
_0200A2B0: .word Rgb8ToRgb5
	arm_func_end sub_0200A29C

	arm_func_start sub_0200A2B4
sub_0200A2B4: ; 0x0200A2B4
	ldr r3, [r0, #0x10]
	ldr ip, _0200A2C8 ; =sub_02004FF8
	mov r0, r1
	add r1, r3, r2, lsl #1
	bx ip
	.align 2, 0
_0200A2C8: .word sub_02004FF8
	arm_func_end sub_0200A2B4

	arm_func_start sub_0200A2CC
sub_0200A2CC: ; 0x0200A2CC
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A2CC

	arm_func_start sub_0200A2F4
sub_0200A2F4: ; 0x0200A2F4
	mov r1, #0
_0200A2F8:
	ldr r2, [r0, #0x24]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	cmp r2, #0
	movne r0, r2
	bne _0200A2F8
	bx lr
	arm_func_end sub_0200A2F4
_0200A314:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	beq _0200A330
	cmp r2, r1
	bxeq lr
	mov r0, r2
	b _0200A314
_0200A330:
	str r1, [r0, #0x24]
	str r0, [r1, #0x20]
	mov r0, #0
	str r0, [r1, #0x24]
	bx lr
_0200A344:
	ldr r2, [r0, #0x24]
	cmp r2, #0
	bxeq lr
	cmp r2, r1
	movne r0, r2
	bne _0200A344
	ldr r2, [r1, #0x24]
	str r2, [r0, #0x24]
	cmp r2, #0
	strne r0, [r2, #0x20]
	mov r0, #0
	str r0, [r1, #0x20]
	str r0, [r1, #0x24]
	bx lr

	arm_func_start sub_0200A37C
sub_0200A37C: ; 0x0200A37C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r4, [r0, #0x24]
	b _0200A39C
_0200A38C:
	mov r0, r4
	mov r1, r5
	bl sub_0200A618
	ldr r4, [r4, #0x24]
_0200A39C:
	cmp r4, #0
	bne _0200A38C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A37C

	arm_func_start sub_0200A3A8
sub_0200A3A8: ; 0x0200A3A8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A3D0
_0200A3BC:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A64C
	ldr r4, [r4, #0x24]
_0200A3D0:
	cmp r4, #0
	bne _0200A3BC
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3A8

	arm_func_start sub_0200A3DC
sub_0200A3DC: ; 0x0200A3DC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A404
_0200A3F0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A688
	ldr r4, [r4, #0x24]
_0200A404:
	cmp r4, #0
	bne _0200A3F0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A3DC

	arm_func_start sub_0200A410
sub_0200A410: ; 0x0200A410
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A438
_0200A424:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A6C4
	ldr r4, [r4, #0x24]
_0200A438:
	cmp r4, #0
	bne _0200A424
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A410

	arm_func_start sub_0200A444
sub_0200A444: ; 0x0200A444
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	ldr r4, [r0, #0x24]
	b _0200A46C
_0200A458:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_0200A700
	ldr r4, [r4, #0x24]
_0200A46C:
	cmp r4, #0
	bne _0200A458
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A444

	arm_func_start sub_0200A478
sub_0200A478: ; 0x0200A478
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	str r5, [r6]
	ldr r1, [sp, #0x10]
	str r3, [r6, #4]
	mov r0, r3, lsl #2
	mov r4, r2
	bl MemAlloc
	str r0, [r6, #0x18]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, r0, r4, lsl #1
	str r0, [r6, #0x1c]
	str r1, [r6, #0x20]
	mov r0, r6
	str r1, [r6, #0x24]
	bl sub_0200A544
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200A478

	arm_func_start sub_0200A4C4
sub_0200A4C4: ; 0x0200A4C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	cmp r1, #0
	strne r2, [r1, #0x24]
	cmp r2, #0
	strne r1, [r2, #0x20]
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A4C4

	arm_func_start sub_0200A504
sub_0200A504: ; 0x0200A504
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	arm_func_end sub_0200A504

	arm_func_start sub_0200A510
sub_0200A510: ; 0x0200A510
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4, #8]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	strb r0, [r4, #8]
	ldr r0, [r4]
	mov r1, #1
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A510

	arm_func_start sub_0200A544
sub_0200A544: ; 0x0200A544
	mov ip, #0
	ldr r3, [r0, #0x18]
	mov r2, ip
	b _0200A56C
_0200A554:
	mov r1, r3
	strb r2, [r3], #4
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	add ip, ip, #1
_0200A56C:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200A554
	ldr r2, _0200A58C ; =sub_0200A73C
	mov r1, #1
	str r2, [r0, #0x14]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A58C: .word sub_0200A73C
	arm_func_end sub_0200A544

	arm_func_start sub_0200A590
sub_0200A590: ; 0x0200A590
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r1, r0, r1, lsl #2
_0200A59C:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A59C
	bx lr
	arm_func_end sub_0200A590

	arm_func_start sub_0200A5B0
sub_0200A5B0: ; 0x0200A5B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x18]
	mov lr, #0
	add ip, r0, r1, lsl #2
	b _0200A5EC
_0200A5C4:
	mov r4, r2
	mov r5, ip
	add r2, r2, #4
	add ip, ip, #4
	mov r1, #4
_0200A5D8:
	ldrb r0, [r4], #1
	subs r1, r1, #1
	strb r0, [r5], #1
	bne _0200A5D8
	add lr, lr, #1
_0200A5EC:
	cmp lr, r3
	blt _0200A5C4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200A5B0

	arm_func_start sub_0200A5F8
sub_0200A5F8: ; 0x0200A5F8
	ldr r0, [r0, #0x18]
	mov r3, #4
	add r2, r0, r2, lsl #2
_0200A604:
	ldrb r0, [r2], #1
	subs r3, r3, #1
	strb r0, [r1], #1
	bne _0200A604
	bx lr
	arm_func_end sub_0200A5F8

	arm_func_start sub_0200A618
sub_0200A618: ; 0x0200A618
	strh r1, [r0, #0xa]
	mov r2, #0
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	ldr r1, _0200A648 ; =sub_0200A78C
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A648: .word sub_0200A78C
	arm_func_end sub_0200A618

	arm_func_start sub_0200A64C
sub_0200A64C: ; 0x0200A64C
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A658:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A658
	mov r2, #0
	ldr r1, _0200A684 ; =sub_0200A9E4
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A684: .word sub_0200A9E4
	arm_func_end sub_0200A64C

	arm_func_start sub_0200A688
sub_0200A688: ; 0x0200A688
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A694:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A694
	mov r2, #0
	ldr r1, _0200A6C0 ; =sub_0200ACB0
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6C0: .word sub_0200ACB0
	arm_func_end sub_0200A688

	arm_func_start sub_0200A6C4
sub_0200A6C4: ; 0x0200A6C4
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A6D0:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A6D0
	mov r2, #0
	ldr r1, _0200A6FC ; =TransformPaletteDataWithFlushDivideFade
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A6FC: .word TransformPaletteDataWithFlushDivideFade
	arm_func_end sub_0200A6C4

	arm_func_start sub_0200A700
sub_0200A700: ; 0x0200A700
	strh r1, [r0, #0xa]
	add ip, r0, #0xc
	mov r3, #4
_0200A70C:
	ldrb r1, [r2], #1
	subs r3, r3, #1
	strb r1, [ip], #1
	bne _0200A70C
	mov r2, #0
	ldr r1, _0200A738 ; =sub_0200B0AC
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0200A738: .word sub_0200B0AC
	arm_func_end sub_0200A700

	arm_func_start sub_0200A73C
sub_0200A73C: ; 0x0200A73C
	stmdb sp!, {r4, lr}
	ldr ip, [r0, #0x18]
	ldr lr, [r0, #0x1c]
	mov r4, #0
	b _0200A77C
_0200A750:
	ldrb r1, [ip, #1]
	ldrb r2, [ip, #2]
	ldrb r3, [ip], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r3, r3, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r3, asr #3
	strh r1, [lr], #2
	add r4, r4, #1
_0200A77C:
	ldr r1, [r0, #4]
	cmp r4, r1
	blt _0200A750
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200A73C

	arm_func_start sub_0200A78C
sub_0200A78C: ; 0x0200A78C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r2, [r0, #0xa]
	ldr r1, [r0]
	ldr r3, [r0, #0x18]
	cmp r2, #0x100
	ldr r1, [r1]
	ldr ip, [r0, #0x1c]
	blo _0200A7F0
	mov r5, #0
	b _0200A7E0
_0200A7B4:
	ldrb r1, [r3, #1]
	ldrb r2, [r3, #2]
	ldrb r4, [r3], #4
	and r1, r1, #0xf8
	and r2, r2, #0xf8
	mov r1, r1, lsl #2
	and r4, r4, #0xf8
	orr r1, r1, r2, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add r5, r5, #1
_0200A7E0:
	ldr r1, [r0, #4]
	cmp r5, r1
	blt _0200A7B4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A7F0:
	cmp r2, #0
	bne _0200A898
	cmp r1, #2
	bne _0200A874
	mov lr, #0
	mov r1, lr
	mov r2, lr
	b _0200A864
_0200A810:
	mov r4, r2
_0200A814:
	add r4, r4, #1
	cmp r4, #0xf0
	strh r1, [ip], #2
	add lr, lr, #1
	blt _0200A814
	mov r4, r1
_0200A82C:
	ldrb r5, [r3, #1]
	ldrb r6, [r3, #2]
	ldrb r7, [r3], #4
	and r5, r5, #0xf8
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	add r4, r4, #1
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	cmp r4, #0x10
	strh r5, [ip], #2
	add lr, lr, #1
	blt _0200A82C
_0200A864:
	ldr r4, [r0, #4]
	cmp lr, r4
	blt _0200A810
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A874:
	mov r3, #0
	mov r2, r3
	b _0200A888
_0200A880:
	strh r2, [ip], #2
	add r3, r3, #1
_0200A888:
	ldr r1, [r0, #4]
	cmp r3, r1
	blt _0200A880
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A898:
	cmp r1, #2
	mov lr, #0
	bne _0200A9D4
	b _0200A95C
_0200A8A8:
	mov r4, #0
_0200A8AC:
	ldrb r1, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	mul r7, r1, r2
	mul r8, r5, r2
	mul r1, r6, r2
	mov r5, r7, asr #7
	add r7, r7, r5, lsr #24
	mov r6, r8, asr #7
	mov r5, r1, asr #7
	add r1, r1, r5, lsr #24
	add r6, r8, r6, lsr #24
	mov r1, r1, lsl #8
	add r4, r4, #1
	mov r7, r7, lsl #8
	mov r5, r6, lsl #8
	mov r6, r7, lsr #0x10
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r1, lsr #0x10
	mov r1, r5, lsl #2
	and r6, r7, #0xf8
	and r5, r8, #0xf8
	orr r1, r1, r6, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [ip], #2
	cmp r4, #0xf0
	add lr, lr, #1
	blt _0200A8AC
	mov r1, #0
_0200A924:
	ldrb r4, [r3, #1]
	ldrb r5, [r3, #2]
	ldrb r6, [r3], #4
	and r4, r4, #0xf8
	and r5, r5, #0xf8
	mov r4, r4, lsl #2
	add r1, r1, #1
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	cmp r1, #0x10
	strh r4, [ip], #2
	add lr, lr, #1
	blt _0200A924
_0200A95C:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A8A8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0200A96C:
	ldrb r1, [r3, #1]
	ldrb r4, [r3, #2]
	ldrb r5, [r3], #4
	mul r6, r1, r2
	mul r7, r4, r2
	mul r1, r5, r2
	mov r4, r6, asr #7
	add r6, r6, r4, lsr #24
	mov r5, r7, asr #7
	mov r4, r1, asr #7
	add r1, r1, r4, lsr #24
	add r5, r7, r5, lsr #24
	mov r1, r1, lsl #8
	mov r6, r6, lsl #8
	mov r4, r5, lsl #8
	mov r5, r6, lsr #0x10
	mov r6, r4, lsr #0x10
	and r4, r5, #0xf8
	mov r7, r1, lsr #0x10
	mov r1, r4, lsl #2
	and r5, r6, #0xf8
	and r4, r7, #0xf8
	orr r1, r1, r5, lsl #7
	orr r1, r1, r4, asr #3
	strh r1, [ip], #2
	add lr, lr, #1
_0200A9D4:
	ldr r1, [r0, #4]
	cmp lr, r1
	blt _0200A96C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200A78C

	arm_func_start sub_0200A9E4
sub_0200A9E4: ; 0x0200A9E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, [r0]
	ldrh r5, [r0, #0xa]
	ldr r1, [r1]
	add r4, sp, #0
	add r6, r0, #0xc
	mov r3, #4
_0200AA00:
	ldrb r2, [r6], #1
	subs r3, r3, #1
	strb r2, [r4], #1
	bne _0200AA00
	cmp r5, #0x100
	ldr r2, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AA64
	mov r6, #0
	b _0200AA54
_0200AA28:
	ldrb r1, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r5, [r2], #4
	and r1, r1, #0xf8
	and r3, r3, #0xf8
	mov r1, r1, lsl #2
	and r5, r5, #0xf8
	orr r1, r1, r3, lsl #7
	orr r1, r1, r5, asr #3
	strh r1, [r4], #2
	add r6, r6, #1
_0200AA54:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AA28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AA64:
	cmp r5, #0
	bne _0200AB38
	ldrb r3, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r3, r3, #0xf8
	and r5, r5, #0xf8
	mov r3, r3, lsl #2
	and r6, r6, #0xf8
	orr r3, r3, r5, lsl #7
	orr r3, r3, r6, asr #3
	mov r3, r3, lsl #0x10
	cmp r1, #2
	mov r5, r3, lsr #0x10
	bne _0200AB18
	mov r6, #0
	mov r3, r6
	mov r1, r6
	b _0200AB08
_0200AAB0:
	mov r7, r3
_0200AAB4:
	add r7, r7, #1
	cmp r7, #0xf0
	strh r5, [r4], #2
	add r2, r2, #4
	add r6, r6, #1
	blt _0200AAB4
	mov r7, r1
_0200AAD0:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb sl, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	add r7, r7, #1
	and sl, sl, #0xf8
	orr r8, r8, sb, lsl #7
	orr r8, r8, sl, asr #3
	cmp r7, #0x10
	strh r8, [r4], #2
	add r6, r6, #1
	blt _0200AAD0
_0200AB08:
	ldr r7, [r0, #4]
	cmp r6, r7
	blt _0200AAB0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB18:
	mov r2, #0
	b _0200AB28
_0200AB20:
	strh r5, [r4], #2
	add r2, r2, #1
_0200AB28:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AB20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AB38:
	rsb r3, r5, #0x100
	mov r3, r3, lsl #0x10
	ldrb r8, [sp]
	mov sb, r3, lsr #0x10
	ldrb r7, [sp, #1]
	ldrb r6, [sp, #2]
	mul r3, r8, sb
	mul ip, r7, sb
	mul lr, r6, sb
	cmp r1, #2
	bne _0200AC30
	mov r6, #0
	b _0200AC20
_0200AB6C:
	mov r7, #0
_0200AB70:
	ldrb r1, [r2, #1]
	ldrb fp, [r2, #2]
	ldrb sb, [r2], #4
	mla sl, r1, r5, ip
	mla r8, fp, r5, lr
	mla r1, sb, r5, r3
	mov sb, sl, asr #7
	add sb, sl, sb, lsr #24
	mov fp, r8, asr #7
	add r8, r8, fp, lsr #24
	mov sl, r1, asr #7
	mov sb, sb, lsl #8
	add r1, r1, sl, lsr #24
	mov r8, r8, lsl #8
	mov r1, r1, lsl #8
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	mov sb, sb, lsr #0x10
	mov sl, r8, lsr #0x10
	and r8, sb, #0xf8
	and sb, sl, #0xf8
	mov r8, r8, lsl #2
	and r1, r1, #0xf8
	orr r8, r8, sb, lsl #7
	orr r1, r8, r1, asr #3
	strh r1, [r4], #2
	cmp r7, #0xf0
	add r6, r6, #1
	blt _0200AB70
	mov r7, #0
_0200ABE8:
	ldrb r8, [r2, #1]
	ldrb sb, [r2, #2]
	ldrb r1, [r2], #4
	and r8, r8, #0xf8
	and sb, sb, #0xf8
	mov r8, r8, lsl #2
	and sl, r1, #0xf8
	orr r1, r8, sb, lsl #7
	add r7, r7, #1
	orr r1, r1, sl, asr #3
	cmp r7, #0x10
	strh r1, [r4], #2
	add r6, r6, #1
	blt _0200ABE8
_0200AC20:
	ldr r1, [r0, #4]
	cmp r6, r1
	blt _0200AB6C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0200AC30:
	mov r7, #0
	b _0200ACA0
_0200AC38:
	ldrb r1, [r2, #1]
	ldrb r6, [r2, #2]
	ldrb r8, [r2], #4
	mla sl, r1, r5, ip
	mla r1, r6, r5, lr
	mla r6, r8, r5, r3
	mov r8, sl, asr #7
	add sl, sl, r8, lsr #24
	mov sb, r1, asr #7
	mov r8, r6, asr #7
	add sb, r1, sb, lsr #24
	add r1, r6, r8, lsr #24
	mov sl, sl, lsl #8
	mov r6, sb, lsl #8
	mov r8, sl, lsr #0x10
	mov r1, r1, lsl #8
	mov sb, r6, lsr #0x10
	and r6, r8, #0xf8
	mov sl, r1, lsr #0x10
	mov r1, r6, lsl #2
	and r8, sb, #0xf8
	and r6, sl, #0xf8
	orr r1, r1, r8, lsl #7
	orr r1, r1, r6, asr #3
	strh r1, [r4], #2
	add r7, r7, #1
_0200ACA0:
	ldr r1, [r0, #4]
	cmp r7, r1
	blt _0200AC38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200A9E4

	arm_func_start sub_0200ACB0
sub_0200ACB0: ; 0x0200ACB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r1, [r0]
	ldrh r2, [r0, #0xa]
	ldr r1, [r1]
	add r5, sp, #0
	add r6, r0, #0xc
	mov r4, #4
_0200ACD0:
	ldrb r3, [r6], #1
	subs r4, r4, #1
	strb r3, [r5], #1
	bne _0200ACD0
	cmp r2, #0x100
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	blo _0200AD20
	ldrb r2, [sp, #1]
	ldrb r5, [sp, #2]
	ldrb r6, [sp]
	and r2, r2, #0xf8
	and r5, r5, #0xf8
	mov r2, r2, lsl #2
	and r6, r6, #0xf8
	orr r2, r2, r5, lsl #7
	orr r2, r2, r6, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	b _0200AD94
_0200AD20:
	cmp r2, #0
	moveq ip, #0
	beq _0200AD94
	ldrb r5, [sp, #1]
	ldrb r7, [sp, #2]
	ldrb ip, [sp]
	mul r6, r5, r2
	mul r8, r7, r2
	mul r7, ip, r2
	mov r2, r6, asr #7
	mov r5, r8, asr #7
	add ip, r6, r2, lsr #24
	mov r2, r7, asr #7
	add r5, r8, r5, lsr #24
	mov ip, ip, lsl #8
	add r2, r7, r2, lsr #24
	mov r5, r5, lsl #8
	mov r6, ip, lsr #0x10
	mov r2, r2, lsl #8
	mov r7, r5, lsr #0x10
	and r5, r6, #0xf8
	mov r8, r2, lsr #0x10
	and r6, r7, #0xf8
	mov r2, r5, lsl #2
	and r5, r8, #0xf8
	orr r2, r2, r6, lsl #7
	orr r2, r2, r5, asr #3
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
_0200AD94:
	cmp r1, #2
	bne _0200AE14
	mov lr, #0
	mov r2, lr
	mov r1, lr
	b _0200AE04
_0200ADAC:
	mov r5, r2
_0200ADB0:
	add r5, r5, #1
	cmp r5, #0xf0
	strh ip, [r4], #2
	add r3, r3, #4
	add lr, lr, #1
	blt _0200ADB0
	mov r5, r1
_0200ADCC:
	ldrb r6, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r8, [r3], #4
	and r6, r6, #0xf8
	and r7, r7, #0xf8
	mov r6, r6, lsl #2
	add r5, r5, #1
	and r8, r8, #0xf8
	orr r6, r6, r7, lsl #7
	orr r6, r6, r8, asr #3
	cmp r5, #0x10
	strh r6, [r4], #2
	add lr, lr, #1
	blt _0200ADCC
_0200AE04:
	ldr r5, [r0, #4]
	cmp lr, r5
	blt _0200ADAC
	b _0200AE30
_0200AE14:
	mov r2, #0
	b _0200AE24
_0200AE1C:
	strh ip, [r4], #2
	add r2, r2, #1
_0200AE24:
	ldr r1, [r0, #4]
	cmp r2, r1
	blt _0200AE1C
_0200AE30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0200ACB0

; https://decomp.me/scratch/xdMiD
	arm_func_start TransformPaletteDataWithFlushDivideFade
TransformPaletteDataWithFlushDivideFade: ; 0x0200AE38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r1, [sl]
	ldrh r0, [sl, #0xa]
	ldr fp, [r1]
	add r3, sp, #0x14
	add r4, sl, #0xc
	mov r2, #4
_0200AE5C:
	ldrb r1, [r4], #1
	subs r2, r2, #1
	strb r1, [r3], #1
	bne _0200AE5C
	cmp r0, #0x100
	ldr r4, [sl, #0x18]
	ldr r5, [sl, #0x1c]
	blo _0200AEC0
	mov r3, #0
	b _0200AEB0
_0200AE84:
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r4], #4
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	and r2, r2, #0xf8
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [r5], #2
	add r3, r3, #1
_0200AEB0:
	ldr r0, [sl, #4]
	cmp r3, r0
	blt _0200AE84
	b _0200B0A4
_0200AEC0:
	ldrb sb, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	ldrb r3, [sp, #0x16]
	rsb r6, sb, #0xff
	mul r8, r6, r0
	rsb r2, r7, #0xff
	mov ip, r8, asr #7
	add r8, r8, ip, lsr #24
	add r8, sb, r8, asr #8
	rsb r1, r3, #0xff
	mul r6, r2, r0
	mul r2, r1, r0
	mov r0, r6, asr #7
	mov r1, r2, asr #7
	add r0, r6, r0, lsr #24
	add r1, r2, r1, lsr #24
	add r6, r7, r0, asr #8
	add r2, r3, r1, asr #8
	mov r0, r8, lsl #0x10
	mov r1, r6, lsl #0x10
	mov r2, r2, lsl #0x10
	cmp fp, #2
	mov r8, r0, lsr #0x10
	mov r6, r1, lsr #0x10
	mov r7, r2, lsr #0x10
	mov sb, #0
	bne _0200B098
	b _0200B004
_0200AF30:
	mov fp, #0
_0200AF34:
	ldrb r2, [r4]
	str r5, [sp]
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r6
	bl _s32_div_f
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add sb, sb, #1
	blt _0200AF34
	mov r1, #0
_0200AFCC:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r5], #2
	add sb, sb, #1
	blt _0200AFCC
_0200B004:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200AF30
	b _0200B0A4
_0200B014:
	ldrb r2, [r4]
	mov fp, r5
	mov r1, #0xff
	mul r0, r2, r8
	add r5, r5, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r6
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add sb, sb, #1
_0200B098:
	ldr r0, [sl, #4]
	cmp sb, r0
	blt _0200B014
_0200B0A4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end TransformPaletteDataWithFlushDivideFade

	arm_func_start sub_0200B0AC
sub_0200B0AC: ; 0x0200B0AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r0, [sl]
	ldrh r3, [sl, #0xa]
	ldr r2, [r0]
	add r4, sp, #0x14
	add r5, sl, #0xc
	mov r1, #4
_0200B0D0:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r4], #1
	bne _0200B0D0
	ldrb r0, [sp, #0x14]
	ldrb r7, [sp, #0x15]
	cmp r3, #0x100
	movhs r3, #0x100
	ldrb r5, [sp, #0x16]
	mul r1, r0, r3
	mul r0, r7, r3
	mul r8, r5, r3
	mov r3, r1, asr #7
	mov r5, r0, asr #7
	add r1, r1, r3, lsr #24
	add r3, r0, r5, lsr #24
	mov r0, r1, lsl #8
	mov r7, r8, asr #7
	add r5, r8, r7, lsr #24
	mov r1, r3, lsl #8
	mov r3, r5, lsl #8
	ldr r4, [sl, #0x18]
	ldr r6, [sl, #0x1c]
	cmp r2, #2
	mov sb, r0, lsr #0x10
	mov r7, r1, lsr #0x10
	mov r8, r3, lsr #0x10
	mov r5, #0
	bne _0200B2B0
	b _0200B21C
_0200B148:
	mov fp, #0
_0200B14C:
	ldrb r2, [r4]
	str r6, [sp]
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #4]
	mov r1, #0xff
	mul r0, r2, r8
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #8]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldr r1, [sp, #4]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #8]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	add fp, fp, #1
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r1, r0, r2, asr #3
	ldr r0, [sp]
	add r4, r4, #4
	strh r1, [r0]
	cmp fp, #0xf0
	add r5, r5, #1
	blt _0200B14C
	mov r1, #0
_0200B1E4:
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r0, [r4], #4
	and r2, r2, #0xf8
	and r3, r3, #0xf8
	mov r2, r2, lsl #2
	and fp, r0, #0xf8
	orr r0, r2, r3, lsl #7
	add r1, r1, #1
	orr r0, r0, fp, asr #3
	cmp r1, #0x10
	strh r0, [r6], #2
	add r5, r5, #1
	blt _0200B1E4
_0200B21C:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B148
	b _0200B2BC
_0200B22C:
	ldrb r2, [r4]
	mov fp, r6
	mov r1, #0xff
	mul r0, r2, sb
	add r6, r6, #2
	bl _s32_div_f
	ldrb r2, [r4, #2]
	str r0, [sp, #0xc]
	mov r1, #0xff
	mul r0, r2, r8
	bl _s32_div_f
	ldrb r2, [r4, #1]
	str r0, [sp, #0x10]
	mov r1, #0xff
	mul r0, r2, r7
	bl _s32_div_f
	ldr r1, [sp, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r2, r1, #0xf8
	ldr r1, [sp, #0x10]
	mov r0, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	and r0, r0, #0xf8
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	orr r0, r0, r1, lsl #7
	orr r0, r0, r2, asr #3
	strh r0, [fp]
	add r4, r4, #4
	add r5, r5, #1
_0200B2B0:
	ldr r0, [sl, #4]
	cmp r5, r0
	blt _0200B22C
_0200B2BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0200B0AC

	arm_func_start sub_0200B2C4
sub_0200B2C4: ; 0x0200B2C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	strb r1, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	str r3, [r4, #0x10]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r2, [r4, #0xc]
	ldrb r2, [r4]
	ldr r0, _0200B310 ; =_02092AD8
	ldr r1, [sp, #8]
	ldr r0, [r0, r2, lsl #2]
	str r0, [r4, #0x14]
	bl MemAlloc
	str r0, [r4, #0x18]
	mov r0, r4
	bl sub_0200B3D4
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B310: .word _02092AD8
	arm_func_end sub_0200B2C4

	arm_func_start sub_0200B314
sub_0200B314: ; 0x0200B314
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x18]
	bl MemFree
	mov r0, #0
	str r0, [r4, #0x18]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B314

	arm_func_start sub_0200B330
sub_0200B330: ; 0x0200B330
	mov r1, #1
	strb r1, [r0, #1]
	bx lr
	arm_func_end sub_0200B330

	arm_func_start sub_0200B33C
sub_0200B33C: ; 0x0200B33C
	bx lr
	arm_func_end sub_0200B33C

	arm_func_start sub_0200B340
sub_0200B340: ; 0x0200B340
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, _0200B3BC ; =0x000001FF
	ldmib r4, {r1, r2}
	and r1, r1, r0
	mov r2, r2, lsl #0x17
	ldr r0, [r4, #0xc]
	orr r1, r1, r2, lsr #7
	str r1, [r0]
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0200B3B4
	ldr r5, [r4, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	ldr r6, [r4, #0x10]
	bl sub_0207A2DC
	ldr ip, [r4, #0x14]
	mov r2, r6
	mov r3, r5
	mov r0, #3
	mov r1, #1
	str ip, [sp]
	bl sub_02005E10
	mov r0, #3
	bl sub_02005D30
	mov r0, #0
	strb r0, [r4, #1]
_0200B3B4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0200B3BC: .word 0x000001FF
	arm_func_end sub_0200B340

	arm_func_start sub_0200B3C0
sub_0200B3C0: ; 0x0200B3C0
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0200B3C0

	arm_func_start sub_0200B3D4
sub_0200B3D4: ; 0x0200B3D4
	mov r3, #0
	ldr ip, [r0, #0x18]
	mov r2, r3
	b _0200B3EC
_0200B3E4:
	strh r2, [ip], #2
	add r3, r3, #1
_0200B3EC:
	ldr r1, [r0, #0x14]
	cmp r3, r1, lsr #1
	blo _0200B3E4
	bx lr
	arm_func_end sub_0200B3D4

	arm_func_start sub_0200B3FC
sub_0200B3FC: ; 0x0200B3FC
	ldrb r3, [r0]
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	bx lr
_0200B40C: ; jump table
	b _0200B41C ; case 0
	b _0200B438 ; case 1
	b _0200B470 ; case 2
	b _0200B48C ; case 3
_0200B41C:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B438:
	ldr ip, [r1]
	ldr r3, [r0, #0x18]
	cmp ip, #0x20
	ldrlt r0, [r1, #4]
	movlt r1, ip, lsl #1
	addlt r0, r3, r0, lsl #6
	strlth r2, [r1, r0]
	bxlt lr
	ldr r0, [r1, #4]
	add r0, r3, r0, lsl #6
	add r0, r0, ip, lsl #1
	add r0, r0, #0x700
	strh r2, [r0, #0xc0]
	bx lr
_0200B470:
	ldr ip, [r0, #0x18]
	ldr r0, [r1, #4]
	ldr r3, [r1]
	add r0, ip, r0, lsl #6
	mov r1, r3, lsl #1
	strh r2, [r1, r0]
	bx lr
_0200B48C:
	ldr ip, [r1, #4]
	cmp ip, #0x40
	bge _0200B4C4
	ldr r1, [r1]
	ldr r0, [r0, #0x18]
	cmp r1, #0x20
	movlt r1, r1, lsl #1
	addlt r0, r0, ip, lsl #6
	strlth r2, [r1, r0]
	addge r0, r0, ip, lsl #6
	addge r0, r0, r1, lsl #1
	addge r0, r0, #0x700
	strgeh r2, [r0, #0xc0]
	bx lr
_0200B4C4:
	ldr r3, [r1]
	ldr r1, [r0, #0x18]
	cmp r3, #0x20
	subge r0, ip, #0x20
	addge r0, r1, r0, lsl #6
	addge r0, r0, r3, lsl #1
	addge r0, r0, #0x1700
	strgeh r2, [r0, #0xc0]
	bxge lr
	sub r0, ip, #0x20
	add r0, r1, r0, lsl #6
	add r0, r0, r3, lsl #1
	add r0, r0, #0x1000
	strh r2, [r0]
	bx lr
	arm_func_end sub_0200B3FC

	arm_func_start sub_0200B500
sub_0200B500: ; 0x0200B500
	ldr r0, [r0, #0x18]
	bx lr
	arm_func_end sub_0200B500

	arm_func_start sub_0200B508
sub_0200B508: ; 0x0200B508
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	str r2, [r5, #4]
	mov r0, #0
	strb r0, [r5, #0x14]
	str r3, [r5, #0x18]
	cmp r2, #0
	strle r0, [r5, #0xc]
	ble _0200B550
	ldr r1, [sp, #0x10]
	mov r0, r2, lsl #1
	bl MemAlloc
	str r0, [r5, #0xc]
	ldr r1, [sp, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
_0200B550:
	ldr r1, [sp, #0x10]
	str r0, [r5, #0x10]
	mov r0, r4, lsl #3
	bl MemAlloc
	str r0, [r5, #0x1c]
	mov r0, r5
	bl sub_0200B67C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B508

	arm_func_start sub_0200B570
sub_0200B570: ; 0x0200B570
	mov r1, #1
	strb r1, [r0, #0x14]
	bx lr
	arm_func_end sub_0200B570

	arm_func_start sub_0200B57C
sub_0200B57C: ; 0x0200B57C
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0, #8]
	cmp ip, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr r3, [r0]
	ldr r2, [r0, #0x1c]
	sub r1, r3, #1
	add lr, r2, r1, lsl #3
	sub r3, r3, ip
	ldr r4, [r0, #0xc]
	mov r2, #0x200
	mov r1, #0
	b _0200B5C4
_0200B5B0:
	strh r2, [lr]
	strh r1, [lr, #2]
	strh r1, [lr, #4]
	sub lr, lr, #8
	sub r3, r3, #1
_0200B5C4:
	cmp r3, #0
	bgt _0200B5B0
	ldr r5, [r0, #4]
	mvn r3, #0
	b _0200B61C
_0200B5D8:
	ldrsh ip, [r4]
	strh r3, [r4], #2
	b _0200B610
_0200B5E4:
	ldr r2, [r0, #0x10]
	mov r1, ip, lsl #3
	ldrh r1, [r2, r1]
	add r2, r2, ip, lsl #3
	strh r1, [lr]
	ldrh r1, [r2, #2]
	strh r1, [lr, #2]
	ldrh r1, [r2, #4]
	strh r1, [lr, #4]
	ldrsh ip, [r2, #6]
	sub lr, lr, #8
_0200B610:
	cmp ip, #0
	bge _0200B5E4
	sub r5, r5, #1
_0200B61C:
	cmp r5, #0
	bgt _0200B5D8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B57C

	arm_func_start sub_0200B630
sub_0200B630: ; 0x0200B630
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r4, [r6, #0x1c]
	ldr r1, [r6]
	mov r0, r4
	mov r1, r1, lsl #3
	ldr r5, [r6, #0x18]
	bl sub_0207A2DC
	ldr r2, [r6]
	mov r0, r5
	mov r1, r4
	mov r2, r2, lsl #3
	bl Memcpy32
	mov r0, #0
	strb r0, [r6, #0x14]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0200B630

	arm_func_start sub_0200B67C
sub_0200B67C: ; 0x0200B67C
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x1c]
	mov lr, #0
	str lr, [r0, #8]
	mov r3, #0x200
	mov r2, lr
	b _0200B6B0
_0200B698:
	strh r3, [ip]
	strh r2, [ip, #2]
	strh r2, [ip, #4]
	strh r2, [ip, #6]
	add ip, ip, #8
	add lr, lr, #1
_0200B6B0:
	ldr r1, [r0]
	cmp lr, r1
	blt _0200B698
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmleia sp!, {r3, pc}
	ldr r3, [r0, #0xc]
	mov ip, #0
	mvn r2, #0
	b _0200B6E0
_0200B6D8:
	strh r2, [r3], #2
	add ip, ip, #1
_0200B6E0:
	ldr r1, [r0, #4]
	cmp ip, r1
	blt _0200B6D8
	ldmia sp!, {r3, pc}
	arm_func_end sub_0200B67C

	arm_func_start sub_0200B6F0
sub_0200B6F0: ; 0x0200B6F0
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r3, [r0]
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
	cmp r2, #0
	movlt r2, #0
	blt _0200B71C
	ldr r3, [r0, #4]
	cmp r2, r3
	subge r2, r3, #1
_0200B71C:
	ldrh r3, [r1]
	ldr lr, [r0, #0x10]
	mov ip, r4, lsl #3
	strh r3, [lr, ip]
	ldrh ip, [r1, #2]
	add lr, lr, r4, lsl #3
	mov r3, r2, lsl #1
	strh ip, [lr, #2]
	ldrh r1, [r1, #4]
	strh r1, [lr, #4]
	ldr r1, [r0, #0xc]
	ldrsh r1, [r1, r3]
	strh r1, [lr, #6]
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	strh r2, [r0, r3]
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B6F0

	arm_func_start sub_0200B768
sub_0200B768: ; 0x0200B768
#ifdef EUROPE
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	bl GetLanguage
	ldr r1, _0200B7E4 ; =_020AFF38_EU
	mov r4, r0
	ldrsb r0, [r1]
	cmp r0, r4
	beq _0200B7DC
	ldr r1, _0200B7E8 ; =_020AFF3C_EU
	add r0, sp, #0
	ldr r1, [r1, r4, lsl #2]
	mov r2, #1
	bl LoadFileFromRom
	ldr r2, _0200B7EC ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	ldr r0, _0200B7F0 ; =CART_REMOVED_IMG_DATA
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl MemcpySimple
	ldr r2, _0200B7EC ; =0x04000208
	add r0, sp, #0
	ldrh r1, [r2]
	mov r1, #1
	strh r1, [r2]
	bl UnloadFile
	ldr r0, _0200B7E4 ; =_020AFF38_EU
	strb r4, [r0]
_0200B7DC:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B7E4: .word _020AFF38_EU
_0200B7E8: .word _020AFF3C_EU
_0200B7EC: .word 0x04000208
_0200B7F0: .word CART_REMOVED_IMG_DATA
#else
	bx lr
#endif
	arm_func_end sub_0200B768

	arm_func_start sub_0200B76C
sub_0200B76C: ; 0x0200B76C
	stmdb sp!, {r4, lr}
	bl GX_DispOff
	ldr r2, _0200B874 ; =0x04001000
	mov r0, #3
	ldr r1, [r2]
	bic r1, r1, #0x10000
	str r1, [r2]
	bl sub_0207C164
	bl GX_DisableBankForBG
	bl GX_DisableBankForOBJ
	bl GX_DisableBankForBGExtPltt
	bl GX_DisableBankForOBJExtPltt
	bl GX_DisableBankForTex
	bl GX_DisableBankForTexPltt
	bl GX_DisableBankForSubBG
	bl GX_DisableBankForSubOBJ
	bl GX_DisableBankForSubBGExtPltt
	ldr r0, _0200B878 ; =0x000001FF
	bl GX_SetBankForLCDC
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl ArrayFill32Fast
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0xc0
	ldr r1, _0200B87C ; =0x07000400
	mov r2, #0x400
	bl ArrayFill32Fast
	mov r0, #0
	ldr r1, _0200B880 ; =0x05000400
	mov r2, #0x400
	bl ArrayFill32Fast
	bl sub_02019304
	mov r4, r0
	ldr r1, _0200B884 ; =CART_REMOVED_IMG_DATA
	mov r2, #0xc000
	bl MemcpySimple
	mov r2, r4
	ldr r0, _0200B888 ; =0x06806000
	mov r1, #0xc000
	bl DecompressAtFromMemoryPointer
	mov r0, #2
	mov r1, #0
	mov r2, r1
	bl GX_SetGraphicsMode
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r0, _0200B88C ; =0x0400006C
	mov r1, #0
	bl GXx_SetMasterBrightness_
	ldr r0, _0200B890 ; =0x0400106C
	mov r1, #0
	bl GXx_SetMasterBrightness_
	bl GX_DispOn
	ldr r1, _0200B874 ; =0x04001000
	ldr r0, [r1]
	orr r0, r0, #0x10000
	str r0, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0200B874: .word 0x04001000
_0200B878: .word 0x000001FF
_0200B87C: .word 0x07000400
_0200B880: .word 0x05000400
_0200B884: .word CART_REMOVED_IMG_DATA
_0200B888: .word 0x06806000
_0200B88C: .word 0x0400006C
_0200B890: .word 0x0400106C
	arm_func_end sub_0200B76C

	arm_func_start sub_0200B894
sub_0200B894: ; 0x0200B894
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x1c
	bl sub_0200A2CC
	mov r0, r5
	mov r1, r4
	bl sub_0200B8D4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0200B894

	arm_func_start sub_0200B8B8
sub_0200B8B8: ; 0x0200B8B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	bl sub_0200B8D4
	add r0, r4, #0x1c
	bl sub_0200A2F4
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200B8B8

	arm_func_start sub_0200B8D4
sub_0200B8D4: ; 0x0200B8D4
	ldr r2, _0200B904 ; =_02094AE8
	mov r1, r1, lsl #1
	mov r3, #0
	ldrsh r1, [r2, r1]
	str r3, [r0]
	mov r2, #1
	str r2, [r0, #4]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x14]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	bx lr
	.align 2, 0
_0200B904: .word _02094AE8
	arm_func_end sub_0200B8D4

	arm_func_start sub_0200B908
sub_0200B908: ; 0x0200B908
	ldr ip, _0200B914 ; =_0200A314
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B914: .word _0200A314
	arm_func_end sub_0200B908

	arm_func_start sub_0200B918
sub_0200B918: ; 0x0200B918
	ldr ip, _0200B924 ; =_0200A344
	add r0, r0, #0x1c
	bx ip
	.align 2, 0
_0200B924: .word _0200A344
	arm_func_end sub_0200B918

	arm_func_start sub_0200B928
sub_0200B928: ; 0x0200B928
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200B958
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200B958:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #2
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #3
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200B928

	arm_func_start UpdateFadeStatus
UpdateFadeStatus: ; 0x0200B990
	ldr r3, _0200BA00 ; =_02094AE8
	mov ip, r1, lsl #1
	ldrsh r3, [r3, ip]
	cmp r2, #0
	strh r3, [r0, #0x10]
	ldrnesh r3, [r0, #0x10]
	ldrnesh ip, [r0, #0x14]
	cmpne ip, r3
	bne _0200B9D4
	ldrsh r3, [r0, #0x10]
	mov r2, #1
	mov r1, #0
	strh r3, [r0, #0x14]
	str r2, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
_0200B9D4:
	cmp r2, #0
	movlt r2, #0x1e
	cmp r3, #0
	sublt r3, ip, r3
	subge r3, r3, ip
	strh r3, [r0, #0x12]
	ldr r3, _0200BA04 ; =_02094AF0
	ldr r1, [r3, r1, lsl #2]
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
	.align 2, 0
_0200BA00: .word _02094AE8
_0200BA04: .word _02094AF0
	arm_func_end UpdateFadeStatus

	arm_func_start HandleFades
HandleFades: ; 0x0200BA08
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _0200BB58
_0200BA20: ; jump table
	b _0200BB50 ; case 0
	b _0200BB40 ; case 1
	b _0200BA38 ; case 2
	b _0200BA80 ; case 3
	b _0200BAC8 ; case 4
	b _0200BB04 ; case 5
_0200BA38:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BA78
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
	strh r0, [r4, #0x14]
_0200BA78:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BA80:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r1, [r4, #0x10]
	movle r0, #0
	strleh r1, [r4, #0x14]
	strle r0, [r4, #4]
	ble _0200BAC0
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
	strh r0, [r4, #0x14]
_0200BAC0:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BAC8:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BAF8
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	sub r0, r1, r0
_0200BAF8:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB04:
	ldr r0, [r4, #8]
	sub r2, r0, #1
	str r2, [r4, #8]
	cmp r2, #0
	ldrlesh r0, [r4, #0x10]
	ble _0200BB34
	ldrsh r0, [r4, #0x12]
	ldr r1, [r4, #0xc]
	mul r0, r2, r0
	bl _s32_div_f
	ldrsh r1, [r4, #0x10]
	add r0, r1, r0
_0200BB34:
	strh r0, [r4, #0x14]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB40:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_0200BB50:
	mov r0, #0
	ldmia sp!, {r4, pc}
_0200BB58:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end HandleFades

	arm_func_start sub_0200BB60
sub_0200BB60: ; 0x0200BB60
	ldr ip, _0200BB70 ; =sub_0200B928
	mov r2, #1
	str r2, [r0]
	bx ip
	.align 2, 0
_0200BB70: .word sub_0200B928
	arm_func_end sub_0200BB60

	arm_func_start sub_0200BB74
sub_0200BB74: ; 0x0200BB74
	ldr ip, _0200BB84 ; =UpdateFadeStatus
	mov r3, #1
	str r3, [r0]
	bx ip
	.align 2, 0
_0200BB84: .word UpdateFadeStatus
	arm_func_end sub_0200BB74

	arm_func_start sub_0200BB88
sub_0200BB88: ; 0x0200BB88
	mov r2, #1
	str r2, [r0]
	mov r2, #0
	strh r2, [r0, #0x10]
	cmp r1, #0
	ldrnesh r2, [r0, #0x14]
	cmpne r2, #0
	bne _0200BBC0
	mov r2, #0
	strh r2, [r0, #0x14]
	mov r1, #1
	stmib r0, {r1, r2}
	str r2, [r0, #0xc]
	bx lr
_0200BBC0:
	cmp r1, #0
	movlt r1, #0x1e
	cmp r2, #0
	movlt r2, #4
	strlt r2, [r0, #4]
	ldrltsh r2, [r0, #0x14]
	rsblt r2, r2, #0
	movge r2, #5
	strge r2, [r0, #4]
	ldrgesh r2, [r0, #0x14]
	strh r2, [r0, #0x12]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	arm_func_end sub_0200BB88

	arm_func_start sub_0200BBF8
sub_0200BBF8: ; 0x0200BBF8
	mov ip, #1
	cmp r1, #0
	movlt r1, #0x1e
	str ip, [r0]
	cmp r2, r3
	movgt ip, #3
	strgt ip, [r0, #4]
	subgt ip, r2, r3
	strgth ip, [r0, #0x12]
	bgt _0200BC40
	movlt ip, #2
	strlt ip, [r0, #4]
	sublt ip, r3, r2
	strlth ip, [r0, #0x12]
	movge ip, #1
	strge ip, [r0, #4]
	movge ip, #0
	strgeh ip, [r0, #0x12]
_0200BC40:
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strh r2, [r0, #0x14]
	strh r3, [r0, #0x10]
	bx lr
	arm_func_end sub_0200BBF8

	arm_func_start sub_0200BC54
sub_0200BC54: ; 0x0200BC54
	ldr ip, _0200BC5C ; =HandleFades
	bx ip
	.align 2, 0
_0200BC5C: .word HandleFades
	arm_func_end sub_0200BC54

	arm_func_start sub_0200BC60
sub_0200BC60: ; 0x0200BC60
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BC70:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BC70
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BCA4
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCA4:
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BC60

	arm_func_start sub_0200BCB0
sub_0200BCB0: ; 0x0200BCB0
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BCC0:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BCC0
	cmp r1, #1
	bne _0200BCE4
	mov r1, #1
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCE4:
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BD08
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
_0200BD08:
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BCB0

	arm_func_start sub_0200BD14
sub_0200BD14: ; 0x0200BD14
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0200BD14

	arm_func_start GetFadeStatus
GetFadeStatus: ; 0x0200BD2C
	ldrsh r1, [r0, #0x10]
	mvn r0, #0xff
	cmp r1, r0
	moveq r0, #1
	bxeq lr
	cmp r1, #0x100
	moveq r0, #2
	movne r0, #0
	bx lr
	arm_func_end GetFadeStatus

	arm_func_start sub_0200BD50
sub_0200BD50: ; 0x0200BD50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, [r4, #4]
	cmpeq r0, #0
	beq _0200C000
	mov r0, r4
	bl HandleFades
	cmp r0, #0
	beq _0200BF90
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BD90: ; jump table
	b _0200C000 ; case 0
	b _0200BDC0 ; case 1
	b _0200BDDC ; case 2
	b _0200BDFC ; case 3
	b _0200BE10 ; case 4
	b _0200BE30 ; case 5
	b _0200BE44 ; case 6
	b _0200BEB0 ; case 7
	b _0200BE44 ; case 8
	b _0200BEB0 ; case 9
	b _0200BF10 ; case 10
	b _0200BF54 ; case 11
_0200BDC0:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A37C
	b _0200C000
_0200BDDC:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BDFC:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A3DC
	b _0200C000
_0200BE10:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BE30:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A444
	b _0200C000
_0200BE44:
	cmp r0, #6
	beq _0200BE58
	cmp r0, #8
	beq _0200BE74
	b _0200BE90
_0200BE58:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BE90
_0200BE74:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BE90:
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BEB0:
	cmp r0, #7
	beq _0200BEC4
	cmp r0, #9
	beq _0200BEE0
	b _0200BEFC
_0200BEC4:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BEFC
_0200BEE0:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BEFC:
	ldrh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	bl sub_0200A444
	b _0200C000
_0200BF10:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	add r3, r1, r1, lsl #1
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, asr #2
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF54:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r3, r1, #0x100
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF90:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0200C000
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BFAC: ; jump table
	b _0200C000 ; case 0
	b _0200C000 ; case 1
	b _0200BFDC ; case 2
	b _0200BFF0 ; case 3
	b _0200BFDC ; case 4
	b _0200BFF0 ; case 5
	b _0200BFDC ; case 6
	b _0200BFF0 ; case 7
	b _0200BFDC ; case 8
	b _0200BFF0 ; case 9
	b _0200BFDC ; case 10
	b _0200BFF0 ; case 11
_0200BFDC:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0x100
	movge r0, #0
	strge r0, [r4]
	b _0200C000
_0200BFF0:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4]
_0200C000:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200BD50

	arm_func_start sub_0200C008
sub_0200C008: ; 0x0200C008
	ldr ip, _0200C01C ; =sub_0200A29C
	mov r3, r2, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bx ip
	.align 2, 0
_0200C01C: .word sub_0200A29C
	arm_func_end sub_0200C008

	arm_func_start sub_0200C020
sub_0200C020: ; 0x0200C020
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x10]
	cmp ip, #0
	beq _0200C084
	ldrb lr, [r1]
	mov r4, #0xff
	ldrb lr, [ip, lr, lsl #2]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp]
	ldrb lr, [r1, #1]
	add lr, ip, lr, lsl #2
	ldrb lr, [lr, #1]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp, #1]
	ldrb r1, [r1, #2]
	add r1, ip, r1, lsl #2
	ldrb r1, [r1, #2]
	mul r1, r3, r1
	mov r1, r1, lsr #5
	strb r1, [sp, #2]
	strb r4, [sp, #3]
	b _0200C0BC
_0200C084:
	ldrb r4, [r1]
	mov ip, #0xff
	mul lr, r4, r3
	mov r4, lr, lsr #5
	strb r4, [sp]
	ldrb lr, [r1, #1]
	mul r4, lr, r3
	mov r4, r4, lsr #5
	strb r4, [sp, #1]
	ldrb r1, [r1, #2]
	mul r3, r1, r3
	mov r1, r3, lsr #5
	strb r1, [sp, #2]
	strb ip, [sp, #3]
_0200C0BC:
	mov r1, r2, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200C020
