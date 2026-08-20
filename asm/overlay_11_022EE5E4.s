	.include "asm/macros.inc"
	.include "overlay_11_022EE5E4.inc"

	.text

	arm_func_start ov11_022EE5E4
ov11_022EE5E4: ; 0x022EE5E4
	strb r1, [r0, #0x1ee]
	bx lr
	arm_func_end ov11_022EE5E4

	arm_func_start ov11_022EE5EC
ov11_022EE5EC: ; 0x022EE5EC
	ldr r3, [r0, #0x1f4]
	cmp r3, #0
	strneb r1, [r0, #0x1f8]
	strneb r2, [r0, #0x1f9]
	strneb r2, [r0, #0x1fa]
	movne r1, #1
	strneb r1, [r0, #0x1fb]
	bx lr
	arm_func_end ov11_022EE5EC

	arm_func_start ov11_022EE60C
ov11_022EE60C: ; 0x022EE60C
	ldr r1, [r0, #0x1f4]
	cmp r1, #0
	ldrneb r0, [r0, #0x1fb]
	moveq r0, #0
	bx lr
	arm_func_end ov11_022EE60C

	arm_func_start ov11_022EE620
ov11_022EE620: ; 0x022EE620
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mov r5, r1
	cmp r5, #6
	add sb, r4, #0x210
	addls pc, pc, r5, lsl #2
	b _022EE688
_022EE640: ; jump table
	b _022EE65C ; case 0
	b _022EE688 ; case 1
	b _022EE688 ; case 2
	b _022EE6C4 ; case 3
	b _022EE6F4 ; case 4
	b _022EE6F4 ; case 5
	b _022EE6F4 ; case 6
_022EE65C:
	mov r2, #0
	str r2, [r4, #0x1fc]
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	ldr r0, _022EE8AC ; =ov11_022EEA60
	str r0, [sb, #0x18]
	b _022EE760
_022EE688:
	mov r7, #1
	str r7, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r6, [r0, #0xc0]
	cmp r5, #2
	mov r2, #0
	movne r7, #0
	str r6, [sp]
	and r6, r7, #0xff
	mov r0, sb
	mov r1, r4
	mov r3, r2
	str r6, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6C4:
	mov r0, #1
	str r0, [r4, #0x1fc]
	add r0, r4, #0x200
	ldrsh r1, [r0, #0xc0]
	mov r2, #0
	mov r0, sb
	str r1, [sp]
	mov r1, r4
	mov r3, r2
	str r2, [sp, #4]
	bl ov11_022EE8CC
	b _022EE760
_022EE6F4:
	mov r0, #2
	cmp r5, #6
	moveq r3, #1
	str r0, [r4, #0x1fc]
	movne r3, #0
	mov r2, #1
	and r6, r3, #0xff
	str r2, [sp]
	mov r0, sb
	mov r1, r4
	mov r3, #0
	str r6, [sp, #4]
	bl ov11_022EE8CC
	add r0, r4, #0x200
	ldrsh r0, [r0, #0xc0]
	cmp r5, #4
	movne r2, #1
	moveq r2, #0
	sub r0, r0, #1
	and r6, r2, #0xff
	str r0, [sp]
	mov r1, r4
	add r0, sb, #0x54
	mov r2, #0
	mov r3, #1
	str r6, [sp, #4]
	bl ov11_022EE8CC
_022EE760:
	cmp r5, #3
	bne _022EE780
	ldr r2, _022EE8B0 ; =ov11_022EEA64
	mov r0, sb
	add r1, r4, #0x200
	str r2, [sb, #0x18]
	bl ov11_022EE9B0
	b _022EE84C
_022EE780:
	ldr r0, _022EE8B4 ; =ov11_02320BE4
	mov sl, #0
	ldr r8, [r0, #0x24]
	ldr r7, [r0, #0x28]
	str r8, [sp, #8]
	str r7, [sp, #0xc]
	add r5, r4, #0x200
	ldr fp, _022EE8B8 ; =ov11_022EEA84
	ldr r6, _022EE8B0 ; =ov11_022EEA64
	b _022EE840
_022EE7A8:
	mov r0, #0x54
	mla r0, sl, r0, sb
	add r1, r4, sl, lsl #3
	str r8, [r1, #0x200]
	str r7, [r1, #0x204]
	ldrsh r1, [r0, #4]
	cmp r1, #1
	beq _022EE7D0
	cmp r1, #2
	beq _022EE804
_022EE7D0:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE7E4
	cmp r1, #1
	beq _022EE7EC
_022EE7E4:
	str r6, [r0, #0x18]
	b _022EE834
_022EE7EC:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8BC ; =ov11_022EEBF8
	ldreq r1, _022EE8C0 ; =ov11_022EEAAC
	str r1, [r0, #0x18]
	b _022EE834
_022EE804:
	ldrsh r1, [r0]
	cmp r1, #0
	beq _022EE818
	cmp r1, #1
	beq _022EE820
_022EE818:
	str fp, [r0, #0x18]
	b _022EE834
_022EE820:
	ldrb r1, [r0, #6]
	cmp r1, #0
	ldrne r1, _022EE8C4 ; =ov11_022EEFC0
	ldreq r1, _022EE8C8 ; =ov11_022EED98
	str r1, [r0, #0x18]
_022EE834:
	add r1, r5, sl, lsl #3
	bl ov11_022EE9B0
	add sl, sl, #1
_022EE840:
	ldr r0, [r4, #0x1fc]
	cmp sl, r0
	blt _022EE7A8
_022EE84C:
	ldr r0, _022EE8B4 ; =ov11_02320BE4
	ldr r7, [r4, #0x1fc]
	ldr r6, [r0, #0x24]
	ldr r5, [r0, #0x28]
	str r6, [sp, #0x10]
	str r5, [sp, #0x14]
	mov sl, #0
	mov r8, #0x54
	b _022EE89C
_022EE870:
	mla r0, r7, r8, sb
	add r1, r4, r7, lsl #3
	str r6, [r1, #0x200]
	str r5, [r1, #0x204]
	str sl, [sp]
	mov r1, r4
	mov r2, sl
	mov r3, sl
	str sl, [sp, #4]
	bl ov11_022EE8CC
	add r7, r7, #1
_022EE89C:
	cmp r7, #2
	blt _022EE870
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EE8AC: .word ov11_022EEA60
_022EE8B0: .word ov11_022EEA64
_022EE8B4: .word ov11_02320BE4
_022EE8B8: .word ov11_022EEA84
_022EE8BC: .word ov11_022EEBF8
_022EE8C0: .word ov11_022EEAAC
_022EE8C4: .word ov11_022EEFC0
_022EE8C8: .word ov11_022EED98
	arm_func_end ov11_022EE620

	arm_func_start ov11_022EE8CC
ov11_022EE8CC: ; 0x022EE8CC
	stmdb sp!, {r4, r5, r6, lr}
	add r2, r1, #0x200
	ldrsh r2, [r2, #0xb8]
	ldrb r4, [sp, #0x14]
	ldr ip, [sp, #0x10]
	strh r2, [r0]
	strh r3, [r0, #2]
	strh ip, [r0, #4]
	strb r4, [r0, #6]
	ldrb r2, [r1, #0x1e2]
	cmp r4, #0
	str r2, [r0, #8]
	ldrb r2, [r1, #0x1e3]
	str r2, [r0, #0xc]
	ldrb r2, [r1, #0x1e0]
	movne r2, r2, lsl #3
	strne r2, [r0, #0x10]
	ldrneb r2, [r1, #0x1e1]
	movne r2, r2, lsl #3
	bne _022EE934
	mov r2, r2, lsl #3
	sub r2, r2, #0x100
	str r2, [r0, #0x10]
	ldrb r2, [r1, #0x1e1]
	mov r2, r2, lsl #3
	sub r2, r2, #0xc0
_022EE934:
	str r2, [r0, #0x14]
	mov r2, #0
	add lr, r1, #0x200
	b _022EE96C
_022EE944:
	add r6, r1, r3, lsl #2
	ldr r4, [r6, #0x2dc]
	add r5, r0, r2, lsl #2
	str r4, [r5, #0x1c]
	ldr r4, [r6, #0x2e4]
	add r2, r2, #1
	str r4, [r5, #0x24]
	ldr r4, [r6, #0x2ec]
	add r3, r3, #1
	str r4, [r5, #0x2c]
_022EE96C:
	cmp r2, ip
	bge _022EE980
	ldrsh r4, [lr, #0xc0]
	cmp r3, r4
	blt _022EE944
_022EE980:
	mov ip, #0
	b _022EE99C
_022EE988:
	add r3, r0, r2, lsl #2
	str ip, [r3, #0x1c]
	str ip, [r3, #0x24]
	str ip, [r3, #0x2c]
	add r2, r2, #1
_022EE99C:
	cmp r2, #2
	blt _022EE988
	add r1, r1, #0x200
	bl ov11_022EE9B0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022EE8CC

	arm_func_start ov11_022EE9B0
ov11_022EE9B0: ; 0x022EE9B0
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	str r2, [r4, #0x34]
	mov r0, r0, asr #3
	str r0, [r4, #0x3c]
	ldr r1, [r1, #4]
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r1, [r4, #0x38]
	mov r0, r0, asr #3
	str r0, [r4, #0x40]
	ldrsh r0, [r4]
	cmp r0, #0
	beq _022EEA00
	cmp r0, #1
	beq _022EEA18
	ldmia sp!, {r4, pc}
_022EEA00:
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
_022EEA18:
	ldr r0, [r4, #0x3c]
	mov r1, #3
	bl _s32_div_f
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl _s32_div_f
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x34]
	mov r1, #0x18
	bl _s32_div_f
	add r0, r1, #0x10
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x38]
	mov r1, #0x18
	bl _s32_div_f
	str r1, [r4, #0x50]
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EE9B0

	arm_func_start ov11_022EEA60
ov11_022EEA60: ; 0x022EEA60
	bx lr
	arm_func_end ov11_022EEA60

	arm_func_start ov11_022EEA64
ov11_022EEA64: ; 0x022EEA64
	ldr r2, [r0, #0x2c]
	mov r1, #0
	mov r0, r1
_022EEA70:
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r2], #2
	blt _022EEA70
	bx lr
	arm_func_end ov11_022EEA64

	arm_func_start ov11_022EEA84
ov11_022EEA84: ; 0x022EEA84
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	mov r1, #0
	mov r0, r1
_022EEA94:
	strh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x800
	strh r0, [r3], #2
	blt _022EEA94
	bx lr
	arm_func_end ov11_022EEA84

	arm_func_start ov11_022EEAAC
ov11_022EEAAC: ; 0x022EEAAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, [r0, #0x44]
	ldr r1, [r0, #0x48]
	ldr r3, [r0, #0x24]
	add r1, r2, r1, lsl #6
	add ip, r3, r1, lsl #1
	mov lr, #2
	mov r5, #0
_022EEAD0:
	ldr r4, [r0, #0x2c]
	mov r7, ip
	mov r3, #0
	add r1, sp, #0
_022EEAE0:
	add r2, r4, lr, lsl #1
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	add lr, lr, #0x20
	blt _022EEAE0
	mov r4, #0
	add r2, sp, #0
	mov r3, r4
_022EEB04:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB18:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB18
	add r4, r4, #1
	cmp r4, #0xa
	blt _022EEB04
	mov r3, #0
	add r2, sp, #0
_022EEB64:
	ldr r1, [r2, r3, lsl #2]
	add r1, r1, #0x7c0
	str r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blt _022EEB64
	add r2, sp, #0
	mov r3, #0
	b _022EEBD8
_022EEB88:
	ldrh r1, [r7], #2
	ldr r6, [r0, #0x1c]
	mov r8, r3
	add r1, r1, r1, lsl #3
	add r6, r6, r1, lsl #1
_022EEB9C:
	ldrh sb, [r6]
	ldr r1, [r2, r8, lsl #2]
	add sl, r6, #4
	strh sb, [r1]
	ldrh fp, [r6, #2]
	add sb, r1, #6
	add r6, r6, #6
	strh fp, [r1, #2]
	ldrh sl, [sl]
	strh sl, [r1, #4]
	str sb, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEB9C
	add r4, r4, #1
_022EEBD8:
	cmp r4, #0xc
	blt _022EEB88
	add r5, r5, #1
	cmp r5, #9
	add ip, ip, #0x80
	blt _022EEAD0
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEAAC

	arm_func_start ov11_022EEBF8
ov11_022EEBF8: ; 0x022EEBF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r6, [r0, #0x48]
	ldr r5, [r0, #0x44]
	ldr r2, [r0, #8]
	ldr r3, [r0, #0xc]
	sub r2, r2, r5
	str r2, [sp]
	ldr r4, [r0, #0x24]
	add r1, r5, r6, lsl #6
	add r1, r4, r1, lsl #1
	sub ip, r3, r6
	mov r2, #2
	mov fp, #0
_022EEC30:
	cmp ip, #0
	movgt r4, r1
	subgt ip, ip, #1
	ldrle r3, [r0, #0x44]
	ldrle r1, [r0, #0x24]
	ldr lr, [sp]
	addle r1, r1, r3, lsl #1
	ldrle ip, [r0, #0xc]
	ldr r7, [r0, #0x2c]
	movle r4, r1
	mov r6, #0
	add r3, sp, #4
_022EEC60:
	add r5, r7, r2, lsl #1
	str r5, [r3, r6, lsl #2]
	add r6, r6, #1
	cmp r6, #3
	add r2, r2, #0x20
	blt _022EEC60
	mov r3, #0
_022EEC7C:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EEC90:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EEC90
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
	cmp r3, #0xa
	blt _022EEC7C
	mov r7, #0
	add r6, sp, #4
_022EECF4:
	ldr r5, [r6, r7, lsl #2]
	add r5, r5, #0x7c0
	str r5, [r6, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EECF4
	b _022EED78
_022EED10:
	ldrh r5, [r4], #2
	ldr r6, [r0, #0x1c]
	mov sl, #0
	add r5, r5, r5, lsl #3
	add sb, r6, r5, lsl #1
_022EED24:
	add r6, sp, #4
	ldr r8, [r6, sl, lsl #2]
	ldrh r5, [sb]
	add r6, sb, #4
	strh r5, [r8]
	ldrh r7, [sb, #2]
	add r5, r8, #6
	add sb, sb, #6
	strh r7, [r8, #2]
	ldrh r6, [r6]
	strh r6, [r8, #4]
	add r6, sp, #4
	str r5, [r6, sl, lsl #2]
	add sl, sl, #1
	cmp sl, #3
	blt _022EED24
	sub lr, lr, #1
	cmp lr, #0
	ldrle lr, [r0, #8]
	add r3, r3, #1
	suble r4, r4, lr, lsl #1
_022EED78:
	cmp r3, #0xc
	blt _022EED10
	add fp, fp, #1
	cmp fp, #9
	add r1, r1, #0x80
	blt _022EEC30
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEBF8

	arm_func_start ov11_022EED98
ov11_022EED98: ; 0x022EED98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r3, [r0, #0x44]
	ldr r2, [r0, #0x48]
	ldr r1, [r0, #0x24]
	add r3, r3, r2, lsl #6
	add r1, r1, r3, lsl #1
	ldr r2, [r0, #0x28]
	str r1, [sp, #8]
	add r1, r2, r3, lsl #1
	str r1, [sp, #4]
	mov r1, #0
	mov r3, #2
	str r1, [sp]
_022EEDD0:
	ldr sb, [r0, #0x2c]
	ldr sl, [r0, #0x30]
	ldr r5, [sp, #8]
	ldr r6, [sp, #4]
	mov r8, #0
	add r4, sp, #0x18
	add r1, sp, #0xc
_022EEDEC:
	add r7, sb, r3, lsl #1
	add r2, sl, r3, lsl #1
	str r7, [r4, r8, lsl #2]
	str r2, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	add r3, r3, #0x20
	blt _022EEDEC
	mov ip, #0
_022EEE10:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add lr, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r4, r2, r1, lsl #1
	mov r7, #0
_022EEE34:
	add r1, sp, #0x18
	ldr r2, [r1, r7, lsl #2]
	add r1, sp, #0xc
	ldrh sl, [lr]
	ldr r1, [r1, r7, lsl #2]
	add r8, lr, #4
	strh sl, [r2]
	ldrh sl, [lr, #2]
	add fp, r2, #6
	add sb, r4, #4
	strh sl, [r2, #2]
	ldrh sl, [r8]
	add r8, r1, #6
	add lr, lr, #6
	strh sl, [r2, #4]
	ldrh r2, [r4]
	strh r2, [r1]
	ldrh r2, [r4, #2]
	add r4, r4, #6
	strh r2, [r1, #2]
	ldrh r2, [sb]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str fp, [r1, r7, lsl #2]
	add r1, sp, #0xc
	str r8, [r1, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EEE34
	add ip, ip, #1
	cmp ip, #0xa
	blt _022EEE10
	mov r8, #0
	add r7, sp, #0x18
	mov r2, r1
_022EEEC0:
	ldr r4, [r7, r8, lsl #2]
	ldr r1, [r2, r8, lsl #2]
	add r4, r4, #0x7c0
	add r1, r1, #0x7c0
	str r4, [r7, r8, lsl #2]
	str r1, [r2, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEEC0
	b _022EEF84
_022EEEE8:
	ldrh r2, [r5], #2
	ldrh r1, [r6], #2
	ldr r4, [r0, #0x1c]
	add r2, r2, r2, lsl #3
	add r4, r4, r2, lsl #1
	ldr r2, [r0, #0x20]
	add r1, r1, r1, lsl #3
	add r7, r2, r1, lsl #1
	mov r8, #0
_022EEF0C:
	add r1, sp, #0x18
	ldr r2, [r1, r8, lsl #2]
	add r1, sp, #0xc
	ldrh fp, [r4]
	ldr r1, [r1, r8, lsl #2]
	add sb, r4, #4
	strh fp, [r2]
	ldrh fp, [r4, #2]
	add lr, r2, #6
	add sl, r7, #4
	strh fp, [r2, #2]
	ldrh fp, [sb]
	add sb, r1, #6
	add r4, r4, #6
	strh fp, [r2, #4]
	ldrh r2, [r7]
	strh r2, [r1]
	ldrh r2, [r7, #2]
	add r7, r7, #6
	strh r2, [r1, #2]
	ldrh r2, [sl]
	strh r2, [r1, #4]
	add r1, sp, #0x18
	str lr, [r1, r8, lsl #2]
	add r1, sp, #0xc
	str sb, [r1, r8, lsl #2]
	add r8, r8, #1
	cmp r8, #3
	blt _022EEF0C
	add ip, ip, #1
_022EEF84:
	cmp ip, #0xc
	blt _022EEEE8
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0x80
	str r1, [sp, #4]
	blt _022EEDD0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EED98

	arm_func_start ov11_022EEFC0
ov11_022EEFC0: ; 0x022EEFC0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x5c
	ldr r7, [r0, #0x48]
	ldr r6, [r0, #0x44]
	ldr r1, [r0, #0x28]
	add r5, r6, r7, lsl #6
	add r1, r1, r5, lsl #1
	ldr r4, [r0, #0x24]
	ldr r2, [r0, #8]
	str r1, [sp, #8]
	sub r1, r2, r6
	str r1, [sp]
	mov r1, #0
	ldr r3, [r0, #0xc]
	add fp, r4, r5, lsl #1
	sub r5, r3, r7
	mov lr, #2
	str r1, [sp, #4]
_022EF008:
	cmp r5, #0
	ldr r6, [sp]
	movgt r1, fp
	ldrgt r2, [sp, #8]
	subgt r5, r5, #1
	bgt _022EF044
	ldr r3, [r0, #0x44]
	ldr r1, [r0, #0x24]
	ldr r2, [r0, #0x28]
	add r1, r1, r3, lsl #1
	str r1, [sp, #8]
	add fp, r2, r3, lsl #1
	ldr r5, [r0, #0xc]
	ldr r2, [sp, #8]
	mov r1, fp
_022EF044:
	ldr r4, [r0, #0x2c]
	ldr r7, [r0, #0x30]
	mov r3, #0
	add sl, sp, #0x50
	add r8, sp, #0x44
_022EF058:
	add sb, r4, lr, lsl #1
	str sb, [sl, r3, lsl #2]
	add sb, r7, lr, lsl #1
	str sb, [r8, r3, lsl #2]
	add lr, lr, #0x20
	add r3, r3, #1
	cmp r3, #3
	blt _022EF058
	mov r4, #0
_022EF07C:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF0A0:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x2c]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0xc]
	add sl, r8, #4
	str sl, [sp, #0x10]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x2c]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x30]
	add sl, ip, #6
	str sl, [sp, #0x14]
	ldr sl, [sp, #0x30]
	strh sl, [ip, #2]
	ldr sl, [sp, #0xc]
	ldrh sl, [sl]
	str sl, [sp, #0x34]
	add sl, r3, #6
	str sl, [sp, #0x18]
	ldr sl, [sp, #0x34]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x10]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x14]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x18]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF0A0
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
	cmp r4, #0xa
	blt _022EF07C
	mov r7, #0
	add r3, sp, #0x50
	add sb, sp, #0x44
_022EF178:
	ldr sl, [r3, r7, lsl #2]
	ldr r8, [sb, r7, lsl #2]
	add sl, sl, #0x7c0
	str sl, [r3, r7, lsl #2]
	add r8, r8, #0x7c0
	str r8, [sb, r7, lsl #2]
	add r7, r7, #1
	cmp r7, #3
	blt _022EF178
	b _022EF288
_022EF1A0:
	ldrh r7, [r1], #2
	ldrh r3, [r2], #2
	ldr sb, [r0, #0x1c]
	add r7, r7, r7, lsl #3
	add r7, sb, r7, lsl #1
	ldr r8, [r0, #0x20]
	add r3, r3, r3, lsl #3
	add r8, r8, r3, lsl #1
	mov sb, #0
_022EF1C4:
	ldrh sl, [r7]
	add r3, sp, #0x50
	ldr ip, [r3, sb, lsl #2]
	str sl, [sp, #0x38]
	add sl, r7, #4
	add r3, sp, #0x44
	str sl, [sp, #0x1c]
	add sl, r8, #4
	str sl, [sp, #0x20]
	ldr r3, [r3, sb, lsl #2]
	ldr sl, [sp, #0x38]
	strh sl, [ip]
	ldrh sl, [r7, #2]
	add r7, r7, #6
	str sl, [sp, #0x3c]
	add sl, ip, #6
	str sl, [sp, #0x24]
	ldr sl, [sp, #0x3c]
	strh sl, [ip, #2]
	ldr sl, [sp, #0x1c]
	ldrh sl, [sl]
	str sl, [sp, #0x40]
	add sl, r3, #6
	str sl, [sp, #0x28]
	ldr sl, [sp, #0x40]
	strh sl, [ip, #4]
	ldrh sl, [r8]
	strh sl, [r3]
	ldrh sl, [r8, #2]
	add r8, r8, #6
	strh sl, [r3, #2]
	ldr sl, [sp, #0x20]
	ldrh sl, [sl]
	strh sl, [r3, #4]
	ldr sl, [sp, #0x24]
	add r3, sp, #0x50
	str sl, [r3, sb, lsl #2]
	ldr sl, [sp, #0x28]
	add r3, sp, #0x44
	str sl, [r3, sb, lsl #2]
	add sb, sb, #1
	cmp sb, #3
	blt _022EF1C4
	sub r6, r6, #1
	cmp r6, #0
	ldrle r6, [r0, #8]
	add r4, r4, #1
	suble r1, r1, r6, lsl #1
	suble r2, r2, r6, lsl #1
_022EF288:
	cmp r4, #0xc
	blt _022EF1A0
	ldr r1, [sp, #4]
	add fp, fp, #0x80
	add r1, r1, #1
	str r1, [sp, #4]
	cmp r1, #9
	ldr r1, [sp, #8]
	add r1, r1, #0x80
	str r1, [sp, #8]
	blt _022EF008
	add sp, sp, #0x5c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022EEFC0

	arm_func_start ov11_022EF2BC
ov11_022EF2BC: ; 0x022EF2BC
	add r0, r0, r1, lsl #3
	ldr r1, [r0, #0x200]
	ldr r0, [r0, #0x204]
	str r1, [r2]
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2BC

	arm_func_start ov11_022EF2D4
ov11_022EF2D4: ; 0x022EF2D4
	ldr r3, [r2]
	ldr r2, [r2, #4]
	add r0, r0, r1, lsl #3
	str r3, [r0, #0x200]
	str r2, [r0, #0x204]
	bx lr
	arm_func_end ov11_022EF2D4

	arm_func_start ov11_022EF2EC
ov11_022EF2EC: ; 0x022EF2EC
	add r3, r0, #0x210
	mov r0, #0x54
	ldr ip, [r2]
	mla r0, r1, r0, r3
	cmp ip, #0
	bge _022EF334
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF328
_022EF310:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	adds r1, r3, r1
	str r1, [r2]
	bmi _022EF310
	b _022EF380
_022EF328:
	mov r1, #0
	str r1, [r2]
	b _022EF380
_022EF334:
	ldr r3, [r0, #0x10]
	cmp ip, r3
	blt _022EF380
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF36C
_022EF34C:
	ldr r3, [r2]
	ldr r1, [r0, #0x10]
	sub r3, r3, r1
	str r3, [r2]
	ldr r1, [r0, #0x10]
	cmp r3, r1
	bge _022EF34C
	b _022EF380
_022EF36C:
	cmp r3, #0
	subgt r1, r3, #1
	strgt r1, [r2]
	movle r1, #0
	strle r1, [r2]
_022EF380:
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _022EF3BC
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3B0
_022EF398:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	adds r1, r3, r1
	str r1, [r2, #4]
	bmi _022EF398
	bx lr
_022EF3B0:
	mov r0, #0
	str r0, [r2, #4]
	bx lr
_022EF3BC:
	ldr r3, [r0, #0x14]
	cmp r1, r3
	bxlt lr
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _022EF3F4
_022EF3D4:
	ldr r3, [r2, #4]
	ldr r1, [r0, #0x14]
	sub r3, r3, r1
	str r3, [r2, #4]
	ldr r1, [r0, #0x14]
	cmp r3, r1
	bge _022EF3D4
	bx lr
_022EF3F4:
	cmp r3, #0
	subgt r0, r3, #1
	strgt r0, [r2, #4]
	movle r0, #0
	strle r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF2EC

	arm_func_start ov11_022EF40C
ov11_022EF40C: ; 0x022EF40C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	add r5, sp, #0
	mov r4, #1
	b _022EF484
_022EF430:
	add r0, r8, r6, lsl #3
	ldr r3, [r0, #0x200]
	ldr ip, [r0, #0x204]
	mov r0, sb
	str r3, [sp]
	str ip, [sp, #4]
	ldr r2, [r7]
	mov r1, r4
	add r2, r3, r2
	str r2, [sp]
	ldr r3, [r7, #4]
	mov r2, r5
	add r3, ip, r3
	str r3, [sp, #4]
	bl ov11_022EF2EC
	add r2, sb, r6, lsl #3
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r6, r6, #1
	str r1, [r2, #0x200]
	str r0, [r2, #0x204]
_022EF484:
	ldr r0, [sb, #0x1fc]
	cmp r6, r0
	blt _022EF430
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022EF40C

	arm_func_start ov11_022EF498
ov11_022EF498: ; 0x022EF498
	mov r3, #0
	str r3, [r1]
	str r3, [r1, #4]
	ldrb r1, [r0, #0x1e0]
	mov r1, r1, lsl #0xb
	str r1, [r2]
	ldrb r0, [r0, #0x1e1]
	mov r0, r0, lsl #0xb
	str r0, [r2, #4]
	bx lr
	arm_func_end ov11_022EF498

	arm_func_start ov11_022EF4C0
ov11_022EF4C0: ; 0x022EF4C0
	stmdb sp!, {r4, lr}
	ldr lr, [r0, #0x2d8]
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr ip, [r2]
	ldr r0, [r2, #4]
	ldr r4, [r3, #4]
	add r0, ip, r0, lsl #8
	add r0, r0, #5
	add r0, r0, #0x400
	add r2, lr, r0
	b _022EF52C
_022EF4F4:
	mov lr, r2
	ldr ip, [r3]
	b _022EF51C
_022EF500:
	ldrb r0, [lr], #1
	and r0, r0, r1
	and r0, r0, #0xff
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	sub ip, ip, #1
_022EF51C:
	cmp ip, #0
	bgt _022EF500
	add r2, r2, #0x100
	sub r4, r4, #1
_022EF52C:
	cmp r4, #0
	bgt _022EF4F4
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF4C0

	arm_func_start ov11_022EF53C
ov11_022EF53C: ; 0x022EF53C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r1, r4
	mov r0, #2
	bl sub_020091B0
	mov r1, r4
	mov r0, #3
	bl sub_020091B0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022EF53C

	arm_func_start ov11_022EF594
ov11_022EF594: ; 0x022EF594
	stmdb sp!, {r3, lr}
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	ldmia sp!, {r3, pc}
_022EF5A4: ; jump table
	b _022EF5F4 ; case 0
	b _022EF604 ; case 1
	b _022EF610 ; case 2
	b _022EF61C ; case 3
	b _022EF634 ; case 4
	b _022EF628 ; case 5
	b _022EF640 ; case 6
	b _022EF64C ; case 7
	b _022EF664 ; case 8
	b _022EF658 ; case 9
	b _022EF670 ; case 10
	b _022EF67C ; case 11
	b _022EF688 ; case 12
	b _022EF694 ; case 13
	b _022EF6A0 ; case 14
	b _022EF6AC ; case 15
	b _022EF6C0 ; case 16
	b _022EF6D4 ; case 17
	b _022EF6E4 ; case 18
	b _022EF6F0 ; case 19
_022EF5F4:
	mov r1, #3
	mov r2, #0
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF604:
	mov r1, #1
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF610:
	mov r1, #2
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF61C:
	mov r1, #3
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF628:
	mov r1, #3
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF634:
	mov r1, #4
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF640:
	mov r1, #4
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF64C:
	mov r1, #6
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF658:
	mov r1, #6
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF664:
	mov r1, #7
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF670:
	mov r1, #7
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF67C:
	mov r1, #5
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF688:
	mov r1, #5
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF694:
	mov r1, #8
	bl ov11_022E9DE4
	ldmia sp!, {r3, pc}
_022EF6A0:
	mov r1, #8
	bl ov11_022E9E2C
	ldmia sp!, {r3, pc}
_022EF6AC:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #5
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6C0:
	mov r1, r2, lsl #0x10
	mov r2, r1, asr #0x10
	mov r1, #8
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
_022EF6D4:
	mov r1, r2
	mov r0, #1
	bl ov11_022F2B00
	ldmia sp!, {r3, pc}
_022EF6E4:
	mov r1, #9
	bl ov11_022E9E74
	ldmia sp!, {r3, pc}
_022EF6F0:
	mov r1, #0xa
	mov r2, #0
	bl ov11_022E9EBC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022EF594

	arm_func_start ov11_022EF700
ov11_022EF700: ; 0x022EF700
	ldr ip, _022EF708 ; =ov11_022E9FA4
	bx ip
	.align 2, 0
_022EF708: .word ov11_022E9FA4
	arm_func_end ov11_022EF700

	arm_func_start ov11_022EF70C
ov11_022EF70C: ; 0x022EF70C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sl, r0
	ldrsh r0, [sl]
	sub r0, r0, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #2
	bhi _022EF800
	add r6, sl, #0x210
	mov r8, #0
	add r4, sl, #0x200
	ldr r5, _022EFB64 ; =ov11_02324CBC
	mov fp, #0x1c
	b _022EF7BC
_022EF750:
	ldr r1, _022EFB68 ; =ov11_02320C10
	mov r0, r6
	bl ov11_022EE9B0
	ldrsh r1, [r6, #2]
	ldrsh r0, [r4, #0xbe]
	mov sb, #0
	add r7, r1, r0
	b _022EF7A8
_022EF770:
	ldrb r0, [sl, #0x2bc]
	add r1, r6, #0x4c
	cmp r0, #0
	ldr r0, [r5]
	bne _022EF790
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EF7A0
_022EF790:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EF7A0:
	add sb, sb, #1
	add r7, r7, #1
_022EF7A8:
	ldrsh r0, [r6, #4]
	cmp sb, r0
	blt _022EF770
	add r8, r8, #1
	add r6, r6, #0x54
_022EF7BC:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EF750
	mov r0, #0
	strb r0, [sl, #0x1c1]
	ldrsh r0, [sl]
	cmp r0, #6
	ldreqb r0, [sl, #0x1c0]
	cmpeq r0, #0
	bne _022EF7F4
	bl sub_020163AC
	cmp r0, #1
	moveq r0, #1
	streqb r0, [sl, #0x1c1]
_022EF7F4:
	mov r0, #1
	strb r0, [sl, #0x2ba]
	b _022EFB5C
_022EF800:
	add fp, sl, #0x100
	ldrsh r1, [fp, #0xbe]
	mvn r0, #0
	cmp r1, r0
	beq _022EFB5C
	ldrsh r0, [fp, #0xec]
	cmp r0, #0
	beq _022EF9C4
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EF9C4
	add r0, sl, #0x200
	ldrsh r1, [r0, #0xc2]
	str r0, [sp, #0xc]
	ldr r0, _022EFB64 ; =ov11_02324CBC
	ldrb r2, [sl, #0x2bc]
	ldr r3, [r0]
	mov sb, #0
	mov r0, #0x28
	str sb, [sp, #8]
	smulbb r4, r2, r0
	mov r1, r1, lsl #0x14
	ldrb r0, [sl, #0x1f9]
	ldr r7, [sl, #0x1f4]
	add r5, r3, #0x98
	add r6, sl, #4
	mov r8, r1, lsr #0x10
	str r0, [sp, #4]
	b _022EF974
_022EF874:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _022EF95C
	ldrsh r0, [r6, #2]
	sub r0, r0, #1
	strh r0, [r6, #2]
	ldrsh r0, [r6, #2]
	cmp r0, #0
	bgt _022EF954
	ldrsh r0, [r6]
	sub r0, r0, #1
	strh r0, [r6]
	ldrsh r0, [r6]
	cmp r0, #0
	bgt _022EF8F4
	ldrb r0, [sl, #0x1f9]
	cmp r0, #0
	beq _022EF8D8
	ldrsh r0, [r7]
	strh r0, [r6, #2]
	ldrsh r0, [r7, #2]
	strh r0, [r6]
	ldr r0, [r6, #4]
	str r0, [r6, #8]
	b _022EF904
_022EF8D8:
	mov r0, #0
	strh r0, [r6]
	mov r0, r0
	strh r0, [r6, #2]
	mov r0, #0
	str r0, [r6, #8]
	b _022EF904
_022EF8F4:
	ldrsh r1, [r7]
	mov r0, #1
	str r0, [sp, #4]
	strh r1, [r6, #2]
_022EF904:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _022EF95C
	mov r0, #1
	str r0, [sp, #8]
	ldr r2, _022EFB6C ; =ov11_02320BF4
	add r0, r5, r4
	mov r1, r8
	bl CopyColorToPaletteDataRgba
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	ldr r2, [r6, #8]
	add r0, r5, r4
	mov r1, r1, lsr #0x10
	mov r3, #0xf
	bl FillPaletteDataRgba
	ldr r0, [r6, #8]
	add r0, r0, #0x3c
	str r0, [r6, #8]
	b _022EF95C
_022EF954:
	mov r0, #1
	str r0, [sp, #4]
_022EF95C:
	add sb, sb, #1
	add r6, r6, #0xc
	add r7, r7, #4
	add r0, r8, #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
_022EF974:
	ldrsh r0, [fp, #0xea]
	cmp sb, r0
	ldrlt r0, [sp, #0xc]
	ldrltsh r0, [r0, #0xc4]
	cmplt sb, r0
	blt _022EF874
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022EF9A0
	add r0, r5, r4
	bl MarkPaletteDataAsNeedingUpdate
_022EF9A0:
	ldrb r0, [sl, #0x1f8]
	strb r0, [sl, #0x1f9]
	ldrb r0, [sl, #0x1f8]
	cmp r0, #0
	movne r0, #0
	strneb r0, [sl, #0x1fb]
	ldreq r0, [sp, #4]
	streqb r0, [sl, #0x1fb]
	b _022EF9CC
_022EF9C4:
	mov r0, #0
	strb r0, [sl, #0x1fb]
_022EF9CC:
	ldrb r0, [sl, #0x1bc]
	cmp r0, #0
	beq _022EF9F0
	mov r1, #0
	add r0, sl, #0x1a0
	mov r2, #0xa0
	mov r3, #0x20
	str r1, [sp]
	bl sub_02063830
_022EF9F0:
	ldrb r0, [sl, #0x1ee]
	cmp r0, #0
	bne _022EFAA4
	mov r1, #0
	add r0, sl, #0xc4
	mov r6, r1
	mov r5, #1
	mov r3, #0x2c
_022EFA10:
	mul r2, r1, r3
	ldrb r4, [r0, r2]
	add r2, r0, r2
	cmp r4, #0
	beq _022EFA98
	ldrsh r7, [r2, #4]
	sub r4, r7, #1
	strh r4, [r2, #4]
	cmp r7, #0
	bgt _022EFA98
	ldr r4, [r2, #0x18]
	add r4, r4, #4
	str r4, [r2, #0x18]
	ldr r4, [r2, #0x28]
	ldr r7, [r2, #0x20]
	bic r4, r4, #1
	add r4, r7, r4
	str r4, [r2, #0x20]
	ldrsh r4, [r2, #2]
	add r4, r4, #1
	strh r4, [r2, #2]
	ldr r4, [r2, #0x10]
	ldrsh r7, [r2, #2]
	ldrsh r4, [r4, #2]
	cmp r7, r4
	ldrge r4, [r2, #0x14]
	strge r4, [r2, #0x18]
	ldrge r4, [r2, #0x1c]
	strge r4, [r2, #0x20]
	strgeh r6, [r2, #2]
	strb r5, [r2, #1]
	ldr r4, [r2, #0x18]
	ldr r4, [r4]
	strh r4, [r2, #4]
_022EFA98:
	add r1, r1, #1
	cmp r1, #4
	blt _022EFA10
_022EFAA4:
	ldrb r0, [sl, #0x1c0]
	cmp r0, #0
	bne _022EFB5C
	add r5, sl, #0x210
	add r6, sl, #0x200
	mov r8, #0
	b _022EFB48
_022EFAC0:
	mov r0, r5
	mov r1, r6
	bl ov11_022EE9B0
	ldr r1, [r5, #0x18]
	mov r0, r5
	blx r1
	add r0, sl, #0x200
	ldrsh r1, [r5, #2]
	ldrsh r0, [r0, #0xbe]
	mov sb, #0
	ldr r4, _022EFB64 ; =ov11_02324CBC
	add r7, r1, r0
	mov fp, #0x1c
	b _022EFB30
_022EFAF8:
	ldrb r0, [sl, #0x2bc]
	add r1, r5, #0x4c
	cmp r0, #0
	ldr r0, [r4]
	bne _022EFB18
	mla r0, r7, fp, r0
	bl sub_0200B3C0
	b _022EFB28
_022EFB18:
	add r2, r0, #0x38
	mov r0, #0x1c
	mla r0, r7, r0, r2
	bl sub_0200B3C0
_022EFB28:
	add sb, sb, #1
	add r7, r7, #1
_022EFB30:
	ldrsh r0, [r5, #4]
	cmp sb, r0
	blt _022EFAF8
	add r8, r8, #1
	add r5, r5, #0x54
	add r6, r6, #8
_022EFB48:
	ldr r0, [sl, #0x1fc]
	cmp r8, r0
	blt _022EFAC0
	mov r0, #1
	strb r0, [sl, #0x2ba]
_022EFB5C:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022EFB64: .word ov11_02324CBC
_022EFB68: .word ov11_02320C10
_022EFB6C: .word ov11_02320BF4
	arm_func_end ov11_022EF70C

	arm_func_start ov11_022EFB70
ov11_022EFB70: ; 0x022EFB70
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, r0
	ldrsh r0, [r7]
	cmp r0, #4
	cmpne r0, #5
	cmpne r0, #6
	beq _022EFBD4
	mov r5, #0
	add r4, r7, #0xc4
	mov sl, r5
	mov sb, #1
	mov r8, #0x2c
_022EFBA0:
	mla r6, r5, r8, r4
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _022EFBC8
	ldr r0, [r6, #0x24]
	ldr r1, [r6, #0x20]
	ldr r2, [r6, #0x28]
	bl Memcpy32
	strb sl, [r6, #1]
	strb sb, [r7, #0x2ba]
_022EFBC8:
	add r5, r5, #1
	cmp r5, #4
	blt _022EFBA0
_022EFBD4:
	ldrb r0, [r7, #0x2ba]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	add sb, r7, #0x200
	ldrsh r0, [sb, #0xc0]
	ldrsh r4, [sb, #0xbe]
	mov r5, #0
	cmp r0, #0
	ble _022EFC44
	mov r6, #0x1c
	ldr sl, _022EFC50 ; =ov11_02324CBC
	mov r8, r6
	b _022EFC38
_022EFC08:
	ldrb r0, [r7, #0x2bc]
	cmp r0, #0
	ldr r0, [sl]
	bne _022EFC24
	mla r0, r4, r8, r0
	bl sub_0200B330
	b _022EFC30
_022EFC24:
	add r0, r0, #0x38
	mla r0, r4, r6, r0
	bl sub_0200B330
_022EFC30:
	add r5, r5, #1
	add r4, r4, #1
_022EFC38:
	ldrsh r0, [sb, #0xc0]
	cmp r5, r0
	blt _022EFC08
_022EFC44:
	mov r0, #0
	strb r0, [r7, #0x2ba]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022EFC50: .word ov11_02324CBC
	arm_func_end ov11_022EFB70

	arm_func_start ov11_022EFC54
ov11_022EFC54: ; 0x022EFC54
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov10_022BF864
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x98
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0xc0
	bl sub_0200A510
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A180
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B33C
	ldr r0, _022EFCE0 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B33C
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFCE0: .word ov11_02324CBC
	arm_func_end ov11_022EFC54

	arm_func_start ov11_022EFCE4
ov11_022EFCE4: ; 0x022EFCE4
	stmdb sp!, {r3, lr}
	mov r0, #8
	bl sub_0200302C
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x70
	bl sub_0200A184
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x84
	bl sub_0200A184
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x1c
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x38
	bl sub_0200B340
	ldr r0, _022EFD58 ; =ov11_02324CBC
	ldr r0, [r0]
	add r0, r0, #0x54
	bl sub_0200B340
	mov r0, #8
	bl sub_020030FC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022EFD58: .word ov11_02324CBC
	arm_func_end ov11_022EFCE4

	arm_func_start ov11_022EFD5C
ov11_022EFD5C: ; 0x022EFD5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldrb r1, [r5, #0x2bc]
	mov r2, #0
	str r5, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
	str r2, [r0, #0x18]
#if defined(EUROPE)
	cmp r1, #0
	add r0, r5, #0x100
	ldrsh r1, [r0, #0xbe]
	moveq r3, #0
	movne r3, #1
	ldr r0, _022F0D74 ; =0x0000017B
	and r4, r3, #0xff
	cmp r1, r0
	bgt _022F085C
	bge _022F0028
	sub r3, r0, #0x4d
	cmp r1, r3
	bgt _022F07A8
	bge _022F0038
	cmp r1, #0xdc
	bgt _022F0730
	bge _022EFFF4
	cmp r1, #0x85
	bgt _022F0724
	bge _022EFFF4
	cmp r1, #8
	beq _022F0008
	b _022F03A8
_022F0724:
	cmp r1, #0xd4
	beq _022EFFF4
	b _022F03A8
_022F0730:
	cmp r1, #0x10c
	bgt _022F0760
	bge _022F03B0
	cmp r1, #0xf5
	bgt _022F03A8
	cmp r1, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r1, #0xf4
	cmpne r1, #0xf5
	beq _022F0028
	b _022F03A8
_022F0760:
	sub r3, r0, #0x6a
	cmp r1, r3
	bgt _022F077C
	sub r0, r0, #0x6a
	cmp r1, r0
	beq _022F0114
	b _022F03A8
_022F077C:
	sub r3, r0, #0x68
	cmp r1, r3
	bgt _022F03A8
	sub r3, r0, #0x69
	cmp r1, r3
	blt _022F03A8
	beq _022EFFF4
	sub r0, r0, #0x68
	cmp r1, r0
	beq _022F038C
	b _022F03A8
_022F07A8:
	sub r3, r0, #0x19
	cmp r1, r3
	bgt _022F081C
	bge _022F0064
	cmp r1, #0x130
	bgt _022F07D4
	bge _022F0054
	sub r0, r0, #0x4c
	cmp r1, r0
	beq _022F0054
	b _022F03A8
_022F07D4:
	sub r0, r0, #0x4a
	sub r0, r1, r0
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022F07E8: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022F081C:
	ldr r0, _022F0D78 ; =0x0000016B
	cmp r1, r0
	bgt _022F083C
	bge _022F00BC
	sub r0, r0, #8
	cmp r1, r0
	beq _022F0008
	b _022F03A8
_022F083C:
	cmp r1, #0x16c
	bgt _022F084C
	beq _022F0114
	b _022F03A8
_022F084C:
	add r0, r0, #0xb
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F085C:
	add r3, r0, #0x3a
	cmp r1, r3
	bgt _022F08F0
	mov r2, r3
	cmp r1, r2
	bge _022EFFF4
	add r2, r0, #0x18
	cmp r1, r2
	bgt _022F08AC
	bge _022EFFF4
	cmp r1, #0x184
	bgt _022F089C
	bge _022EFFF4
	cmp r1, #0x17c
	beq _022F0028
	b _022F03A8
_022F089C:
	add r0, r0, #0x13
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F08AC:
	add r2, r0, #0x26
	cmp r1, r2
	bgt _022F08D0
	add r0, r0, #0x26
	cmp r1, r0
	bge _022EFFF4
	cmp r1, #0x19c
	beq _022F0018
	b _022F03A8
_022F08D0:
	cmp r1, #0x1b0
	bgt _022F08E0
	beq _022F0038
	b _022F03A8
_022F08E0:
	add r0, r0, #0x36
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F08F0:
	add r3, r0, #0x53
	cmp r1, r3
	bgt _022F0944
	mov r2, r3
	cmp r1, r2
	bge _022F0244
	cmp r1, #0x1bc
	bgt _022F0924
	bge _022F0038
	add r0, r0, #0x40
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F0924:
	cmp r1, #0x1cc
	bgt _022F0934
	beq _022F01D0
	b _022F03A8
_022F0934:
	add r0, r0, #0x52
	cmp r1, r0
	beq _022F01D0
	b _022F03A8
_022F0944:
	cmp r1, #0x1d0
	bgt _022F0960
	bge _022F0244
	add r0, r0, #0x54
	cmp r1, r0
	beq _022F0228
	b _022F03A8
_022F0960:
	add r3, r0, #0x57
	cmp r1, r3
	bgt _022F097C
	add r0, r0, #0x57
	cmp r1, r0
	beq _022F02A4
	b _022F03A8
_022F097C:
	add r3, r0, #0x5b
	cmp r1, r3
	bgt _022F03A8
	add r3, r0, #0x58
	cmp r1, r3
	blt _022F03A8
	beq _022F0304
	cmp r1, #0x1d4
	beq _022F0314
	add r0, r0, #0x5b
	cmp r1, r0
	beq _022F032C
	b _022F03A8
#elif defined(JAPAN)
	cmp r1, #0
	add r0, r5, #0x100
	ldrsh r1, [r0, #0xbe]
	moveq r3, #0
	movne r3, #1
	ldr r0, _022F1A08 ; =0x00000165
	and r4, r3, #0xff
	cmp r1, r0
	bgt _022F1524
	bge _022F0114
	sub r3, r0, #0x52
	cmp r1, r3
	bgt _022F1480
	sub r3, r0, #0x53
	cmp r1, r3
	blt _022F1410_JP
	beq _022EFFF4
	sub r0, r0, #0x52
	cmp r1, r0
	beq _022F038C
	b _022F03A8
_022F1410_JP:
	cmp r1, #0xdc
	bgt _022F1440
	bge _022EFFF4
	cmp r1, #0x85
	bgt _022F1434
	bge _022EFFF4
	cmp r1, #8
	beq _022F0008
	b _022F03A8
_022F1434:
	cmp r1, #0xd4
	beq _022EFFF4
	b _022F03A8
_022F1440:
	cmp r1, #0x10c
	bgt _022F1470
	bge _022F03B0
	cmp r1, #0xf5
	bgt _022F03A8
	cmp r1, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r1, #0xf4
	cmpne r1, #0xf5
	beq _022F0028
	b _022F03A8
_022F1470:
	sub r0, r0, #0x54
	cmp r1, r0
	beq _022F0114
	b _022F03A8
_022F1480:
	sub r3, r0, #0x2f
	cmp r1, r3
	bgt _022F14FC
	sub r0, r0, #0x3b
	subs r0, r1, r0
	addpl pc, pc, r0, lsl #2
	b _022F14D0
_022F149C: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022F14D0:
	cmp r1, #0x128
	bgt _022F14EC
	bge _022F0054
	ldr r0, _022F1A0C_JP ; =0x00000127
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F14EC:
	ldr r0, _022F1A10 ; =0x00000129
	cmp r1, r0
	beq _022F0054
	b _022F03A8
_022F14FC:
	cmp r1, #0x15c
	bgt _022F1518
	bge _022F0008
	sub r0, r0, #0xa
	cmp r1, r0
	beq _022F0064
	b _022F03A8
_022F1518:
	cmp r1, #0x164
	beq _022F00BC
	b _022F03A8
_022F1524:
	add r3, r0, #0x35
	cmp r1, r3
	bgt _022F15A4
	mov r2, r3
	cmp r1, r2
	bge _022EFFF4
	add r2, r0, #0x18
	cmp r1, r2
	bgt _022F1578
	bge _022EFFF4
	cmp r1, #0x174
	bgt _022F1568
	bge _022F0028
	add r0, r0, #0xa
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1568:
	add r0, r0, #0x10
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1578:
	cmp r1, #0x18c
	bgt _022F1594
	bge _022EFFF4
	add r0, r0, #0x22
	cmp r1, r0
	beq _022F0028
	b _022F03A8
_022F1594:
	add r0, r0, #0x30
	cmp r1, r0
	beq _022F0018
	b _022F03A8
_022F15A4:
	cmp r1, #0x1b0
	bgt _022F15E0
	bge _022F0038
	add r2, r0, #0x41
	cmp r1, r2
	bgt _022F15D0
	bge _022F0038
	add r0, r0, #0x40
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F15D0:
	add r0, r0, #0x45
	cmp r1, r0
	beq _022EFFF4
	b _022F03A8
_022F15E0:
	add r3, r0, #0x50
	cmp r1, r3
	bgt _022F1608
	mov r2, r3
	cmp r1, r2
	bge _022F01D0
	add r0, r0, #0x4c
	cmp r1, r0
	beq _022F0038
	b _022F03A8
_022F1608:
	add r0, r0, #0x51
	sub r0, r1, r0
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022F161C: ; jump table
	b _022F01D0 ; case 0
	b _022F0244 ; case 1
	b _022F0228 ; case 2
	b _022F0244 ; case 3
	b _022F03A8 ; case 4
	b _022F02A4 ; case 5
	b _022F0304 ; case 6
	b _022F0314 ; case 7
	b _022F03A8 ; case 8
	b _022F032C ; case 9
#else
	add r0, r5, #0x100
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	ldrsh r0, [r0, #0xbe]
	and r4, r1, #0xff
	cmp r0, #0x160
	bgt _022EFEF0
	bge _022F0114
	ldr r3, _022F03B8 ; =0x00000113
	cmp r0, r3
	bgt _022EFE44
	sub r1, r3, #1
	cmp r0, r1
	blt _022EFDD4
	beq _022EFFF4
	cmp r0, r3
	beq _022F038C
	b _022F03A8
_022EFDD4:
	cmp r0, #0xdc
	bgt _022EFE04
	bge _022EFFF4
	cmp r0, #0x85
	bgt _022EFDF8
	bge _022EFFF4
	cmp r0, #8
	beq _022F0008
	b _022F03A8
_022EFDF8:
	cmp r0, #0xd4
	beq _022EFFF4
	b _022F03A8
_022EFE04:
	cmp r0, #0x10c
	bgt _022EFE34
	bge _022F03B0
	cmp r0, #0xf5
	bgt _022F03A8
	cmp r0, #0xf3
	blt _022F03A8
	beq _022F0064
	cmp r0, #0xf4
	cmpne r0, #0xf5
	beq _022F0028
	b _022F03A8
_022EFE34:
	sub r1, r3, #2
	cmp r0, r1
	beq _022F0114
	b _022F03A8
_022EFE44:
	add r1, r3, #0x1e
	cmp r0, r1
	bgt _022EFEC0
	add r1, r3, #0x12
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022EFE94
_022EFE60: ; jump table
	b _022F0048 ; case 0
	b _022F0038 ; case 1
	b _022F03A8 ; case 2
	b _022F03A8 ; case 3
	b _022F0054 ; case 4
	b _022F03A8 ; case 5
	b _022F03A8 ; case 6
	b _022F03A8 ; case 7
	b _022F03A8 ; case 8
	b _022F03A8 ; case 9
	b _022F03A8 ; case 10
	b _022F03A8 ; case 11
	b _022F016C ; case 12
_022EFE94:
	ldr r1, _022F03BC ; =0x00000123
	cmp r0, r1
	bgt _022EFEB4
	bge _022F0054
	sub r1, r1, #1
	cmp r0, r1
	beq _022F0038
	b _022F03A8
_022EFEB4:
	cmp r0, #0x124
	beq _022F0054
	b _022F03A8
_022EFEC0:
	add r1, r3, #0x44
	cmp r0, r1
	bgt _022EFEE0
	bge _022F0008
	add r1, r3, #0x43
	cmp r0, r1
	beq _022F0064
	b _022F03A8
_022EFEE0:
	add r1, r3, #0x4c
	cmp r0, r1
	beq _022F00BC
	b _022F03A8
_022EFEF0:
	ldr r3, _022F03C0 ; =0x00000195
	cmp r0, r3
	bgt _022EFF64
	bge _022EFFF4
	cmp r0, #0x178
	bgt _022EFF38
	bge _022EFFF4
	sub r1, r3, #0x26
	cmp r0, r1
	bgt _022EFF2C
	bge _022F0028
	sub r1, r3, #0x2b
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF2C:
	cmp r0, #0x170
	beq _022F0028
	b _022F03A8
_022EFF38:
	sub r1, r3, #0xe
	cmp r0, r1
	bgt _022EFF58
	bge _022EFFF4
	sub r1, r3, #0x13
	cmp r0, r1
	beq _022F0028
	b _022F03A8
_022EFF58:
	cmp r0, #0x190
	beq _022F0018
	b _022F03A8
_022EFF64:
	add r1, r3, #0x16
	cmp r0, r1
	bgt _022EFFA0
	bge _022F0038
	add r1, r3, #0xc
	cmp r0, r1
	bgt _022EFF90
	bge _022F0038
	cmp r0, #0x1a0
	beq _022F0038
	b _022F03A8
_022EFF90:
	add r1, r3, #0x10
	cmp r0, r1
	beq _022EFFF4
	b _022F03A8
_022EFFA0:
	cmp r0, #0x1b0
	bgt _022EFFB8
	bge _022F01D0
	cmp r0, #0x1ac
	beq _022F0038
	b _022F03A8
_022EFFB8:
	add r1, r3, #0x1c
	sub r0, r0, r1
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F03A8
_022EFFCC: ; jump table
	b _022F01D0 ; case 0
	b _022F0244 ; case 1
	b _022F0228 ; case 2
	b _022F0244 ; case 3
	b _022F03A8 ; case 4
	b _022F02A4 ; case 5
	b _022F0304 ; case 6
	b _022F0314 ; case 7
	b _022F03A8 ; case 8
	b _022F032C ; case 9
#endif
_022EFFF4:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl ov11_022EE5EC
	b _022F03B0
_022F0008:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	b _022F03B0
_022F0018:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0028:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0038:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	b _022F03B0
_022F0048:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
_022F0054:
	mov r0, r5
	mov r1, #4
	bl ov11_022EE620
	b _022F03B0
_022F0064:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x80
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F00BC:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F0114:
	mov r0, r5
	mov r1, #6
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x40
	mov r1, r0
	bl sub_020094C4
	b _022F03B0
_022F016C:
	mov r0, r5
	mov r1, #1
	bl ov11_022EE5EC
	mov r0, r5
	mov r1, #1
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0
	mov r1, #0x80
	bl sub_020094C4
	b _022F03B0
_022F01D0:
	mov r0, r5
	mov r1, #2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r2, r4
	mov r0, #2
	mov r1, #1
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #4
	mov r1, #2
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	b _022F03B0
_022F0228:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F0244:
	mov r0, r5
#ifdef EUROPE
	mov r1, #0
#else
	mov r1, r2
#endif
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
#ifdef EUROPE
	mov r2, r4
	mov r0, #4
	mov r1, #2
#else
	mov r0, #4
	mov r1, #2
	mov r2, r4
#endif
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #1
	bl ov11_022F294C
	b _022F03B0
_022F02A4:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x60
	mov r1, #0x18
	bl sub_020094C4
	mov r0, #2
	bl ov11_022F294C
	b _022F03B0
_022F0304:
	mov r0, r5
	mov r1, #3
	bl ov11_022EE620
	b _022F03B0
_022F0314:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, #0
	bl ov11_022F294C
	b _022F03B0
_022F032C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE620
	mov r0, r4
	bl sub_02009120
	mov r0, #2
	mov r1, r0
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #3
	mov r1, #2
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, r4
	bl sub_02009454
	mov r2, r4
	mov r0, #0x5a
	mov r1, #0x1e
	bl sub_020094C4
	mov r0, #3
	bl ov11_022F294C
	b _022F03B0
_022F038C:
	mov r0, r5
	mov r1, r2
	bl ov11_022EE5EC
	mov r1, r4
	mov r0, #2
	bl sub_02009194
	b _022F03B0
_022F03A8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_022F03B0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#if defined(EUROPE)
_022F0D74: .word 0x0000017B
_022F0D78: .word 0x0000016B
#elif defined(JAPAN)
_022F1A08: .word 0x00000165
_022F1A0C_JP: .word 0x00000127
_022F1A10: .word 0x00000129
#else
_022F03B8: .word 0x00000113
_022F03BC: .word 0x00000123
_022F03C0: .word 0x00000195
#endif
	arm_func_end ov11_022EFD5C

	arm_func_start ov11_022F03C4
ov11_022F03C4: ; 0x022F03C4
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	str r3, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	str r3, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	str r2, [r0, #0x14]
	str r1, [r0, #0x18]
	bx lr
	arm_func_end ov11_022F03C4

	arm_func_start ov11_022F03F8
ov11_022F03F8: ; 0x022F03F8
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #4]
	str r1, [r0, #8]
	bx lr
	arm_func_end ov11_022F03F8

	arm_func_start ov11_022F040C
ov11_022F040C: ; 0x022F040C
	ldr r3, [r1]
	ldr r2, [r1, #4]
	mov r1, #0
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ov11_022F040C

	arm_func_start ov11_022F042C
ov11_022F042C: ; 0x022F042C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r0
	ldr r4, [r6]
	ldr r0, _022F11D4 ; =0x0000016A
	add r2, r4, #0x100
	ldrsh r2, [r2, #0xbe]
	mov r5, r1
	cmp r2, r0
	bgt _022F054C
	bge _022F07FC
#if defined(EUROPE)
	sub r1, r0, #0x4c
	cmp r2, r1
#elif defined(JAPAN)
	cmp r2, #0x128
#else
	sub r1, r0, #0x47
	cmp r2, r1
#endif
	bgt _022F04D4
	bge _022F0C44
	cmp r2, #0x10c
	bgt _022F04A8
	bge _022F0FB4
	cmp r2, #8
	bgt _022F0484
	beq _022F0634
	b _022F11C0
_022F0484:
	cmp r2, #0xf5
	bgt _022F11C0
	cmp r2, #0xf3
	blt _022F11C0
	cmpne r2, #0xf4
	beq _022F07FC
	cmp r2, #0xf5
	beq _022F0AF0
	b _022F11C0
_022F04A8:
#if defined(EUROPE)
	sub r1, r0, #0x6a
#elif defined(JAPAN)
	sub r1, r0, #0x5e
#else
	sub r1, r0, #0x59
#endif
	cmp r2, r1
	bgt _022F04C4
#if defined(EUROPE)
	sub r0, r0, #0x6a
#elif defined(JAPAN)
	sub r0, r0, #0x5e
#else
	sub r0, r0, #0x59
#endif
	cmp r2, r0
	beq _022F0F04
	b _022F11C0
_022F04C4:
#ifdef EUROPE
	sub r0, r0, #0x4d
#else
	sub r0, r0, #0x48
#endif
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F04D4:
#if defined(EUROPE)
	sub r1, r0, #0x18
	cmp r2, r1
	bgt _022F0524
	bge _022F0634
	sub r0, r0, #0x46
	cmp r2, r0
	bgt _022F0514
	subs r0, r2, #0x130
#elif defined(JAPAN)
	cmp r2, #0x15c
	bgt _022F0524
	bge _022F0634
	sub r1, r0, #0x41
	cmp r2, r1
	bgt _022F0514
	sub r0, r0, #0x46
	subs r0, r2, r0
#else
	sub r1, r0, #0x13
	cmp r2, r1
	bgt _022F0524
	bge _022F0634
	sub r0, r0, #0x41
	cmp r2, r0
	bgt _022F0514
	subs r0, r2, #0x124
#endif
	addpl pc, pc, r0, lsl #2
	b _022F11C0
_022F04FC: ; jump table
	b _022F0C44 ; case 0
	b _022F0DA4 ; case 1
	b _022F0C44 ; case 2
	b _022F11C0 ; case 3
	b _022F11C0 ; case 4
	b _022F0DA4 ; case 5
_022F0514:
	ldr r0, _022F11D8 ; =0x00000156
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0524:
#if defined(EUROPE)
	cmp r2, #0x16c
	bgt _022F0540
	bge _022F0F04
	sub r0, r0, #0x10
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0540:
	sub r0, r0, #5
	cmp r2, r0
	beq _022F07FC
	b _022F11C0
_022F054C:
	cmp r2, #0x1bc
	bgt _022F05B0
	bge _022F0C44
	cmp r2, #0x19c
	bgt _022F0594
	bge _022F08F8
	cmp r2, #0x17c
	bgt _022F0588
	beq _022F0700
	b _022F11C0
_022F0588:
	add r0, r0, #0x13
	cmp r2, r0
	beq _022F09F4
	b _022F11C0
_022F0594:
	add r1, r0, #0x36
	cmp r2, r1
	bgt _022F05A4
	add r0, r0, #0x36
	cmp r2, r0
	bge _022F0C44
	cmp r2, #0x1b0
	beq _022F0C44
	b _022F11C0
_022F05A4:
	add r0, r0, #0x40
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F05B0:
	add r1, r0, #0x53
	cmp r2, r1
	bgt _022F05E4
	bge _022F1128
	cmp r2, #0x1cc
	bgt _022F05D8
	beq _022F1090
	b _022F11C0
_022F05D8:
	add r0, r0, #0x52
	cmp r2, r0
	beq _022F1090
#elif defined(JAPAN)
	cmp r2, #0x164
	bgt _022F0540
	beq _022F0700
	b _022F11C0
_022F0540:
	sub r0, r0, #0xa
	cmp r2, r0
	beq _022F0F04
	b _022F11C0
_022F054C:
	add r1, r0, #0x37
	cmp r2, r1
	bgt _022F1BFC
	bge _022F0C44
	add r1, r0, #0x18
	cmp r2, r1
	bgt _022F1BD0
	bge _022F09F4
	cmp r2, #0x174
	bgt _022F1BC0
	beq _022F07FC
	b _022F11C0
_022F1BC0:
	add r0, r0, #6
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F1BD0:
	add r1, r0, #0x26
	cmp r2, r1
	bgt _022F1BEC
	add r0, r0, #0x26
	cmp r2, r0
	beq _022F08F8
	b _022F11C0
_022F1BEC:
	add r0, r0, #0x36
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F1BFC:
	add r1, r0, #0x46
	cmp r2, r1
	bgt _022F05E4
	bge _022F1090
	cmp r2, #0x1b0
	bgt _022F1C1C
	beq _022F0C44
	b _022F11C0
_022F1C1C:
	add r0, r0, #0x42
	cmp r2, r0
	beq _022F0C44
#else
	sub r1, r0, #0xb
	cmp r2, r1
	bgt _022F0540
	sub r0, r0, #0xb
	cmp r2, r0
	beq _022F0700
	b _022F11C0
_022F0540:
	cmp r2, #0x160
	beq _022F0F04
	b _022F11C0
_022F054C:
	add r1, r0, #0x37
	cmp r2, r1
	bgt _022F05B0
	bge _022F0C44
	add r1, r0, #0x18
	cmp r2, r1
	bgt _022F0594
	bge _022F09F4
	add r1, r0, #5
	cmp r2, r1
	bgt _022F0588
	add r0, r0, #5
	cmp r2, r0
	beq _022F07FC
	b _022F11C0
_022F0588:
	cmp r2, #0x170
	beq _022F0700
	b _022F11C0
_022F0594:
	cmp r2, #0x190
	bgt _022F05A4
	beq _022F08F8
	b _022F11C0
_022F05A4:
	cmp r2, #0x1a0
	beq _022F0C44
	b _022F11C0
_022F05B0:
	cmp r2, #0x1b0
	bgt _022F05E4
	bge _022F1090
	add r1, r0, #0x41
	cmp r2, r1
	bgt _022F05D8
	add r0, r0, #0x41
	cmp r2, r0
	beq _022F0C44
	b _022F11C0
_022F05D8:
	cmp r2, #0x1ac
	beq _022F0C44
#endif
	b _022F11C0
_022F05E4:
#ifdef EUROPE
	add r1, r0, #0x57
	cmp r2, r1
	bgt _022F0604
	add r0, r0, #0x57
	cmp r2, r0
	bge _022F0FF8
	cmp r2, #0x1d0
	beq _022F1128
#else
	add r1, r0, #0x48
	cmp r2, r1
	bgt _022F0604
	bge _022F1128
	add r0, r0, #0x47
	cmp r2, r0
	beq _022F1090
#endif
	b _022F11C0
_022F0604:
#ifdef EUROPE
	add r0, r0, #0x5b
	cmp r2, r0
#else
	add r1, r0, #0x50
	cmp r2, r1
	bgt _022F11C0
#ifdef JAPAN
	add r1, r0, #0x4a
	cmp r2, r1
#else
	cmp r2, #0x1b4
#endif
	blt _022F11C0
	beq _022F1128
	add r1, r0, #0x4c
	cmp r2, r1
	addne r0, r0, #0x50
	cmpne r2, r0
#endif
	beq _022F0FF8
	b _022F11C0
_022F0634:
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x78
	add r0, r1, r0
	str r0, [sp, #0x78]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x7c]
	bl ov11_022EF2EC
	add r2, sp, #0x78
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0700:
	ldr r0, [r5]
	add r2, sp, #0x70
	str r0, [sp, #0x70]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x70]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x70
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x74]
	bl ov11_022EF2EC
	add r2, sp, #0x70
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F07FC:
	ldr r0, [r5]
	add r2, sp, #0x68
	str r0, [sp, #0x68]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x68]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x68
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x6c]
	bl ov11_022EF2EC
	add r2, sp, #0x68
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F08F8:
	ldr r0, [r5]
	add r2, sp, #0x60
	str r0, [sp, #0x60]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	add r1, ip, r1, asr #8
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #24
	add r3, ip, r3, ror #24
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x60]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x60
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x64]
	bl ov11_022EF2EC
	add r2, sp, #0x60
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F09F4:
	ldr r0, [r5]
	add r2, sp, #0x58
	str r0, [sp, #0x58]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r1, [r6, #4]
	mov r0, r4
	add r1, r2, r1
	str r1, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	add r2, r6, #0x14
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #1
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	bl ov11_022EF2EC
	ldr r2, [r5]
	ldr r1, [r6, #0x14]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x58]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	add r2, sp, #0x58
	add r3, r3, r1
	mov r1, #1
	str r3, [sp, #0x5c]
	bl ov11_022EF2EC
	add r2, sp, #0x58
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0AF0:
	ldr r0, [r5]
	add r2, sp, #0x50
	str r0, [sp, #0x50]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, r1, r0
	str r2, [r6, #0xc]
	mov r0, r2, asr #2
	ldr r1, [r6, #0x14]
	add r0, r2, r0, lsr #29
	add r0, r1, r0, asr #3
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	add r0, r1, r0, ror #29
	str r0, [r6, #0xc]
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	adds r1, r1, r0
	str r1, [sp, #0x50]
	ldr r2, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	add r0, r3, r0, asr #3
	str r0, [sp, #0x54]
	bpl _022F0BB4
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r2, #1
	add r1, r3, r1, ror #24
	sub r2, r0, r2, lsl #5
	add r0, r1, #0x100
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
	b _022F0BE0
_022F0BB4:
	cmp r1, #0x100
	blt _022F0BE0
	mov r2, r1, asr #7
	add r2, r1, r2, lsr #24
	mov r3, r1, lsr #0x1f
	mov r2, r2, asr #8
	rsb r1, r3, r1, lsl #24
	sub r2, r0, r2, lsl #5
	add r0, r3, r1, ror #24
	str r2, [sp, #0x54]
	str r0, [sp, #0x50]
_022F0BE0:
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x50
	add r0, r1, r0
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [sp, #0x50]
	ldr r1, [r6, #0x14]
	ldr r3, [r5, #4]
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	add r3, r3, r0, asr #4
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x54]
	bl ov11_022EF2EC
	add r2, sp, #0x50
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0C44:
	ldr r0, [r5]
	add r2, sp, #0x48
	str r0, [sp, #0x48]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #4]
	add r2, sp, #0x48
	add r0, r1, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r1, [r6, #8]
	mov r0, r4
	add r1, r3, r1
	str r1, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r1, r3, asr #2
	add r1, r3, r1, lsr #29
	add r1, ip, r1, asr #3
	str r1, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r1, #0
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x48]
	add r2, sp, #0x48
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x48]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [sp, #0x48]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r3, [r5]
	ldr r2, [r6, #0x14]
	mov r1, #0
	add r2, r3, r2
	str r2, [sp, #0x48]
	ldr r3, [r5, #4]
	add r2, sp, #0x48
	str r3, [sp, #0x4c]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x48
	bl ov11_022EF2D4
	ldr r1, [r6, #0x18]
	ldr r2, [r5]
	mov r0, r4
	add r1, r2, r1
	str r1, [sp, #0x48]
	ldr r2, [r5, #4]
	mov r1, #1
	str r2, [sp, #0x4c]
	add r2, sp, #0x48
	bl ov11_022EF2EC
	add r2, sp, #0x48
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0DA4:
	ldr r0, [r5]
	add r2, sp, #0x40
	str r0, [sp, #0x40]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r2, [r6, #0xc]
	ldr r0, [r6, #4]
	mov r1, #0
	add r0, r2, r0
	str r0, [r6, #0xc]
	ldr r3, [r6, #0x10]
	ldr r0, [r6, #8]
	add r2, sp, #0x40
	add r0, r3, r0
	str r0, [r6, #0x10]
	ldr r3, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r3, asr #2
	add r0, r3, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r3, [r6, #0xc]
	mov r0, r4
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0xc]
	ldr r3, [r6, #0x10]
	mov ip, r3, lsr #0x1f
	rsb r3, ip, r3, lsl #29
	add r3, ip, r3, ror #29
	str r3, [r6, #0x10]
	str r1, [sp, #0x40]
	ldr r3, [r6, #0x14]
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	ldr r0, [sp, #0x44]
	add r2, sp, #0x40
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x18]
	mov r0, r4
	str r1, [sp, #0x44]
	mov r1, #1
	bl ov11_022EF2EC
	ldr r1, [sp, #0x44]
	mov r0, r4
	str r1, [r6, #0x18]
	ldr r2, [r5]
	mov r1, #0
	str r2, [sp, #0x40]
	ldr ip, [r5, #4]
	ldr r3, [r6, #0x14]
	add r2, sp, #0x40
	add r3, ip, r3
	str r3, [sp, #0x44]
	bl ov11_022EF2EC
	mov r0, r4
	mov r1, #0
	add r2, sp, #0x40
	bl ov11_022EF2D4
	ldr r1, [r5]
	mov r0, r4
	str r1, [sp, #0x40]
	ldr r3, [r5, #4]
	ldr r2, [r6, #0x18]
	mov r1, #1
	add r2, r3, r2
	str r2, [sp, #0x44]
	add r2, sp, #0x40
	bl ov11_022EF2EC
	add r2, sp, #0x40
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0F04:
	ldr r1, [r6, #0xc]
	mov r0, r4
	add r3, r1, #2
	str r3, [r6, #0xc]
	mov r1, r3, asr #1
	ldr r2, [r6, #0x14]
	add r1, r3, r1, lsr #30
	add r1, r2, r1, asr #2
	str r1, [r6, #0x14]
	ldr r1, [r6, #0xc]
	add r2, r6, #0x14
	and r1, r1, #3
	str r1, [r6, #0xc]
	mov r1, #0
	bl ov11_022EF2EC
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	add r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #0
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x38
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r3, [r5, #4]
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x3c]
	bl ov11_022EF2EC
	add r2, sp, #0x38
	mov r0, r4
	mov r1, #1
	bl ov11_022EF2D4
	b _022F11C8
_022F0FB4:
	ldr r1, [r5]
	ldr r0, [r6, #0x14]
	add r2, sp, #0x30
	add r0, r1, r0
	str r0, [sp, #0x30]
	ldr r3, [r5, #4]
	ldr r1, [r6, #0x18]
	mov r0, r4
	add r3, r3, r1
	mov r1, #0
	str r3, [sp, #0x34]
	bl ov11_022EF2EC
	add r2, sp, #0x30
	mov r0, r4
	mov r1, #0
	bl ov11_022EF2D4
	b _022F11C8
_022F0FF8:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x28]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x20
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x2c]
	sub r3, r3, r4
	str r3, [sp, #0x20]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x24]
	bl ov11_022F2B28
	b _022F11C8
_022F1090:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #0x18]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #2
	add r0, r5, r0, lsr #29
	add r0, ip, r0, asr #3
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #7
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0x10
	and r4, r4, #7
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0x1c]
	sub r3, r3, r4
	str r3, [sp, #0x10]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #0x14]
	bl ov11_022F2B28
	b _022F11C8
_022F1128:
	ldr r0, [r6, #0xc]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	add r0, r0, #2
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x10]
	str r3, [sp, #8]
	add r0, r0, #1
	str r0, [r6, #0x10]
	ldr r5, [r6, #0xc]
	ldr ip, [r6, #0x14]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x14]
	ldr r5, [r6, #0x10]
	ldr ip, [r6, #0x18]
	mov r0, r5, asr #1
	add r0, r5, r0, lsr #30
	add r0, ip, r0, asr #2
	str r0, [r6, #0x18]
	ldr r5, [r6, #0xc]
	mov r0, r4
	and r4, r5, #3
	str r4, [r6, #0xc]
	ldr r4, [r6, #0x10]
	add r1, sp, #0
	and r4, r4, #3
	str r4, [r6, #0x10]
	ldr r4, [r6, #0x14]
	str r2, [sp, #0xc]
	sub r3, r3, r4
	str r3, [sp]
	ldr r3, [r6, #0x18]
	add r2, r2, r3
	str r2, [sp, #4]
	bl ov11_022F2B28
	b _022F11C8
_022F11C0:
	mov r0, #1
	b _022F11CC
_022F11C8:
	mov r0, #0
_022F11CC:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
#if defined(EUROPE)
_022F11D4: .word 0x0000017B
_022F11D8: .word 0x00000162
#elif defined(JAPAN)
_022F11D4: .word 0x0000016F
_022F11D8: .word 0x0000015B
#else
_022F11D4: .word 0x0000016A
_022F11D8: .word 0x00000156
#endif
	arm_func_end ov11_022F042C

	arm_func_start ov11_022F11DC
ov11_022F11DC: ; 0x022F11DC
	stmdb sp!, {r3, lr}
	mov r0, #0x3c
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F1210 ; =GROUND_STATE_MAP
	mvn r2, #0
	str r0, [r1, #4]
	strh r2, [r0]
	bl ov11_022F2F58
	mov r0, #0
	bl ov11_022F2278
	bl ov11_022F1244
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1210: .word GROUND_STATE_MAP
	arm_func_end ov11_022F11DC

	arm_func_start ov11_022F1214
ov11_022F1214: ; 0x022F1214
	stmdb sp!, {r3, lr}
	bl ov11_022F1244
	bl ov11_022F2FE8
	bl ov11_022F22C8
	ldr r0, _022F1240 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F1240 ; =GROUND_STATE_MAP
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1240: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1214

	arm_func_start ov11_022F1244
ov11_022F1244: ; 0x022F1244
	stmdb sp!, {r3, lr}
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1258
	bl ov11_023113E8
_022F1258:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F1268
	bl ov11_023118E8
_022F1268:
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	mov r2, #0
	ldr r1, [r0, #4]
	strb r2, [r1, #3]
	ldr r0, [r0, #4]
	strb r2, [r0, #2]
	bl ov11_022F3010
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl GroundBg_FreeAll
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F12BC ; =GROUND_STATE_MAP
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F12BC: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1244

	arm_func_start ov11_022F12C0
ov11_022F12C0: ; 0x022F12C0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	ldr r1, _022F1534 ; =ov11_02320FB4
	mov r2, r5
	mov r0, #1
	bl Debug_Print
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F1538 ; =GROUND_STATE_MAP
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r5, r1
	strh r5, [r0]
	bne _022F134C
	ldr r0, [r2]
	ldr r1, _022F153C ; =ov11_02320CD8
	bl GroundBg_Init
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F14E8
_022F134C:
	mov r0, #0xc
	smulbb r3, r5, r0
	ldr r4, _022F1540 ; =EVENTS
	ldrsh r0, [r4, r3]
	add r4, r4, r3
	add r0, r0, #1
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _022F146C
_022F1370: ; jump table
	b _022F1444 ; case 0
	b _022F146C ; case 1
	b _022F146C ; case 2
	b _022F146C ; case 3
	b _022F146C ; case 4
	b _022F146C ; case 5
	b _022F13A4 ; case 6
	b _022F13A4 ; case 7
	b _022F13A4 ; case 8
	b _022F13A4 ; case 9
	b _022F13A4 ; case 10
	b _022F13C4 ; case 11
	b _022F13C4 ; case 12
_022F13A4:
	ldr r0, [r2]
	ldr r1, _022F1544 ; =ov11_02320CF4
	bl GroundBg_Init
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #2
	bl ov11_022F22F4
	b _022F148C
_022F13C4:
	ldr r6, _022F1548 ; =LEVEL_TILEMAP_LIST
	b _022F1414
_022F13CC:
	cmp r0, r5
	bne _022F1410
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl MemFree
	ldrsh r1, [r4]
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mov r3, #0
	str r3, [r0]
	cmp r1, #0xb
	moveq r3, #1
	ldr r2, [r6, #4]
	mov r0, r5
	add r1, r6, #2
	and r3, r3, #0xff
	bl GetSpecialLayoutBackground
	b _022F152C
_022F1410:
	add r6, r6, #8
_022F1414:
	ldrsh r0, [r6]
	cmp r0, r1
	bne _022F13CC
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, _022F154C ; =ov11_02320D10
	ldr r0, [r0]
	bl GroundBg_Init
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	b _022F148C
_022F1444:
	ldr r0, _022F1550 ; =ov11_02320CA8
	ldrsh r3, [r4]
	ldr ip, [r0, #0x1c]
	ldr lr, [r0, #0x18]
	ldr r1, _022F1554 ; =ov11_02320FCC
	add r0, sp, #0
	mov r2, r5
	str lr, [sp]
	str ip, [sp, #4]
	bl Debug_FatalError
_022F146C:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, _022F153C ; =ov11_02320CD8
	ldr r0, [r0]
	bl GroundBg_Init
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
_022F148C:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldrsh r0, [r4, #6]
	mvn r1, #0
	cmp r0, r1
	beq _022F14D4
	bl ov11_022F25A4
_022F14D4:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	ldr r2, _022F1558 ; =ov11_02320CA8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F14E8:
	ldr r0, _022F1538 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	bl ov11_0231145C
	cmp r0, #0
	beq _022F1514
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
	b _022F152C
_022F1514:
	bl ov11_0231195C
	cmp r0, #0
	beq _022F152C
	mov r0, #0
	mov r1, r0
	bl ov11_0230D318
_022F152C:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F1534: .word ov11_02320FB4
_022F1538: .word GROUND_STATE_MAP
_022F153C: .word ov11_02320CD8
_022F1540: .word EVENTS
_022F1544: .word ov11_02320CF4
_022F1548: .word LEVEL_TILEMAP_LIST
_022F154C: .word ov11_02320D10
_022F1550: .word ov11_02320CA8
_022F1554: .word ov11_02320FCC
_022F1558: .word ov11_02320CA8
	arm_func_end ov11_022F12C0

	arm_func_start GetSpecialLayoutBackground
GetSpecialLayoutBackground: ; 0x022F155C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldr r1, _022F16F0 ; =ov11_02320FE8
	mov r2, r8
	mov r0, #1
	mov r5, r3
	bl Debug_Print
	bl ov11_022F1244
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F16F4 ; =GROUND_STATE_MAP
	mvn r1, #0
	str r0, [r2]
	ldr r0, [r2, #4]
	cmp r8, r1
	strh r8, [r0]
	ldrneb r0, [r7]
	cmpne r0, #0xff
	bne _022F1600
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, _022F16F8 ; =ov11_02320CD8
	ldr r0, [r0]
	bl GroundBg_Init
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	mvn r1, #0
	ldr r0, [r0]
	bl ov11_022EC27C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	b _022F16D8
_022F1600:
	mov r0, #0xc
	smulbb r1, r8, r0
	ldr r2, _022F16FC ; =EVENTS
	ldrsh r0, [r2, r1]
	add r4, r2, r1
	cmp r0, #0xa
	cmpne r0, #0xb
	beq _022F1644
	ldr r1, _022F1700 ; =ov11_02320CA8
	add r0, sp, #0
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	ldr r1, _022F1704 ; =ov11_02321004
	mov r2, r8
	str ip, [sp]
	str r3, [sp, #4]
	bl Debug_FatalError
_022F1644:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, _022F1708 ; =ov11_02320D10
	ldr r0, [r0]
	bl GroundBg_Init
	mov r0, #0
	bl ov11_022EF53C
	mov r0, #1
	bl ov11_022F22F4
	cmp r5, #0
	beq _022F1688
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl LoadMapType11
	b _022F16A0
_022F1688:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldrsh r1, [r4, #4]
	ldr r0, [r0]
	mov r2, r7
	mov r3, r6
	bl LoadMapType10
_022F16A0:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldmia r0, {r1, r2}
	add r0, r2, #4
	bl ov11_022EFD5C
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	ldr r2, _022F170C ; =ov11_02320CB8
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F16D8:
	ldr r0, _022F16F4 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F16F0: .word ov11_02320FE8
_022F16F4: .word GROUND_STATE_MAP
_022F16F8: .word ov11_02320CD8
_022F16FC: .word EVENTS
_022F1700: .word ov11_02320CA8
_022F1704: .word ov11_02321004
_022F1708: .word ov11_02320D10
_022F170C: .word ov11_02320CB8
	arm_func_end GetSpecialLayoutBackground

	arm_func_start ov11_022F1710
ov11_022F1710: ; 0x022F1710
	ldr r0, _022F1734 ; =GROUND_STATE_MAP
	mov r2, #0
	ldr r1, [r0, #4]
	ldr ip, _022F1738 ; =ov11_022EDD14
	strb r2, [r1, #3]
	ldr r1, [r0, #4]
	strb r2, [r1, #2]
	ldr r0, [r0]
	bx ip
	.align 2, 0
_022F1734: .word GROUND_STATE_MAP
_022F1738: .word ov11_022EDD14
	arm_func_end ov11_022F1710

	arm_func_start ov11_022F173C
ov11_022F173C: ; 0x022F173C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F178C ; =ov11_02321018
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r2, _022F1790 ; =GROUND_STATE_MAP
	ldr r1, _022F1794 ; =EVENTS
	ldr r3, [r2, #4]
	mov r0, #0xc
	strh r4, [r3]
	smlabb r0, r4, r0, r1
	ldrsh r1, [r0, #4]
	ldr r0, [r2]
	bl ov11_022EDD20
	ldr r0, _022F1790 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F178C: .word ov11_02321018
_022F1790: .word GROUND_STATE_MAP
_022F1794: .word EVENTS
	arm_func_end ov11_022F173C

	arm_func_start ov11_022F1798
ov11_022F1798: ; 0x022F1798
	ldr r0, _022F17B0 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	cmp r0, #0
	ldrnesh r0, [r0]
	mvneq r0, #0
	bx lr
	.align 2, 0
_022F17B0: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1798

	arm_func_start ov11_022F17B4
ov11_022F17B4: ; 0x022F17B4
	ldr r0, _022F17E0 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	ldrsh r2, [r0]
	mov r0, #0xc
	ldr r1, _022F17E4 ; =EVENTS
	smulbb r0, r2, r0
	ldrsh r0, [r1, r0]
	bx lr
	.align 2, 0
_022F17E0: .word GROUND_STATE_MAP
_022F17E4: .word EVENTS
	arm_func_end ov11_022F17B4

	arm_func_start ov11_022F17E8
ov11_022F17E8: ; 0x022F17E8
	ldr r1, _022F17F8 ; =GROUND_STATE_MAP
	ldr ip, _022F17FC ; =ov11_022ED69C
	ldr r1, [r1]
	bx ip
	.align 2, 0
_022F17F8: .word GROUND_STATE_MAP
_022F17FC: .word ov11_022ED69C
	arm_func_end ov11_022F17E8

.global ov11_022F1800
	arm_func_start ov11_022F1800
ov11_022F1800: ; 0x022F1800
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldrsh r4, [r2, #6]
	mov r5, #0
	cmp r4, #0
	mov r4, #0xff
	ble _022F1A3C
	mov r7, r0
	mov r6, r5
_022F1820:
	mov r8, r6
_022F1824:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1824
	add r5, r5, #1
	cmp r5, #4
	blt _022F1820
	ldrb r6, [r2, #1]
	mov r4, #0
	cmp r6, #0
	ble _022F1A0C
	b _022F1A00
_022F1854:
	mov sb, #0
	mov r6, #0xff
_022F185C:
	add sb, sb, #1
	cmp sb, #5
	strb r6, [r7], #1
	blt _022F185C
	cmp r4, #0
	mov lr, #0
	bne _022F1924
	mov r8, lr
	mov ip, #0xc0
	b _022F1914
_022F1884:
	ldrb r6, [r1]
	add sl, r1, #1
	mov r1, sl
	cmp r6, #0xc0
	blt _022F18C0
	mov fp, ip
	b _022F18AC
_022F18A0:
	ldrb sl, [r1], #1
	add fp, fp, #1
	strb sl, [r7], #1
_022F18AC:
	cmp fp, r6
	ble _022F18A0
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F1914
_022F18C0:
	cmp r6, #0x80
	blt _022F18F4
	add r1, sl, #1
	ldrb sl, [sl]
	mov fp, #0x80
	b _022F18E0
_022F18D8:
	strb sl, [r7], #1
	add fp, fp, #1
_022F18E0:
	cmp fp, r6
	ble _022F18D8
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F1914
_022F18F4:
	mov sl, #0
	b _022F1904
_022F18FC:
	strb r8, [r7], #1
	add sl, sl, #1
_022F1904:
	cmp sl, r6
	ble _022F18FC
	add r6, r6, #1
	add lr, lr, r6
_022F1914:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F1884
	b _022F19DC
_022F1924:
	sub ip, r7, #0x100
	b _022F19D0
_022F192C:
	ldrb r6, [r1]
	add r8, r1, #1
	mov r1, r8
	cmp r6, #0xc0
	blt _022F1970
	mov r8, #0xc0
	b _022F195C
_022F1948:
	ldrb fp, [r1], #1
	ldrb sl, [ip], #1
	add r8, r8, #1
	eor sl, fp, sl
	strb sl, [r7], #1
_022F195C:
	cmp r8, r6
	ble _022F1948
	sub r6, r6, #0xbf
	add lr, lr, r6
	b _022F19D0
_022F1970:
	cmp r6, #0x80
	blt _022F19AC
	add r1, r8, #1
	ldrb r8, [r8]
	mov sl, #0x80
	b _022F1998
_022F1988:
	ldrb fp, [ip], #1
	add sl, sl, #1
	eor fp, r8, fp
	strb fp, [r7], #1
_022F1998:
	cmp sl, r6
	ble _022F1988
	sub r6, r6, #0x7f
	add lr, lr, r6
	b _022F19D0
_022F19AC:
	mov sl, #0
	b _022F19C0
_022F19B4:
	ldrb r8, [ip], #1
	add sl, sl, #1
	strb r8, [r7], #1
_022F19C0:
	cmp sl, r6
	ble _022F19B4
	add r6, r6, #1
	add lr, lr, r6
_022F19D0:
	ldrb r6, [r2]
	cmp lr, r6
	blt _022F192C
_022F19DC:
	add sb, sb, r6
	mov r6, #0xff
	b _022F19F0
_022F19E8:
	strb r6, [r7], #1
	add sb, sb, #1
_022F19F0:
	cmp sb, #0x100
	blt _022F19E8
	add r4, r4, #1
	add r5, r5, #1
_022F1A00:
	ldrb r6, [r2, #1]
	cmp r4, r6
	blt _022F1854
_022F1A0C:
	mov r4, #0xff
	mov r6, #0
	b _022F1A30
_022F1A18:
	mov r8, r6
_022F1A1C:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r7], #1
	blt _022F1A1C
	add r5, r5, #1
_022F1A30:
	cmp r5, r3
	blt _022F1A18
	b _022F1B10
_022F1A3C:
	mov r6, r0
	mov r7, r5
_022F1A44:
	mov r8, r7
_022F1A48:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1A48
	add r5, r5, #1
	cmp r5, #4
	blt _022F1A44
	ldrb r7, [r2, #1]
	mov r4, #0
	cmp r7, #0
	ble _022F1AE4
	mov r8, #0xff
	mov sb, r4
	mov sl, r8
	mov ip, r4
	b _022F1AD8
_022F1A88:
	mov lr, ip
_022F1A8C:
	add lr, lr, #1
	strb sl, [r6], #1
	cmp lr, #5
	blt _022F1A8C
	mov fp, #0
	b _022F1AAC
_022F1AA4:
	strb sb, [r6], #1
	add fp, fp, #1
_022F1AAC:
	ldrb r7, [r2]
	cmp fp, r7
	blt _022F1AA4
	add lr, lr, r7
	b _022F1AC8
_022F1AC0:
	strb r8, [r6], #1
	add lr, lr, #1
_022F1AC8:
	cmp lr, #0x100
	blt _022F1AC0
	add r4, r4, #1
	add r5, r5, #1
_022F1AD8:
	ldrb r7, [r2, #1]
	cmp r4, r7
	blt _022F1A88
_022F1AE4:
	mov r4, #0xff
	mov r7, #0
	b _022F1B08
_022F1AF0:
	mov r8, r7
_022F1AF4:
	add r8, r8, #1
	cmp r8, #0x100
	strb r4, [r6], #1
	blt _022F1AF4
	add r5, r5, #1
_022F1B08:
	cmp r5, r3
	blt _022F1AF0
_022F1B10:
	ldrsh r3, [r2, #8]
	cmp r3, #0
	ldrgtb r3, [r2, #1]
	addgt r4, r0, #0x400
	movgt r6, #0
	cmpgt r3, #0
	ble _022F1C58
	b _022F1C4C
_022F1B30:
	cmp r6, #0
	add r4, r4, #5
	mov r5, #0
	bne _022F1BA0
	mov r7, #0x80
	b _022F1B90
_022F1B48:
	ldrb sb, [r1], #1
	cmp sb, #0x80
	blt _022F1B84
	mov r8, r7
	b _022F1B70
_022F1B5C:
	mov sl, r4
	ldrb r3, [r4], #1
	add r8, r8, #1
	orr r3, r3, #0x80
	strb r3, [sl]
_022F1B70:
	cmp r8, sb
	ble _022F1B5C
	sub r3, sb, #0x7f
	add r5, r5, r3
	b _022F1B90
_022F1B84:
	add r3, sb, #1
	add r4, r4, r3
	add r5, r5, r3
_022F1B90:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1B48
	b _022F1C3C
_022F1BA0:
	sub r7, r4, #0x100
	mov ip, #0x80
	mov r3, r5
	b _022F1C30
_022F1BB0:
	ldrb lr, [r1], #1
	cmp lr, #0x80
	blt _022F1BF8
	mov r8, ip
	b _022F1BE4
_022F1BC4:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	moveq sl, r4
	ldreqb sb, [r4], #1
	addne r4, r4, #1
	orreq sb, sb, #0x80
	streqb sb, [sl]
_022F1BE4:
	cmp r8, lr
	ble _022F1BC4
	sub r8, lr, #0x7f
	add r5, r5, r8
	b _022F1C30
_022F1BF8:
	mov r8, r3
	b _022F1C20
_022F1C00:
	ldrb sb, [r7], #1
	add r8, r8, #1
	tst sb, #0x80
	movne sl, r4
	ldrneb sb, [r4], #1
	addeq r4, r4, #1
	orrne sb, sb, #0x80
	strneb sb, [sl]
_022F1C20:
	cmp r8, lr
	ble _022F1C00
	add r8, lr, #1
	add r5, r5, r8
_022F1C30:
	ldrb r8, [r2]
	cmp r5, r8
	blt _022F1BB0
_022F1C3C:
	rsb r3, r8, #0x100
	sub r3, r3, #5
	add r4, r4, r3
	add r6, r6, #1
_022F1C4C:
	ldrb r3, [r2, #1]
	cmp r6, r3
	blt _022F1B30
_022F1C58:
	ldrsh r3, [r2, #8]
	cmp r3, #1
	ldrgtb r4, [r2, #1]
	addgt r3, r0, #0x400
	movgt r5, #0
	cmpgt r4, #0
	ble _022F1DA0
	b _022F1D94
_022F1C78:
	cmp r5, #0
	add r3, r3, #5
	mov r4, #0
	bne _022F1CE8
	mov r6, #0x80
	b _022F1CD8
_022F1C90:
	ldrb r8, [r1], #1
	cmp r8, #0x80
	blt _022F1CCC
	mov r7, r6
	b _022F1CB8
_022F1CA4:
	mov sb, r3
	ldrb r0, [r3], #1
	add r7, r7, #1
	orr r0, r0, #0x40
	strb r0, [sb]
_022F1CB8:
	cmp r7, r8
	ble _022F1CA4
	sub r0, r8, #0x7f
	add r4, r4, r0
	b _022F1CD8
_022F1CCC:
	add r0, r8, #1
	add r3, r3, r0
	add r4, r4, r0
_022F1CD8:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1C90
	b _022F1D84
_022F1CE8:
	sub r7, r3, #0x100
	mov r0, #0x80
	mov sb, r4
	b _022F1D78
_022F1CF8:
	ldrb r6, [r1], #1
	cmp r6, #0x80
	blt _022F1D40
	mov fp, r0
	b _022F1D2C
_022F1D0C:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	moveq sl, r3
	ldreqb r8, [r3], #1
	addne r3, r3, #1
	orreq r8, r8, #0x40
	streqb r8, [sl]
_022F1D2C:
	cmp fp, r6
	ble _022F1D0C
	sub r6, r6, #0x7f
	add r4, r4, r6
	b _022F1D78
_022F1D40:
	mov fp, sb
	b _022F1D68
_022F1D48:
	ldrb r8, [r7], #1
	add fp, fp, #1
	tst r8, #0x40
	movne sl, r3
	ldrneb r8, [r3], #1
	addeq r3, r3, #1
	orrne r8, r8, #0x40
	strneb r8, [sl]
_022F1D68:
	cmp fp, r6
	ble _022F1D48
	add r6, r6, #1
	add r4, r4, r6
_022F1D78:
	ldrb r8, [r2]
	cmp r4, r8
	blt _022F1CF8
_022F1D84:
	rsb r0, r8, #0x100
	sub r0, r0, #5
	add r3, r3, r0
	add r5, r5, #1
_022F1D94:
	ldrb r0, [r2, #1]
	cmp r5, r0
	blt _022F1C78
_022F1DA0:
	mov r0, r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov11_022F1800

	arm_func_start ov11_022F1DA8
ov11_022F1DA8: ; 0x022F1DA8
	stmdb sp!, {r3, lr}
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_022F1DB8: ; jump table
	ldmia sp!, {r3, pc} ; case 0
	b _022F1DD0 ; case 1
	b _022F1DE8 ; case 2
	b _022F1E00 ; case 3
	b _022F1E18 ; case 4
	b _022F1E2C ; case 5
_022F1DD0:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1DE8:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E00:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F1E18:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
_022F1E2C:
	ldr r0, _022F1E40 ; =GROUND_STATE_MAP
	mov r1, #0
	ldr r0, [r0]
	bl ov11_022EE5E4
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E40: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1DA8

	arm_func_start ov11_022F1E44
ov11_022F1E44: ; 0x022F1E44
	stmdb sp!, {r3, lr}
	cmp r0, #1
	cmpne r0, #3
	bne _022F1E64
	ldr r0, _022F1E6C ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl ov11_022EE60C
	ldmia sp!, {r3, pc}
_022F1E64:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1E6C: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1E44

	arm_func_start ov11_022F1E70
ov11_022F1E70: ; 0x022F1E70
	ldr r1, _022F1E88 ; =GROUND_STATE_MAP
	ldr ip, _022F1E8C ; =ov11_022EF2BC
	mov r2, r0
	ldr r0, [r1]
	mov r1, #0
	bx ip
	.align 2, 0
_022F1E88: .word GROUND_STATE_MAP
_022F1E8C: .word ov11_022EF2BC
	arm_func_end ov11_022F1E70

	arm_func_start ov11_022F1E90
ov11_022F1E90: ; 0x022F1E90
	ldr r3, _022F1EA4 ; =GROUND_STATE_MAP
	ldr ip, _022F1EA8 ; =ov11_022EF40C
	mov r2, r1
	ldr r1, [r3]
	bx ip
	.align 2, 0
_022F1EA4: .word GROUND_STATE_MAP
_022F1EA8: .word ov11_022EF40C
	arm_func_end ov11_022F1E90

	arm_func_start ov11_022F1EAC
ov11_022F1EAC: ; 0x022F1EAC
	ldr r2, _022F1EC4 ; =GROUND_STATE_MAP
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EC8 ; =ov11_022F03F8
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EC4: .word GROUND_STATE_MAP
_022F1EC8: .word ov11_022F03F8
	arm_func_end ov11_022F1EAC

	arm_func_start ov11_022F1ECC
ov11_022F1ECC: ; 0x022F1ECC
	ldr r2, _022F1EE4 ; =GROUND_STATE_MAP
	mov r1, r0
	ldr r0, [r2, #4]
	ldr ip, _022F1EE8 ; =ov11_022F040C
	add r0, r0, #4
	bx ip
	.align 2, 0
_022F1EE4: .word GROUND_STATE_MAP
_022F1EE8: .word ov11_022F040C
	arm_func_end ov11_022F1ECC

	arm_func_start ov11_022F1EEC
ov11_022F1EEC: ; 0x022F1EEC
	ldr r1, _022F1F00 ; =GROUND_STATE_MAP
	ldr ip, _022F1F04 ; =ov11_022F03C4
	ldr r1, [r1, #4]
	add r1, r1, #0x20
	bx ip
	.align 2, 0
_022F1F00: .word GROUND_STATE_MAP
_022F1F04: .word ov11_022F03C4
	arm_func_end ov11_022F1EEC

	arm_func_start ov11_022F1F08
ov11_022F1F08: ; 0x022F1F08
	stmdb sp!, {r3, lr}
	ldr r2, _022F1F38 ; =GROUND_STATE_MAP
	mov r3, r0
	ldr r0, [r2]
	mov r2, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r3
	bl ov11_022EF498
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F1F38: .word GROUND_STATE_MAP
	arm_func_end ov11_022F1F08

	arm_func_start ov11_022F1F3C
ov11_022F1F3C: ; 0x022F1F3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _022F2044 ; =GROUND_STATE_MAP
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	cmp r0, #0
	ldrne r2, [r2, #4]
	mvnne r1, #0
	ldrnesh r4, [r2]
	cmpne r4, r1
	beq _022F203C
	mov r3, #0xc
	mov r1, r7
	mov r2, r6
	smulbb r4, r4, r3
	ldr r5, _022F2048 ; =EVENTS
	bl ov11_022EF498
	ldr r0, [r7]
	add r0, r0, #0x8000
	str r0, [r7]
	bl ov11_0231145C
	cmp r0, #0
	ldrne r0, [r7, #4]
	addne r0, r0, #0x12000
	strne r0, [r7, #4]
	bne _022F1FC0
	bl ov11_0231195C
	cmp r0, #0
	ldr r0, [r7, #4]
	addne r0, r0, #0x16000
	strne r0, [r7, #4]
	addeq r0, r0, #0x6000
	streq r0, [r7, #4]
_022F1FC0:
	ldr r0, [r6]
	sub r0, r0, #0x8000
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x6000
	str r0, [r6, #4]
	ldrsh r0, [r5, r4]
	cmp r0, #0xa
	bne _022F2014
	ldr r0, [r7]
	add r0, r0, #0x1800
	str r0, [r7]
	ldr r0, [r7, #4]
	add r0, r0, #0x1800
	str r0, [r7, #4]
	ldr r0, [r6]
	sub r0, r0, #0x1800
	str r0, [r6]
	ldr r0, [r6, #4]
	sub r0, r0, #0x1800
	str r0, [r6, #4]
_022F2014:
	ldr r1, [r7]
	ldr r0, [r6]
	cmp r1, r0
	strgt r1, [r6]
	ldr r1, [r7, #4]
	ldr r0, [r6, #4]
	cmp r1, r0
	strgt r1, [r6, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022F203C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2044: .word GROUND_STATE_MAP
_022F2048: .word EVENTS
	arm_func_end ov11_022F1F3C

	arm_func_start ov11_022F204C
ov11_022F204C: ; 0x022F204C
	stmdb sp!, {r3, lr}
	ldr r2, _022F20C8 ; =GROUND_STATE_MAP
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F20B8
_022F2088:
	mov lr, r2
	ldr ip, [r1]
	b _022F20A8
_022F2094:
	ldrb r0, [lr], #1
	tst r0, #0x88
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F20A8:
	cmp ip, #0
	bgt _022F2094
	add r2, r2, #0x100
	sub r3, r3, #1
_022F20B8:
	cmp r3, #0
	bgt _022F2088
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F20C8: .word GROUND_STATE_MAP
	arm_func_end ov11_022F204C

	arm_func_start ov11_022F20CC
ov11_022F20CC: ; 0x022F20CC
	stmdb sp!, {r3, lr}
	ldr r2, _022F2148 ; =GROUND_STATE_MAP
	ldr r3, [r0]
	ldr r0, [r0, #4]
	ldr r2, [r2]
	add r0, r3, r0, lsl #8
	add r0, r0, #5
	ldr r2, [r2, #0x2d8]
	ldr r3, [r1, #4]
	add r0, r0, #0x400
	cmp r2, #0
	add r2, r2, r0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	b _022F2138
_022F2108:
	mov lr, r2
	ldr ip, [r1]
	b _022F2128
_022F2114:
	ldrb r0, [lr], #1
	tst r0, #0x48
	movne r0, #1
	ldmneia sp!, {r3, pc}
	sub ip, ip, #1
_022F2128:
	cmp ip, #0
	bgt _022F2114
	add r2, r2, #0x100
	sub r3, r3, #1
_022F2138:
	cmp r3, #0
	bgt _022F2108
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2148: .word GROUND_STATE_MAP
	arm_func_end ov11_022F20CC

	arm_func_start ov11_022F214C
ov11_022F214C: ; 0x022F214C
	stmdb sp!, {r4, lr}
	ldr ip, _022F2174 ; =GROUND_STATE_MAP
	mov r4, r0
	mov lr, r1
	mov r3, r2
	ldr r0, [ip]
	mov r1, r4
	mov r2, lr
	bl ov11_022EF4C0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2174: .word GROUND_STATE_MAP
	arm_func_end ov11_022F214C

	arm_func_start ov11_022F2178
ov11_022F2178: ; 0x022F2178
	stmdb sp!, {r3, lr}
	bl ov11_022F27F0
	bl ov11_022F30FC
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F2178

	arm_func_start ov11_022F2188
ov11_022F2188: ; 0x022F2188
	ldr ip, _022F2190 ; =ov11_022F37D0
	bx ip
	.align 2, 0
_022F2190: .word ov11_022F37D0
	arm_func_end ov11_022F2188

	arm_func_start ov11_022F2194
ov11_022F2194: ; 0x022F2194
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r0, [r0, #4]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022F2230
	add r1, sp, #0
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp]
	streq r0, [sp, #4]
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	add r0, r1, #0x20
	add r1, r1, #4
	bl ov11_022F03C4
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	add r1, sp, #0
	ldr r0, [r0, #4]
	mov r2, #0
	add r0, r0, #4
	bl ov11_022F042C
	cmp r0, #0
	beq _022F2214
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	add r2, sp, #0
	ldr r0, [r0]
	mov r1, #0
	bl ov11_022EF2D4
_022F2214:
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	ldr r0, [r0]
	bl ov11_022EF70C
	ldr r0, _022F2240 ; =GROUND_STATE_MAP
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #3]
_022F2230:
	bl ov11_022F27F4
	bl ov11_022F3E70
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2240: .word GROUND_STATE_MAP
	arm_func_end ov11_022F2194

	arm_func_start ov11_022F2244
ov11_022F2244: ; 0x022F2244
	stmdb sp!, {r3, lr}
	ldr r0, _022F2274 ; =GROUND_STATE_MAP
	ldr r1, [r0, #4]
	ldrb r1, [r1, #3]
	cmp r1, #0
	ldrne r0, [r0]
	cmpne r0, #0
	beq _022F2268
	bl ov11_022EFB70
_022F2268:
	bl ov11_022F2924
	bl ov11_022F4358
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2274: .word GROUND_STATE_MAP
	arm_func_end ov11_022F2244

	arm_func_start ov11_022F2278
ov11_022F2278: ; 0x022F2278
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x28
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F22C4 ; =ov11_02324CC8
	mov ip, #0
	str r0, [r1]
	strb ip, [r0, #9]
	ldr r2, [r1]
	mov r0, r4
	strb ip, [r2, #8]
	ldr r3, [r1]
	sub r2, ip, #1
	str r4, [r3, #4]
	ldr r1, [r1]
	strh r2, [r1]
	bl ov11_022F22F4
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F22C4: .word ov11_02324CC8
	arm_func_end ov11_022F2278

	arm_func_start ov11_022F22C8
ov11_022F22C8: ; 0x022F22C8
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov11_022F22F4
	ldr r0, _022F22F0 ; =ov11_02324CC8
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F22F0 ; =ov11_02324CC8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F22F0: .word ov11_02324CC8
	arm_func_end ov11_022F22C8

	arm_func_start ov11_022F22F4
ov11_022F22F4: ; 0x022F22F4
	stmdb sp!, {r4, lr}
	ldr r1, _022F2598 ; =ov11_02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r2, [r0, #4]
	cmp r2, #3
	bne _022F231C
	ldr r0, [r1, #4]
	bl ov11_022EE138
	b _022F2344
_022F231C:
	sub r0, r2, #4
	cmp r0, #3
	bhi _022F2334
	ldr r0, [r1, #4]
	bl ov11_022EE210
	b _022F2344
_022F2334:
	cmp r2, #8
	bne _022F2344
	ldr r0, [r1, #4]
	bl ov11_022EE2D0
_022F2344:
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r3, #0
	ldr r1, [r0]
	sub r2, r3, #1
	strb r3, [r1, #9]
	ldr r1, [r0]
	strb r3, [r1, #8]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	strh r2, [r1]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022F239C
	bl GroundBg_FreeAll
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r1, #0
	str r1, [r0, #4]
	bl ov11_022F2AC4
_022F239C:
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x2f4
	mov r1, #6
	bl MemAlloc
	ldr r1, _022F2598 ; =ov11_02324CC8
	cmp r4, #3
	str r0, [r1, #4]
	bne _022F23F8
	bl ov11_022EE0C8
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F23F8:
	cmp r4, #4
	bne _022F243C
	mov r1, #2
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F243C:
	cmp r4, #5
	bne _022F2480
	mov r1, #3
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2480:
	cmp r4, #6
	bne _022F24C4
	mov r1, #4
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F24C4:
	cmp r4, #7
	bne _022F2508
	mov r1, #1
	bl ov11_022EE198
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2508:
	cmp r4, #8
	bne _022F2548
	bl ov11_022EE268
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	b _022F2584
_022F2548:
	cmp r4, #1
	ldreq r1, _022F259C ; =ov11_02321040
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldrne r1, _022F25A0 ; =ov11_0232105C
	ldr r0, [r0, #4]
	bl GroundBg_Init
	ldr r0, _022F2598 ; =ov11_02324CC8
	mvn r1, #0
	ldr r0, [r0, #4]
	bl ov11_022EC27C
	ldr r0, _022F2598 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
_022F2584:
	ldr r0, _022F2598 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F2598: .word ov11_02324CC8
_022F259C: .word ov11_02321040
_022F25A0: .word ov11_0232105C
	arm_func_end ov11_022F22F4

	arm_func_start ov11_022F25A4
ov11_022F25A4: ; 0x022F25A4
	stmdb sp!, {r4, lr}
	ldr r1, _022F26D0 ; =ov11_02324CC8
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _022F26D4 ; =ov11_02321078
	ldr r3, [r0, #4]
	mov r2, r4
	mov r0, #1
	bl Debug_Print
	ldr r2, _022F26D0 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r2]
	strb r1, [r0, #9]
	ldr r0, [r2]
	strb r1, [r0, #8]
	ldr r0, [r2]
	strh r4, [r0]
	ldr r0, [r2]
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	sub r0, r1, #1
	cmp r4, r0
	bne _022F2628
	ldr r0, [r2, #4]
	sub r1, r1, #1
	bl ov11_022EC27C
	ldr r0, _022F26D0 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	b _022F26BC
_022F2628:
	ldr r1, _022F26D8 ; =GROUND_WEATHER_TABLE
	mov r0, r4, lsl #2
	ldrsh r0, [r1, r0]
	add r4, r1, r4, lsl #2
	ldrsh r1, [r4, #2]
	cmp r0, #2
	ldr r0, [r2, #4]
	bne _022F2650
	bl ov11_022EC240
	b _022F2654
_022F2650:
	bl ov11_022EC27C
_022F2654:
	ldr r0, _022F26D0 ; =ov11_02324CC8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	add r0, r2, #0xc
	bl ov11_022EFD5C
	cmp r0, #0
	beq _022F26BC
	mov r0, #2
	mov r1, r0
	mov r2, #0
	bl sub_02009454
	mov r0, #3
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	mov r0, #4
	mov r1, #2
	mov r2, #0
	bl sub_02009454
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F26BC
	ldr r0, _022F26D0 ; =ov11_02324CC8
	mov r1, #2
	ldr r0, [r0, #4]
	bl ov11_022EE620
_022F26BC:
	ldr r0, _022F26D0 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F26D0: .word ov11_02324CC8
_022F26D4: .word ov11_02321078
_022F26D8: .word GROUND_WEATHER_TABLE
	arm_func_end ov11_022F25A4

	arm_func_start ov11_022F26DC
ov11_022F26DC: ; 0x022F26DC
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _022F26FC
	cmp r0, #2
	beq _022F2714
	cmp r0, #3
	beq _022F272C
	ldmia sp!, {r3, pc}
_022F26FC:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F2714:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0, #4]
	mov r2, r1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
_022F272C:
	ldr r0, _022F2744 ; =ov11_02324CC8
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, #1
	bl ov11_022EE5EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2744: .word ov11_02324CC8
	arm_func_end ov11_022F26DC

	arm_func_start ov11_022F2748
ov11_022F2748: ; 0x022F2748
	ldr r2, _022F2764 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F2768 ; =ov11_022EE144
	mov r1, r3
	bx ip
	.align 2, 0
_022F2764: .word ov11_02324CC8
_022F2768: .word ov11_022EE144
	arm_func_end ov11_022F2748

	arm_func_start ov11_022F276C
ov11_022F276C: ; 0x022F276C
	ldr r2, _022F2788 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F278C ; =ov11_022EE15C
	mov r1, r3
	bx ip
	.align 2, 0
_022F2788: .word ov11_02324CC8
_022F278C: .word ov11_022EE15C
	arm_func_end ov11_022F276C

	arm_func_start ov11_022F2790
ov11_022F2790: ; 0x022F2790
	ldr r2, _022F27AC ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27B0 ; =ov11_022EE17C
	mov r1, r3
	bx ip
	.align 2, 0
_022F27AC: .word ov11_02324CC8
_022F27B0: .word ov11_022EE17C
	arm_func_end ov11_022F2790

	arm_func_start ov11_022F27B4
ov11_022F27B4: ; 0x022F27B4
	ldr r2, _022F27D0 ; =ov11_02324CC8
	mov r3, r0
	ldr r0, [r2, #4]
	mov r2, r1
	ldr ip, _022F27D4 ; =ov11_022EE230
	mov r1, r3
	bx ip
	.align 2, 0
_022F27D0: .word ov11_02324CC8
_022F27D4: .word ov11_022EE230
	arm_func_end ov11_022F27B4

	arm_func_start ov11_022F27D8
ov11_022F27D8: ; 0x022F27D8
	ldr r0, _022F27E8 ; =ov11_02324CC8
	ldr ip, _022F27EC ; =ov11_022EE21C
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_022F27E8: .word ov11_02324CC8
_022F27EC: .word ov11_022EE21C
	arm_func_end ov11_022F27D8

	arm_func_start ov11_022F27F0
ov11_022F27F0: ; 0x022F27F0
	bx lr
	arm_func_end ov11_022F27F0

	arm_func_start ov11_022F27F4
ov11_022F27F4: ; 0x022F27F4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #0
	beq _022F290C
	ldr r2, [r2, #4]
	sub r1, r2, #3
	cmp r1, #3
	bhi _022F283C
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
	b _022F290C
_022F283C:
	cmp r2, #7
	cmpne r2, #8
	beq _022F290C
	add r1, sp, #0x10
	mov r0, #0
	bl ov11_022EB3C8
	cmp r0, #0
	moveq r0, #0
	streq r0, [sp, #0x10]
	streq r0, [sp, #0x14]
	add r0, sp, #8
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =ov11_02324CC8
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #8
	add r0, r0, #0xc
	bl ov11_022F042C
	cmp r0, #0
	beq _022F28F0
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r1, _022F2918 ; =GROUND_WEATHER_TABLE
	ldr r2, [r0]
	ldrsh r2, [r2]
	mov r2, r2, lsl #2
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bne _022F28CC
	add r0, sp, #0
	bl ov11_022F1E70
	ldr r0, _022F2914 ; =ov11_02324CC8
	add r2, sp, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bl ov11_022EF2D4
	b _022F28F0
_022F28CC:
	cmp r1, #2
	ldr r0, [r0, #4]
	mov r1, #0
	bne _022F28E8
	ldr r2, _022F291C ; =ov11_02321038
	bl ov11_022EF2D4
	b _022F28F0
_022F28E8:
	ldr r2, _022F2920 ; =ov11_02321030
	bl ov11_022EF2D4
_022F28F0:
	ldr r0, _022F2914 ; =ov11_02324CC8
	ldr r0, [r0, #4]
	bl ov11_022EF70C
	ldr r0, _022F2914 ; =ov11_02324CC8
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #9]
_022F290C:
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2914: .word ov11_02324CC8
_022F2918: .word GROUND_WEATHER_TABLE
_022F291C: .word ov11_02321038
_022F2920: .word ov11_02321030
	arm_func_end ov11_022F27F4

	arm_func_start ov11_022F2924
ov11_022F2924: ; 0x022F2924
	stmdb sp!, {r3, lr}
	ldr r0, _022F2948 ; =ov11_02324CC8
	ldr r1, [r0]
	ldrb r1, [r1, #9]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #4]
	bl ov11_022EFB70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2948: .word ov11_02324CC8
	arm_func_end ov11_022F2924

	arm_func_start ov11_022F294C
ov11_022F294C: ; 0x022F294C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r2, _022F2AA0 ; =ov11_02324CD0
	mvn r3, #0
	str r0, [r2, #0xc]
	strh r3, [r2, #4]
	ldr r0, _022F2AA4 ; =ov11_02321278
	mov r1, #0xd80
	strh r3, [r2, #2]
	bl Debug_Print0
	bl ov11_022F2F1C
	ldr r0, _022F2AA0 ; =ov11_02324CD0
	mov r1, #1
	strb r1, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _022F29A4
	cmp r0, #2
	beq _022F2A14
	cmp r0, #3
	beq _022F2A58
	b _022F2A98
_022F29A4:
	ldr r1, _022F2AA8 ; =ov11_02321298
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r1, _022F2AAC ; =ov11_023212B0
	add r0, sp, #0
	mov r2, #0
	bl LoadWteFromRom
	add r0, sp, #0
	mov r1, #0x4000
	mov r2, #1
	mov r3, #0
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AB0 ; =ov11_023212C8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A14:
	ldr r1, _022F2AB4 ; =ov11_023212E0
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AB8 ; =ov11_023212F8
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
	b _022F2A98
_022F2A58:
	ldr r1, _022F2ABC ; =ov11_02321310
	add r0, sp, #0
	mov r2, #6
	bl LoadWteFromRom
	mov r1, #0
	add r0, sp, #0
	mov r2, r1
	mov r3, r1
	bl sub_0201E12C
	add r0, sp, #0
	bl DelayWteFree
	ldr r0, _022F2AC0 ; =ov11_02321328
	mov r1, #0
	bl sub_0201DF38
	ldr r1, _022F2AA0 ; =ov11_02324CD0
	str r0, [r1, #8]
_022F2A98:
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AA0: .word ov11_02324CD0
_022F2AA4: .word ov11_02321278
_022F2AA8: .word ov11_02321298
_022F2AAC: .word ov11_023212B0
_022F2AB0: .word ov11_023212C8
_022F2AB4: .word ov11_023212E0
_022F2AB8: .word ov11_023212F8
_022F2ABC: .word ov11_02321310
_022F2AC0: .word ov11_02321328
	arm_func_end ov11_022F294C

	arm_func_start ov11_022F2AC4
ov11_022F2AC4: ; 0x022F2AC4
	stmdb sp!, {r3, lr}
	bl ov11_022F2F1C
	ldr r0, _022F2AF8 ; =ov11_02324CD0
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _022F2AFC ; =ov11_02324CD8
	bl sub_0201E020
	ldr r0, _022F2AF8 ; =ov11_02324CD0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2AF8: .word ov11_02324CD0
_022F2AFC: .word ov11_02324CD8
	arm_func_end ov11_022F2AC4

	arm_func_start ov11_022F2B00
ov11_022F2B00: ; 0x022F2B00
	cmp r0, #1
	bxne lr
	ldr r0, _022F2B24 ; =ov11_02324CD0
	ldr r2, [r0, #0xc]
	cmp r2, #3
	streqh r1, [r0, #2]
	ldreqsh r1, [r0, #2]
	streqh r1, [r0, #4]
	bx lr
	.align 2, 0
_022F2B24: .word ov11_02324CD0
	arm_func_end ov11_022F2B00

	arm_func_start ov11_022F2B28
ov11_022F2B28: ; 0x022F2B28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r7, _022F2F04 ; =ov11_02324CD0
	mov r5, r1
	ldr r0, [r7, #0xc]
	cmp r0, #1
	beq _022F2B58
	cmp r0, #2
	beq _022F2C68
	cmp r0, #3
	beq _022F2D7C
	b _022F2ECC
_022F2B58:
	ldr r0, _022F2F08 ; =0x0000049C
	ldr sb, _022F2F0C ; =ov11_023892A0
	rsb r6, r0, #0x39c
	mov r4, #0
	mov fp, r6
_022F2B6C:
	mov r0, #0x48
	mul r8, r4, r0
	ldr r0, [r5]
	mov r1, #0x480
	add sl, sb, r8
	bl _s32_div_f
	ldr r0, _022F2F10 ; =ov11_023210D4
	ldr r0, [r0, r4, lsl #2]
	sub r0, r0, r1
	str r0, [sb, r8]
	ldr r0, [r5, #4]
	ldr r1, _022F2F08 ; =0x0000049C
	bl _s32_div_f
	ldr r0, _022F2F10 ; =ov11_023210D4
	add r0, r0, r4, lsl #2
	ldr r0, [r0, #0x8c]
	sub r0, r0, r1
	str r0, [sl, #4]
	ldr r0, [sb, r8]
	cmp r0, #0x100
	bgt _022F2BC8
	cmp r0, r6
	bge _022F2BD0
_022F2BC8:
	mov r0, #0x12c
	str r0, [sl]
_022F2BD0:
	ldr r0, [sl, #4]
	cmp r0, #0x100
	bgt _022F2BE4
	cmp r0, fp
	bge _022F2BEC
_022F2BE4:
	mov r0, #0x12c
	str r0, [sl, #4]
_022F2BEC:
	mov r0, #0x48
	mul r8, r4, r0
	add sl, sb, r8
	mov r0, #0
	strb r0, [sl, #0x44]
	ldr r3, _022F2F10 ; =ov11_023210D4
	str r0, [sp]
	str r0, [sp, #4]
	add r3, r3, r4, lsl #2
	ldr r1, [r7, #8]
	ldr r3, [r3, #0x118]
	add r0, sl, #8
	mov r2, #0
	bl sub_0201E7D8
	ldr r0, [sb, r8]
	add r4, r4, #1
	strh r0, [sl, #8]
	ldr r0, [sl, #4]
	cmp r4, #0x23
	strh r0, [sl, #0xa]
	mov r0, #0x34
	strb r0, [sl, #0x37]
	ldrb r0, [sl, #0x45]
	bic r0, r0, #2
	strb r0, [sl, #0x45]
	mov r0, #0x3f
	strb r0, [sl, #0x46]
	mov r0, #0x7e
	strh r0, [sl, #0x32]
	blt _022F2B6C
	b _022F2ECC
_022F2C68:
	ldr r6, _022F2F0C ; =ov11_023892A0
	mov sl, #0
	mvn r4, #0xff
_022F2C74:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, r6, r8
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	ldr r3, [r0, r1, lsl #2]
	ldr r1, [r5]
	mov r0, sl
	mov r2, r1, lsr #0x1f
	rsb r1, r2, r1, lsl #23
	add r1, r2, r1, ror #23
	sub r1, r3, r1
	str r1, [r6, r8]
	mov r1, #5
	bl _s32_div_f
	mov fp, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	add r0, r0, fp, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [r6, r8]
	cmp r0, #0x100
	bgt _022F2CF0
	cmp r0, r4
	bge _022F2CF8
_022F2CF0:
	mov r0, #0x12c
	str r0, [sb]
_022F2CF8:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2D0C
	cmp r0, r4
	bge _022F2D14
_022F2D0C:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2D14:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r1, [r7, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	mov r0, #0x80
	strb r0, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2C74
	b _022F2ECC
_022F2D7C:
	ldrsh r1, [r7, #4]
	cmp r1, #0
	blt _022F2DB4
	ldrsh r0, [r7, #2]
	cmp r0, #0
	movle r0, #0
	ble _022F2DB8
	sub r0, r0, #1
	strh r0, [r7, #2]
	ldrsh r2, [r7, #2]
	mov r0, #0xa0
	smulbb r0, r2, r0
	bl _s32_div_f
	b _022F2DB8
_022F2DB4:
	mov r0, #0xa0
_022F2DB8:
	ldr fp, _022F2F0C ; =ov11_023892A0
	mov sl, #0
	and r6, r0, #0xff
	mvn r4, #0xff
_022F2DC8:
	mov r0, #0x48
	mul r8, sl, r0
	mov r0, sl
	mov r1, #5
	add sb, fp, r8
	bl _s32_div_f
	mov r7, r1
	ldr r0, [r5]
	mov r1, #0xf0
	bl _s32_div_f
	ldr r0, _022F2F18 ; =ov11_02321098
	ldr r2, [r0, r7, lsl #2]
	mov r0, sl
	sub r1, r2, r1
	str r1, [fp, r8]
	mov r1, #5
	bl _s32_div_f
	mov r7, r0
	ldr r0, [r5, #4]
	mov r1, #0x300
	bl _s32_div_f
	ldr r0, _022F2F14 ; =ov11_023210AC
	add r0, r0, r7, lsl #2
	ldr r0, [r0, #0x14]
	sub r0, r0, r1
	str r0, [sb, #4]
	ldr r0, [fp, r8]
	cmp r0, #0x100
	bgt _022F2E44
	cmp r0, r4
	bge _022F2E4C
_022F2E44:
	mov r0, #0x12c
	str r0, [sb]
_022F2E4C:
	ldr r0, [sb, #4]
	cmp r0, #0x100
	bgt _022F2E60
	cmp r0, r4
	bge _022F2E68
_022F2E60:
	mov r0, #0x12c
	str r0, [sb, #4]
_022F2E68:
	mov r0, #0
	strb r0, [sb, #0x44]
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, _022F2F04 ; =ov11_02324CD0
	mov r2, #0
	ldr r1, [r1, #8]
	add r0, sb, #8
	mov r3, r2
	bl sub_0201E7D8
	ldr r0, [sb]
	add sl, sl, #1
	strh r0, [sb, #8]
	ldr r0, [sb, #4]
	cmp sl, #0x19
	strh r0, [sb, #0xa]
	strb r6, [sb, #0x37]
	ldrb r0, [sb, #0x45]
	bic r0, r0, #2
	strb r0, [sb, #0x45]
	mov r0, #0x3f
	strb r0, [sb, #0x46]
	mov r0, #0x7e
	strh r0, [sb, #0x32]
	blt _022F2DC8
_022F2ECC:
	ldr r5, _022F2F0C ; =ov11_023892A0
	mov r6, #0
	mov r4, #0x48
_022F2ED8:
	mla r1, r6, r4, r5
	ldrb r0, [r1, #0x45]
	tst r0, #2
	bne _022F2EF0
	add r0, r1, #8
	bl Render3dElement64
_022F2EF0:
	add r6, r6, #1
	cmp r6, #0x30
	blt _022F2ED8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F2F04: .word ov11_02324CD0
_022F2F08: .word 0x0000049C
_022F2F0C: .word ov11_023892A0
_022F2F10: .word ov11_023210D4
_022F2F14: .word ov11_023210AC
_022F2F18: .word ov11_02321098
	arm_func_end ov11_022F2B28

	arm_func_start ov11_022F2F1C
ov11_022F2F1C: ; 0x022F2F1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _022F2F54 ; =ov11_023892A0
	mov r6, #0
	mov r4, #0x48
_022F2F2C:
	mla r7, r6, r4, r5
	add r0, r7, #8
	bl InitRender3dElement64
	ldrb r0, [r7, #0x45]
	add r6, r6, #1
	cmp r6, #0x30
	orr r0, r0, #2
	strb r0, [r7, #0x45]
	blt _022F2F2C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F2F54: .word ov11_023892A0
	arm_func_end ov11_022F2F1C

	arm_func_start ov11_022F2F58
ov11_022F2F58: ; 0x022F2F58
	stmdb sp!, {r3, lr}
	mov r0, #0x358
	mov r1, #1
	bl MemAlloc
	ldr r2, _022F2FE4 ; =ov11_02324CE0
	mov r1, #0
	str r0, [r2]
	str r1, [r0]
	ldr r0, [r2]
	strh r1, [r0, #4]
	ldr r0, [r2]
	strh r1, [r0, #6]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r1, [r0, #0x38]
	ldr r0, [r2]
	strb r1, [r0, #0x10]
	ldr r0, [r2]
	strb r1, [r0, #0x11]
	ldr r0, [r2]
	strb r1, [r0, #0x12]
	ldr r0, [r2]
	strb r1, [r0, #0x13]
	ldr r0, [r2]
	strb r1, [r0, #0x14]
	ldr r0, [r2]
	strb r1, [r0, #0x16]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	bl ov11_022F3010
	ldr r0, _022F2FE4 ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F2FE4: .word ov11_02324CE0
	arm_func_end ov11_022F2F58

	arm_func_start ov11_022F2FE8
ov11_022F2FE8: ; 0x022F2FE8
	stmdb sp!, {r3, lr}
	bl ov11_022F3010
	ldr r0, _022F300C ; =ov11_02324CE0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F300C ; =ov11_02324CE0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F300C: .word ov11_02324CE0
	arm_func_end ov11_022F2FE8

	arm_func_start ov11_022F3010
ov11_022F3010: ; 0x022F3010
	stmdb sp!, {r3, lr}
	bl ov11_022F4480
	ldr r2, _022F3050 ; =ov11_02324CE0
	mov r3, #0
	ldr r0, [r2]
	mov r1, #0x10
	str r3, [r0]
	ldr r0, [r2]
	strh r3, [r0, #4]
	ldr r0, [r2]
	add r0, r0, #0x300
	strh r3, [r0, #0x38]
	ldr r0, [r2]
	add r0, r0, #0x344
	bl MemZero
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3050: .word ov11_02324CE0
	arm_func_end ov11_022F3010

	arm_func_start ov11_022F3054
ov11_022F3054: ; 0x022F3054
	ldr r0, _022F3088 ; =ov11_02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_022F3088: .word ov11_02324CE0
	arm_func_end ov11_022F3054

	arm_func_start ov11_022F308C
ov11_022F308C: ; 0x022F308C
	ldr r0, _022F30D0 ; =ov11_02324CE0
	ldr r1, [r0]
	add r0, r1, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldrsh r0, [r1, #4]
	cmp r0, #0
	beq _022F30C8
	ldr r0, [r1]
	sub r0, r0, #1
	cmp r0, #1
	movls r0, #1
	bxls lr
_022F30C8:
	mov r0, #0
	bx lr
	.align 2, 0
_022F30D0: .word ov11_02324CE0
	arm_func_end ov11_022F308C

	arm_func_start ov11_022F30D4
ov11_022F30D4: ; 0x022F30D4
	ldr ip, _022F30F8 ; =ov11_02324CE0
	ldr r3, [ip]
	add r3, r3, #0x300
	strh r0, [r3, #0x38]
	ldr r0, [ip]
	str r1, [r0, #0x33c]
	ldr r0, [ip]
	str r2, [r0, #0x340]
	bx lr
	.align 2, 0
_022F30F8: .word ov11_02324CE0
	arm_func_end ov11_022F30D4

	arm_func_start ov11_022F30FC
ov11_022F30FC: ; 0x022F30FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	ldr r6, _022F37C4 ; =ov11_02324CE0
	ldr r2, [r6]
	ldr r0, [r2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F311C: ; jump table
	b _022F350C ; case 0
	b _022F373C ; case 1
	b _022F3130 ; case 2
	b _022F373C ; case 3
	b _022F373C ; case 4
_022F3130:
	ldrsh r0, [r2, #4]
	cmp r0, #0x17
	addls pc, pc, r0, lsl #2
	b _022F373C
_022F3140: ; jump table
	b _022F373C ; case 0
	b _022F31A0 ; case 1
	b _022F373C ; case 2
	b _022F373C ; case 3
	b _022F3298 ; case 4
	b _022F3298 ; case 5
	b _022F3298 ; case 6
	b _022F3360 ; case 7
	b _022F373C ; case 8
	b _022F373C ; case 9
	b _022F3474 ; case 10
	b _022F373C ; case 11
	b _022F373C ; case 12
	b _022F3360 ; case 13
	b _022F3360 ; case 14
	b _022F373C ; case 15
	b _022F32FC ; case 16
	b _022F337C ; case 17
	b _022F337C ; case 18
	b _022F3360 ; case 19
	b _022F31A0 ; case 20
	b _022F3298 ; case 21
	b _022F3360 ; case 22
	b _022F3280 ; case 23
_022F31A0:
	add r1, r2, #0x100
	ldrh r3, [r1, #0xae]
	ldr r2, _022F37C8 ; =0x0000F3FF
	mov r4, #0x800
	orr r3, r3, #0x200
	strh r3, [r1, #0xae]
	ldr r1, [r6]
	mov r0, #0
	add r1, r1, #0x100
	strh r2, [r1, #0xa0]
	ldr r3, [r6]
	mov r1, r0
	add r3, r3, #0x100
	strh r4, [r3, #0xa6]
	ldr r5, [r6]
	mov r3, r0
	add r5, r5, #0x100
	strh r2, [r5, #0xa4]
	ldr r5, [r6]
	mov r2, #1
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #0
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #1
	str r0, [sp]
	mov r1, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r2, r4
	str r2, [sp, #8]
	bl sub_02009358
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, r4
	add r0, r0, #0x1a0
	bl SetAnimDataFields2
	mov r0, r6
	ldr r3, [r0]
	mov r2, r4
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3280:
	mov r1, #0
	str r1, [r2, #0x32c]
	ldr r0, [r6]
	str r1, [r0, #0x330]
	ldr r0, [r6]
	str r1, [r0, #0x334]
_022F3298:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	ldr r5, _022F37C4 ; =ov11_02324CE0
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F32B4:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F32B4
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F32FC:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	mov r6, #0
	str r0, [r5, #4]
	mov r4, #0xc4
_022F3318:
	ldr r0, [r5, #4]
	ldr r1, [r5]
	mla r0, r6, r4, r0
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F3318
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3360:
	strh r0, [r2, #6]
	ldr r0, [r6]
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r6]
	str r1, [r0]
	b _022F373C
_022F337C:
	add r0, r2, #0x1a0
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0x800
	mov r2, #0
	add r0, r0, #0x264
	bl SetAnimDataFields2
	mov r7, r6
	ldr r1, [r7]
	ldr r5, _022F37C8 ; =0x0000F3FF
	add r2, r1, #0x100
	ldrh r3, [r2, #0xae]
	mov r4, #0x800
	mov r0, #0
	orr r3, r3, #0x200
	strh r3, [r2, #0xae]
	ldr r3, [r7]
	mov r1, r0
	add r3, r3, #0x100
	strh r5, [r3, #0xa0]
	ldr r6, [r7]
	mov r2, #1
	add r6, r6, #0x100
	strh r4, [r6, #0xa6]
	ldr r6, [r7]
	mov r3, r0
	add r6, r6, #0x100
	strh r5, [r6, #0xa4]
	ldr r5, [r7]
	add r5, r5, #0x100
	strh r4, [r5, #0xaa]
	bl sub_020091F8
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, r0
	mov r2, r0
	str r0, [sp, #8]
	bl sub_02009358
	mov r0, r7
	ldr r3, [r0]
	mov r2, #0
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F3474:
	mov r0, #0x3100
	mov r1, #1
	bl MemAlloc
	mov r5, r6
	ldr r6, _022F37CC ; =0x00000802
	mov r8, #0
	str r0, [r5, #4]
	mov sl, r8
	sub r7, r6, #1
	mov r4, #0xc4
_022F349C:
	mul sb, r8, r4
	ldr r0, [r5, #4]
	ldr r1, [r5]
	add r0, r0, sb
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	cmp r8, #4
	movlt r1, r7
	movge r1, r6
	ldr r0, [r5, #4]
	mov r1, r1, lsl #0x10
	mov r2, sl
	add r0, r0, sb
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F349C
	ldr r0, _022F37C4 ; =ov11_02324CE0
	mov r2, #0
	ldr r3, [r0]
	ldrsh r1, [r3, #4]
	strh r1, [r3, #6]
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	b _022F373C
_022F350C:
	add r0, r2, #0x300
	ldrsh r0, [r0, #0x38]
	cmp r0, #0
	beq _022F373C
	strh r0, [r2, #4]
	ldr r2, [r6]
	mov r0, #0
	ldr r1, [r2, #0x33c]
	str r1, [r2, #8]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0xc]
	ldr r1, [r6]
	add r1, r1, #0x300
	strh r0, [r1, #0x38]
	ldr r2, [r6]
	ldrsh r1, [r2, #4]
	cmp r1, #0x22
	addls pc, pc, r1, lsl #2
	b _022F3734
_022F355C: ; jump table
	b _022F3734 ; case 0
	b _022F35F8 ; case 1
	b _022F35F0 ; case 2
	b _022F35E8 ; case 3
	b _022F35F8 ; case 4
	b _022F35F8 ; case 5
	b _022F35F8 ; case 6
	b _022F35F8 ; case 7
	b _022F3734 ; case 8
	b _022F3734 ; case 9
	b _022F35F8 ; case 10
	b _022F3734 ; case 11
	b _022F3734 ; case 12
	b _022F3604 ; case 13
	b _022F35F8 ; case 14
	b _022F3734 ; case 15
	b _022F35F8 ; case 16
	b _022F35F8 ; case 17
	b _022F35F8 ; case 18
	b _022F35F8 ; case 19
	b _022F35F8 ; case 20
	b _022F35F8 ; case 21
	b _022F35F8 ; case 22
	b _022F35F8 ; case 23
	b _022F3610 ; case 24
	b _022F3638 ; case 25
	b _022F3650 ; case 26
	b _022F365C ; case 27
	b _022F3678 ; case 28
	b _022F3698 ; case 29
	b _022F36AC ; case 30
	b _022F36D4 ; case 31
	b _022F36F4 ; case 32
	b _022F3704 ; case 33
	b _022F3714 ; case 34
_022F35E8:
	bl ov11_022F4480
	b _022F373C
_022F35F0:
	bl ov11_022F4480
	b _022F373C
_022F35F8:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3604:
	mov r0, #1
	str r0, [r2]
	b _022F373C
_022F3610:
	mov r0, #1
	bl sub_0206AA5C
	bl sub_0206AB98
	mov r0, #0
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x354]
	b _022F373C
_022F3638:
	ldrb r1, [r2, #0x354]
	cmp r1, #0
	moveq r0, #1
	and r0, r0, #0xff
	bl ov11_022F44D0
	b _022F373C
_022F3650:
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F365C:
	bl ov10_022C3138
	mov r1, r6
	ldr r1, [r1]
	mov r0, #1
	strb r0, [r1, #0x354]
	bl ov11_022F44D0
	b _022F373C
_022F3678:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x344]
	ldr r2, [r6]
	ldr r1, [r2, #0x340]
	str r1, [r2, #0x348]
	bl ov11_022F44D0
	b _022F373C
_022F3698:
	ldr r1, [r2, #0x33c]
	mov r0, #1
	str r1, [r2, #0x34c]
	bl ov11_022F44D0
	b _022F373C
_022F36AC:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r1, [r0, #0x34c]
	ldr r2, [r0, #0x350]
	add r0, r0, #0x344
	bl ov10_022C328C
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36D4:
	ldr r0, [r2, #0x33c]
	str r0, [r2, #0x350]
	ldr r0, [r6]
	ldr r0, [r0, #0x350]
	bl ov10_022C3324
	mov r0, #0
	bl ov11_022F44D0
	b _022F373C
_022F36F4:
	bl ov10_022C3890
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3704:
	bl ov11_022F4480
	mov r0, #1
	bl ov11_022F44D0
	b _022F373C
_022F3714:
	mov r1, #1
	str r1, [r2]
	bl ov11_022F44D0
	mov r0, r6
	ldr r0, [r0]
	mov r1, #0
	strb r1, [r0, #0x354]
	b _022F373C
_022F3734:
	mov r0, #0
	strh r0, [r2, #4]
_022F373C:
	ldr r0, _022F37C4 ; =ov11_02324CE0
	ldr r1, [r0]
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F37BC
_022F3758: ; jump table
	b _022F3778 ; case 0
	b _022F3778 ; case 1
	b _022F3794 ; case 2
	b _022F37BC ; case 3
	b _022F379C ; case 4
	b _022F379C ; case 5
	b _022F379C ; case 6
	b _022F379C ; case 7
_022F3778:
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	beq _022F378C
	bl sub_0206AD80
	b _022F37BC
_022F378C:
	bl ov11_022F44F8
	b _022F37BC
_022F3794:
	bl sub_0206ADB8
	b _022F37BC
_022F379C:
	bl ov10_022C3378
	cmp r0, #0
	beq _022F37BC
	sub r0, r0, #2
	cmp r0, #1
	bhi _022F37B8
	bl ov11_022F44F8
_022F37B8:
	bl ov10_022C34F0
_022F37BC:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F37C4: .word ov11_02324CE0
_022F37C8: .word 0x0000F3FF
_022F37CC: .word 0x00000802
	arm_func_end ov11_022F30FC

	arm_func_start ov11_022F37D0
ov11_022F37D0: ; 0x022F37D0
#ifdef EUROPE
#define OV11_022F37D0_LOAD_OFFSET 0x10
#else
#define OV11_022F37D0_LOAD_OFFSET 0
#endif
	stmdb sp!, {r3, lr}
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r3, [r0]
	ldr r0, [r3]
	cmp r0, #1
	bne _022F3DE0
	ldrsh r0, [r3, #4]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	b _022F3DE0
_022F37F8: ; jump table
	b _022F3DE0 ; case 0
	b _022F38AC ; case 1
	b _022F3DE0 ; case 2
	b _022F3DE0 ; case 3
	b _022F38DC ; case 4
	b _022F393C ; case 5
	b _022F399C ; case 6
	b _022F3B80 ; case 7
	b _022F3DE0 ; case 8
	b _022F3DE0 ; case 9
	b _022F3D50 ; case 10
	b _022F3DE0 ; case 11
	b _022F3DE0 ; case 12
	b _022F3BEC ; case 13
	b _022F3BBC ; case 14
	b _022F3DE0 ; case 15
	b _022F3A44 ; case 16
	b _022F3C64 ; case 17
	b _022F3CD0 ; case 18
	b _022F3A98 ; case 19
	b _022F38AC ; case 20
	b _022F39F0 ; case 21
	b _022F3884 ; case 22
	b _022F399C ; case 23
	b _022F3DE0 ; case 24
	b _022F3DE0 ; case 25
	b _022F3DE0 ; case 26
	b _022F3DE0 ; case 27
	b _022F3DE0 ; case 28
	b _022F3DE0 ; case 29
	b _022F3DE0 ; case 30
	b _022F3DE0 ; case 31
	b _022F3DE0 ; case 32
	b _022F3DE0 ; case 33
	b _022F3DB0 ; case 34
_022F3884:
	mov r0, #0xe
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38AC:
	ldr r1, _022F3E4C ; =0x0000012D
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r3, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F38DC:
	mov r0, #1
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F393C:
	mov r0, #2
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E50 ; =0x08080000
	ldr r0, [r0]
	mov r1, #0xbd + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F399C:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #3
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xb6 + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F39F0:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #4
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E54 ; =0x08080005
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xbe + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A44:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #0x12
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
#ifdef EUROPE
	mov r1, #0x230
#else
	ldr r1, _022F3E58 ; =0x00000222
#endif
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	mov r2, #0x8000000
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3A98:
	bl ov16_0238CC94
	ldr r1, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x33c]
	bl ov16_0238CCA8
	ldr r1, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r1]
	str r0, [r1, #0x340]
	mov r0, #0x11
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E5C ; =0x0B040000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E5C ; =0x0B040000
	ldr r1, [r0]
	add r0, r1, #0xdc
	ldr r1, [r1, #0x340]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5BBC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, #0x18
	bl SetAnimDataFields2
	bl ov16_0238CCA8
	bl FemaleToMaleForm
	ldr r1, _022F3E60 ; =0x00000807
	bl GetIdleAnimationType
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #0
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl SetAnimDataFields2
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x13]
	ldr r2, [r0]
	strb r3, [r2, #0x14]
	ldr r2, [r0]
	strb r3, [r2, #0x16]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3B80:
	mov r0, #5
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BBC:
	ldr r1, [r3, #0x33c]
	ldr r2, [r3, #0x340]
	mov r0, #7
	bl ov11_02313DF4
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3BEC:
	bl ov11_02314684
	cmp r0, #0
	beq _022F3C28
	bl ov11_023146B0
	cmp r0, #0
	bne _022F3C10
	ldr r0, _022F3E64 ; =ov11_02321340
	bl Debug_Print0
	b _022F3DE0
_022F3C10:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023146D4
	b _022F3C44
_022F3C28:
	mov r0, #0xc
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
_022F3C44:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x10]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3C64:
	mov r0, #0xf
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _022F3E68 ; =0x0C080000
	strb r3, [r1, #0x10]
	ldr r0, [r0]
	mov r1, #0xee + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xef + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x264
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3CD0:
	mov r0, #0x10
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xec + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r2, _022F3E68 ; =0x0C080000
	ldr r0, [r0]
	mov r1, #0xed + OV11_022F37D0_LOAD_OFFSET
	add r0, r0, #0x264
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r2, [r0]
	strb r3, [r2, #0x12]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3D50:
	mov r0, #8
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, _022F3E6C ; =0x0000010D
	ldr r0, [r0]
	ldr r2, _022F3E50 ; =0x08080000
	add r0, r0, #0x1a0
	bl LoadObjectAnimData
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r3, #1
	ldr r2, [r0]
	mov r1, #2
	strb r3, [r2, #0x11]
	ldr r0, [r0]
	str r1, [r0]
	b _022F3DE0
_022F3DB0:
	mov r0, #0xb
	bl ov11_02314670
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldr r0, [r1, #0x33c]
	ldr r1, [r1, #0x340]
	bl ov11_023159CC
	ldr r0, _022F3E48 ; =ov11_02324CE0
#ifdef JAPAN
	mov r3, #2
	ldr r2, [r0]
	mov r1, #1
	str r3, [r2]
	ldr r0, [r0]
	strb r1, [r0, #0x11]
#else
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0]
#endif
	bl ov11_022F44F8
_022F3DE0:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	ldr r1, [r0]
	ldrb r0, [r1, #0x354]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrsh r0, [r1, #6]
	sub r0, r0, #0x18
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _022F3E34
_022F3E08: ; jump table
	b _022F3E28 ; case 0
	b _022F3E28 ; case 1
	b _022F3E28 ; case 2
	b _022F3E30 ; case 3
	b _022F3E30 ; case 4
	b _022F3E30 ; case 5
	b _022F3E30 ; case 6
	b _022F3E30 ; case 7
_022F3E28:
	bl sub_0206ABB0
	b _022F3E34
_022F3E30:
	bl ov10_022C31A4
_022F3E34:
	ldr r0, _022F3E48 ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x354]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F3E48: .word ov11_02324CE0
_022F3E4C: .word 0x0000012D + OV11_022F37D0_LOAD_OFFSET
_022F3E50: .word 0x08080000
_022F3E54: .word 0x08080005
#ifndef EUROPE
_022F3E58: .word 0x00000222
#endif
_022F3E5C: .word 0x0B040000
_022F3E60: .word 0x00000807
_022F3E64: .word ov11_02321340
_022F3E68: .word 0x0C080000
_022F3E6C: .word 0x0000010D + OV11_022F37D0_LOAD_OFFSET
	arm_func_end ov11_022F37D0

	arm_func_start ov11_022F3E70
ov11_022F3E70: ; 0x022F3E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _022F434C ; =ov11_02324CE0
	ldr r2, [r3]
	ldrsh r0, [r2, #6]
	cmp r0, #0x22
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3E8C: ; jump table
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 0
	b _022F3F18 ; case 1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 3
	b _022F3F38 ; case 4
	b _022F3F38 ; case 5
	b _022F3F38 ; case 6
	b _022F41C0 ; case 7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 9
	b _022F426C ; case 10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 11
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 12
	b _022F41C0 ; case 13
	b _022F41C0 ; case 14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 15
	b _022F3FF4 ; case 16
	b _022F41D0 ; case 17
	b _022F41D0 ; case 18
	b _022F40D0 ; case 19
	b _022F3F18 ; case 20
	b _022F3F38 ; case 21
	b _022F41C0 ; case 22
	b _022F3F38 ; case 23
	b _022F41C8 ; case 24
	b _022F41C8 ; case 25
	b _022F41C8 ; case 26
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 27
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 29
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 31
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 32
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc} ; case 33
	b _022F4344 ; case 34
_022F3F18:
	mov r4, #0x8000
	str r4, [r3, #8]
	add r0, r2, #0x1a0
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r2, #0
	str r4, [r3, #0xc]
	bl AnimRelatedFunction__022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3F38:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov sl, #0xc4
	ldr r6, _022F4350 ; =ov11_02324CE8
	ldr r4, _022F434C ; =ov11_02324CE0
	mov r7, r8
	mov r5, r8
	mov sb, sl
_022F3F60:
	mov r0, r8
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	cmpne r1, #0
	beq _022F3FE4
	ldmib r0, {r3, fp}
	mov r2, r3, asr #0xb
	mov r1, fp, asr #0xb
	add r2, r3, r2, lsr #20
	add r1, fp, r1, lsr #20
	mov r2, r2, asr #0xc
	mov r3, r1, asr #0xc
	mov r1, r2, lsl #8
	str r1, [r4, #8]
	mov r1, r3, lsl #8
	str r1, [r4, #0xc]
	ldrh r1, [r0, #0x14]
	cmp r1, #8
	bhs _022F3FD0
	ldr r2, [r4, #4]
	ldr r1, [r0, #0xc]
	mla r0, r8, sl, r2
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r2, r7
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
_022F3FD0:
	ldr r0, [r4, #4]
	mov r1, r6
	mla r0, r8, sb, r0
	mov r2, r5
	bl AnimRelatedFunction__022F6F14
_022F3FE4:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F3F60
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F3FF4:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov sb, #0
	mov r5, #0xc4
	ldr r6, _022F434C ; =ov11_02324CE0
	mov fp, sb
	mov r7, #1
	mov r4, r5
_022F4018:
	mov r0, sb
	bl ov11_023159B0
	mov r8, r0
	ldrh r0, [r8]
	cmp r0, #0xff
	beq _022F40C0
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	bne _022F4088
	mul sl, sb, r5
	ldr r0, [r6, #4]
	ldr r1, [r6]
	add r0, r0, sl
	add r1, r1, #0x1a0
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r6, #4]
	ldr r1, [r8, #0xc]
	add r0, r0, sl
	bl ov11_022F4974
	ldr r0, [r6, #4]
	ldrh r1, [r8, #0x14]
	add r0, r0, sl
	mov r2, fp
	add r1, r1, #0x800
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	strh r7, [r8, #0x16]
_022F4088:
	ldr r0, [r8, #8]
	cmp r0, #0xf000
	bls _022F40C0
	ldr r0, [r8, #4]
	ldr r1, _022F4350 ; =ov11_02324CE8
	sub r0, r0, #0x2000
	str r0, [r6, #8]
	ldr r0, [r8, #8]
	mov r2, #0
	sub r0, r0, #0x11000
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, sb, r4, r0
	bl AnimRelatedFunction__022F6F14
_022F40C0:
	add sb, sb, #1
	cmp sb, #0x40
	blt _022F4018
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F40D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldr r1, _022F434C ; =ov11_02324CE0
	mov r2, #0x8100
	mov r4, r0
	str r2, [r1, #8]
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _022F414C
	ldr r0, [r1]
	ldr r0, [r0, #0x33c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl FemaleToMaleForm
	ldr r1, _022F4354 ; =0x00000807
	bl GetIdleAnimationType
	ldrh r2, [r4, #0x10]
	ldr r1, _022F434C ; =ov11_02324CE0
	mov r2, r2, lsr #2
	add r2, r2, #4
	and r2, r2, #7
	ldr r3, [r1]
	mov r1, r0, lsl #0x10
	mov r2, r2, lsl #0x18
	add r0, r3, #0x18
	mov r1, r1, asr #0x10
	mov r2, r2, asr #0x18
	bl SetAnimDataFields2
_022F414C:
	ldr r1, [r4, #8]
	ldr r0, _022F434C ; =ov11_02324CE0
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	ldr r2, _022F4350 ; =ov11_02324CE8
	ldr r1, [r0, #0x33c]
	add r0, r0, #0x18
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r3, #0
	bl ov11_022F5C94
	ldr r0, _022F434C ; =ov11_02324CE0
	mov r1, #0x8100
	str r1, [r0, #8]
	ldr r1, [r4, #4]
	ldr r2, _022F4350 ; =ov11_02324CE8
	rsb r1, r1, #0xf0
	mov r1, r1, lsl #8
	str r1, [r0, #0xc]
	ldr r0, [r0]
	mov r3, #0
	ldr r1, [r0, #0x340]
	add r0, r0, #0xdc
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022F5C94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C0:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41C8:
	bl sub_0206B9DC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F41D0:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	bl ov11_0231598C
	ldrh r1, [r0]
	cmp r1, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =ov11_02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x1a0
	bl AnimRelatedFunction__022F6F14
	mov r0, #1
	bl ov11_0231598C
	ldr r1, [r0, #4]
	ldr r2, _022F434C ; =ov11_02324CE0
	mov r1, r1, lsr #0xc
	mov r1, r1, lsl #8
	str r1, [r2, #8]
	ldr r0, [r0, #8]
	ldr r1, _022F4350 ; =ov11_02324CE8
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r2, #0xc]
	ldr r0, [r2]
	mov r2, #0
	add r0, r0, #0x264
	bl AnimRelatedFunction__022F6F14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F426C:
	bl ov11_0231474C
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, #0
	mov r5, #0xc4
	ldr fp, _022F4350 ; =ov11_02324CE8
	ldr r6, _022F434C ; =ov11_02324CE0
	mov r7, r8
	mov r4, r5
_022F4290:
	mov r0, r8
	bl ov11_0231598C
	mov sb, r0
	ldrh r1, [sb]
	cmp r1, #0xff
	beq _022F4334
	ldrh r0, [sb, #0x14]
	cmp r0, #2
	bhs _022F4300
	mul sl, r8, r5
	add r0, r1, #0x800
	ldr r3, [r6, #4]
	mov r1, r0, lsl #0x10
	mov r2, r7
	add r0, r3, sl
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #29
	add r0, r1, r0, ror #29
	ldr r1, [r6, #4]
	mov r0, r0, lsl #0x10
	mov r2, r0, asr #0x10
	add r0, r1, sl
	strh r2, [r0, #0x14]
	ldr r0, [r6, #4]
	add r0, r0, sl
	strh r2, [r0, #0x16]
_022F4300:
	ldr r0, [sb, #4]
	mov r1, fp
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #8]
	ldr r0, [sb, #8]
	mov r2, #0
	mov r0, r0, lsr #0xc
	mov r0, r0, lsl #8
	str r0, [r6, #0xc]
	ldr r0, [r6, #4]
	mla r0, r8, r4, r0
	bl AnimRelatedFunction__022F6F14
_022F4334:
	add r8, r8, #1
	cmp r8, #0x40
	blt _022F4290
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022F4344:
	bl ov11_0231474C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F434C: .word ov11_02324CE0
_022F4350: .word ov11_02324CE8
_022F4354: .word 0x00000807
	arm_func_end ov11_022F3E70

	arm_func_start ov11_022F4358
ov11_022F4358: ; 0x022F4358
	bx lr
	arm_func_end ov11_022F4358

	arm_func_start ov11_022F435C
ov11_022F435C: ; 0x022F435C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x11]
	cmp r1, #0
	beq _022F4388
	mov r1, #0
	strb r1, [r2, #0x11]
	ldr r0, [r0]
	add r0, r0, #0x1a0
	bl ov11_022F6EFC
_022F4388:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x12]
	cmp r1, #0
	beq _022F43B0
	mov r1, #0
	strb r1, [r2, #0x12]
	ldr r0, [r0]
	add r0, r0, #0x264
	bl ov11_022F6EFC
_022F43B0:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x13]
	cmp r1, #0
	beq _022F43D8
	mov r1, #0
	strb r1, [r2, #0x13]
	ldr r0, [r0]
	add r0, r0, #0x18
	bl ov11_022F6EFC
_022F43D8:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	beq _022F4400
	mov r1, #0
	strb r1, [r2, #0x14]
	ldr r0, [r0]
	add r0, r0, #0xdc
	bl ov11_022F6EFC
_022F4400:
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r2, [r0]
	ldrb r1, [r2, #0x16]
	cmp r1, #0
	beq _022F4430
	mov r1, #0
	strb r1, [r2, #0x16]
	ldr r0, [r0]
	ldr r0, [r0, #0x328]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_022F4430:
	ldr r5, _022F447C ; =ov11_02324CE0
	ldr r0, [r5, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	mov r4, #0xc4
_022F4448:
	ldr r0, [r5, #4]
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #0x40
	blt _022F4448
	ldr r0, _022F447C ; =ov11_02324CE0
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F447C ; =ov11_02324CE0
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F447C: .word ov11_02324CE0
	arm_func_end ov11_022F435C

	arm_func_start ov11_022F4480
ov11_022F4480: ; 0x022F4480
	stmdb sp!, {r3, lr}
	ldr r0, _022F44CC ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #6]
	bl sub_0206BA5C
	bl ov10_022C3890
	bl ov11_022F435C
	ldr r0, _022F44CC ; =ov11_02324CE0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl ov11_023146F8
	ldr r0, _022F44CC ; =ov11_02324CE0
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44CC: .word ov11_02324CE0
	arm_func_end ov11_022F4480

	arm_func_start ov11_022F44D0
ov11_022F44D0: ; 0x022F44D0
	stmdb sp!, {r3, lr}
	ldr r1, _022F44F4 ; =ov11_02324CE0
	cmp r0, #0
	ldr r1, [r1]
	ldrsh r0, [r1, #4]
	strh r0, [r1, #6]
	ldmeqia sp!, {r3, pc}
	bl ov11_022F44F8
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F44F4: .word ov11_02324CE0
	arm_func_end ov11_022F44D0

	arm_func_start ov11_022F44F8
ov11_022F44F8: ; 0x022F44F8
	ldr r0, _022F4514 ; =ov11_02324CE0
	mov r2, #0
	ldr r1, [r0]
	strh r2, [r1, #4]
	ldr r0, [r0]
	str r2, [r0]
	bx lr
	.align 2, 0
_022F4514: .word ov11_02324CE0
	arm_func_end ov11_022F44F8

	arm_func_start ov11_022F4518
ov11_022F4518: ; 0x022F4518
	stmdb sp!, {r3, lr}
	mov r0, #0x380
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F467C ; =ov11_02324CF0
	mov r1, #0x1c0
	str r0, [r2]
	mov r0, #0x2c0
	mov r2, #0
	bl ov10_022BDA84
	mov r0, #0x8000
	mov r1, #0xb
	bl ov10_022BDB80
	mov r0, #0x3c0
	bl sub_0205882C
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r2, #0x20
	ldr r0, [r0]
	mov r1, #0
	str r2, [sp]
	mov r2, #0x2c0
	add r3, r0, #0x20
	bl ov11_022F5B88
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r2, #0x10
	ldr r3, [r0]
	mov r1, #0
	str r2, [sp]
	add r0, r3, #0x10
	add r3, r3, #0x120
	mov r2, #0x7c
	bl ov11_022F5B88
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r1, #0
	ldr r0, [r0]
	mov r3, r1
	add r2, r0, #0x1a0
_022F45AC:
	add r0, r1, #1
	str r3, [r2]
	add r1, r1, #4
	mov r0, r0, lsl #0x10
	str r1, [r2, #4]
	mov r1, r0, asr #0x10
	str r3, [r2, #8]
	cmp r1, #0x1c
	add r2, r2, #0xc
	blt _022F45AC
	ldr r0, _022F467C ; =ov11_02324CF0
	mov r1, #0
	ldr r0, [r0]
	add r2, r0, #0x2f0
_022F45E4:
	add r0, r3, #1
	stmia r2, {r1, r3}
	mov r0, r0, lsl #0x10
	mov r3, r0, asr #0x10
	str r1, [r2, #8]
	cmp r3, #0xc
	add r2, r2, #0xc
	blt _022F45E4
	ldr r0, _022F4680 ; =ov11_0238A034
	bl InitOamAdjustmentInfo
	ldr r0, _022F4684 ; =ov11_0238A040
	bl InitOamAdjustmentInfo
	ldr r1, _022F4688 ; =ov11_0238A020
	mov r2, #2
	ldrh ip, [r1, #0x18]
	mov r3, #0
	sub r0, r2, #3
	bic ip, ip, #0xc00
	strh ip, [r1, #0x18]
	ldrh ip, [r1, #0x1e]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x1e]
	ldrh ip, [r1, #0x24]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x24]
	ldrh ip, [r1, #0x2a]
	bic ip, ip, #0xc00
	strh ip, [r1, #0x2a]
	ldrh ip, [r1, #0x2a]
	orr ip, ip, #0x800
	strh ip, [r1, #0x2a]
	str r3, [r1, #4]
	str r2, [r1, #8]
	str r3, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F467C: .word ov11_02324CF0
_022F4680: .word ov11_0238A034
_022F4684: .word ov11_0238A040
_022F4688: .word ov11_0238A020
	arm_func_end ov11_022F4518

	arm_func_start ov11_022F468C
ov11_022F468C: ; 0x022F468C
	stmdb sp!, {r3, lr}
	mov r2, #0
	ldr r1, _022F46B0 ; =ov11_0238A020
	sub r0, r2, #1
	str r2, [r1]
	bl ov11_022F46B4
	mvn r0, #0
	bl ov11_022F4734
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F46B0: .word ov11_0238A020
	arm_func_end ov11_022F468C

	arm_func_start ov11_022F46B4
ov11_022F46B4: ; 0x022F46B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F472C ; =ov11_0238A05C
	mov r5, r0
	mov r0, r4
	bl InitOamAdjustmentInfo
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r3, [r4, #4]
	beq _022F4700
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =ov11_0238A020
	bic r3, r3, #0xc00
	mov r1, #3
	orr r2, r2, #0xc00
	b _022F471C
_022F4700:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	ldr r0, _022F4730 ; =ov11_0238A020
	bic r3, r3, #0xc00
	mov r1, #2
	orr r2, r2, #0x800
_022F471C:
	strh r3, [r4, #4]
	strh r2, [r4, #0xa]
	str r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F472C: .word ov11_0238A05C
_022F4730: .word ov11_0238A020
	arm_func_end ov11_022F46B4

	arm_func_start ov11_022F4734
ov11_022F4734: ; 0x022F4734
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _022F47B4 ; =ov11_0238A068
	mov r5, r0
	mov r0, r4
	bl InitOamAdjustmentInfo
	mov r0, r5
	bl sub_02065014
	cmp r0, #0
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #4]
	beq _022F4788
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =ov11_0238A020
	orr r1, r1, #0xc00
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #3
	b _022F47AC
_022F4788:
	bic r1, r1, #0xc00
	strh r1, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	bic r2, r2, #0xc00
	ldr r0, _022F47B8 ; =ov11_0238A020
	orr r1, r1, #0x800
	strh r1, [r4, #0xa]
	strh r2, [r4, #4]
	mov r1, #2
_022F47AC:
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F47B4: .word ov11_0238A068
_022F47B8: .word ov11_0238A020
	arm_func_end ov11_022F4734

	arm_func_start ov11_022F47BC
ov11_022F47BC: ; 0x022F47BC
	ldr r3, _022F47E8 ; =ov11_0238A05C
	ldr r2, _022F47EC ; =ov11_0238A068
	mov r1, #6
_022F47C8:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F47C8
	ldr r0, _022F47F0 ; =ov11_0238A020
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_022F47E8: .word ov11_0238A05C
_022F47EC: .word ov11_0238A068
_022F47F0: .word ov11_0238A020
	arm_func_end ov11_022F47BC

	arm_func_start ov11_022F47F4
ov11_022F47F4: ; 0x022F47F4
	stmdb sp!, {r3, lr}
	bl ov10_022BDC0C
	ldr r0, _022F4818 ; =ov11_02324CF0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F4818 ; =ov11_02324CF0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F4818: .word ov11_02324CF0
	arm_func_end ov11_022F47F4

	arm_func_start SetAnimDataFields
SetAnimDataFields: ; 0x022F481C
	strh r1, [r0, #0x90]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	bne _022F4860
	tst r1, #2
	movne r2, #0
	moveq r2, #0x38
	tst r1, #4
	movne r3, #0x38
	moveq r3, #0
	tst r1, #1
	movne ip, #8
	moveq ip, #0
	add r1, r3, r2
	add r1, ip, r1
	add r1, r1, #0x38
	str r1, [r0, #0xa8]
_022F4860:
	ldrh r1, [r0, #0x90]
	mov r2, #6
	tst r1, #0x10
	beq _022F488C
	ldr ip, _022F4948 ; =ov11_0238A034
	mov r3, r0
_022F4878:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F4878
	b _022F48EC
_022F488C:
	tst r1, #8
	beq _022F48B0
	ldr ip, _022F494C ; =ov11_0238A040
	mov r3, r0
_022F489C:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F489C
	b _022F48EC
_022F48B0:
	tst r1, #0x8000
	beq _022F48D4
	ldr ip, _022F4950 ; =ov11_0238A068
	mov r3, r0
_022F48C0:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48C0
	b _022F48EC
_022F48D4:
	ldr ip, _022F4954 ; =ov11_0238A05C
	mov r3, r0
_022F48DC:
	ldrh r1, [ip], #2
	subs r2, r2, #1
	strh r1, [r3], #2
	bne _022F48DC
_022F48EC:
	ldrh r2, [r0]
	ldr r1, _022F4958 ; =0x0000F3FF
	and r2, r2, r1
	strh r2, [r0]
	ldrh r2, [r0, #6]
	and r1, r2, r1
	strh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x40
	ldrneh r1, [r0, #6]
	orrne r1, r1, #0x400
	strneh r1, [r0, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x20
	beq _022F493C
	ldrsh r1, [r0, #0xb0]
	cmp r1, #0
	ldreqsh r1, [r0, #0xb4]
	streqh r1, [r0, #0xb0]
	bx lr
_022F493C:
	mov r1, #0
	strh r1, [r0, #0xb0]
	bx lr
	.align 2, 0
_022F4948: .word ov11_0238A034
_022F494C: .word ov11_0238A040
_022F4950: .word ov11_0238A068
_022F4954: .word ov11_0238A05C
_022F4958: .word 0x0000F3FF
	arm_func_end SetAnimDataFields

	arm_func_start SetAnimDataFieldsWrapper
SetAnimDataFieldsWrapper: ; 0x022F495C
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	ldr ip, _022F4970 ; =SetAnimDataFields
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_022F4970: .word SetAnimDataFields
	arm_func_end SetAnimDataFieldsWrapper

	arm_func_start ov11_022F4974
ov11_022F4974: ; 0x022F4974
	ldrh r2, [r0, #0x90]
	tst r2, #0x2000
	strne r1, [r0, #0xa8]
	bx lr
	arm_func_end ov11_022F4974

	arm_func_start ov11_022F4984
ov11_022F4984: ; 0x022F4984
	strh r1, [r0, #0xb2]
	strh r2, [r0, #0xb4]
	bx lr
	arm_func_end ov11_022F4984

#ifdef JAPAN
	arm_func_start ov11_022F5FE8_JP
ov11_022F5FE8_JP: ; 0x022F5FE8
	ldrsh r1, [r0, #0x92]
	cmp r1, #0
	bge _022F600C
	ldrsh r0, [r0, #0x8c]
	cmp r0, #0
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	bx lr
_022F600C:
	mov r0, #0
	bx lr
	arm_func_end ov11_022F5FE8_JP
#endif

	arm_func_start ov11_022F4990
ov11_022F4990: ; 0x022F4990
	stmdb sp!, {r3, lr}
	ldrsh r1, [r0, #0x92]
	cmp r1, #0
	movlt r0, #0
	ldmltia sp!, {r3, pc}
	add r0, r0, #0xc
	bl sub_0201D1B0
	ldmia sp!, {r3, pc}
	arm_func_end ov11_022F4990

	arm_func_start ov11_022F49B0
ov11_022F49B0: ; 0x022F49B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsh r0, [r4, #0x9e]
	cmp r0, #0
	beq _022F4A0C
	ldrsh r1, [r4, #0x9c]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrsh r1, [r4, #0xa2]
	cmp r1, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mvn r0, #0
	strh r0, [r4, #0xa2]
	mov r0, #0
	strh r0, [r4, #0x9e]
_022F4A0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F49B0

	arm_func_start ov11_022F4A14
ov11_022F4A14: ; 0x022F4A14
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4, #0x90]
	mov r0, #0
	ldr r3, _022F4AB4 ; =ov11_0238A05C
	mov r2, r4
	str r0, [r4, #0xa8]
	mov r1, #6
_022F4A38:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F4A38
	mov r1, #0
	str r1, [r4, #0xb8]
	str r1, [r4, #0xbc]
	sub r0, r1, #1
	str r0, [r4, #0xc0]
	strb r1, [r4, #0xb6]
	strh r1, [r4, #0xac]
	strh r1, [r4, #0xae]
	strh r0, [r4, #0x92]
	strh r1, [r4, #0x94]
	strh r0, [r4, #0x96]
	strb r0, [r4, #0x98]
	strh r1, [r4, #0x9a]
	strh r0, [r4, #0x9c]
	strh r1, [r4, #0x9e]
	strb r0, [r4, #0xa0]
	strh r0, [r4, #0xa2]
	mov r1, #0xff
	add r0, r4, #0xc
	strb r1, [r4, #0xa4]
	bl InitAnimationControlWithSet__0201C0B0
	mov r0, #0
	strb r0, [r4, #0x8a]
	strh r0, [r4, #0x8c]
	strh r0, [r4, #0x8e]
	strh r0, [r4, #0x88]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4AB4: .word ov11_0238A05C
	arm_func_end ov11_022F4A14

	arm_func_start ov11_022F4AB8
ov11_022F4AB8: ; 0x022F4AB8
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r5, r1
	mov r1, r3, lsr #0x10
	mov r6, r0
	mov r4, r2
	bl SetAnimDataFields
	mov r1, #0
	str r1, [r6, #0xb8]
	str r1, [r6, #0xbc]
	sub r0, r1, #1
	str r0, [r6, #0xc0]
	strb r1, [r6, #0xb6]
	strh r1, [r6, #0xac]
	strh r1, [r6, #0xae]
	strh r0, [r6, #0x92]
	strh r1, [r6, #0x94]
	strh r0, [r6, #0x96]
	strb r0, [r6, #0x98]
	strh r1, [r6, #0x9a]
	strh r0, [r6, #0x9c]
	strh r1, [r6, #0x9e]
	strb r0, [r6, #0xa0]
	strh r0, [r6, #0xa2]
	mov r0, #0xff
	strb r0, [r6, #0xa4]
	strh r1, [r6, #0xb0]
	mov r1, #1
	strh r1, [r6, #0xb2]
	add r0, r6, #0xc
	strh r1, [r6, #0xb4]
	bl InitAnimationControlWithSet__0201C0B0
	mov r1, #0
	strh r1, [r6, #0x8c]
	strh r1, [r6, #0x8e]
	ldrh r0, [r6, #0x90]
	tst r0, #0x8000
	movne r1, #1
	strb r1, [r6, #0x8a]
	strh r4, [r6, #0x88]
	ldrsh r1, [r6, #0x88]
	cmp r1, #0
	beq _022F4B88
	add r0, r6, #0xc
	bl SetSpriteIdForAnimationControl
	add r0, r6, #0xc
	bl AnimationControlGetAllocForMaxFrame
	strh r0, [r6, #0x8c]
	add r0, r6, #0xc
	bl sub_0201D100
	strh r0, [r6, #0x8e]
_022F4B88:
	cmp r5, #0
	beq _022F4BB4
	ldrsh r0, [r5, #2]
	cmp r0, #0
	ble _022F4BB4
	ldrh r0, [r5]
	strh r0, [r6, #0x8a]
	ldrh r0, [r5, #2]
	strh r0, [r6, #0x8c]
	ldrh r0, [r5, #4]
	strh r0, [r6, #0x8e]
_022F4BB4:
	ldrsh r0, [r6, #0x8c]
	cmp r0, #0
	mvnle r0, #0
	strleh r0, [r6, #0x8c]
	ldmleia sp!, {r4, r5, r6, pc}
	ldrh r2, [r6, #0xe]
	mov r0, r6
	add r1, r6, #0x8a
	orr r2, r2, #0x10
	strh r2, [r6, #0xe]
	bl ov11_022F4CD4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F4AB8

	arm_func_start ov11_022F4BE4
ov11_022F4BE4: ; 0x022F4BE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #0x90]
	tst r0, #0x200
	ldrnesh r0, [r4, #0x9e]
	cmpne r0, #0
	ldrnesh r1, [r4, #0xa2]
	mvnne r0, #0
	cmpne r1, r0
	beq _022F4C14
	ldrsh r0, [r4, #0xa2]
	bl ov10_022BDE50
_022F4C14:
	ldrh r0, [r4, #0x90]
	tst r0, #0x4000
	beq _022F4C2C
	mov r0, r4
	bl ov11_022F4A14
	ldmia sp!, {r4, pc}
_022F4C2C:
	add r0, r4, #0xc
	bl sub_0201D18C
	ldrsh r1, [r4, #0x88]
	cmp r1, #0
	beq _022F4C54
	ldr r0, _022F4C60 ; =WAN_TABLE
	ldr r0, [r0]
	bl DeleteWanTableEntryVeneer
	mov r0, #0
	strh r0, [r4, #0x88]
_022F4C54:
	mov r0, r4
	bl ov11_022F509C
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F4C60: .word WAN_TABLE
	arm_func_end ov11_022F4BE4

	arm_func_start InitAnimDataFromOtherAnimData
InitAnimDataFromOtherAnimData: ; 0x022F4C64
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov lr, r5
	mov ip, #0xc
_022F4C78:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022F4C78
	ldr r0, [r4]
	mov r2, #0
	str r0, [lr]
	ldrh r3, [r5, #0x90]
	sub r1, r2, #1
	mov r0, #0xff
	orr r3, r3, #0x4000
	strh r3, [r5, #0x90]
	str r2, [r5, #0xb8]
	str r2, [r5, #0xbc]
	str r1, [r5, #0xc0]
	strb r2, [r5, #0xb6]
	strh r2, [r5, #0xac]
	strh r2, [r5, #0xae]
	strh r2, [r5, #0x9e]
	strb r1, [r5, #0xa0]
	strh r1, [r5, #0xa2]
	strb r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitAnimDataFromOtherAnimData

	arm_func_start ov11_022F4CD4
ov11_022F4CD4: ; 0x022F4CD4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	ldrb r0, [r8, #0x8a]
	mov r7, #0
	ldrsh sb, [r1, #2]
	cmp r0, #0
	ldreq r3, _022F508C ; =ov11_02324CF0
	moveq r0, #0x1c
	ldreq r3, [r3]
	ldrsh r2, [r1, #4]
	addeq r3, r3, #0x1a0
	ldrne r3, _022F508C ; =ov11_02324CF0
	mov r1, #0
	ldrne r3, [r3]
	movne r0, #0xc
	addne r3, r3, #0x2f0
	mov r6, r7
	b _022F4D6C
_022F4D20:
	ldr r4, [r3]
	cmp r4, #0
	bne _022F4D58
	add r1, r1, #1
	cmp r1, r2
	blt _022F4D5C
	sub r4, r1, #1
	mov r0, #0xc
	mul r6, r4, r0
	sub r0, r7, r4
	mov r0, r0, lsl #0x10
	sub r3, r3, r6
	mov r7, r0, asr #0x10
	b _022F4D74
_022F4D58:
	mov r1, r6
_022F4D5C:
	add r4, r7, #1
	mov r4, r4, lsl #0x10
	mov r7, r4, asr #0x10
	add r3, r3, #0xc
_022F4D6C:
	cmp r7, r0
	blt _022F4D20
_022F4D74:
	cmp r1, r2
	blt _022F4DC0
	strh r7, [r8, #0x96]
	ldr r0, [r3, #4]
	mov r6, #1
	strb r0, [r8, #0x98]
	strh r2, [r8, #0x9a]
	str r6, [r3]
	str r8, [r3, #8]
	mov r4, #2
	mov r0, #0xc
	b _022F4DB0
_022F4DA4:
	mul r1, r6, r0
	str r4, [r3, r1]
	add r6, r6, #1
_022F4DB0:
	cmp r6, r2
	blt _022F4DA4
	mov r0, #1
	b _022F4DC4
_022F4DC0:
	mov r0, #0
_022F4DC4:
	cmp r0, #0
	beq _022F4DDC
	ldrsb r0, [r8, #0x98]
	cmp r0, #0x10
	movge sb, sb, lsl #1
	b _022F4DE4
_022F4DDC:
	mov r0, #0
	b _022F5084
_022F4DE4:
	ldrb r0, [r8, #0x8a]
	mov ip, #3
	cmp r0, #0
	ldreq r0, _022F508C ; =ov11_02324CF0
	ldreq r7, [r0]
	ldrne r0, _022F508C ; =ov11_02324CF0
	ldrne r0, [r0]
	addne r7, r0, #0x10
	and r0, ip, #2
	cmp r0, #2
	ldrsh r0, [r7, #0xe]
	bne _022F4F20
	ldr r3, [r7]
	mov r1, sb, lsl #0x10
	mov r6, r1, asr #0x10
	mov r2, r3
	sub r4, ip, #4
	add r0, r0, #1
	ldr lr, [r7, #4]
	mov r1, #0
	b _022F4E64
_022F4E38:
	ldr sl, [r2]
	tst sl, #1
	bne _022F4E5C
	ldrsh sl, [r2, #6]
	cmp sl, r6
	blt _022F4E5C
	cmp sl, r0
	movlt r4, r1
	movlt r0, sl
_022F4E5C:
	add r1, r1, #1
	add r2, r2, #8
_022F4E64:
	cmp r1, lr
	blt _022F4E38
	cmp r4, #0
	blt _022F5024
	add r5, r3, r4, lsl #3
	ldrsh r0, [r5, #6]
	cmp r0, r6
	ble _022F4F10
	add r2, r3, lr, lsl #3
	b _022F4EA4
_022F4E8C:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4EA4:
	cmp lr, r4
	bgt _022F4E8C
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4EE8
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #0xc
	ldr r2, [r1, #0x1c]
	ldr r1, [r1, #0x18]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r1, _022F5094 ; =ov11_02321388
	ldmib r7, {r2, r3}
	bl Debug_FatalError
_022F4EE8:
	ldr r1, [r7]
	add r0, r4, #1
	add r1, r1, r0, lsl #3
	ldrsh r0, [r1, #4]
	add r0, r0, r6
	strh r0, [r1, #4]
	ldrsh r0, [r1, #6]
	sub r0, r0, r6
	strh r0, [r1, #6]
	strh r6, [r5, #6]
_022F4F10:
	mov r0, #3
	str r0, [r5]
	ldrsh r5, [r5, #4]
	b _022F5050
_022F4F20:
	mov r4, sb, lsl #0x10
	ldmia r7, {r3, lr}
	sub r1, lr, #1
	sub sl, ip, #4
	add r0, r0, #1
	add r2, r3, r1, lsl #3
	mov r6, r4, asr #0x10
	b _022F4F6C
_022F4F40:
	ldr r4, [r2]
	tst r4, #1
	bne _022F4F64
	ldrsh r4, [r2, #6]
	cmp r4, r6
	blt _022F4F64
	cmp r4, r0
	movlt sl, r1
	movlt r0, r4
_022F4F64:
	sub r1, r1, #1
	sub r2, r2, #8
_022F4F6C:
	cmp r1, #0
	bge _022F4F40
	cmp sl, #0
	blt _022F5024
	add r4, r3, sl, lsl #3
	ldrsh r0, [r4, #6]
	cmp r0, r6
	ble _022F5014
	add r2, r3, lr, lsl #3
	b _022F4FAC
_022F4F94:
	ldr r1, [r2, #-8]
	ldr r0, [r2, #-4]
	sub lr, lr, #1
	str r1, [r2]
	str r0, [r2, #4]
	sub r2, r2, #8
_022F4FAC:
	cmp lr, sl
	bgt _022F4F94
	ldr r0, [r7, #4]
	add r1, r0, #1
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	cmp r1, r0
	ble _022F4FF0
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #4
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #8]
	str r2, [sp, #8]
	str r1, [sp, #4]
	ldr r1, _022F5094 ; =ov11_02321388
	ldmib r7, {r2, r3}
	bl Debug_FatalError
_022F4FF0:
	ldrsh r0, [r4, #6]
	sub r0, r0, r6
	strh r0, [r4, #6]
	ldrsh r1, [r4, #4]
	ldrsh r0, [r4, #6]
	add r4, r4, #8
	add r0, r1, r0
	strh r0, [r4, #4]
	strh r6, [r4, #6]
_022F5014:
	mov r0, #3
	str r0, [r4]
	ldrsh r5, [r4, #4]
	b _022F5050
_022F5024:
	ldr r1, _022F5090 ; =ov11_0232134C
	add r0, sp, #0x14
	ldr r4, [r1, #0x14]
	ldr sl, [r1, #0x10]
	ldr r1, _022F5098 ; =ov11_023213B0
	mov r2, r7
	mov r3, r6
	str sl, [sp, #0x14]
	str r4, [sp, #0x18]
	str ip, [sp]
	bl Debug_FatalError
_022F5050:
	cmp r5, #0
	strgeh sb, [r8, #0x94]
	strgeh r5, [r8, #0x92]
	movge r0, #1
	bge _022F5084
	mvn r1, #0
	str r1, [r8, #0xc0]
	mov r0, #0
	strb r0, [r8, #0xb6]
	strh r1, [r8, #0x92]
	strh r0, [r8, #0x94]
	strh r0, [r8, #0xac]
	strh r0, [r8, #0xae]
_022F5084:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_022F508C: .word ov11_02324CF0
_022F5090: .word ov11_0232134C
_022F5094: .word ov11_02321388
_022F5098: .word ov11_023213B0
	arm_func_end ov11_022F4CD4

	arm_func_start ov11_022F509C
ov11_022F509C: ; 0x022F509C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsh r4, [r0, #0x92]
	cmp r4, #0
	blt _022F51D0
	ldrb r1, [r0, #0x8a]
	mov r3, #0
	cmp r1, #0
	ldreq r1, _022F5270 ; =ov11_02324CF0
	ldreq ip, [r1]
	ldrne r1, _022F5270 ; =ov11_02324CF0
	ldrne r1, [r1]
	addne ip, r1, #0x10
	ldmia ip, {r2, r5}
	b _022F51C8
_022F50D4:
	ldrsh r1, [r2, #4]
	cmp r1, r4
	bne _022F51C0
	mov r1, #0
	str r1, [r2]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	cmp r3, r1
	bge _022F5150
	ldr r4, [r2, #8]
	add r1, r2, #8
	cmp r4, #0
	bne _022F5150
	ldrsh lr, [r2, #6]
	ldrsh r4, [r1, #6]
	add r5, r3, #1
	add r4, lr, r4
	strh r4, [r2, #6]
	ldr r4, [ip, #4]
	sub r4, r4, #1
	str r4, [ip, #4]
	b _022F5144
_022F512C:
	ldr lr, [r1, #8]
	ldr r4, [r1, #0xc]
	add r5, r5, #1
	str lr, [r1]
	str r4, [r1, #4]
	add r1, r1, #8
_022F5144:
	ldr r4, [ip, #4]
	cmp r5, r4
	blt _022F512C
_022F5150:
	cmp r3, #0
	ble _022F51AC
	ldr r1, [r2, #-8]
	sub r4, r2, #8
	cmp r1, #0
	bne _022F51AC
	ldrsh lr, [r4, #6]
	ldrsh r1, [r2, #6]
	add r1, lr, r1
	strh r1, [r4, #6]
	ldr r1, [ip, #4]
	sub r1, r1, #1
	str r1, [ip, #4]
	b _022F51A0
_022F5188:
	ldr lr, [r2, #8]
	ldr r1, [r2, #0xc]
	add r3, r3, #1
	str lr, [r2]
	str r1, [r2, #4]
	add r2, r2, #8
_022F51A0:
	ldr r1, [ip, #4]
	cmp r3, r1
	blt _022F5188
_022F51AC:
	mvn r1, #0
	strh r1, [r0, #0x92]
	mov r1, #0
	strh r1, [r0, #0x94]
	b _022F51D0
_022F51C0:
	add r3, r3, #1
	add r2, r2, #8
_022F51C8:
	cmp r3, r5
	blt _022F50D4
_022F51D0:
	ldrsh r4, [r0, #0x96]
	cmp r4, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldrb r1, [r0, #0x8a]
	cmp r1, #0
	bne _022F5204
	ldr r1, _022F5270 ; =ov11_02324CF0
	mov r2, #0xc
	ldr r3, [r1]
	mov r1, #0x1c
	add r3, r3, #0x1a0
	smlabb r5, r4, r2, r3
	b _022F5218
_022F5204:
	ldr r2, _022F5270 ; =ov11_02324CF0
	mov r1, #0xc
	ldr r2, [r2]
	add r2, r2, #0x2f0
	smlabb r5, r4, r1, r2
_022F5218:
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	mov r3, #0
	str r3, [r5, #8]
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
	b _022F5250
_022F5234:
	ldr r2, [r5]
	cmp r2, #2
	bne _022F5258
	add r2, r4, #1
	mov r2, r2, lsl #0x10
	str r3, [r5], #0xc
	mov r4, r2, asr #0x10
_022F5250:
	cmp r4, r1
	blt _022F5234
_022F5258:
	mvn r1, #0
	strh r1, [r0, #0x96]
	strb r1, [r0, #0x98]
	mov r1, #0
	strh r1, [r0, #0x9a]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F5270: .word ov11_02324CF0
	arm_func_end ov11_022F509C

	arm_func_start ov11_022F5274
ov11_022F5274: ; 0x022F5274
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, #0
	ldr r5, _022F52E0 ; =ov11_0238A04C
	mov r4, r6
_022F5288:
	mov r0, r6
	add r1, r5, r6, lsl #3
	bl ov11_022EB3C8
	cmp r0, #0
	streq r4, [r5, r6, lsl #3]
	addeq r0, r5, r6, lsl #3
	add r6, r6, #1
	streq r4, [r0, #4]
	cmp r6, #2
	blt _022F5288
	bl ov11_022FBA68
	bl ov11_022FD510
	bl ov11_022FE8CC
	ldr r1, _022F52E4 ; =ov11_0238A020
	add r0, sp, #0
	ldr r2, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	strh r2, [sp]
	strh r1, [sp, #2]
	bl ov10_022BF7E0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F52E0: .word ov11_0238A04C
_022F52E4: .word ov11_0238A020
	arm_func_end ov11_022F5274

	arm_func_start SetAnimDataFields2
SetAnimDataFields2: ; 0x022F52E8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldrsh r3, [r6, #0x92]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	bge _022F5324
	ldrsh r1, [r6, #0x8c]
	cmp r1, #0
	ble _022F5400
	add r1, r6, #0x8a
	bl ov11_022F4CD4
	cmp r0, #0
	beq _022F5400
_022F5324:
	tst r5, #0x400
	ldrneh r0, [r6, #0xc]
	bicne r0, r0, #0x1000
	strneh r0, [r6, #0xc]
	bne _022F5400
	mov r1, #1
	and r0, r5, #0x700
	strb r1, [r6, #0xb6]
	sub r1, r1, #2
	str r1, [r6, #0xc0]
	cmp r0, #0x100
	bgt _022F5360
	bge _022F5384
	cmp r0, #0
	b _022F5390
_022F5360:
	cmp r0, #0x200
	bgt _022F5370
	beq _022F539C
	b _022F5390
_022F5370:
	cmp r0, #0x300
	bne _022F5390
	mov r0, #0
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5384:
	mov r0, #0x80
	strh r0, [r6, #0xac]
	b _022F53A4
_022F5390:
	mov r0, #0x100
	strh r0, [r6, #0xac]
	b _022F53A4
_022F539C:
	mov r0, #0x200
	strh r0, [r6, #0xac]
_022F53A4:
	mov r3, #0
	strh r3, [r6, #0xae]
	ldrb r2, [r6, #0x98]
	tst r5, #0x800
	movne r3, #1
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	and r1, r3, #0xff
	str r1, [sp, #8]
	ldrb r3, [r6, #0x8a]
	mov r0, r4, asr #2
	add r1, r4, r0, lsr #29
	str r3, [sp, #0xc]
	and r2, r5, #0xff
	add r1, r2, r1, asr #3
	ldrsh r3, [r6, #0x92]
	add r0, r6, #0xc
	and r2, r4, #7
	bl SetAnimationForAnimationControl
	ldrh r0, [r6, #0xe]
	orr r0, r0, #0x10
	strh r0, [r6, #0xe]
_022F5400:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SetAnimDataFields2

	arm_func_start ov11_022F5408
ov11_022F5408: ; 0x022F5408
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh ip, [r6, #0x90]
	mov r5, r1
	mov r4, r2
	tst ip, #0x200
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	streqh r4, [r6, #0x9e]
	ldreq r0, [sp, #0x10]
	streqb r3, [r6, #0xa0]
	streqb r0, [r6, #0xa4]
	beq _022F5458
	bl ov11_022F49B0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #1
	ldrnesh r0, [r6, #0x9e]
	cmpne r4, r0
	ldmneia sp!, {r4, r5, r6, pc}
_022F5458:
	strh r5, [r6, #0x9c]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F5408

	arm_func_start ov11_022F5460
ov11_022F5460: ; 0x022F5460
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	mov r7, r2
	ldr r4, [r7]
	ldr r2, [r7, #4]
	mov r5, r0
	str r4, [r5, #0xb8]
	str r2, [r5, #0xbc]
	mov r2, #0
	str r2, [r5, #0xc0]
	ldrh r0, [r5, #0x90]
	mov r4, r1
	mov r6, r3
	tst r0, #0x200
	beq _022F5624
	ldrsh r0, [r5, #0x9e]
	cmp r0, #0
	beq _022F561C
	ldrsh r0, [r5, #0x9c]
	cmp r0, #1
	bne _022F54E8
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	beq _022F54D4
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BDE50
	mvn r0, #0
	strh r0, [r5, #0xa2]
_022F54D4:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F54E8:
	cmp r0, #0
	bne _022F55B4
	ldrsh r1, [r5, #0xa2]
	sub r0, r2, #1
	cmp r1, r0
	bne _022F55A8
	add r0, sp, #8
	bl ov10_022BF274
	ldrsh r1, [r5, #0x9e]
	mov r0, #0
	ldr ip, _022F58F0 ; =0x0000FFFF
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r2, [r7]
	sub lr, r0, #1
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x14]
	ldr r2, [r7, #4]
	ldr r3, _022F58F4 ; =ov11_0232136C
	mov r1, r2, asr #7
	add r1, r2, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0x16]
	add r2, sp, #0x24
	strh r0, [sp, #0x18]
	strh r0, [sp, #0x1a]
	strb lr, [sp, #0x1c]
	str ip, [sp, #0x20]
	mov r1, #6
_022F5568:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _022F5568
	ldrh r0, [sp, #0x2e]
	orr r0, r0, #0x1c0
	strh r0, [sp, #0x2e]
	ldrh r0, [r5, #0x90]
	tst r0, #0x8000
	movne r1, #1
	moveq r1, #0
	add r0, sp, #8
	bl ov10_022BF2E4
	strh r0, [r5, #0xa2]
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF35C
_022F55A8:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F55B4:
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF964
	cmp r0, #0
	beq _022F5608
	ldrsh r0, [r5, #0x9c]
	cmp r0, #2
	bne _022F55DC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF394
	b _022F55FC
_022F55DC:
	cmp r0, #3
	bne _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF444
	cmp r0, #0
	beq _022F55FC
	ldrsh r0, [r5, #0xa2]
	bl ov10_022BF3EC
_022F55FC:
	mvn r0, #0
	strh r0, [r5, #0x9c]
	b _022F5624
_022F5608:
	mvn r0, #0
	strh r0, [r5, #0xa2]
	mov r0, #0
	strh r0, [r5, #0x9e]
	b _022F5624
_022F561C:
	sub r0, r2, #1
	strh r0, [r5, #0x9c]
_022F5624:
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	movlt r0, #0
	blt _022F58E8
	ldrh r0, [r5, #0x90]
	tst r0, #0x80
	movne r0, #0
	bne _022F58E8
	ldr ip, [r7]
	ldr r7, [r7, #4]
	mov r2, ip, asr #7
	mov r3, r7, asr #7
	add r2, ip, r2, lsr #24
	add r3, r7, r3, lsr #24
	tst r0, #0x8000
	movne r1, #1
	mov ip, r2, asr #8
	mov r7, r3, asr #8
	moveq r1, #0
	str ip, [sp]
	str r7, [sp, #4]
	tst r0, #0x800
	bne _022F56A0
	ldr r3, _022F58F8 ; =ov11_0238A04C
	ldr r2, _022F58FC ; =ov11_0238A050
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, r1, lsl #3]
	sub r2, ip, r3
	sub r1, r7, r1
	str r2, [sp]
	str r1, [sp, #4]
_022F56A0:
	mov r1, r6, asr #7
	ldr r7, [sp, #4]
	add r1, r6, r1, lsr #24
	tst r0, #0x400
	sub r6, r7, r1, asr #8
	bne _022F56F4
	ldr r1, [sp]
	mvn r2, #0x3f
	cmp r1, r2
	blt _022F5870
	cmp r1, #0x140
	bge _022F5870
	add r1, r2, #0x30
	cmp r7, r1
	blt _022F5870
	cmp r7, #0xf0
	bge _022F5870
	cmp r6, r1
	blt _022F5870
	cmp r6, #0xf0
	bge _022F5870
_022F56F4:
	tst r0, #0x20
	beq _022F57D8
	ldrsh r1, [r5, #0xb4]
	mov r0, #0
	cmp r1, #0
	bne _022F5720
	ldr r1, _022F5900 ; =ov11_0238A020
	ldr r1, [r1]
	tst r1, #1
	movne r0, #1
	b _022F5768
_022F5720:
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ble _022F574C
	sub r1, r1, #1
	strh r1, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	cmp r1, #0
	ldrlesh r1, [r5, #0xb4]
	rsble r1, r1, #0
	strleh r1, [r5, #0xb0]
	b _022F5768
_022F574C:
	add r0, r1, #1
	strh r0, [r5, #0xb0]
	ldrsh r1, [r5, #0xb0]
	mov r0, #1
	cmp r1, #0
	ldrgesh r1, [r5, #0xb2]
	strgeh r1, [r5, #0xb0]
_022F5768:
	cmp r0, #0
	beq _022F57D8
	mov r0, r5
	mov r1, #0
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl FillOamAttributeInfo
	add r0, r5, #0xc
	bl DisplayAndSwitchAnimationControlCurrentFrame
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F57D0
	add r0, r5, #0xc
	bl sub_0201C108
_022F57D0:
	mov r0, #0
	b _022F58E8
_022F57D8:
	ldrb r1, [r5, #0xb6]
	mov r0, r5
	bl ov11_022F5904
	ldrh r0, [r5, #0x90]
	tst r0, #0x2000
	ldrne r2, [r5, #0xa8]
	bne _022F5808
	ldr r0, [r5, #0xa8]
	add r0, r7, r0
	add r2, r0, #2
	cmp r2, #2
	movlt r2, #2
_022F5808:
	ldr r0, [sp]
	mov r1, r5
	strh r0, [r5, #0x28]
	strh r6, [r5, #0x2a]
	strh r2, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl FillOamAttributeInfo
	add r0, r5, #0xc
	bl DisplayAndSwitchAnimationControlCurrentFrame
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F5854
	add r0, r5, #0xc
	bl sub_0201C108
_022F5854:
	cmp r4, #0
	ldrne r1, [sp]
	ldrne r0, [sp, #4]
	strne r1, [r4]
	strne r0, [r4, #4]
	mov r0, #1
	b _022F58E8
_022F5870:
	ldrb r0, [r5, #0xb6]
	cmp r0, #0
	beq _022F58E4
	mov r0, r5
	mov r1, #1
	bl ov11_022F5904
	mov r0, #0x240
	strh r0, [r5, #0x28]
	mov r0, #0x130
	strh r0, [r5, #0x2a]
	mov r0, #0
	strh r0, [r5, #0x44]
	ldrh r2, [r5, #0xe]
	mov r1, r5
	add r0, r5, #0xc
	orr r2, r2, #0x20
	strh r2, [r5, #0xe]
	bl FillOamAttributeInfo
	add r0, r5, #0xc
	bl DisplayAndSwitchAnimationControlCurrentFrame
	mov r0, #0
	strb r0, [r5, #0xb6]
	ldrh r0, [r5, #0x90]
	tst r0, #0x4000
	beq _022F58DC
	add r0, r5, #0xc
	bl sub_0201C108
_022F58DC:
	mov r0, #0
	b _022F58E8
_022F58E4:
	mov r0, #0
_022F58E8:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F58F0: .word 0x0000FFFF
_022F58F4: .word ov11_0232136C
_022F58F8: .word ov11_0238A04C
_022F58FC: .word ov11_0238A050
_022F5900: .word ov11_0238A020
	arm_func_end ov11_022F5460

	arm_func_start ov11_022F5904
ov11_022F5904: ; 0x022F5904
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #0
	beq _022F5928
	mov r1, #0
	add r0, r4, #0xc
	strh r1, [r4, #0xae]
	bl SwitchAnimationControlToNextFrame
	ldmia sp!, {r4, pc}
_022F5928:
	ldrsh r1, [r4, #0xae]
	ldrsh r0, [r4, #0xac]
	add r0, r1, r0
	strh r0, [r4, #0xae]
	b _022F5950
_022F593C:
	ldrsh r1, [r4, #0xae]
	add r0, r4, #0xc
	sub r1, r1, #0x100
	strh r1, [r4, #0xae]
	bl SwitchAnimationControlToNextFrame
_022F5950:
	ldrsh r0, [r4, #0xae]
	cmp r0, #0x100
	bge _022F593C
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F5904

	arm_func_start ov11_022F5960
ov11_022F5960: ; 0x022F5960
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldrh lr, [r0, #0x90]
	tst lr, #0x200
	ldrnesh r4, [r0, #0xa2]
	mvnne ip, #0
	cmpne r4, ip
	beq _022F5A5C
	tst lr, #0x8000
	ldr lr, _022F5A68 ; =ov11_0232134C
	movne ip, #1
	ldrh r4, [lr, #4]
	moveq ip, #0
	strh r4, [sp, #4]
	ldrh r4, [lr, #6]
	strh r4, [sp, #6]
	ldr r4, [r1]
	mov lr, r4, asr #7
	add lr, r4, lr, lsr #24
	mov r4, lr, asr #8
	strh r4, [sp, #4]
	ldr lr, [r1, #4]
	mov r1, lr, asr #7
	add r1, lr, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #6]
	ldrh r1, [r0, #0x90]
	tst r1, #0x2000
	ldrne r1, [r0, #0xa8]
	addne ip, r1, #4
	bne _022F5A00
	ldr r1, _022F5A6C ; =ov11_0238A050
	ldrsh lr, [sp, #6]
	ldr r1, [r1, ip, lsl #3]
	ldr ip, [r0, #0xa8]
	sub r1, lr, r1
	add r1, ip, r1
	add ip, r1, #4
	cmp ip, #4
	movlt ip, #4
_022F5A00:
	ldrsh lr, [sp, #6]
	mov r1, r3, asr #7
	add r1, r3, r1, lsr #24
	sub r1, lr, r1, asr #8
	strh r1, [sp, #6]
	cmp r2, #0
	beq _022F5A3C
	ldrsh lr, [sp, #4]
	ldr r1, [r2]
	ldrsh r3, [sp, #6]
	add r1, lr, r1
	strh r1, [sp, #4]
	ldr r1, [r2, #4]
	add r1, r3, r1
	strh r1, [sp, #6]
_022F5A3C:
	str r0, [sp]
	ldrsh r0, [r0, #0xa2]
	add r1, sp, #4
	mov r3, ip
	mov r2, #0
	bl ov10_022BF45C
	mov r0, #1
	b _022F5A60
_022F5A5C:
	mov r0, #0
_022F5A60:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F5A68: .word ov11_0232134C
_022F5A6C: .word ov11_0238A050
	arm_func_end ov11_022F5960

	arm_func_start ov11_022F5A70
ov11_022F5A70: ; 0x022F5A70
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r0
	ldrh r0, [r3, #0x90]
	tst r0, #0x100
	beq _022F5B58
	ldr r4, [r1]
	tst r0, #0x8000
	mov ip, r4, asr #7
	add ip, r4, ip, lsr #24
	mov r4, ip, asr #8
	strh r4, [sp, #8]
	ldr r4, [r1, #4]
	movne r0, #1
	mov r1, r4, asr #7
	add r1, r4, r1, lsr #24
	mov r1, r1, asr #8
	strh r1, [sp, #0xa]
	ldrh r1, [r3, #0x90]
	moveq r0, #0
	tst r1, #0x800
	bne _022F5AF0
	ldr ip, _022F5B64 ; =ov11_0238A04C
	ldr r1, _022F5B68 ; =ov11_0238A050
	ldrsh r4, [sp, #8]
	ldr lr, [ip, r0, lsl #3]
	ldrsh ip, [sp, #0xa]
	ldr r0, [r1, r0, lsl #3]
	sub r1, r4, lr
	sub r0, ip, r0
	strh r1, [sp, #8]
	strh r0, [sp, #0xa]
_022F5AF0:
	ldrh r1, [r3, #0x90]
	tst r1, #0x10
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #4]
	bne _022F5B28
	tst r1, #8
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #8]
	bne _022F5B28
	tst r1, #0x8000
	ldrne r0, _022F5B6C ; =ov11_0238A020
	ldrne r4, [r0, #0x10]
	ldreq r0, _022F5B6C ; =ov11_0238A020
	ldreq r4, [r0, #0xc]
_022F5B28:
	tst r1, #0x40
	movne ip, #1
	moveq ip, #0
	mov r0, r2
	add r2, r3, #0xc
	add r1, sp, #8
	str r4, [sp]
	and ip, ip, #0xff
	mov r3, #1
	str ip, [sp, #4]
	bl sub_02058AFC
	b _022F5B5C
_022F5B58:
	mov r0, #0
_022F5B5C:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_022F5B64: .word ov11_0238A04C
_022F5B68: .word ov11_0238A050
_022F5B6C: .word ov11_0238A020
	arm_func_end ov11_022F5A70

	arm_func_start ov11_022F5B70
ov11_022F5B70: ; 0x022F5B70
	ldr r0, _022F5B84 ; =ov11_0238A020
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
_022F5B84: .word ov11_0238A020
	arm_func_end ov11_022F5B70

	arm_func_start ov11_022F5B88
ov11_022F5B88: ; 0x022F5B88
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r3, [r0]
	mov ip, #1
	ldr r3, [sp]
	str ip, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0]
	mov r0, #0
	str r0, [r3]
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	bx lr
	arm_func_end ov11_022F5B88

	arm_func_start ov11_022F5BBC
ov11_022F5BBC: ; 0x022F5BBC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	tst r5, #0x80000000
	movne r4, #0xf
	mov r0, r1
	moveq r4, #0xe
	bl GetSpriteIndex__02052724
	mov r2, #0
	str r2, [sp]
	ldr r1, _022F5C38 ; =WAN_TABLE
	mov r2, r0
	ldr r0, [r1]
	mov r3, r4
	mov r1, #2
	bl LoadWanTableEntryFromPack
	mov r2, r0
	mov r0, r6
	mov r3, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r6, #0x92]
	cmp r0, #0
	blt _022F5C30
	mov r0, r6
	mov r1, #0x300
	mov r2, #0
	bl SetAnimDataFields2
_022F5C30:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F5C38: .word WAN_TABLE
	arm_func_end ov11_022F5BBC

	arm_func_start ov11_022F5C3C
ov11_022F5C3C: ; 0x022F5C3C
	ldr ip, _022F5C44 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F5C44: .word ov11_022F4BE4
	arm_func_end ov11_022F5C3C

	arm_func_start ov11_022F5C48
ov11_022F5C48: ; 0x022F5C48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [sp, #0x18]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #0
	bge _022F5C74
	mov r0, r5
	bl ov10_022BF00C
	str r0, [sp, #0x18]
_022F5C74:
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov11_022F5408
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C48

	arm_func_start ov11_022F5C94
ov11_022F5C94: ; 0x022F5C94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r6, r1
	add r1, sp, #0xc
	mov r7, r0
	mov r5, r2
	mov r4, r3
	bl ov11_022F5460
	cmp r0, #0
	beq _022F5D48
	ldrsh r1, [r7, #0xa2]
	mvn r0, #0
	cmp r1, r0
	beq _022F5D38
	ldrb r0, [r7, #0xa4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _022F5D24
_022F5CDC: ; jump table
	b _022F5CEC ; case 0
	b _022F5CEC ; case 1
	b _022F5CEC ; case 2
	b _022F5CEC ; case 3
_022F5CEC:
	ldrb r2, [r7, #0xa4]
	add r0, sp, #8
	add r1, r7, #0xc
	bl sub_0201CF90
	ldrsh lr, [sp, #8]
	ldrsh ip, [sp, #0xa]
	add r2, sp, #0
	mov r0, r7
	mov r1, r5
	mov r3, r4
	str lr, [sp]
	str ip, [sp, #4]
	bl ov11_022F5960
	b _022F5D38
_022F5D24:
	mov r0, r7
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
_022F5D38:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl ov11_022F5A70
_022F5D48:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov11_022F5C94

; https://decomp.me/scratch/OsJD0
	arm_func_start GetIdleAnimationType
GetIdleAnimationType: ; 0x022F5D50
	ldr r2, _022F6CF4 ; =0x000002C6
	cmp r0, r2
	bgt _022F6824
	bge _022F6E18
	sub r3, r2, #0xd3
	cmp r0, r3
	bgt _022F654C
	bge _022F6E18
	sub r3, r2, #0x160
	cmp r0, r3
	bgt _022F62EC
	bge _022F6E18
	cmp r0, #0x140
	bgt _022F6244
	bge _022F6E18
	ldr r2, _022F6CF8 ; =0x00000121
	cmp r0, r2
	bgt _022F61D0
	bge _022F6E20
	cmp r0, #0xfa
	bgt _022F6144
	bge _022F6E18
	sub r2, r0, #0xc
	cmp r2, #0xe2
	addls pc, pc, r2, lsl #2
	b _022F6E44
_022F5DB8: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E18 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E44 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E18 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E44 ; case 20
	b _022F6E44 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E44 ; case 28
	b _022F6E18 ; case 29
	b _022F6E18 ; case 30
	b _022F6E44 ; case 31
	b _022F6E44 ; case 32
	b _022F6E44 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E44 ; case 36
	b _022F6E18 ; case 37
	b _022F6E20 ; case 38
	b _022F6E20 ; case 39
	b _022F6E44 ; case 40
	b _022F6E20 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E44 ; case 44
	b _022F6E44 ; case 45
	b _022F6E20 ; case 46
	b _022F6E20 ; case 47
	b _022F6E44 ; case 48
	b _022F6E44 ; case 49
	b _022F6E44 ; case 50
	b _022F6E18 ; case 51
	b _022F6E44 ; case 52
	b _022F6E28 ; case 53
	b _022F6E44 ; case 54
	b _022F6E44 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E18 ; case 60
	b _022F6E18 ; case 61
	b _022F6E18 ; case 62
	b _022F6E44 ; case 63
	b _022F6E44 ; case 64
	b _022F6E44 ; case 65
	b _022F6E44 ; case 66
	b _022F6E44 ; case 67
	b _022F6E44 ; case 68
	b _022F6E18 ; case 69
	b _022F6E18 ; case 70
	b _022F6E44 ; case 71
	b _022F6E44 ; case 72
	b _022F6E44 ; case 73
	b _022F6E44 ; case 74
	b _022F6E44 ; case 75
	b _022F6E18 ; case 76
	b _022F6E18 ; case 77
	b _022F6E44 ; case 78
	b _022F6E20 ; case 79
	b _022F6E18 ; case 80
	b _022F6E18 ; case 81
	b _022F6E44 ; case 82
	b _022F6E44 ; case 83
	b _022F6E44 ; case 84
	b _022F6E44 ; case 85
	b _022F6E20 ; case 86
	b _022F6E20 ; case 87
	b _022F6E44 ; case 88
	b _022F6E44 ; case 89
	b _022F6E44 ; case 90
	b _022F6E44 ; case 91
	b _022F6E44 ; case 92
	b _022F6E44 ; case 93
	b _022F6E44 ; case 94
	b _022F6E44 ; case 95
	b _022F6E44 ; case 96
	b _022F6E18 ; case 97
	b _022F6E18 ; case 98
	b _022F6E44 ; case 99
	b _022F6E44 ; case 100
	b _022F6E44 ; case 101
	b _022F6E44 ; case 102
	b _022F6E44 ; case 103
	b _022F6E18 ; case 104
	b _022F6E18 ; case 105
	b _022F6E18 ; case 106
	b _022F6E18 ; case 107
	b _022F6E44 ; case 108
	b _022F6E44 ; case 109
	b _022F6E44 ; case 110
	b _022F6E44 ; case 111
	b _022F6E44 ; case 112
	b _022F6E44 ; case 113
	b _022F6E44 ; case 114
	b _022F6E44 ; case 115
	b _022F6E44 ; case 116
	b _022F6E18 ; case 117
	b _022F6E18 ; case 118
	b _022F6E44 ; case 119
	b _022F6E20 ; case 120
	b _022F6E20 ; case 121
	b _022F6E20 ; case 122
	b _022F6E20 ; case 123
	b _022F6E44 ; case 124
	b _022F6E18 ; case 125
	b _022F6E44 ; case 126
	b _022F6E44 ; case 127
	b _022F6E44 ; case 128
	b _022F6E44 ; case 129
	b _022F6E18 ; case 130
	b _022F6E44 ; case 131
	b _022F6E18 ; case 132
	b _022F6E18 ; case 133
	b _022F6E18 ; case 134
	b _022F6E44 ; case 135
	b _022F6E44 ; case 136
	b _022F6E44 ; case 137
	b _022F6E20 ; case 138
	b _022F6E18 ; case 139
	b _022F6E44 ; case 140
	b _022F6E44 ; case 141
	b _022F6E44 ; case 142
	b _022F6E44 ; case 143
	b _022F6E44 ; case 144
	b _022F6E44 ; case 145
	b _022F6E44 ; case 146
	b _022F6E44 ; case 147
	b _022F6E44 ; case 148
	b _022F6E44 ; case 149
	b _022F6E20 ; case 150
	b _022F6E20 ; case 151
	b _022F6E20 ; case 152
	b _022F6E18 ; case 153
	b _022F6E18 ; case 154
	b _022F6E44 ; case 155
	b _022F6E44 ; case 156
	b _022F6E18 ; case 157
	b _022F6E44 ; case 158
	b _022F6E44 ; case 159
	b _022F6E44 ; case 160
	b _022F6E44 ; case 161
	b _022F6E44 ; case 162
	b _022F6E44 ; case 163
	b _022F6E44 ; case 164
	b _022F6E44 ; case 165
	b _022F6E44 ; case 166
	b _022F6E44 ; case 167
	b _022F6E44 ; case 168
	b _022F6E44 ; case 169
	b _022F6E44 ; case 170
	b _022F6E44 ; case 171
	b _022F6E44 ; case 172
	b _022F6E44 ; case 173
	b _022F6E44 ; case 174
	b _022F6E20 ; case 175
	b _022F6E20 ; case 176
	b _022F6E18 ; case 177
	b _022F6E20 ; case 178
	b _022F6E20 ; case 179
	b _022F6E44 ; case 180
	b _022F6E18 ; case 181
	b _022F6E44 ; case 182
	b _022F6E44 ; case 183
	b _022F6E44 ; case 184
	b _022F6E44 ; case 185
	b _022F6E20 ; case 186
	b _022F6E44 ; case 187
	b _022F6E18 ; case 188
	b _022F6E18 ; case 189
	b _022F6E18 ; case 190
	b _022F6E18 ; case 191
	b _022F6E18 ; case 192
	b _022F6E18 ; case 193
	b _022F6E18 ; case 194
	b _022F6E18 ; case 195
	b _022F6E18 ; case 196
	b _022F6E18 ; case 197
	b _022F6E18 ; case 198
	b _022F6E18 ; case 199
	b _022F6E18 ; case 200
	b _022F6E18 ; case 201
	b _022F6E18 ; case 202
	b _022F6E18 ; case 203
	b _022F6E18 ; case 204
	b _022F6E18 ; case 205
	b _022F6E18 ; case 206
	b _022F6E18 ; case 207
	b _022F6E18 ; case 208
	b _022F6E18 ; case 209
	b _022F6E18 ; case 210
	b _022F6E18 ; case 211
	b _022F6E18 ; case 212
	b _022F6E18 ; case 213
	b _022F6E18 ; case 214
	b _022F6E18 ; case 215
	b _022F6E18 ; case 216
	b _022F6E44 ; case 217
	b _022F6E44 ; case 218
	b _022F6E44 ; case 219
	b _022F6E18 ; case 220
	b _022F6E20 ; case 221
	b _022F6E18 ; case 222
	b _022F6E44 ; case 223
	b _022F6E44 ; case 224
	b _022F6E44 ; case 225
	b _022F6E18 ; case 226
_022F6144:
	cmp r0, #0xfd
	bgt _022F6154
	beq _022F6E18
	b _022F6E44
_022F6154:
	sub r1, r0, #0xfe
	cmp r1, #0x1a
	addls pc, pc, r1, lsl #2
	b _022F6E44
_022F6164: ; jump table
	b _022F6E20 ; case 0
	b _022F6E44 ; case 1
	b _022F6E44 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E44 ; case 11
	b _022F6E44 ; case 12
	b _022F6E44 ; case 13
	b _022F6E44 ; case 14
	b _022F6E44 ; case 15
	b _022F6E44 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E44 ; case 19
	b _022F6E20 ; case 20
	b _022F6E44 ; case 21
	b _022F6E20 ; case 22
	b _022F6E18 ; case 23
	b _022F6E18 ; case 24
	b _022F6E18 ; case 25
	b _022F6E20 ; case 26
_022F61D0:
	ldr r2, _022F6CFC ; =0x00000133
	cmp r0, r2
	bgt _022F6224
	bge _022F6E18
	sub r1, r2, #0xa
	cmp r0, r1
	bgt _022F6214
	sub r1, r2, #0x11
	cmp r0, r1
	blt _022F6E44
	beq _022F6E20
	sub r1, r2, #0xc
	cmp r0, r1
	subne r1, r2, #0xa
	cmpne r0, r1
	beq _022F6E18
	b _022F6E44
_022F6214:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6224:
	cmp r0, #0x138
	bgt _022F6234
	beq _022F6E18
	b _022F6E44
_022F6234:
	add r1, r2, #0xc
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6244:
	sub r1, r2, #0x16c
	cmp r0, r1
	bgt _022F6298
	bge _022F6E18
	ldr r2, _022F6D00 ; =0x0000014F
	cmp r0, r2
	bgt _022F6274
	bge _022F6E18
	sub r1, r2, #6
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6274:
	add r1, r2, #6
	cmp r0, r1
	bgt _022F6288
	beq _022F6E20
	b _022F6E44
_022F6288:
	add r1, r2, #7
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6298:
	ldr r2, _022F6D04 ; =0x0000015D
	cmp r0, r2
	bgt _022F62C8
	bge _022F6E18
	sub r1, r2, #2
	cmp r0, r1
	bgt _022F62BC
	beq _022F6E18
	b _022F6E44
_022F62BC:
	cmp r0, #0x15c
	beq _022F6E18
	b _022F6E44
_022F62C8:
	add r1, r2, #4
	cmp r0, r1
	bgt _022F62DC
	beq _022F6E18
	b _022F6E44
_022F62DC:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F62EC:
	sub r1, r2, #0xf3
	cmp r0, r1
	bgt _022F64AC
	bge _022F6E18
	ldr r2, _022F6D08 ; =0x000001AB
	cmp r0, r2
	bgt _022F6454
	sub r1, r2, #0x3d
	subs r1, r0, r1
	addpl pc, pc, r1, lsl #2
	b _022F6410
_022F6318: ; jump table
	b _022F6E18 ; case 0
	b _022F6E44 ; case 1
	b _022F6E18 ; case 2
	b _022F6E44 ; case 3
	b _022F6E44 ; case 4
	b _022F6E44 ; case 5
	b _022F6E18 ; case 6
	b _022F6E44 ; case 7
	b _022F6E44 ; case 8
	b _022F6E44 ; case 9
	b _022F6E44 ; case 10
	b _022F6E18 ; case 11
	b _022F6E44 ; case 12
	b _022F6E18 ; case 13
	b _022F6E18 ; case 14
	b _022F6E18 ; case 15
	b _022F6E18 ; case 16
	b _022F6E44 ; case 17
	b _022F6E44 ; case 18
	b _022F6E18 ; case 19
	b _022F6E44 ; case 20
	b _022F6E18 ; case 21
	b _022F6E44 ; case 22
	b _022F6E44 ; case 23
	b _022F6E44 ; case 24
	b _022F6E44 ; case 25
	b _022F6E44 ; case 26
	b _022F6E44 ; case 27
	b _022F6E18 ; case 28
	b _022F6E20 ; case 29
	b _022F6E44 ; case 30
	b _022F6E44 ; case 31
	b _022F6E20 ; case 32
	b _022F6E18 ; case 33
	b _022F6E44 ; case 34
	b _022F6E44 ; case 35
	b _022F6E18 ; case 36
	b _022F6E44 ; case 37
	b _022F6E44 ; case 38
	b _022F6E20 ; case 39
	b _022F6E18 ; case 40
	b _022F6E44 ; case 41
	b _022F6E44 ; case 42
	b _022F6E44 ; case 43
	b _022F6E18 ; case 44
	b _022F6E44 ; case 45
	b _022F6E18 ; case 46
	b _022F6E18 ; case 47
	b _022F6E18 ; case 48
	b _022F6E44 ; case 49
	b _022F6E18 ; case 50
	b _022F6E18 ; case 51
	b _022F6E18 ; case 52
	b _022F6E18 ; case 53
	b _022F6E18 ; case 54
	b _022F6E18 ; case 55
	b _022F6E44 ; case 56
	b _022F6E44 ; case 57
	b _022F6E44 ; case 58
	b _022F6E20 ; case 59
	b _022F6E20 ; case 60
	b _022F6E20 ; case 61
_022F6410:
	ldr r2, _022F6D0C ; =0x0000016A
	cmp r0, r2
	bgt _022F6430
	bge _022F6E20
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6430:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6444
	beq _022F6E20
	b _022F6E44
_022F6444:
	add r1, r2, #3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6454:
	add r1, r2, #0x1b
	cmp r0, r1
	bgt _022F6488
	bge _022F6E18
	add r1, r2, #0x10
	cmp r0, r1
	bgt _022F6478
	beq _022F6E20
	b _022F6E44
_022F6478:
	add r1, r2, #0x1a
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6488:
	add r1, r2, #0x1c
	cmp r0, r1
	bgt _022F649C
	beq _022F6E18
	b _022F6E44
_022F649C:
	add r1, r2, #0x27
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64AC:
	sub r1, r2, #0xe7
	cmp r0, r1
	bgt _022F64F8
	bge _022F6E18
	sub r1, r2, #0xef
	cmp r0, r1
	bgt _022F64D8
	bge _022F6E18
	cmp r0, #0x1d4
	beq _022F6E18
	b _022F6E44
_022F64D8:
	cmp r0, #0x1d8
	bgt _022F64E8
	beq _022F6E20
	b _022F6E44
_022F64E8:
	sub r1, r2, #0xe8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F64F8:
	sub r1, r2, #0xdc
	cmp r0, r1
	bgt _022F6528
	bge _022F6E20
	cmp r0, #0x1e4
	bgt _022F6518
	beq _022F6E18
	b _022F6E44
_022F6518:
	sub r1, r2, #0xdd
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6528:
	sub r1, r2, #0xd5
	cmp r0, r1
	bgt _022F653C
	beq _022F6E18
	b _022F6E44
_022F653C:
	sub r1, r2, #0xd4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F654C:
	sub r3, r2, #0x45
	cmp r0, r3
	bgt _022F66B0
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	cmp r0, #0x214
	bgt _022F6610
	bge _022F6E18
	sub r1, r2, #0xc4
	cmp r0, r1
	bgt _022F65BC
	bge _022F6E18
	cmp r0, #0x1f8
	bgt _022F6598
	bge _022F6E18
	cmp r0, #0x1f4
	beq _022F6E18
	b _022F6E44
_022F6598:
	sub r1, r2, #0xc8
	cmp r0, r1
	bgt _022F65AC
	beq _022F6E18
	b _022F6E44
_022F65AC:
	sub r1, r2, #0xc7
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65BC:
	sub r1, r2, #0xb9
	cmp r0, r1
	bgt _022F65EC
	bge _022F6E20
	cmp r0, #0x204
	bgt _022F65DC
	beq _022F6E18
	b _022F6E44
_022F65DC:
	sub r1, r2, #0xbd
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F65EC:
	sub r1, r2, #0xb8
	cmp r0, r1
	bgt _022F6600
	beq _022F6E20
	b _022F6E44
_022F6600:
	sub r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6610:
	sub r1, r2, #0x91
	cmp r0, r1
	bgt _022F665C
	bge _022F6E20
	sub r1, r2, #0xaf
	cmp r0, r1
	bgt _022F6640
	bge _022F6E20
	sub r1, r2, #0xb1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6640:
	cmp r0, #0x218
	bgt _022F6650
	beq _022F6E18
	b _022F6E44
_022F6650:
	cmp r0, #0x228
	beq _022F6E20
	b _022F6E44
_022F665C:
	cmp r0, #0x264
	bgt _022F668C
	bge _022F6E18
	sub r1, r2, #0x90
	cmp r0, r1
	bgt _022F667C
	beq _022F6E20
	b _022F6E44
_022F667C:
	sub r1, r2, #0x88
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F668C:
	sub r1, r2, #0x5f
	cmp r0, r1
	bgt _022F66A0
	beq _022F6E18
	b _022F6E44
_022F66A0:
	sub r1, r2, #0x58
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66B0:
	cmp r0, #0x2a0
	bgt _022F6780
	bge _022F6E18
	sub r3, r2, #0x39
	cmp r0, r3
	bgt _022F6718
	mov r1, r3
	cmp r0, r1
	bge _022F6E20
	sub r1, r2, #0x3d
	cmp r0, r1
	bgt _022F66F4
	bge _022F6E18
	sub r1, r2, #0x44
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F66F4:
	sub r1, r2, #0x3c
	cmp r0, r1
	bgt _022F6708
	beq _022F6E20
	b _022F6E44
_022F6708:
	sub r1, r2, #0x3b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6718:
	sub r3, r2, #0x2f
	cmp r0, r3
	bgt _022F6754
	mov r1, r3
	cmp r0, r1
	bge _022F6E18
	sub r1, r2, #0x34
	cmp r0, r1
	bgt _022F6744
	beq _022F6E20
	b _022F6E44
_022F6744:
	sub r1, r2, #0x33
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6754:
	sub r3, r2, #0x2d
	cmp r0, r3
	bgt _022F6770
	sub r2, r2, #0x2d
	cmp r0, r2
	beq _022F6E28
	b _022F6E44
_022F6770:
	sub r1, r2, #0x27
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6780:
	sub r1, r2, #0x13
	cmp r0, r1
	bgt _022F67D0
	bge _022F6E20
	sub r1, r2, #0x24
	cmp r0, r1
	bgt _022F67B0
	bge _022F6E18
	sub r1, r2, #0x25
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67B0:
	cmp r0, #0x2b0
	bgt _022F67C0
	beq _022F6E18
	b _022F6E44
_022F67C0:
	sub r1, r2, #0x15
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F67D0:
	sub r1, r2, #0xc
	cmp r0, r1
	bgt _022F6800
	bge _022F6E20
	cmp r0, #0x2b4
	bgt _022F67F0
	beq _022F6E18
	b _022F6E44
_022F67F0:
	sub r1, r2, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6800:
	sub r1, r2, #0xb
	cmp r0, r1
	bgt _022F6814
	beq _022F6E20
	b _022F6E44
_022F6814:
	sub r1, r2, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6824:
	add r1, r2, #0xec
	cmp r0, r1
	bgt _022F6AF8
	bge _022F6E18
	add r1, r2, #0x53
	cmp r0, r1
	bgt _022F69A0
	bge _022F6E18
	add r1, r2, #0x34
	cmp r0, r1
	bgt _022F68FC
	bge _022F6E20
	add r1, r2, #0x13
	cmp r0, r1
	bgt _022F68A4
	bge _022F6E18
	add r1, r2, #7
	cmp r0, r1
	bgt _022F6880
	bge _022F6E18
	cmp r0, #0x2cc
	beq _022F6E18
	b _022F6E44
_022F6880:
	add r1, r2, #8
	cmp r0, r1
	bgt _022F6894
	beq _022F6E18
	b _022F6E44
_022F6894:
	add r1, r2, #9
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68A4:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F68D8
	bge _022F6E20
	add r1, r2, #0x14
	cmp r0, r1
	bgt _022F68C8
	beq _022F6E18
	b _022F6E44
_022F68C8:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F68D8:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F68EC
	beq _022F6E20
	b _022F6E44
_022F68EC:
	add r1, r2, #0x20
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F68FC:
	add r1, r2, #0x3b
	cmp r0, r1
	bgt _022F694C
	bge _022F6E18
	cmp r0, #0x2fc
	bgt _022F6928
	bge _022F6E20
	add r1, r2, #0x35
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6928:
	add r1, r2, #0x37
	cmp r0, r1
	bgt _022F693C
	beq _022F6E18
	b _022F6E44
_022F693C:
	add r1, r2, #0x38
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F694C:
	add r1, r2, #0x4f
	cmp r0, r1
	bgt _022F697C
	bge _022F6E18
	add r1, r2, #0x4d
	cmp r0, r1
	bgt _022F6970
	beq _022F6E20
	b _022F6E44
_022F6970:
	cmp r0, #0x314
	beq _022F6E20
	b _022F6E44
_022F697C:
	add r1, r2, #0x50
	cmp r0, r1
	bgt _022F6990
	beq _022F6E20
	b _022F6E44
_022F6990:
	add r1, r2, #0x51
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69A0:
	cmp r0, #0x370
	bgt _022F6A50
	bge _022F6E20
	add r1, r2, #0x7c
	cmp r0, r1
	bgt _022F69F8
	bge _022F6E18
	cmp r0, #0x320
	bgt _022F69D8
	bge _022F6E18
	add r1, r2, #0x58
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69D8:
	cmp r0, #0x340
	bgt _022F69E8
	beq _022F6E18
	b _022F6E44
_022F69E8:
	add r1, r2, #0x7b
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F69F8:
	add r1, r2, #0x8f
	cmp r0, r1
	bgt _022F6A2C
	bge _022F6E18
	add r1, r2, #0x80
	cmp r0, r1
	bgt _022F6A1C
	beq _022F6E18
	b _022F6E44
_022F6A1C:
	add r1, r2, #0x8c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6A2C:
	add r1, r2, #0x90
	cmp r0, r1
	bgt _022F6A40
	beq _022F6E20
	b _022F6E44
_022F6A40:
	add r1, r2, #0xa4
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A50:
	add r1, r2, #0xc4
	cmp r0, r1
	bgt _022F6AA4
	bge _022F6E18
	add r1, r2, #0xb4
	cmp r0, r1
	bgt _022F6A80
	bge _022F6E20
	add r1, r2, #0xb3
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6A80:
	add r1, r2, #0xb9
	cmp r0, r1
	bgt _022F6A94
	beq _022F6E18
	b _022F6E44
_022F6A94:
	add r1, r2, #0xbb
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AA4:
	add r1, r2, #0xd1
	cmp r0, r1
	bgt _022F6AD4
	bge _022F6E18
	add r1, r2, #0xc5
	cmp r0, r1
	bgt _022F6AC8
	beq _022F6E18
	b _022F6E44
_022F6AC8:
	cmp r0, #0x390
	beq _022F6E18
	b _022F6E44
_022F6AD4:
	add r1, r2, #0xdb
	cmp r0, r1
	bgt _022F6AE8
	beq _022F6E20
	b _022F6E44
_022F6AE8:
	add r1, r2, #0xe1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6AF8:
	add r1, r2, #0x124
	cmp r0, r1
	bgt _022F6C94
	bge _022F6E18
	ldr r1, _022F6D10 ; =0x000003D1
	cmp r0, r1
	bgt _022F6BD4
	bge _022F6E18
	sub r2, r1, #0x14
	cmp r0, r2
	bgt _022F6B70
	bge _022F6E20
	cmp r0, #0x3b4
	bgt _022F6B44
	bge _022F6E18
	sub r1, r1, #0x1e
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B44:
	sub r2, r1, #0x1c
	cmp r0, r2
	bgt _022F6B60
	sub r1, r1, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B60:
	sub r1, r1, #0x18
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B70:
	sub r2, r1, #0xf
	cmp r0, r2
	bgt _022F6BAC
	bge _022F6E20
	sub r2, r1, #0x13
	cmp r0, r2
	bgt _022F6B9C
	sub r1, r1, #0x13
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6B9C:
	sub r1, r1, #0x10
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6BAC:
	sub r2, r1, #0xe
	cmp r0, r2
	bgt _022F6BC8
	sub r1, r1, #0xe
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6BC8:
	cmp r0, #0x3c8
	beq _022F6E18
	b _022F6E44
_022F6BD4:
	add r2, r1, #8
	cmp r0, r2
	bgt _022F6C2C
	bge _022F6E18
	cmp r0, #0x3d4
	bgt _022F6C00
	bge _022F6E18
	add r1, r1, #2
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C00:
	add r2, r1, #4
	cmp r0, r2
	bgt _022F6C1C
	add r1, r1, #4
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C1C:
	add r1, r1, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C2C:
	add r2, r1, #0x12
	cmp r0, r2
	bgt _022F6C68
	bge _022F6E20
	add r2, r1, #0xa
	cmp r0, r2
	bgt _022F6C58
	add r1, r1, #0xa
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C58:
	add r1, r1, #0x11
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C68:
	add r2, r1, #0x15
	cmp r0, r2
	bgt _022F6C84
	add r1, r1, #0x15
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6C84:
	add r1, r1, #0x16
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6C94:
	cmp r0, #0x430
	bgt _022F6D70
	bge _022F6E20
	ldr r2, _022F6D14 ; =0x00000413
	cmp r0, r2
	bgt _022F6D18
	bge _022F6E20
	sub r1, r2, #0x12
	cmp r0, r1
	bgt _022F6CD0
	bge _022F6E20
	sub r1, r2, #0x26
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
_022F6CD0:
	sub r1, r2, #0x11
	cmp r0, r1
	bgt _022F6CE4
	beq _022F6E20
	b _022F6E44
_022F6CE4:
	sub r1, r2, #0x10
	cmp r0, r1
	beq _022F6E20
	b _022F6E44
	.align 2, 0
_022F6CF4: .word 0x000002C6
_022F6CF8: .word 0x00000121
_022F6CFC: .word 0x00000133
_022F6D00: .word 0x0000014F
_022F6D04: .word 0x0000015D
_022F6D08: .word 0x000001AB
_022F6D0C: .word 0x0000016A
_022F6D10: .word 0x000003D1
_022F6D14: .word 0x00000413
_022F6D18:
	add r1, r2, #0x18
	cmp r0, r1
	bgt _022F6D4C
	bge _022F6E18
	add r1, r2, #0xb
	cmp r0, r1
	bgt _022F6D3C
	beq _022F6E18
	b _022F6E44
_022F6D3C:
	add r1, r2, #0x17
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D4C:
	add r1, r2, #0x19
	cmp r0, r1
	bgt _022F6D60
	beq _022F6E18
	b _022F6E44
_022F6D60:
	add r1, r2, #0x1c
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6D70:
	add r1, r2, #0x184
	cmp r0, r1
	bgt _022F6DC4
	bge _022F6E18
	ldr r2, _022F6E4C ; =0x00000441
	cmp r0, r2
	bgt _022F6DA0
	bge _022F6E20
	sub r1, r2, #5
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DA0:
	add r1, r2, #1
	cmp r0, r1
	bgt _022F6DB4
	beq _022F6E20
	b _022F6E44
_022F6DB4:
	add r1, r2, #8
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DC4:
	add r1, r2, #0x190
	cmp r0, r1
	bgt _022F6DF8
	bge _022F6E18
	ldr r1, _022F6E50 ; =0x0000044B
	cmp r0, r1
	bgt _022F6DE8
	beq _022F6E18
	b _022F6E44
_022F6DE8:
	add r1, r1, #1
	cmp r0, r1
	beq _022F6E18
	b _022F6E44
_022F6DF8:
	ldr r1, _022F6E54 ; =0x00000457
	cmp r0, r1
	bgt _022F6E0C
	beq _022F6E18
	b _022F6E44
_022F6E0C:
	add r1, r1, #3
	cmp r0, r1
	bne _022F6E44
_022F6E18:
	ldr r0, _022F6E58 ; =0x00000807
	bx lr
_022F6E20:
	ldr r0, _022F6E5C ; =0x00000307
	bx lr
_022F6E28:
	ldr r0, _022F6E58 ; =0x00000807
	cmp r1, r0
	subne r0, r0, #0x500
	cmpne r1, r0
	ldreq r0, _022F6E58 ; =0x00000807
	movne r0, #0x300
	bx lr
_022F6E44:
	mov r0, #0x300
	bx lr
	.align 2, 0
_022F6E4C: .word 0x00000441
_022F6E50: .word 0x0000044B
_022F6E54: .word 0x00000457
_022F6E58: .word 0x00000807
_022F6E5C: .word 0x00000307
	arm_func_end GetIdleAnimationType

	arm_func_start LoadObjectAnimData
LoadObjectAnimData: ; 0x022F6E60
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x80
	mov r6, r2
	mov r4, r0
	tst r6, #0x80000000
	movne r5, #0xf
	ldr r2, _022F6EF0 ; =OBJECTS
	mov r0, #0xc
	moveq r5, #0xe
	smlabb r0, r1, r0, r2
	ldr r2, [r0, #4]
	cmp r2, #0
	moveq r2, #0
	beq _022F6EBC
	ldr r1, _022F6EF4 ; =ov11_023213F0
	add r0, sp, #0
	bl sprintf
	ldr r0, _022F6EF8 ; =WAN_TABLE
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, r5
	bl LoadWanTableEntry
	mov r2, r0
_022F6EBC:
	mov r0, r4
	mov r3, r6
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6EE8
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F6EE8:
	add sp, sp, #0x80
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F6EF0: .word OBJECTS
_022F6EF4: .word ov11_023213F0
_022F6EF8: .word WAN_TABLE
	arm_func_end LoadObjectAnimData

	arm_func_start ov11_022F6EFC
ov11_022F6EFC: ; 0x022F6EFC
	ldr ip, _022F6F04 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6F04: .word ov11_022F4BE4
	arm_func_end ov11_022F6EFC

	arm_func_start InitAnimDataFromOtherAnimDataVeneer
InitAnimDataFromOtherAnimDataVeneer: ; 0x022F6F08
	ldr ip, _022F6F10 ; =InitAnimDataFromOtherAnimData
	bx ip
	.align 2, 0
_022F6F10: .word InitAnimDataFromOtherAnimData
	arm_func_end InitAnimDataFromOtherAnimDataVeneer

	arm_func_start AnimRelatedFunction__022F6F14
AnimRelatedFunction__022F6F14: ; 0x022F6F14
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end AnimRelatedFunction__022F6F14

	arm_func_start ov11_022F6F4C
ov11_022F6F4C: ; 0x022F6F4C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mvn lr, #0
	mov ip, #1
	mov r3, r2
	add r1, sp, #0
	mov r4, r0
	strh lr, [sp, #2]
	strh ip, [sp, #4]
	mov r2, #0
	bl ov11_022F4AB8
	ldrsh r0, [r4, #0x92]
	cmp r0, #0
	blt _022F6F94
	mov r0, r4
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F6F94:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end ov11_022F6F4C

	arm_func_start ov11_022F6F9C
ov11_022F6F9C: ; 0x022F6F9C
	ldr ip, _022F6FA4 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F6FA4: .word ov11_022F4BE4
	arm_func_end ov11_022F6F9C

	arm_func_start ov11_022F6FA8
ov11_022F6FA8: ; 0x022F6FA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov11_022F6FA8

	arm_func_start ov11_022F6FE0
ov11_022F6FE0: ; 0x022F6FE0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r3, r1
	mov r5, r0
	mov r4, r2
	ldr r1, _022F7050 ; =ov11_02321400
	add r0, sp, #0
	mov r2, r3
	bl sprintf
	ldr r0, _022F7054 ; =WAN_TABLE
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #0xe
	bl LoadWanTableEntry
	mov r2, r0
	mov r3, r4
	mov r0, r5
	mov r1, #0
	bl ov11_022F4AB8
	ldrsh r0, [r5, #0x92]
	cmp r0, #0
	blt _022F7048
	mov r0, r5
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_022F7048:
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7050: .word ov11_02321400
_022F7054: .word WAN_TABLE
	arm_func_end ov11_022F6FE0

	arm_func_start ov11_022F7058
ov11_022F7058: ; 0x022F7058
	ldr ip, _022F7060 ; =ov11_022F4BE4
	bx ip
	.align 2, 0
_022F7060: .word ov11_022F4BE4
	arm_func_end ov11_022F7058

	arm_func_start AnimRelatedFunction__022F7064
AnimRelatedFunction__022F7064: ; 0x022F7064
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r2, r5
	mov r3, r4
	mov r1, #0
	bl ov11_022F5460
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	bl ov11_022F5960
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end AnimRelatedFunction__022F7064

	arm_func_start ov11_022F709C
ov11_022F709C: ; 0x022F709C
	stmdb sp!, {r3, lr}
	mov r0, #0x124
	mov r1, #6
	bl MemAlloc
	ldr r3, _022F70C8 ; =GROUND_STATE_PTRS
	ldr r1, _022F70CC ; =ov11_02321414
	mov r2, #0
	str r0, [r3]
	bl InitScriptRoutine
	bl ov11_022F7104
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F70C8: .word GROUND_STATE_PTRS
_022F70CC: .word ov11_02321414
	arm_func_end ov11_022F709C

	arm_func_start ov11_022F70D0
ov11_022F70D0: ; 0x022F70D0
	stmdb sp!, {r3, lr}
	bl ov11_022F7104
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl ov11_022DC934
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7100 ; =GROUND_STATE_PTRS
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7100: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F70D0

	arm_func_start ov11_022F7104
ov11_022F7104: ; 0x022F7104
	stmdb sp!, {r3, lr}
	ldr r0, _022F713C ; =GROUND_STATE_PTRS
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0xf0]
	ldr r1, [r0]
	str r2, [r1, #0x10c]
	ldr r0, [r0]
	bl ov11_022DCAE0
	ldr r0, _022F713C ; =GROUND_STATE_PTRS
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F713C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7104

	arm_func_start ov11_022F7140
ov11_022F7140: ; 0x022F7140
	stmdb sp!, {r3, lr}
	ldr r1, _022F7180 ; =ov11_02321464
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F7184 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r0, [r1]
	mov r3, #0x48
	str r2, [r0, #0x10c]
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x100
	strh r3, [r0, #0x10]
	ldr r0, [r1]
	strb r2, [r0, #0x11d]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7180: .word ov11_02321464
_022F7184: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7140

	arm_func_start ov11_022F7188
ov11_022F7188: ; 0x022F7188
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F71DC ; =ov11_023214A0
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F71E0 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #2
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x10]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F71DC: .word ov11_023214A0
_022F71E0: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7188

	arm_func_start ov11_022F71E4
ov11_022F71E4: ; 0x022F71E4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, _022F7224 ; =ov11_023214E4
	mov r2, r4
	mov r0, #2
	bl Debug_Print
	ldr r0, _022F7228 ; =GROUND_STATE_PTRS
	ldr r2, [r0]
	ldr r1, [r2, #0x10c]
	cmp r1, #1
	movne r1, #3
	strne r1, [r2, #0x10c]
	ldrne r0, [r0]
	addne r0, r0, #0x100
	strneh r4, [r0, #0x12]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7224: .word ov11_023214E4
_022F7228: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F71E4

	arm_func_start ov11_022F722C
ov11_022F722C: ; 0x022F722C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r6, r0
	mov r4, r2
	ldr r1, _022F7298 ; =ov11_0232150C
	mov r2, r6
	mov r3, r5
	mov r0, #2
	str r4, [sp]
	bl Debug_Print
	ldr r1, _022F729C ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7290
	mov r0, #4
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r6, [r0, #0x12]
	ldr r0, [r1]
	strb r5, [r0, #0x11c]
	ldr r0, [r1]
	strb r4, [r0, #0x11d]
_022F7290:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F7298: .word ov11_0232150C
_022F729C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F722C

	arm_func_start ov11_022F72A0
ov11_022F72A0: ; 0x022F72A0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F72F0
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F734C ; =ov11_02321548
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl Debug_Print
_022F72F0:
	ldr r1, _022F7350 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7344
	mov r0, #5
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F7324:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7324
	ldr r0, _022F7350 ; =GROUND_STATE_PTRS
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F7344:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F734C: .word ov11_02321548
_022F7350: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F72A0

	arm_func_start ov11_022F7354
ov11_022F7354: ; 0x022F7354
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #2
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F73A4
	add r1, sp, #8
	mov r0, r6
	bl ov11_022E466C
	str r5, [sp]
	ldr r1, _022F7400 ; =ov11_02321580
	add r3, sp, #8
	mov r2, r7
	mov r0, #2
	str r4, [sp, #4]
	bl Debug_Print
_022F73A4:
	ldr r1, _022F7404 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F73F8
	mov r0, #6
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r7, [r0, #0x12]
	ldr r3, [r1]
	add r1, r3, #0x114
_022F73D8:
	ldrb r0, [r6], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F73D8
	ldr r0, _022F7404 ; =GROUND_STATE_PTRS
	strb r5, [r3, #0x11c]
	ldr r0, [r0]
	strb r4, [r0, #0x11d]
_022F73F8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_022F7400: .word ov11_02321580
_022F7404: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7354

	arm_func_start ov11_022F7408
ov11_022F7408: ; 0x022F7408
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F7444
	add r1, sp, #0
	mov r0, r5
	bl ov11_022E466C
	ldr r1, _022F7498 ; =ov11_023215B8
	add r2, sp, #0
	mov r0, #2
	bl Debug_Print
_022F7444:
	ldr r1, _022F749C ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7490
	mov r0, #7
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #6
	add r0, r0, #0x100
	strh r2, [r0, #0x1e]
	ldr r3, [r1]
	mov r1, #8
	add r2, r3, #0x114
_022F747C:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [r2], #1
	bne _022F747C
	strb r4, [r3, #0x11d]
_022F7490:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F7498: .word ov11_023215B8
_022F749C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7408

	arm_func_start ov11_022F74A0
ov11_022F74A0: ; 0x022F74A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r1, _022F74F8 ; =ov11_023215E4
	mov r2, r5
	mov r3, r4
	mov r0, #2
	bl Debug_Print
	ldr r1, _022F74FC ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #8
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r5, [r0, #0x1e]
	ldr r0, [r1]
	add r0, r0, #0x100
	strh r4, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F74F8: .word ov11_023215E4
_022F74FC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F74A0

	arm_func_start ov11_022F7500
ov11_022F7500: ; 0x022F7500
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r0, #2
	mov r4, r1
	bl Debug_GetLogFlag
	cmp r0, #0
	beq _022F7540
	add r1, sp, #0
	mov r0, r4
	bl ov11_022E466C
	ldr r1, _022F758C ; =ov11_02321614
	add r3, sp, #0
	mov r2, r5
	mov r0, #2
	bl Debug_Print
_022F7540:
	ldr r1, _022F7590 ; =GROUND_STATE_PTRS
	ldr r2, [r1]
	ldr r0, [r2, #0x10c]
	cmp r0, #1
	beq _022F7584
	mov r0, #9
	str r0, [r2, #0x10c]
	ldr r0, [r1]
	mov r2, #8
	add r0, r0, #0x100
	strh r5, [r0, #0x12]
	ldr r0, [r1]
	add r1, r0, #0x114
_022F7574:
	ldrb r0, [r4], #1
	subs r2, r2, #1
	strb r0, [r1], #1
	bne _022F7574
_022F7584:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_022F758C: .word ov11_02321614
_022F7590: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7500

	arm_func_start ov11_022F7594
ov11_022F7594: ; 0x022F7594
	stmdb sp!, {r3, lr}
	ldr r1, _022F75BC ; =GROUND_STATE_PTRS
	mov ip, #1
	ldr r3, [r1]
	mov r2, r0
	strb ip, [r3, #0xec]
	ldr r0, [r1]
	mov r1, #0
	bl ov11_022DCCEC
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F75BC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7594

	arm_func_start ov11_022F75C0
ov11_022F75C0: ; 0x022F75C0
	ldr r0, _022F75EC ; =GROUND_STATE_PTRS
	ldr r1, [r0]
	ldr r0, [r1, #0x10c]
	cmp r0, #0
	movne r0, #1
	bxne lr
	ldr r0, [r1, #0xf0]
	cmp r0, #0
	movne r0, #1
	ldreqb r0, [r1, #0xec]
	bx lr
	.align 2, 0
_022F75EC: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F75C0

	arm_func_start ov11_022F75F0
ov11_022F75F0: ; 0x022F75F0
	stmdb sp!, {r4, lr}
	ldr r1, _022F7624 ; =GROUND_STATE_PTRS
	mov r4, r0
	ldr r0, [r1]
	bl ov11_022DC958
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _022F7624 ; =GROUND_STATE_PTRS
	mov r1, r4
	ldr r0, [r0]
	bl ov11_022DCA58
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F7624: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F75F0

	arm_func_start ov11_022F7628
ov11_022F7628: ; 0x022F7628
	stmdb sp!, {r3, lr}
	ldr r0, _022F764C ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0x10c]
	cmp r1, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl ov11_022DCA70
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F764C: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7628

	arm_func_start UnlockMainRoutine
UnlockMainRoutine: ; 0x022F7650
	ldr r2, _022F7664 ; =GROUND_STATE_PTRS
	ldr ip, _022F7668 ; =UnlockRoutine
	mov r1, r0
	ldr r0, [r2]
	bx ip
	.align 2, 0
_022F7664: .word GROUND_STATE_PTRS
_022F7668: .word UnlockRoutine
	arm_func_end UnlockMainRoutine

	arm_func_start ov11_022F766C
ov11_022F766C: ; 0x022F766C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r1, [r0]
	ldr r0, [r1, #0xf0]
	cmp r0, #2
	bne _022F78F8
	ldr r2, [r1, #0xf4]
	ldr r1, _022F7BBC ; =ov11_02321644
	mov r0, #2
	bl Debug_Print
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r4, #0
	ldr r1, [r0]
	str r4, [r1, #0xf0]
	ldr r1, [r0]
	ldr r0, [r1, #0xf4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _022F7B80
_022F76BC: ; jump table
	b _022F7B80 ; case 0
	b _022F7B80 ; case 1
	b _022F7B80 ; case 2
	b _022F76E0 ; case 3
	b _022F773C ; case 4
	b _022F77BC ; case 5
	b _022F783C ; case 6
	b _022F78B0 ; case 7
	b _022F78E0 ; case 8
_022F76E0:
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r3, #1
	ldr r0, [r0]
	add r2, sp, #4
	mov r1, r4
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r3, #1
	ldr r2, [r0]
	mov r0, r4
	mov r1, #0xa
	strb r3, [r2, #0xec]
	bl ov11_022F881C
	b _022F7B80
_022F773C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	mov r3, r1
	sub r2, r1, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F77BC:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #2
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F7B80
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrb r0, [r0, #0x105]
	cmp r0, #0
	bne _022F7B80
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F783C:
	add r0, r1, #0x100
	ldrsb r4, [r0, #4]
	mov r1, #1
	add r0, sp, #4
	sub r2, r1, #2
	mov r3, #3
	str r4, [sp]
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F78A0
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78A0:
	mov r0, #0
	mov r1, #0xa
	bl ov11_022F881C
	b _022F7B80
_022F78B0:
	ldrb r0, [r1, #0x105]
	cmp r0, #0
	movne r0, #2
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov11_022E5BF4
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78E0:
	bl ov11_022E5C84
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
	b _022F7B80
_022F78F8:
	cmp r0, #0
	bne _022F7B80
	ldr r2, [r1, #0x10c]
	cmp r2, #0
	beq _022F7B80
	ldr r1, _022F7BC0 ; =ov11_02321664
	mov r0, #2
	bl Debug_Print
	ldr ip, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r5, [ip]
	add r4, r5, #0x10c
	add lr, r5, #0xf4
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	mov r1, #1
	str r1, [r5, #0xf0]
	ldr r2, [ip]
	mov r0, #0
	str r0, [r2, #0x10c]
	ldr r3, [ip]
	ldr r2, [r3, #0xf4]
	cmp r2, #9
	addls pc, pc, r2, lsl #2
	b _022F7B78
_022F7960: ; jump table
	b _022F7B78 ; case 0
	b _022F7988 ; case 1
	b _022F7988 ; case 2
	b _022F79E8 ; case 3
	b _022F7A10 ; case 4
	b _022F7A4C ; case 5
	b _022F7A8C ; case 6
	b _022F7ADC ; case 7
	b _022F7B2C ; case 8
	b _022F7B68 ; case 9
_022F7988:
	ldrsh r1, [r3, #0xf8]
	add r0, sp, #4
	bl GetCoroutineInfo
	cmp r0, #0
	beq _022F79D4
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	add r2, sp, #4
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r3, #2
	moveq r3, #1
	mov r1, #0
	strh r3, [sp, #0x1c]
	bl ov11_022DCCEC
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0xec]
_022F79D4:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0xf0]
	b _022F7B80
_022F79E8:
	mov r0, r3
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A10:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	ldrsh r0, [r0, #0xfa]
	bl ov11_022E5148
	b _022F7B80
_022F7A4C:
	ldrb r0, [r3, #0x105]
	cmp r0, #0
	movne r1, #2
	mov r1, r1, lsl #0x10
	mov r0, r3
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5188
	b _022F7B80
_022F7A8C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r1, [r0]
	ldrsh r0, [r1, #0xfa]
	add r1, r1, #0xfc
	bl ov11_022E5314
	b _022F7B80
_022F7ADC:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldrb r1, [r0, #0x105]
	cmp r1, #0
	movne r1, #2
	moveq r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ScriptStationLoadTalk
	b _022F7B80
_022F7B2C:
	mov r1, #0xb
	bl ov11_022F881C
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r1, #1
	ldr r0, [r0]
	bl ov11_022DCB48
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	mov r2, #1
	ldr r1, [r0]
	strb r2, [r1, #0xec]
	ldr r0, [r0]
	add r0, r0, #0x100
	ldrsh r0, [r0, #6]
	bl ScriptStationLoadTalk
	b _022F7B80
_022F7B68:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	bl ov11_022E5258
	b _022F7B80
_022F7B78:
	mov r0, #0
	str r0, [r3, #0xf0]
_022F7B80:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	bne _022F7B98
	bl FuncThatCallsRunNextOpcode
_022F7B98:
	ldr r0, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	bl ov11_022DC940
	ldr r1, _022F7BB8 ; =GROUND_STATE_PTRS
	ldr r1, [r1]
	strb r0, [r1, #0xec]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F7BB8: .word GROUND_STATE_PTRS
_022F7BBC: .word ov11_02321644
_022F7BC0: .word ov11_02321664
	arm_func_end ov11_022F766C

	arm_func_start ov11_022F7BC4
ov11_022F7BC4: ; 0x022F7BC4
	stmdb sp!, {r3, lr}
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	ldr r3, [r0]
	ldr r0, [r3, #0xf0]
	cmp r0, #1
	bne _022F7C9C
	ldr r0, [r3, #0xf4]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022F7C8C
_022F7BEC: ; jump table
	b _022F7C8C ; case 0
	b _022F7C8C ; case 1
	b _022F7C8C ; case 2
	b _022F7C14 ; case 3
	b _022F7C20 ; case 4
	b _022F7C2C ; case 5
	b _022F7C44 ; case 6
	b _022F7C5C ; case 7
	b _022F7C68 ; case 8
	b _022F7C7C ; case 9
_022F7C14:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C20:
	ldrsh r0, [r3, #0xfa]
	bl ov11_022E544C
	b _022F7C8C
_022F7C2C:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E551C
	b _022F7C8C
_022F7C44:
	add r1, r3, #0x100
	ldrsh r0, [r3, #0xfa]
	ldrsb r2, [r1, #4]
	add r1, r3, #0xfc
	bl ov11_022E56B8
	b _022F7C8C
_022F7C5C:
	add r0, r3, #0xfc
	bl ov11_022E584C
	b _022F7C8C
_022F7C68:
	add r1, r3, #0x100
	ldrsh r0, [r1, #6]
	ldrsh r1, [r1, #8]
	bl ov11_022E590C
	b _022F7C8C
_022F7C7C:
	ldrsh r0, [r3, #0xfa]
	add r1, r3, #0xfc
	mov r2, #0
	bl ov11_022E551C
_022F7C8C:
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0xf0]
_022F7C9C:
	ldr r0, _022F7CB8 ; =GROUND_STATE_PTRS
	ldr r0, [r0]
	ldr r1, [r0, #0xf0]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	bl ov11_022DD2C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7CB8: .word GROUND_STATE_PTRS
	arm_func_end ov11_022F7BC4

	arm_func_start AllocAndInitPartnerFollowDataAndLiveActorList
AllocAndInitPartnerFollowDataAndLiveActorList: ; 0x022F7CBC
	stmdb sp!, {r3, lr}
	mov r0, #0x330
	mov r1, #6
	bl MemAlloc
	ldr r2, _022F7D14 ; =ov11_02324CF8
	mov r1, #6
	str r0, [r2]
	mov r0, #0x3780
	bl MemAlloc
	ldr r1, _022F7D14 ; =ov11_02324CF8
	mov r3, #0
	str r0, [r1, #4]
	mvn r2, #0
_022F7CF0:
	add r1, r3, #1
	mov r1, r1, lsl #0x10
	mov r3, r1, asr #0x10
	strh r2, [r0, #2]
	cmp r3, #0x18
	add r0, r0, #0x250
	blt _022F7CF0
	bl InitPartnerFollowDataAndLiveActorList
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7D14: .word ov11_02324CF8
	arm_func_end AllocAndInitPartnerFollowDataAndLiveActorList

	arm_func_start InitPartnerFollowDataAndLiveActorList
InitPartnerFollowDataAndLiveActorList: ; 0x022F7D18
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _022F7DD0 ; =ov11_02324CF8
	mov r5, #0
	ldr r6, [r0, #4]
	mvn r4, #0
_022F7D2C:
	ldrsh r0, [r6, #2]
	cmp r0, r4
	beq _022F7D40
	mov r0, r5
	bl DeleteLiveActor
_022F7D40:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	cmp r5, #0x18
	add r6, r6, #0x250
	blt _022F7D2C
	ldr r2, _022F7DD0 ; =ov11_02324CF8
	mvn lr, #0
	ldr r0, [r2]
	mov r5, #0
	str lr, [r0, #0x24]
	mov r0, r5
	mov r1, #0xc
_022F7D74:
	mul r3, r5, r1
	ldr r4, [r2]
	add r5, r5, #1
	add ip, r4, r3
	str lr, [ip, #8]
	str r0, [r4, r3]
	str r0, [ip, #4]
	cmp r5, #3
	blt _022F7D74
	ldr r2, _022F7DD0 ; =ov11_02324CF8
	mov r3, #0
	mov r1, #0xc
_022F7DA4:
	mul r4, r0, r1
	ldr ip, [r2]
	add r0, r0, #1
	add ip, ip, #0x28
	str r3, [ip, r4]
	add r4, ip, r4
	str r3, [r4, #4]
	str r3, [r4, #8]
	cmp r0, #0x40
	blt _022F7DA4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F7DD0: .word ov11_02324CF8
	arm_func_end InitPartnerFollowDataAndLiveActorList

	arm_func_start ov11_022F7DD4
ov11_022F7DD4: ; 0x022F7DD4
	stmdb sp!, {r3, lr}
	bl InitPartnerFollowDataAndLiveActorList
	ldr r0, _022F7E0C ; =ov11_02324CF8
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _022F7E0C ; =ov11_02324CF8
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, [r0]
	bl MemFree
	ldr r0, _022F7E0C ; =ov11_02324CF8
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F7E0C: .word ov11_02324CF8
	arm_func_end ov11_022F7DD4

	arm_func_start GetLiveActorIdxFromScriptEntityId
GetLiveActorIdxFromScriptEntityId: ; 0x022F7E10
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r0, sp, #8
	bl sub_02065050
	ldrsh r3, [sp, #8]
	mvn r0, #0
	cmp r3, r0
	beq _022F7E64
	ldr r1, _022F7E74 ; =ov11_02324CF8
	mov r0, #0
	ldr r2, [r1, #4]
	b _022F7E5C
_022F7E40:
	ldrsh r1, [r2, #2]
	cmp r1, r3
	beq _022F7E68
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	add r2, r2, #0x250
_022F7E5C:
	cmp r0, #0x18
	blt _022F7E40
_022F7E64:
	mvn r0, #0
_022F7E68:
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F7E74: .word ov11_02324CF8
	arm_func_end GetLiveActorIdxFromScriptEntityId

	arm_func_start ov11_022F7E78
ov11_022F7E78: ; 0x022F7E78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r8, r1
	ldrh r4, [r8]
	mov sb, r0
	add r0, sp, #0x12
	add r1, sp, #0x10
	strh r4, [sp, #0x12]
	mov sl, r2
	mov fp, r3
	bl sub_0206549C
	mov r6, r0
	ldrsh r1, [sp, #0x12]
	mvn r0, #0
	cmp r1, r0
	beq _022F83D8
	cmp r6, #0
	beq _022F7ED4
	cmp r6, #1
	beq _022F7EDC
	cmp r6, #2
	beq _022F7EE4
	b _022F7EFC
_022F7ED4:
	mov sb, #0
	b _022F7EFC
_022F7EDC:
	mov sb, #1
	b _022F7EFC
_022F7EE4:
	mov r0, #0
	mov r1, #0x35
	bl LoadScriptVariableValue
	cmp r0, #0
	moveq r6, #1
	mov sb, #2
_022F7EFC:
	ldrsh r3, [sp, #0x12]
	ldrsh r4, [sp, #0x10]
	ldr r7, _022F83E0 ; =ENTITIES
	mov ip, #0xc
	ldr r1, _022F83E4 ; =ov11_02321974
	mov r2, sb
	mov r0, #1
	str r4, [sp]
	smlabb r4, r3, ip, r7
	bl Debug_Print
	cmp sb, #0
	bge _022F7FE8
	ldrsh r0, [sp, #0x12]
	cmp r0, #0x3c
	beq _022F7F44
	cmp r0, #0x3f
	beq _022F7F68
	b _022F7F8C
_022F7F44:
	ldr r1, _022F83E8 ; =ov11_02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #1
	mvneq r0, #0
	beq _022F83D8
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
	b _022F7F94
_022F7F68:
	ldr r1, _022F83E8 ; =ov11_02324CF8
	ldr r1, [r1, #4]
	ldrsh r1, [r1, #2]
	cmp r1, #4
	mvneq r0, #0
	beq _022F83D8
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
	b _022F7F94
_022F7F8C:
	bl GetLiveActorIdxFromScriptEntityId
	mov sb, r0
_022F7F94:
	cmp sb, #0
	bge _022F7FDC
	ldr r0, _022F83E8 ; =ov11_02324CF8
	mov r1, #3
	ldr r0, [r0, #4]
	mvn r2, #0
	add r0, r0, #0x6f0
	b _022F7FD4
_022F7FB4:
	ldrsh r3, [r0, #2]
	cmp r3, r2
	moveq sb, r1
	beq _022F7FDC
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	add r0, r0, #0x250
_022F7FD4:
	cmp r1, #0x18
	blt _022F7FB4
_022F7FDC:
	cmp sb, #0
	mvnlt r0, #0
	blt _022F83D8
_022F7FE8:
	ldr r0, _022F83E8 ; =ov11_02324CF8
	ldrsh r1, [r4]
	ldr r2, [r0, #4]
	mov r0, #0x250
	stmia sp, {r1, sl, fp}
	ldrsh r3, [sp, #0x12]
	smlabb r7, sb, r0, r2
	ldr r1, _022F83EC ; =ov11_023219A4
	mov r2, sb
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r7, #2]
	mvn r0, #0
	cmp r1, r0
	bne _022F803C
	mov r1, #0
	add r0, r7, #0x18c
	strb r1, [r7, #4]
	mov r5, #1
	bl ov11_022F4A14
	b _022F8048
_022F803C:
	ldrsh r0, [sp, #0x12]
	cmp r1, r0
	moveq r5, #0
_022F8048:
	sub r0, sl, #1
	strh sb, [r7]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	ldrsh r1, [sp, #0x12]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	strh r1, [r7, #2]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	strlsh sl, [r7, #6]
	strlsb fp, [r7, #8]
	mvnls r0, #0
	strlsb r0, [r7, #9]
	bls _022F809C
	cmp r5, #0
	mvnne r0, #0
	strneh r0, [r7, #6]
	strneb r0, [r7, #8]
	strb fp, [r7, #9]
_022F809C:
	ldrsh r1, [sp, #0x10]
	add r0, r7, #0x12c
	strh r1, [r7, #0xa]
	bl ov11_022EA954
	mov r0, #9
	str r0, [r7, #0x12c]
	mov r2, #0
	str r2, [r7, #0x14c]
	mov r1, #1
	strb r1, [r7, #0x156]
	ldrsh r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _022F8164
_022F80D4: ; jump table
	b _022F8164 ; case 0
	b _022F8104 ; case 1
	b _022F8114 ; case 2
	b _022F8120 ; case 3
	b _022F8164 ; case 4
	b _022F8164 ; case 5
	b _022F8164 ; case 6
	b _022F812C ; case 7
	b _022F8138 ; case 8
	b _022F8144 ; case 9
	b _022F814C ; case 10
	b _022F8158 ; case 11
_022F8104:
	ldr r0, _022F83F0 ; =0x03000743
	str r0, [r7, #0x128]
	str r1, [r7, #0x12c]
	b _022F816C
_022F8114:
	ldr r0, _022F83F4 ; =0x03000002
	str r0, [r7, #0x128]
	b _022F816C
_022F8120:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
	b _022F816C
_022F812C:
	mov r0, #0x340
	str r0, [r7, #0x128]
	b _022F816C
_022F8138:
	mov r0, #0x20000
	str r0, [r7, #0x128]
	b _022F816C
_022F8144:
	str r2, [r7, #0x128]
	b _022F816C
_022F814C:
	mov r0, #0xc0000
	str r0, [r7, #0x128]
	b _022F816C
_022F8158:
	mov r0, #0x10000
	str r0, [r7, #0x128]
	b _022F816C
_022F8164:
	ldr r0, _022F83F8 ; =0x03002358
	str r0, [r7, #0x128]
_022F816C:
	ldrb r0, [r4, #0xa]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0xc]
	ldrb r0, [r4, #0xb]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x10]
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	str r0, [r7, #0x18]
	ldrsb r0, [r8, #2]
	strb r0, [r7, #0x1c]
	ldrb r0, [r8, #5]
	tst r0, #4
	bne _022F81D8
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x20]
	ldrb r0, [r8, #5]
	tst r0, #2
	ldrne r0, [r7, #0x20]
	addne r0, r0, #0x400
	strne r0, [r7, #0x20]
_022F81D8:
	ldrb r0, [r8, #6]
	tst r0, #4
	bne _022F8204
	ldrb r0, [r8, #4]
	mov r0, r0, lsl #0xb
	str r0, [r7, #0x24]
	ldrb r0, [r8, #6]
	tst r0, #2
	ldrne r0, [r7, #0x24]
	addne r0, r0, #0x400
	strne r0, [r7, #0x24]
_022F8204:
	ldrb r0, [sp, #0x38]
	cmp r0, #0
	ldrne r0, [r7, #0x128]
	orrne r0, r0, #0x800000
	strne r0, [r7, #0x128]
	cmp r5, #0
	beq _022F82D4
	ldrsb r1, [r7, #0x1c]
	mov r0, #0
	mov r2, #0xc
	strb r1, [r7, #0x15a]
	ldr r3, [r7, #0x20]
	ldr r1, [r7, #0x14]
	sub r1, r3, r1
	str r1, [r7, #0x15c]
	ldr sl, [r7, #0x20]
	ldr r3, [r7, #0x14]
	add r1, r7, #0x100
	add r3, sl, r3
	str r3, [r7, #0x164]
	ldr fp, [r7, #0x24]
	ldr sl, [r7, #0x18]
	ldr r3, _022F83E8 ; =ov11_02324CF8
	sub sl, fp, sl
	str sl, [r7, #0x160]
	ldr ip, [r7, #0x24]
	ldr fp, [r7, #0x18]
	smulbb sl, r6, r2
	add fp, ip, fp
	str fp, [r7, #0x168]
	str r0, [r7, #0x170]
	str r0, [r7, #0x16c]
	strh r6, [r1, #0x50]
	ldr r3, [r3]
	sub r1, r2, #0xd
	add r2, r3, sl
	str r1, [r2, #8]
	str r0, [r3, sl]
	str r0, [r2, #4]
	ldrsh r0, [r7, #2]
	cmp r0, #0x1e
	blt _022F82C8
	cmp r0, #0x2d
	bgt _022F82C8
	mov r0, #0x12
	bl RandInt
	add r1, r7, #0x100
	strh r0, [r1, #0x58]
	b _022F82D4
_022F82C8:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x58]
_022F82D4:
	mov r0, #1
	strb r0, [r7, #0x152]
	sub r1, r0, #2
	add r0, r7, #0x100
	strh r1, [r0, #0x54]
	cmp r5, #0
	beq _022F8354
	add r0, r7, #0x28
	add r1, r7, #0x30
	bl ov11_022F1F08
	mvn r6, #0
	strb r6, [r7, #0x175]
	add r0, r7, #0x100
	mov r1, #0x300
	strh r1, [r0, #0x76]
	mov r3, #1
	strh r3, [r0, #0x78]
	mov r2, #0
	ldr r1, _022F83FC ; =0x00000807
	str r2, [r7, #0x17c]
	strh r1, [r0, #0x80]
	strb r3, [r7, #0x174]
	strh r6, [r0, #0x82]
	strh r2, [r0, #0x84]
	ldrsh r1, [r7, #0xa]
	ldr r2, [r7, #0x128]
	add r0, r7, #0x18c
	bl ov11_022F5BBC
	ldr r1, _022F8400 ; =ACTOR_FUNCTION_TABLE
	mov r2, r7
	add r0, r7, #0x38
	bl InitScriptRoutine
_022F8354:
	ldr r0, [r7, #0x160]
	ldr r1, _022F8404 ; =ov11_023219E8
	str r0, [sp]
	ldrsh r2, [r7, #2]
	ldr r3, [r7, #0x15c]
	mov r0, #1
	bl Debug_Print
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ldrlssh r1, [r8, #8]
	addls r0, r7, #0x100
	strlsh r1, [r0, #0x24]
	bls _022F8398
	cmp r5, #0
	addne r0, r7, #0x100
	mvnne r1, #0
	strneh r1, [r0, #0x24]
_022F8398:
	cmp r5, #0
	beq _022F83CC
	ldrsh r0, [r4]
	cmp r0, #1
	bne _022F83CC
	mov r0, #0
	bl ov11_022EB2A4
	cmp r0, #0
	beq _022F83CC
	mov r2, sb
	mov r0, #0
	mov r1, #2
	bl ov11_022EB128
_022F83CC:
	mov r1, #1
	mov r0, sb
	strb r1, [r7, #4]
_022F83D8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F83E0: .word ENTITIES
_022F83E4: .word ov11_02321974
_022F83E8: .word ov11_02324CF8
_022F83EC: .word ov11_023219A4
_022F83F0: .word 0x03000743
_022F83F4: .word 0x03000002
_022F83F8: .word 0x03002358
_022F83FC: .word 0x00000807
_022F8400: .word ACTOR_FUNCTION_TABLE
_022F8404: .word ov11_023219E8
	arm_func_end ov11_022F7E78

	arm_func_start ov11_022F8408
ov11_022F8408: ; 0x022F8408
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8568 ; =ov11_02321A14
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F84D0
	ldr r0, _022F856C ; =ov11_02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	ldr fp, _022F8570 ; =ov11_02321A40
	add r5, r4, #1
	mov r6, #1
_022F8464:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F84B4
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F84B4
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F84B4
	mov r0, r8
	bl DeleteLiveActor
_022F84B4:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F8464
	b _022F8560
_022F84D0:
	ldr r0, _022F856C ; =ov11_02324CF8
	mvn r5, #1
	add r6, r5, #1
	ldr sl, [r0, #4]
	mov r4, r6
	mov r7, r6
	mov fp, #1
_022F84EC:
	ldrsh r3, [sl, #2]
	cmp r3, r7
	beq _022F8548
	ldrsb ip, [sl, #9]
	ldr r1, _022F8574 ; =ov11_02321A6C
	mov r0, fp
	mov r2, r8
	str ip, [sp]
	bl Debug_Print
	ldrsb r0, [sl, #9]
	cmp r0, r6
	beq _022F8534
	cmp sb, r5
	cmpne sb, r0
	bne _022F8548
	mov r0, r8
	bl DeleteLiveActor
	b _022F8548
_022F8534:
	ldrsh r0, [sl, #6]
	cmp r0, r4
	bne _022F8548
	mov r0, r8
	bl DeleteLiveActor
_022F8548:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F84EC
_022F8560:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8568: .word ov11_02321A14
_022F856C: .word ov11_02324CF8
_022F8570: .word ov11_02321A40
_022F8574: .word ov11_02321A6C
	arm_func_end ov11_022F8408

	arm_func_start DeleteLiveActor
DeleteLiveActor: ; 0x022F8578
	stmdb sp!, {r4, lr}
	ldr r1, _022F85B8 ; =ov11_02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldr r1, _022F85BC ; =ov11_02321A8C
	mov r0, #1
	bl Debug_Print
	add r0, r4, #0x18c
	bl ov11_022F5C3C
	add r0, r4, #0x38
	bl ov11_022DC934
	mvn r0, #0
	strh r0, [r4, #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F85B8: .word ov11_02324CF8
_022F85BC: .word ov11_02321A8C
	arm_func_end DeleteLiveActor

	arm_func_start ov11_022F85C0
ov11_022F85C0: ; 0x022F85C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov sb, r1
	ldr r1, _022F8720 ; =ov11_02321AA8
	mov r2, sl
	mov r3, sb
	mov r0, #1
	bl Debug_Print
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r8, #0
	bhi _022F8698
	ldr r0, _022F8724 ; =ov11_02324CF8
	mvn r5, #0
	ldr r7, [r0, #4]
	ldr fp, _022F8728 ; =ov11_02321A40
	sub r4, r5, #1
	mov r6, #1
_022F861C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F867C
	ldrsh r2, [r7, #6]
	mov r0, r6
	mov r1, fp
	str r2, [sp]
	ldrsb ip, [r7, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	ldrsh r0, [r7, #6]
	cmp sl, r0
	bne _022F867C
	cmp sb, r4
	ldrnesb r0, [r7, #8]
	cmpne sb, r0
	bne _022F867C
	mov r1, #0
	add r0, r7, #0x38
	bl ov11_022DCFC4
	strh r5, [r7, #6]
	add r0, r7, #0x100
	strh r5, [r0, #0x24]
_022F867C:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r7, r7, #0x250
	blt _022F861C
	b _022F8718
_022F8698:
	ldr r0, _022F8724 ; =ov11_02324CF8
	mvn r5, #0
	mov r7, #1
	ldr sl, [r0, #4]
	ldr r6, _022F8728 ; =ov11_02321A40
	sub r4, r5, #1
	mov fp, r7
_022F86B4:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8700
	ldrsh r2, [sl, #6]
	mov r0, r7
	mov r1, r6
	str r2, [sp]
	ldrsb ip, [sl, #8]
	mov r2, r8
	str ip, [sp, #4]
	bl Debug_Print
	cmp sb, r4
	ldrnesb r0, [sl, #9]
	cmpne sb, r0
	bne _022F8700
	mov r1, fp
	add r0, sl, #0x38
	bl ov11_022DCFC4
	strb r5, [sl, #9]
_022F8700:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add sl, sl, #0x250
	blt _022F86B4
_022F8718:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8720: .word ov11_02321AA8
_022F8724: .word ov11_02324CF8
_022F8728: .word ov11_02321A40
	arm_func_end ov11_022F85C0

	arm_func_start SetAttributeBitfieldLiveActor
SetAttributeBitfieldLiveActor: ; 0x022F872C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F87B4 ; =ov11_02324CF8
	mov r2, #0x250
	ldr r4, [r3, #4]
	mvn ip, #0
	smlabb r4, r0, r2, r4
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, ip
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r1, [r0, #0x50]
	cmp r1, #0
	bne _022F8774
	tst r5, #2
	beq _022F879C
	bl InitPartnerFollowData
	b _022F879C
_022F8774:
	tst r5, #2
	beq _022F879C
	mov r0, #0xc
	smulbb r1, r1, r0
	ldr r2, [r3]
	mov r0, #0
	add r3, r2, r1
	str ip, [r3, #8]
	str r0, [r2, r1]
	str r0, [r3, #4]
_022F879C:
	ldr r1, [r4, #0x128]
	add r0, r4, #0x18c
	orr r1, r1, r5
	str r1, [r4, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F87B4: .word ov11_02324CF8
	arm_func_end SetAttributeBitfieldLiveActor

	arm_func_start ResetAttributeBitfieldLiveActor
ResetAttributeBitfieldLiveActor: ; 0x022F87B8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8818 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	mov r5, r1
	cmp r0, r3
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x100
	ldrsh r0, [r0, #0x50]
	cmp r0, #0
	bne _022F87FC
	tst r5, #2
	beq _022F87FC
	bl InitPartnerFollowData
_022F87FC:
	ldr r1, [r4, #0x128]
	mvn r0, r5
	and r1, r1, r0
	add r0, r4, #0x18c
	str r1, [r4, #0x128]
	bl SetAnimDataFieldsWrapper
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8818: .word ov11_02324CF8
	arm_func_end ResetAttributeBitfieldLiveActor

	arm_func_start ov11_022F881C
ov11_022F881C: ; 0x022F881C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _022F8870 ; =ov11_02324CF8
	mov r2, #0x250
	ldr r3, [r3, #4]
	mov r5, r1
	smlabb r4, r0, r2, r3
	mov r0, r5
	bl ov11_022EA920
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	add r0, r4, #0x12c
	bl ov11_022EA990
	mov r0, #1
	strb r0, [r4, #0x152]
	sub r1, r0, #2
	add r0, r4, #0x100
	strh r1, [r0, #0x54]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_022F8870: .word ov11_02324CF8
	arm_func_end ov11_022F881C

	arm_func_start ov11_022F8874
ov11_022F8874: ; 0x022F8874
	ldr r2, _022F889C ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r1, r0, r1, r3
	ldrsh r0, [r1, #2]
	cmp r0, r2
	addne r0, r1, #0x38
	moveq r0, #0
	bx lr
	.align 2, 0
_022F889C: .word ov11_02324CF8
	arm_func_end ov11_022F8874

	arm_func_start ov11_022F88A0
ov11_022F88A0: ; 0x022F88A0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	add r0, sp, #0x10
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F890C
	ldr r0, _022F891C ; =ov11_02324CF8
	mov r5, #0
	ldr r4, [r0, #4]
	b _022F8904
_022F88D0:
	ldrsh r1, [r4, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F88F4
	add r0, r4, #0x38
	bl ov11_022DC958
	cmp r0, #0
	movne r0, #1
	bne _022F8910
_022F88F4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
	add r4, r4, #0x250
_022F8904:
	cmp r5, #0x18
	blt _022F88D0
_022F890C:
	mov r0, #0
_022F8910:
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F891C: .word ov11_02324CF8
	arm_func_end ov11_022F88A0

	arm_func_start ov11_022F8920
ov11_022F8920: ; 0x022F8920
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r3, _022F8988 ; =ov11_02324CF8
	mov r5, r2
	ldr ip, [r3, #4]
	mov r3, #0x250
	smlabb r4, r0, r3, ip
	str r5, [sp]
	mov r6, r1
	mov r2, r0
	ldrsh r3, [r4, #2]
	ldr r1, _022F898C ; =ov11_02321AD4
	mov r0, #1
	bl Debug_Print
	ldrsh r1, [r4, #2]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	beq _022F8980
	mov r1, r6
	mov r2, r5
	add r0, r4, #0x38
	bl ov11_022DCCEC
	mov r0, #1
_022F8980:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F8988: .word ov11_02324CF8
_022F898C: .word ov11_02321AD4
	arm_func_end ov11_022F8920

	arm_func_start ov11_022F8990
ov11_022F8990: ; 0x022F8990
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	add r0, sp, #0x10
	mov r4, r1
	bl sub_02065050
	ldrsh r1, [sp, #0x10]
	mvn r0, #0
	cmp r1, r0
	beq _022F8A0C
	ldr r0, _022F8A1C ; =ov11_02324CF8
	mov r6, #0
	ldr r5, [r0, #4]
	b _022F8A04
_022F89C4:
	ldrsh r1, [r5, #2]
	ldrsh r0, [sp, #0x10]
	cmp r1, r0
	bne _022F89F4
	add r0, r5, #0x38
	bl ov11_022DC958
	cmp r0, #0
	beq _022F89F4
	mov r1, r4
	add r0, r5, #0x38
	bl ov11_022DCA58
	b _022F8A10
_022F89F4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	add r5, r5, #0x250
_022F8A04:
	cmp r6, #0x18
	blt _022F89C4
_022F8A0C:
	mov r0, #1
_022F8A10:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_022F8A1C: .word ov11_02324CF8
	arm_func_end ov11_022F8990

	arm_func_start ov11_022F8A20
ov11_022F8A20: ; 0x022F8A20
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022F8AA0 ; =ov11_02324CF8
	mov r2, r0
	ldr r1, [r1, #4]
	mov r0, #0x250
	smlabb r4, r2, r0, r1
	ldrsh r3, [r4, #6]
	add r0, r4, #0x100
	ldr r1, _022F8AA4 ; =ov11_02321AFC
	str r3, [sp]
	ldrsh r3, [r0, #0x24]
	mov r0, #1
	str r3, [sp, #4]
	ldrsh r3, [r4, #2]
	bl Debug_Print
	ldrsh r0, [r4, #2]
	mvn r2, #0
	cmp r0, r2
	addne r1, r4, #0x100
	ldrnesh r1, [r1, #0x24]
	cmpne r1, r2
	moveq r0, #0
	beq _022F8A98
	bl SetActorTalkSub
	add r1, r4, #0x100
	ldrsh r0, [r4, #6]
	ldrsh r1, [r1, #0x24]
	bl ov11_022F74A0
	mov r0, #1
_022F8A98:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8AA0: .word ov11_02324CF8
_022F8AA4: .word ov11_02321AFC
	arm_func_end ov11_022F8A20

	arm_func_start ov11_022F8AA8
ov11_022F8AA8: ; 0x022F8AA8
	stmdb sp!, {r3, lr}
	add r2, r0, #0x100
	mov r3, #0x300
	strh r3, [r2, #0x76]
	mov lr, #1
	strh lr, [r2, #0x78]
	mov r3, #0
	str r3, [r0, #0x17c]
	ldrsh ip, [r2, #0x80]
	ldr r3, _022F8AF0 ; =0x00000807
	cmp ip, r3
	strneh r3, [r2, #0x80]
	strneb lr, [r0, #0x174]
	mov r0, r1
	mov r1, #0
	bl ov11_022F7188
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F8AF0: .word 0x00000807
	arm_func_end ov11_022F8AA8

	arm_func_start ov11_022F8AF4
ov11_022F8AF4: ; 0x022F8AF4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8B48
	ldr r2, _022F8B50 ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8B48
	bl SetActorTalkMain
	mov r0, r4
	bl ov11_022F8A20
	cmp r0, #0
	beq _022F8B48
	bl KeyWaitInit
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8B48:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8B50: .word ov11_02324CF8
	arm_func_end ov11_022F8AF4

	arm_func_start ov11_022F8B54
ov11_022F8B54: ; 0x022F8B54
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r0, #0
	cmpge r4, #0
	blt _022F8BA8
	ldr r2, _022F8BB0 ; =ov11_02324CF8
	mov r1, #0x250
	ldr r3, [r2, #4]
	mvn r2, #0
	smlabb r0, r0, r1, r3
	ldrsh r0, [r0, #2]
	cmp r0, r2
	beq _022F8BA8
	bl SetActorTalkMain
	mov r0, r4
	bl ov11_022FC83C
	cmp r0, #0
	beq _022F8BA8
	bl KeyWaitInit
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8BA8:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8BB0: .word ov11_02324CF8
	arm_func_end ov11_022F8B54

	arm_func_start ov11_022F8BB4
ov11_022F8BB4: ; 0x022F8BB4
	stmdb sp!, {r4, lr}
	cmp r0, #0
	cmpge r1, #0
	blt _022F8C0C
	ldr r3, _022F8C14 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r4, r0, r2, ip
	ldrsh r0, [r4, #2]
	cmp r0, r3
	beq _022F8C0C
	mov r0, r1
	bl ov11_022FED74
	cmp r0, #0
	beq _022F8C0C
	bl KeyWaitInit
	ldrsh r0, [r4, #2]
	mvn r1, #0
	bl SetActorTalkMainAndActorTalkSub
	mov r0, #1
	ldmia sp!, {r4, pc}
_022F8C0C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F8C14: .word ov11_02324CF8
	arm_func_end ov11_022F8BB4

	arm_func_start ov11_022F8C18
ov11_022F8C18: ; 0x022F8C18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8D64
	ldr r1, _022F8E5C ; =ov11_02321B40
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8E60 ; =ov11_02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	ldr fp, _022F8E64 ; =ENTITIES
	mov r7, r8
	add r5, r4, #1
_022F8C74:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8D48
	ldrsh r0, [r6, #6]
	cmp r0, sl
	bne _022F8D48
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne r0, sb
	bne _022F8D48
	ldr r1, _022F8E68 ; =ov11_02321B80
	mov r0, #1
	mov r2, r7
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r6, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	bne _022F8D04
	ldrsh r1, [r6, #2]
	mov r0, #0xc
	smulbb r0, r1, r0
	ldrsh r0, [fp, r0]
	add r1, sp, #4
	cmp r0, #1
	cmpne r0, #2
	mov r0, #0
	beq _022F8CFC
	mov r2, #0xc
	bl ov11_022DCAB0
	b _022F8D04
_022F8CFC:
	mov r2, #0xe
	bl ov11_022DCAB0
_022F8D04:
	mov r0, #0
	strh r0, [sp, #0x1c]
	add r0, r6, #0x38
	add r1, sp, #4
	bl ov11_022DC9C8
	cmp r0, #0
	bne _022F8D48
	add r0, r6, #0x28
	add r1, r6, #0x30
	bl ov11_022F1F08
	add r0, r6, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r6, #0x174]
_022F8D48:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8C74
	b _022F8E50
_022F8D64:
	ldr r1, _022F8E6C ; =ov11_02321B94
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8E60 ; =ov11_02324CF8
	mvn r4, #1
	ldr r7, [r0, #4]
	mov r6, r8
	add r5, r4, #1
	mov fp, #1
_022F8D8C:
	ldrsh r3, [r7, #2]
	cmp r3, r5
	beq _022F8E38
	cmp sb, r4
	ldrnesb r0, [r7, #9]
	cmpne r0, sb
	bne _022F8E38
	ldr r1, _022F8E68 ; =ov11_02321B80
	mov r0, #1
	mov r2, r6
	bl Debug_Print
	str sb, [sp]
	ldrsh r2, [r7, #2]
	add r0, sp, #4
	mov r1, #3
	mov r3, sl
	bl ov11_022E5EFC
	cmp r0, #0
	beq _022F8DFC
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	strh fp, [sp, #0x1c]
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
	b _022F8E38
_022F8DFC:
	cmp sl, #3
	bne _022F8E38
	mov r0, #0
	add r1, sp, #4
	mov r2, #6
	bl ov11_022DCAB0
	mov r0, #1
	strh r0, [sp, #0x1c]
	add r0, r7, #0x38
	mov r1, #0
	add r2, sp, #4
	bl ov11_022DCCEC
	orr r8, r8, r0
	mov r0, #1
	strb r0, [r7, #0x174]
_022F8E38:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8D8C
_022F8E50:
	mov r0, r8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8E5C: .word ov11_02321B40
_022F8E60: .word ov11_02324CF8
_022F8E64: .word ENTITIES
_022F8E68: .word ov11_02321B80
_022F8E6C: .word ov11_02321B94
	arm_func_end ov11_022F8C18

	arm_func_start ov11_022F8E70
ov11_022F8E70: ; 0x022F8E70
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	sub r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov sb, r1
	mov r8, #0
	mov r0, #1
	bhi _022F8F28
	ldr r1, _022F8FB4 ; =ov11_02321BD4
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8FB8 ; =ov11_02324CF8
	mvn r4, #1
	ldr r6, [r0, #4]
	mov r7, r8
	add r5, r4, #1
	mov fp, #1
_022F8EC8:
	ldrsh r3, [r6, #2]
	cmp r3, r5
	beq _022F8F0C
	ldrsh r0, [r6, #6]
	cmp sl, r0
	bne _022F8F0C
	cmp sb, r4
	ldrnesb r0, [r6, #8]
	cmpne sb, r0
	bne _022F8F0C
	ldr r1, _022F8FBC ; =ov11_02321B80
	mov r0, fp
	mov r2, r7
	bl Debug_Print
	add r0, r6, #0x38
	bl ov11_022DCAE0
	orr r8, r8, r0
_022F8F0C:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add r6, r6, #0x250
	blt _022F8EC8
	b _022F8FAC
_022F8F28:
	ldr r1, _022F8FC0 ; =ov11_02321C14
	mov r2, sl
	mov r3, sb
	bl Debug_Print
	ldr r0, _022F8FB8 ; =ov11_02324CF8
	mvn r5, #0
	ldr sl, [r0, #4]
	ldr fp, _022F8FBC ; =ov11_02321B80
	mov r7, r8
	sub r4, r5, #1
	mov r6, #1
_022F8F54:
	ldrsh r3, [sl, #2]
	cmp r3, r5
	beq _022F8F94
	ldrsb r0, [sl, #9]
	cmp r0, r5
	cmpne sb, r4
	cmpne sb, r0
	bne _022F8F94
	mov r0, r6
	mov r1, fp
	mov r2, r7
	bl Debug_Print
	add r0, sl, #0x38
	bl ov11_022DD080
	strb r5, [sl, #9]
	orr r8, r8, r0
_022F8F94:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #0x18
	add sl, sl, #0x250
	blt _022F8F54
_022F8FAC:
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F8FB4: .word ov11_02321BD4
_022F8FB8: .word ov11_02324CF8
_022F8FBC: .word ov11_02321B80
_022F8FC0: .word ov11_02321C14
	arm_func_end ov11_022F8E70

	arm_func_start ov11_022F8FC4
ov11_022F8FC4: ; 0x022F8FC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _022F9014 ; =ov11_02324CF8
	mov r4, #0
	ldr r7, [r0, #4]
	mov r6, r4
	mvn r5, #0
_022F8FDC:
	ldrsh r0, [r7, #2]
	cmp r0, r5
	beq _022F8FF4
	add r0, r7, #0x38
	bl ov11_022DCB00
	orr r4, r4, r0
_022F8FF4:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, asr #0x10
	cmp r6, #0x18
	add r7, r7, #0x250
	blt _022F8FDC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022F9014: .word ov11_02324CF8
	arm_func_end ov11_022F8FC4

	arm_func_start UnlockActorRoutines
UnlockActorRoutines: ; 0x022F9018
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _022F9070 ; =ov11_02324CF8
	mov r5, #0
	ldr r4, [r1, #4]
	mov r6, r0
	mov r8, r5
	mvn r7, #0
_022F9034:
	ldrsh r0, [r4, #2]
	cmp r0, r7
	beq _022F9050
	mov r1, r6
	add r0, r4, #0x38
	bl UnlockRoutine
	orr r5, r5, r0
_022F9050:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	cmp r8, #0x18
	add r4, r4, #0x250
	blt _022F9034
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022F9070: .word ov11_02324CF8
	arm_func_end UnlockActorRoutines

	arm_func_start ov11_022F9074
ov11_022F9074: ; 0x022F9074
	stmdb sp!, {r3, lr}
	ldr r1, _022F90B0 ; =ov11_02324CF8
	mvn r0, #0
	ldr r2, [r1, #4]
	ldrsh r1, [r2, #2]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r2, #0x12c
	bl ov11_022EA9E4
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_022F90B0: .word ov11_02324CF8
	arm_func_end ov11_022F9074

	arm_func_start ov11_022F90B4
ov11_022F90B4: ; 0x022F90B4
	ldr r3, _022F90F0 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	ldrne r2, [ip, #0xc]
	ldrne r0, [ip, #0x10]
	strne r2, [r1]
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F90F0: .word ov11_02324CF8
	arm_func_end ov11_022F90B4

	arm_func_start ov11_022F90F4
ov11_022F90F4: ; 0x022F90F4
	ldr r3, _022F9144 ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb ip, r0, r2, ip
	ldrsh r0, [ip, #2]
	cmp r0, r3
	moveq r0, #0
	streq r0, [r1]
	beq _022F9138
	ldr r2, [ip, #0x15c]
	ldr r0, [ip, #0x14]
	add r0, r2, r0
	str r0, [r1]
	ldr r2, [ip, #0x160]
	ldr r0, [ip, #0x18]
	add r0, r2, r0
_022F9138:
	str r0, [r1, #4]
	ldrsh r0, [ip, #2]
	bx lr
	.align 2, 0
_022F9144: .word ov11_02324CF8
	arm_func_end ov11_022F90F4

	arm_func_start ov11_022F9148
ov11_022F9148: ; 0x022F9148
	ldr r3, _022F917C ; =ov11_02324CF8
	mov r2, #0x250
	ldr ip, [r3, #4]
	mvn r3, #0
	smlabb r2, r0, r2, ip
	ldrsh r0, [r2, #2]
	cmp r0, r3
	streqb r3, [r1]
	addne r0, r2, #0x100
	ldrnesb r0, [r0, #0x5a]
	strneb r0, [r1]
	ldrsh r0, [r2, #2]
	bx lr
	.align 2, 0
_022F917C: .word ov11_02324CF8
	arm_func_end ov11_022F9148

	arm_func_start GetCollidingActorId
GetCollidingActorId: ; 0x022F9180
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _022F9218 ; =ov11_02324CF8
	mov ip, #0
	ldr lr, [r4, #4]
	mvn r4, #0
	b _022F9208
_022F9198:
	cmp ip, r0
	ldrnesh r5, [lr, #2]
	cmpne r5, r4
	beq _022F91F8
	ldr r5, [lr, #0x128]
	tst r5, r1
	beq _022F91F8
	ldr r6, [lr, #0x15c]
	ldr r5, [r3]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x164]
	ldr r5, [r2]
	cmp r6, r5
	ble _022F91F8
	ldr r6, [lr, #0x160]
	ldr r5, [r3, #4]
	cmp r6, r5
	bge _022F91F8
	ldr r6, [lr, #0x168]
	ldr r5, [r2, #4]
	cmp r6, r5
	movgt r0, ip
	ldmgtia sp!, {r4, r5, r6, pc}
_022F91F8:
	add ip, ip, #1
	mov ip, ip, lsl #0x10
	mov ip, ip, asr #0x10
	add lr, lr, #0x250
_022F9208:
	cmp ip, #0x18
	blt _022F9198
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_022F9218: .word ov11_02324CF8
	arm_func_end GetCollidingActorId

	arm_func_start ov11_022F921C
ov11_022F921C: ; 0x022F921C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	mov r6, r0
	add r0, r6, #0x38
	mov r5, r1
	mov r4, r2
	bl ov11_022DC958
	cmp r0, #0
	bne _022F93B8
	ldr r1, _022F93C4 ; =ov11_02321684
	add r0, sp, #0x10
	ldr r2, [r1, #0x114]
	ldr r1, [r1, #0x110]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r3, [r5]
	add r1, sp, #0
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add ip, r3, r2, lsr #24
	mov r2, ip, asr #8
	str r2, [sp, #0x10]
	ldr r3, [r5, #4]
	mov r2, r3, asr #2
	add r2, r3, r2, lsr #29
	mov r3, r2, asr #3
	mov r2, r3, asr #7
	add lr, r3, r2, lsr #24
	mov r2, lr, asr #8
	str r2, [sp, #0x14]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	sub r8, r3, #1
	sub r7, r2, #1
	mov r2, r8, asr #2
	mov r3, r7, asr #2
	add r2, r8, r2, lsr #29
	add r3, r7, r3, lsr #29
	mov sb, r2, asr #3
	mov r8, r3, asr #3
	mov r2, sb, asr #7
	add r2, sb, r2, lsr #24
	mov r3, r2, asr #8
	mov r7, r8, asr #7
	add r2, r8, r7, lsr #24
	mov r2, r2, asr #8
	sub ip, r3, ip, asr #8
	sub r7, r2, lr, asr #8
	add ip, ip, #1
	add r7, r7, #1
	str ip, [sp]
	str r7, [sp, #4]
	ldr r7, [r6, #0x128]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	tst r7, #0x40
	beq _022F9318
	bl ov11_022F204C
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F9318:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F933C
	add r0, sp, #0x10
	add r1, sp, #0
	bl ov11_022F20CC
	cmp r0, #0
	movne r0, #0x40
	bne _022F93BC
_022F933C:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9368
	ldrsh r0, [r6]
	mov r2, r5
	mov r3, r4
	mov r1, #0x100
	bl GetCollidingActorId
	cmp r0, #0
	movge r0, #0x100
	bge _022F93BC
_022F9368:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F9390
	mov r1, r5
	mov r2, r4
	mov r0, #0x100
	bl GetCollidingObjectId
	cmp r0, #0
	movge r0, #0x200
	bge _022F93BC
_022F9390:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F93B8
	mov r1, r5
	mov r2, r4
	mov r0, #0x1000
	bl GetCollidingEventId
	cmp r0, #0
	movge r0, #0x400
	bge _022F93BC
_022F93B8:
	mov r0, #0
_022F93BC:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_022F93C4: .word ov11_02321684
	arm_func_end ov11_022F921C

	arm_func_start ChangeActorAnimation
ChangeActorAnimation: ; 0x022F93C8
	stmdb sp!, {r4, lr}
	and r2, r1, #0x700
	mov r2, r2, lsl #0x10
	and r3, r1, #0xff
	mov r4, r0
	tst r1, #0x800
	mov r2, r2, lsr #0x10
	beq _022F9400
	add r0, r4, #0x100
	mov r1, #0x400
	strh r1, [r0, #0x80]
	mov r0, #1
	strb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
_022F9400:
	cmp r3, #0
	addne r0, r4, #0x100
	strneh r3, [r0, #0x78]
	cmp r2, #0
	addne r0, r4, #0x100
	strneh r2, [r0, #0x76]
	add r2, r4, #0x100
	ldrh r3, [r2, #0x78]
	cmp r3, #1
	bne _022F9450
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	ldrle r0, _022F9520 ; =0x00000807
	b _022F9498
_022F9450:
	cmp r3, #2
	bne _022F948C
	cmp r1, #0x1000
	moveq r0, #4
	streq r0, [r4, #0x17c]
	moveq r0, #0x800
	beq _022F9498
	ldr r0, [r4, #0x17c]
	cmp r0, #0
	movgt r0, #0x800
	bgt _022F9498
	ldrsh r0, [r4, #0xa]
	ldrsh r1, [r2, #0x80]
	bl GetIdleAnimationType
	b _022F9498
_022F948C:
	ldr r0, _022F9524 ; =SETANIMATION_TABLE
	mov r1, r3, lsl #1
	ldrsh r0, [r0, r1]
_022F9498:
	tst r0, #0x700
	bne _022F94F0
	add r1, r4, #0x100
	ldrh r1, [r1, #0x76]
	cmp r1, #0x200
	bgt _022F94C8
	bge _022F94E4
	cmp r1, #0x100
	orreq r0, r0, #0x300
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94C8:
	cmp r1, #0x300
	ble _022F94F0
	cmp r1, #0x400
	orreq r0, r0, #0x200
	moveq r0, r0, lsl #0x10
	moveq r0, r0, asr #0x10
	b _022F94F0
_022F94E4:
	orr r0, r0, #0x100
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_022F94F0:
	add r1, r4, #0x100
	ldrsh r2, [r1, #0x80]
	cmp r2, r0
	strneh r0, [r1, #0x80]
	movne r0, #1
	strneb r0, [r4, #0x174]
	bne _022F9518
	tst r2, #0x1000
	movne r0, #1
	strneb r0, [r4, #0x174]
_022F9518:
	ldrb r0, [r4, #0x174]
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9520: .word 0x00000807
_022F9524: .word SETANIMATION_TABLE
	arm_func_end ChangeActorAnimation

	arm_func_start SetPositionLiveActor
SetPositionLiveActor: ; 0x022F9528
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _022F9634 ; =ov11_02321684
	mov r4, r0
	ldr r0, [r2, #0x6c]
	ldr r3, [r2, #0x68]
	str r0, [sp, #0xc]
	str r3, [sp, #8]
	ldr ip, [r1]
	ldr r3, [r4, #0x14]
	add r0, r4, #0x38
	sub r3, ip, r3
	str r3, [sp, #8]
	ldr ip, [r1, #4]
	ldr r3, [r4, #0x18]
	sub r3, ip, r3
	str r3, [sp, #0xc]
	ldr r3, [r2, #0xd8]
	ldr r2, [r2, #0xdc]
	str r3, [sp]
	str r2, [sp, #4]
	ldr r3, [r1]
	ldr r2, [r4, #0x14]
	add r2, r3, r2
	str r2, [sp]
	ldr r2, [r1, #4]
	ldr r1, [r4, #0x18]
	add r1, r2, r1
	str r1, [sp, #4]
	bl ov11_022DC958
	cmp r0, #0
	bne _022F9608
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022F95E8
	ldr r1, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022F95E8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022F95F0
_022F95E8:
	mov r0, #0x40
	b _022F962C
_022F95F0:
	add r1, sp, #8
	add r2, sp, #0
	mov r0, r4
	bl ov11_022F921C
	cmp r0, #0
	bne _022F962C
_022F9608:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #0
	str r2, [r4, #0x15c]
	str r1, [r4, #0x160]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	str r2, [r4, #0x164]
	str r1, [r4, #0x168]
_022F962C:
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_022F9634: .word ov11_02321684
	arm_func_end SetPositionLiveActor

	arm_func_start ov11_022F9638
ov11_022F9638: ; 0x022F9638
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x2c
	ldr r2, _022F99C4 ; =ov11_02321684
	mov r6, r0
	ldr r0, [r2, #0xc4]
	ldr r3, [r2, #0xc0]
	str r0, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r3, [r6, #0x15c]
	ldr r0, [r1]
	add r0, r3, r0
	str r0, [sp, #0x24]
	ldr r4, [r6, #0x160]
	ldr r3, [r1, #4]
	add r3, r4, r3
	str r3, [sp, #0x28]
	ldr r3, [r2, #0x40]
	ldr r2, [r2, #0x44]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r3, [r6, #0x164]
	ldr r2, [r1]
	add r3, r3, r2
	str r3, [sp, #0x1c]
	ldr r2, [r6, #0x168]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [sp, #0x20]
	ldr r1, [r6, #0x28]
	cmp r0, r1
	bge _022F96CC
	str r1, [sp, #0x24]
	ldr r1, [r6, #0x28]
	ldr r0, [r6, #0xc]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	b _022F96E8
_022F96CC:
	ldr r1, [r6, #0x30]
	cmp r3, r1
	ldrge r0, [r6, #0xc]
	subge r0, r1, r0
	strge r0, [sp, #0x24]
	ldrge r0, [r6, #0x30]
	strge r0, [sp, #0x1c]
_022F96E8:
	ldr r1, [r6, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bge _022F9710
	str r1, [sp, #0x28]
	ldr r1, [r6, #0x2c]
	ldr r0, [r6, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x20]
	b _022F9730
_022F9710:
	ldr r1, [r6, #0x34]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	ldrge r0, [r6, #0x10]
	subge r0, r1, r0
	strge r0, [sp, #0x28]
	ldrge r0, [r6, #0x34]
	strge r0, [sp, #0x20]
_022F9730:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	sub r5, r1, #1
	sub r4, r0, #1
	ldr lr, [sp, #0x24]
	ldr ip, [sp, #0x28]
	mov r2, r5, asr #2
	mov r3, r4, asr #2
	mov r0, lr, asr #2
	add r2, r5, r2, lsr #29
	mov r1, ip, asr #2
	add r3, r4, r3, lsr #29
	add r0, lr, r0, lsr #29
	mov r5, r2, asr #3
	add r1, ip, r1, lsr #29
	mov r4, r3, asr #3
	mov lr, r0, asr #3
	mov r2, r5, asr #7
	mov ip, r1, asr #3
	mov r3, r4, asr #7
	mov r0, lr, asr #7
	add r2, r5, r2, lsr #24
	mov r1, ip, asr #7
	add r3, r4, r3, lsr #24
	add r0, lr, r0, lsr #24
	mov r5, r2, asr #8
	mov r4, r3, asr #8
	add r1, ip, r1, lsr #24
	mov lr, r0, asr #8
	mov ip, r1, asr #8
	sub r3, r5, r0, asr #8
	sub r2, r4, r1, asr #8
	add r1, r3, #1
	add r0, r2, #1
	str r1, [sp, #0x10]
	str lr, [sp]
	str ip, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x128]
	str r5, [sp, #8]
	tst r0, #0x40
	str r4, [sp, #0xc]
	add r0, sp, #0
	add r1, sp, #0x10
	beq _022F97F4
	bl ov11_022F204C
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F97F4:
	ldr r0, [r6, #0x128]
	tst r0, #0x80
	beq _022F9818
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov11_022F20CC
	cmp r0, #0
	movne r5, #1
	bne _022F9910
_022F9818:
	ldr r0, [r6, #0x128]
	tst r0, #0x100
	beq _022F9878
	ldrsh r0, [r6]
	add r2, sp, #0x24
	add r3, sp, #0x1c
	mov r1, #0x1100
	bl GetCollidingActorId
	movs r1, r0
	bmi _022F9878
	ldr r2, _022F99C8 ; =ov11_02324CF8
	mov r0, #0x250
	ldr r2, [r2, #4]
	smlabb r0, r1, r0, r2
	ldr r0, [r0, #0x128]
	tst r0, #0x1000
	beq _022F9870
	ldrsh r0, [r6]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F9870:
	mov r5, #1
	b _022F9910
_022F9878:
	ldr r0, [r6, #0x128]
	tst r0, #0x200
	beq _022F98D0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1100
	bl GetCollidingObjectId
	movs r4, r0
	bmi _022F98D0
	add r1, sp, #0x18
	bl ov11_022FCCA0
	ldr r0, [sp, #0x18]
	tst r0, #0x1000
	beq _022F98C8
	ldrsh r0, [r6]
	mov r1, r4
	bl ov11_022F8B54
	cmp r0, #0
	movne r5, #2
	bne _022F9910
_022F98C8:
	mov r5, #1
	b _022F9910
_022F98D0:
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F990C
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x1000
	bl GetCollidingEventId
	movs r1, r0
	bmi _022F990C
	ldrsh r0, [r6]
	bl ov11_022F8BB4
	cmp r0, #0
	movne r5, #2
	moveq r5, #1
	b _022F9910
_022F990C:
	mov r5, #0
_022F9910:
	cmp r5, #0
	bne _022F99B8
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	str r1, [r6, #0x15c]
	str r0, [r6, #0x160]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	str r1, [r6, #0x164]
	str r0, [r6, #0x168]
	ldr r0, [r6, #0x128]
	tst r0, #0x400
	beq _022F99B0
	add r1, sp, #0x24
	add r2, sp, #0x1c
	mov r0, #0x800
	bl GetCollidingEventId
	movs r4, r0
	bmi _022F999C
	ldrb r0, [r6, #0x152]
	cmp r0, #0
	add r0, r6, #0x100
	strneh r4, [r0, #0x54]
	bne _022F99A8
	ldrsh r0, [r0, #0x54]
	cmp r0, r4
	beq _022F99A8
	ldrsh r0, [r6]
	mov r1, r4
	bl ov11_022F8BB4
	cmp r0, #0
	addne r0, r6, #0x100
	strneh r4, [r0, #0x54]
	movne r5, #2
	b _022F99A8
_022F999C:
	add r0, r6, #0x100
	mvn r1, #0
	strh r1, [r0, #0x54]
_022F99A8:
	mov r0, #0
	strb r0, [r6, #0x152]
_022F99B0:
	mov r0, r5
	b _022F99BC
_022F99B8:
	mov r0, r5
_022F99BC:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_022F99C4: .word ov11_02321684
_022F99C8: .word ov11_02324CF8
	arm_func_end ov11_022F9638

	arm_func_start ov11_022F99CC
ov11_022F99CC: ; 0x022F99CC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x28
	ldmia r3, {r4, sb}
	ldr r3, [sp, #0x48]
	str r4, [sp, #0x20]
	str sb, [sp, #0x24]
	ldr lr, [r3]
	ldr r3, [r3, #4]
	sub r8, lr, #1
	sub r7, r3, #1
	mov ip, r8, asr #0xa
	mov r6, r7, asr #0xa
	mov sl, r4, asr #0xa
	mov r5, sb, asr #0xa
	add r8, r8, ip, lsr #21
	add r6, r7, r6, lsr #21
	mov ip, r8, asr #0xb
	add r5, sb, r5, lsr #21
	add r4, r4, sl, lsr #21
	mov r7, r6, asr #0xb
	sub r6, ip, r4, asr #11
	mov sb, r4, asr #0xb
	sub sl, r7, r5, asr #11
	mov r8, r5, asr #0xb
	add r6, r6, #1
	add sl, sl, #1
	str r3, [sp, #0x1c]
	mov r4, r2
	mov r5, r1
	str lr, [sp, #0x18]
	str sb, [sp, #0x10]
	str r8, [sp, #0x14]
	str r6, [sp]
	str sl, [sp, #4]
	ldrsh r0, [r0]
	add r2, sp, #0x20
	add r3, sp, #0x18
	mov r1, #0x2000
	str ip, [sp, #8]
	str r7, [sp, #0xc]
	bl GetCollidingActorId
	cmp r0, #0
	blt _022F9A88
	cmp r5, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9A88:
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl GetCollidingObjectId
	cmp r0, #0
	blt _022F9AB0
	cmp r4, r0
	moveq r0, #3
	movne r0, #0
	b _022F9ACC
_022F9AB0:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022F9ACC:
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov11_022F99CC

	arm_func_start ov11_022F9AD4
ov11_022F9AD4: ; 0x022F9AD4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov r6, r1
	mov sl, r0
	mov sb, r2
	add r1, sp, #0x2c
	mov r0, r6
	mov r2, #0x100
	mov r8, r3
	bl sub_02005494
	ldr r1, _022F9F54 ; =ov11_02321684
	ldr r7, [sp, #0x2c]
	ldr r0, [r1, #0x9c]
	ldr r2, [r1, #0x98]
	str r0, [sp, #0x28]
	str r2, [sp, #0x24]
	ldr r0, [sl, #0x15c]
	ldr r5, [sp, #0x30]
	add r0, r0, r7
	str r0, [sp, #0x24]
	ldr r2, [sl, #0x160]
	add r3, sp, #0x24
	add r2, r2, r5
	str r2, [sp, #0x28]
	ldr fp, [r1, #0x90]
	ldr r2, [r1, #0x94]
	add r4, sp, #0x1c
	str r2, [sp, #0x20]
	str fp, [sp, #0x1c]
	ldr fp, [sl, #0x164]
	mov r0, sl
	add r7, fp, r7
	str r7, [sp, #0x1c]
	ldr r7, [sl, #0x168]
	mov r1, sb
	add r5, r7, r5
	str r5, [sp, #0x20]
	mov r2, r8
	str r4, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9B8C
	ldr r0, _022F9F58 ; =ov11_02321C54
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9B8C:
	ldr r1, [sl, #0xc]
	ldr r3, _022F9F54 ; =ov11_02321684
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x2c]
	add r1, r1, #0x200
	mul r4, r2, r1
	ldr r2, [sl, #0x10]
	mov r1, r4, asr #7
	add r2, r2, r2, lsr #31
	mov r2, r2, asr #1
	add r1, r4, r1, lsr #24
	mov ip, r1, asr #8
	ldr r7, [r3, #0x80]
	ldr r5, [r3, #0x84]
	ldr r3, [sp, #0x30]
	add r2, r2, #0x200
	mul r4, r3, r2
	mov r2, r4, asr #7
	add r2, r4, r2, lsr #24
	ldr r4, _022F9F5C ; =ov11_023217F8
	mov fp, r2, asr #8
	str fp, [sp, #0x18]
	str r7, [sp, #0xc]
	str r5, [sp, #0x10]
	ldr r7, [sl, #0x15c]
	ldr r5, [sl, #0x14]
	ldr r3, _022F9F60 ; =ov11_02321818
	add r5, r7, r5
	add r1, r5, r1, asr #8
	sub r5, r1, #0x300
	str r5, [sp, #0xc]
	ldr r7, [sl, #0x160]
	ldr r1, [sl, #0x18]
	add r5, r5, #0x600
	add r1, r7, r1
	add r1, r1, r2, asr #8
	sub r2, r1, #0x300
	add r1, r2, #0x600
	str r5, [sp, #4]
	ldr lr, _022F9F64 ; =ov11_02321838
	str ip, [sp, #0x14]
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	ldr r4, [r4, r6, lsl #2]
	ldr r5, [r3, r6, lsl #2]
	ldr r6, [lr, r6, lsl #2]
	add fp, sp, #4
	mov r7, #0x200
	b _022F9D20
_022F9C54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9C94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9C94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9CA8
_022F9C94:
	ldr r0, _022F9F68 ; =ov11_02321C68
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9CA8:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	add r3, sp, #0xc
	str fp, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9CDC
	ldr r0, _022F9F6C ; =ov11_02321C88
	mov r1, r7
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9CDC:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x30]
	ldr r2, [sp, #0x10]
	str ip, [sp, #0xc]
	ldr ip, [sp, #8]
	str r1, [sp, #4]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	cmp r0, #6
	beq _022F9D28
	add r7, r7, #0x100
_022F9D20:
	cmp r7, r4
	blt _022F9C54
_022F9D28:
	cmp r0, #6
	beq _022F9D44
	ldr r0, _022F9F70 ; =ov11_02321CA0
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9D44:
	add r8, sp, #4
	mvn r4, #0
	b _022F9E1C
_022F9D50:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9D90
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9D90
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9DA4
_022F9D90:
	ldr r0, _022F9F74 ; =ov11_02321CBC
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9DA4:
	mov r0, sl
	mov r1, sb
	mov r2, r4
	add r3, sp, #0xc
	str r8, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9DD8
	ldr r0, _022F9F78 ; =ov11_02321CDC
	mov r1, r7
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9DD8:
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #4]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x30]
	ldr ip, [sp, #0x10]
	ldr r3, [sp, #8]
	str r2, [sp, #0xc]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x10]
	str fp, [sp, #4]
	str r1, [sp, #8]
	cmp r0, #6
	bne _022F9E24
	add r7, r7, #0x100
_022F9E1C:
	cmp r7, r5
	blt _022F9D50
_022F9E24:
	cmp r0, #6
	bne _022F9E40
	ldr r0, _022F9F7C ; =ov11_02321CF4
	mov r1, r7
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9E40:
	mov r8, #0
	add r7, sp, #4
	mvn r5, #0
	add r4, sp, #0xc
	b _022F9F34
_022F9E54:
	ldr r1, [sp, #0xc]
	ldr r0, [sl, #0x28]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #4]
	ldr r0, [sl, #0x30]
	cmp r1, r0
	bge _022F9E94
	ldr r1, [sp, #0x10]
	ldr r0, [sl, #0x2c]
	cmp r1, r0
	blt _022F9E94
	ldr r1, [sp, #8]
	ldr r0, [sl, #0x34]
	cmp r1, r0
	blt _022F9EA8
_022F9E94:
	ldr r0, _022F9F80 ; =ov11_02321D10
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9EA8:
	mov r0, sl
	mov r1, sb
	mov r2, r5
	mov r3, r4
	str r7, [sp]
	bl ov11_022F99CC
	cmp r0, #3
	bne _022F9EDC
	ldr r0, _022F9F84 ; =ov11_02321D30
	mov r1, r8
	bl Debug_Print0
	mov r0, #1
	b _022F9F4C
_022F9EDC:
	cmp r0, #6
	bne _022F9EF8
	ldr r0, _022F9F88 ; =ov11_02321D48
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
	b _022F9F4C
_022F9EF8:
	ldr r2, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x30]
	ldr r3, [sp, #0x10]
	ldr r1, [sp, #8]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r2, [sp, #4]
	str r1, [sp, #8]
	add r8, r8, #0x100
_022F9F34:
	cmp r8, r6
	blt _022F9E54
	ldr r0, _022F9F8C ; =ov11_02321D6C
	mov r1, r8
	bl Debug_Print0
	mov r0, #0
_022F9F4C:
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022F9F54: .word ov11_02321684
_022F9F58: .word ov11_02321C54
_022F9F5C: .word ov11_023217F8
_022F9F60: .word ov11_02321818
_022F9F64: .word ov11_02321838
_022F9F68: .word ov11_02321C68
_022F9F6C: .word ov11_02321C88
_022F9F70: .word ov11_02321CA0
_022F9F74: .word ov11_02321CBC
_022F9F78: .word ov11_02321CDC
_022F9F7C: .word ov11_02321CF4
_022F9F80: .word ov11_02321D10
_022F9F84: .word ov11_02321D30
_022F9F88: .word ov11_02321D48
_022F9F8C: .word ov11_02321D6C
	arm_func_end ov11_022F9AD4

	arm_func_start ov11_022F9F90
ov11_022F9F90: ; 0x022F9F90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	movs r5, r1
	mov r6, r0
	mov r4, r2
	bmi _022FA028
	add r1, sp, #0x10
	mov r0, r5
	bl ov11_022F90F4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mov r7, r0
	mvn r1, #0
	cmp r7, r1
	beq _022FA028
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	mov r0, r6
	mov r1, r7
	mov r2, r5
	mvn r3, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA028:
	cmp r4, #0
	blt _022FA0B0
	add r1, sp, #0x10
	mov r0, r4
	bl ov11_022FCCC4
	ldr r1, [r6, #0x15c]
	ldr r0, [r6, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	sub r0, r2, r0
	str r0, [sp, #8]
	ldr r1, [r6, #0x160]
	ldr r0, [r6, #0x18]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	sub r1, r2, r0
	add r0, sp, #8
	str r1, [sp, #0xc]
	bl sub_020055C8
	mvn r1, #0
	cmp r0, r1
	beq _022FA0B0
	add r1, sp, #0
	mov r2, #0x100
	bl sub_02005494
	add r0, r6, #0x100
	ldrsb r1, [r0, #0x5a]
	mov r0, r6
	mov r3, r4
	mvn r2, #0
	bl ov11_022F9AD4
	cmp r0, #0
	movne r0, #1
	bne _022FA0B4
_022FA0B0:
	mov r0, #0
_022FA0B4:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov11_022F9F90

	arm_func_start ov11_022FA0BC
ov11_022FA0BC: ; 0x022FA0BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	ldr r4, [r2]
	ldr r2, [r2, #4]
	mov r5, r4, asr #0xa
	str r4, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr lr, [r3]
	ldr ip, [r3, #4]
	sub sb, lr, #1
	sub r8, ip, #1
	mov r3, sb, asr #0xa
	mov r7, r8, asr #0xa
	mov r6, r2, asr #0xa
	add r3, sb, r3, lsr #21
	add r5, r4, r5, lsr #21
	mov r4, r1
	mov r3, r3, asr #0xb
	add r7, r8, r7, lsr #21
	add r6, r2, r6, lsr #21
	mov r2, r7, asr #0xb
	sub r8, r3, r5, asr #11
	mov r1, r5, asr #0xb
	mov sb, r6, asr #0xb
	sub r7, r2, r6, asr #11
	add r8, r8, #1
	add r6, r7, #1
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r5, r0
	str lr, [sp, #0x18]
	str ip, [sp, #0x1c]
	str r1, [sp, #0x10]
	str sb, [sp, #0x14]
	str r8, [sp]
	str r6, [sp, #4]
	tst r4, #0x100
	add r2, sp, #0x20
	add r3, sp, #0x18
	beq _022FA184
	ldrsh r0, [r5]
	mov r1, #0x2000
	bl GetCollidingActorId
	movs r1, r0
	bmi _022FA184
	ldrsh r0, [r5]
	bl ov11_022F8AF4
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA184:
	tst r4, #0x200
	beq _022FA1B8
	add r1, sp, #0x20
	add r2, sp, #0x18
	mov r0, #0x2000
	bl GetCollidingObjectId
	movs r1, r0
	bmi _022FA1B8
	ldrsh r0, [r5]
	bl ov11_022F8B54
	cmp r0, #0
	movne r0, #3
	bne _022FA1D4
_022FA1B8:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, #0x10
	bl ov11_022F214C
	cmp r0, #0
	movne r0, #6
	moveq r0, #0
_022FA1D4:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov11_022FA0BC

	arm_func_start ov11_022FA1DC
ov11_022FA1DC: ; 0x022FA1DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	mov r4, r0
	add r0, r4, #0x100
	mov r5, #0x300
	mvn r7, #0
	strh r5, [r0, #0x76]
	mov r5, #1
	strh r5, [r0, #0x78]
	str r1, [r4, #0x14c]
	cmp r2, r7
	beq _022FA21C
	cmp r3, #0
	mov r5, r2
	strneb r2, [r4, #0x15a]
	b _022FA220
_022FA21C:
	ldrsb r5, [r0, #0x5a]
_022FA220:
	cmp r1, #0x13
	addls pc, pc, r1, lsl #2
	b _022FA924
_022FA22C: ; jump table
	b _022FA924 ; case 0
	b _022FA2A4 ; case 1
	b _022FA27C ; case 2
	b _022FA2CC ; case 3
	b _022FA2CC ; case 4
	b _022FA2CC ; case 5
	b _022FA2CC ; case 6
	b _022FA2CC ; case 7
	b _022FA2CC ; case 8
	b _022FA47C ; case 9
	b _022FA4C8 ; case 10
	b _022FA4A4 ; case 11
	b _022FA924 ; case 12
	b _022FA924 ; case 13
	b _022FA924 ; case 14
	b _022FA924 ; case 15
	b _022FA924 ; case 16
	b _022FA924 ; case 17
	b _022FA8F0 ; case 18
	b _022FA914 ; case 19
_022FA27C:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA2A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	mov r7, #0x300
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA2CC:
	mvn r0, #0
	cmp r2, r0
	beq _022FA450
	mov sb, #4
	str sb, [r4, #0x17c]
	cmp r1, #8
	mov r8, #0
	addls pc, pc, r1, lsl #2
	b _022FA334
_022FA2F0: ; jump table
	b _022FA334 ; case 0
	b _022FA334 ; case 1
	b _022FA334 ; case 2
	b _022FA314 ; case 3
	b _022FA320 ; case 4
	b _022FA32C ; case 5
	b _022FA314 ; case 6
	b _022FA320 ; case 7
	b _022FA32C ; case 8
_022FA314:
	mov r7, #0x900
	mov sb, #1
	b _022FA340
_022FA320:
	mov r7, #0x800
	mov sb, #2
	b _022FA340
_022FA32C:
	mov r7, #0xa00
	b _022FA340
_022FA334:
	mov sb, #0
	ldr r7, _022FA9C4 ; =0x00000807
	str sb, [r4, #0x17c]
_022FA340:
	mov r0, r2
	add r1, sp, #0x50
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =ov11_02321684
	mov sl, #0
	ldr r6, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldr r1, [r0, #0x20]
	ldr r5, [r0, #0x24]
	str r6, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp]
	str r5, [sp, #4]
	add fp, sp, #0x50
	b _022FA408
_022FA380:
	mov r0, r4
	mov r1, fp
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	bne _022FA3A4
	add r0, r4, #0x12c
	bl ov11_022EAF60
	b _022FA410
_022FA3A4:
	cmp r8, #1
	bne _022FA404
	ldr r1, [sp, #0x54]
	add r0, r4, #0x12c
	str r6, [sp, #0x48]
	str r1, [sp, #0x4c]
	bl ov11_022EAF60
	mov r0, r4
	add r1, sp, #0x48
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
	cmp r8, #1
	bne _022FA404
	ldr r2, [sp, #0x50]
	mov r0, r4
	add r1, sp, #0x40
	str r5, [sp, #0x44]
	str r2, [sp, #0x40]
	bl ov11_022F9638
	mov r8, r0
	cmp r8, #2
	beq _022FA410
_022FA404:
	add sl, sl, #1
_022FA408:
	cmp sl, sb
	blt _022FA380
_022FA410:
	cmp r8, #2
	ldr r0, [r4, #0x128]
	bne _022FA438
	mvn r7, #0
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA438:
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA450:
	mov r0, #0
	str r0, [r4, #0x14c]
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
	b _022FA93C
_022FA47C:
	ldrsh r0, [r4, #2]
	mov r1, #0xa
	bl SetActorTalkMainAndActorTalkSub
	mov r0, r4
	mov r1, #0xa
	bl ov11_022F8AA8
	mov r0, #0
	mov r1, #0xb
	bl ov11_022F881C
	b _022FA93C
_022FA4A4:
	mov r0, #0
	str r0, [r4, #0x17c]
	ldr r0, [r4, #0x128]
	ldr r7, _022FA9C4 ; =0x00000807
	tst r0, #0x20
	beq _022FA4C8
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FA4C8:
	add r1, sp, #0x10
	mov r0, r5
	mov r2, #0x100
	bl sub_02005494
	ldr r0, _022FA9C8 ; =ov11_02321684
	ldr r1, [sp, #0x10]
	ldr r2, [r0, #0x5c]
	ldr r3, [r0, #0x58]
	str r2, [sp, #0x1c]
	str r3, [sp, #0x18]
	ldr r2, [r4, #0x15c]
	ldr r6, [sp, #0x14]
	add r2, r2, r1
	str r2, [sp, #0x18]
	ldr r3, [r4, #0x160]
	add r2, sp, #0x18
	add r3, r3, r6
	str r3, [sp, #0x1c]
	ldr r8, [r0, #0x50]
	ldr r0, [r0, #0x54]
	add r3, sp, #0x20
	str r0, [sp, #0x24]
	str r8, [sp, #0x20]
	ldr r8, [r4, #0x164]
	mov r0, r4
	add r1, r8, r1
	str r1, [sp, #0x20]
	ldr r8, [r4, #0x168]
	mov r1, #0x300
	add r6, r8, r6
	str r6, [sp, #0x24]
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA55C
	ldr r0, _022FA9CC ; =ov11_02321C54
	bl Debug_Print0
	b _022FA93C
_022FA55C:
	ldr r1, [r4, #0xc]
	ldr sl, _022FA9D0 ; =ov11_023217F8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	ldr r2, [sp, #0x10]
	add r1, r1, #0x200
	mul r8, r2, r1
	ldr r2, [r4, #0x10]
	mov r1, r8, asr #7
	add r2, r2, r2, lsr #31
	ldr r3, _022FA9C8 ; =ov11_02321684
	mov r6, r2, asr #1
	add r8, r8, r1, lsr #24
	ldr sb, [sp, #0x14]
	ldr r2, [r3, #0x160]
	ldr r1, [r3, #0x164]
	add r3, r6, #0x200
	mul r6, sb, r3
	mov r3, r6, asr #7
	add sb, r6, r3, lsr #24
	mov r6, r8, asr #8
	mov r3, sb, asr #8
	str r2, [sp, #0x30]
	str r1, [sp, #0x34]
	ldr r2, [r4, #0x15c]
	ldr r1, [r4, #0x14]
	str r6, [sp, #0x28]
	add r1, r2, r1
	add r1, r1, r8, asr #8
	sub r2, r1, #0x300
	str r2, [sp, #0x30]
	ldr fp, _022FA9D4 ; =ov11_02321838
	ldr r6, [r4, #0x160]
	ldr r1, [r4, #0x18]
	add r2, r2, #0x600
	add r1, r6, r1
	add r1, r1, sb, asr #8
	sub r6, r1, #0x300
	ldr ip, _022FA9D8 ; =ov11_02321818
	add r1, r6, #0x600
	str r6, [sp, #0x34]
	ldr r8, [fp, r5, lsl #2]
	str r3, [sp, #0x2c]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	ldr sl, [sl, r5, lsl #2]
	ldr sb, [ip, r5, lsl #2]
	add r5, sp, #0x30
	add fp, sp, #0x38
	mov r6, #0x200
	b _022FA6E8
_022FA628:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA668
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA668
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA678
_022FA668:
	ldr r0, _022FA9DC ; =ov11_02321C68
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA678:
	mov r0, r4
	mov r1, #0x300
	mov r2, r5
	mov r3, fp
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA6A4
	ldr r0, _022FA9E0 ; =ov11_02321C88
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA6A4:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add ip, r2, r3
	add r1, r1, r3
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x34]
	str ip, [sp, #0x30]
	ldr ip, [sp, #0x3c]
	str r1, [sp, #0x38]
	add r2, r2, r3
	add r1, ip, r3
	str r2, [sp, #0x34]
	str r1, [sp, #0x3c]
	cmp r0, #6
	beq _022FA6F0
	add r6, r6, #0x100
_022FA6E8:
	cmp r6, sl
	blt _022FA628
_022FA6F0:
	cmp r0, #6
	beq _022FA708
	ldr r0, _022FA9E4 ; =ov11_02321CA0
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA708:
	mov sl, #0x100
	add r5, sp, #0x30
	b _022FA7D4
_022FA714:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA754
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA754
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA764
_022FA754:
	ldr r0, _022FA9E8 ; =ov11_02321CBC
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA764:
	mov r0, r4
	mov r1, sl
	mov r2, r5
	add r3, sp, #0x38
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA790
	ldr r0, _022FA9EC ; =ov11_02321CDC
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA790:
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r2, r2, r3
	add fp, r1, r3
	ldr r1, [sp, #0x14]
	ldr ip, [sp, #0x34]
	ldr r3, [sp, #0x3c]
	str r2, [sp, #0x30]
	add r2, ip, r1
	add r1, r3, r1
	str r2, [sp, #0x34]
	str fp, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r0, #6
	bne _022FA7DC
	add r6, r6, #0x100
_022FA7D4:
	cmp r6, sb
	blt _022FA714
_022FA7DC:
	cmp r0, #6
	bne _022FA7F4
	ldr r0, _022FA9F0 ; =ov11_02321CF4
	mov r1, r6
	bl Debug_Print0
	b _022FA93C
_022FA7F4:
	mov sl, #0
	mov sb, #0x100
	add r6, sp, #0x30
	add r5, sp, #0x38
	b _022FA8D8
_022FA808:
	ldr r1, [sp, #0x30]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x38]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	bge _022FA848
	ldr r1, [sp, #0x34]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _022FA848
	ldr r1, [sp, #0x3c]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _022FA858
_022FA848:
	ldr r0, _022FA9F4 ; =ov11_02321D10
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA858:
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r5
	bl ov11_022FA0BC
	cmp r0, #3
	bne _022FA884
	ldr r0, _022FA9F8 ; =ov11_02321D30
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA884:
	cmp r0, #6
	bne _022FA89C
	ldr r0, _022FA9FC ; =ov11_02321D48
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA89C:
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x38]
	add r0, r0, r2
	add r2, r1, r2
	ldr fp, [sp, #0x14]
	ldr r3, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	add r3, r3, fp
	add r1, r1, fp
	str r0, [sp, #0x30]
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	add sl, sl, #0x100
_022FA8D8:
	cmp sl, r8
	blt _022FA808
	ldr r0, _022FAA00 ; =ov11_02321D6C
	mov r1, sl
	bl Debug_Print0
	b _022FA93C
_022FA8F0:
	bl KeyWaitInit
	mov r0, #4
	bl PlaySeVolumeWrapper
	bl sub_020676AC
	bl ov11_02300D5C
	add r0, r4, #0x12c
	mov r1, #6
	bl ov11_022EA990
	b _022FA93C
_022FA914:
	mov r0, r4
	mov r1, #0x2ac
	bl ov11_022F8AA8
	b _022FA93C
_022FA924:
	ldr r0, [r4, #0x128]
	tst r0, #0x20
	beq _022FA93C
	ldrsh r0, [r4]
	mov r1, #0x1000000
	bl SetAttributeBitfieldLiveActor
_022FA93C:
	mvn r0, #0
	cmp r7, r0
	addne r2, r4, #0x100
	ldrnesh r0, [r2, #0x80]
	cmpne r7, r0
	beq _022FA97C
	mov r0, #0
	strb r0, [r4, #0x174]
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	strh r7, [r2, #0x80]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
	b _022FA9BC
_022FA97C:
	ldrb r0, [r4, #0x174]
	cmp r0, #0
	addeq r0, r4, #0x100
	ldreqsb r1, [r0, #0x75]
	ldreqsb r0, [r0, #0x5a]
	cmpeq r1, r0
	beq _022FA9BC
	mov r0, #0
	strb r0, [r4, #0x174]
	add r2, r4, #0x100
	ldrsb r1, [r2, #0x5a]
	add r0, r4, #0x18c
	strb r1, [r4, #0x175]
	ldrsh r1, [r2, #0x80]
	ldrsb r2, [r2, #0x75]
	bl SetAnimDataFields2
_022FA9BC:
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022FA9C4: .word 0x00000807
_022FA9C8: .word ov11_02321684
_022FA9CC: .word ov11_02321C54
_022FA9D0: .word ov11_023217F8
_022FA9D4: .word ov11_02321838
_022FA9D8: .word ov11_02321818
_022FA9DC: .word ov11_02321C68
_022FA9E0: .word ov11_02321C88
_022FA9E4: .word ov11_02321CA0
_022FA9E8: .word ov11_02321CBC
_022FA9EC: .word ov11_02321CDC
_022FA9F0: .word ov11_02321CF4
_022FA9F4: .word ov11_02321D10
_022FA9F8: .word ov11_02321D30
_022FA9FC: .word ov11_02321D48
_022FAA00: .word ov11_02321D6C
	arm_func_end ov11_022FA1DC

	arm_func_start GetIdLiveActor
GetIdLiveActor: ; 0x022FAA04
	ldrsh r0, [r0]
	bx lr
	arm_func_end GetIdLiveActor

	arm_func_start GetCollisionBoxLiveActor
GetCollisionBoxLiveActor: ; 0x022FAA0C
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x10]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxLiveActor

	arm_func_start SetPositionInitialLiveActor
SetPositionInitialLiveActor: ; 0x022FAA20
	cmp r1, #0
	beq _022FAA6C
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	sub r2, r3, r2
	str r2, [r0, #0x15c]
	ldr r3, [r1]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r0, #0x164]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x18]
	sub r2, r3, r2
	str r2, [r0, #0x160]
	ldr r2, [r1, #4]
	ldr r1, [r0, #0x18]
	add r1, r2, r1
	str r1, [r0, #0x168]
	bx lr
_022FAA6C:
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	mov r2, #0
	sub r1, r3, r1
	str r1, [r0, #0x15c]
	ldr r3, [r0, #0x20]
	ldr r1, [r0, #0x14]
	add r1, r3, r1
	str r1, [r0, #0x164]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r1, r0, #0x100
	sub r3, ip, r3
	str r3, [r0, #0x160]
	ldr ip, [r0, #0x24]
	ldr r3, [r0, #0x18]
	add r3, ip, r3
	str r3, [r0, #0x168]
	str r2, [r0, #0x170]
	str r2, [r0, #0x16c]
	ldrsb r2, [r1, #0x5a]
	ldrsb r1, [r0, #0x1c]
	cmp r2, r1
	movne r1, #1
	strneb r1, [r0, #0x174]
	ldrsb r1, [r0, #0x1c]
	strb r1, [r0, #0x15a]
	bx lr
	arm_func_end SetPositionInitialLiveActor

	arm_func_start SetMovementRangeLiveActor
SetMovementRangeLiveActor: ; 0x022FAADC
	ldr r3, [r1]
	ldr r1, [r1, #4]
	str r3, [r0, #0x28]
	str r1, [r0, #0x2c]
	ldr r3, [r2]
	ldr r1, [r2, #4]
	str r3, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end SetMovementRangeLiveActor

	arm_func_start GetCollisionBoxCenterLiveActor
GetCollisionBoxCenterLiveActor: ; 0x022FAB00
	ldr r3, [r0, #0x15c]
	ldr r2, [r0, #0x14]
	add r2, r3, r2
	str r2, [r1]
	ldr r2, [r0, #0x160]
	ldr r0, [r0, #0x18]
	add r0, r2, r0
	str r0, [r1, #4]
	bx lr
	arm_func_end GetCollisionBoxCenterLiveActor

	arm_func_start SetPositionLiveActorVeneer
SetPositionLiveActorVeneer: ; 0x022FAB24
	ldr ip, _022FAB2C ; =SetPositionLiveActor
	bx ip
	.align 2, 0
_022FAB2C: .word SetPositionLiveActor
	arm_func_end SetPositionLiveActorVeneer

	arm_func_start GetHeightLiveActor
GetHeightLiveActor: ; 0x022FAB30
	ldr r3, [r0, #0x16c]
	str r3, [r1]
	ldr r0, [r0, #0x170]
	str r0, [r2]
	bx lr
	arm_func_end GetHeightLiveActor
