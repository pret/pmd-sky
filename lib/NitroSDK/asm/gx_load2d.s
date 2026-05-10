	.include "asm/macros.inc"
	.include "include/gx_load2d.inc"

	.text

    arm_func_start GX_LoadBGPltt
GX_LoadBGPltt: ; 0x02077CF8
	stmdb sp!, {r4, lr}
	ldr r3, _02077D48 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077D34
	cmp r3, #0x1c
	bls _02077D34
	mov r1, r4
	add r2, lr, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r4, pc}
_02077D34:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x5000000
	bl MTi_CpuCopy16
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077D48: .word GXi_DmaId
	arm_func_end GX_LoadBGPltt

	arm_func_start GXS_LoadBGPltt
GXS_LoadBGPltt: ; 0x02077D4C
	stmdb sp!, {r3, lr}
	ldr r3, _02077DA0 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077D88
	cmp r3, #0x1c
	bls _02077D88
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077D88:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MTi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DA0: .word GXi_DmaId
	arm_func_end GXS_LoadBGPltt

	arm_func_start GX_LoadOBJPltt
GX_LoadOBJPltt: ; 0x02077DA4
	stmdb sp!, {r3, lr}
	ldr r3, _02077DF8 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077DE0
	cmp r3, #0x1c
	bls _02077DE0
	add r2, r1, #0x200
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077DE0:
	add r1, r1, #0x200
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MTi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077DF8: .word GXi_DmaId
	arm_func_end GX_LoadOBJPltt

	arm_func_start GXS_LoadOBJPltt
GXS_LoadOBJPltt: ; 0x02077DFC
	stmdb sp!, {r3, lr}
	ldr r3, _02077E50 ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077E38
	cmp r3, #0x1c
	bls _02077E38
	add r2, r1, #0x600
	mov r1, lr
	add r2, r2, #0x5000000
	bl MI_DmaCopy16
	ldmia sp!, {r3, pc}
_02077E38:
	add r1, r1, #0x600
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x5000000
	bl MTi_CpuCopy16
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077E50: .word GXi_DmaId
	arm_func_end GXS_LoadOBJPltt

	arm_func_start GX_LoadOAM
GX_LoadOAM: ; 0x02077E54
	stmdb sp!, {r4, lr}
	ldr r3, _02077EA4 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	beq _02077E90
	cmp r3, #0x30
	bls _02077E90
	mov r1, r4
	add r2, lr, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077E90:
	mov r0, r4
	mov r2, r3
	add r1, lr, #0x7000000
	bl MTi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077EA4: .word GXi_DmaId
	arm_func_end GX_LoadOAM

	arm_func_start GXS_LoadOAM
GXS_LoadOAM: ; 0x02077EA8
	stmdb sp!, {r3, lr}
	ldr r3, _02077EFC ; =GXi_DmaId
	mov lr, r0
	ldr r0, [r3]
	mvn ip, #0
	mov r3, r2
	cmp r0, ip
	beq _02077EE4
	cmp r3, #0x30
	bls _02077EE4
	add r2, r1, #0x400
	mov r1, lr
	add r2, r2, #0x7000000
	bl sub_0207BCCC
	ldmia sp!, {r3, pc}
_02077EE4:
	add r1, r1, #0x400
	mov r0, lr
	mov r2, r3
	add r1, r1, #0x7000000
	bl MTi_CpuCopy32
	ldmia sp!, {r3, pc}
	.align 2, 0
_02077EFC: .word GXi_DmaId
	arm_func_end GXS_LoadOAM

	arm_func_start GX_LoadOBJ
GX_LoadOBJ: ; 0x02077F00
	stmdb sp!, {r4, lr}
	ldr r3, _02077F54 ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6400000
	beq _02077F40
	cmp r3, #0x30
	bls _02077F40
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F40:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl MTi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077F54: .word GXi_DmaId
	arm_func_end GX_LoadOBJ

	arm_func_start GXS_LoadOBJ
GXS_LoadOBJ: ; 0x02077F58
	stmdb sp!, {r4, lr}
	ldr r3, _02077FAC ; =GXi_DmaId
	mov r4, r0
	ldr r0, [r3]
	mvn ip, #0
	mov lr, r1
	mov r3, r2
	cmp r0, ip
	mov ip, #0x6600000
	beq _02077F98
	cmp r3, #0x30
	bls _02077F98
	mov r1, r4
	add r2, ip, lr
	bl sub_0207BCCC
	ldmia sp!, {r4, pc}
_02077F98:
	mov r0, r4
	mov r2, r3
	add r1, ip, lr
	bl MTi_CpuCopy32
	ldmia sp!, {r4, pc}
	.align 2, 0
_02077FAC: .word GXi_DmaId
	arm_func_end GXS_LoadOBJ

	arm_func_start GX_LoadBG0Scr
GX_LoadBG0Scr: ; 0x02077FB0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0ScrPtr
	ldr r1, _0207800C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02077FF8
	cmp r4, #0x1c
	bls _02077FF8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02077FF8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207800C: .word GXi_DmaId
	arm_func_end GX_LoadBG0Scr

	arm_func_start GX_LoadBG1Scr
GX_LoadBG1Scr: ; 0x02078010
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1ScrPtr
	ldr r1, _0207806C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078058
	cmp r4, #0x1c
	bls _02078058
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078058:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207806C: .word GXi_DmaId
	arm_func_end GX_LoadBG1Scr

	arm_func_start GXS_LoadBG1Scr
GXS_LoadBG1Scr: ; 0x02078070
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1ScrPtr
	ldr r1, _020780CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020780B8
	cmp r4, #0x1c
	bls _020780B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_020780B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020780CC: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Scr

	arm_func_start GX_LoadBG2Scr
GX_LoadBG2Scr: ; 0x020780D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2ScrPtr
	ldr r1, _0207812C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078118
	cmp r4, #0x1c
	bls _02078118
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078118:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207812C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Scr

	arm_func_start GX_LoadBG3Scr
GX_LoadBG3Scr: ; 0x02078130
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3ScrPtr
	ldr r1, _0207818C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078178
	cmp r4, #0x1c
	bls _02078178
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl MI_DmaCopy16
	ldmia sp!, {r4, r5, r6, pc}
_02078178:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy16
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207818C: .word GXi_DmaId
	arm_func_end GX_LoadBG3Scr

	arm_func_start GX_LoadBG0Char
GX_LoadBG0Char: ; 0x02078190
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG0CharPtr
	ldr r1, _020781EC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020781D8
	cmp r4, #0x30
	bls _020781D8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020781D8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020781EC: .word GXi_DmaId
	arm_func_end GX_LoadBG0Char

	arm_func_start GXS_LoadBG0Char
GXS_LoadBG0Char: ; 0x020781F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG0CharPtr
	ldr r1, _0207824C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078238
	cmp r4, #0x30
	bls _02078238
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078238:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207824C: .word GXi_DmaId
	arm_func_end GXS_LoadBG0Char

	arm_func_start GX_LoadBG1Char
GX_LoadBG1Char: ; 0x02078250
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG1CharPtr
	ldr r1, _020782AC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078298
	cmp r4, #0x30
	bls _02078298
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078298:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020782AC: .word GXi_DmaId
	arm_func_end GX_LoadBG1Char

	arm_func_start GXS_LoadBG1Char
GXS_LoadBG1Char: ; 0x020782B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2S_GetBG1CharPtr
	ldr r1, _0207830C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020782F8
	cmp r4, #0x30
	bls _020782F8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020782F8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207830C: .word GXi_DmaId
	arm_func_end GXS_LoadBG1Char

	arm_func_start GX_LoadBG2Char
GX_LoadBG2Char: ; 0x02078310
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG2CharPtr
	ldr r1, _0207836C ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _02078358
	cmp r4, #0x30
	bls _02078358
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_02078358:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0207836C: .word GXi_DmaId
	arm_func_end GX_LoadBG2Char

	arm_func_start GX_LoadBG3Char
GX_LoadBG3Char: ; 0x02078370
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl G2_GetBG3CharPtr
	ldr r1, _020783CC ; =GXi_DmaId
	mov ip, r0
	ldr r0, [r1]
	mvn r1, #0
	cmp r0, r1
	beq _020783B8
	cmp r4, #0x30
	bls _020783B8
	mov r1, r6
	mov r3, r4
	add r2, ip, r5
	bl sub_0207BCCC
	ldmia sp!, {r4, r5, r6, pc}
_020783B8:
	mov r0, r6
	mov r2, r4
	add r1, ip, r5
	bl MTi_CpuCopy32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020783CC: .word GXi_DmaId
	arm_func_end GX_LoadBG3Char

	arm_func_start GX_BeginLoadBGExtPltt
GX_BeginLoadBGExtPltt: ; 0x020783D0
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForBGExtPltt
	ldr r1, _02078460 ; =sSubBGExtPltt
	cmp r0, #0x20
	str r0, [r1, #0x14]
	bgt _02078404
	cmp r0, #0x20
	bge _02078448
	cmp r0, #0
	ldmleia sp!, {r3, pc}
	cmp r0, #0x10
	beq _02078420
	ldmia sp!, {r3, pc}
_02078404:
	cmp r0, #0x40
	bgt _02078414
	beq _02078434
	ldmia sp!, {r3, pc}
_02078414:
	cmp r0, #0x60
	beq _02078448
	ldmia sp!, {r3, pc}
_02078420:
	ldr r2, _02078464 ; =0x06880000
	mov r0, #0
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078434:
	ldr r2, _02078468 ; =0x06894000
	mov r0, #0x4000
	str r2, [r1, #0x10]
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
_02078448:
	ldr r2, _0207846C ; =0x06890000
	ldr r0, _02078460 ; =sSubBGExtPltt
	mov r1, #0
	str r2, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078460: .word sSubBGExtPltt
_02078464: .word 0x06880000
_02078468: .word 0x06894000
_0207846C: .word 0x06890000
	arm_func_end GX_BeginLoadBGExtPltt

	arm_func_start GX_EndLoadBGExtPltt
GX_EndLoadBGExtPltt: ; 0x02078470
	stmdb sp!, {r3, lr}
	ldr r0, _020784B0 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207848C
	bl sub_0207C0FC
_0207848C:
	ldr r0, _020784B4 ; =sSubBGExtPltt
	ldr r0, [r0, #0x14]
	bl GX_SetBankForBGExtPltt
	ldr r0, _020784B4 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784B0: .word GXi_DmaId
_020784B4: .word sSubBGExtPltt
	arm_func_end GX_EndLoadBGExtPltt

	arm_func_start GX_BeginLoadOBJExtPltt
GX_BeginLoadOBJExtPltt: ; 0x020784B8
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForOBJExtPltt
	ldr r1, _020784F4 ; =sSubBGExtPltt
	cmp r0, #0
	str r0, [r1, #8]
	ldmeqia sp!, {r3, pc}
	cmp r0, #0x20
	beq _020784E8
	cmp r0, #0x40
	ldreq r0, _020784F8 ; =0x06894000
	streq r0, [r1, #4]
	ldmia sp!, {r3, pc}
_020784E8:
	ldr r0, _020784FC ; =0x06890000
	str r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020784F4: .word sSubBGExtPltt
_020784F8: .word 0x06894000
_020784FC: .word 0x06890000
	arm_func_end GX_BeginLoadOBJExtPltt

	arm_func_start GX_EndLoadOBJExtPltt
GX_EndLoadOBJExtPltt: ; 0x02078500
	stmdb sp!, {r3, lr}
	ldr r0, _0207853C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _0207851C
	bl sub_0207C0FC
_0207851C:
	ldr r0, _02078540 ; =sSubBGExtPltt
	ldr r0, [r0, #8]
	bl GX_SetBankForOBJExtPltt
	ldr r0, _02078540 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207853C: .word GXi_DmaId
_02078540: .word sSubBGExtPltt
	arm_func_end GX_EndLoadOBJExtPltt

	arm_func_start GXS_BeginLoadBGExtPltt
GXS_BeginLoadBGExtPltt: ; 0x02078544
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubBGExtPltt
	ldr r1, _02078558 ; =sSubBGExtPltt
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078558: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadBGExtPltt

	arm_func_start GXS_EndLoadBGExtPltt
GXS_EndLoadBGExtPltt: ; 0x0207855C
	stmdb sp!, {r3, lr}
	ldr r0, _02078594 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078578
	bl sub_0207C0FC
_02078578:
	ldr r0, _02078598 ; =sSubBGExtPltt
	ldr r0, [r0]
	bl GX_SetBankForSubBGExtPltt
	ldr r0, _02078598 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078594: .word GXi_DmaId
_02078598: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadBGExtPltt

	arm_func_start GXS_BeginLoadOBJExtPltt
GXS_BeginLoadOBJExtPltt: ; 0x0207859C
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForSubOBJExtPltt
	ldr r1, _020785B0 ; =sSubBGExtPltt
	str r0, [r1, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785B0: .word sSubBGExtPltt
	arm_func_end GXS_BeginLoadOBJExtPltt

	arm_func_start GXS_EndLoadOBJExtPltt
GXS_EndLoadOBJExtPltt: ; 0x020785B4
	stmdb sp!, {r3, lr}
	ldr r0, _020785EC ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020785D0
	bl sub_0207C0FC
_020785D0:
	ldr r0, _020785F0 ; =sSubBGExtPltt
	ldr r0, [r0, #0x18]
	bl GX_SetBankForSubOBJExtPltt
	ldr r0, _020785F0 ; =sSubBGExtPltt
	mov r1, #0
	str r1, [r0, #0x18]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020785EC: .word GXi_DmaId
_020785F0: .word sSubBGExtPltt
	arm_func_end GXS_EndLoadOBJExtPltt

