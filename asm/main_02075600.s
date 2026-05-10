	.include "asm/macros.inc"
	.include "main_02075600.inc"

	.text

	arm_func_start sub_02075600
sub_02075600: ; 0x02075600
	ldr r0, _0207561C ; =_022B9208
	mov r2, #0
	strb r2, [r0, #4]
	mov r1, #1
	str r1, [r0]
	strb r2, [r0, #8]
	bx lr
	.align 2, 0
_0207561C: .word _022B9208
	arm_func_end sub_02075600

	arm_func_start sub_02075620
sub_02075620: ; 0x02075620
	stmdb sp!, {r4, lr}
	ldr r0, _020756E4 ; =_022B9208
	ldr r0, [r0, #0x1cc]
	cmp r0, #0
	beq _02075648
_02075634:
	ldr r4, [r0, #0x500]
	bl DseMem_Free
	mov r0, r4
	cmp r4, #0
	bne _02075634
_02075648:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1cc]
	ldr r0, [r0, #0xec]
	cmp r0, #0
	beq _02075664
	bl DseMem_Free
_02075664:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0xec]
	ldr r0, [r0, #0x1b8]
	cmp r0, #0
	beq _02075680
	bl DseMem_Free
_02075680:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1b8]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0207569C
	bl sub_0206FD88
_0207569C:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x24]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _020756B8
	bl sub_0206FD88
_020756B8:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _020756D4
	bl sub_0206FD88
_020756D4:
	ldr r0, _020756E4 ; =_022B9208
	mov r1, #0
	str r1, [r0, #0x1c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020756E4: .word _022B9208
	arm_func_end sub_02075620

	arm_func_start sub_020756E8
sub_020756E8: ; 0x020756E8
	stmdb sp!, {r3, lr}
	ldr r0, _0207571C ; =_022B9208
	ldrsb r0, [r0, #4]
	cmp r0, #0
	mvneq r0, #0x59
	ldmeqia sp!, {r3, pc}
	bl sub_0206F808
	bl sub_0206FDE0
	bl sub_02075620
	ldr r1, _0207571C ; =_022B9208
	mov r0, #0
	strb r0, [r1, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0207571C: .word _022B9208
	arm_func_end sub_020756E8

	arm_func_start CRYPTO_RC4Init
CRYPTO_RC4Init: ; 0x02075720
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r3, #0
	strb r3, [r0]
	cmp r2, #0x10
	strb r3, [r0, #1]
	movhi r2, #0x10
	add r0, r0, #4
_02075740:
	strb r3, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _02075740
	mov r6, #0
	mov r7, r6
	mov r4, r6
	mov r3, r6
	and ip, r2, #0xff
_02075764:
	ldrb r5, [r0, r4]
	ldrb lr, [r1, r7]
	add r2, r7, #1
	and r7, r2, #0xff
	add r2, r5, lr
	add r2, r6, r2
	and r6, r2, #0xff
	ldrb r2, [r0, r6]
	add lr, r0, r4
	add r4, r4, #1
	strb r2, [lr]
	cmp r7, ip
	moveq r7, r3
	cmp r4, #0x100
	strb r5, [r0, r6]
	blt _02075764
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CRYPTO_RC4Init

	arm_func_start Crypto_RC4Encrypt
Crypto_RC4Encrypt: ; 0x020757B0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	ldrb r7, [r0]
	ldrb r6, [r0, #1]
	add r0, r0, #4
	mov lr, #0x1000000
	add r7, lr, r7, lsl #24
	mov r6, r6, lsl #0x18
	ldrb sb, [r0, r7, lsr #24]
	subs r2, r2, #1
	bmi _02075810
_020757D8:
	add r6, r6, sb, lsl #24
	subs r2, r2, #1
	ldrb r8, [r0, r6, lsr #24]
	ldrb r5, [r1], #1
	strb r8, [r0, r7, lsr #24]
	strb sb, [r0, r6, lsr #24]
	add r4, sb, r8
	and r4, r4, #0xff
	add r7, r7, lr
	ldrb r4, [r0, r4]
	ldrb sb, [r0, r7, lsr #24]
	eor r5, r5, r4
	strb r5, [r3], #1
	bge _020757D8
_02075810:
	sub r7, r7, lr
	mov r7, r7, lsr #0x18
	mov r6, r6, lsr #0x18
	strb r7, [r0, #-4]
	strb r6, [r0, #-3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end Crypto_RC4Encrypt

