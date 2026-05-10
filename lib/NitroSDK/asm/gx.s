	.include "asm/macros.inc"
	.include "include/gx.inc"

	.text

    arm_func_start GX_Init
GX_Init: ; 0x02076074
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0207619C ; =0x04000304
	ldr r0, _020761A0 ; =0xFFFFFDF1
	ldrh r1, [r2]
	orr r1, r1, #0x8000
	strh r1, [r2]
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r2]
	bl GX_InitGXState
	ldr r5, _020761A4 ; =sDispMode
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _020760E8
	mvn r4, #2
_020760C4:
	bl OS_GetLockID
	mov r6, r0
	cmp r6, r4
	bne _020760D8
	bl WaitForever2
_020760D8:
	strh r6, [r5, #2]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020760C4
_020760E8:
	ldr r0, _020761A8 ; =0x04000004
	mov r2, #0
	mov r3, #0x4000000
	strh r2, [r0]
	ldr r0, _020761AC ; =sIsDispOn
	str r2, [r3]
	ldr r0, [r0, #4]
	sub r1, r3, #0x4000001
	cmp r0, r1
	beq _02076140
	add r1, r3, #8
	mov r3, #0x60
	bl sub_0207BC4C
	ldr r1, _020761B0 ; =0x0400006C
	mov r2, #0
	ldr r0, _020761AC ; =sIsDispOn
	strh r2, [r1]
	ldr r0, [r0, #4]
	ldr r1, _020761B4 ; =0x04001000
	mov r3, #0x70
	bl sub_0207BC4C
	b _02076168
_02076140:
	mov r0, r2
	add r1, r3, #8
	mov r2, #0x60
	bl MTi_CpuClear32
	ldr r3, _020761B0 ; =0x0400006C
	mov r0, #0
	ldr r1, _020761B4 ; =0x04001000
	mov r2, #0x70
	strh r0, [r3]
	bl MTi_CpuClear32
_02076168:
	ldr r0, _020761B8 ; =0x04000020
	mov r2, #0x100
	strh r2, [r0]
	strh r2, [r0, #6]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x16]
	add r1, r0, #0x1000
	ldr r0, _020761BC ; =0x04001026
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207619C: .word 0x04000304
_020761A0: .word 0xFFFFFDF1
_020761A4: .word sDispMode
_020761A8: .word 0x04000004
_020761AC: .word sIsDispOn
_020761B0: .word 0x0400006C
_020761B4: .word 0x04001000
_020761B8: .word 0x04000020
_020761BC: .word 0x04001026
	arm_func_end GX_Init

	arm_func_start GX_HBlankIntr
GX_HBlankIntr: ; 0x020761C0
	ldr r3, _020761E4 ; =0x04000004
	mov r1, r0, lsl #0x18
	ldrh r2, [r3]
	and ip, r0, #0x100
	and r0, r2, #0x3f
	orr r0, r0, r1, lsr #16
	orr r0, r0, ip, asr #1
	strh r0, [r3]
	bx lr
	.align 2, 0
_020761E4: .word 0x04000004
	arm_func_end GX_HBlankIntr

	arm_func_start GX_VBlankIntr
GX_VBlankIntr: ; 0x020761E8
	ldr r2, _02076218 ; =0x04000004
	cmp r0, #0
	ldrh r0, [r2]
	ldreqh r1, [r2]
	and r0, r0, #8
	biceq r1, r1, #8
	streqh r1, [r2]
	bxeq lr
	ldrh r1, [r2]
	orr r1, r1, #8
	strh r1, [r2]
	bx lr
	.align 2, 0
_02076218: .word 0x04000004
	arm_func_end GX_VBlankIntr

	arm_func_start GX_DispOff
GX_DispOff: ; 0x0207621C
	stmdb sp!, {r3, lr}
	mov lr, #0x4000000
	ldr ip, [lr]
	ldr r1, _02076250 ; =sIsDispOn
	and r2, ip, #0x30000
	mov r3, #0
	ldr r0, _02076254 ; =sDispMode
	mov r2, r2, lsr #0x10
	strh r3, [r1]
	strh r2, [r0]
	bic r0, ip, #0x30000
	str r0, [lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076250: .word sIsDispOn
_02076254: .word sDispMode
	arm_func_end GX_DispOff

	arm_func_start GX_DispOn
GX_DispOn: ; 0x02076258
	ldr r0, _02076298 ; =sDispMode
	ldr r1, _0207629C ; =sIsDispOn
	ldrh r2, [r0]
	mov r0, #1
	strh r0, [r1]
	mov r1, #0x4000000
	cmp r2, #0
	ldreq r0, [r1]
	orreq r0, r0, #0x10000
	streq r0, [r1]
	bxeq lr
	ldr r0, [r1]
	bic r0, r0, #0x30000
	orr r0, r0, r2, lsl #16
	str r0, [r1]
	bx lr
	.align 2, 0
_02076298: .word sDispMode
_0207629C: .word sIsDispOn
	arm_func_end GX_DispOn

	arm_func_start GX_SetGraphicsMode
GX_SetGraphicsMode: ; 0x020762A0
	stmdb sp!, {r3, lr}
	ldr r3, _020762FC ; =sIsDispOn
	mov lr, #0x4000000
	ldrh ip, [r3]
	ldr lr, [lr]
	ldr r3, _02076300 ; =sDispMode
	cmp ip, #0
	strh r0, [r3]
	ldr r3, _02076304 ; =0xFFF0FFF0
	moveq r0, #0
	and r3, lr, r3
	orr r0, r3, r0, lsl #16
	orr r0, r1, r0
	orr r1, r0, r2, lsl #3
	mov ip, #0x4000000
	ldr r0, _02076300 ; =sDispMode
	str r1, [ip]
	ldrh r0, [r0]
	cmp r0, #0
	ldreq r0, _020762FC ; =sIsDispOn
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020762FC: .word sIsDispOn
_02076300: .word sDispMode
_02076304: .word 0xFFF0FFF0
	arm_func_end GX_SetGraphicsMode

	arm_func_start GXS_SetGraphicsMode
GXS_SetGraphicsMode: ; 0x02076308
	ldr r2, _02076320 ; =0x04001000
	ldr r1, [r2]
	bic r1, r1, #7
	orr r0, r1, r0
	str r0, [r2]
	bx lr
	.align 2, 0
_02076320: .word 0x04001000
	arm_func_end GXS_SetGraphicsMode

	arm_func_start GXx_SetMasterBrightness_
GXx_SetMasterBrightness_: ; 0x02076324
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0]
	bxeq lr
	orrgt r1, r1, #0x4000
	strgth r1, [r0]
	rsble r1, r1, #0
	orrle r1, r1, #0x8000
	strleh r1, [r0]
	bx lr
	arm_func_end GXx_SetMasterBrightness_

	arm_func_start GX_InitGXState
GX_InitGXState: ; 0x0207634C
	ldr r0, _020763A4 ; =gGXState
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x16]
	ldr r1, _020763A8 ; =0x04000240
	strh r2, [r0, #0x18]
	str r2, [r1]
	strb r2, [r1, #4]
	strb r2, [r1, #5]
	strb r2, [r1, #6]
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_020763A4: .word gGXState
_020763A8: .word 0x04000240
	arm_func_end GX_InitGXState

	arm_func_start GX_VRAMCNT_SetLCDC_
GX_VRAMCNT_SetLCDC_: ; 0x020763AC
	tst r0, #1
	ldrne r1, _02076440 ; =0x04000240
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #2
	ldrne r1, _02076444 ; =0x04000241
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #4
	ldrne r1, _02076448 ; =0x04000242
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #8
	ldrne r1, _0207644C ; =0x04000243
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x10
	ldrne r1, _02076450 ; =0x04000244
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x20
	ldrne r1, _02076454 ; =0x04000245
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x40
	ldrne r1, _02076458 ; =0x04000246
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x80
	ldrne r1, _0207645C ; =0x04000248
	movne r2, #0x80
	strneb r2, [r1]
	tst r0, #0x100
	ldrne r0, _02076460 ; =0x04000249
	movne r1, #0x80
	strneb r1, [r0]
	bx lr
	.align 2, 0
_02076440: .word 0x04000240
_02076444: .word 0x04000241
_02076448: .word 0x04000242
_0207644C: .word 0x04000243
_02076450: .word 0x04000244
_02076454: .word 0x04000245
_02076458: .word 0x04000246
_0207645C: .word 0x04000248
_02076460: .word 0x04000249
	arm_func_end GX_VRAMCNT_SetLCDC_

	arm_func_start GX_SetBankForBG
GX_SetBankForBG: ; 0x02076464
	stmdb sp!, {r3, lr}
	ldr r1, _020766D4 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	cmp r0, #0x40
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #2]
	bgt _0207653C
	cmp r0, #0x40
	bge _020766B8
	cmp r0, #0x20
	bgt _02076530
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _020766C4
_020764AC: ; jump table
	b _020766C4 ; case 0
	b _020765D8 ; case 1
	b _020765A4 ; case 2
	b _020765CC ; case 3
	b _0207657C ; case 4
	b _02076614 ; case 5
	b _02076598 ; case 6
	b _020765C0 ; case 7
	b _02076560 ; case 8
	b _0207662C ; case 9
	b _02076644 ; case 10
	b _020765E8 ; case 11
	b _02076570 ; case 12
	b _02076608 ; case 13
	b _0207658C ; case 14
	b _020765B4 ; case 15
	b _02076674 ; case 16
	b _020766C4 ; case 17
	b _020766C4 ; case 18
	b _020766C4 ; case 19
	b _020766C4 ; case 20
	b _020766C4 ; case 21
	b _020766C4 ; case 22
	b _020766C4 ; case 23
	b _020766C4 ; case 24
	b _020766C4 ; case 25
	b _020766C4 ; case 26
	b _020766C4 ; case 27
	b _020766C4 ; case 28
	b _020766C4 ; case 29
	b _020766C4 ; case 30
	b _020766C4 ; case 31
	b _020766A8 ; case 32
_02076530:
	cmp r0, #0x30
	beq _02076668
	b _020766C4
_0207653C:
	cmp r0, #0x60
	bgt _02076554
	bge _0207669C
	cmp r0, #0x50
	beq _02076684
	b _020766C4
_02076554:
	cmp r0, #0x70
	beq _0207665C
	b _020766C4
_02076560:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_02076570:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x89
	strb r1, [r0]
_0207657C:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_0207658C:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_02076598:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x89
	strb r1, [r0]
_020765A4:
	ldr r0, _020766E0 ; =0x04000241
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020765B4:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x99
	strb r1, [r0]
_020765C0:
	ldr r0, _020766DC ; =0x04000242
	mov r1, #0x91
	strb r1, [r0]
_020765CC:
	ldr r0, _020766E0 ; =0x04000241
	mov r1, #0x89
	strb r1, [r0]
_020765D8:
	ldr r0, _020766E4 ; =0x04000240
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020765E8:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #1]
	mov r0, #0x91
	strb r0, [r1, #3]
	b _020766C4
_02076608:
	ldr r0, _020766D8 ; =0x04000243
	mov r1, #0x91
	strb r1, [r0]
_02076614:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020766C4
_0207662C:
	ldr r1, _020766E4 ; =0x04000240
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #3]
	b _020766C4
_02076644:
	ldr r1, _020766E0 ; =0x04000241
	mov r0, #0x81
	strb r0, [r1]
	mov r0, #0x89
	strb r0, [r1, #2]
	b _020766C4
_0207665C:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x99
	strb r1, [r0]
_02076668:
	ldr r0, _020766EC ; =0x04000245
	mov r1, #0x91
	strb r1, [r0]
_02076674:
	ldr r0, _020766F0 ; =0x04000244
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_02076684:
	ldr r1, _020766E8 ; =0x04000246
	mov r0, #0x91
	strb r0, [r1]
	mov r0, #0x81
	strb r0, [r1, #-2]
	b _020766C4
_0207669C:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x89
	strb r1, [r0]
_020766A8:
	ldr r0, _020766EC ; =0x04000245
	mov r1, #0x81
	strb r1, [r0]
	b _020766C4
_020766B8:
	ldr r0, _020766E8 ; =0x04000246
	mov r1, #0x81
	strb r1, [r0]
_020766C4:
	ldr r0, _020766D4 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020766D4: .word gGXState
_020766D8: .word 0x04000243
_020766DC: .word 0x04000242
_020766E0: .word 0x04000241
_020766E4: .word 0x04000240
_020766E8: .word 0x04000246
_020766EC: .word 0x04000245
_020766F0: .word 0x04000244
	arm_func_end GX_SetBankForBG

	arm_func_start GX_SetBankForOBJ
GX_SetBankForOBJ: ; 0x020766F4
	stmdb sp!, {r3, lr}
	ldr r1, _0207682C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #4]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #4]
	bgt _0207675C
	cmp r0, #0x30
	bge _020767D0
	cmp r0, #0x10
	bgt _02076750
	bge _020767DC
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0207681C
_02076740: ; jump table
	b _0207681C ; case 0
	b _020767A4 ; case 1
	b _020767B4 ; case 2
	b _02076798 ; case 3
_02076750:
	cmp r0, #0x20
	beq _02076810
	b _0207681C
_0207675C:
	cmp r0, #0x50
	bgt _0207677C
	bge _020767EC
	cmp r0, #0x40
	ldreq r0, _02076830 ; =0x04000246
	moveq r1, #0x82
	streqb r1, [r0]
	b _0207681C
_0207677C:
	cmp r0, #0x60
	bgt _0207678C
	beq _02076804
	b _0207681C
_0207678C:
	cmp r0, #0x70
	beq _020767C4
	b _0207681C
_02076798:
	ldr r0, _02076834 ; =0x04000241
	mov r1, #0x8a
	strb r1, [r0]
_020767A4:
	ldr r0, _02076838 ; =0x04000240
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767B4:
	ldr r0, _02076834 ; =0x04000241
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767C4:
	ldr r0, _02076830 ; =0x04000246
	mov r1, #0x9a
	strb r1, [r0]
_020767D0:
	ldr r0, _0207683C ; =0x04000245
	mov r1, #0x92
	strb r1, [r0]
_020767DC:
	ldr r0, _02076840 ; =0x04000244
	mov r1, #0x82
	strb r1, [r0]
	b _0207681C
_020767EC:
	ldr r1, _02076830 ; =0x04000246
	mov r0, #0x92
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-2]
	b _0207681C
_02076804:
	ldr r0, _02076830 ; =0x04000246
	mov r1, #0x8a
	strb r1, [r0]
_02076810:
	ldr r0, _0207683C ; =0x04000245
	mov r1, #0x82
	strb r1, [r0]
_0207681C:
	ldr r0, _0207682C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207682C: .word gGXState
_02076830: .word 0x04000246
_02076834: .word 0x04000241
_02076838: .word 0x04000240
_0207683C: .word 0x04000245
_02076840: .word 0x04000244
	arm_func_end GX_SetBankForOBJ

	arm_func_start GX_SetBankForBGExtPltt
GX_SetBankForBGExtPltt: ; 0x02076844
	stmdb sp!, {r3, lr}
	ldr r1, _02076938 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xe]
	cmp r0, #0x20
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xe]
	bgt _02076894
	cmp r0, #0x20
	bge _020768F8
	cmp r0, #0
	bgt _02076888
	beq _02076918
	b _02076928
_02076888:
	cmp r0, #0x10
	beq _020768B0
	b _02076928
_02076894:
	cmp r0, #0x40
	bgt _020768A4
	beq _020768CC
	b _02076928
_020768A4:
	cmp r0, #0x60
	beq _020768EC
	b _02076928
_020768B0:
	mov r2, #0x4000000
	ldr r1, [r2]
	mov r0, #0x84
	orr r1, r1, #0x40000000
	str r1, [r2]
	strb r0, [r2, #0x244]
	b _02076928
_020768CC:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _0207693C ; =0x04000246
	orr r1, r1, #0x40000000
	str r1, [r2]
	mov r1, #0x8c
	strb r1, [r0]
	b _02076928
_020768EC:
	ldr r0, _0207693C ; =0x04000246
	mov r1, #0x8c
	strb r1, [r0]
_020768F8:
	ldr r0, _02076940 ; =0x04000245
	mov r1, #0x84
	strb r1, [r0]
	mov r1, #0x4000000
	ldr r0, [r1]
	orr r0, r0, #0x40000000
	str r0, [r1]
	b _02076928
_02076918:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_02076928:
	ldr r0, _02076938 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076938: .word gGXState
_0207693C: .word 0x04000246
_02076940: .word 0x04000245
	arm_func_end GX_SetBankForBGExtPltt

	arm_func_start GX_SetBankForOBJExtPltt
GX_SetBankForOBJExtPltt: ; 0x02076944
	stmdb sp!, {r3, lr}
	ldr r1, _020769E4 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x10]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x10]
	beq _020769C4
	cmp r0, #0x20
	beq _02076984
	cmp r0, #0x40
	beq _020769A4
	b _020769D4
_02076984:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020769E8 ; =0x04000245
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020769D4
_020769A4:
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _020769EC ; =0x04000246
	orr r1, r1, #0x80000000
	str r1, [r2]
	mov r1, #0x85
	strb r1, [r0]
	b _020769D4
_020769C4:
	mov r1, #0x4000000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020769D4:
	ldr r0, _020769E4 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020769E4: .word gGXState
_020769E8: .word 0x04000245
_020769EC: .word 0x04000246
	arm_func_end GX_SetBankForOBJExtPltt

	arm_func_start GX_SetBankForTex
GX_SetBankForTex: ; 0x020769F0
	stmdb sp!, {r3, lr}
	ldr r1, _02076BAC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #8]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #8]
	ldr r2, _02076BB0 ; =0x04000060
	bne _02076A34
	ldrh r1, [r2]
	ldr r0, _02076BB4 ; =0x0000CFFE
	and r0, r1, r0
	strh r0, [r2]
	b _02076B9C
_02076A34:
	ldrh r1, [r2]
	cmp r0, #0xf
	bic r1, r1, #0x3000
	orr r1, r1, #1
	strh r1, [r2]
	addls pc, pc, r0, lsl #2
	b _02076B9C
_02076A50: ; jump table
	b _02076B9C ; case 0
	b _02076B90 ; case 1
	b _02076B5C ; case 2
	b _02076B84 ; case 3
	b _02076B34 ; case 4
	b _02076A90 ; case 5
	b _02076B50 ; case 6
	b _02076B78 ; case 7
	b _02076B18 ; case 8
	b _02076AA8 ; case 9
	b _02076AC0 ; case 10
	b _02076AD8 ; case 11
	b _02076B28 ; case 12
	b _02076AF8 ; case 13
	b _02076B44 ; case 14
	b _02076B6C ; case 15
_02076A90:
	mov r1, #0x83
	ldr r0, _02076BB8 ; =0x04000242
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _02076B9C
_02076AA8:
	mov r1, #0x83
	ldr r0, _02076BBC ; =0x04000243
	strb r1, [r2, #0x1e0]
	mov r1, #0x8b
	strb r1, [r0]
	b _02076B9C
_02076AC0:
	ldr r1, _02076BC0 ; =0x04000241
	mov r0, #0x83
	strb r0, [r1]
	mov r0, #0x8b
	strb r0, [r1, #2]
	b _02076B9C
_02076AD8:
	mov r0, #0x83
	ldr r1, _02076BC0 ; =0x04000241
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #2]
	b _02076B9C
_02076AF8:
	mov r0, #0x83
	ldr r1, _02076BB8 ; =0x04000242
	strb r0, [r2, #0x1e0]
	mov r0, #0x8b
	strb r0, [r1]
	mov r0, #0x93
	strb r0, [r1, #1]
	b _02076B9C
_02076B18:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B28:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x8b
	strb r1, [r0]
_02076B34:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B44:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x93
	strb r1, [r0]
_02076B50:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x8b
	strb r1, [r0]
_02076B5C:
	ldr r0, _02076BC0 ; =0x04000241
	mov r1, #0x83
	strb r1, [r0]
	b _02076B9C
_02076B6C:
	ldr r0, _02076BBC ; =0x04000243
	mov r1, #0x9b
	strb r1, [r0]
_02076B78:
	ldr r0, _02076BB8 ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_02076B84:
	ldr r0, _02076BC0 ; =0x04000241
	mov r1, #0x8b
	strb r1, [r0]
_02076B90:
	ldr r0, _02076BC4 ; =0x04000240
	mov r1, #0x83
	strb r1, [r0]
_02076B9C:
	ldr r0, _02076BAC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076BAC: .word gGXState
_02076BB0: .word 0x04000060
_02076BB4: .word 0x0000CFFE
_02076BB8: .word 0x04000242
_02076BBC: .word 0x04000243
_02076BC0: .word 0x04000241
_02076BC4: .word 0x04000240
	arm_func_end GX_SetBankForTex

	arm_func_start GX_SetBankForTexPltt
GX_SetBankForTexPltt: ; 0x02076BC8
	stmdb sp!, {r3, lr}
	ldr r1, _02076CA0 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xa]
	cmp r0, #0x30
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xa]
	bgt _02076C1C
	cmp r0, #0x30
	bge _02076C78
	cmp r0, #0x10
	bgt _02076C10
	bge _02076C84
	cmp r0, #0
	b _02076C90
_02076C10:
	cmp r0, #0x20
	beq _02076C4C
	b _02076C90
_02076C1C:
	cmp r0, #0x60
	bgt _02076C34
	bge _02076C40
	cmp r0, #0x40
	beq _02076C5C
	b _02076C90
_02076C34:
	cmp r0, #0x70
	beq _02076C6C
	b _02076C90
_02076C40:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x8b
	strb r1, [r0]
_02076C4C:
	ldr r0, _02076CA8 ; =0x04000245
	mov r1, #0x83
	strb r1, [r0]
	b _02076C90
_02076C5C:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x83
	strb r1, [r0]
	b _02076C90
_02076C6C:
	ldr r0, _02076CA4 ; =0x04000246
	mov r1, #0x9b
	strb r1, [r0]
_02076C78:
	ldr r0, _02076CA8 ; =0x04000245
	mov r1, #0x93
	strb r1, [r0]
_02076C84:
	ldr r0, _02076CAC ; =0x04000244
	mov r1, #0x83
	strb r1, [r0]
_02076C90:
	ldr r0, _02076CA0 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076CA0: .word gGXState
_02076CA4: .word 0x04000246
_02076CA8: .word 0x04000245
_02076CAC: .word 0x04000244
	arm_func_end GX_SetBankForTexPltt

	arm_func_start GX_SetBankForClearImage
GX_SetBankForClearImage: ; 0x02076CB0
	stmdb sp!, {r3, lr}
	ldr r1, _02076DCC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0xc]
	cmp r0, #0xc
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0xc]
	addls pc, pc, r0, lsl #2
	b _02076DBC
_02076CE0: ; jump table
	b _02076D6C ; case 0
	b _02076D80 ; case 1
	b _02076D20 ; case 2
	b _02076D14 ; case 3
	b _02076DA0 ; case 4
	b _02076DBC ; case 5
	b _02076DBC ; case 6
	b _02076DBC ; case 7
	b _02076D4C ; case 8
	b _02076DBC ; case 9
	b _02076DBC ; case 10
	b _02076DBC ; case 11
	b _02076D40 ; case 12
_02076D14:
	ldr r0, _02076DD0 ; =0x04000240
	mov r1, #0x93
	strb r1, [r0]
_02076D20:
	ldr r0, _02076DD4 ; =0x04000241
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D40:
	ldr r0, _02076DDC ; =0x04000242
	mov r1, #0x93
	strb r1, [r0]
_02076D4C:
	ldr r0, _02076DE0 ; =0x04000243
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D6C:
	ldr r1, _02076DD8 ; =0x04000060
	ldrh r0, [r1]
	bic r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076D80:
	ldr r0, _02076DD0 ; =0x04000240
	mov r1, #0x9b
	strb r1, [r0]
	sub r1, r0, #0x1e0
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
	b _02076DBC
_02076DA0:
	ldr r0, _02076DDC ; =0x04000242
	mov r2, #0x9b
	ldr r1, _02076DD8 ; =0x04000060
	strb r2, [r0]
	ldrh r0, [r1]
	orr r0, r0, #0x4000
	strh r0, [r1]
_02076DBC:
	ldr r0, _02076DCC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076DCC: .word gGXState
_02076DD0: .word 0x04000240
_02076DD4: .word 0x04000241
_02076DD8: .word 0x04000060
_02076DDC: .word 0x04000242
_02076DE0: .word 0x04000243
	arm_func_end GX_SetBankForClearImage

	arm_func_start GX_SetBankForARM7
GX_SetBankForARM7: ; 0x02076DE4
	stmdb sp!, {r3, lr}
	ldr r1, _02076E84 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #6]
	cmp r0, #8
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #6]
	bgt _02076E38
	cmp r0, #8
	bge _02076E68
	cmp r0, #4
	bgt _02076E74
	cmp r0, #0
	blt _02076E74
	beq _02076E74
	cmp r0, #4
	beq _02076E58
	b _02076E74
_02076E38:
	cmp r0, #0xc
	bne _02076E74
	ldr r1, _02076E88 ; =0x04000243
	mov r0, #0x8a
	strb r0, [r1]
	mov r0, #0x82
	strb r0, [r1, #-1]
	b _02076E74
_02076E58:
	ldr r0, _02076E8C ; =0x04000242
	mov r1, #0x82
	strb r1, [r0]
	b _02076E74
_02076E68:
	ldr r0, _02076E88 ; =0x04000243
	mov r1, #0x82
	strb r1, [r0]
_02076E74:
	ldr r0, _02076E84 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076E84: .word gGXState
_02076E88: .word 0x04000243
_02076E8C: .word 0x04000242
	arm_func_end GX_SetBankForARM7

	arm_func_start GX_SetBankForLCDC
GX_SetBankForLCDC: ; 0x02076E90
	ldr r1, _02076EA8 ; =gGXState
	ldr ip, _02076EAC ; =GX_VRAMCNT_SetLCDC_
	ldrh r2, [r1]
	orr r2, r2, r0
	strh r2, [r1]
	bx ip
	.align 2, 0
_02076EA8: .word gGXState
_02076EAC: .word GX_VRAMCNT_SetLCDC_
	arm_func_end GX_SetBankForLCDC

	arm_func_start GX_SetBankForSubBG
GX_SetBankForSubBG: ; 0x02076EB0
	stmdb sp!, {r3, lr}
	ldr r1, _02076F48 ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x12]
	cmp r0, #0x80
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x12]
	bgt _02076F04
	cmp r0, #0x80
	bge _02076F2C
	cmp r0, #4
	bgt _02076F38
	cmp r0, #0
	blt _02076F38
	beq _02076F38
	cmp r0, #4
	beq _02076F10
	b _02076F38
_02076F04:
	cmp r0, #0x180
	beq _02076F20
	b _02076F38
_02076F10:
	ldr r0, _02076F4C ; =0x04000242
	mov r1, #0x84
	strb r1, [r0]
	b _02076F38
_02076F20:
	ldr r0, _02076F50 ; =0x04000249
	mov r1, #0x81
	strb r1, [r0]
_02076F2C:
	ldr r0, _02076F54 ; =0x04000248
	mov r1, #0x81
	strb r1, [r0]
_02076F38:
	ldr r0, _02076F48 ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076F48: .word gGXState
_02076F4C: .word 0x04000242
_02076F50: .word 0x04000249
_02076F54: .word 0x04000248
	arm_func_end GX_SetBankForSubBG

	arm_func_start GX_SetBankForSubOBJ
GX_SetBankForSubOBJ: ; 0x02076F58
	stmdb sp!, {r3, lr}
	ldr r1, _02076FBC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x14]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x14]
	beq _02076FAC
	cmp r0, #8
	beq _02076FA0
	cmp r0, #0x100
	ldreq r0, _02076FC0 ; =0x04000249
	moveq r1, #0x82
	streqb r1, [r0]
	b _02076FAC
_02076FA0:
	ldr r0, _02076FC4 ; =0x04000243
	mov r1, #0x84
	strb r1, [r0]
_02076FAC:
	ldr r0, _02076FBC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_02076FBC: .word gGXState
_02076FC0: .word 0x04000249
_02076FC4: .word 0x04000243
	arm_func_end GX_SetBankForSubOBJ

	arm_func_start GX_SetBankForSubBGExtPltt
GX_SetBankForSubBGExtPltt: ; 0x02076FC8
	stmdb sp!, {r3, lr}
	ldr r1, _0207703C ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x16]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x16]
	beq _0207701C
	cmp r0, #0x80
	bne _0207702C
	ldr r3, _02077040 ; =0x04001000
	ldr r0, _02077044 ; =0x04000248
	ldr r2, [r3]
	mov r1, #0x82
	orr r2, r2, #0x40000000
	str r2, [r3]
	strb r1, [r0]
	b _0207702C
_0207701C:
	ldr r1, _02077040 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x40000000
	str r0, [r1]
_0207702C:
	ldr r0, _0207703C ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207703C: .word gGXState
_02077040: .word 0x04001000
_02077044: .word 0x04000248
	arm_func_end GX_SetBankForSubBGExtPltt

	arm_func_start GX_SetBankForSubOBJExtPltt
GX_SetBankForSubOBJExtPltt: ; 0x02077048
	stmdb sp!, {r3, lr}
	ldr r1, _020770BC ; =gGXState
	mvn ip, r0
	ldrh r3, [r1]
	ldrh r2, [r1, #0x18]
	cmp r0, #0
	orr r2, r3, r2
	and r2, ip, r2
	strh r2, [r1]
	strh r0, [r1, #0x18]
	beq _0207709C
	cmp r0, #0x100
	bne _020770AC
	ldr r3, _020770C0 ; =0x04001000
	ldr r0, _020770C4 ; =0x04000249
	ldr r2, [r3]
	mov r1, #0x83
	orr r2, r2, #0x80000000
	str r2, [r3]
	strb r1, [r0]
	b _020770AC
_0207709C:
	ldr r1, _020770C0 ; =0x04001000
	ldr r0, [r1]
	bic r0, r0, #0x80000000
	str r0, [r1]
_020770AC:
	ldr r0, _020770BC ; =gGXState
	ldrh r0, [r0]
	bl GX_VRAMCNT_SetLCDC_
	ldmia sp!, {r3, pc}
	.align 2, 0
_020770BC: .word gGXState
_020770C0: .word 0x04001000
_020770C4: .word 0x04000249
	arm_func_end GX_SetBankForSubOBJExtPltt

	arm_func_start resetBankForX_
resetBankForX_: ; 0x020770C8
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r2, #0
	ldr r1, _020770F8 ; =gGXState
	strh r2, [r0]
	ldrh r2, [r1]
	mov r0, r4
	orr r2, r2, r4
	strh r2, [r1]
	bl GX_VRAMCNT_SetLCDC_
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020770F8: .word gGXState
	arm_func_end resetBankForX_

	arm_func_start GX_ResetBankForBGExtPltt
GX_ResetBankForBGExtPltt: ; 0x020770FC
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _02077118 ; =resetBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _0207711C ; =_022B959A
	str r1, [r2]
	bx ip
	.align 2, 0
_02077118: .word resetBankForX_
_0207711C: .word _022B959A
	arm_func_end GX_ResetBankForBGExtPltt

	arm_func_start GX_ResetBankForOBJExtPltt
GX_ResetBankForOBJExtPltt: ; 0x02077120
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _0207713C ; =resetBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _02077140 ; =_022B959C
	str r1, [r2]
	bx ip
	.align 2, 0
_0207713C: .word resetBankForX_
_02077140: .word _022B959C
	arm_func_end GX_ResetBankForOBJExtPltt

	arm_func_start GX_ResetBankForTex
GX_ResetBankForTex: ; 0x02077144
	ldr ip, _02077150 ; =resetBankForX_
	ldr r0, _02077154 ; =_022B9594
	bx ip
	.align 2, 0
_02077150: .word resetBankForX_
_02077154: .word _022B9594
	arm_func_end GX_ResetBankForTex

	arm_func_start GX_ResetBankForTexPltt
GX_ResetBankForTexPltt: ; 0x02077158
	ldr ip, _02077164 ; =resetBankForX_
	ldr r0, _02077168 ; =_022B9596
	bx ip
	.align 2, 0
_02077164: .word resetBankForX_
_02077168: .word _022B9596
	arm_func_end GX_ResetBankForTexPltt

	arm_func_start GX_ResetBankForSubBGExtPltt
GX_ResetBankForSubBGExtPltt: ; 0x0207716C
	ldr r2, _02077188 ; =0x04001000
	ldr ip, _0207718C ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _02077190 ; =_022B95A2
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_02077188: .word 0x04001000
_0207718C: .word resetBankForX_
_02077190: .word _022B95A2
	arm_func_end GX_ResetBankForSubBGExtPltt

	arm_func_start GX_ResetBankForSubOBJExtPltt
GX_ResetBankForSubOBJExtPltt: ; 0x02077194
	ldr r2, _020771B0 ; =0x04001000
	ldr ip, _020771B4 ; =resetBankForX_
	ldr r1, [r2]
	ldr r0, _020771B8 ; =_022B95A4
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020771B0: .word 0x04001000
_020771B4: .word resetBankForX_
_020771B8: .word _022B95A4
	arm_func_end GX_ResetBankForSubOBJExtPltt

	arm_func_start disableBankForX_
disableBankForX_: ; 0x020771BC
	stmdb sp!, {r4, lr}
	ldrh r4, [r0]
	mov r1, #0
	strh r1, [r0]
	tst r4, #1
	ldrne r0, _02077274 ; =0x04000240
	strneb r1, [r0]
	tst r4, #2
	ldrne r0, _02077278 ; =0x04000241
	movne r1, #0
	strneb r1, [r0]
	tst r4, #4
	ldrne r0, _0207727C ; =0x04000242
	movne r1, #0
	strneb r1, [r0]
	tst r4, #8
	ldrne r0, _02077280 ; =0x04000243
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x10
	ldrne r0, _02077284 ; =0x04000244
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x20
	ldrne r0, _02077288 ; =0x04000245
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x40
	ldrne r0, _0207728C ; =0x04000246
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x80
	ldrne r0, _02077290 ; =0x04000248
	movne r1, #0
	strneb r1, [r0]
	tst r4, #0x100
	ldrne r0, _02077294 ; =0x04000249
	movne r1, #0
	strneb r1, [r0]
	ldr r1, _02077298 ; =GXi_VRamLockId
	mov r0, r4, lsl #0x10
	ldrh r1, [r1]
	mov r0, r0, lsr #0x10
	bl OSi_UnlockVram
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077274: .word 0x04000240
_02077278: .word 0x04000241
_0207727C: .word 0x04000242
_02077280: .word 0x04000243
_02077284: .word 0x04000244
_02077288: .word 0x04000245
_0207728C: .word 0x04000246
_02077290: .word 0x04000248
_02077294: .word 0x04000249
_02077298: .word GXi_VRamLockId
	arm_func_end disableBankForX_

	arm_func_start GX_DisableBankForBG
GX_DisableBankForBG: ; 0x0207729C
	ldr ip, _020772A8 ; =disableBankForX_
	ldr r0, _020772AC ; =_022B958E
	bx ip
	.align 2, 0
_020772A8: .word disableBankForX_
_020772AC: .word _022B958E
	arm_func_end GX_DisableBankForBG

	arm_func_start GX_DisableBankForOBJ
GX_DisableBankForOBJ: ; 0x020772B0
	ldr ip, _020772BC ; =disableBankForX_
	ldr r0, _020772C0 ; =_022B9590
	bx ip
	.align 2, 0
_020772BC: .word disableBankForX_
_020772C0: .word _022B9590
	arm_func_end GX_DisableBankForOBJ

	arm_func_start GX_DisableBankForBGExtPltt
GX_DisableBankForBGExtPltt: ; 0x020772C4
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _020772E0 ; =disableBankForX_
	bic r1, r1, #0x40000000
	ldr r0, _020772E4 ; =_022B959A
	str r1, [r2]
	bx ip
	.align 2, 0
_020772E0: .word disableBankForX_
_020772E4: .word _022B959A
	arm_func_end GX_DisableBankForBGExtPltt

	arm_func_start GX_DisableBankForOBJExtPltt
GX_DisableBankForOBJExtPltt: ; 0x020772E8
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr ip, _02077304 ; =disableBankForX_
	bic r1, r1, #0x80000000
	ldr r0, _02077308 ; =_022B959C
	str r1, [r2]
	bx ip
	.align 2, 0
_02077304: .word disableBankForX_
_02077308: .word _022B959C
	arm_func_end GX_DisableBankForOBJExtPltt

	arm_func_start GX_DisableBankForTex
GX_DisableBankForTex: ; 0x0207730C
	ldr ip, _02077318 ; =disableBankForX_
	ldr r0, _0207731C ; =_022B9594
	bx ip
	.align 2, 0
_02077318: .word disableBankForX_
_0207731C: .word _022B9594
	arm_func_end GX_DisableBankForTex

	arm_func_start GX_DisableBankForTexPltt
GX_DisableBankForTexPltt: ; 0x02077320
	ldr ip, _0207732C ; =disableBankForX_
	ldr r0, _02077330 ; =_022B9596
	bx ip
	.align 2, 0
_0207732C: .word disableBankForX_
_02077330: .word _022B9596
	arm_func_end GX_DisableBankForTexPltt

	arm_func_start GX_DisableBankForClearImage
GX_DisableBankForClearImage: ; 0x02077334
	ldr ip, _02077340 ; =disableBankForX_
	ldr r0, _02077344 ; =_022B9598
	bx ip
	.align 2, 0
_02077340: .word disableBankForX_
_02077344: .word _022B9598
	arm_func_end GX_DisableBankForClearImage

	arm_func_start GX_DisableBankForARM7
GX_DisableBankForARM7: ; 0x02077348
	ldr ip, _02077354 ; =disableBankForX_
	ldr r0, _02077358 ; =_022B9592
	bx ip
	.align 2, 0
_02077354: .word disableBankForX_
_02077358: .word _022B9592
	arm_func_end GX_DisableBankForARM7

	arm_func_start GX_DisableBankForLCDC
GX_DisableBankForLCDC: ; 0x0207735C
	ldr ip, _02077368 ; =disableBankForX_
	ldr r0, _0207736C ; =gGXState
	bx ip
	.align 2, 0
_02077368: .word disableBankForX_
_0207736C: .word gGXState
	arm_func_end GX_DisableBankForLCDC

	arm_func_start GX_DisableBankForSubBG
GX_DisableBankForSubBG: ; 0x02077370
	ldr ip, _0207737C ; =disableBankForX_
	ldr r0, _02077380 ; =_022B959E
	bx ip
	.align 2, 0
_0207737C: .word disableBankForX_
_02077380: .word _022B959E
	arm_func_end GX_DisableBankForSubBG

	arm_func_start GX_DisableBankForSubOBJ
GX_DisableBankForSubOBJ: ; 0x02077384
	ldr ip, _02077390 ; =disableBankForX_
	ldr r0, _02077394 ; =_022B95A0
	bx ip
	.align 2, 0
_02077390: .word disableBankForX_
_02077394: .word _022B95A0
	arm_func_end GX_DisableBankForSubOBJ

	arm_func_start GX_DisableBankForSubBGExtPltt
GX_DisableBankForSubBGExtPltt: ; 0x02077398
	ldr r2, _020773B4 ; =0x04001000
	ldr ip, _020773B8 ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020773BC ; =_022B95A2
	bic r1, r1, #0x40000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020773B4: .word 0x04001000
_020773B8: .word disableBankForX_
_020773BC: .word _022B95A2
	arm_func_end GX_DisableBankForSubBGExtPltt

	arm_func_start GX_DisableBankForSubOBJExtPltt
GX_DisableBankForSubOBJExtPltt: ; 0x020773C0
	ldr r2, _020773DC ; =0x04001000
	ldr ip, _020773E0 ; =disableBankForX_
	ldr r1, [r2]
	ldr r0, _020773E4 ; =_022B95A4
	bic r1, r1, #0x80000000
	str r1, [r2]
	bx ip
	.align 2, 0
_020773DC: .word 0x04001000
_020773E0: .word disableBankForX_
_020773E4: .word _022B95A4
	arm_func_end GX_DisableBankForSubOBJExtPltt
