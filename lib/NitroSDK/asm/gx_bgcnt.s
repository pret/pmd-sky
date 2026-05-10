	.include "asm/macros.inc"
	.include "include/gx_bgcnt.inc"

	.text

    arm_func_start G2_GetBG0ScrPtr
G2_GetBG0ScrPtr: ; 0x020773E8
	ldr r1, _02077418 ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_02077418: .word 0x04000008
	arm_func_end G2_GetBG0ScrPtr

	arm_func_start G2S_GetBG0ScrPtr
G2S_GetBG0ScrPtr: ; 0x0207741C
	ldr r0, _02077438 ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_02077438: .word 0x04001008
	arm_func_end G2S_GetBG0ScrPtr

	arm_func_start G2_GetBG1ScrPtr
G2_GetBG1ScrPtr: ; 0x0207743C
	ldr r1, _0207746C ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_0207746C: .word 0x0400000A
	arm_func_end G2_GetBG1ScrPtr

	arm_func_start G2S_GetBG1ScrPtr
G2S_GetBG1ScrPtr: ; 0x02077470
	ldr r0, _0207748C ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_0207748C: .word 0x0400100A
	arm_func_end G2S_GetBG1ScrPtr

	arm_func_start G2_GetBG2ScrPtr
G2_GetBG2ScrPtr: ; 0x02077490
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xc]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _0207750C
_020774C4: ; jump table
	b _020774E0 ; case 0
	b _020774E0 ; case 1
	b _020774E0 ; case 2
	b _020774E0 ; case 3
	b _020774E0 ; case 4
	b _020774EC ; case 5
	b _02077504 ; case 6
_020774E0:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_020774EC:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_02077504:
	mov r0, #0x6000000
	bx lr
_0207750C:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2ScrPtr

	arm_func_start G2_GetBG3ScrPtr
G2_GetBG3ScrPtr: ; 0x02077514
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xe]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _02077590
_02077548: ; jump table
	b _02077564 ; case 0
	b _02077564 ; case 1
	b _02077564 ; case 2
	b _02077570 ; case 3
	b _02077570 ; case 4
	b _02077570 ; case 5
	b _02077588 ; case 6
_02077564:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_02077570:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_02077588:
	mov r0, #0
	bx lr
_02077590:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3ScrPtr

	arm_func_start G2_GetBG0CharPtr
G2_GetBG0CharPtr: ; 0x02077598
	ldr r1, _020775C8 ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_020775C8: .word 0x04000008
	arm_func_end G2_GetBG0CharPtr

	arm_func_start G2S_GetBG0CharPtr
G2S_GetBG0CharPtr: ; 0x020775CC
	ldr r0, _020775E8 ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020775E8: .word 0x04001008
	arm_func_end G2S_GetBG0CharPtr

	arm_func_start G2_GetBG1CharPtr
G2_GetBG1CharPtr: ; 0x020775EC
	ldr r1, _0207761C ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_0207761C: .word 0x0400000A
	arm_func_end G2_GetBG1CharPtr

	arm_func_start G2S_GetBG1CharPtr
G2S_GetBG1CharPtr: ; 0x02077620
	ldr r0, _0207763C ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_0207763C: .word 0x0400100A
	arm_func_end G2S_GetBG1CharPtr

	arm_func_start G2_GetBG2CharPtr
G2_GetBG2CharPtr: ; 0x02077640
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xc]
	and r0, r0, #7
	cmp r0, #5
	blt _02077660
	tst r2, #0x80
	bne _02077688
_02077660:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_02077688:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2CharPtr

	arm_func_start G2_GetBG3CharPtr
G2_GetBG3CharPtr: ; 0x02077690
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xe]
	and r0, r0, #7
	cmp r0, #3
	blt _020776B8
	cmp r0, #6
	bge _020776E0
	tst r2, #0x80
	bne _020776E0
_020776B8:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_020776E0:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3CharPtr

