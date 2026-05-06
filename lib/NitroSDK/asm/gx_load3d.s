	.include "asm/macros.inc"
	.include "include/gx_load3d.inc"

	.text

    arm_func_start GX_BeginLoadTex
GX_BeginLoadTex: ; 0x020785F4
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTex
	mov r1, #6
	mul lr, r0, r1
	ldr r2, _02078640 ; =sTexStartAddrTable
	ldr r1, _02078644 ; =sTexStartAddrTable + 2
	ldrh ip, [r2, lr]
	ldr r2, _02078648 ; =sTexStartAddrTable + 4
	ldrh r3, [r1, lr]
	ldr r1, _0207864C ; =sClrImg
	ldrh r2, [r2, lr]
	str r0, [r1, #0x14]
	mov r0, ip, lsl #0xc
	str r0, [r1, #4]
	mov r0, r3, lsl #0xc
	str r0, [r1, #0x18]
	mov r0, r2, lsl #0xc
	str r0, [r1, #0x1c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078640: .word sTexStartAddrTable
_02078644: .word sTexStartAddrTable + 2
_02078648: .word sTexStartAddrTable + 4
_0207864C: .word sClrImg
	arm_func_end GX_BeginLoadTex

	arm_func_start GX_LoadTex
GX_LoadTex: ; 0x02078650
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02078788 ; =sClrImg
	mov r7, r0
	ldr r4, [r3, #0x18]
	mov ip, r1
	cmp r4, #0
	ldreq r0, [r3, #4]
	mov r6, r2
	addeq r2, r0, ip
	beq _0207873C
	ldr r2, [r3, #0x1c]
	add r0, ip, r6
	cmp r0, r2
	ldrlo r0, [r3, #4]
	addlo r2, r0, ip
	blo _0207873C
	cmp ip, r2
	addhs r0, r4, ip
	subhs r2, r0, r2
	bhs _0207873C
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	sub r5, r2, ip
	cmp r0, r1
	ldr lr, [r3, #4]
	beq _020786DC
	cmp r5, #0x30
	bls _020786DC
	mov r1, r7
	mov r3, r5
	add r2, lr, ip
	bl sub_0207BCCC
	b _020786EC
_020786DC:
	mov r0, r7
	mov r2, r5
	add r1, lr, ip
	bl ArrayCopy32
_020786EC:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078724
	mov ip, #0
	str ip, [sp]
	mov r2, r4
	add r1, r7, r5
	sub r3, r6, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078724:
	mov r1, r4
	add r0, r7, r5
	sub r2, r6, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0207873C:
	ldr r0, _0207878C ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078770
	mov r4, #0
	str r4, [sp]
	mov r1, r7
	mov r3, r6
	str r4, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02078770:
	mov r1, r2
	mov r0, r7
	mov r2, r6
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02078788: .word sClrImg
_0207878C: .word GXi_DmaId
	arm_func_end GX_LoadTex

	arm_func_start GX_EndLoadTex
GX_EndLoadTex: ; 0x02078790
	stmdb sp!, {r3, lr}
	ldr r0, _020787D4 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _020787AC
	bl sub_0207C0FC
_020787AC:
	ldr r0, _020787D8 ; =sClrImg
	ldr r0, [r0, #0x14]
	bl GX_SetBankForTex
	ldr r0, _020787D8 ; =sClrImg
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020787D4: .word GXi_DmaId
_020787D8: .word sClrImg
	arm_func_end GX_EndLoadTex

	arm_func_start GX_BeginLoadTexPltt
GX_BeginLoadTexPltt: ; 0x020787DC
	stmdb sp!, {r3, lr}
	bl GX_ResetBankForTexPltt
	mov r3, r0, asr #4
	ldr r1, _02078808 ; =sClrImg
	ldr r2, _0207880C ; =sTexPlttStartAddrTable
	mov r3, r3, lsl #1
	ldrh r2, [r2, r3]
	str r0, [r1, #0xc]
	mov r0, r2, lsl #0xc
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02078808: .word sClrImg
_0207880C: .word sTexPlttStartAddrTable
	arm_func_end GX_BeginLoadTexPltt

	arm_func_start GX_LoadTexPltt
GX_LoadTexPltt: ; 0x02078810
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r3, _02078874 ; =GXi_DmaId
	ldr lr, _02078878 ; =sClrImg
	ldr r4, [r3]
	mvn ip, #0
	mov r6, r0
	mov r5, r1
	mov r3, r2
	cmp r4, ip
	ldr lr, [lr, #8]
	beq _02078864
	mov ip, #0
	str ip, [sp]
	mov r0, r4
	mov r1, r6
	add r2, lr, r5
	str ip, [sp, #4]
	bl sub_0207BE6C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_02078864:
	add r1, lr, r5
	bl ArrayCopy32
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02078874: .word GXi_DmaId
_02078878: .word sClrImg
	arm_func_end GX_LoadTexPltt

	arm_func_start GX_EndLoadTexPltt
GX_EndLoadTexPltt: ; 0x0207887C
	stmdb sp!, {r3, lr}
	ldr r0, _020788B8 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	beq _02078898
	bl sub_0207C0FC
_02078898:
	ldr r0, _020788BC ; =sClrImg
	ldr r0, [r0, #0xc]
	bl GX_SetBankForTexPltt
	ldr r0, _020788BC ; =sClrImg
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020788B8: .word GXi_DmaId
_020788BC: .word sClrImg
	arm_func_end GX_EndLoadTexPltt


