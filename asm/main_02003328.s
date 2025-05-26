	.include "asm/macros.inc"
	.include "main_02003328.inc"

	.text

	arm_func_start TaskProcBoot
TaskProcBoot: ; 0x02003328
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r0, _020035CC ; =_020AF000
	bl sub_02002950
	ldr r0, _020035D0 ; =_020AF028
	bl sub_02002950
	ldr r0, _020035D4 ; =_020AF050
	bl sub_02002950
	ldr r0, _020035D8 ; =_020AEFDC
	bl sub_02002C40
	bl sub_02006D4C
	bl sub_02017D20
	ldr r2, _020035DC ; =_0229B248
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r0, _020035E4 ; =_020AF078
	str r2, [r1, #0x3c]
	ldr r1, _020035E8 ; =_020AEFB4
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035E4 ; =_020AF078
	bl sub_020027E8
	bl sub_0207B370
	ldr r0, _020035EC ; =_0229B220
	bl sub_0207B4A4
	mov r1, #0
	str r1, [sp]
	ldr r0, _020035EC ; =_0229B220
	mov r2, #0x64
	ldr r3, _020035F0 ; =sub_02003754
	bl sub_0207B4B8
	mov r0, #1
	ldr r1, _020035F4 ; =sub_02003704
	bl sub_02078A98
	mov r0, #1
	bl sub_02078C68
	bl EnableAllInterrupts
	mov r0, #1
	bl GX_VBlankIntr
	ldr r0, _020035F8 ; =_020AF154
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r2, _020035FC ; =_0229F248
	str r0, [r1, #0x24]
	str r2, [r1, #0x50]
	ldr r1, _02003600 ; =_020AEFC8
	mov r2, #0
	bl sub_02002778
	ldr r0, _020035F8 ; =_020AF154
	bl sub_020027E8
	bl sub_02002580
	ldr r2, _020035E0 ; =_020AEF7C
	mov r1, #0xf
	str r0, [r2, #0x34]
	bl sub_020027F8
	ldr r0, _020035E0 ; =_020AEF7C
	mov r1, #2
	ldr r0, [r0, #0x34]
	bl sub_02002858
	mov sl, #0
	ldr r1, _020035E0 ; =_020AEF7C
	ldr r0, _02003604 ; =_020924D8
	strb sl, [r1, #5]
	bl Debug_Print0
	mov r8, #1
	ldr r4, _020035E0 ; =_020AEF7C
	mov r6, sl
	mov sb, sl
	mov r7, r8
	mov r5, sl
	mov fp, r8
_0200343C:
	add r0, sp, #4
	mov r1, #0xb
	bl sub_02002628
	ldrb r0, [r4, #7]
	cmp r0, #0
	strneb sb, [r4, #7]
	bne _02003460
	ldr r0, _020035D4 ; =_020AF050
	bl sub_02002A44
_02003460:
	cmp sl, #0
	beq _020034A8
	ldrb r0, [r4, #6]
	cmp r0, #0
	ldrneb r0, [r4]
	cmpne r0, #0
	beq _020034C8
	ldr r0, _020035CC ; =_020AF000
	strb r8, [r4, #3]
	bl sub_020029A0
	ldr r0, _020035D0 ; =_020AF028
	bl sub_02002A44
	bl sub_02002670
	ldr r0, [r4, #0x10]
	cmp r0, #0
	moveq sl, #0
	bl sub_020026B8
	b _020034C8
_020034A8:
	bl sub_02002670
	ldr sl, [r4, #0x10]
	bl sub_020026B8
	cmp sl, #0
	beq _020034C8
	ldr r0, _020035D0 ; =_020AF028
	strb r7, [r4, #3]
	bl sub_02002A44
_020034C8:
	add r0, sp, #4
	bl sub_0200265C
	bl sub_02002670
	ldr r0, [r4, #0x10]
	cmp r0, #0
	movne sl, r0
	cmp sl, #0
	beq _02003518
	ldrb r0, [r4, #3]
	cmp r0, #0
	strneb r6, [r4]
	str sl, [r4, #0x18]
	bl sub_020026B8
	ldr r0, [r4, #0x30]
	add r0, r0, #1
	str r0, [r4, #0x30]
	bl sub_02006098
	blx sl
	strb r0, [r4, #6]
	b _02003530
_02003518:
	bl sub_020026B8
	bl sub_02003A40
	bl sub_02002670
	str r5, [r4, #0x18]
	strb fp, [r4, #6]
	bl sub_020026B8
_02003530:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _02003544
	mov r0, #0
	bl sub_020025F8
_02003544:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0200343C
	bl sub_02003B5C
	cmp r0, #0
	beq _020035A8
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02003584
	mov r0, #0
	mov r1, #0
	strb r0, [r4, #0xb]
	mov r0, #0xc
	mov r2, r1
	bl sub_020820E8
	b _0200343C
_02003584:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0200343C
	mov r0, #0
	bl sub_02082420
	cmp r0, #0
	movne r0, #1
	strne r0, [r4, #0x14]
	b _0200343C
_020035A8:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0200343C
	mov r0, #1
	bl sub_02082420
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x14]
	b _0200343C
	.align 2, 0
_020035CC: .word _020AF000
_020035D0: .word _020AF028
_020035D4: .word _020AF050
_020035D8: .word _020AEFDC
_020035DC: .word _0229B248
_020035E0: .word _020AEF7C
_020035E4: .word _020AF078
_020035E8: .word _020AEFB4
_020035EC: .word _0229B220
_020035F0: .word sub_02003754
_020035F4: .word sub_02003704
_020035F8: .word _020AF154
_020035FC: .word _0229F248
_02003600: .word _020AEFC8
_02003604: .word _020924D8
	arm_func_end TaskProcBoot

	arm_func_start EnableAllInterrupts
EnableAllInterrupts: ; 0x02003608
	ldr r2, _0200361C ; =0x04000208
	mov r1, #1
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_0200361C: .word 0x04000208
	arm_func_end EnableAllInterrupts

	arm_func_start sub_02003620
sub_02003620: ; 0x02003620
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r7, #0
	ldr fp, _020036FC ; =_020AF050
	ldr r4, _02003700 ; =_020AEF7C
	add r6, sp, #0
	add r5, sp, #4
	mov r8, #1
	mov sb, r7
	mov sl, r7
_02003648:
	mov r0, sl
	bl sub_02079888
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _02003674
	mov r0, sb
	bl HaltProcessDisp
	b _02003688
_02003674:
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _02003688
	mov r0, r8
	bl HaltProcessDisp
_02003688:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _020036AC
	bl sub_02003B5C
	cmp r0, #0
	beq _020036AC
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _020036E8
_020036AC:
	bl sub_02006DEC
	bl Rand16Bit
	mov r0, r7
	mov r1, r6
	bl GetHeldButtons
	mov r0, r5
	bl GetReleasedStylus
	ldrh r0, [sp]
	cmp r0, #0
	bne _020036E0
	ldrh r0, [sp, #4]
	tst r0, #1
	beq _020036EC
_020036E0:
	bl Rand16Bit
	b _020036EC
_020036E8:
	bl KeyWaitInit
_020036EC:
	mov r0, fp
	bl sub_020029B8
	bl sub_0201849C
	b _02003648
	.align 2, 0
_020036FC: .word _020AF050
_02003700: .word _020AEF7C
	arm_func_end sub_02003620

	arm_func_start sub_02003704
sub_02003704: ; 0x02003704
	stmdb sp!, {r3, lr}
	ldr r0, _0200374C ; =OS_IRQTable
	ldr r1, _02003750 ; =_020AEF7C
	add r0, r0, #0x3000
	ldr r2, [r0, #0xff8]
	orr r2, r2, #1
	str r2, [r0, #0xff8]
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _02003744
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	bl sub_02079940
_02003744:
	bl sub_020082E0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200374C: .word OS_IRQTable
_02003750: .word _020AEF7C
	arm_func_end sub_02003704

	arm_func_start sub_02003754
sub_02003754: ; 0x02003754
	ldr r1, _02003774 ; =_020AEF7C
	ldr r0, _02003778 ; =_020AF078
	ldr r2, [r1, #0x1c]
	ldr ip, _0200377C ; =sub_02079940
	add r2, r2, #1
	ldr r0, [r0]
	str r2, [r1, #0x1c]
	bx ip
	.align 2, 0
_02003774: .word _020AEF7C
_02003778: .word _020AF078
_0200377C: .word sub_02079940
	arm_func_end sub_02003754

	arm_func_start sub_02003780
sub_02003780: ; 0x02003780
	stmdb sp!, {r3, lr}
	bl sub_02005EAC
	ldr r0, _020037A0 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0]
	bl MainLoop
	bl WaitForever
	ldmia sp!, {r3, pc}
	.align 2, 0
_020037A0: .word _020AEF7C
	arm_func_end sub_02003780

	arm_func_start sub_020037A4
sub_020037A4: ; 0x020037A4
	ldr r0, _020037B0 ; =_020AEF7C
	ldr r0, [r0, #0x28]
	bx lr
	.align 2, 0
_020037B0: .word _020AEF7C
	arm_func_end sub_020037A4

	arm_func_start GetTime
GetTime: ; 0x020037B4
	stmdb sp!, {r3, r4, r5, lr}
	bl DisableAllInterrupts
	ldr r0, _02003818 ; =_020AEF7C
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	bne _020037D8
	bl EnableAllInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020037D8:
	ldr r1, _0200381C ; =0x04000006
	ldr r4, [r0, #0x1c]
	ldrh r5, [r1]
	bl EnableAllInterrupts
	mov r0, r4
	bl _fflt
	mov r4, r0
	mov r0, r5
	bl _fflt
	mov r1, r0
	ldr r0, _02003820 ; =0x3B792FB2
	bl _fmul
	mov r1, r0
	mov r0, r4
	bl _fadd
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02003818: .word _020AEF7C
_0200381C: .word 0x04000006
_02003820: .word 0x3B792FB2
	arm_func_end GetTime

	arm_func_start DisableAllInterrupts
DisableAllInterrupts: ; 0x02003824
	ldr r2, _02003838 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_02003838: .word 0x04000208
	arm_func_end DisableAllInterrupts

	arm_func_start sub_0200383C
sub_0200383C: ; 0x0200383C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _020038CC ; =_020AEF7C
	mov r1, #1
	strb r1, [r0, #2]
	ldr r4, [r0, #0x10]
	str r5, [r0, #0x10]
	bl sub_020026B8
	cmp r5, #0
	bne _02003898
	cmp r4, #0
	beq _020038BC
	ldr r1, _020038CC ; =_020AEF7C
	mov r2, #0
	ldr r0, _020038D0 ; =_020AF028
	strb r2, [r1, #3]
	bl sub_020029A0
	b _020038BC
_02003898:
	cmp r4, #0
	bne _020038BC
	ldr r1, _020038CC ; =_020AEF7C
	mov r2, #1
	ldr r0, _020038D0 ; =_020AF028
	strb r2, [r1]
	bl sub_020029A0
	ldr r0, _020038D4 ; =_020AF000
	bl sub_02002A44
_020038BC:
	add r0, sp, #0
	bl sub_0200265C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020038CC: .word _020AEF7C
_020038D0: .word _020AF028
_020038D4: .word _020AF000
	arm_func_end sub_0200383C

	arm_func_start sub_020038D8
sub_020038D8: ; 0x020038D8
	ldr r0, _020038E4 ; =_020AEF7C
	ldrb r0, [r0, #3]
	bx lr
	.align 2, 0
_020038E4: .word _020AEF7C
	arm_func_end sub_020038D8

	arm_func_start sub_020038E8
sub_020038E8: ; 0x020038E8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	bl sub_02002670
	ldr r0, _02003988 ; =_020AEF7C
	ldr r4, [r0, #0x18]
	bl sub_020026B8
	cmp r4, #0
	beq _02003944
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0]
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _02003938
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	bl sub_02079940
_02003938:
	ldr r0, _0200398C ; =_020AF000
	bl sub_02002A44
	b _02003950
_02003944:
	ldr r0, _02003988 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #7]
_02003950:
	ldr r1, _02003988 ; =_020AEF7C
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	add r2, r2, #1
	str r2, [r1, #0x2c]
	bl sub_0200265C
	ldr r0, _02003988 ; =_020AEF7C
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _02003980
	mov r0, #0
	bl sub_020025F8
_02003980:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003988: .word _020AEF7C
_0200398C: .word _020AF000
	arm_func_end sub_020038E8

	arm_func_start sub_02003990
sub_02003990: ; 0x02003990
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020039DC ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _020039D4
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _020039DC ; =_020AEF7C
	mov r2, #0
	strb r2, [r1, #3]
	ldr r0, _020039E0 ; =_020AF000
	strb r2, [r1, #6]
	bl sub_020029A0
	add r0, sp, #0
	bl sub_0200265C
_020039D4:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020039DC: .word _020AEF7C
_020039E0: .word _020AF000
	arm_func_end sub_02003990

	arm_func_start sub_020039E4
sub_020039E4: ; 0x020039E4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _02003A34 ; =_020AEF7C
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02003A2C
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003A34 ; =_020AEF7C
	mov r2, #0
	ldr r0, _02003A38 ; =_020AF028
	strb r2, [r1, #6]
	bl sub_020029A0
	ldr r0, _02003A3C ; =_020AF000
	bl sub_02002A44
	add r0, sp, #0
	bl sub_0200265C
_02003A2C:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003A34: .word _020AEF7C
_02003A38: .word _020AF028
_02003A3C: .word _020AF000
	arm_func_end sub_020039E4

	arm_func_start sub_02003A40
sub_02003A40: ; 0x02003A40
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r0, sp, #0
	mov r1, #0xb
	bl sub_02002628
	ldr r1, _02003AAC ; =_020AEF7C
	mov r2, #1
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	mov r0, #0
	beq _02003A7C
	strb r0, [r1, #0xa]
	strb r2, [r1, #7]
	bl sub_02079888
	b _02003A90
_02003A7C:
	strb r2, [r1, #9]
	bl sub_02079888
	ldr r0, _02003AAC ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #9]
_02003A90:
	ldr r1, _02003AAC ; =_020AEF7C
	add r0, sp, #0
	ldrb r4, [r1]
	bl sub_0200265C
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02003AAC: .word _020AEF7C
	arm_func_end sub_02003A40

	arm_func_start sub_02003AB0
sub_02003AB0: ; 0x02003AB0
	stmdb sp!, {r3, lr}
	ldr r0, _02003AC8 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003ACC ; =_020AEF7C
	ldr r0, [r0, #0x28]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003AC8: .word _020AF050
_02003ACC: .word _020AEF7C
	arm_func_end sub_02003AB0

	arm_func_start sub_02003AD0
sub_02003AD0: ; 0x02003AD0
	stmdb sp!, {r3, lr}
	ldr r0, _02003B50 ; =_020AEF7C
	ldrb r0, [r0, #5]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl sub_02002580
	bl sub_02002860
	cmp r0, #0
	beq _02003B10
	ldr r0, _02003B54 ; =_020AF050
	bl sub_02002A44
	ldr r0, _02003B50 ; =_020AEF7C
	ldr r0, [r0, #0x28]
_02003B10:
	ldr r0, _02003B50 ; =_020AEF7C
	mov r2, #1
	strb r2, [r0, #5]
	ldrb r1, [r0, #0xf]
	cmp r1, #0
	bne _02003B30
	strb r2, [r0, #0xf]
	bl sub_020081C8
_02003B30:
	bl DisableAllInterrupts
	ldr r0, _02003B58 ; =_0229B220
	bl sub_0207B584
	mov r0, #1
	mov r1, #0
	bl sub_02078A98
	bl EnableAllInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003B50: .word _020AEF7C
_02003B54: .word _020AF050
_02003B58: .word _0229B220
	arm_func_end sub_02003AD0

	arm_func_start sub_02003B5C
sub_02003B5C: ; 0x02003B5C
	ldr r0, _02003B8C ; =_020AEF7C
	mov r1, #1
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _02003B84
	ldr r0, _02003B90 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	moveq r1, #0
_02003B84:
	and r0, r1, #0xff
	bx lr
	.align 2, 0
_02003B8C: .word _020AEF7C
_02003B90: .word 0x027FFFA8
	arm_func_end sub_02003B5C

	arm_func_start sub_02003B94
sub_02003B94: ; 0x02003B94
	ldr r0, _02003BA8 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BA8: .word _020AEF7C
	arm_func_end sub_02003B94

	arm_func_start sub_02003BAC
sub_02003BAC: ; 0x02003BAC
	ldr r0, _02003BC4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #1]
	mov r1, #1
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_02003BC4: .word _020AEF7C
	arm_func_end sub_02003BAC

	arm_func_start sub_02003BC8
sub_02003BC8: ; 0x02003BC8
	stmdb sp!, {r3, lr}
	bl SoundResume
	ldr r0, _02003BE8 ; =_020AEF7C
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003BE8: .word _020AEF7C
	arm_func_end sub_02003BC8

	arm_func_start sub_02003BEC
sub_02003BEC: ; 0x02003BEC
	ldr r0, _02003BF8 ; =_020AEF7C
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_02003BF8: .word _020AEF7C
	arm_func_end sub_02003BEC

	arm_func_start sub_02003BFC
sub_02003BFC: ; 0x02003BFC
	stmdb sp!, {r3, lr}
	ldr r0, _02003CB4 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003CAC
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003C5C
	bl sub_02003B5C
	cmp r0, #0
	bne _02003C54
	ldr r0, _02003CB8 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003CBC ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003CB4 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
_02003C54:
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003C5C:
	bl sub_02003B5C
	cmp r0, #0
	beq _02003CAC
	ldr r0, _02003CC0 ; =_020924F8
	bl Debug_Print0
	bl sub_02017DB4
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1, #2]
	bl sub_02017FF0
	ldr r1, _02003CBC ; =_0229B21C
	strh r0, [r1]
	bl StopBgmCommand
	bl sub_02018118
	bl sub_02018278
	mov r0, #0x3f00
	bl sub_02018428
	ldr r1, _02003CB4 ; =_020AEF7C
	mov r0, #1
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
_02003CAC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003CB4: .word _020AEF7C
_02003CB8: .word _020924E8
_02003CBC: .word _0229B21C
_02003CC0: .word _020924F8
	arm_func_end sub_02003BFC

	arm_func_start SoundResume
SoundResume: ; 0x02003CC4
	stmdb sp!, {r3, lr}
	ldr r0, _02003D20 ; =_020AEF7C
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02003D18
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _02003D18
	ldr r0, _02003D24 ; =_020924E8
	bl Debug_Print0
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0, #2]
	bl PlayBgmById
	ldr r0, _02003D28 ; =_0229B21C
	ldrh r0, [r0]
	bl sub_02018024
	ldr r0, _02003D20 ; =_020AEF7C
	mov r1, #0
	strb r1, [r0, #4]
	mov r0, #1
	ldmia sp!, {r3, pc}
_02003D18:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_02003D20: .word _020AEF7C
_02003D24: .word _020924E8
_02003D28: .word _0229B21C
	arm_func_end SoundResume
