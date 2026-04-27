	.include "asm/macros.inc"
	.include "main_0200B33C.inc"

	.text

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
	bl DC_FlushRange
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
	bl DC_FlushRange
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
	bl MI_StopDma
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
