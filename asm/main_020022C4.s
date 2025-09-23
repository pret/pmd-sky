	.include "asm/macros.inc"
	.include "main_020022C4.inc"

	.text

	arm_func_start sub_020022C4
sub_020022C4: ; 0x020022C4
	mov r1, #1
	str r1, [r0]
	bx lr
	arm_func_end sub_020022C4

	arm_func_start sub_020022D0
sub_020022D0: ; 0x020022D0
	ldr r3, [r0]
	ldr r2, _020022F4 ; =0x5D588B65
	mul r2, r3, r2
	add r3, r2, #1
	mov r2, r3, lsr #0x10
	mul r1, r2, r1
	str r3, [r0]
	mov r0, r1, lsr #0x10
	bx lr
	.align 2, 0
_020022F4: .word 0x5D588B65
	arm_func_end sub_020022D0

	arm_func_start RandIntSafe
RandIntSafe: ; 0x020022F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mul r0, r1, r4
	mov r0, r0, asr #0x10
	ldmia sp!, {r4, pc}
	arm_func_end RandIntSafe

	arm_func_start RandRangeSafe
RandRangeSafe: ; 0x02002318
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	bge _0200234C
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r4, r5
	mul r0, r1, r0
	add r0, r5, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
_0200234C:
	bl Rand16Bit
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	sub r0, r5, r4
	mul r0, r1, r0
	add r0, r4, r0, asr #16
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end RandRangeSafe

	arm_func_start sub_02002368
sub_02002368: ; 0x02002368
	b _02002378
_0200236C:
	cmp r2, r1
	bxeq lr
	add r0, r0, #1
	arm_func_end sub_02002368
_02002378:
	ldrsb r2, [r0]
	cmp r2, #0
	bne _0200236C
	mov r0, #0
	bx lr

	arm_func_start sub_0200238C
sub_0200238C: ; 0x0200238C
	cmp r0, #0x41
	bxlt lr
	cmp r0, #0x5a
	addle r0, r0, #0x20
	movle r0, r0, lsl #0x18
	movle r0, r0, asr #0x18
	bx lr
	arm_func_end sub_0200238C

	arm_func_start sub_020023A8
sub_020023A8: ; 0x020023A8
	mov ip, #0
	b _020023E4
_020023B0:
	ldrsb r3, [r1]
	cmp r3, #0
	bne _020023D8
	mov r1, #0x20
	b _020023CC
_020023C4:
	strb r1, [r0], #1
	add ip, ip, #1
_020023CC:
	cmp ip, r2
	blt _020023C4
	b _020023EC
_020023D8:
	add r1, r1, #1
	strb r3, [r0], #1
	add ip, ip, #1
_020023E4:
	cmp ip, r2
	blt _020023B0
_020023EC:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end sub_020023A8

	arm_func_start sub_020023F8
sub_020023F8: ; 0x020023F8
	stmdb sp!, {r3, lr}
	mov lr, #0
	b _02002428
_02002404:
	ldrsb ip, [r0], #1
	ldrsb r3, [r1], #1
	cmp r3, ip
	movne r0, #0
	ldmneia sp!, {r3, pc}
	cmp ip, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	add lr, lr, #1
_02002428:
	cmp lr, r2
	blt _02002404
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020023F8

	arm_func_start WaitForever
WaitForever: ; 0x02002438
	stmdb sp!, {r3, lr}
	bl sub_02079C14
_02002440:
	bl WaitForInterrupt
	b _02002440
	arm_func_end WaitForever

	arm_func_start sub_02002448
sub_02002448: ; 0x02002448
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02003AD0
	bl sub_02002580
	mov r1, #1
	bl sub_020027F8
	bl sub_02079C14
	bl GX_DispOff
	ldr r3, _02002498 ; =0x04001000
	ldr r0, _0200249C ; =_02092464
	ldr r2, [r3]
	mov r1, r4
	bic r2, r2, #0x10000
	str r2, [r3]
	bl Debug_Print0
	mov r0, r4
	bl sub_0207B930
	bl sub_02079C14
_02002490:
	bl WaitForInterrupt
	b _02002490
	.align 2, 0
_02002498: .word 0x04001000
_0200249C: .word _02092464
	arm_func_end sub_02002448

	arm_func_start sub_020024A0
sub_020024A0: ; 0x020024A0
	ldr r0, _020024AC ; =0x027FFC20
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020024AC: .word 0x027FFC20
	arm_func_end sub_020024A0

	arm_func_start sub_020024B0
sub_020024B0: ; 0x020024B0
	ldr ip, _020024BC ; =sub_020845D8
	mov r0, #0
	bx ip
	.align 2, 0
_020024BC: .word sub_020845D8
	arm_func_end sub_020024B0

	arm_func_start sub_020024C0
sub_020024C0: ; 0x020024C0
	ldr ip, _020024CC ; =sub_020845D8
	ldr r0, _020024D0 ; =sub_020024D4
	bx ip
	.align 2, 0
_020024CC: .word sub_020845D8
_020024D0: .word sub_020024D4
	arm_func_end sub_020024C0

	arm_func_start sub_020024D4
sub_020024D4: ; 0x020024D4
	stmdb sp!, {r3, lr}
	bl CardPullOut
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020024D4

	arm_func_start sub_020024E4
sub_020024E4: ; 0x020024E4
	stmdb sp!, {r3, lr}
	ldr r0, _0200256C ; =_0229AFCC
	bl sub_0207A030
	ldr r0, _0200256C ; =_0229AFCC
	bl sub_0207A048
	mov r1, #0
	ldr r0, _02002570 ; =_0229AFE4
	mov r2, r1
_02002504:
	add r1, r1, #1
	cmp r1, #8
	str r2, [r0], #4
	blt _02002504
	ldr r1, _02002574 ; =_0229AFC0
	ldr r0, _0200256C ; =_0229AFCC
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0207A0CC
	ldr r1, _02002578 ; =_022B966C
	ldr r0, _0200257C ; =_0229B004
	ldr r1, [r1, #4]
	mov r2, #0
	stmia r0, {r1, r2}
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	mov r1, #7
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	bl sub_020026E4
	ldr r0, _02002578 ; =_022B966C
	mov r1, #7
	ldr r0, [r0, #4]
	bl sub_02079A64
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200256C: .word _0229AFCC
_02002570: .word _0229AFE4
_02002574: .word _0229AFC0
_02002578: .word _022B966C
_0200257C: .word _0229B004
	arm_func_end sub_020024E4

	arm_func_start sub_02002580
sub_02002580: ; 0x02002580
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020025E8 ; =_022B966C
	ldr r0, _020025EC ; =_0229AFCC
	ldr r4, [r1, #4]
	bl sub_0207A048
	ldr r0, _020025F0 ; =_0229AFC0
	mov r1, #0
	ldr r3, [r0]
	ldr r2, _020025F4 ; =_0229AFE4
	b _020025CC
_020025A8:
	ldr r5, [r2]
	ldr r0, [r5]
	cmp r0, r4
	bne _020025C4
	ldr r0, _020025EC ; =_0229AFCC
	bl sub_0207A0CC
	b _020025E0
_020025C4:
	add r1, r1, #1
	add r2, r2, #4
_020025CC:
	cmp r1, r3
	blt _020025A8
	ldr r0, _020025EC ; =_0229AFCC
	bl sub_0207A0CC
	mov r5, #0
_020025E0:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020025E8: .word _022B966C
_020025EC: .word _0229AFCC
_020025F0: .word _0229AFC0
_020025F4: .word _0229AFE4
	arm_func_end sub_02002580

; https://decomp.me/scratch/Gairr
	arm_func_start sub_020025F8
sub_020025F8: ; 0x020025F8
	stmdb sp!, {r4, lr}
	cmp r0, #0
	beq _02002614
	ldr r0, [r0]
	mov r1, #0
	bl sub_02079844
	ldmia sp!, {r4, pc}
_02002614:
	mov r4, #0
_02002618:
	mov r0, r4
	bl sub_02079888
	b _02002618
	arm_func_end sub_020025F8

	arm_func_start sub_02002624
sub_02002624: ; 0x02002624
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002624

	arm_func_start sub_02002628
sub_02002628: ; 0x02002628
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02002658 ; =_022B966C
	mov r5, r0
	ldr r0, [r2, #4]
	mov r4, r1
	str r0, [r5]
	bl sub_02079B0C
	str r0, [r5, #4]
	ldr r0, [r5]
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002658: .word _022B966C
	arm_func_end sub_02002628

	arm_func_start sub_0200265C
sub_0200265C: ; 0x0200265C
	ldr ip, _0200266C ; =sub_02079A64
	mov r1, r0
	ldmia r1, {r0, r1}
	bx ip
	.align 2, 0
_0200266C: .word sub_02079A64
	arm_func_end sub_0200265C

	arm_func_start sub_02002670
sub_02002670: ; 0x02002670
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020026AC ; =_022B966C
	ldr r5, [r0, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _020026B0 ; =_0229AFCC
	bl sub_0207A048
	ldr r0, _020026B4 ; =_020AEF30
	str r5, [r0]
	str r4, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026AC: .word _022B966C
_020026B0: .word _0229AFCC
_020026B4: .word _020AEF30
	arm_func_end sub_02002670

	arm_func_start sub_020026B8
sub_020026B8: ; 0x020026B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020026DC ; =_020AEF30
	ldr r0, _020026E0 ; =_0229AFCC
	ldmia r1, {r4, r5}
	bl sub_0207A0CC
	mov r0, r4
	mov r1, r5
	bl sub_02079A64
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020026DC: .word _020AEF30
_020026E0: .word _0229AFCC
	arm_func_end sub_020026B8

	arm_func_start sub_020026E4
sub_020026E4: ; 0x020026E4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002768 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _0200276C ; =_0229AFCC
	bl sub_0207A048
	ldr r0, _02002770 ; =_0229AFC0
	ldr r3, [r0]
	cmp r3, #8
	bge _02002750
	add r1, r3, #1
	ldr r2, _02002774 ; =_0229AFE4
	str r1, [r0]
	ldr r1, [r0]
	str r6, [r2, r3, lsl #2]
	str r1, [r0, #4]
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	cmp r2, r1
	ldrgt r1, [r0, #4]
	strgt r1, [r0, #8]
_02002750:
	ldr r0, _0200276C ; =_0229AFCC
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002768: .word _022B966C
_0200276C: .word _0229AFCC
_02002770: .word _0229AFC0
_02002774: .word _0229AFE4
	arm_func_end sub_020026E4

	arm_func_start sub_02002778
sub_02002778: ; 0x02002778
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r0
	mov ip, r1
	add r0, r4, #0x1c
	mov r5, ip
	str r0, [r4]
	mov r6, r2
	ldmia r5!, {r0, r1, r2, r3}
	add lr, r4, #4
	stmia lr!, {r0, r1, r2, r3}
	ldr r0, [r5]
	mov r2, r6
	str r0, [lr]
	str r6, [r4, #0x18]
	ldr r1, [ip, #8]
	str r1, [sp]
	ldr r0, [ip, #0xc]
	bic r3, r1, #7
	str r0, [sp, #4]
	ldmia ip, {r1, lr}
	ldr r0, [r4]
	add r3, lr, r3
	bl StartThread
	mov r0, r4
	bl sub_020026E4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02002778

	arm_func_start sub_020027E8
sub_020027E8: ; 0x020027E8
	ldr ip, _020027F4 ; =sub_02079940
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020027F4: .word sub_02079940
	arm_func_end sub_020027E8

	arm_func_start sub_020027F8
sub_020027F8: ; 0x020027F8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6]
	mov r5, r1
	bl sub_02079B0C
	mov r4, r0
	ldr r0, [r6]
	mov r1, r5
	bl sub_02079A64
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020027F8

	arm_func_start sub_02002824
sub_02002824: ; 0x02002824
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002854 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, r6
	bl sub_02079A64
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002854: .word _022B966C
	arm_func_end sub_02002824

	arm_func_start sub_02002858
sub_02002858: ; 0x02002858
	str r1, [r0, #0x14]
	bx lr
	arm_func_end sub_02002858

	arm_func_start sub_02002860
sub_02002860: ; 0x02002860
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	ldrne r0, [r0, #0x14]
	moveq r0, #0
	bx lr
	arm_func_end sub_02002860

	arm_func_start sub_02002878
sub_02002878: ; 0x02002878
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02002580
	cmp r0, #0
	beq _020028A4
	ldr r0, [r0, #0x14]
	cmp r0, r4
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r4, pc}
_020028A4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002878

	arm_func_start sub_020028AC
sub_020028AC: ; 0x020028AC
	bx lr
	arm_func_end sub_020028AC

	arm_func_start sub_020028B0
sub_020028B0: ; 0x020028B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0207A030
	mov r0, r4
	bl sub_0207A048
	bl sub_02002670
	ldr r0, _020028F4 ; =_0229B0E0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020028F4: .word _0229B0E0
	arm_func_end sub_020028B0

	arm_func_start sub_020028F8
sub_020028F8: ; 0x020028F8
	ldr ip, _02002900 ; =sub_0207A0CC
	bx ip
	.align 2, 0
_02002900: .word sub_0207A0CC
	arm_func_end sub_020028F8

	arm_func_start sub_02002904
sub_02002904: ; 0x02002904
	ldr ip, _0200290C ; =sub_0207A048
	bx ip
	.align 2, 0
_0200290C: .word sub_0207A048
	arm_func_end sub_02002904

	arm_func_start sub_02002910
sub_02002910: ; 0x02002910
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0207A164
	tst r0, #0xff
	beq _02002944
	ldr r0, [r4, #0xc]
	cmp r0, #1
	movle r0, #1
	ldmleia sp!, {r4, pc}
	mov r0, r4
	bl sub_0207A0CC
	mov r0, #0
	ldmia sp!, {r4, pc}
_02002944:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_02002910

	arm_func_start sub_0200294C
sub_0200294C: ; 0x0200294C
	bx lr
	arm_func_end sub_0200294C

	arm_func_start sub_02002950
sub_02002950: ; 0x02002950
	stmdb sp!, {r3, lr}
	mov r3, r0
	add r1, r3, #4
	add r0, r3, #8
	mov r2, #1
	str r1, [r3]
	bl sub_02079DB8
	bl sub_02002670
	ldr r0, _0200299C ; =_0229B0E8
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r3, pc}
	.align 2, 0
_0200299C: .word _0229B0E8
	arm_func_end sub_02002950

	arm_func_start sub_020029A0
sub_020029A0: ; 0x020029A0
	ldr ip, _020029B4 ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #8
	bx ip
	.align 2, 0
_020029B4: .word sub_02079DE0
	arm_func_end sub_020029A0

	arm_func_start sub_020029B8
sub_020029B8: ; 0x020029B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _02002A40 ; =_022B966C
	mov r4, r0
	ldr sb, [r1, #4]
	mov r7, #0
	mov r0, sb
	bl sub_02079B0C
	mov r8, r0
	mov r0, sb
	mov r1, #7
	bl sub_02079A64
	mov r5, r7
	b _020029F0
_020029EC:
	add r7, r7, #1
_020029F0:
	mov r1, r5
	mov r2, r5
	add r0, r4, #8
	bl sub_02079DE0
	cmp r0, #0
	bne _020029EC
	add r6, sp, #0
	mov r5, #0
_02002A10:
	mov r1, r6
	mov r2, r5
	add r0, r4, #8
	bl sub_02079E74
	cmp r0, #0
	subne r7, r7, #1
	bne _02002A10
	mov r0, sb
	mov r1, r8
	bl sub_02079A64
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02002A40: .word _022B966C
	arm_func_end sub_020029B8

	arm_func_start sub_02002A44
sub_02002A44: ; 0x02002A44
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002A94 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r6, #8
	mov r2, #1
	bl sub_02079E74
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002A94: .word _022B966C
	arm_func_end sub_02002A44

	arm_func_start sub_02002A98
sub_02002A98: ; 0x02002A98
	bx lr
	arm_func_end sub_02002A98

	arm_func_start sub_02002A9C
sub_02002A9C: ; 0x02002A9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	str r1, [r6, #0xa4]
	add r1, r6, #4
	str r2, [r6, #0xa8]
	str r1, [r6]
	ldr r2, [r6, #0xa4]
	add r0, r6, #0x84
	bl sub_02079DB8
	mov r5, #0
	mov r4, r5
	b _02002AE0
_02002ACC:
	mov r1, r4
	mov r2, r4
	add r0, r6, #0x84
	bl sub_02079DE0
	add r5, r5, #1
_02002AE0:
	ldr r0, [r6, #0xa8]
	cmp r5, r0
	blt _02002ACC
	bl sub_02002670
	ldr r0, _02002B1C ; =_0229B0F0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	ldrgt r1, [r0]
	strgt r1, [r0, #4]
	bl sub_020026B8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002B1C: .word _0229B0F0
	arm_func_end sub_02002A9C

	arm_func_start sub_02002B20
sub_02002B20: ; 0x02002B20
	ldr ip, _02002B34 ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B34: .word sub_02079DE0
	arm_func_end sub_02002B20

	arm_func_start sub_02002B38
sub_02002B38: ; 0x02002B38
	ldr ip, _02002B4C ; =sub_02079DE0
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bx ip
	.align 2, 0
_02002B4C: .word sub_02079DE0
	arm_func_end sub_02002B38

	arm_func_start sub_02002B50
sub_02002B50: ; 0x02002B50
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x98]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r3, pc}
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x84
	bl sub_02079DE0
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002B50

	arm_func_start sub_02002B7C
sub_02002B7C: ; 0x02002B7C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002BCC ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r6, #0x84
	mov r2, #1
	bl sub_02079E74
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002BCC: .word _022B966C
	arm_func_end sub_02002B7C

	arm_func_start sub_02002BD0
sub_02002BD0: ; 0x02002BD0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _02002C28 ; =_022B966C
	mov r5, r0
	ldr r6, [r1, #4]
	mov r0, r6
	bl sub_02079B0C
	mov r4, r0
	mov r0, r6
	mov r1, #6
	bl sub_02079A64
	add r1, sp, #0
	add r0, r5, #0x84
	mov r2, #0
	bl sub_02079E74
	and r5, r0, #0xff
	mov r0, r6
	mov r1, r4
	bl sub_02079A64
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_02002C28: .word _022B966C
	arm_func_end sub_02002BD0

	arm_func_start sub_02002C2C
sub_02002C2C: ; 0x02002C2C
	ldr ip, _02002C38 ; =sub_0207A030
	ldr r0, _02002C3C ; =_0229B0F8
	bx ip
	.align 2, 0
_02002C38: .word sub_0207A030
_02002C3C: .word _0229B0F8
	arm_func_end sub_02002C2C

	arm_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002CA4 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	mov r4, r0
	mov r0, r5
	mov r1, #7
	bl sub_02079A64
	ldr r0, _02002CA8 ; =_0229B0F8
	bl sub_0207A048
	mov r0, r6
	bl sub_020028B0
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #0
	str r0, [r6, #0x20]
	str r0, [r6, #0x1c]
	ldr r0, _02002CA8 ; =_0229B0F8
	bl sub_0207A0CC
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002CA4: .word _022B966C
_02002CA8: .word _0229B0F8
	arm_func_end sub_02002C40

	arm_func_start sub_02002CAC
sub_02002CAC: ; 0x02002CAC
	str r1, [r0, #0x20]
	bx lr
	arm_func_end sub_02002CAC

	arm_func_start sub_02002CB4
sub_02002CB4: ; 0x02002CB4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002D10 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002CF4
	cmp r1, r4
	movhs r4, #0
	bhs _02002CF8
	mov r0, r5
	bl sub_02079A64
	b _02002CF8
_02002CF4:
	mov r4, #0
_02002CF8:
	mov r0, r6
	bl sub_02002904
	str r4, [r6, #0x1c]
	bl sub_02002580
	str r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002D10: .word _022B966C
	arm_func_end sub_02002CB4

	arm_func_start sub_02002D14
sub_02002D14: ; 0x02002D14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _02002D7C ; =_022B966C
	mov r7, r0
	ldr r5, [r2, #4]
	mov r6, r1
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r7, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002D58
	cmp r1, r4
	movhs r4, #0
	bhs _02002D5C
	mov r0, r5
	bl sub_02079A64
	b _02002D5C
_02002D58:
	mov r4, #0
_02002D5C:
	mov r0, r6
	bl sub_02002B7C
	mov r0, r7
	bl sub_02002904
	str r4, [r7, #0x1c]
	bl sub_02002580
	str r0, [r7, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02002D7C: .word _022B966C
	arm_func_end sub_02002D14

	arm_func_start sub_02002D80
sub_02002D80: ; 0x02002D80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	bl sub_02002580
	mov r4, r0
	ldr r0, [r4]
	bl sub_02079B0C
	ldr r1, [r7, #0x20]
	mov r5, r0
	cmp r1, #0
	beq _02002DC4
	cmp r1, r5
	movhs r5, #0
	bhs _02002DC8
	ldr r0, [r4]
	bl sub_02079A64
	b _02002DC8
_02002DC4:
	mov r5, #0
_02002DC8:
	mov r0, r6
	bl sub_02002BD0
	cmp r0, #0
	beq _02002DF4
	mov r0, r7
	bl sub_02002904
	str r5, [r7, #0x1c]
	bl sub_02002580
	str r0, [r7, #0x18]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02002DF4:
	cmp r5, #0
	beq _02002E08
	mov r0, r4
	mov r1, r5
	bl sub_020027F8
_02002E08:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_02002D80

	arm_func_start sub_02002E10
sub_02002E10: ; 0x02002E10
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _02002E94 ; =_022B966C
	mov r6, r0
	ldr r5, [r1, #4]
	mov r0, r5
	bl sub_02079B0C
	ldr r1, [r6, #0x20]
	mov r4, r0
	cmp r1, #0
	beq _02002E50
	cmp r1, r4
	movhs r4, #0
	bhs _02002E54
	mov r0, r5
	bl sub_02079A64
	b _02002E54
_02002E50:
	mov r4, #0
_02002E54:
	mov r0, r6
	bl sub_02002910
	cmp r0, #0
	beq _02002E78
	str r4, [r6, #0x1c]
	bl sub_02002580
	str r0, [r6, #0x18]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_02002E78:
	cmp r4, #0
	beq _02002E8C
	mov r0, r5
	mov r1, r4
	bl sub_02079A64
_02002E8C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02002E94: .word _022B966C
	arm_func_end sub_02002E10

	arm_func_start sub_02002E98
sub_02002E98: ; 0x02002E98
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #0x1c]
	ldr r5, [r0, #0x18]
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	bl sub_020028F8
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02002E98

	arm_func_start sub_02002ECC
sub_02002ECC: ; 0x02002ECC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x1c]
	ldr r5, [r0, #0x18]
	mov r2, #0
	str r2, [r0, #0x18]
	mov r6, r1
	str r2, [r0, #0x1c]
	bl sub_020028F8
	mov r0, r6
	bl sub_02002B20
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	mov r1, r4
	bl sub_020027F8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_02002ECC

	arm_func_start sub_02002F0C
sub_02002F0C: ; 0x02002F0C
	stmdb sp!, {r3, lr}
	ldr r0, _02002F30 ; =_020AEF58
	bl sub_02002C40
	ldr r0, _02002F30 ; =_020AEF58
	mov r1, #7
	bl sub_02002CAC
	ldr r0, _02002F30 ; =_020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, pc}
	.align 2, 0
_02002F30: .word _020AEF58
	arm_func_end sub_02002F0C

	arm_func_start sub_02002F34
sub_02002F34: ; 0x02002F34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _02002F78 ; =_020AEF58
	mov r4, r1
	bl sub_02002CB4
	mov r0, r4, lsl #2
	mov r1, #1
	bl MemAlloc
	str r0, [r5, #0x20]
	str r4, [r5, #0x24]
	ldr r1, [r5, #0x20]
	mov r0, r5
	mov r2, r4
	bl sub_02079DB8
	ldr r0, _02002F78 ; =_020AEF58
	bl sub_02002E98
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02002F78: .word _020AEF58
	arm_func_end sub_02002F34

	arm_func_start sub_02002F7C
sub_02002F7C: ; 0x02002F7C
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	bl sub_02079DE0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002F7C

	arm_func_start sub_02002F98
sub_02002F98: ; 0x02002F98
	stmdb sp!, {r3, lr}
	cmp r2, #0
	movne r2, #1
	moveq r2, #0
	bl sub_02079E74
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end sub_02002F98

	arm_func_start sub_02002FB4
sub_02002FB4: ; 0x02002FB4
	bx lr
	arm_func_end sub_02002FB4

	arm_func_start sub_02002FB8
sub_02002FB8: ; 0x02002FB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02003024 ; =_0229B110
	mov r6, #0
	strh r6, [r0]
	cmp r6, #6
	ldr r5, _02003028 ; =_0229B114
	bge _0200301C
	mov r4, r6
	b _02003014
_02002FDC:
	mov r0, r5
	bl sub_02002C40
	cmp r6, #4
	str r4, [r5, #0x24]
	cmpne r6, #5
	bne _02003000
	bl OS_GetLockID
	strh r0, [r5, #0x28]
	b _02003004
_02003000:
	strh r4, [r5, #0x28]
_02003004:
	mov r0, r5
	bl sub_02002E98
	add r6, r6, #1
	add r5, r5, #0x2c
_02003014:
	cmp r6, #6
	blt _02002FDC
_0200301C:
	bl sub_020059A8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02003024: .word _0229B110
_02003028: .word _0229B114
	arm_func_end sub_02002FB8

	arm_func_start sub_0200302C
sub_0200302C: ; 0x0200302C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	movs r8, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl sub_02002580
	mov r7, r0
	mov r6, #0
	ldr r5, _020030C4 ; =_0229B114
	mov r4, #1
	ldr sl, _020030C8 ; =_0229B110
	b _020030B8
_02003054:
	mov r0, r4, lsl r6
	mov sb, r0, lsl #0x10
	tst r8, sb, lsr #16
	beq _020030B0
	mov r0, r5
	bl sub_02002CB4
	bl InterruptMasterDisable
	ldrh r0, [sl]
	ldrh r0, [sl]
	str r7, [r5, #0x24]
	orr r0, r0, sb, lsr #16
	strh r0, [sl]
	bl InterruptMasterEnable
	cmp r6, #4
	beq _0200309C
	cmp r6, #5
	beq _020030A8
	b _020030B0
_0200309C:
	ldrh r0, [r5, #0x28]
	bl sub_02083434
	b _020030B0
_020030A8:
	ldrh r0, [r5, #0x28]
	bl sub_0208346C
_020030B0:
	add r6, r6, #1
	add r5, r5, #0x2c
_020030B8:
	cmp r6, #6
	blt _02003054
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020030C4: .word _0229B114
_020030C8: .word _0229B110
	arm_func_end sub_0200302C

	arm_func_start InterruptMasterDisable
InterruptMasterDisable: ; 0x020030CC
	ldr r2, _020030E0 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_020030E0: .word 0x04000208
	arm_func_end InterruptMasterDisable

	arm_func_start InterruptMasterEnable
InterruptMasterEnable: ; 0x020030E4
	ldr r2, _020030F8 ; =0x04000208
	mov r1, #1
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_020030F8: .word 0x04000208
	arm_func_end InterruptMasterEnable

	arm_func_start sub_020030FC
sub_020030FC: ; 0x020030FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_02002580
	mov r1, #7
	mov r8, r0
	bl sub_020027F8
	mov sb, r0
	mov r7, #0
	ldr r6, _020031B8 ; =_0229B114
	mov fp, #1
	ldr r5, _020031BC ; =_0229B110
	b _020031A0
_02003130:
	mov r0, fp, lsl r7
	mov r4, r0, lsl #0x10
	tst sl, r4, lsr #16
	beq _02003198
	cmp r7, #4
	beq _02003154
	cmp r7, #5
	beq _02003160
	b _02003168
_02003154:
	ldrh r0, [r6, #0x28]
	bl sub_02083450
	b _02003168
_02003160:
	ldrh r0, [r6, #0x28]
	bl sub_0208347C
_02003168:
	bl InterruptMasterDisable
	ldrh r0, [r5]
	mvn r1, r4, lsr #16
	ldrh r0, [r5]
	ldrh r2, [r5]
	mov r0, #0
	str r0, [r6, #0x24]
	and r0, r2, r1
	strh r0, [r5]
	bl InterruptMasterEnable
	mov r0, r6
	bl sub_02002E98
_02003198:
	add r7, r7, #1
	add r6, r6, #0x2c
_020031A0:
	cmp r7, #6
	blt _02003130
	mov r0, r8
	mov r1, sb
	bl sub_020027F8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020031B8: .word _0229B114
_020031BC: .word _0229B110
	arm_func_end sub_020030FC

	arm_func_start sub_020031C0
sub_020031C0: ; 0x020031C0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl sub_02002580
	mov r5, #0
	mov lr, r5
	cmp r5, #6
	ldr ip, _02003218 ; =_0229B114
	bge _02003210
	mov r3, #1
	b _02003208
_020031E8:
	mov r1, r3, lsl lr
	mov r1, r1, lsl #0x10
	tst r4, r1, lsr #16
	ldrne r2, [ip, #0x24]
	add lr, lr, #1
	cmpne r2, r0
	orrne r5, r5, r1, lsr #16
	add ip, ip, #0x2c
_02003208:
	cmp lr, #6
	blt _020031E8
_02003210:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02003218: .word _0229B114
	arm_func_end sub_020031C0

	arm_func_start InitMemAllocTableVeneer
InitMemAllocTableVeneer: ; 0x0200321C
	ldr ip, _02003224 ; =InitMemAllocTable
	bx ip
	.align 2, 0
_02003224: .word InitMemAllocTable
	arm_func_end InitMemAllocTableVeneer
